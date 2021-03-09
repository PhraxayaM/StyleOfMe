//
//  JournalListVC.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/4/21.
//

import UIKit
import CoreData
enum diffSection {
    case journals(viewModels: [JournalEntry])
    case milestones(viewModels: [Milestones])
//    case section3
}

class JournalListVC: UIViewController {
    let cellId = "cell"

    private var collectionView: UICollectionView  = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout {sectionIndex, _ -> NSCollectionLayoutSection? in
        return JournalListVC.createSectionLayout(section: sectionIndex)
    })
    
    private let spinner: UIActivityIndicatorView = {
        let spinner  = UIActivityIndicatorView()
        spinner.tintColor = .red
        return spinner
    }()
    private var sections = [diffSection]()
    var firstLoad = true
    
    let context = CoreDataStorage.shared.persistentContainer.viewContext
    var journalsList: [JournalEntry]?
    var milestoneList: [Milestones]?
    var item: [Item]?
    func fetchCore() {
        do {
//            self.journalsList = try  context.fetch(JournalEntry.fetchRequest())
//            print("journal is", self.journalsList)
//            let test = vm.getEntries()
//            print("journalist before", self.journalsList)
            self.journalsList =  try context.fetch(JournalEntry.fetchRequest())
//            print("journalist after***", self.journalsList)
            self.milestoneList = try context.fetch(Milestones.fetchRequest())
            configModels()
//            print("%%%Sections", sections)
        } catch {
            
        }
        

    }
    var coredat = CoreDataStorage.shared
    
    private func configModels() {
        
//        sections.append(.journals(viewModels: self.journalsList ?? []))
//        sections.append(.milestones(viewModels: self.milestoneList ?? []))
//        print("SECTIONS$$$$$$", sections)
        sections.insert(.milestones(viewModels: self.milestoneList ?? []), at: 0)
        sections.insert(.journals(viewModels: self.journalsList ?? []), at: 0)
        
        
        
    }
    
    func testMilestones() {
        CoreDataStorage.shared.saveMilestones(goals: "saving the goals test")
        do {
            self.milestoneList = try context.fetch(Milestones.fetchRequest())
//            print("milestonelist", self.milestoneList)
            configModels()
//            print("milestonelist AFter", self.milestoneList)
        } catch {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CoreDataStorage.shared.saveJournal(entry: "I'm hungry", date: "March 7th", img: "shocked")
        self.fetchCore()
//        testMilestones()

//        print("entries", coredat.fetchEntries())
        title = "Journal"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(newEntry))
//        view.backgroundColor = .blue
        configCollectionView()
        configModels()
//        print("$$$$$ Milestones",  self.milestoneList ?? "empty" )
        
    }
    
    @objc func newEntry() {
        navigationController?.pushViewController(JournalVC(), animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            print("fetch meee")
            self.fetchCore()
            self.configModels()
            self.collectionView.reloadData()
        }
    }
   
    
    override func viewDidLayoutSubviews() {
        self.collectionView.frame = view.bounds
    }
    
    private func configCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(JournalCell .self, forCellWithReuseIdentifier: "cell")
        collectionView.register(MilestonesViewCell.self, forCellWithReuseIdentifier: MilestonesViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.rgb(red: 211, green: 213, blue: 212)
    }
    
    private static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        switch section{
        case 0:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(250), heightDimension: .absolute(250)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let verticalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(120)), subitem: item, count: 2)
            
            let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(390)), subitem: verticalgroup, count: 1)
            
            let section = NSCollectionLayoutSection(group: horizontalgroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 1:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let verticalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(300)), subitem: item, count: 2)
            
            let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(390)), subitem: verticalgroup, count: 1)
            
            let section = NSCollectionLayoutSection(group: horizontalgroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 2:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
               
               item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
               
               
               let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(390)), subitem: item, count: 1)
               
               let section = NSCollectionLayoutSection(group: group)
               section.orthogonalScrollingBehavior = .continuous
               return section
        default:
               let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(150), heightDimension: .absolute(150)))
               
               item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
               
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(390)), subitem: item, count: 2)
               
               let section = NSCollectionLayoutSection(group: group)
               section.orthogonalScrollingBehavior = .continuous
               return section
        }
    }
    
}

extension JournalListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("sections", sections[section])
        let type =  sections[section]
        switch type {
        case .journals(let viewModels):
//            print("journals", viewModels.count)
            return viewModels.count
        case .milestones(let viewModels):
//            print("milestones", viewModels.count)
            return viewModels.count
        }

//        return self.journalsList?.count ?? 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let type =  sections[indexPath.section]
        switch type {
        case .journals(let viewModels):
            let user = viewModels[indexPath.row]
//            print("user", user)
            let viewEntry = JournalVC()
            viewEntry.selectedJournal = user
            viewEntry.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(viewEntry, animated: false)
            print(viewModels[indexPath.row].entry)
            break
        case .milestones(let viewModels):
            print(viewModels[indexPath.row].goals)
            break
        }
    
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let type =  sections[indexPath.section]
        switch type {
        case .journals(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? JournalCell else {return UICollectionViewCell()}
            cell.backgroundColor = UIColor.rgb(red: 124, green: 108, blue: 144)
            cell.layer.borderWidth = 2
            cell.configure(viewModels[indexPath.row])
            return cell
        case .milestones(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MilestonesViewCell.identifier, for: indexPath) as? MilestonesViewCell else {return UICollectionViewCell()}
            cell.backgroundColor = .purple
            cell.layer.borderWidth = 2
            cell.configure(viewModels[indexPath.row
            ])
            return cell
        }
    }
}
