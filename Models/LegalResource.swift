import Foundation

struct LegalResource: Identifiable, Codable {
    let id: String
    let nameEN: String
    let nameES: String
    let type: ResourceType
    let location: String
    let state: String
    let phoneNumber: String
    let email: String?
    let website: String?
    let servicesEN: [String]
    let servicesES: [String]
    let isProBono: Bool
    let isLowCost: Bool
    let languagesSpoken: [String]
    
    enum ResourceType: String, Codable, CaseIterable {
        case lawyer = "Lawyer"
        case organization = "Organization"
        case legalAid = "Legal Aid"
        
        var displayNameEN: String { rawValue }
        var displayNameES: String {
            switch self {
            case .lawyer: return "Abogado"
            case .organization: return "Organización"
            case .legalAid: return "Asistencia Legal"
            }
        }
        
        func displayName(language: String) -> String {
            language == "es" ? displayNameES : displayNameEN
        }
    }
    
    func name(language: String) -> String {
        language == "es" ? nameES : nameEN
    }
    
    func services(language: String) -> [String] {
        language == "es" ? servicesES : servicesEN
    }
}
