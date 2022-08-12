//
//  SearchDetailsFieldView.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 11.08.2022.
//

import UIKit

enum SearchDetailsFieldViewCategory: String {
    case Search
    case Calendar
    case NumberOfGuests
}

class SearchDetailsFieldView: UIView {
    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .label
        return iv
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFill
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.systemGray.cgColor
        
        addSubview(iconImageView)
        addSubview(textLabel)
        
        let touchDown = UILongPressGestureRecognizer(target:self, action: #selector(handleTap))
        touchDown.minimumPressDuration = 0
        addGestureRecognizer(touchDown)
        
        let constraints = [
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            textLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with category: SearchDetailsFieldViewCategory){
        switch category {
        case .Search:
            iconImageView.image = UIImage(systemName: "magnifyingglass")
            textLabel.text = "Search location"
        case .Calendar:
            iconImageView.image = UIImage(systemName: "calendar")
            textLabel.text = "Check in - Check out"
        case .NumberOfGuests:
            iconImageView.image = UIImage(systemName: "person.fill")
            textLabel.text = "1 room · 2 adults · No children"
        }
        
        iconImageView.image = iconImageView.image?.withAlignmentRectInsets(UIEdgeInsets(top: -16, left: -16, bottom: -16, right: -16))
    }
    
    @objc func handleTap(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            backgroundColor = .secondarySystemFill
        } else if gesture.state == .ended || gesture.state == .cancelled {
            backgroundColor = .systemBackground
        }
    }
}
