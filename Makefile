module = AproximateORAdder/LSB_Two_AproximateORAdder
submodules = FullAdder.v RippleCarryAdder.v AproximateAdder/AproximateAdder.v \
AproximateAdder/LSB_One_AproximateRCAdder.v AproximateAdder/LSB_Two_AproximateRCAdder.v \
AproximateAdder/LSB_Three_AproximateRCAdder.v AproximateAdder/LSB_Four_AproximateRCAdder.v \
AproximateORAdder/LSB_One_AproximateORAdder.v 

sim: clean
	# Agregan el nombre del resto de archivos del proyecto, incluyendo el testbench del diseño
	(cd src; iverilog $(module)_tb.v $(module).v $(submodules) \
		-o ../build/sim)
	(cd build; ./sim)

syn:
	# No se incluyen los testbench 
	# en el paso de "synth" se debe cambiar el nombre del módulo top por el de su proyecto
	(cd src; yosys -p "read_verilog \
			$(module).v $(submodules);  \
		 	synth -top $(module);\
			write_json ../build/$(module)-syn.json;\
			write_verilog ../build/$(module)-syn.v")
	# genera una imagen 
	(cd build; netlistsvg $(module)-syn.json --skin ../teros-skin.svg -o $(module)-syn.svg)

syntech: clean
	(cd src; yosys -p "read_verilog \
			$(module).v $(submodules);  \
		 	hierarchy -top $(module);\
			prep; synth; \
			clean -purge; \
			dfflibmap -liberty ../tech/NanGate15nm.lib; \
			abc -liberty ../tech/NanGate15nm.lib; \
			clean -purge; \
			write_json ../build/$(module)-syntech.json;\
			write_verilog ../build/$(module)-syntech.v")
	# genera una imagen 
	(cd build; netlistsvg $(module)-syntech.json --skin ../teros-skin.svg -o $(module)-syntech.svg)

postsim:
	(cd build; iverilog -l ../tech/NanGate15nm.v -o postsim ../src/$(module)_tb.v $(module)-syntech.v; \
	./postsim)

clean:
	rm -rf build
	mkdir build 


