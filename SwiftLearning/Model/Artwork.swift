//
//  ArtWork.swift
//  SwiftLearning
//
//  Created by Al on 6/15/17.
//  Copyright © 2017 GeekRRK. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Artwork: NSObject, MKAnnotation {
    /// Title for annotation view.
    let title: String?
    
    /// Location name for subtitle.
    let locationName: String
    
    /// Discipline of the artwork.
    let discipline: String
    
    /// Coordinate data of the artwork location.
    let coordinate: CLLocationCoordinate2D
    
    /// Subtitle for annotation view.
    var subtitle: String? {
        return locationName
    }
    
    /// Initializer.
    ///
    /// - Parameters:
    ///   - title: Name of the artwork.
    ///   - locationName: Location of the artwork.
    ///   - discipline: Category of the artwork.
    ///   - coordinate: Longitude and latitude of the artwork.
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    func mapItem() -> MKMapItem {
        if let subtitle = subtitle {
            let addressDict = [CNPostalAddressStreetKey: subtitle]
            let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = title
            
            return mapItem
        } else {
            fatalError("Subtitle is nil")
        }
    }
    
    func pinColor() -> UIColor {
        switch discipline {
        case "Sculpture", "Plaque":
            return MKPinAnnotationView.redPinColor()
        case "Mural", "Monument":
            return MKPinAnnotationView.purplePinColor()
        default:
            return MKPinAnnotationView.greenPinColor()
        }
    }
    
    static func fromJSON(json: [JSONValue]) -> Artwork? {
        let locationName = json[12].string
        let discipline = json[15].string
        
        let latitude = (json[18].string! as NSString).doubleValue
        let longitude = (json[19].string! as NSString).doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        return Artwork(title: json[16].string ?? "", locationName: locationName!, discipline: discipline!, coordinate: coordinate)
    }
}
