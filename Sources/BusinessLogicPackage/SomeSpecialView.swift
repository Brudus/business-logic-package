//
//  SwiftUIView.swift
//  
//
//  Created by Manuel Djirlic on 02.08.24.
//

import SwiftUI

public struct SomeSpecialView: View {
    @State private var firstOperator: Double = 0
    @State private var secondOperator: Double = 0
    @State private var currentOperation = 0
    @State private var result: Double = 0

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    let calculator = Calculator()

    public var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Calculator")
                .font(.title)
            HStack(alignment: .center, spacing: 8) {
                Text("First Operator")
                Spacer()
                TextField("First Operator", value: $firstOperator, formatter: formatter)
            }
            HStack(alignment: .center, spacing: 8) {
                Text("Second Operator")
                Spacer()
                TextField("Second Operator", value: $secondOperator, formatter: formatter)
            }

            Picker("Operation", selection: $currentOperation) {
                Text("Addition").tag(0)
                Text("Subtraction").tag(1)
            }
            .pickerStyle(.segmented)

            Button("Calculate") {
                if currentOperation == 0 {
                    result = calculator.compute(.add(first: firstOperator, second: secondOperator))
                } else if currentOperation == 1 {
                    result = calculator.compute(.subtract(first: firstOperator, second: secondOperator))
                }

            }

            Text("Result is \(result)")
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

#Preview {
    SomeSpecialView()
}
