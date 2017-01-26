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
    }
    
    @IBAction func btn_1(_ sender: AnyObject) {
        lbl_Pin.text?.append("1")
    }
    
    @IBAction func btn_2(_ sender: AnyObject) {
        lbl_Pin.text?.append("2")
    }
    
    
    @IBAction func btn_3(_ sender: AnyObject) {
        lbl_Pin.text?.append("3")
    }
    
    @IBAction func btn_4(_ sender: AnyObject) {
        lbl_Pin.text?.append("4")
    }
    
    @IBAction func btn_5(_ sender: AnyObject) {
        lbl_Pin.text?.append("5")
    }
    
    @IBAction func btn_6(_ sender: AnyObject) {
        lbl_Pin.text?.append("6")
    }
    
    
    @IBAction func btn_7(_ sender: AnyObject) {
        lbl_Pin.text?.append("7")
    }
    
    @IBAction func btn_8(_ sender: AnyObject) {
        lbl_Pin.text?.append("8")
    }
    
    @IBAction func btn_9(_ sender: AnyObject) {
        lbl_Pin.text?.append("9")
    }
    


    
}

