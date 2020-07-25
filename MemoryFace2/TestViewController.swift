//
//  TestViewController.swift
//  MemoryFace2
//
//  Created by 福井　愛梨 on 2020/07/25.
//  Copyright © 2020 福井　愛梨. All rights reserved.
//

import UIKit
import RealmSwift

class TestViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{
    
    class Player: Object {
        // 選手名
        @objc dynamic var name : String = ""
        // 身長(単位：m)
        @objc dynamic var height : Double = 0.0
        // 体重(単位：kg)
        @objc dynamic var weight : Double = 0.0
    }

    var realm: Realm!

    override func viewDidLoad() {
        print("あい")
        super.viewDidLoad()
    }

    @IBAction func button(_ sender: Any) {
        print("うえ")
        // データ登録用コード例
        // 1人目の選手上には
        let player1 = Player()
        print("おか")
        player1.name = "HIRO"
        player1.height = 163.0
        player1.weight = 60.5
        print(player1.name)
        print(player1.height)
        print(player1.weight)
        print("きく")
        
        
        
        // 2人目の選手
        let player2 = Player()
        player2.name = "CHIHIRO"
        player2.height = 175.0
        player2.weight = 58.0
        print(player2.name)
        print(player2.height)
        print(player2.weight)
        print("けこ")
        
        
        // 3人目の選手
        let player3 = Player()
        player3.name = "SHURI"
        player3.height = 170.0
        player3.weight = 61.2
        print(player3.name)
        print(player3.height)
        print(player3.weight)
        print("さし")
        
        
        // 上記で作成した3人の選手を格納するリストの作成
        let players = List<Player>()
        players.append(player1)
        players.append(player2)
        players.append(player3)
        print(players.append(player1))
        print(players.append(player2))
        print(players.append(player3))
        print("すせ")
        
        // Realmのインスタンスを生成する
        let realm = try! Realm()
        print("そた")
        
        // 書き込みトランザクション内でデータを追加する
        try! realm.write {
            realm.add(players)
            print("ちつ")
        }
    }
    
}
