# Makefile created by mkmf $Id: mkmf,v 13.0 2006/04/10 21:20:01 fms Exp $ 


SRCROOT = ./src/
CPPFLAGS = -I/usr/include/openmpi -I/usr/include/
FFLAGS = $(CPPFLAGS) -fcray-pointer -g -O2 -Wp,-w -fdefault-real-8 -fPIC
FC = mpif90
LD = mpif90
LDFLAGS = -L/usr/lib/ -L/usr/lib/ -lnetcdff -lmpi 
CPPDEFS = -Duse_libMPI -Duse_netCDF -DUSE_LIMA -DSPMD -DLAND_BND_TRACERS

.DEFAULT:
	-touch $@
all: fms.x
horiz_interp_spherical.o: $(SRCROOT)shared/horiz_interp/horiz_interp_spherical.f90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/horiz_interp/horiz_interp_spherical.f90
ecmfft.o: $(SRCROOT)atmos_fv_dynamics/model/ecmfft.f90
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/ecmfft.f90
time_interp_external.o: $(SRCROOT)shared/time_interp/time_interp_external.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h mpp.o mpp_io.o time_manager.o get_cal_time.o mpp_domains.o time_interp.o axis_utils.o fms.o platform.o horiz_interp.o constants.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include	$(SRCROOT)shared/time_interp/time_interp_external.F90
pmaxmin.o: $(SRCROOT)atmos_fv_dynamics/tools/pmaxmin.F90 mod_comm.o fv_arrays.o mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/pmaxmin.F90
timingModule.o: $(SRCROOT)atmos_fv_dynamics/tools/timingModule.F90 shr_kind_mod.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/timingModule.F90
time_manager.o: $(SRCROOT)shared/time_manager/time_manager.F90 fms.o constants.o fms_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/time_manager/time_manager.F90
mpp.o: $(SRCROOT)shared/mpp/mpp.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/system_clock.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_nocomm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_mpi.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_mpi.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_mpi.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_nocomm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_nocomm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_nocomm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_nocomm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum_int.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum.h mpp_parameter.o mpp_data.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include	$(SRCROOT)shared/mpp/mpp.F90
fv_diagnostics.o: $(SRCROOT)atmos_fv_dynamics/tools/fv_diagnostics.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc diag_manager.o constants.o time_manager.o fms.o mpp_domains.o fv_pack.o tracer_manager.o field_manager.o mpp.o fv_arrays.o pmaxmin.o pv_module.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/tools/fv_diagnostics.F90
horiz_interp_type.o: $(SRCROOT)shared/horiz_interp/horiz_interp_type.f90 mpp.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/horiz_interp/horiz_interp_type.f90
fv_arrays.o: $(SRCROOT)atmos_fv_dynamics/model/fv_arrays.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc mpp.o mpp_domains.o mpp_pset.o mod_comm.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/model/fv_arrays.F90
sw_core.o: $(SRCROOT)atmos_fv_dynamics/model/sw_core.F90 tp_core.o shr_kind_mod.o pft_module.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/sw_core.F90
tp_core.o: $(SRCROOT)atmos_fv_dynamics/model/tp_core.F90 shr_kind_mod.o fill_module.o mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/tp_core.F90
init_sw_ic.o: $(SRCROOT)atmos_fv_dynamics/tools/init_sw_ic.F90 fv_pack.o pv_module.o mod_comm.o shr_kind_mod.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/init_sw_ic.F90
update_fv_phys.o: $(SRCROOT)atmos_fv_dynamics/model/update_fv_phys.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc fv_pack.o pft_module.o constants.o field_manager.o tracer_manager.o atmos_nudge.o time_manager.o mod_comm.o mpp.o fv_arrays.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/model/update_fv_phys.F90
tracer_2d.o: $(SRCROOT)atmos_fv_dynamics/model/tracer_2d.F90 fv_pack.o tp_core.o diag_manager.o fv_diagnostics.o shr_kind_mod.o fill_module.o mod_comm.o fv_arrays.o mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/tracer_2d.F90
atmos_model.o: $(SRCROOT)atmos_solo/atmos_model.f90 atmosphere.o time_manager.o fms.o fms_io.o mpp_io.o diag_manager.o field_manager.o tracer_manager.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_solo/atmos_model.f90
mod_comm.o: $(SRCROOT)atmos_fv_dynamics/tools/mod_comm.F90 timingModule.o shr_kind_mod.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/mod_comm.F90
constants.o: $(SRCROOT)shared/constants/constants.f90
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/constants/constants.f90
hswf.o: $(SRCROOT)atmos_fv_dynamics/driver/solo/hswf.F90 mod_comm.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/driver/solo/hswf.F90
memuse.o: $(SRCROOT)shared/memutils/memuse.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) -c	$(SRCROOT)shared/memutils/memuse.c
mapz_module.o: $(SRCROOT)atmos_fv_dynamics/model/mapz_module.F90 fv_pack.o fill_module.o fv_diagnostics.o diag_manager.o mod_comm.o time_manager.o fv_arrays.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/mapz_module.F90
dyn_core.o: $(SRCROOT)atmos_fv_dynamics/model/dyn_core.F90 fv_pack.o shr_kind_mod.o pft_module.o sw_core.o timingModule.o mod_comm.o fv_arrays.o pmaxmin.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/dyn_core.F90
atmos_nudge.o: $(SRCROOT)atmos_shared/atmos_nudge/atmos_nudge.f90 fms.o time_manager.o data_override.o diag_manager.o mpp.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_shared/atmos_nudge/atmos_nudge.f90
fft99.o: $(SRCROOT)shared/fft/fft99.f90 constants.o mpp.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/fft/fft99.f90
nsclock.o: $(SRCROOT)shared/mpp/nsclock.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) -c	$(SRCROOT)shared/mpp/nsclock.c
horiz_interp.o: $(SRCROOT)shared/horiz_interp/horiz_interp.f90 fms.o mpp.o constants.o horiz_interp_type.o horiz_interp_conserve.o horiz_interp_bilinear.o horiz_interp_bicubic.o horiz_interp_spherical.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/horiz_interp/horiz_interp.f90
field_manager.o: $(SRCROOT)shared/field_manager/field_manager.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/field_manager/parse.inc mpp.o mpp_io.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/field_manager	$(SRCROOT)shared/field_manager/field_manager.F90
gmean.o: $(SRCROOT)atmos_fv_dynamics/tools/gmean.F90 fv_pack.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/gmean.F90
horiz_interp_bicubic.o: $(SRCROOT)shared/horiz_interp/horiz_interp_bicubic.f90 mpp.o fms.o horiz_interp_type.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/horiz_interp/horiz_interp_bicubic.f90
par_vecsum.o: $(SRCROOT)atmos_fv_dynamics/tools/par_vecsum.F90 mod_comm.o fv_arrays.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/par_vecsum.F90
mpp_io.o: $(SRCROOT)shared/mpp/mpp_io.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_misc.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_connect.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_read.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_read_2Ddecomp.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_write.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write_2Ddecomp.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write.h mpp_parameter.o mpp.o mpp_domains.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include	$(SRCROOT)shared/mpp/mpp_io.F90
diag_manager.o: $(SRCROOT)shared/diag_manager/diag_manager.f90 time_manager.o mpp_io.o fms.o mpp.o diag_axis.o diag_data.o diag_util.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/diag_manager/diag_manager.f90
diag_axis.o: $(SRCROOT)shared/diag_manager/diag_axis.f90 mpp_domains.o fms.o diag_data.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/diag_manager/diag_axis.f90
axis_utils.o: $(SRCROOT)shared/axis_utils/axis_utils.F90 mpp_io.o mpp.o fms.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/axis_utils/axis_utils.F90
fv_phys.o: $(SRCROOT)atmos_fv_dynamics/driver/solo/fv_phys.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc time_manager.o hs_forcing.o constants.o fv_pack.o shr_kind_mod.o update_fv_phys.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/driver/solo/fv_phys.F90
fms_io.o: $(SRCROOT)shared/fms/fms_io.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_2d.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_3d.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_4d.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/write_data.inc mpp_io.o mpp_domains.o mpp.o platform.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms	$(SRCROOT)shared/fms/fms_io.F90
hs_forcing.o: $(SRCROOT)atmos_param/hs_forcing/hs_forcing.f90 constants.o fms.o time_manager.o diag_manager.o field_manager.o tracer_manager.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_param/hs_forcing/hs_forcing.f90
pft_module.o: $(SRCROOT)atmos_fv_dynamics/model/pft_module.F90 ecmfft.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/pft_module.F90
fm_util.o: $(SRCROOT)shared/field_manager/fm_util.F90 field_manager.o fms.o mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/field_manager/fm_util.F90
fv_restart.o: $(SRCROOT)atmos_fv_dynamics/tools/fv_restart.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc fms.o fms_io.o mpp_io.o fv_pack.o tracer_manager.o field_manager.o mod_comm.o fv_arrays.o mpp.o mpp_domains.o constants.o pmaxmin.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/tools/fv_restart.F90
atmosphere.o: $(SRCROOT)atmos_fv_dynamics/driver/solo/atmosphere.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc time_manager.o fms.o hs_forcing.o constants.o fv_pack.o fv_diagnostics.o timingModule.o fv_restart.o fv_dynamics.o fv_phys.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/driver/solo/atmosphere.F90
tracer_manager.o: $(SRCROOT)shared/tracer_manager/tracer_manager.F90 mpp.o mpp_io.o fms.o field_manager.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/tracer_manager/tracer_manager.F90
set_eta.o: $(SRCROOT)atmos_fv_dynamics/tools/set_eta.f90 fv_pack.o fms.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/set_eta.f90
getmax.o: $(SRCROOT)atmos_fv_dynamics/tools/getmax.F90 mod_comm.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/getmax.F90
age_of_air.o: $(SRCROOT)atmos_fv_dynamics/tools/age_of_air.F90
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/age_of_air.F90
platform.o: $(SRCROOT)shared/platform/platform.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include	$(SRCROOT)shared/platform/platform.F90
init_dry_atm.o: $(SRCROOT)atmos_fv_dynamics/tools/init_dry_atm.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc fv_pack.o fms.o mod_comm.o mpp_io.o fv_arrays.o pmaxmin.o constants.o shr_kind_mod.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/tools/init_dry_atm.F90
fv_dynamics.o: $(SRCROOT)atmos_fv_dynamics/model/fv_dynamics.F90 fv_pack.o mapz_module.o dyn_core.o pft_module.o timingModule.o mod_comm.o time_manager.o fv_arrays.o shr_kind_mod.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/fv_dynamics.F90
fms.o: $(SRCROOT)shared/fms/fms.f90 mpp.o mpp_domains.o mpp_io.o fms_io.o memutils.o constants.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/fms/fms.f90
diag_data.o: $(SRCROOT)shared/diag_manager/diag_data.F90 time_manager.o mpp_domains.o mpp_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/diag_manager/diag_data.F90
threadloc.o: $(SRCROOT)shared/mpp/threadloc.c
	$(CC) $(CPPDEFS) $(CPPFLAGS) $(CFLAGS) -c	$(SRCROOT)shared/mpp/threadloc.c
gaussian_topog.o: $(SRCROOT)shared/topography/gaussian_topog.f90 fms.o constants.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/topography/gaussian_topog.f90
fft.o: $(SRCROOT)shared/fft/fft.F90 platform.o fms.o fft99.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/fft/fft.F90
horiz_interp_conserve.o: $(SRCROOT)shared/horiz_interp/horiz_interp_conserve.f90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/horiz_interp/horiz_interp_conserve.f90
data_override.o: $(SRCROOT)shared/data_override/data_override.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h platform.o constants.o mpp_io.o mpp.o horiz_interp.o time_interp_external.o fms_io.o fms.o axis_utils.o mpp_domains.o time_manager.o diag_manager.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include	$(SRCROOT)shared/data_override/data_override.F90
shr_kind_mod.o: $(SRCROOT)atmos_fv_dynamics/model/shr_kind_mod.f90
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/shr_kind_mod.f90
pv_module.o: $(SRCROOT)atmos_fv_dynamics/tools/pv_module.F90 fv_pack.o mod_comm.o fv_arrays.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/tools/pv_module.F90
mpp_pset.o: $(SRCROOT)shared/mpp/mpp_pset.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h mpp.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include	$(SRCROOT)shared/mpp/mpp_pset.F90
mpp_data.o: $(SRCROOT)shared/mpp/mpp_data.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_nocomm.inc mpp_parameter.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include	$(SRCROOT)shared/mpp/mpp_data.F90
horiz_interp_bilinear.o: $(SRCROOT)shared/horiz_interp/horiz_interp_bilinear.f90 mpp.o fms.o constants.o horiz_interp_type.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/horiz_interp/horiz_interp_bilinear.f90
mpp_domains.o: $(SRCROOT)shared/mpp/mpp_domains.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_datatype.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_define.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_misc.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_update_domains2D.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_reduce.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_reduce.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_sum.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_field.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_new.h mpp_parameter.o mpp_data.o mpp.o mpp_pset.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include	$(SRCROOT)shared/mpp/mpp_domains.F90
get_cal_time.o: $(SRCROOT)shared/time_manager/get_cal_time.f90 fms.o time_manager.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/time_manager/get_cal_time.f90
diag_util.o: $(SRCROOT)shared/diag_manager/diag_util.F90 diag_data.o diag_axis.o diag_output.o fms.o mpp_domains.o time_manager.o mpp_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/diag_manager/diag_util.F90
memutils.o: $(SRCROOT)shared/memutils/memutils.F90 mpp.o mpp_io.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c	$(SRCROOT)shared/memutils/memutils.F90
fv_pack.o: $(SRCROOT)atmos_fv_dynamics/model/fv_pack.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc timingModule.o shr_kind_mod.o mod_comm.o fms.o mpp.o mpp_domains.o constants.o tracer_manager.o field_manager.o fv_arrays.o pft_module.o
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model	$(SRCROOT)atmos_fv_dynamics/model/fv_pack.F90
diag_output.o: $(SRCROOT)shared/diag_manager/diag_output.f90 mpp_io.o mpp_domains.o mpp.o diag_axis.o time_manager.o fms.o platform.o diag_data.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/diag_manager/diag_output.f90
mpp_parameter.o: $(SRCROOT)shared/mpp/mpp_parameter.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h
	$(FC) $(CPPDEFS) $(CPPFLAGS) $(FFLAGS) -c -I/home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include	$(SRCROOT)shared/mpp/mpp_parameter.F90
vert_advection.o: $(SRCROOT)atmos_shared/vert_advection/vert_advection.f90 fms.o mpp.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_shared/vert_advection/vert_advection.f90
fill_module.o: $(SRCROOT)atmos_fv_dynamics/model/fill_module.f90
	$(FC) $(FFLAGS) -c	$(SRCROOT)atmos_fv_dynamics/model/fill_module.f90
time_interp.o: $(SRCROOT)shared/time_interp/time_interp.f90 time_manager.o fms.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/time_interp/time_interp.f90
topography.o: $(SRCROOT)shared/topography/topography.f90 gaussian_topog.o horiz_interp.o fms.o fms_io.o
	$(FC) $(FFLAGS) -c	$(SRCROOT)shared/topography/topography.f90
./fv_restart.F90: $(SRCROOT)atmos_fv_dynamics/tools/fv_restart.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/fv_restart.F90 .
./mpp_reduce_mpi.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_mpi.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_mpi.h .
./horiz_interp.f90: $(SRCROOT)shared/horiz_interp/horiz_interp.f90
	cp $(SRCROOT)shared/horiz_interp/horiz_interp.f90 .
./get_cal_time.f90: $(SRCROOT)shared/time_manager/get_cal_time.f90
	cp $(SRCROOT)shared/time_manager/get_cal_time.f90 .
./mpp_global_field.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_field.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_field.h .
./mpp_io_connect.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_connect.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_connect.inc .
./mpp_util_mpi.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_mpi.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_mpi.inc .
./mpp_do_redistribute_caf.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_caf.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_caf.h .
./fm_util.F90: $(SRCROOT)shared/field_manager/fm_util.F90
	cp $(SRCROOT)shared/field_manager/fm_util.F90 .
./sw_core.F90: $(SRCROOT)atmos_fv_dynamics/model/sw_core.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/sw_core.F90 .
./mpp_global_sum.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_sum.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_sum.h .
./mpp_transmit.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit.inc .
./mpp_domains_reduce.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_reduce.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_reduce.inc .
./mpp_util_nocomm.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_nocomm.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_nocomm.inc .
./mpp_read_2Ddecomp.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_read_2Ddecomp.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_read_2Ddecomp.h .
./mpp_pset.F90: $(SRCROOT)shared/mpp/mpp_pset.F90
	cp $(SRCROOT)shared/mpp/mpp_pset.F90 .
./field_manager.F90: $(SRCROOT)shared/field_manager/field_manager.F90
	cp $(SRCROOT)shared/field_manager/field_manager.F90 .
./time_manager.F90: $(SRCROOT)shared/time_manager/time_manager.F90
	cp $(SRCROOT)shared/time_manager/time_manager.F90 .
./mpp_io_write.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_write.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_write.inc .
./tp_core.F90: $(SRCROOT)atmos_fv_dynamics/model/tp_core.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/tp_core.F90 .
./mpp_do_redistribute_gsm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_gsm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_gsm.h .
./mpp_reduce_sma.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_sma.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_sma.h .
./mpp_sum_gsm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_gsm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_gsm.h .
./mpp_io_util.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_util.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_util.inc .
./mpp_do_updateV_old.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_old.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_old.h .
./system_clock.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/system_clock.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/system_clock.h .
./memutils.F90: $(SRCROOT)shared/memutils/memutils.F90
	cp $(SRCROOT)shared/memutils/memutils.F90 .
./mpp.F90: $(SRCROOT)shared/mpp/mpp.F90
	cp $(SRCROOT)shared/mpp/mpp.F90 .
./mpp_do_updateV_caf.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_caf.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_caf.h .
./mpp_do_update_gsm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_gsm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_gsm.h .
./mpp_parameter.F90: $(SRCROOT)shared/mpp/mpp_parameter.F90
	cp $(SRCROOT)shared/mpp/mpp_parameter.F90 .
./update_fv_phys.F90: $(SRCROOT)atmos_fv_dynamics/model/update_fv_phys.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/update_fv_phys.F90 .
./mpp_do_updateV_new.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_new.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_new.h .
./fv_point.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc .
./mpp_do_redistribute_new.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_new.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_new.h .
./constants.f90: $(SRCROOT)shared/constants/constants.f90
	cp $(SRCROOT)shared/constants/constants.f90 .
./atmosphere.F90: $(SRCROOT)atmos_fv_dynamics/driver/solo/atmosphere.F90
	cp $(SRCROOT)atmos_fv_dynamics/driver/solo/atmosphere.F90 .
./hs_forcing.f90: $(SRCROOT)atmos_param/hs_forcing/hs_forcing.f90
	cp $(SRCROOT)atmos_param/hs_forcing/hs_forcing.f90 .
./init_sw_ic.F90: $(SRCROOT)atmos_fv_dynamics/tools/init_sw_ic.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/init_sw_ic.F90 .
./mpp_sum.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum.inc .
./pft_module.F90: $(SRCROOT)atmos_fv_dynamics/model/pft_module.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/pft_module.F90 .
./fv_pack.F90: $(SRCROOT)atmos_fv_dynamics/model/fv_pack.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/fv_pack.F90 .
./nsclock.c: $(SRCROOT)shared/mpp/nsclock.c
	cp $(SRCROOT)shared/mpp/nsclock.c .
./mpp_do_update_new.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_new.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_new.h .
./mpp_do_global_field_gsm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_gsm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_gsm.h .
./mpp_transmit_sma.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_sma.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_sma.h .
./diag_output.f90: $(SRCROOT)shared/diag_manager/diag_output.f90
	cp $(SRCROOT)shared/diag_manager/diag_output.f90 .
./hswf.F90: $(SRCROOT)atmos_fv_dynamics/driver/solo/hswf.F90
	cp $(SRCROOT)atmos_fv_dynamics/driver/solo/hswf.F90 .
./fms_platform.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h .
./read_data_2d.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_2d.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_2d.inc .
./mpp_domains.F90: $(SRCROOT)shared/mpp/mpp_domains.F90
	cp $(SRCROOT)shared/mpp/mpp_domains.F90 .
./mpp_update_domains2D.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_update_domains2D.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_update_domains2D.h .
./fv_dynamics.F90: $(SRCROOT)atmos_fv_dynamics/model/fv_dynamics.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/fv_dynamics.F90 .
./gmean.F90: $(SRCROOT)atmos_fv_dynamics/tools/gmean.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/gmean.F90 .
./mpp_write.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write.h .
./memuse.c: $(SRCROOT)shared/memutils/memuse.c
	cp $(SRCROOT)shared/memutils/memuse.c .
./dyn_core.F90: $(SRCROOT)atmos_fv_dynamics/model/dyn_core.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/dyn_core.F90 .
./tracer_2d.F90: $(SRCROOT)atmos_fv_dynamics/model/tracer_2d.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/tracer_2d.F90 .
./mpp_sum_sma.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_sma.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_sma.h .
./mpp_util.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util.inc .
./mpp_reduce_nocomm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_nocomm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_nocomm.h .
./mpp_reduce_caf.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_caf.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_caf.h .
./horiz_interp_conserve.f90: $(SRCROOT)shared/horiz_interp/horiz_interp_conserve.f90
	cp $(SRCROOT)shared/horiz_interp/horiz_interp_conserve.f90 .
./mpp_comm_nocomm.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_nocomm.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_nocomm.inc .
./horiz_interp_type.f90: $(SRCROOT)shared/horiz_interp/horiz_interp_type.f90
	cp $(SRCROOT)shared/horiz_interp/horiz_interp_type.f90 .
./mpp_sum_caf.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_caf.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_caf.h .
./data_override.F90: $(SRCROOT)shared/data_override/data_override.F90
	cp $(SRCROOT)shared/data_override/data_override.F90 .
./parse.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/field_manager/parse.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/field_manager/parse.inc .
./mapz_module.F90: $(SRCROOT)atmos_fv_dynamics/model/mapz_module.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/mapz_module.F90 .
./read_data_4d.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_4d.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_4d.inc .
./mpp_do_global_field_new.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_new.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_new.h .
./pmaxmin.F90: $(SRCROOT)atmos_fv_dynamics/tools/pmaxmin.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/pmaxmin.F90 .
./mpp_data_nocomm.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_nocomm.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_nocomm.inc .
./platform.F90: $(SRCROOT)shared/platform/platform.F90
	cp $(SRCROOT)shared/platform/platform.F90 .
./mpp_datatype.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_datatype.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_datatype.h .
./mpp_domains_comm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.h .
./mpp_data_mpi.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_mpi.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_mpi.inc .
./mpp_io_read.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_read.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_read.inc .
./fv_arrays.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h .
./fft99.f90: $(SRCROOT)shared/fft/fft99.f90
	cp $(SRCROOT)shared/fft/fft99.f90 .
./diag_data.F90: $(SRCROOT)shared/diag_manager/diag_data.F90
	cp $(SRCROOT)shared/diag_manager/diag_data.F90 .
./topography.f90: $(SRCROOT)shared/topography/topography.f90
	cp $(SRCROOT)shared/topography/topography.f90 .
./horiz_interp_bicubic.f90: $(SRCROOT)shared/horiz_interp/horiz_interp_bicubic.f90
	cp $(SRCROOT)shared/horiz_interp/horiz_interp_bicubic.f90 .
./mpp_do_global_field_caf.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_caf.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_caf.h .
./time_interp_external.F90: $(SRCROOT)shared/time_interp/time_interp_external.F90
	cp $(SRCROOT)shared/time_interp/time_interp_external.F90 .
./threadloc.c: $(SRCROOT)shared/mpp/threadloc.c
	cp $(SRCROOT)shared/mpp/threadloc.c .
./mpp_io_misc.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_misc.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_misc.inc .
./shr_kind_mod.f90: $(SRCROOT)atmos_fv_dynamics/model/shr_kind_mod.f90
	cp $(SRCROOT)atmos_fv_dynamics/model/shr_kind_mod.f90 .
./diag_manager.f90: $(SRCROOT)shared/diag_manager/diag_manager.f90
	cp $(SRCROOT)shared/diag_manager/diag_manager.f90 .
./mpp_global_reduce.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_reduce.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_reduce.h .
./mpp_domains_comm.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.inc .
./mpp_domains_util.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_util.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_util.inc .
./mpp_util_sma.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_sma.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_sma.inc .
./mpp_comm_mpi.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_mpi.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_mpi.inc .
./fill_module.f90: $(SRCROOT)atmos_fv_dynamics/model/fill_module.f90
	cp $(SRCROOT)atmos_fv_dynamics/model/fill_module.f90 .
./mpp_do_updateV_gsm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_gsm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_gsm.h .
./mpp_do_update_old.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_old.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_old.h .
./ecmfft.f90: $(SRCROOT)atmos_fv_dynamics/model/ecmfft.f90
	cp $(SRCROOT)atmos_fv_dynamics/model/ecmfft.f90 .
./age_of_air.F90: $(SRCROOT)atmos_fv_dynamics/tools/age_of_air.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/age_of_air.F90 .
./fms_io.F90: $(SRCROOT)shared/fms/fms_io.F90
	cp $(SRCROOT)shared/fms/fms_io.F90 .
./pv_module.F90: $(SRCROOT)atmos_fv_dynamics/tools/pv_module.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/pv_module.F90 .
./mpp_do_redistribute_old.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_old.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_old.h .
./mpp_data_sma.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_sma.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_sma.inc .
./mpp_domains_misc.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_misc.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_misc.inc .
./mpp_io.F90: $(SRCROOT)shared/mpp/mpp_io.F90
	cp $(SRCROOT)shared/mpp/mpp_io.F90 .
./diag_axis.f90: $(SRCROOT)shared/diag_manager/diag_axis.f90
	cp $(SRCROOT)shared/diag_manager/diag_axis.f90 .
./mpp_transmit_mpi.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_mpi.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_mpi.h .
./read_data_3d.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_3d.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_3d.inc .
./init_dry_atm.F90: $(SRCROOT)atmos_fv_dynamics/tools/init_dry_atm.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/init_dry_atm.F90 .
./write_data.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/write_data.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/write_data.inc .
./mpp_chksum.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum.h .
./fv_diagnostics.F90: $(SRCROOT)atmos_fv_dynamics/tools/fv_diagnostics.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/fv_diagnostics.F90 .
./mod_comm.F90: $(SRCROOT)atmos_fv_dynamics/tools/mod_comm.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/mod_comm.F90 .
./mpp_comm_sma.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_sma.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_sma.inc .
./fft.F90: $(SRCROOT)shared/fft/fft.F90
	cp $(SRCROOT)shared/fft/fft.F90 .
./set_eta.f90: $(SRCROOT)atmos_fv_dynamics/tools/set_eta.f90
	cp $(SRCROOT)atmos_fv_dynamics/tools/set_eta.f90 .
./axis_utils.F90: $(SRCROOT)shared/axis_utils/axis_utils.F90
	cp $(SRCROOT)shared/axis_utils/axis_utils.F90 .
./fms.f90: $(SRCROOT)shared/fms/fms.f90
	cp $(SRCROOT)shared/fms/fms.f90 .
./mpp_sum_nocomm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_nocomm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_nocomm.h .
./timingModule.F90: $(SRCROOT)atmos_fv_dynamics/tools/timingModule.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/timingModule.F90 .
./mpp_reduce_gsm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_gsm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_gsm.h .
./diag_util.F90: $(SRCROOT)shared/diag_manager/diag_util.F90
	cp $(SRCROOT)shared/diag_manager/diag_util.F90 .
./atmos_model.f90: $(SRCROOT)atmos_solo/atmos_model.f90
	cp $(SRCROOT)atmos_solo/atmos_model.f90 .
./atmos_nudge.f90: $(SRCROOT)atmos_shared/atmos_nudge/atmos_nudge.f90
	cp $(SRCROOT)atmos_shared/atmos_nudge/atmos_nudge.f90 .
./mpp_do_global_field_old.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_old.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_old.h .
./fv_phys.F90: $(SRCROOT)atmos_fv_dynamics/driver/solo/fv_phys.F90
	cp $(SRCROOT)atmos_fv_dynamics/driver/solo/fv_phys.F90 .
./mpp_write_2Ddecomp.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write_2Ddecomp.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write_2Ddecomp.h .
./mpp_do_update_caf.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_caf.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_caf.h .
./mpp_data.F90: $(SRCROOT)shared/mpp/mpp_data.F90
	cp $(SRCROOT)shared/mpp/mpp_data.F90 .
./gaussian_topog.f90: $(SRCROOT)shared/topography/gaussian_topog.f90
	cp $(SRCROOT)shared/topography/gaussian_topog.f90 .
./tracer_manager.F90: $(SRCROOT)shared/tracer_manager/tracer_manager.F90
	cp $(SRCROOT)shared/tracer_manager/tracer_manager.F90 .
./mpp_domains_define.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_define.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_define.inc .
./mpp_comm.inc: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm.inc
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm.inc .
./mpp_transmit_nocomm.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_nocomm.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_nocomm.h .
./getmax.F90: $(SRCROOT)atmos_fv_dynamics/tools/getmax.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/getmax.F90 .
./par_vecsum.F90: $(SRCROOT)atmos_fv_dynamics/tools/par_vecsum.F90
	cp $(SRCROOT)atmos_fv_dynamics/tools/par_vecsum.F90 .
./horiz_interp_spherical.f90: $(SRCROOT)shared/horiz_interp/horiz_interp_spherical.f90
	cp $(SRCROOT)shared/horiz_interp/horiz_interp_spherical.f90 .
./vert_advection.f90: $(SRCROOT)atmos_shared/vert_advection/vert_advection.f90
	cp $(SRCROOT)atmos_shared/vert_advection/vert_advection.f90 .
./horiz_interp_bilinear.f90: $(SRCROOT)shared/horiz_interp/horiz_interp_bilinear.f90
	cp $(SRCROOT)shared/horiz_interp/horiz_interp_bilinear.f90 .
./time_interp.f90: $(SRCROOT)shared/time_interp/time_interp.f90
	cp $(SRCROOT)shared/time_interp/time_interp.f90 .
./mpp_chksum_int.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum_int.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum_int.h .
./mpp_sum_mpi.h: /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_mpi.h
	cp /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_mpi.h .
./fv_arrays.F90: $(SRCROOT)atmos_fv_dynamics/model/fv_arrays.F90
	cp $(SRCROOT)atmos_fv_dynamics/model/fv_arrays.F90 .
SRC = $(SRCROOT)shared/horiz_interp/horiz_interp_spherical.f90 $(SRCROOT)atmos_fv_dynamics/model/ecmfft.f90 $(SRCROOT)shared/time_interp/time_interp_external.F90 $(SRCROOT)atmos_fv_dynamics/tools/pmaxmin.F90 $(SRCROOT)atmos_fv_dynamics/tools/timingModule.F90 $(SRCROOT)shared/time_manager/time_manager.F90 $(SRCROOT)shared/mpp/mpp.F90 $(SRCROOT)atmos_fv_dynamics/tools/fv_diagnostics.F90 $(SRCROOT)shared/horiz_interp/horiz_interp_type.f90 $(SRCROOT)atmos_fv_dynamics/model/fv_arrays.F90 $(SRCROOT)atmos_fv_dynamics/model/sw_core.F90 $(SRCROOT)atmos_fv_dynamics/model/tp_core.F90 $(SRCROOT)atmos_fv_dynamics/tools/init_sw_ic.F90 $(SRCROOT)atmos_fv_dynamics/model/update_fv_phys.F90 $(SRCROOT)atmos_fv_dynamics/model/tracer_2d.F90 $(SRCROOT)atmos_solo/atmos_model.f90 $(SRCROOT)atmos_fv_dynamics/tools/mod_comm.F90 $(SRCROOT)shared/constants/constants.f90 $(SRCROOT)atmos_fv_dynamics/driver/solo/hswf.F90 $(SRCROOT)shared/memutils/memuse.c $(SRCROOT)atmos_fv_dynamics/model/mapz_module.F90 $(SRCROOT)atmos_fv_dynamics/model/dyn_core.F90 $(SRCROOT)atmos_shared/atmos_nudge/atmos_nudge.f90 $(SRCROOT)shared/fft/fft99.f90 $(SRCROOT)shared/mpp/nsclock.c $(SRCROOT)shared/horiz_interp/horiz_interp.f90 $(SRCROOT)shared/field_manager/field_manager.F90 $(SRCROOT)atmos_fv_dynamics/tools/gmean.F90 $(SRCROOT)shared/horiz_interp/horiz_interp_bicubic.f90 $(SRCROOT)atmos_fv_dynamics/tools/par_vecsum.F90 $(SRCROOT)shared/mpp/mpp_io.F90 $(SRCROOT)shared/diag_manager/diag_manager.f90 $(SRCROOT)shared/diag_manager/diag_axis.f90 $(SRCROOT)shared/axis_utils/axis_utils.F90 $(SRCROOT)atmos_fv_dynamics/driver/solo/fv_phys.F90 $(SRCROOT)shared/fms/fms_io.F90 $(SRCROOT)atmos_param/hs_forcing/hs_forcing.f90 $(SRCROOT)atmos_fv_dynamics/model/pft_module.F90 $(SRCROOT)shared/field_manager/fm_util.F90 $(SRCROOT)atmos_fv_dynamics/tools/fv_restart.F90 $(SRCROOT)atmos_fv_dynamics/driver/solo/atmosphere.F90 $(SRCROOT)shared/tracer_manager/tracer_manager.F90 $(SRCROOT)atmos_fv_dynamics/tools/set_eta.f90 $(SRCROOT)atmos_fv_dynamics/tools/getmax.F90 $(SRCROOT)atmos_fv_dynamics/tools/age_of_air.F90 $(SRCROOT)shared/platform/platform.F90 $(SRCROOT)atmos_fv_dynamics/tools/init_dry_atm.F90 $(SRCROOT)atmos_fv_dynamics/model/fv_dynamics.F90 $(SRCROOT)shared/fms/fms.f90 $(SRCROOT)shared/diag_manager/diag_data.F90 $(SRCROOT)shared/mpp/threadloc.c $(SRCROOT)shared/topography/gaussian_topog.f90 $(SRCROOT)shared/fft/fft.F90 $(SRCROOT)shared/horiz_interp/horiz_interp_conserve.f90 $(SRCROOT)shared/data_override/data_override.F90 $(SRCROOT)atmos_fv_dynamics/model/shr_kind_mod.f90 $(SRCROOT)atmos_fv_dynamics/tools/pv_module.F90 $(SRCROOT)shared/mpp/mpp_pset.F90 $(SRCROOT)shared/mpp/mpp_data.F90 $(SRCROOT)shared/horiz_interp/horiz_interp_bilinear.f90 $(SRCROOT)shared/mpp/mpp_domains.F90 $(SRCROOT)shared/time_manager/get_cal_time.f90 $(SRCROOT)shared/diag_manager/diag_util.F90 $(SRCROOT)shared/memutils/memutils.F90 $(SRCROOT)atmos_fv_dynamics/model/fv_pack.F90 $(SRCROOT)shared/diag_manager/diag_output.f90 $(SRCROOT)shared/mpp/mpp_parameter.F90 $(SRCROOT)atmos_shared/vert_advection/vert_advection.f90 $(SRCROOT)atmos_fv_dynamics/model/fill_module.f90 $(SRCROOT)shared/time_interp/time_interp.f90 $(SRCROOT)shared/topography/topography.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_mpi.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_misc.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/system_clock.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_write.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_read_2Ddecomp.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_nocomm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_reduce.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_reduce.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_misc.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_sum.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_connect.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_field.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_read.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_mpi.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_datatype.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_mpi.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum_int.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_nocomm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_4d.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/field_manager/parse.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_nocomm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_define.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_nocomm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_nocomm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write_2Ddecomp.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_update_domains2D.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_2d.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_nocomm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/write_data.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_3d.inc
OBJ = horiz_interp_spherical.o ecmfft.o time_interp_external.o pmaxmin.o timingModule.o time_manager.o mpp.o fv_diagnostics.o horiz_interp_type.o fv_arrays.o sw_core.o tp_core.o init_sw_ic.o update_fv_phys.o tracer_2d.o atmos_model.o mod_comm.o constants.o hswf.o memuse.o mapz_module.o dyn_core.o atmos_nudge.o fft99.o nsclock.o horiz_interp.o field_manager.o gmean.o horiz_interp_bicubic.o par_vecsum.o mpp_io.o diag_manager.o diag_axis.o axis_utils.o fv_phys.o fms_io.o hs_forcing.o pft_module.o fm_util.o fv_restart.o atmosphere.o tracer_manager.o set_eta.o getmax.o age_of_air.o platform.o init_dry_atm.o fv_dynamics.o fms.o diag_data.o threadloc.o gaussian_topog.o fft.o horiz_interp_conserve.o data_override.o shr_kind_mod.o pv_module.o mpp_pset.o mpp_data.o horiz_interp_bilinear.o mpp_domains.o get_cal_time.o diag_util.o memutils.o fv_pack.o diag_output.o mpp_parameter.o vert_advection.o fill_module.o time_interp.o topography.o
OFF = $(SRCROOT)atmos_fv_dynamics/tools/fv_restart.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_mpi.h $(SRCROOT)shared/horiz_interp/horiz_interp.f90 $(SRCROOT)shared/time_manager/get_cal_time.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_field.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_connect.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_caf.h $(SRCROOT)shared/field_manager/fm_util.F90 $(SRCROOT)atmos_fv_dynamics/model/sw_core.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_sum.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_reduce.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_nocomm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_read_2Ddecomp.h $(SRCROOT)shared/mpp/mpp_pset.F90 $(SRCROOT)shared/field_manager/field_manager.F90 $(SRCROOT)shared/time_manager/time_manager.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_write.inc $(SRCROOT)atmos_fv_dynamics/model/tp_core.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/system_clock.h $(SRCROOT)shared/memutils/memutils.F90 $(SRCROOT)shared/mpp/mpp.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_caf.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_gsm.h $(SRCROOT)shared/mpp/mpp_parameter.F90 $(SRCROOT)atmos_fv_dynamics/model/update_fv_phys.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_point.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_new.h $(SRCROOT)shared/constants/constants.f90 $(SRCROOT)atmos_fv_dynamics/driver/solo/atmosphere.F90 $(SRCROOT)atmos_param/hs_forcing/hs_forcing.f90 $(SRCROOT)atmos_fv_dynamics/tools/init_sw_ic.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum.inc $(SRCROOT)atmos_fv_dynamics/model/pft_module.F90 $(SRCROOT)atmos_fv_dynamics/model/fv_pack.F90 $(SRCROOT)shared/mpp/nsclock.c /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_new.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_sma.h $(SRCROOT)shared/diag_manager/diag_output.f90 $(SRCROOT)atmos_fv_dynamics/driver/solo/hswf.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/include/fms_platform.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_2d.inc $(SRCROOT)shared/mpp/mpp_domains.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_update_domains2D.h $(SRCROOT)atmos_fv_dynamics/model/fv_dynamics.F90 $(SRCROOT)atmos_fv_dynamics/tools/gmean.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write.h $(SRCROOT)shared/memutils/memuse.c $(SRCROOT)atmos_fv_dynamics/model/dyn_core.F90 $(SRCROOT)atmos_fv_dynamics/model/tracer_2d.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_sma.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_nocomm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_caf.h $(SRCROOT)shared/horiz_interp/horiz_interp_conserve.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_nocomm.inc $(SRCROOT)shared/horiz_interp/horiz_interp_type.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_caf.h $(SRCROOT)shared/data_override/data_override.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/field_manager/parse.inc $(SRCROOT)atmos_fv_dynamics/model/mapz_module.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_4d.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_new.h $(SRCROOT)atmos_fv_dynamics/tools/pmaxmin.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_nocomm.inc $(SRCROOT)shared/platform/platform.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_datatype.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_mpi.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_read.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/atmos_fv_dynamics/model/fv_arrays.h $(SRCROOT)shared/fft/fft99.f90 $(SRCROOT)shared/diag_manager/diag_data.F90 $(SRCROOT)shared/topography/topography.f90 $(SRCROOT)shared/horiz_interp/horiz_interp_bicubic.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_caf.h $(SRCROOT)shared/time_interp/time_interp_external.F90 $(SRCROOT)shared/mpp/threadloc.c /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_io_misc.inc $(SRCROOT)atmos_fv_dynamics/model/shr_kind_mod.f90 $(SRCROOT)shared/diag_manager/diag_manager.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_global_reduce.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_comm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_util.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_util_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_mpi.inc $(SRCROOT)atmos_fv_dynamics/model/fill_module.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_updateV_gsm.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_old.h $(SRCROOT)atmos_fv_dynamics/model/ecmfft.f90 $(SRCROOT)atmos_fv_dynamics/tools/age_of_air.F90 $(SRCROOT)shared/fms/fms_io.F90 $(SRCROOT)atmos_fv_dynamics/tools/pv_module.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_redistribute_old.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_data_sma.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_misc.inc $(SRCROOT)shared/mpp/mpp_io.F90 $(SRCROOT)shared/diag_manager/diag_axis.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_mpi.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/read_data_3d.inc $(SRCROOT)atmos_fv_dynamics/tools/init_dry_atm.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/fms/write_data.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum.h $(SRCROOT)atmos_fv_dynamics/tools/fv_diagnostics.F90 $(SRCROOT)atmos_fv_dynamics/tools/mod_comm.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm_sma.inc $(SRCROOT)shared/fft/fft.F90 $(SRCROOT)atmos_fv_dynamics/tools/set_eta.f90 $(SRCROOT)shared/axis_utils/axis_utils.F90 $(SRCROOT)shared/fms/fms.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_nocomm.h $(SRCROOT)atmos_fv_dynamics/tools/timingModule.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_reduce_gsm.h $(SRCROOT)shared/diag_manager/diag_util.F90 $(SRCROOT)atmos_solo/atmos_model.f90 $(SRCROOT)atmos_shared/atmos_nudge/atmos_nudge.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_global_field_old.h $(SRCROOT)atmos_fv_dynamics/driver/solo/fv_phys.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_write_2Ddecomp.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_do_update_caf.h $(SRCROOT)shared/mpp/mpp_data.F90 $(SRCROOT)shared/topography/gaussian_topog.f90 $(SRCROOT)shared/tracer_manager/tracer_manager.F90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_domains_define.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_comm.inc /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_transmit_nocomm.h $(SRCROOT)atmos_fv_dynamics/tools/getmax.F90 $(SRCROOT)atmos_fv_dynamics/tools/par_vecsum.F90 $(SRCROOT)shared/horiz_interp/horiz_interp_spherical.f90 $(SRCROOT)atmos_shared/vert_advection/vert_advection.f90 $(SRCROOT)shared/horiz_interp/horiz_interp_bilinear.f90 $(SRCROOT)shared/time_interp/time_interp.f90 /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_chksum_int.h /home/joymm/FMSDynamicalCore/test/atm_dycores/exp/fv/../../src/shared/mpp/include/mpp_sum_mpi.h $(SRCROOT)atmos_fv_dynamics/model/fv_arrays.F90
clean: neat
	-rm -f .cppdefs $(OBJ) fms.x
neat:
	-rm -f $(TMPFILES)
localize: $(OFF)
	cp $(OFF) .
TAGS: $(SRC)
	etags $(SRC)
tags: $(SRC)
	ctags $(SRC)
fms.x: $(OBJ)
	ar rcs fms_finite_volume.a $(OBJ)
