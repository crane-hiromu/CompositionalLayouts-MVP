//
//  Infomation+Stub.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import Foundation

extension Infomation {
    
    static var stub: Self {
        .init(id: 123456789,
              title: "Title",
              items: [.stub(0), .stub(1), .stub(2), .stub(3), .stub(4), .stub(5)])
    }
}

extension Item {
    
    static func stub(_ index: Int) -> Self {
        .init(name: "name\(index)", imageURL: nil)
    }
}
