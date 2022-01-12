//
//  UIImageView+Extension.swift
//  NewsFeedDemo
//
//  Created by Karun Aggarwal on 06/01/22.
//

import UIKit

extension UIImageView {
    /// Load image from URL
    /// - Parameter urlString: URL String
    func load(from urlString: String) {
        DispatchQueue.global().async { [weak self] in
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
