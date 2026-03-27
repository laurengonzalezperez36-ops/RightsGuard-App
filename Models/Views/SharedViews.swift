import SwiftUI

struct DisclaimerBanner: View {
    @Environment(LanguageSettings.self) private var languageSettings
    
    var body: some View {
        HStack {
            Image(systemName: "info.circle.fill")
                .foregroundStyle(.blue)
            Text(languageSettings.translate(
                "banner",
                "This is educational information, not legal advice",
                "Esta es información educativa, no consejo legal"
            ))
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.blue.opacity(0.1))
        .accessibilityElement(children: .combine)
    }
}

struct DisclaimerBox: View {
    @Environment(LanguageSettings.self) private var languageSettings
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(languageSettings.translate("disclaimer", "Important Disclaimer", "Aviso Importante"),
                  systemImage: "exclamationmark.triangle.fill")
                .font(.headline)
                .foregroundStyle(.orange)
            
            Text(languageSettings.translate("disclaimerText",
                "This information is for educational purposes only and does not constitute legal advice. Contact a qualified attorney for your specific situation.",
                "Esta información es solo para fines educativos y no constituye asesoramiento legal. Contacte a un abogado calificado para su situación específica."))
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(8)
        .padding(.top, 20)
        .accessibilityElement(children: .combine)
    }
}

struct ResourceRowView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let resource: LegalResource
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(resource.name(language: languageSettings.currentLanguage))
                .font(.headline)
            
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .font(.caption)
                Text("\(resource.location), \(resource.state)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            HStack(spacing: 6) {
                if resource.isProBono {
                    BadgeView(
                        text: languageSettings.translate("proBono", "Pro Bono", "Pro Bono"),
                        color: .green
                    )
                }
                if resource.isLowCost {
                    BadgeView(
                        text: languageSettings.translate("lowCost", "Low Cost", "Bajo Costo"),
                        color: .blue
                    )
                }
                BadgeView(
                    text: resource.type.displayName(language: languageSettings.currentLanguage),
                    color: .purple
                )
            }
        }
        .padding(.vertical, 4)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityDescription)
        .accessibilityHint(languageSettings.translate(
            "resourceHint",
            "Double tap to view details",
            "Toque dos veces para ver detalles"
        ))
    }
    
    private var accessibilityDescription: String {
        var description = resource.name(language: languageSettings.currentLanguage)
        description += ", \(resource.location), \(resource.state)"
        
        if resource.isProBono {
            description += ", " + languageSettings.translate("proBono", "Pro Bono", "Pro Bono")
        }
        if resource.isLowCost {
            description += ", " + languageSettings.translate("lowCost", "Low Cost", "Bajo Costo")
        }
        
        return description
    }
}

struct BadgeView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption2)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .background(color.opacity(0.15))
            .foregroundStyle(color)
            .cornerRadius(4)
    }
}

struct ContactSection: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let resource: LegalResource
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(languageSettings.translate("contact", "Contact Information", "Información de Contacto"))
                .font(.headline)
            
            ContactRow(icon: "phone.fill", text: resource.phoneNumber)
                .accessibilityLabel(languageSettings.translate(
                    "phoneLabel",
                    "Phone: \(resource.phoneNumber)",
                    "Teléfono: \(resource.phoneNumber)"
                ))
            
            if let email = resource.email {
                ContactRow(icon: "envelope.fill", text: email)
                    .accessibilityLabel(languageSettings.translate(
                        "emailLabel",
                        "Email: \(email)",
                        "Correo: \(email)"
                    ))
            }
            
            if let website = resource.website {
                ContactRow(icon: "globe", text: website)
                    .accessibilityLabel(languageSettings.translate(
                        "websiteLabel",
                        "Website: \(website)",
                        "Sitio web: \(website)"
                    ))
            }
        }
    }
}

struct ContactRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.blue)
                .frame(width: 20)
            Text(text)
                .font(.subheadline)
        }
    }
}

struct ServicesSection: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let resource: LegalResource
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(languageSettings.translate("services", "Services Offered", "Servicios Ofrecidos"))
                .font(.headline)
            
            ForEach(resource.services(language: languageSettings.currentLanguage), id: \.self) { service in
                HStack(alignment: .top) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                        .font(.caption)
                    Text(service)
                        .font(.subheadline)
                }
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(servicesAccessibilityLabel)
    }
    
    private var servicesAccessibilityLabel: String {
        let header = languageSettings.translate("services", "Services Offered", "Servicios Ofrecidos")
        let servicesList = resource.services(language: languageSettings.currentLanguage).joined(separator: ", ")
        return "\(header): \(servicesList)"
    }
}

struct LanguagesSection: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let languages: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(languageSettings.translate("languages", "Languages Spoken", "Idiomas Hablados"))
                .font(.headline)
            
            Text(languages.joined(separator: ", "))
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .accessibilityElement(children: .combine)
    }
}
