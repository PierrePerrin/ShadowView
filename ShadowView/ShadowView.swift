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
    
    @IBInspectable public var shadowColor: UIColor?{
        get{
            return shadowTintColor
        }set{
            shadowTintColor = newValue
        }
    }
    
    @IBInspectable public var shadowOffset : CGSize = .zero{
        didSet{
            layoutSubviews()
        }
    }
    
    @IBInspectable public var shadowRadius : CGFloat{
        set{
            blurRadius = newValue
            updateShadow()
        }
        get{
            return blurRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: Float{
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
