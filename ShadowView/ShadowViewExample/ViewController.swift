//
//  ViewController.swift
//  ShadowViewExample
//
//  Created by Pierre Perrin on 25/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var exampleView: ShadowView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var otherImage: UIImageView!
    
    let image1 = #imageLiteral(resourceName: "sample.jpg")
    let image2 = #imageLiteral(resourceName: "home2.jpeg")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBAction func blurSlider(_ sender: UISlider) {
        sender.isContinuous = false
        
        self.exampleView.shadowRadius = CGFloat(sender.value * 50)
        self.otherImage.layer.shadowRadius = CGFloat(sender.value * 50)
    }
    
    @IBAction func shadowSize(_ sender: UISlider) {
        
        self.exampleView.shadowScale = CGFloat(sender.value) + 1
    }
    
    @IBAction func shadowOpacity(_ sender: UISlider) {
        
        self.exampleView.shadowOpacity = sender.value
        self.otherImage.layer.shadowOpacity = sender.value
    }
    
    @IBAction func CHANGEiMAGE(_ sender: Any) {
        
        if self.imageView.image == image1{
            self.imageView.image = image2
            self.otherImage.image = image2
        }else{
            self.imageView.image = image1
            self.otherImage.image = image1
        }
        
        self.exampleView.updateShadow()
    }
    
    func update(){
        self.exampleView.updateShadow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.exampleView.updateShadow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

