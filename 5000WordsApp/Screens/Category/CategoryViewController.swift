//
//  CategoryViewController.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 14.02.2023.
//

import UIKit

class CategoryViewController: UIViewController {
    
//    private let itemsInfoArray = [["20 случайных", "50 случайных", "все вопросы"], ["Массивы", "Словарь"], ["Функции"]]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .lightGray
        
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseId)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(tableView)
    }

    //MARK: configure constraints
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1// itemsInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemsInfoArray.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.reuseId, for: indexPath) as? CategoryCell else { return UITableViewCell.init() }
        
        
//        let items = itemsInfoArray[indexPath.row]
        
//        cell.update(categories: items)
        //        cell.textLabel?.text = itemsInfoArray[indexPath.row]
        return cell
    }
}
