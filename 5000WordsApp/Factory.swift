//
//  Factory.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 26.04.2023.
//

import UIKit
import SnapKit

enum ButtonStyle: Int {
    case startButton
    case dictionaryButton
    case answerButton
}

// Класс реализующий создание кнопки ответов
class Button: UIButton {
    //MARK: для чего реализация closure onAction?
    var onAction: (()->())?
    var title: String?
    
    init(style: ButtonStyle, title: String) {
        super.init(frame: .zero)
        
        switch style {
        case .answerButton: createAnswerButton(title: title)
        case .startButton: createStartButton(title: title)
        default: break
        }
        
        self.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonTapped(sender: UIButton) {
    }
    
    func createAnswerButton(title: String) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = .cyan
        self.layer.cornerRadius = 10
        
        //MARK: Вопрос layout релизовывать через snapkit / anchor?
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func createStartButton(title: String) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 7
        
        self.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
    }
    
    func createDictionaryButton(title: String) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = .white
        self.layer.cornerRadius = 7
        
        self.snp.makeConstraints { make in
            make.width.equalTo(120)
        }
    }
    
    
}
