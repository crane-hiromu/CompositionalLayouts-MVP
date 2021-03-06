//
//  MainSection.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/06.
//

import UIKit

// MARK: Section Protocol
protocol MainSection {
    // セクションのアイテム数
    var numberOfItems: Int { get }

    // レイアウトの生成
    func layoutSection(_ view: UIView) -> NSCollectionLayoutSection

    // セルの生成
    func configureCell(_ view: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell

    // セルタップ時
    func selectItem(_ controller: MainViewController, at indexPath: IndexPath)
}
