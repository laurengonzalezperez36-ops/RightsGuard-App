import Foundation

extension IntakeFormData.IssueType {
    func displayName(language: String) -> String {
        language == "es" ? displayNameES : displayNameEN
    }
}

