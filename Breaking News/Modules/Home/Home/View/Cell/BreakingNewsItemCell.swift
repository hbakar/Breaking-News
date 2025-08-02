//
//  BreakingNewsItemCell.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 1.08.2025.
//

import UIKit

final class BreakingNewsItemCell: UICollectionViewCell {
    
    static let identifier = "BreakingNewsItemCell"
    
    private let titleLabel: UILabel = {
        let label = LabelFactor.build(text: "Breaking News", font: UIFont.Readex(.bold, size: 17), textColor: .black, alignment: .left, numberOfLines: 0)
        return label
    }()
    
    private let buttonViewAll: UIButton = {
        let button = UIButtonFactory.createButton(title: "View All", titleColor: .black, backgroundColor: .clear)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BreakingNewsItemCell {
    
    fileprivate func configure() {
        addItems()
        addConstraints()
    }
    
    private func addItems() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(buttonViewAll)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonViewAll.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonViewAll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonViewAll.heightAnchor.constraint(equalToConstant: 48),
           // buttonViewAll.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
