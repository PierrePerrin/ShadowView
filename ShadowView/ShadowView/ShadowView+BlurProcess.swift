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
    
    
    
    public func updateShadow(dispatchQueue: DispatchQueue = .main){
        
        self.shadowImageView.image = nil
        self.createLayerImage(dispatchQueue: dispatchQueue)
    }
    
    private func createLayerImage(dispatchQueue: DispatchQueue = .main){
        
            DispatchQueue.main.async { [weak self] in
                
                guard let image = self?.asImage else { return }
                
                let shadowColor = self?.shadowColor ?? .clear
                let shadowSaturation = self?.shadowSaturation ?? 1
                let scaleImageConstant = self?.scaleImageConstant ?? 1
                let blurRadius = self?.blurRadius ?? 20
                dispatchQueue.async { [weak self] in
                
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
                    else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.layer.masksToBounds = false
                    self?.shadowImageView?.image = blurredImage
                }
            }
        }
        
    }
}
