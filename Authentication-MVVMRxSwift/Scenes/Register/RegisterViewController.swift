//
//  RegisterViewController.swift
//  Authentication-MVVMRxSwift
//
//  Created by Karim Ebrahem on 11/22/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    let registerViewModel = RegisterViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField
            .rx
            .text
            .orEmpty
            .bind(to: registerViewModel.nameText)
            .disposed(by: disposeBag)
        
        emailTextField
            .rx
            .text
            .orEmpty
            .bind(to: registerViewModel.emailText)
            .disposed(by: disposeBag)
        
        passwordTextField
            .rx
            .text
            .orEmpty
            .bind(to: registerViewModel.passwordText)
            .disposed(by: disposeBag)
        
        registerViewModel
            .isRegisterable
            .bind(to: registerButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        registerViewModel.isRegisterable.subscribe(onNext: { [weak self] isRegisterable in
            guard let strongSelf = self else {
                return
            }
            strongSelf.registerButton.backgroundColor = isRegisterable ? UIColor(red: 105.0/255.0, green: 185.0/255.0, blue: 151.0/255.0, alpha: 1.0) : UIColor.gray
        })
        .disposed(by: disposeBag)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        print("Register Enabled")
    }

}
