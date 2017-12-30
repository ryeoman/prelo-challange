//
//  LoginViewController.swift
//  prelo-challange
//
//  Created by Homade on 12/30/17.
//  Copyright © 2017 -. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var validationMessage: String = ""
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var usernameOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func doFacebookLogin(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Still in Development", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return
    }
    @IBAction func doTwitterLogin(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Still in Development", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        return
    }
    
    @IBAction func doLogin(_ sender: Any) {
        dismissKeyboard()
        
        if !NetworkReachability.isConnectedToNetwork(){
            let alert = UIAlertController(title: "warning", message: "Please check your network connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if !validateTextField(){
            let alert = UIAlertController(title: "info", message: validationMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        startLoading()
        let loginParam = LoginParam(username_or_email: usernameOrEmailTextField.text!, password: passwordTextField.text!)
        
        LoginRequest.call(loginParam: loginParam) { (success, login) in
            if success{
                self.performSegue(withIdentifier: "goToLoveList", sender: nil)
            }else{
                let alert = UIAlertController(title: "error", message: login?._message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            self.stopLoading()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameOrEmailTextField.delegate = self
        passwordTextField.delegate = self
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startLoading(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopLoading(){
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        UIApplication.shared.endIgnoringInteractionEvents()
    }

    @objc func dismissKeyboard(){
        self.usernameOrEmailTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
    func validateTextField() -> Bool{
        
        if usernameOrEmailTextField.text!.isEmpty{
            validationMessage = "username or email cannot be empty"
            return false
        }
        
        if usernameOrEmailTextField.text!.count < 4{
            validationMessage = "username or email must be a minimum of 4 characters"
            return false
        }
        
        if passwordTextField.text!.count < 6{
            validationMessage = "password must be a minimum of 6 characters"
            return false
        }
        
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(usernameOrEmailTextField){
            usernameOrEmailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }else if textField.isEqual(passwordTextField){
            passwordTextField.resignFirstResponder()
        }
        return false
    }
}
