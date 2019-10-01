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
    @IBOutlet weak var endGameImage: UIImageView!
    @IBOutlet weak var vaderImage: UIImageView!
    @IBOutlet weak var lukeImage: UIImageView!
    
    
    
    
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
    let vader = SimpleSound(named: "1-10 The Imperial March (From_The Empire Strikes Back_).m4a" )
    let luke = SimpleSound(named: "1-01 Maint Title (From_Star Wars_).m4a")
    func endGameLuke() {
        SaberSlash.isEnabled = false
        ForcePush.isEnabled = false
        SaberThrow.isEnabled = false
        ForceChoke.isEnabled = false
        SaberSlash.isHidden = true
        ForcePush.isHidden = true
        SaberThrow.isHidden = true
        ForceChoke.isHidden = true
        endGameImage.isHidden = false
        MainLabel.isHidden = false
        lukeImage.isHidden = true
        vaderImage.isHidden = true
        VaderHealth.isHidden = true
        LukeHealth.isHidden = true
        luke.play()
    }
    func endGameVader(){
        SaberSlash.isEnabled = false
        ForcePush.isEnabled = false
        SaberThrow.isEnabled = false
        ForceChoke.isEnabled = false
        SaberSlash.isHidden = true
        ForcePush.isHidden = true
        SaberThrow.isHidden = true
        ForceChoke.isHidden = true
        endGameImage.isHidden = false
        MainLabel.isHidden = false
        lukeImage.isHidden = true
        vaderImage.isHidden = true
        VaderHealth.isHidden = true
        LukeHealth.isHidden = true
        vader.play()
        
    }
    
    func didDie() {
        if lukesHealth <= 1 {
            LukeHealth.text = "0"
            MainLabel.text = "Luke Died"
            endGameVader()
            endGameImage.image = UIImage(named: "DarthVader")
            }
        if vadersHealth <= 1 {
            VaderHealth.text = "0"
            MainLabel.text = "Vader Died"
            endGameLuke()
            endGameImage.image = UIImage(named: "Luke")
            luke.play()
            
        }
    }
    
    //--------------------- Random Numbers -----------------//
    
    let randomNumber1 = Int.random(in: 5 ..< 16)
    let randomNumber2 = Int.random(in: 15 ..< 26)
    
    
    
    
    // -----------------Luke------------------------------//
    
    func lukeTurn(){
        vadersHealth -= randomNumber1
        VaderHealth.text = String(vadersHealth)
        didDie()
    }
    func lukeTurn2(){
        vadersHealth -= randomNumber2
        VaderHealth.text = String(vadersHealth)
        didDie()
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
        didDie()
    }
    func vaderTurn2(){
        lukesHealth -= randomNumber2
        LukeHealth.text = String(lukesHealth)
        didDie()
    }
    
    @IBAction func saberThrow(_ sender: Any) {
        vaderTurn()
    }
    @IBAction func forceChoke(_ sender: Any) {
        vaderTurn2()
    }
    
    //----------------Main Label ------------------------//
    
}


