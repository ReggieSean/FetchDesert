// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FetchDessertPkg",
    platforms:[.iOS(.v15)],
    products: [
        .library(
            name: "FetchDessertPkg",
            targets: ["FetchDessertPkg"]),
    ],
    targets: [
        .target(
            name: "FetchDessertPkg"),
        .testTarget(
            name: "FetchDessertPkgTests",
            dependencies: ["FetchDessertPkg"]),
    ]
)
