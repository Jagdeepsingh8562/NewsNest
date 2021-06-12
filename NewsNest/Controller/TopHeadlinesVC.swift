//
//  TopHeadlinesVC.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 11/06/21.
//

import UIKit

class TopHeadlinesVC: UIViewController {
    
    let tableView = UITableView()
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureTableView()
        getNewsAndUpdateUI()
    }
    
    private func getNewsAndUpdateUI() {
        NetworkManager.shared.getTopHeadline {[weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let articles):
                self.articles = articles
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseID)
        tableView.rowHeight = 160
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension TopHeadlinesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID) as! NewsCell
        let article = articles[indexPath.row]
        cell.set(title: article.title, description: article.articleDescription, imageURL: article.urlToImage ?? "")
        return cell
        
    }
    
    
}
