import SwiftUI

struct ResourceDetailView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let resource: LegalResource
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(resource.name(language: languageSettings.currentLanguage))
                    .font(.title)
                    .bold()
                
                TagsView(resource: resource)
                
                Divider()
                
                ContactSection(resource: resource)
                
                if !resource.servicesEN.isEmpty {
                    ServicesSection(resource: resource)
                }
                
                LanguagesSection(languages: resource.languagesSpoken)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TagsView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let resource: LegalResource
    
    var body: some View {
        HStack {
            if resource.isProBono {
                Tag(text: languageSettings.translate("proBono", "Pro Bono", "Pro Bono"), color: .green)
            }
            if resource.isLowCost {
                Tag(text: languageSettings.translate("lowCost", "Low Cost", "Bajo Costo"), color: .blue)
            }
            Tag(text: resource.type.displayName(language: languageSettings.currentLanguage), color: .purple)
        }
    }
}

struct Tag: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(color.opacity(0.2))
            .foregroundStyle(color)
            .cornerRadius(8)
    }
}
