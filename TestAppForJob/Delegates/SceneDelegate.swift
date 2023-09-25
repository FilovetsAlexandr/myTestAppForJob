import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let vc = PhotosListViewController()
        vc.viewModel = PhotosListViewModel(service: ServiceImpl())
        let nc = UINavigationController(rootViewController: vc)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}
