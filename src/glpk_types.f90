! GLPK-Fortran
!
! Copyright (C) 2014 Jeff Armstrong, Approximatrix, LLC. All rights 
! reserved. Email: <jeff@approximatrix.com>
!
! GLPK is free software: you can redistribute it and/or modify it
! under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
!
! GLPK is distributed in the hope that it will be useful, but WITHOUT
! ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
! or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
! License for more details.
!
! You should have received a copy of the GNU General Public License
! along with GLPK. If not, see <http://www.gnu.org/licenses/>.
!
! Some portions are based on code available at:
! http://en.wikibooks.org/wiki/GLPK/Fortran

module glpk_types
use iso_c_binding
implicit none

! GNU GLP derived-type or structure definitions for their C-Language API interface.
!
! * Note that the intrinsic module ISO_C_BINDING is required.
!
! * Note that to interface the structure or derived-type to the C-language we can do
!   the following without using a pointer i.e., return = glp_init_smcp(problem1_set%msg_lev).
!
!   The idea is that because a derived-type or structure is simply a "blind" consecutive or
!   contiguous block of data then specifying the first component or item of the derived-type
!   is identical to the Fortran IV and Fortran 77 notion of passing in the first element of
!   an assumed array i.e., X(1) will pass in by reference all of the X(:) data.
 
    ! Simplex settings/options. 
    type, bind(c) :: glp_smcp
        integer(c_int) :: msg_lev
        integer(c_int) :: meth
        integer(c_int) :: pricing
        integer(c_int) :: r_test
        real(c_double) :: tol_bnd
        real(c_double) :: tol_dj
        real(c_double) :: tol_piv
        real(c_double) :: obj_ll
        real(c_double) :: obj_ul
        integer(c_int) :: it_lim
        integer(c_int) :: tm_lim
        integer(c_int) :: out_frq
        integer(c_int) :: out_dly
        integer(c_int) :: presolve
        real(c_double) :: foo_bar(0:35)
    end type glp_smcp
    
    ! Basis factorization control parameters
    type, bind(c) :: glp_bfcp
        integer(c_int) :: msg_lev
        integer(c_int) :: itype
        integer(c_int) :: lu_size
        real(c_double) :: piv_tol
        integer(c_int) :: piv_lim
        integer(c_int) :: suhl
        real(c_double) :: eps_tol
        real(c_double) :: max_gro
        integer(c_int) :: nfs_max
        real(c_double) :: upd_tol
        integer(c_int) :: nrs_max
        integer(c_int) :: rs_size
        real(c_double), dimension(0:37) :: foo_bar
    end type glp_bfcp
 
    ! Interior-point settings/options.
    type, bind(c) :: glp_iptcp
        integer(c_int) :: msg_lev
        integer(c_int) :: ord_alg
        real(c_double) :: foo_bar(0:47)
    end type glp_iptcp
    
    ! Integer optimizer control parameters
    type, bind(c) :: glp_iocp
        integer(c_int) :: msg_lev            ! message level (see glp_smcp) 
        integer(c_int) :: br_tech            ! branching technique: 
        integer(c_int) :: bt_tech            ! backtracking technique: 
        real(c_double) :: tol_int            ! mip.tol_int
        real(c_double) :: tol_obj            ! mip.tol_obj 
        integer(c_int) :: tm_lim             ! mip.tm_lim (milliseconds)
        integer(c_int) :: out_frq            ! mip.out_frq (milliseconds)
        integer(c_int) :: out_dly            ! mip.out_dly (milliseconds) 
        type(C_FUNPTR) :: cb_func
        type(c_ptr)    :: cb_info            ! mip.cb_info 
        integer(c_int) :: cb_size            ! mip.cb_size 
        integer(c_int) :: pp_tech            ! preprocessing technique
        real(c_double) :: mip_gap            ! relative MIP gap tolerance 
        integer(c_int) :: mir_cuts           ! MIR cuts       (GLP_ON/GLP_OFF) 
        integer(c_int) :: gmi_cuts           ! Gomory's cuts  (GLP_ON/GLP_OFF) 
        integer(c_int) :: cov_cuts           ! cover cuts     (GLP_ON/GLP_OFF) 
        integer(c_int) :: clq_cuts           ! clique cuts    (GLP_ON/GLP_OFF) 
        integer(c_int) :: presolve           ! enable/disable using MIP presolver 
        integer(c_int) :: binarize           ! try to binarize integer variables 
        integer(c_int) :: fp_heur            ! feasibility pump heuristic 
        integer(c_int) :: ps_heur            ! proximity search heuristic 
        integer(c_int) :: ps_tm_lim          ! proxy time limit, milliseconds 
        integer(c_int) :: use_sol            ! use existing solution 
        type(c_ptr)    :: save_sol_ptr       ! filename to save every new solution 
        integer(c_int) :: alien              ! use alien solver 
        real(c_double), dimension(0:24) :: foo_bar
    end type glp_iocp
    
    type, bind(C) :: glp_attr
        integer(c_int) :: level       ! subproblem level at which the row was added 
        integer(c_int) :: origin      ! row origin flag:
        integer(c_int) :: klass       ! row class descriptor: 
        real(c_double), dimension(0:6) :: foo_bar
    end type glp_attr

    ! MPS format control parameters
    type, bind(C) :: glp_mpscp
        integer(c_int) :: blank                    ! character code to replace blanks in symbolic names 
        type(c_ptr) :: obj_name_ptr                ! objective row name 
        real(c_double) :: tol_mps                  ! zero tolerance for MPS data 
        real(c_double), dimension(0,16) :: foo_bar
    end type glp_mpscp

    ! CPLEX LP format control parameters
    type, bind(C) :: glp_cpxcp
        real(c_double), dimension(0,19) :: foo_bar
    end type glp_cpxcp

end module glpk_types