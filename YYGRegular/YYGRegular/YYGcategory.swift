//
//  YYGcategory.swift
//  Ecshop
//
//  Created by 区块国际－yin on 16/10/24.
//  Copyright © 2016年 区块国际－yin. All rights reserved.
//


import Foundation
import UIKit

public func printLogDebug<T>(_ message: T,
                          file: String = #file,
                          method: String = #function,
                          line: Int = #line
    )
{
    #if DEBUG
        print("------------------\(line) lineBegin-------------------------\n类名称: \((file as NSString).lastPathComponent)\n方法名: \(method)\n信息: \(message)\n------------------\(line) line  End-------------------------")
    #endif
}

/// 线程加锁
///
/// - Parameters:
///   - lock: 加锁对象
///   - dispose: 执行闭包函数,
func synchronized(_ lock: AnyObject,dispose: ()->()) {
    objc_sync_enter(lock)
    dispose()
    objc_sync_exit(lock)
}

public let UIScreeWidth: CGFloat = UIScreen.main.bounds.size.width
public let UIScreeHeight: CGFloat = UIScreen.main.bounds.size.height

public let NOW_WIDTH: CGFloat = (UIScreeWidth / 375.0)
public let NOW_HEIGHT: CGFloat = (UIScreeHeight / 667.0)

extension UIView {
    
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(x: newValue, y: frame.origin.y, width: frame.width, height: frame.height)
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame = CGRect(x: frame.origin.x, y: newValue, width: frame.width, height: frame.height)
        }
    }
    
    var wide: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame = CGRect(x: frame.origin.x, y: newValue, width: frame.origin.x + newValue, height: frame.height)
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.origin.y + newValue)
        }
    }
    
    var origin: CGPoint {
        get {
            return frame.origin
        }
        set {
            frame.origin = newValue
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            frame.size = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return frame.maxX
        }
        set {
            frame = CGRect(x: newValue-frame.width, y: frame.minY, width: frame.width, height: frame.height)
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            frame = CGRect(x: frame.minX, y: newValue-frame.height, width: frame.width, height: frame.height)
        }
    }
}

//MARK:            Convenience methods for UIColor        _________________________________________________________________________________________________

public extension UIColor {
    
    /// Init color without divide 255.0
    ///
    /// - Parameters:
    ///   - r: (0 ~ 255) red
    ///   - g: (0 ~ 255) green
    ///   - b: (0 ~ 255) blue
    ///   - a: (0 ~ 1) alpha
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
    }
    
    /// Init color without divide 255.0
    ///
    /// - Parameters:
    ///   - r: (0 ~ 255) red
    ///   - g: (0 ~ 255) green
    ///   - b: (0 ~ 1) alpha
    convenience init(r: Int, g: Int, b: Int) {
        self.init(r: r, g: g, b: b, a: 1)
    }
    
    /// Init color with hex code
    ///
    /// - Parameter hex: hex code (eg. 0x00eeee)
    convenience init(hex: Int) {
        self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: 1)
    }
    
}

//MARK:            延时使用        ____________________________________________________________________________________________________

typealias Task = (_ cancel : Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure: (()->Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

func cancel(_ task: Task?) {
    task?(true)
}















