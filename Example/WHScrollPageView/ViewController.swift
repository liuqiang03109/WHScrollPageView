//
//  ViewController.swift
//  WHScrollPageView
//
//  Created by wenhe-liu on 02/23/2017.
//  Copyright (c) 2017 wenhe-liu. All rights reserved.
//

import UIKit
import WHScrollPageView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//

        let page = WHScrollPageView(frame: CGRect(x: 20, y: 50, width: 335, height: 120), { (imageView, url) in
            //内部传出imageView跟url，通过url设置imageView的图片
            //imageView.kf.setImage(with: url)
        }) { (index) in
            print("听单处理\(index)")
        }
        
        
        let array = ["https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-1.jpg", "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-2.jpg", "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-3.jpg"]
        
        //一定要设置图片数组
        page.imagesURLString = array
        
        
        view.addSubview(page)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

