//
//  NewsCell.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 12/06/21.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let reuseID = "NewsCell"
    let newsImage = NewsImageView(frame: .zero)
    let headlineLabel = HeadlineLabel(frame: .zero)
    let descriptionLabel = DescriptionLabel(frame: .zero)
    
    //delete
//    let headline = "iOS 15 announced, here is the full list of iPhones that it supports"
//    let body = "As I’m typing this, I’ve just finished my second panel for our big TC Sessions: Mobility event. The write-ups will be ready in time for next week’s roundup, but a couple of things worth thinking about in the meantime. The first is partnerships with big compan…"
    //
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)  {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String, description: String, imageURL: String) {
        headlineLabel.text = title
        descriptionLabel.text = description
        newsImage.downloadImage(from: imageURL)
    }
    
    private func configure() {
        layer.cornerRadius = 14
        backgroundColor = .secondarySystemBackground
        addSubview(newsImage)
        addSubview(headlineLabel)
        addSubview(descriptionLabel)
//
//        headlineLabel.text = headline
//        descriptionLabel.text = body
//        newsImage.image = UIImage(named: "ios_15_phones")
        
        NSLayoutConstraint.activate([
            
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.widthAnchor.constraint(equalToConstant: 160),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headlineLabel.heightAnchor.constraint(equalToConstant: 66),
            headlineLabel.trailingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
            
        ])
    }
    
}
