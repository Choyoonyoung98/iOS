//
//  ShowViewController.swift
//  ViewStudy
//
//  Created by 조윤영 on 18/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!//Label outlet 끌어다 가져오기
    var data: String? //전역변수 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
         //아래의 함수를 viewDidLoad 안의 사용하여 뷰컨트롤러가 로드되면 함수가 호출되게 합니다.
    }
        //전달받은 data를 셋팅하기 위한 함수
    func setup() {
        if let transData = data {
            //전달받은 data에 값이 있다면 label의 text를 설정해 줍니다.
            dataLabel.text = transData
        }
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated:true)
    }
    
}
