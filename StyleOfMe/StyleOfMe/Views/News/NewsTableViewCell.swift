//
//  NewsTableViewCell.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/8/21.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var newsVM: NewsViewModel? {
        didSet {
            if let newsVM = newsVM {
                titleLabel.text = newsVM.title
                NewsNetworkManager.shared.getImage(urlString: newsVM.urlToImage) { (data) in
                    guard let data = data else { return }
                    DispatchQueue.main.async {
                        self.newsImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    var newsImageData: Data? {
        didSet {
            if let data = newsImageData {
                newsImage.image = UIImage(data: data)
            }
        }
    }
    
    private lazy var newsImage: ShadowImageView = {
        let iv = ShadowImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(newsImage)
//        backgroundColor = UIColor.rgb(red: 175, green: 233, blue: 239)
//        backgroundColor = UIColor.rgb(red: 64, green: 90, blue: 65)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([newsImage.leadingAnchor.constraint(equalTo: leadingAnchor), newsImage.trailingAnchor.constraint(equalTo: trailingAnchor), newsImage.topAnchor.constraint(equalTo: topAnchor), newsImage.heightAnchor.constraint(equalToConstant: 200)])
        
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16), titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16), titleLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 8), titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
