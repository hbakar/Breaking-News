//
//  StackViewFactory.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 1.08.2025.
//

import UIKit

extension UIStackView {
    static func createStackView(axis: NSLayoutConstraint.Axis = .horizontal,spacing: CGFloat = 0.0,distribution: Distribution = .fill, alignment: Alignment = .fill) -> UIStackView {
        let stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        stView.axis = axis
        stView.spacing = spacing
        stView.distribution = distribution
        stView.alignment = alignment
        return stView
    }
}
