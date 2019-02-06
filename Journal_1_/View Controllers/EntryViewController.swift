//
//  EntryViewController.swift
//  Journal_1_
//
//  Created by Taylor Bills on 2/6/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    
    // MARK: -  Properties
    
    var entry: Entry?
    
    
    // MARK: -  Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    // MARK: -  Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = self.titleTextField.text, let body = self.bodyTextView.text else { return }
        if entry != nil {
            EntryController.shared.update(entry: self.entry!, with: title, and: body)
        } else {
            EntryController.shared.addEntryWith(title: title, body: body)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    // MARK: -  Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    // MARK: -  TextFieldDelegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
    
    // MARK: -  Update Views
    
    func updateViews() {
        if entry == entry {
            titleTextField.text = entry?.title
            bodyTextView.text = entry?.body
        }
    }
}
