//
//  ViewController.swift
//  Control Fun
//
//  Created by Andrew Watts on 5/30/15.
//  Copyright (c) 2015 Andrew Watts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "50"
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tetFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl){
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }

    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }
    @IBAction func switchChanged(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    @IBAction func toggleControls(sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            leftSwitch.hidden = false
            rightSwitch.hidden = false
            doSomethingButton.hidden = true
        }
        else {
            leftSwitch.hidden = true
            rightSwitch.hidden = true
            doSomethingButton.hidden = false
        }
    }
    @IBAction func buttonPressed(sender: UIButton) {
        let controller = UIAlertController(title: "Are you really fucking sure?", message:nil, preferredStyle: .ActionSheet)
        let yesAction = UIAlertAction(title: "Hell yeah bro!", style: .Destructive, handler: { action in
            let msg = self.nameField.text.isEmpty
                ? "Well son of a bitch, it worked."
                : "Well son of a bitch, \(self.nameField.text)" + ", it worked."
            let controller2 = UIAlertController(title: "Something sure as shit happened", message: msg, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Shit yeah!", style: .Cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "Fuck no!", style: .Cancel, handler: nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
            ppc.permittedArrowDirections = .Down
        }
        
        presentViewController(controller, animated: true, completion: nil)
    }
}

