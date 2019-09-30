//
//  ViewController.swift
//  YouStrikeBack
//
//  Created by McAlister,Turner Scott on 9/20/19.
//  Copyright © 2019 McAlister,Turner Scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    //----------------- Main Label --------------------------//
    @IBOutlet weak var MainLabel: UILabel!
    
    
    
    
    // --------   Vader controls / labels   -----------------//
    @IBOutlet weak var SaberThrow: UIButton!
    @IBOutlet weak var ForceChoke: UIButton!
    @IBOutlet weak var VaderHealth: UILabel!
    
    
    
    // ---------   Luke Controls / labels  ------------------//
    @IBOutlet weak var SaberSlash: UIButton!
    @IBOutlet weak var ForcePush: UIButton!
    @IBOutlet weak var LukeHealth: UILabel!
    
    
    
    //-------------------- Health Defaults -----------------//
    var lukesHealth = 100
    var vadersHealth = 100
    
    
    
    //--------------------- Initial Setup ----------------//
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        VaderHealth.text = String(vadersHealth)
        LukeHealth.text = String(lukesHealth)
        
        
    }
    
    func didDie() {
        if lukesHealth <= 1 {
            lukesHealth = 0
        }
        if vadersHealth <= 1 {
            vadersHealth = 0
        }
        
    }
    
    //--------------------- Random Numbers -----------------//
    
    let randomNumber1 = Int.random(in: 5 ..< 16)
    let randomNumber2 = Int.random(in: 15 ..< 26)
    
    
    
    
    // -----------------Luke------------------------------//
    
    func lukeTurn(){
        vadersHealth -= randomNumber1
        VaderHealth.text = String(vadersHealth)
        
    }
    func lukeTurn2(){
        vadersHealth -= randomNumber2
        VaderHealth.text = String(vadersHealth)
        
    }
    
    @IBAction func forcePush(_ sender: Any) {
        lukeTurn()
    }
    
    @IBAction func saberSlash(_ sender: Any) {
        lukeTurn2()
    }
    
    
    //------------------- Vader---------------------------//
    func vaderTurn(){
        lukesHealth -= randomNumber1
        LukeHealth.text = String(lukesHealth)
    }
    func vaderTurn2(){
        lukesHealth -= randomNumber2
        LukeHealth.text = String(lukesHealth)
        
    }
    
    @IBAction func saberThrow(_ sender: Any) {
        vaderTurn()
    }
    @IBAction func forceChoke(_ sender: Any) {
        vaderTurn2()
    }
    
    //----------------Main Label ------------------------//
    
}


