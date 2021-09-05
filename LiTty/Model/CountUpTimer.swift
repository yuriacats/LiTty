//
// Created by 土田妃華 on 2021/09/04.
//

import SwiftUI
import Combine

class CountTimer : ObservableObject {
    @Published var timer : Timer!
    @Published var count = 0
    @Published var overCount = 0
    @Published var stopping_mode = 0

    func countUp(){
        self.stopping_mode = 1
        self.timer?.invalidate()
        self.count = 0
        self.timer = Timer.scheduledTimer(withTimeInterval:1 , repeats: true){
            _ in
            self.count += 1
        }
    }
    func countDown(startCount: Int){
        self.stopping_mode = -1
        self.count = startCount
        self.timer?.invalidate()
        self.overCount = 0
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if(self.count > 0){
                self.count = self.count - 1
            }else{
                self.overCount += 1
            }
        }
    }

    func stop(){
        self.stopping_mode = self.stopping_mode * 2
       if timer != nil{
           timer.invalidate()
       }
    }

    func stopOrRestart(){
        if stopping_mode == 0{
            countUp()
        } else if  stopping_mode < 2 && stopping_mode > -2{
            timer.invalidate()
            self.stopping_mode = self.stopping_mode * 2
            print(self.stopping_mode)
        }else if stopping_mode == 2 {
            self.stopping_mode = self.stopping_mode / 2
            self.timer = Timer.scheduledTimer(withTimeInterval:1 , repeats: true){
                _ in
                self.count += 1
            }
            print(self.stopping_mode)
        }else if stopping_mode == -2{
            self.stopping_mode = self.stopping_mode / 2
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if(self.count > 0){
                    self.count = self.count - 1
                }else{
                    self.overCount += 1
                }
            }
            print(self.stopping_mode)
        }
    }
}