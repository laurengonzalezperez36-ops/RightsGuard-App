import SwiftUI

struct SettingsView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    
    var body: some View {
        @Bindable var settings = languageSettings
        
        NavigationStack {
            Form {
                Section(header: Text(languageSettings.translate("language", "Language", "Idioma"))) {
                    Picker("Language", selection: $settings.currentLanguage) {
                        Text("English").tag("en")
                        Text("Español").tag("es")
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text(languageSettings.translate("about", "About", "Acerca de"))) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundStyle(.secondary)
                    }
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Text(languageSettings.translate("privacy", "Privacy Policy", "Política de Privacidad"))
                    }
                }
                
                Section {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(languageSettings.translate("privacyFirst", "Privacy-First Design", "Diseño que Prioriza la Privacidad"))
                            .font(.headline)
                        Text(languageSettings.translate("privacyDesc", "This app does not require account creation and does not store any personal information. All data stays on your device.", "Esta aplicación no requiere creación de cuenta y no almacena información personal. Todos los datos permanecen en su dispositivo."))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle(languageSettings.translate("settings", "Settings", "Configuración"))
        }
    }
}
