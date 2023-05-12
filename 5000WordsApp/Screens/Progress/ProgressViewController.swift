//
//  ProgressViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 03.04.2023.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var words = [WordModel]()
    let questionService = QuestionService()
    let wordsArchiver = WordsArchiver(type: .all)
    let knownArchiver = WordsArchiver(type: .known)
    let unknownArchiver = WordsArchiver(type: .unknown)

    
    let segmentComponentView = SegmentComponentView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WordCell.self, forCellReuseIdentifier: WordCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        
        segmentComponentView.onAction = { segmentIndex in
            
            switch segmentIndex {
            case 0:
                self.words = self.wordsArchiver.retrieve()
            case 1:
                self.words = self.unknownArchiver.retrieve()
            case 2:
                self.words = self.knownArchiver.retrieve()
            default: break
            }
            
            self.tableView.reloadData()
        }
        
        questionService.fetchQuestions(jsonName: "words")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.segmentComponentView.segment.selectedSegmentIndex = 0
            self.words = self.wordsArchiver.retrieve()
            self.tableView.reloadData()
        }
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

}

extension ProgressViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.reuseId, for: indexPath) as? WordCell else { return UITableViewCell() }
        
        let word = words[indexPath.row]
        cell.update(word)
        return cell
    }
}
    
    

