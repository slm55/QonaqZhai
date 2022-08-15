//
//  BookingsViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 14.08.2022.
//

import UIKit

class BookingsViewController: DynamicScrollableViewController {
    private let promptStackViewView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupPromptView()
    }
    
    private func setupPromptView(){
        let imageView = UIImageView()
        imageView.image = UIImage(named: "genius")
        imageView.contentMode = .scaleAspectFill
        
        let label1 = UILabel()
        label1.text = "Your trips live here"
        label1.font = .systemFont(ofSize: 24, weight: .bold)
        label1.numberOfLines = 0
        label1.textAlignment = .center
        label1.textColor = .label
        
        let label2 = UILabel()
        label2.text = "Sign in to view all your active bookings. You can also import individual bookings by using your booking confirmation number and PIN"
        label2.font = .systemFont(ofSize: 16)
        label2.numberOfLines = 0
        label2.textAlignment = .center
        label2.textColor = .label
        
        var configuration1 = UIButton.Configuration.filled()
        configuration1.title = "Sign in"
        configuration1.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        configuration1.baseBackgroundColor = .systemBlue
        configuration1.baseForegroundColor = .white
        let button1 = UIButton(configuration: configuration1, primaryAction: nil)
        
        var configuration2 = UIButton.Configuration.plain()
        configuration2.title = "Enter booking details"
        configuration2.baseForegroundColor = .link
        let button2 = UIButton(configuration: configuration2, primaryAction: nil)
        
        promptStackViewView.addArrangedSubview(imageView)
        promptStackViewView.addArrangedSubview(label1)
        promptStackViewView.addArrangedSubview(label2)
        promptStackViewView.addArrangedSubview(button1)
        promptStackViewView.addArrangedSubview(button2)
        
        mainContentContainerView.addSubview(promptStackViewView)
        
        NSLayoutConstraint.activate([
            promptStackViewView.widthAnchor.constraint(equalTo: mainContentContainerView.widthAnchor, multiplier: 0.8),
            promptStackViewView.centerYAnchor.constraint(equalTo: mainContentContainerView.centerYAnchor),
            promptStackViewView.centerXAnchor.constraint(equalTo: mainContentContainerView.centerXAnchor),
            promptStackViewView.bottomAnchor.constraint(equalTo: mainContentContainerView.bottomAnchor)
        ])
        
    }
    
}
