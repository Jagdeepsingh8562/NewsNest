//
//  NewsImageView.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 12/06/21.
//

import UIKit

class NewsImageView: UIImageView {
    
    //store it in networkmanager
    let cache = NetworkManager.shared.cache
    
    let placeholderImage = UIImage(named: "placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
        image = placeholderImage
    }
    
    func downloadImage(from urlString: String) {
        
        if let image = cache.object(forKey: urlString as NSString) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: urlString as NSString)
            DispatchQueue.main.async { self.image = image }
               
        }
        task.resume()
    }

}

