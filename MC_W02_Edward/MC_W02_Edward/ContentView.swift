//  ContentView.swift
//  MC_W02_Edward
//
//  Created by student on 18/09/25.
//
import SwiftUI
struct ContentView: View {
    @State private var isOn: Bool = false
    @State private var volume: Double = 0.5
    @State private var name: String = ""
    @State private var point = 80
    private func actionButton(_ title: String, action: @escaping () -> Void) -> some View {
            Button(title, action: action)
                .padding(.horizontal, 16).padding(.vertical,10)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
        
        }
        
        private func progressCard(score: Int) ->
        some View {
            VStack {
                Text("Current Score").font(.headline)
                ProgressView(value: Double(score),total:100)
                Text("\(score)/100").foregroundStyle(.secondary)
            }
            .padding()
            .background(Color.green.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }

    var body: some View {
        VStack {
            
            Toggle("Enable Notifications", isOn:
                $isOn)
                .padding()
            Text( isOn ? "Hore" : "Yahh")
            
            Slider(value: $volume, in: 0...100)
            Text("Volume Sekarang: \(volume)%")
            
            TextField("What's your name?", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            Text(name == "" ? "Hai" : "Hello \(name)!")
            
            progressCard(score: point)
            HStack {
                actionButton("Add 10") {
                    point += 10 }
                actionButton("Reset") {
                    point = 0 }
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
