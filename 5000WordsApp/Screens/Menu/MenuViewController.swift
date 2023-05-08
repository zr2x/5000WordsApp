//
//  MenuViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 10.04.2023.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Играть", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 7
        button.backgroundColor = .systemCyan
        button.setTitleColor(.lightGray, for: .highlighted)
        return button
    }()
    
    private let vocabularyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Словарь", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 7
        button.backgroundColor = .systemCyan
        button.setTitleColor(.lightGray, for: .highlighted)
        return button
    }()
    
    private let levelsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Уровни", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 7
        button.backgroundColor = .systemCyan
        button.setTitleColor(.lightGray, for: .highlighted)
        button.sizeToFit()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
        configureUI()
        startGameButton()
        vocabularyAction()
        levelsAction()
    }
    
    private func layoutUI() {
        view.addSubview(startButton)
        view.addSubview(vocabularyButton)
        view.addSubview(levelsButton)
    }
    
    private func configureUI() {
        startButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.left.right.equalTo(vocabularyButton)
            make.bottomMargin.equalTo(vocabularyButton.snp_topMargin).inset(-30)
        }
        
        vocabularyButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.centerY.centerX.equalToSuperview()
        }
        
        levelsButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.left.right.equalTo(vocabularyButton)
            make.topMargin.equalTo(vocabularyButton.snp_bottomMargin).inset(-30)
        }
    }
    
    private func startGameButton() {
        startButton.addTarget(self, action: #selector(startGameSelector), for: .touchUpInside)
    }
    
    private func vocabularyAction() {
        vocabularyButton.addTarget(self, action: #selector(vocabularySelector), for: .touchUpInside)
    }
    
    private func levelsAction() {
        levelsButton.addTarget(self, action: #selector(levelsSelector), for: .touchUpInside)
    }

    @objc private func startGameSelector() {
        present(GameViewController(), animated: true)
    }
    
    @objc private func vocabularySelector() {
        present(ProgressViewController(), animated: true)
    }
    
    @objc private func levelsSelector() {
        present(LevelsViewController(), animated: true)
    }
}
