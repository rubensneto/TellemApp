//
//  LoginViewControllerTests.swift
//  TellemTests
//
//  Created by User on 10/11/2018.
//  Copyright © 2018 Rubens Neto. All rights reserved.
//

import XCTest
@testable import Tellem

class LoginViewControllerTests: XCTestCase {
    
    var loginVC: LoginViewController!

    override func setUp() {
        loginVC = LoginViewController()
        _ = loginVC.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPlaceHolders() {
        let viewModel = loginVC.viewModel
        XCTAssertEqual(loginVC.emailTextField.placeholder, viewModel?.emailPlaceHolder)
        XCTAssertEqual(loginVC.passwordTextField.placeholder, viewModel?.passwordPlacehoder)
    }
    
    func testButtonTitles() {
        let viewModel = loginVC.viewModel
        XCTAssertEqual(loginVC.loginButton.titleLabel!.text, viewModel?.loginButtonTitle)
        XCTAssertEqual(loginVC.signUpButton.titleLabel!.text, viewModel?.signUpButtonTitle)
    }
    
    func testLabelText(){
        let viewModel = loginVC.viewModel
        XCTAssertEqual(loginVC.haveAnAccountLabel.text, viewModel?.haveAnAccountText)
    }

}
