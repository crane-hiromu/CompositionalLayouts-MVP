//
//  MainItemContentSection.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

// MARK: - Section
struct MainItemContentSection {
    
    private let infomation: Infomation

    init(infomation: Infomation) {
        self.infomation = infomation
    }
}

extension MainItemContentSection: MainSection {
    
    var numberOfItems: Int {
        infomation.items.count
    }
    
    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection {
        // item
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        ))

        // group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .estimated(view.frame.width/4),
            heightDimension: .estimated(view.frame.width/4)
        ), subitems: [item])

        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 4, bottom: 0, trailing: 4)

        return section
    }
    
    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = view.dequeueReusableCell(with: MainItemCell.self, for: indexPath)
        cell.configure(with: infomation.items[indexPath.row])
        return cell
    }
    
    func selectItem(_ controller: MainViewController, at indexPath: IndexPath) {
        controller.presenter.didSelectItem(with: infomation.items[indexPath.row])
    }
}
