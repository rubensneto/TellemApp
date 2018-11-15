//
//  SignUpViewControllerTests.swift
//  TellemTests
//
//  Created by User on 15/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class SignUpViewControllerTests: XCTestCase {

    var signUpVC: SignUpViewController!
    
    override func setUp() {
        signUpVC = SignUpViewController()
        _ = signUpVC.view
    }

    override func tearDown() {
    }
    
    func testPlaceHolders() {
        let viewModel = signUpVC.viewModel
        XCTAssertEqual(signUpVC.emailTextField.placeholder, viewModel?.emailPlaceHolder)
        XCTAssertEqual(signUpVC.passwordTextField.placeholder, viewModel?.passwordPlacehoder)
    }
    
    func testButtonTitles() {
        let viewModel = signUpVC.viewModel
        XCTAssertEqual(signUpVC.loginButton.titleLabel!.text, viewModel?.loginButtonTitle)
        XCTAssertEqual(signUpVC.signUpButton.titleLabel!.text, viewModel?.signUpButtonTitle)
    }
    
    func testLabelText(){
        let viewModel = signUpVC.viewModel
        XCTAssertEqual(signUpVC.haveAnAccountLabel.text, viewModel?.haveAnAccountText)
    }
}
