//
//  Double.swift
//  weather
//

import Foundation

extension Double {
    var temperature: String {
        return String(format: "%.f°", self)
    }
}
