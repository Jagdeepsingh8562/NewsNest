//
//  TitleLabel.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 20/06/21.
//

import UIKit

class TitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    init(text: String) {
        super.init(frame: .zero)
        configure()
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .label
        numberOfLines = 2
        font = UIFont.preferredFont(forTextStyle: .largeTitle)
        textColor = .label
        font = .systemFont(ofSize: 40, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
