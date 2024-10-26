import ProjectDescription

let infoPlist: [String: Plist.Value] = [
  "UILaunchStoryboardName": "LaunchScreen", // 화면 정상적으로 띄우기
  "CFBundleVersion": "1" // 번들 버전 오류 방지
]

let project = Project(
  name: "CleanArchitecture",
  targets: [
    Target(
      name: "CleanArchitecture",
      platform: .iOS,
      product: .app,
      bundleId: "com.cleanarchitecture.CleanArchitecture",
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "Presentation", path: "../Presentation"),
        .project(target: "Data", path: "../Data"),
        .project(target: "Domain", path: "../Domain")
      ]
    )
  ]
)
