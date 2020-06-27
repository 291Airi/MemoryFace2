//
//  MenuViewController.swift
//  MemoryFace2
//
//  Created by 福井　愛梨 on 2020/03/13.
//  Copyright © 2020 福井　愛梨. All rights reserved.


//import UIKit
//import RealmSwift
//
//class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//   @IBOutlet weak var table: UITableView!
//    //画像を入れるための配列
//    var ImageNameArray = [String]()
//    var todoItem: Results<Todo>!
//    var timer: Timer!
//    var timer1: Timer!
//    var textFieldString = "hintLabel"
//    var TodoKobetsunonakami = [String]()//名前
//    var TodoKobetsunonakami1 = [String]()//ヒント１
//    var TodoKobetsunonakami2 = [String]()//ヒント２
//    var TodoKobetsunonakami3 = [String]()//画像
//    private var realm: Realm!//名前
//    private var realm1: Realm!//ヒント１
//    private var realm2: Realm!//ヒント２
//    private var realm3: Realm!//画像
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let todo = realm.objects(Todo.self)
//
//        table.dataSource = self
//        ImageNameArray = ["realm3"]
//        self.navigationController?.isNavigationBarHidden = false
//        navigationItem.title = "title"
//        navigationItem.rightBarButtonItem = editButtonItem
//    }
//    //セルの数を設定
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //セルの数をImageNameArrayの数にする
//        return ImageNameArray.count
//    }   //ID付きのセルを所得して、セル付属のrabel1を表示させてみる
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> Int {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//        //セルに名前を表示する
//        cell?.textLabel?.text = realm![indexPath.row]
//
//        return cell
//    }

//    override func setEditing(_ editing: Bool, animated: Bool) {
//        //override前の処理を継続してさせる
//        super.setEditing(editing, animated: animated)
//        //tableViewの編集モードを切り替える
//        tableView.isEditing = editing //editingはBool型でeditButtonに依存する変数
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        //dataを消してから
//        datasorceArray.removeAtIndex(indexPath.row)
//        //tableViewCellの削除
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.backgroundColor = UIColor(red: 235/255, green: 225/255, blue: 213/255, alpha: 1.0)
//    }
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if tableView.isEditing {
//            return .delete
//        }
//        return .none
//    }
//
//}
