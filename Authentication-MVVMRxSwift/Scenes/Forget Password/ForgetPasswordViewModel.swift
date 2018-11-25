//
//  ForgetPasswordViewModel.swift
//  Authentication-MVVMRxSwift
//
//  Created by Karim Ebrahem on 11/24/18.
//  Copyright © 2018 KarimEbrahem. All rights reserved.
//

import Foundation
import RxSwift

class ForgetPasswordViewModel {
    
    // Inputs
    let emailText = Variable<String>("")
    
    // Outputs
    var isResetable: Observable<Bool> {
        return emailText.asObservable().flatMap({ (value) -> Observable<Bool> in
            return Observable.of(!value.isEmpty)
        })
    }
    
}
