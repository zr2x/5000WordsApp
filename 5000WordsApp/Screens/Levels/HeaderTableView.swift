//
//  HeaderTableView.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 03.05.2023.
//

import UIKit

class HeaderTableView: UITableViewHeaderFooterView {

    static let headerReuseId = "HeaderTableView"
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Что такое уровни"
        label.textAlignment = .center
        return label
    }()

}
