import ProjectDescription

let project = Project(
    name: "Domain",
    targets: [
        Target(
            name: "Domain",
            platform: .iOS,
            product: .framework,
            bundleId: "com.cleanarchitecture.domain",
            infoPlist: .default,
            sources: ["Sources/**"]
        )
    ]
)
