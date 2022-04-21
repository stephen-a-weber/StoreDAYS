//
//  SwiftUIView.swift
//  StoreDAYS
//
//  Created by admin on 4/7/22.
//

import SwiftUI
struct ContentView: View {
    
    @State var showMenu = false
    @ObservedObject var data : Data

    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    tabs(showMenu: self.$showMenu, data:data)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    
                    if self.showMenu {
                        AccountTab(data:data)
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                    .gesture(drag)
            }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
            
        }
        
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        

    }
}

struct tabs: View {
    @Binding var showMenu: Bool
    @ObservedObject var data : Data
@State private var selectTab="APIVIEW"
    var body: some View {
        TabView (selection:$selectTab){
            
            SwiftUIAPIView(data:data).tabItem {
                Label("animals",systemImage:"pawprint.fill")
            }.tag("APIVIEW")
                   
            Tracking(data:data)
                .tabItem{
                    Label("Locations", systemImage:"globe.americas.fill")
                }.tag("Tracking")
            
            CartView(data: data)
                .tabItem{
                   Label("Cart",systemImage:"cart.fill")
                       
                       }
                .tag("Cart")
                
               }
               }
    
}


struct tabs_Previews: PreviewProvider {
    static var previews: some View {
ContentView(data: Data())    }
}
