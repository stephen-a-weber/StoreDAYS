//
//  PaymentCardSetupButton.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/1/22.
//

    import SwiftUI
    import PassKit

    struct PaymentCardSetupButton: View {
      var action: () -> Void

        var body: some View {
            Representable(action: action)
                .frame(minWidth: 100, maxWidth: 400)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
        }
    }

    struct PaymentCardSetupButton_Previews: PreviewProvider {
        static var previews: some View {
            PaymentCardSetupButton(action:{})
        }
    }

//func enterCardInfo()  -> Void {
//    if let window = UIApplication.shared.UIWindowScene.windows.first {
//        window.rootViewController = UIHostingController(rootView: SetupCard())
//        window.makeKeyAndVisible()
//    }
//}

    extension PaymentCardSetupButton {
        struct Representable: UIViewRepresentable {
            var action: () -> Void
            
            func makeCoordinator() -> Coordinator {
                Coordinator(action: action)
            }
            
            func makeUIView(context: Context) -> UIView {
                context.coordinator.button
            }
            
            func updateUIView(_ rootView: UIView, context: Context) {
                context.coordinator.action = action
            }
        }
        
        class Coordinator: NSObject {
            var action: () -> Void
            var button = PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .whiteOutline)
            
            init(action: @escaping () -> Void) {
                self.action = action
                super.init()

                button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
            }
            
            @objc
            func callback(_ sender: Any) {
                action()
            }
        }
    }
