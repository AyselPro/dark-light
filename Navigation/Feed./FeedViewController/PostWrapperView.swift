//
//  PostWrapperView.swift
//  Navigation
//
//  Created by Aysel on 13.02.2024.
//

import UIKit

class PostWrapperView: UIStackView {

    // MARK: - Properties
        
    var onButtonTap: ((_ index: Int) -> Void)?
    
    // MARK: - Life cycle
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.axis = .vertical
        self.spacing = 10.0

        FeedModel.shared.posts.enumerated().forEach { (index, _) in
            let postButton = PostButtonFactory.makeButton(forPostWithIndex: index)
            postButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            self.addArrangedSubview(postButton)
        }
    }
    

    // MARK: - Actions
    
    @objc private func buttonTapped(_ sender: Any) {

        guard let postButton = sender as? PostButton,
              let index = postButton.index,
              FeedModel.shared.posts.indices.contains(index) else {
            return
        }

        onButtonTap?(index)
    }
}
