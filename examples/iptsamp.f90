program driver
use glpk
use iso_c_binding
implicit none

    type(c_ptr) :: p
    integer :: res
    type(glp_iptcp) :: ipt_parm
    
      p = glp_create_prob()
      call glp_init_iptcp(ipt_parm)
      res = glp_read_mps(p, GLP_MPS_DECK, mps_parm, "25fv47.mps"//C_NULL_CHAR)
      res = glp_interior(P, ipt_parm)
      res = glp_print_ipt(P, "25fv47.txt"//C_NULL_CHAR)
      call glp_delete_prob(p)
      
end program driver