//
//  ViewController.swift
//  BMICalcilator
//
//  Created by  Yo on 2017/7/26.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var resultText: UILabel!
    @IBOutlet var commentText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calculate(sender: AnyObject){
        if(heightTextField.text == "" || weightTextField.text == ""){
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
        else{
            let h = (Double(heightTextField.text!)!/100) * (Double(heightTextField.text!)!/100)
        
            let bmi = Double(weightTextField.text!)!/h
        
            resultText.text = String(format:"%.2f",bmi)
            
            self.view.endEditing(true)
            
            if(bmi < 18.5){
                commentText.text = "BMI < 18.5 \n體重過輕!!"
                
            }
            else if(bmi >= 18.5 && bmi < 24){
                commentText.text = "18.5 <= BMI < 24 \n體重正常!!"
            }
            else{
                commentText.text = "24 <= BMI \n體重過重!!"
            }

            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

