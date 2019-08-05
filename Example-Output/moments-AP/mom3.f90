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
        
    
! OPS  4*ADD + 13*MUL + NEG = 18  (35 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v2, v3, h, u
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define z                    r(3)
#define M_xx                 M(1)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define M_yy                 M(4)
#define M_yz                 M(5)
    v0   = W*x
    M_0  = W
    M_xy = v0*y
    M_xz = v0*z
    M_yz = W*y*z
    c1   = z
    b1   = y
    a1   = x
    a2   = a1*a1
    v1   = a2
    a3   = a1*a2
    b2   = b1*b1
    v2   = b2
    b3   = b1*b2
    c2   = c1*c1
    h    = c2 + v1 + v2
    v3   = -0.333333333333333d0*h
    M_xx = W*(v1 + v3)
    M_yy = W*(v2 + v3)
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
    
! OPS  9*ADD + 14*MUL + 2*NEG = 25  (40 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v2, h, u, M_zz, S_0, S_xx, S_xy, S_xz, S_yy, S_yz
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
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v2    = -0.333333333333333d0*h
    S_xx  = v0 + v2
    Ms_xx = M_0*S_xx + M_xx
    S_yy  = v1 + v2
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
    
! OPS  24*ADD + 2*DIV + 77*MUL + 12*NEG + POW + 2*SUB = 118  (182 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v2, v3,&
                v4, v5, v6, v7, v8, v9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, M_zz
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
    v18   = y*z
    v11   = 0.5d0*M_xx
    v12   = 0.5d0*M_yy
    M_zz  = -(M_xx + M_yy)
    v13   = 0.5d0*M_zz
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v17   = -5.0d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v14   = 3.0d0*h
    v4    = -h
    v9    = v14
    v10   = -15.0d0*v1 + v9
    u2    = 1.0/h
    u     = sqrt(u2)
    u3    = u*u2
    v2    = u3
    D_x   = -v2*x
    D_y   = -v2*y
    D_z   = -v2*z
    u4    = u2*u2
    u5    = u2*u3
    v3    = u5
    v15   = 3.0d0*v3
    v5    = v15*x
    D_xx  = v3*(3.0d0*v0 + v4)
    L_xx  = D_xx*M_0
    D_xy  = v5*y
    L_xy  = D_xy*M_0
    D_xz  = v5*z
    L_xz  = D_xz*M_0
    D_yy  = v3*(3.0d0*v1 + v4)
    L_yy  = D_yy*M_0
    D_yz  = v15*v18
    L_yz  = D_yz*M_0
    D_zz  = -(D_xx + D_yy)
    u6    = u3*u3
    u7    = u3*u4
    v6    = u7
    v16   = 3.0d0*v6
    v7    = v6*x
    v8    = v16*(h + v17)
    D_xxx = 3.0d0*v7*(v14 + v17)
    L_xxx = D_xxx*M_0
    D_xxy = v8*y
    L_xxy = D_xxy*M_0
    D_xxz = v8*z
    L_xxz = D_xxz*M_0
    D_xyy = v10*v7
    L_xyy = D_xyy*M_0
    D_xyz = -15.0d0*v18*v7
    L_xyz = D_xyz*M_0
    D_xzz = -(D_xxx + D_xyy)
    L_x   = D_x*M_0 + D_xxx*v11 + D_xxy*M_xy + D_xxz*M_xz + D_xyy*v12 + D_xyz*M_yz + &
      D_xzz*v13
    D_yyy = -v16*y*(5.0d0*v1 - v9)
    L_yyy = D_yyy*M_0
    D_yyz = v10*v6*z
    L_yyz = D_yyz*M_0
    D_yzz = -(D_xxy + D_yyy)
    L_y   = D_xxy*v11 + D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yyy*v12 + D_yyz*M_yz + &
      D_yzz*v13
    D_zzz = -(D_xxz + D_yyz)
    L_z   = D_xxz*v11 + D_xyz*M_xy + D_xzz*M_xz + D_yyz*v12 + D_yzz*M_yz + D_z*M_0 + &
      D_zzz*v13
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
    
! OPS  33*ADD + 41*MUL + 4*NEG = 78  (129 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v2, v3, v4, v5, v6, v7, v8, v9, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz
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
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    Ls_xx  = L_xxx*x + v0
    Ls_xy  = L_xxy*x + v2
    Ls_yy  = v3 + L_xyy*x + L_yyy*y
    Ls_xxx = L_xxx
    Ls_xxy = L_xxy
    Ls_xxz = L_xxz
    Ls_xyy = L_xyy
    Ls_xyz = L_xyz
    Ls_yyy = L_yyy
    Ls_yyz = L_yyz
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    v10    = L_xz + L_xyz*y + L_xzz*z
    Ls_xz  = L_xxz*x + v10
    L_yzz  = -(L_xxy + L_yyy)
    v11    = L_yz + L_yzz*z
    Ls_yz  = v11 + L_xyz*x + L_yyz*y
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v4     = a2
    v5     = 0.5d0*v4
    a3     = a1*a2
    b2     = b1*b1
    v6     = b2
    v7     = 0.5d0*v6
    b3     = b1*b2
    c2     = c1*c1
    v8     = c2
    v9     = 0.5d0*v8
    Ls_x   = L_x + L_xxx*v5 + L_xyy*v7 + L_xz*z + L_xzz*v9 + v0*x + v1*y
    Ls_y   = L_y + L_xxy*v5 + L_yyy*v7 + L_yz*z + L_yzz*v9 + v2*x + v3*y
    Ls_z   = L_z + L_xxz*v5 + L_yyz*v7 + L_zz*z + L_zzz*v9 + v10*x + v11*y
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
    
! OPS  26*ADD + 34*MUL + 4*NEG = 64  (99 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v2, v3, v4, v5, v6, h, u, L_zz, L_xzz, L_yzz, L_zzz
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
    v6    = L_xy + L_xyz*z
    L_zz  = -(L_xx + L_yy)
    L_xzz = -(L_xxx + L_xyy)
    L_yzz = -(L_xxy + L_yyy)
    L_zzz = -(L_xxz + L_yyz)
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v1    = 0.5d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v2    = b2
    v3    = 0.5d0*v2
    b3    = b1*b2
    c2    = c1*c1
    v4    = c2
    v5    = 0.5d0*v4
    Phi_x = L_x + L_xxx*v1 + L_xyy*v3 + L_xz*z + L_xzz*v5 + v6*y + x*(L_xx + L_xxy*y &
      + L_xxz*z)
    Phi_y = L_y + L_xxy*v1 + L_yyy*v3 + L_yz*z + L_yzz*v5 + x*(L_xyy*y + v6) + y*( &
      L_yy + L_yyz*z)
    Phi_z = L_z + L_xxz*v1 + L_yyz*v3 + L_zz*z + L_zzz*v5 + x*(L_xyz*y + L_xz + &
      L_xzz*z) + y*(L_yz + L_yzz*z)
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
    
! OPS  9*ADD + 14*MUL + 2*NEG = 25  (40 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v2, h, u, M_zz, S_0, S_xx, S_xy, S_xz, S_yy, S_yz
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
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v2    = -0.333333333333333d0*h
    S_xx  = v0 + v2
    Ms_xx = Ms_xx + (M_0*S_xx + M_xx)
    S_yy  = v1 + v2
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
    
! OPS  24*ADD + 2*DIV + 77*MUL + 12*NEG + POW + 2*SUB = 118  (182 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v2, v3,&
                v4, v5, v6, v7, v8, v9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, M_zz
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
    v18   = y*z
    v11   = 0.5d0*M_xx
    v12   = 0.5d0*M_yy
    M_zz  = -(M_xx + M_yy)
    v13   = 0.5d0*M_zz
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v17   = -5.0d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v14   = 3.0d0*h
    v4    = -h
    v9    = v14
    v10   = -15.0d0*v1 + v9
    u2    = 1.0/h
    u     = sqrt(u2)
    u3    = u*u2
    v2    = u3
    D_x   = -v2*x
    D_y   = -v2*y
    D_z   = -v2*z
    u4    = u2*u2
    u5    = u2*u3
    v3    = u5
    v15   = 3.0d0*v3
    v5    = v15*x
    D_xx  = v3*(3.0d0*v0 + v4)
    L_xx  = L_xx + (D_xx*M_0)
    D_xy  = v5*y
    L_xy  = L_xy + (D_xy*M_0)
    D_xz  = v5*z
    L_xz  = L_xz + (D_xz*M_0)
    D_yy  = v3*(3.0d0*v1 + v4)
    L_yy  = L_yy + (D_yy*M_0)
    D_yz  = v15*v18
    L_yz  = L_yz + (D_yz*M_0)
    D_zz  = -(D_xx + D_yy)
    u6    = u3*u3
    u7    = u3*u4
    v6    = u7
    v16   = 3.0d0*v6
    v7    = v6*x
    v8    = v16*(h + v17)
    D_xxx = 3.0d0*v7*(v14 + v17)
    L_xxx = L_xxx + (D_xxx*M_0)
    D_xxy = v8*y
    L_xxy = L_xxy + (D_xxy*M_0)
    D_xxz = v8*z
    L_xxz = L_xxz + (D_xxz*M_0)
    D_xyy = v10*v7
    L_xyy = L_xyy + (D_xyy*M_0)
    D_xyz = -15.0d0*v18*v7
    L_xyz = L_xyz + (D_xyz*M_0)
    D_xzz = -(D_xxx + D_xyy)
    L_x   = L_x + (D_x*M_0 + D_xxx*v11 + D_xxy*M_xy + D_xxz*M_xz + D_xyy*v12 + D_xyz*M_yz + &
      D_xzz*v13)
    D_yyy = -v16*y*(5.0d0*v1 - v9)
    L_yyy = L_yyy + (D_yyy*M_0)
    D_yyz = v10*v6*z
    L_yyz = L_yyz + (D_yyz*M_0)
    D_yzz = -(D_xxy + D_yyy)
    L_y   = L_y + (D_xxy*v11 + D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yyy*v12 + D_yyz*M_yz + &
      D_yzz*v13)
    D_zzz = -(D_xxz + D_yyz)
    L_z   = L_z + (D_xxz*v11 + D_xyz*M_xy + D_xzz*M_xz + D_yyz*v12 + D_yzz*M_yz + D_z*M_0 + &
      D_zzz*v13)
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
    
! OPS  33*ADD + 41*MUL + 4*NEG = 78  (129 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v2, v3, v4, v5, v6, v7, v8, v9, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz
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
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    Ls_xx  = Ls_xx + (L_xxx*x + v0)
    Ls_xy  = Ls_xy + (L_xxy*x + v2)
    Ls_yy  = Ls_yy + (v3 + L_xyy*x + L_yyy*y)
    Ls_xxx = Ls_xxx + (L_xxx)
    Ls_xxy = Ls_xxy + (L_xxy)
    Ls_xxz = Ls_xxz + (L_xxz)
    Ls_xyy = Ls_xyy + (L_xyy)
    Ls_xyz = Ls_xyz + (L_xyz)
    Ls_yyy = Ls_yyy + (L_yyy)
    Ls_yyz = Ls_yyz + (L_yyz)
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    v10    = L_xz + L_xyz*y + L_xzz*z
    Ls_xz  = Ls_xz + (L_xxz*x + v10)
    L_yzz  = -(L_xxy + L_yyy)
    v11    = L_yz + L_yzz*z
    Ls_yz  = Ls_yz + (v11 + L_xyz*x + L_yyz*y)
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v4     = a2
    v5     = 0.5d0*v4
    a3     = a1*a2
    b2     = b1*b1
    v6     = b2
    v7     = 0.5d0*v6
    b3     = b1*b2
    c2     = c1*c1
    v8     = c2
    v9     = 0.5d0*v8
    Ls_x   = Ls_x + (L_x + L_xxx*v5 + L_xyy*v7 + L_xz*z + L_xzz*v9 + v0*x + v1*y)
    Ls_y   = Ls_y + (L_y + L_xxy*v5 + L_yyy*v7 + L_yz*z + L_yzz*v9 + v2*x + v3*y)
    Ls_z   = Ls_z + (L_z + L_xxz*v5 + L_yyz*v7 + L_zz*z + L_zzz*v9 + v10*x + v11*y)
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
    
! OPS  24*ADD + 2*DIV + 77*MUL + 12*NEG + POW + 2*SUB = 118  (182 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v2, v3,&
                v4, v5, v6, v7, v8, v9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, M_zz
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
    v18   = y*z
    v11   = 0.5d0*M_xx
    v12   = 0.5d0*M_yy
    M_zz  = -(M_xx + M_yy)
    v13   = 0.5d0*M_zz
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v17   = -5.0d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v14   = 3.0d0*h
    v4    = -h
    v9    = v14
    v10   = -15.0d0*v1 + v9
    u2    = 1.0/h
    u     = sqrt(u2)
    u3    = u*u2
    v2    = u3
    D_x   = -v2*x
    D_y   = -v2*y
    D_z   = -v2*z
    u4    = u2*u2
    u5    = u2*u3
    v3    = u5
    v15   = 3.0d0*v3
    v5    = v15*x
    D_xx  = v3*(3.0d0*v0 + v4)
    L_xx  = D_xx*M_0
    D_xy  = v5*y
    L_xy  = D_xy*M_0
    D_xz  = v5*z
    L_xz  = D_xz*M_0
    D_yy  = v3*(3.0d0*v1 + v4)
    L_yy  = D_yy*M_0
    D_yz  = v15*v18
    L_yz  = D_yz*M_0
    D_zz  = -(D_xx + D_yy)
    u6    = u3*u3
    u7    = u3*u4
    v6    = u7
    v16   = 3.0d0*v6
    v7    = v6*x
    v8    = v16*(h + v17)
    D_xxx = 3.0d0*v7*(v14 + v17)
    L_xxx = D_xxx*M_0
    D_xxy = v8*y
    L_xxy = D_xxy*M_0
    D_xxz = v8*z
    L_xxz = D_xxz*M_0
    D_xyy = v10*v7
    L_xyy = D_xyy*M_0
    D_xyz = -15.0d0*v18*v7
    L_xyz = D_xyz*M_0
    D_xzz = -(D_xxx + D_xyy)
    L_x   = D_x*M_0 + D_xxx*v11 + D_xxy*M_xy + D_xxz*M_xz + D_xyy*v12 + D_xyz*M_yz + &
      D_xzz*v13
    D_yyy = -v16*y*(5.0d0*v1 - v9)
    L_yyy = D_yyy*M_0
    D_yyz = v10*v6*z
    L_yyz = D_yyz*M_0
    D_yzz = -(D_xxy + D_yyy)
    L_y   = D_xxy*v11 + D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yyy*v12 + D_yyz*M_yz + &
      D_yzz*v13
    D_zzz = -(D_xxz + D_yyz)
    L_z   = D_xxz*v11 + D_xyz*M_xy + D_xzz*M_xz + D_yyz*v12 + D_yzz*M_yz + D_z*M_0 + &
      D_zzz*v13
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
    
! OPS  26*ADD + 34*MUL + 4*NEG = 64  (99 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v2, v3, v4, v5, v6, h, u, L_zz, L_xzz, L_yzz, L_zzz
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
    v6    = L_xy + L_xyz*z
    L_zz  = -(L_xx + L_yy)
    L_xzz = -(L_xxx + L_xyy)
    L_yzz = -(L_xxy + L_yyy)
    L_zzz = -(L_xxz + L_yyz)
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v1    = 0.5d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v2    = b2
    v3    = 0.5d0*v2
    b3    = b1*b2
    c2    = c1*c1
    v4    = c2
    v5    = 0.5d0*v4
    Phi_x = L_x + L_xxx*v1 + L_xyy*v3 + L_xz*z + L_xzz*v5 + v6*y + x*(L_xx + L_xxy*y &
      + L_xxz*z)
    Phi_y = L_y + L_xxy*v1 + L_yyy*v3 + L_yz*z + L_yzz*v5 + x*(L_xyy*y + v6) + y*( &
      L_yy + L_yyz*z)
    Phi_z = L_z + L_xxz*v1 + L_yyz*v3 + L_zz*z + L_zzz*v5 + x*(L_xyz*y + L_xz + &
      L_xzz*z) + y*(L_yz + L_yzz*z)
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
    
! OPS  33*ADD + 41*MUL + 4*NEG = 78  (129 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v2, v3, v4, v5, v6, v7, v8, v9, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz
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
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    Ls_xx  = L_xxx*x + v0
    Ls_xy  = L_xxy*x + v2
    Ls_yy  = v3 + L_xyy*x + L_yyy*y
    Ls_xxx = L_xxx
    Ls_xxy = L_xxy
    Ls_xxz = L_xxz
    Ls_xyy = L_xyy
    Ls_xyz = L_xyz
    Ls_yyy = L_yyy
    Ls_yyz = L_yyz
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    v10    = L_xz + L_xyz*y + L_xzz*z
    Ls_xz  = L_xxz*x + v10
    L_yzz  = -(L_xxy + L_yyy)
    v11    = L_yz + L_yzz*z
    Ls_yz  = v11 + L_xyz*x + L_yyz*y
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v4     = a2
    v5     = 0.5d0*v4
    a3     = a1*a2
    b2     = b1*b1
    v6     = b2
    v7     = 0.5d0*v6
    b3     = b1*b2
    c2     = c1*c1
    v8     = c2
    v9     = 0.5d0*v8
    Ls_x   = L_x + L_xxx*v5 + L_xyy*v7 + L_xz*z + L_xzz*v9 + v0*x + v1*y
    Ls_y   = L_y + L_xxy*v5 + L_yyy*v7 + L_yz*z + L_yzz*v9 + v2*x + v3*y
    Ls_z   = L_z + L_xxz*v5 + L_yyz*v7 + L_zz*z + L_zzz*v9 + v10*x + v11*y
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
