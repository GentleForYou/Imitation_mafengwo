//
//  PublicConstants.swift
//  VacationTour
//
//  Created by 出神入化 on 2017/6/20.
//  Copyright © 2017年 出神入化. All rights reserved.
//

import Foundation
import UIKit

//屏幕高度
let kScreen_Height = UIScreen.main.bounds.size.height;

//屏幕宽度
let kScreen_Width = UIScreen.main.bounds.size.width;

//判断iPhone4
let IPHONE4_DEV:Bool! = (UIScreen.main.bounds.size.height == 960) ? true : false

//判断iPhone5/5c/5s
let IPHONE5_DEV:Bool! = (UIScreen.main.bounds.size.height == 1136) ? true : false

//判断iPhone6/6s
let IPHONE6s_DEV:Bool! = (UIScreen.main.bounds.size.height == 1334) ? true : false

//判断iPhone6p
let IPHONE6p_DEV:Bool! = (UIScreen.main.bounds.size.height == 2208) ? true : false

let baseBackColor = UIColor (red: 232/255.0, green: 232/255.0, blue: 232/255.0, alpha: 1)


//其它屏幕尺寸相对iphone6的宽度
func ScaleWith(width: CGFloat) -> CGFloat {
    return width * kScreen_Width / 375.0;
}
//其它屏幕尺寸相对iphone6的高度
func ScaleHeight(height: CGFloat) -> CGFloat {
    return height * kScreen_Height / 667.0;
}

//RGB 16进制转换
func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

//RGB 颜色
func UIColorFromValue (r :CGFloat, g :CGFloat,b :CGFloat) -> UIColor {
   return UIColor (red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
}

//通过颜色获取图片
func imageWithColor(color:UIColor, size:CGSize) -> UIImage {
    
    let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height);
    UIGraphicsBeginImageContext(rect.size);
    let context = UIGraphicsGetCurrentContext();
    context?.setFillColor(color.cgColor);
    context?.addRect(rect);
    let img = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    return img!;
}
