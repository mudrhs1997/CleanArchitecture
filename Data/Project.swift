import ProjectDescription


let project = Project(
  name: "Data",
  targets: [
    .target(
      name: "Data",
      destinations: .iOS,
      product: .framework,
      bundleId: "com.cleanarchitecture.Data",
      sources: ["Sources/**"],
      dependencies: [
        // Third party
        .external(name: "RxSwift", condition: .none),

        // Module
        .project(target: "Domain", path: .relativeToRoot("Domain/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
  ]
)


