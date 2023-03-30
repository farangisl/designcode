//
//  TabBar.swift
//  DesignCode
//
//  Created by Махмадёрова Фарангис Шухратовна on 27.03.2023.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth: Double = 0
    
    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom > 20
            
            HStack {
                buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: hasHomeIndicator ? 88 : 62, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: hasHomeIndicator ? 34 : 0, style: .continuous))
            .background(
                background
            )
            .overlay(
                overlay
            )
            .strokeStyle(cornerRadius: hasHomeIndicator ? 34 : 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        }
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = item.tab
                    color = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 50, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
//                            Text("\(proxy.size.width)")
//                            tabItemWidth = proxy.size.width
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var background: some View {
        HStack {
            if selectedTab == .home {
                Circle().fill(color).frame(width: tabItemWidth)
                Spacer()
            } else if selectedTab == .explore {
                Spacer()
                Circle().fill(color).frame(width: tabItemWidth)
                Spacer()
                Spacer()
            } else if selectedTab == .notification {
                Spacer()
                Spacer()
                Circle().fill(color).frame(width: tabItemWidth)
                Spacer()
            } else if selectedTab == .library {
                Spacer()
                Circle().fill(color).frame(width: tabItemWidth)
            }
        }
        .padding(.horizontal, 8)
    }
    
    var overlay: some View {
        HStack {
            if selectedTab == .home {
                Rectangle()
                    .fill(color)
                    .frame(width: 30, height: 5)
                    .cornerRadius(3)
                    .frame(width: tabItemWidth)
                    .frame(maxHeight: .infinity, alignment: .top)
                Spacer()
            } else if selectedTab == .explore {
                Spacer()
                Rectangle()
                    .fill(color)
                    .frame(width: 30, height: 5)
                    .cornerRadius(3)
                    .frame(width: tabItemWidth)
                    .frame(maxHeight: .infinity, alignment: .top)
                Spacer()
                Spacer()
            } else if selectedTab == .notification {
                Spacer()
                Spacer()
                Rectangle()
                    .fill(color)
                    .frame(width: 30, height: 5)
                    .cornerRadius(3)
                    .frame(width: tabItemWidth)
                    .frame(maxHeight: .infinity, alignment: .top)
                Spacer()
            } else if selectedTab == .library {
                Spacer()
                Rectangle()
                    .fill(color)
                    .frame(width: 30, height: 5)
                    .cornerRadius(3)
                    .frame(width: tabItemWidth)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .padding(.horizontal, 8)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
}
