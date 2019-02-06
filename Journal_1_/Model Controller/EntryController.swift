//
//  EntryController.swift
//  Journal_1_
//
//  Created by Taylor Bills on 2/6/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: -  Properties
    
    var entries: [Entry] = []
    
    
    // MARK: -  CRUD
  
    func addEntryWith(title: String, body: String) {
        let newEntry = Entry(title: title, body: body)
        entries.append(newEntry)
    }
    
    func removeEntry(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
    }
    
    func update(entry: Entry, with NewTitle: String, and newBody: String) {
        entry.title = NewTitle
        entry.body = newBody
    }
}
