//
//  NewContactController.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RxSwift

class NewContactController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    var newContactViewModel = NewContactViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    func setupBindings() {
        firstNameTextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.firstName)
            .disposed(by: disposeBag)
        lastNameTextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.lastName)
            .disposed(by: disposeBag)
        phoneTextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.phone)
            .disposed(by: disposeBag)
        address1TextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.address1)
            .disposed(by: disposeBag)
        address2TextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.address2)
            .disposed(by: disposeBag)
        cityTextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.city)
            .disposed(by: disposeBag)
        stateTextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.state)
            .disposed(by: disposeBag)
        zipCodeTextField.rx.text
            .orEmpty
            .bind(to: newContactViewModel.zipCode)
            .disposed(by: disposeBag)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
        view.endEditing(true)
    }

    @IBAction func done(_ sender: UIButton) {
        newContactViewModel.save()
        navigationController?.popViewController(animated: true)
    }
    
}
