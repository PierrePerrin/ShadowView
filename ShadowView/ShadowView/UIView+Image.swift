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
    var asImage : UIImage{
        return layer.asImage
    }
}

extension CALayer{
    
    ///Returns a UIImage copy of the layer
    var asImage : UIImage{
        UIGraphicsBeginImageContext(self.frame.size)
        self.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let cgImage = image?.cgImage {
            return UIImage.init(cgImage: cgImage)
        } else {
            return UIImage.init()
        }
    }
}
