//
//  PersistanceManager.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 18/06/21.
//

import UIKit

class PersistanceManager {
    
    static let shared = PersistanceManager()
    
    func isNewUser() -> Bool {
      return !UserDefaults.standard.bool(forKey: Keys.newUserKey)
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: Keys.newUserKey)
    }
    
    func setCountry(country: String) {
        UserDefaults.standard.set(country, forKey: Keys.countryKey)
    }
    func getSelectedCountry() -> String {
        return UserDefaults.standard.object(forKey: Keys.countryKey) as! String
    }
    
    func setLanguage(country: String) {
        UserDefaults.standard.set(country, forKey: Keys.LanguageKey)
    }
    func getSelectedLanguage() -> String {
        return UserDefaults.standard.object(forKey: Keys.LanguageKey) as! String
    }
}

