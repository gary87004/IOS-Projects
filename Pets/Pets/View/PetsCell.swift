//
//  PetsCell.swift
//  Pets
//
//  Created by  Yo on 2017/11/4.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class PetsCell: UICollectionViewCell {
    var animal: Layer2? {
        didSet {
            let noName = "尚未"
            nameLabel.text = "姓名: \(animal?.Name ?? noName)"
            typeLabel.text = "種類: \(animal?.Type ?? noName)"
            sexLabel.text = "性別: \(animal?.Sex ?? noName)"

            setupAnimalImage()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAnimalImage() {
        if let imageUrl = animal?.ImageName {
            let url = URL(string: imageUrl)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {
                    
                    return
                }
                DispatchQueue.main.async {
                    self.profileImageView.image = UIImage(data: data!)
                }
            }).resume()
        }
    }
    let block: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 2
        return label
    }()
    
    let sexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    func setupViews() {
        
        
        // setup profileImageView
        addSubview(profileImageView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0(150)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView]))
        
        // setup separatorView

        addSubview(separatorView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": separatorView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": separatorView]))
        
        // setup nameLabel
        addSubview(nameLabel)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 40))
        
        // setup typeLabel
        addSubview(typeLabel)
        addConstraint(NSLayoutConstraint(item: typeLabel, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 40))
        addConstraint(NSLayoutConstraint(item: typeLabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 8))
        
        // setup sexLabel
        addSubview(sexLabel)
        addConstraint(NSLayoutConstraint(item: sexLabel, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 40))
        addConstraint(NSLayoutConstraint(item: sexLabel, attribute: .top, relatedBy: .equal, toItem: typeLabel, attribute: .bottom, multiplier: 1, constant: 8))

    }
}


