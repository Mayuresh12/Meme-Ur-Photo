//
//  MemeCollectionViewController.swift
//  MemeUrPhoto
//
//  Created by Mayuresh Rao on 8/25/19.
//  Copyright © 2019 Mayuresh Rao. All rights reserved.
//

import UIKit




// MARK: - MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    
    private let reuseIdentifier = "Cell"
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // MARK: Life Cycle\
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = nil // No Edit functionallity 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: Table View Data Source

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if appDelegate.memes.count == 0 {
            navigationItem.leftBarButtonItems = nil
        }
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        
        let meme = appDelegate.memes[indexPath.row]
        
        // set meme image in collection cell
        
        cell.memePhoto.image = meme.memeImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedImage = appDelegate.memes[indexPath.row]
        let memePhotoVC = storyboard?.instantiateViewController(withIdentifier: "MemePhotoViewController") as! MemePhotoViewController
        memePhotoVC.selectedMeme = selectedImage
        self.navigationController?.pushViewController(memePhotoVC, animated: true)
    }
    
    //MARK : - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.orientation.isLandscape{
            let Width = (collectionView.bounds.width/5.0) - 2
            let Height = Width
            return CGSize(width: Width, height: Height)
        } else {
            let Width = (collectionView.bounds.width/3.0) - 2
            let Height = Width
            return CGSize(width: Width, height: Height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
