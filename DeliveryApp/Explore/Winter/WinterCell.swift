//
//  WinterCell.swift
//  DeliveryApp
//
//  Created by Mohamed Ibrahem on 9/3/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit

class WinterWarmersCell: UICollectionViewCell {
    
    let cellId = "cellId"
    
    let containerView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.alwaysBounceHorizontal = true
        layout.scrollDirection = .horizontal
        collection.backgroundColor = UIColor.white
        return collection
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let collectionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Winter Warmers"
        label.textColor = UIColor.black
        return label
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("More", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        delegateWork()
        registerWork()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.white
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        addSubview(containerView)
        containerView.addSubview(headerView)
        headerView.addSubview(collectionTitle)
        headerView.addSubview(moreButton)
        containerView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor),
            
            headerView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            headerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            collectionTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            collectionTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            
            moreButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WinterWarmersCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! WinterCustomCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height, height: frame.height)
    }
    private func delegateWork(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private func registerWork(){
        collectionView.register(WinterCustomCell.self, forCellWithReuseIdentifier: cellId)
    }
}

class WinterCustomCell: UICollectionViewCell {
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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        return label
    }()
    
    let foodRegionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Italian"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4.6"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.red
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "(14)-$$"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.lightGray
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        addSubview(foodImage)
        addSubview(foodNameLabel)
        addSubview(rateLabel)
        addSubview(priceLabel)
        addSubview(foodRegionLabel)
        
        NSLayoutConstraint.activate([
            foodImage.widthAnchor.constraint(equalTo: widthAnchor),
            foodImage.topAnchor.constraint(equalTo: topAnchor),
            foodImage.heightAnchor.constraint(lessThanOrEqualTo: heightAnchor, multiplier: 0.6),
            
            foodNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            foodNameLabel.topAnchor.constraint(equalTo: foodImage.bottomAnchor, constant: 5),
            
            rateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            rateLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 5),
            
            priceLabel.centerYAnchor.constraint(equalTo: rateLabel.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            foodRegionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            foodRegionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

