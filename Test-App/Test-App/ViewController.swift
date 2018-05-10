//
//  ViewController.swift
//  Test-App
//
//  Created by SQIMI_VM on 09/05/2018.
//  Copyright © 2018 SQIMI_VM. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var liftOffLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource:"hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath:path)
        do{
            player = try AVAudioPlayer(contentsOf:url)
            player.prepareToPlay()
        } catch let error as NSError{
            print(error.description)
        }
    }
    
    @IBAction func powerBtnPressed(_ sender: UIButton){
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration:2.3, animations:{
            self.rocket.frame = CGRect(x: 0, y: 120, width: 375, height: 402)
        }){(finished) in
            self.countDownLabel.isHidden = false
            self.liftOffLabel.isHidden = false
        }
        
    }
}
