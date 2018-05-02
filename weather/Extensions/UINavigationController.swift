//
//  UINavigationController.swift
//  weather
//

import UIKit

protocol UINavigationControllerProtocol: class {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
}

extension UINavigationController: UINavigationControllerProtocol { }
