//
//  AmmoViewControllers.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/04.
//  Copyright © 2019 dachii. All rights reserved.
//

import Foundation
import UIKit

class AmmoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //This array is shown to Cells
    private var ammoCellsList = [ContextOfAmmo]()
    private var ammoCellsAppend = getCellDatas.getAmmoCells()
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addCellsAnimation()
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - Configuration
extension AmmoViewController {
    //Configure UITableView
    private func configureTableView() {
        self.tableView.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.bounds.width, height: self.view.bounds.height - (self.navigationController?.navigationBar.frame.size.height)!)
        tableView.delegate      =  self
        tableView.dataSource    =  self
        tableView.register(CustomCellView.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
    
    //configure all system
    private func configure() {
        configureTableView()
    }
}


// MARK: - Animation
extension AmmoViewController {
    
    private func addCellsAnimation() {
        //  for index in 0..<deviceCellAppend.count {
        for index in 0..<self.ammoCellsAppend.count {
            self.ammoCellsList.insert(self.ammoCellsAppend[index], at: index)
        }
        UIView.animate(withDuration: 1) {
            self.tableView.beginUpdates()
            var paths = [IndexPath]()
            for index in 0..<self.ammoCellsAppend.count {
                paths.append(IndexPath(row: index, section: 0))
            }
            self.tableView.insertRows(at: paths, with: .automatic)
            self.tableView.endUpdates()
        }
    }
    
    private func removeCellsAnimation() {
        self.ammoCellsList.removeAll()
        var paths = [IndexPath]()
        for index in 0..<self.ammoCellsAppend.count {
            paths.append(IndexPath(row: index, section: 0))
        }
        
        UIView.animate(withDuration: 2, animations: {
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: paths, with: .automatic)
            self.tableView.endUpdates()},
                       completion: { (finished: Bool) in
                        if finished == true {
                            self.present(GameViewController(), animated: false, completion: nil)}})
        //self.shopCellList.removeAll()
    }
}

//MARK TableView And CellView
extension AmmoViewController {
    
    //About TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ammoCellsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellView
        cell.ammoCells = ammoCellsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        removeCellsAnimation()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
