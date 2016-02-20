//
//  TapGame.swift
//  tapper-extreme
//
//  Created by Ryan Collins on 2016-02-20.
//  Copyright © 2016 Ryan Collins. All rights reserved.
//

import Foundation

class tapGame {
    
    var tapsToWin: Int?
    var currentTaps: Int!
    var haveIWon: Bool!
    
    init (howManyWin: Int)  {
        
        self.tapsToWin = howManyWin
        self.currentTaps = 0
        self.haveIWon = false
        
    }
    
    func advanceTaps () {
        if (self.tapsToWin != nil ) {
            self.currentTaps = self.currentTaps! + 1
        }
    }
    
    func checkWin () -> Bool {
        if self.currentTaps == self.tapsToWin! {
            return true
        } else {
            return false
        }
    }
    
}