//
//  Settings.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 2/8/24.
//

import SwiftUI

struct Settings: View {
    @AppStorage("isLight") var isLight:Bool = true
    @AppStorage("onlyWifi") var onlyWifi:Bool = false
    var body: some View {
        GeometryReader{ proxy in
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    
                    Text("Settings")
                        .padding(.top, proxy.size.height * 5 / 839)
                        .foregroundStyle(isLight ? .churchOrange : .coral)
                        .font(.custom("Literata-Bold", size: 32))
                    
                    Spacer()
                }
                
                //Preferences
                
                HStack{
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .padding(.top, 5)
                        
                    
                    Text("Preferences")
                        .font(.custom("Literata-Bold", size: 18))
                        
                    Spacer()
                }
                .padding(.top, proxy.size.height * 17 / 839)
                .padding(.leading, proxy.size.width * 40 / 430)
                .foregroundStyle(isLight ? .black : .white)
                
                Divider()
                    .overlay(isLight ? .gray : .white)
                    .padding(.horizontal, proxy.size.width * 40 / 430)
                    
                
                
                List{
                    HStack{
                        Spacer()
                        HStack{

                            Toggle("Dark Mode", isOn: !$isLight)
                                .font(.custom("Literata-Light", size: 18))
                                .foregroundStyle(isLight  ? .black : .coral)
                                .tint(isLight ? .green : .coral)
                        }
                        .frame(width: proxy.size.width * 350/430)
                        
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                    HStack{
                        Spacer()
                        HStack{

                            Toggle("Only Download Over Wi-Fi", isOn: $onlyWifi)
                                .font(.custom("Literata-Light", size: 18))
                                .foregroundStyle(isLight  ? .black : .coral)
                                .tint(isLight ? .green : .coral)
                        }
                        .frame(width: proxy.size.width * 350/430)
                        
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                }
                .listStyle(.plain)
                .background(.clear)
                .padding(.top, proxy.size.height * 8 / 839)
                
                
                
                
                
                
                
            }
            
        }
        .background(LinearGradient(colors: backgroundColors(isLight: isLight), startPoint: .bottom, endPoint: .top))
    }
}

#Preview {
    Settings()
}
