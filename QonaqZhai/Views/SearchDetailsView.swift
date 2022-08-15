//
//  SearchDetailsView.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 11.08.2022.
//

import UIKit

protocol SearchDetailsViewDelegate: AnyObject {
    func didTapDetailsFieldView(with category: SearchDetailsFieldViewCategory)
}

class SearchDetailsView: UIView {
    weak var delegate: SearchDetailsViewDelegate?
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .systemBackground
        sv.clipsToBounds = true
        sv.layer.cornerRadius = 8
        return sv
    }()
    
    private let searchField: SearchDetailsFieldView = {
        let view = SearchDetailsFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(with: .Search)
        return view
    }()
    
    private let calendarField: SearchDetailsFieldView = {
        let view = SearchDetailsFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(with: .Calendar)
        return view
    }()
    
    private let numberOfGuestsField: SearchDetailsFieldView = {
        let view = SearchDetailsFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.configure(with: .NumberOfGuests)
        return view
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        layer.cornerRadius = 8
        layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(searchField)
        stackView.addArrangedSubview(calendarField)
        stackView.addArrangedSubview(numberOfGuestsField)
        stackView.addArrangedSubview(searchButton)
        
        let constraints = [
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            searchField.heightAnchor.constraint(equalToConstant: 64),
            searchField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            calendarField.heightAnchor.constraint(equalToConstant: 64),
            calendarField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            numberOfGuestsField.heightAnchor.constraint(equalToConstant: 64),
            numberOfGuestsField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 64),
            searchButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        setupSearchDetailsFieldViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSearchDetailsFieldViews(){
        searchField.delegate = self
        calendarField.delegate = self
        numberOfGuestsField.delegate = self
    }
}

extension SearchDetailsView: SearchDetailsFieldViewDelegate {
    func didTapDetailsFieldView(with category: SearchDetailsFieldViewCategory) {
        self.delegate?.didTapDetailsFieldView(with: category)
    }
}
