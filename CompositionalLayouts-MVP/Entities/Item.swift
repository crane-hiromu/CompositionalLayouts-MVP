//
//  Item.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import Foundation

// MARK: - Model
struct Infomation {
    let id: Int
    let title: String
    let items: [Item]
}

struct Item {
    let name: String
    let imageURL: URL?
}
