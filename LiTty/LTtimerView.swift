//
//  LTtimerView.swift
//  LiTty
//
//  Created by 土田妃華 on 2021/09/04.
//
//

import SwiftUI

struct LTtimerView: View {
    @EnvironmentObject var countTimer : CountTimer

    var body: some View {
        NavigationView{
            VStack(alignment: .leading ) {
                Circle()
                        .stroke(lineWidth: 20)
                        .fill(Color.blue)
                        .frame(width: 250, height: 200, alignment: .topLeading)
                        .overlay(
                                Text("\(String(self.countTimer.count / 60)):\(String(self.countTimer.count % 60))")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                        )

                Button("Stop Timer"){self.countTimer.stop()}
                Button("Start up Timer"){self.countTimer.countUp()}
                Button("Start down Timer"){self.countTimer.countDown(startCount: 60)}
            }.frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationBarTitle("LT Timer")
        }
    }
}

struct LTtimerView_Previews: PreviewProvider {
    static var previews: some View {
        LTtimerView()
    }
}
