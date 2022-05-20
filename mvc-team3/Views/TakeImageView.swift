
import SwiftUI

struct TakeImageView: View {
    @EnvironmentObject var vm: ImageViewModel
    
    var body: some View {
        NavigationView{
            VStack {
                if let image = vm.image {
                    
                    ZoomableScrollView {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                } else {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.6)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal)
                }
                HStack {
                    Button {
                        vm.source = .camera
                        vm.showPhotoPicker()
                    } label: {
                        Text("Camera")
                    }
                    Button {
                        vm.source = .library
                        vm.showPhotoPicker()
                    } label: {
                        Text("Photos")
                    }
                }
                Spacer()
            }
            .sheet(isPresented: $vm.showPicker) {
                ImagePickerVC(sourceType: vm.source == .library ? .photoLibrary : .camera, selectedImage: $vm.image)
                    .ignoresSafeArea()
            }
            .alert("Error", isPresented: $vm.showCameraAlert, presenting: vm.cameraError, actions: { cameraError in
                cameraError.button
            }, message: { cameraError in
                Text(cameraError.message)
            })
            .navigationTitle("My Images")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TakeImageView_Previews: PreviewProvider {
    static var previews: some View {
        TakeImageView()
            .environmentObject(ImageViewModel())
    }
}
