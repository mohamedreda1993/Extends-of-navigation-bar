//
//  ExtendNavigationBar.swift
//
//  Created by Mohamed reda on 9/10/18.
//  Copyright © fci. All rights reserved.
//
import UIKit

class ExtendNavigationBar: UINavigationBar {

    
    // NavigationBar height
    var customHeight : CGFloat = 44
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        if UIScreen.main.bounds.size.width < 768 { //IPHONE
            customHeight = 44
            
            //Code For Change NavigationBar Font Size and Color
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 25)!,NSAttributedStringKey.foregroundColor : UIColor.white]

            
        } else { //IPAD
            customHeight = 80
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 50)!,NSAttributedStringKey.foregroundColor : UIColor.white]
        }
        
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        //Code for Change UnSafe Area Background Color
            guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
            statusBar.backgroundColor = UIColor(red: 47.0/255, green: 167.5/255, blue: 75.0/255, alpha: 1)
        
        if UIScreen.main.bounds.size.width < 768 { //IPHONE
            customHeight = 44
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 25)!,NSAttributedStringKey.foregroundColor : UIColor.white]
            
        } else { //IPAD
            customHeight = 80
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 50)!,NSAttributedStringKey.foregroundColor : UIColor.white]
            
        }
        
        let y = UIApplication.shared.statusBarFrame.height
        frame = CGRect(x: frame.origin.x, y:  y, width: frame.size.width, height: customHeight)
        
        for subview in self.subviews {
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground") {
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                subview.backgroundColor = UIColor(red: 47.0/255, green: 167.5/255, blue: 75.0/255, alpha: 1)
            }
            
            stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarContent") {
                subview.frame = CGRect(x: subview.frame.origin.x, y: 20, width: subview.frame.width, height: customHeight)
                subview.backgroundColor = UIColor(red: 47.0/255, green: 167.5/255, blue: 75.0/255, alpha: 1)
            }
        }
    }  

}
