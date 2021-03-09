//
//  JournalCell.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 2/16/21.
//
import UIKit
class JournalCell: UICollectionViewCell {
    
    
    var emojiIV: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = .red
        iv.clipsToBounds = true
        iv.image = UIImage(imageLiteralResourceName: "shocked")
        return iv
    }()
    var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "date"
        return label
    }()
    var entryText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
//        label.backgroundColor = .red
        return label
    }()
    
    var journalIconIV: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = .red
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(imageLiteralResourceName: "book")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(entryText)
        addSubview(emojiIV)
        addSubview(dateLabel)
        addSubview(journalIconIV)
        entryText.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        emojiIV.anchor(top: nil, left: leftAnchor, bottom: nil, right: entryText.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 10, width: 50, height: 50)
        emojiIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dateLabel.anchor(top: nil, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 50)
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
       
        let seperatorView = UIView()
        seperatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(seperatorView)
        
        seperatorView.anchor(top: nil, left: entryText.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(entryText)

        setupConstraints()
    }
    func configure(_ journalViewModel: JournalEntry) {
        self.dateLabel.text = journalViewModel.date
        self.entryText.text = journalViewModel.entry
        self.emojiIV.image = UIImage(imageLiteralResourceName: journalViewModel.img ?? "drop")
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([entryText.leadingAnchor.constraint(equalTo: leadingAnchor), entryText.rightAnchor.constraint(equalTo: trailingAnchor), emojiIV.topAnchor.constraint(equalTo: topAnchor), entryText.heightAnchor.constraint(equalToConstant: 200)])
        NSLayoutConstraint.activate([ journalIconIV.topAnchor.constraint(equalTo: topAnchor)])
        
    }
    
}
