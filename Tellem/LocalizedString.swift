//
//  LocalizedString.swift
//  Tellem
//
//  Created by User on 15/12/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

//
// A convenience enum to centralize Localized Strings and facilitate its use
//

import Foundation

struct LocalizedString {
    static let email = "email".localize()
    static let password = "password".localize()
    static let login = "login".localize()
    static let dontHaveAnAccount = "dontHaveAnAccount".localize()
    static let signUp = "signUp".localize()
    static let invalidEmailWarning = "invalidEmailWarning".localize()
    static let invalidPasswordWarning = "invalidPasswordWarning".localize()
    static let confirmEmail = "confirmEmail".localize()
    static let confirmPassword = "confirmPassword".localize()
    static let alreadyHaveAnAccount = "alreadyHaveAnAccount".localize()
    static let emailsDontMatchWarning = "emailsDontMatchWarning".localize()
    static let passwordsDontMatchWarning = "passwordsDontMatchWarning".localize()
}
