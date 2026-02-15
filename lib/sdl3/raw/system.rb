# frozen_string_literal: true

module SDL3
  module Raw
    SDL_Sandbox = enum :SDL_Sandbox, [
      :SDL_SANDBOX_NONE, 0,
      :SDL_SANDBOX_UNKNOWN_CONTAINER, 1,
      :SDL_SANDBOX_FLATPAK, 2,
      :SDL_SANDBOX_SNAP, 3,
      :SDL_SANDBOX_MACOS, 4
    ]

    attach_function :SDL_IsTablet, [], :bool
    attach_function :SDL_IsTV, [], :bool
    attach_function :SDL_GetSandbox, [], :SDL_Sandbox

    begin
      callback :SDL_X11EventHook, %i[pointer pointer], :bool
      attach_function :SDL_SetX11EventHook, [:SDL_X11EventHook, :pointer], :void
      attach_function :SDL_SetLinuxThreadPriority, %i[int64 int], :bool
      attach_function :SDL_SetLinuxThreadPriorityAndPolicy, %i[int64 int int], :bool
    rescue FFI::NotFoundError
      # Linux/X11 specific APIs are not available on all platforms.
    end

    callback :SDL_WindowsMessageHook, [:pointer, :pointer, :uint, :uint64, :int64], :bool

    begin
      attach_function :SDL_SetWindowsMessageHook, [:SDL_WindowsMessageHook, :pointer], :void
      attach_function :SDL_GetDirect3D9AdapterIndex, [:pointer], :int
      attach_function :SDL_GetDXGIOutputInfo, [:pointer, :pointer, :pointer], :bool
    rescue FFI::NotFoundError
    end

    begin
      attach_function :SDL_GetAndroidJNIEnv, [], :pointer
      attach_function :SDL_GetAndroidActivity, [], :pointer
      attach_function :SDL_GetAndroidSDKVersion, [], :int
      attach_function :SDL_IsChromebook, [], :bool
      attach_function :SDL_IsDeXMode, [], :bool
      attach_function :SDL_SendAndroidBackButton, [], :void
      attach_function :SDL_GetAndroidInternalStoragePath, [], :string
      attach_function :SDL_GetAndroidExternalStorageState, [], :uint32
      attach_function :SDL_GetAndroidExternalStoragePath, [], :string
      attach_function :SDL_GetAndroidCachePath, [], :string
      callback :SDL_RequestAndroidPermissionCallback, [:pointer, :string, :bool], :void
      attach_function :SDL_RequestAndroidPermission, [:string, :SDL_RequestAndroidPermissionCallback, :pointer], :bool
      attach_function :SDL_ShowAndroidToast, [:string, :int, :int, :int, :int], :bool
      attach_function :SDL_SendAndroidMessage, [:uint32, :int], :bool
    rescue FFI::NotFoundError
    end

    begin
      callback :SDL_iOSAnimationCallback, [:pointer], :void
      attach_function :SDL_SetiOSAnimationCallback, [:pointer, :int, :SDL_iOSAnimationCallback, :pointer], :bool
      attach_function :SDL_SetiOSEventPump, [:bool], :void
    rescue FFI::NotFoundError
    end

    begin
      attach_function :SDL_OnApplicationWillTerminate, [], :void
      attach_function :SDL_OnApplicationDidReceiveMemoryWarning, [], :void
      attach_function :SDL_OnApplicationWillEnterBackground, [], :void
      attach_function :SDL_OnApplicationDidEnterBackground, [], :void
      attach_function :SDL_OnApplicationWillEnterForeground, [], :void
      attach_function :SDL_OnApplicationDidEnterForeground, [], :void
      attach_function :SDL_OnApplicationDidChangeStatusBarOrientation, [], :void
    rescue FFI::NotFoundError
    end

    begin
      attach_function :SDL_GetGDKTaskQueue, [:pointer], :bool
      attach_function :SDL_GetGDKDefaultUser, [:pointer], :bool
    rescue FFI::NotFoundError
    end
  end
end
