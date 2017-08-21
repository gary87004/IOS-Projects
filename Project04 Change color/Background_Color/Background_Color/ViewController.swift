//
//  ViewController.swift
//  Background_Color
//
//  Created by  Yo on 2017/8/7.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var butt : UIButton!
    
    @IBOutlet weak var Retengular: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func change_color(sender: Any){
        Retengular.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

