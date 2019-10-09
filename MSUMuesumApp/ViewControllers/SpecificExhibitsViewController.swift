//
//  SpecificExhibitsViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/3/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit

class SpecificExhibitsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var exhibits: [Exhibit] =  [Exhibit]()
    var room: String?
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.allowsSelection = true
        table.register(ExhibitTableViewCell.self, forCellReuseIdentifier: ExhibitTableViewCell.reUse)
        table.rowHeight = 225
        table.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibits.count
        }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExhibitTableViewCell.reUse, for: indexPath ) as! ExhibitTableViewCell
        cell.transportImageView.image = self.exhibits[indexPath.row].mainImg.img
        cell.accessibilityLabel = self.exhibits[indexPath.row].mainImg.altText
        cell.timeLabel.text = self.exhibits[indexPath.row].name
        cell.transferLabel.text = self.exhibits[indexPath.row].subHead
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextController = SingleExhibitViewController()
        nextController.exhibit = exhibits[indexPath.row]
        present(nextController, animated: true, completion: nil)
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 400
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    

}

//@IBOutlet weak var exhibitImage: UIImage

 


class ExhibitButtonView: UITableViewCell {
    var exhibit: Exhibit?
    @IBOutlet weak var exhibitImage: UIImageView!
    @IBOutlet weak var exhibitTitle: UILabel!
    @IBOutlet weak var exhibitDescription: UILabel!
    
}
