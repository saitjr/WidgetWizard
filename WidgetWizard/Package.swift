// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WidgetWizard",
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "WidgetWizard"),
    ],
    dependencies: [
        .package(url: "git@github.com:swiftlang/swift-testing.git", from: "swift-6.1-DEVELOPMENT-SNAPSHOT-2025-03-03-a"),
    ]
)

