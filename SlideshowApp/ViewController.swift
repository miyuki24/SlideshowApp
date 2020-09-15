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
        } else {
            
            //タイマーを停止する
            timer.invalidate()
            
            //タイマーを停止中にする（nilを使う事で再生中・停止中の判定を行なっている）
            timer = nil
        }
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

//明日のためにメモ：print関数を使った事で下記のデバックエリアにのみ表示されてしまい、肝心のシュミレーターには反映されていない。尚「進む」ボタンを押せば押すほどデバックに反映される
