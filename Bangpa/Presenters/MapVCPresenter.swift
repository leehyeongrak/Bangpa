////
////  MapVCPresenter.swift
////  Bangpa
////
////  Created by 이동건 on 21/08/2018.
////  Copyright © 2018 이동건. All rights reserved.
////
//
//import Foundation
//
//enum TrackingState {
//    case disabled
//    case tracking
//}
//
//protocol MapViewProtocol: class {
//    func updateState(_ newState: TrackingState)
//    func clearMyLocation()
//    func setupMyLocation(location: NGeoPoint, locationAccuracy: Float)
//    func showLocaitonFailError(title: String, message: String)
//}
//
//class MapVCPresenter: NSObject {
//    private weak var vc: MapViewProtocol?
//    var locationManager: NMapLocationManager
//    var currentState: TrackingState = .disabled
//    
//    init(with locationManager: NMapLocationManager) {
//        self.locationManager = locationManager
//    }
//    
//    func attachView(vc: MapViewProtocol) {
//        self.vc = vc
//    }
//    
//    func detatchView() {
//        self.vc = nil
//    }
//    
//    func enableLocationUpdate() {
//            
//        if locationManager.locationServiceEnabled() == false {
//            locationManager(locationManager, didFailWithError: .denied)
//            return
//        }
//        
//        if locationManager.isUpdateLocationStarted() == false {
//            locationManager.setDelegate(self)
//            locationManager.startContinuousLocationInfo()
//        }
//    }
//    
//    func disableLocationUpdate() {
//        
//        if locationManager.isUpdateLocationStarted() {
//            // start updating location
//            locationManager.stopUpdateLocationInfo()
//            // set delegate
//            locationManager.setDelegate(nil)
//        }
//        
//        vc?.clearMyLocation()
//    }
//    
//    func setupState(){
//        switch currentState {
//        case .disabled:
//            enableLocationUpdate()
//            currentState = .tracking
//            vc?.updateState(.tracking)
//        case .tracking:
//            disableLocationUpdate()
//            currentState = .disabled
//            vc?.updateState(.disabled)
//        }
//    }
//}
//
//extension MapVCPresenter: NMapLocationManagerDelegate {
//    open func locationManager(_ locationManager: NMapLocationManager!, didUpdateTo location: CLLocation!) {
//        
//        let coordinate = location.coordinate
//        
//        let myLocation = NGeoPoint(longitude: coordinate.longitude, latitude: coordinate.latitude)
//        let locationAccuracy = Float(location.horizontalAccuracy)
//        vc?.setupMyLocation(location: myLocation, locationAccuracy: locationAccuracy)
//    }
//    
//    open func locationManager(_ locationManager: NMapLocationManager!, didFailWithError errorType: NMapLocationManagerErrorType) {
//        
//        let title = "NMapViewer"
//        var message: String = ""
//        
//        switch errorType {
//        case .unknown: fallthrough
//        case .canceled: fallthrough
//        case .timeout:
//            message = "일시적으로 내위치를 확인 할 수 없습니다."
//        case .denied:
//            message = "위치 정보를 확인 할 수 없습니다.\n사용자의 위치 정보를 확인하도록 허용하시려면 위치서비스를 켜십시오."
//        case .unavailableArea:
//            message = "현재 위치는 지도내에 표시할 수 없습니다."
//        case .heading:
//            message = "나침반 정보를 확인 할 수 없습니다."
//        }
//        
//        vc?.showLocaitonFailError(title: title, message: message)
//    }
//    
//    func onMapViewIsGPSTracking(_ mapView: NMapView!) -> Bool {
//        return NMapLocationManager.getSharedInstance().isTrackingEnabled()
//    }
//    
//    func findCurrentLocation() {
//        enableLocationUpdate()
//    }
//}
