//
//  DetailController.swift
//  Pets
//
//  Created by  Yo on 2017/11/5.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    var animalName: String?
    var imageName: String?
    var typeName: String?
    var gender: String?
    func setupAnimalImage() {
        if let imageUrl = imageName {
            let url = URL(string: imageUrl)
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {

                    return
                }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data!)
                }
            }).resume()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        nameLabel.text = animalName
        typelabel.text = typeName
        genderlabel.text = gender
        setupAnimalImage()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        setupView()
        
    }

    @objc func back() {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func setupView() {
        // add Image constraint
        view.addSubview(imageView)
        let t = UIScreen.main.bounds
        let width = t.width - 16 - 16
        let height = width * 9 / 16
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0(\(height))]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        
        // add namelabel constraint
        view.addSubview(nameLabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        view.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        // add typelabel constraint
        view.addSubview(typelabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": typelabel]))
        view.addConstraint(NSLayoutConstraint(item: typelabel, attribute: .top, relatedBy: .equal, toItem: nameLabel, attribute: .bottom, multiplier: 1, constant: 8))
        
        // add genderlabel constraint
        view.addSubview(genderlabel)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": genderlabel]))
        view.addConstraint(NSLayoutConstraint(item: genderlabel, attribute: .top, relatedBy: .equal, toItem: typelabel, attribute: .bottom, multiplier: 1, constant: 8))
        
    }
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let typelabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genderlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
