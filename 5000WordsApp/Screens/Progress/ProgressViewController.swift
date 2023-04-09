//
//  ProgressViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 03.04.2023.
//

import UIKit

class ProgressViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let menuArray = ["Правильно", "Неверно"]
    
    let questionService = QuestionService()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: menuArray.self)
        segment.frame = CGRect(x: 100, y: 60, width: 200, height: 30)
        return segment
    }()
    
    var words = [Word]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableVIew()
        view.addSubview(segmentedControl)
        handleSegmentControl()
        
        questionService.fetchQuestions(jsonName: "words")
        words = questionService.allWords.shuffled()
        //tableView.reloadData()
    }
    
    private func configureTableVIew() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifire)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func handleSegmentControl() {
        segmentedControl.addTarget(self, action: #selector(changeVC(target:)), for: .valueChanged)
    }
    
    @objc private func changeVC(target: UISegmentedControl) {
//        if target == segmentedControl {
//            let newVC = UIViewController()
//            newVC.view.backgroundColor = .yellow
//            present(newVC, animated: true)
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifire, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = .lightGray
        let path = words[indexPath.row]
        cell.textLabel?.text = path.word
        
        return cell
    }
    


}
