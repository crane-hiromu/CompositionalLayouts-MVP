//
//  MainBannerSection.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

// MARK: - Section
struct MainBannerSection {
    
    private let banner: Banner

    init(banner: Banner) {
        self.banner = banner
    }
}

// MARK: - MainSection
extension MainBannerSection: MainSection {
    
    var numberOfItems: Int {
        return 1
    }

    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection {
        // item
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        ))

        // group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(44)
        ), subitems: [item])

        // section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = view.dequeueReusableCell(with: MainBannerCell.self, for: indexPath)
        cell.configure(with: banner)
        return cell
    }

    func selectItem(_ controller: MainViewController, at indexPath: IndexPath) {
        controller.presenter.didSelectBanner(with: banner)
    }
}
