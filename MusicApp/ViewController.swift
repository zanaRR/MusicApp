//
//  ViewController.swift
//  MusicApp
//
//  Created by Zana Ramizi on 7/17/20.
//  Copyright © 2020 Zana Ramizi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
         table.dataSource = self
        
    }
    func configureSongs() {
        songs.append(Song(name: String,
                          albumName: String,
                          artistName: String,
                          imageName: String,
                          trackName: String))
    }
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: IndexPath)
        // configure
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: IndexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player")else {
            return
        }
        
        present(vc, animated: true)
    }
    
}
struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}
