//
//  UIAlertController.swift
//  weather
//

import UIKit

extension UIAlertController {
    static func makeOneButtonAlertController(with title: String, message: String, actionText: String) -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionText, style: .cancel))
        return alert
    }
}
