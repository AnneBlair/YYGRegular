# YYGRegular

```
我是： 语歌

个人网站：www.aiyinyu.com


```




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


###2.正则表达式用法
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

