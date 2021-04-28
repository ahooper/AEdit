// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "test",
    dependencies: [
		.package(name: "Antlr4",
				 path: "/Users/andy/Software/ANTLR/antlr4/runtime/Swift")
     ],
    targets: [
        .target(
            name: "test",
            dependencies: [
				"Antlr4"]),
        .testTarget(
            name: "testTests",
            dependencies: [
				"test"])
    ]
)
