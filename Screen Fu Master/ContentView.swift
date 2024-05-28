//
//  ContentView.swift
//  Screen Fu Master
//
//  Created by Tarik Merrylees on 27/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SessionView(
                title: "Swimming",
                sessions: [
                    Session(status: .inProgress, skill: "400m Freestyle", target: "10:00", progress: .time(672)),
                    Session(status: .complete, skill: "100m Freestyle", target: "01:30", progress: .time(87)),
                    Session(status: .notPracticed, skill: "100m Butterfly", target: "01:45", progress: .descriptive(""))
                ]
            )
        }
    }
}

#Preview {
    ContentView()
}
