import TwitterAPIKit
import XCTest

class UploadMediaUtilTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        MockURLProtocol.cleanup()
    }

    func testWithProcessing() throws {

        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIKit(
            .oauth(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: ""),
            configuration: config
        )

        var requestCount = 0
        MockURLProtocol.requestHandler = { request in
            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            var data = Data()
            switch requestCount {
            case 0:  // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                XCTAssertTrue(requestBodyString!.contains("command=INIT"))

                data = try! JSONSerialization.data(
                    withJSONObject: [
                        "media_id_string": "123",
                        "expires_after_secs": 1000,
                    ], options: [])

            case 1:  // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                XCTAssertTrue(requestBodyString!.contains("\r\nAPPEND\r\n"))
            case 2:  // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                XCTAssertTrue(requestBodyString!.contains("\r\nAPPEND\r\n"))
            case 3:  // FINALIZE
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                XCTAssertTrue(requestBodyString!.contains("command=FINALIZE"))

                data = try! JSONSerialization.data(
                    withJSONObject: [
                        "media_id_string": "123",
                        "size": 10,
                        "expires_after_secs": 200,
                        "processingInfo": [
                            "state": "pending",
                            "check_after_secs": 0,
                        ],
                    ], options: [])
            case 4:

                XCTAssertEqual(request.httpMethod, "GET")
                XCTAssertEqual(request.url?.path, "/1.1/media/upload.json")
                XCTAssertTrue(request.url!.query!.contains("command=STATUS"))

                data = try! JSONSerialization.data(
                    withJSONObject: [
                        "media_id_string": "123",
                        "check_after_secs": 0,
                        "processing_info": [
                            "state": "in_progress",
                            "progress_percent": 99,
                        ],
                    ], options: []
                )
            case 5:

                XCTAssertEqual(request.httpMethod, "GET")
                XCTAssertEqual(request.url?.path, "/1.1/media/upload.json")
                XCTAssertTrue(request.url!.query!.contains("command=STATUS"))

                data = try! JSONSerialization.data(
                    withJSONObject: [
                        "media_id_string": "123",
                        "expires_after_secs": 99,
                        "video": [
                            "video_type": "video/mp4"
                        ],
                        "processing_info": [
                            "state": "succeeded",
                            "progress_percent": 100,
                        ],
                    ], options: []
                )
            default:
                XCTFail()
            }

            return (
                HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: [:])!,
                data
            )
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f", uploadChunkSize: 2)) { response in
            XCTAssertFalse(response.isError)
            XCTAssertEqual(response.success, "123")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

    func testWithoutProcessing() throws {

        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]

        let client = TwitterAPIKit(
            .oauth(consumerKey: "", consumerSecret: "", oauthToken: "", oauthTokenSecret: ""),
            configuration: config
        )

        var requestCount = 0
        MockURLProtocol.requestHandler = { request in
            defer {
                requestCount += 1
            }
            let requestData = request.httpBodyStream.flatMap {
                try? Data(reading: $0)
            }
            let requestBodyString = requestData.flatMap {
                String(data: $0, encoding: .utf8)
            }
            var data = Data()
            switch requestCount {
            case 0:  // INIT
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                XCTAssertTrue(requestBodyString!.contains("command=INIT"))

                data = try! JSONSerialization.data(
                    withJSONObject: [
                        "media_id_string": "123",
                        "expires_after_secs": 1000,
                    ], options: [])

            case 1:  // APPEND
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                XCTAssertTrue(requestBodyString!.contains("\r\nAPPEND\r\n"))
            case 2:  // FINALIZE
                XCTAssertEqual(request.url?.absoluteString, "https://upload.twitter.com/1.1/media/upload.json")
                XCTAssertTrue(requestBodyString!.contains("command=FINALIZE"))

                data = try! JSONSerialization.data(
                    withJSONObject: [
                        "media_id_string": "123",
                        "size": 10,
                        "expires_after_secs": 200,
                    ], options: [])

            default:
                XCTFail()
            }

            return (
                HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: "2.0", headerFields: [:])!,
                data
            )
        }

        let exp = expectation(description: "")
        let data = Data([1, 2, 3])
        client.v1.media.uploadMedia(.init(media: data, mediaType: "m", filename: "f")) { response in
            XCTAssertFalse(response.isError)
            XCTAssertEqual(response.success, "123")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 10)
    }

}