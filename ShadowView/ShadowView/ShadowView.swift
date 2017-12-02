//
//  ShadowImage.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

public class ShadowView: UIView {
    
    internal var blurRadius :CGFloat = 5.0
    public var shadowImageView : UIImageView!
    internal let scaleImageConstant :CGFloat = 3
    
    public var highPerformanceBlur = true
    
    public var correctShadowScale : CGFloat{
        return shadowScale + scaleImageConstant - 1
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addImageView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addImageView()
    }
    
    @IBInspectable public var shadowScale : CGFloat = 1{
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowSaturation : CGFloat = 1{
        didSet{
            updateShadow()
        }
    }
    private var shadowTintColor : UIColor?
    public override var shadowColor: UIColor?{
        get{
            return shadowTintColor
        }set{
            shadowTintColor = newValue
        }
    }
    
    public override var shadowOffset : CGSize{
        didSet{
            layoutSubviews()
        }
    }
    
    public override var shadowRadius : CGFloat{
        set{
            blurRadius = newValue
            updateShadow()
        }
        get{
            return blurRadius
        }
    }
    
    public override var shadowOpacity: Float{
        set{
            shadowImageView.alpha = CGFloat(newValue)
        }
        get{
            return Float(shadowImageView.alpha)
        }
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        updateShadow()
    }
    
    //Reload the image if the view changed.
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowImageView.frame.size = frame.size.scaled(by: correctShadowScale)
        shadowImageView.center = CGPoint(x:bounds.midX + shadowOffset.width,y:bounds.midY + shadowOffset.height)
        
    }
    
}
