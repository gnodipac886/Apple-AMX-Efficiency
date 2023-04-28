//
//  helper_views.swift
//  AMX Calculator
//
//  Created by Eric Dong on 4/27/23.
//

import Foundation
import SwiftUI

class MatrixViewSelector: ObservableObject {
    @Published var option: String = "Matrix A"
}

class AMXMatrixWrapper: ObservableObject {
    @Published var numRows: Float = 1
    @Published var numCols: Float = 1
    @Published var fpmatrix = [[Float]](repeating: [Float](repeating: 0.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY))
    @Published var matrix = [[String]](repeating: [String](repeating: "", count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY))
}

struct matdimSliderView: View {
    var name: String
    @ObservedObject var matrix: AMXMatrixWrapper
    var body: some View {
        HStack {
            Text("\(name)s:")
                .frame(maxWidth: UIScreen.screenWidth*0.125, alignment: .leading)
            if name == "Row" {
                Text("\(Int(matrix.numRows))")
                    .frame(alignment: .leading)
                Slider(value: $matrix.numRows, in: 1...Float(AMX_FLOAT32_CAPACITY),step: 1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            } else if name == "Col" {
                Text("\(Int(matrix.numCols))")
                    .frame(alignment: .leading)
                Slider(value: $matrix.numCols, in: 1...Float(AMX_FLOAT32_CAPACITY),step: 1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding(.horizontal, UIScreen.screenWidth * 0.06)
    }
}

struct inputMatrixView: View {
    var rowSize: Float = 1
    var colSize: Float = 1
    @ObservedObject var strMatrix: AMXMatrixWrapper
    private enum Field: Int, CaseIterable {
        case typing
    }
    @FocusState private var focusedField: Field?
    var body: some View {
        Grid(horizontalSpacing: 10) {
            ForEach(0..<Int(rowSize), id: \.self) { i in
                GridRow {
                    ForEach(0..<Int(colSize), id: \.self) { j in
                        if (i < strMatrix.matrix.count) {
                            if (j < strMatrix.matrix[i].count) {
                                TextField(String(format: "%2d,%2d", i+1, j+1), text: $strMatrix.matrix[i][j])
                                    .frame(width: 45, alignment: .center)
                                    .focused($focusedField, equals: .typing)
                                    .keyboardType(.decimalPad)
                            }
                        }
                            
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            focusedField = nil
                        }
                        .padding(.leading, UIScreen.screenWidth * 0.8)
                    }
                }
            }
            Spacer()
        }
    }
}

struct matrixPageView: View {
    @StateObject var matrix: AMXMatrixWrapper
    @State private var orientation = UIDevice.current.orientation
    @State private var prev_orientation = UIDevice.current.orientation
    
    var body: some View {
        let rowSlider = matdimSliderView(name: "Row", matrix: matrix)
        let colSlider = matdimSliderView(name: "Col", matrix: matrix)
        let matrixView = inputMatrixView(rowSize: matrix.numRows, colSize: matrix.numCols, strMatrix: matrix)
        VStack {
            if matrix.numCols > offScreenCol {
                ScrollView(.horizontal) {
                    matrixView
                }
                .padding([.vertical, .horizontal])
                .frame(maxHeight: UIScreen.screenWidth*0.85)
            } else {
                matrixView
                .padding([.vertical, .horizontal])
                .frame(maxHeight: UIScreen.screenWidth*0.85)
            }
            Spacer(minLength: UIScreen.screenWidth*0.15)
            rowSlider
            colSlider
        }
        .padding(.top, UIScreen.screenWidth * 0.25)
        .onRotate { newOrientation in
            prev_orientation = orientation
            orientation = newOrientation
        }
        
    }
}

func AMXGemm(amx: AMX, matrixA: AMXMatrixWrapper, matrixB: AMXMatrixWrapper, matrixC: AMXMatrixWrapper) {
    var M = 0
    var N = 0
    
    for i in 0..<Int(AMX_FLOAT32_CAPACITY) {
        for j in 0..<Int(AMX_FLOAT32_CAPACITY) {
            if matrixA.matrix[i][j] != "" , let val = Float(matrixA.matrix[i][j]){
                matrixA.fpmatrix[i][j] = val
                amx.matrix_a[i * Int(AMX_FLOAT32_CAPACITY) + j] = val
                M = max(M, i)
//                print("M: \(M)")
            } else {
                matrixA.fpmatrix[i][j] = 0.0
                amx.matrix_a[i * Int(AMX_FLOAT32_CAPACITY) + j] = 0.0
            }
            
            if matrixB.matrix[i][j] != "" , let val = Float(matrixB.matrix[i][j]){
                matrixB.fpmatrix[i][j] = val
                amx.matrix_b[i * Int(AMX_FLOAT32_CAPACITY) + j] = val
                N = max(N, j)
//                print("N: \(N)")
            } else {
                matrixB.fpmatrix[i][j] = 0.0
                amx.matrix_b[i * Int(AMX_FLOAT32_CAPACITY) + j] = 0.0
            }
        }
    }
    
    matrixC.numRows = Float(M) + 1
    matrixC.numCols = Float(N) + 1
    
    if (amx.initialized) {
        amx.gemm()
        for i in 0..<Int(AMX_FLOAT32_CAPACITY) {
            for j in 0..<Int(AMX_FLOAT32_CAPACITY) {
                matrixC.fpmatrix[i][j] = amx.matrix_c[i * Int(AMX_FLOAT32_CAPACITY) + j]
            }
        }
    } else {
        print("AMX NOT INITIALIZED")
    }
}

struct matrixSelectView: View {
    var matOptions: Array<String>
    @ObservedObject var matSelectedView: MatrixViewSelector
    @ObservedObject var matrixA: AMXMatrixWrapper
    @ObservedObject var matrixB: AMXMatrixWrapper
    @ObservedObject var matrixC: AMXMatrixWrapper
    @State var amx: AMX
    
    var body: some View {
        HStack() {
            ForEach(matOptions, id: \.self) { matCase in
                Button(matCase) {
                    self.matSelectedView.option = matCase
                    if matCase == matOptions[2] {
                        AMXGemm(amx: amx, matrixA: matrixA, matrixB: matrixB, matrixC: matrixC)
                    }
                }
                .buttonStyle(.bordered)
                .tint(matSelectedView.option == matCase ? .blue : .gray)
            }
        }
    }
}
