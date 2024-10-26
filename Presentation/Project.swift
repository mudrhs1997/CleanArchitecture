import ProjectDescription

let project = Project(
    name: "Presentation",
    targets: [
        Target(
            name: "Presentation",
            platform: .iOS,
            product: .framework,
            bundleId: "com.cleanarchitecture.presentation",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Domain", path: "../Domain")
            ]
        )
    ]
)
