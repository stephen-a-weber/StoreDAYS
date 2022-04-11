//
//  PaymentHandler.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/1/22.
//

// Note: The code below was adopted with needed modification from the sample code at https://developer.apple.com/documentation/passkit/apple_pay/offering_apple_pay_in_your_app .

import PassKit
import Foundation

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {

      var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler!

    static let supportedNetworks: [PKPaymentNetwork] = [
        .amex,
        .discover,
        .masterCard,
        .visa
    ]

//    class func applePayStatus() -> (canMakePayments: Bool, canSetupCards: Bool) {
//        return (PKPaymentAuthorizationController.canMakePayments(),
//                PKPaymentAuthorizationController.canMakePayments(usingNetworks: supportedNetworks))
//          let result = PaymentHandler.applePayStatus()
//          var button: UIButton?
//
//          if result.canMakePayments {
//              button = PKPaymentButton(paymentButtonType: .book, paymentButtonStyle: .black)
//              button?.addTarget(self, action: #selector(startPayment(total:completion:)), for: .touchUpInside)
//          } else if result.canSetupCards {
//              button = PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .black)
//              button?.addTarget(self, action: #selector(startPayment(total:completion:)), for: .touchUpInside)
//          }
//
////          if let applePayButton = button {
////              let constraints = [
////                  applePayButton.centerXAnchor.constraint(equalTo: applePayView.centerXAnchor),
////                  applePayButton.centerYAnchor.constraint(equalTo: applePayView.centerYAnchor)
////              ]
////              applePayButton.translatesAutoresizingMaskIntoConstraints = false
////              applePayView.addSubview(applePayButton)
////              NSLayoutConstraint.activate(constraints)
////          }
//    }
    
    // Define the shipping methods.
    func shippingMethodCalculator() -> [PKShippingMethod] {
        // Calculate the pickup date.
        
        let today = Date()
        let calendar = Calendar.current
        
        let shippingStart = calendar.date(byAdding: .day, value: 3, to: today)!
        let shippingEnd = calendar.date(byAdding: .day, value: 5, to: today)!
//         if let shippingEnd = shippingEnd, let shippingStart = shippingStart {
               let startComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStart)
               let endComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEnd)
         
               let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
               shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
               shippingDelivery.detail = "Pet sent to you address"
               shippingDelivery.identifier = "DELIVERY"
        
               let shippingCollection = PKShippingMethod(label: "Collection", amount: NSDecimalNumber(string: "0.00"))
               shippingCollection.detail = "Pick up your pet at the shelter in your area."
               shippingCollection.identifier = "COLLECTION"
        
               return [shippingDelivery]
//               return [shippingDelivery, shippingCollection]
//         }
//          return []
    }
    
      @objc func startPayment(total: Int,  completion: @escaping PaymentCompletionHandler) {
            //func startPayment(products: [Product], total: Int,  completion: @escaping PaymentCompletionHandler) {

        completionHandler = completion
        
        let orderAmt = PKPaymentSummaryItem(label: "Pet", amount: NSDecimalNumber(string: "9.99"), type: .final)
        let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: "1.00"), type: .final)
        let afterTaxAmt = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "10.99"), type: .final)
        paymentSummaryItems = [orderAmt, tax, afterTaxAmt]
        
        // Create a payment request.
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
//        paymentRequest.merchantIdentifier = Configuration.Merchant.identifier
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"
          paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
        paymentRequest.shippingType = .delivery
        paymentRequest.shippingMethods = shippingMethodCalculator()
        paymentRequest.requiredShippingContactFields = [.name, .postalAddress]
        
                // Present the payment sheet.
                paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
                paymentController?.delegate = self
                paymentController?.present(completion: { (presented: Bool) in
                    if presented {
                        debugPrint("Presented payment controller")
                    } else {
                        debugPrint("Failed to present payment controller")
                        self.completionHandler(false)
                    }
                })
            }
        }

// Set up PKPaymentAuthorizationControllerDelegate conformance.

extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {

    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        
        // Perform basic validation on the provided contact information.
          var errors = [Error]()
          var status = PKPaymentAuthorizationStatus.success
//          if payment.shippingContact?.postalAddress?.isoCountryCode != "US" {
//              let pickupError = PKPaymentRequest.paymentShippingAddressUnserviceableError(withLocalizedDescription: "Sample App only available in the United States")
//              let countryError = PKPaymentRequest.paymentShippingAddressInvalidError(withKey: CNPostalAddressCountryKey, localizedDescription: "Invalid country")
//              errors.append(pickupError)
//              errors.append(countryError)
//              status = .failure
//          } else {
//              // Send the payment token to your server or payment provider to process here.
//              // Once processed, return an appropriate status in the completion handler (success, failure, and so on).
//          }
         
        self.paymentStatus = status
        completion(PKPaymentAuthorizationResult(status: status, errors: errors))
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
          print("dismiss")
      // Dismiss the payment sheet
      controller.dismiss()  {
//          DispatchQueue.main.async {
//              if self.paymentStatus == .success {
//                  if let completionHandler = self.completionHandler {
//                      completionHandler(true)
//                  }
//              } else {
//                  if let completionHandler = self.completionHandler {
//                      completionHandler(false)
//                  }
//              }
//          }
      }
    }
 }
