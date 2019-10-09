//
//  ClosestExhibitViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/25/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//
import UIKit
class ClosestExhibitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ClosestExhibitTableView: UITableView!
    @IBOutlet weak var roomName: UILabel!
    var tag: String!
    var closeExhibits = [Exhibit]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var rooms = [Room]()
    var roomMap = [String:[Exhibit]]()
    var baseURL = "http://msu-museum-server.herokuapp.com"
    var text: String!
    var networkManager = NetworkManager()
    
    @IBOutlet weak var floorName: UILabel!
    @IBAction func reloadExhibits(_ sender: Any) {
        if roomName.text != appDelegate.roomName{
            floorName.text = appDelegate.floorName
            roomName.text = appDelegate.roomName
            print(appDelegate.roomName)
            closeExhibits = roomMap[appDelegate.roomName]!
            DispatchQueue.main.async { self.ClosestExhibitTableView.reloadData() }
        }
        floorName.text = appDelegate.floorName
        roomName.text = appDelegate.roomName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.popViewController(animated: true)
    }
    
    init(networkManager: NetworkManager) {
        super.init(nibName: nil, bundle: nil)
        self.networkManager = networkManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        floorName.text = appDelegate.floorName
        roomName.text = appDelegate.roomName
        if self.rooms.count > 0 {
            if roomMap[appDelegate.roomName] != nil {
                closeExhibits = roomMap[appDelegate.roomName]!
            }
        }

        ClosestExhibitTableView.delegate = self
        ClosestExhibitTableView.dataSource = self
    }
    

    @IBAction func unwindToPrevVC( segue: UIStoryboardSegue) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      ClosestExhibitTableView.estimatedRowHeight = 200
        return closeExhibits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClosestExhibitLink") as! ExhibitLinkTableViewCell
            
        cell.exhibitimageView.image = closeExhibits[indexPath.row].mainImg.img
        cell.titleLabel.text = closeExhibits[indexPath.row].name    
        cell.descriptionLabel.text = closeExhibits[indexPath.row].subHead
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }    
}

class ExhibitLinkTableViewCell: UITableViewCell {
    @IBOutlet weak var exhibitimageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
}
