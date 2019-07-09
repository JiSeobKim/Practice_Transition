//
//  ContentViewController.swift
//  PracticePageView
//
//  Created by kimjiseob on 08/07/2019.
//  Copyright © 2019 kimjiseob. All rights reserved.
//

import UIKit

class CccViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.img.backgroundColor = color
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
