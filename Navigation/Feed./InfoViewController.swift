//
//  InfoViewController.swift
//  Navigation
//
//  Created by Aysel on 13.02.2024.
//

import UIKit

class InfoViewController: UIViewController {

    // MARK: - Properties
    
    weak var coordinator: FeedCoordinator?
    
    private lazy var alertButton: UIButton = {
        let alertButton = UIButton(type: .system)
        
        alertButton.toAutoLayout()
        alertButton.setTitle("Show alert", for: .normal)
        alertButton.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)
        
        return alertButton
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.backgroundColor = .systemYellow
        
        view.addSubview(alertButton)
        
        let constraints = [
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Actions
    
    @objc private func showAlert(_ sender: Any) {
        coordinator?.showDeletePostAlert(presentedOn: self)
    }
}
