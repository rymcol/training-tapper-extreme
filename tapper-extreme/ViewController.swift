//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Ryan Collins on 2016-02-20.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var newGame: tapGame?
    
    //Start Screen
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var tapField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    //Game Screen
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var endButton: UIButton!
    
    //Game Functions
    @IBAction func playPressed(Sender: UIButton!) {
        
        let tapFieldTextInt = Int(tapField.text!)
        
        if tapField.text != "" {
            if tapFieldTextInt == nil || tapFieldTextInt == 0 || tapFieldTextInt < 0 {
                presentInputError()
            } else {
                showGameScreen()
                let winAt: Int = Int(tapField.text!)!
                newGame = tapGame(howManyWin: winAt)
                updateTapsLabel("\(newGame!.currentTaps) Taps")
            }
        } else {
            presentInputError()
        }
        
    }
    
    @IBAction func tapButtonPressed(Sender: UIButton!) {
        
        if newGame != nil {
            
            newGame!.advanceTaps()
            updateTapsLabel("\(newGame!.currentTaps) Taps")
            
            if newGame!.checkWin() == true {
                presentWinNotice()
                returnToHomeScreen()
            } else {
                return
            }
        } else {
            returnToHomeScreen()
        }
        
        
    }
    
    @IBAction func endGamePressed (Sender: UIButton!) {
        returnToHomeScreen()
    }
    
    func presentInputError () {
        let alert = UIAlertController(title: "Alert", message: "You must put a number greater than 0 in the box", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func presentWinNotice() {
        let alert = UIAlertController(title: "Alert", message: "You won!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func returnToHomeScreen () {
        updateTapsLabel("0 Taps")
        
        logo.hidden = false
        tapField.hidden = false
        playButton.hidden = false
        
        tapButton.hidden = true
        tapsLabel.hidden = true
        endButton.hidden = true
    }
    
    func showGameScreen () {
        
        logo.hidden = true
        tapField.hidden = true
        playButton.hidden = true
        
        tapButton.hidden = false
        tapsLabel.hidden = false
        endButton.hidden = false
    }
    
    func updateTapsLabel (text: String) {
        tapsLabel.text = text
    }
    
    
    //Standard Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

