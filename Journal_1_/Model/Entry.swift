//
//  Entry.swift
//  Journal_1_
//
//  Created by Taylor Bills on 2/6/19.
//  Copyright © 2019 Taylor Bills. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    
    // MARK: -  Equatable
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title &&
        lhs.body == rhs.body
    }
    
    
    // MARK: -  Properties
    
    var title: String
    var body: String
    
    
    // MARK: -  Initializer
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
