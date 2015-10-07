//
//  ScrollCycle.swift
//  ScrollViewCycle
//
//  Created by kenn on 2015/10/3.
//  Copyright © 2015年 kenn. All rights reserved.
//

import UIKit

class ScrollCycle: UIView,UIScrollViewDelegate {
    var delegate: ScrollCycleDelegate? // create a new delegate instance
    var scrollView: UIScrollView!
    var someImages: Array<UIImage> = []
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func createScrollView()
    {

        someImages=(delegate?.getImage())!
        someImages.append(someImages[0])
        someImages.insert(someImages[someImages.count-2], atIndex: 0)

        let bounds = UIScreen.mainScreen().bounds
        let width:CGFloat = bounds.size.width
        let height:CGFloat = bounds.size.height
        
        let contentImg = UIImageView(frame: CGRect(x: 0, y: 0, width:width*CGFloat(someImages.count), height: height));
        
        for var index = 0; index < someImages.count; index++ {
            print("index is \(index)")
            let image: UIImage = someImages[index]
            let imgView = UIImageView(image: image)
            imgView.frame = CGRectMake(CGFloat(index)*width,0,width,height)
            contentImg.addSubview(imgView)
            
            let label = UILabel(frame: CGRectMake(((CGFloat(index)*width)+(width/2))-50,50, 100, 30))
            label.textAlignment = NSTextAlignment.Center
            label.text="imgView:\(index)"
            label.backgroundColor=UIColor.clearColor()
            contentImg.addSubview(label)

        }
        
        scrollView = UIScrollView(frame:self.bounds)
        scrollView.contentSize = CGSize(width:width*CGFloat(someImages.count), height: height)
        scrollView.pagingEnabled=true
        scrollView.bounces=false
        scrollView.delegate=self
        scrollView.addSubview(contentImg)
        self.scrollView.setContentOffset(CGPointMake(bounds.size.width,0), animated: false)
        self.addSubview(scrollView)

    }
    func scrollViewDidEndDecelerating(scrollView:UIScrollView)
    {

        if (self.scrollView.contentOffset.x == 0) {
            self.scrollView.setContentOffset(CGPointMake(bounds.size.width*CGFloat(someImages.count-2),0), animated: false)
        }
        else if(self.scrollView.contentOffset.x == bounds.size.width*CGFloat(someImages.count-1)) {
            self.scrollView.setContentOffset(CGPointMake(bounds.size.width,0), animated: false)
        }
    }

    func executeRequest()
    {
        delegate?.getImage()
    }
}

protocol ScrollCycleDelegate {
    func getImage()->Array<UIImage>;
}