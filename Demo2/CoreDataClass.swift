//
//  City.swift
//  Demo2
//
//  Created by 唐小雨 on 2019/3/3.
//  Copyright © 2019 唐小雨. All rights reserved.
//

import Foundation
import CoreLocation
import CoreData
import MapKit

extension City: MKAnnotation {
    
    public var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    public var title: String?{
        return name
    }
    
    public var subtitle: String?{
        return type
    }
    
    class func city(model: LandscapeModel, context:NSManagedObjectContext) -> City?{
        
        if let cityName = model.city, let type = model.type, let imageURL = model.imageURL {
            let fetchRequest = NSFetchRequest<City>(entityName: UtilityString.city)
            fetchRequest.predicate = NSPredicate(format: "name == %@ && type == %@ && imageURL == %@", cityName, type, imageURL as CVarArg)
            
            if let citys = try? context.fetch(fetchRequest) {
                if citys.isEmpty{
                    let city = NSEntityDescription.insertNewObject(forEntityName: UtilityString.city, into: context) as! City
                    city.name = model.city
                    city.type = model.type
                    city.latitude = model.coordinate?.latitude ?? kCLLocationCoordinate2DInvalid.latitude
                    city.longitude = model.coordinate?.longitude ?? kCLLocationCoordinate2DInvalid.longitude
                    city.imageURL = model.imageURL
                    city.country = Country.country(name: model.country!, context: context)
                    return city
                }
                else if citys.count == 1 {
                    return citys.first!
                }
                else {
                    let firstCity = citys.first!
                    for city in citys {
                        if city !== firstCity {
                            context.delete(city)
                        }
                    }
                    return firstCity
                }
            }
            else{
                return nil
            }
            
        }
        else{
            return nil
        }
    }
    
}

extension Country {
    class func country(name: String, context:NSManagedObjectContext) -> Country?{
        
        let fetchRequest = NSFetchRequest<Country>(entityName: UtilityString.country)
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        if let countrys = try? context.fetch(fetchRequest) {
            if countrys.isEmpty{
                let country = NSEntityDescription.insertNewObject(forEntityName: UtilityString.country, into: context) as! Country
                country.name = name
                return country
            }
            else if countrys.count == 1 {
                return countrys[0]
            }
            else {
                let firstCountry = countrys.first!
                for country in countrys {
                    if country !== firstCountry {
                        context.delete(country)
                    }
                }
                return firstCountry
            }
        }
        else{
            return nil
        }
    }
    
}
