//
//  MealViewController.swift
//  FoodTracker
//
//  Created by SQIMI_VM on 10/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import os.log


class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
//  MARK: Properties
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: ratingControl!
    
    var meal: Meal?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBAction func CancelButton(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode{
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        } else{
            fatalError("MealViewController is not inside a naviagtaion contoller.")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        textField.delegate = self
        
        if let meal = meal {
            navigationItem.title = meal.name
            textField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
            
        }
        
        updateSaveButtonState()
        
        
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //  Disable save while editing
        saveButton.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: segue)
        
        guard let button = sender as? UIBarButtonItem, button  === saveButton else{
            os_log("The save button was not pressed, cancelling", log:OSLog.default, type:.debug)
            return
        }
        
        let name = textField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        meal = Meal(name: name, photo: photo, rating: rating)
        
    }
    
    @IBAction func tapToSelectImage(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        textField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
//   Dispose of any resources that can be recreated.
    }
    // MARK: Private Methods
    private func updateSaveButtonState(){
        let text = textField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        
    }

}
