//
//  LoginViewController.swift
//  Breaking News
//
//  Created by Hüseyin BAKAR on 28.07.2025.
//

import UIKit

final class LoginViewController: UIViewController {
  
    private let image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    fileprivate func configureUI() {
        view.backgroundColor = .white
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 220),
            image.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
}

extension LoginViewController {
    
}
