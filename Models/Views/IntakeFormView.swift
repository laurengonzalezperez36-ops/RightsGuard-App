import SwiftUI

struct IntakeFormView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    @State private var viewModel = IntakeFormViewModel()
    @State private var formData = IntakeFormData()
    @State private var showResults = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(languageSettings.translate("preferences", "Your Preferences", "Sus Preferencias"))) {
                    Picker(languageSettings.translate("languageLabel", "Language", "Idioma"), selection: $formData.preferredLanguage) {
                        Text("English").tag("en")
                        Text("Español").tag("es")
                    }
                    
                    Picker(languageSettings.translate("stateLabel", "State", "Estado"), selection: $formData.state) {
                        Text(languageSettings.translate("selectState", "Select State", "Seleccione Estado")).tag("")
                        ForEach(["CA", "TX", "FL", "NY", "AZ"], id: \.self) { state in
                            Text(state).tag(state)
                        }
                    }
                    
                    Toggle(languageSettings.translate("needProBono", "Need Pro Bono Help", "Necesito Ayuda Gratuita"),
                           isOn: $formData.needsProBono)
                }
                
                Section(header: Text(languageSettings.translate("issueType", "Type of Issue", "Tipo de Problema"))) {
                    Picker(languageSettings.translate("issueLabel", "Issue", "Problema"), selection: $formData.issueType) {
                        ForEach(IntakeFormData.IssueType.allCases, id: \.self) { issue in
                            Text(issue.displayName(language: languageSettings.currentLanguage)).tag(issue)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section {
                    Button(action: {
                        viewModel.matchResources(formData: formData)
                        showResults = true
                    }) {
                        HStack {
                            Spacer()
                            Text(languageSettings.translate("findMatches", "Find Matching Resources", "Buscar Recursos"))
                                .bold()
                            Spacer()
                        }
                    }
                    .disabled(formData.state.isEmpty)
                    
                    Button(role: .destructive, action: {
                        formData = IntakeFormData()
                    }) {
                        HStack {
                            Spacer()
                            Text(languageSettings.translate("reset", "Reset Form", "Reiniciar Formulario"))
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle(languageSettings.translate("matchTitle", "Resource Matcher", "Recursos Personalizados"))
            .navigationDestination(isPresented: $showResults) {
                MatchResultsView(matches: viewModel.matchedResources, formData: formData)
            }
        }
    }
}
