//
//  MemeDetailViewController.swift
//  MemeUrPhoto
//
//  Created by Mayuresh Rao on 8/24/19.
//  Copyright © 2019 Mayuresh Rao. All rights reserved.
//

import UIKit

// MARK: - MemeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

class MemeDetailViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableViewOutlet: UITableView!
   
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDummyData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableViewOutlet.reloadData()
    }
    
    // MARK: Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        navigationItem.leftBarButtonItems = nil //  No Edit functionallity 
        return appDelegate.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell", for: indexPath) as! MemeTableViewCell
        let meme = appDelegate.memes[indexPath.row]
        
        // Set the name and image

        cell.cellImage.image = meme.memeImage
        cell.cellText.text = meme.topText + "..." + meme.bottomText
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedImage = appDelegate.memes[indexPath.row]
        let storyBoardViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemePhotoViewController") as! MemePhotoViewController
        storyBoardViewController.selectedMeme = selectedImage
        self.navigationController?.pushViewController(storyBoardViewController, animated: true)
    }

    // MARK : -  Dummy data
    func addDummyData() {
        let dummyData :[Meme] = [
            Meme(topText: "MY LIFE...", bottomText: "FULFILLED!!!", originalImage: UIImage.init(named: "2")!, memeImage: UIImage.init(named: "2")!),
            Meme(topText: "PINCH OF PEPPER", bottomText: "AND SLAT PLEASE!!", originalImage: UIImage.init(named: "3")!, memeImage: UIImage.init(named: "3")!),
            Meme(topText: "I BETTER FINISH..", bottomText: "ASIGNMENT ON TIME", originalImage: UIImage.init(named: "4")!, memeImage: UIImage.init(named: "4")!),
            Meme(topText: "AAAAHHH..", bottomText: "WISH I WAS THERE", originalImage: UIImage.init(named: "5")!, memeImage: UIImage.init(named: "5")!),
            Meme(topText: "UDACITY STUDENT'S", bottomText: "AWESOME!!!", originalImage: UIImage.init(named: "7")!, memeImage: UIImage.init(named: "7")!),
            Meme(topText: "CHILL", bottomText: "WITH BEATS", originalImage: UIImage.init(named: "6")!, memeImage: UIImage.init(named: "6")!)]
        for  d in 0...5 {
           appDelegate.memes.append(dummyData[d])
        }
        
    }
}
