import Foundation

class Singleton {
    private static let instance: Singleton = {
        let obj = Singleton()
        return obj
    }()
    var count = 0
    
    private init(){}
    
    static func getInstance() -> Singleton {
        instance.count += 1
        return self.instance
    }
}

// Or more modern implementation

class ModernSingleton {
    static let instance: ModernSingleton = ModernSingleton()
    private init(){}
}


Singleton.getInstance().count
Singleton.getInstance().count
Singleton.getInstance().count

//Singleton.instance.count

