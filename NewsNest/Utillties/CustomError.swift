//
//  CustomError.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 12/06/21.
//

import Foundation

enum CustomError: String, Error {
    case noInternet = "Unable to complete your request. Please check your internet connection"
    case invaildRequest = "This username created an invaild request. Please try again"
    case invaildResponse = "Invaild response form the server please try again"
    case noData = "The data from the server was invaild. Please try again."
}
