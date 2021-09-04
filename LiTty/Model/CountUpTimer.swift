//
// Created by 土田妃華 on 2021/09/04.
//

import SwiftUI
import Combine

class CountUpTimer : ObservableObject {
    @Published var timer : Timer!
    @Published var count = 0

    func start(){
        self.timer?.invalidate()
        self.count = 0
        self.timer = Timer.scheduledTimer(withTimeInterval:0.01 , repeats: true){
            _ in
            self.count += 1
        }
    }
}