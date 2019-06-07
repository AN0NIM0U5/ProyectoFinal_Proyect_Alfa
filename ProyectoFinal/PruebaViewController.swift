//
//  UIPruebaViewController.swift
//  PROYECTO_Alfa
//
//  Created by Dev2 on 31/05/2019.
//  Copyright © 2019 Alberto. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
 
        func generateAnnoLoc() {

        var num = 0

        while num != 15 {
            num += 1

        let location = CLLocationCoordinate2D(latitude: 51.50007773, longitude: -0.1246402)
        let span = MKCoordinateSpan(latitudeDelta: 0.05,   longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)

        mapView.setRegion(region, animated: true)

        func generateRandomCoordinates(min: UInt32, max: UInt32)-> CLLocationCoordinate2D {

        let currentLong = location.longitude
        let currentLat = location.latitude
        let meterCord = 0.00900900900901 / 1000
        let randomMeters = UInt(arc4random_uniform(max) + min)
        let randomPM = arc4random_uniform(6)
        let metersCordN = meterCord * Double(randomMeters)
                
        if randomPM == 0 {
            return CLLocationCoordinate2D(latitude: currentLat + metersCordN, longitude: currentLong + metersCordN)
        }else if randomPM == 1 {
            return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong - metersCordN)
        }else if randomPM == 2 {
            return CLLocationCoordinate2D(latitude: currentLat + metersCordN, longitude: currentLong - metersCordN)
        }else if randomPM == 3 {
            return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong + metersCordN)
        }else if randomPM == 4 {
            return CLLocationCoordinate2D(latitude: currentLat, longitude: currentLong - metersCordN)
        }else {
            return CLLocationCoordinate2D(latitude: currentLat - metersCordN, longitude: currentLong)
                }

            }
            //erdekhayser Code:
            func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
                return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)}

        func generateAnnoLoc() {
                
                var num = 0
                while num != 15 {
                    num += 1
                    
                 
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(randomBetweenNumbers(firstNum: -90, secondNum: 90)), longitude: CLLocationDegrees(randomBetweenNumbers(firstNum: -180, secondNum: 180)))
                    
                    annotation.title = "Big Ben"
                    annotation.subtitle = "London"
                    mapView.addAnnotation(annotation)
                
               
                }
          
            }
         }
            
            
        }

        generateAnnoLoc()
    }
        

}
    

    

//    func random()->CGPoint { return CGPoint(x:Int(arc4random()%1000),y:Int(arc4random()%1000))}
















