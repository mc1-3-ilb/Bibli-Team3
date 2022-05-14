//
//  FirstOnBoardingView.swift
//  mvvm-team03
//
//  Created by Nadia Ramadhani on 13/05/22.
//

import SwiftUI

struct FirstOnBoardingView: View {
    
    
    var body: some View {
        
        
        NavigationView {
            VStack{
                Image ("logoNew")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                    .padding(.bottom)
                
                Text("**Welcome to Bibli**")
                    .font(.title)
                    .padding(.bottom)
                    .foregroundColor(Color("AccentColor"))
                
                Text("A Perfect Place for Your Book Documentations")
                    .frame(width: 300, alignment: .center)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .foregroundColor(Color("AccentColor"))
                    .padding(.vertical)
                
                NavigationLink(destination: SecondOnBoardingView()){
                    Text("Continue")
                }
                .font(.title2)
                .frame(width: 250, height: 25, alignment: .center)
                .padding(min(.infinity, 20))
                .foregroundColor(.white)
                .background(Color("AccentColor"))
                .cornerRadius(10)
                .padding(.top,75)
                
                Spacer()
                
                
                
            }
        }.navigationViewStyle(.stack)
        
    }
    
}


struct FirstOnBoardingView_Preview: PreviewProvider {
    static var previews: some View {
        FirstOnBoardingView()
    }
}

