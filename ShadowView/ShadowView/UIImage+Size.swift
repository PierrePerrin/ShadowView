//
//  UIImage+Blur.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIImage{
    
    /// Resize the image to a centain percentage
    ///
    /// - Parameter percentage: Percentage value
    /// - Returns: UIImage(Optional)
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = size.scaled(by: percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    func applyBlur(blurRadius:CGFloat) -> UIImage?{
        
        guard let ciImage = CIImage(image: self) else {return nil}
        
        if let filter = CIFilter(name: "CIGaussianBlur") {
            
            filter.setValue(ciImage, forKey: kCIInputImageKey)
            filter.setValue(blurRadius, forKey: kCIInputRadiusKey)
            let eaglContext =
                EAGLContext(api: EAGLRenderingAPI.openGLES3)
                    ??  EAGLContext(api: EAGLRenderingAPI.openGLES2)
                    ??  EAGLContext(api: EAGLRenderingAPI.openGLES1)
            
            let context = eaglContext == nil ?
                CIContext(options: nil)
                : CIContext(eaglContext: eaglContext!)
            
            if let output = filter.outputImage,
                let cgimg = context.createCGImage(output, from: ciImage.extent)
            {
                return UIImage(cgImage: cgimg)
            }
        }
        
        return nil
    }
}


extension CGSize {
    
    /// Generates a new size that is this size scaled by a cerntain percentage
    ///
    /// - Parameter percentage: the percentage to scale to
    /// - Returns: a new CGSize instance by scaling self by the given percentage
    func scaled(by percentage: CGFloat) -> CGSize {
        return CGSize(width: width * percentage, height: height * percentage)
    }
    
}
