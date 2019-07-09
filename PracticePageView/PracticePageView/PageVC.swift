//
//  ViewController.swift
//  PracticePageView
//
//  Created by kimjiseob on 08/07/2019.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var index = 0
    var colors: [UIColor] = [.red, .blue, .black, .brown, .yellow]
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard self.index != 0 else { return nil }
        
        guard let aaa = storyboard?.instantiateViewController(withIdentifier: "baseVC") as? CccViewController else { return nil }
        index -= 1
        let color = colors[index]
        print(index)
        aaa.color = color
        return aaa
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard self.index < colors.count - 1 else { return nil }
        guard let aaa = storyboard?.instantiateViewController(withIdentifier: "baseVC") as? CccViewController else { return nil }
        index += 1
        let color = colors[index]
        print(index)
        aaa.color = color
        return aaa
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "baseVC") else { return }
        guard let cvc = vc as? CccViewController else {
            print("why?")
            return
        }
        
        self.setViewControllers([cvc], direction: .forward, animated: false, completion: nil)
        
    }
}


