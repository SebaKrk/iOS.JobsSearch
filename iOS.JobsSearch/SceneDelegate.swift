//
//  SceneDelegate.swift
//  iOS.JobsSearch
//
//  Created by Sebastian Sciuba on 21/01/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabbar()
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
    }
    
    func createStackOverflowNC() -> UINavigationController {
        let stackOverflowVC = StackOverflowVC()
        stackOverflowVC.title = "Stack Overflow"
        stackOverflowVC.tabBarItem = UITabBarItem(title: "StackOverflow", image: UIImage(named: "stackOverflow"), tag: 0)
        
        return UINavigationController(rootViewController: stackOverflowVC)
    }
    
    func createGitHubNC() ->UINavigationController {
        let gitHubVC = GitHubVC()
        gitHubVC.title = "GitHub"
        gitHubVC.tabBarItem = UITabBarItem(title: "Git", image: UIImage(named: "github"), tag: 1)
        
        return UINavigationController(rootViewController: gitHubVC)
    }
    
    func createBinarJobsNC() -> UINavigationController {
        let binarJobsVC = BinarJobsVC()
        binarJobsVC.title = "Binar Jobs"
        binarJobsVC.tabBarItem = UITabBarItem(title: "BinarJobs", image: UIImage(named: "binarjobs"), tag: 2)
        
        return UINavigationController(rootViewController: binarJobsVC)
    }
  
    func createBulldogNC() -> UINavigationController {
        let bulldogJobVC = BulldogJobVC()
        bulldogJobVC.title = "BulldogJob"
        bulldogJobVC.tabBarItem = UITabBarItem(title: "BulldogJob", image: UIImage(named: "bulldog"), tag: 3)
        
        return UINavigationController(rootViewController: bulldogJobVC)
    }
 
    func createFaceBookNC() -> UINavigationController {
        let faceBookVC = FaceBookVC()
        faceBookVC.title = "Developers iOS Poland: Jobs"
        faceBookVC.tabBarItem = UITabBarItem(title: "FaceBook", image: UIImage(named: "facebook"), tag: 4)
        
        return UINavigationController(rootViewController: faceBookVC)
    }
    func createNoFluffJobNC() -> UINavigationController {
        let noFluffJobsVC = NoFluffJobsVC()
        noFluffJobsVC.title = "NoFluffJobs"
        noFluffJobsVC.tabBarItem = UITabBarItem(title: "NoFluffJobs", image: UIImage(named: "noFluffJobs"), tag: 5)
    
        return UINavigationController(rootViewController: noFluffJobsVC)
    } // extra
    
    func createTabbar() -> UITabBarController {

        let tabbar  = UITabBarController()
        UITabBar.appearance().tintColor = .systemRed
        tabbar.viewControllers = [createStackOverflowNC(),createGitHubNC(),createBinarJobsNC() ,createBulldogNC(),createFaceBookNC()]
        
        return tabbar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

