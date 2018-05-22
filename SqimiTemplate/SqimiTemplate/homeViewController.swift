//
//  homeViewController.swift
//  SqimiTemplate
//
//  Created by SQIMI_VM on 17/05/2018.
//  Copyright © 2018 SQIMI.Fabio. All rights reserved.
//

import UIKit
import os.log
import Font_Awesome_Swift

class homeViewController: UIViewController {
    
    //MARK: Properties
    var photosContainer = album(id: nil, address: nil, job: nil)!
    
    @IBOutlet weak var idBtn: UIButton!
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var jobBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var imgId: UIImageView!
    @IBOutlet weak var imgAddress: UIImageView!
    @IBOutlet weak var imgJob: UIImageView!
   
    @IBOutlet weak var popup: UIView!
    
    //    MARK: Built-ins
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        popup.center.x = self.view.center.x
        popup.isHidden=true
        //confirmBtn.isEnabled = checkRequirements(photoContainer: photosContainer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Navigation
    //Send info to photoViewController
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        
        let navControl = segue.destination as? UINavigationController
        let photoView = navControl?.topViewController as? photoViewController
       
        switch(segue.identifier ?? ""){
        case "id":
            photoView?.myBtnLabel = "id"
            if imgId != nil {
                photoView?.imageToSend = imgId.image
            }
        case "address":
                photoView?.myBtnLabel = "address"
                if imgAddress != nil {
                    photoView?.imageToSend = imgAddress.image
            }
        case "job":
                photoView?.myBtnLabel = "job"
                if imgJob != nil {
                    photoView?.imageToSend = imgJob.image
            }
        case "confirm":
            print("Good")
        default:
            fatalError("Unexpected Segue \(segue.identifier ?? "")")
    
        }
    }
    
    //receiveImage from photoViewController
    @IBAction func unwindToHome(sender: UIStoryboardSegue){
        if let sourceViewControl = sender.source as? photoViewController{
            switch sourceViewControl.myBtnLabel {
                case "id"?:
                    photosContainer.photoId = sourceViewControl.imageToSend
                case "address"?:
                    photosContainer.photoAddress = sourceViewControl.imageToSend
                case "job"?:
                    photosContainer.photoJob = sourceViewControl.imageToSend
                default:
                    return
            }
        }
        updateImages(photos: photosContainer)
        confirmBtn.isEnabled = checkRequirements(photoContainer: photosContainer)
    }
    
    //MARK: Actions
    
    @IBAction func delImage(_ sender: UIButton) {
        let alert = UIAlertController(title:"Reset", message:"Do you wish to reset the photos?", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"Yes", style: UIAlertActionStyle.default, handler:{
            action in self.clearPhotos(upPhotos: self.photosContainer)
        }))
        alert.addAction(UIAlertAction(title:"No", style: UIAlertActionStyle.default, handler:nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func closePopup(_ sender: UIButton) {
        popup.isHidden = true
        clearPhotos(upPhotos: photosContainer)
        confirmBtn.isEnabled = true
    }
    //MARK: Privates
   
    
    private func updateImages(photos: album){
        imgId.image = photos.photoId
        imgAddress.image = photos.photoAddress
        imgJob.image = photos.photoJob
        
    }
    
    private func checkRequirements(photoContainer:album)->Bool{
        if(photoContainer.photoId != nil &&
            photoContainer.photoAddress != nil &&
            photoContainer.photoJob != nil){
            return true
    }else{
        return false
        }
    }
    
    private func clearPhotos(upPhotos: album){
        upPhotos.photoId = nil
        upPhotos.photoAddress = nil
        upPhotos.photoJob = nil
        
        updateImages(photos:upPhotos)
    }
    @IBAction func confirmButton(_ sender: UIButton) {
        popup.isHidden=false
        confirmBtn.isEnabled = false
        
    }
    
}
