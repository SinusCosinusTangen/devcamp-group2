//
//  AppDelegate.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import UIKit
import RxSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var navigationController: UINavigationController = {
        let controller = UINavigationController()
        controller.setNavigationBarHidden(true, animated: true)
        controller.overrideUserInterfaceStyle = .light
        controller.view.backgroundColor = .white
        return controller
    }()
    lazy var appSceneDIContainer: AppSceneDIContainer = {
        return AppSceneDIContainer(navigationController: self.navigationController)
    }()
    lazy var appFlowCoordinator: AppFlowCoordinator = {
        return AppFlowCoordinator(
            navigationController: self.navigationController,
            presentationFactory: self.appSceneDIContainer,
            useCaseFactory: self.appSceneDIContainer
        )
    }()
    var appFlowCoordinatorInstructor: AppFlowCoordinator.Instructor?
    var disposeBag = DisposeBag()
    
    public static let shared = AppDelegate()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.appFlowCoordinatorInstructor = .dashboard
        if let appFlowCoordinatorInstructor = self.appFlowCoordinatorInstructor {
            self.appFlowCoordinator.start(with: appFlowCoordinatorInstructor)
            self.appFlowCoordinatorInstructor = nil
        }
        self.window?.rootViewController = self.navigationController
        
        return true
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

