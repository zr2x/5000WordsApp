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
//        let label = UILabel(frame: CGRect(x: 10, y: 0, width: header.frame.width - 20, height: header.frame.height))
        let label = UILabel()
        label.text = "Что такое уровни"
        label.textAlignment = .center
        return label
    }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
