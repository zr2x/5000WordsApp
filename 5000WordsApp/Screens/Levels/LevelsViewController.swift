//
//  LevelsTableViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 30.04.2023.
//

import UIKit
import SnapKit

class LevelsViewController: UIViewController {
    
//    let levelsDictionary = ["A1 (Elementary)": 500,
//                            "A2 (Pre-intermediate)": 1000,
//                            "B1 (Intermediate)": 2000,
//                            "B2 (Upper-intermediate)": 4000,
//                            "C1 (Advanced)": 8000,
//                            "C2 (Proficiency)": 16000]
    let levelLanguage = ["A1 (Elementary)", "A2 (Pre-intermediate)", "B1 (Intermediate)", "B2 (Upper-intermediate)", "C1 (Advanced)",  "C2 (Proficiency)"]
    let quantityWords = ["500", "1000", "2000", "4000", "8000", "16000"]
    
    let buttonImage = UIImage(systemName: "questionmark.circle.fill")
    
    let allertMessage = """
    Уровни языка - это различные ступени или уровни сложности, на которых можно оценить знание языка. Чем выше уровень, тем более сложные слова, фразы и грамматические конструкции используются для выражения мыслей и идей. Начальный уровень языка обычно используется для общения на простые и повседневные темы, а продвинутый - для более сложных тем и для общения на высоком уровне. Уровень языка может быть полезен для оценки знаний языка и выбора подходящих курсов обучения или учебников.
"""
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .yellow
        tableView.register(LevelsTableViewCell.self, forCellReuseIdentifier: LevelsTableViewCell.reuseId)
        tableView.register(HeaderTableView.self, forHeaderFooterViewReuseIdentifier: HeaderTableView.headerReuseId)
        return tableView
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = button.frame.size.width / 2
        button.setImage(buttonImage, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    
    //MARK: Setup views
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(infoButton)
    }
 
    //MARK: Setup constraints
    private func setupConstraints() {
        tableView.frame = view.bounds
        
        infoButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(33)
            make.width.equalTo(30)
            make.right.equalToSuperview().inset(120)
        }
    }
    
    @objc private func buttonAction() {
        let allert = UIAlertController(title: "Описание", message: allertMessage, preferredStyle: .alert)
        let allertAction = UIAlertAction(title: "Закрыть", style: .cancel)
        allert.addAction(allertAction)
        self.present(allert, animated: true)
    }
}

extension LevelsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return levelLanguage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LevelsTableViewCell.reuseId, for: indexPath) as? LevelsTableViewCell else { return UITableViewCell.init()}
        
//        let keys = Array(levelsDictionary.keys)
//        let key = keys[indexPath.row]
//        guard let value = levelsDictionary[key] else { return UITableViewCell.init()}
//        cell.textLabel?.text = key
//        cell.detailTextLabel?.text = "\(value)"
        
//        let language = levelLanguage[indexPath.row]
//        let wordsCount = quantityWords[indexPath.row]
//        cell.textLabel?.text = "\(language)\t\t\t\(wordsCount) words"
        
        let language = levelLanguage[indexPath.row].padding(toLength: 20, withPad: " ", startingAt: 0)
        let wordsCount = quantityWords[indexPath.row].padding(toLength: 20, withPad: " ", startingAt: 0)
        cell.textLabel?.text = "\(language)\t\t\t\t\t\t\(wordsCount)"

    
        return cell
    }
    
    //MARK: Header methods
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width - 20, height: 50))
        header.backgroundColor = .systemCyan
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: header.frame.width - 20, height: header.frame.height))
        label.text = "Что такое уровни"
        label.textAlignment = .center
        header.addSubview(label)
        return header
    }
}

