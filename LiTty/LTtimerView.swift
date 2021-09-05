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
                Button(action: {self.countTimer.stopOrRestart()}){
                Circle()
                        .stroke(lineWidth: 20)
                        .fill(Color.blue)
                        .frame(width: 250, height: 200, alignment: .topLeading)
                        .overlay(
                                Text("\(String(self.countTimer.count / 60)):\(String(format:"%02d",self.countTimer.count % 60))")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                        )
                }
                Button(action:{self.countTimer.stop()}){
                Text("Stop")
                }
                Button(action:{self.countTimer.countUp()}){
                    Text("CountUP")
                }
                Button(action:{self.countTimer.countDown(startCount: 30)}){
                    Text("30 sec")
                }
                Button(action:{self.countTimer.countDown(startCount: 60)}){
                    Text("1 min")
                }
                Button(action:{self.countTimer.countDown(startCount: 180)}){
                    Text("3 min")
                }
                Button(action:{self.countTimer.countDown(startCount: 300)}){
                    Text("5 min")
                }
                Button(action:{self.countTimer.countDown(startCount: 420)}){
                    Text("7 min")
                }
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
