//
//  ShadowImage.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    internal var blurRadius :CGFloat = 5.0
    var shadowImageView : UIImageView!
    let scaleImageConstant :CGFloat = 3
    var correctShadowScale : CGFloat{
        return shadowScale + scaleImageConstant - 1
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addImageView()
    }
    
    @IBInspectable var shadowScale : CGFloat = 1{
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowSaturation : CGFloat = 1{
        didSet{
            updateShadow()
        }
    }
    private var shadowTintColor : UIColor?
    override var shadowColor: UIColor?{
        get{
            return shadowTintColor
        }set{
            shadowTintColor = newValue
        }
    }
    
    override public var shadowOffset : CGSize{
        didSet{
            layoutSubviews()
        }
    }
    
    override public var shadowRadius : CGFloat{
        set{
            blurRadius = newValue
            updateShadow()
        }
        get{
            return blurRadius
        }
    }
    
    override var shadowOpacity: Float{
        set{
            shadowImageView.alpha = CGFloat(newValue)
        }
        get{
            return Float(shadowImageView.alpha)
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        updateShadow()
    }
    
    //Reload the image if the view changed.
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowImageView.frame.size = frame.size.scaled(by: correctShadowScale)
        shadowImageView.center = CGPoint(x:bounds.midX + shadowOffset.width,y:bounds.midY + shadowOffset.height)
        
    }
    
}
