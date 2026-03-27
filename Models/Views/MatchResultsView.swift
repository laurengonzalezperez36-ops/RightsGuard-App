import SwiftUI

struct MatchResultsView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let matches: [MatchedResource]
    let formData: IntakeFormData
    
    var body: some View {
        List {
            Section {
                DisclaimerBanner()
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
            }
            
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text(languageSettings.translate("resultsInfo", "Based on your preferences, we found \(matches.count) resources.", "Basado en sus preferencias, encontramos \(matches.count) recursos."))
                        .font(.subheadline)
                    Text(languageSettings.translate("privacyNote", "No personal data was stored.", "No se almacenaron datos personales."))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            
            ForEach(matches, id: \.id) { match in
                NavigationLink(destination: ResourceDetailView(resource: match.resource)) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(match.resource.name(language: languageSettings.currentLanguage))
                                .font(.headline)
                            Spacer()
                            Text("\(match.score)%")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(8)
                        }
                        
                        Text(match.matchReasons(language: languageSettings.currentLanguage).joined(separator: " • "))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle(languageSettings.translate("matchedResources", "Matched Resources", "Recursos Encontrados"))
    }
}
