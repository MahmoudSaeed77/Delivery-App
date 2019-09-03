//
//  LeftVC.swift
//  DeliveryApp
//
//  Created by Mohamed Ibrahem on 9/1/19.
//  Copyright © 2019 Mahmoud Saeed. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class LeftVC: SlideMenuController {
    
    let cellId = "cellId"
    let buttonLabelTextArray = ["Deliveries", "Explore", "Orders history", "Contributions", "Help & feedback"]
    var viewController: LeftVC?
    
    let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.green
        return view
    }()
    
    let controlViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let buttonCollectionView: UICollectionView = {
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
        delegate()
        registerCellClasses()
        
        view.backgroundColor = UIColor.white
        view.addSubview(topView)
        view.addSubview(controlViewButton)
        view.addSubview(buttonCollectionView)
        
        
        
        NSLayoutConstraint.activate([
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            
            controlViewButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -10),
            controlViewButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            
            buttonCollectionView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            buttonCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            buttonCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func showVC(){
        print("12389")
        let vc = ExploreVC()
        let nav = UINavigationController(rootViewController: vc)
        navigationController?.pushViewController(nav, animated: true)
    }
}

extension LeftVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func delegate(){
        buttonCollectionView.delegate = self
        buttonCollectionView.dataSource = self
    }
    func registerCellClasses(){
        buttonCollectionView.register(ButtonCell.self, forCellWithReuseIdentifier: cellId)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ButtonCell
        cell.buttonLabel.text = buttonLabelTextArray[indexPath.item]
        viewController = self
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            print("qwertyui")
            viewController?.showVC()
        }
    }
}

class ButtonCell: UICollectionViewCell {
    let buttonImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "")?.withRenderingMode(.alwaysOriginal))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        return image
    }()
    
    let buttonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        addSubview(buttonImage)
        addSubview(buttonLabel)
        
        NSLayoutConstraint.activate([
            buttonImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonImage.widthAnchor.constraint(equalToConstant: 45),
            buttonImage.heightAnchor.constraint(equalToConstant: 45),
            
            buttonLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonLabel.leadingAnchor.constraint(equalTo: buttonImage.trailingAnchor, constant: 20)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
