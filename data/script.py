import re

def modify_verilog_cell_names(file_path):
    # Patrón para identificar el nombre de las celdas seguido por un identificador que comienza con "U<num>"
    cell_pattern = re.compile(r'(\w+)( U\d+ \()')

    modified_lines = []

    # Leer y modificar el archivo
    with open(file_path, 'r') as file:
        for line in file:
            # Agregar _RVT al nombre de las celdas
            modified_line = cell_pattern.sub(r'\1_RVT\2', line)
            modified_lines.append(modified_line)

    # Escribir el archivo modificado
    with open(file_path, 'w') as file:
        file.writelines(modified_lines)

# Uso del script
file_path = 'uniciclo.v'  # Reemplaza esto con la ruta de tu archivo Verilog
modify_verilog_cell_names(file_path)
