//
//  ProfileTableItemCell.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 1.08.2025.
//

import UIKit

final class ProfileTableItemCell: UITableViewCell {
    
   static let identifier = "ProfileTableItemCell"
    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

