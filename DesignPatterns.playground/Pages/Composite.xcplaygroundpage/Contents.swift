import Foundation

protocol View {
    func draw()
}

class ViewGroup: View {
    private var views: [View]!

    init() {
        self.views = []
    }

    func add(_ view: View) {
        views.append(view)
    }
    
    func draw() {
        for view in views {
            view.draw()
        }
    }
}

class Label: View {
    var text: String!
    init(_ value: String) { self.text = value }
    
    func draw() {
        print(text)
    }
}

class Button: View {
    var text: String!
    init(_ value: String) { self.text = value }
    
    func draw() {
        print(text)
    }
}

let label1 = Label("label 1")
let label2 = Label("label 2")
let label3 = Label("label 3")

let viewGroup1 = ViewGroup()
viewGroup1.add(label1)
viewGroup1.add(label2)
viewGroup1.add(label3)

let button1 = Button("Button 1")
let button2 = Button("Button 2")

let viewGroup2 = ViewGroup()
viewGroup2.add(button1)
viewGroup2.add(button2)

let topView = ViewGroup()
topView.add(viewGroup1)
topView.add(viewGroup2)
topView.draw()





