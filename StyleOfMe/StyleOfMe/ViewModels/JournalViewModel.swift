//
//  JournalViewModel.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/5/21.
//

import UIKit
import CoreData

protocol JournalViewDelegate: NSObject {
    func parsePersonsSuccess()
    func parsePersonsFailedWithMessage(_ message: String)
}

class JournalViewModel: NSObject {

    private var entries: Array<JournalEntry> {
        didSet {
            self.delegate?.parsePersonsSuccess()
        }
    }

    weak var delegate: JournalViewDelegate?

    init(_ delegate: JournalViewDelegate?) {
        self.delegate = delegate
        self.entries = Array<JournalEntry>()
    }
    var firstLoad = true

    func getEntries() {
        let test = CoreDataStorage.shared.fetchEntries()
        let result = test

        self.entries = test

        print("self entries:",self.entries)
    }

//    func journal(atIndex index: Int) -> JournalViewModel {
//        return JournalViewModel(self.entries[index])
//    }
}
