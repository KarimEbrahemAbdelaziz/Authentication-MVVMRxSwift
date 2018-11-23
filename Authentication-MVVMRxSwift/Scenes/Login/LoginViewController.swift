//
//  ViewController.swift
//  Authentication-MVVMRxSwift
//
//  Created by Karim Ebrahem on 11/22/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    var loginViewModel: LoginViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginViewModel = LoginViewModel()
        
        emailTextField
            .rx
            .text
            .orEmpty
            .bind(to: loginViewModel.emailText)
            .disposed(by: disposeBag)
        
        passwordTextField
            .rx
            .text
            .orEmpty
            .bind(to: loginViewModel.passwordText)
            .disposed(by: disposeBag)
        
        loginViewModel.isLoginable
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        loginViewModel.isLoginable
            .subscribe(onNext: { [weak self] isLoginable in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.loginButton.backgroundColor = isLoginable ? UIColor(red: 105.0/255.0, green: 185.0/255.0, blue: 151.0/255.0, alpha: 1.0) : .gray                
            })
            .disposed(by: disposeBag)
    }

    @IBAction func loginAciton(_ sender: UIButton) {
        print("Enabled")
    }
    
}
