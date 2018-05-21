//
//  photoViewController.swift
//  SqimiTemplate
//
//  Created by SQIMI_VM on 17/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import os.log

internal class photoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //    MARK:Properties
    var myBtnLabel: String?
    var imageToSend: UIImage?
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var displayImage: UIImageView!
    
    //    MARK: Built-ins
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        saveBtn.isEnabled = false
        switch myBtnLabel {
        case "id"?:
            navigationItem.title = "Identificação"
        case "address"?:
            navigationItem.title = "Morada"
        case "job"?:
            navigationItem.title = "Profissão"
        default:
            navigationItem.title = ""
        }
        if(imageToSend != nil){
            displayImage.image = imageToSend
        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    MARK: Actions
    // function to return to homescren (with NavigationController)
    @IBAction func cancel(_ sender: UIBarButtonItem) {
//        Cancel Button
        dismiss(animated: true, completion: nil)
    }

    // function to open photoGallery
    @IBAction func userImage(_ sender: UITapGestureRecognizer) {
        let imagePickerControl = UIImagePickerController()
        imagePickerControl.sourceType = .photoLibrary
        //change this to camera??
        imagePickerControl.delegate = self
        
        present(imagePickerControl, animated: true, completion: nil)
    }
    
    //   ImagePickerControlDelegates
    //    cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    //    select
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            else{
                fatalError("UIImage expected..")
            }
        
        displayImage.image = selectedImage
        changeBtnSaveStatus()
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Navigation - Save
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveBtn else {
            os_log("Save not pressed", log:OSLog.default, type:.debug)
            return
        }
        os_log("Save pressed", log:OSLog.default, type:.debug)
        imageToSend = displayImage.image
    }
    
    //    MARK: Privates
    private func changeBtnSaveStatus(){
        saveBtn.isEnabled = !saveBtn.isEnabled
    }
    
}
