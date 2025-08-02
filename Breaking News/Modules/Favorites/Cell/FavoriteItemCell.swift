//
//  FavoriteItemCell.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 27.07.2025.
//

import UIKit

final class FavoriteItemCell: UITableViewCell {
    
    static let identifier = "FavoriteItemCell"
    
    private var img: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    private let trashButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        return button
    }()
    
    private let descLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(img)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(trashButton)
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareForFavoriteItem(_ item: String) {
        DispatchQueue.main.async {
            self.img.image = UIImage(systemName: "square.and.arrow.down")!
            self.titleLabel.text = "test"
            self.descLabel.text = "desc here"
        }
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate(
            [img.widthAnchor.constraint(equalToConstant: 96),
             img.heightAnchor.constraint(equalToConstant: 96),
             img.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
             img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             titleLabel.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 8),
             titleLabel.topAnchor.constraint(equalTo: img.topAnchor),
             titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             
             descLabel.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 8),
             descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
             descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ]
        )
    }
}
