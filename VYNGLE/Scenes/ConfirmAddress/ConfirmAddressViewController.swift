//
//  ConfirmAddressViewController.swift
//  VYNGLE
//
//  Created by Sujeet on 8/27/17.
//  Copyright (c) 2017 Sujeet. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import MapKit
import CoreLocation
//import CLGeocoder


protocol ConfirmAddressDisplayLogic: class
{
  func displaySomething(viewModel: ConfirmAddress.Something.ViewModel)
}

class ConfirmAddressViewController: UIViewController, ConfirmAddressDisplayLogic, CLLocationManagerDelegate, MKMapViewDelegate
{
  var interactor: ConfirmAddressBusinessLogic?
  var router: (NSObjectProtocol & ConfirmAddressRoutingLogic & ConfirmAddressDataPassing)?

    @IBOutlet weak var mapView: MKMapView!
  // MARK: Object lifecycle
    @IBOutlet weak var btnScheduleDel: UIButton!

    @IBOutlet weak var viewAddress: CardView?
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var viewScheduleBottom: CardView?
//    let regionRadius: CLLocationDistance = 1000
//    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    let locationManager = CLLocationManager()
    var userLocation:CLLocationCoordinate2D?
    private var mapChangedFromUserInteraction = false


    // adding all pins

    var cnt = 0
    
    struct Location {
        let title: String
        let latitude: Double
        let longitude: Double
    }
    
    let locations = [
        Location(title: "Nakhon Pathom", latitude: 13.814029, longitude: 100.037292),
        Location(title: "Chiang Mai", latitude: 14.056666, longitude: 98.997116),
        Location(title: "Nakhon Ratchasima", latitude: 15.979900, longitude: 100.097771),
        Location(title: "Hai Ya", latitude: 15.772558, longitude: 98.982361),
        Location(title: "Khon Kaen", latitude: 16.439625, longitude: 102.828728),
        Location(title: "Chon Buri", latitude: 13.361143, longitude: 100.984673),
        Location(title: "Bang Na", latitude: 13.668217, longitude: 100.614021)

    ]
    // adding all pins End

    
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
    @IBAction func btnScheduleDelClicked(_ sender: Any) {
    }
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ConfirmAddressInteractor()
    let presenter = ConfirmAddressPresenter()
    let router = ConfirmAddressRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    setUI()
    lblAddress.isHidden = true
    viewAddress?.isHidden = true
    doSomething()
//    centerMapOnLocation(location: initialLocation)
    initializeMap()

  }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Confirm Address".localizedUppercase
        mapView.showsUserLocation = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
        mapView.showsUserLocation = false
    }
    
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
    func setUI() {
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: titleFont!]
        btnScheduleDel.setTitle("Schedule Delivery".localizedUppercase, for: UIControlState.normal)
        btnScheduleDel.titleLabel?.font = buttonFont
        lblAddress.font = mapAddress
    }
    
    func initializeMap() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
//        mapView.isScrollEnabled = false
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
        //addTapGesture()
        addLongPressGesture()
    }
    
    func addTapGesture(){
        let tapRecogniser:UITapGestureRecognizer = UITapGestureRecognizer(target:self , action:#selector(self.handleLongPress(_:)))
       // tapRecogniser.minimumPressDuration = 1.0 //user needs to press for 2 seconds
        self.mapView.addGestureRecognizer(tapRecogniser)
    }

    func addLongPressGesture(){
        let longPressRecogniser:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target:self , action:#selector(self.handleLongPress(_:)))
        longPressRecogniser.minimumPressDuration = 1.0 //user needs to press for 2 seconds
        self.mapView.addGestureRecognizer(longPressRecogniser)
    }
    
    func handleLongPress(_ gestureRecognizer:UIGestureRecognizer){
        if gestureRecognizer.state != .began{
            return
        }
        
        let touchPoint:CGPoint = gestureRecognizer.location(in: self.mapView)
        let touchMapCoordinate:CLLocationCoordinate2D =
            self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        
        let annot:MKPointAnnotation = MKPointAnnotation()
        annot.coordinate = touchMapCoordinate
        
        self.resetTracking()
        self.mapView.addAnnotation(annot)
        self.centerMap(touchMapCoordinate)
        self.lblAddress.isHidden = false
        self.viewAddress?.isHidden = false

        // adding all pins
        
        let annotations = locations.map { location -> MKAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = location.title
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            return annotation
        }
        mapView.addAnnotations(annotations)
        // adding all pins end
    }
    
    func resetTracking(){
//        if (mapView.showsUserLocation){
//            mapView.showsUserLocation = false
            self.mapView.removeAnnotations(mapView.annotations)
            self.locationManager.stopUpdatingLocation()
//        }
    }
    
    func centerMap(_ center:CLLocationCoordinate2D){
        self.saveCurrentLocation(center)
        let spanX = 0.007
        let spanY = 0.007
        let newRegion = MKCoordinateRegion(center:center , span: MKCoordinateSpanMake(spanX, spanY))
        mapView.setRegion(newRegion, animated: true)
    }
    
    func saveCurrentLocation(_ center:CLLocationCoordinate2D){
        let message = "\(center.latitude) , \(center.longitude)"
        print(message)
        userLocation = center
        
        let location = CLLocation(latitude: center.latitude, longitude: center.longitude) //changed!!!
        print(location)

        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            print(location)
            
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks![0]
                var addressString : String = ""
                if pm.subLocality != nil {
                    addressString = addressString + pm.subLocality! + ", "
                }
                if pm.thoroughfare != nil {
                    addressString = addressString + pm.thoroughfare! + ", "
                }
                if pm.locality != nil {
                    addressString = addressString + pm.locality! + ", "
                }
                if pm.country != nil {
                    addressString = addressString + pm.country! + ", "
                }
                if pm.postalCode != nil {
                    addressString = addressString + pm.postalCode! + " "
                }
            
                self.lblAddress.text = addressString
            }
            else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    private func mapViewRegionDidChangeFromUserInteraction() -> Bool {
        let view: UIView = self.mapView.subviews[0] as UIView
        //  Look through gesture recognizers to determine whether this region change is from user interaction
        if let gestureRecognizers = view.gestureRecognizers {
            for recognizer in gestureRecognizers {
                if( recognizer.state == UIGestureRecognizerState.began || recognizer.state == UIGestureRecognizerState.ended ) {
                    return true
                }
            }
        }
        return false
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        mapChangedFromUserInteraction = mapViewRegionDidChangeFromUserInteraction()
        if (mapChangedFromUserInteraction) {
            // user changed map region
            print("user changed map region")
        }
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if (mapChangedFromUserInteraction) {
            // user changed map region
            print("user changed map region")
        }
    }
    
    // This function is called each time the user moves.
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        // Use Control Flow: if the user has moved the map, then don't re-center.
        // NOTE: this is using 'mapChangedFromUserInteraction' from above.
        
        if mapChangedFromUserInteraction == true {
            
            // do nothing, because the user has moved the map.
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if mapChangedFromUserInteraction == true {
            
            // do nothing, because the user has moved the map.
            locationManager.stopUpdatingHeading()
        }
        else {
            let locValue:CLLocationCoordinate2D = manager.location!.coordinate
            centerMap(locValue)
        }
    }
    
    static var enable:Bool = true
    @IBAction func getMyLocation(_ sender: UIButton) {
        
        if CLLocationManager.locationServicesEnabled() {
            if ConfirmAddressViewController.enable {
                locationManager.stopUpdatingHeading()
                sender.titleLabel?.text = "Enable"
            }else{
                locationManager.startUpdatingLocation()
                sender.titleLabel?.text = "Disable"
            }
            ConfirmAddressViewController.enable = !ConfirmAddressViewController.enable
        }
    }
    
   /* func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        let identifier = "pin"
        var view : MKPinAnnotationView
        if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView{
            dequeueView.annotation = annotation
            view = dequeueView
        }else{
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        view.pinTintColor =  .red
        return view
    }*/
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation.isKind(of: MKUserLocation.self)){
            return nil
        }
        let annotationIdentifier = "SomeCustomIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
            
            var pinImage = UIImage(named: "corkscrew7.png")

            if cnt == 0 {
                pinImage = UIImage(named: "corkscrew1.png")
            }
            else if cnt == 1 {
                pinImage = UIImage(named: "corkscrew2.png")
            }
            else if cnt == 2 {
                pinImage = UIImage(named: "corkscrew3.png")
            }else if cnt == 3 {
                pinImage = UIImage(named: "corkscrew4.png")
            }else if cnt == 4 {
                pinImage = UIImage(named: "corkscrew5.png")
            }else if cnt == 5 {
                pinImage = UIImage(named: "corkscrew6.png")
            }else if cnt == 6 {
                pinImage = UIImage(named: "corkscrew7.png")
            }
            cnt += 1
            // Resize image
            annotationView?.image = pinImage
            
            let rightButton: AnyObject! = UIButton(type: UIButtonType.detailDisclosure)
            annotationView?.rightCalloutAccessoryView = rightButton as? UIView
        }
        else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }


    

//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//                                                                  regionRadius * 2.0, regionRadius * 2.0)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }

    
  func doSomething()
  {
    let request = ConfirmAddress.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: ConfirmAddress.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
