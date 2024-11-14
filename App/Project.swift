import ProjectDescription


let infoPlist: [String: Plist.Value] = [
  "UILaunchStoryboardName": "LaunchScreen", // Launch screen configuration
  "CFBundleVersion": "1", // Prevent bundle version error
  "UIApplicationSceneManifest": [
    "UIApplicationSupportsMultipleScenes": true,
    "UISceneConfigurations": [
      "UIWindowSceneSessionRoleApplication": [
        [
          "UISceneClassName": "UIWindowScene",
          "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
        ]
      ]
    ]
  ]
]

let project = Project(
  name: "CleanArchitecture",
  targets: [
    .target(
      name: "CleanArchitecture",
      destinations: .iOS,
      product: .app,
      bundleId: "com.cleanarchitecture.CleanArchitecture",
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        // Third party
        //        .external(name: "RxSwift", condition: .none),

        // Module
        .project(target: "Presentation", path: .relativeToRoot("Presentation/"), status: .required, condition: .none),
        .project(target: "Data", path: .relativeToRoot("Data/"), status: .required, condition: .none),
        .project(target: "Domain", path: .relativeToRoot("Domain/"), status: .required, condition: .none),
      ],
      settings: .settings(configurations: [
        .debug(name: "Debug"),
        .release(name: "Release"),
      ])
    ),

    .target(
      name: "CleanArchitectureUnitTests",
      destinations: .iOS,
      product: .unitTests,
      bundleId: "com.cleanarchitecture.CleanArchitectureUnitTests",
      infoPlist: .default,
      sources: ["UnitTests/**"],
      dependencies: [
        .target(name: "CleanArchitecture", status: .optional, condition: .none),
      ]
    ),

    .target(
      name: "CleanArchitectureUITests",
      destinations: .iOS,
      product: .uiTests,
      bundleId: "com.cleanarchitecture.CleanArchitectureUITests",
      infoPlist: .default,
      sources: ["UITests/**"],
      dependencies: [
        .target(name: "CleanArchitecture", status: .optional, condition: .none),
      ]
    ),

  ]
)
