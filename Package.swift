// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExtensionLibrary",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ExtensionLibrary",
            targets: ["Bool", "Date", "Double", "Int", "String", "UIColor", "UIDeviceOrientation", "UIImage",
                     "UIInterfaceOrientation", "UITableView", "UIView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ExtensionLibrary",
            dependencies: []),
        .testTarget(
            name: "ExtensionLibraryTests",
            dependencies: ["ExtensionLibrary"]),
        
        .target(name: "Bool", path: "Sources/Bool"),
        .target(name: "Date", path: "Sources/Date"),
        .target(name: "Double", path: "Sources/Double"),
        .target(name: "Int", path: "Sources/Int"),
        .target(name: "String", path: "Sources/String"),
        .target(name: "UIColor", path: "Sources/UIColor"),
        .target(name: "UIDeviceOrientation", path: "Sources/UIDeviceOrientation"),
        .target(name: "UIImage", path: "Sources/UIImage"),
        .target(name: "UIInterfaceOrientation", path: "Sources/UIInterfaceOrientation"),
        .target(name: "UITableView", path: "Sources/UITableView"),
        .target(name: "UIView", path: "Sources/UIView"),
    ]
)
