

import SwiftUI

struct SecondOnBoardingView: View {
    
    
    var body: some View {
        
        VStack{
            Text("**Getting Started in Bibli**")
                .frame(width: 300, height: 100, alignment: .center)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("AccentColor"))
                .padding(.top,100)
            
            
            HStack{
                Image ("bookSmall")
                    .padding()
                    .frame(width:75, alignment: .center)
                
                VStack{
                    Text ("Create Folders")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color("AccentColor"))
                        .frame(width: 300,  alignment: .leading)
                    
                    Text ("Document your books in various file types inside a folder.")
                        .font(.body)
                        .foregroundColor(Color("grayPalette"))
                        .frame(width: 285,alignment: .leading)
                        .padding(.trailing,15)
                    
                }
                
            }.frame(width: 385, alignment: .center)
                .padding(.top,90)
            
            HStack{
                Image ("phoneSmall")
                    .padding()
                    .frame(width:75, alignment: .center)
                
                
                VStack{
                    Text ("Discover Various File Types")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color("AccentColor"))
                        .frame(width: 300, alignment: .leading)
                    
                    Text ("Create book documentation in the form of notes, photos, and voice notes.")
                        .font(.body)
                        .foregroundColor(Color("grayPalette"))
                        .frame(width: 285,alignment: .leading)
                        .padding(.trailing,15)
                    
                    
                    
                }
                
            }.frame(width: 385, alignment: .center)
            
            
            HStack{
                Image ("penSmall")
                    .padding()
                    .frame(width: 75, alignment: .center)
                
                VStack{
                    Text ("Write Today, Remember Forever")
                        .font(.body)
                        .bold()
                        .foregroundColor(Color("AccentColor"))
                        .frame(width: 300, alignment: .leading)
                    
                    Text ("Highlight your favorite lines of the book and read it whenever you want")
                        .font(.body)
                        .foregroundColor(Color("grayPalette"))
                        .frame(width: 280,alignment: .leading)
                        .padding(.trailing,15)
                    
                }
                
            }.frame(width: 385, alignment: .center)
                .padding(.bottom,100)
            
            NavigationLink(destination: MainScreenView()){
                Text("Continue")
            }
            .font(.title2)
            .frame(width: 250, height: 25, alignment: .center)
            .padding(min(.infinity, 20))
            .foregroundColor(.white)
            .background(Color("AccentColor"))
            .cornerRadius(10)
            .padding(.bottom,200)
        
        }
    }
    
    struct SecondOnBoardingView_Preview: PreviewProvider {
        static var previews: some View {
            SecondOnBoardingView()
        }
    }
}
