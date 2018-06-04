import Foundation

class Car {
    private var brand: String
    private var model: String
    private var year: Int
    private var km: Int
    private var fuel: String
    
    private init(_ builder: Builder) {
        self.brand = builder.brand
        self.model = builder.model
        self.year = builder.year
        self.km = builder.km
        self.fuel = builder.fuel
    }
    
    static func newCar() -> Builder {
        return Builder()
    }
 
    final class Builder {
        private(set) var brand: String = ""
        private(set) var model: String = ""
        private(set) var year: Int = 0
        private(set) var km: Int = 0
        private(set) var fuel: String = ""
        
        init() {}
        
        func brand(_ name: String) -> Builder {
            self.brand = name
            return self
        }
        
        func model(_ name: String) -> Builder {
            self.model = name
            return self
        }
        
        func year(_ value: Int) -> Builder {
            self.year = value
            return self
        }
        
        func km(_ value: Int) -> Builder {
            self.km = value
            return self
        }
        
        func fuel(_ value: String) -> Builder {
            self.fuel = value
            return self
        }
        
        func build() -> Car {
            return Car(self)
        }
    }
}

let car = Car.newCar()
            .brand("BMW")
            .model("M3")
            .year(2018)
            .km(0)
            .fuel("diesel")
            .build()



