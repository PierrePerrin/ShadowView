//
//  ShadowView+BlurProcess.swift
//  ShadowView
//
//  Created by Pierre Perrin on 26/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import Foundation

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
        
        blurWork?.cancel()
        self.shadowImageView.alpha = 0
        blurWork = DispatchWorkItem(qos: DispatchQoS.userInteractive, flags: DispatchWorkItemFlags.noQoS) {
            self.createLayerImage()
        }
        blurWork?.perform()
    }
    
    private func createLayerImage(){
        
        let image = self.asImage
        
        
        let containerLayer = CALayer()
        let imageSize = image.size
        containerLayer.frame = CGRect(origin: .zero, size: imageSize.scaled(by: scaleImageConstant))
        containerLayer.backgroundColor = UIColor.clear.cgColor
        let blurImageLayer = CALayer()
        blurImageLayer.frame = CGRect(origin: .zero,size: imageSize)
        blurImageLayer.position = CGPoint(x:containerLayer.bounds.midX,y:containerLayer.bounds.midY)
        blurImageLayer.contents = image.cgImage
        
        blurImageLayer.masksToBounds = true
        containerLayer.addSublayer(blurImageLayer)
        
        let containerImage = containerLayer.asImage
        
        let resizeImageConstant :CGFloat = 1
        guard let resizedContainerImage = containerImage.resized(withPercentage: resizeImageConstant),
            let blurredImage = resizedContainerImage
                .applyBlur(blurRadius:blurRadius,fastProcessing:true, tintColor : self.shadowTintColor, saturationDeltaFactor: self.shadowSaturation)
            else {
                return
        }
        
        self.layer.masksToBounds = false
        DispatchQueue.main.async {
            self.shadowImageView?.image = blurredImage
            self.shadowImageView.alpha = 1
        }
    }
}
