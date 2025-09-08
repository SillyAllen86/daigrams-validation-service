import XCTVapor

final class AppTests: XCTestCase {
    func testHealthCheck() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        
        try app.test(.GET, "health") { res in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "OK")
        }
    }
}
