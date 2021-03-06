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
    
    func viewDidLoad()
    func selectItem(at indexPath: IndexPath)
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
    
    func selectItem(at indexPath: IndexPath) {
        userInterface?.presentSubView()
    }
}
