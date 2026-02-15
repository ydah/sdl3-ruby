# frozen_string_literal: true

require "test_helper"

class TestRawBits < Minitest::Test
  def test_most_significant_bit_index32_zero
    assert_equal(-1, SDL3::Raw::Bits.most_significant_bit_index32(0))
  end

  def test_most_significant_bit_index32_one
    assert_equal 0, SDL3::Raw::Bits.most_significant_bit_index32(1)
  end

  def test_most_significant_bit_index32_power_of_two
    assert_equal 1, SDL3::Raw::Bits.most_significant_bit_index32(2)
    assert_equal 2, SDL3::Raw::Bits.most_significant_bit_index32(4)
    assert_equal 3, SDL3::Raw::Bits.most_significant_bit_index32(8)
    assert_equal 4, SDL3::Raw::Bits.most_significant_bit_index32(16)
    assert_equal 7, SDL3::Raw::Bits.most_significant_bit_index32(128)
    assert_equal 31, SDL3::Raw::Bits.most_significant_bit_index32(0x80000000)
  end

  def test_most_significant_bit_index32_non_power_of_two
    assert_equal 2, SDL3::Raw::Bits.most_significant_bit_index32(5)
    assert_equal 3, SDL3::Raw::Bits.most_significant_bit_index32(10)
    assert_equal 7, SDL3::Raw::Bits.most_significant_bit_index32(255)
  end

  def test_has_exactly_one_bit_set32_zero
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(0)
  end

  def test_has_exactly_one_bit_set32_power_of_two
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(1)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(2)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(4)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(8)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(16)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(32)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(64)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(128)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(256)
    assert SDL3::Raw::Bits.has_exactly_one_bit_set32(0x80000000)
  end

  def test_has_exactly_one_bit_set32_non_power_of_two
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(3)
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(5)
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(6)
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(7)
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(10)
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(255)
    refute SDL3::Raw::Bits.has_exactly_one_bit_set32(0xFFFFFFFF)
  end
end
