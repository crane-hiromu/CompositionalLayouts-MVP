//
//  MainViewController.swift
//  CompositionalLayouts-MVP
//
//  Created by Tsuruta, Hiromu | ECID on 2021/03/06.
//

import UIKit

// MARK: - UserInterface
protocol MainUserInterface: UIViewController {
    func presentSubView()
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

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

// MARK: - MainUserInterface
extension MainViewController: MainUserInterface {
    
    func presentSubView() {
        present(SubViewController(), animated: true)
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
