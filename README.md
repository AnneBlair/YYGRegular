# YYGRegular

```
我是： 语歌

```
[个人博客](http://aiyinyu.com:8090/)




It is a regular expression used on iOS, which implement by Swift

这是一个基于swift快捷开发的扩展类，目前的涵盖内容包括详细打印，正则表达式，会经常维护


##直接把 Category 文件夹拖转到工程里面就行
###1.打印的方法，及简单介绍

| 符号 | 类型 | 描述 |
| --- | --- | --- |
| #file | String | 包含这个符号的文件路径  |
| #line | Int | 符号出现的行号 |
| #column | Int | 符号出现的类 |
| #function | String | 包含这个符号的方法名字 |


```
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
```

###### 调用 
> 
```
直接调用打印：
printLogDebug("内容")
```
>



###在 Release 版本中会自动关闭掉向控制台的输出。
***打印效果如下：***



```
------------------（*行号*） lineBegin-------------------------
类名称: ***.swift
方法名: ***
信息: ***打印的内容***
------------------（*行号*） line  End-------------------------
```
###关于public的使用看下表
| 名称 | 控制级（1-5，5最高） | 解释 |
| :-: | :-: | :-: |
| private | 1 | 只能在当前作用域中使用 |
| fileprivate | 2 | 只能在当前文件夹中使用 |
| internal | 3默认的 | target中的其他代码访问 |
| public | 4 | 为其他开发者开发库使用 |
| open | 5 | 为其他开发者开发库使用被open标记 的才能在其他库中重写 |
：


### 2.正则表达式用法
示例：
>
#####因为Swift支持重载操作符，   这个用 **=~** 来判断是否符合，关于=~ 功能及符号的定义，自己去代码里面找吧！！！
>
```
        if "13146492969@sina.cn" =~ mail {
            printLogDebug("^_^")
        } else {
            printLogDebug("~~~~(>_<)~~~~")
        }
        /// 自定义的匹配格式判断是否是手机号
        let isIphoneNum: String = "1\\d{10}"
        if "13146492969" =~ isIphoneNum {
            printLogDebug("^_^")
        } else {
            printLogDebug("~~~~(>_<)~~~~")
        }
```

####定义了操作符的优先级：
`precedencegroup`
####定义了相同操作符出现的结合顺序 
`associativity`
####表示前后都是输入
`infix`

####相关正则匹配的写法，有想知道更详细的写法 请移步： [正则表达式学习](http://deerchao.net/tutorials/regex/common.htm)
###以下给出基本的写法。
**不足之处，烦请指出**

```
1./// 邮箱匹配
let mail: String = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

2./// 匹配用户名 字面或者数字组合 4到16位
let Username: String = "^[a-z0-9_-]{4,16}$"

3./// 匹配密码 字面加下划线，6到18位
let Password: String = "^[a-z0-9_-]{6,18}$"

4./// 匹配16进制
let HexValue: String = "^#?([a-f0-9]{6}|[a-f0-9]{3})$"

5.///内容带分割符号 “Anne-Blair”
let Slug: String = "^[a-z0-9-]+$"

6./// 匹配URL
let isURL: String = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"

7./// 匹配IP地址
let IPAddress: String = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

8./// 是HTML <center>内容<\center>  符合
let HTMLTag: String = "^<([a-z]+)([^<]+)*(?:>(.*)<\\/\\1>|\\s+\\/>)$"

9./// 日期(年-月-日)
let isDate1: String = "(\\d{4}|\\d{2})-((1[0-2])|(0?[1-9]))-(([12][0-9])|(3[01])|(0?[1-9]))"

10./// 日期(月/日/年)
let isDate2: String = "((1[0-2])|(0?[1-9]))/(([12][0-9])|(3[01])|(0?[1-9]))/(\\d{4}|\\d{2})"

11./// 时间(小时:分钟, 24小时制)
let TimeFormat: String = "((1|0?)[0-9]|2[0-3]):([0-5][0-9])"

12./// 是汉字
let isChinese: String = "[\\u4e00-\\u9fa5]"

13./// 中文及全角标点符号(字符)
let ChineseParagraph: String = "[\\u3000-\\u301e\\ufe10-\\ufe19\\ufe30-\\ufe44\\ufe50-\\ufe6b\\uff01-\\uffee]"

14./// 中国大陆固定电话号码
let fixedLineTelephone: String = "(\\d{4}-|\\d{3}-)?(\\d{8}|\\d{7})"

15./// 中国大陆身份证号(15位或18位)
let IdNum: String = "\\d{15}(\\d\\d[0-9xX])?"

16./// 手机号
let isIphoneNum: String = "1\\d{10}"

17./// 邮政编码
let zipCode: String = "[1-9]\\d{5}"
```

##新增加一些方法的扩展。如：UIView的扩展，富文本的扩展，UIColor的扩展，线程安全使用的扩展
###3.UIView的一些扩展
####  主要是方便直接对视图控件x,y等等一系列的操作
####  这个比较简单，不做介绍，主要是 set,get,集成后直接用就行

```
extension UIView {
    
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame = CGRect(x: newValue, y: frame.origin.y, width: frame.width, height: frame.height)
        }
    }
    ........................
```

### 4.线程安全操作
#### 在Oc中为了防止多线程中对某些资源的安全访问 引用了
`@synchronized`的操作,更多的关于多线程的知识 [点我](https://www.objccn.io/issue-2-1/),这里大量篇幅的描述，会使你得到更多的收获。这里不做陈述

#### 在Swift中已经移除了`synchronized` 的使用，相应的 我们可以直接使用：
`objc_sync_enter`
///资源的操作
`objc_sync_exit`
#### 结合闭包的使用可以直接这样使用
```
public func synchronized(_ lock: AnyObject, closure: () -> ()) {
    objc_sync_enter(lock)
    closure()
    objc_sync_exit(lock)
}
```
#### 相应的执行的时候你可以这样：
```
var test = 0
synchronized(test as AnyObject) {
    test = 1     // test 在该作用域不会被其他线程改变
    print(test)
}
/// 或者这样
synchronized(test as AnyObject, closure: {
    print(test)  // test 在该作用域不会被其他线程改变
})
```
#### 这样你就可以愉快的使用了

### 5.对UIColor的扩展
#### 都知道Xcode在8.0以后可以直接在代码中使用颜色编辑器，图片预览。这样大大的节省了我们的开发效率
#### 而在于有时候的习惯的使用上来说,可能或多或少还有用代码来操作的,这里带给大家在使用代码的时候的一些方便
##### 有时候在开发的过程中UI给的标注是 0xCE0755 这样的颜色标注,那么我们有时候就需要转换,当然在颜色编辑器里面是可以直接使用的。
> 转换如下：

```
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
```
#### 这里要说的是主要原理就是: 先通过&运算,取得相应的颜色位,然后通过左移相应的位数来进行换算。这里就不多说了。[传送门](https://zh.wikipedia.org/wiki/%E4%BD%8D%E6%93%8D%E4%BD%9C)

### 6.富文本的一些操作,工程中非常清楚的介绍了使用,这里不做陈述了。
##### 科学计数法转换
##### 人民币的金额转换

### 7.对String的扩展,进行截取,插入操作
```
extension String {
    /// 截取第一个到第任意位置
    ///
    /// - Parameter end: 结束的位值
    /// - Returns: 截取后的字符串
    func stringCut(end: Int) ->String{
        printLogDebug(self.characters.count)
        if !(end < characters.count) { return "截取超出范围" }
        let sInde = index(startIndex, offsetBy: end)
        return substring(to: sInde)
    }
    
    /// 截取人任意位置到结束
    ///
    /// - Parameter end:
    /// - Returns: 截取后的字符串
    func stringCutToEnd(star: Int) -> String {
        if !(star < characters.count) { return "截取超出范围" }
        let sRang = index(startIndex, offsetBy: star)..<endIndex
        return substring(with: sRang)
    }
    
    /// 字符串任意位置插入
    ///
    /// - Parameters:
    ///   - content: 插入内容
    ///   - locat: 插入的位置
    /// - Returns: 添加后的字符串
    func stringInsert(content: String,locat: Int) -> String {
        if !(locat < characters.count) { return "截取超出范围" }
        let str1 = stringCut(end: locat)
        let str2 = stringCutToEnd(star: locat)
        return str1 + content + str2
    }
}
```

### 8.延时使用,异步延时，主线程执行
>使用：

```
	let sleep = delay(0.7) {
        /// 执行代码
    }
```
> 使用过程中不想执行了

```
	cancel(sleep)

```

##### 源码如下：
```
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
```

### 更新继续,如果您觉得对你有帮助 那就来个 [star](https://github.com/AnneBlair/YYGRegular/stargazers)

