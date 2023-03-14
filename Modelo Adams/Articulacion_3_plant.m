% Adams / MATLAB Interface - Release 2016.0.0
global ADAMS_sysdir; % used by setup_rtw_for_adams.m
global ADAMS_host; % used by start_adams_daemon.m
machine=computer;
datestr(now)
if strcmp(machine, 'SOL2')
   arch = 'solaris32';
elseif strcmp(machine, 'SOL64')
   arch = 'solaris32';
elseif strcmp(machine, 'GLNX86')
   arch = 'linux32';
elseif strcmp(machine, 'GLNXA64')
   arch = 'linux64';
elseif strcmp(machine, 'PCWIN')
   arch = 'win32';
elseif strcmp(machine, 'PCWIN64')
   arch = 'win64';
else
   disp( '%%% Error : Platform unknown or unsupported by Adams Controls.' ) ;
   arch = 'unknown_or_unsupported';
   return
end
   [flag, topdir]=system('adams2016 -top');
if flag == 0
  temp_str=strcat(topdir, '/controls/', arch);
  addpath(temp_str)
  temp_str=strcat(topdir, '/controls/', 'matlab');
  addpath(temp_str)
  temp_str=strcat(topdir, '/controls/', 'utils');
  addpath(temp_str)
  ADAMS_sysdir = strcat(topdir, '');
else
  addpath( 'D:\PRGRAMS\MSC.SOFTWARE\Adams\2016\controls/win64' ) ;
  addpath( 'D:\PRGRAMS\MSC.SOFTWARE\Adams\2016\controls/win32' ) ;
  addpath( 'D:\PRGRAMS\MSC.SOFTWARE\Adams\2016\controls/matlab' ) ;
  addpath( 'D:\PRGRAMS\MSC.SOFTWARE\Adams\2016\controls/utils' ) ;
  ADAMS_sysdir = 'D:\PRGRAMS\MSC.SOFTWARE\Adams\2016\' ;
end
ADAMS_exec = '' ;
ADAMS_host = '' ;
ADAMS_cwd ='D:\Datos Jose\Documentos\Tesis\Modelo del prototipo\Simulacion_final_F'  ;
ADAMS_prefix = 'Articulacion_3_plant' ;
ADAMS_static = 'no' ;
ADAMS_solver_type = 'C++' ;
ADAMS_version = '2016' ;
if exist([ADAMS_prefix,'.adm']) == 0
   disp( ' ' ) ;
   disp( '%%% Warning : missing Adams plant model file(.adm) for Co-simulation or Function Evaluation.' ) ;
   disp( '%%% If necessary, please re-export model files or copy the exported plant model files into the' ) ;
   disp( '%%% working directory.  You may disregard this warning if the Co-simulation/Function Evaluation' ) ;
   disp( '%%% is TCP/IP-based (running Adams on another machine), or if setting up MATLAB/Real-Time Workshop' ) ;
   disp( '%%% for generation of an External System Library.' ) ;
   disp( ' ' ) ;
end
ADAMS_init = '' ;
ADAMS_inputs  = 'Articulacion_3.var_motor_torque' ;
ADAMS_outputs = 'Articulacion_3.var_angacc!Articulacion_3.var_omega!Articulacion_3.var_angdisp' ;
ADAMS_pinput = 'Articulacion_3_plant.ctrl_pinput' ;
ADAMS_poutput = 'Articulacion_3_plant.ctrl_poutput' ;
ADAMS_uy_ids  = [
                   9
                   12
                   11
                   10
                ] ;
ADAMS_mode   = 'non-linear' ;
tmp_in  = decode( ADAMS_inputs  ) ;
tmp_out = decode( ADAMS_outputs ) ;
disp( ' ' ) ;
disp( '%%% INFO : ADAMS plant actuators names :' ) ;
disp( [int2str([1:size(tmp_in,1)]'),blanks(size(tmp_in,1))',tmp_in] ) ;
disp( '%%% INFO : ADAMS plant sensors   names :' ) ;
disp( [int2str([1:size(tmp_out,1)]'),blanks(size(tmp_out,1))',tmp_out] ) ;
disp( ' ' ) ;
clear tmp_in tmp_out ;
% Adams / MATLAB Interface - Release 2016.0.0
