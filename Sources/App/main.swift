import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)

let app = Application(env)
defer { app.shutdown() }

// Configure routes
app.get("health") { req async throws -> String in
    return "OK"
}

try app.run()
