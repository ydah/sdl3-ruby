# frozen_string_literal: true

module SDL3
  module Raw
    class SDL_Point < FFI::Struct
      layout :x, :int,
             :y, :int
    end

    class SDL_FPoint < FFI::Struct
      layout :x, :float,
             :y, :float
    end

    class SDL_Rect < FFI::Struct
      layout :x, :int,
             :y, :int,
             :w, :int,
             :h, :int
    end

    class SDL_FRect < FFI::Struct
      layout :x, :float,
             :y, :float,
             :w, :float,
             :h, :float
    end

    attach_function :SDL_HasRectIntersection, [SDL_Rect.ptr, SDL_Rect.ptr], :bool
    attach_function :SDL_GetRectIntersection, [SDL_Rect.ptr, SDL_Rect.ptr, SDL_Rect.ptr], :bool
    attach_function :SDL_GetRectUnion, [SDL_Rect.ptr, SDL_Rect.ptr, SDL_Rect.ptr], :bool
    attach_function :SDL_GetRectEnclosingPoints, [SDL_Point.ptr, :int, SDL_Rect.ptr, SDL_Rect.ptr], :bool
    attach_function :SDL_GetRectAndLineIntersection, [SDL_Rect.ptr, :pointer, :pointer, :pointer, :pointer], :bool

    attach_function :SDL_HasRectIntersectionFloat, [SDL_FRect.ptr, SDL_FRect.ptr], :bool
    attach_function :SDL_GetRectIntersectionFloat, [SDL_FRect.ptr, SDL_FRect.ptr, SDL_FRect.ptr], :bool
    attach_function :SDL_GetRectUnionFloat, [SDL_FRect.ptr, SDL_FRect.ptr, SDL_FRect.ptr], :bool
    attach_function :SDL_GetRectEnclosingPointsFloat, [SDL_FPoint.ptr, :int, SDL_FRect.ptr, SDL_FRect.ptr], :bool
    attach_function :SDL_GetRectAndLineIntersectionFloat, [SDL_FRect.ptr, :pointer, :pointer, :pointer, :pointer], :bool
  end
end
