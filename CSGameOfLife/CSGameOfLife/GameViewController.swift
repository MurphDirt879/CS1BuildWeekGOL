//
//  GameViewController.swift
//  CSGameOfLife
//
//  Created by Ryan Murphy on 5/27/20.
//  Copyright © 2020 Ryan Murphy. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - Properties
    var grid: Grid!
    var settingsVC: SettingsViewController!
    var timer = Timer()
    var isRunning = false
    let presetView = UIView()
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet var patternbutton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        grid = Grid(width: self.view.frame.width, height: self.view.frame.height, view: self.view)
        settingsVC = SettingsViewController(grid: grid)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTitle), name: .generationChanged, object: nil)
    }
    
    @objc func updateTitle(_ notification: NSNotification ) {
        if let dict = notification.userInfo {
            if let id = dict["generations"] as? Int {
                if id == 0{
                    title = "Game of Life"
                } else {
                    title = "\(id) Generations"
                }
            }
        }
    }
    @IBAction func buttonpressed(_ sender: UIBarButtonItem) {
        if isRunning == false {
            isRunning = true
            sender.image = UIImage(systemName: "pause.circle")
            nextButton.isEnabled = false
            
            
        } else {
            isRunning = false
            sender.image = UIImage(systemName: "play.circle")
            nextButton.isEnabled = true
        }
        grid.configureTimer()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIBarButtonItem) {
        if isRunning == false {
            grid.computeNext()
            grid.generations += 1
        }
    }
    
    @IBAction func settingsButtonPressed(_ sender: Any) {
        present(settingsVC, animated: true)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        grid.resetGame()
    }
    
    @IBAction func toadButtonPressed(_ sender: Any) {
        grid.resetGame()
        grid.toadPattern()
    }
    
    @IBAction func blinkerButtonPressed(_ sender: Any) {
        grid.resetGame()
        grid.blinkerPattern()
    }
    
    @IBAction func beaconButtonPressed(_ sender: Any) {
        grid.resetGame()
        grid.beaconPattern()
    }
    
    @IBAction func gliderButtonPressed(_ sender: Any) {
        grid.resetGame()
        grid.gliderPattern()
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        grid.resetGame()
        grid.randomize()
    }
    
    
}
