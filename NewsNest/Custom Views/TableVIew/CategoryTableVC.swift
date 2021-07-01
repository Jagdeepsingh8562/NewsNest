//
//  CategoryTableVC.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 15/06/21.
//

import UIKit

class CategoryTableVC: UIViewController {

    let tableView = UITableView()
    var category = ""
    var articles: [Article] = []
    var updateData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        getNewsAndUpdateUI(category: category)
        NotificationCenter.default.addObserver(self, selector: #selector(networkCallAfterDismiss), name: Keys.refreshNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if updateData {
            getNewsAndUpdateUI(category: category)
        }
    }
    
    @objc func networkCallAfterDismiss() {
       updateData = true
    }
   
    
    private func getNewsAndUpdateUI(category: String) {
        updateData = false
        if category == "technology" { showLoadingView()}
        let language = PersistanceManager.shared.getSelectedLanguage()
        NetworkManager.shared.getByCategory(selectedCategory: category,language: language) {[weak self] result in
            guard let self = self else {
                return
            }
            if category == "technology" { self.dismissLoadingView() }
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
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 180, right: 0);
    }
    

}

extension CategoryTableVC: UITableViewDelegate, UITableViewDataSource {
    
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

