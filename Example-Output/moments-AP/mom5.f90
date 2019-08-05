!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-03 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom5
use types
implicit none
#if FMM_EXPANSION_ORDER==5
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
        
    
! OPS  15*ADD + 46*MUL + 5*NEG + 3*SUB = 69  (187 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v3, v4,&
                v5, v6, v7, v8, v9, h, u
#define x                    r(1)
#define y                    r(2)
#define z                    r(3)
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
#define M_xxxx               M(13)
#define M_xxxy               M(14)
#define M_xxxz               M(15)
#define M_xxyy               M(16)
#define M_xxyz               M(17)
#define M_xyyy               M(18)
#define M_xyyz               M(19)
#define M_yyyy               M(20)
#define M_yyyz               M(21)
    v0     = W*x
    v1     = v0*y
    v2     = v0*z
    v3     = W*y
    v4     = v3*z
    v12    = W*z
    M_0    = W
    M_xy   = v1
    M_xz   = v2
    M_yz   = v4
    M_xyz  = v1*z
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v5     = a2
    a3     = a1*a2
    a4     = a2*a2
    a5     = a2*a3
    b2     = b1*b1
    v6     = b2
    v7     = v5 + v6
    b3     = b1*b2
    b4     = b2*b2
    b5     = b2*b3
    c2     = c1*c1
    h      = c2 + v7
    v8     = -0.333333333333333d0*h
    v9     = -0.6d0*h
    v10    = -0.2d0*h
    v11    = v10 + v5
    v13    = v10 + v6
    v14    = h*h
    v15    = 0.0857142857142857d0*v14
    v16    = 0.857142857142857d0*h
    v17    = -0.428571428571429d0*h
    v18    = v17 + v5
    v19    = 0.142857142857143d0*h
    v20    = -v19
    v21    = v17 + v6
    M_xx   = W*(v5 + v8)
    M_yy   = W*(v6 + v8)
    M_xxx  = v0*(v5 + v9)
    M_xxy  = v11*v3
    M_xxz  = v11*v12
    M_xyy  = v0*v13
    M_yyy  = v3*(v6 + v9)
    M_yyz  = v12*v13
    M_xxxx = W*(-v16*v5 + a4 + v15)
    M_xxxy = v1*v18
    M_xxxz = v18*v2
    M_xxyy = W*(0.0285714285714286d0*v14 - v19*v7 + v5*v6)
    M_xxyz = v4*(v20 + v5)
    M_xyyy = v1*v21
    M_xyyz = v2*(v20 + v6)
    M_yyyy = W*(-v16*v6 + b4 + v15)
    M_yyyz = v21*v4
#undef  x                   
#undef  y                   
#undef  z                   
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
#undef  M_xxxx              
#undef  M_xxxy              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  M_xxyz              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  M_yyyy              
#undef  M_yyyz              
    end subroutine mom_es_P2M
    
! OPS  124*ADD + 221*MUL + 21*NEG + 37*SUB = 403  (624 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v7, v8,&
                v9, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz,&
                S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_yyy,&
                S_yyz, S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz, S_xyyy, S_xyyz,&
                S_yyyy, S_yyyz
#define y                    r(2)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
#define z                    r(3)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define M_xy                 M(2)
#define Ms_xy                Ms(2)
#define M_xz                 M(3)
#define Ms_xz                Ms(3)
#define Ms_yy                Ms(4)
#define M_yy                 M(4)
#define Ms_yz                Ms(5)
#define M_yz                 M(5)
#define Ms_xxx               Ms(6)
#define M_xxx                M(6)
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
#define M_yyz                M(12)
#define Ms_yyz               Ms(12)
#define M_xxxx               M(13)
#define Ms_xxxx              Ms(13)
#define M_xxxy               M(14)
#define Ms_xxxy              Ms(14)
#define Ms_xxxz              Ms(15)
#define M_xxxz               M(15)
#define Ms_xxyy              Ms(16)
#define M_xxyy               M(16)
#define Ms_xxyz              Ms(17)
#define M_xxyz               M(17)
#define M_xyyy               M(18)
#define Ms_xyyy              Ms(18)
#define Ms_xyyz              Ms(19)
#define M_xyyz               M(19)
#define M_yyyy               M(20)
#define Ms_yyyy              Ms(20)
#define M_yyyz               M(21)
#define Ms_yyyz              Ms(21)
    v0      = x*y
    v1      = x*z
    v2      = y*z
    v7      = M_xx*x
    v8      = M_xy*y
    v9      = M_xz*z
    v12     = M_xy*x
    v13     = M_yy*y
    v14     = M_yz*z
    v15     = M_xx*z
    v16     = M_xz*x
    v17     = M_yy*z
    v18     = M_yz*y
    v28     = M_xxx*x
    v29     = 1.71428571428571d0*y
    v30     = M_xxy*v29
    v31     = M_xxz*z
    v37     = 0.857142857142857d0*M_xyz
    v40     = M_xxy*x
    v43     = M_xyy*y
    v45     = M_xxx*z
    v46     = M_xxz*x
    v48     = M_xyy*z
    v53     = 1.71428571428571d0*x
    v54     = M_xyy*v53
    v55     = M_yyy*y
    v56     = M_yyz*z
    v59     = M_xxy*z
    v62     = M_yyy*z
    v63     = M_yyz*y
    Ms_0    = M_0
    M_zz    = -(M_xx + M_yy)
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    M_xxzz  = -(M_xxxx + M_xxyy)
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    S_0     = 1
    S_x     = x
    S_y     = y
    S_z     = z
    S_xy    = v0
    v24     = M_xy*S_xy
    v39     = M_xx*S_xy
    v44     = M_yy*S_xy
    v51     = M_yz*S_xy
    v61     = M_xz*S_xy
    Ms_xy   = M_0*S_xy + M_xy
    S_xz    = v1
    v32     = M_xz*S_xz
    v50     = M_yy*S_xz
    v60     = M_xy*S_xz
    Ms_xz   = M_0*S_xz + M_xz
    S_yz    = v2
    v34     = M_yz*S_yz
    v38     = -0.142857142857143d0*(7.0d0*v37*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v47     = M_xy*S_yz
    v58     = M_xx*S_yz
    Ms_yz   = M_0*S_yz + M_yz
    S_xyz   = v0*z
    Ms_xyz  = M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v3      = a2
    a3      = a1*a2
    a4      = a2*a2
    a5      = a2*a3
    b2      = b1*b1
    v4      = b2
    b3      = b1*b2
    b4      = b2*b2
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v3 + v4
    v5      = -0.333333333333333d0*h
    v6      = -0.6d0*h
    v10     = -0.2d0*h
    v11     = v10 + v3
    v19     = v10 + v4
    v20     = h*h
    v21     = 0.0857142857142857d0*v20
    v22     = 0.857142857142857d0*h
    v35     = -0.428571428571429d0*h
    v36     = v3 + v35
    v52     = 0.142857142857143d0*h
    v57     = -v52
    v65     = v35 + v4
    S_xx    = v3 + v5
    v25     = M_yy*S_xx
    v27     = M_xx*S_xx
    v41     = M_xy*S_xx
    v64     = M_yz*S_xx
    Ms_xx   = M_0*S_xx + M_xx
    S_yy    = v4 + v5
    v23     = M_xx*S_yy
    v26     = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v24 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v23 + 4.0d0*v25))
    v33     = M_yy*S_yy
    v42     = M_xy*S_yy
    v49     = M_xz*S_yy
    Ms_yy   = M_0*S_yy + M_yy
    S_zz    = -(S_xx + S_yy)
    S_xxx   = x*(v3 + v6)
    Ms_xxx  = 0.2d0*(9.0d0*v7 + 3.0d0*(-2.0d0*v8 - 2.0d0*v9)) + M_0*S_xxx + M_xxx
    S_xxy   = v11*y
    Ms_xxy  = 0.2d0*(8.0d0*v12 + 2.0d0*(-v13 - v14)) + M_0*S_xxy + M_xx*y + M_xxy
    S_xxz   = v11*z
    Ms_xxz  = M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v15 + 8.0d0*v16 + 2.0d0*(v17 - v18))
    S_xyy   = v19*x
    Ms_xyy  = 0.2d0*(8.0d0*v8 + 2.0d0*(-v7 - v9)) + M_0*S_xyy + M_xyy + M_yy*x
    S_yyy   = y*(v4 + v6)
    Ms_yyy  = 0.2d0*(9.0d0*v13 + 3.0d0*(-2.0d0*v12 - 2.0d0*v14)) + M_0*S_yyy + M_yyy
    S_yyz   = v19*z
    Ms_yyz  = M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v17 + 8.0d0*v18 + 2.0d0*(v15 - v16))
    S_xxxx  = -v22*v3 + a4 + v21
    Ms_xxxx = M_0*S_xxxx + v26 - v30 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v27 + 80.0d0*v28 - 60.0d0*v31 - 96.0d0*v32 + &
      24.0d0*(v33 + v34))
    S_xxxy  = v0*v36
    Ms_xxxy = M_0*S_xxxy + M_xxx*y + M_xxxy + v38 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v39 + 5.0d0*v40 + 5.0d0*v41 - 2.0d0*v42 - 2.0d0*v43 - 2.0d0*v44))
    S_xxxz  = v1*v36
    Ms_xxxz = M_0*S_xxxz + M_xxxz - v37*y + 0.142857142857143d0*(13.0d0*v45 + 15.0d0* &
      v46 + 21.0d0*(M_xx*S_xz + M_xz*S_xx) + 6.0d0*(-v47 + v48 + v49 + &
      v50 - v51))
    S_xxyy  = 0.0285714285714286d0*v20 + v3*v4 - v3*v52 - v4*v52
    Ms_xxyy = M_0*S_xxyy + v30 + v54 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v24 + 39.0d0*(v23 + v25) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v27 + 10.0d0*v28 + 10.0d0*v31 + 12.0d0*v32 + 12.0d0*v33 + &
      12.0d0*v34 + 10.0d0*v55 + 10.0d0*v56))
    S_xxyz  = v2*(v3 + v57)
    Ms_xxyz = 0.142857142857143d0*(12.0d0*(v60 + v61) + 2.0d0*(v62 - v63) + 9.0d0*(v58 &
      + v59 + v64)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v53
    S_xyyy  = v0*v65
    Ms_xyyy = M_0*S_xyyy + M_xyyy + M_yyy*x + v38 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v39 - 2.0d0*v40 - 2.0d0*v41 + 5.0d0*v42 + 5.0d0*v43 + 5.0d0*v44 &
      ))
    S_xyyz  = v1*(v4 + v57)
    Ms_xyyz = 0.142857142857143d0*(2.0d0*(v45 - v46) + 12.0d0*(v47 + v51) + 9.0d0*(v48 &
      + v49 + v50)) + M_0*S_xyyz + M_xyyz + M_xyz*v29 + M_yyz*x
    S_yyyy  = -v22*v4 + b4 + v21
    Ms_yyyy = M_0*S_yyyy + v26 - v54 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v33 - 96.0d0*v34 + 80.0d0*v55 - 60.0d0*v56 + &
      24.0d0*(v27 + v32))
    S_yyyz  = v2*v65
    Ms_yyyz = M_0*S_yyyz + M_yyyz - v37*x + 0.142857142857143d0*(13.0d0*v62 + 15.0d0* &
      v63 + 21.0d0*(M_yy*S_yz + M_yz*S_yy) + 6.0d0*(v58 + v59 - v60 - &
      v61 + v64))
#undef  y                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
#undef  z                   
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  M_xz                
#undef  Ms_xz               
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
#undef  Ms_xxx              
#undef  M_xxx               
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
#undef  M_yyz               
#undef  Ms_yyz              
#undef  M_xxxx              
#undef  Ms_xxxx             
#undef  M_xxxy              
#undef  Ms_xxxy             
#undef  Ms_xxxz             
#undef  M_xxxz              
#undef  Ms_xxyy             
#undef  M_xxyy              
#undef  Ms_xxyz             
#undef  M_xxyz              
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
    end subroutine mom_es_M2M
    
! OPS  237*ADD + 2*DIV + 405*MUL + 41*NEG + POW + 14*SUB = 700  (1010 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz,&
                D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz,&
                D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz,&
                D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(0)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define L_xx                 L(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define M_yz                 M(5)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
#define M_xxy                M(7)
#define L_yz                 L(7)
#define M_xxz                M(8)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define M_xyy                M(9)
#define M_xyz                M(10)
#define L_xxz                L(10)
#define L_xyy                L(11)
#define M_yyy                M(11)
#define L_xyz                L(12)
#define M_yyz                M(12)
#define L_yyy                L(13)
#define M_xxxx               M(13)
#define L_yyz                L(14)
#define M_xxxy               M(14)
#define L_xxxx               L(15)
#define M_xxxz               M(15)
#define M_xxyy               M(16)
#define L_xxxy               L(16)
#define L_xxxz               L(17)
#define M_xxyz               M(17)
#define M_xyyy               M(18)
#define L_xxyy               L(18)
#define M_xyyz               M(19)
#define L_xxyz               L(19)
#define L_xyyy               L(20)
#define M_yyyy               M(20)
#define M_yyyz               M(21)
#define L_xyyz               L(21)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define L_xxxxx              L(24)
#define L_xxxxy              L(25)
#define L_xxxxz              L(26)
#define L_xxxyy              L(27)
#define L_xxxyz              L(28)
#define L_xxyyy              L(29)
#define L_xxyyz              L(30)
#define L_xyyyy              L(31)
#define L_xyyyz              L(32)
#define L_yyyyy              L(33)
#define L_yyyyz              L(34)
    v91     = y*z
    v88     = 15.0d0*v91
    v40     = 0.5d0*M_xx
    v46     = 0.166666666666667d0*M_xxx
    v47     = 0.5d0*M_xxy
    v48     = 0.5d0*M_xxz
    v56     = 0.5d0*M_yy
    v58     = 0.166666666666667d0*M_yyy
    v63     = 0.0416666666666667d0*M_xxxx
    v64     = 0.166666666666667d0*M_xxxy
    v65     = 0.166666666666667d0*M_xxxz
    v66     = 0.25d0*M_xxyy
    v67     = 0.5d0*M_xxyz
    v69     = 0.0416666666666667d0*M_yyyy
    v70     = 0.166666666666667d0*M_yyyz
    v71     = 0.5d0*M_yyz
    v76     = 0.5d0*M_xyy
    v78     = 0.166666666666667d0*M_xyyy
    M_zz    = -(M_xx + M_yy)
    v73     = 0.5d0*M_zz
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    v77     = 0.5d0*M_yzz
    M_zzz   = -(M_xxz + M_yyz)
    v74     = 0.166666666666667d0*M_zzz
    M_xxzz  = -(M_xxxx + M_xxyy)
    v68     = 0.25d0*M_xxzz
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    v72     = 0.25d0*M_yyzz
    M_yzzz  = -(M_xxyz + M_yyyz)
    v79     = 0.166666666666667d0*M_yzzz
    M_zzzz  = -(M_xxzz + M_yyzz)
    v75     = 0.0416666666666667d0*M_zzzz
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v80     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v80
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v81     = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v81
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v82     = 3.0d0*h
    v83     = h*v0
    v84     = h*v1
    v4      = -h
    v12     = v82
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v83
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v84
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 - 945.0d0*v19 + 630.0d0*v83
    v38     = -(v18 + 63.0d0*v26)
    v55     = v35 - 945.0d0*v30 + 630.0d0*v84
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    v2      = u3
    D_x     = -v2*x
    D_y     = -v2*y
    D_z     = -v2*z
    u4      = u2*u2
    u5      = u2*u3
    v3      = u5
    v85     = 3.0d0*v3
    v6      = v85*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v85*v91
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v86     = 3.0d0*v8
    v9      = v8*x
    v11     = v86*(h - v10)
    D_xxx   = -3.0d0*v9*(v80 - v82)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    D_xyz   = -v88*v9
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = v86*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v87     = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v87*y
    v25     = v87*z
    v27     = v15*v88
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    L_xxxx  = D_xxxx*M_0
    D_xxxy  = v21*v24
    L_xxxy  = D_xxxy*M_0
    D_xxxz  = v24*v25
    L_xxxz  = D_xxxz*M_0
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    v49     = 0.5d0*D_xxyy
    L_xxyy  = D_xxyy*M_0
    D_xxyz  = v27*(v23 + v4)
    L_xxyz  = D_xxyz*M_0
    D_xxzz  = -(D_xxxx + D_xxyy)
    v52     = 0.5d0*D_xxzz
    D_xyyy  = v21*v29
    L_xyyy  = D_xyyy*M_0
    D_xyyz  = v25*(v28 + v4)
    L_xyyz  = D_xyyz*M_0
    D_xyzz  = -(D_xxxy + D_xyyy)
    v60     = 0.5d0*D_xyzz
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    L_yyyy  = D_yyyy*M_0
    D_yyyz  = v27*v29
    L_yyyz  = D_yyyz*M_0
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v89     = 15.0d0*v32
    v90     = v32*z
    v33     = v89*x
    v37     = v90
    v39     = 315.0d0*v90*x*y
    v43     = v89*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = v32*v36*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = v36*v37
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    v41     = 0.5d0*D_xxxyy
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = v39*(h - v5)
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    v42     = 0.5d0*D_xxxzz
    L_xxx   = D_xxx*M_0 + D_xxxxx*v40 + D_xxxxy*M_xy + D_xxxxz*M_xz + D_xxxyz*M_yz + &
      M_yy*v41 + M_zz*v42
    D_xxyyy = v43*(v38 + h*v28 + 21.0d0*v20)
    v44     = 0.5d0*D_xxyyy
    v50     = 0.166666666666667d0*D_xxyyy
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = v37*(v34 - 945.0d0*v81 + 105.0d0*(v83 + v84))
    v51     = 0.5d0*D_xxyyz
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    v45     = 0.5d0*D_xxyzz
    L_xxy   = D_xxxxy*v40 + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + &
      M_yy*v44 + M_zz*v45
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    v53     = 0.166666666666667d0*D_xxzzz
    v54     = 0.5d0*D_xxzzz
    L_xx    = D_xx*M_0 + D_xxxx*v40 + D_xxxxx*v46 + D_xxxxy*v47 + D_xxxxz*v48 + D_xxxy &
      *M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + M_xyy*v41 + &
      M_xzz*v42 + M_yy*v49 + M_yyy*v50 + M_yyz*v51 + M_yzz*v45 + M_zz* &
      v52 + M_zzz*v53
    L_xxz   = D_xxxxz*v40 + D_xxxyz*M_xy + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_yy*v51 + M_zz*v54
    D_xyyyy = v32*v55*x
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = v39*(h - v7)
    v59     = 0.5d0*D_xyyyz
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    v57     = 0.5d0*D_xyyzz
    L_xyy   = D_xxxyy*v40 + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v56 + &
      D_xyyyz*M_yz + M_zz*v57
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    v61     = 0.166666666666667d0*D_xyzzz
    v62     = 0.5d0*D_xyzzz
    L_xy    = D_xxxxy*v46 + D_xxxy*v40 + D_xxxyy*v47 + D_xxxyz*v48 + D_xxyy*M_xy + &
      D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v56 + D_xyyyy*v58 &
      + D_xyyz*M_yz + M_xyy*v44 + M_xzz*v45 + M_yyz*v59 + M_yzz*v57 + &
      M_zz*v60 + M_zzz*v61
    L_xyz   = D_xxxyz*v40 + D_xxyyz*M_xy + D_xxyzz*M_xz + D_xyyyz*v56 + D_xyyzz*M_yz + &
      D_xyz*M_0 + M_zz*v62
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = D_x*M_0 + D_xxx*v40 + D_xxxx*v46 + D_xxxxx*v63 + D_xxxxy*v64 + D_xxxxz* &
      v65 + D_xxxy*v47 + D_xxxyy*v66 + D_xxxyz*v67 + D_xxxz*v48 + &
      D_xxxzz*v68 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v56 &
      + D_xyyy*v58 + D_xyyyy*v69 + D_xyyyz*v70 + D_xyyz*v71 + D_xyyzz* &
      v72 + D_xyz*M_yz + D_xzz*v73 + D_xzzz*v74 + D_xzzzz*v75 + M_xyy* &
      v49 + M_xyyy*v50 + M_xyyz*v51 + M_xyzz*v45 + M_xzz*v52 + M_xzzz* &
      v53 + M_yzz*v60 + M_yzzz*v61
    L_xz    = D_xxxxz*v46 + D_xxxyz*v47 + D_xxxz*v40 + D_xxxzz*v48 + D_xxyz*M_xy + &
      D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyz*v58 + D_xyyz*v56 + D_xyyzz* &
      v71 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v73 + D_xzzzz*v74 + M_xyy* &
      v51 + M_xzz*v54 + M_yzz*v62
    D_yyyyy = v43*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = v37*v55
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = D_xxyyy*v40 + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyyy*v56 + &
      D_yyyyz*M_yz + D_yyyzz*v73
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = D_xxxyy*v46 + D_xxyy*v40 + D_xxyyy*v47 + D_xxyyz*v48 + D_xyyy*M_xy + &
      D_xyyyy*v76 + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v56 &
      + D_yyyyy*v58 + D_yyyyz*v71 + D_yyyz*M_yz + D_yyyzz*v77 + D_yyzz* &
      v73 + D_yyzzz*v74 + M_xzz*v57
    L_yyz   = D_xxyyz*v40 + D_xyyyz*M_xy + D_xyyzz*M_xz + D_yyyyz*v56 + D_yyyzz*M_yz + &
      D_yyz*M_0 + D_yyzzz*v73
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = D_xxxxy*v63 + D_xxxy*v46 + D_xxxyy*v64 + D_xxxyz*v65 + D_xxy*v40 + &
      D_xxyy*v47 + D_xxyyy*v66 + D_xxyyz*v67 + D_xxyz*v48 + D_xxyzz*v68 &
      + D_xyy*M_xy + D_xyyy*v76 + D_xyyyy*v78 + D_xyyz*M_xyz + D_xyz* &
      M_xz + D_y*M_0 + D_yyy*v56 + D_yyyy*v58 + D_yyyyy*v69 + D_yyyyz* &
      v70 + D_yyyz*v71 + D_yyyzz*v72 + D_yyz*M_yz + D_yyzz*v77 + &
      D_yyzzz*v79 + D_yzz*v73 + D_yzzz*v74 + D_yzzzz*v75 + M_xyyz*v59 + &
      M_xyzz*v57 + M_xzz*v60 + M_xzzz*v61
    L_yz    = D_xxxyz*v46 + D_xxyyz*v47 + D_xxyz*v40 + D_xxyzz*v48 + D_xyyyz*v76 + &
      D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyz*v58 + D_yyyz* &
      v56 + D_yyyzz*v71 + D_yyzz*M_yz + D_yyzzz*v77 + D_yz*M_0 + D_yzzz &
      *v73 + D_yzzzz*v74 + M_xzz*v62
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_z     = 0.166666666666667d0*(3.0d0*D_xzzz*M_xzz + D_xzzzz*M_xzzz) + D_xxxxz*v63 &
      + D_xxxyz*v64 + D_xxxz*v46 + D_xxxzz*v65 + D_xxyyz*v66 + D_xxyz* &
      v47 + D_xxyzz*v67 + D_xxz*v40 + D_xxzz*v48 + D_xxzzz*v68 + &
      D_xyyyz*v78 + D_xyyz*v76 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz &
      + D_yyyyz*v69 + D_yyyz*v58 + D_yyyzz*v70 + D_yyz*v56 + D_yyzz*v71 &
      + D_yyzzz*v72 + D_yzz*M_yz + D_yzzz*v77 + D_yzzzz*v79 + D_z*M_0 + &
      D_zzz*v73 + D_zzzz*v74 + D_zzzzz*v75 + M_xyyz*v57 + M_xyzz*v62
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  M_yz                
#undef  L_xz                
#undef  L_yy                
#undef  M_xxx               
#undef  M_xxy               
#undef  L_yz                
#undef  M_xxz               
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xyy               
#undef  M_xyz               
#undef  L_xxz               
#undef  L_xyy               
#undef  M_yyy               
#undef  L_xyz               
#undef  M_yyz               
#undef  L_yyy               
#undef  M_xxxx              
#undef  L_yyz               
#undef  M_xxxy              
#undef  L_xxxx              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxyz              
#undef  M_xyyy              
#undef  L_xxyy              
#undef  M_xyyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
    end subroutine mom_es_M2L
    
! OPS  200*ADD + 2*DIV + 233*MUL + 20*NEG + POW = 456  (928 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v9, h, u,&
                L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz,&
                L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz,&
                L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define Ls_xy                Ls(4)
#define L_xy                 L(4)
#define Ls_xz                Ls(5)
#define L_xz                 L(5)
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
#define L_xxxx               L(15)
#define Ls_xxxx              Ls(15)
#define Ls_xxxy              Ls(16)
#define L_xxxy               L(16)
#define L_xxxz               L(17)
#define Ls_xxxz              Ls(17)
#define Ls_xxyy              Ls(18)
#define L_xxyy               L(18)
#define Ls_xxyz              Ls(19)
#define L_xxyz               L(19)
#define L_xyyy               L(20)
#define Ls_xyyy              Ls(20)
#define L_xyyz               L(21)
#define Ls_xyyz              Ls(21)
#define Ls_yyyy              Ls(22)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define Ls_yyyz              Ls(23)
#define L_xxxxx              L(24)
#define Ls_xxxxx             Ls(24)
#define L_xxxxy              L(25)
#define Ls_xxxxy             Ls(25)
#define L_xxxxz              L(26)
#define Ls_xxxxz             Ls(26)
#define Ls_xxxyy             Ls(27)
#define L_xxxyy              L(27)
#define Ls_xxxyz             Ls(28)
#define L_xxxyz              L(28)
#define L_xxyyy              L(29)
#define Ls_xxyyy             Ls(29)
#define L_xxyyz              L(30)
#define Ls_xxyyz             Ls(30)
#define Ls_xyyyy             Ls(31)
#define L_xyyyy              L(31)
#define Ls_xyyyz             Ls(32)
#define L_xyyyz              L(32)
#define Ls_yyyyy             Ls(33)
#define L_yyyyy              L(33)
#define Ls_yyyyz             Ls(34)
#define L_yyyyz              L(34)
    v0       = L_xxxx + L_xxxxy*y + L_xxxxz*z
    v1       = L_xxxy + L_xxxyz*z
    v2       = L_xxxyy*y + v1
    v3       = L_xxyy + L_xxyyz*z
    v4       = L_xxyyy*y + v3
    v5       = L_xyyy + L_xyyyz*z
    v6       = L_xyyyy*y + v5
    v7       = L_yyyy + L_yyyyz*z
    v8       = L_xxxz*z
    v15      = v1*y
    v17      = L_xxyz*z
    v20      = v3*y
    v23      = L_xxz*z
    v33      = 0.5d0*x
    v39      = L_xyyz*z
    v42      = v5*y
    v45      = L_xyz*z
    v63      = 0.166666666666667d0*y
    v66      = 0.166666666666667d0*x
    v74      = L_yyyz*z
    v77      = L_yyz*z
    v79      = 0.5d0*y
    Ls_xxxx  = L_xxxxx*x + v0
    Ls_xxxy  = L_xxxxy*x + v2
    Ls_xxyy  = L_xxxyy*x + v4
    Ls_xyyy  = L_xxyyy*x + v6
    Ls_yyyy  = v7 + L_xyyyy*x + L_yyyyy*y
    Ls_xxxxx = L_xxxxx
    Ls_xxxxy = L_xxxxy
    Ls_xxxxz = L_xxxxz
    Ls_xxxyy = L_xxxyy
    Ls_xxxyz = L_xxxyz
    Ls_xxyyy = L_xxyyy
    Ls_xxyyz = L_xxyyz
    Ls_xyyyy = L_xyyyy
    Ls_xyyyz = L_xyyyz
    Ls_yyyyy = L_yyyyy
    Ls_yyyyz = L_yyyyz
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    v68      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v84      = L_yzz*z
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    v35      = L_xxzz*z
    L_xyzz   = -(L_xxxy + L_xyyy)
    v52      = L_xyzz*z
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    v81      = L_yyzz*z
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    v16      = L_xxxz + L_xxxyz*y + L_xxxzz*z
    Ls_xxxz  = L_xxxxz*x + v16
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    v21      = L_xxyz + L_xxyzz*z
    v22      = L_xxyyz*y + v21
    v38      = v21*y
    Ls_xxyz  = L_xxxyz*x + v22
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    v43      = L_xyyz + L_xyyzz*z
    v44      = L_xyyyz*y + v43
    v55      = v43*y
    Ls_xyyz  = L_xxyyz*x + v44
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    v76      = L_yyyz + L_yyyzz*z
    Ls_yyyz  = v76 + L_xyyyz*x + L_yyyyz*y
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v9       = a2
    v10      = 0.5d0*v9
    v65      = 0.25d0*v9
    a3       = a1*a2
    v24      = 0.166666666666667d0*a3
    a4       = a2*a2
    v56      = 0.0416666666666667d0*a4
    a5       = a2*a3
    b2       = b1*b1
    v11      = b2
    v12      = L_xxxyy*v11
    v18      = L_xxyyy*v11
    v30      = 0.5d0*v11
    v36      = L_xxyyz*v11
    v40      = L_xyyyy*v11
    v53      = L_xyyyz*v11
    v62      = 0.25d0*v11
    v67      = 3.0d0*v11
    b3       = b1*b2
    v25      = b3
    v26      = L_xxyyy*v25
    v46      = L_xyyyy*v25
    v61      = 0.166666666666667d0*v25
    v69      = L_xyyyz*v25
    b4       = b2*b2
    v57      = 0.0416666666666667d0*b4
    b5       = b2*b3
    c2       = c1*c1
    v13      = c2
    v58      = 0.5d0*v13
    v83      = 3.0d0*v13
    v27      = L_xxzz*v13
    v47      = L_xyzz*v13
    v14      = L_xxxzz*v13
    v34      = v12 + v14 + 2.0d0*(L_xxx + v15 + v8)
    Ls_xxx   = 0.5d0*(v12 + v14) + L_xxx + L_xxxxx*v10 + v0*x + v15 + v8
    v19      = L_xxyzz*v13
    v31      = v19 + 2.0d0*(L_xxy + v17)
    v32      = v31*y
    v51      = 2.0d0*v20 + v18 + v31
    Ls_xxy   = 0.5d0*(v18 + v19) + L_xxxxy*v10 + L_xxy + v17 + v2*x + v20
    v37      = L_xxzzz*v13
    v73      = v36 + v37 + 2.0d0*(L_xxz + v35 + v38)
    Ls_xxz   = 0.5d0*(v36 + v37) + L_xxxxz*v10 + L_xxz + v16*x + v35 + v38
    v41      = L_xyyzz*v13
    v49      = v41 + 2.0d0*(L_xyy + v39)
    v50      = v49*y
    Ls_xyy   = 0.5d0*(v40 + v41) + L_xxxyy*v10 + L_xyy + v39 + v4*x + v42
    v54      = L_xyzzz*v13
    v71      = v54 + 2.0d0*(L_xyz + v52)
    v72      = v71*y
    Ls_xyz   = 0.5d0*(v53 + v54) + L_xxxyz*v10 + L_xyz + v22*x + v52 + v55
    v75      = L_yyyzz*v13
    v80      = v75 + 2.0d0*(L_yyy + v74)
    Ls_yyy   = 0.5d0*v75 + L_xxyyy*v10 + L_yyy + L_yyyyy*v30 + v6*x + v7*y + v74
    v82      = L_yyzzz*v13
    v86      = v82 + 2.0d0*(L_yyz + v81)
    Ls_yyz   = 0.5d0*v82 + L_xxyyz*v10 + L_yyyyz*v30 + L_yyz + v44*x + v76*y + v81
    h        = v11 + v13 + v9
    u2       = 1.0/h
    u        = sqrt(u2)
    u3       = u*u2
    u4       = u2*u2
    u5       = u2*u3
    u6       = u3*u3
    u7       = u3*u4
    u8       = u4*u4
    u9       = u4*u5
    u10      = u5*u5
    u11      = u5*u6
    c3       = c1*c2
    v28      = c3
    v59      = 0.166666666666667d0*v28
    v29      = L_xxzzz*v28
    Ls_xx    = 0.166666666666667d0*(v26 + v29 + 3.0d0*(v27 + v32)) + L_xx + L_xxxxx*v24 &
      + v0*v10 + v23 + v3*v30 + v33*v34
    v48      = L_xyzzz*v28
    v64      = v48 + 3.0d0*(2.0d0*L_xy + 2.0d0*v45 + v47)
    Ls_xy    = 0.166666666666667d0*(v46 + v48 + 3.0d0*(v47 + v50)) + L_xxxxy*v24 + L_xy &
      + v10*v2 + v30*v5 + v33*v51 + v45
    v70      = L_xzzzz*v28
    Ls_xz    = 0.166666666666667d0*(v69 + v70 + 3.0d0*v72) + L_xxxxz*v24 + L_xz + &
      L_xzzz*v58 + v10*v16 + v30*v43 + v33*v73 + v68
    v78      = L_yyzzz*v28
    Ls_yy    = 0.166666666666667d0*v78 + L_xxxyy*v24 + L_yy + L_yyyyy*v61 + L_yyzz*v58 &
      + v10*v4 + v30*v7 + v33*(v40 + 2.0d0*v42 + v49) + v77 + v79*v80
    v85      = L_yzzzz*v28
    Ls_yz    = 0.166666666666667d0*v85 + L_xxxyz*v24 + L_yyyyz*v61 + L_yz + L_yzzz*v58 &
      + v10*v22 + v30*v76 + v33*(v53 + 2.0d0*v55 + v71) + v79*v86 + v84
    c4       = c2*c2
    v60      = 0.0416666666666667d0*c4
    Ls_x     = L_x + L_xxxxx*v56 + L_xyyyy*v57 + L_xz*z + L_xzz*v58 + L_xzzz*v59 + &
      L_xzzzz*v60 + v0*v24 + v34*v65 + v49*v62 + v5*v61 + v63*v64 + v66 &
      *(6.0d0*L_xx + 6.0d0*v23 + v26 + 3.0d0*v27 + v29 + v3*v67 + 3.0d0 &
      *v32)
    Ls_y     = L_y + L_xxxxy*v56 + L_yyyyy*v57 + L_yz*z + L_yzz*v58 + L_yzzz*v59 + &
      L_yzzzz*v60 + v2*v24 + v51*v65 + v61*v7 + v62*v80 + v63*(6.0d0* &
      L_yy + L_yyzz*v83 + 6.0d0*v77 + v78) + v66*(v46 + v5*v67 + 3.0d0* &
      v50 + v64)
    Ls_z     = L_z + L_xxxxz*v56 + L_yyyyz*v57 + L_zz*z + L_zzz*v58 + L_zzzz*v59 + &
      L_zzzzz*v60 + v16*v24 + v61*v76 + v62*v86 + v63*(6.0d0*L_yz + &
      L_yzzz*v83 + 6.0d0*v84 + v85) + v65*v73 + v66*(6.0d0*L_xz + &
      L_xzzz*v83 + v43*v67 + 6.0d0*v68 + v69 + v70 + 3.0d0*v72)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  L_xx                
#undef  Ls_xx               
#undef  Ls_xy               
#undef  L_xy                
#undef  Ls_xz               
#undef  L_xz                
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
#undef  L_xxxx              
#undef  Ls_xxxx             
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  L_xxxz              
#undef  Ls_xxxz             
#undef  Ls_xxyy             
#undef  L_xxyy              
#undef  Ls_xxyz             
#undef  L_xxyz              
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
#undef  L_xxxxx             
#undef  Ls_xxxxx            
#undef  L_xxxxy             
#undef  Ls_xxxxy            
#undef  L_xxxxz             
#undef  Ls_xxxxz            
#undef  Ls_xxxyy            
#undef  L_xxxyy             
#undef  Ls_xxxyz            
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  Ls_xxyyy            
#undef  L_xxyyz             
#undef  Ls_xxyyz            
#undef  Ls_xyyyy            
#undef  L_xyyyy             
#undef  Ls_xyyyz            
#undef  L_xyyyz             
#undef  Ls_yyyyy            
#undef  L_yyyyy             
#undef  Ls_yyyyz            
#undef  L_yyyyz             
    end subroutine mom_es_L2L
    
! OPS  94*ADD + 2*DIV + 141*MUL + 20*NEG + POW = 258  (411 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v3, v4, v5, v6, v7, v8, v9, h, u,&
                L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz,&
                L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz,&
                L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Phi_x                Phi(0)
#define x                    r(1)
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
#define L_xxxxx              L(24)
#define L_xxxxy              L(25)
#define L_xxxxz              L(26)
#define L_xxxyy              L(27)
#define L_xxxyz              L(28)
#define L_xxyyy              L(29)
#define L_xxyyz              L(30)
#define L_xyyyy              L(31)
#define L_xyyyz              L(32)
#define L_yyyyy              L(33)
#define L_yyyyz              L(34)
    v9      = L_xyyy + L_xyyyz*z
    v13     = 2.0d0*z
    v15     = 0.166666666666667d0*y
    v16     = 6.0d0*z
    v21     = 2.0d0*y
    v22     = L_xxxy + L_xxxyz*z
    v23     = 0.166666666666667d0*x
    v25     = L_xxyy + L_xxyyz*z
    v26     = 3.0d0*y
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    L_yzz   = -(L_xxy + L_yyy)
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    L_xyzz  = -(L_xxxy + L_xyyy)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    L_xxxzz = -(L_xxxxx + L_xxxyy)
    L_xxyzz = -(L_xxxxy + L_xxyyy)
    L_xxzzz = -(L_xxxxz + L_xxyyz)
    L_xyyzz = -(L_xxxyy + L_xyyyy)
    L_xyzzz = -(L_xxxyz + L_xyyyz)
    L_xzzzz = -(L_xxxzz + L_xyyzz)
    L_yyyzz = -(L_xxyyy + L_yyyyy)
    L_yyzzz = -(L_xxyyz + L_yyyyz)
    L_yzzzz = -(L_xxyzz + L_yyyzz)
    L_zzzzz = -(L_xxzzz + L_yyzzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v19     = a2
    v20     = 0.25d0*v19
    a3      = a1*a2
    v10     = 0.166666666666667d0*a3
    a4      = a2*a2
    v0      = 0.0416666666666667d0*a4
    a5      = a2*a3
    b2      = b1*b1
    v11     = b2
    v12     = 0.25d0*v11
    v24     = 3.0d0*v11
    b3      = b1*b2
    v7      = b3
    v8      = 0.166666666666667d0*v7
    b4      = b2*b2
    v1      = 0.0416666666666667d0*b4
    b5      = b2*b3
    c2      = c1*c1
    v2      = c2
    v3      = 0.5d0*v2
    v17     = 3.0d0*v2
    v27     = 2.0d0*L_xxy + L_xxyz*v13 + L_xxyzz*v2
    v14     = 2.0d0*L_xyy + L_xyyz*v13 + L_xyyzz*v2
    h       = v11 + v19 + v2
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    u4      = u2*u2
    u5      = u2*u3
    u6      = u3*u3
    u7      = u3*u4
    u8      = u4*u4
    u9      = u4*u5
    u10     = u5*u5
    u11     = u5*u6
    c3      = c1*c2
    v4      = c3
    v5      = 0.166666666666667d0*v4
    v18     = 6.0d0*L_xy + L_xyz*v16 + L_xyzz*v17 + L_xyzzz*v4
    c4      = c2*c2
    v6      = 0.0416666666666667d0*c4
    Phi_x   = L_x + L_xxxxx*v0 + L_xyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + L_xzzzz* &
      v6 + v10*(L_xxxx + L_xxxxy*y + L_xxxxz*z) + v12*v14 + v15*v18 + &
      v20*(2.0d0*L_xxx + L_xxxyy*v11 + L_xxxz*v13 + L_xxxzz*v2 + v21* &
      v22) + v23*(6.0d0*L_xx + L_xxyyy*v7 + L_xxz*v16 + L_xxzz*v17 + &
      L_xxzzz*v4 + v24*v25 + v26*v27) + v8*v9
    Phi_y   = L_y + L_xxxxy*v0 + L_yyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + L_yzzzz* &
      v6 + v10*(L_xxxyy*y + v22) + v12*(2.0d0*L_yyy + L_yyyz*v13 + &
      L_yyyzz*v2) + v15*(6.0d0*L_yy + L_yyz*v16 + L_yyzz*v17 + L_yyzzz* &
      v4) + v20*(L_xxyyy*v11 + v21*v25 + v27) + v23*(L_xyyyy*v7 + v14* &
      v26 + v18 + v24*v9) + v8*(L_yyyy + L_yyyyz*z)
    Phi_z   = L_z + L_xxxxz*v0 + L_yyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + L_zzzzz* &
      v6 + v10*(L_xxxyz*y + L_xxxz + L_xxxzz*z) + v12*(2.0d0*L_yyz + &
      L_yyzz*v13 + L_yyzzz*v2) + v15*(6.0d0*L_yz + L_yzz*v16 + L_yzzz* &
      v17 + L_yzzzz*v4) + v20*(L_xxyyz*v11 + 2.0d0*L_xxz + L_xxzz*v13 + &
      L_xxzzz*v2 + v21*(L_xxyz + L_xxyzz*z)) + v23*(L_xyyyz*v7 + 6.0d0* &
      L_xz + L_xzz*v16 + L_xzzz*v17 + L_xzzzz*v4 + v24*(L_xyyz + &
      L_xyyzz*z) + v26*(2.0d0*L_xyz + L_xyzz*v13 + L_xyzzz*v2)) + v8*( &
      L_yyyz + L_yyyzz*z)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_x               
#undef  x                   
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
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
    end subroutine mom_es_L2P
    
! OPS  124*ADD + 221*MUL + 21*NEG + 37*SUB = 403  (624 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v7, v8,&
                v9, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz,&
                S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_yyy,&
                S_yyz, S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz, S_xyyy, S_xyyz,&
                S_yyyy, S_yyyz
#define y                    r(2)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
#define z                    r(3)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define M_xy                 M(2)
#define Ms_xy                Ms(2)
#define M_xz                 M(3)
#define Ms_xz                Ms(3)
#define Ms_yy                Ms(4)
#define M_yy                 M(4)
#define Ms_yz                Ms(5)
#define M_yz                 M(5)
#define Ms_xxx               Ms(6)
#define M_xxx                M(6)
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
#define M_yyz                M(12)
#define Ms_yyz               Ms(12)
#define M_xxxx               M(13)
#define Ms_xxxx              Ms(13)
#define M_xxxy               M(14)
#define Ms_xxxy              Ms(14)
#define Ms_xxxz              Ms(15)
#define M_xxxz               M(15)
#define Ms_xxyy              Ms(16)
#define M_xxyy               M(16)
#define Ms_xxyz              Ms(17)
#define M_xxyz               M(17)
#define M_xyyy               M(18)
#define Ms_xyyy              Ms(18)
#define Ms_xyyz              Ms(19)
#define M_xyyz               M(19)
#define M_yyyy               M(20)
#define Ms_yyyy              Ms(20)
#define M_yyyz               M(21)
#define Ms_yyyz              Ms(21)
    v0      = x*y
    v1      = x*z
    v2      = y*z
    v7      = M_xx*x
    v8      = M_xy*y
    v9      = M_xz*z
    v12     = M_xy*x
    v13     = M_yy*y
    v14     = M_yz*z
    v15     = M_xx*z
    v16     = M_xz*x
    v17     = M_yy*z
    v18     = M_yz*y
    v28     = M_xxx*x
    v29     = 1.71428571428571d0*y
    v30     = M_xxy*v29
    v31     = M_xxz*z
    v37     = 0.857142857142857d0*M_xyz
    v40     = M_xxy*x
    v43     = M_xyy*y
    v45     = M_xxx*z
    v46     = M_xxz*x
    v48     = M_xyy*z
    v53     = 1.71428571428571d0*x
    v54     = M_xyy*v53
    v55     = M_yyy*y
    v56     = M_yyz*z
    v59     = M_xxy*z
    v62     = M_yyy*z
    v63     = M_yyz*y
    Ms_0    = Ms_0 + (M_0)
    M_zz    = -(M_xx + M_yy)
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    M_xxzz  = -(M_xxxx + M_xxyy)
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    S_0     = 1
    S_x     = x
    S_y     = y
    S_z     = z
    S_xy    = v0
    v24     = M_xy*S_xy
    v39     = M_xx*S_xy
    v44     = M_yy*S_xy
    v51     = M_yz*S_xy
    v61     = M_xz*S_xy
    Ms_xy   = Ms_xy + (M_0*S_xy + M_xy)
    S_xz    = v1
    v32     = M_xz*S_xz
    v50     = M_yy*S_xz
    v60     = M_xy*S_xz
    Ms_xz   = Ms_xz + (M_0*S_xz + M_xz)
    S_yz    = v2
    v34     = M_yz*S_yz
    v38     = -0.142857142857143d0*(7.0d0*v37*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v47     = M_xy*S_yz
    v58     = M_xx*S_yz
    Ms_yz   = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz   = v0*z
    Ms_xyz  = Ms_xyz + (M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v3      = a2
    a3      = a1*a2
    a4      = a2*a2
    a5      = a2*a3
    b2      = b1*b1
    v4      = b2
    b3      = b1*b2
    b4      = b2*b2
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v3 + v4
    v5      = -0.333333333333333d0*h
    v6      = -0.6d0*h
    v10     = -0.2d0*h
    v11     = v10 + v3
    v19     = v10 + v4
    v20     = h*h
    v21     = 0.0857142857142857d0*v20
    v22     = 0.857142857142857d0*h
    v35     = -0.428571428571429d0*h
    v36     = v3 + v35
    v52     = 0.142857142857143d0*h
    v57     = -v52
    v65     = v35 + v4
    S_xx    = v3 + v5
    v25     = M_yy*S_xx
    v27     = M_xx*S_xx
    v41     = M_xy*S_xx
    v64     = M_yz*S_xx
    Ms_xx   = Ms_xx + (M_0*S_xx + M_xx)
    S_yy    = v4 + v5
    v23     = M_xx*S_yy
    v26     = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v24 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v23 + 4.0d0*v25))
    v33     = M_yy*S_yy
    v42     = M_xy*S_yy
    v49     = M_xz*S_yy
    Ms_yy   = Ms_yy + (M_0*S_yy + M_yy)
    S_zz    = -(S_xx + S_yy)
    S_xxx   = x*(v3 + v6)
    Ms_xxx  = Ms_xxx + (0.2d0*(9.0d0*v7 + 3.0d0*(-2.0d0*v8 - 2.0d0*v9)) + M_0*S_xxx + M_xxx)
    S_xxy   = v11*y
    Ms_xxy  = Ms_xxy + (0.2d0*(8.0d0*v12 + 2.0d0*(-v13 - v14)) + M_0*S_xxy + M_xx*y + M_xxy)
    S_xxz   = v11*z
    Ms_xxz  = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v15 + 8.0d0*v16 + 2.0d0*(v17 - v18)))
    S_xyy   = v19*x
    Ms_xyy  = Ms_xyy + (0.2d0*(8.0d0*v8 + 2.0d0*(-v7 - v9)) + M_0*S_xyy + M_xyy + M_yy*x)
    S_yyy   = y*(v4 + v6)
    Ms_yyy  = Ms_yyy + (0.2d0*(9.0d0*v13 + 3.0d0*(-2.0d0*v12 - 2.0d0*v14)) + M_0*S_yyy + M_yyy)
    S_yyz   = v19*z
    Ms_yyz  = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v17 + 8.0d0*v18 + 2.0d0*(v15 - v16)))
    S_xxxx  = -v22*v3 + a4 + v21
    Ms_xxxx = Ms_xxxx + (M_0*S_xxxx + v26 - v30 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v27 + 80.0d0*v28 - 60.0d0*v31 - 96.0d0*v32 + &
      24.0d0*(v33 + v34)))
    S_xxxy  = v0*v36
    Ms_xxxy = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + v38 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v39 + 5.0d0*v40 + 5.0d0*v41 - 2.0d0*v42 - 2.0d0*v43 - 2.0d0*v44)))
    S_xxxz  = v1*v36
    Ms_xxxz = Ms_xxxz + (M_0*S_xxxz + M_xxxz - v37*y + 0.142857142857143d0*(13.0d0*v45 + 15.0d0* &
      v46 + 21.0d0*(M_xx*S_xz + M_xz*S_xx) + 6.0d0*(-v47 + v48 + v49 + &
      v50 - v51)))
    S_xxyy  = 0.0285714285714286d0*v20 + v3*v4 - v3*v52 - v4*v52
    Ms_xxyy = Ms_xxyy + (M_0*S_xxyy + v30 + v54 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v24 + 39.0d0*(v23 + v25) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v27 + 10.0d0*v28 + 10.0d0*v31 + 12.0d0*v32 + 12.0d0*v33 + &
      12.0d0*v34 + 10.0d0*v55 + 10.0d0*v56)))
    S_xxyz  = v2*(v3 + v57)
    Ms_xxyz = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v60 + v61) + 2.0d0*(v62 - v63) + 9.0d0*(v58 &
      + v59 + v64)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v53)
    S_xyyy  = v0*v65
    Ms_xyyy = Ms_xyyy + (M_0*S_xyyy + M_xyyy + M_yyy*x + v38 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v39 - 2.0d0*v40 - 2.0d0*v41 + 5.0d0*v42 + 5.0d0*v43 + 5.0d0*v44 &
      )))
    S_xyyz  = v1*(v4 + v57)
    Ms_xyyz = Ms_xyyz + (0.142857142857143d0*(2.0d0*(v45 - v46) + 12.0d0*(v47 + v51) + 9.0d0*(v48 &
      + v49 + v50)) + M_0*S_xyyz + M_xyyz + M_xyz*v29 + M_yyz*x)
    S_yyyy  = -v22*v4 + b4 + v21
    Ms_yyyy = Ms_yyyy + (M_0*S_yyyy + v26 - v54 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v33 - 96.0d0*v34 + 80.0d0*v55 - 60.0d0*v56 + &
      24.0d0*(v27 + v32)))
    S_yyyz  = v2*v65
    Ms_yyyz = Ms_yyyz + (M_0*S_yyyz + M_yyyz - v37*x + 0.142857142857143d0*(13.0d0*v62 + 15.0d0* &
      v63 + 21.0d0*(M_yy*S_yz + M_yz*S_yy) + 6.0d0*(v58 + v59 - v60 - &
      v61 + v64)))
#undef  y                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
#undef  z                   
#undef  M_xx                
#undef  Ms_xx               
#undef  M_xy                
#undef  Ms_xy               
#undef  M_xz                
#undef  Ms_xz               
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
#undef  Ms_xxx              
#undef  M_xxx               
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
#undef  M_yyz               
#undef  Ms_yyz              
#undef  M_xxxx              
#undef  Ms_xxxx             
#undef  M_xxxy              
#undef  Ms_xxxy             
#undef  Ms_xxxz             
#undef  M_xxxz              
#undef  Ms_xxyy             
#undef  M_xxyy              
#undef  Ms_xxyz             
#undef  M_xxyz              
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
    end subroutine mom_es_M2M_add
    
! OPS  237*ADD + 2*DIV + 405*MUL + 41*NEG + POW + 14*SUB = 700  (1010 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz,&
                D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz,&
                D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz,&
                D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(0)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define M_xz                 M(3)
#define L_xx                 L(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define M_yz                 M(5)
#define L_xz                 L(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
#define M_xxy                M(7)
#define L_yz                 L(7)
#define M_xxz                M(8)
#define L_xxx                L(8)
#define L_xxy                L(9)
#define M_xyy                M(9)
#define M_xyz                M(10)
#define L_xxz                L(10)
#define L_xyy                L(11)
#define M_yyy                M(11)
#define L_xyz                L(12)
#define M_yyz                M(12)
#define L_yyy                L(13)
#define M_xxxx               M(13)
#define L_yyz                L(14)
#define M_xxxy               M(14)
#define L_xxxx               L(15)
#define M_xxxz               M(15)
#define M_xxyy               M(16)
#define L_xxxy               L(16)
#define L_xxxz               L(17)
#define M_xxyz               M(17)
#define M_xyyy               M(18)
#define L_xxyy               L(18)
#define M_xyyz               M(19)
#define L_xxyz               L(19)
#define L_xyyy               L(20)
#define M_yyyy               M(20)
#define M_yyyz               M(21)
#define L_xyyz               L(21)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define L_xxxxx              L(24)
#define L_xxxxy              L(25)
#define L_xxxxz              L(26)
#define L_xxxyy              L(27)
#define L_xxxyz              L(28)
#define L_xxyyy              L(29)
#define L_xxyyz              L(30)
#define L_xyyyy              L(31)
#define L_xyyyz              L(32)
#define L_yyyyy              L(33)
#define L_yyyyz              L(34)
    v91     = y*z
    v88     = 15.0d0*v91
    v40     = 0.5d0*M_xx
    v46     = 0.166666666666667d0*M_xxx
    v47     = 0.5d0*M_xxy
    v48     = 0.5d0*M_xxz
    v56     = 0.5d0*M_yy
    v58     = 0.166666666666667d0*M_yyy
    v63     = 0.0416666666666667d0*M_xxxx
    v64     = 0.166666666666667d0*M_xxxy
    v65     = 0.166666666666667d0*M_xxxz
    v66     = 0.25d0*M_xxyy
    v67     = 0.5d0*M_xxyz
    v69     = 0.0416666666666667d0*M_yyyy
    v70     = 0.166666666666667d0*M_yyyz
    v71     = 0.5d0*M_yyz
    v76     = 0.5d0*M_xyy
    v78     = 0.166666666666667d0*M_xyyy
    M_zz    = -(M_xx + M_yy)
    v73     = 0.5d0*M_zz
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    v77     = 0.5d0*M_yzz
    M_zzz   = -(M_xxz + M_yyz)
    v74     = 0.166666666666667d0*M_zzz
    M_xxzz  = -(M_xxxx + M_xxyy)
    v68     = 0.25d0*M_xxzz
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    v72     = 0.25d0*M_yyzz
    M_yzzz  = -(M_xxyz + M_yyyz)
    v79     = 0.166666666666667d0*M_yzzz
    M_zzzz  = -(M_xxzz + M_yyzz)
    v75     = 0.0416666666666667d0*M_zzzz
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v80     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v80
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v81     = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v81
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v82     = 3.0d0*h
    v83     = h*v0
    v84     = h*v1
    v4      = -h
    v12     = v82
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v83
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v84
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 - 945.0d0*v19 + 630.0d0*v83
    v38     = -(v18 + 63.0d0*v26)
    v55     = v35 - 945.0d0*v30 + 630.0d0*v84
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    v2      = u3
    D_x     = -v2*x
    D_y     = -v2*y
    D_z     = -v2*z
    u4      = u2*u2
    u5      = u2*u3
    v3      = u5
    v85     = 3.0d0*v3
    v6      = v85*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v85*v91
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v86     = 3.0d0*v8
    v9      = v8*x
    v11     = v86*(h - v10)
    D_xxx   = -3.0d0*v9*(v80 - v82)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    D_xyz   = -v88*v9
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = v86*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v87     = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v87*y
    v25     = v87*z
    v27     = v15*v88
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    L_xxxx  = L_xxxx + (D_xxxx*M_0)
    D_xxxy  = v21*v24
    L_xxxy  = L_xxxy + (D_xxxy*M_0)
    D_xxxz  = v24*v25
    L_xxxz  = L_xxxz + (D_xxxz*M_0)
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    v49     = 0.5d0*D_xxyy
    L_xxyy  = L_xxyy + (D_xxyy*M_0)
    D_xxyz  = v27*(v23 + v4)
    L_xxyz  = L_xxyz + (D_xxyz*M_0)
    D_xxzz  = -(D_xxxx + D_xxyy)
    v52     = 0.5d0*D_xxzz
    D_xyyy  = v21*v29
    L_xyyy  = L_xyyy + (D_xyyy*M_0)
    D_xyyz  = v25*(v28 + v4)
    L_xyyz  = L_xyyz + (D_xyyz*M_0)
    D_xyzz  = -(D_xxxy + D_xyyy)
    v60     = 0.5d0*D_xyzz
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    L_yyyy  = L_yyyy + (D_yyyy*M_0)
    D_yyyz  = v27*v29
    L_yyyz  = L_yyyz + (D_yyyz*M_0)
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v89     = 15.0d0*v32
    v90     = v32*z
    v33     = v89*x
    v37     = v90
    v39     = 315.0d0*v90*x*y
    v43     = v89*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = L_xxxxx + (D_xxxxx*M_0)
    D_xxxxy = v32*v36*y
    L_xxxxy = L_xxxxy + (D_xxxxy*M_0)
    D_xxxxz = v36*v37
    L_xxxxz = L_xxxxz + (D_xxxxz*M_0)
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    v41     = 0.5d0*D_xxxyy
    L_xxxyy = L_xxxyy + (D_xxxyy*M_0)
    D_xxxyz = v39*(h - v5)
    L_xxxyz = L_xxxyz + (D_xxxyz*M_0)
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    v42     = 0.5d0*D_xxxzz
    L_xxx   = L_xxx + (D_xxx*M_0 + D_xxxxx*v40 + D_xxxxy*M_xy + D_xxxxz*M_xz + D_xxxyz*M_yz + &
      M_yy*v41 + M_zz*v42)
    D_xxyyy = v43*(v38 + h*v28 + 21.0d0*v20)
    v44     = 0.5d0*D_xxyyy
    v50     = 0.166666666666667d0*D_xxyyy
    L_xxyyy = L_xxyyy + (D_xxyyy*M_0)
    D_xxyyz = v37*(v34 - 945.0d0*v81 + 105.0d0*(v83 + v84))
    v51     = 0.5d0*D_xxyyz
    L_xxyyz = L_xxyyz + (D_xxyyz*M_0)
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    v45     = 0.5d0*D_xxyzz
    L_xxy   = L_xxy + (D_xxxxy*v40 + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + &
      M_yy*v44 + M_zz*v45)
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    v53     = 0.166666666666667d0*D_xxzzz
    v54     = 0.5d0*D_xxzzz
    L_xx    = L_xx + (D_xx*M_0 + D_xxxx*v40 + D_xxxxx*v46 + D_xxxxy*v47 + D_xxxxz*v48 + D_xxxy &
      *M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + M_xyy*v41 + &
      M_xzz*v42 + M_yy*v49 + M_yyy*v50 + M_yyz*v51 + M_yzz*v45 + M_zz* &
      v52 + M_zzz*v53)
    L_xxz   = L_xxz + (D_xxxxz*v40 + D_xxxyz*M_xy + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_yy*v51 + M_zz*v54)
    D_xyyyy = v32*v55*x
    L_xyyyy = L_xyyyy + (D_xyyyy*M_0)
    D_xyyyz = v39*(h - v7)
    v59     = 0.5d0*D_xyyyz
    L_xyyyz = L_xyyyz + (D_xyyyz*M_0)
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    v57     = 0.5d0*D_xyyzz
    L_xyy   = L_xyy + (D_xxxyy*v40 + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v56 + &
      D_xyyyz*M_yz + M_zz*v57)
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    v61     = 0.166666666666667d0*D_xyzzz
    v62     = 0.5d0*D_xyzzz
    L_xy    = L_xy + (D_xxxxy*v46 + D_xxxy*v40 + D_xxxyy*v47 + D_xxxyz*v48 + D_xxyy*M_xy + &
      D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v56 + D_xyyyy*v58 &
      + D_xyyz*M_yz + M_xyy*v44 + M_xzz*v45 + M_yyz*v59 + M_yzz*v57 + &
      M_zz*v60 + M_zzz*v61)
    L_xyz   = L_xyz + (D_xxxyz*v40 + D_xxyyz*M_xy + D_xxyzz*M_xz + D_xyyyz*v56 + D_xyyzz*M_yz + &
      D_xyz*M_0 + M_zz*v62)
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = L_x + (D_x*M_0 + D_xxx*v40 + D_xxxx*v46 + D_xxxxx*v63 + D_xxxxy*v64 + D_xxxxz* &
      v65 + D_xxxy*v47 + D_xxxyy*v66 + D_xxxyz*v67 + D_xxxz*v48 + &
      D_xxxzz*v68 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v56 &
      + D_xyyy*v58 + D_xyyyy*v69 + D_xyyyz*v70 + D_xyyz*v71 + D_xyyzz* &
      v72 + D_xyz*M_yz + D_xzz*v73 + D_xzzz*v74 + D_xzzzz*v75 + M_xyy* &
      v49 + M_xyyy*v50 + M_xyyz*v51 + M_xyzz*v45 + M_xzz*v52 + M_xzzz* &
      v53 + M_yzz*v60 + M_yzzz*v61)
    L_xz    = L_xz + (D_xxxxz*v46 + D_xxxyz*v47 + D_xxxz*v40 + D_xxxzz*v48 + D_xxyz*M_xy + &
      D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyz*v58 + D_xyyz*v56 + D_xyyzz* &
      v71 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v73 + D_xzzzz*v74 + M_xyy* &
      v51 + M_xzz*v54 + M_yzz*v62)
    D_yyyyy = v43*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = L_yyyyy + (D_yyyyy*M_0)
    D_yyyyz = v37*v55
    L_yyyyz = L_yyyyz + (D_yyyyz*M_0)
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = L_yyy + (D_xxyyy*v40 + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyyy*v56 + &
      D_yyyyz*M_yz + D_yyyzz*v73)
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = L_yy + (D_xxxyy*v46 + D_xxyy*v40 + D_xxyyy*v47 + D_xxyyz*v48 + D_xyyy*M_xy + &
      D_xyyyy*v76 + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v56 &
      + D_yyyyy*v58 + D_yyyyz*v71 + D_yyyz*M_yz + D_yyyzz*v77 + D_yyzz* &
      v73 + D_yyzzz*v74 + M_xzz*v57)
    L_yyz   = L_yyz + (D_xxyyz*v40 + D_xyyyz*M_xy + D_xyyzz*M_xz + D_yyyyz*v56 + D_yyyzz*M_yz + &
      D_yyz*M_0 + D_yyzzz*v73)
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = L_y + (D_xxxxy*v63 + D_xxxy*v46 + D_xxxyy*v64 + D_xxxyz*v65 + D_xxy*v40 + &
      D_xxyy*v47 + D_xxyyy*v66 + D_xxyyz*v67 + D_xxyz*v48 + D_xxyzz*v68 &
      + D_xyy*M_xy + D_xyyy*v76 + D_xyyyy*v78 + D_xyyz*M_xyz + D_xyz* &
      M_xz + D_y*M_0 + D_yyy*v56 + D_yyyy*v58 + D_yyyyy*v69 + D_yyyyz* &
      v70 + D_yyyz*v71 + D_yyyzz*v72 + D_yyz*M_yz + D_yyzz*v77 + &
      D_yyzzz*v79 + D_yzz*v73 + D_yzzz*v74 + D_yzzzz*v75 + M_xyyz*v59 + &
      M_xyzz*v57 + M_xzz*v60 + M_xzzz*v61)
    L_yz    = L_yz + (D_xxxyz*v46 + D_xxyyz*v47 + D_xxyz*v40 + D_xxyzz*v48 + D_xyyyz*v76 + &
      D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyz*v58 + D_yyyz* &
      v56 + D_yyyzz*v71 + D_yyzz*M_yz + D_yyzzz*v77 + D_yz*M_0 + D_yzzz &
      *v73 + D_yzzzz*v74 + M_xzz*v62)
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_z     = L_z + (0.166666666666667d0*(3.0d0*D_xzzz*M_xzz + D_xzzzz*M_xzzz) + D_xxxxz*v63 &
      + D_xxxyz*v64 + D_xxxz*v46 + D_xxxzz*v65 + D_xxyyz*v66 + D_xxyz* &
      v47 + D_xxyzz*v67 + D_xxz*v40 + D_xxzz*v48 + D_xxzzz*v68 + &
      D_xyyyz*v78 + D_xyyz*v76 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz &
      + D_yyyyz*v69 + D_yyyz*v58 + D_yyyzz*v70 + D_yyz*v56 + D_yyzz*v71 &
      + D_yyzzz*v72 + D_yzz*M_yz + D_yzzz*v77 + D_yzzzz*v79 + D_z*M_0 + &
      D_zzz*v73 + D_zzzz*v74 + D_zzzzz*v75 + M_xyyz*v57 + M_xyzz*v62)
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  M_yz                
#undef  L_xz                
#undef  L_yy                
#undef  M_xxx               
#undef  M_xxy               
#undef  L_yz                
#undef  M_xxz               
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xyy               
#undef  M_xyz               
#undef  L_xxz               
#undef  L_xyy               
#undef  M_yyy               
#undef  L_xyz               
#undef  M_yyz               
#undef  L_yyy               
#undef  M_xxxx              
#undef  L_yyz               
#undef  M_xxxy              
#undef  L_xxxx              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxyz              
#undef  M_xyyy              
#undef  L_xxyy              
#undef  M_xyyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
    end subroutine mom_es_M2L_add
    
! OPS  200*ADD + 2*DIV + 233*MUL + 20*NEG + POW = 456  (928 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v9, h, u,&
                L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz,&
                L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz,&
                L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define x                    r(1)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define Ls_xy                Ls(4)
#define L_xy                 L(4)
#define Ls_xz                Ls(5)
#define L_xz                 L(5)
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
#define L_xxxx               L(15)
#define Ls_xxxx              Ls(15)
#define Ls_xxxy              Ls(16)
#define L_xxxy               L(16)
#define L_xxxz               L(17)
#define Ls_xxxz              Ls(17)
#define Ls_xxyy              Ls(18)
#define L_xxyy               L(18)
#define Ls_xxyz              Ls(19)
#define L_xxyz               L(19)
#define L_xyyy               L(20)
#define Ls_xyyy              Ls(20)
#define L_xyyz               L(21)
#define Ls_xyyz              Ls(21)
#define Ls_yyyy              Ls(22)
#define L_yyyy               L(22)
#define L_yyyz               L(23)
#define Ls_yyyz              Ls(23)
#define L_xxxxx              L(24)
#define Ls_xxxxx             Ls(24)
#define L_xxxxy              L(25)
#define Ls_xxxxy             Ls(25)
#define L_xxxxz              L(26)
#define Ls_xxxxz             Ls(26)
#define Ls_xxxyy             Ls(27)
#define L_xxxyy              L(27)
#define Ls_xxxyz             Ls(28)
#define L_xxxyz              L(28)
#define L_xxyyy              L(29)
#define Ls_xxyyy             Ls(29)
#define L_xxyyz              L(30)
#define Ls_xxyyz             Ls(30)
#define Ls_xyyyy             Ls(31)
#define L_xyyyy              L(31)
#define Ls_xyyyz             Ls(32)
#define L_xyyyz              L(32)
#define Ls_yyyyy             Ls(33)
#define L_yyyyy              L(33)
#define Ls_yyyyz             Ls(34)
#define L_yyyyz              L(34)
    v0       = L_xxxx + L_xxxxy*y + L_xxxxz*z
    v1       = L_xxxy + L_xxxyz*z
    v2       = L_xxxyy*y + v1
    v3       = L_xxyy + L_xxyyz*z
    v4       = L_xxyyy*y + v3
    v5       = L_xyyy + L_xyyyz*z
    v6       = L_xyyyy*y + v5
    v7       = L_yyyy + L_yyyyz*z
    v8       = L_xxxz*z
    v15      = v1*y
    v17      = L_xxyz*z
    v20      = v3*y
    v23      = L_xxz*z
    v33      = 0.5d0*x
    v39      = L_xyyz*z
    v42      = v5*y
    v45      = L_xyz*z
    v63      = 0.166666666666667d0*y
    v66      = 0.166666666666667d0*x
    v74      = L_yyyz*z
    v77      = L_yyz*z
    v79      = 0.5d0*y
    Ls_xxxx  = Ls_xxxx + (L_xxxxx*x + v0)
    Ls_xxxy  = Ls_xxxy + (L_xxxxy*x + v2)
    Ls_xxyy  = Ls_xxyy + (L_xxxyy*x + v4)
    Ls_xyyy  = Ls_xyyy + (L_xxyyy*x + v6)
    Ls_yyyy  = Ls_yyyy + (v7 + L_xyyyy*x + L_yyyyy*y)
    Ls_xxxxx = Ls_xxxxx + (L_xxxxx)
    Ls_xxxxy = Ls_xxxxy + (L_xxxxy)
    Ls_xxxxz = Ls_xxxxz + (L_xxxxz)
    Ls_xxxyy = Ls_xxxyy + (L_xxxyy)
    Ls_xxxyz = Ls_xxxyz + (L_xxxyz)
    Ls_xxyyy = Ls_xxyyy + (L_xxyyy)
    Ls_xxyyz = Ls_xxyyz + (L_xxyyz)
    Ls_xyyyy = Ls_xyyyy + (L_xyyyy)
    Ls_xyyyz = Ls_xyyyz + (L_xyyyz)
    Ls_yyyyy = Ls_yyyyy + (L_yyyyy)
    Ls_yyyyz = Ls_yyyyz + (L_yyyyz)
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    v68      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v84      = L_yzz*z
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    v35      = L_xxzz*z
    L_xyzz   = -(L_xxxy + L_xyyy)
    v52      = L_xyzz*z
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    v81      = L_yyzz*z
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    v16      = L_xxxz + L_xxxyz*y + L_xxxzz*z
    Ls_xxxz  = Ls_xxxz + (L_xxxxz*x + v16)
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    v21      = L_xxyz + L_xxyzz*z
    v22      = L_xxyyz*y + v21
    v38      = v21*y
    Ls_xxyz  = Ls_xxyz + (L_xxxyz*x + v22)
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    v43      = L_xyyz + L_xyyzz*z
    v44      = L_xyyyz*y + v43
    v55      = v43*y
    Ls_xyyz  = Ls_xyyz + (L_xxyyz*x + v44)
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    v76      = L_yyyz + L_yyyzz*z
    Ls_yyyz  = Ls_yyyz + (v76 + L_xyyyz*x + L_yyyyz*y)
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v9       = a2
    v10      = 0.5d0*v9
    v65      = 0.25d0*v9
    a3       = a1*a2
    v24      = 0.166666666666667d0*a3
    a4       = a2*a2
    v56      = 0.0416666666666667d0*a4
    a5       = a2*a3
    b2       = b1*b1
    v11      = b2
    v12      = L_xxxyy*v11
    v18      = L_xxyyy*v11
    v30      = 0.5d0*v11
    v36      = L_xxyyz*v11
    v40      = L_xyyyy*v11
    v53      = L_xyyyz*v11
    v62      = 0.25d0*v11
    v67      = 3.0d0*v11
    b3       = b1*b2
    v25      = b3
    v26      = L_xxyyy*v25
    v46      = L_xyyyy*v25
    v61      = 0.166666666666667d0*v25
    v69      = L_xyyyz*v25
    b4       = b2*b2
    v57      = 0.0416666666666667d0*b4
    b5       = b2*b3
    c2       = c1*c1
    v13      = c2
    v58      = 0.5d0*v13
    v83      = 3.0d0*v13
    v27      = L_xxzz*v13
    v47      = L_xyzz*v13
    v14      = L_xxxzz*v13
    v34      = v12 + v14 + 2.0d0*(L_xxx + v15 + v8)
    Ls_xxx   = Ls_xxx + (0.5d0*(v12 + v14) + L_xxx + L_xxxxx*v10 + v0*x + v15 + v8)
    v19      = L_xxyzz*v13
    v31      = v19 + 2.0d0*(L_xxy + v17)
    v32      = v31*y
    v51      = 2.0d0*v20 + v18 + v31
    Ls_xxy   = Ls_xxy + (0.5d0*(v18 + v19) + L_xxxxy*v10 + L_xxy + v17 + v2*x + v20)
    v37      = L_xxzzz*v13
    v73      = v36 + v37 + 2.0d0*(L_xxz + v35 + v38)
    Ls_xxz   = Ls_xxz + (0.5d0*(v36 + v37) + L_xxxxz*v10 + L_xxz + v16*x + v35 + v38)
    v41      = L_xyyzz*v13
    v49      = v41 + 2.0d0*(L_xyy + v39)
    v50      = v49*y
    Ls_xyy   = Ls_xyy + (0.5d0*(v40 + v41) + L_xxxyy*v10 + L_xyy + v39 + v4*x + v42)
    v54      = L_xyzzz*v13
    v71      = v54 + 2.0d0*(L_xyz + v52)
    v72      = v71*y
    Ls_xyz   = Ls_xyz + (0.5d0*(v53 + v54) + L_xxxyz*v10 + L_xyz + v22*x + v52 + v55)
    v75      = L_yyyzz*v13
    v80      = v75 + 2.0d0*(L_yyy + v74)
    Ls_yyy   = Ls_yyy + (0.5d0*v75 + L_xxyyy*v10 + L_yyy + L_yyyyy*v30 + v6*x + v7*y + v74)
    v82      = L_yyzzz*v13
    v86      = v82 + 2.0d0*(L_yyz + v81)
    Ls_yyz   = Ls_yyz + (0.5d0*v82 + L_xxyyz*v10 + L_yyyyz*v30 + L_yyz + v44*x + v76*y + v81)
    h        = v11 + v13 + v9
    u2       = 1.0/h
    u        = sqrt(u2)
    u3       = u*u2
    u4       = u2*u2
    u5       = u2*u3
    u6       = u3*u3
    u7       = u3*u4
    u8       = u4*u4
    u9       = u4*u5
    u10      = u5*u5
    u11      = u5*u6
    c3       = c1*c2
    v28      = c3
    v59      = 0.166666666666667d0*v28
    v29      = L_xxzzz*v28
    Ls_xx    = Ls_xx + (0.166666666666667d0*(v26 + v29 + 3.0d0*(v27 + v32)) + L_xx + L_xxxxx*v24 &
      + v0*v10 + v23 + v3*v30 + v33*v34)
    v48      = L_xyzzz*v28
    v64      = v48 + 3.0d0*(2.0d0*L_xy + 2.0d0*v45 + v47)
    Ls_xy    = Ls_xy + (0.166666666666667d0*(v46 + v48 + 3.0d0*(v47 + v50)) + L_xxxxy*v24 + L_xy &
      + v10*v2 + v30*v5 + v33*v51 + v45)
    v70      = L_xzzzz*v28
    Ls_xz    = Ls_xz + (0.166666666666667d0*(v69 + v70 + 3.0d0*v72) + L_xxxxz*v24 + L_xz + &
      L_xzzz*v58 + v10*v16 + v30*v43 + v33*v73 + v68)
    v78      = L_yyzzz*v28
    Ls_yy    = Ls_yy + (0.166666666666667d0*v78 + L_xxxyy*v24 + L_yy + L_yyyyy*v61 + L_yyzz*v58 &
      + v10*v4 + v30*v7 + v33*(v40 + 2.0d0*v42 + v49) + v77 + v79*v80)
    v85      = L_yzzzz*v28
    Ls_yz    = Ls_yz + (0.166666666666667d0*v85 + L_xxxyz*v24 + L_yyyyz*v61 + L_yz + L_yzzz*v58 &
      + v10*v22 + v30*v76 + v33*(v53 + 2.0d0*v55 + v71) + v79*v86 + v84)
    c4       = c2*c2
    v60      = 0.0416666666666667d0*c4
    Ls_x     = Ls_x + (L_x + L_xxxxx*v56 + L_xyyyy*v57 + L_xz*z + L_xzz*v58 + L_xzzz*v59 + &
      L_xzzzz*v60 + v0*v24 + v34*v65 + v49*v62 + v5*v61 + v63*v64 + v66 &
      *(6.0d0*L_xx + 6.0d0*v23 + v26 + 3.0d0*v27 + v29 + v3*v67 + 3.0d0 &
      *v32))
    Ls_y     = Ls_y + (L_y + L_xxxxy*v56 + L_yyyyy*v57 + L_yz*z + L_yzz*v58 + L_yzzz*v59 + &
      L_yzzzz*v60 + v2*v24 + v51*v65 + v61*v7 + v62*v80 + v63*(6.0d0* &
      L_yy + L_yyzz*v83 + 6.0d0*v77 + v78) + v66*(v46 + v5*v67 + 3.0d0* &
      v50 + v64))
    Ls_z     = Ls_z + (L_z + L_xxxxz*v56 + L_yyyyz*v57 + L_zz*z + L_zzz*v58 + L_zzzz*v59 + &
      L_zzzzz*v60 + v16*v24 + v61*v76 + v62*v86 + v63*(6.0d0*L_yz + &
      L_yzzz*v83 + 6.0d0*v84 + v85) + v65*v73 + v66*(6.0d0*L_xz + &
      L_xzzz*v83 + v43*v67 + 6.0d0*v68 + v69 + v70 + 3.0d0*v72))
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Ls_x                
#undef  x                   
#undef  Ls_y                
#undef  L_y                 
#undef  L_z                 
#undef  Ls_z                
#undef  L_xx                
#undef  Ls_xx               
#undef  Ls_xy               
#undef  L_xy                
#undef  Ls_xz               
#undef  L_xz                
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
#undef  L_xxxx              
#undef  Ls_xxxx             
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  L_xxxz              
#undef  Ls_xxxz             
#undef  Ls_xxyy             
#undef  L_xxyy              
#undef  Ls_xxyz             
#undef  L_xxyz              
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
#undef  L_xxxxx             
#undef  Ls_xxxxx            
#undef  L_xxxxy             
#undef  Ls_xxxxy            
#undef  L_xxxxz             
#undef  Ls_xxxxz            
#undef  Ls_xxxyy            
#undef  L_xxxyy             
#undef  Ls_xxxyz            
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  Ls_xxyyy            
#undef  L_xxyyz             
#undef  Ls_xxyyz            
#undef  Ls_xyyyy            
#undef  L_xyyyy             
#undef  Ls_xyyyz            
#undef  L_xyyyz             
#undef  Ls_yyyyy            
#undef  L_yyyyy             
#undef  Ls_yyyyz            
#undef  L_yyyyz             
    end subroutine mom_es_L2L_add
    
! OPS  237*ADD + 2*DIV + 405*MUL + 41*NEG + POW + 14*SUB = 700  (1010 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz,&
                D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz,&
                D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz,&
                D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz
#define M_0                  M(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_x                  L(1:2,0)
#define M_xx                 M(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define M_xy                 M(1:2,2)
#define M_xz                 M(1:2,3)
#define L_xx                 L(1:2,3)
#define M_yy                 M(1:2,4)
#define L_xy                 L(1:2,4)
#define M_yz                 M(1:2,5)
#define L_xz                 L(1:2,5)
#define L_yy                 L(1:2,6)
#define M_xxx                M(1:2,6)
#define M_xxy                M(1:2,7)
#define L_yz                 L(1:2,7)
#define M_xxz                M(1:2,8)
#define L_xxx                L(1:2,8)
#define L_xxy                L(1:2,9)
#define M_xyy                M(1:2,9)
#define M_xyz                M(1:2,10)
#define L_xxz                L(1:2,10)
#define L_xyy                L(1:2,11)
#define M_yyy                M(1:2,11)
#define L_xyz                L(1:2,12)
#define M_yyz                M(1:2,12)
#define L_yyy                L(1:2,13)
#define M_xxxx               M(1:2,13)
#define L_yyz                L(1:2,14)
#define M_xxxy               M(1:2,14)
#define L_xxxx               L(1:2,15)
#define M_xxxz               M(1:2,15)
#define M_xxyy               M(1:2,16)
#define L_xxxy               L(1:2,16)
#define L_xxxz               L(1:2,17)
#define M_xxyz               M(1:2,17)
#define M_xyyy               M(1:2,18)
#define L_xxyy               L(1:2,18)
#define M_xyyz               M(1:2,19)
#define L_xxyz               L(1:2,19)
#define L_xyyy               L(1:2,20)
#define M_yyyy               M(1:2,20)
#define M_yyyz               M(1:2,21)
#define L_xyyz               L(1:2,21)
#define L_yyyy               L(1:2,22)
#define L_yyyz               L(1:2,23)
#define L_xxxxx              L(1:2,24)
#define L_xxxxy              L(1:2,25)
#define L_xxxxz              L(1:2,26)
#define L_xxxyy              L(1:2,27)
#define L_xxxyz              L(1:2,28)
#define L_xxyyy              L(1:2,29)
#define L_xxyyz              L(1:2,30)
#define L_xyyyy              L(1:2,31)
#define L_xyyyz              L(1:2,32)
#define L_yyyyy              L(1:2,33)
#define L_yyyyz              L(1:2,34)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v91     = y*z
    v88     = 15.0d0*v91
    v40     = 0.5d0*M_xx
    v46     = 0.166666666666667d0*M_xxx
    v47     = 0.5d0*M_xxy
    v48     = 0.5d0*M_xxz
    v56     = 0.5d0*M_yy
    v58     = 0.166666666666667d0*M_yyy
    v63     = 0.0416666666666667d0*M_xxxx
    v64     = 0.166666666666667d0*M_xxxy
    v65     = 0.166666666666667d0*M_xxxz
    v66     = 0.25d0*M_xxyy
    v67     = 0.5d0*M_xxyz
    v69     = 0.0416666666666667d0*M_yyyy
    v70     = 0.166666666666667d0*M_yyyz
    v71     = 0.5d0*M_yyz
    v76     = 0.5d0*M_xyy
    v78     = 0.166666666666667d0*M_xyyy
    M_zz    = -(M_xx + M_yy)
    v73     = 0.5d0*M_zz
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    v77     = 0.5d0*M_yzz
    M_zzz   = -(M_xxz + M_yyz)
    v74     = 0.166666666666667d0*M_zzz
    M_xxzz  = -(M_xxxx + M_xxyy)
    v68     = 0.25d0*M_xxzz
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    v72     = 0.25d0*M_yyzz
    M_yzzz  = -(M_xxyz + M_yyyz)
    v79     = 0.166666666666667d0*M_yzzz
    M_zzzz  = -(M_xxzz + M_yyzz)
    v75     = 0.0416666666666667d0*M_zzzz
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v80     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v80
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v81     = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v81
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v82     = 3.0d0*h
    v83     = h*v0
    v84     = h*v1
    v4      = -h
    v12     = v82
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v83
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v84
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 - 945.0d0*v19 + 630.0d0*v83
    v38     = -(v18 + 63.0d0*v26)
    v55     = v35 - 945.0d0*v30 + 630.0d0*v84
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    v2      = u3
    D_x     = -v2*x
    D_y     = -v2*y
    D_z     = -v2*z
    u4      = u2*u2
    u5      = u2*u3
    v3      = u5
    v85     = 3.0d0*v3
    v6      = v85*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v85*v91
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v86     = 3.0d0*v8
    v9      = v8*x
    v11     = v86*(h - v10)
    D_xxx   = -3.0d0*v9*(v80 - v82)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    D_xyz   = -v88*v9
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = v86*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v87     = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v87*y
    v25     = v87*z
    v27     = v15*v88
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    L_xxxx  = D_xxxx*M_0
    D_xxxy  = v21*v24
    L_xxxy  = D_xxxy*M_0
    D_xxxz  = v24*v25
    L_xxxz  = D_xxxz*M_0
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    v49     = 0.5d0*D_xxyy
    L_xxyy  = D_xxyy*M_0
    D_xxyz  = v27*(v23 + v4)
    L_xxyz  = D_xxyz*M_0
    D_xxzz  = -(D_xxxx + D_xxyy)
    v52     = 0.5d0*D_xxzz
    D_xyyy  = v21*v29
    L_xyyy  = D_xyyy*M_0
    D_xyyz  = v25*(v28 + v4)
    L_xyyz  = D_xyyz*M_0
    D_xyzz  = -(D_xxxy + D_xyyy)
    v60     = 0.5d0*D_xyzz
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    L_yyyy  = D_yyyy*M_0
    D_yyyz  = v27*v29
    L_yyyz  = D_yyyz*M_0
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v89     = 15.0d0*v32
    v90     = v32*z
    v33     = v89*x
    v37     = v90
    v39     = 315.0d0*v90*x*y
    v43     = v89*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = v32*v36*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = v36*v37
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    v41     = 0.5d0*D_xxxyy
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = v39*(h - v5)
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    v42     = 0.5d0*D_xxxzz
    L_xxx   = D_xxx*M_0 + D_xxxxx*v40 + D_xxxxy*M_xy + D_xxxxz*M_xz + D_xxxyz*M_yz + &
      M_yy*v41 + M_zz*v42
    D_xxyyy = v43*(v38 + h*v28 + 21.0d0*v20)
    v44     = 0.5d0*D_xxyyy
    v50     = 0.166666666666667d0*D_xxyyy
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = v37*(v34 - 945.0d0*v81 + 105.0d0*(v83 + v84))
    v51     = 0.5d0*D_xxyyz
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    v45     = 0.5d0*D_xxyzz
    L_xxy   = D_xxxxy*v40 + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + &
      M_yy*v44 + M_zz*v45
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    v53     = 0.166666666666667d0*D_xxzzz
    v54     = 0.5d0*D_xxzzz
    L_xx    = D_xx*M_0 + D_xxxx*v40 + D_xxxxx*v46 + D_xxxxy*v47 + D_xxxxz*v48 + D_xxxy &
      *M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + M_xyy*v41 + &
      M_xzz*v42 + M_yy*v49 + M_yyy*v50 + M_yyz*v51 + M_yzz*v45 + M_zz* &
      v52 + M_zzz*v53
    L_xxz   = D_xxxxz*v40 + D_xxxyz*M_xy + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_yy*v51 + M_zz*v54
    D_xyyyy = v32*v55*x
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = v39*(h - v7)
    v59     = 0.5d0*D_xyyyz
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    v57     = 0.5d0*D_xyyzz
    L_xyy   = D_xxxyy*v40 + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v56 + &
      D_xyyyz*M_yz + M_zz*v57
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    v61     = 0.166666666666667d0*D_xyzzz
    v62     = 0.5d0*D_xyzzz
    L_xy    = D_xxxxy*v46 + D_xxxy*v40 + D_xxxyy*v47 + D_xxxyz*v48 + D_xxyy*M_xy + &
      D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v56 + D_xyyyy*v58 &
      + D_xyyz*M_yz + M_xyy*v44 + M_xzz*v45 + M_yyz*v59 + M_yzz*v57 + &
      M_zz*v60 + M_zzz*v61
    L_xyz   = D_xxxyz*v40 + D_xxyyz*M_xy + D_xxyzz*M_xz + D_xyyyz*v56 + D_xyyzz*M_yz + &
      D_xyz*M_0 + M_zz*v62
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = D_x*M_0 + D_xxx*v40 + D_xxxx*v46 + D_xxxxx*v63 + D_xxxxy*v64 + D_xxxxz* &
      v65 + D_xxxy*v47 + D_xxxyy*v66 + D_xxxyz*v67 + D_xxxz*v48 + &
      D_xxxzz*v68 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v56 &
      + D_xyyy*v58 + D_xyyyy*v69 + D_xyyyz*v70 + D_xyyz*v71 + D_xyyzz* &
      v72 + D_xyz*M_yz + D_xzz*v73 + D_xzzz*v74 + D_xzzzz*v75 + M_xyy* &
      v49 + M_xyyy*v50 + M_xyyz*v51 + M_xyzz*v45 + M_xzz*v52 + M_xzzz* &
      v53 + M_yzz*v60 + M_yzzz*v61
    L_xz    = D_xxxxz*v46 + D_xxxyz*v47 + D_xxxz*v40 + D_xxxzz*v48 + D_xxyz*M_xy + &
      D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyz*v58 + D_xyyz*v56 + D_xyyzz* &
      v71 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v73 + D_xzzzz*v74 + M_xyy* &
      v51 + M_xzz*v54 + M_yzz*v62
    D_yyyyy = v43*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = v37*v55
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = D_xxyyy*v40 + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyyy*v56 + &
      D_yyyyz*M_yz + D_yyyzz*v73
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = D_xxxyy*v46 + D_xxyy*v40 + D_xxyyy*v47 + D_xxyyz*v48 + D_xyyy*M_xy + &
      D_xyyyy*v76 + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v56 &
      + D_yyyyy*v58 + D_yyyyz*v71 + D_yyyz*M_yz + D_yyyzz*v77 + D_yyzz* &
      v73 + D_yyzzz*v74 + M_xzz*v57
    L_yyz   = D_xxyyz*v40 + D_xyyyz*M_xy + D_xyyzz*M_xz + D_yyyyz*v56 + D_yyyzz*M_yz + &
      D_yyz*M_0 + D_yyzzz*v73
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = D_xxxxy*v63 + D_xxxy*v46 + D_xxxyy*v64 + D_xxxyz*v65 + D_xxy*v40 + &
      D_xxyy*v47 + D_xxyyy*v66 + D_xxyyz*v67 + D_xxyz*v48 + D_xxyzz*v68 &
      + D_xyy*M_xy + D_xyyy*v76 + D_xyyyy*v78 + D_xyyz*M_xyz + D_xyz* &
      M_xz + D_y*M_0 + D_yyy*v56 + D_yyyy*v58 + D_yyyyy*v69 + D_yyyyz* &
      v70 + D_yyyz*v71 + D_yyyzz*v72 + D_yyz*M_yz + D_yyzz*v77 + &
      D_yyzzz*v79 + D_yzz*v73 + D_yzzz*v74 + D_yzzzz*v75 + M_xyyz*v59 + &
      M_xyzz*v57 + M_xzz*v60 + M_xzzz*v61
    L_yz    = D_xxxyz*v46 + D_xxyyz*v47 + D_xxyz*v40 + D_xxyzz*v48 + D_xyyyz*v76 + &
      D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyz*v58 + D_yyyz* &
      v56 + D_yyyzz*v71 + D_yyzz*M_yz + D_yyzzz*v77 + D_yz*M_0 + D_yzzz &
      *v73 + D_yzzzz*v74 + M_xzz*v62
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_z     = 0.166666666666667d0*(3.0d0*D_xzzz*M_xzz + D_xzzzz*M_xzzz) + D_xxxxz*v63 &
      + D_xxxyz*v64 + D_xxxz*v46 + D_xxxzz*v65 + D_xxyyz*v66 + D_xxyz* &
      v47 + D_xxyzz*v67 + D_xxz*v40 + D_xxzz*v48 + D_xxzzz*v68 + &
      D_xyyyz*v78 + D_xyyz*v76 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz &
      + D_yyyyz*v69 + D_yyyz*v58 + D_yyyzz*v70 + D_yyz*v56 + D_yyzz*v71 &
      + D_yyzzz*v72 + D_yzz*M_yz + D_yzzz*v77 + D_yzzzz*v79 + D_z*M_0 + &
      D_zzz*v73 + D_zzzz*v74 + D_zzzzz*v75 + M_xyyz*v57 + M_xyzz*v62
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  M_xz                
#undef  L_xx                
#undef  M_yy                
#undef  L_xy                
#undef  M_yz                
#undef  L_xz                
#undef  L_yy                
#undef  M_xxx               
#undef  M_xxy               
#undef  L_yz                
#undef  M_xxz               
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xyy               
#undef  M_xyz               
#undef  L_xxz               
#undef  L_xyy               
#undef  M_yyy               
#undef  L_xyz               
#undef  M_yyz               
#undef  L_yyy               
#undef  M_xxxx              
#undef  L_yyz               
#undef  M_xxxy              
#undef  L_xxxx              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxyz              
#undef  M_xyyy              
#undef  L_xxyy              
#undef  M_xyyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
    end subroutine mom_es_M2L2
    
! OPS  94*ADD + 2*DIV + 141*MUL + 20*NEG + POW = 258  (411 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v3, v4, v5, v6, v7, v8, v9, h, u,&
                L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz,&
                L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz,&
                L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Phi_x                Phi(1:2,0)
#define x                    r(1:2,1)
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
#define L_xxxxx              L(1:2,24)
#define L_xxxxy              L(1:2,25)
#define L_xxxxz              L(1:2,26)
#define L_xxxyy              L(1:2,27)
#define L_xxxyz              L(1:2,28)
#define L_xxyyy              L(1:2,29)
#define L_xxyyz              L(1:2,30)
#define L_xyyyy              L(1:2,31)
#define L_xyyyz              L(1:2,32)
#define L_yyyyy              L(1:2,33)
#define L_yyyyz              L(1:2,34)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v9      = L_xyyy + L_xyyyz*z
    v13     = 2.0d0*z
    v15     = 0.166666666666667d0*y
    v16     = 6.0d0*z
    v21     = 2.0d0*y
    v22     = L_xxxy + L_xxxyz*z
    v23     = 0.166666666666667d0*x
    v25     = L_xxyy + L_xxyyz*z
    v26     = 3.0d0*y
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    L_yzz   = -(L_xxy + L_yyy)
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    L_xyzz  = -(L_xxxy + L_xyyy)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    L_xxxzz = -(L_xxxxx + L_xxxyy)
    L_xxyzz = -(L_xxxxy + L_xxyyy)
    L_xxzzz = -(L_xxxxz + L_xxyyz)
    L_xyyzz = -(L_xxxyy + L_xyyyy)
    L_xyzzz = -(L_xxxyz + L_xyyyz)
    L_xzzzz = -(L_xxxzz + L_xyyzz)
    L_yyyzz = -(L_xxyyy + L_yyyyy)
    L_yyzzz = -(L_xxyyz + L_yyyyz)
    L_yzzzz = -(L_xxyzz + L_yyyzz)
    L_zzzzz = -(L_xxzzz + L_yyzzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v19     = a2
    v20     = 0.25d0*v19
    a3      = a1*a2
    v10     = 0.166666666666667d0*a3
    a4      = a2*a2
    v0      = 0.0416666666666667d0*a4
    a5      = a2*a3
    b2      = b1*b1
    v11     = b2
    v12     = 0.25d0*v11
    v24     = 3.0d0*v11
    b3      = b1*b2
    v7      = b3
    v8      = 0.166666666666667d0*v7
    b4      = b2*b2
    v1      = 0.0416666666666667d0*b4
    b5      = b2*b3
    c2      = c1*c1
    v2      = c2
    v3      = 0.5d0*v2
    v17     = 3.0d0*v2
    v27     = 2.0d0*L_xxy + L_xxyz*v13 + L_xxyzz*v2
    v14     = 2.0d0*L_xyy + L_xyyz*v13 + L_xyyzz*v2
    h       = v11 + v19 + v2
    u2      = 1.0/h
    u       = sqrt(u2)
    u3      = u*u2
    u4      = u2*u2
    u5      = u2*u3
    u6      = u3*u3
    u7      = u3*u4
    u8      = u4*u4
    u9      = u4*u5
    u10     = u5*u5
    u11     = u5*u6
    c3      = c1*c2
    v4      = c3
    v5      = 0.166666666666667d0*v4
    v18     = 6.0d0*L_xy + L_xyz*v16 + L_xyzz*v17 + L_xyzzz*v4
    c4      = c2*c2
    v6      = 0.0416666666666667d0*c4
    Phi_x   = L_x + L_xxxxx*v0 + L_xyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + L_xzzzz* &
      v6 + v10*(L_xxxx + L_xxxxy*y + L_xxxxz*z) + v12*v14 + v15*v18 + &
      v20*(2.0d0*L_xxx + L_xxxyy*v11 + L_xxxz*v13 + L_xxxzz*v2 + v21* &
      v22) + v23*(6.0d0*L_xx + L_xxyyy*v7 + L_xxz*v16 + L_xxzz*v17 + &
      L_xxzzz*v4 + v24*v25 + v26*v27) + v8*v9
    Phi_y   = L_y + L_xxxxy*v0 + L_yyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + L_yzzzz* &
      v6 + v10*(L_xxxyy*y + v22) + v12*(2.0d0*L_yyy + L_yyyz*v13 + &
      L_yyyzz*v2) + v15*(6.0d0*L_yy + L_yyz*v16 + L_yyzz*v17 + L_yyzzz* &
      v4) + v20*(L_xxyyy*v11 + v21*v25 + v27) + v23*(L_xyyyy*v7 + v14* &
      v26 + v18 + v24*v9) + v8*(L_yyyy + L_yyyyz*z)
    Phi_z   = L_z + L_xxxxz*v0 + L_yyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + L_zzzzz* &
      v6 + v10*(L_xxxyz*y + L_xxxz + L_xxxzz*z) + v12*(2.0d0*L_yyz + &
      L_yyzz*v13 + L_yyzzz*v2) + v15*(6.0d0*L_yz + L_yzz*v16 + L_yzzz* &
      v17 + L_yzzzz*v4) + v20*(L_xxyyz*v11 + 2.0d0*L_xxz + L_xxzz*v13 + &
      L_xxzzz*v2 + v21*(L_xxyz + L_xxyzz*z)) + v23*(L_xyyyz*v7 + 6.0d0* &
      L_xz + L_xzz*v16 + L_xzzz*v17 + L_xzzzz*v4 + v24*(L_xyyz + &
      L_xyyzz*z) + v26*(2.0d0*L_xyz + L_xyzz*v13 + L_xyzzz*v2)) + v8*( &
      L_yyyz + L_yyyzz*z)
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_x               
#undef  x                   
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
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
    end subroutine mom_es_L2P2
    
! OPS  200*ADD + 2*DIV + 233*MUL + 20*NEG + POW = 456  (928 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v9, h, u,&
                L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz,&
                L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz,&
                L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Ls_x                 Ls(1:2,0)
#define x                    r(1:2,1)
#define Ls_y                 Ls(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define Ls_z                 Ls(1:2,2)
#define L_xx                 L(1:2,3)
#define Ls_xx                Ls(1:2,3)
#define Ls_xy                Ls(1:2,4)
#define L_xy                 L(1:2,4)
#define Ls_xz                Ls(1:2,5)
#define L_xz                 L(1:2,5)
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
#define L_xxxx               L(1:2,15)
#define Ls_xxxx              Ls(1:2,15)
#define Ls_xxxy              Ls(1:2,16)
#define L_xxxy               L(1:2,16)
#define L_xxxz               L(1:2,17)
#define Ls_xxxz              Ls(1:2,17)
#define Ls_xxyy              Ls(1:2,18)
#define L_xxyy               L(1:2,18)
#define Ls_xxyz              Ls(1:2,19)
#define L_xxyz               L(1:2,19)
#define L_xyyy               L(1:2,20)
#define Ls_xyyy              Ls(1:2,20)
#define L_xyyz               L(1:2,21)
#define Ls_xyyz              Ls(1:2,21)
#define Ls_yyyy              Ls(1:2,22)
#define L_yyyy               L(1:2,22)
#define L_yyyz               L(1:2,23)
#define Ls_yyyz              Ls(1:2,23)
#define L_xxxxx              L(1:2,24)
#define Ls_xxxxx             Ls(1:2,24)
#define L_xxxxy              L(1:2,25)
#define Ls_xxxxy             Ls(1:2,25)
#define L_xxxxz              L(1:2,26)
#define Ls_xxxxz             Ls(1:2,26)
#define Ls_xxxyy             Ls(1:2,27)
#define L_xxxyy              L(1:2,27)
#define Ls_xxxyz             Ls(1:2,28)
#define L_xxxyz              L(1:2,28)
#define L_xxyyy              L(1:2,29)
#define Ls_xxyyy             Ls(1:2,29)
#define L_xxyyz              L(1:2,30)
#define Ls_xxyyz             Ls(1:2,30)
#define Ls_xyyyy             Ls(1:2,31)
#define L_xyyyy              L(1:2,31)
#define Ls_xyyyz             Ls(1:2,32)
#define L_xyyyz              L(1:2,32)
#define Ls_yyyyy             Ls(1:2,33)
#define L_yyyyy              L(1:2,33)
#define Ls_yyyyz             Ls(1:2,34)
#define L_yyyyz              L(1:2,34)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0       = L_xxxx + L_xxxxy*y + L_xxxxz*z
    v1       = L_xxxy + L_xxxyz*z
    v2       = L_xxxyy*y + v1
    v3       = L_xxyy + L_xxyyz*z
    v4       = L_xxyyy*y + v3
    v5       = L_xyyy + L_xyyyz*z
    v6       = L_xyyyy*y + v5
    v7       = L_yyyy + L_yyyyz*z
    v8       = L_xxxz*z
    v15      = v1*y
    v17      = L_xxyz*z
    v20      = v3*y
    v23      = L_xxz*z
    v33      = 0.5d0*x
    v39      = L_xyyz*z
    v42      = v5*y
    v45      = L_xyz*z
    v63      = 0.166666666666667d0*y
    v66      = 0.166666666666667d0*x
    v74      = L_yyyz*z
    v77      = L_yyz*z
    v79      = 0.5d0*y
    Ls_xxxx  = L_xxxxx*x + v0
    Ls_xxxy  = L_xxxxy*x + v2
    Ls_xxyy  = L_xxxyy*x + v4
    Ls_xyyy  = L_xxyyy*x + v6
    Ls_yyyy  = v7 + L_xyyyy*x + L_yyyyy*y
    Ls_xxxxx = L_xxxxx
    Ls_xxxxy = L_xxxxy
    Ls_xxxxz = L_xxxxz
    Ls_xxxyy = L_xxxyy
    Ls_xxxyz = L_xxxyz
    Ls_xxyyy = L_xxyyy
    Ls_xxyyz = L_xxyyz
    Ls_xyyyy = L_xyyyy
    Ls_xyyyz = L_xyyyz
    Ls_yyyyy = L_yyyyy
    Ls_yyyyz = L_yyyyz
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    v68      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v84      = L_yzz*z
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    v35      = L_xxzz*z
    L_xyzz   = -(L_xxxy + L_xyyy)
    v52      = L_xyzz*z
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    v81      = L_yyzz*z
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    v16      = L_xxxz + L_xxxyz*y + L_xxxzz*z
    Ls_xxxz  = L_xxxxz*x + v16
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    v21      = L_xxyz + L_xxyzz*z
    v22      = L_xxyyz*y + v21
    v38      = v21*y
    Ls_xxyz  = L_xxxyz*x + v22
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    v43      = L_xyyz + L_xyyzz*z
    v44      = L_xyyyz*y + v43
    v55      = v43*y
    Ls_xyyz  = L_xxyyz*x + v44
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    v76      = L_yyyz + L_yyyzz*z
    Ls_yyyz  = v76 + L_xyyyz*x + L_yyyyz*y
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v9       = a2
    v10      = 0.5d0*v9
    v65      = 0.25d0*v9
    a3       = a1*a2
    v24      = 0.166666666666667d0*a3
    a4       = a2*a2
    v56      = 0.0416666666666667d0*a4
    a5       = a2*a3
    b2       = b1*b1
    v11      = b2
    v12      = L_xxxyy*v11
    v18      = L_xxyyy*v11
    v30      = 0.5d0*v11
    v36      = L_xxyyz*v11
    v40      = L_xyyyy*v11
    v53      = L_xyyyz*v11
    v62      = 0.25d0*v11
    v67      = 3.0d0*v11
    b3       = b1*b2
    v25      = b3
    v26      = L_xxyyy*v25
    v46      = L_xyyyy*v25
    v61      = 0.166666666666667d0*v25
    v69      = L_xyyyz*v25
    b4       = b2*b2
    v57      = 0.0416666666666667d0*b4
    b5       = b2*b3
    c2       = c1*c1
    v13      = c2
    v58      = 0.5d0*v13
    v83      = 3.0d0*v13
    v27      = L_xxzz*v13
    v47      = L_xyzz*v13
    v14      = L_xxxzz*v13
    v34      = v12 + v14 + 2.0d0*(L_xxx + v15 + v8)
    Ls_xxx   = 0.5d0*(v12 + v14) + L_xxx + L_xxxxx*v10 + v0*x + v15 + v8
    v19      = L_xxyzz*v13
    v31      = v19 + 2.0d0*(L_xxy + v17)
    v32      = v31*y
    v51      = 2.0d0*v20 + v18 + v31
    Ls_xxy   = 0.5d0*(v18 + v19) + L_xxxxy*v10 + L_xxy + v17 + v2*x + v20
    v37      = L_xxzzz*v13
    v73      = v36 + v37 + 2.0d0*(L_xxz + v35 + v38)
    Ls_xxz   = 0.5d0*(v36 + v37) + L_xxxxz*v10 + L_xxz + v16*x + v35 + v38
    v41      = L_xyyzz*v13
    v49      = v41 + 2.0d0*(L_xyy + v39)
    v50      = v49*y
    Ls_xyy   = 0.5d0*(v40 + v41) + L_xxxyy*v10 + L_xyy + v39 + v4*x + v42
    v54      = L_xyzzz*v13
    v71      = v54 + 2.0d0*(L_xyz + v52)
    v72      = v71*y
    Ls_xyz   = 0.5d0*(v53 + v54) + L_xxxyz*v10 + L_xyz + v22*x + v52 + v55
    v75      = L_yyyzz*v13
    v80      = v75 + 2.0d0*(L_yyy + v74)
    Ls_yyy   = 0.5d0*v75 + L_xxyyy*v10 + L_yyy + L_yyyyy*v30 + v6*x + v7*y + v74
    v82      = L_yyzzz*v13
    v86      = v82 + 2.0d0*(L_yyz + v81)
    Ls_yyz   = 0.5d0*v82 + L_xxyyz*v10 + L_yyyyz*v30 + L_yyz + v44*x + v76*y + v81
    h        = v11 + v13 + v9
    u2       = 1.0/h
    u        = sqrt(u2)
    u3       = u*u2
    u4       = u2*u2
    u5       = u2*u3
    u6       = u3*u3
    u7       = u3*u4
    u8       = u4*u4
    u9       = u4*u5
    u10      = u5*u5
    u11      = u5*u6
    c3       = c1*c2
    v28      = c3
    v59      = 0.166666666666667d0*v28
    v29      = L_xxzzz*v28
    Ls_xx    = 0.166666666666667d0*(v26 + v29 + 3.0d0*(v27 + v32)) + L_xx + L_xxxxx*v24 &
      + v0*v10 + v23 + v3*v30 + v33*v34
    v48      = L_xyzzz*v28
    v64      = v48 + 3.0d0*(2.0d0*L_xy + 2.0d0*v45 + v47)
    Ls_xy    = 0.166666666666667d0*(v46 + v48 + 3.0d0*(v47 + v50)) + L_xxxxy*v24 + L_xy &
      + v10*v2 + v30*v5 + v33*v51 + v45
    v70      = L_xzzzz*v28
    Ls_xz    = 0.166666666666667d0*(v69 + v70 + 3.0d0*v72) + L_xxxxz*v24 + L_xz + &
      L_xzzz*v58 + v10*v16 + v30*v43 + v33*v73 + v68
    v78      = L_yyzzz*v28
    Ls_yy    = 0.166666666666667d0*v78 + L_xxxyy*v24 + L_yy + L_yyyyy*v61 + L_yyzz*v58 &
      + v10*v4 + v30*v7 + v33*(v40 + 2.0d0*v42 + v49) + v77 + v79*v80
    v85      = L_yzzzz*v28
    Ls_yz    = 0.166666666666667d0*v85 + L_xxxyz*v24 + L_yyyyz*v61 + L_yz + L_yzzz*v58 &
      + v10*v22 + v30*v76 + v33*(v53 + 2.0d0*v55 + v71) + v79*v86 + v84
    c4       = c2*c2
    v60      = 0.0416666666666667d0*c4
    Ls_x     = L_x + L_xxxxx*v56 + L_xyyyy*v57 + L_xz*z + L_xzz*v58 + L_xzzz*v59 + &
      L_xzzzz*v60 + v0*v24 + v34*v65 + v49*v62 + v5*v61 + v63*v64 + v66 &
      *(6.0d0*L_xx + 6.0d0*v23 + v26 + 3.0d0*v27 + v29 + v3*v67 + 3.0d0 &
      *v32)
    Ls_y     = L_y + L_xxxxy*v56 + L_yyyyy*v57 + L_yz*z + L_yzz*v58 + L_yzzz*v59 + &
      L_yzzzz*v60 + v2*v24 + v51*v65 + v61*v7 + v62*v80 + v63*(6.0d0* &
      L_yy + L_yyzz*v83 + 6.0d0*v77 + v78) + v66*(v46 + v5*v67 + 3.0d0* &
      v50 + v64)
    Ls_z     = L_z + L_xxxxz*v56 + L_yyyyz*v57 + L_zz*z + L_zzz*v58 + L_zzzz*v59 + &
      L_zzzzz*v60 + v16*v24 + v61*v76 + v62*v86 + v63*(6.0d0*L_yz + &
      L_yzzz*v83 + 6.0d0*v84 + v85) + v65*v73 + v66*(6.0d0*L_xz + &
      L_xzzz*v83 + v43*v67 + 6.0d0*v68 + v69 + v70 + 3.0d0*v72)
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
#undef  L_xx                
#undef  Ls_xx               
#undef  Ls_xy               
#undef  L_xy                
#undef  Ls_xz               
#undef  L_xz                
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
#undef  L_xxxx              
#undef  Ls_xxxx             
#undef  Ls_xxxy             
#undef  L_xxxy              
#undef  L_xxxz              
#undef  Ls_xxxz             
#undef  Ls_xxyy             
#undef  L_xxyy              
#undef  Ls_xxyz             
#undef  L_xxyz              
#undef  L_xyyy              
#undef  Ls_xyyy             
#undef  L_xyyz              
#undef  Ls_xyyz             
#undef  Ls_yyyy             
#undef  L_yyyy              
#undef  L_yyyz              
#undef  Ls_yyyz             
#undef  L_xxxxx             
#undef  Ls_xxxxx            
#undef  L_xxxxy             
#undef  Ls_xxxxy            
#undef  L_xxxxz             
#undef  Ls_xxxxz            
#undef  Ls_xxxyy            
#undef  L_xxxyy             
#undef  Ls_xxxyz            
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  Ls_xxyyy            
#undef  L_xxyyz             
#undef  Ls_xxyyz            
#undef  Ls_xyyyy            
#undef  L_xyyyy             
#undef  Ls_xyyyz            
#undef  L_xyyyz             
#undef  Ls_yyyyy            
#undef  L_yyyyy             
#undef  Ls_yyyyz            
#undef  L_yyyyz             
    end subroutine mom_es_L2L2_add
#endif
end module mom5
