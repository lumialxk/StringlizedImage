//
//  CGSize+Util.swift
//  StringlizedImage
//
//  Created by 李现科 on 2017/6/17.
//  Copyright © 2017年 李现科. All rights reserved.
//

import UIKit

public extension CGSize {
    
    public enum ScaleOption {
        case width(CGFloat)
        case height(CGFloat)
    }
    
    /// 将CGSize等比缩放
    mutating func scale(option: ScaleOption) {
        switch option {
        case let .width(maxWidth):
            width = maxWidth
            height = maxWidth / width * height
        case let .height(maxHeight):
            height = maxHeight
            width = maxHeight / height * width
        }
    }
}
