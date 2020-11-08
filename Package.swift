// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "TokamakApp",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "TokamakApp", targets: ["TokamakApp"])
    ],
    dependencies: [
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", .revision("9681b91a840fc6938ddff07b32d513f97c6f6520"))
    ],
    targets: [
        .target(
            name: "TokamakApp",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
        .testTarget(
            name: "TokamakAppTests",
            dependencies: ["TokamakApp"]),
    ]
)
