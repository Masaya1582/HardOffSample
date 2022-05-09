

import UIKit
import MapKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var shopmap: MKMapView!
    @IBOutlet weak var shopLabel: UILabel!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }
    
    //地図表示の初期設定
    private func setupMapView(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    //現在地を取得する
    @IBAction func currentLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
    
}

//地図の詳細設定
extension SearchViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else { return }
        
        CLGeocoder().reverseGeocodeLocation(loc, completionHandler: {(placemarks, error) in
            
            if let error = error {
                print("reverseGeocodeLocation Failed: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?[0] {
                
                var locInfo = ""
                locInfo = locInfo + "Latitude: \(loc.coordinate.latitude)\n"
                locInfo = locInfo + "Longitude: \(loc.coordinate.longitude)\n\n"
                
                locInfo = locInfo + "Country: \(placemark.country ?? "")\n"
                locInfo = locInfo + "State/Province: \(placemark.administrativeArea ?? "")\n"
                locInfo = locInfo + "City: \(placemark.locality ?? "")\n"
                locInfo = locInfo + "PostalCode: \(placemark.postalCode ?? "")\n"
                locInfo = locInfo + "Name: \(placemark.name ?? "")"
                
                //self.shopLabel.text = locInfo
            }
        })
        
        let cr = MKCoordinateRegion(center: loc.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        shopmap.setRegion(cr, animated: true)
        
        let pa = MKPointAnnotation()
        pa.title = "ここにいるよ!"
        pa.coordinate = loc.coordinate
        shopmap.removeAnnotations(shopmap.annotations)
        shopmap.addAnnotation(pa)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
}
