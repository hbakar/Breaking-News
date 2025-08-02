//
//  ButtonFactory.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 1.08.2025.
//

import UIKit

class UIButtonFactory {
    
    static func createButton(
        title: String? = nil,
        font: UIFont = .systemFont(ofSize: 16),
        titleColor: UIColor = .white,
        backgroundColor: UIColor = .systemBlue
    ) -> UIButton {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false 
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = font
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        return button
    }
}
