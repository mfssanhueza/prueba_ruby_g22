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
notas_arr = read_alum('notas.csv')
notas_hash = arreglo_a_hash(notas_arr)
puts notas_hash