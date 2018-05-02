//
//  CustomError.swift
//  weather
//

import Foundation

struct CustomError: CustomNSError {
    let message: String

    var errorUserInfo: [String: Any] {
        return [NSLocalizedDescriptionKey: message]
    }

    init(_ message: String) {
        self.message = message
    }
}
