//
//  ViewController.swift
//  AddPhoto
//
//  Created by  Yo on 2017/8/20.
//  Copyright © 2017年  Yo. All rights reserved.
//

import UIKit

class ViewController:UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet var UserText: UITextView!
    @IBOutlet var photoImageView: UIImageView!
    @IBAction func press(){
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            present(imagePicker,animated: true,completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
            
        }
        dismiss(animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

