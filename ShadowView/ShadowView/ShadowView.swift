//
//  ShadowImage.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    lazy var blurOperationQueue : OperationQueue = {
        let operationQueue = OperationQueue.init()
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.qualityOfService = .userInteractive
        return operationQueue
    }()
    internal var blurWork : DispatchWorkItem?
    internal var blurRadius :CGFloat = 5.0
    var shadowImageView : UIImageView!
    let scaleImageConstant :CGFloat = 3
    var correctShadowScale : CGFloat{
        return self.shadowScale + scaleImageConstant - 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addImageView()
    }
    
    @IBInspectable var shadowScale : CGFloat = 1{
        didSet{
            self.layoutSubviews()
        }
    }
    
    @IBInspectable var shadowSaturation : CGFloat = 1{
        didSet{
            self.updateShadow()
        }
    }
    private var shadowTintColor : UIColor?
    override var shadowColor: UIColor?{
        get{
            return shadowTintColor
        }set{
            self.shadowTintColor = newValue
        }
    }
    
    override public var shadowOffset : CGSize{
        didSet{
            self.layoutSubviews()
        }
    }
    
    override public var shadowRadius : CGFloat{
        set{
            self.blurRadius = newValue
            self.updateShadow()
        }
        get{
            return blurRadius
        }
    }
    
    override var shadowOpacity: Float{
        set{
            self.shadowImageView.alpha = CGFloat(newValue)
        }
        get{
            return Float(self.shadowImageView.alpha)
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.updateShadow()
    }
    
    //Reload the image if the view changed.
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.shadowImageView.frame.size = self.frame.size.scaled(by: correctShadowScale)
        self.shadowImageView.center = CGPoint(x:self.bounds.midX + self.shadowOffset.width,y:self.bounds.midY + self.shadowOffset.height)
        
    }
    
}
