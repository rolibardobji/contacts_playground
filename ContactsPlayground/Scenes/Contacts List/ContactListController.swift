//
//  ContactListController.swift
//  ContactsPlayground
//
//  Created by Ronny Libardo Bustos Jiménez on 5/23/19.
//  Copyright © 2019 Ronny Libardo Bustos Jiménez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContactListController: UIViewController {

    @IBOutlet weak var contactsTableView: UITableView!
    
    private let editContactSegue = "EditContact"
    var contactsListViewModel = ContactsListViewModel(contactsFile: "contacts")
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        contactsListViewModel.start()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contactsListViewModel.update()
    }
    
    private func setupBindings() {
        contactsListViewModel.contacts
            .bind(to: contactsTableView.rx.items(cellIdentifier: "ContactCell",
                                                 cellType: UITableViewCell.self)) { _, model, cell in
                cell.textLabel?.text = "\(model.firstName) \(model.lastName)" }
            .disposed(by: disposeBag)
        
        contactsTableView.rx.itemSelected
            .subscribe(onNext: {
                self.performSegue(withIdentifier: self.editContactSegue, sender: self.contactsListViewModel.contact(at: $0.row)) })
            .disposed(by: disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.editContactSegue {
            let editContactViewModel = EditContactViewModel(contact: sender as? Contact)
            let editContactController = segue.destination as! EditContactController
            editContactController.editContactViewModel = editContactViewModel
        }
    }

}
