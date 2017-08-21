//
//  ViewController.swift
//  TapOrHold
//
//  Created by  Yo on 2017/8/21.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var Button: UIButton!
    @IBOutlet var TextLabel: UILabel!
    var count = 0
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesturePress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress))
        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.button_tap))
        Button.addGestureRecognizer(gesturePress)
        Button.addGestureRecognizer(gestureTap)


        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func Reset(){
        count = 0
        TextLabel.text = String(count)

    }
    func button_tap(){
        count = count + 1
        TextLabel.text = String(count)
    }
    func button_hold(){
        count = count + 1
        TextLabel.text = String(count)
    }
    func longPress(sender: UIGestureRecognizer) {
        if sender.state == .began {
            print("長按開始")
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.button_hold), userInfo: nil, repeats: true)
        } else if sender.state == .ended {
            print("長按結束")
            timer?.invalidate()

            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

