import Foundation

protocol Payment {
    func pay()
}

class EFT: Payment {
    func pay() {
        print("Payment method Cash")
    }
}

class CreditCard: Payment {
    func pay() {
        print("Payment method CreditCard")
    }
}

class Coin: Payment {
    func pay() {
        print("Payment method Coin")
    }
}

class PaymentOperation {
    private var paymentType: Payment
    
    init(_ value: Payment) {
        self.paymentType = value
    }
    
    func makePayment() {
        paymentType.pay()
    }
}

let debt = 100

var paymentOp: PaymentOperation!

if debt < 1000 {
    paymentOp = PaymentOperation(CreditCard())
} else if debt < 100000 {
    paymentOp = PaymentOperation(EFT())
} else if debt >= 100000 {
    paymentOp = PaymentOperation(Coin())
}

paymentOp.makePayment()




