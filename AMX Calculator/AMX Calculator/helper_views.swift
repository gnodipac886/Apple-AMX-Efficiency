//
//  helper_views.swift
//  AMX Calculator
//
//  Created by Eric Dong on 4/27/23.
//

import Foundation
import SwiftUI

class MatrixSize: ObservableObject {
    @Published var size: Float = 1
}

class MatrixViewSelector: ObservableObject {
    @Published var option: String = "Matrix A"
}

class AMXMatrixWrapper: ObservableObject {
//    @Published var matrix = [[Float]](repeating: [Float](repeating: 0.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY))
    @Published var matrix = [[String]](repeating: [String](repeating: "", count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY))
}

struct matdimSliderView: View {
    var name: String
    @ObservedObject var matsize: MatrixSize
    var body: some View {
        HStack {
            Text("\(name)s:")
                .frame(maxWidth: UIScreen.screenWidth*0.11, alignment: .leading)
            Text("\(Int(matsize.size))")
                .frame(alignment: .leading)
            Slider(value: $matsize.size, in: 1...Float(AMX_FLOAT32_CAPACITY),step: 1)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal, UIScreen.screenWidth * 0.1)
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
//                Text(strMatrix.matrix[0][0])
                GridRow {
                    ForEach(0..<Int(colSize), id: \.self) { j in
                        if (i < strMatrix.matrix.count) {
                            if (j < strMatrix.matrix[i].count) {
                                TextField(String(format: "%2d,%2d", i+1, j+1), text: $strMatrix.matrix[i][j])
                                    .frame(width: 45)
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
    @StateObject var numRows: MatrixSize
    @StateObject var numCols: MatrixSize
    @StateObject var matrix: AMXMatrixWrapper
    @State private var orientation = UIDevice.current.orientation
    @State private var prev_orientation = UIDevice.current.orientation
    
    var body: some View {
        let rowSlider = matdimSliderView(name: "Row", matsize: numRows)
        let colSlider = matdimSliderView(name: "Col", matsize: numCols)
        let matrixView = inputMatrixView(rowSize: numRows.size, colSize: numCols.size, strMatrix: matrix)
        VStack {
            if (orientation.isLandscape || (orientation.isFlat && prev_orientation.isLandscape))  {
                VStack {
                    ScrollView([.vertical, .horizontal]) {
                        matrixView
                    }
                    Spacer()
                    rowSlider
                    colSlider
                }
                .padding(.top, UIScreen.screenWidth * 0.1)
            } else {
                VStack {
                    ScrollView(.horizontal) {
                        matrixView
                    }
                    .padding([.vertical, .horizontal])
                    .frame(maxHeight: UIScreen.screenWidth*0.85)
                    Spacer(minLength: UIScreen.screenWidth*0.2)
                    rowSlider
                    colSlider
                }
                .padding(.top, UIScreen.screenWidth * 0.4)
            }
        }
        .onRotate { newOrientation in
            prev_orientation = orientation
            orientation = newOrientation
        }
        
    }
}


struct matrixSelectView: View {
    var matOptions: Array<String>
    @ObservedObject var matSelectedView: MatrixViewSelector
    
    var body: some View {
        HStack() {
            ForEach(matOptions, id: \.self) { matCase in
                Button(matCase) {
                    self.matSelectedView.option = matCase
                }
                .buttonStyle(.bordered)
                .tint(matSelectedView.option == matCase ? .blue : .gray)
            }
        }
    }
}
