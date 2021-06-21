//
//  CustomButton.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 21/06/21.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    convenience init(type buttonType: UIButton.ButtonType,text: String) {
        self.init(type: .system)
        setTitle(text, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        tintColor = .white
        titleLabel?.adjustsFontSizeToFitWidth = true
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        backgroundColor = .systemBlue
        layer.cornerRadius = 8
    }
}
