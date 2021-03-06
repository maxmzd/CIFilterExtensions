//
//  CIEdgeWorkFilter.swift
//  Demo
//
//  Created by Silence on 2017/5/26.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class EdgeWork {
    
    public var image: CIImage
    public var radius: NSNumber = 3
    
    public init(image: CIImage, radius: NSNumber = 3){
        self.image = image
        self.radius = radius
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIEdgeWork") else { return nil }
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(radius, forKey: "inputRadius")
        return filter
    }
    
}

extension CIImage {
    
    public func edgeWorkFilter(radius: NSNumber = 3) -> CIImage? {
        guard let filter = CIFilter(name: "CIEdgeWork") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(radius, forKey: "inputRadius")
        return filter.outputImage
    }
    
}

