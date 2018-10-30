//
//  FunctionHelper.swift
//  AdminLaskarSampah
//
//  Created by margono on 13/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import Foundation

class FunctionHelper {
    
    static let shared = FunctionHelper()
    
    private init(){}
    
    func randomDouble(min: Double, max: Double) -> Double {
        let number = (Double(arc4random()) / 0xFFFFFFFF) * (max - min) + min
        
        return round(number * self.getMultipler()) / self.getMultipler()
    }
    
    func randomFloat(min: Float, max: Float) -> Float {
        let number = (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
        let multiple = Float(self.getMultipler())
        
        return round(number * multiple) / multiple
    }
    
    private func getMultipler() -> Double {
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        return multiplier
    }
}
