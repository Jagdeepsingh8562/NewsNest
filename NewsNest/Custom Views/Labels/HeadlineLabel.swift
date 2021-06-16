//
//  HeadlineLabel.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 12/06/21.
//

import UIKit

class HeadlineLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
        font = .systemFont(ofSize: 22, weight: .semibold)
        lineBreakMode = .byTruncatingTail
        numberOfLines = 0
    }
    
}
