//
//  CategoryCell.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 14.02.2023.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    static let reusedId = "CategoryCell"
    
  
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .orange
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        return stackView
    }()
    //stackView
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
       
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(4)
        }
    }
    
    
    
    func update(categories: [String]) {
        //создаешь на основе элементов массива кнопки и кладешь в стэквью
        //        var categoryButtons = [UIButton]()
        
        let _ = categories.map { buttonInfo -> UIButton in
            let button = UIButton()
            button.setTitle(buttonInfo, for: .normal)
            button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.backgroundColor = .red
            button.sizeToFit()
            button.setTitleColor(.black, for: .normal)
            
            stackView.addArrangedSubview(button)
            
            return button
        }

        
    }
    
    @objc private func actionButton() {
        
    }
    
}
