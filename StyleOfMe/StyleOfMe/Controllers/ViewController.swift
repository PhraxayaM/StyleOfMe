//
//  ViewController.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/7/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var viewModel = ArticlesViewModel()
    
    private lazy var headerView: HeaderView = {
        let hv = HeaderView(fontSize: 32)
        return hv
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        tv.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 175, green: 233, blue: 239)
    
        setupView()
        fetchNews()

    }

    func setupView() {
        view.addSubview(headerView)
        view.addSubview(tableView)
        setupConstraints()
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16), headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor), tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    func fetchNews() {
        viewModel.getNews { (_) in
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.newsVM.count)
        return viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }
    
    
}

