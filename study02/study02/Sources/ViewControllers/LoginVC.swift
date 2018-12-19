//
//  LoginVC.swift
//  study02
//
//  Created by 조윤영 on 19/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var textPassword: UITextField!
    @IBOutlet weak var textId: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func actionLogin(_ sender: Any) {
        guard let id = textId.text else{return}
        guard let password = textPassword.text else{return}
        UserService.shared.login(email: id, password: password) {
            (data)in print(data.token)
            
        }
        
        
    }
    


}
