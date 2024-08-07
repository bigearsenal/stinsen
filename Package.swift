// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Stinsen",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9),
    ],
    products: [
        .library(name: "Stinsen", targets: ["Stinsen"]),
    ],
    targets: [
        .target(name: "Stinsen"),
    ]
)
