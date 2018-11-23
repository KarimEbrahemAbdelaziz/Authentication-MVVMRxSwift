//
//  LoginViewModel.swift
//  Authentication-MVVMRxSwift
//
//  Created by Karim Ebrahem on 11/23/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel {
    
    // Inputs
    let emailText = Variable<String>("")
    let passwordText = Variable<String>("")
    
    // Outputs
    var isLoginable: Observable<Bool> {
        return Observable
            .combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
                !email.isEmpty && !password.isEmpty
        }
    }
    
}
