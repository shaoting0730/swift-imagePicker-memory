# swift-imagePicker-memory
swift简单处理调用高清大图导致内存暴涨的情况
未使用照片:25.7 MB
![image](https://github.com/pheromone/swift-imagePicker-memory/blob/master/0.png) 
使用未压缩的照片: 333.1MB
![image](https://github.com/pheromone/swift-imagePicker-memory/blob/master/1.png) 
使用压缩之后的照片:53.9MB
![image](https://github.com/pheromone/swift-imagePicker-memory/blob/master/2.png)

``
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
``
