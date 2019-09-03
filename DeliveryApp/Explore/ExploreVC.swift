//
//  ExploreVC.swift
//  DeliveryApp
//
//  Created by Mohamed Ibrahem on 9/2/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ExploreVC: UIViewController {
    
    let cellId = "cellId"
    let secondId = "secondId"
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.alwaysBounceVertical = true
        layout.scrollDirection = .vertical
        collection.backgroundColor = UIColor.white
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate()
        register()
        view.backgroundColor = UIColor.white
        title = "Explore"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
        
    }
}

extension ExploreVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func delegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    func register(){
        collectionView.register(CasualLunchCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(WinterWarmersCell.self, forCellWithReuseIdentifier: secondId)
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CasualLunchCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: secondId, for: indexPath) as! WinterWarmersCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 250)
    }
}


