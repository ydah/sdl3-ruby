# frozen_string_literal: true

module SDL3
  module Raw
    SDL_hid_bus_type = enum :SDL_HID_API_BUS_UNKNOWN, 0x00,
                            :SDL_HID_API_BUS_USB, 0x01,
                            :SDL_HID_API_BUS_BLUETOOTH, 0x02,
                            :SDL_HID_API_BUS_I2C, 0x03,
                            :SDL_HID_API_BUS_SPI, 0x04

    class SDL_hid_device_info < FFI::Struct
      layout :path, :string,
             :vendor_id, :ushort,
             :product_id, :ushort,
             :serial_number, :pointer,
             :release_number, :ushort,
             :manufacturer_string, :pointer,
             :product_string, :pointer,
             :usage_page, :ushort,
             :usage, :ushort,
             :interface_number, :int,
             :interface_class, :int,
             :interface_subclass, :int,
             :interface_protocol, :int,
             :bus_type, SDL_hid_bus_type,
             :next, :pointer
    end

    begin
      attach_function :SDL_hid_init, [], :int
      attach_function :SDL_hid_exit, [], :int
      attach_function :SDL_hid_device_change_count, [], :uint32
      attach_function :SDL_hid_enumerate, %i[ushort ushort], SDL_hid_device_info.ptr
      attach_function :SDL_hid_free_enumeration, [SDL_hid_device_info.ptr], :void
      attach_function :SDL_hid_open, %i[ushort ushort pointer], :pointer
      attach_function :SDL_hid_open_path, [:string], :pointer
      attach_function :SDL_hid_get_properties, [:pointer], :SDL_PropertiesID
      attach_function :SDL_hid_write, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_read_timeout, %i[pointer pointer size_t int], :int
      attach_function :SDL_hid_read, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_set_nonblocking, %i[pointer int], :int
      attach_function :SDL_hid_send_feature_report, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_get_feature_report, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_get_input_report, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_close, [:pointer], :int
      attach_function :SDL_hid_get_manufacturer_string, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_get_product_string, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_get_serial_number_string, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_get_indexed_string, %i[pointer int pointer size_t], :int
      attach_function :SDL_hid_get_device_info, [:pointer], SDL_hid_device_info.ptr
      attach_function :SDL_hid_get_report_descriptor, %i[pointer pointer size_t], :int
      attach_function :SDL_hid_ble_scan, [:bool], :void
    rescue FFI::NotFoundError
      # HIDAPI may not be available in all SDL3 builds
    end
  end
end
