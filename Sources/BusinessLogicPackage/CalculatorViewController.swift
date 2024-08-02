//
//  CalculatorViewController.swift
//  
//
//  Created by Manuel Djirlic on 02.08.24.
//

import UIKit

public class CalculatorViewController: UIViewController {
    private var firstOperator: Double = 0
    private var secondOperator: Double = 0
    private var currentOperation = 0
    private var result: Double = 0

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let calculator = Calculator()

    let firstOperatorField = UITextField()
    let secondOperatorField = UITextField()
    let operationSegmentedControl = UISegmentedControl(items: ["Addition", "Subtraction"])
    let resultLabel = UILabel()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupViews()
    }

    private func setupViews() {
        let titleLabel = UILabel()
        titleLabel.text = "Calculator"
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 40.0),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8.0),
            titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 100.0)
        ])

        let firstOperatorLabel = UILabel()
        firstOperatorLabel.text = "First Operator"
        firstOperatorField.placeholder = "First Operator"
        firstOperatorField.keyboardType = .decimalPad
        firstOperatorLabel.translatesAutoresizingMaskIntoConstraints = false
        firstOperatorField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstOperatorLabel)
        view.addSubview(firstOperatorField)
        NSLayoutConstraint.activate([
            firstOperatorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            firstOperatorLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8.0)
        ])
        NSLayoutConstraint.activate([
            firstOperatorField.topAnchor.constraint(equalTo: firstOperatorLabel.topAnchor),
            firstOperatorField.leadingAnchor.constraint(equalTo: firstOperatorLabel.trailingAnchor, constant: 8.0),
            firstOperatorField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8.0),
            firstOperatorField.widthAnchor.constraint(equalToConstant: 120.0)
        ])

        let secondOperatorLabel = UILabel()
        secondOperatorLabel.text = "Second Operator"
        secondOperatorField.placeholder = "Second Operator"
        secondOperatorField.keyboardType = .decimalPad
        secondOperatorLabel.translatesAutoresizingMaskIntoConstraints = false
        secondOperatorField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondOperatorLabel)
        view.addSubview(secondOperatorField)
        NSLayoutConstraint.activate([
            secondOperatorLabel.topAnchor.constraint(equalTo: firstOperatorLabel.bottomAnchor, constant: 8.0),
            secondOperatorLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8.0)
        ])
        NSLayoutConstraint.activate([
            secondOperatorField.topAnchor.constraint(equalTo: secondOperatorLabel.topAnchor),
            secondOperatorField.leadingAnchor.constraint(equalTo: secondOperatorLabel.trailingAnchor, constant: 8.0),
            secondOperatorField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8.0),
            secondOperatorField.widthAnchor.constraint(equalToConstant: 120.0)
        ])

        let calculateButton = UIButton(type: .system)
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calculateButton)
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: secondOperatorLabel.bottomAnchor, constant: 8.0),
            calculateButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8.0),
            calculateButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8.0)
        ])

        operationSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(operationSegmentedControl)
        operationSegmentedControl.selectedSegmentIndex = 0
        NSLayoutConstraint.activate([
            operationSegmentedControl.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 8.0),
            operationSegmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8.0),
            operationSegmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8.0)
        ])

        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: operationSegmentedControl.bottomAnchor, constant: 8.0),
            resultLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8.0),
            resultLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8.0)
        ])
    }

    @objc private func calculateButtonTapped() {
        firstOperator = Double(firstOperatorField.text ?? "") ?? 0
        secondOperator = Double(secondOperatorField.text ?? "") ?? 0
        currentOperation = operationSegmentedControl.selectedSegmentIndex

        if currentOperation == 0 {
            result = calculator.compute(.add(first: firstOperator, second: secondOperator))
        } else if currentOperation == 1 {
            result = calculator.compute(.subtract(first: firstOperator, second: secondOperator))
        }

        resultLabel.text = "Result is \(result)"
    }
}
