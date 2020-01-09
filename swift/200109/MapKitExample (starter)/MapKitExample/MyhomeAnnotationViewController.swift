//
//  MyhomeAnnotationViewController.swift
//  MapKitExample
//
//  Created by 정유경 on 2020/01/09.
//  Copyright © 2020 giftbot. All rights reserved.
//
//~~~~~~~~~~~code로 맵킷~~~~~~~~~~~~~~
/***********************************
 [ 과제 ]
 1. 입력한 주소들을 차례대로 잇는 선 만들기   (샘플 영상 참고)
 > 텍스트필드에 주소를 입력하면 해당 위치로 애니메이션과 함께 맵 이동 (CoordinateSpan 값 - 0.02)
 > 입력한 주소값으로 이동한 뒤 그 위치를 표시하기 위한 사각형 그리기 + Annotation 추가하기
 > Annotation 의 제목은 1번째 행선지, 2번째 행선지 처럼 순서를 표시하고, 부제목은 그 곳의 주소 나타내기
 > 마지막으로 입력한 주소값과 그 직전의 주소값 사이에 선 그리기
   (가장 처음 입력한 주소는 그것과 연결할 직전의 주소값이 없으므로 제외)
 참고: delegate 메서드 중 regionDidChangeAnimated 메서드 참고
 ***************************************/

import UIKit
import MapKit

class MyhomeAnnotationViewController: UIViewController {
    
    let mapView = MKMapView()
    let textField = UITextField()
    let sendButton = UIButton()
    var points = [CLLocationCoordinate2D]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mapView.delegate = self
        
        setUI()
        autoLayout()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    func setUI() {
        
        textField.backgroundColor = .white
        textField.placeholder = "  입력해보셔용~(>_<)/"
        view.addSubview(textField)
        view.addSubview(mapView)
        
        sendButton.setTitle("핀!!", for: .normal)
        sendButton.backgroundColor = .white
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.addTarget(self, action: #selector(triAngleButton), for: .touchUpInside)
        view.addSubview(sendButton)
    }
    func autoLayout() {
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        textField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -8).isActive = true
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8).isActive = true
        mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
    }
    var count = 0
    func geocodeAddressString(_ addressString: String) {
        print("\n---------- [ 주소 -> 위경도 ] ----------")
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            print(place)
            
            let latitude = place.location?.coordinate.latitude
            let longitude = place.location?.coordinate.longitude
            
            let annotation = MKPointAnnotation()
            annotation.title = "\(self.count)번째 행선지"
            annotation.subtitle = "\(addressString)"
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            self.mapView.addAnnotation(annotation)
            
            
            let point = annotation.coordinate
            self.points.append(point)
            let polyline = MKPolyline(coordinates: self.points, count: self.points.count)
            self.mapView.addOverlay(polyline)
            
            var point1 = point; point1.longitude += 0.04;  point1.latitude += 0.04
            var point2 = point; point2.longitude -= 0.04;  point2.latitude += 0.04
            var point3 = point; point3.longitude -= 0.04;  point3.latitude -= 0.04
            var point4 = point; point4.longitude += 0.04;  point4.latitude -= 0.04
            let points2:[CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
            let polyline2 = MKPolyline(coordinates: points2, count: points2.count)
            self.mapView.addOverlay(polyline2)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            let region = MKCoordinateRegion(center: point, span: span)
            self.mapView.setRegion(region, animated: true)
            
        }
    }
    
    
    @objc func triAngleButton() {
        guard let address = textField.text else { return }
        geocodeAddressString(address)
        count += 1
      
        
    }
}
extension MyhomeAnnotationViewController : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
        
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .red
        renderer.lineWidth = 2
        return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    
}
