# frozen_string_literal: true

module SDL3
  module Raw
    typedef :int8, :Sint8
    typedef :uint8, :Uint8
    typedef :int16, :Sint16
    typedef :uint16, :Uint16
    typedef :int32, :Sint32
    typedef :uint32, :Uint32
    typedef :int64, :Sint64
    typedef :uint64, :Uint64

    attach_function :SDL_malloc, [:size_t], :pointer
    attach_function :SDL_calloc, [:size_t, :size_t], :pointer
    attach_function :SDL_realloc, [:pointer, :size_t], :pointer
    attach_function :SDL_free, [:pointer], :void
    attach_function :SDL_aligned_alloc, [:size_t, :size_t], :pointer
    attach_function :SDL_aligned_free, [:pointer], :void

    attach_function :SDL_GetNumAllocations, [], :int

    attach_function :SDL_getenv, [:string], :string
    attach_function :SDL_getenv_unsafe, [:string], :string
    attach_function :SDL_setenv_unsafe, [:string, :string, :int], :int
    attach_function :SDL_unsetenv_unsafe, [:string], :int
    begin
      attach_function :SDL_CreateEnvironment, [:bool], :pointer
      attach_function :SDL_DestroyEnvironment, [:pointer], :void
      attach_function :SDL_GetEnvironment, [], :pointer
      attach_function :SDL_GetEnvironmentVariable, %i[pointer string], :string
      attach_function :SDL_GetEnvironmentVariables, [:pointer], :pointer
      attach_function :SDL_SetEnvironmentVariable, %i[pointer string string bool], :bool
      attach_function :SDL_UnsetEnvironmentVariable, %i[pointer string], :bool
      attach_function :SDL_GetMemoryFunctions, %i[pointer pointer pointer pointer], :void
      attach_function :SDL_GetOriginalMemoryFunctions, %i[pointer pointer pointer pointer], :void
      attach_function :SDL_SetMemoryFunctions, %i[pointer pointer pointer pointer], :bool
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end

    attach_function :SDL_qsort, [:pointer, :size_t, :size_t, :pointer], :void
    attach_function :SDL_bsearch, [:pointer, :pointer, :size_t, :size_t, :pointer], :pointer
    attach_function :SDL_qsort_r, [:pointer, :size_t, :size_t, :pointer, :pointer], :void
    attach_function :SDL_bsearch_r, [:pointer, :pointer, :size_t, :size_t, :pointer, :pointer], :pointer

    attach_function :SDL_abs, [:int], :int
    attach_function :SDL_isalpha, [:int], :int
    attach_function :SDL_isalnum, [:int], :int
    attach_function :SDL_isblank, [:int], :int
    attach_function :SDL_iscntrl, [:int], :int
    attach_function :SDL_isdigit, [:int], :int
    attach_function :SDL_isxdigit, [:int], :int
    attach_function :SDL_ispunct, [:int], :int
    attach_function :SDL_isspace, [:int], :int
    attach_function :SDL_isupper, [:int], :int
    attach_function :SDL_islower, [:int], :int
    attach_function :SDL_isprint, [:int], :int
    attach_function :SDL_isgraph, [:int], :int
    attach_function :SDL_toupper, [:int], :int
    attach_function :SDL_tolower, [:int], :int

    attach_function :SDL_crc16, [:uint16, :pointer, :size_t], :uint16
    attach_function :SDL_crc32, [:uint32, :pointer, :size_t], :uint32
    attach_function :SDL_murmur3_32, [:pointer, :size_t, :uint32], :uint32

    attach_function :SDL_memcpy, [:pointer, :pointer, :size_t], :pointer
    attach_function :SDL_memmove, [:pointer, :pointer, :size_t], :pointer
    attach_function :SDL_memset, [:pointer, :int, :size_t], :pointer
    attach_function :SDL_memset4, [:pointer, :uint32, :size_t], :pointer
    attach_function :SDL_memcmp, [:pointer, :pointer, :size_t], :int

    attach_function :SDL_wcslen, [:pointer], :size_t
    attach_function :SDL_wcsnlen, [:pointer, :size_t], :size_t
    attach_function :SDL_wcslcpy, [:pointer, :pointer, :size_t], :size_t
    attach_function :SDL_wcslcat, [:pointer, :pointer, :size_t], :size_t
    attach_function :SDL_wcsdup, [:pointer], :pointer
    attach_function :SDL_wcsstr, [:pointer, :pointer], :pointer
    attach_function :SDL_wcsnstr, [:pointer, :pointer, :size_t], :pointer
    attach_function :SDL_wcscmp, [:pointer, :pointer], :int
    attach_function :SDL_wcsncmp, [:pointer, :pointer, :size_t], :int
    attach_function :SDL_wcscasecmp, [:pointer, :pointer], :int
    attach_function :SDL_wcsncasecmp, [:pointer, :pointer, :size_t], :int
    attach_function :SDL_wcstol, [:pointer, :pointer, :int], :long

    attach_function :SDL_strlen, [:string], :size_t
    attach_function :SDL_strnlen, [:string, :size_t], :size_t
    attach_function :SDL_strlcpy, [:pointer, :string, :size_t], :size_t
    attach_function :SDL_utf8strlcpy, [:pointer, :string, :size_t], :size_t
    attach_function :SDL_strlcat, [:pointer, :string, :size_t], :size_t
    attach_function :SDL_strdup, [:string], :pointer
    attach_function :SDL_strndup, [:string, :size_t], :pointer
    attach_function :SDL_strrev, [:pointer], :pointer
    attach_function :SDL_strupr, [:pointer], :pointer
    attach_function :SDL_strlwr, [:pointer], :pointer
    attach_function :SDL_strchr, [:string, :int], :pointer
    attach_function :SDL_strrchr, [:string, :int], :pointer
    attach_function :SDL_strstr, [:string, :string], :pointer
    attach_function :SDL_strnstr, [:string, :string, :size_t], :pointer
    attach_function :SDL_strcasestr, [:string, :string], :pointer
    attach_function :SDL_strtok_r, [:pointer, :string, :pointer], :pointer
    attach_function :SDL_utf8strlen, [:string], :size_t
    attach_function :SDL_utf8strnlen, [:string, :size_t], :size_t

    attach_function :SDL_itoa, [:int, :pointer, :int], :pointer
    attach_function :SDL_uitoa, [:uint, :pointer, :int], :pointer
    attach_function :SDL_ltoa, [:long, :pointer, :int], :pointer
    attach_function :SDL_ultoa, [:ulong, :pointer, :int], :pointer
    attach_function :SDL_lltoa, [:long_long, :pointer, :int], :pointer
    attach_function :SDL_ulltoa, [:ulong_long, :pointer, :int], :pointer

    attach_function :SDL_atoi, [:string], :int
    attach_function :SDL_atof, [:string], :double
    attach_function :SDL_strtol, [:string, :pointer, :int], :long
    attach_function :SDL_strtoul, [:string, :pointer, :int], :ulong
    attach_function :SDL_strtoll, [:string, :pointer, :int], :long_long
    attach_function :SDL_strtoull, [:string, :pointer, :int], :ulong_long
    attach_function :SDL_strtod, [:string, :pointer], :double

    attach_function :SDL_strcmp, [:string, :string], :int
    attach_function :SDL_strncmp, [:string, :string, :size_t], :int
    attach_function :SDL_strcasecmp, [:string, :string], :int
    attach_function :SDL_strncasecmp, [:string, :string, :size_t], :int
    attach_function :SDL_strpbrk, [:string, :string], :pointer

    begin
      attach_function :SDL_srand, [:uint64], :void
      attach_function :SDL_rand, [:int32], :int32
      attach_function :SDL_rand_bits, [], :uint32
      attach_function :SDL_rand_bits_r, [:pointer], :uint32
      attach_function :SDL_rand_r, %i[pointer int32], :int32
      attach_function :SDL_randf, [], :float
      attach_function :SDL_randf_r, [:pointer], :float

      attach_function :SDL_sscanf, [:string, :string, :varargs], :int
      attach_function :SDL_vsscanf, %i[string string pointer], :int
      attach_function :SDL_snprintf, [:pointer, :size_t, :string, :varargs], :int
      attach_function :SDL_swprintf, [:pointer, :size_t, :pointer, :varargs], :int
      attach_function :SDL_vsnprintf, %i[pointer size_t string pointer], :int
      attach_function :SDL_vswprintf, %i[pointer size_t pointer pointer], :int
      attach_function :SDL_asprintf, [:pointer, :string, :varargs], :int
      attach_function :SDL_vasprintf, %i[pointer string pointer], :int
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end

    attach_function :SDL_StepUTF8, [:pointer, :pointer], :uint32
    begin
      attach_function :SDL_StepBackUTF8, %i[string pointer], :uint32
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_UCS4ToUTF8, [:uint32, :pointer], :pointer

    attach_function :SDL_acos, [:double], :double
    attach_function :SDL_acosf, [:float], :float
    attach_function :SDL_asin, [:double], :double
    attach_function :SDL_asinf, [:float], :float
    attach_function :SDL_atan, [:double], :double
    attach_function :SDL_atanf, [:float], :float
    attach_function :SDL_atan2, [:double, :double], :double
    attach_function :SDL_atan2f, [:float, :float], :float
    attach_function :SDL_ceil, [:double], :double
    attach_function :SDL_ceilf, [:float], :float
    attach_function :SDL_copysign, [:double, :double], :double
    attach_function :SDL_copysignf, [:float, :float], :float
    attach_function :SDL_cos, [:double], :double
    attach_function :SDL_cosf, [:float], :float
    attach_function :SDL_exp, [:double], :double
    attach_function :SDL_expf, [:float], :float
    attach_function :SDL_fabs, [:double], :double
    attach_function :SDL_fabsf, [:float], :float
    attach_function :SDL_floor, [:double], :double
    attach_function :SDL_floorf, [:float], :float
    attach_function :SDL_trunc, [:double], :double
    attach_function :SDL_truncf, [:float], :float
    attach_function :SDL_fmod, [:double, :double], :double
    attach_function :SDL_fmodf, [:float, :float], :float
    attach_function :SDL_isinf, [:double], :int
    attach_function :SDL_isinff, [:float], :int
    attach_function :SDL_isnan, [:double], :int
    attach_function :SDL_isnanf, [:float], :int
    attach_function :SDL_log, [:double], :double
    attach_function :SDL_logf, [:float], :float
    attach_function :SDL_log10, [:double], :double
    attach_function :SDL_log10f, [:float], :float
    attach_function :SDL_modf, [:double, :pointer], :double
    attach_function :SDL_modff, [:float, :pointer], :float
    attach_function :SDL_pow, [:double, :double], :double
    attach_function :SDL_powf, [:float, :float], :float
    attach_function :SDL_round, [:double], :double
    attach_function :SDL_roundf, [:float], :float
    attach_function :SDL_lround, [:double], :long
    attach_function :SDL_lroundf, [:float], :long
    attach_function :SDL_scalbn, [:double, :int], :double
    attach_function :SDL_scalbnf, [:float, :int], :float
    attach_function :SDL_sin, [:double], :double
    attach_function :SDL_sinf, [:float], :float
    attach_function :SDL_sqrt, [:double], :double
    attach_function :SDL_sqrtf, [:float], :float
    attach_function :SDL_tan, [:double], :double
    attach_function :SDL_tanf, [:float], :float

    attach_function :SDL_iconv_open, [:string, :string], :pointer
    attach_function :SDL_iconv_close, [:pointer], :int
    attach_function :SDL_iconv, [:pointer, :pointer, :pointer, :pointer, :pointer], :size_t
    attach_function :SDL_iconv_string, [:string, :string, :string, :size_t], :pointer
  end
end
