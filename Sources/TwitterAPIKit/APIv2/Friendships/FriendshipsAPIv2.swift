import Foundation

public protocol FriendshipsAPIv2 {
    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-following
    func getFollowing(
        _ request: GetUsersFollowingRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/get-users-id-followers
    func getFollowers(
        _ request: GetUsersFollowersRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/post-users-source_user_id-following
    func follow(
        _ request: PostUsersFollowingRequestV2
    ) -> TwitterAPISessionJSONTask

    /// https://developer.twitter.com/en/docs/twitter-api/users/follows/api-reference/delete-users-source_id-following
    func unfollow(
        _ request: DeleteUsersFollowingRequestV2
    ) -> TwitterAPISessionJSONTask
}

extension TwitterAPIClient.TwitterAPIImplV2: FriendshipsAPIv2 {

    func getFollowing(_ request: GetUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func getFollowers(_ request: GetUsersFollowersRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func follow(_ request: PostUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }

    func unfollow(_ request: DeleteUsersFollowingRequestV2) -> TwitterAPISessionJSONTask {
        return session.send(request)
    }
}
