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
        
    
! OPS  2*ADD + 2*DIV + 64*MUL + POW = 69  (141 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v3, v4, v5, v6,&
                v7, v8, v9, h, u
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
#define M_xxxx               M(20)
#define M_xxxy               M(21)
#define M_xxxz               M(22)
#define M_xxyy               M(23)
#define M_xxyz               M(24)
#define M_xxzz               M(25)
#define M_xyyy               M(26)
#define M_xyyz               M(27)
#define M_xyzz               M(28)
#define M_xzzz               M(29)
#define M_yyyy               M(30)
#define M_yyyz               M(31)
#define M_yyzz               M(32)
#define M_yzzz               M(33)
#define M_zzzz               M(34)
    v22    = 0.5d0*W
    v23    = 0.166666666666667d0*W
    v24    = 0.25d0*W
    v0     = W*x
    v1     = W*y
    v2     = W*z
    v3     = v22
    v5     = v0*y
    v6     = v0*z
    v8     = v1*z
    v10    = v23
    v13    = v22*x
    v18    = 0.0416666666666667d0*W
    v21    = v23*x
    M_0    = W
    M_x    = v0
    M_y    = v1
    M_z    = v2
    M_xy   = v5
    M_xz   = v6
    M_yz   = v8
    M_xyz  = v5*z
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v4     = a2
    v12    = 0.5d0*v4
    v20    = v24*v4
    M_xx   = v3*v4
    M_xxy  = v1*v12
    M_xxz  = v12*v2
    M_xxyz = v12*v8
    a3     = a1*a2
    v11    = a3
    v19    = 0.166666666666667d0*v11
    M_xxx  = v10*v11
    M_xxxy = v1*v19
    M_xxxz = v19*v2
    a4     = a2*a2
    M_xxxx = a4*v18
    b2     = b1*b1
    v7     = b2
    v15    = 0.5d0*v7
    M_yy   = v3*v7
    M_xyy  = v13*v7
    M_yyz  = v15*v2
    M_xxyy = v20*v7
    M_xyyz = v15*v6
    b3     = b1*b2
    v14    = b3
    M_yyy  = v10*v14
    M_xyyy = v14*v21
    M_yyyz = 0.166666666666667d0*v14*v2
    b4     = b2*b2
    M_yyyy = b4*v18
    c2     = c1*c1
    v9     = c2
    v16    = 0.5d0*v9
    M_zz   = v3*v9
    M_xzz  = v13*v9
    M_yzz  = v1*v16
    M_xxzz = v20*v9
    M_xyzz = v16*v5
    M_yyzz = v24*v7*v9
    h      = v4 + v7 + v9
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
    v17    = c3
    M_zzz  = v10*v17
    M_xzzz = v17*v21
    M_yzzz = 0.166666666666667d0*v1*v17
    c4     = c2*c2
    M_zzzz = c4*v18
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
#undef  M_xxxx              
#undef  M_xxxy              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  M_xxyz              
#undef  M_xxzz              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  M_xyzz              
#undef  M_xzzz              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  M_yyzz              
#undef  M_yzzz              
#undef  M_zzzz              
    end subroutine mom_es_P2M
    
! OPS  153*ADD + 2*DIV + 177*MUL + POW = 333  (580 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v6, v7, v8, v9, h, u
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
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
#define M_zz                 M(9)
#define Ms_zz                Ms(9)
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
#define Ms_xzz               Ms(15)
#define M_xzz                M(15)
#define Ms_yyy               Ms(16)
#define M_yyy                M(16)
#define M_yyz                M(17)
#define Ms_yyz               Ms(17)
#define M_yzz                M(18)
#define Ms_yzz               Ms(18)
#define M_zzz                M(19)
#define Ms_zzz               Ms(19)
#define M_xxxx               M(20)
#define Ms_xxxx              Ms(20)
#define M_xxxy               M(21)
#define Ms_xxxy              Ms(21)
#define Ms_xxxz              Ms(22)
#define M_xxxz               M(22)
#define Ms_xxyy              Ms(23)
#define M_xxyy               M(23)
#define M_xxyz               M(24)
#define Ms_xxyz              Ms(24)
#define Ms_xxzz              Ms(25)
#define M_xxzz               M(25)
#define M_xyyy               M(26)
#define Ms_xyyy              Ms(26)
#define Ms_xyyz              Ms(27)
#define M_xyyz               M(27)
#define Ms_xyzz              Ms(28)
#define M_xyzz               M(28)
#define M_xzzz               M(29)
#define Ms_xzzz              Ms(29)
#define M_yyyy               M(30)
#define Ms_yyyy              Ms(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define M_yyzz               M(32)
#define Ms_yyzz              Ms(32)
#define M_yzzz               M(33)
#define Ms_yzzz              Ms(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
    v53     = 0.25d0*M_0
    v0      = M_0*x
    v1      = M_x + v0
    v2      = M_0*y
    v3      = M_y + v2
    v4      = M_0*z + M_z
    v5      = M_x*x
    v6      = 0.5d0*M_0
    v8      = M_y*x
    v9      = M_xy + v8
    v10     = M_x*y
    v11     = v0*y
    v12     = v10 + v11 + v9
    v13     = M_z*x
    v14     = M_xz + v13
    v15     = M_x*z
    v16     = v0*z + v14 + v15
    v17     = M_y*y
    v19     = M_z*y
    v20     = M_yz + v19
    v21     = M_y*z
    v22     = v2*z + v20 + v21
    v23     = M_z*z
    v25     = M_xx*x
    v26     = 0.166666666666667d0*M_0
    v29     = M_xx*y
    v30     = M_xy*x
    v31     = v5*y
    v32     = M_xz*x
    v33     = M_xy*y
    v34     = M_yy*x
    v35     = v8*y
    v37     = M_xz*y
    v38     = M_yz*x
    v39     = v13*y
    v40     = M_zz*x
    v42     = M_yy*y
    v44     = M_yz*y
    v45     = M_zz*y
    v47     = 0.0416666666666667d0*M_0
    v49     = 0.5d0*M_xx
    Ms_0    = M_0
    Ms_x    = v1
    Ms_y    = v3
    Ms_z    = v4
    Ms_xy   = v12
    Ms_xz   = v16
    Ms_yz   = v22
    Ms_xyz  = M_xyz + v37 + v38 + v39 + M_xy*z + v10*z + v11*z + v8*z
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v28     = 0.5d0*v7
    v50     = v53*v7
    Ms_xx   = v6*v7 + M_xx + v5
    Ms_xxy  = v28*v3 + M_xxy + v29 + v30 + v31
    Ms_xxz  = M_xxz + v32 + M_xx*z + v28*v4 + v5*z
    Ms_xxyz = M_xxyz + M_xxy*z + M_xxz*y + M_xyz*x + v22*v28 + v29*z + v30*z + v31*z + &
      v32*y
    a3      = a1*a2
    v27     = a3
    v48     = 0.166666666666667d0*v27
    Ms_xxx  = M_xxx + v25 + M_x*v28 + v26*v27
    Ms_xxxy = M_xxxy + M_xxx*y + M_xxy*x + v25*y + v28*(M_xy + v10) + v3*v48
    Ms_xxxz = M_xxxz + M_xxx*z + M_xxz*x + v25*z + v28*(M_xz + v15) + v4*v48
    a4      = a2*a2
    Ms_xxxx = M_xxxx + M_x*v48 + M_xx*v28 + M_xxx*x + a4*v47
    b2      = b1*b1
    v18     = b2
    v36     = 0.5d0*v18
    Ms_yy   = v18*v6 + M_yy + v17
    Ms_xyy  = v1*v36 + M_xyy + v33 + v34 + v35
    Ms_yyz  = M_yyz + v44 + M_yy*z + v17*z + v36*v4
    Ms_xxyy = M_xxyy + M_xxy*y + M_xyy*x + M_yy*v28 + v17*v28 + v18*v49 + v18*v50 + &
      v30*y + v36*v5
    Ms_xyyz = M_xyyz + M_xyy*z + M_xyz*y + M_yyz*x + v16*v36 + v33*z + v34*z + v35*z + &
      v38*y
    b3      = b1*b2
    v43     = b3
    v51     = 0.166666666666667d0*v43
    Ms_yyy  = M_yyy + v42 + M_y*v36 + v26*v43
    Ms_xyyy = M_xyyy + M_xyy*y + M_yyy*x + v1*v51 + v34*y + v36*v9
    Ms_yyyz = M_yyyz + M_yyy*z + M_yyz*y + v36*(M_yz + v21) + v4*v51 + v42*z
    b4      = b2*b2
    Ms_yyyy = M_yyyy + M_y*v51 + M_yy*v36 + M_yyy*y + b4*v47
    c2      = c1*c1
    v24     = c2
    v41     = 0.5d0*v24
    Ms_zz   = v24*v6 + M_zz + v23
    Ms_xzz  = M_xzz + v40 + M_xz*z + v1*v41 + v13*z
    Ms_yzz  = M_yzz + v45 + M_yz*z + v19*z + v3*v41
    Ms_xxzz = M_xxzz + M_xxz*z + M_xzz*x + M_zz*v28 + v23*v28 + v24*v49 + v24*v50 + &
      v32*z + v41*v5
    Ms_xyzz = M_xyzz + M_xyz*z + M_xzz*y + M_yzz*x + v12*v41 + v37*z + v38*z + v39*z + &
      v40*y
    Ms_yyzz = M_yyzz + M_yy*v41 + M_yyz*z + M_yzz*y + M_zz*v36 + v17*v41 + v18*v24*v53 &
      + v23*v36 + v44*z
    h       = v18 + v24 + v7
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
    v46     = c3
    v52     = 0.166666666666667d0*v46
    Ms_zzz  = M_zzz + M_z*v41 + M_zz*z + v26*v46
    Ms_xzzz = M_xzzz + M_xzz*z + M_zzz*x + v1*v52 + v14*v41 + v40*z
    Ms_yzzz = M_yzzz + M_yzz*z + M_zzz*y + v20*v41 + v3*v52 + v45*z
    c4      = c2*c2
    Ms_zzzz = M_zzzz + M_z*v52 + M_zz*v41 + M_zzz*z + c4*v47
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
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
#undef  M_zz                
#undef  Ms_zz               
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
#undef  Ms_xzz              
#undef  M_xzz               
#undef  Ms_yyy              
#undef  M_yyy               
#undef  M_yyz               
#undef  Ms_yyz              
#undef  M_yzz               
#undef  Ms_yzz              
#undef  M_zzz               
#undef  Ms_zzz              
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
#undef  Ms_xxzz             
#undef  M_xxzz              
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  Ms_xyzz             
#undef  M_xyzz              
#undef  M_xzzz              
#undef  Ms_xzzz             
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  M_yyzz              
#undef  Ms_yyzz             
#undef  M_yzzz              
#undef  Ms_yzzz             
#undef  M_zzzz              
#undef  Ms_zzzz             
    end subroutine mom_es_M2M
    
! OPS  169*ADD + 2*DIV + 255*MUL + 18*NEG + POW + 7*SUB = 452  (603 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v4, v5, v6, v7, v8, v9, h, u,&
                D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
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
#define M_zz                 M(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define M_xxx                M(10)
#define M_xxy                M(11)
#define L_xxz                L(11)
#define L_xyy                L(12)
#define M_xxz                M(12)
#define M_xyy                M(13)
#define L_xyz                L(13)
#define M_xyz                M(14)
#define L_yyy                L(14)
#define L_yyz                L(15)
#define M_xzz                M(15)
#define L_xxxx               L(16)
#define M_yyy                M(16)
#define L_xxxy               L(17)
#define M_yyz                M(17)
#define M_yzz                M(18)
#define L_xxxz               L(18)
#define M_zzz                M(19)
#define L_xxyy               L(19)
#define M_xxxx               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xxxy               M(21)
#define L_xyyz               L(22)
#define M_xxxz               M(22)
#define L_yyyy               L(23)
#define M_xxyy               M(23)
#define L_yyyz               L(24)
#define M_xxyz               M(24)
#define M_xxzz               M(25)
#define M_xyyy               M(26)
#define M_xyyz               M(27)
#define M_xyzz               M(28)
#define M_xzzz               M(29)
#define M_yyyy               M(30)
#define M_yyyz               M(31)
#define M_yyzz               M(32)
#define M_yzzz               M(33)
#define M_zzzz               M(34)
    v32    = y*z
    v31    = 15.0d0*v32
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v26    = 5.0d0*v0
    v8     = v26
    v20    = 7.0d0*v0
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v1     = b2
    v12    = 5.0d0*v1
    v24    = 7.0d0*v1
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v0 + v1
    v27    = 3.0d0*h
    v4     = -h
    v10    = v27
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v25    = v19 + v24
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
    v28    = 3.0d0*v3
    v5     = v28*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v28*v32
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v29    = 3.0d0*v6
    v7     = v6*x
    v9     = v29*(h - v8)
    D_xxx  = -3.0d0*v7*(v26 - v27)
    D_xxy  = v9*y
    D_xxz  = v9*z
    D_xyy  = v11*v7
    D_xyz  = -v31*v7
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = v29*y*(v10 - v12)
    D_yyz  = v11*v6*z
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v30    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v30*y
    v22    = v30*z
    v23    = v13*v31
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = D_xxxx*M_0
    D_xxxy = v18*v21
    L_xxxy = D_xxxy*M_0
    D_xxxz = v21*v22
    L_xxx  = D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z
    L_xxxz = D_xxxz*M_0
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    L_xxyy = D_xxyy*M_0
    D_xxyz = v23*(v20 + v4)
    L_xxy  = D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyy*M_yy + D_xxyz*M_yz + D_xxz*M_z + D_xxzz*M_zz
    L_xxz  = D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z
    D_xyyy = v18*v25
    L_xyyy = D_xyyy*M_0
    D_xyyz = v22*(v24 + v4)
    L_xyy  = D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = D_xxxy*M_xx + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyy*M_yy + D_xyyz*M_yz + D_xyz*M_z + D_xyzz*M_zz
    L_xyz  = D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxy*M_xxy + D_xxxz* &
      M_xxz + D_xxy*M_xy + D_xxyy*M_xyy + D_xxyz*M_xyz + D_xxz*M_xz + &
      D_xxzz*M_xzz + D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyz* &
      M_yyz + D_xyz*M_yz + D_xyzz*M_yzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz
    L_xz   = D_xxxz*M_xx + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyyz*M_yy + &
      D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = D_yyyy*M_0
    D_yyyz = v23*v25
    L_yyy  = D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xxyy*M_xx + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*M_yy + D_yyyz*M_yz + D_yyz*M_z + D_yyzz*M_zz
    L_yyz  = D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xxxy*M_xxx + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xy*M_x + &
      D_xyy*M_xy + D_xyyy*M_xyy + D_xyyz*M_xyz + D_xyz*M_xz + D_xyzz* &
      M_xzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyz* &
      M_yyz + D_yyz*M_yz + D_yyzz*M_yzz + D_yz*M_z + D_yzz*M_zz + &
      D_yzzz*M_zzz
    L_yz   = D_xxyz*M_xx + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*M_yy + &
      D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxy* &
      M_xxxy + D_xxxz*M_xxxz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xy*M_xy + D_xyy*M_xyy + &
      D_xyyy*M_xyyy + D_xyyz*M_xyyz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_y*M_y + D_yy*M_yy + &
      D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyz*M_yyyz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + D_z*M_z &
      + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz
    L_z    = D_xxxz*M_xxx + D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz &
      + D_yyyz*M_yyy + D_yyz*M_yy + D_yyzz*M_yyz + D_yz*M_y + D_yzz* &
      M_yz + D_yzzz*M_yzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
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
#undef  M_zz                
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxx               
#undef  M_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_xzz               
#undef  L_xxxx              
#undef  M_yyy               
#undef  L_xxxy              
#undef  M_yyz               
#undef  M_yzz               
#undef  L_xxxz              
#undef  M_zzz               
#undef  L_xxyy              
#undef  M_xxxx              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xxxy              
#undef  L_xyyz              
#undef  M_xxxz              
#undef  L_yyyy              
#undef  M_xxyy              
#undef  L_yyyz              
#undef  M_xxyz              
#undef  M_xxzz              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  M_xyzz              
#undef  M_xzzz              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  M_yyzz              
#undef  M_yzzz              
#undef  M_zzzz              
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
    
! OPS  153*ADD + 2*DIV + 177*MUL + POW = 333  (580 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38,&
                v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5,&
                v50, v51, v52, v53, v6, v7, v8, v9, h, u
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define M_0                  M(0)
#define x                    r(1)
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
#define M_zz                 M(9)
#define Ms_zz                Ms(9)
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
#define Ms_xzz               Ms(15)
#define M_xzz                M(15)
#define Ms_yyy               Ms(16)
#define M_yyy                M(16)
#define M_yyz                M(17)
#define Ms_yyz               Ms(17)
#define M_yzz                M(18)
#define Ms_yzz               Ms(18)
#define M_zzz                M(19)
#define Ms_zzz               Ms(19)
#define M_xxxx               M(20)
#define Ms_xxxx              Ms(20)
#define M_xxxy               M(21)
#define Ms_xxxy              Ms(21)
#define Ms_xxxz              Ms(22)
#define M_xxxz               M(22)
#define Ms_xxyy              Ms(23)
#define M_xxyy               M(23)
#define M_xxyz               M(24)
#define Ms_xxyz              Ms(24)
#define Ms_xxzz              Ms(25)
#define M_xxzz               M(25)
#define M_xyyy               M(26)
#define Ms_xyyy              Ms(26)
#define Ms_xyyz              Ms(27)
#define M_xyyz               M(27)
#define Ms_xyzz              Ms(28)
#define M_xyzz               M(28)
#define M_xzzz               M(29)
#define Ms_xzzz              Ms(29)
#define M_yyyy               M(30)
#define Ms_yyyy              Ms(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define M_yyzz               M(32)
#define Ms_yyzz              Ms(32)
#define M_yzzz               M(33)
#define Ms_yzzz              Ms(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
    v53     = 0.25d0*M_0
    v0      = M_0*x
    v1      = M_x + v0
    v2      = M_0*y
    v3      = M_y + v2
    v4      = M_0*z + M_z
    v5      = M_x*x
    v6      = 0.5d0*M_0
    v8      = M_y*x
    v9      = M_xy + v8
    v10     = M_x*y
    v11     = v0*y
    v12     = v10 + v11 + v9
    v13     = M_z*x
    v14     = M_xz + v13
    v15     = M_x*z
    v16     = v0*z + v14 + v15
    v17     = M_y*y
    v19     = M_z*y
    v20     = M_yz + v19
    v21     = M_y*z
    v22     = v2*z + v20 + v21
    v23     = M_z*z
    v25     = M_xx*x
    v26     = 0.166666666666667d0*M_0
    v29     = M_xx*y
    v30     = M_xy*x
    v31     = v5*y
    v32     = M_xz*x
    v33     = M_xy*y
    v34     = M_yy*x
    v35     = v8*y
    v37     = M_xz*y
    v38     = M_yz*x
    v39     = v13*y
    v40     = M_zz*x
    v42     = M_yy*y
    v44     = M_yz*y
    v45     = M_zz*y
    v47     = 0.0416666666666667d0*M_0
    v49     = 0.5d0*M_xx
    Ms_0    = Ms_0 + (M_0)
    Ms_x    = Ms_x + (v1)
    Ms_y    = Ms_y + (v3)
    Ms_z    = Ms_z + (v4)
    Ms_xy   = Ms_xy + (v12)
    Ms_xz   = Ms_xz + (v16)
    Ms_yz   = Ms_yz + (v22)
    Ms_xyz  = Ms_xyz + (M_xyz + v37 + v38 + v39 + M_xy*z + v10*z + v11*z + v8*z)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    v28     = 0.5d0*v7
    v50     = v53*v7
    Ms_xx   = Ms_xx + (v6*v7 + M_xx + v5)
    Ms_xxy  = Ms_xxy + (v28*v3 + M_xxy + v29 + v30 + v31)
    Ms_xxz  = Ms_xxz + (M_xxz + v32 + M_xx*z + v28*v4 + v5*z)
    Ms_xxyz = Ms_xxyz + (M_xxyz + M_xxy*z + M_xxz*y + M_xyz*x + v22*v28 + v29*z + v30*z + v31*z + &
      v32*y)
    a3      = a1*a2
    v27     = a3
    v48     = 0.166666666666667d0*v27
    Ms_xxx  = Ms_xxx + (M_xxx + v25 + M_x*v28 + v26*v27)
    Ms_xxxy = Ms_xxxy + (M_xxxy + M_xxx*y + M_xxy*x + v25*y + v28*(M_xy + v10) + v3*v48)
    Ms_xxxz = Ms_xxxz + (M_xxxz + M_xxx*z + M_xxz*x + v25*z + v28*(M_xz + v15) + v4*v48)
    a4      = a2*a2
    Ms_xxxx = Ms_xxxx + (M_xxxx + M_x*v48 + M_xx*v28 + M_xxx*x + a4*v47)
    b2      = b1*b1
    v18     = b2
    v36     = 0.5d0*v18
    Ms_yy   = Ms_yy + (v18*v6 + M_yy + v17)
    Ms_xyy  = Ms_xyy + (v1*v36 + M_xyy + v33 + v34 + v35)
    Ms_yyz  = Ms_yyz + (M_yyz + v44 + M_yy*z + v17*z + v36*v4)
    Ms_xxyy = Ms_xxyy + (M_xxyy + M_xxy*y + M_xyy*x + M_yy*v28 + v17*v28 + v18*v49 + v18*v50 + &
      v30*y + v36*v5)
    Ms_xyyz = Ms_xyyz + (M_xyyz + M_xyy*z + M_xyz*y + M_yyz*x + v16*v36 + v33*z + v34*z + v35*z + &
      v38*y)
    b3      = b1*b2
    v43     = b3
    v51     = 0.166666666666667d0*v43
    Ms_yyy  = Ms_yyy + (M_yyy + v42 + M_y*v36 + v26*v43)
    Ms_xyyy = Ms_xyyy + (M_xyyy + M_xyy*y + M_yyy*x + v1*v51 + v34*y + v36*v9)
    Ms_yyyz = Ms_yyyz + (M_yyyz + M_yyy*z + M_yyz*y + v36*(M_yz + v21) + v4*v51 + v42*z)
    b4      = b2*b2
    Ms_yyyy = Ms_yyyy + (M_yyyy + M_y*v51 + M_yy*v36 + M_yyy*y + b4*v47)
    c2      = c1*c1
    v24     = c2
    v41     = 0.5d0*v24
    Ms_zz   = Ms_zz + (v24*v6 + M_zz + v23)
    Ms_xzz  = Ms_xzz + (M_xzz + v40 + M_xz*z + v1*v41 + v13*z)
    Ms_yzz  = Ms_yzz + (M_yzz + v45 + M_yz*z + v19*z + v3*v41)
    Ms_xxzz = Ms_xxzz + (M_xxzz + M_xxz*z + M_xzz*x + M_zz*v28 + v23*v28 + v24*v49 + v24*v50 + &
      v32*z + v41*v5)
    Ms_xyzz = Ms_xyzz + (M_xyzz + M_xyz*z + M_xzz*y + M_yzz*x + v12*v41 + v37*z + v38*z + v39*z + &
      v40*y)
    Ms_yyzz = Ms_yyzz + (M_yyzz + M_yy*v41 + M_yyz*z + M_yzz*y + M_zz*v36 + v17*v41 + v18*v24*v53 &
      + v23*v36 + v44*z)
    h       = v18 + v24 + v7
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
    v46     = c3
    v52     = 0.166666666666667d0*v46
    Ms_zzz  = Ms_zzz + (M_zzz + M_z*v41 + M_zz*z + v26*v46)
    Ms_xzzz = Ms_xzzz + (M_xzzz + M_xzz*z + M_zzz*x + v1*v52 + v14*v41 + v40*z)
    Ms_yzzz = Ms_yzzz + (M_yzzz + M_yzz*z + M_zzz*y + v20*v41 + v3*v52 + v45*z)
    c4      = c2*c2
    Ms_zzzz = Ms_zzzz + (M_zzzz + M_z*v52 + M_zz*v41 + M_zzz*z + c4*v47)
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  M_0                 
#undef  x                   
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
#undef  M_zz                
#undef  Ms_zz               
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
#undef  Ms_xzz              
#undef  M_xzz               
#undef  Ms_yyy              
#undef  M_yyy               
#undef  M_yyz               
#undef  Ms_yyz              
#undef  M_yzz               
#undef  Ms_yzz              
#undef  M_zzz               
#undef  Ms_zzz              
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
#undef  Ms_xxzz             
#undef  M_xxzz              
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  Ms_xyzz             
#undef  M_xyzz              
#undef  M_xzzz              
#undef  Ms_xzzz             
#undef  M_yyyy              
#undef  Ms_yyyy             
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  M_yyzz              
#undef  Ms_yyzz             
#undef  M_yzzz              
#undef  Ms_yzzz             
#undef  M_zzzz              
#undef  Ms_zzzz             
    end subroutine mom_es_M2M_add
    
! OPS  169*ADD + 2*DIV + 255*MUL + 18*NEG + POW + 7*SUB = 452  (603 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, b1, b2, b3, b4, c1, c2, c3, c4, u2, u3, u4,&
                u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15, v16,&
                v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27,&
                v28, v29, v3, v30, v31, v32, v4, v5, v6, v7, v8, v9, h, u,&
                D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
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
#define M_zz                 M(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define M_xxx                M(10)
#define M_xxy                M(11)
#define L_xxz                L(11)
#define L_xyy                L(12)
#define M_xxz                M(12)
#define M_xyy                M(13)
#define L_xyz                L(13)
#define M_xyz                M(14)
#define L_yyy                L(14)
#define L_yyz                L(15)
#define M_xzz                M(15)
#define L_xxxx               L(16)
#define M_yyy                M(16)
#define L_xxxy               L(17)
#define M_yyz                M(17)
#define M_yzz                M(18)
#define L_xxxz               L(18)
#define M_zzz                M(19)
#define L_xxyy               L(19)
#define M_xxxx               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xxxy               M(21)
#define L_xyyz               L(22)
#define M_xxxz               M(22)
#define L_yyyy               L(23)
#define M_xxyy               M(23)
#define L_yyyz               L(24)
#define M_xxyz               M(24)
#define M_xxzz               M(25)
#define M_xyyy               M(26)
#define M_xyyz               M(27)
#define M_xyzz               M(28)
#define M_xzzz               M(29)
#define M_yyyy               M(30)
#define M_yyyz               M(31)
#define M_yyzz               M(32)
#define M_yzzz               M(33)
#define M_zzzz               M(34)
    v32    = y*z
    v31    = 15.0d0*v32
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v26    = 5.0d0*v0
    v8     = v26
    v20    = 7.0d0*v0
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v1     = b2
    v12    = 5.0d0*v1
    v24    = 7.0d0*v1
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v0 + v1
    v27    = 3.0d0*h
    v4     = -h
    v10    = v27
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v25    = v19 + v24
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
    v28    = 3.0d0*v3
    v5     = v28*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v28*v32
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v29    = 3.0d0*v6
    v7     = v6*x
    v9     = v29*(h - v8)
    D_xxx  = -3.0d0*v7*(v26 - v27)
    D_xxy  = v9*y
    D_xxz  = v9*z
    D_xyy  = v11*v7
    D_xyz  = -v31*v7
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = v29*y*(v10 - v12)
    D_yyz  = v11*v6*z
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v30    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v30*y
    v22    = v30*z
    v23    = v13*v31
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = L_xxxx + (D_xxxx*M_0)
    D_xxxy = v18*v21
    L_xxxy = L_xxxy + (D_xxxy*M_0)
    D_xxxz = v21*v22
    L_xxx  = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z)
    L_xxxz = L_xxxz + (D_xxxz*M_0)
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    L_xxyy = L_xxyy + (D_xxyy*M_0)
    D_xxyz = v23*(v20 + v4)
    L_xxy  = L_xxy + (D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z)
    L_xxyz = L_xxyz + (D_xxyz*M_0)
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyy*M_yy + D_xxyz*M_yz + D_xxz*M_z + D_xxzz*M_zz)
    L_xxz  = L_xxz + (D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z)
    D_xyyy = v18*v25
    L_xyyy = L_xyyy + (D_xyyy*M_0)
    D_xyyz = v22*(v24 + v4)
    L_xyy  = L_xyy + (D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z)
    L_xyyz = L_xyyz + (D_xyyz*M_0)
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = L_xy + (D_xxxy*M_xx + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyy*M_yy + D_xyyz*M_yz + D_xyz*M_z + D_xyzz*M_zz)
    L_xyz  = L_xyz + (D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z)
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxy*M_xxy + D_xxxz* &
      M_xxz + D_xxy*M_xy + D_xxyy*M_xyy + D_xxyz*M_xyz + D_xxz*M_xz + &
      D_xxzz*M_xzz + D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyz* &
      M_yyz + D_xyz*M_yz + D_xyzz*M_yzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz)
    L_xz   = L_xz + (D_xxxz*M_xx + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyyz*M_yy + &
      D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz)
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = L_yyyy + (D_yyyy*M_0)
    D_yyyz = v23*v25
    L_yyy  = L_yyy + (D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z)
    L_yyyz = L_yyyz + (D_yyyz*M_0)
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = L_yy + (D_xxyy*M_xx + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*M_yy + D_yyyz*M_yz + D_yyz*M_z + D_yyzz*M_zz)
    L_yyz  = L_yyz + (D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z)
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = L_y + (D_xxxy*M_xxx + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xy*M_x + &
      D_xyy*M_xy + D_xyyy*M_xyy + D_xyyz*M_xyz + D_xyz*M_xz + D_xyzz* &
      M_xzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyz* &
      M_yyz + D_yyz*M_yz + D_yyzz*M_yzz + D_yz*M_z + D_yzz*M_zz + &
      D_yzzz*M_zzz)
    L_yz   = L_yz + (D_xxyz*M_xx + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*M_yy + &
      D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz)
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxy* &
      M_xxxy + D_xxxz*M_xxxz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xy*M_xy + D_xyy*M_xyy + &
      D_xyyy*M_xyyy + D_xyyz*M_xyyz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_y*M_y + D_yy*M_yy + &
      D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyz*M_yyyz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + D_z*M_z &
      + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz)
    L_z    = L_z + (D_xxxz*M_xxx + D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz &
      + D_yyyz*M_yyy + D_yyz*M_yy + D_yyzz*M_yyz + D_yz*M_y + D_yzz* &
      M_yz + D_yzzz*M_yzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
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
#undef  M_zz                
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxx               
#undef  M_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_xzz               
#undef  L_xxxx              
#undef  M_yyy               
#undef  L_xxxy              
#undef  M_yyz               
#undef  M_yzz               
#undef  L_xxxz              
#undef  M_zzz               
#undef  L_xxyy              
#undef  M_xxxx              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xxxy              
#undef  L_xyyz              
#undef  M_xxxz              
#undef  L_yyyy              
#undef  M_xxyy              
#undef  L_yyyz              
#undef  M_xxyz              
#undef  M_xxzz              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  M_xyzz              
#undef  M_xzzz              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  M_yyzz              
#undef  M_yzzz              
#undef  M_zzzz              
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
    
! OPS  169*ADD + 2*DIV + 255*MUL + 18*NEG + POW + 7*SUB = 452  (603 before optimization)
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
                v28, v29, v3, v30, v31, v32, v4, v5, v6, v7, v8, v9, h, u,&
                D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx,&
                D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
#define L_y                  L(1:2,2)
#define M_y                  M(1:2,2)
#define L_z                  L(1:2,3)
#define M_z                  M(1:2,3)
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
#define M_zz                 M(1:2,9)
#define L_xxx                L(1:2,9)
#define L_xxy                L(1:2,10)
#define M_xxx                M(1:2,10)
#define M_xxy                M(1:2,11)
#define L_xxz                L(1:2,11)
#define L_xyy                L(1:2,12)
#define M_xxz                M(1:2,12)
#define M_xyy                M(1:2,13)
#define L_xyz                L(1:2,13)
#define M_xyz                M(1:2,14)
#define L_yyy                L(1:2,14)
#define L_yyz                L(1:2,15)
#define M_xzz                M(1:2,15)
#define L_xxxx               L(1:2,16)
#define M_yyy                M(1:2,16)
#define L_xxxy               L(1:2,17)
#define M_yyz                M(1:2,17)
#define M_yzz                M(1:2,18)
#define L_xxxz               L(1:2,18)
#define M_zzz                M(1:2,19)
#define L_xxyy               L(1:2,19)
#define M_xxxx               M(1:2,20)
#define L_xxyz               L(1:2,20)
#define L_xyyy               L(1:2,21)
#define M_xxxy               M(1:2,21)
#define L_xyyz               L(1:2,22)
#define M_xxxz               M(1:2,22)
#define L_yyyy               L(1:2,23)
#define M_xxyy               M(1:2,23)
#define L_yyyz               L(1:2,24)
#define M_xxyz               M(1:2,24)
#define M_xxzz               M(1:2,25)
#define M_xyyy               M(1:2,26)
#define M_xyyz               M(1:2,27)
#define M_xyzz               M(1:2,28)
#define M_xzzz               M(1:2,29)
#define M_yyyy               M(1:2,30)
#define M_yyyz               M(1:2,31)
#define M_yyzz               M(1:2,32)
#define M_yzzz               M(1:2,33)
#define M_zzzz               M(1:2,34)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v32    = y*z
    v31    = 15.0d0*v32
    c1     = z
    b1     = y
    a1     = x
    a2     = a1*a1
    v0     = a2
    v26    = 5.0d0*v0
    v8     = v26
    v20    = 7.0d0*v0
    a3     = a1*a2
    a4     = a2*a2
    b2     = b1*b1
    v1     = b2
    v12    = 5.0d0*v1
    v24    = 7.0d0*v1
    b3     = b1*b2
    b4     = b2*b2
    c2     = c1*c1
    h      = c2 + v0 + v1
    v27    = 3.0d0*h
    v4     = -h
    v10    = v27
    v11    = -15.0d0*v1 + v10
    v15    = h*h
    v16    = 3.0d0*v15
    v17    = 30.0d0*h
    v19    = -v10
    v21    = v19 + v20
    v25    = v19 + v24
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
    v28    = 3.0d0*v3
    v5     = v28*x
    D_xx   = v3*(3.0d0*v0 + v4)
    D_xy   = v5*y
    D_xz   = v5*z
    D_yy   = v3*(3.0d0*v1 + v4)
    D_yz   = v28*v32
    D_zz   = -(D_xx + D_yy)
    u6     = u3*u3
    u7     = u3*u4
    v6     = u7
    v29    = 3.0d0*v6
    v7     = v6*x
    v9     = v29*(h - v8)
    D_xxx  = -3.0d0*v7*(v26 - v27)
    D_xxy  = v9*y
    D_xxz  = v9*z
    D_xyy  = v11*v7
    D_xyz  = -v31*v7
    D_xzz  = -(D_xxx + D_xyy)
    D_yyy  = v29*y*(v10 - v12)
    D_yyz  = v11*v6*z
    D_yzz  = -(D_xxy + D_yyy)
    D_zzz  = -(D_xxz + D_yyz)
    u8     = u4*u4
    u9     = u4*u5
    v13    = u9
    v30    = 15.0d0*v13*x
    v14    = 3.0d0*v13
    v18    = v30*y
    v22    = v30*z
    v23    = v13*v31
    D_xxxx = v14*(v16 + 35.0d0*a4 - v0*v17)
    L_xxxx = D_xxxx*M_0
    D_xxxy = v18*v21
    L_xxxy = D_xxxy*M_0
    D_xxxz = v21*v22
    L_xxx  = D_xxx*M_0 + D_xxxx*M_x + D_xxxy*M_y + D_xxxz*M_z
    L_xxxz = D_xxxz*M_0
    D_xxyy = -v14*(h*v12 + h*v8 - (35.0d0*v0*v1 + v15))
    L_xxyy = D_xxyy*M_0
    D_xxyz = v23*(v20 + v4)
    L_xxy  = D_xxxy*M_x + D_xxy*M_0 + D_xxyy*M_y + D_xxyz*M_z
    L_xxyz = D_xxyz*M_0
    D_xxzz = -(D_xxxx + D_xxyy)
    L_xx   = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxy*M_xy + D_xxxz*M_xz + D_xxy* &
      M_y + D_xxyy*M_yy + D_xxyz*M_yz + D_xxz*M_z + D_xxzz*M_zz
    L_xxz  = D_xxxz*M_x + D_xxyz*M_y + D_xxz*M_0 + D_xxzz*M_z
    D_xyyy = v18*v25
    L_xyyy = D_xyyy*M_0
    D_xyyz = v22*(v24 + v4)
    L_xyy  = D_xxyy*M_x + D_xyy*M_0 + D_xyyy*M_y + D_xyyz*M_z
    L_xyyz = D_xyyz*M_0
    D_xyzz = -(D_xxxy + D_xyyy)
    L_xy   = D_xxxy*M_xx + D_xxy*M_x + D_xxyy*M_xy + D_xxyz*M_xz + D_xy*M_0 + D_xyy* &
      M_y + D_xyyy*M_yy + D_xyyz*M_yz + D_xyz*M_z + D_xyzz*M_zz
    L_xyz  = D_xxyz*M_x + D_xyyz*M_y + D_xyz*M_0 + D_xyzz*M_z
    D_xzzz = -(D_xxxz + D_xyyz)
    L_x    = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxy*M_xxy + D_xxxz* &
      M_xxz + D_xxy*M_xy + D_xxyy*M_xyy + D_xxyz*M_xyz + D_xxz*M_xz + &
      D_xxzz*M_xzz + D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyz* &
      M_yyz + D_xyz*M_yz + D_xyzz*M_yzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz
    L_xz   = D_xxxz*M_xx + D_xxyz*M_xy + D_xxz*M_x + D_xxzz*M_xz + D_xyyz*M_yy + &
      D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz
    D_yyyy = v14*(v16 + 35.0d0*b4 - v1*v17)
    L_yyyy = D_yyyy*M_0
    D_yyyz = v23*v25
    L_yyy  = D_xyyy*M_x + D_yyy*M_0 + D_yyyy*M_y + D_yyyz*M_z
    L_yyyz = D_yyyz*M_0
    D_yyzz = -(D_xxyy + D_yyyy)
    L_yy   = D_xxyy*M_xx + D_xyy*M_x + D_xyyy*M_xy + D_xyyz*M_xz + D_yy*M_0 + D_yyy* &
      M_y + D_yyyy*M_yy + D_yyyz*M_yz + D_yyz*M_z + D_yyzz*M_zz
    L_yyz  = D_xyyz*M_x + D_yyyz*M_y + D_yyz*M_0 + D_yyzz*M_z
    D_yzzz = -(D_xxyz + D_yyyz)
    L_y    = D_xxxy*M_xxx + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyz*M_xxz + D_xy*M_x + &
      D_xyy*M_xy + D_xyyy*M_xyy + D_xyyz*M_xyz + D_xyz*M_xz + D_xyzz* &
      M_xzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyz* &
      M_yyz + D_yyz*M_yz + D_yyzz*M_yzz + D_yz*M_z + D_yzz*M_zz + &
      D_yzzz*M_zzz
    L_yz   = D_xxyz*M_xx + D_xyyz*M_xy + D_xyz*M_x + D_xyzz*M_xz + D_yyyz*M_yy + &
      D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz
    D_zzzz = -(D_xxzz + D_yyzz)
    L_0    = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxy* &
      M_xxxy + D_xxxz*M_xxxz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyz* &
      M_xxyz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xy*M_xy + D_xyy*M_xyy + &
      D_xyyy*M_xyyy + D_xyyz*M_xyyz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_y*M_y + D_yy*M_yy + &
      D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyz*M_yyyz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + D_z*M_z &
      + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz
    L_z    = D_xxxz*M_xxx + D_xxyz*M_xxy + D_xxz*M_xx + D_xxzz*M_xxz + D_xyyz*M_xyy + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz &
      + D_yyyz*M_yyy + D_yyz*M_yy + D_yyzz*M_yyz + D_yz*M_y + D_yzz* &
      M_yz + D_yzzz*M_yzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz
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
#undef  L_z                 
#undef  M_z                 
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
#undef  M_zz                
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxx               
#undef  M_xxy               
#undef  L_xxz               
#undef  L_xyy               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_xzz               
#undef  L_xxxx              
#undef  M_yyy               
#undef  L_xxxy              
#undef  M_yyz               
#undef  M_yzz               
#undef  L_xxxz              
#undef  M_zzz               
#undef  L_xxyy              
#undef  M_xxxx              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xxxy              
#undef  L_xyyz              
#undef  M_xxxz              
#undef  L_yyyy              
#undef  M_xxyy              
#undef  L_yyyz              
#undef  M_xxyz              
#undef  M_xxzz              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  M_xyzz              
#undef  M_xzzz              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  M_yyzz              
#undef  M_yzzz              
#undef  M_zzzz              
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
