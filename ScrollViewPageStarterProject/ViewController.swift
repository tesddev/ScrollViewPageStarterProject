//
//  ViewController.swift
//  ScrollViewPageStarterProject
//
//  Created by Tes on 27/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    /// All views below should be removed to suit developer's design
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tes' ScrollView"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var proceedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        constraintViews()
    }
    
    func constraintViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        /// ScrollView and Contentview configuration, can be edited to developer's discretion
        scrollView.backgroundColor = UIColor.white
        scrollView.showsVerticalScrollIndicator = false
        
        /// Adition of scrollView and contentView to super view
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        /// All views should be added as contentview's subview
        contentView.addSubview(headerLabel)
        contentView.addSubview(proceedButton)
        
        /// Constraints
        NSLayoutConstraint.activate([
            /// It's advisable to not touch these scroll view and content view's constraints
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            /// A view has to be added to content view's top anchor, here, it is the back button
            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            headerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            proceedButton.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 800),
            proceedButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            proceedButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            proceedButton.heightAnchor.constraint(equalToConstant: 40),
            
            /// A view has to be attached to the bottom anchor of the scroll view
            proceedButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40),
        ])
    }
    @objc func didTapLoginButton() {
        print("login successful")
    }
}
