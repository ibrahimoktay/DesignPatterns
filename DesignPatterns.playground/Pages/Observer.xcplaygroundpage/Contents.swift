import Foundation

protocol Observable {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notify()
}

protocol Observer {
    func follow(_ observable: Observable)
    func unfollow(_ observable: Observable)
    func update()
}

class Celebrity: Observable {
    var observers: [Observer]!
    
    init() {
        self.observers = []
    }
    
    func attach(observer: Observer) {
        observers.append(observer)
    }
    
    func detach(observer: Observer) {
    }
    
    func notify() {
        for observer in observers {
            observer.update()
        }
    }
}

class Follower: Observer {
    
    var name: String
    init(_ name: String) {
        self.name = name
    }
    
    func follow(_ observable: Observable) {
        observable.attach(observer: self)
    }
    
    func unfollow(_ observable: Observable) {
        observable.detach(observer: self)
    }
    
    func update() {
        print("Celebrity Update For \(name)")
    }
}

let someCelebrity = Celebrity()

let followerX = Follower("XXX")
followerX.follow(someCelebrity)

let followerY = Follower("YYY")
followerY.follow(someCelebrity)

let followerZ = Follower("ZZZ")
followerZ.follow(someCelebrity)

someCelebrity.notify()




