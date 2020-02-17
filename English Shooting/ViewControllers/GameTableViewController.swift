//
//  GameTableViewController.swift
//  English Shooting
//
//  Created by 東大地 on 2019/02/28.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

class GameTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let GameLevelCellList = getCellDatas.getChooseGameLevelCells()
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.appearNavBarTabBar()
    }
        
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func appearNavBarTabBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
    
    
// MARK: - Configuration
extension GameTableViewController {
    
    //Configure UITableView
    private func configureTableView() {
        self.tableView.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.bounds.width,height: self.view.bounds.height - (self.navigationController?.navigationBar.frame.size.height)!)
        tableView.delegate      =  self
        tableView.dataSource    =  self
        tableView.register(CustomCellView.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        print(tableView.frame)
    }

        
    //configure all system
    private func configure() {
        configureTableView()
    }
}

//MARK TableView and CellView
extension GameTableViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameLevelCellList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellView
        cell.chooseGameLevelcells = GameLevelCellList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToNextVC(VC: GameViewController())
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK otherwise
extension GameTableViewController {
    
    
    //use NavigationController and move to next VC
    private func moveToNextVC(VC: UIViewController) {
        //moving animation//
        
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
}
