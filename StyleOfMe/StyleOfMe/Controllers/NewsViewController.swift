//
//  ViewController.swift
//  StyleOfMe
//
//  Created by MattHew Phraxayavong on 1/7/21.
//

import UIKit
import SafariServices

class NewsViewController: UIViewController {

    var viewModel = ArticlesViewModel()
    var weathervm = WeatherViewModel()
    
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

        view.backgroundColor = .white
        title = "News"

        setupView()
        fetchNews()
        headerView.menuButton.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        
        navigationController?.isNavigationBarHidden = true

    }

    func setupView() {
        view.addSubview(headerView)
        view.addSubview(tableView)
        setupConstraints()
        
        
    }
    @objc func openMenu(_ sender: UIButton) {
        print("menu")
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else { return }
        
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.modalPresentationStyle = .formSheet
        present(safariViewController, animated: true)
    }
    
    
}

