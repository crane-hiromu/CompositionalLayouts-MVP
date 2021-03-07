//
//  MainViewController.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/06.
//

import UIKit
import SafariServices

// MARK: - UserInterface
protocol MainUserInterface: UIViewController {
    // UI
    func initialize()
    func reloadData()
    
    // Router
    func presentWebView(with url: URL)
    func presentAlert(with item: Item)
    func presentSheet(with infomation: Infomation)
}

// MARK; - ViewController
final class MainViewController: UIViewController {
    
    // MARK: Property

    private(set) var presenter: MainPresentable!
    private lazy var mainView: MainView = .init(self)

    // MARK: Initializer

    required convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.presenter = MainPresenter(userInterface: self)
    }
    
    // MARK: Override
    
    override func loadView() {
        super.loadView()
        presenter.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - MainUserInterface
extension MainViewController: MainUserInterface {
    
    // MARK: UI
    
    func initialize() {
        view = mainView
    }
    
    func reloadData() {
        mainView.collectionView.reloadData()
    }
    
    // MARK: Router
    
    func presentWebView(with url: URL) {
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    func presentAlert(with item: Item) {
        let vc = UIAlertController(title: item.name, message: nil, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "閉じる", style: .default))
        present(vc, animated: true)
    }
    
    func presentSheet(with infomation: Infomation) {
        let vc = UIAlertController(title: infomation.title, message: nil, preferredStyle: .actionSheet)
        vc.addAction(UIAlertAction(title: "閉じる", style: .default))
        present(vc, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        presenter.sections[indexPath.section].configureCell(collectionView, at: indexPath)
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.sections[indexPath.section].selectItem(self, at: indexPath)
    }
}
