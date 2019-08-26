//
//  MemePhotoViewController.swift
//  MemeUrPhoto
//
//  Created by Mayuresh Rao on 8/25/19.
//  Copyright © 2019 Mayuresh Rao. All rights reserved.
//

import UIKit

// MARK: - MemePhotoViewController: UIViewController

class MemePhotoViewController: UIViewController {
    
    // MARK: Properties

    var selectedMeme: Meme!
    
    // MARK: Outlets

    @IBOutlet weak var memePhoto: UIImageView!
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.memePhoto.image = selectedMeme.memeImage
    }
    
}
