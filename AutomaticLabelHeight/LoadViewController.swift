//
//  LoadViewController.swift
//  AutomaticLabelHeight
//
//  Created by Umamaheshwari on 09/01/20.
//  Copyright © 2020 Umamaheshwari. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {

    @IBOutlet weak var tableviewLoad: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableviewLoad.register(UINib(nibName: "CellLoad", bundle: nil), forCellReuseIdentifier: "CellLoadID")
        tableviewLoad.reloadData()
    }

}

extension LoadViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellLoadID", for: indexPath as IndexPath) as! CellLoad
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.tag = indexPath.row
        cell.viewOuterBox.layer.cornerRadius = 8
        AppManager.sharedInstance.ViewShadow(MainView: cell.viewOuterBox)
        return cell
    }
}
