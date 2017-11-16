//
//  ViewController.swift
//  Pets
//
//  Created by  Yo on 2017/11/4.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var animals: [Layer2]?
    var allType: [Layer2]?
    var dogs: [Layer2]?
    var cats: [Layer2]?
    var others: [Layer2]?

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "All Animals"
        navigationController?.navigationBar.isTranslucent = false
        setupCollectionView()

        parseJsonData()
        setupMenuBar()
        
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        
    }
    
    func setupCollectionView() {
        collectionView?.register(PetsCell.self, forCellWithReuseIdentifier: "cellId")
        
//        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
//            flowLayout.minimumLineSpacing = 0
//        }


//        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets =
            UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.isPagingEnabled = true
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.homeController = self
        
        return mb
    }()
    func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        let redView = UIView()
        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        view.addSubview(redView)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": redView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": redView]))
        
        view.addSubview(menuBar)
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": menuBar]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(50)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": menuBar]))

        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    
//    --------------- test
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        menuBar.horizontalBarLeftAnchor?.constant = scrollView.contentOffset.x / 4
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
//        let colors: [UIColor] = [.blue, .red, .white, .purple]
//        cell.backgroundColor = colors[indexPath.item]
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//    --------------- end test

    
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return animals?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PetsCell

        cell.animal = animals?[indexPath.item]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = DetailController()
        if let word = animals?[indexPath.item].ImageName {
            detailController.imageName = word
            detailController.animalName = animals?[indexPath.item].Name
            detailController.typeName = animals?[indexPath.item].Type
            detailController.gender = animals?[indexPath.item].Sex

        }

        self.navigationController?.pushViewController(detailController, animated: true)
    }



    func parseJsonData() {
        let jsonUrlString = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=f4a75ba9-7721-4363-884d-c3820b0b917c"


        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }

            do {
                let h = try JSONDecoder().decode(Result.self, from: data)

                self.animals = [Layer2]()
                if let count = h.result?.count {
                    for index in 0...count-1 {
                        var animal = Layer2()
                        animal.Name = h.result?.results?[index].Name
                        animal.Type = h.result?.results?[index].Type
                        animal.Sex = h.result?.results?[index].Sex
                        animal.ImageName = h.result?.results?[index].ImageName
                        self.animals?.append(animal)
                    }



                }
                self.allType = self.animals
                self.dogs = self.animals?.filter({ (x) -> Bool in
                    x.Type == "犬"
                })
                self.cats = self.animals?.filter({ (x) -> Bool in
                    x.Type == "貓"
                })
                self.others = self.animals?.filter({ (x) -> Bool in
                    x.Type == "其他"
                })
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()


                }


            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }

        }.resume()

    }
    
    
}

