import Foundation

enum Brand {
    case BMW, Mercedes
}

class Car {
    var name: String = ""
    var since: Int = 0
    
    func printCompany() {
        print("\(name), \(since)")
    }
}

class BMW: Car {
    override init() {
        super.init()
        name = "BMW"
        since = 1930
    }
}

class Mercedes: Car {
    override init() {
        super.init()
        name = "Mercedes"
        since = 1901
    }
}

class CarFactory {
    static func makeCar(_ brand: Brand) -> Car {
        return brand == Brand.BMW ? BMW() : Mercedes()
    }
}

var carA = CarFactory.makeCar(Brand.BMW)
var carB = CarFactory.makeCar(Brand.Mercedes)

carA.printCompany()
carB.printCompany()







