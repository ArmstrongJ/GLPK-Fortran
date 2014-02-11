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

module glpk
use ISO_C_BINDING
use glpk_constants
use glpk_types
implicit none

    ! GNU GLP interface block definitions for their C-Language API interface.
    interface

        function glp_create_prob() bind(C,name="glp_create_prob")
        use ISO_C_BINDING
            type(c_ptr) :: glp_create_prob
        end function

        subroutine glp_set_prob_name(prob,probname) bind(C,name="glp_set_prob_name")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            character(c_char) :: probname(*)
        end subroutine

        subroutine glp_init_smcp(parm_struct) bind(C,name="glp_init_smcp")
        use ISO_C_BINDING
        use glpk_types
            type(glp_smcp) :: parm_struct
        end subroutine glp_init_smcp

        subroutine glp_init_iptcp(parm_struct) bind(C,name="glp_init_iptcp")
        use ISO_C_BINDING
        use glpk_types
            type(glp_iptcp) :: parm_struct
        end subroutine glp_init_iptcp

        subroutine glp_set_obj_dir(prob,objdir) bind(C,name="glp_set_obj_dir")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: objdir
        end subroutine

        function glp_add_rows(prob,nrs) bind(C,name="glp_add_rows")
        use ISO_C_BINDING
            integer(c_int) :: glp_add_rows
            type(c_ptr), value :: prob
            integer(c_int), value :: nrs
        end function

        function glp_add_cols(prob,ncs) bind(C,name="glp_add_cols")
        use ISO_C_BINDING
            integer(c_int) :: glp_add_cols
            type(c_ptr), value :: prob
            integer(c_int), value :: ncs
        end function

        subroutine glp_set_obj_coef(prob,j,coef) bind(C,name="glp_set_obj_coef")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: j
            real(c_double), value :: coef
        end subroutine

        subroutine glp_set_row_bnds(prob,i,itype,lb,ub) bind(C,name="glp_set_row_bnds")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: i
            integer(c_int), value :: itype
            real(c_double), value :: lb
            real(c_double), value :: ub
        end subroutine

        subroutine glp_set_row_name(prob,i,cname) bind(C,name="glp_set_row_name")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: i
            character(c_char) :: cname(*)
        end subroutine

        subroutine glp_set_col_bnds(prob,j,itype,lb,ub) bind(C,name="glp_set_col_bnds")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: j
            integer(c_int), value :: itype
            real(c_double), value :: lb
            real(c_double), value :: ub
        end subroutine

        subroutine glp_set_col_name(prob,j,cname) bind(C,name="glp_set_col_name")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: j
            character(c_char) :: cname(*)
        end subroutine

        subroutine glp_set_col_kind(prob,j,ikind) bind(C,name="glp_set_col_kind")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: j
            integer(c_int), value :: ikind
        end subroutine

        subroutine glp_load_matrix(prob,ne,ia,ja,ar) bind(C,name="glp_load_matrix")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: ne
            integer(c_int) :: ia(*)
            integer(c_int) :: ja(*)
            real(c_double) :: ar(*)
        end subroutine

        subroutine glp_adv_basis(prob,flag) bind(C,name="glp_adv_basis")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
            integer(c_int), value :: flag
        end subroutine

        subroutine glp_cpx_basis(prob) bind(C,name="glp_cpx_basis")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
        end subroutine

        function glp_simplex(prob,parm) bind(C,name="glp_simplex")
        use ISO_C_BINDING
        use glpk_types
            integer(c_int) :: glp_simplex
            type(c_ptr), value :: prob
            type(glp_smcp) :: parm
        end function

        function glp_interior(prob,parm) bind(C,name="glp_interior")
        use ISO_C_BINDING
        use glpk_types
            integer(c_int) :: glp_interior
            type(c_ptr), value :: prob
            type(glp_iptcp) :: parm
        end function

        function glp_write_lp(prob,parm,fname) bind(C,name="glp_write_lp")
        use ISO_C_BINDING
            integer(c_int) :: glp_write_lp
            type(c_ptr), value :: prob
            integer(c_int) :: parm
            character(c_char) :: fname(*)
        end function

        function glp_get_status(prob) bind(C,name="glp_get_status")
        use ISO_C_BINDING
            integer(c_int) :: glp_get_status
            type(c_ptr), value :: prob
        end function

        function glp_ipt_status(prob) bind(C,name="glp_ipt_status")
        use ISO_C_BINDING
            integer(c_int) :: glp_ipt_status
            type(c_ptr), value :: prob
        end function

        function glp_get_obj_val(prob) bind(C,name="glp_get_obj_val")
        use ISO_C_BINDING
            real(c_double) :: glp_get_obj_val
            type(c_ptr), value :: prob
        end function

        function glp_ipt_obj_val(prob) bind(C,name="glp_ipt_obj_val")
        use ISO_C_BINDING
            real(c_double) :: glp_ipt_obj_val
            type(c_ptr), value :: prob
        end function

        function glp_get_col_prim(prob,j) bind(C,name="glp_get_col_prim")
        use ISO_C_BINDING
            real(c_double) :: glp_get_col_prim
            type(c_ptr), value :: prob
            integer(c_int), value :: j
        end function

        function glp_ipt_col_prim(prob,j) bind(C,name="glp_ipt_col_prim")
        use ISO_C_BINDING
            real(c_double) :: glp_ipt_col_prim
            type(c_ptr), value :: prob
            integer(c_int), value :: j
        end function

        subroutine glp_erase_prob(prob) bind(C,name="glp_erase_prob")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
        end subroutine

        subroutine glp_delete_prob(prob) bind(C,name="glp_delete_prob")
        use ISO_C_BINDING
            type(c_ptr), value :: prob
        end subroutine
        
        ! initialize MPS format control parameters
        subroutine glp_init_mpscp(parm) bind(C,name="glp_init_mpscp")
        use ISO_C_BINDING
        use glpk_types
            type(glp_mpscp) :: parm
        end subroutine glp_init_mpscp

        function glp_read_mps(prob, formt, parm, fname) bind(C,name="glp_read_mps")
        use ISO_C_BINDING
        use glpk_types
            integer(c_int) :: glp_read_mps
            type(c_ptr), value :: prob
            integer(c_int), value :: formt
            type(glp_mpscp) :: parm
            character(c_char) :: fname(*)
        end function glp_read_mps
        
        function glp_write_mps(prob, formt, parm, fname) bind(C,name="glp_write_mps")
        use ISO_C_BINDING
        use glpk_types
            integer(c_int) :: glp_write_mps
            type(c_ptr), value :: prob
            integer(c_int), value :: formt
            type(glp_mpscp) :: parm
            character(c_char) :: fname(*)
        end function glp_write_mps

        ! write basic solution in printable format
        function glp_print_sol(prob, fname) bind(C,name="glp_print_sol")
        use ISO_C_BINDING
            integer(c_int) :: glp_print_sol
            type(c_ptr), value :: prob
            character(c_char) :: fname(*)
        end function glp_print_sol

        ! write interior-point solution in printable format
        function glp_print_ipt(prob, fname) bind(C,name="glp_print_ipt")
        use ISO_C_BINDING
            integer(c_int) :: glp_print_ipt
            type(c_ptr), value :: prob
            character(c_char) :: fname(*)
        end function glp_print_ipt

        ! allocate the MathProg translator workspace 
        function glp_mpl_alloc_wksp() bind(C,name="glp_mpl_alloc_wksp")
        use ISO_C_BINDING
            type(c_ptr) :: glp_mpl_alloc_wksp
        end function glp_mpl_alloc_wksp

        ! read and translate model section 
        function glp_mpl_read_model(tran, fname, skip) bind(C,name="glp_mpl_read_model")
        use ISO_C_BINDING
            integer(kind=c_int) :: glp_mpl_read_model
            type(c_ptr), value :: tran
            character(c_char) :: fname(*)
            integer(kind=c_int), value :: skip
        end function glp_mpl_read_model

        ! read and translate data section
        function glp_mpl_read_data(tran, fname) bind(C,name="glp_mpl_read_data")
        use ISO_C_BINDING
            integer(kind=c_int) :: glp_mpl_read_data
            type(c_ptr), value :: tran
            character(c_char) :: fname(*)
        end function glp_mpl_read_data

        ! generate the model
        function glp_mpl_generate_c(tran, fname) bind(C,name="glp_mpl_generate")
        use ISO_C_BINDING
            integer(kind=c_int) :: glp_mpl_generate_c
            type(c_ptr), value :: tran
            type(c_ptr) :: fname(*)
        end function glp_mpl_generate_c
    
        subroutine glp_mpl_build_prob(tran, prob) bind(C,name="glp_mpl_build_prob")
        use ISO_C_BINDING
            type(c_ptr), value :: tran
            type(c_ptr), value :: prob
        end subroutine glp_mpl_build_prob

        ! free the MathProg translator workspace
        subroutine glp_mpl_free_wksp(tran) bind(C,name="glp_mpl_free_wksp")
        use ISO_C_BINDING
            type(c_ptr), value :: tran
        end subroutine glp_mpl_free_wksp

    end interface
    
    contains
    
        ! Fortran interface to generate model
        function glp_mpl_generate(tran, fname)
        use ISO_C_BINDING
        implicit none
        
        integer(kind=c_int) :: glp_mpl_generate
        type(c_ptr) :: tran
        character, target, optional :: fname(*)
        
            if(present(fname)) then
                glp_mpl_generate = glp_mpl_generate_c(tran, c_loc(fname))
            else
                glp_mpl_generate = glp_mpl_generate_c(tran, C_NULL_PTR)
            end if
            
        end function glp_mpl_generate
    
end module glpk
