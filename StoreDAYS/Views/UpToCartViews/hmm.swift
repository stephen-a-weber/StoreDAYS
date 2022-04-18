    //
    //  hmm.swift
    //  StoreDAYS
    //
    //  Created by stephen weber on 4/16/22.
    //

import SwiftUI

struct hmm: View {
   
    
    @AppStorage("OH") var OH = true
    var body: some View {
        Group {
            //Color.blue.zIndex(-1)
            if OH {
                StoreSplashPage()
                     
            }
            else {
                TabbedMainView()
                   
                    
                
            }
        }
        .ignoresSafeArea()
      
        
        
        
    }
       
        
  
    
    
}

struct hmm_Previews: PreviewProvider {
    static var previews: some View {
        hmm()
           
    }
       
}
