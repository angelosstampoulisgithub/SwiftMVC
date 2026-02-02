//
//  ViewController.swift
//  SwiftMVC
//
//  Created by Angelos Staboulis on 2/2/26.
//

import UIKit

class ViewController: UIViewController {
    
    private let rootView = ItemListView()
    private var items: [Item] = []
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift MVC Example"
        
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        rootView.tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.reuseID)
        
        loadData()
    }
    
    private func loadData() {
        items = [
            Item(id: 1, title: "First", subtitle: "Hello"),
            Item(id: 2, title: "Second", subtitle: "World")
        ]
        rootView.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseID, for: indexPath) as! ItemCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let detailVC = ItemDetailViewController(item: item)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}



