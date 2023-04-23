//
//  SegmentComponent.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 11.04.2023.
//

import UIKit

class SegmentComponentView: UIView {
    
    var onAction: ((Int)->Void)?
    
    let menuArray = ["Все слова", "Не знаю", "Знаю"]
    
    lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl.init(items: menuArray)
        segment.addTarget(self, action: #selector(segmentChanged(sender:)), for: .valueChanged)
        segment.layer.cornerRadius = 30
        return segment
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        self.backgroundColor = .lightGray
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
