//
//  MainCell.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import Foundation

// MARK: - Cell Protocol
protocol MainCell {
    associatedtype E: MainEntity
    func configure(with entity: E)
}
