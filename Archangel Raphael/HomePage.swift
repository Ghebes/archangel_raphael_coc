//
//  HomePage.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/23/24.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("isLight") var isLight: Bool = true
    
    ///Background colors chosen based on the App Storage object isLight
    var backgroundColors: [Color] {
        if isLight{
            return [Color("lightblue"), Color("lightblue").opacity(0.05)]
        }else{
            return [Color("darkgray")]
        }
    }
    
    var body: some View {
        GeometryReader {proxy in
            VStack{
                HStack{
                    Spacer()
                    
                    Text("Archangel Raphael")
                        .foregroundStyle(isLight ? .churchOrange : .coral)
                        .font(.custom("Literata-Bold", size: 32))
                        
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    VStack{
                        HStack{
                            Text("Verse of the Day")
                                .font(.custom("Literata-Bold", size: 24))
                                .foregroundStyle(isLight ? .textGray : .coral)
                            Spacer()
                        }
                        .padding([.leading, .top], 10)
                        
                        Spacer()
                        
                        
                    }
                    .frame(width: proxy.size.width * 351 / 430, height: proxy.size.height * 177 / 839)
                    .background(isLight ? .white: .lightgray)
                    .cornerRadius(20)
                    .padding(.top, proxy.size.height * 28 / 839)
                    
                    Spacer()
                }
                .onAppear{
                    print(proxy.size.height)
                }
            }

        }
        .frame(width: .infinity, height: .infinity)
        .background(
            LinearGradient(colors: backgroundColors,
                           startPoint: .bottom,
                           endPoint: .top)
        )
    
    }
}

#Preview {
    HomePage()
}
