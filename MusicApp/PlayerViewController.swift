//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by Zana Ramizi on 7/18/20.
//  Copyright © 2020 Zana Ramizi. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []
    
    
    @IBOutlet var holder: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 1 {
            configure()
    }
}

    func configure() {
        // set up player
        
        //set up user interface elements 
        
     }
}

