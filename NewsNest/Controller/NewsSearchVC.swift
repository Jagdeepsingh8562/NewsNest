//
//  NewsSearchVC.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 11/06/21.
//

import UIKit

class NewsSearchVC: UIViewController {

    let tableView = UITableView()
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        configureSearchController()
    }
    
    private func configureSearchController(){
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a News Via Topic"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    private func getNewsAndUpdateUI(query: String) {
        showLoadingView()
        NetworkManager.shared.getSearchResults(query: query) {[weak self] result in
            guard let self = self else {
                return
            }
            self.dismissLoadingView()
            switch result {
            case .success(let articles):
                self.articles = articles
                self.tableView.reloadData()
            case .failure(let error):
                self.showAlert(message: error.localizedDescription, title: "Something went wrong")
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

extension NewsSearchVC: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        getNewsAndUpdateUI(query: searchBar.text ?? "")
    }
    
}

extension NewsSearchVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID) as! NewsCell
        let article = articles[indexPath.row]
        cell.set(title: article.title, description: article.articleDescription ?? "", imageURL: article.urlToImage ?? "")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentSafariVC(with:URL(string: articles[indexPath.row].url)!)
    }

}
