//
//  JournalViewEntry.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 2/13/21.
//

import Foundation
import UIKit

class JournalViewEntry: UITextView {

    init(frame: CGRect) {
        super.init(frame: frame, textContainer: nil)
        
        backgroundColor = UIColor.rgb(red: 245, green: 224, blue: 186)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
