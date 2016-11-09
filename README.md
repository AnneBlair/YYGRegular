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
func printLogDebug<T>(_ message: T,
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

###2.正则表达式

```
还在写...
```

