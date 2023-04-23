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
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 7
        return button
    }()
    
    private let vocabularyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Словарь", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 7
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layoutUI()
        configureUI()
        startGameButton()
        vocabularyAction()
    }
    
    private func layoutUI() {
        view.addSubview(startButton)
        view.addSubview(vocabularyButton)
    }
    
    private func configureUI() {
        startButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.centerX.centerY.equalToSuperview()
        }
        
        vocabularyButton.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.left.equalTo(startButton.snp.left)
            make.top.equalTo(startButton.snp_bottomMargin).inset(-30)
        }
    }
    
    private func startGameButton() {
        startButton.addTarget(self, action: #selector(startGameSelector), for: .touchUpInside)
    }
    
    private func vocabularyAction() {
        vocabularyButton.addTarget(self, action: #selector(vocabularySelector), for: .touchUpInside)
    }

    @objc private func startGameSelector() {
        present(GameViewController(), animated: true)
    }
    
    @objc private func vocabularySelector() {
        present(ProgressViewController(), animated: true)
    }
}
