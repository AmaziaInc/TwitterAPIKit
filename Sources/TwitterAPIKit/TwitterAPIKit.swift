import Foundation

public enum TwitterAPIAuth {
    case oauth(
        consumerKey: String,
        consumerSecret: String,
        oauthToken: String?,
        oauthTokenSecret: String?
    )

    case basic(apiKey: String, apiSecretKey: String)

    case bearer(String)
}

public enum TwitterBaseURLType {
    case api
    case upload
}

public struct TwitterAPIEnvironment {
    let apiURL: URL
    let uploadURL: URL

    public init(
        apiURL: URL = URL(string: "https://api.twitter.com")!,
        uploadURL: URL = URL(string: "https://upload.twitter.com")!
    ) {
        self.apiURL = apiURL
        self.uploadURL = uploadURL
    }
}

open class TwitterAPIKit {

    public static var defaultJSONDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    public var v1: TwitterAPIv1 { return api }
    public var v2: TwitterAPIv2 { return api }

    private lazy var api: TwitterAPIImpl = {
        return TwitterAPIImpl(session: session)
    }()

    public let session: TwitterAPISession
    public var apiAuth: TwitterAPIAuth {
        return session.auth
    }

    public init(_ auth: TwitterAPIAuth, environment: TwitterAPIEnvironment = .init()) {
        session = TwitterAPISession(auth: auth, environment: environment)
    }

    public init(
        consumerKey: String,
        consumerSecret: String,
        oauthToken: String,
        oauthTokenSecret: String,
        environment: TwitterAPIEnvironment = .init()
    ) {
        session = TwitterAPISession(
            auth: .oauth(
                consumerKey: consumerKey,
                consumerSecret: consumerSecret,
                oauthToken: oauthToken,
                oauthTokenSecret: oauthTokenSecret),
            environment: environment
        )
    }
}

extension TwitterAPIKit {

    class TwitterAPIImpl {
        let session: TwitterAPISession
        init(session: TwitterAPISession) {
            self.session = session
        }
    }
}
