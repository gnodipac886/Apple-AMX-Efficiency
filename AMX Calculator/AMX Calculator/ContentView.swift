//
//  ContentView.swift
//  AMX Calculator
//
//  Created by Eric Dong on 4/26/23.
//

import SwiftUI

var offScreenCol: Float = 7.0

struct resultMatrixView: View {
    @ObservedObject var matrixC: AMXMatrixWrapper
    
    var body: some View {
        Grid {
            ForEach(0..<Int(matrixC.numRows), id: \.self) { i in
                GridRow {
                    ForEach(0..<Int(matrixC.numCols), id: \.self) { j in
                        if (i < matrixC.fpmatrix.count) {
                            if (j < matrixC.fpmatrix[i].count) {
                                Text(String(format: "%.2f", matrixC.fpmatrix[i][j]))
                            }
                        }

                    }
                }
            }
        }
    }
}

struct resultView: View {
//    @State var matrix = [[Float]](repeating: [Float](repeating: 0.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY))
    @ObservedObject var matrixC: AMXMatrixWrapper
    @State var amx: AMX
    @State var latency: Double = 0.0
    @State var gflops: Double = 0.0
    @State var loop_pow: Float = 1
    @State var loops: Float = 10000000
    @State var AMXButtonText = "🙀AMX Stress🙀"
    @State var PyTorchButtonText = "🔥PyTorch Stress🗽"
    
    var body: some View {
        let matCView = resultMatrixView(matrixC: matrixC)
        VStack {
            Spacer(minLength: UIScreen.screenHeight * 0.1)
            if matrixC.numCols > offScreenCol {
                ScrollView(.horizontal) {
                    matCView
                }
            } else {
                matCView
            }
            Spacer(minLength: UIScreen.screenHeight * 0.05)
            Text(String(format: "Latency: %.2fs, GFLops: %.2f", latency, gflops))
            HStack {
                Text(String(format: "Loops: 10e%d", Int(loop_pow)))
                    .frame(maxWidth: UIScreen.screenWidth*0.25, alignment: .leading)
                    .padding(.leading)
                Slider(value: $loop_pow, in: 1...Float(8),step: 1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
            
            HStack {
                Button(action: {
                    self.amx.stress_raw_compute(Int(powf(10.0, loop_pow)))
                    self.latency = self.amx.latency;
                    self.gflops = self.amx.gflops;
                }) {
                    Text(self.PyTorchButtonText)
                    .frame(minWidth: 150)
                }
                .buttonStyle(.bordered)
                .tint(.red)
                
                Button(action: {
                    self.AMXButtonText = "⏳"
                    print(self.AMXButtonText)
                    self.amx.stress_raw_compute(Int(powf(10.0, loop_pow)))
                    self.AMXButtonText = "🙀AMX Stress🙀"
                    self.latency = self.amx.latency;
                    self.gflops = self.amx.gflops;
                }) {
                    Text(self.AMXButtonText)
                    .frame(minWidth: 150)
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
//            Spacer(minLength: UIScreen.screenHeight * 0.2)
        }
    }
}

struct ContentView: View {
    @State var amx = AMX.init()
    var matOptions = ["Matrix A", "Matrix B", "Matrix C"]
    @StateObject var matViewSelectedOption = MatrixViewSelector()
    @StateObject var matrixA: AMXMatrixWrapper = AMXMatrixWrapper()
    @StateObject var matrixB: AMXMatrixWrapper = AMXMatrixWrapper()
    @StateObject var matrixC: AMXMatrixWrapper = AMXMatrixWrapper()

    var body: some View {
        let matAView = matrixPageView(matrix: matrixA)
        let matBView = matrixPageView(matrix: matrixB)
        let matCView = resultView(matrixC: matrixC, amx: amx)
        let matSelView = matrixSelectView(matOptions: matOptions, matSelectedView: matViewSelectedOption, matrixA: matrixA, matrixB: matrixB, matrixC: matrixC, amx: amx)
        VStack {
            switch matViewSelectedOption.option {
                case matOptions[0]:matAView
                case matOptions[1]:matBView
                case matOptions[2]:matCView
                default: matAView
            }
            matSelView
        }
        .padding(.bottom, UIScreen.screenWidth * 0.2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
