!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-04 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom2
use types
implicit none
#if FMM_EXPANSION_ORDER==2
contains
        subroutine pack2(l, a1,a2,a)
            integer :: i
            integer,  intent(in)                      :: l
            real(dp), intent(in),  dimension(1:l)     :: a1,a2
            real(dp), intent(out), dimension(1:2,1:l) :: a
            do i=1,l
                a(1,i) = a1(i)
                a(2,i) = a2(i)
            end do
        end subroutine pack2
        subroutine unpack2(l, a1,a2,a)
            integer :: i
            integer,  intent(in)                      :: l
            real(dp), intent(out), dimension(1:l)     :: a1,a2
            real(dp), intent(in),  dimension(1:2,1:l) :: a
            do i=1,l
                a1(i) = a(1,i)
                a2(i) = a(2,i)
            end do
        end subroutine unpack2
        subroutine unpack2_add(l, a1,a2,a)
            integer :: i
            integer,  intent(in)                      :: l
            real(dp), intent(out), dimension(1:l)     :: a1,a2
            real(dp), intent(in),  dimension(1:2,1:l) :: a
            do i=1,l
                a1(i) = a1(i) + a(1,i)
                a2(i) = a2(i) + a(2,i)
            end do
        end subroutine unpack2_add
        
    
! OPS  0 = 0  (14 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u
#define x                    r(1)
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
    M_0 = W
#undef  x                   
#undef  M_0                 
#undef  y                   
#undef  z                   
    end subroutine mom_es_P2M
    
! OPS  0 = 0  (14 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u
#define x                    r(1)
#define M_0                  M(0)
#define Ms_0                 Ms(0)
#define y                    r(2)
#define z                    r(3)
    Ms_0 = M_0
#undef  x                   
#undef  M_0                 
#undef  Ms_0                
#undef  y                   
#undef  z                   
    end subroutine mom_es_M2M
    
! OPS  4*ADD + 2*DIV + 27*MUL + 4*NEG + POW = 38  (59 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, v6, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define M_0                  M(0)
#define z                    r(3)
#define L_y                  L(1)
#define L_z                  L(2)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define L_yz                 L(7)
    c1   = z
    b1   = y
    a1   = x
    a2   = a1*a1
    v0   = a2
    b2   = b1*b1
    v1   = b2
    c2   = c1*c1
    h    = c2 + v0 + v1
    v4   = -h
    u2   = 1.0/h
    u    = sqrt(u2)
    u3   = u*u2
    v2   = u3
    D_x  = -v2*x
    L_x  = D_x*M_0
    D_y  = -v2*y
    L_y  = D_y*M_0
    D_z  = -v2*z
    L_z  = D_z*M_0
    u4   = u2*u2
    u5   = u2*u3
    v3   = u5
    v6   = 3.0d0*v3
    v5   = v6*x
    D_xx = v3*(3.0d0*v0 + v4)
    L_xx = D_xx*M_0
    D_xy = v5*y
    L_xy = D_xy*M_0
    D_xz = v5*z
    L_xz = D_xz*M_0
    D_yy = v3*(3.0d0*v1 + v4)
    L_yy = D_yy*M_0
    D_yz = v6*y*z
    L_yz = D_yz*M_0
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  M_0                 
#undef  z                   
#undef  L_y                 
#undef  L_z                 
#undef  L_xx                
#undef  L_xy                
#undef  L_xz                
#undef  L_yy                
#undef  L_yz                
    end subroutine mom_es_M2L
    
! OPS  9*ADD + 9*MUL + NEG = 19  (34 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u, L_zz
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define y                    r(2)
#define L_y                  L(1)
#define Ls_y                 Ls(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define Ls_xy                Ls(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define Ls_xz                Ls(5)
#define Ls_yy                Ls(6)
#define L_yy                 L(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
    Ls_x  = L_x + L_xx*x + L_xy*y + L_xz*z
    Ls_y  = L_y + L_xy*x + L_yy*y + L_yz*z
    Ls_xx = L_xx
    Ls_xy = L_xy
    Ls_xz = L_xz
    Ls_yy = L_yy
    Ls_yz = L_yz
    L_zz  = -(L_xx + L_yy)
    Ls_z  = L_z + L_xz*x + L_yz*y + L_zz*z
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  y                   
#undef  L_y                 
#undef  Ls_y                
#undef  L_z                 
#undef  Ls_z                
#undef  L_xx                
#undef  Ls_xx               
#undef  Ls_xy               
#undef  L_xy                
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
    end subroutine mom_es_L2L
    
! OPS  9*ADD + 9*MUL + NEG = 19  (34 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u, L_zz
#define L_x                  L(0)
#define Phi_x                Phi(0)
#define z                    r(3)
#define x                    r(1)
#define y                    r(2)
#define L_y                  L(1)
#define Phi_y                Phi(1)
#define L_z                  L(2)
#define Phi_z                Phi(2)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define L_yz                 L(7)
    Phi_x = L_x + L_xx*x + L_xy*y + L_xz*z
    Phi_y = L_y + L_xy*x + L_yy*y + L_yz*z
    L_zz  = -(L_xx + L_yy)
    Phi_z = L_z + L_xz*x + L_yz*y + L_zz*z
#undef  L_x                 
#undef  Phi_x               
#undef  z                   
#undef  x                   
#undef  y                   
#undef  L_y                 
#undef  Phi_y               
#undef  L_z                 
#undef  Phi_z               
#undef  L_xx                
#undef  L_xy                
#undef  L_xz                
#undef  L_yy                
#undef  L_yz                
    end subroutine mom_es_L2P
    
! OPS  0 = 0  (14 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u
#define x                    r(1)
#define M_0                  M(0)
#define Ms_0                 Ms(0)
#define y                    r(2)
#define z                    r(3)
    Ms_0 = Ms_0 + (M_0)
#undef  x                   
#undef  M_0                 
#undef  Ms_0                
#undef  y                   
#undef  z                   
    end subroutine mom_es_M2M_add
    
! OPS  4*ADD + 2*DIV + 27*MUL + 4*NEG + POW = 38  (59 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, v6, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define M_0                  M(0)
#define z                    r(3)
#define L_y                  L(1)
#define L_z                  L(2)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define L_yz                 L(7)
    c1   = z
    b1   = y
    a1   = x
    a2   = a1*a1
    v0   = a2
    b2   = b1*b1
    v1   = b2
    c2   = c1*c1
    h    = c2 + v0 + v1
    v4   = -h
    u2   = 1.0/h
    u    = sqrt(u2)
    u3   = u*u2
    v2   = u3
    D_x  = -v2*x
    L_x  = L_x + (D_x*M_0)
    D_y  = -v2*y
    L_y  = L_y + (D_y*M_0)
    D_z  = -v2*z
    L_z  = L_z + (D_z*M_0)
    u4   = u2*u2
    u5   = u2*u3
    v3   = u5
    v6   = 3.0d0*v3
    v5   = v6*x
    D_xx = v3*(3.0d0*v0 + v4)
    L_xx = L_xx + (D_xx*M_0)
    D_xy = v5*y
    L_xy = L_xy + (D_xy*M_0)
    D_xz = v5*z
    L_xz = L_xz + (D_xz*M_0)
    D_yy = v3*(3.0d0*v1 + v4)
    L_yy = L_yy + (D_yy*M_0)
    D_yz = v6*y*z
    L_yz = L_yz + (D_yz*M_0)
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  M_0                 
#undef  z                   
#undef  L_y                 
#undef  L_z                 
#undef  L_xx                
#undef  L_xy                
#undef  L_xz                
#undef  L_yy                
#undef  L_yz                
    end subroutine mom_es_M2L_add
    
! OPS  9*ADD + 9*MUL + NEG = 19  (34 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u, L_zz
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define y                    r(2)
#define L_y                  L(1)
#define Ls_y                 Ls(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define Ls_xy                Ls(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define Ls_xz                Ls(5)
#define Ls_yy                Ls(6)
#define L_yy                 L(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
    Ls_x  = Ls_x + (L_x + L_xx*x + L_xy*y + L_xz*z)
    Ls_y  = Ls_y + (L_y + L_xy*x + L_yy*y + L_yz*z)
    Ls_xx = Ls_xx + (L_xx)
    Ls_xy = Ls_xy + (L_xy)
    Ls_xz = Ls_xz + (L_xz)
    Ls_yy = Ls_yy + (L_yy)
    Ls_yz = Ls_yz + (L_yz)
    L_zz  = -(L_xx + L_yy)
    Ls_z  = Ls_z + (L_z + L_xz*x + L_yz*y + L_zz*z)
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  y                   
#undef  L_y                 
#undef  Ls_y                
#undef  L_z                 
#undef  Ls_z                
#undef  L_xx                
#undef  Ls_xx               
#undef  Ls_xy               
#undef  L_xy                
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
    end subroutine mom_es_L2L_add
    
! OPS  4*ADD + 2*DIV + 27*MUL + 4*NEG + POW = 38  (59 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, v6, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define M_0                  M(1:2,0)
#define z                    r(1:2,3)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define L_xx                 L(1:2,3)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define L_yy                 L(1:2,6)
#define L_yz                 L(1:2,7)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    c1   = z
    b1   = y
    a1   = x
    a2   = a1*a1
    v0   = a2
    b2   = b1*b1
    v1   = b2
    c2   = c1*c1
    h    = c2 + v0 + v1
    v4   = -h
    u2   = 1.0/h
    u    = sqrt(u2)
    u3   = u*u2
    v2   = u3
    D_x  = -v2*x
    L_x  = D_x*M_0
    D_y  = -v2*y
    L_y  = D_y*M_0
    D_z  = -v2*z
    L_z  = D_z*M_0
    u4   = u2*u2
    u5   = u2*u3
    v3   = u5
    v6   = 3.0d0*v3
    v5   = v6*x
    D_xx = v3*(3.0d0*v0 + v4)
    L_xx = D_xx*M_0
    D_xy = v5*y
    L_xy = D_xy*M_0
    D_xz = v5*z
    L_xz = D_xz*M_0
    D_yy = v3*(3.0d0*v1 + v4)
    L_yy = D_yy*M_0
    D_yz = v6*y*z
    L_yz = D_yz*M_0
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  M_0                 
#undef  z                   
#undef  L_y                 
#undef  L_z                 
#undef  L_xx                
#undef  L_xy                
#undef  L_xz                
#undef  L_yy                
#undef  L_yz                
    end subroutine mom_es_M2L2
    
! OPS  9*ADD + 9*MUL + NEG = 19  (34 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u, L_zz
#define L_x                  L(1:2,0)
#define Phi_x                Phi(1:2,0)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_y                  L(1:2,1)
#define Phi_y                Phi(1:2,1)
#define L_z                  L(1:2,2)
#define Phi_z                Phi(1:2,2)
#define L_xx                 L(1:2,3)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define L_yy                 L(1:2,6)
#define L_yz                 L(1:2,7)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    Phi_x = L_x + L_xx*x + L_xy*y + L_xz*z
    Phi_y = L_y + L_xy*x + L_yy*y + L_yz*z
    L_zz  = -(L_xx + L_yy)
    Phi_z = L_z + L_xz*x + L_yz*y + L_zz*z
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  L_x                 
#undef  Phi_x               
#undef  z                   
#undef  x                   
#undef  y                   
#undef  L_y                 
#undef  Phi_y               
#undef  L_z                 
#undef  Phi_z               
#undef  L_xx                
#undef  L_xy                
#undef  L_xz                
#undef  L_yy                
#undef  L_yz                
    end subroutine mom_es_L2P2
    
! OPS  9*ADD + 9*MUL + NEG = 19  (34 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, h, u, L_zz
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Ls_x                 Ls(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_y                  L(1:2,1)
#define Ls_y                 Ls(1:2,1)
#define L_z                  L(1:2,2)
#define Ls_z                 Ls(1:2,2)
#define L_xx                 L(1:2,3)
#define Ls_xx                Ls(1:2,3)
#define Ls_xy                Ls(1:2,4)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define Ls_xz                Ls(1:2,5)
#define Ls_yy                Ls(1:2,6)
#define L_yy                 L(1:2,6)
#define Ls_yz                Ls(1:2,7)
#define L_yz                 L(1:2,7)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    Ls_x  = L_x + L_xx*x + L_xy*y + L_xz*z
    Ls_y  = L_y + L_xy*x + L_yy*y + L_yz*z
    Ls_xx = L_xx
    Ls_xy = L_xy
    Ls_xz = L_xz
    Ls_yy = L_yy
    Ls_yz = L_yz
    L_zz  = -(L_xx + L_yy)
    Ls_z  = L_z + L_xz*x + L_yz*y + L_zz*z
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  y                   
#undef  L_y                 
#undef  Ls_y                
#undef  L_z                 
#undef  Ls_z                
#undef  L_xx                
#undef  Ls_xx               
#undef  Ls_xy               
#undef  L_xy                
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
    end subroutine mom_es_L2L2_add
#endif
end module mom2
