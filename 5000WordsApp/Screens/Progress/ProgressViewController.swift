//
//  ProgressViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 03.04.2023.
//

import UIKit

class ProgressViewController: UIViewController {
    
    let menuArray = ["Все", "Правильно", "Неверно"]
    var words = [Word]()
    
    let questionService = QuestionService()
    let wordsArchiver = WordsArchiver()
    
    let segmentComponentView = SegmentComponentView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        tableView.register(WordCell.self, forCellReuseIdentifier: WordCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        questionService.fetchQuestions(jsonName: "words")
        words = questionService.allWords.shuffled()
        //tableView.reloadData()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(segmentComponentView)
    }
    
    private func setupConstraints() {
        
        segmentComponentView.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentComponentView.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }
        
    }
    
    //MARK: - Actions
    @objc private func segmentChangedAction(target: UISegmentedControl) {

    }
}

extension ProgressViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.reuseId, for: indexPath) as? WordCell else { return UITableViewCell() }
        
        cell.backgroundColor = .lightGray
        
        let word = words[indexPath.row]
        cell.update(word)
        return cell
    }
}
    
    

