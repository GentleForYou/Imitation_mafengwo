//
//  HomeViewController.swift
//  mafemgwoDemo
//
//  Created by 出神入化 on 2017/6/29.
//  Copyright © 2017年 出神入化. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
        
    }
    
    func getData()  {
        NetworkTools.requestData(urlString: "https://mapi.mafengwo.cn/rest/app/v2/index/?app_code=cn.mafengwo.www&app_ver=7.9.3&channel_id=App%20Store&device_token=&device_type=ios&hardware_model=iPhone8%2C1&idfa=00000000-0000-0000-0000-000000000000&idfv=AAA80197-D421-4487-8D6D-BFE47D73E211&jsondata=%7B%22page%22%3A%7B%22mode%22%3A%22sequential%22%7D%7D&mfwsdk_ver=20160401&oauth_consumer_key=4&oauth_nonce=5c3d3ad5-8f28-478f-9964-55992295535e&oauth_signature=BCWr024UCep1svYVlHniaboGCGY%3D&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1498791961&oauth_token=0_d5af5e71fbcea723b6af2ddae8ab084a&oauth_version=1.0&open_udid=E620F84D-89E6-4C39-B317-3996DEA26E82&screen_height=1334&screen_scale=2&screen_width=750&sys_ver=10.3.2&time_offset=480&x_auth_mode=client_auth", .get, parameters: [:], success: { (result) in
            
            print(result)
            
        }) { (error) in
         print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
