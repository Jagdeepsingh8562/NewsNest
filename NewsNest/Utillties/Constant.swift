//
//  Constant.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 14/06/21.
//

import Foundation

enum Constant {
    static let categories = ["technology","business","entertainment","general","health","science","sports"]
    
    static let countries: [String:String] = [
        "United Arab Emirates":"ae",
        "Argentina":"ar",
        "Austria":"at",
        "Australia":"au",
        "Belgium":"be",
        "Bulgaria":"bg",
        "Brazil":"br",
        "Canada":"ca",
        "Switzerland":"ch",
        "China":"cn",
        "Colombia":"co",
        "Cuba":"cu",
        "Czechia":"cz",
        "Germany":"de",
        "Egypt":"eg",
        "France":"fr",
        "Gabon":"gb",
        "Greece":"gr",
        "Hong Kong":"hk",
        "Hungary":"hu",
        "Indonesia":"id",
        "Ireland":"ie",
        "Israel":"il",
        "India":"in",
        "Italy":"it",
        "Latvia":"lv",
        "Morocco":"ma",
        "Mexico":"mx",
        "Malaysia":"my",
        "Nigeria":"ng",
        "Netherlands":"nl",
        "Norway":"no",
        "New Zealand":"nz",
        "Philippines":"ph",
        "Poland":"pl",
        "Portugal":"pt",
        "Romania":"ro",
        "Serbia":"rs",
        "Russia":"ru",
        "Saudi Arabia":"sa",
        "Sweden":"se",
        "Singapore":"sg",
        "Slovenia":"si",
        "Slovakia":"sk",
        "Thailand":"th",
        "Turkey":"tr",
        "Taiwan":"tw",
        "Ukraine":"ua",
        "United States":"us",
        "Venezuela":"ve",
        "South Africa":"za",
    ]
    static let languages: [String:String] = [
        "Arabic":"ar",
        "German":"de",
        "English":"en",
        "French":"fr",
        "Hebrew":"he",
        "Italian":"it",
        "Dutch":"nl",
        "Norwegian":"no",
        "Portuguese":"pt",
        "Chinese":"zh",
        "Northern Sami":"se",
        "Russian":"ru",
    ]
    
}

enum Keys {
    static let apiCallFinishedKey = "NEWSAPICallsIsFinished"
    static let newUserKey = "NEWUSER"
    static let countryKey = "COUNTRYKEY"
    static let LanguageKey = "LANGUAGEKEY"
}
