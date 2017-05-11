//
//  FrontViewController.swift
//  SampleRotatedView
//
//  Created by Efthimis Liapatis on 05/05/2017.
//  Copyright © 2017 eliapatis. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = SampleColor.green.light
        tableView.register(UINib(nibName: String(describing: SampleTableViewCell.self), bundle: nil), forCellReuseIdentifier: SampleTableViewCell.identifier)
    }
}

extension FrontViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SampleTableViewCell.identifier, for: indexPath) as! SampleTableViewCell
        
        cell.configureCell(forIndex: indexPath.row, colorSet: .first)
        
        return cell
    }
}
