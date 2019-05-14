def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    return alum
end
def arreglo_a_hash(arreglo)
    aux_hash = {}
    arreglo.each do |ele|
        aux_arr = []
        ele.each_with_index do |e, i|
            if i == 0
                aux_hash[e.to_sym] = ''
            else
                aux_arr.push(e.to_i)
            end
            aux_hash[ele[0].to_sym] = aux_arr
        end
    end
    return aux_hash
end
def promedio(arreglo)
    promedio = arreglo.sum.to_f/arreglo.length
    return promedio
end
def show_names_averages(hash)
    hash.each do |key, value|
        puts "#{key} tiene promedio #{promedio(value)}"
    end
end
def show_inasistencias(hash)
    hash.each do |key, value|
        vez_veces = ''
        counter = 0
        value.each do |ele|
            if ele == 0
                counter += 1
            end
        end
        if counter == 1
            vez_veces = 'vez'
        else
            vez_veces = 'veces'
        end
        puts "#{key} ha faltado #{counter} #{vez_veces}." if counter > 0
    end
end

notas_arr = read_alum('notas.csv')
notas_hash = arreglo_a_hash(notas_arr)

option = 1
while option != 4
    puts "Ingrese 1 para ver el nombre cada alumno y su promedio.\n Ingrese 2 para.\n ingrese 3 para.\n Ingrese 4 para salir."
    option = gets.chomp.to_i
    if option == 1
        show_names_averages(notas_hash)
    elsif option == 2
        show_inasistencias(notas_hash)
    elsif option == 3
    elsif option == 4
    else
        puts 'Opción inválida'
    end
end