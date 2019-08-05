!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-04 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom4
use types
implicit none
#if FMM_EXPANSION_ORDER==4
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
        
    
! OPS  8*ADD + 25*MUL + 3*NEG = 36  (85 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v2, v3, v4, v5, v6, v7, v8,&
                v9, h, u
#define z                    r(3)
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define M_xx                 M(1)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define M_yy                 M(4)
#define M_yz                 M(5)
#define M_xxx                M(6)
#define M_xxy                M(7)
#define M_xxz                M(8)
#define M_xyy                M(9)
#define M_xyz                M(10)
#define M_yyy                M(11)
#define M_yyz                M(12)
    v0    = W*x
    v1    = v0*y
    v2    = W*y
    v9    = W*z
    M_0   = W
    M_xy  = v1
    M_xz  = v0*z
    M_yz  = v2*z
    M_xyz = v1*z
    c1    = z
    b1    = y
    a1    = x
    a2    = a1*a1
    v3    = a2
    a3    = a1*a2
    a4    = a2*a2
    b2    = b1*b1
    v4    = b2
    b3    = b1*b2
    b4    = b2*b2
    c2    = c1*c1
    h     = c2 + v3 + v4
    v5    = -0.333333333333333d0*h
    v6    = -0.6d0*h
    v7    = -0.2d0*h
    v8    = v3 + v7
    v10   = v4 + v7
    M_xx  = W*(v3 + v5)
    M_yy  = W*(v4 + v5)
    M_xxx = v0*(v3 + v6)
    M_xxy = v2*v8
    M_xxz = v8*v9
    M_xyy = v0*v10
    M_yyy = v2*(v4 + v6)
    M_yyz = v10*v9
#undef  z                   
#undef  x                   
#undef  y                   
#undef  M_0                 
#undef  M_xx                
#undef  M_xy                
#undef  M_xz                
#undef  M_yy                
#undef  M_yz                
#undef  M_xxx               
#undef  M_xxy               
#undef  M_xxz               
#undef  M_xyy               
#undef  M_xyz               
#undef  M_yyy               
#undef  M_yyz               
    end subroutine mom_es_P2M
    
! OPS  39*ADD + 71*MUL + 11*NEG + 6*SUB = 127  (181 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v2, v3, v4, v5, v6, v7, v8, v9, h, u, M_zz, M_xzz, M_yzz,&
                M_zzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz,&
                S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_yyy, S_yyz
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define z                    r(3)
#define Ms_0                 Ms(0)
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
#define M_xxx                M(6)
#define Ms_xxx               Ms(6)
#define M_xxy                M(7)
#define Ms_xxy               Ms(7)
#define Ms_xxz               Ms(8)
#define M_xxz                M(8)
#define M_xyy                M(9)
#define Ms_xyy               Ms(9)
#define M_xyz                M(10)
#define Ms_xyz               Ms(10)
#define Ms_yyy               Ms(11)
#define M_yyy                M(11)
#define Ms_yyz               Ms(12)
#define M_yyz                M(12)
    v0     = x*y
    v5     = M_xx*x
    v6     = M_xy*y
    v7     = M_xz*z
    v10    = M_xy*x
    v11    = M_yy*y
    v12    = M_yz*z
    v13    = M_xx*z
    v14    = M_xz*x
    v15    = M_yy*z
    v16    = M_yz*y
    Ms_0   = M_0
    M_zz   = -(M_xx + M_yy)
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    S_0    = 1
    S_x    = x
    S_y    = y
    S_z    = z
    S_xy   = v0
    Ms_xy  = M_0*S_xy + M_xy
    S_xz   = x*z
    Ms_xz  = M_0*S_xz + M_xz
    S_yz   = y*z
    Ms_yz  = M_0*S_yz + M_yz
    S_xyz  = v0*z
    Ms_xyz = M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v1     = a2
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v2     = b2
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v1 + v2
    v3     = -0.333333333333333d0*h
    v4     = -0.6d0*h
    v8     = -0.2d0*h
    v9     = v1 + v8
    v17    = v2 + v8
    S_xx   = v1 + v3
    Ms_xx  = M_0*S_xx + M_xx
    S_yy   = v2 + v3
    Ms_yy  = M_0*S_yy + M_yy
    S_xxx  = x*(v1 + v4)
    Ms_xxx = 0.2d0*(9.0d0*v5 + 3.0d0*(-2.0d0*v6 - 2.0d0*v7)) + M_0*S_xxx + M_xxx
    S_xxy  = v9*y
    Ms_xxy = 0.2d0*(8.0d0*v10 + 2.0d0*(-v11 - v12)) + M_0*S_xxy + M_xx*y + M_xxy
    S_xxz  = v9*z
    Ms_xxz = M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v13 + 8.0d0*v14 + 2.0d0*(v15 - v16))
    S_xyy  = v17*x
    Ms_xyy = 0.2d0*(8.0d0*v6 + 2.0d0*(-v5 - v7)) + M_0*S_xyy + M_xyy + M_yy*x
    S_yyy  = y*(v2 + v4)
    Ms_yyy = 0.2d0*(9.0d0*v11 + 3.0d0*(-2.0d0*v10 - 2.0d0*v12)) + M_0*S_yyy + M_yyy
    S_yyz  = v17*z
    Ms_yyz = M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v15 + 8.0d0*v16 + 2.0d0*(v13 - v14))
#undef  x                   
#undef  y                   
#undef  M_0                 
#undef  z                   
#undef  Ms_0                
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
#undef  Ms_yyy              
#undef  M_yyy               
#undef  Ms_yyz              
#undef  M_yyz               
    end subroutine mom_es_M2M
    
! OPS  90*ADD + 2*DIV + 190*MUL + 22*NEG + POW + 7*SUB = 312  (463 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v5, v6, v7, v8,&
                v9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz,&
                D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz,&
                D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, M_zz, M_xzz, M_yzz, M_zzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define L_xx                 L(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define M_xxz                M(8)
#define L_xxx                L(8)
#define M_xyy                M(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define M_xyz                M(10)
#define L_xyy                L(11)
#define M_yyy                M(11)
#define L_xyz                L(12)
#define M_yyz                M(12)
#define L_yyy                L(13)
#define L_yyz                L(14)
#define L_xxxx               L(15)
#define L_xxxy               L(16)
#define L_xxxz               L(17)
#define L_xxyy               L(18)
#define L_xxyz               L(19)
#define L_xyyy               L(20)
#define L_xyyz               L(21)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
    v46    = y*z
    v45    = 15.0d0*v46
    v24    = 0.5d0*M_xx
    v29    = 0.5d0*M_yy
    v31    = 0.166666666666667d0*M_xxx
    v32    = 0.5d0*M_xxy
    v33    = 0.5d0*M_xxz
    v34    = 0.166666666666667d0*M_yyy
    v35    = 0.5d0*M_yyz
    v38    = 0.5d0*M_xyy
    M_zz   = -(M_xx + M_yy)
    v36    = 0.5d0*M_zz
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    v39    = 0.5d0*M_yzz
    M_zzz  = -(M_xxz + M_yyz)
    v37    = 0.166666666666667d0*M_zzz
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v40    = 5.0d0*v0
    v8     = v40
    v20    = 7.0d0*v0
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v1     = b2
    v12    = 5.0d0*v1
    v27    = 7.0d0*v1
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v0 + v1
    v41    = 3.0d0*h
    v4     = -h
    v10    = v41
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v28    = v19 + v27
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    v2     = u3
    D_x    = -v2*x
    D_y    = -v2*y
    D_z    = -v2*z
    u4     = u2*u2
    u5     = u2*u3
    v3     = u5
    v42    = 3.0d0*v3
    v5     = v42*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v42*v46
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v43    = 3.0d0*v6
    v7     = v6*x
    v9     = v43*(h - v8)
    D_xxx  = -3.0d0*v7*(v40 - v41)
    L_xxx  = D_xxx*M_0
    D_xxy  = v9*y
    L_xxy  = D_xxy*M_0
    D_xxz  = v9*z
    L_xxz  = D_xxz*M_0
    D_xyy  = v11*v7
    L_xyy  = D_xyy*M_0
    D_xyz  = -v45*v7
    L_xyz  = D_xyz*M_0
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = v43*y*(v10 - v12)
    L_yyy  = D_yyy*M_0
    D_yyz  = v11*v6*z
    L_yyz  = D_yyz*M_0
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v44    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v44*y
    v22    = v44*z
    v23    = v13*v45
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = D_xxxx*M_0
    D_xxxy = v18*v21
    L_xxxy = D_xxxy*M_0
    D_xxxz = v21*v22
    L_xxxz = D_xxxz*M_0
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    v25    = 0.5d0*D_xxyy
    L_xxyy = D_xxyy*M_0
    D_xxyz = v23*(v20 + v4)
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    v26    = 0.5d0*D_xxzz
    L_xx   = D_xx*M_0 + D_xxxx*v24 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxyz*M_yz + M_yy* &
      v25 + M_zz*v26
    D_xyyy = v18*v28
    L_xyyy = D_xyyy*M_0
    D_xyyz = v22*(v27 + v4)
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    v30    = 0.5d0*D_xyzz
    L_xy   = D_xxxy*v24 + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v29 + D_xyyz* &
      M_yz + M_zz*v30
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xxx*v24 + D_xxxx*v31 + D_xxxy*v32 + D_xxxz*v33 + D_xxy*M_xy &
      + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v29 + D_xyyy*v34 + D_xyyz*v35 &
      + D_xyz*M_yz + D_xzz*v36 + D_xzzz*v37 + M_xyy*v25 + M_xzz*v26 + &
      M_yzz*v30
    L_xz   = D_xxxz*v24 + D_xxyz*M_xy + D_xxzz*M_xz + D_xyyz*v29 + D_xyzz*M_yz + D_xz &
      *M_0 + D_xzzz*v36
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = D_yyyy*M_0
    D_yyyz = v23*v28
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xxyy*v24 + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v29 + D_yyyz* &
      M_yz + D_yyzz*v36
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xxxy*v31 + D_xxy*v24 + D_xxyy*v32 + D_xxyz*v33 + D_xyy*M_xy + D_xyyy* &
      v38 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy*v29 + D_yyyy* &
      v34 + D_yyyz*v35 + D_yyz*M_yz + D_yyzz*v39 + D_yzz*v36 + D_yzzz* &
      v37 + M_xzz*v30
    L_yz   = D_xxyz*v24 + D_xyyz*M_xy + D_xyzz*M_xz + D_yyyz*v29 + D_yyzz*M_yz + D_yz &
      *M_0 + D_yzzz*v36
    D_zzzz = -(D_xxzz + D_yyzz)
    L_z    = 0.5d0*(D_xzzz*M_xzz) + D_xxxz*v31 + D_xxyz*v32 + D_xxz*v24 + D_xxzz*v33 &
      + D_xyyz*v38 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyz* &
      v34 + D_yyz*v29 + D_yyzz*v35 + D_yzz*M_yz + D_yzzz*v39 + D_z*M_0 &
      + D_zzz*v36 + D_zzzz*v37
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xxx               
#undef  M_xyy               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xyz               
#undef  L_xyy               
#undef  M_yyy               
#undef  L_xyz               
#undef  M_yyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  L_xxxx              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
    end subroutine mom_es_M2L
    
! OPS  96*ADD + 2*DIV + 118*MUL + 10*NEG + POW = 227  (383 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v4, v5,&
                v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define Ls_xx                Ls(3)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define Ls_xy                Ls(4)
#define L_xz                 L(5)
#define Ls_xz                Ls(5)
#define Ls_yy                Ls(6)
#define L_yy                 L(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define Ls_xxy               Ls(9)
#define L_xxz                L(10)
#define Ls_xxz               Ls(10)
#define L_xyy                L(11)
#define Ls_xyy               Ls(11)
#define L_xyz                L(12)
#define Ls_xyz               Ls(12)
#define L_yyy                L(13)
#define Ls_yyy               Ls(13)
#define L_yyz                L(14)
#define Ls_yyz               Ls(14)
#define Ls_xxxx              Ls(15)
#define L_xxxx               L(15)
#define Ls_xxxy              Ls(16)
#define L_xxxy               L(16)
#define Ls_xxxz              Ls(17)
#define L_xxxz               L(17)
#define L_xxyy               L(18)
#define Ls_xxyy              Ls(18)
#define L_xxyz               L(19)
#define Ls_xxyz              Ls(19)
#define L_xyyy               L(20)
#define Ls_xyyy              Ls(20)
#define L_xyyz               L(21)
#define Ls_xyyz              Ls(21)
#define Ls_yyyy              Ls(22)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define Ls_yyyz              Ls(23)
    v0      = L_xxx + L_xxxy*y + L_xxxz*z
    v1      = L_xxy + L_xxyz*z
    v2      = L_xxyy*y + v1
    v3      = L_xyy + L_xyyz*z
    v4      = L_xyyy*y + v3
    v5      = L_yyy + L_yyyz*z
    v6      = L_xxz*z
    v13     = v1*y
    v15     = L_xyz*z
    v18     = v3*y
    v26     = 0.5d0*y
    v28     = 0.5d0*x
    v33     = L_yyz*z
    Ls_xxx  = L_xxxx*x + v0
    Ls_xxy  = L_xxxy*x + v2
    Ls_xyy  = L_xxyy*x + v4
    Ls_yyy  = v5 + L_xyyy*x + L_yyyy*y
    Ls_xxxx = L_xxxx
    Ls_xxxy = L_xxxy
    Ls_xxxz = L_xxxz
    Ls_xxyy = L_xxyy
    Ls_xxyz = L_xxyz
    Ls_xyyy = L_xyyy
    Ls_xyyz = L_xyyz
    Ls_yyyy = L_yyyy
    Ls_yyyz = L_yyyz
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    v29     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v36     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    v14     = L_xxz + L_xxyz*y + L_xxzz*z
    Ls_xxz  = L_xxxz*x + v14
    L_xyzz  = -(L_xxxy + L_xyyy)
    v19     = L_xyz + L_xyzz*z
    v20     = L_xyyz*y + v19
    v32     = v19*y
    Ls_xyz  = L_xxyz*x + v20
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    v35     = L_yyz + L_yyzz*z
    Ls_yyz  = v35 + L_xyyz*x + L_yyyz*y
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v8      = 0.5d0*v7
    a3      = a1*a2
    v21     = 0.166666666666667d0*a3
    a4      = a2*a2
    b2      = b1*b1
    v9      = b2
    v10     = L_xxyy*v9
    v16     = L_xyyy*v9
    v25     = 0.5d0*v9
    v30     = L_xyyz*v9
    b3      = b1*b2
    v22     = 0.166666666666667d0*b3
    b4      = b2*b2
    c2      = c1*c1
    v11     = c2
    v23     = 0.5d0*v11
    v12     = L_xxzz*v11
    Ls_xx   = 0.5d0*(v10 + v12) + L_xx + L_xxxx*v8 + v0*x + v13 + v6
    v17     = L_xyzz*v11
    v27     = v17 + 2.0d0*(L_xy + v15)
    Ls_xy   = 0.5d0*(v16 + v17) + L_xxxy*v8 + L_xy + v15 + v18 + v2*x
    v31     = L_xzzz*v11
    Ls_xz   = 0.5d0*(v30 + v31) + L_xxxz*v8 + L_xz + v14*x + v29 + v32
    v34     = L_yyzz*v11
    Ls_yy   = 0.5d0*v34 + L_xxyy*v8 + L_yy + L_yyyy*v25 + v33 + v4*x + v5*y
    v37     = L_yzzz*v11
    Ls_yz   = 0.5d0*v37 + L_xxyz*v8 + L_yyyz*v25 + L_yz + v20*x + v35*y + v36
    h       = v11 + v7 + v9
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    u4      = u2*u2
    u5      = u2*u3
    u6      = u3*u3
    u7      = u3*u4
    u8      = u4*u4
    u9      = u4*u5
    c3      = c1*c2
    v24     = 0.166666666666667d0*c3
    Ls_x    = L_x + L_xxxx*v21 + L_xyyy*v22 + L_xz*z + L_xzz*v23 + L_xzzz*v24 + v0*v8 &
      + v25*v3 + v26*v27 + v28*(2.0d0*L_xx + v10 + v12 + 2.0d0*v13 + &
      2.0d0*v6)
    Ls_y    = L_y + L_xxxy*v21 + L_yyyy*v22 + L_yz*z + L_yzz*v23 + L_yzzz*v24 + v2*v8 &
      + v25*v5 + v26*(2.0d0*L_yy + 2.0d0*v33 + v34) + v28*(v16 + 2.0d0* &
      v18 + v27)
    Ls_z    = L_z + L_xxxz*v21 + L_yyyz*v22 + L_zz*z + L_zzz*v23 + L_zzzz*v24 + v14*v8 &
      + v25*v35 + v26*(2.0d0*L_yz + 2.0d0*v36 + v37) + v28*(2.0d0*L_xz &
      + 2.0d0*v29 + v30 + v31 + 2.0d0*v32)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  L_xy                
#undef  Ls_xy               
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
#undef  Ls_xxx              
#undef  L_xxx               
#undef  L_xxy               
#undef  Ls_xxy              
#undef  L_xxz               
#undef  Ls_xxz              
#undef  L_xyy               
#undef  Ls_xyy              
#undef  L_xyz               
#undef  Ls_xyz              
#undef  L_yyy               
#undef  Ls_yyy              
#undef  L_yyz               
#undef  Ls_yyz              
#undef  Ls_xxxx             
#undef  L_xxxx              
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  Ls_xxxz             
#undef  L_xxxz              
#undef  L_xxyy              
#undef  Ls_xxyy             
#undef  L_xxyz              
#undef  Ls_xxyz             
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
    end subroutine mom_es_L2L
    
! OPS  55*ADD + 2*DIV + 83*MUL + 10*NEG + POW = 151  (221 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v2,&
                v3, v4, v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
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
#define L_xxxx               L(15)
#define L_xxxy               L(16)
#define L_xxxz               L(17)
#define L_xxyy               L(18)
#define L_xxyz               L(19)
#define L_xyyy               L(20)
#define L_xyyz               L(21)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
    v7     = L_xyy + L_xyyz*z
    v10    = 0.5d0*y
    v11    = 2.0d0*z
    v13    = 0.5d0*x
    v14    = 2.0d0*y
    v15    = L_xxy + L_xxyz*z
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    L_yzz  = -(L_xxy + L_yyy)
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    L_xyzz = -(L_xxxy + L_xyyy)
    L_xzzz = -(L_xxxz + L_xyyz)
    L_yyzz = -(L_xxyy + L_yyyy)
    L_yzzz = -(L_xxyz + L_yyyz)
    L_zzzz = -(L_xxzz + L_yyzz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v8     = a2
    v9     = 0.5d0*v8
    a3     = a1*a2
    v0     = 0.166666666666667d0*a3
    a4     = a2*a2
    b2     = b1*b1
    v5     = b2
    v6     = 0.5d0*v5
    b3     = b1*b2
    v1     = 0.166666666666667d0*b3
    b4     = b2*b2
    c2     = c1*c1
    v2     = c2
    v3     = 0.5d0*v2
    v12    = 2.0d0*L_xy + L_xyz*v11 + L_xyzz*v2
    h      = v2 + v5 + v8
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    u8     = u4*u4
    u9     = u4*u5
    c3     = c1*c2
    v4     = 0.166666666666667d0*c3
    Phi_x  = L_x + L_xxxx*v0 + L_xyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v4 + v10*v12 + &
      v13*(2.0d0*L_xx + L_xxyy*v5 + L_xxz*v11 + L_xxzz*v2 + v14*v15) + &
      v6*v7 + v9*(L_xxx + L_xxxy*y + L_xxxz*z)
    Phi_y  = L_y + L_xxxy*v0 + L_yyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v4 + v10*(2.0d0 &
      *L_yy + L_yyz*v11 + L_yyzz*v2) + v13*(L_xyyy*v5 + v12 + v14*v7) + &
      v6*(L_yyy + L_yyyz*z) + v9*(L_xxyy*y + v15)
    Phi_z  = L_z + L_xxxz*v0 + L_yyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v4 + v10*(2.0d0 &
      *L_yz + L_yzz*v11 + L_yzzz*v2) + v13*(L_xyyz*v5 + 2.0d0*L_xz + &
      L_xzz*v11 + L_xzzz*v2 + v14*(L_xyz + L_xyzz*z)) + v6*(L_yyz + &
      L_yyzz*z) + v9*(L_xxyz*y + L_xxz + L_xxzz*z)
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
#undef  L_xxxx              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
    end subroutine mom_es_L2P
    
! OPS  39*ADD + 71*MUL + 11*NEG + 6*SUB = 127  (181 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v2, v3, v4, v5, v6, v7, v8, v9, h, u, M_zz, M_xzz, M_yzz,&
                M_zzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz,&
                S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_yyy, S_yyz
#define x                    r(1)
#define y                    r(2)
#define M_0                  M(0)
#define z                    r(3)
#define Ms_0                 Ms(0)
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
#define M_xxx                M(6)
#define Ms_xxx               Ms(6)
#define M_xxy                M(7)
#define Ms_xxy               Ms(7)
#define Ms_xxz               Ms(8)
#define M_xxz                M(8)
#define M_xyy                M(9)
#define Ms_xyy               Ms(9)
#define M_xyz                M(10)
#define Ms_xyz               Ms(10)
#define Ms_yyy               Ms(11)
#define M_yyy                M(11)
#define Ms_yyz               Ms(12)
#define M_yyz                M(12)
    v0     = x*y
    v5     = M_xx*x
    v6     = M_xy*y
    v7     = M_xz*z
    v10    = M_xy*x
    v11    = M_yy*y
    v12    = M_yz*z
    v13    = M_xx*z
    v14    = M_xz*x
    v15    = M_yy*z
    v16    = M_yz*y
    Ms_0   = Ms_0 + (M_0)
    M_zz   = -(M_xx + M_yy)
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    S_0    = 1
    S_x    = x
    S_y    = y
    S_z    = z
    S_xy   = v0
    Ms_xy  = Ms_xy + (M_0*S_xy + M_xy)
    S_xz   = x*z
    Ms_xz  = Ms_xz + (M_0*S_xz + M_xz)
    S_yz   = y*z
    Ms_yz  = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz  = v0*z
    Ms_xyz = Ms_xyz + (M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v1     = a2
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v2     = b2
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v1 + v2
    v3     = -0.333333333333333d0*h
    v4     = -0.6d0*h
    v8     = -0.2d0*h
    v9     = v1 + v8
    v17    = v2 + v8
    S_xx   = v1 + v3
    Ms_xx  = Ms_xx + (M_0*S_xx + M_xx)
    S_yy   = v2 + v3
    Ms_yy  = Ms_yy + (M_0*S_yy + M_yy)
    S_xxx  = x*(v1 + v4)
    Ms_xxx = Ms_xxx + (0.2d0*(9.0d0*v5 + 3.0d0*(-2.0d0*v6 - 2.0d0*v7)) + M_0*S_xxx + M_xxx)
    S_xxy  = v9*y
    Ms_xxy = Ms_xxy + (0.2d0*(8.0d0*v10 + 2.0d0*(-v11 - v12)) + M_0*S_xxy + M_xx*y + M_xxy)
    S_xxz  = v9*z
    Ms_xxz = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v13 + 8.0d0*v14 + 2.0d0*(v15 - v16)))
    S_xyy  = v17*x
    Ms_xyy = Ms_xyy + (0.2d0*(8.0d0*v6 + 2.0d0*(-v5 - v7)) + M_0*S_xyy + M_xyy + M_yy*x)
    S_yyy  = y*(v2 + v4)
    Ms_yyy = Ms_yyy + (0.2d0*(9.0d0*v11 + 3.0d0*(-2.0d0*v10 - 2.0d0*v12)) + M_0*S_yyy + M_yyy)
    S_yyz  = v17*z
    Ms_yyz = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v15 + 8.0d0*v16 + 2.0d0*(v13 - v14)))
#undef  x                   
#undef  y                   
#undef  M_0                 
#undef  z                   
#undef  Ms_0                
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
#undef  Ms_yyy              
#undef  M_yyy               
#undef  Ms_yyz              
#undef  M_yyz               
    end subroutine mom_es_M2M_add
    
! OPS  90*ADD + 2*DIV + 190*MUL + 22*NEG + POW + 7*SUB = 312  (463 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v5, v6, v7, v8,&
                v9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz,&
                D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz,&
                D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, M_zz, M_xzz, M_yzz, M_zzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define L_xx                 L(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define M_xxz                M(8)
#define L_xxx                L(8)
#define M_xyy                M(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define M_xyz                M(10)
#define L_xyy                L(11)
#define M_yyy                M(11)
#define L_xyz                L(12)
#define M_yyz                M(12)
#define L_yyy                L(13)
#define L_yyz                L(14)
#define L_xxxx               L(15)
#define L_xxxy               L(16)
#define L_xxxz               L(17)
#define L_xxyy               L(18)
#define L_xxyz               L(19)
#define L_xyyy               L(20)
#define L_xyyz               L(21)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
    v46    = y*z
    v45    = 15.0d0*v46
    v24    = 0.5d0*M_xx
    v29    = 0.5d0*M_yy
    v31    = 0.166666666666667d0*M_xxx
    v32    = 0.5d0*M_xxy
    v33    = 0.5d0*M_xxz
    v34    = 0.166666666666667d0*M_yyy
    v35    = 0.5d0*M_yyz
    v38    = 0.5d0*M_xyy
    M_zz   = -(M_xx + M_yy)
    v36    = 0.5d0*M_zz
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    v39    = 0.5d0*M_yzz
    M_zzz  = -(M_xxz + M_yyz)
    v37    = 0.166666666666667d0*M_zzz
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v40    = 5.0d0*v0
    v8     = v40
    v20    = 7.0d0*v0
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v1     = b2
    v12    = 5.0d0*v1
    v27    = 7.0d0*v1
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v0 + v1
    v41    = 3.0d0*h
    v4     = -h
    v10    = v41
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v28    = v19 + v27
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    v2     = u3
    D_x    = -v2*x
    D_y    = -v2*y
    D_z    = -v2*z
    u4     = u2*u2
    u5     = u2*u3
    v3     = u5
    v42    = 3.0d0*v3
    v5     = v42*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v42*v46
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v43    = 3.0d0*v6
    v7     = v6*x
    v9     = v43*(h - v8)
    D_xxx  = -3.0d0*v7*(v40 - v41)
    L_xxx  = L_xxx + (D_xxx*M_0)
    D_xxy  = v9*y
    L_xxy  = L_xxy + (D_xxy*M_0)
    D_xxz  = v9*z
    L_xxz  = L_xxz + (D_xxz*M_0)
    D_xyy  = v11*v7
    L_xyy  = L_xyy + (D_xyy*M_0)
    D_xyz  = -v45*v7
    L_xyz  = L_xyz + (D_xyz*M_0)
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = v43*y*(v10 - v12)
    L_yyy  = L_yyy + (D_yyy*M_0)
    D_yyz  = v11*v6*z
    L_yyz  = L_yyz + (D_yyz*M_0)
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v44    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v44*y
    v22    = v44*z
    v23    = v13*v45
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = L_xxxx + (D_xxxx*M_0)
    D_xxxy = v18*v21
    L_xxxy = L_xxxy + (D_xxxy*M_0)
    D_xxxz = v21*v22
    L_xxxz = L_xxxz + (D_xxxz*M_0)
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    v25    = 0.5d0*D_xxyy
    L_xxyy = L_xxyy + (D_xxyy*M_0)
    D_xxyz = v23*(v20 + v4)
    L_xxyz = L_xxyz + (D_xxyz*M_0)
    D_xxzz = -(D_xxxx + D_xxyy)
    v26    = 0.5d0*D_xxzz
    L_xx   = L_xx + (D_xx*M_0 + D_xxxx*v24 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxyz*M_yz + M_yy* &
      v25 + M_zz*v26)
    D_xyyy = v18*v28
    L_xyyy = L_xyyy + (D_xyyy*M_0)
    D_xyyz = v22*(v27 + v4)
    L_xyyz = L_xyyz + (D_xyyz*M_0)
    D_xyzz = -(D_xxxy + D_xyyy)
    v30    = 0.5d0*D_xyzz
    L_xy   = L_xy + (D_xxxy*v24 + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v29 + D_xyyz* &
      M_yz + M_zz*v30)
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = L_x + (D_x*M_0 + D_xxx*v24 + D_xxxx*v31 + D_xxxy*v32 + D_xxxz*v33 + D_xxy*M_xy &
      + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v29 + D_xyyy*v34 + D_xyyz*v35 &
      + D_xyz*M_yz + D_xzz*v36 + D_xzzz*v37 + M_xyy*v25 + M_xzz*v26 + &
      M_yzz*v30)
    L_xz   = L_xz + (D_xxxz*v24 + D_xxyz*M_xy + D_xxzz*M_xz + D_xyyz*v29 + D_xyzz*M_yz + D_xz &
      *M_0 + D_xzzz*v36)
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = L_yyyy + (D_yyyy*M_0)
    D_yyyz = v23*v28
    L_yyyz = L_yyyz + (D_yyyz*M_0)
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = L_yy + (D_xxyy*v24 + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v29 + D_yyyz* &
      M_yz + D_yyzz*v36)
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = L_y + (D_xxxy*v31 + D_xxy*v24 + D_xxyy*v32 + D_xxyz*v33 + D_xyy*M_xy + D_xyyy* &
      v38 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy*v29 + D_yyyy* &
      v34 + D_yyyz*v35 + D_yyz*M_yz + D_yyzz*v39 + D_yzz*v36 + D_yzzz* &
      v37 + M_xzz*v30)
    L_yz   = L_yz + (D_xxyz*v24 + D_xyyz*M_xy + D_xyzz*M_xz + D_yyyz*v29 + D_yyzz*M_yz + D_yz &
      *M_0 + D_yzzz*v36)
    D_zzzz = -(D_xxzz + D_yyzz)
    L_z    = L_z + (0.5d0*(D_xzzz*M_xzz) + D_xxxz*v31 + D_xxyz*v32 + D_xxz*v24 + D_xxzz*v33 &
      + D_xyyz*v38 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyz* &
      v34 + D_yyz*v29 + D_yyzz*v35 + D_yzz*M_yz + D_yzzz*v39 + D_z*M_0 &
      + D_zzz*v36 + D_zzzz*v37)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xxx               
#undef  M_xyy               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xyz               
#undef  L_xyy               
#undef  M_yyy               
#undef  L_xyz               
#undef  M_yyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  L_xxxx              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
    end subroutine mom_es_M2L_add
    
! OPS  96*ADD + 2*DIV + 118*MUL + 10*NEG + POW = 227  (383 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v4, v5,&
                v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define Ls_xx                Ls(3)
#define L_xx                 L(3)
#define L_xy                 L(4)
#define Ls_xy                Ls(4)
#define L_xz                 L(5)
#define Ls_xz                Ls(5)
#define Ls_yy                Ls(6)
#define L_yy                 L(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define Ls_xxy               Ls(9)
#define L_xxz                L(10)
#define Ls_xxz               Ls(10)
#define L_xyy                L(11)
#define Ls_xyy               Ls(11)
#define L_xyz                L(12)
#define Ls_xyz               Ls(12)
#define L_yyy                L(13)
#define Ls_yyy               Ls(13)
#define L_yyz                L(14)
#define Ls_yyz               Ls(14)
#define Ls_xxxx              Ls(15)
#define L_xxxx               L(15)
#define Ls_xxxy              Ls(16)
#define L_xxxy               L(16)
#define Ls_xxxz              Ls(17)
#define L_xxxz               L(17)
#define L_xxyy               L(18)
#define Ls_xxyy              Ls(18)
#define L_xxyz               L(19)
#define Ls_xxyz              Ls(19)
#define L_xyyy               L(20)
#define Ls_xyyy              Ls(20)
#define L_xyyz               L(21)
#define Ls_xyyz              Ls(21)
#define Ls_yyyy              Ls(22)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define Ls_yyyz              Ls(23)
    v0      = L_xxx + L_xxxy*y + L_xxxz*z
    v1      = L_xxy + L_xxyz*z
    v2      = L_xxyy*y + v1
    v3      = L_xyy + L_xyyz*z
    v4      = L_xyyy*y + v3
    v5      = L_yyy + L_yyyz*z
    v6      = L_xxz*z
    v13     = v1*y
    v15     = L_xyz*z
    v18     = v3*y
    v26     = 0.5d0*y
    v28     = 0.5d0*x
    v33     = L_yyz*z
    Ls_xxx  = Ls_xxx + (L_xxxx*x + v0)
    Ls_xxy  = Ls_xxy + (L_xxxy*x + v2)
    Ls_xyy  = Ls_xyy + (L_xxyy*x + v4)
    Ls_yyy  = Ls_yyy + (v5 + L_xyyy*x + L_yyyy*y)
    Ls_xxxx = Ls_xxxx + (L_xxxx)
    Ls_xxxy = Ls_xxxy + (L_xxxy)
    Ls_xxxz = Ls_xxxz + (L_xxxz)
    Ls_xxyy = Ls_xxyy + (L_xxyy)
    Ls_xxyz = Ls_xxyz + (L_xxyz)
    Ls_xyyy = Ls_xyyy + (L_xyyy)
    Ls_xyyz = Ls_xyyz + (L_xyyz)
    Ls_yyyy = Ls_yyyy + (L_yyyy)
    Ls_yyyz = Ls_yyyz + (L_yyyz)
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    v29     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v36     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    v14     = L_xxz + L_xxyz*y + L_xxzz*z
    Ls_xxz  = Ls_xxz + (L_xxxz*x + v14)
    L_xyzz  = -(L_xxxy + L_xyyy)
    v19     = L_xyz + L_xyzz*z
    v20     = L_xyyz*y + v19
    v32     = v19*y
    Ls_xyz  = Ls_xyz + (L_xxyz*x + v20)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    v35     = L_yyz + L_yyzz*z
    Ls_yyz  = Ls_yyz + (v35 + L_xyyz*x + L_yyyz*y)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v8      = 0.5d0*v7
    a3      = a1*a2
    v21     = 0.166666666666667d0*a3
    a4      = a2*a2
    b2      = b1*b1
    v9      = b2
    v10     = L_xxyy*v9
    v16     = L_xyyy*v9
    v25     = 0.5d0*v9
    v30     = L_xyyz*v9
    b3      = b1*b2
    v22     = 0.166666666666667d0*b3
    b4      = b2*b2
    c2      = c1*c1
    v11     = c2
    v23     = 0.5d0*v11
    v12     = L_xxzz*v11
    Ls_xx   = Ls_xx + (0.5d0*(v10 + v12) + L_xx + L_xxxx*v8 + v0*x + v13 + v6)
    v17     = L_xyzz*v11
    v27     = v17 + 2.0d0*(L_xy + v15)
    Ls_xy   = Ls_xy + (0.5d0*(v16 + v17) + L_xxxy*v8 + L_xy + v15 + v18 + v2*x)
    v31     = L_xzzz*v11
    Ls_xz   = Ls_xz + (0.5d0*(v30 + v31) + L_xxxz*v8 + L_xz + v14*x + v29 + v32)
    v34     = L_yyzz*v11
    Ls_yy   = Ls_yy + (0.5d0*v34 + L_xxyy*v8 + L_yy + L_yyyy*v25 + v33 + v4*x + v5*y)
    v37     = L_yzzz*v11
    Ls_yz   = Ls_yz + (0.5d0*v37 + L_xxyz*v8 + L_yyyz*v25 + L_yz + v20*x + v35*y + v36)
    h       = v11 + v7 + v9
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    u4      = u2*u2
    u5      = u2*u3
    u6      = u3*u3
    u7      = u3*u4
    u8      = u4*u4
    u9      = u4*u5
    c3      = c1*c2
    v24     = 0.166666666666667d0*c3
    Ls_x    = Ls_x + (L_x + L_xxxx*v21 + L_xyyy*v22 + L_xz*z + L_xzz*v23 + L_xzzz*v24 + v0*v8 &
      + v25*v3 + v26*v27 + v28*(2.0d0*L_xx + v10 + v12 + 2.0d0*v13 + &
      2.0d0*v6))
    Ls_y    = Ls_y + (L_y + L_xxxy*v21 + L_yyyy*v22 + L_yz*z + L_yzz*v23 + L_yzzz*v24 + v2*v8 &
      + v25*v5 + v26*(2.0d0*L_yy + 2.0d0*v33 + v34) + v28*(v16 + 2.0d0* &
      v18 + v27))
    Ls_z    = Ls_z + (L_z + L_xxxz*v21 + L_yyyz*v22 + L_zz*z + L_zzz*v23 + L_zzzz*v24 + v14*v8 &
      + v25*v35 + v26*(2.0d0*L_yz + 2.0d0*v36 + v37) + v28*(2.0d0*L_xz &
      + 2.0d0*v29 + v30 + v31 + 2.0d0*v32))
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  L_xy                
#undef  Ls_xy               
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
#undef  Ls_xxx              
#undef  L_xxx               
#undef  L_xxy               
#undef  Ls_xxy              
#undef  L_xxz               
#undef  Ls_xxz              
#undef  L_xyy               
#undef  Ls_xyy              
#undef  L_xyz               
#undef  Ls_xyz              
#undef  L_yyy               
#undef  Ls_yyy              
#undef  L_yyz               
#undef  Ls_yyz              
#undef  Ls_xxxx             
#undef  L_xxxx              
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  Ls_xxxz             
#undef  L_xxxz              
#undef  L_xxyy              
#undef  Ls_xxyy             
#undef  L_xxyz              
#undef  Ls_xxyz             
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
    end subroutine mom_es_L2L_add
    
! OPS  90*ADD + 2*DIV + 190*MUL + 22*NEG + POW + 7*SUB = 312  (463 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v5, v6, v7, v8,&
                v9, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz,&
                D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz,&
                D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, M_zz, M_xzz, M_yzz, M_zzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define x                    r(1:2,1)
#define M_xx                 M(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define M_xy                 M(1:2,2)
#define M_xz                 M(1:2,3)
#define L_xx                 L(1:2,3)
#define M_yy                 M(1:2,4)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define M_yz                 M(1:2,5)
#define L_yy                 L(1:2,6)
#define M_xxx                M(1:2,6)
#define L_yz                 L(1:2,7)
#define M_xxy                M(1:2,7)
#define M_xxz                M(1:2,8)
#define L_xxx                L(1:2,8)
#define M_xyy                M(1:2,9)
#define L_xxy                L(1:2,9)
#define L_xxz                L(1:2,10)
#define M_xyz                M(1:2,10)
#define L_xyy                L(1:2,11)
#define M_yyy                M(1:2,11)
#define L_xyz                L(1:2,12)
#define M_yyz                M(1:2,12)
#define L_yyy                L(1:2,13)
#define L_yyz                L(1:2,14)
#define L_xxxx               L(1:2,15)
#define L_xxxy               L(1:2,16)
#define L_xxxz               L(1:2,17)
#define L_xxyy               L(1:2,18)
#define L_xxyz               L(1:2,19)
#define L_xyyy               L(1:2,20)
#define L_xyyz               L(1:2,21)
#define L_yyyy               L(1:2,22)
#define L_yyyz               L(1:2,23)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v46    = y*z
    v45    = 15.0d0*v46
    v24    = 0.5d0*M_xx
    v29    = 0.5d0*M_yy
    v31    = 0.166666666666667d0*M_xxx
    v32    = 0.5d0*M_xxy
    v33    = 0.5d0*M_xxz
    v34    = 0.166666666666667d0*M_yyy
    v35    = 0.5d0*M_yyz
    v38    = 0.5d0*M_xyy
    M_zz   = -(M_xx + M_yy)
    v36    = 0.5d0*M_zz
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    v39    = 0.5d0*M_yzz
    M_zzz  = -(M_xxz + M_yyz)
    v37    = 0.166666666666667d0*M_zzz
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v40    = 5.0d0*v0
    v8     = v40
    v20    = 7.0d0*v0
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v1     = b2
    v12    = 5.0d0*v1
    v27    = 7.0d0*v1
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v0 + v1
    v41    = 3.0d0*h
    v4     = -h
    v10    = v41
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v28    = v19 + v27
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    v2     = u3
    D_x    = -v2*x
    D_y    = -v2*y
    D_z    = -v2*z
    u4     = u2*u2
    u5     = u2*u3
    v3     = u5
    v42    = 3.0d0*v3
    v5     = v42*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v42*v46
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v43    = 3.0d0*v6
    v7     = v6*x
    v9     = v43*(h - v8)
    D_xxx  = -3.0d0*v7*(v40 - v41)
    L_xxx  = D_xxx*M_0
    D_xxy  = v9*y
    L_xxy  = D_xxy*M_0
    D_xxz  = v9*z
    L_xxz  = D_xxz*M_0
    D_xyy  = v11*v7
    L_xyy  = D_xyy*M_0
    D_xyz  = -v45*v7
    L_xyz  = D_xyz*M_0
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = v43*y*(v10 - v12)
    L_yyy  = D_yyy*M_0
    D_yyz  = v11*v6*z
    L_yyz  = D_yyz*M_0
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v44    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v44*y
    v22    = v44*z
    v23    = v13*v45
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = D_xxxx*M_0
    D_xxxy = v18*v21
    L_xxxy = D_xxxy*M_0
    D_xxxz = v21*v22
    L_xxxz = D_xxxz*M_0
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    v25    = 0.5d0*D_xxyy
    L_xxyy = D_xxyy*M_0
    D_xxyz = v23*(v20 + v4)
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    v26    = 0.5d0*D_xxzz
    L_xx   = D_xx*M_0 + D_xxxx*v24 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxyz*M_yz + M_yy* &
      v25 + M_zz*v26
    D_xyyy = v18*v28
    L_xyyy = D_xyyy*M_0
    D_xyyz = v22*(v27 + v4)
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    v30    = 0.5d0*D_xyzz
    L_xy   = D_xxxy*v24 + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v29 + D_xyyz* &
      M_yz + M_zz*v30
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xxx*v24 + D_xxxx*v31 + D_xxxy*v32 + D_xxxz*v33 + D_xxy*M_xy &
      + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v29 + D_xyyy*v34 + D_xyyz*v35 &
      + D_xyz*M_yz + D_xzz*v36 + D_xzzz*v37 + M_xyy*v25 + M_xzz*v26 + &
      M_yzz*v30
    L_xz   = D_xxxz*v24 + D_xxyz*M_xy + D_xxzz*M_xz + D_xyyz*v29 + D_xyzz*M_yz + D_xz &
      *M_0 + D_xzzz*v36
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = D_yyyy*M_0
    D_yyyz = v23*v28
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xxyy*v24 + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v29 + D_yyyz* &
      M_yz + D_yyzz*v36
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xxxy*v31 + D_xxy*v24 + D_xxyy*v32 + D_xxyz*v33 + D_xyy*M_xy + D_xyyy* &
      v38 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy*v29 + D_yyyy* &
      v34 + D_yyyz*v35 + D_yyz*M_yz + D_yyzz*v39 + D_yzz*v36 + D_yzzz* &
      v37 + M_xzz*v30
    L_yz   = D_xxyz*v24 + D_xyyz*M_xy + D_xyzz*M_xz + D_yyyz*v29 + D_yyzz*M_yz + D_yz &
      *M_0 + D_yzzz*v36
    D_zzzz = -(D_xxzz + D_yyzz)
    L_z    = 0.5d0*(D_xzzz*M_xzz) + D_xxxz*v31 + D_xxyz*v32 + D_xxz*v24 + D_xxzz*v33 &
      + D_xyyz*v38 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyz* &
      v34 + D_yyz*v29 + D_yyzz*v35 + D_yzz*M_yz + D_yzzz*v39 + D_z*M_0 &
      + D_zzz*v36 + D_zzzz*v37
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xxx               
#undef  M_xyy               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xyz               
#undef  L_xyy               
#undef  M_yyy               
#undef  L_xyz               
#undef  M_yyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  L_xxxx              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
    end subroutine mom_es_M2L2
    
! OPS  55*ADD + 2*DIV + 83*MUL + 10*NEG + POW = 151  (221 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v2,&
                v3, v4, v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
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
#define L_xxxx               L(1:2,15)
#define L_xxxy               L(1:2,16)
#define L_xxxz               L(1:2,17)
#define L_xxyy               L(1:2,18)
#define L_xxyz               L(1:2,19)
#define L_xyyy               L(1:2,20)
#define L_xyyz               L(1:2,21)
#define L_yyyy               L(1:2,22)
#define L_yyyz               L(1:2,23)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v7     = L_xyy + L_xyyz*z
    v10    = 0.5d0*y
    v11    = 2.0d0*z
    v13    = 0.5d0*x
    v14    = 2.0d0*y
    v15    = L_xxy + L_xxyz*z
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    L_yzz  = -(L_xxy + L_yyy)
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    L_xyzz = -(L_xxxy + L_xyyy)
    L_xzzz = -(L_xxxz + L_xyyz)
    L_yyzz = -(L_xxyy + L_yyyy)
    L_yzzz = -(L_xxyz + L_yyyz)
    L_zzzz = -(L_xxzz + L_yyzz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v8     = a2
    v9     = 0.5d0*v8
    a3     = a1*a2
    v0     = 0.166666666666667d0*a3
    a4     = a2*a2
    b2     = b1*b1
    v5     = b2
    v6     = 0.5d0*v5
    b3     = b1*b2
    v1     = 0.166666666666667d0*b3
    b4     = b2*b2
    c2     = c1*c1
    v2     = c2
    v3     = 0.5d0*v2
    v12    = 2.0d0*L_xy + L_xyz*v11 + L_xyzz*v2
    h      = v2 + v5 + v8
    u2     = 1.0/h
    u      = sqrt(u2)
    u3     = u*u2
    u4     = u2*u2
    u5     = u2*u3
    u6     = u3*u3
    u7     = u3*u4
    u8     = u4*u4
    u9     = u4*u5
    c3     = c1*c2
    v4     = 0.166666666666667d0*c3
    Phi_x  = L_x + L_xxxx*v0 + L_xyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v4 + v10*v12 + &
      v13*(2.0d0*L_xx + L_xxyy*v5 + L_xxz*v11 + L_xxzz*v2 + v14*v15) + &
      v6*v7 + v9*(L_xxx + L_xxxy*y + L_xxxz*z)
    Phi_y  = L_y + L_xxxy*v0 + L_yyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v4 + v10*(2.0d0 &
      *L_yy + L_yyz*v11 + L_yyzz*v2) + v13*(L_xyyy*v5 + v12 + v14*v7) + &
      v6*(L_yyy + L_yyyz*z) + v9*(L_xxyy*y + v15)
    Phi_z  = L_z + L_xxxz*v0 + L_yyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v4 + v10*(2.0d0 &
      *L_yz + L_yzz*v11 + L_yzzz*v2) + v13*(L_xyyz*v5 + 2.0d0*L_xz + &
      L_xzz*v11 + L_xzzz*v2 + v14*(L_xyz + L_xyzz*z)) + v6*(L_yyz + &
      L_yyzz*z) + v9*(L_xxyz*y + L_xxz + L_xxzz*z)
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
#undef  L_xxxx              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
    end subroutine mom_es_L2P2
    
! OPS  96*ADD + 2*DIV + 118*MUL + 10*NEG + POW = 227  (383 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v4, v5,&
                v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Ls_x                 Ls(1:2,0)
#define x                    r(1:2,1)
#define Ls_y                 Ls(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define Ls_z                 Ls(1:2,2)
#define Ls_xx                Ls(1:2,3)
#define L_xx                 L(1:2,3)
#define L_xy                 L(1:2,4)
#define Ls_xy                Ls(1:2,4)
#define L_xz                 L(1:2,5)
#define Ls_xz                Ls(1:2,5)
#define Ls_yy                Ls(1:2,6)
#define L_yy                 L(1:2,6)
#define Ls_yz                Ls(1:2,7)
#define L_yz                 L(1:2,7)
#define Ls_xxx               Ls(1:2,8)
#define L_xxx                L(1:2,8)
#define L_xxy                L(1:2,9)
#define Ls_xxy               Ls(1:2,9)
#define L_xxz                L(1:2,10)
#define Ls_xxz               Ls(1:2,10)
#define L_xyy                L(1:2,11)
#define Ls_xyy               Ls(1:2,11)
#define L_xyz                L(1:2,12)
#define Ls_xyz               Ls(1:2,12)
#define L_yyy                L(1:2,13)
#define Ls_yyy               Ls(1:2,13)
#define L_yyz                L(1:2,14)
#define Ls_yyz               Ls(1:2,14)
#define Ls_xxxx              Ls(1:2,15)
#define L_xxxx               L(1:2,15)
#define Ls_xxxy              Ls(1:2,16)
#define L_xxxy               L(1:2,16)
#define Ls_xxxz              Ls(1:2,17)
#define L_xxxz               L(1:2,17)
#define L_xxyy               L(1:2,18)
#define Ls_xxyy              Ls(1:2,18)
#define L_xxyz               L(1:2,19)
#define Ls_xxyz              Ls(1:2,19)
#define L_xyyy               L(1:2,20)
#define Ls_xyyy              Ls(1:2,20)
#define L_xyyz               L(1:2,21)
#define Ls_xyyz              Ls(1:2,21)
#define Ls_yyyy              Ls(1:2,22)
#define L_yyyy               L(1:2,22)
#define L_yyyz               L(1:2,23)
#define Ls_yyyz              Ls(1:2,23)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0      = L_xxx + L_xxxy*y + L_xxxz*z
    v1      = L_xxy + L_xxyz*z
    v2      = L_xxyy*y + v1
    v3      = L_xyy + L_xyyz*z
    v4      = L_xyyy*y + v3
    v5      = L_yyy + L_yyyz*z
    v6      = L_xxz*z
    v13     = v1*y
    v15     = L_xyz*z
    v18     = v3*y
    v26     = 0.5d0*y
    v28     = 0.5d0*x
    v33     = L_yyz*z
    Ls_xxx  = L_xxxx*x + v0
    Ls_xxy  = L_xxxy*x + v2
    Ls_xyy  = L_xxyy*x + v4
    Ls_yyy  = v5 + L_xyyy*x + L_yyyy*y
    Ls_xxxx = L_xxxx
    Ls_xxxy = L_xxxy
    Ls_xxxz = L_xxxz
    Ls_xxyy = L_xxyy
    Ls_xxyz = L_xxyz
    Ls_xyyy = L_xyyy
    Ls_xyyz = L_xyyz
    Ls_yyyy = L_yyyy
    Ls_yyyz = L_yyyz
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    v29     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v36     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    v14     = L_xxz + L_xxyz*y + L_xxzz*z
    Ls_xxz  = L_xxxz*x + v14
    L_xyzz  = -(L_xxxy + L_xyyy)
    v19     = L_xyz + L_xyzz*z
    v20     = L_xyyz*y + v19
    v32     = v19*y
    Ls_xyz  = L_xxyz*x + v20
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    v35     = L_yyz + L_yyzz*z
    Ls_yyz  = v35 + L_xyyz*x + L_yyyz*y
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v8      = 0.5d0*v7
    a3      = a1*a2
    v21     = 0.166666666666667d0*a3
    a4      = a2*a2
    b2      = b1*b1
    v9      = b2
    v10     = L_xxyy*v9
    v16     = L_xyyy*v9
    v25     = 0.5d0*v9
    v30     = L_xyyz*v9
    b3      = b1*b2
    v22     = 0.166666666666667d0*b3
    b4      = b2*b2
    c2      = c1*c1
    v11     = c2
    v23     = 0.5d0*v11
    v12     = L_xxzz*v11
    Ls_xx   = 0.5d0*(v10 + v12) + L_xx + L_xxxx*v8 + v0*x + v13 + v6
    v17     = L_xyzz*v11
    v27     = v17 + 2.0d0*(L_xy + v15)
    Ls_xy   = 0.5d0*(v16 + v17) + L_xxxy*v8 + L_xy + v15 + v18 + v2*x
    v31     = L_xzzz*v11
    Ls_xz   = 0.5d0*(v30 + v31) + L_xxxz*v8 + L_xz + v14*x + v29 + v32
    v34     = L_yyzz*v11
    Ls_yy   = 0.5d0*v34 + L_xxyy*v8 + L_yy + L_yyyy*v25 + v33 + v4*x + v5*y
    v37     = L_yzzz*v11
    Ls_yz   = 0.5d0*v37 + L_xxyz*v8 + L_yyyz*v25 + L_yz + v20*x + v35*y + v36
    h       = v11 + v7 + v9
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    u4      = u2*u2
    u5      = u2*u3
    u6      = u3*u3
    u7      = u3*u4
    u8      = u4*u4
    u9      = u4*u5
    c3      = c1*c2
    v24     = 0.166666666666667d0*c3
    Ls_x    = L_x + L_xxxx*v21 + L_xyyy*v22 + L_xz*z + L_xzz*v23 + L_xzzz*v24 + v0*v8 &
      + v25*v3 + v26*v27 + v28*(2.0d0*L_xx + v10 + v12 + 2.0d0*v13 + &
      2.0d0*v6)
    Ls_y    = L_y + L_xxxy*v21 + L_yyyy*v22 + L_yz*z + L_yzz*v23 + L_yzzz*v24 + v2*v8 &
      + v25*v5 + v26*(2.0d0*L_yy + 2.0d0*v33 + v34) + v28*(v16 + 2.0d0* &
      v18 + v27)
    Ls_z    = L_z + L_xxxz*v21 + L_yyyz*v22 + L_zz*z + L_zzz*v23 + L_zzzz*v24 + v14*v8 &
      + v25*v35 + v26*(2.0d0*L_yz + 2.0d0*v36 + v37) + v28*(2.0d0*L_xz &
      + 2.0d0*v29 + v30 + v31 + 2.0d0*v32)
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  Ls_xx               
#undef  L_xx                
#undef  L_xy                
#undef  Ls_xy               
#undef  L_xz                
#undef  Ls_xz               
#undef  Ls_yy               
#undef  L_yy                
#undef  Ls_yz               
#undef  L_yz                
#undef  Ls_xxx              
#undef  L_xxx               
#undef  L_xxy               
#undef  Ls_xxy              
#undef  L_xxz               
#undef  Ls_xxz              
#undef  L_xyy               
#undef  Ls_xyy              
#undef  L_xyz               
#undef  Ls_xyz              
#undef  L_yyy               
#undef  Ls_yyy              
#undef  L_yyz               
#undef  Ls_yyz              
#undef  Ls_xxxx             
#undef  L_xxxx              
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  Ls_xxxz             
#undef  L_xxxz              
#undef  L_xxyy              
#undef  Ls_xxyy             
#undef  L_xxyz              
#undef  Ls_xxyz             
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
    end subroutine mom_es_L2L2_add
#endif
end module mom4
