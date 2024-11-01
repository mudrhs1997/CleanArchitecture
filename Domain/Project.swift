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
        .external(name: "RxSwift", condition: .none),
        .external(name: "RxCocoa", condition: .none),

        // Module
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),
  ]
)

