//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 田中美幸 on 2020/09/17.
//  Copyright © 2020 miyuki.tanaka2. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    
    //拡大画像のImage
    @IBOutlet weak var bigImage: UIImageView!
    
    //拡大画像の戻るボタン
    @IBOutlet weak var backButton: UIButton!
    
    var image2:UIImage!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bigImage.image = image2
    }
    
}
