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

module glpk_constants
use iso_c_binding
implicit none

    ! GNU GLP integer and real control and problem attribute declarations.
 
    integer(c_int), parameter :: GLP_MIN = 1
    integer(c_int), parameter :: GLP_MAX = 2

    integer(c_int), parameter :: GLP_FR = 1
    integer(c_int), parameter :: GLP_LO = 2
    integer(c_int), parameter :: GLP_UP = 3
    integer(c_int), parameter :: GLP_DB = 4
    integer(c_int), parameter :: GLP_FX = 5

    integer(c_int), parameter :: GLP_ON = 1
    integer(c_int), parameter :: GLP_OFF = 0

    integer(c_int), parameter :: GLP_PRIMAL = 1
    integer(c_int), parameter :: GLP_DUALP = 2
    integer(c_int), parameter :: GLP_DUAL = 3

    integer(c_int), parameter :: GLP_UNDEF = 1
    integer(c_int), parameter :: GLP_FEAS = 2
    integer(c_int), parameter :: GLP_INFEAS = 3
    integer(c_int), parameter :: GLP_NOFEAS = 4
    integer(c_int), parameter :: GLP_OPT = 5
    integer(c_int), parameter :: GLP_UNBND = 6

    integer(c_int), parameter :: GLP_CV = 1
    integer(c_int), parameter :: GLP_IV = 2
    integer(c_int), parameter :: GLP_BV = 3

    integer(c_int), parameter :: GLP_ORD_NONE = 0
    integer(c_int), parameter :: GLP_ORD_QMD = 1
    integer(c_int), parameter :: GLP_ORD_AMD = 2
    integer(c_int), parameter :: GLP_ORD_SYMAMD = 3

    integer(c_int), parameter :: GLP_MPS_DECK = 1
    integer(c_int), parameter :: GLP_MPS_FILE = 2

    integer(c_int), parameter :: GLP_BF_FT = 1  ! LUF + Forrest-Tomlin 
    integer(c_int), parameter :: GLP_BF_BG = 2  ! LUF + Schur compl. + Bartels-Golub 
    integer(c_int), parameter :: GLP_BF_GR = 3  ! LUF + Schur compl. + Givens rotation

    integer(c_int), parameter :: GLP_BR_FFV = 1  ! first fractional variable 
    integer(c_int), parameter :: GLP_BR_LFV = 2  ! last fractional variable 
    integer(c_int), parameter :: GLP_BR_MFV = 3  ! most fractional variable 
    integer(c_int), parameter :: GLP_BR_DTH = 4  ! heuristic by Driebeck and Tomlin 
    integer(c_int), parameter :: GLP_BR_PCH = 5  ! hybrid pseudocost heuristic 

    integer(c_int), parameter :: GLP_BT_DFS = 1  ! depth first search 
    integer(c_int), parameter :: GLP_BT_BFS = 2  ! breadth first search 
    integer(c_int), parameter :: GLP_BT_BLB = 3  ! best local bound 
    integer(c_int), parameter :: GLP_BT_BPH = 4  ! best projection heuristic 

    integer(c_int), parameter :: GLP_PP_NONE = 0  ! disable preprocessing 
    integer(c_int), parameter :: GLP_PP_ROOT = 1  ! preprocessing only on root level 
    integer(c_int), parameter :: GLP_PP_ALL  = 2  ! preprocessing on all levels 

    integer(c_int), parameter :: GLP_RF_GMI = 1   ! Gomory's mixed integer cut 
    integer(c_int), parameter :: GLP_RF_MIR = 2   ! mixed integer rounding cut 
    integer(c_int), parameter :: GLP_RF_COV = 3   ! mixed cover cut
    integer(c_int), parameter :: GLP_RF_CLQ = 4   ! clique cut 

    integer(c_int), parameter :: GLP_RF_REG = 0   ! regular constraint 
    integer(c_int), parameter :: GLP_RF_LAZY = 1  ! "lazy" constraint 
    integer(c_int), parameter :: GLP_RF_CUT = 2   ! cutting plane constraint

    ! reason codes:
    integer(c_int), parameter :: GLP_IROWGEN = 1  ! request for row generation
    integer(c_int), parameter :: GLP_IBINGO  = 2  ! better integer solution found
    integer(c_int), parameter :: GLP_IHEUR   = 3  ! request for heuristic solution
    integer(c_int), parameter :: GLP_ICUTGEN = 4  ! request for cut generation
    integer(c_int), parameter :: GLP_IBRANCH = 5  ! request for branching
    integer(c_int), parameter :: GLP_ISELECT = 6  ! request for subproblem selection
    integer(c_int), parameter :: GLP_IPREPRO = 7  ! request for preprocessing

    ! branch selection indicator:
    integer(c_int), parameter :: GLP_NO_BRNCH = 0  ! select no branch
    integer(c_int), parameter :: GLP_DN_BRNCH = 1  ! select down-branch
    integer(c_int), parameter :: GLP_UP_BRNCH = 2  ! select up-branch

    ! return codes:
    integer(c_int), parameter :: GLP_EBADB =   1  ! invalid basis
    integer(c_int), parameter :: GLP_ESING =   2  ! singular matrix
    integer(c_int), parameter :: GLP_ECOND =   3  ! ill-conditioned matrix
    integer(c_int), parameter :: GLP_EBOUND =  4  ! invalid bounds
    integer(c_int), parameter :: GLP_EFAIL =   5  ! solver failed
    integer(c_int), parameter :: GLP_EOBJLL =  6  ! objective lower limit reached
    integer(c_int), parameter :: GLP_EOBJUL =  7  ! objective upper limit reached
    integer(c_int), parameter :: GLP_EITLIM =  8  ! iteration limit exceeded
    integer(c_int), parameter :: GLP_ETMLIM =  9  ! time limit exceeded
    integer(c_int), parameter :: GLP_ENOPFS =  10 ! no primal feasible solution
    integer(c_int), parameter :: GLP_ENODFS =  11 ! no dual feasible solution
    integer(c_int), parameter :: GLP_EROOT =   12 ! root LP optimum not provided
    integer(c_int), parameter :: GLP_ESTOP =   13 ! search terminated by application
    integer(c_int), parameter :: GLP_EMIPGAP = 14 ! relative mip gap tolerance reached
    integer(c_int), parameter :: GLP_ENOFEAS = 15 ! no primal/dual feasible solution
    integer(c_int), parameter :: GLP_ENOCVG =  16 ! no convergence
    integer(c_int), parameter :: GLP_EINSTAB = 17 ! numerical instability
    integer(c_int), parameter :: GLP_EDATA =   18 ! invalid data
    integer(c_int), parameter :: GLP_ERANGE =  19 ! result out of range

    ! condition indicator:
    integer(c_int), parameter :: GLP_KKT_PE = 1  ! primal equalities
    integer(c_int), parameter :: GLP_KKT_PB = 2  ! primal bounds
    integer(c_int), parameter :: GLP_KKT_DE = 3  ! dual equalities
    integer(c_int), parameter :: GLP_KKT_DB = 4  ! dual bounds
    integer(c_int), parameter :: GLP_KKT_CS = 5  ! complementary slackness

end module glpk_constants