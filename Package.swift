// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Aluminum",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "Aluminum", targets: ["Aluminum"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Aluminum",
            dependencies: [
            ],
            path: "Aluminum"
        )
    ]
)
