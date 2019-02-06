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
    static let shared = EntryController()
    
    
    // MARK: -  Initializer
    
    init() {
        loadFromPersistentStorage()
    }
    // MARK: -  CRUD
  
    func addEntryWith(title: String, body: String) {
        let newEntry = Entry(title: title, body: body)
        entries.insert(newEntry, at: 0)
        saveToPersistence()
    }
    
    func removeEntry(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistence()
    }
    
    func update(entry: Entry, with NewTitle: String, and newBody: String) {
        entry.title = NewTitle
        entry.body = newBody
        saveToPersistence()
    }
    
    
    // MARK: -  Persistence
    
    //Save Location
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "journal.json"
        let url = documentDirectory.appendingPathComponent(fileName)
        return url
    }
    
    // Save Files
    func saveToPersistence() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving to disk: \(error.localizedDescription)")
        }
    }
    
    // Load Files
    func loadFromPersistentStorage() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data.init(contentsOf: fileURL())
            let loadedData = try jsonDecoder.decode([Entry].self, from: data)
            self.entries = loadedData
        } catch let error {
            print("Error loading from disk \(error.localizedDescription)")
        }
    }
}
