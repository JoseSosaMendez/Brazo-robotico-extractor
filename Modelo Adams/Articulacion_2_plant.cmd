!
!-------------------------- Default Units for Model ---------------------------!
!
!
defaults units  &
   length = mm  &
   angle = deg  &
   force = newton  &
   mass = kg  &
   time = sec
!
defaults units  &
   coordinate_system_type = cartesian  &
   orientation_type = body313
!
!--------------------------- Model Specific Colors ----------------------------!
!
!
if condition = (! db_exists(".colors.COLOR_R229G233B236"))
!
color create  &
   color_name = .colors.COLOR_R229G233B236  &
   red_component = 0.8980392157  &
   blue_component = 0.9294117647  &
   green_component = 0.9176470588
!
else 
!
color modify  &
   color_name = .colors.COLOR_R229G233B236  &
   red_component = 0.8980392157  &
   blue_component = 0.9294117647  &
   green_component = 0.9176470588
!
end 
!
if condition = (! db_exists(".colors.COLOR_R202G209B237"))
!
color create  &
   color_name = .colors.COLOR_R202G209B237  &
   red_component = 0.7921568627  &
   blue_component = 0.9333333333  &
   green_component = 0.8196078431
!
else 
!
color modify  &
   color_name = .colors.COLOR_R202G209B237  &
   red_component = 0.7921568627  &
   blue_component = 0.9333333333  &
   green_component = 0.8196078431
!
end 
!
if condition = (! db_exists(".colors.COLOR_R202G202B202"))
!
color create  &
   color_name = .colors.COLOR_R202G202B202  &
   red_component = 0.7921568627  &
   blue_component = 0.7921568627  &
   green_component = 0.7921568627
!
else 
!
color modify  &
   color_name = .colors.COLOR_R202G202B202  &
   red_component = 0.7921568627  &
   blue_component = 0.7921568627  &
   green_component = 0.7921568627
!
end 
!
if condition = (! db_exists(".colors.COLOR_R165G158B149"))
!
color create  &
   color_name = .colors.COLOR_R165G158B149  &
   red_component = 0.6470588235  &
   blue_component = 0.5882352941  &
   green_component = 0.6196078431
!
else 
!
color modify  &
   color_name = .colors.COLOR_R165G158B149  &
   red_component = 0.6470588235  &
   blue_component = 0.5882352941  &
   green_component = 0.6196078431
!
end 
!
if condition = (! db_exists(".colors.COLOR_R076G076B076"))
!
color create  &
   color_name = .colors.COLOR_R076G076B076  &
   red_component = 0.2980392157  &
   blue_component = 0.2980392157  &
   green_component = 0.2980392157
!
else 
!
color modify  &
   color_name = .colors.COLOR_R076G076B076  &
   red_component = 0.2980392157  &
   blue_component = 0.2980392157  &
   green_component = 0.2980392157
!
end 
!
if condition = (! db_exists(".colors.COLOR_R112G112B112"))
!
color create  &
   color_name = .colors.COLOR_R112G112B112  &
   red_component = 0.4392156863  &
   blue_component = 0.4392156863  &
   green_component = 0.4392156863
!
else 
!
color modify  &
   color_name = .colors.COLOR_R112G112B112  &
   red_component = 0.4392156863  &
   blue_component = 0.4392156863  &
   green_component = 0.4392156863
!
end 
!
if condition = (! db_exists(".colors.COLOR_R252G221B202"))
!
color create  &
   color_name = .colors.COLOR_R252G221B202  &
   red_component = 0.9921568627  &
   blue_component = 0.7921568627  &
   green_component = 0.8666666667
!
else 
!
color modify  &
   color_name = .colors.COLOR_R252G221B202  &
   red_component = 0.9921568627  &
   blue_component = 0.7921568627  &
   green_component = 0.8666666667
!
end 
!
!------------------------ Default Attributes for Model ------------------------!
!
!
defaults attributes  &
   inheritance = bottom_up  &
   icon_visibility = on  &
   grid_visibility = off  &
   size_of_icons = 50.0  &
   spacing_for_grid = 1000.0
!
!--------------------------- Plugins used by Model ----------------------------!
!
!
plugin load  &
   plugin_name = .MDI.plugins.controls
!
plugin load  &
   plugin_name = .MDI.plugins.amachinery
!
!------------------------------ Adams View Model ------------------------------!
!
!
model create  &
   model_name = Brazo_Final
!
view erase
!
!-------------------------------- Data storage --------------------------------!
!
!
!--------------------------------- Materials ----------------------------------!
!
!
material create  &
   material_name = .Brazo_Final.glass_fiber_plastic  &
   adams_id = 1  &
   density = 1.37E-06  &
   orthotropic_constants = 8427.6, 2172.1, 1611.7
!
material create  &
   material_name = .Brazo_Final.steel  &
   adams_id = 2  &
   density = 7.801E-06  &
   youngs_modulus = 2.07E+05  &
   poissons_ratio = 0.29
!
material create  &
   material_name = .Brazo_Final.carbon_fiber_0_90_epoxy  &
   adams_id = 3  &
   density = 1.51E-06  &
   orthotropic_constants = 1.23611E+04, 2.7443E+04, 2894.9
!
!-------------------------------- Rigid Parts ---------------------------------!
!
! Create parts and their dependent markers and graphics
!
!----------------------------------- ground -----------------------------------!
!
!
! ****** Ground Part ******
!
defaults model  &
   part_name = ground
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.ground.MARKER_2  &
   adams_id = 2  &
   location = 115.0, -2.8624627509, 112.6896236669  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.ground  &
   material_type = .Brazo_Final.steel
!
part attributes  &
   part_name = .Brazo_Final.ground  &
   name_visibility = off
!
!------------------------------------ Base ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Base  &
   adams_id = 2  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Base
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Base.PSMAR  &
   adams_id = 11  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Base.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Base.cm  &
   adams_id = 12  &
   location = 117.6999464653, 472.0306661683, 2.7077638732E-05  &
   orientation = 6.6464808763d, 89.9489406611d, 0.2450799479d
!
marker create  &
   marker_name = .Brazo_Final.Base.MARKER_10  &
   adams_id = 10  &
   location = 100.0, 550.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base.MARKER_109  &
   adams_id = 109  &
   location = 137.3, 420.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base.MARKER_127  &
   adams_id = 127  &
   location = 137.0, 420.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.Base.Articulacion_1_rotor_attach_J  &
   adams_id = 205  &
   location = 137.0, 420.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Base  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Base  &
   color = COLOR_R229G233B236
!
!----------------------------------- BrazoA -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.BrazoA  &
   adams_id = 3  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.BrazoA
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.BrazoA.PSMAR  &
   adams_id = 13  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.BrazoA.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.BrazoA.cm  &
   adams_id = 14  &
   location = 100.8377893176, 341.5692475919, 5.9036404084E-04  &
   orientation = 3.0742057783d, 90.0324302611d, 359.803296168d
!
marker create  &
   marker_name = .Brazo_Final.BrazoA.MARKER_128  &
   adams_id = 128  &
   location = 137.0, 420.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoA.MARKER_129  &
   adams_id = 129  &
   location = 104.10845223, 294.6853546149, 5.4064739253E-04  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoA.MARKER_148  &
   adams_id = 148  &
   location = 124.2, 280.0, 0.0  &
   orientation = 270.0d, 89.9992065147d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoA.Articulacion_1_stator_attach_J  &
   adams_id = 206  &
   location = 137.0, 420.0, 0.0  &
   orientation = 270.0d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoA.Articulacion_2_stator_attach_J  &
   adams_id = 222  &
   location = 124.2, 280.0, 0.0  &
   orientation = 270.0d, 89.9992065147d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.BrazoA  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.BrazoA  &
   color = COLOR_R202G209B237
!
!----------------------------------- Motor1 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Motor1  &
   adams_id = 20  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Motor1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Motor1.PSMAR  &
   adams_id = 15  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Motor1.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Motor1.cm  &
   adams_id = 16  &
   location = 118.39154777, 434.6853546149, 3.6853061634E-05  &
   orientation = 175.7889769066d, 90.0000175671d, 90.0006088031d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_110  &
   adams_id = 110  &
   location = 137.3, 420.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_111  &
   adams_id = 111  &
   location = 133.0694464091, 415.6012154996, 17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_113  &
   adams_id = 113  &
   location = 133.0694464091, 437.6012154996, 17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_115  &
   adams_id = 115  &
   location = 133.0694464091, 459.6012154996, 17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_117  &
   adams_id = 117  &
   location = 133.0694464091, 465.3, 11.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_119  &
   adams_id = 119  &
   location = 133.0694464091, 465.3, -11.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_121  &
   adams_id = 121  &
   location = 133.0694464091, 437.6012154996, -17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_123  &
   adams_id = 123  &
   location = 133.0694464091, 415.6012154996, -17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor1.MARKER_125  &
   adams_id = 125  &
   location = 133.0694464091, 415.6012154996, -17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Motor1  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Motor1  &
   color = COLOR_R202G209B237
!
!---------------------------------- Base_1_D ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Base_1_D  &
   adams_id = 21  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Base_1_D
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Base_1_D.PSMAR  &
   adams_id = 17  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Base_1_D.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Base_1_D.cm  &
   adams_id = 18  &
   location = 25.0, 267.5, -10.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base_1_D.MARKER_3  &
   adams_id = 3  &
   location = 30.0, 0.0, -30.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base_1_D.MARKER_6  &
   adams_id = 6  &
   location = 20.0, 535.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Base_1_D  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Base_1_D  &
   color = COLOR_R229G233B236
!
!---------------------------------- Base_1_I ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Base_1_I  &
   adams_id = 22  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Base_1_I
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Base_1_I.PSMAR  &
   adams_id = 19  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Base_1_I.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Base_1_I.cm  &
   adams_id = 20  &
   location = 205.0, 267.5, -10.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base_1_I.MARKER_8  &
   adams_id = 8  &
   location = 200.0, 535.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Base_1_I  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Base_1_I  &
   color = COLOR_R229G233B236
!
!----------------------------------- Base_2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Base_2  &
   adams_id = 23  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Base_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Base_2.PSMAR  &
   adams_id = 21  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Base_2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Base_2.cm  &
   adams_id = 22  &
   location = 115.0, 560.0, -10.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base_2.MARKER_5  &
   adams_id = 5  &
   location = 20.0, 535.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base_2.MARKER_7  &
   adams_id = 7  &
   location = 200.0, 535.0, 10.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Base_2.MARKER_9  &
   adams_id = 9  &
   location = 100.0, 550.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Base_2  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Base_2  &
   color = COLOR_R229G233B236
!
!----------------------------------- BrazoB -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.BrazoB  &
   adams_id = 24  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.BrazoB
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.BrazoB.PSMAR  &
   adams_id = 23  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.BrazoB.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.BrazoB.cm  &
   adams_id = 24  &
   location = 121.1284972519, 279.9999364791, 80.4243580921  &
   orientation = 270.3557913639d, 3.5200004784d, 89.760855712d
!
marker create  &
   marker_name = .Brazo_Final.BrazoB.MARKER_147  &
   adams_id = 147  &
   location = 124.2, 280.0, 0.0  &
   orientation = 270.0d, 89.9992065147d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoB.MARKER_149  &
   adams_id = 149  &
   location = 97.3, 280.0005775005, 140.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoB.MARKER_184  &
   adams_id = 184  &
   location = 132.0694464091, 269.0, 94.7  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoB.Articulacion_2_rotor_attach_J  &
   adams_id = 223  &
   location = 124.2, 280.0, 0.0  &
   orientation = 270.0d, 89.9992065147d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.BrazoB  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.BrazoB  &
   color = COLOR_R202G209B237
!
!----------------------------------- aguja ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.aguja  &
   adams_id = 25  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.aguja
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.aguja.PSMAR  &
   adams_id = 25  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.aguja.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.aguja.cm  &
   adams_id = 26  &
   location = 114.9999735437, 279.999999831, 237.0553238832  &
   orientation = 9.521563505E-07d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.aguja.MARKER_179  &
   adams_id = 179  &
   location = 114.9999735437, 279.999999831, 237.0553238832  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.aguja  &
   density = 1.0E-09
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.aguja  &
   color = WHITE
!
!----------------------------------- biela ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.biela  &
   adams_id = 26  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.biela
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.biela.PSMAR  &
   adams_id = 27  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.biela.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.biela.cm  &
   adams_id = 28  &
   location = 94.3, 295.0005775005, 140.0  &
   orientation = 0.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.biela.MARKER_170  &
   adams_id = 170  &
   location = 91.8, 310.0005775005, 140.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.biela.MARKER_174  &
   adams_id = 174  &
   location = 91.8, 310.0005775005, 140.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.biela.MARKER_167  &
   adams_id = 167  &
   location = 97.3, 280.0005775005, 140.0  &
   orientation = 270.0000000005d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.biela.Articulacion_3_rotor_attach_J  &
   adams_id = 239  &
   location = 97.3, 280.0005775005, 140.0  &
   orientation = 270.0000000005d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.biela  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.biela  &
   color = COLOR_R229G233B236
!
!---------------------------------- BrazoC2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.BrazoC2  &
   adams_id = 27  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.BrazoC2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.BrazoC2.PSMAR  &
   adams_id = 29  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.BrazoC2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.BrazoC2.cm  &
   adams_id = 30  &
   location = 107.6704102759, 279.999575655, 220.8067328481  &
   orientation = 90.0096865331d, 176.1108216203d, 4.8344512612E-03d
!
marker create  &
   marker_name = .Brazo_Final.BrazoC2.MARKER_183  &
   adams_id = 183  &
   location = 132.0694464091, 269.0, 94.7  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoC2.MARKER_185  &
   adams_id = 185  &
   location = 107.6930076318, 280.0, 228.534137809  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.BrazoC2.MARKER_187  &
   adams_id = 187  &
   location = 95.5977957869, 280.2661151745, 285.8364932271  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.BrazoC2  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.BrazoC2  &
   color = COLOR_R202G202B202
!
!---------------------------------- manivela ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.manivela  &
   adams_id = 28  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.manivela
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.manivela.PSMAR  &
   adams_id = 31  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.manivela.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.manivela.cm  &
   adams_id = 32  &
   location = 89.3, 295.0002887502, 185.0692948404  &
   orientation = 0.0d, 18.4088472531d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.manivela.MARKER_169  &
   adams_id = 169  &
   location = 91.8, 310.0005775005, 140.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.manivela.MARKER_172  &
   adams_id = 172  &
   location = 88.5881040892, 310.0005775005, 140.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.manivela.MARKER_176  &
   adams_id = 176  &
   location = 91.8, 280.0, 230.1385896808  &
   orientation = 270.0000000005d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.manivela.MARKER_178  &
   adams_id = 178  &
   location = 89.3, 295.0002887502, 185.0692948404  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.manivela  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.manivela  &
   color = COLOR_R229G233B236
!
!--------------------------------- sujetador ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.sujetador  &
   adams_id = 29  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.sujetador
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.sujetador.PSMAR  &
   adams_id = 33  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.sujetador.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.sujetador.cm  &
   adams_id = 34  &
   location = 107.6930076318, 280.0, 228.534137809  &
   orientation = 0.0d, 90.0d, 359.6736612558d
!
marker create  &
   marker_name = .Brazo_Final.sujetador.MARKER_175  &
   adams_id = 175  &
   location = 91.8, 280.0, 230.1385896808  &
   orientation = 270.0000000005d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.sujetador.MARKER_180  &
   adams_id = 180  &
   location = 114.9999735437, 279.999999831, 237.0553238832  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.sujetador.MARKER_182  &
   adams_id = 182  &
   location = 350.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.sujetador.MARKER_186  &
   adams_id = 186  &
   location = 107.6930076318, 280.0, 228.534137809  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.sujetador  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.sujetador  &
   color = COLOR_R229G233B236
!
!----------------------------------- Motor2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Motor2  &
   adams_id = 46  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Motor2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Motor2.PSMAR  &
   adams_id = 35  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Motor2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Motor2.cm  &
   adams_id = 36  &
   location = 104.10845223, 294.6853546149, 5.4064739253E-04  &
   orientation = 184.2110230934d, 89.9999824329d, 90.0006088031d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_130  &
   adams_id = 130  &
   location = 104.10845223, 294.6853546149, 5.4064739253E-04  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_132  &
   adams_id = 132  &
   location = 89.4305535909, 275.6012154996, -17.2994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_133  &
   adams_id = 133  &
   location = 89.4305535909, 297.6012154996, -17.2994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_136  &
   adams_id = 136  &
   location = 85.2807692308, 319.6012154996, -17.2994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_138  &
   adams_id = 138  &
   location = 85.2807692308, 325.3, -10.9994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_139  &
   adams_id = 139  &
   location = 89.4305535909, 325.3, -10.9994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_143  &
   adams_id = 143  &
   location = 91.4, 297.0108748494, 16.2780775005  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_145  &
   adams_id = 145  &
   location = 89.4305535909, 275.6012154996, 17.3005775005  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor2.MARKER_142  &
   adams_id = 142  &
   location = 84.8538461538, 319.6012154996, 17.3005775005  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Motor2  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Motor2  &
   color = COLOR_R202G209B237
!
!----------------------------------- Motor3 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Motor3  &
   adams_id = 63  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Motor3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Motor3.PSMAR  &
   adams_id = 37  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Motor3.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Motor3.cm  &
   adams_id = 38  &
   location = 117.39154777, 280.0000368531, 125.3146453851  &
   orientation = 89.9997607646d, 175.7889769066d, 3.7021351464E-04d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_150  &
   adams_id = 150  &
   location = 97.3, 280.0005775005, 140.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_152  &
   adams_id = 152  &
   location = 137.0730769231, 297.3, 144.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_154  &
   adams_id = 154  &
   location = 136.4686512352, 297.3, 122.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_156  &
   adams_id = 156  &
   location = 136.4686512352, 297.3, 100.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_158  &
   adams_id = 158  &
   location = 137.248899433, 291.0, 94.7  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_160  &
   adams_id = 160  &
   location = 135.9698103032, 269.0, 94.7  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_161  &
   adams_id = 161  &
   location = 132.0694464091, 262.7, 100.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_164  &
   adams_id = 164  &
   location = 136.4686512352, 297.3, 122.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_165  &
   adams_id = 165  &
   location = 132.0694464091, 262.7, 144.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.MARKER_168  &
   adams_id = 168  &
   location = 97.3, 280.0005775005, 140.0  &
   orientation = 270.0000000005d, 90.0d, 180.0d
!
marker create  &
   marker_name = .Brazo_Final.Motor3.Articulacion_3_stator_attach_J  &
   adams_id = 240  &
   location = 97.3, 280.0005775005, 140.0  &
   orientation = 270.0000000005d, 90.0d, 180.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Motor3  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Motor3  &
   color = COLOR_R202G209B237
!
!---------------------------------- contsuj -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.contsuj  &
   adams_id = 64  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.contsuj
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.contsuj.PSMAR  &
   adams_id = 39  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.contsuj.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.contsuj.cm  &
   adams_id = 40  &
   location = 126.9249150124, 280.0, 228.3904766489  &
   orientation = 359.9296657813d, 89.9993752d, 0.2603857372d
!
marker create  &
   marker_name = .Brazo_Final.contsuj.MARKER_181  &
   adams_id = 181  &
   location = 350.0, 250.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.contsuj  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.contsuj  &
   color = COLOR_R202G209B237
!
!-------------------------------- tornillo_1_1 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_1  &
   adams_id = 65  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_1.PSMAR  &
   adams_id = 41  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_1.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_1.cm  &
   adams_id = 42  &
   location = 133.0694464091, 415.6012154996, 17.3  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_1.MARKER_112  &
   adams_id = 112  &
   location = 133.0694464091, 415.6012154996, 17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_1  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_1  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_1_2 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_2  &
   adams_id = 66  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_2.PSMAR  &
   adams_id = 43  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_2.cm  &
   adams_id = 44  &
   location = 133.0694464091, 437.6012154996, 17.3  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_2.MARKER_114  &
   adams_id = 114  &
   location = 133.0694464091, 437.6012154996, 17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_2  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_2  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_1_3 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_3  &
   adams_id = 67  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_3.PSMAR  &
   adams_id = 45  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_3.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_3.cm  &
   adams_id = 46  &
   location = 133.0694464091, 459.6012154996, 17.3  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_3.MARKER_116  &
   adams_id = 116  &
   location = 133.0694464091, 459.6012154996, 17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_3  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_3  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_1_4 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_4  &
   adams_id = 68  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_4.PSMAR  &
   adams_id = 47  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_4.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_4.cm  &
   adams_id = 48  &
   location = 133.0694464091, 465.3, 11.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_4.MARKER_118  &
   adams_id = 118  &
   location = 133.0694464091, 465.3, 11.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_4  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_4  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_1_5 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_5  &
   adams_id = 69  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_5
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_5.PSMAR  &
   adams_id = 49  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_5.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_5.cm  &
   adams_id = 50  &
   location = 133.0694464091, 465.3, -11.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_5.MARKER_120  &
   adams_id = 120  &
   location = 133.0694464091, 465.3, -11.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_5  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_5  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_1_6 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_6  &
   adams_id = 70  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_6
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_6.PSMAR  &
   adams_id = 51  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_6.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_6.cm  &
   adams_id = 52  &
   location = 133.0694464091, 437.6012154996, -17.3  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_6.MARKER_124  &
   adams_id = 124  &
   location = 133.0694464091, 415.6012154996, -17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_6  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_6  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_1_7 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_7  &
   adams_id = 71  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_7
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_7.PSMAR  &
   adams_id = 53  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_7.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_7.cm  &
   adams_id = 54  &
   location = 133.0694464091, 415.6012154996, -17.3  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_7.MARKER_126  &
   adams_id = 126  &
   location = 133.0694464091, 415.6012154996, -17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_7  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_7  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_1_8 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_1_8  &
   adams_id = 72  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_1_8
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_8.PSMAR  &
   adams_id = 55  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_1_8.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_8.cm  &
   adams_id = 56  &
   location = 133.0694464091, 459.6012154996, -17.3  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_1_8.MARKER_122  &
   adams_id = 122  &
   location = 133.0694464091, 437.6012154996, -17.3  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_1_8  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_1_8  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_1 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_1  &
   adams_id = 73  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_1.PSMAR  &
   adams_id = 57  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_1.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_1.cm  &
   adams_id = 58  &
   location = 89.4305535909, 297.6012154996, -17.2994224995  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_1.MARKER_134  &
   adams_id = 134  &
   location = 89.4305535909, 297.6012154996, -17.2994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_1  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_1  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_2 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_2  &
   adams_id = 74  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_2.PSMAR  &
   adams_id = 59  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_2.cm  &
   adams_id = 60  &
   location = 89.4305535909, 275.6012154996, -17.2994224995  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_2.MARKER_131  &
   adams_id = 131  &
   location = 89.4305535909, 275.6012154996, -17.2994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_2  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_2  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_3 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_3  &
   adams_id = 75  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_3.PSMAR  &
   adams_id = 61  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_3.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_3.cm  &
   adams_id = 62  &
   location = 89.4305535909, 319.6012154996, -17.2994224995  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_3.MARKER_135  &
   adams_id = 135  &
   location = 85.2807692308, 319.6012154996, -17.2994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_3  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_3  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_4 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_4  &
   adams_id = 76  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_4.PSMAR  &
   adams_id = 63  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_4.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_4.cm  &
   adams_id = 64  &
   location = 89.4305535909, 325.3, -10.9994224995  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_4.MARKER_137  &
   adams_id = 137  &
   location = 85.2807692308, 325.3, -10.9994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_4  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_4  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_5 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_5  &
   adams_id = 77  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_5
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_5.PSMAR  &
   adams_id = 65  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_5.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_5.cm  &
   adams_id = 66  &
   location = 89.4305535909, 325.3, 11.0005775005  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_5.MARKER_140  &
   adams_id = 140  &
   location = 89.4305535909, 325.3, -10.9994224995  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_5  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_5  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_6 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_6  &
   adams_id = 78  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_6
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_6.PSMAR  &
   adams_id = 67  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_6.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_6.cm  &
   adams_id = 68  &
   location = 89.4305535909, 319.6012154996, 17.3005775005  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_6.MARKER_141  &
   adams_id = 141  &
   location = 84.8538461538, 319.6012154996, 17.3005775005  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_6  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_6  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_7 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_7  &
   adams_id = 79  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_7
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_7.PSMAR  &
   adams_id = 69  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_7.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_7.cm  &
   adams_id = 70  &
   location = 89.4305535909, 297.6012154996, 17.3005775005  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_7.MARKER_144  &
   adams_id = 144  &
   location = 91.4, 297.0108748494, 16.2780775005  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_7  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_7  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_2_8 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_2_8  &
   adams_id = 80  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_2_8
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_8.PSMAR  &
   adams_id = 71  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_2_8.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_8.cm  &
   adams_id = 72  &
   location = 89.4305535909, 275.6012154996, 17.3005775005  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_2_8.MARKER_146  &
   adams_id = 146  &
   location = 89.4305535909, 275.6012154996, 17.3005775005  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_2_8  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_2_8  &
   color = COLOR_R165G158B149
!
!----------------------------------- PernEm -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.PernEm  &
   adams_id = 81  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.PernEm
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.PernEm.PSMAR  &
   adams_id = 73  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.PernEm.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.PernEm.cm  &
   adams_id = 74  &
   location = 92.6181818182, 310.0005775005, 140.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.PernEm.MARKER_173  &
   adams_id = 173  &
   location = 91.8, 310.0005775005, 140.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.PernEm  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.PernEm  &
   color = COLOR_R229G233B236
!
!----------------------------------- PernMa -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.PernMa  &
   adams_id = 82  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.PernMa
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.PernMa.PSMAR  &
   adams_id = 75  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.PernMa.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.PernMa.cm  &
   adams_id = 76  &
   location = 88.5881040892, 310.0005775005, 140.0  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.PernMa.MARKER_171  &
   adams_id = 171  &
   location = 88.5881040892, 310.0005775005, 140.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.PernMa  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.PernMa  &
   color = COLOR_R229G233B236
!
!---------------------------------- PernMa2 -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.PernMa2  &
   adams_id = 83  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.PernMa2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.PernMa2.PSMAR  &
   adams_id = 77  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.PernMa2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.PernMa2.cm  &
   adams_id = 78  &
   location = 88.5881040892, 280.0, 230.1385896808  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.PernMa2.MARKER_177  &
   adams_id = 177  &
   location = 89.3, 295.0002887502, 185.0692948404  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.PernMa2  &
   material_type = .Brazo_Final.glass_fiber_plastic
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.PernMa2  &
   color = COLOR_R229G233B236
!
!-------------------------------- tornillo_3_1 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_1  &
   adams_id = 84  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_1
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_1.PSMAR  &
   adams_id = 79  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_1.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_1.cm  &
   adams_id = 80  &
   location = 132.0694464091, 297.3, 144.3987845004  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_1.MARKER_151  &
   adams_id = 151  &
   location = 137.0730769231, 297.3, 144.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_1  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_1  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_3_2 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_2  &
   adams_id = 85  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_2
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_2.PSMAR  &
   adams_id = 81  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_2.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_2.cm  &
   adams_id = 82  &
   location = 132.0694464091, 297.3, 122.3987845004  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_2.MARKER_153  &
   adams_id = 153  &
   location = 136.4686512352, 297.3, 122.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_2  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_2  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_3_3 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_3  &
   adams_id = 86  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_3
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_3.PSMAR  &
   adams_id = 83  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_3.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_3.cm  &
   adams_id = 84  &
   location = 132.0694464091, 297.3, 100.3987845004  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_3.MARKER_155  &
   adams_id = 155  &
   location = 136.4686512352, 297.3, 100.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_3  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_3  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_3_4 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_4  &
   adams_id = 87  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_4
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_4.PSMAR  &
   adams_id = 85  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_4.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_4.cm  &
   adams_id = 86  &
   location = 132.0694464091, 291.0, 94.7  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_4.MARKER_157  &
   adams_id = 157  &
   location = 137.248899433, 291.0, 94.7  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_4  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_4  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_3_5 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_5  &
   adams_id = 88  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_5
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_5.PSMAR  &
   adams_id = 87  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_5.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_5.cm  &
   adams_id = 88  &
   location = 132.0694464091, 269.0, 94.7  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_5.MARKER_159  &
   adams_id = 159  &
   location = 135.9698103032, 269.0, 94.7  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_5  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_5  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_3_6 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_6  &
   adams_id = 89  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_6
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_6.PSMAR  &
   adams_id = 89  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_6.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_6.cm  &
   adams_id = 90  &
   location = 132.0694464091, 262.7, 100.3987845004  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_6.MARKER_162  &
   adams_id = 162  &
   location = 132.0694464091, 262.7, 100.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_6  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_6  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_3_7 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_7  &
   adams_id = 90  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_7
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_7.PSMAR  &
   adams_id = 91  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_7.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_7.cm  &
   adams_id = 92  &
   location = 132.0694464091, 262.7, 122.3987845004  &
   orientation = 270.0d, 90.0d, 90.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_7.MARKER_163  &
   adams_id = 163  &
   location = 136.4686512352, 297.3, 122.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_7  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_7  &
   color = COLOR_R165G158B149
!
!-------------------------------- tornillo_3_8 --------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.tornillo_3_8  &
   adams_id = 91  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.tornillo_3_8
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_8.PSMAR  &
   adams_id = 93  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.tornillo_3_8.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_8.cm  &
   adams_id = 94  &
   location = 132.0694464091, 262.7, 144.3987845004  &
   orientation = 90.0d, 90.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.tornillo_3_8.MARKER_166  &
   adams_id = 166  &
   location = 132.0694464091, 262.7, 144.3987845004  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.tornillo_3_8  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.tornillo_3_8  &
   color = COLOR_R165G158B149
!
!----------------------------------- Sensor -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Sensor  &
   adams_id = 92  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Sensor
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Sensor.PSMAR  &
   adams_id = 95  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Sensor.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Sensor.cm  &
   adams_id = 96  &
   location = 95.5977957869, 280.2661151745, 285.8364932271  &
   orientation = 359.9119316224d, 92.5326029586d, 0.1336377472d
!
marker create  &
   marker_name = .Brazo_Final.Sensor.MARKER_188  &
   adams_id = 188  &
   location = 95.5977957869, 280.2661151745, 285.8364932271  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Sensor  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Sensor  &
   color = COLOR_R076G076B076
!
!--------------------------------- posaBrazo ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.posaBrazo  &
   adams_id = 93  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.posaBrazo
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.posaBrazo.PSMAR  &
   adams_id = 97  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.posaBrazo.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.posaBrazo.cm  &
   adams_id = 98  &
   location = 115.0, -2.8624627509, 112.6896236669  &
   orientation = 0.0d, 176.9654915667d, 270.0d
!
marker create  &
   marker_name = .Brazo_Final.posaBrazo.MARKER_1  &
   adams_id = 1  &
   location = 115.0, -2.8624627509, 112.6896236669  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.posaBrazo.MARKER_4  &
   adams_id = 4  &
   location = 30.0, 0.0, -30.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.posaBrazo.MARKER_190  &
   adams_id = 190  &
   location = -50.0, 50.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.posaBrazo  &
   material_type = .Brazo_Final.steel
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.posaBrazo  &
   color = COLOR_R112G112B112
!
!----------------------------------- Hombro -----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Hombro  &
   adams_id = 94  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Hombro
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Hombro.PSMAR  &
   adams_id = 99  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Hombro.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Hombro.cm  &
   adams_id = 100  &
   location = 205.7492584857, 219.2401102473, 526.1467602577  &
   orientation = 11.4184420308d, 88.7270430272d, 8.8509424873d
!
marker create  &
   marker_name = .Brazo_Final.Hombro.MARKER_194  &
   adams_id = 194  &
   location = 125.6080062957, 178.9214853235, 429.4891458785  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Hombro  &
   material_type = .Brazo_Final.carbon_fiber_0_90_epoxy
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Hombro  &
   color = COLOR_R252G221B202  &
   transparency = 50
!
!----------------------------------- brazo ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.brazo  &
   adams_id = 95  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.brazo
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.brazo.PSMAR  &
   adams_id = 101  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.brazo.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.brazo.cm  &
   adams_id = 102  &
   location = 125.6080062957, 178.9214853235, 429.4891458785  &
   orientation = 178.0511508759d, 39.1512823323d, 175.6702331854d
!
marker create  &
   marker_name = .Brazo_Final.brazo.MARKER_192  &
   adams_id = 192  &
   location = 127.2298492147, 76.6283826835, 305.8731341271  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.brazo.MARKER_193  &
   adams_id = 193  &
   location = 125.6080062957, 178.9214853235, 429.4891458785  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.brazo  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.brazo  &
   color = COLOR_R252G221B202  &
   transparency = 50
!
!--------------------------------- antebrazo ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.antebrazo  &
   adams_id = 96  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.antebrazo
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.antebrazo.PSMAR  &
   adams_id = 103  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.antebrazo.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.antebrazo.cm  &
   adams_id = 104  &
   location = 126.7029495392, 72.4575071061, 183.8413200637  &
   orientation = 352.8138925302d, 178.0262836157d, 266.9760559501d
!
marker create  &
   marker_name = .Brazo_Final.antebrazo.MARKER_189  &
   adams_id = 189  &
   location = -50.0, 50.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.antebrazo.MARKER_191  &
   adams_id = 191  &
   location = 127.2298492147, 76.6283826835, 305.8731341271  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.antebrazo.MARKER_196  &
   adams_id = 196  &
   location = 126.3637561168, 66.7826840206, 21.2349042853  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker create  &
   marker_name = .Brazo_Final.antebrazo.MARKER_198  &
   adams_id = 198  &
   location = 130.4079112318, 65.0377525324, -23.4558878349  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.antebrazo  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.antebrazo  &
   color = COLOR_R252G221B202  &
   transparency = 50
!
!----------------------------------- Palma ------------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.Palma  &
   adams_id = 97  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.Palma
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.Palma.PSMAR  &
   adams_id = 105  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.Palma.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.Palma.cm  &
   adams_id = 106  &
   location = 126.3520762828, 66.7857966771, 21.2491048416  &
   orientation = 84.4298793297d, 124.7948463387d, 357.6439184636d
!
marker create  &
   marker_name = .Brazo_Final.Palma.MARKER_195  &
   adams_id = 195  &
   location = 126.3637561168, 66.7826840206, 21.2349042853  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.Palma  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.Palma  &
   color = COLOR_R252G221B202  &
   transparency = 50
!
!---------------------------------- nudillos ----------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
part create rigid_body name_and_position  &
   part_name = .Brazo_Final.nudillos  &
   adams_id = 98  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.nudillos
!
! ****** Markers for current part ******
!
marker create  &
   marker_name = .Brazo_Final.nudillos.PSMAR  &
   adams_id = 107  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0d, 0.0d, 0.0d
!
marker attributes  &
   marker_name = .Brazo_Final.nudillos.PSMAR  &
   visibility = off
!
marker create  &
   marker_name = .Brazo_Final.nudillos.cm  &
   adams_id = 108  &
   location = 130.4079112318, 65.0377525324, -23.4558878349  &
   orientation = 265.8484689432d, 90.5846069729d, 91.9812291358d
!
marker create  &
   marker_name = .Brazo_Final.nudillos.MARKER_197  &
   adams_id = 197  &
   location = 130.4079112318, 65.0377525324, -23.4558878349  &
   orientation = 0.0d, 0.0d, 0.0d
!
part create rigid_body mass_properties  &
   part_name = .Brazo_Final.nudillos  &
   density = 1.0E-06
!
! ****** Graphics for current part ******
!
part attributes  &
   part_name = .Brazo_Final.nudillos  &
   color = COLOR_R252G221B202  &
   transparency = 50
!
! ****** Graphics from Parasolid file ******
!
file parasolid read  &
   file_name = "Articulacion_2_plant.xmt_txt"  &
   model_name = .Brazo_Final
!
geometry attributes  &
   geometry_name = .Brazo_Final.Base.SOLID1  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.BrazoA.SOLID2  &
   color = BLUE
!
geometry attributes  &
   geometry_name = .Brazo_Final.Motor1.SOLID19  &
   color = COLOR_R202G209B237
!
geometry attributes  &
   geometry_name = .Brazo_Final.Base_1_D.SOLID20  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.Base_1_I.SOLID21  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.Base_2.SOLID22  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.BrazoB.SOLID23  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.aguja.SOLID24  &
   color = WHITE
!
geometry attributes  &
   geometry_name = .Brazo_Final.aguja.SOLID25  &
   color = WHITE
!
geometry attributes  &
   geometry_name = .Brazo_Final.biela.SOLID26  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.BrazoC2.SOLID27  &
   color = BLUE
!
geometry attributes  &
   geometry_name = .Brazo_Final.BrazoC2.SOLID28  &
   color = BLUE
!
geometry attributes  &
   geometry_name = .Brazo_Final.BrazoC2.SOLID29  &
   color = BLUE
!
geometry attributes  &
   geometry_name = .Brazo_Final.manivela.SOLID30  &
   color = Orange
!
geometry attributes  &
   geometry_name = .Brazo_Final.sujetador.SOLID31  &
   color = COLOR_R229G233B236
!
geometry attributes  &
   geometry_name = .Brazo_Final.Motor2.SOLID48  &
   color = COLOR_R202G209B237
!
geometry attributes  &
   geometry_name = .Brazo_Final.Motor3.SOLID65  &
   color = COLOR_R202G209B237
!
geometry attributes  &
   geometry_name = .Brazo_Final.contsuj.SOLID66  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_1.SOLID67  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_2.SOLID68  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_3.SOLID69  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_4.SOLID70  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_5.SOLID71  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_6.SOLID72  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_7.SOLID73  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_1_8.SOLID74  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_1.SOLID75  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_2.SOLID76  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_3.SOLID77  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_4.SOLID78  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_5.SOLID79  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_6.SOLID80  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_7.SOLID81  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_2_8.SOLID82  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.PernEm.SOLID83  &
   color = COLOR_R229G233B236
!
geometry attributes  &
   geometry_name = .Brazo_Final.PernMa.SOLID84  &
   color = COLOR_R229G233B236
!
geometry attributes  &
   geometry_name = .Brazo_Final.PernMa2.SOLID85  &
   color = COLOR_R229G233B236
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_1.SOLID86  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_2.SOLID87  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_3.SOLID88  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_4.SOLID89  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_5.SOLID90  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_6.SOLID91  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_7.SOLID92  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.tornillo_3_8.SOLID93  &
   color = COLOR_R165G158B149
!
geometry attributes  &
   geometry_name = .Brazo_Final.Sensor.SOLID94  &
   color = COLOR_R076G076B076
!
geometry attributes  &
   geometry_name = .Brazo_Final.posaBrazo.SOLID95  &
   color = BLACK
!
geometry attributes  &
   geometry_name = .Brazo_Final.Hombro.SOLID96  &
   color = COLOR_R252G221B202
!
geometry attributes  &
   geometry_name = .Brazo_Final.brazo.SOLID97  &
   color = COLOR_R252G221B202
!
geometry attributes  &
   geometry_name = .Brazo_Final.antebrazo.SOLID98  &
   color = COLOR_R252G221B202
!
geometry attributes  &
   geometry_name = .Brazo_Final.Palma.SOLID99  &
   color = COLOR_R252G221B202
!
geometry attributes  &
   geometry_name = .Brazo_Final.nudillos.SOLID100  &
   color = COLOR_R252G221B202
!
!---------------------------------- Contacts ----------------------------------!
!
!
contact create  &
   contact_name = .Brazo_Final.Articulacion1  &
   adams_id = 1  &
   type = solid_to_solid  &
   i_geometry_name = .Brazo_Final.Base.SOLID1  &
   j_geometry_name = .Brazo_Final.BrazoA.SOLID2  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 100.0  &
   mu_dynamic = 100.0  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .Brazo_Final.Articulacion2  &
   adams_id = 2  &
   type = solid_to_solid  &
   i_geometry_name = .Brazo_Final.BrazoA.SOLID2  &
   j_geometry_name = .Brazo_Final.BrazoB.SOLID23  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 100.0  &
   mu_dynamic = 100.0  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .Brazo_Final.Articulacion3  &
   adams_id = 3  &
   type = solid_to_solid  &
   i_geometry_name = .Brazo_Final.biela.SOLID26  &
   j_geometry_name = .Brazo_Final.manivela.SOLID30  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1  &
   coulomb_friction = on  &
   mu_static = 0.3  &
   mu_dynamic = 0.3  &
   stiction_transition_velocity = 100.0  &
   friction_transition_velocity = 1000.0
!
contact create  &
   contact_name = .Brazo_Final.CONTACT_4  &
   adams_id = 4  &
   type = solid_to_solid  &
   i_geometry_name = .Brazo_Final.BrazoC2.SOLID29  &
   j_geometry_name = .Brazo_Final.biela.SOLID26  &
   stiffness = 1.0E+05  &
   damping = 10.0  &
   exponent = 2.2  &
   dmax = 0.1
!
!----------------------------------- Joints -----------------------------------!
!
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_1  &
   adams_id = 1  &
   i_marker_name = .Brazo_Final.posaBrazo.MARKER_1  &
   j_marker_name = .Brazo_Final.ground.MARKER_2
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_1  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_2  &
   adams_id = 2  &
   i_marker_name = .Brazo_Final.Base_1_D.MARKER_3  &
   j_marker_name = .Brazo_Final.posaBrazo.MARKER_4
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_2  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_3  &
   adams_id = 3  &
   i_marker_name = .Brazo_Final.Base_2.MARKER_5  &
   j_marker_name = .Brazo_Final.Base_1_D.MARKER_6
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_3  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_4  &
   adams_id = 4  &
   i_marker_name = .Brazo_Final.Base_2.MARKER_7  &
   j_marker_name = .Brazo_Final.Base_1_I.MARKER_8
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_4  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_5  &
   adams_id = 5  &
   i_marker_name = .Brazo_Final.Base_2.MARKER_9  &
   j_marker_name = .Brazo_Final.Base.MARKER_10
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_5  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_6  &
   adams_id = 6  &
   i_marker_name = .Brazo_Final.Base.MARKER_109  &
   j_marker_name = .Brazo_Final.Motor1.MARKER_110
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_6  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_7  &
   adams_id = 7  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_111  &
   j_marker_name = .Brazo_Final.tornillo_1_1.MARKER_112
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_7  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_8  &
   adams_id = 8  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_113  &
   j_marker_name = .Brazo_Final.tornillo_1_2.MARKER_114
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_8  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_9  &
   adams_id = 9  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_115  &
   j_marker_name = .Brazo_Final.tornillo_1_3.MARKER_116
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_9  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_10  &
   adams_id = 10  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_117  &
   j_marker_name = .Brazo_Final.tornillo_1_4.MARKER_118
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_10  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_11  &
   adams_id = 11  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_119  &
   j_marker_name = .Brazo_Final.tornillo_1_5.MARKER_120
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_11  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_12  &
   adams_id = 12  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_121  &
   j_marker_name = .Brazo_Final.tornillo_1_8.MARKER_122
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_12  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_13  &
   adams_id = 13  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_123  &
   j_marker_name = .Brazo_Final.tornillo_1_6.MARKER_124
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_13  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_14  &
   adams_id = 14  &
   i_marker_name = .Brazo_Final.Motor1.MARKER_125  &
   j_marker_name = .Brazo_Final.tornillo_1_7.MARKER_126
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_14  &
   visibility = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Brazo_Final.JOINT_15  &
   adams_id = 15  &
   i_marker_name = .Brazo_Final.Base.MARKER_127  &
   j_marker_name = .Brazo_Final.BrazoA.MARKER_128
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_15  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_16  &
   adams_id = 16  &
   i_marker_name = .Brazo_Final.BrazoA.MARKER_129  &
   j_marker_name = .Brazo_Final.Motor2.MARKER_130
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_16  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_17  &
   adams_id = 17  &
   i_marker_name = .Brazo_Final.tornillo_2_2.MARKER_131  &
   j_marker_name = .Brazo_Final.Motor2.MARKER_132
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_17  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_18  &
   adams_id = 18  &
   i_marker_name = .Brazo_Final.Motor2.MARKER_133  &
   j_marker_name = .Brazo_Final.tornillo_2_1.MARKER_134
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_18  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_19  &
   adams_id = 19  &
   i_marker_name = .Brazo_Final.tornillo_2_3.MARKER_135  &
   j_marker_name = .Brazo_Final.Motor2.MARKER_136
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_19  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_20  &
   adams_id = 20  &
   i_marker_name = .Brazo_Final.tornillo_2_4.MARKER_137  &
   j_marker_name = .Brazo_Final.Motor2.MARKER_138
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_20  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_21  &
   adams_id = 21  &
   i_marker_name = .Brazo_Final.Motor2.MARKER_139  &
   j_marker_name = .Brazo_Final.tornillo_2_5.MARKER_140
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_21  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_22  &
   adams_id = 22  &
   i_marker_name = .Brazo_Final.tornillo_2_6.MARKER_141  &
   j_marker_name = .Brazo_Final.Motor2.MARKER_142
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_22  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_23  &
   adams_id = 23  &
   i_marker_name = .Brazo_Final.Motor2.MARKER_143  &
   j_marker_name = .Brazo_Final.tornillo_2_7.MARKER_144
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_23  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_24  &
   adams_id = 24  &
   i_marker_name = .Brazo_Final.Motor2.MARKER_145  &
   j_marker_name = .Brazo_Final.tornillo_2_8.MARKER_146
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_24  &
   visibility = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Brazo_Final.JOINT_25  &
   adams_id = 25  &
   i_marker_name = .Brazo_Final.BrazoB.MARKER_147  &
   j_marker_name = .Brazo_Final.BrazoA.MARKER_148
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_25  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_26  &
   adams_id = 26  &
   i_marker_name = .Brazo_Final.BrazoB.MARKER_149  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_150
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_26  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_27  &
   adams_id = 27  &
   i_marker_name = .Brazo_Final.tornillo_3_1.MARKER_151  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_152
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_27  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_28  &
   adams_id = 28  &
   i_marker_name = .Brazo_Final.tornillo_3_2.MARKER_153  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_154
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_28  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_29  &
   adams_id = 29  &
   i_marker_name = .Brazo_Final.tornillo_3_3.MARKER_155  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_156
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_29  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_30  &
   adams_id = 30  &
   i_marker_name = .Brazo_Final.tornillo_3_4.MARKER_157  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_158
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_30  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_31  &
   adams_id = 31  &
   i_marker_name = .Brazo_Final.tornillo_3_5.MARKER_159  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_160
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_31  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_32  &
   adams_id = 32  &
   i_marker_name = .Brazo_Final.Motor3.MARKER_161  &
   j_marker_name = .Brazo_Final.tornillo_3_6.MARKER_162
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_32  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_33  &
   adams_id = 33  &
   i_marker_name = .Brazo_Final.tornillo_3_7.MARKER_163  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_164
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_33  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_34  &
   adams_id = 34  &
   i_marker_name = .Brazo_Final.Motor3.MARKER_165  &
   j_marker_name = .Brazo_Final.tornillo_3_8.MARKER_166
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_34  &
   visibility = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Brazo_Final.JOINT_35  &
   adams_id = 35  &
   i_marker_name = .Brazo_Final.biela.MARKER_167  &
   j_marker_name = .Brazo_Final.Motor3.MARKER_168
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_35  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Brazo_Final.JOINT_36  &
   adams_id = 36  &
   i_marker_name = .Brazo_Final.manivela.MARKER_169  &
   j_marker_name = .Brazo_Final.biela.MARKER_170
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_36  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_37  &
   adams_id = 37  &
   i_marker_name = .Brazo_Final.PernMa.MARKER_171  &
   j_marker_name = .Brazo_Final.manivela.MARKER_172
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_37  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_38  &
   adams_id = 38  &
   i_marker_name = .Brazo_Final.PernEm.MARKER_173  &
   j_marker_name = .Brazo_Final.biela.MARKER_174
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_38  &
   visibility = off  &
   name_visibility = off
!
constraint create joint revolute  &
   joint_name = .Brazo_Final.JOINT_39  &
   adams_id = 39  &
   i_marker_name = .Brazo_Final.sujetador.MARKER_175  &
   j_marker_name = .Brazo_Final.manivela.MARKER_176
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_39  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_40  &
   adams_id = 40  &
   i_marker_name = .Brazo_Final.PernMa2.MARKER_177  &
   j_marker_name = .Brazo_Final.manivela.MARKER_178
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_40  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_41  &
   adams_id = 41  &
   i_marker_name = .Brazo_Final.aguja.MARKER_179  &
   j_marker_name = .Brazo_Final.sujetador.MARKER_180
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_41  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_42  &
   adams_id = 42  &
   i_marker_name = .Brazo_Final.contsuj.MARKER_181  &
   j_marker_name = .Brazo_Final.sujetador.MARKER_182
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_42  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_43  &
   adams_id = 43  &
   i_marker_name = .Brazo_Final.BrazoC2.MARKER_183  &
   j_marker_name = .Brazo_Final.BrazoB.MARKER_184
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_43  &
   visibility = off  &
   name_visibility = off
!
constraint create joint translational  &
   joint_name = .Brazo_Final.JOINT_44  &
   adams_id = 44  &
   i_marker_name = .Brazo_Final.BrazoC2.MARKER_185  &
   j_marker_name = .Brazo_Final.sujetador.MARKER_186
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_44  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_45  &
   adams_id = 45  &
   i_marker_name = .Brazo_Final.BrazoC2.MARKER_187  &
   j_marker_name = .Brazo_Final.Sensor.MARKER_188
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_45  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_46  &
   adams_id = 46  &
   i_marker_name = .Brazo_Final.antebrazo.MARKER_189  &
   j_marker_name = .Brazo_Final.posaBrazo.MARKER_190
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_46  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_47  &
   adams_id = 47  &
   i_marker_name = .Brazo_Final.antebrazo.MARKER_191  &
   j_marker_name = .Brazo_Final.brazo.MARKER_192
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_47  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_48  &
   adams_id = 48  &
   i_marker_name = .Brazo_Final.brazo.MARKER_193  &
   j_marker_name = .Brazo_Final.Hombro.MARKER_194
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_48  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_49  &
   adams_id = 49  &
   i_marker_name = .Brazo_Final.Palma.MARKER_195  &
   j_marker_name = .Brazo_Final.antebrazo.MARKER_196
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_49  &
   visibility = off  &
   name_visibility = off
!
constraint create joint fixed  &
   joint_name = .Brazo_Final.JOINT_50  &
   adams_id = 50  &
   i_marker_name = .Brazo_Final.nudillos.MARKER_197  &
   j_marker_name = .Brazo_Final.antebrazo.MARKER_198
!
constraint attributes  &
   constraint_name = .Brazo_Final.JOINT_50  &
   visibility = off  &
   name_visibility = off
!
!----------------------------------- Forces -----------------------------------!
!
!
!----------------------------- Simulation Scripts -----------------------------!
!
!
simulation script create  &
   sim_script_name = .Brazo_Final.Last_Sim  &
   commands =   &
              "simulation single_run transient type=auto_select initial_static=no end_time=5.0 step_size=1.0E-003 model_name=.Brazo_Final"
!
!-------------------------- Adams View UDE Instances --------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
undo begin_block suppress = yes
!
ude create instance  &
   instance_name = .Brazo_Final.Articulacion_1  &
   definition_name = .amachinery.parts.ac_motor_external  &
   location = 137.0, 420.0, 0.0  &
   orientation = 270.0, 90.0, 180.0
!
ude create instance  &
   instance_name = .Brazo_Final.Articulacion_2  &
   definition_name = .amachinery.parts.ac_motor_external  &
   location = 124.2, 280.0, 0.0  &
   orientation = 270.0, 89.9992065147, 180.0
!
ude create instance  &
   instance_name = .Brazo_Final.Articulacion_3  &
   definition_name = .amachinery.parts.ac_motor_external  &
   location = 97.3, 280.0005775005, 140.0  &
   orientation = 270.0000000005, 90.0, 180.0
!
ude create instance  &
   instance_name = .Brazo_Final.Articulacion_1_plant  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Brazo_Final.Articulacion_2_plant  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Brazo_Final.Articulacion_3_plant  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
ude create instance  &
   instance_name = .Brazo_Final.ControlPID  &
   definition_name = .controls.controls_plant  &
   location = 0.0, 0.0, 0.0  &
   orientation = 0.0, 0.0, 0.0
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.method  &
   string_value = "external"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.motor_type  &
   string_value = "dc"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.external_method  &
   string_value = "Co_Simulation"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.input_output  &
   string_value = "standard"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.equation_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.library_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.plant_export  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.target_software  &
   string_value = "matlab"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.Pinput_array  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.Poutput_array  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.existing_control_plant  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.static_hold  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.GSE_success_flag  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.error_tolerance  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.error_scale  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.communication_interval  &
   real_value = 1.0E-02
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.visibility  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.toggle_initialize  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.plant_name  &
   object_value = .Brazo_Final.Articulacion_1_plant
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_length  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_width  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_length  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_radius  &
   real_value = (2.5E-02m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_mass  &
   real_value = (1.0kg)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_Ixx  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_Iyy  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_Izz  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_density  &
   real_value = 7.801E-06
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_mass  &
   real_value = (1.0kg)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_Ixx  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_Iyy  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_Izz  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_density  &
   real_value = 7.801E-06
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.multiplier_type  &
   string_value = "scale_factor"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.scale_factor  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.step_start_time
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.step_end_time
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.step_start_value
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.step_end_value
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.scale_function  &
   string_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotation_direction  &
   string_value = "ccw"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_cw  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_attachment_type  &
   string_value = "Fixed"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_attachment_type  &
   string_value = "Fixed"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.detailed_geometry_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_off_diagonal_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_off_diagonal_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.connection_name  &
   string_value = "MOTION_1"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_attachment  &
   string_value = ".Brazo_Final.Base.Articulacion_1_rotor_attach_J"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_attachment  &
   string_value = ".Brazo_Final.BrazoA.Articulacion_1_stator_attach_J"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.unit_conversion_torque  &
   real_value = (UNITS_CONVERSION_FACTOR("meter") * UNITS_CONVERSION_FACTOR("newton"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.unit_conversion_length  &
   real_value = (UNITS_CONVERSION_FACTOR("meter"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.unit_conversion_angle  &
   real_value = (UNITS_CONVERSION_FACTOR("radians"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.connection_type  &
   string_value = "replace_motion"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.motor_flip  &
   string_value = "default"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.motor_geometry_flip  &
   string_value = "on"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.flip_motor  &
   real_value = -1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.force_display  &
   string_value = "none"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_attach_radial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_attach_axial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_attach_bending_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_attach_torsional_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.stator_attach_damping_ratio  &
   real_value = (1.0 * 1sec)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_attach_radial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_attach_axial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_attach_bending_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_attach_torsional_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.rotor_attach_damping_ratio  &
   real_value = (1.0 * 1sec)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.mar_joi_I  &
   object_value = .Brazo_Final.Base.Articulacion_1_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.mar_joi_J  &
   object_value = .Brazo_Final.BrazoA.Articulacion_1_stator_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.mar_sfo_I  &
   object_value = .Brazo_Final.Base.Articulacion_1_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.mar_sfo_J  &
   object_value = .Brazo_Final.BrazoA.Articulacion_1_stator_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.mar_rotor_attach_J  &
   object_value = .Brazo_Final.Base.Articulacion_1_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1.mar_stator_attach_J  &
   object_value = .Brazo_Final.BrazoA.Articulacion_1_stator_attach_J
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.method  &
   string_value = "external"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.motor_type  &
   string_value = "dc"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.external_method  &
   string_value = "Co_Simulation"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.input_output  &
   string_value = "standard"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.equation_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.library_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.plant_export  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.target_software  &
   string_value = "matlab"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.Pinput_array  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.Poutput_array  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.existing_control_plant  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.static_hold  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.GSE_success_flag  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.error_tolerance  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.error_scale  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.communication_interval  &
   real_value = 1.0E-02
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.visibility  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.toggle_initialize  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.plant_name  &
   object_value = .Brazo_Final.Articulacion_2_plant
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_length  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_width  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_length  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_radius  &
   real_value = (2.5E-02m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_mass  &
   real_value = (1.0kg)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_Ixx  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_Iyy  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_Izz  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_density  &
   real_value = 7.801E-06
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_mass  &
   real_value = (1.0kg)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_Ixx  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_Iyy  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_Izz  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_density  &
   real_value = 7.801E-06
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.multiplier_type  &
   string_value = "scale_factor"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.scale_factor  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.step_start_time
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.step_end_time
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.step_start_value
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.step_end_value
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.scale_function  &
   string_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotation_direction  &
   string_value = "ccw"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_cw  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_attachment_type  &
   string_value = "Fixed"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_attachment_type  &
   string_value = "Fixed"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.detailed_geometry_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_off_diagonal_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_off_diagonal_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.connection_name  &
   string_value = "MOTION_2"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_attachment  &
   string_value = ".Brazo_Final.BrazoB.Articulacion_2_rotor_attach_J"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_attachment  &
   string_value = ".Brazo_Final.BrazoA.Articulacion_2_stator_attach_J"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.unit_conversion_torque  &
   real_value = (UNITS_CONVERSION_FACTOR("meter") * UNITS_CONVERSION_FACTOR("newton"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.unit_conversion_length  &
   real_value = (UNITS_CONVERSION_FACTOR("meter"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.unit_conversion_angle  &
   real_value = (UNITS_CONVERSION_FACTOR("radians"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.connection_type  &
   string_value = "replace_motion"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.motor_flip  &
   string_value = "default"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.motor_geometry_flip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.flip_motor  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.force_display  &
   string_value = "none"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_attach_radial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_attach_axial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_attach_bending_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_attach_torsional_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.stator_attach_damping_ratio  &
   real_value = (1.0 * 1sec)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_attach_radial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_attach_axial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_attach_bending_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_attach_torsional_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.rotor_attach_damping_ratio  &
   real_value = (1.0 * 1sec)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.mar_joi_I  &
   object_value = .Brazo_Final.BrazoB.Articulacion_2_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.mar_joi_J  &
   object_value = .Brazo_Final.BrazoA.Articulacion_2_stator_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.mar_sfo_I  &
   object_value = .Brazo_Final.BrazoB.Articulacion_2_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.mar_sfo_J  &
   object_value = .Brazo_Final.BrazoA.Articulacion_2_stator_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.mar_rotor_attach_J  &
   object_value = .Brazo_Final.BrazoB.Articulacion_2_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2.mar_stator_attach_J  &
   object_value = .Brazo_Final.BrazoA.Articulacion_2_stator_attach_J
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.method  &
   string_value = "external"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.motor_type  &
   string_value = "dc"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.external_method  &
   string_value = "Co_Simulation"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.input_output  &
   string_value = "standard"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.equation_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.library_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.plant_export  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.target_software  &
   string_value = "matlab"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.Pinput_array  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.Poutput_array  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.existing_control_plant  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.static_hold  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.GSE_success_flag  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.error_tolerance  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.error_scale  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.communication_interval  &
   real_value = 1.0E-02
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.visibility  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.toggle_initialize  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.plant_name  &
   object_value = .Brazo_Final.Articulacion_3_plant
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_length  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_width  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_length  &
   real_value = (0.1m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_radius  &
   real_value = (2.5E-02m)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_mass  &
   real_value = (1.0kg)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_Ixx  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_Iyy  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_Izz  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_density  &
   real_value = 7.801E-06
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_mass  &
   real_value = (1.0kg)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_Ixx  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_Iyy  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_Izz  &
   real_value = (1.0E-05(kg-m**2))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_Ixy  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_Izx  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_Iyz  &
   real_value = 0.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_density  &
   real_value = 7.801E-06
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_material  &
   string_value = ".materials.steel"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.multiplier_type  &
   string_value = "scale_factor"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.scale_factor  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.step_start_time
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.step_end_time
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.step_start_value
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.step_end_value
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.scale_function  &
   string_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotation_direction  &
   string_value = "ccw"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_cw  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_attachment_type  &
   string_value = "Fixed"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_attachment_type  &
   string_value = "Fixed"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.detailed_geometry_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_off_diagonal_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_mass_option  &
   string_value = "mass"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_off_diagonal_flag  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.connection_name  &
   string_value = "MOTION_3"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_attachment  &
   string_value = ".Brazo_Final.biela.Articulacion_3_rotor_attach_J"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_attachment  &
   string_value = ".Brazo_Final.Motor3.Articulacion_3_stator_attach_J"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.unit_conversion_torque  &
   real_value = (UNITS_CONVERSION_FACTOR("meter") * UNITS_CONVERSION_FACTOR("newton"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.unit_conversion_length  &
   real_value = (UNITS_CONVERSION_FACTOR("meter"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.unit_conversion_angle  &
   real_value = (UNITS_CONVERSION_FACTOR("radians"))
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.connection_type  &
   string_value = "replace_motion"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.motor_flip  &
   string_value = "default"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.motor_geometry_flip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.flip_motor  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.force_display  &
   string_value = "none"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_attach_radial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_attach_axial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_attach_bending_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_attach_torsional_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.stator_attach_damping_ratio  &
   real_value = (1.0 * 1sec)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_attach_radial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_attach_axial_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_attach_bending_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_attach_torsional_stiffness  &
   real_value = 1.0
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.rotor_attach_damping_ratio  &
   real_value = (1.0 * 1sec)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.mar_joi_I  &
   object_value = .Brazo_Final.biela.Articulacion_3_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.mar_joi_J  &
   object_value = .Brazo_Final.Motor3.Articulacion_3_stator_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.mar_sfo_I  &
   object_value = .Brazo_Final.biela.Articulacion_3_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.mar_sfo_J  &
   object_value = .Brazo_Final.Motor3.Articulacion_3_stator_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.mar_rotor_attach_J  &
   object_value = .Brazo_Final.biela.Articulacion_3_rotor_attach_J
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3.mar_stator_attach_J  &
   object_value = .Brazo_Final.Motor3.Articulacion_3_stator_attach_J
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.input_channels  &
   object_value = .Brazo_Final.Articulacion_1.var_motor_torque
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.output_channels  &
   object_value =   &
      .Brazo_Final.Articulacion_1.var_angacc,  &
      .Brazo_Final.Articulacion_1.var_omega,  &
      .Brazo_Final.Articulacion_1.var_angdisp
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.file_name  &
   string_value = "Articulacion_1_plant"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.target  &
   string_value = "matlab"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.host  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.include_mnf  &
   string_value = "yes"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_1_plant.ude_group  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_1_plant
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.input_channels  &
   object_value = .Brazo_Final.Articulacion_2.var_motor_torque
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.output_channels  &
   object_value =   &
      .Brazo_Final.Articulacion_2.var_angacc,  &
      .Brazo_Final.Articulacion_2.var_omega,  &
      .Brazo_Final.Articulacion_2.var_angdisp
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.file_name  &
   string_value = "Articulacion_2_plant"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.target  &
   string_value = "matlab"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.host  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.include_mnf  &
   string_value = "yes"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_2_plant.ude_group  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_2_plant
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.input_channels  &
   object_value = .Brazo_Final.Articulacion_3.var_motor_torque
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.output_channels  &
   object_value =   &
      .Brazo_Final.Articulacion_3.var_angacc,  &
      .Brazo_Final.Articulacion_3.var_omega,  &
      .Brazo_Final.Articulacion_3.var_angdisp
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.file_name  &
   string_value = "Articulacion_3_plant"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.target  &
   string_value = "matlab"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.host  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.include_mnf  &
   string_value = "yes"
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.Articulacion_3_plant.ude_group  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_3_plant
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.input_channels  &
   object_value =   &
      .Brazo_Final.Articulacion_1.var_motor_torque,  &
      .Brazo_Final.Articulacion_2.var_motor_torque,  &
      .Brazo_Final.Articulacion_3.var_motor_torque
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.output_channels  &
   object_value =   &
      .Brazo_Final.Articulacion_1.var_angdisp,  &
      .Brazo_Final.Articulacion_1.var_omega,  &
      .Brazo_Final.Articulacion_1.var_angacc,  &
      .Brazo_Final.Articulacion_2.var_angdisp,  &
      .Brazo_Final.Articulacion_2.var_omega,  &
      .Brazo_Final.Articulacion_2.var_angacc,  &
      .Brazo_Final.Articulacion_3.var_angdisp,  &
      .Brazo_Final.Articulacion_3.var_omega,  &
      .Brazo_Final.Articulacion_3.var_angacc,  &
      .Brazo_Final.Articulacion_1.var_motor_torque,  &
      .Brazo_Final.Articulacion_2.var_motor_torque,  &
      .Brazo_Final.Articulacion_3.var_motor_torque
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.file_name  &
   string_value = "Control_Final"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.event_name  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.solver_type  &
   string_value = "cplusplus"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.target  &
   string_value = "MATLAB"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.FMI_Master  &
   string_value = "none"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.analysis_type  &
   string_value = "non_linear"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.analysis_init  &
   string_value = "no"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.analysis_init_str  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.user_lib  &
   string_value = ""
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.host  &
   string_value = "MSI.huawei.net"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.dynamic_state  &
   string_value = "on"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.tcp_ip  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.output_rate  &
   integer_value = 1
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.realtime  &
   string_value = "off"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.include_mnf  &
   string_value = "yes"
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.hp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.pv_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.gp_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.pf_group  &
   object_value = (NONE)
!
variable modify  &
   variable_name = .Brazo_Final.ControlPID.ude_group  &
   object_value = (NONE)
!
ude modify instance  &
   instance_name = .Brazo_Final.ControlPID
!
undo end_block
!
!------------------------------ Dynamic Graphics ------------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
geometry create shape gcontact  &
   contact_force_name = .Brazo_Final.GCONTACT_104  &
   adams_id = 104  &
   contact_element_name = .Brazo_Final.Articulacion1  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Brazo_Final.GCONTACT_104  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .Brazo_Final.GCONTACT_107  &
   adams_id = 107  &
   contact_element_name = .Brazo_Final.Articulacion2  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Brazo_Final.GCONTACT_107  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .Brazo_Final.GCONTACT_110  &
   adams_id = 110  &
   contact_element_name = .Brazo_Final.Articulacion3  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Brazo_Final.GCONTACT_110  &
   color = RED
!
geometry create shape gcontact  &
   contact_force_name = .Brazo_Final.GCONTACT_113  &
   adams_id = 113  &
   contact_element_name = .Brazo_Final.CONTACT_4  &
   force_display = components
!
geometry attributes  &
   geometry_name = .Brazo_Final.GCONTACT_113  &
   color = RED
!
!---------------------------------- Motions -----------------------------------!
!
!
constraint create motion_generator  &
   motion_name = .Brazo_Final.MOTION_1  &
   adams_id = 1  &
   type_of_freedom = rotational  &
   joint_name = .Brazo_Final.JOINT_15  &
   function = ""
!
constraint attributes  &
   constraint_name = .Brazo_Final.MOTION_1  &
   active = off  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .Brazo_Final.MOTION_2  &
   adams_id = 2  &
   type_of_freedom = rotational  &
   joint_name = .Brazo_Final.JOINT_25  &
   function = ""
!
constraint attributes  &
   constraint_name = .Brazo_Final.MOTION_2  &
   active = off  &
   name_visibility = off
!
constraint create motion_generator  &
   motion_name = .Brazo_Final.MOTION_3  &
   adams_id = 3  &
   type_of_freedom = rotational  &
   joint_name = .Brazo_Final.JOINT_35  &
   function = ""
!
constraint attributes  &
   constraint_name = .Brazo_Final.MOTION_3  &
   active = off  &
   name_visibility = off
!
!---------------------------------- Accgrav -----------------------------------!
!
!
force create body gravitational  &
   gravity_field_name = gravity  &
   x_component_gravity = 0.0  &
   y_component_gravity = -9806.65  &
   z_component_gravity = 0.0
!
!----------------------------- Analysis settings ------------------------------!
!
!
!---------------------------- Adams View Variables ----------------------------!
!
!
variable create  &
   variable_name = .Brazo_Final.layout_config  &
   integer_value = 1
!
!---------------------------- Function definitions ----------------------------!
!
!
constraint modify motion_generator  &
   motion_name = .Brazo_Final.MOTION_1  &
   function = "0d * time"
!
constraint modify motion_generator  &
   motion_name = .Brazo_Final.MOTION_2  &
   function = "0d * time"
!
constraint modify motion_generator  &
   motion_name = .Brazo_Final.MOTION_3  &
   function = "-30.0d * time"
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_1
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_2
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_3
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_1_plant
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_2_plant
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Brazo_Final.Articulacion_3_plant
!
!-------------------------- Adams View UDE Instance ---------------------------!
!
!
ude modify instance  &
   instance_name = .Brazo_Final.ControlPID
!
!--------------------------- Expression definitions ---------------------------!
!
!
defaults coordinate_system  &
   default_coordinate_system = ground
!
marker modify  &
   marker_name = .Brazo_Final.Base.Articulacion_1_rotor_attach_J  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}mm, .Brazo_Final.Articulacion_1))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}deg, .Brazo_Final.Articulacion_1))  &
   relative_to = .Brazo_Final.Base
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
marker modify  &
   marker_name = .Brazo_Final.BrazoA.Articulacion_1_stator_attach_J  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}mm, .Brazo_Final.Articulacion_1))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}deg, .Brazo_Final.Articulacion_1))  &
   relative_to = .Brazo_Final.BrazoA
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
marker modify  &
   marker_name = .Brazo_Final.BrazoA.Articulacion_2_stator_attach_J  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}mm, .Brazo_Final.Articulacion_2))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}deg, .Brazo_Final.Articulacion_2))  &
   relative_to = .Brazo_Final.BrazoA
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
marker modify  &
   marker_name = .Brazo_Final.BrazoB.Articulacion_2_rotor_attach_J  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}mm, .Brazo_Final.Articulacion_2))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}deg, .Brazo_Final.Articulacion_2))  &
   relative_to = .Brazo_Final.BrazoB
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
marker modify  &
   marker_name = .Brazo_Final.biela.Articulacion_3_rotor_attach_J  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}mm, .Brazo_Final.Articulacion_3))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}deg, .Brazo_Final.Articulacion_3))  &
   relative_to = .Brazo_Final.biela
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
marker modify  &
   marker_name = .Brazo_Final.Motor3.Articulacion_3_stator_attach_J  &
   location =   &
      (LOC_RELATIVE_TO({0.0, 0.0, 0.0}mm, .Brazo_Final.Articulacion_3))  &
   orientation =   &
      (ORI_RELATIVE_TO({0.0, 0.0, 0.0}deg, .Brazo_Final.Articulacion_3))  &
   relative_to = .Brazo_Final.Motor3
!
defaults coordinate_system  &
   default_coordinate_system = .Brazo_Final.ground
!
material modify  &
   material_name = .Brazo_Final.glass_fiber_plastic  &
   density = (1370(kg/meter**3))  &
   orthotropic_constants =   &
      (8.4276E+09(Newton/meter**2)),  &
      (2.1721E+09(Newton/meter**2)),  &
      (1.6117E+09(Newton/meter**2))
!
material modify  &
   material_name = .Brazo_Final.steel  &
   density = (7801.0(kg/meter**3))  &
   youngs_modulus = (2.07E+11(Newton/meter**2))
!
material modify  &
   material_name = .Brazo_Final.carbon_fiber_0_90_epoxy  &
   density = (1510(kg/meter**3))  &
   orthotropic_constants =   &
      (1.23611E+10(Newton/meter**2)),  &
      (2.7443E+10(Newton/meter**2)),  &
      (2.8949E+09(Newton/meter**2))
!
model display  &
   model_name = Brazo_Final
