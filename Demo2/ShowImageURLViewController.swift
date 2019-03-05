//
//  ShowImageURLViewController.swift
//  Demo2
//
//  Created by 唐小雨 on 2019/3/4.
//  Copyright © 2019 唐小雨. All rights reserved.
//

import UIKit

class ShowImageURLViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var textView: UITextView!
    
    var text: String? {didSet { if view.window != nil { textView.text = text }}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popoverPresentationController?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.text = text
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }q
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let size = textView.sizeThatFits(UIView.layoutFittingExpandedSize)
        
        preferredContentSize = CGSize(width: size.width + 8, height: size.height + 8)
        
    }
}
