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
    @IBOutlet weak var seasonLabel: UILabel!
    
    //スライドショーに使うタイマー
    var timer: Timer!
    
    //スライド用の時間のための変数
    var slide_sec: Int = 0
    
    //画像の登録
    var seasonImageNames:[UIImage] = [UIImage(named: "spring")!,UIImage(named: "summer")!,UIImage(named: "fall")!,UIImage(named: "winter")!]
    
    //ラベルの登録
    var seasonText: [String] = ["春","夏","秋","冬"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //アプリ起動時に一度だけ機能するコード
        //spring画像を表示
        DefaultImageView.image = seasonImageNames[0]
        
        //テキスト春を表示
        seasonLabel.text = seasonText[0]
    }
    
    //進むボタンを機能させる変数
    @IBAction func moveToButton(_ sender: Any) {
    }
    
    //戻るボタンを機能させる変数
    @IBAction func backButton(_ sender: Any) {
    }
    
    //再生・停止ボタンを機能させる変数
    @IBAction func stopButton(_ sender: Any) {
        // 再生ボタンを押すとスライド作成、始動
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            timer.invalidate()
            timer = nil
        }
    }
    
    //selector: #selector(updateSlide(_:)) で指定された関数。2秒毎に呼び出される
    @objc func updateTimer(_ slide: Timer) {
        slide_sec += 1
        
        if (slide_sec == seasonImageNames.count){
            slide_sec = 0
        }
        
        DefaultImageView.image = seasonImageNames[slide_sec]
        
        if (slide_sec == seasonText.count){
            slide_sec = 0
        }
        
        seasonLabel.text = seasonText[slide_sec]
    }
    
    //明日のためにメモ：print関数を使った事で下記のデバックエリアにのみ表示されてしまい、肝心のシュミレーターには反映されていない。尚「進む」ボタンを押せば押すほどデバックに反映される
}
