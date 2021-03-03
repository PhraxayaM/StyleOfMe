//
//  JournalVC.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/14/21.
//

import UIKit
import CoreData

class JournalVC: UIViewController, UITextViewDelegate {
    
    private lazy var journalViewDate: JournalViewDate = {
        let hv = JournalViewDate(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 50, height: 50))
        return hv
    }()
    private lazy var journalViewEntry: JournalViewEntry = {
        let hv = JournalViewEntry(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 50, height: 50))
        return hv
    }()
//    var journalList = [Item]()
    var selectedEntry: Item? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
        if(selectedEntry != nil) {
            journalViewEntry.text = selectedEntry?.name
            print("selected", selectedEntry?.name)
        }
    }
    
    
    
    var entryLog = [Item]()
    
    
    
    @objc func saveEntry(_ sender: UIButton) {
        print("button")
        guard let entry = journalViewEntry.text else { return }
        
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        if(selectedEntry == nil) {
            let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
            let newEntry = Item(entity: entity!, insertInto: context)
            newEntry.name = entry
    //        newEntry.date = timestamp
            newEntry.image = emojiStatus
//            print("new entry", newEntry.image)
            do {
                try context.save()
                journalList.insert(newEntry, at: 0)
                navigationController?.popViewController(animated: false)
            }
            catch {
                print("context save error")
            }
        } else {
            //editting
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let entry = result as! Item
                    if(entry == selectedEntry) {
                        entry.name = journalViewEntry.text
                        entry.image = emojiStatus
                        try context.save()
                        navigationController?.popViewController(animated: false)
                    }
                }
            }
            catch {
                print("Fetch Failed")
            }
        }
       
        
            
    }
    
    func setupView() {
        
        view.backgroundColor = UIColor.rgb(red: 199, green: 202, blue: 248)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveEntry(_:)))
        view.addSubview(journalViewDate)
        journalViewDate.translatesAutoresizingMaskIntoConstraints = false
        journalViewDate.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        journalViewDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true

        journalViewDate.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        journalViewDate.widthAnchor.constraint(equalToConstant: 300).isActive = true
        journalViewDate.layer.cornerRadius = 25
        journalViewDate.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .none)
        self.journalViewDate.currentDate.text = timestamp
        view.addSubview(journalViewEntry)
        journalViewEntry.translatesAutoresizingMaskIntoConstraints = false
        journalViewEntry.topAnchor.constraint(equalTo: journalViewDate.topAnchor,constant: 30).isActive = true
        journalViewEntry.leftAnchor.constraint(equalTo: journalViewDate.leftAnchor, constant: 30).isActive = true
        journalViewEntry.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140).isActive = true
        journalViewEntry.widthAnchor.constraint(equalToConstant: 300).isActive = true
        journalViewEntry.layer.cornerRadius = 25
        journalViewEntry.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        journalViewEntry.textColor = UIColor.lightGray

        journalViewEntry.becomeFirstResponder()

        journalViewEntry.selectedTextRange = journalViewEntry.textRange(from: journalViewEntry.beginningOfDocument, to: journalViewEntry.beginningOfDocument)
        
//        view.addSubview(angryEmoji)
        view.addSubview(emojiStatusPick)
//        angryEmoji.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        emojiStatusPick.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emojiStatusPick.bottomAnchor.constraint(equalTo: journalViewEntry.bottomAnchor).isActive = true
        angryEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
        shockedEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
        annoyedEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
        hopefulEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
    }
    
    private lazy var emojiStatusPick: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [angryEmoji, annoyedEmoji, hopefulEmoji, shockedEmoji])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        return sv
    }()
    
    let angryEmoji: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "angry"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let shockedEmoji: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "shocked"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let annoyedEmoji: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "annoyed"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let hopefulEmoji: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "hopeful"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var emojiStatus = "shocked"
    @objc func setupEmoji(sender: UIButton) {
//        print("hello")
//        emojiStatus = "angry"
        switch sender {
        case angryEmoji:
            emojiStatus = "angry"
        case shockedEmoji:
            emojiStatus = "shocked"
        case hopefulEmoji:
            emojiStatus = "hopeful"
        case annoyedEmoji:
            emojiStatus = "annoyed"
        default:
            print("default")
            break;
        }
    }
}
