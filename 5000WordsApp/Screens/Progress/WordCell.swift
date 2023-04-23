//
//  CustomTableViewCell.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 03.04.2023.
//

import UIKit

final class WordCell: UITableViewCell {
    
    static let reuseId = "CustomTableViewCell"
    
    private var wordLabel: UILabel = {
        let label = UILabel()
        label.text = "word"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private
    private func setupViews() {
        contentView.addSubview(wordLabel)
    }
    
    private func setupConstraints() {
        wordLabel.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(contentView).inset(20)
        }
    }
    
    //MARK: - Public
    ///Передача слова в ячейку
    func update(_ word: WordModel) {
        wordLabel.text = word.word
    }
}
