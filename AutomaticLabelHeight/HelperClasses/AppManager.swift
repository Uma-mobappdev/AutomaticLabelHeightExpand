//
//  AppManager.swift
//  MachineTest
//
//  Created by Umamaheshwari on 09/01/20.
//  Copyright © 2020 Umamaheshwari. All rights reserved.
//

import Foundation

class AppManager: NSObject {
    
    class var sharedInstance: AppManager {
        struct Static {
            static let instance: AppManager = AppManager()
        }
        return Static.instance
    }
    
    //MARK: Email Vaildation
    func isValidEmail(_ checkString: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: checkString)
    }
    
    //ViewShadow
    func ViewShadow(MainView: UIView) {
        MainView.layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.49).cgColor
        MainView.layer.shadowOpacity = 4
        MainView.layer.shadowRadius = 2.0
        MainView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        MainView.layer.borderWidth = 1.0
        MainView.layer.borderColor =  UIColor(red: 222.0/255, green: 225.0/255, blue: 227.0/255, alpha: 0.8).cgColor
    }
}

