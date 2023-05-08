//
//  SegmentComponent.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 11.04.2023.
//

import UIKit

class SegmentComponentView: UIView {
    
    var onAction: ((Int)->Void)?
    let knownWordArchiver = WordsArchiver(type: .known)
    let unkownWordArchiver = WordsArchiver(type: .unknown)
    let allWordsArchiver = WordsArchiver(type: .all)
    
    lazy var all = allWordsArchiver.retrieve().count
    lazy var known = knownWordArchiver.retrieve().count
    lazy var unknown = unkownWordArchiver.retrieve().count
    
    lazy var menuArray = ["Все слова \n \(all)", "Не знаю \n \(unknown)", "Знаю \n \(known)"]
    
    lazy var segment: UISegmentedControl = {
        let segmentControl = UISegmentedControl.init(items: menuArray)
        
        for segment in segmentControl.subviews{
            for label in segment.subviews{
                
                if let label = label as? UILabel{
                    label.numberOfLines = 2
                }
            }
        }
    
        segmentControl.addTarget(self, action: #selector(segmentChanged(sender:)), for: .valueChanged)
        segmentControl.layer.cornerRadius = 30
        segmentControl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        return segmentControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
        //updateCounters()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCounters() {
        var allWords = allWordsArchiver.retrieve()
        var knownWords = knownWordArchiver.retrieve()
        var unkownWords = unkownWordArchiver.retrieve()
        //var difference = allWords.count - knownWords.count - unkownWords.count
        segment.setTitle("Осталось слов \n \(allWords.count)", forSegmentAt: 0)
        segment.setTitle("Знаю \n \(knownWords.count)", forSegmentAt: 1)
        segment.setTitle("Не знаю \n \(unkownWords.count)", forSegmentAt: 2)
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        segment.backgroundColor = .cyan
        addSubview(segment)
    }
    
    private func setupConstraints() {
        segment.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self).inset(25)
        }
    }
    
    @objc private func segmentChanged(sender: UISegmentedControl) {

        onAction?(sender.selectedSegmentIndex)
    }
}
