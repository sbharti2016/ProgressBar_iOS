//
//  ContentView.swift
//  ProgressBar
//
//  Created by Sanjeev Bharti on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var percentage: CGFloat = 0.0
    
    var body: some View {
        
        VStack(spacing: 50) {
            
            Text("\(Int(percentage * 100))%").bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    progressViewWith(cornerRadius: 0)
                }
            
            Text("\(Int(percentage * 100))%").bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    progressViewWith(cornerRadius: 15)
                }
            
            Text("\(Int(percentage * 100))%").bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background {
                    progressViewWith(cornerRadius: 30)
                }
            
            Spacer()
            
            Button("Increase") {
                percentage += 0.1
            }
        }
        .padding()
        .onAppear(perform: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: DispatchWorkItem(block: {
                percentage = 0.3
            }))
        })
        
    }
    
    private func progressViewWith(cornerRadius: CGFloat) -> some View {
        
        return RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(Color.blue, lineWidth: 1.0)
            .padding(1.0)
            .background {
                GeometryReader { geometry in
                    HStack {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(Color.green)
                            .frame(width: geometry.size.width * percentage)
                            .animation(.bouncy, value: percentage)
                    }
                }
            }
            .clipShape(
                RoundedRectangle(cornerRadius: cornerRadius)
            )
    }
    
    
}

#Preview {
    ContentView()
        .padding()
}
