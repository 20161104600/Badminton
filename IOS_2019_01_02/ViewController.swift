//
//  ViewController.swift
//  IOS_2017_03_27
//
//  Created by 20151104687 on 17/3/27.
//  Copyright © 2017年 lyh. All rights reserved.
//

import UIKit
var Aimages:UIImage!
var Bimages:UIImage!
var setAname:String!
var setBname:String!

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var xa : Int = 0
    var xb : Int = 0
    var dlg=0
    var flagA=0
    var flagB=0
    var dele=[Int](repeating: 0, count: 63)
    var i=0
    var Aall=0
    var Ball=0
    

    @IBOutlet weak var BName: UITextField!
    @IBOutlet weak var AName: UITextField!
    @IBOutlet weak var Aname: UITextField!
    @IBOutlet weak var Bname: UITextField!
    @IBOutlet weak var bi: UITextField!
    @IBOutlet weak var vs: UITextField!
    @IBOutlet weak var A: UITextField!
    @IBOutlet weak var B: UITextField!
    @IBOutlet weak var Aleft: UITextField!
    @IBOutlet weak var Aleftimg: UIImageView!
    @IBOutlet weak var Aright: UITextField!
    @IBOutlet weak var Arightimg: UIImageView!
    @IBOutlet weak var Bright: UITextField!
    @IBOutlet weak var Brightimg: UIImageView!
    @IBOutlet weak var Bleft: UITextField!
    @IBOutlet weak var Bleftimg: UIImageView!
    @IBOutlet weak var AImage: UIImageView!
    @IBOutlet weak var Aimage: UIImageView!
    @IBOutlet weak var BImage: UIImageView!
    @IBOutlet weak var Bimage: UIImageView!
    @IBOutlet weak var game: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Aphoto(_ sender: Any) {
        if dlg==0{
            flagA=1
            flagB=0
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
    }

    @IBAction func Bphoto(_ sender: Any) {
        if dlg==0{
            flagB=1
            flagA=0
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
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if flagA == 1 {
            Aimages = image
            AImage.image = Aimages
            print(Aimages)
        }
        else if flagB == 1 {
            Bimages = image
            BImage.image = Bimages
            print(Bimages)
        }
        
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    @IBAction func getAname(_ sender: Any) {
            let alertController = UIAlertController(title: "系统登录", message: "请输入选手A的姓名", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addTextField { (textField:UITextField) in
                textField.placeholder = "选手A"
            }
            
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default) { (UIAlertAction) in
                let nameA = alertController.textFields![0]
                self.Aname.textAlignment = .center
                setAname = nameA.text
                self.Aname.text = setAname
                
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            
            // 弹出
            self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func getBname(_ sender: Any) {
            let alertController = UIAlertController(title: "系统登录", message: "请输入选手的姓名", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addTextField { (textField:UITextField) in
                textField.placeholder = "选手B"
            }
            
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default) { (UIAlertAction) in
                let nameB = alertController.textFields![0]
                self.Bname.textAlignment = .center
                setBname = nameB.text
                self.Bname.text = setBname
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            
            // 弹出
            self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    @IBAction func Aget(_ sender: Any) {
        if dlg==1{
            if game.text != "Game Over"{
                A.textAlignment = .center
                xa=xa+1
                dele[i]=1
                i=i+1
                if xa>=21{
                    let xaa=xa-2
                    if xaa >= xb{
                        A.text="0"
                        B.text="0"
                        Bleft.text=""
                        Bright.text=""
                        Aleft.text=""
                        Aright.text=""
                        Aall=Aall+1
                        let all=Aall
                        Aall=Ball
                        Ball=all
                        //game.text="Game Over"
                        bi.text="\(Aall) : \(Ball)"
                        xa=0
                        xb=0
                        i=0
                        
                        let image=Bimage.image
                        Bimage.image=Aimage.image
                        Aimage.image=image
                        let name=AName.text
                        AName.text=BName.text
                        BName.text=name
                        Bright.text="\("发球")"
                        Brightimg.image=Bimage.image
                        Aright.text=""
                        Arightimg.image=nil
                        Aleft.text=""
                        Aleftimg.image=nil
                        Bleft.text=""
                        Bleftimg.image=nil
                        dele[i]=2
                        i=i+1
                    }
                    else{
                        if xa>xb{
                            if xa==30{
                                A.text="0"
                                B.text="0"
                                Bleft.text=""
                                Bright.text=""
                                Aleft.text=""
                                Aright.text=""
                                Aall=Aall+1
                                let all=Aall
                                Aall=Ball
                                Ball=all
                                //game.text="Game Over"
                                bi.text="\(Aall) : \(Ball)"
                                xa=0
                                xb=0
                                i=0
                                let image=Bimage.image
                                Bimage.image=Aimage.image
                                Aimage.image=image
                                let name=AName.text
                                AName.text=BName.text
                                BName.text=name
                                Bright.text="\("发球")"
                                Brightimg.image=Bimage.image
                                Aright.text=""
                                Arightimg.image=nil
                                Aleft.text=""
                                Aleftimg.image=nil
                                Bleft.text=""
                                Bleftimg.image=nil
                                dele[i]=2
                                i=i+1
                            }
                            else{
                                A.text="\(xa)"
                                if xa%2 == 0{
                                    Aleft.text="\("发球")"
                                    Aleftimg.image=Aimage.image
                                    Aright.text=""
                                    Arightimg.image=nil
                                    Bleft.text=""
                                    Bleftimg.image=nil
                                    Bright.text=""
                                    Brightimg.image=nil
                                }
                                else{
                                    Aleft.text=""
                                    Aright.text="\("发球")"
                                    Aleftimg.image=nil
                                    Arightimg.image=Aimage.image
                                    Bleft.text=""
                                    Bleftimg.image=nil
                                    Bright.text=""
                                    Brightimg.image=nil
                                }
                            }
                        }
                        else{
                            A.text="\(xa)"
                            if xa%2 == 0{
                                Aleft.text="\("发球")"
                                Aleftimg.image=Aimage.image
                                Aright.text=""
                                Arightimg.image=nil
                                Bleft.text=""
                                Bleftimg.image=nil
                                Bright.text=""
                                Brightimg.image=nil
                            }
                            else{
                                Aleft.text=""
                                Aright.text="\("发球")"
                                Aleftimg.image=nil
                                Arightimg.image=Aimage.image
                                Bleft.text=""
                                Bleftimg.image=nil
                                Bright.text=""
                                Brightimg.image=nil
                            }
                        }
                    }
                }
                else{
                    A.text="\(xa)"
                    if xa%2 == 0{
                        Aleft.text="\("发球")"
                        Aleftimg.image=Aimage.image
                        Aright.text=""
                        Arightimg.image=nil
                        Bleft.text=""
                        Bleftimg.image=nil
                        Bright.text=""
                        Brightimg.image=nil
                    }
                    else{
                        Aleft.text=""
                        Aright.text="\("发球")"
                        Aleftimg.image=nil
                        Arightimg.image=Aimage.image
                        Bleft.text=""
                        Bleftimg.image=nil
                        Bright.text=""
                        Brightimg.image=nil
                    }
                }
            }
            if Aall==3{
                A.text="胜利"
                B.text="失败"
                game.text="Game Over"
                Aleft.text=""
                Aright.text=""
                Aleftimg.image=nil
                Arightimg.image=nil
                Bleft.text=""
                Bleftimg.image=nil
                Bright.text=""
                Brightimg.image=nil
                dlg=2
            }
            else if Ball==3{
                B.text="胜利"
                A.text="失败"
                game.text="Game Over"
                Aleft.text=""
                Aright.text=""
                Aleftimg.image=nil
                Arightimg.image=nil
                Bleft.text=""
                Bleftimg.image=nil
                Bright.text=""
                Brightimg.image=nil
                dlg=2
            }
        }
    }
    
    @IBAction func Bget(_ sender: Any) {
        if dlg==1{
            if game.text != "Game Over"{
                B.textAlignment = .center
                xb=xb+1
                dele[i]=2
                i=i+1
                if xb>=21{
                    let xbb=xb-2
                    if xbb >= xa{
                        B.text="0"
                        A.text="0"
                        Bleft.text=""
                        Bright.text=""
                        Aleft.text=""
                        Aright.text=""
                        Ball=Ball+1
                        let all=Aall
                        Aall=Ball
                        Ball=all
                        bi.text="\(Aall) : \(Ball)"
                        xa=0
                        xb=0
                        i=0
                        let image=Bimage.image
                        Bimage.image=Aimage.image
                        Aimage.image=image
                        let name=AName.text
                        AName.text=BName.text
                        BName.text=name
                        Aright.text="\("发球")"
                        Arightimg.image=Aimage.image
                        Bright.text=""
                        Brightimg.image=nil
                        Aleft.text=""
                        Aleftimg.image=nil
                        Bleft.text=""
                        Bleftimg.image=nil
                        dele[i]=1
                        i=i+1
                    }
                    else{
                        if xb>xa{
                            if xb==30{
                                B.text="0"
                                A.text="0"
                                Bleft.text=""
                                Bright.text=""
                                Aleft.text=""
                                Aright.text=""
                                Ball=Ball+1
                                let all=Aall
                                Aall=Ball
                                Ball=all
                                bi.text="\(Aall) : \(Ball)"
                                xa=0
                                xb=0
                                i=0
                                let image=Bimage.image
                                Bimage.image=Aimage.image
                                Aimage.image=image
                                let name=AName.text
                                AName.text=BName.text
                                BName.text=name
                                Aright.text="\("发球")"
                                Arightimg.image=Aimage.image
                                Bright.text=""
                                Brightimg.image=nil
                                Aleft.text=""
                                Aleftimg.image=nil
                                Bleft.text=""
                                Bleftimg.image=nil
                                dele[i]=1
                                i=i+1
                            }
                            else{
                                B.text="\(xb)"
                                if xb%2 == 0{
                                    Bleft.text="\("发球")"
                                    Bleftimg.image=Bimage.image
                                    Aright.text=""
                                    Arightimg.image=nil
                                    Aleft.text=""
                                    Aleftimg.image=nil
                                    Bright.text=""
                                    Brightimg.image=nil
                                }
                                else{
                                    Bleft.text=""
                                    Bleftimg.image=nil
                                    Bright.text="\("发球")"
                                    Brightimg.image=Bimage.image
                                    Aright.text=""
                                    Arightimg.image=nil
                                    Aleft.text=""
                                    Aleftimg.image=nil
                                }
                            }
                        }
                        else{
                            B.text="\(xb)"
                            if xb%2 == 0{
                                Bleft.text="\("发球")"
                                Bleftimg.image=Bimage.image
                                Aright.text=""
                                Arightimg.image=nil
                                Aleft.text=""
                                Aleftimg.image=nil
                                Bright.text=""
                                Brightimg.image=nil
                            }
                            else{
                                Bleft.text=""
                                Bleftimg.image=nil
                                Bright.text="\("发球")"
                                Brightimg.image=Bimage.image
                                Aright.text=""
                                Arightimg.image=nil
                                Aleft.text=""
                                Aleftimg.image=nil
                            }
                        }
                    }
                }
                else{
                    B.text="\(xb)"
                    if xb%2 == 0{
                        Bleft.text="\("发球")"
                        Bleftimg.image=Bimage.image
                        Aright.text=""
                        Arightimg.image=nil
                        Aleft.text=""
                        Aleftimg.image=nil
                        Bright.text=""
                        Brightimg.image=nil
                    }
                    else{
                        Bleft.text=""
                        Bleftimg.image=nil
                        Bright.text="\("发球")"
                        Brightimg.image=Bimage.image
                        Aright.text=""
                        Arightimg.image=nil
                        Aleft.text=""
                        Aleftimg.image=nil
                    }
                }
            }
            if Aall==3{
                A.text="胜利"
                B.text="失败"
                game.text="Game Over"
                Aleft.text=""
                Aright.text=""
                Aleftimg.image=nil
                Arightimg.image=nil
                Bleft.text=""
                Bleftimg.image=nil
                Bright.text=""
                Brightimg.image=nil
                dlg=2
            }
            else if Ball==3{
                B.text="胜利"
                A.text="失败"
                game.text="Game Over"
                Aleft.text=""
                Aright.text=""
                Aleftimg.image=nil
                Arightimg.image=nil
                Bleft.text=""
                Bleftimg.image=nil
                Bright.text=""
                Brightimg.image=nil
                dlg=2
            }
        }
    }
    
    @IBAction func start(_ sender: Any) {
        Aimage.image = Aimages
        Bimage.image = Bimages
        AName.textAlignment = .center
        BName.textAlignment = .center
        AName.text = setAname
        BName.text = setBname
        if Bimage.image != nil && Aimage.image != nil {
            if dlg==0{
                    dlg=1
                    if xa==0{
                        if xb==0{
                            A.textAlignment = .center
                            B.textAlignment = .center
                            bi.textAlignment = .center
                            vs.textAlignment = .center
                            Bleft.textAlignment = .center
                            Bright.textAlignment = .center
                            Aleft.textAlignment = .center
                            Aright.textAlignment = .center
                            game.textAlignment = .center
                            game.text=""
                            bi.text = ":"
                            A.text = "0"
                            B.text = "0"
                            vs.text = "VS"
                            game.text=""
                            let temp = Int(arc4random()%100)+1
                            if temp%2==0{
                                Bright.text="\("发球")"
                                Brightimg.image=Bimages
                                dele[i]=2
                                i=i+1
                            }
                            else{
                                Aright.text="\("发球")"
                                Arightimg.image=Aimages
                                dele[i]=1
                                i=i+1
                            }
                        }
                    }
                
            }
        }
        else{
            if Aimage.image == nil && Bimage.image != nil{
                let alertController = UIAlertController(title: "系统提示",
                                                        message: "请先上传选手A照片!\n", preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                /*let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                    action in
                    print("点击了确定")
                })
                alertController.addAction(okAction)*/
                //2秒钟后自动消失
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
            }
            else if Bimage.image==nil && Aimage.image != nil {
                let alertController = UIAlertController(title: "系统提示",
                                                        message: "请先上传选手B照片!\n", preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)

                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
            }
            else{
                let alertController = UIAlertController(title: "系统提示",
                                                        message: "请先上传两位选手照片!\n", preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)

                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
            }
        }
    }

    @IBAction func dele(_ sender: Any) {
        if i>0{
            i=i-1
            if dlg==1{
                if game.text==""{
                    if dele[i]==1{
                        if xa>=1{
                            xa=xa-1
                            A.text="\(xa)"
                            if i>0{
                                if dele[i-1]==1 {
                                    if xa%2 == 0{
                                        Aleft.text="\("发球")"
                                        Aleftimg.image=Aimage.image
                                        Aright.text=""
                                        Arightimg.image=nil
                                        Bleft.text=""
                                        Bleftimg.image=nil
                                        Bright.text=""
                                        Brightimg.image=nil
                                    }
                                    else{
                                        Aleft.text=""
                                        Aright.text="\("发球")"
                                        Aleftimg.image=nil
                                        Arightimg.image=Aimage.image
                                        Bleft.text=""
                                        Bleftimg.image=nil
                                        Bright.text=""
                                        Brightimg.image=nil
                                    }
                                }
                                else if dele[i-1]==2{
                                    if xb%2 == 0{
                                        Bleft.text="\("发球")"
                                        Bleftimg.image=Bimage.image
                                        Aright.text=""
                                        Arightimg.image=nil
                                        Aleft.text=""
                                        Aleftimg.image=nil
                                        Bright.text=""
                                        Brightimg.image=nil
                                    }
                                    else{
                                        Bleft.text=""
                                        Bleftimg.image=nil
                                        Bright.text="\("发球")"
                                        Brightimg.image=Bimage.image
                                        Aright.text=""
                                        Arightimg.image=nil
                                        Aleft.text=""
                                        Aleftimg.image=nil
                                    }
                                }
                            }
                            
                        }
                    }
                    else if dele[i]==2{
                        if xb>=1{
                            xb=xb-1
                            B.text="\(xb)"
                            if i>0{
                                if dele[i-1]==2{
                                    if xb%2 == 0{
                                        Bleft.text="\("发球")"
                                        Bleftimg.image=Bimage.image
                                        Aright.text=""
                                        Arightimg.image=nil
                                        Aleft.text=""
                                        Aleftimg.image=nil
                                        Bright.text=""
                                        Brightimg.image=nil
                                    }
                                    else{
                                        Bleft.text=""
                                        Bleftimg.image=nil
                                        Bright.text="\("发球")"
                                        Brightimg.image=Bimage.image
                                        Aright.text=""
                                        Arightimg.image=nil
                                        Aleft.text=""
                                        Aleftimg.image=nil
                                    }
                                }
                                else if dele[i-1]==1 {
                                    if xa%2 == 0{
                                        Aleft.text="\("发球")"
                                        Aleftimg.image=Aimage.image
                                        Aright.text=""
                                        Arightimg.image=nil
                                        Bleft.text=""
                                        Bleftimg.image=nil
                                        Bright.text=""
                                        Brightimg.image=nil
                                    }
                                    else{
                                        Aleft.text=""
                                        Aright.text="\("发球")"
                                        Aleftimg.image=nil
                                        Arightimg.image=Aimage.image
                                        Bleft.text=""
                                        Bleftimg.image=nil
                                        Bright.text=""
                                        Brightimg.image=nil
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    @IBAction func close(_ sender: Any) {
        if dlg==2{
            if game.text=="Game Over"{
                A.text=""
                B.text=""
                AName.text=""
                BName.text=""
                bi.text = ""
                vs.text = ""
                dlg=0
                Bleft.text=""
                Bright.text=""
                Aleft.text=""
                Aright.text=""
                game.text=""
                Bimage.image=nil
                Aimage.image=nil
                Bleftimg.image=nil
                Brightimg.image=nil
                Aleftimg.image=nil
                Arightimg.image=nil
                xa=0
                xb=0
                flagB=0
                flagA=0
                i=0
                Aall=0
                Ball=0
                exit(0)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

