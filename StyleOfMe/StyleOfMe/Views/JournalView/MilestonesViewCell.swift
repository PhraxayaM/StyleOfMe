//
//  MilestonesView.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 3/4/21.
//

import UIKit



class MilestonesViewCell: UICollectionViewCell {
    static let identifier = "Milestones"
    
    var milestoneIV: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = .red
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(imageLiteralResourceName: "grow")
//        iv.backgroundColor = .red
        return iv
    }()
    
    var completionAmount: UILabel = {
        let label = UILabel()
        label.text = "Amount of times completed: 0"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(14)
        label.sizeToFit()
        return label
    }()
    
    var milestoneGoals: UILabel = {
        let label = UILabel()
        label.text = "Run 2 miles per day. Completed 4 times."
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Created on March 9, 2021"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.clipsToBounds = true
        label.numberOfLines = 0
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(milestoneIV)
        addSubview(dateLabel)
        addSubview(milestoneGoals)
        addSubview(completionAmount)
        setupView()
//        milestoneIV.anchor(top: nil, left: leftAnchor, bottom: nil, right: leftAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 10, width: 50, height: 50)
//        milestoneIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        dateLabel.anchor(top: milestoneIV.bottomAnchor, left: milestoneIV.leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 50)
       
        let seperatorView = UIView()
        seperatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(seperatorView)
        
        seperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {

        setupConstraints()
    }
    
    func configure(_ milestoneViewModel: Milestones) {
        self.milestoneGoals.text = milestoneViewModel.goals
//        self.dateLabel.text = milestoneViewModel.date
//        self.entryText.text = journalViewModel.entry
//        self.emojiIV.image = UIImage(imageLiteralResourceName: journalViewModel.img ?? "drop")
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([milestoneGoals.leadingAnchor.constraint(equalTo: leadingAnchor), milestoneGoals.rightAnchor.constraint(equalTo: rightAnchor), milestoneIV.topAnchor.constraint(equalTo: topAnchor), milestoneGoals.topAnchor.constraint(equalTo: milestoneIV.bottomAnchor, constant: 5), milestoneIV.leftAnchor.constraint(equalTo: leftAnchor), dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor), dateLabel.rightAnchor.constraint(equalTo: rightAnchor), dateLabel.leftAnchor.constraint(equalTo: leftAnchor), completionAmount.leftAnchor.constraint(equalTo: milestoneIV.rightAnchor, constant: 5), completionAmount.rightAnchor.constraint(equalTo: rightAnchor)])

    }
}

