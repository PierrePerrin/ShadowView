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
        DispatchQueue.global(qos: DispatchQoS.QoSClass.utility).async { [weak self] in
            self?.createLayerImage()
        }
    }
    
    private func createLayerImage(){
        
        let image = asImage
        let containerLayer = CALayer()
        let imageSize = image.size
        containerLayer.frame = CGRect(origin: .zero, size: imageSize.scaled(by:scaleImageConstant))
        containerLayer.backgroundColor = UIColor.clear.cgColor
        let blurImageLayer = CALayer()
        blurImageLayer.frame = CGRect(origin: .zero,size: imageSize)
        blurImageLayer.position = CGPoint(x:containerLayer.bounds.midX,y:containerLayer.bounds.midY)
        blurImageLayer.contents = image.applyBlurWithRadius(0, tintColor: shadowColor, saturationDeltaFactor: shadowSaturation)?.cgImage
        
        blurImageLayer.masksToBounds = false
        containerLayer.addSublayer(blurImageLayer)
        let containerImage = containerLayer.asImage
        
        
        let resizeImageConstant :CGFloat = 1
        guard let resizedContainerImage = containerImage.resized(withPercentage: resizeImageConstant),
            let blurredImage = resizedContainerImage.applyBlur(blurRadius: blurRadius)
            else {
                return
        }
        
        layer.masksToBounds = false
        
        DispatchQueue.main.async { [weak self] in
            self?.shadowImageView?.image = blurredImage
        }
        
    }
}
