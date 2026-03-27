import Foundation

struct IntakeFormData {
    var preferredLanguage: String = "en"
    var state: String = ""
    var issueType: IssueType = .general
    var needsProBono: Bool = false
    var additionalNotes: String = ""
    
    enum IssueType: String, CaseIterable {
        case general = "General"
        case detention = "Detention"
        case deportation = "Deportation"
        case asylum = "Asylum"
        case familySeparation = "Family Separation"
        case workplaceIssues = "Workplace Issues"
        
        var displayNameEN: String { rawValue }
        var displayNameES: String {
            switch self {
            case .general: return "General"
            case .detention: return "Detención"
            case .deportation: return "Deportación"
            case .asylum: return "Asilo"
            case .familySeparation: return "Separación Familiar"
            case .workplaceIssues: return "Problemas Laborales"
            }
        }
    }
}

struct MatchedResource: Identifiable {
    let id = UUID()
    let resource: LegalResource
    let score: Int
    let matchReasonsEN: [String]
    let matchReasonsES: [String]
    
    func matchReasons(language: String) -> [String] {
        language == "es" ? matchReasonsES : matchReasonsEN
    }
}
