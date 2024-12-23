import ProjectDescription


let project = Project(
  name: "Domain",
  targets: [
    .target(
      name: "Domain",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.cleanarchitecture.Domain",
      sources: ["Sources/**"],
      dependencies: [
        // Third party

        // Module
        .project(target: "Common", path: .relativeToRoot("Common/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
  ]
)

