import Foundation

@Observable
class ResourceDirectoryViewModel {
    private(set) var allResources: [LegalResource] = []
    
    init() {
        loadMockData()
    }
    
    func filteredResources(state: String, proBonoOnly: Bool, searchText: String) -> [LegalResource] {
        var filtered = allResources
        
        if state != "All" && !state.isEmpty {
            filtered = filtered.filter { $0.state == state }
        }
        
        if proBonoOnly {
            filtered = filtered.filter { $0.isProBono }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { resource in
                resource.nameEN.localizedCaseInsensitiveContains(searchText) ||
                resource.nameES.localizedCaseInsensitiveContains(searchText) ||
                resource.location.localizedCaseInsensitiveContains(searchText) ||
                resource.servicesEN.contains(where: { $0.localizedCaseInsensitiveContains(searchText) }) ||
                resource.servicesES.contains(where: { $0.localizedCaseInsensitiveContains(searchText) })
            }
        }
        
        return filtered
    }
    
    private func loadMockData() {
        allResources = [
            LegalResource(
                id: "r1",
                nameEN: "Immigration Justice Project",
                nameES: "Proyecto de Justicia Migratoria",
                type: .legalAid,
                location: "Los Angeles",
                state: "CA",
                phoneNumber: "(555) 123-4567",
                email: "help@ijp.org",
                website: "www.ijp.org",
                servicesEN: ["Deportation defense", "Asylum cases", "Family reunification"],
                servicesES: ["Defensa contra deportación", "Casos de asilo", "Reunificación familiar"],
                isProBono: true,
                isLowCost: false,
                languagesSpoken: ["English", "Spanish", "Mandarin"]
            ),
            LegalResource(
                id: "r2",
                nameEN: "Garcia & Associates Immigration Law",
                nameES: "García y Asociados Ley de Inmigración",
                type: .lawyer,
                location: "Houston",
                state: "TX",
                phoneNumber: "(555) 234-5678",
                email: "contact@garcialaw.com",
                website: "www.garcialaw.com",
                servicesEN: ["All immigration matters", "DACA", "Green cards"],
                servicesES: ["Todos los asuntos de inmigración", "DACA", "Tarjetas verdes"],
                isProBono: false,
                isLowCost: true,
                languagesSpoken: ["English", "Spanish"]
            ),
            LegalResource(
                id: "r3",
                nameEN: "Central Florida Immigrant Rights Center",
                nameES: "Centro de Derechos de Inmigrantes del Centro de Florida",
                type: .organization,
                location: "Orlando",
                state: "FL",
                phoneNumber: "(555) 345-6789",
                email: "info@cfirc.org",
                website: "www.cfirc.org",
                servicesEN: ["Legal consultations", "Know your rights workshops", "Detention support"],
                servicesES: ["Consultas legales", "Talleres conozca sus derechos", "Apoyo en detención"],
                isProBono: true,
                isLowCost: false,
                languagesSpoken: ["English", "Spanish", "Creole"]
            ),
            LegalResource(
                id: "r4",
                nameEN: "New York Immigration Coalition",
                nameES: "Coalición de Inmigración de Nueva York",
                type: .organization,
                location: "New York",
                state: "NY",
                phoneNumber: "(555) 456-7890",
                email: "help@nyic.org",
                website: "www.nyic.org",
                servicesEN: ["Legal referrals", "Community support", "Advocacy"],
                servicesES: ["Referencias legales", "Apoyo comunitario", "Defensa de derechos"],
                isProBono: true,
                isLowCost: false,
                languagesSpoken: ["English", "Spanish", "Arabic", "Bengali"]
            ),
            LegalResource(
                id: "r5",
                nameEN: "Arizona Immigration Legal Services",
                nameES: "Servicios Legales de Inmigración de Arizona",
                type: .legalAid,
                location: "Phoenix",
                state: "AZ",
                phoneNumber: "(555) 567-8901",
                email: "intake@azils.org",
                website: "www.azils.org",
                servicesEN: ["Deportation defense", "Asylum", "VAWA cases"],
                servicesES: ["Defensa contra deportación", "Asilo", "Casos VAWA"],
                isProBono: true,
                isLowCost: true,
                languagesSpoken: ["English", "Spanish"]
            )
        ]
    }
}
