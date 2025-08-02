//
//  ExploreViewController.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 28.07.2025.
//

import UIKit

final class ExploreViewController: UIViewController {
    
    private let discoverCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discoverCollectionView.frame = view.bounds
        setupNavigationBar()
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        discoverCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.bounds.width, height: 200)
    }
}

extension ExploreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
}

extension ExploreViewController {
    
    fileprivate func setupNavigationBar() {
        title = "Explore"
        if let navbar = navigationController?.navigationBar as? UINavigationBar {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
            appearance.backgroundColor = .white
            appearance.shadowImage = UIImage()
            
            navigationController?.navigationItem.largeTitleDisplayMode = .never
            navbar.prefersLargeTitles = true
            navbar.barTintColor = .white
            navbar.standardAppearance = appearance
            navbar.scrollEdgeAppearance = appearance
            navbar.compactAppearance = appearance
        }
    }
}

