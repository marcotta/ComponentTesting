//
//  UIAlertControllerTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class UIAlertControllerTests: QuickSpec {
    override func spec() {
        describe("UIAlertController Tests") {
            describe("static UIAlertController.makeOneButtonAlertController(with:message:actionText:)") {
                let title = "title"
                let message = "message"
                let actionText = "action text"
                
                var alert: UIAlertController?
                
                beforeEach {
                    alert = UIAlertController.makeOneButtonAlertController(with: title, message: message, actionText: actionText)
                }
                
                it("has the correct title") {
                    expect(alert?.title).to(equal(title))
                }
                
                it("has the correct message") {
                    expect(alert?.message).to(equal(message))
                }
                
                it("has the correct action text") {
                    expect(alert?.actions.contains { $0.title == actionText } ).to(beTruthy())
                }
            }
        }
    }
}
