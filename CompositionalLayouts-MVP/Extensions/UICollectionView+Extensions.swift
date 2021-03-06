//
//  UICollectionView+Extensions.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/07.
//

import UIKit

extension UICollectionView {
    
    // MARK: UICollectionViewCell
    
    func registerFromNib<T: UICollectionViewCell>(type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: Bundle(for: T.self))
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func register<T: UICollectionViewCell>(type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: type.className)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    // MARK: UICollectionReusableView
    
    func registerFromNib<T: UICollectionReusableView>(type: T.Type, ofKind kind: ElementKind) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: kind.type, withReuseIdentifier: className)
    }
    
    func register<T: UICollectionReusableView>(type: T.Type, ofKind kind: ElementKind) {
        self.register(T.self, forSupplementaryViewOfKind: kind.type, withReuseIdentifier: type.className)
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(
        with type: T.Type,
        for indexPath: IndexPath,
        ofKind kind: String = UICollectionView.elementKindSectionHeader
    ) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}

// MARK: - Kind
enum ElementKind {
    case header, footer
    
    var type: String {
        switch self {
        case .header:
            return UICollectionView.elementKindSectionHeader
        case .footer:
            return UICollectionView.elementKindSectionFooter
        }
    }
}
