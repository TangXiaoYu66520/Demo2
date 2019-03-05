//
//  ScrollImageViewController.swift
//  Demo2
//
//  Created by 唐小雨 on 2019/3/4.
//  Copyright © 2019 唐小雨. All rights reserved.
//

import UIKit

class ScrollImageViewController: UIViewController {
    
    var imageURL: URL?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet {
            scrollView.maximumZoomScale = 3
            scrollView.minimumZoomScale = 0.3
            scrollView.delegate = self
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        get {
            return imageView?.image
        }
        set {
            imageView?.image = newValue
            activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.hidesBarsOnTap = true
        
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
        
        if imageURL != nil{
            activityIndicator.startAnimating()
            let session = URLSession.shared
            session.downloadTask(with: imageURL!, completionHandler: { [weak self] (localURL, urlResponse, error) in
                if urlResponse?.url == self?.imageURL, error == nil{
                    if let data = try? Data(contentsOf: localURL!), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }).resume()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case UtilityString.showURLSegue:
            if let textVC = segue.destination as? ShowImageURLViewController {
                textVC.text = imageURL?.absoluteString ?? "NO Image URL"
            }
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
}

extension ScrollImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        view?.setNeedsDisplay()
    }
    
}

