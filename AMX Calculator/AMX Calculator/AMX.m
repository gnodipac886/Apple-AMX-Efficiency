//
//  AMX.m
//  FirstApp
//
//  Created by Eric Dong on 4/27/23.
//

#import <Foundation/Foundation.h>
#import "AMX.h"
#import "amx_instr.h"
#import "amx_fp32.h"
#import "amx_fmatmul.h"

@implementation AMX {
    float * matrix_aT;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.matrix_a   = (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
        matrix_aT       = (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
        self.matrix_b   = (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
        self.matrix_c   = (float *)malloc(AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * sizeof(float));
        
    }
    return self;
}

-(void) dealloc {
    free(self.matrix_a);
    free(matrix_aT);
    free(self.matrix_b);
    free(self.matrix_c);
}

-(void) set_eye_matrix: (float*) matrix {
    set_eye_matrix_fp32(matrix, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY);
}

-(void) set_matrix_all: (float*) matrix to: (float) val{
    set_matrix_fp32(matrix, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY, val);
}

-(void) set_random_matrix: (float *) matrix {
    set_random_matrix_fp32(matrix, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY);
}

-(void) print_matrix: (float*) matrix {
    print_fpmatrix(matrix, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY, sizeof(float));
}

-(void) stress: (long)times {
    NSDate * start = [NSDate date];
    for (int i = 0; i < times; i++) {
        [self set_random_matrix:[self matrix_a]];
        [self set_random_matrix:[self matrix_b]];
        [self gemm];
    }
    NSTimeInterval interval = [start timeIntervalSinceNow];
    interval = -interval;
    double flops = 2.0 * (times * AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY) / interval;
    double gflops = flops / (10e9);
    NSLog(@"Performed %ld times, took %fs, GFlops: %f, MACs: %f", times, interval, gflops, gflops/2.0);
}

-(void) stress_raw_compute: (long) times {
    uint64_t mac_mask = FP32_LANE_WIDTH_MODE(4) | FP32_X_OFFSET(0 * AMX_XY_REG_SIZE) | FP32_Y_OFFSET(0 * AMX_XY_REG_SIZE);
    [self amx_set];
    NSDate * start = [NSDate date];
    #pragma unroll
    for(int i = 0; i < AMX_FLOAT32_CAPACITY * times; i++) {
        AMX_MATFP(mac_mask);
    }
    NSTimeInterval interval = [start timeIntervalSinceNow];
    interval = -interval;
    [self amx_clr];
    double flops = 2.0 * (times * AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY * AMX_FLOAT32_CAPACITY) / interval;
    double gflops = flops / (10e9);
    NSLog(@"Performed raw gemm %ld times, took %fs, GFlops: %f, MACs: %f", times, interval, gflops, gflops/2.0);
}

-(void) amx_set {
    _amx_set();
}

-(void) amx_clr {
    _amx_clr();
}

-(void) gemm {
    matrix_transpose(self.matrix_a, matrix_aT, AMX_FLOAT32_CAPACITY, AMX_FLOAT32_CAPACITY, sizeof(float));
    [self amx_set];
    amx_fp32_gemm_16x16(matrix_aT, self.matrix_b, self.matrix_c, AMX_FLOAT32_CAPACITY);
    [self amx_clr];
}
@end