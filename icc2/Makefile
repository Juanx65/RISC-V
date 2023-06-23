# Este makefile correrá icc2_shell y limpiará los archivos generados

.PHONY: run
run:
	@echo "Ejecutando icc2_shell con icc2_test.tcl"
	icc2_shell -gui -f icc2_test.tcl
.PHONY: clean
clean:
	@echo "Limpiando archivos .log, .txt .svf work_dir"
	rm -f -r *.log *.txt work_dir *.svf 
