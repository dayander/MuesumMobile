//
//  ExhibitsViewController.swift
//  MSUMuesumApp
//
//  Created by Anderson Day on 3/12/19.
//  Copyright © 2019 Anderson Day. All rights reserved.
//

import UIKit


struct scrollViewDataStruct{
    let title: String?
    let image: UIImage?
}

class ExhibitsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var basicScrollView: UIScrollView!
    
    var scrollViewData = [scrollViewDataStruct]()
    var viewTagValue = 10
    var tagValue = 100
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        basicScrollView.delegate = self
        
        
        scrollViewData = [scrollViewDataStruct(title: "one", image: #imageLiteral(resourceName: "Screen Shot 2019-03-11 at 7.27.23 PM")), scrollViewDataStruct(title: "two", image:#imageLiteral(resourceName: "Screen Shot 2019-03-08 at 8.59.23 AM")),scrollViewDataStruct(title: "three", image:#imageLiteral(resourceName: "Screen Shot 2019-03-08 at 8.59.23 AM"))]
        
        //total width of all of the scroll views
        basicScrollView.contentSize.width = self.basicScrollView.frame.width * CGFloat(scrollViewData.count)
        
        
        var i = 0
        for data in scrollViewData{
            
            //the x is whats allowing it to scroll.
            let view = customView(frame: CGRect(x: 10+(self.basicScrollView.frame.width * CGFloat(i)), y: 80, width: self.basicScrollView.frame.width-20, height: self.basicScrollView.frame.height-90))
            view.imageView.image = data.image
            view.tag = i + viewTagValue
            
            self.basicScrollView.addSubview(view)
            
            
            let label = UILabel(frame: CGRect.init(origin: CGPoint.init( x:0, y:CGFloat(20)), size:CGSize.init(width:0, height:40)))
            
            label.text = data.title
            label.sizeToFit()
            
            label.tag = i + tagValue
            
            if i == 0{
                label.center.x = view.center.x
            }else{
                label.center.x = view.center.x - self.basicScrollView.frame.width / 2
            }
            
            
            self.basicScrollView.addSubview(label)
            
            i += 1
        }

        // Do any additional setup after loading the view.
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == basicScrollView{
            for i in 0..<scrollViewData.count{
                let label = basicScrollView.viewWithTag(i + tagValue) as! UILabel
                
                let view = basicScrollView.viewWithTag(i + viewTagValue) as! customView
                
                let scrollContentOffset = basicScrollView.contentOffset.x + self.basicScrollView.frame.width
                
                let viewOffset = (view.center.x - basicScrollView.bounds.width / 4) - scrollContentOffset
                label.center.x = scrollContentOffset - ((basicScrollView.bounds.width / 4 - viewOffset) / 2)
            }
            
        }
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



class customView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
