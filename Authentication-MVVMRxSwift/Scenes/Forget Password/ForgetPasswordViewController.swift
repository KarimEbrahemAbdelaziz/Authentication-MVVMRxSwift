//
//  ForgetPasswordViewController.swift
//  Authentication-MVVMRxSwift
//
//  Created by Karim Ebrahem on 11/22/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    let forgetPasswordViewModel = ForgetPasswordViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField
            .rx
            .text
            .orEmpty
            .bind(to: forgetPasswordViewModel.emailText)
            .disposed(by: disposeBag)
        
        forgetPasswordViewModel
            .isResetable
            .bind(to: resetButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        forgetPasswordViewModel.isResetable
            .subscribe(onNext: { [weak self] isResetable in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.resetButton.backgroundColor = isResetable ? UIColor(red: 105.0/255.0, green: 185.0/255.0, blue: 151.0/255.0, alpha: 1.0) : UIColor.gray
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        print("Reset Enabled")
    }

}
