# frozen_string_literal: true

module SDL3
  module Raw
    SDL_GPUPrimitiveType = enum :SDL_GPU_PRIMITIVETYPE_TRIANGLELIST, 0,
                                :SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP,
                                :SDL_GPU_PRIMITIVETYPE_LINELIST,
                                :SDL_GPU_PRIMITIVETYPE_LINESTRIP,
                                :SDL_GPU_PRIMITIVETYPE_POINTLIST

    SDL_GPULoadOp = enum :SDL_GPU_LOADOP_LOAD, 0,
                         :SDL_GPU_LOADOP_CLEAR,
                         :SDL_GPU_LOADOP_DONT_CARE

    SDL_GPUStoreOp = enum :SDL_GPU_STOREOP_STORE, 0,
                          :SDL_GPU_STOREOP_DONT_CARE,
                          :SDL_GPU_STOREOP_RESOLVE,
                          :SDL_GPU_STOREOP_RESOLVE_AND_STORE

    SDL_GPUIndexElementSize = enum :SDL_GPU_INDEXELEMENTSIZE_16BIT, 0,
                                   :SDL_GPU_INDEXELEMENTSIZE_32BIT

    SDL_GPUTextureFormat = enum :SDL_GPU_TEXTUREFORMAT_INVALID, 0,
                                :SDL_GPU_TEXTUREFORMAT_A8_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_R8_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_R8G8_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_R16_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R8_SNORM,
                                :SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
                                :SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
                                :SDL_GPU_TEXTUREFORMAT_R16_SNORM,
                                :SDL_GPU_TEXTUREFORMAT_R16G16_SNORM,
                                :SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM,
                                :SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT,
                                :SDL_GPU_TEXTUREFORMAT_R8_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R16_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R32_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R32G32_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT,
                                :SDL_GPU_TEXTUREFORMAT_R8_INT,
                                :SDL_GPU_TEXTUREFORMAT_R8G8_INT,
                                :SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT,
                                :SDL_GPU_TEXTUREFORMAT_R16_INT,
                                :SDL_GPU_TEXTUREFORMAT_R16G16_INT,
                                :SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT,
                                :SDL_GPU_TEXTUREFORMAT_R32_INT,
                                :SDL_GPU_TEXTUREFORMAT_R32G32_INT,
                                :SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT,
                                :SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_D16_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_D24_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
                                :SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT,
                                :SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT

    SDL_GPUTextureUsageFlags = enum :SDL_GPU_TEXTUREUSAGE_SAMPLER, 0x00000001,
                                    :SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, 0x00000002,
                                    :SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, 0x00000004,
                                    :SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ, 0x00000008,
                                    :SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ, 0x00000010,
                                    :SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE, 0x00000020,
                                    :SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, 0x00000040

    SDL_GPUTextureType = enum :SDL_GPU_TEXTURETYPE_2D, 0,
                              :SDL_GPU_TEXTURETYPE_2D_ARRAY,
                              :SDL_GPU_TEXTURETYPE_3D,
                              :SDL_GPU_TEXTURETYPE_CUBE,
                              :SDL_GPU_TEXTURETYPE_CUBE_ARRAY

    SDL_GPUSampleCount = enum :SDL_GPU_SAMPLECOUNT_1, 0,
                              :SDL_GPU_SAMPLECOUNT_2,
                              :SDL_GPU_SAMPLECOUNT_4,
                              :SDL_GPU_SAMPLECOUNT_8

    SDL_GPUCubeMapFace = enum :SDL_GPU_CUBEMAPFACE_POSITIVEX, 0,
                              :SDL_GPU_CUBEMAPFACE_NEGATIVEX,
                              :SDL_GPU_CUBEMAPFACE_POSITIVEY,
                              :SDL_GPU_CUBEMAPFACE_NEGATIVEY,
                              :SDL_GPU_CUBEMAPFACE_POSITIVEZ,
                              :SDL_GPU_CUBEMAPFACE_NEGATIVEZ

    SDL_GPUBufferUsageFlags = enum :SDL_GPU_BUFFERUSAGE_VERTEX, 0x00000001,
                                   :SDL_GPU_BUFFERUSAGE_INDEX, 0x00000002,
                                   :SDL_GPU_BUFFERUSAGE_INDIRECT, 0x00000004,
                                   :SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ, 0x00000008,
                                   :SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ, 0x00000010,
                                   :SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE, 0x00000020

    SDL_GPUTransferBufferUsage = enum :SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD, 0,
                                      :SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD

    SDL_GPUShaderStage = enum :SDL_GPU_SHADERSTAGE_VERTEX, 0,
                              :SDL_GPU_SHADERSTAGE_FRAGMENT

    SDL_GPUShaderFormat = enum :SDL_GPU_SHADERFORMAT_INVALID, 0x00000000,
                               :SDL_GPU_SHADERFORMAT_PRIVATE, 0x00000001,
                               :SDL_GPU_SHADERFORMAT_SPIRV, 0x00000002,
                               :SDL_GPU_SHADERFORMAT_DXBC, 0x00000004,
                               :SDL_GPU_SHADERFORMAT_DXIL, 0x00000008,
                               :SDL_GPU_SHADERFORMAT_MSL, 0x00000010,
                               :SDL_GPU_SHADERFORMAT_METALLIB, 0x00000020

    SDL_GPUVertexElementFormat = enum :SDL_GPU_VERTEXELEMENTFORMAT_INVALID, 0,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_INT,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_INT2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_INT3,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_INT4,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UINT,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UINT4,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
                                      :SDL_GPU_VERTEXELEMENTFORMAT_HALF4

    SDL_GPUVertexInputRate = enum :SDL_GPU_VERTEXINPUTRATE_VERTEX, 0,
                                  :SDL_GPU_VERTEXINPUTRATE_INSTANCE

    SDL_GPUFillMode = enum :SDL_GPU_FILLMODE_FILL, 0,
                           :SDL_GPU_FILLMODE_LINE

    SDL_GPUCullMode = enum :SDL_GPU_CULLMODE_NONE, 0,
                           :SDL_GPU_CULLMODE_FRONT,
                           :SDL_GPU_CULLMODE_BACK

    SDL_GPUFrontFace = enum :SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE, 0,
                            :SDL_GPU_FRONTFACE_CLOCKWISE

    SDL_GPUCompareOp = enum :SDL_GPU_COMPAREOP_INVALID, 0,
                            :SDL_GPU_COMPAREOP_NEVER,
                            :SDL_GPU_COMPAREOP_LESS,
                            :SDL_GPU_COMPAREOP_EQUAL,
                            :SDL_GPU_COMPAREOP_LESS_OR_EQUAL,
                            :SDL_GPU_COMPAREOP_GREATER,
                            :SDL_GPU_COMPAREOP_NOT_EQUAL,
                            :SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,
                            :SDL_GPU_COMPAREOP_ALWAYS

    SDL_GPUStencilOp = enum :SDL_GPU_STENCILOP_INVALID, 0,
                            :SDL_GPU_STENCILOP_KEEP,
                            :SDL_GPU_STENCILOP_ZERO,
                            :SDL_GPU_STENCILOP_REPLACE,
                            :SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,
                            :SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,
                            :SDL_GPU_STENCILOP_INVERT,
                            :SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,
                            :SDL_GPU_STENCILOP_DECREMENT_AND_WRAP

    SDL_GPUBlendOp = enum :SDL_GPU_BLENDOP_INVALID, 0,
                          :SDL_GPU_BLENDOP_ADD,
                          :SDL_GPU_BLENDOP_SUBTRACT,
                          :SDL_GPU_BLENDOP_REVERSE_SUBTRACT,
                          :SDL_GPU_BLENDOP_MIN,
                          :SDL_GPU_BLENDOP_MAX

    SDL_GPUBlendFactor = enum :SDL_GPU_BLENDFACTOR_INVALID, 0,
                              :SDL_GPU_BLENDFACTOR_ZERO,
                              :SDL_GPU_BLENDFACTOR_ONE,
                              :SDL_GPU_BLENDFACTOR_SRC_COLOR,
                              :SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
                              :SDL_GPU_BLENDFACTOR_DST_COLOR,
                              :SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,
                              :SDL_GPU_BLENDFACTOR_SRC_ALPHA,
                              :SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
                              :SDL_GPU_BLENDFACTOR_DST_ALPHA,
                              :SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
                              :SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,
                              :SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,
                              :SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE

    SDL_GPUColorComponentFlags = enum :SDL_GPU_COLORCOMPONENT_R, 0x00000001,
                                      :SDL_GPU_COLORCOMPONENT_G, 0x00000002,
                                      :SDL_GPU_COLORCOMPONENT_B, 0x00000004,
                                      :SDL_GPU_COLORCOMPONENT_A, 0x00000008

    SDL_GPUFilter = enum :SDL_GPU_FILTER_NEAREST, 0,
                         :SDL_GPU_FILTER_LINEAR

    SDL_GPUSamplerMipmapMode = enum :SDL_GPU_SAMPLERMIPMAPMODE_NEAREST, 0,
                                    :SDL_GPU_SAMPLERMIPMAPMODE_LINEAR

    SDL_GPUSamplerAddressMode = enum :SDL_GPU_SAMPLERADDRESSMODE_REPEAT, 0,
                                     :SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT,
                                     :SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE

    SDL_GPUPresentMode = enum :SDL_GPU_PRESENTMODE_VSYNC, 0,
                              :SDL_GPU_PRESENTMODE_IMMEDIATE,
                              :SDL_GPU_PRESENTMODE_MAILBOX

    SDL_GPUSwapchainComposition = enum :SDL_GPU_SWAPCHAINCOMPOSITION_SDR, 0,
                                       :SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR,
                                       :SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR,
                                       :SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084

    class SDL_GPUViewport < FFI::Struct
      layout :x, :float,
             :y, :float,
             :w, :float,
             :h, :float,
             :min_depth, :float,
             :max_depth, :float
    end

    class SDL_GPUTextureTransferInfo < FFI::Struct
      layout :transfer_buffer, :pointer,
             :offset, :uint32,
             :pixels_per_row, :uint32,
             :rows_per_layer, :uint32
    end

    class SDL_GPUTransferBufferLocation < FFI::Struct
      layout :transfer_buffer, :pointer,
             :offset, :uint32
    end

    class SDL_GPUTextureLocation < FFI::Struct
      layout :texture, :pointer,
             :mip_level, :uint32,
             :layer, :uint32,
             :x, :uint32,
             :y, :uint32,
             :z, :uint32
    end

    class SDL_GPUTextureRegion < FFI::Struct
      layout :texture, :pointer,
             :mip_level, :uint32,
             :layer, :uint32,
             :x, :uint32,
             :y, :uint32,
             :z, :uint32,
             :w, :uint32,
             :h, :uint32,
             :d, :uint32
    end

    class SDL_GPUBlitRegion < FFI::Struct
      layout :texture, :pointer,
             :mip_level, :uint32,
             :layer_or_depth_plane, :uint32,
             :x, :uint32,
             :y, :uint32,
             :w, :uint32,
             :h, :uint32
    end

    class SDL_GPUBufferLocation < FFI::Struct
      layout :buffer, :pointer,
             :offset, :uint32
    end

    class SDL_GPUBufferRegion < FFI::Struct
      layout :buffer, :pointer,
             :offset, :uint32,
             :size, :uint32
    end

    class SDL_GPUIndirectDrawCommand < FFI::Struct
      layout :num_vertices, :uint32,
             :num_instances, :uint32,
             :first_vertex, :uint32,
             :first_instance, :uint32
    end

    class SDL_GPUIndexedIndirectDrawCommand < FFI::Struct
      layout :num_indices, :uint32,
             :num_instances, :uint32,
             :first_index, :uint32,
             :vertex_offset, :int32,
             :first_instance, :uint32
    end

    class SDL_GPUIndirectDispatchCommand < FFI::Struct
      layout :groupcount_x, :uint32,
             :groupcount_y, :uint32,
             :groupcount_z, :uint32
    end

    class SDL_GPUSamplerCreateInfo < FFI::Struct
      layout :min_filter, SDL_GPUFilter,
             :mag_filter, SDL_GPUFilter,
             :mipmap_mode, SDL_GPUSamplerMipmapMode,
             :address_mode_u, SDL_GPUSamplerAddressMode,
             :address_mode_v, SDL_GPUSamplerAddressMode,
             :address_mode_w, SDL_GPUSamplerAddressMode,
             :mip_lod_bias, :float,
             :max_anisotropy, :float,
             :compare_op, SDL_GPUCompareOp,
             :min_lod, :float,
             :max_lod, :float,
             :enable_anisotropy, :bool,
             :enable_compare, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :props, :SDL_PropertiesID
    end

    class SDL_GPUVertexBufferDescription < FFI::Struct
      layout :slot, :uint32,
             :pitch, :uint32,
             :input_rate, SDL_GPUVertexInputRate,
             :instance_step_rate, :uint32
    end

    class SDL_GPUVertexAttribute < FFI::Struct
      layout :location, :uint32,
             :buffer_slot, :uint32,
             :format, SDL_GPUVertexElementFormat,
             :offset, :uint32
    end

    class SDL_GPUVertexInputState < FFI::Struct
      layout :vertex_buffer_descriptions, :pointer,
             :num_vertex_buffers, :uint32,
             :vertex_attributes, :pointer,
             :num_vertex_attributes, :uint32
    end

    class SDL_GPUStencilOpState < FFI::Struct
      layout :fail_op, SDL_GPUStencilOp,
             :pass_op, SDL_GPUStencilOp,
             :depth_fail_op, SDL_GPUStencilOp,
             :compare_op, SDL_GPUCompareOp
    end

    class SDL_GPUColorTargetBlendState < FFI::Struct
      layout :src_color_blendfactor, SDL_GPUBlendFactor,
             :dst_color_blendfactor, SDL_GPUBlendFactor,
             :color_blend_op, SDL_GPUBlendOp,
             :src_alpha_blendfactor, SDL_GPUBlendFactor,
             :dst_alpha_blendfactor, SDL_GPUBlendFactor,
             :alpha_blend_op, SDL_GPUBlendOp,
             :color_write_mask, :uint8,
             :enable_blend, :bool,
             :enable_color_write_mask, :bool,
             :padding1, :uint8,
             :padding2, :uint8
    end

    class SDL_GPUShaderCreateInfo < FFI::Struct
      layout :code_size, :size_t,
             :code, :pointer,
             :entrypoint, :string,
             :format, :uint32,
             :stage, SDL_GPUShaderStage,
             :num_samplers, :uint32,
             :num_storage_textures, :uint32,
             :num_storage_buffers, :uint32,
             :num_uniform_buffers, :uint32,
             :props, :SDL_PropertiesID
    end

    class SDL_GPUTextureCreateInfo < FFI::Struct
      layout :type, SDL_GPUTextureType,
             :format, SDL_GPUTextureFormat,
             :usage, :uint32,
             :width, :uint32,
             :height, :uint32,
             :layer_count_or_depth, :uint32,
             :num_levels, :uint32,
             :sample_count, SDL_GPUSampleCount,
             :props, :SDL_PropertiesID
    end

    class SDL_GPUBufferCreateInfo < FFI::Struct
      layout :usage, :uint32,
             :size, :uint32,
             :props, :SDL_PropertiesID
    end

    class SDL_GPUTransferBufferCreateInfo < FFI::Struct
      layout :usage, SDL_GPUTransferBufferUsage,
             :size, :uint32,
             :props, :SDL_PropertiesID
    end

    class SDL_GPURasterizerState < FFI::Struct
      layout :fill_mode, SDL_GPUFillMode,
             :cull_mode, SDL_GPUCullMode,
             :front_face, SDL_GPUFrontFace,
             :depth_bias_constant_factor, :float,
             :depth_bias_clamp, :float,
             :depth_bias_slope_factor, :float,
             :enable_depth_bias, :bool,
             :enable_depth_clip, :bool,
             :padding1, :uint8,
             :padding2, :uint8
    end

    class SDL_GPUMultisampleState < FFI::Struct
      layout :sample_count, SDL_GPUSampleCount,
             :sample_mask, :uint32,
             :enable_mask, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8
    end

    class SDL_GPUDepthStencilState < FFI::Struct
      layout :compare_op, SDL_GPUCompareOp,
             :back_stencil_state, SDL_GPUStencilOpState,
             :front_stencil_state, SDL_GPUStencilOpState,
             :compare_mask, :uint8,
             :write_mask, :uint8,
             :enable_depth_test, :bool,
             :enable_depth_write, :bool,
             :enable_stencil_test, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8
    end

    class SDL_GPUColorTargetDescription < FFI::Struct
      layout :format, SDL_GPUTextureFormat,
             :blend_state, SDL_GPUColorTargetBlendState
    end

    class SDL_GPUGraphicsPipelineTargetInfo < FFI::Struct
      layout :color_target_descriptions, :pointer,
             :num_color_targets, :uint32,
             :depth_stencil_format, SDL_GPUTextureFormat,
             :has_depth_stencil_target, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8
    end

    class SDL_GPUGraphicsPipelineCreateInfo < FFI::Struct
      layout :vertex_shader, :pointer,
             :fragment_shader, :pointer,
             :vertex_input_state, SDL_GPUVertexInputState,
             :primitive_type, SDL_GPUPrimitiveType,
             :rasterizer_state, SDL_GPURasterizerState,
             :multisample_state, SDL_GPUMultisampleState,
             :depth_stencil_state, SDL_GPUDepthStencilState,
             :target_info, SDL_GPUGraphicsPipelineTargetInfo,
             :props, :SDL_PropertiesID
    end

    class SDL_GPUComputePipelineCreateInfo < FFI::Struct
      layout :code_size, :size_t,
             :code, :pointer,
             :entrypoint, :string,
             :format, :uint32,
             :num_samplers, :uint32,
             :num_readonly_storage_textures, :uint32,
             :num_readonly_storage_buffers, :uint32,
             :num_readwrite_storage_textures, :uint32,
             :num_readwrite_storage_buffers, :uint32,
             :num_uniform_buffers, :uint32,
             :threadcount_x, :uint32,
             :threadcount_y, :uint32,
             :threadcount_z, :uint32,
             :props, :SDL_PropertiesID
    end

    class SDL_GPUColorTargetInfo < FFI::Struct
      layout :texture, :pointer,
             :mip_level, :uint32,
             :layer_or_depth_plane, :uint32,
             :clear_color, SDL_FColor,
             :load_op, SDL_GPULoadOp,
             :store_op, SDL_GPUStoreOp,
             :resolve_texture, :pointer,
             :resolve_mip_level, :uint32,
             :resolve_layer, :uint32,
             :cycle, :bool,
             :cycle_resolve_texture, :bool,
             :padding1, :uint8,
             :padding2, :uint8
    end

    class SDL_GPUDepthStencilTargetInfo < FFI::Struct
      layout :texture, :pointer,
             :clear_depth, :float,
             :load_op, SDL_GPULoadOp,
             :store_op, SDL_GPUStoreOp,
             :stencil_load_op, SDL_GPULoadOp,
             :stencil_store_op, SDL_GPUStoreOp,
             :cycle, :bool,
             :clear_stencil, :uint8,
             :padding1, :uint8,
             :padding2, :uint8
    end

    class SDL_GPUBlitInfo < FFI::Struct
      layout :source, SDL_GPUBlitRegion,
             :destination, SDL_GPUBlitRegion,
             :load_op, SDL_GPULoadOp,
             :clear_color, SDL_FColor,
             :flip_mode, :int,
             :filter, SDL_GPUFilter,
             :cycle, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8
    end

    class SDL_GPUBufferBinding < FFI::Struct
      layout :buffer, :pointer,
             :offset, :uint32
    end

    class SDL_GPUTextureSamplerBinding < FFI::Struct
      layout :texture, :pointer,
             :sampler, :pointer
    end

    class SDL_GPUStorageBufferReadWriteBinding < FFI::Struct
      layout :buffer, :pointer,
             :cycle, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8
    end

    class SDL_GPUStorageTextureReadWriteBinding < FFI::Struct
      layout :texture, :pointer,
             :mip_level, :uint32,
             :layer, :uint32,
             :cycle, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8
    end

    begin
      attach_function :SDL_GPUSupportsShaderFormats, %i[uint32 string], :bool
    attach_function :SDL_GPUSupportsProperties, [:SDL_PropertiesID], :bool
    attach_function :SDL_CreateGPUDevice, %i[uint32 bool string], :pointer
    attach_function :SDL_CreateGPUDeviceWithProperties, [:SDL_PropertiesID], :pointer
    attach_function :SDL_DestroyGPUDevice, [:pointer], :void
    attach_function :SDL_GetNumGPUDrivers, [], :int
    attach_function :SDL_GetGPUDriver, [:int], :string
    attach_function :SDL_GetGPUDeviceDriver, [:pointer], :string
    begin
      attach_function :SDL_GetGPUDeviceProperties, [:pointer], :SDL_PropertiesID
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_GetGPUShaderFormats, [:pointer], :uint32
    attach_function :SDL_CreateGPUComputePipeline, [:pointer, SDL_GPUComputePipelineCreateInfo.ptr], :pointer
    attach_function :SDL_CreateGPUGraphicsPipeline, [:pointer, SDL_GPUGraphicsPipelineCreateInfo.ptr], :pointer
    attach_function :SDL_CreateGPUSampler, [:pointer, SDL_GPUSamplerCreateInfo.ptr], :pointer
    attach_function :SDL_CreateGPUShader, [:pointer, SDL_GPUShaderCreateInfo.ptr], :pointer
    attach_function :SDL_CreateGPUTexture, [:pointer, SDL_GPUTextureCreateInfo.ptr], :pointer
    attach_function :SDL_CreateGPUBuffer, [:pointer, SDL_GPUBufferCreateInfo.ptr], :pointer
    attach_function :SDL_CreateGPUTransferBuffer, [:pointer, SDL_GPUTransferBufferCreateInfo.ptr], :pointer
    attach_function :SDL_SetGPUBufferName, %i[pointer pointer string], :void
    attach_function :SDL_SetGPUTextureName, %i[pointer pointer string], :void
    attach_function :SDL_InsertGPUDebugLabel, %i[pointer string], :void
    attach_function :SDL_PushGPUDebugGroup, %i[pointer string], :void
    attach_function :SDL_PopGPUDebugGroup, [:pointer], :void
    attach_function :SDL_ReleaseGPUTexture, %i[pointer pointer], :void
    attach_function :SDL_ReleaseGPUSampler, %i[pointer pointer], :void
    attach_function :SDL_ReleaseGPUBuffer, %i[pointer pointer], :void
    attach_function :SDL_ReleaseGPUTransferBuffer, %i[pointer pointer], :void
    attach_function :SDL_ReleaseGPUComputePipeline, %i[pointer pointer], :void
    attach_function :SDL_ReleaseGPUShader, %i[pointer pointer], :void
    attach_function :SDL_ReleaseGPUGraphicsPipeline, %i[pointer pointer], :void
    attach_function :SDL_AcquireGPUCommandBuffer, [:pointer], :pointer
    attach_function :SDL_PushGPUVertexUniformData, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_PushGPUFragmentUniformData, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_PushGPUComputeUniformData, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BeginGPURenderPass, [:pointer, :pointer, :uint32, SDL_GPUDepthStencilTargetInfo.ptr], :pointer
    attach_function :SDL_BindGPUGraphicsPipeline, %i[pointer pointer], :void
    attach_function :SDL_SetGPUViewport, [:pointer, SDL_GPUViewport.ptr], :void
    attach_function :SDL_SetGPUScissor, [:pointer, SDL_Rect.ptr], :void
    attach_function :SDL_SetGPUBlendConstants, [:pointer, SDL_FColor], :void
    attach_function :SDL_SetGPUStencilReference, %i[pointer uint8], :void
    attach_function :SDL_BindGPUVertexBuffers, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUIndexBuffer, [:pointer, SDL_GPUBufferBinding.ptr, SDL_GPUIndexElementSize], :void
    attach_function :SDL_BindGPUVertexSamplers, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUVertexStorageTextures, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUVertexStorageBuffers, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUFragmentSamplers, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUFragmentStorageTextures, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUFragmentStorageBuffers, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_DrawGPUIndexedPrimitives, %i[pointer uint32 uint32 uint32 int32 uint32], :void
    attach_function :SDL_DrawGPUPrimitives, %i[pointer uint32 uint32 uint32 uint32], :void
    attach_function :SDL_DrawGPUPrimitivesIndirect, [:pointer, :pointer, :uint32, :uint32], :void
    attach_function :SDL_DrawGPUIndexedPrimitivesIndirect, [:pointer, :pointer, :uint32, :uint32], :void
    attach_function :SDL_EndGPURenderPass, [:pointer], :void
    attach_function :SDL_BeginGPUComputePass, %i[pointer pointer uint32 pointer uint32], :pointer
    attach_function :SDL_BindGPUComputePipeline, %i[pointer pointer], :void
    attach_function :SDL_BindGPUComputeSamplers, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUComputeStorageTextures, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_BindGPUComputeStorageBuffers, %i[pointer uint32 pointer uint32], :void
    attach_function :SDL_DispatchGPUCompute, %i[pointer uint32 uint32 uint32], :void
    attach_function :SDL_DispatchGPUComputeIndirect, %i[pointer pointer uint32], :void
    attach_function :SDL_EndGPUComputePass, [:pointer], :void
    attach_function :SDL_MapGPUTransferBuffer, %i[pointer pointer bool], :pointer
    attach_function :SDL_UnmapGPUTransferBuffer, %i[pointer pointer], :void
    attach_function :SDL_BeginGPUCopyPass, [:pointer], :pointer
    attach_function :SDL_UploadToGPUTexture, [:pointer, SDL_GPUTextureTransferInfo.ptr, SDL_GPUTextureRegion.ptr, :bool], :void
    attach_function :SDL_UploadToGPUBuffer, [:pointer, SDL_GPUTransferBufferLocation.ptr, SDL_GPUBufferRegion.ptr, :bool], :void
    attach_function :SDL_CopyGPUTextureToTexture, [:pointer, SDL_GPUTextureLocation.ptr, SDL_GPUTextureLocation.ptr, :uint32, :uint32, :uint32, :bool], :void
    attach_function :SDL_CopyGPUBufferToBuffer, [:pointer, SDL_GPUBufferLocation.ptr, SDL_GPUBufferLocation.ptr, :uint32, :bool], :void
    attach_function :SDL_DownloadFromGPUTexture, [:pointer, SDL_GPUTextureRegion.ptr, SDL_GPUTextureTransferInfo.ptr], :void
    attach_function :SDL_DownloadFromGPUBuffer, [:pointer, SDL_GPUBufferRegion.ptr, SDL_GPUTransferBufferLocation.ptr], :void
    attach_function :SDL_EndGPUCopyPass, [:pointer], :void
    attach_function :SDL_GenerateMipmapsForGPUTexture, %i[pointer pointer], :void
    attach_function :SDL_BlitGPUTexture, [:pointer, SDL_GPUBlitInfo.ptr], :void
    attach_function :SDL_WindowSupportsGPUSwapchainComposition, %i[pointer pointer int], :bool
    attach_function :SDL_WindowSupportsGPUPresentMode, %i[pointer pointer int], :bool
    attach_function :SDL_ClaimWindowForGPUDevice, %i[pointer pointer], :bool
    attach_function :SDL_ReleaseWindowFromGPUDevice, %i[pointer pointer], :void
    attach_function :SDL_SetGPUSwapchainParameters, %i[pointer pointer int int], :bool
    attach_function :SDL_SetGPUAllowedFramesInFlight, %i[pointer uint32], :bool
    attach_function :SDL_GetGPUSwapchainTextureFormat, %i[pointer pointer], SDL_GPUTextureFormat
    attach_function :SDL_AcquireGPUSwapchainTexture, %i[pointer pointer pointer pointer pointer], :bool
    attach_function :SDL_WaitForGPUSwapchain, %i[pointer pointer], :bool
    attach_function :SDL_WaitAndAcquireGPUSwapchainTexture, %i[pointer pointer pointer pointer pointer], :bool
    attach_function :SDL_SubmitGPUCommandBuffer, [:pointer], :bool
    attach_function :SDL_SubmitGPUCommandBufferAndAcquireFence, [:pointer], :pointer
    attach_function :SDL_CancelGPUCommandBuffer, [:pointer], :bool
    attach_function :SDL_WaitForGPUIdle, [:pointer], :bool
    attach_function :SDL_WaitForGPUFences, %i[pointer bool pointer uint32], :bool
    attach_function :SDL_QueryGPUFence, %i[pointer pointer], :bool
    attach_function :SDL_ReleaseGPUFence, %i[pointer pointer], :void
    attach_function :SDL_GPUTextureFormatTexelBlockSize, [SDL_GPUTextureFormat], :uint32
    attach_function :SDL_GPUTextureSupportsFormat, [:pointer, SDL_GPUTextureFormat, SDL_GPUTextureType, :uint32], :bool
    attach_function :SDL_GPUTextureSupportsSampleCount, [:pointer, SDL_GPUTextureFormat, SDL_GPUSampleCount], :bool
    attach_function :SDL_CalculateGPUTextureFormatSize, [SDL_GPUTextureFormat, :uint32, :uint32, :uint32], :uint32
    begin
      attach_function :SDL_GetPixelFormatFromGPUTextureFormat, [SDL_GPUTextureFormat], :uint32
      attach_function :SDL_GetGPUTextureFormatFromPixelFormat, [:uint32], SDL_GPUTextureFormat
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end

    begin
      attach_function :SDL_GDKSuspendGPU, [:pointer], :void
      attach_function :SDL_GDKResumeGPU, [:pointer], :void
    rescue FFI::NotFoundError
      # GDK-only APIs are not available on all platforms.
    end
    rescue FFI::NotFoundError
      # GPU API may not be available in all SDL3 versions
    end
  end
end
