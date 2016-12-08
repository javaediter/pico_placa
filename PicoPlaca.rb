#autor: Edison Teran
#fecha: 7-12-2016
require 'date'
require 'time'

class PicoPlaca

  def placa=(value)
    coincidencia = /^[A-Z]{3}-\d{3,4}$/.match(value.upcase)
    if coincidencia==nil
      puts 'Numero de placa incorrecto'
      @placa = nil
    else
      @placa = value
    end
  end

  def placa
    @placa
  end

  def fecha=(value)
    begin
      @fecha=Date.parse(value)
    rescue
      puts 'Formato de fecha incorrecto'
      @fecha = nil
    end
  end

  def fecha
    @fecha
  end

  def hora=(value)
    coincidencia = /^\d{2}:\d{2}$/.match(value)
    begin
      if coincidencia==nil
        raise ArgumentError.new
      end
      @hora = Time.parse(value)
    rescue
      puts 'Hora ingresada incorrecta'
      @hora = nil
    end
  end

  def hora
    @hora
  end

  def run
    puts '======================================================='
    puts '===== BIENVENIDO A LA CALCULADORA DE PICO Y PLACA ====='
    puts '======================================================='

    print 'Ingresa el numero de placa [PPP-000(0)]: '
    placa = gets
    self.placa = placa.chomp

    while self.placa == nil
      print 'Vuelve a ingresar el numero de placa [PPP-0000]: '
      placa = gets
      self.placa = placa.chomp
    end

    print 'Ingresa la fecha [dd-mm-aaaa]: '
    fecha = gets
    self.fecha = fecha.chomp

    while self.fecha == nil
      print 'Vuelve a ingresar la fecha [dd-mm-aaaa]: '
      fecha = gets
      self.fecha = fecha.chomp
    end

    print 'Ingresa la hora [hh:mm]: '
    hora = gets
    self.hora = hora.chomp

    while self.hora == nil
      print 'Vuelve a ingresar la hora [hh:mm]: '
      hora = gets
      self.hora = hora.chomp
    end
    #se ejecuta el programa
    self.verificar
  end

  def verificar
    digitoPlaca = self.placa[self.placa.length-1].to_i
    #horario de la mañana
    maniana = Time.parse("07:00")..Time.parse("09:30")
    #horario de la tarde
    tarde = Time.parse("16:00")..Time.parse("19:30")
    #bandera
    autorizado = true
    diasSemana = 1..5
    digitosPlacaDia = ((2 * self.fecha.wday) - 1)..(2 * self.fecha.wday)

    if diasSemana.include?(self.fecha.wday) and digitosPlacaDia.include?(digitoPlaca)
      if maniana.include?(self.hora)
        autorizado = false
      else
        if tarde.include?(self.hora)
          autorizado = false
        end
      end
    end

    if autorizado
      puts "El auto SI puede circular el #{self.fecha} a las #{self.hora.hour}:#{self.hora.min}"
    else
      puts "El auto NO puede circular el #{self.fecha} a las #{self.hora.hour}:#{self.hora.min}!!!"
    end

    return autorizado
  end
end
