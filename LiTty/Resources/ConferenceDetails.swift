//
//  ConferenceDetails.swift
//  LiTty
//
//  Created by 土田妃華 on 2021/09/02.
//
//

import SwiftUI
import Foundation

struct ConferenceDetails: View {
    var conferences: Conference
    @State var text = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(conferences.location).padding(.bottom)
            Text(conferences.textDates()).padding(.bottom)
            LinkButton(link: conferences.link).padding(.bottom)
            TextEditor(text: $text).padding(.bottom)
        }.frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .navigationBarTitle(conferences.name)
    }
}

struct  LinkButton : View{
    var link = ""
    var body: some View{
        Button(action:{
          UIApplication.shared.open(URL(string: self.link)!)
        } ) {
            Text("Go to official website")
        }
    }
}

struct ConferenceDetails_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceDetails(conferences:Conference() )
    }

}
