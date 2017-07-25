//
//  UIView+Shadow.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

@IBDesignable class ShadowView: UIView{
    
    @IBInspectable public var shadowRadius : CGFloat{
        set{
            self.layer.shadowRadius = newValue
            layer.masksToBounds = newValue < 0
        }
        get{
            return self.layer.shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffset : CGSize{
        set{
            self.layer.shadowOffset = newValue
        }
        get{
            return self.layer.shadowOffset
        }
    }
    
    @IBInspectable public var shadowColor : UIColor?{
        set{
            self.layer.shadowColor = newValue?.cgColor
        }
        get{
            return UIColor.init(cgColor: self.layer.shadowColor ?? UIColor().cgColor)
        }
    }
    
    @IBInspectable public var shadowOpacity : Float{
        set{
            self.layer.shadowOpacity = newValue
            layer.masksToBounds = newValue < 0
        }
        get{
            return self.layer.shadowOpacity
        }
    }
    
    @IBInspectable var shadowPath : CGPath?{
        set{
            self.layer.shadowPath = newValue
        }
        get{
            return self.layer.shadowPath
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
