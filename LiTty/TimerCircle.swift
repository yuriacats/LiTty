//
// Created by 土田妃華 on 2021/09/04.
//
import UIKit

class TimerCircle: CAShapeLayer {
    public init(strokeColor: UIColor, lineWidth:CGFloat){
        super.init()

        self.strokeColor = strokeColor.cgColor
        self.lineWidth = lineWidth
        self.fillColor = UIColor.clear.cgColor
        self.lineCap = .round
    }

    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
