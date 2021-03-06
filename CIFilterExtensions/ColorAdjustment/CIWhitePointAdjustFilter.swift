//
//  CIWhitePointAdjustFilter.swift
//  Demo
//
//  Created by Silence on 2017/5/25.
//  Copyright © 2017年 Silence. All rights reserved.
//

import CoreImage

public class CIWhitePointAdjustFilter {
    
    public var image: CIImage
    public var color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    public init(image: CIImage, color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)){
        self.image = image
        self.color = color
    }
    
    public func filter() -> CIFilter? {
        guard let filter = CIFilter(name: "CIWhitePointAdjust") else { return nil }
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(color, forKey: "inputColor")
        return filter
    }
    
}

extension CIImage {
    
    public func whitePointAdjustFilter(color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) -> CIImage? {
        guard let filter = CIFilter(name: "CIWhitePointAdjust") else { return nil }
        filter.setValue(self, forKey: "inputImage")
        filter.setValue(color, forKey: "inputColor")
        return filter.outputImage
    }
    
}

