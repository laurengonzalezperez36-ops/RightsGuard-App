import SwiftUI

struct ResourceDirectoryView: View {
    @Environment(LanguageSettings.self) private var languageSettings
    @State private var viewModel = ResourceDirectoryViewModel()
    @State private var searchText = ""
    @State private var selectedState = "All"
    @State private var showProBonoOnly = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                FilterBar(selectedState: $selectedState, showProBonoOnly: $showProBonoOnly)
                
                List(viewModel.filteredResources(state: selectedState, proBonoOnly: showProBonoOnly, searchText: searchText)) { resource in
                    NavigationLink(destination: ResourceDetailView(resource: resource)) {
                        ResourceRowView(resource: resource)
                    }
                }
                .searchable(text: $searchText, prompt: Text(languageSettings.translate("searchPrompt", "Search resources", "Buscar recursos")))
            }
            .navigationTitle(languageSettings.translate("findHelp", "Find Legal Help", "Buscar Ayuda Legal"))
        }
    }
}

struct FilterBar: View {
    @Environment(LanguageSettings.self) private var languageSettings
    @Binding var selectedState: String
    @Binding var showProBonoOnly: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Picker(languageSettings.translate("stateLabel", "State", "Estado"), selection: $selectedState) {
                Text(languageSettings.translate("allStates", "All States", "Todos los Estados")).tag("All")
                ForEach(["CA", "TX", "FL", "NY", "AZ"], id: \.self) { state in
                    Text(state).tag(state)
                }
            }
            .pickerStyle(.segmented)
            
            Toggle(languageSettings.translate("proBono", "Pro Bono Only", "Solo Pro Bono"), isOn: $showProBonoOnly)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}
