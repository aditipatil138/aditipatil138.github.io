//
//  ContentView.swift
//  Question 3 SwiftUI
//
//  Created by CSUFTitan on 3/23/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        NavigationView {
            Form{
                Section{
                    Text("Hello World!");
                    Text("Hello World!")
                }
                Section{
                    Text("Hello World!")
                }.navigationBarTitle("SwiftUI")
            }
        }
}
}
