//
//  ViewController.swift
//  UIAlertViewDemo
//
//  Created by 张雪东 on 16/4/14.
//  Copyright © 2016年 张雪东. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let btn = UIButton();
        btn.frame = CGRectMake(100, 300, 100, 40)
        btn.setTitle("弹窗", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.redColor()
        btn.addTarget(self, action: "alert", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
    }
    
    func alert() {
        UIAlertView.setMessage("是否关闭alertView").addFitstButton("取消").addSecondButton("确认").alertWithButtonClick { (buttonIndex, alert) -> Void in
            print(buttonIndex)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

