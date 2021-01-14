//
//  HeaderView.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/8/21.
//

import UIKit

class HeaderView: UIView {
    
    private var fontSize: CGFloat
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.textColor = .white
        return label
    }()
    
    private lazy var headerCircleImage: UIImageView = {
        let IV = UIImageView()
        IV.translatesAutoresizingMaskIntoConstraints = false
        IV.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        IV.image = UIImage(systemName: "settings", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return IV
    }()
    
    private lazy var plusImage: UIImageView = {
        let IV = UIImageView()
        IV.translatesAutoresizingMaskIntoConstraints = false
        IV.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        IV.image = UIImage(systemName: "settings", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return IV
    }()
    
    private lazy var subheadlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Top Headlines"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white

        return label
    }()
    
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerCircleImage, headingLabel, plusImage, subheadlineLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "menuicon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(fontSize:CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        addSubview(menuButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        menuButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        menuButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        NSLayoutConstraint.activate([headerStackView.leadingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: 130), headerStackView.topAnchor.constraint(equalTo: topAnchor)] )
        
        NSLayoutConstraint.activate([subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor), subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 8), subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
