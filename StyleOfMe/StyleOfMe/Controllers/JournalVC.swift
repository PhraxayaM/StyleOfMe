//
//  JournalVC.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/14/21.
//

import UIKit

class JournalVC: UIViewController {
    
    private lazy var journalViewDate: JournalViewDate = {
        let hv = JournalViewDate(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 50, height: 50))
        return hv
    }()
    private lazy var journalViewEntry: JournalViewEntry = {
        let hv = JournalViewEntry(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 50, height: 50))
        return hv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 199, green: 202, blue: 248)
        view.addSubview(journalViewDate)
        journalViewDate.translatesAutoresizingMaskIntoConstraints = false
        journalViewDate.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        journalViewDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
//        journalView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        journalViewDate.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        journalViewDate.widthAnchor.constraint(equalToConstant: 300).isActive = true
        journalViewDate.layer.cornerRadius = 25
        journalViewDate.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        view.addSubview(journalViewEntry)
        journalViewEntry.translatesAutoresizingMaskIntoConstraints = false
        journalViewEntry.topAnchor.constraint(equalTo: journalViewDate.topAnchor,constant: 30).isActive = true
        journalViewEntry.leftAnchor.constraint(equalTo: journalViewDate.leftAnchor, constant: 30).isActive = true
//        journalView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        journalViewEntry.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        journalViewEntry.widthAnchor.constraint(equalToConstant: 300).isActive = true
        journalViewEntry.layer.cornerRadius = 25
        journalViewEntry.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]

    }
}
