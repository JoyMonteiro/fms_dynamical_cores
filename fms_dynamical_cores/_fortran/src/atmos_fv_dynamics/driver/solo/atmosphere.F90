!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                   !!
!!                   GNU General Public License                      !!
!!                                                                   !!
!! This file is part of the Flexible Modeling System (FMS).          !!
!!                                                                   !!
!! FMS is free software; you can redistribute it and/or modify       !!
!! it and are expected to follow the terms of the GNU General Public !!
!! License as published by the Free Software Foundation.             !!
!!                                                                   !!
!! FMS is distributed in the hope that it will be useful,            !!
!! but WITHOUT ANY WARRANTY; without even the implied warranty of    !!
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     !!
!! GNU General Public License for more details.                      !!
!!                                                                   !!
!! You should have received a copy of the GNU General Public License !!
!! along with FMS; if not, write to:                                 !!
!!          Free Software Foundation, Inc.                           !!
!!          59 Temple Place, Suite 330                               !!
!!          Boston, MA  02111-1307  USA                              !!
!! or see:                                                           !!
!!          http://www.gnu.org/licenses/gpl.txt                      !!
!!                                                                   !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module atmosphere_mod

!-----------------------------------------------------------------------
!
!    interface for FV dynamical core with Held-Suarez forcing
!
!-----------------------------------------------------------------------


use time_manager_mod, only: time_type, get_time, set_time, operator(+)

use fms_mod,          only: file_exist, open_namelist_file,   &
                            error_mesg, FATAL,                &
                            check_nml_error, stdlog,          &
                            write_version_number,             &
                            close_file, set_domain

  use hs_forcing_mod,   only: hs_forcing_init
 use constants_mod, only: omega, cp_air, rdgas, kappa, radius, grav, rvgas

!------------------
! FV specific codes:
!------------------
 use fv_pack, only: nlon, mlat, nlev, beglat, endlat, beglon, endlon, &
                    rlonb, rlatb,        &
                    cold_start, ncnst, pnats, consv_te, ptop,         &
                    fv_init, fv_domain, fv_end, change_time, map_dt,  &
                    adiabatic, restart_format

  use fv_diagnostics, only: fv_diag_init, fv_diag, fv_time
  use timingModule,   only: timing_on, timing_off
  use fv_restart_mod, only: fv_restart, write_fv_rst
  use fv_dynamics_mod, only: fv_dynamics
  use fv_phys_mod, only: fv_phys

!-----------------------------------------------------------------------

implicit none
private

public   atmosphere_init, atmosphere,  atmosphere_end

!-----------------------------------------------------------------------

character(len=128) :: version = '$Id: atmosphere.F90,v 13.0.2.3 2006/07/10 16:03:21 wfc Exp $'
character(len=128) :: tag = '$Name:  $'

!-----------------------------------------------------------------------
!---- private data ----

type        (time_type) :: Time_step_atmos
real                    :: dt_atmos
integer :: sec
integer days, seconds

!-----------------------------------------------------------------------

contains

!#######################################################################

 subroutine atmosphere_init ( Time_init, Time, Time_step )

 type (time_type), intent(in) :: Time_step
 type (time_type), intent(in) :: Time_init
 type (time_type), intent(in) :: Time

! local:
 integer axes(4)
 integer ss, ds


!----- write version and namelist to log file -----

    call write_version_number ( version, tag )

!---- compute physics/atmos time step in seconds ----

    Time_step_atmos = Time_step
    call get_time (Time_step_atmos, sec)
    dt_atmos = real(sec)

!----- initialize FV dynamical core -----

    call fv_init( sec )
    call fv_restart( days, seconds )
   
    if ( .not. cold_start ) then 
!
! Check consistency in Time
!
    fv_time = set_time (seconds, days)
    call get_time (Time, ss,  ds)

    if( seconds /= ss .or. days /= ds ) then
!       write(6,*) 'FMS:', ds, ss
!       write(6,*) 'FV:', days, seconds
        call error_mesg('FV_init:', &
     'Time inconsistent between fv_rst and INPUT/atmos_model.res', &
                         FATAL)
    endif
    else
    fv_time = time
    endif

    call fv_diag_init( axes, Time )

    if( nlev > 1 ) call hs_forcing_init ( axes, Time )

!-----------------------------------------------------------------------

 end subroutine atmosphere_init


!#######################################################################

 subroutine atmosphere (Time)
#include <fv_arrays.h>
 type(time_type), intent(in) :: Time

! local:
 real    zvir
 logical p_map                      ! Perform only partial remapping
#include <fv_point.inc>

  fv_time = Time + Time_step_atmos
  call get_time (fv_time, seconds,  days)

!---- call fv dynamics -----
  zvir = 0.         ! no virtual effect if not full physics

  if ( mod(seconds, map_dt) == 0 ) then
       p_map = .false.
  else
       p_map = .true.
  endif
                                call timing_on('fv_dynamics')

#ifndef USE_LIMA
  call fv_dynamics (nlon,    mlat,   nlev,    beglat,   endlat,    &
                    ncnst,   pnats,  p_map,   consv_te,            &
                    u,       v,      delp,    pt,       q,         &
                    ps,      pe,     pk,      pkz,      phis,      &
                    omga,    peln,   ptop,    omega,    sec,       &  
                    zvir,    cp_air, rdgas,   kappa,  radius, ua, va, fv_time )
#else
  call fv_dynamics (nlon,    mlat,   nlev,    beglat,   endlat,    &
                    ncnst,   pnats,  p_map,   consv_te,            &
                    u,       v,      delp,    pt,       q,         &
                    ps,      pe,     pk,      pkz,      phis,      &
                    omga,    peln,   ptop,    omega,    sec,       &  
                    zvir,    cp_air, rdgas,   kappa,  radius, ua, va )
#endif

                                call timing_off('fv_dynamics')

      if( nlev /=1 .and. .not. adiabatic ) then
                                call timing_on('FV_PHYS')
                call fv_phys ( fv_time, sec )
                                call timing_off('FV_PHYS')
      endif

!---- diagnostics for FV dynamics -----

                                call timing_on('FV_DIAG')

  call fv_diag(fv_time, nlon, mlat, nlev, beglat, endlat, ncnst, zvir,   &
               dt_atmos, .true.)

                                call timing_off('FV_DIAG')

 end subroutine atmosphere


 subroutine atmosphere_end

!----- initialize domains for writing global physics data -----

    call set_domain ( fv_domain )
    call get_time (fv_time, seconds,  days)
    call write_fv_rst( 'RESTART/fv_rst.res', days, seconds, grav, &
         restart_format )


    call fv_end(days, seconds)

 end subroutine atmosphere_end

end module atmosphere_mod
