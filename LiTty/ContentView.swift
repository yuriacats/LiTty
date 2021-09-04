//
//  ContentView.swift
//  LiTty
//
//  Created by 土田妃華 on 2021/09/02.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(conferencesData){ conference in
                NavigationLink(destination: ConferenceDetails(conferences: conference)){
                    VStack(alignment: .leading){
                        Text(conference.name).font(.headline)
                        Text(conference.location).font(.subheadline)
                    }
                }
            }.navigationBarTitle("FirstApplication")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
