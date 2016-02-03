//
//  ViewController.swift
//  rpgOOP
//
//  Created by Darko Spasovski on 2/3/16.
//  Copyright © 2016 Darko Spasovski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    
    @IBOutlet weak var playerLbl: UIImageView!
    
    @IBOutlet weak var playerHPLbl: UILabel!
    
    @IBOutlet weak var enemyHPLbl: UILabel!
    
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Irina20", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHPLbl.text = "\(player.hp) HP"
    
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr:  12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr:  15)
        }
        
        enemyImg.hidden = false
    }
    
    @IBAction func onChestPressed(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
    }

    @IBAction func attackPressed(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        if !enemy.isAlive {
            enemyHPLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

