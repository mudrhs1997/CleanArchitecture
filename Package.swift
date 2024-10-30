// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "RxSwift": .framework, // default is .staticFramework
        ]
    )

#endif

let package = Package(
    name: "RxProject",
    dependencies: [
      .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
    ],
    targets: [
      .target(name: "RxProject", dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
    ]
)