//
//  SearchLocationTableViewCell.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 17.08.2022.
//

import UIKit
import SDWebImage

struct SearchLocationTableViewCellViewModel {
    let iconURL: String
    let locationRegion: String
    let locationCity: String
    let locationName: String
    let locationCountry: String
    let locationProperties: Int
}

class SearchLocationTableViewCell: UITableViewCell {
    static let identifier = "SearchLocationTableViewCell"
    
    private let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location")
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .init(red: 0/255, green: 53/255, blue: 128/255, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return imageView
    }()
    
    private let locationNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let locationCountryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let locationPropertiesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(icon)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(locationNameLabel)
        stackView.addArrangedSubview(locationCountryLabel)
        stackView.addArrangedSubview(locationPropertiesLabel)
        contentView.addSubview(stackView)
        
        let constraints = [
            icon.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            icon.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            icon.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            icon.heightAnchor.constraint(equalToConstant: 44),
            icon.widthAnchor.constraint(equalTo: icon.heightAnchor),
            stackView.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
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
    
    func configure(with viewModel: SearchLocationTableViewCellViewModel) {
        if let url = URL(string: viewModel.iconURL) {
            icon.sd_setImage(with: url, completed: nil)
        }
        locationNameLabel.text = viewModel.locationCity
        locationCountryLabel.text = "City in \(viewModel.locationRegion != viewModel.locationCity ? viewModel.locationRegion + "," : "")\(viewModel.locationCountry)"
        
        switch viewModel.locationProperties {
        case 0:
            fallthrough
        case 1:
            locationPropertiesLabel.text = nil
        default:
            locationPropertiesLabel.text = "\(viewModel.locationProperties) properties"
        }
    }

}
