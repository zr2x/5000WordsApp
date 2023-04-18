//
//  ViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 14.02.2023.
//

import UIKit
import SnapKit


class MainViewController: UIViewController{
    
    let questionService = QuestionService()
    var currentWord: WordModel?
    let defaults = UserDefaults.standard
    
    //Configure UI Control
    
    let mainStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    let questionStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .orange
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        return stack
    }()
    
    let answerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        return stack
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.text = "current progress"
        label.textColor = .blue
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return label
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.33
        progressView.progressTintColor = .blue
        progressView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        return progressView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    
    let phraseLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.heightAnchor.constraint(equalToConstant: 70).isActive = true
        return label
    }()
    
    let backToMenuButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(systemName: "arrowshape.turn.up.backward.circle")
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        
        questionService.fetchQuestions(jsonName: "words")
        currentWord = questionService.nextQuestion()
        updateViews()
    }
    
    //MARK: Configure View Hierarchy
    
    func updateViews() {
        
        phraseLabel.text = currentWord?.word ?? ""
        nameLabel.text = currentWord?.word ?? ""
        
        for view in answerStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        guard let variants = currentWord?.variants else { return }
        
        for variant in variants {
            answerStackView.addArrangedSubview(createAnswerButton(text: variant))
        }
    }
    
    func setupViews() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(questionStackView)
        mainStackView.addArrangedSubview(answerStackView)
        questionStackView.addArrangedSubview(progressLabel)
        questionStackView.addArrangedSubview(progressView)
        questionStackView.addArrangedSubview(nameLabel)
        questionStackView.addArrangedSubview(phraseLabel)
     
        guard let variants = currentWord?.variants else { return }
        
        for variant in variants {
            answerStackView.addArrangedSubview(createAnswerButton(text: variant))
        }
    }
    
    //Configure Layouting
    func setupConstraints() {
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func createAnswerButton(text: String) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemCyan
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        button.addTarget(self, action: #selector(nextQuestionTapped), for: .touchUpInside)
        return button
    }
    
    
    @objc private func nextQuestionTapped(sender: UIButton) {
        
        for view in answerStackView.subviews {
            if let button = view as? UIButton {
                button.isEnabled = false
            }
        }

        var correct = currentWord?.correct

        if sender.currentTitle == correct {
            sender.backgroundColor = .green
            //FIXME: force unwrap
            questionService.correctAnswers.append(sender.currentTitle ?? "")
            defaults.set(questionService.correctAnswers, forKey: "correct")
        } else {
            sender.backgroundColor = .red
            questionService.wrongAnswers.append(sender.currentTitle ?? "")
            defaults.set(questionService.wrongAnswers, forKey: "wrong")
          
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentWord = self.questionService.nextQuestion()
            self.updateViews()
        }
    }
    
    func back(sender: UIButton) {
        if sender == backToMenuButton {
            backToMenuButton.addTarget(self, action: #selector(backMenuSelector), for: .touchUpInside)
        }
    }
    
    @objc private func backMenuSelector() {
        let progressVC = ProgressViewController()
        present(progressVC, animated: true)
    }
}
