//
//  BarangStruct.swift
//  AdminLaskarSampah
//
//  Created by margono on 12/10/18.
//  Copyright © 2018 Egi Muhamad Saefulhaqi. All rights reserved.
//

import Foundation

struct BarangStruct : Codable {
    
    var jenis : String?
    var berat : Float
    var harga : Double
    
    init() {
        self.jenis = String()
        self.berat = Float()
        self.harga = Double()
    }
    
    init(jenis : String, berat : Float, harga : Double) {
        self.jenis = jenis
        self.berat = berat
        self.harga = harga
    }
}
