//
//  ViewController.swift
//  ScrollViewCycle
//
//  Created by kenn on 2015/10/3.
//  Copyright © 2015年 kenn. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ScrollCycleDelegate {
    
 var customView: ScrollCycle!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bounds = UIScreen.mainScreen().bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        
        customView = ScrollCycle(frame: CGRect(x: 0, y: 0, width: width, height: height))
        customView.delegate=self
        customView.executeRequest()
        customView.createScrollView()
        self.view .addSubview(customView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImage()->Array<UIImage>{
        
        var someImages = [UIImage]()
        someImages.append(UIImage(named: "blue.jpg")!)
        someImages.append(UIImage(named: "green.jpg")!)
        someImages.append(UIImage(named: "red.jpg")!)

        return someImages
    }
}

