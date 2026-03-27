import SwiftUI

@Observable
class LanguageSettings {
    var currentLanguage: String = "en" {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.string(forKey: "appLanguage") {
            currentLanguage = saved
        }
    }
    
    func translate(_ key: String, _ english: String, _ spanish: String) -> String {
        return currentLanguage == "es" ? spanish : english
    }
}
