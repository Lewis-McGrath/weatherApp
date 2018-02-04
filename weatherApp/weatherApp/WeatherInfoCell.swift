//
//  WeatherInfoCell.swift
//  weatherApp
//
//  Created by Lewis McGrath on 11/01/2018.
//  Copyright © 2018 Lewis McGrath. All rights reserved.
//

import UIKit
import SnapKit

class WeatherInfoCell: UICollectionViewCell {
    
    let titleLabel: UILabel = UILabel()
    
    static let identifier = "weatherInfoCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
