//
//  AMX.h
//  FirstApp
//
//  Created by Eric Dong on 4/27/23.
//
#pragma once

#import <Foundation/Foundation.h>

#define AMX_FLOAT32_CAPACITY 16

@interface AMX : NSObject

@property int M, K, N;
@property bool started;
@property bool initialized;
@property double latency, gflops;
@property float * matrix_a;
@property float * matrix_b;
@property float * matrix_c;

-(void) print_matrix: (float*) matrix;
-(void) gemm;
-(void) set_eye_matrix: (float*) matrix;
-(void) set_matrix_all: (float*) matrix to: (float) val;
-(void) set_random_matrix: (float *) matrix;
-(void) stress: (long) times;
-(void) stress_raw_compute: (long) times;
-(void) stress_ld: (long) times;
-(void) stress_ldst: (long) times;
-(void) stress_ldst_flush: (long) times;
-(void) stress_cpu_naive: (long) times;
-(void) async_stress_raw_compute: (long) times completion: (void(^)(void)) callback;

-(void) amx_set;
-(void) amx_clr;

@end
