//
//  ComingSoonViewController.swift
//  AutomaticLabelHeight
//
//  Created by Umamaheshwari on 10/01/20.
//  Copyright © 2020 Umamaheshwari. All rights reserved.
//

import UIKit

class ComingSoonViewController: UIViewController {

    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    var textTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = textTitle
    }
    
    @IBAction func handlerToCloseView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
