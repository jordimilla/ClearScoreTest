//
//  HomeViewController+Layout.swift
//  ClearScoreTest
//
//  Created by Jordi Milla on 19/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setUpUI() {
        title = "ClearScore"
        view.backgroundColor = .color(.white)
        setUpSubviews()
        setUpConstraints()
        setUpLabelsProperties()
        setUpContainerViewProperties()
        
    }
    
    func setUpSubviews () {
        view.addSubviewWithAutolayout(container)
        container.addSubview(circularView)
        container.addSubviewWithAutolayout(lblTitle)
        container.addSubviewWithAutolayout(lblScore)
        container.addSubviewWithAutolayout(lblSubtitle)
    }
    
    func setUpConstraints() {
        container.anchorCenterXToSuperview()
        container.anchorCenterYToSuperview()
        circularView.anchorCenterXToSuperview()
        circularView.anchorCenterYToSuperview()
        container.anchor(widthConstant: 300)
        container.anchor(heightConstant: 300)
        lblTitle.anchor(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor, topConstant: 80)
        lblScore.anchor(top: lblTitle.bottomAnchor, left: container.leftAnchor, right: container.rightAnchor, topConstant: 20)
        lblSubtitle.anchor(top: lblScore.bottomAnchor, left: container.leftAnchor, right: container.rightAnchor, topConstant: 20)
    }
    
    func setUpLabelsProperties() {
        lblTitle.text = "Your credit score is"
        lblTitle.textAlignment = .center
        lblScore.textAlignment = .center
        lblSubtitle.textAlignment = .center
        lblTitle.textColor = .black
        lblScore.textColor = .red
        lblSubtitle.textColor = .black
        lblScore.font = UIFont.boldSystemFont(ofSize: 50)
    }
    
    func setUpContainerViewProperties() {
        container.layer.cornerRadius = 300/2
        container.clipsToBounds = true
        container.layer.borderColor = UIColor.black.cgColor
        container.layer.borderWidth = 3
    }
    
    func configureScore(score: Score) {
        lblScore.text = "\(score.score)"
        lblSubtitle.text = "out of \(score.maxScoreValue)"
        circularView.progressAnimation(duration: 1, maxScoreValue: score.maxScoreValue, score: score.score)
        
    }
}
