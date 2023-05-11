//
//  ProgressView.swift
//  5000WordsApp
//
//  Created by Искандер Ситдиков on 11.05.2023.
//

import UIKit
import SnapKit

class ProgressComponentView: UIView {
    
    lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .blue
        progressView.trackTintColor = .yellow
        progressView.progress = 0.5
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        progressView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
    }
    
    private func setupView() {
        self.addSubview(progressView)
    }
    
}
