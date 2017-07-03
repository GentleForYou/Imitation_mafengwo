//
//  NetworkTools.swift
//  mafemgwoDemo
//
//  Created by 出神入化 on 2017/7/3.
//  Copyright © 2017年 出神入化. All rights reserved.
//

import UIKit

import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTools {
    
   class func requestData(urlString : String, _ type : MethodType, parameters : [String : Any], success : @escaping(_ result : Any) -> (), failure : @escaping(_ error : NSError) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
          
            response.result.ifSuccess {
                success(response.result.value as Any)
            }
            
            response.result.ifFailure {
                failure (response.error! as NSError)
            }

            
        }
        
    }

}
