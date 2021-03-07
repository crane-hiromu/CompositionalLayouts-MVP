//
//  MainBannerCell.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

// MARK: - Cell
final class MainBannerCell: UICollectionViewCell {
    
    // MARK: Property
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
}

// MARK: - MainCell
extension MainBannerCell: MainCell {
    
    func configure(with entity: Banner) {
        guard let url = entity.imageURL else { return }
        imageView.setImage(with: url)
    }
}
