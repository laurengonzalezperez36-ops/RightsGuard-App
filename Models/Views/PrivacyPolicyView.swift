import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(languageSettings.translate("privacyTitle", "Privacy Policy", "Política de Privacidad"))
                    .font(.title)
                    .bold()
                
                Text(languageSettings.translate(
                    "privacyContent",
                    "RightsGuard is designed with privacy as a core principle. We do not collect, store, or transmit any personal information. No account creation is required. All preferences are stored locally on your device only. The app does not track your usage or share data with third parties. Legal resource information is provided for educational purposes only.",
                    "RightsGuard está diseñado con la privacidad como principio fundamental. No recopilamos, almacenamos ni transmitimos ninguna información personal. No se requiere creación de cuenta. Todas las preferencias se almacenan localmente solo en su dispositivo. La aplicación no rastrea su uso ni comparte datos con terceros. La información de recursos legales se proporciona solo con fines educativos."
                ))
                .font(.body)
                .lineSpacing(6)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
