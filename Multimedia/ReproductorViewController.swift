//
//  ReproductorViewController.swift
//  Multimedia
//
//  Created by Jonay Gilabert López on 27/01/2020.
//  Copyright © 2020 Jonay Gilabert López. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class ReproductorViewController: UIViewController {

    var moviePlayer : AVPlayerLayer?
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view, typically from a nib.
       }

       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
       
       override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
          super.viewWillTransition(to: size, with: coordinator)
           coordinator.animate(alongsideTransition: { (context) in
           }) { (context) in
               // TODO (b.3) Hacer que el tamaño del reproductor de AVPlayerLayer para que se ajuste al girar la pantalla.
               self.moviePlayer!.frame = self.view.bounds
           }
       }

       @objc func videoPlaybackDidFinish(_ notification: Notification) {

           self.moviePlayer?.removeFromSuperlayer()
           NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
           self.moviePlayer=nil
           
       }
       
       @IBAction func playVideo(_ sender: UIButton) {
           
           let videoURL = Bundle.main.url(forResource: "video", withExtension: "m4v")
           
           //CODIGO AVPLAYERVIEWCONTROLLER
           
           /*let controller = AVPlayerViewController()
           let player = AVPlayer(url: videoURL! as URL)
           controller.player = player
           controller.showsPlaybackControls = false
           controller.view.autoresizingMask =  [.flexibleHeight, .flexibleWidth]
           controller.entersFullScreenWhenPlaybackBegins = true
           controller.exitsFullScreenWhenPlaybackEnds = true
           
           self.present(controller,animated: true){
                   controller.player?.play()
           }*/

           
           //CODIGO AVPLAYER + AVPLAYERLAYER
           
           let player = AVPlayer(url: videoURL! as URL)
           moviePlayer = AVPlayerLayer(player: player)
           self.moviePlayer!.frame = self.view.bounds
           
           self.view.layer.addSublayer(moviePlayer!)
           
           NotificationCenter.default.addObserver(self, selector:
               #selector(self.videoPlaybackDidFinish), name:
               NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
           
           moviePlayer?.backgroundColor = UIColor.lightGray.cgColor
    
           player.play()
        
       }

}
