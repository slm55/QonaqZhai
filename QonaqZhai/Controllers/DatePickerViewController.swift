//
//  DatePickerViewController.swift
//  QonaqZhai
//
//  Created by Aslan Murat on 19.08.2022.
//

import UIKit

class DatePickerViewController: DynamicScrollableViewController {
    private let checkInDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .inline
        picker.setDate(.now.addingTimeInterval(60 * 60 * 24), animated: true)
        picker.minimumDate = Date()
        picker.maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 365)
        picker.datePickerMode = .date
        picker.backgroundColor = .systemBackground
        picker.tintColor = .systemBlue
        picker.locale = .current
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let checkOutDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .inline
        picker.setDate(.now.addingTimeInterval(60 * 60 * 48), animated: true)
        picker.minimumDate = Date()
        picker.maximumDate = Date().addingTimeInterval(60 * 60 * 24 * 366)
        picker.datePickerMode = .date
        picker.backgroundColor = .systemBackground
        picker.tintColor = .systemBlue
        picker.locale = .current
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = true
        
        let checkInDatelabel = UILabel()
        checkInDatelabel.text = "Check-in date"
        checkInDatelabel.textColor = .systemBlue
        checkInDatelabel.font = .systemFont(ofSize: 24, weight: .semibold)
        checkInDatelabel.translatesAutoresizingMaskIntoConstraints = false
        
        let checkOutDateLabel = UILabel()
        checkOutDateLabel.text = "Check-out date"
        checkOutDateLabel.textColor = .systemBlue
        checkOutDateLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        checkOutDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        mainContentContainerView.addSubview(checkInDatelabel)
        mainContentContainerView.addSubview(checkInDatePicker)
        mainContentContainerView.addSubview(checkOutDateLabel)
        mainContentContainerView.addSubview(checkOutDatePicker)
        
        let constraints = [
            checkInDatelabel.topAnchor.constraint(equalTo: mainContentContainerView.safeAreaLayoutGuide.topAnchor),
            checkInDatelabel.leadingAnchor.constraint(equalTo: mainContentContainerView.leadingAnchor, constant: 8),
            checkInDatePicker.topAnchor.constraint(equalTo: checkInDatelabel.bottomAnchor),
            checkInDatePicker.leadingAnchor.constraint(equalTo: mainContentContainerView.leadingAnchor, constant: 8),
            checkInDatePicker.trailingAnchor.constraint(equalTo: mainContentContainerView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            checkInDatePicker.heightAnchor.constraint(equalTo: mainContentContainerView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5, constant: -8),
            checkOutDateLabel.topAnchor.constraint(equalTo: checkInDatePicker.bottomAnchor),
            checkOutDateLabel.leadingAnchor.constraint(equalTo: mainContentContainerView.leadingAnchor, constant: 8),
            checkOutDatePicker.topAnchor.constraint(equalTo: checkOutDateLabel.bottomAnchor, constant: 8),
            checkOutDatePicker.leadingAnchor.constraint(equalTo: mainContentContainerView.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            checkOutDatePicker.trailingAnchor.constraint(equalTo: mainContentContainerView.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            checkOutDatePicker.heightAnchor.constraint(equalTo: checkInDatePicker.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        checkInDatePicker.addTarget(self, action: #selector(handleCheckInDateSelection), for: .valueChanged)
        checkOutDatePicker.addTarget(self, action: #selector(handleCheckOutDateSelection), for: .valueChanged)
    }
    
    @objc func handleCheckInDateSelection(_ sender: UIDatePicker){
    }
    
    @objc func handleCheckOutDateSelection(_ sender: UIDatePicker){
    }

}
