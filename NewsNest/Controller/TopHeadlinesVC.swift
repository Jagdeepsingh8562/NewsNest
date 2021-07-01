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
    var page: Int = 1
    var hasMoreArticles: Bool = true
    var updateData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureTableView()
        getNewsAndUpdateUI(page: page)
        
        let barButton = UIBarButtonItem(image: UIImage(systemName: "slider.vertical.3"), style: .plain, target: self ,action: #selector(barButtonTapped))
        navigationItem.rightBarButtonItem = barButton
        NotificationCenter.default.addObserver(self, selector: #selector(networkCallAfterDismiss), name: Keys.refreshNotification, object: nil)
    }
    
    @objc func networkCallAfterDismiss() {
        updateData = true
        getNewsAndUpdateUI(page: 1)
    }
    
    private func getNewsAndUpdateUI(page: Int) {
        showLoadingView()
        let country = PersistanceManager.shared.getSelectedCountry()
        NetworkManager.shared.getTopHeadline(page: page, country: country) {[weak self] result in
            guard let self = self else {
                return
            }
            self.dismissLoadingView()
            switch result {
            case .success(let articles):
                print(articles.count)
                if articles.count < 50 {self.hasMoreArticles = false}
                if self.updateData { self.articles = articles
                } else { self.articles.append(contentsOf: articles) }
                self.tableView.reloadData()
            case .failure(let error):
                self.showAlert(message: error.rawValue, title: "Something went wrong")
            }
        }
    }
    @objc func barButtonTapped() {
        present(PreferencesVC(), animated: true)
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
        cell.set(title: article.title, description: article.articleDescription ?? "", imageURL: article.urlToImage ?? "")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentSafariVC(with:URL(string: articles[indexPath.row].url)!)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        if offsetY > contentHeight - height {
            guard hasMoreArticles else { return }
            page += 1
            getNewsAndUpdateUI(page: page)
        }
    }
    
    
}
