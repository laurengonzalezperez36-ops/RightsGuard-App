import Foundation

@Observable
class RightsLibraryViewModel {
    private(set) var allArticles: [RightsArticle] = []
    
    init() {
        loadMockData()
    }
    
    func articles(for scenario: RightsArticle.Scenario) -> [RightsArticle] {
        return allArticles.filter { $0.scenario == scenario }
    }
    
    private func loadMockData() {
        allArticles = [
            RightsArticle(
                id: "ice1",
                titleEN: "Your Rights During an ICE Encounter",
                titleES: "Sus Derechos Durante un Encuentro con ICE",
                contentEN: "You have the right to remain silent. You do not have to answer questions about your immigration status or where you were born. You have the right to speak to a lawyer. If ICE agents approach you, stay calm and do not run. Ask if you are free to leave. If they say yes, walk away calmly.\n\nDo not open your door unless agents have a warrant signed by a judge. Ask them to slip the warrant under the door. A warrant must have your correct name and address.\n\nYou have the right to refuse to sign any documents without speaking to a lawyer first.",
                contentES: "Usted tiene el derecho de permanecer en silencio. No tiene que responder preguntas sobre su estado migratorio o dónde nació. Tiene el derecho de hablar con un abogado. Si agentes de ICE se le acercan, mantenga la calma y no corra. Pregunte si es libre de irse. Si dicen que sí, aléjese con calma.\n\nNo abra su puerta a menos que los agentes tengan una orden judicial firmada por un juez. Pídales que pasen la orden por debajo de la puerta. Una orden debe tener su nombre y dirección correctos.\n\nUsted tiene el derecho de negarse a firmar cualquier documento sin hablar primero con un abogado.",
                scenario: .iceEncounter,
                iconName: "shield.fill"
            ),
            RightsArticle(
                id: "work1",
                titleEN: "Workplace Raid: What To Do",
                titleES: "Redada Laboral: Qué Hacer",
                contentEN: "If immigration agents come to your workplace:\n\n1. Stay calm and do not run\n2. You have the right to remain silent\n3. Do not show false documents\n4. Ask to speak with a lawyer\n5. Do not sign anything without legal advice\n\nYour employer cannot fire you for refusing to answer immigration questions. Document everything that happens including agent names and badge numbers if possible.\n\nRemember: You have rights regardless of your immigration status.",
                contentES: "Si agentes de inmigración llegan a su lugar de trabajo:\n\n1. Mantenga la calma y no corra\n2. Tiene el derecho de permanecer en silencio\n3. No muestre documentos falsos\n4. Pida hablar con un abogado\n5. No firme nada sin asesoramiento legal\n\nSu empleador no puede despedirlo por negarse a responder preguntas de inmigración. Documente todo lo que sucede, incluyendo nombres y números de placa de agentes si es posible.\n\nRecuerde: Usted tiene derechos independientemente de su estado migratorio.",
                scenario: .workplaceRaid,
                iconName: "building.2.fill"
            ),
            RightsArticle(
                id: "traffic1",
                titleEN: "Traffic Stop Rights",
                titleES: "Derechos en Paradas de Tráfico",
                contentEN: "During a traffic stop:\n\n• You must show your driver's license, registration, and proof of insurance if requested\n• You do not have to answer questions about your immigration status\n• You can remain silent or say 'I want to speak to my lawyer'\n• Do not lie about your citizenship or show false documents\n• Police cannot extend the stop to question you about immigration without reasonable suspicion\n\nIf arrested, you have the right to make a phone call. Try to remember important phone numbers.",
                contentES: "Durante una parada de tráfico:\n\n• Debe mostrar su licencia de conducir, registro y prueba de seguro si se lo piden\n• No tiene que responder preguntas sobre su estado migratorio\n• Puede permanecer en silencio o decir 'Quiero hablar con mi abogado'\n• No mienta sobre su ciudadanía ni muestre documentos falsos\n• La policía no puede extender la parada para preguntarle sobre inmigración sin sospecha razonable\n\nSi lo arrestan, tiene derecho a hacer una llamada telefónica. Trate de recordar números telefónicos importantes.",
                scenario: .trafficStop,
                iconName: "car.fill"
            ),
            RightsArticle(
                id: "home1",
                titleEN: "Home Visits by Immigration Officers",
                titleES: "Visitas Domiciliarias de Oficiales de Inmigración",
                contentEN: "If immigration agents come to your home:\n\n• Do not open the door\n• Ask 'Who is it?' and 'What do you want?'\n• Ask them to slip any warrant under the door\n• A valid warrant must be signed by a judge and have the correct name and address\n• An ICE administrative warrant is NOT sufficient to enter your home\n• If they force entry, do not resist physically\n• Say 'I do not consent to your entry'\n• You have the right to remain silent and speak to a lawyer\n\nInform all household members of these rights.",
                contentES: "Si agentes de inmigración vienen a su hogar:\n\n• No abra la puerta\n• Pregunte '¿Quién es?' y '¿Qué desea?'\n• Pídales que pasen cualquier orden por debajo de la puerta\n• Una orden válida debe estar firmada por un juez y tener el nombre y dirección correctos\n• Una orden administrativa de ICE NO es suficiente para entrar a su hogar\n• Si fuerzan la entrada, no resista físicamente\n• Diga 'No doy consentimiento para su entrada'\n• Tiene el derecho de permanecer en silencio y hablar con un abogado\n\nInforme a todos los miembros del hogar sobre estos derechos.",
                scenario: .homeVisit,
                iconName: "house.fill"
            ),
            RightsArticle(
                id: "detention1",
                titleEN: "If You Are Detained",
                titleES: "Si Es Detenido",
                contentEN: "If you are detained by immigration:\n\n• Remain calm and respectful\n• Give your name only\n• Say 'I want to speak to a lawyer'\n• Do not discuss your case with anyone except your lawyer\n• Do not sign anything without legal advice\n• You have the right to contact your consulate\n• Keep phone numbers of lawyers and family members memorized\n• Ask about bond and deportation proceedings\n\nDocument your arrest: time, place, officer names if possible. Have family members contact legal aid organizations immediately.",
                contentES: "Si es detenido por inmigración:\n\n• Mantenga la calma y sea respetuoso\n• Dé solo su nombre\n• Diga 'Quiero hablar con un abogado'\n• No discuta su caso con nadie excepto su abogado\n• No firme nada sin asesoramiento legal\n• Tiene derecho a contactar a su consulado\n• Mantenga memorizados números telefónicos de abogados y familiares\n• Pregunte sobre fianza y procedimientos de deportación\n\nDocumente su arresto: hora, lugar, nombres de oficiales si es posible. Que sus familiares contacten organizaciones de asistencia legal inmediatamente.",
                scenario: .detention,
                iconName: "exclamationmark.shield.fill"
            )
        ]
    }
}
