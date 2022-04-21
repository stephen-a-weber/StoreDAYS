//
//  OrderCompletionMessage.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/20/22.
//

import SwiftUI

struct OrderCompletionMessage: View {
  var body: some View {
    Text("Your order has been processed successfully!")
      .font(.system(size: 24))
      .bold()
      .kerning(2)
  }
}
