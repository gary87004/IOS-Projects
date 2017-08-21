//
//  SecondViewController.swift
//  Table_function
//
//  Created by  Yo on 2017/8/16.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var Text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "BackToMain"){
            let destinationController = segue.destination as! MainTableViewController
            destinationController.update_data = destinationController.update_data + [Text.text]
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
