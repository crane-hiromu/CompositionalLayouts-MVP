//
//  MainPresenter.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/06.
//

import Foundation

// MARK: - Presentable
protocol MainPresentable: AnyObject {
    var sections: [MainSection] { get }
    
    // Life Cycle
    func viewDidLoad()
    
    // Section Action
    func didSelectBanner(with baneer: Banner)
    func didSelectTitle(with infomation: Infomation)
    func didSelectEdit(with infomation: Infomation)
    func didSelectItem(with item: Item)
}

// MARK: - Presenter
final class MainPresenter {
    
    // MARK: Property
    
    private(set) var sections = [MainSection]()
    private weak var userInterface: MainUserInterface?
    
    // MARK: Initializer
    
    init(userInterface: MainUserInterface) {
        self.userInterface = userInterface
    }
}

// MARK: - MainPresentable
extension MainPresenter: MainPresentable {
    
    func viewDidLoad() {
        
    }
    
    func didSelectBanner(with baneer: Banner) {
        
    }
    
    func didSelectTitle(with infomation: Infomation) {
        
    }
    
    func didSelectEdit(with infomation: Infomation) {
        
    }
    
    func didSelectItem(with item: Item) {
        
    }
}
