!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-04 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom6
use types
implicit none
#if FMM_EXPANSION_ORDER==6
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
        
    
! OPS  31*ADD + 79*MUL + 14*NEG + 2*SUB = 126  (361 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v4, v5, v6, v7, v8, v9, h, u
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
#define M_xxxxx              M(22)
#define M_xxxxy              M(23)
#define M_xxxxz              M(24)
#define M_xxxyy              M(25)
#define M_xxxyz              M(26)
#define M_xxyyy              M(27)
#define M_xxyyz              M(28)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define M_yyyyy              M(31)
#define M_yyyyz              M(32)
    v0      = W*x
    v1      = v0*y
    v2      = v0*z
    v3      = W*y
    v4      = v3*z
    v5      = v1*z
    v16     = W*z
    M_0     = W
    M_xy    = v1
    M_xz    = v2
    M_yz    = v4
    M_xyz   = v5
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v6      = a2
    a3      = a1*a2
    a4      = a2*a2
    v18     = a4
    a5      = a2*a3
    a6      = a3*a3
    b2      = b1*b1
    v7      = b2
    v8      = v6 + v7
    v24     = v6*v7
    b3      = b1*b2
    b4      = b2*b2
    v28     = b4
    b5      = b2*b3
    b6      = b3*b3
    c2      = c1*c1
    h       = c2 + v8
    v9      = 0.333333333333333d0*h
    v10     = -v9
    v11     = v10 + v6
    v12     = v10 + v7
    v13     = -0.6d0*h
    v14     = -0.2d0*h
    v15     = v14 + v6
    v17     = v14 + v7
    v19     = h*h
    v20     = 0.0857142857142857d0*v19
    v21     = h*v6
    v22     = -0.428571428571429d0*h
    v23     = v22 + v6
    v25     = 0.142857142857143d0*h
    v26     = -v25
    v27     = v22 + v7
    v29     = h*v7
    v30     = 0.238095238095238d0*v19
    v31     = 0.0476190476190476d0*v19
    v32     = 0.333333333333333d0*(-2.0d0*v21) + v18 + v31
    v33     = v24 + v31
    v35     = -v33
    v34     = 0.333333333333333d0*(-2.0d0*v29) + v28 + v31
    M_xx    = W*v11
    M_yy    = W*v12
    M_xxx   = v0*(v13 + v6)
    M_xxy   = v15*v3
    M_xxz   = v15*v16
    M_xyy   = v0*v17
    M_yyy   = v3*(v13 + v7)
    M_yyz   = v16*v17
    M_xxxx  = W*(0.142857142857143d0*(-6.0d0*v21) + v18 + v20)
    M_xxxy  = v1*v23
    M_xxxz  = v2*v23
    M_xxyy  = W*(0.0285714285714286d0*v19 + v24 - v25*v8)
    M_xxyz  = v4*(v26 + v6)
    M_xyyy  = v1*v27
    M_xyyz  = v2*(v26 + v7)
    M_yyyy  = W*(0.142857142857143d0*(-6.0d0*v29) + v20 + v28)
    M_yyyz  = v27*v4
    M_xxxxx = v0*(0.111111111111111d0*(-10.0d0*v21) + v18 + v30)
    M_xxxxy = v3*v32
    M_xxxxz = v16*v32
    M_xxxyy = -v0*(0.111111111111111d0*v21 + v35 + v7*v9)
    M_xxxyz = v11*v5
    M_xxyyy = -v3*(0.111111111111111d0*v29 + v35 + v6*v9)
    M_xxyyz = v16*(v24 + 0.0158730158730159d0*(-7.0d0*h*v8 + v19))
    M_xyyyy = v0*v34
    M_xyyyz = v12*v5
    M_yyyyy = v3*(0.111111111111111d0*(-10.0d0*v29) + v28 + v30)
    M_yyyyz = v16*v34
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
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  M_xxxyz             
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  M_yyyyz             
    end subroutine mom_es_P2M
    
! OPS  397*ADD + 519*MUL + 44*NEG + 69*SUB = 1029  (1719 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v19, v2, v20, v21, v22, v23, v24, v25,&
                v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36,&
                v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47,&
                v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58,&
                v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7,&
                v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80,&
                v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91,&
                v92, v93, v94, v95, v96, v97, v98, v99, h, u, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xyyy, S_xyyz, S_yyyy, S_yyyz, S_xxxxx,&
                S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy,&
                S_xyyyz, S_yyyyy, S_yyyyz
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define z                    r(3)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define Ms_xy                Ms(2)
#define M_xy                 M(2)
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
#define Ms_xyy               Ms(9)
#define M_xyy                M(9)
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
#define M_xxyy               M(16)
#define Ms_xxyy              Ms(16)
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
#define Ms_xxxxx             Ms(22)
#define M_xxxxx              M(22)
#define Ms_xxxxy             Ms(23)
#define M_xxxxy              M(23)
#define Ms_xxxxz             Ms(24)
#define M_xxxxz              M(24)
#define Ms_xxxyy             Ms(25)
#define M_xxxyy              M(25)
#define M_xxxyz              M(26)
#define Ms_xxxyz             Ms(26)
#define Ms_xxyyy             Ms(27)
#define M_xxyyy              M(27)
#define Ms_xxyyz             Ms(28)
#define M_xxyyz              M(28)
#define Ms_xyyyy             Ms(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define Ms_xyyyz             Ms(30)
#define M_yyyyy              M(31)
#define Ms_yyyyy             Ms(31)
#define Ms_yyyyz             Ms(32)
#define M_yyyyz              M(32)
    v0       = x*y
    v1       = x*z
    v2       = y*z
    v3       = v0*z
    v11      = M_xx*x
    v12      = M_xy*y
    v13      = M_xz*z
    v16      = M_xy*x
    v17      = M_yy*y
    v18      = M_yz*z
    v19      = M_xx*z
    v20      = M_xz*x
    v21      = M_yy*z
    v22      = M_yz*y
    v33      = M_xxx*x
    v34      = 1.71428571428571d0*y
    v35      = M_xxy*v34
    v36      = M_xxz*z
    v42      = 0.857142857142857d0*M_xyz
    v45      = M_xxy*x
    v48      = M_xyy*y
    v50      = 3.0d0*M_xx
    v51      = M_xxx*z
    v52      = M_xxz*x
    v54      = M_xyy*z
    v55      = 3.0d0*M_xz
    v61      = 1.71428571428571d0*x
    v62      = M_xyy*v61
    v63      = M_yyy*y
    v64      = M_yyz*z
    v67      = M_xxy*z
    v70      = M_yyy*z
    v71      = M_yyz*y
    v77      = 3.0d0*M_yz
    v83      = M_xxxx*x
    v84      = M_xxxy*y
    v85      = M_xxxz*z
    v87      = M_xxyy*x
    v97      = M_yyyy*x
    v108     = M_xxxx*y
    v109     = M_xxxy*x
    v112     = M_xxyy*y
    v113     = M_xxyz*z
    v124     = M_yyyy*y
    v128     = M_xxyy*z
    v137     = M_xxxx*z
    v138     = M_xxxz*x
    v140     = M_xxyz*y
    v149     = M_yyyy*z
    v157     = M_xyyy*y
    v158     = M_xyyz*z
    v163     = M_xxxy*z
    v164     = M_xxyz*x
    v168     = M_xyyy*z
    v169     = M_xyyz*y
    v170     = 3.0d0*M_xyz
    v176     = M_xyyy*x
    v177     = M_yyyz*z
    v178     = M_xyyz*x
    v179     = M_yyyz*y
    Ms_0     = M_0
    M_zz     = -(M_xx + M_yy)
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    M_xxzz   = -(M_xxxx + M_xxyy)
    v89      = M_xxzz*x
    v102     = M_xxzz*y
    v129     = M_xxzz*z
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v98      = M_yyzz*x
    v103     = M_yyzz*y
    v132     = M_yyzz*z
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    v181     = M_xxxzz + M_xyyzz
    v155     = -0.0476190476190476d0*(M_xxxxx + v181 + v89 + v98)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -v181
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v182     = M_xxyzz + M_yyyzz
    v104     = -0.0476190476190476d0*(M_yyyyy + v102 + v103 + v182)
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    M_yzzzz  = -v182
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    S_0      = 1
    S_x      = x
    S_y      = y
    S_z      = z
    S_xy     = v0
    v29      = M_xy*S_xy
    v44      = M_xx*S_xy
    v49      = M_yy*S_xy
    v58      = M_yz*S_xy
    v69      = M_xz*S_xy
    v86      = M_xxy*S_xy
    v107     = M_xxx*S_xy
    v117     = M_xyy*S_xy
    v131     = M_xyz*S_xy
    v160     = M_yyy*S_xy
    v165     = M_xxz*S_xy
    v173     = M_yyz*S_xy
    Ms_xy    = M_0*S_xy + M_xy
    S_xz     = v1
    v37      = M_xz*S_xz
    v57      = M_yy*S_xz
    v68      = M_xy*S_xz
    v88      = M_xxz*S_xz
    v118     = M_xyz*S_xz
    v136     = M_xxx*S_xz
    v143     = M_xyy*S_xz
    v161     = M_yyz*S_xz
    v172     = M_yyy*S_xz
    Ms_xz    = M_0*S_xz + M_xz
    S_yz     = v2
    v39      = M_yz*S_yz
    v43      = -0.142857142857143d0*(7.0d0*v42*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v53      = M_xy*S_yz
    v66      = M_xx*S_yz
    v76      = 3.0d0*S_yz
    v93      = M_xyz*S_yz
    v114     = M_xxz*S_yz
    v125     = M_yyz*S_yz
    v139     = M_xxy*S_yz
    v148     = M_yyy*S_yz
    v162     = M_xxx*S_yz
    Ms_yz    = M_0*S_yz + M_yz
    S_xyz    = v3
    v99      = M_yz*S_xyz
    v119     = M_xz*S_xyz
    v130     = M_xy*S_xyz
    v133     = 0.0476190476190476d0*(18.0d0*v128 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v129 + 48.0d0*v130 + 48.0d0*v131 + 5.0d0*v132))
    Ms_xyz   = M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v4       = a2
    a3       = a1*a2
    a4       = a2*a2
    v24      = a4
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v5       = b2
    v60      = v4*v5
    b3       = b1*b2
    b4       = b2*b2
    v74      = b4
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v4 + v5
    v6       = 0.333333333333333d0*h
    v7       = -v6
    v8       = v4 + v7
    v9       = v5 + v7
    v10      = -0.6d0*h
    v14      = -0.2d0*h
    v15      = v14 + v4
    v23      = v14 + v5
    v25      = h*h
    v26      = 0.0857142857142857d0*v25
    v27      = h*v4
    v40      = -0.428571428571429d0*h
    v41      = v4 + v40
    v59      = 0.142857142857143d0*h
    v65      = -v59
    v73      = v40 + v5
    v75      = h*v5
    v78      = 0.238095238095238d0*v25
    v100     = 0.0476190476190476d0*v25
    v101     = 0.333333333333333d0*(-2.0d0*v27) + v100 + v24
    v154     = -0.111111111111111d0*v27
    v175     = v60 + 0.111111111111111d0*(-v75)
    v180     = 0.333333333333333d0*(-2.0d0*v75) + v100 + v74
    S_xx     = v8
    v30      = M_yy*S_xx
    v32      = M_xx*S_xx
    v46      = M_xy*S_xx
    v72      = M_yz*S_xx
    v81      = M_xxx*S_xx
    v91      = M_xyy*S_xx
    v110     = M_xxy*S_xx
    v122     = M_yyy*S_xx
    v141     = M_xxz*S_xx
    v150     = M_yyz*S_xx
    Ms_xx    = M_0*S_xx + M_xx
    S_yy     = v9
    v28      = M_xx*S_yy
    v31      = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v29 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v28 + 4.0d0*v30))
    v38      = M_yy*S_yy
    v47      = M_xy*S_yy
    v56      = M_xz*S_yy
    v82      = M_xxx*S_yy
    v92      = M_xyy*S_yy
    v111     = M_xxy*S_yy
    v123     = M_yyy*S_yy
    v142     = M_xxz*S_yy
    v151     = M_yyz*S_yy
    Ms_yy    = M_0*S_yy + M_yy
    S_zz     = -(S_xx + S_yy)
    S_xxx    = x*(v10 + v4)
    v79      = M_xx*S_xxx
    v95      = M_yy*S_xxx
    v115     = M_xy*S_xxx
    v144     = M_xz*S_xxx
    v174     = M_yz*S_xxx
    Ms_xxx   = 0.2d0*(9.0d0*v11 + 3.0d0*(-2.0d0*v12 - 2.0d0*v13)) + M_0*S_xxx + M_xxx
    S_xxy    = v15*y
    v90      = M_xy*S_xxy
    v105     = M_xx*S_xxy
    v120     = M_yy*S_xxy
    v152     = M_yz*S_xxy
    Ms_xxy   = 0.2d0*(8.0d0*v16 + 2.0d0*(-v17 - v18)) + M_0*S_xxy + M_xx*y + M_xxy
    S_xxz    = v15*z
    v94      = M_xz*S_xxz
    v126     = M_yz*S_xxz
    v134     = M_xx*S_xxz
    v146     = M_yy*S_xxz
    v166     = M_xy*S_xxz
    Ms_xxz   = M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v19 + 8.0d0*v20 + 2.0d0*(v21 - v22))
    S_xyy    = v23*x
    v80      = M_xx*S_xyy
    v96      = M_yy*S_xyy
    v116     = M_xy*S_xyy
    v145     = M_xz*S_xyy
    Ms_xyy   = 0.2d0*(8.0d0*v12 + 2.0d0*(-v11 - v13)) + M_0*S_xyy + M_xyy + M_yy*x
    S_xzz    = -(S_xxx + S_xyy)
    S_yyy    = y*(v10 + v5)
    v106     = M_xx*S_yyy
    v121     = M_yy*S_yyy
    v153     = M_yz*S_yyy
    v156     = M_xy*S_yyy
    v171     = M_xz*S_yyy
    Ms_yyy   = 0.2d0*(9.0d0*v17 + 3.0d0*(-2.0d0*v16 - 2.0d0*v18)) + M_0*S_yyy + M_yyy
    S_yyz    = v23*z
    v127     = M_yz*S_yyz
    v135     = M_xx*S_yyz
    v147     = M_yy*S_yyz
    v159     = M_xz*S_yyz
    v167     = M_xy*S_yyz
    Ms_yyz   = M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v21 + 8.0d0*v22 + 2.0d0*(v19 - v20))
    S_yzz    = -(S_xxy + S_yyy)
    S_zzz    = -(S_xxz + S_yyz)
    S_xxxx   = 0.142857142857143d0*(-6.0d0*v27) + v24 + v26
    Ms_xxxx  = M_0*S_xxxx + v31 - v35 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v32 + 80.0d0*v33 - 60.0d0*v36 - 96.0d0*v37 + &
      24.0d0*(v38 + v39))
    S_xxxy   = v0*v41
    Ms_xxxy  = M_0*S_xxxy + M_xxx*y + M_xxxy + v43 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v44 + 5.0d0*v45 + 5.0d0*v46 - 2.0d0*v47 - 2.0d0*v48 - 2.0d0*v49))
    S_xxxz   = v1*v41
    Ms_xxxz  = 0.142857142857143d0*(13.0d0*v51 + 15.0d0*v52 + 6.0d0*(-v53 + v54 + v56 + &
      v57 - v58)) + M_0*S_xxxz + M_xxxz + S_xx*v55 + S_xz*v50 - v42*y
    S_xxyy   = 0.0285714285714286d0*v25 - v4*v59 - v5*v59 + v60
    Ms_xxyy  = M_0*S_xxyy + v35 + v62 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v29 + 39.0d0*(v28 + v30) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v32 + 10.0d0*v33 + 10.0d0*v36 + 12.0d0*v37 + 12.0d0*v38 + &
      12.0d0*v39 + 10.0d0*v63 + 10.0d0*v64))
    S_xxyz   = v2*(v4 + v65)
    Ms_xxyz  = 0.142857142857143d0*(12.0d0*(v68 + v69) + 2.0d0*(v70 - v71) + 9.0d0*(v66 &
      + v67 + v72)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v61
    S_xyyy   = v0*v73
    Ms_xyyy  = M_0*S_xyyy + M_xyyy + M_yyy*x + v43 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v44 - 2.0d0*v45 - 2.0d0*v46 + 5.0d0*v47 + 5.0d0*v48 + 5.0d0*v49 &
      ))
    S_xyyz   = v1*(v5 + v65)
    Ms_xyyz  = 0.142857142857143d0*(2.0d0*(v51 - v52) + 12.0d0*(v53 + v58) + 9.0d0*(v54 &
      + v56 + v57)) + M_0*S_xyyz + M_xyyz + M_xyz*v34 + M_yyz*x
    S_yyyy   = 0.142857142857143d0*(-6.0d0*v75) + v26 + v74
    Ms_yyyy  = M_0*S_yyyy + v31 - v62 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v38 - 96.0d0*v39 + 80.0d0*v63 - 60.0d0*v64 + &
      24.0d0*(v32 + v37))
    S_yyyz   = v2*v73
    Ms_yyyz  = 0.142857142857143d0*(13.0d0*v70 + 15.0d0*v71 + 6.0d0*(v66 + v67 - v68 - &
      v69 + v72)) + M_0*S_yyyz + M_yy*v76 + M_yyyz + S_yy*v77 - v42*x
    S_xxxxx  = x*(0.111111111111111d0*(-10.0d0*v27) + v24 + v78)
    Ms_xxxxx = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v83 &
      - 30.0d0*(M_xxxyy + v87) + 330.0d0*(v79 + v81) - 140.0d0*(v84 + &
      v85) + 60.0d0*(v80 + v82 + v91 + v95) - 300.0d0*(v86 + v88 + v90 &
      + v94) + 120.0d0*(v92 + v93 + v96 + v99) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v89 + v97 + v98))
    S_xxxxy  = v101*y
    Ms_xxxxy = M_0*S_xxxxy + v104 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v108) + &
      78.0d0*(v105 + v110) + 4.0d0*(v106 + v122) + 56.0d0*(v107 + v109 &
      + v115) + 8.0d0*(v121 + v123 + v125 + v127) - (2.0d0*M_xxyyy + &
      24.0d0*v111 + 30.0d0*v112 + 28.0d0*v113 + 28.0d0*v114 + 48.0d0* &
      v116 + 48.0d0*v117 + 48.0d0*v118 + 48.0d0*v119 + 24.0d0*v120 + &
      v124 + 28.0d0*v126))
    S_xxxxz  = v101*z
    Ms_xxxxz = M_0*S_xxxxz + v133 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v137 &
      + 56.0d0*v138 + 106.0d0*(v134 + v141) + 4.0d0*(v135 + v150) + &
      104.0d0*(v136 + v144) + 32.0d0*(v142 + v146) + 48.0d0*(v143 + &
      v145) + 8.0d0*(v147 + v151) - (M_yyyyz + 36.0d0*v139 + 28.0d0* &
      v140 + 8.0d0*v148 + 5.0d0*v149 + 36.0d0*v152 + 8.0d0*v153))
    S_xxxyy  = x*(-v5*v6 + v100 + v154 + v60)
    Ms_xxxyy = M_0*S_xxxyy + v155 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v83 + &
      112.0d0*v84 - 14.0d0*v85 + 141.0d0*v87 - 3.0d0*(M_xyyyy + v97) + &
      159.0d0*(v80 + v91) + 75.0d0*(v82 + v95) + 276.0d0*(v86 + v90) - &
      18.0d0*(v79 + v81 + v88 + v94) - 60.0d0*(v92 + v93 + v96 + v99) - &
      42.0d0*(v156 + v157 + v158 + v159 + v160 + v161))
    S_xxxyz  = v3*v8
    Ms_xxxyz = 0.333333333333333d0*(9.0d0*M_xxy*S_xz + 5.0d0*(v162 + v163 + v174) + &
      7.0d0*(v164 + v165 + v166) + 2.0d0*(-v167 + v168 - v169 + v171 + &
      v172 - v173)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + S_xx*v170 + &
      S_xxy*v55 + S_xyz*v50
    S_xxyyy  = y*(-v4*v6 + v100 + v175)
    Ms_xxyyy = M_0*S_xxyyy + v104 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v112 &
      - 17.0d0*v124 + 112.0d0*v176 - 14.0d0*v177 - 3.0d0*(M_xxxxy + &
      v108) + 75.0d0*(v106 + v122) + 159.0d0*(v111 + v120) + 276.0d0*( &
      v116 + v117) - 60.0d0*(v105 + v110 + v118 + v119) - 18.0d0*(v121 &
      + v123 + v125 + v127) - 42.0d0*(v107 + v109 + v113 + v114 + v115 &
      + v126))
    S_xxyyz  = z*(0.0158730158730159d0*v25 + v154 + v175)
    Ms_xxyyz = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v130 + v131) + 9.0d0*(v137 + v149) + 112.0d0*(v140 + v178) + &
      6.0d0*(v136 + v144 + v148 + v153) + 132.0d0*(v139 + v143 + v145 + &
      v152) + 81.0d0*(v128 + v135 + v142 + v146 + v150) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v129 + 5.0d0*v132 + 6.0d0* &
      v134 + 14.0d0*v138 + 6.0d0*v141 + 6.0d0*v147 + 6.0d0*v151 + &
      14.0d0*v179))
    S_xyyyy  = v180*x
    Ms_xyyyy = M_0*S_xyyyy + v155 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v97) + &
      4.0d0*(v82 + v95) + 78.0d0*(v92 + v96) + 56.0d0*(v156 + v157 + &
      v160) + 8.0d0*(v79 + v81 + v88 + v94) - (2.0d0*M_xxxyy + 28.0d0* &
      v158 + 28.0d0*v159 + 28.0d0*v161 + 24.0d0*v80 + v83 + 48.0d0*v86 &
      + 30.0d0*v87 + 48.0d0*v90 + 24.0d0*v91 + 48.0d0*v93 + 48.0d0*v99 &
      ))
    S_xyyyz  = v3*v9
    Ms_xyyyz = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v167 + v169 + v173) + &
      5.0d0*(v168 + v171 + v172) + 2.0d0*(v162 + v163 - v164 - v165 - &
      v166 + v174)) + M_0*S_xyyyz + M_xyy*v76 + M_xyyyz + M_yyyz*x + &
      S_xyy*v77 + S_yy*v170
    S_yyyyy  = y*(0.111111111111111d0*(-10.0d0*v75) + v74 + v78)
    Ms_yyyyy = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v124 &
      - 30.0d0*(M_xxyyy + v112) + 330.0d0*(v121 + v123) - 140.0d0*(v176 &
      + v177) + 120.0d0*(v105 + v110 + v118 + v119) + 60.0d0*(v106 + &
      v111 + v120 + v122) - 300.0d0*(v116 + v117 + v125 + v127) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v102 + v103 + v108))
    S_yyyyz  = v180*z
    Ms_yyyyz = M_0*S_yyyyz + v133 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v149 &
      + 56.0d0*v179 + 8.0d0*(v134 + v141) + 32.0d0*(v135 + v150) + &
      48.0d0*(v139 + v152) + 4.0d0*(v142 + v146) + 106.0d0*(v147 + v151 &
      ) + 104.0d0*(v148 + v153) - (M_xxxxz + 8.0d0*v136 + 5.0d0*v137 + &
      36.0d0*v143 + 8.0d0*v144 + 36.0d0*v145 + 28.0d0*v178))
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  x                   
#undef  z                   
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
#undef  Ms_xxx              
#undef  M_xxx               
#undef  M_xxy               
#undef  Ms_xxy              
#undef  Ms_xxz              
#undef  M_xxz               
#undef  Ms_xyy              
#undef  M_xyy               
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
#undef  M_xxyy              
#undef  Ms_xxyy             
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
#undef  Ms_xxyyy            
#undef  M_xxyyy             
#undef  Ms_xxyyz            
#undef  M_xxyyz             
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  M_yyyyy             
#undef  Ms_yyyyy            
#undef  Ms_yyyyz            
#undef  M_yyyyz             
    end subroutine mom_es_M2M
    
! OPS  523*ADD + 2*DIV + 787*MUL + 72*NEG + POW + 20*SUB = 1405  (1959 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70,&
                v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81,&
                v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92,&
                v93, v94, v95, v96, v97, v98, v99, h, u, D_x, D_y, D_z, D_xx,&
                D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy,&
                D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy,&
                D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz,&
                D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx,&
                D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz,&
                D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz,&
                D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz,&
                D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz,&
                D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz,&
                D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz,&
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, M_zz, M_xzz, M_yzz,&
                M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz
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
#define L_yz                 L(7)
#define M_xxy                M(7)
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
#define M_xxxx               M(13)
#define L_yyy                L(13)
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
#define L_xxyz               L(19)
#define M_xyyz               M(19)
#define L_xyyy               L(20)
#define M_yyyy               M(20)
#define M_yyyz               M(21)
#define L_xyyz               L(21)
#define L_yyyy               L(22)
#define M_xxxxx              M(22)
#define M_xxxxy              M(23)
#define L_yyyz               L(23)
#define L_xxxxx              L(24)
#define M_xxxxz              M(24)
#define M_xxxyy              M(25)
#define L_xxxxy              L(25)
#define L_xxxxz              L(26)
#define M_xxxyz              M(26)
#define L_xxxyy              L(27)
#define M_xxyyy              M(27)
#define L_xxxyz              L(28)
#define M_xxyyz              M(28)
#define M_xyyyy              M(29)
#define L_xxyyy              L(29)
#define L_xxyyz              L(30)
#define M_xyyyz              M(30)
#define M_yyyyy              M(31)
#define L_xyyyy              L(31)
#define L_xyyyz              L(32)
#define M_yyyyz              M(32)
#define L_yyyyy              L(33)
#define L_yyyyz              L(34)
#define L_xxxxxx             L(35)
#define L_xxxxxy             L(36)
#define L_xxxxxz             L(37)
#define L_xxxxyy             L(38)
#define L_xxxxyz             L(39)
#define L_xxxyyy             L(40)
#define L_xxxyyz             L(41)
#define L_xxyyyy             L(42)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define L_xyyyyz             L(45)
#define L_yyyyyy             L(46)
#define L_yyyyyz             L(47)
    v159     = y*z
    v153     = 15.0d0*v159
    v155     = x*y
    v157     = v159
    v57      = 0.5d0*M_xx
    v65      = 0.166666666666667d0*M_xxx
    v66      = 0.5d0*M_xxy
    v67      = 0.5d0*M_xxz
    v83      = 0.0416666666666667d0*M_xxxx
    v84      = 0.166666666666667d0*M_xxxy
    v85      = 0.166666666666667d0*M_xxxz
    v86      = 0.25d0*M_xxyy
    v87      = 0.5d0*M_xxyz
    v102     = 0.5d0*M_yy
    v104     = 0.166666666666667d0*M_yyy
    v109     = 0.0416666666666667d0*M_yyyy
    v118     = 0.00833333333333333d0*M_xxxxx
    v119     = 0.0416666666666667d0*M_xxxxy
    v120     = 0.0416666666666667d0*M_xxxxz
    v121     = 0.0833333333333333d0*M_xxxyy
    v122     = 0.166666666666667d0*M_xxxyz
    v124     = 0.0833333333333333d0*M_xxyyy
    v125     = 0.25d0*M_xxyyz
    v128     = 0.00833333333333333d0*M_yyyyy
    v129     = 0.0416666666666667d0*M_yyyyz
    v130     = 0.166666666666667d0*M_yyyz
    v132     = 0.5d0*M_yyz
    v139     = 0.5d0*M_xyy
    v141     = 0.166666666666667d0*M_xyyy
    v143     = 0.0416666666666667d0*M_xyyyy
    M_zz     = -(M_xx + M_yy)
    v135     = 0.5d0*M_zz
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    v140     = 0.5d0*M_yzz
    M_zzz    = -(M_xxz + M_yyz)
    v136     = 0.166666666666667d0*M_zzz
    M_xxzz   = -(M_xxxx + M_xxyy)
    v88      = 0.25d0*M_xxzz
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v133     = 0.25d0*M_yyzz
    M_yzzz   = -(M_xxyz + M_yyyz)
    v142     = 0.166666666666667d0*M_yzzz
    M_zzzz   = -(M_xxzz + M_yyzz)
    v137     = 0.0416666666666667d0*M_zzzz
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    v123     = 0.0833333333333333d0*M_xxxzz
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    v126     = 0.25d0*M_xxyzz
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    v127     = 0.0833333333333333d0*M_xxzzz
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v131     = 0.0833333333333333d0*M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    v134     = 0.0833333333333333d0*M_yyzzz
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    v144     = 0.0416666666666667d0*M_yzzzz
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    v138     = 0.00833333333333333d0*M_zzzzz
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v145     = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v145
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v146     = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v146
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v100     = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v147     = 3.0d0*h
    v148     = h*v0
    v149     = h*v1
    v158     = 21.0d0*h
    v4       = -h
    v12      = v147
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v148
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v149
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 + 630.0d0*v148 - 945.0d0*v19
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 + 630.0d0*v149 - 945.0d0*v31
    v46      = h*h*h
    v47      = -5.0d0*v46
    v48      = 315.0d0*h
    v49      = v0*v17
    v51      = 5.0d0*v17
    v53      = v21 + v51 + v52
    v55      = -(126.0d0*v1*v20 + v46)
    v60      = -v0*v12
    v61      = -v1*v12
    v62      = v17 + 33.0d0*v27
    v74      = v1*v17
    v101     = v100 + v33 + v51
    u2       = 1.0/h
    u        = sqrt(u2)
    u3       = u*u2
    v2       = u3
    D_x      = -v2*x
    D_y      = -v2*y
    D_z      = -v2*z
    u4       = u2*u2
    u5       = u2*u3
    v3       = u5
    v150     = 3.0d0*v3
    v6       = v150*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v150*v157
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v151     = 3.0d0*v8
    v9       = v8*x
    v11      = v151*(h - v10)
    D_xxx    = -3.0d0*v9*(v145 - v147)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    D_xyz    = -v153*v9
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = v151*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v152     = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v152*y
    v26      = v152*z
    v28      = v15*v153
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v89      = 0.5d0*D_xxyy
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    v95      = 0.5d0*D_xxzz
    D_xyyy   = v22*v30
    D_xyyz   = v26*(v29 + v4)
    D_xyzz   = -(D_xxxy + D_xyyy)
    v113     = 0.5d0*D_xyzz
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v160     = v34*z
    v154     = 15.0d0*v34
    v35      = v154*x
    v39      = v160
    v41      = 315.0d0*v155*v160
    v42      = v154*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx  = D_xxxxx*M_0
    D_xxxxy  = v34*v38*y
    L_xxxxy  = D_xxxxy*M_0
    D_xxxxz  = v38*v39
    L_xxxxz  = D_xxxxz*M_0
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    v68      = 0.5d0*D_xxxyy
    L_xxxyy  = D_xxxyy*M_0
    D_xxxyz  = v41*(h - v5)
    L_xxxyz  = D_xxxyz*M_0
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    v71      = 0.5d0*D_xxxzz
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    v77      = 0.5d0*D_xxyyy
    v90      = 0.166666666666667d0*D_xxyyy
    L_xxyyy  = D_xxyyy*M_0
    D_xxyyz  = v39*(v36 - 945.0d0*v146 + 105.0d0*(v148 + v149))
    v93      = 0.5d0*D_xxyyz
    L_xxyyz  = D_xxyyz*M_0
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    v80      = 0.5d0*D_xxyzz
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    v96      = 0.166666666666667d0*D_xxzzz
    v98      = 0.5d0*D_xxzzz
    D_xyyyy  = v34*v43*x
    L_xyyyy  = D_xyyyy*M_0
    D_xyyyz  = v41*(h - v7)
    v111     = 0.5d0*D_xyyyz
    L_xyyyz  = D_xyyyz*M_0
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    v106     = 0.5d0*D_xyyzz
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    v114     = 0.166666666666667d0*D_xyzzz
    v116     = 0.5d0*D_xyzzz
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    L_yyyyy  = D_yyyyy*M_0
    D_yyyyz  = v39*v43
    L_yyyyz  = D_yyyyz*M_0
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v161     = 315.0d0*v44
    v156     = v161*x
    v45      = 45.0d0*v44
    v50      = v156*y
    v54      = v156*z
    v56      = v157*v161
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = v50*v53
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = v53*v54
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 - v158*v19 + v17*v29 + 14.0d0*v49)
    v58      = 0.5d0*D_xxxxyy
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    v59      = 0.5d0*D_xxxxzz
    L_xxxx   = D_xxxx*M_0 + D_xxxxxx*v57 + D_xxxxxy*M_xy + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + M_yy*v58 + M_zz*v59
    D_xxxyyy = 945.0d0*v155*v44*(11.0d0*v27 + v17 + v60 + v61)
    v63      = 0.5d0*D_xxxyyy
    v69      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = v54*(-9.0d0*v32 + v60 + v62)
    v70      = 0.5d0*D_xxxyyz
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    v64      = 0.5d0*D_xxxyzz
    L_xxxy   = D_xxxxxy*v57 + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + M_yy*v63 + M_zz*v64
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    v72      = 0.166666666666667d0*D_xxxzzz
    v73      = 0.5d0*D_xxxzzz
    L_xxx    = D_xxx*M_0 + D_xxxxx*v57 + D_xxxxxx*v65 + D_xxxxxy*v66 + D_xxxxxz*v67 + &
      D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz + &
      M_xyy*v58 + M_xzz*v59 + M_yy*v68 + M_yyy*v69 + M_yyz*v70 + M_yzz* &
      v64 + M_zz*v71 + M_zzz*v72
    L_xxxz   = D_xxxxxz*v57 + D_xxxxyz*M_xy + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz* &
      M_0 + M_yy*v70 + M_zz*v73
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 - v158*v31 + v17*v24 + 14.0d0*v74)
    v75      = 0.5d0*D_xxyyyy
    v78      = 0.166666666666667d0*D_xxyyyy
    v91      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = v56*(-9.0d0*v20 + v61 + v62)
    v79      = 0.5d0*D_xxyyyz
    v92      = 0.166666666666667d0*D_xxyyyz
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    v76      = 0.5d0*D_xxyyzz
    v94      = 0.25d0*D_xxyyzz
    L_xxyy   = D_xxxxyy*v57 + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + M_yy*v75 + M_zz*v76
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    v81      = 0.166666666666667d0*D_xxyzzz
    v82      = 0.5d0*D_xxyzzz
    L_xxy    = D_xxxxxy*v65 + D_xxxxy*v57 + D_xxxxyy*v66 + D_xxxxyz*v67 + D_xxxyy*M_xy &
      + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + &
      M_xyy*v63 + M_xzz*v64 + M_yy*v77 + M_yyy*v78 + M_yyz*v79 + M_yzz* &
      v76 + M_zz*v80 + M_zzz*v81
    L_xxyz   = D_xxxxyz*v57 + D_xxxyyz*M_xy + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz* &
      M_0 + M_yy*v79 + M_zz*v82
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    v97      = 0.0416666666666667d0*D_xxzzzz
    v99      = 0.166666666666667d0*D_xxzzzz
    L_xx     = D_xx*M_0 + D_xxxx*v57 + D_xxxxx*v65 + D_xxxxxx*v83 + D_xxxxxy*v84 + &
      D_xxxxxz*v85 + D_xxxxy*v66 + D_xxxxyy*v86 + D_xxxxyz*v87 + &
      D_xxxxz*v67 + D_xxxxzz*v88 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz &
      *M_xz + D_xxyz*M_yz + M_xyy*v68 + M_xyyy*v69 + M_xyyz*v70 + &
      M_xyzz*v64 + M_xzz*v71 + M_xzzz*v72 + M_yy*v89 + M_yyy*v90 + &
      M_yyyy*v91 + M_yyyz*v92 + M_yyz*v93 + M_yyzz*v94 + M_yzz*v80 + &
      M_yzzz*v81 + M_zz*v95 + M_zzz*v96 + M_zzzz*v97
    L_xxz    = D_xxxxxz*v65 + D_xxxxyz*v66 + D_xxxxz*v57 + D_xxxxzz*v67 + D_xxxyz*M_xy &
      + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_xyy*v70 + M_xzz*v73 + M_yy*v93 + M_yyy*v92 + M_yyz*v76 + M_yzz* &
      v82 + M_zz*v98 + M_zzz*v99
    D_xyyyyy = v101*v50
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = v54*(-18.0d0*v32 + v100 + v17)
    v105     = 0.5d0*D_xyyyyz
    v110     = 0.166666666666667d0*D_xyyyyz
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    v103     = 0.5d0*D_xyyyzz
    v112     = 0.25d0*D_xyyyzz
    L_xyyy   = D_xxxyyy*v57 + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy* &
      v102 + D_xyyyyz*M_yz + M_zz*v103
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    v107     = 0.166666666666667d0*D_xyyzzz
    v108     = 0.5d0*D_xyyzzz
    L_xyy    = D_xxxxyy*v65 + D_xxxyy*v57 + D_xxxyyy*v66 + D_xxxyyz*v67 + D_xxyyy*M_xy &
      + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v102 + &
      D_xyyyyy*v104 + D_xyyyz*M_yz + M_xyy*v75 + M_xzz*v76 + M_yyz*v105 &
      + M_yzz*v103 + M_zz*v106 + M_zzz*v107
    L_xyyz   = D_xxxyyz*v57 + D_xxyyyz*M_xy + D_xxyyzz*M_xz + D_xyyyyz*v102 + D_xyyyzz* &
      M_yz + D_xyyz*M_0 + M_zz*v108
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    v115     = 0.0416666666666667d0*D_xyzzzz
    v117     = 0.166666666666667d0*D_xyzzzz
    L_xy     = D_xxxxxy*v83 + D_xxxxy*v65 + D_xxxxyy*v84 + D_xxxxyz*v85 + D_xxxy*v57 + &
      D_xxxyy*v66 + D_xxxyyy*v86 + D_xxxyyz*v87 + D_xxxyz*v67 + &
      D_xxxyzz*v88 + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy* &
      M_0 + D_xyyy*v102 + D_xyyyy*v104 + D_xyyyyy*v109 + D_xyyz*M_yz + &
      M_xyy*v77 + M_xyyy*v78 + M_xyyz*v79 + M_xyzz*v76 + M_xzz*v80 + &
      M_xzzz*v81 + M_yyyz*v110 + M_yyz*v111 + M_yyzz*v112 + M_yzz*v106 &
      + M_yzzz*v107 + M_zz*v113 + M_zzz*v114 + M_zzzz*v115
    L_xyz    = D_xxxxyz*v65 + D_xxxyyz*v66 + D_xxxyz*v57 + D_xxxyzz*v67 + D_xxyyz*M_xy &
      + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyyyz*v104 + D_xyyyz*v102 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v79 + M_xzz*v82 + M_yyz*v103 + &
      M_yzz*v108 + M_zz*v116 + M_zzz*v117
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = D_x*M_0 + D_xxx*v57 + D_xxxx*v65 + D_xxxxx*v83 + D_xxxxxx*v118 + &
      D_xxxxxy*v119 + D_xxxxxz*v120 + D_xxxxy*v84 + D_xxxxyy*v121 + &
      D_xxxxyz*v122 + D_xxxxz*v85 + D_xxxxzz*v123 + D_xxxy*v66 + &
      D_xxxyy*v86 + D_xxxyyy*v124 + D_xxxyyz*v125 + D_xxxyz*v87 + &
      D_xxxyzz*v126 + D_xxxz*v67 + D_xxxzz*v88 + D_xxxzzz*v127 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v102 + D_xyyy*v104 + &
      D_xyyyy*v109 + D_xyyyyy*v128 + D_xyyyyz*v129 + D_xyyyz*v130 + &
      D_xyyyzz*v131 + D_xyyz*v132 + D_xyyzz*v133 + D_xyyzzz*v134 + &
      D_xyz*M_yz + D_xzz*v135 + D_xzzz*v136 + D_xzzzz*v137 + D_xzzzzz* &
      v138 + M_xyy*v89 + M_xyyy*v90 + M_xyyyy*v91 + M_xyyyz*v92 + &
      M_xyyz*v93 + M_xyyzz*v94 + M_xyzz*v80 + M_xyzzz*v81 + M_xzz*v95 + &
      M_xzzz*v96 + M_xzzzz*v97 + M_yzz*v113 + M_yzzz*v114 + M_yzzzz* &
      v115
    L_xz     = D_xxxxxz*v83 + D_xxxxyz*v84 + D_xxxxz*v65 + D_xxxxzz*v85 + D_xxxyyz*v86 &
      + D_xxxyz*v66 + D_xxxyzz*v87 + D_xxxz*v57 + D_xxxzz*v67 + &
      D_xxxzzz*v88 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + &
      D_xyyyyz*v109 + D_xyyyz*v104 + D_xyyyzz*v130 + D_xyyz*v102 + &
      D_xyyzz*v132 + D_xyyzzz*v133 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz* &
      v135 + D_xzzzz*v136 + D_xzzzzz*v137 + M_xyy*v93 + M_xyyy*v92 + &
      M_xyyz*v76 + M_xyzz*v82 + M_xzz*v98 + M_xzzz*v99 + M_yzz*v116 + &
      M_yzzz*v117
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v74)
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = v101*v56
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = D_xxyyyy*v57 + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyy* &
      v102 + D_yyyyyz*M_yz + D_yyyyzz*v135
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = D_xxxyyy*v65 + D_xxyyy*v57 + D_xxyyyy*v66 + D_xxyyyz*v67 + D_xyyyy*M_xy &
      + D_xyyyyy*v139 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v102 + D_yyyyyy*v104 + D_yyyyyz*v132 + D_yyyyz*M_yz + &
      D_yyyyzz*v140 + D_yyyzz*v135 + D_yyyzzz*v136 + M_xzz*v103
    L_yyyz   = D_xxyyyz*v57 + D_xyyyyz*M_xy + D_xyyyzz*M_xz + D_yyyyyz*v102 + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzzz*v135
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = D_xxxxyy*v83 + D_xxxyy*v65 + D_xxxyyy*v84 + D_xxxyyz*v85 + D_xxyy*v57 + &
      D_xxyyy*v66 + D_xxyyyy*v86 + D_xxyyyz*v87 + D_xxyyz*v67 + &
      D_xxyyzz*v88 + D_xyyy*M_xy + D_xyyyy*v139 + D_xyyyyy*v141 + &
      D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v102 + D_yyyyy* &
      v104 + D_yyyyyy*v109 + D_yyyyyz*v130 + D_yyyyz*v132 + D_yyyyzz* &
      v133 + D_yyyz*M_yz + D_yyyzz*v140 + D_yyyzzz*v142 + D_yyzz*v135 + &
      D_yyzzz*v136 + D_yyzzzz*v137 + M_xyyz*v105 + M_xyzz*v103 + M_xzz* &
      v106 + M_xzzz*v107
    L_yyz    = D_xxxyyz*v65 + D_xxyyyz*v66 + D_xxyyz*v57 + D_xxyyzz*v67 + D_xyyyyz*v139 &
      + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyz*v104 + &
      D_yyyyz*v102 + D_yyyyzz*v132 + D_yyyzz*M_yz + D_yyyzzz*v140 + &
      D_yyz*M_0 + D_yyzzz*v135 + D_yyzzzz*v136 + M_xzz*v108
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = D_xxxxxy*v118 + D_xxxxy*v83 + D_xxxxyy*v119 + D_xxxxyz*v120 + D_xxxy*v65 &
      + D_xxxyy*v84 + D_xxxyyy*v121 + D_xxxyyz*v122 + D_xxxyz*v85 + &
      D_xxxyzz*v123 + D_xxy*v57 + D_xxyy*v66 + D_xxyyy*v86 + D_xxyyyy* &
      v124 + D_xxyyyz*v125 + D_xxyyz*v87 + D_xxyyzz*v126 + D_xxyz*v67 + &
      D_xxyzz*v88 + D_xxyzzz*v127 + D_xyy*M_xy + D_xyyy*v139 + D_xyyyy* &
      v141 + D_xyyyyy*v143 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + &
      D_yyy*v102 + D_yyyy*v104 + D_yyyyy*v109 + D_yyyyyy*v128 + &
      D_yyyyyz*v129 + D_yyyyz*v130 + D_yyyyzz*v131 + D_yyyz*v132 + &
      D_yyyzz*v133 + D_yyyzzz*v134 + D_yyz*M_yz + D_yyzz*v140 + D_yyzzz &
      *v142 + D_yyzzzz*v144 + D_yzz*v135 + D_yzzz*v136 + D_yzzzz*v137 + &
      D_yzzzzz*v138 + M_xyyyz*v110 + M_xyyz*v111 + M_xyyzz*v112 + &
      M_xyzz*v106 + M_xyzzz*v107 + M_xzz*v113 + M_xzzz*v114 + M_xzzzz* &
      v115
    L_yz     = D_xxxxyz*v83 + D_xxxyyz*v84 + D_xxxyz*v65 + D_xxxyzz*v85 + D_xxyyyz*v86 &
      + D_xxyyz*v66 + D_xxyyzz*v87 + D_xxyz*v57 + D_xxyzz*v67 + &
      D_xxyzzz*v88 + D_xyyyyz*v141 + D_xyyyz*v139 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyyz*v109 + D_yyyyz*v104 + &
      D_yyyyzz*v130 + D_yyyz*v102 + D_yyyzz*v132 + D_yyyzzz*v133 + &
      D_yyzz*M_yz + D_yyzzz*v140 + D_yyzzzz*v142 + D_yz*M_0 + D_yzzz* &
      v135 + D_yzzzz*v136 + D_yzzzzz*v137 + M_xyyz*v103 + M_xyzz*v108 + &
      M_xzz*v116 + M_xzzz*v117
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_z      = 0.0416666666666667d0*(6.0d0*D_xyyzzz*M_xyyzz + 12.0d0*D_xzzz*M_xzz + &
      D_xzzzzz*M_xzzzz + 4.0d0*(D_xyyyzz*M_xyyyz + D_xzzzz*M_xzzz)) + &
      D_xxxxxz*v118 + D_xxxxyz*v119 + D_xxxxz*v83 + D_xxxxzz*v120 + &
      D_xxxyyz*v121 + D_xxxyz*v84 + D_xxxyzz*v122 + D_xxxz*v65 + &
      D_xxxzz*v85 + D_xxxzzz*v123 + D_xxyyyz*v124 + D_xxyyz*v86 + &
      D_xxyyzz*v125 + D_xxyz*v66 + D_xxyzz*v87 + D_xxyzzz*v126 + D_xxz* &
      v57 + D_xxzz*v67 + D_xxzzz*v88 + D_xxzzzz*v127 + D_xyyyyz*v143 + &
      D_xyyyz*v141 + D_xyyz*v139 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yyyyyz*v128 + D_yyyyz*v109 + D_yyyyzz*v129 + D_yyyz*v104 &
      + D_yyyzz*v130 + D_yyyzzz*v131 + D_yyz*v102 + D_yyzz*v132 + &
      D_yyzzz*v133 + D_yyzzzz*v134 + D_yzz*M_yz + D_yzzz*v140 + D_yzzzz &
      *v142 + D_yzzzzz*v144 + D_z*M_0 + D_zzz*v135 + D_zzzz*v136 + &
      D_zzzzz*v137 + D_zzzzzz*v138 + M_xyyz*v106 + M_xyzz*v116 + &
      M_xyzzz*v117
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
#undef  L_yz                
#undef  M_xxy               
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
#undef  M_xxxx              
#undef  L_yyy               
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
#undef  L_xxyz              
#undef  M_xyyz              
#undef  L_xyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxyz             
#undef  L_xxxyy             
#undef  M_xxyyy             
#undef  L_xxxyz             
#undef  M_xxyyz             
#undef  M_xyyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  M_yyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  L_xxxxxz            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  L_xxxyyy            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
    end subroutine mom_es_M2L
    
! OPS  357*ADD + 2*DIV + 411*MUL + 35*NEG + POW = 806  (1945 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v17, v18,&
                v19, v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3,&
                v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz
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
#define Ls_xxxz              Ls(17)
#define L_xxxz               L(17)
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
#define Ls_xxxxy             Ls(25)
#define L_xxxxy              L(25)
#define L_xxxxz              L(26)
#define Ls_xxxxz             Ls(26)
#define Ls_xxxyy             Ls(27)
#define L_xxxyy              L(27)
#define L_xxxyz              L(28)
#define Ls_xxxyz             Ls(28)
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
#define Ls_xxxxxx            Ls(35)
#define L_xxxxxx             L(35)
#define L_xxxxxy             L(36)
#define Ls_xxxxxy            Ls(36)
#define Ls_xxxxxz            Ls(37)
#define L_xxxxxz             L(37)
#define Ls_xxxxyy            Ls(38)
#define L_xxxxyy             L(38)
#define Ls_xxxxyz            Ls(39)
#define L_xxxxyz             L(39)
#define Ls_xxxyyy            Ls(40)
#define L_xxxyyy             L(40)
#define Ls_xxxyyz            Ls(41)
#define L_xxxyyz             L(41)
#define Ls_xxyyyy            Ls(42)
#define L_xxyyyy             L(42)
#define Ls_xxyyyz            Ls(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define Ls_xyyyyy            Ls(44)
#define L_xyyyyz             L(45)
#define Ls_xyyyyz            Ls(45)
#define L_yyyyyy             L(46)
#define Ls_yyyyyy            Ls(46)
#define Ls_yyyyyz            Ls(47)
#define L_yyyyyz             L(47)
    v0        = L_xxxxx + L_xxxxxy*y + L_xxxxxz*z
    v1        = L_xxxxy + L_xxxxyz*z
    v2        = L_xxxxyy*y + v1
    v3        = L_xxxyy + L_xxxyyz*z
    v4        = L_xxxyyy*y + v3
    v5        = L_xxyyy + L_xxyyyz*z
    v6        = L_xxyyyy*y + v5
    v7        = L_xyyyy + L_xyyyyz*z
    v8        = L_xyyyyy*y + v7
    v9        = L_yyyyy + L_yyyyyz*z
    v10       = L_xxxxz*z
    v17       = v1*y
    v19       = L_xxxyz*z
    v22       = v3*y
    v25       = L_xxxz*z
    v36       = 0.5d0*x
    v42       = L_xxyyz*z
    v45       = v5*y
    v48       = L_xxyz*z
    v59       = L_xxz*z
    v72       = 0.166666666666667d0*x
    v82       = L_xyyyz*z
    v85       = v7*y
    v88       = L_xyyz*z
    v99       = L_xyz*z
    v124      = 0.0416666666666667d0*y
    v128      = 0.0416666666666667d0*x
    v137      = L_yyyyz*z
    v140      = L_yyyz*z
    v142      = 0.5d0*y
    v146      = L_yyz*z
    v149      = 0.166666666666667d0*y
    Ls_xxxxx  = L_xxxxxx*x + v0
    Ls_xxxxy  = L_xxxxxy*x + v2
    Ls_xxxyy  = L_xxxxyy*x + v4
    Ls_xxyyy  = L_xxxyyy*x + v6
    Ls_xyyyy  = L_xxyyyy*x + v8
    Ls_yyyyy  = v9 + L_xyyyyy*x + L_yyyyyy*y
    Ls_xxxxxx = L_xxxxxx
    Ls_xxxxxy = L_xxxxxy
    Ls_xxxxxz = L_xxxxxz
    Ls_xxxxyy = L_xxxxyy
    Ls_xxxxyz = L_xxxxyz
    Ls_xxxyyy = L_xxxyyy
    Ls_xxxyyz = L_xxxyyz
    Ls_xxyyyy = L_xxyyyy
    Ls_xxyyyz = L_xxyyyz
    Ls_xyyyyy = L_xyyyyy
    Ls_xyyyyz = L_xyyyyz
    Ls_yyyyyy = L_yyyyyy
    Ls_yyyyyz = L_yyyyyz
    L_zz      = -(L_xx + L_yy)
    L_xzz     = -(L_xxx + L_xyy)
    v130      = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v157      = L_yzz*z
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    v75       = L_xxzz*z
    L_xyzz    = -(L_xxxy + L_xyyy)
    v108      = L_xyzz*z
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    v152      = L_yyzz*z
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    v38       = L_xxxzz*z
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    v55       = L_xxyzz*z
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    v95       = L_xyyzz*z
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    v144      = L_yyyzz*z
    L_yyzzz   = -(L_xxyyz + L_yyyyz)
    L_yzzzz   = -(L_xxyzz + L_yyyzz)
    L_zzzzz   = -(L_xxzzz + L_yyzzz)
    L_xxxxzz  = -(L_xxxxxx + L_xxxxyy)
    v18       = L_xxxxz + L_xxxxyz*y + L_xxxxzz*z
    Ls_xxxxz  = L_xxxxxz*x + v18
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    v23       = L_xxxyz + L_xxxyzz*z
    v24       = L_xxxyyz*y + v23
    v41       = v23*y
    Ls_xxxyz  = L_xxxxyz*x + v24
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    v46       = L_xxyyz + L_xxyyzz*z
    v47       = L_xxyyyz*y + v46
    v58       = v46*y
    Ls_xxyyz  = L_xxxyyz*x + v47
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    v86       = L_xyyyz + L_xyyyzz*z
    v87       = L_xyyyyz*y + v86
    v98       = v86*y
    Ls_xyyyz  = L_xxyyyz*x + v87
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    v139      = L_yyyyz + L_yyyyzz*z
    Ls_yyyyz  = v139 + L_xyyyyz*x + L_yyyyyz*y
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v11       = a2
    v12       = 0.5d0*v11
    v71       = 0.25d0*v11
    v127      = 0.0833333333333333d0*v11
    a3        = a1*a2
    v26       = a3
    v27       = 0.166666666666667d0*v26
    v126      = 0.0833333333333333d0*v26
    a4        = a2*a2
    v60       = 0.0416666666666667d0*a4
    a5        = a2*a3
    v115      = 0.00833333333333333d0*a5
    a6        = a3*a3
    b2        = b1*b1
    v13       = b2
    v14       = L_xxxxyy*v13
    v20       = L_xxxyyy*v13
    v33       = 0.5d0*v13
    v39       = L_xxxyyz*v13
    v43       = L_xxyyyy*v13
    v56       = L_xxyyyz*v13
    v73       = 3.0d0*v13
    v83       = L_xyyyyy*v13
    v96       = L_xyyyyz*v13
    v123      = 0.0833333333333333d0*v13
    v148      = 0.25d0*v13
    b3        = b1*b2
    v28       = b3
    v29       = L_xxxyyy*v28
    v49       = L_xxyyyy*v28
    v67       = 0.166666666666667d0*v28
    v76       = L_xxyyyz*v28
    v89       = L_xyyyyy*v28
    v109      = L_xyyyyz*v28
    v122      = 0.0833333333333333d0*v28
    v129      = 4.0d0*v28
    b4        = b2*b2
    v61       = b4
    v62       = L_xxyyyy*v61
    v100      = L_xyyyyy*v61
    v121      = 0.0416666666666667d0*v61
    v131      = L_xyyyyz*v61
    b5        = b2*b3
    v116      = 0.00833333333333333d0*b5
    b6        = b3*b3
    c2        = c1*c1
    v15       = c2
    v117      = 0.5d0*v15
    v150      = 3.0d0*v15
    v155      = 12.0d0*v15
    v63       = L_xxzz*v15
    v101      = L_xyzz*v15
    v30       = L_xxxzz*v15
    v50       = L_xxyzz*v15
    v77       = L_xxzzz*v15
    v90       = L_xyyzz*v15
    v110      = L_xyzzz*v15
    v16       = L_xxxxzz*v15
    v37       = v14 + v16 + 2.0d0*(L_xxxx + v10 + v17)
    Ls_xxxx   = 0.5d0*(v14 + v16) + L_xxxx + L_xxxxxx*v12 + v0*x + v10 + v17
    v21       = L_xxxyzz*v15
    v34       = v21 + 2.0d0*(L_xxxy + v19)
    v35       = v34*y
    v54       = 2.0d0*v22 + v20 + v34
    Ls_xxxy   = 0.5d0*(v20 + v21) + L_xxxxxy*v12 + L_xxxy + v19 + v2*x + v22
    v40       = L_xxxzzz*v15
    v81       = v39 + v40 + 2.0d0*(L_xxxz + v38 + v41)
    Ls_xxxz   = 0.5d0*(v39 + v40) + L_xxxxxz*v12 + L_xxxz + v18*x + v38 + v41
    v44       = L_xxyyzz*v15
    v52       = v44 + 2.0d0*(L_xxyy + v42)
    v53       = v52*y
    v68       = v13*v52
    v94       = 2.0d0*v45 + v43 + v52
    Ls_xxyy   = 0.5d0*(v43 + v44) + L_xxxxyy*v12 + L_xxyy + v4*x + v42 + v45
    v57       = L_xxyzzz*v15
    v79       = v57 + 2.0d0*(L_xxyz + v55)
    v80       = v79*y
    v114      = 2.0d0*v58 + v56 + v79
    Ls_xxyz   = 0.5d0*(v56 + v57) + L_xxxxyz*v12 + L_xxyz + v24*x + v55 + v58
    v84       = L_xyyyzz*v15
    v92       = v84 + 2.0d0*(L_xyyy + v82)
    v93       = v92*y
    v104      = v13*v92
    Ls_xyyy   = 0.5d0*(v83 + v84) + L_xxxyyy*v12 + L_xyyy + v6*x + v82 + v85
    v97       = L_xyyzzz*v15
    v112      = v97 + 2.0d0*(L_xyyz + v95)
    v113      = v112*y
    v133      = v112*v13
    Ls_xyyz   = 0.5d0*(v96 + v97) + L_xxxyyz*v12 + L_xyyz + v47*x + v95 + v98
    v138      = L_yyyyzz*v15
    v143      = v138 + 2.0d0*(L_yyyy + v137)
    Ls_yyyy   = 0.5d0*v138 + L_xxyyyy*v12 + L_yyyy + L_yyyyyy*v33 + v137 + v8*x + v9*y
    v145      = L_yyyzzz*v15
    v154      = v145 + 2.0d0*(L_yyyz + v144)
    Ls_yyyz   = 0.5d0*v145 + L_xxyyyz*v12 + L_yyyyyz*v33 + L_yyyz + v139*y + v144 + v87* &
      x
    h         = v11 + v13 + v15
    u2        = 1.0/h
    u         = sqrt(u2)
    u3        = u*u2
    u4        = u2*u2
    u5        = u2*u3
    u6        = u3*u3
    u7        = u3*u4
    u8        = u4*u4
    u9        = u4*u5
    u10       = u5*u5
    u11       = u5*u6
    u12       = u6*u6
    u13       = u6*u7
    c3        = c1*c2
    v31       = c3
    v118      = 0.166666666666667d0*v31
    v156      = 4.0d0*v31
    v64       = L_xxzzz*v31
    v102      = L_xyzzz*v31
    v32       = L_xxxzzz*v31
    v74       = v29 + v32 + v3*v73 + 6.0d0*(L_xxx + v25) + 3.0d0*(v30 + v35)
    Ls_xxx    = 0.166666666666667d0*(v29 + v32 + 3.0d0*(v30 + v35)) + L_xxx + L_xxxxxx* &
      v27 + v0*v12 + v25 + v3*v33 + v36*v37
    v51       = L_xxyzzz*v31
    v69       = v51 + 3.0d0*(2.0d0*L_xxy + 2.0d0*v48 + v50)
    v70       = v69*y
    v107      = v49 + v69 + v5*v73 + 3.0d0*v53
    Ls_xxy    = 0.166666666666667d0*(v49 + v51 + 3.0d0*(v50 + v53)) + L_xxxxxy*v27 + &
      L_xxy + v12*v2 + v33*v5 + v36*v54 + v48
    v78       = L_xxzzzz*v31
    v136      = v76 + v78 + v46*v73 + 6.0d0*(L_xxz + v75) + 3.0d0*(v77 + v80)
    Ls_xxz    = 0.166666666666667d0*(v76 + v78 + 3.0d0*(v77 + v80)) + L_xxxxxz*v27 + &
      L_xxz + v12*v18 + v33*v46 + v36*v81 + v75
    v91       = L_xyyzzz*v31
    v105      = v91 + 3.0d0*(2.0d0*L_xyy + 2.0d0*v88 + v90)
    v106      = v105*y
    Ls_xyy    = 0.166666666666667d0*(v89 + v91 + 3.0d0*(v90 + v93)) + L_xxxxyy*v27 + &
      L_xyy + v12*v4 + v33*v7 + v36*v94 + v88
    v111      = L_xyzzzz*v31
    v134      = v111 + 3.0d0*(2.0d0*L_xyz + 2.0d0*v108 + v110)
    v135      = v134*y
    Ls_xyz    = 0.166666666666667d0*(v109 + v111 + 3.0d0*(v110 + v113)) + L_xxxxyz*v27 + &
      L_xyz + v108 + v114*v36 + v12*v24 + v33*v86
    v141      = L_yyyzzz*v31
    v151      = v141 + L_yyyzz*v150 + 6.0d0*(L_yyy + v140)
    Ls_yyy    = 0.166666666666667d0*v141 + L_xxxyyy*v27 + L_yyy + L_yyyyyy*v67 + L_yyyzz &
      *v117 + v12*v6 + v140 + v142*v143 + v33*v9 + v36*(v83 + 2.0d0*v85 &
      + v92)
    v153      = L_yyzzzz*v31
    v159      = v153 + L_yyzzz*v150 + 6.0d0*(L_yyz + v152)
    Ls_yyz    = 0.166666666666667d0*v153 + L_xxxyyz*v27 + L_yyyyyz*v67 + L_yyz + L_yyzzz &
      *v117 + v12*v47 + v139*v33 + v142*v154 + v152 + v36*(v112 + v96 + &
      2.0d0*v98)
    c4        = c2*c2
    v65       = c4
    v119      = 0.0416666666666667d0*v65
    v66       = L_xxzzzz*v65
    Ls_xx     = 0.0416666666666667d0*(v62 + 12.0d0*v63 + v66 + 6.0d0*v68 + 4.0d0*(v64 + &
      v70)) + L_xx + L_xxxxxx*v60 + v0*v27 + v37*v71 + v5*v67 + v59 + &
      v72*v74
    v103      = L_xyzzzz*v65
    v125      = v103 + 12.0d0*v101 + 4.0d0*(6.0d0*L_xy + v102 + 6.0d0*v99)
    Ls_xy     = 0.0416666666666667d0*(v100 + 12.0d0*v101 + v103 + 6.0d0*v104 + 4.0d0*( &
      v102 + v106)) + L_xxxxxy*v60 + L_xy + v107*v72 + v2*v27 + v54*v71 &
      + v67*v7 + v99
    v132      = L_xzzzzz*v65
    Ls_xz     = 0.0416666666666667d0*(v131 + v132 + 6.0d0*v133 + 4.0d0*v135) + L_xxxxxz* &
      v60 + L_xz + L_xzzz*v117 + L_xzzzz*v118 + v130 + v136*v72 + v18* &
      v27 + v67*v86 + v71*v81
    v147      = L_yyzzzz*v65
    Ls_yy     = 0.0416666666666667d0*v147 + L_xxxxyy*v60 + L_yy + L_yyyyyy*v121 + L_yyzz &
      *v117 + L_yyzzz*v118 + v143*v148 + v146 + v149*v151 + v27*v4 + &
      v67*v9 + v71*v94 + v72*(v105 + v7*v73 + v89 + 3.0d0*v93)
    v158      = L_yzzzzz*v65
    Ls_yz     = 0.0416666666666667d0*v158 + L_xxxxyz*v60 + L_yyyyyz*v121 + L_yz + L_yzzz &
      *v117 + L_yzzzz*v118 + v114*v71 + v139*v67 + v148*v154 + v149* &
      v159 + v157 + v24*v27 + v72*(v109 + 3.0d0*v113 + v134 + v73*v86)
    c5        = c2*c3
    v120      = 0.00833333333333333d0*c5
    Ls_x      = L_x + L_xxxxxx*v115 + L_xyyyyy*v116 + L_xz*z + L_xzz*v117 + L_xzzz*v118 &
      + L_xzzzz*v119 + L_xzzzzz*v120 + v0*v60 + v105*v123 + v121*v7 + &
      v122*v92 + v124*v125 + v126*v37 + v127*v74 + v128*(24.0d0*L_xx + &
      v129*v5 + 24.0d0*v59 + v62 + 12.0d0*v63 + 4.0d0*v64 + v66 + 6.0d0 &
      *v68 + 4.0d0*v70)
    Ls_y      = L_y + L_xxxxxy*v115 + L_yyyyyy*v116 + L_yz*z + L_yzz*v117 + L_yzzz*v118 &
      + L_yzzzz*v119 + L_yzzzzz*v120 + v107*v127 + v121*v9 + v122*v143 &
      + v123*v151 + v124*(24.0d0*L_yy + L_yyzz*v155 + L_yyzzz*v156 + &
      24.0d0*v146 + v147) + v126*v54 + v128*(v100 + 6.0d0*v104 + 4.0d0* &
      v106 + v125 + v129*v7) + v2*v60
    Ls_z      = L_z + L_xxxxxz*v115 + L_yyyyyz*v116 + L_zz*z + L_zzz*v117 + L_zzzz*v118 &
      + L_zzzzz*v119 + L_zzzzzz*v120 + v121*v139 + v122*v154 + v123* &
      v159 + v124*(24.0d0*L_yz + L_yzzz*v155 + L_yzzzz*v156 + 24.0d0* &
      v157 + v158) + v126*v81 + v127*v136 + v128*(24.0d0*L_xz + L_xzzz* &
      v155 + L_xzzzz*v156 + v129*v86 + 24.0d0*v130 + v131 + v132 + &
      6.0d0*v133 + 4.0d0*v135) + v18*v60
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
#undef  L_xxxyz             
#undef  Ls_xxxyz            
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
#undef  Ls_xxxxxx           
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  Ls_xxxxxy           
#undef  Ls_xxxxxz           
#undef  L_xxxxxz            
#undef  Ls_xxxxyy           
#undef  L_xxxxyy            
#undef  Ls_xxxxyz           
#undef  L_xxxxyz            
#undef  Ls_xxxyyy           
#undef  L_xxxyyy            
#undef  Ls_xxxyyz           
#undef  L_xxxyyz            
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  Ls_xyyyyy           
#undef  L_xyyyyz            
#undef  Ls_xyyyyz           
#undef  L_yyyyyy            
#undef  Ls_yyyyyy           
#undef  Ls_yyyyyz           
#undef  L_yyyyyz            
    end subroutine mom_es_L2L
    
! OPS  147*ADD + 2*DIV + 217*MUL + 35*NEG + POW = 402  (680 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz
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
#define L_xxxxxx             L(35)
#define L_xxxxxy             L(36)
#define L_xxxxxz             L(37)
#define L_xxxxyy             L(38)
#define L_xxxxyz             L(39)
#define L_xxxyyy             L(40)
#define L_xxxyyz             L(41)
#define L_xxyyyy             L(42)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define L_xyyyyz             L(45)
#define L_yyyyyy             L(46)
#define L_yyyyyz             L(47)
    v11      = L_xyyyy + L_xyyyyz*z
    v15      = 2.0d0*z
    v19      = 6.0d0*z
    v22      = 0.0416666666666667d0*y
    v23      = 24.0d0*z
    v28      = 2.0d0*y
    v29      = L_xxxxy + L_xxxxyz*z
    v33      = L_xxxyy + L_xxxyyz*z
    v34      = 3.0d0*y
    v36      = 0.0416666666666667d0*x
    v38      = L_xxyyy + L_xxyyyz*z
    v41      = 4.0d0*y
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    L_yzz    = -(L_xxy + L_yyy)
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    L_xyzz   = -(L_xxxy + L_xyyy)
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    L_xxxxzz = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz = -(L_xxzzzz + L_yyzzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v30      = a2
    v31      = 0.0833333333333333d0*v30
    a3       = a1*a2
    v27      = 0.0833333333333333d0*a3
    a4       = a2*a2
    v12      = 0.0416666666666667d0*a4
    a5       = a2*a3
    v0       = 0.00833333333333333d0*a5
    a6       = a3*a3
    b2       = b1*b1
    v17      = b2
    v18      = 0.0833333333333333d0*v17
    v32      = 3.0d0*v17
    v39      = 6.0d0*v17
    b3       = b1*b2
    v13      = b3
    v14      = 0.0833333333333333d0*v13
    v37      = 4.0d0*v13
    b4       = b2*b2
    v9       = b4
    v10      = 0.0416666666666667d0*v9
    b5       = b2*b3
    v1       = 0.00833333333333333d0*b5
    b6       = b3*b3
    c2       = c1*c1
    v2       = c2
    v3       = 0.5d0*v2
    v20      = 3.0d0*v2
    v24      = 12.0d0*v2
    v35      = 2.0d0*L_xxxy + L_xxxyz*v15 + L_xxxyzz*v2
    v40      = 2.0d0*L_xxyy + L_xxyyz*v15 + L_xxyyzz*v2
    v16      = 2.0d0*L_xyyy + L_xyyyz*v15 + L_xyyyzz*v2
    h        = v17 + v2 + v30
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
    u12      = u6*u6
    u13      = u6*u7
    c3       = c1*c2
    v4       = c3
    v5       = 0.166666666666667d0*v4
    v25      = 4.0d0*v4
    v42      = 6.0d0*L_xxy + L_xxyz*v19 + L_xxyzz*v20 + L_xxyzzz*v4
    v21      = 6.0d0*L_xyy + L_xyyz*v19 + L_xyyzz*v20 + L_xyyzzz*v4
    c4       = c2*c2
    v6       = c4
    v7       = 0.0416666666666667d0*v6
    v26      = 24.0d0*L_xy + L_xyz*v23 + L_xyzz*v24 + L_xyzzz*v25 + L_xyzzzz*v6
    c5       = c2*c3
    v8       = 0.00833333333333333d0*c5
    Phi_x    = L_x + L_xxxxxx*v0 + L_xyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v8 + v10*v11 + v12*(L_xxxxx + L_xxxxxy*y + &
      L_xxxxxz*z) + v14*v16 + v18*v21 + v22*v26 + v27*(2.0d0*L_xxxx + &
      L_xxxxyy*v17 + L_xxxxz*v15 + L_xxxxzz*v2 + v28*v29) + v31*(6.0d0* &
      L_xxx + L_xxxyyy*v13 + L_xxxz*v19 + L_xxxzz*v20 + L_xxxzzz*v4 + &
      v32*v33 + v34*v35) + v36*(24.0d0*L_xx + L_xxyyyy*v9 + L_xxz*v23 + &
      L_xxzz*v24 + L_xxzzz*v25 + L_xxzzzz*v6 + v37*v38 + v39*v40 + v41* &
      v42)
    Phi_y    = L_y + L_xxxxxy*v0 + L_yyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v8 + v10*(L_yyyyy + L_yyyyyz*z) + v12*( &
      L_xxxxyy*y + v29) + v14*(2.0d0*L_yyyy + L_yyyyz*v15 + L_yyyyzz*v2 &
      ) + v18*(6.0d0*L_yyy + L_yyyz*v19 + L_yyyzz*v20 + L_yyyzzz*v4) + &
      v22*(24.0d0*L_yy + L_yyz*v23 + L_yyzz*v24 + L_yyzzz*v25 + &
      L_yyzzzz*v6) + v27*(L_xxxyyy*v17 + v28*v33 + v35) + v31*(L_xxyyyy &
      *v13 + v32*v38 + v34*v40 + v42) + v36*(L_xyyyyy*v9 + v11*v37 + &
      v16*v39 + v21*v41 + v26)
    Phi_z    = L_z + L_xxxxxz*v0 + L_yyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v8 + v10*(L_yyyyz + L_yyyyzz*z) + v12*( &
      L_xxxxyz*y + L_xxxxz + L_xxxxzz*z) + v14*(2.0d0*L_yyyz + L_yyyzz* &
      v15 + L_yyyzzz*v2) + v18*(6.0d0*L_yyz + L_yyzz*v19 + L_yyzzz*v20 &
      + L_yyzzzz*v4) + v22*(24.0d0*L_yz + L_yzz*v23 + L_yzzz*v24 + &
      L_yzzzz*v25 + L_yzzzzz*v6) + v27*(L_xxxyyz*v17 + 2.0d0*L_xxxz + &
      L_xxxzz*v15 + L_xxxzzz*v2 + v28*(L_xxxyz + L_xxxyzz*z)) + v31*( &
      L_xxyyyz*v13 + 6.0d0*L_xxz + L_xxzz*v19 + L_xxzzz*v20 + L_xxzzzz* &
      v4 + v32*(L_xxyyz + L_xxyyzz*z) + v34*(2.0d0*L_xxyz + L_xxyzz*v15 &
      + L_xxyzzz*v2)) + v36*(L_xyyyyz*v9 + 24.0d0*L_xz + L_xzz*v23 + &
      L_xzzz*v24 + L_xzzzz*v25 + L_xzzzzz*v6 + v37*(L_xyyyz + L_xyyyzz* &
      z) + v39*(2.0d0*L_xyyz + L_xyyzz*v15 + L_xyyzzz*v2) + v41*(6.0d0* &
      L_xyz + L_xyzz*v19 + L_xyzzz*v20 + L_xyzzzz*v4))
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
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  L_xxxxxz            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  L_xxxyyy            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
    end subroutine mom_es_L2P
    
! OPS  397*ADD + 519*MUL + 44*NEG + 69*SUB = 1029  (1719 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v19, v2, v20, v21, v22, v23, v24, v25,&
                v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36,&
                v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47,&
                v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58,&
                v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7,&
                v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80,&
                v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91,&
                v92, v93, v94, v95, v96, v97, v98, v99, h, u, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xyyy, S_xyyz, S_yyyy, S_yyyz, S_xxxxx,&
                S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy,&
                S_xyyyz, S_yyyyy, S_yyyyz
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define z                    r(3)
#define M_xx                 M(1)
#define Ms_xx                Ms(1)
#define Ms_xy                Ms(2)
#define M_xy                 M(2)
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
#define Ms_xyy               Ms(9)
#define M_xyy                M(9)
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
#define M_xxyy               M(16)
#define Ms_xxyy              Ms(16)
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
#define Ms_xxxxx             Ms(22)
#define M_xxxxx              M(22)
#define Ms_xxxxy             Ms(23)
#define M_xxxxy              M(23)
#define Ms_xxxxz             Ms(24)
#define M_xxxxz              M(24)
#define Ms_xxxyy             Ms(25)
#define M_xxxyy              M(25)
#define M_xxxyz              M(26)
#define Ms_xxxyz             Ms(26)
#define Ms_xxyyy             Ms(27)
#define M_xxyyy              M(27)
#define Ms_xxyyz             Ms(28)
#define M_xxyyz              M(28)
#define Ms_xyyyy             Ms(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define Ms_xyyyz             Ms(30)
#define M_yyyyy              M(31)
#define Ms_yyyyy             Ms(31)
#define Ms_yyyyz             Ms(32)
#define M_yyyyz              M(32)
    v0       = x*y
    v1       = x*z
    v2       = y*z
    v3       = v0*z
    v11      = M_xx*x
    v12      = M_xy*y
    v13      = M_xz*z
    v16      = M_xy*x
    v17      = M_yy*y
    v18      = M_yz*z
    v19      = M_xx*z
    v20      = M_xz*x
    v21      = M_yy*z
    v22      = M_yz*y
    v33      = M_xxx*x
    v34      = 1.71428571428571d0*y
    v35      = M_xxy*v34
    v36      = M_xxz*z
    v42      = 0.857142857142857d0*M_xyz
    v45      = M_xxy*x
    v48      = M_xyy*y
    v50      = 3.0d0*M_xx
    v51      = M_xxx*z
    v52      = M_xxz*x
    v54      = M_xyy*z
    v55      = 3.0d0*M_xz
    v61      = 1.71428571428571d0*x
    v62      = M_xyy*v61
    v63      = M_yyy*y
    v64      = M_yyz*z
    v67      = M_xxy*z
    v70      = M_yyy*z
    v71      = M_yyz*y
    v77      = 3.0d0*M_yz
    v83      = M_xxxx*x
    v84      = M_xxxy*y
    v85      = M_xxxz*z
    v87      = M_xxyy*x
    v97      = M_yyyy*x
    v108     = M_xxxx*y
    v109     = M_xxxy*x
    v112     = M_xxyy*y
    v113     = M_xxyz*z
    v124     = M_yyyy*y
    v128     = M_xxyy*z
    v137     = M_xxxx*z
    v138     = M_xxxz*x
    v140     = M_xxyz*y
    v149     = M_yyyy*z
    v157     = M_xyyy*y
    v158     = M_xyyz*z
    v163     = M_xxxy*z
    v164     = M_xxyz*x
    v168     = M_xyyy*z
    v169     = M_xyyz*y
    v170     = 3.0d0*M_xyz
    v176     = M_xyyy*x
    v177     = M_yyyz*z
    v178     = M_xyyz*x
    v179     = M_yyyz*y
    Ms_0     = Ms_0 + (M_0)
    M_zz     = -(M_xx + M_yy)
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    M_xxzz   = -(M_xxxx + M_xxyy)
    v89      = M_xxzz*x
    v102     = M_xxzz*y
    v129     = M_xxzz*z
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v98      = M_yyzz*x
    v103     = M_yyzz*y
    v132     = M_yyzz*z
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    v181     = M_xxxzz + M_xyyzz
    v155     = -0.0476190476190476d0*(M_xxxxx + v181 + v89 + v98)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -v181
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v182     = M_xxyzz + M_yyyzz
    v104     = -0.0476190476190476d0*(M_yyyyy + v102 + v103 + v182)
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    M_yzzzz  = -v182
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    S_0      = 1
    S_x      = x
    S_y      = y
    S_z      = z
    S_xy     = v0
    v29      = M_xy*S_xy
    v44      = M_xx*S_xy
    v49      = M_yy*S_xy
    v58      = M_yz*S_xy
    v69      = M_xz*S_xy
    v86      = M_xxy*S_xy
    v107     = M_xxx*S_xy
    v117     = M_xyy*S_xy
    v131     = M_xyz*S_xy
    v160     = M_yyy*S_xy
    v165     = M_xxz*S_xy
    v173     = M_yyz*S_xy
    Ms_xy    = Ms_xy + (M_0*S_xy + M_xy)
    S_xz     = v1
    v37      = M_xz*S_xz
    v57      = M_yy*S_xz
    v68      = M_xy*S_xz
    v88      = M_xxz*S_xz
    v118     = M_xyz*S_xz
    v136     = M_xxx*S_xz
    v143     = M_xyy*S_xz
    v161     = M_yyz*S_xz
    v172     = M_yyy*S_xz
    Ms_xz    = Ms_xz + (M_0*S_xz + M_xz)
    S_yz     = v2
    v39      = M_yz*S_yz
    v43      = -0.142857142857143d0*(7.0d0*v42*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v53      = M_xy*S_yz
    v66      = M_xx*S_yz
    v76      = 3.0d0*S_yz
    v93      = M_xyz*S_yz
    v114     = M_xxz*S_yz
    v125     = M_yyz*S_yz
    v139     = M_xxy*S_yz
    v148     = M_yyy*S_yz
    v162     = M_xxx*S_yz
    Ms_yz    = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz    = v3
    v99      = M_yz*S_xyz
    v119     = M_xz*S_xyz
    v130     = M_xy*S_xyz
    v133     = 0.0476190476190476d0*(18.0d0*v128 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v129 + 48.0d0*v130 + 48.0d0*v131 + 5.0d0*v132))
    Ms_xyz   = Ms_xyz + (M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v4       = a2
    a3       = a1*a2
    a4       = a2*a2
    v24      = a4
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v5       = b2
    v60      = v4*v5
    b3       = b1*b2
    b4       = b2*b2
    v74      = b4
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v4 + v5
    v6       = 0.333333333333333d0*h
    v7       = -v6
    v8       = v4 + v7
    v9       = v5 + v7
    v10      = -0.6d0*h
    v14      = -0.2d0*h
    v15      = v14 + v4
    v23      = v14 + v5
    v25      = h*h
    v26      = 0.0857142857142857d0*v25
    v27      = h*v4
    v40      = -0.428571428571429d0*h
    v41      = v4 + v40
    v59      = 0.142857142857143d0*h
    v65      = -v59
    v73      = v40 + v5
    v75      = h*v5
    v78      = 0.238095238095238d0*v25
    v100     = 0.0476190476190476d0*v25
    v101     = 0.333333333333333d0*(-2.0d0*v27) + v100 + v24
    v154     = -0.111111111111111d0*v27
    v175     = v60 + 0.111111111111111d0*(-v75)
    v180     = 0.333333333333333d0*(-2.0d0*v75) + v100 + v74
    S_xx     = v8
    v30      = M_yy*S_xx
    v32      = M_xx*S_xx
    v46      = M_xy*S_xx
    v72      = M_yz*S_xx
    v81      = M_xxx*S_xx
    v91      = M_xyy*S_xx
    v110     = M_xxy*S_xx
    v122     = M_yyy*S_xx
    v141     = M_xxz*S_xx
    v150     = M_yyz*S_xx
    Ms_xx    = Ms_xx + (M_0*S_xx + M_xx)
    S_yy     = v9
    v28      = M_xx*S_yy
    v31      = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v29 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v28 + 4.0d0*v30))
    v38      = M_yy*S_yy
    v47      = M_xy*S_yy
    v56      = M_xz*S_yy
    v82      = M_xxx*S_yy
    v92      = M_xyy*S_yy
    v111     = M_xxy*S_yy
    v123     = M_yyy*S_yy
    v142     = M_xxz*S_yy
    v151     = M_yyz*S_yy
    Ms_yy    = Ms_yy + (M_0*S_yy + M_yy)
    S_zz     = -(S_xx + S_yy)
    S_xxx    = x*(v10 + v4)
    v79      = M_xx*S_xxx
    v95      = M_yy*S_xxx
    v115     = M_xy*S_xxx
    v144     = M_xz*S_xxx
    v174     = M_yz*S_xxx
    Ms_xxx   = Ms_xxx + (0.2d0*(9.0d0*v11 + 3.0d0*(-2.0d0*v12 - 2.0d0*v13)) + M_0*S_xxx + M_xxx)
    S_xxy    = v15*y
    v90      = M_xy*S_xxy
    v105     = M_xx*S_xxy
    v120     = M_yy*S_xxy
    v152     = M_yz*S_xxy
    Ms_xxy   = Ms_xxy + (0.2d0*(8.0d0*v16 + 2.0d0*(-v17 - v18)) + M_0*S_xxy + M_xx*y + M_xxy)
    S_xxz    = v15*z
    v94      = M_xz*S_xxz
    v126     = M_yz*S_xxz
    v134     = M_xx*S_xxz
    v146     = M_yy*S_xxz
    v166     = M_xy*S_xxz
    Ms_xxz   = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v19 + 8.0d0*v20 + 2.0d0*(v21 - v22)))
    S_xyy    = v23*x
    v80      = M_xx*S_xyy
    v96      = M_yy*S_xyy
    v116     = M_xy*S_xyy
    v145     = M_xz*S_xyy
    Ms_xyy   = Ms_xyy + (0.2d0*(8.0d0*v12 + 2.0d0*(-v11 - v13)) + M_0*S_xyy + M_xyy + M_yy*x)
    S_xzz    = -(S_xxx + S_xyy)
    S_yyy    = y*(v10 + v5)
    v106     = M_xx*S_yyy
    v121     = M_yy*S_yyy
    v153     = M_yz*S_yyy
    v156     = M_xy*S_yyy
    v171     = M_xz*S_yyy
    Ms_yyy   = Ms_yyy + (0.2d0*(9.0d0*v17 + 3.0d0*(-2.0d0*v16 - 2.0d0*v18)) + M_0*S_yyy + M_yyy)
    S_yyz    = v23*z
    v127     = M_yz*S_yyz
    v135     = M_xx*S_yyz
    v147     = M_yy*S_yyz
    v159     = M_xz*S_yyz
    v167     = M_xy*S_yyz
    Ms_yyz   = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v21 + 8.0d0*v22 + 2.0d0*(v19 - v20)))
    S_yzz    = -(S_xxy + S_yyy)
    S_zzz    = -(S_xxz + S_yyz)
    S_xxxx   = 0.142857142857143d0*(-6.0d0*v27) + v24 + v26
    Ms_xxxx  = Ms_xxxx + (M_0*S_xxxx + v31 - v35 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v32 + 80.0d0*v33 - 60.0d0*v36 - 96.0d0*v37 + &
      24.0d0*(v38 + v39)))
    S_xxxy   = v0*v41
    Ms_xxxy  = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + v43 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v44 + 5.0d0*v45 + 5.0d0*v46 - 2.0d0*v47 - 2.0d0*v48 - 2.0d0*v49)))
    S_xxxz   = v1*v41
    Ms_xxxz  = Ms_xxxz + (0.142857142857143d0*(13.0d0*v51 + 15.0d0*v52 + 6.0d0*(-v53 + v54 + v56 + &
      v57 - v58)) + M_0*S_xxxz + M_xxxz + S_xx*v55 + S_xz*v50 - v42*y)
    S_xxyy   = 0.0285714285714286d0*v25 - v4*v59 - v5*v59 + v60
    Ms_xxyy  = Ms_xxyy + (M_0*S_xxyy + v35 + v62 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v29 + 39.0d0*(v28 + v30) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v32 + 10.0d0*v33 + 10.0d0*v36 + 12.0d0*v37 + 12.0d0*v38 + &
      12.0d0*v39 + 10.0d0*v63 + 10.0d0*v64)))
    S_xxyz   = v2*(v4 + v65)
    Ms_xxyz  = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v68 + v69) + 2.0d0*(v70 - v71) + 9.0d0*(v66 &
      + v67 + v72)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v61)
    S_xyyy   = v0*v73
    Ms_xyyy  = Ms_xyyy + (M_0*S_xyyy + M_xyyy + M_yyy*x + v43 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v44 - 2.0d0*v45 - 2.0d0*v46 + 5.0d0*v47 + 5.0d0*v48 + 5.0d0*v49 &
      )))
    S_xyyz   = v1*(v5 + v65)
    Ms_xyyz  = Ms_xyyz + (0.142857142857143d0*(2.0d0*(v51 - v52) + 12.0d0*(v53 + v58) + 9.0d0*(v54 &
      + v56 + v57)) + M_0*S_xyyz + M_xyyz + M_xyz*v34 + M_yyz*x)
    S_yyyy   = 0.142857142857143d0*(-6.0d0*v75) + v26 + v74
    Ms_yyyy  = Ms_yyyy + (M_0*S_yyyy + v31 - v62 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v38 - 96.0d0*v39 + 80.0d0*v63 - 60.0d0*v64 + &
      24.0d0*(v32 + v37)))
    S_yyyz   = v2*v73
    Ms_yyyz  = Ms_yyyz + (0.142857142857143d0*(13.0d0*v70 + 15.0d0*v71 + 6.0d0*(v66 + v67 - v68 - &
      v69 + v72)) + M_0*S_yyyz + M_yy*v76 + M_yyyz + S_yy*v77 - v42*x)
    S_xxxxx  = x*(0.111111111111111d0*(-10.0d0*v27) + v24 + v78)
    Ms_xxxxx = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v83 &
      - 30.0d0*(M_xxxyy + v87) + 330.0d0*(v79 + v81) - 140.0d0*(v84 + &
      v85) + 60.0d0*(v80 + v82 + v91 + v95) - 300.0d0*(v86 + v88 + v90 &
      + v94) + 120.0d0*(v92 + v93 + v96 + v99) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v89 + v97 + v98)))
    S_xxxxy  = v101*y
    Ms_xxxxy = Ms_xxxxy + (M_0*S_xxxxy + v104 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v108) + &
      78.0d0*(v105 + v110) + 4.0d0*(v106 + v122) + 56.0d0*(v107 + v109 &
      + v115) + 8.0d0*(v121 + v123 + v125 + v127) - (2.0d0*M_xxyyy + &
      24.0d0*v111 + 30.0d0*v112 + 28.0d0*v113 + 28.0d0*v114 + 48.0d0* &
      v116 + 48.0d0*v117 + 48.0d0*v118 + 48.0d0*v119 + 24.0d0*v120 + &
      v124 + 28.0d0*v126)))
    S_xxxxz  = v101*z
    Ms_xxxxz = Ms_xxxxz + (M_0*S_xxxxz + v133 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v137 &
      + 56.0d0*v138 + 106.0d0*(v134 + v141) + 4.0d0*(v135 + v150) + &
      104.0d0*(v136 + v144) + 32.0d0*(v142 + v146) + 48.0d0*(v143 + &
      v145) + 8.0d0*(v147 + v151) - (M_yyyyz + 36.0d0*v139 + 28.0d0* &
      v140 + 8.0d0*v148 + 5.0d0*v149 + 36.0d0*v152 + 8.0d0*v153)))
    S_xxxyy  = x*(-v5*v6 + v100 + v154 + v60)
    Ms_xxxyy = Ms_xxxyy + (M_0*S_xxxyy + v155 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v83 + &
      112.0d0*v84 - 14.0d0*v85 + 141.0d0*v87 - 3.0d0*(M_xyyyy + v97) + &
      159.0d0*(v80 + v91) + 75.0d0*(v82 + v95) + 276.0d0*(v86 + v90) - &
      18.0d0*(v79 + v81 + v88 + v94) - 60.0d0*(v92 + v93 + v96 + v99) - &
      42.0d0*(v156 + v157 + v158 + v159 + v160 + v161)))
    S_xxxyz  = v3*v8
    Ms_xxxyz = Ms_xxxyz + (0.333333333333333d0*(9.0d0*M_xxy*S_xz + 5.0d0*(v162 + v163 + v174) + &
      7.0d0*(v164 + v165 + v166) + 2.0d0*(-v167 + v168 - v169 + v171 + &
      v172 - v173)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + S_xx*v170 + &
      S_xxy*v55 + S_xyz*v50)
    S_xxyyy  = y*(-v4*v6 + v100 + v175)
    Ms_xxyyy = Ms_xxyyy + (M_0*S_xxyyy + v104 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v112 &
      - 17.0d0*v124 + 112.0d0*v176 - 14.0d0*v177 - 3.0d0*(M_xxxxy + &
      v108) + 75.0d0*(v106 + v122) + 159.0d0*(v111 + v120) + 276.0d0*( &
      v116 + v117) - 60.0d0*(v105 + v110 + v118 + v119) - 18.0d0*(v121 &
      + v123 + v125 + v127) - 42.0d0*(v107 + v109 + v113 + v114 + v115 &
      + v126)))
    S_xxyyz  = z*(0.0158730158730159d0*v25 + v154 + v175)
    Ms_xxyyz = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v130 + v131) + 9.0d0*(v137 + v149) + 112.0d0*(v140 + v178) + &
      6.0d0*(v136 + v144 + v148 + v153) + 132.0d0*(v139 + v143 + v145 + &
      v152) + 81.0d0*(v128 + v135 + v142 + v146 + v150) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v129 + 5.0d0*v132 + 6.0d0* &
      v134 + 14.0d0*v138 + 6.0d0*v141 + 6.0d0*v147 + 6.0d0*v151 + &
      14.0d0*v179)))
    S_xyyyy  = v180*x
    Ms_xyyyy = Ms_xyyyy + (M_0*S_xyyyy + v155 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v97) + &
      4.0d0*(v82 + v95) + 78.0d0*(v92 + v96) + 56.0d0*(v156 + v157 + &
      v160) + 8.0d0*(v79 + v81 + v88 + v94) - (2.0d0*M_xxxyy + 28.0d0* &
      v158 + 28.0d0*v159 + 28.0d0*v161 + 24.0d0*v80 + v83 + 48.0d0*v86 &
      + 30.0d0*v87 + 48.0d0*v90 + 24.0d0*v91 + 48.0d0*v93 + 48.0d0*v99 &
      )))
    S_xyyyz  = v3*v9
    Ms_xyyyz = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v167 + v169 + v173) + &
      5.0d0*(v168 + v171 + v172) + 2.0d0*(v162 + v163 - v164 - v165 - &
      v166 + v174)) + M_0*S_xyyyz + M_xyy*v76 + M_xyyyz + M_yyyz*x + &
      S_xyy*v77 + S_yy*v170)
    S_yyyyy  = y*(0.111111111111111d0*(-10.0d0*v75) + v74 + v78)
    Ms_yyyyy = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v124 &
      - 30.0d0*(M_xxyyy + v112) + 330.0d0*(v121 + v123) - 140.0d0*(v176 &
      + v177) + 120.0d0*(v105 + v110 + v118 + v119) + 60.0d0*(v106 + &
      v111 + v120 + v122) - 300.0d0*(v116 + v117 + v125 + v127) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v102 + v103 + v108)))
    S_yyyyz  = v180*z
    Ms_yyyyz = Ms_yyyyz + (M_0*S_yyyyz + v133 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v149 &
      + 56.0d0*v179 + 8.0d0*(v134 + v141) + 32.0d0*(v135 + v150) + &
      48.0d0*(v139 + v152) + 4.0d0*(v142 + v146) + 106.0d0*(v147 + v151 &
      ) + 104.0d0*(v148 + v153) - (M_xxxxz + 8.0d0*v136 + 5.0d0*v137 + &
      36.0d0*v143 + 8.0d0*v144 + 36.0d0*v145 + 28.0d0*v178)))
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  x                   
#undef  z                   
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
#undef  Ms_xxx              
#undef  M_xxx               
#undef  M_xxy               
#undef  Ms_xxy              
#undef  Ms_xxz              
#undef  M_xxz               
#undef  Ms_xyy              
#undef  M_xyy               
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
#undef  M_xxyy              
#undef  Ms_xxyy             
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
#undef  Ms_xxyyy            
#undef  M_xxyyy             
#undef  Ms_xxyyz            
#undef  M_xxyyz             
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  M_yyyyy             
#undef  Ms_yyyyy            
#undef  Ms_yyyyz            
#undef  M_yyyyz             
    end subroutine mom_es_M2M_add
    
! OPS  523*ADD + 2*DIV + 787*MUL + 72*NEG + POW + 20*SUB = 1405  (1959 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70,&
                v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81,&
                v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92,&
                v93, v94, v95, v96, v97, v98, v99, h, u, D_x, D_y, D_z, D_xx,&
                D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy,&
                D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy,&
                D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz,&
                D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx,&
                D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz,&
                D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz,&
                D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz,&
                D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz,&
                D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz,&
                D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz,&
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, M_zz, M_xzz, M_yzz,&
                M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz
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
#define L_yz                 L(7)
#define M_xxy                M(7)
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
#define M_xxxx               M(13)
#define L_yyy                L(13)
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
#define L_xxyz               L(19)
#define M_xyyz               M(19)
#define L_xyyy               L(20)
#define M_yyyy               M(20)
#define M_yyyz               M(21)
#define L_xyyz               L(21)
#define L_yyyy               L(22)
#define M_xxxxx              M(22)
#define M_xxxxy              M(23)
#define L_yyyz               L(23)
#define L_xxxxx              L(24)
#define M_xxxxz              M(24)
#define M_xxxyy              M(25)
#define L_xxxxy              L(25)
#define L_xxxxz              L(26)
#define M_xxxyz              M(26)
#define L_xxxyy              L(27)
#define M_xxyyy              M(27)
#define L_xxxyz              L(28)
#define M_xxyyz              M(28)
#define M_xyyyy              M(29)
#define L_xxyyy              L(29)
#define L_xxyyz              L(30)
#define M_xyyyz              M(30)
#define M_yyyyy              M(31)
#define L_xyyyy              L(31)
#define L_xyyyz              L(32)
#define M_yyyyz              M(32)
#define L_yyyyy              L(33)
#define L_yyyyz              L(34)
#define L_xxxxxx             L(35)
#define L_xxxxxy             L(36)
#define L_xxxxxz             L(37)
#define L_xxxxyy             L(38)
#define L_xxxxyz             L(39)
#define L_xxxyyy             L(40)
#define L_xxxyyz             L(41)
#define L_xxyyyy             L(42)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define L_xyyyyz             L(45)
#define L_yyyyyy             L(46)
#define L_yyyyyz             L(47)
    v159     = y*z
    v153     = 15.0d0*v159
    v155     = x*y
    v157     = v159
    v57      = 0.5d0*M_xx
    v65      = 0.166666666666667d0*M_xxx
    v66      = 0.5d0*M_xxy
    v67      = 0.5d0*M_xxz
    v83      = 0.0416666666666667d0*M_xxxx
    v84      = 0.166666666666667d0*M_xxxy
    v85      = 0.166666666666667d0*M_xxxz
    v86      = 0.25d0*M_xxyy
    v87      = 0.5d0*M_xxyz
    v102     = 0.5d0*M_yy
    v104     = 0.166666666666667d0*M_yyy
    v109     = 0.0416666666666667d0*M_yyyy
    v118     = 0.00833333333333333d0*M_xxxxx
    v119     = 0.0416666666666667d0*M_xxxxy
    v120     = 0.0416666666666667d0*M_xxxxz
    v121     = 0.0833333333333333d0*M_xxxyy
    v122     = 0.166666666666667d0*M_xxxyz
    v124     = 0.0833333333333333d0*M_xxyyy
    v125     = 0.25d0*M_xxyyz
    v128     = 0.00833333333333333d0*M_yyyyy
    v129     = 0.0416666666666667d0*M_yyyyz
    v130     = 0.166666666666667d0*M_yyyz
    v132     = 0.5d0*M_yyz
    v139     = 0.5d0*M_xyy
    v141     = 0.166666666666667d0*M_xyyy
    v143     = 0.0416666666666667d0*M_xyyyy
    M_zz     = -(M_xx + M_yy)
    v135     = 0.5d0*M_zz
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    v140     = 0.5d0*M_yzz
    M_zzz    = -(M_xxz + M_yyz)
    v136     = 0.166666666666667d0*M_zzz
    M_xxzz   = -(M_xxxx + M_xxyy)
    v88      = 0.25d0*M_xxzz
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v133     = 0.25d0*M_yyzz
    M_yzzz   = -(M_xxyz + M_yyyz)
    v142     = 0.166666666666667d0*M_yzzz
    M_zzzz   = -(M_xxzz + M_yyzz)
    v137     = 0.0416666666666667d0*M_zzzz
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    v123     = 0.0833333333333333d0*M_xxxzz
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    v126     = 0.25d0*M_xxyzz
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    v127     = 0.0833333333333333d0*M_xxzzz
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v131     = 0.0833333333333333d0*M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    v134     = 0.0833333333333333d0*M_yyzzz
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    v144     = 0.0416666666666667d0*M_yzzzz
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    v138     = 0.00833333333333333d0*M_zzzzz
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v145     = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v145
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v146     = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v146
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v100     = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v147     = 3.0d0*h
    v148     = h*v0
    v149     = h*v1
    v158     = 21.0d0*h
    v4       = -h
    v12      = v147
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v148
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v149
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 + 630.0d0*v148 - 945.0d0*v19
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 + 630.0d0*v149 - 945.0d0*v31
    v46      = h*h*h
    v47      = -5.0d0*v46
    v48      = 315.0d0*h
    v49      = v0*v17
    v51      = 5.0d0*v17
    v53      = v21 + v51 + v52
    v55      = -(126.0d0*v1*v20 + v46)
    v60      = -v0*v12
    v61      = -v1*v12
    v62      = v17 + 33.0d0*v27
    v74      = v1*v17
    v101     = v100 + v33 + v51
    u2       = 1.0/h
    u        = sqrt(u2)
    u3       = u*u2
    v2       = u3
    D_x      = -v2*x
    D_y      = -v2*y
    D_z      = -v2*z
    u4       = u2*u2
    u5       = u2*u3
    v3       = u5
    v150     = 3.0d0*v3
    v6       = v150*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v150*v157
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v151     = 3.0d0*v8
    v9       = v8*x
    v11      = v151*(h - v10)
    D_xxx    = -3.0d0*v9*(v145 - v147)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    D_xyz    = -v153*v9
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = v151*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v152     = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v152*y
    v26      = v152*z
    v28      = v15*v153
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v89      = 0.5d0*D_xxyy
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    v95      = 0.5d0*D_xxzz
    D_xyyy   = v22*v30
    D_xyyz   = v26*(v29 + v4)
    D_xyzz   = -(D_xxxy + D_xyyy)
    v113     = 0.5d0*D_xyzz
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v160     = v34*z
    v154     = 15.0d0*v34
    v35      = v154*x
    v39      = v160
    v41      = 315.0d0*v155*v160
    v42      = v154*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx  = L_xxxxx + (D_xxxxx*M_0)
    D_xxxxy  = v34*v38*y
    L_xxxxy  = L_xxxxy + (D_xxxxy*M_0)
    D_xxxxz  = v38*v39
    L_xxxxz  = L_xxxxz + (D_xxxxz*M_0)
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    v68      = 0.5d0*D_xxxyy
    L_xxxyy  = L_xxxyy + (D_xxxyy*M_0)
    D_xxxyz  = v41*(h - v5)
    L_xxxyz  = L_xxxyz + (D_xxxyz*M_0)
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    v71      = 0.5d0*D_xxxzz
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    v77      = 0.5d0*D_xxyyy
    v90      = 0.166666666666667d0*D_xxyyy
    L_xxyyy  = L_xxyyy + (D_xxyyy*M_0)
    D_xxyyz  = v39*(v36 - 945.0d0*v146 + 105.0d0*(v148 + v149))
    v93      = 0.5d0*D_xxyyz
    L_xxyyz  = L_xxyyz + (D_xxyyz*M_0)
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    v80      = 0.5d0*D_xxyzz
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    v96      = 0.166666666666667d0*D_xxzzz
    v98      = 0.5d0*D_xxzzz
    D_xyyyy  = v34*v43*x
    L_xyyyy  = L_xyyyy + (D_xyyyy*M_0)
    D_xyyyz  = v41*(h - v7)
    v111     = 0.5d0*D_xyyyz
    L_xyyyz  = L_xyyyz + (D_xyyyz*M_0)
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    v106     = 0.5d0*D_xyyzz
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    v114     = 0.166666666666667d0*D_xyzzz
    v116     = 0.5d0*D_xyzzz
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    L_yyyyy  = L_yyyyy + (D_yyyyy*M_0)
    D_yyyyz  = v39*v43
    L_yyyyz  = L_yyyyz + (D_yyyyz*M_0)
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v161     = 315.0d0*v44
    v156     = v161*x
    v45      = 45.0d0*v44
    v50      = v156*y
    v54      = v156*z
    v56      = v157*v161
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = L_xxxxxx + (D_xxxxxx*M_0)
    D_xxxxxy = v50*v53
    L_xxxxxy = L_xxxxxy + (D_xxxxxy*M_0)
    D_xxxxxz = v53*v54
    L_xxxxxz = L_xxxxxz + (D_xxxxxz*M_0)
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 - v158*v19 + v17*v29 + 14.0d0*v49)
    v58      = 0.5d0*D_xxxxyy
    L_xxxxyy = L_xxxxyy + (D_xxxxyy*M_0)
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxyz = L_xxxxyz + (D_xxxxyz*M_0)
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    v59      = 0.5d0*D_xxxxzz
    L_xxxx   = L_xxxx + (D_xxxx*M_0 + D_xxxxxx*v57 + D_xxxxxy*M_xy + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + M_yy*v58 + M_zz*v59)
    D_xxxyyy = 945.0d0*v155*v44*(11.0d0*v27 + v17 + v60 + v61)
    v63      = 0.5d0*D_xxxyyy
    v69      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy = L_xxxyyy + (D_xxxyyy*M_0)
    D_xxxyyz = v54*(-9.0d0*v32 + v60 + v62)
    v70      = 0.5d0*D_xxxyyz
    L_xxxyyz = L_xxxyyz + (D_xxxyyz*M_0)
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    v64      = 0.5d0*D_xxxyzz
    L_xxxy   = L_xxxy + (D_xxxxxy*v57 + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + M_yy*v63 + M_zz*v64)
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    v72      = 0.166666666666667d0*D_xxxzzz
    v73      = 0.5d0*D_xxxzzz
    L_xxx    = L_xxx + (D_xxx*M_0 + D_xxxxx*v57 + D_xxxxxx*v65 + D_xxxxxy*v66 + D_xxxxxz*v67 + &
      D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz + &
      M_xyy*v58 + M_xzz*v59 + M_yy*v68 + M_yyy*v69 + M_yyz*v70 + M_yzz* &
      v64 + M_zz*v71 + M_zzz*v72)
    L_xxxz   = L_xxxz + (D_xxxxxz*v57 + D_xxxxyz*M_xy + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz* &
      M_0 + M_yy*v70 + M_zz*v73)
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 - v158*v31 + v17*v24 + 14.0d0*v74)
    v75      = 0.5d0*D_xxyyyy
    v78      = 0.166666666666667d0*D_xxyyyy
    v91      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy = L_xxyyyy + (D_xxyyyy*M_0)
    D_xxyyyz = v56*(-9.0d0*v20 + v61 + v62)
    v79      = 0.5d0*D_xxyyyz
    v92      = 0.166666666666667d0*D_xxyyyz
    L_xxyyyz = L_xxyyyz + (D_xxyyyz*M_0)
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    v76      = 0.5d0*D_xxyyzz
    v94      = 0.25d0*D_xxyyzz
    L_xxyy   = L_xxyy + (D_xxxxyy*v57 + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + M_yy*v75 + M_zz*v76)
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    v81      = 0.166666666666667d0*D_xxyzzz
    v82      = 0.5d0*D_xxyzzz
    L_xxy    = L_xxy + (D_xxxxxy*v65 + D_xxxxy*v57 + D_xxxxyy*v66 + D_xxxxyz*v67 + D_xxxyy*M_xy &
      + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + &
      M_xyy*v63 + M_xzz*v64 + M_yy*v77 + M_yyy*v78 + M_yyz*v79 + M_yzz* &
      v76 + M_zz*v80 + M_zzz*v81)
    L_xxyz   = L_xxyz + (D_xxxxyz*v57 + D_xxxyyz*M_xy + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz* &
      M_0 + M_yy*v79 + M_zz*v82)
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    v97      = 0.0416666666666667d0*D_xxzzzz
    v99      = 0.166666666666667d0*D_xxzzzz
    L_xx     = L_xx + (D_xx*M_0 + D_xxxx*v57 + D_xxxxx*v65 + D_xxxxxx*v83 + D_xxxxxy*v84 + &
      D_xxxxxz*v85 + D_xxxxy*v66 + D_xxxxyy*v86 + D_xxxxyz*v87 + &
      D_xxxxz*v67 + D_xxxxzz*v88 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz &
      *M_xz + D_xxyz*M_yz + M_xyy*v68 + M_xyyy*v69 + M_xyyz*v70 + &
      M_xyzz*v64 + M_xzz*v71 + M_xzzz*v72 + M_yy*v89 + M_yyy*v90 + &
      M_yyyy*v91 + M_yyyz*v92 + M_yyz*v93 + M_yyzz*v94 + M_yzz*v80 + &
      M_yzzz*v81 + M_zz*v95 + M_zzz*v96 + M_zzzz*v97)
    L_xxz    = L_xxz + (D_xxxxxz*v65 + D_xxxxyz*v66 + D_xxxxz*v57 + D_xxxxzz*v67 + D_xxxyz*M_xy &
      + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_xyy*v70 + M_xzz*v73 + M_yy*v93 + M_yyy*v92 + M_yyz*v76 + M_yzz* &
      v82 + M_zz*v98 + M_zzz*v99)
    D_xyyyyy = v101*v50
    L_xyyyyy = L_xyyyyy + (D_xyyyyy*M_0)
    D_xyyyyz = v54*(-18.0d0*v32 + v100 + v17)
    v105     = 0.5d0*D_xyyyyz
    v110     = 0.166666666666667d0*D_xyyyyz
    L_xyyyyz = L_xyyyyz + (D_xyyyyz*M_0)
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    v103     = 0.5d0*D_xyyyzz
    v112     = 0.25d0*D_xyyyzz
    L_xyyy   = L_xyyy + (D_xxxyyy*v57 + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy* &
      v102 + D_xyyyyz*M_yz + M_zz*v103)
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    v107     = 0.166666666666667d0*D_xyyzzz
    v108     = 0.5d0*D_xyyzzz
    L_xyy    = L_xyy + (D_xxxxyy*v65 + D_xxxyy*v57 + D_xxxyyy*v66 + D_xxxyyz*v67 + D_xxyyy*M_xy &
      + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v102 + &
      D_xyyyyy*v104 + D_xyyyz*M_yz + M_xyy*v75 + M_xzz*v76 + M_yyz*v105 &
      + M_yzz*v103 + M_zz*v106 + M_zzz*v107)
    L_xyyz   = L_xyyz + (D_xxxyyz*v57 + D_xxyyyz*M_xy + D_xxyyzz*M_xz + D_xyyyyz*v102 + D_xyyyzz* &
      M_yz + D_xyyz*M_0 + M_zz*v108)
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    v115     = 0.0416666666666667d0*D_xyzzzz
    v117     = 0.166666666666667d0*D_xyzzzz
    L_xy     = L_xy + (D_xxxxxy*v83 + D_xxxxy*v65 + D_xxxxyy*v84 + D_xxxxyz*v85 + D_xxxy*v57 + &
      D_xxxyy*v66 + D_xxxyyy*v86 + D_xxxyyz*v87 + D_xxxyz*v67 + &
      D_xxxyzz*v88 + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy* &
      M_0 + D_xyyy*v102 + D_xyyyy*v104 + D_xyyyyy*v109 + D_xyyz*M_yz + &
      M_xyy*v77 + M_xyyy*v78 + M_xyyz*v79 + M_xyzz*v76 + M_xzz*v80 + &
      M_xzzz*v81 + M_yyyz*v110 + M_yyz*v111 + M_yyzz*v112 + M_yzz*v106 &
      + M_yzzz*v107 + M_zz*v113 + M_zzz*v114 + M_zzzz*v115)
    L_xyz    = L_xyz + (D_xxxxyz*v65 + D_xxxyyz*v66 + D_xxxyz*v57 + D_xxxyzz*v67 + D_xxyyz*M_xy &
      + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyyyz*v104 + D_xyyyz*v102 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v79 + M_xzz*v82 + M_yyz*v103 + &
      M_yzz*v108 + M_zz*v116 + M_zzz*v117)
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = L_x + (D_x*M_0 + D_xxx*v57 + D_xxxx*v65 + D_xxxxx*v83 + D_xxxxxx*v118 + &
      D_xxxxxy*v119 + D_xxxxxz*v120 + D_xxxxy*v84 + D_xxxxyy*v121 + &
      D_xxxxyz*v122 + D_xxxxz*v85 + D_xxxxzz*v123 + D_xxxy*v66 + &
      D_xxxyy*v86 + D_xxxyyy*v124 + D_xxxyyz*v125 + D_xxxyz*v87 + &
      D_xxxyzz*v126 + D_xxxz*v67 + D_xxxzz*v88 + D_xxxzzz*v127 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v102 + D_xyyy*v104 + &
      D_xyyyy*v109 + D_xyyyyy*v128 + D_xyyyyz*v129 + D_xyyyz*v130 + &
      D_xyyyzz*v131 + D_xyyz*v132 + D_xyyzz*v133 + D_xyyzzz*v134 + &
      D_xyz*M_yz + D_xzz*v135 + D_xzzz*v136 + D_xzzzz*v137 + D_xzzzzz* &
      v138 + M_xyy*v89 + M_xyyy*v90 + M_xyyyy*v91 + M_xyyyz*v92 + &
      M_xyyz*v93 + M_xyyzz*v94 + M_xyzz*v80 + M_xyzzz*v81 + M_xzz*v95 + &
      M_xzzz*v96 + M_xzzzz*v97 + M_yzz*v113 + M_yzzz*v114 + M_yzzzz* &
      v115)
    L_xz     = L_xz + (D_xxxxxz*v83 + D_xxxxyz*v84 + D_xxxxz*v65 + D_xxxxzz*v85 + D_xxxyyz*v86 &
      + D_xxxyz*v66 + D_xxxyzz*v87 + D_xxxz*v57 + D_xxxzz*v67 + &
      D_xxxzzz*v88 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + &
      D_xyyyyz*v109 + D_xyyyz*v104 + D_xyyyzz*v130 + D_xyyz*v102 + &
      D_xyyzz*v132 + D_xyyzzz*v133 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz* &
      v135 + D_xzzzz*v136 + D_xzzzzz*v137 + M_xyy*v93 + M_xyyy*v92 + &
      M_xyyz*v76 + M_xyzz*v82 + M_xzz*v98 + M_xzzz*v99 + M_yzz*v116 + &
      M_yzzz*v117)
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v74)
    L_yyyyyy = L_yyyyyy + (D_yyyyyy*M_0)
    D_yyyyyz = v101*v56
    L_yyyyyz = L_yyyyyz + (D_yyyyyz*M_0)
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = L_yyyy + (D_xxyyyy*v57 + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyy* &
      v102 + D_yyyyyz*M_yz + D_yyyyzz*v135)
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = L_yyy + (D_xxxyyy*v65 + D_xxyyy*v57 + D_xxyyyy*v66 + D_xxyyyz*v67 + D_xyyyy*M_xy &
      + D_xyyyyy*v139 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v102 + D_yyyyyy*v104 + D_yyyyyz*v132 + D_yyyyz*M_yz + &
      D_yyyyzz*v140 + D_yyyzz*v135 + D_yyyzzz*v136 + M_xzz*v103)
    L_yyyz   = L_yyyz + (D_xxyyyz*v57 + D_xyyyyz*M_xy + D_xyyyzz*M_xz + D_yyyyyz*v102 + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzzz*v135)
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = L_yy + (D_xxxxyy*v83 + D_xxxyy*v65 + D_xxxyyy*v84 + D_xxxyyz*v85 + D_xxyy*v57 + &
      D_xxyyy*v66 + D_xxyyyy*v86 + D_xxyyyz*v87 + D_xxyyz*v67 + &
      D_xxyyzz*v88 + D_xyyy*M_xy + D_xyyyy*v139 + D_xyyyyy*v141 + &
      D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v102 + D_yyyyy* &
      v104 + D_yyyyyy*v109 + D_yyyyyz*v130 + D_yyyyz*v132 + D_yyyyzz* &
      v133 + D_yyyz*M_yz + D_yyyzz*v140 + D_yyyzzz*v142 + D_yyzz*v135 + &
      D_yyzzz*v136 + D_yyzzzz*v137 + M_xyyz*v105 + M_xyzz*v103 + M_xzz* &
      v106 + M_xzzz*v107)
    L_yyz    = L_yyz + (D_xxxyyz*v65 + D_xxyyyz*v66 + D_xxyyz*v57 + D_xxyyzz*v67 + D_xyyyyz*v139 &
      + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyz*v104 + &
      D_yyyyz*v102 + D_yyyyzz*v132 + D_yyyzz*M_yz + D_yyyzzz*v140 + &
      D_yyz*M_0 + D_yyzzz*v135 + D_yyzzzz*v136 + M_xzz*v108)
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = L_y + (D_xxxxxy*v118 + D_xxxxy*v83 + D_xxxxyy*v119 + D_xxxxyz*v120 + D_xxxy*v65 &
      + D_xxxyy*v84 + D_xxxyyy*v121 + D_xxxyyz*v122 + D_xxxyz*v85 + &
      D_xxxyzz*v123 + D_xxy*v57 + D_xxyy*v66 + D_xxyyy*v86 + D_xxyyyy* &
      v124 + D_xxyyyz*v125 + D_xxyyz*v87 + D_xxyyzz*v126 + D_xxyz*v67 + &
      D_xxyzz*v88 + D_xxyzzz*v127 + D_xyy*M_xy + D_xyyy*v139 + D_xyyyy* &
      v141 + D_xyyyyy*v143 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + &
      D_yyy*v102 + D_yyyy*v104 + D_yyyyy*v109 + D_yyyyyy*v128 + &
      D_yyyyyz*v129 + D_yyyyz*v130 + D_yyyyzz*v131 + D_yyyz*v132 + &
      D_yyyzz*v133 + D_yyyzzz*v134 + D_yyz*M_yz + D_yyzz*v140 + D_yyzzz &
      *v142 + D_yyzzzz*v144 + D_yzz*v135 + D_yzzz*v136 + D_yzzzz*v137 + &
      D_yzzzzz*v138 + M_xyyyz*v110 + M_xyyz*v111 + M_xyyzz*v112 + &
      M_xyzz*v106 + M_xyzzz*v107 + M_xzz*v113 + M_xzzz*v114 + M_xzzzz* &
      v115)
    L_yz     = L_yz + (D_xxxxyz*v83 + D_xxxyyz*v84 + D_xxxyz*v65 + D_xxxyzz*v85 + D_xxyyyz*v86 &
      + D_xxyyz*v66 + D_xxyyzz*v87 + D_xxyz*v57 + D_xxyzz*v67 + &
      D_xxyzzz*v88 + D_xyyyyz*v141 + D_xyyyz*v139 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyyz*v109 + D_yyyyz*v104 + &
      D_yyyyzz*v130 + D_yyyz*v102 + D_yyyzz*v132 + D_yyyzzz*v133 + &
      D_yyzz*M_yz + D_yyzzz*v140 + D_yyzzzz*v142 + D_yz*M_0 + D_yzzz* &
      v135 + D_yzzzz*v136 + D_yzzzzz*v137 + M_xyyz*v103 + M_xyzz*v108 + &
      M_xzz*v116 + M_xzzz*v117)
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_z      = L_z + (0.0416666666666667d0*(6.0d0*D_xyyzzz*M_xyyzz + 12.0d0*D_xzzz*M_xzz + &
      D_xzzzzz*M_xzzzz + 4.0d0*(D_xyyyzz*M_xyyyz + D_xzzzz*M_xzzz)) + &
      D_xxxxxz*v118 + D_xxxxyz*v119 + D_xxxxz*v83 + D_xxxxzz*v120 + &
      D_xxxyyz*v121 + D_xxxyz*v84 + D_xxxyzz*v122 + D_xxxz*v65 + &
      D_xxxzz*v85 + D_xxxzzz*v123 + D_xxyyyz*v124 + D_xxyyz*v86 + &
      D_xxyyzz*v125 + D_xxyz*v66 + D_xxyzz*v87 + D_xxyzzz*v126 + D_xxz* &
      v57 + D_xxzz*v67 + D_xxzzz*v88 + D_xxzzzz*v127 + D_xyyyyz*v143 + &
      D_xyyyz*v141 + D_xyyz*v139 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yyyyyz*v128 + D_yyyyz*v109 + D_yyyyzz*v129 + D_yyyz*v104 &
      + D_yyyzz*v130 + D_yyyzzz*v131 + D_yyz*v102 + D_yyzz*v132 + &
      D_yyzzz*v133 + D_yyzzzz*v134 + D_yzz*M_yz + D_yzzz*v140 + D_yzzzz &
      *v142 + D_yzzzzz*v144 + D_z*M_0 + D_zzz*v135 + D_zzzz*v136 + &
      D_zzzzz*v137 + D_zzzzzz*v138 + M_xyyz*v106 + M_xyzz*v116 + &
      M_xyzzz*v117)
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
#undef  L_yz                
#undef  M_xxy               
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
#undef  M_xxxx              
#undef  L_yyy               
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
#undef  L_xxyz              
#undef  M_xyyz              
#undef  L_xyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxyz             
#undef  L_xxxyy             
#undef  M_xxyyy             
#undef  L_xxxyz             
#undef  M_xxyyz             
#undef  M_xyyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  M_yyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  L_xxxxxz            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  L_xxxyyy            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
    end subroutine mom_es_M2L_add
    
! OPS  357*ADD + 2*DIV + 411*MUL + 35*NEG + POW = 806  (1945 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v17, v18,&
                v19, v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3,&
                v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz
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
#define Ls_xxxz              Ls(17)
#define L_xxxz               L(17)
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
#define Ls_xxxxy             Ls(25)
#define L_xxxxy              L(25)
#define L_xxxxz              L(26)
#define Ls_xxxxz             Ls(26)
#define Ls_xxxyy             Ls(27)
#define L_xxxyy              L(27)
#define L_xxxyz              L(28)
#define Ls_xxxyz             Ls(28)
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
#define Ls_xxxxxx            Ls(35)
#define L_xxxxxx             L(35)
#define L_xxxxxy             L(36)
#define Ls_xxxxxy            Ls(36)
#define Ls_xxxxxz            Ls(37)
#define L_xxxxxz             L(37)
#define Ls_xxxxyy            Ls(38)
#define L_xxxxyy             L(38)
#define Ls_xxxxyz            Ls(39)
#define L_xxxxyz             L(39)
#define Ls_xxxyyy            Ls(40)
#define L_xxxyyy             L(40)
#define Ls_xxxyyz            Ls(41)
#define L_xxxyyz             L(41)
#define Ls_xxyyyy            Ls(42)
#define L_xxyyyy             L(42)
#define Ls_xxyyyz            Ls(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define Ls_xyyyyy            Ls(44)
#define L_xyyyyz             L(45)
#define Ls_xyyyyz            Ls(45)
#define L_yyyyyy             L(46)
#define Ls_yyyyyy            Ls(46)
#define Ls_yyyyyz            Ls(47)
#define L_yyyyyz             L(47)
    v0        = L_xxxxx + L_xxxxxy*y + L_xxxxxz*z
    v1        = L_xxxxy + L_xxxxyz*z
    v2        = L_xxxxyy*y + v1
    v3        = L_xxxyy + L_xxxyyz*z
    v4        = L_xxxyyy*y + v3
    v5        = L_xxyyy + L_xxyyyz*z
    v6        = L_xxyyyy*y + v5
    v7        = L_xyyyy + L_xyyyyz*z
    v8        = L_xyyyyy*y + v7
    v9        = L_yyyyy + L_yyyyyz*z
    v10       = L_xxxxz*z
    v17       = v1*y
    v19       = L_xxxyz*z
    v22       = v3*y
    v25       = L_xxxz*z
    v36       = 0.5d0*x
    v42       = L_xxyyz*z
    v45       = v5*y
    v48       = L_xxyz*z
    v59       = L_xxz*z
    v72       = 0.166666666666667d0*x
    v82       = L_xyyyz*z
    v85       = v7*y
    v88       = L_xyyz*z
    v99       = L_xyz*z
    v124      = 0.0416666666666667d0*y
    v128      = 0.0416666666666667d0*x
    v137      = L_yyyyz*z
    v140      = L_yyyz*z
    v142      = 0.5d0*y
    v146      = L_yyz*z
    v149      = 0.166666666666667d0*y
    Ls_xxxxx  = Ls_xxxxx + (L_xxxxxx*x + v0)
    Ls_xxxxy  = Ls_xxxxy + (L_xxxxxy*x + v2)
    Ls_xxxyy  = Ls_xxxyy + (L_xxxxyy*x + v4)
    Ls_xxyyy  = Ls_xxyyy + (L_xxxyyy*x + v6)
    Ls_xyyyy  = Ls_xyyyy + (L_xxyyyy*x + v8)
    Ls_yyyyy  = Ls_yyyyy + (v9 + L_xyyyyy*x + L_yyyyyy*y)
    Ls_xxxxxx = Ls_xxxxxx + (L_xxxxxx)
    Ls_xxxxxy = Ls_xxxxxy + (L_xxxxxy)
    Ls_xxxxxz = Ls_xxxxxz + (L_xxxxxz)
    Ls_xxxxyy = Ls_xxxxyy + (L_xxxxyy)
    Ls_xxxxyz = Ls_xxxxyz + (L_xxxxyz)
    Ls_xxxyyy = Ls_xxxyyy + (L_xxxyyy)
    Ls_xxxyyz = Ls_xxxyyz + (L_xxxyyz)
    Ls_xxyyyy = Ls_xxyyyy + (L_xxyyyy)
    Ls_xxyyyz = Ls_xxyyyz + (L_xxyyyz)
    Ls_xyyyyy = Ls_xyyyyy + (L_xyyyyy)
    Ls_xyyyyz = Ls_xyyyyz + (L_xyyyyz)
    Ls_yyyyyy = Ls_yyyyyy + (L_yyyyyy)
    Ls_yyyyyz = Ls_yyyyyz + (L_yyyyyz)
    L_zz      = -(L_xx + L_yy)
    L_xzz     = -(L_xxx + L_xyy)
    v130      = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v157      = L_yzz*z
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    v75       = L_xxzz*z
    L_xyzz    = -(L_xxxy + L_xyyy)
    v108      = L_xyzz*z
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    v152      = L_yyzz*z
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    v38       = L_xxxzz*z
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    v55       = L_xxyzz*z
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    v95       = L_xyyzz*z
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    v144      = L_yyyzz*z
    L_yyzzz   = -(L_xxyyz + L_yyyyz)
    L_yzzzz   = -(L_xxyzz + L_yyyzz)
    L_zzzzz   = -(L_xxzzz + L_yyzzz)
    L_xxxxzz  = -(L_xxxxxx + L_xxxxyy)
    v18       = L_xxxxz + L_xxxxyz*y + L_xxxxzz*z
    Ls_xxxxz  = Ls_xxxxz + (L_xxxxxz*x + v18)
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    v23       = L_xxxyz + L_xxxyzz*z
    v24       = L_xxxyyz*y + v23
    v41       = v23*y
    Ls_xxxyz  = Ls_xxxyz + (L_xxxxyz*x + v24)
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    v46       = L_xxyyz + L_xxyyzz*z
    v47       = L_xxyyyz*y + v46
    v58       = v46*y
    Ls_xxyyz  = Ls_xxyyz + (L_xxxyyz*x + v47)
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    v86       = L_xyyyz + L_xyyyzz*z
    v87       = L_xyyyyz*y + v86
    v98       = v86*y
    Ls_xyyyz  = Ls_xyyyz + (L_xxyyyz*x + v87)
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    v139      = L_yyyyz + L_yyyyzz*z
    Ls_yyyyz  = Ls_yyyyz + (v139 + L_xyyyyz*x + L_yyyyyz*y)
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v11       = a2
    v12       = 0.5d0*v11
    v71       = 0.25d0*v11
    v127      = 0.0833333333333333d0*v11
    a3        = a1*a2
    v26       = a3
    v27       = 0.166666666666667d0*v26
    v126      = 0.0833333333333333d0*v26
    a4        = a2*a2
    v60       = 0.0416666666666667d0*a4
    a5        = a2*a3
    v115      = 0.00833333333333333d0*a5
    a6        = a3*a3
    b2        = b1*b1
    v13       = b2
    v14       = L_xxxxyy*v13
    v20       = L_xxxyyy*v13
    v33       = 0.5d0*v13
    v39       = L_xxxyyz*v13
    v43       = L_xxyyyy*v13
    v56       = L_xxyyyz*v13
    v73       = 3.0d0*v13
    v83       = L_xyyyyy*v13
    v96       = L_xyyyyz*v13
    v123      = 0.0833333333333333d0*v13
    v148      = 0.25d0*v13
    b3        = b1*b2
    v28       = b3
    v29       = L_xxxyyy*v28
    v49       = L_xxyyyy*v28
    v67       = 0.166666666666667d0*v28
    v76       = L_xxyyyz*v28
    v89       = L_xyyyyy*v28
    v109      = L_xyyyyz*v28
    v122      = 0.0833333333333333d0*v28
    v129      = 4.0d0*v28
    b4        = b2*b2
    v61       = b4
    v62       = L_xxyyyy*v61
    v100      = L_xyyyyy*v61
    v121      = 0.0416666666666667d0*v61
    v131      = L_xyyyyz*v61
    b5        = b2*b3
    v116      = 0.00833333333333333d0*b5
    b6        = b3*b3
    c2        = c1*c1
    v15       = c2
    v117      = 0.5d0*v15
    v150      = 3.0d0*v15
    v155      = 12.0d0*v15
    v63       = L_xxzz*v15
    v101      = L_xyzz*v15
    v30       = L_xxxzz*v15
    v50       = L_xxyzz*v15
    v77       = L_xxzzz*v15
    v90       = L_xyyzz*v15
    v110      = L_xyzzz*v15
    v16       = L_xxxxzz*v15
    v37       = v14 + v16 + 2.0d0*(L_xxxx + v10 + v17)
    Ls_xxxx   = Ls_xxxx + (0.5d0*(v14 + v16) + L_xxxx + L_xxxxxx*v12 + v0*x + v10 + v17)
    v21       = L_xxxyzz*v15
    v34       = v21 + 2.0d0*(L_xxxy + v19)
    v35       = v34*y
    v54       = 2.0d0*v22 + v20 + v34
    Ls_xxxy   = Ls_xxxy + (0.5d0*(v20 + v21) + L_xxxxxy*v12 + L_xxxy + v19 + v2*x + v22)
    v40       = L_xxxzzz*v15
    v81       = v39 + v40 + 2.0d0*(L_xxxz + v38 + v41)
    Ls_xxxz   = Ls_xxxz + (0.5d0*(v39 + v40) + L_xxxxxz*v12 + L_xxxz + v18*x + v38 + v41)
    v44       = L_xxyyzz*v15
    v52       = v44 + 2.0d0*(L_xxyy + v42)
    v53       = v52*y
    v68       = v13*v52
    v94       = 2.0d0*v45 + v43 + v52
    Ls_xxyy   = Ls_xxyy + (0.5d0*(v43 + v44) + L_xxxxyy*v12 + L_xxyy + v4*x + v42 + v45)
    v57       = L_xxyzzz*v15
    v79       = v57 + 2.0d0*(L_xxyz + v55)
    v80       = v79*y
    v114      = 2.0d0*v58 + v56 + v79
    Ls_xxyz   = Ls_xxyz + (0.5d0*(v56 + v57) + L_xxxxyz*v12 + L_xxyz + v24*x + v55 + v58)
    v84       = L_xyyyzz*v15
    v92       = v84 + 2.0d0*(L_xyyy + v82)
    v93       = v92*y
    v104      = v13*v92
    Ls_xyyy   = Ls_xyyy + (0.5d0*(v83 + v84) + L_xxxyyy*v12 + L_xyyy + v6*x + v82 + v85)
    v97       = L_xyyzzz*v15
    v112      = v97 + 2.0d0*(L_xyyz + v95)
    v113      = v112*y
    v133      = v112*v13
    Ls_xyyz   = Ls_xyyz + (0.5d0*(v96 + v97) + L_xxxyyz*v12 + L_xyyz + v47*x + v95 + v98)
    v138      = L_yyyyzz*v15
    v143      = v138 + 2.0d0*(L_yyyy + v137)
    Ls_yyyy   = Ls_yyyy + (0.5d0*v138 + L_xxyyyy*v12 + L_yyyy + L_yyyyyy*v33 + v137 + v8*x + v9*y)
    v145      = L_yyyzzz*v15
    v154      = v145 + 2.0d0*(L_yyyz + v144)
    Ls_yyyz   = Ls_yyyz + (0.5d0*v145 + L_xxyyyz*v12 + L_yyyyyz*v33 + L_yyyz + v139*y + v144 + v87* &
      x)
    h         = v11 + v13 + v15
    u2        = 1.0/h
    u         = sqrt(u2)
    u3        = u*u2
    u4        = u2*u2
    u5        = u2*u3
    u6        = u3*u3
    u7        = u3*u4
    u8        = u4*u4
    u9        = u4*u5
    u10       = u5*u5
    u11       = u5*u6
    u12       = u6*u6
    u13       = u6*u7
    c3        = c1*c2
    v31       = c3
    v118      = 0.166666666666667d0*v31
    v156      = 4.0d0*v31
    v64       = L_xxzzz*v31
    v102      = L_xyzzz*v31
    v32       = L_xxxzzz*v31
    v74       = v29 + v32 + v3*v73 + 6.0d0*(L_xxx + v25) + 3.0d0*(v30 + v35)
    Ls_xxx    = Ls_xxx + (0.166666666666667d0*(v29 + v32 + 3.0d0*(v30 + v35)) + L_xxx + L_xxxxxx* &
      v27 + v0*v12 + v25 + v3*v33 + v36*v37)
    v51       = L_xxyzzz*v31
    v69       = v51 + 3.0d0*(2.0d0*L_xxy + 2.0d0*v48 + v50)
    v70       = v69*y
    v107      = v49 + v69 + v5*v73 + 3.0d0*v53
    Ls_xxy    = Ls_xxy + (0.166666666666667d0*(v49 + v51 + 3.0d0*(v50 + v53)) + L_xxxxxy*v27 + &
      L_xxy + v12*v2 + v33*v5 + v36*v54 + v48)
    v78       = L_xxzzzz*v31
    v136      = v76 + v78 + v46*v73 + 6.0d0*(L_xxz + v75) + 3.0d0*(v77 + v80)
    Ls_xxz    = Ls_xxz + (0.166666666666667d0*(v76 + v78 + 3.0d0*(v77 + v80)) + L_xxxxxz*v27 + &
      L_xxz + v12*v18 + v33*v46 + v36*v81 + v75)
    v91       = L_xyyzzz*v31
    v105      = v91 + 3.0d0*(2.0d0*L_xyy + 2.0d0*v88 + v90)
    v106      = v105*y
    Ls_xyy    = Ls_xyy + (0.166666666666667d0*(v89 + v91 + 3.0d0*(v90 + v93)) + L_xxxxyy*v27 + &
      L_xyy + v12*v4 + v33*v7 + v36*v94 + v88)
    v111      = L_xyzzzz*v31
    v134      = v111 + 3.0d0*(2.0d0*L_xyz + 2.0d0*v108 + v110)
    v135      = v134*y
    Ls_xyz    = Ls_xyz + (0.166666666666667d0*(v109 + v111 + 3.0d0*(v110 + v113)) + L_xxxxyz*v27 + &
      L_xyz + v108 + v114*v36 + v12*v24 + v33*v86)
    v141      = L_yyyzzz*v31
    v151      = v141 + L_yyyzz*v150 + 6.0d0*(L_yyy + v140)
    Ls_yyy    = Ls_yyy + (0.166666666666667d0*v141 + L_xxxyyy*v27 + L_yyy + L_yyyyyy*v67 + L_yyyzz &
      *v117 + v12*v6 + v140 + v142*v143 + v33*v9 + v36*(v83 + 2.0d0*v85 &
      + v92))
    v153      = L_yyzzzz*v31
    v159      = v153 + L_yyzzz*v150 + 6.0d0*(L_yyz + v152)
    Ls_yyz    = Ls_yyz + (0.166666666666667d0*v153 + L_xxxyyz*v27 + L_yyyyyz*v67 + L_yyz + L_yyzzz &
      *v117 + v12*v47 + v139*v33 + v142*v154 + v152 + v36*(v112 + v96 + &
      2.0d0*v98))
    c4        = c2*c2
    v65       = c4
    v119      = 0.0416666666666667d0*v65
    v66       = L_xxzzzz*v65
    Ls_xx     = Ls_xx + (0.0416666666666667d0*(v62 + 12.0d0*v63 + v66 + 6.0d0*v68 + 4.0d0*(v64 + &
      v70)) + L_xx + L_xxxxxx*v60 + v0*v27 + v37*v71 + v5*v67 + v59 + &
      v72*v74)
    v103      = L_xyzzzz*v65
    v125      = v103 + 12.0d0*v101 + 4.0d0*(6.0d0*L_xy + v102 + 6.0d0*v99)
    Ls_xy     = Ls_xy + (0.0416666666666667d0*(v100 + 12.0d0*v101 + v103 + 6.0d0*v104 + 4.0d0*( &
      v102 + v106)) + L_xxxxxy*v60 + L_xy + v107*v72 + v2*v27 + v54*v71 &
      + v67*v7 + v99)
    v132      = L_xzzzzz*v65
    Ls_xz     = Ls_xz + (0.0416666666666667d0*(v131 + v132 + 6.0d0*v133 + 4.0d0*v135) + L_xxxxxz* &
      v60 + L_xz + L_xzzz*v117 + L_xzzzz*v118 + v130 + v136*v72 + v18* &
      v27 + v67*v86 + v71*v81)
    v147      = L_yyzzzz*v65
    Ls_yy     = Ls_yy + (0.0416666666666667d0*v147 + L_xxxxyy*v60 + L_yy + L_yyyyyy*v121 + L_yyzz &
      *v117 + L_yyzzz*v118 + v143*v148 + v146 + v149*v151 + v27*v4 + &
      v67*v9 + v71*v94 + v72*(v105 + v7*v73 + v89 + 3.0d0*v93))
    v158      = L_yzzzzz*v65
    Ls_yz     = Ls_yz + (0.0416666666666667d0*v158 + L_xxxxyz*v60 + L_yyyyyz*v121 + L_yz + L_yzzz &
      *v117 + L_yzzzz*v118 + v114*v71 + v139*v67 + v148*v154 + v149* &
      v159 + v157 + v24*v27 + v72*(v109 + 3.0d0*v113 + v134 + v73*v86))
    c5        = c2*c3
    v120      = 0.00833333333333333d0*c5
    Ls_x      = Ls_x + (L_x + L_xxxxxx*v115 + L_xyyyyy*v116 + L_xz*z + L_xzz*v117 + L_xzzz*v118 &
      + L_xzzzz*v119 + L_xzzzzz*v120 + v0*v60 + v105*v123 + v121*v7 + &
      v122*v92 + v124*v125 + v126*v37 + v127*v74 + v128*(24.0d0*L_xx + &
      v129*v5 + 24.0d0*v59 + v62 + 12.0d0*v63 + 4.0d0*v64 + v66 + 6.0d0 &
      *v68 + 4.0d0*v70))
    Ls_y      = Ls_y + (L_y + L_xxxxxy*v115 + L_yyyyyy*v116 + L_yz*z + L_yzz*v117 + L_yzzz*v118 &
      + L_yzzzz*v119 + L_yzzzzz*v120 + v107*v127 + v121*v9 + v122*v143 &
      + v123*v151 + v124*(24.0d0*L_yy + L_yyzz*v155 + L_yyzzz*v156 + &
      24.0d0*v146 + v147) + v126*v54 + v128*(v100 + 6.0d0*v104 + 4.0d0* &
      v106 + v125 + v129*v7) + v2*v60)
    Ls_z      = Ls_z + (L_z + L_xxxxxz*v115 + L_yyyyyz*v116 + L_zz*z + L_zzz*v117 + L_zzzz*v118 &
      + L_zzzzz*v119 + L_zzzzzz*v120 + v121*v139 + v122*v154 + v123* &
      v159 + v124*(24.0d0*L_yz + L_yzzz*v155 + L_yzzzz*v156 + 24.0d0* &
      v157 + v158) + v126*v81 + v127*v136 + v128*(24.0d0*L_xz + L_xzzz* &
      v155 + L_xzzzz*v156 + v129*v86 + 24.0d0*v130 + v131 + v132 + &
      6.0d0*v133 + 4.0d0*v135) + v18*v60)
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
#undef  L_xxxyz             
#undef  Ls_xxxyz            
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
#undef  Ls_xxxxxx           
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  Ls_xxxxxy           
#undef  Ls_xxxxxz           
#undef  L_xxxxxz            
#undef  Ls_xxxxyy           
#undef  L_xxxxyy            
#undef  Ls_xxxxyz           
#undef  L_xxxxyz            
#undef  Ls_xxxyyy           
#undef  L_xxxyyy            
#undef  Ls_xxxyyz           
#undef  L_xxxyyz            
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  Ls_xyyyyy           
#undef  L_xyyyyz            
#undef  Ls_xyyyyz           
#undef  L_yyyyyy            
#undef  Ls_yyyyyy           
#undef  Ls_yyyyyz           
#undef  L_yyyyyz            
    end subroutine mom_es_L2L_add
    
! OPS  523*ADD + 2*DIV + 787*MUL + 72*NEG + POW + 20*SUB = 1405  (1959 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70,&
                v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81,&
                v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92,&
                v93, v94, v95, v96, v97, v98, v99, h, u, D_x, D_y, D_z, D_xx,&
                D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy,&
                D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy,&
                D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz,&
                D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx,&
                D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz,&
                D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz,&
                D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz,&
                D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz,&
                D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz,&
                D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz,&
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, M_zz, M_xzz, M_yzz,&
                M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz
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
#define L_yz                 L(1:2,7)
#define M_xxy                M(1:2,7)
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
#define M_xxxx               M(1:2,13)
#define L_yyy                L(1:2,13)
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
#define L_xxyz               L(1:2,19)
#define M_xyyz               M(1:2,19)
#define L_xyyy               L(1:2,20)
#define M_yyyy               M(1:2,20)
#define M_yyyz               M(1:2,21)
#define L_xyyz               L(1:2,21)
#define L_yyyy               L(1:2,22)
#define M_xxxxx              M(1:2,22)
#define M_xxxxy              M(1:2,23)
#define L_yyyz               L(1:2,23)
#define L_xxxxx              L(1:2,24)
#define M_xxxxz              M(1:2,24)
#define M_xxxyy              M(1:2,25)
#define L_xxxxy              L(1:2,25)
#define L_xxxxz              L(1:2,26)
#define M_xxxyz              M(1:2,26)
#define L_xxxyy              L(1:2,27)
#define M_xxyyy              M(1:2,27)
#define L_xxxyz              L(1:2,28)
#define M_xxyyz              M(1:2,28)
#define M_xyyyy              M(1:2,29)
#define L_xxyyy              L(1:2,29)
#define L_xxyyz              L(1:2,30)
#define M_xyyyz              M(1:2,30)
#define M_yyyyy              M(1:2,31)
#define L_xyyyy              L(1:2,31)
#define L_xyyyz              L(1:2,32)
#define M_yyyyz              M(1:2,32)
#define L_yyyyy              L(1:2,33)
#define L_yyyyz              L(1:2,34)
#define L_xxxxxx             L(1:2,35)
#define L_xxxxxy             L(1:2,36)
#define L_xxxxxz             L(1:2,37)
#define L_xxxxyy             L(1:2,38)
#define L_xxxxyz             L(1:2,39)
#define L_xxxyyy             L(1:2,40)
#define L_xxxyyz             L(1:2,41)
#define L_xxyyyy             L(1:2,42)
#define L_xxyyyz             L(1:2,43)
#define L_xyyyyy             L(1:2,44)
#define L_xyyyyz             L(1:2,45)
#define L_yyyyyy             L(1:2,46)
#define L_yyyyyz             L(1:2,47)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v159     = y*z
    v153     = 15.0d0*v159
    v155     = x*y
    v157     = v159
    v57      = 0.5d0*M_xx
    v65      = 0.166666666666667d0*M_xxx
    v66      = 0.5d0*M_xxy
    v67      = 0.5d0*M_xxz
    v83      = 0.0416666666666667d0*M_xxxx
    v84      = 0.166666666666667d0*M_xxxy
    v85      = 0.166666666666667d0*M_xxxz
    v86      = 0.25d0*M_xxyy
    v87      = 0.5d0*M_xxyz
    v102     = 0.5d0*M_yy
    v104     = 0.166666666666667d0*M_yyy
    v109     = 0.0416666666666667d0*M_yyyy
    v118     = 0.00833333333333333d0*M_xxxxx
    v119     = 0.0416666666666667d0*M_xxxxy
    v120     = 0.0416666666666667d0*M_xxxxz
    v121     = 0.0833333333333333d0*M_xxxyy
    v122     = 0.166666666666667d0*M_xxxyz
    v124     = 0.0833333333333333d0*M_xxyyy
    v125     = 0.25d0*M_xxyyz
    v128     = 0.00833333333333333d0*M_yyyyy
    v129     = 0.0416666666666667d0*M_yyyyz
    v130     = 0.166666666666667d0*M_yyyz
    v132     = 0.5d0*M_yyz
    v139     = 0.5d0*M_xyy
    v141     = 0.166666666666667d0*M_xyyy
    v143     = 0.0416666666666667d0*M_xyyyy
    M_zz     = -(M_xx + M_yy)
    v135     = 0.5d0*M_zz
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    v140     = 0.5d0*M_yzz
    M_zzz    = -(M_xxz + M_yyz)
    v136     = 0.166666666666667d0*M_zzz
    M_xxzz   = -(M_xxxx + M_xxyy)
    v88      = 0.25d0*M_xxzz
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v133     = 0.25d0*M_yyzz
    M_yzzz   = -(M_xxyz + M_yyyz)
    v142     = 0.166666666666667d0*M_yzzz
    M_zzzz   = -(M_xxzz + M_yyzz)
    v137     = 0.0416666666666667d0*M_zzzz
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    v123     = 0.0833333333333333d0*M_xxxzz
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    v126     = 0.25d0*M_xxyzz
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    v127     = 0.0833333333333333d0*M_xxzzz
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v131     = 0.0833333333333333d0*M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    v134     = 0.0833333333333333d0*M_yyzzz
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    v144     = 0.0416666666666667d0*M_yzzzz
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    v138     = 0.00833333333333333d0*M_zzzzz
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v145     = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v145
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v146     = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v146
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v100     = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v147     = 3.0d0*h
    v148     = h*v0
    v149     = h*v1
    v158     = 21.0d0*h
    v4       = -h
    v12      = v147
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v148
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v149
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 + 630.0d0*v148 - 945.0d0*v19
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 + 630.0d0*v149 - 945.0d0*v31
    v46      = h*h*h
    v47      = -5.0d0*v46
    v48      = 315.0d0*h
    v49      = v0*v17
    v51      = 5.0d0*v17
    v53      = v21 + v51 + v52
    v55      = -(126.0d0*v1*v20 + v46)
    v60      = -v0*v12
    v61      = -v1*v12
    v62      = v17 + 33.0d0*v27
    v74      = v1*v17
    v101     = v100 + v33 + v51
    u2       = 1.0/h
    u        = sqrt(u2)
    u3       = u*u2
    v2       = u3
    D_x      = -v2*x
    D_y      = -v2*y
    D_z      = -v2*z
    u4       = u2*u2
    u5       = u2*u3
    v3       = u5
    v150     = 3.0d0*v3
    v6       = v150*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v150*v157
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v151     = 3.0d0*v8
    v9       = v8*x
    v11      = v151*(h - v10)
    D_xxx    = -3.0d0*v9*(v145 - v147)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    D_xyz    = -v153*v9
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = v151*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v152     = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v152*y
    v26      = v152*z
    v28      = v15*v153
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v89      = 0.5d0*D_xxyy
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    v95      = 0.5d0*D_xxzz
    D_xyyy   = v22*v30
    D_xyyz   = v26*(v29 + v4)
    D_xyzz   = -(D_xxxy + D_xyyy)
    v113     = 0.5d0*D_xyzz
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v160     = v34*z
    v154     = 15.0d0*v34
    v35      = v154*x
    v39      = v160
    v41      = 315.0d0*v155*v160
    v42      = v154*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx  = D_xxxxx*M_0
    D_xxxxy  = v34*v38*y
    L_xxxxy  = D_xxxxy*M_0
    D_xxxxz  = v38*v39
    L_xxxxz  = D_xxxxz*M_0
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    v68      = 0.5d0*D_xxxyy
    L_xxxyy  = D_xxxyy*M_0
    D_xxxyz  = v41*(h - v5)
    L_xxxyz  = D_xxxyz*M_0
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    v71      = 0.5d0*D_xxxzz
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    v77      = 0.5d0*D_xxyyy
    v90      = 0.166666666666667d0*D_xxyyy
    L_xxyyy  = D_xxyyy*M_0
    D_xxyyz  = v39*(v36 - 945.0d0*v146 + 105.0d0*(v148 + v149))
    v93      = 0.5d0*D_xxyyz
    L_xxyyz  = D_xxyyz*M_0
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    v80      = 0.5d0*D_xxyzz
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    v96      = 0.166666666666667d0*D_xxzzz
    v98      = 0.5d0*D_xxzzz
    D_xyyyy  = v34*v43*x
    L_xyyyy  = D_xyyyy*M_0
    D_xyyyz  = v41*(h - v7)
    v111     = 0.5d0*D_xyyyz
    L_xyyyz  = D_xyyyz*M_0
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    v106     = 0.5d0*D_xyyzz
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    v114     = 0.166666666666667d0*D_xyzzz
    v116     = 0.5d0*D_xyzzz
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    L_yyyyy  = D_yyyyy*M_0
    D_yyyyz  = v39*v43
    L_yyyyz  = D_yyyyz*M_0
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v161     = 315.0d0*v44
    v156     = v161*x
    v45      = 45.0d0*v44
    v50      = v156*y
    v54      = v156*z
    v56      = v157*v161
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = v50*v53
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = v53*v54
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 - v158*v19 + v17*v29 + 14.0d0*v49)
    v58      = 0.5d0*D_xxxxyy
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    v59      = 0.5d0*D_xxxxzz
    L_xxxx   = D_xxxx*M_0 + D_xxxxxx*v57 + D_xxxxxy*M_xy + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + M_yy*v58 + M_zz*v59
    D_xxxyyy = 945.0d0*v155*v44*(11.0d0*v27 + v17 + v60 + v61)
    v63      = 0.5d0*D_xxxyyy
    v69      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = v54*(-9.0d0*v32 + v60 + v62)
    v70      = 0.5d0*D_xxxyyz
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    v64      = 0.5d0*D_xxxyzz
    L_xxxy   = D_xxxxxy*v57 + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + M_yy*v63 + M_zz*v64
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    v72      = 0.166666666666667d0*D_xxxzzz
    v73      = 0.5d0*D_xxxzzz
    L_xxx    = D_xxx*M_0 + D_xxxxx*v57 + D_xxxxxx*v65 + D_xxxxxy*v66 + D_xxxxxz*v67 + &
      D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz + &
      M_xyy*v58 + M_xzz*v59 + M_yy*v68 + M_yyy*v69 + M_yyz*v70 + M_yzz* &
      v64 + M_zz*v71 + M_zzz*v72
    L_xxxz   = D_xxxxxz*v57 + D_xxxxyz*M_xy + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz* &
      M_0 + M_yy*v70 + M_zz*v73
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 - v158*v31 + v17*v24 + 14.0d0*v74)
    v75      = 0.5d0*D_xxyyyy
    v78      = 0.166666666666667d0*D_xxyyyy
    v91      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = v56*(-9.0d0*v20 + v61 + v62)
    v79      = 0.5d0*D_xxyyyz
    v92      = 0.166666666666667d0*D_xxyyyz
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    v76      = 0.5d0*D_xxyyzz
    v94      = 0.25d0*D_xxyyzz
    L_xxyy   = D_xxxxyy*v57 + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + M_yy*v75 + M_zz*v76
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    v81      = 0.166666666666667d0*D_xxyzzz
    v82      = 0.5d0*D_xxyzzz
    L_xxy    = D_xxxxxy*v65 + D_xxxxy*v57 + D_xxxxyy*v66 + D_xxxxyz*v67 + D_xxxyy*M_xy &
      + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + &
      M_xyy*v63 + M_xzz*v64 + M_yy*v77 + M_yyy*v78 + M_yyz*v79 + M_yzz* &
      v76 + M_zz*v80 + M_zzz*v81
    L_xxyz   = D_xxxxyz*v57 + D_xxxyyz*M_xy + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz* &
      M_0 + M_yy*v79 + M_zz*v82
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    v97      = 0.0416666666666667d0*D_xxzzzz
    v99      = 0.166666666666667d0*D_xxzzzz
    L_xx     = D_xx*M_0 + D_xxxx*v57 + D_xxxxx*v65 + D_xxxxxx*v83 + D_xxxxxy*v84 + &
      D_xxxxxz*v85 + D_xxxxy*v66 + D_xxxxyy*v86 + D_xxxxyz*v87 + &
      D_xxxxz*v67 + D_xxxxzz*v88 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz &
      *M_xz + D_xxyz*M_yz + M_xyy*v68 + M_xyyy*v69 + M_xyyz*v70 + &
      M_xyzz*v64 + M_xzz*v71 + M_xzzz*v72 + M_yy*v89 + M_yyy*v90 + &
      M_yyyy*v91 + M_yyyz*v92 + M_yyz*v93 + M_yyzz*v94 + M_yzz*v80 + &
      M_yzzz*v81 + M_zz*v95 + M_zzz*v96 + M_zzzz*v97
    L_xxz    = D_xxxxxz*v65 + D_xxxxyz*v66 + D_xxxxz*v57 + D_xxxxzz*v67 + D_xxxyz*M_xy &
      + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_xyy*v70 + M_xzz*v73 + M_yy*v93 + M_yyy*v92 + M_yyz*v76 + M_yzz* &
      v82 + M_zz*v98 + M_zzz*v99
    D_xyyyyy = v101*v50
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = v54*(-18.0d0*v32 + v100 + v17)
    v105     = 0.5d0*D_xyyyyz
    v110     = 0.166666666666667d0*D_xyyyyz
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    v103     = 0.5d0*D_xyyyzz
    v112     = 0.25d0*D_xyyyzz
    L_xyyy   = D_xxxyyy*v57 + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy* &
      v102 + D_xyyyyz*M_yz + M_zz*v103
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    v107     = 0.166666666666667d0*D_xyyzzz
    v108     = 0.5d0*D_xyyzzz
    L_xyy    = D_xxxxyy*v65 + D_xxxyy*v57 + D_xxxyyy*v66 + D_xxxyyz*v67 + D_xxyyy*M_xy &
      + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v102 + &
      D_xyyyyy*v104 + D_xyyyz*M_yz + M_xyy*v75 + M_xzz*v76 + M_yyz*v105 &
      + M_yzz*v103 + M_zz*v106 + M_zzz*v107
    L_xyyz   = D_xxxyyz*v57 + D_xxyyyz*M_xy + D_xxyyzz*M_xz + D_xyyyyz*v102 + D_xyyyzz* &
      M_yz + D_xyyz*M_0 + M_zz*v108
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    v115     = 0.0416666666666667d0*D_xyzzzz
    v117     = 0.166666666666667d0*D_xyzzzz
    L_xy     = D_xxxxxy*v83 + D_xxxxy*v65 + D_xxxxyy*v84 + D_xxxxyz*v85 + D_xxxy*v57 + &
      D_xxxyy*v66 + D_xxxyyy*v86 + D_xxxyyz*v87 + D_xxxyz*v67 + &
      D_xxxyzz*v88 + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy* &
      M_0 + D_xyyy*v102 + D_xyyyy*v104 + D_xyyyyy*v109 + D_xyyz*M_yz + &
      M_xyy*v77 + M_xyyy*v78 + M_xyyz*v79 + M_xyzz*v76 + M_xzz*v80 + &
      M_xzzz*v81 + M_yyyz*v110 + M_yyz*v111 + M_yyzz*v112 + M_yzz*v106 &
      + M_yzzz*v107 + M_zz*v113 + M_zzz*v114 + M_zzzz*v115
    L_xyz    = D_xxxxyz*v65 + D_xxxyyz*v66 + D_xxxyz*v57 + D_xxxyzz*v67 + D_xxyyz*M_xy &
      + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyyyz*v104 + D_xyyyz*v102 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v79 + M_xzz*v82 + M_yyz*v103 + &
      M_yzz*v108 + M_zz*v116 + M_zzz*v117
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = D_x*M_0 + D_xxx*v57 + D_xxxx*v65 + D_xxxxx*v83 + D_xxxxxx*v118 + &
      D_xxxxxy*v119 + D_xxxxxz*v120 + D_xxxxy*v84 + D_xxxxyy*v121 + &
      D_xxxxyz*v122 + D_xxxxz*v85 + D_xxxxzz*v123 + D_xxxy*v66 + &
      D_xxxyy*v86 + D_xxxyyy*v124 + D_xxxyyz*v125 + D_xxxyz*v87 + &
      D_xxxyzz*v126 + D_xxxz*v67 + D_xxxzz*v88 + D_xxxzzz*v127 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v102 + D_xyyy*v104 + &
      D_xyyyy*v109 + D_xyyyyy*v128 + D_xyyyyz*v129 + D_xyyyz*v130 + &
      D_xyyyzz*v131 + D_xyyz*v132 + D_xyyzz*v133 + D_xyyzzz*v134 + &
      D_xyz*M_yz + D_xzz*v135 + D_xzzz*v136 + D_xzzzz*v137 + D_xzzzzz* &
      v138 + M_xyy*v89 + M_xyyy*v90 + M_xyyyy*v91 + M_xyyyz*v92 + &
      M_xyyz*v93 + M_xyyzz*v94 + M_xyzz*v80 + M_xyzzz*v81 + M_xzz*v95 + &
      M_xzzz*v96 + M_xzzzz*v97 + M_yzz*v113 + M_yzzz*v114 + M_yzzzz* &
      v115
    L_xz     = D_xxxxxz*v83 + D_xxxxyz*v84 + D_xxxxz*v65 + D_xxxxzz*v85 + D_xxxyyz*v86 &
      + D_xxxyz*v66 + D_xxxyzz*v87 + D_xxxz*v57 + D_xxxzz*v67 + &
      D_xxxzzz*v88 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + &
      D_xyyyyz*v109 + D_xyyyz*v104 + D_xyyyzz*v130 + D_xyyz*v102 + &
      D_xyyzz*v132 + D_xyyzzz*v133 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz* &
      v135 + D_xzzzz*v136 + D_xzzzzz*v137 + M_xyy*v93 + M_xyyy*v92 + &
      M_xyyz*v76 + M_xyzz*v82 + M_xzz*v98 + M_xzzz*v99 + M_yzz*v116 + &
      M_yzzz*v117
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v74)
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = v101*v56
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = D_xxyyyy*v57 + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyy* &
      v102 + D_yyyyyz*M_yz + D_yyyyzz*v135
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = D_xxxyyy*v65 + D_xxyyy*v57 + D_xxyyyy*v66 + D_xxyyyz*v67 + D_xyyyy*M_xy &
      + D_xyyyyy*v139 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v102 + D_yyyyyy*v104 + D_yyyyyz*v132 + D_yyyyz*M_yz + &
      D_yyyyzz*v140 + D_yyyzz*v135 + D_yyyzzz*v136 + M_xzz*v103
    L_yyyz   = D_xxyyyz*v57 + D_xyyyyz*M_xy + D_xyyyzz*M_xz + D_yyyyyz*v102 + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzzz*v135
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = D_xxxxyy*v83 + D_xxxyy*v65 + D_xxxyyy*v84 + D_xxxyyz*v85 + D_xxyy*v57 + &
      D_xxyyy*v66 + D_xxyyyy*v86 + D_xxyyyz*v87 + D_xxyyz*v67 + &
      D_xxyyzz*v88 + D_xyyy*M_xy + D_xyyyy*v139 + D_xyyyyy*v141 + &
      D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v102 + D_yyyyy* &
      v104 + D_yyyyyy*v109 + D_yyyyyz*v130 + D_yyyyz*v132 + D_yyyyzz* &
      v133 + D_yyyz*M_yz + D_yyyzz*v140 + D_yyyzzz*v142 + D_yyzz*v135 + &
      D_yyzzz*v136 + D_yyzzzz*v137 + M_xyyz*v105 + M_xyzz*v103 + M_xzz* &
      v106 + M_xzzz*v107
    L_yyz    = D_xxxyyz*v65 + D_xxyyyz*v66 + D_xxyyz*v57 + D_xxyyzz*v67 + D_xyyyyz*v139 &
      + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyz*v104 + &
      D_yyyyz*v102 + D_yyyyzz*v132 + D_yyyzz*M_yz + D_yyyzzz*v140 + &
      D_yyz*M_0 + D_yyzzz*v135 + D_yyzzzz*v136 + M_xzz*v108
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = D_xxxxxy*v118 + D_xxxxy*v83 + D_xxxxyy*v119 + D_xxxxyz*v120 + D_xxxy*v65 &
      + D_xxxyy*v84 + D_xxxyyy*v121 + D_xxxyyz*v122 + D_xxxyz*v85 + &
      D_xxxyzz*v123 + D_xxy*v57 + D_xxyy*v66 + D_xxyyy*v86 + D_xxyyyy* &
      v124 + D_xxyyyz*v125 + D_xxyyz*v87 + D_xxyyzz*v126 + D_xxyz*v67 + &
      D_xxyzz*v88 + D_xxyzzz*v127 + D_xyy*M_xy + D_xyyy*v139 + D_xyyyy* &
      v141 + D_xyyyyy*v143 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + &
      D_yyy*v102 + D_yyyy*v104 + D_yyyyy*v109 + D_yyyyyy*v128 + &
      D_yyyyyz*v129 + D_yyyyz*v130 + D_yyyyzz*v131 + D_yyyz*v132 + &
      D_yyyzz*v133 + D_yyyzzz*v134 + D_yyz*M_yz + D_yyzz*v140 + D_yyzzz &
      *v142 + D_yyzzzz*v144 + D_yzz*v135 + D_yzzz*v136 + D_yzzzz*v137 + &
      D_yzzzzz*v138 + M_xyyyz*v110 + M_xyyz*v111 + M_xyyzz*v112 + &
      M_xyzz*v106 + M_xyzzz*v107 + M_xzz*v113 + M_xzzz*v114 + M_xzzzz* &
      v115
    L_yz     = D_xxxxyz*v83 + D_xxxyyz*v84 + D_xxxyz*v65 + D_xxxyzz*v85 + D_xxyyyz*v86 &
      + D_xxyyz*v66 + D_xxyyzz*v87 + D_xxyz*v57 + D_xxyzz*v67 + &
      D_xxyzzz*v88 + D_xyyyyz*v141 + D_xyyyz*v139 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyyz*v109 + D_yyyyz*v104 + &
      D_yyyyzz*v130 + D_yyyz*v102 + D_yyyzz*v132 + D_yyyzzz*v133 + &
      D_yyzz*M_yz + D_yyzzz*v140 + D_yyzzzz*v142 + D_yz*M_0 + D_yzzz* &
      v135 + D_yzzzz*v136 + D_yzzzzz*v137 + M_xyyz*v103 + M_xyzz*v108 + &
      M_xzz*v116 + M_xzzz*v117
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_z      = 0.0416666666666667d0*(6.0d0*D_xyyzzz*M_xyyzz + 12.0d0*D_xzzz*M_xzz + &
      D_xzzzzz*M_xzzzz + 4.0d0*(D_xyyyzz*M_xyyyz + D_xzzzz*M_xzzz)) + &
      D_xxxxxz*v118 + D_xxxxyz*v119 + D_xxxxz*v83 + D_xxxxzz*v120 + &
      D_xxxyyz*v121 + D_xxxyz*v84 + D_xxxyzz*v122 + D_xxxz*v65 + &
      D_xxxzz*v85 + D_xxxzzz*v123 + D_xxyyyz*v124 + D_xxyyz*v86 + &
      D_xxyyzz*v125 + D_xxyz*v66 + D_xxyzz*v87 + D_xxyzzz*v126 + D_xxz* &
      v57 + D_xxzz*v67 + D_xxzzz*v88 + D_xxzzzz*v127 + D_xyyyyz*v143 + &
      D_xyyyz*v141 + D_xyyz*v139 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yyyyyz*v128 + D_yyyyz*v109 + D_yyyyzz*v129 + D_yyyz*v104 &
      + D_yyyzz*v130 + D_yyyzzz*v131 + D_yyz*v102 + D_yyzz*v132 + &
      D_yyzzz*v133 + D_yyzzzz*v134 + D_yzz*M_yz + D_yzzz*v140 + D_yzzzz &
      *v142 + D_yzzzzz*v144 + D_z*M_0 + D_zzz*v135 + D_zzzz*v136 + &
      D_zzzzz*v137 + D_zzzzzz*v138 + M_xyyz*v106 + M_xyzz*v116 + &
      M_xyzzz*v117
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
#undef  L_yz                
#undef  M_xxy               
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
#undef  M_xxxx              
#undef  L_yyy               
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
#undef  L_xxyz              
#undef  M_xyyz              
#undef  L_xyyy              
#undef  M_yyyy              
#undef  M_yyyz              
#undef  L_xyyz              
#undef  L_yyyy              
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxyz             
#undef  L_xxxyy             
#undef  M_xxyyy             
#undef  L_xxxyz             
#undef  M_xxyyz             
#undef  M_xyyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_xyyyy             
#undef  L_xyyyz             
#undef  M_yyyyz             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  L_xxxxxz            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  L_xxxyyy            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
    end subroutine mom_es_M2L2
    
! OPS  147*ADD + 2*DIV + 217*MUL + 35*NEG + POW = 402  (680 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v5, v6, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz
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
#define L_xxxxxx             L(1:2,35)
#define L_xxxxxy             L(1:2,36)
#define L_xxxxxz             L(1:2,37)
#define L_xxxxyy             L(1:2,38)
#define L_xxxxyz             L(1:2,39)
#define L_xxxyyy             L(1:2,40)
#define L_xxxyyz             L(1:2,41)
#define L_xxyyyy             L(1:2,42)
#define L_xxyyyz             L(1:2,43)
#define L_xyyyyy             L(1:2,44)
#define L_xyyyyz             L(1:2,45)
#define L_yyyyyy             L(1:2,46)
#define L_yyyyyz             L(1:2,47)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v11      = L_xyyyy + L_xyyyyz*z
    v15      = 2.0d0*z
    v19      = 6.0d0*z
    v22      = 0.0416666666666667d0*y
    v23      = 24.0d0*z
    v28      = 2.0d0*y
    v29      = L_xxxxy + L_xxxxyz*z
    v33      = L_xxxyy + L_xxxyyz*z
    v34      = 3.0d0*y
    v36      = 0.0416666666666667d0*x
    v38      = L_xxyyy + L_xxyyyz*z
    v41      = 4.0d0*y
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    L_yzz    = -(L_xxy + L_yyy)
    L_zzz    = -(L_xxz + L_yyz)
    L_xxzz   = -(L_xxxx + L_xxyy)
    L_xyzz   = -(L_xxxy + L_xyyy)
    L_xzzz   = -(L_xxxz + L_xyyz)
    L_yyzz   = -(L_xxyy + L_yyyy)
    L_yzzz   = -(L_xxyz + L_yyyz)
    L_zzzz   = -(L_xxzz + L_yyzz)
    L_xxxzz  = -(L_xxxxx + L_xxxyy)
    L_xxyzz  = -(L_xxxxy + L_xxyyy)
    L_xxzzz  = -(L_xxxxz + L_xxyyz)
    L_xyyzz  = -(L_xxxyy + L_xyyyy)
    L_xyzzz  = -(L_xxxyz + L_xyyyz)
    L_xzzzz  = -(L_xxxzz + L_xyyzz)
    L_yyyzz  = -(L_xxyyy + L_yyyyy)
    L_yyzzz  = -(L_xxyyz + L_yyyyz)
    L_yzzzz  = -(L_xxyzz + L_yyyzz)
    L_zzzzz  = -(L_xxzzz + L_yyzzz)
    L_xxxxzz = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz = -(L_xxzzzz + L_yyzzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v30      = a2
    v31      = 0.0833333333333333d0*v30
    a3       = a1*a2
    v27      = 0.0833333333333333d0*a3
    a4       = a2*a2
    v12      = 0.0416666666666667d0*a4
    a5       = a2*a3
    v0       = 0.00833333333333333d0*a5
    a6       = a3*a3
    b2       = b1*b1
    v17      = b2
    v18      = 0.0833333333333333d0*v17
    v32      = 3.0d0*v17
    v39      = 6.0d0*v17
    b3       = b1*b2
    v13      = b3
    v14      = 0.0833333333333333d0*v13
    v37      = 4.0d0*v13
    b4       = b2*b2
    v9       = b4
    v10      = 0.0416666666666667d0*v9
    b5       = b2*b3
    v1       = 0.00833333333333333d0*b5
    b6       = b3*b3
    c2       = c1*c1
    v2       = c2
    v3       = 0.5d0*v2
    v20      = 3.0d0*v2
    v24      = 12.0d0*v2
    v35      = 2.0d0*L_xxxy + L_xxxyz*v15 + L_xxxyzz*v2
    v40      = 2.0d0*L_xxyy + L_xxyyz*v15 + L_xxyyzz*v2
    v16      = 2.0d0*L_xyyy + L_xyyyz*v15 + L_xyyyzz*v2
    h        = v17 + v2 + v30
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
    u12      = u6*u6
    u13      = u6*u7
    c3       = c1*c2
    v4       = c3
    v5       = 0.166666666666667d0*v4
    v25      = 4.0d0*v4
    v42      = 6.0d0*L_xxy + L_xxyz*v19 + L_xxyzz*v20 + L_xxyzzz*v4
    v21      = 6.0d0*L_xyy + L_xyyz*v19 + L_xyyzz*v20 + L_xyyzzz*v4
    c4       = c2*c2
    v6       = c4
    v7       = 0.0416666666666667d0*v6
    v26      = 24.0d0*L_xy + L_xyz*v23 + L_xyzz*v24 + L_xyzzz*v25 + L_xyzzzz*v6
    c5       = c2*c3
    v8       = 0.00833333333333333d0*c5
    Phi_x    = L_x + L_xxxxxx*v0 + L_xyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v8 + v10*v11 + v12*(L_xxxxx + L_xxxxxy*y + &
      L_xxxxxz*z) + v14*v16 + v18*v21 + v22*v26 + v27*(2.0d0*L_xxxx + &
      L_xxxxyy*v17 + L_xxxxz*v15 + L_xxxxzz*v2 + v28*v29) + v31*(6.0d0* &
      L_xxx + L_xxxyyy*v13 + L_xxxz*v19 + L_xxxzz*v20 + L_xxxzzz*v4 + &
      v32*v33 + v34*v35) + v36*(24.0d0*L_xx + L_xxyyyy*v9 + L_xxz*v23 + &
      L_xxzz*v24 + L_xxzzz*v25 + L_xxzzzz*v6 + v37*v38 + v39*v40 + v41* &
      v42)
    Phi_y    = L_y + L_xxxxxy*v0 + L_yyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v8 + v10*(L_yyyyy + L_yyyyyz*z) + v12*( &
      L_xxxxyy*y + v29) + v14*(2.0d0*L_yyyy + L_yyyyz*v15 + L_yyyyzz*v2 &
      ) + v18*(6.0d0*L_yyy + L_yyyz*v19 + L_yyyzz*v20 + L_yyyzzz*v4) + &
      v22*(24.0d0*L_yy + L_yyz*v23 + L_yyzz*v24 + L_yyzzz*v25 + &
      L_yyzzzz*v6) + v27*(L_xxxyyy*v17 + v28*v33 + v35) + v31*(L_xxyyyy &
      *v13 + v32*v38 + v34*v40 + v42) + v36*(L_xyyyyy*v9 + v11*v37 + &
      v16*v39 + v21*v41 + v26)
    Phi_z    = L_z + L_xxxxxz*v0 + L_yyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v8 + v10*(L_yyyyz + L_yyyyzz*z) + v12*( &
      L_xxxxyz*y + L_xxxxz + L_xxxxzz*z) + v14*(2.0d0*L_yyyz + L_yyyzz* &
      v15 + L_yyyzzz*v2) + v18*(6.0d0*L_yyz + L_yyzz*v19 + L_yyzzz*v20 &
      + L_yyzzzz*v4) + v22*(24.0d0*L_yz + L_yzz*v23 + L_yzzz*v24 + &
      L_yzzzz*v25 + L_yzzzzz*v6) + v27*(L_xxxyyz*v17 + 2.0d0*L_xxxz + &
      L_xxxzz*v15 + L_xxxzzz*v2 + v28*(L_xxxyz + L_xxxyzz*z)) + v31*( &
      L_xxyyyz*v13 + 6.0d0*L_xxz + L_xxzz*v19 + L_xxzzz*v20 + L_xxzzzz* &
      v4 + v32*(L_xxyyz + L_xxyyzz*z) + v34*(2.0d0*L_xxyz + L_xxyzz*v15 &
      + L_xxyzzz*v2)) + v36*(L_xyyyyz*v9 + 24.0d0*L_xz + L_xzz*v23 + &
      L_xzzz*v24 + L_xzzzz*v25 + L_xzzzzz*v6 + v37*(L_xyyyz + L_xyyyzz* &
      z) + v39*(2.0d0*L_xyyz + L_xyyzz*v15 + L_xyyzzz*v2) + v41*(6.0d0* &
      L_xyz + L_xyzz*v19 + L_xyzzz*v20 + L_xyzzzz*v4))
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
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  L_xxxxxz            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  L_xxxyyy            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
    end subroutine mom_es_L2P2
    
! OPS  357*ADD + 2*DIV + 411*MUL + 35*NEG + POW = 806  (1945 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v145, v146, v147, v148, v149, v15, v150, v151,&
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v17, v18,&
                v19, v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3,&
                v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz
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
#define Ls_xxxz              Ls(1:2,17)
#define L_xxxz               L(1:2,17)
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
#define Ls_xxxxy             Ls(1:2,25)
#define L_xxxxy              L(1:2,25)
#define L_xxxxz              L(1:2,26)
#define Ls_xxxxz             Ls(1:2,26)
#define Ls_xxxyy             Ls(1:2,27)
#define L_xxxyy              L(1:2,27)
#define L_xxxyz              L(1:2,28)
#define Ls_xxxyz             Ls(1:2,28)
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
#define Ls_xxxxxx            Ls(1:2,35)
#define L_xxxxxx             L(1:2,35)
#define L_xxxxxy             L(1:2,36)
#define Ls_xxxxxy            Ls(1:2,36)
#define Ls_xxxxxz            Ls(1:2,37)
#define L_xxxxxz             L(1:2,37)
#define Ls_xxxxyy            Ls(1:2,38)
#define L_xxxxyy             L(1:2,38)
#define Ls_xxxxyz            Ls(1:2,39)
#define L_xxxxyz             L(1:2,39)
#define Ls_xxxyyy            Ls(1:2,40)
#define L_xxxyyy             L(1:2,40)
#define Ls_xxxyyz            Ls(1:2,41)
#define L_xxxyyz             L(1:2,41)
#define Ls_xxyyyy            Ls(1:2,42)
#define L_xxyyyy             L(1:2,42)
#define Ls_xxyyyz            Ls(1:2,43)
#define L_xxyyyz             L(1:2,43)
#define L_xyyyyy             L(1:2,44)
#define Ls_xyyyyy            Ls(1:2,44)
#define L_xyyyyz             L(1:2,45)
#define Ls_xyyyyz            Ls(1:2,45)
#define L_yyyyyy             L(1:2,46)
#define Ls_yyyyyy            Ls(1:2,46)
#define Ls_yyyyyz            Ls(1:2,47)
#define L_yyyyyz             L(1:2,47)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0        = L_xxxxx + L_xxxxxy*y + L_xxxxxz*z
    v1        = L_xxxxy + L_xxxxyz*z
    v2        = L_xxxxyy*y + v1
    v3        = L_xxxyy + L_xxxyyz*z
    v4        = L_xxxyyy*y + v3
    v5        = L_xxyyy + L_xxyyyz*z
    v6        = L_xxyyyy*y + v5
    v7        = L_xyyyy + L_xyyyyz*z
    v8        = L_xyyyyy*y + v7
    v9        = L_yyyyy + L_yyyyyz*z
    v10       = L_xxxxz*z
    v17       = v1*y
    v19       = L_xxxyz*z
    v22       = v3*y
    v25       = L_xxxz*z
    v36       = 0.5d0*x
    v42       = L_xxyyz*z
    v45       = v5*y
    v48       = L_xxyz*z
    v59       = L_xxz*z
    v72       = 0.166666666666667d0*x
    v82       = L_xyyyz*z
    v85       = v7*y
    v88       = L_xyyz*z
    v99       = L_xyz*z
    v124      = 0.0416666666666667d0*y
    v128      = 0.0416666666666667d0*x
    v137      = L_yyyyz*z
    v140      = L_yyyz*z
    v142      = 0.5d0*y
    v146      = L_yyz*z
    v149      = 0.166666666666667d0*y
    Ls_xxxxx  = L_xxxxxx*x + v0
    Ls_xxxxy  = L_xxxxxy*x + v2
    Ls_xxxyy  = L_xxxxyy*x + v4
    Ls_xxyyy  = L_xxxyyy*x + v6
    Ls_xyyyy  = L_xxyyyy*x + v8
    Ls_yyyyy  = v9 + L_xyyyyy*x + L_yyyyyy*y
    Ls_xxxxxx = L_xxxxxx
    Ls_xxxxxy = L_xxxxxy
    Ls_xxxxxz = L_xxxxxz
    Ls_xxxxyy = L_xxxxyy
    Ls_xxxxyz = L_xxxxyz
    Ls_xxxyyy = L_xxxyyy
    Ls_xxxyyz = L_xxxyyz
    Ls_xxyyyy = L_xxyyyy
    Ls_xxyyyz = L_xxyyyz
    Ls_xyyyyy = L_xyyyyy
    Ls_xyyyyz = L_xyyyyz
    Ls_yyyyyy = L_yyyyyy
    Ls_yyyyyz = L_yyyyyz
    L_zz      = -(L_xx + L_yy)
    L_xzz     = -(L_xxx + L_xyy)
    v130      = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v157      = L_yzz*z
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    v75       = L_xxzz*z
    L_xyzz    = -(L_xxxy + L_xyyy)
    v108      = L_xyzz*z
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    v152      = L_yyzz*z
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    v38       = L_xxxzz*z
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    v55       = L_xxyzz*z
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    v95       = L_xyyzz*z
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    v144      = L_yyyzz*z
    L_yyzzz   = -(L_xxyyz + L_yyyyz)
    L_yzzzz   = -(L_xxyzz + L_yyyzz)
    L_zzzzz   = -(L_xxzzz + L_yyzzz)
    L_xxxxzz  = -(L_xxxxxx + L_xxxxyy)
    v18       = L_xxxxz + L_xxxxyz*y + L_xxxxzz*z
    Ls_xxxxz  = L_xxxxxz*x + v18
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    v23       = L_xxxyz + L_xxxyzz*z
    v24       = L_xxxyyz*y + v23
    v41       = v23*y
    Ls_xxxyz  = L_xxxxyz*x + v24
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    v46       = L_xxyyz + L_xxyyzz*z
    v47       = L_xxyyyz*y + v46
    v58       = v46*y
    Ls_xxyyz  = L_xxxyyz*x + v47
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    v86       = L_xyyyz + L_xyyyzz*z
    v87       = L_xyyyyz*y + v86
    v98       = v86*y
    Ls_xyyyz  = L_xxyyyz*x + v87
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    v139      = L_yyyyz + L_yyyyzz*z
    Ls_yyyyz  = v139 + L_xyyyyz*x + L_yyyyyz*y
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v11       = a2
    v12       = 0.5d0*v11
    v71       = 0.25d0*v11
    v127      = 0.0833333333333333d0*v11
    a3        = a1*a2
    v26       = a3
    v27       = 0.166666666666667d0*v26
    v126      = 0.0833333333333333d0*v26
    a4        = a2*a2
    v60       = 0.0416666666666667d0*a4
    a5        = a2*a3
    v115      = 0.00833333333333333d0*a5
    a6        = a3*a3
    b2        = b1*b1
    v13       = b2
    v14       = L_xxxxyy*v13
    v20       = L_xxxyyy*v13
    v33       = 0.5d0*v13
    v39       = L_xxxyyz*v13
    v43       = L_xxyyyy*v13
    v56       = L_xxyyyz*v13
    v73       = 3.0d0*v13
    v83       = L_xyyyyy*v13
    v96       = L_xyyyyz*v13
    v123      = 0.0833333333333333d0*v13
    v148      = 0.25d0*v13
    b3        = b1*b2
    v28       = b3
    v29       = L_xxxyyy*v28
    v49       = L_xxyyyy*v28
    v67       = 0.166666666666667d0*v28
    v76       = L_xxyyyz*v28
    v89       = L_xyyyyy*v28
    v109      = L_xyyyyz*v28
    v122      = 0.0833333333333333d0*v28
    v129      = 4.0d0*v28
    b4        = b2*b2
    v61       = b4
    v62       = L_xxyyyy*v61
    v100      = L_xyyyyy*v61
    v121      = 0.0416666666666667d0*v61
    v131      = L_xyyyyz*v61
    b5        = b2*b3
    v116      = 0.00833333333333333d0*b5
    b6        = b3*b3
    c2        = c1*c1
    v15       = c2
    v117      = 0.5d0*v15
    v150      = 3.0d0*v15
    v155      = 12.0d0*v15
    v63       = L_xxzz*v15
    v101      = L_xyzz*v15
    v30       = L_xxxzz*v15
    v50       = L_xxyzz*v15
    v77       = L_xxzzz*v15
    v90       = L_xyyzz*v15
    v110      = L_xyzzz*v15
    v16       = L_xxxxzz*v15
    v37       = v14 + v16 + 2.0d0*(L_xxxx + v10 + v17)
    Ls_xxxx   = 0.5d0*(v14 + v16) + L_xxxx + L_xxxxxx*v12 + v0*x + v10 + v17
    v21       = L_xxxyzz*v15
    v34       = v21 + 2.0d0*(L_xxxy + v19)
    v35       = v34*y
    v54       = 2.0d0*v22 + v20 + v34
    Ls_xxxy   = 0.5d0*(v20 + v21) + L_xxxxxy*v12 + L_xxxy + v19 + v2*x + v22
    v40       = L_xxxzzz*v15
    v81       = v39 + v40 + 2.0d0*(L_xxxz + v38 + v41)
    Ls_xxxz   = 0.5d0*(v39 + v40) + L_xxxxxz*v12 + L_xxxz + v18*x + v38 + v41
    v44       = L_xxyyzz*v15
    v52       = v44 + 2.0d0*(L_xxyy + v42)
    v53       = v52*y
    v68       = v13*v52
    v94       = 2.0d0*v45 + v43 + v52
    Ls_xxyy   = 0.5d0*(v43 + v44) + L_xxxxyy*v12 + L_xxyy + v4*x + v42 + v45
    v57       = L_xxyzzz*v15
    v79       = v57 + 2.0d0*(L_xxyz + v55)
    v80       = v79*y
    v114      = 2.0d0*v58 + v56 + v79
    Ls_xxyz   = 0.5d0*(v56 + v57) + L_xxxxyz*v12 + L_xxyz + v24*x + v55 + v58
    v84       = L_xyyyzz*v15
    v92       = v84 + 2.0d0*(L_xyyy + v82)
    v93       = v92*y
    v104      = v13*v92
    Ls_xyyy   = 0.5d0*(v83 + v84) + L_xxxyyy*v12 + L_xyyy + v6*x + v82 + v85
    v97       = L_xyyzzz*v15
    v112      = v97 + 2.0d0*(L_xyyz + v95)
    v113      = v112*y
    v133      = v112*v13
    Ls_xyyz   = 0.5d0*(v96 + v97) + L_xxxyyz*v12 + L_xyyz + v47*x + v95 + v98
    v138      = L_yyyyzz*v15
    v143      = v138 + 2.0d0*(L_yyyy + v137)
    Ls_yyyy   = 0.5d0*v138 + L_xxyyyy*v12 + L_yyyy + L_yyyyyy*v33 + v137 + v8*x + v9*y
    v145      = L_yyyzzz*v15
    v154      = v145 + 2.0d0*(L_yyyz + v144)
    Ls_yyyz   = 0.5d0*v145 + L_xxyyyz*v12 + L_yyyyyz*v33 + L_yyyz + v139*y + v144 + v87* &
      x
    h         = v11 + v13 + v15
    u2        = 1.0/h
    u         = sqrt(u2)
    u3        = u*u2
    u4        = u2*u2
    u5        = u2*u3
    u6        = u3*u3
    u7        = u3*u4
    u8        = u4*u4
    u9        = u4*u5
    u10       = u5*u5
    u11       = u5*u6
    u12       = u6*u6
    u13       = u6*u7
    c3        = c1*c2
    v31       = c3
    v118      = 0.166666666666667d0*v31
    v156      = 4.0d0*v31
    v64       = L_xxzzz*v31
    v102      = L_xyzzz*v31
    v32       = L_xxxzzz*v31
    v74       = v29 + v32 + v3*v73 + 6.0d0*(L_xxx + v25) + 3.0d0*(v30 + v35)
    Ls_xxx    = 0.166666666666667d0*(v29 + v32 + 3.0d0*(v30 + v35)) + L_xxx + L_xxxxxx* &
      v27 + v0*v12 + v25 + v3*v33 + v36*v37
    v51       = L_xxyzzz*v31
    v69       = v51 + 3.0d0*(2.0d0*L_xxy + 2.0d0*v48 + v50)
    v70       = v69*y
    v107      = v49 + v69 + v5*v73 + 3.0d0*v53
    Ls_xxy    = 0.166666666666667d0*(v49 + v51 + 3.0d0*(v50 + v53)) + L_xxxxxy*v27 + &
      L_xxy + v12*v2 + v33*v5 + v36*v54 + v48
    v78       = L_xxzzzz*v31
    v136      = v76 + v78 + v46*v73 + 6.0d0*(L_xxz + v75) + 3.0d0*(v77 + v80)
    Ls_xxz    = 0.166666666666667d0*(v76 + v78 + 3.0d0*(v77 + v80)) + L_xxxxxz*v27 + &
      L_xxz + v12*v18 + v33*v46 + v36*v81 + v75
    v91       = L_xyyzzz*v31
    v105      = v91 + 3.0d0*(2.0d0*L_xyy + 2.0d0*v88 + v90)
    v106      = v105*y
    Ls_xyy    = 0.166666666666667d0*(v89 + v91 + 3.0d0*(v90 + v93)) + L_xxxxyy*v27 + &
      L_xyy + v12*v4 + v33*v7 + v36*v94 + v88
    v111      = L_xyzzzz*v31
    v134      = v111 + 3.0d0*(2.0d0*L_xyz + 2.0d0*v108 + v110)
    v135      = v134*y
    Ls_xyz    = 0.166666666666667d0*(v109 + v111 + 3.0d0*(v110 + v113)) + L_xxxxyz*v27 + &
      L_xyz + v108 + v114*v36 + v12*v24 + v33*v86
    v141      = L_yyyzzz*v31
    v151      = v141 + L_yyyzz*v150 + 6.0d0*(L_yyy + v140)
    Ls_yyy    = 0.166666666666667d0*v141 + L_xxxyyy*v27 + L_yyy + L_yyyyyy*v67 + L_yyyzz &
      *v117 + v12*v6 + v140 + v142*v143 + v33*v9 + v36*(v83 + 2.0d0*v85 &
      + v92)
    v153      = L_yyzzzz*v31
    v159      = v153 + L_yyzzz*v150 + 6.0d0*(L_yyz + v152)
    Ls_yyz    = 0.166666666666667d0*v153 + L_xxxyyz*v27 + L_yyyyyz*v67 + L_yyz + L_yyzzz &
      *v117 + v12*v47 + v139*v33 + v142*v154 + v152 + v36*(v112 + v96 + &
      2.0d0*v98)
    c4        = c2*c2
    v65       = c4
    v119      = 0.0416666666666667d0*v65
    v66       = L_xxzzzz*v65
    Ls_xx     = 0.0416666666666667d0*(v62 + 12.0d0*v63 + v66 + 6.0d0*v68 + 4.0d0*(v64 + &
      v70)) + L_xx + L_xxxxxx*v60 + v0*v27 + v37*v71 + v5*v67 + v59 + &
      v72*v74
    v103      = L_xyzzzz*v65
    v125      = v103 + 12.0d0*v101 + 4.0d0*(6.0d0*L_xy + v102 + 6.0d0*v99)
    Ls_xy     = 0.0416666666666667d0*(v100 + 12.0d0*v101 + v103 + 6.0d0*v104 + 4.0d0*( &
      v102 + v106)) + L_xxxxxy*v60 + L_xy + v107*v72 + v2*v27 + v54*v71 &
      + v67*v7 + v99
    v132      = L_xzzzzz*v65
    Ls_xz     = 0.0416666666666667d0*(v131 + v132 + 6.0d0*v133 + 4.0d0*v135) + L_xxxxxz* &
      v60 + L_xz + L_xzzz*v117 + L_xzzzz*v118 + v130 + v136*v72 + v18* &
      v27 + v67*v86 + v71*v81
    v147      = L_yyzzzz*v65
    Ls_yy     = 0.0416666666666667d0*v147 + L_xxxxyy*v60 + L_yy + L_yyyyyy*v121 + L_yyzz &
      *v117 + L_yyzzz*v118 + v143*v148 + v146 + v149*v151 + v27*v4 + &
      v67*v9 + v71*v94 + v72*(v105 + v7*v73 + v89 + 3.0d0*v93)
    v158      = L_yzzzzz*v65
    Ls_yz     = 0.0416666666666667d0*v158 + L_xxxxyz*v60 + L_yyyyyz*v121 + L_yz + L_yzzz &
      *v117 + L_yzzzz*v118 + v114*v71 + v139*v67 + v148*v154 + v149* &
      v159 + v157 + v24*v27 + v72*(v109 + 3.0d0*v113 + v134 + v73*v86)
    c5        = c2*c3
    v120      = 0.00833333333333333d0*c5
    Ls_x      = L_x + L_xxxxxx*v115 + L_xyyyyy*v116 + L_xz*z + L_xzz*v117 + L_xzzz*v118 &
      + L_xzzzz*v119 + L_xzzzzz*v120 + v0*v60 + v105*v123 + v121*v7 + &
      v122*v92 + v124*v125 + v126*v37 + v127*v74 + v128*(24.0d0*L_xx + &
      v129*v5 + 24.0d0*v59 + v62 + 12.0d0*v63 + 4.0d0*v64 + v66 + 6.0d0 &
      *v68 + 4.0d0*v70)
    Ls_y      = L_y + L_xxxxxy*v115 + L_yyyyyy*v116 + L_yz*z + L_yzz*v117 + L_yzzz*v118 &
      + L_yzzzz*v119 + L_yzzzzz*v120 + v107*v127 + v121*v9 + v122*v143 &
      + v123*v151 + v124*(24.0d0*L_yy + L_yyzz*v155 + L_yyzzz*v156 + &
      24.0d0*v146 + v147) + v126*v54 + v128*(v100 + 6.0d0*v104 + 4.0d0* &
      v106 + v125 + v129*v7) + v2*v60
    Ls_z      = L_z + L_xxxxxz*v115 + L_yyyyyz*v116 + L_zz*z + L_zzz*v117 + L_zzzz*v118 &
      + L_zzzzz*v119 + L_zzzzzz*v120 + v121*v139 + v122*v154 + v123* &
      v159 + v124*(24.0d0*L_yz + L_yzzz*v155 + L_yzzzz*v156 + 24.0d0* &
      v157 + v158) + v126*v81 + v127*v136 + v128*(24.0d0*L_xz + L_xzzz* &
      v155 + L_xzzzz*v156 + v129*v86 + 24.0d0*v130 + v131 + v132 + &
      6.0d0*v133 + 4.0d0*v135) + v18*v60
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
#undef  L_xxxyz             
#undef  Ls_xxxyz            
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
#undef  Ls_xxxxxx           
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  Ls_xxxxxy           
#undef  Ls_xxxxxz           
#undef  L_xxxxxz            
#undef  Ls_xxxxyy           
#undef  L_xxxxyy            
#undef  Ls_xxxxyz           
#undef  L_xxxxyz            
#undef  Ls_xxxyyy           
#undef  L_xxxyyy            
#undef  Ls_xxxyyz           
#undef  L_xxxyyz            
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  Ls_xyyyyy           
#undef  L_xyyyyz            
#undef  Ls_xyyyyz           
#undef  L_yyyyyy            
#undef  Ls_yyyyyy           
#undef  Ls_yyyyyz           
#undef  L_yyyyyz            
    end subroutine mom_es_L2L2_add
#endif
end module mom6
