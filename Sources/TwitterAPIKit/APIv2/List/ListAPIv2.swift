import Foundation

public protocol ListAPIv2 {

    /// https://developer.twitter.com/en/docs/twitter-api/lists/list-tweets/api-reference/get-lists-id-tweets
    func getListTweets(
        _ request: GetListsTweetsRequestV2
    ) -> TwitterAPISessionJSONTask
}

extension TwitterAPIKit.TwitterAPIImplV2: ListAPIv2 {

    func getListTweets(_ request: GetListsTweetsRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }
}
