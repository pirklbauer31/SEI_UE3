//
//  ViewController.swift
//  UE3
//
//  David Binder, S1510237001
//  Kevin Pirklauer, S1510237028
//
//  Created by Student on 26/01/2017.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver( self,selector: #selector(enteredBackground),
                                                name: Notification.Name.UIApplicationDidEnterBackground,
                                                          object: nil)
        
        
        
    }
    
    let userPin: Int = 0
    var defaults = UserDefaults.standard

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    func enteredBackground(){
        lbl_Pin.text = ""
    }
    
    @IBOutlet weak var lbl_Pin: UILabel!
    
    @IBAction func btn_0(_ sender: AnyObject) {
        
        lbl_Pin.text?.append("0")
        checkPin()
    }
    
    @IBAction func btn_1(_ sender: AnyObject) {
        lbl_Pin.text?.append("1")
        checkPin()
    }
    
    @IBAction func btn_2(_ sender: AnyObject) {
        lbl_Pin.text?.append("2")
        checkPin()
    }
    
    
    @IBAction func btn_3(_ sender: AnyObject) {
        lbl_Pin.text?.append("3")
        checkPin()
    }
    
    @IBAction func btn_4(_ sender: AnyObject) {
        lbl_Pin.text?.append("4")
        checkPin()
    }
    
    @IBAction func btn_5(_ sender: AnyObject) {
        lbl_Pin.text?.append("5")
        checkPin()
    }
    
    @IBAction func btn_6(_ sender: AnyObject) {
        lbl_Pin.text?.append("6")
        checkPin()
    }
    
    
    @IBAction func btn_7(_ sender: AnyObject) {
        lbl_Pin.text?.append("7")
        checkPin()
    }
    
    @IBAction func btn_8(_ sender: AnyObject) {
        lbl_Pin.text?.append("8")
        checkPin()
    }
    
    @IBAction func btn_9(_ sender: AnyObject) {
        lbl_Pin.text?.append("9")
        checkPin()
    }
    
    func checkPin() {
        let pinLength = lbl_Pin.text?.characters.count
        if pinLength! >= 4 {
            if defaults.object(forKey: "wasLaunchedBefore") != nil {
                if lbl_Pin.text == (defaults.object(forKey: "UserPin") as? String) {
                    print("LOL")
                    self.performSegue(withIdentifier: "showBucketList", sender: self)
                }
                else {
                    lbl_Pin.text = ""
                    print("Wrong PIN (LMAO)")
                }
            }
            else {
                
                defaults.set(lbl_Pin.text , forKey: "UserPin")
                defaults.set(true, forKey: "wasLaunchedBefore")
                defaults.synchronize()
                
                lbl_Pin.text = ""
            }
        }
    }

    
}

