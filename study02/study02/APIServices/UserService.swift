//
//  UserService.swift
//  study02
//
//  Created by 조윤영 on 19/12/2018.
//  Copyright © 2018 조윤영. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


struct UserService:APIManager{
    static let shared = UserService()
    let loginURL = url(path:"/login")
    let headers: HTTPHeaders = ["Content-Type":"application/json"]
    
    func login(email: String, password:String, completion: @escaping (Token)->Void){
        //completion에 escape를 쓰면 모든 함수의 작업이 끝난 뒤 시작할 수 있다.
        //실행순서에 민감
        //
        let body = ["email":email,"password":password ]
        
        Alamofire.request(loginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseObject{ (res:DataResponse<ResponseBody<Token>>) in
            switch res.result {
            case .success:
                guard let data = res.result.value else{return}
                guard let token = data.data else{return}
                completion(token)
            case.failure(let err):
                print(err)
                
            
            }
        }
            

            }
        }




