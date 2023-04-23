//
//  MainTabBarController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 04.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var menuVC: GameViewController = {
       let controller = GameViewController()
       let image = UIImage(systemName: "book.closed")
       let selectedImage = UIImage(systemName: "book.closed")
       let tabItem = UITabBarItem.init(title: "Меню", image: image, selectedImage: selectedImage)
       controller.tabBarItem = tabItem
       return controller
   }()
    
    private var progressVC: ProgressViewController = {
        let controller = ProgressViewController()
        let image = UIImage(systemName: "character.book.closed.fill")
        let selectedImage = UIImage(systemName: "character.book.closed.fill")
        let tabItem = UITabBarItem.init(title: "Слова", image: image, selectedImage: selectedImage)
        controller.tabBarItem = tabItem
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        }
        
        private func setup() {
            tabBar.tintColor = .green
            tabBar.backgroundColor = .yellow
            viewControllers = [menuVC, progressVC]
        }
}


