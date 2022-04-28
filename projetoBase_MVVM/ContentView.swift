//
//  ContentView.swift
//  projetoBase_MVVM
//
//  Created by Roberto Edgar Geiss on 07/04/22.
//

import SwiftUI

struct ContentView: View
{
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    
    private let themeManager = ThemeManager()
    
    var body: some View
    {
        TabView
        {
            EmptyView()
                .tabItem
                    { Image(systemName: "network.badge.shield.half.filled")
                        Text("Inicial")
                    }
            QuotesScreen()
                .tabItem
                    { Image(systemName: "newspaper")
                        Text("Posts")
                    }
            SettingsView(darkModeEnabled: $darkModeEnabled, systemThemeEnabled: $systemThemeEnabled, themeManager: themeManager)
                .tabItem
                    { Image(systemName: "gearshape")
                        Text("Settings")
                    }
        }.onAppear
        { self.themeManager.handleTheme(darkMode: darkModeEnabled, system: systemThemeEnabled)}
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
