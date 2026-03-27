import Foundation

@Observable
class IntakeFormViewModel {
    private(set) var matchedResources: [MatchedResource] = []
    private let resourceService = ResourceDirectoryViewModel()
    
    func matchResources(formData: IntakeFormData) {
        let allResources = resourceService.allResources
        var scored: [MatchedResource] = []
        
        for resource in allResources {
            // REQUIRE exact state match - skip if wrong state
            guard resource.state == formData.state else {
                continue
            }
            
            var score = 0
            var reasonsEN: [String] = []
            var reasonsES: [String] = []
            
            if resource.state == formData.state {
                score += 40
                reasonsEN.append("Same state")
                reasonsES.append("Mismo estado")
            }
            
            if formData.needsProBono && resource.isProBono {
                score += 30
                reasonsEN.append("Pro bono available")
                reasonsES.append("Pro bono disponible")
            } else if !formData.needsProBono && resource.isLowCost {
                score += 15
                reasonsEN.append("Low cost option")
                reasonsES.append("Opción de bajo costo")
            }
            
            if resource.languagesSpoken.contains(where: { lang in
                (formData.preferredLanguage == "es" && lang.contains("Spanish")) ||
                (formData.preferredLanguage == "en" && lang.contains("English"))
            }) {
                score += 20
                reasonsEN.append("Speaks your language")
                reasonsES.append("Habla su idioma")
            }
            
            let issueKeywords = getIssueKeywords(for: formData.issueType)
            let hasMatchingService = resource.servicesEN.contains { service in
                issueKeywords.contains { keyword in
                    service.localizedCaseInsensitiveContains(keyword)
                }
            }
            
            if hasMatchingService {
                score += 10
                reasonsEN.append("Handles your issue type")
                reasonsES.append("Maneja su tipo de problema")
            }
            
            if score >= 30 {
                scored.append(MatchedResource(
                    resource: resource,
                    score: score,
                    matchReasonsEN: reasonsEN,
                    matchReasonsES: reasonsES
                ))
            }
        }
        
        matchedResources = scored.sorted { $0.score > $1.score }
    }
    
    private func getIssueKeywords(for issueType: IntakeFormData.IssueType) -> [String] {
        switch issueType {
        case .detention: return ["detention", "deportation", "defense"]
        case .deportation: return ["deportation", "defense", "removal"]
        case .asylum: return ["asylum", "refugee"]
        case .familySeparation: return ["family", "reunification"]
        case .workplaceIssues: return ["workplace", "employment", "labor"]
        case .general: return ["immigration", "legal"]
        }
    }
}
