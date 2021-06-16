//
//  NewsTableVC.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 15/06/21.
//

import UIKit

class NewsTableVC: UIViewController {

    let tableView = UITableView()
    var category = ""
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        getNewsAndUpdateUI(category: category)
    }
    
   
    
    private func getNewsAndUpdateUI(category: String) {
        //showLoadingView()
        NetworkManager.shared.getByCategory(selectedCategory: category) {[weak self] result in
            guard let self = self else {
                return
            }
            //NotificationCenter.default.post(name: Notification.Name(Keys.apiCallFinishedKey), object: nil)
            
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
        tableView.frame = view.frame
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseID)
        tableView.rowHeight = 160
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}

extension NewsTableVC: UITableViewDelegate, UITableViewDataSource {
    
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

