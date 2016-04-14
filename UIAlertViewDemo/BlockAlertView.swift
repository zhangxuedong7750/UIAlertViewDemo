//
//  BlockAlertView.swift
//  UIAlertViewDemo
//
//  Created by 张雪东 on 16/4/14.
//  Copyright © 2016年 张雪东. All rights reserved.
//

import UIKit

class BlockAlertView: UIAlertView,UIAlertViewDelegate{

    var completion:((buttonIndex:Int,alert:UIAlertView) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if let block = completion{
            block(buttonIndex: buttonIndex, alert: alertView)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIAlertView{

    static func setMessage(msg:String) -> UIAlertView{
        let alert = BlockAlertView()
        alert.message = msg
        return alert
    }
    
    func addAlertStyle(style:UIAlertViewStyle) -> UIAlertView{
        self.alertViewStyle = style
        return self
    }
    
    func addTitle(title:String) -> UIAlertView{
        self.title = title
        return self;
    }
    
    func addFitstButton(btnTitle:String) -> UIAlertView{
        self.addButtonWithTitle(btnTitle)
        return self
    }
    
    func addSecondButton(btnTitle:String) -> UIAlertView{
        self.addButtonWithTitle(btnTitle)
        return self
    }
    
    func addButtons(btnTitles:[String]) -> UIAlertView{
        for title in btnTitles{
            self.addButtonWithTitle(title)
        }
        return self
    }
    
    func addButtonClickEvent(clickButton:((buttonIndex:Int,alert:UIAlertView) -> Void)?) -> UIAlertView{
        if let alert = self as? BlockAlertView{
            alert.completion = clickButton
        }
        return self
    }
    
    func alertWithButtonClick(clickButton:((buttonIndex:Int,alert:UIAlertView)->Void)?){
        if let alert = self as? BlockAlertView{
            alert.completion = clickButton
            alert.show()
        }
    }
}
