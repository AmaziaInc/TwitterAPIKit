import Foundation

public protocol BlockAndMuteAPIv2 {

    /// https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/get-users-blocking
    func getBlockUsers(
        _ request: GetUsersBlockingRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/post-users-user_id-blocking
    func blockUser(
        _ request: PostUsersBlockingRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/blocks/api-reference/delete-users-user_id-blocking
    func unblockUser(
        _ request: DeleteUsersBlockingRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/get-users-muting
    func getMuteUsers(
        _ request: GetUsersMutingRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/post-users-user_id-muting
    func muteUser(
        _ request: PostUsersMutingRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/mutes/api-reference/delete-users-user_id-muting
    func unmuteUser(
        _ request: DeleteUsersMutingRequestV2
    ) -> TwitterAPISessionJSONTask
}

extension TwitterAPIClient.TwitterAPIImplV2: BlockAndMuteAPIv2 {

    func getBlockUsers(_ request: GetUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func blockUser(_ request: PostUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func unblockUser(_ request: DeleteUsersBlockingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func getMuteUsers(_ request: GetUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func muteUser(_ request: PostUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func unmuteUser(_ request: DeleteUsersMutingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }
}
