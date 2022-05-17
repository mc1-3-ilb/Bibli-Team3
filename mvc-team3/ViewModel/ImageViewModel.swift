//
//  ImageViewModel.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 16/05/22.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: PickerImage.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError: PickerImage.CameraErrorType?
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try PickerImage.checkPermissions()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = PickerImage.CameraErrorType(error: error as! PickerImage.PickerError)
        }
    }
}
