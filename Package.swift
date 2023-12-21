// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AEComponentsKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AEComponentsKit",
            targets: ["AEComponentsKit"]
        )
    ],
    targets: [
        .target(
            name: "AEComponentsKit"
        ),
        .testTarget(
            name: "AEComponentsKitTests",
            dependencies: ["AEComponentsKit"]
        )
    ]
)
