//
//  CustomCellView.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/02.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

class CustomCellView: UITableViewCell {
    
    var cellImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 35
        return img
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        title.textColor =  _ColorLiteralType(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
        }()
    
    let abilityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 10)
        label.textColor = UIColor.white
        label.backgroundColor =  _ColorLiteralType(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    var userCells: UserCells? {
        didSet {
            guard let contactItem = userCells else {return}
            if let title = contactItem.title {
                cellImageView.image = UIImage(named: title)
                titleLabel.text = title
            }
            if let money = contactItem.money {
                abilityLabel.text = " MONEY: \(money) "
            }
        }
    }
    
    
    
    var shopCells:ShopCells? {
        didSet {
            guard let contactItem = shopCells else {return}
            if let title = contactItem.title {
                cellImageView.image = UIImage(named: title)
                titleLabel.text = title
            }
            if let ability = contactItem.ability {
                abilityLabel.text = " \(ability) "
            }
        }
    }
    
    var chooseGameLevelcells:ChooseGameLevelCells? {
        didSet {
            guard let contactItem = chooseGameLevelcells else {return}
            if let title = contactItem.title {
                cellImageView.image = UIImage(named: title)
                titleLabel.text = title
            }
            if let complete = contactItem.complete {
                abilityLabel.text = " COMPLETE: \(complete) "
            }
        }
    }
    
    var deviceCells: ContextOfDevice? {
        didSet {
            guard let contactItem = deviceCells else {return}
            if let title = contactItem.title {
                cellImageView.image = UIImage(named: title)
                titleLabel.text = title
            }
            if let level = contactItem.level {
                abilityLabel.text = " LEVEL: \(level) "
            }
        }
    }
        
    var ammoCells: ContextOfAmmo? {
        didSet {
            guard let contactItem = ammoCells else {return}
            if let title = contactItem.title {
                cellImageView.image = UIImage(named: title)
                titleLabel.text = title
            }
            if let level = contactItem.level {
                abilityLabel.text = " LEVEL: \(level) "
            }
        }
    }
        
    
    func cellImageViewConstraint() {
        cellImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        cellImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        cellImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
    }
    
    func containerViewConstraint() {
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.cellImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
    }
    
    func titleLabelConstraint() {
        titleLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
    func abilityLabelConstraint() {
        abilityLabel.topAnchor.constraint(equalTo:self.titleLabel.bottomAnchor).isActive = true
        abilityLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
    }
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.containerView.addSubview(titleLabel)
        self.containerView.addSubview(abilityLabel)
        self.contentView.addSubview(cellImageView)
        self.contentView.addSubview(containerView)
        cellImageViewConstraint()
        containerViewConstraint()
        titleLabelConstraint()
        abilityLabelConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
   /* init(image: UIImage, title: String, ability: String) {
        
        self.cellImageView.image = image
        self.titleLabel.text = title
        self.abilityLable.text = ability
        
        self.containerView.addSubview(titleLabel)
        self.containerView.addSubview(abilityLable)
    }*/
    
    
}
