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
        songs.append(Song(name: "Bailando",
                          albumName: "Vivir",
                          artistName: "Enrique Iglesias",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Vamos pa la playa",
                          albumName: "Escape",
                          artistName: "Pedro Capo",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Savage Love",
                          albumName: "Tattoos",
                          artistName: "Jason Derulo",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Yellow",
                          albumName: "Parachutes",
                          artistName: "Coldplay",
                          imageName: "cover4",
                          trackName: "song4"))
        songs.append(Song(name: "Perfect",
                          albumName: "Divide",
                          artistName: "Ed Sheeran",
                          imageName: "cover5",
                          trackName: "song5"))
        songs.append(Song(name: "Someone like you",
                          albumName: "21",
                          artistName: "Adele",
                          imageName: "cover6",
                          trackName: "song6"))
            }
   //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold" , size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica" , size: 17 )
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
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

