//
//  CustomError.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 12/06/21.
//

import Foundation

enum CustomError: String, Error {
    case noInternet = "Unableto complete your request. Please check your internet connection"
    case invaildRequest = "This username created an invaild request. Please try again"
    case invaildResponse = "Invaild response form the server please try again"
    case noData = "The data from the server was invaild. Please try again."
    case unableToFavorites = "Unable to load favorties try again later."
    case unableToSave = "Unable to Save favorties try again later."
    case alreadyInFavorites = "You've already to favorited this user."
}
