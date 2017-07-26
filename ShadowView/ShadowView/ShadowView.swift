//
//  ShadowImage.swift
//  ShadowView
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    private var blurWork : DispatchWorkItem?
    private var blurRadius :CGFloat = 5.0
    var shadowImageView : UIImageView!
    let scaleImageConstant :CGFloat = 3
    var correctShadowScale : CGFloat{
        return self.shadowScale + scaleImageConstant - 1
    }
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addImageView()
    }
    
    @IBInspectable var shadowScale : CGFloat = 1{
        didSet{
            self.layoutSubviews()
        }
    }
    
    override public var shadowOffset : CGSize{
        didSet{
            self.layoutSubviews()
        }
    }
    
    override public var shadowRadius : CGFloat{
        set{
            self.blurRadius = newValue
            self.updateShadow()
        }
        get{
            return blurRadius
        }
    }
    
    override var shadowOpacity: Float{
        set{
            self.shadowImageView.alpha = CGFloat(newValue)
        }
        get{
            return Float(self.shadowImageView.alpha)
        }
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
                .applyBlur(blurRadius:blurRadius,fastProcessing:true)
            else {
                return
        }
        
        self.layer.masksToBounds = false
        DispatchQueue.main.async {
            self.shadowImageView?.image = blurredImage
            self.shadowImageView.alpha = 1
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.updateShadow()
    }
    
    //Reload the image if the view changed.
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.shadowImageView.center = CGPoint(x:self.bounds.midX + self.shadowOffset.width,y:self.bounds.midY + self.shadowOffset.height)
        self.shadowImageView.frame.size = self.frame.size.scaled(by: correctShadowScale)
    }
    
}
