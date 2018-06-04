import Foundation

enum Brand { case BMW, Mercedes }

class Car {
    var name: String = ""
    var since: Int = 0
    
    init(_ company: String, _ year: Int) {
        self.name = company
        self.since = year
    }
    
    func printCompany() {
        print("\(name), \(since)")
    }
}

class BMW: Car {}

class Mercedes: Car {}

protocol AbstractCarFactory {
    func makeCar() -> Car
}

class BMWFactory: AbstractCarFactory {
    var companyName: String
    var companyYear: Int
    
    init(_ name: String, _ year: Int) {
        companyName = name
        companyYear = year
    }
    func makeCar() -> Car {
        return BMW(companyName, companyYear)
    }
}

class MercedesFactory: AbstractCarFactory {
    var companyName: String
    var companyYear: Int
    
    init(_ name: String, _ year: Int) {
        companyName = name
        companyYear = year
    }
    
    func makeCar() -> Car {
        return Mercedes(companyName, companyYear)
    }
}

class CarFactory {
    static func getCar(factory: AbstractCarFactory) -> Car {
        return factory.makeCar()
    }
}

var car1 = CarFactory.getCar(factory: BMWFactory("BMW 3", 1909))
car1.printCompany()

var car2 = CarFactory.getCar(factory: MercedesFactory("Mercedes E", 1949))
car2.printCompany()




