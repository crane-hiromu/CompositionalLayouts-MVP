//
//  MainView.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/06.
//

import UIKit

// MARK: - View
final class MainView: UIView {
    
    // MARK: Property

    private(set) lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(type: MainBannerCell.self)
        collectionView.register(type: MainTitleCell.self)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        return collectionView
    }()

    private lazy var collectionViewLayout: UICollectionViewLayout = {
        return UICollectionViewCompositionalLayout { [weak self] section, _ in
            return self?.controller?.presenter.sections[section].layoutSection(self ?? .init())
        }
    }()
    
    private weak var controller: MainViewController?

    // MARK: Initializer

    init(_ controller: MainViewController) {
        super.init(frame: .zero)
        self.controller = controller
        self.collectionView.dataSource = controller
        self.collectionView.delegate = controller
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("fatalError TimelineSearchConditionView")
    }
}
