import Foundation

protocol Command {
    func execute()
}

class Light{
    private var on = false
    
    func switchOn(){
        on = true
        print("ON")
    }
    func switchOff(){
        on = false
        print("OFF")
    }
}

class TurnOnCommand: Command {
    var light: Light!
    
    init(_ light: Light) {
        self.light = light
    }
    
    func execute() {
        light.switchOn()
    }
}

class TurnOffCommand: Command {
    var light: Light!
    
    init(_ light: Light) {
        self.light = light
    }
    
    func execute() {
        light.switchOff()
    }
}

class RemoteControl {
    var command: Command!
    
    func pressButton() {
        command.execute()
    }
}

let control = RemoteControl()
let light = Light()

let TurnOn = TurnOnCommand(light)
let TurnOff = TurnOffCommand(light)

control.command = TurnOn
control.pressButton()

control.command = TurnOff
control.pressButton()

