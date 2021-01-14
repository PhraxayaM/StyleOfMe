//
//  ShadowImageView.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/8/21.
//

import UIKit

final class ShadowImageView: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var baseView: UIView = {
        let uv = UIView()
        uv.translatesAutoresizingMaskIntoConstraints = false
        uv.backgroundColor = .clear
        uv.layer.shadowColor = UIColor.black.cgColor
        uv.layer.shadowOffset = CGSize(width: 5, height: 5)
        uv.layer.shadowOpacity = 0.7
        uv.layer.shadowRadius = 10
        return uv
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(baseView)
        baseView.addSubview(imageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        [baseView, imageView].forEach { (view) in
            NSLayoutConstraint.activate([view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16), view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16), view.topAnchor.constraint(equalTo: topAnchor, constant: 16), view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)])
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
