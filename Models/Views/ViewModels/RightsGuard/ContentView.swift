import SwiftUI

struct ContentView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            RightsLibraryView()
                .tabItem {
                    Label(localizedString("Know Your Rights"), systemImage: "book.fill")
                }
                .tag(0)
            
            ResourceDirectoryView()
                .tabItem {
                    Label(localizedString("Find Help"), systemImage: "magnifyingglass")
                }
                .tag(1)
            
            IntakeFormView()  // ← Replace the Text placeholder with this
                .tabItem {
                    Label(localizedString("Match Resources"), systemImage: "list.bullet.rectangle")
                }
                .tag(2)
            
            SettingsView()
                .tabItem {
                    Label(localizedString("Settings"), systemImage: "gear")
                }
                .tag(3)
        }
    }
    
    private func localizedString(_ key: String) -> String {
        let translations: [String: [String: String]] = [
            "Know Your Rights": ["en": "Know Your Rights", "es": "Conozca Sus Derechos"],
            "Find Help": ["en": "Find Help", "es": "Buscar Ayuda"],
            "Match Resources": ["en": "Match Resources", "es": "Recursos Personalizados"],
            "Settings": ["en": "Settings", "es": "Configuración"]
        ]
        return translations[key]?[languageSettings.currentLanguage] ?? key
    }
}
