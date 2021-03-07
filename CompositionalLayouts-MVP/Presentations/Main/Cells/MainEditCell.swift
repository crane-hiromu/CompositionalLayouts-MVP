//
//  MainEditCell.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

// MARK: - Cell
final class MainEditCell: UICollectionViewCell {
    
    // MARK: Property
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "ellipsis"))
        image.contentMode = .scaleAspectFit
        image.tintColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
}

// MARK: - MainCell
extension MainEditCell: MainCell {
    
    func configure(with entity: Infomation) {
        // NOP
    }
}

