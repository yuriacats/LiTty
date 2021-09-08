//
// Created by 土田妃華 on 2021/09/04.
//

import SwiftUI
import Combine
import AVFoundation

class CountTimer : ObservableObject {
    @Published var timer : Timer!
    @Published var count = 0
    @Published var overCount = 0
    @Published var stopping_mode = 0
    private let XSound = try! AVAudioPlayer(data:NSDataAsset(name:"horagai")!.data)

    private func playSound(){
        XSound.stop()
        XSound.currentTime = 0.0
        XSound.play()
    }
    func countUp(){
        stopping_mode = 1
        timer?.invalidate()
        count = 0
        timer = Timer.scheduledTimer(withTimeInterval:1 , repeats: true){
            _ in
            self.count += 1
        }
    }
    func countDown(startCount: Int){
        stopping_mode = -1
        count = startCount
        timer?.invalidate()
        overCount = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if(self.count > 0) {
                self.count = self.count - 1
            }else if(self.count == 0 && self.stopping_mode == -1){
                self.playSound()
                self.stopping_mode = 0
            }else{
                self.overCount += 1
            }
        }
    }

    func stop(){
        stopping_mode = stopping_mode * 2
       if timer != nil{
           timer.invalidate()
       }
    }

    func stopOrRestart(){
        if stopping_mode == 0{
            countUp()
        } else if  stopping_mode < 2 && stopping_mode > -2{
            timer.invalidate()
           stopping_mode = stopping_mode * 2
            print(stopping_mode)
        }else if stopping_mode == 2 {
            stopping_mode = stopping_mode / 2
            timer = Timer.scheduledTimer(withTimeInterval:1 , repeats: true){
                _ in
                self.count += 1
            }
            print(stopping_mode)
        }else if stopping_mode == -2{
            stopping_mode = stopping_mode / 2
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if(self.count > 0){
                    self.count = self.count - 1
                }else{
                    self.overCount += 1
                }
            }
            print(stopping_mode)
        }
    }
}