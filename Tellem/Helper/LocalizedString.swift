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
    static let email = NSLocalizedString("email", comment: "")
    static let password = NSLocalizedString("password", comment: "")
    static let login = NSLocalizedString("login", comment: "")
    static let dontHaveAnAccount = NSLocalizedString("dontHaveAnAccount", comment: "")
    static let signUp = NSLocalizedString("signUp", comment: "")
    static let invalidEmailWarning = NSLocalizedString("invalidEmailWarning", comment: "")
    static let invalidPasswordWarning = NSLocalizedString("invalidPasswordWarning", comment: "")
    static let confirmEmail = NSLocalizedString("confirmEmail", comment: "")
    static let confirmPassword = NSLocalizedString("confirmPassword", comment: "")
    static let alreadyHaveAnAccount = NSLocalizedString("alreadyHaveAnAccount", comment: "")
    static let emailsDontMatchWarning = NSLocalizedString("emailsDontMatchWarning", comment: "")
    static let passwordsDontMatchWarning = NSLocalizedString("passwordsDontMatchWarning", comment: "")
    static let chats = NSLocalizedString("chats", comment: "")
}
