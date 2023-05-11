//
//  MenuViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 10.04.2023.
//

import UIKit
import SnapKit

class MenuViewController: UIViewController {
    
    let progressComponentView = ProgressComponentView()
    
    private let progressStackView: UIStackView = {
        let progressStackView = UIStackView()
        progressStackView.axis = .vertical
        progressStackView.backgroundColor = .systemCyan
        progressStackView.distribution = .fill
        progressStackView.spacing = 5
        progressStackView.layer.cornerRadius = 10
        return progressStackView
    }()
    
    private let levelStackView: UIStackView = {
        let levelStackView = UIStackView()
        levelStackView.axis = .horizontal
        levelStackView.distribution = .equalSpacing
        return levelStackView
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let currentLevelLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш текущий уровень A1 (Elementary)"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    private let firstLevelLabel: UILabel = {
        let firstLevelLabel = UILabel()
        firstLevelLabel.text = "A1"
        firstLevelLabel.font = UIFont.systemFont(ofSize: 20)
        return firstLevelLabel
    }()
    
    private let secondLevelLabel: UILabel = {
        let secondLevelLabel = UILabel()
        secondLevelLabel.text = "A2"
        secondLevelLabel.font = UIFont.systemFont(ofSize: 20)
        return secondLevelLabel
    }()
    
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
        view.addSubview(progressStackView)
        view.addSubview(buttonStackView)
        
        progressStackView.addArrangedSubview(currentLevelLabel)
        progressStackView.addArrangedSubview(levelStackView)
        progressStackView.addArrangedSubview(progressComponentView)
        
        levelStackView.addArrangedSubview(firstLevelLabel)
        levelStackView.addArrangedSubview(secondLevelLabel)

        buttonStackView.addArrangedSubview(startButton)
        buttonStackView.addArrangedSubview(vocabularyButton)
        buttonStackView.addArrangedSubview(levelsButton)
    }
    
    private func configureUI() {
        
        progressStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(150)
            make.height.equalTo(100)
        }
        
        levelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.left.right.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(150)
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
