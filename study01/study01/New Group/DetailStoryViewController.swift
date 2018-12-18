//
//  DetailStoryViewController.swift
//  study01
//
//  Created by 조윤영 on 18/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import UIKit

class DetailStoryViewController: UIViewController {
    
    var showImg: UIImage?
    var showName: String?
    var showText:String?
    var showStoryImg:UIImage?

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var storyImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileName.text = showName
        profileImg.image = showImg
        storyLabel.text = showText
        storyImg.image = showStoryImg
        
        profileImg.layer.cornerRadius = 100
        profileImg.layer.masksToBounds = true
        
    }
    


}
