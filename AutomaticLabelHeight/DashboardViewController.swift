//
//  DashboardViewController.swift
//  AutomaticLabelHeight
//
//  Created by Umamaheshwari on 09/01/20.
//  Copyright © 2020 Umamaheshwari. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var buttonFilter: UIButton!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet var labelOfBottomView: [UILabel]!
    @IBOutlet var imageviewBottomIcon: [UIImageView]!
    @IBOutlet var buttonViewBottom: [UIButton]!
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var stackviewExports: UIStackView!
    @IBOutlet weak var labelTitle: UILabel!
    var loadVC : LoadViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppManager.sharedInstance.ViewShadow(MainView: viewBottom)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(redirectToComingSoonVC(_:)))
        stackviewExports.isUserInteractionEnabled = true
        stackviewExports.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func handlerToTapBottomView(_ sender: Any) {
        if let button = sender as? UIButton {
            for imageIconIndex in 0..<imageviewBottomIcon.count {
                imageviewBottomIcon[imageIconIndex].image = imageviewBottomIcon[imageIconIndex].image?.withRenderingMode(.alwaysTemplate)
                imageviewBottomIcon[imageIconIndex].tintColor = (button.tag == imageIconIndex+1) ? Color.selectedFieldBorderColor : Color.unselectedFieldBorderColor
                labelOfBottomView[imageIconIndex].textColor = (button.tag == imageIconIndex+1) ? Color.selectedFieldBorderColor : Color.unselectedFieldBorderColor
            }
            
            switch button.tag {
            case 3:
                goToLoad()
            default:
                goToDashboard(button.tag)
            }
        }
    }
    
    @IBAction func handlerToFilter(_ sender: Any) {
        redirectToComingSoonVC("Button")
    }
    
    @objc func redirectToComingSoonVC(_ sender: Any) {
        let comingSoonVC = ComingSoonViewController(nibName : "ComingSoonViewController", bundle : nil)
        comingSoonVC.textTitle = (sender is String) ? "Filter" : "Exports"
        self.navigationController?.pushViewController(comingSoonVC, animated: true)
    }
    
    func goToDashboard(_ sender: Int) {
        stackviewExports.isHidden = true
        buttonFilter.isHidden = true
        labelTitle.text = (sender == 1) ? "Dashboard" : (sender == 2) ? "Add Load" : (sender == 3) ? "Load" : "Setting"
        if self.loadVC != nil{
            self.loadVC.view.removeFromSuperview();
        }
    }
    
    func goToLoad(){
        labelTitle.text = "Load"
        stackviewExports.isHidden = false
        buttonFilter.isHidden = false
        loadVC = LoadViewController(nibName : "LoadViewController", bundle : nil)
        loadVC.view.frame = CGRect(x: 0, y: viewTop.frame.height, width: view.frame.width, height: view.frame.height - (viewTop.frame.height + viewBottom.frame.height))
        view.addSubview(loadVC.view)
        view.bringSubviewToFront(viewTop)
        view.bringSubviewToFront(buttonFilter)
        view.bringSubviewToFront(viewBottom)
    }
}
