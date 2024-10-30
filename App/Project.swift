import ProjectDescription


let infoPlist: [String: Plist.Value] = [
  "UILaunchStoryboardName": "LaunchScreen", // 화면 정상적으로 띄우기
  "CFBundleVersion": "1" // 번들 버전 오류 방지
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
  ]
)
