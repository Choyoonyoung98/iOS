
//
//  CommunicateViewController.swift
//  study01
//
//  Created by 조윤영 on 18/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import UIKit

class CommunicateViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!//인터페이스 빌더에 있는 테이블뷰 아울렛 가져오기
    
    var storyList: [Story] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
