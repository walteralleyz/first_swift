//
//  ContentView.swift
//  Calculator
//
//  Created by MacHome on 02/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var result = 0
    @State var op = ""
    
    let symbols = [
        Symbol(symbols: ["7", "8", "9", "+"]),
        Symbol(symbols: ["4", "5", "6", "-"]),
        Symbol(symbols: ["1", "2", "3", "*"]),
        Symbol(symbols: ["C", "", "0", "/"])
    ]
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Spacer()
            
            HStack {
                Text("\(String(result))")
                    .padding()
                    .font(.system(size: CGFloat(80 - String(result).count)))
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: true, vertical: false)
            }
            
            ForEach(symbols) {s in
                HStack {
                    Button(s.symbols[0]) {
                        if s.symbols[0] == "C" {
                            result = 0
                            return
                        }
                        
                        result = calcResult(op: op, result: result, number: s.symbols[0])
                        
                        op = ""
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                    Button(s.symbols[1]) {
                        result = calcResult(op: op, result: result, number: s.symbols[1])
                        
                        op = ""
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                    Button(s.symbols[2]) {
                        result = calcResult(op: op, result: result, number: s.symbols[2])
                        
                        op = ""
                    }
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                    Button(s.symbols[3]) {
                        op = s.symbols[3]
                    }
                        .padding(.vertical, 40)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                }
                .foregroundColor(Color.white)
                .font(.system(size: CGFloat(30)))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

func calcResult(op: String, result: Int, number: String) -> Int {
    var n = Int(number)!
    
    switch op {
    case "+":
        return result + n

    case "-":
        return result - n
        
    case "*":
        return result * n
        
    case "/":
        return result / n
        
    default:
        return n
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Symbol: Identifiable {
    var id = UUID()
    var symbols: [String]
}
