//
//  CancellableDelayTask.swift
//  AutoForce
//
//  Created by Apple2 on 20/08/19.
//  Copyright © 2019 Apple2. All rights reserved.
//

import Foundation
class CancellableDelayedTask {
    var cancelled = false
    func run(delay: Double, task: @escaping () -> Void ) {
        let time = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            //dispatch_time(dispatch_time_t(DispatchTime.now()), Int64(delay))
//        DispatchQueue.main.asyncAfter(
//            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
        DispatchQueue.main.asyncAfter(deadline: time) {
            if !self.cancelled {
                task()
            }
        }
    }
    func cancel() {
        cancelled = true
    }
}


//func delay(_ delay:Double, closure:@escaping ()->()) {
//    DispatchQueue.main.asyncAfter(
//        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
//}
