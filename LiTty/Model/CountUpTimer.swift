//
// Created by 土田妃華 on 2021/09/04.
//

import SwiftUI
import Combine

class CountTimer : ObservableObject {
    @Published var timer : Timer!
    @Published var count = 0
    @Published var overCount = 0

    func countUp(){
        self.timer?.invalidate()
        self.count = 0
        self.timer = Timer.scheduledTimer(withTimeInterval:1 , repeats: true){
            _ in
            self.count += 1
        }
    }
    func countDown(startCount: Int){
        self.count = startCount
        self.timer?.invalidate()
        self.overCount = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            _ in
            if(self.count > 0){
                self.count = self.count - 1
            }else{
                self.overCount += 1
            }
        }
    }

    func stop(){
       if timer != nil{
           timer.invalidate()
       }
    }
}