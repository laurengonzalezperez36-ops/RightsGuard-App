import SwiftUI

struct RightsLibraryView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    @State private var viewModel = RightsLibraryViewModel()
    @State private var searchText = ""
    @State private var selectedScenario: RightsArticle.Scenario?
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    DisclaimerBanner()
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }
                
                ForEach(RightsArticle.Scenario.allCases, id: \.self) { scenario in
                    Section(header: Text(scenario.displayName(language: languageSettings.currentLanguage))
                        .font(.headline)) {
                        ForEach(viewModel.articles(for: scenario)) { article in
                            NavigationLink(destination: RightsArticleDetailView(article: article)) {
                                HStack {
                                    Image(systemName: article.iconName)
                                        .foregroundStyle(.blue)
                                        .frame(width: 30)
                                    Text(article.title(language: languageSettings.currentLanguage))
                                }
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: Text(languageSettings.translate("search", "Search", "Buscar")))
            .navigationTitle(languageSettings.translate("title", "Know Your Rights", "Conozca Sus Derechos"))
        }
    }
}

private extension RightsArticle.Scenario {
    func displayName(language: String) -> String {
        language == "es" ? displayNameES : displayNameEN
    }
}
