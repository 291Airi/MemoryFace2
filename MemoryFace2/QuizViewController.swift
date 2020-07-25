//
//  QuizViewController.swift
//  MemoryFace2
//
//  Created by 福井　愛梨 on 2019/11/09.
//  Copyright © 2019 福井　愛梨. All rights reserved.
//

//import UIKit
//import RealmSwift
//import AVFoundation
//
//class QuizViewController: UIViewController,AVAudioPlayerDelegate{
//
//    @IBOutlet weak var image: UIImageView!
//    @IBOutlet weak var nextquiz: UIButton!
//    @IBOutlet weak var answerLabel: UILabel!
//    @IBOutlet weak var pictureImageView1: UIImageView!
//    @IBOutlet weak var nameTextField1: UITextField!
//    @IBOutlet weak var hintLabel: UILabel!
//    @IBOutlet weak var hint1Button: UIButton!
//    @IBOutlet weak var hint2Button: UIButton!
//    @IBOutlet weak var ansewrButton: UIButton!
//    @IBOutlet weak var mistake: UIButton!
//
//    var todoItem: Results<Object>!
//    var audioPlayer: AVAudioPlayer!
//    var timer: Timer!
//    var timer1: Timer!
//    var textFieldString = ""
//    private var realm: Realm!//名前
//    private var realm1: Realm!//ヒント１
//    private var realm2: Realm!//ヒント２
//    private var realm3: Realm!//画像
//
//    override func viewDidLoad() {
//        //let todo = realm.objects(Todo.self)
//        image.isHidden = true
//        nextquiz.isHidden = true
//        hintLabel.isHidden = true
//        hint1Button.isHidden = false
//        hint2Button.isHidden = false
//        ansewrButton.isHidden = false
//        mistake.isHidden = false
//        var realm3 = try! Realm()
//        print("URL", realm3)
//        let image:UIImage = realm3
//        realm = try! Realm()
//        realm1 = try! Realm()
//        realm2 = try! Realm()
//        realm3 = try! Realm()
//
//        super.viewDidLoad()
////        if TodoKobetsunonakami == [""]{
////            answerLabel.text = "登録してください"
////            timer1 = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: {(t)in
////                self.performSegue(withIdentifier: "touroku", sender: nil)
////            })
////        }
//    }
//
//    @IBAction func hint1Button(_ sender: Any) {
//        let realm1 = try! Realm()
//        hintLabel.text = realm1[0]
//        hintLabel.isHidden = false
//        print("クイズヒント１", realm1)
//        }
//
//
//    @IBAction func hint2Button(_ sender: Any) {
//        let realm2 = try! Realm()
//        hintLabel.text = realm2[0]
//        hintLabel.isHidden = false
//        print("クイズヒント2", realm2)
//    }
//
//
//    @IBAction func mistake(_ sender: Any) {
//        self.image.image = UIImage(named: "mark_batsu.png")
//        image.isHidden = false
//        let image = UIImage(named: "mark_maru.png")
//        if UserDefaults.standard.object(forKey: "TodoList") != nil {
//        //TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
//        answerLabel.text = realm[0]
//        nextquiz.isHidden = false
//        hint1Button.isHidden = true
//        hint2Button.isHidden = true
//        hintLabel.isHidden = true
//        ansewrButton.isHidden = true
//        mistake.isHidden = true
//        }
//        func playSound(name: String) {
//            guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
//                print("音源ファイルが見つかりません")
//                return
//            }
//
//            do {
//                // AVAudioPlayerのインスタンス化
//                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//
//                // AVAudioPlayerのデリゲートをセット
//                audioPlayer.delegate = self
//
//                // 音声の再生
//                audioPlayer.play()
//                // hazure.mp3の再生
//                playSound(name: "hazure.mp3")
//            } catch {
//            }
//        }
//    }
//
//    @IBAction func ansewrButton(_ sender: Any) {
//    // TextFieldから文字を取得
//        textFieldString = nameTextField1.text!
//////もし、textfieldとrealmが一致したら
//          if realm[0] == textFieldString{
//                func playSound(name: String) {
//                    guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
//                        print("音源ファイルが見つかりません");                        return
//                   }
//
//                   do {
//                        // AVAudioPlayerのインスタンス化
//                        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//
//                        // AVAudioPlayerのデリゲートをセット
//                       audioPlayer.delegate = self
//
//                      // 音声の再生
//                        audioPlayer.play()
//                       // hazure.mp3の再生
//                        playSound(name: "seikai.mp3")
//                   } catch {
//                  }
//               }
//               answerLabel.text = realm[0]
//               self.image.image = UIImage(named: "mark_maru.png")
//                image.isHidden = false
//                textFieldString = ""
//                nextquiz.isHidden = false
//                hintLabel.isHidden = true
//                hint1Button.isHidden = true
//                hint2Button.isHidden = true
//               ansewrButton.isHidden = true
//               mistake.isHidden = true
//            }else{
//              self.image.image = UIImage(named: "mark_batsu.png")
//               image.isHidden = false
//               hintLabel.isHidden = true
//               timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: {(t)in
//                   self.image.isHidden = true
//                    })
//                    textFieldString = ""
//          }
//   }
//
//    @IBAction func nextquiz(_ sender: Any) {
//        if UserDefaults.standard.object(forKey: "TodoList3") != nil {
//        //TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList3") as! [String]
//        realm = try! Realm()
//        realm1 = try! Realm()
//        realm2 = try! Realm()
//        realm3 = try! Realm()
//        let todo = realm.objects(Object.self)
//        //super.viewDidLoad()
//        hint1Button.isHidden = false
//        hint2Button.isHidden = false
//        ansewrButton.isHidden = false
//        mistake.isHidden = false
//        nextquiz.isHidden = true
//        answerLabel.text = "この人誰だ？"
//        answerLabel.isHidden = false
//        hintLabel.isHidden = true
//        image.isHidden = true
//
//        }
//
//    }
//
//}
