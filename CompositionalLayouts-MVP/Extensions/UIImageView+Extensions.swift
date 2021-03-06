//
//  UIImageView+Extensions.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

extension UIImageView {
    
    func setImage(with url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard case .some(let result) = data, let image = UIImage(data: result) else { return }
            self?.image = image
        }.resume()
    }
}
