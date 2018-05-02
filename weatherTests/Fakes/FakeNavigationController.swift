//
//  FakeNavigationController.swift
//  weatherTests
//

import UIKit

@testable import weather

class FakeNavigationController: UINavigationControllerProtocol {
    private (set) var lastPushedViewController: UIViewController?

    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        lastPushedViewController = viewController
    }
}
