//
//  ViewController.swift
//  ZaloCarthageExample
//
//  Created by Nguyen Van Nghia on 5/12/20.
//  Copyright © 2020 Nguyen Van Nghia. All rights reserved.
//

import UIKit
import ZaloSDK

final class ViewController: UIViewController {

    private let loginButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginButton.setTitle("Login with Zalo", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonDidTap(sender:)), for: .touchUpInside)
        
        
    }
    
    @objc private func loginButtonDidTap(sender: UIButton) {
        ZaloSDK.sharedInstance()?.authenticateZalo(with: ZAZAloSDKAuthenTypeViaZaloAppAndWebView, parentController: self, handler: { [weak self] (oauthResponse) in
            guard let self = self, let oauthResponse = oauthResponse else { return }
            if oauthResponse.isSucess {
                
                let oauthCode = oauthResponse.oauthCode
                let userId = oauthResponse.userId
                let displayName = oauthResponse.displayName
                let phoneNumber = oauthResponse.phoneNumber
                let dob = oauthResponse.dob
                
                let message = """
                OAuthCode: \(oauthCode)
                UserId: \(userId)
                DisplayName: \(displayName)
                PhoneNumber: \(phoneNumber)
                DOB: \(dob)
                """
            
                let alertVC = UIAlertController(title: "Login Zalo Info", message: message, preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "Close", style: .default, handler: { (ac) in
                    alertVC.dismiss(animated: true, completion: nil)
                }))
                self.present(alertVC, animated: true, completion: nil)
                
                
            }
        })
    }


}

