//
//  helpers.swift
//  AMX Calculator
//
//  Created by Eric Dong on 4/27/23.
//

import Foundation
import SwiftUI
import Accelerate

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

// A View wrapper to make the modifier easier to use
extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}

func stress_cpu_vector(times: Int, stresser: stressTestWrapper) -> Void {
    let M = Int32(AMX_FLOAT32_CAPACITY)
    let N = Int32(AMX_FLOAT32_CAPACITY)
    let K = Int32(AMX_FLOAT32_CAPACITY)
    let aStride = vDSP_Stride(1)
    let bStride = vDSP_Stride(1)
    let cStride = vDSP_Stride(1)
    let clock = ContinuousClock()
    let k: Double = pow(Double(AMX_FLOAT32_CAPACITY), 4)
    
    let A = [[Float]](repeating: [Float](repeating: 1.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY)).flatMap { $0 }
    let B = [[Float]](repeating: [Float](repeating: 1.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY)).flatMap { $0 }
    var C = [[Float]](repeating: [Float](repeating: 1.0, count: Int(AMX_FLOAT32_CAPACITY)), count: Int(AMX_FLOAT32_CAPACITY)).flatMap { $0 }
    
    let latency = clock.measure {
        for _ in 0..<times {
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
            vDSP_mmul(A, aStride, B, bStride, &C, cStride, vDSP_Length(M), vDSP_Length(N), vDSP_Length(K))
        }
    }
    
    stresser.latency = Double(latency.components.seconds) + Double(latency.components.attoseconds)/1e18
    stresser.gflops = (2.0 * Double(times) * k) / stresser.latency / 1e9
}

func async_stress(name: String, amx: AMX, times: Int, stresser: stressTestWrapper) async -> Void {
    switch name.lowercased() {
    case "amx raw":
        amx.stress_raw_compute(times)
        
    case "amx ld":
        amx.stress_ld(times)
        
    case "amx ldst":
        amx.stress_ldst(times)
        
    case "amx ldst flush":
        amx.stress_ldst_flush(times)
        
    case "cpu naïve":
        amx.stress_cpu_naive(times)
        
    case "cpu vector":
        stress_cpu_vector(times: times, stresser: stresser)
        
    default:
        amx.stress_raw_compute(times)
    }
}
