//
//  MenuBar.swift
//  Pets
//
//  Created by  Yo on 2017/11/7.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.blue
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    let cellId = "cellId"
    let imageName = ["home","dog","cat","rabbit"]
    var homeController: HomeController?
    let title = ["All Animals","Dogs","Cats","Rabbit"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": collectView]))
        
        setupHorizontalBar()
        
        
        
    }
    var horizontalBarLeftAnchor: NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = UIColor.white
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBar)
        
        horizontalBarLeftAnchor = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchor?.isActive = true
        horizontalBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 4).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageName[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width / 4
        horizontalBarLeftAnchor?.constant = x


        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        print(indexPath.item)
        homeController?.navigationItem.title = title[indexPath.item]
        
        
        if (indexPath.item == 0) {
            let allType = homeController?.allType
            homeController?.animals = allType
        }
        else if (indexPath.item == 1) {
            let dogType = homeController?.dogs
            homeController?.animals = dogType
        }
        else if (indexPath.item == 2) {
            let catType = homeController?.cats
            homeController?.animals = catType
        }
        else if (indexPath.item == 3) {
            let otherType = homeController?.others
            homeController?.animals = otherType
        }
        
        DispatchQueue.main.async {
            
            self.homeController?.collectionView?.reloadData()
        }
//        print(homeController?.animals?[0])
        
//        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MenuCell: UICollectionViewCell {
    
    
    var imageView: UIImageView = {
        var iv = UIImageView()
        iv.image = UIImage(named: "dog")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    

    override init(frame: CGRect) {
        super.init(frame:frame)
        setupViews()
        
    }
    func setupViews() {
        addSubview(imageView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))


        backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
