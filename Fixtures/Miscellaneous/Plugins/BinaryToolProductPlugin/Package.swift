// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "MyBinaryToolPlugin",
    dependencies: [
        .package(path: "Dependency"),
    ],
    targets: [
        // A local tool that uses a build tool plugin.
        .executableTarget(
            name: "MyLocalTool",
            plugins: [
                "MySourceGenBuildToolPlugin",
            ]
        ),
        // The plugin that generates build tool commands to invoke MySourceGenBuildTool.
        .plugin(
            name: "MySourceGenBuildToolPlugin",
            capability: .buildTool(),
            dependencies: [
                .product(name: "MyVendedSourceGenBuildTool", package: "Dependency"),
            ]
        ),
    ]
)
