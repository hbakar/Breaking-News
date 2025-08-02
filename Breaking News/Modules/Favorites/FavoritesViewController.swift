//
//  FavoritesViewController.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 27.07.2025.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    private let favoritesTableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    fileprivate func configure() {
        view.addSubview(favoritesTableView)
        title = "Favorites"
        view.backgroundColor = .white
        setupTableViewCell()
        setupTableView()
        
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favoritesTableView.frame = view.bounds
    }
    
    fileprivate func setupTableView() {
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        favoritesTableView.rowHeight = 120
    }
    
    fileprivate func setupTableViewCell() {
        favoritesTableView.register(FavoriteItemCell.self, forCellReuseIdentifier: FavoriteItemCell.identifier)
    }
}

// MARK: UITableViewDataSource Extension
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteItemCell.identifier, for: indexPath) as? FavoriteItemCell {
            cell.prepareForFavoriteItem("")
            return cell
        }
        return UITableViewCell()
    }
    
}

// MARK: UITableViewDelegate Extension
extension FavoritesViewController: UITableViewDelegate {
    
}

