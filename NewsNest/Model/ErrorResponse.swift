//
//  ErrorResponse.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 12/06/21.
//

import Foundation

// MARK: - ErrorResponse
struct ErrorResponse: Codable {
    let status, code, message: String
}
