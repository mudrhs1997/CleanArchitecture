import UIKit
import Presentation
import Data
import Domain

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let repository = RepositoryImpl() // Data layer
    let useCase = UseCase(repository: repository) // Domain layer
    let viewModel = ViewModel(useCase: useCase) // Presentation layer

    // Set up UI with view model, etc.
    window = UIWindow(frame: UIScreen.main.bounds)

    let viewController = ViewController(viewModel: viewModel)

    // Set up Coordinator if using the Coordinator pattern (optional)
    //            appCoordinator = AppCoordinator(window: window, rootViewController: initialViewController)
    //            appCoordinator?.start()

    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
    return true
  }
}
