//
//  Player.swift
//  Connect4
//
//  Created by CSUFTitan on 5/11/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import UIKit
import GameplayKit

class Player: NSObject, GKGameModelPlayer {
    
    var chip: ChipColor
    var color: UIColor
    var name: String
    var playerId: Int

    static var allPlayers = [Player(chip: .red), Player(chip: .black)]
    
    init(chip: ChipColor) {
        self.chip = chip
        self.playerId = chip.rawValue

        if chip == .red {
            color = .red
            name = "Red"
        } else {
            color = .black
            name = "Black"
        }

        super.init()
    }
    
    var opponent: Player {
        if chip == .red {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }

}
