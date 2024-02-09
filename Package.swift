// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIRouter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SwiftUIRouter",
            targets: ["SwiftUIRouter"]
        ),
        .library(
            name: "SwiftUITabBar",
            targets: ["SwiftUITabBar"]
        )
    ],
    targets: [
        .target(
            name: "SwiftUIRouter",
            dependencies: []
        ),
        .target(
            name: "SwiftUITabBar",
            dependencies: []
        )
    ]
)
