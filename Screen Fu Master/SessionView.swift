//
//  SessionView.swift
//  Screen Fu Master
//
//  Created by Tarik Merrylees on 28/05/2024.
//

import SwiftUI

struct SessionView: View {
    let title: String
    let sessions: [Session]
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            
            List(sessions) {
                session in
                SessionRow(status: session.status, skill: session.skill, target: session.target, progress: session.progress)
            }
            .listStyle(PlainListStyle())
        }

    }
}

struct Session: Identifiable {
    let id = UUID()
    let status: sessionStatus
    let skill: String
    let target: String
    let progress: progressType
}

enum sessionStatus {
    case inProgress
    case complete
    case notPracticed
}

enum progressType {
    case descriptive(String)
    case rating(Double)
    case time(TimeInterval)
    case reps(Double)
}



struct SessionRow: View {
    let status: sessionStatus
    let skill: String
    let target: String
    let progress: progressType
    
    var body: some View {
        HStack {
            Image(systemName: icon(for: status))
                .foregroundStyle(color(for: status))
            Text(skill)
            Spacer()
            Text(progressText(for: progress))
                .foregroundStyle(progressColor(for: status))
            Text("/ "+target)
        }
    }
    
    
    
    // functions
    
    func icon(for status: sessionStatus) -> String {
        switch status {
        case .inProgress:
            return "circle.fill"
        case .complete:
            return "checkmark.circle.fill"
        case .notPracticed:
            return "xmark.circle.fill"
        }
    }
    
    func color(for status: sessionStatus) -> Color {
        switch status {
        case .inProgress:
            return .orange
        case .complete:
            return .green
        case .notPracticed:
            return .red
        }
    }
    
    func progressColor(for status: sessionStatus) -> Color {
        switch status {
        case .inProgress:
            return .red
        case .complete:
            return .green
        case .notPracticed:
            return .primary
        }
    }
    
    func progressText(for progress: progressType) -> String {
        switch progress {
        case .descriptive(let description):
            return description
        case .rating(let rating):
            return String(format: "%.1f", rating)
        case .time(let timeInterval):
            let minutes = Int(timeInterval) / 60
            let seconds = Int(timeInterval) % 60
            return String(format: "%d:%02d", minutes, seconds)
        case .reps(let target):
            return String(format: "%.0f reps", target)
        }
    }

}
