//
//  ViewController.swift
//  RefreshDate
//
//  Created by  Yo on 2017/8/23.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var date = Date()
    
    var Year_formatter = DateFormatter()

    var Month_formatter = DateFormatter()

    var Day_formatter = DateFormatter()
    
    var Second_formatter = DateFormatter()

    

    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var Result_24: UILabel!


    @IBAction func Refresh(_ sender: Any) {
        let date = Date()
        let AmPm_formatter = DateFormatter()
        let formatter_24 = DateFormatter()

        formatter_24.dateFormat   = " MM dd, yyyy, HH:mm:ss"

        AmPm_formatter.dateFormat = "MMM dd, yyyy, hh:mm:ss a"

        Result_24.text = formatter_24.string(from: date)
        Result.text = AmPm_formatter.string(from: date)


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

