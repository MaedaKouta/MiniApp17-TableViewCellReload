//
//  ViewController.swift
//  MiniApp17-TableViewCellReload
//
//  Created by 前田航汰 on 2022/02/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var randomArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTableView), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc func refreshTableView() {
        randomArray = randomArray.map { $0 * 5 }
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(randomArray[indexPath.row])"

        return cell
    }


}

