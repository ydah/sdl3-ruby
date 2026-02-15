# frozen_string_literal: true

require "test_helper"

class TestRawFilesystem < Minitest::Test
  def test_get_base_path
    result = SDL3::Raw.SDL_GetBasePath
    assert_kind_of String, result
    refute_empty result
  end

  def test_get_pref_path
    result = SDL3::Raw.SDL_GetPrefPath("TestOrg", "TestApp")
    assert result.nil? || result.is_a?(String)
  end

  def test_get_user_folder
    result = SDL3::Raw.SDL_GetUserFolder(:SDL_FOLDER_HOME)
    assert result.nil? || result.is_a?(String)
  end

  def test_folder_enum_defined
    assert SDL3::Raw::SDL_Folder
    assert SDL3::Raw::SDL_Folder[:SDL_FOLDER_HOME]
    assert SDL3::Raw::SDL_Folder[:SDL_FOLDER_DESKTOP]
    assert SDL3::Raw::SDL_Folder[:SDL_FOLDER_DOCUMENTS]
    assert SDL3::Raw::SDL_Folder[:SDL_FOLDER_DOWNLOADS]
  end

  def test_path_type_enum_defined
    assert SDL3::Raw::SDL_PathType
    assert SDL3::Raw::SDL_PathType[:SDL_PATHTYPE_NONE]
    assert SDL3::Raw::SDL_PathType[:SDL_PATHTYPE_FILE]
    assert SDL3::Raw::SDL_PathType[:SDL_PATHTYPE_DIRECTORY]
  end
end
