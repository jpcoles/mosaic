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
        
    
! OPS  4*ADD + 12*MUL + NEG = 17  (33 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4, h,&
                u
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define z                    r(3)
#define M_x                  M(1)
#define M_y                  M(2)
#define M_z                  M(3)
#define M_xx                 M(4)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define M_yy                 M(7)
#define M_yz                 M(8)
    v0   = W*x
    v1   = W*y
    M_0  = W
    M_x  = v0
    M_y  = v1
    M_z  = W*z
    M_xy = v0*y
    M_xz = v0*z
    M_yz = v1*z
    c1   = z
    b1   = y
    a1   = x
    a2   = a1*a1
    v2   = a2
    b2   = b1*b1
    v3   = b2
    c2   = c1*c1
    h    = c2 + v2 + v3
    v4   = -0.333333333333333d0*h
    M_xx = W*(v2 + v4)
    M_yy = W*(v3 + v4)
#undef  x                   
#undef  y                   
#undef  M_0                 
#undef  z                   
#undef  M_x                 
#undef  M_y                 
#undef  M_z                 
#undef  M_xx                
#undef  M_xy                
#undef  M_xz                
#undef  M_yy                
#undef  M_yz                
    end subroutine mom_es_P2M
    
! OPS  22*ADD + 31*MUL + 3*NEG + 2*SUB = 58  (75 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, h, u, M_zz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy,&
                S_yz
#define x                    r(1)
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define Ms_x                 Ms(1)
#define M_x                  M(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define M_xy                 M(5)
#define Ms_xy                Ms(5)
#define Ms_xz                Ms(6)
#define M_xz                 M(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
    v3    = M_x*x
    v4    = M_y*y
    v5    = -0.666666666666667d0*M_z*z
    Ms_0  = M_0
    Ms_x  = M_0*x + M_x
    Ms_y  = M_0*y + M_y
    Ms_z  = M_0*z + M_z
    M_zz  = -(M_xx + M_yy)
    S_0   = 1
    S_x   = x
    S_y   = y
    S_z   = z
    S_xy  = x*y
    Ms_xy = M_xy + M_0*S_xy + M_x*y + M_y*x
    S_xz  = x*z
    Ms_xz = M_xz + M_0*S_xz + M_x*z + M_z*x
    S_yz  = y*z
    Ms_yz = M_yz + M_0*S_yz + M_y*z + M_z*y
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    b2    = b1*b1
    v1    = b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v2    = -0.333333333333333d0*h
    S_xx  = v0 + v2
    Ms_xx = 0.333333333333333d0*(4.0d0*v3 - 2.0d0*v4) + M_0*S_xx + M_xx + v5
    S_yy  = v1 + v2
    Ms_yy = 0.333333333333333d0*(-2.0d0*v3 + 4.0d0*v4) + M_0*S_yy + M_yy + v5
#undef  x                   
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  M_0                 
#undef  Ms_x                
#undef  M_x                 
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  Ms_xz               
#undef  M_xz                
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
    end subroutine mom_es_M2M
    
! OPS  22*ADD + 2*DIV + 47*MUL + 6*NEG + POW = 78  (99 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, v6, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, M_zz
#define x                    r(1)
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
#define L_xx                 L(4)
#define M_xx                 M(4)
#define M_xy                 M(5)
#define L_xy                 L(5)
#define L_xz                 L(6)
#define M_xz                 M(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define M_yz                 M(8)
#define L_yz                 L(8)
    M_zz = -(M_xx + M_yy)
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
    D_0  = u
    u3   = u*u2
    v2   = u3
    D_x  = -v2*x
    D_y  = -v2*y
    D_z  = -v2*z
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
    L_x  = D_x*M_0 + D_xx*M_x + D_xy*M_y + D_xz*M_z
    L_xz = D_xz*M_0
    D_yy = v3*(3.0d0*v1 + v4)
    L_yy = D_yy*M_0
    D_yz = v6*y*z
    L_y  = D_xy*M_x + D_y*M_0 + D_yy*M_y + D_yz*M_z
    L_yz = D_yz*M_0
    D_zz = -(D_xx + D_yy)
    L_0  = 0.5d0*(D_xx*M_xx + D_yy*M_yy + D_zz*M_zz) + D_0*M_0 + D_x*M_x + D_xy* &
      M_xy + D_xz*M_xz + D_y*M_y + D_yz*M_yz + D_z*M_z
    L_z  = D_xz*M_x + D_yz*M_y + D_z*M_0 + D_zz*M_z
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  L_xx                
#undef  M_xx                
#undef  M_xy                
#undef  L_xy                
#undef  L_xz                
#undef  M_xz                
#undef  M_yy                
#undef  L_yy                
#undef  M_yz                
#undef  L_yz                
    end subroutine mom_es_M2L
    
! OPS  15*ADD + 19*MUL + NEG = 35  (58 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4, h,&
                u, L_zz
#define Ls_0                 Ls(0)
#define x                    r(1)
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(1)
#define L_x                  L(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define Ls_xx                Ls(4)
#define L_xx                 L(4)
#define Ls_xy                Ls(5)
#define L_xy                 L(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
#define Ls_yy                Ls(7)
#define L_yy                 L(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
    v0    = L_x + L_xy*y + L_xz*z
    v1    = L_y + L_yz*z
    Ls_x  = L_xx*x + v0
    Ls_y  = v1 + L_xy*x + L_yy*y
    Ls_xx = L_xx
    Ls_xy = L_xy
    Ls_xz = L_xz
    Ls_yy = L_yy
    Ls_yz = L_yz
    L_zz  = -(L_xx + L_yy)
    Ls_z  = L_z + L_xz*x + L_yz*y + L_zz*z
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v2    = a2
    b2    = b1*b1
    v3    = b2
    c2    = c1*c1
    v4    = c2
    Ls_0  = 0.5d0*(L_xx*v2 + L_yy*v3 + L_zz*v4) + L_0 + L_z*z + v0*x + v1*y
#undef  Ls_0                
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Ls_x                
#undef  L_x                 
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  Ls_xy               
#undef  L_xy                
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
    end subroutine mom_es_L2L
    
! OPS  15*ADD + 19*MUL + 2*NEG = 36  (59 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4, h,&
                u, L_zz
#define Phi_0                Phi(0)
#define x                    r(1)
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define Phi_x                Phi(1)
#define L_x                  L(1)
#define Phi_y                Phi(2)
#define L_y                  L(2)
#define Phi_z                Phi(3)
#define L_z                  L(3)
#define Phi_xx               Phi(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define Phi_xy               Phi(5)
#define L_xz                 L(6)
#define Phi_xz               Phi(6)
#define Phi_yy               Phi(7)
#define L_yy                 L(7)
#define Phi_yz               Phi(8)
#define L_yz                 L(8)
#define Phi_zz               Phi(9)
    v0     = L_x + L_xy*y + L_xz*z
    v1     = L_y + L_yz*z
    Phi_x  = L_xx*x + v0
    Phi_y  = v1 + L_xy*x + L_yy*y
    Phi_xx = L_xx
    Phi_xy = L_xy
    Phi_xz = L_xz
    Phi_yy = L_yy
    Phi_yz = L_yz
    Phi_zz = -(Phi_xx + Phi_yy)
    L_zz   = -(L_xx + L_yy)
    Phi_z  = L_z + L_xz*x + L_yz*y + L_zz*z
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v2     = a2
    b2     = b1*b1
    v3     = b2
    c2     = c1*c1
    v4     = c2
    Phi_0  = 0.5d0*(L_xx*v2 + L_yy*v3 + L_zz*v4) + L_0 + L_z*z + v0*x + v1*y
#undef  Phi_0               
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Phi_x               
#undef  L_x                 
#undef  Phi_y               
#undef  L_y                 
#undef  Phi_z               
#undef  L_z                 
#undef  Phi_xx              
#undef  L_xx                
#undef  L_xy                
#undef  Phi_xy              
#undef  L_xz                
#undef  Phi_xz              
#undef  Phi_yy              
#undef  L_yy                
#undef  Phi_yz              
#undef  L_yz                
#undef  Phi_zz              
    end subroutine mom_es_L2P
    
! OPS  22*ADD + 31*MUL + 3*NEG + 2*SUB = 58  (75 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, h, u, M_zz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy,&
                S_yz
#define x                    r(1)
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define Ms_x                 Ms(1)
#define M_x                  M(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define M_xy                 M(5)
#define Ms_xy                Ms(5)
#define Ms_xz                Ms(6)
#define M_xz                 M(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
    v3    = M_x*x
    v4    = M_y*y
    v5    = -0.666666666666667d0*M_z*z
    Ms_0  = Ms_0 + (M_0)
    Ms_x  = Ms_x + (M_0*x + M_x)
    Ms_y  = Ms_y + (M_0*y + M_y)
    Ms_z  = Ms_z + (M_0*z + M_z)
    M_zz  = -(M_xx + M_yy)
    S_0   = 1
    S_x   = x
    S_y   = y
    S_z   = z
    S_xy  = x*y
    Ms_xy = Ms_xy + (M_xy + M_0*S_xy + M_x*y + M_y*x)
    S_xz  = x*z
    Ms_xz = Ms_xz + (M_xz + M_0*S_xz + M_x*z + M_z*x)
    S_yz  = y*z
    Ms_yz = Ms_yz + (M_yz + M_0*S_yz + M_y*z + M_z*y)
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    b2    = b1*b1
    v1    = b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v2    = -0.333333333333333d0*h
    S_xx  = v0 + v2
    Ms_xx = Ms_xx + (0.333333333333333d0*(4.0d0*v3 - 2.0d0*v4) + M_0*S_xx + M_xx + v5)
    S_yy  = v1 + v2
    Ms_yy = Ms_yy + (0.333333333333333d0*(-2.0d0*v3 + 4.0d0*v4) + M_0*S_yy + M_yy + v5)
#undef  x                   
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  M_0                 
#undef  Ms_x                
#undef  M_x                 
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  Ms_xz               
#undef  M_xz                
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
    end subroutine mom_es_M2M_add
    
! OPS  22*ADD + 2*DIV + 47*MUL + 6*NEG + POW = 78  (99 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, v6, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, M_zz
#define x                    r(1)
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
#define L_xx                 L(4)
#define M_xx                 M(4)
#define M_xy                 M(5)
#define L_xy                 L(5)
#define L_xz                 L(6)
#define M_xz                 M(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define M_yz                 M(8)
#define L_yz                 L(8)
    M_zz = -(M_xx + M_yy)
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
    D_0  = u
    u3   = u*u2
    v2   = u3
    D_x  = -v2*x
    D_y  = -v2*y
    D_z  = -v2*z
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
    L_x  = L_x + (D_x*M_0 + D_xx*M_x + D_xy*M_y + D_xz*M_z)
    L_xz = L_xz + (D_xz*M_0)
    D_yy = v3*(3.0d0*v1 + v4)
    L_yy = L_yy + (D_yy*M_0)
    D_yz = v6*y*z
    L_y  = L_y + (D_xy*M_x + D_y*M_0 + D_yy*M_y + D_yz*M_z)
    L_yz = L_yz + (D_yz*M_0)
    D_zz = -(D_xx + D_yy)
    L_0  = L_0 + (0.5d0*(D_xx*M_xx + D_yy*M_yy + D_zz*M_zz) + D_0*M_0 + D_x*M_x + D_xy* &
      M_xy + D_xz*M_xz + D_y*M_y + D_yz*M_yz + D_z*M_z)
    L_z  = L_z + (D_xz*M_x + D_yz*M_y + D_z*M_0 + D_zz*M_z)
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  L_xx                
#undef  M_xx                
#undef  M_xy                
#undef  L_xy                
#undef  L_xz                
#undef  M_xz                
#undef  M_yy                
#undef  L_yy                
#undef  M_yz                
#undef  L_yz                
    end subroutine mom_es_M2L_add
    
! OPS  15*ADD + 19*MUL + NEG = 35  (58 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4, h,&
                u, L_zz
#define Ls_0                 Ls(0)
#define x                    r(1)
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(1)
#define L_x                  L(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define Ls_xx                Ls(4)
#define L_xx                 L(4)
#define Ls_xy                Ls(5)
#define L_xy                 L(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
#define Ls_yy                Ls(7)
#define L_yy                 L(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
    v0    = L_x + L_xy*y + L_xz*z
    v1    = L_y + L_yz*z
    Ls_x  = Ls_x + (L_xx*x + v0)
    Ls_y  = Ls_y + (v1 + L_xy*x + L_yy*y)
    Ls_xx = Ls_xx + (L_xx)
    Ls_xy = Ls_xy + (L_xy)
    Ls_xz = Ls_xz + (L_xz)
    Ls_yy = Ls_yy + (L_yy)
    Ls_yz = Ls_yz + (L_yz)
    L_zz  = -(L_xx + L_yy)
    Ls_z  = Ls_z + (L_z + L_xz*x + L_yz*y + L_zz*z)
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v2    = a2
    b2    = b1*b1
    v3    = b2
    c2    = c1*c1
    v4    = c2
    Ls_0  = Ls_0 + (0.5d0*(L_xx*v2 + L_yy*v3 + L_zz*v4) + L_0 + L_z*z + v0*x + v1*y)
#undef  Ls_0                
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Ls_x                
#undef  L_x                 
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  Ls_xy               
#undef  L_xy                
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
    end subroutine mom_es_L2L_add
    
! OPS  22*ADD + 2*DIV + 47*MUL + 6*NEG + POW = 78  (99 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4,&
                v5, v6, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, M_zz
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
#define L_y                  L(1:2,2)
#define M_y                  M(1:2,2)
#define L_z                  L(1:2,3)
#define M_z                  M(1:2,3)
#define L_xx                 L(1:2,4)
#define M_xx                 M(1:2,4)
#define M_xy                 M(1:2,5)
#define L_xy                 L(1:2,5)
#define L_xz                 L(1:2,6)
#define M_xz                 M(1:2,6)
#define M_yy                 M(1:2,7)
#define L_yy                 L(1:2,7)
#define M_yz                 M(1:2,8)
#define L_yz                 L(1:2,8)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    M_zz = -(M_xx + M_yy)
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
    D_0  = u
    u3   = u*u2
    v2   = u3
    D_x  = -v2*x
    D_y  = -v2*y
    D_z  = -v2*z
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
    L_x  = D_x*M_0 + D_xx*M_x + D_xy*M_y + D_xz*M_z
    L_xz = D_xz*M_0
    D_yy = v3*(3.0d0*v1 + v4)
    L_yy = D_yy*M_0
    D_yz = v6*y*z
    L_y  = D_xy*M_x + D_y*M_0 + D_yy*M_y + D_yz*M_z
    L_yz = D_yz*M_0
    D_zz = -(D_xx + D_yy)
    L_0  = 0.5d0*(D_xx*M_xx + D_yy*M_yy + D_zz*M_zz) + D_0*M_0 + D_x*M_x + D_xy* &
      M_xy + D_xz*M_xz + D_y*M_y + D_yz*M_yz + D_z*M_z
    L_z  = D_xz*M_x + D_yz*M_y + D_z*M_0 + D_zz*M_z
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  L_xx                
#undef  M_xx                
#undef  M_xy                
#undef  L_xy                
#undef  L_xz                
#undef  M_xz                
#undef  M_yy                
#undef  L_yy                
#undef  M_yz                
#undef  L_yz                
    end subroutine mom_es_M2L2
    
! OPS  15*ADD + 19*MUL + 2*NEG = 36  (59 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4, h,&
                u, L_zz
#define Phi_0                Phi(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define Phi_x                Phi(1:2,1)
#define L_x                  L(1:2,1)
#define Phi_y                Phi(1:2,2)
#define L_y                  L(1:2,2)
#define Phi_z                Phi(1:2,3)
#define L_z                  L(1:2,3)
#define Phi_xx               Phi(1:2,4)
#define L_xx                 L(1:2,4)
#define L_xy                 L(1:2,5)
#define Phi_xy               Phi(1:2,5)
#define L_xz                 L(1:2,6)
#define Phi_xz               Phi(1:2,6)
#define Phi_yy               Phi(1:2,7)
#define L_yy                 L(1:2,7)
#define Phi_yz               Phi(1:2,8)
#define L_yz                 L(1:2,8)
#define Phi_zz               Phi(1:2,9)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0     = L_x + L_xy*y + L_xz*z
    v1     = L_y + L_yz*z
    Phi_x  = L_xx*x + v0
    Phi_y  = v1 + L_xy*x + L_yy*y
    Phi_xx = L_xx
    Phi_xy = L_xy
    Phi_xz = L_xz
    Phi_yy = L_yy
    Phi_yz = L_yz
    Phi_zz = -(Phi_xx + Phi_yy)
    L_zz   = -(L_xx + L_yy)
    Phi_z  = L_z + L_xz*x + L_yz*y + L_zz*z
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v2     = a2
    b2     = b1*b1
    v3     = b2
    c2     = c1*c1
    v4     = c2
    Phi_0  = 0.5d0*(L_xx*v2 + L_yy*v3 + L_zz*v4) + L_0 + L_z*z + v0*x + v1*y
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  Phi_0               
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Phi_x               
#undef  L_x                 
#undef  Phi_y               
#undef  L_y                 
#undef  Phi_z               
#undef  L_z                 
#undef  Phi_xx              
#undef  L_xx                
#undef  L_xy                
#undef  Phi_xy              
#undef  L_xz                
#undef  Phi_xz              
#undef  Phi_yy              
#undef  L_yy                
#undef  Phi_yz              
#undef  L_yz                
#undef  Phi_zz              
    end subroutine mom_es_L2P2
    
! OPS  15*ADD + 19*MUL + NEG = 35  (58 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, b1, b2, c1, c2, u2, u3, u4, u5, v0, v1, v2, v3, v4, h,&
                u, L_zz
#define Ls_0                 Ls(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define Ls_x                 Ls(1:2,1)
#define L_x                  L(1:2,1)
#define Ls_y                 Ls(1:2,2)
#define L_y                  L(1:2,2)
#define L_z                  L(1:2,3)
#define Ls_z                 Ls(1:2,3)
#define Ls_xx                Ls(1:2,4)
#define L_xx                 L(1:2,4)
#define Ls_xy                Ls(1:2,5)
#define L_xy                 L(1:2,5)
#define L_xz                 L(1:2,6)
#define Ls_xz                Ls(1:2,6)
#define Ls_yy                Ls(1:2,7)
#define L_yy                 L(1:2,7)
#define Ls_yz                Ls(1:2,8)
#define L_yz                 L(1:2,8)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0    = L_x + L_xy*y + L_xz*z
    v1    = L_y + L_yz*z
    Ls_x  = L_xx*x + v0
    Ls_y  = v1 + L_xy*x + L_yy*y
    Ls_xx = L_xx
    Ls_xy = L_xy
    Ls_xz = L_xz
    Ls_yy = L_yy
    Ls_yz = L_yz
    L_zz  = -(L_xx + L_yy)
    Ls_z  = L_z + L_xz*x + L_yz*y + L_zz*z
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v2    = a2
    b2    = b1*b1
    v3    = b2
    c2    = c1*c1
    v4    = c2
    Ls_0  = 0.5d0*(L_xx*v2 + L_yy*v3 + L_zz*v4) + L_0 + L_z*z + v0*x + v1*y
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  Ls_0                
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Ls_x                
#undef  L_x                 
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
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
