//: [Previous](@previous)
/*:
 ***
 **Dependency Inversion Principle (ISP)**: It states that:\
 High-level modules should not depend on low-level modules. Both should depend on abstractions.\
 Abstractions should not depend on details. Details should depend on abstractions.

 ***
 */
import Foundation
import XCTest
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

struct DebitCardPayment1: PaymentMethod {
    func pay(_ amount: Double) { }
}

struct CreditCardPayment1: PaymentMethod {
    func pay(_ amount: Double) { }
}

struct ApplePayPayment1: PaymentMethod {
    func pay(_ amount: Double) { }
}

struct Payment1 {
    private let paymentMethod: PaymentMethod
    
    init(method: PaymentMethod) {
        paymentMethod = method
    }
    
    func makePayment(of amount: Double) {
        paymentMethod.pay(amount)
    }
}

let creditCardPaymentMethod1 = CreditCardPayment1()

let payment1 = Payment1(method: creditCardPaymentMethod1)
payment1.makePayment(of: 500)


// MARK: - Test Case for Payment Class


class MockPaymentMethod: PaymentMethod {
    var wasCalled = false
    var paidAmount: Double?

    func pay(_ amount: Double) {
        paidAmount = amount
        wasCalled = true
    }

//    func pay(_ amount: Double) {
//        wasCalled = true
//        paidAmount = amount
//    }
}


class PaymentTests: XCTestCase {
    func testMakePaymentWithMockPaymentMethod() {
        // Arrange: Create a mock payment method
        let mockPaymentMethod = MockPaymentMethod()
        
        // Create an instance of Payment using the mock payment method
        let payment = Payment1(method: mockPaymentMethod)
        
        // Act: Make a payment
        let amount = 500.0
        payment.makePayment(of: amount)
        
        // Assert: Verify that the mock method's `pay` function was called and the correct amount was passed
        XCTAssertTrue(mockPaymentMethod.wasCalled, "The pay method should have been called.")
        XCTAssertEqual(mockPaymentMethod.paidAmount, amount, "The paid amount should be \(amount).")
    }
}

// MARK: - Run Test Case

PaymentTests.defaultTestSuite.run()

/*:
 Issue:\
 This setup violates DIP because NotificationManager is tightly coupled to EmailService. If we want to introduce another notification method, like SMS, we’ll have to modify the NotificationManager class, which breaks the principle.
 */
class EmailService {
    func sendEmail(message: String) {
        print("Sending email: \(message)")
    }
}

class NotificationManager {
    let emailService = EmailService()
    
    func sendNotification(message: String) {
        emailService.sendEmail(message: message)
    }
}

/*:
 Solution:\
 Now, NotificationManager depends on an abstraction (NotificationService) rather than a concrete class (EmailService). This allows for flexibility in switching between notification services without modifying the NotificationManager.
 */
protocol NotificationService {
    func sendNotification(message: String)
}

class EmailService1: NotificationService {
    func sendNotification(message: String) {
        print("Sending email: \(message)")
    }
}

class SMSService: NotificationService {
    func sendNotification(message: String) {
        print("Sending SMS: \(message)")
    }
}

class NotificationManager1 {
    let notificationService: NotificationService
    
    init(service: NotificationService) {
        self.notificationService = service
    }
    
    func notify(message: String) {
        notificationService.sendNotification(message: message)
    }
}

// Usage
let emailService = EmailService1()
let smsService = SMSService()

let emailNotificationManager = NotificationManager1(service: emailService)
emailNotificationManager.notify(message: "You've got mail!")

let smsNotificationManager = NotificationManager1(service: smsService)
smsNotificationManager.notify(message: "You've got a text!")

//: [Next](@next)
