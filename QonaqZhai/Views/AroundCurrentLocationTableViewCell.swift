//
//  AroundCurrentLocationTableViewCell.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 16.08.2022.
//

import UIKit

class AroundCurrentLocationTableViewCell: UITableViewCell {
    static let identifier = "AroundCurrentLocationTableViewCell"
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .center
        imageView.backgroundColor = .init(red: 0/255, green: 53/255, blue: 128/255, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.text = "Around here"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(icon)
        contentView.addSubview(label)
        
        let constraints = [
            icon.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            icon.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            icon.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            icon.heightAnchor.constraint(equalToConstant: 44),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
