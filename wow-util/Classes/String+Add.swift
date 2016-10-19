//
//  String+Add.swift
//  WowDsgn
//
//  Created by 小黑 on 16/4/14.
//  Copyright © 2016年 王云鹏. All rights reserved.
//

import Foundation


public extension String{
    
    public var length:Int {
        get {
            return self.characters.count 
        }
    }
    /**
     单行的size
     
     - parameter font:
     
     - returns:
     */
    func size(_ font:UIFont) -> CGSize {
        let size: CGSize = self.size(attributes: [NSFontAttributeName:font])
        return size
    }
    
    /**
     计算高度的，根据宽度计算  带换行的
     
     - parameter width:
     - parameter font:
     
     - returns:
     */
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
    
    
    //    func toPinYin() -> String {
    //        let s = self ?? ""
    //        let string = NSMutableString(string:s) as CFMutableString
    //        if CFStringTransform(string, nil, kCFStringTransformMandarinLatin,false) == true{
    //            if CFStringTransform(string,nil, kCFStringTransformStripDiacritics, false) == true{
    //                return string as String
    //            }
    //        }
    //        return ""
    //    }
    
    
    func validateMobile() -> Bool {
        // 手机号以 13 14 15 18 开头   八个 \d 数字字符
        let phoneRegex = "^((13[0-9])|(17[0-9])|(14[^4,\\D])|(15[^4,\\D])|(18[0-9]))\\d{8}$|^1(7[0-9])\\d{8}$";
        let phoneTest = NSPredicate(format: "SELF MATCHES %@" , phoneRegex)
        return (phoneTest.evaluate(with: self));
    }
    
    
    func validateEmail()-> Bool {
        let phoneRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        let phoneTest = NSPredicate(format: "SELF MATCHES %@" , phoneRegex)
        return (phoneTest.evaluate(with: self));
    }
    
    
    func priceFormat() -> String {
        //        let price = Float(self)
        //        guard let p = price else{
        //            return "¥"
        //        }
        //        let number = NSNumber(float:p)
        //        let numberFormat = NSNumberFormatter()
        //        numberFormat.numberStyle = .DecimalStyle
        //        let result = "¥" + (numberFormat.stringFromNumber(number) ?? "")
        
        
        let result = "¥ " + self
        return result
    }
    
}




extension String{
    func toPinYin() -> String {
        let s = self 
        let string = NSMutableString(string:s) as CFMutableString
        if CFStringTransform(string, nil, kCFStringTransformMandarinLatin,false) == true{
            if CFStringTransform(string,nil, kCFStringTransformStripDiacritics, false) == true{
                return string as String
            }
        }
        return "#"
    }
    /**
     返回价格带“¥” 的字符串
     */
    func get_formted_price() -> String {
        if ( self.length <= 0){
            return ""
        }
        return "¥\(self)"
    }
    /**
     返回 前后都加空格 的字符串
     */
    func get_formted_Space() -> String {
        if ( self.length <= 0){
            return ""
        }
        return  " " + "\(self)" + "    "
    }
    /**
     返回数量带“X” 的字符串
     */
    func get_formted_X() -> String {
        if ( self.length <= 0){
            return ""
        }
        return  "X\(self)"
    }
    /**
     替换手机号中间四位为“****”
     */
    mutating func get_formted_xxPhone() ->  String{
        
        //开始字符索引
        let startIndex = self.characters.index(self.startIndex, offsetBy: 3)
        //结束字符索引
        let endIndex = self.characters.index(self.startIndex, offsetBy: 7)
        let range = Range<String.Index>(startIndex..<endIndex)
        var s = String()
        for _ in 0..<7 - 3{
            s += "*"
        }
        return self.replacingCharacters(in: range, with: s)
    }
    /**
     将字符串替换*号
     
     - parameter str:        字符
     - parameter startindex: 开始字符索引
     - parameter endindex:   结束字符索引
     
     - returns: 替换后的字符串
     */
    
    static func stringByX(_ str:String,startindex:Int,endindex:Int) -> String{
        //开始字符索引
        let startIndex = str.characters.index(str.startIndex, offsetBy: startindex)
        //结束字符索引
        let endIndex = str.characters.index(str.startIndex, offsetBy: endindex)
        let range = Range<String.Index>(startIndex..<endIndex)
        var s = String()
        for _ in 0..<endindex - startindex{
            s += "*"
        }
        return str.replacingCharacters(in: range, with: s)
    }
    
    /**
     *  获取路径
     */
    
    func documentDir() -> String {
        let mypaths:NSArray = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as NSArray
        let mydocpath:String = mypaths.object(at: 0) as! String
        let filepath = URL(fileURLWithPath: mydocpath).appendingPathComponent(self).path
        return filepath
    }

}
