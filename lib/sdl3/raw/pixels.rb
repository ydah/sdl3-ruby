# frozen_string_literal: true

module SDL3
  module Raw
    SDL_PixelType = enum :SDL_PIXELTYPE_UNKNOWN, 0,
                         :SDL_PIXELTYPE_INDEX1, 1,
                         :SDL_PIXELTYPE_INDEX4, 2,
                         :SDL_PIXELTYPE_INDEX8, 3,
                         :SDL_PIXELTYPE_PACKED8, 4,
                         :SDL_PIXELTYPE_PACKED16, 5,
                         :SDL_PIXELTYPE_PACKED32, 6,
                         :SDL_PIXELTYPE_ARRAYU8, 7,
                         :SDL_PIXELTYPE_ARRAYU16, 8,
                         :SDL_PIXELTYPE_ARRAYU32, 9,
                         :SDL_PIXELTYPE_ARRAYF16, 10,
                         :SDL_PIXELTYPE_ARRAYF32, 11,
                         :SDL_PIXELTYPE_INDEX2, 12

    SDL_BitmapOrder = enum :SDL_BITMAPORDER_NONE, 0,
                           :SDL_BITMAPORDER_4321, 1,
                           :SDL_BITMAPORDER_1234, 2

    SDL_PackedOrder = enum :SDL_PACKEDORDER_NONE, 0,
                           :SDL_PACKEDORDER_XRGB, 1,
                           :SDL_PACKEDORDER_RGBX, 2,
                           :SDL_PACKEDORDER_ARGB, 3,
                           :SDL_PACKEDORDER_RGBA, 4,
                           :SDL_PACKEDORDER_XBGR, 5,
                           :SDL_PACKEDORDER_BGRX, 6,
                           :SDL_PACKEDORDER_ABGR, 7,
                           :SDL_PACKEDORDER_BGRA, 8

    SDL_ArrayOrder = enum :SDL_ARRAYORDER_NONE, 0,
                          :SDL_ARRAYORDER_RGB, 1,
                          :SDL_ARRAYORDER_RGBA, 2,
                          :SDL_ARRAYORDER_ARGB, 3,
                          :SDL_ARRAYORDER_BGR, 4,
                          :SDL_ARRAYORDER_BGRA, 5,
                          :SDL_ARRAYORDER_ABGR, 6

    SDL_PackedLayout = enum :SDL_PACKEDLAYOUT_NONE, 0,
                            :SDL_PACKEDLAYOUT_332, 1,
                            :SDL_PACKEDLAYOUT_4444, 2,
                            :SDL_PACKEDLAYOUT_1555, 3,
                            :SDL_PACKEDLAYOUT_5551, 4,
                            :SDL_PACKEDLAYOUT_565, 5,
                            :SDL_PACKEDLAYOUT_8888, 6,
                            :SDL_PACKEDLAYOUT_2101010, 7,
                            :SDL_PACKEDLAYOUT_1010102, 8

    SDL_PIXELFORMAT_UNKNOWN = 0x00000000
    SDL_PIXELFORMAT_INDEX1LSB = 0x11100100
    SDL_PIXELFORMAT_INDEX1MSB = 0x11200100
    SDL_PIXELFORMAT_INDEX2LSB = 0x1C100200
    SDL_PIXELFORMAT_INDEX2MSB = 0x1C200200
    SDL_PIXELFORMAT_INDEX4LSB = 0x12100400
    SDL_PIXELFORMAT_INDEX4MSB = 0x12200400
    SDL_PIXELFORMAT_INDEX8 = 0x13000801
    SDL_PIXELFORMAT_RGB332 = 0x14110801
    SDL_PIXELFORMAT_XRGB4444 = 0x15120C02
    SDL_PIXELFORMAT_XBGR4444 = 0x15520C02
    SDL_PIXELFORMAT_XRGB1555 = 0x15130F02
    SDL_PIXELFORMAT_XBGR1555 = 0x15530F02
    SDL_PIXELFORMAT_ARGB4444 = 0x15321002
    SDL_PIXELFORMAT_RGBA4444 = 0x15421002
    SDL_PIXELFORMAT_ABGR4444 = 0x15721002
    SDL_PIXELFORMAT_BGRA4444 = 0x15821002
    SDL_PIXELFORMAT_ARGB1555 = 0x15331002
    SDL_PIXELFORMAT_RGBA5551 = 0x15441002
    SDL_PIXELFORMAT_ABGR1555 = 0x15731002
    SDL_PIXELFORMAT_BGRA5551 = 0x15841002
    SDL_PIXELFORMAT_RGB565 = 0x15151002
    SDL_PIXELFORMAT_BGR565 = 0x15551002
    SDL_PIXELFORMAT_RGB24 = 0x17101803
    SDL_PIXELFORMAT_BGR24 = 0x17401803
    SDL_PIXELFORMAT_XRGB8888 = 0x16161804
    SDL_PIXELFORMAT_RGBX8888 = 0x16261804
    SDL_PIXELFORMAT_XBGR8888 = 0x16561804
    SDL_PIXELFORMAT_BGRX8888 = 0x16661804
    SDL_PIXELFORMAT_ARGB8888 = 0x16362004
    SDL_PIXELFORMAT_RGBA8888 = 0x16462004
    SDL_PIXELFORMAT_ABGR8888 = 0x16762004
    SDL_PIXELFORMAT_BGRA8888 = 0x16862004
    SDL_PIXELFORMAT_XRGB2101010 = 0x16172004
    SDL_PIXELFORMAT_XBGR2101010 = 0x16572004
    SDL_PIXELFORMAT_ARGB2101010 = 0x16372004
    SDL_PIXELFORMAT_ABGR2101010 = 0x16772004
    SDL_PIXELFORMAT_RGB48 = 0x18103006
    SDL_PIXELFORMAT_BGR48 = 0x18403006
    SDL_PIXELFORMAT_RGBA64 = 0x18204008
    SDL_PIXELFORMAT_ARGB64 = 0x18304008
    SDL_PIXELFORMAT_BGRA64 = 0x18504008
    SDL_PIXELFORMAT_ABGR64 = 0x18604008
    SDL_PIXELFORMAT_RGB48_FLOAT = 0x1A103006
    SDL_PIXELFORMAT_BGR48_FLOAT = 0x1A403006
    SDL_PIXELFORMAT_RGBA64_FLOAT = 0x1A204008
    SDL_PIXELFORMAT_ARGB64_FLOAT = 0x1A304008
    SDL_PIXELFORMAT_BGRA64_FLOAT = 0x1A504008
    SDL_PIXELFORMAT_ABGR64_FLOAT = 0x1A604008
    SDL_PIXELFORMAT_RGB96_FLOAT = 0x1B10600C
    SDL_PIXELFORMAT_BGR96_FLOAT = 0x1B40600C
    SDL_PIXELFORMAT_RGBA128_FLOAT = 0x1B208010
    SDL_PIXELFORMAT_ARGB128_FLOAT = 0x1B308010
    SDL_PIXELFORMAT_BGRA128_FLOAT = 0x1B508010
    SDL_PIXELFORMAT_ABGR128_FLOAT = 0x1B608010
    SDL_PIXELFORMAT_YV12 = 0x32315659
    SDL_PIXELFORMAT_IYUV = 0x56555949
    SDL_PIXELFORMAT_YUY2 = 0x32595559
    SDL_PIXELFORMAT_UYVY = 0x59565955
    SDL_PIXELFORMAT_YVYU = 0x55595659
    SDL_PIXELFORMAT_NV12 = 0x3231564E
    SDL_PIXELFORMAT_NV21 = 0x3132564E
    SDL_PIXELFORMAT_P010 = 0x30313050
    SDL_PIXELFORMAT_EXTERNAL_OES = 0x2053454F

    SDL_Colorspace = enum :SDL_COLORSPACE_UNKNOWN, 0,
                          :SDL_COLORSPACE_SRGB, 0x120005A0,
                          :SDL_COLORSPACE_SRGB_LINEAR, 0x12000500,
                          :SDL_COLORSPACE_HDR10, 0x12002600,
                          :SDL_COLORSPACE_JPEG, 0x220004C6,
                          :SDL_COLORSPACE_BT601_LIMITED, 0x211018C6,
                          :SDL_COLORSPACE_BT601_FULL, 0x221018C6,
                          :SDL_COLORSPACE_BT709_LIMITED, 0x21100421,
                          :SDL_COLORSPACE_BT709_FULL, 0x22100421,
                          :SDL_COLORSPACE_BT2020_LIMITED, 0x21102609,
                          :SDL_COLORSPACE_BT2020_FULL, 0x22102609

    class SDL_Color < FFI::Struct
      layout :r, :uint8,
             :g, :uint8,
             :b, :uint8,
             :a, :uint8
    end

    class SDL_FColor < FFI::Struct
      layout :r, :float,
             :g, :float,
             :b, :float,
             :a, :float
    end

    class SDL_Palette < FFI::Struct
      layout :ncolors, :int,
             :colors, :pointer,
             :version, :uint32,
             :refcount, :int
    end

    class SDL_PixelFormatDetails < FFI::Struct
      layout :format, :uint32,
             :bits_per_pixel, :uint8,
             :bytes_per_pixel, :uint8,
             :padding, [:uint8, 2],
             :Rmask, :uint32,
             :Gmask, :uint32,
             :Bmask, :uint32,
             :Amask, :uint32,
             :Rbits, :uint8,
             :Gbits, :uint8,
             :Bbits, :uint8,
             :Abits, :uint8,
             :Rshift, :uint8,
             :Gshift, :uint8,
             :Bshift, :uint8,
             :Ashift, :uint8
    end

    attach_function :SDL_GetPixelFormatName, [:uint32], :string
    attach_function :SDL_GetMasksForPixelFormat, [:uint32, :pointer, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :SDL_GetPixelFormatForMasks, %i[int uint32 uint32 uint32 uint32], :uint32
    attach_function :SDL_GetPixelFormatDetails, [:uint32], SDL_PixelFormatDetails.ptr
    attach_function :SDL_CreatePalette, [:int], SDL_Palette.ptr
    attach_function :SDL_SetPaletteColors, [SDL_Palette.ptr, SDL_Color.ptr, :int, :int], :bool
    attach_function :SDL_DestroyPalette, [SDL_Palette.ptr], :void
    attach_function :SDL_MapRGB, [SDL_PixelFormatDetails.ptr, SDL_Palette.ptr, :uint8, :uint8, :uint8], :uint32
    attach_function :SDL_MapRGBA, [SDL_PixelFormatDetails.ptr, SDL_Palette.ptr, :uint8, :uint8, :uint8, :uint8], :uint32
    attach_function :SDL_GetRGB, [:uint32, SDL_PixelFormatDetails.ptr, SDL_Palette.ptr, :pointer, :pointer, :pointer], :void
    attach_function :SDL_GetRGBA, [:uint32, SDL_PixelFormatDetails.ptr, SDL_Palette.ptr, :pointer, :pointer, :pointer, :pointer], :void
  end
end
