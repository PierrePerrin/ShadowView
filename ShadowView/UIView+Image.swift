//
//  UIView+ColorShadow.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

extension UIView{
    
    ///Returns a UIImage copy of the view
    internal var asImage : UIImage{
        return layer.asImage
    }
}

extension CALayer{
    
    ///Returns a UIImage copy of the layer
    internal var asImage : UIImage{
        UIGraphicsBeginImageContext(frame.size)
        render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let cgImage = image?.cgImage {
            return UIImage(cgImage: cgImage)
        } else {
            return UIImage()
        }
    }
}
