import Foundation

protocol View {
    func draw()
}

class Label: View {
    
    func draw() {
        print("label\n")
    }
}

class Button: View {
    
    func draw() {
        print("button\n")
    }
}

class ViewDecorator: View {
    let view: View!
    
    init(_ view: View) {
        self.view = view
    }
    
    func draw() {
        view.draw()
        print("Super drawing...")
//        print("New functionality added...")
    }
}

class ShadowDecorator: ViewDecorator {
    
    override init(_ view: View) {
        super.init(view)
    }
    
    override func draw() {
        super.draw()
        print("Shadow drawing...\n")
    }
}

let label = Label()
label.draw()

let shadowLabel = ShadowDecorator(Label())
shadowLabel.draw()

let btn = Button()
btn.draw()

let shadowBtn = ViewDecorator(Button())
shadowBtn.draw()


