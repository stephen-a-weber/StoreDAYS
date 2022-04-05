//
//  UserDefaultsExpander.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/1/22.
//

import Foundation
let defaults = UserDefaults.standard
func setKeysToUserDefaults() {
    defaults.set(0, forKey: "lastSelectedPaymentMethod")
    defaults.set("", forKey: "lastShippingAddress")
    defaults.set("", forKey: "lastBillingAddress")
    defaults.set(0, forKey: "lastSelectedPaymentMethod")
    defaults.set(0, forKey: "lastSelectedPaymentNetwork")
}
