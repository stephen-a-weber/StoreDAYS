//
//  VideoArkOfSuffering.swift
//  StoreDAYS
//
//  Created by David Gonzalez on 4/5/22.
//

import SwiftUI
import AVKit
struct VideoArkOfSuffering: View {
    @State var animFlag = false
    var myColor = "myBlue"
    var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"

    var body: some View {
        TabView {
            
        
        ZStack{
           // Color("myBlue")
            // MARK: BUTTONS
            
            Button(action: {
            }) {
                Text("CONTINUE")
                    .fontWeight(.bold)
                    .foregroundColor(Color(myColor))
                    .frame( maxWidth: 350, maxHeight: 800, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18 ))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color(myColor),
                                                                        lineWidth: 3.0).shadow(color: .blue, radius: 6.0))
                
                    .sheet(isPresented: $animFlag, content: {
                        PayTabView()
                    })
            }
            .padding(.bottom, 5.0)
            VStack{
             
                // Video Information
                Text("Rescue the animals").foregroundColor(Color(myColor))
                ScrollView{
                  
                    // modules
                    video(url: url).frame(width: 350, height: 300)
                    
                    Image("saveAnimals").resizable().frame(width: 300, height: 300, alignment: .center)
                    
                    
                    
                }.frame(width: 200, alignment: .center)
                
                
            }
            
        }
        } //end tab
        
    }
}


struct video:View{
    var url: String
    var body: some View{
        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "coolAnimals", withExtension: "mp4")!)).padding(.vertical, 50.0).ignoresSafeArea()
    }
}


struct VideoArkOfSuffering_Previews: PreviewProvider {
    static var previews: some View {
        VideoArkOfSuffering()
    }
}
