//
//  HereWeatherProviderConfigurationTests.swift
//  weatherTests
//

import Quick
import Nimble

@testable import weather

class HereWeatherProviderConfigurationTests: QuickSpec {
    override func spec() {
        describe("HereWeatherProviderConfiguration Tests") {
            var hereWeatherProviderConfiguration: HereWeatherProviderConfiguration?

            describe("HereWeatherProviderConfiguration.init()") {
                beforeEach {
                    hereWeatherProviderConfiguration = HereWeatherProviderConfiguration()
                }

                it("correctly initializes") {
                    expect(hereWeatherProviderConfiguration).toNot(beNil())
                }

                it("has the default appId") {
                    expect(hereWeatherProviderConfiguration?.appId).toNot(beNil())
                }

                it("has the default appCode") {
                    expect(hereWeatherProviderConfiguration?.appCode).toNot(beNil())
                }
            }

            describe("HereWeatherProviderConfiguration.init(appId:appCode:)") {
                let appId = "test app id"
                let appCode = "test app code"

                beforeEach {
                    hereWeatherProviderConfiguration = HereWeatherProviderConfiguration(appId: appId, appCode: appCode)
                }

                it("correctly initializes") {
                    expect(hereWeatherProviderConfiguration).toNot(beNil())
                }

                it("has the correct appId") {
                    expect(hereWeatherProviderConfiguration?.appId).to(equal(appId))
                }

                it("has the correct appCode") {
                    expect(hereWeatherProviderConfiguration?.appCode).to(equal(appCode))
                }
            }
        }
    }
}
