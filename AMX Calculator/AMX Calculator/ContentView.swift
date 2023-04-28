//
//  ContentView.swift
//  AMX Calculator
//
//  Created by Eric Dong on 4/26/23.
//

import SwiftUI

struct resultView: View {
    @State var matrix = [[Float]](repeating: [Float](repeating: 0.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY))
    var matDimM: Int
    var matDimN: Int
    var latency: Float = 0.0
    var gflops: Float = 0.0
    var loops: Int = 10000
    
    var body: some View {
        VStack {
            Spacer(minLength: UIScreen.screenHeight * 0.2)
            ScrollView(.horizontal) {
                Grid(horizontalSpacing: 10) {
                    ForEach(0..<Int(matDimM), id: \.self) { i in
                        GridRow {
                            ForEach(0..<Int(matDimN), id: \.self) { j in
                                if (i < matrix.count) {
                                    if (j < matrix[i].count) {
                                        Text(String(format: "%.2f", matrix[i][j]))
                                    }
                                }
                                    
                            }
                        }
                    }
                }
            }
            Spacer(minLength: UIScreen.screenHeight * 0.05)
            Text(String(format: "Loops: %d, Latency: %.2fs, GFlops: %.2f", loops, latency, gflops))
            HStack {
                Button("Stress") {
                    
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
//            Spacer(minLength: UIScreen.screenHeight * 0.2)
        }
    }
}

struct ContentView: View {
    @State var amx = AMX()
    var matOptions = ["Matrix A", "Matrix B", "Matrix C"]
    @StateObject var matViewSelectedOption = MatrixViewSelector()
    @StateObject var matrixA: AMXMatrixWrapper = AMXMatrixWrapper()
    @StateObject var matrixB: AMXMatrixWrapper = AMXMatrixWrapper()
    @StateObject var numRowsA = MatrixSize()
    @StateObject var numColsA = MatrixSize()
    @StateObject var numRowsB = MatrixSize()
    @StateObject var numColsB = MatrixSize()

    var body: some View {
        let matAView = matrixPageView(numRows: numRowsA, numCols: numColsA, matrix: matrixA)
        let matBView = matrixPageView(numRows: numRowsB, numCols: numColsB,  matrix: matrixB)
        let matCView = resultView(matDimM: 16, matDimN: 16)
        let matSelView = matrixSelectView(matOptions: matOptions, matSelectedView: matViewSelectedOption)
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
