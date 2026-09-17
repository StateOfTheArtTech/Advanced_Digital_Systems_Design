transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Advanced_Digital_Systems_Design/Lab_2 {C:/Advanced_Digital_Systems_Design/Lab_2/Lab_2.v}

