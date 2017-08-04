//
//  UIView+Shadow.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

extension UIView{
    
    @IBInspectable public var shadowRadius : CGFloat{
        set{
            layer.shadowRadius = newValue
            layer.masksToBounds = newValue < 0
        }
        get{
            return layer.shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffset : CGSize{
        set{
            layer.shadowOffset = newValue
        }
        get{
            return layer.shadowOffset
        }
    }
    
    
    @IBInspectable public var shadowColor : UIColor?{
        set{
            layer.shadowColor = newValue?.cgColor
        }
        get{
            return UIColor(cgColor: layer.shadowColor ?? UIColor().cgColor)
        }
    }
    
    @IBInspectable public var shadowOpacity : Float{
        set{
            layer.shadowOpacity = newValue
            layer.masksToBounds = newValue < 0
        }
        get{
            return layer.shadowOpacity
        }
    }
    
    @IBInspectable public var shadowPath : CGPath?{
        set{
            layer.shadowPath = newValue
        }
        get{
            return layer.shadowPath
        }
    }
}
