//
//  HomeViewController.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 27.07.2025.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let homeCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    var viewModel: HomeViewModelProtocol?
    
    private let buttonMenu: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.systemGray6
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.layer.cornerRadius = button.frame.width / 2
        return button
    }()
    
    private let buttonNotification: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.systemGray6
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "bell.badge"), for: .normal)
        button.tintColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.layer.cornerRadius = button.frame.width / 2
        return button
    }()
    
    private let buttonSearch: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.systemGray6
        button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.layer.cornerRadius = button.frame.width / 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.frame = view.bounds
        view.addSubview(homeCollectionView)
        setupCollectionViewCell()
        setupCollectionView()
        configure()
        
        let topHeadlinesURL = NewsEndpoint.topHeadlines(
            country: "us",
            category: "sports",
            page: 1
        )
      //  viewModel?.delegate = self
      //  viewModel?.getTopHeadlines(endpoint: topHeadlinesURL)
    }
    
    private func setupCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        let width = homeCollectionView.frame.size.width
        let itemWidth = CGFloat((width / 3) - 30)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: itemWidth, height: 250)
        homeCollectionView.collectionViewLayout = layout
    }
    
    private func setupCollectionViewCell() {
        homeCollectionView.register(BreakingNewsItemCell.self, forCellWithReuseIdentifier: BreakingNewsItemCell.identifier)
    }
    
    private func configure() {
        view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonMenu)
        
    //    let bell = UIImageView(image: UIImage(named: "bell"))
       
        navigationItem.rightBarButtonItems = [
          UIBarButtonItem(customView: buttonSearch),
          UIBarButtonItem(customView: buttonNotification)
        ]
        
    }
    
    @objc func menuLeftButtonTapped() {
        
    }
    
    @objc func menuBellTapped() {
        
    }
}

// MARK: UICollectionViewDataSource Extension
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let sectionCount = viewModel?.homeCollectionItems.count else { return 0 }
        return sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = viewModel?.homeCollectionItems[section] else { return 0 }
        switch section {
        case .topHeadlineTitleSection:
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreakingNewsItemCell.identifier, for: indexPath) as? BreakingNewsItemCell {
            return cell
        }
        return UICollectionViewCell()
    }
}

// MARK: UICollectionViewDelegate Extension
extension HomeViewController: UICollectionViewDelegate {
    
}

// MARK: HomeViewController
extension HomeViewController: HomeViewModelDelegate {
    
    func notify(_ event: HomeViewModelEvents) {
        switch event {
        case .didFetchTopHeadlines:
            DispatchQueue.main.async {
                print(self.viewModel?.topHeadlineResponse)
                self.homeCollectionView.reloadData()
            }
        case .fetchFailedTopHeadlines(let err):
            print(err)
        case .didFetchEverything:
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
            }
        case .fetchEverythingFailed(let err):
            print(err)
        case .didFetchSources:
            DispatchQueue.main.async {
                self.homeCollectionView.reloadData()
            }
        case .fetchSourcesFailed(let err):
            print(err.localizedDescription)
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let itemWidth = (width / 3) - 30
        return CGSize(width: itemWidth, height: 250)
    }
}
