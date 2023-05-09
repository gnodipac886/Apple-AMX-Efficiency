import pandas as pd
import numpy as np
from loaders import *
import os
# If the following code doesn't run, uncomment and run this bash command
#!accelergyTables -r /home/workspace/final-project/PIM_estimation_tables

pim_accelergy_result = run_accelergy(
    ConfigRegistry.OUT_LARGE_ARCH_L2_L3_DRAM, #OUT_LARGE_ARCH_L2_L3_DRAM
    ConfigRegistry.OUT_LARGE_COMPONENTS_DIR
);
print(pim_accelergy_result.ert_verbose)
#print(ConfigRegistry.TINY_LAYER_PROB)

layers_path = "layer_shapes/AlexNet"
file_names = os.listdir(layers_path)
#print(file_names)

# file_names = [
#     "tiny_layer.yaml",
#     "small_layer.yaml",
#     "medium_layer.yaml",
#     "point_wise.yaml",
#     "depth_wise.yaml"
# ]

for file in file_names:
    pim_large_stats_low_power, pim_large_loops_low_power = run_timeloop_mapper(
        ConfigRegistry.OUT_LARGE_ARCH_L2_L3_DRAM, #OUT_LARGE_ARCH_L2_L3_DRAM
        pim_accelergy_result.art,
        pim_accelergy_result.ert,
        ConfigRegistry.OUT_LARGE_CONSTRAINTS_MAP,
        ConfigRegistry.OUT_LARGE_CONSTRAINTS_ARCH,
        ConfigRegistry.OUT_LARGE_MAPPER,
        Path("layer_shapes/AlexNet/" + file)
    );
    name = "outputs/L2_L3_DRAM" + file + ".txt"
    file1 = open(name, "w")
    file1.write(pim_large_stats_low_power)
    file1.write(pim_large_loops_low_power)
    file1.close()
    print(pim_large_stats_low_power)