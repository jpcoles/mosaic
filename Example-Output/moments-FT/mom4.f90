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
        
    
! OPS  15*ADD + 44*MUL + 5*NEG + 3*SUB = 67  (185 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v3, v4, v5, v6, v7, v8, v9, h, u
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
#define M_xxx                M(9)
#define M_xxy                M(10)
#define M_xxz                M(11)
#define M_xyy                M(12)
#define M_xyz                M(13)
#define M_yyy                M(14)
#define M_yyz                M(15)
#define M_xxxx               M(16)
#define M_xxxy               M(17)
#define M_xxxz               M(18)
#define M_xxyy               M(19)
#define M_xxyz               M(20)
#define M_xyyy               M(21)
#define M_xyyz               M(22)
#define M_yyyy               M(23)
#define M_yyyz               M(24)
    v0     = W*x
    v1     = W*y
    v2     = W*z
    v3     = v0*y
    v4     = v0*z
    v5     = v1*z
    M_0    = W
    M_x    = v0
    M_y    = v1
    M_z    = v2
    M_xy   = v3
    M_xz   = v4
    M_yz   = v5
    M_xyz  = v3*z
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v6     = a2
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v7     = b2
    v8     = v6 + v7
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v8
    v9     = -0.333333333333333d0*h
    v10    = -0.6d0*h
    v11    = -0.2d0*h
    v12    = v11 + v6
    v13    = v11 + v7
    v14    = h*h
    v15    = 0.0857142857142857d0*v14
    v16    = 0.857142857142857d0*h
    v17    = -0.428571428571429d0*h
    v18    = v17 + v6
    v19    = 0.142857142857143d0*h
    v20    = -v19
    v21    = v17 + v7
    M_xx   = W*(v6 + v9)
    M_yy   = W*(v7 + v9)
    M_xxx  = v0*(v10 + v6)
    M_xxy  = v1*v12
    M_xxz  = v12*v2
    M_xyy  = v0*v13
    M_yyy  = v1*(v10 + v7)
    M_yyz  = v13*v2
    M_xxxx = W*(-v16*v6 + a4 + v15)
    M_xxxy = v18*v3
    M_xxxz = v18*v4
    M_xxyy = W*(0.0285714285714286d0*v14 - v19*v8 + v6*v7)
    M_xxyz = v5*(v20 + v6)
    M_xyyy = v21*v3
    M_xyyz = v4*(v20 + v7)
    M_yyyy = W*(-v16*v7 + b4 + v15)
    M_yyyz = v21*v5
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
    
! OPS  176*ADD + 294*MUL + 21*NEG + 61*SUB = 552  (845 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60,&
                v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71,&
                v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82,&
                v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93,&
                v94, v95, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, S_0, S_x, S_y, S_z, S_xx,&
                S_xy, S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy,&
                S_xyz, S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy,&
                S_xxxz, S_xxyy, S_xxyz, S_xyyy, S_xyyz, S_yyyy, S_yyyz
#define y                    r(2)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
#define z                    r(3)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define M_xy                 M(5)
#define Ms_xy                Ms(5)
#define M_xz                 M(6)
#define Ms_xz                Ms(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
#define M_xxx                M(9)
#define Ms_xxx               Ms(9)
#define M_xxy                M(10)
#define Ms_xxy               Ms(10)
#define Ms_xxz               Ms(11)
#define M_xxz                M(11)
#define M_xyy                M(12)
#define Ms_xyy               Ms(12)
#define M_xyz                M(13)
#define Ms_xyz               Ms(13)
#define Ms_yyy               Ms(14)
#define M_yyy                M(14)
#define M_yyz                M(15)
#define Ms_yyz               Ms(15)
#define M_xxxx               M(16)
#define Ms_xxxx              Ms(16)
#define M_xxxy               M(17)
#define Ms_xxxy              Ms(17)
#define Ms_xxxz              Ms(18)
#define M_xxxz               M(18)
#define Ms_xxyy              Ms(19)
#define M_xxyy               M(19)
#define M_xxyz               M(20)
#define Ms_xxyz              Ms(20)
#define M_xyyy               M(21)
#define Ms_xyyy              Ms(21)
#define Ms_xyyz              Ms(22)
#define M_xyyz               M(22)
#define M_yyyy               M(23)
#define Ms_yyyy              Ms(23)
#define M_yyyz               M(24)
#define Ms_yyyz              Ms(24)
    v0      = x*y
    v1      = x*z
    v2      = y*z
    v6      = M_x*x
    v7      = M_y*y
    v8      = -0.666666666666667d0*M_z*z
    v11     = M_xx*x
    v12     = M_xy*y
    v13     = M_xz*z
    v19     = M_xy*x
    v21     = M_yy*y
    v22     = M_yz*z
    v25     = M_xx*z
    v26     = M_xz*x
    v28     = M_yy*z
    v29     = M_yz*y
    v42     = M_xxx*x
    v43     = 1.71428571428571d0*y
    v44     = M_xxy*v43
    v45     = M_xxz*z
    v47     = 1.71428571428571d0*M_y
    v54     = 0.857142857142857d0*M_xyz
    v59     = M_xxy*x
    v62     = M_xyy*y
    v66     = M_xxx*z
    v67     = M_xxz*x
    v69     = M_xyy*z
    v76     = 1.71428571428571d0*M_x
    v78     = 1.71428571428571d0*x
    v79     = M_xyy*v78
    v81     = M_yyy*y
    v82     = M_yyz*z
    v86     = M_xxy*z
    v90     = M_yyy*z
    v91     = M_yyz*y
    Ms_0    = M_0
    Ms_x    = M_0*x + M_x
    Ms_y    = M_0*y + M_y
    Ms_z    = M_0*z + M_z
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
    v14     = M_y*S_xy
    v18     = M_x*S_xy
    v37     = M_xy*S_xy
    v58     = M_xx*S_xy
    v64     = M_yy*S_xy
    v72     = M_yz*S_xy
    v88     = M_xz*S_xy
    Ms_xy   = M_xy + M_0*S_xy + M_x*y + M_y*x
    S_xz    = v1
    v15     = M_z*S_xz
    v24     = M_x*S_xz
    v46     = M_xz*S_xz
    v71     = M_yy*S_xz
    v87     = M_xy*S_xz
    Ms_xz   = M_xz + M_0*S_xz + M_x*z + M_z*x
    S_yz    = v2
    v23     = M_z*S_yz
    v27     = M_y*S_yz
    v50     = M_yz*S_yz
    v68     = M_xy*S_yz
    v85     = M_xx*S_yz
    Ms_yz   = M_yz + M_0*S_yz + M_y*z + M_z*y
    S_xyz   = v0*z
    v55     = 0.857142857142857d0*S_xyz
    v56     = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v55 + v54*z)
    Ms_xyz  = M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v3      = a2
    a3      = a1*a2
    a4      = a2*a2
    b2      = b1*b1
    v4      = b2
    b3      = b1*b2
    b4      = b2*b2
    c2      = c1*c1
    h       = c2 + v3 + v4
    v5      = -0.333333333333333d0*h
    v9      = -0.6d0*h
    v16     = -0.2d0*h
    v17     = v16 + v3
    v32     = v16 + v4
    v33     = h*h
    v34     = 0.0857142857142857d0*v33
    v35     = 0.857142857142857d0*h
    v52     = -0.428571428571429d0*h
    v53     = v3 + v52
    v75     = 0.142857142857143d0*h
    v84     = -v75
    v95     = v4 + v52
    S_xx    = v3 + v5
    v10     = M_x*S_xx
    v30     = M_z*S_xx
    v38     = M_yy*S_xx
    v41     = M_xx*S_xx
    v60     = M_xy*S_xx
    v92     = M_yz*S_xx
    Ms_xx   = 0.333333333333333d0*(4.0d0*v6 - 2.0d0*v7) + M_0*S_xx + M_xx + v8
    S_yy    = v4 + v5
    v20     = M_y*S_yy
    v31     = M_z*S_yy
    v36     = M_xx*S_yy
    v39     = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v37 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v36 + 4.0d0*v38))
    v49     = M_yy*S_yy
    v61     = M_xy*S_yy
    v70     = M_xz*S_yy
    Ms_yy   = 0.333333333333333d0*(-2.0d0*v6 + 4.0d0*v7) + M_0*S_yy + M_yy + v8
    S_zz    = -(S_xx + S_yy)
    S_xxx   = x*(v3 + v9)
    v40     = M_x*S_xxx
    v73     = M_z*S_xxx
    Ms_xxx  = M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v10 + 3.0d0*v11 - 2.0d0*v12 - &
      2.0d0*v13 - 2.0d0*v14 - 2.0d0*v15))
    S_xxy   = v17*y
    v48     = S_xxy*v47
    v57     = M_x*S_xxy
    v93     = M_z*S_xxy
    Ms_xxy  = M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v18 + 4.0d0* &
      v19 - v20 - v21 - v22 - v23))
    S_xxz   = v17*z
    v51     = M_z*S_xxz
    v65     = M_x*S_xxz
    Ms_xxz  = M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v24 + v26) + 7.0d0*(v25 + v30) + 2.0d0 &
      *(-v27 + v28 - v29 + v31))
    S_xyy   = v32*x
    v63     = M_y*S_xyy
    v74     = M_z*S_xyy
    v77     = S_xyy*v76
    Ms_xyy  = M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v10 - v11 + 4.0d0 &
      *v12 - v13 + 4.0d0*v14 - v15))
    S_xzz   = -(S_xxx + S_xyy)
    S_yyy   = y*(v4 + v9)
    v80     = M_y*S_yyy
    v94     = M_z*S_yyy
    Ms_yyy  = M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v18 - 2.0d0*v19 + 3.0d0*v20 + &
      3.0d0*v21 - 2.0d0*v22 - 2.0d0*v23))
    S_yyz   = v32*z
    v83     = M_z*S_yyz
    v89     = M_y*S_yyz
    Ms_yyz  = M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v27 + v29) + 7.0d0*(v28 + v31) + 2.0d0 &
      *(-v24 + v25 - v26 + v30))
    S_yzz   = -(S_xxy + S_yyy)
    S_zzz   = -(S_xxz + S_yyz)
    S_xxxx  = -v3*v35 + a4 + v34
    Ms_xxxx = M_0*S_xxxx + v39 - v44 - v48 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v41 - 96.0d0*v46 + 80.0d0*(v40 + v42) - &
      60.0d0*(v45 + v51) + 24.0d0*(v49 + v50))
    S_xxxy  = v0*v53
    Ms_xxxy = M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v56 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v57 + 5.0d0*v58 + 5.0d0*v59 + 5.0d0*v60 - 2.0d0*v61 &
      - 2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64))
    S_xxxz  = v1*v53
    Ms_xxxz = M_0*S_xxxz + M_xxxz - M_y*v55 - v54*y + 0.142857142857143d0*(15.0d0*(v65 &
      + v67) + 13.0d0*(v66 + v73) + 21.0d0*(M_xx*S_xz + M_xz*S_xx) + &
      6.0d0*(-v68 + v69 + v70 + v71 - v72 + v74))
    S_xxyy  = 0.0285714285714286d0*v33 + v3*v4 - v3*v75 - v4*v75
    Ms_xxyy = 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v37 + 39.0d0*(v36 + v38) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v40 + 12.0d0*v41 + &
      10.0d0*v42 + 10.0d0*v45 + 12.0d0*v46 + 12.0d0*v49 + 12.0d0*v50 + &
      10.0d0*v51 + 10.0d0*v80 + 10.0d0*v81 + 10.0d0*v82 + 10.0d0*v83)) &
      + M_0*S_xxyy + v44 + v48 + v77 + v79
    S_xxyz  = v2*(v3 + v84)
    Ms_xxyz = 0.142857142857143d0*(12.0d0*(v87 + v88) + 9.0d0*(v85 + v86 + v92 + v93) &
      + 2.0d0*(-v89 + v90 - v91 + v94)) + M_0*S_xxyz + M_xxyz + M_xxz*y &
      + M_xyz*v78 + M_y*S_xxz + S_xyz*v76
    S_xyyy  = v0*v95
    Ms_xyyy = M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v56 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v57 - 2.0d0*v58 - 2.0d0*v59 - 2.0d0*v60 + 5.0d0*v61 &
      + 5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64))
    S_xyyz  = v1*(v4 + v84)
    Ms_xyyz = 0.142857142857143d0*(12.0d0*(v68 + v72) + 2.0d0*(-v65 + v66 - v67 + v73 &
      ) + 9.0d0*(v69 + v70 + v71 + v74)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v43 + M_yyz*x + S_xyz*v47
    S_yyyy  = -v35*v4 + b4 + v34
    Ms_yyyy = M_0*S_yyyy + v39 - v77 - v79 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v49 - 96.0d0*v50 + 24.0d0*(v41 + v46) + &
      80.0d0*(v80 + v81) - 60.0d0*(v82 + v83))
    S_yyyz  = v2*v95
    Ms_yyyz = M_0*S_yyyz - M_x*v55 + M_yyyz - v54*x + 0.142857142857143d0*(15.0d0*(v89 &
      + v91) + 13.0d0*(v90 + v94) + 21.0d0*(M_yy*S_yz + M_yz*S_yy) + &
      6.0d0*(v85 + v86 - v87 - v88 + v92 + v93))
#undef  y                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
#undef  z                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
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
#undef  M_xxyz              
#undef  Ms_xxyz             
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
    end subroutine mom_es_M2M
    
! OPS  169*ADD + 2*DIV + 282*MUL + 28*NEG + POW + 7*SUB = 489  (638 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v54, v55, v6, v7, v8, v9, h, u, D_0, D_x,&
                D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy,&
                D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define M_z                  M(3)
#define L_z                  L(3)
#define M_xx                 M(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define L_xz                 L(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define M_yz                 M(8)
#define L_yz                 L(8)
#define L_xxx                L(9)
#define M_xxx                M(9)
#define L_xxy                L(10)
#define M_xxy                M(10)
#define L_xxz                L(11)
#define M_xxz                M(11)
#define L_xyy                L(12)
#define M_xyy                M(12)
#define M_xyz                M(13)
#define L_xyz                L(13)
#define L_yyy                L(14)
#define M_yyy                M(14)
#define L_yyz                L(15)
#define M_yyz                M(15)
#define M_xxxx               M(16)
#define L_xxxx               L(16)
#define M_xxxy               M(17)
#define L_xxxy               L(17)
#define L_xxxz               L(18)
#define M_xxxz               M(18)
#define M_xxyy               M(19)
#define L_xxyy               L(19)
#define L_xxyz               L(20)
#define M_xxyz               M(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define L_xyyz               L(22)
#define M_xyyz               M(22)
#define L_yyyy               L(23)
#define M_yyyy               M(23)
#define M_yyyz               M(24)
#define L_yyyz               L(24)
    v55    = y*z
    v54    = 15.0d0*v55
    v24    = 0.5d0*M_xx
    v31    = 0.166666666666667d0*M_xxx
    v32    = 0.5d0*M_xxy
    v33    = 0.5d0*M_xxz
    v40    = 0.5d0*M_yy
    v42    = 0.166666666666667d0*M_yyy
    v43    = 0.5d0*M_yyz
    M_zz   = -(M_xx + M_yy)
    v47    = 0.5d0*M_zz
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    v48    = 0.166666666666667d0*M_zzz
    M_xxzz = -(M_xxxx + M_xxyy)
    M_xyzz = -(M_xxxy + M_xyyy)
    M_xzzz = -(M_xxxz + M_xyyz)
    M_yyzz = -(M_xxyy + M_yyyy)
    M_yzzz = -(M_xxyz + M_yyyz)
    M_zzzz = -(M_xxzz + M_yyzz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v49    = 5.0d0*v0
    v8     = v49
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
    v50    = 3.0d0*h
    v4     = -h
    v10    = v50
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v28    = v19 + v27
    u2     = 1.0/h
    u      = sqrt(u2)
    D_0    = u
    u3     = u*u2
    v2     = u3
    D_x    = -v2*x
    D_y    = -v2*y
    D_z    = -v2*z
    u4     = u2*u2
    u5     = u2*u3
    v3     = u5
    v51    = 3.0d0*v3
    v5     = v51*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v51*v55
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v52    = 3.0d0*v6
    v7     = v6*x
    v9     = v52*(h - v8)
    D_xxx  = -3.0d0*v7*(v49 - v50)
    D_xxy  = v9*y
    D_xxz  = v9*z
    D_xyy  = v11*v7
    v34    = 0.5d0*D_xyy
    D_xyz  = -v54*v7
    D_xzz  = -(D_xxx + D_xyy)
    v37    = 0.5d0*D_xzz
    D_yyy  = v52*y*(v10 - v12)
    D_yyz  = v11*v6*z
    D_yzz  = -(D_xxy + D_yyy)
    v44    = 0.5d0*D_yzz
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v53    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v53*y
    v22    = v53*z
    v23    = v13*v54
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = D_xxxx*M_0
    D_xxxy = v18*v21
    L_xxxy = D_xxxy*M_0
    D_xxxz = v21*v22
    L_xxx  = D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z
    L_xxxz = D_xxxz*M_0
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    v25    = 0.5d0*D_xxyy
    L_xxyy = D_xxyy*M_0
    D_xxyz = v23*(v20 + v4)
    L_xxy  = D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    v26    = 0.5d0*D_xxzz
    L_xx   = D_xx*M_0 + D_xxx*M_x + D_xxxx*v24 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyz*M_yz + D_xxz*M_z + M_yy*v25 + M_zz*v26
    L_xxz  = D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z
    D_xyyy = v18*v28
    v29    = 0.5d0*D_xyyy
    v35    = 0.166666666666667d0*D_xyyy
    L_xyyy = D_xyyy*M_0
    D_xyyz = v22*(v27 + v4)
    v36    = 0.5d0*D_xyyz
    L_xyy  = D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    v30    = 0.5d0*D_xyzz
    L_xy   = D_xxxy*v24 + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyz*M_yz + D_xyz*M_z + M_yy*v29 + M_zz*v30
    L_xyz  = D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z
    D_xzzz = -(D_xxxz + D_xyyz)
    v38    = 0.166666666666667d0*D_xzzz
    v39    = 0.5d0*D_xzzz
    L_x    = D_x*M_0 + D_xx*M_x + D_xxx*v24 + D_xxxx*v31 + D_xxxy*v32 + D_xxxz*v33 + &
      D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + &
      D_xz*M_z + M_xyy*v25 + M_xzz*v26 + M_yy*v34 + M_yyy*v35 + M_yyz* &
      v36 + M_yzz*v30 + M_zz*v37 + M_zzz*v38
    L_xz   = D_xxxz*v24 + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + D_xyzz* &
      M_yz + D_xz*M_0 + D_xzz*M_z + M_yy*v36 + M_zz*v39
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = D_yyyy*M_0
    D_yyyz = v23*v28
    L_yyy  = D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    v41    = 0.5d0*D_yyzz
    L_yy   = D_xxyy*v24 + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*v40 + D_yyyz*M_yz + D_yyz*M_z + M_zz*v41
    L_yyz  = D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z
    D_yzzz = -(D_xxyz + D_yyyz)
    v45    = 0.166666666666667d0*D_yzzz
    v46    = 0.5d0*D_yzzz
    L_y    = D_xxxy*v31 + D_xxy*v24 + D_xxyy*v32 + D_xxyz*v33 + D_xy*M_x + D_xyy*M_xy &
      + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v40 + &
      D_yyyy*v42 + D_yyyz*v43 + D_yyz*M_yz + D_yz*M_z + M_xyy*v29 + &
      M_xzz*v30 + M_yzz*v41 + M_zz*v44 + M_zzz*v45
    L_yz   = D_xxyz*v24 + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*v40 + D_yyz* &
      M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + M_zz*v46
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = 0.0416666666666667d0*(D_xxxx*M_xxxx + 12.0d0*D_xxyz*M_xxyz + D_yyyy* &
      M_yyyy + D_zzzz*M_zzzz + 4.0d0*(D_xxxy*M_xxxy + D_xxxz*M_xxxz + &
      D_yyyz*M_yyyz) + 6.0d0*(D_xxyy*M_xxyy + D_xxzz*M_xxzz + D_yyzz* &
      M_yyzz)) + D_0*M_0 + D_x*M_x + D_xx*v24 + D_xxx*v31 + D_xxy*v32 + &
      D_xxz*v33 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + D_yy* &
      v40 + D_yyy*v42 + D_yyz*v43 + D_yz*M_yz + D_z*M_z + D_zz*v47 + &
      D_zzz*v48 + M_xyy*v34 + M_xyyy*v35 + M_xyyz*v36 + M_xyzz*v30 + &
      M_xzz*v37 + M_xzzz*v38 + M_yzz*v44 + M_yzzz*v45
    L_z    = D_xxxz*v31 + D_xxyz*v32 + D_xxz*v24 + D_xxzz*v33 + D_xyz*M_xy + D_xyzz* &
      M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyz*v42 + D_yyz*v40 + D_yyzz* &
      v43 + D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v47 + &
      D_zzzz*v48 + M_xyy*v36 + M_xzz*v39 + M_yzz*v46
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  M_z                 
#undef  L_z                 
#undef  M_xx                
#undef  L_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
#undef  M_yy                
#undef  L_yy                
#undef  M_yz                
#undef  L_yz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  M_xxy               
#undef  L_xxz               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  M_xyz               
#undef  L_xyz               
#undef  L_yyy               
#undef  M_yyy               
#undef  L_yyz               
#undef  M_yyz               
#undef  M_xxxx              
#undef  L_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  M_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_yyyz              
    end subroutine mom_es_M2L
    
! OPS  117*ADD + 2*DIV + 144*MUL + 10*NEG + POW = 274  (497 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Ls_0                 Ls(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_0                  L(0)
#define L_x                  L(1)
#define Ls_x                 Ls(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define Ls_xx                Ls(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define Ls_xy                Ls(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
#define Ls_yy                Ls(7)
#define L_yy                 L(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
#define Ls_xxx               Ls(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define Ls_xxy               Ls(10)
#define L_xxz                L(11)
#define Ls_xxz               Ls(11)
#define L_xyy                L(12)
#define Ls_xyy               Ls(12)
#define L_xyz                L(13)
#define Ls_xyz               Ls(13)
#define L_yyy                L(14)
#define Ls_yyy               Ls(14)
#define L_yyz                L(15)
#define Ls_yyz               Ls(15)
#define Ls_xxxx              Ls(16)
#define L_xxxx               L(16)
#define Ls_xxxy              Ls(17)
#define L_xxxy               L(17)
#define Ls_xxxz              Ls(18)
#define L_xxxz               L(18)
#define L_xxyy               L(19)
#define Ls_xxyy              Ls(19)
#define L_xxyz               L(20)
#define Ls_xxyz              Ls(20)
#define L_xyyy               L(21)
#define Ls_xyyy              Ls(21)
#define L_xyyz               L(22)
#define Ls_xyyz              Ls(22)
#define Ls_yyyy              Ls(23)
#define L_yyyy               L(23)
#define L_yyyz               L(24)
#define Ls_yyyz              Ls(24)
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
    v21     = L_xz*z
    v31     = 0.5d0*x
    v37     = L_yyz*z
    v40     = L_yz*z
    v44     = 0.5d0*y
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
    v33     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v46     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    v14     = L_xxz + L_xxyz*y + L_xxzz*z
    Ls_xxz  = L_xxxz*x + v14
    L_xyzz  = -(L_xxxy + L_xyyy)
    v19     = L_xyz + L_xyzz*z
    v20     = L_xyyz*y + v19
    v36     = v19*y
    Ls_xyz  = L_xxyz*x + v20
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    v39     = L_yyz + L_yyzz*z
    Ls_yyz  = v39 + L_xyyz*x + L_yyyz*y
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v8      = 0.5d0*v7
    a3      = a1*a2
    v22     = 0.166666666666667d0*a3
    a4      = a2*a2
    b2      = b1*b1
    v9      = b2
    v10     = L_xxyy*v9
    v16     = L_xyyy*v9
    v28     = 0.5d0*v9
    v34     = L_xyyz*v9
    b3      = b1*b2
    v23     = b3
    v24     = L_xyyy*v23
    v41     = 0.166666666666667d0*v23
    b4      = b2*b2
    c2      = c1*c1
    v11     = c2
    v48     = 0.5d0*v11
    v25     = L_xzz*v11
    v42     = L_yzz*v11
    v12     = L_xxzz*v11
    v32     = v10 + v12 + 2.0d0*(L_xx + v13 + v6)
    Ls_xx   = 0.5d0*(v10 + v12) + L_xx + L_xxxx*v8 + v0*x + v13 + v6
    v17     = L_xyzz*v11
    v29     = v17 + 2.0d0*(L_xy + v15)
    v30     = v29*y
    Ls_xy   = 0.5d0*(v16 + v17) + L_xxxy*v8 + L_xy + v15 + v18 + v2*x
    v35     = L_xzzz*v11
    Ls_xz   = 0.5d0*(v34 + v35) + L_xxxz*v8 + L_xz + v14*x + v33 + v36
    v38     = L_yyzz*v11
    v45     = v38 + 2.0d0*(L_yy + v37)
    Ls_yy   = 0.5d0*v38 + L_xxyy*v8 + L_yy + L_yyyy*v28 + v37 + v4*x + v5*y
    v47     = L_yzzz*v11
    Ls_yz   = 0.5d0*v47 + L_xxyz*v8 + L_yyyz*v28 + L_yz + v20*x + v39*y + v46
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
    v26     = c3
    v49     = 0.166666666666667d0*v26
    v27     = L_xzzz*v26
    Ls_x    = 0.166666666666667d0*(v24 + v27 + 3.0d0*(v25 + v30)) + L_x + L_xxxx*v22 + &
      v0*v8 + v21 + v28*v3 + v31*v32
    v43     = L_yzzz*v26
    Ls_y    = 0.166666666666667d0*(3.0d0*v42 + v43) + L_xxxy*v22 + L_y + L_yyyy*v41 + &
      v2*v8 + v28*v5 + v31*(v16 + 2.0d0*v18 + v29) + v40 + v44*v45
    Ls_z    = L_z + L_xxxz*v22 + L_yyyz*v41 + L_zz*z + L_zzz*v48 + L_zzzz*v49 + v14*v8 &
      + v28*v39 + v31*(2.0d0*L_xz + 2.0d0*v33 + v34 + v35 + 2.0d0*v36) &
      + v44*(2.0d0*L_yz + 2.0d0*v46 + v47)
    c4      = c2*c2
    Ls_0    = 0.0416666666666667d0*(L_xxxx*a4 + L_yyyy*b4 + L_zzzz*c4 + 6.0d0*(v32*v7 &
      + v45*v9) + 4.0d0*(x*(6.0d0*L_x + 6.0d0*v21 + v24 + 3.0d0*v25 + &
      v27 + 3.0d0*v3*v9 + 3.0d0*v30) + y*(6.0d0*L_y + 6.0d0*v40 + 3.0d0 &
      *v42 + v43))) + L_0 + L_z*z + L_zz*v48 + L_zzz*v49 + v0*v22 + v41 &
      *v5
#undef  Ls_0                
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_0                 
#undef  L_x                 
#undef  Ls_x                
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
    
! OPS  108*ADD + 2*DIV + 135*MUL + 11*NEG + POW = 257  (456 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v5, v6, v7,&
                v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz,&
                L_xzzz, L_yyzz, L_yzzz, L_zzzz
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
#define L_xxxx               L(16)
#define L_xxxy               L(17)
#define L_xxxz               L(18)
#define L_xxyy               L(19)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define L_xyyz               L(22)
#define L_yyyy               L(23)
#define L_yyyz               L(24)
    v0     = L_xxz*z
    v7     = L_xxy + L_xxyz*z
    v8     = v7*y
    v9     = L_xxx + L_xxxy*y + L_xxxz*z
    v10    = L_xyz*z
    v13    = L_xyy + L_xyyz*z
    v14    = v13*y
    v15    = L_xxyy*y + v7
    v16    = L_xz*z
    v26    = 0.5d0*x
    v34    = L_yyz*z
    v36    = L_yyy + L_yyyz*z
    v37    = L_yz*z
    v41    = 0.5d0*y
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    v28    = L_xzz*z
    L_yzz  = -(L_xxy + L_yyy)
    v43    = L_yzz*z
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    v33    = L_xxz + L_xxyz*y + L_xxzz*z
    L_xyzz = -(L_xxxy + L_xyyy)
    v31    = L_xyz + L_xyzz*z
    v32    = v31*y
    L_xzzz = -(L_xxxz + L_xyyz)
    L_yyzz = -(L_xxyy + L_yyyy)
    v45    = L_yyz + L_yyzz*z
    L_yzzz = -(L_xxyz + L_yyyz)
    L_zzzz = -(L_xxzz + L_yyzz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v1     = a2
    v2     = 0.5d0*v1
    a3     = a1*a2
    v17    = 0.166666666666667d0*a3
    a4     = a2*a2
    b2     = b1*b1
    v3     = b2
    v4     = L_xxyy*v3
    v11    = L_xyyy*v3
    v23    = 0.5d0*v3
    v29    = L_xyyz*v3
    b3     = b1*b2
    v18    = b3
    v19    = L_xyyy*v18
    v38    = 0.166666666666667d0*v18
    b4     = b2*b2
    c2     = c1*c1
    v5     = c2
    v46    = 0.5d0*v5
    v20    = L_xzz*v5
    v39    = L_yzz*v5
    v6     = L_xxzz*v5
    v27    = v4 + v6 + 2.0d0*(L_xx + v0 + v8)
    Phi_xx = 0.5d0*(v4 + v6) + L_xx + L_xxxx*v2 + v0 + v8 + v9*x
    v12    = L_xyzz*v5
    v24    = v12 + 2.0d0*(L_xy + v10)
    v25    = v24*y
    Phi_xy = 0.5d0*(v11 + v12) + L_xxxy*v2 + L_xy + v10 + v14 + v15*x
    v30    = L_xzzz*v5
    Phi_xz = 0.5d0*(v29 + v30) + L_xxxz*v2 + L_xz + v28 + v32 + v33*x
    v35    = L_yyzz*v5
    v42    = v35 + 2.0d0*(L_yy + v34)
    Phi_yy = 0.5d0*v35 + L_xxyy*v2 + L_yy + L_yyyy*v23 + v34 + v36*y + x*(L_xyyy*y + &
      v13)
    Phi_zz = -(Phi_xx + Phi_yy)
    v44    = L_yzzz*v5
    Phi_yz = 0.5d0*v44 + L_xxyz*v2 + L_yyyz*v23 + L_yz + v43 + v45*y + x*(L_xyyz*y + &
      v31)
    h      = v1 + v3 + v5
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
    v21    = c3
    v47    = 0.166666666666667d0*v21
    v22    = L_xzzz*v21
    Phi_x  = 0.166666666666667d0*(v19 + v22 + 3.0d0*(v20 + v25)) + L_x + L_xxxx*v17 + &
      v13*v23 + v16 + v2*v9 + v26*v27
    v40    = L_yzzz*v21
    Phi_y  = 0.166666666666667d0*(3.0d0*v39 + v40) + L_xxxy*v17 + L_y + L_yyyy*v38 + &
      v15*v2 + v23*v36 + v26*(v11 + 2.0d0*v14 + v24) + v37 + v41*v42
    Phi_z  = L_z + L_xxxz*v17 + L_yyyz*v38 + L_zz*z + L_zzz*v46 + L_zzzz*v47 + v2*v33 &
      + v23*v45 + v26*(2.0d0*L_xz + 2.0d0*v28 + v29 + v30 + 2.0d0*v32) &
      + v41*(2.0d0*L_yz + 2.0d0*v43 + v44)
    c4     = c2*c2
    Phi_0  = 0.0416666666666667d0*(L_xxxx*a4 + L_yyyy*b4 + L_zzzz*c4 + 6.0d0*(v1*v27 &
      + v3*v42) + 4.0d0*(x*(6.0d0*L_x + 3.0d0*v13*v3 + 6.0d0*v16 + v19 &
      + 3.0d0*v20 + v22 + 3.0d0*v25) + y*(6.0d0*L_y + 6.0d0*v37 + 3.0d0 &
      *v39 + v40))) + L_0 + L_z*z + L_zz*v46 + L_zzz*v47 + v17*v9 + v36 &
      *v38
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
    
! OPS  176*ADD + 294*MUL + 21*NEG + 61*SUB = 552  (845 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60,&
                v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71,&
                v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82,&
                v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93,&
                v94, v95, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, S_0, S_x, S_y, S_z, S_xx,&
                S_xy, S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy,&
                S_xyz, S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy,&
                S_xxxz, S_xxyy, S_xxyz, S_xyyy, S_xyyz, S_yyyy, S_yyyz
#define y                    r(2)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
#define z                    r(3)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define M_xy                 M(5)
#define Ms_xy                Ms(5)
#define M_xz                 M(6)
#define Ms_xz                Ms(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
#define M_xxx                M(9)
#define Ms_xxx               Ms(9)
#define M_xxy                M(10)
#define Ms_xxy               Ms(10)
#define Ms_xxz               Ms(11)
#define M_xxz                M(11)
#define M_xyy                M(12)
#define Ms_xyy               Ms(12)
#define M_xyz                M(13)
#define Ms_xyz               Ms(13)
#define Ms_yyy               Ms(14)
#define M_yyy                M(14)
#define M_yyz                M(15)
#define Ms_yyz               Ms(15)
#define M_xxxx               M(16)
#define Ms_xxxx              Ms(16)
#define M_xxxy               M(17)
#define Ms_xxxy              Ms(17)
#define Ms_xxxz              Ms(18)
#define M_xxxz               M(18)
#define Ms_xxyy              Ms(19)
#define M_xxyy               M(19)
#define M_xxyz               M(20)
#define Ms_xxyz              Ms(20)
#define M_xyyy               M(21)
#define Ms_xyyy              Ms(21)
#define Ms_xyyz              Ms(22)
#define M_xyyz               M(22)
#define M_yyyy               M(23)
#define Ms_yyyy              Ms(23)
#define M_yyyz               M(24)
#define Ms_yyyz              Ms(24)
    v0      = x*y
    v1      = x*z
    v2      = y*z
    v6      = M_x*x
    v7      = M_y*y
    v8      = -0.666666666666667d0*M_z*z
    v11     = M_xx*x
    v12     = M_xy*y
    v13     = M_xz*z
    v19     = M_xy*x
    v21     = M_yy*y
    v22     = M_yz*z
    v25     = M_xx*z
    v26     = M_xz*x
    v28     = M_yy*z
    v29     = M_yz*y
    v42     = M_xxx*x
    v43     = 1.71428571428571d0*y
    v44     = M_xxy*v43
    v45     = M_xxz*z
    v47     = 1.71428571428571d0*M_y
    v54     = 0.857142857142857d0*M_xyz
    v59     = M_xxy*x
    v62     = M_xyy*y
    v66     = M_xxx*z
    v67     = M_xxz*x
    v69     = M_xyy*z
    v76     = 1.71428571428571d0*M_x
    v78     = 1.71428571428571d0*x
    v79     = M_xyy*v78
    v81     = M_yyy*y
    v82     = M_yyz*z
    v86     = M_xxy*z
    v90     = M_yyy*z
    v91     = M_yyz*y
    Ms_0    = Ms_0 + (M_0)
    Ms_x    = Ms_x + (M_0*x + M_x)
    Ms_y    = Ms_y + (M_0*y + M_y)
    Ms_z    = Ms_z + (M_0*z + M_z)
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
    v14     = M_y*S_xy
    v18     = M_x*S_xy
    v37     = M_xy*S_xy
    v58     = M_xx*S_xy
    v64     = M_yy*S_xy
    v72     = M_yz*S_xy
    v88     = M_xz*S_xy
    Ms_xy   = Ms_xy + (M_xy + M_0*S_xy + M_x*y + M_y*x)
    S_xz    = v1
    v15     = M_z*S_xz
    v24     = M_x*S_xz
    v46     = M_xz*S_xz
    v71     = M_yy*S_xz
    v87     = M_xy*S_xz
    Ms_xz   = Ms_xz + (M_xz + M_0*S_xz + M_x*z + M_z*x)
    S_yz    = v2
    v23     = M_z*S_yz
    v27     = M_y*S_yz
    v50     = M_yz*S_yz
    v68     = M_xy*S_yz
    v85     = M_xx*S_yz
    Ms_yz   = Ms_yz + (M_yz + M_0*S_yz + M_y*z + M_z*y)
    S_xyz   = v0*z
    v55     = 0.857142857142857d0*S_xyz
    v56     = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v55 + v54*z)
    Ms_xyz  = Ms_xyz + (M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v3      = a2
    a3      = a1*a2
    a4      = a2*a2
    b2      = b1*b1
    v4      = b2
    b3      = b1*b2
    b4      = b2*b2
    c2      = c1*c1
    h       = c2 + v3 + v4
    v5      = -0.333333333333333d0*h
    v9      = -0.6d0*h
    v16     = -0.2d0*h
    v17     = v16 + v3
    v32     = v16 + v4
    v33     = h*h
    v34     = 0.0857142857142857d0*v33
    v35     = 0.857142857142857d0*h
    v52     = -0.428571428571429d0*h
    v53     = v3 + v52
    v75     = 0.142857142857143d0*h
    v84     = -v75
    v95     = v4 + v52
    S_xx    = v3 + v5
    v10     = M_x*S_xx
    v30     = M_z*S_xx
    v38     = M_yy*S_xx
    v41     = M_xx*S_xx
    v60     = M_xy*S_xx
    v92     = M_yz*S_xx
    Ms_xx   = Ms_xx + (0.333333333333333d0*(4.0d0*v6 - 2.0d0*v7) + M_0*S_xx + M_xx + v8)
    S_yy    = v4 + v5
    v20     = M_y*S_yy
    v31     = M_z*S_yy
    v36     = M_xx*S_yy
    v39     = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v37 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v36 + 4.0d0*v38))
    v49     = M_yy*S_yy
    v61     = M_xy*S_yy
    v70     = M_xz*S_yy
    Ms_yy   = Ms_yy + (0.333333333333333d0*(-2.0d0*v6 + 4.0d0*v7) + M_0*S_yy + M_yy + v8)
    S_zz    = -(S_xx + S_yy)
    S_xxx   = x*(v3 + v9)
    v40     = M_x*S_xxx
    v73     = M_z*S_xxx
    Ms_xxx  = Ms_xxx + (M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v10 + 3.0d0*v11 - 2.0d0*v12 - &
      2.0d0*v13 - 2.0d0*v14 - 2.0d0*v15)))
    S_xxy   = v17*y
    v48     = S_xxy*v47
    v57     = M_x*S_xxy
    v93     = M_z*S_xxy
    Ms_xxy  = Ms_xxy + (M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v18 + 4.0d0* &
      v19 - v20 - v21 - v22 - v23)))
    S_xxz   = v17*z
    v51     = M_z*S_xxz
    v65     = M_x*S_xxz
    Ms_xxz  = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v24 + v26) + 7.0d0*(v25 + v30) + 2.0d0 &
      *(-v27 + v28 - v29 + v31)))
    S_xyy   = v32*x
    v63     = M_y*S_xyy
    v74     = M_z*S_xyy
    v77     = S_xyy*v76
    Ms_xyy  = Ms_xyy + (M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v10 - v11 + 4.0d0 &
      *v12 - v13 + 4.0d0*v14 - v15)))
    S_xzz   = -(S_xxx + S_xyy)
    S_yyy   = y*(v4 + v9)
    v80     = M_y*S_yyy
    v94     = M_z*S_yyy
    Ms_yyy  = Ms_yyy + (M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v18 - 2.0d0*v19 + 3.0d0*v20 + &
      3.0d0*v21 - 2.0d0*v22 - 2.0d0*v23)))
    S_yyz   = v32*z
    v83     = M_z*S_yyz
    v89     = M_y*S_yyz
    Ms_yyz  = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v27 + v29) + 7.0d0*(v28 + v31) + 2.0d0 &
      *(-v24 + v25 - v26 + v30)))
    S_yzz   = -(S_xxy + S_yyy)
    S_zzz   = -(S_xxz + S_yyz)
    S_xxxx  = -v3*v35 + a4 + v34
    Ms_xxxx = Ms_xxxx + (M_0*S_xxxx + v39 - v44 - v48 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v41 - 96.0d0*v46 + 80.0d0*(v40 + v42) - &
      60.0d0*(v45 + v51) + 24.0d0*(v49 + v50)))
    S_xxxy  = v0*v53
    Ms_xxxy = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v56 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v57 + 5.0d0*v58 + 5.0d0*v59 + 5.0d0*v60 - 2.0d0*v61 &
      - 2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64)))
    S_xxxz  = v1*v53
    Ms_xxxz = Ms_xxxz + (M_0*S_xxxz + M_xxxz - M_y*v55 - v54*y + 0.142857142857143d0*(15.0d0*(v65 &
      + v67) + 13.0d0*(v66 + v73) + 21.0d0*(M_xx*S_xz + M_xz*S_xx) + &
      6.0d0*(-v68 + v69 + v70 + v71 - v72 + v74)))
    S_xxyy  = 0.0285714285714286d0*v33 + v3*v4 - v3*v75 - v4*v75
    Ms_xxyy = Ms_xxyy + (0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v37 + 39.0d0*(v36 + v38) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v40 + 12.0d0*v41 + &
      10.0d0*v42 + 10.0d0*v45 + 12.0d0*v46 + 12.0d0*v49 + 12.0d0*v50 + &
      10.0d0*v51 + 10.0d0*v80 + 10.0d0*v81 + 10.0d0*v82 + 10.0d0*v83)) &
      + M_0*S_xxyy + v44 + v48 + v77 + v79)
    S_xxyz  = v2*(v3 + v84)
    Ms_xxyz = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v87 + v88) + 9.0d0*(v85 + v86 + v92 + v93) &
      + 2.0d0*(-v89 + v90 - v91 + v94)) + M_0*S_xxyz + M_xxyz + M_xxz*y &
      + M_xyz*v78 + M_y*S_xxz + S_xyz*v76)
    S_xyyy  = v0*v95
    Ms_xyyy = Ms_xyyy + (M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v56 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v57 - 2.0d0*v58 - 2.0d0*v59 - 2.0d0*v60 + 5.0d0*v61 &
      + 5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64)))
    S_xyyz  = v1*(v4 + v84)
    Ms_xyyz = Ms_xyyz + (0.142857142857143d0*(12.0d0*(v68 + v72) + 2.0d0*(-v65 + v66 - v67 + v73 &
      ) + 9.0d0*(v69 + v70 + v71 + v74)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v43 + M_yyz*x + S_xyz*v47)
    S_yyyy  = -v35*v4 + b4 + v34
    Ms_yyyy = Ms_yyyy + (M_0*S_yyyy + v39 - v77 - v79 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v49 - 96.0d0*v50 + 24.0d0*(v41 + v46) + &
      80.0d0*(v80 + v81) - 60.0d0*(v82 + v83)))
    S_yyyz  = v2*v95
    Ms_yyyz = Ms_yyyz + (M_0*S_yyyz - M_x*v55 + M_yyyz - v54*x + 0.142857142857143d0*(15.0d0*(v89 &
      + v91) + 13.0d0*(v90 + v94) + 21.0d0*(M_yy*S_yz + M_yz*S_yy) + &
      6.0d0*(v85 + v86 - v87 - v88 + v92 + v93)))
#undef  y                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
#undef  z                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
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
#undef  M_xxyz              
#undef  Ms_xxyz             
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
    end subroutine mom_es_M2M_add
    
! OPS  169*ADD + 2*DIV + 282*MUL + 28*NEG + POW + 7*SUB = 489  (638 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v54, v55, v6, v7, v8, v9, h, u, D_0, D_x,&
                D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy,&
                D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define M_z                  M(3)
#define L_z                  L(3)
#define M_xx                 M(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define L_xz                 L(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define M_yz                 M(8)
#define L_yz                 L(8)
#define L_xxx                L(9)
#define M_xxx                M(9)
#define L_xxy                L(10)
#define M_xxy                M(10)
#define L_xxz                L(11)
#define M_xxz                M(11)
#define L_xyy                L(12)
#define M_xyy                M(12)
#define M_xyz                M(13)
#define L_xyz                L(13)
#define L_yyy                L(14)
#define M_yyy                M(14)
#define L_yyz                L(15)
#define M_yyz                M(15)
#define M_xxxx               M(16)
#define L_xxxx               L(16)
#define M_xxxy               M(17)
#define L_xxxy               L(17)
#define L_xxxz               L(18)
#define M_xxxz               M(18)
#define M_xxyy               M(19)
#define L_xxyy               L(19)
#define L_xxyz               L(20)
#define M_xxyz               M(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define L_xyyz               L(22)
#define M_xyyz               M(22)
#define L_yyyy               L(23)
#define M_yyyy               M(23)
#define M_yyyz               M(24)
#define L_yyyz               L(24)
    v55    = y*z
    v54    = 15.0d0*v55
    v24    = 0.5d0*M_xx
    v31    = 0.166666666666667d0*M_xxx
    v32    = 0.5d0*M_xxy
    v33    = 0.5d0*M_xxz
    v40    = 0.5d0*M_yy
    v42    = 0.166666666666667d0*M_yyy
    v43    = 0.5d0*M_yyz
    M_zz   = -(M_xx + M_yy)
    v47    = 0.5d0*M_zz
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    v48    = 0.166666666666667d0*M_zzz
    M_xxzz = -(M_xxxx + M_xxyy)
    M_xyzz = -(M_xxxy + M_xyyy)
    M_xzzz = -(M_xxxz + M_xyyz)
    M_yyzz = -(M_xxyy + M_yyyy)
    M_yzzz = -(M_xxyz + M_yyyz)
    M_zzzz = -(M_xxzz + M_yyzz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v49    = 5.0d0*v0
    v8     = v49
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
    v50    = 3.0d0*h
    v4     = -h
    v10    = v50
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v28    = v19 + v27
    u2     = 1.0/h
    u      = sqrt(u2)
    D_0    = u
    u3     = u*u2
    v2     = u3
    D_x    = -v2*x
    D_y    = -v2*y
    D_z    = -v2*z
    u4     = u2*u2
    u5     = u2*u3
    v3     = u5
    v51    = 3.0d0*v3
    v5     = v51*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v51*v55
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v52    = 3.0d0*v6
    v7     = v6*x
    v9     = v52*(h - v8)
    D_xxx  = -3.0d0*v7*(v49 - v50)
    D_xxy  = v9*y
    D_xxz  = v9*z
    D_xyy  = v11*v7
    v34    = 0.5d0*D_xyy
    D_xyz  = -v54*v7
    D_xzz  = -(D_xxx + D_xyy)
    v37    = 0.5d0*D_xzz
    D_yyy  = v52*y*(v10 - v12)
    D_yyz  = v11*v6*z
    D_yzz  = -(D_xxy + D_yyy)
    v44    = 0.5d0*D_yzz
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v53    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v53*y
    v22    = v53*z
    v23    = v13*v54
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = L_xxxx + (D_xxxx*M_0)
    D_xxxy = v18*v21
    L_xxxy = L_xxxy + (D_xxxy*M_0)
    D_xxxz = v21*v22
    L_xxx  = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z)
    L_xxxz = L_xxxz + (D_xxxz*M_0)
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    v25    = 0.5d0*D_xxyy
    L_xxyy = L_xxyy + (D_xxyy*M_0)
    D_xxyz = v23*(v20 + v4)
    L_xxy  = L_xxy + (D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z)
    L_xxyz = L_xxyz + (D_xxyz*M_0)
    D_xxzz = -(D_xxxx + D_xxyy)
    v26    = 0.5d0*D_xxzz
    L_xx   = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*v24 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyz*M_yz + D_xxz*M_z + M_yy*v25 + M_zz*v26)
    L_xxz  = L_xxz + (D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z)
    D_xyyy = v18*v28
    v29    = 0.5d0*D_xyyy
    v35    = 0.166666666666667d0*D_xyyy
    L_xyyy = L_xyyy + (D_xyyy*M_0)
    D_xyyz = v22*(v27 + v4)
    v36    = 0.5d0*D_xyyz
    L_xyy  = L_xyy + (D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z)
    L_xyyz = L_xyyz + (D_xyyz*M_0)
    D_xyzz = -(D_xxxy + D_xyyy)
    v30    = 0.5d0*D_xyzz
    L_xy   = L_xy + (D_xxxy*v24 + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyz*M_yz + D_xyz*M_z + M_yy*v29 + M_zz*v30)
    L_xyz  = L_xyz + (D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z)
    D_xzzz = -(D_xxxz + D_xyyz)
    v38    = 0.166666666666667d0*D_xzzz
    v39    = 0.5d0*D_xzzz
    L_x    = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*v24 + D_xxxx*v31 + D_xxxy*v32 + D_xxxz*v33 + &
      D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + &
      D_xz*M_z + M_xyy*v25 + M_xzz*v26 + M_yy*v34 + M_yyy*v35 + M_yyz* &
      v36 + M_yzz*v30 + M_zz*v37 + M_zzz*v38)
    L_xz   = L_xz + (D_xxxz*v24 + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + D_xyzz* &
      M_yz + D_xz*M_0 + D_xzz*M_z + M_yy*v36 + M_zz*v39)
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = L_yyyy + (D_yyyy*M_0)
    D_yyyz = v23*v28
    L_yyy  = L_yyy + (D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z)
    L_yyyz = L_yyyz + (D_yyyz*M_0)
    D_yyzz = -(D_xxyy + D_yyyy)
    v41    = 0.5d0*D_yyzz
    L_yy   = L_yy + (D_xxyy*v24 + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*v40 + D_yyyz*M_yz + D_yyz*M_z + M_zz*v41)
    L_yyz  = L_yyz + (D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z)
    D_yzzz = -(D_xxyz + D_yyyz)
    v45    = 0.166666666666667d0*D_yzzz
    v46    = 0.5d0*D_yzzz
    L_y    = L_y + (D_xxxy*v31 + D_xxy*v24 + D_xxyy*v32 + D_xxyz*v33 + D_xy*M_x + D_xyy*M_xy &
      + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v40 + &
      D_yyyy*v42 + D_yyyz*v43 + D_yyz*M_yz + D_yz*M_z + M_xyy*v29 + &
      M_xzz*v30 + M_yzz*v41 + M_zz*v44 + M_zzz*v45)
    L_yz   = L_yz + (D_xxyz*v24 + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*v40 + D_yyz* &
      M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + M_zz*v46)
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = L_0 + (0.0416666666666667d0*(D_xxxx*M_xxxx + 12.0d0*D_xxyz*M_xxyz + D_yyyy* &
      M_yyyy + D_zzzz*M_zzzz + 4.0d0*(D_xxxy*M_xxxy + D_xxxz*M_xxxz + &
      D_yyyz*M_yyyz) + 6.0d0*(D_xxyy*M_xxyy + D_xxzz*M_xxzz + D_yyzz* &
      M_yyzz)) + D_0*M_0 + D_x*M_x + D_xx*v24 + D_xxx*v31 + D_xxy*v32 + &
      D_xxz*v33 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + D_yy* &
      v40 + D_yyy*v42 + D_yyz*v43 + D_yz*M_yz + D_z*M_z + D_zz*v47 + &
      D_zzz*v48 + M_xyy*v34 + M_xyyy*v35 + M_xyyz*v36 + M_xyzz*v30 + &
      M_xzz*v37 + M_xzzz*v38 + M_yzz*v44 + M_yzzz*v45)
    L_z    = L_z + (D_xxxz*v31 + D_xxyz*v32 + D_xxz*v24 + D_xxzz*v33 + D_xyz*M_xy + D_xyzz* &
      M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyz*v42 + D_yyz*v40 + D_yyzz* &
      v43 + D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v47 + &
      D_zzzz*v48 + M_xyy*v36 + M_xzz*v39 + M_yzz*v46)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  M_z                 
#undef  L_z                 
#undef  M_xx                
#undef  L_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
#undef  M_yy                
#undef  L_yy                
#undef  M_yz                
#undef  L_yz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  M_xxy               
#undef  L_xxz               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  M_xyz               
#undef  L_xyz               
#undef  L_yyy               
#undef  M_yyy               
#undef  L_yyz               
#undef  M_yyz               
#undef  M_xxxx              
#undef  L_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  M_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_yyyz              
    end subroutine mom_es_M2L_add
    
! OPS  117*ADD + 2*DIV + 144*MUL + 10*NEG + POW = 274  (497 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Ls_0                 Ls(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_0                  L(0)
#define L_x                  L(1)
#define Ls_x                 Ls(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define Ls_xx                Ls(4)
#define L_xx                 L(4)
#define L_xy                 L(5)
#define Ls_xy                Ls(5)
#define L_xz                 L(6)
#define Ls_xz                Ls(6)
#define Ls_yy                Ls(7)
#define L_yy                 L(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
#define Ls_xxx               Ls(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define Ls_xxy               Ls(10)
#define L_xxz                L(11)
#define Ls_xxz               Ls(11)
#define L_xyy                L(12)
#define Ls_xyy               Ls(12)
#define L_xyz                L(13)
#define Ls_xyz               Ls(13)
#define L_yyy                L(14)
#define Ls_yyy               Ls(14)
#define L_yyz                L(15)
#define Ls_yyz               Ls(15)
#define Ls_xxxx              Ls(16)
#define L_xxxx               L(16)
#define Ls_xxxy              Ls(17)
#define L_xxxy               L(17)
#define Ls_xxxz              Ls(18)
#define L_xxxz               L(18)
#define L_xxyy               L(19)
#define Ls_xxyy              Ls(19)
#define L_xxyz               L(20)
#define Ls_xxyz              Ls(20)
#define L_xyyy               L(21)
#define Ls_xyyy              Ls(21)
#define L_xyyz               L(22)
#define Ls_xyyz              Ls(22)
#define Ls_yyyy              Ls(23)
#define L_yyyy               L(23)
#define L_yyyz               L(24)
#define Ls_yyyz              Ls(24)
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
    v21     = L_xz*z
    v31     = 0.5d0*x
    v37     = L_yyz*z
    v40     = L_yz*z
    v44     = 0.5d0*y
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
    v33     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v46     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    v14     = L_xxz + L_xxyz*y + L_xxzz*z
    Ls_xxz  = Ls_xxz + (L_xxxz*x + v14)
    L_xyzz  = -(L_xxxy + L_xyyy)
    v19     = L_xyz + L_xyzz*z
    v20     = L_xyyz*y + v19
    v36     = v19*y
    Ls_xyz  = Ls_xyz + (L_xxyz*x + v20)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    v39     = L_yyz + L_yyzz*z
    Ls_yyz  = Ls_yyz + (v39 + L_xyyz*x + L_yyyz*y)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v8      = 0.5d0*v7
    a3      = a1*a2
    v22     = 0.166666666666667d0*a3
    a4      = a2*a2
    b2      = b1*b1
    v9      = b2
    v10     = L_xxyy*v9
    v16     = L_xyyy*v9
    v28     = 0.5d0*v9
    v34     = L_xyyz*v9
    b3      = b1*b2
    v23     = b3
    v24     = L_xyyy*v23
    v41     = 0.166666666666667d0*v23
    b4      = b2*b2
    c2      = c1*c1
    v11     = c2
    v48     = 0.5d0*v11
    v25     = L_xzz*v11
    v42     = L_yzz*v11
    v12     = L_xxzz*v11
    v32     = v10 + v12 + 2.0d0*(L_xx + v13 + v6)
    Ls_xx   = Ls_xx + (0.5d0*(v10 + v12) + L_xx + L_xxxx*v8 + v0*x + v13 + v6)
    v17     = L_xyzz*v11
    v29     = v17 + 2.0d0*(L_xy + v15)
    v30     = v29*y
    Ls_xy   = Ls_xy + (0.5d0*(v16 + v17) + L_xxxy*v8 + L_xy + v15 + v18 + v2*x)
    v35     = L_xzzz*v11
    Ls_xz   = Ls_xz + (0.5d0*(v34 + v35) + L_xxxz*v8 + L_xz + v14*x + v33 + v36)
    v38     = L_yyzz*v11
    v45     = v38 + 2.0d0*(L_yy + v37)
    Ls_yy   = Ls_yy + (0.5d0*v38 + L_xxyy*v8 + L_yy + L_yyyy*v28 + v37 + v4*x + v5*y)
    v47     = L_yzzz*v11
    Ls_yz   = Ls_yz + (0.5d0*v47 + L_xxyz*v8 + L_yyyz*v28 + L_yz + v20*x + v39*y + v46)
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
    v26     = c3
    v49     = 0.166666666666667d0*v26
    v27     = L_xzzz*v26
    Ls_x    = Ls_x + (0.166666666666667d0*(v24 + v27 + 3.0d0*(v25 + v30)) + L_x + L_xxxx*v22 + &
      v0*v8 + v21 + v28*v3 + v31*v32)
    v43     = L_yzzz*v26
    Ls_y    = Ls_y + (0.166666666666667d0*(3.0d0*v42 + v43) + L_xxxy*v22 + L_y + L_yyyy*v41 + &
      v2*v8 + v28*v5 + v31*(v16 + 2.0d0*v18 + v29) + v40 + v44*v45)
    Ls_z    = Ls_z + (L_z + L_xxxz*v22 + L_yyyz*v41 + L_zz*z + L_zzz*v48 + L_zzzz*v49 + v14*v8 &
      + v28*v39 + v31*(2.0d0*L_xz + 2.0d0*v33 + v34 + v35 + 2.0d0*v36) &
      + v44*(2.0d0*L_yz + 2.0d0*v46 + v47))
    c4      = c2*c2
    Ls_0    = Ls_0 + (0.0416666666666667d0*(L_xxxx*a4 + L_yyyy*b4 + L_zzzz*c4 + 6.0d0*(v32*v7 &
      + v45*v9) + 4.0d0*(x*(6.0d0*L_x + 6.0d0*v21 + v24 + 3.0d0*v25 + &
      v27 + 3.0d0*v3*v9 + 3.0d0*v30) + y*(6.0d0*L_y + 6.0d0*v40 + 3.0d0 &
      *v42 + v43))) + L_0 + L_z*z + L_zz*v48 + L_zzz*v49 + v0*v22 + v41 &
      *v5)
#undef  Ls_0                
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_0                 
#undef  L_x                 
#undef  Ls_x                
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
    
! OPS  169*ADD + 2*DIV + 282*MUL + 28*NEG + POW + 7*SUB = 489  (638 before optimization)
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
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v54, v55, v6, v7, v8, v9, h, u, D_0, D_x,&
                D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy,&
                D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
#define L_y                  L(1:2,2)
#define M_y                  M(1:2,2)
#define M_z                  M(1:2,3)
#define L_z                  L(1:2,3)
#define M_xx                 M(1:2,4)
#define L_xx                 L(1:2,4)
#define L_xy                 L(1:2,5)
#define M_xy                 M(1:2,5)
#define M_xz                 M(1:2,6)
#define L_xz                 L(1:2,6)
#define M_yy                 M(1:2,7)
#define L_yy                 L(1:2,7)
#define M_yz                 M(1:2,8)
#define L_yz                 L(1:2,8)
#define L_xxx                L(1:2,9)
#define M_xxx                M(1:2,9)
#define L_xxy                L(1:2,10)
#define M_xxy                M(1:2,10)
#define L_xxz                L(1:2,11)
#define M_xxz                M(1:2,11)
#define L_xyy                L(1:2,12)
#define M_xyy                M(1:2,12)
#define M_xyz                M(1:2,13)
#define L_xyz                L(1:2,13)
#define L_yyy                L(1:2,14)
#define M_yyy                M(1:2,14)
#define L_yyz                L(1:2,15)
#define M_yyz                M(1:2,15)
#define M_xxxx               M(1:2,16)
#define L_xxxx               L(1:2,16)
#define M_xxxy               M(1:2,17)
#define L_xxxy               L(1:2,17)
#define L_xxxz               L(1:2,18)
#define M_xxxz               M(1:2,18)
#define M_xxyy               M(1:2,19)
#define L_xxyy               L(1:2,19)
#define L_xxyz               L(1:2,20)
#define M_xxyz               M(1:2,20)
#define L_xyyy               L(1:2,21)
#define M_xyyy               M(1:2,21)
#define L_xyyz               L(1:2,22)
#define M_xyyz               M(1:2,22)
#define L_yyyy               L(1:2,23)
#define M_yyyy               M(1:2,23)
#define M_yyyz               M(1:2,24)
#define L_yyyz               L(1:2,24)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v55    = y*z
    v54    = 15.0d0*v55
    v24    = 0.5d0*M_xx
    v31    = 0.166666666666667d0*M_xxx
    v32    = 0.5d0*M_xxy
    v33    = 0.5d0*M_xxz
    v40    = 0.5d0*M_yy
    v42    = 0.166666666666667d0*M_yyy
    v43    = 0.5d0*M_yyz
    M_zz   = -(M_xx + M_yy)
    v47    = 0.5d0*M_zz
    M_xzz  = -(M_xxx + M_xyy)
    M_yzz  = -(M_xxy + M_yyy)
    M_zzz  = -(M_xxz + M_yyz)
    v48    = 0.166666666666667d0*M_zzz
    M_xxzz = -(M_xxxx + M_xxyy)
    M_xyzz = -(M_xxxy + M_xyyy)
    M_xzzz = -(M_xxxz + M_xyyz)
    M_yyzz = -(M_xxyy + M_yyyy)
    M_yzzz = -(M_xxyz + M_yyyz)
    M_zzzz = -(M_xxzz + M_yyzz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v49    = 5.0d0*v0
    v8     = v49
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
    v50    = 3.0d0*h
    v4     = -h
    v10    = v50
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v28    = v19 + v27
    u2     = 1.0/h
    u      = sqrt(u2)
    D_0    = u
    u3     = u*u2
    v2     = u3
    D_x    = -v2*x
    D_y    = -v2*y
    D_z    = -v2*z
    u4     = u2*u2
    u5     = u2*u3
    v3     = u5
    v51    = 3.0d0*v3
    v5     = v51*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v51*v55
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v52    = 3.0d0*v6
    v7     = v6*x
    v9     = v52*(h - v8)
    D_xxx  = -3.0d0*v7*(v49 - v50)
    D_xxy  = v9*y
    D_xxz  = v9*z
    D_xyy  = v11*v7
    v34    = 0.5d0*D_xyy
    D_xyz  = -v54*v7
    D_xzz  = -(D_xxx + D_xyy)
    v37    = 0.5d0*D_xzz
    D_yyy  = v52*y*(v10 - v12)
    D_yyz  = v11*v6*z
    D_yzz  = -(D_xxy + D_yyy)
    v44    = 0.5d0*D_yzz
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v53    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v53*y
    v22    = v53*z
    v23    = v13*v54
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = D_xxxx*M_0
    D_xxxy = v18*v21
    L_xxxy = D_xxxy*M_0
    D_xxxz = v21*v22
    L_xxx  = D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z
    L_xxxz = D_xxxz*M_0
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    v25    = 0.5d0*D_xxyy
    L_xxyy = D_xxyy*M_0
    D_xxyz = v23*(v20 + v4)
    L_xxy  = D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    v26    = 0.5d0*D_xxzz
    L_xx   = D_xx*M_0 + D_xxx*M_x + D_xxxx*v24 + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyz*M_yz + D_xxz*M_z + M_yy*v25 + M_zz*v26
    L_xxz  = D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z
    D_xyyy = v18*v28
    v29    = 0.5d0*D_xyyy
    v35    = 0.166666666666667d0*D_xyyy
    L_xyyy = D_xyyy*M_0
    D_xyyz = v22*(v27 + v4)
    v36    = 0.5d0*D_xyyz
    L_xyy  = D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    v30    = 0.5d0*D_xyzz
    L_xy   = D_xxxy*v24 + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyz*M_yz + D_xyz*M_z + M_yy*v29 + M_zz*v30
    L_xyz  = D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z
    D_xzzz = -(D_xxxz + D_xyyz)
    v38    = 0.166666666666667d0*D_xzzz
    v39    = 0.5d0*D_xzzz
    L_x    = D_x*M_0 + D_xx*M_x + D_xxx*v24 + D_xxxx*v31 + D_xxxy*v32 + D_xxxz*v33 + &
      D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + &
      D_xz*M_z + M_xyy*v25 + M_xzz*v26 + M_yy*v34 + M_yyy*v35 + M_yyz* &
      v36 + M_yzz*v30 + M_zz*v37 + M_zzz*v38
    L_xz   = D_xxxz*v24 + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + D_xyzz* &
      M_yz + D_xz*M_0 + D_xzz*M_z + M_yy*v36 + M_zz*v39
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = D_yyyy*M_0
    D_yyyz = v23*v28
    L_yyy  = D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    v41    = 0.5d0*D_yyzz
    L_yy   = D_xxyy*v24 + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*v40 + D_yyyz*M_yz + D_yyz*M_z + M_zz*v41
    L_yyz  = D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z
    D_yzzz = -(D_xxyz + D_yyyz)
    v45    = 0.166666666666667d0*D_yzzz
    v46    = 0.5d0*D_yzzz
    L_y    = D_xxxy*v31 + D_xxy*v24 + D_xxyy*v32 + D_xxyz*v33 + D_xy*M_x + D_xyy*M_xy &
      + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v40 + &
      D_yyyy*v42 + D_yyyz*v43 + D_yyz*M_yz + D_yz*M_z + M_xyy*v29 + &
      M_xzz*v30 + M_yzz*v41 + M_zz*v44 + M_zzz*v45
    L_yz   = D_xxyz*v24 + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*v40 + D_yyz* &
      M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + M_zz*v46
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = 0.0416666666666667d0*(D_xxxx*M_xxxx + 12.0d0*D_xxyz*M_xxyz + D_yyyy* &
      M_yyyy + D_zzzz*M_zzzz + 4.0d0*(D_xxxy*M_xxxy + D_xxxz*M_xxxz + &
      D_yyyz*M_yyyz) + 6.0d0*(D_xxyy*M_xxyy + D_xxzz*M_xxzz + D_yyzz* &
      M_yyzz)) + D_0*M_0 + D_x*M_x + D_xx*v24 + D_xxx*v31 + D_xxy*v32 + &
      D_xxz*v33 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + D_yy* &
      v40 + D_yyy*v42 + D_yyz*v43 + D_yz*M_yz + D_z*M_z + D_zz*v47 + &
      D_zzz*v48 + M_xyy*v34 + M_xyyy*v35 + M_xyyz*v36 + M_xyzz*v30 + &
      M_xzz*v37 + M_xzzz*v38 + M_yzz*v44 + M_yzzz*v45
    L_z    = D_xxxz*v31 + D_xxyz*v32 + D_xxz*v24 + D_xxzz*v33 + D_xyz*M_xy + D_xyzz* &
      M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyz*v42 + D_yyz*v40 + D_yyzz* &
      v43 + D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v47 + &
      D_zzzz*v48 + M_xyy*v36 + M_xzz*v39 + M_yzz*v46
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  M_z                 
#undef  L_z                 
#undef  M_xx                
#undef  L_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
#undef  M_yy                
#undef  L_yy                
#undef  M_yz                
#undef  L_yz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  M_xxy               
#undef  L_xxz               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  M_xyz               
#undef  L_xyz               
#undef  L_yyy               
#undef  M_yyy               
#undef  L_yyz               
#undef  M_yyz               
#undef  M_xxxx              
#undef  L_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  L_xxyz              
#undef  M_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_yyyz              
    end subroutine mom_es_M2L2
    
! OPS  108*ADD + 2*DIV + 135*MUL + 11*NEG + POW = 257  (456 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v5, v6, v7,&
                v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz,&
                L_xzzz, L_yyzz, L_yzzz, L_zzzz
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
#define L_xxxx               L(1:2,16)
#define L_xxxy               L(1:2,17)
#define L_xxxz               L(1:2,18)
#define L_xxyy               L(1:2,19)
#define L_xxyz               L(1:2,20)
#define L_xyyy               L(1:2,21)
#define L_xyyz               L(1:2,22)
#define L_yyyy               L(1:2,23)
#define L_yyyz               L(1:2,24)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0     = L_xxz*z
    v7     = L_xxy + L_xxyz*z
    v8     = v7*y
    v9     = L_xxx + L_xxxy*y + L_xxxz*z
    v10    = L_xyz*z
    v13    = L_xyy + L_xyyz*z
    v14    = v13*y
    v15    = L_xxyy*y + v7
    v16    = L_xz*z
    v26    = 0.5d0*x
    v34    = L_yyz*z
    v36    = L_yyy + L_yyyz*z
    v37    = L_yz*z
    v41    = 0.5d0*y
    L_zz   = -(L_xx + L_yy)
    L_xzz  = -(L_xxx + L_xyy)
    v28    = L_xzz*z
    L_yzz  = -(L_xxy + L_yyy)
    v43    = L_yzz*z
    L_zzz  = -(L_xxz + L_yyz)
    L_xxzz = -(L_xxxx + L_xxyy)
    v33    = L_xxz + L_xxyz*y + L_xxzz*z
    L_xyzz = -(L_xxxy + L_xyyy)
    v31    = L_xyz + L_xyzz*z
    v32    = v31*y
    L_xzzz = -(L_xxxz + L_xyyz)
    L_yyzz = -(L_xxyy + L_yyyy)
    v45    = L_yyz + L_yyzz*z
    L_yzzz = -(L_xxyz + L_yyyz)
    L_zzzz = -(L_xxzz + L_yyzz)
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v1     = a2
    v2     = 0.5d0*v1
    a3     = a1*a2
    v17    = 0.166666666666667d0*a3
    a4     = a2*a2
    b2     = b1*b1
    v3     = b2
    v4     = L_xxyy*v3
    v11    = L_xyyy*v3
    v23    = 0.5d0*v3
    v29    = L_xyyz*v3
    b3     = b1*b2
    v18    = b3
    v19    = L_xyyy*v18
    v38    = 0.166666666666667d0*v18
    b4     = b2*b2
    c2     = c1*c1
    v5     = c2
    v46    = 0.5d0*v5
    v20    = L_xzz*v5
    v39    = L_yzz*v5
    v6     = L_xxzz*v5
    v27    = v4 + v6 + 2.0d0*(L_xx + v0 + v8)
    Phi_xx = 0.5d0*(v4 + v6) + L_xx + L_xxxx*v2 + v0 + v8 + v9*x
    v12    = L_xyzz*v5
    v24    = v12 + 2.0d0*(L_xy + v10)
    v25    = v24*y
    Phi_xy = 0.5d0*(v11 + v12) + L_xxxy*v2 + L_xy + v10 + v14 + v15*x
    v30    = L_xzzz*v5
    Phi_xz = 0.5d0*(v29 + v30) + L_xxxz*v2 + L_xz + v28 + v32 + v33*x
    v35    = L_yyzz*v5
    v42    = v35 + 2.0d0*(L_yy + v34)
    Phi_yy = 0.5d0*v35 + L_xxyy*v2 + L_yy + L_yyyy*v23 + v34 + v36*y + x*(L_xyyy*y + &
      v13)
    Phi_zz = -(Phi_xx + Phi_yy)
    v44    = L_yzzz*v5
    Phi_yz = 0.5d0*v44 + L_xxyz*v2 + L_yyyz*v23 + L_yz + v43 + v45*y + x*(L_xyyz*y + &
      v31)
    h      = v1 + v3 + v5
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
    v21    = c3
    v47    = 0.166666666666667d0*v21
    v22    = L_xzzz*v21
    Phi_x  = 0.166666666666667d0*(v19 + v22 + 3.0d0*(v20 + v25)) + L_x + L_xxxx*v17 + &
      v13*v23 + v16 + v2*v9 + v26*v27
    v40    = L_yzzz*v21
    Phi_y  = 0.166666666666667d0*(3.0d0*v39 + v40) + L_xxxy*v17 + L_y + L_yyyy*v38 + &
      v15*v2 + v23*v36 + v26*(v11 + 2.0d0*v14 + v24) + v37 + v41*v42
    Phi_z  = L_z + L_xxxz*v17 + L_yyyz*v38 + L_zz*z + L_zzz*v46 + L_zzzz*v47 + v2*v33 &
      + v23*v45 + v26*(2.0d0*L_xz + 2.0d0*v28 + v29 + v30 + 2.0d0*v32) &
      + v41*(2.0d0*L_yz + 2.0d0*v43 + v44)
    c4     = c2*c2
    Phi_0  = 0.0416666666666667d0*(L_xxxx*a4 + L_yyyy*b4 + L_zzzz*c4 + 6.0d0*(v1*v27 &
      + v3*v42) + 4.0d0*(x*(6.0d0*L_x + 3.0d0*v13*v3 + 6.0d0*v16 + v19 &
      + 3.0d0*v20 + v22 + 3.0d0*v25) + y*(6.0d0*L_y + 6.0d0*v37 + 3.0d0 &
      *v39 + v40))) + L_0 + L_z*z + L_zz*v46 + L_zzz*v47 + v17*v9 + v36 &
      *v38
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
    
! OPS  117*ADD + 2*DIV + 144*MUL + 10*NEG + POW = 274  (497 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz
#define Ls_0                 Ls(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_0                  L(1:2,0)
#define L_x                  L(1:2,1)
#define Ls_x                 Ls(1:2,1)
#define Ls_y                 Ls(1:2,2)
#define L_y                  L(1:2,2)
#define L_z                  L(1:2,3)
#define Ls_z                 Ls(1:2,3)
#define Ls_xx                Ls(1:2,4)
#define L_xx                 L(1:2,4)
#define L_xy                 L(1:2,5)
#define Ls_xy                Ls(1:2,5)
#define L_xz                 L(1:2,6)
#define Ls_xz                Ls(1:2,6)
#define Ls_yy                Ls(1:2,7)
#define L_yy                 L(1:2,7)
#define Ls_yz                Ls(1:2,8)
#define L_yz                 L(1:2,8)
#define Ls_xxx               Ls(1:2,9)
#define L_xxx                L(1:2,9)
#define L_xxy                L(1:2,10)
#define Ls_xxy               Ls(1:2,10)
#define L_xxz                L(1:2,11)
#define Ls_xxz               Ls(1:2,11)
#define L_xyy                L(1:2,12)
#define Ls_xyy               Ls(1:2,12)
#define L_xyz                L(1:2,13)
#define Ls_xyz               Ls(1:2,13)
#define L_yyy                L(1:2,14)
#define Ls_yyy               Ls(1:2,14)
#define L_yyz                L(1:2,15)
#define Ls_yyz               Ls(1:2,15)
#define Ls_xxxx              Ls(1:2,16)
#define L_xxxx               L(1:2,16)
#define Ls_xxxy              Ls(1:2,17)
#define L_xxxy               L(1:2,17)
#define Ls_xxxz              Ls(1:2,18)
#define L_xxxz               L(1:2,18)
#define L_xxyy               L(1:2,19)
#define Ls_xxyy              Ls(1:2,19)
#define L_xxyz               L(1:2,20)
#define Ls_xxyz              Ls(1:2,20)
#define L_xyyy               L(1:2,21)
#define Ls_xyyy              Ls(1:2,21)
#define L_xyyz               L(1:2,22)
#define Ls_xyyz              Ls(1:2,22)
#define Ls_yyyy              Ls(1:2,23)
#define L_yyyy               L(1:2,23)
#define L_yyyz               L(1:2,24)
#define Ls_yyyz              Ls(1:2,24)
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
    v21     = L_xz*z
    v31     = 0.5d0*x
    v37     = L_yyz*z
    v40     = L_yz*z
    v44     = 0.5d0*y
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
    v33     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v46     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    v14     = L_xxz + L_xxyz*y + L_xxzz*z
    Ls_xxz  = L_xxxz*x + v14
    L_xyzz  = -(L_xxxy + L_xyyy)
    v19     = L_xyz + L_xyzz*z
    v20     = L_xyyz*y + v19
    v36     = v19*y
    Ls_xyz  = L_xxyz*x + v20
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    v39     = L_yyz + L_yyzz*z
    Ls_yyz  = v39 + L_xyyz*x + L_yyyz*y
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v8      = 0.5d0*v7
    a3      = a1*a2
    v22     = 0.166666666666667d0*a3
    a4      = a2*a2
    b2      = b1*b1
    v9      = b2
    v10     = L_xxyy*v9
    v16     = L_xyyy*v9
    v28     = 0.5d0*v9
    v34     = L_xyyz*v9
    b3      = b1*b2
    v23     = b3
    v24     = L_xyyy*v23
    v41     = 0.166666666666667d0*v23
    b4      = b2*b2
    c2      = c1*c1
    v11     = c2
    v48     = 0.5d0*v11
    v25     = L_xzz*v11
    v42     = L_yzz*v11
    v12     = L_xxzz*v11
    v32     = v10 + v12 + 2.0d0*(L_xx + v13 + v6)
    Ls_xx   = 0.5d0*(v10 + v12) + L_xx + L_xxxx*v8 + v0*x + v13 + v6
    v17     = L_xyzz*v11
    v29     = v17 + 2.0d0*(L_xy + v15)
    v30     = v29*y
    Ls_xy   = 0.5d0*(v16 + v17) + L_xxxy*v8 + L_xy + v15 + v18 + v2*x
    v35     = L_xzzz*v11
    Ls_xz   = 0.5d0*(v34 + v35) + L_xxxz*v8 + L_xz + v14*x + v33 + v36
    v38     = L_yyzz*v11
    v45     = v38 + 2.0d0*(L_yy + v37)
    Ls_yy   = 0.5d0*v38 + L_xxyy*v8 + L_yy + L_yyyy*v28 + v37 + v4*x + v5*y
    v47     = L_yzzz*v11
    Ls_yz   = 0.5d0*v47 + L_xxyz*v8 + L_yyyz*v28 + L_yz + v20*x + v39*y + v46
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
    v26     = c3
    v49     = 0.166666666666667d0*v26
    v27     = L_xzzz*v26
    Ls_x    = 0.166666666666667d0*(v24 + v27 + 3.0d0*(v25 + v30)) + L_x + L_xxxx*v22 + &
      v0*v8 + v21 + v28*v3 + v31*v32
    v43     = L_yzzz*v26
    Ls_y    = 0.166666666666667d0*(3.0d0*v42 + v43) + L_xxxy*v22 + L_y + L_yyyy*v41 + &
      v2*v8 + v28*v5 + v31*(v16 + 2.0d0*v18 + v29) + v40 + v44*v45
    Ls_z    = L_z + L_xxxz*v22 + L_yyyz*v41 + L_zz*z + L_zzz*v48 + L_zzzz*v49 + v14*v8 &
      + v28*v39 + v31*(2.0d0*L_xz + 2.0d0*v33 + v34 + v35 + 2.0d0*v36) &
      + v44*(2.0d0*L_yz + 2.0d0*v46 + v47)
    c4      = c2*c2
    Ls_0    = 0.0416666666666667d0*(L_xxxx*a4 + L_yyyy*b4 + L_zzzz*c4 + 6.0d0*(v32*v7 &
      + v45*v9) + 4.0d0*(x*(6.0d0*L_x + 6.0d0*v21 + v24 + 3.0d0*v25 + &
      v27 + 3.0d0*v3*v9 + 3.0d0*v30) + y*(6.0d0*L_y + 6.0d0*v40 + 3.0d0 &
      *v42 + v43))) + L_0 + L_z*z + L_zz*v48 + L_zzz*v49 + v0*v22 + v41 &
      *v5
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  Ls_0                
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_0                 
#undef  L_x                 
#undef  Ls_x                
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
