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

class SeaveViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextFieldDelegate{

    //var todoItem: Results<Todo>!
    
    class personArray: Object{
        @objc dynamic var textFieldString: String = ""
        @objc dynamic var hint1: String = ""
        @objc dynamic var hint2: String = ""
        @objc dynamic var pictureurl: String = ""
    }
    
    var textFieldString = ""
    var hint1 = ""
    var hint2 = ""
    var  URL = ""
    private var realm: Realm!//person
//    private var realm1: Realm!
//    private var realm2: Realm!
//    private var realm3: Realm!
//    private var realm4: Realm!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hint1TextField: UITextField!
    @IBOutlet weak var hint2TextField: UITextField!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("あiu")
        
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
    
    @IBAction func saveButton(_ sender: Any) {
        print("たちつ")
        let person1 = personArray()
         print("さいす")
        person1.textFieldString = nameTextField.text!
         print("さいす")
        person1.hint1  = hint1TextField.text!
         print("さいす")
        person1.hint2 = hint2TextField.text!
         print("さいす")
        person1.pictureurl = URL
        print("さいす")
        print("person1,textFieldString",person1.textFieldString)
        print("person1,hint1",person1.hint1)
        print("person1,hint2",person1.hint2)
        print("person1,pictureurl",person1.pictureurl)
        
        
        //personを格納するリストの作成
        let persons = List<personArray>()
        persons.append(person1)
        print("person1",persons)
        
        // Realmのインスタンスを生成する
        let realm = try! Realm()
        
        // 書き込みトランザクション内でデータを追加する
        try! realm.write {
            realm.add(persons)
        }
    }
        
//        //名前
//        let obj = Obj()
//        obj.textFieldString = nameTextField.text
//
//        let realm1 = try! Realm()
//        try! realm1.write {
//            realm1.add(obj)
//            print("名前",realm1)
//        }
//
//        //ヒント１
//        obj.hint1 = hint1TextField.text
//
//        let realm2 = try! Realm()
//        try! realm2.write {
//            realm2.add(obj)
//            print("名前",realm2)
//        }
//
//        //ヒント2
//        obj.hint2 = hint2TextField.text
//
//        let realm3 = try! Realm()
//        try! realm3.write {
//            realm3.add(obj)
//            print("名前",realm3)
//        }
//
//        //画像
//        obj.pictureurl = URL
//
//        let realm4 = try! Realm()
//        try! realm4.write {
//            realm4.add(obj)
//            print("名前",realm4)
//        }
    
    
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

}
    
    




