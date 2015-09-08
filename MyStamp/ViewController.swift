//
//  ViewController.swift
//  MyStamp
//
//  Created by 萌 on 2015/09/06.
//  Copyright (c) 2015年 萌. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var listTableView: UITableView!
    var lists:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        // Realmのテスト
        if let newBook = NoteBook(forPrimaryKey: 0){
            let realm = RLMRealm.defaultRealm()
            println(realm.path)
            
        }else{
            let newNoteBook = NoteBook()
            newNoteBook.id = 0
            newNoteBook.name = "test"
            newNoteBook.created = NSDate().timeIntervalSince1970
            
            // データの新規作成
            let realm = RLMRealm.defaultRealm()
            realm.beginWriteTransaction()
            realm.addObject(newNoteBook)
            realm.commitWriteTransaction()
   
        }
        lists = loadNoteBookList()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /**
    * セルの行数（必須）
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    /**
    * セルの内容を設定（必須）
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = String(lists[indexPath.row] as! NSString)
        
        cell.imageView?.image = UIImage(named: "seals.png")
        
        return cell
    }
    
    
    func loadNoteBookList() -> NSArray{
        var lists:[String] = []
        
        for item in NoteBook.allObjects(){
            lists.append((item as! NoteBook).name)
        }
        
        return lists
    }
    

}

