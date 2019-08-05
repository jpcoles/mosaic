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
        
    
! OPS  2*ADD + 2*DIV + 36*MUL + POW = 41  (73 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v2, v3, v4, v5, v6, v7, v8, v9, h, u
#define x                    r(1)
#define y                    r(2)
#define z                    r(3)
#define M_0                  M(0)
#define M_x                  M(1)
#define M_y                  M(2)
#define M_z                  M(3)
#define M_xx                 M(4)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define M_yy                 M(7)
#define M_yz                 M(8)
#define M_zz                 M(9)
#define M_xxx                M(10)
#define M_xxy                M(11)
#define M_xxz                M(12)
#define M_xyy                M(13)
#define M_xyz                M(14)
#define M_xzz                M(15)
#define M_yyy                M(16)
#define M_yyz                M(17)
#define M_yzz                M(18)
#define M_zzz                M(19)
    v11   = 0.5d0*W
    v0    = W*x
    v1    = W*y
    v2    = W*z
    v3    = v11
    v5    = v0*y
    v8    = 0.166666666666667d0*W
    v10   = v11*x
    M_0   = W
    M_x   = v0
    M_y   = v1
    M_z   = v2
    M_xy  = v5
    M_xz  = v0*z
    M_yz  = v1*z
    M_xyz = v5*z
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v4    = a2
    v9    = 0.5d0*v4
    M_xx  = v3*v4
    M_xxy = v1*v9
    M_xxz = v2*v9
    a3    = a1*a2
    M_xxx = a3*v8
    b2    = b1*b1
    v6    = b2
    M_yy  = v3*v6
    M_xyy = v10*v6
    M_yyz = 0.5d0*v2*v6
    b3    = b1*b2
    M_yyy = b3*v8
    c2    = c1*c1
    v7    = c2
    M_zz  = v3*v7
    M_xzz = v10*v7
    M_yzz = 0.5d0*v1*v7
    h     = v4 + v6 + v7
    u2    = 1.0/h
    u     = sqrt(u2)
    u3    = u*u2
    u4    = u2*u2
    u5    = u2*u3
    u6    = u3*u3
    u7    = u3*u4
    c3    = c1*c2
    M_zzz = c3*v8
#undef  x                   
#undef  y                   
#undef  z                   
#undef  M_0                 
#undef  M_x                 
#undef  M_y                 
#undef  M_z                 
#undef  M_xx                
#undef  M_xy                
#undef  M_xz                
#undef  M_yy                
#undef  M_yz                
#undef  M_zz                
#undef  M_xxx               
#undef  M_xxy               
#undef  M_xxz               
#undef  M_xyy               
#undef  M_xyz               
#undef  M_xzz               
#undef  M_yyy               
#undef  M_yyz               
#undef  M_yzz               
#undef  M_zzz               
    end subroutine mom_es_P2M
    
! OPS  60*ADD + 2*DIV + 74*MUL + POW = 137  (203 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v2,&
                v3, v4, v5, v6, v7, v8, v9, h, u
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
#define Ms_zz                Ms(9)
#define M_zz                 M(9)
#define M_xxx                M(10)
#define Ms_xxx               Ms(10)
#define M_xxy                M(11)
#define Ms_xxy               Ms(11)
#define Ms_xxz               Ms(12)
#define M_xxz                M(12)
#define M_xyy                M(13)
#define Ms_xyy               Ms(13)
#define M_xyz                M(14)
#define Ms_xyz               Ms(14)
#define M_xzz                M(15)
#define Ms_xzz               Ms(15)
#define Ms_yyy               Ms(16)
#define M_yyy                M(16)
#define Ms_yyz               Ms(17)
#define M_yyz                M(17)
#define M_yzz                M(18)
#define Ms_yzz               Ms(18)
#define M_zzz                M(19)
#define Ms_zzz               Ms(19)
    v0     = M_0*x
    v1     = M_x + v0
    v2     = M_0*y
    v3     = M_y + v2
    v4     = M_0*z + M_z
    v5     = M_x*x
    v6     = 0.5d0*M_0
    v8     = M_x*y
    v9     = M_y*x
    v10    = v0*y
    v11    = M_z*x
    v12    = M_y*y
    v14    = M_z*y
    v16    = 0.166666666666667d0*M_0
    Ms_0   = M_0
    Ms_x   = v1
    Ms_y   = v3
    Ms_z   = v4
    Ms_xy  = M_xy + v10 + v8 + v9
    Ms_xz  = M_xz + v11 + M_x*z + v0*z
    Ms_yz  = M_yz + v14 + M_y*z + v2*z
    Ms_xyz = M_xyz + M_xy*z + M_xz*y + M_yz*x + v10*z + v11*y + v8*z + v9*z
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v7     = a2
    v17    = 0.5d0*v7
    Ms_xx  = v6*v7 + M_xx + v5
    Ms_xxy = M_xxy + M_xx*y + M_xy*x + v17*v3 + v5*y
    Ms_xxz = M_xxz + M_xx*z + M_xz*x + v17*v4 + v5*z
    a3     = a1*a2
    Ms_xxx = M_xxx + M_x*v17 + M_xx*x + a3*v16
    b2     = b1*b1
    v13    = b2
    v18    = 0.5d0*v13
    Ms_yy  = v13*v6 + M_yy + v12
    Ms_xyy = M_xyy + M_xy*y + M_yy*x + v1*v18 + v9*y
    Ms_yyz = M_yyz + M_yy*z + M_yz*y + v12*z + v18*v4
    b3     = b1*b2
    Ms_yyy = M_yyy + M_y*v18 + M_yy*y + b3*v16
    c2     = c1*c1
    v15    = c2
    v19    = 0.5d0*v15
    Ms_zz  = M_zz + M_z*z + v15*v6
    Ms_xzz = M_xzz + M_xz*z + M_zz*x + v1*v19 + v11*z
    Ms_yzz = M_yzz + M_yz*z + M_zz*y + v14*z + v19*v3
    h      = v13 + v15 + v7
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    c3     = c1*c2
    Ms_zzz = M_zzz + M_z*v19 + M_zz*z + c3*v16
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
#undef  Ms_zz               
#undef  M_zz                
#undef  M_xxx               
#undef  Ms_xxx              
#undef  M_xxy               
#undef  Ms_xxy              
#undef  Ms_xxz              
#undef  M_xxz               
#undef  M_xyy               
#undef  Ms_xyy              
#undef  M_xyz               
#undef  Ms_xyz              
#undef  M_xzz               
#undef  Ms_xzz              
#undef  Ms_yyy              
#undef  M_yyy               
#undef  Ms_yyz              
#undef  M_yyz               
#undef  M_yzz               
#undef  Ms_yzz              
#undef  M_zzz               
#undef  Ms_zzz              
    end subroutine mom_es_M2M
    
! OPS  67*ADD + 2*DIV + 118*MUL + 11*NEG + POW + 2*SUB = 201  (264 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v2, v3, v4, v5, v6, v7,&
                v8, v9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy,&
                D_yyz, D_yzz, D_zzz
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
#define M_zz                 M(9)
#define L_xxx                L(9)
#define M_xxx                M(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define M_xxy                M(11)
#define L_xyy                L(12)
#define M_xxz                M(12)
#define M_xyy                M(13)
#define L_xyz                L(13)
#define L_yyy                L(14)
#define M_xyz                M(14)
#define M_xzz                M(15)
#define L_yyz                L(15)
#define M_yyy                M(16)
#define M_yyz                M(17)
#define M_yzz                M(18)
#define M_zzz                M(19)
    v15   = y*z
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v14   = -5.0d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v11   = 3.0d0*h
    v4    = -h
    v9    = v11
    v10   = -15.0d0*v1 + v9
    u2    = 1.0/h
    u     = sqrt(u2)
    D_0   = u
    u3    = u*u2
    v2    = u3
    D_x   = -v2*x
    D_y   = -v2*y
    D_z   = -v2*z
    u4    = u2*u2
    u5    = u2*u3
    v3    = u5
    v12   = 3.0d0*v3
    v5    = v12*x
    D_xx  = v3*(3.0d0*v0 + v4)
    D_xy  = v5*y
    D_xz  = v5*z
    D_yy  = v3*(3.0d0*v1 + v4)
    D_yz  = v12*v15
    D_zz  = -(D_xx + D_yy)
    u6    = u3*u3
    u7    = u3*u4
    v6    = u7
    v13   = 3.0d0*v6
    v7    = v6*x
    v8    = v13*(h + v14)
    D_xxx = 3.0d0*v7*(v11 + v14)
    L_xxx = D_xxx*M_0
    D_xxy = v8*y
    L_xxy = D_xxy*M_0
    D_xxz = v8*z
    L_xx  = D_xx*M_0 + D_xxx*M_x + D_xxy*M_y + D_xxz*M_z
    L_xxz = D_xxz*M_0
    D_xyy = v10*v7
    L_xyy = D_xyy*M_0
    D_xyz = -15.0d0*v15*v7
    L_xy  = D_xxy*M_x + D_xy*M_0 + D_xyy*M_y + D_xyz*M_z
    L_xyz = D_xyz*M_0
    D_xzz = -(D_xxx + D_xyy)
    L_x   = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxy*M_xy + D_xxz*M_xz + D_xy*M_y + &
      D_xyy*M_yy + D_xyz*M_yz + D_xz*M_z + D_xzz*M_zz
    L_xz  = D_xxz*M_x + D_xyz*M_y + D_xz*M_0 + D_xzz*M_z
    D_yyy = -v13*y*(5.0d0*v1 - v9)
    L_yyy = D_yyy*M_0
    D_yyz = v10*v6*z
    L_yy  = D_xyy*M_x + D_yy*M_0 + D_yyy*M_y + D_yyz*M_z
    L_yyz = D_yyz*M_0
    D_yzz = -(D_xxy + D_yyy)
    L_y   = D_xxy*M_xx + D_xy*M_x + D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyy*M_yy + D_yyz*M_yz + D_yz*M_z + D_yzz*M_zz
    L_yz  = D_xyz*M_x + D_yyz*M_y + D_yz*M_0 + D_yzz*M_z
    D_zzz = -(D_xxz + D_yyz)
    L_0   = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxy*M_xxy + D_xxz*M_xxz &
      + D_xy*M_xy + D_xyy*M_xyy + D_xyz*M_xyz + D_xz*M_xz + D_xzz*M_xzz &
      + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + D_yyz*M_yyz + D_yz*M_yz + &
      D_yzz*M_yzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz
    L_z   = D_xxz*M_xx + D_xyz*M_xy + D_xz*M_x + D_xzz*M_xz + D_yyz*M_yy + D_yz*M_y &
      + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz
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
#undef  M_zz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xxy               
#undef  L_xyy               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  M_xyz               
#undef  M_xzz               
#undef  L_yyz               
#undef  M_yyy               
#undef  M_yyz               
#undef  M_yzz               
#undef  M_zzz               
    end subroutine mom_es_M2L
    
! OPS  50*ADD + 2*DIV + 65*MUL + 4*NEG + POW = 122  (188 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v2, v3, v4,&
                v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz
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
#define L_xx                 L(4)
#define Ls_xx                Ls(4)
#define Ls_xy                Ls(5)
#define L_xy                 L(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
#define Ls_yy                Ls(7)
#define L_yy                 L(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
#define Ls_xxx               Ls(9)
#define L_xxx                L(9)
#define Ls_xxy               Ls(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define Ls_xxz               Ls(11)
#define Ls_xyy               Ls(12)
#define L_xyy                L(12)
#define L_xyz                L(13)
#define Ls_xyz               Ls(13)
#define L_yyy                L(14)
#define Ls_yyy               Ls(14)
#define Ls_yyz               Ls(15)
#define L_yyz                L(15)
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    v4     = L_xz*z
    v11    = v1*y
    v13    = L_yz*z
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
    v12    = L_xz + L_xyz*y + L_xzz*z
    Ls_xz  = L_xxz*x + v12
    L_yzz  = -(L_xxy + L_yyy)
    v16    = L_yz + L_yzz*z
    Ls_yz  = v16 + L_xyz*x + L_yyz*y
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v5     = a2
    v6     = 0.5d0*v5
    a3     = a1*a2
    b2     = b1*b1
    v7     = b2
    v8     = L_xyy*v7
    v14    = 0.5d0*v7
    b3     = b1*b2
    c2     = c1*c1
    v9     = c2
    v17    = 0.5d0*v9
    v10    = L_xzz*v9
    Ls_x   = 0.5d0*(v10 + v8) + L_x + L_xxx*v6 + v0*x + v11 + v4
    v15    = L_yzz*v9
    Ls_y   = 0.5d0*v15 + L_xxy*v6 + L_y + L_yyy*v14 + v13 + v2*x + v3*y
    Ls_z   = L_z + L_xxz*v6 + L_yyz*v14 + L_zz*z + L_zzz*v17 + v12*x + v16*y
    h      = v5 + v7 + v9
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    c3     = c1*c2
    Ls_0   = 0.166666666666667d0*(L_xxx*a3 + L_yyy*b3 + L_zzz*c3 + 3.0d0*(x*(2.0d0* &
      L_x + v10 + 2.0d0*v11 + 2.0d0*v4 + v8) + y*(2.0d0*L_y + 2.0d0*v13 &
      + v15))) + L_0 + L_z*z + L_zz*v17 + v0*v6 + v14*v3
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
    
! OPS  50*ADD + 2*DIV + 65*MUL + 5*NEG + POW = 123  (189 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v2, v3, v4,&
                v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz
#define Phi_0                Phi(0)
#define x                    r(1)
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define Phi_x                Phi(1)
#define L_x                  L(1)
#define Phi_y                Phi(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Phi_z                Phi(3)
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
#define L_xxx                L(9)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define L_xyy                L(12)
#define L_xyz                L(13)
#define L_yyy                L(14)
#define L_yyz                L(15)
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    v4     = L_xz*z
    v11    = v1*y
    v13    = L_yz*z
    Phi_xx = L_xxx*x + v0
    Phi_xy = L_xxy*x + v2
    Phi_yy = v3 + L_xyy*x + L_yyy*y
    Phi_zz = -(Phi_xx + Phi_yy)
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    v12    = L_xz + L_xyz*y + L_xzz*z
    Phi_xz = L_xxz*x + v12
    L_yzz  = -(L_xxy + L_yyy)
    v16    = L_yz + L_yzz*z
    Phi_yz = v16 + L_xyz*x + L_yyz*y
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v5     = a2
    v6     = 0.5d0*v5
    a3     = a1*a2
    b2     = b1*b1
    v7     = b2
    v8     = L_xyy*v7
    v14    = 0.5d0*v7
    b3     = b1*b2
    c2     = c1*c1
    v9     = c2
    v17    = 0.5d0*v9
    v10    = L_xzz*v9
    Phi_x  = 0.5d0*(v10 + v8) + L_x + L_xxx*v6 + v0*x + v11 + v4
    v15    = L_yzz*v9
    Phi_y  = 0.5d0*v15 + L_xxy*v6 + L_y + L_yyy*v14 + v13 + v2*x + v3*y
    Phi_z  = L_z + L_xxz*v6 + L_yyz*v14 + L_zz*z + L_zzz*v17 + v12*x + v16*y
    h      = v5 + v7 + v9
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    c3     = c1*c2
    Phi_0  = 0.166666666666667d0*(L_xxx*a3 + L_yyy*b3 + L_zzz*c3 + 3.0d0*(x*(2.0d0* &
      L_x + v10 + 2.0d0*v11 + 2.0d0*v4 + v8) + y*(2.0d0*L_y + 2.0d0*v13 &
      + v15))) + L_0 + L_z*z + L_zz*v17 + v0*v6 + v14*v3
#undef  Phi_0               
#undef  x                   
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  Phi_x               
#undef  L_x                 
#undef  Phi_y               
#undef  L_y                 
#undef  L_z                 
#undef  Phi_z               
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
#undef  L_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  L_yyz               
    end subroutine mom_es_L2P
    
! OPS  60*ADD + 2*DIV + 74*MUL + POW = 137  (203 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v2,&
                v3, v4, v5, v6, v7, v8, v9, h, u
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
#define Ms_zz                Ms(9)
#define M_zz                 M(9)
#define M_xxx                M(10)
#define Ms_xxx               Ms(10)
#define M_xxy                M(11)
#define Ms_xxy               Ms(11)
#define Ms_xxz               Ms(12)
#define M_xxz                M(12)
#define M_xyy                M(13)
#define Ms_xyy               Ms(13)
#define M_xyz                M(14)
#define Ms_xyz               Ms(14)
#define M_xzz                M(15)
#define Ms_xzz               Ms(15)
#define Ms_yyy               Ms(16)
#define M_yyy                M(16)
#define Ms_yyz               Ms(17)
#define M_yyz                M(17)
#define M_yzz                M(18)
#define Ms_yzz               Ms(18)
#define M_zzz                M(19)
#define Ms_zzz               Ms(19)
    v0     = M_0*x
    v1     = M_x + v0
    v2     = M_0*y
    v3     = M_y + v2
    v4     = M_0*z + M_z
    v5     = M_x*x
    v6     = 0.5d0*M_0
    v8     = M_x*y
    v9     = M_y*x
    v10    = v0*y
    v11    = M_z*x
    v12    = M_y*y
    v14    = M_z*y
    v16    = 0.166666666666667d0*M_0
    Ms_0   = Ms_0 + (M_0)
    Ms_x   = Ms_x + (v1)
    Ms_y   = Ms_y + (v3)
    Ms_z   = Ms_z + (v4)
    Ms_xy  = Ms_xy + (M_xy + v10 + v8 + v9)
    Ms_xz  = Ms_xz + (M_xz + v11 + M_x*z + v0*z)
    Ms_yz  = Ms_yz + (M_yz + v14 + M_y*z + v2*z)
    Ms_xyz = Ms_xyz + (M_xyz + M_xy*z + M_xz*y + M_yz*x + v10*z + v11*y + v8*z + v9*z)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v7     = a2
    v17    = 0.5d0*v7
    Ms_xx  = Ms_xx + (v6*v7 + M_xx + v5)
    Ms_xxy = Ms_xxy + (M_xxy + M_xx*y + M_xy*x + v17*v3 + v5*y)
    Ms_xxz = Ms_xxz + (M_xxz + M_xx*z + M_xz*x + v17*v4 + v5*z)
    a3     = a1*a2
    Ms_xxx = Ms_xxx + (M_xxx + M_x*v17 + M_xx*x + a3*v16)
    b2     = b1*b1
    v13    = b2
    v18    = 0.5d0*v13
    Ms_yy  = Ms_yy + (v13*v6 + M_yy + v12)
    Ms_xyy = Ms_xyy + (M_xyy + M_xy*y + M_yy*x + v1*v18 + v9*y)
    Ms_yyz = Ms_yyz + (M_yyz + M_yy*z + M_yz*y + v12*z + v18*v4)
    b3     = b1*b2
    Ms_yyy = Ms_yyy + (M_yyy + M_y*v18 + M_yy*y + b3*v16)
    c2     = c1*c1
    v15    = c2
    v19    = 0.5d0*v15
    Ms_zz  = Ms_zz + (M_zz + M_z*z + v15*v6)
    Ms_xzz = Ms_xzz + (M_xzz + M_xz*z + M_zz*x + v1*v19 + v11*z)
    Ms_yzz = Ms_yzz + (M_yzz + M_yz*z + M_zz*y + v14*z + v19*v3)
    h      = v13 + v15 + v7
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    c3     = c1*c2
    Ms_zzz = Ms_zzz + (M_zzz + M_z*v19 + M_zz*z + c3*v16)
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
#undef  Ms_zz               
#undef  M_zz                
#undef  M_xxx               
#undef  Ms_xxx              
#undef  M_xxy               
#undef  Ms_xxy              
#undef  Ms_xxz              
#undef  M_xxz               
#undef  M_xyy               
#undef  Ms_xyy              
#undef  M_xyz               
#undef  Ms_xyz              
#undef  M_xzz               
#undef  Ms_xzz              
#undef  Ms_yyy              
#undef  M_yyy               
#undef  Ms_yyz              
#undef  M_yyz               
#undef  M_yzz               
#undef  Ms_yzz              
#undef  M_zzz               
#undef  Ms_zzz              
    end subroutine mom_es_M2M_add
    
! OPS  67*ADD + 2*DIV + 118*MUL + 11*NEG + POW + 2*SUB = 201  (264 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v2, v3, v4, v5, v6, v7,&
                v8, v9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy,&
                D_yyz, D_yzz, D_zzz
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
#define M_zz                 M(9)
#define L_xxx                L(9)
#define M_xxx                M(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define M_xxy                M(11)
#define L_xyy                L(12)
#define M_xxz                M(12)
#define M_xyy                M(13)
#define L_xyz                L(13)
#define L_yyy                L(14)
#define M_xyz                M(14)
#define M_xzz                M(15)
#define L_yyz                L(15)
#define M_yyy                M(16)
#define M_yyz                M(17)
#define M_yzz                M(18)
#define M_zzz                M(19)
    v15   = y*z
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v14   = -5.0d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v11   = 3.0d0*h
    v4    = -h
    v9    = v11
    v10   = -15.0d0*v1 + v9
    u2    = 1.0/h
    u     = sqrt(u2)
    D_0   = u
    u3    = u*u2
    v2    = u3
    D_x   = -v2*x
    D_y   = -v2*y
    D_z   = -v2*z
    u4    = u2*u2
    u5    = u2*u3
    v3    = u5
    v12   = 3.0d0*v3
    v5    = v12*x
    D_xx  = v3*(3.0d0*v0 + v4)
    D_xy  = v5*y
    D_xz  = v5*z
    D_yy  = v3*(3.0d0*v1 + v4)
    D_yz  = v12*v15
    D_zz  = -(D_xx + D_yy)
    u6    = u3*u3
    u7    = u3*u4
    v6    = u7
    v13   = 3.0d0*v6
    v7    = v6*x
    v8    = v13*(h + v14)
    D_xxx = 3.0d0*v7*(v11 + v14)
    L_xxx = L_xxx + (D_xxx*M_0)
    D_xxy = v8*y
    L_xxy = L_xxy + (D_xxy*M_0)
    D_xxz = v8*z
    L_xx  = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxy*M_y + D_xxz*M_z)
    L_xxz = L_xxz + (D_xxz*M_0)
    D_xyy = v10*v7
    L_xyy = L_xyy + (D_xyy*M_0)
    D_xyz = -15.0d0*v15*v7
    L_xy  = L_xy + (D_xxy*M_x + D_xy*M_0 + D_xyy*M_y + D_xyz*M_z)
    L_xyz = L_xyz + (D_xyz*M_0)
    D_xzz = -(D_xxx + D_xyy)
    L_x   = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxy*M_xy + D_xxz*M_xz + D_xy*M_y + &
      D_xyy*M_yy + D_xyz*M_yz + D_xz*M_z + D_xzz*M_zz)
    L_xz  = L_xz + (D_xxz*M_x + D_xyz*M_y + D_xz*M_0 + D_xzz*M_z)
    D_yyy = -v13*y*(5.0d0*v1 - v9)
    L_yyy = L_yyy + (D_yyy*M_0)
    D_yyz = v10*v6*z
    L_yy  = L_yy + (D_xyy*M_x + D_yy*M_0 + D_yyy*M_y + D_yyz*M_z)
    L_yyz = L_yyz + (D_yyz*M_0)
    D_yzz = -(D_xxy + D_yyy)
    L_y   = L_y + (D_xxy*M_xx + D_xy*M_x + D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyy*M_yy + D_yyz*M_yz + D_yz*M_z + D_yzz*M_zz)
    L_yz  = L_yz + (D_xyz*M_x + D_yyz*M_y + D_yz*M_0 + D_yzz*M_z)
    D_zzz = -(D_xxz + D_yyz)
    L_0   = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxy*M_xxy + D_xxz*M_xxz &
      + D_xy*M_xy + D_xyy*M_xyy + D_xyz*M_xyz + D_xz*M_xz + D_xzz*M_xzz &
      + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + D_yyz*M_yyz + D_yz*M_yz + &
      D_yzz*M_yzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz)
    L_z   = L_z + (D_xxz*M_xx + D_xyz*M_xy + D_xz*M_x + D_xzz*M_xz + D_yyz*M_yy + D_yz*M_y &
      + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz)
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
#undef  M_zz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xxy               
#undef  L_xyy               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  M_xyz               
#undef  M_xzz               
#undef  L_yyz               
#undef  M_yyy               
#undef  M_yyz               
#undef  M_yzz               
#undef  M_zzz               
    end subroutine mom_es_M2L_add
    
! OPS  50*ADD + 2*DIV + 65*MUL + 4*NEG + POW = 122  (188 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v2, v3, v4,&
                v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz
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
#define L_xx                 L(4)
#define Ls_xx                Ls(4)
#define Ls_xy                Ls(5)
#define L_xy                 L(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
#define Ls_yy                Ls(7)
#define L_yy                 L(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
#define Ls_xxx               Ls(9)
#define L_xxx                L(9)
#define Ls_xxy               Ls(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define Ls_xxz               Ls(11)
#define Ls_xyy               Ls(12)
#define L_xyy                L(12)
#define L_xyz                L(13)
#define Ls_xyz               Ls(13)
#define L_yyy                L(14)
#define Ls_yyy               Ls(14)
#define Ls_yyz               Ls(15)
#define L_yyz                L(15)
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    v4     = L_xz*z
    v11    = v1*y
    v13    = L_yz*z
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
    v12    = L_xz + L_xyz*y + L_xzz*z
    Ls_xz  = Ls_xz + (L_xxz*x + v12)
    L_yzz  = -(L_xxy + L_yyy)
    v16    = L_yz + L_yzz*z
    Ls_yz  = Ls_yz + (v16 + L_xyz*x + L_yyz*y)
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v5     = a2
    v6     = 0.5d0*v5
    a3     = a1*a2
    b2     = b1*b1
    v7     = b2
    v8     = L_xyy*v7
    v14    = 0.5d0*v7
    b3     = b1*b2
    c2     = c1*c1
    v9     = c2
    v17    = 0.5d0*v9
    v10    = L_xzz*v9
    Ls_x   = Ls_x + (0.5d0*(v10 + v8) + L_x + L_xxx*v6 + v0*x + v11 + v4)
    v15    = L_yzz*v9
    Ls_y   = Ls_y + (0.5d0*v15 + L_xxy*v6 + L_y + L_yyy*v14 + v13 + v2*x + v3*y)
    Ls_z   = Ls_z + (L_z + L_xxz*v6 + L_yyz*v14 + L_zz*z + L_zzz*v17 + v12*x + v16*y)
    h      = v5 + v7 + v9
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    c3     = c1*c2
    Ls_0   = Ls_0 + (0.166666666666667d0*(L_xxx*a3 + L_yyy*b3 + L_zzz*c3 + 3.0d0*(x*(2.0d0* &
      L_x + v10 + 2.0d0*v11 + 2.0d0*v4 + v8) + y*(2.0d0*L_y + 2.0d0*v13 &
      + v15))) + L_0 + L_z*z + L_zz*v17 + v0*v6 + v14*v3)
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
    
! OPS  67*ADD + 2*DIV + 118*MUL + 11*NEG + POW + 2*SUB = 201  (264 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v2, v3, v4, v5, v6, v7,&
                v8, v9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy,&
                D_yyz, D_yzz, D_zzz
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
#define M_zz                 M(1:2,9)
#define L_xxx                L(1:2,9)
#define M_xxx                M(1:2,10)
#define L_xxy                L(1:2,10)
#define L_xxz                L(1:2,11)
#define M_xxy                M(1:2,11)
#define L_xyy                L(1:2,12)
#define M_xxz                M(1:2,12)
#define M_xyy                M(1:2,13)
#define L_xyz                L(1:2,13)
#define L_yyy                L(1:2,14)
#define M_xyz                M(1:2,14)
#define M_xzz                M(1:2,15)
#define L_yyz                L(1:2,15)
#define M_yyy                M(1:2,16)
#define M_yyz                M(1:2,17)
#define M_yzz                M(1:2,18)
#define M_zzz                M(1:2,19)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v15   = y*z
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v0    = a2
    v14   = -5.0d0*v0
    a3    = a1*a2
    b2    = b1*b1
    v1    = b2
    b3    = b1*b2
    c2    = c1*c1
    h     = c2 + v0 + v1
    v11   = 3.0d0*h
    v4    = -h
    v9    = v11
    v10   = -15.0d0*v1 + v9
    u2    = 1.0/h
    u     = sqrt(u2)
    D_0   = u
    u3    = u*u2
    v2    = u3
    D_x   = -v2*x
    D_y   = -v2*y
    D_z   = -v2*z
    u4    = u2*u2
    u5    = u2*u3
    v3    = u5
    v12   = 3.0d0*v3
    v5    = v12*x
    D_xx  = v3*(3.0d0*v0 + v4)
    D_xy  = v5*y
    D_xz  = v5*z
    D_yy  = v3*(3.0d0*v1 + v4)
    D_yz  = v12*v15
    D_zz  = -(D_xx + D_yy)
    u6    = u3*u3
    u7    = u3*u4
    v6    = u7
    v13   = 3.0d0*v6
    v7    = v6*x
    v8    = v13*(h + v14)
    D_xxx = 3.0d0*v7*(v11 + v14)
    L_xxx = D_xxx*M_0
    D_xxy = v8*y
    L_xxy = D_xxy*M_0
    D_xxz = v8*z
    L_xx  = D_xx*M_0 + D_xxx*M_x + D_xxy*M_y + D_xxz*M_z
    L_xxz = D_xxz*M_0
    D_xyy = v10*v7
    L_xyy = D_xyy*M_0
    D_xyz = -15.0d0*v15*v7
    L_xy  = D_xxy*M_x + D_xy*M_0 + D_xyy*M_y + D_xyz*M_z
    L_xyz = D_xyz*M_0
    D_xzz = -(D_xxx + D_xyy)
    L_x   = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxy*M_xy + D_xxz*M_xz + D_xy*M_y + &
      D_xyy*M_yy + D_xyz*M_yz + D_xz*M_z + D_xzz*M_zz
    L_xz  = D_xxz*M_x + D_xyz*M_y + D_xz*M_0 + D_xzz*M_z
    D_yyy = -v13*y*(5.0d0*v1 - v9)
    L_yyy = D_yyy*M_0
    D_yyz = v10*v6*z
    L_yy  = D_xyy*M_x + D_yy*M_0 + D_yyy*M_y + D_yyz*M_z
    L_yyz = D_yyz*M_0
    D_yzz = -(D_xxy + D_yyy)
    L_y   = D_xxy*M_xx + D_xy*M_x + D_xyy*M_xy + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + &
      D_yyy*M_yy + D_yyz*M_yz + D_yz*M_z + D_yzz*M_zz
    L_yz  = D_xyz*M_x + D_yyz*M_y + D_yz*M_0 + D_yzz*M_z
    D_zzz = -(D_xxz + D_yyz)
    L_0   = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxy*M_xxy + D_xxz*M_xxz &
      + D_xy*M_xy + D_xyy*M_xyy + D_xyz*M_xyz + D_xz*M_xz + D_xzz*M_xzz &
      + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + D_yyz*M_yyz + D_yz*M_yz + &
      D_yzz*M_yzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz
    L_z   = D_xxz*M_xx + D_xyz*M_xy + D_xz*M_x + D_xzz*M_xz + D_yyz*M_yy + D_yz*M_y &
      + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz
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
#undef  M_zz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xxy               
#undef  L_xyy               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  M_xyz               
#undef  M_xzz               
#undef  L_yyz               
#undef  M_yyy               
#undef  M_yyz               
#undef  M_yzz               
#undef  M_zzz               
    end subroutine mom_es_M2L2
    
! OPS  50*ADD + 2*DIV + 65*MUL + 5*NEG + POW = 123  (189 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v2, v3, v4,&
                v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz
#define Phi_0                Phi(1:2,0)
#define x                    r(1:2,1)
#define y                    r(1:2,2)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define Phi_x                Phi(1:2,1)
#define L_x                  L(1:2,1)
#define Phi_y                Phi(1:2,2)
#define L_y                  L(1:2,2)
#define L_z                  L(1:2,3)
#define Phi_z                Phi(1:2,3)
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
#define L_xxx                L(1:2,9)
#define L_xxy                L(1:2,10)
#define L_xxz                L(1:2,11)
#define L_xyy                L(1:2,12)
#define L_xyz                L(1:2,13)
#define L_yyy                L(1:2,14)
#define L_yyz                L(1:2,15)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    v4     = L_xz*z
    v11    = v1*y
    v13    = L_yz*z
    Phi_xx = L_xxx*x + v0
    Phi_xy = L_xxy*x + v2
    Phi_yy = v3 + L_xyy*x + L_yyy*y
    Phi_zz = -(Phi_xx + Phi_yy)
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    v12    = L_xz + L_xyz*y + L_xzz*z
    Phi_xz = L_xxz*x + v12
    L_yzz  = -(L_xxy + L_yyy)
    v16    = L_yz + L_yzz*z
    Phi_yz = v16 + L_xyz*x + L_yyz*y
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v5     = a2
    v6     = 0.5d0*v5
    a3     = a1*a2
    b2     = b1*b1
    v7     = b2
    v8     = L_xyy*v7
    v14    = 0.5d0*v7
    b3     = b1*b2
    c2     = c1*c1
    v9     = c2
    v17    = 0.5d0*v9
    v10    = L_xzz*v9
    Phi_x  = 0.5d0*(v10 + v8) + L_x + L_xxx*v6 + v0*x + v11 + v4
    v15    = L_yzz*v9
    Phi_y  = 0.5d0*v15 + L_xxy*v6 + L_y + L_yyy*v14 + v13 + v2*x + v3*y
    Phi_z  = L_z + L_xxz*v6 + L_yyz*v14 + L_zz*z + L_zzz*v17 + v12*x + v16*y
    h      = v5 + v7 + v9
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    c3     = c1*c2
    Phi_0  = 0.166666666666667d0*(L_xxx*a3 + L_yyy*b3 + L_zzz*c3 + 3.0d0*(x*(2.0d0* &
      L_x + v10 + 2.0d0*v11 + 2.0d0*v4 + v8) + y*(2.0d0*L_y + 2.0d0*v13 &
      + v15))) + L_0 + L_z*z + L_zz*v17 + v0*v6 + v14*v3
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
#undef  L_z                 
#undef  Phi_z               
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
#undef  L_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  L_xyz               
#undef  L_yyy               
#undef  L_yyz               
    end subroutine mom_es_L2P2
    
! OPS  50*ADD + 2*DIV + 65*MUL + 4*NEG + POW = 122  (188 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, b1, b2, b3, c1, c2, c3, u2, u3, u4, u5, u6, u7,&
                v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v2, v3, v4,&
                v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz
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
#define L_xx                 L(1:2,4)
#define Ls_xx                Ls(1:2,4)
#define Ls_xy                Ls(1:2,5)
#define L_xy                 L(1:2,5)
#define L_xz                 L(1:2,6)
#define Ls_xz                Ls(1:2,6)
#define Ls_yy                Ls(1:2,7)
#define L_yy                 L(1:2,7)
#define Ls_yz                Ls(1:2,8)
#define L_yz                 L(1:2,8)
#define Ls_xxx               Ls(1:2,9)
#define L_xxx                L(1:2,9)
#define Ls_xxy               Ls(1:2,10)
#define L_xxy                L(1:2,10)
#define L_xxz                L(1:2,11)
#define Ls_xxz               Ls(1:2,11)
#define Ls_xyy               Ls(1:2,12)
#define L_xyy                L(1:2,12)
#define L_xyz                L(1:2,13)
#define Ls_xyz               Ls(1:2,13)
#define L_yyy                L(1:2,14)
#define Ls_yyy               Ls(1:2,14)
#define Ls_yyz               Ls(1:2,15)
#define L_yyz                L(1:2,15)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0     = L_xx + L_xxy*y + L_xxz*z
    v1     = L_xy + L_xyz*z
    v2     = L_xyy*y + v1
    v3     = L_yy + L_yyz*z
    v4     = L_xz*z
    v11    = v1*y
    v13    = L_yz*z
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
    v12    = L_xz + L_xyz*y + L_xzz*z
    Ls_xz  = L_xxz*x + v12
    L_yzz  = -(L_xxy + L_yyy)
    v16    = L_yz + L_yzz*z
    Ls_yz  = v16 + L_xyz*x + L_yyz*y
    L_zzz  = -(L_xxz + L_yyz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v5     = a2
    v6     = 0.5d0*v5
    a3     = a1*a2
    b2     = b1*b1
    v7     = b2
    v8     = L_xyy*v7
    v14    = 0.5d0*v7
    b3     = b1*b2
    c2     = c1*c1
    v9     = c2
    v17    = 0.5d0*v9
    v10    = L_xzz*v9
    Ls_x   = 0.5d0*(v10 + v8) + L_x + L_xxx*v6 + v0*x + v11 + v4
    v15    = L_yzz*v9
    Ls_y   = 0.5d0*v15 + L_xxy*v6 + L_y + L_yyy*v14 + v13 + v2*x + v3*y
    Ls_z   = L_z + L_xxz*v6 + L_yyz*v14 + L_zz*z + L_zzz*v17 + v12*x + v16*y
    h      = v5 + v7 + v9
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    c3     = c1*c2
    Ls_0   = 0.166666666666667d0*(L_xxx*a3 + L_yyy*b3 + L_zzz*c3 + 3.0d0*(x*(2.0d0* &
      L_x + v10 + 2.0d0*v11 + 2.0d0*v4 + v8) + y*(2.0d0*L_y + 2.0d0*v13 &
      + v15))) + L_0 + L_z*z + L_zz*v17 + v0*v6 + v14*v3
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
