    //
    //  hmm.swift
    //  StoreDAYS
    //
    //  Created by stephen weber on 4/16/22.
    //

import SwiftUI

struct hmm: View {
    @ObservedObject var data : Data
    
    @AppStorage("OH") var OH = true
    var body: some View {
        Group {
            //Color.blue.zIndex(-1)
            if OH {
                StoreSplashPage(data:data)
                     
            }
            else {
                TabbedMainView(data:data)
                   
                    
                
            }
        }
        .ignoresSafeArea()
      
        
        
        
    }
        
  
    
    
}

struct hmm_Previews: PreviewProvider {
    static var previews: some View {
        hmm(data:Data())
    }
}
