//
//  ViewController.swift
//  Slider
//
//  Created by  Yo on 2017/8/23.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var slide: UISlider!
    
    @IBAction func slider(_ sender: UISlider) {
        label.font = label.font.withSize(        CGFloat(Int(slide.value)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

