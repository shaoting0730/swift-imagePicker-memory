//
//  UIImage+extension.swift
//  imagePicker
//
//  Created by Shaoting Zhou on 2017/3/15.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

import UIKit

extension UIImage{
    //根据传入的宽度生成一张按照宽高比压缩的新图片
    func imageWithScale(width:CGFloat) -> UIImage{
       //1.根据 宽度 计算高度
        let height = width * size.height / size.width
      //2.按照宽高比绘制一张新的图片
        let currentSize = CGSize.init(width: width, height: height)
        UIGraphicsBeginImageContext(currentSize)  //开始绘制
         draw(in: CGRect.init(origin: CGPoint.zero, size: currentSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()  //结束上下文
        return newImage!
    }
}
