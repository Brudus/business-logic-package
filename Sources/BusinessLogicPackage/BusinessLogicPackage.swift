// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum Operation {
    case add(first: Double, second: Double)
    case subtract(first: Double, second: Double)
}

public class Calculator {
    public init() {}

    public func compute(_ operation: Operation) -> Double {
        switch operation {
        case let .add(first, second):
            return first + second
        case let .subtract(first, second):
            return first - second
        }
    }
}
