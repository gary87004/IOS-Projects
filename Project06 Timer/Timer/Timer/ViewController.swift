//
//  ViewController.swift
//  Timer
//
//  Created by  Yo on 2017/8/10.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Screen: UILabel!
    var temp  = 0.0
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func reset_button(_ sender: Any) {
        temp = 0.0
        Screen.text = String(temp)
    }
    @IBAction func Stop_timer(_ sender: Any) {
        timer.invalidate()
    }
    func update_time(){
        temp = temp + 0.1
        Screen.text = String(format:"%.1f",temp)
    }
    @IBAction func Start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.update_time), userInfo: nil, repeats: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

