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
        
    
! OPS  59*ADD + 130*MUL + 25*NEG + 6*SUB = 220  (642 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v43, v44, v45, v46, v47, v48, v49, v5, v6, v7, v8, v9, h,&
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
#define M_xxxxxx             M(36)
#define M_xxxxxy             M(37)
#define M_xxxxxz             M(38)
#define M_xxxxyy             M(39)
#define M_xxxxyz             M(40)
#define M_xxxyyy             M(41)
#define M_xxxyyz             M(42)
#define M_xxyyyy             M(43)
#define M_xxyyyz             M(44)
#define M_xyyyyy             M(45)
#define M_xyyyyz             M(46)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
    v0       = W*x
    v1       = W*y
    v2       = W*z
    v3       = v0*y
    v4       = v0*z
    v5       = v1*z
    v6       = v3*z
    M_0      = W
    M_x      = v0
    M_y      = v1
    M_z      = v2
    M_xy     = v3
    M_xz     = v4
    M_yz     = v5
    M_xyz    = v6
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v7       = a2
    v44      = 3.0d0*v7
    a3       = a1*a2
    a4       = a2*a2
    v18      = a4
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v8       = b2
    v9       = v7 + v8
    v24      = v7*v8
    v45      = 3.0d0*v8
    b3       = b1*b2
    b4       = b2*b2
    v28      = b4
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v9
    v10      = 0.333333333333333d0*h
    v11      = -v10
    v12      = v11 + v7
    v13      = v11 + v8
    v14      = -0.6d0*h
    v15      = -0.2d0*h
    v16      = v15 + v7
    v17      = v15 + v8
    v19      = h*h
    v20      = 0.0857142857142857d0*v19
    v21      = h*v7
    v22      = -0.428571428571429d0*h
    v23      = v22 + v7
    v25      = 0.142857142857143d0*h
    v26      = -v25
    v27      = v22 + v8
    v29      = h*v8
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
    M_xx     = W*v12
    M_yy     = W*v13
    M_xxx    = v0*(v14 + v7)
    M_xxy    = v1*v16
    M_xxz    = v16*v2
    M_xyy    = v0*v17
    M_yyy    = v1*(v14 + v8)
    M_yyz    = v17*v2
    M_xxxx   = W*(0.142857142857143d0*(-6.0d0*v21) + v18 + v20)
    M_xxxy   = v23*v3
    M_xxxz   = v23*v4
    M_xxyy   = W*(0.0285714285714286d0*v19 + v24 - v25*v9)
    M_xxyz   = v5*(v26 + v7)
    M_xyyy   = v27*v3
    M_xyyz   = v4*(v26 + v8)
    M_yyyy   = W*(0.142857142857143d0*(-6.0d0*v29) + v20 + v28)
    M_yyyz   = v27*v5
    M_xxxxx  = v0*(0.111111111111111d0*(-10.0d0*v21) + v18 + v30)
    M_xxxxy  = v1*v32
    M_xxxxz  = v2*v32
    M_xxxyy  = -v0*(0.111111111111111d0*v21 + v10*v8 + v48)
    M_xxxyz  = v12*v6
    M_xxyyy  = -v1*(0.111111111111111d0*v29 + v10*v7 + v48)
    M_xxyyz  = v2*(v24 + 0.0158730158730159d0*(-7.0d0*h*v9 + v19))
    M_xyyyy  = v0*v34
    M_xyyyz  = v13*v6
    M_yyyyy  = v1*(0.111111111111111d0*(-10.0d0*v29) + v28 + v30)
    M_yyyyz  = v2*v34
    M_xxxxxx = W*(a6 + v36 - v18*v37 + v38*v7)
    M_xxxxxy = v3*v40
    M_xxxxxz = v4*v40
    M_xxxxyy = W*(0.0909090909090909d0*(-v21*(v7 + 6.0d0*v8)) + v18*v8 + v41 + v42*( &
      2.0d0*v7 + v8))
    M_xxxxyz = v5*(0.0909090909090909d0*(-6.0d0*v21) + v18 + v42)
    M_xxxyyy = v3*(v24 - v43*(-h + v44 + v45))
    M_xxxyyz = -v4*(v43*(v45 + v7) + v49)
    M_xxyyyy = W*(0.0909090909090909d0*(-v29*(6.0d0*v7 + v8)) + v28*v7 + v41 + v42*(v7 &
      + 2.0d0*v8))
    M_xxyyyz = -v5*(v43*(v44 + v8) + v49)
    M_xyyyyy = v3*v47
    M_xyyyyz = v4*(0.0909090909090909d0*(-6.0d0*v29) + v28 + v42)
    M_yyyyyy = W*(b6 + v36 - v28*v37 + v38*v8)
    M_yyyyyz = v47*v5
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
    
! OPS  1206*ADD + 1307*MUL + 83*NEG + 258*SUB = 2854  (5174 before optimization)
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
                v18, v180, v181, v182, v183, v184, v185, v186, v187, v188,&
                v189, v19, v190, v191, v192, v193, v194, v195, v196, v197,&
                v198, v199, v2, v20, v200, v201, v202, v203, v204, v205, v206,&
                v207, v208, v209, v21, v210, v211, v212, v213, v214, v215,&
                v216, v217, v218, v219, v22, v220, v221, v222, v223, v224,&
                v225, v226, v227, v228, v229, v23, v230, v231, v232, v233,&
                v234, v235, v236, v237, v238, v239, v24, v240, v241, v242,&
                v243, v244, v245, v246, v247, v248, v249, v25, v250, v251,&
                v252, v253, v254, v255, v256, v257, v258, v259, v26, v260,&
                v261, v262, v263, v264, v265, v266, v267, v268, v269, v27,&
                v270, v271, v272, v273, v274, v275, v276, v277, v278, v279,&
                v28, v280, v281, v282, v283, v284, v285, v286, v287, v288,&
                v289, v29, v290, v291, v292, v293, v294, v295, v296, v297,&
                v298, v299, v3, v30, v300, v301, v302, v303, v304, v305, v306,&
                v307, v308, v309, v31, v310, v311, v312, v313, v314, v315,&
                v316, v317, v318, v319, v32, v320, v321, v322, v323, v324,&
                v325, v326, v327, v328, v329, v33, v330, v331, v332, v333,&
                v334, v335, v336, v337, v338, v339, v34, v340, v341, v342,&
                v343, v344, v345, v346, v347, v348, v349, v35, v350, v351,&
                v352, v353, v354, v355, v356, v357, v358, v359, v36, v360,&
                v361, v362, v363, v364, v365, v366, v367, v368, v369, v37,&
                v370, v371, v372, v373, v374, v375, v376, v377, v378, v379,&
                v38, v380, v381, v382, v383, v384, v385, v386, v387, v388,&
                v389, v39, v390, v391, v392, v393, v394, v395, v396, v397,&
                v398, v399, v4, v40, v400, v401, v402, v403, v404, v405, v406,&
                v407, v408, v409, v41, v410, v411, v412, v413, v414, v415,&
                v416, v417, v418, v419, v42, v420, v421, v422, v423, v424,&
                v425, v426, v427, v428, v429, v43, v430, v431, v432, v433,&
                v434, v435, v436, v437, v438, v439, v44, v440, v441, v442,&
                v443, v444, v445, v446, v447, v448, v449, v45, v450, v451,&
                v452, v453, v454, v455, v456, v457, v458, v459, v46, v460,&
                v461, v462, v463, v464, v465, v466, v467, v468, v469, v47,&
                v470, v471, v472, v473, v474, v475, v476, v477, v478, v479,&
                v48, v480, v481, v482, v483, v484, v485, v486, v487, v488,&
                v489, v49, v490, v491, v492, v493, v494, v495, v496, v497,&
                v498, v499, v5, v50, v500, v501, v502, v503, v504, v505, v506,&
                v507, v508, v509, v51, v510, v511, v512, v513, v514, v515,&
                v516, v517, v518, v519, v52, v520, v521, v522, v523, v524,&
                v525, v526, v527, v528, v529, v53, v530, v531, v532, v533,&
                v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64,&
                v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75,&
                v76, v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86,&
                v87, v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97,&
                v98, v99, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz,&
                S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy,&
                S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz,&
                S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy,&
                S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz, S_xxxxxx,&
                S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy, S_xxxyyz,&
                S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy, S_yyyyyz
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
#define Ms_xxxxxx            Ms(36)
#define M_xxxxxx             M(36)
#define Ms_xxxxxy            Ms(37)
#define M_xxxxxy             M(37)
#define Ms_xxxxxz            Ms(38)
#define M_xxxxxz             M(38)
#define Ms_xxxxyy            Ms(39)
#define M_xxxxyy             M(39)
#define Ms_xxxxyz            Ms(40)
#define M_xxxxyz             M(40)
#define M_xxxyyy             M(41)
#define Ms_xxxyyy            Ms(41)
#define Ms_xxxyyz            Ms(42)
#define M_xxxyyz             M(42)
#define Ms_xxyyyy            Ms(43)
#define M_xxyyyy             M(43)
#define M_xxyyyz             M(44)
#define Ms_xxyyyz            Ms(44)
#define Ms_xyyyyy            Ms(45)
#define M_xyyyyy             M(45)
#define Ms_xyyyyz            Ms(46)
#define M_xyyyyz             M(46)
#define Ms_yyyyyy            Ms(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define Ms_yyyyyz            Ms(48)
    v0        = x*y
    v1        = x*z
    v2        = y*z
    v3        = v0*z
    v9        = M_x*x
    v10       = M_y*y
    v11       = -0.666666666666667d0*M_z*z
    v15       = M_xx*x
    v16       = M_xy*y
    v17       = M_xz*z
    v23       = M_xy*x
    v25       = M_yy*y
    v26       = M_yz*z
    v29       = M_xx*z
    v30       = M_xz*x
    v32       = M_yy*z
    v33       = M_yz*y
    v47       = M_xxx*x
    v48       = 1.71428571428571d0*y
    v49       = M_xxy*v48
    v50       = M_xxz*z
    v52       = 1.71428571428571d0*M_y
    v59       = 0.857142857142857d0*M_xyz
    v64       = M_xxy*x
    v67       = M_xyy*y
    v71       = 3.0d0*M_xx
    v72       = M_xxx*z
    v73       = M_xxz*x
    v75       = M_xyy*z
    v76       = 3.0d0*M_xz
    v84       = 1.71428571428571d0*M_x
    v86       = 1.71428571428571d0*x
    v87       = M_xyy*v86
    v89       = M_yyy*y
    v90       = M_yyz*z
    v94       = M_xxy*z
    v98       = M_yyy*z
    v99       = M_yyz*y
    v107      = 3.0d0*M_yz
    v118      = M_xxxx*x
    v119      = M_xxxy*y
    v120      = M_xxxz*z
    v122      = M_xxyy*x
    v133      = M_yyyy*x
    v148      = M_xxxx*y
    v149      = M_xxxy*x
    v152      = M_xxyy*y
    v153      = M_xxyz*z
    v167      = M_yyyy*y
    v172      = M_xxyy*z
    v185      = M_xxxx*z
    v186      = M_xxxz*x
    v188      = M_xxyz*y
    v198      = M_yyyy*z
    v208      = M_xyyy*y
    v209      = M_xyyz*z
    v217      = M_xxxy*z
    v219      = M_xxyz*x
    v223      = M_xyyy*z
    v224      = M_xyyz*y
    v225      = 3.0d0*M_xyz
    v235      = M_xyyy*x
    v236      = M_yyyz*z
    v239      = M_xyyz*x
    v241      = M_yyyz*y
    v247      = M_xxyyz*z
    v271      = M_xxxxx*x
    v272      = M_xxxxy*y
    v273      = M_xxxxz*z
    v275      = M_xxxyy*x
    v282      = M_xxyyy*y
    v291      = M_xyyyy*x
    v308      = M_yyyyy*y
    v309      = M_yyyyz*z
    v345      = M_xxxxx*y
    v346      = M_xxxxy*x
    v349      = M_xxxyy*y
    v350      = 1.81818181818182d0*M_xxxyz
    v353      = M_xxyyy*x
    v361      = M_xyyyy*y
    v373      = M_yyyyy*x
    v387      = M_xxxxx*z
    v388      = M_xxxxz*x
    v390      = M_xxxyy*z
    v391      = v350*y
    v398      = M_xxyyz*x
    v407      = M_xyyyy*z
    v411      = 5.45454545454545d0*M_xyz
    v424      = M_yyyyz*x
    v468      = M_xxxxy*z
    v469      = M_xxxxz*y
    v471      = M_xxxyz*x
    v476      = M_xxyyy*z
    v477      = M_xxyyz*y
    v496      = M_yyyyy*z
    v497      = M_yyyyz*y
    v509      = 0.545454545454545d0*z
    v512      = 0.545454545454545d0*M_z
    v516      = M_xyyyz*y
    v524      = 1.81818181818182d0*M_xyyyz
    v525      = v524*x
    Ms_0      = M_0
    Ms_x      = M_0*x + M_x
    Ms_y      = M_0*y + M_y
    Ms_z      = M_0*z + M_z
    M_zz      = -(M_xx + M_yy)
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    M_xxzz    = -(M_xxxx + M_xxyy)
    v124      = M_xxzz*x
    v139      = M_xxzz*y
    v173      = M_xxzz*z
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v134      = M_yyzz*x
    v142      = M_yyzz*y
    v176      = M_yyzz*z
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    v277      = M_xxxzz*x
    v322      = M_xxxzz*y
    v394      = M_xxxzz*z
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    v284      = M_xxyzz*y
    v325      = M_xxyzz*x
    v450      = M_xxyzz*z
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    v249      = M_xxzzz*z
    v402      = M_xxzzz*x
    v452      = M_xxzzz*y
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    v528      = M_xxxzz + M_xyyzz
    v292      = M_xyyzz*x
    v331      = M_xyyzz*y
    v410      = M_xyyzz*z
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -v528
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    v529      = M_xxyzz + M_yyyzz
    v310      = M_yyyzz*y
    v335      = M_yyyzz*x
    v455      = M_yyyzz*z
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v252      = M_yyzzz*z
    v428      = M_yyzzz*x
    v457      = M_yyzzz*y
    M_yzzzz   = -v529
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    v530      = M_xxxzzz + M_xyyzzz
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -v530
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v531      = M_xxyzzz + M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v533      = M_xxzzzz + M_yyzzzz
    M_yzzzzz  = -v531
    M_zzzzzz  = -v533
    S_0       = 1
    S_x       = x
    S_y       = y
    S_z       = z
    S_xy      = v0
    v18       = M_y*S_xy
    v22       = M_x*S_xy
    v42       = M_xy*S_xy
    v63       = M_xx*S_xy
    v69       = M_yy*S_xy
    v79       = M_yz*S_xy
    v96       = M_xz*S_xy
    v121      = M_xxy*S_xy
    v147      = M_xxx*S_xy
    v157      = M_xyy*S_xy
    v175      = M_xyz*S_xy
    v212      = M_yyy*S_xy
    v220      = M_xxz*S_xy
    v229      = M_yyz*S_xy
    v274      = M_xxxy*S_xy
    v324      = M_xxyy*S_xy
    v326      = M_xxzz*S_xy
    v336      = M_yyzz*S_xy
    v344      = M_xxxx*S_xy
    v372      = M_yyyy*S_xy
    v399      = M_xxyz*S_xy
    v442      = M_xyyy*S_xy
    v472      = M_xxxz*S_xy
    v485      = M_xyyz*S_xy
    v518      = M_yyyz*S_xy
    Ms_xy     = M_xy + M_0*S_xy + M_x*y + M_y*x
    S_xz      = v1
    v19       = M_z*S_xz
    v28       = M_x*S_xz
    v51       = M_xz*S_xz
    v78       = M_yy*S_xz
    v95       = M_xy*S_xz
    v123      = M_xxz*S_xz
    v158      = M_xyz*S_xz
    v184      = M_xxx*S_xz
    v191      = M_xyy*S_xz
    v213      = M_yyz*S_xz
    v218      = 3.0d0*S_xz
    v228      = M_yyy*S_xz
    v276      = M_xxxz*S_xz
    v354      = M_xxyz*S_xz
    v386      = M_xxxx*S_xz
    v397      = M_xxyy*S_xz
    v401      = M_xxzz*S_xz
    v423      = M_yyyy*S_xz
    v427      = M_yyzz*S_xz
    v440      = 0.242424242424242d0*v276
    v443      = M_xyyz*S_xz
    v470      = M_xxxy*S_xz
    v484      = M_xyyy*S_xz
    v511      = M_yyyz*S_xz
    Ms_xz     = M_xz + M_0*S_xz + M_x*z + M_z*x
    S_yz      = v2
    v27       = M_z*S_yz
    v31       = M_y*S_yz
    v55       = M_yz*S_yz
    v74       = M_xy*S_yz
    v93       = M_xx*S_yz
    v106      = 3.0d0*S_yz
    v128      = M_xyz*S_yz
    v154      = M_xxz*S_yz
    v168      = M_yyz*S_yz
    v187      = M_xxy*S_yz
    v197      = M_yyy*S_yz
    v216      = M_xxx*S_yz
    v283      = M_xxyz*S_yz
    v351      = M_xxxz*S_yz
    v362      = M_xyyz*S_yz
    v389      = M_xxxy*S_yz
    v406      = M_xyyy*S_yz
    v446      = M_yyyz*S_yz
    v447      = 0.242424242424242d0*v446
    v451      = M_xxzz*S_yz
    v456      = M_yyzz*S_yz
    v467      = M_xxxx*S_yz
    v475      = M_xxyy*S_yz
    v495      = M_yyyy*S_yz
    Ms_yz     = M_yz + M_0*S_yz + M_y*z + M_z*y
    S_xyz     = v3
    v60       = 0.857142857142857d0*S_xyz
    v61       = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v60 + v59*z)
    v135      = M_yz*S_xyz
    v159      = M_xz*S_xyz
    v174      = M_xy*S_xyz
    v250      = M_xyz*S_xyz
    v355      = M_xxz*S_xyz
    v374      = M_yyz*S_xyz
    v395      = 5.45454545454545d0*S_xyz
    v396      = M_xxy*v395
    v422      = M_yyy*S_xyz
    v466      = M_xxx*S_xyz
    v523      = M_xyy*v395
    Ms_xyz    = M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v4        = a2
    a3        = a1*a2
    a4        = a2*a2
    v37       = a4
    a5        = a2*a3
    a6        = a3*a3
    b2        = b1*b1
    v5        = b2
    v83       = v4*v5
    b3        = b1*b2
    b4        = b2*b2
    v104      = b4
    b5        = b2*b3
    b6        = b3*b3
    c2        = c1*c1
    h         = c2 + v4 + v5
    v6        = 0.333333333333333d0*h
    v7        = -v6
    v8        = v4 + v7
    v12       = v5 + v7
    v13       = -0.6d0*h
    v20       = -0.2d0*h
    v21       = v20 + v4
    v36       = v20 + v5
    v38       = h*h
    v39       = 0.0857142857142857d0*v38
    v40       = h*v4
    v57       = -0.428571428571429d0*h
    v58       = v4 + v57
    v82       = 0.142857142857143d0*h
    v92       = -v82
    v103      = v5 + v57
    v105      = h*v5
    v108      = 0.238095238095238d0*v38
    v137      = 0.0476190476190476d0*v38
    v138      = 0.333333333333333d0*(-2.0d0*v40) + v137 + v37
    v205      = -0.111111111111111d0*v40
    v233      = 0.111111111111111d0*(-v105) + v83
    v242      = 0.333333333333333d0*(-2.0d0*v105) + v104 + v137
    v243      = h*h*h
    v244      = -0.0216450216450216d0*v243
    v245      = h*v37
    v246      = v38*v4
    v317      = 0.151515151515152d0*v38
    v318      = 0.0909090909090909d0*(-10.0d0*v40) + v317 + v37
    v436      = 0.545454545454545d0*v40
    v437      = -0.00432900432900433d0*(v243 + 231.0d0*v436*v5)
    v438      = 0.0303030303030303d0*v38
    v507      = -0.272727272727273d0*v40
    v508      = -0.272727272727273d0*v105
    v513      = v438 + v83
    v519      = h*v104
    v520      = v38*v5
    v527      = 0.0909090909090909d0*(-10.0d0*v105) + v104 + v317
    S_xx      = v8
    v14       = M_x*S_xx
    v34       = M_z*S_xx
    v43       = M_yy*S_xx
    v46       = M_xx*S_xx
    v65       = M_xy*S_xx
    v100      = M_yz*S_xx
    v116      = M_xxx*S_xx
    v126      = M_xyy*S_xx
    v150      = M_xxy*S_xx
    v165      = M_yyy*S_xx
    v189      = M_xxz*S_xx
    v199      = M_yyz*S_xx
    v269      = M_xxxx*S_xx
    v280      = M_xxyy*S_xx
    v286      = M_xxzz*S_xx
    v306      = M_yyyy*S_xx
    v312      = M_yyzz*S_xx
    v347      = M_xxxy*S_xx
    v359      = M_xyyy*S_xx
    v392      = M_xxxz*S_xx
    v408      = M_xyyz*S_xx
    v478      = M_xxyz*S_xx
    v498      = M_yyyz*S_xx
    Ms_xx     = 0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11
    S_yy      = v12
    v24       = M_y*S_yy
    v35       = M_z*S_yy
    v41       = M_xx*S_yy
    v44       = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v42 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v41 + 4.0d0*v43))
    v54       = M_yy*S_yy
    v66       = M_xy*S_yy
    v77       = M_xz*S_yy
    v117      = M_xxx*S_yy
    v127      = M_xyy*S_yy
    v151      = M_xxy*S_yy
    v166      = M_yyy*S_yy
    v190      = M_xxz*S_yy
    v200      = M_yyz*S_yy
    v270      = M_xxxx*S_yy
    v281      = M_xxyy*S_yy
    v287      = M_xxzz*S_yy
    v307      = M_yyyy*S_yy
    v313      = M_yyzz*S_yy
    v348      = M_xxxy*S_yy
    v360      = M_xyyy*S_yy
    v393      = M_xxxz*S_yy
    v409      = M_xyyz*S_yy
    v479      = M_xxyz*S_yy
    v499      = M_yyyz*S_yy
    Ms_yy     = 0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11
    S_zz      = -(S_xx + S_yy)
    S_xxx     = x*(v13 + v4)
    v45       = M_x*S_xxx
    v80       = M_z*S_xxx
    v114      = M_xx*S_xxx
    v131      = M_yy*S_xxx
    v155      = M_xy*S_xxx
    v192      = M_xz*S_xxx
    v230      = M_yz*S_xxx
    v267      = M_xxx*S_xxx
    v289      = M_xyy*S_xxx
    v334      = M_yyy*S_xxx
    v352      = M_xxy*S_xxx
    v425      = M_yyz*S_xxx
    v486      = M_xyz*S_xxx
    Ms_xxx    = M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19))
    S_xxy     = v21*y
    v53       = S_xxy*v52
    v62       = M_x*S_xxy
    v101      = M_z*S_xxy
    v125      = M_xy*S_xxy
    v145      = M_xx*S_xxy
    v163      = M_yy*S_xxy
    v201      = M_yz*S_xxy
    v278      = M_xxy*S_xxy
    v304      = M_yyy*S_xxy
    v330      = M_xyy*S_xxy
    v343      = M_xxx*S_xxy
    v412      = S_xxy*v411
    v480      = M_xxz*S_xxy
    v500      = M_yyz*S_xxy
    Ms_xxy    = M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v22 + 4.0d0* &
      v23 - v24 - v25 - v26 - v27))
    S_xxz     = v21*z
    v56       = M_z*S_xxz
    v70       = M_x*S_xxz
    v129      = M_xz*S_xxz
    v169      = M_yz*S_xxz
    v182      = M_xx*S_xxz
    v195      = M_yy*S_xxz
    v221      = M_xy*S_xxz
    v251      = M_yyz*S_xxz
    v285      = M_xxz*S_xxz
    v363      = M_xyz*S_xxz
    v404      = M_xyy*S_xxz
    v473      = M_xxy*S_xxz
    v494      = M_yyy*S_xxz
    Ms_xxz    = M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v28 + v30) + 7.0d0*(v29 + v34) + 2.0d0 &
      *(-v31 + v32 - v33 + v35))
    S_xyy     = v36*x
    v68       = M_y*S_xyy
    v81       = M_z*S_xyy
    v85       = S_xyy*v84
    v115      = M_xx*S_xyy
    v132      = M_yy*S_xyy
    v156      = M_xy*S_xyy
    v193      = M_xz*S_xyy
    v268      = M_xxx*S_xyy
    v290      = M_xyy*S_xyy
    v323      = M_xxy*S_xyy
    v371      = M_yyy*S_xyy
    v400      = M_xxz*S_xyy
    v426      = M_yyz*S_xyy
    v526      = S_xyy*v411
    Ms_xyy    = M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19))
    S_xzz     = -(S_xxx + S_xyy)
    S_yyy     = y*(v13 + v5)
    v88       = M_y*S_yyy
    v102      = M_z*S_yyy
    v146      = M_xx*S_yyy
    v164      = M_yy*S_yyy
    v202      = M_yz*S_yyy
    v207      = M_xy*S_yyy
    v226      = M_xz*S_yyy
    v279      = M_xxy*S_yyy
    v305      = M_yyy*S_yyy
    v321      = M_xxx*S_yyy
    v358      = M_xyy*S_yyy
    v413      = M_xyz*S_yyy
    v481      = M_xxz*S_yyy
    Ms_yyy    = M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v22 - 2.0d0*v23 + 3.0d0*v24 + &
      3.0d0*v25 - 2.0d0*v26 - 2.0d0*v27))
    S_yyz     = v36*z
    v91       = M_z*S_yyz
    v97       = M_y*S_yyz
    v170      = M_yz*S_yyz
    v183      = M_xx*S_yyz
    v196      = M_yy*S_yyz
    v210      = M_xz*S_yyz
    v222      = M_xy*S_yyz
    v248      = M_xxz*S_yyz
    v311      = M_yyz*S_yyz
    v364      = M_xyz*S_yyz
    v385      = M_xxx*S_yyz
    v405      = M_xyy*S_yyz
    v474      = M_xxy*S_yyz
    Ms_yyz    = M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v31 + v33) + 7.0d0*(v32 + v35) + 2.0d0 &
      *(-v28 + v29 - v30 + v34))
    S_yzz     = -(S_xxy + S_yyy)
    S_zzz     = -(S_xxz + S_yyz)
    S_xxxx    = 0.142857142857143d0*(-6.0d0*v40) + v37 + v39
    v109      = M_x*S_xxxx
    v160      = M_y*S_xxxx
    v203      = M_z*S_xxxx
    v262      = M_xx*S_xxxx
    v299      = M_yy*S_xxxx
    v356      = M_xy*S_xxxx
    v414      = M_xz*S_xxxx
    v501      = M_yz*S_xxxx
    Ms_xxxx   = M_0*S_xxxx + v44 - v49 - v53 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v46 - 96.0d0*v51 + 80.0d0*(v45 + v47) - &
      60.0d0*(v50 + v56) + 24.0d0*(v54 + v55))
    S_xxxy    = v0*v58
    v130      = M_y*S_xxxy
    v144      = M_x*S_xxxy
    v231      = M_z*S_xxxy
    v288      = M_xy*S_xxxy
    v341      = M_xx*S_xxxy
    v369      = M_yy*S_xxxy
    v429      = M_yz*S_xxxy
    v487      = M_xz*S_xxxy
    Ms_xxxy   = M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v61 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 - 2.0d0*v66 &
      - 2.0d0*v67 - 2.0d0*v68 - 2.0d0*v69))
    S_xxxz    = v1*v58
    v136      = M_z*S_xxxz
    v181      = M_x*S_xxxz
    v293      = M_xz*S_xxxz
    v375      = M_yz*S_xxxz
    v383      = M_xx*S_xxxz
    v420      = M_yy*S_xxxz
    v444      = 0.242424242424242d0*v293
    v482      = M_xy*S_xxxz
    Ms_xxxz   = 0.142857142857143d0*(15.0d0*(v70 + v73) + 13.0d0*(v72 + v80) + 6.0d0*( &
      -v74 + v75 + v77 + v78 - v79 + v81)) + M_0*S_xxxz + M_xxxz - M_y* &
      v60 + S_xx*v76 + S_xz*v71 - v59*y
    S_xxyy    = 0.0285714285714286d0*v38 - v4*v82 - v5*v82 + v83
    v110      = M_x*S_xxyy
    v161      = M_y*S_xxyy
    v177      = M_z*S_xxyy
    v263      = M_xx*S_xxyy
    v300      = M_yy*S_xxyy
    v327      = M_xy*S_xxyy
    v415      = M_xz*S_xxyy
    v502      = M_yz*S_xxyy
    Ms_xxyy   = 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v42 + 39.0d0*(v41 + v43) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v45 + 12.0d0*v46 + &
      10.0d0*v47 + 10.0d0*v50 + 12.0d0*v51 + 12.0d0*v54 + 12.0d0*v55 + &
      10.0d0*v56 + 10.0d0*v88 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91)) &
      + M_0*S_xxyy + v49 + v53 + v85 + v87
    S_xxyz    = v2*(v4 + v92)
    v171      = M_z*S_xxyz
    v194      = M_y*S_xxyz
    v215      = M_x*S_xxyz
    v314      = M_yz*S_xxyz
    v365      = M_xz*S_xxyz
    v403      = M_xy*S_xxyz
    v464      = M_xx*S_xxyz
    v492      = M_yy*S_xxyz
    Ms_xxyz   = 0.142857142857143d0*(12.0d0*(v95 + v96) + 9.0d0*(v100 + v101 + v93 + v94 &
      ) + 2.0d0*(v102 - v97 + v98 - v99)) + M_0*S_xxyz + M_xxyz + M_xxz &
      *y + M_xyz*v86 + M_y*S_xxz + S_xyz*v84
    S_xxzz    = -(S_xxxx + S_xxyy)
    v111      = M_x*S_xxzz
    v140      = M_y*S_xxzz
    v178      = M_z*S_xxzz
    v264      = M_xx*S_xxzz
    v301      = M_yy*S_xxzz
    v328      = M_xy*S_xxzz
    v416      = M_xz*S_xxzz
    v458      = M_yz*S_xxzz
    S_xyyy    = v0*v103
    v211      = M_y*S_xyyy
    v232      = M_z*S_xyyy
    v234      = M_x*S_xyyy
    v342      = M_xx*S_xyyy
    v370      = M_yy*S_xyyy
    v430      = M_yz*S_xyyy
    v441      = M_xy*S_xyyy
    v488      = M_xz*S_xyyy
    Ms_xyyy   = M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v61 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 + 5.0d0*v66 &
      + 5.0d0*v67 + 5.0d0*v68 + 5.0d0*v69))
    S_xyyz    = v1*(v5 + v92)
    v214      = M_z*S_xyyz
    v227      = M_y*S_xyyz
    v238      = M_x*S_xyyz
    v376      = M_yz*S_xyyz
    v384      = M_xx*S_xyyz
    v421      = M_yy*S_xyyz
    v445      = M_xz*S_xyyz
    v483      = M_xy*S_xyyz
    Ms_xyyz   = 0.142857142857143d0*(12.0d0*(v74 + v79) + 2.0d0*(-v70 + v72 - v73 + v80 &
      ) + 9.0d0*(v75 + v77 + v78 + v81)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v48 + M_yyz*x + S_xyz*v52
    S_xyzz    = -(S_xxxy + S_xyyy)
    S_xzzz    = -(S_xxxz + S_xyyz)
    S_yyyy    = 0.142857142857143d0*(-6.0d0*v105) + v104 + v39
    v112      = M_x*S_yyyy
    v162      = M_y*S_yyyy
    v204      = M_z*S_yyyy
    v265      = M_xx*S_yyyy
    v302      = M_yy*S_yyyy
    v357      = M_xy*S_yyyy
    v417      = M_xz*S_yyyy
    v503      = M_yz*S_yyyy
    Ms_yyyy   = M_0*S_yyyy + v44 - v85 - v87 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v54 - 96.0d0*v55 + 24.0d0*(v46 + v51) + &
      80.0d0*(v88 + v89) - 60.0d0*(v90 + v91))
    S_yyyz    = v103*v2
    v237      = M_z*S_yyyz
    v240      = M_y*S_yyyz
    v448      = M_yz*S_yyyz
    v449      = 0.242424242424242d0*v448
    v465      = M_xx*S_yyyz
    v493      = M_yy*S_yyyz
    v510      = M_xz*S_yyyz
    v515      = M_xy*S_yyyz
    Ms_yyyz   = 0.142857142857143d0*(13.0d0*(v102 + v98) + 15.0d0*(v97 + v99) + 6.0d0*( &
      v100 + v101 + v93 + v94 - v95 - v96)) + M_0*S_yyyz - M_x*v60 + &
      M_yy*v106 + M_yyyz + S_yy*v107 - v59*x
    S_yyzz    = -(S_xxyy + S_yyyy)
    v113      = M_x*S_yyzz
    v141      = M_y*S_yyzz
    v143      = -0.0476190476190476d0*(M_yyyyy + v139 + v140 + v141 + v142 + v529)
    v179      = M_z*S_yyzz
    v180      = 0.0476190476190476d0*(18.0d0*(v172 + v177) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v173 + 48.0d0*v174 + 48.0d0*v175 + 5.0d0*v176 + &
      5.0d0*v178 + 5.0d0*v179))
    v206      = -0.0476190476190476d0*(M_xxxxx + v111 + v113 + v124 + v134 + v528)
    v266      = M_xx*S_yyzz
    v303      = M_yy*S_yyzz
    v329      = M_xy*S_yyzz
    v418      = M_xz*S_yyzz
    v459      = M_yz*S_yyzz
    S_yzzz    = -(S_xxyz + S_yyyz)
    S_zzzz    = -(S_xxzz + S_yyzz)
    S_xxxxx   = x*(0.111111111111111d0*(-10.0d0*v40) + v108 + v37)
    v257      = M_x*S_xxxxx
    v366      = M_y*S_xxxxx
    v431      = M_z*S_xxxxx
    Ms_xxxxx  = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v109 + v118) + 330.0d0*(v114 + v116) - 30.0d0*(M_xxxyy + v110 + &
      v122) + 60.0d0*(v115 + v117 + v126 + v131) - 140.0d0*(v119 + v120 &
      + v130 + v136) - 300.0d0*(v121 + v123 + v125 + v129) + 120.0d0*( &
      v127 + v128 + v132 + v135) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v111 + v112 + v113 + v124 + v133 + v134))
    S_xxxxy   = v138*y
    v294      = M_y*S_xxxxy
    v338      = M_x*S_xxxxy
    v504      = M_z*S_xxxxy
    Ms_xxxxy  = M_0*S_xxxxy + v143 + 0.0476190476190476d0*(78.0d0*(v145 + v150) + 4.0d0* &
      (v146 + v165) + 20.0d0*(M_xxxxy + v148 + v160) + 56.0d0*(v144 + &
      v147 + v149 + v155) + 8.0d0*(v164 + v166 + v168 + v170) - (2.0d0* &
      M_xxyyy + 24.0d0*v151 + 30.0d0*v152 + 28.0d0*v153 + 28.0d0*v154 + &
      48.0d0*v156 + 48.0d0*v157 + 48.0d0*v158 + 48.0d0*v159 + 30.0d0* &
      v161 + v162 + 24.0d0*v163 + v167 + 28.0d0*v169 + 28.0d0*v171))
    S_xxxxz   = v138*z
    v315      = M_z*S_xxxxz
    v378      = M_x*S_xxxxz
    v489      = M_y*S_xxxxz
    Ms_xxxxz  = M_0*S_xxxxz + v180 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v181 &
      + v186) + 106.0d0*(v182 + v189) + 4.0d0*(v183 + v199) + 104.0d0*( &
      v184 + v192) + 44.0d0*(v185 + v203) + 32.0d0*(v190 + v195) + &
      48.0d0*(v191 + v193) + 8.0d0*(v196 + v200) - (M_yyyyz + 36.0d0* &
      v187 + 28.0d0*v188 + 28.0d0*v194 + 8.0d0*v197 + 5.0d0*v198 + &
      36.0d0*v201 + 8.0d0*v202 + 5.0d0*v204))
    S_xxxyy   = x*(-v5*v6 + v137 + v205 + v83)
    v258      = M_x*S_xxxyy
    v367      = M_y*S_xxxyy
    v432      = M_z*S_xxxyy
    Ms_xxxyy  = M_0*S_xxxyy + v206 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v109 &
      + v118) + 141.0d0*(v110 + v122) + 159.0d0*(v115 + v126) + 75.0d0* &
      (v117 + v131) + 112.0d0*(v119 + v130) - 14.0d0*(v120 + v136) + &
      276.0d0*(v121 + v125) - 3.0d0*(M_xyyyy + v112 + v133) - 18.0d0*( &
      v114 + v116 + v123 + v129) - 60.0d0*(v127 + v128 + v132 + v135) - &
      42.0d0*(v207 + v208 + v209 + v210 + v211 + v212 + v213 + v214))
    S_xxxyz   = v3*v8
    v377      = 1.81818181818182d0*S_xxxyz
    v419      = M_y*v377
    v463      = M_x*S_xxxyz
    Ms_xxxyz  = 0.333333333333333d0*(7.0d0*(v215 + v219 + v220 + v221) + 5.0d0*(v216 + &
      v217 + v230 + v231) + 2.0d0*(-v222 + v223 - v224 + v226 - v227 + &
      v228 - v229 + v232)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy* &
      v218 + M_y*S_xxxz + S_xx*v225 + S_xxy*v76 + S_xyz*v71
    S_xxxzz   = -(S_xxxxx + S_xxxyy)
    v259      = M_x*S_xxxzz
    v332      = M_y*S_xxxzz
    v433      = M_z*S_xxxzz
    S_xxyyy   = y*(-v4*v6 + v137 + v233)
    v295      = M_y*S_xxyyy
    v339      = M_x*S_xxyyy
    v505      = M_z*S_xxyyy
    Ms_xxyyy  = M_0*S_xxyyy + v143 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v146 &
      + v165) + 159.0d0*(v151 + v163) + 141.0d0*(v152 + v161) + 276.0d0 &
      *(v156 + v157) - 17.0d0*(v162 + v167) + 112.0d0*(v234 + v235) - &
      14.0d0*(v236 + v237) - 3.0d0*(M_xxxxy + v148 + v160) - 60.0d0*( &
      v145 + v150 + v158 + v159) - 18.0d0*(v164 + v166 + v168 + v170) - &
      42.0d0*(v144 + v147 + v149 + v153 + v154 + v155 + v169 + v171))
    S_xxyyz   = z*(0.0158730158730159d0*v38 + v205 + v233)
    v253      = M_z*S_xxyyz
    v379      = M_x*S_xxyyz
    v490      = M_y*S_xxyyz
    Ms_xxyyz  = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v174 + v175) + 6.0d0*(v184 + v192 + v197 + v202) + 9.0d0*(v185 + &
      v198 + v203 + v204) + 132.0d0*(v187 + v191 + v193 + v201) + &
      112.0d0*(v188 + v194 + v238 + v239) + 81.0d0*(v172 + v177 + v183 &
      + v190 + v195 + v199) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v173 + 5.0d0*v176 + 5.0d0*v178 + 5.0d0*v179 + 14.0d0*v181 + &
      6.0d0*v182 + 14.0d0*v186 + 6.0d0*v189 + 6.0d0*v196 + 6.0d0*v200 + &
      14.0d0*v240 + 14.0d0*v241))
    S_xxyzz   = -(S_xxxxy + S_xxyyy)
    v296      = M_y*S_xxyzz
    v319      = M_x*S_xxyzz
    v460      = M_z*S_xxyzz
    S_xxzzz   = -(S_xxxxz + S_xxyyz)
    v254      = M_z*S_xxzzz
    v380      = M_x*S_xxzzz
    v453      = M_y*S_xxzzz
    S_xyyyy   = v242*x
    v260      = M_x*S_xyyyy
    v368      = M_y*S_xyyyy
    v434      = M_z*S_xyyyy
    Ms_xyyyy  = M_0*S_xyyyy + v206 + 0.0476190476190476d0*(4.0d0*(v117 + v131) + 78.0d0* &
      (v127 + v132) + 20.0d0*(M_xyyyy + v112 + v133) + 8.0d0*(v114 + &
      v116 + v123 + v129) + 56.0d0*(v207 + v208 + v211 + v212) - (2.0d0 &
      *M_xxxyy + v109 + 30.0d0*v110 + 24.0d0*v115 + v118 + 48.0d0*v121 &
      + 30.0d0*v122 + 48.0d0*v125 + 24.0d0*v126 + 48.0d0*v128 + 48.0d0* &
      v135 + 28.0d0*v209 + 28.0d0*v210 + 28.0d0*v213 + 28.0d0*v214))
    S_xyyyz   = v12*v3
    v517      = M_y*S_xyyyz
    v521      = 1.81818181818182d0*S_xyyyz
    v522      = M_x*v521
    Ms_xyyyz  = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v222 + v224 + v227 + v229 &
      ) + 5.0d0*(v223 + v226 + v228 + v232) + 2.0d0*(-v215 + v216 + &
      v217 - v219 - v220 - v221 + v230 + v231)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v106 + M_xyyyz + M_yyyz*x + S_xyy*v107 + S_yy*v225
    S_xyyzz   = -(S_xxxyy + S_xyyyy)
    v261      = M_x*S_xyyzz
    v333      = M_y*S_xyyzz
    v435      = M_z*S_xyyzz
    S_xyzzz   = -(S_xxxyz + S_xyyyz)
    S_xzzzz   = -(S_xxxzz + S_xyyzz)
    S_yyyyy   = y*(0.111111111111111d0*(-10.0d0*v105) + v104 + v108)
    v297      = M_y*S_yyyyy
    v340      = M_x*S_yyyyy
    v506      = M_z*S_yyyyy
    Ms_yyyyy  = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v162 + v167) + 330.0d0*(v164 + v166) - 30.0d0*(M_xxyyy + v152 + &
      v161) + 120.0d0*(v145 + v150 + v158 + v159) + 60.0d0*(v146 + v151 &
      + v163 + v165) - 300.0d0*(v156 + v157 + v168 + v170) - 140.0d0*( &
      v234 + v235 + v236 + v237) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v139 + v140 + v141 + v142 + v148 + v160))
    S_yyyyz   = v242*z
    v316      = M_z*S_yyyyz
    v381      = M_x*S_yyyyz
    v491      = M_y*S_yyyyz
    Ms_yyyyz  = M_0*S_yyyyz + v180 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v182 &
      + v189) + 32.0d0*(v183 + v199) + 48.0d0*(v187 + v201) + 4.0d0*( &
      v190 + v195) + 106.0d0*(v196 + v200) + 104.0d0*(v197 + v202) + &
      44.0d0*(v198 + v204) + 56.0d0*(v240 + v241) - (M_xxxxz + 8.0d0* &
      v184 + 5.0d0*v185 + 36.0d0*v191 + 8.0d0*v192 + 36.0d0*v193 + &
      5.0d0*v203 + 28.0d0*v238 + 28.0d0*v239))
    S_yyyzz   = -(S_xxyyy + S_yyyyy)
    v298      = M_y*S_yyyzz
    v320      = M_x*S_yyyzz
    v337      = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz - &
      v319 - v320 + 4.0d0*v321 - v322 - 24.0d0*v323 - 30.0d0*v324 - &
      v325 - v326 - 30.0d0*v327 - v328 - v329 - 24.0d0*v330 - v331 - &
      v332 - v333 + 4.0d0*v334 - v335 - v336))
    v461      = M_z*S_yyyzz
    S_yyzzz   = -(S_xxyyz + S_yyyyz)
    v255      = M_z*S_yyzzz
    v532      = v533 - 15.0d0*M_xxyyzz + 3.0d0*(2.0d0*v249 + 2.0d0*v252 + 2.0d0*v254 + &
      2.0d0*v255)
    v256      = 0.00432900432900433d0*(1440.0d0*v250 + 5.0d0*(12.0d0*v247 - 8.0d0*v248 - &
      8.0d0*v251 + 12.0d0*v253 + v532))
    v382      = M_x*S_yyzzz
    v439      = 0.00432900432900433d0*(-720.0d0*v250 + v532 - 240.0d0*(v247 + v253) - &
      260.0d0*(v248 + v251))
    v454      = M_y*S_yyzzz
    v462      = -0.0303030303030303d0*(M_yyyyyz + v452 + v453 + v454 + v457 + v531 + &
      5.0d0*(v450 + v451 + v455 + v456 + v458 + v459 + v460 + v461))
    v514      = -0.0303030303030303d0*(M_xxxxxz + v380 + v382 + v402 + v428 + v530 + &
      5.0d0*(v394 + v401 + v410 + v416 + v418 + v427 + v433 + v435))
    S_yzzzz   = -(S_xxyzz + S_yyyzz)
    S_zzzzz   = -(S_xxzzz + S_yyzzz)
    S_xxxxxx  = a6 + v244 + 0.0909090909090909d0*(-15.0d0*v245 + 5.0d0*v246)
    Ms_xxxxxx = M_0*S_xxxxxx + v256 + 0.00432900432900433d0*(136.0d0*M_xxxxxx - 75.0d0* &
      M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + 2360.0d0*v267 - &
      2340.0d0*v278 - 2260.0d0*v285 + 1440.0d0*v290 + 576.0d0*(v257 + &
      v271) + 1620.0d0*(v262 + v269) - 120.0d0*(v279 + v304) + 840.0d0* &
      (v283 + v314) - 160.0d0*(v305 + v311) + 90.0d0*(-M_xxxxzz + v263 &
      + v280) + 360.0d0*(-v258 + v270 - v275 + v299) + 720.0d0*(v268 + &
      v281 + v289 + v300) - 600.0d0*(v272 + v273 + v294 + v315) - &
      1680.0d0*(v274 + v276 + v288 + v293) - 165.0d0*(v264 + v265 + &
      v266 + v286 + v306 + v312) - 180.0d0*(M_xxxxyy + v259 + v260 + &
      v261 + v277 + v291 + v292) + 60.0d0*(v282 - v287 + v295 - v301 - &
      v302 - v303 - v307 - v313) + 30.0d0*(v284 + v296 + v297 + v298 + &
      v308 + v309 + v310 + v316))
    S_xxxxxy  = v0*v318
    Ms_xxxxxy = M_0*S_xxxxxy - M_z*v377 + v337 - v350*z + 0.0303030303030303d0*(-10.0d0* &
      (v339 + v353) + 20.0d0*(v342 + v359) - 70.0d0*(v349 + v367) - &
      60.0d0*(v351 + v375) + 28.0d0*(M_xxxxxy + v345 + v366) + 100.0d0* &
      (v338 + v344 + v346 + v356) + 190.0d0*(v341 + v343 + v347 + v352 &
      ) - 140.0d0*(v354 + v355 + v363 + v365) - 5.0d0*(M_xyyyyy + v340 &
      + v357 + v361 + v368 + v372 + v373) + 40.0d0*(-v348 + v358 + v360 &
      + v362 + v364 - v369 + v370 + v371 + v374 + v376))
    S_xxxxxz  = v1*v318
    Ms_xxxxxz = M_0*S_xxxxxz - v391 - v396 - v412 - v419 + 0.0303030303030303d0*(28.0d0* &
      M_xxxxxz + 250.0d0*(v383 + v392) + 220.0d0*(v386 + v414) + 68.0d0 &
      *(v387 + v431) + 80.0d0*(v393 + v420) + 90.0d0*(v397 + v415) - &
      140.0d0*(v399 + v403) + 160.0d0*(v400 + v404) + 330.0d0*(M_xxx* &
      S_xxz + M_xxz*S_xxx) + 100.0d0*(v378 + v388 - v389 - v429) + &
      20.0d0*(v384 + v385 + v408 + v425) + 10890.0d0*(-M_xxxyyz - v379 &
      + v390 - v398 + v432) + 40.0d0*(v405 - v406 + v409 - v413 + v421 &
      - v422 + v426 - v430) - 5.0d0*(M_xxxzzz + M_xyyyyz + M_xyyzzz + &
      v380 + v381 + v382 + v402 + v424 + v428) - 25.0d0*(v394 + v401 + &
      v407 + v410 + v416 + v417 + v418 + v423 + v427 + v433 + v434 + &
      v435))
    S_xxxxyy  = 0.0303030303030303d0*(-3.0d0*v245 + 2.0d0*v246) + v37*v5 + v437 + v438* &
      v5
    Ms_xxxxyy = M_0*S_xxxxyy + v439 - v440 - v444 + v447 + v449 + 0.00432900432900433d0* &
      (-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - 11.0d0*M_xxxxzz - 5.0d0* &
      M_yyyyyy - 4.0d0*M_yyyyzz + 1800.0d0*v278 - 720.0d0*v290 - 64.0d0 &
      *(v257 + v271) + 628.0d0*(v258 + v275) - 82.0d0*(v262 + v269) + &
      942.0d0*(v263 + v280) + 2.0d0*(v265 + v306) - 60.0d0*(v267 + v285 &
      ) + 760.0d0*(v268 + v289) + 412.0d0*(v272 + v294) - 36.0d0*(v273 &
      + v315) + 1288.0d0*(v274 + v288) - 220.0d0*(v279 + v304) - &
      402.0d0*(v281 + v300) - 392.0d0*(v283 + v314) + 37.0d0*(v302 + &
      v307) + 80.0d0*(v305 + v311) + 6.0d0*(v309 + v316) - 26.0d0*(v264 &
      + v266 + v286 + v312) + 268.0d0*(v270 - v282 - v295 + v299) - &
      19.0d0*(v287 + v301 + v303 + v313) - 448.0d0*(v441 + v442 + v443 &
      + v445) - 8.0d0*(v284 + v296 + v297 + v298 + v308 + v310) - &
      22.0d0*(M_xxyyyy + v259 + v260 + v261 + v277 + v291 + v292))
    S_xxxxyz  = v2*(-v436 + v37 + v438)
    Ms_xxxxyz = M_0*S_xxxxyz + v462 + 0.0303030303030303d0*(26.0d0*(v476 + v505) + &
      40.0d0*(v481 + v494) + 8.0d0*(v493 + v499) + 32.0d0*(M_xxxxyz + &
      v469 + v489) + 96.0d0*(v463 + v471 + v472 + v482) + 170.0d0*(v464 &
      + v473 + v478 + v480) + 4.0d0*(v465 + v479 + v492 + v498) + &
      160.0d0*(v466 + v470 + v486 + v487) + 64.0d0*(v467 + v468 + v484 &
      + v488 + v501 + v504) - (2.0d0*M_xxyyyz + 40.0d0*v474 + 18.0d0* &
      v475 + 38.0d0*v477 + 64.0d0*v483 + 64.0d0*v485 + 38.0d0*v490 + &
      v491 + 13.0d0*v495 + 5.0d0*v496 + v497 + 40.0d0*v500 + 18.0d0* &
      v502 + 13.0d0*v503 + 5.0d0*v506))
    S_xxxyyy  = v0*(0.0909090909090909d0*v38 + v507 + v508 + v83)
    Ms_xxxyyy = 0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v321 + v334) + 75.0d0*(v323 + v330) + 69.0d0*(v324 + v327) + &
      25.0d0*(v339 + v349 + v353 + v367) + 31.0d0*(v342 + v348 + v359 + &
      v369) - (M_xxxxxy + 11.0d0*M_xxxyz*v509 + M_xxxyzz + M_xyyyyy + &
      11.0d0*M_xyyyz*v509 + M_xyyyzz + 11.0d0*S_xxxyz*v512 + 11.0d0* &
      S_xyyyz*v512 + v319 + v320 + v322 + v325 + v326 + v328 + v329 + &
      v331 + v332 + v333 + v335 + v336 + 7.0d0*v338 + v340 + 10.0d0* &
      v341 + 10.0d0*v343 + 7.0d0*v344 + v345 + 7.0d0*v346 + 10.0d0*v347 &
      + 6.0d0*v351 + 10.0d0*v352 + 10.0d0*v354 + 10.0d0*v355 + 7.0d0* &
      v356 + 7.0d0*v357 + 10.0d0*v358 + 10.0d0*v360 + 7.0d0*v361 + &
      10.0d0*v362 + 10.0d0*v363 + 10.0d0*v364 + 10.0d0*v365 + v366 + &
      7.0d0*v368 + 10.0d0*v370 + 10.0d0*v371 + 7.0d0*v372 + v373 + &
      10.0d0*v374 + 6.0d0*v375 + 10.0d0*v376 + 6.0d0*v510 + 6.0d0*v511 &
      ))
    S_xxxyyz  = v1*(0.0909090909090909d0*(-v40) + v508 + v513)
    Ms_xxxyyz = M_0*S_xxxyyz + M_xxyy*v218 + S_xxyy*v76 + v391 + v396 + v412 + v419 + &
      v514 + 0.0303030303030303d0*(31.0d0*M_xxxyyz + v387 + v431 + &
      79.0d0*(v379 + v398) + 103.0d0*(v384 + v408) + 55.0d0*(v385 + &
      v425) + 88.0d0*(v389 + v429) + 47.0d0*(v390 + v432) + 43.0d0*( &
      v393 + v420) + 152.0d0*(v399 + v403) + 95.0d0*(v400 + v404) + &
      10.0d0*(v406 + v413 + v422 + v430) + 13.0d0*(v407 + v417 + v423 + &
      v434) - (M_xyyyyz + 7.0d0*v378 + v381 + 4.0d0*v383 + v386 + 7.0d0 &
      *v388 + 4.0d0*v392 + 10.0d0*v405 + 10.0d0*v409 + v414 + 10.0d0* &
      v421 + v424 + 10.0d0*v426 + 18.0d0*v515 + 18.0d0*v516 + 18.0d0* &
      v517 + 18.0d0*v518))
    S_xxyyyy  = 0.0303030303030303d0*(-3.0d0*v519 + 2.0d0*v520) + v104*v4 + v4*v438 + &
      v437
    Ms_xxyyyy = M_0*S_xxyyyy + v439 + v440 + v444 - v447 - v449 + 0.00432900432900433d0* &
      (-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0*M_xxyyyy - 12.0d0* &
      M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v278 + 1800.0d0*v290 + &
      412.0d0*(v260 + v291) + 37.0d0*(v262 + v269) - 402.0d0*(v263 + &
      v280) + 80.0d0*(v267 + v285) - 220.0d0*(v268 + v289) + 2.0d0*( &
      v270 + v299) + 6.0d0*(v273 + v315) + 760.0d0*(v279 + v304) + &
      942.0d0*(v281 + v300) + 628.0d0*(v282 + v295) - 64.0d0*(v297 + &
      v308) - 82.0d0*(v302 + v307) - 60.0d0*(v305 + v311) - 36.0d0*( &
      v309 + v316) + 1288.0d0*(v441 + v442) - 392.0d0*(v443 + v445) + &
      268.0d0*(-v258 + v265 - v275 + v306) - 19.0d0*(v264 + v266 + v286 &
      + v312) - 448.0d0*(v274 + v283 + v288 + v314) - 26.0d0*(v287 + &
      v301 + v303 + v313) - 8.0d0*(v257 + v259 + v261 + v271 + v277 + &
      v292) - 22.0d0*(M_xxxxyy + v272 + v284 + v294 + v296 + v298 + &
      v310))
    S_xxyyyz  = v2*(0.0909090909090909d0*(-v105) + v507 + v513)
    Ms_xxyyyz = M_0*S_xxyyyz + v462 + v522 + v523 + v525 + v526 + 0.0303030303030303d0*( &
      31.0d0*M_xxyyyz + v496 + v506 + 43.0d0*(v465 + v498) + 95.0d0*( &
      v474 + v500) + 99.0d0*(v475 + v502) + 47.0d0*(v476 + v505) + &
      79.0d0*(v477 + v490) + 103.0d0*(v479 + v492) + 55.0d0*(v481 + &
      v494) + 152.0d0*(v483 + v485) + 88.0d0*(v484 + v488) + 10.0d0*( &
      v466 + v470 + v486 + v487) + 13.0d0*(v467 + v468 + v501 + v504) - &
      (M_xxxxyz + 18.0d0*v463 + 10.0d0*v464 + v469 + 18.0d0*v471 + &
      18.0d0*v472 + 10.0d0*v473 + 10.0d0*v478 + 10.0d0*v480 + 18.0d0* &
      v482 + v489 + 7.0d0*v491 + 4.0d0*v493 + v495 + 7.0d0*v497 + 4.0d0 &
      *v499 + v503))
    S_xyyyyy  = v0*v527
    Ms_xyyyyy = M_0*S_xyyyyy - M_z*v521 + v337 - v524*z + 0.0303030303030303d0*(-70.0d0* &
      (v339 + v353) + 20.0d0*(v348 + v369) - 10.0d0*(v349 + v367) - &
      60.0d0*(v510 + v511) + 28.0d0*(M_xyyyyy + v340 + v373) + 100.0d0* &
      (v357 + v361 + v368 + v372) + 190.0d0*(v358 + v360 + v370 + v371 &
      ) - 140.0d0*(v362 + v364 + v374 + v376) - 5.0d0*(M_xxxxxy + v338 &
      + v344 + v345 + v346 + v356 + v366) + 40.0d0*(v341 - v342 + v343 &
      + v347 + v352 + v354 + v355 - v359 + v363 + v365))
    S_xyyyyz  = v1*(0.0909090909090909d0*(-6.0d0*v105) + v104 + v438)
    Ms_xyyyyz = M_0*S_xyyyyz + v514 + 0.0303030303030303d0*(8.0d0*(v383 + v392) + 40.0d0 &
      *(v385 + v425) + 26.0d0*(v390 + v432) + 32.0d0*(M_xyyyyz + v381 + &
      v424) + 4.0d0*(v384 + v393 + v408 + v420) + 170.0d0*(v405 + v409 &
      + v421 + v426) + 160.0d0*(v406 + v413 + v422 + v430) + 96.0d0*( &
      v515 + v516 + v517 + v518) + 64.0d0*(v389 + v407 + v417 + v423 + &
      v429 + v434) - (2.0d0*M_xxxyyz + v378 + 38.0d0*v379 + 13.0d0*v386 &
      + 5.0d0*v387 + v388 + 18.0d0*v397 + 38.0d0*v398 + 64.0d0*v399 + &
      40.0d0*v400 + 64.0d0*v403 + 40.0d0*v404 + 13.0d0*v414 + 18.0d0* &
      v415 + 5.0d0*v431))
    S_yyyyyy  = b6 + v244 + 0.0909090909090909d0*(-15.0d0*v519 + 5.0d0*v520)
    Ms_yyyyyy = M_0*S_yyyyyy + v256 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v278 - &
      2340.0d0*v290 + 2360.0d0*v305 - 2260.0d0*v311 - 160.0d0*(v267 + &
      v285) - 120.0d0*(v268 + v289) + 576.0d0*(v297 + v308) + 1620.0d0* &
      (v302 + v307) + 840.0d0*(v443 + v445) + 90.0d0*(-M_yyyyzz + v281 &
      + v300) - 600.0d0*(v260 + v291 + v309 + v316) + 720.0d0*(v263 + &
      v279 + v280 + v304) + 360.0d0*(v265 - v282 - v295 + v306) - &
      1680.0d0*(v441 + v442 + v446 + v448) - 165.0d0*(v270 + v287 + &
      v299 + v301 + v303 + v313) - 180.0d0*(M_xxyyyy + v272 + v284 + &
      v294 + v296 + v298 + v310) + 30.0d0*(v257 + v259 + v261 + v271 + &
      v273 + v277 + v292 + v315) + 60.0d0*(v258 - v262 - v264 - v266 - &
      v269 + v275 - v286 - v312))
    S_yyyyyz  = v2*v527
    Ms_yyyyyz = M_0*S_yyyyyz - v522 - v523 - v525 - v526 + 0.0303030303030303d0*(28.0d0* &
      M_yyyyyz + 80.0d0*(v465 + v498) + 160.0d0*(v474 + v500) + 90.0d0* &
      (v475 + v502) - 140.0d0*(v483 + v485) + 250.0d0*(v493 + v499) + &
      220.0d0*(v495 + v503) + 68.0d0*(v496 + v506) + 330.0d0*(M_yyy* &
      S_yyz + M_yyz*S_yyy) + 20.0d0*(v479 + v481 + v492 + v494) + &
      100.0d0*(-v484 - v488 + v491 + v497) + 10890.0d0*(-M_xxyyyz + &
      v476 - v477 - v490 + v505) + 40.0d0*(v464 - v466 - v470 + v473 + &
      v478 + v480 - v486 - v487) - 5.0d0*(M_xxxxyz + M_xxyzzz + &
      M_yyyzzz + v452 + v453 + v454 + v457 + v469 + v489) - 25.0d0*( &
      v450 + v451 + v455 + v456 + v458 + v459 + v460 + v461 + v467 + &
      v468 + v501 + v504))
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
    
! OPS  711*ADD + 2*DIV + 1014*MUL + 87*NEG + POW + 20*SUB = 1835  (2376 before optimization)
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
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v183, v184, v185, v186, v187, v188,&
                v189, v19, v190, v191, v192, v193, v194, v195, v196, v2, v20,&
                v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31,&
                v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42,&
                v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53,&
                v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64,&
                v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75,&
                v76, v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86,&
                v87, v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97,&
                v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy,&
                D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz,&
                D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz,&
                D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy,&
                D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy,&
                D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz,&
                D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz,&
                D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz,&
                D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz,&
                D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz,&
                D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz,&
                D_zzzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz,&
                M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define z                    r(3)
#define y                    r(2)
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
#define L_xz                 L(6)
#define M_xz                 M(6)
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
#define M_yyy                M(14)
#define L_yyy                L(14)
#define L_yyz                L(15)
#define M_yyz                M(15)
#define L_xxxx               L(16)
#define M_xxxx               M(16)
#define M_xxxy               M(17)
#define L_xxxy               L(17)
#define L_xxxz               L(18)
#define M_xxxz               M(18)
#define M_xxyy               M(19)
#define L_xxyy               L(19)
#define M_xxyz               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define M_xyyz               M(22)
#define L_xyyz               L(22)
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
#define L_xxxxxx             L(36)
#define M_xxxxxx             M(36)
#define L_xxxxxy             L(37)
#define M_xxxxxy             M(37)
#define L_xxxxxz             L(38)
#define M_xxxxxz             M(38)
#define M_xxxxyy             M(39)
#define L_xxxxyy             L(39)
#define L_xxxxyz             L(40)
#define M_xxxxyz             M(40)
#define L_xxxyyy             L(41)
#define M_xxxyyy             M(41)
#define M_xxxyyz             M(42)
#define L_xxxyyz             L(42)
#define M_xxyyyy             M(43)
#define L_xxyyyy             L(43)
#define M_xxyyyz             M(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define M_xyyyyy             M(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define L_yyyyyy             L(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define L_yyyyyz             L(48)
    v194     = y*z
    v188     = 15.0d0*v194
    v190     = x*y
    v192     = v194
    v57      = 0.5d0*M_xx
    v65      = 0.166666666666667d0*M_xxx
    v66      = 0.5d0*M_xxy
    v67      = 0.5d0*M_xxz
    v83      = 0.0416666666666667d0*M_xxxx
    v84      = 0.166666666666667d0*M_xxxy
    v85      = 0.166666666666667d0*M_xxxz
    v86      = 0.25d0*M_xxyy
    v87      = 0.5d0*M_xxyz
    v121     = 0.00833333333333333d0*M_xxxxx
    v122     = 0.0416666666666667d0*M_xxxxy
    v123     = 0.0416666666666667d0*M_xxxxz
    v124     = 0.0833333333333333d0*M_xxxyy
    v125     = 0.166666666666667d0*M_xxxyz
    v127     = 0.0833333333333333d0*M_xxyyy
    v128     = 0.25d0*M_xxyyz
    v150     = 0.5d0*M_yy
    v152     = 0.166666666666667d0*M_yyy
    v153     = 0.5d0*M_yyz
    v157     = 0.0416666666666667d0*M_yyyy
    v158     = 0.166666666666667d0*M_yyyz
    v165     = 0.00833333333333333d0*M_yyyyy
    v166     = 0.0416666666666667d0*M_yyyyz
    M_zz     = -(M_xx + M_yy)
    v176     = 0.5d0*M_zz
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    v177     = 0.166666666666667d0*M_zzz
    M_xxzz   = -(M_xxxx + M_xxyy)
    v88      = 0.25d0*M_xxzz
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v159     = 0.25d0*M_yyzz
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    v178     = 0.0416666666666667d0*M_zzzz
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    v126     = 0.0833333333333333d0*M_xxxzz
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    v129     = 0.25d0*M_xxyzz
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    v130     = 0.0833333333333333d0*M_xxzzz
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v167     = 0.0833333333333333d0*M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    v168     = 0.0833333333333333d0*M_yyzzz
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    v179     = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz = -(M_xxzzzz + M_yyzzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v180     = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v180
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v181     = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v181
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v100     = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v182     = 3.0d0*h
    v183     = h*v0
    v184     = h*v1
    v193     = 21.0d0*h
    v4       = -h
    v12      = v182
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v183
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v184
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 + 630.0d0*v183 - 945.0d0*v19
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 + 630.0d0*v184 - 945.0d0*v31
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
    D_0      = u
    u3       = u*u2
    v2       = u3
    D_x      = -v2*x
    D_y      = -v2*y
    D_z      = -v2*z
    u4       = u2*u2
    u5       = u2*u3
    v3       = u5
    v185     = 3.0d0*v3
    v6       = v185*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v185*v192
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v186     = 3.0d0*v8
    v9       = v8*x
    v11      = v186*(h - v10)
    D_xxx    = -3.0d0*v9*(v180 - v182)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    v131     = 0.5d0*D_xyy
    D_xyz    = -v188*v9
    D_xzz    = -(D_xxx + D_xyy)
    v141     = 0.5d0*D_xzz
    D_yyy    = v186*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    v169     = 0.5d0*D_yzz
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v187     = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v187*y
    v26      = v187*z
    v28      = v15*v188
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v89      = 0.5d0*D_xxyy
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    v95      = 0.5d0*D_xxzz
    D_xyyy   = v22*v30
    v110     = 0.5d0*D_xyyy
    v132     = 0.166666666666667d0*D_xyyy
    D_xyyz   = v26*(v29 + v4)
    v138     = 0.5d0*D_xyyz
    D_xyzz   = -(D_xxxy + D_xyyy)
    v116     = 0.5d0*D_xyzz
    D_xzzz   = -(D_xxxz + D_xyyz)
    v142     = 0.166666666666667d0*D_xzzz
    v147     = 0.5d0*D_xzzz
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    v160     = 0.5d0*D_yyzz
    D_yzzz   = -(D_xxyz + D_yyyz)
    v170     = 0.166666666666667d0*D_yzzz
    v173     = 0.5d0*D_yzzz
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v195     = v34*z
    v189     = 15.0d0*v34
    v35      = v189*x
    v39      = v195
    v41      = 315.0d0*v190*v195
    v42      = v189*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy  = v34*v38*y
    D_xxxxz  = v38*v39
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    v68      = 0.5d0*D_xxxyy
    D_xxxyz  = v41*(h - v5)
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    v71      = 0.5d0*D_xxxzz
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    v77      = 0.5d0*D_xxyyy
    v90      = 0.166666666666667d0*D_xxyyy
    D_xxyyz  = v39*(v36 - 945.0d0*v181 + 105.0d0*(v183 + v184))
    v93      = 0.5d0*D_xxyyz
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    v80      = 0.5d0*D_xxyzz
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    v96      = 0.166666666666667d0*D_xxzzz
    v98      = 0.5d0*D_xxzzz
    D_xyyyy  = v34*v43*x
    v104     = 0.5d0*D_xyyyy
    v111     = 0.166666666666667d0*D_xyyyy
    v133     = 0.0416666666666667d0*D_xyyyy
    D_xyyyz  = v41*(h - v7)
    v114     = 0.5d0*D_xyyyz
    v136     = 0.166666666666667d0*D_xyyyz
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    v107     = 0.5d0*D_xyyzz
    v139     = 0.25d0*D_xyyzz
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    v117     = 0.166666666666667d0*D_xyzzz
    v119     = 0.5d0*D_xyzzz
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    v143     = 0.0416666666666667d0*D_xzzzz
    v148     = 0.166666666666667d0*D_xzzzz
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz  = v39*v43
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    v154     = 0.5d0*D_yyyzz
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    v161     = 0.166666666666667d0*D_yyzzz
    v163     = 0.5d0*D_yyzzz
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    v171     = 0.0416666666666667d0*D_yzzzz
    v174     = 0.166666666666667d0*D_yzzzz
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v196     = 315.0d0*v44
    v191     = v196*x
    v45      = 45.0d0*v44
    v50      = v191*y
    v54      = v191*z
    v56      = v192*v196
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = v50*v53
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = v53*v54
    L_xxxxx  = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 + v17*v29 - v19*v193 + 14.0d0*v49)
    v58      = 0.5d0*D_xxxxyy
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxy  = D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    v59      = 0.5d0*D_xxxxzz
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v57 + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_yy*v58 + M_zz*v59
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945.0d0*v190*v44*(11.0d0*v27 + v17 + v60 + v61)
    v63      = 0.5d0*D_xxxyyy
    v69      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = v54*(-9.0d0*v32 + v60 + v62)
    v70      = 0.5d0*D_xxxyyz
    L_xxxyy  = D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    v64      = 0.5d0*D_xxxyzz
    L_xxxy   = D_xxxxxy*v57 + D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyz*M_yz + D_xxxyz*M_z + M_yy*v63 + M_zz*v64
    L_xxxyz  = D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    v72      = 0.166666666666667d0*D_xxxzzz
    v73      = 0.5d0*D_xxxzzz
    L_xxx    = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v57 + D_xxxxxx*v65 + D_xxxxxy*v66 + &
      D_xxxxxz*v67 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + M_xyy*v58 + M_xzz*v59 + &
      M_yy*v68 + M_yyy*v69 + M_yyz*v70 + M_yzz*v64 + M_zz*v71 + M_zzz* &
      v72
    L_xxxz   = D_xxxxxz*v57 + D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y &
      + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_yy*v70 + M_zz*v73
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 + v17*v24 - v193*v31 + 14.0d0*v74)
    v75      = 0.5d0*D_xxyyyy
    v78      = 0.166666666666667d0*D_xxyyyy
    v91      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = v56*(-9.0d0*v20 + v61 + v62)
    v79      = 0.5d0*D_xxyyyz
    v92      = 0.166666666666667d0*D_xxyyyz
    L_xxyyy  = D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    v76      = 0.5d0*D_xxyyzz
    v94      = 0.25d0*D_xxyyzz
    L_xxyy   = D_xxxxyy*v57 + D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyz*M_yz + D_xxyyz*M_z + M_yy*v75 + M_zz*v76
    L_xxyyz  = D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    v81      = 0.166666666666667d0*D_xxyzzz
    v82      = 0.5d0*D_xxyzzz
    L_xxy    = D_xxxxxy*v65 + D_xxxxy*v57 + D_xxxxyy*v66 + D_xxxxyz*v67 + D_xxxy*M_x + &
      D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy &
      *M_y + D_xxyyz*M_yz + D_xxyz*M_z + M_xyy*v63 + M_xzz*v64 + M_yy* &
      v77 + M_yyy*v78 + M_yyz*v79 + M_yzz*v76 + M_zz*v80 + M_zzz*v81
    L_xxyz   = D_xxxxyz*v57 + D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y &
      + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_yy*v79 + M_zz*v82
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    v97      = 0.0416666666666667d0*D_xxzzzz
    v99      = 0.166666666666667d0*D_xxzzzz
    L_xx     = D_xx*M_0 + D_xxx*M_x + D_xxxx*v57 + D_xxxxx*v65 + D_xxxxxx*v83 + &
      D_xxxxxy*v84 + D_xxxxxz*v85 + D_xxxxy*v66 + D_xxxxyy*v86 + &
      D_xxxxyz*v87 + D_xxxxz*v67 + D_xxxxzz*v88 + D_xxxy*M_xy + D_xxxyz &
      *M_xyz + D_xxxz*M_xz + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + &
      M_xyy*v68 + M_xyyy*v69 + M_xyyz*v70 + M_xyzz*v64 + M_xzz*v71 + &
      M_xzzz*v72 + M_yy*v89 + M_yyy*v90 + M_yyyy*v91 + M_yyyz*v92 + &
      M_yyz*v93 + M_yyzz*v94 + M_yzz*v80 + M_yzzz*v81 + M_zz*v95 + &
      M_zzz*v96 + M_zzzz*v97
    L_xxz    = D_xxxxxz*v65 + D_xxxxyz*v66 + D_xxxxz*v57 + D_xxxxzz*v67 + D_xxxyz*M_xy &
      + D_xxxyzz*M_xyz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + M_xyy*v70 + M_xzz*v73 + &
      M_yy*v93 + M_yyy*v92 + M_yyz*v76 + M_yzz*v82 + M_zz*v98 + M_zzz* &
      v99
    D_xyyyyy = v101*v50
    v102     = 0.5d0*D_xyyyyy
    v105     = 0.166666666666667d0*D_xyyyyy
    v112     = 0.0416666666666667d0*D_xyyyyy
    v134     = 0.00833333333333333d0*D_xyyyyy
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = v54*(-18.0d0*v32 + v100 + v17)
    v106     = 0.5d0*D_xyyyyz
    v113     = 0.166666666666667d0*D_xyyyyz
    v135     = 0.0416666666666667d0*D_xyyyyz
    L_xyyyy  = D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    v103     = 0.5d0*D_xyyyzz
    v115     = 0.25d0*D_xyyyzz
    v137     = 0.0833333333333333d0*D_xyyyzz
    v145     = 0.166666666666667d0*D_xyyyzz
    L_xyyy   = D_xxxyyy*v57 + D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyz*M_yz + D_xyyyz*M_z + M_yy*v102 + M_zz* &
      v103
    L_xyyyz  = D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    v108     = 0.166666666666667d0*D_xyyzzz
    v109     = 0.5d0*D_xyyzzz
    v140     = 0.0833333333333333d0*D_xyyzzz
    v146     = 0.25d0*D_xyyzzz
    L_xyy    = D_xxxxyy*v65 + D_xxxyy*v57 + D_xxxyyy*v66 + D_xxxyyz*v67 + D_xxyy*M_x + &
      D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy &
      *M_y + D_xyyyz*M_yz + D_xyyz*M_z + M_xyy*v75 + M_xzz*v76 + M_yy* &
      v104 + M_yyy*v105 + M_yyz*v106 + M_yzz*v103 + M_zz*v107 + M_zzz* &
      v108
    L_xyyz   = D_xxxyyz*v57 + D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y &
      + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_yy*v106 + M_zz* &
      v109
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    v118     = 0.0416666666666667d0*D_xyzzzz
    v120     = 0.166666666666667d0*D_xyzzzz
    L_xy     = D_xxxxxy*v83 + D_xxxxy*v65 + D_xxxxyy*v84 + D_xxxxyz*v85 + D_xxxy*v57 + &
      D_xxxyy*v66 + D_xxxyyy*v86 + D_xxxyyz*v87 + D_xxxyz*v67 + &
      D_xxxyzz*v88 + D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz* &
      M_xz + D_xy*M_0 + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v77 &
      + M_xyyy*v78 + M_xyyz*v79 + M_xyzz*v76 + M_xzz*v80 + M_xzzz*v81 + &
      M_yy*v110 + M_yyy*v111 + M_yyyy*v112 + M_yyyz*v113 + M_yyz*v114 + &
      M_yyzz*v115 + M_yzz*v107 + M_yzzz*v108 + M_zz*v116 + M_zzz*v117 + &
      M_zzzz*v118
    L_xyz    = D_xxxxyz*v65 + D_xxxyyz*v66 + D_xxxyz*v57 + D_xxxyzz*v67 + D_xxyyz*M_xy &
      + D_xxyyzz*M_xyz + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + M_xyy*v79 + M_xzz*v82 + &
      M_yy*v114 + M_yyy*v113 + M_yyz*v103 + M_yzz*v109 + M_zz*v119 + &
      M_zzz*v120
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    v144     = 0.00833333333333333d0*D_xzzzzz
    v149     = 0.0416666666666667d0*D_xzzzzz
    L_x      = D_x*M_0 + D_xx*M_x + D_xxx*v57 + D_xxxx*v65 + D_xxxxx*v83 + D_xxxxxx* &
      v121 + D_xxxxxy*v122 + D_xxxxxz*v123 + D_xxxxy*v84 + D_xxxxyy* &
      v124 + D_xxxxyz*v125 + D_xxxxz*v85 + D_xxxxzz*v126 + D_xxxy*v66 + &
      D_xxxyy*v86 + D_xxxyyy*v127 + D_xxxyyz*v128 + D_xxxyz*v87 + &
      D_xxxyzz*v129 + D_xxxz*v67 + D_xxxzz*v88 + D_xxxzzz*v130 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + D_xz* &
      M_z + M_xyy*v89 + M_xyyy*v90 + M_xyyyy*v91 + M_xyyyz*v92 + M_xyyz &
      *v93 + M_xyyzz*v94 + M_xyzz*v80 + M_xyzzz*v81 + M_xzz*v95 + &
      M_xzzz*v96 + M_xzzzz*v97 + M_yy*v131 + M_yyy*v132 + M_yyyy*v133 + &
      M_yyyyy*v134 + M_yyyyz*v135 + M_yyyz*v136 + M_yyyzz*v137 + M_yyz* &
      v138 + M_yyzz*v139 + M_yyzzz*v140 + M_yzz*v116 + M_yzzz*v117 + &
      M_yzzzz*v118 + M_zz*v141 + M_zzz*v142 + M_zzzz*v143 + M_zzzzz* &
      v144
    L_xz     = D_xxxxxz*v83 + D_xxxxyz*v84 + D_xxxxz*v65 + D_xxxxzz*v85 + D_xxxyyz*v86 &
      + D_xxxyz*v66 + D_xxxyzz*v87 + D_xxxz*v57 + D_xxxzz*v67 + &
      D_xxxzzz*v88 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz* &
      M_xz + D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + M_xyy*v93 &
      + M_xyyy*v92 + M_xyyz*v76 + M_xyzz*v82 + M_xzz*v98 + M_xzzz*v99 + &
      M_yy*v138 + M_yyy*v136 + M_yyyy*v135 + M_yyyz*v145 + M_yyz*v107 + &
      M_yyzz*v146 + M_yzz*v119 + M_yzzz*v120 + M_zz*v147 + M_zzz*v148 + &
      M_zzzz*v149
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v74)
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = v101*v56
    L_yyyyy  = D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    v151     = 0.5d0*D_yyyyzz
    L_yyyy   = D_xxyyyy*v57 + D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*v150 + D_yyyyyz*M_yz + D_yyyyz*M_z + &
      M_zz*v151
    L_yyyyz  = D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    v155     = 0.166666666666667d0*D_yyyzzz
    v156     = 0.5d0*D_yyyzzz
    L_yyy    = D_xxxyyy*v65 + D_xxyyy*v57 + D_xxyyyy*v66 + D_xxyyyz*v67 + D_xyyy*M_x + &
      D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy &
      *M_y + D_yyyyy*v150 + D_yyyyyy*v152 + D_yyyyyz*v153 + D_yyyyz* &
      M_yz + D_yyyz*M_z + M_xyy*v102 + M_xzz*v103 + M_yzz*v151 + M_zz* &
      v154 + M_zzz*v155
    L_yyyz   = D_xxyyyz*v57 + D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyz* &
      v150 + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + D_yyyzz*M_z + &
      M_zz*v156
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    v162     = 0.0416666666666667d0*D_yyzzzz
    v164     = 0.166666666666667d0*D_yyzzzz
    L_yy     = D_xxxxyy*v83 + D_xxxyy*v65 + D_xxxyyy*v84 + D_xxxyyz*v85 + D_xxyy*v57 + &
      D_xxyyy*v66 + D_xxyyyy*v86 + D_xxyyyz*v87 + D_xxyyz*v67 + &
      D_xxyyzz*v88 + D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz* &
      M_xz + D_yy*M_0 + D_yyy*M_y + D_yyyy*v150 + D_yyyyy*v152 + &
      D_yyyyyy*v157 + D_yyyyyz*v158 + D_yyyyz*v153 + D_yyyyzz*v159 + &
      D_yyyz*M_yz + D_yyz*M_z + M_xyy*v104 + M_xyyy*v105 + M_xyyz*v106 &
      + M_xyzz*v103 + M_xzz*v107 + M_xzzz*v108 + M_yzz*v154 + M_yzzz* &
      v155 + M_zz*v160 + M_zzz*v161 + M_zzzz*v162
    L_yyz    = D_xxxyyz*v65 + D_xxyyyz*v66 + D_xxyyz*v57 + D_xxyyzz*v67 + D_xyyyz*M_xy &
      + D_xyyyzz*M_xyz + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyyz*v152 + &
      D_yyyyz*v150 + D_yyyyzz*v153 + D_yyyz*M_y + D_yyyzz*M_yz + D_yyz* &
      M_0 + D_yyzz*M_z + M_xyy*v106 + M_xzz*v109 + M_yzz*v156 + M_zz* &
      v163 + M_zzz*v164
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    v172     = 0.00833333333333333d0*D_yzzzzz
    v175     = 0.0416666666666667d0*D_yzzzzz
    L_y      = D_xxxxxy*v121 + D_xxxxy*v83 + D_xxxxyy*v122 + D_xxxxyz*v123 + D_xxxy*v65 &
      + D_xxxyy*v84 + D_xxxyyy*v124 + D_xxxyyz*v125 + D_xxxyz*v85 + &
      D_xxxyzz*v126 + D_xxy*v57 + D_xxyy*v66 + D_xxyyy*v86 + D_xxyyyy* &
      v127 + D_xxyyyz*v128 + D_xxyyz*v87 + D_xxyyzz*v129 + D_xxyz*v67 + &
      D_xxyzz*v88 + D_xxyzzz*v130 + D_xy*M_x + D_xyy*M_xy + D_xyyz* &
      M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v150 + D_yyyy* &
      v152 + D_yyyyy*v157 + D_yyyyyy*v165 + D_yyyyyz*v166 + D_yyyyz* &
      v158 + D_yyyyzz*v167 + D_yyyz*v153 + D_yyyzz*v159 + D_yyyzzz*v168 &
      + D_yyz*M_yz + D_yz*M_z + M_xyy*v110 + M_xyyy*v111 + M_xyyyy*v112 &
      + M_xyyyz*v113 + M_xyyz*v114 + M_xyyzz*v115 + M_xyzz*v107 + &
      M_xyzzz*v108 + M_xzz*v116 + M_xzzz*v117 + M_xzzzz*v118 + M_yzz* &
      v160 + M_yzzz*v161 + M_yzzzz*v162 + M_zz*v169 + M_zzz*v170 + &
      M_zzzz*v171 + M_zzzzz*v172
    L_yz     = D_xxxxyz*v83 + D_xxxyyz*v84 + D_xxxyz*v65 + D_xxxyzz*v85 + D_xxyyyz*v86 &
      + D_xxyyz*v66 + D_xxyyzz*v87 + D_xxyz*v57 + D_xxyzz*v67 + &
      D_xxyzzz*v88 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz* &
      M_xz + D_yyyyyz*v157 + D_yyyyz*v152 + D_yyyyzz*v158 + D_yyyz*v150 &
      + D_yyyzz*v153 + D_yyyzzz*v159 + D_yyz*M_y + D_yyzz*M_yz + D_yz* &
      M_0 + D_yzz*M_z + M_xyy*v114 + M_xyyy*v113 + M_xyyz*v103 + M_xyzz &
      *v109 + M_xzz*v119 + M_xzzz*v120 + M_yzz*v163 + M_yzzz*v164 + &
      M_zz*v173 + M_zzz*v174 + M_zzzz*v175
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = 0.00138888888888889d0*(D_xxxxxx*M_xxxxxx + 30.0d0*D_xxxxyz*M_xxxxyz + &
      90.0d0*D_xxyyzz*M_xxyyzz + D_yyyyyy*M_yyyyyy + D_zzzzzz*M_zzzzzz &
      + 6.0d0*(D_xxxxxy*M_xxxxxy + D_xxxxxz*M_xxxxxz + D_yyyyyz* &
      M_yyyyyz) + 20.0d0*(D_xxxyyy*M_xxxyyy + D_xxxzzz*M_xxxzzz + &
      D_yyyzzz*M_yyyzzz) + 60.0d0*(D_xxxyyz*M_xxxyyz + D_xxxyzz* &
      M_xxxyzz + D_xxyyyz*M_xxyyyz + D_xxyzzz*M_xxyzzz) + 15.0d0*( &
      D_xxxxyy*M_xxxxyy + D_xxxxzz*M_xxxxzz + D_xxyyyy*M_xxyyyy + &
      D_xxzzzz*M_xxzzzz + D_yyyyzz*M_yyyyzz + D_yyzzzz*M_yyzzzz)) + D_0 &
      *M_0 + D_x*M_x + D_xx*v57 + D_xxx*v65 + D_xxxx*v83 + D_xxxxx*v121 &
      + D_xxxxy*v122 + D_xxxxz*v123 + D_xxxy*v84 + D_xxxyy*v124 + &
      D_xxxyz*v125 + D_xxxz*v85 + D_xxxzz*v126 + D_xxy*v66 + D_xxyy*v86 &
      + D_xxyyy*v127 + D_xxyyz*v128 + D_xxyz*v87 + D_xxyzz*v129 + D_xxz &
      *v67 + D_xxzz*v88 + D_xxzzz*v130 + D_xy*M_xy + D_xyz*M_xyz + D_xz &
      *M_xz + D_y*M_y + D_yy*v150 + D_yyy*v152 + D_yyyy*v157 + D_yyyyy* &
      v165 + D_yyyyz*v166 + D_yyyz*v158 + D_yyyzz*v167 + D_yyz*v153 + &
      D_yyzz*v159 + D_yyzzz*v168 + D_yz*M_yz + D_z*M_z + D_zz*v176 + &
      D_zzz*v177 + D_zzzz*v178 + D_zzzzz*v179 + M_xyy*v131 + M_xyyy* &
      v132 + M_xyyyy*v133 + M_xyyyyy*v134 + M_xyyyyz*v135 + M_xyyyz* &
      v136 + M_xyyyzz*v137 + M_xyyz*v138 + M_xyyzz*v139 + M_xyyzzz*v140 &
      + M_xyzz*v116 + M_xyzzz*v117 + M_xyzzzz*v118 + M_xzz*v141 + &
      M_xzzz*v142 + M_xzzzz*v143 + M_xzzzzz*v144 + M_yzz*v169 + M_yzzz* &
      v170 + M_yzzzz*v171 + M_yzzzzz*v172
    L_z      = D_xxxxxz*v121 + D_xxxxyz*v122 + D_xxxxz*v83 + D_xxxxzz*v123 + D_xxxyyz* &
      v124 + D_xxxyz*v84 + D_xxxyzz*v125 + D_xxxz*v65 + D_xxxzz*v85 + &
      D_xxxzzz*v126 + D_xxyyyz*v127 + D_xxyyz*v86 + D_xxyyzz*v128 + &
      D_xxyz*v66 + D_xxyzz*v87 + D_xxyzzz*v129 + D_xxz*v57 + D_xxzz*v67 &
      + D_xxzzz*v88 + D_xxzzzz*v130 + D_xyz*M_xy + D_xyzz*M_xyz + D_xz* &
      M_x + D_xzz*M_xz + D_yyyyyz*v165 + D_yyyyz*v157 + D_yyyyzz*v166 + &
      D_yyyz*v152 + D_yyyzz*v158 + D_yyyzzz*v167 + D_yyz*v150 + D_yyzz* &
      v153 + D_yyzzz*v159 + D_yyzzzz*v168 + D_yz*M_y + D_yzz*M_yz + D_z &
      *M_0 + D_zz*M_z + D_zzz*v176 + D_zzzz*v177 + D_zzzzz*v178 + &
      D_zzzzzz*v179 + M_xyy*v138 + M_xyyy*v136 + M_xyyyy*v135 + M_xyyyz &
      *v145 + M_xyyz*v107 + M_xyyzz*v146 + M_xyzz*v119 + M_xyzzz*v120 + &
      M_xzz*v147 + M_xzzz*v148 + M_xzzzz*v149 + M_yzz*v173 + M_yzzz* &
      v174 + M_yzzzz*v175
#undef  M_0                 
#undef  L_0                 
#undef  z                   
#undef  y                   
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
#undef  L_xz                
#undef  M_xz                
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
#undef  M_yyy               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_yyz               
#undef  L_xxxx              
#undef  M_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  M_xxyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xyyz              
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
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  L_xxxxxz            
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxxyz            
#undef  L_xxxyyy            
#undef  M_xxxyyy            
#undef  M_xxxyyz            
#undef  L_xxxyyz            
#undef  M_xxyyyy            
#undef  L_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
    end subroutine mom_es_M2L
    
! OPS  390*ADD + 2*DIV + 462*MUL + 35*NEG + POW = 890  (2242 before optimization)
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
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v183, v19, v2, v20, v21, v22, v23, v24,&
                v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
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
                L_zzzzzz
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
#define L_xxxyz              L(29)
#define Ls_xxxyz             Ls(29)
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
#define Ls_xxxxxx            Ls(36)
#define L_xxxxxx             L(36)
#define L_xxxxxy             L(37)
#define Ls_xxxxxy            Ls(37)
#define Ls_xxxxxz            Ls(38)
#define L_xxxxxz             L(38)
#define Ls_xxxxyy            Ls(39)
#define L_xxxxyy             L(39)
#define Ls_xxxxyz            Ls(40)
#define L_xxxxyz             L(40)
#define Ls_xxxyyy            Ls(41)
#define L_xxxyyy             L(41)
#define Ls_xxxyyz            Ls(42)
#define L_xxxyyz             L(42)
#define Ls_xxyyyy            Ls(43)
#define L_xxyyyy             L(43)
#define Ls_xxyyyz            Ls(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define Ls_xyyyyy            Ls(45)
#define L_xyyyyz             L(46)
#define Ls_xyyyyz            Ls(46)
#define L_yyyyyy             L(47)
#define Ls_yyyyyy            Ls(47)
#define Ls_yyyyyz            Ls(48)
#define L_yyyyyz             L(48)
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
    v73       = 0.166666666666667d0*x
    v83       = L_xyyyz*z
    v86       = v7*y
    v89       = L_xyyz*z
    v100      = L_xyz*z
    v116      = L_xz*z
    v132      = 0.0416666666666667d0*x
    v144      = L_yyyyz*z
    v147      = L_yyyz*z
    v150      = 0.5d0*y
    v154      = L_yyz*z
    v159      = 0.166666666666667d0*y
    v165      = L_yz*z
    v173      = 0.0416666666666667d0*y
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
    v135      = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v175      = L_yzz*z
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    v76       = L_xxzz*z
    L_xyzz    = -(L_xxxy + L_xyyy)
    v109      = L_xyzz*z
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    v161      = L_yyzz*z
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    v38       = L_xxxzz*z
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    v55       = L_xxyzz*z
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    v96       = L_xyyzz*z
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    v152      = L_yyyzz*z
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
    v87       = L_xyyyz + L_xyyyzz*z
    v88       = L_xyyyyz*y + v87
    v99       = v87*y
    Ls_xyyyz  = L_xxyyyz*x + v88
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    v146      = L_yyyyz + L_yyyyzz*z
    Ls_yyyyz  = v146 + L_xyyyyz*x + L_yyyyyz*y
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
    v72       = 0.25d0*v11
    v131      = 0.0833333333333333d0*v11
    a3        = a1*a2
    v26       = a3
    v27       = 0.166666666666667d0*v26
    v130      = 0.0833333333333333d0*v26
    a4        = a2*a2
    v60       = a4
    v61       = 0.0416666666666667d0*v60
    a5        = a2*a3
    v117      = 0.00833333333333333d0*a5
    a6        = a3*a3
    b2        = b1*b1
    v13       = b2
    v14       = L_xxxxyy*v13
    v20       = L_xxxyyy*v13
    v33       = 0.5d0*v13
    v39       = L_xxxyyz*v13
    v43       = L_xxyyyy*v13
    v56       = L_xxyyyz*v13
    v74       = 3.0d0*v13
    v84       = L_xyyyyy*v13
    v97       = L_xyyyyz*v13
    v158      = 0.25d0*v13
    v172      = 0.0833333333333333d0*v13
    b3        = b1*b2
    v28       = b3
    v29       = L_xxxyyy*v28
    v49       = L_xxyyyy*v28
    v68       = 0.166666666666667d0*v28
    v77       = L_xxyyyz*v28
    v90       = L_xyyyyy*v28
    v110      = L_xyyyyz*v28
    v133      = 4.0d0*v28
    v171      = 0.0833333333333333d0*v28
    b4        = b2*b2
    v62       = b4
    v63       = L_xxyyyy*v62
    v101      = L_xyyyyy*v62
    v125      = 0.0416666666666667d0*v62
    v136      = L_xyyyyz*v62
    b5        = b2*b3
    v118      = b5
    v119      = L_xyyyyy*v118
    v166      = 0.00833333333333333d0*v118
    b6        = b3*b3
    c2        = c1*c1
    v15       = c2
    v180      = 0.5d0*v15
    v120      = L_xzz*v15
    v167      = L_yzz*v15
    v64       = L_xxzz*v15
    v102      = L_xyzz*v15
    v137      = L_xzzz*v15
    v155      = L_yyzz*v15
    v176      = L_yzzz*v15
    v30       = L_xxxzz*v15
    v50       = L_xxyzz*v15
    v78       = L_xxzzz*v15
    v91       = L_xyyzz*v15
    v111      = L_xyzzz*v15
    v148      = L_yyyzz*v15
    v162      = L_yyzzz*v15
    v16       = L_xxxxzz*v15
    v37       = v14 + v16 + 2.0d0*(L_xxxx + v10 + v17)
    Ls_xxxx   = 0.5d0*(v14 + v16) + L_xxxx + L_xxxxxx*v12 + v0*x + v10 + v17
    v21       = L_xxxyzz*v15
    v34       = v21 + 2.0d0*(L_xxxy + v19)
    v35       = v34*y
    v54       = 2.0d0*v22 + v20 + v34
    Ls_xxxy   = 0.5d0*(v20 + v21) + L_xxxxxy*v12 + L_xxxy + v19 + v2*x + v22
    v40       = L_xxxzzz*v15
    v82       = v39 + v40 + 2.0d0*(L_xxxz + v38 + v41)
    Ls_xxxz   = 0.5d0*(v39 + v40) + L_xxxxxz*v12 + L_xxxz + v18*x + v38 + v41
    v44       = L_xxyyzz*v15
    v52       = v44 + 2.0d0*(L_xxyy + v42)
    v53       = v52*y
    v69       = v13*v52
    v95       = 2.0d0*v45 + v43 + v52
    Ls_xxyy   = 0.5d0*(v43 + v44) + L_xxxxyy*v12 + L_xxyy + v4*x + v42 + v45
    v57       = L_xxyzzz*v15
    v80       = v57 + 2.0d0*(L_xxyz + v55)
    v81       = v80*y
    v115      = 2.0d0*v58 + v56 + v80
    Ls_xxyz   = 0.5d0*(v56 + v57) + L_xxxxyz*v12 + L_xxyz + v24*x + v55 + v58
    v85       = L_xyyyzz*v15
    v93       = v85 + 2.0d0*(L_xyyy + v83)
    v94       = v93*y
    v105      = v13*v93
    v126      = v28*v93
    Ls_xyyy   = 0.5d0*(v84 + v85) + L_xxxyyy*v12 + L_xyyy + v6*x + v83 + v86
    v98       = L_xyyzzz*v15
    v113      = v98 + 2.0d0*(L_xyyz + v96)
    v114      = v113*y
    v140      = v113*v13
    Ls_xyyz   = 0.5d0*(v97 + v98) + L_xxxyyz*v12 + L_xyyz + v47*x + v96 + v99
    v145      = L_yyyyzz*v15
    v151      = v145 + 2.0d0*(L_yyyy + v144)
    Ls_yyyy   = 0.5d0*v145 + L_xxyyyy*v12 + L_yyyy + L_yyyyyy*v33 + v144 + v8*x + v9*y
    v153      = L_yyyzzz*v15
    v164      = v153 + 2.0d0*(L_yyyz + v152)
    Ls_yyyz   = 0.5d0*v153 + L_xxyyyz*v12 + L_yyyyyz*v33 + L_yyyz + v146*y + v152 + v88* &
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
    v181      = 0.166666666666667d0*v31
    v121      = L_xzzz*v31
    v168      = L_yzzz*v31
    v65       = L_xxzzz*v31
    v103      = L_xyzzz*v31
    v138      = L_xzzzz*v31
    v156      = L_yyzzz*v31
    v177      = L_yzzzz*v31
    v32       = L_xxxzzz*v31
    v75       = v29 + v32 + v3*v74 + 6.0d0*(L_xxx + v25) + 3.0d0*(v30 + v35)
    Ls_xxx    = 0.166666666666667d0*(v29 + v32 + 3.0d0*(v30 + v35)) + L_xxx + L_xxxxxx* &
      v27 + v0*v12 + v25 + v3*v33 + v36*v37
    v51       = L_xxyzzz*v31
    v70       = v51 + 3.0d0*(2.0d0*L_xxy + 2.0d0*v48 + v50)
    v71       = v70*y
    v108      = v49 + v70 + v5*v74 + 3.0d0*v53
    Ls_xxy    = 0.166666666666667d0*(v49 + v51 + 3.0d0*(v50 + v53)) + L_xxxxxy*v27 + &
      L_xxy + v12*v2 + v33*v5 + v36*v54 + v48
    v79       = L_xxzzzz*v31
    v143      = v77 + v79 + v46*v74 + 6.0d0*(L_xxz + v76) + 3.0d0*(v78 + v81)
    Ls_xxz    = 0.166666666666667d0*(v77 + v79 + 3.0d0*(v78 + v81)) + L_xxxxxz*v27 + &
      L_xxz + v12*v18 + v33*v46 + v36*v82 + v76
    v92       = L_xyyzzz*v31
    v106      = v92 + 3.0d0*(2.0d0*L_xyy + 2.0d0*v89 + v91)
    v107      = v106*y
    v127      = v106*v13
    Ls_xyy    = 0.166666666666667d0*(v90 + v92 + 3.0d0*(v91 + v94)) + L_xxxxyy*v27 + &
      L_xyy + v12*v4 + v33*v7 + v36*v95 + v89
    v112      = L_xyzzzz*v31
    v141      = v112 + 3.0d0*(2.0d0*L_xyz + 2.0d0*v109 + v111)
    v142      = v141*y
    Ls_xyz    = 0.166666666666667d0*(v110 + v112 + 3.0d0*(v111 + v114)) + L_xxxxyz*v27 + &
      L_xyz + v109 + v115*v36 + v12*v24 + v33*v87
    v149      = L_yyyzzz*v31
    v160      = v149 + 3.0d0*(2.0d0*L_yyy + 2.0d0*v147 + v148)
    Ls_yyy    = 0.166666666666667d0*(3.0d0*v148 + v149) + L_xxxyyy*v27 + L_yyy + &
      L_yyyyyy*v68 + v12*v6 + v147 + v150*v151 + v33*v9 + v36*(v84 + &
      2.0d0*v86 + v93)
    v163      = L_yyzzzz*v31
    v179      = v163 + 3.0d0*(2.0d0*L_yyz + 2.0d0*v161 + v162)
    Ls_yyz    = 0.166666666666667d0*(3.0d0*v162 + v163) + L_xxxyyz*v27 + L_yyyyyz*v68 + &
      L_yyz + v12*v47 + v146*v33 + v150*v164 + v161 + v36*(v113 + v97 + &
      2.0d0*v99)
    c4        = c2*c2
    v66       = c4
    v182      = 0.0416666666666667d0*v66
    v122      = L_xzzzz*v66
    v169      = L_yzzzz*v66
    v67       = L_xxzzzz*v66
    v134      = v63 + v67 + v133*v5 + 12.0d0*v64 + 6.0d0*v69 + 24.0d0*(L_xx + v59) + &
      4.0d0*(v65 + v71)
    Ls_xx     = 0.0416666666666667d0*(v63 + 12.0d0*v64 + v67 + 6.0d0*v69 + 4.0d0*(v65 + &
      v71)) + L_xx + L_xxxxxx*v61 + v0*v27 + v37*v72 + v5*v68 + v59 + &
      v73*v75
    v104      = L_xyzzzz*v66
    v128      = v104 + 12.0d0*v102 + 4.0d0*(6.0d0*L_xy + 6.0d0*v100 + v103)
    v129      = v128*y
    Ls_xy     = 0.0416666666666667d0*(v101 + 12.0d0*v102 + v104 + 6.0d0*v105 + 4.0d0*( &
      v103 + v107)) + L_xxxxxy*v61 + L_xy + v100 + v108*v73 + v2*v27 + &
      v54*v72 + v68*v7
    v139      = L_xzzzzz*v66
    Ls_xz     = 0.0416666666666667d0*(v136 + 12.0d0*v137 + v139 + 6.0d0*v140 + 4.0d0*( &
      v138 + v142)) + L_xxxxxz*v61 + L_xz + v135 + v143*v73 + v18*v27 + &
      v68*v87 + v72*v82
    v157      = L_yyzzzz*v66
    v174      = v157 + 12.0d0*v155 + 4.0d0*(6.0d0*L_yy + 6.0d0*v154 + v156)
    Ls_yy     = 0.0416666666666667d0*(12.0d0*v155 + 4.0d0*v156 + v157) + L_xxxxyy*v61 + &
      L_yy + L_yyyyyy*v125 + v151*v158 + v154 + v159*v160 + v27*v4 + &
      v68*v9 + v72*v95 + v73*(v106 + v7*v74 + v90 + 3.0d0*v94)
    v178      = L_yzzzzz*v66
    Ls_yz     = 0.0416666666666667d0*(12.0d0*v176 + 4.0d0*v177 + v178) + L_xxxxyz*v61 + &
      L_yyyyyz*v125 + L_yz + v115*v72 + v146*v68 + v158*v164 + v159* &
      v179 + v175 + v24*v27 + v73*(v110 + 3.0d0*v114 + v141 + v74*v87)
    c5        = c2*c3
    v123      = c5
    v183      = 0.00833333333333333d0*v123
    v124      = L_xzzzzz*v123
    Ls_x      = 0.00833333333333333d0*(v119 + 60.0d0*v120 + 20.0d0*v121 + v124 + 5.0d0*( &
      v122 + v129) + 10.0d0*(v126 + v127)) + L_x + L_xxxxxx*v117 + v0* &
      v61 + v116 + v125*v7 + v130*v37 + v131*v75 + v132*v134
    v170      = L_yzzzzz*v123
    Ls_y      = 0.00833333333333333d0*(60.0d0*v167 + 20.0d0*v168 + 5.0d0*v169 + v170) + &
      L_xxxxxy*v117 + L_y + L_yyyyyy*v166 + v108*v131 + v125*v9 + v130* &
      v54 + v132*(v101 + 6.0d0*v105 + 4.0d0*v107 + v128 + v133*v7) + &
      v151*v171 + v160*v172 + v165 + v173*v174 + v2*v61
    Ls_z      = L_z + L_xxxxxz*v117 + L_yyyyyz*v166 + L_zz*z + L_zzz*v180 + L_zzzz*v181 &
      + L_zzzzz*v182 + L_zzzzzz*v183 + v125*v146 + v130*v82 + v131*v143 &
      + v132*(24.0d0*L_xz + v133*v87 + 24.0d0*v135 + v136 + 12.0d0*v137 &
      + 4.0d0*v138 + v139 + 6.0d0*v140 + 4.0d0*v142) + v164*v171 + v172 &
      *v179 + v173*(24.0d0*L_yz + 24.0d0*v175 + 12.0d0*v176 + 4.0d0* &
      v177 + v178) + v18*v61
    c6        = c3*c3
    Ls_0      = 0.00138888888888889d0*(L_xxxxxx*a6 + L_yyyyyy*b6 + L_zzzzzz*c6 + 20.0d0* &
      (v160*v28 + v26*v75) + 6.0d0*(x*(120.0d0*L_x + 120.0d0*v116 + &
      v119 + 60.0d0*v120 + 20.0d0*v121 + 5.0d0*v122 + v124 + 10.0d0* &
      v126 + 10.0d0*v127 + 5.0d0*v129 + 5.0d0*v62*v7) + y*(120.0d0*L_y &
      + 120.0d0*v165 + 60.0d0*v167 + 20.0d0*v168 + 5.0d0*v169 + v170)) &
      + 15.0d0*(v11*v134 + v13*v174 + v151*v62 + v37*v60)) + L_0 + L_z* &
      z + L_zz*v180 + L_zzz*v181 + L_zzzz*v182 + L_zzzzz*v183 + v0*v117 &
      + v166*v9
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
    
! OPS  252*ADD + 2*DIV + 347*MUL + 36*NEG + POW = 638  (1548 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h,&
                u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz,&
                L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz,&
                L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz,&
                L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz,&
                L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz,&
                L_yzzzzz, L_zzzzzz
#define Phi_0                Phi(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
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
#define Phi_xz               Phi(6)
#define L_xz                 L(6)
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
#define L_xxxxxx             L(36)
#define L_xxxxxy             L(37)
#define L_xxxxxz             L(38)
#define L_xxxxyy             L(39)
#define L_xxxxyz             L(40)
#define L_xxxyyy             L(41)
#define L_xxxyyz             L(42)
#define L_xxyyyy             L(43)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define L_xyyyyz             L(46)
#define L_yyyyyy             L(47)
#define L_yyyyyz             L(48)
    v0       = L_xxz*z
    v12      = L_xxyyy + L_xxyyyz*z
    v16      = L_xxxxx + L_xxxxxy*y + L_xxxxxz*z
    v18      = 2.0d0*z
    v21      = 6.0d0*z
    v27      = 2.0d0*y
    v28      = L_xxxxy + L_xxxxyz*z
    v30      = 0.166666666666667d0*x
    v32      = L_xxxyy + L_xxxyyz*z
    v33      = 3.0d0*y
    v36      = L_xyz*z
    v41      = L_xyyyy + L_xyyyyz*z
    v43      = L_xxxxyy*y + v28
    v50      = L_xz*z
    v66      = 0.0416666666666667d0*x
    v85      = L_yyz*z
    v90      = L_yyyyy + L_yyyyyz*z
    v93      = 0.166666666666667d0*y
    v95      = L_yz*z
    v103     = 0.0416666666666667d0*y
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    v68      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v105     = L_yzz*z
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
    v75      = L_xxxxz + L_xxxxyz*y + L_xxxxzz*z
    L_xxxyzz = -(L_xxxxxy + L_xxxyyy)
    v80      = L_xxxyz + L_xxxyzz*z
    L_xxxzzz = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz = -(L_xxxxyy + L_xxyyyy)
    v82      = L_xxyyz + L_xxyyzz*z
    L_xxyzzz = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz = -(L_xxxyyy + L_xyyyyy)
    v73      = L_xyyyz + L_xyyyzz*z
    L_xyyzzz = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz = -(L_xxyyyy + L_yyyyyy)
    v109     = L_yyyyz + L_yyyyzz*z
    L_yyyzzz = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz = -(L_xxzzzz + L_yyzzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v25      = a2
    v26      = 0.25d0*v25
    v65      = 0.0833333333333333d0*v25
    a3       = a1*a2
    v14      = a3
    v15      = 0.166666666666667d0*v14
    v64      = 0.0833333333333333d0*v14
    a4       = a2*a2
    v1       = a4
    v2       = 0.0416666666666667d0*v1
    a5       = a2*a3
    v51      = 0.00833333333333333d0*a5
    a6       = a3*a3
    b2       = b1*b1
    v17      = b2
    v31      = 3.0d0*v17
    v91      = 0.25d0*v17
    v102     = 0.0833333333333333d0*v17
    b3       = b1*b2
    v11      = b3
    v13      = v11*v12
    v42      = v11*v41
    v89      = 0.166666666666667d0*v11
    v101     = 0.0833333333333333d0*v11
    v74      = v11*v73
    b4       = b2*b2
    v3       = b4
    v4       = L_xxyyyy*v3
    v37      = L_xyyyyy*v3
    v59      = 0.0416666666666667d0*v3
    v69      = L_xyyyyz*v3
    b5       = b2*b3
    v52      = b5
    v53      = L_xyyyyy*v52
    v96      = 0.00833333333333333d0*v52
    b6       = b3*b3
    c2       = c1*c1
    v5       = c2
    v22      = 3.0d0*v5
    v112     = 0.5d0*v5
    v54      = L_xzz*v5
    v97      = L_yzz*v5
    v6       = L_xxzz*v5
    v38      = L_xyzz*v5
    v70      = L_xzzz*v5
    v86      = L_yyzz*v5
    v106     = L_yzzz*v5
    v29      = 2.0d0*L_xxxx + L_xxxxyy*v17 + L_xxxxz*v18 + L_xxxxzz*v5 + v27*v28
    v34      = 2.0d0*L_xxxy + L_xxxyz*v18 + L_xxxyzz*v5
    v48      = v34 + L_xxxyyy*v17 + v27*v32
    v81      = L_xxxyyz*v17 + 2.0d0*L_xxxz + L_xxxzz*v18 + L_xxxzzz*v5 + v27*v80
    v19      = 2.0d0*L_xxyy + L_xxyyz*v18 + L_xxyyzz*v5
    v20      = v17*v19
    v83      = 2.0d0*L_xxyz + L_xxyzz*v18 + L_xxyzzz*v5
    v44      = 2.0d0*L_xyyy + L_xyyyz*v18 + L_xyyyzz*v5
    v45      = v17*v44
    v60      = v11*v44
    v76      = 2.0d0*L_xyyz + L_xyyzz*v18 + L_xyyzzz*v5
    v77      = v17*v76
    v92      = 2.0d0*L_yyyy + L_yyyyz*v18 + L_yyyyzz*v5
    v110     = 2.0d0*L_yyyz + L_yyyzz*v18 + L_yyyzzz*v5
    h        = v17 + v25 + v5
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
    v7       = c3
    v113     = 0.166666666666667d0*v7
    v55      = L_xzzz*v7
    v98      = L_yzzz*v7
    v8       = L_xxzzz*v7
    v39      = L_xyzzz*v7
    v71      = L_xzzzz*v7
    v87      = L_yyzzz*v7
    v107     = L_yzzzz*v7
    v35      = 6.0d0*L_xxx + L_xxxyyy*v11 + L_xxxz*v21 + L_xxxzz*v22 + L_xxxzzz*v7 + &
      v31*v32 + v33*v34
    v23      = 6.0d0*L_xxy + L_xxyz*v21 + L_xxyzz*v22 + L_xxyzzz*v7
    v24      = v23*y
    v49      = v23 + L_xxyyyy*v11 + v12*v31 + v19*v33
    v84      = L_xxyyyz*v11 + 6.0d0*L_xxz + L_xxzz*v21 + L_xxzzz*v22 + L_xxzzzz*v7 + &
      v31*v82 + v33*v83
    v46      = 6.0d0*L_xyy + L_xyyz*v21 + L_xyyzz*v22 + L_xyyzzz*v7
    v47      = v46*y
    v61      = v17*v46
    v78      = 6.0d0*L_xyz + L_xyzz*v21 + L_xyzzz*v22 + L_xyzzzz*v7
    v79      = v78*y
    v94      = 6.0d0*L_yyy + L_yyyz*v21 + L_yyyzz*v22 + L_yyyzzz*v7
    v111     = 6.0d0*L_yyz + L_yyzz*v21 + L_yyzzz*v22 + L_yyzzzz*v7
    c4       = c2*c2
    v9       = c4
    v114     = 0.0416666666666667d0*v9
    v56      = L_xzzzz*v9
    v99      = L_yzzzz*v9
    v10      = L_xxzzzz*v9
    v67      = v10 + v4 + 6.0d0*v20 + 12.0d0*v6 + 2.0d0*(12.0d0*L_xx + 12.0d0*v0 + &
      2.0d0*v13 + 2.0d0*v24 + 2.0d0*v8)
    Phi_xx   = 0.0416666666666667d0*(v10 + 6.0d0*v20 + v4 + 12.0d0*v6 + 4.0d0*(v13 + &
      v24 + v8)) + L_xx + L_xxxxxx*v2 + v0 + v15*v16 + v26*v29 + v30* &
      v35
    v40      = L_xyzzzz*v9
    v62      = v40 + 12.0d0*v38 + 4.0d0*(6.0d0*L_xy + 6.0d0*v36 + v39)
    v63      = v62*y
    Phi_xy   = 0.0416666666666667d0*(v37 + 12.0d0*v38 + v40 + 6.0d0*v45 + 4.0d0*(v39 + &
      v42 + v47)) + L_xxxxxy*v2 + L_xy + v15*v43 + v26*v48 + v30*v49 + &
      v36
    v72      = L_xzzzzz*v9
    Phi_xz   = 0.0416666666666667d0*(v69 + 12.0d0*v70 + v72 + 6.0d0*v77 + 4.0d0*(v71 + &
      v74 + v79)) + L_xxxxxz*v2 + L_xz + v15*v75 + v26*v81 + v30*v84 + &
      v68
    v88      = L_yyzzzz*v9
    v104     = v88 + 12.0d0*v86 + 4.0d0*(6.0d0*L_yy + 6.0d0*v85 + v87)
    Phi_yy   = 0.0416666666666667d0*(12.0d0*v86 + 4.0d0*v87 + v88) + L_xxxxyy*v2 + L_yy &
      + L_yyyyyy*v59 + v15*(L_xxxyyy*y + v32) + v26*(L_xxyyyy*v17 + v12 &
      *v27 + v19) + v30*(L_xyyyyy*v11 + v31*v41 + v33*v44 + v46) + v85 &
      + v89*v90 + v91*v92 + v93*v94
    Phi_zz   = -(Phi_xx + Phi_yy)
    v108     = L_yzzzzz*v9
    Phi_yz   = 0.0416666666666667d0*(12.0d0*v106 + 4.0d0*v107 + v108) + L_xxxxyz*v2 + &
      L_yyyyyz*v59 + L_yz + v105 + v109*v89 + v110*v91 + v111*v93 + v15 &
      *(L_xxxyyz*y + v80) + v26*(L_xxyyyz*v17 + v27*v82 + v83) + v30*( &
      L_xyyyyz*v11 + v31*v73 + v33*v76 + v78)
    c5       = c2*c3
    v57      = c5
    v115     = 0.00833333333333333d0*v57
    v58      = L_xzzzzz*v57
    Phi_x    = 0.00833333333333333d0*(v53 + 60.0d0*v54 + 20.0d0*v55 + v58 + 5.0d0*(v56 &
      + v63) + 10.0d0*(v60 + v61)) + L_x + L_xxxxxx*v51 + v16*v2 + v29* &
      v64 + v35*v65 + v41*v59 + v50 + v66*v67
    v100     = L_yzzzzz*v57
    Phi_y    = 0.00833333333333333d0*(v100 + 60.0d0*v97 + 20.0d0*v98 + 5.0d0*v99) + &
      L_xxxxxy*v51 + L_y + L_yyyyyy*v96 + v101*v92 + v102*v94 + v103* &
      v104 + v2*v43 + v48*v64 + v49*v65 + v59*v90 + v66*(v37 + 4.0d0* &
      v42 + 6.0d0*v45 + 4.0d0*v47 + v62) + v95
    Phi_z    = L_z + L_xxxxxz*v51 + L_yyyyyz*v96 + L_zz*z + L_zzz*v112 + L_zzzz*v113 + &
      L_zzzzz*v114 + L_zzzzzz*v115 + v101*v110 + v102*v111 + v103*( &
      24.0d0*L_yz + 24.0d0*v105 + 12.0d0*v106 + 4.0d0*v107 + v108) + &
      v109*v59 + v2*v75 + v64*v81 + v65*v84 + v66*(24.0d0*L_xz + 24.0d0 &
      *v68 + v69 + 12.0d0*v70 + 4.0d0*v71 + v72 + 4.0d0*v74 + 6.0d0*v77 &
      + 4.0d0*v79)
    c6       = c3*c3
    Phi_0    = 0.00138888888888889d0*(L_xxxxxx*a6 + L_yyyyyy*b6 + L_zzzzzz*c6 + 20.0d0* &
      (v11*v94 + v14*v35) + 6.0d0*(x*(120.0d0*L_x + 5.0d0*v3*v41 + &
      120.0d0*v50 + v53 + 60.0d0*v54 + 20.0d0*v55 + 5.0d0*v56 + v58 + &
      10.0d0*v60 + 10.0d0*v61 + 5.0d0*v63) + y*(120.0d0*L_y + v100 + &
      120.0d0*v95 + 60.0d0*v97 + 20.0d0*v98 + 5.0d0*v99)) + 15.0d0*(v1* &
      v29 + v104*v17 + v25*v67 + v3*v92)) + L_0 + L_z*z + L_zz*v112 + &
      L_zzz*v113 + L_zzzz*v114 + L_zzzzz*v115 + v16*v51 + v90*v96
#undef  Phi_0               
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
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
#undef  Phi_xz              
#undef  L_xz                
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
    
! OPS  1206*ADD + 1307*MUL + 83*NEG + 258*SUB = 2854  (5174 before optimization)
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
                v18, v180, v181, v182, v183, v184, v185, v186, v187, v188,&
                v189, v19, v190, v191, v192, v193, v194, v195, v196, v197,&
                v198, v199, v2, v20, v200, v201, v202, v203, v204, v205, v206,&
                v207, v208, v209, v21, v210, v211, v212, v213, v214, v215,&
                v216, v217, v218, v219, v22, v220, v221, v222, v223, v224,&
                v225, v226, v227, v228, v229, v23, v230, v231, v232, v233,&
                v234, v235, v236, v237, v238, v239, v24, v240, v241, v242,&
                v243, v244, v245, v246, v247, v248, v249, v25, v250, v251,&
                v252, v253, v254, v255, v256, v257, v258, v259, v26, v260,&
                v261, v262, v263, v264, v265, v266, v267, v268, v269, v27,&
                v270, v271, v272, v273, v274, v275, v276, v277, v278, v279,&
                v28, v280, v281, v282, v283, v284, v285, v286, v287, v288,&
                v289, v29, v290, v291, v292, v293, v294, v295, v296, v297,&
                v298, v299, v3, v30, v300, v301, v302, v303, v304, v305, v306,&
                v307, v308, v309, v31, v310, v311, v312, v313, v314, v315,&
                v316, v317, v318, v319, v32, v320, v321, v322, v323, v324,&
                v325, v326, v327, v328, v329, v33, v330, v331, v332, v333,&
                v334, v335, v336, v337, v338, v339, v34, v340, v341, v342,&
                v343, v344, v345, v346, v347, v348, v349, v35, v350, v351,&
                v352, v353, v354, v355, v356, v357, v358, v359, v36, v360,&
                v361, v362, v363, v364, v365, v366, v367, v368, v369, v37,&
                v370, v371, v372, v373, v374, v375, v376, v377, v378, v379,&
                v38, v380, v381, v382, v383, v384, v385, v386, v387, v388,&
                v389, v39, v390, v391, v392, v393, v394, v395, v396, v397,&
                v398, v399, v4, v40, v400, v401, v402, v403, v404, v405, v406,&
                v407, v408, v409, v41, v410, v411, v412, v413, v414, v415,&
                v416, v417, v418, v419, v42, v420, v421, v422, v423, v424,&
                v425, v426, v427, v428, v429, v43, v430, v431, v432, v433,&
                v434, v435, v436, v437, v438, v439, v44, v440, v441, v442,&
                v443, v444, v445, v446, v447, v448, v449, v45, v450, v451,&
                v452, v453, v454, v455, v456, v457, v458, v459, v46, v460,&
                v461, v462, v463, v464, v465, v466, v467, v468, v469, v47,&
                v470, v471, v472, v473, v474, v475, v476, v477, v478, v479,&
                v48, v480, v481, v482, v483, v484, v485, v486, v487, v488,&
                v489, v49, v490, v491, v492, v493, v494, v495, v496, v497,&
                v498, v499, v5, v50, v500, v501, v502, v503, v504, v505, v506,&
                v507, v508, v509, v51, v510, v511, v512, v513, v514, v515,&
                v516, v517, v518, v519, v52, v520, v521, v522, v523, v524,&
                v525, v526, v527, v528, v529, v53, v530, v531, v532, v533,&
                v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64,&
                v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75,&
                v76, v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86,&
                v87, v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97,&
                v98, v99, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy,&
                S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz,&
                S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz,&
                S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz,&
                S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy,&
                S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz,&
                S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy,&
                S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz, S_xxxxxx,&
                S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy, S_xxxyyz,&
                S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy, S_yyyyyz
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
#define Ms_xxxxxx            Ms(36)
#define M_xxxxxx             M(36)
#define Ms_xxxxxy            Ms(37)
#define M_xxxxxy             M(37)
#define Ms_xxxxxz            Ms(38)
#define M_xxxxxz             M(38)
#define Ms_xxxxyy            Ms(39)
#define M_xxxxyy             M(39)
#define Ms_xxxxyz            Ms(40)
#define M_xxxxyz             M(40)
#define M_xxxyyy             M(41)
#define Ms_xxxyyy            Ms(41)
#define Ms_xxxyyz            Ms(42)
#define M_xxxyyz             M(42)
#define Ms_xxyyyy            Ms(43)
#define M_xxyyyy             M(43)
#define M_xxyyyz             M(44)
#define Ms_xxyyyz            Ms(44)
#define Ms_xyyyyy            Ms(45)
#define M_xyyyyy             M(45)
#define Ms_xyyyyz            Ms(46)
#define M_xyyyyz             M(46)
#define Ms_yyyyyy            Ms(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define Ms_yyyyyz            Ms(48)
    v0        = x*y
    v1        = x*z
    v2        = y*z
    v3        = v0*z
    v9        = M_x*x
    v10       = M_y*y
    v11       = -0.666666666666667d0*M_z*z
    v15       = M_xx*x
    v16       = M_xy*y
    v17       = M_xz*z
    v23       = M_xy*x
    v25       = M_yy*y
    v26       = M_yz*z
    v29       = M_xx*z
    v30       = M_xz*x
    v32       = M_yy*z
    v33       = M_yz*y
    v47       = M_xxx*x
    v48       = 1.71428571428571d0*y
    v49       = M_xxy*v48
    v50       = M_xxz*z
    v52       = 1.71428571428571d0*M_y
    v59       = 0.857142857142857d0*M_xyz
    v64       = M_xxy*x
    v67       = M_xyy*y
    v71       = 3.0d0*M_xx
    v72       = M_xxx*z
    v73       = M_xxz*x
    v75       = M_xyy*z
    v76       = 3.0d0*M_xz
    v84       = 1.71428571428571d0*M_x
    v86       = 1.71428571428571d0*x
    v87       = M_xyy*v86
    v89       = M_yyy*y
    v90       = M_yyz*z
    v94       = M_xxy*z
    v98       = M_yyy*z
    v99       = M_yyz*y
    v107      = 3.0d0*M_yz
    v118      = M_xxxx*x
    v119      = M_xxxy*y
    v120      = M_xxxz*z
    v122      = M_xxyy*x
    v133      = M_yyyy*x
    v148      = M_xxxx*y
    v149      = M_xxxy*x
    v152      = M_xxyy*y
    v153      = M_xxyz*z
    v167      = M_yyyy*y
    v172      = M_xxyy*z
    v185      = M_xxxx*z
    v186      = M_xxxz*x
    v188      = M_xxyz*y
    v198      = M_yyyy*z
    v208      = M_xyyy*y
    v209      = M_xyyz*z
    v217      = M_xxxy*z
    v219      = M_xxyz*x
    v223      = M_xyyy*z
    v224      = M_xyyz*y
    v225      = 3.0d0*M_xyz
    v235      = M_xyyy*x
    v236      = M_yyyz*z
    v239      = M_xyyz*x
    v241      = M_yyyz*y
    v247      = M_xxyyz*z
    v271      = M_xxxxx*x
    v272      = M_xxxxy*y
    v273      = M_xxxxz*z
    v275      = M_xxxyy*x
    v282      = M_xxyyy*y
    v291      = M_xyyyy*x
    v308      = M_yyyyy*y
    v309      = M_yyyyz*z
    v345      = M_xxxxx*y
    v346      = M_xxxxy*x
    v349      = M_xxxyy*y
    v350      = 1.81818181818182d0*M_xxxyz
    v353      = M_xxyyy*x
    v361      = M_xyyyy*y
    v373      = M_yyyyy*x
    v387      = M_xxxxx*z
    v388      = M_xxxxz*x
    v390      = M_xxxyy*z
    v391      = v350*y
    v398      = M_xxyyz*x
    v407      = M_xyyyy*z
    v411      = 5.45454545454545d0*M_xyz
    v424      = M_yyyyz*x
    v468      = M_xxxxy*z
    v469      = M_xxxxz*y
    v471      = M_xxxyz*x
    v476      = M_xxyyy*z
    v477      = M_xxyyz*y
    v496      = M_yyyyy*z
    v497      = M_yyyyz*y
    v509      = 0.545454545454545d0*z
    v512      = 0.545454545454545d0*M_z
    v516      = M_xyyyz*y
    v524      = 1.81818181818182d0*M_xyyyz
    v525      = v524*x
    Ms_0      = Ms_0 + (M_0)
    Ms_x      = Ms_x + (M_0*x + M_x)
    Ms_y      = Ms_y + (M_0*y + M_y)
    Ms_z      = Ms_z + (M_0*z + M_z)
    M_zz      = -(M_xx + M_yy)
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    M_xxzz    = -(M_xxxx + M_xxyy)
    v124      = M_xxzz*x
    v139      = M_xxzz*y
    v173      = M_xxzz*z
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v134      = M_yyzz*x
    v142      = M_yyzz*y
    v176      = M_yyzz*z
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    M_xxxzz   = -(M_xxxxx + M_xxxyy)
    v277      = M_xxxzz*x
    v322      = M_xxxzz*y
    v394      = M_xxxzz*z
    M_xxyzz   = -(M_xxxxy + M_xxyyy)
    v284      = M_xxyzz*y
    v325      = M_xxyzz*x
    v450      = M_xxyzz*z
    M_xxzzz   = -(M_xxxxz + M_xxyyz)
    v249      = M_xxzzz*z
    v402      = M_xxzzz*x
    v452      = M_xxzzz*y
    M_xyyzz   = -(M_xxxyy + M_xyyyy)
    v528      = M_xxxzz + M_xyyzz
    v292      = M_xyyzz*x
    v331      = M_xyyzz*y
    v410      = M_xyyzz*z
    M_xyzzz   = -(M_xxxyz + M_xyyyz)
    M_xzzzz   = -v528
    M_yyyzz   = -(M_xxyyy + M_yyyyy)
    v529      = M_xxyzz + M_yyyzz
    v310      = M_yyyzz*y
    v335      = M_yyyzz*x
    v455      = M_yyyzz*z
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v252      = M_yyzzz*z
    v428      = M_yyzzz*x
    v457      = M_yyzzz*y
    M_yzzzz   = -v529
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    v530      = M_xxxzzz + M_xyyzzz
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -v530
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v531      = M_xxyzzz + M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v533      = M_xxzzzz + M_yyzzzz
    M_yzzzzz  = -v531
    M_zzzzzz  = -v533
    S_0       = 1
    S_x       = x
    S_y       = y
    S_z       = z
    S_xy      = v0
    v18       = M_y*S_xy
    v22       = M_x*S_xy
    v42       = M_xy*S_xy
    v63       = M_xx*S_xy
    v69       = M_yy*S_xy
    v79       = M_yz*S_xy
    v96       = M_xz*S_xy
    v121      = M_xxy*S_xy
    v147      = M_xxx*S_xy
    v157      = M_xyy*S_xy
    v175      = M_xyz*S_xy
    v212      = M_yyy*S_xy
    v220      = M_xxz*S_xy
    v229      = M_yyz*S_xy
    v274      = M_xxxy*S_xy
    v324      = M_xxyy*S_xy
    v326      = M_xxzz*S_xy
    v336      = M_yyzz*S_xy
    v344      = M_xxxx*S_xy
    v372      = M_yyyy*S_xy
    v399      = M_xxyz*S_xy
    v442      = M_xyyy*S_xy
    v472      = M_xxxz*S_xy
    v485      = M_xyyz*S_xy
    v518      = M_yyyz*S_xy
    Ms_xy     = Ms_xy + (M_xy + M_0*S_xy + M_x*y + M_y*x)
    S_xz      = v1
    v19       = M_z*S_xz
    v28       = M_x*S_xz
    v51       = M_xz*S_xz
    v78       = M_yy*S_xz
    v95       = M_xy*S_xz
    v123      = M_xxz*S_xz
    v158      = M_xyz*S_xz
    v184      = M_xxx*S_xz
    v191      = M_xyy*S_xz
    v213      = M_yyz*S_xz
    v218      = 3.0d0*S_xz
    v228      = M_yyy*S_xz
    v276      = M_xxxz*S_xz
    v354      = M_xxyz*S_xz
    v386      = M_xxxx*S_xz
    v397      = M_xxyy*S_xz
    v401      = M_xxzz*S_xz
    v423      = M_yyyy*S_xz
    v427      = M_yyzz*S_xz
    v440      = 0.242424242424242d0*v276
    v443      = M_xyyz*S_xz
    v470      = M_xxxy*S_xz
    v484      = M_xyyy*S_xz
    v511      = M_yyyz*S_xz
    Ms_xz     = Ms_xz + (M_xz + M_0*S_xz + M_x*z + M_z*x)
    S_yz      = v2
    v27       = M_z*S_yz
    v31       = M_y*S_yz
    v55       = M_yz*S_yz
    v74       = M_xy*S_yz
    v93       = M_xx*S_yz
    v106      = 3.0d0*S_yz
    v128      = M_xyz*S_yz
    v154      = M_xxz*S_yz
    v168      = M_yyz*S_yz
    v187      = M_xxy*S_yz
    v197      = M_yyy*S_yz
    v216      = M_xxx*S_yz
    v283      = M_xxyz*S_yz
    v351      = M_xxxz*S_yz
    v362      = M_xyyz*S_yz
    v389      = M_xxxy*S_yz
    v406      = M_xyyy*S_yz
    v446      = M_yyyz*S_yz
    v447      = 0.242424242424242d0*v446
    v451      = M_xxzz*S_yz
    v456      = M_yyzz*S_yz
    v467      = M_xxxx*S_yz
    v475      = M_xxyy*S_yz
    v495      = M_yyyy*S_yz
    Ms_yz     = Ms_yz + (M_yz + M_0*S_yz + M_y*z + M_z*y)
    S_xyz     = v3
    v60       = 0.857142857142857d0*S_xyz
    v61       = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v60 + v59*z)
    v135      = M_yz*S_xyz
    v159      = M_xz*S_xyz
    v174      = M_xy*S_xyz
    v250      = M_xyz*S_xyz
    v355      = M_xxz*S_xyz
    v374      = M_yyz*S_xyz
    v395      = 5.45454545454545d0*S_xyz
    v396      = M_xxy*v395
    v422      = M_yyy*S_xyz
    v466      = M_xxx*S_xyz
    v523      = M_xyy*v395
    Ms_xyz    = Ms_xyz + (M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v4        = a2
    a3        = a1*a2
    a4        = a2*a2
    v37       = a4
    a5        = a2*a3
    a6        = a3*a3
    b2        = b1*b1
    v5        = b2
    v83       = v4*v5
    b3        = b1*b2
    b4        = b2*b2
    v104      = b4
    b5        = b2*b3
    b6        = b3*b3
    c2        = c1*c1
    h         = c2 + v4 + v5
    v6        = 0.333333333333333d0*h
    v7        = -v6
    v8        = v4 + v7
    v12       = v5 + v7
    v13       = -0.6d0*h
    v20       = -0.2d0*h
    v21       = v20 + v4
    v36       = v20 + v5
    v38       = h*h
    v39       = 0.0857142857142857d0*v38
    v40       = h*v4
    v57       = -0.428571428571429d0*h
    v58       = v4 + v57
    v82       = 0.142857142857143d0*h
    v92       = -v82
    v103      = v5 + v57
    v105      = h*v5
    v108      = 0.238095238095238d0*v38
    v137      = 0.0476190476190476d0*v38
    v138      = 0.333333333333333d0*(-2.0d0*v40) + v137 + v37
    v205      = -0.111111111111111d0*v40
    v233      = 0.111111111111111d0*(-v105) + v83
    v242      = 0.333333333333333d0*(-2.0d0*v105) + v104 + v137
    v243      = h*h*h
    v244      = -0.0216450216450216d0*v243
    v245      = h*v37
    v246      = v38*v4
    v317      = 0.151515151515152d0*v38
    v318      = 0.0909090909090909d0*(-10.0d0*v40) + v317 + v37
    v436      = 0.545454545454545d0*v40
    v437      = -0.00432900432900433d0*(v243 + 231.0d0*v436*v5)
    v438      = 0.0303030303030303d0*v38
    v507      = -0.272727272727273d0*v40
    v508      = -0.272727272727273d0*v105
    v513      = v438 + v83
    v519      = h*v104
    v520      = v38*v5
    v527      = 0.0909090909090909d0*(-10.0d0*v105) + v104 + v317
    S_xx      = v8
    v14       = M_x*S_xx
    v34       = M_z*S_xx
    v43       = M_yy*S_xx
    v46       = M_xx*S_xx
    v65       = M_xy*S_xx
    v100      = M_yz*S_xx
    v116      = M_xxx*S_xx
    v126      = M_xyy*S_xx
    v150      = M_xxy*S_xx
    v165      = M_yyy*S_xx
    v189      = M_xxz*S_xx
    v199      = M_yyz*S_xx
    v269      = M_xxxx*S_xx
    v280      = M_xxyy*S_xx
    v286      = M_xxzz*S_xx
    v306      = M_yyyy*S_xx
    v312      = M_yyzz*S_xx
    v347      = M_xxxy*S_xx
    v359      = M_xyyy*S_xx
    v392      = M_xxxz*S_xx
    v408      = M_xyyz*S_xx
    v478      = M_xxyz*S_xx
    v498      = M_yyyz*S_xx
    Ms_xx     = Ms_xx + (0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11)
    S_yy      = v12
    v24       = M_y*S_yy
    v35       = M_z*S_yy
    v41       = M_xx*S_yy
    v44       = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v42 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v41 + 4.0d0*v43))
    v54       = M_yy*S_yy
    v66       = M_xy*S_yy
    v77       = M_xz*S_yy
    v117      = M_xxx*S_yy
    v127      = M_xyy*S_yy
    v151      = M_xxy*S_yy
    v166      = M_yyy*S_yy
    v190      = M_xxz*S_yy
    v200      = M_yyz*S_yy
    v270      = M_xxxx*S_yy
    v281      = M_xxyy*S_yy
    v287      = M_xxzz*S_yy
    v307      = M_yyyy*S_yy
    v313      = M_yyzz*S_yy
    v348      = M_xxxy*S_yy
    v360      = M_xyyy*S_yy
    v393      = M_xxxz*S_yy
    v409      = M_xyyz*S_yy
    v479      = M_xxyz*S_yy
    v499      = M_yyyz*S_yy
    Ms_yy     = Ms_yy + (0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11)
    S_zz      = -(S_xx + S_yy)
    S_xxx     = x*(v13 + v4)
    v45       = M_x*S_xxx
    v80       = M_z*S_xxx
    v114      = M_xx*S_xxx
    v131      = M_yy*S_xxx
    v155      = M_xy*S_xxx
    v192      = M_xz*S_xxx
    v230      = M_yz*S_xxx
    v267      = M_xxx*S_xxx
    v289      = M_xyy*S_xxx
    v334      = M_yyy*S_xxx
    v352      = M_xxy*S_xxx
    v425      = M_yyz*S_xxx
    v486      = M_xyz*S_xxx
    Ms_xxx    = Ms_xxx + (M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19)))
    S_xxy     = v21*y
    v53       = S_xxy*v52
    v62       = M_x*S_xxy
    v101      = M_z*S_xxy
    v125      = M_xy*S_xxy
    v145      = M_xx*S_xxy
    v163      = M_yy*S_xxy
    v201      = M_yz*S_xxy
    v278      = M_xxy*S_xxy
    v304      = M_yyy*S_xxy
    v330      = M_xyy*S_xxy
    v343      = M_xxx*S_xxy
    v412      = S_xxy*v411
    v480      = M_xxz*S_xxy
    v500      = M_yyz*S_xxy
    Ms_xxy    = Ms_xxy + (M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v22 + 4.0d0* &
      v23 - v24 - v25 - v26 - v27)))
    S_xxz     = v21*z
    v56       = M_z*S_xxz
    v70       = M_x*S_xxz
    v129      = M_xz*S_xxz
    v169      = M_yz*S_xxz
    v182      = M_xx*S_xxz
    v195      = M_yy*S_xxz
    v221      = M_xy*S_xxz
    v251      = M_yyz*S_xxz
    v285      = M_xxz*S_xxz
    v363      = M_xyz*S_xxz
    v404      = M_xyy*S_xxz
    v473      = M_xxy*S_xxz
    v494      = M_yyy*S_xxz
    Ms_xxz    = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v28 + v30) + 7.0d0*(v29 + v34) + 2.0d0 &
      *(-v31 + v32 - v33 + v35)))
    S_xyy     = v36*x
    v68       = M_y*S_xyy
    v81       = M_z*S_xyy
    v85       = S_xyy*v84
    v115      = M_xx*S_xyy
    v132      = M_yy*S_xyy
    v156      = M_xy*S_xyy
    v193      = M_xz*S_xyy
    v268      = M_xxx*S_xyy
    v290      = M_xyy*S_xyy
    v323      = M_xxy*S_xyy
    v371      = M_yyy*S_xyy
    v400      = M_xxz*S_xyy
    v426      = M_yyz*S_xyy
    v526      = S_xyy*v411
    Ms_xyy    = Ms_xyy + (M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19)))
    S_xzz     = -(S_xxx + S_xyy)
    S_yyy     = y*(v13 + v5)
    v88       = M_y*S_yyy
    v102      = M_z*S_yyy
    v146      = M_xx*S_yyy
    v164      = M_yy*S_yyy
    v202      = M_yz*S_yyy
    v207      = M_xy*S_yyy
    v226      = M_xz*S_yyy
    v279      = M_xxy*S_yyy
    v305      = M_yyy*S_yyy
    v321      = M_xxx*S_yyy
    v358      = M_xyy*S_yyy
    v413      = M_xyz*S_yyy
    v481      = M_xxz*S_yyy
    Ms_yyy    = Ms_yyy + (M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v22 - 2.0d0*v23 + 3.0d0*v24 + &
      3.0d0*v25 - 2.0d0*v26 - 2.0d0*v27)))
    S_yyz     = v36*z
    v91       = M_z*S_yyz
    v97       = M_y*S_yyz
    v170      = M_yz*S_yyz
    v183      = M_xx*S_yyz
    v196      = M_yy*S_yyz
    v210      = M_xz*S_yyz
    v222      = M_xy*S_yyz
    v248      = M_xxz*S_yyz
    v311      = M_yyz*S_yyz
    v364      = M_xyz*S_yyz
    v385      = M_xxx*S_yyz
    v405      = M_xyy*S_yyz
    v474      = M_xxy*S_yyz
    Ms_yyz    = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v31 + v33) + 7.0d0*(v32 + v35) + 2.0d0 &
      *(-v28 + v29 - v30 + v34)))
    S_yzz     = -(S_xxy + S_yyy)
    S_zzz     = -(S_xxz + S_yyz)
    S_xxxx    = 0.142857142857143d0*(-6.0d0*v40) + v37 + v39
    v109      = M_x*S_xxxx
    v160      = M_y*S_xxxx
    v203      = M_z*S_xxxx
    v262      = M_xx*S_xxxx
    v299      = M_yy*S_xxxx
    v356      = M_xy*S_xxxx
    v414      = M_xz*S_xxxx
    v501      = M_yz*S_xxxx
    Ms_xxxx   = Ms_xxxx + (M_0*S_xxxx + v44 - v49 - v53 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v46 - 96.0d0*v51 + 80.0d0*(v45 + v47) - &
      60.0d0*(v50 + v56) + 24.0d0*(v54 + v55)))
    S_xxxy    = v0*v58
    v130      = M_y*S_xxxy
    v144      = M_x*S_xxxy
    v231      = M_z*S_xxxy
    v288      = M_xy*S_xxxy
    v341      = M_xx*S_xxxy
    v369      = M_yy*S_xxxy
    v429      = M_yz*S_xxxy
    v487      = M_xz*S_xxxy
    Ms_xxxy   = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v61 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 - 2.0d0*v66 &
      - 2.0d0*v67 - 2.0d0*v68 - 2.0d0*v69)))
    S_xxxz    = v1*v58
    v136      = M_z*S_xxxz
    v181      = M_x*S_xxxz
    v293      = M_xz*S_xxxz
    v375      = M_yz*S_xxxz
    v383      = M_xx*S_xxxz
    v420      = M_yy*S_xxxz
    v444      = 0.242424242424242d0*v293
    v482      = M_xy*S_xxxz
    Ms_xxxz   = Ms_xxxz + (0.142857142857143d0*(15.0d0*(v70 + v73) + 13.0d0*(v72 + v80) + 6.0d0*( &
      -v74 + v75 + v77 + v78 - v79 + v81)) + M_0*S_xxxz + M_xxxz - M_y* &
      v60 + S_xx*v76 + S_xz*v71 - v59*y)
    S_xxyy    = 0.0285714285714286d0*v38 - v4*v82 - v5*v82 + v83
    v110      = M_x*S_xxyy
    v161      = M_y*S_xxyy
    v177      = M_z*S_xxyy
    v263      = M_xx*S_xxyy
    v300      = M_yy*S_xxyy
    v327      = M_xy*S_xxyy
    v415      = M_xz*S_xxyy
    v502      = M_yz*S_xxyy
    Ms_xxyy   = Ms_xxyy + (0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v42 + 39.0d0*(v41 + v43) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v45 + 12.0d0*v46 + &
      10.0d0*v47 + 10.0d0*v50 + 12.0d0*v51 + 12.0d0*v54 + 12.0d0*v55 + &
      10.0d0*v56 + 10.0d0*v88 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91)) &
      + M_0*S_xxyy + v49 + v53 + v85 + v87)
    S_xxyz    = v2*(v4 + v92)
    v171      = M_z*S_xxyz
    v194      = M_y*S_xxyz
    v215      = M_x*S_xxyz
    v314      = M_yz*S_xxyz
    v365      = M_xz*S_xxyz
    v403      = M_xy*S_xxyz
    v464      = M_xx*S_xxyz
    v492      = M_yy*S_xxyz
    Ms_xxyz   = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v95 + v96) + 9.0d0*(v100 + v101 + v93 + v94 &
      ) + 2.0d0*(v102 - v97 + v98 - v99)) + M_0*S_xxyz + M_xxyz + M_xxz &
      *y + M_xyz*v86 + M_y*S_xxz + S_xyz*v84)
    S_xxzz    = -(S_xxxx + S_xxyy)
    v111      = M_x*S_xxzz
    v140      = M_y*S_xxzz
    v178      = M_z*S_xxzz
    v264      = M_xx*S_xxzz
    v301      = M_yy*S_xxzz
    v328      = M_xy*S_xxzz
    v416      = M_xz*S_xxzz
    v458      = M_yz*S_xxzz
    S_xyyy    = v0*v103
    v211      = M_y*S_xyyy
    v232      = M_z*S_xyyy
    v234      = M_x*S_xyyy
    v342      = M_xx*S_xyyy
    v370      = M_yy*S_xyyy
    v430      = M_yz*S_xyyy
    v441      = M_xy*S_xyyy
    v488      = M_xz*S_xyyy
    Ms_xyyy   = Ms_xyyy + (M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v61 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 + 5.0d0*v66 &
      + 5.0d0*v67 + 5.0d0*v68 + 5.0d0*v69)))
    S_xyyz    = v1*(v5 + v92)
    v214      = M_z*S_xyyz
    v227      = M_y*S_xyyz
    v238      = M_x*S_xyyz
    v376      = M_yz*S_xyyz
    v384      = M_xx*S_xyyz
    v421      = M_yy*S_xyyz
    v445      = M_xz*S_xyyz
    v483      = M_xy*S_xyyz
    Ms_xyyz   = Ms_xyyz + (0.142857142857143d0*(12.0d0*(v74 + v79) + 2.0d0*(-v70 + v72 - v73 + v80 &
      ) + 9.0d0*(v75 + v77 + v78 + v81)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v48 + M_yyz*x + S_xyz*v52)
    S_xyzz    = -(S_xxxy + S_xyyy)
    S_xzzz    = -(S_xxxz + S_xyyz)
    S_yyyy    = 0.142857142857143d0*(-6.0d0*v105) + v104 + v39
    v112      = M_x*S_yyyy
    v162      = M_y*S_yyyy
    v204      = M_z*S_yyyy
    v265      = M_xx*S_yyyy
    v302      = M_yy*S_yyyy
    v357      = M_xy*S_yyyy
    v417      = M_xz*S_yyyy
    v503      = M_yz*S_yyyy
    Ms_yyyy   = Ms_yyyy + (M_0*S_yyyy + v44 - v85 - v87 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v54 - 96.0d0*v55 + 24.0d0*(v46 + v51) + &
      80.0d0*(v88 + v89) - 60.0d0*(v90 + v91)))
    S_yyyz    = v103*v2
    v237      = M_z*S_yyyz
    v240      = M_y*S_yyyz
    v448      = M_yz*S_yyyz
    v449      = 0.242424242424242d0*v448
    v465      = M_xx*S_yyyz
    v493      = M_yy*S_yyyz
    v510      = M_xz*S_yyyz
    v515      = M_xy*S_yyyz
    Ms_yyyz   = Ms_yyyz + (0.142857142857143d0*(13.0d0*(v102 + v98) + 15.0d0*(v97 + v99) + 6.0d0*( &
      v100 + v101 + v93 + v94 - v95 - v96)) + M_0*S_yyyz - M_x*v60 + &
      M_yy*v106 + M_yyyz + S_yy*v107 - v59*x)
    S_yyzz    = -(S_xxyy + S_yyyy)
    v113      = M_x*S_yyzz
    v141      = M_y*S_yyzz
    v143      = -0.0476190476190476d0*(M_yyyyy + v139 + v140 + v141 + v142 + v529)
    v179      = M_z*S_yyzz
    v180      = 0.0476190476190476d0*(18.0d0*(v172 + v177) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v173 + 48.0d0*v174 + 48.0d0*v175 + 5.0d0*v176 + &
      5.0d0*v178 + 5.0d0*v179))
    v206      = -0.0476190476190476d0*(M_xxxxx + v111 + v113 + v124 + v134 + v528)
    v266      = M_xx*S_yyzz
    v303      = M_yy*S_yyzz
    v329      = M_xy*S_yyzz
    v418      = M_xz*S_yyzz
    v459      = M_yz*S_yyzz
    S_yzzz    = -(S_xxyz + S_yyyz)
    S_zzzz    = -(S_xxzz + S_yyzz)
    S_xxxxx   = x*(0.111111111111111d0*(-10.0d0*v40) + v108 + v37)
    v257      = M_x*S_xxxxx
    v366      = M_y*S_xxxxx
    v431      = M_z*S_xxxxx
    Ms_xxxxx  = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v109 + v118) + 330.0d0*(v114 + v116) - 30.0d0*(M_xxxyy + v110 + &
      v122) + 60.0d0*(v115 + v117 + v126 + v131) - 140.0d0*(v119 + v120 &
      + v130 + v136) - 300.0d0*(v121 + v123 + v125 + v129) + 120.0d0*( &
      v127 + v128 + v132 + v135) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v111 + v112 + v113 + v124 + v133 + v134)))
    S_xxxxy   = v138*y
    v294      = M_y*S_xxxxy
    v338      = M_x*S_xxxxy
    v504      = M_z*S_xxxxy
    Ms_xxxxy  = Ms_xxxxy + (M_0*S_xxxxy + v143 + 0.0476190476190476d0*(78.0d0*(v145 + v150) + 4.0d0* &
      (v146 + v165) + 20.0d0*(M_xxxxy + v148 + v160) + 56.0d0*(v144 + &
      v147 + v149 + v155) + 8.0d0*(v164 + v166 + v168 + v170) - (2.0d0* &
      M_xxyyy + 24.0d0*v151 + 30.0d0*v152 + 28.0d0*v153 + 28.0d0*v154 + &
      48.0d0*v156 + 48.0d0*v157 + 48.0d0*v158 + 48.0d0*v159 + 30.0d0* &
      v161 + v162 + 24.0d0*v163 + v167 + 28.0d0*v169 + 28.0d0*v171)))
    S_xxxxz   = v138*z
    v315      = M_z*S_xxxxz
    v378      = M_x*S_xxxxz
    v489      = M_y*S_xxxxz
    Ms_xxxxz  = Ms_xxxxz + (M_0*S_xxxxz + v180 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v181 &
      + v186) + 106.0d0*(v182 + v189) + 4.0d0*(v183 + v199) + 104.0d0*( &
      v184 + v192) + 44.0d0*(v185 + v203) + 32.0d0*(v190 + v195) + &
      48.0d0*(v191 + v193) + 8.0d0*(v196 + v200) - (M_yyyyz + 36.0d0* &
      v187 + 28.0d0*v188 + 28.0d0*v194 + 8.0d0*v197 + 5.0d0*v198 + &
      36.0d0*v201 + 8.0d0*v202 + 5.0d0*v204)))
    S_xxxyy   = x*(-v5*v6 + v137 + v205 + v83)
    v258      = M_x*S_xxxyy
    v367      = M_y*S_xxxyy
    v432      = M_z*S_xxxyy
    Ms_xxxyy  = Ms_xxxyy + (M_0*S_xxxyy + v206 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v109 &
      + v118) + 141.0d0*(v110 + v122) + 159.0d0*(v115 + v126) + 75.0d0* &
      (v117 + v131) + 112.0d0*(v119 + v130) - 14.0d0*(v120 + v136) + &
      276.0d0*(v121 + v125) - 3.0d0*(M_xyyyy + v112 + v133) - 18.0d0*( &
      v114 + v116 + v123 + v129) - 60.0d0*(v127 + v128 + v132 + v135) - &
      42.0d0*(v207 + v208 + v209 + v210 + v211 + v212 + v213 + v214)))
    S_xxxyz   = v3*v8
    v377      = 1.81818181818182d0*S_xxxyz
    v419      = M_y*v377
    v463      = M_x*S_xxxyz
    Ms_xxxyz  = Ms_xxxyz + (0.333333333333333d0*(7.0d0*(v215 + v219 + v220 + v221) + 5.0d0*(v216 + &
      v217 + v230 + v231) + 2.0d0*(-v222 + v223 - v224 + v226 - v227 + &
      v228 - v229 + v232)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy* &
      v218 + M_y*S_xxxz + S_xx*v225 + S_xxy*v76 + S_xyz*v71)
    S_xxxzz   = -(S_xxxxx + S_xxxyy)
    v259      = M_x*S_xxxzz
    v332      = M_y*S_xxxzz
    v433      = M_z*S_xxxzz
    S_xxyyy   = y*(-v4*v6 + v137 + v233)
    v295      = M_y*S_xxyyy
    v339      = M_x*S_xxyyy
    v505      = M_z*S_xxyyy
    Ms_xxyyy  = Ms_xxyyy + (M_0*S_xxyyy + v143 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v146 &
      + v165) + 159.0d0*(v151 + v163) + 141.0d0*(v152 + v161) + 276.0d0 &
      *(v156 + v157) - 17.0d0*(v162 + v167) + 112.0d0*(v234 + v235) - &
      14.0d0*(v236 + v237) - 3.0d0*(M_xxxxy + v148 + v160) - 60.0d0*( &
      v145 + v150 + v158 + v159) - 18.0d0*(v164 + v166 + v168 + v170) - &
      42.0d0*(v144 + v147 + v149 + v153 + v154 + v155 + v169 + v171)))
    S_xxyyz   = z*(0.0158730158730159d0*v38 + v205 + v233)
    v253      = M_z*S_xxyyz
    v379      = M_x*S_xxyyz
    v490      = M_y*S_xxyyz
    Ms_xxyyz  = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v174 + v175) + 6.0d0*(v184 + v192 + v197 + v202) + 9.0d0*(v185 + &
      v198 + v203 + v204) + 132.0d0*(v187 + v191 + v193 + v201) + &
      112.0d0*(v188 + v194 + v238 + v239) + 81.0d0*(v172 + v177 + v183 &
      + v190 + v195 + v199) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v173 + 5.0d0*v176 + 5.0d0*v178 + 5.0d0*v179 + 14.0d0*v181 + &
      6.0d0*v182 + 14.0d0*v186 + 6.0d0*v189 + 6.0d0*v196 + 6.0d0*v200 + &
      14.0d0*v240 + 14.0d0*v241)))
    S_xxyzz   = -(S_xxxxy + S_xxyyy)
    v296      = M_y*S_xxyzz
    v319      = M_x*S_xxyzz
    v460      = M_z*S_xxyzz
    S_xxzzz   = -(S_xxxxz + S_xxyyz)
    v254      = M_z*S_xxzzz
    v380      = M_x*S_xxzzz
    v453      = M_y*S_xxzzz
    S_xyyyy   = v242*x
    v260      = M_x*S_xyyyy
    v368      = M_y*S_xyyyy
    v434      = M_z*S_xyyyy
    Ms_xyyyy  = Ms_xyyyy + (M_0*S_xyyyy + v206 + 0.0476190476190476d0*(4.0d0*(v117 + v131) + 78.0d0* &
      (v127 + v132) + 20.0d0*(M_xyyyy + v112 + v133) + 8.0d0*(v114 + &
      v116 + v123 + v129) + 56.0d0*(v207 + v208 + v211 + v212) - (2.0d0 &
      *M_xxxyy + v109 + 30.0d0*v110 + 24.0d0*v115 + v118 + 48.0d0*v121 &
      + 30.0d0*v122 + 48.0d0*v125 + 24.0d0*v126 + 48.0d0*v128 + 48.0d0* &
      v135 + 28.0d0*v209 + 28.0d0*v210 + 28.0d0*v213 + 28.0d0*v214)))
    S_xyyyz   = v12*v3
    v517      = M_y*S_xyyyz
    v521      = 1.81818181818182d0*S_xyyyz
    v522      = M_x*v521
    Ms_xyyyz  = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v222 + v224 + v227 + v229 &
      ) + 5.0d0*(v223 + v226 + v228 + v232) + 2.0d0*(-v215 + v216 + &
      v217 - v219 - v220 - v221 + v230 + v231)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v106 + M_xyyyz + M_yyyz*x + S_xyy*v107 + S_yy*v225)
    S_xyyzz   = -(S_xxxyy + S_xyyyy)
    v261      = M_x*S_xyyzz
    v333      = M_y*S_xyyzz
    v435      = M_z*S_xyyzz
    S_xyzzz   = -(S_xxxyz + S_xyyyz)
    S_xzzzz   = -(S_xxxzz + S_xyyzz)
    S_yyyyy   = y*(0.111111111111111d0*(-10.0d0*v105) + v104 + v108)
    v297      = M_y*S_yyyyy
    v340      = M_x*S_yyyyy
    v506      = M_z*S_yyyyy
    Ms_yyyyy  = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v162 + v167) + 330.0d0*(v164 + v166) - 30.0d0*(M_xxyyy + v152 + &
      v161) + 120.0d0*(v145 + v150 + v158 + v159) + 60.0d0*(v146 + v151 &
      + v163 + v165) - 300.0d0*(v156 + v157 + v168 + v170) - 140.0d0*( &
      v234 + v235 + v236 + v237) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v139 + v140 + v141 + v142 + v148 + v160)))
    S_yyyyz   = v242*z
    v316      = M_z*S_yyyyz
    v381      = M_x*S_yyyyz
    v491      = M_y*S_yyyyz
    Ms_yyyyz  = Ms_yyyyz + (M_0*S_yyyyz + v180 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v182 &
      + v189) + 32.0d0*(v183 + v199) + 48.0d0*(v187 + v201) + 4.0d0*( &
      v190 + v195) + 106.0d0*(v196 + v200) + 104.0d0*(v197 + v202) + &
      44.0d0*(v198 + v204) + 56.0d0*(v240 + v241) - (M_xxxxz + 8.0d0* &
      v184 + 5.0d0*v185 + 36.0d0*v191 + 8.0d0*v192 + 36.0d0*v193 + &
      5.0d0*v203 + 28.0d0*v238 + 28.0d0*v239)))
    S_yyyzz   = -(S_xxyyy + S_yyyyy)
    v298      = M_y*S_yyyzz
    v320      = M_x*S_yyyzz
    v337      = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz - &
      v319 - v320 + 4.0d0*v321 - v322 - 24.0d0*v323 - 30.0d0*v324 - &
      v325 - v326 - 30.0d0*v327 - v328 - v329 - 24.0d0*v330 - v331 - &
      v332 - v333 + 4.0d0*v334 - v335 - v336))
    v461      = M_z*S_yyyzz
    S_yyzzz   = -(S_xxyyz + S_yyyyz)
    v255      = M_z*S_yyzzz
    v532      = v533 - 15.0d0*M_xxyyzz + 3.0d0*(2.0d0*v249 + 2.0d0*v252 + 2.0d0*v254 + &
      2.0d0*v255)
    v256      = 0.00432900432900433d0*(1440.0d0*v250 + 5.0d0*(12.0d0*v247 - 8.0d0*v248 - &
      8.0d0*v251 + 12.0d0*v253 + v532))
    v382      = M_x*S_yyzzz
    v439      = 0.00432900432900433d0*(-720.0d0*v250 + v532 - 240.0d0*(v247 + v253) - &
      260.0d0*(v248 + v251))
    v454      = M_y*S_yyzzz
    v462      = -0.0303030303030303d0*(M_yyyyyz + v452 + v453 + v454 + v457 + v531 + &
      5.0d0*(v450 + v451 + v455 + v456 + v458 + v459 + v460 + v461))
    v514      = -0.0303030303030303d0*(M_xxxxxz + v380 + v382 + v402 + v428 + v530 + &
      5.0d0*(v394 + v401 + v410 + v416 + v418 + v427 + v433 + v435))
    S_yzzzz   = -(S_xxyzz + S_yyyzz)
    S_zzzzz   = -(S_xxzzz + S_yyzzz)
    S_xxxxxx  = a6 + v244 + 0.0909090909090909d0*(-15.0d0*v245 + 5.0d0*v246)
    Ms_xxxxxx = Ms_xxxxxx + (M_0*S_xxxxxx + v256 + 0.00432900432900433d0*(136.0d0*M_xxxxxx - 75.0d0* &
      M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + 2360.0d0*v267 - &
      2340.0d0*v278 - 2260.0d0*v285 + 1440.0d0*v290 + 576.0d0*(v257 + &
      v271) + 1620.0d0*(v262 + v269) - 120.0d0*(v279 + v304) + 840.0d0* &
      (v283 + v314) - 160.0d0*(v305 + v311) + 90.0d0*(-M_xxxxzz + v263 &
      + v280) + 360.0d0*(-v258 + v270 - v275 + v299) + 720.0d0*(v268 + &
      v281 + v289 + v300) - 600.0d0*(v272 + v273 + v294 + v315) - &
      1680.0d0*(v274 + v276 + v288 + v293) - 165.0d0*(v264 + v265 + &
      v266 + v286 + v306 + v312) - 180.0d0*(M_xxxxyy + v259 + v260 + &
      v261 + v277 + v291 + v292) + 60.0d0*(v282 - v287 + v295 - v301 - &
      v302 - v303 - v307 - v313) + 30.0d0*(v284 + v296 + v297 + v298 + &
      v308 + v309 + v310 + v316)))
    S_xxxxxy  = v0*v318
    Ms_xxxxxy = Ms_xxxxxy + (M_0*S_xxxxxy - M_z*v377 + v337 - v350*z + 0.0303030303030303d0*(-10.0d0* &
      (v339 + v353) + 20.0d0*(v342 + v359) - 70.0d0*(v349 + v367) - &
      60.0d0*(v351 + v375) + 28.0d0*(M_xxxxxy + v345 + v366) + 100.0d0* &
      (v338 + v344 + v346 + v356) + 190.0d0*(v341 + v343 + v347 + v352 &
      ) - 140.0d0*(v354 + v355 + v363 + v365) - 5.0d0*(M_xyyyyy + v340 &
      + v357 + v361 + v368 + v372 + v373) + 40.0d0*(-v348 + v358 + v360 &
      + v362 + v364 - v369 + v370 + v371 + v374 + v376)))
    S_xxxxxz  = v1*v318
    Ms_xxxxxz = Ms_xxxxxz + (M_0*S_xxxxxz - v391 - v396 - v412 - v419 + 0.0303030303030303d0*(28.0d0* &
      M_xxxxxz + 250.0d0*(v383 + v392) + 220.0d0*(v386 + v414) + 68.0d0 &
      *(v387 + v431) + 80.0d0*(v393 + v420) + 90.0d0*(v397 + v415) - &
      140.0d0*(v399 + v403) + 160.0d0*(v400 + v404) + 330.0d0*(M_xxx* &
      S_xxz + M_xxz*S_xxx) + 100.0d0*(v378 + v388 - v389 - v429) + &
      20.0d0*(v384 + v385 + v408 + v425) + 10890.0d0*(-M_xxxyyz - v379 &
      + v390 - v398 + v432) + 40.0d0*(v405 - v406 + v409 - v413 + v421 &
      - v422 + v426 - v430) - 5.0d0*(M_xxxzzz + M_xyyyyz + M_xyyzzz + &
      v380 + v381 + v382 + v402 + v424 + v428) - 25.0d0*(v394 + v401 + &
      v407 + v410 + v416 + v417 + v418 + v423 + v427 + v433 + v434 + &
      v435)))
    S_xxxxyy  = 0.0303030303030303d0*(-3.0d0*v245 + 2.0d0*v246) + v37*v5 + v437 + v438* &
      v5
    Ms_xxxxyy = Ms_xxxxyy + (M_0*S_xxxxyy + v439 - v440 - v444 + v447 + v449 + 0.00432900432900433d0* &
      (-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - 11.0d0*M_xxxxzz - 5.0d0* &
      M_yyyyyy - 4.0d0*M_yyyyzz + 1800.0d0*v278 - 720.0d0*v290 - 64.0d0 &
      *(v257 + v271) + 628.0d0*(v258 + v275) - 82.0d0*(v262 + v269) + &
      942.0d0*(v263 + v280) + 2.0d0*(v265 + v306) - 60.0d0*(v267 + v285 &
      ) + 760.0d0*(v268 + v289) + 412.0d0*(v272 + v294) - 36.0d0*(v273 &
      + v315) + 1288.0d0*(v274 + v288) - 220.0d0*(v279 + v304) - &
      402.0d0*(v281 + v300) - 392.0d0*(v283 + v314) + 37.0d0*(v302 + &
      v307) + 80.0d0*(v305 + v311) + 6.0d0*(v309 + v316) - 26.0d0*(v264 &
      + v266 + v286 + v312) + 268.0d0*(v270 - v282 - v295 + v299) - &
      19.0d0*(v287 + v301 + v303 + v313) - 448.0d0*(v441 + v442 + v443 &
      + v445) - 8.0d0*(v284 + v296 + v297 + v298 + v308 + v310) - &
      22.0d0*(M_xxyyyy + v259 + v260 + v261 + v277 + v291 + v292)))
    S_xxxxyz  = v2*(-v436 + v37 + v438)
    Ms_xxxxyz = Ms_xxxxyz + (M_0*S_xxxxyz + v462 + 0.0303030303030303d0*(26.0d0*(v476 + v505) + &
      40.0d0*(v481 + v494) + 8.0d0*(v493 + v499) + 32.0d0*(M_xxxxyz + &
      v469 + v489) + 96.0d0*(v463 + v471 + v472 + v482) + 170.0d0*(v464 &
      + v473 + v478 + v480) + 4.0d0*(v465 + v479 + v492 + v498) + &
      160.0d0*(v466 + v470 + v486 + v487) + 64.0d0*(v467 + v468 + v484 &
      + v488 + v501 + v504) - (2.0d0*M_xxyyyz + 40.0d0*v474 + 18.0d0* &
      v475 + 38.0d0*v477 + 64.0d0*v483 + 64.0d0*v485 + 38.0d0*v490 + &
      v491 + 13.0d0*v495 + 5.0d0*v496 + v497 + 40.0d0*v500 + 18.0d0* &
      v502 + 13.0d0*v503 + 5.0d0*v506)))
    S_xxxyyy  = v0*(0.0909090909090909d0*v38 + v507 + v508 + v83)
    Ms_xxxyyy = Ms_xxxyyy + (0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v321 + v334) + 75.0d0*(v323 + v330) + 69.0d0*(v324 + v327) + &
      25.0d0*(v339 + v349 + v353 + v367) + 31.0d0*(v342 + v348 + v359 + &
      v369) - (M_xxxxxy + 11.0d0*M_xxxyz*v509 + M_xxxyzz + M_xyyyyy + &
      11.0d0*M_xyyyz*v509 + M_xyyyzz + 11.0d0*S_xxxyz*v512 + 11.0d0* &
      S_xyyyz*v512 + v319 + v320 + v322 + v325 + v326 + v328 + v329 + &
      v331 + v332 + v333 + v335 + v336 + 7.0d0*v338 + v340 + 10.0d0* &
      v341 + 10.0d0*v343 + 7.0d0*v344 + v345 + 7.0d0*v346 + 10.0d0*v347 &
      + 6.0d0*v351 + 10.0d0*v352 + 10.0d0*v354 + 10.0d0*v355 + 7.0d0* &
      v356 + 7.0d0*v357 + 10.0d0*v358 + 10.0d0*v360 + 7.0d0*v361 + &
      10.0d0*v362 + 10.0d0*v363 + 10.0d0*v364 + 10.0d0*v365 + v366 + &
      7.0d0*v368 + 10.0d0*v370 + 10.0d0*v371 + 7.0d0*v372 + v373 + &
      10.0d0*v374 + 6.0d0*v375 + 10.0d0*v376 + 6.0d0*v510 + 6.0d0*v511 &
      )))
    S_xxxyyz  = v1*(0.0909090909090909d0*(-v40) + v508 + v513)
    Ms_xxxyyz = Ms_xxxyyz + (M_0*S_xxxyyz + M_xxyy*v218 + S_xxyy*v76 + v391 + v396 + v412 + v419 + &
      v514 + 0.0303030303030303d0*(31.0d0*M_xxxyyz + v387 + v431 + &
      79.0d0*(v379 + v398) + 103.0d0*(v384 + v408) + 55.0d0*(v385 + &
      v425) + 88.0d0*(v389 + v429) + 47.0d0*(v390 + v432) + 43.0d0*( &
      v393 + v420) + 152.0d0*(v399 + v403) + 95.0d0*(v400 + v404) + &
      10.0d0*(v406 + v413 + v422 + v430) + 13.0d0*(v407 + v417 + v423 + &
      v434) - (M_xyyyyz + 7.0d0*v378 + v381 + 4.0d0*v383 + v386 + 7.0d0 &
      *v388 + 4.0d0*v392 + 10.0d0*v405 + 10.0d0*v409 + v414 + 10.0d0* &
      v421 + v424 + 10.0d0*v426 + 18.0d0*v515 + 18.0d0*v516 + 18.0d0* &
      v517 + 18.0d0*v518)))
    S_xxyyyy  = 0.0303030303030303d0*(-3.0d0*v519 + 2.0d0*v520) + v104*v4 + v4*v438 + &
      v437
    Ms_xxyyyy = Ms_xxyyyy + (M_0*S_xxyyyy + v439 + v440 + v444 - v447 - v449 + 0.00432900432900433d0* &
      (-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0*M_xxyyyy - 12.0d0* &
      M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v278 + 1800.0d0*v290 + &
      412.0d0*(v260 + v291) + 37.0d0*(v262 + v269) - 402.0d0*(v263 + &
      v280) + 80.0d0*(v267 + v285) - 220.0d0*(v268 + v289) + 2.0d0*( &
      v270 + v299) + 6.0d0*(v273 + v315) + 760.0d0*(v279 + v304) + &
      942.0d0*(v281 + v300) + 628.0d0*(v282 + v295) - 64.0d0*(v297 + &
      v308) - 82.0d0*(v302 + v307) - 60.0d0*(v305 + v311) - 36.0d0*( &
      v309 + v316) + 1288.0d0*(v441 + v442) - 392.0d0*(v443 + v445) + &
      268.0d0*(-v258 + v265 - v275 + v306) - 19.0d0*(v264 + v266 + v286 &
      + v312) - 448.0d0*(v274 + v283 + v288 + v314) - 26.0d0*(v287 + &
      v301 + v303 + v313) - 8.0d0*(v257 + v259 + v261 + v271 + v277 + &
      v292) - 22.0d0*(M_xxxxyy + v272 + v284 + v294 + v296 + v298 + &
      v310)))
    S_xxyyyz  = v2*(0.0909090909090909d0*(-v105) + v507 + v513)
    Ms_xxyyyz = Ms_xxyyyz + (M_0*S_xxyyyz + v462 + v522 + v523 + v525 + v526 + 0.0303030303030303d0*( &
      31.0d0*M_xxyyyz + v496 + v506 + 43.0d0*(v465 + v498) + 95.0d0*( &
      v474 + v500) + 99.0d0*(v475 + v502) + 47.0d0*(v476 + v505) + &
      79.0d0*(v477 + v490) + 103.0d0*(v479 + v492) + 55.0d0*(v481 + &
      v494) + 152.0d0*(v483 + v485) + 88.0d0*(v484 + v488) + 10.0d0*( &
      v466 + v470 + v486 + v487) + 13.0d0*(v467 + v468 + v501 + v504) - &
      (M_xxxxyz + 18.0d0*v463 + 10.0d0*v464 + v469 + 18.0d0*v471 + &
      18.0d0*v472 + 10.0d0*v473 + 10.0d0*v478 + 10.0d0*v480 + 18.0d0* &
      v482 + v489 + 7.0d0*v491 + 4.0d0*v493 + v495 + 7.0d0*v497 + 4.0d0 &
      *v499 + v503)))
    S_xyyyyy  = v0*v527
    Ms_xyyyyy = Ms_xyyyyy + (M_0*S_xyyyyy - M_z*v521 + v337 - v524*z + 0.0303030303030303d0*(-70.0d0* &
      (v339 + v353) + 20.0d0*(v348 + v369) - 10.0d0*(v349 + v367) - &
      60.0d0*(v510 + v511) + 28.0d0*(M_xyyyyy + v340 + v373) + 100.0d0* &
      (v357 + v361 + v368 + v372) + 190.0d0*(v358 + v360 + v370 + v371 &
      ) - 140.0d0*(v362 + v364 + v374 + v376) - 5.0d0*(M_xxxxxy + v338 &
      + v344 + v345 + v346 + v356 + v366) + 40.0d0*(v341 - v342 + v343 &
      + v347 + v352 + v354 + v355 - v359 + v363 + v365)))
    S_xyyyyz  = v1*(0.0909090909090909d0*(-6.0d0*v105) + v104 + v438)
    Ms_xyyyyz = Ms_xyyyyz + (M_0*S_xyyyyz + v514 + 0.0303030303030303d0*(8.0d0*(v383 + v392) + 40.0d0 &
      *(v385 + v425) + 26.0d0*(v390 + v432) + 32.0d0*(M_xyyyyz + v381 + &
      v424) + 4.0d0*(v384 + v393 + v408 + v420) + 170.0d0*(v405 + v409 &
      + v421 + v426) + 160.0d0*(v406 + v413 + v422 + v430) + 96.0d0*( &
      v515 + v516 + v517 + v518) + 64.0d0*(v389 + v407 + v417 + v423 + &
      v429 + v434) - (2.0d0*M_xxxyyz + v378 + 38.0d0*v379 + 13.0d0*v386 &
      + 5.0d0*v387 + v388 + 18.0d0*v397 + 38.0d0*v398 + 64.0d0*v399 + &
      40.0d0*v400 + 64.0d0*v403 + 40.0d0*v404 + 13.0d0*v414 + 18.0d0* &
      v415 + 5.0d0*v431)))
    S_yyyyyy  = b6 + v244 + 0.0909090909090909d0*(-15.0d0*v519 + 5.0d0*v520)
    Ms_yyyyyy = Ms_yyyyyy + (M_0*S_yyyyyy + v256 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v278 - &
      2340.0d0*v290 + 2360.0d0*v305 - 2260.0d0*v311 - 160.0d0*(v267 + &
      v285) - 120.0d0*(v268 + v289) + 576.0d0*(v297 + v308) + 1620.0d0* &
      (v302 + v307) + 840.0d0*(v443 + v445) + 90.0d0*(-M_yyyyzz + v281 &
      + v300) - 600.0d0*(v260 + v291 + v309 + v316) + 720.0d0*(v263 + &
      v279 + v280 + v304) + 360.0d0*(v265 - v282 - v295 + v306) - &
      1680.0d0*(v441 + v442 + v446 + v448) - 165.0d0*(v270 + v287 + &
      v299 + v301 + v303 + v313) - 180.0d0*(M_xxyyyy + v272 + v284 + &
      v294 + v296 + v298 + v310) + 30.0d0*(v257 + v259 + v261 + v271 + &
      v273 + v277 + v292 + v315) + 60.0d0*(v258 - v262 - v264 - v266 - &
      v269 + v275 - v286 - v312)))
    S_yyyyyz  = v2*v527
    Ms_yyyyyz = Ms_yyyyyz + (M_0*S_yyyyyz - v522 - v523 - v525 - v526 + 0.0303030303030303d0*(28.0d0* &
      M_yyyyyz + 80.0d0*(v465 + v498) + 160.0d0*(v474 + v500) + 90.0d0* &
      (v475 + v502) - 140.0d0*(v483 + v485) + 250.0d0*(v493 + v499) + &
      220.0d0*(v495 + v503) + 68.0d0*(v496 + v506) + 330.0d0*(M_yyy* &
      S_yyz + M_yyz*S_yyy) + 20.0d0*(v479 + v481 + v492 + v494) + &
      100.0d0*(-v484 - v488 + v491 + v497) + 10890.0d0*(-M_xxyyyz + &
      v476 - v477 - v490 + v505) + 40.0d0*(v464 - v466 - v470 + v473 + &
      v478 + v480 - v486 - v487) - 5.0d0*(M_xxxxyz + M_xxyzzz + &
      M_yyyzzz + v452 + v453 + v454 + v457 + v469 + v489) - 25.0d0*( &
      v450 + v451 + v455 + v456 + v458 + v459 + v460 + v461 + v467 + &
      v468 + v501 + v504)))
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
    
! OPS  711*ADD + 2*DIV + 1014*MUL + 87*NEG + POW + 20*SUB = 1835  (2376 before optimization)
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
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v183, v184, v185, v186, v187, v188,&
                v189, v19, v190, v191, v192, v193, v194, v195, v196, v2, v20,&
                v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31,&
                v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42,&
                v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53,&
                v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64,&
                v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75,&
                v76, v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86,&
                v87, v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97,&
                v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy,&
                D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz,&
                D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz,&
                D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy,&
                D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy,&
                D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz,&
                D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz,&
                D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz,&
                D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz,&
                D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz,&
                D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz,&
                D_zzzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz,&
                M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define z                    r(3)
#define y                    r(2)
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
#define L_xz                 L(6)
#define M_xz                 M(6)
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
#define M_yyy                M(14)
#define L_yyy                L(14)
#define L_yyz                L(15)
#define M_yyz                M(15)
#define L_xxxx               L(16)
#define M_xxxx               M(16)
#define M_xxxy               M(17)
#define L_xxxy               L(17)
#define L_xxxz               L(18)
#define M_xxxz               M(18)
#define M_xxyy               M(19)
#define L_xxyy               L(19)
#define M_xxyz               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xyyy               M(21)
#define M_xyyz               M(22)
#define L_xyyz               L(22)
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
#define L_xxxxxx             L(36)
#define M_xxxxxx             M(36)
#define L_xxxxxy             L(37)
#define M_xxxxxy             M(37)
#define L_xxxxxz             L(38)
#define M_xxxxxz             M(38)
#define M_xxxxyy             M(39)
#define L_xxxxyy             L(39)
#define L_xxxxyz             L(40)
#define M_xxxxyz             M(40)
#define L_xxxyyy             L(41)
#define M_xxxyyy             M(41)
#define M_xxxyyz             M(42)
#define L_xxxyyz             L(42)
#define M_xxyyyy             M(43)
#define L_xxyyyy             L(43)
#define M_xxyyyz             M(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define M_xyyyyy             M(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define L_yyyyyy             L(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define L_yyyyyz             L(48)
    v194     = y*z
    v188     = 15.0d0*v194
    v190     = x*y
    v192     = v194
    v57      = 0.5d0*M_xx
    v65      = 0.166666666666667d0*M_xxx
    v66      = 0.5d0*M_xxy
    v67      = 0.5d0*M_xxz
    v83      = 0.0416666666666667d0*M_xxxx
    v84      = 0.166666666666667d0*M_xxxy
    v85      = 0.166666666666667d0*M_xxxz
    v86      = 0.25d0*M_xxyy
    v87      = 0.5d0*M_xxyz
    v121     = 0.00833333333333333d0*M_xxxxx
    v122     = 0.0416666666666667d0*M_xxxxy
    v123     = 0.0416666666666667d0*M_xxxxz
    v124     = 0.0833333333333333d0*M_xxxyy
    v125     = 0.166666666666667d0*M_xxxyz
    v127     = 0.0833333333333333d0*M_xxyyy
    v128     = 0.25d0*M_xxyyz
    v150     = 0.5d0*M_yy
    v152     = 0.166666666666667d0*M_yyy
    v153     = 0.5d0*M_yyz
    v157     = 0.0416666666666667d0*M_yyyy
    v158     = 0.166666666666667d0*M_yyyz
    v165     = 0.00833333333333333d0*M_yyyyy
    v166     = 0.0416666666666667d0*M_yyyyz
    M_zz     = -(M_xx + M_yy)
    v176     = 0.5d0*M_zz
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    v177     = 0.166666666666667d0*M_zzz
    M_xxzz   = -(M_xxxx + M_xxyy)
    v88      = 0.25d0*M_xxzz
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v159     = 0.25d0*M_yyzz
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    v178     = 0.0416666666666667d0*M_zzzz
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    v126     = 0.0833333333333333d0*M_xxxzz
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    v129     = 0.25d0*M_xxyzz
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    v130     = 0.0833333333333333d0*M_xxzzz
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v167     = 0.0833333333333333d0*M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    v168     = 0.0833333333333333d0*M_yyzzz
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    v179     = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz = -(M_xxzzzz + M_yyzzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v180     = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v180
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v181     = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v181
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v100     = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v182     = 3.0d0*h
    v183     = h*v0
    v184     = h*v1
    v193     = 21.0d0*h
    v4       = -h
    v12      = v182
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v183
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v184
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 + 630.0d0*v183 - 945.0d0*v19
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 + 630.0d0*v184 - 945.0d0*v31
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
    D_0      = u
    u3       = u*u2
    v2       = u3
    D_x      = -v2*x
    D_y      = -v2*y
    D_z      = -v2*z
    u4       = u2*u2
    u5       = u2*u3
    v3       = u5
    v185     = 3.0d0*v3
    v6       = v185*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v185*v192
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v186     = 3.0d0*v8
    v9       = v8*x
    v11      = v186*(h - v10)
    D_xxx    = -3.0d0*v9*(v180 - v182)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    v131     = 0.5d0*D_xyy
    D_xyz    = -v188*v9
    D_xzz    = -(D_xxx + D_xyy)
    v141     = 0.5d0*D_xzz
    D_yyy    = v186*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    v169     = 0.5d0*D_yzz
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v187     = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v187*y
    v26      = v187*z
    v28      = v15*v188
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v89      = 0.5d0*D_xxyy
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    v95      = 0.5d0*D_xxzz
    D_xyyy   = v22*v30
    v110     = 0.5d0*D_xyyy
    v132     = 0.166666666666667d0*D_xyyy
    D_xyyz   = v26*(v29 + v4)
    v138     = 0.5d0*D_xyyz
    D_xyzz   = -(D_xxxy + D_xyyy)
    v116     = 0.5d0*D_xyzz
    D_xzzz   = -(D_xxxz + D_xyyz)
    v142     = 0.166666666666667d0*D_xzzz
    v147     = 0.5d0*D_xzzz
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    v160     = 0.5d0*D_yyzz
    D_yzzz   = -(D_xxyz + D_yyyz)
    v170     = 0.166666666666667d0*D_yzzz
    v173     = 0.5d0*D_yzzz
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v195     = v34*z
    v189     = 15.0d0*v34
    v35      = v189*x
    v39      = v195
    v41      = 315.0d0*v190*v195
    v42      = v189*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy  = v34*v38*y
    D_xxxxz  = v38*v39
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    v68      = 0.5d0*D_xxxyy
    D_xxxyz  = v41*(h - v5)
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    v71      = 0.5d0*D_xxxzz
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    v77      = 0.5d0*D_xxyyy
    v90      = 0.166666666666667d0*D_xxyyy
    D_xxyyz  = v39*(v36 - 945.0d0*v181 + 105.0d0*(v183 + v184))
    v93      = 0.5d0*D_xxyyz
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    v80      = 0.5d0*D_xxyzz
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    v96      = 0.166666666666667d0*D_xxzzz
    v98      = 0.5d0*D_xxzzz
    D_xyyyy  = v34*v43*x
    v104     = 0.5d0*D_xyyyy
    v111     = 0.166666666666667d0*D_xyyyy
    v133     = 0.0416666666666667d0*D_xyyyy
    D_xyyyz  = v41*(h - v7)
    v114     = 0.5d0*D_xyyyz
    v136     = 0.166666666666667d0*D_xyyyz
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    v107     = 0.5d0*D_xyyzz
    v139     = 0.25d0*D_xyyzz
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    v117     = 0.166666666666667d0*D_xyzzz
    v119     = 0.5d0*D_xyzzz
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    v143     = 0.0416666666666667d0*D_xzzzz
    v148     = 0.166666666666667d0*D_xzzzz
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz  = v39*v43
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    v154     = 0.5d0*D_yyyzz
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    v161     = 0.166666666666667d0*D_yyzzz
    v163     = 0.5d0*D_yyzzz
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    v171     = 0.0416666666666667d0*D_yzzzz
    v174     = 0.166666666666667d0*D_yzzzz
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v196     = 315.0d0*v44
    v191     = v196*x
    v45      = 45.0d0*v44
    v50      = v191*y
    v54      = v191*z
    v56      = v192*v196
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = L_xxxxxx + (D_xxxxxx*M_0)
    D_xxxxxy = v50*v53
    L_xxxxxy = L_xxxxxy + (D_xxxxxy*M_0)
    D_xxxxxz = v53*v54
    L_xxxxx  = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z)
    L_xxxxxz = L_xxxxxz + (D_xxxxxz*M_0)
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 + v17*v29 - v19*v193 + 14.0d0*v49)
    v58      = 0.5d0*D_xxxxyy
    L_xxxxyy = L_xxxxyy + (D_xxxxyy*M_0)
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxy  = L_xxxxy + (D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z)
    L_xxxxyz = L_xxxxyz + (D_xxxxyz*M_0)
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    v59      = 0.5d0*D_xxxxzz
    L_xxxx   = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v57 + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_yy*v58 + M_zz*v59)
    L_xxxxz  = L_xxxxz + (D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z)
    D_xxxyyy = 945.0d0*v190*v44*(11.0d0*v27 + v17 + v60 + v61)
    v63      = 0.5d0*D_xxxyyy
    v69      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy = L_xxxyyy + (D_xxxyyy*M_0)
    D_xxxyyz = v54*(-9.0d0*v32 + v60 + v62)
    v70      = 0.5d0*D_xxxyyz
    L_xxxyy  = L_xxxyy + (D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z)
    L_xxxyyz = L_xxxyyz + (D_xxxyyz*M_0)
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    v64      = 0.5d0*D_xxxyzz
    L_xxxy   = L_xxxy + (D_xxxxxy*v57 + D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyz*M_yz + D_xxxyz*M_z + M_yy*v63 + M_zz*v64)
    L_xxxyz  = L_xxxyz + (D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z)
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    v72      = 0.166666666666667d0*D_xxxzzz
    v73      = 0.5d0*D_xxxzzz
    L_xxx    = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v57 + D_xxxxxx*v65 + D_xxxxxy*v66 + &
      D_xxxxxz*v67 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + M_xyy*v58 + M_xzz*v59 + &
      M_yy*v68 + M_yyy*v69 + M_yyz*v70 + M_yzz*v64 + M_zz*v71 + M_zzz* &
      v72)
    L_xxxz   = L_xxxz + (D_xxxxxz*v57 + D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y &
      + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_yy*v70 + M_zz*v73)
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 + v17*v24 - v193*v31 + 14.0d0*v74)
    v75      = 0.5d0*D_xxyyyy
    v78      = 0.166666666666667d0*D_xxyyyy
    v91      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy = L_xxyyyy + (D_xxyyyy*M_0)
    D_xxyyyz = v56*(-9.0d0*v20 + v61 + v62)
    v79      = 0.5d0*D_xxyyyz
    v92      = 0.166666666666667d0*D_xxyyyz
    L_xxyyy  = L_xxyyy + (D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z)
    L_xxyyyz = L_xxyyyz + (D_xxyyyz*M_0)
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    v76      = 0.5d0*D_xxyyzz
    v94      = 0.25d0*D_xxyyzz
    L_xxyy   = L_xxyy + (D_xxxxyy*v57 + D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyz*M_yz + D_xxyyz*M_z + M_yy*v75 + M_zz*v76)
    L_xxyyz  = L_xxyyz + (D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z)
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    v81      = 0.166666666666667d0*D_xxyzzz
    v82      = 0.5d0*D_xxyzzz
    L_xxy    = L_xxy + (D_xxxxxy*v65 + D_xxxxy*v57 + D_xxxxyy*v66 + D_xxxxyz*v67 + D_xxxy*M_x + &
      D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy &
      *M_y + D_xxyyz*M_yz + D_xxyz*M_z + M_xyy*v63 + M_xzz*v64 + M_yy* &
      v77 + M_yyy*v78 + M_yyz*v79 + M_yzz*v76 + M_zz*v80 + M_zzz*v81)
    L_xxyz   = L_xxyz + (D_xxxxyz*v57 + D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y &
      + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_yy*v79 + M_zz*v82)
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    v97      = 0.0416666666666667d0*D_xxzzzz
    v99      = 0.166666666666667d0*D_xxzzzz
    L_xx     = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*v57 + D_xxxxx*v65 + D_xxxxxx*v83 + &
      D_xxxxxy*v84 + D_xxxxxz*v85 + D_xxxxy*v66 + D_xxxxyy*v86 + &
      D_xxxxyz*v87 + D_xxxxz*v67 + D_xxxxzz*v88 + D_xxxy*M_xy + D_xxxyz &
      *M_xyz + D_xxxz*M_xz + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + &
      M_xyy*v68 + M_xyyy*v69 + M_xyyz*v70 + M_xyzz*v64 + M_xzz*v71 + &
      M_xzzz*v72 + M_yy*v89 + M_yyy*v90 + M_yyyy*v91 + M_yyyz*v92 + &
      M_yyz*v93 + M_yyzz*v94 + M_yzz*v80 + M_yzzz*v81 + M_zz*v95 + &
      M_zzz*v96 + M_zzzz*v97)
    L_xxz    = L_xxz + (D_xxxxxz*v65 + D_xxxxyz*v66 + D_xxxxz*v57 + D_xxxxzz*v67 + D_xxxyz*M_xy &
      + D_xxxyzz*M_xyz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + M_xyy*v70 + M_xzz*v73 + &
      M_yy*v93 + M_yyy*v92 + M_yyz*v76 + M_yzz*v82 + M_zz*v98 + M_zzz* &
      v99)
    D_xyyyyy = v101*v50
    v102     = 0.5d0*D_xyyyyy
    v105     = 0.166666666666667d0*D_xyyyyy
    v112     = 0.0416666666666667d0*D_xyyyyy
    v134     = 0.00833333333333333d0*D_xyyyyy
    L_xyyyyy = L_xyyyyy + (D_xyyyyy*M_0)
    D_xyyyyz = v54*(-18.0d0*v32 + v100 + v17)
    v106     = 0.5d0*D_xyyyyz
    v113     = 0.166666666666667d0*D_xyyyyz
    v135     = 0.0416666666666667d0*D_xyyyyz
    L_xyyyy  = L_xyyyy + (D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z)
    L_xyyyyz = L_xyyyyz + (D_xyyyyz*M_0)
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    v103     = 0.5d0*D_xyyyzz
    v115     = 0.25d0*D_xyyyzz
    v137     = 0.0833333333333333d0*D_xyyyzz
    v145     = 0.166666666666667d0*D_xyyyzz
    L_xyyy   = L_xyyy + (D_xxxyyy*v57 + D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyz*M_yz + D_xyyyz*M_z + M_yy*v102 + M_zz* &
      v103)
    L_xyyyz  = L_xyyyz + (D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z)
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    v108     = 0.166666666666667d0*D_xyyzzz
    v109     = 0.5d0*D_xyyzzz
    v140     = 0.0833333333333333d0*D_xyyzzz
    v146     = 0.25d0*D_xyyzzz
    L_xyy    = L_xyy + (D_xxxxyy*v65 + D_xxxyy*v57 + D_xxxyyy*v66 + D_xxxyyz*v67 + D_xxyy*M_x + &
      D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy &
      *M_y + D_xyyyz*M_yz + D_xyyz*M_z + M_xyy*v75 + M_xzz*v76 + M_yy* &
      v104 + M_yyy*v105 + M_yyz*v106 + M_yzz*v103 + M_zz*v107 + M_zzz* &
      v108)
    L_xyyz   = L_xyyz + (D_xxxyyz*v57 + D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y &
      + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_yy*v106 + M_zz* &
      v109)
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    v118     = 0.0416666666666667d0*D_xyzzzz
    v120     = 0.166666666666667d0*D_xyzzzz
    L_xy     = L_xy + (D_xxxxxy*v83 + D_xxxxy*v65 + D_xxxxyy*v84 + D_xxxxyz*v85 + D_xxxy*v57 + &
      D_xxxyy*v66 + D_xxxyyy*v86 + D_xxxyyz*v87 + D_xxxyz*v67 + &
      D_xxxyzz*v88 + D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz* &
      M_xz + D_xy*M_0 + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v77 &
      + M_xyyy*v78 + M_xyyz*v79 + M_xyzz*v76 + M_xzz*v80 + M_xzzz*v81 + &
      M_yy*v110 + M_yyy*v111 + M_yyyy*v112 + M_yyyz*v113 + M_yyz*v114 + &
      M_yyzz*v115 + M_yzz*v107 + M_yzzz*v108 + M_zz*v116 + M_zzz*v117 + &
      M_zzzz*v118)
    L_xyz    = L_xyz + (D_xxxxyz*v65 + D_xxxyyz*v66 + D_xxxyz*v57 + D_xxxyzz*v67 + D_xxyyz*M_xy &
      + D_xxyyzz*M_xyz + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + M_xyy*v79 + M_xzz*v82 + &
      M_yy*v114 + M_yyy*v113 + M_yyz*v103 + M_yzz*v109 + M_zz*v119 + &
      M_zzz*v120)
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    v144     = 0.00833333333333333d0*D_xzzzzz
    v149     = 0.0416666666666667d0*D_xzzzzz
    L_x      = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*v57 + D_xxxx*v65 + D_xxxxx*v83 + D_xxxxxx* &
      v121 + D_xxxxxy*v122 + D_xxxxxz*v123 + D_xxxxy*v84 + D_xxxxyy* &
      v124 + D_xxxxyz*v125 + D_xxxxz*v85 + D_xxxxzz*v126 + D_xxxy*v66 + &
      D_xxxyy*v86 + D_xxxyyy*v127 + D_xxxyyz*v128 + D_xxxyz*v87 + &
      D_xxxyzz*v129 + D_xxxz*v67 + D_xxxzz*v88 + D_xxxzzz*v130 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + D_xz* &
      M_z + M_xyy*v89 + M_xyyy*v90 + M_xyyyy*v91 + M_xyyyz*v92 + M_xyyz &
      *v93 + M_xyyzz*v94 + M_xyzz*v80 + M_xyzzz*v81 + M_xzz*v95 + &
      M_xzzz*v96 + M_xzzzz*v97 + M_yy*v131 + M_yyy*v132 + M_yyyy*v133 + &
      M_yyyyy*v134 + M_yyyyz*v135 + M_yyyz*v136 + M_yyyzz*v137 + M_yyz* &
      v138 + M_yyzz*v139 + M_yyzzz*v140 + M_yzz*v116 + M_yzzz*v117 + &
      M_yzzzz*v118 + M_zz*v141 + M_zzz*v142 + M_zzzz*v143 + M_zzzzz* &
      v144)
    L_xz     = L_xz + (D_xxxxxz*v83 + D_xxxxyz*v84 + D_xxxxz*v65 + D_xxxxzz*v85 + D_xxxyyz*v86 &
      + D_xxxyz*v66 + D_xxxyzz*v87 + D_xxxz*v57 + D_xxxzz*v67 + &
      D_xxxzzz*v88 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz* &
      M_xz + D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + M_xyy*v93 &
      + M_xyyy*v92 + M_xyyz*v76 + M_xyzz*v82 + M_xzz*v98 + M_xzzz*v99 + &
      M_yy*v138 + M_yyy*v136 + M_yyyy*v135 + M_yyyz*v145 + M_yyz*v107 + &
      M_yyzz*v146 + M_yzz*v119 + M_yzzz*v120 + M_zz*v147 + M_zzz*v148 + &
      M_zzzz*v149)
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v74)
    L_yyyyyy = L_yyyyyy + (D_yyyyyy*M_0)
    D_yyyyyz = v101*v56
    L_yyyyy  = L_yyyyy + (D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z)
    L_yyyyyz = L_yyyyyz + (D_yyyyyz*M_0)
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    v151     = 0.5d0*D_yyyyzz
    L_yyyy   = L_yyyy + (D_xxyyyy*v57 + D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*v150 + D_yyyyyz*M_yz + D_yyyyz*M_z + &
      M_zz*v151)
    L_yyyyz  = L_yyyyz + (D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z)
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    v155     = 0.166666666666667d0*D_yyyzzz
    v156     = 0.5d0*D_yyyzzz
    L_yyy    = L_yyy + (D_xxxyyy*v65 + D_xxyyy*v57 + D_xxyyyy*v66 + D_xxyyyz*v67 + D_xyyy*M_x + &
      D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy &
      *M_y + D_yyyyy*v150 + D_yyyyyy*v152 + D_yyyyyz*v153 + D_yyyyz* &
      M_yz + D_yyyz*M_z + M_xyy*v102 + M_xzz*v103 + M_yzz*v151 + M_zz* &
      v154 + M_zzz*v155)
    L_yyyz   = L_yyyz + (D_xxyyyz*v57 + D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyz* &
      v150 + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + D_yyyzz*M_z + &
      M_zz*v156)
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    v162     = 0.0416666666666667d0*D_yyzzzz
    v164     = 0.166666666666667d0*D_yyzzzz
    L_yy     = L_yy + (D_xxxxyy*v83 + D_xxxyy*v65 + D_xxxyyy*v84 + D_xxxyyz*v85 + D_xxyy*v57 + &
      D_xxyyy*v66 + D_xxyyyy*v86 + D_xxyyyz*v87 + D_xxyyz*v67 + &
      D_xxyyzz*v88 + D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz* &
      M_xz + D_yy*M_0 + D_yyy*M_y + D_yyyy*v150 + D_yyyyy*v152 + &
      D_yyyyyy*v157 + D_yyyyyz*v158 + D_yyyyz*v153 + D_yyyyzz*v159 + &
      D_yyyz*M_yz + D_yyz*M_z + M_xyy*v104 + M_xyyy*v105 + M_xyyz*v106 &
      + M_xyzz*v103 + M_xzz*v107 + M_xzzz*v108 + M_yzz*v154 + M_yzzz* &
      v155 + M_zz*v160 + M_zzz*v161 + M_zzzz*v162)
    L_yyz    = L_yyz + (D_xxxyyz*v65 + D_xxyyyz*v66 + D_xxyyz*v57 + D_xxyyzz*v67 + D_xyyyz*M_xy &
      + D_xyyyzz*M_xyz + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyyz*v152 + &
      D_yyyyz*v150 + D_yyyyzz*v153 + D_yyyz*M_y + D_yyyzz*M_yz + D_yyz* &
      M_0 + D_yyzz*M_z + M_xyy*v106 + M_xzz*v109 + M_yzz*v156 + M_zz* &
      v163 + M_zzz*v164)
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    v172     = 0.00833333333333333d0*D_yzzzzz
    v175     = 0.0416666666666667d0*D_yzzzzz
    L_y      = L_y + (D_xxxxxy*v121 + D_xxxxy*v83 + D_xxxxyy*v122 + D_xxxxyz*v123 + D_xxxy*v65 &
      + D_xxxyy*v84 + D_xxxyyy*v124 + D_xxxyyz*v125 + D_xxxyz*v85 + &
      D_xxxyzz*v126 + D_xxy*v57 + D_xxyy*v66 + D_xxyyy*v86 + D_xxyyyy* &
      v127 + D_xxyyyz*v128 + D_xxyyz*v87 + D_xxyyzz*v129 + D_xxyz*v67 + &
      D_xxyzz*v88 + D_xxyzzz*v130 + D_xy*M_x + D_xyy*M_xy + D_xyyz* &
      M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v150 + D_yyyy* &
      v152 + D_yyyyy*v157 + D_yyyyyy*v165 + D_yyyyyz*v166 + D_yyyyz* &
      v158 + D_yyyyzz*v167 + D_yyyz*v153 + D_yyyzz*v159 + D_yyyzzz*v168 &
      + D_yyz*M_yz + D_yz*M_z + M_xyy*v110 + M_xyyy*v111 + M_xyyyy*v112 &
      + M_xyyyz*v113 + M_xyyz*v114 + M_xyyzz*v115 + M_xyzz*v107 + &
      M_xyzzz*v108 + M_xzz*v116 + M_xzzz*v117 + M_xzzzz*v118 + M_yzz* &
      v160 + M_yzzz*v161 + M_yzzzz*v162 + M_zz*v169 + M_zzz*v170 + &
      M_zzzz*v171 + M_zzzzz*v172)
    L_yz     = L_yz + (D_xxxxyz*v83 + D_xxxyyz*v84 + D_xxxyz*v65 + D_xxxyzz*v85 + D_xxyyyz*v86 &
      + D_xxyyz*v66 + D_xxyyzz*v87 + D_xxyz*v57 + D_xxyzz*v67 + &
      D_xxyzzz*v88 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz* &
      M_xz + D_yyyyyz*v157 + D_yyyyz*v152 + D_yyyyzz*v158 + D_yyyz*v150 &
      + D_yyyzz*v153 + D_yyyzzz*v159 + D_yyz*M_y + D_yyzz*M_yz + D_yz* &
      M_0 + D_yzz*M_z + M_xyy*v114 + M_xyyy*v113 + M_xyyz*v103 + M_xyzz &
      *v109 + M_xzz*v119 + M_xzzz*v120 + M_yzz*v163 + M_yzzz*v164 + &
      M_zz*v173 + M_zzz*v174 + M_zzzz*v175)
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = L_0 + (0.00138888888888889d0*(D_xxxxxx*M_xxxxxx + 30.0d0*D_xxxxyz*M_xxxxyz + &
      90.0d0*D_xxyyzz*M_xxyyzz + D_yyyyyy*M_yyyyyy + D_zzzzzz*M_zzzzzz &
      + 6.0d0*(D_xxxxxy*M_xxxxxy + D_xxxxxz*M_xxxxxz + D_yyyyyz* &
      M_yyyyyz) + 20.0d0*(D_xxxyyy*M_xxxyyy + D_xxxzzz*M_xxxzzz + &
      D_yyyzzz*M_yyyzzz) + 60.0d0*(D_xxxyyz*M_xxxyyz + D_xxxyzz* &
      M_xxxyzz + D_xxyyyz*M_xxyyyz + D_xxyzzz*M_xxyzzz) + 15.0d0*( &
      D_xxxxyy*M_xxxxyy + D_xxxxzz*M_xxxxzz + D_xxyyyy*M_xxyyyy + &
      D_xxzzzz*M_xxzzzz + D_yyyyzz*M_yyyyzz + D_yyzzzz*M_yyzzzz)) + D_0 &
      *M_0 + D_x*M_x + D_xx*v57 + D_xxx*v65 + D_xxxx*v83 + D_xxxxx*v121 &
      + D_xxxxy*v122 + D_xxxxz*v123 + D_xxxy*v84 + D_xxxyy*v124 + &
      D_xxxyz*v125 + D_xxxz*v85 + D_xxxzz*v126 + D_xxy*v66 + D_xxyy*v86 &
      + D_xxyyy*v127 + D_xxyyz*v128 + D_xxyz*v87 + D_xxyzz*v129 + D_xxz &
      *v67 + D_xxzz*v88 + D_xxzzz*v130 + D_xy*M_xy + D_xyz*M_xyz + D_xz &
      *M_xz + D_y*M_y + D_yy*v150 + D_yyy*v152 + D_yyyy*v157 + D_yyyyy* &
      v165 + D_yyyyz*v166 + D_yyyz*v158 + D_yyyzz*v167 + D_yyz*v153 + &
      D_yyzz*v159 + D_yyzzz*v168 + D_yz*M_yz + D_z*M_z + D_zz*v176 + &
      D_zzz*v177 + D_zzzz*v178 + D_zzzzz*v179 + M_xyy*v131 + M_xyyy* &
      v132 + M_xyyyy*v133 + M_xyyyyy*v134 + M_xyyyyz*v135 + M_xyyyz* &
      v136 + M_xyyyzz*v137 + M_xyyz*v138 + M_xyyzz*v139 + M_xyyzzz*v140 &
      + M_xyzz*v116 + M_xyzzz*v117 + M_xyzzzz*v118 + M_xzz*v141 + &
      M_xzzz*v142 + M_xzzzz*v143 + M_xzzzzz*v144 + M_yzz*v169 + M_yzzz* &
      v170 + M_yzzzz*v171 + M_yzzzzz*v172)
    L_z      = L_z + (D_xxxxxz*v121 + D_xxxxyz*v122 + D_xxxxz*v83 + D_xxxxzz*v123 + D_xxxyyz* &
      v124 + D_xxxyz*v84 + D_xxxyzz*v125 + D_xxxz*v65 + D_xxxzz*v85 + &
      D_xxxzzz*v126 + D_xxyyyz*v127 + D_xxyyz*v86 + D_xxyyzz*v128 + &
      D_xxyz*v66 + D_xxyzz*v87 + D_xxyzzz*v129 + D_xxz*v57 + D_xxzz*v67 &
      + D_xxzzz*v88 + D_xxzzzz*v130 + D_xyz*M_xy + D_xyzz*M_xyz + D_xz* &
      M_x + D_xzz*M_xz + D_yyyyyz*v165 + D_yyyyz*v157 + D_yyyyzz*v166 + &
      D_yyyz*v152 + D_yyyzz*v158 + D_yyyzzz*v167 + D_yyz*v150 + D_yyzz* &
      v153 + D_yyzzz*v159 + D_yyzzzz*v168 + D_yz*M_y + D_yzz*M_yz + D_z &
      *M_0 + D_zz*M_z + D_zzz*v176 + D_zzzz*v177 + D_zzzzz*v178 + &
      D_zzzzzz*v179 + M_xyy*v138 + M_xyyy*v136 + M_xyyyy*v135 + M_xyyyz &
      *v145 + M_xyyz*v107 + M_xyyzz*v146 + M_xyzz*v119 + M_xyzzz*v120 + &
      M_xzz*v147 + M_xzzz*v148 + M_xzzzz*v149 + M_yzz*v173 + M_yzzz* &
      v174 + M_yzzzz*v175)
#undef  M_0                 
#undef  L_0                 
#undef  z                   
#undef  y                   
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
#undef  L_xz                
#undef  M_xz                
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
#undef  M_yyy               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_yyz               
#undef  L_xxxx              
#undef  M_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  M_xxyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xyyz              
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
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  L_xxxxxz            
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxxyz            
#undef  L_xxxyyy            
#undef  M_xxxyyy            
#undef  M_xxxyyz            
#undef  L_xxxyyz            
#undef  M_xxyyyy            
#undef  L_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
    end subroutine mom_es_M2L_add
    
! OPS  390*ADD + 2*DIV + 462*MUL + 35*NEG + POW = 890  (2242 before optimization)
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
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v183, v19, v2, v20, v21, v22, v23, v24,&
                v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
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
                L_zzzzzz
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
#define L_xxxyz              L(29)
#define Ls_xxxyz             Ls(29)
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
#define Ls_xxxxxx            Ls(36)
#define L_xxxxxx             L(36)
#define L_xxxxxy             L(37)
#define Ls_xxxxxy            Ls(37)
#define Ls_xxxxxz            Ls(38)
#define L_xxxxxz             L(38)
#define Ls_xxxxyy            Ls(39)
#define L_xxxxyy             L(39)
#define Ls_xxxxyz            Ls(40)
#define L_xxxxyz             L(40)
#define Ls_xxxyyy            Ls(41)
#define L_xxxyyy             L(41)
#define Ls_xxxyyz            Ls(42)
#define L_xxxyyz             L(42)
#define Ls_xxyyyy            Ls(43)
#define L_xxyyyy             L(43)
#define Ls_xxyyyz            Ls(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define Ls_xyyyyy            Ls(45)
#define L_xyyyyz             L(46)
#define Ls_xyyyyz            Ls(46)
#define L_yyyyyy             L(47)
#define Ls_yyyyyy            Ls(47)
#define Ls_yyyyyz            Ls(48)
#define L_yyyyyz             L(48)
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
    v73       = 0.166666666666667d0*x
    v83       = L_xyyyz*z
    v86       = v7*y
    v89       = L_xyyz*z
    v100      = L_xyz*z
    v116      = L_xz*z
    v132      = 0.0416666666666667d0*x
    v144      = L_yyyyz*z
    v147      = L_yyyz*z
    v150      = 0.5d0*y
    v154      = L_yyz*z
    v159      = 0.166666666666667d0*y
    v165      = L_yz*z
    v173      = 0.0416666666666667d0*y
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
    v135      = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v175      = L_yzz*z
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    v76       = L_xxzz*z
    L_xyzz    = -(L_xxxy + L_xyyy)
    v109      = L_xyzz*z
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    v161      = L_yyzz*z
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    v38       = L_xxxzz*z
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    v55       = L_xxyzz*z
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    v96       = L_xyyzz*z
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    v152      = L_yyyzz*z
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
    v87       = L_xyyyz + L_xyyyzz*z
    v88       = L_xyyyyz*y + v87
    v99       = v87*y
    Ls_xyyyz  = Ls_xyyyz + (L_xxyyyz*x + v88)
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    v146      = L_yyyyz + L_yyyyzz*z
    Ls_yyyyz  = Ls_yyyyz + (v146 + L_xyyyyz*x + L_yyyyyz*y)
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
    v72       = 0.25d0*v11
    v131      = 0.0833333333333333d0*v11
    a3        = a1*a2
    v26       = a3
    v27       = 0.166666666666667d0*v26
    v130      = 0.0833333333333333d0*v26
    a4        = a2*a2
    v60       = a4
    v61       = 0.0416666666666667d0*v60
    a5        = a2*a3
    v117      = 0.00833333333333333d0*a5
    a6        = a3*a3
    b2        = b1*b1
    v13       = b2
    v14       = L_xxxxyy*v13
    v20       = L_xxxyyy*v13
    v33       = 0.5d0*v13
    v39       = L_xxxyyz*v13
    v43       = L_xxyyyy*v13
    v56       = L_xxyyyz*v13
    v74       = 3.0d0*v13
    v84       = L_xyyyyy*v13
    v97       = L_xyyyyz*v13
    v158      = 0.25d0*v13
    v172      = 0.0833333333333333d0*v13
    b3        = b1*b2
    v28       = b3
    v29       = L_xxxyyy*v28
    v49       = L_xxyyyy*v28
    v68       = 0.166666666666667d0*v28
    v77       = L_xxyyyz*v28
    v90       = L_xyyyyy*v28
    v110      = L_xyyyyz*v28
    v133      = 4.0d0*v28
    v171      = 0.0833333333333333d0*v28
    b4        = b2*b2
    v62       = b4
    v63       = L_xxyyyy*v62
    v101      = L_xyyyyy*v62
    v125      = 0.0416666666666667d0*v62
    v136      = L_xyyyyz*v62
    b5        = b2*b3
    v118      = b5
    v119      = L_xyyyyy*v118
    v166      = 0.00833333333333333d0*v118
    b6        = b3*b3
    c2        = c1*c1
    v15       = c2
    v180      = 0.5d0*v15
    v120      = L_xzz*v15
    v167      = L_yzz*v15
    v64       = L_xxzz*v15
    v102      = L_xyzz*v15
    v137      = L_xzzz*v15
    v155      = L_yyzz*v15
    v176      = L_yzzz*v15
    v30       = L_xxxzz*v15
    v50       = L_xxyzz*v15
    v78       = L_xxzzz*v15
    v91       = L_xyyzz*v15
    v111      = L_xyzzz*v15
    v148      = L_yyyzz*v15
    v162      = L_yyzzz*v15
    v16       = L_xxxxzz*v15
    v37       = v14 + v16 + 2.0d0*(L_xxxx + v10 + v17)
    Ls_xxxx   = Ls_xxxx + (0.5d0*(v14 + v16) + L_xxxx + L_xxxxxx*v12 + v0*x + v10 + v17)
    v21       = L_xxxyzz*v15
    v34       = v21 + 2.0d0*(L_xxxy + v19)
    v35       = v34*y
    v54       = 2.0d0*v22 + v20 + v34
    Ls_xxxy   = Ls_xxxy + (0.5d0*(v20 + v21) + L_xxxxxy*v12 + L_xxxy + v19 + v2*x + v22)
    v40       = L_xxxzzz*v15
    v82       = v39 + v40 + 2.0d0*(L_xxxz + v38 + v41)
    Ls_xxxz   = Ls_xxxz + (0.5d0*(v39 + v40) + L_xxxxxz*v12 + L_xxxz + v18*x + v38 + v41)
    v44       = L_xxyyzz*v15
    v52       = v44 + 2.0d0*(L_xxyy + v42)
    v53       = v52*y
    v69       = v13*v52
    v95       = 2.0d0*v45 + v43 + v52
    Ls_xxyy   = Ls_xxyy + (0.5d0*(v43 + v44) + L_xxxxyy*v12 + L_xxyy + v4*x + v42 + v45)
    v57       = L_xxyzzz*v15
    v80       = v57 + 2.0d0*(L_xxyz + v55)
    v81       = v80*y
    v115      = 2.0d0*v58 + v56 + v80
    Ls_xxyz   = Ls_xxyz + (0.5d0*(v56 + v57) + L_xxxxyz*v12 + L_xxyz + v24*x + v55 + v58)
    v85       = L_xyyyzz*v15
    v93       = v85 + 2.0d0*(L_xyyy + v83)
    v94       = v93*y
    v105      = v13*v93
    v126      = v28*v93
    Ls_xyyy   = Ls_xyyy + (0.5d0*(v84 + v85) + L_xxxyyy*v12 + L_xyyy + v6*x + v83 + v86)
    v98       = L_xyyzzz*v15
    v113      = v98 + 2.0d0*(L_xyyz + v96)
    v114      = v113*y
    v140      = v113*v13
    Ls_xyyz   = Ls_xyyz + (0.5d0*(v97 + v98) + L_xxxyyz*v12 + L_xyyz + v47*x + v96 + v99)
    v145      = L_yyyyzz*v15
    v151      = v145 + 2.0d0*(L_yyyy + v144)
    Ls_yyyy   = Ls_yyyy + (0.5d0*v145 + L_xxyyyy*v12 + L_yyyy + L_yyyyyy*v33 + v144 + v8*x + v9*y)
    v153      = L_yyyzzz*v15
    v164      = v153 + 2.0d0*(L_yyyz + v152)
    Ls_yyyz   = Ls_yyyz + (0.5d0*v153 + L_xxyyyz*v12 + L_yyyyyz*v33 + L_yyyz + v146*y + v152 + v88* &
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
    v181      = 0.166666666666667d0*v31
    v121      = L_xzzz*v31
    v168      = L_yzzz*v31
    v65       = L_xxzzz*v31
    v103      = L_xyzzz*v31
    v138      = L_xzzzz*v31
    v156      = L_yyzzz*v31
    v177      = L_yzzzz*v31
    v32       = L_xxxzzz*v31
    v75       = v29 + v32 + v3*v74 + 6.0d0*(L_xxx + v25) + 3.0d0*(v30 + v35)
    Ls_xxx    = Ls_xxx + (0.166666666666667d0*(v29 + v32 + 3.0d0*(v30 + v35)) + L_xxx + L_xxxxxx* &
      v27 + v0*v12 + v25 + v3*v33 + v36*v37)
    v51       = L_xxyzzz*v31
    v70       = v51 + 3.0d0*(2.0d0*L_xxy + 2.0d0*v48 + v50)
    v71       = v70*y
    v108      = v49 + v70 + v5*v74 + 3.0d0*v53
    Ls_xxy    = Ls_xxy + (0.166666666666667d0*(v49 + v51 + 3.0d0*(v50 + v53)) + L_xxxxxy*v27 + &
      L_xxy + v12*v2 + v33*v5 + v36*v54 + v48)
    v79       = L_xxzzzz*v31
    v143      = v77 + v79 + v46*v74 + 6.0d0*(L_xxz + v76) + 3.0d0*(v78 + v81)
    Ls_xxz    = Ls_xxz + (0.166666666666667d0*(v77 + v79 + 3.0d0*(v78 + v81)) + L_xxxxxz*v27 + &
      L_xxz + v12*v18 + v33*v46 + v36*v82 + v76)
    v92       = L_xyyzzz*v31
    v106      = v92 + 3.0d0*(2.0d0*L_xyy + 2.0d0*v89 + v91)
    v107      = v106*y
    v127      = v106*v13
    Ls_xyy    = Ls_xyy + (0.166666666666667d0*(v90 + v92 + 3.0d0*(v91 + v94)) + L_xxxxyy*v27 + &
      L_xyy + v12*v4 + v33*v7 + v36*v95 + v89)
    v112      = L_xyzzzz*v31
    v141      = v112 + 3.0d0*(2.0d0*L_xyz + 2.0d0*v109 + v111)
    v142      = v141*y
    Ls_xyz    = Ls_xyz + (0.166666666666667d0*(v110 + v112 + 3.0d0*(v111 + v114)) + L_xxxxyz*v27 + &
      L_xyz + v109 + v115*v36 + v12*v24 + v33*v87)
    v149      = L_yyyzzz*v31
    v160      = v149 + 3.0d0*(2.0d0*L_yyy + 2.0d0*v147 + v148)
    Ls_yyy    = Ls_yyy + (0.166666666666667d0*(3.0d0*v148 + v149) + L_xxxyyy*v27 + L_yyy + &
      L_yyyyyy*v68 + v12*v6 + v147 + v150*v151 + v33*v9 + v36*(v84 + &
      2.0d0*v86 + v93))
    v163      = L_yyzzzz*v31
    v179      = v163 + 3.0d0*(2.0d0*L_yyz + 2.0d0*v161 + v162)
    Ls_yyz    = Ls_yyz + (0.166666666666667d0*(3.0d0*v162 + v163) + L_xxxyyz*v27 + L_yyyyyz*v68 + &
      L_yyz + v12*v47 + v146*v33 + v150*v164 + v161 + v36*(v113 + v97 + &
      2.0d0*v99))
    c4        = c2*c2
    v66       = c4
    v182      = 0.0416666666666667d0*v66
    v122      = L_xzzzz*v66
    v169      = L_yzzzz*v66
    v67       = L_xxzzzz*v66
    v134      = v63 + v67 + v133*v5 + 12.0d0*v64 + 6.0d0*v69 + 24.0d0*(L_xx + v59) + &
      4.0d0*(v65 + v71)
    Ls_xx     = Ls_xx + (0.0416666666666667d0*(v63 + 12.0d0*v64 + v67 + 6.0d0*v69 + 4.0d0*(v65 + &
      v71)) + L_xx + L_xxxxxx*v61 + v0*v27 + v37*v72 + v5*v68 + v59 + &
      v73*v75)
    v104      = L_xyzzzz*v66
    v128      = v104 + 12.0d0*v102 + 4.0d0*(6.0d0*L_xy + 6.0d0*v100 + v103)
    v129      = v128*y
    Ls_xy     = Ls_xy + (0.0416666666666667d0*(v101 + 12.0d0*v102 + v104 + 6.0d0*v105 + 4.0d0*( &
      v103 + v107)) + L_xxxxxy*v61 + L_xy + v100 + v108*v73 + v2*v27 + &
      v54*v72 + v68*v7)
    v139      = L_xzzzzz*v66
    Ls_xz     = Ls_xz + (0.0416666666666667d0*(v136 + 12.0d0*v137 + v139 + 6.0d0*v140 + 4.0d0*( &
      v138 + v142)) + L_xxxxxz*v61 + L_xz + v135 + v143*v73 + v18*v27 + &
      v68*v87 + v72*v82)
    v157      = L_yyzzzz*v66
    v174      = v157 + 12.0d0*v155 + 4.0d0*(6.0d0*L_yy + 6.0d0*v154 + v156)
    Ls_yy     = Ls_yy + (0.0416666666666667d0*(12.0d0*v155 + 4.0d0*v156 + v157) + L_xxxxyy*v61 + &
      L_yy + L_yyyyyy*v125 + v151*v158 + v154 + v159*v160 + v27*v4 + &
      v68*v9 + v72*v95 + v73*(v106 + v7*v74 + v90 + 3.0d0*v94))
    v178      = L_yzzzzz*v66
    Ls_yz     = Ls_yz + (0.0416666666666667d0*(12.0d0*v176 + 4.0d0*v177 + v178) + L_xxxxyz*v61 + &
      L_yyyyyz*v125 + L_yz + v115*v72 + v146*v68 + v158*v164 + v159* &
      v179 + v175 + v24*v27 + v73*(v110 + 3.0d0*v114 + v141 + v74*v87))
    c5        = c2*c3
    v123      = c5
    v183      = 0.00833333333333333d0*v123
    v124      = L_xzzzzz*v123
    Ls_x      = Ls_x + (0.00833333333333333d0*(v119 + 60.0d0*v120 + 20.0d0*v121 + v124 + 5.0d0*( &
      v122 + v129) + 10.0d0*(v126 + v127)) + L_x + L_xxxxxx*v117 + v0* &
      v61 + v116 + v125*v7 + v130*v37 + v131*v75 + v132*v134)
    v170      = L_yzzzzz*v123
    Ls_y      = Ls_y + (0.00833333333333333d0*(60.0d0*v167 + 20.0d0*v168 + 5.0d0*v169 + v170) + &
      L_xxxxxy*v117 + L_y + L_yyyyyy*v166 + v108*v131 + v125*v9 + v130* &
      v54 + v132*(v101 + 6.0d0*v105 + 4.0d0*v107 + v128 + v133*v7) + &
      v151*v171 + v160*v172 + v165 + v173*v174 + v2*v61)
    Ls_z      = Ls_z + (L_z + L_xxxxxz*v117 + L_yyyyyz*v166 + L_zz*z + L_zzz*v180 + L_zzzz*v181 &
      + L_zzzzz*v182 + L_zzzzzz*v183 + v125*v146 + v130*v82 + v131*v143 &
      + v132*(24.0d0*L_xz + v133*v87 + 24.0d0*v135 + v136 + 12.0d0*v137 &
      + 4.0d0*v138 + v139 + 6.0d0*v140 + 4.0d0*v142) + v164*v171 + v172 &
      *v179 + v173*(24.0d0*L_yz + 24.0d0*v175 + 12.0d0*v176 + 4.0d0* &
      v177 + v178) + v18*v61)
    c6        = c3*c3
    Ls_0      = Ls_0 + (0.00138888888888889d0*(L_xxxxxx*a6 + L_yyyyyy*b6 + L_zzzzzz*c6 + 20.0d0* &
      (v160*v28 + v26*v75) + 6.0d0*(x*(120.0d0*L_x + 120.0d0*v116 + &
      v119 + 60.0d0*v120 + 20.0d0*v121 + 5.0d0*v122 + v124 + 10.0d0* &
      v126 + 10.0d0*v127 + 5.0d0*v129 + 5.0d0*v62*v7) + y*(120.0d0*L_y &
      + 120.0d0*v165 + 60.0d0*v167 + 20.0d0*v168 + 5.0d0*v169 + v170)) &
      + 15.0d0*(v11*v134 + v13*v174 + v151*v62 + v37*v60)) + L_0 + L_z* &
      z + L_zz*v180 + L_zzz*v181 + L_zzzz*v182 + L_zzzzz*v183 + v0*v117 &
      + v166*v9)
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
    
! OPS  711*ADD + 2*DIV + 1014*MUL + 87*NEG + POW + 20*SUB = 1835  (2376 before optimization)
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
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v183, v184, v185, v186, v187, v188,&
                v189, v19, v190, v191, v192, v193, v194, v195, v196, v2, v20,&
                v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31,&
                v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42,&
                v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53,&
                v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64,&
                v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75,&
                v76, v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86,&
                v87, v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97,&
                v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy,&
                D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy,&
                D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz,&
                D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy, D_yyyz,&
                D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy,&
                D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy,&
                D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz,&
                D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy, D_xxxxxz,&
                D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz, D_xxxyzz,&
                D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz, D_xxzzzz,&
                D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz, D_xzzzzz,&
                D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz, D_yzzzzz,&
                D_zzzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz,&
                M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz,&
                M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define y                    r(1:2,2)
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
#define L_xz                 L(1:2,6)
#define M_xz                 M(1:2,6)
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
#define M_yyy                M(1:2,14)
#define L_yyy                L(1:2,14)
#define L_yyz                L(1:2,15)
#define M_yyz                M(1:2,15)
#define L_xxxx               L(1:2,16)
#define M_xxxx               M(1:2,16)
#define M_xxxy               M(1:2,17)
#define L_xxxy               L(1:2,17)
#define L_xxxz               L(1:2,18)
#define M_xxxz               M(1:2,18)
#define M_xxyy               M(1:2,19)
#define L_xxyy               L(1:2,19)
#define M_xxyz               M(1:2,20)
#define L_xxyz               L(1:2,20)
#define L_xyyy               L(1:2,21)
#define M_xyyy               M(1:2,21)
#define M_xyyz               M(1:2,22)
#define L_xyyz               L(1:2,22)
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
#define L_xxxxxx             L(1:2,36)
#define M_xxxxxx             M(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define M_xxxxxy             M(1:2,37)
#define L_xxxxxz             L(1:2,38)
#define M_xxxxxz             M(1:2,38)
#define M_xxxxyy             M(1:2,39)
#define L_xxxxyy             L(1:2,39)
#define L_xxxxyz             L(1:2,40)
#define M_xxxxyz             M(1:2,40)
#define L_xxxyyy             L(1:2,41)
#define M_xxxyyy             M(1:2,41)
#define M_xxxyyz             M(1:2,42)
#define L_xxxyyz             L(1:2,42)
#define M_xxyyyy             M(1:2,43)
#define L_xxyyyy             L(1:2,43)
#define M_xxyyyz             M(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define L_xyyyyy             L(1:2,45)
#define M_xyyyyy             M(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define M_xyyyyz             M(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define M_yyyyyy             M(1:2,47)
#define M_yyyyyz             M(1:2,48)
#define L_yyyyyz             L(1:2,48)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v194     = y*z
    v188     = 15.0d0*v194
    v190     = x*y
    v192     = v194
    v57      = 0.5d0*M_xx
    v65      = 0.166666666666667d0*M_xxx
    v66      = 0.5d0*M_xxy
    v67      = 0.5d0*M_xxz
    v83      = 0.0416666666666667d0*M_xxxx
    v84      = 0.166666666666667d0*M_xxxy
    v85      = 0.166666666666667d0*M_xxxz
    v86      = 0.25d0*M_xxyy
    v87      = 0.5d0*M_xxyz
    v121     = 0.00833333333333333d0*M_xxxxx
    v122     = 0.0416666666666667d0*M_xxxxy
    v123     = 0.0416666666666667d0*M_xxxxz
    v124     = 0.0833333333333333d0*M_xxxyy
    v125     = 0.166666666666667d0*M_xxxyz
    v127     = 0.0833333333333333d0*M_xxyyy
    v128     = 0.25d0*M_xxyyz
    v150     = 0.5d0*M_yy
    v152     = 0.166666666666667d0*M_yyy
    v153     = 0.5d0*M_yyz
    v157     = 0.0416666666666667d0*M_yyyy
    v158     = 0.166666666666667d0*M_yyyz
    v165     = 0.00833333333333333d0*M_yyyyy
    v166     = 0.0416666666666667d0*M_yyyyz
    M_zz     = -(M_xx + M_yy)
    v176     = 0.5d0*M_zz
    M_xzz    = -(M_xxx + M_xyy)
    M_yzz    = -(M_xxy + M_yyy)
    M_zzz    = -(M_xxz + M_yyz)
    v177     = 0.166666666666667d0*M_zzz
    M_xxzz   = -(M_xxxx + M_xxyy)
    v88      = 0.25d0*M_xxzz
    M_xyzz   = -(M_xxxy + M_xyyy)
    M_xzzz   = -(M_xxxz + M_xyyz)
    M_yyzz   = -(M_xxyy + M_yyyy)
    v159     = 0.25d0*M_yyzz
    M_yzzz   = -(M_xxyz + M_yyyz)
    M_zzzz   = -(M_xxzz + M_yyzz)
    v178     = 0.0416666666666667d0*M_zzzz
    M_xxxzz  = -(M_xxxxx + M_xxxyy)
    v126     = 0.0833333333333333d0*M_xxxzz
    M_xxyzz  = -(M_xxxxy + M_xxyyy)
    v129     = 0.25d0*M_xxyzz
    M_xxzzz  = -(M_xxxxz + M_xxyyz)
    v130     = 0.0833333333333333d0*M_xxzzz
    M_xyyzz  = -(M_xxxyy + M_xyyyy)
    M_xyzzz  = -(M_xxxyz + M_xyyyz)
    M_xzzzz  = -(M_xxxzz + M_xyyzz)
    M_yyyzz  = -(M_xxyyy + M_yyyyy)
    v167     = 0.0833333333333333d0*M_yyyzz
    M_yyzzz  = -(M_xxyyz + M_yyyyz)
    v168     = 0.0833333333333333d0*M_yyzzz
    M_yzzzz  = -(M_xxyzz + M_yyyzz)
    M_zzzzz  = -(M_xxzzz + M_yyzzz)
    v179     = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz = -(M_xxxxxx + M_xxxxyy)
    M_xxxyzz = -(M_xxxxxy + M_xxxyyy)
    M_xxxzzz = -(M_xxxxxz + M_xxxyyz)
    M_xxyyzz = -(M_xxxxyy + M_xxyyyy)
    M_xxyzzz = -(M_xxxxyz + M_xxyyyz)
    M_xxzzzz = -(M_xxxxzz + M_xxyyzz)
    M_xyyyzz = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz = -(M_xxyyyy + M_yyyyyy)
    M_yyyzzz = -(M_xxyyyz + M_yyyyyz)
    M_yyzzzz = -(M_xxyyzz + M_yyyyzz)
    M_yzzzzz = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz = -(M_xxzzzz + M_yyzzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v180     = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v180
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v181     = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v181
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v100     = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v182     = 3.0d0*h
    v183     = h*v0
    v184     = h*v1
    v193     = 21.0d0*h
    v4       = -h
    v12      = v182
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v183
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v184
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 + 630.0d0*v183 - 945.0d0*v19
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 + 630.0d0*v184 - 945.0d0*v31
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
    D_0      = u
    u3       = u*u2
    v2       = u3
    D_x      = -v2*x
    D_y      = -v2*y
    D_z      = -v2*z
    u4       = u2*u2
    u5       = u2*u3
    v3       = u5
    v185     = 3.0d0*v3
    v6       = v185*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v185*v192
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v186     = 3.0d0*v8
    v9       = v8*x
    v11      = v186*(h - v10)
    D_xxx    = -3.0d0*v9*(v180 - v182)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    v131     = 0.5d0*D_xyy
    D_xyz    = -v188*v9
    D_xzz    = -(D_xxx + D_xyy)
    v141     = 0.5d0*D_xzz
    D_yyy    = v186*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    v169     = 0.5d0*D_yzz
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v187     = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v187*y
    v26      = v187*z
    v28      = v15*v188
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v89      = 0.5d0*D_xxyy
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    v95      = 0.5d0*D_xxzz
    D_xyyy   = v22*v30
    v110     = 0.5d0*D_xyyy
    v132     = 0.166666666666667d0*D_xyyy
    D_xyyz   = v26*(v29 + v4)
    v138     = 0.5d0*D_xyyz
    D_xyzz   = -(D_xxxy + D_xyyy)
    v116     = 0.5d0*D_xyzz
    D_xzzz   = -(D_xxxz + D_xyyz)
    v142     = 0.166666666666667d0*D_xzzz
    v147     = 0.5d0*D_xzzz
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    v160     = 0.5d0*D_yyzz
    D_yzzz   = -(D_xxyz + D_yyyz)
    v170     = 0.166666666666667d0*D_yzzz
    v173     = 0.5d0*D_yzzz
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v195     = v34*z
    v189     = 15.0d0*v34
    v35      = v189*x
    v39      = v195
    v41      = 315.0d0*v190*v195
    v42      = v189*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy  = v34*v38*y
    D_xxxxz  = v38*v39
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    v68      = 0.5d0*D_xxxyy
    D_xxxyz  = v41*(h - v5)
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    v71      = 0.5d0*D_xxxzz
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    v77      = 0.5d0*D_xxyyy
    v90      = 0.166666666666667d0*D_xxyyy
    D_xxyyz  = v39*(v36 - 945.0d0*v181 + 105.0d0*(v183 + v184))
    v93      = 0.5d0*D_xxyyz
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    v80      = 0.5d0*D_xxyzz
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    v96      = 0.166666666666667d0*D_xxzzz
    v98      = 0.5d0*D_xxzzz
    D_xyyyy  = v34*v43*x
    v104     = 0.5d0*D_xyyyy
    v111     = 0.166666666666667d0*D_xyyyy
    v133     = 0.0416666666666667d0*D_xyyyy
    D_xyyyz  = v41*(h - v7)
    v114     = 0.5d0*D_xyyyz
    v136     = 0.166666666666667d0*D_xyyyz
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    v107     = 0.5d0*D_xyyzz
    v139     = 0.25d0*D_xyyzz
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    v117     = 0.166666666666667d0*D_xyzzz
    v119     = 0.5d0*D_xyzzz
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    v143     = 0.0416666666666667d0*D_xzzzz
    v148     = 0.166666666666667d0*D_xzzzz
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz  = v39*v43
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    v154     = 0.5d0*D_yyyzz
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    v161     = 0.166666666666667d0*D_yyzzz
    v163     = 0.5d0*D_yyzzz
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    v171     = 0.0416666666666667d0*D_yzzzz
    v174     = 0.166666666666667d0*D_yzzzz
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v196     = 315.0d0*v44
    v191     = v196*x
    v45      = 45.0d0*v44
    v50      = v191*y
    v54      = v191*z
    v56      = v192*v196
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = v50*v53
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = v53*v54
    L_xxxxx  = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 + v17*v29 - v19*v193 + 14.0d0*v49)
    v58      = 0.5d0*D_xxxxyy
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxy  = D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    v59      = 0.5d0*D_xxxxzz
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v57 + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_yy*v58 + M_zz*v59
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945.0d0*v190*v44*(11.0d0*v27 + v17 + v60 + v61)
    v63      = 0.5d0*D_xxxyyy
    v69      = 0.166666666666667d0*D_xxxyyy
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = v54*(-9.0d0*v32 + v60 + v62)
    v70      = 0.5d0*D_xxxyyz
    L_xxxyy  = D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    v64      = 0.5d0*D_xxxyzz
    L_xxxy   = D_xxxxxy*v57 + D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyz*M_yz + D_xxxyz*M_z + M_yy*v63 + M_zz*v64
    L_xxxyz  = D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    v72      = 0.166666666666667d0*D_xxxzzz
    v73      = 0.5d0*D_xxxzzz
    L_xxx    = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v57 + D_xxxxxx*v65 + D_xxxxxy*v66 + &
      D_xxxxxz*v67 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxy*M_y + D_xxxyz*M_yz + D_xxxz*M_z + M_xyy*v58 + M_xzz*v59 + &
      M_yy*v68 + M_yyy*v69 + M_yyz*v70 + M_yzz*v64 + M_zz*v71 + M_zzz* &
      v72
    L_xxxz   = D_xxxxxz*v57 + D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz*M_y &
      + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_yy*v70 + M_zz*v73
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 + v17*v24 - v193*v31 + 14.0d0*v74)
    v75      = 0.5d0*D_xxyyyy
    v78      = 0.166666666666667d0*D_xxyyyy
    v91      = 0.0416666666666667d0*D_xxyyyy
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = v56*(-9.0d0*v20 + v61 + v62)
    v79      = 0.5d0*D_xxyyyz
    v92      = 0.166666666666667d0*D_xxyyyz
    L_xxyyy  = D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    v76      = 0.5d0*D_xxyyzz
    v94      = 0.25d0*D_xxyyzz
    L_xxyy   = D_xxxxyy*v57 + D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyz*M_yz + D_xxyyz*M_z + M_yy*v75 + M_zz*v76
    L_xxyyz  = D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    v81      = 0.166666666666667d0*D_xxyzzz
    v82      = 0.5d0*D_xxyzzz
    L_xxy    = D_xxxxxy*v65 + D_xxxxy*v57 + D_xxxxyy*v66 + D_xxxxyz*v67 + D_xxxy*M_x + &
      D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy &
      *M_y + D_xxyyz*M_yz + D_xxyz*M_z + M_xyy*v63 + M_xzz*v64 + M_yy* &
      v77 + M_yyy*v78 + M_yyz*v79 + M_yzz*v76 + M_zz*v80 + M_zzz*v81
    L_xxyz   = D_xxxxyz*v57 + D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz*M_y &
      + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_yy*v79 + M_zz*v82
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    v97      = 0.0416666666666667d0*D_xxzzzz
    v99      = 0.166666666666667d0*D_xxzzzz
    L_xx     = D_xx*M_0 + D_xxx*M_x + D_xxxx*v57 + D_xxxxx*v65 + D_xxxxxx*v83 + &
      D_xxxxxy*v84 + D_xxxxxz*v85 + D_xxxxy*v66 + D_xxxxyy*v86 + &
      D_xxxxyz*v87 + D_xxxxz*v67 + D_xxxxzz*v88 + D_xxxy*M_xy + D_xxxyz &
      *M_xyz + D_xxxz*M_xz + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + &
      M_xyy*v68 + M_xyyy*v69 + M_xyyz*v70 + M_xyzz*v64 + M_xzz*v71 + &
      M_xzzz*v72 + M_yy*v89 + M_yyy*v90 + M_yyyy*v91 + M_yyyz*v92 + &
      M_yyz*v93 + M_yyzz*v94 + M_yzz*v80 + M_yzzz*v81 + M_zz*v95 + &
      M_zzz*v96 + M_zzzz*v97
    L_xxz    = D_xxxxxz*v65 + D_xxxxyz*v66 + D_xxxxz*v57 + D_xxxxzz*v67 + D_xxxyz*M_xy &
      + D_xxxyzz*M_xyz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + &
      D_xxyzz*M_yz + D_xxz*M_0 + D_xxzz*M_z + M_xyy*v70 + M_xzz*v73 + &
      M_yy*v93 + M_yyy*v92 + M_yyz*v76 + M_yzz*v82 + M_zz*v98 + M_zzz* &
      v99
    D_xyyyyy = v101*v50
    v102     = 0.5d0*D_xyyyyy
    v105     = 0.166666666666667d0*D_xyyyyy
    v112     = 0.0416666666666667d0*D_xyyyyy
    v134     = 0.00833333333333333d0*D_xyyyyy
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = v54*(-18.0d0*v32 + v100 + v17)
    v106     = 0.5d0*D_xyyyyz
    v113     = 0.166666666666667d0*D_xyyyyz
    v135     = 0.0416666666666667d0*D_xyyyyz
    L_xyyyy  = D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    v103     = 0.5d0*D_xyyyzz
    v115     = 0.25d0*D_xyyyzz
    v137     = 0.0833333333333333d0*D_xyyyzz
    v145     = 0.166666666666667d0*D_xyyyzz
    L_xyyy   = D_xxxyyy*v57 + D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyz*M_yz + D_xyyyz*M_z + M_yy*v102 + M_zz* &
      v103
    L_xyyyz  = D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    v108     = 0.166666666666667d0*D_xyyzzz
    v109     = 0.5d0*D_xyyzzz
    v140     = 0.0833333333333333d0*D_xyyzzz
    v146     = 0.25d0*D_xyyzzz
    L_xyy    = D_xxxxyy*v65 + D_xxxyy*v57 + D_xxxyyy*v66 + D_xxxyyz*v67 + D_xxyy*M_x + &
      D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy &
      *M_y + D_xyyyz*M_yz + D_xyyz*M_z + M_xyy*v75 + M_xzz*v76 + M_yy* &
      v104 + M_yyy*v105 + M_yyz*v106 + M_yzz*v103 + M_zz*v107 + M_zzz* &
      v108
    L_xyyz   = D_xxxyyz*v57 + D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz*M_y &
      + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_yy*v106 + M_zz* &
      v109
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    v118     = 0.0416666666666667d0*D_xyzzzz
    v120     = 0.166666666666667d0*D_xyzzzz
    L_xy     = D_xxxxxy*v83 + D_xxxxy*v65 + D_xxxxyy*v84 + D_xxxxyz*v85 + D_xxxy*v57 + &
      D_xxxyy*v66 + D_xxxyyy*v86 + D_xxxyyz*v87 + D_xxxyz*v67 + &
      D_xxxyzz*v88 + D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz* &
      M_xz + D_xy*M_0 + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v77 &
      + M_xyyy*v78 + M_xyyz*v79 + M_xyzz*v76 + M_xzz*v80 + M_xzzz*v81 + &
      M_yy*v110 + M_yyy*v111 + M_yyyy*v112 + M_yyyz*v113 + M_yyz*v114 + &
      M_yyzz*v115 + M_yzz*v107 + M_yzzz*v108 + M_zz*v116 + M_zzz*v117 + &
      M_zzzz*v118
    L_xyz    = D_xxxxyz*v65 + D_xxxyyz*v66 + D_xxxyz*v57 + D_xxxyzz*v67 + D_xxyyz*M_xy &
      + D_xxyyzz*M_xyz + D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + &
      D_xyyzz*M_yz + D_xyz*M_0 + D_xyzz*M_z + M_xyy*v79 + M_xzz*v82 + &
      M_yy*v114 + M_yyy*v113 + M_yyz*v103 + M_yzz*v109 + M_zz*v119 + &
      M_zzz*v120
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    v144     = 0.00833333333333333d0*D_xzzzzz
    v149     = 0.0416666666666667d0*D_xzzzzz
    L_x      = D_x*M_0 + D_xx*M_x + D_xxx*v57 + D_xxxx*v65 + D_xxxxx*v83 + D_xxxxxx* &
      v121 + D_xxxxxy*v122 + D_xxxxxz*v123 + D_xxxxy*v84 + D_xxxxyy* &
      v124 + D_xxxxyz*v125 + D_xxxxz*v85 + D_xxxxzz*v126 + D_xxxy*v66 + &
      D_xxxyy*v86 + D_xxxyyy*v127 + D_xxxyyz*v128 + D_xxxyz*v87 + &
      D_xxxyzz*v129 + D_xxxz*v67 + D_xxxzz*v88 + D_xxxzzz*v130 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + D_xz* &
      M_z + M_xyy*v89 + M_xyyy*v90 + M_xyyyy*v91 + M_xyyyz*v92 + M_xyyz &
      *v93 + M_xyyzz*v94 + M_xyzz*v80 + M_xyzzz*v81 + M_xzz*v95 + &
      M_xzzz*v96 + M_xzzzz*v97 + M_yy*v131 + M_yyy*v132 + M_yyyy*v133 + &
      M_yyyyy*v134 + M_yyyyz*v135 + M_yyyz*v136 + M_yyyzz*v137 + M_yyz* &
      v138 + M_yyzz*v139 + M_yyzzz*v140 + M_yzz*v116 + M_yzzz*v117 + &
      M_yzzzz*v118 + M_zz*v141 + M_zzz*v142 + M_zzzz*v143 + M_zzzzz* &
      v144
    L_xz     = D_xxxxxz*v83 + D_xxxxyz*v84 + D_xxxxz*v65 + D_xxxxzz*v85 + D_xxxyyz*v86 &
      + D_xxxyz*v66 + D_xxxyzz*v87 + D_xxxz*v57 + D_xxxzz*v67 + &
      D_xxxzzz*v88 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz* &
      M_xz + D_xyz*M_y + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + M_xyy*v93 &
      + M_xyyy*v92 + M_xyyz*v76 + M_xyzz*v82 + M_xzz*v98 + M_xzzz*v99 + &
      M_yy*v138 + M_yyy*v136 + M_yyyy*v135 + M_yyyz*v145 + M_yyz*v107 + &
      M_yyzz*v146 + M_yzz*v119 + M_yzzz*v120 + M_zz*v147 + M_zzz*v148 + &
      M_zzzz*v149
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v74)
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = v101*v56
    L_yyyyy  = D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    v151     = 0.5d0*D_yyyyzz
    L_yyyy   = D_xxyyyy*v57 + D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*v150 + D_yyyyyz*M_yz + D_yyyyz*M_z + &
      M_zz*v151
    L_yyyyz  = D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    v155     = 0.166666666666667d0*D_yyyzzz
    v156     = 0.5d0*D_yyyzzz
    L_yyy    = D_xxxyyy*v65 + D_xxyyy*v57 + D_xxyyyy*v66 + D_xxyyyz*v67 + D_xyyy*M_x + &
      D_xyyyy*M_xy + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy &
      *M_y + D_yyyyy*v150 + D_yyyyyy*v152 + D_yyyyyz*v153 + D_yyyyz* &
      M_yz + D_yyyz*M_z + M_xyy*v102 + M_xzz*v103 + M_yzz*v151 + M_zz* &
      v154 + M_zzz*v155
    L_yyyz   = D_xxyyyz*v57 + D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyz* &
      v150 + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + D_yyyzz*M_z + &
      M_zz*v156
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    v162     = 0.0416666666666667d0*D_yyzzzz
    v164     = 0.166666666666667d0*D_yyzzzz
    L_yy     = D_xxxxyy*v83 + D_xxxyy*v65 + D_xxxyyy*v84 + D_xxxyyz*v85 + D_xxyy*v57 + &
      D_xxyyy*v66 + D_xxyyyy*v86 + D_xxyyyz*v87 + D_xxyyz*v67 + &
      D_xxyyzz*v88 + D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz* &
      M_xz + D_yy*M_0 + D_yyy*M_y + D_yyyy*v150 + D_yyyyy*v152 + &
      D_yyyyyy*v157 + D_yyyyyz*v158 + D_yyyyz*v153 + D_yyyyzz*v159 + &
      D_yyyz*M_yz + D_yyz*M_z + M_xyy*v104 + M_xyyy*v105 + M_xyyz*v106 &
      + M_xyzz*v103 + M_xzz*v107 + M_xzzz*v108 + M_yzz*v154 + M_yzzz* &
      v155 + M_zz*v160 + M_zzz*v161 + M_zzzz*v162
    L_yyz    = D_xxxyyz*v65 + D_xxyyyz*v66 + D_xxyyz*v57 + D_xxyyzz*v67 + D_xyyyz*M_xy &
      + D_xyyyzz*M_xyz + D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyyz*v152 + &
      D_yyyyz*v150 + D_yyyyzz*v153 + D_yyyz*M_y + D_yyyzz*M_yz + D_yyz* &
      M_0 + D_yyzz*M_z + M_xyy*v106 + M_xzz*v109 + M_yzz*v156 + M_zz* &
      v163 + M_zzz*v164
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    v172     = 0.00833333333333333d0*D_yzzzzz
    v175     = 0.0416666666666667d0*D_yzzzzz
    L_y      = D_xxxxxy*v121 + D_xxxxy*v83 + D_xxxxyy*v122 + D_xxxxyz*v123 + D_xxxy*v65 &
      + D_xxxyy*v84 + D_xxxyyy*v124 + D_xxxyyz*v125 + D_xxxyz*v85 + &
      D_xxxyzz*v126 + D_xxy*v57 + D_xxyy*v66 + D_xxyyy*v86 + D_xxyyyy* &
      v127 + D_xxyyyz*v128 + D_xxyyz*v87 + D_xxyyzz*v129 + D_xxyz*v67 + &
      D_xxyzz*v88 + D_xxyzzz*v130 + D_xy*M_x + D_xyy*M_xy + D_xyyz* &
      M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v150 + D_yyyy* &
      v152 + D_yyyyy*v157 + D_yyyyyy*v165 + D_yyyyyz*v166 + D_yyyyz* &
      v158 + D_yyyyzz*v167 + D_yyyz*v153 + D_yyyzz*v159 + D_yyyzzz*v168 &
      + D_yyz*M_yz + D_yz*M_z + M_xyy*v110 + M_xyyy*v111 + M_xyyyy*v112 &
      + M_xyyyz*v113 + M_xyyz*v114 + M_xyyzz*v115 + M_xyzz*v107 + &
      M_xyzzz*v108 + M_xzz*v116 + M_xzzz*v117 + M_xzzzz*v118 + M_yzz* &
      v160 + M_yzzz*v161 + M_yzzzz*v162 + M_zz*v169 + M_zzz*v170 + &
      M_zzzz*v171 + M_zzzzz*v172
    L_yz     = D_xxxxyz*v83 + D_xxxyyz*v84 + D_xxxyz*v65 + D_xxxyzz*v85 + D_xxyyyz*v86 &
      + D_xxyyz*v66 + D_xxyyzz*v87 + D_xxyz*v57 + D_xxyzz*v67 + &
      D_xxyzzz*v88 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz* &
      M_xz + D_yyyyyz*v157 + D_yyyyz*v152 + D_yyyyzz*v158 + D_yyyz*v150 &
      + D_yyyzz*v153 + D_yyyzzz*v159 + D_yyz*M_y + D_yyzz*M_yz + D_yz* &
      M_0 + D_yzz*M_z + M_xyy*v114 + M_xyyy*v113 + M_xyyz*v103 + M_xyzz &
      *v109 + M_xzz*v119 + M_xzzz*v120 + M_yzz*v163 + M_yzzz*v164 + &
      M_zz*v173 + M_zzz*v174 + M_zzzz*v175
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = 0.00138888888888889d0*(D_xxxxxx*M_xxxxxx + 30.0d0*D_xxxxyz*M_xxxxyz + &
      90.0d0*D_xxyyzz*M_xxyyzz + D_yyyyyy*M_yyyyyy + D_zzzzzz*M_zzzzzz &
      + 6.0d0*(D_xxxxxy*M_xxxxxy + D_xxxxxz*M_xxxxxz + D_yyyyyz* &
      M_yyyyyz) + 20.0d0*(D_xxxyyy*M_xxxyyy + D_xxxzzz*M_xxxzzz + &
      D_yyyzzz*M_yyyzzz) + 60.0d0*(D_xxxyyz*M_xxxyyz + D_xxxyzz* &
      M_xxxyzz + D_xxyyyz*M_xxyyyz + D_xxyzzz*M_xxyzzz) + 15.0d0*( &
      D_xxxxyy*M_xxxxyy + D_xxxxzz*M_xxxxzz + D_xxyyyy*M_xxyyyy + &
      D_xxzzzz*M_xxzzzz + D_yyyyzz*M_yyyyzz + D_yyzzzz*M_yyzzzz)) + D_0 &
      *M_0 + D_x*M_x + D_xx*v57 + D_xxx*v65 + D_xxxx*v83 + D_xxxxx*v121 &
      + D_xxxxy*v122 + D_xxxxz*v123 + D_xxxy*v84 + D_xxxyy*v124 + &
      D_xxxyz*v125 + D_xxxz*v85 + D_xxxzz*v126 + D_xxy*v66 + D_xxyy*v86 &
      + D_xxyyy*v127 + D_xxyyz*v128 + D_xxyz*v87 + D_xxyzz*v129 + D_xxz &
      *v67 + D_xxzz*v88 + D_xxzzz*v130 + D_xy*M_xy + D_xyz*M_xyz + D_xz &
      *M_xz + D_y*M_y + D_yy*v150 + D_yyy*v152 + D_yyyy*v157 + D_yyyyy* &
      v165 + D_yyyyz*v166 + D_yyyz*v158 + D_yyyzz*v167 + D_yyz*v153 + &
      D_yyzz*v159 + D_yyzzz*v168 + D_yz*M_yz + D_z*M_z + D_zz*v176 + &
      D_zzz*v177 + D_zzzz*v178 + D_zzzzz*v179 + M_xyy*v131 + M_xyyy* &
      v132 + M_xyyyy*v133 + M_xyyyyy*v134 + M_xyyyyz*v135 + M_xyyyz* &
      v136 + M_xyyyzz*v137 + M_xyyz*v138 + M_xyyzz*v139 + M_xyyzzz*v140 &
      + M_xyzz*v116 + M_xyzzz*v117 + M_xyzzzz*v118 + M_xzz*v141 + &
      M_xzzz*v142 + M_xzzzz*v143 + M_xzzzzz*v144 + M_yzz*v169 + M_yzzz* &
      v170 + M_yzzzz*v171 + M_yzzzzz*v172
    L_z      = D_xxxxxz*v121 + D_xxxxyz*v122 + D_xxxxz*v83 + D_xxxxzz*v123 + D_xxxyyz* &
      v124 + D_xxxyz*v84 + D_xxxyzz*v125 + D_xxxz*v65 + D_xxxzz*v85 + &
      D_xxxzzz*v126 + D_xxyyyz*v127 + D_xxyyz*v86 + D_xxyyzz*v128 + &
      D_xxyz*v66 + D_xxyzz*v87 + D_xxyzzz*v129 + D_xxz*v57 + D_xxzz*v67 &
      + D_xxzzz*v88 + D_xxzzzz*v130 + D_xyz*M_xy + D_xyzz*M_xyz + D_xz* &
      M_x + D_xzz*M_xz + D_yyyyyz*v165 + D_yyyyz*v157 + D_yyyyzz*v166 + &
      D_yyyz*v152 + D_yyyzz*v158 + D_yyyzzz*v167 + D_yyz*v150 + D_yyzz* &
      v153 + D_yyzzz*v159 + D_yyzzzz*v168 + D_yz*M_y + D_yzz*M_yz + D_z &
      *M_0 + D_zz*M_z + D_zzz*v176 + D_zzzz*v177 + D_zzzzz*v178 + &
      D_zzzzzz*v179 + M_xyy*v138 + M_xyyy*v136 + M_xyyyy*v135 + M_xyyyz &
      *v145 + M_xyyz*v107 + M_xyyzz*v146 + M_xyzz*v119 + M_xyzzz*v120 + &
      M_xzz*v147 + M_xzzz*v148 + M_xzzzz*v149 + M_yzz*v173 + M_yzzz* &
      v174 + M_yzzzz*v175
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  L_0                 
#undef  z                   
#undef  y                   
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
#undef  L_xz                
#undef  M_xz                
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
#undef  M_yyy               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_yyz               
#undef  L_xxxx              
#undef  M_xxxx              
#undef  M_xxxy              
#undef  L_xxxy              
#undef  L_xxxz              
#undef  M_xxxz              
#undef  M_xxyy              
#undef  L_xxyy              
#undef  M_xxyz              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xyyz              
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
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  L_xxxxxz            
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxxyz            
#undef  L_xxxyyy            
#undef  M_xxxyyy            
#undef  M_xxxyyz            
#undef  L_xxxyyz            
#undef  M_xxyyyy            
#undef  L_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
    end subroutine mom_es_M2L2
    
! OPS  252*ADD + 2*DIV + 347*MUL + 36*NEG + POW = 638  (1548 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h,&
                u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz,&
                L_yzzz, L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz,&
                L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz,&
                L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz,&
                L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz,&
                L_yzzzzz, L_zzzzzz
#define Phi_0                Phi(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
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
#define Phi_xz               Phi(1:2,6)
#define L_xz                 L(1:2,6)
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
#define L_xxxxxx             L(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define L_xxxxxz             L(1:2,38)
#define L_xxxxyy             L(1:2,39)
#define L_xxxxyz             L(1:2,40)
#define L_xxxyyy             L(1:2,41)
#define L_xxxyyz             L(1:2,42)
#define L_xxyyyy             L(1:2,43)
#define L_xxyyyz             L(1:2,44)
#define L_xyyyyy             L(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define L_yyyyyz             L(1:2,48)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0       = L_xxz*z
    v12      = L_xxyyy + L_xxyyyz*z
    v16      = L_xxxxx + L_xxxxxy*y + L_xxxxxz*z
    v18      = 2.0d0*z
    v21      = 6.0d0*z
    v27      = 2.0d0*y
    v28      = L_xxxxy + L_xxxxyz*z
    v30      = 0.166666666666667d0*x
    v32      = L_xxxyy + L_xxxyyz*z
    v33      = 3.0d0*y
    v36      = L_xyz*z
    v41      = L_xyyyy + L_xyyyyz*z
    v43      = L_xxxxyy*y + v28
    v50      = L_xz*z
    v66      = 0.0416666666666667d0*x
    v85      = L_yyz*z
    v90      = L_yyyyy + L_yyyyyz*z
    v93      = 0.166666666666667d0*y
    v95      = L_yz*z
    v103     = 0.0416666666666667d0*y
    L_zz     = -(L_xx + L_yy)
    L_xzz    = -(L_xxx + L_xyy)
    v68      = L_xzz*z
    L_yzz    = -(L_xxy + L_yyy)
    v105     = L_yzz*z
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
    v75      = L_xxxxz + L_xxxxyz*y + L_xxxxzz*z
    L_xxxyzz = -(L_xxxxxy + L_xxxyyy)
    v80      = L_xxxyz + L_xxxyzz*z
    L_xxxzzz = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz = -(L_xxxxyy + L_xxyyyy)
    v82      = L_xxyyz + L_xxyyzz*z
    L_xxyzzz = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz = -(L_xxxyyy + L_xyyyyy)
    v73      = L_xyyyz + L_xyyyzz*z
    L_xyyzzz = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz = -(L_xxyyyy + L_yyyyyy)
    v109     = L_yyyyz + L_yyyyzz*z
    L_yyyzzz = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz = -(L_xxzzzz + L_yyzzzz)
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v25      = a2
    v26      = 0.25d0*v25
    v65      = 0.0833333333333333d0*v25
    a3       = a1*a2
    v14      = a3
    v15      = 0.166666666666667d0*v14
    v64      = 0.0833333333333333d0*v14
    a4       = a2*a2
    v1       = a4
    v2       = 0.0416666666666667d0*v1
    a5       = a2*a3
    v51      = 0.00833333333333333d0*a5
    a6       = a3*a3
    b2       = b1*b1
    v17      = b2
    v31      = 3.0d0*v17
    v91      = 0.25d0*v17
    v102     = 0.0833333333333333d0*v17
    b3       = b1*b2
    v11      = b3
    v13      = v11*v12
    v42      = v11*v41
    v89      = 0.166666666666667d0*v11
    v101     = 0.0833333333333333d0*v11
    v74      = v11*v73
    b4       = b2*b2
    v3       = b4
    v4       = L_xxyyyy*v3
    v37      = L_xyyyyy*v3
    v59      = 0.0416666666666667d0*v3
    v69      = L_xyyyyz*v3
    b5       = b2*b3
    v52      = b5
    v53      = L_xyyyyy*v52
    v96      = 0.00833333333333333d0*v52
    b6       = b3*b3
    c2       = c1*c1
    v5       = c2
    v22      = 3.0d0*v5
    v112     = 0.5d0*v5
    v54      = L_xzz*v5
    v97      = L_yzz*v5
    v6       = L_xxzz*v5
    v38      = L_xyzz*v5
    v70      = L_xzzz*v5
    v86      = L_yyzz*v5
    v106     = L_yzzz*v5
    v29      = 2.0d0*L_xxxx + L_xxxxyy*v17 + L_xxxxz*v18 + L_xxxxzz*v5 + v27*v28
    v34      = 2.0d0*L_xxxy + L_xxxyz*v18 + L_xxxyzz*v5
    v48      = v34 + L_xxxyyy*v17 + v27*v32
    v81      = L_xxxyyz*v17 + 2.0d0*L_xxxz + L_xxxzz*v18 + L_xxxzzz*v5 + v27*v80
    v19      = 2.0d0*L_xxyy + L_xxyyz*v18 + L_xxyyzz*v5
    v20      = v17*v19
    v83      = 2.0d0*L_xxyz + L_xxyzz*v18 + L_xxyzzz*v5
    v44      = 2.0d0*L_xyyy + L_xyyyz*v18 + L_xyyyzz*v5
    v45      = v17*v44
    v60      = v11*v44
    v76      = 2.0d0*L_xyyz + L_xyyzz*v18 + L_xyyzzz*v5
    v77      = v17*v76
    v92      = 2.0d0*L_yyyy + L_yyyyz*v18 + L_yyyyzz*v5
    v110     = 2.0d0*L_yyyz + L_yyyzz*v18 + L_yyyzzz*v5
    h        = v17 + v25 + v5
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
    v7       = c3
    v113     = 0.166666666666667d0*v7
    v55      = L_xzzz*v7
    v98      = L_yzzz*v7
    v8       = L_xxzzz*v7
    v39      = L_xyzzz*v7
    v71      = L_xzzzz*v7
    v87      = L_yyzzz*v7
    v107     = L_yzzzz*v7
    v35      = 6.0d0*L_xxx + L_xxxyyy*v11 + L_xxxz*v21 + L_xxxzz*v22 + L_xxxzzz*v7 + &
      v31*v32 + v33*v34
    v23      = 6.0d0*L_xxy + L_xxyz*v21 + L_xxyzz*v22 + L_xxyzzz*v7
    v24      = v23*y
    v49      = v23 + L_xxyyyy*v11 + v12*v31 + v19*v33
    v84      = L_xxyyyz*v11 + 6.0d0*L_xxz + L_xxzz*v21 + L_xxzzz*v22 + L_xxzzzz*v7 + &
      v31*v82 + v33*v83
    v46      = 6.0d0*L_xyy + L_xyyz*v21 + L_xyyzz*v22 + L_xyyzzz*v7
    v47      = v46*y
    v61      = v17*v46
    v78      = 6.0d0*L_xyz + L_xyzz*v21 + L_xyzzz*v22 + L_xyzzzz*v7
    v79      = v78*y
    v94      = 6.0d0*L_yyy + L_yyyz*v21 + L_yyyzz*v22 + L_yyyzzz*v7
    v111     = 6.0d0*L_yyz + L_yyzz*v21 + L_yyzzz*v22 + L_yyzzzz*v7
    c4       = c2*c2
    v9       = c4
    v114     = 0.0416666666666667d0*v9
    v56      = L_xzzzz*v9
    v99      = L_yzzzz*v9
    v10      = L_xxzzzz*v9
    v67      = v10 + v4 + 6.0d0*v20 + 12.0d0*v6 + 2.0d0*(12.0d0*L_xx + 12.0d0*v0 + &
      2.0d0*v13 + 2.0d0*v24 + 2.0d0*v8)
    Phi_xx   = 0.0416666666666667d0*(v10 + 6.0d0*v20 + v4 + 12.0d0*v6 + 4.0d0*(v13 + &
      v24 + v8)) + L_xx + L_xxxxxx*v2 + v0 + v15*v16 + v26*v29 + v30* &
      v35
    v40      = L_xyzzzz*v9
    v62      = v40 + 12.0d0*v38 + 4.0d0*(6.0d0*L_xy + 6.0d0*v36 + v39)
    v63      = v62*y
    Phi_xy   = 0.0416666666666667d0*(v37 + 12.0d0*v38 + v40 + 6.0d0*v45 + 4.0d0*(v39 + &
      v42 + v47)) + L_xxxxxy*v2 + L_xy + v15*v43 + v26*v48 + v30*v49 + &
      v36
    v72      = L_xzzzzz*v9
    Phi_xz   = 0.0416666666666667d0*(v69 + 12.0d0*v70 + v72 + 6.0d0*v77 + 4.0d0*(v71 + &
      v74 + v79)) + L_xxxxxz*v2 + L_xz + v15*v75 + v26*v81 + v30*v84 + &
      v68
    v88      = L_yyzzzz*v9
    v104     = v88 + 12.0d0*v86 + 4.0d0*(6.0d0*L_yy + 6.0d0*v85 + v87)
    Phi_yy   = 0.0416666666666667d0*(12.0d0*v86 + 4.0d0*v87 + v88) + L_xxxxyy*v2 + L_yy &
      + L_yyyyyy*v59 + v15*(L_xxxyyy*y + v32) + v26*(L_xxyyyy*v17 + v12 &
      *v27 + v19) + v30*(L_xyyyyy*v11 + v31*v41 + v33*v44 + v46) + v85 &
      + v89*v90 + v91*v92 + v93*v94
    Phi_zz   = -(Phi_xx + Phi_yy)
    v108     = L_yzzzzz*v9
    Phi_yz   = 0.0416666666666667d0*(12.0d0*v106 + 4.0d0*v107 + v108) + L_xxxxyz*v2 + &
      L_yyyyyz*v59 + L_yz + v105 + v109*v89 + v110*v91 + v111*v93 + v15 &
      *(L_xxxyyz*y + v80) + v26*(L_xxyyyz*v17 + v27*v82 + v83) + v30*( &
      L_xyyyyz*v11 + v31*v73 + v33*v76 + v78)
    c5       = c2*c3
    v57      = c5
    v115     = 0.00833333333333333d0*v57
    v58      = L_xzzzzz*v57
    Phi_x    = 0.00833333333333333d0*(v53 + 60.0d0*v54 + 20.0d0*v55 + v58 + 5.0d0*(v56 &
      + v63) + 10.0d0*(v60 + v61)) + L_x + L_xxxxxx*v51 + v16*v2 + v29* &
      v64 + v35*v65 + v41*v59 + v50 + v66*v67
    v100     = L_yzzzzz*v57
    Phi_y    = 0.00833333333333333d0*(v100 + 60.0d0*v97 + 20.0d0*v98 + 5.0d0*v99) + &
      L_xxxxxy*v51 + L_y + L_yyyyyy*v96 + v101*v92 + v102*v94 + v103* &
      v104 + v2*v43 + v48*v64 + v49*v65 + v59*v90 + v66*(v37 + 4.0d0* &
      v42 + 6.0d0*v45 + 4.0d0*v47 + v62) + v95
    Phi_z    = L_z + L_xxxxxz*v51 + L_yyyyyz*v96 + L_zz*z + L_zzz*v112 + L_zzzz*v113 + &
      L_zzzzz*v114 + L_zzzzzz*v115 + v101*v110 + v102*v111 + v103*( &
      24.0d0*L_yz + 24.0d0*v105 + 12.0d0*v106 + 4.0d0*v107 + v108) + &
      v109*v59 + v2*v75 + v64*v81 + v65*v84 + v66*(24.0d0*L_xz + 24.0d0 &
      *v68 + v69 + 12.0d0*v70 + 4.0d0*v71 + v72 + 4.0d0*v74 + 6.0d0*v77 &
      + 4.0d0*v79)
    c6       = c3*c3
    Phi_0    = 0.00138888888888889d0*(L_xxxxxx*a6 + L_yyyyyy*b6 + L_zzzzzz*c6 + 20.0d0* &
      (v11*v94 + v14*v35) + 6.0d0*(x*(120.0d0*L_x + 5.0d0*v3*v41 + &
      120.0d0*v50 + v53 + 60.0d0*v54 + 20.0d0*v55 + 5.0d0*v56 + v58 + &
      10.0d0*v60 + 10.0d0*v61 + 5.0d0*v63) + y*(120.0d0*L_y + v100 + &
      120.0d0*v95 + 60.0d0*v97 + 20.0d0*v98 + 5.0d0*v99)) + 15.0d0*(v1* &
      v29 + v104*v17 + v25*v67 + v3*v92)) + L_0 + L_z*z + L_zz*v112 + &
      L_zzz*v113 + L_zzzz*v114 + L_zzzzz*v115 + v16*v51 + v90*v96
    call unpack2(MOM_ES_PHI_LEN, Phi1,Phi2,Phi)
#undef  Phi_0               
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
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
#undef  Phi_xz              
#undef  L_xz                
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
    
! OPS  390*ADD + 2*DIV + 462*MUL + 35*NEG + POW = 890  (2242 before optimization)
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
                v152, v153, v154, v155, v156, v157, v158, v159, v16, v160,&
                v161, v162, v163, v164, v165, v166, v167, v168, v169, v17,&
                v170, v171, v172, v173, v174, v175, v176, v177, v178, v179,&
                v18, v180, v181, v182, v183, v19, v2, v20, v21, v22, v23, v24,&
                v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
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
                L_zzzzzz
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
#define L_xxxyz              L(1:2,29)
#define Ls_xxxyz             Ls(1:2,29)
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
#define Ls_xxxxxx            Ls(1:2,36)
#define L_xxxxxx             L(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define Ls_xxxxxy            Ls(1:2,37)
#define Ls_xxxxxz            Ls(1:2,38)
#define L_xxxxxz             L(1:2,38)
#define Ls_xxxxyy            Ls(1:2,39)
#define L_xxxxyy             L(1:2,39)
#define Ls_xxxxyz            Ls(1:2,40)
#define L_xxxxyz             L(1:2,40)
#define Ls_xxxyyy            Ls(1:2,41)
#define L_xxxyyy             L(1:2,41)
#define Ls_xxxyyz            Ls(1:2,42)
#define L_xxxyyz             L(1:2,42)
#define Ls_xxyyyy            Ls(1:2,43)
#define L_xxyyyy             L(1:2,43)
#define Ls_xxyyyz            Ls(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define L_xyyyyy             L(1:2,45)
#define Ls_xyyyyy            Ls(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define Ls_xyyyyz            Ls(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define Ls_yyyyyy            Ls(1:2,47)
#define Ls_yyyyyz            Ls(1:2,48)
#define L_yyyyyz             L(1:2,48)
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
    v73       = 0.166666666666667d0*x
    v83       = L_xyyyz*z
    v86       = v7*y
    v89       = L_xyyz*z
    v100      = L_xyz*z
    v116      = L_xz*z
    v132      = 0.0416666666666667d0*x
    v144      = L_yyyyz*z
    v147      = L_yyyz*z
    v150      = 0.5d0*y
    v154      = L_yyz*z
    v159      = 0.166666666666667d0*y
    v165      = L_yz*z
    v173      = 0.0416666666666667d0*y
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
    v135      = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v175      = L_yzz*z
    L_zzz     = -(L_xxz + L_yyz)
    L_xxzz    = -(L_xxxx + L_xxyy)
    v76       = L_xxzz*z
    L_xyzz    = -(L_xxxy + L_xyyy)
    v109      = L_xyzz*z
    L_xzzz    = -(L_xxxz + L_xyyz)
    L_yyzz    = -(L_xxyy + L_yyyy)
    v161      = L_yyzz*z
    L_yzzz    = -(L_xxyz + L_yyyz)
    L_zzzz    = -(L_xxzz + L_yyzz)
    L_xxxzz   = -(L_xxxxx + L_xxxyy)
    v38       = L_xxxzz*z
    L_xxyzz   = -(L_xxxxy + L_xxyyy)
    v55       = L_xxyzz*z
    L_xxzzz   = -(L_xxxxz + L_xxyyz)
    L_xyyzz   = -(L_xxxyy + L_xyyyy)
    v96       = L_xyyzz*z
    L_xyzzz   = -(L_xxxyz + L_xyyyz)
    L_xzzzz   = -(L_xxxzz + L_xyyzz)
    L_yyyzz   = -(L_xxyyy + L_yyyyy)
    v152      = L_yyyzz*z
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
    v87       = L_xyyyz + L_xyyyzz*z
    v88       = L_xyyyyz*y + v87
    v99       = v87*y
    Ls_xyyyz  = L_xxyyyz*x + v88
    L_xyyzzz  = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz  = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz  = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz  = -(L_xxyyyy + L_yyyyyy)
    v146      = L_yyyyz + L_yyyyzz*z
    Ls_yyyyz  = v146 + L_xyyyyz*x + L_yyyyyz*y
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
    v72       = 0.25d0*v11
    v131      = 0.0833333333333333d0*v11
    a3        = a1*a2
    v26       = a3
    v27       = 0.166666666666667d0*v26
    v130      = 0.0833333333333333d0*v26
    a4        = a2*a2
    v60       = a4
    v61       = 0.0416666666666667d0*v60
    a5        = a2*a3
    v117      = 0.00833333333333333d0*a5
    a6        = a3*a3
    b2        = b1*b1
    v13       = b2
    v14       = L_xxxxyy*v13
    v20       = L_xxxyyy*v13
    v33       = 0.5d0*v13
    v39       = L_xxxyyz*v13
    v43       = L_xxyyyy*v13
    v56       = L_xxyyyz*v13
    v74       = 3.0d0*v13
    v84       = L_xyyyyy*v13
    v97       = L_xyyyyz*v13
    v158      = 0.25d0*v13
    v172      = 0.0833333333333333d0*v13
    b3        = b1*b2
    v28       = b3
    v29       = L_xxxyyy*v28
    v49       = L_xxyyyy*v28
    v68       = 0.166666666666667d0*v28
    v77       = L_xxyyyz*v28
    v90       = L_xyyyyy*v28
    v110      = L_xyyyyz*v28
    v133      = 4.0d0*v28
    v171      = 0.0833333333333333d0*v28
    b4        = b2*b2
    v62       = b4
    v63       = L_xxyyyy*v62
    v101      = L_xyyyyy*v62
    v125      = 0.0416666666666667d0*v62
    v136      = L_xyyyyz*v62
    b5        = b2*b3
    v118      = b5
    v119      = L_xyyyyy*v118
    v166      = 0.00833333333333333d0*v118
    b6        = b3*b3
    c2        = c1*c1
    v15       = c2
    v180      = 0.5d0*v15
    v120      = L_xzz*v15
    v167      = L_yzz*v15
    v64       = L_xxzz*v15
    v102      = L_xyzz*v15
    v137      = L_xzzz*v15
    v155      = L_yyzz*v15
    v176      = L_yzzz*v15
    v30       = L_xxxzz*v15
    v50       = L_xxyzz*v15
    v78       = L_xxzzz*v15
    v91       = L_xyyzz*v15
    v111      = L_xyzzz*v15
    v148      = L_yyyzz*v15
    v162      = L_yyzzz*v15
    v16       = L_xxxxzz*v15
    v37       = v14 + v16 + 2.0d0*(L_xxxx + v10 + v17)
    Ls_xxxx   = 0.5d0*(v14 + v16) + L_xxxx + L_xxxxxx*v12 + v0*x + v10 + v17
    v21       = L_xxxyzz*v15
    v34       = v21 + 2.0d0*(L_xxxy + v19)
    v35       = v34*y
    v54       = 2.0d0*v22 + v20 + v34
    Ls_xxxy   = 0.5d0*(v20 + v21) + L_xxxxxy*v12 + L_xxxy + v19 + v2*x + v22
    v40       = L_xxxzzz*v15
    v82       = v39 + v40 + 2.0d0*(L_xxxz + v38 + v41)
    Ls_xxxz   = 0.5d0*(v39 + v40) + L_xxxxxz*v12 + L_xxxz + v18*x + v38 + v41
    v44       = L_xxyyzz*v15
    v52       = v44 + 2.0d0*(L_xxyy + v42)
    v53       = v52*y
    v69       = v13*v52
    v95       = 2.0d0*v45 + v43 + v52
    Ls_xxyy   = 0.5d0*(v43 + v44) + L_xxxxyy*v12 + L_xxyy + v4*x + v42 + v45
    v57       = L_xxyzzz*v15
    v80       = v57 + 2.0d0*(L_xxyz + v55)
    v81       = v80*y
    v115      = 2.0d0*v58 + v56 + v80
    Ls_xxyz   = 0.5d0*(v56 + v57) + L_xxxxyz*v12 + L_xxyz + v24*x + v55 + v58
    v85       = L_xyyyzz*v15
    v93       = v85 + 2.0d0*(L_xyyy + v83)
    v94       = v93*y
    v105      = v13*v93
    v126      = v28*v93
    Ls_xyyy   = 0.5d0*(v84 + v85) + L_xxxyyy*v12 + L_xyyy + v6*x + v83 + v86
    v98       = L_xyyzzz*v15
    v113      = v98 + 2.0d0*(L_xyyz + v96)
    v114      = v113*y
    v140      = v113*v13
    Ls_xyyz   = 0.5d0*(v97 + v98) + L_xxxyyz*v12 + L_xyyz + v47*x + v96 + v99
    v145      = L_yyyyzz*v15
    v151      = v145 + 2.0d0*(L_yyyy + v144)
    Ls_yyyy   = 0.5d0*v145 + L_xxyyyy*v12 + L_yyyy + L_yyyyyy*v33 + v144 + v8*x + v9*y
    v153      = L_yyyzzz*v15
    v164      = v153 + 2.0d0*(L_yyyz + v152)
    Ls_yyyz   = 0.5d0*v153 + L_xxyyyz*v12 + L_yyyyyz*v33 + L_yyyz + v146*y + v152 + v88* &
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
    v181      = 0.166666666666667d0*v31
    v121      = L_xzzz*v31
    v168      = L_yzzz*v31
    v65       = L_xxzzz*v31
    v103      = L_xyzzz*v31
    v138      = L_xzzzz*v31
    v156      = L_yyzzz*v31
    v177      = L_yzzzz*v31
    v32       = L_xxxzzz*v31
    v75       = v29 + v32 + v3*v74 + 6.0d0*(L_xxx + v25) + 3.0d0*(v30 + v35)
    Ls_xxx    = 0.166666666666667d0*(v29 + v32 + 3.0d0*(v30 + v35)) + L_xxx + L_xxxxxx* &
      v27 + v0*v12 + v25 + v3*v33 + v36*v37
    v51       = L_xxyzzz*v31
    v70       = v51 + 3.0d0*(2.0d0*L_xxy + 2.0d0*v48 + v50)
    v71       = v70*y
    v108      = v49 + v70 + v5*v74 + 3.0d0*v53
    Ls_xxy    = 0.166666666666667d0*(v49 + v51 + 3.0d0*(v50 + v53)) + L_xxxxxy*v27 + &
      L_xxy + v12*v2 + v33*v5 + v36*v54 + v48
    v79       = L_xxzzzz*v31
    v143      = v77 + v79 + v46*v74 + 6.0d0*(L_xxz + v76) + 3.0d0*(v78 + v81)
    Ls_xxz    = 0.166666666666667d0*(v77 + v79 + 3.0d0*(v78 + v81)) + L_xxxxxz*v27 + &
      L_xxz + v12*v18 + v33*v46 + v36*v82 + v76
    v92       = L_xyyzzz*v31
    v106      = v92 + 3.0d0*(2.0d0*L_xyy + 2.0d0*v89 + v91)
    v107      = v106*y
    v127      = v106*v13
    Ls_xyy    = 0.166666666666667d0*(v90 + v92 + 3.0d0*(v91 + v94)) + L_xxxxyy*v27 + &
      L_xyy + v12*v4 + v33*v7 + v36*v95 + v89
    v112      = L_xyzzzz*v31
    v141      = v112 + 3.0d0*(2.0d0*L_xyz + 2.0d0*v109 + v111)
    v142      = v141*y
    Ls_xyz    = 0.166666666666667d0*(v110 + v112 + 3.0d0*(v111 + v114)) + L_xxxxyz*v27 + &
      L_xyz + v109 + v115*v36 + v12*v24 + v33*v87
    v149      = L_yyyzzz*v31
    v160      = v149 + 3.0d0*(2.0d0*L_yyy + 2.0d0*v147 + v148)
    Ls_yyy    = 0.166666666666667d0*(3.0d0*v148 + v149) + L_xxxyyy*v27 + L_yyy + &
      L_yyyyyy*v68 + v12*v6 + v147 + v150*v151 + v33*v9 + v36*(v84 + &
      2.0d0*v86 + v93)
    v163      = L_yyzzzz*v31
    v179      = v163 + 3.0d0*(2.0d0*L_yyz + 2.0d0*v161 + v162)
    Ls_yyz    = 0.166666666666667d0*(3.0d0*v162 + v163) + L_xxxyyz*v27 + L_yyyyyz*v68 + &
      L_yyz + v12*v47 + v146*v33 + v150*v164 + v161 + v36*(v113 + v97 + &
      2.0d0*v99)
    c4        = c2*c2
    v66       = c4
    v182      = 0.0416666666666667d0*v66
    v122      = L_xzzzz*v66
    v169      = L_yzzzz*v66
    v67       = L_xxzzzz*v66
    v134      = v63 + v67 + v133*v5 + 12.0d0*v64 + 6.0d0*v69 + 24.0d0*(L_xx + v59) + &
      4.0d0*(v65 + v71)
    Ls_xx     = 0.0416666666666667d0*(v63 + 12.0d0*v64 + v67 + 6.0d0*v69 + 4.0d0*(v65 + &
      v71)) + L_xx + L_xxxxxx*v61 + v0*v27 + v37*v72 + v5*v68 + v59 + &
      v73*v75
    v104      = L_xyzzzz*v66
    v128      = v104 + 12.0d0*v102 + 4.0d0*(6.0d0*L_xy + 6.0d0*v100 + v103)
    v129      = v128*y
    Ls_xy     = 0.0416666666666667d0*(v101 + 12.0d0*v102 + v104 + 6.0d0*v105 + 4.0d0*( &
      v103 + v107)) + L_xxxxxy*v61 + L_xy + v100 + v108*v73 + v2*v27 + &
      v54*v72 + v68*v7
    v139      = L_xzzzzz*v66
    Ls_xz     = 0.0416666666666667d0*(v136 + 12.0d0*v137 + v139 + 6.0d0*v140 + 4.0d0*( &
      v138 + v142)) + L_xxxxxz*v61 + L_xz + v135 + v143*v73 + v18*v27 + &
      v68*v87 + v72*v82
    v157      = L_yyzzzz*v66
    v174      = v157 + 12.0d0*v155 + 4.0d0*(6.0d0*L_yy + 6.0d0*v154 + v156)
    Ls_yy     = 0.0416666666666667d0*(12.0d0*v155 + 4.0d0*v156 + v157) + L_xxxxyy*v61 + &
      L_yy + L_yyyyyy*v125 + v151*v158 + v154 + v159*v160 + v27*v4 + &
      v68*v9 + v72*v95 + v73*(v106 + v7*v74 + v90 + 3.0d0*v94)
    v178      = L_yzzzzz*v66
    Ls_yz     = 0.0416666666666667d0*(12.0d0*v176 + 4.0d0*v177 + v178) + L_xxxxyz*v61 + &
      L_yyyyyz*v125 + L_yz + v115*v72 + v146*v68 + v158*v164 + v159* &
      v179 + v175 + v24*v27 + v73*(v110 + 3.0d0*v114 + v141 + v74*v87)
    c5        = c2*c3
    v123      = c5
    v183      = 0.00833333333333333d0*v123
    v124      = L_xzzzzz*v123
    Ls_x      = 0.00833333333333333d0*(v119 + 60.0d0*v120 + 20.0d0*v121 + v124 + 5.0d0*( &
      v122 + v129) + 10.0d0*(v126 + v127)) + L_x + L_xxxxxx*v117 + v0* &
      v61 + v116 + v125*v7 + v130*v37 + v131*v75 + v132*v134
    v170      = L_yzzzzz*v123
    Ls_y      = 0.00833333333333333d0*(60.0d0*v167 + 20.0d0*v168 + 5.0d0*v169 + v170) + &
      L_xxxxxy*v117 + L_y + L_yyyyyy*v166 + v108*v131 + v125*v9 + v130* &
      v54 + v132*(v101 + 6.0d0*v105 + 4.0d0*v107 + v128 + v133*v7) + &
      v151*v171 + v160*v172 + v165 + v173*v174 + v2*v61
    Ls_z      = L_z + L_xxxxxz*v117 + L_yyyyyz*v166 + L_zz*z + L_zzz*v180 + L_zzzz*v181 &
      + L_zzzzz*v182 + L_zzzzzz*v183 + v125*v146 + v130*v82 + v131*v143 &
      + v132*(24.0d0*L_xz + v133*v87 + 24.0d0*v135 + v136 + 12.0d0*v137 &
      + 4.0d0*v138 + v139 + 6.0d0*v140 + 4.0d0*v142) + v164*v171 + v172 &
      *v179 + v173*(24.0d0*L_yz + 24.0d0*v175 + 12.0d0*v176 + 4.0d0* &
      v177 + v178) + v18*v61
    c6        = c3*c3
    Ls_0      = 0.00138888888888889d0*(L_xxxxxx*a6 + L_yyyyyy*b6 + L_zzzzzz*c6 + 20.0d0* &
      (v160*v28 + v26*v75) + 6.0d0*(x*(120.0d0*L_x + 120.0d0*v116 + &
      v119 + 60.0d0*v120 + 20.0d0*v121 + 5.0d0*v122 + v124 + 10.0d0* &
      v126 + 10.0d0*v127 + 5.0d0*v129 + 5.0d0*v62*v7) + y*(120.0d0*L_y &
      + 120.0d0*v165 + 60.0d0*v167 + 20.0d0*v168 + 5.0d0*v169 + v170)) &
      + 15.0d0*(v11*v134 + v13*v174 + v151*v62 + v37*v60)) + L_0 + L_z* &
      z + L_zz*v180 + L_zzz*v181 + L_zzzz*v182 + L_zzzzz*v183 + v0*v117 &
      + v166*v9
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
