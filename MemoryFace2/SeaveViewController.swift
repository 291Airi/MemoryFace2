//
//  SeaveViewController.swift
//  MemoryFaceTests
//
//  Created by 福井　愛梨 on 2019/11/09.
//  Copyright © 2019 福井　愛梨. All rights reserved.
//

import UIKit
import RealmSwift
import AssetsLibrary

class SeaveViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var todoItem: Results<Todo>!
    var textFieldString = ""
    var hint1 = ""
    var hint2 = ""
    var  URL = ""
//    var TodoKobetsunonakami = [String]()
//    var TodoKobetsunonakami1 = [String]()
//    var TodoKobetsunonakami2 = [String]()
//    var TodoKobetsunonakami3 = [String]()
    private var realm: Realm!
    private var realm1: Realm!
    private var realm2: Realm!
    private var realm3: Realm!
    
    @IBOutlet weak var kuma: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hint1TextField: UITextField!
    @IBOutlet weak var hint2TextField: UITextField!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let realm = try Realm()
            let realm1 = try Realm()
            let realm2 = try Realm()
            let realm3 = try Realm()
//            todoItem = realm.objects(Todo.self)
//            todoItem = realm1.objects(Todo.self)
//            todoItem = realm2.objects(Todo.self)
//            todoItem = realm3.objects(Todo.self)
        }catch{
            
        }
        
        // 画面が表示される際などにtableViewのデータを再読み込みする
        func viewWillAppear(animated: Bool) {
           super.viewWillAppear(animated)
        }
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        performSegue(withIdentifier: "modoru", sender: nil)
        let newTodo = Todo()
        // Realmのインスタンスを取得
        realm = try! Realm()
        realm1 = try! Realm()
        realm2 = try! Realm()
        realm3 = try! Realm()
        //変数に入力内容を入れる
        func addTodo(textFieldString: String) {
            try! realm.write {
                realm.add(Todo(value: ["textFieldString": textFieldString]))
            }
            print("名前",realm)
        }
        func addTodo(hint1: String) {
            try! realm1.write {
                realm1.add(Todo(value: ["hint1": hint1]))
            }
            print("ヒント1",realm1)
        }
        func addTodo(hint2: String) {
            try! realm2.write {
                realm2.add(Todo(value: ["hint2": hint2]))
                
            }
            print("ヒント1",realm1)
        }
        func addTodo(pictureurl: String) {
            try! realm3.write {
                realm3.add(Todo(value: ["pictureurl": pictureurl]))
                
            }
            print("写真「",realm3)
        }
        
        
//        TodoKobetsunonakami.append(nameTextField.text!)
//        UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
//        TodoKobetsunonakami1.append(hint1TextField.text!)
//        UserDefaults.standard.set( TodoKobetsunonakami1, forKey: "TodoList1" )
//        TodoKobetsunonakami2.append(hint2TextField.text!)
//         UserDefaults.standard.set( TodoKobetsunonakami2, forKey: "TodoList2" )
//
//        TodoKobetsunonakami3.append(URL)
//        UserDefaults.standard.set( TodoKobetsunonakami3, forKey: "TodoList3" )
//        print("TodoKobetsunonakami",TodoKobetsunonakami)
//        print("TodoKobetsunonakami1",TodoKobetsunonakami1)
//        print("TodoKobetsunonakami2",TodoKobetsunonakami2)
//        print("TodoKobetsunonakami3",TodoKobetsunonakami3)
//        //realmに入れる
//        let Realm  = TodoKobetsunonakami//名前
//        let Realm1  = TodoKobetsunonakami1//ヒント１
//        let Realm2  = TodoKobetsunonakami2//ヒント２
//        let Realm3  = TodoKobetsunonakami3//画像
//        print("URL", TodoKobetsunonakami3)
//        // 上記で代入したテキストデータを永続化するための処理
//        try! realm.write() {
//            realm.add(newTodo)
//        }
//        try! realm1.write() {
//            realm.add(newTodo)
//        }
//        try! realm2.write() {
//            realm.add(newTodo)
//        }
//        try! realm3.write() {
//            realm.add(newTodo)
//        }
    }
    
    @IBAction func erase(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "アラート表示", message: "全データを消去していいですか？", preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            // ボタンが押された時の処理を書く（クロージャ実装）
            (action: UIAlertAction!) -> Void in
            let config = Realm.Configuration(inMemoryIdentifier: "inMemory")
            let realm = try! Realm(configuration: config)
            print("消去名前",realm)
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            print("Cancel")
        })
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        let realm = try! Realm(configuration: config)
    }
    
    @IBAction func albumButton(_ sender: Any) {
        //imagePickerCountrollerのインスタンスを作る
        let imagePickerCountroller: UIImagePickerController = UIImagePickerController()
        //フォットライブラリを使う設定をする
        imagePickerCountroller.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerCountroller.delegate = self
        imagePickerCountroller.allowsEditing = true
        //フォットライブラリを呼び出す
        self.present(imagePickerCountroller, animated: true, completion: nil)
            }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //string型に変換、保存
        let Imageinfo = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        //imageに選んだ画像を設定する
        let image = info[.originalImage] as? UIImage
        let imageUrl = info[UIImagePickerController.InfoKey.referenceURL] as? NSURL
        URL = (imageUrl?.absoluteString)!
        //imageをpictureImageViewに設定する
        pictureImageView.image = image
        //フォトライブラリを閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    
}



