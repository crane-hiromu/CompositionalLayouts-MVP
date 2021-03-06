//
//  MainItemTitleSection.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

// MARK: - Section
struct MainItemTitleSection {
    
    enum ViewType: Int, CaseIterable {
        case title, edit
    }
    
    private let infomation: Infomation

    init(infomation: Infomation) {
        self.infomation = infomation
    }
}

// MARK: - MainSection
extension MainItemTitleSection: MainSection {
    
    var numberOfItems: Int {
        return ViewType.allCases.count
    }

    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection {
        // setting
        let edgeSpacing: CGFloat = 8
        let rightWidth: CGFloat = 60 // margin+width = 8*2+44 = 60
        let leftWidth = view.bounds.width - rightWidth - edgeSpacing*2

        // item
        let right = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .absolute(rightWidth),
            heightDimension: .fractionalHeight(1)
        ))
        let left = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .absolute(leftWidth),
            heightDimension: .fractionalHeight(1)
        ))

        // group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(54)
        ), subitems: [left, right])

        // section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        guard let type = ViewType(rawValue: indexPath.row) else { fatalError() }
        
        switch type {
        case .title:
            let cell = view.dequeueReusableCell(with: MainTitleCell.self, for: indexPath)
            cell.configure(with: infomation.title)
            return cell
            
        case .edit:
            let cell = view.dequeueReusableCell(with: MainEditCell.self, for: indexPath)
            return cell
        }
    }

    func selectItem(_ controller: MainViewController, at indexPath: IndexPath) {
        guard let type = ViewType(rawValue: indexPath.row) else { return }

        switch type {
        case .title:
            controller.presenter.didSelectTitle(with: infomation)
            
        case .edit:
            controller.presenter.didSelectEdit(with: infomation)
        }
    }
}
