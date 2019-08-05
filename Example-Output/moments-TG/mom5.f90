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
        
    
! OPS  2*ADD + 2*DIV + 104*MUL + POW = 109  (242 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v5, v6, v7, v8, v9, h,&
                u
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
#define M_xxxxx              M(35)
#define M_xxxxy              M(36)
#define M_xxxxz              M(37)
#define M_xxxyy              M(38)
#define M_xxxyz              M(39)
#define M_xxxzz              M(40)
#define M_xxyyy              M(41)
#define M_xxyyz              M(42)
#define M_xxyzz              M(43)
#define M_xxzzz              M(44)
#define M_xyyyy              M(45)
#define M_xyyyz              M(46)
#define M_xyyzz              M(47)
#define M_xyzzz              M(48)
#define M_xzzzz              M(49)
#define M_yyyyy              M(50)
#define M_yyyyz              M(51)
#define M_yyyzz              M(52)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define M_zzzzz              M(55)
    v34     = W*y
    v35     = 0.5d0*W
    v36     = 0.166666666666667d0*W
    v37     = 0.0416666666666667d0*W
    v40     = 0.0833333333333333d0*W
    v0      = W*x
    v1      = v34
    v2      = W*z
    v3      = v35
    v5      = v0*y
    v6      = v0*z
    v8      = v1*z
    v10     = v36
    v13     = v35*x
    v18     = v37
    v22     = v36*x
    v29     = 0.00833333333333333d0*W
    v33     = v37*x
    M_0     = W
    M_x     = v0
    M_y     = v1
    M_z     = v2
    M_xy    = v5
    M_xz    = v6
    M_yz    = v8
    M_xyz   = v5*z
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v4      = a2
    v38     = 0.25d0*v4
    v12     = 0.5d0*v4
    v21     = W*v38
    v32     = v4*v40
    M_xx    = v3*v4
    M_xxy   = v1*v12
    M_xxz   = v12*v2
    M_xxyz  = v12*v8
    a3      = a1*a2
    v11     = a3
    v20     = 0.166666666666667d0*v11
    v31     = v11*v40
    M_xxx   = v10*v11
    M_xxxy  = v1*v20
    M_xxxz  = v2*v20
    M_xxxyz = v20*v8
    a4      = a2*a2
    v19     = a4
    v30     = 0.0416666666666667d0*v19
    M_xxxx  = v18*v19
    M_xxxxy = v1*v30
    M_xxxxz = v2*v30
    a5      = a2*a3
    M_xxxxx = a5*v29
    b2      = b1*b1
    v7      = b2
    v39     = W*v7
    v15     = 0.5d0*v7
    v26     = v39
    M_yy    = v3*v7
    M_xyy   = v13*v7
    M_yyz   = v15*v2
    M_xxyy  = v21*v7
    M_xyyz  = v15*v6
    M_xxxyy = v31*v7
    M_xxyyz = v2*v38*v7
    b3      = b1*b2
    v14     = b3
    v24     = 0.166666666666667d0*v14
    M_yyy   = v10*v14
    M_xyyy  = v14*v22
    M_yyyz  = v2*v24
    M_xxyyy = v14*v32
    M_xyyyz = v24*v6
    b4      = b2*b2
    v23     = b4
    M_yyyy  = v18*v23
    M_xyyyy = v23*v33
    M_yyyyz = 0.0416666666666667d0*v2*v23
    b5      = b2*b3
    M_yyyyy = b5*v29
    c2      = c1*c1
    v9      = c2
    v16     = 0.5d0*v9
    v25     = 0.25d0*v9
    M_zz    = v3*v9
    M_xzz   = v13*v9
    M_yzz   = v1*v16
    M_xxzz  = v21*v9
    M_xyzz  = v16*v5
    M_yyzz  = v25*v26
    M_xxxzz = v31*v9
    M_xxyzz = v25*v34*v4
    M_xyyzz = v25*v39*x
    M_yyyzz = v14*v40*v9
    h       = v4 + v7 + v9
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
    v17     = c3
    v27     = 0.166666666666667d0*v17
    M_zzz   = v10*v17
    M_xzzz  = v17*v22
    M_yzzz  = v1*v27
    M_xxzzz = v17*v32
    M_xyzzz = v27*v5
    M_yyzzz = 0.0833333333333333d0*v17*v26
    c4      = c2*c2
    v28     = c4
    M_zzzz  = v18*v28
    M_xzzzz = v28*v33
    M_yzzzz = 0.0416666666666667d0*v1*v28
    c5      = c2*c3
    M_zzzzz = c5*v29
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
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  M_xxxyz             
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  M_xxzzz             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  M_xyyzz             
#undef  M_xyzzz             
#undef  M_xzzzz             
#undef  M_yyyyy             
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  M_zzzzz             
    end subroutine mom_es_P2M
    
! OPS  344*ADD + 2*DIV + 386*MUL + POW = 733  (1428 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v105, v106, v107, v108, v109, v11,&
                v110, v111, v112, v113, v114, v115, v116, v117, v118, v119,&
                v12, v120, v121, v122, v123, v124, v125, v126, v13, v14, v15,&
                v16, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70,&
                v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81,&
                v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92,&
                v93, v94, v95, v96, v97, v98, v99, h, u
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define M_z                  M(3)
#define Ms_z                 Ms(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define Ms_xy                Ms(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define Ms_xz                Ms(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
#define M_zz                 M(9)
#define Ms_zz                Ms(9)
#define Ms_xxx               Ms(10)
#define M_xxx                M(10)
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
#define M_xxyy               M(23)
#define Ms_xxyy              Ms(23)
#define Ms_xxyz              Ms(24)
#define M_xxyz               M(24)
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
#define Ms_yyyy              Ms(30)
#define M_yyyy               M(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define Ms_yyzz              Ms(32)
#define M_yyzz               M(32)
#define M_yzzz               M(33)
#define Ms_yzzz              Ms(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
#define Ms_xxxxx             Ms(35)
#define M_xxxxx              M(35)
#define Ms_xxxxy             Ms(36)
#define M_xxxxy              M(36)
#define Ms_xxxxz             Ms(37)
#define M_xxxxz              M(37)
#define Ms_xxxyy             Ms(38)
#define M_xxxyy              M(38)
#define M_xxxyz              M(39)
#define Ms_xxxyz             Ms(39)
#define Ms_xxxzz             Ms(40)
#define M_xxxzz              M(40)
#define M_xxyyy              M(41)
#define Ms_xxyyy             Ms(41)
#define Ms_xxyyz             Ms(42)
#define M_xxyyz              M(42)
#define M_xxyzz              M(43)
#define Ms_xxyzz             Ms(43)
#define Ms_xxzzz             Ms(44)
#define M_xxzzz              M(44)
#define Ms_xyyyy             Ms(45)
#define M_xyyyy              M(45)
#define M_xyyyz              M(46)
#define Ms_xyyyz             Ms(46)
#define Ms_xyyzz             Ms(47)
#define M_xyyzz              M(47)
#define Ms_xyzzz             Ms(48)
#define M_xyzzz              M(48)
#define Ms_xzzzz             Ms(49)
#define M_xzzzz              M(49)
#define M_yyyyy              M(50)
#define Ms_yyyyy             Ms(50)
#define Ms_yyyyz             Ms(51)
#define M_yyyyz              M(51)
#define Ms_yyyzz             Ms(52)
#define M_yyyzz              M(52)
#define M_yyzzz              M(53)
#define Ms_yyzzz             Ms(53)
#define M_yzzzz              M(54)
#define Ms_yzzzz             Ms(54)
#define M_zzzzz              M(55)
#define Ms_zzzzz             Ms(55)
    v124     = 0.0833333333333333d0*M_0
    v0       = M_0*x
    v1       = M_x + v0
    v2       = M_0*y
    v3       = M_y + v2
    v4       = M_0*z + M_z
    v5       = M_x*x
    v6       = M_xx + v5
    v7       = 0.5d0*M_0
    v9       = M_y*x
    v10      = M_xy + v9
    v11      = M_x*y
    v12      = v0*y
    v13      = v10 + v11 + v12
    v14      = M_z*x
    v15      = M_xz + v14
    v16      = M_x*z
    v17      = v0*z + v15 + v16
    v18      = M_y*y
    v19      = M_yy + v18
    v21      = M_z*y
    v22      = M_yz + v21
    v23      = M_y*z
    v24      = v2*z + v22 + v23
    v25      = M_z*z
    v26      = M_zz + v25
    v28      = M_xx*x
    v29      = 0.166666666666667d0*M_0
    v32      = M_xx*y
    v33      = M_xxy + v32
    v34      = M_xy*x
    v35      = v5*y
    v36      = M_xx*z
    v37      = M_xxz + v36
    v38      = M_xz*x
    v39      = v5*z
    v40      = M_yy*x
    v41      = M_xyy + v40
    v42      = M_xy*y
    v43      = v9*y
    v45      = M_xy*z
    v46      = v45 + v9*z
    v47      = M_xz*y
    v48      = M_yz*x
    v126     = M_xyz + v48
    v49      = v11*z
    v50      = v14*y
    v125     = v47 + v50
    v51      = M_zz*x
    v52      = M_xzz + v51
    v53      = M_xz*z
    v54      = v14*z
    v56      = M_yy*y
    v58      = M_yy*z
    v59      = M_yyz + v58
    v60      = M_yz*y
    v61      = v18*z
    v62      = M_zz*y
    v63      = M_yzz + v62
    v64      = M_yz*z
    v65      = v21*z
    v66      = M_zz*z
    v68      = M_xxx*x
    v69      = 0.0416666666666667d0*M_0
    v72      = M_xxx*y
    v73      = M_xxy*x
    v74      = v28*y
    v75      = M_xy + v11
    v76      = M_xxz*x
    v77      = M_xz + v16
    v78      = M_xxy*y
    v79      = M_xyy*x
    v80      = v34*y
    v81      = 0.5d0*M_xx
    v83      = M_xxz*y
    v84      = M_xyz*x
    v85      = v38*y
    v86      = M_xzz*x
    v87      = M_xyy*y
    v88      = M_yyy*x
    v89      = v40*y
    v91      = M_xyz*y
    v92      = M_yyz*x
    v93      = v48*y
    v94      = M_xzz*y
    v95      = M_yzz*x
    v96      = v51*y
    v97      = M_zzz*x
    v99      = M_yyy*y
    v101     = M_yyz*y
    v102     = M_yz + v23
    v103     = M_yzz*y
    v106     = M_zzz*y
    v108     = 0.00833333333333333d0*M_0
    v110     = 0.5d0*M_xxx
    v113     = 0.5d0*M_xxy
    v116     = 0.5d0*M_xxz
    v119     = v126
    Ms_0     = M_0
    Ms_x     = v1
    Ms_y     = v3
    Ms_z     = v4
    Ms_xy    = v13
    Ms_xz    = v17
    Ms_yz    = v24
    Ms_xyz   = v12*z + v125 + v126 + v46 + v49
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v8       = a2
    v122     = 0.25d0*v8
    v31      = 0.5d0*v8
    v82      = M_0*v122
    v112     = M_x*v8
    v114     = v124*v8
    Ms_xx    = v6 + v7*v8
    Ms_xxy   = v3*v31 + v33 + v34 + v35
    Ms_xxz   = v31*v4 + v37 + v38 + v39
    Ms_xxyz  = M_xxyz + v83 + v84 + v85 + M_xxy*z + v24*v31 + v32*z + v34*z + v35*z
    a3       = a1*a2
    v30      = a3
    v71      = 0.166666666666667d0*v30
    v111     = v124*v30
    Ms_xxx   = M_xxx + v28 + M_x*v31 + v29*v30
    Ms_xxxy  = v3*v71 + v31*v75 + M_xxxy + v72 + v73 + v74
    Ms_xxxz  = M_xxxz + v76 + M_xxx*z + v28*z + v31*v77 + v4*v71
    Ms_xxxyz = M_xxxyz + M_xxxy*z + M_xxxz*y + M_xxyz*x + v24*v71 + v31*(M_xyz + v45 + &
      v47 + v49) + v72*z + v73*z + v74*z + v76*y
    a4       = a2*a2
    v70      = a4
    v109     = 0.0416666666666667d0*v70
    Ms_xxxx  = M_xxxx + v68 + M_x*v71 + M_xx*v31 + v69*v70
    Ms_xxxxy = M_xxxxy + M_xxxx*y + M_xxxy*x + v109*v3 + v31*v33 + v68*y + v71*v75
    Ms_xxxxz = M_xxxxz + M_xxxx*z + M_xxxz*x + v109*v4 + v31*v37 + v68*z + v71*v77
    a5       = a2*a3
    Ms_xxxxx = M_xxxxx + M_x*v109 + M_xx*v71 + M_xxx*v31 + M_xxxx*x + a5*v108
    b2       = b1*b1
    v20      = b2
    v44      = 0.5d0*v20
    v105     = M_0*v20
    v115     = v122*v20
    Ms_yy    = v19 + v20*v7
    Ms_xyy   = v1*v44 + v41 + v42 + v43
    Ms_yyz   = v4*v44 + v59 + v60 + v61
    Ms_xxyy  = M_xxyy + v78 + v79 + v80 + M_yy*v31 + v18*v31 + v20*v81 + v20*v82 + v44* &
      v5
    Ms_xyyz  = M_xyyz + v91 + v92 + v93 + M_xyy*z + v17*v44 + v40*z + v42*z + v43*z
    Ms_xxxyy = 0.25d0*(v112*v20) + M_xxxy*y + M_xxxyy + M_xxyy*x + M_xyy*v31 + v110*v20 &
      + v111*v20 + v19*v71 + v28*v44 + v31*v42 + v73*y
    Ms_xxyyz = M_xxyyz + M_xxyy*z + M_xxyz*y + M_xyyz*x + M_yyz*v31 + v115*v4 + v116* &
      v20 + v31*v58 + v31*v60 + v31*v61 + v36*v44 + v38*v44 + v39*v44 + &
      v78*z + v79*z + v80*z + v84*y
    b3       = b1*b2
    v57      = b3
    v90      = 0.166666666666667d0*v57
    Ms_yyy   = M_yyy + v56 + M_y*v44 + v29*v57
    Ms_xyyy  = v1*v90 + v10*v44 + M_xyyy + v87 + v88 + v89
    Ms_yyyz  = M_yyyz + v101 + M_yyy*z + v102*v44 + v4*v90 + v56*z
    Ms_xxyyy = M_xxyyy + M_xxyy*y + M_xyyy*x + M_y*v115 + M_yyy*v31 + v113*v20 + v114* &
      v57 + v31*v56 + v34*v44 + v6*v90 + v79*y
    Ms_xyyyz = M_xyyyz + M_xyyy*z + M_xyyz*y + M_yyyz*x + v17*v90 + v44*(v119 + v46) + &
      v87*z + v88*z + v89*z + v92*y
    b4       = b2*b2
    v100     = b4
    v118     = 0.0416666666666667d0*v100
    Ms_yyyy  = M_yyyy + v99 + M_y*v90 + M_yy*v44 + v100*v69
    Ms_xyyyy = M_xyyyy + M_xyyy*y + M_yyyy*x + v1*v118 + v10*v90 + v41*v44 + v88*y
    Ms_yyyyz = M_yyyyz + M_yyyy*z + M_yyyz*y + v102*v90 + v118*v4 + v44*v59 + v99*z
    b5       = b2*b3
    Ms_yyyyy = M_yyyyy + M_y*v118 + M_yy*v90 + M_yyy*v44 + M_yyyy*y + b5*v108
    c2       = c1*c1
    v27      = c2
    v123     = 0.25d0*v27
    v55      = 0.5d0*v27
    v104     = v123
    v117     = v123*v8
    v120     = v123*v20
    Ms_zz    = v26 + v27*v7
    Ms_xzz   = v1*v55 + v52 + v53 + v54
    Ms_yzz   = v3*v55 + v63 + v64 + v65
    Ms_xxzz  = M_xxzz + v86 + M_xxz*z + M_zz*v31 + v25*v31 + v27*v81 + v27*v82 + v38*z &
      + v5*v55
    Ms_xyzz  = M_xyzz + v94 + v95 + v96 + M_xyz*z + v13*v55 + v47*z + v48*z + v50*z
    Ms_yyzz  = M_yyzz + v103 + M_yy*v55 + M_yyz*z + M_zz*v44 + v104*v105 + v18*v55 + &
      v25*v44 + v60*z
    Ms_xxxzz = M_xxxzz + M_xxxz*z + M_xxzz*x + M_xzz*v31 + v104*v112 + v110*v27 + v111* &
      v27 + v26*v71 + v28*v55 + v31*v53 + v76*z
    Ms_xxyzz = M_xxyzz + M_xxyz*z + M_xxzz*y + M_xyzz*x + M_yzz*v31 + v113*v27 + v117* &
      v3 + v31*v62 + v31*v64 + v31*v65 + v32*v55 + v34*v55 + v35*v55 + &
      v83*z + v84*z + v85*z + v86*y
    Ms_xyyzz = M_xyyzz + M_xyy*v55 + M_xyyz*z + M_xyzz*y + M_xzz*v44 + M_yyzz*x + v1* &
      v120 + v40*v55 + v42*v55 + v43*v55 + v44*v51 + v44*v53 + v44*v54 &
      + v91*z + v92*z + v93*z + v95*y
    Ms_yyyzz = M_yyyzz + M_y*v120 + M_yyy*v55 + M_yyyz*z + M_yyzz*y + M_yzz*v44 + v101* &
      z + v124*v27*v57 + v26*v90 + v44*v64 + v55*v56
    h        = v20 + v27 + v8
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
    v67      = c3
    v98      = 0.166666666666667d0*v67
    Ms_zzz   = M_zzz + v66 + M_z*v55 + v29*v67
    Ms_xzzz  = M_xzzz + v97 + M_xzz*z + v1*v98 + v15*v55 + v51*z
    Ms_yzzz  = M_yzzz + v106 + M_yzz*z + v22*v55 + v3*v98 + v62*z
    Ms_xxzzz = M_xxzzz + M_xxzz*z + M_xzzz*x + M_z*v117 + M_zzz*v31 + v114*v67 + v116* &
      v27 + v31*v66 + v38*v55 + v6*v98 + v86*z
    Ms_xyzzz = M_xyzzz + M_xyzz*z + M_xzzz*y + M_yzzz*x + v13*v98 + v55*(v119 + v125) + &
      v94*z + v95*z + v96*z + v97*y
    Ms_yyzzz = 0.0833333333333333d0*(v105*v67) + M_yyz*v55 + M_yyzz*z + M_yyzzz + &
      M_yzzz*y + M_z*v120 + M_zzz*v44 + v103*z + v19*v98 + v44*v66 + &
      v55*v60
    c4       = c2*c2
    v107     = c4
    v121     = 0.0416666666666667d0*v107
    Ms_zzzz  = M_zzzz + M_z*v98 + M_zz*v55 + M_zzz*z + v107*v69
    Ms_xzzzz = M_xzzzz + M_xzzz*z + M_zzzz*x + v1*v121 + v15*v98 + v52*v55 + v97*z
    Ms_yzzzz = M_yzzzz + M_yzzz*z + M_zzzz*y + v106*z + v121*v3 + v22*v98 + v55*v63
    c5       = c2*c3
    Ms_zzzzz = M_zzzzz + M_z*v121 + M_zz*v98 + M_zzz*v55 + M_zzzz*z + c5*v108
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  x                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  M_z                 
#undef  Ms_z                
#undef  M_xx                
#undef  Ms_xx               
#undef  Ms_xy               
#undef  M_xy                
#undef  M_xz                
#undef  Ms_xz               
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
#undef  M_zz                
#undef  Ms_zz               
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
#undef  M_xxyy              
#undef  Ms_xxyy             
#undef  Ms_xxyz             
#undef  M_xxyz              
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
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  Ms_yyzz             
#undef  M_yyzz              
#undef  M_yzzz              
#undef  Ms_yzzz             
#undef  M_zzzz              
#undef  Ms_zzzz             
#undef  Ms_xxxxx            
#undef  M_xxxxx             
#undef  Ms_xxxxy            
#undef  M_xxxxy             
#undef  Ms_xxxxz            
#undef  M_xxxxz             
#undef  Ms_xxxyy            
#undef  M_xxxyy             
#undef  M_xxxyz             
#undef  Ms_xxxyz            
#undef  Ms_xxxzz            
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  Ms_xxyyy            
#undef  Ms_xxyyz            
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  Ms_xxyzz            
#undef  Ms_xxzzz            
#undef  M_xxzzz             
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  Ms_xyyzz            
#undef  M_xyyzz             
#undef  Ms_xyzzz            
#undef  M_xyzzz             
#undef  Ms_xzzzz            
#undef  M_xzzzz             
#undef  M_yyyyy             
#undef  Ms_yyyyy            
#undef  Ms_yyyyz            
#undef  M_yyyyz             
#undef  Ms_yyyzz            
#undef  M_yyyzz             
#undef  M_yyzzz             
#undef  Ms_yyzzz            
#undef  M_yzzzz             
#undef  Ms_yzzzz            
#undef  M_zzzzz             
#undef  Ms_zzzzz            
    end subroutine mom_es_M2M
    
! OPS  364*ADD + 2*DIV + 493*MUL + 31*NEG + POW + 14*SUB = 905  (1216 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v6, v7, v8,&
                v9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define M_x                  M(1)
#define L_x                  L(1)
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
#define L_xxxxx              L(25)
#define M_xxzz               M(25)
#define M_xyyy               M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xyyz               M(27)
#define L_xxxyy              L(28)
#define M_xyzz               M(28)
#define L_xxxyz              L(29)
#define M_xzzz               M(29)
#define M_yyyy               M(30)
#define L_xxyyy              L(30)
#define M_yyyz               M(31)
#define L_xxyyz              L(31)
#define L_xyyyy              L(32)
#define M_yyzz               M(32)
#define M_yzzz               M(33)
#define L_xyyyz              L(33)
#define M_zzzz               M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_xxxxx              M(35)
#define M_xxxxy              M(36)
#define M_xxxxz              M(37)
#define M_xxxyy              M(38)
#define M_xxxyz              M(39)
#define M_xxxzz              M(40)
#define M_xxyyy              M(41)
#define M_xxyyz              M(42)
#define M_xxyzz              M(43)
#define M_xxzzz              M(44)
#define M_xyyyy              M(45)
#define M_xyyyz              M(46)
#define M_xyyzz              M(47)
#define M_xyzzz              M(48)
#define M_xzzzz              M(49)
#define M_yyyyy              M(50)
#define M_yyyyz              M(51)
#define M_yyyzz              M(52)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define M_zzzzz              M(55)
    v53     = y*z
    v50     = 15.0d0*v53
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v42     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v42
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v43     = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v43
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v44     = 3.0d0*h
    v45     = h*v0
    v46     = h*v1
    v4      = -h
    v12     = v44
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v45
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v46
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 - 945.0d0*v19 + 630.0d0*v45
    v38     = -(v18 + 63.0d0*v26)
    v41     = v35 - 945.0d0*v30 + 630.0d0*v46
    u2      = 1.0/h
    u       = sqrt(u2)
    D_0     = u
    u3      = u*u2
    v2      = u3
    D_x     = -v2*x
    D_y     = -v2*y
    D_z     = -v2*z
    u4      = u2*u2
    u5      = u2*u3
    v3      = u5
    v47     = 3.0d0*v3
    v6      = v47*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v47*v53
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v48     = 3.0d0*v8
    v9      = v8*x
    v11     = v48*(h - v10)
    D_xxx   = -3.0d0*v9*(v42 - v44)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    D_xyz   = -v50*v9
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = v48*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v49     = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v49*y
    v25     = v49*z
    v27     = v15*v50
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    D_xxxy  = v21*v24
    D_xxxz  = v24*v25
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    D_xxyz  = v27*(v23 + v4)
    D_xxzz  = -(D_xxxx + D_xxyy)
    D_xyyy  = v21*v29
    D_xyyz  = v25*(v28 + v4)
    D_xyzz  = -(D_xxxy + D_xyyy)
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    D_yyyz  = v27*v29
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v51     = 15.0d0*v32
    v52     = v32*z
    v33     = v51*x
    v37     = v52
    v39     = 315.0d0*v52*x*y
    v40     = v51*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = v32*v36*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = v36*v37
    L_xxxx  = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = v39*(h - v5)
    L_xxxy  = D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    L_xxx   = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxy*M_xy + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyy*M_yy + D_xxxyz*M_yz + D_xxxz*M_z + D_xxxzz* &
      M_zz
    L_xxxz  = D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z
    D_xxyyy = v40*(v38 + h*v28 + 21.0d0*v20)
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = v37*(v34 - 945.0d0*v43 + 105.0d0*(v45 + v46))
    L_xxyy  = D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    L_xxy   = D_xxxxy*M_xx + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyy*M_yy + D_xxyyz*M_yz + D_xxyz*M_z + D_xxyzz* &
      M_zz
    L_xxyz  = D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    L_xx    = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxy*M_xxy + &
      D_xxxxz*M_xxz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyz*M_xyz + &
      D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy* &
      M_yyy + D_xxyyz*M_yyz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxz*M_z + &
      D_xxzz*M_zz + D_xxzzz*M_zzz
    L_xxz   = D_xxxxz*M_xx + D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyyz*M_yy + &
      D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz
    D_xyyyy = v32*v41*x
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = v39*(h - v7)
    L_xyyy  = D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    L_xyy   = D_xxxyy*M_xx + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyy*M_yy + D_xyyyz*M_yz + D_xyyz*M_z + D_xyyzz* &
      M_zz
    L_xyyz  = D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    L_xy    = D_xxxxy*M_xxx + D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyz*M_xxz + D_xxy*M_x &
      + D_xxyy*M_xy + D_xxyyy*M_xyy + D_xxyyz*M_xyz + D_xxyz*M_xz + &
      D_xxyzz*M_xzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy* &
      M_yyy + D_xyyyz*M_yyz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz
    L_xyz   = D_xxxyz*M_xx + D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyyz*M_yy + &
      D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxy*M_xxxy + D_xxxxz*M_xxxz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + &
      D_xxxyz*M_xxyz + D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyz*M_xyyz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz*M_xzzz + &
      D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyz* &
      M_yyyz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyz*M_yz + D_xyzz* &
      M_yzz + D_xyzzz*M_yzzz + D_xz*M_z + D_xzz*M_zz + D_xzzz*M_zzz + &
      D_xzzzz*M_zzzz
    L_xz    = D_xxxxz*M_xxx + D_xxxyz*M_xxy + D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxyyz* &
      M_xyy + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + &
      D_xxzzz*M_xzz + D_xyyyz*M_yyy + D_xyyz*M_yy + D_xyyzz*M_yyz + &
      D_xyz*M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xz*M_0 + D_xzz*M_z + &
      D_xzzz*M_zz + D_xzzzz*M_zzz
    D_yyyyy = v40*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = v37*v41
    L_yyyy  = D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = D_xxyyy*M_xx + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyy*M_yy + D_yyyyz*M_yz + D_yyyz*M_z + D_yyyzz* &
      M_zz
    L_yyyz  = D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = D_xxxyy*M_xxx + D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyz*M_xxz + D_xyy*M_x &
      + D_xyyy*M_xy + D_xyyyy*M_xyy + D_xyyyz*M_xyz + D_xyyz*M_xz + &
      D_xyyzz*M_xzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy* &
      M_yyy + D_yyyyz*M_yyz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz
    L_yyz   = D_xxyyz*M_xx + D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyz*M_yy + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = D_xxxxy*M_xxxx + D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyz*M_xxxz + D_xxy* &
      M_xx + D_xxyy*M_xxy + D_xxyyy*M_xxyy + D_xxyyz*M_xxyz + D_xxyz* &
      M_xxz + D_xxyzz*M_xxzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyz*M_xyyz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + &
      D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + D_y*M_0 + D_yy*M_y + &
      D_yyy*M_yy + D_yyyy*M_yyy + D_yyyyy*M_yyyy + D_yyyyz*M_yyyz + &
      D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyz*M_yz + D_yyzz*M_yzz + &
      D_yyzzz*M_yzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + D_yzzzz* &
      M_zzzz
    L_yz    = D_xxxyz*M_xxx + D_xxyyz*M_xxy + D_xxyz*M_xx + D_xxyzz*M_xxz + D_xyyyz* &
      M_xyy + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + &
      D_xyzzz*M_xzz + D_yyyyz*M_yyy + D_yyyz*M_yy + D_yyyzz*M_yyz + &
      D_yyz*M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yz*M_0 + D_yzz*M_z + &
      D_yzzz*M_zz + D_yzzzz*M_zzz
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + D_xxxy*M_xxxy + &
      D_xxxyy*M_xxxyy + D_xxxyz*M_xxxyz + D_xxxz*M_xxxz + D_xxxzz* &
      M_xxxzz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyyy*M_xxyyy + D_xxyyz &
      *M_xxyyz + D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxz*M_xxz + D_xxzz &
      *M_xxzz + D_xxzzz*M_xxzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy* &
      M_xyyy + D_xyyyy*M_xyyyy + D_xyyyz*M_xyyyz + D_xyyz*M_xyyz + &
      D_xyyzz*M_xyyzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_xzzzz*M_xzzzz + D_y* &
      M_y + D_yy*M_yy + D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + &
      D_yyyyz*M_yyyyz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + D_yz*M_yz + D_yzz*M_yzz + &
      D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_z*M_z + D_zz*M_zz + D_zzz* &
      M_zzz + D_zzzz*M_zzzz + D_zzzzz*M_zzzzz
    L_z     = D_xxxxz*M_xxxx + D_xxxyz*M_xxxy + D_xxxz*M_xxx + D_xxxzz*M_xxxz + &
      D_xxyyz*M_xxyy + D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + &
      D_xxzz*M_xxz + D_xxzzz*M_xxzz + D_xyyyz*M_xyyy + D_xyyz*M_xyy + &
      D_xyyzz*M_xyyz + D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_yyyyz* &
      M_yyyy + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyz*M_yy + D_yyzz* &
      M_yyz + D_yyzzz*M_yyzz + D_yz*M_y + D_yzz*M_yz + D_yzzz*M_yzz + &
      D_yzzzz*M_yzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + &
      D_zzzzz*M_zzzz
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  L_x                 
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
#undef  L_xxxxx             
#undef  M_xxzz              
#undef  M_xyyy              
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xyyz              
#undef  L_xxxyy             
#undef  M_xyzz              
#undef  L_xxxyz             
#undef  M_xzzz              
#undef  M_yyyy              
#undef  L_xxyyy             
#undef  M_yyyz              
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  M_yyzz              
#undef  M_yzzz              
#undef  L_xyyyz             
#undef  M_zzzz              
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  M_xxxyz             
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  M_xxzzz             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  M_xyyzz             
#undef  M_xyzzz             
#undef  M_xzzzz             
#undef  M_yyyyy             
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  M_zzzzz             
    end subroutine mom_es_M2L
    
! OPS  227*ADD + 2*DIV + 270*MUL + 20*NEG + POW = 520  (1120 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v11, v12, v13, v14, v15, v16, v17,&
                v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27, v28,&
                v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz
#define Ls_0                 Ls(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define Ls_x                 Ls(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define L_xx                 L(4)
#define Ls_xx                Ls(4)
#define Ls_xy                Ls(5)
#define L_xy                 L(5)
#define Ls_xz                Ls(6)
#define L_xz                 L(6)
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
#define L_xxxx               L(16)
#define Ls_xxxx              Ls(16)
#define Ls_xxxy              Ls(17)
#define L_xxxy               L(17)
#define Ls_xxxz              Ls(18)
#define L_xxxz               L(18)
#define Ls_xxyy              Ls(19)
#define L_xxyy               L(19)
#define Ls_xxyz              Ls(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define Ls_xyyy              Ls(21)
#define L_xyyz               L(22)
#define Ls_xyyz              Ls(22)
#define Ls_yyyy              Ls(23)
#define L_yyyy               L(23)
#define L_yyyz               L(24)
#define Ls_yyyz              Ls(24)
#define L_xxxxx              L(25)
#define Ls_xxxxx             Ls(25)
#define Ls_xxxxy             Ls(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define Ls_xxxxz             Ls(27)
#define Ls_xxxyy             Ls(28)
#define L_xxxyy              L(28)
#define Ls_xxxyz             Ls(29)
#define L_xxxyz              L(29)
#define L_xxyyy              L(30)
#define Ls_xxyyy             Ls(30)
#define L_xxyyz              L(31)
#define Ls_xxyyz             Ls(31)
#define Ls_xyyyy             Ls(32)
#define L_xyyyy              L(32)
#define Ls_xyyyz             Ls(33)
#define L_xyyyz              L(33)
#define Ls_yyyyy             Ls(34)
#define L_yyyyy              L(34)
#define Ls_yyyyz             Ls(35)
#define L_yyyyz              L(35)
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
    v34      = 0.5d0*x
    v40      = L_xyyz*z
    v43      = v5*y
    v46      = L_xyz*z
    v57      = L_xz*z
    v70      = 0.166666666666667d0*x
    v80      = L_yyyz*z
    v83      = L_yyz*z
    v86      = 0.5d0*y
    v90      = L_yz*z
    v96      = 0.166666666666667d0*y
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
    v73      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v98      = L_yzz*z
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    v36      = L_xxzz*z
    L_xyzz   = -(L_xxxy + L_xyyy)
    v53      = L_xyzz*z
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    v88      = L_yyzz*z
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    v16      = L_xxxz + L_xxxyz*y + L_xxxzz*z
    Ls_xxxz  = L_xxxxz*x + v16
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    v21      = L_xxyz + L_xxyzz*z
    v22      = L_xxyyz*y + v21
    v39      = v21*y
    Ls_xxyz  = L_xxxyz*x + v22
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    v44      = L_xyyz + L_xyyzz*z
    v45      = L_xyyyz*y + v44
    v56      = v44*y
    Ls_xyyz  = L_xxyyz*x + v45
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    v82      = L_yyyz + L_yyyzz*z
    Ls_yyyz  = v82 + L_xyyyz*x + L_yyyyz*y
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v9       = a2
    v10      = 0.5d0*v9
    v69      = 0.25d0*v9
    a3       = a1*a2
    v24      = a3
    v25      = 0.166666666666667d0*v24
    a4       = a2*a2
    v58      = 0.0416666666666667d0*a4
    a5       = a2*a3
    b2       = b1*b1
    v11      = b2
    v12      = L_xxxyy*v11
    v18      = L_xxyyy*v11
    v31      = 0.5d0*v11
    v37      = L_xxyyz*v11
    v41      = L_xyyyy*v11
    v54      = L_xyyyz*v11
    v71      = 3.0d0*v11
    v95      = 0.25d0*v11
    b3       = b1*b2
    v26      = b3
    v27      = L_xxyyy*v26
    v47      = L_xyyyy*v26
    v65      = 0.166666666666667d0*v26
    v74      = L_xyyyz*v26
    b4       = b2*b2
    v59      = b4
    v60      = L_xyyyy*v59
    v91      = 0.0416666666666667d0*v59
    b5       = b2*b3
    c2       = c1*c1
    v13      = c2
    v102     = 0.5d0*v13
    v61      = L_xzz*v13
    v92      = L_yzz*v13
    v28      = L_xxzz*v13
    v48      = L_xyzz*v13
    v75      = L_xzzz*v13
    v84      = L_yyzz*v13
    v99      = L_yzzz*v13
    v14      = L_xxxzz*v13
    v35      = v12 + v14 + 2.0d0*(L_xxx + v15 + v8)
    Ls_xxx   = 0.5d0*(v12 + v14) + L_xxx + L_xxxxx*v10 + v0*x + v15 + v8
    v19      = L_xxyzz*v13
    v32      = v19 + 2.0d0*(L_xxy + v17)
    v33      = v32*y
    v52      = 2.0d0*v20 + v18 + v32
    Ls_xxy   = 0.5d0*(v18 + v19) + L_xxxxy*v10 + L_xxy + v17 + v2*x + v20
    v38      = L_xxzzz*v13
    v79      = v37 + v38 + 2.0d0*(L_xxz + v36 + v39)
    Ls_xxz   = 0.5d0*(v37 + v38) + L_xxxxz*v10 + L_xxz + v16*x + v36 + v39
    v42      = L_xyyzz*v13
    v50      = v42 + 2.0d0*(L_xyy + v40)
    v51      = v50*y
    v66      = v11*v50
    Ls_xyy   = 0.5d0*(v41 + v42) + L_xxxyy*v10 + L_xyy + v4*x + v40 + v43
    v55      = L_xyzzz*v13
    v77      = v55 + 2.0d0*(L_xyz + v53)
    v78      = v77*y
    Ls_xyz   = 0.5d0*(v54 + v55) + L_xxxyz*v10 + L_xyz + v22*x + v53 + v56
    v81      = L_yyyzz*v13
    v87      = v81 + 2.0d0*(L_yyy + v80)
    Ls_yyy   = 0.5d0*v81 + L_xxyyy*v10 + L_yyy + L_yyyyy*v31 + v6*x + v7*y + v80
    v89      = L_yyzzz*v13
    v101     = v89 + 2.0d0*(L_yyz + v88)
    Ls_yyz   = 0.5d0*v89 + L_xxyyz*v10 + L_yyyyz*v31 + L_yyz + v45*x + v82*y + v88
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
    v29      = c3
    v103     = 0.166666666666667d0*v29
    v62      = L_xzzz*v29
    v93      = L_yzzz*v29
    v30      = L_xxzzz*v29
    v72      = v27 + v30 + v3*v71 + 6.0d0*(L_xx + v23) + 3.0d0*(v28 + v33)
    Ls_xx    = 0.166666666666667d0*(v27 + v30 + 3.0d0*(v28 + v33)) + L_xx + L_xxxxx*v25 &
      + v0*v10 + v23 + v3*v31 + v34*v35
    v49      = L_xyzzz*v29
    v67      = v49 + 3.0d0*(2.0d0*L_xy + 2.0d0*v46 + v48)
    v68      = v67*y
    Ls_xy    = 0.166666666666667d0*(v47 + v49 + 3.0d0*(v48 + v51)) + L_xxxxy*v25 + L_xy &
      + v10*v2 + v31*v5 + v34*v52 + v46
    v76      = L_xzzzz*v29
    Ls_xz    = 0.166666666666667d0*(v74 + v76 + 3.0d0*(v75 + v78)) + L_xxxxz*v25 + L_xz &
      + v10*v16 + v31*v44 + v34*v79 + v73
    v85      = L_yyzzz*v29
    v97      = v85 + 3.0d0*(2.0d0*L_yy + 2.0d0*v83 + v84)
    Ls_yy    = 0.166666666666667d0*(3.0d0*v84 + v85) + L_xxxyy*v25 + L_yy + L_yyyyy*v65 &
      + v10*v4 + v31*v7 + v34*(v41 + 2.0d0*v43 + v50) + v83 + v86*v87
    v100     = L_yzzzz*v29
    Ls_yz    = 0.166666666666667d0*(v100 + 3.0d0*v99) + L_xxxyz*v25 + L_yyyyz*v65 + &
      L_yz + v10*v22 + v101*v86 + v31*v82 + v34*(v54 + 2.0d0*v56 + v77 &
      ) + v98
    c4       = c2*c2
    v63      = c4
    v104     = 0.0416666666666667d0*v63
    v64      = L_xzzzz*v63
    Ls_x     = 0.0416666666666667d0*(v60 + 12.0d0*v61 + v64 + 6.0d0*v66 + 4.0d0*(v62 + &
      v68)) + L_x + L_xxxxx*v58 + v0*v25 + v35*v69 + v5*v65 + v57 + v70 &
      *v72
    v94      = L_yzzzz*v63
    Ls_y     = 0.0416666666666667d0*(12.0d0*v92 + 4.0d0*v93 + v94) + L_xxxxy*v58 + L_y &
      + L_yyyyy*v91 + v2*v25 + v52*v69 + v65*v7 + v70*(v47 + v5*v71 + &
      3.0d0*v51 + v67) + v87*v95 + v90 + v96*v97
    Ls_z     = L_z + L_xxxxz*v58 + L_yyyyz*v91 + L_zz*z + L_zzz*v102 + L_zzzz*v103 + &
      L_zzzzz*v104 + v101*v95 + v16*v25 + v65*v82 + v69*v79 + v70*( &
      6.0d0*L_xz + v44*v71 + 6.0d0*v73 + v74 + 3.0d0*v75 + v76 + 3.0d0* &
      v78) + v96*(6.0d0*L_yz + v100 + 6.0d0*v98 + 3.0d0*v99)
    c5       = c2*c3
    Ls_0     = 0.00833333333333333d0*(L_xxxxx*a5 + L_yyyyy*b5 + L_zzzzz*c5 + 5.0d0*(x*( &
      24.0d0*L_x + 4.0d0*v26*v5 + 24.0d0*v57 + v60 + 12.0d0*v61 + 4.0d0 &
      *v62 + v64 + 6.0d0*v66 + 4.0d0*v68) + y*(24.0d0*L_y + 24.0d0*v90 &
      + 12.0d0*v92 + 4.0d0*v93 + v94)) + 10.0d0*(v11*v97 + v24*v35 + &
      v26*v87 + v72*v9)) + L_0 + L_z*z + L_zz*v102 + L_zzz*v103 + &
      L_zzzz*v104 + v0*v58 + v7*v91
#undef  Ls_0                
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  Ls_x                
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
#undef  Ls_xxxz             
#undef  L_xxxz              
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
#undef  Ls_xxxxy            
#undef  L_xxxxy             
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
    
! OPS  172*ADD + 2*DIV + 230*MUL + 21*NEG + POW = 426  (899 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz
#define Phi_0                Phi(0)
#define y                    r(2)
#define x                    r(1)
#define L_0                  L(0)
#define z                    r(3)
#define L_x                  L(1)
#define Phi_x                Phi(1)
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
#define L_yy                 L(7)
#define Phi_yy               Phi(7)
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
#define L_xxxxx              L(25)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define L_xxxyy              L(28)
#define L_xxxyz              L(29)
#define L_xxyyy              L(30)
#define L_xxyyz              L(31)
#define L_xyyyy              L(32)
#define L_xyyyz              L(33)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
    v0      = L_xxz*z
    v10     = L_xxyy + L_xxyyz*z
    v14     = L_xxxx + L_xxxxy*y + L_xxxxz*z
    v15     = 2.0d0*z
    v18     = 0.5d0*x
    v19     = 2.0d0*y
    v20     = L_xxxy + L_xxxyz*z
    v22     = L_xyz*z
    v26     = L_xyyy + L_xyyyz*z
    v28     = L_xxxyy*y + v20
    v32     = L_xz*z
    v45     = 0.166666666666667d0*x
    v58     = L_yyz*z
    v62     = L_yyyy + L_yyyyz*z
    v63     = 0.5d0*y
    v65     = L_yz*z
    v71     = 0.166666666666667d0*y
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    v47     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v73     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    L_xyzz  = -(L_xxxy + L_xyyy)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    L_xxxzz = -(L_xxxxx + L_xxxyy)
    v53     = L_xxxz + L_xxxyz*y + L_xxxzz*z
    L_xxyzz = -(L_xxxxy + L_xxyyy)
    v56     = L_xxyz + L_xxyzz*z
    L_xxzzz = -(L_xxxxz + L_xxyyz)
    L_xyyzz = -(L_xxxyy + L_xyyyy)
    v51     = L_xyyz + L_xyyzz*z
    L_xyzzz = -(L_xxxyz + L_xyyyz)
    L_xzzzz = -(L_xxxzz + L_xyyzz)
    L_yyyzz = -(L_xxyyy + L_yyyyy)
    v76     = L_yyyz + L_yyyzz*z
    L_yyzzz = -(L_xxyyz + L_yyyyz)
    L_yzzzz = -(L_xxyzz + L_yyyzz)
    L_zzzzz = -(L_xxzzz + L_yyzzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v12     = a2
    v13     = 0.5d0*v12
    v44     = 0.25d0*v12
    a3      = a1*a2
    v1      = a3
    v2      = 0.166666666666667d0*v1
    a4      = a2*a2
    v33     = 0.0416666666666667d0*a4
    a5      = a2*a3
    b2      = b1*b1
    v9      = b2
    v11     = v10*v9
    v27     = v26*v9
    v61     = 0.5d0*v9
    v70     = 0.25d0*v9
    v52     = v51*v9
    b3      = b1*b2
    v3      = b3
    v4      = L_xxyyy*v3
    v23     = L_xyyyy*v3
    v40     = 0.166666666666667d0*v3
    v48     = L_xyyyz*v3
    b4      = b2*b2
    v34     = b4
    v35     = L_xyyyy*v34
    v66     = 0.0416666666666667d0*v34
    b5      = b2*b3
    c2      = c1*c1
    v5      = c2
    v78     = 0.5d0*v5
    v36     = L_xzz*v5
    v67     = L_yzz*v5
    v6      = L_xxzz*v5
    v24     = L_xyzz*v5
    v49     = L_xzzz*v5
    v59     = L_yyzz*v5
    v74     = L_yzzz*v5
    v21     = 2.0d0*L_xxx + L_xxxyy*v9 + L_xxxz*v15 + L_xxxzz*v5 + v19*v20
    v16     = 2.0d0*L_xxy + L_xxyz*v15 + L_xxyzz*v5
    v17     = v16*y
    v31     = v16 + L_xxyyy*v9 + v10*v19
    v57     = L_xxyyz*v9 + 2.0d0*L_xxz + L_xxzz*v15 + L_xxzzz*v5 + v19*v56
    v29     = 2.0d0*L_xyy + L_xyyz*v15 + L_xyyzz*v5
    v30     = v29*y
    v41     = v29*v9
    v54     = 2.0d0*L_xyz + L_xyzz*v15 + L_xyzzz*v5
    v55     = v54*y
    v64     = 2.0d0*L_yyy + L_yyyz*v15 + L_yyyzz*v5
    v77     = 2.0d0*L_yyz + L_yyzz*v15 + L_yyzzz*v5
    h       = v12 + v5 + v9
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
    v7      = c3
    v79     = 0.166666666666667d0*v7
    v37     = L_xzzz*v7
    v68     = L_yzzz*v7
    v8      = L_xxzzz*v7
    v46     = v4 + v8 + 3.0d0*(2.0d0*L_xx + 2.0d0*v0 + v11 + v17 + v6)
    Phi_xx  = 0.166666666666667d0*(v4 + v8 + 3.0d0*(v11 + v17 + v6)) + L_xx + L_xxxxx* &
      v2 + v0 + v13*v14 + v18*v21
    v25     = L_xyzzz*v7
    v42     = v25 + 3.0d0*(2.0d0*L_xy + 2.0d0*v22 + v24)
    v43     = v42*y
    Phi_xy  = 0.166666666666667d0*(v23 + v25 + 3.0d0*(v24 + v27 + v30)) + L_xxxxy*v2 + &
      L_xy + v13*v28 + v18*v31 + v22
    v50     = L_xzzzz*v7
    Phi_xz  = 0.166666666666667d0*(v48 + v50 + 3.0d0*(v49 + v52 + v55)) + L_xxxxz*v2 + &
      L_xz + v13*v53 + v18*v57 + v47
    v60     = L_yyzzz*v7
    v72     = v60 + 3.0d0*(2.0d0*L_yy + 2.0d0*v58 + v59)
    Phi_yy  = 0.166666666666667d0*(3.0d0*v59 + v60) + L_xxxyy*v2 + L_yy + L_yyyyy*v40 &
      + v13*(L_xxyyy*y + v10) + v18*(L_xyyyy*v9 + v19*v26 + v29) + v58 &
      + v61*v62 + v63*v64
    Phi_zz  = -(Phi_xx + Phi_yy)
    v75     = L_yzzzz*v7
    Phi_yz  = 0.166666666666667d0*(3.0d0*v74 + v75) + L_xxxyz*v2 + L_yyyyz*v40 + L_yz &
      + v13*(L_xxyyz*y + v56) + v18*(L_xyyyz*v9 + v19*v51 + v54) + v61* &
      v76 + v63*v77 + v73
    c4      = c2*c2
    v38     = c4
    v80     = 0.0416666666666667d0*v38
    v39     = L_xzzzz*v38
    Phi_x   = 0.0416666666666667d0*(v35 + 12.0d0*v36 + v39 + 6.0d0*v41 + 4.0d0*(v37 + &
      v43)) + L_x + L_xxxxx*v33 + v14*v2 + v21*v44 + v26*v40 + v32 + &
      v45*v46
    v69     = L_yzzzz*v38
    Phi_y   = 0.0416666666666667d0*(12.0d0*v67 + 4.0d0*v68 + v69) + L_xxxxy*v33 + L_y &
      + L_yyyyy*v66 + v2*v28 + v31*v44 + v40*v62 + v45*(v23 + 3.0d0*v27 &
      + 3.0d0*v30 + v42) + v64*v70 + v65 + v71*v72
    Phi_z   = L_z + L_xxxxz*v33 + L_yyyyz*v66 + L_zz*z + L_zzz*v78 + L_zzzz*v79 + &
      L_zzzzz*v80 + v2*v53 + v40*v76 + v44*v57 + v45*(6.0d0*L_xz + &
      6.0d0*v47 + v48 + 3.0d0*v49 + v50 + 3.0d0*v52 + 3.0d0*v55) + v70* &
      v77 + v71*(6.0d0*L_yz + 6.0d0*v73 + 3.0d0*v74 + v75)
    c5      = c2*c3
    Phi_0   = 0.00833333333333333d0*(L_xxxxx*a5 + L_yyyyy*b5 + L_zzzzz*c5 + 5.0d0*(x*( &
      24.0d0*L_x + 4.0d0*v26*v3 + 24.0d0*v32 + v35 + 12.0d0*v36 + 4.0d0 &
      *v37 + v39 + 6.0d0*v41 + 4.0d0*v43) + y*(24.0d0*L_y + 24.0d0*v65 &
      + 12.0d0*v67 + 4.0d0*v68 + v69)) + 10.0d0*(v1*v21 + v12*v46 + v3* &
      v64 + v72*v9)) + L_0 + L_z*z + L_zz*v78 + L_zzz*v79 + L_zzzz*v80 &
      + v14*v33 + v62*v66
#undef  Phi_0               
#undef  y                   
#undef  x                   
#undef  L_0                 
#undef  z                   
#undef  L_x                 
#undef  Phi_x               
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
#undef  L_yy                
#undef  Phi_yy              
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
    
! OPS  344*ADD + 2*DIV + 386*MUL + POW = 733  (1428 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v105, v106, v107, v108, v109, v11,&
                v110, v111, v112, v113, v114, v115, v116, v117, v118, v119,&
                v12, v120, v121, v122, v123, v124, v125, v126, v13, v14, v15,&
                v16, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70,&
                v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81,&
                v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92,&
                v93, v94, v95, v96, v97, v98, v99, h, u
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define M_z                  M(3)
#define Ms_z                 Ms(3)
#define M_xx                 M(4)
#define Ms_xx                Ms(4)
#define Ms_xy                Ms(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define Ms_xz                Ms(6)
#define Ms_yy                Ms(7)
#define M_yy                 M(7)
#define Ms_yz                Ms(8)
#define M_yz                 M(8)
#define M_zz                 M(9)
#define Ms_zz                Ms(9)
#define Ms_xxx               Ms(10)
#define M_xxx                M(10)
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
#define M_xxyy               M(23)
#define Ms_xxyy              Ms(23)
#define Ms_xxyz              Ms(24)
#define M_xxyz               M(24)
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
#define Ms_yyyy              Ms(30)
#define M_yyyy               M(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define Ms_yyzz              Ms(32)
#define M_yyzz               M(32)
#define M_yzzz               M(33)
#define Ms_yzzz              Ms(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
#define Ms_xxxxx             Ms(35)
#define M_xxxxx              M(35)
#define Ms_xxxxy             Ms(36)
#define M_xxxxy              M(36)
#define Ms_xxxxz             Ms(37)
#define M_xxxxz              M(37)
#define Ms_xxxyy             Ms(38)
#define M_xxxyy              M(38)
#define M_xxxyz              M(39)
#define Ms_xxxyz             Ms(39)
#define Ms_xxxzz             Ms(40)
#define M_xxxzz              M(40)
#define M_xxyyy              M(41)
#define Ms_xxyyy             Ms(41)
#define Ms_xxyyz             Ms(42)
#define M_xxyyz              M(42)
#define M_xxyzz              M(43)
#define Ms_xxyzz             Ms(43)
#define Ms_xxzzz             Ms(44)
#define M_xxzzz              M(44)
#define Ms_xyyyy             Ms(45)
#define M_xyyyy              M(45)
#define M_xyyyz              M(46)
#define Ms_xyyyz             Ms(46)
#define Ms_xyyzz             Ms(47)
#define M_xyyzz              M(47)
#define Ms_xyzzz             Ms(48)
#define M_xyzzz              M(48)
#define Ms_xzzzz             Ms(49)
#define M_xzzzz              M(49)
#define M_yyyyy              M(50)
#define Ms_yyyyy             Ms(50)
#define Ms_yyyyz             Ms(51)
#define M_yyyyz              M(51)
#define Ms_yyyzz             Ms(52)
#define M_yyyzz              M(52)
#define M_yyzzz              M(53)
#define Ms_yyzzz             Ms(53)
#define M_yzzzz              M(54)
#define Ms_yzzzz             Ms(54)
#define M_zzzzz              M(55)
#define Ms_zzzzz             Ms(55)
    v124     = 0.0833333333333333d0*M_0
    v0       = M_0*x
    v1       = M_x + v0
    v2       = M_0*y
    v3       = M_y + v2
    v4       = M_0*z + M_z
    v5       = M_x*x
    v6       = M_xx + v5
    v7       = 0.5d0*M_0
    v9       = M_y*x
    v10      = M_xy + v9
    v11      = M_x*y
    v12      = v0*y
    v13      = v10 + v11 + v12
    v14      = M_z*x
    v15      = M_xz + v14
    v16      = M_x*z
    v17      = v0*z + v15 + v16
    v18      = M_y*y
    v19      = M_yy + v18
    v21      = M_z*y
    v22      = M_yz + v21
    v23      = M_y*z
    v24      = v2*z + v22 + v23
    v25      = M_z*z
    v26      = M_zz + v25
    v28      = M_xx*x
    v29      = 0.166666666666667d0*M_0
    v32      = M_xx*y
    v33      = M_xxy + v32
    v34      = M_xy*x
    v35      = v5*y
    v36      = M_xx*z
    v37      = M_xxz + v36
    v38      = M_xz*x
    v39      = v5*z
    v40      = M_yy*x
    v41      = M_xyy + v40
    v42      = M_xy*y
    v43      = v9*y
    v45      = M_xy*z
    v46      = v45 + v9*z
    v47      = M_xz*y
    v48      = M_yz*x
    v126     = M_xyz + v48
    v49      = v11*z
    v50      = v14*y
    v125     = v47 + v50
    v51      = M_zz*x
    v52      = M_xzz + v51
    v53      = M_xz*z
    v54      = v14*z
    v56      = M_yy*y
    v58      = M_yy*z
    v59      = M_yyz + v58
    v60      = M_yz*y
    v61      = v18*z
    v62      = M_zz*y
    v63      = M_yzz + v62
    v64      = M_yz*z
    v65      = v21*z
    v66      = M_zz*z
    v68      = M_xxx*x
    v69      = 0.0416666666666667d0*M_0
    v72      = M_xxx*y
    v73      = M_xxy*x
    v74      = v28*y
    v75      = M_xy + v11
    v76      = M_xxz*x
    v77      = M_xz + v16
    v78      = M_xxy*y
    v79      = M_xyy*x
    v80      = v34*y
    v81      = 0.5d0*M_xx
    v83      = M_xxz*y
    v84      = M_xyz*x
    v85      = v38*y
    v86      = M_xzz*x
    v87      = M_xyy*y
    v88      = M_yyy*x
    v89      = v40*y
    v91      = M_xyz*y
    v92      = M_yyz*x
    v93      = v48*y
    v94      = M_xzz*y
    v95      = M_yzz*x
    v96      = v51*y
    v97      = M_zzz*x
    v99      = M_yyy*y
    v101     = M_yyz*y
    v102     = M_yz + v23
    v103     = M_yzz*y
    v106     = M_zzz*y
    v108     = 0.00833333333333333d0*M_0
    v110     = 0.5d0*M_xxx
    v113     = 0.5d0*M_xxy
    v116     = 0.5d0*M_xxz
    v119     = v126
    Ms_0     = Ms_0 + (M_0)
    Ms_x     = Ms_x + (v1)
    Ms_y     = Ms_y + (v3)
    Ms_z     = Ms_z + (v4)
    Ms_xy    = Ms_xy + (v13)
    Ms_xz    = Ms_xz + (v17)
    Ms_yz    = Ms_yz + (v24)
    Ms_xyz   = Ms_xyz + (v12*z + v125 + v126 + v46 + v49)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v8       = a2
    v122     = 0.25d0*v8
    v31      = 0.5d0*v8
    v82      = M_0*v122
    v112     = M_x*v8
    v114     = v124*v8
    Ms_xx    = Ms_xx + (v6 + v7*v8)
    Ms_xxy   = Ms_xxy + (v3*v31 + v33 + v34 + v35)
    Ms_xxz   = Ms_xxz + (v31*v4 + v37 + v38 + v39)
    Ms_xxyz  = Ms_xxyz + (M_xxyz + v83 + v84 + v85 + M_xxy*z + v24*v31 + v32*z + v34*z + v35*z)
    a3       = a1*a2
    v30      = a3
    v71      = 0.166666666666667d0*v30
    v111     = v124*v30
    Ms_xxx   = Ms_xxx + (M_xxx + v28 + M_x*v31 + v29*v30)
    Ms_xxxy  = Ms_xxxy + (v3*v71 + v31*v75 + M_xxxy + v72 + v73 + v74)
    Ms_xxxz  = Ms_xxxz + (M_xxxz + v76 + M_xxx*z + v28*z + v31*v77 + v4*v71)
    Ms_xxxyz = Ms_xxxyz + (M_xxxyz + M_xxxy*z + M_xxxz*y + M_xxyz*x + v24*v71 + v31*(M_xyz + v45 + &
      v47 + v49) + v72*z + v73*z + v74*z + v76*y)
    a4       = a2*a2
    v70      = a4
    v109     = 0.0416666666666667d0*v70
    Ms_xxxx  = Ms_xxxx + (M_xxxx + v68 + M_x*v71 + M_xx*v31 + v69*v70)
    Ms_xxxxy = Ms_xxxxy + (M_xxxxy + M_xxxx*y + M_xxxy*x + v109*v3 + v31*v33 + v68*y + v71*v75)
    Ms_xxxxz = Ms_xxxxz + (M_xxxxz + M_xxxx*z + M_xxxz*x + v109*v4 + v31*v37 + v68*z + v71*v77)
    a5       = a2*a3
    Ms_xxxxx = Ms_xxxxx + (M_xxxxx + M_x*v109 + M_xx*v71 + M_xxx*v31 + M_xxxx*x + a5*v108)
    b2       = b1*b1
    v20      = b2
    v44      = 0.5d0*v20
    v105     = M_0*v20
    v115     = v122*v20
    Ms_yy    = Ms_yy + (v19 + v20*v7)
    Ms_xyy   = Ms_xyy + (v1*v44 + v41 + v42 + v43)
    Ms_yyz   = Ms_yyz + (v4*v44 + v59 + v60 + v61)
    Ms_xxyy  = Ms_xxyy + (M_xxyy + v78 + v79 + v80 + M_yy*v31 + v18*v31 + v20*v81 + v20*v82 + v44* &
      v5)
    Ms_xyyz  = Ms_xyyz + (M_xyyz + v91 + v92 + v93 + M_xyy*z + v17*v44 + v40*z + v42*z + v43*z)
    Ms_xxxyy = Ms_xxxyy + (0.25d0*(v112*v20) + M_xxxy*y + M_xxxyy + M_xxyy*x + M_xyy*v31 + v110*v20 &
      + v111*v20 + v19*v71 + v28*v44 + v31*v42 + v73*y)
    Ms_xxyyz = Ms_xxyyz + (M_xxyyz + M_xxyy*z + M_xxyz*y + M_xyyz*x + M_yyz*v31 + v115*v4 + v116* &
      v20 + v31*v58 + v31*v60 + v31*v61 + v36*v44 + v38*v44 + v39*v44 + &
      v78*z + v79*z + v80*z + v84*y)
    b3       = b1*b2
    v57      = b3
    v90      = 0.166666666666667d0*v57
    Ms_yyy   = Ms_yyy + (M_yyy + v56 + M_y*v44 + v29*v57)
    Ms_xyyy  = Ms_xyyy + (v1*v90 + v10*v44 + M_xyyy + v87 + v88 + v89)
    Ms_yyyz  = Ms_yyyz + (M_yyyz + v101 + M_yyy*z + v102*v44 + v4*v90 + v56*z)
    Ms_xxyyy = Ms_xxyyy + (M_xxyyy + M_xxyy*y + M_xyyy*x + M_y*v115 + M_yyy*v31 + v113*v20 + v114* &
      v57 + v31*v56 + v34*v44 + v6*v90 + v79*y)
    Ms_xyyyz = Ms_xyyyz + (M_xyyyz + M_xyyy*z + M_xyyz*y + M_yyyz*x + v17*v90 + v44*(v119 + v46) + &
      v87*z + v88*z + v89*z + v92*y)
    b4       = b2*b2
    v100     = b4
    v118     = 0.0416666666666667d0*v100
    Ms_yyyy  = Ms_yyyy + (M_yyyy + v99 + M_y*v90 + M_yy*v44 + v100*v69)
    Ms_xyyyy = Ms_xyyyy + (M_xyyyy + M_xyyy*y + M_yyyy*x + v1*v118 + v10*v90 + v41*v44 + v88*y)
    Ms_yyyyz = Ms_yyyyz + (M_yyyyz + M_yyyy*z + M_yyyz*y + v102*v90 + v118*v4 + v44*v59 + v99*z)
    b5       = b2*b3
    Ms_yyyyy = Ms_yyyyy + (M_yyyyy + M_y*v118 + M_yy*v90 + M_yyy*v44 + M_yyyy*y + b5*v108)
    c2       = c1*c1
    v27      = c2
    v123     = 0.25d0*v27
    v55      = 0.5d0*v27
    v104     = v123
    v117     = v123*v8
    v120     = v123*v20
    Ms_zz    = Ms_zz + (v26 + v27*v7)
    Ms_xzz   = Ms_xzz + (v1*v55 + v52 + v53 + v54)
    Ms_yzz   = Ms_yzz + (v3*v55 + v63 + v64 + v65)
    Ms_xxzz  = Ms_xxzz + (M_xxzz + v86 + M_xxz*z + M_zz*v31 + v25*v31 + v27*v81 + v27*v82 + v38*z &
      + v5*v55)
    Ms_xyzz  = Ms_xyzz + (M_xyzz + v94 + v95 + v96 + M_xyz*z + v13*v55 + v47*z + v48*z + v50*z)
    Ms_yyzz  = Ms_yyzz + (M_yyzz + v103 + M_yy*v55 + M_yyz*z + M_zz*v44 + v104*v105 + v18*v55 + &
      v25*v44 + v60*z)
    Ms_xxxzz = Ms_xxxzz + (M_xxxzz + M_xxxz*z + M_xxzz*x + M_xzz*v31 + v104*v112 + v110*v27 + v111* &
      v27 + v26*v71 + v28*v55 + v31*v53 + v76*z)
    Ms_xxyzz = Ms_xxyzz + (M_xxyzz + M_xxyz*z + M_xxzz*y + M_xyzz*x + M_yzz*v31 + v113*v27 + v117* &
      v3 + v31*v62 + v31*v64 + v31*v65 + v32*v55 + v34*v55 + v35*v55 + &
      v83*z + v84*z + v85*z + v86*y)
    Ms_xyyzz = Ms_xyyzz + (M_xyyzz + M_xyy*v55 + M_xyyz*z + M_xyzz*y + M_xzz*v44 + M_yyzz*x + v1* &
      v120 + v40*v55 + v42*v55 + v43*v55 + v44*v51 + v44*v53 + v44*v54 &
      + v91*z + v92*z + v93*z + v95*y)
    Ms_yyyzz = Ms_yyyzz + (M_yyyzz + M_y*v120 + M_yyy*v55 + M_yyyz*z + M_yyzz*y + M_yzz*v44 + v101* &
      z + v124*v27*v57 + v26*v90 + v44*v64 + v55*v56)
    h        = v20 + v27 + v8
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
    v67      = c3
    v98      = 0.166666666666667d0*v67
    Ms_zzz   = Ms_zzz + (M_zzz + v66 + M_z*v55 + v29*v67)
    Ms_xzzz  = Ms_xzzz + (M_xzzz + v97 + M_xzz*z + v1*v98 + v15*v55 + v51*z)
    Ms_yzzz  = Ms_yzzz + (M_yzzz + v106 + M_yzz*z + v22*v55 + v3*v98 + v62*z)
    Ms_xxzzz = Ms_xxzzz + (M_xxzzz + M_xxzz*z + M_xzzz*x + M_z*v117 + M_zzz*v31 + v114*v67 + v116* &
      v27 + v31*v66 + v38*v55 + v6*v98 + v86*z)
    Ms_xyzzz = Ms_xyzzz + (M_xyzzz + M_xyzz*z + M_xzzz*y + M_yzzz*x + v13*v98 + v55*(v119 + v125) + &
      v94*z + v95*z + v96*z + v97*y)
    Ms_yyzzz = Ms_yyzzz + (0.0833333333333333d0*(v105*v67) + M_yyz*v55 + M_yyzz*z + M_yyzzz + &
      M_yzzz*y + M_z*v120 + M_zzz*v44 + v103*z + v19*v98 + v44*v66 + &
      v55*v60)
    c4       = c2*c2
    v107     = c4
    v121     = 0.0416666666666667d0*v107
    Ms_zzzz  = Ms_zzzz + (M_zzzz + M_z*v98 + M_zz*v55 + M_zzz*z + v107*v69)
    Ms_xzzzz = Ms_xzzzz + (M_xzzzz + M_xzzz*z + M_zzzz*x + v1*v121 + v15*v98 + v52*v55 + v97*z)
    Ms_yzzzz = Ms_yzzzz + (M_yzzzz + M_yzzz*z + M_zzzz*y + v106*z + v121*v3 + v22*v98 + v55*v63)
    c5       = c2*c3
    Ms_zzzzz = Ms_zzzzz + (M_zzzzz + M_z*v121 + M_zz*v98 + M_zzz*v55 + M_zzzz*z + c5*v108)
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  Ms_0                
#undef  x                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  M_z                 
#undef  Ms_z                
#undef  M_xx                
#undef  Ms_xx               
#undef  Ms_xy               
#undef  M_xy                
#undef  M_xz                
#undef  Ms_xz               
#undef  Ms_yy               
#undef  M_yy                
#undef  Ms_yz               
#undef  M_yz                
#undef  M_zz                
#undef  Ms_zz               
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
#undef  M_xxyy              
#undef  Ms_xxyy             
#undef  Ms_xxyz             
#undef  M_xxyz              
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
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  Ms_yyzz             
#undef  M_yyzz              
#undef  M_yzzz              
#undef  Ms_yzzz             
#undef  M_zzzz              
#undef  Ms_zzzz             
#undef  Ms_xxxxx            
#undef  M_xxxxx             
#undef  Ms_xxxxy            
#undef  M_xxxxy             
#undef  Ms_xxxxz            
#undef  M_xxxxz             
#undef  Ms_xxxyy            
#undef  M_xxxyy             
#undef  M_xxxyz             
#undef  Ms_xxxyz            
#undef  Ms_xxxzz            
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  Ms_xxyyy            
#undef  Ms_xxyyz            
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  Ms_xxyzz            
#undef  Ms_xxzzz            
#undef  M_xxzzz             
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  Ms_xyyzz            
#undef  M_xyyzz             
#undef  Ms_xyzzz            
#undef  M_xyzzz             
#undef  Ms_xzzzz            
#undef  M_xzzzz             
#undef  M_yyyyy             
#undef  Ms_yyyyy            
#undef  Ms_yyyyz            
#undef  M_yyyyz             
#undef  Ms_yyyzz            
#undef  M_yyyzz             
#undef  M_yyzzz             
#undef  Ms_yyzzz            
#undef  M_yzzzz             
#undef  Ms_yzzzz            
#undef  M_zzzzz             
#undef  Ms_zzzzz            
    end subroutine mom_es_M2M_add
    
! OPS  364*ADD + 2*DIV + 493*MUL + 31*NEG + POW + 14*SUB = 905  (1216 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v6, v7, v8,&
                v9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define M_x                  M(1)
#define L_x                  L(1)
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
#define L_xxxxx              L(25)
#define M_xxzz               M(25)
#define M_xyyy               M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xyyz               M(27)
#define L_xxxyy              L(28)
#define M_xyzz               M(28)
#define L_xxxyz              L(29)
#define M_xzzz               M(29)
#define M_yyyy               M(30)
#define L_xxyyy              L(30)
#define M_yyyz               M(31)
#define L_xxyyz              L(31)
#define L_xyyyy              L(32)
#define M_yyzz               M(32)
#define M_yzzz               M(33)
#define L_xyyyz              L(33)
#define M_zzzz               M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_xxxxx              M(35)
#define M_xxxxy              M(36)
#define M_xxxxz              M(37)
#define M_xxxyy              M(38)
#define M_xxxyz              M(39)
#define M_xxxzz              M(40)
#define M_xxyyy              M(41)
#define M_xxyyz              M(42)
#define M_xxyzz              M(43)
#define M_xxzzz              M(44)
#define M_xyyyy              M(45)
#define M_xyyyz              M(46)
#define M_xyyzz              M(47)
#define M_xyzzz              M(48)
#define M_xzzzz              M(49)
#define M_yyyyy              M(50)
#define M_yyyyz              M(51)
#define M_yyyzz              M(52)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define M_zzzzz              M(55)
    v53     = y*z
    v50     = 15.0d0*v53
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v42     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v42
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v43     = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v43
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v44     = 3.0d0*h
    v45     = h*v0
    v46     = h*v1
    v4      = -h
    v12     = v44
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v45
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v46
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 - 945.0d0*v19 + 630.0d0*v45
    v38     = -(v18 + 63.0d0*v26)
    v41     = v35 - 945.0d0*v30 + 630.0d0*v46
    u2      = 1.0/h
    u       = sqrt(u2)
    D_0     = u
    u3      = u*u2
    v2      = u3
    D_x     = -v2*x
    D_y     = -v2*y
    D_z     = -v2*z
    u4      = u2*u2
    u5      = u2*u3
    v3      = u5
    v47     = 3.0d0*v3
    v6      = v47*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v47*v53
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v48     = 3.0d0*v8
    v9      = v8*x
    v11     = v48*(h - v10)
    D_xxx   = -3.0d0*v9*(v42 - v44)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    D_xyz   = -v50*v9
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = v48*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v49     = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v49*y
    v25     = v49*z
    v27     = v15*v50
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    D_xxxy  = v21*v24
    D_xxxz  = v24*v25
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    D_xxyz  = v27*(v23 + v4)
    D_xxzz  = -(D_xxxx + D_xxyy)
    D_xyyy  = v21*v29
    D_xyyz  = v25*(v28 + v4)
    D_xyzz  = -(D_xxxy + D_xyyy)
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    D_yyyz  = v27*v29
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v51     = 15.0d0*v32
    v52     = v32*z
    v33     = v51*x
    v37     = v52
    v39     = 315.0d0*v52*x*y
    v40     = v51*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = L_xxxxx + (D_xxxxx*M_0)
    D_xxxxy = v32*v36*y
    L_xxxxy = L_xxxxy + (D_xxxxy*M_0)
    D_xxxxz = v36*v37
    L_xxxx  = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z)
    L_xxxxz = L_xxxxz + (D_xxxxz*M_0)
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    L_xxxyy = L_xxxyy + (D_xxxyy*M_0)
    D_xxxyz = v39*(h - v5)
    L_xxxy  = L_xxxy + (D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z)
    L_xxxyz = L_xxxyz + (D_xxxyz*M_0)
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    L_xxx   = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxy*M_xy + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyy*M_yy + D_xxxyz*M_yz + D_xxxz*M_z + D_xxxzz* &
      M_zz)
    L_xxxz  = L_xxxz + (D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z)
    D_xxyyy = v40*(v38 + h*v28 + 21.0d0*v20)
    L_xxyyy = L_xxyyy + (D_xxyyy*M_0)
    D_xxyyz = v37*(v34 - 945.0d0*v43 + 105.0d0*(v45 + v46))
    L_xxyy  = L_xxyy + (D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z)
    L_xxyyz = L_xxyyz + (D_xxyyz*M_0)
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    L_xxy   = L_xxy + (D_xxxxy*M_xx + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyy*M_yy + D_xxyyz*M_yz + D_xxyz*M_z + D_xxyzz* &
      M_zz)
    L_xxyz  = L_xxyz + (D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z)
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    L_xx    = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxy*M_xxy + &
      D_xxxxz*M_xxz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyz*M_xyz + &
      D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy* &
      M_yyy + D_xxyyz*M_yyz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxz*M_z + &
      D_xxzz*M_zz + D_xxzzz*M_zzz)
    L_xxz   = L_xxz + (D_xxxxz*M_xx + D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyyz*M_yy + &
      D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz)
    D_xyyyy = v32*v41*x
    L_xyyyy = L_xyyyy + (D_xyyyy*M_0)
    D_xyyyz = v39*(h - v7)
    L_xyyy  = L_xyyy + (D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z)
    L_xyyyz = L_xyyyz + (D_xyyyz*M_0)
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    L_xyy   = L_xyy + (D_xxxyy*M_xx + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyy*M_yy + D_xyyyz*M_yz + D_xyyz*M_z + D_xyyzz* &
      M_zz)
    L_xyyz  = L_xyyz + (D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z)
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    L_xy    = L_xy + (D_xxxxy*M_xxx + D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyz*M_xxz + D_xxy*M_x &
      + D_xxyy*M_xy + D_xxyyy*M_xyy + D_xxyyz*M_xyz + D_xxyz*M_xz + &
      D_xxyzz*M_xzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy* &
      M_yyy + D_xyyyz*M_yyz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz)
    L_xyz   = L_xyz + (D_xxxyz*M_xx + D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyyz*M_yy + &
      D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz)
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxy*M_xxxy + D_xxxxz*M_xxxz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + &
      D_xxxyz*M_xxyz + D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyz*M_xyyz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz*M_xzzz + &
      D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyz* &
      M_yyyz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyz*M_yz + D_xyzz* &
      M_yzz + D_xyzzz*M_yzzz + D_xz*M_z + D_xzz*M_zz + D_xzzz*M_zzz + &
      D_xzzzz*M_zzzz)
    L_xz    = L_xz + (D_xxxxz*M_xxx + D_xxxyz*M_xxy + D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxyyz* &
      M_xyy + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + &
      D_xxzzz*M_xzz + D_xyyyz*M_yyy + D_xyyz*M_yy + D_xyyzz*M_yyz + &
      D_xyz*M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xz*M_0 + D_xzz*M_z + &
      D_xzzz*M_zz + D_xzzzz*M_zzz)
    D_yyyyy = v40*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = L_yyyyy + (D_yyyyy*M_0)
    D_yyyyz = v37*v41
    L_yyyy  = L_yyyy + (D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z)
    L_yyyyz = L_yyyyz + (D_yyyyz*M_0)
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = L_yyy + (D_xxyyy*M_xx + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyy*M_yy + D_yyyyz*M_yz + D_yyyz*M_z + D_yyyzz* &
      M_zz)
    L_yyyz  = L_yyyz + (D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z)
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = L_yy + (D_xxxyy*M_xxx + D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyz*M_xxz + D_xyy*M_x &
      + D_xyyy*M_xy + D_xyyyy*M_xyy + D_xyyyz*M_xyz + D_xyyz*M_xz + &
      D_xyyzz*M_xzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy* &
      M_yyy + D_yyyyz*M_yyz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz)
    L_yyz   = L_yyz + (D_xxyyz*M_xx + D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyz*M_yy + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz)
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = L_y + (D_xxxxy*M_xxxx + D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyz*M_xxxz + D_xxy* &
      M_xx + D_xxyy*M_xxy + D_xxyyy*M_xxyy + D_xxyyz*M_xxyz + D_xxyz* &
      M_xxz + D_xxyzz*M_xxzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyz*M_xyyz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + &
      D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + D_y*M_0 + D_yy*M_y + &
      D_yyy*M_yy + D_yyyy*M_yyy + D_yyyyy*M_yyyy + D_yyyyz*M_yyyz + &
      D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyz*M_yz + D_yyzz*M_yzz + &
      D_yyzzz*M_yzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + D_yzzzz* &
      M_zzzz)
    L_yz    = L_yz + (D_xxxyz*M_xxx + D_xxyyz*M_xxy + D_xxyz*M_xx + D_xxyzz*M_xxz + D_xyyyz* &
      M_xyy + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + &
      D_xyzzz*M_xzz + D_yyyyz*M_yyy + D_yyyz*M_yy + D_yyyzz*M_yyz + &
      D_yyz*M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yz*M_0 + D_yzz*M_z + &
      D_yzzz*M_zz + D_yzzzz*M_zzz)
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + D_xxxy*M_xxxy + &
      D_xxxyy*M_xxxyy + D_xxxyz*M_xxxyz + D_xxxz*M_xxxz + D_xxxzz* &
      M_xxxzz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyyy*M_xxyyy + D_xxyyz &
      *M_xxyyz + D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxz*M_xxz + D_xxzz &
      *M_xxzz + D_xxzzz*M_xxzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy* &
      M_xyyy + D_xyyyy*M_xyyyy + D_xyyyz*M_xyyyz + D_xyyz*M_xyyz + &
      D_xyyzz*M_xyyzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_xzzzz*M_xzzzz + D_y* &
      M_y + D_yy*M_yy + D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + &
      D_yyyyz*M_yyyyz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + D_yz*M_yz + D_yzz*M_yzz + &
      D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_z*M_z + D_zz*M_zz + D_zzz* &
      M_zzz + D_zzzz*M_zzzz + D_zzzzz*M_zzzzz)
    L_z     = L_z + (D_xxxxz*M_xxxx + D_xxxyz*M_xxxy + D_xxxz*M_xxx + D_xxxzz*M_xxxz + &
      D_xxyyz*M_xxyy + D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + &
      D_xxzz*M_xxz + D_xxzzz*M_xxzz + D_xyyyz*M_xyyy + D_xyyz*M_xyy + &
      D_xyyzz*M_xyyz + D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_yyyyz* &
      M_yyyy + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyz*M_yy + D_yyzz* &
      M_yyz + D_yyzzz*M_yyzz + D_yz*M_y + D_yzz*M_yz + D_yzzz*M_yzz + &
      D_yzzzz*M_yzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + &
      D_zzzzz*M_zzzz)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  L_x                 
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
#undef  L_xxxxx             
#undef  M_xxzz              
#undef  M_xyyy              
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xyyz              
#undef  L_xxxyy             
#undef  M_xyzz              
#undef  L_xxxyz             
#undef  M_xzzz              
#undef  M_yyyy              
#undef  L_xxyyy             
#undef  M_yyyz              
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  M_yyzz              
#undef  M_yzzz              
#undef  L_xyyyz             
#undef  M_zzzz              
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  M_xxxyz             
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  M_xxzzz             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  M_xyyzz             
#undef  M_xyzzz             
#undef  M_xzzzz             
#undef  M_yyyyy             
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  M_zzzzz             
    end subroutine mom_es_M2L_add
    
! OPS  227*ADD + 2*DIV + 270*MUL + 20*NEG + POW = 520  (1120 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v11, v12, v13, v14, v15, v16, v17,&
                v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27, v28,&
                v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz
#define Ls_0                 Ls(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define Ls_x                 Ls(1)
#define Ls_y                 Ls(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Ls_z                 Ls(3)
#define L_xx                 L(4)
#define Ls_xx                Ls(4)
#define Ls_xy                Ls(5)
#define L_xy                 L(5)
#define Ls_xz                Ls(6)
#define L_xz                 L(6)
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
#define L_xxxx               L(16)
#define Ls_xxxx              Ls(16)
#define Ls_xxxy              Ls(17)
#define L_xxxy               L(17)
#define Ls_xxxz              Ls(18)
#define L_xxxz               L(18)
#define Ls_xxyy              Ls(19)
#define L_xxyy               L(19)
#define Ls_xxyz              Ls(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define Ls_xyyy              Ls(21)
#define L_xyyz               L(22)
#define Ls_xyyz              Ls(22)
#define Ls_yyyy              Ls(23)
#define L_yyyy               L(23)
#define L_yyyz               L(24)
#define Ls_yyyz              Ls(24)
#define L_xxxxx              L(25)
#define Ls_xxxxx             Ls(25)
#define Ls_xxxxy             Ls(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define Ls_xxxxz             Ls(27)
#define Ls_xxxyy             Ls(28)
#define L_xxxyy              L(28)
#define Ls_xxxyz             Ls(29)
#define L_xxxyz              L(29)
#define L_xxyyy              L(30)
#define Ls_xxyyy             Ls(30)
#define L_xxyyz              L(31)
#define Ls_xxyyz             Ls(31)
#define Ls_xyyyy             Ls(32)
#define L_xyyyy              L(32)
#define Ls_xyyyz             Ls(33)
#define L_xyyyz              L(33)
#define Ls_yyyyy             Ls(34)
#define L_yyyyy              L(34)
#define Ls_yyyyz             Ls(35)
#define L_yyyyz              L(35)
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
    v34      = 0.5d0*x
    v40      = L_xyyz*z
    v43      = v5*y
    v46      = L_xyz*z
    v57      = L_xz*z
    v70      = 0.166666666666667d0*x
    v80      = L_yyyz*z
    v83      = L_yyz*z
    v86      = 0.5d0*y
    v90      = L_yz*z
    v96      = 0.166666666666667d0*y
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
    v73      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v98      = L_yzz*z
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    v36      = L_xxzz*z
    L_xyzz   = -(L_xxxy + L_xyyy)
    v53      = L_xyzz*z
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    v88      = L_yyzz*z
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    v16      = L_xxxz + L_xxxyz*y + L_xxxzz*z
    Ls_xxxz  = Ls_xxxz + (L_xxxxz*x + v16)
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    v21      = L_xxyz + L_xxyzz*z
    v22      = L_xxyyz*y + v21
    v39      = v21*y
    Ls_xxyz  = Ls_xxyz + (L_xxxyz*x + v22)
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    v44      = L_xyyz + L_xyyzz*z
    v45      = L_xyyyz*y + v44
    v56      = v44*y
    Ls_xyyz  = Ls_xyyz + (L_xxyyz*x + v45)
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    v82      = L_yyyz + L_yyyzz*z
    Ls_yyyz  = Ls_yyyz + (v82 + L_xyyyz*x + L_yyyyz*y)
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v9       = a2
    v10      = 0.5d0*v9
    v69      = 0.25d0*v9
    a3       = a1*a2
    v24      = a3
    v25      = 0.166666666666667d0*v24
    a4       = a2*a2
    v58      = 0.0416666666666667d0*a4
    a5       = a2*a3
    b2       = b1*b1
    v11      = b2
    v12      = L_xxxyy*v11
    v18      = L_xxyyy*v11
    v31      = 0.5d0*v11
    v37      = L_xxyyz*v11
    v41      = L_xyyyy*v11
    v54      = L_xyyyz*v11
    v71      = 3.0d0*v11
    v95      = 0.25d0*v11
    b3       = b1*b2
    v26      = b3
    v27      = L_xxyyy*v26
    v47      = L_xyyyy*v26
    v65      = 0.166666666666667d0*v26
    v74      = L_xyyyz*v26
    b4       = b2*b2
    v59      = b4
    v60      = L_xyyyy*v59
    v91      = 0.0416666666666667d0*v59
    b5       = b2*b3
    c2       = c1*c1
    v13      = c2
    v102     = 0.5d0*v13
    v61      = L_xzz*v13
    v92      = L_yzz*v13
    v28      = L_xxzz*v13
    v48      = L_xyzz*v13
    v75      = L_xzzz*v13
    v84      = L_yyzz*v13
    v99      = L_yzzz*v13
    v14      = L_xxxzz*v13
    v35      = v12 + v14 + 2.0d0*(L_xxx + v15 + v8)
    Ls_xxx   = Ls_xxx + (0.5d0*(v12 + v14) + L_xxx + L_xxxxx*v10 + v0*x + v15 + v8)
    v19      = L_xxyzz*v13
    v32      = v19 + 2.0d0*(L_xxy + v17)
    v33      = v32*y
    v52      = 2.0d0*v20 + v18 + v32
    Ls_xxy   = Ls_xxy + (0.5d0*(v18 + v19) + L_xxxxy*v10 + L_xxy + v17 + v2*x + v20)
    v38      = L_xxzzz*v13
    v79      = v37 + v38 + 2.0d0*(L_xxz + v36 + v39)
    Ls_xxz   = Ls_xxz + (0.5d0*(v37 + v38) + L_xxxxz*v10 + L_xxz + v16*x + v36 + v39)
    v42      = L_xyyzz*v13
    v50      = v42 + 2.0d0*(L_xyy + v40)
    v51      = v50*y
    v66      = v11*v50
    Ls_xyy   = Ls_xyy + (0.5d0*(v41 + v42) + L_xxxyy*v10 + L_xyy + v4*x + v40 + v43)
    v55      = L_xyzzz*v13
    v77      = v55 + 2.0d0*(L_xyz + v53)
    v78      = v77*y
    Ls_xyz   = Ls_xyz + (0.5d0*(v54 + v55) + L_xxxyz*v10 + L_xyz + v22*x + v53 + v56)
    v81      = L_yyyzz*v13
    v87      = v81 + 2.0d0*(L_yyy + v80)
    Ls_yyy   = Ls_yyy + (0.5d0*v81 + L_xxyyy*v10 + L_yyy + L_yyyyy*v31 + v6*x + v7*y + v80)
    v89      = L_yyzzz*v13
    v101     = v89 + 2.0d0*(L_yyz + v88)
    Ls_yyz   = Ls_yyz + (0.5d0*v89 + L_xxyyz*v10 + L_yyyyz*v31 + L_yyz + v45*x + v82*y + v88)
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
    v29      = c3
    v103     = 0.166666666666667d0*v29
    v62      = L_xzzz*v29
    v93      = L_yzzz*v29
    v30      = L_xxzzz*v29
    v72      = v27 + v30 + v3*v71 + 6.0d0*(L_xx + v23) + 3.0d0*(v28 + v33)
    Ls_xx    = Ls_xx + (0.166666666666667d0*(v27 + v30 + 3.0d0*(v28 + v33)) + L_xx + L_xxxxx*v25 &
      + v0*v10 + v23 + v3*v31 + v34*v35)
    v49      = L_xyzzz*v29
    v67      = v49 + 3.0d0*(2.0d0*L_xy + 2.0d0*v46 + v48)
    v68      = v67*y
    Ls_xy    = Ls_xy + (0.166666666666667d0*(v47 + v49 + 3.0d0*(v48 + v51)) + L_xxxxy*v25 + L_xy &
      + v10*v2 + v31*v5 + v34*v52 + v46)
    v76      = L_xzzzz*v29
    Ls_xz    = Ls_xz + (0.166666666666667d0*(v74 + v76 + 3.0d0*(v75 + v78)) + L_xxxxz*v25 + L_xz &
      + v10*v16 + v31*v44 + v34*v79 + v73)
    v85      = L_yyzzz*v29
    v97      = v85 + 3.0d0*(2.0d0*L_yy + 2.0d0*v83 + v84)
    Ls_yy    = Ls_yy + (0.166666666666667d0*(3.0d0*v84 + v85) + L_xxxyy*v25 + L_yy + L_yyyyy*v65 &
      + v10*v4 + v31*v7 + v34*(v41 + 2.0d0*v43 + v50) + v83 + v86*v87)
    v100     = L_yzzzz*v29
    Ls_yz    = Ls_yz + (0.166666666666667d0*(v100 + 3.0d0*v99) + L_xxxyz*v25 + L_yyyyz*v65 + &
      L_yz + v10*v22 + v101*v86 + v31*v82 + v34*(v54 + 2.0d0*v56 + v77 &
      ) + v98)
    c4       = c2*c2
    v63      = c4
    v104     = 0.0416666666666667d0*v63
    v64      = L_xzzzz*v63
    Ls_x     = Ls_x + (0.0416666666666667d0*(v60 + 12.0d0*v61 + v64 + 6.0d0*v66 + 4.0d0*(v62 + &
      v68)) + L_x + L_xxxxx*v58 + v0*v25 + v35*v69 + v5*v65 + v57 + v70 &
      *v72)
    v94      = L_yzzzz*v63
    Ls_y     = Ls_y + (0.0416666666666667d0*(12.0d0*v92 + 4.0d0*v93 + v94) + L_xxxxy*v58 + L_y &
      + L_yyyyy*v91 + v2*v25 + v52*v69 + v65*v7 + v70*(v47 + v5*v71 + &
      3.0d0*v51 + v67) + v87*v95 + v90 + v96*v97)
    Ls_z     = Ls_z + (L_z + L_xxxxz*v58 + L_yyyyz*v91 + L_zz*z + L_zzz*v102 + L_zzzz*v103 + &
      L_zzzzz*v104 + v101*v95 + v16*v25 + v65*v82 + v69*v79 + v70*( &
      6.0d0*L_xz + v44*v71 + 6.0d0*v73 + v74 + 3.0d0*v75 + v76 + 3.0d0* &
      v78) + v96*(6.0d0*L_yz + v100 + 6.0d0*v98 + 3.0d0*v99))
    c5       = c2*c3
    Ls_0     = Ls_0 + (0.00833333333333333d0*(L_xxxxx*a5 + L_yyyyy*b5 + L_zzzzz*c5 + 5.0d0*(x*( &
      24.0d0*L_x + 4.0d0*v26*v5 + 24.0d0*v57 + v60 + 12.0d0*v61 + 4.0d0 &
      *v62 + v64 + 6.0d0*v66 + 4.0d0*v68) + y*(24.0d0*L_y + 24.0d0*v90 &
      + 12.0d0*v92 + 4.0d0*v93 + v94)) + 10.0d0*(v11*v97 + v24*v35 + &
      v26*v87 + v72*v9)) + L_0 + L_z*z + L_zz*v102 + L_zzz*v103 + &
      L_zzzz*v104 + v0*v58 + v7*v91)
#undef  Ls_0                
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  Ls_x                
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
#undef  Ls_xxxz             
#undef  L_xxxz              
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
#undef  Ls_xxxxy            
#undef  L_xxxxy             
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
    
! OPS  364*ADD + 2*DIV + 493*MUL + 31*NEG + POW + 14*SUB = 905  (1216 before optimization)
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
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v6, v7, v8,&
                v9, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define M_x                  M(1:2,1)
#define L_x                  L(1:2,1)
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
#define L_xxxxx              L(1:2,25)
#define M_xxzz               M(1:2,25)
#define M_xyyy               M(1:2,26)
#define L_xxxxy              L(1:2,26)
#define L_xxxxz              L(1:2,27)
#define M_xyyz               M(1:2,27)
#define L_xxxyy              L(1:2,28)
#define M_xyzz               M(1:2,28)
#define L_xxxyz              L(1:2,29)
#define M_xzzz               M(1:2,29)
#define M_yyyy               M(1:2,30)
#define L_xxyyy              L(1:2,30)
#define M_yyyz               M(1:2,31)
#define L_xxyyz              L(1:2,31)
#define L_xyyyy              L(1:2,32)
#define M_yyzz               M(1:2,32)
#define M_yzzz               M(1:2,33)
#define L_xyyyz              L(1:2,33)
#define M_zzzz               M(1:2,34)
#define L_yyyyy              L(1:2,34)
#define L_yyyyz              L(1:2,35)
#define M_xxxxx              M(1:2,35)
#define M_xxxxy              M(1:2,36)
#define M_xxxxz              M(1:2,37)
#define M_xxxyy              M(1:2,38)
#define M_xxxyz              M(1:2,39)
#define M_xxxzz              M(1:2,40)
#define M_xxyyy              M(1:2,41)
#define M_xxyyz              M(1:2,42)
#define M_xxyzz              M(1:2,43)
#define M_xxzzz              M(1:2,44)
#define M_xyyyy              M(1:2,45)
#define M_xyyyz              M(1:2,46)
#define M_xyyzz              M(1:2,47)
#define M_xyzzz              M(1:2,48)
#define M_xzzzz              M(1:2,49)
#define M_yyyyy              M(1:2,50)
#define M_yyyyz              M(1:2,51)
#define M_yyyzz              M(1:2,52)
#define M_yyzzz              M(1:2,53)
#define M_yzzzz              M(1:2,54)
#define M_zzzzz              M(1:2,55)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v53     = y*z
    v50     = 15.0d0*v53
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v42     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v42
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v43     = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v43
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v44     = 3.0d0*h
    v45     = h*v0
    v46     = h*v1
    v4      = -h
    v12     = v44
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v45
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v46
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 - 945.0d0*v19 + 630.0d0*v45
    v38     = -(v18 + 63.0d0*v26)
    v41     = v35 - 945.0d0*v30 + 630.0d0*v46
    u2      = 1.0/h
    u       = sqrt(u2)
    D_0     = u
    u3      = u*u2
    v2      = u3
    D_x     = -v2*x
    D_y     = -v2*y
    D_z     = -v2*z
    u4      = u2*u2
    u5      = u2*u3
    v3      = u5
    v47     = 3.0d0*v3
    v6      = v47*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v47*v53
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v48     = 3.0d0*v8
    v9      = v8*x
    v11     = v48*(h - v10)
    D_xxx   = -3.0d0*v9*(v42 - v44)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    D_xyz   = -v50*v9
    D_xzz   = -(D_xxx + D_xyy)
    D_yyy   = v48*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v49     = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v49*y
    v25     = v49*z
    v27     = v15*v50
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    D_xxxy  = v21*v24
    D_xxxz  = v24*v25
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    D_xxyz  = v27*(v23 + v4)
    D_xxzz  = -(D_xxxx + D_xxyy)
    D_xyyy  = v21*v29
    D_xyyz  = v25*(v28 + v4)
    D_xyzz  = -(D_xxxy + D_xyyy)
    D_xzzz  = -(D_xxxz + D_xyyz)
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    D_yyyz  = v27*v29
    D_yyzz  = -(D_xxyy + D_yyyy)
    D_yzzz  = -(D_xxyz + D_yyyz)
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v51     = 15.0d0*v32
    v52     = v32*z
    v33     = v51*x
    v37     = v52
    v39     = 315.0d0*v52*x*y
    v40     = v51*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = v32*v36*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = v36*v37
    L_xxxx  = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = v39*(h - v5)
    L_xxxy  = D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    L_xxx   = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxy*M_xy + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyy*M_yy + D_xxxyz*M_yz + D_xxxz*M_z + D_xxxzz* &
      M_zz
    L_xxxz  = D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z
    D_xxyyy = v40*(v38 + h*v28 + 21.0d0*v20)
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = v37*(v34 - 945.0d0*v43 + 105.0d0*(v45 + v46))
    L_xxyy  = D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    L_xxy   = D_xxxxy*M_xx + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyy*M_yy + D_xxyyz*M_yz + D_xxyz*M_z + D_xxyzz* &
      M_zz
    L_xxyz  = D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    L_xx    = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxy*M_xxy + &
      D_xxxxz*M_xxz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyz*M_xyz + &
      D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy* &
      M_yyy + D_xxyyz*M_yyz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxz*M_z + &
      D_xxzz*M_zz + D_xxzzz*M_zzz
    L_xxz   = D_xxxxz*M_xx + D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyyz*M_yy + &
      D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz
    D_xyyyy = v32*v41*x
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = v39*(h - v7)
    L_xyyy  = D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    L_xyy   = D_xxxyy*M_xx + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyy*M_yy + D_xyyyz*M_yz + D_xyyz*M_z + D_xyyzz* &
      M_zz
    L_xyyz  = D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    L_xy    = D_xxxxy*M_xxx + D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyz*M_xxz + D_xxy*M_x &
      + D_xxyy*M_xy + D_xxyyy*M_xyy + D_xxyyz*M_xyz + D_xxyz*M_xz + &
      D_xxyzz*M_xzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy* &
      M_yyy + D_xyyyz*M_yyz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz
    L_xyz   = D_xxxyz*M_xx + D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyyz*M_yy + &
      D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    L_x     = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxy*M_xxxy + D_xxxxz*M_xxxz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + &
      D_xxxyz*M_xxyz + D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyz*M_xyyz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz*M_xzzz + &
      D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyz* &
      M_yyyz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyz*M_yz + D_xyzz* &
      M_yzz + D_xyzzz*M_yzzz + D_xz*M_z + D_xzz*M_zz + D_xzzz*M_zzz + &
      D_xzzzz*M_zzzz
    L_xz    = D_xxxxz*M_xxx + D_xxxyz*M_xxy + D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxyyz* &
      M_xyy + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + &
      D_xxzzz*M_xzz + D_xyyyz*M_yyy + D_xyyz*M_yy + D_xyyzz*M_yyz + &
      D_xyz*M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xz*M_0 + D_xzz*M_z + &
      D_xzzz*M_zz + D_xzzzz*M_zzz
    D_yyyyy = v40*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = v37*v41
    L_yyyy  = D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    L_yyy   = D_xxyyy*M_xx + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyy*M_yy + D_yyyyz*M_yz + D_yyyz*M_z + D_yyyzz* &
      M_zz
    L_yyyz  = D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    L_yy    = D_xxxyy*M_xxx + D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyz*M_xxz + D_xyy*M_x &
      + D_xyyy*M_xy + D_xyyyy*M_xyy + D_xyyyz*M_xyz + D_xyyz*M_xz + &
      D_xyyzz*M_xzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy* &
      M_yyy + D_yyyyz*M_yyz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz
    L_yyz   = D_xxyyz*M_xx + D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyz*M_yy + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    L_y     = D_xxxxy*M_xxxx + D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyz*M_xxxz + D_xxy* &
      M_xx + D_xxyy*M_xxy + D_xxyyy*M_xxyy + D_xxyyz*M_xxyz + D_xxyz* &
      M_xxz + D_xxyzz*M_xxzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyz*M_xyyz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + &
      D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + D_y*M_0 + D_yy*M_y + &
      D_yyy*M_yy + D_yyyy*M_yyy + D_yyyyy*M_yyyy + D_yyyyz*M_yyyz + &
      D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyz*M_yz + D_yyzz*M_yzz + &
      D_yyzzz*M_yzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + D_yzzzz* &
      M_zzzz
    L_yz    = D_xxxyz*M_xxx + D_xxyyz*M_xxy + D_xxyz*M_xx + D_xxyzz*M_xxz + D_xyyyz* &
      M_xyy + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + &
      D_xyzzz*M_xzz + D_yyyyz*M_yyy + D_yyyz*M_yy + D_yyyzz*M_yyz + &
      D_yyz*M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yz*M_0 + D_yzz*M_z + &
      D_yzzz*M_zz + D_yzzzz*M_zzz
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + D_xxxy*M_xxxy + &
      D_xxxyy*M_xxxyy + D_xxxyz*M_xxxyz + D_xxxz*M_xxxz + D_xxxzz* &
      M_xxxzz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyyy*M_xxyyy + D_xxyyz &
      *M_xxyyz + D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxz*M_xxz + D_xxzz &
      *M_xxzz + D_xxzzz*M_xxzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy* &
      M_xyyy + D_xyyyy*M_xyyyy + D_xyyyz*M_xyyyz + D_xyyz*M_xyyz + &
      D_xyyzz*M_xyyzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz + &
      D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + D_xzzzz*M_xzzzz + D_y* &
      M_y + D_yy*M_yy + D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + &
      D_yyyyz*M_yyyyz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + D_yz*M_yz + D_yzz*M_yzz + &
      D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_z*M_z + D_zz*M_zz + D_zzz* &
      M_zzz + D_zzzz*M_zzzz + D_zzzzz*M_zzzzz
    L_z     = D_xxxxz*M_xxxx + D_xxxyz*M_xxxy + D_xxxz*M_xxx + D_xxxzz*M_xxxz + &
      D_xxyyz*M_xxyy + D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxz*M_xx + &
      D_xxzz*M_xxz + D_xxzzz*M_xxzz + D_xyyyz*M_xyyy + D_xyyz*M_xyy + &
      D_xyyzz*M_xyyz + D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_yyyyz* &
      M_yyyy + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyz*M_yy + D_yyzz* &
      M_yyz + D_yyzzz*M_yyzz + D_yz*M_y + D_yzz*M_yz + D_yzzz*M_yzz + &
      D_yzzzz*M_yzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + &
      D_zzzzz*M_zzzz
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  L_x                 
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
#undef  L_xxxxx             
#undef  M_xxzz              
#undef  M_xyyy              
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xyyz              
#undef  L_xxxyy             
#undef  M_xyzz              
#undef  L_xxxyz             
#undef  M_xzzz              
#undef  M_yyyy              
#undef  L_xxyyy             
#undef  M_yyyz              
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  M_yyzz              
#undef  M_yzzz              
#undef  L_xyyyz             
#undef  M_zzzz              
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  M_xxxyz             
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  M_xxzzz             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  M_xyyzz             
#undef  M_xyzzz             
#undef  M_xzzzz             
#undef  M_yyyyy             
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  M_zzzzz             
    end subroutine mom_es_M2L2
    
! OPS  172*ADD + 2*DIV + 230*MUL + 21*NEG + POW = 426  (899 before optimization)
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
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz
#define Phi_0                Phi(1:2,0)
#define y                    r(1:2,2)
#define x                    r(1:2,1)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define L_x                  L(1:2,1)
#define Phi_x                Phi(1:2,1)
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
#define L_yy                 L(1:2,7)
#define Phi_yy               Phi(1:2,7)
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
#define L_xxxxx              L(1:2,25)
#define L_xxxxy              L(1:2,26)
#define L_xxxxz              L(1:2,27)
#define L_xxxyy              L(1:2,28)
#define L_xxxyz              L(1:2,29)
#define L_xxyyy              L(1:2,30)
#define L_xxyyz              L(1:2,31)
#define L_xyyyy              L(1:2,32)
#define L_xyyyz              L(1:2,33)
#define L_yyyyy              L(1:2,34)
#define L_yyyyz              L(1:2,35)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0      = L_xxz*z
    v10     = L_xxyy + L_xxyyz*z
    v14     = L_xxxx + L_xxxxy*y + L_xxxxz*z
    v15     = 2.0d0*z
    v18     = 0.5d0*x
    v19     = 2.0d0*y
    v20     = L_xxxy + L_xxxyz*z
    v22     = L_xyz*z
    v26     = L_xyyy + L_xyyyz*z
    v28     = L_xxxyy*y + v20
    v32     = L_xz*z
    v45     = 0.166666666666667d0*x
    v58     = L_yyz*z
    v62     = L_yyyy + L_yyyyz*z
    v63     = 0.5d0*y
    v65     = L_yz*z
    v71     = 0.166666666666667d0*y
    L_zz    = -(L_xx + L_yy)
    L_xzz   = -(L_xxx + L_xyy)
    v47     = L_xzz*z
    L_yzz   = -(L_xxy + L_yyy)
    v73     = L_yzz*z
    L_zzz   = -(L_xxz + L_yyz)
    L_xxzz  = -(L_xxxx + L_xxyy)
    L_xyzz  = -(L_xxxy + L_xyyy)
    L_xzzz  = -(L_xxxz + L_xyyz)
    L_yyzz  = -(L_xxyy + L_yyyy)
    L_yzzz  = -(L_xxyz + L_yyyz)
    L_zzzz  = -(L_xxzz + L_yyzz)
    L_xxxzz = -(L_xxxxx + L_xxxyy)
    v53     = L_xxxz + L_xxxyz*y + L_xxxzz*z
    L_xxyzz = -(L_xxxxy + L_xxyyy)
    v56     = L_xxyz + L_xxyzz*z
    L_xxzzz = -(L_xxxxz + L_xxyyz)
    L_xyyzz = -(L_xxxyy + L_xyyyy)
    v51     = L_xyyz + L_xyyzz*z
    L_xyzzz = -(L_xxxyz + L_xyyyz)
    L_xzzzz = -(L_xxxzz + L_xyyzz)
    L_yyyzz = -(L_xxyyy + L_yyyyy)
    v76     = L_yyyz + L_yyyzz*z
    L_yyzzz = -(L_xxyyz + L_yyyyz)
    L_yzzzz = -(L_xxyzz + L_yyyzz)
    L_zzzzz = -(L_xxzzz + L_yyzzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v12     = a2
    v13     = 0.5d0*v12
    v44     = 0.25d0*v12
    a3      = a1*a2
    v1      = a3
    v2      = 0.166666666666667d0*v1
    a4      = a2*a2
    v33     = 0.0416666666666667d0*a4
    a5      = a2*a3
    b2      = b1*b1
    v9      = b2
    v11     = v10*v9
    v27     = v26*v9
    v61     = 0.5d0*v9
    v70     = 0.25d0*v9
    v52     = v51*v9
    b3      = b1*b2
    v3      = b3
    v4      = L_xxyyy*v3
    v23     = L_xyyyy*v3
    v40     = 0.166666666666667d0*v3
    v48     = L_xyyyz*v3
    b4      = b2*b2
    v34     = b4
    v35     = L_xyyyy*v34
    v66     = 0.0416666666666667d0*v34
    b5      = b2*b3
    c2      = c1*c1
    v5      = c2
    v78     = 0.5d0*v5
    v36     = L_xzz*v5
    v67     = L_yzz*v5
    v6      = L_xxzz*v5
    v24     = L_xyzz*v5
    v49     = L_xzzz*v5
    v59     = L_yyzz*v5
    v74     = L_yzzz*v5
    v21     = 2.0d0*L_xxx + L_xxxyy*v9 + L_xxxz*v15 + L_xxxzz*v5 + v19*v20
    v16     = 2.0d0*L_xxy + L_xxyz*v15 + L_xxyzz*v5
    v17     = v16*y
    v31     = v16 + L_xxyyy*v9 + v10*v19
    v57     = L_xxyyz*v9 + 2.0d0*L_xxz + L_xxzz*v15 + L_xxzzz*v5 + v19*v56
    v29     = 2.0d0*L_xyy + L_xyyz*v15 + L_xyyzz*v5
    v30     = v29*y
    v41     = v29*v9
    v54     = 2.0d0*L_xyz + L_xyzz*v15 + L_xyzzz*v5
    v55     = v54*y
    v64     = 2.0d0*L_yyy + L_yyyz*v15 + L_yyyzz*v5
    v77     = 2.0d0*L_yyz + L_yyzz*v15 + L_yyzzz*v5
    h       = v12 + v5 + v9
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
    v7      = c3
    v79     = 0.166666666666667d0*v7
    v37     = L_xzzz*v7
    v68     = L_yzzz*v7
    v8      = L_xxzzz*v7
    v46     = v4 + v8 + 3.0d0*(2.0d0*L_xx + 2.0d0*v0 + v11 + v17 + v6)
    Phi_xx  = 0.166666666666667d0*(v4 + v8 + 3.0d0*(v11 + v17 + v6)) + L_xx + L_xxxxx* &
      v2 + v0 + v13*v14 + v18*v21
    v25     = L_xyzzz*v7
    v42     = v25 + 3.0d0*(2.0d0*L_xy + 2.0d0*v22 + v24)
    v43     = v42*y
    Phi_xy  = 0.166666666666667d0*(v23 + v25 + 3.0d0*(v24 + v27 + v30)) + L_xxxxy*v2 + &
      L_xy + v13*v28 + v18*v31 + v22
    v50     = L_xzzzz*v7
    Phi_xz  = 0.166666666666667d0*(v48 + v50 + 3.0d0*(v49 + v52 + v55)) + L_xxxxz*v2 + &
      L_xz + v13*v53 + v18*v57 + v47
    v60     = L_yyzzz*v7
    v72     = v60 + 3.0d0*(2.0d0*L_yy + 2.0d0*v58 + v59)
    Phi_yy  = 0.166666666666667d0*(3.0d0*v59 + v60) + L_xxxyy*v2 + L_yy + L_yyyyy*v40 &
      + v13*(L_xxyyy*y + v10) + v18*(L_xyyyy*v9 + v19*v26 + v29) + v58 &
      + v61*v62 + v63*v64
    Phi_zz  = -(Phi_xx + Phi_yy)
    v75     = L_yzzzz*v7
    Phi_yz  = 0.166666666666667d0*(3.0d0*v74 + v75) + L_xxxyz*v2 + L_yyyyz*v40 + L_yz &
      + v13*(L_xxyyz*y + v56) + v18*(L_xyyyz*v9 + v19*v51 + v54) + v61* &
      v76 + v63*v77 + v73
    c4      = c2*c2
    v38     = c4
    v80     = 0.0416666666666667d0*v38
    v39     = L_xzzzz*v38
    Phi_x   = 0.0416666666666667d0*(v35 + 12.0d0*v36 + v39 + 6.0d0*v41 + 4.0d0*(v37 + &
      v43)) + L_x + L_xxxxx*v33 + v14*v2 + v21*v44 + v26*v40 + v32 + &
      v45*v46
    v69     = L_yzzzz*v38
    Phi_y   = 0.0416666666666667d0*(12.0d0*v67 + 4.0d0*v68 + v69) + L_xxxxy*v33 + L_y &
      + L_yyyyy*v66 + v2*v28 + v31*v44 + v40*v62 + v45*(v23 + 3.0d0*v27 &
      + 3.0d0*v30 + v42) + v64*v70 + v65 + v71*v72
    Phi_z   = L_z + L_xxxxz*v33 + L_yyyyz*v66 + L_zz*z + L_zzz*v78 + L_zzzz*v79 + &
      L_zzzzz*v80 + v2*v53 + v40*v76 + v44*v57 + v45*(6.0d0*L_xz + &
      6.0d0*v47 + v48 + 3.0d0*v49 + v50 + 3.0d0*v52 + 3.0d0*v55) + v70* &
      v77 + v71*(6.0d0*L_yz + 6.0d0*v73 + 3.0d0*v74 + v75)
    c5      = c2*c3
    Phi_0   = 0.00833333333333333d0*(L_xxxxx*a5 + L_yyyyy*b5 + L_zzzzz*c5 + 5.0d0*(x*( &
      24.0d0*L_x + 4.0d0*v26*v3 + 24.0d0*v32 + v35 + 12.0d0*v36 + 4.0d0 &
      *v37 + v39 + 6.0d0*v41 + 4.0d0*v43) + y*(24.0d0*L_y + 24.0d0*v65 &
      + 12.0d0*v67 + 4.0d0*v68 + v69)) + 10.0d0*(v1*v21 + v12*v46 + v3* &
      v64 + v72*v9)) + L_0 + L_z*z + L_zz*v78 + L_zzz*v79 + L_zzzz*v80 &
      + v14*v33 + v62*v66
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  Phi_0               
#undef  y                   
#undef  x                   
#undef  L_0                 
#undef  z                   
#undef  L_x                 
#undef  Phi_x               
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
#undef  L_yy                
#undef  Phi_yy              
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
    
! OPS  227*ADD + 2*DIV + 270*MUL + 20*NEG + POW = 520  (1120 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v11, v12, v13, v14, v15, v16, v17,&
                v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27, v28,&
                v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz
#define Ls_0                 Ls(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define Ls_x                 Ls(1:2,1)
#define Ls_y                 Ls(1:2,2)
#define L_y                  L(1:2,2)
#define L_z                  L(1:2,3)
#define Ls_z                 Ls(1:2,3)
#define L_xx                 L(1:2,4)
#define Ls_xx                Ls(1:2,4)
#define Ls_xy                Ls(1:2,5)
#define L_xy                 L(1:2,5)
#define Ls_xz                Ls(1:2,6)
#define L_xz                 L(1:2,6)
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
#define L_xxxx               L(1:2,16)
#define Ls_xxxx              Ls(1:2,16)
#define Ls_xxxy              Ls(1:2,17)
#define L_xxxy               L(1:2,17)
#define Ls_xxxz              Ls(1:2,18)
#define L_xxxz               L(1:2,18)
#define Ls_xxyy              Ls(1:2,19)
#define L_xxyy               L(1:2,19)
#define Ls_xxyz              Ls(1:2,20)
#define L_xxyz               L(1:2,20)
#define L_xyyy               L(1:2,21)
#define Ls_xyyy              Ls(1:2,21)
#define L_xyyz               L(1:2,22)
#define Ls_xyyz              Ls(1:2,22)
#define Ls_yyyy              Ls(1:2,23)
#define L_yyyy               L(1:2,23)
#define L_yyyz               L(1:2,24)
#define Ls_yyyz              Ls(1:2,24)
#define L_xxxxx              L(1:2,25)
#define Ls_xxxxx             Ls(1:2,25)
#define Ls_xxxxy             Ls(1:2,26)
#define L_xxxxy              L(1:2,26)
#define L_xxxxz              L(1:2,27)
#define Ls_xxxxz             Ls(1:2,27)
#define Ls_xxxyy             Ls(1:2,28)
#define L_xxxyy              L(1:2,28)
#define Ls_xxxyz             Ls(1:2,29)
#define L_xxxyz              L(1:2,29)
#define L_xxyyy              L(1:2,30)
#define Ls_xxyyy             Ls(1:2,30)
#define L_xxyyz              L(1:2,31)
#define Ls_xxyyz             Ls(1:2,31)
#define Ls_xyyyy             Ls(1:2,32)
#define L_xyyyy              L(1:2,32)
#define Ls_xyyyz             Ls(1:2,33)
#define L_xyyyz              L(1:2,33)
#define Ls_yyyyy             Ls(1:2,34)
#define L_yyyyy              L(1:2,34)
#define Ls_yyyyz             Ls(1:2,35)
#define L_yyyyz              L(1:2,35)
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
    v34      = 0.5d0*x
    v40      = L_xyyz*z
    v43      = v5*y
    v46      = L_xyz*z
    v57      = L_xz*z
    v70      = 0.166666666666667d0*x
    v80      = L_yyyz*z
    v83      = L_yyz*z
    v86      = 0.5d0*y
    v90      = L_yz*z
    v96      = 0.166666666666667d0*y
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
    v73      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v98      = L_yzz*z
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    v36      = L_xxzz*z
    L_xyzz   = -(L_xxxy + L_xyyy)
    v53      = L_xyzz*z
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    v88      = L_yyzz*z
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    v16      = L_xxxz + L_xxxyz*y + L_xxxzz*z
    Ls_xxxz  = L_xxxxz*x + v16
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    v21      = L_xxyz + L_xxyzz*z
    v22      = L_xxyyz*y + v21
    v39      = v21*y
    Ls_xxyz  = L_xxxyz*x + v22
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    v44      = L_xyyz + L_xyyzz*z
    v45      = L_xyyyz*y + v44
    v56      = v44*y
    Ls_xyyz  = L_xxyyz*x + v45
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    v82      = L_yyyz + L_yyyzz*z
    Ls_yyyz  = v82 + L_xyyyz*x + L_yyyyz*y
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v9       = a2
    v10      = 0.5d0*v9
    v69      = 0.25d0*v9
    a3       = a1*a2
    v24      = a3
    v25      = 0.166666666666667d0*v24
    a4       = a2*a2
    v58      = 0.0416666666666667d0*a4
    a5       = a2*a3
    b2       = b1*b1
    v11      = b2
    v12      = L_xxxyy*v11
    v18      = L_xxyyy*v11
    v31      = 0.5d0*v11
    v37      = L_xxyyz*v11
    v41      = L_xyyyy*v11
    v54      = L_xyyyz*v11
    v71      = 3.0d0*v11
    v95      = 0.25d0*v11
    b3       = b1*b2
    v26      = b3
    v27      = L_xxyyy*v26
    v47      = L_xyyyy*v26
    v65      = 0.166666666666667d0*v26
    v74      = L_xyyyz*v26
    b4       = b2*b2
    v59      = b4
    v60      = L_xyyyy*v59
    v91      = 0.0416666666666667d0*v59
    b5       = b2*b3
    c2       = c1*c1
    v13      = c2
    v102     = 0.5d0*v13
    v61      = L_xzz*v13
    v92      = L_yzz*v13
    v28      = L_xxzz*v13
    v48      = L_xyzz*v13
    v75      = L_xzzz*v13
    v84      = L_yyzz*v13
    v99      = L_yzzz*v13
    v14      = L_xxxzz*v13
    v35      = v12 + v14 + 2.0d0*(L_xxx + v15 + v8)
    Ls_xxx   = 0.5d0*(v12 + v14) + L_xxx + L_xxxxx*v10 + v0*x + v15 + v8
    v19      = L_xxyzz*v13
    v32      = v19 + 2.0d0*(L_xxy + v17)
    v33      = v32*y
    v52      = 2.0d0*v20 + v18 + v32
    Ls_xxy   = 0.5d0*(v18 + v19) + L_xxxxy*v10 + L_xxy + v17 + v2*x + v20
    v38      = L_xxzzz*v13
    v79      = v37 + v38 + 2.0d0*(L_xxz + v36 + v39)
    Ls_xxz   = 0.5d0*(v37 + v38) + L_xxxxz*v10 + L_xxz + v16*x + v36 + v39
    v42      = L_xyyzz*v13
    v50      = v42 + 2.0d0*(L_xyy + v40)
    v51      = v50*y
    v66      = v11*v50
    Ls_xyy   = 0.5d0*(v41 + v42) + L_xxxyy*v10 + L_xyy + v4*x + v40 + v43
    v55      = L_xyzzz*v13
    v77      = v55 + 2.0d0*(L_xyz + v53)
    v78      = v77*y
    Ls_xyz   = 0.5d0*(v54 + v55) + L_xxxyz*v10 + L_xyz + v22*x + v53 + v56
    v81      = L_yyyzz*v13
    v87      = v81 + 2.0d0*(L_yyy + v80)
    Ls_yyy   = 0.5d0*v81 + L_xxyyy*v10 + L_yyy + L_yyyyy*v31 + v6*x + v7*y + v80
    v89      = L_yyzzz*v13
    v101     = v89 + 2.0d0*(L_yyz + v88)
    Ls_yyz   = 0.5d0*v89 + L_xxyyz*v10 + L_yyyyz*v31 + L_yyz + v45*x + v82*y + v88
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
    v29      = c3
    v103     = 0.166666666666667d0*v29
    v62      = L_xzzz*v29
    v93      = L_yzzz*v29
    v30      = L_xxzzz*v29
    v72      = v27 + v30 + v3*v71 + 6.0d0*(L_xx + v23) + 3.0d0*(v28 + v33)
    Ls_xx    = 0.166666666666667d0*(v27 + v30 + 3.0d0*(v28 + v33)) + L_xx + L_xxxxx*v25 &
      + v0*v10 + v23 + v3*v31 + v34*v35
    v49      = L_xyzzz*v29
    v67      = v49 + 3.0d0*(2.0d0*L_xy + 2.0d0*v46 + v48)
    v68      = v67*y
    Ls_xy    = 0.166666666666667d0*(v47 + v49 + 3.0d0*(v48 + v51)) + L_xxxxy*v25 + L_xy &
      + v10*v2 + v31*v5 + v34*v52 + v46
    v76      = L_xzzzz*v29
    Ls_xz    = 0.166666666666667d0*(v74 + v76 + 3.0d0*(v75 + v78)) + L_xxxxz*v25 + L_xz &
      + v10*v16 + v31*v44 + v34*v79 + v73
    v85      = L_yyzzz*v29
    v97      = v85 + 3.0d0*(2.0d0*L_yy + 2.0d0*v83 + v84)
    Ls_yy    = 0.166666666666667d0*(3.0d0*v84 + v85) + L_xxxyy*v25 + L_yy + L_yyyyy*v65 &
      + v10*v4 + v31*v7 + v34*(v41 + 2.0d0*v43 + v50) + v83 + v86*v87
    v100     = L_yzzzz*v29
    Ls_yz    = 0.166666666666667d0*(v100 + 3.0d0*v99) + L_xxxyz*v25 + L_yyyyz*v65 + &
      L_yz + v10*v22 + v101*v86 + v31*v82 + v34*(v54 + 2.0d0*v56 + v77 &
      ) + v98
    c4       = c2*c2
    v63      = c4
    v104     = 0.0416666666666667d0*v63
    v64      = L_xzzzz*v63
    Ls_x     = 0.0416666666666667d0*(v60 + 12.0d0*v61 + v64 + 6.0d0*v66 + 4.0d0*(v62 + &
      v68)) + L_x + L_xxxxx*v58 + v0*v25 + v35*v69 + v5*v65 + v57 + v70 &
      *v72
    v94      = L_yzzzz*v63
    Ls_y     = 0.0416666666666667d0*(12.0d0*v92 + 4.0d0*v93 + v94) + L_xxxxy*v58 + L_y &
      + L_yyyyy*v91 + v2*v25 + v52*v69 + v65*v7 + v70*(v47 + v5*v71 + &
      3.0d0*v51 + v67) + v87*v95 + v90 + v96*v97
    Ls_z     = L_z + L_xxxxz*v58 + L_yyyyz*v91 + L_zz*z + L_zzz*v102 + L_zzzz*v103 + &
      L_zzzzz*v104 + v101*v95 + v16*v25 + v65*v82 + v69*v79 + v70*( &
      6.0d0*L_xz + v44*v71 + 6.0d0*v73 + v74 + 3.0d0*v75 + v76 + 3.0d0* &
      v78) + v96*(6.0d0*L_yz + v100 + 6.0d0*v98 + 3.0d0*v99)
    c5       = c2*c3
    Ls_0     = 0.00833333333333333d0*(L_xxxxx*a5 + L_yyyyy*b5 + L_zzzzz*c5 + 5.0d0*(x*( &
      24.0d0*L_x + 4.0d0*v26*v5 + 24.0d0*v57 + v60 + 12.0d0*v61 + 4.0d0 &
      *v62 + v64 + 6.0d0*v66 + 4.0d0*v68) + y*(24.0d0*L_y + 24.0d0*v90 &
      + 12.0d0*v92 + 4.0d0*v93 + v94)) + 10.0d0*(v11*v97 + v24*v35 + &
      v26*v87 + v72*v9)) + L_0 + L_z*z + L_zz*v102 + L_zzz*v103 + &
      L_zzzz*v104 + v0*v58 + v7*v91
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  Ls_0                
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  Ls_x                
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
#undef  Ls_xxxz             
#undef  L_xxxz              
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
#undef  Ls_xxxxy            
#undef  L_xxxxy             
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
