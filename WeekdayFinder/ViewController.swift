//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Philip on 22.04.2021.
//

import UIKit

class ViewController: UIViewController {

    
    var theNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Weekday Finder"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Georgia", size: 40)
        return label
    }()
    
    var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Day"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dayTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "enter day"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    var monthLabel: UILabel = {
        let label = UILabel()
        label.text = "Month"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var monthTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "enter month"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    var yearLabel: UILabel = {
        let label = UILabel()
        label.text = "Year"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var yearTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "enter year"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Here you will see the day of the week"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var findDayButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Find Day", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.tintColor = .white
        button.addTarget(self,
                         action: #selector(findDayAction),
                         for: .touchUpInside)
        return button
    }()
    
    var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        return stackView
    }()
    var centerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    var botStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(theNameLabel)
        
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(dayLabel)
        topStackView.addArrangedSubview(dayTextField)
        
        view.addSubview(centerStackView)
        centerStackView.addArrangedSubview(monthLabel)
        centerStackView.addArrangedSubview(monthTextField)
        
        view.addSubview(botStackView)
        botStackView.addArrangedSubview(yearLabel)
        botStackView.addArrangedSubview(yearTextField)

        view.addSubview(resultLabel)
        
        view.addSubview(findDayButton)
        
        setupLayout()
    }


    private func setupLayout() {
        view.backgroundColor = .lightGray
        theNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        theNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        topStackView.topAnchor.constraint(equalTo: theNameLabel.bottomAnchor, constant: 40).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        dayTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        centerStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20).isActive = true
        centerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        centerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        monthTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        botStackView.topAnchor.constraint(equalTo: centerStackView.bottomAnchor, constant: 20).isActive = true
        botStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        botStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        yearTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        resultLabel.topAnchor.constraint(equalTo: botStackView.bottomAnchor, constant: 40).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        resultLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        findDayButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 70).isActive = true
        findDayButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        findDayButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    



@objc
func findDayAction() {
    
    guard let day = dayTextField.text, !day.isEmpty, let month = monthTextField.text, !month.isEmpty, let year = yearTextField.text, !year.isEmpty else {
        resultLabel.text = "Please, enter all three fields"
        return
    }
    
    let date: String = "\(month)-\(day)-\(year)"
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    guard let formattedDate = dateFormatter.date(from: date) else {
        resultLabel.text = "Invalid Date Entered"
        return
    }
    
    dateFormatter.dateFormat = "EEEE"
    let weekDay = dateFormatter.string(from: formattedDate)
    let capitalizedWeekDay = weekDay.capitalized
    resultLabel.text = capitalizedWeekDay
}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
