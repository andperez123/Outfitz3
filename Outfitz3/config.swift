import Foundation

struct Config {
    static var openAIAPIKey: String {
        return getAPIKey(for: "openAIAPIKey")
    }
    
    static var customImageAPIKey: String {
        return getAPIKey(for: "customImageAPIKey")
    }
    
    private static func getAPIKey(for key: String) -> String {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let apiKey = plist[key] as? String else {
            fatalError("Couldn't find key '\(key)' in 'Config.plist'.")
        }
        return apiKey
    }
}
