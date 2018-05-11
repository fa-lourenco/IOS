//
//  ViewController.swift
//  FoodTracker
//
//  Created by SQIMI_VM on 10/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mealLabel: UILabel!
    
    // MARK: Actions
    @IBAction func btnLabelText(_ sender: UIButton) {
        mealLabel.text="Default Text"
    }
    
    @IBAction func selectImageFromGallery(_ sender: UITapGestureRecognizer) {
        //Hide Keyboard
        textField.resignFirstResponder()
//      ImagePicker View
        let imagePickerController = UIImagePickerController()
//       photos in gallery only
    imagePickerController.sourceType = .photoLibrary
//        viewController is notified when image is selected
        imagePickerController.delegate=self
        present(imagePickerController, animated:true, completion: nil)
        
    }
    //    MARK:UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss image selection
        dismiss(animated:true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        multiple representations of an image. (use original)
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else
        {
            fatalError("Expected and image, the provided file was (file)")
        }
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide Keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealLabel.text = textField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Handle text Field user input through delegate
        textField.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
