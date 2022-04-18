    //
    //  StoreSplashPage.swift
    //  StoreDAYS
    //
    //  Created by stephen weber on 3/29/22.
    //

import SwiftUI

struct StoreSplashPage: View {
    @AppStorage("OH") var OH = true
    
    /// using appStorage for using a unique transitioning between splashscreen and store (tabbedMainView)
    /// 
    
    
    
    
        ///// the data variable is not used currently on this page. The boolean enterStore is the required MVC bit to make a state
        ///transition to another view.. the .onTapGesture can toggle this variable. and the NavigationLink is waiting around
        ///to change to another view if enterStore is changed.
    var body: some View {
            //        NavigationView {
        
            ///// THIS PAGE DOES NOTHING BUT PRESENTS A STARTING PAGE FOR THE APP
            ////MANY PEOPLE THINK IT IS A DOG HANGINGOUT IN THE DARKNESS OF A BIG CITY
            ///IT ACTUALLY IS A DOG IN FRONT OF A CHRISTMAS TREE
            ///
        
           
        Image("pet-image")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)
        ////////Custom Transition
            .transition(.door)
            //door is a modified transition. File is slidingDoor for viewmodifier
        
            /////IF YOU TAP ANYWHERE ON THE SCREEN IT TAKES YOU to the destination : TABBEDMAINVIEW()
            ///
        
            .onTapGesture(count: 1, perform: {withAnimation(.easeIn(duration:2)){
                OH.toggle()
                
            }})
            .ignoresSafeArea()
        
        
        
    }
    
    
}


struct StoreSplashPage_Previews: PreviewProvider {
   
    static var previews: some View {
        StoreSplashPage()
    }
}
