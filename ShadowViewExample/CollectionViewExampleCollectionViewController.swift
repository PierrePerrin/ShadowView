//
//  CollectionViewExampleCollectionViewController.swift
//  ShadowViewExample
//
//  Created by Pierre Perrin on 02/12/2017.
//  Copyright © 2017 Pierreperrin. All rights reserved.
//

import UIKit

class shadowViewCell : UICollectionViewCell{
    
    @IBOutlet var shadowView : ShadowView?
    @IBOutlet var imageView : UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView?.highPerformanceBlur = true
    }
    
    func setImage(image:UIImage){
//        if self.imageView?.image != nil{return}
        self.imageView?.image = image
        print("Hello")
        shadowView?.updateShadow()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.image = nil
    }
    
}

class CollectionViewExampleCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 30
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shadowViewCell", for: indexPath) as? shadowViewCell else{
            return UICollectionViewCell()
        }
        let image = indexPath.section == 0 ? #imageLiteral(resourceName: "sample.jpg") : #imageLiteral(resourceName: "home2.jpeg")
        cell.setImage(image: image)
        return cell
    }
}
