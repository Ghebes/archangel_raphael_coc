//
//  BroadcastView.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/29/24.
//

import SwiftUI

struct BroadcastView: View {
    ///Environment Variable that opens url links
    @Environment(\.openURL) var openURL
    @Environment(\.dismiss) var dismiss: DismissAction
    @AppStorage("isLight") var isLight: Bool = false
    
    @StateObject var navigationValues : NavigationValues = NavigationValues()
    
    var body: some View {
        GeometryReader{ proxy in
            VStack(spacing : 0){
                
                //Header
                HStack{
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 32, height: 28)
                        .foregroundStyle(isLight ? .churchOrange : .coral)
                        .onTapGesture {
                            navigationValues.currentAppScreen = 0
                        }
                    
                    
                    Text("Broadcast")
                        .foregroundStyle(isLight ? .churchOrange : .coral)
                        .font(.custom("Literata-Bold", size: 32))
                        .padding(.leading, proxy.size.width * 50 / 430)
                    
                    Spacer()
                    
                }
                .padding(EdgeInsets(top: 0, leading: proxy.size.width * 40/430, bottom: 0, trailing: 0))
                
                HStack{
                    Spacer()
                    
                    ZStack{
                        VideoView(videoID: "live_stream?channel=UCmr3L3Wzc1SqhLVM4qEONbQ")
                        
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .foregroundStyle(isLight ? .white : .coral)
                    }
                    .frame(width: proxy.size.width * 348/430, height: proxy.size.height * 404/839)
                    .background(.black)
                    .cornerRadius(30)
                    .padding(.init(top: proxy.size.height * 40 / 839, leading: 0, bottom: 0, trailing: 0))
                    
                    
                    Spacer()
                }
                
                Text("To access Archangel Raphael Coptic Orthodox Church's Youtube Channel, click the link below.")
                    .foregroundStyle(isLight ? .black : .coral)
                    .font(.custom("Literata-Bold", size: 20))
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                    .padding(.top, proxy.size.height * 34 / 839)
                
                HStack{
                    Spacer()
                    
                    Image("youtube")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .padding(.top, proxy.size.height * 30 / 839)
                        .onTapGesture{
                            let website = "https://archangelraphael.org/"
                            
                            guard let url = URL(string: website) else{
                                fatalError("Website no longer accessible")
                            }
                            
                            openURL(url)
                            
                        }
                    
                    Spacer()
                }
                
            }
        }
        .background(
            LinearGradient(colors: backgroundColors(isLight: isLight),
                           startPoint: .bottom,
                           endPoint: .top)
        )
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    BroadcastView()
}
