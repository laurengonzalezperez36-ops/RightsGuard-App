import Foundation

struct RightsArticle: Identifiable, Codable {
    let id: String
    let titleEN: String
    let titleES: String
    let contentEN: String
    let contentES: String
    let scenario: Scenario
    let iconName: String
    
    
    func title(language: String) -> String {
        language == "es" ? titleES : titleEN
    }
    
    func content(language: String) -> String {
        language == "es" ? contentES : contentEN
    }
    
    enum Scenario: String, Codable, CaseIterable {
        
        case iceEncounter = "ICE Encounter"
        case workplaceRaid = "Workplace Raid"
        case trafficStop = "Traffic Stop"
        case homeVisit = "Home Visit"
        case detention = "Detention"
        
        var displayNameEN: String {
            return self.rawValue
        }
        
        var displayNameES: String {
            switch self {
            case .iceEncounter: return "Encuentro con ICE"
            case .workplaceRaid: return "Redada Laboral"
            case .trafficStop: return "Parada de Tráfico"
            case .homeVisit: return "Visita Domiciliaria"
            case .detention: return "Detención"
            }
        }
    }
}
