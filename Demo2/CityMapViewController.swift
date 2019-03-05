//
//  CityMapViewController.swift
//  Demo2
//
//  Created by 唐小雨 on 2019/3/4.
//  Copyright © 2019 唐小雨. All rights reserved.
//

import UIKit
import MapKit

class CityMapViewController: UIViewController {

    var city: City?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if city != nil, CLLocationCoordinate2DIsValid(city!.coordinate) {
            mapView.addAnnotation(city!)
            mapView.showAnnotations([city!], animated: false)
        }
        
        mapView.delegate = self
    }
    
    @IBAction func showCity() {
        mapView.showAnnotations([city!], animated: true)
    }
    

}

extension CityMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        performSegue(withIdentifier: UtilityString.showImageFromMapSegue, sender: view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let city = (sender as! MKAnnotationView).annotation as! City

        if segue.identifier == UtilityString.showImageFromMapSegue {
            var imageVC: ScrollImageViewController
            if let navigation = segue.destination as? UINavigationController{
                imageVC = navigation.visibleViewController as! ScrollImageViewController
            }
            else{
                imageVC = segue.destination as! ScrollImageViewController
            }

            imageVC.imageURL = city.imageURL
            imageVC.title = city.name

        }
    }
}
