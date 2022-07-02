import Foundation

public protocol TweetAPIv1 {

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-update
    func postUpdateStatus(
        _ request: PostStatusesUpdateRequestV1
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/post-statuses-destroy-id
    func postDestroyStatus(
        _ request: PostStatusesDestroyRequestV1
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-show-id
    func getShowStatus(
        _ request: GetStatusesShowRequestV1
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-lookup
    func getLookupStatuses(
        _ request: GetStatusesLookupRequestV1
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/v1/tweets/post-and-engage/api-reference/get-statuses-oembed
    // TODO↑
}

extension TwitterAPIClient.TwitterAPIImplV1: TweetAPIv1 {

    public func postUpdateStatus(
        _ request: PostStatusesUpdateRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    public func postDestroyStatus(
        _ request: PostStatusesDestroyRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    public func getShowStatus(
        _ request: GetStatusesShowRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    public func getLookupStatuses(
        _ request: GetStatusesLookupRequestV1
    ) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }
}
