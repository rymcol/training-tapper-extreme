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
    
    //Game Functions
    @IBAction func playPressed(Sender: UIButton!) {
        
        showGameScreen()
        
        if tapField.text != nil {
            let winAt: Int = Int(tapField.text!)!
            newGame = tapGame(howManyWin: winAt)
            updateTapsLabel("\(newGame!.currentTaps) Taps")
            
        } else {
            tapField.text = "Error"
        }
        
    }
    
    @IBAction func tapButtonPressed(Sender: UIButton!) {
        
        if newGame != nil {
            
            newGame!.advanceTaps()
            
            updateTapsLabel("\(newGame!.currentTaps) Taps")
            
            print("Taps: \(newGame!.currentTaps)")
            print("Win at: \(newGame!.tapsToWin!)")
            print("\(newGame!.checkWin())")
            
            if newGame!.checkWin() == true {
                returnToHomeScreen()
            } else {
                return
            }
        } else {
            returnToHomeScreen()
        }
        
        
    }
    
    func returnToHomeScreen () {
        updateTapsLabel("0 Taps")
        
        logo.hidden = false
        tapField.hidden = false
        playButton.hidden = false
        
        tapButton.hidden = true
        tapsLabel.hidden = true
    }
    
    func showGameScreen () {
        
        logo.hidden = true
        tapField.hidden = true
        playButton.hidden = true
        
        tapButton.hidden = false
        tapsLabel.hidden = false
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

