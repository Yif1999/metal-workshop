//
//  Shaders.metal
//  02-transformation
//
//  Created by 於怿丰 on 2023/3/18.
//

#include <metal_stdlib>
using namespace metal;

#include "ShaderTypes.h"

struct VertexIn {
    float4 position [[ attribute(0) ]];
};

struct Fragment {
    float4 position [[position]];
    float4 color;
};

vertex Fragment vertexShader(
        const VertexIn vertex_in [[ stage_in ]],
        constant matrix_float4x4 &model [[ buffer(1) ]],
        constant CameraParameters &camera [[ buffer(2) ]])
{
    
    Fragment output;
    output.position = camera.projection * camera.view * model * vertex_in.position;
    output.color = float4(0.6,0.3,0.3,1.0);
    
    return output;
}

fragment float4 fragmentShader(Fragment input [[stage_in]]) {
    return input.color;
}
