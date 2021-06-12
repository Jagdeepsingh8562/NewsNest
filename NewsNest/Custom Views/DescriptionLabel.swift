//
//  DescriptionLabel.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 12/06/21.
//

import UIKit

class DescriptionLabel: UILabel {

        override init(frame: CGRect) {
            super.init(frame: .zero)
            configure()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func configure() {
            translatesAutoresizingMaskIntoConstraints = false
            textColor = .secondaryLabel
            font = .systemFont(ofSize: 17, weight: .medium)
            lineBreakMode = .byTruncatingTail
            numberOfLines = 0
        }

    }

