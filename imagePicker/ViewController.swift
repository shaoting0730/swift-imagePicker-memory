//
//  ViewController.swift
//  imagePicker
//
//  Created by Shaoting Zhou on 2017/3/15.
//  Copyright © 2017年 Shaoting Zhou. All rights reserved.
//

import UIKit
var identifier = "cell"
private var imgAry = [UIImage]()

class ViewController: UIViewController{
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var colectionView: UICollectionView!
        override func viewDidLoad() {
        super.viewDidLoad()
        colectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        colectionView.delegate = self
        colectionView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //选择 按钮点击事件 弹出相册
    @IBAction func btnAction(_ sender: UIButton) {
        let vc = UIImagePickerController()
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }



}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imgAry.count
    }


    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = colectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        let imgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        if(imgAry.count > 0){
            imgView.image = imgAry[indexPath.item]
        }
        cell.addSubview(imgView)
        return cell
    }
    //选择图片
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let image = info["UIImagePickerControllerOriginalImage"] as! UIImage  //选择的图片
        let newImage = image.imageWithScale(width: 500)  //按照宽为500的宽高比给图片重新绘制新的图片
        imgAry.append(newImage)  
        colectionView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }

}
