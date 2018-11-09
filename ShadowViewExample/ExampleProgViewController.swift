//
//  ExampleProgViewController.swift
//  ShadowView
//
//  Created by Pierre Perrin on 26/07/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

class ExampleProgViewController: UIViewController {

    let exampleShadowContainerView = ShadowView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "sample.jpg"))
    
    override func loadView() {
        super.loadView()
        
        exampleShadowContainerView.frame = self.view.bounds
        exampleShadowContainerView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        exampleShadowContainerView.shadowOffset = CGSize(width: 0, height: 10)
        exampleShadowContainerView.shadowRadius = 20
        imageView.frame.size = CGSize(width: 200, height: 200)
        imageView.center = exampleShadowContainerView.center
        
        self.view.addSubview(exampleShadowContainerView)
        self.exampleShadowContainerView.addSubview(imageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.exampleShadowContainerView.updateShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      //  self.exampleShadowContainerView.updateShadow()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imageView.center = exampleShadowContainerView.center
        self.exampleShadowContainerView.updateShadow()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
