//
//  ImageViewController.swift
//  IOS_2017_03_27
//
//  Created by 20151104687 on 2017/6/23.
//  Copyright © 2017年 lyh. All rights reserved.
//

import UIKit
class ImageViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    

    
    @IBOutlet weak var Aimage: UIImageView!

    @IBAction func Aphoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
                Aimage.image = image
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
