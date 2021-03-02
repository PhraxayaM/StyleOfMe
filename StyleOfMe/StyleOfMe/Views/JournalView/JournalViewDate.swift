//
//  JournalView.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 2/13/21.
//


import UIKit
class JournalViewDate: UIView {
   
//    private var fontSize: CGFloat
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addSubview(currentDate)
        NSLayoutConstraint.activate([currentDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), currentDate.trailingAnchor.constraint(equalTo: currentDate.trailingAnchor,constant:  -20), currentDate.topAnchor.constraint(equalTo: topAnchor, constant: 0)])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let currentDate: UILabel = {
           let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "...Date"
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 26, weight: .heavy)
            label.textColor = .white

            return label
        }()
}

