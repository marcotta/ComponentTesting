//
//  HereWeatherResponseError.swift
//  weather
//

import Foundation

struct HereWeatherResponseError: Codable {
	let message: [String]
	let type: String

	public var error: Error? {
		guard let messageToReturn = message.first,
			!messageToReturn.isEmpty else {
				return CustomError("Unknown error")
		}

		return CustomError(messageToReturn)
	}

	enum CodingKeys: String, CodingKey {
		case type = "Type"
		case message = "Message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		self.type = try values.decode(String.self, forKey: .type)
		self.message = try values.decode([String].self, forKey: .message)
	}
}
