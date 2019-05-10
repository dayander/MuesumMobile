//
//  ClosestExhibitViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 2/25/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//
import UIKit
class ClosestExhibitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var ClosestExhibitTableView: UITableView!
    @IBOutlet weak var roomName: UILabel!
    var tag: String!
    var closeExhibits = [Exhibit]()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    var rooms = [Room]()
    
    var baseURL = "http://msu-museum-server.herokuapp.com"
    
    
    //var rooms: [Exhibit]!
    
    var text: String!
    
    @IBOutlet weak var floorName: UILabel!
    @IBAction func reloadExhibits(_ sender: Any) {
        
        floorName.text = appDelegate.floorName
        
        roomName.text = appDelegate.roomName
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floorName.text = appDelegate.floorName
        
        roomName.text = appDelegate.roomName
        
        
        print("rooms", self.rooms)
        
        
        
//        let name: String
//        let subHead: String
//        let descripton: String
//        let mainImg: Image
//        var appSections: [AppSection]
        
        // if the room.device.name == roomname.text append room.exhibits to closest exhibits
        
      
        
        
        for room in self.rooms{
            
            print(room)
            
            print(room.name)
            
//            if room.device.roomName == roomName.text {
                for exhibit in room.exhibits{
                    print(exhibit)
                    
                    closeExhibits.append(exhibit)
                }
            //}

//            if room.name == roomName.text {
//                print("Fuck Yeah")
//            }

        }

        
        
//        closeExhibits = [
//            Exhibit(name: "Test", subHead: "TEST",  mainImg: Image(altText: "hey", path: "bs"), appSections: [AppSection(id: "aaa", sectionHeading: "aaaa", sectionImagePath: "aa", sectionImageAltText: "aaaaa", sectionDescription: "lllll", order: 0)] ),
//               Exhibit(name: "Test", subHead: "TEST",  mainImg: Image(altText: "hey", path: "bs"), appSections: [AppSection(id: "aaa", sectionHeading: "aaaa", sectionImagePath: "aa", sectionImageAltText: "aaaaa", sectionDescription: "lllll", order: 0)] ),
//               Exhibit(name: "Test", subHead: "TEST",  mainImg: Image(altText: "hey", path: "bs"), appSections: [AppSection(id: "aaa", sectionHeading: "aaaa", sectionImagePath: "aa", sectionImageAltText: "aaaaa", sectionDescription: "lllll", order: 0)] ),
//               Exhibit(name: "Test", subHead: "TEST",  mainImg: Image(altText: "hey", path: "bs"), appSections: [AppSection(id: "aaa", sectionHeading: "aaaa", sectionImagePath: "aa", sectionImageAltText: "aaaaa", sectionDescription: "lllll", order: 0)] ),
//               Exhibit(name: "Test", subHead: "TEST",  mainImg: Image(altText: "hey", path: "bs"), appSections: [AppSection(id: "aaa", sectionHeading: "aaaa", sectionImagePath: "aa", sectionImageAltText: "aaaaa", sectionDescription: "lllll", order: 0)] ),
//        ]
        
        ClosestExhibitTableView.delegate = self
        ClosestExhibitTableView.dataSource = self
        
        
        
        //self sizing table cells
        
        

        
        
        
    }
    

    @IBAction func unwindToPrevVC( segue: UIStoryboardSegue) {
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of rows")
        
        
        //ClosestExhibitTableView.rowHeight = UITableView.automaticDimension
      ClosestExhibitTableView.estimatedRowHeight = 200
        
        return closeExhibits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClosestExhibitLink") as! ExhibitLinkTableViewCell
        
        
        
        if closeExhibits.count > 0 {
            let url = URL(string:(baseURL + closeExhibits[indexPath.row].mainImg.path))
            
            
            print("url", url)
            
            
            if let data = try? Data(contentsOf: url!){
                print("data", data)
                if let image = UIImage(data: data){
                    cell.exhibitimageView.image = image
                    print("image", image)
                }
            }
        }
        //cell.exhibitimageView.image = closeExhibits[indexPath.row].thumbnail
        cell.titleLabel.text = closeExhibits[indexPath.row].name    
        cell.descriptionLabel.text = closeExhibits[indexPath.row].subHead    
        
        cell.backgroundColor = UIColor.white
        
        //cell.contentView.backgroundColor = transparentColor
        
        print("cell run")
        
        
        return cell
        
    }
    
//            func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//                let view = UIView(frame:CGRect (x: 0, y: 0, width: 320, height: 20) ) as UIView
//                view.backgroundColor = UIColor.red
//                return view
//            }
    
    
    
    
   
}





class ExhibitTableView: UITableView{
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return closeExhibits.count
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 20
//    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame:CGRect (x: 0, y: 0, width: 320, height: 20) ) as UIView
//        view.backgroundColor = UIColor.red
//        return view
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ClosestExhibitLink") as! ExhibitLinkTableViewCell
//        cell.exhibitimageView.image = closeExhibits[indexPath.row].thumbnail
//        cell.titleLabel.text = closeExhibits[indexPath.row].title
//        cell.descriptionLabel.text = closeExhibits[indexPath.row].descripton
//
//        cell.backgroundColor = UIColor.white
//
//        //cell.contentView.backgroundColor = transparentColor
//
//
//        return cell
//
//    }
//
    
}


class ExhibitLinkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var exhibitimageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    
}




