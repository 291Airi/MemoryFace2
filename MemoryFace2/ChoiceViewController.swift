//
//  ChoiceViewController.swift
//  MemoryFace2
//
//  Created by 福井　愛梨 on 2020/07/16.
//  Copyright © 2020 福井　愛梨. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    
    //名前を入れるための配列
    var NameArray = [String]()
    
    //写真を入れるための配列
    var imageNameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
        table.delegate = self
        
       //NameArrayに名前を入れる
        NameArray = [""]
        imageNameArray = [""]
        
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int{
        return NameArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        //セルにNameArrayの曲名を表示する
        cell?.textLabel?.text = NameArray[indexPath.row]
        
        cell?.textLabel?.text = "テスト"
        
        return cell!
    }
    

}
