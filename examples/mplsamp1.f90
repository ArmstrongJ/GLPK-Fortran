program driver
use glpk
use iso_c_binding
implicit none

    type(c_ptr) :: lp, tran
    integer :: ret
    type(glp_mpscp) :: parm
    
    lp = glp_create_prob()
    tran = glp_mpl_alloc_wksp()
    
    ret = glp_mpl_read_model(tran, "egypt.mod"//C_NULL_CHAR, 0)
    if(ret .NE. 0) then
        print *, "Error on translating model"
    else 
        ret = glp_mpl_generate(tran)
        if(ret .NE. 0) then
            print *, "Error on generating model"
        else
            call glp_mpl_build_prob(tran, lp)
            call glp_init_mpscp(parm)
            
            ret = glp_write_mps(lp, GLP_MPS_FILE, parm, "egypt.mps"//C_NULL_CHAR)
            
            if(ret .NE. 0) then
                print *, "Error on writing MPS file"
            end if
        end if
    end if

    call glp_mpl_free_wksp(tran)
    call glp_delete_prob(lp)
      
end program driver