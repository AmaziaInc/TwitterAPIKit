import Foundation

public protocol HelpAPIv1 {

    /// https://developer.twitter.com/en/docs/twitter-api/v1/developer-utilities/supported-languages/api-reference/get-help-languages
    func getSupportedLanguages(
        _ request: GetHelpLanguagesRequestV1
    ) -> TwitterAPISessionJSONTask
}

extension TwitterAPIClient.TwitterAPIImplV1: HelpAPIv1 {
    func getSupportedLanguages(
        _ request: GetHelpLanguagesRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }
}
