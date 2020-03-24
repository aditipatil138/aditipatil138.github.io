//
//  ContentView.swift
//  Question 4 SwiftUI
//
//  Created by CSUFTitan on 3/23/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount=0
      var body: some View{
       Button(action: { self.tapCount += 1}) {
         Text("Tap count: \(self.tapCount)")
           .padding()
           .frame(width: 500, height: 500)
           .background(Color.blue)
           .foregroundColor(.white)
           .multilineTextAlignment(.center)
}
}
}


