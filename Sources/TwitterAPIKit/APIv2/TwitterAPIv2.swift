import Foundation

// https://developer.twitter.com/en/docs/api-reference-index

public typealias TwitterAPIv2 =
    TwitterAPIResourceV2
    & BlockAndMuteAPIv2
    & BookmarksAPIv2
    & ComplianceAPIv2
    & FriendshipsAPIv2
    & LikeAPIv2
    & ListAPIv2
    & RetweetAPIv2
    & SearchAPIv2
    & SpacesAPIv2
    & StreamAPIv2
    & TimelineAPIv2
    & TweetAPIv2
    & TweetCountAPIv2
    & UserAPIv2

public protocol TwitterAPIResourceV2 {
    var blockAndMute: BlockAndMuteAPIv2 { get }
    var bookmarks: BookmarksAPIv2 { get }
    var compliance: ComplianceAPIv2 { get }
    var friendships: FriendshipsAPIv2 { get }
    var like: LikeAPIv2 { get }
    var list: ListAPIv2 { get }
    var retweet: RetweetAPIv2 { get }
    var search: SearchAPIv2 { get }
    var spaces: SpacesAPIv2 { get }
    var stream: StreamAPIv2 { get }
    var timeline: TimelineAPIv2 { get }
    var tweet: TweetAPIv2 { get }
    var tweetCount: TweetCountAPIv2 { get }
    var user: UserAPIv2 { get }
}

extension TwitterAPIClient.TwitterAPIImplV2: TwitterAPIResourceV2 {
    var blockAndMute: BlockAndMuteAPIv2 { return self }
    var bookmarks: BookmarksAPIv2 { return self }
    var friendships: FriendshipsAPIv2 { return self }
    var compliance: ComplianceAPIv2 { return self }
    var like: LikeAPIv2 { return self }
    var list: ListAPIv2 { return self }
    var retweet: RetweetAPIv2 { return self }
    var search: SearchAPIv2 { return self }
    var spaces: SpacesAPIv2 { return self }
    var stream: StreamAPIv2 { return self }
    var timeline: TimelineAPIv2 { return self }
    var tweet: TweetAPIv2 { return self }
    var tweetCount: TweetCountAPIv2 { return self }
    var user: UserAPIv2 { return self }
}

public protocol TwitterAPIv2RequestParameter {
    var stringValue: String { get }
}

extension Collection where Element: TwitterAPIv2RequestParameter {
    var commaSeparatedString: String {
        return map { $0.stringValue }.sorted().joined(separator: ",")
    }
}
