//
//  LoginViewController.swift
//  AutomaticLabelHeight
//
//  Created by Umamaheshwari on 09/01/20.
//  Copyright © 2020 Umamaheshwari. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //Properties
    @IBOutlet weak var textfieldEmail: RPFloatingPlaceholderTextField!
    @IBOutlet weak var textfieldPassword: RPFloatingPlaceholderTextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var viewErrorEmail: UIView!
    @IBOutlet weak var imageviewError: UIImageView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        imageviewError.image = imageviewError.image?.withRenderingMode(.alwaysTemplate)
        imageviewError.tintColor = UIColor.red
        AppManager.sharedInstance.ViewShadow(MainView: viewEmail)
        AppManager.sharedInstance.ViewShadow(MainView: viewPassword)
        viewEmail.layer.cornerRadius = 4
        viewPassword.layer.cornerRadius = 4
        buttonLogin.layer.cornerRadius = 4
        textfieldEmail.floatingLabelActiveTextColor = Color.selectedFieldBorderColor
        textfieldEmail.floatingLabelInactiveTextColor = Color.unselectedFieldBorderColor
        textfieldPassword.floatingLabelActiveTextColor = Color.selectedFieldBorderColor
        textfieldPassword.floatingLabelInactiveTextColor = Color.unselectedFieldBorderColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        checkTextFieldisEmpty()
    }
    
    @IBAction func handlerToLogin(_ sender: Any) {
        guard let email = textfieldEmail.text, email != "", AppManager.sharedInstance.isValidEmail(email) else {
            UIView.animate(withDuration: 0.3) {
                self.viewErrorEmail.isHidden = false
            }
            return
        }
        UIView.animate(withDuration: 0.3) {
            self.viewErrorEmail.isHidden = true
        }
        let dashboardViewController = DashboardViewController(nibName : "DashboardViewController", bundle : nil)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(dashboardViewController, animated: true)
    }
    
    func changeButtonColor(isEnable: Bool) {
        buttonLogin.backgroundColor = (isEnable) ? Color.selectedFieldBorderColor : Color.unselectedFieldBorderColor
        buttonLogin.isUserInteractionEnabled = (isEnable) ? true : false
    }
    
    //Check Email and Password is empty
    func checkTextFieldisEmpty() {
        if textfieldEmail.text != "" && textfieldPassword.text != "" {
            changeButtonColor(isEnable: true)
        } else {
            changeButtonColor(isEnable: false)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > textField.text!.count {
            return false
        }
        let newLength: Int = (textField.text?.count)! + string.count - range.length
        if (textField == textfieldPassword && textfieldEmail.text != "") || (textField == textfieldEmail && textfieldPassword.text != ""){
            changeButtonColor(isEnable: (newLength > 0))
        } else {
            changeButtonColor(isEnable: false)
        }
        
        return true
    }
}
