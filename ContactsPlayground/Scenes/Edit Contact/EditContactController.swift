//
//  EditContactController.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RxSwift

class EditContactController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    var editContactViewModel = EditContactViewModel(contact: Contact())
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        editContactViewModel.start()
    }
    
    func setupBindings() {
        firstNameTextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.firstName)
            .disposed(by: disposeBag)
        lastNameTextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.lastName)
            .disposed(by: disposeBag)
        phoneTextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.phone)
            .disposed(by: disposeBag)
        address1TextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.address1)
            .disposed(by: disposeBag)
        address2TextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.address2)
            .disposed(by: disposeBag)
        cityTextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.city)
            .disposed(by: disposeBag)
        stateTextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.state)
            .disposed(by: disposeBag)
        zipCodeTextField.rx.text
            .orEmpty
            .bind(to: editContactViewModel.zipCode)
            .disposed(by: disposeBag)
        
        editContactViewModel.firstName
            .bind(to: firstNameTextField.rx.text)
            .disposed(by: disposeBag)
        editContactViewModel.lastName
            .bind(to: lastNameTextField.rx.text)
            .disposed(by: disposeBag)
        editContactViewModel.phone
            .bind(to: phoneTextField.rx.text)
            .disposed(by: disposeBag)
        editContactViewModel.address1
            .bind(to: address1TextField.rx.text)
            .disposed(by: disposeBag)
        editContactViewModel.address2
            .bind(to: address2TextField.rx.text)
            .disposed(by: disposeBag)
        editContactViewModel.city
            .bind(to: cityTextField.rx.text)
            .disposed(by: disposeBag)
        editContactViewModel.state
            .bind(to: stateTextField.rx.text)
            .disposed(by: disposeBag)
        editContactViewModel.zipCode
            .bind(to: zipCodeTextField.rx.text)
            .disposed(by: disposeBag)
    }

    @IBAction func dismissKeyboard(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func save(_ sender: UIButton) {
        editContactViewModel.save()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func remove(_ sender: UIButton) {
        editContactViewModel.remove()
        navigationController?.popViewController(animated: true)
    }
    
}
