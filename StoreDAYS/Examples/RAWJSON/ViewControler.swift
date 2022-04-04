//
//  ViewControler.swift
//  StoreDAYS
//
//  Created by admin on 4/1/22.
//

import SwiftUI

struct ViewControler: View {
    var body: some View {
        VStack{
        Button("PUT",action: putMethod)
                .padding()
        Button("GET",action: getMethod)
                .padding()
        Button("PUST",action: postMethod)
                .padding()
        Button("DELETE",action: deleteMethod)
                .padding()
    }
}
}

struct ViewControler_Previews: PreviewProvider {
    static var previews: some View {
        ViewControler()
    }
}
