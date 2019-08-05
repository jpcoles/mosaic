!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-03 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom3
use types
implicit none
#if FMM_EXPANSION_ORDER==3
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
        
    
! OPS  2*ADD + 2*DIV + 8*MUL + 5*POW + 2*SUB = 19  (33 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define z                    r(3)
#define M_xx                 M(1)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define M_yy                 M(4)
#define M_yz                 M(5)
    M_0  = W
    M_xy = W*x*y
    M_xz = W*x*z
    M_yz = W*y*z
    h    = x**2 + y**2 + z**2
    M_xx = W*(-1.0d0/3.0d0*h + x**2)
    M_yy = W*(-1.0d0/3.0d0*h + y**2)
#undef  x                   
#undef  y                   
#undef  M_0                 
#undef  z                   
#undef  M_xx                
#undef  M_xy                
#undef  M_xz                
#undef  M_yy                
#undef  M_yz                
    end subroutine mom_es_P2M
    
! OPS  7*ADD + 2*DIV + 8*MUL + NEG + 5*POW + 2*SUB = 25  (40 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, M_zz, S_0, S_xx, S_xy, S_xz, S_yy, S_yz
#define z                    r(3)
#define x                    r(1)
#define Ms_0                 Ms(0)
#define y                    r(2)
#define M_0                  M(0)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define M_xy                 M(2)
#define Ms_xy                Ms(2)
#define Ms_xz                Ms(3)
#define M_xz                 M(3)
#define Ms_yy                Ms(4)
#define M_yy                 M(4)
#define Ms_yz                Ms(5)
#define M_yz                 M(5)
    Ms_0  = M_0
    M_zz  = -(M_xx + M_yy)
    S_0   = 1
    S_xy  = x*y
    Ms_xy = M_0*S_xy + M_xy
    S_xz  = x*z
    Ms_xz = M_0*S_xz + M_xz
    S_yz  = y*z
    Ms_yz = M_0*S_yz + M_yz
    h     = x**2 + y**2 + z**2
    S_xx  = -1.0d0/3.0d0*h + x**2
    Ms_xx = M_0*S_xx + M_xx
    S_yy  = -1.0d0/3.0d0*h + y**2
    Ms_yy = M_0*S_yy + M_yy
#undef  z                   
#undef  x                   
#undef  Ms_0                
#undef  y                   
#undef  M_0                 
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
    
! OPS  20*ADD + 5*DIV + 89*MUL + 9*NEG + 35*POW + 8*SUB = 166  (188 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                M_zz
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define L_xx                 L(3)
#define M_xz                 M(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define L_yz                 L(7)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define L_xyy                L(11)
#define L_xyz                L(12)
#define L_yyy                L(13)
#define L_yyz                L(14)
    M_zz  = -(M_xx + M_yy)
    h     = x**2 + y**2 + z**2
    u2    = 1.0/h
    u     = sqrt(u2)
    D_x   = -u**3*x
    D_y   = -u**3*y
    D_z   = -u**3*z
    D_xx  = -h*u**5 + 3*u**5*x**2
    L_xx  = D_xx*M_0
    D_xy  = 3*u**5*x*y
    L_xy  = D_xy*M_0
    D_xz  = 3*u**5*x*z
    L_xz  = D_xz*M_0
    D_yy  = -h*u**5 + 3*u**5*y**2
    L_yy  = D_yy*M_0
    D_yz  = 3*u**5*y*z
    L_yz  = D_yz*M_0
    D_zz  = -(D_xx + D_yy)
    D_xxx = 9*h*u**7*x - 15*u**7*x**3
    L_xxx = D_xxx*M_0
    D_xxy = 3*h*u**7*y - 15*u**7*x**2*y
    L_xxy = D_xxy*M_0
    D_xxz = 3*h*u**7*z - 15*u**7*x**2*z
    L_xxz = D_xxz*M_0
    D_xyy = 3*h*u**7*x - 15*u**7*x*y**2
    L_xyy = D_xyy*M_0
    D_xyz = -15*u**7*x*y*z
    L_xyz = D_xyz*M_0
    D_xzz = -(D_xxx + D_xyy)
    L_x   = D_x*M_0 + D_xxy*M_xy + D_xxz*M_xz + D_xyz*M_yz + (1.0d0/2.0d0)*(D_xxx* &
      M_xx + D_xyy*M_yy + D_xzz*M_zz)
    D_yyy = 9*h*u**7*y - 15*u**7*y**3
    L_yyy = D_yyy*M_0
    D_yyz = 3*h*u**7*z - 15*u**7*y**2*z
    L_yyz = D_yyz*M_0
    D_yzz = -(D_xxy + D_yyy)
    L_y   = D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/2.0d0)*(D_xxy* &
      M_xx + D_yyy*M_yy + D_yzz*M_zz)
    D_zzz = -(D_xxz + D_yyz)
    L_z   = D_xyz*M_xy + D_xzz*M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/2.0d0)*(D_xxz* &
      M_xx + D_yyz*M_yy + D_zzz*M_zz)
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  L_xx                
#undef  M_xz                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  L_yz                
#undef  L_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  L_yyz               
    end subroutine mom_es_M2L
    
! OPS  42*ADD + 3*DIV + 51*MUL + 4*NEG + 9*POW = 109  (138 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, L_zz, L_xzz, L_yzz, L_zzz
#define Ls_x                 Ls(0)
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
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
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define Ls_xxz               Ls(10)
#define Ls_xyy               Ls(11)
#define L_xyy                L(11)
#define L_xyz                L(12)
#define Ls_xyz               Ls(12)
#define L_yyy                L(13)
#define Ls_yyy               Ls(13)
#define Ls_yyz               Ls(14)
#define L_yyz                L(14)
    Ls_xx  = L_xx + L_xxx*x + L_xxy*y + L_xxz*z
    Ls_xy  = L_xxy*x + L_xy + L_xyy*y + L_xyz*z
    Ls_yy  = L_xyy*x + L_yy + L_yyy*y + L_yyz*z
    Ls_xxx = L_xxx
    Ls_xxy = L_xxy
    Ls_xxz = L_xxz
    Ls_xyy = L_xyy
    Ls_xyz = L_xyz
    Ls_yyy = L_yyy
    Ls_yyz = L_yyz
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    Ls_x   = L_x + L_xx*x + L_xxy*x*y + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + ( &
      1.0d0/2.0d0)*(L_xxx*x**2 + L_xyy*y**2 + L_xzz*z**2)
    Ls_xz  = L_xxz*x + L_xyz*y + L_xz + L_xzz*z
    L_yzz  = -(L_xxy + L_yyy)
    Ls_y   = L_xy*x + L_xyy*x*y + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + ( &
      1.0d0/2.0d0)*(L_xxy*x**2 + L_yyy*y**2 + L_yzz*z**2)
    Ls_yz  = L_xyz*x + L_yyz*y + L_yz + L_yzz*z
    L_zzz  = -(L_xxz + L_yyz)
    Ls_z   = L_xyz*x*y + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + ( &
      1.0d0/2.0d0)*(L_xxz*x**2 + L_yyz*y**2 + L_zzz*z**2)
#undef  Ls_x                
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_y                
#undef  L_y                 
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
#undef  Ls_xxx              
#undef  L_xxx               
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
#undef  Ls_xyy              
#undef  L_xyy               
#undef  L_xyz               
#undef  Ls_xyz              
#undef  L_yyy               
#undef  Ls_yyy              
#undef  Ls_yyz              
#undef  L_yyz               
    end subroutine mom_es_L2L
    
! OPS  27*ADD + 3*DIV + 36*MUL + 4*NEG + 9*POW = 79  (108 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, L_zz, L_xzz, L_yzz, L_zzz
#define Phi_x                Phi(0)
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Phi_y                Phi(1)
#define L_y                  L(1)
#define Phi_z                Phi(2)
#define L_z                  L(2)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define L_yz                 L(7)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define L_xyy                L(11)
#define L_xyz                L(12)
#define L_yyy                L(13)
#define L_yyz                L(14)
    L_zz  = -(L_xx + L_yy)
    L_xzz = -(L_xxx + L_xyy)
    Phi_x = L_x + L_xx*x + L_xxy*x*y + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + ( &
      1.0d0/2.0d0)*(L_xxx*x**2 + L_xyy*y**2 + L_xzz*z**2)
    L_yzz = -(L_xxy + L_yyy)
    Phi_y = L_xy*x + L_xyy*x*y + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + ( &
      1.0d0/2.0d0)*(L_xxy*x**2 + L_yyy*y**2 + L_yzz*z**2)
    L_zzz = -(L_xxz + L_yyz)
    Phi_z = L_xyz*x*y + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + ( &
      1.0d0/2.0d0)*(L_xxz*x**2 + L_yyz*y**2 + L_zzz*z**2)
#undef  Phi_x               
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_y               
#undef  L_y                 
#undef  Phi_z               
#undef  L_z                 
#undef  L_xx                
#undef  L_xy                
#undef  L_xz                
#undef  L_yy                
#undef  L_yz                
#undef  L_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  L_yyz               
    end subroutine mom_es_L2P
    
! OPS  7*ADD + 2*DIV + 8*MUL + NEG + 5*POW + 2*SUB = 25  (40 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, M_zz, S_0, S_xx, S_xy, S_xz, S_yy, S_yz
#define z                    r(3)
#define x                    r(1)
#define Ms_0                 Ms(0)
#define y                    r(2)
#define M_0                  M(0)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define M_xy                 M(2)
#define Ms_xy                Ms(2)
#define Ms_xz                Ms(3)
#define M_xz                 M(3)
#define Ms_yy                Ms(4)
#define M_yy                 M(4)
#define Ms_yz                Ms(5)
#define M_yz                 M(5)
    Ms_0  = Ms_0 + (M_0)
    M_zz  = -(M_xx + M_yy)
    S_0   = 1
    S_xy  = x*y
    Ms_xy = Ms_xy + (M_0*S_xy + M_xy)
    S_xz  = x*z
    Ms_xz = Ms_xz + (M_0*S_xz + M_xz)
    S_yz  = y*z
    Ms_yz = Ms_yz + (M_0*S_yz + M_yz)
    h     = x**2 + y**2 + z**2
    S_xx  = -1.0d0/3.0d0*h + x**2
    Ms_xx = Ms_xx + (M_0*S_xx + M_xx)
    S_yy  = -1.0d0/3.0d0*h + y**2
    Ms_yy = Ms_yy + (M_0*S_yy + M_yy)
#undef  z                   
#undef  x                   
#undef  Ms_0                
#undef  y                   
#undef  M_0                 
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
    
! OPS  20*ADD + 5*DIV + 89*MUL + 9*NEG + 35*POW + 8*SUB = 166  (188 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                M_zz
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define L_xx                 L(3)
#define M_xz                 M(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define L_yz                 L(7)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define L_xyy                L(11)
#define L_xyz                L(12)
#define L_yyy                L(13)
#define L_yyz                L(14)
    M_zz  = -(M_xx + M_yy)
    h     = x**2 + y**2 + z**2
    u2    = 1.0/h
    u     = sqrt(u2)
    D_x   = -u**3*x
    D_y   = -u**3*y
    D_z   = -u**3*z
    D_xx  = -h*u**5 + 3*u**5*x**2
    L_xx  = L_xx + (D_xx*M_0)
    D_xy  = 3*u**5*x*y
    L_xy  = L_xy + (D_xy*M_0)
    D_xz  = 3*u**5*x*z
    L_xz  = L_xz + (D_xz*M_0)
    D_yy  = -h*u**5 + 3*u**5*y**2
    L_yy  = L_yy + (D_yy*M_0)
    D_yz  = 3*u**5*y*z
    L_yz  = L_yz + (D_yz*M_0)
    D_zz  = -(D_xx + D_yy)
    D_xxx = 9*h*u**7*x - 15*u**7*x**3
    L_xxx = L_xxx + (D_xxx*M_0)
    D_xxy = 3*h*u**7*y - 15*u**7*x**2*y
    L_xxy = L_xxy + (D_xxy*M_0)
    D_xxz = 3*h*u**7*z - 15*u**7*x**2*z
    L_xxz = L_xxz + (D_xxz*M_0)
    D_xyy = 3*h*u**7*x - 15*u**7*x*y**2
    L_xyy = L_xyy + (D_xyy*M_0)
    D_xyz = -15*u**7*x*y*z
    L_xyz = L_xyz + (D_xyz*M_0)
    D_xzz = -(D_xxx + D_xyy)
    L_x   = L_x + (D_x*M_0 + D_xxy*M_xy + D_xxz*M_xz + D_xyz*M_yz + (1.0d0/2.0d0)*(D_xxx* &
      M_xx + D_xyy*M_yy + D_xzz*M_zz))
    D_yyy = 9*h*u**7*y - 15*u**7*y**3
    L_yyy = L_yyy + (D_yyy*M_0)
    D_yyz = 3*h*u**7*z - 15*u**7*y**2*z
    L_yyz = L_yyz + (D_yyz*M_0)
    D_yzz = -(D_xxy + D_yyy)
    L_y   = L_y + (D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/2.0d0)*(D_xxy* &
      M_xx + D_yyy*M_yy + D_yzz*M_zz))
    D_zzz = -(D_xxz + D_yyz)
    L_z   = L_z + (D_xyz*M_xy + D_xzz*M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/2.0d0)*(D_xxz* &
      M_xx + D_yyz*M_yy + D_zzz*M_zz))
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  L_xx                
#undef  M_xz                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  L_yz                
#undef  L_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  L_yyz               
    end subroutine mom_es_M2L_add
    
! OPS  42*ADD + 3*DIV + 51*MUL + 4*NEG + 9*POW = 109  (138 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, L_zz, L_xzz, L_yzz, L_zzz
#define Ls_x                 Ls(0)
#define x                    r(1)
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
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
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define Ls_xxz               Ls(10)
#define Ls_xyy               Ls(11)
#define L_xyy                L(11)
#define L_xyz                L(12)
#define Ls_xyz               Ls(12)
#define L_yyy                L(13)
#define Ls_yyy               Ls(13)
#define Ls_yyz               Ls(14)
#define L_yyz                L(14)
    Ls_xx  = Ls_xx + (L_xx + L_xxx*x + L_xxy*y + L_xxz*z)
    Ls_xy  = Ls_xy + (L_xxy*x + L_xy + L_xyy*y + L_xyz*z)
    Ls_yy  = Ls_yy + (L_xyy*x + L_yy + L_yyy*y + L_yyz*z)
    Ls_xxx = Ls_xxx + (L_xxx)
    Ls_xxy = Ls_xxy + (L_xxy)
    Ls_xxz = Ls_xxz + (L_xxz)
    Ls_xyy = Ls_xyy + (L_xyy)
    Ls_xyz = Ls_xyz + (L_xyz)
    Ls_yyy = Ls_yyy + (L_yyy)
    Ls_yyz = Ls_yyz + (L_yyz)
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    Ls_x   = Ls_x + (L_x + L_xx*x + L_xxy*x*y + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + ( &
      1.0d0/2.0d0)*(L_xxx*x**2 + L_xyy*y**2 + L_xzz*z**2))
    Ls_xz  = Ls_xz + (L_xxz*x + L_xyz*y + L_xz + L_xzz*z)
    L_yzz  = -(L_xxy + L_yyy)
    Ls_y   = Ls_y + (L_xy*x + L_xyy*x*y + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + ( &
      1.0d0/2.0d0)*(L_xxy*x**2 + L_yyy*y**2 + L_yzz*z**2))
    Ls_yz  = Ls_yz + (L_xyz*x + L_yyz*y + L_yz + L_yzz*z)
    L_zzz  = -(L_xxz + L_yyz)
    Ls_z   = Ls_z + (L_xyz*x*y + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + ( &
      1.0d0/2.0d0)*(L_xxz*x**2 + L_yyz*y**2 + L_zzz*z**2))
#undef  Ls_x                
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_y                
#undef  L_y                 
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
#undef  Ls_xxx              
#undef  L_xxx               
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
#undef  Ls_xyy              
#undef  L_xyy               
#undef  L_xyz               
#undef  Ls_xyz              
#undef  L_yyy               
#undef  Ls_yyy              
#undef  Ls_yyz              
#undef  L_yyz               
    end subroutine mom_es_L2L_add
    
! OPS  20*ADD + 5*DIV + 89*MUL + 9*NEG + 35*POW + 8*SUB = 166  (188 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                M_zz
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define M_xx                 M(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define M_xy                 M(1:2,2)
#define L_xx                 L(1:2,3)
#define M_xz                 M(1:2,3)
#define M_yy                 M(1:2,4)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define M_yz                 M(1:2,5)
#define L_yy                 L(1:2,6)
#define L_yz                 L(1:2,7)
#define L_xxx                L(1:2,8)
#define L_xxy                L(1:2,9)
#define L_xxz                L(1:2,10)
#define L_xyy                L(1:2,11)
#define L_xyz                L(1:2,12)
#define L_yyy                L(1:2,13)
#define L_yyz                L(1:2,14)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    M_zz  = -(M_xx + M_yy)
    h     = x**2 + y**2 + z**2
    u2    = 1.0/h
    u     = sqrt(u2)
    D_x   = -u**3*x
    D_y   = -u**3*y
    D_z   = -u**3*z
    D_xx  = -h*u**5 + 3*u**5*x**2
    L_xx  = D_xx*M_0
    D_xy  = 3*u**5*x*y
    L_xy  = D_xy*M_0
    D_xz  = 3*u**5*x*z
    L_xz  = D_xz*M_0
    D_yy  = -h*u**5 + 3*u**5*y**2
    L_yy  = D_yy*M_0
    D_yz  = 3*u**5*y*z
    L_yz  = D_yz*M_0
    D_zz  = -(D_xx + D_yy)
    D_xxx = 9*h*u**7*x - 15*u**7*x**3
    L_xxx = D_xxx*M_0
    D_xxy = 3*h*u**7*y - 15*u**7*x**2*y
    L_xxy = D_xxy*M_0
    D_xxz = 3*h*u**7*z - 15*u**7*x**2*z
    L_xxz = D_xxz*M_0
    D_xyy = 3*h*u**7*x - 15*u**7*x*y**2
    L_xyy = D_xyy*M_0
    D_xyz = -15*u**7*x*y*z
    L_xyz = D_xyz*M_0
    D_xzz = -(D_xxx + D_xyy)
    L_x   = D_x*M_0 + D_xxy*M_xy + D_xxz*M_xz + D_xyz*M_yz + (1.0d0/2.0d0)*(D_xxx* &
      M_xx + D_xyy*M_yy + D_xzz*M_zz)
    D_yyy = 9*h*u**7*y - 15*u**7*y**3
    L_yyy = D_yyy*M_0
    D_yyz = 3*h*u**7*z - 15*u**7*y**2*z
    L_yyz = D_yyz*M_0
    D_yzz = -(D_xxy + D_yyy)
    L_y   = D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yyz*M_yz + (1.0d0/2.0d0)*(D_xxy* &
      M_xx + D_yyy*M_yy + D_yzz*M_zz)
    D_zzz = -(D_xxz + D_yyz)
    L_z   = D_xyz*M_xy + D_xzz*M_xz + D_yzz*M_yz + D_z*M_0 + (1.0d0/2.0d0)*(D_xxz* &
      M_xx + D_yyz*M_yy + D_zzz*M_zz)
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  L_xx                
#undef  M_xz                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  L_yz                
#undef  L_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  L_yyz               
    end subroutine mom_es_M2L2
    
! OPS  27*ADD + 3*DIV + 36*MUL + 4*NEG + 9*POW = 79  (108 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, L_zz, L_xzz, L_yzz, L_zzz
#define Phi_x                Phi(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Phi_y                Phi(1:2,1)
#define L_y                  L(1:2,1)
#define Phi_z                Phi(1:2,2)
#define L_z                  L(1:2,2)
#define L_xx                 L(1:2,3)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define L_yy                 L(1:2,6)
#define L_yz                 L(1:2,7)
#define L_xxx                L(1:2,8)
#define L_xxy                L(1:2,9)
#define L_xxz                L(1:2,10)
#define L_xyy                L(1:2,11)
#define L_xyz                L(1:2,12)
#define L_yyy                L(1:2,13)
#define L_yyz                L(1:2,14)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    L_zz  = -(L_xx + L_yy)
    L_xzz = -(L_xxx + L_xyy)
    Phi_x = L_x + L_xx*x + L_xxy*x*y + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + ( &
      1.0d0/2.0d0)*(L_xxx*x**2 + L_xyy*y**2 + L_xzz*z**2)
    L_yzz = -(L_xxy + L_yyy)
    Phi_y = L_xy*x + L_xyy*x*y + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + ( &
      1.0d0/2.0d0)*(L_xxy*x**2 + L_yyy*y**2 + L_yzz*z**2)
    L_zzz = -(L_xxz + L_yyz)
    Phi_z = L_xyz*x*y + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + ( &
      1.0d0/2.0d0)*(L_xxz*x**2 + L_yyz*y**2 + L_zzz*z**2)
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  Phi_x               
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_y               
#undef  L_y                 
#undef  Phi_z               
#undef  L_z                 
#undef  L_xx                
#undef  L_xy                
#undef  L_xz                
#undef  L_yy                
#undef  L_yz                
#undef  L_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  L_yyz               
    end subroutine mom_es_L2P2
    
! OPS  42*ADD + 3*DIV + 51*MUL + 4*NEG + 9*POW = 109  (138 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7, h,&
                u, L_zz, L_xzz, L_yzz, L_zzz
#define Ls_x                 Ls(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Ls_y                 Ls(1:2,1)
#define L_y                  L(1:2,1)
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
#define Ls_xxx               Ls(1:2,8)
#define L_xxx                L(1:2,8)
#define Ls_xxy               Ls(1:2,9)
#define L_xxy                L(1:2,9)
#define L_xxz                L(1:2,10)
#define Ls_xxz               Ls(1:2,10)
#define Ls_xyy               Ls(1:2,11)
#define L_xyy                L(1:2,11)
#define L_xyz                L(1:2,12)
#define Ls_xyz               Ls(1:2,12)
#define L_yyy                L(1:2,13)
#define Ls_yyy               Ls(1:2,13)
#define Ls_yyz               Ls(1:2,14)
#define L_yyz                L(1:2,14)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    Ls_xx  = L_xx + L_xxx*x + L_xxy*y + L_xxz*z
    Ls_xy  = L_xxy*x + L_xy + L_xyy*y + L_xyz*z
    Ls_yy  = L_xyy*x + L_yy + L_yyy*y + L_yyz*z
    Ls_xxx = L_xxx
    Ls_xxy = L_xxy
    Ls_xxz = L_xxz
    Ls_xyy = L_xyy
    Ls_xyz = L_xyz
    Ls_yyy = L_yyy
    Ls_yyz = L_yyz
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    Ls_x   = L_x + L_xx*x + L_xxy*x*y + L_xxz*x*z + L_xy*y + L_xyz*y*z + L_xz*z + ( &
      1.0d0/2.0d0)*(L_xxx*x**2 + L_xyy*y**2 + L_xzz*z**2)
    Ls_xz  = L_xxz*x + L_xyz*y + L_xz + L_xzz*z
    L_yzz  = -(L_xxy + L_yyy)
    Ls_y   = L_xy*x + L_xyy*x*y + L_xyz*x*z + L_y + L_yy*y + L_yyz*y*z + L_yz*z + ( &
      1.0d0/2.0d0)*(L_xxy*x**2 + L_yyy*y**2 + L_yzz*z**2)
    Ls_yz  = L_xyz*x + L_yyz*y + L_yz + L_yzz*z
    L_zzz  = -(L_xxz + L_yyz)
    Ls_z   = L_xyz*x*y + L_xz*x + L_xzz*x*z + L_yz*y + L_yzz*y*z + L_z + L_zz*z + ( &
      1.0d0/2.0d0)*(L_xxz*x**2 + L_yyz*y**2 + L_zzz*z**2)
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  Ls_x                
#undef  x                   
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_y                
#undef  L_y                 
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
#undef  Ls_xxx              
#undef  L_xxx               
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
#undef  Ls_xyy              
#undef  L_xyy               
#undef  L_xyz               
#undef  Ls_xyz              
#undef  L_yyy               
#undef  Ls_yyy              
#undef  Ls_yyz              
#undef  L_yyz               
    end subroutine mom_es_L2L2_add
#endif
end module mom3
