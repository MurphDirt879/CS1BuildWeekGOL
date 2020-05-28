//
//  AboutViewController.swift
//  CSGameOfLife
//
//  Created by Ryan Murphy on 5/28/20.
//  Copyright © 2020 Ryan Murphy. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func youtubeButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=R9Plq-D1gEk") {
            UIApplication.shared.open(url)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
