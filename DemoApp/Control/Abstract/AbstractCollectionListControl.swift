//
//  AbstractCollectionListControl.swift
//
//
//  Created by Jagdeep Singh on 13/11/17.
//  Copyright © 2017 JK. All rights reserved.
//

import UIKit

class AbstractCollectionListControl: UICollectionViewController {
   
    
    // a common array for all the subclasses
    var itemsArr = [Any]() {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    //MARK: - Default Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.setUpCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView?.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.old, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.collectionView?.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) { //called when any change happen on collection view like scrolling etc
        
    }
    
    var cellClass:AbstractCollectionCell.Type {
        return AbstractCollectionCell.self
    }
    
    // MARK: Custom Methods
    func setUpCollectionView() {
        collectionView?.register(cellClass, forCellWithReuseIdentifier: String(describing:cellClass))
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.showsVerticalScrollIndicator = false;
        collectionView?.showsHorizontalScrollIndicator = false;
        collectionView?.alwaysBounceVertical = false;
    }
   
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(itemsArr.count)
        return itemsArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing:cellClass), for: indexPath) as! AbstractCollectionCell
        cell.updateWith(model:itemsArr[indexPath.row])
        return cell
    }
    
}
