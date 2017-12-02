//
//  ShadowView+BlurProcess.swift
//  ShadowView
//
//  Created by Pierre Perrin on 26/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

extension ShadowView{
    
    internal func addImageView(){
        
        guard shadowImageView == nil else {
            return
        }
        
        let imageView = UIImageView()
        imageView.frame.size = frame.size.scaled(by: shadowScale)
        imageView.center = CGPoint(x:bounds.midX,y:bounds.midY)
        imageView.layer.masksToBounds = false
        shadowImageView = imageView
        insertSubview(imageView,at:0)
    }
    
    
    
    public func updateShadow(){
        
        self.shadowImageView.image = nil
     //   DispatchQueue.global(qos: DispatchQoS.QoSClass.utility).async { [weak self] in
            self.createLayerImage()
      //  }
    }
    
    private func createLayerImage(){
        
        self.convertToImage { (image) in
            
            let containerLayer = CALayer()
            let imageSize = image.size
            containerLayer.frame = CGRect(origin: .zero, size: imageSize.scaled(by:self.scaleImageConstant))
            containerLayer.backgroundColor = UIColor.clear.cgColor
            let blurImageLayer = CALayer()
            blurImageLayer.frame = CGRect(origin: .zero,size: imageSize)
            blurImageLayer.position = CGPoint(x:containerLayer.bounds.midX,y:containerLayer.bounds.midY)
            blurImageLayer.contents = image.applyBlurWithRadius(0, tintColor:self.shadowColor, saturationDeltaFactor: self.shadowSaturation)?.cgImage
            
            blurImageLayer.masksToBounds = false
            containerLayer.addSublayer(blurImageLayer)
            
            let containerImage = containerLayer.asImage
            
            
            let resizeImageConstant :CGFloat = self.highPerformanceBlur ? 0.3 : 1
            guard let resizedContainerImage = containerImage.resized(withPercentage: resizeImageConstant),
                let blurredImage = resizedContainerImage.applyBlur(blurRadius: self.blurRadius)
                else {
                    return
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.layer.masksToBounds = false
                self?.shadowImageView?.image = blurredImage
            }
        }
        
    }
}
