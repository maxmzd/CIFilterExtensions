//
//  CIHoleDistortionFilter.swift
//  Demo
//
//  Created by Silence on 2017/5/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

open class CIHoleDistortionFilter {
    
    public var image: CIImage
    public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
    public var radius: NSNumber = 150
    
    public init(image: CIImage,
                center: CIVector = CIVector(values: [150.0, 150.0], count: 2),
                radius: NSNumber = 150){
        self.image = image
        self.center = center
        self.radius = radius
    }
    
    open func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIHoleDistortion") else { return nil }
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(radius, forKey: "inputRadius")
        return filter
    }
    
}

extension CIImage {
    
    public func holeDistortionFilter(center: CIVector = CIVector(values: [150.0, 150.0], count: 2),
                                     radius: NSNumber = 150) -> CIImage? {
        guard let filter = CIFilter(name: "CIHoleDistortion") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(center, forKey: "inputCenter")
        filter.setValue(radius, forKey: "inputRadius")
        return filter.outputImage
    }
    
}

