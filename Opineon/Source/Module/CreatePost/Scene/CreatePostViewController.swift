//
//  CreatePostViewController.swift
//  Opineon
//
//  Created by Aniket Kumar on 09/01/23.
//

import UIKit

class CreatePostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView?

    override func viewDidLoad() {
        table?.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.identifier)
        super.viewDidLoad()
        table?.delegate = self
        table?.dataSource = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        customCell.configure(with: "Custom cell", imageName: "gear")
        return customCell
    }
    // MARK: - IB Actions

    @IBAction func backToFirstScreenOfCreatePost(_ sender: Any) {
        self.performSegue(withIdentifier: "firstScreenOfCreatePost", sender: self)
    }
}
