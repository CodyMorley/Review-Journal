//
//  CreateEntryViewController.swift
//  Journal
//
//  Created by Cody Morley on 8/11/20.
//  Copyright © 2020 Cody Morley. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var bodyView: UITextView!
    
    var entryController = EntryController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func cancel(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let title = titleField.text,
            let body = bodyView.text,
            !title.isEmpty,
            title != "",
            !body.isEmpty,
            body != "" else {
                NSLog("Need a title and body to save an Entry.")
                return
        }
        
        entryController.createEntry(title: title,
                                    body: body)
        navigationController?.dismiss(animated: true,
                                      completion: nil)
    }
}
