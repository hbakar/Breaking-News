//
//  LabelFactor.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 1.08.2025.
//

import UIKit

struct LabelFactor {
    static func build(
                text: String,
                font: UIFont = .systemFont(ofSize: 16),
                textColor: UIColor = .black,
                alignment: NSTextAlignment = .left,
                numberOfLines: Int = 1
            ) -> UILabel {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.text = text
                label.font = font
                label.textColor = textColor
                label.textAlignment = alignment
                label.numberOfLines = numberOfLines
                return label
            }
}
