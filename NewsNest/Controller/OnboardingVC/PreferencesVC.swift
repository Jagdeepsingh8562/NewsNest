//
//  PreferencesVC.swift
//  NewsNest
//
//  Created by Jagdeep Singh on 18/06/21.
//

import UIKit

class PreferencesVC: UIViewController {
    
    let titleLabel = TitleLabel(text: "Setting up\nNews Preference")
    let countryPickerView = UIPickerView()
    let languagePickerView = UIPickerView()
    let doneButton = CustomButton(type: .system, text: "Done")
    let setCountryLabel = HeadlineLabel(withText: "Set Your Country", size: 18)
    let setLanguageLabel = HeadlineLabel(withText: "Set Your Language", size: 18)
    let defaultLanguageLabel = HeadlineLabel(withText: "By default: English", size: 18)
    let defaultCountryLabel = HeadlineLabel(withText: "By default: India", size: 18)
    
    let countries: [String] = {
        var countries = [String]()
        for country in Constant.countries {
            countries.append(country.key)
        }
        return countries
    }()
    
    let languages: [String] = {
        var languages = [String]()
        for language in Constant.languages {
            languages.append(language.key)
        }
        return languages
    }()
    
    var selectedCountry = "India"
    var selectedLanguage = "English"
    
    override func viewDidLoad() {
        layoutUI()
        view.backgroundColor = .systemBackground
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    //Navigation to TopHeadlineVC
    @objc func doneButtonTapped() {
        confirmingInfoAlert(selectedCountry: selectedCountry, selectedLanguage: selectedLanguage)
        PersistanceManager.shared.setCountry(country: Constant.countries[selectedCountry] ?? "in")
        PersistanceManager.shared.setLanguage(country: Constant.languages[selectedLanguage] ?? "en")
        
    }
    
    private func confirmingInfoAlert(selectedCountry: String, selectedLanguage: String) {
        let alertVC = UIAlertController(title: "Confirm Your Preferences", message: "Selected Country is \(selectedCountry)\n Selected Languange is \(selectedLanguage)", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            let newUser = PersistanceManager.shared.isNewUser()
            if newUser {
                PersistanceManager.shared.setIsNotNewUser()
                let vc = NewsTabBarController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                
            } else {
                self.dismiss(animated: true) {
                    NotificationCenter.default.post(name: Keys.refreshNotification, object: nil)
                }
            }
        }))
        present(alertVC, animated: true)
    }
    
    
    private func setupPickerView(pickerView:UIPickerView) {
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pickerView)
    }
    
    private func layoutUI() {
        view.addSubview(titleLabel)
        view.addSubview(setCountryLabel)
        view.addSubview(defaultCountryLabel)
        setupPickerView(pickerView: countryPickerView)
        view.addSubview(setLanguageLabel)
        view.addSubview(defaultLanguageLabel)
        setupPickerView(pickerView: languagePickerView)
        view.addSubview(doneButton)
        
        let padding:CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            
            setCountryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            setCountryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            setCountryLabel.widthAnchor.constraint(equalToConstant: 160),
            setCountryLabel.heightAnchor.constraint(equalToConstant: padding),
            
            defaultCountryLabel.centerYAnchor.constraint(equalTo: setCountryLabel.centerYAnchor),
            defaultCountryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            defaultCountryLabel.widthAnchor.constraint(equalToConstant: 140),
            defaultCountryLabel.heightAnchor.constraint(equalToConstant: padding),
            
            countryPickerView.topAnchor.constraint(equalTo: setCountryLabel.bottomAnchor, constant: padding),
            countryPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : padding),
            countryPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            countryPickerView.heightAnchor.constraint(equalToConstant: 140),
            
            setLanguageLabel.topAnchor.constraint(equalTo: countryPickerView.bottomAnchor, constant: padding),
            setLanguageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            setLanguageLabel.widthAnchor.constraint(equalToConstant: 160),
            setLanguageLabel.heightAnchor.constraint(equalToConstant: padding),
            
            defaultLanguageLabel.centerYAnchor.constraint(equalTo: setLanguageLabel.centerYAnchor),
            defaultLanguageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            defaultLanguageLabel.widthAnchor.constraint(equalToConstant: 160),
            defaultLanguageLabel.heightAnchor.constraint(equalToConstant: padding),
            
            languagePickerView.topAnchor.constraint(equalTo: setLanguageLabel.bottomAnchor, constant: padding),
            languagePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : padding),
            languagePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            languagePickerView.heightAnchor.constraint(equalToConstant: 140),
            
            doneButton.topAnchor.constraint(equalTo: languagePickerView.bottomAnchor, constant: padding),
            doneButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 60 ),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            doneButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
}
extension PreferencesVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPickerView {
            return countries.count
        } else {
            return languages.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPickerView {
            return "\(countries[row])"
        } else {
            return "\(languages[row])"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countryPickerView {
            selectedCountry = countries[row]
        } else {
            selectedLanguage = languages[row]
        }
    }
    
}

//func makeButton(withText text: String) -> UIButton {
//    let button = UIButton(type: .system)
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.setTitle(text, for: .normal)
//    button.tintColor = .white
//    button.titleLabel?.adjustsFontSizeToFitWidth = true
//    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
//    button.backgroundColor = .systemBlue
//    button.layer.cornerRadius = 8
//    return button
//}

