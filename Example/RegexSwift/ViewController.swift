//
//  ViewController.swift
//  RegexSwift
//
//  Created by dats0354@gmail.com on 03/22/2020.
//  Copyright (c) 2020 dats0354@gmail.com. All rights reserved.
//

import UIKit
import RegexSwift

class ViewController: UIViewController {
    
    let str = "陈皮: 13701010202, 孙莉: 13701010303, 袁伟豪: 13701010404"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        example1()
        example2()
        example3()
        example4()
        example5()
    }
}

extension ViewController {
    func example1() {
        
        print("=============验证字符串格式============")
        
        //初始化正则工具类
        let pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let regex = try! RegexSwift(pattern)
         
        //验证邮箱地址
        let mailAddress = "jinkey@github.com"
        if regex.matches(mailAddress) {
            print("邮箱地址格式正确")
        }else{
            print("邮箱地址格式有误")
        }
    }
    
    func example2() {
        
        print("=============提取字符串获取首个匹配结果============")
        
        //初始化正则工具类
        let pattern = "([\\u4e00-\\u9fa5]+):([\\d]+)"
        let regex = try! RegexSwift(pattern)
         
        //获取第一个匹配对象
        if let first = regex.firstMatch(in: str) {
            print("--- 第一个匹配结果  ---")
            print(first)
            print("匹配字符串：", first.string)
            print("捕获组：", first.captures[0]!, first.captures[1]!)
            print("匹配范围：", first.range)
        }
    }
    
    func example3() {
        
        print("=============提取字符串获取所有的匹配结果============")
        
        //初始化正则工具类
        let pattern = "([\\u4e00-\\u9fa5]+):([\\d]+)"
        let regex = try! RegexSwift(pattern)
         
        //获取第一个匹配对象
        for match in regex.matches(in: str) {
            print("\n--- 匹配结果  ---")
            print(match)
            print("匹配字符串：", match.string)
            print("捕获组：", match.captures[0]!, match.captures[1]!)
            print("匹配范围：", match.range)
        }
        
    }
    
    func example4() {
        
        print("=============字符串替换整体替换============")
        
        //初始化正则工具类
        let pattern = "([\\u4e00-\\u9fa5]+):([\\d]+)"
        let regex = try! RegexSwift(pattern)
         
        //只替换第1个匹配项
        let out1 = regex.replacingMatches(in: str, with: "***", count: 1)
        //替换所有匹配项
        let out2 = regex.replacingMatches(in: str, with: "***")
           
        //输出结果
        print("原始的字符串：", str)
        print("替换第1个匹配项：", out1)
        print("替换所有匹配项：", out2)
        
    }
    
    func example5() {
        
        print("=============字符串替换位置替换============")
        
        //初始化正则工具类
        let pattern = "([\\u4e00-\\u9fa5]+):([\\d]+)"
        let regex = try! RegexSwift(pattern)
         
        //只替换第1个匹配项
        let out1 = regex.replacingMatches(in: str, with: "$1的电话是$2", count: 1)
        //替换所有匹配项
        let out2 = regex.replacingMatches(in: str, with: "$1的电话是$2")
           
        //输出结果
        print("原始的字符串：", str)
        print("替换第1个匹配项：", out1)
        print("替换所有匹配项：", out2)
        
    }
    
}
