//
//  ExternalScreenManagerTest.swift
//  SwiftManExample
//
//  Created by yangjun zhu on 2017/2/13.
//  Copyright © 2017年 yangjun zhu. All rights reserved.
//

import UIKit
import SwiftMan
class ExternalScreenManagerTest: UIViewController {
    var customScreenViewController: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customScreenViewController = self.storyboard?.instantiateViewController(withIdentifier: "customScreenViewControllerIdentifier")
        // Do any additional setup after loading the view.
        ExternalScreenManager.shared.externalViewController = self.customScreenViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func creatCustomScreen(_ sender: UIButton) {
        ExternalScreenManager.shared.beginObserveExternalScreen()
    }
    
    @IBAction func deleteCustomScreen(_ sender: UIButton) {
        ExternalScreenManager.shared.stopObserveExternalScreen()
        ExternalScreenManager.shared.disconnectExternalScreen()

    }
    
    @IBAction func updateCustomScreen(_ sender: UIButton) {
        if let vc = self.customScreenViewController{
         vc.view.backgroundColor = UIColor.m_randomColor()
        }
        
    }
    
}
