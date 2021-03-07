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
    func loadView()
    func viewDidLoad()
    
    // Action from Section
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
    
    // MARK: Life Cycle
    
    func loadView() {
        userInterface?.initialize()
    }
    
    func viewDidLoad() {
        // set stub sections
        sections = [
            MainBannerSection(banner: .stub),
            MainItemTitleSection(infomation: .stub),
            MainItemContentSection(infomation: .stub),
            MainItemTitleSection(infomation: .stub),
            MainItemContentSection(infomation: .stub),
            MainItemTitleSection(infomation: .stub),
            MainItemContentSection(infomation: .stub)
        ]
        // update UI
        userInterface?.reloadData()
    }
    
    // MARK: Action from Section
    
    func didSelectBanner(with baneer: Banner) {
        guard let url = baneer.linkURL else { return }
        userInterface?.presentWebView(with: url)
    }
    
    func didSelectTitle(with infomation: Infomation) {
        userInterface?.presentSheet(with: infomation)
    }
    
    func didSelectEdit(with infomation: Infomation) {
        userInterface?.presentSheet(with: infomation)
    }
    
    func didSelectItem(with item: Item) {
        userInterface?.presentAlert(with: item)
    }
}

