//: [Previous](@previous)
/*:
 ***
 **Dependency Inversion Principle (ISP)**: It states that:\
 High-level modules should not depend on low-level modules. Both should depend on abstractions.\
 Abstractions should not depend on details. Details should depend on abstractions.

 ***
 */
import Foundation
// Violation of DIP
struct DebitCardPayment {
    func pay(_ amount: Double) { }
}

struct CreditCardPayment {
    func pay(_ amount: Double) { }
}

struct ApplePayPayment {
    func pay(_ amount: Double) { }
}

struct Payment {
    var debitCardPaymentMethod: DebitCardPayment?
    var creditCardPaymentMethod: CreditCardPayment?
    var applePayPaymentMethod: ApplePayPayment?
    
    func makeDebitCardPayment(of amount: Double) {
        debitCardPaymentMethod?.pay(amount)
    }
    
    func makeCreditCardPayment(of amount: Double) {
        creditCardPaymentMethod?.pay(amount)
    }
    
    func makeApplePayPayment(of amount: Double) {
        applePayPaymentMethod?.pay(amount)
    }
}

let creditCardPaymentMethod = CreditCardPayment()
var payment = Payment()
payment.creditCardPaymentMethod = creditCardPaymentMethod
payment.makeCreditCardPayment(of: 500)

/*:
 **Problem**: The above example breaks DIP since there’s a lot of tight coupling and Payment class which is a high-level module is dependent on CreditCardPayment which is a low-level module. As per DIP, it should depend on abstraction/protocol. \
 **Solution**: We can introduce an abstraction (protocol) for payment.
 */

protocol PaymentMethod {
    func pay(_ amount: Double)
}

struct DebitCardPayment: PaymentMethod {
    func pay(_ amount: Double) { }
}

struct CreditCardPayment: PaymentMethod {
    func pay(_ amount: Double) { }
}

struct ApplePayPayment: PaymentMethod {
    func pay(_ amount: Double) { }
}

struct Payment {
    private let paymentMethod: PaymentMethod
    
    init(method: PaymentMethod) {
        paymentMethod = method
    }
    
    func makePayment(of amount: Double) {
        paymentMethod.pay(amount)
    }
}

let creditCardPaymentMethod = CreditCardPayment()

let payment = Payment(method: creditCardPaymentMethod)
payment.makePayment(of: 500)

//: [Next](@next)
