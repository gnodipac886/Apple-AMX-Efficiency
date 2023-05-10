//
//  ContentView.swift
//  AMX Calculator
//
//  Created by Eric Dong on 4/26/23.
//

import SwiftUI

var offScreenCol: Float = 7.0

struct stressButtonView: View {
    @State var amx: AMX
    @State var btn_name: String
    @ObservedObject var stresser: stressTestWrapper
    
    var body: some View {
        Button(action: {
            if ((btn_name.contains("CPU") && stresser.loop_pow >= 4) || (btn_name.contains("AMX") && stresser.loop_pow > 5)) {
                stresser.is_computing = true
            }
            Task {
                await async_stress(name: btn_name, amx: self.amx, times: Int(powf(10.0, stresser.loop_pow)), stresser: stresser)
//                        await self.amx.async_stress_raw_compute(Int(powf(10.0, loop_pow)))
                stresser.is_computing = false
                if (!btn_name.contains("Vector")) {
                    self.stresser.latency = self.amx.latency;
                    self.stresser.gflops = self.amx.gflops;
                }
            }
        }) {
            Text(stresser.is_computing ? "⏳" : btn_name.replacingOccurrences(of: " ", with: "\n"))
//            .frame(minWidth: 5)
        }
        .buttonStyle(.bordered)
        .tint(.red)
        .disabled(stresser.is_computing)
    }
}

struct resultView: View {
//    @State var matrix = [[Float]](repeating: [Float](repeating: 0.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY))
    @ObservedObject var matrixC: AMXMatrixWrapper
    @State var amx: AMX
    @StateObject var stresser: stressTestWrapper = stressTestWrapper()
    
    var body: some View {
        let matCView = resultMatrixView(matrixC: matrixC)
        let amxRawBtnView = stressButtonView(amx: self.amx, btn_name: "AMX RAW", stresser: self.stresser)
        let amxLDBtnView = stressButtonView(amx: self.amx, btn_name: "AMX LD", stresser: self.stresser)
        let amxLDSTBtnView = stressButtonView(amx: self.amx, btn_name: "AMX LDST", stresser: self.stresser)
        let cpuNaiveBtnView = stressButtonView(amx: self.amx, btn_name: "CPU Naïve", stresser: self.stresser)
        let cpuVectorBtnView = stressButtonView(amx: self.amx, btn_name: "CPU Vector", stresser: self.stresser)
        
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
            Text(String(format: "Latency: %.2fs, GFLops: %.4f", stresser.latency, stresser.gflops))
            HStack {
                Text(String(format: "Loops: 10e%d", Int(stresser.loop_pow)))
                    .frame(maxWidth: UIScreen.screenWidth*0.25, alignment: .leading)
                    .padding(.leading)
                Slider(value: $stresser.loop_pow, in: 1...Float(8),step: 1)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
            }
            
            HStack {
                cpuNaiveBtnView
                cpuVectorBtnView
                amxRawBtnView
                amxLDBtnView
                amxLDSTBtnView
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
