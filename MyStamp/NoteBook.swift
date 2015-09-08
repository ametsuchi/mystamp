//
//  NoteBook.swift
//  MyStamp
//
//  Created by 萌 on 2015/09/06.
//  Copyright (c) 2015年 萌. All rights reserved.
//


class NoteBook:RLMObject{
    // プロパティと初期値の設定
    dynamic var id:Int = 0
    dynamic var name:String = ""
    dynamic var created:Double = 0
    dynamic var updated:Double = 0
    
    
    // PKの設定
    override class func primaryKey() -> String?{
        return "id"
    }
    
    
    
}
