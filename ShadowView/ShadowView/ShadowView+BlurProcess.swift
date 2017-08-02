//
//  ShadowView+BlurProcess.swift
//  ShadowView
//
//  Created by Pierre Perrin on 26/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

extension ShadowView{
    
    func addImageView(){
        
        guard shadowImageView == nil else {
            return
        }
        
        let imageView = UIImageView()
        imageView.frame.size = self.frame.size.scaled(by: shadowScale)
        imageView.center = CGPoint(x:self.bounds.midX,y:self.bounds.midY)
        imageView.layer.masksToBounds = false
        self.shadowImageView = imageView
        self.insertSubview(imageView,at:0)
    }
    
    
    
    func updateShadow(){
        
        self.shadowImageView.image = nil
        DispatchQueue.global(qos: DispatchQoS.QoSClass.utility).async {
            self.createLayerImage()
        }
    }
    
    private func createLayerImage(){
        
        let image = self.asImage
        let containerLayer = CALayer()
        let imageSize = image.size
        containerLayer.frame = CGRect(origin: .zero, size: imageSize.scaled(by:self.scaleImageConstant))
        containerLayer.backgroundColor = UIColor.clear.cgColor
        let blurImageLayer = CALayer()
        blurImageLayer.frame = CGRect(origin: .zero,size: imageSize)
        blurImageLayer.position = CGPoint(x:containerLayer.bounds.midX,y:containerLayer.bounds.midY)
        blurImageLayer.contents = image.applyBlurWithRadius(0, tintColor: self.shadowColor, saturationDeltaFactor: self.shadowSaturation)?.cgImage
        
        blurImageLayer.masksToBounds = false
        containerLayer.addSublayer(blurImageLayer)
        let containerImage = containerLayer.asImage
        
        
        let resizeImageConstant :CGFloat = 1
        guard let resizedContainerImage = containerImage.resized(withPercentage: resizeImageConstant),
            let blurredImage = resizedContainerImage.applyBlur(blurRadius: self.blurRadius)
            else {
                return
        }
        
        self.layer.masksToBounds = false
        
        DispatchQueue.main.async {
            self.shadowImageView?.image = blurredImage
        }
        
    }
}
