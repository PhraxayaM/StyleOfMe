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
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .yellow
        addSubview(titleLabel)
        addSubview(emojiIV)

//        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.anchor(top: nil, left: emojiIV.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: frame.width, height: frame.height)
        titleLabel.layer.cornerRadius = 50/2
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(emojiIV)
        emojiIV.anchor(top: nil, left: leftAnchor, bottom: nil, right: titleLabel.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 10, width: 50, height: 50)
        emojiIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
       
        let seperatorView = UIView()
        seperatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(seperatorView)
        
        seperatorView.anchor(top: nil, left: titleLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
//        addSubview(newsImage)
        backgroundColor = UIColor.rgb(red: 175, green: 233, blue: 239)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor), titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor), titleLabel.topAnchor.constraint(equalTo: topAnchor), titleLabel.heightAnchor.constraint(equalToConstant: 200)])
        
    }
}
