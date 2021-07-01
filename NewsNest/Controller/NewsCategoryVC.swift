//
//  NewsCategoryVC.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 11/06/21.
//

import UIKit

class NewsCategoryVC: UIViewController {

    let tabScrollView = ACTabScrollView()
    var contentViews:[UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabScrollView.changePageToIndex(0, animated: false)
    }
    
    
    private func configureUI(){
        view.addSubview(tabScrollView)
        tabScrollView.frame = view.bounds
        tabScrollView.defaultPage = 0
        tabScrollView.arrowIndicator = true
        tabScrollView.delegate = self
        tabScrollView.dataSource = self
        
        for category in Constant.categories {
            let vc = CategoryTableVC()
            vc.category = category
            addChild(vc)
            contentViews.append(vc.view)
        }
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.isTranslucent = false
            navigationBar.titleTextAttributes = NSDictionary(object: UIColor.label, forKey: NSAttributedString.Key.foregroundColor as NSCopying) as? [NSAttributedString.Key : AnyObject]
            navigationBar.shadowImage = UIImage()
        }
    }
    
   
}

extension NewsCategoryVC: ACTabScrollViewDelegate, ACTabScrollViewDataSource{
    // MARK: ACTabScrollViewDelegate
    func tabScrollView(_ tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        print(index)
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
        print(index)
    }
    
    // MARK: ACTabScrollViewDataSource
    func numberOfPagesInTabScrollView(_ tabScrollView: ACTabScrollView) -> Int {
        return Constant.categories.count
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        // create a label
        let label = UILabel()
        label.text = String(describing: Constant.categories[index]).uppercased()
        if #available(iOS 8.2, *) {
            label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.thin)
        } else {
            label.font = UIFont.systemFont(ofSize: 16)
        }
        label.textColor = .label
        label.textAlignment = .center
        
        // if the size of your tab is not fixed, you can adjust the size by the following way.
        label.sizeToFit() // resize the label to the size of content
        label.frame.size = CGSize(width: label.frame.size.width + 28, height: label.frame.size.height + 36) // add some paddings
        
        return label
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        return contentViews[index]
    }
    
    
}



