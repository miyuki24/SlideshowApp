//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田中美幸 on 2020/09/09.
//  Copyright © 2020 miyuki.tanaka2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //画像を表示する変数
    @IBOutlet weak var DefaultImageView: UIImageView!
    
    //ラベルを表示する変数
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var moveToButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    //スライドショーに使うタイマー
    var timer: Timer!
    
    //スライド用の時間のための変数
    var slide_sec: Int = 0
    
    //画像の宣言
    var seasonImageNames:[UIImage] = [UIImage(named: "spring")!,UIImage(named: "summer")!,UIImage(named: "fall")!,UIImage(named: "winter")!]
    
    //ラベルの宣言
    var seasonText: [String] = ["春","夏","秋","冬"]
    
    //アプリ起動時に一度だけ機能するコード
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //spring画像を表示
        DefaultImageView.image = seasonImageNames[0]
        
        //テキスト春を表示
        seasonLabel.text = seasonText[0]
    }
    
    //進むボタンを機能させる変数
    @IBAction func moveToButton(_ sender: Any) {
        
        //表示する画像を一枚進める
        slide_sec += 1
        
        //もし表示する画像と枚数が同じになったら
        if (slide_sec == seasonImageNames.count){
            
            //slide_secを一番初めの画像に戻す
            slide_sec = 0
        }
        
        //画像を表示する
        DefaultImageView.image = seasonImageNames[slide_sec]
        
        //もし表示するテキストと個数が同じになったら
        if (slide_sec == seasonText.count){
            
            //slide_secを一番初めのテキストに戻す
            slide_sec = 0
        }
        
        //テキストを表示する
        seasonLabel.text = seasonText[slide_sec]
    }
    
    //戻るボタンを機能させる変数
    @IBAction func backButton(_ sender: Any) {
        
        //表示する画像を一枚戻らせる
        slide_sec -= 1
        
        //もし表示する画像と枚数が同じになったら
        if (slide_sec == seasonImageNames.count){
            
            //slide_secを一番初めの画像の戻す
            slide_sec = 0
        }
        
        //もしslide_secがマイナスになったら
        if (slide_sec == -1){
            
            //画像を冬に切り替える
            slide_sec = 3
        }
        
        //画像を表示
        DefaultImageView.image = seasonImageNames[slide_sec]
        
        //もし表示するテキストと個数が同じになったら
        if (slide_sec == seasonText.count){
            
            //slide_secを一番初めのテキストに戻す
            slide_sec = 0
        }
        
        //テキストを表示
        seasonLabel.text = seasonText[slide_sec]
    }
    
    //再生・停止ボタンを機能させる変数
    @IBAction func stopButton(_ sender: Any) {
        
        //もしタイマーが再生中なら
        if (timer == nil) {
            
            //タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            //ボタンの名前を停止に変更する
            stopButton.setTitle("停止", for: .normal)
            
            //進むボタン、戻るボタンを機能させない
            moveToButton.isEnabled = false
            backButton.isEnabled = false
            
            //進むボタン、戻るボタンを半透明化させる
            moveToButton.alpha = 0.5
            backButton.alpha = 0.5
            
        } else {
            
            //タイマーを停止する
            timer.invalidate()
            
            //タイマーを停止中にする（nilを使う事で再生中・停止中の判定を行なっている）
            timer = nil
            
            //ボタンの名前を再生に変更する
            stopButton.setTitle("再生", for: .normal)
            
            //進むボタン、戻るボタンを機能させる
            moveToButton.isEnabled = true
            backButton.isEnabled = true
            
            //進むボタン、戻るボタンの半透明化を戻す
            moveToButton.alpha = 1.0
            backButton.alpha = 1.0
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        expansionViewController.image2 = seasonImageNames[slide_sec]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    //selector: #selector(updateSlide(_:)) で指定された関数。2秒毎に呼び出される
    @objc func updateTimer(_ slide: Timer) {
        
        //画像を一枚進める
        slide_sec += 1
        
        //もし表示する画像と枚数が同じになったら
        if (slide_sec == seasonImageNames.count){
            
            //slide_secを一番初めの画像の戻す
            slide_sec = 0
        }
        
        //画像を表示
        DefaultImageView.image = seasonImageNames[slide_sec]
        
        //もし表示するテキストと個数が同じになったら
        if (slide_sec == seasonText.count){
            
            //slide_secを一番初めの画像に戻す
            slide_sec = 0
        }
        
        //テキストを表示
        seasonLabel.text = seasonText[slide_sec]
    }
}
