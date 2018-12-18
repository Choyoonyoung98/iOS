//
//  StoryCell.swift
//  study01
//
//  Created by 조윤영 on 18/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var prifileName: UILabel!
    
    @IBOutlet weak var storyLabel: UILabel!
    
    @IBOutlet weak var storyImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImg.layer.cornerRadius = 10
        profileImg.layer.masksToBounds = true
    }
}
