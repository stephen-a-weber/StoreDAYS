//
//  OrderCompletionMessage.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/20/22.
//

import SwiftUI

struct OrderCompletionMessage: View {
  var body: some View {
    Text("Thanks for your purchase! You'll get your pet soon! You'll also receive an email confirmation shortly.")
      .font(.system(size: 24))
      .bold()
      .kerning(2)
  }
}
