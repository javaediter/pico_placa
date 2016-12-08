#autor: Edison Teran
#fecha: 7-12-2016
require_relative "PicoPlaca"
require "test/unit"

class TestPicoPlaca < Test::Unit::TestCase
  def test_simple
    pico = PicoPlaca.new
    pico.placa = "ppp-125"
    pico.fecha = "7-12-2016"
    pico.hora = "11:00"
    assert_equal(true, pico.verificar)
  end
end
