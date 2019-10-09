//
//  ExhibitTableViewCell.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/7/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit
import SnapKit

class ExhibitTableViewCell: UITableViewCell {
    static let reUse = "exhibitCell"
    let mainView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 7
        
        return view
    }()
    
    let timeLabel = UILabel()
    let transferLabel = UILabel()
    let priceLabel = UILabel()
    let transportImageView = UIImageView()
    
    func setUpViews() {
        self.addSubview(mainView)
        mainView.addSubview(timeLabel)
        mainView.addSubview(transferLabel)
        mainView.addSubview(priceLabel)
        mainView.addSubview(transportImageView)
        
        setUpLabel(label: timeLabel, color: UIColor.darkGray, size: 28)
        setUpLabel(label: transferLabel, color: UIColor.lightGray, size: 18)
        setUpLabel(label: priceLabel, color: Colors.moneyGreen, size: 26)
        
        mainView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.topMargin.equalTo(5)
            make.bottomMargin.equalTo(-5)
            make.right.equalTo(-10)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(25)
            make.left.equalTo(85)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        transferLabel.snp.makeConstraints { (make) in
            make.left.equalTo(85)
            make.top.equalTo(self.timeLabel).offset(35)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-20)
            make.centerY.equalTo(self.mainView)
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
        
        transportImageView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(self.mainView)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
    }
    
    func setUpLabel(label: UILabel, color: UIColor, size: CGFloat) {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.textColor = color
        label.textAlignment = .left
        label.font = UIFont(name: "AppleSDGothicNeo-Medium", size: size)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setUpViews()
     }
     
     required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
     }

}
