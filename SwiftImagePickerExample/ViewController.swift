//
// Copyright (c) 2019, mycompany All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!

  @IBOutlet weak var buttonPickImageCamera: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()

    #if DEBUG
      #if arch(i386) || arch(x86_64)
        buttonPickImageCamera.isEnabled = false
      #endif
    #endif
  }

  @IBAction func onTapPickImagePhotoLibrary(_ sender: Any) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary
    present(imagePicker, animated: true) {
      print("imagePicker presented")
    }
  }

  @IBAction func onTapPickImageSavedPhotosAlbum(_ sender: Any) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .savedPhotosAlbum
    present(imagePicker, animated: true) {
      print("imagePicker presented")
    }
  }

  @IBAction func onTapPickImageCamera(_ sender: Any) {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .camera
    present(imagePicker, animated: true) {
      print("imagePicker presented")
    }
  }
}

extension ViewController: UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    print("UIImagePickerController didFinishPickingMediaWithInfo.")
    info.keys.forEach {
      let key: UIImagePickerController.InfoKey = $0
      let val = info[$0] ?? ""
      print("info[\(key.rawValue)] = \(val)")
    }

    let originalImage: UIImage? = info[.originalImage] as? UIImage
    imageView.image = originalImage
    picker.dismiss(animated: true) {
      print("dismissed UIImagePickerController.")
    }
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    print("UIImagePickerController canceled.")
    picker.dismiss(animated: true) {
      print("dismissed UIImagePickerController.")
    }
  }
}

extension ViewController: UINavigationControllerDelegate {}
