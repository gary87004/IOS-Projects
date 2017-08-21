//
//  ViewController.swift
//  TapCounter
//
//  Created by  Yo on 2017/8/2.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var TapButton: UIButton!
    @IBOutlet var ResetButton: UIButton!
    @IBOutlet var Counter: UILabel!
    var temp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func Tap(sender: UIButton){
        if(sender == TapButton){
            temp = temp + 1
            Counter.text = String(temp)
        }
        else if(sender == ResetButton){
            temp = 0
            Counter.text = "0"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

