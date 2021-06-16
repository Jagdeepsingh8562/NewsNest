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
        "":"",
        "":"",
        "":"",
        "":"",
        "":"",
        "":"",
        "":"",
        "":"",
    ]
    
    
}

enum Keys {
   static let apiCallFinishedKey = "NEWSAPICallsIsFinished"
}
