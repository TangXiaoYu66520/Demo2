//
//  CityTableViewController.swift
//  Demo2
//
//  Created by 唐小雨 on 2019/3/3.
//  Copyright © 2019 唐小雨. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class CityTableViewController: CoreDataTableViewController {
        
    var viewContext:NSManagedObjectContext? {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            return appDelegate.persistentContainer.viewContext
        }
        else{
            return nil
        }
    }
    
    func fetchRequestController(in context:NSManagedObjectContext) -> NSFetchedResultsController<City>?{
        let fetchRequest = NSFetchRequest<City>(entityName: UtilityString.city)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: UtilityString.sortDescriptorKey, ascending: true)]
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: UtilityString.sortDescriptorKey, cacheName: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.delegate = self
        
        if let context = viewContext, let localFetchRequestController = fetchRequestController(in: context) {
            fetchedResultsController = localFetchRequestController as? NSFetchedResultsController<NSFetchRequestResult>
        }
        
        title = UtilityString.city
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UtilityString.cityCell, for: indexPath)
        
        if let city = fetchedResultsController?.object(at: indexPath) as? City {
            cell.textLabel?.text = city.name
            cell.detailTextLabel?.text = city.type
        }
        
        return cell
    }
}

extension CityTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        let city = fetchedResultsController?.object(at: indexPath!) as! City

        switch segue.identifier {
        case UtilityString.showMapSegue:
            if let cityMapVC = segue.destination as? CityMapViewController{
                cityMapVC.city = city
                cityMapVC.title = city.name
            }
        case UtilityString.showImageFromTableSegue:
            var imageVC: ScrollImageViewController
            if let navigation = segue.destination as? UINavigationController{
                imageVC = navigation.visibleViewController as! ScrollImageViewController
            }
            else{
                imageVC = segue.destination as! ScrollImageViewController
            }
            
            imageVC.imageURL = city.imageURL
            imageVC.title = city.name
        default :
            super.prepare(for: segue, sender: sender)
        }
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
//        let city = fetchedResultsController?.object(at: indexPath!) as! City
//
//        switch identifier {
//        case UtilityString.showMapSegue:
//            return CLLocationCoordinate2DIsValid(city.coordinate)
//        case UtilityString.showImageFromTableSegue:
//            return !CLLocationCoordinate2DIsValid(city.coordinate)
//        default:
//            return super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = fetchedResultsController?.object(at: indexPath) as! City
        let cell = tableView.cellForRow(at: indexPath)
        
        if CLLocationCoordinate2DIsValid(city.coordinate) {
            performSegue(withIdentifier: UtilityString.showMapSegue, sender: cell)
        }
        else{
            performSegue(withIdentifier: UtilityString.showImageFromTableSegue, sender: cell)
        }
    }
    
}

extension CityTableViewController: UISplitViewControllerDelegate {
    
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        let navigation = secondaryViewController as! UINavigationController
        let imageVC = navigation.viewControllers.first! as! ScrollImageViewController
        if imageVC.image == nil{
            return true
        }
        else{
            return false
        }
    }
    
}
