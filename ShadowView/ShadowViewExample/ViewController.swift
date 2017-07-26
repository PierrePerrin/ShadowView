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
    @IBOutlet weak var imageviEW: UIImageView!
    @IBOutlet weak var shadowexample2: ShadowView!
    
    let image1 = #imageLiteral(resourceName: "sample.jpg")
    let image2 = #imageLiteral(resourceName: "home2.jpeg")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.shadowexample2.updateShadow()
    }
    
    @IBAction func blurSlider(_ sender: UISlider) {
        
        self.exampleView.shadowRadius = CGFloat(sender.value * 50)
    }
    
    @IBAction func shadowSize(_ sender: UISlider) {
        
        self.exampleView.shadowScale = CGFloat(sender.value * 2) + 1
    }
    
    @IBAction func shadowOpacity(_ sender: UISlider) {
        
        self.exampleView.shadowOpacity = sender.value
    }
    
    @IBAction func CHANGEiMAGE(_ sender: Any) {
        
        if self.imageviEW.image == image1{
            self.imageviEW.image = image2
        }else{
            self.imageviEW.image = image1
        }
        self.shadowexample2.updateShadow()
        self.exampleView.updateShadow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

