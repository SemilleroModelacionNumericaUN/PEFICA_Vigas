# ---------------------------------------
# PROCESOS DE GiD-TCL INVOCADOS POR GID
# ---------------------------------------

proc InitGIDProject { dir } {
    PEFICA_TG::SetDir $dir ;#store to use it later
    PEFICA_TG::ModifyMenus
    gid_groups_conds::open_conditions menu
    PEFICA_TG::CreateWindow  ;#create a window as Tcl example (random surface creation)       
}

# proc SaveGIDProject { filespd } { PENDIENTE PARA OTRO USO
	# PEFICA_TG::ImprimirResultados
# }
 
proc ChangedLanguage { language } {
    PEFICA_TG::ModifyMenus ;#to customize again the menu re-created for the new language
}

proc AfterWriteCalcFileGIDProject { filename errorflag } {   
    if { ![info exists gid_groups_conds::doc] } {
        WarnWin [= "Error: data not OK"]
        return
    }    
    set err [catch { PEFICA_TG::WriteCalculationFile $filename } ret]
    if { $err } {       
        WarnWin [= "Error when preparing data for analysis (%s)" $::errorInfo]
        set ret -cancel-
    }
    return $ret
}

namespace eval PEFICA_TG { 
    variable problemtype_dir 
}

proc PEFICA_TG::SetDir { dir } {  
    variable problemtype_dir
    set problemtype_dir $dir
}

proc PEFICA_TG::GetDir { } {  
    variable problemtype_dir
    return $problemtype_dir
}

proc PEFICA_TG::ModifyMenus { } {   # QUITA LOS VALORES QUE SE ENCONTRABAN EN "Datos"
    if { [GidUtils::IsTkDisabled] } {  
        return
    }          
    foreach menu_name {Conditions Interval "Interval Data" "Local axes"} {
        GidChangeDataLabel $menu_name ""
    }       
}

# ---------------------------------------------------------
# PROCESOS CON GID_INFO Y REALIZANDO COSAS CON GID_PROCESS
# ---------------------------------------------------------

proc PEFICA_TG::CreateWindow { } {  
    if { [GidUtils::AreWindowsDisabled] } {
        return
    }  

    set w .gid.win_example
    InitWindow $w [= "PEFICA_TG - TRABAJO DE GRADO "] ExampleCMAS "" "" 1
    if { ![winfo exists $w] } return ;# windows disabled || usemorewindows == 0
    ttk::frame $w.top -style ridge.TFrame
    ttk::label $w.top.title_text -text [= "POR: DANIEL SANTIAGO VIVAS SUAREZ "] -font BigFont
    ttk::frame $w.information -style ridge.TFrame
    label $w.information.help -text [= "INFORMACION: El presente proyecto se realizo con ayuda del programa GiD, siguiendo los ejemplos y los manuales correspondientes que brinda el software.\n"]
    $w.information.help configure -wraplength 320 -justify left
    ttk::frame $w.bottom -style BottomFrame.TFrame
    ttk::button $w.bottom.start  -style BottomFrame.TButton \
	-text [= "Continue"] -command [list destroy $w]
    grid $w.top.title_text -sticky ew -padx 6 -pady 6
    grid $w.top -sticky new   
    grid $w.information.help -sticky we -padx 6 -pady 6
    grid $w.information -sticky nsew    
    grid $w.bottom.start -padx 6 -pady 12 -sticky ew ;
    grid $w.bottom -sticky sew
    if { $::tcl_version >= 8.5 } { grid anchor $w.bottom center }
    grid rowconfigure $w 0 -weight 1
    grid rowconfigure $w 1 -weight 1
    grid rowconfigure $w 2 -weight 1
    grid columnconfigure $w 0 -weight 1    
}

# ------------------------------------------
# PROCESOS INVOCADOS DESDE EL ARCHIVO .SPD 
# ------------------------------------------

proc PEFICA_TG::Traermateriales { domNode args } {    
    set x_path {//container[@n="materials"]}
    set dom_materiales [$domNode selectNodes $x_path]
    if { $dom_materiales == "" } {
        error [= "xpath '%s' not found in the spd file" $x_path]
    } 
    set image material
    set result [list]
    foreach dom_material [$dom_materiales childNodes] {
        set name [$dom_material @name] 
        lappend result [list 0 $name $name $image 1]
    }
    return [join $result ,]
}

proc PEFICA_TG::TraerTiposApoyos { domNode args } {    
    set x_path {//container[@n="grado_apoyos"]}
    set dom_grado_apoyos [$domNode selectNodes $x_path]
    if { $dom_grado_apoyos == "" } {
        error [= "xpath '%s' not found in the spd file" $x_path]
    } 
    set image material
    set result [list]
    foreach dom_grado_apoyo [$dom_grado_apoyos childNodes] {
        set name [$dom_grado_apoyo @name] 
        lappend result [list 0 $name $name $image 1]
    }
    return [join $result ,]
}

# proc PEFICA_TG::DrawSymbolWeigth { values_list } { PENDIENTE
    # variable _opengl_draw_list
    # if { ![info exists _opengl_draw_list(t_analisis)] } {
        # variable problemtype_dir
        # set _opengl_draw_list(t_analisis) [GiD_OpenGL draw -genlists 1]
        # GiD_OpenGL draw -newlist $_opengl_draw_list(t_analisis) compile
        # set filename_mesh [file join [PEFICA_TG::GetDir] symbols weight_2d.msh]
        # gid_groups_conds::import_gid_mesh_as_openGL $filename_mesh black blue
    # }   
	# GiD_OpenGL draw -endlist
    # set weigth_and_unit [lrange [lindex $values_list [lsearch -index 0 $values_list t_analisis]] 1 2]
    # set t_analisis [lindex $weigth_and_unit 0]
    # set scale [expr {$t_analisis*0.1}]
    # set transform_matrix [list $scale 0 0 0 0 $scale 0 0 0 0 $scale 0 0 0 0 1]
    # set list_id [GiD_OpenGL draw -genlists 1]
    # GiD_OpenGL draw -newlist $list_id compile
    # GiD_OpenGL draw -pushmatrix -multmatrix $transform_matrix
    # GiD_OpenGL draw -call $_opengl_draw_list(t_analisis)
    # GiD_OpenGL draw -popmatrix
    # GiD_OpenGL draw -endlist
    # return $list_id
# }

# proc PEFICA_TG::TipoDeAnalisis { domNode args } { PENDIENTE
	# set x_path {//container[@n="tipo_analisis"]}
	# set dom_tipo_analisis [$domNode selectNodes $x_path]
	# if { $dom_tipo_analisis == "" } {
        # error [= "xpath '%s' not found in the spd file" $x_path]
    # } 
	# set image "navy-length-18"
	# set result [list]
    # foreach dom_tipo_viga [$dom_tipo_analisis childNodes] {
	# set name [$dom_tipo_viga @name]
	# lappend result [list 0 $name $name $image 1]
	# }
    # return [join $result ,]
# }

# proc PEFICA_TG::ImprimirResultados {  } { PENDIENTE PARA OTRO USO
	# GiD_WriteCalculationFile init {C:\Program Files\GiD\GiD 14.0.2\problemtypes\PEFICA_TG.gid\resultados\ result.txt}
	# GiD_WriteCalculationFile puts {TIPR = 11}
	# GiD_WriteCalculationFile puts {IMPR = 8}
	# GiD_WriteCalculationFile puts {CAT = [ ...}
	# GiD_WriteCalculationFile puts "length [gid_groups_conds::give_active_unit L^4] mass [gid_groups_conds::give_active_unit M]"
	# GiD_WriteCalculationFile puts "[GiD_Info Geometry NumPoints]"
	# GiD_WriteCalculationFile puts {]}
	# GiD_WriteCalculationFile puts "[GiD_AccessValue -index get -default intvdata ]"
	# GiD_WriteCalculationFile puts [GiD_Info conditions ovline]
	# GiD_WriteCalculationFile puts [[$::gid_groups_conds::doc documentElement] asXML]
	# set document [$::gid_groups_conds::doc documentElement]
	# set xpath "/PEFICA_TG/container\[@n = Properties\]/condition\[@n = 'Shells' \]/group"
	# set xpath "/PEFICA_TG/container\[@n = 'fuerzas'\]/container\[@n = 'distribuidas'\]/condition\[@n = 'aplicar_f_distribuida' \]/group/value\[@n='fuerza_dist_constante'\]"
	# foreach group_node [$document selectNodes $xpath] {
    # set group_id [get_domnode_attribute $group_node name]
	# GiD_WriteCalculationFile puts $group_id
	# }
    # set nombre [GiD_Groups list $group_id]
	# GiD_WriteCalculationFile puts [GiD_Info conditions ovpnt]
	# GiD_WriteCalculationFile puts [GiD_Info conditions ovline]
	# GiD_WriteCalculationFile puts [GiD_Info conditions ovsurf]
	# GiD_WriteCalculationFile puts [GiD_Info conditions ovvol]
	# GiD_WriteCalculationFile puts [GiD_Info conditions ovlayer]
	# GiD_WriteCalculationFile puts [GiD_Info conditions ovgroup]
	# GiD_WriteCalculationFile puts [GiD_Groups get num_conditions $nombre ]
	# GiD_WriteCalculationFile $nombre
	# set num_coordinates [GiD_WriteCalculationFile coordinates -count ""]
    # GiD_WriteCalculationFile puts "num coordinates: $num_coordinates"
	# for {set i 0} {$i<=$num_coordinates} {incr i 1} {
	# set coordinates($i) [GiD_Info coordinates $i] ;   
	# GiD_WriteCalculationFile puts "coordinates: $i $coordinates($i)"
	# }
	# customlib::EndWriteFile
# }

proc PEFICA_TG::Editar { domNode dict boundary_conds args } {
    set has_container ""
    set database materiales    
    set title [= "User defined"]      
    set list_name [$domNode @n]    
    set x_path {//container[@n="materials"]}
    set dom_materiales [$domNode selectNodes $x_path]
    if { $dom_materiales == "" } {
        error [= "xpath '%s' not found in the spd file" $x_path]
    }
    set primary_level material
    if { [dict exists $dict $list_name] } {
        set xps $x_path
        append xps [format_xpath {/blockdata[@n=%s and @name=%s]} $primary_level [dict get $dict $list_name]]
		} else { 
        set xps ""
    }
    set domNodes [gid_groups_conds::edit_tree_parts_window -accepted_n $primary_level -select_only_one 1 $boundary_conds $title $x_path $xps]
    set dict ""
    if { [llength $domNodes] } {
        set domNode [lindex $domNodes 0]
        if { [$domNode @n] == $primary_level } {      
            dict set dict $list_name [$domNode @name]
        }
    }
    return [list $dict ""]
}

# proc PEFICA_TG::Traerseccion { domNode args } {    PENDIENTE
    # set x_path {//container[@n="secciones"]}
    # set dom_secciones [$domNode selectNodes $x_path]
    # if { $dom_secciones == "" } {
        # error [= "xpath '%s' not found in the spd file" $x_path]
    # } 
    # set image material
    # set result [list]
    # foreach dom_seccion [$dom_secciones childNodes] {
        # set name [$dom_seccion @name] 
        # lappend result [list 0 $name $name $image 1]
    # }
    # return [join $result ,]
# }

# proc PEFICA_TG::Editarseccion { domNode dict boundary_conds args } { PENDIENTE
    # set has_container ""
    # set database seccion    
    # set title [= "User defined"]      
    # set list_name [$domNode @n]    
    # set x_path {//container[@n="seccion"]}
    # set dom_secciones [$domNode selectNodes $x_path]
    # if { $dom_seccion == "" } {
        # error [= "xpath '%s' not found in the spd file" $x_path]
    # }
    # set primary_level seccion
    # if { [dict exists $dict $list_name] } {
        # set xps $x_path
        # append xps [format_xpath {/blockdata[@n=%s and @name=%s]} $primary_level [dict get $dict $list_name]]
    # } else { 
        # set xps "" 
    # }
    # set domNodes [gid_groups_conds::edit_tree_parts_window -accepted_n $primary_level -select_only_one 1 $boundary_conds $title $x_path $xps]          
    # set dict ""
    # if { [llength $domNodes] } {
        # set domNode [lindex $domNodes 0]
        # if { [$domNode @n] == $primary_level } {      
            # dict set dict $list_name [$domNode @name]
        # }
    # }
    # return [list $dict ""]
# }

proc PEFICA_TG::Escribir { list_condition_n parameters_n {unit_mode "default"}} {
	set formats [dict create]
	foreach cond $list_condition_n {
        foreach {k v} [customlib::GetElementsFormats $cond $parameters_n $unit_mode] {
            	dict set formats $k $v
}	
}
GiD_WriteCalculationFile elements $formats
}

proc PEFICA_TG::Escribir2 { list_condition_n parameters_n {unit_mode "default"}} {
	set formats [dict create]
	foreach cond $list_condition_n {
        foreach {k v} [customlib::GetElementsFormats $cond $parameters_n $unit_mode] {
            	dict set formats $k $v
	GiD_WriteCalculationFile nodes $formats
}
}
}

proc PEFICA_TG::WriteConnectivities {list_condition_n parameters {unit_mode "default"}} {
    foreach condition_n $list_condition_n {
        set formats [customlib::GetElementsFormats $condition_n $parameters $unit_mode]

        GiD_WriteCalculationFile connectivities -elements_faces all $formats
    }
}

# --------------------------------------
# IMPRIME LOS DATOS EN UN ARCHIVO .DAT 
# --------------------------------------

proc PEFICA_TG::WriteCalculationFile { filename } {
    customlib::InitWriteFile $filename
    set elements_conditions [list "c_propiedades"]
    customlib::InitMaterials $elements_conditions active
    customlib::WriteString "% |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
    customlib::WriteString "%           DATOS GENERADOS DE GiD PARA MATLAB - OCTAVE              "
    customlib::WriteString "% |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
	customlib::WriteString ""
    customlib::WriteString "% INFORMACION DE UNIDADES:"
    customlib::WriteString "% Todas las unidades estan dadas en el sistema internacional"
	customlib::WriteString "%           Distancia:             | m"
	customlib::WriteString "%           Fuerza:                | N"
	customlib::WriteString "%           Modulo de Young:	   | Pa"
	customlib::WriteString "%           Inercia:               | m^4"          
	customlib::WriteString "%           Area:                  | m^2"
	customlib::WriteString ""
	customlib::WriteString "% INFORMACION DEL PROBLEMA:"
    customlib::WriteString "% 			Numero de elementos:   | [GiD_Info Mesh NumElements]"
	customlib::WriteString "% 			Numero de nudos:       | [GiD_Info Mesh NumNodes]"
	customlib::WriteString ""
	set document [$::gid_groups_conds::doc documentElement]
		set xpath "/PEFICA_TG/container\[@n='impresion'\]/value\[@n = 't_impresion' \]"
		foreach group_node [$document selectNodes $xpath] {
		set group_id [get_domnode_attribute $group_node v]
	}
	
	 	# {3. En TiKz LaTeX} { PENDIENTE
	    # customlib::WriteString "IMPR = 3;  % Tipo de impresion de resultados"
		# }
	switch $group_id {
	{0. Ninguno} {
	    customlib::WriteString "IMPR = 0;  % Tipo de impresion de resultados"
	}
	{1. En ventana de comandos de Octave} {
	    customlib::WriteString "IMPR = 1;  % Tipo de impresion de resultados"	
	}
	{2. En graficas de Octave} {
	    customlib::WriteString "IMPR = 2;  % Tipo de impresion de resultados"
	}
	{4. En GiD} {
	    customlib::WriteString "IMPR = 4;  % Tipo de impresion de resultados"
	}
	{1. y 2.} {
	    customlib::WriteString "IMPR = 8;  % Tipo de impresion de resultados"
	}
	{Impresion general - TODO} {
	    customlib::WriteString "IMPR = 9;  % Tipo de impresion de resultados"
	}
	}
	set document [$::gid_groups_conds::doc documentElement]
		set xpath "/PEFICA_TG/container\[@n='analisis'\]/value\[@n = 'n_interpolaciones' \]"
		foreach group_node [$document selectNodes $xpath] {
		set group_id [get_domnode_attribute $group_node v]
	}
    customlib::WriteString "TIPR = 11;  % Tipo de problema, en este caso siempre sera 11 ya que estamos trabajando con vigas"
    customlib::WriteString "NIIE = $group_id;  % Numero de interpolaciones internas por elemento"	
	customlib::WriteString ""
    customlib::WriteString "% TABLA DE CATEGORIAS: CAT()"
	customlib::WriteString "% 			EYOU: Modulo de Young"
	customlib::WriteString "% 			INER: Inercia"
	customlib::WriteString "% 			TIPE: Tipo de analisis del elemento"
	customlib::WriteString "% 				  111: Euler-Bernoulli"
	customlib::WriteString "% 				  112: Timoshenko 1PG - 1 Punto de Gauss-Legendre para el calculo de matriz Kz"
	customlib::WriteString "% 				  113: Timoshenko 2PG - 2 Punto de Gauss-Legendre para el calculo de matriz Kz"
	customlib::WriteString "% 				  212: 111 y 112 simultaneamente"
	customlib::WriteString "% 				  213: 111 y 113 simultaneamente"
	customlib::WriteString "% 				  223: 112 y 113 simultaneamente"
	customlib::WriteString "% 				  300: 111, 112 y 113 simultaneamente"
	customlib::WriteString "% 			AREA: Area"
	customlib::WriteString "% 			Kz: Parametro de correccion de cortante (Timoshenko)"
	customlib::WriteString "% 			POISS: Coeficiente de Poisson"
	customlib::WriteString "% CAT = \[ EYOU    INER    TIPE    AREA    Kz    POISS \]  "
    customlib::WriteString ""
	set document [$::gid_groups_conds::doc documentElement]
		set xpath "/PEFICA_TG/container\[@n='c_analisis'\]/value\[@n = 'tipo_analisis' \]"
		foreach group_node [$document selectNodes $xpath] {
		set group_id [get_domnode_attribute $group_node v]
	}
	if { $group_id == {1.Euler_Bernoulli}} {
    customlib::WriteString {CAT = [ ...}
	customlib::WriteMaterials [list {"%13.5e" "material" "mod_elast"} {"%13.5e" "material" "iner"} {"%4d" "material" "t_an"}] used active
    customlib::WriteString {];}
	} else {
    customlib::WriteString {CAT = [ ...}
	customlib::WriteMaterials [list {"%13.5e" "material" "mod_elast"} {"%13.5e" "material" "iner"} {"%4d" "material" "t_an"} {"%13.5e" "material" "area"} {"%13.5e" "material" "mod_timo"} {"%13.5e" "material" "mod_poisson"}] used active
    customlib::WriteString {];}
	}
    customlib::WriteString ""
    customlib::WriteString ""   
	customlib::WriteString "% TABLA DE CONECTIVIDADES DE LOS ELEMENTOS: ELE()"
	customlib::WriteString "% 			ELEM: Numero del elemento finito"
	customlib::WriteString "% 			ICAT: Indice de categoria"
	customlib::WriteString "% 			NUDI: Identificacion del primer nudo del elemento"
	customlib::WriteString "% 			NUDJ: Identificacion del segundo nudo del elemento"
	customlib::WriteString "% NOTA IMPORTANTE: Mas abajo se eliminara la primera columna ELEM, para que ELE() sea compatible"
	customlib::WriteString "%				   con el programa PEFUNI"
	customlib::WriteString "% ELE = \[ ELEM    ICAT    NUDI    NUDJ \]  "
    customlib::WriteString ""
	customlib::WriteString {ELE = [ ...}
	set element_formats [list {"%10d" "element" "id"} {"%10d" "material" "MID"} {"%10d" "element" "connectivities"} ]
	PEFICA_TG::WriteConnectivities $elements_conditions $element_formats active
    customlib::WriteString {];}
	customlib::WriteString ""
    customlib::WriteString {ELE(:,1)= []; %Aqui se elimina la primera columna ELEM, para que ELE() sea compatible con PEFUNI}
	customlib::WriteString ""
	customlib::WriteString ""
    customlib::WriteString "% TABLA DE COORDENADAS DE LOS NUDOS: XYZ()"
	customlib::WriteString "% Cada fila corresponde al numero del nudo"
	customlib::WriteString "% 			XNUD: Coordenada x del nudo"
	customlib::WriteString "% XYZ = \[ XNUD \]  "
	customlib::WriteString ""
    customlib::WriteString {XYZ = [ ...}	            
    customlib::WriteCoordinates "%.0s %14.5e %.0s%.0s\n"
    customlib::WriteString {];}	
    customlib::WriteString ""
    customlib::WriteString ""
	customlib::WriteString "% TABLA DE DESPLAZAMIENTOS CONOCIDOS: UCO() "
	customlib::WriteString "% 			INUD: número del nudo "
	customlib::WriteString "% 			DCUY: indicador si el desplazam en y es conocido o no (1:conoc o 0:descon) "
	customlib::WriteString "% 			DCRZ: indicador si la rotación en z es conocida o no (1:conoc o 0:descon) "
	customlib::WriteString "% 			VAUY: valor del desplazamiento en y conocido.  No importa su valor si DCUY=0 "
	customlib::WriteString "% 			VARZ: valor de la rotación en z conocido. No importa su valor cuando DCRZ=0 "
	customlib::WriteString "% UCO = \[ INUD   DCUY   DCRZ   VAUY   VARZ \] "
    customlib::WriteString ""
    customlib::WriteString {UCO = [ ...}	
    set condition_list [list "asig_restriccion"]
    set condition_formats [list {"%1d" "node" "id"} {"%4d" "property" "ind_y"} {"%4d" "property" "ind_z"} {"%13.5e" "property" "rest_y"} {"%13.5e" "property" "rest_z"}]
    customlib::WriteNodes $condition_list $condition_formats "" active
    customlib::WriteString {];}
    customlib::WriteString ""
    customlib::WriteString ""
    set condition_list1 [list "aplicar_f_puntual"]
    set condition_formats1 [list {"%1d" "node" "id"} {"%13.5e" "property" "f_puntual"} {"%13.5e" "property" "momento"}]	
	customlib::WriteString "% TABLA DE FUERZAS APLICADAS EN LOS NUDOS DE LA MALLA. FUN()"
	customlib::WriteString "% 			INUD: número del nudo "
	customlib::WriteString "% 			FUNY: valor de la fuerza puntual en dirección y "
	customlib::WriteString "% 			FUMZ: valor del momento alrededor del eje z. "
	customlib::WriteString "% FUN = \[ INUD    FUNX    FUMZ \] "
    customlib::WriteString ""
    customlib::WriteString {FUN = [ ...}
    customlib::WriteNodes $condition_list1 $condition_formats1 "" active
    customlib::WriteString {];}
    customlib::WriteString ""
    customlib::WriteString ""
    set condition_list2 [list "aplicar_f_distribuida"]
    set condition_formats2 [list {"%10d" "element" "id"} {"%13.5e" "property" "fuerza_dist_constante"}]	
	customlib::WriteString "% TABLA DE FUERZAS DISTRIBUIDAS UNIFORMEMENTE EN LOS ELEMENTOS: FDI()"
	customlib::WriteString "% 			IELE: número del elemento IELE "
	customlib::WriteString "% 			WELE: valor de la carga distribuida uniforme en dirección y."
	customlib::WriteString "% FDI = \[ IELE    WELE \] "
    customlib::WriteString ""
    customlib::WriteString {FDI = [ ...}
    PEFICA_TG::Escribir $condition_list2 $condition_formats2 
    customlib::WriteString {];} 
    customlib::WriteString ""
    customlib::WriteString ""
    set condition_list3 [list "aplicar_f_distribuida_lineal"]
    set condition_formats3 [list {"%10d" "element" "id"} {"%13.5e" "property" "m_ini"} {"%13.5e" "property" "m_fin"}]
	customlib::WriteString "% TABLA DE FUERZAS DISTRIBUIDAS LINEALMENTE EN LOS ELEMENTOS: FDIL()"
	customlib::WriteString "% 			IELE: número del elemento IELE "
	customlib::WriteString "% 			MFDILI: valor inicial de la carga en el elemento general antes de crear la malla"
	customlib::WriteString "% 			MFDILF: valor final de la carga en el elemento general antes de crear la malla"
	customlib::WriteString "% FDI = \[ IELE    MFDILI    MFDILF \] "
    customlib::WriteString ""
	customlib::WriteString {FDIL = [ ...}
    PEFICA_TG::Escribir $condition_list3 $condition_formats3 
    customlib::WriteString {];} 
	customlib::WriteString "NIT = 0;  % Numero de iteracion, se utiliza para los casos de TIPE = 212, 213, 223 y 300" 
	set conditions [GiD_Info conditions ovpnt]
    customlib::WriteString "$conditions"
    customlib::WriteString [GiD_Info conditions ovline]
    customlib::WriteString [GiD_Info conditions ovsurf]
    customlib::WriteString [GiD_Info conditions ovvol]
    customlib::WriteString [GiD_Info conditions ovlayer]
    customlib::WriteString [GiD_Info conditions ovgroup]
	customlib::EndWriteFile ;#finish writting

# -------------------------------------------
# CREACION DE ARCHIVO PARA MATLAB - OCTAVE .m 
# -------------------------------------------
	set p1 "$filename"
    if {[string match "*.dat" $p1]} {
		set nombre [string range $p1 0 end-4]
    }
	set archivo_m [open "$nombre.m" w]
	set archivo_dat [open "$filename" r]

	while { [gets $archivo_dat data] >= 0 } {
	   puts $archivo_m $data
	}
	close $archivo_dat
	close $archivo_m

# -------------------------------------------
# FIN DEL CODIGO
# -------------------------------------------
}
