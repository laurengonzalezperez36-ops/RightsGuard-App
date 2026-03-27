import SwiftUI

struct RightsArticleDetailView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    let article: RightsArticle
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image(systemName: article.iconName)
                        .font(.system(size: 40))
                        .foregroundStyle(.blue)
                    
                    Text(article.title(language: languageSettings.currentLanguage))
                        .font(.title)
                        .bold()
                }
                .padding(.bottom, 10)
                
                Divider()
                
                Text(article.content(language: languageSettings.currentLanguage))
                    .font(.body)
                    .lineSpacing(6)
                
                DisclaimerBox()
                
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
