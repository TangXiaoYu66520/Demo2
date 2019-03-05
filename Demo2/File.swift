//
//  File.swift
//  Demo2
//
//  Created by 唐小雨 on 2019/3/3.
//  Copyright © 2019 唐小雨. All rights reserved.
//

import Foundation
import CoreLocation

struct LandscapeModel {
    var country: String?
    var city: String?
    var type: String?
    var coordinate: CLLocationCoordinate2D?
    var imageURL: URL?
}

struct Landscapes {
    
    var contents: [Array<LandscapeModel>]!
    
    init() {
        let londonLandscape1 = LandscapeModel(country: "United Kingdom", city: "London", type: "city", coordinate: nil, imageURL: URL(string: "http://www.dnzhuti.com/uploads/allimg/170105/95-1F105163039.jpg"))
        let londonLandscape2 = LandscapeModel(country: "United Kingdom", city: "London", type: "scape", coordinate: CLLocationCoordinate2D(latitude: 51.3, longitude: 0.15), imageURL: URL(string: "http://pic3.nipic.com/20090519/2563280_164805038_2.jpg"))
        let birminghamLandscape1 = LandscapeModel(country: "United Kingdom", city: "Birmingham", type: "scape", coordinate: nil, imageURL: URL(string: "http://pic.baike.soso.com/p/20130621/20130621145521-1324702063.jpg"))
        let londonLandscapes = [londonLandscape1, londonLandscape2, birminghamLandscape1]
        
        
        let berlinLandscape1 = LandscapeModel(country: "Germany", city: "Berlin", type: "city", coordinate: CLLocationCoordinate2D(latitude: 52.31, longitude: 13.2), imageURL: URL(string: "http://img1.3lian.com/img013/v2/56/d/21.jpg"))
        let berlinLandscape2 = LandscapeModel(country: "Germany", city: "Berlin", type: "scape", coordinate: CLLocationCoordinate2D(latitude: 52.31, longitude: 14.2), imageURL: URL(string: "http://pic24.nipic.com/20120922/6016492_103639308118_2.jpg"))
        let berlinLandscapes = [berlinLandscape1, berlinLandscape2]
        
        let parisLandscape1 = LandscapeModel(country: "France", city: "Paris", type: "city", coordinate: CLLocationCoordinate2D(latitude: 48.52, longitude: 2.25), imageURL: URL(string: "http://pic37.nipic.com/20140102/4855816_141958308150_2.jpg"))
        let parisLandscape2 = LandscapeModel(country: "France", city: "Paris", type: "scape", coordinate: nil, imageURL: URL(string: "http://pic37.nipic.com/20140116/2457331_205604643000_2.jpg"))
        let parisLandscapes = [parisLandscape1, parisLandscape2]
        
        
        let newYorkLandscape1 = LandscapeModel(country: "America", city: "NewYork", type: "city", coordinate: CLLocationCoordinate2D(latitude: 40.42, longitude: 74.02), imageURL: URL(string: "https://www.fourseasons.com/alt/img-opt/publish/content/dam/fourseasons/images/web/NYF/NYF_395_aspect16x9.jpg/80.jpg"))
        let newYorkLandscape2 = LandscapeModel(country: "America", city: "NewYork", type: "scape", coordinate: CLLocationCoordinate2D(latitude: 40.42, longitude: 76.02), imageURL: URL(string: "http://pic1.nipic.com/2008-12-26/2008122611933900_2.jpg"))
        let losAngelesLandscape1 = LandscapeModel(country: "America", city: "Los Angeles", type: "city", coordinate: nil, imageURL: URL(string: "http://img1.3lian.com/img013/v1/56/d/41.jpg"))
        let chicagoLandscape1 = LandscapeModel(country: "America", city: "Chicago", type: "city", coordinate: nil, imageURL: URL(string: "https://cdn0.vox-cdn.com/thumbor/Oy3hUvfuXDHh_Ti5bn491HwvEio=/0x87:703x482/1600x900/cdn0.vox-cdn.com/uploads/chorus_image/image/49196369/vistaexterior4.0.jpeg"))
        let houstonLandscape1 = LandscapeModel(country: "America", city: "Houston", type: "city", coordinate: nil, imageURL: URL(string: "http://wallpoper.com/images/00/44/55/00/houston-at-night_00445500.jpg"))

        let newYorkLandscapes = [newYorkLandscape1, newYorkLandscape2, losAngelesLandscape1, chicagoLandscape1, houstonLandscape1]
        
        
        let shangHaiLandscape1 = LandscapeModel(country: "China", city: "ShangHai", type: "city", coordinate: CLLocationCoordinate2D(latitude: 40.42, longitude: 74.02), imageURL: URL(string: "http://y1.ifengimg.com/a/2016_10/73e37122ef1fde1.jpg"))
        let shangHaiLandscape2 = LandscapeModel(country: "China", city: "ShangHai", type: "scape", coordinate: nil, imageURL: URL(string: "http://img15.3lian.com/2015/f1/5/d/42.jpg"))
        let beiJingLandscape1 = LandscapeModel(country: "China", city: "BeiJing", type: "city", coordinate: nil, imageURL: URL(string: "http://www.dnzhuti.com/uploads/allimg/170509/95-1F509155153.jpg"))
        let shenZhenLandscape1 = LandscapeModel(country: "China", city: "ShenZhen", type: "city", coordinate: nil, imageURL: URL(string: "http://pic.lvmama.com/uploads/pc/place2/2016-12-12/ced09b2e-edbd-4d76-9560-4d642cd66057.jpg"))
        let shangHaiLandscapes = [shangHaiLandscape1, shangHaiLandscape2, beiJingLandscape1,shenZhenLandscape1]

        contents = [londonLandscapes, berlinLandscapes, parisLandscapes, newYorkLandscapes, shangHaiLandscapes]
    }
    
}

