//
//  TabNavigation.swift
//  Archangel Raphael
//
//  Created by Michael Ghebranious on 1/25/24.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case home = "Home"
    case about = "About"
    case feedback = "Feedback"
    case confession = "Confession"
    case settings = "Settings"
}

struct TabNavigation: View {
    ///Variable that determines which screen is displayed from the tab bar
    @State var currentTab: Tab = .home
    
    @AppStorage("isLight") var isLight: Bool = true
    
    ///Function that returns the image names for each of the tabs
    func imageForTab(currentTab: Tab) -> String{
        switch(currentTab){
        case .home:
            return "house"
        case .about:
            return "questionmark.circle"
        case .feedback:
            return "message"
        case .confession:
            return "plus"
        case .settings:
            return "gearshape"
        }
    }
    var body: some View {
        ZStack{
            switch (currentTab){
            case .home:
                HomePage()
            case .about:
                HomePage()
            case .feedback:
                HomePage()
            case .confession:
                HomePage()
            case .settings:
                HomePage()
            }
            
            GeometryReader{proxy in
                VStack{
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        HStack(spacing: proxy.size.width  * 50/430){
                            ForEach(Tab.allCases, id: \.rawValue){tab in
                                
                                ZStack{
                                    if(currentTab == tab){
                                        Circle()
                                            .fill(.lightblue.opacity(0.9))
                                            .frame(width: 60, height: 60)
                                            .offset(y: -8)
                                            .shadow(radius: 4)
                                    }
                                    Image(systemName: imageForTab(currentTab: tab))
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .offset(y: currentTab == tab ? -8 : 0)
                                        .foregroundStyle(currentTab == tab ? .white : .black)
                                    
                                    
                                }
                                .onTapGesture{
                                    withAnimation(.spring()){
                                        currentTab = tab
                                    }
                                }
                            }
                        }
                        .frame(width: proxy.size.width * 400/430, height: proxy.size.height * 91 / 839)
                        .background(isLight ? .white : .mediumGray)
                        .cornerRadius(20)
                        .padding(.bottom, 6)
                        
                        Spacer()
                    }
                }
                .onAppear{
                    print("CHECKING GIT")
                }
            }
        }
        
        
        
        
    }
}

#Preview {
    TabNavigation()
}
