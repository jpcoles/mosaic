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
        
    
! OPS  31*ADD + 77*MUL + 14*NEG + 2*SUB = 124  (359 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v11,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v4, v5, v6, v7, v8, v9, h, u
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
#define M_xxxxx              M(25)
#define M_xxxxy              M(26)
#define M_xxxxz              M(27)
#define M_xxxyy              M(28)
#define M_xxxyz              M(29)
#define M_xxyyy              M(30)
#define M_xxyyz              M(31)
#define M_xyyyy              M(32)
#define M_xyyyz              M(33)
#define M_yyyyy              M(34)
#define M_yyyyz              M(35)
    v0      = W*x
    v1      = W*y
    v2      = W*z
    v3      = v0*y
    v4      = v0*z
    v5      = v1*z
    v6      = v3*z
    M_0     = W
    M_x     = v0
    M_y     = v1
    M_z     = v2
    M_xy    = v3
    M_xz    = v4
    M_yz    = v5
    M_xyz   = v6
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v7      = a2
    a3      = a1*a2
    a4      = a2*a2
    v18     = a4
    a5      = a2*a3
    b2      = b1*b1
    v8      = b2
    v9      = v7 + v8
    v24     = v7*v8
    b3      = b1*b2
    b4      = b2*b2
    v28     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v9
    v10     = 0.333333333333333d0*h
    v11     = -v10
    v12     = v11 + v7
    v13     = v11 + v8
    v14     = -0.6d0*h
    v15     = -0.2d0*h
    v16     = v15 + v7
    v17     = v15 + v8
    v19     = h*h
    v20     = 0.0857142857142857d0*v19
    v21     = h*v7
    v22     = -0.428571428571429d0*h
    v23     = v22 + v7
    v25     = 0.142857142857143d0*h
    v26     = -v25
    v27     = v22 + v8
    v29     = h*v8
    v30     = 0.238095238095238d0*v19
    v31     = 0.0476190476190476d0*v19
    v32     = 0.333333333333333d0*(-2.0d0*v21) + v18 + v31
    v33     = v24 + v31
    v35     = -v33
    v34     = 0.333333333333333d0*(-2.0d0*v29) + v28 + v31
    M_xx    = W*v12
    M_yy    = W*v13
    M_xxx   = v0*(v14 + v7)
    M_xxy   = v1*v16
    M_xxz   = v16*v2
    M_xyy   = v0*v17
    M_yyy   = v1*(v14 + v8)
    M_yyz   = v17*v2
    M_xxxx  = W*(0.142857142857143d0*(-6.0d0*v21) + v18 + v20)
    M_xxxy  = v23*v3
    M_xxxz  = v23*v4
    M_xxyy  = W*(0.0285714285714286d0*v19 + v24 - v25*v9)
    M_xxyz  = v5*(v26 + v7)
    M_xyyy  = v27*v3
    M_xyyz  = v4*(v26 + v8)
    M_yyyy  = W*(0.142857142857143d0*(-6.0d0*v29) + v20 + v28)
    M_yyyz  = v27*v5
    M_xxxxx = v0*(0.111111111111111d0*(-10.0d0*v21) + v18 + v30)
    M_xxxxy = v1*v32
    M_xxxxz = v2*v32
    M_xxxyy = -v0*(0.111111111111111d0*v21 + v10*v8 + v35)
    M_xxxyz = v12*v6
    M_xxyyy = -v1*(0.111111111111111d0*v29 + v10*v7 + v35)
    M_xxyyz = v2*(v24 + 0.0158730158730159d0*(-7.0d0*h*v9 + v19))
    M_xyyyy = v0*v34
    M_xyyyz = v13*v6
    M_yyyyy = v1*(0.111111111111111d0*(-10.0d0*v29) + v28 + v30)
    M_yyyyz = v2*v34
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
    
! OPS  519*ADD + 639*MUL + 47*NEG + 95*SUB = 1300  (2167 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v105, v106, v107, v108, v109, v11,&
                v110, v111, v112, v113, v114, v115, v116, v117, v118, v119,&
                v12, v120, v121, v122, v123, v124, v125, v126, v127, v128,&
                v129, v13, v130, v131, v132, v133, v134, v135, v136, v137,&
                v138, v139, v14, v140, v141, v142, v143, v144, v145, v146,&
                v147, v148, v149, v15, v150, v151, v152, v153, v154, v155,&
                v156, v157, v158, v159, v16, v160, v161, v162, v163, v164,&
                v165, v166, v167, v168, v169, v17, v170, v171, v172, v173,&
                v174, v175, v176, v177, v178, v179, v18, v180, v181, v182,&
                v183, v184, v185, v186, v187, v188, v189, v19, v190, v191,&
                v192, v193, v194, v195, v196, v197, v198, v199, v2, v20, v200,&
                v201, v202, v203, v204, v205, v206, v207, v208, v209, v21,&
                v210, v211, v212, v213, v214, v215, v216, v217, v218, v219,&
                v22, v220, v221, v222, v223, v224, v225, v226, v227, v228,&
                v229, v23, v230, v231, v232, v233, v234, v235, v236, v237,&
                v238, v239, v24, v240, v241, v242, v243, v25, v26, v27, v28,&
                v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz,&
                M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz,&
                M_yzzzz, M_zzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy,&
                S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz, S_yyy,&
                S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz,&
                S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy, S_yyyz,&
                S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz, S_xxxyy,&
                S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy, S_xyyyz, S_yyyyy, S_yyyyz
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define z                    r(3)
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
#define Ms_xxx               Ms(9)
#define M_xxx                M(9)
#define M_xxy                M(10)
#define Ms_xxy               Ms(10)
#define Ms_xxz               Ms(11)
#define M_xxz                M(11)
#define Ms_xyy               Ms(12)
#define M_xyy                M(12)
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
#define M_xxyy               M(19)
#define Ms_xxyy              Ms(19)
#define Ms_xxyz              Ms(20)
#define M_xxyz               M(20)
#define M_xyyy               M(21)
#define Ms_xyyy              Ms(21)
#define Ms_xyyz              Ms(22)
#define M_xyyz               M(22)
#define M_yyyy               M(23)
#define Ms_yyyy              Ms(23)
#define M_yyyz               M(24)
#define Ms_yyyz              Ms(24)
#define Ms_xxxxx             Ms(25)
#define M_xxxxx              M(25)
#define Ms_xxxxy             Ms(26)
#define M_xxxxy              M(26)
#define Ms_xxxxz             Ms(27)
#define M_xxxxz              M(27)
#define Ms_xxxyy             Ms(28)
#define M_xxxyy              M(28)
#define M_xxxyz              M(29)
#define Ms_xxxyz             Ms(29)
#define Ms_xxyyy             Ms(30)
#define M_xxyyy              M(30)
#define Ms_xxyyz             Ms(31)
#define M_xxyyz              M(31)
#define Ms_xyyyy             Ms(32)
#define M_xyyyy              M(32)
#define M_xyyyz              M(33)
#define Ms_xyyyz             Ms(33)
#define M_yyyyy              M(34)
#define Ms_yyyyy             Ms(34)
#define Ms_yyyyz             Ms(35)
#define M_yyyyz              M(35)
    v0       = x*y
    v1       = x*z
    v2       = y*z
    v3       = v0*z
    v9       = M_x*x
    v10      = M_y*y
    v11      = -0.666666666666667d0*M_z*z
    v15      = M_xx*x
    v16      = M_xy*y
    v17      = M_xz*z
    v23      = M_xy*x
    v25      = M_yy*y
    v26      = M_yz*z
    v29      = M_xx*z
    v30      = M_xz*x
    v32      = M_yy*z
    v33      = M_yz*y
    v47      = M_xxx*x
    v48      = 1.71428571428571d0*y
    v49      = M_xxy*v48
    v50      = M_xxz*z
    v52      = 1.71428571428571d0*M_y
    v59      = 0.857142857142857d0*M_xyz
    v64      = M_xxy*x
    v67      = M_xyy*y
    v71      = 3.0d0*M_xx
    v72      = M_xxx*z
    v73      = M_xxz*x
    v75      = M_xyy*z
    v76      = 3.0d0*M_xz
    v84      = 1.71428571428571d0*M_x
    v86      = 1.71428571428571d0*x
    v87      = M_xyy*v86
    v89      = M_yyy*y
    v90      = M_yyz*z
    v94      = M_xxy*z
    v98      = M_yyy*z
    v99      = M_yyz*y
    v107     = 3.0d0*M_yz
    v118     = M_xxxx*x
    v119     = M_xxxy*y
    v120     = M_xxxz*z
    v122     = M_xxyy*x
    v133     = M_yyyy*x
    v148     = M_xxxx*y
    v149     = M_xxxy*x
    v152     = M_xxyy*y
    v153     = M_xxyz*z
    v167     = M_yyyy*y
    v172     = M_xxyy*z
    v185     = M_xxxx*z
    v186     = M_xxxz*x
    v188     = M_xxyz*y
    v198     = M_yyyy*z
    v208     = M_xyyy*y
    v209     = M_xyyz*z
    v217     = M_xxxy*z
    v218     = M_xxyz*x
    v222     = M_xyyy*z
    v223     = M_xyyz*y
    v224     = 3.0d0*M_xyz
    v234     = M_xyyy*x
    v235     = M_yyyz*z
    v238     = M_xyyz*x
    v240     = M_yyyz*y
    Ms_0     = M_0
    Ms_x     = M_0*x + M_x
    Ms_y     = M_0*y + M_y
    Ms_z     = M_0*z + M_z
    M_zz     = -(M_xx + M_yy)
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    M_xxzz   = -(M_xxxx + M_xxyy)
    v124     = M_xxzz*x
    v139     = M_xxzz*y
    v173     = M_xxzz*z
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v134     = M_yyzz*x
    v142     = M_yyzz*y
    v176     = M_yyzz*z
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    v242     = M_xxxzz + M_xyyzz
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -v242
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v243     = M_xxyzz + M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    M_yzzzz  = -v243
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    S_0      = 1
    S_x      = x
    S_y      = y
    S_z      = z
    S_xy     = v0
    v18      = M_y*S_xy
    v22      = M_x*S_xy
    v42      = M_xy*S_xy
    v63      = M_xx*S_xy
    v69      = M_yy*S_xy
    v79      = M_yz*S_xy
    v96      = M_xz*S_xy
    v121     = M_xxy*S_xy
    v147     = M_xxx*S_xy
    v157     = M_xyy*S_xy
    v175     = M_xyz*S_xy
    v212     = M_yyy*S_xy
    v219     = M_xxz*S_xy
    v228     = M_yyz*S_xy
    Ms_xy    = M_xy + M_0*S_xy + M_x*y + M_y*x
    S_xz     = v1
    v19      = M_z*S_xz
    v28      = M_x*S_xz
    v51      = M_xz*S_xz
    v78      = M_yy*S_xz
    v95      = M_xy*S_xz
    v123     = M_xxz*S_xz
    v158     = M_xyz*S_xz
    v184     = M_xxx*S_xz
    v191     = M_xyy*S_xz
    v213     = M_yyz*S_xz
    v227     = M_yyy*S_xz
    Ms_xz    = M_xz + M_0*S_xz + M_x*z + M_z*x
    S_yz     = v2
    v27      = M_z*S_yz
    v31      = M_y*S_yz
    v55      = M_yz*S_yz
    v74      = M_xy*S_yz
    v93      = M_xx*S_yz
    v106     = 3.0d0*S_yz
    v128     = M_xyz*S_yz
    v154     = M_xxz*S_yz
    v168     = M_yyz*S_yz
    v187     = M_xxy*S_yz
    v197     = M_yyy*S_yz
    v216     = M_xxx*S_yz
    Ms_yz    = M_yz + M_0*S_yz + M_y*z + M_z*y
    S_xyz    = v3
    v60      = 0.857142857142857d0*S_xyz
    v61      = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v60 + v59*z)
    v135     = M_yz*S_xyz
    v159     = M_xz*S_xyz
    v174     = M_xy*S_xyz
    Ms_xyz   = M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v4       = a2
    a3       = a1*a2
    a4       = a2*a2
    v37      = a4
    a5       = a2*a3
    b2       = b1*b1
    v5       = b2
    v83      = v4*v5
    b3       = b1*b2
    b4       = b2*b2
    v104     = b4
    b5       = b2*b3
    c2       = c1*c1
    h        = c2 + v4 + v5
    v6       = 0.333333333333333d0*h
    v7       = -v6
    v8       = v4 + v7
    v12      = v5 + v7
    v13      = -0.6d0*h
    v20      = -0.2d0*h
    v21      = v20 + v4
    v36      = v20 + v5
    v38      = h*h
    v39      = 0.0857142857142857d0*v38
    v40      = h*v4
    v57      = -0.428571428571429d0*h
    v58      = v4 + v57
    v82      = 0.142857142857143d0*h
    v92      = -v82
    v103     = v5 + v57
    v105     = h*v5
    v108     = 0.238095238095238d0*v38
    v137     = 0.0476190476190476d0*v38
    v138     = 0.333333333333333d0*(-2.0d0*v40) + v137 + v37
    v205     = -0.111111111111111d0*v40
    v232     = 0.111111111111111d0*(-v105) + v83
    v241     = 0.333333333333333d0*(-2.0d0*v105) + v104 + v137
    S_xx     = v8
    v14      = M_x*S_xx
    v34      = M_z*S_xx
    v43      = M_yy*S_xx
    v46      = M_xx*S_xx
    v65      = M_xy*S_xx
    v100     = M_yz*S_xx
    v116     = M_xxx*S_xx
    v126     = M_xyy*S_xx
    v150     = M_xxy*S_xx
    v165     = M_yyy*S_xx
    v189     = M_xxz*S_xx
    v199     = M_yyz*S_xx
    Ms_xx    = 0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11
    S_yy     = v12
    v24      = M_y*S_yy
    v35      = M_z*S_yy
    v41      = M_xx*S_yy
    v44      = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v42 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v41 + 4.0d0*v43))
    v54      = M_yy*S_yy
    v66      = M_xy*S_yy
    v77      = M_xz*S_yy
    v117     = M_xxx*S_yy
    v127     = M_xyy*S_yy
    v151     = M_xxy*S_yy
    v166     = M_yyy*S_yy
    v190     = M_xxz*S_yy
    v200     = M_yyz*S_yy
    Ms_yy    = 0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11
    S_zz     = -(S_xx + S_yy)
    S_xxx    = x*(v13 + v4)
    v45      = M_x*S_xxx
    v80      = M_z*S_xxx
    v114     = M_xx*S_xxx
    v131     = M_yy*S_xxx
    v155     = M_xy*S_xxx
    v192     = M_xz*S_xxx
    v229     = M_yz*S_xxx
    Ms_xxx   = M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19))
    S_xxy    = v21*y
    v53      = S_xxy*v52
    v62      = M_x*S_xxy
    v101     = M_z*S_xxy
    v125     = M_xy*S_xxy
    v145     = M_xx*S_xxy
    v163     = M_yy*S_xxy
    v201     = M_yz*S_xxy
    Ms_xxy   = M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v22 + 4.0d0* &
      v23 - v24 - v25 - v26 - v27))
    S_xxz    = v21*z
    v56      = M_z*S_xxz
    v70      = M_x*S_xxz
    v129     = M_xz*S_xxz
    v169     = M_yz*S_xxz
    v182     = M_xx*S_xxz
    v195     = M_yy*S_xxz
    v220     = M_xy*S_xxz
    Ms_xxz   = M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v28 + v30) + 7.0d0*(v29 + v34) + 2.0d0 &
      *(-v31 + v32 - v33 + v35))
    S_xyy    = v36*x
    v68      = M_y*S_xyy
    v81      = M_z*S_xyy
    v85      = S_xyy*v84
    v115     = M_xx*S_xyy
    v132     = M_yy*S_xyy
    v156     = M_xy*S_xyy
    v193     = M_xz*S_xyy
    Ms_xyy   = M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19))
    S_xzz    = -(S_xxx + S_xyy)
    S_yyy    = y*(v13 + v5)
    v88      = M_y*S_yyy
    v102     = M_z*S_yyy
    v146     = M_xx*S_yyy
    v164     = M_yy*S_yyy
    v202     = M_yz*S_yyy
    v207     = M_xy*S_yyy
    v225     = M_xz*S_yyy
    Ms_yyy   = M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v22 - 2.0d0*v23 + 3.0d0*v24 + &
      3.0d0*v25 - 2.0d0*v26 - 2.0d0*v27))
    S_yyz    = v36*z
    v91      = M_z*S_yyz
    v97      = M_y*S_yyz
    v170     = M_yz*S_yyz
    v183     = M_xx*S_yyz
    v196     = M_yy*S_yyz
    v210     = M_xz*S_yyz
    v221     = M_xy*S_yyz
    Ms_yyz   = M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v31 + v33) + 7.0d0*(v32 + v35) + 2.0d0 &
      *(-v28 + v29 - v30 + v34))
    S_yzz    = -(S_xxy + S_yyy)
    S_zzz    = -(S_xxz + S_yyz)
    S_xxxx   = 0.142857142857143d0*(-6.0d0*v40) + v37 + v39
    v109     = M_x*S_xxxx
    v160     = M_y*S_xxxx
    v203     = M_z*S_xxxx
    Ms_xxxx  = M_0*S_xxxx + v44 - v49 - v53 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v46 - 96.0d0*v51 + 80.0d0*(v45 + v47) - &
      60.0d0*(v50 + v56) + 24.0d0*(v54 + v55))
    S_xxxy   = v0*v58
    v130     = M_y*S_xxxy
    v144     = M_x*S_xxxy
    v230     = M_z*S_xxxy
    Ms_xxxy  = M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v61 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 - 2.0d0*v66 &
      - 2.0d0*v67 - 2.0d0*v68 - 2.0d0*v69))
    S_xxxz   = v1*v58
    v136     = M_z*S_xxxz
    v181     = M_x*S_xxxz
    Ms_xxxz  = 0.142857142857143d0*(15.0d0*(v70 + v73) + 13.0d0*(v72 + v80) + 6.0d0*( &
      -v74 + v75 + v77 + v78 - v79 + v81)) + M_0*S_xxxz + M_xxxz - M_y* &
      v60 + S_xx*v76 + S_xz*v71 - v59*y
    S_xxyy   = 0.0285714285714286d0*v38 - v4*v82 - v5*v82 + v83
    v110     = M_x*S_xxyy
    v161     = M_y*S_xxyy
    v177     = M_z*S_xxyy
    Ms_xxyy  = 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v42 + 39.0d0*(v41 + v43) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v45 + 12.0d0*v46 + &
      10.0d0*v47 + 10.0d0*v50 + 12.0d0*v51 + 12.0d0*v54 + 12.0d0*v55 + &
      10.0d0*v56 + 10.0d0*v88 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91)) &
      + M_0*S_xxyy + v49 + v53 + v85 + v87
    S_xxyz   = v2*(v4 + v92)
    v171     = M_z*S_xxyz
    v194     = M_y*S_xxyz
    v215     = M_x*S_xxyz
    Ms_xxyz  = 0.142857142857143d0*(12.0d0*(v95 + v96) + 9.0d0*(v100 + v101 + v93 + v94 &
      ) + 2.0d0*(v102 - v97 + v98 - v99)) + M_0*S_xxyz + M_xxyz + M_xxz &
      *y + M_xyz*v86 + M_y*S_xxz + S_xyz*v84
    S_xxzz   = -(S_xxxx + S_xxyy)
    v111     = M_x*S_xxzz
    v140     = M_y*S_xxzz
    v178     = M_z*S_xxzz
    S_xyyy   = v0*v103
    v211     = M_y*S_xyyy
    v231     = M_z*S_xyyy
    v233     = M_x*S_xyyy
    Ms_xyyy  = M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v61 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 + 5.0d0*v66 &
      + 5.0d0*v67 + 5.0d0*v68 + 5.0d0*v69))
    S_xyyz   = v1*(v5 + v92)
    v214     = M_z*S_xyyz
    v226     = M_y*S_xyyz
    v237     = M_x*S_xyyz
    Ms_xyyz  = 0.142857142857143d0*(12.0d0*(v74 + v79) + 2.0d0*(-v70 + v72 - v73 + v80 &
      ) + 9.0d0*(v75 + v77 + v78 + v81)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v48 + M_yyz*x + S_xyz*v52
    S_xyzz   = -(S_xxxy + S_xyyy)
    S_xzzz   = -(S_xxxz + S_xyyz)
    S_yyyy   = 0.142857142857143d0*(-6.0d0*v105) + v104 + v39
    v112     = M_x*S_yyyy
    v162     = M_y*S_yyyy
    v204     = M_z*S_yyyy
    Ms_yyyy  = M_0*S_yyyy + v44 - v85 - v87 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v54 - 96.0d0*v55 + 24.0d0*(v46 + v51) + &
      80.0d0*(v88 + v89) - 60.0d0*(v90 + v91))
    S_yyyz   = v103*v2
    v236     = M_z*S_yyyz
    v239     = M_y*S_yyyz
    Ms_yyyz  = 0.142857142857143d0*(13.0d0*(v102 + v98) + 15.0d0*(v97 + v99) + 6.0d0*( &
      v100 + v101 + v93 + v94 - v95 - v96)) + M_0*S_yyyz - M_x*v60 + &
      M_yy*v106 + M_yyyz + S_yy*v107 - v59*x
    S_yyzz   = -(S_xxyy + S_yyyy)
    v113     = M_x*S_yyzz
    v141     = M_y*S_yyzz
    v143     = -0.0476190476190476d0*(M_yyyyy + v139 + v140 + v141 + v142 + v243)
    v179     = M_z*S_yyzz
    v180     = 0.0476190476190476d0*(18.0d0*(v172 + v177) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v173 + 48.0d0*v174 + 48.0d0*v175 + 5.0d0*v176 + &
      5.0d0*v178 + 5.0d0*v179))
    v206     = -0.0476190476190476d0*(M_xxxxx + v111 + v113 + v124 + v134 + v242)
    S_yzzz   = -(S_xxyz + S_yyyz)
    S_zzzz   = -(S_xxzz + S_yyzz)
    S_xxxxx  = x*(0.111111111111111d0*(-10.0d0*v40) + v108 + v37)
    Ms_xxxxx = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v109 + v118) + 330.0d0*(v114 + v116) - 30.0d0*(M_xxxyy + v110 + &
      v122) + 60.0d0*(v115 + v117 + v126 + v131) - 140.0d0*(v119 + v120 &
      + v130 + v136) - 300.0d0*(v121 + v123 + v125 + v129) + 120.0d0*( &
      v127 + v128 + v132 + v135) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v111 + v112 + v113 + v124 + v133 + v134))
    S_xxxxy  = v138*y
    Ms_xxxxy = M_0*S_xxxxy + v143 + 0.0476190476190476d0*(78.0d0*(v145 + v150) + 4.0d0* &
      (v146 + v165) + 20.0d0*(M_xxxxy + v148 + v160) + 56.0d0*(v144 + &
      v147 + v149 + v155) + 8.0d0*(v164 + v166 + v168 + v170) - (2.0d0* &
      M_xxyyy + 24.0d0*v151 + 30.0d0*v152 + 28.0d0*v153 + 28.0d0*v154 + &
      48.0d0*v156 + 48.0d0*v157 + 48.0d0*v158 + 48.0d0*v159 + 30.0d0* &
      v161 + v162 + 24.0d0*v163 + v167 + 28.0d0*v169 + 28.0d0*v171))
    S_xxxxz  = v138*z
    Ms_xxxxz = M_0*S_xxxxz + v180 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v181 &
      + v186) + 106.0d0*(v182 + v189) + 4.0d0*(v183 + v199) + 104.0d0*( &
      v184 + v192) + 44.0d0*(v185 + v203) + 32.0d0*(v190 + v195) + &
      48.0d0*(v191 + v193) + 8.0d0*(v196 + v200) - (M_yyyyz + 36.0d0* &
      v187 + 28.0d0*v188 + 28.0d0*v194 + 8.0d0*v197 + 5.0d0*v198 + &
      36.0d0*v201 + 8.0d0*v202 + 5.0d0*v204))
    S_xxxyy  = x*(-v5*v6 + v137 + v205 + v83)
    Ms_xxxyy = M_0*S_xxxyy + v206 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v109 &
      + v118) + 141.0d0*(v110 + v122) + 159.0d0*(v115 + v126) + 75.0d0* &
      (v117 + v131) + 112.0d0*(v119 + v130) - 14.0d0*(v120 + v136) + &
      276.0d0*(v121 + v125) - 3.0d0*(M_xyyyy + v112 + v133) - 18.0d0*( &
      v114 + v116 + v123 + v129) - 60.0d0*(v127 + v128 + v132 + v135) - &
      42.0d0*(v207 + v208 + v209 + v210 + v211 + v212 + v213 + v214))
    S_xxxyz  = v3*v8
    Ms_xxxyz = 0.333333333333333d0*(9.0d0*M_xxy*S_xz + 7.0d0*(v215 + v218 + v219 + v220 &
      ) + 5.0d0*(v216 + v217 + v229 + v230) + 2.0d0*(-v221 + v222 - &
      v223 + v225 - v226 + v227 - v228 + v231)) + M_0*S_xxxyz + M_xxxyz &
      + M_xxxz*y + M_y*S_xxxz + S_xx*v224 + S_xxy*v76 + S_xyz*v71
    S_xxyyy  = y*(-v4*v6 + v137 + v232)
    Ms_xxyyy = M_0*S_xxyyy + v143 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v146 &
      + v165) + 159.0d0*(v151 + v163) + 141.0d0*(v152 + v161) + 276.0d0 &
      *(v156 + v157) - 17.0d0*(v162 + v167) + 112.0d0*(v233 + v234) - &
      14.0d0*(v235 + v236) - 3.0d0*(M_xxxxy + v148 + v160) - 60.0d0*( &
      v145 + v150 + v158 + v159) - 18.0d0*(v164 + v166 + v168 + v170) - &
      42.0d0*(v144 + v147 + v149 + v153 + v154 + v155 + v169 + v171))
    S_xxyyz  = z*(0.0158730158730159d0*v38 + v205 + v232)
    Ms_xxyyz = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v174 + v175) + 6.0d0*(v184 + v192 + v197 + v202) + 9.0d0*(v185 + &
      v198 + v203 + v204) + 132.0d0*(v187 + v191 + v193 + v201) + &
      112.0d0*(v188 + v194 + v237 + v238) + 81.0d0*(v172 + v177 + v183 &
      + v190 + v195 + v199) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v173 + 5.0d0*v176 + 5.0d0*v178 + 5.0d0*v179 + 14.0d0*v181 + &
      6.0d0*v182 + 14.0d0*v186 + 6.0d0*v189 + 6.0d0*v196 + 6.0d0*v200 + &
      14.0d0*v239 + 14.0d0*v240))
    S_xyyyy  = v241*x
    Ms_xyyyy = M_0*S_xyyyy + v206 + 0.0476190476190476d0*(4.0d0*(v117 + v131) + 78.0d0* &
      (v127 + v132) + 20.0d0*(M_xyyyy + v112 + v133) + 8.0d0*(v114 + &
      v116 + v123 + v129) + 56.0d0*(v207 + v208 + v211 + v212) - (2.0d0 &
      *M_xxxyy + v109 + 30.0d0*v110 + 24.0d0*v115 + v118 + 48.0d0*v121 &
      + 30.0d0*v122 + 48.0d0*v125 + 24.0d0*v126 + 48.0d0*v128 + 48.0d0* &
      v135 + 28.0d0*v209 + 28.0d0*v210 + 28.0d0*v213 + 28.0d0*v214))
    S_xyyyz  = v12*v3
    Ms_xyyyz = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v221 + v223 + v226 + v228 &
      ) + 5.0d0*(v222 + v225 + v227 + v231) + 2.0d0*(-v215 + v216 + &
      v217 - v218 - v219 - v220 + v229 + v230)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v106 + M_xyyyz + M_yyyz*x + S_xyy*v107 + S_yy*v224
    S_yyyyy  = y*(0.111111111111111d0*(-10.0d0*v105) + v104 + v108)
    Ms_yyyyy = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v162 + v167) + 330.0d0*(v164 + v166) - 30.0d0*(M_xxyyy + v152 + &
      v161) + 120.0d0*(v145 + v150 + v158 + v159) + 60.0d0*(v146 + v151 &
      + v163 + v165) - 300.0d0*(v156 + v157 + v168 + v170) - 140.0d0*( &
      v233 + v234 + v235 + v236) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v139 + v140 + v141 + v142 + v148 + v160))
    S_yyyyz  = v241*z
    Ms_yyyyz = M_0*S_yyyyz + v180 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v182 &
      + v189) + 32.0d0*(v183 + v199) + 48.0d0*(v187 + v201) + 4.0d0*( &
      v190 + v195) + 106.0d0*(v196 + v200) + 104.0d0*(v197 + v202) + &
      44.0d0*(v198 + v204) + 56.0d0*(v239 + v240) - (M_xxxxz + 8.0d0* &
      v184 + 5.0d0*v185 + 36.0d0*v191 + 8.0d0*v192 + 36.0d0*v193 + &
      5.0d0*v203 + 28.0d0*v237 + 28.0d0*v238))
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  x                   
#undef  z                   
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
    
! OPS  364*ADD + 2*DIV + 555*MUL + 50*NEG + POW + 14*SUB = 986  (1291 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v105, v106, v107, v108, v109, v11,&
                v110, v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21,&
                v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32,&
                v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43,&
                v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54,&
                v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65,&
                v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76,&
                v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87,&
                v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98,&
                v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz
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
#define M_xxx                M(9)
#define L_xxx                L(9)
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
#define L_xxxxx              L(25)
#define M_xxxxx              M(25)
#define M_xxxxy              M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define L_xxxyy              L(28)
#define M_xxxyy              M(28)
#define L_xxxyz              L(29)
#define M_xxxyz              M(29)
#define M_xxyyy              M(30)
#define L_xxyyy              L(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define L_xyyyy              L(32)
#define M_xyyyy              M(32)
#define L_xyyyz              L(33)
#define M_xyyyz              M(33)
#define M_yyyyy              M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_yyyyz              M(35)
    v110    = y*z
    v107    = 15.0d0*v110
    v40     = 0.5d0*M_xx
    v46     = 0.166666666666667d0*M_xxx
    v47     = 0.5d0*M_xxy
    v48     = 0.5d0*M_xxz
    v64     = 0.0416666666666667d0*M_xxxx
    v65     = 0.166666666666667d0*M_xxxy
    v66     = 0.166666666666667d0*M_xxxz
    v67     = 0.25d0*M_xxyy
    v68     = 0.5d0*M_xxyz
    v81     = 0.5d0*M_yy
    v83     = 0.166666666666667d0*M_yyy
    v84     = 0.5d0*M_yyz
    v88     = 0.0416666666666667d0*M_yyyy
    v89     = 0.166666666666667d0*M_yyyz
    M_zz    = -(M_xx + M_yy)
    v96     = 0.5d0*M_zz
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    v97     = 0.166666666666667d0*M_zzz
    M_xxzz  = -(M_xxxx + M_xxyy)
    v69     = 0.25d0*M_xxzz
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    v90     = 0.25d0*M_yyzz
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    v98     = 0.0416666666666667d0*M_zzzz
    M_xxxzz = -(M_xxxxx + M_xxxyy)
    M_xxyzz = -(M_xxxxy + M_xxyyy)
    M_xxzzz = -(M_xxxxz + M_xxyyz)
    M_xyyzz = -(M_xxxyy + M_xyyyy)
    M_xyzzz = -(M_xxxyz + M_xyyyz)
    M_xzzzz = -(M_xxxzz + M_xyyzz)
    M_yyyzz = -(M_xxyyy + M_yyyyy)
    M_yyzzz = -(M_xxyyz + M_yyyyz)
    M_yzzzz = -(M_xxyzz + M_yyyzz)
    M_zzzzz = -(M_xxzzz + M_yyzzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v99     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v99
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v100    = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v100
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v101    = 3.0d0*h
    v102    = h*v0
    v103    = h*v1
    v4      = -h
    v12     = v101
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v102
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v103
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 + 630.0d0*v102 - 945.0d0*v19
    v38     = -(v18 + 63.0d0*v26)
    v55     = v35 + 630.0d0*v103 - 945.0d0*v30
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
    v104    = 3.0d0*v3
    v6      = v104*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v104*v110
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v105    = 3.0d0*v8
    v9      = v8*x
    v11     = v105*(h - v10)
    D_xxx   = 3.0d0*v9*(v101 - v99)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    v70     = 0.5d0*D_xyy
    D_xyz   = -v107*v9
    D_xzz   = -(D_xxx + D_xyy)
    v76     = 0.5d0*D_xzz
    D_yyy   = v105*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    v91     = 0.5d0*D_yzz
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v106    = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v106*y
    v25     = v106*z
    v27     = v107*v15
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    D_xxxy  = v21*v24
    D_xxxz  = v24*v25
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    v49     = 0.5d0*D_xxyy
    D_xxyz  = v27*(v23 + v4)
    D_xxzz  = -(D_xxxx + D_xxyy)
    v52     = 0.5d0*D_xxzz
    D_xyyy  = v21*v29
    v58     = 0.5d0*D_xyyy
    v71     = 0.166666666666667d0*D_xyyy
    D_xyyz  = v25*(v28 + v4)
    v74     = 0.5d0*D_xyyz
    D_xyzz  = -(D_xxxy + D_xyyy)
    v61     = 0.5d0*D_xyzz
    D_xzzz  = -(D_xxxz + D_xyyz)
    v77     = 0.166666666666667d0*D_xzzz
    v79     = 0.5d0*D_xzzz
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    D_yyyz  = v27*v29
    D_yyzz  = -(D_xxyy + D_yyyy)
    v85     = 0.5d0*D_yyzz
    D_yzzz  = -(D_xxyz + D_yyyz)
    v92     = 0.166666666666667d0*D_yzzz
    v94     = 0.5d0*D_yzzz
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v108    = 15.0d0*v32
    v109    = v32*z
    v33     = v108*x
    v37     = v109
    v39     = 315.0d0*v109*x*y
    v43     = v108*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = v32*v36*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = v36*v37
    L_xxxx  = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    v41     = 0.5d0*D_xxxyy
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = v39*(h - v5)
    L_xxxy  = D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    v42     = 0.5d0*D_xxxzz
    L_xxx   = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v40 + D_xxxxy*M_xy + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + M_yy*v41 + M_zz*v42
    L_xxxz  = D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z
    D_xxyyy = v43*(v38 + h*v28 + 21.0d0*v20)
    v44     = 0.5d0*D_xxyyy
    v50     = 0.166666666666667d0*D_xxyyy
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = v37*(v34 - 945.0d0*v100 + 105.0d0*(v102 + v103))
    v51     = 0.5d0*D_xxyyz
    L_xxyy  = D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    v45     = 0.5d0*D_xxyzz
    L_xxy   = D_xxxxy*v40 + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z + M_yy*v44 + M_zz*v45
    L_xxyz  = D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    v53     = 0.166666666666667d0*D_xxzzz
    v54     = 0.5d0*D_xxzzz
    L_xx    = D_xx*M_0 + D_xxx*M_x + D_xxxx*v40 + D_xxxxx*v46 + D_xxxxy*v47 + D_xxxxz* &
      v48 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy*M_y + &
      D_xxyz*M_yz + D_xxz*M_z + M_xyy*v41 + M_xzz*v42 + M_yy*v49 + &
      M_yyy*v50 + M_yyz*v51 + M_yzz*v45 + M_zz*v52 + M_zzz*v53
    L_xxz   = D_xxxxz*v40 + D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + M_yy*v51 + M_zz*v54
    D_xyyyy = v32*v55*x
    v56     = 0.5d0*D_xyyyy
    v59     = 0.166666666666667d0*D_xyyyy
    v72     = 0.0416666666666667d0*D_xyyyy
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = v39*(h - v7)
    v60     = 0.5d0*D_xyyyz
    v73     = 0.166666666666667d0*D_xyyyz
    L_xyyy  = D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    v57     = 0.5d0*D_xyyzz
    v75     = 0.25d0*D_xyyzz
    L_xyy   = D_xxxyy*v40 + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z + M_yy*v56 + M_zz*v57
    L_xyyz  = D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    v62     = 0.166666666666667d0*D_xyzzz
    v63     = 0.5d0*D_xyzzz
    L_xy    = D_xxxxy*v46 + D_xxxy*v40 + D_xxxyy*v47 + D_xxxyz*v48 + D_xxy*M_x + &
      D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy*M_y &
      + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v44 + M_xzz*v45 + M_yy*v58 + &
      M_yyy*v59 + M_yyz*v60 + M_yzz*v57 + M_zz*v61 + M_zzz*v62
    L_xyz   = D_xxxyz*v40 + D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + M_yy*v60 + M_zz*v63
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    v78     = 0.0416666666666667d0*D_xzzzz
    v80     = 0.166666666666667d0*D_xzzzz
    L_x     = D_x*M_0 + D_xx*M_x + D_xxx*v40 + D_xxxx*v46 + D_xxxxx*v64 + D_xxxxy*v65 &
      + D_xxxxz*v66 + D_xxxy*v47 + D_xxxyy*v67 + D_xxxyz*v68 + D_xxxz* &
      v48 + D_xxxzz*v69 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy &
      *M_y + D_xyz*M_yz + D_xz*M_z + M_xyy*v49 + M_xyyy*v50 + M_xyyz* &
      v51 + M_xyzz*v45 + M_xzz*v52 + M_xzzz*v53 + M_yy*v70 + M_yyy*v71 &
      + M_yyyy*v72 + M_yyyz*v73 + M_yyz*v74 + M_yyzz*v75 + M_yzz*v61 + &
      M_yzzz*v62 + M_zz*v76 + M_zzz*v77 + M_zzzz*v78
    L_xz    = D_xxxxz*v46 + D_xxxyz*v47 + D_xxxz*v40 + D_xxxzz*v48 + D_xxyz*M_xy + &
      D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + D_xyzz*M_yz &
      + D_xz*M_0 + D_xzz*M_z + M_xyy*v51 + M_xzz*v54 + M_yy*v74 + M_yyy &
      *v73 + M_yyz*v57 + M_yzz*v63 + M_zz*v79 + M_zzz*v80
    D_yyyyy = v43*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = v37*v55
    L_yyyy  = D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    v82     = 0.5d0*D_yyyzz
    L_yyy   = D_xxyyy*v40 + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyy*v81 + D_yyyyz*M_yz + D_yyyz*M_z + M_zz*v82
    L_yyyz  = D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    v86     = 0.166666666666667d0*D_yyzzz
    v87     = 0.5d0*D_yyzzz
    L_yy    = D_xxxyy*v46 + D_xxyy*v40 + D_xxyyy*v47 + D_xxyyz*v48 + D_xyy*M_x + &
      D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy*M_y &
      + D_yyyy*v81 + D_yyyyy*v83 + D_yyyyz*v84 + D_yyyz*M_yz + D_yyz* &
      M_z + M_xyy*v56 + M_xzz*v57 + M_yzz*v82 + M_zz*v85 + M_zzz*v86
    L_yyz   = D_xxyyz*v40 + D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyz*v81 + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_zz*v87
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    v93     = 0.0416666666666667d0*D_yzzzz
    v95     = 0.166666666666667d0*D_yzzzz
    L_y     = D_xxxxy*v64 + D_xxxy*v46 + D_xxxyy*v65 + D_xxxyz*v66 + D_xxy*v40 + &
      D_xxyy*v47 + D_xxyyy*v67 + D_xxyyz*v68 + D_xxyz*v48 + D_xxyzz*v69 &
      + D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + &
      D_yy*M_y + D_yyy*v81 + D_yyyy*v83 + D_yyyyy*v88 + D_yyyyz*v89 + &
      D_yyyz*v84 + D_yyyzz*v90 + D_yyz*M_yz + D_yz*M_z + M_xyy*v58 + &
      M_xyyy*v59 + M_xyyz*v60 + M_xyzz*v57 + M_xzz*v61 + M_xzzz*v62 + &
      M_yzz*v85 + M_yzzz*v86 + M_zz*v91 + M_zzz*v92 + M_zzzz*v93
    L_yz    = D_xxxyz*v46 + D_xxyyz*v47 + D_xxyz*v40 + D_xxyzz*v48 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyyyz*v83 + D_yyyz* &
      v81 + D_yyyzz*v84 + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz* &
      M_z + M_xyy*v60 + M_xzz*v63 + M_yzz*v87 + M_zz*v94 + M_zzz*v95
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = 0.00833333333333333d0*(D_xxxxx*M_xxxxx + 20.0d0*D_xxxyz*M_xxxyz + &
      D_yyyyy*M_yyyyy + D_zzzzz*M_zzzzz + 30.0d0*(D_xxyyz*M_xxyyz + &
      D_xxyzz*M_xxyzz) + 5.0d0*(D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + &
      D_yyyyz*M_yyyyz) + 10.0d0*(D_xxxyy*M_xxxyy + D_xxxzz*M_xxxzz + &
      D_xxyyy*M_xxyyy + D_xxzzz*M_xxzzz + D_yyyzz*M_yyyzz + D_yyzzz* &
      M_yyzzz)) + D_0*M_0 + D_x*M_x + D_xx*v40 + D_xxx*v46 + D_xxxx*v64 &
      + D_xxxy*v65 + D_xxxz*v66 + D_xxy*v47 + D_xxyy*v67 + D_xxyz*v68 + &
      D_xxz*v48 + D_xxzz*v69 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + &
      D_y*M_y + D_yy*v81 + D_yyy*v83 + D_yyyy*v88 + D_yyyz*v89 + D_yyz* &
      v84 + D_yyzz*v90 + D_yz*M_yz + D_z*M_z + D_zz*v96 + D_zzz*v97 + &
      D_zzzz*v98 + M_xyy*v70 + M_xyyy*v71 + M_xyyyy*v72 + M_xyyyz*v73 + &
      M_xyyz*v74 + M_xyyzz*v75 + M_xyzz*v61 + M_xyzzz*v62 + M_xzz*v76 + &
      M_xzzz*v77 + M_xzzzz*v78 + M_yzz*v91 + M_yzzz*v92 + M_yzzzz*v93
    L_z     = D_xxxxz*v64 + D_xxxyz*v65 + D_xxxz*v46 + D_xxxzz*v66 + D_xxyyz*v67 + &
      D_xxyz*v47 + D_xxyzz*v68 + D_xxz*v40 + D_xxzz*v48 + D_xxzzz*v69 + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyz*v88 + &
      D_yyyz*v83 + D_yyyzz*v89 + D_yyz*v81 + D_yyzz*v84 + D_yyzzz*v90 + &
      D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v96 + D_zzzz* &
      v97 + D_zzzzz*v98 + M_xyy*v74 + M_xyyy*v73 + M_xyyz*v57 + M_xyzz* &
      v63 + M_xzz*v79 + M_xzzz*v80 + M_yzz*v94 + M_yzzz*v95
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
#undef  M_xxx               
#undef  L_xxx               
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
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  L_xxxyy             
#undef  M_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  M_xxyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
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
    
! OPS  519*ADD + 639*MUL + 47*NEG + 95*SUB = 1300  (2167 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v105, v106, v107, v108, v109, v11,&
                v110, v111, v112, v113, v114, v115, v116, v117, v118, v119,&
                v12, v120, v121, v122, v123, v124, v125, v126, v127, v128,&
                v129, v13, v130, v131, v132, v133, v134, v135, v136, v137,&
                v138, v139, v14, v140, v141, v142, v143, v144, v145, v146,&
                v147, v148, v149, v15, v150, v151, v152, v153, v154, v155,&
                v156, v157, v158, v159, v16, v160, v161, v162, v163, v164,&
                v165, v166, v167, v168, v169, v17, v170, v171, v172, v173,&
                v174, v175, v176, v177, v178, v179, v18, v180, v181, v182,&
                v183, v184, v185, v186, v187, v188, v189, v19, v190, v191,&
                v192, v193, v194, v195, v196, v197, v198, v199, v2, v20, v200,&
                v201, v202, v203, v204, v205, v206, v207, v208, v209, v21,&
                v210, v211, v212, v213, v214, v215, v216, v217, v218, v219,&
                v22, v220, v221, v222, v223, v224, v225, v226, v227, v228,&
                v229, v23, v230, v231, v232, v233, v234, v235, v236, v237,&
                v238, v239, v24, v240, v241, v242, v243, v25, v26, v27, v28,&
                v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz,&
                M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz,&
                M_yzzzz, M_zzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy,&
                S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz, S_yyy,&
                S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz,&
                S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy, S_yyyz,&
                S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz, S_xxxyy,&
                S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy, S_xyyyz, S_yyyyy, S_yyyyz
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define x                    r(1)
#define z                    r(3)
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
#define Ms_xxx               Ms(9)
#define M_xxx                M(9)
#define M_xxy                M(10)
#define Ms_xxy               Ms(10)
#define Ms_xxz               Ms(11)
#define M_xxz                M(11)
#define Ms_xyy               Ms(12)
#define M_xyy                M(12)
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
#define M_xxyy               M(19)
#define Ms_xxyy              Ms(19)
#define Ms_xxyz              Ms(20)
#define M_xxyz               M(20)
#define M_xyyy               M(21)
#define Ms_xyyy              Ms(21)
#define Ms_xyyz              Ms(22)
#define M_xyyz               M(22)
#define M_yyyy               M(23)
#define Ms_yyyy              Ms(23)
#define M_yyyz               M(24)
#define Ms_yyyz              Ms(24)
#define Ms_xxxxx             Ms(25)
#define M_xxxxx              M(25)
#define Ms_xxxxy             Ms(26)
#define M_xxxxy              M(26)
#define Ms_xxxxz             Ms(27)
#define M_xxxxz              M(27)
#define Ms_xxxyy             Ms(28)
#define M_xxxyy              M(28)
#define M_xxxyz              M(29)
#define Ms_xxxyz             Ms(29)
#define Ms_xxyyy             Ms(30)
#define M_xxyyy              M(30)
#define Ms_xxyyz             Ms(31)
#define M_xxyyz              M(31)
#define Ms_xyyyy             Ms(32)
#define M_xyyyy              M(32)
#define M_xyyyz              M(33)
#define Ms_xyyyz             Ms(33)
#define M_yyyyy              M(34)
#define Ms_yyyyy             Ms(34)
#define Ms_yyyyz             Ms(35)
#define M_yyyyz              M(35)
    v0       = x*y
    v1       = x*z
    v2       = y*z
    v3       = v0*z
    v9       = M_x*x
    v10      = M_y*y
    v11      = -0.666666666666667d0*M_z*z
    v15      = M_xx*x
    v16      = M_xy*y
    v17      = M_xz*z
    v23      = M_xy*x
    v25      = M_yy*y
    v26      = M_yz*z
    v29      = M_xx*z
    v30      = M_xz*x
    v32      = M_yy*z
    v33      = M_yz*y
    v47      = M_xxx*x
    v48      = 1.71428571428571d0*y
    v49      = M_xxy*v48
    v50      = M_xxz*z
    v52      = 1.71428571428571d0*M_y
    v59      = 0.857142857142857d0*M_xyz
    v64      = M_xxy*x
    v67      = M_xyy*y
    v71      = 3.0d0*M_xx
    v72      = M_xxx*z
    v73      = M_xxz*x
    v75      = M_xyy*z
    v76      = 3.0d0*M_xz
    v84      = 1.71428571428571d0*M_x
    v86      = 1.71428571428571d0*x
    v87      = M_xyy*v86
    v89      = M_yyy*y
    v90      = M_yyz*z
    v94      = M_xxy*z
    v98      = M_yyy*z
    v99      = M_yyz*y
    v107     = 3.0d0*M_yz
    v118     = M_xxxx*x
    v119     = M_xxxy*y
    v120     = M_xxxz*z
    v122     = M_xxyy*x
    v133     = M_yyyy*x
    v148     = M_xxxx*y
    v149     = M_xxxy*x
    v152     = M_xxyy*y
    v153     = M_xxyz*z
    v167     = M_yyyy*y
    v172     = M_xxyy*z
    v185     = M_xxxx*z
    v186     = M_xxxz*x
    v188     = M_xxyz*y
    v198     = M_yyyy*z
    v208     = M_xyyy*y
    v209     = M_xyyz*z
    v217     = M_xxxy*z
    v218     = M_xxyz*x
    v222     = M_xyyy*z
    v223     = M_xyyz*y
    v224     = 3.0d0*M_xyz
    v234     = M_xyyy*x
    v235     = M_yyyz*z
    v238     = M_xyyz*x
    v240     = M_yyyz*y
    Ms_0     = Ms_0 + (M_0)
    Ms_x     = Ms_x + (M_0*x + M_x)
    Ms_y     = Ms_y + (M_0*y + M_y)
    Ms_z     = Ms_z + (M_0*z + M_z)
    M_zz     = -(M_xx + M_yy)
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    M_xxzz   = -(M_xxxx + M_xxyy)
    v124     = M_xxzz*x
    v139     = M_xxzz*y
    v173     = M_xxzz*z
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v134     = M_yyzz*x
    v142     = M_yyzz*y
    v176     = M_yyzz*z
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    v242     = M_xxxzz + M_xyyzz
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -v242
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v243     = M_xxyzz + M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    M_yzzzz  = -v243
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    S_0      = 1
    S_x      = x
    S_y      = y
    S_z      = z
    S_xy     = v0
    v18      = M_y*S_xy
    v22      = M_x*S_xy
    v42      = M_xy*S_xy
    v63      = M_xx*S_xy
    v69      = M_yy*S_xy
    v79      = M_yz*S_xy
    v96      = M_xz*S_xy
    v121     = M_xxy*S_xy
    v147     = M_xxx*S_xy
    v157     = M_xyy*S_xy
    v175     = M_xyz*S_xy
    v212     = M_yyy*S_xy
    v219     = M_xxz*S_xy
    v228     = M_yyz*S_xy
    Ms_xy    = Ms_xy + (M_xy + M_0*S_xy + M_x*y + M_y*x)
    S_xz     = v1
    v19      = M_z*S_xz
    v28      = M_x*S_xz
    v51      = M_xz*S_xz
    v78      = M_yy*S_xz
    v95      = M_xy*S_xz
    v123     = M_xxz*S_xz
    v158     = M_xyz*S_xz
    v184     = M_xxx*S_xz
    v191     = M_xyy*S_xz
    v213     = M_yyz*S_xz
    v227     = M_yyy*S_xz
    Ms_xz    = Ms_xz + (M_xz + M_0*S_xz + M_x*z + M_z*x)
    S_yz     = v2
    v27      = M_z*S_yz
    v31      = M_y*S_yz
    v55      = M_yz*S_yz
    v74      = M_xy*S_yz
    v93      = M_xx*S_yz
    v106     = 3.0d0*S_yz
    v128     = M_xyz*S_yz
    v154     = M_xxz*S_yz
    v168     = M_yyz*S_yz
    v187     = M_xxy*S_yz
    v197     = M_yyy*S_yz
    v216     = M_xxx*S_yz
    Ms_yz    = Ms_yz + (M_yz + M_0*S_yz + M_y*z + M_z*y)
    S_xyz    = v3
    v60      = 0.857142857142857d0*S_xyz
    v61      = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v60 + v59*z)
    v135     = M_yz*S_xyz
    v159     = M_xz*S_xyz
    v174     = M_xy*S_xyz
    Ms_xyz   = Ms_xyz + (M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v4       = a2
    a3       = a1*a2
    a4       = a2*a2
    v37      = a4
    a5       = a2*a3
    b2       = b1*b1
    v5       = b2
    v83      = v4*v5
    b3       = b1*b2
    b4       = b2*b2
    v104     = b4
    b5       = b2*b3
    c2       = c1*c1
    h        = c2 + v4 + v5
    v6       = 0.333333333333333d0*h
    v7       = -v6
    v8       = v4 + v7
    v12      = v5 + v7
    v13      = -0.6d0*h
    v20      = -0.2d0*h
    v21      = v20 + v4
    v36      = v20 + v5
    v38      = h*h
    v39      = 0.0857142857142857d0*v38
    v40      = h*v4
    v57      = -0.428571428571429d0*h
    v58      = v4 + v57
    v82      = 0.142857142857143d0*h
    v92      = -v82
    v103     = v5 + v57
    v105     = h*v5
    v108     = 0.238095238095238d0*v38
    v137     = 0.0476190476190476d0*v38
    v138     = 0.333333333333333d0*(-2.0d0*v40) + v137 + v37
    v205     = -0.111111111111111d0*v40
    v232     = 0.111111111111111d0*(-v105) + v83
    v241     = 0.333333333333333d0*(-2.0d0*v105) + v104 + v137
    S_xx     = v8
    v14      = M_x*S_xx
    v34      = M_z*S_xx
    v43      = M_yy*S_xx
    v46      = M_xx*S_xx
    v65      = M_xy*S_xx
    v100     = M_yz*S_xx
    v116     = M_xxx*S_xx
    v126     = M_xyy*S_xx
    v150     = M_xxy*S_xx
    v165     = M_yyy*S_xx
    v189     = M_xxz*S_xx
    v199     = M_yyz*S_xx
    Ms_xx    = Ms_xx + (0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11)
    S_yy     = v12
    v24      = M_y*S_yy
    v35      = M_z*S_yy
    v41      = M_xx*S_yy
    v44      = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v42 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v41 + 4.0d0*v43))
    v54      = M_yy*S_yy
    v66      = M_xy*S_yy
    v77      = M_xz*S_yy
    v117     = M_xxx*S_yy
    v127     = M_xyy*S_yy
    v151     = M_xxy*S_yy
    v166     = M_yyy*S_yy
    v190     = M_xxz*S_yy
    v200     = M_yyz*S_yy
    Ms_yy    = Ms_yy + (0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11)
    S_zz     = -(S_xx + S_yy)
    S_xxx    = x*(v13 + v4)
    v45      = M_x*S_xxx
    v80      = M_z*S_xxx
    v114     = M_xx*S_xxx
    v131     = M_yy*S_xxx
    v155     = M_xy*S_xxx
    v192     = M_xz*S_xxx
    v229     = M_yz*S_xxx
    Ms_xxx   = Ms_xxx + (M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19)))
    S_xxy    = v21*y
    v53      = S_xxy*v52
    v62      = M_x*S_xxy
    v101     = M_z*S_xxy
    v125     = M_xy*S_xxy
    v145     = M_xx*S_xxy
    v163     = M_yy*S_xxy
    v201     = M_yz*S_xxy
    Ms_xxy   = Ms_xxy + (M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v22 + 4.0d0* &
      v23 - v24 - v25 - v26 - v27)))
    S_xxz    = v21*z
    v56      = M_z*S_xxz
    v70      = M_x*S_xxz
    v129     = M_xz*S_xxz
    v169     = M_yz*S_xxz
    v182     = M_xx*S_xxz
    v195     = M_yy*S_xxz
    v220     = M_xy*S_xxz
    Ms_xxz   = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v28 + v30) + 7.0d0*(v29 + v34) + 2.0d0 &
      *(-v31 + v32 - v33 + v35)))
    S_xyy    = v36*x
    v68      = M_y*S_xyy
    v81      = M_z*S_xyy
    v85      = S_xyy*v84
    v115     = M_xx*S_xyy
    v132     = M_yy*S_xyy
    v156     = M_xy*S_xyy
    v193     = M_xz*S_xyy
    Ms_xyy   = Ms_xyy + (M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19)))
    S_xzz    = -(S_xxx + S_xyy)
    S_yyy    = y*(v13 + v5)
    v88      = M_y*S_yyy
    v102     = M_z*S_yyy
    v146     = M_xx*S_yyy
    v164     = M_yy*S_yyy
    v202     = M_yz*S_yyy
    v207     = M_xy*S_yyy
    v225     = M_xz*S_yyy
    Ms_yyy   = Ms_yyy + (M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v22 - 2.0d0*v23 + 3.0d0*v24 + &
      3.0d0*v25 - 2.0d0*v26 - 2.0d0*v27)))
    S_yyz    = v36*z
    v91      = M_z*S_yyz
    v97      = M_y*S_yyz
    v170     = M_yz*S_yyz
    v183     = M_xx*S_yyz
    v196     = M_yy*S_yyz
    v210     = M_xz*S_yyz
    v221     = M_xy*S_yyz
    Ms_yyz   = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v31 + v33) + 7.0d0*(v32 + v35) + 2.0d0 &
      *(-v28 + v29 - v30 + v34)))
    S_yzz    = -(S_xxy + S_yyy)
    S_zzz    = -(S_xxz + S_yyz)
    S_xxxx   = 0.142857142857143d0*(-6.0d0*v40) + v37 + v39
    v109     = M_x*S_xxxx
    v160     = M_y*S_xxxx
    v203     = M_z*S_xxxx
    Ms_xxxx  = Ms_xxxx + (M_0*S_xxxx + v44 - v49 - v53 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v46 - 96.0d0*v51 + 80.0d0*(v45 + v47) - &
      60.0d0*(v50 + v56) + 24.0d0*(v54 + v55)))
    S_xxxy   = v0*v58
    v130     = M_y*S_xxxy
    v144     = M_x*S_xxxy
    v230     = M_z*S_xxxy
    Ms_xxxy  = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v61 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 - 2.0d0*v66 &
      - 2.0d0*v67 - 2.0d0*v68 - 2.0d0*v69)))
    S_xxxz   = v1*v58
    v136     = M_z*S_xxxz
    v181     = M_x*S_xxxz
    Ms_xxxz  = Ms_xxxz + (0.142857142857143d0*(15.0d0*(v70 + v73) + 13.0d0*(v72 + v80) + 6.0d0*( &
      -v74 + v75 + v77 + v78 - v79 + v81)) + M_0*S_xxxz + M_xxxz - M_y* &
      v60 + S_xx*v76 + S_xz*v71 - v59*y)
    S_xxyy   = 0.0285714285714286d0*v38 - v4*v82 - v5*v82 + v83
    v110     = M_x*S_xxyy
    v161     = M_y*S_xxyy
    v177     = M_z*S_xxyy
    Ms_xxyy  = Ms_xxyy + (0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v42 + 39.0d0*(v41 + v43) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v45 + 12.0d0*v46 + &
      10.0d0*v47 + 10.0d0*v50 + 12.0d0*v51 + 12.0d0*v54 + 12.0d0*v55 + &
      10.0d0*v56 + 10.0d0*v88 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91)) &
      + M_0*S_xxyy + v49 + v53 + v85 + v87)
    S_xxyz   = v2*(v4 + v92)
    v171     = M_z*S_xxyz
    v194     = M_y*S_xxyz
    v215     = M_x*S_xxyz
    Ms_xxyz  = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v95 + v96) + 9.0d0*(v100 + v101 + v93 + v94 &
      ) + 2.0d0*(v102 - v97 + v98 - v99)) + M_0*S_xxyz + M_xxyz + M_xxz &
      *y + M_xyz*v86 + M_y*S_xxz + S_xyz*v84)
    S_xxzz   = -(S_xxxx + S_xxyy)
    v111     = M_x*S_xxzz
    v140     = M_y*S_xxzz
    v178     = M_z*S_xxzz
    S_xyyy   = v0*v103
    v211     = M_y*S_xyyy
    v231     = M_z*S_xyyy
    v233     = M_x*S_xyyy
    Ms_xyyy  = Ms_xyyy + (M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v61 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 + 5.0d0*v66 &
      + 5.0d0*v67 + 5.0d0*v68 + 5.0d0*v69)))
    S_xyyz   = v1*(v5 + v92)
    v214     = M_z*S_xyyz
    v226     = M_y*S_xyyz
    v237     = M_x*S_xyyz
    Ms_xyyz  = Ms_xyyz + (0.142857142857143d0*(12.0d0*(v74 + v79) + 2.0d0*(-v70 + v72 - v73 + v80 &
      ) + 9.0d0*(v75 + v77 + v78 + v81)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v48 + M_yyz*x + S_xyz*v52)
    S_xyzz   = -(S_xxxy + S_xyyy)
    S_xzzz   = -(S_xxxz + S_xyyz)
    S_yyyy   = 0.142857142857143d0*(-6.0d0*v105) + v104 + v39
    v112     = M_x*S_yyyy
    v162     = M_y*S_yyyy
    v204     = M_z*S_yyyy
    Ms_yyyy  = Ms_yyyy + (M_0*S_yyyy + v44 - v85 - v87 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v54 - 96.0d0*v55 + 24.0d0*(v46 + v51) + &
      80.0d0*(v88 + v89) - 60.0d0*(v90 + v91)))
    S_yyyz   = v103*v2
    v236     = M_z*S_yyyz
    v239     = M_y*S_yyyz
    Ms_yyyz  = Ms_yyyz + (0.142857142857143d0*(13.0d0*(v102 + v98) + 15.0d0*(v97 + v99) + 6.0d0*( &
      v100 + v101 + v93 + v94 - v95 - v96)) + M_0*S_yyyz - M_x*v60 + &
      M_yy*v106 + M_yyyz + S_yy*v107 - v59*x)
    S_yyzz   = -(S_xxyy + S_yyyy)
    v113     = M_x*S_yyzz
    v141     = M_y*S_yyzz
    v143     = -0.0476190476190476d0*(M_yyyyy + v139 + v140 + v141 + v142 + v243)
    v179     = M_z*S_yyzz
    v180     = 0.0476190476190476d0*(18.0d0*(v172 + v177) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v173 + 48.0d0*v174 + 48.0d0*v175 + 5.0d0*v176 + &
      5.0d0*v178 + 5.0d0*v179))
    v206     = -0.0476190476190476d0*(M_xxxxx + v111 + v113 + v124 + v134 + v242)
    S_yzzz   = -(S_xxyz + S_yyyz)
    S_zzzz   = -(S_xxzz + S_yyzz)
    S_xxxxx  = x*(0.111111111111111d0*(-10.0d0*v40) + v108 + v37)
    Ms_xxxxx = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v109 + v118) + 330.0d0*(v114 + v116) - 30.0d0*(M_xxxyy + v110 + &
      v122) + 60.0d0*(v115 + v117 + v126 + v131) - 140.0d0*(v119 + v120 &
      + v130 + v136) - 300.0d0*(v121 + v123 + v125 + v129) + 120.0d0*( &
      v127 + v128 + v132 + v135) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v111 + v112 + v113 + v124 + v133 + v134)))
    S_xxxxy  = v138*y
    Ms_xxxxy = Ms_xxxxy + (M_0*S_xxxxy + v143 + 0.0476190476190476d0*(78.0d0*(v145 + v150) + 4.0d0* &
      (v146 + v165) + 20.0d0*(M_xxxxy + v148 + v160) + 56.0d0*(v144 + &
      v147 + v149 + v155) + 8.0d0*(v164 + v166 + v168 + v170) - (2.0d0* &
      M_xxyyy + 24.0d0*v151 + 30.0d0*v152 + 28.0d0*v153 + 28.0d0*v154 + &
      48.0d0*v156 + 48.0d0*v157 + 48.0d0*v158 + 48.0d0*v159 + 30.0d0* &
      v161 + v162 + 24.0d0*v163 + v167 + 28.0d0*v169 + 28.0d0*v171)))
    S_xxxxz  = v138*z
    Ms_xxxxz = Ms_xxxxz + (M_0*S_xxxxz + v180 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v181 &
      + v186) + 106.0d0*(v182 + v189) + 4.0d0*(v183 + v199) + 104.0d0*( &
      v184 + v192) + 44.0d0*(v185 + v203) + 32.0d0*(v190 + v195) + &
      48.0d0*(v191 + v193) + 8.0d0*(v196 + v200) - (M_yyyyz + 36.0d0* &
      v187 + 28.0d0*v188 + 28.0d0*v194 + 8.0d0*v197 + 5.0d0*v198 + &
      36.0d0*v201 + 8.0d0*v202 + 5.0d0*v204)))
    S_xxxyy  = x*(-v5*v6 + v137 + v205 + v83)
    Ms_xxxyy = Ms_xxxyy + (M_0*S_xxxyy + v206 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v109 &
      + v118) + 141.0d0*(v110 + v122) + 159.0d0*(v115 + v126) + 75.0d0* &
      (v117 + v131) + 112.0d0*(v119 + v130) - 14.0d0*(v120 + v136) + &
      276.0d0*(v121 + v125) - 3.0d0*(M_xyyyy + v112 + v133) - 18.0d0*( &
      v114 + v116 + v123 + v129) - 60.0d0*(v127 + v128 + v132 + v135) - &
      42.0d0*(v207 + v208 + v209 + v210 + v211 + v212 + v213 + v214)))
    S_xxxyz  = v3*v8
    Ms_xxxyz = Ms_xxxyz + (0.333333333333333d0*(9.0d0*M_xxy*S_xz + 7.0d0*(v215 + v218 + v219 + v220 &
      ) + 5.0d0*(v216 + v217 + v229 + v230) + 2.0d0*(-v221 + v222 - &
      v223 + v225 - v226 + v227 - v228 + v231)) + M_0*S_xxxyz + M_xxxyz &
      + M_xxxz*y + M_y*S_xxxz + S_xx*v224 + S_xxy*v76 + S_xyz*v71)
    S_xxyyy  = y*(-v4*v6 + v137 + v232)
    Ms_xxyyy = Ms_xxyyy + (M_0*S_xxyyy + v143 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v146 &
      + v165) + 159.0d0*(v151 + v163) + 141.0d0*(v152 + v161) + 276.0d0 &
      *(v156 + v157) - 17.0d0*(v162 + v167) + 112.0d0*(v233 + v234) - &
      14.0d0*(v235 + v236) - 3.0d0*(M_xxxxy + v148 + v160) - 60.0d0*( &
      v145 + v150 + v158 + v159) - 18.0d0*(v164 + v166 + v168 + v170) - &
      42.0d0*(v144 + v147 + v149 + v153 + v154 + v155 + v169 + v171)))
    S_xxyyz  = z*(0.0158730158730159d0*v38 + v205 + v232)
    Ms_xxyyz = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v174 + v175) + 6.0d0*(v184 + v192 + v197 + v202) + 9.0d0*(v185 + &
      v198 + v203 + v204) + 132.0d0*(v187 + v191 + v193 + v201) + &
      112.0d0*(v188 + v194 + v237 + v238) + 81.0d0*(v172 + v177 + v183 &
      + v190 + v195 + v199) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v173 + 5.0d0*v176 + 5.0d0*v178 + 5.0d0*v179 + 14.0d0*v181 + &
      6.0d0*v182 + 14.0d0*v186 + 6.0d0*v189 + 6.0d0*v196 + 6.0d0*v200 + &
      14.0d0*v239 + 14.0d0*v240)))
    S_xyyyy  = v241*x
    Ms_xyyyy = Ms_xyyyy + (M_0*S_xyyyy + v206 + 0.0476190476190476d0*(4.0d0*(v117 + v131) + 78.0d0* &
      (v127 + v132) + 20.0d0*(M_xyyyy + v112 + v133) + 8.0d0*(v114 + &
      v116 + v123 + v129) + 56.0d0*(v207 + v208 + v211 + v212) - (2.0d0 &
      *M_xxxyy + v109 + 30.0d0*v110 + 24.0d0*v115 + v118 + 48.0d0*v121 &
      + 30.0d0*v122 + 48.0d0*v125 + 24.0d0*v126 + 48.0d0*v128 + 48.0d0* &
      v135 + 28.0d0*v209 + 28.0d0*v210 + 28.0d0*v213 + 28.0d0*v214)))
    S_xyyyz  = v12*v3
    Ms_xyyyz = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v221 + v223 + v226 + v228 &
      ) + 5.0d0*(v222 + v225 + v227 + v231) + 2.0d0*(-v215 + v216 + &
      v217 - v218 - v219 - v220 + v229 + v230)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v106 + M_xyyyz + M_yyyz*x + S_xyy*v107 + S_yy*v224)
    S_yyyyy  = y*(0.111111111111111d0*(-10.0d0*v105) + v104 + v108)
    Ms_yyyyy = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v162 + v167) + 330.0d0*(v164 + v166) - 30.0d0*(M_xxyyy + v152 + &
      v161) + 120.0d0*(v145 + v150 + v158 + v159) + 60.0d0*(v146 + v151 &
      + v163 + v165) - 300.0d0*(v156 + v157 + v168 + v170) - 140.0d0*( &
      v233 + v234 + v235 + v236) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v139 + v140 + v141 + v142 + v148 + v160)))
    S_yyyyz  = v241*z
    Ms_yyyyz = Ms_yyyyz + (M_0*S_yyyyz + v180 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v182 &
      + v189) + 32.0d0*(v183 + v199) + 48.0d0*(v187 + v201) + 4.0d0*( &
      v190 + v195) + 106.0d0*(v196 + v200) + 104.0d0*(v197 + v202) + &
      44.0d0*(v198 + v204) + 56.0d0*(v239 + v240) - (M_xxxxz + 8.0d0* &
      v184 + 5.0d0*v185 + 36.0d0*v191 + 8.0d0*v192 + 36.0d0*v193 + &
      5.0d0*v203 + 28.0d0*v237 + 28.0d0*v238)))
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  x                   
#undef  z                   
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
    
! OPS  364*ADD + 2*DIV + 555*MUL + 50*NEG + POW + 14*SUB = 986  (1291 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v105, v106, v107, v108, v109, v11,&
                v110, v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21,&
                v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32,&
                v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43,&
                v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54,&
                v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65,&
                v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76,&
                v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87,&
                v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98,&
                v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz
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
#define M_xxx                M(9)
#define L_xxx                L(9)
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
#define L_xxxxx              L(25)
#define M_xxxxx              M(25)
#define M_xxxxy              M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define L_xxxyy              L(28)
#define M_xxxyy              M(28)
#define L_xxxyz              L(29)
#define M_xxxyz              M(29)
#define M_xxyyy              M(30)
#define L_xxyyy              L(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define L_xyyyy              L(32)
#define M_xyyyy              M(32)
#define L_xyyyz              L(33)
#define M_xyyyz              M(33)
#define M_yyyyy              M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_yyyyz              M(35)
    v110    = y*z
    v107    = 15.0d0*v110
    v40     = 0.5d0*M_xx
    v46     = 0.166666666666667d0*M_xxx
    v47     = 0.5d0*M_xxy
    v48     = 0.5d0*M_xxz
    v64     = 0.0416666666666667d0*M_xxxx
    v65     = 0.166666666666667d0*M_xxxy
    v66     = 0.166666666666667d0*M_xxxz
    v67     = 0.25d0*M_xxyy
    v68     = 0.5d0*M_xxyz
    v81     = 0.5d0*M_yy
    v83     = 0.166666666666667d0*M_yyy
    v84     = 0.5d0*M_yyz
    v88     = 0.0416666666666667d0*M_yyyy
    v89     = 0.166666666666667d0*M_yyyz
    M_zz    = -(M_xx + M_yy)
    v96     = 0.5d0*M_zz
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    v97     = 0.166666666666667d0*M_zzz
    M_xxzz  = -(M_xxxx + M_xxyy)
    v69     = 0.25d0*M_xxzz
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    v90     = 0.25d0*M_yyzz
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    v98     = 0.0416666666666667d0*M_zzzz
    M_xxxzz = -(M_xxxxx + M_xxxyy)
    M_xxyzz = -(M_xxxxy + M_xxyyy)
    M_xxzzz = -(M_xxxxz + M_xxyyz)
    M_xyyzz = -(M_xxxyy + M_xyyyy)
    M_xyzzz = -(M_xxxyz + M_xyyyz)
    M_xzzzz = -(M_xxxzz + M_xyyzz)
    M_yyyzz = -(M_xxyyy + M_yyyyy)
    M_yyzzz = -(M_xxyyz + M_yyyyz)
    M_yzzzz = -(M_xxyzz + M_yyyzz)
    M_zzzzz = -(M_xxzzz + M_yyzzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v99     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v99
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v100    = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v100
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v101    = 3.0d0*h
    v102    = h*v0
    v103    = h*v1
    v4      = -h
    v12     = v101
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v102
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v103
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 + 630.0d0*v102 - 945.0d0*v19
    v38     = -(v18 + 63.0d0*v26)
    v55     = v35 + 630.0d0*v103 - 945.0d0*v30
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
    v104    = 3.0d0*v3
    v6      = v104*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v104*v110
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v105    = 3.0d0*v8
    v9      = v8*x
    v11     = v105*(h - v10)
    D_xxx   = 3.0d0*v9*(v101 - v99)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    v70     = 0.5d0*D_xyy
    D_xyz   = -v107*v9
    D_xzz   = -(D_xxx + D_xyy)
    v76     = 0.5d0*D_xzz
    D_yyy   = v105*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    v91     = 0.5d0*D_yzz
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v106    = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v106*y
    v25     = v106*z
    v27     = v107*v15
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    D_xxxy  = v21*v24
    D_xxxz  = v24*v25
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    v49     = 0.5d0*D_xxyy
    D_xxyz  = v27*(v23 + v4)
    D_xxzz  = -(D_xxxx + D_xxyy)
    v52     = 0.5d0*D_xxzz
    D_xyyy  = v21*v29
    v58     = 0.5d0*D_xyyy
    v71     = 0.166666666666667d0*D_xyyy
    D_xyyz  = v25*(v28 + v4)
    v74     = 0.5d0*D_xyyz
    D_xyzz  = -(D_xxxy + D_xyyy)
    v61     = 0.5d0*D_xyzz
    D_xzzz  = -(D_xxxz + D_xyyz)
    v77     = 0.166666666666667d0*D_xzzz
    v79     = 0.5d0*D_xzzz
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    D_yyyz  = v27*v29
    D_yyzz  = -(D_xxyy + D_yyyy)
    v85     = 0.5d0*D_yyzz
    D_yzzz  = -(D_xxyz + D_yyyz)
    v92     = 0.166666666666667d0*D_yzzz
    v94     = 0.5d0*D_yzzz
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v108    = 15.0d0*v32
    v109    = v32*z
    v33     = v108*x
    v37     = v109
    v39     = 315.0d0*v109*x*y
    v43     = v108*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = L_xxxxx + (D_xxxxx*M_0)
    D_xxxxy = v32*v36*y
    L_xxxxy = L_xxxxy + (D_xxxxy*M_0)
    D_xxxxz = v36*v37
    L_xxxx  = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z)
    L_xxxxz = L_xxxxz + (D_xxxxz*M_0)
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    v41     = 0.5d0*D_xxxyy
    L_xxxyy = L_xxxyy + (D_xxxyy*M_0)
    D_xxxyz = v39*(h - v5)
    L_xxxy  = L_xxxy + (D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z)
    L_xxxyz = L_xxxyz + (D_xxxyz*M_0)
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    v42     = 0.5d0*D_xxxzz
    L_xxx   = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v40 + D_xxxxy*M_xy + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + M_yy*v41 + M_zz*v42)
    L_xxxz  = L_xxxz + (D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z)
    D_xxyyy = v43*(v38 + h*v28 + 21.0d0*v20)
    v44     = 0.5d0*D_xxyyy
    v50     = 0.166666666666667d0*D_xxyyy
    L_xxyyy = L_xxyyy + (D_xxyyy*M_0)
    D_xxyyz = v37*(v34 - 945.0d0*v100 + 105.0d0*(v102 + v103))
    v51     = 0.5d0*D_xxyyz
    L_xxyy  = L_xxyy + (D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z)
    L_xxyyz = L_xxyyz + (D_xxyyz*M_0)
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    v45     = 0.5d0*D_xxyzz
    L_xxy   = L_xxy + (D_xxxxy*v40 + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z + M_yy*v44 + M_zz*v45)
    L_xxyz  = L_xxyz + (D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z)
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    v53     = 0.166666666666667d0*D_xxzzz
    v54     = 0.5d0*D_xxzzz
    L_xx    = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*v40 + D_xxxxx*v46 + D_xxxxy*v47 + D_xxxxz* &
      v48 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy*M_y + &
      D_xxyz*M_yz + D_xxz*M_z + M_xyy*v41 + M_xzz*v42 + M_yy*v49 + &
      M_yyy*v50 + M_yyz*v51 + M_yzz*v45 + M_zz*v52 + M_zzz*v53)
    L_xxz   = L_xxz + (D_xxxxz*v40 + D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + M_yy*v51 + M_zz*v54)
    D_xyyyy = v32*v55*x
    v56     = 0.5d0*D_xyyyy
    v59     = 0.166666666666667d0*D_xyyyy
    v72     = 0.0416666666666667d0*D_xyyyy
    L_xyyyy = L_xyyyy + (D_xyyyy*M_0)
    D_xyyyz = v39*(h - v7)
    v60     = 0.5d0*D_xyyyz
    v73     = 0.166666666666667d0*D_xyyyz
    L_xyyy  = L_xyyy + (D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z)
    L_xyyyz = L_xyyyz + (D_xyyyz*M_0)
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    v57     = 0.5d0*D_xyyzz
    v75     = 0.25d0*D_xyyzz
    L_xyy   = L_xyy + (D_xxxyy*v40 + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z + M_yy*v56 + M_zz*v57)
    L_xyyz  = L_xyyz + (D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z)
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    v62     = 0.166666666666667d0*D_xyzzz
    v63     = 0.5d0*D_xyzzz
    L_xy    = L_xy + (D_xxxxy*v46 + D_xxxy*v40 + D_xxxyy*v47 + D_xxxyz*v48 + D_xxy*M_x + &
      D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy*M_y &
      + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v44 + M_xzz*v45 + M_yy*v58 + &
      M_yyy*v59 + M_yyz*v60 + M_yzz*v57 + M_zz*v61 + M_zzz*v62)
    L_xyz   = L_xyz + (D_xxxyz*v40 + D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + M_yy*v60 + M_zz*v63)
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    v78     = 0.0416666666666667d0*D_xzzzz
    v80     = 0.166666666666667d0*D_xzzzz
    L_x     = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*v40 + D_xxxx*v46 + D_xxxxx*v64 + D_xxxxy*v65 &
      + D_xxxxz*v66 + D_xxxy*v47 + D_xxxyy*v67 + D_xxxyz*v68 + D_xxxz* &
      v48 + D_xxxzz*v69 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy &
      *M_y + D_xyz*M_yz + D_xz*M_z + M_xyy*v49 + M_xyyy*v50 + M_xyyz* &
      v51 + M_xyzz*v45 + M_xzz*v52 + M_xzzz*v53 + M_yy*v70 + M_yyy*v71 &
      + M_yyyy*v72 + M_yyyz*v73 + M_yyz*v74 + M_yyzz*v75 + M_yzz*v61 + &
      M_yzzz*v62 + M_zz*v76 + M_zzz*v77 + M_zzzz*v78)
    L_xz    = L_xz + (D_xxxxz*v46 + D_xxxyz*v47 + D_xxxz*v40 + D_xxxzz*v48 + D_xxyz*M_xy + &
      D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + D_xyzz*M_yz &
      + D_xz*M_0 + D_xzz*M_z + M_xyy*v51 + M_xzz*v54 + M_yy*v74 + M_yyy &
      *v73 + M_yyz*v57 + M_yzz*v63 + M_zz*v79 + M_zzz*v80)
    D_yyyyy = v43*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = L_yyyyy + (D_yyyyy*M_0)
    D_yyyyz = v37*v55
    L_yyyy  = L_yyyy + (D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z)
    L_yyyyz = L_yyyyz + (D_yyyyz*M_0)
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    v82     = 0.5d0*D_yyyzz
    L_yyy   = L_yyy + (D_xxyyy*v40 + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyy*v81 + D_yyyyz*M_yz + D_yyyz*M_z + M_zz*v82)
    L_yyyz  = L_yyyz + (D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z)
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    v86     = 0.166666666666667d0*D_yyzzz
    v87     = 0.5d0*D_yyzzz
    L_yy    = L_yy + (D_xxxyy*v46 + D_xxyy*v40 + D_xxyyy*v47 + D_xxyyz*v48 + D_xyy*M_x + &
      D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy*M_y &
      + D_yyyy*v81 + D_yyyyy*v83 + D_yyyyz*v84 + D_yyyz*M_yz + D_yyz* &
      M_z + M_xyy*v56 + M_xzz*v57 + M_yzz*v82 + M_zz*v85 + M_zzz*v86)
    L_yyz   = L_yyz + (D_xxyyz*v40 + D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyz*v81 + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_zz*v87)
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    v93     = 0.0416666666666667d0*D_yzzzz
    v95     = 0.166666666666667d0*D_yzzzz
    L_y     = L_y + (D_xxxxy*v64 + D_xxxy*v46 + D_xxxyy*v65 + D_xxxyz*v66 + D_xxy*v40 + &
      D_xxyy*v47 + D_xxyyy*v67 + D_xxyyz*v68 + D_xxyz*v48 + D_xxyzz*v69 &
      + D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + &
      D_yy*M_y + D_yyy*v81 + D_yyyy*v83 + D_yyyyy*v88 + D_yyyyz*v89 + &
      D_yyyz*v84 + D_yyyzz*v90 + D_yyz*M_yz + D_yz*M_z + M_xyy*v58 + &
      M_xyyy*v59 + M_xyyz*v60 + M_xyzz*v57 + M_xzz*v61 + M_xzzz*v62 + &
      M_yzz*v85 + M_yzzz*v86 + M_zz*v91 + M_zzz*v92 + M_zzzz*v93)
    L_yz    = L_yz + (D_xxxyz*v46 + D_xxyyz*v47 + D_xxyz*v40 + D_xxyzz*v48 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyyyz*v83 + D_yyyz* &
      v81 + D_yyyzz*v84 + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz* &
      M_z + M_xyy*v60 + M_xzz*v63 + M_yzz*v87 + M_zz*v94 + M_zzz*v95)
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = L_0 + (0.00833333333333333d0*(D_xxxxx*M_xxxxx + 20.0d0*D_xxxyz*M_xxxyz + &
      D_yyyyy*M_yyyyy + D_zzzzz*M_zzzzz + 30.0d0*(D_xxyyz*M_xxyyz + &
      D_xxyzz*M_xxyzz) + 5.0d0*(D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + &
      D_yyyyz*M_yyyyz) + 10.0d0*(D_xxxyy*M_xxxyy + D_xxxzz*M_xxxzz + &
      D_xxyyy*M_xxyyy + D_xxzzz*M_xxzzz + D_yyyzz*M_yyyzz + D_yyzzz* &
      M_yyzzz)) + D_0*M_0 + D_x*M_x + D_xx*v40 + D_xxx*v46 + D_xxxx*v64 &
      + D_xxxy*v65 + D_xxxz*v66 + D_xxy*v47 + D_xxyy*v67 + D_xxyz*v68 + &
      D_xxz*v48 + D_xxzz*v69 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + &
      D_y*M_y + D_yy*v81 + D_yyy*v83 + D_yyyy*v88 + D_yyyz*v89 + D_yyz* &
      v84 + D_yyzz*v90 + D_yz*M_yz + D_z*M_z + D_zz*v96 + D_zzz*v97 + &
      D_zzzz*v98 + M_xyy*v70 + M_xyyy*v71 + M_xyyyy*v72 + M_xyyyz*v73 + &
      M_xyyz*v74 + M_xyyzz*v75 + M_xyzz*v61 + M_xyzzz*v62 + M_xzz*v76 + &
      M_xzzz*v77 + M_xzzzz*v78 + M_yzz*v91 + M_yzzz*v92 + M_yzzzz*v93)
    L_z     = L_z + (D_xxxxz*v64 + D_xxxyz*v65 + D_xxxz*v46 + D_xxxzz*v66 + D_xxyyz*v67 + &
      D_xxyz*v47 + D_xxyzz*v68 + D_xxz*v40 + D_xxzz*v48 + D_xxzzz*v69 + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyz*v88 + &
      D_yyyz*v83 + D_yyyzz*v89 + D_yyz*v81 + D_yyzz*v84 + D_yyzzz*v90 + &
      D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v96 + D_zzzz* &
      v97 + D_zzzzz*v98 + M_xyy*v74 + M_xyyy*v73 + M_xyyz*v57 + M_xyzz* &
      v63 + M_xzz*v79 + M_xzzz*v80 + M_yzz*v94 + M_yzzz*v95)
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
#undef  M_xxx               
#undef  L_xxx               
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
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  L_xxxyy             
#undef  M_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  M_xxyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
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
    
! OPS  364*ADD + 2*DIV + 555*MUL + 50*NEG + POW + 14*SUB = 986  (1291 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5,&
                u10, u11, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10, v100,&
                v101, v102, v103, v104, v105, v106, v107, v108, v109, v11,&
                v110, v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21,&
                v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32,&
                v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43,&
                v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54,&
                v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65,&
                v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76,&
                v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87,&
                v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98,&
                v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz,&
                D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz,&
                D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz,&
                D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz,&
                D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz,&
                D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz,&
                D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz,&
                D_yzzzz, D_zzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz
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
#define M_xxx                M(1:2,9)
#define L_xxx                L(1:2,9)
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
#define L_xxxxx              L(1:2,25)
#define M_xxxxx              M(1:2,25)
#define M_xxxxy              M(1:2,26)
#define L_xxxxy              L(1:2,26)
#define L_xxxxz              L(1:2,27)
#define M_xxxxz              M(1:2,27)
#define L_xxxyy              L(1:2,28)
#define M_xxxyy              M(1:2,28)
#define L_xxxyz              L(1:2,29)
#define M_xxxyz              M(1:2,29)
#define M_xxyyy              M(1:2,30)
#define L_xxyyy              L(1:2,30)
#define L_xxyyz              L(1:2,31)
#define M_xxyyz              M(1:2,31)
#define L_xyyyy              L(1:2,32)
#define M_xyyyy              M(1:2,32)
#define L_xyyyz              L(1:2,33)
#define M_xyyyz              M(1:2,33)
#define M_yyyyy              M(1:2,34)
#define L_yyyyy              L(1:2,34)
#define L_yyyyz              L(1:2,35)
#define M_yyyyz              M(1:2,35)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v110    = y*z
    v107    = 15.0d0*v110
    v40     = 0.5d0*M_xx
    v46     = 0.166666666666667d0*M_xxx
    v47     = 0.5d0*M_xxy
    v48     = 0.5d0*M_xxz
    v64     = 0.0416666666666667d0*M_xxxx
    v65     = 0.166666666666667d0*M_xxxy
    v66     = 0.166666666666667d0*M_xxxz
    v67     = 0.25d0*M_xxyy
    v68     = 0.5d0*M_xxyz
    v81     = 0.5d0*M_yy
    v83     = 0.166666666666667d0*M_yyy
    v84     = 0.5d0*M_yyz
    v88     = 0.0416666666666667d0*M_yyyy
    v89     = 0.166666666666667d0*M_yyyz
    M_zz    = -(M_xx + M_yy)
    v96     = 0.5d0*M_zz
    M_xzz   = -(M_xxx + M_xyy)
    M_yzz   = -(M_xxy + M_yyy)
    M_zzz   = -(M_xxz + M_yyz)
    v97     = 0.166666666666667d0*M_zzz
    M_xxzz  = -(M_xxxx + M_xxyy)
    v69     = 0.25d0*M_xxzz
    M_xyzz  = -(M_xxxy + M_xyyy)
    M_xzzz  = -(M_xxxz + M_xyyz)
    M_yyzz  = -(M_xxyy + M_yyyy)
    v90     = 0.25d0*M_yyzz
    M_yzzz  = -(M_xxyz + M_yyyz)
    M_zzzz  = -(M_xxzz + M_yyzz)
    v98     = 0.0416666666666667d0*M_zzzz
    M_xxxzz = -(M_xxxxx + M_xxxyy)
    M_xxyzz = -(M_xxxxy + M_xxyyy)
    M_xxzzz = -(M_xxxxz + M_xxyyz)
    M_xyyzz = -(M_xxxyy + M_xyyyy)
    M_xyzzz = -(M_xxxyz + M_xyyyz)
    M_xzzzz = -(M_xxxzz + M_xyyzz)
    M_yyyzz = -(M_xxyyy + M_yyyyy)
    M_yyzzz = -(M_xxyyz + M_yyyyz)
    M_yzzzz = -(M_xxyzz + M_yyyzz)
    M_zzzzz = -(M_xxzzz + M_yyzzz)
    c1      = z
    b1      = y
    a1      = x
    a2      = a1*a1
    v0      = a2
    v99     = 5.0d0*v0
    v5      = 3.0d0*v0
    v10     = v99
    v23     = 7.0d0*v0
    a3      = a1*a2
    a4      = a2*a2
    v19     = a4
    a5      = a2*a3
    b2      = b1*b1
    v1      = b2
    v100    = v0*v1
    v7      = 3.0d0*v1
    v14     = 5.0d0*v1
    v26     = v100
    v28     = 7.0d0*v1
    b3      = b1*b2
    b4      = b2*b2
    v30     = b4
    b5      = b2*b3
    c2      = c1*c1
    h       = c2 + v0 + v1
    v101    = 3.0d0*h
    v102    = h*v0
    v103    = h*v1
    v4      = -h
    v12     = v101
    v13     = -15.0d0*v1 + v12
    v17     = h*h
    v18     = 3.0d0*v17
    v20     = v102
    v22     = -v12
    v24     = v22 + v23
    v29     = v22 + v28
    v31     = v103
    v34     = -15.0d0*v17
    v35     = -45.0d0*v17
    v36     = v35 + 630.0d0*v102 - 945.0d0*v19
    v38     = -(v18 + 63.0d0*v26)
    v55     = v35 + 630.0d0*v103 - 945.0d0*v30
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
    v104    = 3.0d0*v3
    v6      = v104*x
    D_xx    = v3*(v4 + v5)
    D_xy    = v6*y
    D_xz    = v6*z
    D_yy    = v3*(v4 + v7)
    D_yz    = v104*v110
    D_zz    = -(D_xx + D_yy)
    u6      = u3*u3
    u7      = u3*u4
    v8      = u7
    v105    = 3.0d0*v8
    v9      = v8*x
    v11     = v105*(h - v10)
    D_xxx   = 3.0d0*v9*(v101 - v99)
    D_xxy   = v11*y
    D_xxz   = v11*z
    D_xyy   = v13*v9
    v70     = 0.5d0*D_xyy
    D_xyz   = -v107*v9
    D_xzz   = -(D_xxx + D_xyy)
    v76     = 0.5d0*D_xzz
    D_yyy   = v105*y*(v12 - v14)
    D_yyz   = v13*v8*z
    D_yzz   = -(D_xxy + D_yyy)
    v91     = 0.5d0*D_yzz
    D_zzz   = -(D_xxz + D_yyz)
    u8      = u4*u4
    u9      = u4*u5
    v15     = u9
    v106    = 15.0d0*v15*x
    v16     = 3.0d0*v15
    v21     = v106*y
    v25     = v106*z
    v27     = v107*v15
    D_xxxx  = v16*(v18 + 35.0d0*v19 - 30.0d0*v20)
    D_xxxy  = v21*v24
    D_xxxz  = v24*v25
    D_xxyy  = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v26))
    v49     = 0.5d0*D_xxyy
    D_xxyz  = v27*(v23 + v4)
    D_xxzz  = -(D_xxxx + D_xxyy)
    v52     = 0.5d0*D_xxzz
    D_xyyy  = v21*v29
    v58     = 0.5d0*D_xyyy
    v71     = 0.166666666666667d0*D_xyyy
    D_xyyz  = v25*(v28 + v4)
    v74     = 0.5d0*D_xyyz
    D_xyzz  = -(D_xxxy + D_xyyy)
    v61     = 0.5d0*D_xyzz
    D_xzzz  = -(D_xxxz + D_xyyz)
    v77     = 0.166666666666667d0*D_xzzz
    v79     = 0.5d0*D_xzzz
    D_yyyy  = v16*(v18 + 35.0d0*v30 - 30.0d0*v31)
    D_yyyz  = v27*v29
    D_yyzz  = -(D_xxyy + D_yyyy)
    v85     = 0.5d0*D_yyzz
    D_yzzz  = -(D_xxyz + D_yyyz)
    v92     = 0.166666666666667d0*D_yzzz
    v94     = 0.5d0*D_yzzz
    D_zzzz  = -(D_xxzz + D_yyzz)
    u10     = u5*u5
    u11     = u5*u6
    v32     = u11
    v108    = 15.0d0*v32
    v109    = v32*z
    v33     = v108*x
    v37     = v109
    v39     = 315.0d0*v109*x*y
    v43     = v108*y
    D_xxxxx = v33*(v34 - 63.0d0*v19 + 70.0d0*v20)
    L_xxxxx = D_xxxxx*M_0
    D_xxxxy = v32*v36*y
    L_xxxxy = D_xxxxy*M_0
    D_xxxxz = v36*v37
    L_xxxx  = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxy*M_y + D_xxxxz*M_z
    L_xxxxz = D_xxxxz*M_0
    D_xxxyy = v33*(v38 + h*v23 + 21.0d0*v31)
    v41     = 0.5d0*D_xxxyy
    L_xxxyy = D_xxxyy*M_0
    D_xxxyz = v39*(h - v5)
    L_xxxy  = D_xxxxy*M_x + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyz*M_z
    L_xxxyz = D_xxxyz*M_0
    D_xxxzz = -(D_xxxxx + D_xxxyy)
    v42     = 0.5d0*D_xxxzz
    L_xxx   = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v40 + D_xxxxy*M_xy + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + M_yy*v41 + M_zz*v42
    L_xxxz  = D_xxxxz*M_x + D_xxxyz*M_y + D_xxxz*M_0 + D_xxxzz*M_z
    D_xxyyy = v43*(v38 + h*v28 + 21.0d0*v20)
    v44     = 0.5d0*D_xxyyy
    v50     = 0.166666666666667d0*D_xxyyy
    L_xxyyy = D_xxyyy*M_0
    D_xxyyz = v37*(v34 - 945.0d0*v100 + 105.0d0*(v102 + v103))
    v51     = 0.5d0*D_xxyyz
    L_xxyy  = D_xxxyy*M_x + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyz*M_z
    L_xxyyz = D_xxyyz*M_0
    D_xxyzz = -(D_xxxxy + D_xxyyy)
    v45     = 0.5d0*D_xxyzz
    L_xxy   = D_xxxxy*v40 + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyy*M_y + D_xxyyz*M_yz + D_xxyz*M_z + M_yy*v44 + M_zz*v45
    L_xxyz  = D_xxxyz*M_x + D_xxyyz*M_y + D_xxyz*M_0 + D_xxyzz*M_z
    D_xxzzz = -(D_xxxxz + D_xxyyz)
    v53     = 0.166666666666667d0*D_xxzzz
    v54     = 0.5d0*D_xxzzz
    L_xx    = D_xx*M_0 + D_xxx*M_x + D_xxxx*v40 + D_xxxxx*v46 + D_xxxxy*v47 + D_xxxxz* &
      v48 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxy*M_y + &
      D_xxyz*M_yz + D_xxz*M_z + M_xyy*v41 + M_xzz*v42 + M_yy*v49 + &
      M_yyy*v50 + M_yyz*v51 + M_yzz*v45 + M_zz*v52 + M_zzz*v53
    L_xxz   = D_xxxxz*v40 + D_xxxyz*M_xy + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + M_yy*v51 + M_zz*v54
    D_xyyyy = v32*v55*x
    v56     = 0.5d0*D_xyyyy
    v59     = 0.166666666666667d0*D_xyyyy
    v72     = 0.0416666666666667d0*D_xyyyy
    L_xyyyy = D_xyyyy*M_0
    D_xyyyz = v39*(h - v7)
    v60     = 0.5d0*D_xyyyz
    v73     = 0.166666666666667d0*D_xyyyz
    L_xyyy  = D_xxyyy*M_x + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyz*M_z
    L_xyyyz = D_xyyyz*M_0
    D_xyyzz = -(D_xxxyy + D_xyyyy)
    v57     = 0.5d0*D_xyyzz
    v75     = 0.25d0*D_xyyzz
    L_xyy   = D_xxxyy*v40 + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyy*M_y + D_xyyyz*M_yz + D_xyyz*M_z + M_yy*v56 + M_zz*v57
    L_xyyz  = D_xxyyz*M_x + D_xyyyz*M_y + D_xyyz*M_0 + D_xyyzz*M_z
    D_xyzzz = -(D_xxxyz + D_xyyyz)
    v62     = 0.166666666666667d0*D_xyzzz
    v63     = 0.5d0*D_xyzzz
    L_xy    = D_xxxxy*v46 + D_xxxy*v40 + D_xxxyy*v47 + D_xxxyz*v48 + D_xxy*M_x + &
      D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyy*M_y &
      + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v44 + M_xzz*v45 + M_yy*v58 + &
      M_yyy*v59 + M_yyz*v60 + M_yzz*v57 + M_zz*v61 + M_zzz*v62
    L_xyz   = D_xxxyz*v40 + D_xxyyz*M_xy + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + M_yy*v60 + M_zz*v63
    D_xzzzz = -(D_xxxzz + D_xyyzz)
    v78     = 0.0416666666666667d0*D_xzzzz
    v80     = 0.166666666666667d0*D_xzzzz
    L_x     = D_x*M_0 + D_xx*M_x + D_xxx*v40 + D_xxxx*v46 + D_xxxxx*v64 + D_xxxxy*v65 &
      + D_xxxxz*v66 + D_xxxy*v47 + D_xxxyy*v67 + D_xxxyz*v68 + D_xxxz* &
      v48 + D_xxxzz*v69 + D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy &
      *M_y + D_xyz*M_yz + D_xz*M_z + M_xyy*v49 + M_xyyy*v50 + M_xyyz* &
      v51 + M_xyzz*v45 + M_xzz*v52 + M_xzzz*v53 + M_yy*v70 + M_yyy*v71 &
      + M_yyyy*v72 + M_yyyz*v73 + M_yyz*v74 + M_yyzz*v75 + M_yzz*v61 + &
      M_yzzz*v62 + M_zz*v76 + M_zzz*v77 + M_zzzz*v78
    L_xz    = D_xxxxz*v46 + D_xxxyz*v47 + D_xxxz*v40 + D_xxxzz*v48 + D_xxyz*M_xy + &
      D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y + D_xyzz*M_yz &
      + D_xz*M_0 + D_xzz*M_z + M_xyy*v51 + M_xzz*v54 + M_yy*v74 + M_yyy &
      *v73 + M_yyz*v57 + M_yzz*v63 + M_zz*v79 + M_zzz*v80
    D_yyyyy = v43*(v34 - 63.0d0*v30 + 70.0d0*v31)
    L_yyyyy = D_yyyyy*M_0
    D_yyyyz = v37*v55
    L_yyyy  = D_xyyyy*M_x + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyz*M_z
    L_yyyyz = D_yyyyz*M_0
    D_yyyzz = -(D_xxyyy + D_yyyyy)
    v82     = 0.5d0*D_yyyzz
    L_yyy   = D_xxyyy*v40 + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyy*M_y + D_yyyyy*v81 + D_yyyyz*M_yz + D_yyyz*M_z + M_zz*v82
    L_yyyz  = D_xyyyz*M_x + D_yyyyz*M_y + D_yyyz*M_0 + D_yyyzz*M_z
    D_yyzzz = -(D_xxyyz + D_yyyyz)
    v86     = 0.166666666666667d0*D_yyzzz
    v87     = 0.5d0*D_yyzzz
    L_yy    = D_xxxyy*v46 + D_xxyy*v40 + D_xxyyy*v47 + D_xxyyz*v48 + D_xyy*M_x + &
      D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyy*M_y &
      + D_yyyy*v81 + D_yyyyy*v83 + D_yyyyz*v84 + D_yyyz*M_yz + D_yyz* &
      M_z + M_xyy*v56 + M_xzz*v57 + M_yzz*v82 + M_zz*v85 + M_zzz*v86
    L_yyz   = D_xxyyz*v40 + D_xyyyz*M_xy + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyz*v81 + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_zz*v87
    D_yzzzz = -(D_xxyzz + D_yyyzz)
    v93     = 0.0416666666666667d0*D_yzzzz
    v95     = 0.166666666666667d0*D_yzzzz
    L_y     = D_xxxxy*v64 + D_xxxy*v46 + D_xxxyy*v65 + D_xxxyz*v66 + D_xxy*v40 + &
      D_xxyy*v47 + D_xxyyy*v67 + D_xxyyz*v68 + D_xxyz*v48 + D_xxyzz*v69 &
      + D_xy*M_x + D_xyy*M_xy + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + &
      D_yy*M_y + D_yyy*v81 + D_yyyy*v83 + D_yyyyy*v88 + D_yyyyz*v89 + &
      D_yyyz*v84 + D_yyyzz*v90 + D_yyz*M_yz + D_yz*M_z + M_xyy*v58 + &
      M_xyyy*v59 + M_xyyz*v60 + M_xyzz*v57 + M_xzz*v61 + M_xzzz*v62 + &
      M_yzz*v85 + M_yzzz*v86 + M_zz*v91 + M_zzz*v92 + M_zzzz*v93
    L_yz    = D_xxxyz*v46 + D_xxyyz*v47 + D_xxyz*v40 + D_xxyzz*v48 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyyyz*v83 + D_yyyz* &
      v81 + D_yyyzz*v84 + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + D_yzz* &
      M_z + M_xyy*v60 + M_xzz*v63 + M_yzz*v87 + M_zz*v94 + M_zzz*v95
    D_zzzzz = -(D_xxzzz + D_yyzzz)
    L_0     = 0.00833333333333333d0*(D_xxxxx*M_xxxxx + 20.0d0*D_xxxyz*M_xxxyz + &
      D_yyyyy*M_yyyyy + D_zzzzz*M_zzzzz + 30.0d0*(D_xxyyz*M_xxyyz + &
      D_xxyzz*M_xxyzz) + 5.0d0*(D_xxxxy*M_xxxxy + D_xxxxz*M_xxxxz + &
      D_yyyyz*M_yyyyz) + 10.0d0*(D_xxxyy*M_xxxyy + D_xxxzz*M_xxxzz + &
      D_xxyyy*M_xxyyy + D_xxzzz*M_xxzzz + D_yyyzz*M_yyyzz + D_yyzzz* &
      M_yyzzz)) + D_0*M_0 + D_x*M_x + D_xx*v40 + D_xxx*v46 + D_xxxx*v64 &
      + D_xxxy*v65 + D_xxxz*v66 + D_xxy*v47 + D_xxyy*v67 + D_xxyz*v68 + &
      D_xxz*v48 + D_xxzz*v69 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + &
      D_y*M_y + D_yy*v81 + D_yyy*v83 + D_yyyy*v88 + D_yyyz*v89 + D_yyz* &
      v84 + D_yyzz*v90 + D_yz*M_yz + D_z*M_z + D_zz*v96 + D_zzz*v97 + &
      D_zzzz*v98 + M_xyy*v70 + M_xyyy*v71 + M_xyyyy*v72 + M_xyyyz*v73 + &
      M_xyyz*v74 + M_xyyzz*v75 + M_xyzz*v61 + M_xyzzz*v62 + M_xzz*v76 + &
      M_xzzz*v77 + M_xzzzz*v78 + M_yzz*v91 + M_yzzz*v92 + M_yzzzz*v93
    L_z     = D_xxxxz*v64 + D_xxxyz*v65 + D_xxxz*v46 + D_xxxzz*v66 + D_xxyyz*v67 + &
      D_xxyz*v47 + D_xxyzz*v68 + D_xxz*v40 + D_xxzz*v48 + D_xxzzz*v69 + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyz*v88 + &
      D_yyyz*v83 + D_yyyzz*v89 + D_yyz*v81 + D_yyzz*v84 + D_yyzzz*v90 + &
      D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + D_zzz*v96 + D_zzzz* &
      v97 + D_zzzzz*v98 + M_xyy*v74 + M_xyyy*v73 + M_xyyz*v57 + M_xyzz* &
      v63 + M_xzz*v79 + M_xzzz*v80 + M_yzz*v94 + M_yzzz*v95
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
#undef  M_xxx               
#undef  L_xxx               
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
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  L_xxxyy             
#undef  M_xxxyy             
#undef  L_xxxyz             
#undef  M_xxxyz             
#undef  M_xxyyy             
#undef  L_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  L_xyyyz             
#undef  M_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
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
