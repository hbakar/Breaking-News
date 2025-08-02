//
//  ProfileViewController.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 28.07.2025.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: Properties
    private lazy var profileTableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        setupTableView()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileTableView.frame = view.bounds
    }
    
    fileprivate func configureUI() {
        title = "Profile"
        view.backgroundColor = .white
    }
    
    fileprivate func setupTableView() {
        profileTableView.dataSource = self
    }
    
    fileprivate func setupTableViewCell() {
        profileTableView.register(ProfileTableItemCell.self, forCellReuseIdentifier: ProfileTableItemCell.identifier)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "test \(indexPath)"
        return cell
    }
}
