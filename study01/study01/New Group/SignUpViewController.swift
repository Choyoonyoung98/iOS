//
//  SignUpViewController.swift
//  study01
//
//  Created by 조윤영 on 18/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_login" {
            let id = idTextField.text
            let dvc = segue.destination as! SignInViewController
            dvc.dataId = id ?? nil
            
            let password = passwordTextField.text
            dvc.dataPassword = password
        }
    }
}
