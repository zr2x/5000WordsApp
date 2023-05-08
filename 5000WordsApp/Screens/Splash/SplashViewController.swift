//
//  LoadAnimation.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 23.04.2023.
//

import UIKit
import Lottie

final class SplashViewController: UIViewController {
    
    let questionService = QuestionService()
    
    private lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.animation = LottieAnimation.named("studying")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        return animationView
    }()
    
    
    override func viewDidLoad() {
        setup()
        
        animationView.play(fromProgress: 0, toProgress: 1, loopMode: .playOnce) { finished in
            if finished {
                
                self.showMenuScreen()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                    self.animationView.stop()
                }
            }
        }
        
        questionService.fetchQuestions(jsonName: "words")
        
        
        
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(animationView)
    }
    
    //MARK: - Navigation
    
    func showMenuScreen() {
        let menuVC = MenuViewController()
        menuVC.modalPresentationStyle = .overFullScreen
        self.present(menuVC, animated: false)
    }
}
