// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "daigrams-validation-service",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.8.0"),
        .package(url: "https://github.com/vapor/redis.git", from: "4.5.0"),
        .package(url: "https://github.com/vapor/jwt.git", from: "4.2.2"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.3"),
        .package(url: "https://github.com/apple/swift-metrics.git", from: "2.4.1"),
        .package(url: "https://github.com/swift-server/swift-prometheus.git", from: "1.0.2"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Redis", package: "redis"),
                .product(name: "JWT", package: "jwt"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "Metrics", package: "swift-metrics"),
                .product(name: "Prometheus", package: "swift-prometheus"),
            ]
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .target(name: "App"),
                .product(name: "XCTVapor", package: "vapor"),
            ]
        ),
    ]
)
