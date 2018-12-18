//
//  Story.swift
//  study01
//
//  Created by 조윤영 on 18/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import Foundation
import UIKit

internal struct Story {
    internal var profileImg: UIImage?
    internal var profileName: String?
    internal var storyText: String?
    internal var storyImg: UIImage?
    internal init( profile: String, name: String, text:String, img:String ){
        self.profileImg=UIImage(named:profile)
        self.profileName = name
        self.storyText = text
        self.storyImg = UIImage(named:img)
        
    }
}
