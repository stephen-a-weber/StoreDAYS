//
//  PayTabView.swift
//  StoreDAYS
//
//  Created by Young Ju on 4/4/22.
//

import SwiftUI

struct PayTabView: View {
      private enum Tabs {
        case tracker, refund, claim
      }
      
      @State private var selectedTab: Tabs = .tracker

    var body: some View {
          TabView(selection: $selectedTab) {
            Group {
              tracker
              refund
              claims
            }
            .accentColor(.primary)
          }
          .accentColor(.cyan)
//          .edgesIgnoringSafeArea(edges)
          .statusBar(hidden: selectedTab == .tracker)
        }
      }
private extension PayTabView {

      var tracker: some View {
            T2View()
//          .tag(Tabs.tracker)
                  .tabItem {
                        Label("Delivery Tracking", systemImage: "point.topleft.down.curvedto.point.filled.bottomright.up")
//      UIApplicationShortcutIcon.IconType.markLocation
                  }
//                  .tabItem(image: "", text: "Delivery Tracking")
//          .onAppear { UITableView.appearance().separatorStyle = .none }
      }

      var refund: some View {
            T2View()
//          .tag(Tabs.refund)
          .tabItem {
                Label("Refund", systemImage: "arrow.left.arrow.right.square.fill")
          }
      }

      var claims: some View {
            T2View()
//          .tag(Tabs.claims)
          .tabItem {
                Label("Claims", systemImage: "square.and.pencil")
          }
      }
}
struct PayTabView_Previews: PreviewProvider {
    static var previews: some View {
        PayTabView()
    }
}
