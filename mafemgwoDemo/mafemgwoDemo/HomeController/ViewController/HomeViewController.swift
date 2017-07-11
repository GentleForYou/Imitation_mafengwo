//
//  HomeViewController.swift
//  mafemgwoDemo
//
//  Created by 出神入化 on 2017/6/29.
//  Copyright © 2017年 出神入化. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let homeCell = "HomeTableViewCell"
    var listArr : Array<Any> = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView .register(UINib (nibName: homeCell, bundle: nil), forCellReuseIdentifier: homeCell)
        tableView.rowHeight = ScaleWith(width: 150)
        
        getData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return listArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView .dequeueReusableCell(withIdentifier: homeCell, for: indexPath) as! HomeTableViewCell
        if listArr.count > 0 {
            cell.nameLabel.text = (self.listArr[indexPath.row] as! JSON)["title"].string
            cell.desLabel.text = (self.listArr[indexPath.row] as! JSON)["content"].string
            let iconStr = (self.listArr[indexPath.row] as! JSON)["bottom"]["user"]["logo"].string
            let iconURLString = cutString(intoString: iconStr!)
            cell.iconImageView.kf.setImage(with: URL(string: iconURLString)!, placeholder: UIImage .init(named: "default_placeholder_w180"), options: nil, progressBlock: nil, completionHandler: nil)
            
            let mainStr = (self.listArr[indexPath.row] as! JSON)["image"].string
            let mainURLString = cutString(intoString: mainStr!)
            cell.mainImageView.kf.setImage(with: URL(string: mainURLString)!, placeholder: UIImage .init(named: "default_placeholder_w180"), options: nil, progressBlock: nil, completionHandler: nil)
            
        }
        
        
        return cell
    }
    
    
    
    func getData()  {
        NetworkTools.requestData(urlString: "https://mapi.mafengwo.cn/rest/app/v2/index/?app_code=cn.mafengwo.www&app_ver=7.9.3&channel_id=App%20Store&device_token=&device_type=ios&hardware_model=iPhone8%2C1&idfa=00000000-0000-0000-0000-000000000000&idfv=AAA80197-D421-4487-8D6D-BFE47D73E211&jsondata=%7B%22page%22%3A%7B%22mode%22%3A%22sequential%22%7D%7D&mfwsdk_ver=20160401&oauth_consumer_key=4&oauth_nonce=5c3d3ad5-8f28-478f-9964-55992295535e&oauth_signature=BCWr024UCep1svYVlHniaboGCGY%3D&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1498791961&oauth_token=0_d5af5e71fbcea723b6af2ddae8ab084a&oauth_version=1.0&open_udid=E620F84D-89E6-4C39-B317-3996DEA26E82&screen_height=1334&screen_scale=2&screen_width=750&sys_ver=10.3.2&time_offset=480&x_auth_mode=client_auth", .get, parameters: [:], success: { (result) in
            
            let json = JSON(result)
            let list = json["data"]["list"][1]["data"]["list"].array
            for dic in list!
            {
                if dic["style"] == "image_text" && dic["data"]["item_type"] == "index_note"{
                    self.listArr .append(dic["data"])
                }
            }
            self.tableView .reloadData()
            
        }) { (error) in
         print(error)
        }
    }
    
    func cutString(intoString : String) -> String {
       let substringArry = intoString.components(separatedBy: "?")
        return substringArry[0]
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
