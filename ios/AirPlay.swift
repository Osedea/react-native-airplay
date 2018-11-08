import Foundation
import MediaPlayer

@objc(RCTAirPlay)
class RCTAirPlay: RCTEventEmitter {

  @objc func startScan() -> Void {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(RCTAirPlay.airplayChanged(sender:)),
                                           name: NSNotification.Name.AVAudioSessionRouteChange,
                                           object: AVAudioSession.sharedInstance())
  }

  @objc func airplayChanged(sender: NSNotification) {
    let currentRoute = AVAudioSession.sharedInstance().currentRoute
    var isAirPlayPlaying = false
    for output in currentRoute.outputs {
      if output.portType == AVAudioSessionPortAirPlay {
        print("Airplay Device connected with name: \(output.portName)")
        isAirPlayPlaying = true
        break;
      }
    }

    self.sendEvent(withName: "airplayConnected",
                   body: ["connected": isAirPlayPlaying])
  }

  @objc func isAlreadyConnected(callback: RCTResponseSenderBlock) -> Void {
    let currentRoute = AVAudioSession.sharedInstance().currentRoute
    for output in currentRoute.outputs {
      if output.portType == AVAudioSessionPortAirPlay {
        print("Airplay Device connected with name: \(output.portName)")
        callback([true])
        //return true
      }
    }
    callback([false])
    //return false
  }

  override func supportedEvents() -> [String]! {
    return ["airplayConnected"]
  }

}

@objc(RCTAirPlayButton)
class RCTAirPlayButton: RCTViewManager {
  override func view() -> UIView! {
    let wrapperView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    wrapperView.backgroundColor = UIColor.clear
    wrapperView.translatesAutoresizingMaskIntoConstraints = false

    let volumeView = MPVolumeView(frame: wrapperView.bounds)
    volumeView.showsVolumeSlider = false
    wrapperView.addSubview(volumeView)
    volumeView.center = wrapperView.center
    if let routeButton = volumeView.subviews.last as? UIButton,
      let routeButtonTemplateImage  = routeButton.currentImage?.withRenderingMode(.alwaysTemplate)
    {
      volumeView.setRouteButtonImage(routeButtonTemplateImage, for: [])
      volumeView.tintColor = UIColor.darkGray
    }


    return wrapperView
  }
}
