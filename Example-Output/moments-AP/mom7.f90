!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-03 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom7
use types
implicit none
#if FMM_EXPANSION_ORDER==7
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
        
    
! OPS  59*ADD + 132*MUL + 25*NEG + 6*SUB = 222  (644 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15,&
                v16, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v6, v7, v8, v9, h, u
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
#define M_xxxxxx             M(33)
#define M_xxxxxy             M(34)
#define M_xxxxxz             M(35)
#define M_xxxxyy             M(36)
#define M_xxxxyz             M(37)
#define M_xxxyyy             M(38)
#define M_xxxyyz             M(39)
#define M_xxyyyy             M(40)
#define M_xxyyyz             M(41)
#define M_xyyyyy             M(42)
#define M_xyyyyz             M(43)
#define M_yyyyyy             M(44)
#define M_yyyyyz             M(45)
    v0       = W*x
    v1       = v0*y
    v2       = v0*z
    v3       = W*y
    v4       = v3*z
    v5       = v1*z
    v16      = W*z
    M_0      = W
    M_xy     = v1
    M_xz     = v2
    M_yz     = v4
    M_xyz    = v5
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v6       = a2
    v44      = 3.0d0*v6
    a3       = a1*a2
    a4       = a2*a2
    v18      = a4
    a5       = a2*a3
    a6       = a3*a3
    a7       = a3*a4
    b2       = b1*b1
    v7       = b2
    v8       = v6 + v7
    v24      = v6*v7
    v45      = 3.0d0*v7
    b3       = b1*b2
    b4       = b2*b2
    v28      = b4
    b5       = b2*b3
    b6       = b3*b3
    b7       = b3*b4
    c2       = c1*c1
    h        = c2 + v8
    v9       = 0.333333333333333d0*h
    v10      = -v9
    v11      = v10 + v6
    v12      = v10 + v7
    v13      = -0.6d0*h
    v14      = -0.2d0*h
    v15      = v14 + v6
    v17      = v14 + v7
    v19      = h*h
    v20      = 0.0857142857142857d0*v19
    v21      = h*v6
    v22      = -0.428571428571429d0*h
    v23      = v22 + v6
    v25      = 0.142857142857143d0*h
    v26      = -v25
    v27      = v22 + v7
    v29      = h*v7
    v30      = 0.238095238095238d0*v19
    v31      = 0.0476190476190476d0*v19
    v32      = 0.333333333333333d0*(-2.0d0*v21) + v18 + v31
    v33      = v24 + v31
    v48      = -v33
    v34      = 0.333333333333333d0*(-2.0d0*v29) + v28 + v31
    v35      = h*h*h
    v36      = -0.0216450216450216d0*v35
    v37      = 1.36363636363636d0*h
    v38      = 0.454545454545455d0*v19
    v39      = 0.151515151515152d0*v19
    v40      = 0.0909090909090909d0*(-10.0d0*v21) + v18 + v39
    v41      = -0.00432900432900433d0*v35
    v42      = 0.0303030303030303d0*v19
    v43      = 0.0909090909090909d0*h
    v46      = v24 + v42
    v49      = -v46
    v47      = 0.0909090909090909d0*(-10.0d0*v29) + v28 + v39
    M_xx     = W*v11
    M_yy     = W*v12
    M_xxx    = v0*(v13 + v6)
    M_xxy    = v15*v3
    M_xxz    = v15*v16
    M_xyy    = v0*v17
    M_yyy    = v3*(v13 + v7)
    M_yyz    = v16*v17
    M_xxxx   = W*(0.142857142857143d0*(-6.0d0*v21) + v18 + v20)
    M_xxxy   = v1*v23
    M_xxxz   = v2*v23
    M_xxyy   = W*(0.0285714285714286d0*v19 + v24 - v25*v8)
    M_xxyz   = v4*(v26 + v6)
    M_xyyy   = v1*v27
    M_xyyz   = v2*(v26 + v7)
    M_yyyy   = W*(0.142857142857143d0*(-6.0d0*v29) + v20 + v28)
    M_yyyz   = v27*v4
    M_xxxxx  = v0*(0.111111111111111d0*(-10.0d0*v21) + v18 + v30)
    M_xxxxy  = v3*v32
    M_xxxxz  = v16*v32
    M_xxxyy  = -v0*(0.111111111111111d0*v21 + v48 + v7*v9)
    M_xxxyz  = v11*v5
    M_xxyyy  = -v3*(0.111111111111111d0*v29 + v48 + v6*v9)
    M_xxyyz  = v16*(v24 + 0.0158730158730159d0*(-7.0d0*h*v8 + v19))
    M_xyyyy  = v0*v34
    M_xyyyz  = v12*v5
    M_yyyyy  = v3*(0.111111111111111d0*(-10.0d0*v29) + v28 + v30)
    M_yyyyz  = v16*v34
    M_xxxxxx = W*(a6 + v36 - v18*v37 + v38*v6)
    M_xxxxxy = v1*v40
    M_xxxxxz = v2*v40
    M_xxxxyy = W*(0.0909090909090909d0*(-v21*(v6 + 6.0d0*v7)) + v18*v7 + v41 + v42*( &
      2.0d0*v6 + v7))
    M_xxxxyz = v4*(0.0909090909090909d0*(-6.0d0*v21) + v18 + v42)
    M_xxxyyy = v1*(v24 - v43*(-h + v44 + v45))
    M_xxxyyz = -v2*(v43*(v45 + v6) + v49)
    M_xxyyyy = W*(0.0909090909090909d0*(-v29*(6.0d0*v6 + v7)) + v28*v6 + v41 + v42*(v6 &
      + 2.0d0*v7))
    M_xxyyyz = -v4*(v43*(v44 + v7) + v49)
    M_xyyyyy = v1*v47
    M_xyyyyz = v2*(0.0909090909090909d0*(-6.0d0*v29) + v28 + v42)
    M_yyyyyy = W*(b6 + v36 - v28*v37 + v38*v7)
    M_yyyyyz = v4*v47
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
#undef  M_xxxxxx            
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  M_xxxxyz            
#undef  M_xxxyyy            
#undef  M_xxxyyz            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
    end subroutine mom_es_P2M
    
! OPS  960*ADD + 1117*MUL + 76*NEG + 219*SUB = 2372  (4252 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v291, v292, v293, v294,&
                v295, v296, v297, v298, v299, v3, v30, v300, v301, v302, v303,&
                v304, v305, v306, v307, v308, v309, v31, v310, v311, v312,&
                v313, v314, v315, v316, v317, v318, v319, v32, v320, v321,&
                v322, v323, v324, v325, v326, v327, v328, v329, v33, v330,&
                v331, v332, v333, v334, v335, v336, v337, v338, v339, v34,&
                v340, v341, v342, v343, v344, v345, v346, v347, v348, v349,&
                v35, v350, v351, v352, v353, v354, v355, v356, v357, v358,&
                v359, v36, v360, v361, v362, v363, v364, v365, v366, v367,&
                v368, v369, v37, v370, v371, v372, v373, v374, v375, v376,&
                v377, v378, v379, v38, v380, v381, v382, v383, v384, v385,&
                v386, v387, v388, v389, v39, v390, v391, v392, v393, v394,&
                v395, v396, v397, v398, v399, v4, v40, v400, v401, v402, v403,&
                v404, v405, v406, v407, v408, v409, v41, v410, v411, v412,&
                v413, v414, v415, v416, v417, v418, v419, v42, v420, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h,&
                u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz,&
                S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz,&
                S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy,&
                S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy,&
                S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz,&
                S_xxxyy, S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy, S_xyyyz, S_yyyyy,&
                S_yyyyz, S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz,&
                S_xxxyyy, S_xxxyyz, S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz,&
                S_yyyyyy, S_yyyyyz
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
#define Ms_xxxxxx            Ms(33)
#define M_xxxxxx             M(33)
#define Ms_xxxxxy            Ms(34)
#define M_xxxxxy             M(34)
#define Ms_xxxxxz            Ms(35)
#define M_xxxxxz             M(35)
#define Ms_xxxxyy            Ms(36)
#define M_xxxxyy             M(36)
#define Ms_xxxxyz            Ms(37)
#define M_xxxxyz             M(37)
#define M_xxxyyy             M(38)
#define Ms_xxxyyy            Ms(38)
#define Ms_xxxyyz            Ms(39)
#define M_xxxyyz             M(39)
#define Ms_xxyyyy            Ms(40)
#define M_xxyyyy             M(40)
#define M_xxyyyz             M(41)
#define Ms_xxyyyz            Ms(41)
#define Ms_xyyyyy            Ms(42)
#define M_xyyyyy             M(42)
#define Ms_xyyyyz            Ms(43)
#define M_xyyyyz             M(43)
#define Ms_yyyyyy            Ms(44)
#define M_yyyyyy             M(44)
#define M_yyyyyz             M(45)
#define Ms_yyyyyz            Ms(45)
    v1        = x*y
    v2        = x*z
    v3        = y*z
    v4        = v1*z
    v12       = M_xx*x
    v13       = M_xy*y
    v14       = M_xz*z
    v17       = M_xy*x
    v18       = M_yy*y
    v19       = M_yz*z
    v20       = M_xx*z
    v21       = M_xz*x
    v22       = M_yy*z
    v23       = M_yz*y
    v34       = M_xxx*x
    v35       = 1.71428571428571d0*y
    v36       = M_xxy*v35
    v37       = M_xxz*z
    v43       = 0.857142857142857d0*M_xyz
    v46       = M_xxy*x
    v49       = M_xyy*y
    v51       = 3.0d0*M_xx
    v52       = M_xxx*z
    v53       = M_xxz*x
    v55       = M_xyy*z
    v56       = 3.0d0*M_xz
    v62       = 1.71428571428571d0*x
    v63       = M_xyy*v62
    v64       = M_yyy*y
    v65       = M_yyz*z
    v68       = M_xxy*z
    v71       = M_yyy*z
    v72       = M_yyz*y
    v78       = 3.0d0*M_yz
    v84       = M_xxxx*x
    v85       = M_xxxy*y
    v86       = M_xxxz*z
    v88       = M_xxyy*x
    v98       = M_yyyy*x
    v109      = M_xxxx*y
    v110      = M_xxxy*x
    v113      = M_xxyy*y
    v114      = M_xxyz*z
    v125      = M_yyyy*y
    v129      = M_xxyy*z
    v138      = M_xxxx*z
    v139      = M_xxxz*x
    v141      = M_xxyz*y
    v150      = M_yyyy*z
    v158      = M_xyyy*y
    v159      = M_xyyz*z
    v164      = M_xxxy*z
    v166      = M_xxyz*x
    v170      = M_xyyy*z
    v171      = M_xyyz*y
    v172      = 3.0d0*M_xyz
    v178      = M_xyyy*x
    v179      = M_yyyz*z
    v180      = M_xyyz*x
    v181      = M_yyyz*y
    v187      = M_xxyyz*z
    v189      = 0.12987012987013d0*z
    v202      = M_xxxxx*x
    v203      = M_xxxxy*y
    v204      = M_xxxxz*z
    v206      = M_xxxyy*x
    v213      = M_xxyyy*y
    v222      = M_xyyyy*x
    v234      = M_yyyyy*y
    v261      = M_xxxxx*y
    v262      = M_xxxxy*x
    v265      = M_xxxyy*y
    v266      = 1.81818181818182d0*M_xxxyz
    v269      = M_xxyyy*x
    v277      = M_xyyyy*y
    v286      = M_yyyyy*x
    v294      = M_xxxxx*z
    v295      = M_xxxxz*x
    v297      = M_xxxyy*z
    v298      = v266*y
    v305      = M_xxyyz*x
    v314      = M_xyyyy*z
    v318      = 5.45454545454545d0*M_xyz
    v330      = M_yyyyz*x
    v351      = 0.025974025974026d0*z
    v365      = M_xxxxy*z
    v366      = M_xxxxz*y
    v368      = M_xxxyz*x
    v373      = M_xxyyy*z
    v374      = M_xxyyz*y
    v390      = M_yyyyy*z
    v391      = M_yyyyz*y
    v400      = 0.545454545454545d0*z
    v406      = M_xyyyz*y
    v410      = M_yyyyz*z
    v412      = 1.81818181818182d0*M_xyyyz
    v413      = v412*x
    Ms_0      = M_0
    M_zz      = -(M_xx + M_yy)
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    M_xxzz    = -(M_xxxx + M_xxyy)
    v90       = M_xxzz*x
    v103      = M_xxzz*y
    v130      = M_xxzz*z
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v99       = M_yyzz*x
    v104      = M_yyzz*y
    v133      = M_yyzz*z
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    v208      = M_xxxzz*x
    v243      = M_xxxzz*y
    v301      = M_xxxzz*z
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    v215      = M_xxyzz*y
    v246      = M_xxyzz*x
    v352      = M_xxyzz*z
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    v309      = M_xxzzz*x
    v354      = M_xxzzz*y
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    v416      = M_xxxzz + M_xyyzz
    v156      = -0.0476190476190476d0*(M_xxxxx + v416 + v90 + v99)
    v223      = M_xyyzz*x
    v252      = M_xyyzz*y
    v317      = M_xyyzz*z
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -v416
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    v417      = M_xxyzz + M_yyyzz
    v105      = -0.0476190476190476d0*(M_yyyyy + v103 + v104 + v417)
    v235      = M_yyyzz*y
    v254      = M_yyyzz*x
    v355      = M_yyyzz*z
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v0        = M_xxzzz + M_yyzzz
    v334      = M_yyzzz*x
    v357      = M_yyzzz*y
    M_yzzzz   = -v417
    M_zzzzz   = -v0
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    v418      = M_xxxzzz + M_xyyzzz
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -v418
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v419      = M_xxyzzz + M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v420      = M_xxzzzz + M_yyzzzz
    M_yzzzzz  = -v419
    M_zzzzzz  = -v420
    S_0       = 1
    S_x       = x
    S_y       = y
    S_z       = z
    S_xy      = v1
    v30       = M_xy*S_xy
    v45       = M_xx*S_xy
    v50       = M_yy*S_xy
    v59       = M_yz*S_xy
    v70       = M_xz*S_xy
    v87       = M_xxy*S_xy
    v108      = M_xxx*S_xy
    v118      = M_xyy*S_xy
    v132      = M_xyz*S_xy
    v161      = M_yyy*S_xy
    v167      = M_xxz*S_xy
    v175      = M_yyz*S_xy
    v205      = M_xxxy*S_xy
    v245      = M_xxyy*S_xy
    v247      = M_xxzz*S_xy
    v255      = M_yyzz*S_xy
    v260      = M_xxxx*S_xy
    v285      = M_yyyy*S_xy
    v306      = M_xxyz*S_xy
    v343      = M_xyyy*S_xy
    v369      = M_xxxz*S_xy
    v382      = M_xyyz*S_xy
    v407      = M_yyyz*S_xy
    Ms_xy     = M_0*S_xy + M_xy
    S_xz      = v2
    v38       = M_xz*S_xz
    v58       = M_yy*S_xz
    v69       = M_xy*S_xz
    v89       = M_xxz*S_xz
    v119      = M_xyz*S_xz
    v137      = M_xxx*S_xz
    v144      = M_xyy*S_xz
    v162      = M_yyz*S_xz
    v165      = 3.0d0*S_xz
    v174      = M_yyy*S_xz
    v207      = M_xxxz*S_xz
    v270      = M_xxyz*S_xz
    v293      = M_xxxx*S_xz
    v304      = M_xxyy*S_xz
    v308      = M_xxzz*S_xz
    v329      = M_yyyy*S_xz
    v333      = M_yyzz*S_xz
    v341      = 0.242424242424242d0*v207
    v344      = M_xyyz*S_xz
    v367      = M_xxxy*S_xz
    v381      = M_xyyy*S_xz
    v402      = M_yyyz*S_xz
    Ms_xz     = M_0*S_xz + M_xz
    S_yz      = v3
    v40       = M_yz*S_yz
    v44       = -0.142857142857143d0*(7.0d0*v43*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v54       = M_xy*S_yz
    v67       = M_xx*S_yz
    v77       = 3.0d0*S_yz
    v94       = M_xyz*S_yz
    v115      = M_xxz*S_yz
    v126      = M_yyz*S_yz
    v140      = M_xxy*S_yz
    v149      = M_yyy*S_yz
    v163      = M_xxx*S_yz
    v214      = M_xxyz*S_yz
    v267      = M_xxxz*S_yz
    v278      = M_xyyz*S_yz
    v296      = M_xxxy*S_yz
    v313      = M_xyyy*S_yz
    v347      = M_yyyz*S_yz
    v348      = 0.242424242424242d0*v347
    v353      = M_xxzz*S_yz
    v356      = M_yyzz*S_yz
    v364      = M_xxxx*S_yz
    v372      = M_xxyy*S_yz
    v389      = M_yyyy*S_yz
    Ms_yz     = M_0*S_yz + M_yz
    S_xyz     = v4
    v100      = M_yz*S_xyz
    v120      = M_xz*S_xyz
    v131      = M_xy*S_xyz
    v134      = 0.0476190476190476d0*(18.0d0*v129 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v130 + 48.0d0*v131 + 48.0d0*v132 + 5.0d0*v133))
    v190      = M_xyz*S_xyz
    v271      = M_xxz*S_xyz
    v287      = M_yyz*S_xyz
    v302      = 5.45454545454545d0*S_xyz
    v303      = M_xxy*v302
    v328      = M_yyy*S_xyz
    v363      = M_xxx*S_xyz
    v411      = M_xyy*v302
    Ms_xyz    = M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v5        = a2
    a3        = a1*a2
    a4        = a2*a2
    v25       = a4
    a5        = a2*a3
    a6        = a3*a3
    a7        = a3*a4
    b2        = b1*b1
    v6        = b2
    v61       = v5*v6
    b3        = b1*b2
    b4        = b2*b2
    v75       = b4
    b5        = b2*b3
    b6        = b3*b3
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v5 + v6
    v7        = 0.333333333333333d0*h
    v8        = -v7
    v9        = v5 + v8
    v10       = v6 + v8
    v11       = -0.6d0*h
    v15       = -0.2d0*h
    v16       = v15 + v5
    v24       = v15 + v6
    v26       = h*h
    v27       = 0.0857142857142857d0*v26
    v28       = h*v5
    v41       = -0.428571428571429d0*h
    v42       = v41 + v5
    v60       = 0.142857142857143d0*h
    v66       = -v60
    v74       = v41 + v6
    v76       = h*v6
    v79       = 0.238095238095238d0*v26
    v101      = 0.0476190476190476d0*v26
    v102      = 0.333333333333333d0*(-2.0d0*v28) + v101 + v25
    v155      = -0.111111111111111d0*v28
    v177      = v61 + 0.111111111111111d0*(-v76)
    v182      = 0.333333333333333d0*(-2.0d0*v76) + v101 + v75
    v183      = h*h*h
    v184      = -0.0216450216450216d0*v183
    v185      = h*v25
    v186      = v26*v5
    v240      = 0.151515151515152d0*v26
    v241      = 0.0909090909090909d0*(-10.0d0*v28) + v240 + v25
    v337      = 0.545454545454545d0*v28
    v338      = -0.00432900432900433d0*(v183 + 231.0d0*v337*v6)
    v339      = 0.0303030303030303d0*v26
    v398      = -0.272727272727273d0*v28
    v399      = -0.272727272727273d0*v76
    v403      = v339 + v61
    v408      = h*v75
    v409      = v26*v6
    v415      = 0.0909090909090909d0*(-10.0d0*v76) + v240 + v75
    S_xx      = v9
    v31       = M_yy*S_xx
    v33       = M_xx*S_xx
    v47       = M_xy*S_xx
    v73       = M_yz*S_xx
    v82       = M_xxx*S_xx
    v92       = M_xyy*S_xx
    v111      = M_xxy*S_xx
    v123      = M_yyy*S_xx
    v142      = M_xxz*S_xx
    v151      = M_yyz*S_xx
    v200      = M_xxxx*S_xx
    v211      = M_xxyy*S_xx
    v217      = M_xxzz*S_xx
    v232      = M_yyyy*S_xx
    v237      = M_yyzz*S_xx
    v263      = M_xxxy*S_xx
    v275      = M_xyyy*S_xx
    v299      = M_xxxz*S_xx
    v315      = M_xyyz*S_xx
    v375      = M_xxyz*S_xx
    v392      = M_yyyz*S_xx
    Ms_xx     = M_0*S_xx + M_xx
    S_yy      = v10
    v29       = M_xx*S_yy
    v32       = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v30 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v29 + 4.0d0*v31))
    v39       = M_yy*S_yy
    v48       = M_xy*S_yy
    v57       = M_xz*S_yy
    v83       = M_xxx*S_yy
    v93       = M_xyy*S_yy
    v112      = M_xxy*S_yy
    v124      = M_yyy*S_yy
    v143      = M_xxz*S_yy
    v152      = M_yyz*S_yy
    v201      = M_xxxx*S_yy
    v212      = M_xxyy*S_yy
    v218      = M_xxzz*S_yy
    v233      = M_yyyy*S_yy
    v238      = M_yyzz*S_yy
    v264      = M_xxxy*S_yy
    v276      = M_xyyy*S_yy
    v300      = M_xxxz*S_yy
    v316      = M_xyyz*S_yy
    v376      = M_xxyz*S_yy
    v393      = M_yyyz*S_yy
    Ms_yy     = M_0*S_yy + M_yy
    S_zz      = -(S_xx + S_yy)
    S_xxx     = x*(v11 + v5)
    v80       = M_xx*S_xxx
    v96       = M_yy*S_xxx
    v116      = M_xy*S_xxx
    v145      = M_xz*S_xxx
    v176      = M_yz*S_xxx
    v198      = M_xxx*S_xxx
    v220      = M_xyy*S_xxx
    v253      = M_yyy*S_xxx
    v268      = M_xxy*S_xxx
    v331      = M_yyz*S_xxx
    v383      = M_xyz*S_xxx
    Ms_xxx    = 0.2d0*(9.0d0*v12 + 3.0d0*(-2.0d0*v13 - 2.0d0*v14)) + M_0*S_xxx + M_xxx
    S_xxy     = v16*y
    v91       = M_xy*S_xxy
    v106      = M_xx*S_xxy
    v121      = M_yy*S_xxy
    v153      = M_yz*S_xxy
    v209      = M_xxy*S_xxy
    v230      = M_yyy*S_xxy
    v251      = M_xyy*S_xxy
    v259      = M_xxx*S_xxy
    v319      = S_xxy*v318
    v377      = M_xxz*S_xxy
    v394      = M_yyz*S_xxy
    Ms_xxy    = 0.2d0*(8.0d0*v17 + 2.0d0*(-v18 - v19)) + M_0*S_xxy + M_xx*y + M_xxy
    S_xxz     = v16*z
    v95       = M_xz*S_xxz
    v127      = M_yz*S_xxz
    v135      = M_xx*S_xxz
    v147      = M_yy*S_xxz
    v168      = M_xy*S_xxz
    v191      = M_yyz*S_xxz
    v216      = M_xxz*S_xxz
    v279      = M_xyz*S_xxz
    v311      = M_xyy*S_xxz
    v370      = M_xxy*S_xxz
    v388      = M_yyy*S_xxz
    Ms_xxz    = M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v20 + 8.0d0*v21 + 2.0d0*(v22 - v23))
    S_xyy     = v24*x
    v81       = M_xx*S_xyy
    v97       = M_yy*S_xyy
    v117      = M_xy*S_xyy
    v146      = M_xz*S_xyy
    v199      = M_xxx*S_xyy
    v221      = M_xyy*S_xyy
    v244      = M_xxy*S_xyy
    v284      = M_yyy*S_xyy
    v307      = M_xxz*S_xyy
    v332      = M_yyz*S_xyy
    v414      = S_xyy*v318
    Ms_xyy    = 0.2d0*(8.0d0*v13 + 2.0d0*(-v12 - v14)) + M_0*S_xyy + M_xyy + M_yy*x
    S_xzz     = -(S_xxx + S_xyy)
    S_yyy     = y*(v11 + v6)
    v107      = M_xx*S_yyy
    v122      = M_yy*S_yyy
    v154      = M_yz*S_yyy
    v157      = M_xy*S_yyy
    v173      = M_xz*S_yyy
    v210      = M_xxy*S_yyy
    v231      = M_yyy*S_yyy
    v242      = M_xxx*S_yyy
    v274      = M_xyy*S_yyy
    v320      = M_xyz*S_yyy
    v378      = M_xxz*S_yyy
    Ms_yyy    = 0.2d0*(9.0d0*v18 + 3.0d0*(-2.0d0*v17 - 2.0d0*v19)) + M_0*S_yyy + M_yyy
    S_yyz     = v24*z
    v128      = M_yz*S_yyz
    v136      = M_xx*S_yyz
    v148      = M_yy*S_yyz
    v160      = M_xz*S_yyz
    v169      = M_xy*S_yyz
    v188      = M_xxz*S_yyz
    v192      = M_xxzzz*v189 + M_yyzzz*v189 + 0.00432900432900433d0*(-75.0d0*M_xxyyzz + &
      60.0d0*v187 + 1440.0d0*v190 + 5.0d0*(M_xxzzzz + M_yyzzzz - 8.0d0* &
      v188 - 8.0d0*v191))
    v236      = M_yyz*S_yyz
    v280      = M_xyz*S_yyz
    v292      = M_xxx*S_yyz
    v312      = M_xyy*S_yyz
    v340      = 0.00432900432900433d0*(-15.0d0*M_xxyyzz - 240.0d0*v187 - 720.0d0*v190 + &
      v420 - 260.0d0*(v188 + v191))
    v371      = M_xxy*S_yyz
    Ms_yyz    = M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v22 + 8.0d0*v23 + 2.0d0*(v20 - v21))
    S_yzz     = -(S_xxy + S_yyy)
    S_zzz     = -(S_xxz + S_yyz)
    S_xxxx    = 0.142857142857143d0*(-6.0d0*v28) + v25 + v27
    v193      = M_xx*S_xxxx
    v225      = M_yy*S_xxxx
    v272      = M_xy*S_xxxx
    v321      = M_xz*S_xxxx
    v395      = M_yz*S_xxxx
    Ms_xxxx   = M_0*S_xxxx + v32 - v36 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v33 + 80.0d0*v34 - 60.0d0*v37 - 96.0d0*v38 + &
      24.0d0*(v39 + v40))
    S_xxxy    = v1*v42
    v219      = M_xy*S_xxxy
    v257      = M_xx*S_xxxy
    v282      = M_yy*S_xxxy
    v335      = M_yz*S_xxxy
    v384      = M_xz*S_xxxy
    Ms_xxxy   = M_0*S_xxxy + M_xxx*y + M_xxxy + v44 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v45 + 5.0d0*v46 + 5.0d0*v47 - 2.0d0*v48 - 2.0d0*v49 - 2.0d0*v50))
    S_xxxz    = v2*v42
    v224      = M_xz*S_xxxz
    v288      = M_yz*S_xxxz
    v290      = M_xx*S_xxxz
    v326      = M_yy*S_xxxz
    v345      = 0.242424242424242d0*v224
    v379      = M_xy*S_xxxz
    Ms_xxxz   = 0.142857142857143d0*(13.0d0*v52 + 15.0d0*v53 + 6.0d0*(-v54 + v55 + v57 + &
      v58 - v59)) + M_0*S_xxxz + M_xxxz + S_xx*v56 + S_xz*v51 - v43*y
    S_xxyy    = 0.0285714285714286d0*v26 - v5*v60 - v6*v60 + v61
    v194      = M_xx*S_xxyy
    v226      = M_yy*S_xxyy
    v248      = M_xy*S_xxyy
    v322      = M_xz*S_xxyy
    v396      = M_yz*S_xxyy
    Ms_xxyy   = M_0*S_xxyy + v36 + v63 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v30 + 39.0d0*(v29 + v31) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v33 + 10.0d0*v34 + 10.0d0*v37 + 12.0d0*v38 + 12.0d0*v39 + &
      12.0d0*v40 + 10.0d0*v64 + 10.0d0*v65))
    S_xxyz    = v3*(v5 + v66)
    v239      = M_yz*S_xxyz
    v281      = M_xz*S_xxyz
    v310      = M_xy*S_xxyz
    v361      = M_xx*S_xxyz
    v386      = M_yy*S_xxyz
    Ms_xxyz   = 0.142857142857143d0*(12.0d0*(v69 + v70) + 2.0d0*(v71 - v72) + 9.0d0*(v67 &
      + v68 + v73)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v62
    S_xxzz    = -(S_xxxx + S_xxyy)
    v195      = M_xx*S_xxzz
    v227      = M_yy*S_xxzz
    v249      = M_xy*S_xxzz
    v323      = M_xz*S_xxzz
    v358      = M_yz*S_xxzz
    S_xyyy    = v1*v74
    v258      = M_xx*S_xyyy
    v283      = M_yy*S_xyyy
    v336      = M_yz*S_xyyy
    v342      = M_xy*S_xyyy
    v385      = M_xz*S_xyyy
    Ms_xyyy   = M_0*S_xyyy + M_xyyy + M_yyy*x + v44 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v45 - 2.0d0*v46 - 2.0d0*v47 + 5.0d0*v48 + 5.0d0*v49 + 5.0d0*v50 &
      ))
    S_xyyz    = v2*(v6 + v66)
    v289      = M_yz*S_xyyz
    v291      = M_xx*S_xyyz
    v327      = M_yy*S_xyyz
    v346      = M_xz*S_xyyz
    v380      = M_xy*S_xyyz
    Ms_xyyz   = 0.142857142857143d0*(2.0d0*(v52 - v53) + 12.0d0*(v54 + v59) + 9.0d0*(v55 &
      + v57 + v58)) + M_0*S_xyyz + M_xyyz + M_xyz*v35 + M_yyz*x
    S_xyzz    = -(S_xxxy + S_xyyy)
    S_xzzz    = -(S_xxxz + S_xyyz)
    S_yyyy    = 0.142857142857143d0*(-6.0d0*v76) + v27 + v75
    v196      = M_xx*S_yyyy
    v228      = M_yy*S_yyyy
    v273      = M_xy*S_yyyy
    v324      = M_xz*S_yyyy
    v397      = M_yz*S_yyyy
    Ms_yyyy   = M_0*S_yyyy + v32 - v63 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v39 - 96.0d0*v40 + 80.0d0*v64 - 60.0d0*v65 + &
      24.0d0*(v33 + v38))
    S_yyyz    = v3*v74
    v349      = M_yz*S_yyyz
    v350      = 0.242424242424242d0*v349
    v362      = M_xx*S_yyyz
    v387      = M_yy*S_yyyz
    v401      = M_xz*S_yyyz
    v405      = M_xy*S_yyyz
    Ms_yyyz   = 0.142857142857143d0*(13.0d0*v71 + 15.0d0*v72 + 6.0d0*(v67 + v68 - v69 - &
      v70 + v73)) + M_0*S_yyyz + M_yy*v77 + M_yyyz + S_yy*v78 - v43*x
    S_yyzz    = -(S_xxyy + S_yyyy)
    v197      = M_xx*S_yyzz
    v229      = M_yy*S_yyzz
    v250      = M_xy*S_yyzz
    v256      = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz + &
      4.0d0*v242 - v243 - 24.0d0*v244 - 30.0d0*v245 - v246 - v247 - &
      30.0d0*v248 - v249 - v250 - 24.0d0*v251 - v252 + 4.0d0*v253 - &
      v254 - v255))
    v325      = M_xz*S_yyzz
    v359      = M_yz*S_yyzz
    v360      = -0.0303030303030303d0*(M_yyyyyz + v354 + v357 + v419 + 5.0d0*(v352 + &
      v353 + v355 + v356 + v358 + v359))
    v404      = -0.0303030303030303d0*(M_xxxxxz + v309 + v334 + v418 + 5.0d0*(v301 + &
      v308 + v317 + v323 + v325 + v333))
    S_yzzz    = -(S_xxyz + S_yyyz)
    S_zzzz    = -(S_xxzz + S_yyzz)
    S_xxxxx   = x*(0.111111111111111d0*(-10.0d0*v28) + v25 + v79)
    Ms_xxxxx  = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v84 &
      - 30.0d0*(M_xxxyy + v88) + 330.0d0*(v80 + v82) - 140.0d0*(v85 + &
      v86) + 120.0d0*(v100 + v93 + v94 + v97) + 60.0d0*(v81 + v83 + v92 &
      + v96) - 300.0d0*(v87 + v89 + v91 + v95) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v90 + v98 + v99))
    S_xxxxy   = v102*y
    Ms_xxxxy  = M_0*S_xxxxy + v105 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v109) + &
      78.0d0*(v106 + v111) + 4.0d0*(v107 + v123) + 56.0d0*(v108 + v110 &
      + v116) + 8.0d0*(v122 + v124 + v126 + v128) - (2.0d0*M_xxyyy + &
      24.0d0*v112 + 30.0d0*v113 + 28.0d0*v114 + 28.0d0*v115 + 48.0d0* &
      v117 + 48.0d0*v118 + 48.0d0*v119 + 48.0d0*v120 + 24.0d0*v121 + &
      v125 + 28.0d0*v127))
    S_xxxxz   = v102*z
    Ms_xxxxz  = M_0*S_xxxxz + v134 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v138 &
      + 56.0d0*v139 + 106.0d0*(v135 + v142) + 4.0d0*(v136 + v151) + &
      104.0d0*(v137 + v145) + 32.0d0*(v143 + v147) + 48.0d0*(v144 + &
      v146) + 8.0d0*(v148 + v152) - (M_yyyyz + 36.0d0*v140 + 28.0d0* &
      v141 + 8.0d0*v149 + 5.0d0*v150 + 36.0d0*v153 + 8.0d0*v154))
    S_xxxyy   = x*(-v6*v7 + v101 + v155 + v61)
    Ms_xxxyy  = M_0*S_xxxyy + v156 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v84 + &
      112.0d0*v85 - 14.0d0*v86 + 141.0d0*v88 - 3.0d0*(M_xyyyy + v98) + &
      159.0d0*(v81 + v92) + 75.0d0*(v83 + v96) + 276.0d0*(v87 + v91) - &
      60.0d0*(v100 + v93 + v94 + v97) - 18.0d0*(v80 + v82 + v89 + v95) &
      - 42.0d0*(v157 + v158 + v159 + v160 + v161 + v162))
    S_xxxyz   = v4*v9
    Ms_xxxyz  = 0.333333333333333d0*(5.0d0*(v163 + v164 + v176) + 7.0d0*(v166 + v167 + &
      v168) + 2.0d0*(-v169 + v170 - v171 + v173 + v174 - v175)) + M_0* &
      S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy*v165 + S_xx*v172 + S_xxy*v56 &
      + S_xyz*v51
    S_xxyyy   = y*(-v5*v7 + v101 + v177)
    Ms_xxyyy  = M_0*S_xxyyy + v105 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v113 &
      - 17.0d0*v125 + 112.0d0*v178 - 14.0d0*v179 - 3.0d0*(M_xxxxy + &
      v109) + 75.0d0*(v107 + v123) + 159.0d0*(v112 + v121) + 276.0d0*( &
      v117 + v118) - 60.0d0*(v106 + v111 + v119 + v120) - 18.0d0*(v122 &
      + v124 + v126 + v128) - 42.0d0*(v108 + v110 + v114 + v115 + v116 &
      + v127))
    S_xxyyz   = z*(0.0158730158730159d0*v26 + v155 + v177)
    Ms_xxyyz  = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v131 + v132) + 9.0d0*(v138 + v150) + 112.0d0*(v141 + v180) + &
      6.0d0*(v137 + v145 + v149 + v154) + 132.0d0*(v140 + v144 + v146 + &
      v153) + 81.0d0*(v129 + v136 + v143 + v147 + v151) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v130 + 5.0d0*v133 + 6.0d0* &
      v135 + 14.0d0*v139 + 6.0d0*v142 + 6.0d0*v148 + 6.0d0*v152 + &
      14.0d0*v181))
    S_xyyyy   = v182*x
    Ms_xyyyy  = M_0*S_xyyyy + v156 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v98) + &
      4.0d0*(v83 + v96) + 78.0d0*(v93 + v97) + 56.0d0*(v157 + v158 + &
      v161) + 8.0d0*(v80 + v82 + v89 + v95) - (2.0d0*M_xxxyy + 48.0d0* &
      v100 + 28.0d0*v159 + 28.0d0*v160 + 28.0d0*v162 + 24.0d0*v81 + v84 &
      + 48.0d0*v87 + 30.0d0*v88 + 48.0d0*v91 + 24.0d0*v92 + 48.0d0*v94 &
      ))
    S_xyyyz   = v10*v4
    Ms_xyyyz  = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v169 + v171 + v175) + &
      5.0d0*(v170 + v173 + v174) + 2.0d0*(v163 + v164 - v166 - v167 - &
      v168 + v176)) + M_0*S_xyyyz + M_xyy*v77 + M_xyyyz + M_yyyz*x + &
      S_xyy*v78 + S_yy*v172
    S_yyyyy   = y*(0.111111111111111d0*(-10.0d0*v76) + v75 + v79)
    Ms_yyyyy  = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v125 &
      - 30.0d0*(M_xxyyy + v113) + 330.0d0*(v122 + v124) - 140.0d0*(v178 &
      + v179) + 120.0d0*(v106 + v111 + v119 + v120) + 60.0d0*(v107 + &
      v112 + v121 + v123) - 300.0d0*(v117 + v118 + v126 + v128) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v103 + v104 + v109))
    S_yyyyz   = v182*z
    Ms_yyyyz  = M_0*S_yyyyz + v134 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v150 &
      + 56.0d0*v181 + 8.0d0*(v135 + v142) + 32.0d0*(v136 + v151) + &
      48.0d0*(v140 + v153) + 4.0d0*(v143 + v147) + 106.0d0*(v148 + v152 &
      ) + 104.0d0*(v149 + v154) - (M_xxxxz + 8.0d0*v137 + 5.0d0*v138 + &
      36.0d0*v144 + 8.0d0*v145 + 36.0d0*v146 + 28.0d0*v180))
    S_xxxxxx  = a6 + v184 + 0.0909090909090909d0*(-15.0d0*v185 + 5.0d0*v186)
    Ms_xxxxxx = M_0*S_xxxxxx + M_yyyyz*v189 + v192 + 0.00432900432900433d0*(136.0d0* &
      M_xxxxxx - 75.0d0*M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + &
      2360.0d0*v198 + 576.0d0*v202 - 2340.0d0*v209 - 2260.0d0*v216 + &
      1440.0d0*v221 + 1620.0d0*(v193 + v200) - 600.0d0*(v203 + v204) - &
      120.0d0*(v210 + v230) + 840.0d0*(v214 + v239) - 160.0d0*(v231 + &
      v236) + 90.0d0*(-M_xxxxzz + v194 + v211) + 360.0d0*(v201 - v206 + &
      v225) + 30.0d0*(v215 + v234 + v235) - 180.0d0*(M_xxxxyy + v208 + &
      v222 + v223) + 720.0d0*(v199 + v212 + v220 + v226) - 1680.0d0*( &
      v205 + v207 + v219 + v224) - 165.0d0*(v195 + v196 + v197 + v217 + &
      v232 + v237) + 60.0d0*(v213 - v218 - v227 - v228 - v229 - v233 - &
      v238))
    S_xxxxxy  = v1*v241
    Ms_xxxxxy = M_0*S_xxxxxy + v256 - v266*z + 0.0303030303030303d0*(-70.0d0*v265 - &
      10.0d0*v269 + 28.0d0*(M_xxxxxy + v261) + 20.0d0*(v258 + v275) - &
      60.0d0*(v267 + v288) + 100.0d0*(v260 + v262 + v272) + 190.0d0*( &
      v257 + v259 + v263 + v268) - 140.0d0*(v270 + v271 + v279 + v281) &
      - 5.0d0*(M_xyyyyy + v273 + v277 + v285 + v286) + 40.0d0*(-v264 + &
      v274 + v276 + v278 + v280 - v282 + v283 + v284 + v287 + v289))
    S_xxxxxz  = v2*v241
    Ms_xxxxxz = M_0*S_xxxxxz - v298 - v303 - v319 + 0.0303030303030303d0*(28.0d0* &
      M_xxxxxz + 68.0d0*v294 + 250.0d0*(v290 + v299) + 220.0d0*(v293 + &
      v321) + 80.0d0*(v300 + v326) + 90.0d0*(v304 + v322) - 140.0d0*( &
      v306 + v310) + 160.0d0*(v307 + v311) + 330.0d0*(M_xxx*S_xxz + &
      M_xxz*S_xxx) + 10890.0d0*(-M_xxxyyz + v297 - v305) + 100.0d0*( &
      v295 - v296 - v335) + 20.0d0*(v291 + v292 + v315 + v331) - 5.0d0* &
      (M_xxxzzz + M_xyyyyz + M_xyyzzz + v309 + v330 + v334) + 40.0d0*( &
      v312 - v313 + v316 - v320 + v327 - v328 + v332 - v336) - 25.0d0*( &
      v301 + v308 + v314 + v317 + v323 + v324 + v325 + v329 + v333))
    S_xxxxyy  = 0.0303030303030303d0*(-3.0d0*v185 + 2.0d0*v186) + v25*v6 + v338 + v339* &
      v6
    Ms_xxxxyy = M_0*S_xxxxyy + v340 - v341 - v345 + v348 + v350 + v351*(M_yyyyz + v0) + &
      0.00432900432900433d0*(-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - &
      11.0d0*M_xxxxzz - 5.0d0*M_yyyyyy - 4.0d0*M_yyyyzz - 64.0d0*v202 + &
      412.0d0*v203 - 36.0d0*v204 + 628.0d0*v206 + 1800.0d0*v209 - &
      720.0d0*v221 - 82.0d0*(v193 + v200) + 942.0d0*(v194 + v211) + &
      2.0d0*(v196 + v232) - 60.0d0*(v198 + v216) + 760.0d0*(v199 + v220 &
      ) + 1288.0d0*(v205 + v219) - 220.0d0*(v210 + v230) - 402.0d0*( &
      v212 + v226) - 392.0d0*(v214 + v239) + 37.0d0*(v228 + v233) + &
      80.0d0*(v231 + v236) + 268.0d0*(v201 - v213 + v225) - 8.0d0*(v215 &
      + v234 + v235) - 22.0d0*(M_xxyyyy + v208 + v222 + v223) - 26.0d0* &
      (v195 + v197 + v217 + v237) - 19.0d0*(v218 + v227 + v229 + v238) &
      - 448.0d0*(v342 + v343 + v344 + v346))
    S_xxxxyz  = v3*(-v337 + v25 + v339)
    Ms_xxxxyz = M_0*S_xxxxyz + v360 + 0.0303030303030303d0*(26.0d0*v373 + 32.0d0*( &
      M_xxxxyz + v366) + 40.0d0*(v378 + v388) + 8.0d0*(v387 + v393) + &
      96.0d0*(v368 + v369 + v379) + 170.0d0*(v361 + v370 + v375 + v377 &
      ) + 4.0d0*(v362 + v376 + v386 + v392) + 160.0d0*(v363 + v367 + &
      v383 + v384) + 64.0d0*(v364 + v365 + v381 + v385 + v395) - (2.0d0 &
      *M_xxyyyz + 40.0d0*v371 + 18.0d0*v372 + 38.0d0*v374 + 64.0d0*v380 &
      + 64.0d0*v382 + 13.0d0*v389 + 5.0d0*v390 + v391 + 40.0d0*v394 + &
      18.0d0*v396 + 13.0d0*v397))
    S_xxxyyy  = v1*(0.0909090909090909d0*v26 + v398 + v399 + v61)
    Ms_xxxyyy = 0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v242 + v253) + 75.0d0*(v244 + v251) + 69.0d0*(v245 + v248) + &
      25.0d0*(v265 + v269) + 31.0d0*(v258 + v264 + v275 + v282) - ( &
      M_xxxxxy + 11.0d0*M_xxxyz*v400 + M_xxxyzz + M_xyyyyy + 11.0d0* &
      M_xyyyz*v400 + M_xyyyzz + v243 + v246 + v247 + v249 + v250 + v252 &
      + v254 + v255 + 10.0d0*v257 + 10.0d0*v259 + 7.0d0*v260 + v261 + &
      7.0d0*v262 + 10.0d0*v263 + 6.0d0*v267 + 10.0d0*v268 + 10.0d0*v270 &
      + 10.0d0*v271 + 7.0d0*v272 + 7.0d0*v273 + 10.0d0*v274 + 10.0d0* &
      v276 + 7.0d0*v277 + 10.0d0*v278 + 10.0d0*v279 + 10.0d0*v280 + &
      10.0d0*v281 + 10.0d0*v283 + 10.0d0*v284 + 7.0d0*v285 + v286 + &
      10.0d0*v287 + 6.0d0*v288 + 10.0d0*v289 + 6.0d0*v401 + 6.0d0*v402 &
      ))
    S_xxxyyz  = v2*(0.0909090909090909d0*(-v28) + v399 + v403)
    Ms_xxxyyz = M_0*S_xxxyyz + M_xxyy*v165 + S_xxyy*v56 + v298 + v303 + v319 + v404 + &
      0.0303030303030303d0*(31.0d0*M_xxxyyz + v294 + 47.0d0*v297 + &
      79.0d0*v305 + 103.0d0*(v291 + v315) + 55.0d0*(v292 + v331) + &
      88.0d0*(v296 + v335) + 43.0d0*(v300 + v326) + 152.0d0*(v306 + &
      v310) + 95.0d0*(v307 + v311) + 13.0d0*(v314 + v324 + v329) + &
      10.0d0*(v313 + v320 + v328 + v336) - (M_xyyyyz + 4.0d0*v290 + &
      v293 + 7.0d0*v295 + 4.0d0*v299 + 10.0d0*v312 + 10.0d0*v316 + v321 &
      + 10.0d0*v327 + v330 + 10.0d0*v332 + 18.0d0*v405 + 18.0d0*v406 + &
      18.0d0*v407))
    S_xxyyyy  = 0.0303030303030303d0*(-3.0d0*v408 + 2.0d0*v409) + v338 + v339*v5 + v5* &
      v75
    Ms_xxyyyy = M_0*S_xxyyyy + v340 + v341 + v345 - v348 - v350 + v351*(M_xxxxz + v0) + &
      0.00432900432900433d0*(-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0 &
      *M_xxyyyy - 12.0d0*M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v209 + &
      628.0d0*v213 + 1800.0d0*v221 + 412.0d0*v222 - 64.0d0*v234 - &
      36.0d0*v410 + 37.0d0*(v193 + v200) - 402.0d0*(v194 + v211) + &
      80.0d0*(v198 + v216) - 220.0d0*(v199 + v220) + 2.0d0*(v201 + v225 &
      ) + 760.0d0*(v210 + v230) + 942.0d0*(v212 + v226) - 82.0d0*(v228 &
      + v233) - 60.0d0*(v231 + v236) + 1288.0d0*(v342 + v343) - 392.0d0 &
      *(v344 + v346) + 268.0d0*(v196 - v206 + v232) - 8.0d0*(v202 + &
      v208 + v223) - 22.0d0*(M_xxxxyy + v203 + v215 + v235) - 19.0d0*( &
      v195 + v197 + v217 + v237) - 448.0d0*(v205 + v214 + v219 + v239) &
      - 26.0d0*(v218 + v227 + v229 + v238))
    S_xxyyyz  = v3*(0.0909090909090909d0*(-v76) + v398 + v403)
    Ms_xxyyyz = M_0*S_xxyyyz + v360 + v411 + v413 + v414 + 0.0303030303030303d0*(31.0d0* &
      M_xxyyyz + 47.0d0*v373 + 79.0d0*v374 + v390 + 43.0d0*(v362 + v392 &
      ) + 95.0d0*(v371 + v394) + 99.0d0*(v372 + v396) + 103.0d0*(v376 + &
      v386) + 55.0d0*(v378 + v388) + 152.0d0*(v380 + v382) + 88.0d0*( &
      v381 + v385) + 13.0d0*(v364 + v365 + v395) + 10.0d0*(v363 + v367 &
      + v383 + v384) - (M_xxxxyz + 10.0d0*v361 + v366 + 18.0d0*v368 + &
      18.0d0*v369 + 10.0d0*v370 + 10.0d0*v375 + 10.0d0*v377 + 18.0d0* &
      v379 + 4.0d0*v387 + v389 + 7.0d0*v391 + 4.0d0*v393 + v397))
    S_xyyyyy  = v1*v415
    Ms_xyyyyy = M_0*S_xyyyyy + v256 - v412*z + 0.0303030303030303d0*(-10.0d0*v265 - &
      70.0d0*v269 + 28.0d0*(M_xyyyyy + v286) + 20.0d0*(v264 + v282) - &
      60.0d0*(v401 + v402) + 100.0d0*(v273 + v277 + v285) + 190.0d0*( &
      v274 + v276 + v283 + v284) - 140.0d0*(v278 + v280 + v287 + v289) &
      - 5.0d0*(M_xxxxxy + v260 + v261 + v262 + v272) + 40.0d0*(v257 - &
      v258 + v259 + v263 + v268 + v270 + v271 - v275 + v279 + v281))
    S_xyyyyz  = v2*(0.0909090909090909d0*(-6.0d0*v76) + v339 + v75)
    Ms_xyyyyz = M_0*S_xyyyyz + v404 + 0.0303030303030303d0*(26.0d0*v297 + 32.0d0*( &
      M_xyyyyz + v330) + 8.0d0*(v290 + v299) + 40.0d0*(v292 + v331) + &
      96.0d0*(v405 + v406 + v407) + 4.0d0*(v291 + v300 + v315 + v326) + &
      170.0d0*(v312 + v316 + v327 + v332) + 160.0d0*(v313 + v320 + v328 &
      + v336) + 64.0d0*(v296 + v314 + v324 + v329 + v335) - (2.0d0* &
      M_xxxyyz + 13.0d0*v293 + 5.0d0*v294 + v295 + 18.0d0*v304 + 38.0d0 &
      *v305 + 64.0d0*v306 + 40.0d0*v307 + 64.0d0*v310 + 40.0d0*v311 + &
      13.0d0*v321 + 18.0d0*v322))
    S_yyyyyy  = b6 + v184 + 0.0909090909090909d0*(-15.0d0*v408 + 5.0d0*v409)
    Ms_yyyyyy = M_0*S_yyyyyy + v192 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v209 - &
      2340.0d0*v221 + 2360.0d0*v231 + 576.0d0*v234 - 2260.0d0*v236 - &
      160.0d0*(v198 + v216) - 120.0d0*(v199 + v220) - 600.0d0*(v222 + &
      v410) + 1620.0d0*(v228 + v233) + 840.0d0*(v344 + v346) + 90.0d0*( &
      -M_yyyyzz + v212 + v226) + 360.0d0*(v196 - v213 + v232) - 180.0d0 &
      *(M_xxyyyy + v203 + v215 + v235) + 720.0d0*(v194 + v210 + v211 + &
      v230) + 30.0d0*(v202 + v204 + v208 + v223) - 1680.0d0*(v342 + &
      v343 + v347 + v349) - 165.0d0*(v201 + v218 + v225 + v227 + v229 + &
      v238) + 60.0d0*(-v193 - v195 - v197 - v200 + v206 - v217 - v237))
    S_yyyyyz  = v3*v415
    Ms_yyyyyz = M_0*S_yyyyyz - v411 - v413 - v414 + 0.0303030303030303d0*(28.0d0* &
      M_yyyyyz + 68.0d0*v390 + 80.0d0*(v362 + v392) + 160.0d0*(v371 + &
      v394) + 90.0d0*(v372 + v396) - 140.0d0*(v380 + v382) + 250.0d0*( &
      v387 + v393) + 220.0d0*(v389 + v397) + 330.0d0*(M_yyy*S_yyz + &
      M_yyz*S_yyy) + 10890.0d0*(-M_xxyyyz + v373 - v374) + 100.0d0*( &
      -v381 - v385 + v391) + 20.0d0*(v376 + v378 + v386 + v388) - 5.0d0 &
      *(M_xxxxyz + M_xxyzzz + M_yyyzzz + v354 + v357 + v366) + 40.0d0*( &
      v361 - v363 - v367 + v370 + v375 + v377 - v383 - v384) - 25.0d0*( &
      v352 + v353 + v355 + v356 + v358 + v359 + v364 + v365 + v395))
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
#undef  Ms_xxxxxx           
#undef  M_xxxxxx            
#undef  Ms_xxxxxy           
#undef  M_xxxxxy            
#undef  Ms_xxxxxz           
#undef  M_xxxxxz            
#undef  Ms_xxxxyy           
#undef  M_xxxxyy            
#undef  Ms_xxxxyz           
#undef  M_xxxxyz            
#undef  M_xxxyyy            
#undef  Ms_xxxyyy           
#undef  Ms_xxxyyz           
#undef  M_xxxyyz            
#undef  Ms_xxyyyy           
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  Ms_xxyyyz           
#undef  Ms_xyyyyy           
#undef  M_xyyyyy            
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  Ms_yyyyyy           
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  Ms_yyyyyz           
    end subroutine mom_es_M2M
    
! OPS  1002*ADD + 2*DIV + 1396*MUL + 117*NEG + POW + 35*SUB = 2553  (3488 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v28, v29, v3, v30, v31, v32, v33, v34,&
                v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45,&
                v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_x,&
                D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy,&
                D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz,&
                D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz,&
                D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz,&
                D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz,&
                D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy,&
                D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz,&
                D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz,&
                D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx,&
                D_xxxxxxy, D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz,&
                D_xxxxyyy, D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy,&
                D_xxxyyyz, D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy,&
                D_xxyyyyz, D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz,&
                D_xyyyyyy, D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz,&
                D_xyzzzzz, D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz,&
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, M_zz,&
                M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz,&
                M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz,&
                M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz,&
                M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz,&
                M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz,&
                M_zzzzzz
#define x                    r(1)
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
#define L_x                  L(0)
#define M_xx                 M(1)
#define L_y                  L(1)
#define M_xy                 M(2)
#define L_z                  L(2)
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
#define M_xxxz               M(15)
#define L_xxxx               L(15)
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
#define M_xxxxx              M(22)
#define M_xxxxy              M(23)
#define L_yyyz               L(23)
#define L_xxxxx              L(24)
#define M_xxxxz              M(24)
#define L_xxxxy              L(25)
#define M_xxxyy              M(25)
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
#define M_xxxxxx             M(33)
#define L_yyyyz              L(34)
#define M_xxxxxy             M(34)
#define L_xxxxxx             L(35)
#define M_xxxxxz             M(35)
#define L_xxxxxy             L(36)
#define M_xxxxyy             M(36)
#define L_xxxxxz             L(37)
#define M_xxxxyz             M(37)
#define M_xxxyyy             M(38)
#define L_xxxxyy             L(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define M_xxyyyy             M(40)
#define L_xxxyyy             L(40)
#define M_xxyyyz             M(41)
#define L_xxxyyz             L(41)
#define L_xxyyyy             L(42)
#define M_xyyyyy             M(42)
#define M_xyyyyz             M(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define M_yyyyyy             M(44)
#define L_xyyyyz             L(45)
#define M_yyyyyz             M(45)
#define L_yyyyyy             L(46)
#define L_yyyyyz             L(47)
#define L_xxxxxxx            L(48)
#define L_xxxxxxy            L(49)
#define L_xxxxxxz            L(50)
#define L_xxxxxyy            L(51)
#define L_xxxxxyz            L(52)
#define L_xxxxyyy            L(53)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define L_xxxyyyz            L(56)
#define L_xxyyyyy            L(57)
#define L_xxyyyyz            L(58)
#define L_xyyyyyy            L(59)
#define L_xyyyyyz            L(60)
#define L_yyyyyyy            L(61)
#define L_yyyyyyz            L(62)
    v268      = y*z
    v269      = 945.0d0*x
    v261      = 15.0d0*v268
    v265      = v268
    v61       = v269
    v83       = 0.5d0*M_xx
    v92       = 0.166666666666667d0*M_xxx
    v93       = 0.5d0*M_xxy
    v94       = 0.5d0*M_xxz
    v112      = 0.0416666666666667d0*M_xxxx
    v113      = 0.166666666666667d0*M_xxxy
    v114      = 0.166666666666667d0*M_xxxz
    v115      = 0.25d0*M_xxyy
    v116      = 0.5d0*M_xxyz
    v149      = 0.00833333333333333d0*M_xxxxx
    v150      = 0.0416666666666667d0*M_xxxxy
    v151      = 0.0416666666666667d0*M_xxxxz
    v152      = 0.0833333333333333d0*M_xxxyy
    v153      = 0.166666666666667d0*M_xxxyz
    v155      = 0.0833333333333333d0*M_xxyyy
    v156      = 0.25d0*M_xxyyz
    v180      = 0.5d0*M_yy
    v182      = 0.166666666666667d0*M_yyy
    v187      = 0.0416666666666667d0*M_yyyy
    v196      = 0.00833333333333333d0*M_yyyyy
    v212      = 0.00138888888888889d0*M_xxxxxx
    v213      = 0.00833333333333333d0*M_xxxxxy
    v214      = 0.00833333333333333d0*M_xxxxxz
    v215      = 0.0208333333333333d0*M_xxxxyy
    v216      = 0.0416666666666667d0*M_xxxxyz
    v218      = 0.0277777777777778d0*M_xxxyyy
    v219      = 0.0833333333333333d0*M_xxxyyz
    v222      = 0.0208333333333333d0*M_xxyyyy
    v223      = 0.0833333333333333d0*M_xxyyyz
    v227      = 0.00138888888888889d0*M_yyyyyy
    v228      = 0.00833333333333333d0*M_yyyyyz
    v229      = 0.0416666666666667d0*M_yyyyz
    v231      = 0.166666666666667d0*M_yyyz
    v234      = 0.5d0*M_yyz
    v243      = 0.5d0*M_xyy
    v245      = 0.166666666666667d0*M_xyyy
    v247      = 0.0416666666666667d0*M_xyyyy
    v249      = 0.00833333333333333d0*M_xyyyyy
    M_zz      = -(M_xx + M_yy)
    v238      = 0.5d0*M_zz
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    v244      = 0.5d0*M_yzz
    M_zzz     = -(M_xxz + M_yyz)
    v239      = 0.166666666666667d0*M_zzz
    M_xxzz    = -(M_xxxx + M_xxyy)
    v117      = 0.25d0*M_xxzz
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v235      = 0.25d0*M_yyzz
    M_yzzz    = -(M_xxyz + M_yyyz)
    v246      = 0.166666666666667d0*M_yzzz
    M_zzzz    = -(M_xxzz + M_yyzz)
    v240      = 0.0416666666666667d0*M_zzzz
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    v154      = 0.0833333333333333d0*M_xxxzz
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    v157      = 0.25d0*M_xxyzz
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    v158      = 0.0833333333333333d0*M_xxzzz
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -(M_xxxzz + M_xyyzz)
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    v232      = 0.0833333333333333d0*M_yyyzz
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v236      = 0.0833333333333333d0*M_yyzzz
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    v248      = 0.0416666666666667d0*M_yzzzz
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    v241      = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    v217      = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    v220      = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    v221      = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    v224      = 0.125d0*M_xxyyzz
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    v225      = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    v226      = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    v230      = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v233      = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v237      = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    v250      = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    v242      = 0.00138888888888889d0*M_zzzzzz
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v251      = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v251
    v24       = 7.0d0*v0
    a3        = a1*a2
    a4        = a2*a2
    v19       = a4
    v54       = 33.0d0*v19
    v82       = 143.0d0*v19
    a5        = a2*a3
    a6        = a3*a3
    v49       = a6
    v74       = -429.0d0*v49
    a7        = a3*a4
    b2        = b1*b1
    v1        = b2
    v252      = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v252
    v29       = 7.0d0*v1
    v59       = v1*v19
    v80       = -429.0d0*v59
    b3        = b1*b2
    b4        = b2*b2
    v31       = b4
    v66       = v0*v31
    v67       = 33.0d0*v31
    v103      = 143.0d0*v31
    v129      = -429.0d0*v66
    b5        = b2*b3
    b6        = b3*b3
    v69       = b6
    v178      = -429.0d0*v69
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v0 + v1
    v253      = 3.0d0*h
    v254      = h*v0
    v255      = h*v1
    v256      = h*v19
    v257      = h*v31
    v4        = -h
    v12       = v253
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v254
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v255
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v254
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 + 630.0d0*v255 - 945.0d0*v31
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v256
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v254
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v257
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v86       = -18.0d0*v51 + v46 + v79
    v87       = 66.0d0*v57
    v267      = -v87
    v88       = 9.0d0*v17
    v89       = 198.0d0*v57
    v101      = h*v67
    v102      = -18.0d0*v65 + v101 + v46
    v179      = v178 + v47 - 135.0d0*v65 + 495.0d0*v70
    u2        = 1.0/h
    u         = sqrt(u2)
    u3        = u*u2
    v2        = u3
    D_x       = -v2*x
    D_y       = -v2*y
    D_z       = -v2*z
    u4        = u2*u2
    u5        = u2*u3
    v3        = u5
    v258      = 3.0d0*v3
    v6        = v258*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v258*v265
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v259      = 3.0d0*v8
    v9        = v8*x
    v11       = v259*(h - v10)
    D_xxx     = -3.0d0*v9*(v251 - v253)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    D_xyz     = -v261*v9
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = v259*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v260      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v260*y
    v26       = v260*z
    v28       = v15*v261
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v159      = 0.5d0*D_xxyy
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    v169      = 0.5d0*D_xxzz
    D_xyyy    = v22*v30
    D_xyyz    = v26*(v29 + v4)
    D_xyzz    = -(D_xxxy + D_xyyy)
    v203      = 0.5d0*D_xyzz
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v262      = 15.0d0*v34
    v263      = v34*z
    v35       = v262*x
    v39       = v263
    v41       = 315.0d0*v263*x*y
    v42       = v262*y
    D_xxxxx   = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy   = v34*v38*y
    D_xxxxz   = v38*v39
    D_xxxyy   = v35*(v40 + h*v24 + 21.0d0*v32)
    v118      = 0.5d0*D_xxxyy
    D_xxxyz   = v41*(h - v5)
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    v124      = 0.5d0*D_xxxzz
    D_xxyyy   = v42*(v40 + h*v29 + 21.0d0*v20)
    v138      = 0.5d0*D_xxyyy
    v160      = 0.166666666666667d0*D_xxyyy
    D_xxyyz   = v39*(v36 - 945.0d0*v252 + 105.0d0*(v254 + v255))
    v166      = 0.5d0*D_xxyyz
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    v144      = 0.5d0*D_xxyzz
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    v170      = 0.166666666666667d0*D_xxzzz
    v175      = 0.5d0*D_xxzzz
    D_xyyyy   = v34*v43*x
    D_xyyyz   = v41*(h - v7)
    v200      = 0.5d0*D_xyyyz
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    v191      = 0.5d0*D_xyyzz
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    v204      = 0.166666666666667d0*D_xyzzz
    v209      = 0.5d0*D_xyzzz
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    D_yyyyy   = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz   = v39*v43
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    u12       = u6*u6
    u13       = u6*u7
    v44       = u13
    v270      = 315.0d0*v44
    v264      = v270*x
    v45       = 45.0d0*v44
    v52       = v264*y
    v56       = v264*z
    v60       = v265*v270
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    L_xxxxxx  = D_xxxxxx*M_0
    D_xxxxxy  = v52*v55
    L_xxxxxy  = D_xxxxxy*M_0
    D_xxxxxz  = v55*v56
    L_xxxxxz  = D_xxxxxz*M_0
    D_xxxxyy  = v45*(v58 + v17*v29 - 21.0d0*v256 + 14.0d0*v51 + 231.0d0*v59)
    v95       = 0.5d0*D_xxxxyy
    L_xxxxyy  = D_xxxxyy*M_0
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    L_xxxxyz  = D_xxxxyz*M_0
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    v98       = 0.5d0*D_xxxxzz
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    v106      = 0.5d0*D_xxxyyy
    v119      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy  = D_xxxyyy*M_0
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    v122      = 0.5d0*D_xxxyyz
    L_xxxyyz  = D_xxxyyz*M_0
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    v109      = 0.5d0*D_xxxyzz
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    v125      = 0.166666666666667d0*D_xxxzzz
    v127      = 0.5d0*D_xxxzzz
    D_xxyyyy  = v45*(v58 + v17*v24 - 21.0d0*v257 + 14.0d0*v65 + 231.0d0*v66)
    v132      = 0.5d0*D_xxyyyy
    v139      = 0.166666666666667d0*D_xxyyyy
    v161      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy  = D_xxyyyy*M_0
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    v142      = 0.5d0*D_xxyyyz
    v164      = 0.166666666666667d0*D_xxyyyz
    L_xxyyyz  = D_xxyyyz*M_0
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    v135      = 0.5d0*D_xxyyzz
    v167      = 0.25d0*D_xxyyzz
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    v145      = 0.166666666666667d0*D_xxyzzz
    v147      = 0.5d0*D_xxyzzz
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    v171      = 0.0416666666666667d0*D_xxzzzz
    v176      = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy  = v52*v68
    L_xyyyyy  = D_xyyyyy*M_0
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    v189      = 0.5d0*D_xyyyyz
    v198      = 0.166666666666667d0*D_xyyyyz
    L_xyyyyz  = D_xyyyyz*M_0
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    v184      = 0.5d0*D_xyyyzz
    v201      = 0.25d0*D_xyyyzz
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    v192      = 0.166666666666667d0*D_xyyzzz
    v194      = 0.5d0*D_xyyzzz
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    v205      = 0.0416666666666667d0*D_xyzzzz
    v210      = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    L_yyyyyy  = D_yyyyyy*M_0
    D_yyyyyz  = v60*v68
    L_yyyyyz  = D_yyyyyz*M_0
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v266      = 315.0d0*v71
    v72       = v266*x
    v75       = v266*y
    v77       = v266*z
    v81       = v265*v269*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = v75*v76
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = v76*v77
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    v84       = 0.5d0*D_xxxxxyy
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    v85       = 0.5d0*D_xxxxxzz
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxxx*v83 + D_xxxxxxy*M_xy + D_xxxxxxz*M_xz + &
      D_xxxxxyz*M_yz + M_yy*v84 + M_zz*v85
    D_xxxxyyy = -945.0d0*v71*y*(v267 + v1*v18 + v1*v82 - v86)
    v90       = 0.5d0*D_xxxxyyy
    v96       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = v77*(-v1*v88 + v80 + v86 + v89)
    v97       = 0.5d0*D_xxxxyyz
    L_xxxxyyz = D_xxxxyyz*M_0
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    v91       = 0.5d0*D_xxxxyzz
    L_xxxxy   = D_xxxxxxy*v83 + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + M_yy*v90 + M_zz*v91
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    v99       = 0.166666666666667d0*D_xxxxzzz
    v100      = 0.5d0*D_xxxxzzz
    L_xxxx    = D_xxxx*M_0 + D_xxxxxx*v83 + D_xxxxxxx*v92 + D_xxxxxxy*v93 + D_xxxxxxz* &
      v94 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + M_xyy*v84 + M_xzz*v85 + M_yy*v95 + M_yyy*v96 + M_yyz*v97 + &
      M_yzz*v91 + M_zz*v98 + M_zzz*v99
    L_xxxxz   = D_xxxxxxz*v83 + D_xxxxxyz*M_xy + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + M_yy*v97 + M_zz*v100
    D_xxxyyyy = -v61*v71*(v267 + v0*v103 + v0*v18 - v102)
    v104      = 0.5d0*D_xxxyyyy
    v107      = 0.166666666666667d0*D_xxxyyyy
    v120      = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v88))
    v108      = 0.5d0*D_xxxyyyz
    v121      = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyyz = D_xxxyyyz*M_0
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    v105      = 0.5d0*D_xxxyyzz
    v123      = 0.25d0*D_xxxyyzz
    L_xxxyy   = D_xxxxxyy*v83 + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + M_yy*v104 + M_zz*v105
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    v110      = 0.166666666666667d0*D_xxxyzzz
    v111      = 0.5d0*D_xxxyzzz
    L_xxxy    = D_xxxxxxy*v92 + D_xxxxxy*v83 + D_xxxxxyy*v93 + D_xxxxxyz*v94 + D_xxxxyy* &
      M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + M_xyy*v90 + M_xzz*v91 + M_yy*v106 + M_yyy*v107 + M_yyz* &
      v108 + M_yzz*v105 + M_zz*v109 + M_zzz*v110
    L_xxxyz   = D_xxxxxyz*v83 + D_xxxxyyz*M_xy + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + M_yy*v108 + M_zz*v111
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    v126      = 0.0416666666666667d0*D_xxxzzzz
    v128      = 0.166666666666667d0*D_xxxzzzz
    L_xxx     = D_xxx*M_0 + D_xxxxx*v83 + D_xxxxxx*v92 + D_xxxxxxx*v112 + D_xxxxxxy*v113 &
      + D_xxxxxxz*v114 + D_xxxxxy*v93 + D_xxxxxyy*v115 + D_xxxxxyz*v116 &
      + D_xxxxxz*v94 + D_xxxxxzz*v117 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + &
      D_xxxxz*M_xz + D_xxxyz*M_yz + M_xyy*v95 + M_xyyy*v96 + M_xyyz*v97 &
      + M_xyzz*v91 + M_xzz*v98 + M_xzzz*v99 + M_yy*v118 + M_yyy*v119 + &
      M_yyyy*v120 + M_yyyz*v121 + M_yyz*v122 + M_yyzz*v123 + M_yzz*v109 &
      + M_yzzz*v110 + M_zz*v124 + M_zzz*v125 + M_zzzz*v126
    L_xxxz    = D_xxxxxxz*v92 + D_xxxxxyz*v93 + D_xxxxxz*v83 + D_xxxxxzz*v94 + D_xxxxyz* &
      M_xy + D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz* &
      M_0 + M_xyy*v97 + M_xzz*v100 + M_yy*v122 + M_yyy*v121 + M_yyz* &
      v105 + M_yzz*v111 + M_zz*v127 + M_zzz*v128
    D_xxyyyyy = v75*(-45.0d0*v51 - 30.0d0*v65 + v101 + v129 + v78)
    v130      = 0.5d0*D_xxyyyyy
    v133      = 0.166666666666667d0*D_xxyyyyy
    v140      = 0.0416666666666667d0*D_xxyyyyy
    v162      = 0.00833333333333333d0*D_xxyyyyy
    L_xxyyyyy = D_xxyyyyy*M_0
    D_xxyyyyz = v77*(-v0*v88 + v102 + v129 + v89)
    v134      = 0.5d0*D_xxyyyyz
    v141      = 0.166666666666667d0*D_xxyyyyz
    v163      = 0.0416666666666667d0*D_xxyyyyz
    L_xxyyyyz = D_xxyyyyz*M_0
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    v131      = 0.5d0*D_xxyyyzz
    v143      = 0.25d0*D_xxyyyzz
    v165      = 0.0833333333333333d0*D_xxyyyzz
    v173      = 0.166666666666667d0*D_xxyyyzz
    L_xxyyy   = D_xxxxyyy*v83 + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + M_yy*v130 + M_zz*v131
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    v136      = 0.166666666666667d0*D_xxyyzzz
    v137      = 0.5d0*D_xxyyzzz
    v168      = 0.0833333333333333d0*D_xxyyzzz
    v174      = 0.25d0*D_xxyyzzz
    L_xxyy    = D_xxxxxyy*v92 + D_xxxxyy*v83 + D_xxxxyyy*v93 + D_xxxxyyz*v94 + D_xxxyyy* &
      M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + M_xyy*v104 + M_xzz*v105 + M_yy*v132 + M_yyy*v133 + M_yyz* &
      v134 + M_yzz*v131 + M_zz*v135 + M_zzz*v136
    L_xxyyz   = D_xxxxyyz*v83 + D_xxxyyyz*M_xy + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + M_yy*v134 + M_zz*v137
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    v146      = 0.0416666666666667d0*D_xxyzzzz
    v148      = 0.166666666666667d0*D_xxyzzzz
    L_xxy     = D_xxxxxxy*v112 + D_xxxxxy*v92 + D_xxxxxyy*v113 + D_xxxxxyz*v114 + &
      D_xxxxy*v83 + D_xxxxyy*v93 + D_xxxxyyy*v115 + D_xxxxyyz*v116 + &
      D_xxxxyz*v94 + D_xxxxyzz*v117 + D_xxxyy*M_xy + D_xxxyyz*M_xyz + &
      D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + M_xyy*v106 + M_xyyy* &
      v107 + M_xyyz*v108 + M_xyzz*v105 + M_xzz*v109 + M_xzzz*v110 + &
      M_yy*v138 + M_yyy*v139 + M_yyyy*v140 + M_yyyz*v141 + M_yyz*v142 + &
      M_yyzz*v143 + M_yzz*v135 + M_yzzz*v136 + M_zz*v144 + M_zzz*v145 + &
      M_zzzz*v146
    L_xxyz    = D_xxxxxyz*v92 + D_xxxxyyz*v93 + D_xxxxyz*v83 + D_xxxxyzz*v94 + D_xxxyyz* &
      M_xy + D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz* &
      M_0 + M_xyy*v108 + M_xzz*v111 + M_yy*v142 + M_yyy*v141 + M_yyz* &
      v131 + M_yzz*v137 + M_zz*v147 + M_zzz*v148
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    v172      = 0.00833333333333333d0*D_xxzzzzz
    v177      = 0.0416666666666667d0*D_xxzzzzz
    L_xx      = D_xx*M_0 + D_xxxx*v83 + D_xxxxx*v92 + D_xxxxxx*v112 + D_xxxxxxx*v149 + &
      D_xxxxxxy*v150 + D_xxxxxxz*v151 + D_xxxxxy*v113 + D_xxxxxyy*v152 &
      + D_xxxxxyz*v153 + D_xxxxxz*v114 + D_xxxxxzz*v154 + D_xxxxy*v93 + &
      D_xxxxyy*v115 + D_xxxxyyy*v155 + D_xxxxyyz*v156 + D_xxxxyz*v116 + &
      D_xxxxyzz*v157 + D_xxxxz*v94 + D_xxxxzz*v117 + D_xxxxzzz*v158 + &
      D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + M_xyy* &
      v118 + M_xyyy*v119 + M_xyyyy*v120 + M_xyyyz*v121 + M_xyyz*v122 + &
      M_xyyzz*v123 + M_xyzz*v109 + M_xyzzz*v110 + M_xzz*v124 + M_xzzz* &
      v125 + M_xzzzz*v126 + M_yy*v159 + M_yyy*v160 + M_yyyy*v161 + &
      M_yyyyy*v162 + M_yyyyz*v163 + M_yyyz*v164 + M_yyyzz*v165 + M_yyz* &
      v166 + M_yyzz*v167 + M_yyzzz*v168 + M_yzz*v144 + M_yzzz*v145 + &
      M_yzzzz*v146 + M_zz*v169 + M_zzz*v170 + M_zzzz*v171 + M_zzzzz* &
      v172
    L_xxz     = D_xxxxxxz*v112 + D_xxxxxyz*v113 + D_xxxxxz*v92 + D_xxxxxzz*v114 + &
      D_xxxxyyz*v115 + D_xxxxyz*v93 + D_xxxxyzz*v116 + D_xxxxz*v83 + &
      D_xxxxzz*v94 + D_xxxxzzz*v117 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + &
      D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + M_xyy*v122 + M_xyyy* &
      v121 + M_xyyz*v105 + M_xyzz*v111 + M_xzz*v127 + M_xzzz*v128 + &
      M_yy*v166 + M_yyy*v164 + M_yyyy*v163 + M_yyyz*v173 + M_yyz*v135 + &
      M_yyzz*v174 + M_yzz*v147 + M_yzzz*v148 + M_zz*v175 + M_zzz*v176 + &
      M_zzzz*v177
    D_xyyyyyy = v179*v72
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = v81*(v36 - v103 + 110.0d0*v32)
    v183      = 0.5d0*D_xyyyyyz
    v188      = 0.166666666666667d0*D_xyyyyyz
    v197      = 0.0416666666666667d0*D_xyyyyyz
    L_xyyyyyz = D_xyyyyyz*M_0
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    v181      = 0.5d0*D_xyyyyzz
    v190      = 0.25d0*D_xyyyyzz
    v199      = 0.0833333333333333d0*D_xyyyyzz
    v207      = 0.166666666666667d0*D_xyyyyzz
    L_xyyyy   = D_xxxyyyy*v83 + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyy*v180 + D_xyyyyyz*M_yz + M_zz*v181
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    v185      = 0.166666666666667d0*D_xyyyzzz
    v186      = 0.5d0*D_xyyyzzz
    v202      = 0.0833333333333333d0*D_xyyyzzz
    v208      = 0.25d0*D_xyyyzzz
    L_xyyy    = D_xxxxyyy*v92 + D_xxxyyy*v83 + D_xxxyyyy*v93 + D_xxxyyyz*v94 + D_xxyyyy* &
      M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy* &
      v180 + D_xyyyyyy*v182 + D_xyyyyz*M_yz + M_xyy*v130 + M_xzz*v131 + &
      M_yyz*v183 + M_yzz*v181 + M_zz*v184 + M_zzz*v185
    L_xyyyz   = D_xxxyyyz*v83 + D_xxyyyyz*M_xy + D_xxyyyzz*M_xz + D_xyyyyyz*v180 + &
      D_xyyyyzz*M_yz + D_xyyyz*M_0 + M_zz*v186
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    v193      = 0.0416666666666667d0*D_xyyzzzz
    v195      = 0.166666666666667d0*D_xyyzzzz
    L_xyy     = D_xxxxxyy*v112 + D_xxxxyy*v92 + D_xxxxyyy*v113 + D_xxxxyyz*v114 + &
      D_xxxyy*v83 + D_xxxyyy*v93 + D_xxxyyyy*v115 + D_xxxyyyz*v116 + &
      D_xxxyyz*v94 + D_xxxyyzz*v117 + D_xxyyy*M_xy + D_xxyyyz*M_xyz + &
      D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v180 + D_xyyyyy*v182 + &
      D_xyyyyyy*v187 + D_xyyyz*M_yz + M_xyy*v132 + M_xyyy*v133 + M_xyyz &
      *v134 + M_xyzz*v131 + M_xzz*v135 + M_xzzz*v136 + M_yyyz*v188 + &
      M_yyz*v189 + M_yyzz*v190 + M_yzz*v184 + M_yzzz*v185 + M_zz*v191 + &
      M_zzz*v192 + M_zzzz*v193
    L_xyyz    = D_xxxxyyz*v92 + D_xxxyyyz*v93 + D_xxxyyz*v83 + D_xxxyyzz*v94 + D_xxyyyz* &
      M_xy + D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyz*v182 + &
      D_xyyyyz*v180 + D_xyyyzz*M_yz + D_xyyz*M_0 + M_xyy*v134 + M_xzz* &
      v137 + M_yyz*v181 + M_yzz*v186 + M_zz*v194 + M_zzz*v195
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    v206      = 0.00833333333333333d0*D_xyzzzzz
    v211      = 0.0416666666666667d0*D_xyzzzzz
    L_xy      = D_xxxxxxy*v149 + D_xxxxxy*v112 + D_xxxxxyy*v150 + D_xxxxxyz*v151 + &
      D_xxxxy*v92 + D_xxxxyy*v113 + D_xxxxyyy*v152 + D_xxxxyyz*v153 + &
      D_xxxxyz*v114 + D_xxxxyzz*v154 + D_xxxy*v83 + D_xxxyy*v93 + &
      D_xxxyyy*v115 + D_xxxyyyy*v155 + D_xxxyyyz*v156 + D_xxxyyz*v116 + &
      D_xxxyyzz*v157 + D_xxxyz*v94 + D_xxxyzz*v117 + D_xxxyzzz*v158 + &
      D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy* &
      v180 + D_xyyyy*v182 + D_xyyyyy*v187 + D_xyyyyyy*v196 + D_xyyz* &
      M_yz + M_xyy*v138 + M_xyyy*v139 + M_xyyyy*v140 + M_xyyyz*v141 + &
      M_xyyz*v142 + M_xyyzz*v143 + M_xyzz*v135 + M_xyzzz*v136 + M_xzz* &
      v144 + M_xzzz*v145 + M_xzzzz*v146 + M_yyyyz*v197 + M_yyyz*v198 + &
      M_yyyzz*v199 + M_yyz*v200 + M_yyzz*v201 + M_yyzzz*v202 + M_yzz* &
      v191 + M_yzzz*v192 + M_yzzzz*v193 + M_zz*v203 + M_zzz*v204 + &
      M_zzzz*v205 + M_zzzzz*v206
    L_xyz     = D_xxxxxyz*v112 + D_xxxxyyz*v113 + D_xxxxyz*v92 + D_xxxxyzz*v114 + &
      D_xxxyyyz*v115 + D_xxxyyz*v93 + D_xxxyyzz*v116 + D_xxxyz*v83 + &
      D_xxxyzz*v94 + D_xxxyzzz*v117 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + &
      D_xxyzz*M_xz + D_xyyyyyz*v187 + D_xyyyyz*v182 + D_xyyyz*v180 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v142 + M_xyyy*v141 + M_xyyz*v131 &
      + M_xyzz*v137 + M_xzz*v147 + M_xzzz*v148 + M_yyyz*v207 + M_yyz* &
      v184 + M_yyzz*v208 + M_yzz*v194 + M_yzzz*v195 + M_zz*v209 + M_zzz &
      *v210 + M_zzzz*v211
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    L_x       = D_x*M_0 + D_xxx*v83 + D_xxxx*v92 + D_xxxxx*v112 + D_xxxxxx*v149 + &
      D_xxxxxxx*v212 + D_xxxxxxy*v213 + D_xxxxxxz*v214 + D_xxxxxy*v150 &
      + D_xxxxxyy*v215 + D_xxxxxyz*v216 + D_xxxxxz*v151 + D_xxxxxzz* &
      v217 + D_xxxxy*v113 + D_xxxxyy*v152 + D_xxxxyyy*v218 + D_xxxxyyz* &
      v219 + D_xxxxyz*v153 + D_xxxxyzz*v220 + D_xxxxz*v114 + D_xxxxzz* &
      v154 + D_xxxxzzz*v221 + D_xxxy*v93 + D_xxxyy*v115 + D_xxxyyy*v155 &
      + D_xxxyyyy*v222 + D_xxxyyyz*v223 + D_xxxyyz*v156 + D_xxxyyzz* &
      v224 + D_xxxyz*v116 + D_xxxyzz*v157 + D_xxxyzzz*v225 + D_xxxz*v94 &
      + D_xxxzz*v117 + D_xxxzzz*v158 + D_xxxzzzz*v226 + D_xxy*M_xy + &
      D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v180 + D_xyyy*v182 + D_xyyyy* &
      v187 + D_xyyyyy*v196 + D_xyyyyyy*v227 + D_xyyyyyz*v228 + D_xyyyyz &
      *v229 + D_xyyyyzz*v230 + D_xyyyz*v231 + D_xyyyzz*v232 + D_xyyyzzz &
      *v233 + D_xyyz*v234 + D_xyyzz*v235 + D_xyyzzz*v236 + D_xyyzzzz* &
      v237 + D_xyz*M_yz + D_xzz*v238 + D_xzzz*v239 + D_xzzzz*v240 + &
      D_xzzzzz*v241 + D_xzzzzzz*v242 + M_xyy*v159 + M_xyyy*v160 + &
      M_xyyyy*v161 + M_xyyyyy*v162 + M_xyyyyz*v163 + M_xyyyz*v164 + &
      M_xyyyzz*v165 + M_xyyz*v166 + M_xyyzz*v167 + M_xyyzzz*v168 + &
      M_xyzz*v144 + M_xyzzz*v145 + M_xyzzzz*v146 + M_xzz*v169 + M_xzzz* &
      v170 + M_xzzzz*v171 + M_xzzzzz*v172 + M_yzz*v203 + M_yzzz*v204 + &
      M_yzzzz*v205 + M_yzzzzz*v206
    L_xz      = D_xxxxxxz*v149 + D_xxxxxyz*v150 + D_xxxxxz*v112 + D_xxxxxzz*v151 + &
      D_xxxxyyz*v152 + D_xxxxyz*v113 + D_xxxxyzz*v153 + D_xxxxz*v92 + &
      D_xxxxzz*v114 + D_xxxxzzz*v154 + D_xxxyyyz*v155 + D_xxxyyz*v115 + &
      D_xxxyyzz*v156 + D_xxxyz*v93 + D_xxxyzz*v116 + D_xxxyzzz*v157 + &
      D_xxxz*v83 + D_xxxzz*v94 + D_xxxzzz*v117 + D_xxxzzzz*v158 + &
      D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyyyz*v196 + &
      D_xyyyyz*v187 + D_xyyyyzz*v229 + D_xyyyz*v182 + D_xyyyzz*v231 + &
      D_xyyyzzz*v232 + D_xyyz*v180 + D_xyyzz*v234 + D_xyyzzz*v235 + &
      D_xyyzzzz*v236 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v238 + D_xzzzz* &
      v239 + D_xzzzzz*v240 + D_xzzzzzz*v241 + M_xyy*v166 + M_xyyy*v164 &
      + M_xyyyy*v163 + M_xyyyz*v173 + M_xyyz*v135 + M_xyyzz*v174 + &
      M_xyzz*v147 + M_xyzzz*v148 + M_xzz*v175 + M_xzzz*v176 + M_xzzzz* &
      v177 + M_yzz*v209 + M_yzzz*v210 + M_yzzzz*v211
    D_yyyyyyy = v75*(v178 + v73 - 315.0d0*v65 + 693.0d0*v70)
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = v179*v77
    L_yyyyyyz = D_yyyyyyz*M_0
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    L_yyyyy   = D_xxyyyyy*v83 + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + D_yyyyy*M_0 + &
      D_yyyyyyy*v180 + D_yyyyyyz*M_yz + D_yyyyyzz*v238
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    L_yyyy    = D_xxxyyyy*v92 + D_xxyyyy*v83 + D_xxyyyyy*v93 + D_xxyyyyz*v94 + D_xyyyyy* &
      M_xy + D_xyyyyyy*v243 + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy* &
      M_0 + D_yyyyyy*v180 + D_yyyyyyy*v182 + D_yyyyyyz*v234 + D_yyyyyz* &
      M_yz + D_yyyyyzz*v244 + D_yyyyzz*v238 + D_yyyyzzz*v239 + M_xzz* &
      v181
    L_yyyyz   = D_xxyyyyz*v83 + D_xyyyyyz*M_xy + D_xyyyyzz*M_xz + D_yyyyyyz*v180 + &
      D_yyyyyzz*M_yz + D_yyyyz*M_0 + D_yyyyzzz*v238
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    L_yyy     = D_xxxxyyy*v112 + D_xxxyyy*v92 + D_xxxyyyy*v113 + D_xxxyyyz*v114 + &
      D_xxyyy*v83 + D_xxyyyy*v93 + D_xxyyyyy*v115 + D_xxyyyyz*v116 + &
      D_xxyyyz*v94 + D_xxyyyzz*v117 + D_xyyyy*M_xy + D_xyyyyy*v243 + &
      D_xyyyyyy*v245 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v180 + D_yyyyyy*v182 + D_yyyyyyy*v187 + D_yyyyyyz*v231 + &
      D_yyyyyz*v234 + D_yyyyyzz*v235 + D_yyyyz*M_yz + D_yyyyzz*v244 + &
      D_yyyyzzz*v246 + D_yyyzz*v238 + D_yyyzzz*v239 + D_yyyzzzz*v240 + &
      M_xyyz*v183 + M_xyzz*v181 + M_xzz*v184 + M_xzzz*v185
    L_yyyz    = D_xxxyyyz*v92 + D_xxyyyyz*v93 + D_xxyyyz*v83 + D_xxyyyzz*v94 + D_xyyyyyz &
      *v243 + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz + &
      D_yyyyyyz*v182 + D_yyyyyz*v180 + D_yyyyyzz*v234 + D_yyyyzz*M_yz + &
      D_yyyyzzz*v244 + D_yyyz*M_0 + D_yyyzzz*v238 + D_yyyzzzz*v239 + &
      M_xzz*v186
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    L_yy      = D_xxxxxyy*v149 + D_xxxxyy*v112 + D_xxxxyyy*v150 + D_xxxxyyz*v151 + &
      D_xxxyy*v92 + D_xxxyyy*v113 + D_xxxyyyy*v152 + D_xxxyyyz*v153 + &
      D_xxxyyz*v114 + D_xxxyyzz*v154 + D_xxyy*v83 + D_xxyyy*v93 + &
      D_xxyyyy*v115 + D_xxyyyyy*v155 + D_xxyyyyz*v156 + D_xxyyyz*v116 + &
      D_xxyyyzz*v157 + D_xxyyz*v94 + D_xxyyzz*v117 + D_xxyyzzz*v158 + &
      D_xyyy*M_xy + D_xyyyy*v243 + D_xyyyyy*v245 + D_xyyyyyy*v247 + &
      D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v180 + D_yyyyy* &
      v182 + D_yyyyyy*v187 + D_yyyyyyy*v196 + D_yyyyyyz*v229 + D_yyyyyz &
      *v231 + D_yyyyyzz*v232 + D_yyyyz*v234 + D_yyyyzz*v235 + D_yyyyzzz &
      *v236 + D_yyyz*M_yz + D_yyyzz*v244 + D_yyyzzz*v246 + D_yyyzzzz* &
      v248 + D_yyzz*v238 + D_yyzzz*v239 + D_yyzzzz*v240 + D_yyzzzzz* &
      v241 + M_xyyyz*v188 + M_xyyz*v189 + M_xyyzz*v190 + M_xyzz*v184 + &
      M_xyzzz*v185 + M_xzz*v191 + M_xzzz*v192 + M_xzzzz*v193
    L_yyz     = D_xxxxyyz*v112 + D_xxxyyyz*v113 + D_xxxyyz*v92 + D_xxxyyzz*v114 + &
      D_xxyyyyz*v115 + D_xxyyyz*v93 + D_xxyyyzz*v116 + D_xxyyz*v83 + &
      D_xxyyzz*v94 + D_xxyyzzz*v117 + D_xyyyyyz*v245 + D_xyyyyz*v243 + &
      D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyz*v187 + &
      D_yyyyyz*v182 + D_yyyyyzz*v231 + D_yyyyz*v180 + D_yyyyzz*v234 + &
      D_yyyyzzz*v235 + D_yyyzz*M_yz + D_yyyzzz*v244 + D_yyyzzzz*v246 + &
      D_yyz*M_0 + D_yyzzz*v238 + D_yyzzzz*v239 + D_yyzzzzz*v240 + &
      M_xyyz*v181 + M_xyzz*v186 + M_xzz*v194 + M_xzzz*v195
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    L_y       = D_xxxxxxy*v212 + D_xxxxxy*v149 + D_xxxxxyy*v213 + D_xxxxxyz*v214 + &
      D_xxxxy*v112 + D_xxxxyy*v150 + D_xxxxyyy*v215 + D_xxxxyyz*v216 + &
      D_xxxxyz*v151 + D_xxxxyzz*v217 + D_xxxy*v92 + D_xxxyy*v113 + &
      D_xxxyyy*v152 + D_xxxyyyy*v218 + D_xxxyyyz*v219 + D_xxxyyz*v153 + &
      D_xxxyyzz*v220 + D_xxxyz*v114 + D_xxxyzz*v154 + D_xxxyzzz*v221 + &
      D_xxy*v83 + D_xxyy*v93 + D_xxyyy*v115 + D_xxyyyy*v155 + D_xxyyyyy &
      *v222 + D_xxyyyyz*v223 + D_xxyyyz*v156 + D_xxyyyzz*v224 + D_xxyyz &
      *v116 + D_xxyyzz*v157 + D_xxyyzzz*v225 + D_xxyz*v94 + D_xxyzz* &
      v117 + D_xxyzzz*v158 + D_xxyzzzz*v226 + D_xyy*M_xy + D_xyyy*v243 &
      + D_xyyyy*v245 + D_xyyyyy*v247 + D_xyyyyyy*v249 + D_xyyz*M_xyz + &
      D_xyz*M_xz + D_y*M_0 + D_yyy*v180 + D_yyyy*v182 + D_yyyyy*v187 + &
      D_yyyyyy*v196 + D_yyyyyyy*v227 + D_yyyyyyz*v228 + D_yyyyyz*v229 + &
      D_yyyyyzz*v230 + D_yyyyz*v231 + D_yyyyzz*v232 + D_yyyyzzz*v233 + &
      D_yyyz*v234 + D_yyyzz*v235 + D_yyyzzz*v236 + D_yyyzzzz*v237 + &
      D_yyz*M_yz + D_yyzz*v244 + D_yyzzz*v246 + D_yyzzzz*v248 + &
      D_yyzzzzz*v250 + D_yzz*v238 + D_yzzz*v239 + D_yzzzz*v240 + &
      D_yzzzzz*v241 + D_yzzzzzz*v242 + M_xyyyyz*v197 + M_xyyyz*v198 + &
      M_xyyyzz*v199 + M_xyyz*v200 + M_xyyzz*v201 + M_xyyzzz*v202 + &
      M_xyzz*v191 + M_xyzzz*v192 + M_xyzzzz*v193 + M_xzz*v203 + M_xzzz* &
      v204 + M_xzzzz*v205 + M_xzzzzz*v206
    L_yz      = D_xxxxxyz*v149 + D_xxxxyyz*v150 + D_xxxxyz*v112 + D_xxxxyzz*v151 + &
      D_xxxyyyz*v152 + D_xxxyyz*v113 + D_xxxyyzz*v153 + D_xxxyz*v92 + &
      D_xxxyzz*v114 + D_xxxyzzz*v154 + D_xxyyyyz*v155 + D_xxyyyz*v115 + &
      D_xxyyyzz*v156 + D_xxyyz*v93 + D_xxyyzz*v116 + D_xxyyzzz*v157 + &
      D_xxyz*v83 + D_xxyzz*v94 + D_xxyzzz*v117 + D_xxyzzzz*v158 + &
      D_xyyyyyz*v247 + D_xyyyyz*v245 + D_xyyyz*v243 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyyyz*v196 + D_yyyyyz*v187 + &
      D_yyyyyzz*v229 + D_yyyyz*v182 + D_yyyyzz*v231 + D_yyyyzzz*v232 + &
      D_yyyz*v180 + D_yyyzz*v234 + D_yyyzzz*v235 + D_yyyzzzz*v236 + &
      D_yyzz*M_yz + D_yyzzz*v244 + D_yyzzzz*v246 + D_yyzzzzz*v248 + &
      D_yz*M_0 + D_yzzz*v238 + D_yzzzz*v239 + D_yzzzzz*v240 + D_yzzzzzz &
      *v241 + M_xyyyz*v207 + M_xyyz*v184 + M_xyyzz*v208 + M_xyzz*v194 + &
      M_xyzzz*v195 + M_xzz*v209 + M_xzzz*v210 + M_xzzzz*v211
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_z       = 0.00833333333333333d0*(30.0d0*D_xyyzzz*M_xyyzz + 10.0d0*D_xyyzzzz* &
      M_xyyzzz + 60.0d0*D_xzzz*M_xzz + D_xzzzzzz*M_xzzzzz + 5.0d0*( &
      D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + 20.0d0*(D_xyyyzz*M_xyyyz &
      + D_xzzzz*M_xzzz)) + D_xxxxxxz*v212 + D_xxxxxyz*v213 + D_xxxxxz* &
      v149 + D_xxxxxzz*v214 + D_xxxxyyz*v215 + D_xxxxyz*v150 + &
      D_xxxxyzz*v216 + D_xxxxz*v112 + D_xxxxzz*v151 + D_xxxxzzz*v217 + &
      D_xxxyyyz*v218 + D_xxxyyz*v152 + D_xxxyyzz*v219 + D_xxxyz*v113 + &
      D_xxxyzz*v153 + D_xxxyzzz*v220 + D_xxxz*v92 + D_xxxzz*v114 + &
      D_xxxzzz*v154 + D_xxxzzzz*v221 + D_xxyyyyz*v222 + D_xxyyyz*v155 + &
      D_xxyyyzz*v223 + D_xxyyz*v115 + D_xxyyzz*v156 + D_xxyyzzz*v224 + &
      D_xxyz*v93 + D_xxyzz*v116 + D_xxyzzz*v157 + D_xxyzzzz*v225 + &
      D_xxz*v83 + D_xxzz*v94 + D_xxzzz*v117 + D_xxzzzz*v158 + D_xxzzzzz &
      *v226 + D_xyyyyyz*v249 + D_xyyyyz*v247 + D_xyyyz*v245 + D_xyyz* &
      v243 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyyyyz*v227 + &
      D_yyyyyz*v196 + D_yyyyyzz*v228 + D_yyyyz*v187 + D_yyyyzz*v229 + &
      D_yyyyzzz*v230 + D_yyyz*v182 + D_yyyzz*v231 + D_yyyzzz*v232 + &
      D_yyyzzzz*v233 + D_yyz*v180 + D_yyzz*v234 + D_yyzzz*v235 + &
      D_yyzzzz*v236 + D_yyzzzzz*v237 + D_yzz*M_yz + D_yzzz*v244 + &
      D_yzzzz*v246 + D_yzzzzz*v248 + D_yzzzzzz*v250 + D_z*M_0 + D_zzz* &
      v238 + D_zzzz*v239 + D_zzzzz*v240 + D_zzzzzz*v241 + D_zzzzzzz* &
      v242 + M_xyyyzz*v202 + M_xyyz*v191 + M_xyzz*v209 + M_xyzzz*v210 + &
      M_xyzzzz*v211
#undef  x                   
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  L_x                 
#undef  M_xx                
#undef  L_y                 
#undef  M_xy                
#undef  L_z                 
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
#undef  M_xxxz              
#undef  L_xxxx              
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
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxz             
#undef  L_xxxxy             
#undef  M_xxxyy             
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
#undef  M_xxxxxx            
#undef  L_yyyyz             
#undef  M_xxxxxy            
#undef  L_xxxxxx            
#undef  M_xxxxxz            
#undef  L_xxxxxy            
#undef  M_xxxxyy            
#undef  L_xxxxxz            
#undef  M_xxxxyz            
#undef  M_xxxyyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  M_xxyyyy            
#undef  L_xxxyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_yyyyyy            
#undef  L_xyyyyz            
#undef  M_yyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  L_xxyyyyz           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
    end subroutine mom_es_M2L
    
! OPS  577*ADD + 2*DIV + 664*MUL + 56*NEG + POW = 1300  (3673 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
                v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46,&
                v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57,&
                v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68,&
                v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8,&
                v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90,&
                v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz,&
                L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz,&
                L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz,&
                L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz,&
                L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz,&
                L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz, L_xxxyyzz,&
                L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz, L_xxyzzzz,&
                L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz, L_xyzzzzz,&
                L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz, L_yyzzzzz,&
                L_yzzzzzz, L_zzzzzzz
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
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define Ls_xxz               Ls(10)
#define L_xyy                L(11)
#define Ls_xyy               Ls(11)
#define Ls_xyz               Ls(12)
#define L_xyz                L(12)
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
#define Ls_xxxxxxx           Ls(48)
#define L_xxxxxxx            L(48)
#define Ls_xxxxxxy           Ls(49)
#define L_xxxxxxy            L(49)
#define Ls_xxxxxxz           Ls(50)
#define L_xxxxxxz            L(50)
#define Ls_xxxxxyy           Ls(51)
#define L_xxxxxyy            L(51)
#define Ls_xxxxxyz           Ls(52)
#define L_xxxxxyz            L(52)
#define L_xxxxyyy            L(53)
#define Ls_xxxxyyy           Ls(53)
#define Ls_xxxxyyz           Ls(54)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define Ls_xxxyyyy           Ls(55)
#define Ls_xxxyyyz           Ls(56)
#define L_xxxyyyz            L(56)
#define Ls_xxyyyyy           Ls(57)
#define L_xxyyyyy            L(57)
#define Ls_xxyyyyz           Ls(58)
#define L_xxyyyyz            L(58)
#define Ls_xyyyyyy           Ls(59)
#define L_xyyyyyy            L(59)
#define L_xyyyyyz            L(60)
#define Ls_xyyyyyz           Ls(60)
#define Ls_yyyyyyy           Ls(61)
#define L_yyyyyyy            L(61)
#define Ls_yyyyyyz           Ls(62)
#define L_yyyyyyz            L(62)
    v0         = L_xxxxxx + L_xxxxxxy*y + L_xxxxxxz*z
    v1         = L_xxxxxy + L_xxxxxyz*z
    v2         = L_xxxxxyy*y + v1
    v3         = L_xxxxyy + L_xxxxyyz*z
    v4         = L_xxxxyyy*y + v3
    v5         = L_xxxyyy + L_xxxyyyz*z
    v6         = L_xxxyyyy*y + v5
    v7         = L_xxyyyy + L_xxyyyyz*z
    v8         = L_xxyyyyy*y + v7
    v9         = L_xyyyyy + L_xyyyyyz*z
    v10        = L_xyyyyyy*y + v9
    v11        = L_yyyyyy + L_yyyyyyz*z
    v12        = L_xxxxxz*z
    v19        = v1*y
    v21        = L_xxxxyz*z
    v24        = v3*y
    v27        = L_xxxxz*z
    v38        = 0.5d0*x
    v44        = L_xxxyyz*z
    v47        = v5*y
    v50        = L_xxxyz*z
    v61        = L_xxxz*z
    v75        = 0.166666666666667d0*x
    v85        = L_xxyyyz*z
    v88        = v7*y
    v91        = L_xxyyz*z
    v102       = L_xxyz*z
    v118       = L_xxz*z
    v134       = 0.0416666666666667d0*x
    v146       = L_xyyyyz*z
    v149       = v9*y
    v152       = L_xyyyz*z
    v163       = L_xyyz*z
    v179       = L_xyz*z
    v211       = 0.00833333333333333d0*y
    v215       = 0.00833333333333333d0*x
    v225       = L_yyyyyz*z
    v228       = L_yyyyz*z
    v230       = 0.5d0*y
    v234       = L_yyyz*z
    v237       = 0.166666666666667d0*y
    v243       = L_yyz*z
    v247       = 0.0416666666666667d0*y
    Ls_xxxxxx  = L_xxxxxxx*x + v0
    Ls_xxxxxy  = L_xxxxxxy*x + v2
    Ls_xxxxyy  = L_xxxxxyy*x + v4
    Ls_xxxyyy  = L_xxxxyyy*x + v6
    Ls_xxyyyy  = L_xxxyyyy*x + v8
    Ls_xyyyyy  = L_xxyyyyy*x + v10
    Ls_yyyyyy  = v11 + L_xyyyyyy*x + L_yyyyyyy*y
    Ls_xxxxxxx = L_xxxxxxx
    Ls_xxxxxxy = L_xxxxxxy
    Ls_xxxxxxz = L_xxxxxxz
    Ls_xxxxxyy = L_xxxxxyy
    Ls_xxxxxyz = L_xxxxxyz
    Ls_xxxxyyy = L_xxxxyyy
    Ls_xxxxyyz = L_xxxxyyz
    Ls_xxxyyyy = L_xxxyyyy
    Ls_xxxyyyz = L_xxxyyyz
    Ls_xxyyyyy = L_xxyyyyy
    Ls_xxyyyyz = L_xxyyyyz
    Ls_xyyyyyy = L_xyyyyyy
    Ls_xyyyyyz = L_xyyyyyz
    Ls_yyyyyyy = L_yyyyyyy
    Ls_yyyyyyz = L_yyyyyyz
    L_zz       = -(L_xx + L_yy)
    L_xzz      = -(L_xxx + L_xyy)
    v217       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v257       = L_yzz*z
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    v137       = L_xxzz*z
    L_xyzz     = -(L_xxxy + L_xyyy)
    v190       = L_xyzz*z
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    v251       = L_yyzz*z
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    v78        = L_xxxzz*z
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    v111       = L_xxyzz*z
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    v172       = L_xyyzz*z
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    v240       = L_yyyzz*z
    L_yyzzz    = -(L_xxyyz + L_yyyyz)
    L_yzzzz    = -(L_xxyzz + L_yyyzz)
    L_zzzzz    = -(L_xxzzz + L_yyzzz)
    L_xxxxzz   = -(L_xxxxxx + L_xxxxyy)
    v40        = L_xxxxzz*z
    L_xxxyzz   = -(L_xxxxxy + L_xxxyyy)
    v57        = L_xxxyzz*z
    L_xxxzzz   = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz   = -(L_xxxxyy + L_xxyyyy)
    v98        = L_xxyyzz*z
    L_xxyzzz   = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz   = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz   = -(L_xxxyyy + L_xyyyyy)
    v159       = L_xyyyzz*z
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    v232       = L_yyyyzz*z
    L_yyyzzz   = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz   = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz   = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz   = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz  = -(L_xxxxxxx + L_xxxxxyy)
    v20        = L_xxxxxz + L_xxxxxyz*y + L_xxxxxzz*z
    Ls_xxxxxz  = L_xxxxxxz*x + v20
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    v25        = L_xxxxyz + L_xxxxyzz*z
    v26        = L_xxxxyyz*y + v25
    v43        = v25*y
    Ls_xxxxyz  = L_xxxxxyz*x + v26
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    v48        = L_xxxyyz + L_xxxyyzz*z
    v49        = L_xxxyyyz*y + v48
    v60        = v48*y
    Ls_xxxyyz  = L_xxxxyyz*x + v49
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    v89        = L_xxyyyz + L_xxyyyzz*z
    v90        = L_xxyyyyz*y + v89
    v101       = v89*y
    Ls_xxyyyz  = L_xxxyyyz*x + v90
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    v150       = L_xyyyyz + L_xyyyyzz*z
    v151       = L_xyyyyyz*y + v150
    v162       = v150*y
    Ls_xyyyyz  = L_xxyyyyz*x + v151
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    v227       = L_yyyyyz + L_yyyyyzz*z
    Ls_yyyyyz  = v227 + L_xyyyyyz*x + L_yyyyyyz*y
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v13        = a2
    v14        = 0.5d0*v13
    v74        = 0.25d0*v13
    v133       = 0.0833333333333333d0*v13
    v214       = 0.0208333333333333d0*v13
    a3         = a1*a2
    v28        = a3
    v29        = 0.166666666666667d0*v28
    v132       = 0.0833333333333333d0*v28
    v213       = 0.0277777777777778d0*v28
    a4         = a2*a2
    v62        = a4
    v63        = 0.0416666666666667d0*v62
    v210       = 0.0208333333333333d0*v62
    a5         = a2*a3
    v119       = 0.00833333333333333d0*a5
    a6         = a3*a3
    v199       = 0.00138888888888889d0*a6
    a7         = a3*a4
    b2         = b1*b1
    v15        = b2
    v16        = L_xxxxxyy*v15
    v22        = L_xxxxyyy*v15
    v35        = 0.5d0*v15
    v41        = L_xxxxyyz*v15
    v45        = L_xxxyyyy*v15
    v58        = L_xxxyyyz*v15
    v76        = 3.0d0*v15
    v86        = L_xxyyyyy*v15
    v99        = L_xxyyyyz*v15
    v147       = L_xyyyyyy*v15
    v160       = L_xyyyyyz*v15
    v209       = 0.0208333333333333d0*v15
    v236       = 0.25d0*v15
    v246       = 0.0833333333333333d0*v15
    b3         = b1*b2
    v30        = b3
    v31        = L_xxxxyyy*v30
    v51        = L_xxxyyyy*v30
    v70        = 0.166666666666667d0*v30
    v79        = L_xxxyyyz*v30
    v92        = L_xxyyyyy*v30
    v112       = L_xxyyyyz*v30
    v135       = 4.0d0*v30
    v153       = L_xyyyyyy*v30
    v173       = L_xyyyyyz*v30
    v208       = 0.0277777777777778d0*v30
    v245       = 0.0833333333333333d0*v30
    b4         = b2*b2
    v64        = b4
    v65        = L_xxxyyyy*v64
    v103       = L_xxyyyyy*v64
    v127       = 0.0416666666666667d0*v64
    v138       = L_xxyyyyz*v64
    v164       = L_xyyyyyy*v64
    v191       = L_xyyyyyz*v64
    v207       = 0.0208333333333333d0*v64
    v216       = 5.0d0*v64
    b5         = b2*b3
    v120       = b5
    v121       = L_xxyyyyy*v120
    v180       = L_xyyyyyy*v120
    v206       = 0.00833333333333333d0*v120
    v218       = L_xyyyyyz*v120
    b6         = b3*b3
    v200       = 0.00138888888888889d0*b6
    b7         = b3*b4
    c2         = c1*c1
    v17        = c2
    v201       = 0.5d0*v17
    v238       = 3.0d0*v17
    v248       = 12.0d0*v17
    v254       = 60.0d0*v17
    v122       = L_xxzz*v17
    v181       = L_xyzz*v17
    v66        = L_xxxzz*v17
    v104       = L_xxyzz*v17
    v139       = L_xxzzz*v17
    v165       = L_xyyzz*v17
    v192       = L_xyzzz*v17
    v32        = L_xxxxzz*v17
    v52        = L_xxxyzz*v17
    v80        = L_xxxzzz*v17
    v93        = L_xxyyzz*v17
    v113       = L_xxyzzz*v17
    v154       = L_xyyyzz*v17
    v174       = L_xyyzzz*v17
    v18        = L_xxxxxzz*v17
    v39        = v16 + v18 + 2.0d0*(L_xxxxx + v12 + v19)
    Ls_xxxxx   = 0.5d0*(v16 + v18) + L_xxxxx + L_xxxxxxx*v14 + v0*x + v12 + v19
    v23        = L_xxxxyzz*v17
    v36        = v23 + 2.0d0*(L_xxxxy + v21)
    v37        = v36*y
    v56        = 2.0d0*v24 + v22 + v36
    Ls_xxxxy   = 0.5d0*(v22 + v23) + L_xxxxxxy*v14 + L_xxxxy + v2*x + v21 + v24
    v42        = L_xxxxzzz*v17
    v84        = v41 + v42 + 2.0d0*(L_xxxxz + v40 + v43)
    Ls_xxxxz   = 0.5d0*(v41 + v42) + L_xxxxxxz*v14 + L_xxxxz + v20*x + v40 + v43
    v46        = L_xxxyyzz*v17
    v54        = v46 + 2.0d0*(L_xxxyy + v44)
    v55        = v54*y
    v71        = v15*v54
    v97        = 2.0d0*v47 + v45 + v54
    Ls_xxxyy   = 0.5d0*(v45 + v46) + L_xxxxxyy*v14 + L_xxxyy + v4*x + v44 + v47
    v59        = L_xxxyzzz*v17
    v82        = v59 + 2.0d0*(L_xxxyz + v57)
    v83        = v82*y
    v117       = 2.0d0*v60 + v58 + v82
    Ls_xxxyz   = 0.5d0*(v58 + v59) + L_xxxxxyz*v14 + L_xxxyz + v26*x + v57 + v60
    v87        = L_xxyyyzz*v17
    v95        = v87 + 2.0d0*(L_xxyyy + v85)
    v96        = v95*y
    v107       = v15*v95
    v128       = v30*v95
    v158       = 2.0d0*v88 + v86 + v95
    Ls_xxyyy   = 0.5d0*(v86 + v87) + L_xxxxyyy*v14 + L_xxyyy + v6*x + v85 + v88
    v100       = L_xxyyzzz*v17
    v115       = v100 + 2.0d0*(L_xxyyz + v98)
    v116       = v115*y
    v142       = v115*v15
    v178       = 2.0d0*v101 + v115 + v99
    Ls_xxyyz   = 0.5d0*(v100 + v99) + L_xxxxyyz*v14 + L_xxyyz + v101 + v49*x + v98
    v148       = L_xyyyyzz*v17
    v156       = v148 + 2.0d0*(L_xyyyy + v146)
    v157       = v156*y
    v168       = v15*v156
    v185       = v156*v30
    Ls_xyyyy   = 0.5d0*(v147 + v148) + L_xxxyyyy*v14 + L_xyyyy + v146 + v149 + v8*x
    v161       = L_xyyyzzz*v17
    v176       = v161 + 2.0d0*(L_xyyyz + v159)
    v177       = v176*y
    v195       = v15*v176
    v220       = v176*v30
    Ls_xyyyz   = 0.5d0*(v160 + v161) + L_xxxyyyz*v14 + L_xyyyz + v159 + v162 + v90*x
    v226       = L_yyyyyzz*v17
    v231       = v226 + 2.0d0*(L_yyyyy + v225)
    Ls_yyyyy   = 0.5d0*v226 + L_xxyyyyy*v14 + L_yyyyy + L_yyyyyyy*v35 + v10*x + v11*y + &
      v225
    v233       = L_yyyyzzz*v17
    v242       = v233 + 2.0d0*(L_yyyyz + v232)
    Ls_yyyyz   = 0.5d0*v233 + L_xxyyyyz*v14 + L_yyyyyyz*v35 + L_yyyyz + v151*x + v227*y + &
      v232
    h          = v13 + v15 + v17
    u2         = 1.0/h
    u          = sqrt(u2)
    u3         = u*u2
    u4         = u2*u2
    u5         = u2*u3
    u6         = u3*u3
    u7         = u3*u4
    u8         = u4*u4
    u9         = u4*u5
    u10        = u5*u5
    u11        = u5*u6
    u12        = u6*u6
    u13        = u6*u7
    u14        = u7*u7
    u15        = u7*u8
    c3         = c1*c2
    v33        = c3
    v202       = 0.166666666666667d0*v33
    v249       = 4.0d0*v33
    v255       = 20.0d0*v33
    v123       = L_xxzzz*v33
    v182       = L_xyzzz*v33
    v67        = L_xxxzzz*v33
    v105       = L_xxyzzz*v33
    v140       = L_xxzzzz*v33
    v166       = L_xyyzzz*v33
    v193       = L_xyzzzz*v33
    v34        = L_xxxxzzz*v33
    v77        = v31 + v34 + v3*v76 + 6.0d0*(L_xxxx + v27) + 3.0d0*(v32 + v37)
    Ls_xxxx    = 0.166666666666667d0*(v31 + v34 + 3.0d0*(v32 + v37)) + L_xxxx + L_xxxxxxx &
      *v29 + v0*v14 + v27 + v3*v35 + v38*v39
    v53        = L_xxxyzzz*v33
    v72        = v53 + 3.0d0*(2.0d0*L_xxxy + 2.0d0*v50 + v52)
    v73        = v72*y
    v110       = v51 + v72 + v5*v76 + 3.0d0*v55
    Ls_xxxy    = 0.166666666666667d0*(v51 + v53 + 3.0d0*(v52 + v55)) + L_xxxxxxy*v29 + &
      L_xxxy + v14*v2 + v35*v5 + v38*v56 + v50
    v81        = L_xxxzzzz*v33
    v145       = v79 + v81 + v48*v76 + 6.0d0*(L_xxxz + v78) + 3.0d0*(v80 + v83)
    Ls_xxxz    = 0.166666666666667d0*(v79 + v81 + 3.0d0*(v80 + v83)) + L_xxxxxxz*v29 + &
      L_xxxz + v14*v20 + v35*v48 + v38*v84 + v78
    v94        = L_xxyyzzz*v33
    v108       = v94 + 3.0d0*(2.0d0*L_xxyy + 2.0d0*v91 + v93)
    v109       = v108*y
    v129       = v108*v15
    v171       = v108 + v92 + v7*v76 + 3.0d0*v96
    Ls_xxyy    = 0.166666666666667d0*(v92 + v94 + 3.0d0*(v93 + v96)) + L_xxxxxyy*v29 + &
      L_xxyy + v14*v4 + v35*v7 + v38*v97 + v91
    v114       = L_xxyzzzz*v33
    v143       = v114 + 3.0d0*(2.0d0*L_xxyz + 2.0d0*v111 + v113)
    v144       = v143*y
    v198       = v112 + v143 + 3.0d0*v116 + v76*v89
    Ls_xxyz    = 0.166666666666667d0*(v112 + v114 + 3.0d0*(v113 + v116)) + L_xxxxxyz*v29 &
      + L_xxyz + v111 + v117*v38 + v14*v26 + v35*v89
    v155       = L_xyyyzzz*v33
    v169       = v155 + 3.0d0*(2.0d0*L_xyyy + 2.0d0*v152 + v154)
    v170       = v169*y
    v186       = v15*v169
    Ls_xyyy    = 0.166666666666667d0*(v153 + v155 + 3.0d0*(v154 + v157)) + L_xxxxyyy*v29 &
      + L_xyyy + v14*v6 + v152 + v158*v38 + v35*v9
    v175       = L_xyyzzzz*v33
    v196       = v175 + 3.0d0*(2.0d0*L_xyyz + 2.0d0*v172 + v174)
    v197       = v196*y
    v221       = v15*v196
    Ls_xyyz    = 0.166666666666667d0*(v173 + v175 + 3.0d0*(v174 + v177)) + L_xxxxyyz*v29 &
      + L_xyyz + v14*v49 + v150*v35 + v172 + v178*v38
    v229       = L_yyyyzzz*v33
    v239       = v229 + L_yyyyzz*v238 + 6.0d0*(L_yyyy + v228)
    Ls_yyyy    = 0.166666666666667d0*v229 + L_xxxyyyy*v29 + L_yyyy + L_yyyyyyy*v70 + &
      L_yyyyzz*v201 + v11*v35 + v14*v8 + v228 + v230*v231 + v38*(v147 + &
      2.0d0*v149 + v156)
    v241       = L_yyyzzzz*v33
    v253       = v241 + L_yyyzzz*v238 + 6.0d0*(L_yyyz + v240)
    Ls_yyyz    = 0.166666666666667d0*v241 + L_xxxyyyz*v29 + L_yyyyyyz*v70 + L_yyyz + &
      L_yyyzzz*v201 + v14*v90 + v227*v35 + v230*v242 + v240 + v38*(v160 &
      + 2.0d0*v162 + v176)
    c4         = c2*c2
    v68        = c4
    v203       = 0.0416666666666667d0*v68
    v256       = 5.0d0*v68
    v124       = L_xxzzzz*v68
    v183       = L_xyzzzz*v68
    v69        = L_xxxzzzz*v68
    v136       = v65 + v69 + v135*v5 + 12.0d0*v66 + 6.0d0*v71 + 24.0d0*(L_xxx + v61) + &
      4.0d0*(v67 + v73)
    Ls_xxx     = 0.0416666666666667d0*(v65 + 12.0d0*v66 + v69 + 6.0d0*v71 + 4.0d0*(v67 + &
      v73)) + L_xxx + L_xxxxxxx*v63 + v0*v29 + v39*v74 + v5*v70 + v61 + &
      v75*v77
    v106       = L_xxyzzzz*v68
    v130       = v106 + 12.0d0*v104 + 4.0d0*(6.0d0*L_xxy + 6.0d0*v102 + v105)
    v131       = v130*y
    v189       = v103 + v130 + 6.0d0*v107 + 4.0d0*v109 + v135*v7
    Ls_xxy     = 0.0416666666666667d0*(v103 + 12.0d0*v104 + v106 + 6.0d0*v107 + 4.0d0*( &
      v105 + v109)) + L_xxxxxxy*v63 + L_xxy + v102 + v110*v75 + v2*v29 &
      + v56*v74 + v7*v70
    v141       = L_xxzzzzz*v68
    v224       = v138 + v141 + v135*v89 + 12.0d0*v139 + 6.0d0*v142 + 24.0d0*(L_xxz + v137 &
      ) + 4.0d0*(v140 + v144)
    Ls_xxz     = 0.0416666666666667d0*(v138 + 12.0d0*v139 + v141 + 6.0d0*v142 + 4.0d0*( &
      v140 + v144)) + L_xxxxxxz*v63 + L_xxz + v137 + v145*v75 + v20*v29 &
      + v70*v89 + v74*v84
    v167       = L_xyyzzzz*v68
    v187       = v167 + 12.0d0*v165 + 4.0d0*(6.0d0*L_xyy + 6.0d0*v163 + v166)
    v188       = v187*y
    Ls_xyy     = 0.0416666666666667d0*(v164 + 12.0d0*v165 + v167 + 6.0d0*v168 + 4.0d0*( &
      v166 + v170)) + L_xxxxxyy*v63 + L_xyy + v163 + v171*v75 + v29*v4 &
      + v70*v9 + v74*v97
    v194       = L_xyzzzzz*v68
    v222       = v194 + 12.0d0*v192 + 4.0d0*(6.0d0*L_xyz + 6.0d0*v190 + v193)
    v223       = v222*y
    Ls_xyz     = 0.0416666666666667d0*(v191 + 12.0d0*v192 + v194 + 6.0d0*v195 + 4.0d0*( &
      v193 + v197)) + L_xxxxxyz*v63 + L_xyz + v117*v74 + v150*v70 + &
      v190 + v198*v75 + v26*v29
    v235       = L_yyyzzzz*v68
    v250       = v235 + L_yyyzz*v248 + L_yyyzzz*v249 + 24.0d0*(L_yyy + v234)
    Ls_yyy     = 0.0416666666666667d0*v235 + L_xxxxyyy*v63 + L_yyy + L_yyyyyyy*v127 + &
      L_yyyzz*v201 + L_yyyzzz*v202 + v11*v70 + v158*v74 + v231*v236 + &
      v234 + v237*v239 + v29*v6 + v75*(v153 + 3.0d0*v157 + v169 + v76* &
      v9)
    v252       = L_yyzzzzz*v68
    v259       = v252 + L_yyzzz*v248 + L_yyzzzz*v249 + 24.0d0*(L_yyz + v251)
    Ls_yyz     = 0.0416666666666667d0*v252 + L_xxxxyyz*v63 + L_yyyyyyz*v127 + L_yyz + &
      L_yyzzz*v201 + L_yyzzzz*v202 + v178*v74 + v227*v70 + v236*v242 + &
      v237*v253 + v251 + v29*v49 + v75*(v150*v76 + v173 + 3.0d0*v177 + &
      v196)
    c5         = c2*c3
    v125       = c5
    v204       = 0.00833333333333333d0*v125
    v126       = L_xxzzzzz*v125
    Ls_xx      = 0.00833333333333333d0*(v121 + 60.0d0*v122 + 20.0d0*v123 + v126 + 5.0d0*( &
      v124 + v131) + 10.0d0*(v128 + v129)) + L_xx + L_xxxxxxx*v119 + v0 &
      *v63 + v118 + v127*v7 + v132*v39 + v133*v77 + v134*v136
    v184       = L_xyzzzzz*v125
    v212       = v184 + 60.0d0*v181 + 20.0d0*v182 + 5.0d0*(24.0d0*L_xy + 24.0d0*v179 + &
      v183)
    Ls_xy      = 0.00833333333333333d0*(v180 + 60.0d0*v181 + 20.0d0*v182 + v184 + 5.0d0*( &
      v183 + v188) + 10.0d0*(v185 + v186)) + L_xxxxxxy*v119 + L_xy + &
      v110*v133 + v127*v9 + v132*v56 + v134*v189 + v179 + v2*v63
    v219       = L_xzzzzzz*v125
    Ls_xz      = 0.00833333333333333d0*(v218 + v219 + 5.0d0*v223 + 10.0d0*(v220 + v221)) &
      + L_xxxxxxz*v119 + L_xz + L_xzzz*v201 + L_xzzzz*v202 + L_xzzzzz* &
      v203 + v127*v150 + v132*v84 + v133*v145 + v134*v224 + v20*v63 + &
      v217
    v244       = L_yyzzzzz*v125
    Ls_yy      = 0.00833333333333333d0*v244 + L_xxxxxyy*v119 + L_yy + L_yyyyyyy*v206 + &
      L_yyzz*v201 + L_yyzzz*v202 + L_yyzzzz*v203 + v11*v127 + v132*v97 &
      + v133*v171 + v134*(v135*v9 + v164 + 6.0d0*v168 + 4.0d0*v170 + &
      v187) + v231*v245 + v239*v246 + v243 + v247*v250 + v4*v63
    v258       = L_yzzzzzz*v125
    Ls_yz      = 0.00833333333333333d0*v258 + L_xxxxxyz*v119 + L_yyyyyyz*v206 + L_yz + &
      L_yzzz*v201 + L_yzzzz*v202 + L_yzzzzz*v203 + v117*v132 + v127* &
      v227 + v133*v198 + v134*(v135*v150 + v191 + 6.0d0*v195 + 4.0d0* &
      v197 + v222) + v242*v245 + v246*v253 + v247*v259 + v257 + v26*v63
    c6         = c3*c3
    v205       = 0.00138888888888889d0*c6
    Ls_x       = L_x + L_xxxxxxx*v199 + L_xyyyyyy*v200 + L_xz*z + L_xzz*v201 + L_xzzz* &
      v202 + L_xzzzz*v203 + L_xzzzzz*v204 + L_xzzzzzz*v205 + v0*v119 + &
      v136*v214 + v156*v207 + v169*v208 + v187*v209 + v206*v9 + v210* &
      v39 + v211*v212 + v213*v77 + v215*(120.0d0*L_xx + 120.0d0*v118 + &
      v121 + 60.0d0*v122 + 20.0d0*v123 + 5.0d0*v124 + v126 + 10.0d0* &
      v128 + 10.0d0*v129 + 5.0d0*v131 + v216*v7)
    Ls_y       = L_y + L_xxxxxxy*v199 + L_yyyyyyy*v200 + L_yz*z + L_yzz*v201 + L_yzzz* &
      v202 + L_yzzzz*v203 + L_yzzzzz*v204 + L_yzzzzzz*v205 + v11*v206 + &
      v110*v213 + v119*v2 + v189*v214 + v207*v231 + v208*v239 + v209* &
      v250 + v210*v56 + v211*(120.0d0*L_yy + L_yyzz*v254 + L_yyzzz*v255 &
      + L_yyzzzz*v256 + 120.0d0*v243 + v244) + v215*(v180 + 10.0d0*v185 &
      + 10.0d0*v186 + 5.0d0*v188 + v212 + v216*v9)
    Ls_z       = L_z + L_xxxxxxz*v199 + L_yyyyyyz*v200 + L_zz*z + L_zzz*v201 + L_zzzz* &
      v202 + L_zzzzz*v203 + L_zzzzzz*v204 + L_zzzzzzz*v205 + v119*v20 + &
      v145*v213 + v206*v227 + v207*v242 + v208*v253 + v209*v259 + v210* &
      v84 + v211*(120.0d0*L_yz + L_yzzz*v254 + L_yzzzz*v255 + L_yzzzzz* &
      v256 + 120.0d0*v257 + v258) + v214*v224 + v215*(120.0d0*L_xz + &
      L_xzzz*v254 + L_xzzzz*v255 + L_xzzzzz*v256 + v150*v216 + 120.0d0* &
      v217 + v218 + v219 + 10.0d0*v220 + 10.0d0*v221 + 5.0d0*v223)
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
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
#undef  L_xyy               
#undef  Ls_xyy              
#undef  Ls_xyz              
#undef  L_xyz               
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
#undef  Ls_xxxxxxx          
#undef  L_xxxxxxx           
#undef  Ls_xxxxxxy          
#undef  L_xxxxxxy           
#undef  Ls_xxxxxxz          
#undef  L_xxxxxxz           
#undef  Ls_xxxxxyy          
#undef  L_xxxxxyy           
#undef  Ls_xxxxxyz          
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  Ls_xxxxyyy          
#undef  Ls_xxxxyyz          
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  Ls_xxxyyyy          
#undef  Ls_xxxyyyz          
#undef  L_xxxyyyz           
#undef  Ls_xxyyyyy          
#undef  L_xxyyyyy           
#undef  Ls_xxyyyyz          
#undef  L_xxyyyyz           
#undef  Ls_xyyyyyy          
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  Ls_xyyyyyz          
#undef  Ls_yyyyyyy          
#undef  L_yyyyyyy           
#undef  Ls_yyyyyyz          
#undef  L_yyyyyyz           
    end subroutine mom_es_L2L
    
! OPS  216*ADD + 2*DIV + 313*MUL + 56*NEG + POW = 588  (1042 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15,&
                v16, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz,&
                L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz,&
                L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz,&
                L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz,&
                L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define Phi_x                Phi(0)
#define x                    r(1)
#define Phi_y                Phi(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Phi_z                Phi(2)
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
#define L_xxxxxxx            L(48)
#define L_xxxxxxy            L(49)
#define L_xxxxxxz            L(50)
#define L_xxxxxyy            L(51)
#define L_xxxxxyz            L(52)
#define L_xxxxyyy            L(53)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define L_xxxyyyz            L(56)
#define L_xxyyyyy            L(57)
#define L_xxyyyyz            L(58)
#define L_xyyyyyy            L(59)
#define L_xyyyyyz            L(60)
#define L_yyyyyyy            L(61)
#define L_yyyyyyz            L(62)
    v13       = L_xyyyyy + L_xyyyyyz*z
    v17       = 2.0d0*z
    v21       = 6.0d0*z
    v26       = 24.0d0*z
    v31       = 2.0d0*y
    v32       = L_xxxxxy + L_xxxxxyz*z
    v33       = 0.00833333333333333d0*y
    v34       = 120.0d0*z
    v41       = L_xxxxyy + L_xxxxyyz*z
    v42       = 3.0d0*y
    v47       = L_xxxyyy + L_xxxyyyz*z
    v50       = 4.0d0*y
    v52       = 0.00833333333333333d0*x
    v54       = L_xxyyyy + L_xxyyyyz*z
    v59       = 5.0d0*y
    L_zz      = -(L_xx + L_yy)
    L_xzz     = -(L_xxx + L_xyy)
    L_yzz     = -(L_xxy + L_yyy)
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    L_xyzz    = -(L_xxxy + L_xyyy)
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    L_yyzzz   = -(L_xxyyz + L_yyyyz)
    L_yzzzz   = -(L_xxyzz + L_yyyzz)
    L_zzzzz   = -(L_xxzzz + L_yyzzz)
    L_xxxxzz  = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz = -(L_xxxxxxx + L_xxxxxyy)
    L_xxxxyzz = -(L_xxxxxxy + L_xxxxyyy)
    L_xxxxzzz = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz = -(L_xxxxxyy + L_xxxyyyy)
    L_xxxyzzz = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz = -(L_xxxxyyy + L_xxyyyyy)
    L_xxyyzzz = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz = -(L_xxzzzzz + L_yyzzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v44       = a2
    v45       = 0.0208333333333333d0*v44
    a3        = a1*a2
    v39       = 0.0277777777777778d0*a3
    a4        = a2*a2
    v30       = 0.0208333333333333d0*a4
    a5        = a2*a3
    v14       = 0.00833333333333333d0*a5
    a6        = a3*a3
    v0        = 0.00138888888888889d0*a6
    a7        = a3*a4
    b2        = b1*b1
    v24       = b2
    v25       = 0.0208333333333333d0*v24
    v40       = 3.0d0*v24
    v48       = 6.0d0*v24
    v57       = 10.0d0*v24
    b3        = b1*b2
    v19       = b3
    v20       = 0.0277777777777778d0*v19
    v46       = 4.0d0*v19
    v55       = 10.0d0*v19
    b4        = b2*b2
    v15       = b4
    v16       = 0.0208333333333333d0*v15
    v53       = 5.0d0*v15
    b5        = b2*b3
    v11       = b5
    v12       = 0.00833333333333333d0*v11
    b6        = b3*b3
    v1        = 0.00138888888888889d0*b6
    b7        = b3*b4
    c2        = c1*c1
    v2        = c2
    v3        = 0.5d0*v2
    v22       = 3.0d0*v2
    v27       = 12.0d0*v2
    v35       = 60.0d0*v2
    v43       = 2.0d0*L_xxxxy + L_xxxxyz*v17 + L_xxxxyzz*v2
    v49       = 2.0d0*L_xxxyy + L_xxxyyz*v17 + L_xxxyyzz*v2
    v56       = 2.0d0*L_xxyyy + L_xxyyyz*v17 + L_xxyyyzz*v2
    v18       = 2.0d0*L_xyyyy + L_xyyyyz*v17 + L_xyyyyzz*v2
    h         = v2 + v24 + v44
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
    u14       = u7*u7
    u15       = u7*u8
    c3        = c1*c2
    v4        = c3
    v5        = 0.166666666666667d0*v4
    v28       = 4.0d0*v4
    v36       = 20.0d0*v4
    v51       = 6.0d0*L_xxxy + L_xxxyz*v21 + L_xxxyzz*v22 + L_xxxyzzz*v4
    v58       = 6.0d0*L_xxyy + L_xxyyz*v21 + L_xxyyzz*v22 + L_xxyyzzz*v4
    v23       = 6.0d0*L_xyyy + L_xyyyz*v21 + L_xyyyzz*v22 + L_xyyyzzz*v4
    c4        = c2*c2
    v6        = c4
    v7        = 0.0416666666666667d0*v6
    v37       = 5.0d0*v6
    v60       = 24.0d0*L_xxy + L_xxyz*v26 + L_xxyzz*v27 + L_xxyzzz*v28 + L_xxyzzzz*v6
    v29       = 24.0d0*L_xyy + L_xyyz*v26 + L_xyyzz*v27 + L_xyyzzz*v28 + L_xyyzzzz*v6
    c5        = c2*c3
    v8        = c5
    v9        = 0.00833333333333333d0*v8
    v38       = 120.0d0*L_xy + L_xyz*v34 + L_xyzz*v35 + L_xyzzz*v36 + L_xyzzzz*v37 + &
      L_xyzzzzz*v8
    c6        = c3*c3
    v10       = 0.00138888888888889d0*c6
    Phi_x     = L_x + L_xxxxxxx*v0 + L_xyyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v9 + L_xzzzzzz*v10 + v12*v13 + v14*( &
      L_xxxxxx + L_xxxxxxy*y + L_xxxxxxz*z) + v16*v18 + v20*v23 + v25* &
      v29 + v30*(2.0d0*L_xxxxx + L_xxxxxyy*v24 + L_xxxxxz*v17 + &
      L_xxxxxzz*v2 + v31*v32) + v33*v38 + v39*(6.0d0*L_xxxx + L_xxxxyyy &
      *v19 + L_xxxxz*v21 + L_xxxxzz*v22 + L_xxxxzzz*v4 + v40*v41 + v42* &
      v43) + v45*(24.0d0*L_xxx + L_xxxyyyy*v15 + L_xxxz*v26 + L_xxxzz* &
      v27 + L_xxxzzz*v28 + L_xxxzzzz*v6 + v46*v47 + v48*v49 + v50*v51) &
      + v52*(120.0d0*L_xx + L_xxyyyyy*v11 + L_xxz*v34 + L_xxzz*v35 + &
      L_xxzzz*v36 + L_xxzzzz*v37 + L_xxzzzzz*v8 + v53*v54 + v55*v56 + &
      v57*v58 + v59*v60)
    Phi_y     = L_y + L_xxxxxxy*v0 + L_yyyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v9 + L_yzzzzzz*v10 + v12*(L_yyyyyy + &
      L_yyyyyyz*z) + v14*(L_xxxxxyy*y + v32) + v16*(2.0d0*L_yyyyy + &
      L_yyyyyz*v17 + L_yyyyyzz*v2) + v20*(6.0d0*L_yyyy + L_yyyyz*v21 + &
      L_yyyyzz*v22 + L_yyyyzzz*v4) + v25*(24.0d0*L_yyy + L_yyyz*v26 + &
      L_yyyzz*v27 + L_yyyzzz*v28 + L_yyyzzzz*v6) + v30*(L_xxxxyyy*v24 + &
      v31*v41 + v43) + v33*(120.0d0*L_yy + L_yyz*v34 + L_yyzz*v35 + &
      L_yyzzz*v36 + L_yyzzzz*v37 + L_yyzzzzz*v8) + v39*(L_xxxyyyy*v19 + &
      v40*v47 + v42*v49 + v51) + v45*(L_xxyyyyy*v15 + v46*v54 + v48*v56 &
      + v50*v58 + v60) + v52*(L_xyyyyyy*v11 + v13*v53 + v18*v55 + v23* &
      v57 + v29*v59 + v38)
    Phi_z     = L_z + L_xxxxxxz*v0 + L_yyyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v9 + L_zzzzzzz*v10 + v12*(L_yyyyyz + &
      L_yyyyyzz*z) + v14*(L_xxxxxyz*y + L_xxxxxz + L_xxxxxzz*z) + v16*( &
      2.0d0*L_yyyyz + L_yyyyzz*v17 + L_yyyyzzz*v2) + v20*(6.0d0*L_yyyz &
      + L_yyyzz*v21 + L_yyyzzz*v22 + L_yyyzzzz*v4) + v25*(24.0d0*L_yyz &
      + L_yyzz*v26 + L_yyzzz*v27 + L_yyzzzz*v28 + L_yyzzzzz*v6) + v30*( &
      L_xxxxyyz*v24 + 2.0d0*L_xxxxz + L_xxxxzz*v17 + L_xxxxzzz*v2 + v31 &
      *(L_xxxxyz + L_xxxxyzz*z)) + v33*(120.0d0*L_yz + L_yzz*v34 + &
      L_yzzz*v35 + L_yzzzz*v36 + L_yzzzzz*v37 + L_yzzzzzz*v8) + v39*( &
      L_xxxyyyz*v19 + 6.0d0*L_xxxz + L_xxxzz*v21 + L_xxxzzz*v22 + &
      L_xxxzzzz*v4 + v40*(L_xxxyyz + L_xxxyyzz*z) + v42*(2.0d0*L_xxxyz &
      + L_xxxyzz*v17 + L_xxxyzzz*v2)) + v45*(L_xxyyyyz*v15 + 24.0d0* &
      L_xxz + L_xxzz*v26 + L_xxzzz*v27 + L_xxzzzz*v28 + L_xxzzzzz*v6 + &
      v46*(L_xxyyyz + L_xxyyyzz*z) + v48*(2.0d0*L_xxyyz + L_xxyyzz*v17 &
      + L_xxyyzzz*v2) + v50*(6.0d0*L_xxyz + L_xxyzz*v21 + L_xxyzzz*v22 &
      + L_xxyzzzz*v4)) + v52*(L_xyyyyyz*v11 + 120.0d0*L_xz + L_xzz*v34 &
      + L_xzzz*v35 + L_xzzzz*v36 + L_xzzzzz*v37 + L_xzzzzzz*v8 + v53*( &
      L_xyyyyz + L_xyyyyzz*z) + v55*(2.0d0*L_xyyyz + L_xyyyzz*v17 + &
      L_xyyyzzz*v2) + v57*(6.0d0*L_xyyz + L_xyyzz*v21 + L_xyyzzz*v22 + &
      L_xyyzzzz*v4) + v59*(24.0d0*L_xyz + L_xyzz*v26 + L_xyzzz*v27 + &
      L_xyzzzz*v28 + L_xyzzzzz*v6))
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_x               
#undef  x                   
#undef  Phi_y               
#undef  L_y                 
#undef  L_z                 
#undef  Phi_z               
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
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  L_xxyyyyz           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
    end subroutine mom_es_L2P
    
! OPS  960*ADD + 1117*MUL + 76*NEG + 219*SUB = 2372  (4252 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v291, v292, v293, v294,&
                v295, v296, v297, v298, v299, v3, v30, v300, v301, v302, v303,&
                v304, v305, v306, v307, v308, v309, v31, v310, v311, v312,&
                v313, v314, v315, v316, v317, v318, v319, v32, v320, v321,&
                v322, v323, v324, v325, v326, v327, v328, v329, v33, v330,&
                v331, v332, v333, v334, v335, v336, v337, v338, v339, v34,&
                v340, v341, v342, v343, v344, v345, v346, v347, v348, v349,&
                v35, v350, v351, v352, v353, v354, v355, v356, v357, v358,&
                v359, v36, v360, v361, v362, v363, v364, v365, v366, v367,&
                v368, v369, v37, v370, v371, v372, v373, v374, v375, v376,&
                v377, v378, v379, v38, v380, v381, v382, v383, v384, v385,&
                v386, v387, v388, v389, v39, v390, v391, v392, v393, v394,&
                v395, v396, v397, v398, v399, v4, v40, v400, v401, v402, v403,&
                v404, v405, v406, v407, v408, v409, v41, v410, v411, v412,&
                v413, v414, v415, v416, v417, v418, v419, v42, v420, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h,&
                u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz,&
                M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz,&
                M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz,&
                M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz,&
                M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz,&
                M_yzzzzz, M_zzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz,&
                S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz,&
                S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy,&
                S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy,&
                S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz,&
                S_xxxyy, S_xxxyz, S_xxyyy, S_xxyyz, S_xyyyy, S_xyyyz, S_yyyyy,&
                S_yyyyz, S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz,&
                S_xxxyyy, S_xxxyyz, S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz,&
                S_yyyyyy, S_yyyyyz
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
#define Ms_xxxxxx            Ms(33)
#define M_xxxxxx             M(33)
#define Ms_xxxxxy            Ms(34)
#define M_xxxxxy             M(34)
#define Ms_xxxxxz            Ms(35)
#define M_xxxxxz             M(35)
#define Ms_xxxxyy            Ms(36)
#define M_xxxxyy             M(36)
#define Ms_xxxxyz            Ms(37)
#define M_xxxxyz             M(37)
#define M_xxxyyy             M(38)
#define Ms_xxxyyy            Ms(38)
#define Ms_xxxyyz            Ms(39)
#define M_xxxyyz             M(39)
#define Ms_xxyyyy            Ms(40)
#define M_xxyyyy             M(40)
#define M_xxyyyz             M(41)
#define Ms_xxyyyz            Ms(41)
#define Ms_xyyyyy            Ms(42)
#define M_xyyyyy             M(42)
#define Ms_xyyyyz            Ms(43)
#define M_xyyyyz             M(43)
#define Ms_yyyyyy            Ms(44)
#define M_yyyyyy             M(44)
#define M_yyyyyz             M(45)
#define Ms_yyyyyz            Ms(45)
    v1        = x*y
    v2        = x*z
    v3        = y*z
    v4        = v1*z
    v12       = M_xx*x
    v13       = M_xy*y
    v14       = M_xz*z
    v17       = M_xy*x
    v18       = M_yy*y
    v19       = M_yz*z
    v20       = M_xx*z
    v21       = M_xz*x
    v22       = M_yy*z
    v23       = M_yz*y
    v34       = M_xxx*x
    v35       = 1.71428571428571d0*y
    v36       = M_xxy*v35
    v37       = M_xxz*z
    v43       = 0.857142857142857d0*M_xyz
    v46       = M_xxy*x
    v49       = M_xyy*y
    v51       = 3.0d0*M_xx
    v52       = M_xxx*z
    v53       = M_xxz*x
    v55       = M_xyy*z
    v56       = 3.0d0*M_xz
    v62       = 1.71428571428571d0*x
    v63       = M_xyy*v62
    v64       = M_yyy*y
    v65       = M_yyz*z
    v68       = M_xxy*z
    v71       = M_yyy*z
    v72       = M_yyz*y
    v78       = 3.0d0*M_yz
    v84       = M_xxxx*x
    v85       = M_xxxy*y
    v86       = M_xxxz*z
    v88       = M_xxyy*x
    v98       = M_yyyy*x
    v109      = M_xxxx*y
    v110      = M_xxxy*x
    v113      = M_xxyy*y
    v114      = M_xxyz*z
    v125      = M_yyyy*y
    v129      = M_xxyy*z
    v138      = M_xxxx*z
    v139      = M_xxxz*x
    v141      = M_xxyz*y
    v150      = M_yyyy*z
    v158      = M_xyyy*y
    v159      = M_xyyz*z
    v164      = M_xxxy*z
    v166      = M_xxyz*x
    v170      = M_xyyy*z
    v171      = M_xyyz*y
    v172      = 3.0d0*M_xyz
    v178      = M_xyyy*x
    v179      = M_yyyz*z
    v180      = M_xyyz*x
    v181      = M_yyyz*y
    v187      = M_xxyyz*z
    v189      = 0.12987012987013d0*z
    v202      = M_xxxxx*x
    v203      = M_xxxxy*y
    v204      = M_xxxxz*z
    v206      = M_xxxyy*x
    v213      = M_xxyyy*y
    v222      = M_xyyyy*x
    v234      = M_yyyyy*y
    v261      = M_xxxxx*y
    v262      = M_xxxxy*x
    v265      = M_xxxyy*y
    v266      = 1.81818181818182d0*M_xxxyz
    v269      = M_xxyyy*x
    v277      = M_xyyyy*y
    v286      = M_yyyyy*x
    v294      = M_xxxxx*z
    v295      = M_xxxxz*x
    v297      = M_xxxyy*z
    v298      = v266*y
    v305      = M_xxyyz*x
    v314      = M_xyyyy*z
    v318      = 5.45454545454545d0*M_xyz
    v330      = M_yyyyz*x
    v351      = 0.025974025974026d0*z
    v365      = M_xxxxy*z
    v366      = M_xxxxz*y
    v368      = M_xxxyz*x
    v373      = M_xxyyy*z
    v374      = M_xxyyz*y
    v390      = M_yyyyy*z
    v391      = M_yyyyz*y
    v400      = 0.545454545454545d0*z
    v406      = M_xyyyz*y
    v410      = M_yyyyz*z
    v412      = 1.81818181818182d0*M_xyyyz
    v413      = v412*x
    Ms_0      = Ms_0 + (M_0)
    M_zz      = -(M_xx + M_yy)
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    M_xxzz    = -(M_xxxx + M_xxyy)
    v90       = M_xxzz*x
    v103      = M_xxzz*y
    v130      = M_xxzz*z
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v99       = M_yyzz*x
    v104      = M_yyzz*y
    v133      = M_yyzz*z
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    v208      = M_xxxzz*x
    v243      = M_xxxzz*y
    v301      = M_xxxzz*z
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    v215      = M_xxyzz*y
    v246      = M_xxyzz*x
    v352      = M_xxyzz*z
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    v309      = M_xxzzz*x
    v354      = M_xxzzz*y
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    v416      = M_xxxzz + M_xyyzz
    v156      = -0.0476190476190476d0*(M_xxxxx + v416 + v90 + v99)
    v223      = M_xyyzz*x
    v252      = M_xyyzz*y
    v317      = M_xyyzz*z
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -v416
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    v417      = M_xxyzz + M_yyyzz
    v105      = -0.0476190476190476d0*(M_yyyyy + v103 + v104 + v417)
    v235      = M_yyyzz*y
    v254      = M_yyyzz*x
    v355      = M_yyyzz*z
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v0        = M_xxzzz + M_yyzzz
    v334      = M_yyzzz*x
    v357      = M_yyzzz*y
    M_yzzzz   = -v417
    M_zzzzz   = -v0
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    v418      = M_xxxzzz + M_xyyzzz
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -v418
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v419      = M_xxyzzz + M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v420      = M_xxzzzz + M_yyzzzz
    M_yzzzzz  = -v419
    M_zzzzzz  = -v420
    S_0       = 1
    S_x       = x
    S_y       = y
    S_z       = z
    S_xy      = v1
    v30       = M_xy*S_xy
    v45       = M_xx*S_xy
    v50       = M_yy*S_xy
    v59       = M_yz*S_xy
    v70       = M_xz*S_xy
    v87       = M_xxy*S_xy
    v108      = M_xxx*S_xy
    v118      = M_xyy*S_xy
    v132      = M_xyz*S_xy
    v161      = M_yyy*S_xy
    v167      = M_xxz*S_xy
    v175      = M_yyz*S_xy
    v205      = M_xxxy*S_xy
    v245      = M_xxyy*S_xy
    v247      = M_xxzz*S_xy
    v255      = M_yyzz*S_xy
    v260      = M_xxxx*S_xy
    v285      = M_yyyy*S_xy
    v306      = M_xxyz*S_xy
    v343      = M_xyyy*S_xy
    v369      = M_xxxz*S_xy
    v382      = M_xyyz*S_xy
    v407      = M_yyyz*S_xy
    Ms_xy     = Ms_xy + (M_0*S_xy + M_xy)
    S_xz      = v2
    v38       = M_xz*S_xz
    v58       = M_yy*S_xz
    v69       = M_xy*S_xz
    v89       = M_xxz*S_xz
    v119      = M_xyz*S_xz
    v137      = M_xxx*S_xz
    v144      = M_xyy*S_xz
    v162      = M_yyz*S_xz
    v165      = 3.0d0*S_xz
    v174      = M_yyy*S_xz
    v207      = M_xxxz*S_xz
    v270      = M_xxyz*S_xz
    v293      = M_xxxx*S_xz
    v304      = M_xxyy*S_xz
    v308      = M_xxzz*S_xz
    v329      = M_yyyy*S_xz
    v333      = M_yyzz*S_xz
    v341      = 0.242424242424242d0*v207
    v344      = M_xyyz*S_xz
    v367      = M_xxxy*S_xz
    v381      = M_xyyy*S_xz
    v402      = M_yyyz*S_xz
    Ms_xz     = Ms_xz + (M_0*S_xz + M_xz)
    S_yz      = v3
    v40       = M_yz*S_yz
    v44       = -0.142857142857143d0*(7.0d0*v43*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v54       = M_xy*S_yz
    v67       = M_xx*S_yz
    v77       = 3.0d0*S_yz
    v94       = M_xyz*S_yz
    v115      = M_xxz*S_yz
    v126      = M_yyz*S_yz
    v140      = M_xxy*S_yz
    v149      = M_yyy*S_yz
    v163      = M_xxx*S_yz
    v214      = M_xxyz*S_yz
    v267      = M_xxxz*S_yz
    v278      = M_xyyz*S_yz
    v296      = M_xxxy*S_yz
    v313      = M_xyyy*S_yz
    v347      = M_yyyz*S_yz
    v348      = 0.242424242424242d0*v347
    v353      = M_xxzz*S_yz
    v356      = M_yyzz*S_yz
    v364      = M_xxxx*S_yz
    v372      = M_xxyy*S_yz
    v389      = M_yyyy*S_yz
    Ms_yz     = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz     = v4
    v100      = M_yz*S_xyz
    v120      = M_xz*S_xyz
    v131      = M_xy*S_xyz
    v134      = 0.0476190476190476d0*(18.0d0*v129 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v130 + 48.0d0*v131 + 48.0d0*v132 + 5.0d0*v133))
    v190      = M_xyz*S_xyz
    v271      = M_xxz*S_xyz
    v287      = M_yyz*S_xyz
    v302      = 5.45454545454545d0*S_xyz
    v303      = M_xxy*v302
    v328      = M_yyy*S_xyz
    v363      = M_xxx*S_xyz
    v411      = M_xyy*v302
    Ms_xyz    = Ms_xyz + (M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v5        = a2
    a3        = a1*a2
    a4        = a2*a2
    v25       = a4
    a5        = a2*a3
    a6        = a3*a3
    a7        = a3*a4
    b2        = b1*b1
    v6        = b2
    v61       = v5*v6
    b3        = b1*b2
    b4        = b2*b2
    v75       = b4
    b5        = b2*b3
    b6        = b3*b3
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v5 + v6
    v7        = 0.333333333333333d0*h
    v8        = -v7
    v9        = v5 + v8
    v10       = v6 + v8
    v11       = -0.6d0*h
    v15       = -0.2d0*h
    v16       = v15 + v5
    v24       = v15 + v6
    v26       = h*h
    v27       = 0.0857142857142857d0*v26
    v28       = h*v5
    v41       = -0.428571428571429d0*h
    v42       = v41 + v5
    v60       = 0.142857142857143d0*h
    v66       = -v60
    v74       = v41 + v6
    v76       = h*v6
    v79       = 0.238095238095238d0*v26
    v101      = 0.0476190476190476d0*v26
    v102      = 0.333333333333333d0*(-2.0d0*v28) + v101 + v25
    v155      = -0.111111111111111d0*v28
    v177      = v61 + 0.111111111111111d0*(-v76)
    v182      = 0.333333333333333d0*(-2.0d0*v76) + v101 + v75
    v183      = h*h*h
    v184      = -0.0216450216450216d0*v183
    v185      = h*v25
    v186      = v26*v5
    v240      = 0.151515151515152d0*v26
    v241      = 0.0909090909090909d0*(-10.0d0*v28) + v240 + v25
    v337      = 0.545454545454545d0*v28
    v338      = -0.00432900432900433d0*(v183 + 231.0d0*v337*v6)
    v339      = 0.0303030303030303d0*v26
    v398      = -0.272727272727273d0*v28
    v399      = -0.272727272727273d0*v76
    v403      = v339 + v61
    v408      = h*v75
    v409      = v26*v6
    v415      = 0.0909090909090909d0*(-10.0d0*v76) + v240 + v75
    S_xx      = v9
    v31       = M_yy*S_xx
    v33       = M_xx*S_xx
    v47       = M_xy*S_xx
    v73       = M_yz*S_xx
    v82       = M_xxx*S_xx
    v92       = M_xyy*S_xx
    v111      = M_xxy*S_xx
    v123      = M_yyy*S_xx
    v142      = M_xxz*S_xx
    v151      = M_yyz*S_xx
    v200      = M_xxxx*S_xx
    v211      = M_xxyy*S_xx
    v217      = M_xxzz*S_xx
    v232      = M_yyyy*S_xx
    v237      = M_yyzz*S_xx
    v263      = M_xxxy*S_xx
    v275      = M_xyyy*S_xx
    v299      = M_xxxz*S_xx
    v315      = M_xyyz*S_xx
    v375      = M_xxyz*S_xx
    v392      = M_yyyz*S_xx
    Ms_xx     = Ms_xx + (M_0*S_xx + M_xx)
    S_yy      = v10
    v29       = M_xx*S_yy
    v32       = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v30 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v29 + 4.0d0*v31))
    v39       = M_yy*S_yy
    v48       = M_xy*S_yy
    v57       = M_xz*S_yy
    v83       = M_xxx*S_yy
    v93       = M_xyy*S_yy
    v112      = M_xxy*S_yy
    v124      = M_yyy*S_yy
    v143      = M_xxz*S_yy
    v152      = M_yyz*S_yy
    v201      = M_xxxx*S_yy
    v212      = M_xxyy*S_yy
    v218      = M_xxzz*S_yy
    v233      = M_yyyy*S_yy
    v238      = M_yyzz*S_yy
    v264      = M_xxxy*S_yy
    v276      = M_xyyy*S_yy
    v300      = M_xxxz*S_yy
    v316      = M_xyyz*S_yy
    v376      = M_xxyz*S_yy
    v393      = M_yyyz*S_yy
    Ms_yy     = Ms_yy + (M_0*S_yy + M_yy)
    S_zz      = -(S_xx + S_yy)
    S_xxx     = x*(v11 + v5)
    v80       = M_xx*S_xxx
    v96       = M_yy*S_xxx
    v116      = M_xy*S_xxx
    v145      = M_xz*S_xxx
    v176      = M_yz*S_xxx
    v198      = M_xxx*S_xxx
    v220      = M_xyy*S_xxx
    v253      = M_yyy*S_xxx
    v268      = M_xxy*S_xxx
    v331      = M_yyz*S_xxx
    v383      = M_xyz*S_xxx
    Ms_xxx    = Ms_xxx + (0.2d0*(9.0d0*v12 + 3.0d0*(-2.0d0*v13 - 2.0d0*v14)) + M_0*S_xxx + M_xxx)
    S_xxy     = v16*y
    v91       = M_xy*S_xxy
    v106      = M_xx*S_xxy
    v121      = M_yy*S_xxy
    v153      = M_yz*S_xxy
    v209      = M_xxy*S_xxy
    v230      = M_yyy*S_xxy
    v251      = M_xyy*S_xxy
    v259      = M_xxx*S_xxy
    v319      = S_xxy*v318
    v377      = M_xxz*S_xxy
    v394      = M_yyz*S_xxy
    Ms_xxy    = Ms_xxy + (0.2d0*(8.0d0*v17 + 2.0d0*(-v18 - v19)) + M_0*S_xxy + M_xx*y + M_xxy)
    S_xxz     = v16*z
    v95       = M_xz*S_xxz
    v127      = M_yz*S_xxz
    v135      = M_xx*S_xxz
    v147      = M_yy*S_xxz
    v168      = M_xy*S_xxz
    v191      = M_yyz*S_xxz
    v216      = M_xxz*S_xxz
    v279      = M_xyz*S_xxz
    v311      = M_xyy*S_xxz
    v370      = M_xxy*S_xxz
    v388      = M_yyy*S_xxz
    Ms_xxz    = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v20 + 8.0d0*v21 + 2.0d0*(v22 - v23)))
    S_xyy     = v24*x
    v81       = M_xx*S_xyy
    v97       = M_yy*S_xyy
    v117      = M_xy*S_xyy
    v146      = M_xz*S_xyy
    v199      = M_xxx*S_xyy
    v221      = M_xyy*S_xyy
    v244      = M_xxy*S_xyy
    v284      = M_yyy*S_xyy
    v307      = M_xxz*S_xyy
    v332      = M_yyz*S_xyy
    v414      = S_xyy*v318
    Ms_xyy    = Ms_xyy + (0.2d0*(8.0d0*v13 + 2.0d0*(-v12 - v14)) + M_0*S_xyy + M_xyy + M_yy*x)
    S_xzz     = -(S_xxx + S_xyy)
    S_yyy     = y*(v11 + v6)
    v107      = M_xx*S_yyy
    v122      = M_yy*S_yyy
    v154      = M_yz*S_yyy
    v157      = M_xy*S_yyy
    v173      = M_xz*S_yyy
    v210      = M_xxy*S_yyy
    v231      = M_yyy*S_yyy
    v242      = M_xxx*S_yyy
    v274      = M_xyy*S_yyy
    v320      = M_xyz*S_yyy
    v378      = M_xxz*S_yyy
    Ms_yyy    = Ms_yyy + (0.2d0*(9.0d0*v18 + 3.0d0*(-2.0d0*v17 - 2.0d0*v19)) + M_0*S_yyy + M_yyy)
    S_yyz     = v24*z
    v128      = M_yz*S_yyz
    v136      = M_xx*S_yyz
    v148      = M_yy*S_yyz
    v160      = M_xz*S_yyz
    v169      = M_xy*S_yyz
    v188      = M_xxz*S_yyz
    v192      = M_xxzzz*v189 + M_yyzzz*v189 + 0.00432900432900433d0*(-75.0d0*M_xxyyzz + &
      60.0d0*v187 + 1440.0d0*v190 + 5.0d0*(M_xxzzzz + M_yyzzzz - 8.0d0* &
      v188 - 8.0d0*v191))
    v236      = M_yyz*S_yyz
    v280      = M_xyz*S_yyz
    v292      = M_xxx*S_yyz
    v312      = M_xyy*S_yyz
    v340      = 0.00432900432900433d0*(-15.0d0*M_xxyyzz - 240.0d0*v187 - 720.0d0*v190 + &
      v420 - 260.0d0*(v188 + v191))
    v371      = M_xxy*S_yyz
    Ms_yyz    = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v22 + 8.0d0*v23 + 2.0d0*(v20 - v21)))
    S_yzz     = -(S_xxy + S_yyy)
    S_zzz     = -(S_xxz + S_yyz)
    S_xxxx    = 0.142857142857143d0*(-6.0d0*v28) + v25 + v27
    v193      = M_xx*S_xxxx
    v225      = M_yy*S_xxxx
    v272      = M_xy*S_xxxx
    v321      = M_xz*S_xxxx
    v395      = M_yz*S_xxxx
    Ms_xxxx   = Ms_xxxx + (M_0*S_xxxx + v32 - v36 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v33 + 80.0d0*v34 - 60.0d0*v37 - 96.0d0*v38 + &
      24.0d0*(v39 + v40)))
    S_xxxy    = v1*v42
    v219      = M_xy*S_xxxy
    v257      = M_xx*S_xxxy
    v282      = M_yy*S_xxxy
    v335      = M_yz*S_xxxy
    v384      = M_xz*S_xxxy
    Ms_xxxy   = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + v44 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v45 + 5.0d0*v46 + 5.0d0*v47 - 2.0d0*v48 - 2.0d0*v49 - 2.0d0*v50)))
    S_xxxz    = v2*v42
    v224      = M_xz*S_xxxz
    v288      = M_yz*S_xxxz
    v290      = M_xx*S_xxxz
    v326      = M_yy*S_xxxz
    v345      = 0.242424242424242d0*v224
    v379      = M_xy*S_xxxz
    Ms_xxxz   = Ms_xxxz + (0.142857142857143d0*(13.0d0*v52 + 15.0d0*v53 + 6.0d0*(-v54 + v55 + v57 + &
      v58 - v59)) + M_0*S_xxxz + M_xxxz + S_xx*v56 + S_xz*v51 - v43*y)
    S_xxyy    = 0.0285714285714286d0*v26 - v5*v60 - v6*v60 + v61
    v194      = M_xx*S_xxyy
    v226      = M_yy*S_xxyy
    v248      = M_xy*S_xxyy
    v322      = M_xz*S_xxyy
    v396      = M_yz*S_xxyy
    Ms_xxyy   = Ms_xxyy + (M_0*S_xxyy + v36 + v63 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v30 + 39.0d0*(v29 + v31) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v33 + 10.0d0*v34 + 10.0d0*v37 + 12.0d0*v38 + 12.0d0*v39 + &
      12.0d0*v40 + 10.0d0*v64 + 10.0d0*v65)))
    S_xxyz    = v3*(v5 + v66)
    v239      = M_yz*S_xxyz
    v281      = M_xz*S_xxyz
    v310      = M_xy*S_xxyz
    v361      = M_xx*S_xxyz
    v386      = M_yy*S_xxyz
    Ms_xxyz   = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v69 + v70) + 2.0d0*(v71 - v72) + 9.0d0*(v67 &
      + v68 + v73)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v62)
    S_xxzz    = -(S_xxxx + S_xxyy)
    v195      = M_xx*S_xxzz
    v227      = M_yy*S_xxzz
    v249      = M_xy*S_xxzz
    v323      = M_xz*S_xxzz
    v358      = M_yz*S_xxzz
    S_xyyy    = v1*v74
    v258      = M_xx*S_xyyy
    v283      = M_yy*S_xyyy
    v336      = M_yz*S_xyyy
    v342      = M_xy*S_xyyy
    v385      = M_xz*S_xyyy
    Ms_xyyy   = Ms_xyyy + (M_0*S_xyyy + M_xyyy + M_yyy*x + v44 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v45 - 2.0d0*v46 - 2.0d0*v47 + 5.0d0*v48 + 5.0d0*v49 + 5.0d0*v50 &
      )))
    S_xyyz    = v2*(v6 + v66)
    v289      = M_yz*S_xyyz
    v291      = M_xx*S_xyyz
    v327      = M_yy*S_xyyz
    v346      = M_xz*S_xyyz
    v380      = M_xy*S_xyyz
    Ms_xyyz   = Ms_xyyz + (0.142857142857143d0*(2.0d0*(v52 - v53) + 12.0d0*(v54 + v59) + 9.0d0*(v55 &
      + v57 + v58)) + M_0*S_xyyz + M_xyyz + M_xyz*v35 + M_yyz*x)
    S_xyzz    = -(S_xxxy + S_xyyy)
    S_xzzz    = -(S_xxxz + S_xyyz)
    S_yyyy    = 0.142857142857143d0*(-6.0d0*v76) + v27 + v75
    v196      = M_xx*S_yyyy
    v228      = M_yy*S_yyyy
    v273      = M_xy*S_yyyy
    v324      = M_xz*S_yyyy
    v397      = M_yz*S_yyyy
    Ms_yyyy   = Ms_yyyy + (M_0*S_yyyy + v32 - v63 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v39 - 96.0d0*v40 + 80.0d0*v64 - 60.0d0*v65 + &
      24.0d0*(v33 + v38)))
    S_yyyz    = v3*v74
    v349      = M_yz*S_yyyz
    v350      = 0.242424242424242d0*v349
    v362      = M_xx*S_yyyz
    v387      = M_yy*S_yyyz
    v401      = M_xz*S_yyyz
    v405      = M_xy*S_yyyz
    Ms_yyyz   = Ms_yyyz + (0.142857142857143d0*(13.0d0*v71 + 15.0d0*v72 + 6.0d0*(v67 + v68 - v69 - &
      v70 + v73)) + M_0*S_yyyz + M_yy*v77 + M_yyyz + S_yy*v78 - v43*x)
    S_yyzz    = -(S_xxyy + S_yyyy)
    v197      = M_xx*S_yyzz
    v229      = M_yy*S_yyzz
    v250      = M_xy*S_yyzz
    v256      = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz + &
      4.0d0*v242 - v243 - 24.0d0*v244 - 30.0d0*v245 - v246 - v247 - &
      30.0d0*v248 - v249 - v250 - 24.0d0*v251 - v252 + 4.0d0*v253 - &
      v254 - v255))
    v325      = M_xz*S_yyzz
    v359      = M_yz*S_yyzz
    v360      = -0.0303030303030303d0*(M_yyyyyz + v354 + v357 + v419 + 5.0d0*(v352 + &
      v353 + v355 + v356 + v358 + v359))
    v404      = -0.0303030303030303d0*(M_xxxxxz + v309 + v334 + v418 + 5.0d0*(v301 + &
      v308 + v317 + v323 + v325 + v333))
    S_yzzz    = -(S_xxyz + S_yyyz)
    S_zzzz    = -(S_xxzz + S_yyzz)
    S_xxxxx   = x*(0.111111111111111d0*(-10.0d0*v28) + v25 + v79)
    Ms_xxxxx  = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v84 &
      - 30.0d0*(M_xxxyy + v88) + 330.0d0*(v80 + v82) - 140.0d0*(v85 + &
      v86) + 120.0d0*(v100 + v93 + v94 + v97) + 60.0d0*(v81 + v83 + v92 &
      + v96) - 300.0d0*(v87 + v89 + v91 + v95) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v90 + v98 + v99)))
    S_xxxxy   = v102*y
    Ms_xxxxy  = Ms_xxxxy + (M_0*S_xxxxy + v105 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v109) + &
      78.0d0*(v106 + v111) + 4.0d0*(v107 + v123) + 56.0d0*(v108 + v110 &
      + v116) + 8.0d0*(v122 + v124 + v126 + v128) - (2.0d0*M_xxyyy + &
      24.0d0*v112 + 30.0d0*v113 + 28.0d0*v114 + 28.0d0*v115 + 48.0d0* &
      v117 + 48.0d0*v118 + 48.0d0*v119 + 48.0d0*v120 + 24.0d0*v121 + &
      v125 + 28.0d0*v127)))
    S_xxxxz   = v102*z
    Ms_xxxxz  = Ms_xxxxz + (M_0*S_xxxxz + v134 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v138 &
      + 56.0d0*v139 + 106.0d0*(v135 + v142) + 4.0d0*(v136 + v151) + &
      104.0d0*(v137 + v145) + 32.0d0*(v143 + v147) + 48.0d0*(v144 + &
      v146) + 8.0d0*(v148 + v152) - (M_yyyyz + 36.0d0*v140 + 28.0d0* &
      v141 + 8.0d0*v149 + 5.0d0*v150 + 36.0d0*v153 + 8.0d0*v154)))
    S_xxxyy   = x*(-v6*v7 + v101 + v155 + v61)
    Ms_xxxyy  = Ms_xxxyy + (M_0*S_xxxyy + v156 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v84 + &
      112.0d0*v85 - 14.0d0*v86 + 141.0d0*v88 - 3.0d0*(M_xyyyy + v98) + &
      159.0d0*(v81 + v92) + 75.0d0*(v83 + v96) + 276.0d0*(v87 + v91) - &
      60.0d0*(v100 + v93 + v94 + v97) - 18.0d0*(v80 + v82 + v89 + v95) &
      - 42.0d0*(v157 + v158 + v159 + v160 + v161 + v162)))
    S_xxxyz   = v4*v9
    Ms_xxxyz  = Ms_xxxyz + (0.333333333333333d0*(5.0d0*(v163 + v164 + v176) + 7.0d0*(v166 + v167 + &
      v168) + 2.0d0*(-v169 + v170 - v171 + v173 + v174 - v175)) + M_0* &
      S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy*v165 + S_xx*v172 + S_xxy*v56 &
      + S_xyz*v51)
    S_xxyyy   = y*(-v5*v7 + v101 + v177)
    Ms_xxyyy  = Ms_xxyyy + (M_0*S_xxyyy + v105 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v113 &
      - 17.0d0*v125 + 112.0d0*v178 - 14.0d0*v179 - 3.0d0*(M_xxxxy + &
      v109) + 75.0d0*(v107 + v123) + 159.0d0*(v112 + v121) + 276.0d0*( &
      v117 + v118) - 60.0d0*(v106 + v111 + v119 + v120) - 18.0d0*(v122 &
      + v124 + v126 + v128) - 42.0d0*(v108 + v110 + v114 + v115 + v116 &
      + v127)))
    S_xxyyz   = z*(0.0158730158730159d0*v26 + v155 + v177)
    Ms_xxyyz  = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v131 + v132) + 9.0d0*(v138 + v150) + 112.0d0*(v141 + v180) + &
      6.0d0*(v137 + v145 + v149 + v154) + 132.0d0*(v140 + v144 + v146 + &
      v153) + 81.0d0*(v129 + v136 + v143 + v147 + v151) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v130 + 5.0d0*v133 + 6.0d0* &
      v135 + 14.0d0*v139 + 6.0d0*v142 + 6.0d0*v148 + 6.0d0*v152 + &
      14.0d0*v181)))
    S_xyyyy   = v182*x
    Ms_xyyyy  = Ms_xyyyy + (M_0*S_xyyyy + v156 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v98) + &
      4.0d0*(v83 + v96) + 78.0d0*(v93 + v97) + 56.0d0*(v157 + v158 + &
      v161) + 8.0d0*(v80 + v82 + v89 + v95) - (2.0d0*M_xxxyy + 48.0d0* &
      v100 + 28.0d0*v159 + 28.0d0*v160 + 28.0d0*v162 + 24.0d0*v81 + v84 &
      + 48.0d0*v87 + 30.0d0*v88 + 48.0d0*v91 + 24.0d0*v92 + 48.0d0*v94 &
      )))
    S_xyyyz   = v10*v4
    Ms_xyyyz  = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v169 + v171 + v175) + &
      5.0d0*(v170 + v173 + v174) + 2.0d0*(v163 + v164 - v166 - v167 - &
      v168 + v176)) + M_0*S_xyyyz + M_xyy*v77 + M_xyyyz + M_yyyz*x + &
      S_xyy*v78 + S_yy*v172)
    S_yyyyy   = y*(0.111111111111111d0*(-10.0d0*v76) + v75 + v79)
    Ms_yyyyy  = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v125 &
      - 30.0d0*(M_xxyyy + v113) + 330.0d0*(v122 + v124) - 140.0d0*(v178 &
      + v179) + 120.0d0*(v106 + v111 + v119 + v120) + 60.0d0*(v107 + &
      v112 + v121 + v123) - 300.0d0*(v117 + v118 + v126 + v128) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v103 + v104 + v109)))
    S_yyyyz   = v182*z
    Ms_yyyyz  = Ms_yyyyz + (M_0*S_yyyyz + v134 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v150 &
      + 56.0d0*v181 + 8.0d0*(v135 + v142) + 32.0d0*(v136 + v151) + &
      48.0d0*(v140 + v153) + 4.0d0*(v143 + v147) + 106.0d0*(v148 + v152 &
      ) + 104.0d0*(v149 + v154) - (M_xxxxz + 8.0d0*v137 + 5.0d0*v138 + &
      36.0d0*v144 + 8.0d0*v145 + 36.0d0*v146 + 28.0d0*v180)))
    S_xxxxxx  = a6 + v184 + 0.0909090909090909d0*(-15.0d0*v185 + 5.0d0*v186)
    Ms_xxxxxx = Ms_xxxxxx + (M_0*S_xxxxxx + M_yyyyz*v189 + v192 + 0.00432900432900433d0*(136.0d0* &
      M_xxxxxx - 75.0d0*M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + &
      2360.0d0*v198 + 576.0d0*v202 - 2340.0d0*v209 - 2260.0d0*v216 + &
      1440.0d0*v221 + 1620.0d0*(v193 + v200) - 600.0d0*(v203 + v204) - &
      120.0d0*(v210 + v230) + 840.0d0*(v214 + v239) - 160.0d0*(v231 + &
      v236) + 90.0d0*(-M_xxxxzz + v194 + v211) + 360.0d0*(v201 - v206 + &
      v225) + 30.0d0*(v215 + v234 + v235) - 180.0d0*(M_xxxxyy + v208 + &
      v222 + v223) + 720.0d0*(v199 + v212 + v220 + v226) - 1680.0d0*( &
      v205 + v207 + v219 + v224) - 165.0d0*(v195 + v196 + v197 + v217 + &
      v232 + v237) + 60.0d0*(v213 - v218 - v227 - v228 - v229 - v233 - &
      v238)))
    S_xxxxxy  = v1*v241
    Ms_xxxxxy = Ms_xxxxxy + (M_0*S_xxxxxy + v256 - v266*z + 0.0303030303030303d0*(-70.0d0*v265 - &
      10.0d0*v269 + 28.0d0*(M_xxxxxy + v261) + 20.0d0*(v258 + v275) - &
      60.0d0*(v267 + v288) + 100.0d0*(v260 + v262 + v272) + 190.0d0*( &
      v257 + v259 + v263 + v268) - 140.0d0*(v270 + v271 + v279 + v281) &
      - 5.0d0*(M_xyyyyy + v273 + v277 + v285 + v286) + 40.0d0*(-v264 + &
      v274 + v276 + v278 + v280 - v282 + v283 + v284 + v287 + v289)))
    S_xxxxxz  = v2*v241
    Ms_xxxxxz = Ms_xxxxxz + (M_0*S_xxxxxz - v298 - v303 - v319 + 0.0303030303030303d0*(28.0d0* &
      M_xxxxxz + 68.0d0*v294 + 250.0d0*(v290 + v299) + 220.0d0*(v293 + &
      v321) + 80.0d0*(v300 + v326) + 90.0d0*(v304 + v322) - 140.0d0*( &
      v306 + v310) + 160.0d0*(v307 + v311) + 330.0d0*(M_xxx*S_xxz + &
      M_xxz*S_xxx) + 10890.0d0*(-M_xxxyyz + v297 - v305) + 100.0d0*( &
      v295 - v296 - v335) + 20.0d0*(v291 + v292 + v315 + v331) - 5.0d0* &
      (M_xxxzzz + M_xyyyyz + M_xyyzzz + v309 + v330 + v334) + 40.0d0*( &
      v312 - v313 + v316 - v320 + v327 - v328 + v332 - v336) - 25.0d0*( &
      v301 + v308 + v314 + v317 + v323 + v324 + v325 + v329 + v333)))
    S_xxxxyy  = 0.0303030303030303d0*(-3.0d0*v185 + 2.0d0*v186) + v25*v6 + v338 + v339* &
      v6
    Ms_xxxxyy = Ms_xxxxyy + (M_0*S_xxxxyy + v340 - v341 - v345 + v348 + v350 + v351*(M_yyyyz + v0) + &
      0.00432900432900433d0*(-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - &
      11.0d0*M_xxxxzz - 5.0d0*M_yyyyyy - 4.0d0*M_yyyyzz - 64.0d0*v202 + &
      412.0d0*v203 - 36.0d0*v204 + 628.0d0*v206 + 1800.0d0*v209 - &
      720.0d0*v221 - 82.0d0*(v193 + v200) + 942.0d0*(v194 + v211) + &
      2.0d0*(v196 + v232) - 60.0d0*(v198 + v216) + 760.0d0*(v199 + v220 &
      ) + 1288.0d0*(v205 + v219) - 220.0d0*(v210 + v230) - 402.0d0*( &
      v212 + v226) - 392.0d0*(v214 + v239) + 37.0d0*(v228 + v233) + &
      80.0d0*(v231 + v236) + 268.0d0*(v201 - v213 + v225) - 8.0d0*(v215 &
      + v234 + v235) - 22.0d0*(M_xxyyyy + v208 + v222 + v223) - 26.0d0* &
      (v195 + v197 + v217 + v237) - 19.0d0*(v218 + v227 + v229 + v238) &
      - 448.0d0*(v342 + v343 + v344 + v346)))
    S_xxxxyz  = v3*(-v337 + v25 + v339)
    Ms_xxxxyz = Ms_xxxxyz + (M_0*S_xxxxyz + v360 + 0.0303030303030303d0*(26.0d0*v373 + 32.0d0*( &
      M_xxxxyz + v366) + 40.0d0*(v378 + v388) + 8.0d0*(v387 + v393) + &
      96.0d0*(v368 + v369 + v379) + 170.0d0*(v361 + v370 + v375 + v377 &
      ) + 4.0d0*(v362 + v376 + v386 + v392) + 160.0d0*(v363 + v367 + &
      v383 + v384) + 64.0d0*(v364 + v365 + v381 + v385 + v395) - (2.0d0 &
      *M_xxyyyz + 40.0d0*v371 + 18.0d0*v372 + 38.0d0*v374 + 64.0d0*v380 &
      + 64.0d0*v382 + 13.0d0*v389 + 5.0d0*v390 + v391 + 40.0d0*v394 + &
      18.0d0*v396 + 13.0d0*v397)))
    S_xxxyyy  = v1*(0.0909090909090909d0*v26 + v398 + v399 + v61)
    Ms_xxxyyy = Ms_xxxyyy + (0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v242 + v253) + 75.0d0*(v244 + v251) + 69.0d0*(v245 + v248) + &
      25.0d0*(v265 + v269) + 31.0d0*(v258 + v264 + v275 + v282) - ( &
      M_xxxxxy + 11.0d0*M_xxxyz*v400 + M_xxxyzz + M_xyyyyy + 11.0d0* &
      M_xyyyz*v400 + M_xyyyzz + v243 + v246 + v247 + v249 + v250 + v252 &
      + v254 + v255 + 10.0d0*v257 + 10.0d0*v259 + 7.0d0*v260 + v261 + &
      7.0d0*v262 + 10.0d0*v263 + 6.0d0*v267 + 10.0d0*v268 + 10.0d0*v270 &
      + 10.0d0*v271 + 7.0d0*v272 + 7.0d0*v273 + 10.0d0*v274 + 10.0d0* &
      v276 + 7.0d0*v277 + 10.0d0*v278 + 10.0d0*v279 + 10.0d0*v280 + &
      10.0d0*v281 + 10.0d0*v283 + 10.0d0*v284 + 7.0d0*v285 + v286 + &
      10.0d0*v287 + 6.0d0*v288 + 10.0d0*v289 + 6.0d0*v401 + 6.0d0*v402 &
      )))
    S_xxxyyz  = v2*(0.0909090909090909d0*(-v28) + v399 + v403)
    Ms_xxxyyz = Ms_xxxyyz + (M_0*S_xxxyyz + M_xxyy*v165 + S_xxyy*v56 + v298 + v303 + v319 + v404 + &
      0.0303030303030303d0*(31.0d0*M_xxxyyz + v294 + 47.0d0*v297 + &
      79.0d0*v305 + 103.0d0*(v291 + v315) + 55.0d0*(v292 + v331) + &
      88.0d0*(v296 + v335) + 43.0d0*(v300 + v326) + 152.0d0*(v306 + &
      v310) + 95.0d0*(v307 + v311) + 13.0d0*(v314 + v324 + v329) + &
      10.0d0*(v313 + v320 + v328 + v336) - (M_xyyyyz + 4.0d0*v290 + &
      v293 + 7.0d0*v295 + 4.0d0*v299 + 10.0d0*v312 + 10.0d0*v316 + v321 &
      + 10.0d0*v327 + v330 + 10.0d0*v332 + 18.0d0*v405 + 18.0d0*v406 + &
      18.0d0*v407)))
    S_xxyyyy  = 0.0303030303030303d0*(-3.0d0*v408 + 2.0d0*v409) + v338 + v339*v5 + v5* &
      v75
    Ms_xxyyyy = Ms_xxyyyy + (M_0*S_xxyyyy + v340 + v341 + v345 - v348 - v350 + v351*(M_xxxxz + v0) + &
      0.00432900432900433d0*(-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0 &
      *M_xxyyyy - 12.0d0*M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v209 + &
      628.0d0*v213 + 1800.0d0*v221 + 412.0d0*v222 - 64.0d0*v234 - &
      36.0d0*v410 + 37.0d0*(v193 + v200) - 402.0d0*(v194 + v211) + &
      80.0d0*(v198 + v216) - 220.0d0*(v199 + v220) + 2.0d0*(v201 + v225 &
      ) + 760.0d0*(v210 + v230) + 942.0d0*(v212 + v226) - 82.0d0*(v228 &
      + v233) - 60.0d0*(v231 + v236) + 1288.0d0*(v342 + v343) - 392.0d0 &
      *(v344 + v346) + 268.0d0*(v196 - v206 + v232) - 8.0d0*(v202 + &
      v208 + v223) - 22.0d0*(M_xxxxyy + v203 + v215 + v235) - 19.0d0*( &
      v195 + v197 + v217 + v237) - 448.0d0*(v205 + v214 + v219 + v239) &
      - 26.0d0*(v218 + v227 + v229 + v238)))
    S_xxyyyz  = v3*(0.0909090909090909d0*(-v76) + v398 + v403)
    Ms_xxyyyz = Ms_xxyyyz + (M_0*S_xxyyyz + v360 + v411 + v413 + v414 + 0.0303030303030303d0*(31.0d0* &
      M_xxyyyz + 47.0d0*v373 + 79.0d0*v374 + v390 + 43.0d0*(v362 + v392 &
      ) + 95.0d0*(v371 + v394) + 99.0d0*(v372 + v396) + 103.0d0*(v376 + &
      v386) + 55.0d0*(v378 + v388) + 152.0d0*(v380 + v382) + 88.0d0*( &
      v381 + v385) + 13.0d0*(v364 + v365 + v395) + 10.0d0*(v363 + v367 &
      + v383 + v384) - (M_xxxxyz + 10.0d0*v361 + v366 + 18.0d0*v368 + &
      18.0d0*v369 + 10.0d0*v370 + 10.0d0*v375 + 10.0d0*v377 + 18.0d0* &
      v379 + 4.0d0*v387 + v389 + 7.0d0*v391 + 4.0d0*v393 + v397)))
    S_xyyyyy  = v1*v415
    Ms_xyyyyy = Ms_xyyyyy + (M_0*S_xyyyyy + v256 - v412*z + 0.0303030303030303d0*(-10.0d0*v265 - &
      70.0d0*v269 + 28.0d0*(M_xyyyyy + v286) + 20.0d0*(v264 + v282) - &
      60.0d0*(v401 + v402) + 100.0d0*(v273 + v277 + v285) + 190.0d0*( &
      v274 + v276 + v283 + v284) - 140.0d0*(v278 + v280 + v287 + v289) &
      - 5.0d0*(M_xxxxxy + v260 + v261 + v262 + v272) + 40.0d0*(v257 - &
      v258 + v259 + v263 + v268 + v270 + v271 - v275 + v279 + v281)))
    S_xyyyyz  = v2*(0.0909090909090909d0*(-6.0d0*v76) + v339 + v75)
    Ms_xyyyyz = Ms_xyyyyz + (M_0*S_xyyyyz + v404 + 0.0303030303030303d0*(26.0d0*v297 + 32.0d0*( &
      M_xyyyyz + v330) + 8.0d0*(v290 + v299) + 40.0d0*(v292 + v331) + &
      96.0d0*(v405 + v406 + v407) + 4.0d0*(v291 + v300 + v315 + v326) + &
      170.0d0*(v312 + v316 + v327 + v332) + 160.0d0*(v313 + v320 + v328 &
      + v336) + 64.0d0*(v296 + v314 + v324 + v329 + v335) - (2.0d0* &
      M_xxxyyz + 13.0d0*v293 + 5.0d0*v294 + v295 + 18.0d0*v304 + 38.0d0 &
      *v305 + 64.0d0*v306 + 40.0d0*v307 + 64.0d0*v310 + 40.0d0*v311 + &
      13.0d0*v321 + 18.0d0*v322)))
    S_yyyyyy  = b6 + v184 + 0.0909090909090909d0*(-15.0d0*v408 + 5.0d0*v409)
    Ms_yyyyyy = Ms_yyyyyy + (M_0*S_yyyyyy + v192 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v209 - &
      2340.0d0*v221 + 2360.0d0*v231 + 576.0d0*v234 - 2260.0d0*v236 - &
      160.0d0*(v198 + v216) - 120.0d0*(v199 + v220) - 600.0d0*(v222 + &
      v410) + 1620.0d0*(v228 + v233) + 840.0d0*(v344 + v346) + 90.0d0*( &
      -M_yyyyzz + v212 + v226) + 360.0d0*(v196 - v213 + v232) - 180.0d0 &
      *(M_xxyyyy + v203 + v215 + v235) + 720.0d0*(v194 + v210 + v211 + &
      v230) + 30.0d0*(v202 + v204 + v208 + v223) - 1680.0d0*(v342 + &
      v343 + v347 + v349) - 165.0d0*(v201 + v218 + v225 + v227 + v229 + &
      v238) + 60.0d0*(-v193 - v195 - v197 - v200 + v206 - v217 - v237)))
    S_yyyyyz  = v3*v415
    Ms_yyyyyz = Ms_yyyyyz + (M_0*S_yyyyyz - v411 - v413 - v414 + 0.0303030303030303d0*(28.0d0* &
      M_yyyyyz + 68.0d0*v390 + 80.0d0*(v362 + v392) + 160.0d0*(v371 + &
      v394) + 90.0d0*(v372 + v396) - 140.0d0*(v380 + v382) + 250.0d0*( &
      v387 + v393) + 220.0d0*(v389 + v397) + 330.0d0*(M_yyy*S_yyz + &
      M_yyz*S_yyy) + 10890.0d0*(-M_xxyyyz + v373 - v374) + 100.0d0*( &
      -v381 - v385 + v391) + 20.0d0*(v376 + v378 + v386 + v388) - 5.0d0 &
      *(M_xxxxyz + M_xxyzzz + M_yyyzzz + v354 + v357 + v366) + 40.0d0*( &
      v361 - v363 - v367 + v370 + v375 + v377 - v383 - v384) - 25.0d0*( &
      v352 + v353 + v355 + v356 + v358 + v359 + v364 + v365 + v395)))
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
#undef  Ms_xxxxxx           
#undef  M_xxxxxx            
#undef  Ms_xxxxxy           
#undef  M_xxxxxy            
#undef  Ms_xxxxxz           
#undef  M_xxxxxz            
#undef  Ms_xxxxyy           
#undef  M_xxxxyy            
#undef  Ms_xxxxyz           
#undef  M_xxxxyz            
#undef  M_xxxyyy            
#undef  Ms_xxxyyy           
#undef  Ms_xxxyyz           
#undef  M_xxxyyz            
#undef  Ms_xxyyyy           
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  Ms_xxyyyz           
#undef  Ms_xyyyyy           
#undef  M_xyyyyy            
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  Ms_yyyyyy           
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  Ms_yyyyyz           
    end subroutine mom_es_M2M_add
    
! OPS  1002*ADD + 2*DIV + 1396*MUL + 117*NEG + POW + 35*SUB = 2553  (3488 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v28, v29, v3, v30, v31, v32, v33, v34,&
                v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45,&
                v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_x,&
                D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy,&
                D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz,&
                D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz,&
                D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz,&
                D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz,&
                D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy,&
                D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz,&
                D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz,&
                D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx,&
                D_xxxxxxy, D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz,&
                D_xxxxyyy, D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy,&
                D_xxxyyyz, D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy,&
                D_xxyyyyz, D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz,&
                D_xyyyyyy, D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz,&
                D_xyzzzzz, D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz,&
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, M_zz,&
                M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz,&
                M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz,&
                M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz,&
                M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz,&
                M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz,&
                M_zzzzzz
#define x                    r(1)
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
#define L_x                  L(0)
#define M_xx                 M(1)
#define L_y                  L(1)
#define M_xy                 M(2)
#define L_z                  L(2)
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
#define M_xxxz               M(15)
#define L_xxxx               L(15)
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
#define M_xxxxx              M(22)
#define M_xxxxy              M(23)
#define L_yyyz               L(23)
#define L_xxxxx              L(24)
#define M_xxxxz              M(24)
#define L_xxxxy              L(25)
#define M_xxxyy              M(25)
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
#define M_xxxxxx             M(33)
#define L_yyyyz              L(34)
#define M_xxxxxy             M(34)
#define L_xxxxxx             L(35)
#define M_xxxxxz             M(35)
#define L_xxxxxy             L(36)
#define M_xxxxyy             M(36)
#define L_xxxxxz             L(37)
#define M_xxxxyz             M(37)
#define M_xxxyyy             M(38)
#define L_xxxxyy             L(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define M_xxyyyy             M(40)
#define L_xxxyyy             L(40)
#define M_xxyyyz             M(41)
#define L_xxxyyz             L(41)
#define L_xxyyyy             L(42)
#define M_xyyyyy             M(42)
#define M_xyyyyz             M(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define M_yyyyyy             M(44)
#define L_xyyyyz             L(45)
#define M_yyyyyz             M(45)
#define L_yyyyyy             L(46)
#define L_yyyyyz             L(47)
#define L_xxxxxxx            L(48)
#define L_xxxxxxy            L(49)
#define L_xxxxxxz            L(50)
#define L_xxxxxyy            L(51)
#define L_xxxxxyz            L(52)
#define L_xxxxyyy            L(53)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define L_xxxyyyz            L(56)
#define L_xxyyyyy            L(57)
#define L_xxyyyyz            L(58)
#define L_xyyyyyy            L(59)
#define L_xyyyyyz            L(60)
#define L_yyyyyyy            L(61)
#define L_yyyyyyz            L(62)
    v268      = y*z
    v269      = 945.0d0*x
    v261      = 15.0d0*v268
    v265      = v268
    v61       = v269
    v83       = 0.5d0*M_xx
    v92       = 0.166666666666667d0*M_xxx
    v93       = 0.5d0*M_xxy
    v94       = 0.5d0*M_xxz
    v112      = 0.0416666666666667d0*M_xxxx
    v113      = 0.166666666666667d0*M_xxxy
    v114      = 0.166666666666667d0*M_xxxz
    v115      = 0.25d0*M_xxyy
    v116      = 0.5d0*M_xxyz
    v149      = 0.00833333333333333d0*M_xxxxx
    v150      = 0.0416666666666667d0*M_xxxxy
    v151      = 0.0416666666666667d0*M_xxxxz
    v152      = 0.0833333333333333d0*M_xxxyy
    v153      = 0.166666666666667d0*M_xxxyz
    v155      = 0.0833333333333333d0*M_xxyyy
    v156      = 0.25d0*M_xxyyz
    v180      = 0.5d0*M_yy
    v182      = 0.166666666666667d0*M_yyy
    v187      = 0.0416666666666667d0*M_yyyy
    v196      = 0.00833333333333333d0*M_yyyyy
    v212      = 0.00138888888888889d0*M_xxxxxx
    v213      = 0.00833333333333333d0*M_xxxxxy
    v214      = 0.00833333333333333d0*M_xxxxxz
    v215      = 0.0208333333333333d0*M_xxxxyy
    v216      = 0.0416666666666667d0*M_xxxxyz
    v218      = 0.0277777777777778d0*M_xxxyyy
    v219      = 0.0833333333333333d0*M_xxxyyz
    v222      = 0.0208333333333333d0*M_xxyyyy
    v223      = 0.0833333333333333d0*M_xxyyyz
    v227      = 0.00138888888888889d0*M_yyyyyy
    v228      = 0.00833333333333333d0*M_yyyyyz
    v229      = 0.0416666666666667d0*M_yyyyz
    v231      = 0.166666666666667d0*M_yyyz
    v234      = 0.5d0*M_yyz
    v243      = 0.5d0*M_xyy
    v245      = 0.166666666666667d0*M_xyyy
    v247      = 0.0416666666666667d0*M_xyyyy
    v249      = 0.00833333333333333d0*M_xyyyyy
    M_zz      = -(M_xx + M_yy)
    v238      = 0.5d0*M_zz
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    v244      = 0.5d0*M_yzz
    M_zzz     = -(M_xxz + M_yyz)
    v239      = 0.166666666666667d0*M_zzz
    M_xxzz    = -(M_xxxx + M_xxyy)
    v117      = 0.25d0*M_xxzz
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v235      = 0.25d0*M_yyzz
    M_yzzz    = -(M_xxyz + M_yyyz)
    v246      = 0.166666666666667d0*M_yzzz
    M_zzzz    = -(M_xxzz + M_yyzz)
    v240      = 0.0416666666666667d0*M_zzzz
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    v154      = 0.0833333333333333d0*M_xxxzz
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    v157      = 0.25d0*M_xxyzz
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    v158      = 0.0833333333333333d0*M_xxzzz
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -(M_xxxzz + M_xyyzz)
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    v232      = 0.0833333333333333d0*M_yyyzz
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v236      = 0.0833333333333333d0*M_yyzzz
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    v248      = 0.0416666666666667d0*M_yzzzz
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    v241      = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    v217      = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    v220      = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    v221      = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    v224      = 0.125d0*M_xxyyzz
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    v225      = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    v226      = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    v230      = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v233      = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v237      = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    v250      = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    v242      = 0.00138888888888889d0*M_zzzzzz
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v251      = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v251
    v24       = 7.0d0*v0
    a3        = a1*a2
    a4        = a2*a2
    v19       = a4
    v54       = 33.0d0*v19
    v82       = 143.0d0*v19
    a5        = a2*a3
    a6        = a3*a3
    v49       = a6
    v74       = -429.0d0*v49
    a7        = a3*a4
    b2        = b1*b1
    v1        = b2
    v252      = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v252
    v29       = 7.0d0*v1
    v59       = v1*v19
    v80       = -429.0d0*v59
    b3        = b1*b2
    b4        = b2*b2
    v31       = b4
    v66       = v0*v31
    v67       = 33.0d0*v31
    v103      = 143.0d0*v31
    v129      = -429.0d0*v66
    b5        = b2*b3
    b6        = b3*b3
    v69       = b6
    v178      = -429.0d0*v69
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v0 + v1
    v253      = 3.0d0*h
    v254      = h*v0
    v255      = h*v1
    v256      = h*v19
    v257      = h*v31
    v4        = -h
    v12       = v253
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v254
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v255
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v254
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 + 630.0d0*v255 - 945.0d0*v31
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v256
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v254
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v257
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v86       = -18.0d0*v51 + v46 + v79
    v87       = 66.0d0*v57
    v267      = -v87
    v88       = 9.0d0*v17
    v89       = 198.0d0*v57
    v101      = h*v67
    v102      = -18.0d0*v65 + v101 + v46
    v179      = v178 + v47 - 135.0d0*v65 + 495.0d0*v70
    u2        = 1.0/h
    u         = sqrt(u2)
    u3        = u*u2
    v2        = u3
    D_x       = -v2*x
    D_y       = -v2*y
    D_z       = -v2*z
    u4        = u2*u2
    u5        = u2*u3
    v3        = u5
    v258      = 3.0d0*v3
    v6        = v258*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v258*v265
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v259      = 3.0d0*v8
    v9        = v8*x
    v11       = v259*(h - v10)
    D_xxx     = -3.0d0*v9*(v251 - v253)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    D_xyz     = -v261*v9
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = v259*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v260      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v260*y
    v26       = v260*z
    v28       = v15*v261
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v159      = 0.5d0*D_xxyy
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    v169      = 0.5d0*D_xxzz
    D_xyyy    = v22*v30
    D_xyyz    = v26*(v29 + v4)
    D_xyzz    = -(D_xxxy + D_xyyy)
    v203      = 0.5d0*D_xyzz
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v262      = 15.0d0*v34
    v263      = v34*z
    v35       = v262*x
    v39       = v263
    v41       = 315.0d0*v263*x*y
    v42       = v262*y
    D_xxxxx   = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy   = v34*v38*y
    D_xxxxz   = v38*v39
    D_xxxyy   = v35*(v40 + h*v24 + 21.0d0*v32)
    v118      = 0.5d0*D_xxxyy
    D_xxxyz   = v41*(h - v5)
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    v124      = 0.5d0*D_xxxzz
    D_xxyyy   = v42*(v40 + h*v29 + 21.0d0*v20)
    v138      = 0.5d0*D_xxyyy
    v160      = 0.166666666666667d0*D_xxyyy
    D_xxyyz   = v39*(v36 - 945.0d0*v252 + 105.0d0*(v254 + v255))
    v166      = 0.5d0*D_xxyyz
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    v144      = 0.5d0*D_xxyzz
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    v170      = 0.166666666666667d0*D_xxzzz
    v175      = 0.5d0*D_xxzzz
    D_xyyyy   = v34*v43*x
    D_xyyyz   = v41*(h - v7)
    v200      = 0.5d0*D_xyyyz
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    v191      = 0.5d0*D_xyyzz
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    v204      = 0.166666666666667d0*D_xyzzz
    v209      = 0.5d0*D_xyzzz
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    D_yyyyy   = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz   = v39*v43
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    u12       = u6*u6
    u13       = u6*u7
    v44       = u13
    v270      = 315.0d0*v44
    v264      = v270*x
    v45       = 45.0d0*v44
    v52       = v264*y
    v56       = v264*z
    v60       = v265*v270
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    L_xxxxxx  = L_xxxxxx + (D_xxxxxx*M_0)
    D_xxxxxy  = v52*v55
    L_xxxxxy  = L_xxxxxy + (D_xxxxxy*M_0)
    D_xxxxxz  = v55*v56
    L_xxxxxz  = L_xxxxxz + (D_xxxxxz*M_0)
    D_xxxxyy  = v45*(v58 + v17*v29 - 21.0d0*v256 + 14.0d0*v51 + 231.0d0*v59)
    v95       = 0.5d0*D_xxxxyy
    L_xxxxyy  = L_xxxxyy + (D_xxxxyy*M_0)
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    L_xxxxyz  = L_xxxxyz + (D_xxxxyz*M_0)
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    v98       = 0.5d0*D_xxxxzz
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    v106      = 0.5d0*D_xxxyyy
    v119      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy  = L_xxxyyy + (D_xxxyyy*M_0)
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    v122      = 0.5d0*D_xxxyyz
    L_xxxyyz  = L_xxxyyz + (D_xxxyyz*M_0)
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    v109      = 0.5d0*D_xxxyzz
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    v125      = 0.166666666666667d0*D_xxxzzz
    v127      = 0.5d0*D_xxxzzz
    D_xxyyyy  = v45*(v58 + v17*v24 - 21.0d0*v257 + 14.0d0*v65 + 231.0d0*v66)
    v132      = 0.5d0*D_xxyyyy
    v139      = 0.166666666666667d0*D_xxyyyy
    v161      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy  = L_xxyyyy + (D_xxyyyy*M_0)
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    v142      = 0.5d0*D_xxyyyz
    v164      = 0.166666666666667d0*D_xxyyyz
    L_xxyyyz  = L_xxyyyz + (D_xxyyyz*M_0)
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    v135      = 0.5d0*D_xxyyzz
    v167      = 0.25d0*D_xxyyzz
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    v145      = 0.166666666666667d0*D_xxyzzz
    v147      = 0.5d0*D_xxyzzz
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    v171      = 0.0416666666666667d0*D_xxzzzz
    v176      = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy  = v52*v68
    L_xyyyyy  = L_xyyyyy + (D_xyyyyy*M_0)
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    v189      = 0.5d0*D_xyyyyz
    v198      = 0.166666666666667d0*D_xyyyyz
    L_xyyyyz  = L_xyyyyz + (D_xyyyyz*M_0)
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    v184      = 0.5d0*D_xyyyzz
    v201      = 0.25d0*D_xyyyzz
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    v192      = 0.166666666666667d0*D_xyyzzz
    v194      = 0.5d0*D_xyyzzz
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    v205      = 0.0416666666666667d0*D_xyzzzz
    v210      = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    L_yyyyyy  = L_yyyyyy + (D_yyyyyy*M_0)
    D_yyyyyz  = v60*v68
    L_yyyyyz  = L_yyyyyz + (D_yyyyyz*M_0)
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v266      = 315.0d0*v71
    v72       = v266*x
    v75       = v266*y
    v77       = v266*z
    v81       = v265*v269*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = L_xxxxxxx + (D_xxxxxxx*M_0)
    D_xxxxxxy = v75*v76
    L_xxxxxxy = L_xxxxxxy + (D_xxxxxxy*M_0)
    D_xxxxxxz = v76*v77
    L_xxxxxxz = L_xxxxxxz + (D_xxxxxxz*M_0)
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    v84       = 0.5d0*D_xxxxxyy
    L_xxxxxyy = L_xxxxxyy + (D_xxxxxyy*M_0)
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxyz = L_xxxxxyz + (D_xxxxxyz*M_0)
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    v85       = 0.5d0*D_xxxxxzz
    L_xxxxx   = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxxx*v83 + D_xxxxxxy*M_xy + D_xxxxxxz*M_xz + &
      D_xxxxxyz*M_yz + M_yy*v84 + M_zz*v85)
    D_xxxxyyy = -945.0d0*v71*y*(v267 + v1*v18 + v1*v82 - v86)
    v90       = 0.5d0*D_xxxxyyy
    v96       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy = L_xxxxyyy + (D_xxxxyyy*M_0)
    D_xxxxyyz = v77*(-v1*v88 + v80 + v86 + v89)
    v97       = 0.5d0*D_xxxxyyz
    L_xxxxyyz = L_xxxxyyz + (D_xxxxyyz*M_0)
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    v91       = 0.5d0*D_xxxxyzz
    L_xxxxy   = L_xxxxy + (D_xxxxxxy*v83 + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + M_yy*v90 + M_zz*v91)
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    v99       = 0.166666666666667d0*D_xxxxzzz
    v100      = 0.5d0*D_xxxxzzz
    L_xxxx    = L_xxxx + (D_xxxx*M_0 + D_xxxxxx*v83 + D_xxxxxxx*v92 + D_xxxxxxy*v93 + D_xxxxxxz* &
      v94 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + M_xyy*v84 + M_xzz*v85 + M_yy*v95 + M_yyy*v96 + M_yyz*v97 + &
      M_yzz*v91 + M_zz*v98 + M_zzz*v99)
    L_xxxxz   = L_xxxxz + (D_xxxxxxz*v83 + D_xxxxxyz*M_xy + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + M_yy*v97 + M_zz*v100)
    D_xxxyyyy = -v61*v71*(v267 + v0*v103 + v0*v18 - v102)
    v104      = 0.5d0*D_xxxyyyy
    v107      = 0.166666666666667d0*D_xxxyyyy
    v120      = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy = L_xxxyyyy + (D_xxxyyyy*M_0)
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v88))
    v108      = 0.5d0*D_xxxyyyz
    v121      = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyyz = L_xxxyyyz + (D_xxxyyyz*M_0)
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    v105      = 0.5d0*D_xxxyyzz
    v123      = 0.25d0*D_xxxyyzz
    L_xxxyy   = L_xxxyy + (D_xxxxxyy*v83 + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + M_yy*v104 + M_zz*v105)
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    v110      = 0.166666666666667d0*D_xxxyzzz
    v111      = 0.5d0*D_xxxyzzz
    L_xxxy    = L_xxxy + (D_xxxxxxy*v92 + D_xxxxxy*v83 + D_xxxxxyy*v93 + D_xxxxxyz*v94 + D_xxxxyy* &
      M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + M_xyy*v90 + M_xzz*v91 + M_yy*v106 + M_yyy*v107 + M_yyz* &
      v108 + M_yzz*v105 + M_zz*v109 + M_zzz*v110)
    L_xxxyz   = L_xxxyz + (D_xxxxxyz*v83 + D_xxxxyyz*M_xy + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + M_yy*v108 + M_zz*v111)
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    v126      = 0.0416666666666667d0*D_xxxzzzz
    v128      = 0.166666666666667d0*D_xxxzzzz
    L_xxx     = L_xxx + (D_xxx*M_0 + D_xxxxx*v83 + D_xxxxxx*v92 + D_xxxxxxx*v112 + D_xxxxxxy*v113 &
      + D_xxxxxxz*v114 + D_xxxxxy*v93 + D_xxxxxyy*v115 + D_xxxxxyz*v116 &
      + D_xxxxxz*v94 + D_xxxxxzz*v117 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + &
      D_xxxxz*M_xz + D_xxxyz*M_yz + M_xyy*v95 + M_xyyy*v96 + M_xyyz*v97 &
      + M_xyzz*v91 + M_xzz*v98 + M_xzzz*v99 + M_yy*v118 + M_yyy*v119 + &
      M_yyyy*v120 + M_yyyz*v121 + M_yyz*v122 + M_yyzz*v123 + M_yzz*v109 &
      + M_yzzz*v110 + M_zz*v124 + M_zzz*v125 + M_zzzz*v126)
    L_xxxz    = L_xxxz + (D_xxxxxxz*v92 + D_xxxxxyz*v93 + D_xxxxxz*v83 + D_xxxxxzz*v94 + D_xxxxyz* &
      M_xy + D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz* &
      M_0 + M_xyy*v97 + M_xzz*v100 + M_yy*v122 + M_yyy*v121 + M_yyz* &
      v105 + M_yzz*v111 + M_zz*v127 + M_zzz*v128)
    D_xxyyyyy = v75*(-45.0d0*v51 - 30.0d0*v65 + v101 + v129 + v78)
    v130      = 0.5d0*D_xxyyyyy
    v133      = 0.166666666666667d0*D_xxyyyyy
    v140      = 0.0416666666666667d0*D_xxyyyyy
    v162      = 0.00833333333333333d0*D_xxyyyyy
    L_xxyyyyy = L_xxyyyyy + (D_xxyyyyy*M_0)
    D_xxyyyyz = v77*(-v0*v88 + v102 + v129 + v89)
    v134      = 0.5d0*D_xxyyyyz
    v141      = 0.166666666666667d0*D_xxyyyyz
    v163      = 0.0416666666666667d0*D_xxyyyyz
    L_xxyyyyz = L_xxyyyyz + (D_xxyyyyz*M_0)
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    v131      = 0.5d0*D_xxyyyzz
    v143      = 0.25d0*D_xxyyyzz
    v165      = 0.0833333333333333d0*D_xxyyyzz
    v173      = 0.166666666666667d0*D_xxyyyzz
    L_xxyyy   = L_xxyyy + (D_xxxxyyy*v83 + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + M_yy*v130 + M_zz*v131)
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    v136      = 0.166666666666667d0*D_xxyyzzz
    v137      = 0.5d0*D_xxyyzzz
    v168      = 0.0833333333333333d0*D_xxyyzzz
    v174      = 0.25d0*D_xxyyzzz
    L_xxyy    = L_xxyy + (D_xxxxxyy*v92 + D_xxxxyy*v83 + D_xxxxyyy*v93 + D_xxxxyyz*v94 + D_xxxyyy* &
      M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + M_xyy*v104 + M_xzz*v105 + M_yy*v132 + M_yyy*v133 + M_yyz* &
      v134 + M_yzz*v131 + M_zz*v135 + M_zzz*v136)
    L_xxyyz   = L_xxyyz + (D_xxxxyyz*v83 + D_xxxyyyz*M_xy + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + M_yy*v134 + M_zz*v137)
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    v146      = 0.0416666666666667d0*D_xxyzzzz
    v148      = 0.166666666666667d0*D_xxyzzzz
    L_xxy     = L_xxy + (D_xxxxxxy*v112 + D_xxxxxy*v92 + D_xxxxxyy*v113 + D_xxxxxyz*v114 + &
      D_xxxxy*v83 + D_xxxxyy*v93 + D_xxxxyyy*v115 + D_xxxxyyz*v116 + &
      D_xxxxyz*v94 + D_xxxxyzz*v117 + D_xxxyy*M_xy + D_xxxyyz*M_xyz + &
      D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + M_xyy*v106 + M_xyyy* &
      v107 + M_xyyz*v108 + M_xyzz*v105 + M_xzz*v109 + M_xzzz*v110 + &
      M_yy*v138 + M_yyy*v139 + M_yyyy*v140 + M_yyyz*v141 + M_yyz*v142 + &
      M_yyzz*v143 + M_yzz*v135 + M_yzzz*v136 + M_zz*v144 + M_zzz*v145 + &
      M_zzzz*v146)
    L_xxyz    = L_xxyz + (D_xxxxxyz*v92 + D_xxxxyyz*v93 + D_xxxxyz*v83 + D_xxxxyzz*v94 + D_xxxyyz* &
      M_xy + D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz* &
      M_0 + M_xyy*v108 + M_xzz*v111 + M_yy*v142 + M_yyy*v141 + M_yyz* &
      v131 + M_yzz*v137 + M_zz*v147 + M_zzz*v148)
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    v172      = 0.00833333333333333d0*D_xxzzzzz
    v177      = 0.0416666666666667d0*D_xxzzzzz
    L_xx      = L_xx + (D_xx*M_0 + D_xxxx*v83 + D_xxxxx*v92 + D_xxxxxx*v112 + D_xxxxxxx*v149 + &
      D_xxxxxxy*v150 + D_xxxxxxz*v151 + D_xxxxxy*v113 + D_xxxxxyy*v152 &
      + D_xxxxxyz*v153 + D_xxxxxz*v114 + D_xxxxxzz*v154 + D_xxxxy*v93 + &
      D_xxxxyy*v115 + D_xxxxyyy*v155 + D_xxxxyyz*v156 + D_xxxxyz*v116 + &
      D_xxxxyzz*v157 + D_xxxxz*v94 + D_xxxxzz*v117 + D_xxxxzzz*v158 + &
      D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + M_xyy* &
      v118 + M_xyyy*v119 + M_xyyyy*v120 + M_xyyyz*v121 + M_xyyz*v122 + &
      M_xyyzz*v123 + M_xyzz*v109 + M_xyzzz*v110 + M_xzz*v124 + M_xzzz* &
      v125 + M_xzzzz*v126 + M_yy*v159 + M_yyy*v160 + M_yyyy*v161 + &
      M_yyyyy*v162 + M_yyyyz*v163 + M_yyyz*v164 + M_yyyzz*v165 + M_yyz* &
      v166 + M_yyzz*v167 + M_yyzzz*v168 + M_yzz*v144 + M_yzzz*v145 + &
      M_yzzzz*v146 + M_zz*v169 + M_zzz*v170 + M_zzzz*v171 + M_zzzzz* &
      v172)
    L_xxz     = L_xxz + (D_xxxxxxz*v112 + D_xxxxxyz*v113 + D_xxxxxz*v92 + D_xxxxxzz*v114 + &
      D_xxxxyyz*v115 + D_xxxxyz*v93 + D_xxxxyzz*v116 + D_xxxxz*v83 + &
      D_xxxxzz*v94 + D_xxxxzzz*v117 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + &
      D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + M_xyy*v122 + M_xyyy* &
      v121 + M_xyyz*v105 + M_xyzz*v111 + M_xzz*v127 + M_xzzz*v128 + &
      M_yy*v166 + M_yyy*v164 + M_yyyy*v163 + M_yyyz*v173 + M_yyz*v135 + &
      M_yyzz*v174 + M_yzz*v147 + M_yzzz*v148 + M_zz*v175 + M_zzz*v176 + &
      M_zzzz*v177)
    D_xyyyyyy = v179*v72
    L_xyyyyyy = L_xyyyyyy + (D_xyyyyyy*M_0)
    D_xyyyyyz = v81*(v36 - v103 + 110.0d0*v32)
    v183      = 0.5d0*D_xyyyyyz
    v188      = 0.166666666666667d0*D_xyyyyyz
    v197      = 0.0416666666666667d0*D_xyyyyyz
    L_xyyyyyz = L_xyyyyyz + (D_xyyyyyz*M_0)
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    v181      = 0.5d0*D_xyyyyzz
    v190      = 0.25d0*D_xyyyyzz
    v199      = 0.0833333333333333d0*D_xyyyyzz
    v207      = 0.166666666666667d0*D_xyyyyzz
    L_xyyyy   = L_xyyyy + (D_xxxyyyy*v83 + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyy*v180 + D_xyyyyyz*M_yz + M_zz*v181)
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    v185      = 0.166666666666667d0*D_xyyyzzz
    v186      = 0.5d0*D_xyyyzzz
    v202      = 0.0833333333333333d0*D_xyyyzzz
    v208      = 0.25d0*D_xyyyzzz
    L_xyyy    = L_xyyy + (D_xxxxyyy*v92 + D_xxxyyy*v83 + D_xxxyyyy*v93 + D_xxxyyyz*v94 + D_xxyyyy* &
      M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy* &
      v180 + D_xyyyyyy*v182 + D_xyyyyz*M_yz + M_xyy*v130 + M_xzz*v131 + &
      M_yyz*v183 + M_yzz*v181 + M_zz*v184 + M_zzz*v185)
    L_xyyyz   = L_xyyyz + (D_xxxyyyz*v83 + D_xxyyyyz*M_xy + D_xxyyyzz*M_xz + D_xyyyyyz*v180 + &
      D_xyyyyzz*M_yz + D_xyyyz*M_0 + M_zz*v186)
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    v193      = 0.0416666666666667d0*D_xyyzzzz
    v195      = 0.166666666666667d0*D_xyyzzzz
    L_xyy     = L_xyy + (D_xxxxxyy*v112 + D_xxxxyy*v92 + D_xxxxyyy*v113 + D_xxxxyyz*v114 + &
      D_xxxyy*v83 + D_xxxyyy*v93 + D_xxxyyyy*v115 + D_xxxyyyz*v116 + &
      D_xxxyyz*v94 + D_xxxyyzz*v117 + D_xxyyy*M_xy + D_xxyyyz*M_xyz + &
      D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v180 + D_xyyyyy*v182 + &
      D_xyyyyyy*v187 + D_xyyyz*M_yz + M_xyy*v132 + M_xyyy*v133 + M_xyyz &
      *v134 + M_xyzz*v131 + M_xzz*v135 + M_xzzz*v136 + M_yyyz*v188 + &
      M_yyz*v189 + M_yyzz*v190 + M_yzz*v184 + M_yzzz*v185 + M_zz*v191 + &
      M_zzz*v192 + M_zzzz*v193)
    L_xyyz    = L_xyyz + (D_xxxxyyz*v92 + D_xxxyyyz*v93 + D_xxxyyz*v83 + D_xxxyyzz*v94 + D_xxyyyz* &
      M_xy + D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyz*v182 + &
      D_xyyyyz*v180 + D_xyyyzz*M_yz + D_xyyz*M_0 + M_xyy*v134 + M_xzz* &
      v137 + M_yyz*v181 + M_yzz*v186 + M_zz*v194 + M_zzz*v195)
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    v206      = 0.00833333333333333d0*D_xyzzzzz
    v211      = 0.0416666666666667d0*D_xyzzzzz
    L_xy      = L_xy + (D_xxxxxxy*v149 + D_xxxxxy*v112 + D_xxxxxyy*v150 + D_xxxxxyz*v151 + &
      D_xxxxy*v92 + D_xxxxyy*v113 + D_xxxxyyy*v152 + D_xxxxyyz*v153 + &
      D_xxxxyz*v114 + D_xxxxyzz*v154 + D_xxxy*v83 + D_xxxyy*v93 + &
      D_xxxyyy*v115 + D_xxxyyyy*v155 + D_xxxyyyz*v156 + D_xxxyyz*v116 + &
      D_xxxyyzz*v157 + D_xxxyz*v94 + D_xxxyzz*v117 + D_xxxyzzz*v158 + &
      D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy* &
      v180 + D_xyyyy*v182 + D_xyyyyy*v187 + D_xyyyyyy*v196 + D_xyyz* &
      M_yz + M_xyy*v138 + M_xyyy*v139 + M_xyyyy*v140 + M_xyyyz*v141 + &
      M_xyyz*v142 + M_xyyzz*v143 + M_xyzz*v135 + M_xyzzz*v136 + M_xzz* &
      v144 + M_xzzz*v145 + M_xzzzz*v146 + M_yyyyz*v197 + M_yyyz*v198 + &
      M_yyyzz*v199 + M_yyz*v200 + M_yyzz*v201 + M_yyzzz*v202 + M_yzz* &
      v191 + M_yzzz*v192 + M_yzzzz*v193 + M_zz*v203 + M_zzz*v204 + &
      M_zzzz*v205 + M_zzzzz*v206)
    L_xyz     = L_xyz + (D_xxxxxyz*v112 + D_xxxxyyz*v113 + D_xxxxyz*v92 + D_xxxxyzz*v114 + &
      D_xxxyyyz*v115 + D_xxxyyz*v93 + D_xxxyyzz*v116 + D_xxxyz*v83 + &
      D_xxxyzz*v94 + D_xxxyzzz*v117 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + &
      D_xxyzz*M_xz + D_xyyyyyz*v187 + D_xyyyyz*v182 + D_xyyyz*v180 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v142 + M_xyyy*v141 + M_xyyz*v131 &
      + M_xyzz*v137 + M_xzz*v147 + M_xzzz*v148 + M_yyyz*v207 + M_yyz* &
      v184 + M_yyzz*v208 + M_yzz*v194 + M_yzzz*v195 + M_zz*v209 + M_zzz &
      *v210 + M_zzzz*v211)
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    L_x       = L_x + (D_x*M_0 + D_xxx*v83 + D_xxxx*v92 + D_xxxxx*v112 + D_xxxxxx*v149 + &
      D_xxxxxxx*v212 + D_xxxxxxy*v213 + D_xxxxxxz*v214 + D_xxxxxy*v150 &
      + D_xxxxxyy*v215 + D_xxxxxyz*v216 + D_xxxxxz*v151 + D_xxxxxzz* &
      v217 + D_xxxxy*v113 + D_xxxxyy*v152 + D_xxxxyyy*v218 + D_xxxxyyz* &
      v219 + D_xxxxyz*v153 + D_xxxxyzz*v220 + D_xxxxz*v114 + D_xxxxzz* &
      v154 + D_xxxxzzz*v221 + D_xxxy*v93 + D_xxxyy*v115 + D_xxxyyy*v155 &
      + D_xxxyyyy*v222 + D_xxxyyyz*v223 + D_xxxyyz*v156 + D_xxxyyzz* &
      v224 + D_xxxyz*v116 + D_xxxyzz*v157 + D_xxxyzzz*v225 + D_xxxz*v94 &
      + D_xxxzz*v117 + D_xxxzzz*v158 + D_xxxzzzz*v226 + D_xxy*M_xy + &
      D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v180 + D_xyyy*v182 + D_xyyyy* &
      v187 + D_xyyyyy*v196 + D_xyyyyyy*v227 + D_xyyyyyz*v228 + D_xyyyyz &
      *v229 + D_xyyyyzz*v230 + D_xyyyz*v231 + D_xyyyzz*v232 + D_xyyyzzz &
      *v233 + D_xyyz*v234 + D_xyyzz*v235 + D_xyyzzz*v236 + D_xyyzzzz* &
      v237 + D_xyz*M_yz + D_xzz*v238 + D_xzzz*v239 + D_xzzzz*v240 + &
      D_xzzzzz*v241 + D_xzzzzzz*v242 + M_xyy*v159 + M_xyyy*v160 + &
      M_xyyyy*v161 + M_xyyyyy*v162 + M_xyyyyz*v163 + M_xyyyz*v164 + &
      M_xyyyzz*v165 + M_xyyz*v166 + M_xyyzz*v167 + M_xyyzzz*v168 + &
      M_xyzz*v144 + M_xyzzz*v145 + M_xyzzzz*v146 + M_xzz*v169 + M_xzzz* &
      v170 + M_xzzzz*v171 + M_xzzzzz*v172 + M_yzz*v203 + M_yzzz*v204 + &
      M_yzzzz*v205 + M_yzzzzz*v206)
    L_xz      = L_xz + (D_xxxxxxz*v149 + D_xxxxxyz*v150 + D_xxxxxz*v112 + D_xxxxxzz*v151 + &
      D_xxxxyyz*v152 + D_xxxxyz*v113 + D_xxxxyzz*v153 + D_xxxxz*v92 + &
      D_xxxxzz*v114 + D_xxxxzzz*v154 + D_xxxyyyz*v155 + D_xxxyyz*v115 + &
      D_xxxyyzz*v156 + D_xxxyz*v93 + D_xxxyzz*v116 + D_xxxyzzz*v157 + &
      D_xxxz*v83 + D_xxxzz*v94 + D_xxxzzz*v117 + D_xxxzzzz*v158 + &
      D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyyyz*v196 + &
      D_xyyyyz*v187 + D_xyyyyzz*v229 + D_xyyyz*v182 + D_xyyyzz*v231 + &
      D_xyyyzzz*v232 + D_xyyz*v180 + D_xyyzz*v234 + D_xyyzzz*v235 + &
      D_xyyzzzz*v236 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v238 + D_xzzzz* &
      v239 + D_xzzzzz*v240 + D_xzzzzzz*v241 + M_xyy*v166 + M_xyyy*v164 &
      + M_xyyyy*v163 + M_xyyyz*v173 + M_xyyz*v135 + M_xyyzz*v174 + &
      M_xyzz*v147 + M_xyzzz*v148 + M_xzz*v175 + M_xzzz*v176 + M_xzzzz* &
      v177 + M_yzz*v209 + M_yzzz*v210 + M_yzzzz*v211)
    D_yyyyyyy = v75*(v178 + v73 - 315.0d0*v65 + 693.0d0*v70)
    L_yyyyyyy = L_yyyyyyy + (D_yyyyyyy*M_0)
    D_yyyyyyz = v179*v77
    L_yyyyyyz = L_yyyyyyz + (D_yyyyyyz*M_0)
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    L_yyyyy   = L_yyyyy + (D_xxyyyyy*v83 + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + D_yyyyy*M_0 + &
      D_yyyyyyy*v180 + D_yyyyyyz*M_yz + D_yyyyyzz*v238)
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    L_yyyy    = L_yyyy + (D_xxxyyyy*v92 + D_xxyyyy*v83 + D_xxyyyyy*v93 + D_xxyyyyz*v94 + D_xyyyyy* &
      M_xy + D_xyyyyyy*v243 + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy* &
      M_0 + D_yyyyyy*v180 + D_yyyyyyy*v182 + D_yyyyyyz*v234 + D_yyyyyz* &
      M_yz + D_yyyyyzz*v244 + D_yyyyzz*v238 + D_yyyyzzz*v239 + M_xzz* &
      v181)
    L_yyyyz   = L_yyyyz + (D_xxyyyyz*v83 + D_xyyyyyz*M_xy + D_xyyyyzz*M_xz + D_yyyyyyz*v180 + &
      D_yyyyyzz*M_yz + D_yyyyz*M_0 + D_yyyyzzz*v238)
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    L_yyy     = L_yyy + (D_xxxxyyy*v112 + D_xxxyyy*v92 + D_xxxyyyy*v113 + D_xxxyyyz*v114 + &
      D_xxyyy*v83 + D_xxyyyy*v93 + D_xxyyyyy*v115 + D_xxyyyyz*v116 + &
      D_xxyyyz*v94 + D_xxyyyzz*v117 + D_xyyyy*M_xy + D_xyyyyy*v243 + &
      D_xyyyyyy*v245 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v180 + D_yyyyyy*v182 + D_yyyyyyy*v187 + D_yyyyyyz*v231 + &
      D_yyyyyz*v234 + D_yyyyyzz*v235 + D_yyyyz*M_yz + D_yyyyzz*v244 + &
      D_yyyyzzz*v246 + D_yyyzz*v238 + D_yyyzzz*v239 + D_yyyzzzz*v240 + &
      M_xyyz*v183 + M_xyzz*v181 + M_xzz*v184 + M_xzzz*v185)
    L_yyyz    = L_yyyz + (D_xxxyyyz*v92 + D_xxyyyyz*v93 + D_xxyyyz*v83 + D_xxyyyzz*v94 + D_xyyyyyz &
      *v243 + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz + &
      D_yyyyyyz*v182 + D_yyyyyz*v180 + D_yyyyyzz*v234 + D_yyyyzz*M_yz + &
      D_yyyyzzz*v244 + D_yyyz*M_0 + D_yyyzzz*v238 + D_yyyzzzz*v239 + &
      M_xzz*v186)
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    L_yy      = L_yy + (D_xxxxxyy*v149 + D_xxxxyy*v112 + D_xxxxyyy*v150 + D_xxxxyyz*v151 + &
      D_xxxyy*v92 + D_xxxyyy*v113 + D_xxxyyyy*v152 + D_xxxyyyz*v153 + &
      D_xxxyyz*v114 + D_xxxyyzz*v154 + D_xxyy*v83 + D_xxyyy*v93 + &
      D_xxyyyy*v115 + D_xxyyyyy*v155 + D_xxyyyyz*v156 + D_xxyyyz*v116 + &
      D_xxyyyzz*v157 + D_xxyyz*v94 + D_xxyyzz*v117 + D_xxyyzzz*v158 + &
      D_xyyy*M_xy + D_xyyyy*v243 + D_xyyyyy*v245 + D_xyyyyyy*v247 + &
      D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v180 + D_yyyyy* &
      v182 + D_yyyyyy*v187 + D_yyyyyyy*v196 + D_yyyyyyz*v229 + D_yyyyyz &
      *v231 + D_yyyyyzz*v232 + D_yyyyz*v234 + D_yyyyzz*v235 + D_yyyyzzz &
      *v236 + D_yyyz*M_yz + D_yyyzz*v244 + D_yyyzzz*v246 + D_yyyzzzz* &
      v248 + D_yyzz*v238 + D_yyzzz*v239 + D_yyzzzz*v240 + D_yyzzzzz* &
      v241 + M_xyyyz*v188 + M_xyyz*v189 + M_xyyzz*v190 + M_xyzz*v184 + &
      M_xyzzz*v185 + M_xzz*v191 + M_xzzz*v192 + M_xzzzz*v193)
    L_yyz     = L_yyz + (D_xxxxyyz*v112 + D_xxxyyyz*v113 + D_xxxyyz*v92 + D_xxxyyzz*v114 + &
      D_xxyyyyz*v115 + D_xxyyyz*v93 + D_xxyyyzz*v116 + D_xxyyz*v83 + &
      D_xxyyzz*v94 + D_xxyyzzz*v117 + D_xyyyyyz*v245 + D_xyyyyz*v243 + &
      D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyz*v187 + &
      D_yyyyyz*v182 + D_yyyyyzz*v231 + D_yyyyz*v180 + D_yyyyzz*v234 + &
      D_yyyyzzz*v235 + D_yyyzz*M_yz + D_yyyzzz*v244 + D_yyyzzzz*v246 + &
      D_yyz*M_0 + D_yyzzz*v238 + D_yyzzzz*v239 + D_yyzzzzz*v240 + &
      M_xyyz*v181 + M_xyzz*v186 + M_xzz*v194 + M_xzzz*v195)
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    L_y       = L_y + (D_xxxxxxy*v212 + D_xxxxxy*v149 + D_xxxxxyy*v213 + D_xxxxxyz*v214 + &
      D_xxxxy*v112 + D_xxxxyy*v150 + D_xxxxyyy*v215 + D_xxxxyyz*v216 + &
      D_xxxxyz*v151 + D_xxxxyzz*v217 + D_xxxy*v92 + D_xxxyy*v113 + &
      D_xxxyyy*v152 + D_xxxyyyy*v218 + D_xxxyyyz*v219 + D_xxxyyz*v153 + &
      D_xxxyyzz*v220 + D_xxxyz*v114 + D_xxxyzz*v154 + D_xxxyzzz*v221 + &
      D_xxy*v83 + D_xxyy*v93 + D_xxyyy*v115 + D_xxyyyy*v155 + D_xxyyyyy &
      *v222 + D_xxyyyyz*v223 + D_xxyyyz*v156 + D_xxyyyzz*v224 + D_xxyyz &
      *v116 + D_xxyyzz*v157 + D_xxyyzzz*v225 + D_xxyz*v94 + D_xxyzz* &
      v117 + D_xxyzzz*v158 + D_xxyzzzz*v226 + D_xyy*M_xy + D_xyyy*v243 &
      + D_xyyyy*v245 + D_xyyyyy*v247 + D_xyyyyyy*v249 + D_xyyz*M_xyz + &
      D_xyz*M_xz + D_y*M_0 + D_yyy*v180 + D_yyyy*v182 + D_yyyyy*v187 + &
      D_yyyyyy*v196 + D_yyyyyyy*v227 + D_yyyyyyz*v228 + D_yyyyyz*v229 + &
      D_yyyyyzz*v230 + D_yyyyz*v231 + D_yyyyzz*v232 + D_yyyyzzz*v233 + &
      D_yyyz*v234 + D_yyyzz*v235 + D_yyyzzz*v236 + D_yyyzzzz*v237 + &
      D_yyz*M_yz + D_yyzz*v244 + D_yyzzz*v246 + D_yyzzzz*v248 + &
      D_yyzzzzz*v250 + D_yzz*v238 + D_yzzz*v239 + D_yzzzz*v240 + &
      D_yzzzzz*v241 + D_yzzzzzz*v242 + M_xyyyyz*v197 + M_xyyyz*v198 + &
      M_xyyyzz*v199 + M_xyyz*v200 + M_xyyzz*v201 + M_xyyzzz*v202 + &
      M_xyzz*v191 + M_xyzzz*v192 + M_xyzzzz*v193 + M_xzz*v203 + M_xzzz* &
      v204 + M_xzzzz*v205 + M_xzzzzz*v206)
    L_yz      = L_yz + (D_xxxxxyz*v149 + D_xxxxyyz*v150 + D_xxxxyz*v112 + D_xxxxyzz*v151 + &
      D_xxxyyyz*v152 + D_xxxyyz*v113 + D_xxxyyzz*v153 + D_xxxyz*v92 + &
      D_xxxyzz*v114 + D_xxxyzzz*v154 + D_xxyyyyz*v155 + D_xxyyyz*v115 + &
      D_xxyyyzz*v156 + D_xxyyz*v93 + D_xxyyzz*v116 + D_xxyyzzz*v157 + &
      D_xxyz*v83 + D_xxyzz*v94 + D_xxyzzz*v117 + D_xxyzzzz*v158 + &
      D_xyyyyyz*v247 + D_xyyyyz*v245 + D_xyyyz*v243 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyyyz*v196 + D_yyyyyz*v187 + &
      D_yyyyyzz*v229 + D_yyyyz*v182 + D_yyyyzz*v231 + D_yyyyzzz*v232 + &
      D_yyyz*v180 + D_yyyzz*v234 + D_yyyzzz*v235 + D_yyyzzzz*v236 + &
      D_yyzz*M_yz + D_yyzzz*v244 + D_yyzzzz*v246 + D_yyzzzzz*v248 + &
      D_yz*M_0 + D_yzzz*v238 + D_yzzzz*v239 + D_yzzzzz*v240 + D_yzzzzzz &
      *v241 + M_xyyyz*v207 + M_xyyz*v184 + M_xyyzz*v208 + M_xyzz*v194 + &
      M_xyzzz*v195 + M_xzz*v209 + M_xzzz*v210 + M_xzzzz*v211)
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_z       = L_z + (0.00833333333333333d0*(30.0d0*D_xyyzzz*M_xyyzz + 10.0d0*D_xyyzzzz* &
      M_xyyzzz + 60.0d0*D_xzzz*M_xzz + D_xzzzzzz*M_xzzzzz + 5.0d0*( &
      D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + 20.0d0*(D_xyyyzz*M_xyyyz &
      + D_xzzzz*M_xzzz)) + D_xxxxxxz*v212 + D_xxxxxyz*v213 + D_xxxxxz* &
      v149 + D_xxxxxzz*v214 + D_xxxxyyz*v215 + D_xxxxyz*v150 + &
      D_xxxxyzz*v216 + D_xxxxz*v112 + D_xxxxzz*v151 + D_xxxxzzz*v217 + &
      D_xxxyyyz*v218 + D_xxxyyz*v152 + D_xxxyyzz*v219 + D_xxxyz*v113 + &
      D_xxxyzz*v153 + D_xxxyzzz*v220 + D_xxxz*v92 + D_xxxzz*v114 + &
      D_xxxzzz*v154 + D_xxxzzzz*v221 + D_xxyyyyz*v222 + D_xxyyyz*v155 + &
      D_xxyyyzz*v223 + D_xxyyz*v115 + D_xxyyzz*v156 + D_xxyyzzz*v224 + &
      D_xxyz*v93 + D_xxyzz*v116 + D_xxyzzz*v157 + D_xxyzzzz*v225 + &
      D_xxz*v83 + D_xxzz*v94 + D_xxzzz*v117 + D_xxzzzz*v158 + D_xxzzzzz &
      *v226 + D_xyyyyyz*v249 + D_xyyyyz*v247 + D_xyyyz*v245 + D_xyyz* &
      v243 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyyyyz*v227 + &
      D_yyyyyz*v196 + D_yyyyyzz*v228 + D_yyyyz*v187 + D_yyyyzz*v229 + &
      D_yyyyzzz*v230 + D_yyyz*v182 + D_yyyzz*v231 + D_yyyzzz*v232 + &
      D_yyyzzzz*v233 + D_yyz*v180 + D_yyzz*v234 + D_yyzzz*v235 + &
      D_yyzzzz*v236 + D_yyzzzzz*v237 + D_yzz*M_yz + D_yzzz*v244 + &
      D_yzzzz*v246 + D_yzzzzz*v248 + D_yzzzzzz*v250 + D_z*M_0 + D_zzz* &
      v238 + D_zzzz*v239 + D_zzzzz*v240 + D_zzzzzz*v241 + D_zzzzzzz* &
      v242 + M_xyyyzz*v202 + M_xyyz*v191 + M_xyzz*v209 + M_xyzzz*v210 + &
      M_xyzzzz*v211)
#undef  x                   
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  L_x                 
#undef  M_xx                
#undef  L_y                 
#undef  M_xy                
#undef  L_z                 
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
#undef  M_xxxz              
#undef  L_xxxx              
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
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxz             
#undef  L_xxxxy             
#undef  M_xxxyy             
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
#undef  M_xxxxxx            
#undef  L_yyyyz             
#undef  M_xxxxxy            
#undef  L_xxxxxx            
#undef  M_xxxxxz            
#undef  L_xxxxxy            
#undef  M_xxxxyy            
#undef  L_xxxxxz            
#undef  M_xxxxyz            
#undef  M_xxxyyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  M_xxyyyy            
#undef  L_xxxyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_yyyyyy            
#undef  L_xyyyyz            
#undef  M_yyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  L_xxyyyyz           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
    end subroutine mom_es_M2L_add
    
! OPS  577*ADD + 2*DIV + 664*MUL + 56*NEG + POW = 1300  (3673 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
                v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46,&
                v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57,&
                v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68,&
                v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8,&
                v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90,&
                v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz,&
                L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz,&
                L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz,&
                L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz,&
                L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz,&
                L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz, L_xxxyyzz,&
                L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz, L_xxyzzzz,&
                L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz, L_xyzzzzz,&
                L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz, L_yyzzzzz,&
                L_yzzzzzz, L_zzzzzzz
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
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define Ls_xxz               Ls(10)
#define L_xyy                L(11)
#define Ls_xyy               Ls(11)
#define Ls_xyz               Ls(12)
#define L_xyz                L(12)
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
#define Ls_xxxxxxx           Ls(48)
#define L_xxxxxxx            L(48)
#define Ls_xxxxxxy           Ls(49)
#define L_xxxxxxy            L(49)
#define Ls_xxxxxxz           Ls(50)
#define L_xxxxxxz            L(50)
#define Ls_xxxxxyy           Ls(51)
#define L_xxxxxyy            L(51)
#define Ls_xxxxxyz           Ls(52)
#define L_xxxxxyz            L(52)
#define L_xxxxyyy            L(53)
#define Ls_xxxxyyy           Ls(53)
#define Ls_xxxxyyz           Ls(54)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define Ls_xxxyyyy           Ls(55)
#define Ls_xxxyyyz           Ls(56)
#define L_xxxyyyz            L(56)
#define Ls_xxyyyyy           Ls(57)
#define L_xxyyyyy            L(57)
#define Ls_xxyyyyz           Ls(58)
#define L_xxyyyyz            L(58)
#define Ls_xyyyyyy           Ls(59)
#define L_xyyyyyy            L(59)
#define L_xyyyyyz            L(60)
#define Ls_xyyyyyz           Ls(60)
#define Ls_yyyyyyy           Ls(61)
#define L_yyyyyyy            L(61)
#define Ls_yyyyyyz           Ls(62)
#define L_yyyyyyz            L(62)
    v0         = L_xxxxxx + L_xxxxxxy*y + L_xxxxxxz*z
    v1         = L_xxxxxy + L_xxxxxyz*z
    v2         = L_xxxxxyy*y + v1
    v3         = L_xxxxyy + L_xxxxyyz*z
    v4         = L_xxxxyyy*y + v3
    v5         = L_xxxyyy + L_xxxyyyz*z
    v6         = L_xxxyyyy*y + v5
    v7         = L_xxyyyy + L_xxyyyyz*z
    v8         = L_xxyyyyy*y + v7
    v9         = L_xyyyyy + L_xyyyyyz*z
    v10        = L_xyyyyyy*y + v9
    v11        = L_yyyyyy + L_yyyyyyz*z
    v12        = L_xxxxxz*z
    v19        = v1*y
    v21        = L_xxxxyz*z
    v24        = v3*y
    v27        = L_xxxxz*z
    v38        = 0.5d0*x
    v44        = L_xxxyyz*z
    v47        = v5*y
    v50        = L_xxxyz*z
    v61        = L_xxxz*z
    v75        = 0.166666666666667d0*x
    v85        = L_xxyyyz*z
    v88        = v7*y
    v91        = L_xxyyz*z
    v102       = L_xxyz*z
    v118       = L_xxz*z
    v134       = 0.0416666666666667d0*x
    v146       = L_xyyyyz*z
    v149       = v9*y
    v152       = L_xyyyz*z
    v163       = L_xyyz*z
    v179       = L_xyz*z
    v211       = 0.00833333333333333d0*y
    v215       = 0.00833333333333333d0*x
    v225       = L_yyyyyz*z
    v228       = L_yyyyz*z
    v230       = 0.5d0*y
    v234       = L_yyyz*z
    v237       = 0.166666666666667d0*y
    v243       = L_yyz*z
    v247       = 0.0416666666666667d0*y
    Ls_xxxxxx  = Ls_xxxxxx + (L_xxxxxxx*x + v0)
    Ls_xxxxxy  = Ls_xxxxxy + (L_xxxxxxy*x + v2)
    Ls_xxxxyy  = Ls_xxxxyy + (L_xxxxxyy*x + v4)
    Ls_xxxyyy  = Ls_xxxyyy + (L_xxxxyyy*x + v6)
    Ls_xxyyyy  = Ls_xxyyyy + (L_xxxyyyy*x + v8)
    Ls_xyyyyy  = Ls_xyyyyy + (L_xxyyyyy*x + v10)
    Ls_yyyyyy  = Ls_yyyyyy + (v11 + L_xyyyyyy*x + L_yyyyyyy*y)
    Ls_xxxxxxx = Ls_xxxxxxx + (L_xxxxxxx)
    Ls_xxxxxxy = Ls_xxxxxxy + (L_xxxxxxy)
    Ls_xxxxxxz = Ls_xxxxxxz + (L_xxxxxxz)
    Ls_xxxxxyy = Ls_xxxxxyy + (L_xxxxxyy)
    Ls_xxxxxyz = Ls_xxxxxyz + (L_xxxxxyz)
    Ls_xxxxyyy = Ls_xxxxyyy + (L_xxxxyyy)
    Ls_xxxxyyz = Ls_xxxxyyz + (L_xxxxyyz)
    Ls_xxxyyyy = Ls_xxxyyyy + (L_xxxyyyy)
    Ls_xxxyyyz = Ls_xxxyyyz + (L_xxxyyyz)
    Ls_xxyyyyy = Ls_xxyyyyy + (L_xxyyyyy)
    Ls_xxyyyyz = Ls_xxyyyyz + (L_xxyyyyz)
    Ls_xyyyyyy = Ls_xyyyyyy + (L_xyyyyyy)
    Ls_xyyyyyz = Ls_xyyyyyz + (L_xyyyyyz)
    Ls_yyyyyyy = Ls_yyyyyyy + (L_yyyyyyy)
    Ls_yyyyyyz = Ls_yyyyyyz + (L_yyyyyyz)
    L_zz       = -(L_xx + L_yy)
    L_xzz      = -(L_xxx + L_xyy)
    v217       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v257       = L_yzz*z
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    v137       = L_xxzz*z
    L_xyzz     = -(L_xxxy + L_xyyy)
    v190       = L_xyzz*z
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    v251       = L_yyzz*z
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    v78        = L_xxxzz*z
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    v111       = L_xxyzz*z
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    v172       = L_xyyzz*z
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    v240       = L_yyyzz*z
    L_yyzzz    = -(L_xxyyz + L_yyyyz)
    L_yzzzz    = -(L_xxyzz + L_yyyzz)
    L_zzzzz    = -(L_xxzzz + L_yyzzz)
    L_xxxxzz   = -(L_xxxxxx + L_xxxxyy)
    v40        = L_xxxxzz*z
    L_xxxyzz   = -(L_xxxxxy + L_xxxyyy)
    v57        = L_xxxyzz*z
    L_xxxzzz   = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz   = -(L_xxxxyy + L_xxyyyy)
    v98        = L_xxyyzz*z
    L_xxyzzz   = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz   = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz   = -(L_xxxyyy + L_xyyyyy)
    v159       = L_xyyyzz*z
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    v232       = L_yyyyzz*z
    L_yyyzzz   = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz   = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz   = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz   = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz  = -(L_xxxxxxx + L_xxxxxyy)
    v20        = L_xxxxxz + L_xxxxxyz*y + L_xxxxxzz*z
    Ls_xxxxxz  = Ls_xxxxxz + (L_xxxxxxz*x + v20)
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    v25        = L_xxxxyz + L_xxxxyzz*z
    v26        = L_xxxxyyz*y + v25
    v43        = v25*y
    Ls_xxxxyz  = Ls_xxxxyz + (L_xxxxxyz*x + v26)
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    v48        = L_xxxyyz + L_xxxyyzz*z
    v49        = L_xxxyyyz*y + v48
    v60        = v48*y
    Ls_xxxyyz  = Ls_xxxyyz + (L_xxxxyyz*x + v49)
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    v89        = L_xxyyyz + L_xxyyyzz*z
    v90        = L_xxyyyyz*y + v89
    v101       = v89*y
    Ls_xxyyyz  = Ls_xxyyyz + (L_xxxyyyz*x + v90)
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    v150       = L_xyyyyz + L_xyyyyzz*z
    v151       = L_xyyyyyz*y + v150
    v162       = v150*y
    Ls_xyyyyz  = Ls_xyyyyz + (L_xxyyyyz*x + v151)
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    v227       = L_yyyyyz + L_yyyyyzz*z
    Ls_yyyyyz  = Ls_yyyyyz + (v227 + L_xyyyyyz*x + L_yyyyyyz*y)
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v13        = a2
    v14        = 0.5d0*v13
    v74        = 0.25d0*v13
    v133       = 0.0833333333333333d0*v13
    v214       = 0.0208333333333333d0*v13
    a3         = a1*a2
    v28        = a3
    v29        = 0.166666666666667d0*v28
    v132       = 0.0833333333333333d0*v28
    v213       = 0.0277777777777778d0*v28
    a4         = a2*a2
    v62        = a4
    v63        = 0.0416666666666667d0*v62
    v210       = 0.0208333333333333d0*v62
    a5         = a2*a3
    v119       = 0.00833333333333333d0*a5
    a6         = a3*a3
    v199       = 0.00138888888888889d0*a6
    a7         = a3*a4
    b2         = b1*b1
    v15        = b2
    v16        = L_xxxxxyy*v15
    v22        = L_xxxxyyy*v15
    v35        = 0.5d0*v15
    v41        = L_xxxxyyz*v15
    v45        = L_xxxyyyy*v15
    v58        = L_xxxyyyz*v15
    v76        = 3.0d0*v15
    v86        = L_xxyyyyy*v15
    v99        = L_xxyyyyz*v15
    v147       = L_xyyyyyy*v15
    v160       = L_xyyyyyz*v15
    v209       = 0.0208333333333333d0*v15
    v236       = 0.25d0*v15
    v246       = 0.0833333333333333d0*v15
    b3         = b1*b2
    v30        = b3
    v31        = L_xxxxyyy*v30
    v51        = L_xxxyyyy*v30
    v70        = 0.166666666666667d0*v30
    v79        = L_xxxyyyz*v30
    v92        = L_xxyyyyy*v30
    v112       = L_xxyyyyz*v30
    v135       = 4.0d0*v30
    v153       = L_xyyyyyy*v30
    v173       = L_xyyyyyz*v30
    v208       = 0.0277777777777778d0*v30
    v245       = 0.0833333333333333d0*v30
    b4         = b2*b2
    v64        = b4
    v65        = L_xxxyyyy*v64
    v103       = L_xxyyyyy*v64
    v127       = 0.0416666666666667d0*v64
    v138       = L_xxyyyyz*v64
    v164       = L_xyyyyyy*v64
    v191       = L_xyyyyyz*v64
    v207       = 0.0208333333333333d0*v64
    v216       = 5.0d0*v64
    b5         = b2*b3
    v120       = b5
    v121       = L_xxyyyyy*v120
    v180       = L_xyyyyyy*v120
    v206       = 0.00833333333333333d0*v120
    v218       = L_xyyyyyz*v120
    b6         = b3*b3
    v200       = 0.00138888888888889d0*b6
    b7         = b3*b4
    c2         = c1*c1
    v17        = c2
    v201       = 0.5d0*v17
    v238       = 3.0d0*v17
    v248       = 12.0d0*v17
    v254       = 60.0d0*v17
    v122       = L_xxzz*v17
    v181       = L_xyzz*v17
    v66        = L_xxxzz*v17
    v104       = L_xxyzz*v17
    v139       = L_xxzzz*v17
    v165       = L_xyyzz*v17
    v192       = L_xyzzz*v17
    v32        = L_xxxxzz*v17
    v52        = L_xxxyzz*v17
    v80        = L_xxxzzz*v17
    v93        = L_xxyyzz*v17
    v113       = L_xxyzzz*v17
    v154       = L_xyyyzz*v17
    v174       = L_xyyzzz*v17
    v18        = L_xxxxxzz*v17
    v39        = v16 + v18 + 2.0d0*(L_xxxxx + v12 + v19)
    Ls_xxxxx   = Ls_xxxxx + (0.5d0*(v16 + v18) + L_xxxxx + L_xxxxxxx*v14 + v0*x + v12 + v19)
    v23        = L_xxxxyzz*v17
    v36        = v23 + 2.0d0*(L_xxxxy + v21)
    v37        = v36*y
    v56        = 2.0d0*v24 + v22 + v36
    Ls_xxxxy   = Ls_xxxxy + (0.5d0*(v22 + v23) + L_xxxxxxy*v14 + L_xxxxy + v2*x + v21 + v24)
    v42        = L_xxxxzzz*v17
    v84        = v41 + v42 + 2.0d0*(L_xxxxz + v40 + v43)
    Ls_xxxxz   = Ls_xxxxz + (0.5d0*(v41 + v42) + L_xxxxxxz*v14 + L_xxxxz + v20*x + v40 + v43)
    v46        = L_xxxyyzz*v17
    v54        = v46 + 2.0d0*(L_xxxyy + v44)
    v55        = v54*y
    v71        = v15*v54
    v97        = 2.0d0*v47 + v45 + v54
    Ls_xxxyy   = Ls_xxxyy + (0.5d0*(v45 + v46) + L_xxxxxyy*v14 + L_xxxyy + v4*x + v44 + v47)
    v59        = L_xxxyzzz*v17
    v82        = v59 + 2.0d0*(L_xxxyz + v57)
    v83        = v82*y
    v117       = 2.0d0*v60 + v58 + v82
    Ls_xxxyz   = Ls_xxxyz + (0.5d0*(v58 + v59) + L_xxxxxyz*v14 + L_xxxyz + v26*x + v57 + v60)
    v87        = L_xxyyyzz*v17
    v95        = v87 + 2.0d0*(L_xxyyy + v85)
    v96        = v95*y
    v107       = v15*v95
    v128       = v30*v95
    v158       = 2.0d0*v88 + v86 + v95
    Ls_xxyyy   = Ls_xxyyy + (0.5d0*(v86 + v87) + L_xxxxyyy*v14 + L_xxyyy + v6*x + v85 + v88)
    v100       = L_xxyyzzz*v17
    v115       = v100 + 2.0d0*(L_xxyyz + v98)
    v116       = v115*y
    v142       = v115*v15
    v178       = 2.0d0*v101 + v115 + v99
    Ls_xxyyz   = Ls_xxyyz + (0.5d0*(v100 + v99) + L_xxxxyyz*v14 + L_xxyyz + v101 + v49*x + v98)
    v148       = L_xyyyyzz*v17
    v156       = v148 + 2.0d0*(L_xyyyy + v146)
    v157       = v156*y
    v168       = v15*v156
    v185       = v156*v30
    Ls_xyyyy   = Ls_xyyyy + (0.5d0*(v147 + v148) + L_xxxyyyy*v14 + L_xyyyy + v146 + v149 + v8*x)
    v161       = L_xyyyzzz*v17
    v176       = v161 + 2.0d0*(L_xyyyz + v159)
    v177       = v176*y
    v195       = v15*v176
    v220       = v176*v30
    Ls_xyyyz   = Ls_xyyyz + (0.5d0*(v160 + v161) + L_xxxyyyz*v14 + L_xyyyz + v159 + v162 + v90*x)
    v226       = L_yyyyyzz*v17
    v231       = v226 + 2.0d0*(L_yyyyy + v225)
    Ls_yyyyy   = Ls_yyyyy + (0.5d0*v226 + L_xxyyyyy*v14 + L_yyyyy + L_yyyyyyy*v35 + v10*x + v11*y + &
      v225)
    v233       = L_yyyyzzz*v17
    v242       = v233 + 2.0d0*(L_yyyyz + v232)
    Ls_yyyyz   = Ls_yyyyz + (0.5d0*v233 + L_xxyyyyz*v14 + L_yyyyyyz*v35 + L_yyyyz + v151*x + v227*y + &
      v232)
    h          = v13 + v15 + v17
    u2         = 1.0/h
    u          = sqrt(u2)
    u3         = u*u2
    u4         = u2*u2
    u5         = u2*u3
    u6         = u3*u3
    u7         = u3*u4
    u8         = u4*u4
    u9         = u4*u5
    u10        = u5*u5
    u11        = u5*u6
    u12        = u6*u6
    u13        = u6*u7
    u14        = u7*u7
    u15        = u7*u8
    c3         = c1*c2
    v33        = c3
    v202       = 0.166666666666667d0*v33
    v249       = 4.0d0*v33
    v255       = 20.0d0*v33
    v123       = L_xxzzz*v33
    v182       = L_xyzzz*v33
    v67        = L_xxxzzz*v33
    v105       = L_xxyzzz*v33
    v140       = L_xxzzzz*v33
    v166       = L_xyyzzz*v33
    v193       = L_xyzzzz*v33
    v34        = L_xxxxzzz*v33
    v77        = v31 + v34 + v3*v76 + 6.0d0*(L_xxxx + v27) + 3.0d0*(v32 + v37)
    Ls_xxxx    = Ls_xxxx + (0.166666666666667d0*(v31 + v34 + 3.0d0*(v32 + v37)) + L_xxxx + L_xxxxxxx &
      *v29 + v0*v14 + v27 + v3*v35 + v38*v39)
    v53        = L_xxxyzzz*v33
    v72        = v53 + 3.0d0*(2.0d0*L_xxxy + 2.0d0*v50 + v52)
    v73        = v72*y
    v110       = v51 + v72 + v5*v76 + 3.0d0*v55
    Ls_xxxy    = Ls_xxxy + (0.166666666666667d0*(v51 + v53 + 3.0d0*(v52 + v55)) + L_xxxxxxy*v29 + &
      L_xxxy + v14*v2 + v35*v5 + v38*v56 + v50)
    v81        = L_xxxzzzz*v33
    v145       = v79 + v81 + v48*v76 + 6.0d0*(L_xxxz + v78) + 3.0d0*(v80 + v83)
    Ls_xxxz    = Ls_xxxz + (0.166666666666667d0*(v79 + v81 + 3.0d0*(v80 + v83)) + L_xxxxxxz*v29 + &
      L_xxxz + v14*v20 + v35*v48 + v38*v84 + v78)
    v94        = L_xxyyzzz*v33
    v108       = v94 + 3.0d0*(2.0d0*L_xxyy + 2.0d0*v91 + v93)
    v109       = v108*y
    v129       = v108*v15
    v171       = v108 + v92 + v7*v76 + 3.0d0*v96
    Ls_xxyy    = Ls_xxyy + (0.166666666666667d0*(v92 + v94 + 3.0d0*(v93 + v96)) + L_xxxxxyy*v29 + &
      L_xxyy + v14*v4 + v35*v7 + v38*v97 + v91)
    v114       = L_xxyzzzz*v33
    v143       = v114 + 3.0d0*(2.0d0*L_xxyz + 2.0d0*v111 + v113)
    v144       = v143*y
    v198       = v112 + v143 + 3.0d0*v116 + v76*v89
    Ls_xxyz    = Ls_xxyz + (0.166666666666667d0*(v112 + v114 + 3.0d0*(v113 + v116)) + L_xxxxxyz*v29 &
      + L_xxyz + v111 + v117*v38 + v14*v26 + v35*v89)
    v155       = L_xyyyzzz*v33
    v169       = v155 + 3.0d0*(2.0d0*L_xyyy + 2.0d0*v152 + v154)
    v170       = v169*y
    v186       = v15*v169
    Ls_xyyy    = Ls_xyyy + (0.166666666666667d0*(v153 + v155 + 3.0d0*(v154 + v157)) + L_xxxxyyy*v29 &
      + L_xyyy + v14*v6 + v152 + v158*v38 + v35*v9)
    v175       = L_xyyzzzz*v33
    v196       = v175 + 3.0d0*(2.0d0*L_xyyz + 2.0d0*v172 + v174)
    v197       = v196*y
    v221       = v15*v196
    Ls_xyyz    = Ls_xyyz + (0.166666666666667d0*(v173 + v175 + 3.0d0*(v174 + v177)) + L_xxxxyyz*v29 &
      + L_xyyz + v14*v49 + v150*v35 + v172 + v178*v38)
    v229       = L_yyyyzzz*v33
    v239       = v229 + L_yyyyzz*v238 + 6.0d0*(L_yyyy + v228)
    Ls_yyyy    = Ls_yyyy + (0.166666666666667d0*v229 + L_xxxyyyy*v29 + L_yyyy + L_yyyyyyy*v70 + &
      L_yyyyzz*v201 + v11*v35 + v14*v8 + v228 + v230*v231 + v38*(v147 + &
      2.0d0*v149 + v156))
    v241       = L_yyyzzzz*v33
    v253       = v241 + L_yyyzzz*v238 + 6.0d0*(L_yyyz + v240)
    Ls_yyyz    = Ls_yyyz + (0.166666666666667d0*v241 + L_xxxyyyz*v29 + L_yyyyyyz*v70 + L_yyyz + &
      L_yyyzzz*v201 + v14*v90 + v227*v35 + v230*v242 + v240 + v38*(v160 &
      + 2.0d0*v162 + v176))
    c4         = c2*c2
    v68        = c4
    v203       = 0.0416666666666667d0*v68
    v256       = 5.0d0*v68
    v124       = L_xxzzzz*v68
    v183       = L_xyzzzz*v68
    v69        = L_xxxzzzz*v68
    v136       = v65 + v69 + v135*v5 + 12.0d0*v66 + 6.0d0*v71 + 24.0d0*(L_xxx + v61) + &
      4.0d0*(v67 + v73)
    Ls_xxx     = Ls_xxx + (0.0416666666666667d0*(v65 + 12.0d0*v66 + v69 + 6.0d0*v71 + 4.0d0*(v67 + &
      v73)) + L_xxx + L_xxxxxxx*v63 + v0*v29 + v39*v74 + v5*v70 + v61 + &
      v75*v77)
    v106       = L_xxyzzzz*v68
    v130       = v106 + 12.0d0*v104 + 4.0d0*(6.0d0*L_xxy + 6.0d0*v102 + v105)
    v131       = v130*y
    v189       = v103 + v130 + 6.0d0*v107 + 4.0d0*v109 + v135*v7
    Ls_xxy     = Ls_xxy + (0.0416666666666667d0*(v103 + 12.0d0*v104 + v106 + 6.0d0*v107 + 4.0d0*( &
      v105 + v109)) + L_xxxxxxy*v63 + L_xxy + v102 + v110*v75 + v2*v29 &
      + v56*v74 + v7*v70)
    v141       = L_xxzzzzz*v68
    v224       = v138 + v141 + v135*v89 + 12.0d0*v139 + 6.0d0*v142 + 24.0d0*(L_xxz + v137 &
      ) + 4.0d0*(v140 + v144)
    Ls_xxz     = Ls_xxz + (0.0416666666666667d0*(v138 + 12.0d0*v139 + v141 + 6.0d0*v142 + 4.0d0*( &
      v140 + v144)) + L_xxxxxxz*v63 + L_xxz + v137 + v145*v75 + v20*v29 &
      + v70*v89 + v74*v84)
    v167       = L_xyyzzzz*v68
    v187       = v167 + 12.0d0*v165 + 4.0d0*(6.0d0*L_xyy + 6.0d0*v163 + v166)
    v188       = v187*y
    Ls_xyy     = Ls_xyy + (0.0416666666666667d0*(v164 + 12.0d0*v165 + v167 + 6.0d0*v168 + 4.0d0*( &
      v166 + v170)) + L_xxxxxyy*v63 + L_xyy + v163 + v171*v75 + v29*v4 &
      + v70*v9 + v74*v97)
    v194       = L_xyzzzzz*v68
    v222       = v194 + 12.0d0*v192 + 4.0d0*(6.0d0*L_xyz + 6.0d0*v190 + v193)
    v223       = v222*y
    Ls_xyz     = Ls_xyz + (0.0416666666666667d0*(v191 + 12.0d0*v192 + v194 + 6.0d0*v195 + 4.0d0*( &
      v193 + v197)) + L_xxxxxyz*v63 + L_xyz + v117*v74 + v150*v70 + &
      v190 + v198*v75 + v26*v29)
    v235       = L_yyyzzzz*v68
    v250       = v235 + L_yyyzz*v248 + L_yyyzzz*v249 + 24.0d0*(L_yyy + v234)
    Ls_yyy     = Ls_yyy + (0.0416666666666667d0*v235 + L_xxxxyyy*v63 + L_yyy + L_yyyyyyy*v127 + &
      L_yyyzz*v201 + L_yyyzzz*v202 + v11*v70 + v158*v74 + v231*v236 + &
      v234 + v237*v239 + v29*v6 + v75*(v153 + 3.0d0*v157 + v169 + v76* &
      v9))
    v252       = L_yyzzzzz*v68
    v259       = v252 + L_yyzzz*v248 + L_yyzzzz*v249 + 24.0d0*(L_yyz + v251)
    Ls_yyz     = Ls_yyz + (0.0416666666666667d0*v252 + L_xxxxyyz*v63 + L_yyyyyyz*v127 + L_yyz + &
      L_yyzzz*v201 + L_yyzzzz*v202 + v178*v74 + v227*v70 + v236*v242 + &
      v237*v253 + v251 + v29*v49 + v75*(v150*v76 + v173 + 3.0d0*v177 + &
      v196))
    c5         = c2*c3
    v125       = c5
    v204       = 0.00833333333333333d0*v125
    v126       = L_xxzzzzz*v125
    Ls_xx      = Ls_xx + (0.00833333333333333d0*(v121 + 60.0d0*v122 + 20.0d0*v123 + v126 + 5.0d0*( &
      v124 + v131) + 10.0d0*(v128 + v129)) + L_xx + L_xxxxxxx*v119 + v0 &
      *v63 + v118 + v127*v7 + v132*v39 + v133*v77 + v134*v136)
    v184       = L_xyzzzzz*v125
    v212       = v184 + 60.0d0*v181 + 20.0d0*v182 + 5.0d0*(24.0d0*L_xy + 24.0d0*v179 + &
      v183)
    Ls_xy      = Ls_xy + (0.00833333333333333d0*(v180 + 60.0d0*v181 + 20.0d0*v182 + v184 + 5.0d0*( &
      v183 + v188) + 10.0d0*(v185 + v186)) + L_xxxxxxy*v119 + L_xy + &
      v110*v133 + v127*v9 + v132*v56 + v134*v189 + v179 + v2*v63)
    v219       = L_xzzzzzz*v125
    Ls_xz      = Ls_xz + (0.00833333333333333d0*(v218 + v219 + 5.0d0*v223 + 10.0d0*(v220 + v221)) &
      + L_xxxxxxz*v119 + L_xz + L_xzzz*v201 + L_xzzzz*v202 + L_xzzzzz* &
      v203 + v127*v150 + v132*v84 + v133*v145 + v134*v224 + v20*v63 + &
      v217)
    v244       = L_yyzzzzz*v125
    Ls_yy      = Ls_yy + (0.00833333333333333d0*v244 + L_xxxxxyy*v119 + L_yy + L_yyyyyyy*v206 + &
      L_yyzz*v201 + L_yyzzz*v202 + L_yyzzzz*v203 + v11*v127 + v132*v97 &
      + v133*v171 + v134*(v135*v9 + v164 + 6.0d0*v168 + 4.0d0*v170 + &
      v187) + v231*v245 + v239*v246 + v243 + v247*v250 + v4*v63)
    v258       = L_yzzzzzz*v125
    Ls_yz      = Ls_yz + (0.00833333333333333d0*v258 + L_xxxxxyz*v119 + L_yyyyyyz*v206 + L_yz + &
      L_yzzz*v201 + L_yzzzz*v202 + L_yzzzzz*v203 + v117*v132 + v127* &
      v227 + v133*v198 + v134*(v135*v150 + v191 + 6.0d0*v195 + 4.0d0* &
      v197 + v222) + v242*v245 + v246*v253 + v247*v259 + v257 + v26*v63)
    c6         = c3*c3
    v205       = 0.00138888888888889d0*c6
    Ls_x       = Ls_x + (L_x + L_xxxxxxx*v199 + L_xyyyyyy*v200 + L_xz*z + L_xzz*v201 + L_xzzz* &
      v202 + L_xzzzz*v203 + L_xzzzzz*v204 + L_xzzzzzz*v205 + v0*v119 + &
      v136*v214 + v156*v207 + v169*v208 + v187*v209 + v206*v9 + v210* &
      v39 + v211*v212 + v213*v77 + v215*(120.0d0*L_xx + 120.0d0*v118 + &
      v121 + 60.0d0*v122 + 20.0d0*v123 + 5.0d0*v124 + v126 + 10.0d0* &
      v128 + 10.0d0*v129 + 5.0d0*v131 + v216*v7))
    Ls_y       = Ls_y + (L_y + L_xxxxxxy*v199 + L_yyyyyyy*v200 + L_yz*z + L_yzz*v201 + L_yzzz* &
      v202 + L_yzzzz*v203 + L_yzzzzz*v204 + L_yzzzzzz*v205 + v11*v206 + &
      v110*v213 + v119*v2 + v189*v214 + v207*v231 + v208*v239 + v209* &
      v250 + v210*v56 + v211*(120.0d0*L_yy + L_yyzz*v254 + L_yyzzz*v255 &
      + L_yyzzzz*v256 + 120.0d0*v243 + v244) + v215*(v180 + 10.0d0*v185 &
      + 10.0d0*v186 + 5.0d0*v188 + v212 + v216*v9))
    Ls_z       = Ls_z + (L_z + L_xxxxxxz*v199 + L_yyyyyyz*v200 + L_zz*z + L_zzz*v201 + L_zzzz* &
      v202 + L_zzzzz*v203 + L_zzzzzz*v204 + L_zzzzzzz*v205 + v119*v20 + &
      v145*v213 + v206*v227 + v207*v242 + v208*v253 + v209*v259 + v210* &
      v84 + v211*(120.0d0*L_yz + L_yzzz*v254 + L_yzzzz*v255 + L_yzzzzz* &
      v256 + 120.0d0*v257 + v258) + v214*v224 + v215*(120.0d0*L_xz + &
      L_xzzz*v254 + L_xzzzz*v255 + L_xzzzzz*v256 + v150*v216 + 120.0d0* &
      v217 + v218 + v219 + 10.0d0*v220 + 10.0d0*v221 + 5.0d0*v223))
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
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
#undef  L_xyy               
#undef  Ls_xyy              
#undef  Ls_xyz              
#undef  L_xyz               
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
#undef  Ls_xxxxxxx          
#undef  L_xxxxxxx           
#undef  Ls_xxxxxxy          
#undef  L_xxxxxxy           
#undef  Ls_xxxxxxz          
#undef  L_xxxxxxz           
#undef  Ls_xxxxxyy          
#undef  L_xxxxxyy           
#undef  Ls_xxxxxyz          
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  Ls_xxxxyyy          
#undef  Ls_xxxxyyz          
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  Ls_xxxyyyy          
#undef  Ls_xxxyyyz          
#undef  L_xxxyyyz           
#undef  Ls_xxyyyyy          
#undef  L_xxyyyyy           
#undef  Ls_xxyyyyz          
#undef  L_xxyyyyz           
#undef  Ls_xyyyyyy          
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  Ls_xyyyyyz          
#undef  Ls_yyyyyyy          
#undef  L_yyyyyyy           
#undef  Ls_yyyyyyz          
#undef  L_yyyyyyz           
    end subroutine mom_es_L2L_add
    
! OPS  1002*ADD + 2*DIV + 1396*MUL + 117*NEG + POW + 35*SUB = 2553  (3488 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v28, v29, v3, v30, v31, v32, v33, v34,&
                v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45,&
                v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_x,&
                D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy,&
                D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz,&
                D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
                D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz,&
                D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz,&
                D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz,&
                D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz,&
                D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz,&
                D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy,&
                D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz,&
                D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz,&
                D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx,&
                D_xxxxxxy, D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz,&
                D_xxxxyyy, D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy,&
                D_xxxyyyz, D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy,&
                D_xxyyyyz, D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz,&
                D_xyyyyyy, D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz,&
                D_xyzzzzz, D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz,&
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, M_zz,&
                M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz,&
                M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz,&
                M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz,&
                M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz,&
                M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz,&
                M_zzzzzz
#define x                    r(1:2,1)
#define M_0                  M(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define L_x                  L(1:2,0)
#define M_xx                 M(1:2,1)
#define L_y                  L(1:2,1)
#define M_xy                 M(1:2,2)
#define L_z                  L(1:2,2)
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
#define M_xxxz               M(1:2,15)
#define L_xxxx               L(1:2,15)
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
#define M_xxxxx              M(1:2,22)
#define M_xxxxy              M(1:2,23)
#define L_yyyz               L(1:2,23)
#define L_xxxxx              L(1:2,24)
#define M_xxxxz              M(1:2,24)
#define L_xxxxy              L(1:2,25)
#define M_xxxyy              M(1:2,25)
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
#define M_xxxxxx             M(1:2,33)
#define L_yyyyz              L(1:2,34)
#define M_xxxxxy             M(1:2,34)
#define L_xxxxxx             L(1:2,35)
#define M_xxxxxz             M(1:2,35)
#define L_xxxxxy             L(1:2,36)
#define M_xxxxyy             M(1:2,36)
#define L_xxxxxz             L(1:2,37)
#define M_xxxxyz             M(1:2,37)
#define M_xxxyyy             M(1:2,38)
#define L_xxxxyy             L(1:2,38)
#define L_xxxxyz             L(1:2,39)
#define M_xxxyyz             M(1:2,39)
#define M_xxyyyy             M(1:2,40)
#define L_xxxyyy             L(1:2,40)
#define M_xxyyyz             M(1:2,41)
#define L_xxxyyz             L(1:2,41)
#define L_xxyyyy             L(1:2,42)
#define M_xyyyyy             M(1:2,42)
#define M_xyyyyz             M(1:2,43)
#define L_xxyyyz             L(1:2,43)
#define L_xyyyyy             L(1:2,44)
#define M_yyyyyy             M(1:2,44)
#define L_xyyyyz             L(1:2,45)
#define M_yyyyyz             M(1:2,45)
#define L_yyyyyy             L(1:2,46)
#define L_yyyyyz             L(1:2,47)
#define L_xxxxxxx            L(1:2,48)
#define L_xxxxxxy            L(1:2,49)
#define L_xxxxxxz            L(1:2,50)
#define L_xxxxxyy            L(1:2,51)
#define L_xxxxxyz            L(1:2,52)
#define L_xxxxyyy            L(1:2,53)
#define L_xxxxyyz            L(1:2,54)
#define L_xxxyyyy            L(1:2,55)
#define L_xxxyyyz            L(1:2,56)
#define L_xxyyyyy            L(1:2,57)
#define L_xxyyyyz            L(1:2,58)
#define L_xyyyyyy            L(1:2,59)
#define L_xyyyyyz            L(1:2,60)
#define L_yyyyyyy            L(1:2,61)
#define L_yyyyyyz            L(1:2,62)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v268      = y*z
    v269      = 945.0d0*x
    v261      = 15.0d0*v268
    v265      = v268
    v61       = v269
    v83       = 0.5d0*M_xx
    v92       = 0.166666666666667d0*M_xxx
    v93       = 0.5d0*M_xxy
    v94       = 0.5d0*M_xxz
    v112      = 0.0416666666666667d0*M_xxxx
    v113      = 0.166666666666667d0*M_xxxy
    v114      = 0.166666666666667d0*M_xxxz
    v115      = 0.25d0*M_xxyy
    v116      = 0.5d0*M_xxyz
    v149      = 0.00833333333333333d0*M_xxxxx
    v150      = 0.0416666666666667d0*M_xxxxy
    v151      = 0.0416666666666667d0*M_xxxxz
    v152      = 0.0833333333333333d0*M_xxxyy
    v153      = 0.166666666666667d0*M_xxxyz
    v155      = 0.0833333333333333d0*M_xxyyy
    v156      = 0.25d0*M_xxyyz
    v180      = 0.5d0*M_yy
    v182      = 0.166666666666667d0*M_yyy
    v187      = 0.0416666666666667d0*M_yyyy
    v196      = 0.00833333333333333d0*M_yyyyy
    v212      = 0.00138888888888889d0*M_xxxxxx
    v213      = 0.00833333333333333d0*M_xxxxxy
    v214      = 0.00833333333333333d0*M_xxxxxz
    v215      = 0.0208333333333333d0*M_xxxxyy
    v216      = 0.0416666666666667d0*M_xxxxyz
    v218      = 0.0277777777777778d0*M_xxxyyy
    v219      = 0.0833333333333333d0*M_xxxyyz
    v222      = 0.0208333333333333d0*M_xxyyyy
    v223      = 0.0833333333333333d0*M_xxyyyz
    v227      = 0.00138888888888889d0*M_yyyyyy
    v228      = 0.00833333333333333d0*M_yyyyyz
    v229      = 0.0416666666666667d0*M_yyyyz
    v231      = 0.166666666666667d0*M_yyyz
    v234      = 0.5d0*M_yyz
    v243      = 0.5d0*M_xyy
    v245      = 0.166666666666667d0*M_xyyy
    v247      = 0.0416666666666667d0*M_xyyyy
    v249      = 0.00833333333333333d0*M_xyyyyy
    M_zz      = -(M_xx + M_yy)
    v238      = 0.5d0*M_zz
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    v244      = 0.5d0*M_yzz
    M_zzz     = -(M_xxz + M_yyz)
    v239      = 0.166666666666667d0*M_zzz
    M_xxzz    = -(M_xxxx + M_xxyy)
    v117      = 0.25d0*M_xxzz
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v235      = 0.25d0*M_yyzz
    M_yzzz    = -(M_xxyz + M_yyyz)
    v246      = 0.166666666666667d0*M_yzzz
    M_zzzz    = -(M_xxzz + M_yyzz)
    v240      = 0.0416666666666667d0*M_zzzz
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    v154      = 0.0833333333333333d0*M_xxxzz
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    v157      = 0.25d0*M_xxyzz
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    v158      = 0.0833333333333333d0*M_xxzzz
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -(M_xxxzz + M_xyyzz)
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    v232      = 0.0833333333333333d0*M_yyyzz
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v236      = 0.0833333333333333d0*M_yyzzz
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    v248      = 0.0416666666666667d0*M_yzzzz
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    v241      = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    v217      = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    v220      = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    v221      = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    v224      = 0.125d0*M_xxyyzz
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    v225      = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    v226      = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    v230      = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v233      = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v237      = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    v250      = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    v242      = 0.00138888888888889d0*M_zzzzzz
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v251      = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v251
    v24       = 7.0d0*v0
    a3        = a1*a2
    a4        = a2*a2
    v19       = a4
    v54       = 33.0d0*v19
    v82       = 143.0d0*v19
    a5        = a2*a3
    a6        = a3*a3
    v49       = a6
    v74       = -429.0d0*v49
    a7        = a3*a4
    b2        = b1*b1
    v1        = b2
    v252      = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v252
    v29       = 7.0d0*v1
    v59       = v1*v19
    v80       = -429.0d0*v59
    b3        = b1*b2
    b4        = b2*b2
    v31       = b4
    v66       = v0*v31
    v67       = 33.0d0*v31
    v103      = 143.0d0*v31
    v129      = -429.0d0*v66
    b5        = b2*b3
    b6        = b3*b3
    v69       = b6
    v178      = -429.0d0*v69
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v0 + v1
    v253      = 3.0d0*h
    v254      = h*v0
    v255      = h*v1
    v256      = h*v19
    v257      = h*v31
    v4        = -h
    v12       = v253
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v254
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v255
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v254
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 + 630.0d0*v255 - 945.0d0*v31
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v256
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v254
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v257
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v86       = -18.0d0*v51 + v46 + v79
    v87       = 66.0d0*v57
    v267      = -v87
    v88       = 9.0d0*v17
    v89       = 198.0d0*v57
    v101      = h*v67
    v102      = -18.0d0*v65 + v101 + v46
    v179      = v178 + v47 - 135.0d0*v65 + 495.0d0*v70
    u2        = 1.0/h
    u         = sqrt(u2)
    u3        = u*u2
    v2        = u3
    D_x       = -v2*x
    D_y       = -v2*y
    D_z       = -v2*z
    u4        = u2*u2
    u5        = u2*u3
    v3        = u5
    v258      = 3.0d0*v3
    v6        = v258*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v258*v265
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v259      = 3.0d0*v8
    v9        = v8*x
    v11       = v259*(h - v10)
    D_xxx     = -3.0d0*v9*(v251 - v253)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    D_xyz     = -v261*v9
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = v259*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v260      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v260*y
    v26       = v260*z
    v28       = v15*v261
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v159      = 0.5d0*D_xxyy
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    v169      = 0.5d0*D_xxzz
    D_xyyy    = v22*v30
    D_xyyz    = v26*(v29 + v4)
    D_xyzz    = -(D_xxxy + D_xyyy)
    v203      = 0.5d0*D_xyzz
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v262      = 15.0d0*v34
    v263      = v34*z
    v35       = v262*x
    v39       = v263
    v41       = 315.0d0*v263*x*y
    v42       = v262*y
    D_xxxxx   = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy   = v34*v38*y
    D_xxxxz   = v38*v39
    D_xxxyy   = v35*(v40 + h*v24 + 21.0d0*v32)
    v118      = 0.5d0*D_xxxyy
    D_xxxyz   = v41*(h - v5)
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    v124      = 0.5d0*D_xxxzz
    D_xxyyy   = v42*(v40 + h*v29 + 21.0d0*v20)
    v138      = 0.5d0*D_xxyyy
    v160      = 0.166666666666667d0*D_xxyyy
    D_xxyyz   = v39*(v36 - 945.0d0*v252 + 105.0d0*(v254 + v255))
    v166      = 0.5d0*D_xxyyz
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    v144      = 0.5d0*D_xxyzz
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    v170      = 0.166666666666667d0*D_xxzzz
    v175      = 0.5d0*D_xxzzz
    D_xyyyy   = v34*v43*x
    D_xyyyz   = v41*(h - v7)
    v200      = 0.5d0*D_xyyyz
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    v191      = 0.5d0*D_xyyzz
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    v204      = 0.166666666666667d0*D_xyzzz
    v209      = 0.5d0*D_xyzzz
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    D_yyyyy   = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz   = v39*v43
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    u12       = u6*u6
    u13       = u6*u7
    v44       = u13
    v270      = 315.0d0*v44
    v264      = v270*x
    v45       = 45.0d0*v44
    v52       = v264*y
    v56       = v264*z
    v60       = v265*v270
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    L_xxxxxx  = D_xxxxxx*M_0
    D_xxxxxy  = v52*v55
    L_xxxxxy  = D_xxxxxy*M_0
    D_xxxxxz  = v55*v56
    L_xxxxxz  = D_xxxxxz*M_0
    D_xxxxyy  = v45*(v58 + v17*v29 - 21.0d0*v256 + 14.0d0*v51 + 231.0d0*v59)
    v95       = 0.5d0*D_xxxxyy
    L_xxxxyy  = D_xxxxyy*M_0
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    L_xxxxyz  = D_xxxxyz*M_0
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    v98       = 0.5d0*D_xxxxzz
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    v106      = 0.5d0*D_xxxyyy
    v119      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy  = D_xxxyyy*M_0
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    v122      = 0.5d0*D_xxxyyz
    L_xxxyyz  = D_xxxyyz*M_0
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    v109      = 0.5d0*D_xxxyzz
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    v125      = 0.166666666666667d0*D_xxxzzz
    v127      = 0.5d0*D_xxxzzz
    D_xxyyyy  = v45*(v58 + v17*v24 - 21.0d0*v257 + 14.0d0*v65 + 231.0d0*v66)
    v132      = 0.5d0*D_xxyyyy
    v139      = 0.166666666666667d0*D_xxyyyy
    v161      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy  = D_xxyyyy*M_0
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    v142      = 0.5d0*D_xxyyyz
    v164      = 0.166666666666667d0*D_xxyyyz
    L_xxyyyz  = D_xxyyyz*M_0
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    v135      = 0.5d0*D_xxyyzz
    v167      = 0.25d0*D_xxyyzz
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    v145      = 0.166666666666667d0*D_xxyzzz
    v147      = 0.5d0*D_xxyzzz
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    v171      = 0.0416666666666667d0*D_xxzzzz
    v176      = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy  = v52*v68
    L_xyyyyy  = D_xyyyyy*M_0
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    v189      = 0.5d0*D_xyyyyz
    v198      = 0.166666666666667d0*D_xyyyyz
    L_xyyyyz  = D_xyyyyz*M_0
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    v184      = 0.5d0*D_xyyyzz
    v201      = 0.25d0*D_xyyyzz
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    v192      = 0.166666666666667d0*D_xyyzzz
    v194      = 0.5d0*D_xyyzzz
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    v205      = 0.0416666666666667d0*D_xyzzzz
    v210      = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    L_yyyyyy  = D_yyyyyy*M_0
    D_yyyyyz  = v60*v68
    L_yyyyyz  = D_yyyyyz*M_0
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v266      = 315.0d0*v71
    v72       = v266*x
    v75       = v266*y
    v77       = v266*z
    v81       = v265*v269*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = v75*v76
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = v76*v77
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    v84       = 0.5d0*D_xxxxxyy
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    v85       = 0.5d0*D_xxxxxzz
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxxx*v83 + D_xxxxxxy*M_xy + D_xxxxxxz*M_xz + &
      D_xxxxxyz*M_yz + M_yy*v84 + M_zz*v85
    D_xxxxyyy = -945.0d0*v71*y*(v267 + v1*v18 + v1*v82 - v86)
    v90       = 0.5d0*D_xxxxyyy
    v96       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = v77*(-v1*v88 + v80 + v86 + v89)
    v97       = 0.5d0*D_xxxxyyz
    L_xxxxyyz = D_xxxxyyz*M_0
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    v91       = 0.5d0*D_xxxxyzz
    L_xxxxy   = D_xxxxxxy*v83 + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + M_yy*v90 + M_zz*v91
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    v99       = 0.166666666666667d0*D_xxxxzzz
    v100      = 0.5d0*D_xxxxzzz
    L_xxxx    = D_xxxx*M_0 + D_xxxxxx*v83 + D_xxxxxxx*v92 + D_xxxxxxy*v93 + D_xxxxxxz* &
      v94 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz* &
      M_yz + M_xyy*v84 + M_xzz*v85 + M_yy*v95 + M_yyy*v96 + M_yyz*v97 + &
      M_yzz*v91 + M_zz*v98 + M_zzz*v99
    L_xxxxz   = D_xxxxxxz*v83 + D_xxxxxyz*M_xy + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + M_yy*v97 + M_zz*v100
    D_xxxyyyy = -v61*v71*(v267 + v0*v103 + v0*v18 - v102)
    v104      = 0.5d0*D_xxxyyyy
    v107      = 0.166666666666667d0*D_xxxyyyy
    v120      = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v88))
    v108      = 0.5d0*D_xxxyyyz
    v121      = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyyz = D_xxxyyyz*M_0
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    v105      = 0.5d0*D_xxxyyzz
    v123      = 0.25d0*D_xxxyyzz
    L_xxxyy   = D_xxxxxyy*v83 + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + M_yy*v104 + M_zz*v105
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    v110      = 0.166666666666667d0*D_xxxyzzz
    v111      = 0.5d0*D_xxxyzzz
    L_xxxy    = D_xxxxxxy*v92 + D_xxxxxy*v83 + D_xxxxxyy*v93 + D_xxxxxyz*v94 + D_xxxxyy* &
      M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz* &
      M_yz + M_xyy*v90 + M_xzz*v91 + M_yy*v106 + M_yyy*v107 + M_yyz* &
      v108 + M_yzz*v105 + M_zz*v109 + M_zzz*v110
    L_xxxyz   = D_xxxxxyz*v83 + D_xxxxyyz*M_xy + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + M_yy*v108 + M_zz*v111
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    v126      = 0.0416666666666667d0*D_xxxzzzz
    v128      = 0.166666666666667d0*D_xxxzzzz
    L_xxx     = D_xxx*M_0 + D_xxxxx*v83 + D_xxxxxx*v92 + D_xxxxxxx*v112 + D_xxxxxxy*v113 &
      + D_xxxxxxz*v114 + D_xxxxxy*v93 + D_xxxxxyy*v115 + D_xxxxxyz*v116 &
      + D_xxxxxz*v94 + D_xxxxxzz*v117 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + &
      D_xxxxz*M_xz + D_xxxyz*M_yz + M_xyy*v95 + M_xyyy*v96 + M_xyyz*v97 &
      + M_xyzz*v91 + M_xzz*v98 + M_xzzz*v99 + M_yy*v118 + M_yyy*v119 + &
      M_yyyy*v120 + M_yyyz*v121 + M_yyz*v122 + M_yyzz*v123 + M_yzz*v109 &
      + M_yzzz*v110 + M_zz*v124 + M_zzz*v125 + M_zzzz*v126
    L_xxxz    = D_xxxxxxz*v92 + D_xxxxxyz*v93 + D_xxxxxz*v83 + D_xxxxxzz*v94 + D_xxxxyz* &
      M_xy + D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz* &
      M_0 + M_xyy*v97 + M_xzz*v100 + M_yy*v122 + M_yyy*v121 + M_yyz* &
      v105 + M_yzz*v111 + M_zz*v127 + M_zzz*v128
    D_xxyyyyy = v75*(-45.0d0*v51 - 30.0d0*v65 + v101 + v129 + v78)
    v130      = 0.5d0*D_xxyyyyy
    v133      = 0.166666666666667d0*D_xxyyyyy
    v140      = 0.0416666666666667d0*D_xxyyyyy
    v162      = 0.00833333333333333d0*D_xxyyyyy
    L_xxyyyyy = D_xxyyyyy*M_0
    D_xxyyyyz = v77*(-v0*v88 + v102 + v129 + v89)
    v134      = 0.5d0*D_xxyyyyz
    v141      = 0.166666666666667d0*D_xxyyyyz
    v163      = 0.0416666666666667d0*D_xxyyyyz
    L_xxyyyyz = D_xxyyyyz*M_0
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    v131      = 0.5d0*D_xxyyyzz
    v143      = 0.25d0*D_xxyyyzz
    v165      = 0.0833333333333333d0*D_xxyyyzz
    v173      = 0.166666666666667d0*D_xxyyyzz
    L_xxyyy   = D_xxxxyyy*v83 + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + M_yy*v130 + M_zz*v131
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    v136      = 0.166666666666667d0*D_xxyyzzz
    v137      = 0.5d0*D_xxyyzzz
    v168      = 0.0833333333333333d0*D_xxyyzzz
    v174      = 0.25d0*D_xxyyzzz
    L_xxyy    = D_xxxxxyy*v92 + D_xxxxyy*v83 + D_xxxxyyy*v93 + D_xxxxyyz*v94 + D_xxxyyy* &
      M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz* &
      M_yz + M_xyy*v104 + M_xzz*v105 + M_yy*v132 + M_yyy*v133 + M_yyz* &
      v134 + M_yzz*v131 + M_zz*v135 + M_zzz*v136
    L_xxyyz   = D_xxxxyyz*v83 + D_xxxyyyz*M_xy + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + M_yy*v134 + M_zz*v137
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    v146      = 0.0416666666666667d0*D_xxyzzzz
    v148      = 0.166666666666667d0*D_xxyzzzz
    L_xxy     = D_xxxxxxy*v112 + D_xxxxxy*v92 + D_xxxxxyy*v113 + D_xxxxxyz*v114 + &
      D_xxxxy*v83 + D_xxxxyy*v93 + D_xxxxyyy*v115 + D_xxxxyyz*v116 + &
      D_xxxxyz*v94 + D_xxxxyzz*v117 + D_xxxyy*M_xy + D_xxxyyz*M_xyz + &
      D_xxxyz*M_xz + D_xxy*M_0 + D_xxyyz*M_yz + M_xyy*v106 + M_xyyy* &
      v107 + M_xyyz*v108 + M_xyzz*v105 + M_xzz*v109 + M_xzzz*v110 + &
      M_yy*v138 + M_yyy*v139 + M_yyyy*v140 + M_yyyz*v141 + M_yyz*v142 + &
      M_yyzz*v143 + M_yzz*v135 + M_yzzz*v136 + M_zz*v144 + M_zzz*v145 + &
      M_zzzz*v146
    L_xxyz    = D_xxxxxyz*v92 + D_xxxxyyz*v93 + D_xxxxyz*v83 + D_xxxxyzz*v94 + D_xxxyyz* &
      M_xy + D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz* &
      M_0 + M_xyy*v108 + M_xzz*v111 + M_yy*v142 + M_yyy*v141 + M_yyz* &
      v131 + M_yzz*v137 + M_zz*v147 + M_zzz*v148
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    v172      = 0.00833333333333333d0*D_xxzzzzz
    v177      = 0.0416666666666667d0*D_xxzzzzz
    L_xx      = D_xx*M_0 + D_xxxx*v83 + D_xxxxx*v92 + D_xxxxxx*v112 + D_xxxxxxx*v149 + &
      D_xxxxxxy*v150 + D_xxxxxxz*v151 + D_xxxxxy*v113 + D_xxxxxyy*v152 &
      + D_xxxxxyz*v153 + D_xxxxxz*v114 + D_xxxxxzz*v154 + D_xxxxy*v93 + &
      D_xxxxyy*v115 + D_xxxxyyy*v155 + D_xxxxyyz*v156 + D_xxxxyz*v116 + &
      D_xxxxyzz*v157 + D_xxxxz*v94 + D_xxxxzz*v117 + D_xxxxzzz*v158 + &
      D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + D_xxyz*M_yz + M_xyy* &
      v118 + M_xyyy*v119 + M_xyyyy*v120 + M_xyyyz*v121 + M_xyyz*v122 + &
      M_xyyzz*v123 + M_xyzz*v109 + M_xyzzz*v110 + M_xzz*v124 + M_xzzz* &
      v125 + M_xzzzz*v126 + M_yy*v159 + M_yyy*v160 + M_yyyy*v161 + &
      M_yyyyy*v162 + M_yyyyz*v163 + M_yyyz*v164 + M_yyyzz*v165 + M_yyz* &
      v166 + M_yyzz*v167 + M_yyzzz*v168 + M_yzz*v144 + M_yzzz*v145 + &
      M_yzzzz*v146 + M_zz*v169 + M_zzz*v170 + M_zzzz*v171 + M_zzzzz* &
      v172
    L_xxz     = D_xxxxxxz*v112 + D_xxxxxyz*v113 + D_xxxxxz*v92 + D_xxxxxzz*v114 + &
      D_xxxxyyz*v115 + D_xxxxyz*v93 + D_xxxxyzz*v116 + D_xxxxz*v83 + &
      D_xxxxzz*v94 + D_xxxxzzz*v117 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + &
      D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + M_xyy*v122 + M_xyyy* &
      v121 + M_xyyz*v105 + M_xyzz*v111 + M_xzz*v127 + M_xzzz*v128 + &
      M_yy*v166 + M_yyy*v164 + M_yyyy*v163 + M_yyyz*v173 + M_yyz*v135 + &
      M_yyzz*v174 + M_yzz*v147 + M_yzzz*v148 + M_zz*v175 + M_zzz*v176 + &
      M_zzzz*v177
    D_xyyyyyy = v179*v72
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = v81*(v36 - v103 + 110.0d0*v32)
    v183      = 0.5d0*D_xyyyyyz
    v188      = 0.166666666666667d0*D_xyyyyyz
    v197      = 0.0416666666666667d0*D_xyyyyyz
    L_xyyyyyz = D_xyyyyyz*M_0
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    v181      = 0.5d0*D_xyyyyzz
    v190      = 0.25d0*D_xyyyyzz
    v199      = 0.0833333333333333d0*D_xyyyyzz
    v207      = 0.166666666666667d0*D_xyyyyzz
    L_xyyyy   = D_xxxyyyy*v83 + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyy*v180 + D_xyyyyyz*M_yz + M_zz*v181
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    v185      = 0.166666666666667d0*D_xyyyzzz
    v186      = 0.5d0*D_xyyyzzz
    v202      = 0.0833333333333333d0*D_xyyyzzz
    v208      = 0.25d0*D_xyyyzzz
    L_xyyy    = D_xxxxyyy*v92 + D_xxxyyy*v83 + D_xxxyyyy*v93 + D_xxxyyyz*v94 + D_xxyyyy* &
      M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy* &
      v180 + D_xyyyyyy*v182 + D_xyyyyz*M_yz + M_xyy*v130 + M_xzz*v131 + &
      M_yyz*v183 + M_yzz*v181 + M_zz*v184 + M_zzz*v185
    L_xyyyz   = D_xxxyyyz*v83 + D_xxyyyyz*M_xy + D_xxyyyzz*M_xz + D_xyyyyyz*v180 + &
      D_xyyyyzz*M_yz + D_xyyyz*M_0 + M_zz*v186
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    v193      = 0.0416666666666667d0*D_xyyzzzz
    v195      = 0.166666666666667d0*D_xyyzzzz
    L_xyy     = D_xxxxxyy*v112 + D_xxxxyy*v92 + D_xxxxyyy*v113 + D_xxxxyyz*v114 + &
      D_xxxyy*v83 + D_xxxyyy*v93 + D_xxxyyyy*v115 + D_xxxyyyz*v116 + &
      D_xxxyyz*v94 + D_xxxyyzz*v117 + D_xxyyy*M_xy + D_xxyyyz*M_xyz + &
      D_xxyyz*M_xz + D_xyy*M_0 + D_xyyyy*v180 + D_xyyyyy*v182 + &
      D_xyyyyyy*v187 + D_xyyyz*M_yz + M_xyy*v132 + M_xyyy*v133 + M_xyyz &
      *v134 + M_xyzz*v131 + M_xzz*v135 + M_xzzz*v136 + M_yyyz*v188 + &
      M_yyz*v189 + M_yyzz*v190 + M_yzz*v184 + M_yzzz*v185 + M_zz*v191 + &
      M_zzz*v192 + M_zzzz*v193
    L_xyyz    = D_xxxxyyz*v92 + D_xxxyyyz*v93 + D_xxxyyz*v83 + D_xxxyyzz*v94 + D_xxyyyz* &
      M_xy + D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyz*v182 + &
      D_xyyyyz*v180 + D_xyyyzz*M_yz + D_xyyz*M_0 + M_xyy*v134 + M_xzz* &
      v137 + M_yyz*v181 + M_yzz*v186 + M_zz*v194 + M_zzz*v195
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    v206      = 0.00833333333333333d0*D_xyzzzzz
    v211      = 0.0416666666666667d0*D_xyzzzzz
    L_xy      = D_xxxxxxy*v149 + D_xxxxxy*v112 + D_xxxxxyy*v150 + D_xxxxxyz*v151 + &
      D_xxxxy*v92 + D_xxxxyy*v113 + D_xxxxyyy*v152 + D_xxxxyyz*v153 + &
      D_xxxxyz*v114 + D_xxxxyzz*v154 + D_xxxy*v83 + D_xxxyy*v93 + &
      D_xxxyyy*v115 + D_xxxyyyy*v155 + D_xxxyyyz*v156 + D_xxxyyz*v116 + &
      D_xxxyyzz*v157 + D_xxxyz*v94 + D_xxxyzz*v117 + D_xxxyzzz*v158 + &
      D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy* &
      v180 + D_xyyyy*v182 + D_xyyyyy*v187 + D_xyyyyyy*v196 + D_xyyz* &
      M_yz + M_xyy*v138 + M_xyyy*v139 + M_xyyyy*v140 + M_xyyyz*v141 + &
      M_xyyz*v142 + M_xyyzz*v143 + M_xyzz*v135 + M_xyzzz*v136 + M_xzz* &
      v144 + M_xzzz*v145 + M_xzzzz*v146 + M_yyyyz*v197 + M_yyyz*v198 + &
      M_yyyzz*v199 + M_yyz*v200 + M_yyzz*v201 + M_yyzzz*v202 + M_yzz* &
      v191 + M_yzzz*v192 + M_yzzzz*v193 + M_zz*v203 + M_zzz*v204 + &
      M_zzzz*v205 + M_zzzzz*v206
    L_xyz     = D_xxxxxyz*v112 + D_xxxxyyz*v113 + D_xxxxyz*v92 + D_xxxxyzz*v114 + &
      D_xxxyyyz*v115 + D_xxxyyz*v93 + D_xxxyyzz*v116 + D_xxxyz*v83 + &
      D_xxxyzz*v94 + D_xxxyzzz*v117 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + &
      D_xxyzz*M_xz + D_xyyyyyz*v187 + D_xyyyyz*v182 + D_xyyyz*v180 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v142 + M_xyyy*v141 + M_xyyz*v131 &
      + M_xyzz*v137 + M_xzz*v147 + M_xzzz*v148 + M_yyyz*v207 + M_yyz* &
      v184 + M_yyzz*v208 + M_yzz*v194 + M_yzzz*v195 + M_zz*v209 + M_zzz &
      *v210 + M_zzzz*v211
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    L_x       = D_x*M_0 + D_xxx*v83 + D_xxxx*v92 + D_xxxxx*v112 + D_xxxxxx*v149 + &
      D_xxxxxxx*v212 + D_xxxxxxy*v213 + D_xxxxxxz*v214 + D_xxxxxy*v150 &
      + D_xxxxxyy*v215 + D_xxxxxyz*v216 + D_xxxxxz*v151 + D_xxxxxzz* &
      v217 + D_xxxxy*v113 + D_xxxxyy*v152 + D_xxxxyyy*v218 + D_xxxxyyz* &
      v219 + D_xxxxyz*v153 + D_xxxxyzz*v220 + D_xxxxz*v114 + D_xxxxzz* &
      v154 + D_xxxxzzz*v221 + D_xxxy*v93 + D_xxxyy*v115 + D_xxxyyy*v155 &
      + D_xxxyyyy*v222 + D_xxxyyyz*v223 + D_xxxyyz*v156 + D_xxxyyzz* &
      v224 + D_xxxyz*v116 + D_xxxyzz*v157 + D_xxxyzzz*v225 + D_xxxz*v94 &
      + D_xxxzz*v117 + D_xxxzzz*v158 + D_xxxzzzz*v226 + D_xxy*M_xy + &
      D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v180 + D_xyyy*v182 + D_xyyyy* &
      v187 + D_xyyyyy*v196 + D_xyyyyyy*v227 + D_xyyyyyz*v228 + D_xyyyyz &
      *v229 + D_xyyyyzz*v230 + D_xyyyz*v231 + D_xyyyzz*v232 + D_xyyyzzz &
      *v233 + D_xyyz*v234 + D_xyyzz*v235 + D_xyyzzz*v236 + D_xyyzzzz* &
      v237 + D_xyz*M_yz + D_xzz*v238 + D_xzzz*v239 + D_xzzzz*v240 + &
      D_xzzzzz*v241 + D_xzzzzzz*v242 + M_xyy*v159 + M_xyyy*v160 + &
      M_xyyyy*v161 + M_xyyyyy*v162 + M_xyyyyz*v163 + M_xyyyz*v164 + &
      M_xyyyzz*v165 + M_xyyz*v166 + M_xyyzz*v167 + M_xyyzzz*v168 + &
      M_xyzz*v144 + M_xyzzz*v145 + M_xyzzzz*v146 + M_xzz*v169 + M_xzzz* &
      v170 + M_xzzzz*v171 + M_xzzzzz*v172 + M_yzz*v203 + M_yzzz*v204 + &
      M_yzzzz*v205 + M_yzzzzz*v206
    L_xz      = D_xxxxxxz*v149 + D_xxxxxyz*v150 + D_xxxxxz*v112 + D_xxxxxzz*v151 + &
      D_xxxxyyz*v152 + D_xxxxyz*v113 + D_xxxxyzz*v153 + D_xxxxz*v92 + &
      D_xxxxzz*v114 + D_xxxxzzz*v154 + D_xxxyyyz*v155 + D_xxxyyz*v115 + &
      D_xxxyyzz*v156 + D_xxxyz*v93 + D_xxxyzz*v116 + D_xxxyzzz*v157 + &
      D_xxxz*v83 + D_xxxzz*v94 + D_xxxzzz*v117 + D_xxxzzzz*v158 + &
      D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyyyz*v196 + &
      D_xyyyyz*v187 + D_xyyyyzz*v229 + D_xyyyz*v182 + D_xyyyzz*v231 + &
      D_xyyyzzz*v232 + D_xyyz*v180 + D_xyyzz*v234 + D_xyyzzz*v235 + &
      D_xyyzzzz*v236 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v238 + D_xzzzz* &
      v239 + D_xzzzzz*v240 + D_xzzzzzz*v241 + M_xyy*v166 + M_xyyy*v164 &
      + M_xyyyy*v163 + M_xyyyz*v173 + M_xyyz*v135 + M_xyyzz*v174 + &
      M_xyzz*v147 + M_xyzzz*v148 + M_xzz*v175 + M_xzzz*v176 + M_xzzzz* &
      v177 + M_yzz*v209 + M_yzzz*v210 + M_yzzzz*v211
    D_yyyyyyy = v75*(v178 + v73 - 315.0d0*v65 + 693.0d0*v70)
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = v179*v77
    L_yyyyyyz = D_yyyyyyz*M_0
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    L_yyyyy   = D_xxyyyyy*v83 + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + D_yyyyy*M_0 + &
      D_yyyyyyy*v180 + D_yyyyyyz*M_yz + D_yyyyyzz*v238
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    L_yyyy    = D_xxxyyyy*v92 + D_xxyyyy*v83 + D_xxyyyyy*v93 + D_xxyyyyz*v94 + D_xyyyyy* &
      M_xy + D_xyyyyyy*v243 + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy* &
      M_0 + D_yyyyyy*v180 + D_yyyyyyy*v182 + D_yyyyyyz*v234 + D_yyyyyz* &
      M_yz + D_yyyyyzz*v244 + D_yyyyzz*v238 + D_yyyyzzz*v239 + M_xzz* &
      v181
    L_yyyyz   = D_xxyyyyz*v83 + D_xyyyyyz*M_xy + D_xyyyyzz*M_xz + D_yyyyyyz*v180 + &
      D_yyyyyzz*M_yz + D_yyyyz*M_0 + D_yyyyzzz*v238
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    L_yyy     = D_xxxxyyy*v112 + D_xxxyyy*v92 + D_xxxyyyy*v113 + D_xxxyyyz*v114 + &
      D_xxyyy*v83 + D_xxyyyy*v93 + D_xxyyyyy*v115 + D_xxyyyyz*v116 + &
      D_xxyyyz*v94 + D_xxyyyzz*v117 + D_xyyyy*M_xy + D_xyyyyy*v243 + &
      D_xyyyyyy*v245 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v180 + D_yyyyyy*v182 + D_yyyyyyy*v187 + D_yyyyyyz*v231 + &
      D_yyyyyz*v234 + D_yyyyyzz*v235 + D_yyyyz*M_yz + D_yyyyzz*v244 + &
      D_yyyyzzz*v246 + D_yyyzz*v238 + D_yyyzzz*v239 + D_yyyzzzz*v240 + &
      M_xyyz*v183 + M_xyzz*v181 + M_xzz*v184 + M_xzzz*v185
    L_yyyz    = D_xxxyyyz*v92 + D_xxyyyyz*v93 + D_xxyyyz*v83 + D_xxyyyzz*v94 + D_xyyyyyz &
      *v243 + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz + &
      D_yyyyyyz*v182 + D_yyyyyz*v180 + D_yyyyyzz*v234 + D_yyyyzz*M_yz + &
      D_yyyyzzz*v244 + D_yyyz*M_0 + D_yyyzzz*v238 + D_yyyzzzz*v239 + &
      M_xzz*v186
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    L_yy      = D_xxxxxyy*v149 + D_xxxxyy*v112 + D_xxxxyyy*v150 + D_xxxxyyz*v151 + &
      D_xxxyy*v92 + D_xxxyyy*v113 + D_xxxyyyy*v152 + D_xxxyyyz*v153 + &
      D_xxxyyz*v114 + D_xxxyyzz*v154 + D_xxyy*v83 + D_xxyyy*v93 + &
      D_xxyyyy*v115 + D_xxyyyyy*v155 + D_xxyyyyz*v156 + D_xxyyyz*v116 + &
      D_xxyyyzz*v157 + D_xxyyz*v94 + D_xxyyzz*v117 + D_xxyyzzz*v158 + &
      D_xyyy*M_xy + D_xyyyy*v243 + D_xyyyyy*v245 + D_xyyyyyy*v247 + &
      D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 + D_yyyy*v180 + D_yyyyy* &
      v182 + D_yyyyyy*v187 + D_yyyyyyy*v196 + D_yyyyyyz*v229 + D_yyyyyz &
      *v231 + D_yyyyyzz*v232 + D_yyyyz*v234 + D_yyyyzz*v235 + D_yyyyzzz &
      *v236 + D_yyyz*M_yz + D_yyyzz*v244 + D_yyyzzz*v246 + D_yyyzzzz* &
      v248 + D_yyzz*v238 + D_yyzzz*v239 + D_yyzzzz*v240 + D_yyzzzzz* &
      v241 + M_xyyyz*v188 + M_xyyz*v189 + M_xyyzz*v190 + M_xyzz*v184 + &
      M_xyzzz*v185 + M_xzz*v191 + M_xzzz*v192 + M_xzzzz*v193
    L_yyz     = D_xxxxyyz*v112 + D_xxxyyyz*v113 + D_xxxyyz*v92 + D_xxxyyzz*v114 + &
      D_xxyyyyz*v115 + D_xxyyyz*v93 + D_xxyyyzz*v116 + D_xxyyz*v83 + &
      D_xxyyzz*v94 + D_xxyyzzz*v117 + D_xyyyyyz*v245 + D_xyyyyz*v243 + &
      D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyz*v187 + &
      D_yyyyyz*v182 + D_yyyyyzz*v231 + D_yyyyz*v180 + D_yyyyzz*v234 + &
      D_yyyyzzz*v235 + D_yyyzz*M_yz + D_yyyzzz*v244 + D_yyyzzzz*v246 + &
      D_yyz*M_0 + D_yyzzz*v238 + D_yyzzzz*v239 + D_yyzzzzz*v240 + &
      M_xyyz*v181 + M_xyzz*v186 + M_xzz*v194 + M_xzzz*v195
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    L_y       = D_xxxxxxy*v212 + D_xxxxxy*v149 + D_xxxxxyy*v213 + D_xxxxxyz*v214 + &
      D_xxxxy*v112 + D_xxxxyy*v150 + D_xxxxyyy*v215 + D_xxxxyyz*v216 + &
      D_xxxxyz*v151 + D_xxxxyzz*v217 + D_xxxy*v92 + D_xxxyy*v113 + &
      D_xxxyyy*v152 + D_xxxyyyy*v218 + D_xxxyyyz*v219 + D_xxxyyz*v153 + &
      D_xxxyyzz*v220 + D_xxxyz*v114 + D_xxxyzz*v154 + D_xxxyzzz*v221 + &
      D_xxy*v83 + D_xxyy*v93 + D_xxyyy*v115 + D_xxyyyy*v155 + D_xxyyyyy &
      *v222 + D_xxyyyyz*v223 + D_xxyyyz*v156 + D_xxyyyzz*v224 + D_xxyyz &
      *v116 + D_xxyyzz*v157 + D_xxyyzzz*v225 + D_xxyz*v94 + D_xxyzz* &
      v117 + D_xxyzzz*v158 + D_xxyzzzz*v226 + D_xyy*M_xy + D_xyyy*v243 &
      + D_xyyyy*v245 + D_xyyyyy*v247 + D_xyyyyyy*v249 + D_xyyz*M_xyz + &
      D_xyz*M_xz + D_y*M_0 + D_yyy*v180 + D_yyyy*v182 + D_yyyyy*v187 + &
      D_yyyyyy*v196 + D_yyyyyyy*v227 + D_yyyyyyz*v228 + D_yyyyyz*v229 + &
      D_yyyyyzz*v230 + D_yyyyz*v231 + D_yyyyzz*v232 + D_yyyyzzz*v233 + &
      D_yyyz*v234 + D_yyyzz*v235 + D_yyyzzz*v236 + D_yyyzzzz*v237 + &
      D_yyz*M_yz + D_yyzz*v244 + D_yyzzz*v246 + D_yyzzzz*v248 + &
      D_yyzzzzz*v250 + D_yzz*v238 + D_yzzz*v239 + D_yzzzz*v240 + &
      D_yzzzzz*v241 + D_yzzzzzz*v242 + M_xyyyyz*v197 + M_xyyyz*v198 + &
      M_xyyyzz*v199 + M_xyyz*v200 + M_xyyzz*v201 + M_xyyzzz*v202 + &
      M_xyzz*v191 + M_xyzzz*v192 + M_xyzzzz*v193 + M_xzz*v203 + M_xzzz* &
      v204 + M_xzzzz*v205 + M_xzzzzz*v206
    L_yz      = D_xxxxxyz*v149 + D_xxxxyyz*v150 + D_xxxxyz*v112 + D_xxxxyzz*v151 + &
      D_xxxyyyz*v152 + D_xxxyyz*v113 + D_xxxyyzz*v153 + D_xxxyz*v92 + &
      D_xxxyzz*v114 + D_xxxyzzz*v154 + D_xxyyyyz*v155 + D_xxyyyz*v115 + &
      D_xxyyyzz*v156 + D_xxyyz*v93 + D_xxyyzz*v116 + D_xxyyzzz*v157 + &
      D_xxyz*v83 + D_xxyzz*v94 + D_xxyzzz*v117 + D_xxyzzzz*v158 + &
      D_xyyyyyz*v247 + D_xyyyyz*v245 + D_xyyyz*v243 + D_xyyz*M_xy + &
      D_xyyzz*M_xyz + D_xyzz*M_xz + D_yyyyyyz*v196 + D_yyyyyz*v187 + &
      D_yyyyyzz*v229 + D_yyyyz*v182 + D_yyyyzz*v231 + D_yyyyzzz*v232 + &
      D_yyyz*v180 + D_yyyzz*v234 + D_yyyzzz*v235 + D_yyyzzzz*v236 + &
      D_yyzz*M_yz + D_yyzzz*v244 + D_yyzzzz*v246 + D_yyzzzzz*v248 + &
      D_yz*M_0 + D_yzzz*v238 + D_yzzzz*v239 + D_yzzzzz*v240 + D_yzzzzzz &
      *v241 + M_xyyyz*v207 + M_xyyz*v184 + M_xyyzz*v208 + M_xyzz*v194 + &
      M_xyzzz*v195 + M_xzz*v209 + M_xzzz*v210 + M_xzzzz*v211
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_z       = 0.00833333333333333d0*(30.0d0*D_xyyzzz*M_xyyzz + 10.0d0*D_xyyzzzz* &
      M_xyyzzz + 60.0d0*D_xzzz*M_xzz + D_xzzzzzz*M_xzzzzz + 5.0d0*( &
      D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + 20.0d0*(D_xyyyzz*M_xyyyz &
      + D_xzzzz*M_xzzz)) + D_xxxxxxz*v212 + D_xxxxxyz*v213 + D_xxxxxz* &
      v149 + D_xxxxxzz*v214 + D_xxxxyyz*v215 + D_xxxxyz*v150 + &
      D_xxxxyzz*v216 + D_xxxxz*v112 + D_xxxxzz*v151 + D_xxxxzzz*v217 + &
      D_xxxyyyz*v218 + D_xxxyyz*v152 + D_xxxyyzz*v219 + D_xxxyz*v113 + &
      D_xxxyzz*v153 + D_xxxyzzz*v220 + D_xxxz*v92 + D_xxxzz*v114 + &
      D_xxxzzz*v154 + D_xxxzzzz*v221 + D_xxyyyyz*v222 + D_xxyyyz*v155 + &
      D_xxyyyzz*v223 + D_xxyyz*v115 + D_xxyyzz*v156 + D_xxyyzzz*v224 + &
      D_xxyz*v93 + D_xxyzz*v116 + D_xxyzzz*v157 + D_xxyzzzz*v225 + &
      D_xxz*v83 + D_xxzz*v94 + D_xxzzz*v117 + D_xxzzzz*v158 + D_xxzzzzz &
      *v226 + D_xyyyyyz*v249 + D_xyyyyz*v247 + D_xyyyz*v245 + D_xyyz* &
      v243 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyyyyz*v227 + &
      D_yyyyyz*v196 + D_yyyyyzz*v228 + D_yyyyz*v187 + D_yyyyzz*v229 + &
      D_yyyyzzz*v230 + D_yyyz*v182 + D_yyyzz*v231 + D_yyyzzz*v232 + &
      D_yyyzzzz*v233 + D_yyz*v180 + D_yyzz*v234 + D_yyzzz*v235 + &
      D_yyzzzz*v236 + D_yyzzzzz*v237 + D_yzz*M_yz + D_yzzz*v244 + &
      D_yzzzz*v246 + D_yzzzzz*v248 + D_yzzzzzz*v250 + D_z*M_0 + D_zzz* &
      v238 + D_zzzz*v239 + D_zzzzz*v240 + D_zzzzzz*v241 + D_zzzzzzz* &
      v242 + M_xyyyzz*v202 + M_xyyz*v191 + M_xyzz*v209 + M_xyzzz*v210 + &
      M_xyzzzz*v211
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  x                   
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  L_x                 
#undef  M_xx                
#undef  L_y                 
#undef  M_xy                
#undef  L_z                 
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
#undef  M_xxxz              
#undef  L_xxxx              
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
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxz             
#undef  L_xxxxy             
#undef  M_xxxyy             
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
#undef  M_xxxxxx            
#undef  L_yyyyz             
#undef  M_xxxxxy            
#undef  L_xxxxxx            
#undef  M_xxxxxz            
#undef  L_xxxxxy            
#undef  M_xxxxyy            
#undef  L_xxxxxz            
#undef  M_xxxxyz            
#undef  M_xxxyyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  M_xxyyyy            
#undef  L_xxxyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
#undef  L_xxyyyy            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_yyyyyy            
#undef  L_xyyyyz            
#undef  M_yyyyyz            
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  L_xxyyyyz           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
    end subroutine mom_es_M2L2
    
! OPS  216*ADD + 2*DIV + 313*MUL + 56*NEG + POW = 588  (1042 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15,&
                v16, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v7, v8, v9, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz,&
                L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz,&
                L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz,&
                L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz,&
                L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define Phi_x                Phi(1:2,0)
#define x                    r(1:2,1)
#define Phi_y                Phi(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define Phi_z                Phi(1:2,2)
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
#define L_xxxxxxx            L(1:2,48)
#define L_xxxxxxy            L(1:2,49)
#define L_xxxxxxz            L(1:2,50)
#define L_xxxxxyy            L(1:2,51)
#define L_xxxxxyz            L(1:2,52)
#define L_xxxxyyy            L(1:2,53)
#define L_xxxxyyz            L(1:2,54)
#define L_xxxyyyy            L(1:2,55)
#define L_xxxyyyz            L(1:2,56)
#define L_xxyyyyy            L(1:2,57)
#define L_xxyyyyz            L(1:2,58)
#define L_xyyyyyy            L(1:2,59)
#define L_xyyyyyz            L(1:2,60)
#define L_yyyyyyy            L(1:2,61)
#define L_yyyyyyz            L(1:2,62)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v13       = L_xyyyyy + L_xyyyyyz*z
    v17       = 2.0d0*z
    v21       = 6.0d0*z
    v26       = 24.0d0*z
    v31       = 2.0d0*y
    v32       = L_xxxxxy + L_xxxxxyz*z
    v33       = 0.00833333333333333d0*y
    v34       = 120.0d0*z
    v41       = L_xxxxyy + L_xxxxyyz*z
    v42       = 3.0d0*y
    v47       = L_xxxyyy + L_xxxyyyz*z
    v50       = 4.0d0*y
    v52       = 0.00833333333333333d0*x
    v54       = L_xxyyyy + L_xxyyyyz*z
    v59       = 5.0d0*y
    L_zz      = -(L_xx + L_yy)
    L_xzz     = -(L_xxx + L_xyy)
    L_yzz     = -(L_xxy + L_yyy)
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    L_xyzz    = -(L_xxxy + L_xyyy)
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    L_yyzzz   = -(L_xxyyz + L_yyyyz)
    L_yzzzz   = -(L_xxyzz + L_yyyzz)
    L_zzzzz   = -(L_xxzzz + L_yyzzz)
    L_xxxxzz  = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz  = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz  = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz  = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz  = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz  = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz  = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz  = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz  = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz  = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz  = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz = -(L_xxxxxxx + L_xxxxxyy)
    L_xxxxyzz = -(L_xxxxxxy + L_xxxxyyy)
    L_xxxxzzz = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz = -(L_xxxxxyy + L_xxxyyyy)
    L_xxxyzzz = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz = -(L_xxxxyyy + L_xxyyyyy)
    L_xxyyzzz = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz = -(L_xxzzzzz + L_yyzzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v44       = a2
    v45       = 0.0208333333333333d0*v44
    a3        = a1*a2
    v39       = 0.0277777777777778d0*a3
    a4        = a2*a2
    v30       = 0.0208333333333333d0*a4
    a5        = a2*a3
    v14       = 0.00833333333333333d0*a5
    a6        = a3*a3
    v0        = 0.00138888888888889d0*a6
    a7        = a3*a4
    b2        = b1*b1
    v24       = b2
    v25       = 0.0208333333333333d0*v24
    v40       = 3.0d0*v24
    v48       = 6.0d0*v24
    v57       = 10.0d0*v24
    b3        = b1*b2
    v19       = b3
    v20       = 0.0277777777777778d0*v19
    v46       = 4.0d0*v19
    v55       = 10.0d0*v19
    b4        = b2*b2
    v15       = b4
    v16       = 0.0208333333333333d0*v15
    v53       = 5.0d0*v15
    b5        = b2*b3
    v11       = b5
    v12       = 0.00833333333333333d0*v11
    b6        = b3*b3
    v1        = 0.00138888888888889d0*b6
    b7        = b3*b4
    c2        = c1*c1
    v2        = c2
    v3        = 0.5d0*v2
    v22       = 3.0d0*v2
    v27       = 12.0d0*v2
    v35       = 60.0d0*v2
    v43       = 2.0d0*L_xxxxy + L_xxxxyz*v17 + L_xxxxyzz*v2
    v49       = 2.0d0*L_xxxyy + L_xxxyyz*v17 + L_xxxyyzz*v2
    v56       = 2.0d0*L_xxyyy + L_xxyyyz*v17 + L_xxyyyzz*v2
    v18       = 2.0d0*L_xyyyy + L_xyyyyz*v17 + L_xyyyyzz*v2
    h         = v2 + v24 + v44
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
    u14       = u7*u7
    u15       = u7*u8
    c3        = c1*c2
    v4        = c3
    v5        = 0.166666666666667d0*v4
    v28       = 4.0d0*v4
    v36       = 20.0d0*v4
    v51       = 6.0d0*L_xxxy + L_xxxyz*v21 + L_xxxyzz*v22 + L_xxxyzzz*v4
    v58       = 6.0d0*L_xxyy + L_xxyyz*v21 + L_xxyyzz*v22 + L_xxyyzzz*v4
    v23       = 6.0d0*L_xyyy + L_xyyyz*v21 + L_xyyyzz*v22 + L_xyyyzzz*v4
    c4        = c2*c2
    v6        = c4
    v7        = 0.0416666666666667d0*v6
    v37       = 5.0d0*v6
    v60       = 24.0d0*L_xxy + L_xxyz*v26 + L_xxyzz*v27 + L_xxyzzz*v28 + L_xxyzzzz*v6
    v29       = 24.0d0*L_xyy + L_xyyz*v26 + L_xyyzz*v27 + L_xyyzzz*v28 + L_xyyzzzz*v6
    c5        = c2*c3
    v8        = c5
    v9        = 0.00833333333333333d0*v8
    v38       = 120.0d0*L_xy + L_xyz*v34 + L_xyzz*v35 + L_xyzzz*v36 + L_xyzzzz*v37 + &
      L_xyzzzzz*v8
    c6        = c3*c3
    v10       = 0.00138888888888889d0*c6
    Phi_x     = L_x + L_xxxxxxx*v0 + L_xyyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v9 + L_xzzzzzz*v10 + v12*v13 + v14*( &
      L_xxxxxx + L_xxxxxxy*y + L_xxxxxxz*z) + v16*v18 + v20*v23 + v25* &
      v29 + v30*(2.0d0*L_xxxxx + L_xxxxxyy*v24 + L_xxxxxz*v17 + &
      L_xxxxxzz*v2 + v31*v32) + v33*v38 + v39*(6.0d0*L_xxxx + L_xxxxyyy &
      *v19 + L_xxxxz*v21 + L_xxxxzz*v22 + L_xxxxzzz*v4 + v40*v41 + v42* &
      v43) + v45*(24.0d0*L_xxx + L_xxxyyyy*v15 + L_xxxz*v26 + L_xxxzz* &
      v27 + L_xxxzzz*v28 + L_xxxzzzz*v6 + v46*v47 + v48*v49 + v50*v51) &
      + v52*(120.0d0*L_xx + L_xxyyyyy*v11 + L_xxz*v34 + L_xxzz*v35 + &
      L_xxzzz*v36 + L_xxzzzz*v37 + L_xxzzzzz*v8 + v53*v54 + v55*v56 + &
      v57*v58 + v59*v60)
    Phi_y     = L_y + L_xxxxxxy*v0 + L_yyyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v9 + L_yzzzzzz*v10 + v12*(L_yyyyyy + &
      L_yyyyyyz*z) + v14*(L_xxxxxyy*y + v32) + v16*(2.0d0*L_yyyyy + &
      L_yyyyyz*v17 + L_yyyyyzz*v2) + v20*(6.0d0*L_yyyy + L_yyyyz*v21 + &
      L_yyyyzz*v22 + L_yyyyzzz*v4) + v25*(24.0d0*L_yyy + L_yyyz*v26 + &
      L_yyyzz*v27 + L_yyyzzz*v28 + L_yyyzzzz*v6) + v30*(L_xxxxyyy*v24 + &
      v31*v41 + v43) + v33*(120.0d0*L_yy + L_yyz*v34 + L_yyzz*v35 + &
      L_yyzzz*v36 + L_yyzzzz*v37 + L_yyzzzzz*v8) + v39*(L_xxxyyyy*v19 + &
      v40*v47 + v42*v49 + v51) + v45*(L_xxyyyyy*v15 + v46*v54 + v48*v56 &
      + v50*v58 + v60) + v52*(L_xyyyyyy*v11 + v13*v53 + v18*v55 + v23* &
      v57 + v29*v59 + v38)
    Phi_z     = L_z + L_xxxxxxz*v0 + L_yyyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v9 + L_zzzzzzz*v10 + v12*(L_yyyyyz + &
      L_yyyyyzz*z) + v14*(L_xxxxxyz*y + L_xxxxxz + L_xxxxxzz*z) + v16*( &
      2.0d0*L_yyyyz + L_yyyyzz*v17 + L_yyyyzzz*v2) + v20*(6.0d0*L_yyyz &
      + L_yyyzz*v21 + L_yyyzzz*v22 + L_yyyzzzz*v4) + v25*(24.0d0*L_yyz &
      + L_yyzz*v26 + L_yyzzz*v27 + L_yyzzzz*v28 + L_yyzzzzz*v6) + v30*( &
      L_xxxxyyz*v24 + 2.0d0*L_xxxxz + L_xxxxzz*v17 + L_xxxxzzz*v2 + v31 &
      *(L_xxxxyz + L_xxxxyzz*z)) + v33*(120.0d0*L_yz + L_yzz*v34 + &
      L_yzzz*v35 + L_yzzzz*v36 + L_yzzzzz*v37 + L_yzzzzzz*v8) + v39*( &
      L_xxxyyyz*v19 + 6.0d0*L_xxxz + L_xxxzz*v21 + L_xxxzzz*v22 + &
      L_xxxzzzz*v4 + v40*(L_xxxyyz + L_xxxyyzz*z) + v42*(2.0d0*L_xxxyz &
      + L_xxxyzz*v17 + L_xxxyzzz*v2)) + v45*(L_xxyyyyz*v15 + 24.0d0* &
      L_xxz + L_xxzz*v26 + L_xxzzz*v27 + L_xxzzzz*v28 + L_xxzzzzz*v6 + &
      v46*(L_xxyyyz + L_xxyyyzz*z) + v48*(2.0d0*L_xxyyz + L_xxyyzz*v17 &
      + L_xxyyzzz*v2) + v50*(6.0d0*L_xxyz + L_xxyzz*v21 + L_xxyzzz*v22 &
      + L_xxyzzzz*v4)) + v52*(L_xyyyyyz*v11 + 120.0d0*L_xz + L_xzz*v34 &
      + L_xzzz*v35 + L_xzzzz*v36 + L_xzzzzz*v37 + L_xzzzzzz*v8 + v53*( &
      L_xyyyyz + L_xyyyyzz*z) + v55*(2.0d0*L_xyyyz + L_xyyyzz*v17 + &
      L_xyyyzzz*v2) + v57*(6.0d0*L_xyyz + L_xyyzz*v21 + L_xyyzzz*v22 + &
      L_xyyzzzz*v4) + v59*(24.0d0*L_xyz + L_xyzz*v26 + L_xyzzz*v27 + &
      L_xyzzzz*v28 + L_xyzzzzz*v6))
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  Phi_x               
#undef  x                   
#undef  Phi_y               
#undef  L_y                 
#undef  L_z                 
#undef  Phi_z               
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
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  L_xxxxxxz           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  L_xxyyyyz           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
    end subroutine mom_es_L2P2
    
! OPS  577*ADD + 2*DIV + 664*MUL + 56*NEG + POW = 1300  (3673 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v155, v156, v157, v158,&
                v159, v16, v160, v161, v162, v163, v164, v165, v166, v167,&
                v168, v169, v17, v170, v171, v172, v173, v174, v175, v176,&
                v177, v178, v179, v18, v180, v181, v182, v183, v184, v185,&
                v186, v187, v188, v189, v19, v190, v191, v192, v193, v194,&
                v195, v196, v197, v198, v199, v2, v20, v200, v201, v202, v203,&
                v204, v205, v206, v207, v208, v209, v21, v210, v211, v212,&
                v213, v214, v215, v216, v217, v218, v219, v22, v220, v221,&
                v222, v223, v224, v225, v226, v227, v228, v229, v23, v230,&
                v231, v232, v233, v234, v235, v236, v237, v238, v239, v24,&
                v240, v241, v242, v243, v244, v245, v246, v247, v248, v249,&
                v25, v250, v251, v252, v253, v254, v255, v256, v257, v258,&
                v259, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
                v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46,&
                v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57,&
                v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68,&
                v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8,&
                v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90,&
                v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz,&
                L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz,&
                L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz,&
                L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz,&
                L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz,&
                L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz, L_xxxyyzz,&
                L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz, L_xxyzzzz,&
                L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz, L_xyzzzzz,&
                L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz, L_yyzzzzz,&
                L_yzzzzzz, L_zzzzzzz
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
#define Ls_xxy               Ls(1:2,9)
#define L_xxy                L(1:2,9)
#define L_xxz                L(1:2,10)
#define Ls_xxz               Ls(1:2,10)
#define L_xyy                L(1:2,11)
#define Ls_xyy               Ls(1:2,11)
#define Ls_xyz               Ls(1:2,12)
#define L_xyz                L(1:2,12)
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
#define Ls_xxxxxxx           Ls(1:2,48)
#define L_xxxxxxx            L(1:2,48)
#define Ls_xxxxxxy           Ls(1:2,49)
#define L_xxxxxxy            L(1:2,49)
#define Ls_xxxxxxz           Ls(1:2,50)
#define L_xxxxxxz            L(1:2,50)
#define Ls_xxxxxyy           Ls(1:2,51)
#define L_xxxxxyy            L(1:2,51)
#define Ls_xxxxxyz           Ls(1:2,52)
#define L_xxxxxyz            L(1:2,52)
#define L_xxxxyyy            L(1:2,53)
#define Ls_xxxxyyy           Ls(1:2,53)
#define Ls_xxxxyyz           Ls(1:2,54)
#define L_xxxxyyz            L(1:2,54)
#define L_xxxyyyy            L(1:2,55)
#define Ls_xxxyyyy           Ls(1:2,55)
#define Ls_xxxyyyz           Ls(1:2,56)
#define L_xxxyyyz            L(1:2,56)
#define Ls_xxyyyyy           Ls(1:2,57)
#define L_xxyyyyy            L(1:2,57)
#define Ls_xxyyyyz           Ls(1:2,58)
#define L_xxyyyyz            L(1:2,58)
#define Ls_xyyyyyy           Ls(1:2,59)
#define L_xyyyyyy            L(1:2,59)
#define L_xyyyyyz            L(1:2,60)
#define Ls_xyyyyyz           Ls(1:2,60)
#define Ls_yyyyyyy           Ls(1:2,61)
#define L_yyyyyyy            L(1:2,61)
#define Ls_yyyyyyz           Ls(1:2,62)
#define L_yyyyyyz            L(1:2,62)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0         = L_xxxxxx + L_xxxxxxy*y + L_xxxxxxz*z
    v1         = L_xxxxxy + L_xxxxxyz*z
    v2         = L_xxxxxyy*y + v1
    v3         = L_xxxxyy + L_xxxxyyz*z
    v4         = L_xxxxyyy*y + v3
    v5         = L_xxxyyy + L_xxxyyyz*z
    v6         = L_xxxyyyy*y + v5
    v7         = L_xxyyyy + L_xxyyyyz*z
    v8         = L_xxyyyyy*y + v7
    v9         = L_xyyyyy + L_xyyyyyz*z
    v10        = L_xyyyyyy*y + v9
    v11        = L_yyyyyy + L_yyyyyyz*z
    v12        = L_xxxxxz*z
    v19        = v1*y
    v21        = L_xxxxyz*z
    v24        = v3*y
    v27        = L_xxxxz*z
    v38        = 0.5d0*x
    v44        = L_xxxyyz*z
    v47        = v5*y
    v50        = L_xxxyz*z
    v61        = L_xxxz*z
    v75        = 0.166666666666667d0*x
    v85        = L_xxyyyz*z
    v88        = v7*y
    v91        = L_xxyyz*z
    v102       = L_xxyz*z
    v118       = L_xxz*z
    v134       = 0.0416666666666667d0*x
    v146       = L_xyyyyz*z
    v149       = v9*y
    v152       = L_xyyyz*z
    v163       = L_xyyz*z
    v179       = L_xyz*z
    v211       = 0.00833333333333333d0*y
    v215       = 0.00833333333333333d0*x
    v225       = L_yyyyyz*z
    v228       = L_yyyyz*z
    v230       = 0.5d0*y
    v234       = L_yyyz*z
    v237       = 0.166666666666667d0*y
    v243       = L_yyz*z
    v247       = 0.0416666666666667d0*y
    Ls_xxxxxx  = L_xxxxxxx*x + v0
    Ls_xxxxxy  = L_xxxxxxy*x + v2
    Ls_xxxxyy  = L_xxxxxyy*x + v4
    Ls_xxxyyy  = L_xxxxyyy*x + v6
    Ls_xxyyyy  = L_xxxyyyy*x + v8
    Ls_xyyyyy  = L_xxyyyyy*x + v10
    Ls_yyyyyy  = v11 + L_xyyyyyy*x + L_yyyyyyy*y
    Ls_xxxxxxx = L_xxxxxxx
    Ls_xxxxxxy = L_xxxxxxy
    Ls_xxxxxxz = L_xxxxxxz
    Ls_xxxxxyy = L_xxxxxyy
    Ls_xxxxxyz = L_xxxxxyz
    Ls_xxxxyyy = L_xxxxyyy
    Ls_xxxxyyz = L_xxxxyyz
    Ls_xxxyyyy = L_xxxyyyy
    Ls_xxxyyyz = L_xxxyyyz
    Ls_xxyyyyy = L_xxyyyyy
    Ls_xxyyyyz = L_xxyyyyz
    Ls_xyyyyyy = L_xyyyyyy
    Ls_xyyyyyz = L_xyyyyyz
    Ls_yyyyyyy = L_yyyyyyy
    Ls_yyyyyyz = L_yyyyyyz
    L_zz       = -(L_xx + L_yy)
    L_xzz      = -(L_xxx + L_xyy)
    v217       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v257       = L_yzz*z
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    v137       = L_xxzz*z
    L_xyzz     = -(L_xxxy + L_xyyy)
    v190       = L_xyzz*z
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    v251       = L_yyzz*z
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    v78        = L_xxxzz*z
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    v111       = L_xxyzz*z
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    v172       = L_xyyzz*z
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    v240       = L_yyyzz*z
    L_yyzzz    = -(L_xxyyz + L_yyyyz)
    L_yzzzz    = -(L_xxyzz + L_yyyzz)
    L_zzzzz    = -(L_xxzzz + L_yyzzz)
    L_xxxxzz   = -(L_xxxxxx + L_xxxxyy)
    v40        = L_xxxxzz*z
    L_xxxyzz   = -(L_xxxxxy + L_xxxyyy)
    v57        = L_xxxyzz*z
    L_xxxzzz   = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz   = -(L_xxxxyy + L_xxyyyy)
    v98        = L_xxyyzz*z
    L_xxyzzz   = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz   = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz   = -(L_xxxyyy + L_xyyyyy)
    v159       = L_xyyyzz*z
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    v232       = L_yyyyzz*z
    L_yyyzzz   = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz   = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz   = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz   = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz  = -(L_xxxxxxx + L_xxxxxyy)
    v20        = L_xxxxxz + L_xxxxxyz*y + L_xxxxxzz*z
    Ls_xxxxxz  = L_xxxxxxz*x + v20
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    v25        = L_xxxxyz + L_xxxxyzz*z
    v26        = L_xxxxyyz*y + v25
    v43        = v25*y
    Ls_xxxxyz  = L_xxxxxyz*x + v26
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    v48        = L_xxxyyz + L_xxxyyzz*z
    v49        = L_xxxyyyz*y + v48
    v60        = v48*y
    Ls_xxxyyz  = L_xxxxyyz*x + v49
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    v89        = L_xxyyyz + L_xxyyyzz*z
    v90        = L_xxyyyyz*y + v89
    v101       = v89*y
    Ls_xxyyyz  = L_xxxyyyz*x + v90
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    v150       = L_xyyyyz + L_xyyyyzz*z
    v151       = L_xyyyyyz*y + v150
    v162       = v150*y
    Ls_xyyyyz  = L_xxyyyyz*x + v151
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    v227       = L_yyyyyz + L_yyyyyzz*z
    Ls_yyyyyz  = v227 + L_xyyyyyz*x + L_yyyyyyz*y
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v13        = a2
    v14        = 0.5d0*v13
    v74        = 0.25d0*v13
    v133       = 0.0833333333333333d0*v13
    v214       = 0.0208333333333333d0*v13
    a3         = a1*a2
    v28        = a3
    v29        = 0.166666666666667d0*v28
    v132       = 0.0833333333333333d0*v28
    v213       = 0.0277777777777778d0*v28
    a4         = a2*a2
    v62        = a4
    v63        = 0.0416666666666667d0*v62
    v210       = 0.0208333333333333d0*v62
    a5         = a2*a3
    v119       = 0.00833333333333333d0*a5
    a6         = a3*a3
    v199       = 0.00138888888888889d0*a6
    a7         = a3*a4
    b2         = b1*b1
    v15        = b2
    v16        = L_xxxxxyy*v15
    v22        = L_xxxxyyy*v15
    v35        = 0.5d0*v15
    v41        = L_xxxxyyz*v15
    v45        = L_xxxyyyy*v15
    v58        = L_xxxyyyz*v15
    v76        = 3.0d0*v15
    v86        = L_xxyyyyy*v15
    v99        = L_xxyyyyz*v15
    v147       = L_xyyyyyy*v15
    v160       = L_xyyyyyz*v15
    v209       = 0.0208333333333333d0*v15
    v236       = 0.25d0*v15
    v246       = 0.0833333333333333d0*v15
    b3         = b1*b2
    v30        = b3
    v31        = L_xxxxyyy*v30
    v51        = L_xxxyyyy*v30
    v70        = 0.166666666666667d0*v30
    v79        = L_xxxyyyz*v30
    v92        = L_xxyyyyy*v30
    v112       = L_xxyyyyz*v30
    v135       = 4.0d0*v30
    v153       = L_xyyyyyy*v30
    v173       = L_xyyyyyz*v30
    v208       = 0.0277777777777778d0*v30
    v245       = 0.0833333333333333d0*v30
    b4         = b2*b2
    v64        = b4
    v65        = L_xxxyyyy*v64
    v103       = L_xxyyyyy*v64
    v127       = 0.0416666666666667d0*v64
    v138       = L_xxyyyyz*v64
    v164       = L_xyyyyyy*v64
    v191       = L_xyyyyyz*v64
    v207       = 0.0208333333333333d0*v64
    v216       = 5.0d0*v64
    b5         = b2*b3
    v120       = b5
    v121       = L_xxyyyyy*v120
    v180       = L_xyyyyyy*v120
    v206       = 0.00833333333333333d0*v120
    v218       = L_xyyyyyz*v120
    b6         = b3*b3
    v200       = 0.00138888888888889d0*b6
    b7         = b3*b4
    c2         = c1*c1
    v17        = c2
    v201       = 0.5d0*v17
    v238       = 3.0d0*v17
    v248       = 12.0d0*v17
    v254       = 60.0d0*v17
    v122       = L_xxzz*v17
    v181       = L_xyzz*v17
    v66        = L_xxxzz*v17
    v104       = L_xxyzz*v17
    v139       = L_xxzzz*v17
    v165       = L_xyyzz*v17
    v192       = L_xyzzz*v17
    v32        = L_xxxxzz*v17
    v52        = L_xxxyzz*v17
    v80        = L_xxxzzz*v17
    v93        = L_xxyyzz*v17
    v113       = L_xxyzzz*v17
    v154       = L_xyyyzz*v17
    v174       = L_xyyzzz*v17
    v18        = L_xxxxxzz*v17
    v39        = v16 + v18 + 2.0d0*(L_xxxxx + v12 + v19)
    Ls_xxxxx   = 0.5d0*(v16 + v18) + L_xxxxx + L_xxxxxxx*v14 + v0*x + v12 + v19
    v23        = L_xxxxyzz*v17
    v36        = v23 + 2.0d0*(L_xxxxy + v21)
    v37        = v36*y
    v56        = 2.0d0*v24 + v22 + v36
    Ls_xxxxy   = 0.5d0*(v22 + v23) + L_xxxxxxy*v14 + L_xxxxy + v2*x + v21 + v24
    v42        = L_xxxxzzz*v17
    v84        = v41 + v42 + 2.0d0*(L_xxxxz + v40 + v43)
    Ls_xxxxz   = 0.5d0*(v41 + v42) + L_xxxxxxz*v14 + L_xxxxz + v20*x + v40 + v43
    v46        = L_xxxyyzz*v17
    v54        = v46 + 2.0d0*(L_xxxyy + v44)
    v55        = v54*y
    v71        = v15*v54
    v97        = 2.0d0*v47 + v45 + v54
    Ls_xxxyy   = 0.5d0*(v45 + v46) + L_xxxxxyy*v14 + L_xxxyy + v4*x + v44 + v47
    v59        = L_xxxyzzz*v17
    v82        = v59 + 2.0d0*(L_xxxyz + v57)
    v83        = v82*y
    v117       = 2.0d0*v60 + v58 + v82
    Ls_xxxyz   = 0.5d0*(v58 + v59) + L_xxxxxyz*v14 + L_xxxyz + v26*x + v57 + v60
    v87        = L_xxyyyzz*v17
    v95        = v87 + 2.0d0*(L_xxyyy + v85)
    v96        = v95*y
    v107       = v15*v95
    v128       = v30*v95
    v158       = 2.0d0*v88 + v86 + v95
    Ls_xxyyy   = 0.5d0*(v86 + v87) + L_xxxxyyy*v14 + L_xxyyy + v6*x + v85 + v88
    v100       = L_xxyyzzz*v17
    v115       = v100 + 2.0d0*(L_xxyyz + v98)
    v116       = v115*y
    v142       = v115*v15
    v178       = 2.0d0*v101 + v115 + v99
    Ls_xxyyz   = 0.5d0*(v100 + v99) + L_xxxxyyz*v14 + L_xxyyz + v101 + v49*x + v98
    v148       = L_xyyyyzz*v17
    v156       = v148 + 2.0d0*(L_xyyyy + v146)
    v157       = v156*y
    v168       = v15*v156
    v185       = v156*v30
    Ls_xyyyy   = 0.5d0*(v147 + v148) + L_xxxyyyy*v14 + L_xyyyy + v146 + v149 + v8*x
    v161       = L_xyyyzzz*v17
    v176       = v161 + 2.0d0*(L_xyyyz + v159)
    v177       = v176*y
    v195       = v15*v176
    v220       = v176*v30
    Ls_xyyyz   = 0.5d0*(v160 + v161) + L_xxxyyyz*v14 + L_xyyyz + v159 + v162 + v90*x
    v226       = L_yyyyyzz*v17
    v231       = v226 + 2.0d0*(L_yyyyy + v225)
    Ls_yyyyy   = 0.5d0*v226 + L_xxyyyyy*v14 + L_yyyyy + L_yyyyyyy*v35 + v10*x + v11*y + &
      v225
    v233       = L_yyyyzzz*v17
    v242       = v233 + 2.0d0*(L_yyyyz + v232)
    Ls_yyyyz   = 0.5d0*v233 + L_xxyyyyz*v14 + L_yyyyyyz*v35 + L_yyyyz + v151*x + v227*y + &
      v232
    h          = v13 + v15 + v17
    u2         = 1.0/h
    u          = sqrt(u2)
    u3         = u*u2
    u4         = u2*u2
    u5         = u2*u3
    u6         = u3*u3
    u7         = u3*u4
    u8         = u4*u4
    u9         = u4*u5
    u10        = u5*u5
    u11        = u5*u6
    u12        = u6*u6
    u13        = u6*u7
    u14        = u7*u7
    u15        = u7*u8
    c3         = c1*c2
    v33        = c3
    v202       = 0.166666666666667d0*v33
    v249       = 4.0d0*v33
    v255       = 20.0d0*v33
    v123       = L_xxzzz*v33
    v182       = L_xyzzz*v33
    v67        = L_xxxzzz*v33
    v105       = L_xxyzzz*v33
    v140       = L_xxzzzz*v33
    v166       = L_xyyzzz*v33
    v193       = L_xyzzzz*v33
    v34        = L_xxxxzzz*v33
    v77        = v31 + v34 + v3*v76 + 6.0d0*(L_xxxx + v27) + 3.0d0*(v32 + v37)
    Ls_xxxx    = 0.166666666666667d0*(v31 + v34 + 3.0d0*(v32 + v37)) + L_xxxx + L_xxxxxxx &
      *v29 + v0*v14 + v27 + v3*v35 + v38*v39
    v53        = L_xxxyzzz*v33
    v72        = v53 + 3.0d0*(2.0d0*L_xxxy + 2.0d0*v50 + v52)
    v73        = v72*y
    v110       = v51 + v72 + v5*v76 + 3.0d0*v55
    Ls_xxxy    = 0.166666666666667d0*(v51 + v53 + 3.0d0*(v52 + v55)) + L_xxxxxxy*v29 + &
      L_xxxy + v14*v2 + v35*v5 + v38*v56 + v50
    v81        = L_xxxzzzz*v33
    v145       = v79 + v81 + v48*v76 + 6.0d0*(L_xxxz + v78) + 3.0d0*(v80 + v83)
    Ls_xxxz    = 0.166666666666667d0*(v79 + v81 + 3.0d0*(v80 + v83)) + L_xxxxxxz*v29 + &
      L_xxxz + v14*v20 + v35*v48 + v38*v84 + v78
    v94        = L_xxyyzzz*v33
    v108       = v94 + 3.0d0*(2.0d0*L_xxyy + 2.0d0*v91 + v93)
    v109       = v108*y
    v129       = v108*v15
    v171       = v108 + v92 + v7*v76 + 3.0d0*v96
    Ls_xxyy    = 0.166666666666667d0*(v92 + v94 + 3.0d0*(v93 + v96)) + L_xxxxxyy*v29 + &
      L_xxyy + v14*v4 + v35*v7 + v38*v97 + v91
    v114       = L_xxyzzzz*v33
    v143       = v114 + 3.0d0*(2.0d0*L_xxyz + 2.0d0*v111 + v113)
    v144       = v143*y
    v198       = v112 + v143 + 3.0d0*v116 + v76*v89
    Ls_xxyz    = 0.166666666666667d0*(v112 + v114 + 3.0d0*(v113 + v116)) + L_xxxxxyz*v29 &
      + L_xxyz + v111 + v117*v38 + v14*v26 + v35*v89
    v155       = L_xyyyzzz*v33
    v169       = v155 + 3.0d0*(2.0d0*L_xyyy + 2.0d0*v152 + v154)
    v170       = v169*y
    v186       = v15*v169
    Ls_xyyy    = 0.166666666666667d0*(v153 + v155 + 3.0d0*(v154 + v157)) + L_xxxxyyy*v29 &
      + L_xyyy + v14*v6 + v152 + v158*v38 + v35*v9
    v175       = L_xyyzzzz*v33
    v196       = v175 + 3.0d0*(2.0d0*L_xyyz + 2.0d0*v172 + v174)
    v197       = v196*y
    v221       = v15*v196
    Ls_xyyz    = 0.166666666666667d0*(v173 + v175 + 3.0d0*(v174 + v177)) + L_xxxxyyz*v29 &
      + L_xyyz + v14*v49 + v150*v35 + v172 + v178*v38
    v229       = L_yyyyzzz*v33
    v239       = v229 + L_yyyyzz*v238 + 6.0d0*(L_yyyy + v228)
    Ls_yyyy    = 0.166666666666667d0*v229 + L_xxxyyyy*v29 + L_yyyy + L_yyyyyyy*v70 + &
      L_yyyyzz*v201 + v11*v35 + v14*v8 + v228 + v230*v231 + v38*(v147 + &
      2.0d0*v149 + v156)
    v241       = L_yyyzzzz*v33
    v253       = v241 + L_yyyzzz*v238 + 6.0d0*(L_yyyz + v240)
    Ls_yyyz    = 0.166666666666667d0*v241 + L_xxxyyyz*v29 + L_yyyyyyz*v70 + L_yyyz + &
      L_yyyzzz*v201 + v14*v90 + v227*v35 + v230*v242 + v240 + v38*(v160 &
      + 2.0d0*v162 + v176)
    c4         = c2*c2
    v68        = c4
    v203       = 0.0416666666666667d0*v68
    v256       = 5.0d0*v68
    v124       = L_xxzzzz*v68
    v183       = L_xyzzzz*v68
    v69        = L_xxxzzzz*v68
    v136       = v65 + v69 + v135*v5 + 12.0d0*v66 + 6.0d0*v71 + 24.0d0*(L_xxx + v61) + &
      4.0d0*(v67 + v73)
    Ls_xxx     = 0.0416666666666667d0*(v65 + 12.0d0*v66 + v69 + 6.0d0*v71 + 4.0d0*(v67 + &
      v73)) + L_xxx + L_xxxxxxx*v63 + v0*v29 + v39*v74 + v5*v70 + v61 + &
      v75*v77
    v106       = L_xxyzzzz*v68
    v130       = v106 + 12.0d0*v104 + 4.0d0*(6.0d0*L_xxy + 6.0d0*v102 + v105)
    v131       = v130*y
    v189       = v103 + v130 + 6.0d0*v107 + 4.0d0*v109 + v135*v7
    Ls_xxy     = 0.0416666666666667d0*(v103 + 12.0d0*v104 + v106 + 6.0d0*v107 + 4.0d0*( &
      v105 + v109)) + L_xxxxxxy*v63 + L_xxy + v102 + v110*v75 + v2*v29 &
      + v56*v74 + v7*v70
    v141       = L_xxzzzzz*v68
    v224       = v138 + v141 + v135*v89 + 12.0d0*v139 + 6.0d0*v142 + 24.0d0*(L_xxz + v137 &
      ) + 4.0d0*(v140 + v144)
    Ls_xxz     = 0.0416666666666667d0*(v138 + 12.0d0*v139 + v141 + 6.0d0*v142 + 4.0d0*( &
      v140 + v144)) + L_xxxxxxz*v63 + L_xxz + v137 + v145*v75 + v20*v29 &
      + v70*v89 + v74*v84
    v167       = L_xyyzzzz*v68
    v187       = v167 + 12.0d0*v165 + 4.0d0*(6.0d0*L_xyy + 6.0d0*v163 + v166)
    v188       = v187*y
    Ls_xyy     = 0.0416666666666667d0*(v164 + 12.0d0*v165 + v167 + 6.0d0*v168 + 4.0d0*( &
      v166 + v170)) + L_xxxxxyy*v63 + L_xyy + v163 + v171*v75 + v29*v4 &
      + v70*v9 + v74*v97
    v194       = L_xyzzzzz*v68
    v222       = v194 + 12.0d0*v192 + 4.0d0*(6.0d0*L_xyz + 6.0d0*v190 + v193)
    v223       = v222*y
    Ls_xyz     = 0.0416666666666667d0*(v191 + 12.0d0*v192 + v194 + 6.0d0*v195 + 4.0d0*( &
      v193 + v197)) + L_xxxxxyz*v63 + L_xyz + v117*v74 + v150*v70 + &
      v190 + v198*v75 + v26*v29
    v235       = L_yyyzzzz*v68
    v250       = v235 + L_yyyzz*v248 + L_yyyzzz*v249 + 24.0d0*(L_yyy + v234)
    Ls_yyy     = 0.0416666666666667d0*v235 + L_xxxxyyy*v63 + L_yyy + L_yyyyyyy*v127 + &
      L_yyyzz*v201 + L_yyyzzz*v202 + v11*v70 + v158*v74 + v231*v236 + &
      v234 + v237*v239 + v29*v6 + v75*(v153 + 3.0d0*v157 + v169 + v76* &
      v9)
    v252       = L_yyzzzzz*v68
    v259       = v252 + L_yyzzz*v248 + L_yyzzzz*v249 + 24.0d0*(L_yyz + v251)
    Ls_yyz     = 0.0416666666666667d0*v252 + L_xxxxyyz*v63 + L_yyyyyyz*v127 + L_yyz + &
      L_yyzzz*v201 + L_yyzzzz*v202 + v178*v74 + v227*v70 + v236*v242 + &
      v237*v253 + v251 + v29*v49 + v75*(v150*v76 + v173 + 3.0d0*v177 + &
      v196)
    c5         = c2*c3
    v125       = c5
    v204       = 0.00833333333333333d0*v125
    v126       = L_xxzzzzz*v125
    Ls_xx      = 0.00833333333333333d0*(v121 + 60.0d0*v122 + 20.0d0*v123 + v126 + 5.0d0*( &
      v124 + v131) + 10.0d0*(v128 + v129)) + L_xx + L_xxxxxxx*v119 + v0 &
      *v63 + v118 + v127*v7 + v132*v39 + v133*v77 + v134*v136
    v184       = L_xyzzzzz*v125
    v212       = v184 + 60.0d0*v181 + 20.0d0*v182 + 5.0d0*(24.0d0*L_xy + 24.0d0*v179 + &
      v183)
    Ls_xy      = 0.00833333333333333d0*(v180 + 60.0d0*v181 + 20.0d0*v182 + v184 + 5.0d0*( &
      v183 + v188) + 10.0d0*(v185 + v186)) + L_xxxxxxy*v119 + L_xy + &
      v110*v133 + v127*v9 + v132*v56 + v134*v189 + v179 + v2*v63
    v219       = L_xzzzzzz*v125
    Ls_xz      = 0.00833333333333333d0*(v218 + v219 + 5.0d0*v223 + 10.0d0*(v220 + v221)) &
      + L_xxxxxxz*v119 + L_xz + L_xzzz*v201 + L_xzzzz*v202 + L_xzzzzz* &
      v203 + v127*v150 + v132*v84 + v133*v145 + v134*v224 + v20*v63 + &
      v217
    v244       = L_yyzzzzz*v125
    Ls_yy      = 0.00833333333333333d0*v244 + L_xxxxxyy*v119 + L_yy + L_yyyyyyy*v206 + &
      L_yyzz*v201 + L_yyzzz*v202 + L_yyzzzz*v203 + v11*v127 + v132*v97 &
      + v133*v171 + v134*(v135*v9 + v164 + 6.0d0*v168 + 4.0d0*v170 + &
      v187) + v231*v245 + v239*v246 + v243 + v247*v250 + v4*v63
    v258       = L_yzzzzzz*v125
    Ls_yz      = 0.00833333333333333d0*v258 + L_xxxxxyz*v119 + L_yyyyyyz*v206 + L_yz + &
      L_yzzz*v201 + L_yzzzz*v202 + L_yzzzzz*v203 + v117*v132 + v127* &
      v227 + v133*v198 + v134*(v135*v150 + v191 + 6.0d0*v195 + 4.0d0* &
      v197 + v222) + v242*v245 + v246*v253 + v247*v259 + v257 + v26*v63
    c6         = c3*c3
    v205       = 0.00138888888888889d0*c6
    Ls_x       = L_x + L_xxxxxxx*v199 + L_xyyyyyy*v200 + L_xz*z + L_xzz*v201 + L_xzzz* &
      v202 + L_xzzzz*v203 + L_xzzzzz*v204 + L_xzzzzzz*v205 + v0*v119 + &
      v136*v214 + v156*v207 + v169*v208 + v187*v209 + v206*v9 + v210* &
      v39 + v211*v212 + v213*v77 + v215*(120.0d0*L_xx + 120.0d0*v118 + &
      v121 + 60.0d0*v122 + 20.0d0*v123 + 5.0d0*v124 + v126 + 10.0d0* &
      v128 + 10.0d0*v129 + 5.0d0*v131 + v216*v7)
    Ls_y       = L_y + L_xxxxxxy*v199 + L_yyyyyyy*v200 + L_yz*z + L_yzz*v201 + L_yzzz* &
      v202 + L_yzzzz*v203 + L_yzzzzz*v204 + L_yzzzzzz*v205 + v11*v206 + &
      v110*v213 + v119*v2 + v189*v214 + v207*v231 + v208*v239 + v209* &
      v250 + v210*v56 + v211*(120.0d0*L_yy + L_yyzz*v254 + L_yyzzz*v255 &
      + L_yyzzzz*v256 + 120.0d0*v243 + v244) + v215*(v180 + 10.0d0*v185 &
      + 10.0d0*v186 + 5.0d0*v188 + v212 + v216*v9)
    Ls_z       = L_z + L_xxxxxxz*v199 + L_yyyyyyz*v200 + L_zz*z + L_zzz*v201 + L_zzzz* &
      v202 + L_zzzzz*v203 + L_zzzzzz*v204 + L_zzzzzzz*v205 + v119*v20 + &
      v145*v213 + v206*v227 + v207*v242 + v208*v253 + v209*v259 + v210* &
      v84 + v211*(120.0d0*L_yz + L_yzzz*v254 + L_yzzzz*v255 + L_yzzzzz* &
      v256 + 120.0d0*v257 + v258) + v214*v224 + v215*(120.0d0*L_xz + &
      L_xzzz*v254 + L_xzzzz*v255 + L_xzzzzz*v256 + v150*v216 + 120.0d0* &
      v217 + v218 + v219 + 10.0d0*v220 + 10.0d0*v221 + 5.0d0*v223)
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
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
#undef  L_xyy               
#undef  Ls_xyy              
#undef  Ls_xyz              
#undef  L_xyz               
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
#undef  Ls_xxxxxxx          
#undef  L_xxxxxxx           
#undef  Ls_xxxxxxy          
#undef  L_xxxxxxy           
#undef  Ls_xxxxxxz          
#undef  L_xxxxxxz           
#undef  Ls_xxxxxyy          
#undef  L_xxxxxyy           
#undef  Ls_xxxxxyz          
#undef  L_xxxxxyz           
#undef  L_xxxxyyy           
#undef  Ls_xxxxyyy          
#undef  Ls_xxxxyyz          
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  Ls_xxxyyyy          
#undef  Ls_xxxyyyz          
#undef  L_xxxyyyz           
#undef  Ls_xxyyyyy          
#undef  L_xxyyyyy           
#undef  Ls_xxyyyyz          
#undef  L_xxyyyyz           
#undef  Ls_xyyyyyy          
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  Ls_xyyyyyz          
#undef  Ls_yyyyyyy          
#undef  L_yyyyyyy           
#undef  Ls_yyyyyyz          
#undef  L_yyyyyyz           
    end subroutine mom_es_L2L2_add
#endif
end module mom7
