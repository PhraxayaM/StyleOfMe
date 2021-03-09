//
//  JournalList.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 2/17/21.
//

import UIKit
import CoreData

var journalList = [Item]()


class JournalList: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let cellId = "cellId"
    
    var firstLoad = true
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Journal"
        collectionView.backgroundColor = UIColor.rgb(red: 245, green: 224, blue: 186)
        collectionView.delegate = self
        collectionView.dataSource = self
        if (firstLoad) {
            firstLoad = false
            let appDeleg = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDeleg.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let entry = result as! Item
                    journalList.insert(entry, at: 0)
                }
            }
            catch {
                print("Fetch Failed")
            }
        }
        let navBar = navigationController?.navigationBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newEntry))
        
        collectionView.register(JournalCell.self, forCellWithReuseIdentifier: cellId)
                
        collectionView.alwaysBounceVertical = true
        collectionView.keyboardDismissMode  = .onDrag
        
    }
    
    @objc func newEntry() {
        navigationController?.pushViewController(JournalVC(), animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
            self.collectionView.reloadData()
        print("reloading", journalList.count)
        print(journalList)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = journalList[indexPath.item]
        let viewEntry = JournalVC()
        viewEntry.selectedEntry = user
        viewEntry.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(viewEntry, animated: false)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return journalList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! JournalCell
        
        
        
        cell.entryText.text = journalList[indexPath.row].name
        cell.dateLabel.text = journalList[indexPath.row].date
        let emojiImage = journalList[indexPath.row].image
        cell.emojiIV.image = UIImage.init(imageLiteralResourceName: emojiImage ?? "temp")
        cell.clipsToBounds = true
        return cell
    }
    
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (view.frame.width-20)/2
        
 
        return CGSize(width: width, height: 100)
    }
    
    
    
}

