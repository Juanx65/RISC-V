# Este makefile correrá icc2_shell y limpiará los archivos generados

.PHONY: run
run:
	@echo "Ejecutando floorplan"
	icc2_shell -gui -f 02_floorplan.tcl
.PHONY: import_design
import_design:
	@echo "iniciando settings, importando diseño"
	icc2_shell -f 01_icc2_import_design.tcl
.PHONY: clean
clean:
	@echo "Limpiando archivos"
	rm -f -r *.log *.txt work_dir *.svf 
