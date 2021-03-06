program driver
use glpk
use iso_c_binding
implicit none

    type(c_ptr) :: p
    integer :: res
    type(glp_mpscp) :: mps_parm
    type(glp_smcp) :: simplex_parm

      p = glp_create_prob()
      call glp_init_mpscp(mps_parm)
      res = glp_read_mps(p, GLP_MPS_DECK, mps_parm, "25fv47.mps"//C_NULL_CHAR)
      
      call glp_adv_basis(p, 0)
      
      call glp_init_smcp(simplex_parm)
      res = glp_simplex(p, simplex_parm)
      
      res = glp_print_sol(p, "25fv47.txt"//C_NULL_CHAR)
      call glp_delete_prob(p)
      
end program driver