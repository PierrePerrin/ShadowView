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
    
    @IBAction func blurSlider(_ sender: UISlider) {
        
        self.exampleView.shadowRadius = CGFloat(sender.value * 10)
    }
    
    @IBAction func shadowSize(_ sender: UISlider) {
        
        self.exampleView.shadowScale = CGFloat(sender.value * 2) + 1
    }
    
    @IBAction func shadowOpacity(_ sender: UISlider) {
        
        self.exampleView.shadowOpacity = sender.value
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

