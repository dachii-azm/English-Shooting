//
//  SkillViewControllers.swift
//  English Shooting
//
//  Created by 東大地 on 2019/03/04.
//  Copyright © 2019 dachii. All rights reserved.
//
import Foundation
import UIKit


class SkillViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //This array is shown to Cells
    private var deviceCellsList = [ContextOfDevice]()
    private var deviceCellsAppend = getCellDatas.getDeviceCells()
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
extension SkillViewController {
    
    //Configure UITableView
    private func configureTableView() {
        self.tableView.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.size.height)!, width: self.view.bounds.width, height: self.view.bounds.height - (self.navigationController?.navigationBar.frame.size.height)!)
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

// MARK: - Animation
extension SkillViewController {
    
    private func addCellsAnimation() {
        //  for index in 0..<deviceCellAppend.count {
        for index in 0..<self.deviceCellsAppend.count {
            self.deviceCellsList.insert(self.deviceCellsAppend[index], at: index)
        }
        UIView.animate(withDuration: 10) {
            self.tableView.beginUpdates()
            var paths = [IndexPath]()
            for index in 0..<self.deviceCellsAppend.count {
                paths.append(IndexPath(row: index, section: 0))
            }
            self.tableView.insertRows(at: paths, with: .automatic)
            self.tableView.endUpdates()
        }
    }
    
    private func removeCellsAnimation() {
        self.deviceCellsList.removeAll()
        var paths = [IndexPath]()
        for index in 0..<self.deviceCellsAppend.count {
            paths.append(IndexPath(row: index, section: 0))
        }
        
        UIView.animate(withDuration: 2, animations: {
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: paths, with: .automatic)
            self.tableView.endUpdates()},
                       completion: { (finished: Bool) in
                        if finished == true {
                            self.present(GameViewController(), animated: false, completion: nil)}})
    }
}

//Mark TableView and Cells
extension SkillViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceCellsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCellView
        cell.deviceCells = deviceCellsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        removeCellsAnimation()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
