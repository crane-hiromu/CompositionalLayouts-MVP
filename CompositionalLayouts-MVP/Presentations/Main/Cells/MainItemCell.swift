//
//  MainItemCell.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

// MARK: - Cell
final class MainItemCell: UICollectionViewCell {
    
    // MARK: Property
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .lightGray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        imageView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 2),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -2),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -2)
        ])
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init(frame: .zero)
    }
}

// MARK: - MainCell
extension MainItemCell: MainCell {
    
    func configure(with entity: Item) {
        titleLabel.text = entity.name
        
        guard let url = entity.imageURL else { return }
        imageView.setImage(with: url)
    }
}
