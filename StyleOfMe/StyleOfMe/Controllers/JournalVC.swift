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
    var selectedEntry: Item? = nil
    var selectedJournal: JournalEntry? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        if(selectedJournal != nil) {
            journalViewEntry.text = selectedJournal?.entry
            print("selected", selectedJournal?.entry)
        }
    }
    
    
    
    var entryLog = [Item]()
    
    @objc func saveJournal(_ sender: UIButton) {
        guard let entry = journalViewEntry.text else { return }
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .none)
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        let journalContext = CoreDataStorage.shared.persistentContainer.viewContext
        if(selectedEntry == nil) {
            let journalentity = NSEntityDescription.entity(forEntityName: "JournalEntry", in: journalContext)
//            let entryJournal = JournalEntry(entity: journalentity!, insertInto: journalContext)
//            entryJournal.entry = entry
//            entryJournal.img = emojiStatus
//            entryJournal.date = timestamp
            do {
                try context.save()
                CoreDataStorage.shared.saveJournal(entry: entry, date: timestamp, img: emojiStatus)
                
                
                print("Fetching coredata", CoreDataStorage.shared.fetchEntries())
                navigationController?.popViewController(animated: false)
            }
            catch {
                print("context save error")
            }
        } else {
            //editting
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "JournalEntry")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let entry = result as! JournalEntry
                    if(entry == selectedEntry) {
                        entry.entry = journalViewEntry.text
                        entry.img = emojiStatus
                        
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
    
    
    @objc func saveEntry(_ sender: UIButton) {
        guard let entry = journalViewEntry.text else { return }
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .medium, timeStyle: .none)
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        if(selectedEntry == nil) {
            let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
            let newEntry = Item(entity: entity!, insertInto: context)
            newEntry.name = entry
            newEntry.date = timestamp
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
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveEntry(_:)))
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveJournal(_:)))
        
//        let saveJournal = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(saveEntry(_:)))
        let saveJournal = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveJournal(_:)))
        let addMilestone = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMilestone(_:)))
        navigationItem.rightBarButtonItems = [addMilestone, saveJournal]
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
        
        view.addSubview(emojiStatusPick)

        emojiStatusPick.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emojiStatusPick.bottomAnchor.constraint(equalTo: journalViewEntry.bottomAnchor).isActive = true
        angryEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
        shockedEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
        annoyedEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
        hopefulEmoji.addTarget(self, action: #selector(setupEmoji), for: .touchUpInside)
    }
    @objc func addMilestone(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Milestone", message: "What milestone would you like to add?", preferredStyle: .alert)
        print("milestooone")
        alert.addTextField()
        let milestoneContext = CoreDataStorage.shared.persistentContainer.viewContext
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            let tf = alert.textFields![0]
            let milestone = Milestones(context: milestoneContext)
            milestone.goals = tf.text
            do {
                try milestoneContext.save()
            } catch {
                
            }
        }
        
        alert.addAction(saveButton)
        self.present(alert, animated: true, completion: nil)
        
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
