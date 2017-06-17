//
//  LXKImageLogger.swift
//  StringlizedImage
//
//  Created by 李现科 on 2017/6/17.
//  Copyright © 2017年 李现科. All rights reserved.
//

import UIKit

public protocol ImageConvertible {
    var convertedImage: UIImage? { get }
}

@discardableResult
public func imageLog(_ image: ImageConvertible, scale: CGSize.ScaleOption = .width(140)) -> String? {
    guard let image = image.convertedImage else {
        print("error: can't convert to image")
        return nil
    }
    var targetSize = image.size
    targetSize.scale(option: scale)
    return imageLog(image, size: targetSize)
}

@discardableResult
public func imageLog(_ image: ImageConvertible, size: CGSize) -> String? {
    guard let image = image.convertedImage else {
        print("error: can't convert to image")
        return nil
    }
    let scaledImage = image.imageConstrainedToMaxSize(size)
    let palette = AsciiPalette(font: UIFont.systemFont(ofSize: 14))
    let asciiArtist = AsciiArtist(scaledImage, palette)
    let stringlizedImage = asciiArtist.createAsciiArt()
    print(stringlizedImage)
    return stringlizedImage
}

extension UIImage: ImageConvertible {
    public var convertedImage: UIImage? {
        get {
            return self
        }
    }
}

extension CGImage: ImageConvertible {
    public var convertedImage: UIImage? {
        get {
            return UIImage(cgImage: self)
        }
    }
}

extension Data: ImageConvertible {
    public var convertedImage: UIImage? {
        get {
            return UIImage(data: self)
        }
    }
}

extension CIImage: ImageConvertible {
    public var convertedImage: UIImage? {
        get {
            return UIImage(ciImage: self)
        }
    }
}
