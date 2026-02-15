# frozen_string_literal: true

module SDL3
  module Raw
    SDL_EVENT_FIRST = 0
    SDL_EVENT_QUIT = 0x100
    SDL_EVENT_TERMINATING = 0x101
    SDL_EVENT_LOW_MEMORY = 0x102
    SDL_EVENT_WILL_ENTER_BACKGROUND = 0x103
    SDL_EVENT_DID_ENTER_BACKGROUND = 0x104
    SDL_EVENT_WILL_ENTER_FOREGROUND = 0x105
    SDL_EVENT_DID_ENTER_FOREGROUND = 0x106
    SDL_EVENT_LOCALE_CHANGED = 0x107
    SDL_EVENT_SYSTEM_THEME_CHANGED = 0x108

    SDL_EVENT_DISPLAY_ORIENTATION = 0x151
    SDL_EVENT_DISPLAY_ADDED = 0x152
    SDL_EVENT_DISPLAY_REMOVED = 0x153
    SDL_EVENT_DISPLAY_MOVED = 0x154
    SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED = 0x155
    SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED = 0x156
    SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED = 0x157

    SDL_EVENT_WINDOW_SHOWN = 0x202
    SDL_EVENT_WINDOW_HIDDEN = 0x203
    SDL_EVENT_WINDOW_EXPOSED = 0x204
    SDL_EVENT_WINDOW_MOVED = 0x205
    SDL_EVENT_WINDOW_RESIZED = 0x206
    SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED = 0x207
    SDL_EVENT_WINDOW_METAL_VIEW_RESIZED = 0x208
    SDL_EVENT_WINDOW_MINIMIZED = 0x209
    SDL_EVENT_WINDOW_MAXIMIZED = 0x20A
    SDL_EVENT_WINDOW_RESTORED = 0x20B
    SDL_EVENT_WINDOW_MOUSE_ENTER = 0x20C
    SDL_EVENT_WINDOW_MOUSE_LEAVE = 0x20D
    SDL_EVENT_WINDOW_FOCUS_GAINED = 0x20E
    SDL_EVENT_WINDOW_FOCUS_LOST = 0x20F
    SDL_EVENT_WINDOW_CLOSE_REQUESTED = 0x210
    SDL_EVENT_WINDOW_HIT_TEST = 0x211
    SDL_EVENT_WINDOW_ICCPROF_CHANGED = 0x212
    SDL_EVENT_WINDOW_DISPLAY_CHANGED = 0x213
    SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED = 0x214
    SDL_EVENT_WINDOW_SAFE_AREA_CHANGED = 0x215
    SDL_EVENT_WINDOW_OCCLUDED = 0x216
    SDL_EVENT_WINDOW_ENTER_FULLSCREEN = 0x217
    SDL_EVENT_WINDOW_LEAVE_FULLSCREEN = 0x218
    SDL_EVENT_WINDOW_DESTROYED = 0x219
    SDL_EVENT_WINDOW_HDR_STATE_CHANGED = 0x21A

    SDL_EVENT_KEY_DOWN = 0x300
    SDL_EVENT_KEY_UP = 0x301
    SDL_EVENT_TEXT_EDITING = 0x302
    SDL_EVENT_TEXT_INPUT = 0x303
    SDL_EVENT_KEYMAP_CHANGED = 0x304
    SDL_EVENT_KEYBOARD_ADDED = 0x305
    SDL_EVENT_KEYBOARD_REMOVED = 0x306
    SDL_EVENT_TEXT_EDITING_CANDIDATES = 0x307

    SDL_EVENT_MOUSE_MOTION = 0x400
    SDL_EVENT_MOUSE_BUTTON_DOWN = 0x401
    SDL_EVENT_MOUSE_BUTTON_UP = 0x402
    SDL_EVENT_MOUSE_WHEEL = 0x403
    SDL_EVENT_MOUSE_ADDED = 0x404
    SDL_EVENT_MOUSE_REMOVED = 0x405

    SDL_EVENT_JOYSTICK_AXIS_MOTION = 0x600
    SDL_EVENT_JOYSTICK_BALL_MOTION = 0x601
    SDL_EVENT_JOYSTICK_HAT_MOTION = 0x602
    SDL_EVENT_JOYSTICK_BUTTON_DOWN = 0x603
    SDL_EVENT_JOYSTICK_BUTTON_UP = 0x604
    SDL_EVENT_JOYSTICK_ADDED = 0x605
    SDL_EVENT_JOYSTICK_REMOVED = 0x606
    SDL_EVENT_JOYSTICK_BATTERY_UPDATED = 0x607
    SDL_EVENT_JOYSTICK_UPDATE_COMPLETE = 0x608

    SDL_EVENT_GAMEPAD_AXIS_MOTION = 0x650
    SDL_EVENT_GAMEPAD_BUTTON_DOWN = 0x651
    SDL_EVENT_GAMEPAD_BUTTON_UP = 0x652
    SDL_EVENT_GAMEPAD_ADDED = 0x653
    SDL_EVENT_GAMEPAD_REMOVED = 0x654
    SDL_EVENT_GAMEPAD_REMAPPED = 0x655
    SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN = 0x656
    SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION = 0x657
    SDL_EVENT_GAMEPAD_TOUCHPAD_UP = 0x658
    SDL_EVENT_GAMEPAD_SENSOR_UPDATE = 0x659
    SDL_EVENT_GAMEPAD_UPDATE_COMPLETE = 0x65A
    SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED = 0x65B

    SDL_EVENT_FINGER_DOWN = 0x700
    SDL_EVENT_FINGER_UP = 0x701
    SDL_EVENT_FINGER_MOTION = 0x702

    SDL_EVENT_CLIPBOARD_UPDATE = 0x900

    SDL_EVENT_DROP_FILE = 0x1000
    SDL_EVENT_DROP_TEXT = 0x1001
    SDL_EVENT_DROP_BEGIN = 0x1002
    SDL_EVENT_DROP_COMPLETE = 0x1003
    SDL_EVENT_DROP_POSITION = 0x1004

    SDL_EVENT_AUDIO_DEVICE_ADDED = 0x1100
    SDL_EVENT_AUDIO_DEVICE_REMOVED = 0x1101
    SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED = 0x1102

    SDL_EVENT_SENSOR_UPDATE = 0x1200

    SDL_EVENT_PEN_PROXIMITY_IN = 0x1300
    SDL_EVENT_PEN_PROXIMITY_OUT = 0x1301
    SDL_EVENT_PEN_DOWN = 0x1302
    SDL_EVENT_PEN_UP = 0x1303
    SDL_EVENT_PEN_BUTTON_DOWN = 0x1304
    SDL_EVENT_PEN_BUTTON_UP = 0x1305
    SDL_EVENT_PEN_MOTION = 0x1306
    SDL_EVENT_PEN_AXIS = 0x1307

    SDL_EVENT_CAMERA_DEVICE_ADDED = 0x1400
    SDL_EVENT_CAMERA_DEVICE_REMOVED = 0x1401
    SDL_EVENT_CAMERA_DEVICE_APPROVED = 0x1402
    SDL_EVENT_CAMERA_DEVICE_DENIED = 0x1403

    SDL_EVENT_RENDER_TARGETS_RESET = 0x2000
    SDL_EVENT_RENDER_DEVICE_RESET = 0x2001
    SDL_EVENT_RENDER_DEVICE_LOST = 0x2002

    SDL_EVENT_POLL_SENTINEL = 0x7F00

    SDL_EVENT_USER = 0x8000

    SDL_EVENT_LAST = 0xFFFF

    class SDL_CommonEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64
    end

    class SDL_DisplayEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :displayID, :SDL_DisplayID,
             :data1, :int32,
             :data2, :int32
    end

    class SDL_WindowEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :data1, :int32,
             :data2, :int32
    end

    class SDL_KeyboardDeviceEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_KeyboardID
    end

    class SDL_KeyboardEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_KeyboardID,
             :scancode, :SDL_Scancode,
             :key, :SDL_Keycode,
             :mod, :uint16,
             :raw, :uint16,
             :down, :bool,
             :repeat, :bool
    end

    class SDL_TextEditingEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :text, :pointer,
             :start, :int32,
             :length, :int32
    end

    class SDL_TextInputEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :text, :pointer
    end

    class SDL_MouseDeviceEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_MouseID
    end

    class SDL_MouseMotionEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_MouseID,
             :state, :uint32,
             :x, :float,
             :y, :float,
             :xrel, :float,
             :yrel, :float
    end

    class SDL_MouseButtonEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_MouseID,
             :button, :uint8,
             :down, :bool,
             :clicks, :uint8,
             :padding, :uint8,
             :x, :float,
             :y, :float
    end

    class SDL_MouseWheelEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_MouseID,
             :x, :float,
             :y, :float,
             :direction, :int32,
             :mouse_x, :float,
             :mouse_y, :float
    end

    class SDL_JoyAxisEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :axis, :uint8,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8,
             :value, :int16,
             :padding4, :uint16
    end

    class SDL_JoyBallEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :ball, :uint8,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8,
             :xrel, :int16,
             :yrel, :int16
    end

    class SDL_JoyHatEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :hat, :uint8,
             :value, :uint8,
             :padding1, :uint8,
             :padding2, :uint8
    end

    class SDL_JoyButtonEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :button, :uint8,
             :down, :bool,
             :padding1, :uint8,
             :padding2, :uint8
    end

    class SDL_JoyDeviceEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID
    end

    class SDL_JoyBatteryEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :state, :int32,
             :percent, :int32
    end

    class SDL_GamepadAxisEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :axis, :uint8,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8,
             :value, :int16,
             :padding4, :uint16
    end

    class SDL_GamepadButtonEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :button, :uint8,
             :down, :bool,
             :padding1, :uint8,
             :padding2, :uint8
    end

    class SDL_GamepadDeviceEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID
    end

    class SDL_GamepadTouchpadEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :touchpad, :int32,
             :finger, :int32,
             :x, :float,
             :y, :float,
             :pressure, :float
    end

    class SDL_GamepadSensorEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_JoystickID,
             :sensor, :int32,
             :data, [:float, 3],
             :sensor_timestamp, :uint64
    end

    class SDL_AudioDeviceEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_AudioDeviceID,
             :recording, :bool,
             :padding1, :uint8,
             :padding2, :uint8,
             :padding3, :uint8
    end

    class SDL_CameraDeviceEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_CameraID
    end

    class SDL_TouchFingerEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :touchID, :SDL_TouchID,
             :fingerID, :SDL_FingerID,
             :x, :float,
             :y, :float,
             :dx, :float,
             :dy, :float,
             :pressure, :float,
             :windowID, :SDL_WindowID
    end

    class SDL_PenProximityEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_PenID
    end

    class SDL_PenMotionEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_PenID,
             :pen_state, :uint32,
             :x, :float,
             :y, :float
    end

    class SDL_PenTouchEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_PenID,
             :pen_state, :uint32,
             :x, :float,
             :y, :float,
             :eraser, :bool,
             :down, :bool
    end

    class SDL_PenButtonEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_PenID,
             :pen_state, :uint32,
             :x, :float,
             :y, :float,
             :button, :uint8,
             :down, :bool
    end

    class SDL_PenAxisEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :which, :SDL_PenID,
             :pen_state, :uint32,
             :x, :float,
             :y, :float,
             :axis, :int32,
             :value, :float
    end

    class SDL_DropEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :x, :float,
             :y, :float,
             :source, :pointer,
             :data, :pointer
    end

    class SDL_ClipboardEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :owner, :bool,
             :n_mime_types, :int32,
             :mime_types, :pointer
    end

    class SDL_SensorEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :which, :SDL_SensorID,
             :data, [:float, 6],
             :sensor_timestamp, :uint64
    end

    class SDL_QuitEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64
    end

    class SDL_UserEvent < FFI::Struct
      layout :type, :uint32,
             :reserved, :uint32,
             :timestamp, :uint64,
             :windowID, :SDL_WindowID,
             :code, :int32,
             :data1, :pointer,
             :data2, :pointer
    end

    class SDL_Event < FFI::Union
      layout :type, :uint32,
             :common, SDL_CommonEvent,
             :display, SDL_DisplayEvent,
             :window, SDL_WindowEvent,
             :kdevice, SDL_KeyboardDeviceEvent,
             :key, SDL_KeyboardEvent,
             :edit, SDL_TextEditingEvent,
             :text, SDL_TextInputEvent,
             :mdevice, SDL_MouseDeviceEvent,
             :motion, SDL_MouseMotionEvent,
             :button, SDL_MouseButtonEvent,
             :wheel, SDL_MouseWheelEvent,
             :jdevice, SDL_JoyDeviceEvent,
             :jaxis, SDL_JoyAxisEvent,
             :jball, SDL_JoyBallEvent,
             :jhat, SDL_JoyHatEvent,
             :jbutton, SDL_JoyButtonEvent,
             :jbattery, SDL_JoyBatteryEvent,
             :gdevice, SDL_GamepadDeviceEvent,
             :gaxis, SDL_GamepadAxisEvent,
             :gbutton, SDL_GamepadButtonEvent,
             :gtouchpad, SDL_GamepadTouchpadEvent,
             :gsensor, SDL_GamepadSensorEvent,
             :adevice, SDL_AudioDeviceEvent,
             :cdevice, SDL_CameraDeviceEvent,
             :sensor, SDL_SensorEvent,
             :quit, SDL_QuitEvent,
             :user, SDL_UserEvent,
             :tfinger, SDL_TouchFingerEvent,
             :pproximity, SDL_PenProximityEvent,
             :ptouch, SDL_PenTouchEvent,
             :pmotion, SDL_PenMotionEvent,
             :pbutton, SDL_PenButtonEvent,
             :paxis, SDL_PenAxisEvent,
             :drop, SDL_DropEvent,
             :clipboard, SDL_ClipboardEvent,
             :padding, [:uint8, 128]
    end

    SDL_EventAction = enum :SDL_ADDEVENT, 0,
                           :SDL_PEEKEVENT, 1,
                           :SDL_GETEVENT, 2

    attach_function :SDL_PumpEvents, [], :void
    attach_function :SDL_PeepEvents, [SDL_Event.ptr, :int, SDL_EventAction, :uint32, :uint32], :int
    attach_function :SDL_HasEvent, [:uint32], :bool
    attach_function :SDL_HasEvents, %i[uint32 uint32], :bool
    attach_function :SDL_FlushEvent, [:uint32], :void
    attach_function :SDL_FlushEvents, %i[uint32 uint32], :void
    attach_function :SDL_PollEvent, [SDL_Event.ptr], :bool
    attach_function :SDL_WaitEvent, [SDL_Event.ptr], :bool
    attach_function :SDL_WaitEventTimeout, [SDL_Event.ptr, :int32], :bool
    attach_function :SDL_PushEvent, [SDL_Event.ptr], :bool
    callback :SDL_EventFilter, [SDL_Event.ptr, :pointer], :bool
    attach_function :SDL_SetEventFilter, [:SDL_EventFilter, :pointer], :void
    attach_function :SDL_GetEventFilter, %i[pointer pointer], :bool
    attach_function :SDL_AddEventWatch, [:SDL_EventFilter, :pointer], :bool
    attach_function :SDL_RemoveEventWatch, [:SDL_EventFilter, :pointer], :void
    attach_function :SDL_FilterEvents, [:SDL_EventFilter, :pointer], :void
    attach_function :SDL_SetEventEnabled, %i[uint32 bool], :void
    attach_function :SDL_EventEnabled, [:uint32], :bool
    attach_function :SDL_RegisterEvents, [:int], :uint32
    begin
      attach_function :SDL_GetEventDescription, [SDL_Event.ptr, :pointer, :int], :int
    rescue FFI::NotFoundError
      # Added in newer SDL3 versions.
    end
    attach_function :SDL_GetWindowFromEvent, [SDL_Event.ptr], :pointer
  end
end
