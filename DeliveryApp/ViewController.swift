//
//  ViewController.swift
//  DeliveryApp
//
//  Created by Mohamed Ibrahem on 8/28/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class ViewController: UIViewController {
    
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        collection.alwaysBounceVertical = true
        collection.backgroundColor = UIColor.white
        return collection
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let slideMenuButton = UIBarButtonItem(image: UIImage(named: "Card")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(menuAction))
        view.backgroundColor = .white
        title = "Deliveries"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .green
//        navigationItem.leftBarButtonItem = slideMenuButton
        self.addLeftBarButtonWithImage((UIImage(named: "Card")?.withRenderingMode(.alwaysOriginal))!)
        self.addRightBarButtonWithImage((UIImage(named: "Shape")?.withRenderingMode(.alwaysOriginal))!)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(DeliveryCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
        
    }
    
    @objc func menuAction(sender: UIBarButtonItem){
        print("wertyui")
        self.openLeft()
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DeliveryCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 300)
    }
}

class DeliveryCell: UICollectionViewCell {
    
    let containerView = UIView()
    
    let foodImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "image")?.withRenderingMode(.alwaysOriginal))
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let foodNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Spaghetti Ma3krona"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    let foodRegionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Italian"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.white
        containerView.layer.cornerRadius = 20
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.clipsToBounds = true
        
        
        addSubview(containerView)
        
        containerView.addSubview(foodImage)
        containerView.addSubview(foodNameLabel)
        containerView.addSubview(foodRegionLabel)
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor),
            
            foodImage.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            foodImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            foodImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.8),
            
            foodNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            foodNameLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 5),
            
            foodRegionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            foodRegionLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 5)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

