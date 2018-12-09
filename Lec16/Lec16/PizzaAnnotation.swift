
import Foundation
import MapKit

class PizzaAnnotation: NSObject, MKAnnotation{
    var title: String?
    var subtitle:String?
    var coordinate: CLLocationCoordinate2D
    
    //title, subtitle, description
    
    init(coordinate: CLLocationCoordinate2D, title:String?, subtitle:String?){
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
    override var description: String{
        return "\(title ?? "")\n"
    }
    
}
