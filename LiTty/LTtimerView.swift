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
    @State var selectedMaxTime : Int = 10

    var body: some View {
        NavigationView {
        VStack{
            VStack(alignment: .center) {
                Button(action: { countTimer.stopOrRestart() }) {
                    Circle()
                            .stroke(lineWidth: 20)
                            .fill(countTimer.nowColor)
                            .frame(width: 250, height: 200, alignment: .topLeading)
                            .overlay(
                                    Text("\(String(countTimer.count / 60)):\(String(format: "%02d", countTimer.count % 60))")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .foregroundColor( countTimer.nowColor)
                            )
                }
            }.padding()
            VStack(alignment: .leading) {
                List {
                    //Button(action: { countTimer.stop() }) {
                    //    Text("Stop")
                    //}
                    //Button(action: { countTimer.countUp() }) {
                    //    Text("CountUP")
                    //}
                    Button(action: { countTimer.countDown(startCount: 30) }) {
                        Text("30 sec")
                    }
                    Button(action: { countTimer.countDown(startCount: 60) }) {
                        Text("1 min")
                    }
                    Button(action: { countTimer.countDown(startCount: 180) }) {
                        Text("3 min")
                    }
                    Button(action: { countTimer.countDown(startCount: 300) }) {
                        Text("5 min")
                    }
                    Button(action: { countTimer.countDown(startCount: 420) }) {
                        Text("7 min")
                    }
                    Button(action: { countTimer.countDown(startCount: (selectedMaxTime*60) )}){
                        Stepper(value: $selectedMaxTime, in: 0...100){
                            Text("\(selectedMaxTime) min")
                        }
                    }
                }
            }
        }
            .frame(minWidth:0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity, alignment: .top)
            .navigationBarTitle("LT Timer")
        }
    }
}

struct LTtimerView_Previews: PreviewProvider {
    static var previews: some View {
        LTtimerView()
    }
}
