//
//  RegisterViewModel.swift
//  Authentication-MVVMRxSwift
//
//  Created by Karim Ebrahem on 11/24/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import Foundation
import RxSwift

class RegisterViewModel {
    
    // Inputs
    let nameText = Variable<String>("")
    let emailText = Variable<String>("")
    let passwordText = Variable<String>("")
    
    // Outputs
    var isRegisterable: Observable<Bool> {
        return Observable
            .combineLatest(nameText.asObservable(), emailText.asObservable(), passwordText.asObservable()) { name, email, password in
                !name.isEmpty && !email.isEmpty && !password.isEmpty
        }
    }
    
}
