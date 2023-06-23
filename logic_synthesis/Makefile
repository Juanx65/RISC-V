# Este makefile correrá dc_shell y limpiará los archivos generados

.PHONY: run
run:
	@echo "Ejecutando dc_shell con logic_synthesis.tcl"
	dc_shell -f logic_synthesis.tcl

.PHONY: clean
clean:
	@echo "Limpiando archivos .log, .svf, .pvl, .syn, .mr"
	rm -f *.log *.svf *.pvl *.syn *.mr
