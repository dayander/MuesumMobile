//
//  SingleExhibitViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 10/7/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit

class SingleExhibitViewController: UIViewController {
    
    var exhibit: Exhibit?
    var scrollView = UIScrollView()
    var headerView = ExhibitHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        self.view.addSubview(headerView)
        self.headerView.mainImg.image = exhibit?.mainImg.img
        self.headerView.exhibitHeading.text = exhibit?.name
        self.headerView.exhibitSubHeading.text = exhibit?.subHead
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


class ExhibitHeaderView: UIView {
    var mainImg = UIImageView()
    var exhibitHeading = UILabel()
    var exhibitSubHeading = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        print("viewSetup: headerview")
            }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpView() {
        self.addSubview(mainImg)
        //self.sendSubviewToBack(mainImg)
        //self.addSubview(exhibitHeading)
        //self.addSubview(exhibitSubHeading)
        
//        self.snp.makeConstraints { (make) in
//            make.self.left.equalTo(0)
//            make.self.top.equalTo(0)
//            make.self.right.equalTo(0)
//            make.self.height.equalTo(350)
//            }
        
//        self.mainImg.snp.makeConstraints { (make) in
//            make.self.left.equalTo(0)
//            make.self.top.equalTo(0)
//            make.self.right.equalTo(0)
////            make.height.equalTo(50)
////            make.width.equalTo(50)
//        }
        
        self.exhibitHeading.snp.makeConstraints { (make) in
                   make.self.left.equalTo(16)
                   make.self.top.equalTo(40)
                   
                   
               }
        self.exhibitSubHeading.snp.makeConstraints { (make) in
                   make.self.left.equalTo(20)
                   make.self.top.equalTo(70)
                   
                   
               }
        
    }
    
    
}
