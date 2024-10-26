import ProjectDescription

let project = Project(
    name: "Data",
    targets: [
        Target(
            name: "Data",
            platform: .iOS,
            product: .framework,
            bundleId: "com.cleanarchitecture.data",
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .project(target: "Domain", path: "../Domain")
            ]
        )
    ]
)
