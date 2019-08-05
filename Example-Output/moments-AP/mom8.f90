!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-04 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom8
use types
implicit none
#if FMM_EXPANSION_ORDER==8
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
        
    
! OPS  91*ADD + 205*MUL + 31*NEG + 17*SUB = 344  (1087 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v11, v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21,&
                v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32,&
                v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43,&
                v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54,&
                v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65,&
                v66, v67, v68, v69, v7, v70, v71, v8, v9, h, u
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
#define M_xxxxxxx            M(46)
#define M_xxxxxxy            M(47)
#define M_xxxxxxz            M(48)
#define M_xxxxxyy            M(49)
#define M_xxxxxyz            M(50)
#define M_xxxxyyy            M(51)
#define M_xxxxyyz            M(52)
#define M_xxxyyyy            M(53)
#define M_xxxyyyz            M(54)
#define M_xxyyyyy            M(55)
#define M_xxyyyyz            M(56)
#define M_xyyyyyy            M(57)
#define M_xyyyyyz            M(58)
#define M_yyyyyyy            M(59)
#define M_yyyyyyz            M(60)
    v0        = W*x
    v1        = v0*y
    v2        = v0*z
    v3        = W*y
    v4        = v3*z
    v5        = v1*z
    v16       = W*z
    M_0       = W
    M_xy      = v1
    M_xz      = v2
    M_yz      = v4
    M_xyz     = v5
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v6        = a2
    v48       = 3.0d0*v6
    a3        = a1*a2
    a4        = a2*a2
    v18       = a4
    a5        = a2*a3
    a6        = a3*a3
    v36       = a6
    a7        = a3*a4
    a8        = a4*a4
    b2        = b1*b1
    v7        = b2
    v8        = v6 + v7
    v24       = v6*v7
    v44       = v18*v7
    v49       = 3.0d0*v7
    b3        = b1*b2
    b4        = b2*b2
    v28       = b4
    v51       = v28*v6
    b5        = b2*b3
    b6        = b3*b3
    v54       = b6
    b7        = b3*b4
    b8        = b4*b4
    c2        = c1*c1
    h         = c2 + v8
    v66       = h*v6
    v67       = h*v7
    v9        = 0.333333333333333d0*h
    v10       = -v9
    v11       = v10 + v6
    v12       = v10 + v7
    v13       = -0.6d0*h
    v14       = -0.2d0*h
    v15       = v14 + v6
    v17       = v14 + v7
    v19       = h*h
    v20       = 0.0857142857142857d0*v19
    v21       = v66
    v22       = -0.428571428571429d0*h
    v23       = v22 + v6
    v25       = 0.142857142857143d0*h
    v26       = -v25
    v27       = v22 + v7
    v29       = v67
    v30       = 0.238095238095238d0*v19
    v31       = 0.0476190476190476d0*v19
    v32       = 0.333333333333333d0*(-2.0d0*v21) + v18 + v31
    v33       = v24 + v31
    v68       = -v33
    v34       = h*v8
    v35       = 0.333333333333333d0*(-2.0d0*v29) + v28 + v31
    v37       = h*h*h
    v38       = -0.0216450216450216d0*v37
    v39       = h*v18
    v40       = v19*v6
    v41       = 0.151515151515152d0*v19
    v42       = 0.0909090909090909d0*(-10.0d0*v21) + v18 + v41
    v43       = -0.00432900432900433d0*v37
    v45       = 0.0303030303030303d0*v19
    v46       = v66*(v6 + 6.0d0*v7)
    v47       = 0.0909090909090909d0*h
    v50       = v24 + v45
    v69       = -v50
    v52       = v67*(6.0d0*v6 + v7)
    v53       = 0.0909090909090909d0*(-10.0d0*v29) + v28 + v41
    v55       = h*v28
    v56       = v19*v7
    v57       = -0.0815850815850816d0*v37
    v58       = -0.0116550116550117d0*v37
    v59       = v36 + v58 + 0.00699300699300699d0*(-165.0d0*v39 + 45.0d0*v40)
    v60       = 0.104895104895105d0*v19
    v61       = -0.00699300699300699d0*(66.0d0*v21*v7 + v37)
    v62       = 0.020979020979021d0*v56
    v70       = v44 + v62
    v63       = -0.00233100233100233d0*v37
    v64       = 0.020979020979021d0*v40
    v71       = v51 + v64
    v65       = v54 + v58 + 0.00699300699300699d0*(-165.0d0*v55 + 45.0d0*v56)
    M_xx      = W*v11
    M_yy      = W*v12
    M_xxx     = v0*(v13 + v6)
    M_xxy     = v15*v3
    M_xxz     = v15*v16
    M_xyy     = v0*v17
    M_yyy     = v3*(v13 + v7)
    M_yyz     = v16*v17
    M_xxxx    = W*(0.142857142857143d0*(-6.0d0*v21) + v18 + v20)
    M_xxxy    = v1*v23
    M_xxxz    = v2*v23
    M_xxyy    = W*(0.0285714285714286d0*v19 + v24 - v25*v8)
    M_xxyz    = v4*(v26 + v6)
    M_xyyy    = v1*v27
    M_xyyz    = v2*(v26 + v7)
    M_yyyy    = W*(0.142857142857143d0*(-6.0d0*v29) + v20 + v28)
    M_yyyz    = v27*v4
    M_xxxxx   = v0*(0.111111111111111d0*(-10.0d0*v21) + v18 + v30)
    M_xxxxy   = v3*v32
    M_xxxxz   = v16*v32
    M_xxxyy   = -v0*(0.111111111111111d0*v21 + v68 + v7*v9)
    M_xxxyz   = v11*v5
    M_xxyyy   = -v3*(0.111111111111111d0*v29 + v6*v9 + v68)
    M_xxyyz   = v16*(v24 + 0.0158730158730159d0*(v19 - 7.0d0*v34))
    M_xyyyy   = v0*v35
    M_xyyyz   = v12*v5
    M_yyyyy   = v3*(0.111111111111111d0*(-10.0d0*v29) + v28 + v30)
    M_yyyyz   = v16*v35
    M_xxxxxx  = W*(v36 + v38 + 0.0909090909090909d0*(-15.0d0*v39 + 5.0d0*v40))
    M_xxxxxy  = v1*v42
    M_xxxxxz  = v2*v42
    M_xxxxyy  = W*(0.0909090909090909d0*(-v46) + v43 + v44 + v45*(2.0d0*v6 + v7))
    M_xxxxyz  = v4*(0.0909090909090909d0*(-6.0d0*v21) + v18 + v45)
    M_xxxyyy  = v1*(v24 - v47*(-h + v48 + v49))
    M_xxxyyz  = -v2*(v47*(v49 + v6) + v69)
    M_xxyyyy  = W*(0.0909090909090909d0*(-v52) + v43 + v45*(v6 + 2.0d0*v7) + v51)
    M_xxyyyz  = -v4*(v47*(v48 + v7) + v69)
    M_xyyyyy  = v1*v53
    M_xyyyyz  = v2*(0.0909090909090909d0*(-6.0d0*v29) + v28 + v45)
    M_yyyyyy  = W*(v38 + v54 + 0.0909090909090909d0*(-15.0d0*v55 + 5.0d0*v56))
    M_yyyyyz  = v4*v53
    M_xxxxxxx = v0*(v36 + v57 + 0.00699300699300699d0*(-231.0d0*v39 + 105.0d0*v40))
    M_xxxxxxy = v3*v59
    M_xxxxxxz = v16*v59
    M_xxxxxyy = v0*(0.00699300699300699d0*(-11.0d0*v21*(v6 + 10.0d0*v7) + 10.0d0*v40) + &
      v44 + v58 + v60*v7)
    M_xxxxxyz = v5*(0.0769230769230769d0*(-10.0d0*v21) + v18 + v60)
    M_xxxxyyy = v3*(0.00699300699300699d0*(-33.0d0*v39 + 18.0d0*v40) + v61 + v70)
    M_xxxxyyz = v16*(0.00699300699300699d0*(6.0d0*v40 - 11.0d0*v46) + v63 + v70)
    M_xxxyyyy = v0*(0.00699300699300699d0*(-33.0d0*v55 + 18.0d0*v56) + v61 + v71)
    M_xxxyyyz = v5*(v24 + 0.00699300699300699d0*(9.0d0*v19 - 33.0d0*v34))
    M_xxyyyyy = v3*(0.00699300699300699d0*(-11.0d0*v29*(10.0d0*v6 + v7) + 10.0d0*v56) + &
      v51 + v58 + v6*v60)
    M_xxyyyyz = v16*(0.00699300699300699d0*(-11.0d0*v52 + 6.0d0*v56) + v63 + v71)
    M_xyyyyyy = v0*v65
    M_xyyyyyz = v5*(0.0769230769230769d0*(-10.0d0*v29) + v28 + v60)
    M_yyyyyyy = v3*(v54 + v57 + 0.00699300699300699d0*(-231.0d0*v55 + 105.0d0*v56))
    M_yyyyyyz = v16*v65
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
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  M_xxxxyyy           
#undef  M_xxxxyyz           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  M_xyyyyyy           
#undef  M_xyyyyyz           
#undef  M_yyyyyyy           
#undef  M_yyyyyyz           
    end subroutine mom_es_P2M
    
! OPS  2117*ADD + 2267*MUL + 127*NEG + 614*SUB = 5125  (9724 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v430, v431, v432, v433, v434, v435, v436,&
                v437, v438, v439, v44, v440, v441, v442, v443, v444, v445,&
                v446, v447, v448, v449, v45, v450, v451, v452, v453, v454,&
                v455, v456, v457, v458, v459, v46, v460, v461, v462, v463,&
                v464, v465, v466, v467, v468, v469, v47, v470, v471, v472,&
                v473, v474, v475, v476, v477, v478, v479, v48, v480, v481,&
                v482, v483, v484, v485, v486, v487, v488, v489, v49, v490,&
                v491, v492, v493, v494, v495, v496, v497, v498, v499, v5, v50,&
                v500, v501, v502, v503, v504, v505, v506, v507, v508, v509,&
                v51, v510, v511, v512, v513, v514, v515, v516, v517, v518,&
                v519, v52, v520, v521, v522, v523, v524, v525, v526, v527,&
                v528, v529, v53, v530, v531, v532, v533, v534, v535, v536,&
                v537, v538, v539, v54, v540, v541, v542, v543, v544, v545,&
                v546, v547, v548, v549, v55, v550, v551, v552, v553, v554,&
                v555, v556, v557, v558, v559, v56, v560, v561, v562, v563,&
                v564, v565, v566, v567, v568, v569, v57, v570, v571, v572,&
                v573, v574, v575, v576, v577, v578, v579, v58, v580, v581,&
                v582, v583, v584, v585, v586, v587, v588, v589, v59, v590,&
                v591, v592, v593, v594, v595, v596, v597, v598, v599, v6, v60,&
                v600, v601, v602, v603, v604, v605, v606, v607, v608, v609,&
                v61, v610, v611, v612, v613, v614, v615, v616, v617, v618,&
                v619, v62, v620, v621, v622, v623, v624, v625, v626, v627,&
                v628, v629, v63, v630, v631, v632, v633, v634, v635, v636,&
                v637, v638, v639, v64, v640, v641, v642, v643, v644, v645,&
                v646, v647, v648, v649, v65, v650, v651, v652, v653, v654,&
                v655, v656, v657, v658, v659, v66, v660, v661, v662, v663,&
                v664, v665, v666, v667, v668, v669, v67, v670, v671, v672,&
                v673, v674, v675, v676, v677, v678, v679, v68, v680, v681,&
                v682, v683, v684, v685, v686, v687, v688, v689, v69, v690,&
                v691, v692, v693, v694, v695, v696, v697, v698, v699, v7, v70,&
                v700, v701, v702, v703, v704, v705, v706, v707, v708, v709,&
                v71, v710, v711, v712, v713, v714, v715, v716, v717, v718,&
                v719, v72, v720, v721, v722, v723, v724, v725, v726, v727,&
                v728, v729, v73, v730, v731, v732, v733, v734, v735, v736,&
                v737, v738, v739, v74, v740, v741, v742, v743, v744, v745,&
                v746, v747, v748, v749, v75, v750, v751, v752, v753, v754,&
                v755, v756, v757, v758, v759, v76, v760, v761, v762, v763,&
                v764, v765, v766, v767, v768, v769, v77, v770, v771, v772,&
                v773, v774, v775, v776, v777, v778, v779, v78, v780, v781,&
                v782, v783, v784, v785, v786, v787, v788, v789, v79, v790,&
                v791, v792, v793, v794, v795, v796, v797, v798, v799, v8, v80,&
                v800, v801, v802, v803, v804, v805, v806, v807, v808, v809,&
                v81, v810, v811, v812, v813, v814, v815, v816, v817, v818,&
                v819, v82, v820, v821, v822, v823, v824, v825, v826, v827,&
                v828, v829, v83, v830, v831, v832, v833, v834, v835, v836,&
                v837, v838, v839, v84, v840, v841, v842, v843, v844, v845,&
                v846, v847, v848, v849, v85, v850, v851, v852, v853, v854,&
                v855, v856, v857, v858, v859, v86, v860, v861, v862, v863,&
                v864, v865, v866, v867, v868, v869, v87, v870, v871, v872,&
                v873, v874, v875, v876, v877, v878, v879, v88, v880, v881,&
                v882, v883, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97,&
                v98, v99, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
                M_xxxyyzz, M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz,&
                M_xxyzzzz, M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz,&
                M_xyzzzzz, M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz,&
                M_yyzzzzz, M_yzzzzzz, M_zzzzzzz, S_0, S_x, S_y, S_z, S_xx,&
                S_xy, S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy,&
                S_xyz, S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy,&
                S_xxxz, S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz,&
                S_xzzz, S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx,&
                S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz,&
                S_xxyzz, S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz,&
                S_yyyyy, S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz,&
                S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy,&
                S_xxxyyz, S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy,&
                S_yyyyyz, S_xxxxxxx, S_xxxxxxy, S_xxxxxxz, S_xxxxxyy,&
                S_xxxxxyz, S_xxxxyyy, S_xxxxyyz, S_xxxyyyy, S_xxxyyyz,&
                S_xxyyyyy, S_xxyyyyz, S_xyyyyyy, S_xyyyyyz, S_yyyyyyy,&
                S_yyyyyyz
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
#define Ms_xxxxxxx           Ms(46)
#define M_xxxxxxx            M(46)
#define Ms_xxxxxxy           Ms(47)
#define M_xxxxxxy            M(47)
#define Ms_xxxxxxz           Ms(48)
#define M_xxxxxxz            M(48)
#define M_xxxxxyy            M(49)
#define Ms_xxxxxyy           Ms(49)
#define M_xxxxxyz            M(50)
#define Ms_xxxxxyz           Ms(50)
#define Ms_xxxxyyy           Ms(51)
#define M_xxxxyyy            M(51)
#define Ms_xxxxyyz           Ms(52)
#define M_xxxxyyz            M(52)
#define Ms_xxxyyyy           Ms(53)
#define M_xxxyyyy            M(53)
#define Ms_xxxyyyz           Ms(54)
#define M_xxxyyyz            M(54)
#define Ms_xxyyyyy           Ms(55)
#define M_xxyyyyy            M(55)
#define Ms_xxyyyyz           Ms(56)
#define M_xxyyyyz            M(56)
#define M_xyyyyyy            M(57)
#define Ms_xyyyyyy           Ms(57)
#define M_xyyyyyz            M(58)
#define Ms_xyyyyyz           Ms(58)
#define Ms_yyyyyyy           Ms(59)
#define M_yyyyyyy            M(59)
#define M_yyyyyyz            M(60)
#define Ms_yyyyyyz           Ms(60)
    v4         = x*y
    v5         = x*z
    v6         = y*z
    v7         = v4*z
    v15        = M_xx*x
    v16        = M_xy*y
    v17        = M_xz*z
    v20        = M_xy*x
    v21        = M_yy*y
    v22        = M_yz*z
    v23        = M_xx*z
    v24        = M_xz*x
    v25        = M_yy*z
    v26        = M_yz*y
    v37        = M_xxx*x
    v38        = 1.71428571428571d0*y
    v39        = M_xxy*v38
    v40        = M_xxz*z
    v46        = 0.857142857142857d0*M_xyz
    v49        = M_xxy*x
    v52        = M_xyy*y
    v54        = 3.0d0*M_xx
    v55        = M_xxx*z
    v56        = M_xxz*x
    v58        = M_xyy*z
    v59        = 3.0d0*M_xz
    v65        = 1.71428571428571d0*x
    v66        = M_xyy*v65
    v67        = M_yyy*y
    v68        = M_yyz*z
    v71        = M_xxy*z
    v74        = M_yyy*z
    v75        = M_yyz*y
    v81        = 3.0d0*M_yz
    v87        = M_xxxx*x
    v88        = M_xxxy*y
    v89        = M_xxxz*z
    v91        = M_xxyy*x
    v101       = M_yyyy*x
    v112       = M_xxxx*y
    v113       = M_xxxy*x
    v116       = M_xxyy*y
    v117       = M_xxyz*z
    v128       = M_yyyy*y
    v132       = M_xxyy*z
    v141       = M_xxxx*z
    v142       = M_xxxz*x
    v144       = M_xxyz*y
    v153       = M_yyyy*z
    v161       = M_xyyy*y
    v162       = M_xyyz*z
    v167       = M_xxxy*z
    v169       = M_xxyz*x
    v173       = M_xyyy*z
    v174       = M_xyyz*y
    v175       = 3.0d0*M_xyz
    v181       = M_xyyy*x
    v182       = M_yyyz*z
    v183       = M_xyyz*x
    v184       = M_yyyz*y
    v191       = M_xxyyz*z
    v193       = 0.12987012987013d0*z
    v206       = M_xxxxx*x
    v207       = M_xxxxy*y
    v208       = M_xxxxz*z
    v210       = M_xxxyy*x
    v217       = M_xxyyy*y
    v226       = M_xyyyy*x
    v238       = M_yyyyy*y
    v265       = M_xxxxx*y
    v266       = M_xxxxy*x
    v269       = M_xxxyy*y
    v270       = 1.81818181818182d0*M_xxxyz
    v273       = M_xxyyy*x
    v281       = M_xyyyy*y
    v290       = M_yyyyy*x
    v296       = 10.0d0*M_xxx
    v299       = M_xxxxx*z
    v300       = M_xxxxz*x
    v302       = M_xxxyy*z
    v303       = v270*y
    v310       = M_xxyyz*x
    v320       = M_xyyyy*z
    v324       = 5.45454545454545d0*M_xyz
    v336       = M_yyyyz*x
    v358       = 0.025974025974026d0*z
    v372       = M_xxxxy*z
    v373       = M_xxxxz*y
    v375       = M_xxxyz*x
    v380       = M_xxyyy*z
    v381       = M_xxyyz*y
    v397       = M_yyyyy*z
    v398       = M_yyyyz*y
    v407       = 0.545454545454545d0*z
    v413       = M_xyyyz*y
    v418       = M_yyyyz*z
    v420       = 1.81818181818182d0*M_xyyyz
    v421       = v420*x
    v443       = M_xxxxxx*x
    v444       = M_xxxxxy*y
    v445       = M_xxxxxz*z
    v447       = M_xxxxyy*x
    v454       = M_xxxyyy*y
    v455       = M_xxxyyz*z
    v491       = M_xyyyyy*y
    v492       = M_xyyyyz*z
    v515       = M_yyyyyy*x
    v550       = M_xxxxxx*y
    v551       = M_xxxxxy*x
    v554       = M_xxxxyy*y
    v555       = M_xxxxyz*z
    v561       = M_xxxyyy*x
    v575       = M_xxyyyz*z
    v595       = M_xyyyyy*x
    v616       = M_yyyyyy*y
    v617       = M_yyyyyz*z
    v648       = M_xxxxxx*z
    v649       = M_xxxxxz*x
    v651       = M_xxxxyy*z
    v652       = 0.559440559440559d0*v651
    v653       = M_xxxxyz*y
    v659       = M_xxxyyz*x
    v670       = M_xxyyyy*z
    v671       = M_xxyyyz*y
    v694       = M_xyyyyz*x
    v715       = M_yyyyyy*z
    v749       = M_xxyyyy*x
    v759       = M_xxxyyy*z
    v794       = M_xxxxxy*z
    v795       = M_xxxxxz*y
    v797       = M_xxxxyz*x
    v801       = M_xxxyyz*y
    v808       = M_xxyyyz*x
    v817       = M_xyyyyy*z
    v818       = M_xyyyyz*y
    v830       = M_yyyyyz*x
    v844       = M_xxyyyy*y
    v850       = 0.0163170163170163d0*z
    v857       = 0.559440559440559d0*v670
    v867       = M_yyyyyz*y
    Ms_0       = M_0
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    v93        = M_xxzz*x
    v106       = M_xxzz*y
    v133       = M_xxzz*z
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v102       = M_yyzz*x
    v107       = M_yyzz*y
    v136       = M_yyzz*z
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    v212       = M_xxxzz*x
    v247       = M_xxxzz*y
    v306       = M_xxxzz*z
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    v219       = M_xxyzz*y
    v250       = M_xxyzz*x
    v359       = M_xxyzz*z
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    v315       = M_xxzzz*x
    v361       = M_xxzzz*y
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    v871       = M_xxxzz + M_xyyzz
    v159       = -0.0476190476190476d0*(M_xxxxx + v102 + v871 + v93)
    v227       = M_xyyzz*x
    v256       = M_xyyzz*y
    v323       = M_xyyzz*z
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -v871
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    v872       = M_xxyzz + M_yyyzz
    v108       = -0.0476190476190476d0*(M_yyyyy + v106 + v107 + v872)
    v239       = M_yyyzz*y
    v258       = M_yyyzz*x
    v362       = M_yyyzz*z
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v0         = M_xxzzz + M_yyzzz
    v340       = M_yyzzz*x
    v364       = M_yyzzz*y
    M_yzzzz    = -v872
    M_zzzzz    = -v0
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    v449       = M_xxxxzz*x
    v557       = M_xxxxzz*y
    v656       = M_xxxxzz*z
    v855       = 0.174825174825175d0*v656
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    v457       = M_xxxyzz*y
    v563       = M_xxxyzz*x
    v761       = M_xxxyzz*z
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    v462       = M_xxxzzz*z
    v664       = M_xxxzzz*x
    v763       = M_xxxzzz*y
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    v528       = M_xxyyzz*y
    v674       = M_xxyyzz*z
    v675       = -1.22377622377622d0*v674
    v745       = M_xxyyzz*x
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    v529       = M_xxyzzz*z
    v767       = M_xxyzzz*x
    v866       = M_xxyzzz*y
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    v476       = M_xxzzzz*x
    v531       = M_xxzzzz*y
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    v493       = M_xyyyzz*y
    v596       = M_xyyyzz*x
    v774       = M_xyyyzz*z
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    v873       = M_xxxzzz + M_xyyzzz
    v1         = v873
    v498       = M_xyyzzz*z
    v698       = M_xyyzzz*x
    v776       = M_xyyzzz*y
    v869       = x*(M_xxxxxz + v1)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -v1
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    v517       = M_yyyyzz*x
    v717       = M_yyyyzz*z
    v718       = 0.174825174825175d0*v717
    v865       = M_yyyyzz*y
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v874       = M_xxyzzz + M_yyyzzz
    v2         = v874
    v532       = M_yyyzzz*z
    v740       = y*(M_yyyyyz + v2)
    v784       = M_yyyzzz*x
    v868       = M_yyyzzz*y
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v875       = M_xxzzzz + M_yyzzzz
    v3         = v875
    v524       = M_yyzzzz*x
    v534       = M_yyzzzz*y
    v739       = 0.0815850815850816d0*v3*z
    M_yzzzzz   = -v2
    M_zzzzzz   = -v3
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v747       = 0.034965034965035d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v852       = 0.034965034965035d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v428       = -0.244755244755245d0*M_xxxyyzz
    v748       = -0.104895104895105d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v538       = -0.244755244755245d0*M_xxyyyzz
    v841       = -0.104895104895105d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v634       = -0.244755244755245d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v635       = 0.0116550116550117d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    v876       = M_xxxzzzz + M_xyyzzzz
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -v876
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v539       = 0.034965034965035d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v636       = 0.034965034965035d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v877       = M_xxyzzzz + M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v637       = 0.0116550116550117d0*M_yyzzzzz
    v883       = v634 + v635 + v637 + v675 + v739
    v851       = M_xxzzzz*v850 + M_yyzzzz*v850 + 0.00233100233100233d0*(-21.0d0*M_xxyyzzz &
      + M_xxzzzzz + M_yyzzzzz - 105.0d0*v674)
    M_yzzzzzz  = -v877
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    S_0        = 1
    S_x        = x
    S_y        = y
    S_z        = z
    S_xy       = v4
    v33        = M_xy*S_xy
    v48        = M_xx*S_xy
    v53        = M_yy*S_xy
    v62        = M_yz*S_xy
    v73        = M_xz*S_xy
    v90        = M_xxy*S_xy
    v111       = M_xxx*S_xy
    v121       = M_xyy*S_xy
    v135       = M_xyz*S_xy
    v164       = M_yyy*S_xy
    v170       = M_xxz*S_xy
    v178       = M_yyz*S_xy
    v209       = M_xxxy*S_xy
    v249       = M_xxyy*S_xy
    v251       = M_xxzz*S_xy
    v259       = M_yyzz*S_xy
    v264       = M_xxxx*S_xy
    v289       = M_yyyy*S_xy
    v311       = M_xxyz*S_xy
    v350       = M_xyyy*S_xy
    v376       = M_xxxz*S_xy
    v389       = M_xyyz*S_xy
    v414       = M_yyyz*S_xy
    v446       = M_xxxxy*S_xy
    v467       = M_xxyyy*S_xy
    v470       = M_xxyzz*S_xy
    v514       = M_yyyyy*S_xy
    v518       = M_yyyzz*S_xy
    v549       = M_xxxxx*S_xy
    v560       = M_xxxyy*S_xy
    v565       = M_xxxzz*S_xy
    v594       = M_xyyyy*S_xy
    v598       = M_xyyzz*S_xy
    v660       = M_xxxyz*S_xy
    v765       = M_xxyyz*S_xy
    v769       = M_xxzzz*S_xy
    v786       = M_yyzzz*S_xy
    v798       = M_xxxxz*S_xy
    v831       = M_yyyyz*S_xy
    v859       = M_xyyyz*S_xy
    Ms_xy      = M_0*S_xy + M_xy
    S_xz       = v5
    v41        = M_xz*S_xz
    v61        = M_yy*S_xz
    v72        = M_xy*S_xz
    v92        = M_xxz*S_xz
    v122       = M_xyz*S_xz
    v140       = M_xxx*S_xz
    v147       = M_xyy*S_xz
    v165       = M_yyz*S_xz
    v168       = 3.0d0*S_xz
    v177       = M_yyy*S_xz
    v211       = M_xxxz*S_xz
    v274       = M_xxyz*S_xz
    v298       = M_xxxx*S_xz
    v309       = M_xxyy*S_xz
    v314       = M_xxzz*S_xz
    v335       = M_yyyy*S_xz
    v339       = M_yyzz*S_xz
    v348       = 0.242424242424242d0*v211
    v351       = M_xyyz*S_xz
    v374       = M_xxxy*S_xz
    v388       = M_xyyy*S_xz
    v409       = M_yyyz*S_xz
    v448       = M_xxxxz*S_xz
    v468       = M_xxyyz*S_xz
    v475       = M_xxzzz*S_xz
    v516       = M_yyyyz*S_xz
    v523       = M_yyzzz*S_xz
    v562       = M_xxxyz*S_xz
    v647       = M_xxxxx*S_xz
    v658       = M_xxxyy*S_xz
    v663       = M_xxxzz*S_xz
    v693       = M_xyyyy*S_xz
    v697       = M_xyyzz*S_xz
    v766       = M_xxyzz*S_xz
    v783       = M_yyyzz*S_xz
    v796       = M_xxxxy*S_xz
    v807       = M_xxyyy*S_xz
    v829       = M_yyyyy*S_xz
    v842       = 0.839160839160839d0*v562
    v845       = M_xyyyz*S_xz
    v856       = 0.34965034965035d0*v663
    v860       = 0.34965034965035d0*v697
    Ms_xz      = M_0*S_xz + M_xz
    S_yz       = v6
    v43        = M_yz*S_yz
    v47        = -0.142857142857143d0*(7.0d0*v46*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v57        = M_xy*S_yz
    v70        = M_xx*S_yz
    v80        = 3.0d0*S_yz
    v97        = M_xyz*S_yz
    v118       = M_xxz*S_yz
    v129       = M_yyz*S_yz
    v143       = M_xxy*S_yz
    v152       = M_yyy*S_yz
    v166       = M_xxx*S_yz
    v218       = M_xxyz*S_yz
    v271       = M_xxxz*S_yz
    v282       = M_xyyz*S_yz
    v301       = M_xxxy*S_yz
    v319       = M_xyyy*S_yz
    v354       = M_yyyz*S_yz
    v355       = 0.242424242424242d0*v354
    v360       = M_xxzz*S_yz
    v363       = M_yyzz*S_yz
    v371       = M_xxxx*S_yz
    v379       = M_xxyy*S_yz
    v396       = M_yyyy*S_yz
    v456       = M_xxxyz*S_yz
    v530       = M_xxzzz*S_yz
    v533       = M_yyzzz*S_yz
    v556       = M_xxxxz*S_yz
    v576       = M_xxyyz*S_yz
    v618       = M_yyyyz*S_yz
    v650       = M_xxxxy*S_yz
    v669       = M_xxyyy*S_yz
    v678       = M_xxyzz*S_yz
    v679       = 0.34965034965035d0*v678
    v714       = M_yyyyy*S_yz
    v721       = M_yyyzz*S_yz
    v722       = 0.34965034965035d0*v721
    v750       = M_xyyyz*S_yz
    v751       = 0.839160839160839d0*v750
    v762       = M_xxxzz*S_yz
    v775       = M_xyyzz*S_yz
    v793       = M_xxxxx*S_yz
    v800       = M_xxxyy*S_yz
    v816       = M_xyyyy*S_yz
    Ms_yz      = M_0*S_yz + M_yz
    S_xyz      = v7
    v103       = M_yz*S_xyz
    v123       = M_xz*S_xyz
    v134       = M_xy*S_xyz
    v137       = 0.0476190476190476d0*(18.0d0*v132 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v133 + 48.0d0*v134 + 48.0d0*v135 + 5.0d0*v136))
    v194       = M_xyz*S_xyz
    v275       = M_xxz*S_xyz
    v291       = M_yyz*S_xyz
    v307       = 5.45454545454545d0*S_xyz
    v308       = M_xxy*v307
    v334       = M_yyy*S_xyz
    v370       = M_xxx*S_xyz
    v419       = M_xyy*v307
    v469       = M_xxyz*S_xyz
    v564       = M_xxxz*S_xyz
    v597       = M_xyyz*S_xyz
    v657       = M_xxxy*S_xyz
    v692       = M_xyyy*S_xyz
    v754       = M_yyyz*S_xyz
    v755       = 0.839160839160839d0*v754
    v764       = M_xxyy*S_xyz
    v768       = M_xxzz*S_xyz
    v785       = M_yyzz*S_xyz
    v792       = M_xxxx*S_xyz
    v828       = M_yyyy*S_xyz
    v843       = 0.839160839160839d0*v564
    Ms_xyz     = M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v8         = a2
    a3         = a1*a2
    a4         = a2*a2
    v28        = a4
    a5         = a2*a3
    a6         = a3*a3
    v186       = a6
    a7         = a3*a4
    a8         = a4*a4
    b2         = b1*b1
    v9         = b2
    v64        = v8*v9
    v345       = v28*v9
    b3         = b1*b2
    b4         = b2*b2
    v78        = b4
    v416       = v78*v8
    b5         = b2*b3
    b6         = b3*b3
    v424       = b6
    b7         = b3*b4
    b8         = b4*b4
    c2         = c1*c1
    h          = c2 + v8 + v9
    v10        = 0.333333333333333d0*h
    v11        = -v10
    v12        = v11 + v8
    v13        = v11 + v9
    v14        = -0.6d0*h
    v18        = -0.2d0*h
    v19        = v18 + v8
    v27        = v18 + v9
    v29        = h*h
    v30        = 0.0857142857142857d0*v29
    v31        = h*v8
    v44        = -0.428571428571429d0*h
    v45        = v44 + v8
    v63        = 0.142857142857143d0*h
    v69        = -v63
    v77        = v44 + v9
    v79        = h*v9
    v82        = 0.238095238095238d0*v29
    v104       = 0.0476190476190476d0*v29
    v105       = 0.333333333333333d0*(-2.0d0*v31) + v104 + v28
    v158       = -0.111111111111111d0*v31
    v180       = v64 + 0.111111111111111d0*(-v79)
    v185       = 0.333333333333333d0*(-2.0d0*v79) + v104 + v78
    v187       = h*h*h
    v188       = -0.0216450216450216d0*v187
    v189       = h*v28
    v190       = v29*v8
    v244       = 0.151515151515152d0*v29
    v245       = 0.0909090909090909d0*(-10.0d0*v31) + v244 + v28
    v343       = 0.545454545454545d0*v31
    v344       = -0.00432900432900433d0*(v187 + 231.0d0*v343*v9)
    v346       = 0.0303030303030303d0*v29
    v405       = -0.272727272727273d0*v31
    v406       = -0.272727272727273d0*v79
    v410       = v346 + v64
    v415       = h*v78
    v417       = v29*v9
    v423       = 0.0909090909090909d0*(-10.0d0*v79) + v244 + v78
    v427       = -0.0815850815850816d0*v187
    v526       = -0.0116550116550117d0*v187
    v527       = v186 + v526 + 0.00699300699300699d0*(-165.0d0*v189 + 45.0d0*v190)
    v741       = -0.0769230769230769d0*v189
    v742       = 0.104895104895105d0*v29
    v743       = 0.769230769230769d0*v31
    v744       = -v743*v9
    v879       = v526 + v744
    v838       = -0.461538461538462d0*v31*v9
    v839       = 0.00699300699300699d0*(-v187) + v838
    v840       = 0.020979020979021d0*v417
    v880       = v345 + v840
    v849       = 0.00233100233100233d0*(-v187) + v838
    v863       = 0.020979020979021d0*v190
    v882       = v416 + v863
    v864       = -0.0769230769230769d0*v415
    v870       = 0.00699300699300699d0*(-165.0d0*v415 + 45.0d0*v417) + v424 + v526
    S_xx       = v12
    v34        = M_yy*S_xx
    v36        = M_xx*S_xx
    v50        = M_xy*S_xx
    v76        = M_yz*S_xx
    v85        = M_xxx*S_xx
    v95        = M_xyy*S_xx
    v114       = M_xxy*S_xx
    v126       = M_yyy*S_xx
    v145       = M_xxz*S_xx
    v154       = M_yyz*S_xx
    v204       = M_xxxx*S_xx
    v215       = M_xxyy*S_xx
    v221       = M_xxzz*S_xx
    v236       = M_yyyy*S_xx
    v241       = M_yyzz*S_xx
    v267       = M_xxxy*S_xx
    v279       = M_xyyy*S_xx
    v304       = M_xxxz*S_xx
    v321       = M_xyyz*S_xx
    v382       = M_xxyz*S_xx
    v399       = M_yyyz*S_xx
    v441       = M_xxxxx*S_xx
    v452       = M_xxxyy*S_xx
    v460       = M_xxxzz*S_xx
    v489       = M_xyyyy*S_xx
    v496       = M_xyyzz*S_xx
    v552       = M_xxxxy*S_xx
    v573       = M_xxyyy*S_xx
    v579       = M_xxyzz*S_xx
    v614       = M_yyyyy*S_xx
    v621       = M_yyyzz*S_xx
    v654       = M_xxxxz*S_xx
    v672       = M_xxyyz*S_xx
    v687       = M_xxzzz*S_xx
    v716       = M_yyyyz*S_xx
    v730       = M_yyzzz*S_xx
    v773       = M_xyyyz*S_xx
    v802       = M_xxxyz*S_xx
    v854       = -0.20979020979021d0*v654
    Ms_xx      = M_0*S_xx + M_xx
    S_yy       = v13
    v32        = M_xx*S_yy
    v35        = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v33 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v32 + 4.0d0*v34))
    v42        = M_yy*S_yy
    v51        = M_xy*S_yy
    v60        = M_xz*S_yy
    v86        = M_xxx*S_yy
    v96        = M_xyy*S_yy
    v115       = M_xxy*S_yy
    v127       = M_yyy*S_yy
    v146       = M_xxz*S_yy
    v155       = M_yyz*S_yy
    v205       = M_xxxx*S_yy
    v216       = M_xxyy*S_yy
    v222       = M_xxzz*S_yy
    v237       = M_yyyy*S_yy
    v242       = M_yyzz*S_yy
    v268       = M_xxxy*S_yy
    v280       = M_xyyy*S_yy
    v305       = M_xxxz*S_yy
    v322       = M_xyyz*S_yy
    v383       = M_xxyz*S_yy
    v400       = M_yyyz*S_yy
    v442       = M_xxxxx*S_yy
    v453       = M_xxxyy*S_yy
    v461       = M_xxxzz*S_yy
    v490       = M_xyyyy*S_yy
    v497       = M_xyyzz*S_yy
    v553       = M_xxxxy*S_yy
    v574       = M_xxyyy*S_yy
    v580       = M_xxyzz*S_yy
    v615       = M_yyyyy*S_yy
    v622       = M_yyyzz*S_yy
    v632       = M_yyyyz*S_yy
    v633       = -0.20979020979021d0*v632
    v655       = M_xxxxz*S_yy
    v673       = M_xxyyz*S_yy
    v688       = M_xxzzz*S_yy
    v731       = M_yyzzz*S_yy
    v760       = M_xxxyz*S_yy
    v819       = M_xyyyz*S_yy
    Ms_yy      = M_0*S_yy + M_yy
    S_zz       = -(S_xx + S_yy)
    S_xxx      = x*(v14 + v8)
    v83        = M_xx*S_xxx
    v99        = M_yy*S_xxx
    v119       = M_xy*S_xxx
    v148       = M_xz*S_xxx
    v179       = M_yz*S_xxx
    v202       = M_xxx*S_xxx
    v224       = M_xyy*S_xxx
    v257       = M_yyy*S_xxx
    v272       = M_xxy*S_xxx
    v312       = 10.0d0*S_xxx
    v337       = M_yyz*S_xxx
    v390       = M_xyz*S_xxx
    v439       = M_xxxx*S_xxx
    v465       = M_xxyy*S_xxx
    v473       = M_xxzz*S_xxx
    v512       = M_yyyy*S_xxx
    v521       = M_yyzz*S_xxx
    v558       = M_xxxy*S_xxx
    v592       = M_xyyy*S_xxx
    v661       = M_xxxz*S_xxx
    v695       = M_xyyz*S_xxx
    v832       = M_yyyz*S_xxx
    Ms_xxx     = 0.2d0*(9.0d0*v15 + 3.0d0*(-2.0d0*v16 - 2.0d0*v17)) + M_0*S_xxx + M_xxx
    S_xxy      = v19*y
    v94        = M_xy*S_xxy
    v109       = M_xx*S_xxy
    v124       = M_yy*S_xxy
    v156       = M_yz*S_xxy
    v213       = M_xxy*S_xxy
    v234       = M_yyy*S_xxy
    v255       = M_xyy*S_xxy
    v263       = M_xxx*S_xxy
    v325       = S_xxy*v324
    v384       = M_xxz*S_xxy
    v401       = M_yyz*S_xxy
    v450       = M_xxxy*S_xxy
    v487       = M_xyyy*S_xxy
    v547       = M_xxxx*S_xxy
    v571       = M_xxyy*S_xxy
    v583       = M_xxzz*S_xxy
    v612       = M_yyyy*S_xxy
    v625       = M_yyzz*S_xxy
    v676       = M_xxyz*S_xxy
    v719       = M_yyyz*S_xxy
    v803       = M_xxxz*S_xxy
    v820       = M_xyyz*S_xxy
    Ms_xxy     = 0.2d0*(8.0d0*v20 + 2.0d0*(-v21 - v22)) + M_0*S_xxy + M_xx*y + M_xxy
    S_xxz      = v19*z
    v98        = M_xz*S_xxz
    v130       = M_yz*S_xxz
    v138       = M_xx*S_xxz
    v150       = M_yy*S_xxz
    v171       = M_xy*S_xxz
    v195       = M_yyz*S_xxz
    v220       = M_xxz*S_xxz
    v283       = M_xyz*S_xxz
    v317       = M_xyy*S_xxz
    v377       = M_xxy*S_xxz
    v395       = M_yyy*S_xxz
    v458       = M_xxxz*S_xxz
    v494       = M_xyyz*S_xxz
    v577       = M_xxyz*S_xxz
    v619       = M_yyyz*S_xxz
    v645       = M_xxxx*S_xxz
    v667       = M_xxyy*S_xxz
    v685       = M_xxzz*S_xxz
    v712       = M_yyyy*S_xxz
    v728       = M_yyzz*S_xxz
    v815       = M_xyyy*S_xxz
    Ms_xxz     = M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v23 + 8.0d0*v24 + 2.0d0*(v25 - v26))
    S_xyy      = v27*x
    v84        = M_xx*S_xyy
    v100       = M_yy*S_xyy
    v120       = M_xy*S_xyy
    v149       = M_xz*S_xyy
    v203       = M_xxx*S_xyy
    v225       = M_xyy*S_xyy
    v248       = M_xxy*S_xyy
    v288       = M_yyy*S_xyy
    v313       = M_xxz*S_xyy
    v338       = M_yyz*S_xyy
    v422       = S_xyy*v324
    v440       = M_xxxx*S_xyy
    v466       = M_xxyy*S_xyy
    v474       = M_xxzz*S_xyy
    v513       = M_yyyy*S_xyy
    v522       = M_yyzz*S_xyy
    v559       = M_xxxy*S_xyy
    v593       = M_xyyy*S_xyy
    v662       = M_xxxz*S_xyy
    v696       = M_xyyz*S_xyy
    v809       = M_xxyz*S_xyy
    v833       = M_yyyz*S_xyy
    Ms_xyy     = 0.2d0*(8.0d0*v16 + 2.0d0*(-v15 - v17)) + M_0*S_xyy + M_xyy + M_yy*x
    S_xzz      = -(S_xxx + S_xyy)
    S_yyy      = y*(v14 + v9)
    v110       = M_xx*S_yyy
    v125       = M_yy*S_yyy
    v157       = M_yz*S_yyy
    v160       = M_xy*S_yyy
    v176       = M_xz*S_yyy
    v214       = M_xxy*S_yyy
    v235       = M_yyy*S_yyy
    v246       = M_xxx*S_yyy
    v278       = M_xyy*S_yyy
    v326       = M_xyz*S_yyy
    v385       = M_xxz*S_yyy
    v426       = 10.0d0*S_yyy
    v451       = M_xxxy*S_yyy
    v488       = M_xyyy*S_yyy
    v548       = M_xxxx*S_yyy
    v572       = M_xxyy*S_yyy
    v584       = M_xxzz*S_yyy
    v613       = M_yyyy*S_yyy
    v626       = M_yyzz*S_yyy
    v677       = M_xxyz*S_yyy
    v720       = M_yyyz*S_yyy
    v804       = M_xxxz*S_yyy
    Ms_yyy     = 0.2d0*(9.0d0*v21 + 3.0d0*(-2.0d0*v20 - 2.0d0*v22)) + M_0*S_yyy + M_yyy
    S_yyz      = v27*z
    v131       = M_yz*S_yyz
    v139       = M_xx*S_yyz
    v151       = M_yy*S_yyz
    v163       = M_xz*S_yyz
    v172       = M_xy*S_yyz
    v192       = M_xxz*S_yyz
    v196       = M_xxzzz*v193 + M_yyzzz*v193 + 0.00432900432900433d0*(-75.0d0*M_xxyyzz + &
      60.0d0*v191 + 1440.0d0*v194 + 5.0d0*(M_xxzzzz + M_yyzzzz - 8.0d0* &
      v192 - 8.0d0*v195))
    v240       = M_yyz*S_yyz
    v284       = M_xyz*S_yyz
    v297       = M_xxx*S_yyz
    v318       = M_xyy*S_yyz
    v347       = 0.00432900432900433d0*(-15.0d0*M_xxyyzz - 240.0d0*v191 - 720.0d0*v194 + &
      v875 - 260.0d0*(v192 + v195))
    v378       = M_xxy*S_yyz
    v425       = 10.0d0*S_yyz
    v459       = M_xxxz*S_yyz
    v495       = M_xyyz*S_yyz
    v578       = M_xxyz*S_yyz
    v620       = M_yyyz*S_yyz
    v646       = M_xxxx*S_yyz
    v668       = M_xxyy*S_yyz
    v686       = M_xxzz*S_yyz
    v713       = M_yyyy*S_yyz
    v729       = M_yyzz*S_yyz
    v799       = M_xxxy*S_yyz
    Ms_yyz     = M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v25 + 8.0d0*v26 + 2.0d0*(v23 - v24))
    S_yzz      = -(S_xxy + S_yyy)
    S_zzz      = -(S_xxz + S_yyz)
    S_xxxx     = 0.142857142857143d0*(-6.0d0*v31) + v28 + v30
    v197       = M_xx*S_xxxx
    v229       = M_yy*S_xxxx
    v276       = M_xy*S_xxxx
    v327       = M_xz*S_xxxx
    v402       = M_yz*S_xxxx
    v434       = M_xxx*S_xxxx
    v482       = M_xyy*S_xxxx
    v566       = M_xxy*S_xxxx
    v607       = M_yyy*S_xxxx
    v680       = M_xxz*S_xxxx
    v723       = M_yyz*S_xxxx
    v821       = M_xyz*S_xxxx
    Ms_xxxx    = M_0*S_xxxx + v35 - v39 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v36 + 80.0d0*v37 - 60.0d0*v40 - 96.0d0*v41 + &
      24.0d0*(v42 + v43))
    S_xxxy     = v4*v45
    v223       = M_xy*S_xxxy
    v261       = M_xx*S_xxxy
    v286       = M_yy*S_xxxy
    v341       = M_yz*S_xxxy
    v391       = M_xz*S_xxxy
    v463       = M_xxy*S_xxxy
    v510       = M_yyy*S_xxxy
    v545       = M_xxx*S_xxxy
    v590       = M_xyy*S_xxxy
    v699       = M_xyz*S_xxxy
    v834       = M_yyz*S_xxxy
    Ms_xxxy    = M_0*S_xxxy + M_xxx*y + M_xxxy + v47 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v48 + 5.0d0*v49 + 5.0d0*v50 - 2.0d0*v51 - 2.0d0*v52 - 2.0d0*v53))
    S_xxxz     = v45*v5
    v228       = M_xz*S_xxxz
    v292       = M_yz*S_xxxz
    v294       = M_xx*S_xxxz
    v332       = M_yy*S_xxxz
    v352       = 0.242424242424242d0*v228
    v386       = M_xy*S_xxxz
    v471       = M_xxz*S_xxxz
    v519       = M_yyz*S_xxxz
    v599       = M_xyz*S_xxxz
    v643       = M_xxx*S_xxxz
    v690       = M_xyy*S_xxxz
    v805       = M_xxy*S_xxxz
    v827       = M_yyy*S_xxxz
    v846       = 0.839160839160839d0*v599
    Ms_xxxz    = 0.142857142857143d0*(13.0d0*v55 + 15.0d0*v56 + 6.0d0*(-v57 + v58 + v60 + &
      v61 - v62)) + M_0*S_xxxz + M_xxxz + S_xx*v59 + S_xz*v54 - v46*y
    S_xxyy     = 0.0285714285714286d0*v29 - v63*v8 - v63*v9 + v64
    v198       = M_xx*S_xxyy
    v230       = M_yy*S_xxyy
    v252       = M_xy*S_xxyy
    v328       = M_xz*S_xxyy
    v403       = M_yz*S_xxyy
    v435       = M_xxx*S_xxyy
    v483       = M_xyy*S_xxyy
    v567       = M_xxy*S_xxyy
    v608       = M_yyy*S_xxyy
    v681       = M_xxz*S_xxyy
    v724       = M_yyz*S_xxyy
    v777       = M_xyz*S_xxyy
    Ms_xxyy    = M_0*S_xxyy + v39 + v66 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v33 + 39.0d0*(v32 + v34) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v36 + 10.0d0*v37 + 10.0d0*v40 + 12.0d0*v41 + 12.0d0*v42 + &
      12.0d0*v43 + 10.0d0*v67 + 10.0d0*v68))
    S_xxyz     = v6*(v69 + v8)
    v243       = M_yz*S_xxyz
    v285       = M_xz*S_xxyz
    v316       = M_xy*S_xxyz
    v368       = M_xx*S_xxyz
    v393       = M_yy*S_xxyz
    v499       = M_xyz*S_xxyz
    v581       = M_xxz*S_xxyz
    v623       = M_yyz*S_xxyz
    v665       = M_xxy*S_xxyz
    v710       = M_yyy*S_xxyz
    v813       = M_xyy*S_xxyz
    Ms_xxyz    = 0.142857142857143d0*(12.0d0*(v72 + v73) + 2.0d0*(v74 - v75) + 9.0d0*(v70 &
      + v71 + v76)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v65
    S_xxzz     = -(S_xxxx + S_xxyy)
    v199       = M_xx*S_xxzz
    v231       = M_yy*S_xxzz
    v253       = M_xy*S_xxzz
    v329       = M_xz*S_xxzz
    v365       = M_yz*S_xxzz
    v436       = M_xxx*S_xxzz
    v484       = M_xyy*S_xxzz
    v568       = M_xxy*S_xxzz
    v609       = M_yyy*S_xxzz
    v682       = M_xxz*S_xxzz
    v725       = M_yyz*S_xxzz
    v778       = M_xyz*S_xxzz
    S_xyyy     = v4*v77
    v262       = M_xx*S_xyyy
    v287       = M_yy*S_xyyy
    v342       = M_yz*S_xyyy
    v349       = M_xy*S_xyyy
    v392       = M_xz*S_xyyy
    v464       = M_xxy*S_xyyy
    v511       = M_yyy*S_xyyy
    v546       = M_xxx*S_xyyy
    v591       = M_xyy*S_xyyy
    v700       = M_xyz*S_xyyy
    v810       = M_xxz*S_xyyy
    Ms_xyyy    = M_0*S_xyyy + M_xyyy + M_yyy*x + v47 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v48 - 2.0d0*v49 - 2.0d0*v50 + 5.0d0*v51 + 5.0d0*v52 + 5.0d0*v53 &
      ))
    S_xyyz     = v5*(v69 + v9)
    v293       = M_yz*S_xyyz
    v295       = M_xx*S_xyyz
    v333       = M_yy*S_xyyz
    v353       = M_xz*S_xyyz
    v387       = M_xy*S_xyyz
    v472       = M_xxz*S_xyyz
    v520       = M_yyz*S_xyyz
    v600       = M_xyz*S_xyyz
    v644       = M_xxx*S_xyyz
    v691       = M_xyy*S_xyyz
    v806       = M_xxy*S_xyyz
    Ms_xyyz    = 0.142857142857143d0*(2.0d0*(v55 - v56) + 12.0d0*(v57 + v62) + 9.0d0*(v58 &
      + v60 + v61)) + M_0*S_xyyz + M_xyyz + M_xyz*v38 + M_yyz*x
    S_xyzz     = -(S_xxxy + S_xyyy)
    S_xzzz     = -(S_xxxz + S_xyyz)
    S_yyyy     = 0.142857142857143d0*(-6.0d0*v79) + v30 + v78
    v200       = M_xx*S_yyyy
    v232       = M_yy*S_yyyy
    v277       = M_xy*S_yyyy
    v330       = M_xz*S_yyyy
    v404       = M_yz*S_yyyy
    v437       = M_xxx*S_yyyy
    v485       = M_xyy*S_yyyy
    v569       = M_xxy*S_yyyy
    v610       = M_yyy*S_yyyy
    v683       = M_xxz*S_yyyy
    v726       = M_yyz*S_yyyy
    v822       = M_xyz*S_yyyy
    Ms_yyyy    = M_0*S_yyyy + v35 - v66 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v42 - 96.0d0*v43 + 80.0d0*v67 - 60.0d0*v68 + &
      24.0d0*(v36 + v41))
    S_yyyz     = v6*v77
    v356       = M_yz*S_yyyz
    v357       = 0.242424242424242d0*v356
    v369       = M_xx*S_yyyz
    v394       = M_yy*S_yyyz
    v408       = M_xz*S_yyyz
    v412       = M_xy*S_yyyz
    v582       = M_xxz*S_yyyz
    v624       = M_yyz*S_yyyz
    v666       = M_xxy*S_yyyz
    v711       = M_yyy*S_yyyz
    v752       = M_xyz*S_yyyz
    v753       = 0.839160839160839d0*v752
    v791       = M_xxx*S_yyyz
    v814       = M_xyy*S_yyyz
    Ms_yyyz    = 0.142857142857143d0*(13.0d0*v74 + 15.0d0*v75 + 6.0d0*(v70 + v71 - v72 - &
      v73 + v76)) + M_0*S_yyyz + M_yy*v80 + M_yyyz + S_yy*v81 - v46*x
    S_yyzz     = -(S_xxyy + S_yyyy)
    v201       = M_xx*S_yyzz
    v233       = M_yy*S_yyzz
    v254       = M_xy*S_yyzz
    v260       = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz + &
      4.0d0*v246 - v247 - 24.0d0*v248 - 30.0d0*v249 - v250 - v251 - &
      30.0d0*v252 - v253 - v254 - 24.0d0*v255 - v256 + 4.0d0*v257 - &
      v258 - v259))
    v331       = M_xz*S_yyzz
    v366       = M_yz*S_yyzz
    v367       = -0.0303030303030303d0*(M_yyyyyz + v361 + v364 + v874 + 5.0d0*(v359 + &
      v360 + v362 + v363 + v365 + v366))
    v411       = -0.0303030303030303d0*(M_xxxxxz + v315 + v340 + v873 + 5.0d0*(v306 + &
      v314 + v323 + v329 + v331 + v339))
    v438       = M_xxx*S_yyzz
    v486       = M_xyy*S_yyzz
    v570       = M_xxy*S_yyzz
    v611       = M_yyy*S_yyzz
    v684       = M_xxz*S_yyzz
    v727       = M_yyz*S_yyzz
    v779       = M_xyz*S_yyzz
    S_yzzz     = -(S_xxyz + S_yyyz)
    S_zzzz     = -(S_xxzz + S_yyzz)
    S_xxxxx    = x*(0.111111111111111d0*(-10.0d0*v31) + v28 + v82)
    v429       = M_xx*S_xxxxx
    v505       = M_yy*S_xxxxx
    v585       = M_xy*S_xxxxx
    v701       = M_xz*S_xxxxx
    v835       = M_yz*S_xxxxx
    Ms_xxxxx   = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v87 &
      - 30.0d0*(M_xxxyy + v91) + 330.0d0*(v83 + v85) - 140.0d0*(v88 + &
      v89) + 120.0d0*(v100 + v103 + v96 + v97) + 60.0d0*(v84 + v86 + &
      v95 + v99) - 300.0d0*(v90 + v92 + v94 + v98) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v101 + v102 + v93))
    S_xxxxy    = v105*y
    v477       = M_xy*S_xxxxy
    v540       = M_xx*S_xxxxy
    v602       = M_yy*S_xxxxy
    v732       = M_yz*S_xxxxy
    v823       = M_xz*S_xxxxy
    Ms_xxxxy   = M_0*S_xxxxy + v108 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v112) + &
      78.0d0*(v109 + v114) + 4.0d0*(v110 + v126) + 56.0d0*(v111 + v113 &
      + v119) + 8.0d0*(v125 + v127 + v129 + v131) - (2.0d0*M_xxyyy + &
      24.0d0*v115 + 30.0d0*v116 + 28.0d0*v117 + 28.0d0*v118 + 48.0d0* &
      v120 + 48.0d0*v121 + 48.0d0*v122 + 48.0d0*v123 + 24.0d0*v124 + &
      v128 + 28.0d0*v130))
    S_xxxxz    = v105*z
    v500       = M_xz*S_xxxxz
    v627       = M_yz*S_xxxxz
    v638       = M_xx*S_xxxxz
    v706       = M_yy*S_xxxxz
    v811       = M_xy*S_xxxxz
    v853       = -0.20979020979021d0*v638
    v881       = v853 + v854
    Ms_xxxxz   = M_0*S_xxxxz + v137 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v141 &
      + 56.0d0*v142 + 106.0d0*(v138 + v145) + 4.0d0*(v139 + v154) + &
      104.0d0*(v140 + v148) + 32.0d0*(v146 + v150) + 48.0d0*(v147 + &
      v149) + 8.0d0*(v151 + v155) - (M_yyyyz + 36.0d0*v143 + 28.0d0* &
      v144 + 8.0d0*v152 + 5.0d0*v153 + 36.0d0*v156 + 8.0d0*v157))
    S_xxxyy    = x*(-v10*v9 + v104 + v158 + v64)
    v430       = M_xx*S_xxxyy
    v506       = M_yy*S_xxxyy
    v586       = M_xy*S_xxxyy
    v702       = M_xz*S_xxxyy
    v836       = M_yz*S_xxxyy
    Ms_xxxyy   = M_0*S_xxxyy + v159 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v87 + &
      112.0d0*v88 - 14.0d0*v89 + 141.0d0*v91 - 3.0d0*(M_xyyyy + v101) + &
      159.0d0*(v84 + v95) + 75.0d0*(v86 + v99) + 276.0d0*(v90 + v94) - &
      60.0d0*(v100 + v103 + v96 + v97) - 18.0d0*(v83 + v85 + v92 + v98 &
      ) - 42.0d0*(v160 + v161 + v162 + v163 + v164 + v165))
    S_xxxyz    = v12*v7
    v525       = M_yz*S_xxxyz
    v601       = M_xz*S_xxxyz
    v689       = M_xy*S_xxxyz
    v782       = M_yy*S_xxxyz
    v790       = M_xx*S_xxxyz
    v847       = 0.839160839160839d0*v601
    Ms_xxxyz   = 0.333333333333333d0*(5.0d0*(v166 + v167 + v179) + 7.0d0*(v169 + v170 + &
      v171) + 2.0d0*(-v172 + v173 - v174 + v176 + v177 - v178)) + M_0* &
      S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy*v168 + S_xx*v175 + S_xxy*v59 &
      + S_xyz*v54
    S_xxxzz    = -(S_xxxxx + S_xxxyy)
    v431       = M_xx*S_xxxzz
    v507       = M_yy*S_xxxzz
    v587       = M_xy*S_xxxzz
    v703       = M_xz*S_xxxzz
    v787       = M_yz*S_xxxzz
    v861       = 0.34965034965035d0*v703
    S_xxyyy    = y*(-v10*v8 + v104 + v180)
    v478       = M_xy*S_xxyyy
    v541       = M_xx*S_xxyyy
    v603       = M_yy*S_xxyyy
    v733       = M_yz*S_xxyyy
    v824       = M_xz*S_xxyyy
    Ms_xxyyy   = M_0*S_xxyyy + v108 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v116 &
      - 17.0d0*v128 + 112.0d0*v181 - 14.0d0*v182 - 3.0d0*(M_xxxxy + &
      v112) + 75.0d0*(v110 + v126) + 159.0d0*(v115 + v124) + 276.0d0*( &
      v120 + v121) - 60.0d0*(v109 + v114 + v122 + v123) - 18.0d0*(v125 &
      + v127 + v129 + v131) - 42.0d0*(v111 + v113 + v117 + v118 + v119 &
      + v130))
    S_xxyyz    = z*(0.0158730158730159d0*v29 + v158 + v180)
    v501       = M_xz*S_xxyyz
    v628       = M_yz*S_xxyyz
    v639       = M_xx*S_xxyyz
    v707       = M_yy*S_xxyyz
    v770       = M_xy*S_xxyyz
    Ms_xxyyz   = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v134 + v135) + 9.0d0*(v141 + v153) + 112.0d0*(v144 + v183) + &
      6.0d0*(v140 + v148 + v152 + v157) + 132.0d0*(v143 + v147 + v149 + &
      v156) + 81.0d0*(v132 + v139 + v146 + v150 + v154) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v133 + 5.0d0*v136 + 6.0d0* &
      v138 + 14.0d0*v142 + 6.0d0*v145 + 6.0d0*v151 + 6.0d0*v155 + &
      14.0d0*v184))
    S_xxyzz    = -(S_xxxxy + S_xxyyy)
    v479       = M_xy*S_xxyzz
    v542       = M_xx*S_xxyzz
    v604       = M_yy*S_xxyzz
    v734       = M_yz*S_xxyzz
    v735       = 0.34965034965035d0*v734
    v780       = M_xz*S_xxyzz
    S_xxzzz    = -(S_xxxxz + S_xxyyz)
    v502       = M_xz*S_xxzzz
    v535       = M_yz*S_xxzzz
    v640       = M_xx*S_xxzzz
    v708       = M_yy*S_xxzzz
    v771       = M_xy*S_xxzzz
    S_xyyyy    = v185*x
    v432       = M_xx*S_xyyyy
    v508       = M_yy*S_xyyyy
    v588       = M_xy*S_xyyyy
    v704       = M_xz*S_xyyyy
    v837       = M_yz*S_xyyyy
    Ms_xyyyy   = M_0*S_xyyyy + v159 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v101) + &
      78.0d0*(v100 + v96) + 4.0d0*(v86 + v99) + 56.0d0*(v160 + v161 + &
      v164) + 8.0d0*(v83 + v85 + v92 + v98) - (2.0d0*M_xxxyy + 48.0d0* &
      v103 + 28.0d0*v162 + 28.0d0*v163 + 28.0d0*v165 + 24.0d0*v84 + v87 &
      + 48.0d0*v90 + 30.0d0*v91 + 48.0d0*v94 + 24.0d0*v95 + 48.0d0*v97 &
      ))
    S_xyyyz    = v13*v7
    v756       = M_yz*S_xyyyz
    v757       = 0.839160839160839d0*v756
    v758       = M_xx*S_xyyyz
    v826       = M_yy*S_xyyyz
    v848       = M_xz*S_xyyyz
    v858       = M_xy*S_xyyyz
    Ms_xyyyz   = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v172 + v174 + v178) + &
      5.0d0*(v173 + v176 + v177) + 2.0d0*(v166 + v167 - v169 - v170 - &
      v171 + v179)) + M_0*S_xyyyz + M_xyy*v80 + M_xyyyz + M_yyyz*x + &
      S_xyy*v81 + S_yy*v175
    S_xyyzz    = -(S_xxxyy + S_xyyyy)
    v433       = M_xx*S_xyyzz
    v509       = M_yy*S_xyyzz
    v589       = M_xy*S_xyyzz
    v705       = M_xz*S_xyyzz
    v788       = M_yz*S_xyyzz
    v862       = 0.34965034965035d0*v705
    S_xyzzz    = -(S_xxxyz + S_xyyyz)
    S_xzzzz    = -(S_xxxzz + S_xyyzz)
    S_yyyyy    = y*(0.111111111111111d0*(-10.0d0*v79) + v78 + v82)
    v480       = M_xy*S_yyyyy
    v543       = M_xx*S_yyyyy
    v605       = M_yy*S_yyyyy
    v736       = M_yz*S_yyyyy
    v825       = M_xz*S_yyyyy
    Ms_yyyyy   = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v128 &
      - 30.0d0*(M_xxyyy + v116) + 330.0d0*(v125 + v127) - 140.0d0*(v181 &
      + v182) + 120.0d0*(v109 + v114 + v122 + v123) + 60.0d0*(v110 + &
      v115 + v124 + v126) - 300.0d0*(v120 + v121 + v129 + v131) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v106 + v107 + v112))
    S_yyyyz    = v185*z
    v503       = M_xz*S_yyyyz
    v629       = M_yz*S_yyyyz
    v630       = M_yy*S_yyyyz
    v631       = -0.20979020979021d0*v630
    v878       = v631 + v633
    v641       = M_xx*S_yyyyz
    v812       = M_xy*S_yyyyz
    Ms_yyyyz   = M_0*S_yyyyz + v137 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v153 &
      + 56.0d0*v184 + 8.0d0*(v138 + v145) + 32.0d0*(v139 + v154) + &
      48.0d0*(v143 + v156) + 4.0d0*(v146 + v150) + 106.0d0*(v151 + v155 &
      ) + 104.0d0*(v152 + v157) - (M_xxxxz + 8.0d0*v140 + 5.0d0*v141 + &
      36.0d0*v147 + 8.0d0*v148 + 36.0d0*v149 + 28.0d0*v183))
    S_yyyzz    = -(S_xxyyy + S_yyyyy)
    v481       = M_xy*S_yyyzz
    v544       = M_xx*S_yyyzz
    v606       = M_yy*S_yyyzz
    v737       = M_yz*S_yyyzz
    v738       = 0.34965034965035d0*v737
    v781       = M_xz*S_yyyzz
    S_yyzzz    = -(S_xxyyz + S_yyyyz)
    v504       = M_xz*S_yyzzz
    v536       = M_yz*S_yyzzz
    v537       = 0.00233100233100233d0*(-75.0d0*v528 + 5.0d0*(6.0d0*v529 + 6.0d0*v530 + &
      v531 + 6.0d0*v532 + 6.0d0*v533 + v534 + 6.0d0*v535 + 6.0d0*v536 + &
      v877))
    v642       = M_xx*S_yyzzz
    v709       = M_yy*S_yyzzz
    v746       = 0.00233100233100233d0*(-75.0d0*v745 + 5.0d0*(6.0d0*v462 + 6.0d0*v475 + &
      v476 + 6.0d0*v498 + 6.0d0*v502 + 6.0d0*v504 + 6.0d0*v523 + v524 + &
      v876))
    v772       = M_xy*S_yyzzz
    v789       = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 70.0d0*v759 + 5.0d0*(-3.0d0* &
      M_xxxyzzz - 3.0d0*M_xyyyzzz + 12.0d0*v758 + 12.0d0*v760 - 15.0d0* &
      v761 - 15.0d0*v762 - 3.0d0*v763 - 54.0d0*v764 - 114.0d0*v765 - &
      15.0d0*v766 - 3.0d0*v767 - 15.0d0*v768 - 3.0d0*v769 - 114.0d0* &
      v770 - 3.0d0*v771 - 3.0d0*v772 + 12.0d0*v773 - 15.0d0*v774 - &
      15.0d0*v775 - 3.0d0*v776 - 54.0d0*v777 - 15.0d0*v778 - 15.0d0* &
      v779 - 15.0d0*v780 - 15.0d0*v781 + 12.0d0*v782 - 15.0d0*v783 - &
      3.0d0*v784 - 15.0d0*v785 - 3.0d0*v786 - 15.0d0*v787 - 15.0d0*v788 &
      ))
    S_yzzzz    = -(S_xxyzz + S_yyyzz)
    S_zzzzz    = -(S_xxzzz + S_yyzzz)
    S_xxxxxx   = v186 + v188 + 0.0909090909090909d0*(-15.0d0*v189 + 5.0d0*v190)
    Ms_xxxxxx  = M_0*S_xxxxxx + M_yyyyz*v193 + v196 + 0.00432900432900433d0*(136.0d0* &
      M_xxxxxx - 75.0d0*M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + &
      2360.0d0*v202 + 576.0d0*v206 - 2340.0d0*v213 - 2260.0d0*v220 + &
      1440.0d0*v225 + 1620.0d0*(v197 + v204) - 600.0d0*(v207 + v208) - &
      120.0d0*(v214 + v234) + 840.0d0*(v218 + v243) - 160.0d0*(v235 + &
      v240) + 90.0d0*(-M_xxxxzz + v198 + v215) + 360.0d0*(v205 - v210 + &
      v229) + 30.0d0*(v219 + v238 + v239) - 180.0d0*(M_xxxxyy + v212 + &
      v226 + v227) + 720.0d0*(v203 + v216 + v224 + v230) - 1680.0d0*( &
      v209 + v211 + v223 + v228) - 165.0d0*(v199 + v200 + v201 + v221 + &
      v236 + v241) + 60.0d0*(v217 - v222 - v231 - v232 - v233 - v237 - &
      v242))
    S_xxxxxy   = v245*v4
    Ms_xxxxxy  = M_0*S_xxxxxy + v260 - v270*z + 0.0303030303030303d0*(-70.0d0*v269 - &
      10.0d0*v273 + 28.0d0*(M_xxxxxy + v265) + 20.0d0*(v262 + v279) - &
      60.0d0*(v271 + v292) + 100.0d0*(v264 + v266 + v276) + 190.0d0*( &
      v261 + v263 + v267 + v272) - 140.0d0*(v274 + v275 + v283 + v285) &
      - 5.0d0*(M_xyyyyy + v277 + v281 + v289 + v290) + 40.0d0*(-v268 + &
      v278 + v280 + v282 + v284 - v286 + v287 + v288 + v291 + v293))
    S_xxxxxz   = v245*v5
    Ms_xxxxxz  = M_0*S_xxxxxz + M_xxz*v312 + S_xxz*v296 - v303 - v308 - v325 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 68.0d0*v299 + 250.0d0*( &
      v294 + v304) + 220.0d0*(v298 + v327) + 80.0d0*(v305 + v332) + &
      90.0d0*(v309 + v328) - 140.0d0*(v311 + v316) + 160.0d0*(v313 + &
      v317) + 10890.0d0*(-M_xxxyyz + v302 - v310) + 100.0d0*(v300 - &
      v301 - v341) + 20.0d0*(v295 + v297 + v321 + v337) - 5.0d0*( &
      M_xxxzzz + M_xyyyyz + M_xyyzzz + v315 + v336 + v340) + 40.0d0*( &
      v318 - v319 + v322 - v326 + v333 - v334 + v338 - v342) - 25.0d0*( &
      v306 + v314 + v320 + v323 + v329 + v330 + v331 + v335 + v339))
    S_xxxxyy   = 0.0303030303030303d0*(-3.0d0*v189 + 2.0d0*v190) + v344 + v345 + v346*v9
    Ms_xxxxyy  = M_0*S_xxxxyy + v347 - v348 - v352 + v355 + v357 + v358*(M_yyyyz + v0) + &
      0.00432900432900433d0*(-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - &
      11.0d0*M_xxxxzz - 5.0d0*M_yyyyyy - 4.0d0*M_yyyyzz - 64.0d0*v206 + &
      412.0d0*v207 - 36.0d0*v208 + 628.0d0*v210 + 1800.0d0*v213 - &
      720.0d0*v225 - 82.0d0*(v197 + v204) + 942.0d0*(v198 + v215) + &
      2.0d0*(v200 + v236) - 60.0d0*(v202 + v220) + 760.0d0*(v203 + v224 &
      ) + 1288.0d0*(v209 + v223) - 220.0d0*(v214 + v234) - 402.0d0*( &
      v216 + v230) - 392.0d0*(v218 + v243) + 37.0d0*(v232 + v237) + &
      80.0d0*(v235 + v240) + 268.0d0*(v205 - v217 + v229) - 8.0d0*(v219 &
      + v238 + v239) - 22.0d0*(M_xxyyyy + v212 + v226 + v227) - 26.0d0* &
      (v199 + v201 + v221 + v241) - 19.0d0*(v222 + v231 + v233 + v242) &
      - 448.0d0*(v349 + v350 + v351 + v353))
    S_xxxxyz   = v6*(-v343 + v28 + v346)
    Ms_xxxxyz  = M_0*S_xxxxyz + v367 + 0.0303030303030303d0*(26.0d0*v380 + 32.0d0*( &
      M_xxxxyz + v373) + 40.0d0*(v385 + v395) + 8.0d0*(v394 + v400) + &
      96.0d0*(v375 + v376 + v386) + 170.0d0*(v368 + v377 + v382 + v384 &
      ) + 4.0d0*(v369 + v383 + v393 + v399) + 160.0d0*(v370 + v374 + &
      v390 + v391) + 64.0d0*(v371 + v372 + v388 + v392 + v402) - (2.0d0 &
      *M_xxyyyz + 40.0d0*v378 + 18.0d0*v379 + 38.0d0*v381 + 64.0d0*v387 &
      + 64.0d0*v389 + 13.0d0*v396 + 5.0d0*v397 + v398 + 40.0d0*v401 + &
      18.0d0*v403 + 13.0d0*v404))
    S_xxxyyy   = v4*(0.0909090909090909d0*v29 + v405 + v406 + v64)
    Ms_xxxyyy  = 0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v246 + v257) + 75.0d0*(v248 + v255) + 69.0d0*(v249 + v252) + &
      25.0d0*(v269 + v273) + 31.0d0*(v262 + v268 + v279 + v286) - ( &
      M_xxxxxy + 11.0d0*M_xxxyz*v407 + M_xxxyzz + M_xyyyyy + 11.0d0* &
      M_xyyyz*v407 + M_xyyyzz + v247 + v250 + v251 + v253 + v254 + v256 &
      + v258 + v259 + 10.0d0*v261 + 10.0d0*v263 + 7.0d0*v264 + v265 + &
      7.0d0*v266 + 10.0d0*v267 + 6.0d0*v271 + 10.0d0*v272 + 10.0d0*v274 &
      + 10.0d0*v275 + 7.0d0*v276 + 7.0d0*v277 + 10.0d0*v278 + 10.0d0* &
      v280 + 7.0d0*v281 + 10.0d0*v282 + 10.0d0*v283 + 10.0d0*v284 + &
      10.0d0*v285 + 10.0d0*v287 + 10.0d0*v288 + 7.0d0*v289 + v290 + &
      10.0d0*v291 + 6.0d0*v292 + 10.0d0*v293 + 6.0d0*v408 + 6.0d0*v409 &
      ))
    S_xxxyyz   = v5*(0.0909090909090909d0*(-v31) + v406 + v410)
    Ms_xxxyyz  = M_0*S_xxxyyz + M_xxyy*v168 + S_xxyy*v59 + v303 + v308 + v325 + v411 + &
      0.0303030303030303d0*(31.0d0*M_xxxyyz + v299 + 47.0d0*v302 + &
      79.0d0*v310 + 103.0d0*(v295 + v321) + 55.0d0*(v297 + v337) + &
      88.0d0*(v301 + v341) + 43.0d0*(v305 + v332) + 152.0d0*(v311 + &
      v316) + 95.0d0*(v313 + v317) + 13.0d0*(v320 + v330 + v335) + &
      10.0d0*(v319 + v326 + v334 + v342) - (M_xyyyyz + 4.0d0*v294 + &
      v298 + 7.0d0*v300 + 4.0d0*v304 + 10.0d0*v318 + 10.0d0*v322 + v327 &
      + 10.0d0*v333 + v336 + 10.0d0*v338 + 18.0d0*v412 + 18.0d0*v413 + &
      18.0d0*v414))
    S_xxyyyy   = 0.0303030303030303d0*(-3.0d0*v415 + 2.0d0*v417) + v344 + v346*v8 + v416
    Ms_xxyyyy  = M_0*S_xxyyyy + v347 + v348 + v352 - v355 - v357 + v358*(M_xxxxz + v0) + &
      0.00432900432900433d0*(-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0 &
      *M_xxyyyy - 12.0d0*M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v213 + &
      628.0d0*v217 + 1800.0d0*v225 + 412.0d0*v226 - 64.0d0*v238 - &
      36.0d0*v418 + 37.0d0*(v197 + v204) - 402.0d0*(v198 + v215) + &
      80.0d0*(v202 + v220) - 220.0d0*(v203 + v224) + 2.0d0*(v205 + v229 &
      ) + 760.0d0*(v214 + v234) + 942.0d0*(v216 + v230) - 82.0d0*(v232 &
      + v237) - 60.0d0*(v235 + v240) + 1288.0d0*(v349 + v350) - 392.0d0 &
      *(v351 + v353) + 268.0d0*(v200 - v210 + v236) - 8.0d0*(v206 + &
      v212 + v227) - 22.0d0*(M_xxxxyy + v207 + v219 + v239) - 19.0d0*( &
      v199 + v201 + v221 + v241) - 448.0d0*(v209 + v218 + v223 + v243) &
      - 26.0d0*(v222 + v231 + v233 + v242))
    S_xxyyyz   = v6*(0.0909090909090909d0*(-v79) + v405 + v410)
    Ms_xxyyyz  = M_0*S_xxyyyz + v367 + v419 + v421 + v422 + 0.0303030303030303d0*(31.0d0* &
      M_xxyyyz + 47.0d0*v380 + 79.0d0*v381 + v397 + 43.0d0*(v369 + v399 &
      ) + 95.0d0*(v378 + v401) + 99.0d0*(v379 + v403) + 103.0d0*(v383 + &
      v393) + 55.0d0*(v385 + v395) + 152.0d0*(v387 + v389) + 88.0d0*( &
      v388 + v392) + 13.0d0*(v371 + v372 + v402) + 10.0d0*(v370 + v374 &
      + v390 + v391) - (M_xxxxyz + 10.0d0*v368 + v373 + 18.0d0*v375 + &
      18.0d0*v376 + 10.0d0*v377 + 10.0d0*v382 + 10.0d0*v384 + 18.0d0* &
      v386 + 4.0d0*v394 + v396 + 7.0d0*v398 + 4.0d0*v400 + v404))
    S_xyyyyy   = v4*v423
    Ms_xyyyyy  = M_0*S_xyyyyy + v260 - v420*z + 0.0303030303030303d0*(-10.0d0*v269 - &
      70.0d0*v273 + 28.0d0*(M_xyyyyy + v290) + 20.0d0*(v268 + v286) - &
      60.0d0*(v408 + v409) + 100.0d0*(v277 + v281 + v289) + 190.0d0*( &
      v278 + v280 + v287 + v288) - 140.0d0*(v282 + v284 + v291 + v293) &
      - 5.0d0*(M_xxxxxy + v264 + v265 + v266 + v276) + 40.0d0*(v261 - &
      v262 + v263 + v267 + v272 + v274 + v275 - v279 + v283 + v285))
    S_xyyyyz   = v5*(0.0909090909090909d0*(-6.0d0*v79) + v346 + v78)
    Ms_xyyyyz  = M_0*S_xyyyyz + v411 + 0.0303030303030303d0*(26.0d0*v302 + 32.0d0*( &
      M_xyyyyz + v336) + 8.0d0*(v294 + v304) + 40.0d0*(v297 + v337) + &
      96.0d0*(v412 + v413 + v414) + 4.0d0*(v295 + v305 + v321 + v332) + &
      170.0d0*(v318 + v322 + v333 + v338) + 160.0d0*(v319 + v326 + v334 &
      + v342) + 64.0d0*(v301 + v320 + v330 + v335 + v341) - (2.0d0* &
      M_xxxyyz + 13.0d0*v298 + 5.0d0*v299 + v300 + 18.0d0*v309 + 38.0d0 &
      *v310 + 64.0d0*v311 + 40.0d0*v313 + 64.0d0*v316 + 40.0d0*v317 + &
      13.0d0*v327 + 18.0d0*v328))
    S_yyyyyy   = v188 + v424 + 0.0909090909090909d0*(-15.0d0*v415 + 5.0d0*v417)
    Ms_yyyyyy  = M_0*S_yyyyyy + v196 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v213 - &
      2340.0d0*v225 + 2360.0d0*v235 + 576.0d0*v238 - 2260.0d0*v240 - &
      160.0d0*(v202 + v220) - 120.0d0*(v203 + v224) - 600.0d0*(v226 + &
      v418) + 1620.0d0*(v232 + v237) + 840.0d0*(v351 + v353) + 90.0d0*( &
      -M_yyyyzz + v216 + v230) + 360.0d0*(v200 - v217 + v236) - 180.0d0 &
      *(M_xxyyyy + v207 + v219 + v239) + 720.0d0*(v198 + v214 + v215 + &
      v234) + 30.0d0*(v206 + v208 + v212 + v227) - 1680.0d0*(v349 + &
      v350 + v354 + v356) - 165.0d0*(v205 + v222 + v229 + v231 + v233 + &
      v242) + 60.0d0*(-v197 - v199 - v201 - v204 + v210 - v221 - v241))
    S_yyyyyz   = v423*v6
    Ms_yyyyyz  = M_0*S_yyyyyz + M_yyy*v425 + M_yyz*v426 - v419 - v421 - v422 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 68.0d0*v397 + 80.0d0*( &
      v369 + v399) + 160.0d0*(v378 + v401) + 90.0d0*(v379 + v403) - &
      140.0d0*(v387 + v389) + 250.0d0*(v394 + v400) + 220.0d0*(v396 + &
      v404) + 10890.0d0*(-M_xxyyyz + v380 - v381) + 100.0d0*(-v388 - &
      v392 + v398) + 20.0d0*(v383 + v385 + v393 + v395) - 5.0d0*( &
      M_xxxxyz + M_xxyzzz + M_yyyzzz + v361 + v364 + v373) + 40.0d0*( &
      v368 - v370 - v374 + v377 + v382 + v384 - v390 - v391) - 25.0d0*( &
      v359 + v360 + v362 + v363 + v365 + v366 + v371 + v372 + v402))
    S_xxxxxxx  = x*(v186 + v427 + 0.00699300699300699d0*(-231.0d0*v189 + 105.0d0*v190))
    Ms_xxxxxxx = M_0*S_xxxxxxx + v428 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*v443 - 1260.0d0*v447 - 630.0d0*v449 - 525.0d0*x*(M_xxyyyy &
      + M_xxyyzz) + 70.0d0*(M_xyyyyyy + v515) + 3444.0d0*(v429 + v441) &
      - 1050.0d0*(v430 + v452) + 6860.0d0*(v434 + v439) + 1470.0d0*( &
      v435 + v465) - 1176.0d0*(v444 + v445) - 7980.0d0*(v450 + v463) + &
      1680.0d0*(v453 + v506) - 7420.0d0*(v458 + v471) + 5040.0d0*(v466 &
      + v483) + 5880.0d0*(v469 + v499) + 105.0d0*(-M_xxxyyyy + &
      M_xyyyyzz + v517) + 35.0d0*(M_xxxzzzz + M_xyyzzzz + v476 + v524) &
      + 2520.0d0*(v440 + v456 + v482 + v525) - 4200.0d0*(v446 + v448 + &
      v477 + v500) - 280.0d0*(v459 + v472 + v494 + v519) - 1120.0d0*( &
      v488 + v495 + v511 + v520) - 1155.0d0*(v431 + v432 + v433 + v460 &
      + v489 + v496) - 735.0d0*(v436 + v437 + v438 + v473 + v512 + v521 &
      ) + 840.0d0*(v442 - v451 - v464 - v487 + v505 - v510) + 420.0d0*( &
      -M_xxxxxyy + v454 + v455 - v461 + v467 + v468 - v474 + v478 - &
      v484 - v485 - v486 - v490 - v497 + v501 - v507 - v508 - v509 - &
      v513 - v522) + 210.0d0*(-M_xxxxxzz + v457 + v462 + v470 + v475 + &
      v479 + v480 + v481 + v491 + v492 + v493 + v498 + v502 + v503 + &
      v504 + v514 + v516 + v518 + v523))
    S_xxxxxxy  = v527*y
    Ms_xxxxxxy = M_0*S_xxxxxxy + v537 + v538 + v539 + 0.00233100233100233d0*(-105.0d0* &
      M_xxyyyyy + 10.0d0*M_yyyyyyy - 1200.0d0*v554 - 45.0d0*y*(M_xxyyyy &
      - M_yyyyzz) + 304.0d0*(M_xxxxxxy + v550) - 120.0d0*(M_xxxxyzz + &
      v557) + 150.0d0*(v541 + v573) + 4640.0d0*(v545 + v558) - 3870.0d0 &
      *(v567 + v571) - 315.0d0*(v569 + v612) + 840.0d0*(v572 + v608) + &
      1020.0d0*(v574 + v603) + 1140.0d0*(v576 + v628) - 3940.0d0*(v577 &
      + v581) + 1040.0d0*(v578 + v623) - 220.0d0*(v610 + v613) - &
      160.0d0*(v620 + v624) + 1344.0d0*(v549 + v551 + v585) + 40.0d0*( &
      -v582 + v616 - v619) - 2880.0d0*(v562 + v564 + v599 + v601) + &
      960.0d0*(v546 - v555 - v556 + v592 - v627) + 480.0d0*(v548 - v553 &
      - v561 - v602 + v607) + 60.0d0*(v575 - v584 - v609 - v611 - v626 &
      ) + 3360.0d0*(v540 + v547 + v552 - v560 + v566 - v586) + 1920.0d0 &
      *(-v559 - v590 + v591 + v593 + v597 + v600) + 30.0d0*(-v580 - &
      v604 - v605 - v606 - v615 + v617 + v618 - v622 + v629) - 240.0d0* &
      (M_xxxxyyy + v563 + v565 + v587 + v588 + v589 + v594 + v595 + &
      v596 + v598) - 195.0d0*(v542 + v543 + v544 + v568 + v570 + v579 + &
      v583 + v614 + v621 + v625))
    S_xxxxxxz  = v527*z
    Ms_xxxxxxz = M_0*S_xxxxxxz + v636 - v652 + v679 + v718 + v722 + v735 + v738 + v878 + &
      v883 + 0.00233100233100233d0*(304.0d0*M_xxxxxxz - 105.0d0* &
      M_xxyyyyz + 10.0d0*M_yyyyyyz + 784.0d0*v648 + 1344.0d0*v649 - &
      600.0d0*v656 - 555.0d0*v670 + 40.0d0*v715 + 30.0d0*v740 + &
      4320.0d0*(v638 + v654) + 7520.0d0*(v643 + v661) + 6720.0d0*(v645 &
      + v680) + 3264.0d0*(v647 + v701) + 1440.0d0*(v655 + v706) - &
      4800.0d0*(v657 + v699) - 2880.0d0*(v660 + v689) + 3840.0d0*(v662 &
      + v690) - 5100.0d0*(v665 + v676) + 2970.0d0*(v667 + v681) + &
      1080.0d0*(v668 + v724) - 780.0d0*(v669 + v733) + 900.0d0*(v673 + &
      v707) - 735.0d0*(v683 + v712) - 160.0d0*(v711 + v720) + 150.0d0*( &
      v714 + v736) - 120.0d0*(M_xxxxzzz + v666 + v719) + 960.0d0*(v644 &
      - v653 + v695) + 60.0d0*(v671 + v713 + v726) - 240.0d0*(M_xxxxyyz &
      + v664 + v694 + v698) - 775.0d0*(v682 + v684 + v685 + v728) - &
      100.0d0*(v686 + v725 + v727 + v729) + 480.0d0*(v646 + v658 - v659 &
      + v702 + v723) + 90.0d0*(v639 + v672 - v688 - v708 - v709 - v731 &
      ) - 225.0d0*(v640 + v641 + v642 + v687 + v716 + v730) + 1920.0d0* &
      (-v650 + v691 - v692 + v696 - v700 - v732) - 1200.0d0*(v663 + &
      v677 + v693 + v697 + v703 + v704 + v705 + v710))
    S_xxxxxyy  = x*(0.00699300699300699d0*(10.0d0*v190) + v345 + v741 + v742*v9 + v879)
    Ms_xxxxxyy = M_0*S_xxxxxyy + v746 - v747 + v748 + v751 + v753 + v755 + v757 + &
      0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0*M_xxxxxyy - &
      116.0d0*v443 + 732.0d0*v444 - 36.0d0*v445 + 1350.0d0*v447 - &
      45.0d0*v449 - 780.0d0*v454 - 600.0d0*v455 - 35.0d0*(M_xyyyyyy + &
      v515) - 210.0d0*(v429 + v441) + 2550.0d0*(v430 + v452) - 190.0d0* &
      (v434 + v439) + 2730.0d0*(v435 + v465) + 1620.0d0*(v440 + v482) + &
      444.0d0*(v442 + v505) + 2820.0d0*(v446 + v477) + 5160.0d0*(v450 + &
      v463) - 420.0d0*(v451 + v510) - 1110.0d0*(v453 + v506) - 1080.0d0 &
      *(v456 + v525) - 100.0d0*(v458 + v471) - 700.0d0*(v459 + v519) - &
      1380.0d0*(v464 + v487) - 2790.0d0*(v466 + v483) - 1740.0d0*(v467 &
      + v478) - 1560.0d0*(v468 + v501) - 2760.0d0*(v469 + v499) - &
      1660.0d0*(v472 + v494) + 255.0d0*(v485 + v490 + v508 + v513) + &
      560.0d0*(v488 + v495 + v511 + v520) + 30.0d0*(-M_xyyyyzz + v492 + &
      v503 + v516 - v517) - 120.0d0*(v431 + v433 + v460 + v496 + v749) &
      + 90.0d0*(-M_xxxyyyy - v436 + v437 - v438 - v473 + v512 - v521) - &
      105.0d0*(v461 + v474 + v484 + v486 + v497 + v507 + v509 + v522) + &
      60.0d0*(v432 - v448 - v457 - v470 - v479 - v480 - v481 + v489 - &
      v491 - v493 - v500 - v514 - v518))
    S_xxxxxyz  = v7*(-v743 + v28 + v742)
    Ms_xxxxxyz = M_0*S_xxxxxyz + M_xxyz*v312 + S_xxyz*v296 + v789 + 0.00699300699300699d0 &
      *(-250.0d0*v801 - 30.0d0*v808 + 128.0d0*(M_xxxxxyz + v795) - &
      270.0d0*(v800 + v836) + 390.0d0*(v807 + v824) + 1430.0d0*(M_xxxy* &
      S_xxz + M_xxz*S_xxxy) + 288.0d0*(v793 + v794 + v835) + 480.0d0*( &
      v797 + v798 + v811) - 75.0d0*(v817 + v825 + v829) + 1110.0d0*( &
      v790 + v802 + v803 + v805) + 60.0d0*(v791 + v809 + v813 + v832) + &
      960.0d0*(v792 + v796 + v821 + v823) + 280.0d0*(-v799 + v804 + &
      v827 - v834) + 600.0d0*(-v806 + v810 + v815 - v820) + 120.0d0*( &
      v814 + v819 + v826 + v833) - 195.0d0*(v816 + v822 + v828 + v837) &
      - 15.0d0*(M_xyyyyyz + v812 + v818 + v830 + v831))
    S_xxxxyyy  = y*(0.00699300699300699d0*(-33.0d0*v189 + 18.0d0*v190) + v839 + v880)
    Ms_xxxxyyy = M_0*S_xxxxyyy + v841 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v531 + v534 + 330.0d0*v554 + 380.0d0*v561 &
      + 630.0d0*(v541 + v573) + 560.0d0*(v546 + v592) + 200.0d0*(v548 + &
      v607) + 420.0d0*(v553 + v602) + 1320.0d0*(v559 + v590) + 1140.0d0 &
      *(v560 + v586) + 1710.0d0*(v567 + v571) + 9.0d0*(v605 + v615) + &
      25.0d0*(v610 + v613) + 30.0d0*(v618 + v629) + 40.0d0*(v620 + v624 &
      ) + 6.0d0*(v529 + v530 + v532 + v533 + v535 + v536 + v617) - ( &
      16.0d0*M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + &
      M_yyyyyyy + 15.0d0*v528 + 150.0d0*v540 + 30.0d0*v542 + 18.0d0* &
      v543 + 30.0d0*v544 + 140.0d0*v545 + 150.0d0*v547 + 96.0d0*v549 + &
      16.0d0*v550 + 96.0d0*v551 + 150.0d0*v552 + 60.0d0*v555 + 60.0d0* &
      v556 + 15.0d0*v557 + 140.0d0*v558 + 30.0d0*v563 + 30.0d0*v565 + &
      150.0d0*v566 + 30.0d0*v568 + 150.0d0*v569 + 30.0d0*v570 + 270.0d0 &
      *v572 + 270.0d0*v574 + 120.0d0*v575 + 240.0d0*v576 + 140.0d0*v577 &
      + 260.0d0*v578 + 30.0d0*v579 + 15.0d0*v580 + 140.0d0*v581 + &
      140.0d0*v582 + 30.0d0*v583 + 15.0d0*v584 + 96.0d0*v585 + 30.0d0* &
      v587 + 270.0d0*v588 + 30.0d0*v589 + 480.0d0*v591 + 480.0d0*v593 + &
      270.0d0*v594 + 30.0d0*v595 + 30.0d0*v596 + 480.0d0*v597 + 30.0d0* &
      v598 + 480.0d0*v600 + 270.0d0*v603 + 15.0d0*v604 + 15.0d0*v606 + &
      270.0d0*v608 + 15.0d0*v609 + 15.0d0*v611 + 150.0d0*v612 + 18.0d0* &
      v614 + v616 + 140.0d0*v619 + 30.0d0*v621 + 15.0d0*v622 + 260.0d0* &
      v623 + 30.0d0*v625 + 15.0d0*v626 + 60.0d0*v627 + 240.0d0*v628 + &
      143.0d0*v842 + 143.0d0*v843 + 150.0d0*v844 + 240.0d0*v845 + &
      143.0d0*v846 + 143.0d0*v847 + 240.0d0*v848))
    S_xxxxyyz  = z*(0.00699300699300699d0*(6.0d0*v190) + v741 + v849 + v880)
    Ms_xxxxyyz = M_0*S_xxxxyyz + v851 - v852 - v855 - v856 + v857 - v860 - v861 - v862 + &
      v881 + 0.00233100233100233d0*(390.0d0*M_xxxxyyz - 7.0d0*M_yyyyyyz &
      - 6.0d0*M_yyyyzzz + 690.0d0*v651 + 780.0d0*v653 + 1260.0d0*v659 - &
      37.0d0*v715 - 12.0d0*v740 - 16.0d0*(M_xxxxxxz + v648) + 45.0d0*( &
      v630 + v632) - 20.0d0*(v643 + v661) + 2160.0d0*(v644 + v695) - &
      90.0d0*(v645 + v680) + 840.0d0*(v646 + v723) + 1380.0d0*(v650 + &
      v732) + 540.0d0*(v655 + v706) + 3720.0d0*(v657 + v699) + 1860.0d0 &
      *(v658 + v702) + 2520.0d0*(v660 + v689) + 1560.0d0*(v662 + v690) &
      + 4200.0d0*(v665 + v676) - 450.0d0*(v668 + v724) - 270.0d0*(v673 &
      + v707) + 300.0d0*(v677 + v710) + 330.0d0*(v683 + v712) + 570.0d0 &
      *(v693 + v704) + 40.0d0*(v711 + v720) - 105.0d0*(v713 + v726) - &
      132.0d0*(v714 + v736) - 720.0d0*(v858 + v859) - 96.0d0*(v647 + &
      v649 + v701) - 420.0d0*(v666 + v671 + v719) + 2250.0d0*(v639 + &
      v667 + v672 + v681) - 36.0d0*(v640 + v642 + v687 + v730) - &
      110.0d0*(v682 + v684 + v685 + v728) - 65.0d0*(v686 + v725 + v727 &
      + v729) - 27.0d0*(v688 + v708 + v709 + v731) + 480.0d0*(-v691 + &
      v692 - v696 + v700) - 30.0d0*(M_xxyyyyz + v664 + v694 + v698 + &
      v717) + 60.0d0*(v669 - v678 - v721 + v733 - v734 - v737))
    S_xxxyyyy  = x*(0.00699300699300699d0*(-33.0d0*v415 + 18.0d0*v417) + v839 + v882)
    Ms_xxxyyyy = M_0*S_xxxyyyy + v748 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + 380.0d0*v454 + v476 + v524 + 330.0d0*v749 &
      + 9.0d0*(v429 + v441) + 420.0d0*(v432 + v489) + 25.0d0*(v434 + &
      v439) + 200.0d0*(v437 + v512) + 30.0d0*(v448 + v500) + 560.0d0*( &
      v451 + v510) + 630.0d0*(v453 + v506) + 40.0d0*(v458 + v471) + &
      1320.0d0*(v464 + v487) + 1710.0d0*(v466 + v483) + 1140.0d0*(v467 &
      + v478) + 6.0d0*(v445 + v462 + v475 + v498 + v502 + v504 + v523) &
      - (M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + 270.0d0*v430 + 15.0d0*v431 + 15.0d0*v433 + 270.0d0* &
      v435 + 15.0d0*v436 + 15.0d0*v438 + 150.0d0*v440 + 18.0d0*v442 + &
      v443 + 30.0d0*v444 + 270.0d0*v446 + 150.0d0*v447 + 480.0d0*v450 + &
      270.0d0*v452 + 120.0d0*v455 + 240.0d0*v456 + 30.0d0*v457 + &
      140.0d0*v459 + 15.0d0*v460 + 30.0d0*v461 + 480.0d0*v463 + 270.0d0 &
      *v465 + 240.0d0*v468 + 480.0d0*v469 + 30.0d0*v470 + 260.0d0*v472 &
      + 15.0d0*v473 + 30.0d0*v474 + 270.0d0*v477 + 30.0d0*v479 + 96.0d0 &
      *v480 + 30.0d0*v481 + 150.0d0*v482 + 30.0d0*v484 + 150.0d0*v485 + &
      30.0d0*v486 + 140.0d0*v488 + 150.0d0*v490 + 96.0d0*v491 + 60.0d0* &
      v492 + 30.0d0*v493 + 260.0d0*v494 + 140.0d0*v495 + 15.0d0*v496 + &
      30.0d0*v497 + 480.0d0*v499 + 240.0d0*v501 + 60.0d0*v503 + 18.0d0* &
      v505 + 30.0d0*v507 + 150.0d0*v508 + 30.0d0*v509 + 140.0d0*v511 + &
      150.0d0*v513 + 96.0d0*v514 + 16.0d0*v515 + 60.0d0*v516 + 15.0d0* &
      v517 + 30.0d0*v518 + 140.0d0*v519 + 140.0d0*v520 + 15.0d0*v521 + &
      30.0d0*v522 + 240.0d0*v525 + 15.0d0*v745 + 143.0d0*v751 + 143.0d0 &
      *v753 + 143.0d0*v755 + 143.0d0*v757))
    S_xxxyyyz  = v7*(v64 + 0.00699300699300699d0*(9.0d0*v29 + 3.0d0*(-11.0d0*v31 - 11.0d0 &
      *v79)))
    Ms_xxxyyyz = 0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*v759 + 945.0d0*(v765 + v770) + 345.0d0*(v801 + v808) + &
      245.0d0*(v791 + v804 + v827 + v832) + 525.0d0*(v799 + v810 + v815 &
      + v834) + 1125.0d0*(v764 + v777 + v806 + v809 + v813 + v820) + &
      21.0d0*(v793 + v794 + v817 + v825 + v829 + v835) - 75.0d0*(v797 + &
      v798 + v811 + v812 + v818 + v831) + 465.0d0*(v758 + v760 + v773 + &
      v782 + v800 + v807 + v824 + v836) - 60.0d0*(v790 + v802 + v803 + &
      v805 + v814 + v819 + v826 + v833) + 15.0d0*(v792 + v796 + v816 + &
      v821 + v822 + v823 + v828 + v837) - 9.0d0*(M_xxxxxyz + M_xxxyzzz &
      + M_xyyyyyz + M_xyyyzzz + v763 + v767 + v769 + v771 + v772 + v776 &
      + v784 + v786 + v795 + v830) - 45.0d0*(v761 + v762 + v766 + v768 &
      + v774 + v775 + v778 + v779 + v780 + v781 + v783 + v785 + v787 + &
      v788))
    S_xxyyyyy  = y*(0.00699300699300699d0*(10.0d0*v417) + v416 + v742*v8 + v864 + v879)
    Ms_xxyyyyy = M_0*S_xxyyyyy + v537 - v539 + v841 + v842 + v843 + v846 + v847 + &
      0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0*M_yyyyyyy - &
      780.0d0*v561 - 600.0d0*v575 + 732.0d0*v595 - 116.0d0*v616 - &
      36.0d0*v617 + 1350.0d0*v844 - 45.0d0*v865 - 35.0d0*(M_xxxxxxy + &
      v550) - 1110.0d0*(v541 + v573) + 444.0d0*(v543 + v614) - 420.0d0* &
      (v546 + v592) - 1380.0d0*(v559 + v590) - 1740.0d0*(v560 + v586) - &
      2790.0d0*(v567 + v571) + 1620.0d0*(v569 + v612) + 2730.0d0*(v572 &
      + v608) + 2550.0d0*(v574 + v603) - 1560.0d0*(v576 + v628) - &
      1660.0d0*(v578 + v623) - 700.0d0*(v582 + v619) + 2820.0d0*(v588 + &
      v594) + 5160.0d0*(v591 + v593) - 2760.0d0*(v597 + v600) - 210.0d0 &
      *(v605 + v615) - 190.0d0*(v610 + v613) - 100.0d0*(v620 + v624) - &
      1080.0d0*(v845 + v848) + 255.0d0*(v540 + v547 + v552 + v566) + &
      560.0d0*(v545 + v558 + v577 + v581) + 30.0d0*(-M_xxxxyzz + v555 + &
      v556 - v557 + v627) - 120.0d0*(v554 + v580 + v604 + v606 + v622) &
      + 90.0d0*(-M_xxxxyyy + v548 - v584 + v607 - v609 - v611 - v626) - &
      105.0d0*(v542 + v544 + v568 + v570 + v579 + v583 + v621 + v625) + &
      60.0d0*(-v549 - v551 + v553 - v563 - v565 - v585 - v587 - v589 - &
      v596 - v598 + v602 - v618 - v629))
    S_xxyyyyz  = z*(0.00699300699300699d0*(6.0d0*v417) + v849 + v864 + v882)
    Ms_xxyyyyz = M_0*S_xxyyyyz - v636 + v652 - v679 - v718 - v722 - v735 - v738 + v851 + &
      v878 + 0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0*M_xxxxzzz &
      + 390.0d0*M_xxyyyyz - 37.0d0*v648 + 690.0d0*v670 + 1260.0d0*v671 &
      + 780.0d0*v694 - 12.0d0*v869 - 16.0d0*(M_yyyyyyz + v715) + 45.0d0 &
      *(v638 + v654) - 270.0d0*(v639 + v672) + 540.0d0*(v641 + v716) + &
      40.0d0*(v643 + v661) + 300.0d0*(v644 + v695) - 105.0d0*(v645 + &
      v680) + 330.0d0*(v646 + v723) - 132.0d0*(v647 + v701) + 570.0d0*( &
      v650 + v732) - 720.0d0*(v660 + v689) + 1560.0d0*(v666 + v719) - &
      450.0d0*(v667 + v681) + 1860.0d0*(v669 + v733) + 2160.0d0*(v677 + &
      v710) + 840.0d0*(v683 + v712) + 4200.0d0*(v691 + v696) + 3720.0d0 &
      *(v692 + v700) + 1380.0d0*(v693 + v704) - 20.0d0*(v711 + v720) - &
      90.0d0*(v713 + v726) + 2520.0d0*(v858 + v859) - 420.0d0*(v659 + &
      v662 + v690) - 96.0d0*(v714 + v736 + v867) - 27.0d0*(v640 + v642 &
      + v687 + v730) + 480.0d0*(v657 - v665 - v676 + v699) + 2250.0d0*( &
      v668 + v673 + v707 + v724) - 65.0d0*(v682 + v684 + v685 + v728) - &
      110.0d0*(v686 + v725 + v727 + v729) - 36.0d0*(v688 + v708 + v709 &
      + v731) - 30.0d0*(M_xxxxyyz + v653 + v656 + v866 + v868) + 60.0d0 &
      *(v658 - v663 - v697 + v702 - v703 - v705))
    S_xyyyyyy  = v870*x
    Ms_xyyyyyy = M_0*S_xyyyyyy + v428 + v746 + v747 + 0.00233100233100233d0*(10.0d0* &
      M_xxxxxxx - 105.0d0*M_xxxxxyy - 1200.0d0*v749 - 45.0d0*x*( &
      M_xxxxyy - M_xxxxzz) + 304.0d0*(M_xyyyyyy + v515) - 120.0d0*( &
      M_xyyyyzz + v517) + 1020.0d0*(v430 + v452) - 220.0d0*(v434 + v439 &
      ) + 840.0d0*(v435 + v465) - 315.0d0*(v440 + v482) + 150.0d0*(v453 &
      + v506) - 160.0d0*(v458 + v471) - 3870.0d0*(v466 + v483) + &
      1140.0d0*(v468 + v501) + 1040.0d0*(v472 + v494) + 4640.0d0*(v488 &
      + v511) - 3940.0d0*(v495 + v520) + 40.0d0*(v443 - v459 - v519) + &
      1344.0d0*(v480 + v491 + v514) - 2880.0d0*(v750 + v752 + v754 + &
      v756) + 480.0d0*(-v432 + v437 - v454 - v489 + v512) + 60.0d0*( &
      -v436 - v438 + v455 - v473 - v521) + 960.0d0*(v451 - v492 - v503 &
      + v510 - v516) + 1920.0d0*(v450 + v463 - v464 + v469 - v487 + &
      v499) + 3360.0d0*(-v467 - v478 + v485 + v490 + v508 + v513) + &
      30.0d0*(-v429 - v431 - v433 - v441 + v445 + v448 - v460 - v496 + &
      v500) - 240.0d0*(M_xxxyyyy + v444 + v446 + v457 + v470 + v477 + &
      v479 + v481 + v493 + v518) - 195.0d0*(v442 + v461 + v474 + v484 + &
      v486 + v497 + v505 + v507 + v509 + v522))
    S_xyyyyyz  = v7*(0.0769230769230769d0*(-10.0d0*v79) + v742 + v78)
    Ms_xyyyyyz = M_0*S_xyyyyyz + M_xyyy*v425 + M_xyyz*v426 + v789 + 0.00699300699300699d0 &
      *(-30.0d0*v801 - 250.0d0*v808 + 128.0d0*(M_xyyyyyz + v830) + &
      390.0d0*(v800 + v836) - 270.0d0*(v807 + v824) + 1430.0d0*(M_yyy* &
      S_xyyz + M_yyz*S_xyyy) - 75.0d0*(v793 + v794 + v835) + 480.0d0*( &
      v812 + v818 + v831) + 288.0d0*(v817 + v825 + v829) + 120.0d0*( &
      v790 + v802 + v803 + v805) + 280.0d0*(v791 - v810 - v815 + v832) &
      - 195.0d0*(v792 + v796 + v821 + v823) + 600.0d0*(v799 - v809 - &
      v813 + v834) + 60.0d0*(v804 + v806 + v820 + v827) + 1110.0d0*( &
      v814 + v819 + v826 + v833) + 960.0d0*(v816 + v822 + v828 + v837) &
      - 15.0d0*(M_xxxxxyz + v795 + v797 + v798 + v811))
    S_yyyyyyy  = y*(0.00699300699300699d0*(-231.0d0*v415 + 105.0d0*v417) + v424 + v427)
    Ms_yyyyyyy = M_0*S_yyyyyyy + v538 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      952.0d0*v616 - 1260.0d0*v844 - 630.0d0*v865 - 525.0d0*y*(M_xxxxyy &
      + M_xxyyzz) + 70.0d0*(M_xxxxxxy + v550) + 1680.0d0*(v541 + v573) &
      + 5040.0d0*(v567 + v571) + 1470.0d0*(v572 + v608) - 1050.0d0*( &
      v574 + v603) - 7980.0d0*(v591 + v593) - 1176.0d0*(v595 + v617) + &
      5880.0d0*(v597 + v600) + 3444.0d0*(v605 + v615) + 6860.0d0*(v610 &
      + v613) - 7420.0d0*(v620 + v624) + 105.0d0*(-M_xxxxyyy + &
      M_xxxxyzz + v557) + 35.0d0*(M_xxyzzzz + M_yyyzzzz + v531 + v534) &
      - 1120.0d0*(v545 + v558 + v577 + v581) + 2520.0d0*(v569 + v612 + &
      v845 + v848) - 280.0d0*(v578 + v582 + v619 + v623) - 4200.0d0*( &
      v588 + v594 + v618 + v629) + 840.0d0*(v543 - v546 - v559 - v590 - &
      v592 + v614) - 735.0d0*(v548 + v584 + v607 + v609 + v611 + v626) &
      - 1155.0d0*(v553 + v580 + v602 + v604 + v606 + v622) + 420.0d0*( &
      -M_xxyyyyy - v540 - v542 - v544 - v547 - v552 + v560 + v561 - &
      v566 - v568 - v570 + v575 + v576 - v579 - v583 + v586 - v621 - &
      v625 + v628) + 210.0d0*(-M_yyyyyzz + v529 + v530 + v532 + v533 + &
      v535 + v536 + v549 + v551 + v555 + v556 + v563 + v565 + v585 + &
      v587 + v589 + v596 + v598 + v627))
    S_yyyyyyz  = v870*z
    Ms_yyyyyyz = M_0*S_yyyyyyz + v852 + v855 + v856 - v857 + v860 + v861 + v862 + v881 + &
      v883 + 0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0* &
      M_xxxxyyz + 304.0d0*M_yyyyyyz + 40.0d0*v648 - 555.0d0*v651 + &
      784.0d0*v715 - 600.0d0*v717 + 1344.0d0*v867 + 30.0d0*v869 + &
      4320.0d0*(v630 + v632) + 900.0d0*(v639 + v672) + 1440.0d0*(v641 + &
      v716) - 160.0d0*(v643 + v661) - 735.0d0*(v646 + v723) + 150.0d0*( &
      v647 + v701) - 780.0d0*(v658 + v702) + 3840.0d0*(v666 + v719) + &
      1080.0d0*(v667 + v681) + 2970.0d0*(v668 + v724) - 5100.0d0*(v691 &
      + v696) - 4800.0d0*(v692 + v700) + 7520.0d0*(v711 + v720) + &
      6720.0d0*(v713 + v726) + 3264.0d0*(v714 + v736) - 2880.0d0*(v858 &
      + v859) - 120.0d0*(M_yyyyzzz + v662 + v690) + 60.0d0*(v645 + v659 &
      + v680) + 960.0d0*(v677 - v694 + v710) - 240.0d0*(M_xxyyyyz + &
      v653 + v866 + v868) - 100.0d0*(v682 + v684 + v685 + v728) - &
      775.0d0*(v686 + v725 + v727 + v729) + 480.0d0*(v669 - v671 + v683 &
      + v712 + v733) + 90.0d0*(-v640 - v642 + v673 - v687 + v707 - v730 &
      ) - 225.0d0*(v655 + v688 + v706 + v708 + v709 + v731) + 1920.0d0* &
      (-v657 + v665 + v676 - v693 - v699 - v704) - 1200.0d0*(v644 + &
      v650 + v678 + v695 + v721 + v732 + v734 + v737))
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
#undef  Ms_xxxxxxx          
#undef  M_xxxxxxx           
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxy           
#undef  Ms_xxxxxxz          
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  Ms_xxxxxyy          
#undef  M_xxxxxyz           
#undef  Ms_xxxxxyz          
#undef  Ms_xxxxyyy          
#undef  M_xxxxyyy           
#undef  Ms_xxxxyyz          
#undef  M_xxxxyyz           
#undef  Ms_xxxyyyy          
#undef  M_xxxyyyy           
#undef  Ms_xxxyyyz          
#undef  M_xxxyyyz           
#undef  Ms_xxyyyyy          
#undef  M_xxyyyyy           
#undef  Ms_xxyyyyz          
#undef  M_xxyyyyz           
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyyz          
#undef  Ms_yyyyyyy          
#undef  M_yyyyyyy           
#undef  M_yyyyyyz           
#undef  Ms_yyyyyyz          
    end subroutine mom_es_M2M
    
! OPS  1770*ADD + 2*DIV + 2369*MUL + 175*NEG + POW + 52*SUB = 4369  (5807 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v430, v431, v432, v433, v44, v45, v46, v47,&
                v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58,&
                v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7,&
                v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80,&
                v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91,&
                v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_x, D_y, D_z,&
                D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
                D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx,&
                D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz,&
                D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz,&
                D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy,&
                D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz,&
                D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz,&
                D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz,&
                D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz,&
                D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz,&
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy,&
                D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy,&
                D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz,&
                D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz,&
                D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy,&
                D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz,&
                D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz,&
                D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx,&
                D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz,&
                D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy,&
                D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy,&
                D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz,&
                D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz,&
                D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz,&
                D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz,&
                D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz,&
                D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz,&
                M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz,&
                M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz,&
                M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz,&
                M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz,&
                M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz,&
                M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz,&
                M_zzzzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define L_xx                 L(3)
#define M_xz                 M(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define L_xxx                L(8)
#define M_xxz                M(8)
#define M_xyy                M(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define M_xyz                M(10)
#define L_xyy                L(11)
#define M_yyy                M(11)
#define M_yyz                M(12)
#define L_xyz                L(12)
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
#define L_xxyy               L(18)
#define M_xyyy               M(18)
#define M_xyyz               M(19)
#define L_xxyz               L(19)
#define M_yyyy               M(20)
#define L_xyyy               L(20)
#define L_xyyz               L(21)
#define M_yyyz               M(21)
#define L_yyyy               L(22)
#define M_xxxxx              M(22)
#define L_yyyz               L(23)
#define M_xxxxy              M(23)
#define M_xxxxz              M(24)
#define L_xxxxx              L(24)
#define L_xxxxy              L(25)
#define M_xxxyy              M(25)
#define L_xxxxz              L(26)
#define M_xxxyz              M(26)
#define L_xxxyy              L(27)
#define M_xxyyy              M(27)
#define L_xxxyz              L(28)
#define M_xxyyz              M(28)
#define L_xxyyy              L(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define L_xxyyz              L(30)
#define L_xyyyy              L(31)
#define M_yyyyy              M(31)
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
#define L_xxxxyy             L(38)
#define M_xxxyyy             M(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define L_xxxyyy             L(40)
#define M_xxyyyy             M(40)
#define M_xxyyyz             M(41)
#define L_xxxyyz             L(41)
#define M_xyyyyy             M(42)
#define L_xxyyyy             L(42)
#define M_xyyyyz             M(43)
#define L_xxyyyz             L(43)
#define M_yyyyyy             M(44)
#define L_xyyyyy             L(44)
#define M_yyyyyz             M(45)
#define L_xyyyyz             L(45)
#define M_xxxxxxx            M(46)
#define L_yyyyyy             L(46)
#define M_xxxxxxy            M(47)
#define L_yyyyyz             L(47)
#define L_xxxxxxx            L(48)
#define M_xxxxxxz            M(48)
#define M_xxxxxyy            M(49)
#define L_xxxxxxy            L(49)
#define M_xxxxxyz            M(50)
#define L_xxxxxxz            L(50)
#define M_xxxxyyy            M(51)
#define L_xxxxxyy            L(51)
#define L_xxxxxyz            L(52)
#define M_xxxxyyz            M(52)
#define L_xxxxyyy            L(53)
#define M_xxxyyyy            M(53)
#define M_xxxyyyz            M(54)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define M_xxyyyyy            M(55)
#define L_xxxyyyz            L(56)
#define M_xxyyyyz            M(56)
#define L_xxyyyyy            L(57)
#define M_xyyyyyy            M(57)
#define L_xxyyyyz            L(58)
#define M_xyyyyyz            M(58)
#define M_yyyyyyy            M(59)
#define L_xyyyyyy            L(59)
#define L_xyyyyyz            L(60)
#define M_yyyyyyz            M(60)
#define L_yyyyyyy            L(61)
#define L_yyyyyyz            L(62)
#define L_xxxxxxxx           L(63)
#define L_xxxxxxxy           L(64)
#define L_xxxxxxxz           L(65)
#define L_xxxxxxyy           L(66)
#define L_xxxxxxyz           L(67)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define L_xxxxyyyy           L(70)
#define L_xxxxyyyz           L(71)
#define L_xxxyyyyy           L(72)
#define L_xxxyyyyz           L(73)
#define L_xxyyyyyy           L(74)
#define L_xxyyyyyz           L(75)
#define L_xyyyyyyy           L(76)
#define L_xyyyyyyz           L(77)
#define L_yyyyyyyy           L(78)
#define L_yyyyyyyz           L(79)
    v429       = y*z
    v430       = x*y
    v415       = 15.0d0*v429
    v417       = v430
    v419       = v429
    v112       = 0.5d0*M_xx
    v122       = 0.166666666666667d0*M_xxx
    v123       = 0.5d0*M_xxy
    v124       = 0.5d0*M_xxz
    v143       = 0.0416666666666667d0*M_xxxx
    v144       = 0.166666666666667d0*M_xxxy
    v145       = 0.166666666666667d0*M_xxxz
    v146       = 0.25d0*M_xxyy
    v147       = 0.5d0*M_xxyz
    v179       = 0.00833333333333333d0*M_xxxxx
    v180       = 0.0416666666666667d0*M_xxxxy
    v181       = 0.0416666666666667d0*M_xxxxz
    v182       = 0.0833333333333333d0*M_xxxyy
    v183       = 0.166666666666667d0*M_xxxyz
    v185       = 0.0833333333333333d0*M_xxyyy
    v186       = 0.25d0*M_xxyyz
    v247       = 0.00138888888888889d0*M_xxxxxx
    v248       = 0.00833333333333333d0*M_xxxxxy
    v249       = 0.00833333333333333d0*M_xxxxxz
    v250       = 0.0208333333333333d0*M_xxxxyy
    v251       = 0.0416666666666667d0*M_xxxxyz
    v253       = 0.0277777777777778d0*M_xxxyyy
    v254       = 0.0833333333333333d0*M_xxxyyz
    v257       = 0.0208333333333333d0*M_xxyyyy
    v258       = 0.0833333333333333d0*M_xxyyyz
    v291       = 0.5d0*M_yy
    v293       = 0.166666666666667d0*M_yyy
    v298       = 0.0416666666666667d0*M_yyyy
    v307       = 0.00833333333333333d0*M_yyyyy
    v323       = 0.00138888888888889d0*M_yyyyyy
    v347       = 0.000198412698412698d0*M_xxxxxxx
    v348       = 0.00138888888888889d0*M_xxxxxxy
    v349       = 0.00138888888888889d0*M_xxxxxxz
    v350       = 0.00416666666666667d0*M_xxxxxyy
    v351       = 0.00833333333333333d0*M_xxxxxyz
    v353       = 0.00694444444444444d0*M_xxxxyyy
    v354       = 0.0208333333333333d0*M_xxxxyyz
    v357       = 0.00694444444444444d0*M_xxxyyyy
    v358       = 0.0277777777777778d0*M_xxxyyyz
    v362       = 0.00416666666666667d0*M_xxyyyyy
    v363       = 0.0208333333333333d0*M_xxyyyyz
    v368       = 0.000198412698412698d0*M_yyyyyyy
    v369       = 0.00138888888888889d0*M_yyyyyyz
    v370       = 0.00833333333333333d0*M_yyyyyz
    v372       = 0.0416666666666667d0*M_yyyyz
    v375       = 0.166666666666667d0*M_yyyz
    v379       = 0.5d0*M_yyz
    v390       = 0.5d0*M_xyy
    v392       = 0.166666666666667d0*M_xyyy
    v394       = 0.0416666666666667d0*M_xyyyy
    v396       = 0.00833333333333333d0*M_xyyyyy
    v398       = 0.00138888888888889d0*M_xyyyyyy
    M_zz       = -(M_xx + M_yy)
    v384       = 0.5d0*M_zz
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    v391       = 0.5d0*M_yzz
    M_zzz      = -(M_xxz + M_yyz)
    v385       = 0.166666666666667d0*M_zzz
    M_xxzz     = -(M_xxxx + M_xxyy)
    v148       = 0.25d0*M_xxzz
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v380       = 0.25d0*M_yyzz
    M_yzzz     = -(M_xxyz + M_yyyz)
    v393       = 0.166666666666667d0*M_yzzz
    M_zzzz     = -(M_xxzz + M_yyzz)
    v386       = 0.0416666666666667d0*M_zzzz
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    v184       = 0.0833333333333333d0*M_xxxzz
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    v187       = 0.25d0*M_xxyzz
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    v188       = 0.0833333333333333d0*M_xxzzz
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    v376       = 0.0833333333333333d0*M_yyyzz
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v381       = 0.0833333333333333d0*M_yyzzz
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    v395       = 0.0416666666666667d0*M_yzzzz
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    v387       = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    v252       = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    v255       = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    v256       = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    v259       = 0.125d0*M_xxyyzz
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    v260       = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    v261       = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    v373       = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v377       = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v382       = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    v397       = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    v388       = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v352       = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    v355       = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v356       = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v359       = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    v360       = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    v361       = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v364       = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v365       = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    v366       = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v367       = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v371       = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v374       = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v378       = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v383       = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    v399       = 0.00138888888888889d0*M_yzzzzzz
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    v389       = 0.000198412698412698d0*M_zzzzzzz
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v400       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v400
    v24        = 7.0d0*v0
    a3         = a1*a2
    a4         = a2*a2
    v19        = a4
    v54        = 33.0d0*v19
    v82        = 143.0d0*v19
    a5         = a2*a3
    a6         = a3*a3
    v49        = a6
    v73        = 429.0d0*v49
    v74        = -v73
    a7         = a3*a4
    a8         = a4*a4
    b2         = b1*b1
    v1         = b2
    v401       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v402       = v1*v19
    v27        = v401
    v29        = 7.0d0*v1
    v59        = v402
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v403       = v0*v31
    v65        = v403
    v66        = 33.0d0*v31
    v90        = 143.0d0*v31
    v91        = -429.0d0*v65
    b5         = b2*b3
    b6         = b3*b3
    v68        = b6
    v92        = 429.0d0*v68
    v93        = -v92
    b7         = b3*b4
    b8         = b4*b4
    c2         = c1*c1
    h          = c2 + v0 + v1
    v404       = 3.0d0*h
    v405       = h*v0
    v406       = h*v1
    v407       = h*v19
    v409       = v1*v405
    v411       = h*v31
    v4         = -h
    v12        = v404
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v408       = v0*v17
    v410       = v1*v17
    v18        = 3.0d0*v17
    v20        = v405
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v406
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 - 945.0d0*v19 + 630.0d0*v405
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 - 945.0d0*v31 + 630.0d0*v406
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v407
    v51        = v408
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v409
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v410
    v67        = v33 + v53 + v66
    v69        = v411
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v425       = -v85
    v86        = 9.0d0*v17
    v87        = 198.0d0*v57
    v88        = h*v66
    v89        = -18.0d0*v64 + v46 + v88
    v94        = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97        = h*h*h*h
    v98        = 35.0d0*v97
    v99        = 12012.0d0*h
    v100       = v17*v19
    v101       = v0*v46
    v103       = -v72
    v104       = v103 + 715.0d0*v49 - 1001.0d0*v50 + 385.0d0*v51
    v106       = v17*v401
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v426       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v116       = -v108
    v117       = -1430.0d0*v57
    v427       = v116 + v117
    v119       = -1351350.0d0*v409
    v428       = v111 + v119
    v131       = v1*v46
    v132       = v31*v405
    v134       = -(3.0d0*v46 + 286.0d0*v57)
    v208       = v17*v31
    v290       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
    u2         = 1.0/h
    u          = sqrt(u2)
    u3         = u*u2
    v2         = u3
    D_x        = -v2*x
    D_y        = -v2*y
    D_z        = -v2*z
    u4         = u2*u2
    u5         = u2*u3
    v3         = u5
    v412       = 3.0d0*v3
    v6         = v412*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v412*v419
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v413       = 3.0d0*v8
    v9         = v8*x
    v11        = v413*(h - v10)
    D_xxx      = -3.0d0*v9*(v400 - v404)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    D_xyz      = -v415*v9
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = v413*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v414       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v414*y
    v26        = v414*z
    v28        = v15*v415
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v262       = 0.5d0*D_xxyy
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    v277       = 0.5d0*D_xxzz
    D_xyyy     = v22*v30
    D_xyyz     = v26*(v29 + v4)
    D_xyzz     = -(D_xxxy + D_xyyy)
    v334       = 0.5d0*D_xyzz
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v431       = v34*z
    v416       = 15.0d0*v34
    v35        = v416*x
    v39        = v431
    v41        = 315.0d0*v417*v431
    v42        = v416*y
    D_xxxxx    = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy    = v34*v38*y
    D_xxxxz    = v38*v39
    D_xxxyy    = v35*(v40 + h*v24 + 21.0d0*v32)
    v189       = 0.5d0*D_xxxyy
    D_xxxyz    = v41*(h - v5)
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    v199       = 0.5d0*D_xxxzz
    D_xxyyy    = v42*(v40 + h*v29 + 21.0d0*v20)
    v228       = 0.5d0*D_xxyyy
    v263       = 0.166666666666667d0*D_xxyyy
    D_xxyyz    = v39*(v36 - 945.0d0*v401 + 105.0d0*(v405 + v406))
    v273       = 0.5d0*D_xxyyz
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    v238       = 0.5d0*D_xxyzz
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    v278       = 0.166666666666667d0*D_xxzzz
    v286       = 0.5d0*D_xxzzz
    D_xyyyy    = v34*v43*x
    D_xyyyz    = v41*(h - v7)
    v330       = 0.5d0*D_xyyyz
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    v314       = 0.5d0*D_xyyzz
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    v335       = 0.166666666666667d0*D_xyzzz
    v343       = 0.5d0*D_xyzzz
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    D_yyyyy    = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz    = v39*v43
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    u12        = u6*u6
    u13        = u6*u7
    v44        = u13
    v432       = 315.0d0*v44
    v418       = v432*x
    v45        = 45.0d0*v44
    v52        = v418*y
    v56        = v418*z
    v60        = v419*v432
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 + v17*v29 - 21.0d0*v407 + 14.0d0*v51 + 231.0d0*v59)
    v149       = 0.5d0*D_xxxxyy
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    v155       = 0.5d0*D_xxxxzz
    D_xxxyyy   = 945.0d0*v417*v44*(11.0d0*v27 + v17 + v61 + v62)
    v168       = 0.5d0*D_xxxyyy
    v190       = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    v196       = 0.5d0*D_xxxyyz
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    v174       = 0.5d0*D_xxxyzz
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    v200       = 0.166666666666667d0*D_xxxzzz
    v205       = 0.5d0*D_xxxzzz
    D_xxyyyy   = v45*(v58 + v17*v24 - 21.0d0*v411 + 14.0d0*v64 + 231.0d0*v65)
    v217       = 0.5d0*D_xxyyyy
    v229       = 0.166666666666667d0*D_xxyyyy
    v264       = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz   = v60*(-9.0d0*v20 + v62 + v63)
    v235       = 0.5d0*D_xxyyyz
    v270       = 0.166666666666667d0*D_xxyyyz
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    v223       = 0.5d0*D_xxyyzz
    v274       = 0.25d0*D_xxyyzz
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    v239       = 0.166666666666667d0*D_xxyzzz
    v244       = 0.5d0*D_xxyzzz
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    v279       = 0.0416666666666667d0*D_xxzzzz
    v287       = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy   = v52*v67
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    v311       = 0.5d0*D_xyyyyz
    v327       = 0.166666666666667d0*D_xyyyyz
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    v302       = 0.5d0*D_xyyyzz
    v331       = 0.25d0*D_xyyyzz
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    v315       = 0.166666666666667d0*D_xyyzzz
    v320       = 0.5d0*D_xyyzzz
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    v336       = 0.0416666666666667d0*D_xyzzzz
    v344       = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy   = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz   = v60*v67
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    u14        = u7*u7
    u15        = u7*u8
    v70        = u15
    v433       = 945.0d0*v70
    v420       = 315.0d0*v70
    v71        = v420*x
    v75        = v420*y
    v77        = v420*z
    v81        = v419*v433*x
    v83        = v433
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    L_xxxxxxx  = D_xxxxxxx*M_0
    D_xxxxxxy  = v75*v76
    L_xxxxxxy  = D_xxxxxxy*M_0
    D_xxxxxxz  = v76*v77
    L_xxxxxxz  = D_xxxxxxz*M_0
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v125       = 0.5d0*D_xxxxxyy
    L_xxxxxyy  = D_xxxxxyy*M_0
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxyz  = D_xxxxxyz*M_0
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    v128       = 0.5d0*D_xxxxxzz
    D_xxxxyyy  = -v83*y*(v425 + v1*v18 + v1*v82 - v84)
    v137       = 0.5d0*D_xxxxyyy
    v150       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy  = D_xxxxyyy*M_0
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    v153       = 0.5d0*D_xxxxyyz
    L_xxxxyyz  = D_xxxxyyz*M_0
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    v140       = 0.5d0*D_xxxxyzz
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    v156       = 0.166666666666667d0*D_xxxxzzz
    v158       = 0.5d0*D_xxxxzzz
    D_xxxyyyy  = -v83*x*(v425 + v0*v18 + v0*v90 - v89)
    v162       = 0.5d0*D_xxxyyyy
    v169       = 0.166666666666667d0*D_xxxyyyy
    v191       = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy  = D_xxxyyyy*M_0
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v172       = 0.5d0*D_xxxyyyz
    v194       = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyyz  = D_xxxyyyz*M_0
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    v165       = 0.5d0*D_xxxyyzz
    v197       = 0.25d0*D_xxxyyzz
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    v175       = 0.166666666666667d0*D_xxxyzzz
    v177       = 0.5d0*D_xxxyzzz
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    v201       = 0.0416666666666667d0*D_xxxzzzz
    v206       = 0.166666666666667d0*D_xxxzzzz
    D_xxyyyyy  = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    v211       = 0.5d0*D_xxyyyyy
    v218       = 0.166666666666667d0*D_xxyyyyy
    v230       = 0.0416666666666667d0*D_xxyyyyy
    v265       = 0.00833333333333333d0*D_xxyyyyy
    L_xxyyyyy  = D_xxyyyyy*M_0
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    v221       = 0.5d0*D_xxyyyyz
    v233       = 0.166666666666667d0*D_xxyyyyz
    v268       = 0.0416666666666667d0*D_xxyyyyz
    L_xxyyyyz  = D_xxyyyyz*M_0
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    v214       = 0.5d0*D_xxyyyzz
    v236       = 0.25d0*D_xxyyyzz
    v271       = 0.0833333333333333d0*D_xxyyyzz
    v283       = 0.166666666666667d0*D_xxyyyzz
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    v224       = 0.166666666666667d0*D_xxyyzzz
    v226       = 0.5d0*D_xxyyzzz
    v275       = 0.0833333333333333d0*D_xxyyzzz
    v284       = 0.25d0*D_xxyyzzz
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    v240       = 0.0416666666666667d0*D_xxyzzzz
    v245       = 0.166666666666667d0*D_xxyzzzz
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    v280       = 0.00833333333333333d0*D_xxzzzzz
    v288       = 0.0416666666666667d0*D_xxzzzzz
    D_xyyyyyy  = v71*v94
    L_xyyyyyy  = D_xyyyyyy*M_0
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    v300       = 0.5d0*D_xyyyyyz
    v309       = 0.166666666666667d0*D_xyyyyyz
    v325       = 0.0416666666666667d0*D_xyyyyyz
    L_xyyyyyz  = D_xyyyyyz*M_0
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    v295       = 0.5d0*D_xyyyyzz
    v312       = 0.25d0*D_xyyyyzz
    v328       = 0.0833333333333333d0*D_xyyyyzz
    v340       = 0.166666666666667d0*D_xyyyyzz
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    v303       = 0.166666666666667d0*D_xyyyzzz
    v305       = 0.5d0*D_xyyyzzz
    v332       = 0.0833333333333333d0*D_xyyyzzz
    v341       = 0.25d0*D_xyyyzzz
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    v316       = 0.0416666666666667d0*D_xyyzzzz
    v321       = 0.166666666666667d0*D_xyyzzzz
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    v337       = 0.00833333333333333d0*D_xyzzzzz
    v345       = 0.0416666666666667d0*D_xyzzzzz
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    L_yyyyyyy  = D_yyyyyyy*M_0
    D_yyyyyyz  = v77*v94
    L_yyyyyyz  = D_yyyyyyz*M_0
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v421       = v430*v95
    v422       = v95*z
    v423       = v422*x
    v424       = v422*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v421
    v105       = 2835.0d0*v423
    v110       = v424
    v115       = 945.0d0*v421
    v118       = v423
    v133       = 2835.0d0*v424
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = v104*v105
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = -v96*(v426 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    v113       = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v408 + 155925.0d0*(-13.0d0*v407 + 13.0d0*v49))
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    v114       = 0.5d0*D_xxxxxxzz
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxxx*v112 + D_xxxxxxxy*M_xy + D_xxxxxxxz*M_xz + &
      D_xxxxxxyz*M_yz + M_yy*v113 + M_zz*v114
    D_xxxxxyyy = v115*(v427 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v120       = 0.5d0*D_xxxxxyyy
    v126       = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = v118*(v428 + 2027025.0d0*v402 - 135135.0d0*v407 + 103950.0d0*v408 + &
      155925.0d0*v410)
    v127       = 0.5d0*D_xxxxxyyz
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    v121       = 0.5d0*D_xxxxxyzz
    L_xxxxxy   = D_xxxxxxxy*v112 + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + D_xxxxxy*M_0 + &
      D_xxxxxyyz*M_yz + M_yy*v120 + M_zz*v121
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    v129       = 0.166666666666667d0*D_xxxxxzzz
    v130       = 0.5d0*D_xxxxxzzz
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxxx*v112 + D_xxxxxxxx*v122 + D_xxxxxxxy*v123 + &
      D_xxxxxxxz*v124 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz* &
      M_xz + D_xxxxxyz*M_yz + M_xyy*v113 + M_xzz*v114 + M_yy*v125 + &
      M_yyy*v126 + M_yyz*v127 + M_yzz*v121 + M_zz*v128 + M_zzz*v129
    L_xxxxxz   = D_xxxxxxxz*v112 + D_xxxxxxyz*M_xy + D_xxxxxxzz*M_xz + D_xxxxxyzz*M_yz + &
      D_xxxxxz*M_0 + M_yy*v127 + M_zz*v130
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v131) - 858.0d0*(v1*v50 + v132))
    v135       = 0.5d0*D_xxxxyyyy
    v138       = 0.166666666666667d0*D_xxxxyyyy
    v151       = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = v133*(v134 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v139       = 0.5d0*D_xxxxyyyz
    v152       = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    v136       = 0.5d0*D_xxxxyyzz
    v154       = 0.25d0*D_xxxxyyzz
    L_xxxxyy   = D_xxxxxxyy*v112 + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + D_xxxxyy*M_0 + &
      D_xxxxyyyz*M_yz + M_yy*v135 + M_zz*v136
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    v141       = 0.166666666666667d0*D_xxxxyzzz
    v142       = 0.5d0*D_xxxxyzzz
    L_xxxxy    = D_xxxxxxxy*v122 + D_xxxxxxy*v112 + D_xxxxxxyy*v123 + D_xxxxxxyz*v124 + &
      D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 &
      + D_xxxxyyz*M_yz + M_xyy*v120 + M_xzz*v121 + M_yy*v137 + M_yyy* &
      v138 + M_yyz*v139 + M_yzz*v136 + M_zz*v140 + M_zzz*v141
    L_xxxxyz   = D_xxxxxxyz*v112 + D_xxxxxyyz*M_xy + D_xxxxxyzz*M_xz + D_xxxxyyzz*M_yz + &
      D_xxxxyz*M_0 + M_yy*v139 + M_zz*v142
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    v157       = 0.0416666666666667d0*D_xxxxzzzz
    v159       = 0.166666666666667d0*D_xxxxzzzz
    L_xxxx     = D_xxxx*M_0 + D_xxxxxx*v112 + D_xxxxxxx*v122 + D_xxxxxxxx*v143 + &
      D_xxxxxxxy*v144 + D_xxxxxxxz*v145 + D_xxxxxxy*v123 + D_xxxxxxyy* &
      v146 + D_xxxxxxyz*v147 + D_xxxxxxz*v124 + D_xxxxxxzz*v148 + &
      D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz*M_yz + &
      M_xyy*v125 + M_xyyy*v126 + M_xyyz*v127 + M_xyzz*v121 + M_xzz*v128 &
      + M_xzzz*v129 + M_yy*v149 + M_yyy*v150 + M_yyyy*v151 + M_yyyz* &
      v152 + M_yyz*v153 + M_yyzz*v154 + M_yzz*v140 + M_yzzz*v141 + M_zz &
      *v155 + M_zzz*v156 + M_zzzz*v157
    L_xxxxz    = D_xxxxxxxz*v122 + D_xxxxxxyz*v123 + D_xxxxxxz*v112 + D_xxxxxxzz*v124 + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz* &
      M_yz + D_xxxxz*M_0 + M_xyy*v127 + M_xzz*v130 + M_yy*v153 + M_yyy* &
      v152 + M_yyz*v136 + M_yzz*v142 + M_zz*v158 + M_zzz*v159
    D_xxxyyyyy = v115*(v427 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v160       = 0.5d0*D_xxxyyyyy
    v163       = 0.166666666666667d0*D_xxxyyyyy
    v170       = 0.0416666666666667d0*D_xxxyyyyy
    v192       = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = v105*(v134 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v164       = 0.5d0*D_xxxyyyyz
    v171       = 0.166666666666667d0*D_xxxyyyyz
    v193       = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    v161       = 0.5d0*D_xxxyyyzz
    v173       = 0.25d0*D_xxxyyyzz
    v195       = 0.0833333333333333d0*D_xxxyyyzz
    v203       = 0.166666666666667d0*D_xxxyyyzz
    L_xxxyyy   = D_xxxxxyyy*v112 + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + D_xxxyyy*M_0 + &
      D_xxxyyyyz*M_yz + M_yy*v160 + M_zz*v161
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    v166       = 0.166666666666667d0*D_xxxyyzzz
    v167       = 0.5d0*D_xxxyyzzz
    v198       = 0.0833333333333333d0*D_xxxyyzzz
    v204       = 0.25d0*D_xxxyyzzz
    L_xxxyy    = D_xxxxxxyy*v122 + D_xxxxxyy*v112 + D_xxxxxyyy*v123 + D_xxxxxyyz*v124 + &
      D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 &
      + D_xxxyyyz*M_yz + M_xyy*v135 + M_xzz*v136 + M_yy*v162 + M_yyy* &
      v163 + M_yyz*v164 + M_yzz*v161 + M_zz*v165 + M_zzz*v166
    L_xxxyyz   = D_xxxxxyyz*v112 + D_xxxxyyyz*M_xy + D_xxxxyyzz*M_xz + D_xxxyyyzz*M_yz + &
      D_xxxyyz*M_0 + M_yy*v164 + M_zz*v167
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    v176       = 0.0416666666666667d0*D_xxxyzzzz
    v178       = 0.166666666666667d0*D_xxxyzzzz
    L_xxxy     = D_xxxxxxxy*v143 + D_xxxxxxy*v122 + D_xxxxxxyy*v144 + D_xxxxxxyz*v145 + &
      D_xxxxxy*v112 + D_xxxxxyy*v123 + D_xxxxxyyy*v146 + D_xxxxxyyz* &
      v147 + D_xxxxxyz*v124 + D_xxxxxyzz*v148 + D_xxxxyy*M_xy + &
      D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz*M_yz + &
      M_xyy*v137 + M_xyyy*v138 + M_xyyz*v139 + M_xyzz*v136 + M_xzz*v140 &
      + M_xzzz*v141 + M_yy*v168 + M_yyy*v169 + M_yyyy*v170 + M_yyyz* &
      v171 + M_yyz*v172 + M_yyzz*v173 + M_yzz*v165 + M_yzzz*v166 + M_zz &
      *v174 + M_zzz*v175 + M_zzzz*v176
    L_xxxyz    = D_xxxxxxyz*v122 + D_xxxxxyyz*v123 + D_xxxxxyz*v112 + D_xxxxxyzz*v124 + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz* &
      M_yz + D_xxxyz*M_0 + M_xyy*v139 + M_xzz*v142 + M_yy*v172 + M_yyy* &
      v171 + M_yyz*v161 + M_yzz*v167 + M_zz*v177 + M_zzz*v178
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    v202       = 0.00833333333333333d0*D_xxxzzzzz
    v207       = 0.0416666666666667d0*D_xxxzzzzz
    L_xxx      = D_xxx*M_0 + D_xxxxx*v112 + D_xxxxxx*v122 + D_xxxxxxx*v143 + D_xxxxxxxx* &
      v179 + D_xxxxxxxy*v180 + D_xxxxxxxz*v181 + D_xxxxxxy*v144 + &
      D_xxxxxxyy*v182 + D_xxxxxxyz*v183 + D_xxxxxxz*v145 + D_xxxxxxzz* &
      v184 + D_xxxxxy*v123 + D_xxxxxyy*v146 + D_xxxxxyyy*v185 + &
      D_xxxxxyyz*v186 + D_xxxxxyz*v147 + D_xxxxxyzz*v187 + D_xxxxxz* &
      v124 + D_xxxxxzz*v148 + D_xxxxxzzz*v188 + D_xxxxy*M_xy + D_xxxxyz &
      *M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz + M_xyy*v149 + M_xyyy*v150 + &
      M_xyyyy*v151 + M_xyyyz*v152 + M_xyyz*v153 + M_xyyzz*v154 + M_xyzz &
      *v140 + M_xyzzz*v141 + M_xzz*v155 + M_xzzz*v156 + M_xzzzz*v157 + &
      M_yy*v189 + M_yyy*v190 + M_yyyy*v191 + M_yyyyy*v192 + M_yyyyz* &
      v193 + M_yyyz*v194 + M_yyyzz*v195 + M_yyz*v196 + M_yyzz*v197 + &
      M_yyzzz*v198 + M_yzz*v174 + M_yzzz*v175 + M_yzzzz*v176 + M_zz* &
      v199 + M_zzz*v200 + M_zzzz*v201 + M_zzzzz*v202
    L_xxxz     = D_xxxxxxxz*v143 + D_xxxxxxyz*v144 + D_xxxxxxz*v122 + D_xxxxxxzz*v145 + &
      D_xxxxxyyz*v146 + D_xxxxxyz*v123 + D_xxxxxyzz*v147 + D_xxxxxz* &
      v112 + D_xxxxxzz*v124 + D_xxxxxzzz*v148 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz*M_0 + &
      M_xyy*v153 + M_xyyy*v152 + M_xyyz*v136 + M_xyzz*v142 + M_xzz*v158 &
      + M_xzzz*v159 + M_yy*v196 + M_yyy*v194 + M_yyyy*v193 + M_yyyz* &
      v203 + M_yyz*v165 + M_yyzz*v204 + M_yzz*v177 + M_yzzz*v178 + M_zz &
      *v205 + M_zzz*v206 + M_zzzz*v207
    D_xxyyyyyy = -v96*(v426 + h*v92 + v0*v108 + 135.0d0*v131 - 495.0d0*v208 + 6435.0d0*( &
      -v0*v68 + v132))
    v209       = 0.5d0*D_xxyyyyyy
    v212       = 0.166666666666667d0*D_xxyyyyyy
    v219       = 0.0416666666666667d0*D_xxyyyyyy
    v231       = 0.00833333333333333d0*D_xxyyyyyy
    v266       = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = v110*(v428 + 2027025.0d0*v403 + 155925.0d0*v408 + 103950.0d0*v410 - &
      135135.0d0*v411)
    v213       = 0.5d0*D_xxyyyyyz
    v220       = 0.166666666666667d0*D_xxyyyyyz
    v232       = 0.0416666666666667d0*D_xxyyyyyz
    v267       = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    v210       = 0.5d0*D_xxyyyyzz
    v222       = 0.25d0*D_xxyyyyzz
    v234       = 0.0833333333333333d0*D_xxyyyyzz
    v242       = 0.166666666666667d0*D_xxyyyyzz
    v269       = 0.0208333333333333d0*D_xxyyyyzz
    v282       = 0.0416666666666667d0*D_xxyyyyzz
    L_xxyyyy   = D_xxxxyyyy*v112 + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + D_xxyyyy*M_0 + &
      D_xxyyyyyz*M_yz + M_yy*v209 + M_zz*v210
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    v215       = 0.166666666666667d0*D_xxyyyzzz
    v216       = 0.5d0*D_xxyyyzzz
    v237       = 0.0833333333333333d0*D_xxyyyzzz
    v243       = 0.25d0*D_xxyyyzzz
    v272       = 0.0277777777777778d0*D_xxyyyzzz
    L_xxyyy    = D_xxxxxyyy*v122 + D_xxxxyyy*v112 + D_xxxxyyyy*v123 + D_xxxxyyyz*v124 + &
      D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 &
      + D_xxyyyyz*M_yz + M_xyy*v160 + M_xzz*v161 + M_yy*v211 + M_yyy* &
      v212 + M_yyz*v213 + M_yzz*v210 + M_zz*v214 + M_zzz*v215
    L_xxyyyz   = D_xxxxyyyz*v112 + D_xxxyyyyz*M_xy + D_xxxyyyzz*M_xz + D_xxyyyyzz*M_yz + &
      D_xxyyyz*M_0 + M_yy*v213 + M_zz*v216
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    v225       = 0.0416666666666667d0*D_xxyyzzzz
    v227       = 0.166666666666667d0*D_xxyyzzzz
    v276       = 0.0208333333333333d0*D_xxyyzzzz
    v285       = 0.0833333333333333d0*D_xxyyzzzz
    L_xxyy     = D_xxxxxxyy*v143 + D_xxxxxyy*v122 + D_xxxxxyyy*v144 + D_xxxxxyyz*v145 + &
      D_xxxxyy*v112 + D_xxxxyyy*v123 + D_xxxxyyyy*v146 + D_xxxxyyyz* &
      v147 + D_xxxxyyz*v124 + D_xxxxyyzz*v148 + D_xxxyyy*M_xy + &
      D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz*M_yz + &
      M_xyy*v162 + M_xyyy*v163 + M_xyyz*v164 + M_xyzz*v161 + M_xzz*v165 &
      + M_xzzz*v166 + M_yy*v217 + M_yyy*v218 + M_yyyy*v219 + M_yyyz* &
      v220 + M_yyz*v221 + M_yyzz*v222 + M_yzz*v214 + M_yzzz*v215 + M_zz &
      *v223 + M_zzz*v224 + M_zzzz*v225
    L_xxyyz    = D_xxxxxyyz*v122 + D_xxxxyyyz*v123 + D_xxxxyyz*v112 + D_xxxxyyzz*v124 + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz* &
      M_yz + D_xxyyz*M_0 + M_xyy*v164 + M_xzz*v167 + M_yy*v221 + M_yyy* &
      v220 + M_yyz*v210 + M_yzz*v216 + M_zz*v226 + M_zzz*v227
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    v241       = 0.00833333333333333d0*D_xxyzzzzz
    v246       = 0.0416666666666667d0*D_xxyzzzzz
    L_xxy      = D_xxxxxxxy*v179 + D_xxxxxxy*v143 + D_xxxxxxyy*v180 + D_xxxxxxyz*v181 + &
      D_xxxxxy*v122 + D_xxxxxyy*v144 + D_xxxxxyyy*v182 + D_xxxxxyyz* &
      v183 + D_xxxxxyz*v145 + D_xxxxxyzz*v184 + D_xxxxy*v112 + D_xxxxyy &
      *v123 + D_xxxxyyy*v146 + D_xxxxyyyy*v185 + D_xxxxyyyz*v186 + &
      D_xxxxyyz*v147 + D_xxxxyyzz*v187 + D_xxxxyz*v124 + D_xxxxyzz*v148 &
      + D_xxxxyzzz*v188 + D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz &
      + D_xxy*M_0 + D_xxyyz*M_yz + M_xyy*v168 + M_xyyy*v169 + M_xyyyy* &
      v170 + M_xyyyz*v171 + M_xyyz*v172 + M_xyyzz*v173 + M_xyzz*v165 + &
      M_xyzzz*v166 + M_xzz*v174 + M_xzzz*v175 + M_xzzzz*v176 + M_yy* &
      v228 + M_yyy*v229 + M_yyyy*v230 + M_yyyyy*v231 + M_yyyyz*v232 + &
      M_yyyz*v233 + M_yyyzz*v234 + M_yyz*v235 + M_yyzz*v236 + M_yyzzz* &
      v237 + M_yzz*v223 + M_yzzz*v224 + M_yzzzz*v225 + M_zz*v238 + &
      M_zzz*v239 + M_zzzz*v240 + M_zzzzz*v241
    L_xxyz     = D_xxxxxxyz*v143 + D_xxxxxyyz*v144 + D_xxxxxyz*v122 + D_xxxxxyzz*v145 + &
      D_xxxxyyyz*v146 + D_xxxxyyz*v123 + D_xxxxyyzz*v147 + D_xxxxyz* &
      v112 + D_xxxxyzz*v124 + D_xxxxyzzz*v148 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz*M_0 + &
      M_xyy*v172 + M_xyyy*v171 + M_xyyz*v161 + M_xyzz*v167 + M_xzz*v177 &
      + M_xzzz*v178 + M_yy*v235 + M_yyy*v233 + M_yyyy*v232 + M_yyyz* &
      v242 + M_yyz*v214 + M_yyzz*v243 + M_yzz*v226 + M_yzzz*v227 + M_zz &
      *v244 + M_zzz*v245 + M_zzzz*v246
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    v281       = 0.00138888888888889d0*D_xxzzzzzz
    v289       = 0.00833333333333333d0*D_xxzzzzzz
    L_xx       = D_xx*M_0 + D_xxxx*v112 + D_xxxxx*v122 + D_xxxxxx*v143 + D_xxxxxxx*v179 + &
      D_xxxxxxxx*v247 + D_xxxxxxxy*v248 + D_xxxxxxxz*v249 + D_xxxxxxy* &
      v180 + D_xxxxxxyy*v250 + D_xxxxxxyz*v251 + D_xxxxxxz*v181 + &
      D_xxxxxxzz*v252 + D_xxxxxy*v144 + D_xxxxxyy*v182 + D_xxxxxyyy* &
      v253 + D_xxxxxyyz*v254 + D_xxxxxyz*v183 + D_xxxxxyzz*v255 + &
      D_xxxxxz*v145 + D_xxxxxzz*v184 + D_xxxxxzzz*v256 + D_xxxxy*v123 + &
      D_xxxxyy*v146 + D_xxxxyyy*v185 + D_xxxxyyyy*v257 + D_xxxxyyyz* &
      v258 + D_xxxxyyz*v186 + D_xxxxyyzz*v259 + D_xxxxyz*v147 + &
      D_xxxxyzz*v187 + D_xxxxyzzz*v260 + D_xxxxz*v124 + D_xxxxzz*v148 + &
      D_xxxxzzz*v188 + D_xxxxzzzz*v261 + D_xxxy*M_xy + D_xxxyz*M_xyz + &
      D_xxxz*M_xz + D_xxyz*M_yz + M_xyy*v189 + M_xyyy*v190 + M_xyyyy* &
      v191 + M_xyyyyy*v192 + M_xyyyyz*v193 + M_xyyyz*v194 + M_xyyyzz* &
      v195 + M_xyyz*v196 + M_xyyzz*v197 + M_xyyzzz*v198 + M_xyzz*v174 + &
      M_xyzzz*v175 + M_xyzzzz*v176 + M_xzz*v199 + M_xzzz*v200 + M_xzzzz &
      *v201 + M_xzzzzz*v202 + M_yy*v262 + M_yyy*v263 + M_yyyy*v264 + &
      M_yyyyy*v265 + M_yyyyyy*v266 + M_yyyyyz*v267 + M_yyyyz*v268 + &
      M_yyyyzz*v269 + M_yyyz*v270 + M_yyyzz*v271 + M_yyyzzz*v272 + &
      M_yyz*v273 + M_yyzz*v274 + M_yyzzz*v275 + M_yyzzzz*v276 + M_yzz* &
      v238 + M_yzzz*v239 + M_yzzzz*v240 + M_yzzzzz*v241 + M_zz*v277 + &
      M_zzz*v278 + M_zzzz*v279 + M_zzzzz*v280 + M_zzzzzz*v281
    L_xxz      = D_xxxxxxxz*v179 + D_xxxxxxyz*v180 + D_xxxxxxz*v143 + D_xxxxxxzz*v181 + &
      D_xxxxxyyz*v182 + D_xxxxxyz*v144 + D_xxxxxyzz*v183 + D_xxxxxz* &
      v122 + D_xxxxxzz*v145 + D_xxxxxzzz*v184 + D_xxxxyyyz*v185 + &
      D_xxxxyyz*v146 + D_xxxxyyzz*v186 + D_xxxxyz*v123 + D_xxxxyzz*v147 &
      + D_xxxxyzzz*v187 + D_xxxxz*v112 + D_xxxxzz*v124 + D_xxxxzzz*v148 &
      + D_xxxxzzzz*v188 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz &
      + D_xxyzz*M_yz + D_xxz*M_0 + M_xyy*v196 + M_xyyy*v194 + M_xyyyy* &
      v193 + M_xyyyz*v203 + M_xyyz*v165 + M_xyyzz*v204 + M_xyzz*v177 + &
      M_xyzzz*v178 + M_xzz*v205 + M_xzzz*v206 + M_xzzzz*v207 + M_yy* &
      v273 + M_yyy*v270 + M_yyyy*v268 + M_yyyyy*v267 + M_yyyyz*v282 + &
      M_yyyz*v283 + M_yyyzz*v237 + M_yyz*v223 + M_yyzz*v284 + M_yyzzz* &
      v285 + M_yzz*v244 + M_yzzz*v245 + M_yzzzz*v246 + M_zz*v286 + &
      M_zzz*v287 + M_zzzz*v288 + M_zzzzz*v289
    D_xyyyyyyy = v102*v290
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = v118*(v111 + 467775.0d0*v410 + 155925.0d0*(-13.0d0*v411 + 13.0d0*v68))
    v294       = 0.5d0*D_xyyyyyyz
    v299       = 0.166666666666667d0*D_xyyyyyyz
    v308       = 0.0416666666666667d0*D_xyyyyyyz
    v324       = 0.00833333333333333d0*D_xyyyyyyz
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    v292       = 0.5d0*D_xyyyyyzz
    v301       = 0.25d0*D_xyyyyyzz
    v310       = 0.0833333333333333d0*D_xyyyyyzz
    v318       = 0.166666666666667d0*D_xyyyyyzz
    v326       = 0.0208333333333333d0*D_xyyyyyzz
    v339       = 0.0416666666666667d0*D_xyyyyyzz
    L_xyyyyy   = D_xxxyyyyy*v112 + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + D_xyyyyy*M_0 + &
      D_xyyyyyyy*v291 + D_xyyyyyyz*M_yz + M_zz*v292
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    v296       = 0.166666666666667d0*D_xyyyyzzz
    v297       = 0.5d0*D_xyyyyzzz
    v313       = 0.0833333333333333d0*D_xyyyyzzz
    v319       = 0.25d0*D_xyyyyzzz
    v329       = 0.0277777777777778d0*D_xyyyyzzz
    L_xyyyy    = D_xxxxyyyy*v122 + D_xxxyyyy*v112 + D_xxxyyyyy*v123 + D_xxxyyyyz*v124 + &
      D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 &
      + D_xyyyyyy*v291 + D_xyyyyyyy*v293 + D_xyyyyyz*M_yz + M_xyy*v209 &
      + M_xzz*v210 + M_yyz*v294 + M_yzz*v292 + M_zz*v295 + M_zzz*v296
    L_xyyyyz   = D_xxxyyyyz*v112 + D_xxyyyyyz*M_xy + D_xxyyyyzz*M_xz + D_xyyyyyyz*v291 + &
      D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + M_zz*v297
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    v304       = 0.0416666666666667d0*D_xyyyzzzz
    v306       = 0.166666666666667d0*D_xyyyzzzz
    v333       = 0.0208333333333333d0*D_xyyyzzzz
    v342       = 0.0833333333333333d0*D_xyyyzzzz
    L_xyyy     = D_xxxxxyyy*v143 + D_xxxxyyy*v122 + D_xxxxyyyy*v144 + D_xxxxyyyz*v145 + &
      D_xxxyyy*v112 + D_xxxyyyy*v123 + D_xxxyyyyy*v146 + D_xxxyyyyz* &
      v147 + D_xxxyyyz*v124 + D_xxxyyyzz*v148 + D_xxyyyy*M_xy + &
      D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy*v291 + &
      D_xyyyyyy*v293 + D_xyyyyyyy*v298 + D_xyyyyz*M_yz + M_xyy*v211 + &
      M_xyyy*v212 + M_xyyz*v213 + M_xyzz*v210 + M_xzz*v214 + M_xzzz* &
      v215 + M_yyyz*v299 + M_yyz*v300 + M_yyzz*v301 + M_yzz*v295 + &
      M_yzzz*v296 + M_zz*v302 + M_zzz*v303 + M_zzzz*v304
    L_xyyyz    = D_xxxxyyyz*v122 + D_xxxyyyyz*v123 + D_xxxyyyz*v112 + D_xxxyyyzz*v124 + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyyyz* &
      v293 + D_xyyyyyz*v291 + D_xyyyyzz*M_yz + D_xyyyz*M_0 + M_xyy*v213 &
      + M_xzz*v216 + M_yyz*v292 + M_yzz*v297 + M_zz*v305 + M_zzz*v306
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    v317       = 0.00833333333333333d0*D_xyyzzzzz
    v322       = 0.0416666666666667d0*D_xyyzzzzz
    L_xyy      = D_xxxxxxyy*v179 + D_xxxxxyy*v143 + D_xxxxxyyy*v180 + D_xxxxxyyz*v181 + &
      D_xxxxyy*v122 + D_xxxxyyy*v144 + D_xxxxyyyy*v182 + D_xxxxyyyz* &
      v183 + D_xxxxyyz*v145 + D_xxxxyyzz*v184 + D_xxxyy*v112 + D_xxxyyy &
      *v123 + D_xxxyyyy*v146 + D_xxxyyyyy*v185 + D_xxxyyyyz*v186 + &
      D_xxxyyyz*v147 + D_xxxyyyzz*v187 + D_xxxyyz*v124 + D_xxxyyzz*v148 &
      + D_xxxyyzzz*v188 + D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz &
      + D_xyy*M_0 + D_xyyyy*v291 + D_xyyyyy*v293 + D_xyyyyyy*v298 + &
      D_xyyyyyyy*v307 + D_xyyyz*M_yz + M_xyy*v217 + M_xyyy*v218 + &
      M_xyyyy*v219 + M_xyyyz*v220 + M_xyyz*v221 + M_xyyzz*v222 + M_xyzz &
      *v214 + M_xyzzz*v215 + M_xzz*v223 + M_xzzz*v224 + M_xzzzz*v225 + &
      M_yyyyz*v308 + M_yyyz*v309 + M_yyyzz*v310 + M_yyz*v311 + M_yyzz* &
      v312 + M_yyzzz*v313 + M_yzz*v302 + M_yzzz*v303 + M_yzzzz*v304 + &
      M_zz*v314 + M_zzz*v315 + M_zzzz*v316 + M_zzzzz*v317
    L_xyyz     = D_xxxxxyyz*v143 + D_xxxxyyyz*v144 + D_xxxxyyz*v122 + D_xxxxyyzz*v145 + &
      D_xxxyyyyz*v146 + D_xxxyyyz*v123 + D_xxxyyyzz*v147 + D_xxxyyz* &
      v112 + D_xxxyyzz*v124 + D_xxxyyzzz*v148 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyyz*v298 + D_xyyyyyz* &
      v293 + D_xyyyyz*v291 + D_xyyyzz*M_yz + D_xyyz*M_0 + M_xyy*v221 + &
      M_xyyy*v220 + M_xyyz*v210 + M_xyzz*v216 + M_xzz*v226 + M_xzzz* &
      v227 + M_yyyz*v318 + M_yyz*v295 + M_yyzz*v319 + M_yzz*v305 + &
      M_yzzz*v306 + M_zz*v320 + M_zzz*v321 + M_zzzz*v322
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    v338       = 0.00138888888888889d0*D_xyzzzzzz
    v346       = 0.00833333333333333d0*D_xyzzzzzz
    L_xy       = D_xxxxxxxy*v247 + D_xxxxxxy*v179 + D_xxxxxxyy*v248 + D_xxxxxxyz*v249 + &
      D_xxxxxy*v143 + D_xxxxxyy*v180 + D_xxxxxyyy*v250 + D_xxxxxyyz* &
      v251 + D_xxxxxyz*v181 + D_xxxxxyzz*v252 + D_xxxxy*v122 + D_xxxxyy &
      *v144 + D_xxxxyyy*v182 + D_xxxxyyyy*v253 + D_xxxxyyyz*v254 + &
      D_xxxxyyz*v183 + D_xxxxyyzz*v255 + D_xxxxyz*v145 + D_xxxxyzz*v184 &
      + D_xxxxyzzz*v256 + D_xxxy*v112 + D_xxxyy*v123 + D_xxxyyy*v146 + &
      D_xxxyyyy*v185 + D_xxxyyyyy*v257 + D_xxxyyyyz*v258 + D_xxxyyyz* &
      v186 + D_xxxyyyzz*v259 + D_xxxyyz*v147 + D_xxxyyzz*v187 + &
      D_xxxyyzzz*v260 + D_xxxyz*v124 + D_xxxyzz*v148 + D_xxxyzzz*v188 + &
      D_xxxyzzzz*v261 + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + &
      D_xy*M_0 + D_xyyy*v291 + D_xyyyy*v293 + D_xyyyyy*v298 + D_xyyyyyy &
      *v307 + D_xyyyyyyy*v323 + D_xyyz*M_yz + M_xyy*v228 + M_xyyy*v229 &
      + M_xyyyy*v230 + M_xyyyyy*v231 + M_xyyyyz*v232 + M_xyyyz*v233 + &
      M_xyyyzz*v234 + M_xyyz*v235 + M_xyyzz*v236 + M_xyyzzz*v237 + &
      M_xyzz*v223 + M_xyzzz*v224 + M_xyzzzz*v225 + M_xzz*v238 + M_xzzz* &
      v239 + M_xzzzz*v240 + M_xzzzzz*v241 + M_yyyyyz*v324 + M_yyyyz* &
      v325 + M_yyyyzz*v326 + M_yyyz*v327 + M_yyyzz*v328 + M_yyyzzz*v329 &
      + M_yyz*v330 + M_yyzz*v331 + M_yyzzz*v332 + M_yyzzzz*v333 + M_yzz &
      *v314 + M_yzzz*v315 + M_yzzzz*v316 + M_yzzzzz*v317 + M_zz*v334 + &
      M_zzz*v335 + M_zzzz*v336 + M_zzzzz*v337 + M_zzzzzz*v338
    L_xyz      = D_xxxxxxyz*v179 + D_xxxxxyyz*v180 + D_xxxxxyz*v143 + D_xxxxxyzz*v181 + &
      D_xxxxyyyz*v182 + D_xxxxyyz*v144 + D_xxxxyyzz*v183 + D_xxxxyz* &
      v122 + D_xxxxyzz*v145 + D_xxxxyzzz*v184 + D_xxxyyyyz*v185 + &
      D_xxxyyyz*v146 + D_xxxyyyzz*v186 + D_xxxyyz*v123 + D_xxxyyzz*v147 &
      + D_xxxyyzzz*v187 + D_xxxyz*v112 + D_xxxyzz*v124 + D_xxxyzzz*v148 &
      + D_xxxyzzzz*v188 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz &
      + D_xyyyyyyz*v307 + D_xyyyyyz*v298 + D_xyyyyz*v293 + D_xyyyz*v291 &
      + D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v235 + M_xyyy*v233 + M_xyyyy* &
      v232 + M_xyyyz*v242 + M_xyyz*v214 + M_xyyzz*v243 + M_xyzz*v226 + &
      M_xyzzz*v227 + M_xzz*v244 + M_xzzz*v245 + M_xzzzz*v246 + M_yyyyz* &
      v339 + M_yyyz*v340 + M_yyyzz*v313 + M_yyz*v302 + M_yyzz*v341 + &
      M_yyzzz*v342 + M_yzz*v320 + M_yzzz*v321 + M_yzzzz*v322 + M_zz* &
      v343 + M_zzz*v344 + M_zzzz*v345 + M_zzzzz*v346
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = D_x*M_0 + D_xxx*v112 + D_xxxx*v122 + D_xxxxx*v143 + D_xxxxxx*v179 + &
      D_xxxxxxx*v247 + D_xxxxxxxx*v347 + D_xxxxxxxy*v348 + D_xxxxxxxz* &
      v349 + D_xxxxxxy*v248 + D_xxxxxxyy*v350 + D_xxxxxxyz*v351 + &
      D_xxxxxxz*v249 + D_xxxxxxzz*v352 + D_xxxxxy*v180 + D_xxxxxyy*v250 &
      + D_xxxxxyyy*v353 + D_xxxxxyyz*v354 + D_xxxxxyz*v251 + D_xxxxxyzz &
      *v355 + D_xxxxxz*v181 + D_xxxxxzz*v252 + D_xxxxxzzz*v356 + &
      D_xxxxy*v144 + D_xxxxyy*v182 + D_xxxxyyy*v253 + D_xxxxyyyy*v357 + &
      D_xxxxyyyz*v358 + D_xxxxyyz*v254 + D_xxxxyyzz*v359 + D_xxxxyz* &
      v183 + D_xxxxyzz*v255 + D_xxxxyzzz*v360 + D_xxxxz*v145 + D_xxxxzz &
      *v184 + D_xxxxzzz*v256 + D_xxxxzzzz*v361 + D_xxxy*v123 + D_xxxyy* &
      v146 + D_xxxyyy*v185 + D_xxxyyyy*v257 + D_xxxyyyyy*v362 + &
      D_xxxyyyyz*v363 + D_xxxyyyz*v258 + D_xxxyyyzz*v364 + D_xxxyyz* &
      v186 + D_xxxyyzz*v259 + D_xxxyyzzz*v365 + D_xxxyz*v147 + D_xxxyzz &
      *v187 + D_xxxyzzz*v260 + D_xxxyzzzz*v366 + D_xxxz*v124 + D_xxxzz* &
      v148 + D_xxxzzz*v188 + D_xxxzzzz*v261 + D_xxxzzzzz*v367 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v291 + D_xyyy*v293 + &
      D_xyyyy*v298 + D_xyyyyy*v307 + D_xyyyyyy*v323 + D_xyyyyyyy*v368 + &
      D_xyyyyyyz*v369 + D_xyyyyyz*v370 + D_xyyyyyzz*v371 + D_xyyyyz* &
      v372 + D_xyyyyzz*v373 + D_xyyyyzzz*v374 + D_xyyyz*v375 + D_xyyyzz &
      *v376 + D_xyyyzzz*v377 + D_xyyyzzzz*v378 + D_xyyz*v379 + D_xyyzz* &
      v380 + D_xyyzzz*v381 + D_xyyzzzz*v382 + D_xyyzzzzz*v383 + D_xyz* &
      M_yz + D_xzz*v384 + D_xzzz*v385 + D_xzzzz*v386 + D_xzzzzz*v387 + &
      D_xzzzzzz*v388 + D_xzzzzzzz*v389 + M_xyy*v262 + M_xyyy*v263 + &
      M_xyyyy*v264 + M_xyyyyy*v265 + M_xyyyyyy*v266 + M_xyyyyyz*v267 + &
      M_xyyyyz*v268 + M_xyyyyzz*v269 + M_xyyyz*v270 + M_xyyyzz*v271 + &
      M_xyyyzzz*v272 + M_xyyz*v273 + M_xyyzz*v274 + M_xyyzzz*v275 + &
      M_xyyzzzz*v276 + M_xyzz*v238 + M_xyzzz*v239 + M_xyzzzz*v240 + &
      M_xyzzzzz*v241 + M_xzz*v277 + M_xzzz*v278 + M_xzzzz*v279 + &
      M_xzzzzz*v280 + M_xzzzzzz*v281 + M_yzz*v334 + M_yzzz*v335 + &
      M_yzzzz*v336 + M_yzzzzz*v337 + M_yzzzzzz*v338
    L_xz       = D_xxxxxxxz*v247 + D_xxxxxxyz*v248 + D_xxxxxxz*v179 + D_xxxxxxzz*v249 + &
      D_xxxxxyyz*v250 + D_xxxxxyz*v180 + D_xxxxxyzz*v251 + D_xxxxxz* &
      v143 + D_xxxxxzz*v181 + D_xxxxxzzz*v252 + D_xxxxyyyz*v253 + &
      D_xxxxyyz*v182 + D_xxxxyyzz*v254 + D_xxxxyz*v144 + D_xxxxyzz*v183 &
      + D_xxxxyzzz*v255 + D_xxxxz*v122 + D_xxxxzz*v145 + D_xxxxzzz*v184 &
      + D_xxxxzzzz*v256 + D_xxxyyyyz*v257 + D_xxxyyyz*v185 + D_xxxyyyzz &
      *v258 + D_xxxyyz*v146 + D_xxxyyzz*v186 + D_xxxyyzzz*v259 + &
      D_xxxyz*v123 + D_xxxyzz*v147 + D_xxxyzzz*v187 + D_xxxyzzzz*v260 + &
      D_xxxz*v112 + D_xxxzz*v124 + D_xxxzzz*v148 + D_xxxzzzz*v188 + &
      D_xxxzzzzz*v261 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + &
      D_xyyyyyyz*v323 + D_xyyyyyz*v307 + D_xyyyyyzz*v370 + D_xyyyyz* &
      v298 + D_xyyyyzz*v372 + D_xyyyyzzz*v373 + D_xyyyz*v293 + D_xyyyzz &
      *v375 + D_xyyyzzz*v376 + D_xyyyzzzz*v377 + D_xyyz*v291 + D_xyyzz* &
      v379 + D_xyyzzz*v380 + D_xyyzzzz*v381 + D_xyyzzzzz*v382 + D_xyzz* &
      M_yz + D_xz*M_0 + D_xzzz*v384 + D_xzzzz*v385 + D_xzzzzz*v386 + &
      D_xzzzzzz*v387 + D_xzzzzzzz*v388 + M_xyy*v273 + M_xyyy*v270 + &
      M_xyyyy*v268 + M_xyyyyy*v267 + M_xyyyyz*v282 + M_xyyyz*v283 + &
      M_xyyyzz*v237 + M_xyyz*v223 + M_xyyzz*v284 + M_xyyzzz*v285 + &
      M_xyzz*v244 + M_xyzzz*v245 + M_xyzzzz*v246 + M_xzz*v286 + M_xzzz* &
      v287 + M_xzzzz*v288 + M_xzzzzz*v289 + M_yzz*v343 + M_yzzz*v344 + &
      M_yzzzz*v345 + M_yzzzzz*v346
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v208 - (1260.0d0*v131 + v68*v99))
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = v133*v290
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = D_xxyyyyyy*v112 + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + &
      D_yyyyyyyy*v291 + D_yyyyyyyz*M_yz + D_yyyyyyzz*v384
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = D_xxxyyyyy*v122 + D_xxyyyyy*v112 + D_xxyyyyyy*v123 + D_xxyyyyyz*v124 + &
      D_xyyyyyy*M_xy + D_xyyyyyyy*v390 + D_xyyyyyyz*M_xyz + D_xyyyyyz* &
      M_xz + D_yyyyy*M_0 + D_yyyyyyy*v291 + D_yyyyyyyy*v293 + &
      D_yyyyyyyz*v379 + D_yyyyyyz*M_yz + D_yyyyyyzz*v391 + D_yyyyyzz* &
      v384 + D_yyyyyzzz*v385 + M_xzz*v292
    L_yyyyyz   = D_xxyyyyyz*v112 + D_xyyyyyyz*M_xy + D_xyyyyyzz*M_xz + D_yyyyyyyz*v291 + &
      D_yyyyyyzz*M_yz + D_yyyyyz*M_0 + D_yyyyyzzz*v384
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = D_xxxxyyyy*v143 + D_xxxyyyy*v122 + D_xxxyyyyy*v144 + D_xxxyyyyz*v145 + &
      D_xxyyyy*v112 + D_xxyyyyy*v123 + D_xxyyyyyy*v146 + D_xxyyyyyz* &
      v147 + D_xxyyyyz*v124 + D_xxyyyyzz*v148 + D_xyyyyy*M_xy + &
      D_xyyyyyy*v390 + D_xyyyyyyy*v392 + D_xyyyyyz*M_xyz + D_xyyyyz* &
      M_xz + D_yyyy*M_0 + D_yyyyyy*v291 + D_yyyyyyy*v293 + D_yyyyyyyy* &
      v298 + D_yyyyyyyz*v375 + D_yyyyyyz*v379 + D_yyyyyyzz*v380 + &
      D_yyyyyz*M_yz + D_yyyyyzz*v391 + D_yyyyyzzz*v393 + D_yyyyzz*v384 &
      + D_yyyyzzz*v385 + D_yyyyzzzz*v386 + M_xyyz*v294 + M_xyzz*v292 + &
      M_xzz*v295 + M_xzzz*v296
    L_yyyyz    = D_xxxyyyyz*v122 + D_xxyyyyyz*v123 + D_xxyyyyz*v112 + D_xxyyyyzz*v124 + &
      D_xyyyyyyz*v390 + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyzz* &
      M_xz + D_yyyyyyyz*v293 + D_yyyyyyz*v291 + D_yyyyyyzz*v379 + &
      D_yyyyyzz*M_yz + D_yyyyyzzz*v391 + D_yyyyz*M_0 + D_yyyyzzz*v384 + &
      D_yyyyzzzz*v385 + M_xzz*v297
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = D_xxxxxyyy*v179 + D_xxxxyyy*v143 + D_xxxxyyyy*v180 + D_xxxxyyyz*v181 + &
      D_xxxyyy*v122 + D_xxxyyyy*v144 + D_xxxyyyyy*v182 + D_xxxyyyyz* &
      v183 + D_xxxyyyz*v145 + D_xxxyyyzz*v184 + D_xxyyy*v112 + D_xxyyyy &
      *v123 + D_xxyyyyy*v146 + D_xxyyyyyy*v185 + D_xxyyyyyz*v186 + &
      D_xxyyyyz*v147 + D_xxyyyyzz*v187 + D_xxyyyz*v124 + D_xxyyyzz*v148 &
      + D_xxyyyzzz*v188 + D_xyyyy*M_xy + D_xyyyyy*v390 + D_xyyyyyy*v392 &
      + D_xyyyyyyy*v394 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v291 + D_yyyyyy*v293 + D_yyyyyyy*v298 + D_yyyyyyyy*v307 + &
      D_yyyyyyyz*v372 + D_yyyyyyz*v375 + D_yyyyyyzz*v376 + D_yyyyyz* &
      v379 + D_yyyyyzz*v380 + D_yyyyyzzz*v381 + D_yyyyz*M_yz + D_yyyyzz &
      *v391 + D_yyyyzzz*v393 + D_yyyyzzzz*v395 + D_yyyzz*v384 + &
      D_yyyzzz*v385 + D_yyyzzzz*v386 + D_yyyzzzzz*v387 + M_xyyyz*v299 + &
      M_xyyz*v300 + M_xyyzz*v301 + M_xyzz*v295 + M_xyzzz*v296 + M_xzz* &
      v302 + M_xzzz*v303 + M_xzzzz*v304
    L_yyyz     = D_xxxxyyyz*v143 + D_xxxyyyyz*v144 + D_xxxyyyz*v122 + D_xxxyyyzz*v145 + &
      D_xxyyyyyz*v146 + D_xxyyyyz*v123 + D_xxyyyyzz*v147 + D_xxyyyz* &
      v112 + D_xxyyyzz*v124 + D_xxyyyzzz*v148 + D_xyyyyyyz*v392 + &
      D_xyyyyyz*v390 + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz &
      + D_yyyyyyyz*v298 + D_yyyyyyz*v293 + D_yyyyyyzz*v375 + D_yyyyyz* &
      v291 + D_yyyyyzz*v379 + D_yyyyyzzz*v380 + D_yyyyzz*M_yz + &
      D_yyyyzzz*v391 + D_yyyyzzzz*v393 + D_yyyz*M_0 + D_yyyzzz*v384 + &
      D_yyyzzzz*v385 + D_yyyzzzzz*v386 + M_xyyz*v292 + M_xyzz*v297 + &
      M_xzz*v305 + M_xzzz*v306
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = D_xxxxxxyy*v247 + D_xxxxxyy*v179 + D_xxxxxyyy*v248 + D_xxxxxyyz*v249 + &
      D_xxxxyy*v143 + D_xxxxyyy*v180 + D_xxxxyyyy*v250 + D_xxxxyyyz* &
      v251 + D_xxxxyyz*v181 + D_xxxxyyzz*v252 + D_xxxyy*v122 + D_xxxyyy &
      *v144 + D_xxxyyyy*v182 + D_xxxyyyyy*v253 + D_xxxyyyyz*v254 + &
      D_xxxyyyz*v183 + D_xxxyyyzz*v255 + D_xxxyyz*v145 + D_xxxyyzz*v184 &
      + D_xxxyyzzz*v256 + D_xxyy*v112 + D_xxyyy*v123 + D_xxyyyy*v146 + &
      D_xxyyyyy*v185 + D_xxyyyyyy*v257 + D_xxyyyyyz*v258 + D_xxyyyyz* &
      v186 + D_xxyyyyzz*v259 + D_xxyyyz*v147 + D_xxyyyzz*v187 + &
      D_xxyyyzzz*v260 + D_xxyyz*v124 + D_xxyyzz*v148 + D_xxyyzzz*v188 + &
      D_xxyyzzzz*v261 + D_xyyy*M_xy + D_xyyyy*v390 + D_xyyyyy*v392 + &
      D_xyyyyyy*v394 + D_xyyyyyyy*v396 + D_xyyyz*M_xyz + D_xyyz*M_xz + &
      D_yy*M_0 + D_yyyy*v291 + D_yyyyy*v293 + D_yyyyyy*v298 + D_yyyyyyy &
      *v307 + D_yyyyyyyy*v323 + D_yyyyyyyz*v370 + D_yyyyyyz*v372 + &
      D_yyyyyyzz*v373 + D_yyyyyz*v375 + D_yyyyyzz*v376 + D_yyyyyzzz* &
      v377 + D_yyyyz*v379 + D_yyyyzz*v380 + D_yyyyzzz*v381 + D_yyyyzzzz &
      *v382 + D_yyyz*M_yz + D_yyyzz*v391 + D_yyyzzz*v393 + D_yyyzzzz* &
      v395 + D_yyyzzzzz*v397 + D_yyzz*v384 + D_yyzzz*v385 + D_yyzzzz* &
      v386 + D_yyzzzzz*v387 + D_yyzzzzzz*v388 + M_xyyyyz*v308 + M_xyyyz &
      *v309 + M_xyyyzz*v310 + M_xyyz*v311 + M_xyyzz*v312 + M_xyyzzz* &
      v313 + M_xyzz*v302 + M_xyzzz*v303 + M_xyzzzz*v304 + M_xzz*v314 + &
      M_xzzz*v315 + M_xzzzz*v316 + M_xzzzzz*v317
    L_yyz      = D_xxxxxyyz*v179 + D_xxxxyyyz*v180 + D_xxxxyyz*v143 + D_xxxxyyzz*v181 + &
      D_xxxyyyyz*v182 + D_xxxyyyz*v144 + D_xxxyyyzz*v183 + D_xxxyyz* &
      v122 + D_xxxyyzz*v145 + D_xxxyyzzz*v184 + D_xxyyyyyz*v185 + &
      D_xxyyyyz*v146 + D_xxyyyyzz*v186 + D_xxyyyz*v123 + D_xxyyyzz*v147 &
      + D_xxyyyzzz*v187 + D_xxyyz*v112 + D_xxyyzz*v124 + D_xxyyzzz*v148 &
      + D_xxyyzzzz*v188 + D_xyyyyyyz*v394 + D_xyyyyyz*v392 + D_xyyyyz* &
      v390 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyyz* &
      v307 + D_yyyyyyz*v298 + D_yyyyyyzz*v372 + D_yyyyyz*v293 + &
      D_yyyyyzz*v375 + D_yyyyyzzz*v376 + D_yyyyz*v291 + D_yyyyzz*v379 + &
      D_yyyyzzz*v380 + D_yyyyzzzz*v381 + D_yyyzz*M_yz + D_yyyzzz*v391 + &
      D_yyyzzzz*v393 + D_yyyzzzzz*v395 + D_yyz*M_0 + D_yyzzz*v384 + &
      D_yyzzzz*v385 + D_yyzzzzz*v386 + D_yyzzzzzz*v387 + M_xyyyz*v318 + &
      M_xyyz*v295 + M_xyyzz*v319 + M_xyzz*v305 + M_xyzzz*v306 + M_xzz* &
      v320 + M_xzzz*v321 + M_xzzzz*v322
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = D_xxxxxxxy*v347 + D_xxxxxxy*v247 + D_xxxxxxyy*v348 + D_xxxxxxyz*v349 + &
      D_xxxxxy*v179 + D_xxxxxyy*v248 + D_xxxxxyyy*v350 + D_xxxxxyyz* &
      v351 + D_xxxxxyz*v249 + D_xxxxxyzz*v352 + D_xxxxy*v143 + D_xxxxyy &
      *v180 + D_xxxxyyy*v250 + D_xxxxyyyy*v353 + D_xxxxyyyz*v354 + &
      D_xxxxyyz*v251 + D_xxxxyyzz*v355 + D_xxxxyz*v181 + D_xxxxyzz*v252 &
      + D_xxxxyzzz*v356 + D_xxxy*v122 + D_xxxyy*v144 + D_xxxyyy*v182 + &
      D_xxxyyyy*v253 + D_xxxyyyyy*v357 + D_xxxyyyyz*v358 + D_xxxyyyz* &
      v254 + D_xxxyyyzz*v359 + D_xxxyyz*v183 + D_xxxyyzz*v255 + &
      D_xxxyyzzz*v360 + D_xxxyz*v145 + D_xxxyzz*v184 + D_xxxyzzz*v256 + &
      D_xxxyzzzz*v361 + D_xxy*v112 + D_xxyy*v123 + D_xxyyy*v146 + &
      D_xxyyyy*v185 + D_xxyyyyy*v257 + D_xxyyyyyy*v362 + D_xxyyyyyz* &
      v363 + D_xxyyyyz*v258 + D_xxyyyyzz*v364 + D_xxyyyz*v186 + &
      D_xxyyyzz*v259 + D_xxyyyzzz*v365 + D_xxyyz*v147 + D_xxyyzz*v187 + &
      D_xxyyzzz*v260 + D_xxyyzzzz*v366 + D_xxyz*v124 + D_xxyzz*v148 + &
      D_xxyzzz*v188 + D_xxyzzzz*v261 + D_xxyzzzzz*v367 + D_xyy*M_xy + &
      D_xyyy*v390 + D_xyyyy*v392 + D_xyyyyy*v394 + D_xyyyyyy*v396 + &
      D_xyyyyyyy*v398 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy* &
      v291 + D_yyyy*v293 + D_yyyyy*v298 + D_yyyyyy*v307 + D_yyyyyyy* &
      v323 + D_yyyyyyyy*v368 + D_yyyyyyyz*v369 + D_yyyyyyz*v370 + &
      D_yyyyyyzz*v371 + D_yyyyyz*v372 + D_yyyyyzz*v373 + D_yyyyyzzz* &
      v374 + D_yyyyz*v375 + D_yyyyzz*v376 + D_yyyyzzz*v377 + D_yyyyzzzz &
      *v378 + D_yyyz*v379 + D_yyyzz*v380 + D_yyyzzz*v381 + D_yyyzzzz* &
      v382 + D_yyyzzzzz*v383 + D_yyz*M_yz + D_yyzz*v391 + D_yyzzz*v393 &
      + D_yyzzzz*v395 + D_yyzzzzz*v397 + D_yyzzzzzz*v399 + D_yzz*v384 + &
      D_yzzz*v385 + D_yzzzz*v386 + D_yzzzzz*v387 + D_yzzzzzz*v388 + &
      D_yzzzzzzz*v389 + M_xyyyyyz*v324 + M_xyyyyz*v325 + M_xyyyyzz*v326 &
      + M_xyyyz*v327 + M_xyyyzz*v328 + M_xyyyzzz*v329 + M_xyyz*v330 + &
      M_xyyzz*v331 + M_xyyzzz*v332 + M_xyyzzzz*v333 + M_xyzz*v314 + &
      M_xyzzz*v315 + M_xyzzzz*v316 + M_xyzzzzz*v317 + M_xzz*v334 + &
      M_xzzz*v335 + M_xzzzz*v336 + M_xzzzzz*v337 + M_xzzzzzz*v338
    L_yz       = D_xxxxxxyz*v247 + D_xxxxxyyz*v248 + D_xxxxxyz*v179 + D_xxxxxyzz*v249 + &
      D_xxxxyyyz*v250 + D_xxxxyyz*v180 + D_xxxxyyzz*v251 + D_xxxxyz* &
      v143 + D_xxxxyzz*v181 + D_xxxxyzzz*v252 + D_xxxyyyyz*v253 + &
      D_xxxyyyz*v182 + D_xxxyyyzz*v254 + D_xxxyyz*v144 + D_xxxyyzz*v183 &
      + D_xxxyyzzz*v255 + D_xxxyz*v122 + D_xxxyzz*v145 + D_xxxyzzz*v184 &
      + D_xxxyzzzz*v256 + D_xxyyyyyz*v257 + D_xxyyyyz*v185 + D_xxyyyyzz &
      *v258 + D_xxyyyz*v146 + D_xxyyyzz*v186 + D_xxyyyzzz*v259 + &
      D_xxyyz*v123 + D_xxyyzz*v147 + D_xxyyzzz*v187 + D_xxyyzzzz*v260 + &
      D_xxyz*v112 + D_xxyzz*v124 + D_xxyzzz*v148 + D_xxyzzzz*v188 + &
      D_xxyzzzzz*v261 + D_xyyyyyyz*v396 + D_xyyyyyz*v394 + D_xyyyyz* &
      v392 + D_xyyyz*v390 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + &
      D_yyyyyyyz*v323 + D_yyyyyyz*v307 + D_yyyyyyzz*v370 + D_yyyyyz* &
      v298 + D_yyyyyzz*v372 + D_yyyyyzzz*v373 + D_yyyyz*v293 + D_yyyyzz &
      *v375 + D_yyyyzzz*v376 + D_yyyyzzzz*v377 + D_yyyz*v291 + D_yyyzz* &
      v379 + D_yyyzzz*v380 + D_yyyzzzz*v381 + D_yyyzzzzz*v382 + D_yyzz* &
      M_yz + D_yyzzz*v391 + D_yyzzzz*v393 + D_yyzzzzz*v395 + D_yyzzzzzz &
      *v397 + D_yz*M_0 + D_yzzz*v384 + D_yzzzz*v385 + D_yzzzzz*v386 + &
      D_yzzzzzz*v387 + D_yzzzzzzz*v388 + M_xyyyyz*v339 + M_xyyyz*v340 + &
      M_xyyyzz*v313 + M_xyyz*v302 + M_xyyzz*v341 + M_xyyzzz*v342 + &
      M_xyzz*v320 + M_xyzzz*v321 + M_xyzzzz*v322 + M_xzz*v343 + M_xzzz* &
      v344 + M_xzzzz*v345 + M_xzzzzz*v346
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_z        = 0.00138888888888889d0*(20.0d0*D_xyyyzzzz*M_xyyyzzz + 180.0d0*D_xyyzzz* &
      M_xyyzz + 60.0d0*D_xyyzzzz*M_xyyzzz + 360.0d0*D_xzzz*M_xzz + &
      D_xzzzzzzz*M_xzzzzzz + 6.0d0*(D_xyyyyyzz*M_xyyyyyz + D_xzzzzzz* &
      M_xzzzzz) + 30.0d0*(D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + &
      15.0d0*(D_xyyyyzzz*M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz) + 120.0d0*( &
      D_xyyyzz*M_xyyyz + D_xzzzz*M_xzzz)) + D_xxxxxxxz*v347 + &
      D_xxxxxxyz*v348 + D_xxxxxxz*v247 + D_xxxxxxzz*v349 + D_xxxxxyyz* &
      v350 + D_xxxxxyz*v248 + D_xxxxxyzz*v351 + D_xxxxxz*v179 + &
      D_xxxxxzz*v249 + D_xxxxxzzz*v352 + D_xxxxyyyz*v353 + D_xxxxyyz* &
      v250 + D_xxxxyyzz*v354 + D_xxxxyz*v180 + D_xxxxyzz*v251 + &
      D_xxxxyzzz*v355 + D_xxxxz*v143 + D_xxxxzz*v181 + D_xxxxzzz*v252 + &
      D_xxxxzzzz*v356 + D_xxxyyyyz*v357 + D_xxxyyyz*v253 + D_xxxyyyzz* &
      v358 + D_xxxyyz*v182 + D_xxxyyzz*v254 + D_xxxyyzzz*v359 + D_xxxyz &
      *v144 + D_xxxyzz*v183 + D_xxxyzzz*v255 + D_xxxyzzzz*v360 + D_xxxz &
      *v122 + D_xxxzz*v145 + D_xxxzzz*v184 + D_xxxzzzz*v256 + &
      D_xxxzzzzz*v361 + D_xxyyyyyz*v362 + D_xxyyyyz*v257 + D_xxyyyyzz* &
      v363 + D_xxyyyz*v185 + D_xxyyyzz*v258 + D_xxyyyzzz*v364 + D_xxyyz &
      *v146 + D_xxyyzz*v186 + D_xxyyzzz*v259 + D_xxyyzzzz*v365 + D_xxyz &
      *v123 + D_xxyzz*v147 + D_xxyzzz*v187 + D_xxyzzzz*v260 + &
      D_xxyzzzzz*v366 + D_xxz*v112 + D_xxzz*v124 + D_xxzzz*v148 + &
      D_xxzzzz*v188 + D_xxzzzzz*v261 + D_xxzzzzzz*v367 + D_xyyyyyyz* &
      v398 + D_xyyyyyz*v396 + D_xyyyyz*v394 + D_xyyyz*v392 + D_xyyz* &
      v390 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyyyyyz*v368 + &
      D_yyyyyyz*v323 + D_yyyyyyzz*v369 + D_yyyyyz*v307 + D_yyyyyzz*v370 &
      + D_yyyyyzzz*v371 + D_yyyyz*v298 + D_yyyyzz*v372 + D_yyyyzzz*v373 &
      + D_yyyyzzzz*v374 + D_yyyz*v293 + D_yyyzz*v375 + D_yyyzzz*v376 + &
      D_yyyzzzz*v377 + D_yyyzzzzz*v378 + D_yyz*v291 + D_yyzz*v379 + &
      D_yyzzz*v380 + D_yyzzzz*v381 + D_yyzzzzz*v382 + D_yyzzzzzz*v383 + &
      D_yzz*M_yz + D_yzzz*v391 + D_yzzzz*v393 + D_yzzzzz*v395 + &
      D_yzzzzzz*v397 + D_yzzzzzzz*v399 + D_z*M_0 + D_zzz*v384 + D_zzzz* &
      v385 + D_zzzzz*v386 + D_zzzzzz*v387 + D_zzzzzzz*v388 + D_zzzzzzzz &
      *v389 + M_xyyyzz*v332 + M_xyyz*v314 + M_xyzz*v343 + M_xyzzz*v344 &
      + M_xyzzzz*v345 + M_xyzzzzz*v346
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  L_xx                
#undef  M_xz                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  L_xxx               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xyz               
#undef  L_xyy               
#undef  M_yyy               
#undef  M_yyz               
#undef  L_xyz               
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
#undef  L_xxyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xxyz              
#undef  M_yyyy              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  M_yyyz              
#undef  L_yyyy              
#undef  M_xxxxx             
#undef  L_yyyz              
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xxxyy             
#undef  L_xxxxz             
#undef  M_xxxyz             
#undef  L_xxxyy             
#undef  M_xxyyy             
#undef  L_xxxyz             
#undef  M_xxyyz             
#undef  L_xxyyy             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  M_yyyyy             
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
#undef  L_xxxxyy            
#undef  M_xxxyyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
#undef  M_xyyyyy            
#undef  L_xxyyyy            
#undef  M_xyyyyz            
#undef  L_xxyyyz            
#undef  M_yyyyyy            
#undef  L_xyyyyy            
#undef  M_yyyyyz            
#undef  L_xyyyyz            
#undef  M_xxxxxxx           
#undef  L_yyyyyy            
#undef  M_xxxxxxy           
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  L_xxxxxxy           
#undef  M_xxxxxyz           
#undef  L_xxxxxxz           
#undef  M_xxxxyyy           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_xxxxyyz           
#undef  L_xxxxyyy           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  M_xxyyyyy           
#undef  L_xxxyyyz           
#undef  M_xxyyyyz           
#undef  L_xxyyyyy           
#undef  M_xyyyyyy           
#undef  L_xxyyyyz           
#undef  M_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  M_yyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  L_xxxxxxxx          
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  L_xxxxxxyz          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  L_yyyyyyyz          
    end subroutine mom_es_M2L
    
! OPS  870*ADD + 2*DIV + 1004*MUL + 84*NEG + POW = 1961  (6417 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz,&
                L_xxxxxxzz, L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz,&
                L_xxxxzzzz, L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz,&
                L_xxyyyyzz, L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz,&
                L_xyyyyyzz, L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz,&
                L_xzzzzzzz, L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz,&
                L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
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
#define L_yy                 L(6)
#define Ls_yy                Ls(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define Ls_xxz               Ls(10)
#define L_xxz                L(10)
#define Ls_xyy               Ls(11)
#define L_xyy                L(11)
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
#define L_yyyyy              L(33)
#define Ls_yyyyy             Ls(33)
#define L_yyyyz              L(34)
#define Ls_yyyyz             Ls(34)
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
#define L_xxxyyz             L(41)
#define Ls_xxxyyz            Ls(41)
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
#define Ls_xxxxyyy           Ls(53)
#define L_xxxxyyy            L(53)
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
#define L_xxxxxxxx           L(63)
#define Ls_xxxxxxxx          Ls(63)
#define Ls_xxxxxxxy          Ls(64)
#define L_xxxxxxxy           L(64)
#define Ls_xxxxxxxz          Ls(65)
#define L_xxxxxxxz           L(65)
#define Ls_xxxxxxyy          Ls(66)
#define L_xxxxxxyy           L(66)
#define Ls_xxxxxxyz          Ls(67)
#define L_xxxxxxyz           L(67)
#define Ls_xxxxxyyy          Ls(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define Ls_xxxxxyyz          Ls(69)
#define Ls_xxxxyyyy          Ls(70)
#define L_xxxxyyyy           L(70)
#define L_xxxxyyyz           L(71)
#define Ls_xxxxyyyz          Ls(71)
#define Ls_xxxyyyyy          Ls(72)
#define L_xxxyyyyy           L(72)
#define Ls_xxxyyyyz          Ls(73)
#define L_xxxyyyyz           L(73)
#define L_xxyyyyyy           L(74)
#define Ls_xxyyyyyy          Ls(74)
#define Ls_xxyyyyyz          Ls(75)
#define L_xxyyyyyz           L(75)
#define L_xyyyyyyy           L(76)
#define Ls_xyyyyyyy          Ls(76)
#define Ls_xyyyyyyz          Ls(77)
#define L_xyyyyyyz           L(77)
#define L_yyyyyyyy           L(78)
#define Ls_yyyyyyyy          Ls(78)
#define Ls_yyyyyyyz          Ls(79)
#define L_yyyyyyyz           L(79)
    v0          = L_xxxxxxx + L_xxxxxxxy*y + L_xxxxxxxz*z
    v1          = L_xxxxxxy + L_xxxxxxyz*z
    v2          = L_xxxxxxyy*y + v1
    v3          = L_xxxxxyy + L_xxxxxyyz*z
    v4          = L_xxxxxyyy*y + v3
    v5          = L_xxxxyyy + L_xxxxyyyz*z
    v6          = L_xxxxyyyy*y + v5
    v7          = L_xxxyyyy + L_xxxyyyyz*z
    v8          = L_xxxyyyyy*y + v7
    v9          = L_xxyyyyy + L_xxyyyyyz*z
    v10         = L_xxyyyyyy*y + v9
    v11         = L_xyyyyyy + L_xyyyyyyz*z
    v12         = L_xyyyyyyy*y + v11
    v13         = L_yyyyyyy + L_yyyyyyyz*z
    v14         = L_xxxxxxz*z
    v21         = v1*y
    v23         = L_xxxxxyz*z
    v26         = v3*y
    v29         = L_xxxxxz*z
    v40         = 0.5d0*x
    v46         = L_xxxxyyz*z
    v49         = v5*y
    v52         = L_xxxxyz*z
    v63         = L_xxxxz*z
    v77         = 0.166666666666667d0*x
    v87         = L_xxxyyyz*z
    v90         = v7*y
    v93         = L_xxxyyz*z
    v104        = L_xxxyz*z
    v120        = L_xxxz*z
    v137        = 0.0416666666666667d0*x
    v149        = L_xxyyyyz*z
    v152        = v9*y
    v155        = L_xxyyyz*z
    v166        = L_xxyyz*z
    v182        = L_xxyz*z
    v202        = L_xxz*z
    v221        = 0.00833333333333333d0*x
    v235        = L_xyyyyyz*z
    v238        = v11*y
    v241        = L_xyyyyz*z
    v252        = L_xyyyz*z
    v268        = L_xyyz*z
    v288        = L_xyz*z
    v326        = 0.00138888888888889d0*y
    v331        = 0.00138888888888889d0*x
    v342        = L_yyyyyyz*z
    v345        = L_yyyyyz*z
    v347        = 0.5d0*y
    v351        = L_yyyyz*z
    v354        = 0.166666666666667d0*y
    v360        = L_yyyz*z
    v364        = 0.0416666666666667d0*y
    v371        = L_yyz*z
    v376        = 0.00833333333333333d0*y
    Ls_xxxxxxx  = L_xxxxxxxx*x + v0
    Ls_xxxxxxy  = L_xxxxxxxy*x + v2
    Ls_xxxxxyy  = L_xxxxxxyy*x + v4
    Ls_xxxxyyy  = L_xxxxxyyy*x + v6
    Ls_xxxyyyy  = L_xxxxyyyy*x + v8
    Ls_xxyyyyy  = L_xxxyyyyy*x + v10
    Ls_xyyyyyy  = L_xxyyyyyy*x + v12
    Ls_yyyyyyy  = v13 + L_xyyyyyyy*x + L_yyyyyyyy*y
    Ls_xxxxxxxx = L_xxxxxxxx
    Ls_xxxxxxxy = L_xxxxxxxy
    Ls_xxxxxxxz = L_xxxxxxxz
    Ls_xxxxxxyy = L_xxxxxxyy
    Ls_xxxxxxyz = L_xxxxxxyz
    Ls_xxxxxyyy = L_xxxxxyyy
    Ls_xxxxxyyz = L_xxxxxyyz
    Ls_xxxxyyyy = L_xxxxyyyy
    Ls_xxxxyyyz = L_xxxxyyyz
    Ls_xxxyyyyy = L_xxxyyyyy
    Ls_xxxyyyyz = L_xxxyyyyz
    Ls_xxyyyyyy = L_xxyyyyyy
    Ls_xxyyyyyz = L_xxyyyyyz
    Ls_xyyyyyyy = L_xyyyyyyy
    Ls_xyyyyyyz = L_xyyyyyyz
    Ls_yyyyyyyy = L_yyyyyyyy
    Ls_yyyyyyyz = L_yyyyyyyz
    L_zz        = -(L_xx + L_yy)
    L_xzz       = -(L_xxx + L_xyy)
    v333        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v388        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    v224        = L_xxzz*z
    L_xyzz      = -(L_xxxy + L_xyyy)
    v301        = L_xyzz*z
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    v381        = L_yyzz*z
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    v140        = L_xxxzz*z
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    v193        = L_xxyzz*z
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    v279        = L_xyyzz*z
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    v368        = L_yyyzz*z
    L_yyzzz     = -(L_xxyyz + L_yyyyz)
    L_yzzzz     = -(L_xxyzz + L_yyyzz)
    L_zzzzz     = -(L_xxzzz + L_yyzzz)
    L_xxxxzz    = -(L_xxxxxx + L_xxxxyy)
    v80         = L_xxxxzz*z
    L_xxxyzz    = -(L_xxxxxy + L_xxxyyy)
    v113        = L_xxxyzz*z
    L_xxxzzz    = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz    = -(L_xxxxyy + L_xxyyyy)
    v175        = L_xxyyzz*z
    L_xxyzzz    = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz    = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz    = -(L_xxxyyy + L_xyyyyy)
    v261        = L_xyyyzz*z
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    v357        = L_yyyyzz*z
    L_yyyzzz    = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz    = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz    = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz    = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz   = -(L_xxxxxxx + L_xxxxxyy)
    v42         = L_xxxxxzz*z
    L_xxxxyzz   = -(L_xxxxxxy + L_xxxxyyy)
    v59         = L_xxxxyzz*z
    L_xxxxzzz   = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz   = -(L_xxxxxyy + L_xxxyyyy)
    v100        = L_xxxyyzz*z
    L_xxxyzzz   = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz   = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz   = -(L_xxxxyyy + L_xxyyyyy)
    v162        = L_xxyyyzz*z
    L_xxyyzzz   = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz   = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz   = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz   = -(L_xxxyyyy + L_xyyyyyy)
    v248        = L_xyyyyzz*z
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    v349        = L_yyyyyzz*z
    L_yyyyzzz   = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz   = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz   = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz   = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz   = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz  = -(L_xxxxxxxx + L_xxxxxxyy)
    v22         = L_xxxxxxz + L_xxxxxxyz*y + L_xxxxxxzz*z
    Ls_xxxxxxz  = L_xxxxxxxz*x + v22
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    v27         = L_xxxxxyz + L_xxxxxyzz*z
    v28         = L_xxxxxyyz*y + v27
    v45         = v27*y
    Ls_xxxxxyz  = L_xxxxxxyz*x + v28
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    v50         = L_xxxxyyz + L_xxxxyyzz*z
    v51         = L_xxxxyyyz*y + v50
    v62         = v50*y
    Ls_xxxxyyz  = L_xxxxxyyz*x + v51
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    v91         = L_xxxyyyz + L_xxxyyyzz*z
    v92         = L_xxxyyyyz*y + v91
    v103        = v91*y
    Ls_xxxyyyz  = L_xxxxyyyz*x + v92
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    v153        = L_xxyyyyz + L_xxyyyyzz*z
    v154        = L_xxyyyyyz*y + v153
    v165        = v153*y
    Ls_xxyyyyz  = L_xxxyyyyz*x + v154
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    v239        = L_xyyyyyz + L_xyyyyyzz*z
    v240        = L_xyyyyyyz*y + v239
    v251        = v239*y
    Ls_xyyyyyz  = L_xxyyyyyz*x + v240
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    v344        = L_yyyyyyz + L_yyyyyyzz*z
    Ls_yyyyyyz  = v344 + L_xyyyyyyz*x + L_yyyyyyyz*y
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v15         = a2
    v16         = 0.5d0*v15
    v76         = 0.25d0*v15
    v136        = 0.0833333333333333d0*v15
    v220        = 0.0208333333333333d0*v15
    v330        = 0.00416666666666667d0*v15
    a3          = a1*a2
    v30         = a3
    v31         = 0.166666666666667d0*v30
    v135        = 0.0833333333333333d0*v30
    v219        = 0.0277777777777778d0*v30
    v329        = 0.00694444444444444d0*v30
    a4          = a2*a2
    v64         = a4
    v65         = 0.0416666666666667d0*v64
    v216        = 0.0208333333333333d0*v64
    v328        = 0.00694444444444444d0*v64
    a5          = a2*a3
    v121        = a5
    v122        = 0.00833333333333333d0*v121
    v324        = 0.00416666666666667d0*v121
    a6          = a3*a3
    v203        = 0.00138888888888889d0*a6
    a7          = a3*a4
    v312        = 0.000198412698412698d0*a7
    a8          = a4*a4
    b2          = b1*b1
    v17         = b2
    v18         = L_xxxxxxyy*v17
    v24         = L_xxxxxyyy*v17
    v37         = 0.5d0*v17
    v43         = L_xxxxxyyz*v17
    v47         = L_xxxxyyyy*v17
    v60         = L_xxxxyyyz*v17
    v78         = 3.0d0*v17
    v88         = L_xxxyyyyy*v17
    v101        = L_xxxyyyyz*v17
    v150        = L_xxyyyyyy*v17
    v163        = L_xxyyyyyz*v17
    v236        = L_xyyyyyyy*v17
    v249        = L_xyyyyyyz*v17
    v325        = 0.00416666666666667d0*v17
    v353        = 0.25d0*v17
    v363        = 0.0833333333333333d0*v17
    v375        = 0.0208333333333333d0*v17
    b3          = b1*b2
    v32         = b3
    v33         = L_xxxxxyyy*v32
    v53         = L_xxxxyyyy*v32
    v72         = 0.166666666666667d0*v32
    v81         = L_xxxxyyyz*v32
    v94         = L_xxxyyyyy*v32
    v114        = L_xxxyyyyz*v32
    v138        = 4.0d0*v32
    v156        = L_xxyyyyyy*v32
    v176        = L_xxyyyyyz*v32
    v242        = L_xyyyyyyy*v32
    v262        = L_xyyyyyyz*v32
    v323        = 0.00694444444444444d0*v32
    v362        = 0.0833333333333333d0*v32
    v374        = 0.0277777777777778d0*v32
    b4          = b2*b2
    v66         = b4
    v67         = L_xxxxyyyy*v66
    v105        = L_xxxyyyyy*v66
    v130        = 0.0416666666666667d0*v66
    v141        = L_xxxyyyyz*v66
    v167        = L_xxyyyyyy*v66
    v194        = L_xxyyyyyz*v66
    v222        = 5.0d0*v66
    v253        = L_xyyyyyyy*v66
    v280        = L_xyyyyyyz*v66
    v322        = 0.00694444444444444d0*v66
    v373        = 0.0208333333333333d0*v66
    b5          = b2*b3
    v123        = b5
    v124        = L_xxxyyyyy*v123
    v183        = L_xxyyyyyy*v123
    v212        = 0.00833333333333333d0*v123
    v225        = L_xxyyyyyz*v123
    v269        = L_xyyyyyyy*v123
    v302        = L_xyyyyyyz*v123
    v321        = 0.00416666666666667d0*v123
    v332        = 6.0d0*v123
    b6          = b3*b3
    v204        = b6
    v205        = L_xxyyyyyy*v204
    v289        = L_xyyyyyyy*v204
    v320        = 0.00138888888888889d0*v204
    v334        = L_xyyyyyyz*v204
    b7          = b3*b4
    v313        = 0.000198412698412698d0*b7
    b8          = b4*b4
    c2          = c1*c1
    v19         = c2
    v314        = 0.5d0*v19
    v355        = 3.0d0*v19
    v365        = 12.0d0*v19
    v377        = 60.0d0*v19
    v384        = 360.0d0*v19
    v206        = L_xxzz*v19
    v290        = L_xyzz*v19
    v125        = L_xxxzz*v19
    v184        = L_xxyzz*v19
    v226        = L_xxzzz*v19
    v270        = L_xyyzz*v19
    v303        = L_xyzzz*v19
    v68         = L_xxxxzz*v19
    v106        = L_xxxyzz*v19
    v142        = L_xxxzzz*v19
    v168        = L_xxyyzz*v19
    v195        = L_xxyzzz*v19
    v254        = L_xyyyzz*v19
    v281        = L_xyyzzz*v19
    v34         = L_xxxxxzz*v19
    v54         = L_xxxxyzz*v19
    v82         = L_xxxxzzz*v19
    v95         = L_xxxyyzz*v19
    v115        = L_xxxyzzz*v19
    v157        = L_xxyyyzz*v19
    v177        = L_xxyyzzz*v19
    v243        = L_xyyyyzz*v19
    v263        = L_xyyyzzz*v19
    v20         = L_xxxxxxzz*v19
    v41         = v18 + v20 + 2.0d0*(L_xxxxxx + v14 + v21)
    Ls_xxxxxx   = 0.5d0*(v18 + v20) + L_xxxxxx + L_xxxxxxxx*v16 + v0*x + v14 + v21
    v25         = L_xxxxxyzz*v19
    v38         = v25 + 2.0d0*(L_xxxxxy + v23)
    v39         = v38*y
    v58         = 2.0d0*v26 + v24 + v38
    Ls_xxxxxy   = 0.5d0*(v24 + v25) + L_xxxxxxxy*v16 + L_xxxxxy + v2*x + v23 + v26
    v44         = L_xxxxxzzz*v19
    v86         = v43 + v44 + 2.0d0*(L_xxxxxz + v42 + v45)
    Ls_xxxxxz   = 0.5d0*(v43 + v44) + L_xxxxxxxz*v16 + L_xxxxxz + v22*x + v42 + v45
    v48         = L_xxxxyyzz*v19
    v56         = v48 + 2.0d0*(L_xxxxyy + v46)
    v57         = v56*y
    v73         = v17*v56
    v99         = 2.0d0*v49 + v47 + v56
    Ls_xxxxyy   = 0.5d0*(v47 + v48) + L_xxxxxxyy*v16 + L_xxxxyy + v4*x + v46 + v49
    v61         = L_xxxxyzzz*v19
    v84         = v61 + 2.0d0*(L_xxxxyz + v59)
    v85         = v84*y
    v119        = 2.0d0*v62 + v60 + v84
    Ls_xxxxyz   = 0.5d0*(v60 + v61) + L_xxxxxxyz*v16 + L_xxxxyz + v28*x + v59 + v62
    v89         = L_xxxyyyzz*v19
    v97         = v89 + 2.0d0*(L_xxxyyy + v87)
    v98         = v97*y
    v109        = v17*v97
    v131        = v32*v97
    v161        = 2.0d0*v90 + v88 + v97
    Ls_xxxyyy   = 0.5d0*(v88 + v89) + L_xxxxxyyy*v16 + L_xxxyyy + v6*x + v87 + v90
    v102        = L_xxxyyzzz*v19
    v117        = v102 + 2.0d0*(L_xxxyyz + v100)
    v118        = v117*y
    v145        = v117*v17
    v181        = 2.0d0*v103 + v101 + v117
    Ls_xxxyyz   = 0.5d0*(v101 + v102) + L_xxxxxyyz*v16 + L_xxxyyz + v100 + v103 + v51*x
    v151        = L_xxyyyyzz*v19
    v159        = v151 + 2.0d0*(L_xxyyyy + v149)
    v160        = v159*y
    v171        = v159*v17
    v188        = v159*v32
    v213        = v159*v66
    v247        = 2.0d0*v152 + v150 + v159
    Ls_xxyyyy   = 0.5d0*(v150 + v151) + L_xxxxyyyy*v16 + L_xxyyyy + v149 + v152 + v8*x
    v164        = L_xxyyyzzz*v19
    v179        = v164 + 2.0d0*(L_xxyyyz + v162)
    v180        = v179*y
    v198        = v17*v179
    v230        = v179*v32
    v267        = 2.0d0*v165 + v163 + v179
    Ls_xxyyyz   = 0.5d0*(v163 + v164) + L_xxxxyyyz*v16 + L_xxyyyz + v162 + v165 + v92*x
    v237        = L_xyyyyyzz*v19
    v245        = v237 + 2.0d0*(L_xyyyyy + v235)
    v246        = v245*y
    v257        = v17*v245
    v274        = v245*v32
    v295        = v245*v66
    Ls_xyyyyy   = 0.5d0*(v236 + v237) + L_xxxyyyyy*v16 + L_xyyyyy + v10*x + v235 + v238
    v250        = L_xyyyyzzz*v19
    v265        = v250 + 2.0d0*(L_xyyyyz + v248)
    v266        = v265*y
    v284        = v17*v265
    v307        = v265*v32
    v336        = v265*v66
    Ls_xyyyyz   = 0.5d0*(v249 + v250) + L_xxxyyyyz*v16 + L_xyyyyz + v154*x + v248 + v251
    v343        = L_yyyyyyzz*v19
    v348        = v343 + 2.0d0*(L_yyyyyy + v342)
    Ls_yyyyyy   = 0.5d0*v343 + L_xxyyyyyy*v16 + L_yyyyyy + L_yyyyyyyy*v37 + v12*x + v13*y &
      + v342
    v350        = L_yyyyyzzz*v19
    v359        = v350 + 2.0d0*(L_yyyyyz + v349)
    Ls_yyyyyz   = 0.5d0*v350 + L_xxyyyyyz*v16 + L_yyyyyyyz*v37 + L_yyyyyz + v240*x + v344* &
      y + v349
    h           = v15 + v17 + v19
    u2          = 1.0/h
    u           = sqrt(u2)
    u3          = u*u2
    u4          = u2*u2
    u5          = u2*u3
    u6          = u3*u3
    u7          = u3*u4
    u8          = u4*u4
    u9          = u4*u5
    u10         = u5*u5
    u11         = u5*u6
    u12         = u6*u6
    u13         = u6*u7
    u14         = u7*u7
    u15         = u7*u8
    u16         = u8*u8
    u17         = u8*u9
    c3          = c1*c2
    v35         = c3
    v315        = 0.166666666666667d0*v35
    v366        = 4.0d0*v35
    v378        = 20.0d0*v35
    v385        = 120.0d0*v35
    v207        = L_xxzzz*v35
    v291        = L_xyzzz*v35
    v126        = L_xxxzzz*v35
    v185        = L_xxyzzz*v35
    v227        = L_xxzzzz*v35
    v271        = L_xyyzzz*v35
    v304        = L_xyzzzz*v35
    v69         = L_xxxxzzz*v35
    v107        = L_xxxyzzz*v35
    v143        = L_xxxzzzz*v35
    v169        = L_xxyyzzz*v35
    v196        = L_xxyzzzz*v35
    v255        = L_xyyyzzz*v35
    v282        = L_xyyzzzz*v35
    v36         = L_xxxxxzzz*v35
    v79         = v33 + v36 + v3*v78 + 6.0d0*(L_xxxxx + v29) + 3.0d0*(v34 + v39)
    Ls_xxxxx    = 0.166666666666667d0*(v33 + v36 + 3.0d0*(v34 + v39)) + L_xxxxx + &
      L_xxxxxxxx*v31 + v0*v16 + v29 + v3*v37 + v40*v41
    v55         = L_xxxxyzzz*v35
    v74         = v55 + 3.0d0*(2.0d0*L_xxxxy + 2.0d0*v52 + v54)
    v75         = v74*y
    v112        = v53 + v74 + v5*v78 + 3.0d0*v57
    Ls_xxxxy    = 0.166666666666667d0*(v53 + v55 + 3.0d0*(v54 + v57)) + L_xxxxxxxy*v31 + &
      L_xxxxy + v16*v2 + v37*v5 + v40*v58 + v52
    v83         = L_xxxxzzzz*v35
    v148        = v81 + v83 + v50*v78 + 6.0d0*(L_xxxxz + v80) + 3.0d0*(v82 + v85)
    Ls_xxxxz    = 0.166666666666667d0*(v81 + v83 + 3.0d0*(v82 + v85)) + L_xxxxxxxz*v31 + &
      L_xxxxz + v16*v22 + v37*v50 + v40*v86 + v80
    v96         = L_xxxyyzzz*v35
    v110        = v96 + 3.0d0*(2.0d0*L_xxxyy + 2.0d0*v93 + v95)
    v111        = v110*y
    v132        = v110*v17
    v174        = v110 + v94 + v7*v78 + 3.0d0*v98
    Ls_xxxyy    = 0.166666666666667d0*(v94 + v96 + 3.0d0*(v95 + v98)) + L_xxxxxxyy*v31 + &
      L_xxxyy + v16*v4 + v37*v7 + v40*v99 + v93
    v116        = L_xxxyzzzz*v35
    v146        = v116 + 3.0d0*(2.0d0*L_xxxyz + 2.0d0*v113 + v115)
    v147        = v146*y
    v201        = v114 + v146 + 3.0d0*v118 + v78*v91
    Ls_xxxyz    = 0.166666666666667d0*(v114 + v116 + 3.0d0*(v115 + v118)) + L_xxxxxxyz*v31 &
      + L_xxxyz + v113 + v119*v40 + v16*v28 + v37*v91
    v158        = L_xxyyyzzz*v35
    v172        = v158 + 3.0d0*(2.0d0*L_xxyyy + 2.0d0*v155 + v157)
    v173        = v172*y
    v189        = v17*v172
    v214        = v172*v32
    v260        = v156 + v172 + 3.0d0*v160 + v78*v9
    Ls_xxyyy    = 0.166666666666667d0*(v156 + v158 + 3.0d0*(v157 + v160)) + L_xxxxxyyy*v31 &
      + L_xxyyy + v155 + v16*v6 + v161*v40 + v37*v9
    v178        = L_xxyyzzzz*v35
    v199        = v178 + 3.0d0*(2.0d0*L_xxyyz + 2.0d0*v175 + v177)
    v200        = v199*y
    v231        = v17*v199
    v287        = v176 + v199 + v153*v78 + 3.0d0*v180
    Ls_xxyyz    = 0.166666666666667d0*(v176 + v178 + 3.0d0*(v177 + v180)) + L_xxxxxyyz*v31 &
      + L_xxyyz + v153*v37 + v16*v51 + v175 + v181*v40
    v244        = L_xyyyyzzz*v35
    v258        = v244 + 3.0d0*(2.0d0*L_xyyyy + 2.0d0*v241 + v243)
    v259        = v258*y
    v275        = v17*v258
    v296        = v258*v32
    Ls_xyyyy    = 0.166666666666667d0*(v242 + v244 + 3.0d0*(v243 + v246)) + L_xxxxyyyy*v31 &
      + L_xyyyy + v11*v37 + v16*v8 + v241 + v247*v40
    v264        = L_xyyyzzzz*v35
    v285        = v264 + 3.0d0*(2.0d0*L_xyyyz + 2.0d0*v261 + v263)
    v286        = v285*y
    v308        = v17*v285
    v337        = v285*v32
    Ls_xyyyz    = 0.166666666666667d0*(v262 + v264 + 3.0d0*(v263 + v266)) + L_xxxxyyyz*v31 &
      + L_xyyyz + v16*v92 + v239*v37 + v261 + v267*v40
    v346        = L_yyyyyzzz*v35
    v356        = v346 + L_yyyyyzz*v355 + 6.0d0*(L_yyyyy + v345)
    Ls_yyyyy    = 0.166666666666667d0*v346 + L_xxxyyyyy*v31 + L_yyyyy + L_yyyyyyyy*v72 + &
      L_yyyyyzz*v314 + v10*v16 + v13*v37 + v345 + v347*v348 + v40*(v236 &
      + 2.0d0*v238 + v245)
    v358        = L_yyyyzzzz*v35
    v370        = v358 + L_yyyyzzz*v355 + 6.0d0*(L_yyyyz + v357)
    Ls_yyyyz    = 0.166666666666667d0*v358 + L_xxxyyyyz*v31 + L_yyyyyyyz*v72 + L_yyyyz + &
      L_yyyyzzz*v314 + v154*v16 + v344*v37 + v347*v359 + v357 + v40*( &
      v249 + 2.0d0*v251 + v265)
    c4          = c2*c2
    v70         = c4
    v316        = 0.0416666666666667d0*v70
    v379        = 5.0d0*v70
    v386        = 30.0d0*v70
    v208        = L_xxzzzz*v70
    v292        = L_xyzzzz*v70
    v127        = L_xxxzzzz*v70
    v186        = L_xxyzzzz*v70
    v228        = L_xxzzzzz*v70
    v272        = L_xyyzzzz*v70
    v305        = L_xyzzzzz*v70
    v71         = L_xxxxzzzz*v70
    v139        = v67 + v71 + v138*v5 + 12.0d0*v68 + 6.0d0*v73 + 24.0d0*(L_xxxx + v63) + &
      4.0d0*(v69 + v75)
    Ls_xxxx     = 0.0416666666666667d0*(v67 + 12.0d0*v68 + v71 + 6.0d0*v73 + 4.0d0*(v69 + &
      v75)) + L_xxxx + L_xxxxxxxx*v65 + v0*v31 + v41*v76 + v5*v72 + v63 &
      + v77*v79
    v108        = L_xxxyzzzz*v70
    v133        = v108 + 12.0d0*v106 + 4.0d0*(6.0d0*L_xxxy + 6.0d0*v104 + v107)
    v134        = v133*y
    v192        = v105 + v133 + 6.0d0*v109 + 4.0d0*v111 + v138*v7
    Ls_xxxy     = 0.0416666666666667d0*(v105 + 12.0d0*v106 + v108 + 6.0d0*v109 + 4.0d0*( &
      v107 + v111)) + L_xxxxxxxy*v65 + L_xxxy + v104 + v112*v77 + v2* &
      v31 + v58*v76 + v7*v72
    v144        = L_xxxzzzzz*v70
    v234        = v141 + v144 + v138*v91 + 12.0d0*v142 + 6.0d0*v145 + 24.0d0*(L_xxxz + &
      v140) + 4.0d0*(v143 + v147)
    Ls_xxxz     = 0.0416666666666667d0*(v141 + 12.0d0*v142 + v144 + 6.0d0*v145 + 4.0d0*( &
      v143 + v147)) + L_xxxxxxxz*v65 + L_xxxz + v140 + v148*v77 + v22* &
      v31 + v72*v91 + v76*v86
    v170        = L_xxyyzzzz*v70
    v190        = v170 + 12.0d0*v168 + 4.0d0*(6.0d0*L_xxyy + 6.0d0*v166 + v169)
    v191        = v190*y
    v215        = v17*v190
    v278        = v167 + v190 + v138*v9 + 6.0d0*v171 + 4.0d0*v173
    Ls_xxyy     = 0.0416666666666667d0*(v167 + 12.0d0*v168 + v170 + 6.0d0*v171 + 4.0d0*( &
      v169 + v173)) + L_xxxxxxyy*v65 + L_xxyy + v166 + v174*v77 + v31* &
      v4 + v72*v9 + v76*v99
    v197        = L_xxyzzzzz*v70
    v232        = v197 + 12.0d0*v195 + 4.0d0*(6.0d0*L_xxyz + 6.0d0*v193 + v196)
    v233        = v232*y
    v311        = v194 + v232 + v138*v153 + 6.0d0*v198 + 4.0d0*v200
    Ls_xxyz     = 0.0416666666666667d0*(v194 + 12.0d0*v195 + v197 + 6.0d0*v198 + 4.0d0*( &
      v196 + v200)) + L_xxxxxxyz*v65 + L_xxyz + v119*v76 + v153*v72 + &
      v193 + v201*v77 + v28*v31
    v256        = L_xyyyzzzz*v70
    v276        = v256 + 12.0d0*v254 + 4.0d0*(6.0d0*L_xyyy + 6.0d0*v252 + v255)
    v277        = v276*y
    v297        = v17*v276
    Ls_xyyy     = 0.0416666666666667d0*(v253 + 12.0d0*v254 + v256 + 6.0d0*v257 + 4.0d0*( &
      v255 + v259)) + L_xxxxxyyy*v65 + L_xyyy + v11*v72 + v161*v76 + &
      v252 + v260*v77 + v31*v6
    v283        = L_xyyzzzzz*v70
    v309        = v283 + 12.0d0*v281 + 4.0d0*(6.0d0*L_xyyz + 6.0d0*v279 + v282)
    v310        = v309*y
    v338        = v17*v309
    Ls_xyyz     = 0.0416666666666667d0*(v280 + 12.0d0*v281 + v283 + 6.0d0*v284 + 4.0d0*( &
      v282 + v286)) + L_xxxxxyyz*v65 + L_xyyz + v181*v76 + v239*v72 + &
      v279 + v287*v77 + v31*v51
    v352        = L_yyyyzzzz*v70
    v367        = v352 + L_yyyyzz*v365 + L_yyyyzzz*v366 + 24.0d0*(L_yyyy + v351)
    Ls_yyyy     = 0.0416666666666667d0*v352 + L_xxxxyyyy*v65 + L_yyyy + L_yyyyyyyy*v130 + &
      L_yyyyzz*v314 + L_yyyyzzz*v315 + v13*v72 + v247*v76 + v31*v8 + &
      v348*v353 + v351 + v354*v356 + v77*(v11*v78 + v242 + 3.0d0*v246 + &
      v258)
    v369        = L_yyyzzzzz*v70
    v383        = v369 + L_yyyzzz*v365 + L_yyyzzzz*v366 + 24.0d0*(L_yyyz + v368)
    Ls_yyyz     = 0.0416666666666667d0*v369 + L_xxxxyyyz*v65 + L_yyyyyyyz*v130 + L_yyyz + &
      L_yyyzzz*v314 + L_yyyzzzz*v315 + v267*v76 + v31*v92 + v344*v72 + &
      v353*v359 + v354*v370 + v368 + v77*(v239*v78 + v262 + 3.0d0*v266 &
      + v285)
    c5          = c2*c3
    v128        = c5
    v317        = 0.00833333333333333d0*v128
    v387        = 6.0d0*v128
    v209        = L_xxzzzzz*v128
    v293        = L_xyzzzzz*v128
    v129        = L_xxxzzzzz*v128
    v223        = v124 + v129 + 60.0d0*v125 + 20.0d0*v126 + v222*v7 + 120.0d0*(L_xxx + &
      v120) + 5.0d0*(v127 + v134) + 10.0d0*(v131 + v132)
    Ls_xxx      = 0.00833333333333333d0*(v124 + 60.0d0*v125 + 20.0d0*v126 + v129 + 5.0d0*( &
      v127 + v134) + 10.0d0*(v131 + v132)) + L_xxx + L_xxxxxxxx*v122 + &
      v0*v65 + v120 + v130*v7 + v135*v41 + v136*v79 + v137*v139
    v187        = L_xxyzzzzz*v128
    v217        = v187 + 60.0d0*v184 + 20.0d0*v185 + 5.0d0*(24.0d0*L_xxy + 24.0d0*v182 + &
      v186)
    v218        = v217*y
    v300        = v183 + v217 + 5.0d0*v191 + v222*v9 + 10.0d0*(v188 + v189)
    Ls_xxy      = 0.00833333333333333d0*(v183 + 60.0d0*v184 + 20.0d0*v185 + v187 + 5.0d0*( &
      v186 + v191) + 10.0d0*(v188 + v189)) + L_xxxxxxxy*v122 + L_xxy + &
      v112*v136 + v130*v9 + v135*v58 + v137*v192 + v182 + v2*v65
    v229        = L_xxzzzzzz*v128
    v341        = v225 + v229 + v153*v222 + 60.0d0*v226 + 20.0d0*v227 + 120.0d0*(L_xxz + &
      v224) + 5.0d0*(v228 + v233) + 10.0d0*(v230 + v231)
    Ls_xxz      = 0.00833333333333333d0*(v225 + 60.0d0*v226 + 20.0d0*v227 + v229 + 5.0d0*( &
      v228 + v233) + 10.0d0*(v230 + v231)) + L_xxxxxxxz*v122 + L_xxz + &
      v130*v153 + v135*v86 + v136*v148 + v137*v234 + v22*v65 + v224
    v273        = L_xyyzzzzz*v128
    v298        = v273 + 60.0d0*v270 + 20.0d0*v271 + 5.0d0*(24.0d0*L_xyy + 24.0d0*v268 + &
      v272)
    v299        = v298*y
    Ls_xyy      = 0.00833333333333333d0*(v269 + 60.0d0*v270 + 20.0d0*v271 + v273 + 5.0d0*( &
      v272 + v277) + 10.0d0*(v274 + v275)) + L_xxxxxxyy*v122 + L_xyy + &
      v11*v130 + v135*v99 + v136*v174 + v137*v278 + v268 + v4*v65
    v306        = L_xyzzzzzz*v128
    v339        = v306 + 60.0d0*v303 + 20.0d0*v304 + 5.0d0*(24.0d0*L_xyz + 24.0d0*v301 + &
      v305)
    v340        = v339*y
    Ls_xyz      = 0.00833333333333333d0*(v302 + 60.0d0*v303 + 20.0d0*v304 + v306 + 5.0d0*( &
      v305 + v310) + 10.0d0*(v307 + v308)) + L_xxxxxxyz*v122 + L_xyz + &
      v119*v135 + v130*v239 + v136*v201 + v137*v311 + v28*v65 + v301
    v361        = L_yyyzzzzz*v128
    v380        = v361 + L_yyyzz*v377 + L_yyyzzz*v378 + L_yyyzzzz*v379 + 120.0d0*(L_yyy + &
      v360)
    Ls_yyy      = 0.00833333333333333d0*v361 + L_xxxxxyyy*v122 + L_yyy + L_yyyyyyyy*v212 + &
      L_yyyzz*v314 + L_yyyzzz*v315 + L_yyyzzzz*v316 + v13*v130 + v135* &
      v161 + v136*v260 + v137*(v11*v138 + v253 + 6.0d0*v257 + 4.0d0* &
      v259 + v276) + v348*v362 + v356*v363 + v360 + v364*v367 + v6*v65
    v382        = L_yyzzzzzz*v128
    v390        = v382 + L_yyzzz*v377 + L_yyzzzz*v378 + L_yyzzzzz*v379 + 120.0d0*(L_yyz + &
      v381)
    Ls_yyz      = 0.00833333333333333d0*v382 + L_xxxxxyyz*v122 + L_yyyyyyyz*v212 + L_yyz + &
      L_yyzzz*v314 + L_yyzzzz*v315 + L_yyzzzzz*v316 + v130*v344 + v135* &
      v181 + v136*v287 + v137*(v138*v239 + v280 + 6.0d0*v284 + 4.0d0* &
      v286 + v309) + v359*v362 + v363*v370 + v364*v383 + v381 + v51*v65
    c6          = c3*c3
    v210        = c6
    v318        = 0.00138888888888889d0*v210
    v211        = L_xxzzzzzz*v210
    Ls_xx       = 0.00138888888888889d0*(v205 + 360.0d0*v206 + 120.0d0*v207 + 30.0d0*v208 &
      + v211 + 20.0d0*v214 + 6.0d0*(v209 + v218) + 15.0d0*(v213 + v215 &
      )) + L_xx + L_xxxxxxxx*v203 + v0*v122 + v139*v220 + v202 + v212* &
      v9 + v216*v41 + v219*v79 + v221*v223
    v294        = L_xyzzzzzz*v210
    v327        = v294 + 360.0d0*v290 + 120.0d0*v291 + 30.0d0*v292 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v288 + v293)
    Ls_xy       = 0.00138888888888889d0*(v289 + 360.0d0*v290 + 120.0d0*v291 + 30.0d0*v292 &
      + v294 + 20.0d0*v296 + 6.0d0*(v293 + v299) + 15.0d0*(v295 + v297 &
      )) + L_xxxxxxxy*v203 + L_xy + v11*v212 + v112*v219 + v122*v2 + &
      v192*v220 + v216*v58 + v221*v300 + v288
    v335        = L_xzzzzzzz*v210
    Ls_xz       = 0.00138888888888889d0*(v334 + v335 + 20.0d0*v337 + 6.0d0*v340 + 15.0d0*( &
      v336 + v338)) + L_xxxxxxxz*v203 + L_xz + L_xzzz*v314 + L_xzzzz* &
      v315 + L_xzzzzz*v316 + L_xzzzzzz*v317 + v122*v22 + v148*v219 + &
      v212*v239 + v216*v86 + v220*v234 + v221*v341 + v333
    v372        = L_yyzzzzzz*v210
    Ls_yy       = 0.00138888888888889d0*v372 + L_xxxxxxyy*v203 + L_yy + L_yyyyyyyy*v320 + &
      L_yyzz*v314 + L_yyzzz*v315 + L_yyzzzz*v316 + L_yyzzzzz*v317 + &
      v122*v4 + v13*v212 + v174*v219 + v216*v99 + v220*v278 + v221*(v11 &
      *v222 + v269 + 10.0d0*v274 + 10.0d0*v275 + 5.0d0*v277 + v298) + &
      v348*v373 + v356*v374 + v367*v375 + v371 + v376*v380
    v389        = L_yzzzzzzz*v210
    Ls_yz       = 0.00138888888888889d0*v389 + L_xxxxxxyz*v203 + L_yyyyyyyz*v320 + L_yz + &
      L_yzzz*v314 + L_yzzzz*v315 + L_yzzzzz*v316 + L_yzzzzzz*v317 + &
      v119*v216 + v122*v28 + v201*v219 + v212*v344 + v220*v311 + v221*( &
      v222*v239 + v302 + 10.0d0*v307 + 10.0d0*v308 + 5.0d0*v310 + v339 &
      ) + v359*v373 + v370*v374 + v375*v383 + v376*v390 + v388
    c7          = c3*c4
    v319        = 0.000198412698412698d0*c7
    Ls_x        = L_x + L_xxxxxxxx*v312 + L_xyyyyyyy*v313 + L_xz*z + L_xzz*v314 + L_xzzz* &
      v315 + L_xzzzz*v316 + L_xzzzzz*v317 + L_xzzzzzz*v318 + L_xzzzzzzz &
      *v319 + v0*v203 + v11*v320 + v139*v329 + v223*v330 + v245*v321 + &
      v258*v322 + v276*v323 + v298*v325 + v324*v41 + v326*v327 + v328* &
      v79 + v331*(720.0d0*L_xx + 720.0d0*v202 + v205 + 360.0d0*v206 + &
      120.0d0*v207 + 30.0d0*v208 + 6.0d0*v209 + v211 + 15.0d0*v213 + &
      20.0d0*v214 + 15.0d0*v215 + 6.0d0*v218 + v332*v9)
    Ls_y        = L_y + L_xxxxxxxy*v312 + L_yyyyyyyy*v313 + L_yz*z + L_yzz*v314 + L_yzzz* &
      v315 + L_yzzzz*v316 + L_yzzzzz*v317 + L_yzzzzzz*v318 + L_yzzzzzzz &
      *v319 + v112*v328 + v13*v320 + v192*v329 + v2*v203 + v300*v330 + &
      v321*v348 + v322*v356 + v323*v367 + v324*v58 + v325*v380 + v326*( &
      720.0d0*L_yy + L_yyzz*v384 + L_yyzzz*v385 + L_yyzzzz*v386 + &
      L_yyzzzzz*v387 + 720.0d0*v371 + v372) + v331*(v11*v332 + v289 + &
      15.0d0*v295 + 20.0d0*v296 + 15.0d0*v297 + 6.0d0*v299 + v327)
    Ls_z        = L_z + L_xxxxxxxz*v312 + L_yyyyyyyz*v313 + L_zz*z + L_zzz*v314 + L_zzzz* &
      v315 + L_zzzzz*v316 + L_zzzzzz*v317 + L_zzzzzzz*v318 + L_zzzzzzzz &
      *v319 + v148*v328 + v203*v22 + v234*v329 + v320*v344 + v321*v359 &
      + v322*v370 + v323*v383 + v324*v86 + v325*v390 + v326*(720.0d0* &
      L_yz + L_yzzz*v384 + L_yzzzz*v385 + L_yzzzzz*v386 + L_yzzzzzz* &
      v387 + 720.0d0*v388 + v389) + v330*v341 + v331*(720.0d0*L_xz + &
      L_xzzz*v384 + L_xzzzz*v385 + L_xzzzzz*v386 + L_xzzzzzz*v387 + &
      v239*v332 + 720.0d0*v333 + v334 + v335 + 15.0d0*v336 + 20.0d0* &
      v337 + 15.0d0*v338 + 6.0d0*v340)
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
#undef  L_yy                
#undef  Ls_yy               
#undef  Ls_yz               
#undef  L_yz                
#undef  Ls_xxx              
#undef  L_xxx               
#undef  Ls_xxy              
#undef  L_xxy               
#undef  Ls_xxz              
#undef  L_xxz               
#undef  Ls_xyy              
#undef  L_xyy               
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
#undef  L_yyyyy             
#undef  Ls_yyyyy            
#undef  L_yyyyz             
#undef  Ls_yyyyz            
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
#undef  L_xxxyyz            
#undef  Ls_xxxyyz           
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
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
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
#undef  L_xxxxxxxx          
#undef  Ls_xxxxxxxx         
#undef  Ls_xxxxxxxy         
#undef  L_xxxxxxxy          
#undef  Ls_xxxxxxxz         
#undef  L_xxxxxxxz          
#undef  Ls_xxxxxxyy         
#undef  L_xxxxxxyy          
#undef  Ls_xxxxxxyz         
#undef  L_xxxxxxyz          
#undef  Ls_xxxxxyyy         
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  Ls_xxxxxyyz         
#undef  Ls_xxxxyyyy         
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  Ls_xxxxyyyz         
#undef  Ls_xxxyyyyy         
#undef  L_xxxyyyyy          
#undef  Ls_xxxyyyyz         
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  Ls_xxyyyyyy         
#undef  Ls_xxyyyyyz         
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  Ls_xyyyyyyy         
#undef  Ls_xyyyyyyz         
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L
    
! OPS  303*ADD + 2*DIV + 431*MUL + 84*NEG + POW = 821  (1511 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v11, v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21,&
                v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32,&
                v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43,&
                v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54,&
                v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65,&
                v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76,&
                v77, v78, v79, v8, v80, v81, v9, h, u, L_zz, L_xzz, L_yzz,&
                L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz,&
                L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz,&
                L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz,&
                L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz,&
                L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz,&
                L_xxxxxzz, L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz,&
                L_xxxzzzz, L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz,&
                L_xyyyyzz, L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz,&
                L_yyyyyzz, L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz,&
                L_zzzzzzz, L_xxxxxxzz, L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz,&
                L_xxxxyzzz, L_xxxxzzzz, L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz,&
                L_xxxzzzzz, L_xxyyyyzz, L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz,&
                L_xxzzzzzz, L_xyyyyyzz, L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz,&
                L_xyzzzzzz, L_xzzzzzzz, L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz,&
                L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
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
#define L_xxxxxxxx           L(63)
#define L_xxxxxxxy           L(64)
#define L_xxxxxxxz           L(65)
#define L_xxxxxxyy           L(66)
#define L_xxxxxxyz           L(67)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define L_xxxxyyyy           L(70)
#define L_xxxxyyyz           L(71)
#define L_xxxyyyyy           L(72)
#define L_xxxyyyyz           L(73)
#define L_xxyyyyyy           L(74)
#define L_xxyyyyyz           L(75)
#define L_xyyyyyyy           L(76)
#define L_xyyyyyyz           L(77)
#define L_yyyyyyyy           L(78)
#define L_yyyyyyyz           L(79)
    v15        = L_xyyyyyy + L_xyyyyyyz*z
    v19        = 2.0d0*z
    v23        = 6.0d0*z
    v28        = 24.0d0*z
    v34        = 2.0d0*y
    v35        = L_xxxxxxy + L_xxxxxxyz*z
    v37        = 120.0d0*z
    v42        = 0.00138888888888889d0*y
    v43        = 720.0d0*z
    v51        = L_xxxxxyy + L_xxxxxyyz*z
    v52        = 3.0d0*y
    v56        = L_xxxxyyy + L_xxxxyyyz*z
    v59        = 4.0d0*y
    v64        = L_xxxyyyy + L_xxxyyyyz*z
    v69        = 5.0d0*y
    v71        = 0.00138888888888889d0*x
    v73        = L_xxyyyyy + L_xxyyyyyz*z
    v80        = 6.0d0*y
    L_zz       = -(L_xx + L_yy)
    L_xzz      = -(L_xxx + L_xyy)
    L_yzz      = -(L_xxy + L_yyy)
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    L_xyzz     = -(L_xxxy + L_xyyy)
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    L_yyzzz    = -(L_xxyyz + L_yyyyz)
    L_yzzzz    = -(L_xxyzz + L_yyyzz)
    L_zzzzz    = -(L_xxzzz + L_yyzzz)
    L_xxxxzz   = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz   = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz   = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz   = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz   = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz   = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz   = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz   = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz   = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz   = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz   = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz  = -(L_xxxxxxx + L_xxxxxyy)
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz = -(L_xxxxxxxx + L_xxxxxxyy)
    L_xxxxxyzz = -(L_xxxxxxxy + L_xxxxxyyy)
    L_xxxxxzzz = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz = -(L_xxxxxxyy + L_xxxxyyyy)
    L_xxxxyzzz = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz = -(L_xxxxxyyy + L_xxxyyyyy)
    L_xxxyyzzz = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz = -(L_xxxxyyyy + L_xxyyyyyy)
    L_xxyyyzzz = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz = -(L_xxxyyyyy + L_xyyyyyyy)
    L_xyyyyzzz = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz = -(L_xxyyyyyy + L_yyyyyyyy)
    L_yyyyyzzz = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz = -(L_xxzzzzzz + L_yyzzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v61        = a2
    v62        = 0.00416666666666667d0*v61
    a3         = a1*a2
    v54        = 0.00694444444444444d0*a3
    a4         = a2*a2
    v49        = 0.00694444444444444d0*a4
    a5         = a2*a3
    v32        = 0.00416666666666667d0*a5
    a6         = a3*a3
    v16        = 0.00138888888888889d0*a6
    a7         = a3*a4
    v0         = 0.000198412698412698d0*a7
    a8         = a4*a4
    b2         = b1*b1
    v33        = b2
    v36        = 0.00416666666666667d0*v33
    v50        = 3.0d0*v33
    v57        = 6.0d0*v33
    v67        = 10.0d0*v33
    v78        = 15.0d0*v33
    b3         = b1*b2
    v26        = b3
    v27        = 0.00694444444444444d0*v26
    v55        = 4.0d0*v26
    v65        = 10.0d0*v26
    v76        = 20.0d0*v26
    b4         = b2*b2
    v21        = b4
    v22        = 0.00694444444444444d0*v21
    v63        = 5.0d0*v21
    v74        = 15.0d0*v21
    b5         = b2*b3
    v17        = b5
    v18        = 0.00416666666666667d0*v17
    v72        = 6.0d0*v17
    b6         = b3*b3
    v13        = b6
    v14        = 0.00138888888888889d0*v13
    b7         = b3*b4
    v1         = 0.000198412698412698d0*b7
    b8         = b4*b4
    c2         = c1*c1
    v2         = c2
    v3         = 0.5d0*v2
    v24        = 3.0d0*v2
    v29        = 12.0d0*v2
    v38        = 60.0d0*v2
    v44        = 360.0d0*v2
    v53        = 2.0d0*L_xxxxxy + L_xxxxxyz*v19 + L_xxxxxyzz*v2
    v58        = 2.0d0*L_xxxxyy + L_xxxxyyz*v19 + L_xxxxyyzz*v2
    v66        = 2.0d0*L_xxxyyy + L_xxxyyyz*v19 + L_xxxyyyzz*v2
    v75        = 2.0d0*L_xxyyyy + L_xxyyyyz*v19 + L_xxyyyyzz*v2
    v20        = 2.0d0*L_xyyyyy + L_xyyyyyz*v19 + L_xyyyyyzz*v2
    h          = v2 + v33 + v61
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
    u16        = u8*u8
    u17        = u8*u9
    c3         = c1*c2
    v4         = c3
    v5         = 0.166666666666667d0*v4
    v30        = 4.0d0*v4
    v39        = 20.0d0*v4
    v45        = 120.0d0*v4
    v60        = 6.0d0*L_xxxxy + L_xxxxyz*v23 + L_xxxxyzz*v24 + L_xxxxyzzz*v4
    v68        = 6.0d0*L_xxxyy + L_xxxyyz*v23 + L_xxxyyzz*v24 + L_xxxyyzzz*v4
    v77        = 6.0d0*L_xxyyy + L_xxyyyz*v23 + L_xxyyyzz*v24 + L_xxyyyzzz*v4
    v25        = 6.0d0*L_xyyyy + L_xyyyyz*v23 + L_xyyyyzz*v24 + L_xyyyyzzz*v4
    c4         = c2*c2
    v6         = c4
    v7         = 0.0416666666666667d0*v6
    v40        = 5.0d0*v6
    v46        = 30.0d0*v6
    v70        = 24.0d0*L_xxxy + L_xxxyz*v28 + L_xxxyzz*v29 + L_xxxyzzz*v30 + L_xxxyzzzz* &
      v6
    v79        = 24.0d0*L_xxyy + L_xxyyz*v28 + L_xxyyzz*v29 + L_xxyyzzz*v30 + L_xxyyzzzz* &
      v6
    v31        = 24.0d0*L_xyyy + L_xyyyz*v28 + L_xyyyzz*v29 + L_xyyyzzz*v30 + L_xyyyzzzz* &
      v6
    c5         = c2*c3
    v8         = c5
    v9         = 0.00833333333333333d0*v8
    v47        = 6.0d0*v8
    v81        = 120.0d0*L_xxy + L_xxyz*v37 + L_xxyzz*v38 + L_xxyzzz*v39 + L_xxyzzzz*v40 &
      + L_xxyzzzzz*v8
    v41        = 120.0d0*L_xyy + L_xyyz*v37 + L_xyyzz*v38 + L_xyyzzz*v39 + L_xyyzzzz*v40 &
      + L_xyyzzzzz*v8
    c6         = c3*c3
    v10        = c6
    v11        = 0.00138888888888889d0*v10
    v48        = 720.0d0*L_xy + L_xyz*v43 + L_xyzz*v44 + L_xyzzz*v45 + L_xyzzzz*v46 + &
      L_xyzzzzz*v47 + L_xyzzzzzz*v10
    c7         = c3*c4
    v12        = 0.000198412698412698d0*c7
    Phi_x      = L_x + L_xxxxxxxx*v0 + L_xyyyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v9 + L_xzzzzzz*v11 + L_xzzzzzzz*v12 + v14* &
      v15 + v16*(L_xxxxxxx + L_xxxxxxxy*y + L_xxxxxxxz*z) + v18*v20 + &
      v22*v25 + v27*v31 + v32*(2.0d0*L_xxxxxx + L_xxxxxxyy*v33 + &
      L_xxxxxxz*v19 + L_xxxxxxzz*v2 + v34*v35) + v36*v41 + v42*v48 + &
      v49*(6.0d0*L_xxxxx + L_xxxxxyyy*v26 + L_xxxxxz*v23 + L_xxxxxzz* &
      v24 + L_xxxxxzzz*v4 + v50*v51 + v52*v53) + v54*(24.0d0*L_xxxx + &
      L_xxxxyyyy*v21 + L_xxxxz*v28 + L_xxxxzz*v29 + L_xxxxzzz*v30 + &
      L_xxxxzzzz*v6 + v55*v56 + v57*v58 + v59*v60) + v62*(120.0d0*L_xxx &
      + L_xxxyyyyy*v17 + L_xxxz*v37 + L_xxxzz*v38 + L_xxxzzz*v39 + &
      L_xxxzzzz*v40 + L_xxxzzzzz*v8 + v63*v64 + v65*v66 + v67*v68 + v69 &
      *v70) + v71*(720.0d0*L_xx + L_xxyyyyyy*v13 + L_xxz*v43 + L_xxzz* &
      v44 + L_xxzzz*v45 + L_xxzzzz*v46 + L_xxzzzzz*v47 + L_xxzzzzzz*v10 &
      + v72*v73 + v74*v75 + v76*v77 + v78*v79 + v80*v81)
    Phi_y      = L_y + L_xxxxxxxy*v0 + L_yyyyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v9 + L_yzzzzzz*v11 + L_yzzzzzzz*v12 + v14*( &
      L_yyyyyyy + L_yyyyyyyz*z) + v16*(L_xxxxxxyy*y + v35) + v18*(2.0d0 &
      *L_yyyyyy + L_yyyyyyz*v19 + L_yyyyyyzz*v2) + v22*(6.0d0*L_yyyyy + &
      L_yyyyyz*v23 + L_yyyyyzz*v24 + L_yyyyyzzz*v4) + v27*(24.0d0* &
      L_yyyy + L_yyyyz*v28 + L_yyyyzz*v29 + L_yyyyzzz*v30 + L_yyyyzzzz* &
      v6) + v32*(L_xxxxxyyy*v33 + v34*v51 + v53) + v36*(120.0d0*L_yyy + &
      L_yyyz*v37 + L_yyyzz*v38 + L_yyyzzz*v39 + L_yyyzzzz*v40 + &
      L_yyyzzzzz*v8) + v42*(720.0d0*L_yy + L_yyz*v43 + L_yyzz*v44 + &
      L_yyzzz*v45 + L_yyzzzz*v46 + L_yyzzzzz*v47 + L_yyzzzzzz*v10) + &
      v49*(L_xxxxyyyy*v26 + v50*v56 + v52*v58 + v60) + v54*(L_xxxyyyyy* &
      v21 + v55*v64 + v57*v66 + v59*v68 + v70) + v62*(L_xxyyyyyy*v17 + &
      v63*v73 + v65*v75 + v67*v77 + v69*v79 + v81) + v71*(L_xyyyyyyy* &
      v13 + v15*v72 + v20*v74 + v25*v76 + v31*v78 + v41*v80 + v48)
    Phi_z      = L_z + L_xxxxxxxz*v0 + L_yyyyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v9 + L_zzzzzzz*v11 + L_zzzzzzzz*v12 + v14*( &
      L_yyyyyyz + L_yyyyyyzz*z) + v16*(L_xxxxxxyz*y + L_xxxxxxz + &
      L_xxxxxxzz*z) + v18*(2.0d0*L_yyyyyz + L_yyyyyzz*v19 + L_yyyyyzzz* &
      v2) + v22*(6.0d0*L_yyyyz + L_yyyyzz*v23 + L_yyyyzzz*v24 + &
      L_yyyyzzzz*v4) + v27*(24.0d0*L_yyyz + L_yyyzz*v28 + L_yyyzzz*v29 &
      + L_yyyzzzz*v30 + L_yyyzzzzz*v6) + v32*(L_xxxxxyyz*v33 + 2.0d0* &
      L_xxxxxz + L_xxxxxzz*v19 + L_xxxxxzzz*v2 + v34*(L_xxxxxyz + &
      L_xxxxxyzz*z)) + v36*(120.0d0*L_yyz + L_yyzz*v37 + L_yyzzz*v38 + &
      L_yyzzzz*v39 + L_yyzzzzz*v40 + L_yyzzzzzz*v8) + v42*(720.0d0*L_yz &
      + L_yzz*v43 + L_yzzz*v44 + L_yzzzz*v45 + L_yzzzzz*v46 + L_yzzzzzz &
      *v47 + L_yzzzzzzz*v10) + v49*(L_xxxxyyyz*v26 + 6.0d0*L_xxxxz + &
      L_xxxxzz*v23 + L_xxxxzzz*v24 + L_xxxxzzzz*v4 + v50*(L_xxxxyyz + &
      L_xxxxyyzz*z) + v52*(2.0d0*L_xxxxyz + L_xxxxyzz*v19 + L_xxxxyzzz* &
      v2)) + v54*(L_xxxyyyyz*v21 + 24.0d0*L_xxxz + L_xxxzz*v28 + &
      L_xxxzzz*v29 + L_xxxzzzz*v30 + L_xxxzzzzz*v6 + v55*(L_xxxyyyz + &
      L_xxxyyyzz*z) + v57*(2.0d0*L_xxxyyz + L_xxxyyzz*v19 + L_xxxyyzzz* &
      v2) + v59*(6.0d0*L_xxxyz + L_xxxyzz*v23 + L_xxxyzzz*v24 + &
      L_xxxyzzzz*v4)) + v62*(L_xxyyyyyz*v17 + 120.0d0*L_xxz + L_xxzz* &
      v37 + L_xxzzz*v38 + L_xxzzzz*v39 + L_xxzzzzz*v40 + L_xxzzzzzz*v8 &
      + v63*(L_xxyyyyz + L_xxyyyyzz*z) + v65*(2.0d0*L_xxyyyz + &
      L_xxyyyzz*v19 + L_xxyyyzzz*v2) + v67*(6.0d0*L_xxyyz + L_xxyyzz* &
      v23 + L_xxyyzzz*v24 + L_xxyyzzzz*v4) + v69*(24.0d0*L_xxyz + &
      L_xxyzz*v28 + L_xxyzzz*v29 + L_xxyzzzz*v30 + L_xxyzzzzz*v6)) + &
      v71*(L_xyyyyyyz*v13 + 720.0d0*L_xz + L_xzz*v43 + L_xzzz*v44 + &
      L_xzzzz*v45 + L_xzzzzz*v46 + L_xzzzzzz*v47 + L_xzzzzzzz*v10 + v72 &
      *(L_xyyyyyz + L_xyyyyyzz*z) + v74*(2.0d0*L_xyyyyz + L_xyyyyzz*v19 &
      + L_xyyyyzzz*v2) + v76*(6.0d0*L_xyyyz + L_xyyyzz*v23 + L_xyyyzzz* &
      v24 + L_xyyyzzzz*v4) + v78*(24.0d0*L_xyyz + L_xyyzz*v28 + &
      L_xyyzzz*v29 + L_xyyzzzz*v30 + L_xyyzzzzz*v6) + v80*(120.0d0* &
      L_xyz + L_xyzz*v37 + L_xyzzz*v38 + L_xyzzzz*v39 + L_xyzzzzz*v40 + &
      L_xyzzzzzz*v8))
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
#undef  L_xxxxxxxx          
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  L_xxxxxxyz          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2P
    
! OPS  2117*ADD + 2267*MUL + 127*NEG + 614*SUB = 5125  (9724 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v430, v431, v432, v433, v434, v435, v436,&
                v437, v438, v439, v44, v440, v441, v442, v443, v444, v445,&
                v446, v447, v448, v449, v45, v450, v451, v452, v453, v454,&
                v455, v456, v457, v458, v459, v46, v460, v461, v462, v463,&
                v464, v465, v466, v467, v468, v469, v47, v470, v471, v472,&
                v473, v474, v475, v476, v477, v478, v479, v48, v480, v481,&
                v482, v483, v484, v485, v486, v487, v488, v489, v49, v490,&
                v491, v492, v493, v494, v495, v496, v497, v498, v499, v5, v50,&
                v500, v501, v502, v503, v504, v505, v506, v507, v508, v509,&
                v51, v510, v511, v512, v513, v514, v515, v516, v517, v518,&
                v519, v52, v520, v521, v522, v523, v524, v525, v526, v527,&
                v528, v529, v53, v530, v531, v532, v533, v534, v535, v536,&
                v537, v538, v539, v54, v540, v541, v542, v543, v544, v545,&
                v546, v547, v548, v549, v55, v550, v551, v552, v553, v554,&
                v555, v556, v557, v558, v559, v56, v560, v561, v562, v563,&
                v564, v565, v566, v567, v568, v569, v57, v570, v571, v572,&
                v573, v574, v575, v576, v577, v578, v579, v58, v580, v581,&
                v582, v583, v584, v585, v586, v587, v588, v589, v59, v590,&
                v591, v592, v593, v594, v595, v596, v597, v598, v599, v6, v60,&
                v600, v601, v602, v603, v604, v605, v606, v607, v608, v609,&
                v61, v610, v611, v612, v613, v614, v615, v616, v617, v618,&
                v619, v62, v620, v621, v622, v623, v624, v625, v626, v627,&
                v628, v629, v63, v630, v631, v632, v633, v634, v635, v636,&
                v637, v638, v639, v64, v640, v641, v642, v643, v644, v645,&
                v646, v647, v648, v649, v65, v650, v651, v652, v653, v654,&
                v655, v656, v657, v658, v659, v66, v660, v661, v662, v663,&
                v664, v665, v666, v667, v668, v669, v67, v670, v671, v672,&
                v673, v674, v675, v676, v677, v678, v679, v68, v680, v681,&
                v682, v683, v684, v685, v686, v687, v688, v689, v69, v690,&
                v691, v692, v693, v694, v695, v696, v697, v698, v699, v7, v70,&
                v700, v701, v702, v703, v704, v705, v706, v707, v708, v709,&
                v71, v710, v711, v712, v713, v714, v715, v716, v717, v718,&
                v719, v72, v720, v721, v722, v723, v724, v725, v726, v727,&
                v728, v729, v73, v730, v731, v732, v733, v734, v735, v736,&
                v737, v738, v739, v74, v740, v741, v742, v743, v744, v745,&
                v746, v747, v748, v749, v75, v750, v751, v752, v753, v754,&
                v755, v756, v757, v758, v759, v76, v760, v761, v762, v763,&
                v764, v765, v766, v767, v768, v769, v77, v770, v771, v772,&
                v773, v774, v775, v776, v777, v778, v779, v78, v780, v781,&
                v782, v783, v784, v785, v786, v787, v788, v789, v79, v790,&
                v791, v792, v793, v794, v795, v796, v797, v798, v799, v8, v80,&
                v800, v801, v802, v803, v804, v805, v806, v807, v808, v809,&
                v81, v810, v811, v812, v813, v814, v815, v816, v817, v818,&
                v819, v82, v820, v821, v822, v823, v824, v825, v826, v827,&
                v828, v829, v83, v830, v831, v832, v833, v834, v835, v836,&
                v837, v838, v839, v84, v840, v841, v842, v843, v844, v845,&
                v846, v847, v848, v849, v85, v850, v851, v852, v853, v854,&
                v855, v856, v857, v858, v859, v86, v860, v861, v862, v863,&
                v864, v865, v866, v867, v868, v869, v87, v870, v871, v872,&
                v873, v874, v875, v876, v877, v878, v879, v88, v880, v881,&
                v882, v883, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97,&
                v98, v99, h, u, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
                M_xxxyyzz, M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz,&
                M_xxyzzzz, M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz,&
                M_xyzzzzz, M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz,&
                M_yyzzzzz, M_yzzzzzz, M_zzzzzzz, S_0, S_x, S_y, S_z, S_xx,&
                S_xy, S_xz, S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy,&
                S_xyz, S_xzz, S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy,&
                S_xxxz, S_xxyy, S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz,&
                S_xzzz, S_yyyy, S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx,&
                S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz,&
                S_xxyzz, S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz,&
                S_yyyyy, S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz,&
                S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxyyy,&
                S_xxxyyz, S_xxyyyy, S_xxyyyz, S_xyyyyy, S_xyyyyz, S_yyyyyy,&
                S_yyyyyz, S_xxxxxxx, S_xxxxxxy, S_xxxxxxz, S_xxxxxyy,&
                S_xxxxxyz, S_xxxxyyy, S_xxxxyyz, S_xxxyyyy, S_xxxyyyz,&
                S_xxyyyyy, S_xxyyyyz, S_xyyyyyy, S_xyyyyyz, S_yyyyyyy,&
                S_yyyyyyz
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
#define Ms_xxxxxxx           Ms(46)
#define M_xxxxxxx            M(46)
#define Ms_xxxxxxy           Ms(47)
#define M_xxxxxxy            M(47)
#define Ms_xxxxxxz           Ms(48)
#define M_xxxxxxz            M(48)
#define M_xxxxxyy            M(49)
#define Ms_xxxxxyy           Ms(49)
#define M_xxxxxyz            M(50)
#define Ms_xxxxxyz           Ms(50)
#define Ms_xxxxyyy           Ms(51)
#define M_xxxxyyy            M(51)
#define Ms_xxxxyyz           Ms(52)
#define M_xxxxyyz            M(52)
#define Ms_xxxyyyy           Ms(53)
#define M_xxxyyyy            M(53)
#define Ms_xxxyyyz           Ms(54)
#define M_xxxyyyz            M(54)
#define Ms_xxyyyyy           Ms(55)
#define M_xxyyyyy            M(55)
#define Ms_xxyyyyz           Ms(56)
#define M_xxyyyyz            M(56)
#define M_xyyyyyy            M(57)
#define Ms_xyyyyyy           Ms(57)
#define M_xyyyyyz            M(58)
#define Ms_xyyyyyz           Ms(58)
#define Ms_yyyyyyy           Ms(59)
#define M_yyyyyyy            M(59)
#define M_yyyyyyz            M(60)
#define Ms_yyyyyyz           Ms(60)
    v4         = x*y
    v5         = x*z
    v6         = y*z
    v7         = v4*z
    v15        = M_xx*x
    v16        = M_xy*y
    v17        = M_xz*z
    v20        = M_xy*x
    v21        = M_yy*y
    v22        = M_yz*z
    v23        = M_xx*z
    v24        = M_xz*x
    v25        = M_yy*z
    v26        = M_yz*y
    v37        = M_xxx*x
    v38        = 1.71428571428571d0*y
    v39        = M_xxy*v38
    v40        = M_xxz*z
    v46        = 0.857142857142857d0*M_xyz
    v49        = M_xxy*x
    v52        = M_xyy*y
    v54        = 3.0d0*M_xx
    v55        = M_xxx*z
    v56        = M_xxz*x
    v58        = M_xyy*z
    v59        = 3.0d0*M_xz
    v65        = 1.71428571428571d0*x
    v66        = M_xyy*v65
    v67        = M_yyy*y
    v68        = M_yyz*z
    v71        = M_xxy*z
    v74        = M_yyy*z
    v75        = M_yyz*y
    v81        = 3.0d0*M_yz
    v87        = M_xxxx*x
    v88        = M_xxxy*y
    v89        = M_xxxz*z
    v91        = M_xxyy*x
    v101       = M_yyyy*x
    v112       = M_xxxx*y
    v113       = M_xxxy*x
    v116       = M_xxyy*y
    v117       = M_xxyz*z
    v128       = M_yyyy*y
    v132       = M_xxyy*z
    v141       = M_xxxx*z
    v142       = M_xxxz*x
    v144       = M_xxyz*y
    v153       = M_yyyy*z
    v161       = M_xyyy*y
    v162       = M_xyyz*z
    v167       = M_xxxy*z
    v169       = M_xxyz*x
    v173       = M_xyyy*z
    v174       = M_xyyz*y
    v175       = 3.0d0*M_xyz
    v181       = M_xyyy*x
    v182       = M_yyyz*z
    v183       = M_xyyz*x
    v184       = M_yyyz*y
    v191       = M_xxyyz*z
    v193       = 0.12987012987013d0*z
    v206       = M_xxxxx*x
    v207       = M_xxxxy*y
    v208       = M_xxxxz*z
    v210       = M_xxxyy*x
    v217       = M_xxyyy*y
    v226       = M_xyyyy*x
    v238       = M_yyyyy*y
    v265       = M_xxxxx*y
    v266       = M_xxxxy*x
    v269       = M_xxxyy*y
    v270       = 1.81818181818182d0*M_xxxyz
    v273       = M_xxyyy*x
    v281       = M_xyyyy*y
    v290       = M_yyyyy*x
    v296       = 10.0d0*M_xxx
    v299       = M_xxxxx*z
    v300       = M_xxxxz*x
    v302       = M_xxxyy*z
    v303       = v270*y
    v310       = M_xxyyz*x
    v320       = M_xyyyy*z
    v324       = 5.45454545454545d0*M_xyz
    v336       = M_yyyyz*x
    v358       = 0.025974025974026d0*z
    v372       = M_xxxxy*z
    v373       = M_xxxxz*y
    v375       = M_xxxyz*x
    v380       = M_xxyyy*z
    v381       = M_xxyyz*y
    v397       = M_yyyyy*z
    v398       = M_yyyyz*y
    v407       = 0.545454545454545d0*z
    v413       = M_xyyyz*y
    v418       = M_yyyyz*z
    v420       = 1.81818181818182d0*M_xyyyz
    v421       = v420*x
    v443       = M_xxxxxx*x
    v444       = M_xxxxxy*y
    v445       = M_xxxxxz*z
    v447       = M_xxxxyy*x
    v454       = M_xxxyyy*y
    v455       = M_xxxyyz*z
    v491       = M_xyyyyy*y
    v492       = M_xyyyyz*z
    v515       = M_yyyyyy*x
    v550       = M_xxxxxx*y
    v551       = M_xxxxxy*x
    v554       = M_xxxxyy*y
    v555       = M_xxxxyz*z
    v561       = M_xxxyyy*x
    v575       = M_xxyyyz*z
    v595       = M_xyyyyy*x
    v616       = M_yyyyyy*y
    v617       = M_yyyyyz*z
    v648       = M_xxxxxx*z
    v649       = M_xxxxxz*x
    v651       = M_xxxxyy*z
    v652       = 0.559440559440559d0*v651
    v653       = M_xxxxyz*y
    v659       = M_xxxyyz*x
    v670       = M_xxyyyy*z
    v671       = M_xxyyyz*y
    v694       = M_xyyyyz*x
    v715       = M_yyyyyy*z
    v749       = M_xxyyyy*x
    v759       = M_xxxyyy*z
    v794       = M_xxxxxy*z
    v795       = M_xxxxxz*y
    v797       = M_xxxxyz*x
    v801       = M_xxxyyz*y
    v808       = M_xxyyyz*x
    v817       = M_xyyyyy*z
    v818       = M_xyyyyz*y
    v830       = M_yyyyyz*x
    v844       = M_xxyyyy*y
    v850       = 0.0163170163170163d0*z
    v857       = 0.559440559440559d0*v670
    v867       = M_yyyyyz*y
    Ms_0       = Ms_0 + (M_0)
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    v93        = M_xxzz*x
    v106       = M_xxzz*y
    v133       = M_xxzz*z
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v102       = M_yyzz*x
    v107       = M_yyzz*y
    v136       = M_yyzz*z
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    v212       = M_xxxzz*x
    v247       = M_xxxzz*y
    v306       = M_xxxzz*z
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    v219       = M_xxyzz*y
    v250       = M_xxyzz*x
    v359       = M_xxyzz*z
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    v315       = M_xxzzz*x
    v361       = M_xxzzz*y
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    v871       = M_xxxzz + M_xyyzz
    v159       = -0.0476190476190476d0*(M_xxxxx + v102 + v871 + v93)
    v227       = M_xyyzz*x
    v256       = M_xyyzz*y
    v323       = M_xyyzz*z
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -v871
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    v872       = M_xxyzz + M_yyyzz
    v108       = -0.0476190476190476d0*(M_yyyyy + v106 + v107 + v872)
    v239       = M_yyyzz*y
    v258       = M_yyyzz*x
    v362       = M_yyyzz*z
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v0         = M_xxzzz + M_yyzzz
    v340       = M_yyzzz*x
    v364       = M_yyzzz*y
    M_yzzzz    = -v872
    M_zzzzz    = -v0
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    v449       = M_xxxxzz*x
    v557       = M_xxxxzz*y
    v656       = M_xxxxzz*z
    v855       = 0.174825174825175d0*v656
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    v457       = M_xxxyzz*y
    v563       = M_xxxyzz*x
    v761       = M_xxxyzz*z
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    v462       = M_xxxzzz*z
    v664       = M_xxxzzz*x
    v763       = M_xxxzzz*y
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    v528       = M_xxyyzz*y
    v674       = M_xxyyzz*z
    v675       = -1.22377622377622d0*v674
    v745       = M_xxyyzz*x
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    v529       = M_xxyzzz*z
    v767       = M_xxyzzz*x
    v866       = M_xxyzzz*y
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    v476       = M_xxzzzz*x
    v531       = M_xxzzzz*y
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    v493       = M_xyyyzz*y
    v596       = M_xyyyzz*x
    v774       = M_xyyyzz*z
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    v873       = M_xxxzzz + M_xyyzzz
    v1         = v873
    v498       = M_xyyzzz*z
    v698       = M_xyyzzz*x
    v776       = M_xyyzzz*y
    v869       = x*(M_xxxxxz + v1)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -v1
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    v517       = M_yyyyzz*x
    v717       = M_yyyyzz*z
    v718       = 0.174825174825175d0*v717
    v865       = M_yyyyzz*y
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v874       = M_xxyzzz + M_yyyzzz
    v2         = v874
    v532       = M_yyyzzz*z
    v740       = y*(M_yyyyyz + v2)
    v784       = M_yyyzzz*x
    v868       = M_yyyzzz*y
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v875       = M_xxzzzz + M_yyzzzz
    v3         = v875
    v524       = M_yyzzzz*x
    v534       = M_yyzzzz*y
    v739       = 0.0815850815850816d0*v3*z
    M_yzzzzz   = -v2
    M_zzzzzz   = -v3
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v747       = 0.034965034965035d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v852       = 0.034965034965035d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v428       = -0.244755244755245d0*M_xxxyyzz
    v748       = -0.104895104895105d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v538       = -0.244755244755245d0*M_xxyyyzz
    v841       = -0.104895104895105d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v634       = -0.244755244755245d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v635       = 0.0116550116550117d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    v876       = M_xxxzzzz + M_xyyzzzz
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -v876
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v539       = 0.034965034965035d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v636       = 0.034965034965035d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v877       = M_xxyzzzz + M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v637       = 0.0116550116550117d0*M_yyzzzzz
    v883       = v634 + v635 + v637 + v675 + v739
    v851       = M_xxzzzz*v850 + M_yyzzzz*v850 + 0.00233100233100233d0*(-21.0d0*M_xxyyzzz &
      + M_xxzzzzz + M_yyzzzzz - 105.0d0*v674)
    M_yzzzzzz  = -v877
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    S_0        = 1
    S_x        = x
    S_y        = y
    S_z        = z
    S_xy       = v4
    v33        = M_xy*S_xy
    v48        = M_xx*S_xy
    v53        = M_yy*S_xy
    v62        = M_yz*S_xy
    v73        = M_xz*S_xy
    v90        = M_xxy*S_xy
    v111       = M_xxx*S_xy
    v121       = M_xyy*S_xy
    v135       = M_xyz*S_xy
    v164       = M_yyy*S_xy
    v170       = M_xxz*S_xy
    v178       = M_yyz*S_xy
    v209       = M_xxxy*S_xy
    v249       = M_xxyy*S_xy
    v251       = M_xxzz*S_xy
    v259       = M_yyzz*S_xy
    v264       = M_xxxx*S_xy
    v289       = M_yyyy*S_xy
    v311       = M_xxyz*S_xy
    v350       = M_xyyy*S_xy
    v376       = M_xxxz*S_xy
    v389       = M_xyyz*S_xy
    v414       = M_yyyz*S_xy
    v446       = M_xxxxy*S_xy
    v467       = M_xxyyy*S_xy
    v470       = M_xxyzz*S_xy
    v514       = M_yyyyy*S_xy
    v518       = M_yyyzz*S_xy
    v549       = M_xxxxx*S_xy
    v560       = M_xxxyy*S_xy
    v565       = M_xxxzz*S_xy
    v594       = M_xyyyy*S_xy
    v598       = M_xyyzz*S_xy
    v660       = M_xxxyz*S_xy
    v765       = M_xxyyz*S_xy
    v769       = M_xxzzz*S_xy
    v786       = M_yyzzz*S_xy
    v798       = M_xxxxz*S_xy
    v831       = M_yyyyz*S_xy
    v859       = M_xyyyz*S_xy
    Ms_xy      = Ms_xy + (M_0*S_xy + M_xy)
    S_xz       = v5
    v41        = M_xz*S_xz
    v61        = M_yy*S_xz
    v72        = M_xy*S_xz
    v92        = M_xxz*S_xz
    v122       = M_xyz*S_xz
    v140       = M_xxx*S_xz
    v147       = M_xyy*S_xz
    v165       = M_yyz*S_xz
    v168       = 3.0d0*S_xz
    v177       = M_yyy*S_xz
    v211       = M_xxxz*S_xz
    v274       = M_xxyz*S_xz
    v298       = M_xxxx*S_xz
    v309       = M_xxyy*S_xz
    v314       = M_xxzz*S_xz
    v335       = M_yyyy*S_xz
    v339       = M_yyzz*S_xz
    v348       = 0.242424242424242d0*v211
    v351       = M_xyyz*S_xz
    v374       = M_xxxy*S_xz
    v388       = M_xyyy*S_xz
    v409       = M_yyyz*S_xz
    v448       = M_xxxxz*S_xz
    v468       = M_xxyyz*S_xz
    v475       = M_xxzzz*S_xz
    v516       = M_yyyyz*S_xz
    v523       = M_yyzzz*S_xz
    v562       = M_xxxyz*S_xz
    v647       = M_xxxxx*S_xz
    v658       = M_xxxyy*S_xz
    v663       = M_xxxzz*S_xz
    v693       = M_xyyyy*S_xz
    v697       = M_xyyzz*S_xz
    v766       = M_xxyzz*S_xz
    v783       = M_yyyzz*S_xz
    v796       = M_xxxxy*S_xz
    v807       = M_xxyyy*S_xz
    v829       = M_yyyyy*S_xz
    v842       = 0.839160839160839d0*v562
    v845       = M_xyyyz*S_xz
    v856       = 0.34965034965035d0*v663
    v860       = 0.34965034965035d0*v697
    Ms_xz      = Ms_xz + (M_0*S_xz + M_xz)
    S_yz       = v6
    v43        = M_yz*S_yz
    v47        = -0.142857142857143d0*(7.0d0*v46*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v57        = M_xy*S_yz
    v70        = M_xx*S_yz
    v80        = 3.0d0*S_yz
    v97        = M_xyz*S_yz
    v118       = M_xxz*S_yz
    v129       = M_yyz*S_yz
    v143       = M_xxy*S_yz
    v152       = M_yyy*S_yz
    v166       = M_xxx*S_yz
    v218       = M_xxyz*S_yz
    v271       = M_xxxz*S_yz
    v282       = M_xyyz*S_yz
    v301       = M_xxxy*S_yz
    v319       = M_xyyy*S_yz
    v354       = M_yyyz*S_yz
    v355       = 0.242424242424242d0*v354
    v360       = M_xxzz*S_yz
    v363       = M_yyzz*S_yz
    v371       = M_xxxx*S_yz
    v379       = M_xxyy*S_yz
    v396       = M_yyyy*S_yz
    v456       = M_xxxyz*S_yz
    v530       = M_xxzzz*S_yz
    v533       = M_yyzzz*S_yz
    v556       = M_xxxxz*S_yz
    v576       = M_xxyyz*S_yz
    v618       = M_yyyyz*S_yz
    v650       = M_xxxxy*S_yz
    v669       = M_xxyyy*S_yz
    v678       = M_xxyzz*S_yz
    v679       = 0.34965034965035d0*v678
    v714       = M_yyyyy*S_yz
    v721       = M_yyyzz*S_yz
    v722       = 0.34965034965035d0*v721
    v750       = M_xyyyz*S_yz
    v751       = 0.839160839160839d0*v750
    v762       = M_xxxzz*S_yz
    v775       = M_xyyzz*S_yz
    v793       = M_xxxxx*S_yz
    v800       = M_xxxyy*S_yz
    v816       = M_xyyyy*S_yz
    Ms_yz      = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz      = v7
    v103       = M_yz*S_xyz
    v123       = M_xz*S_xyz
    v134       = M_xy*S_xyz
    v137       = 0.0476190476190476d0*(18.0d0*v132 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v133 + 48.0d0*v134 + 48.0d0*v135 + 5.0d0*v136))
    v194       = M_xyz*S_xyz
    v275       = M_xxz*S_xyz
    v291       = M_yyz*S_xyz
    v307       = 5.45454545454545d0*S_xyz
    v308       = M_xxy*v307
    v334       = M_yyy*S_xyz
    v370       = M_xxx*S_xyz
    v419       = M_xyy*v307
    v469       = M_xxyz*S_xyz
    v564       = M_xxxz*S_xyz
    v597       = M_xyyz*S_xyz
    v657       = M_xxxy*S_xyz
    v692       = M_xyyy*S_xyz
    v754       = M_yyyz*S_xyz
    v755       = 0.839160839160839d0*v754
    v764       = M_xxyy*S_xyz
    v768       = M_xxzz*S_xyz
    v785       = M_yyzz*S_xyz
    v792       = M_xxxx*S_xyz
    v828       = M_yyyy*S_xyz
    v843       = 0.839160839160839d0*v564
    Ms_xyz     = Ms_xyz + (M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v8         = a2
    a3         = a1*a2
    a4         = a2*a2
    v28        = a4
    a5         = a2*a3
    a6         = a3*a3
    v186       = a6
    a7         = a3*a4
    a8         = a4*a4
    b2         = b1*b1
    v9         = b2
    v64        = v8*v9
    v345       = v28*v9
    b3         = b1*b2
    b4         = b2*b2
    v78        = b4
    v416       = v78*v8
    b5         = b2*b3
    b6         = b3*b3
    v424       = b6
    b7         = b3*b4
    b8         = b4*b4
    c2         = c1*c1
    h          = c2 + v8 + v9
    v10        = 0.333333333333333d0*h
    v11        = -v10
    v12        = v11 + v8
    v13        = v11 + v9
    v14        = -0.6d0*h
    v18        = -0.2d0*h
    v19        = v18 + v8
    v27        = v18 + v9
    v29        = h*h
    v30        = 0.0857142857142857d0*v29
    v31        = h*v8
    v44        = -0.428571428571429d0*h
    v45        = v44 + v8
    v63        = 0.142857142857143d0*h
    v69        = -v63
    v77        = v44 + v9
    v79        = h*v9
    v82        = 0.238095238095238d0*v29
    v104       = 0.0476190476190476d0*v29
    v105       = 0.333333333333333d0*(-2.0d0*v31) + v104 + v28
    v158       = -0.111111111111111d0*v31
    v180       = v64 + 0.111111111111111d0*(-v79)
    v185       = 0.333333333333333d0*(-2.0d0*v79) + v104 + v78
    v187       = h*h*h
    v188       = -0.0216450216450216d0*v187
    v189       = h*v28
    v190       = v29*v8
    v244       = 0.151515151515152d0*v29
    v245       = 0.0909090909090909d0*(-10.0d0*v31) + v244 + v28
    v343       = 0.545454545454545d0*v31
    v344       = -0.00432900432900433d0*(v187 + 231.0d0*v343*v9)
    v346       = 0.0303030303030303d0*v29
    v405       = -0.272727272727273d0*v31
    v406       = -0.272727272727273d0*v79
    v410       = v346 + v64
    v415       = h*v78
    v417       = v29*v9
    v423       = 0.0909090909090909d0*(-10.0d0*v79) + v244 + v78
    v427       = -0.0815850815850816d0*v187
    v526       = -0.0116550116550117d0*v187
    v527       = v186 + v526 + 0.00699300699300699d0*(-165.0d0*v189 + 45.0d0*v190)
    v741       = -0.0769230769230769d0*v189
    v742       = 0.104895104895105d0*v29
    v743       = 0.769230769230769d0*v31
    v744       = -v743*v9
    v879       = v526 + v744
    v838       = -0.461538461538462d0*v31*v9
    v839       = 0.00699300699300699d0*(-v187) + v838
    v840       = 0.020979020979021d0*v417
    v880       = v345 + v840
    v849       = 0.00233100233100233d0*(-v187) + v838
    v863       = 0.020979020979021d0*v190
    v882       = v416 + v863
    v864       = -0.0769230769230769d0*v415
    v870       = 0.00699300699300699d0*(-165.0d0*v415 + 45.0d0*v417) + v424 + v526
    S_xx       = v12
    v34        = M_yy*S_xx
    v36        = M_xx*S_xx
    v50        = M_xy*S_xx
    v76        = M_yz*S_xx
    v85        = M_xxx*S_xx
    v95        = M_xyy*S_xx
    v114       = M_xxy*S_xx
    v126       = M_yyy*S_xx
    v145       = M_xxz*S_xx
    v154       = M_yyz*S_xx
    v204       = M_xxxx*S_xx
    v215       = M_xxyy*S_xx
    v221       = M_xxzz*S_xx
    v236       = M_yyyy*S_xx
    v241       = M_yyzz*S_xx
    v267       = M_xxxy*S_xx
    v279       = M_xyyy*S_xx
    v304       = M_xxxz*S_xx
    v321       = M_xyyz*S_xx
    v382       = M_xxyz*S_xx
    v399       = M_yyyz*S_xx
    v441       = M_xxxxx*S_xx
    v452       = M_xxxyy*S_xx
    v460       = M_xxxzz*S_xx
    v489       = M_xyyyy*S_xx
    v496       = M_xyyzz*S_xx
    v552       = M_xxxxy*S_xx
    v573       = M_xxyyy*S_xx
    v579       = M_xxyzz*S_xx
    v614       = M_yyyyy*S_xx
    v621       = M_yyyzz*S_xx
    v654       = M_xxxxz*S_xx
    v672       = M_xxyyz*S_xx
    v687       = M_xxzzz*S_xx
    v716       = M_yyyyz*S_xx
    v730       = M_yyzzz*S_xx
    v773       = M_xyyyz*S_xx
    v802       = M_xxxyz*S_xx
    v854       = -0.20979020979021d0*v654
    Ms_xx      = Ms_xx + (M_0*S_xx + M_xx)
    S_yy       = v13
    v32        = M_xx*S_yy
    v35        = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v33 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v32 + 4.0d0*v34))
    v42        = M_yy*S_yy
    v51        = M_xy*S_yy
    v60        = M_xz*S_yy
    v86        = M_xxx*S_yy
    v96        = M_xyy*S_yy
    v115       = M_xxy*S_yy
    v127       = M_yyy*S_yy
    v146       = M_xxz*S_yy
    v155       = M_yyz*S_yy
    v205       = M_xxxx*S_yy
    v216       = M_xxyy*S_yy
    v222       = M_xxzz*S_yy
    v237       = M_yyyy*S_yy
    v242       = M_yyzz*S_yy
    v268       = M_xxxy*S_yy
    v280       = M_xyyy*S_yy
    v305       = M_xxxz*S_yy
    v322       = M_xyyz*S_yy
    v383       = M_xxyz*S_yy
    v400       = M_yyyz*S_yy
    v442       = M_xxxxx*S_yy
    v453       = M_xxxyy*S_yy
    v461       = M_xxxzz*S_yy
    v490       = M_xyyyy*S_yy
    v497       = M_xyyzz*S_yy
    v553       = M_xxxxy*S_yy
    v574       = M_xxyyy*S_yy
    v580       = M_xxyzz*S_yy
    v615       = M_yyyyy*S_yy
    v622       = M_yyyzz*S_yy
    v632       = M_yyyyz*S_yy
    v633       = -0.20979020979021d0*v632
    v655       = M_xxxxz*S_yy
    v673       = M_xxyyz*S_yy
    v688       = M_xxzzz*S_yy
    v731       = M_yyzzz*S_yy
    v760       = M_xxxyz*S_yy
    v819       = M_xyyyz*S_yy
    Ms_yy      = Ms_yy + (M_0*S_yy + M_yy)
    S_zz       = -(S_xx + S_yy)
    S_xxx      = x*(v14 + v8)
    v83        = M_xx*S_xxx
    v99        = M_yy*S_xxx
    v119       = M_xy*S_xxx
    v148       = M_xz*S_xxx
    v179       = M_yz*S_xxx
    v202       = M_xxx*S_xxx
    v224       = M_xyy*S_xxx
    v257       = M_yyy*S_xxx
    v272       = M_xxy*S_xxx
    v312       = 10.0d0*S_xxx
    v337       = M_yyz*S_xxx
    v390       = M_xyz*S_xxx
    v439       = M_xxxx*S_xxx
    v465       = M_xxyy*S_xxx
    v473       = M_xxzz*S_xxx
    v512       = M_yyyy*S_xxx
    v521       = M_yyzz*S_xxx
    v558       = M_xxxy*S_xxx
    v592       = M_xyyy*S_xxx
    v661       = M_xxxz*S_xxx
    v695       = M_xyyz*S_xxx
    v832       = M_yyyz*S_xxx
    Ms_xxx     = Ms_xxx + (0.2d0*(9.0d0*v15 + 3.0d0*(-2.0d0*v16 - 2.0d0*v17)) + M_0*S_xxx + M_xxx)
    S_xxy      = v19*y
    v94        = M_xy*S_xxy
    v109       = M_xx*S_xxy
    v124       = M_yy*S_xxy
    v156       = M_yz*S_xxy
    v213       = M_xxy*S_xxy
    v234       = M_yyy*S_xxy
    v255       = M_xyy*S_xxy
    v263       = M_xxx*S_xxy
    v325       = S_xxy*v324
    v384       = M_xxz*S_xxy
    v401       = M_yyz*S_xxy
    v450       = M_xxxy*S_xxy
    v487       = M_xyyy*S_xxy
    v547       = M_xxxx*S_xxy
    v571       = M_xxyy*S_xxy
    v583       = M_xxzz*S_xxy
    v612       = M_yyyy*S_xxy
    v625       = M_yyzz*S_xxy
    v676       = M_xxyz*S_xxy
    v719       = M_yyyz*S_xxy
    v803       = M_xxxz*S_xxy
    v820       = M_xyyz*S_xxy
    Ms_xxy     = Ms_xxy + (0.2d0*(8.0d0*v20 + 2.0d0*(-v21 - v22)) + M_0*S_xxy + M_xx*y + M_xxy)
    S_xxz      = v19*z
    v98        = M_xz*S_xxz
    v130       = M_yz*S_xxz
    v138       = M_xx*S_xxz
    v150       = M_yy*S_xxz
    v171       = M_xy*S_xxz
    v195       = M_yyz*S_xxz
    v220       = M_xxz*S_xxz
    v283       = M_xyz*S_xxz
    v317       = M_xyy*S_xxz
    v377       = M_xxy*S_xxz
    v395       = M_yyy*S_xxz
    v458       = M_xxxz*S_xxz
    v494       = M_xyyz*S_xxz
    v577       = M_xxyz*S_xxz
    v619       = M_yyyz*S_xxz
    v645       = M_xxxx*S_xxz
    v667       = M_xxyy*S_xxz
    v685       = M_xxzz*S_xxz
    v712       = M_yyyy*S_xxz
    v728       = M_yyzz*S_xxz
    v815       = M_xyyy*S_xxz
    Ms_xxz     = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v23 + 8.0d0*v24 + 2.0d0*(v25 - v26)))
    S_xyy      = v27*x
    v84        = M_xx*S_xyy
    v100       = M_yy*S_xyy
    v120       = M_xy*S_xyy
    v149       = M_xz*S_xyy
    v203       = M_xxx*S_xyy
    v225       = M_xyy*S_xyy
    v248       = M_xxy*S_xyy
    v288       = M_yyy*S_xyy
    v313       = M_xxz*S_xyy
    v338       = M_yyz*S_xyy
    v422       = S_xyy*v324
    v440       = M_xxxx*S_xyy
    v466       = M_xxyy*S_xyy
    v474       = M_xxzz*S_xyy
    v513       = M_yyyy*S_xyy
    v522       = M_yyzz*S_xyy
    v559       = M_xxxy*S_xyy
    v593       = M_xyyy*S_xyy
    v662       = M_xxxz*S_xyy
    v696       = M_xyyz*S_xyy
    v809       = M_xxyz*S_xyy
    v833       = M_yyyz*S_xyy
    Ms_xyy     = Ms_xyy + (0.2d0*(8.0d0*v16 + 2.0d0*(-v15 - v17)) + M_0*S_xyy + M_xyy + M_yy*x)
    S_xzz      = -(S_xxx + S_xyy)
    S_yyy      = y*(v14 + v9)
    v110       = M_xx*S_yyy
    v125       = M_yy*S_yyy
    v157       = M_yz*S_yyy
    v160       = M_xy*S_yyy
    v176       = M_xz*S_yyy
    v214       = M_xxy*S_yyy
    v235       = M_yyy*S_yyy
    v246       = M_xxx*S_yyy
    v278       = M_xyy*S_yyy
    v326       = M_xyz*S_yyy
    v385       = M_xxz*S_yyy
    v426       = 10.0d0*S_yyy
    v451       = M_xxxy*S_yyy
    v488       = M_xyyy*S_yyy
    v548       = M_xxxx*S_yyy
    v572       = M_xxyy*S_yyy
    v584       = M_xxzz*S_yyy
    v613       = M_yyyy*S_yyy
    v626       = M_yyzz*S_yyy
    v677       = M_xxyz*S_yyy
    v720       = M_yyyz*S_yyy
    v804       = M_xxxz*S_yyy
    Ms_yyy     = Ms_yyy + (0.2d0*(9.0d0*v21 + 3.0d0*(-2.0d0*v20 - 2.0d0*v22)) + M_0*S_yyy + M_yyy)
    S_yyz      = v27*z
    v131       = M_yz*S_yyz
    v139       = M_xx*S_yyz
    v151       = M_yy*S_yyz
    v163       = M_xz*S_yyz
    v172       = M_xy*S_yyz
    v192       = M_xxz*S_yyz
    v196       = M_xxzzz*v193 + M_yyzzz*v193 + 0.00432900432900433d0*(-75.0d0*M_xxyyzz + &
      60.0d0*v191 + 1440.0d0*v194 + 5.0d0*(M_xxzzzz + M_yyzzzz - 8.0d0* &
      v192 - 8.0d0*v195))
    v240       = M_yyz*S_yyz
    v284       = M_xyz*S_yyz
    v297       = M_xxx*S_yyz
    v318       = M_xyy*S_yyz
    v347       = 0.00432900432900433d0*(-15.0d0*M_xxyyzz - 240.0d0*v191 - 720.0d0*v194 + &
      v875 - 260.0d0*(v192 + v195))
    v378       = M_xxy*S_yyz
    v425       = 10.0d0*S_yyz
    v459       = M_xxxz*S_yyz
    v495       = M_xyyz*S_yyz
    v578       = M_xxyz*S_yyz
    v620       = M_yyyz*S_yyz
    v646       = M_xxxx*S_yyz
    v668       = M_xxyy*S_yyz
    v686       = M_xxzz*S_yyz
    v713       = M_yyyy*S_yyz
    v729       = M_yyzz*S_yyz
    v799       = M_xxxy*S_yyz
    Ms_yyz     = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v25 + 8.0d0*v26 + 2.0d0*(v23 - v24)))
    S_yzz      = -(S_xxy + S_yyy)
    S_zzz      = -(S_xxz + S_yyz)
    S_xxxx     = 0.142857142857143d0*(-6.0d0*v31) + v28 + v30
    v197       = M_xx*S_xxxx
    v229       = M_yy*S_xxxx
    v276       = M_xy*S_xxxx
    v327       = M_xz*S_xxxx
    v402       = M_yz*S_xxxx
    v434       = M_xxx*S_xxxx
    v482       = M_xyy*S_xxxx
    v566       = M_xxy*S_xxxx
    v607       = M_yyy*S_xxxx
    v680       = M_xxz*S_xxxx
    v723       = M_yyz*S_xxxx
    v821       = M_xyz*S_xxxx
    Ms_xxxx    = Ms_xxxx + (M_0*S_xxxx + v35 - v39 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v36 + 80.0d0*v37 - 60.0d0*v40 - 96.0d0*v41 + &
      24.0d0*(v42 + v43)))
    S_xxxy     = v4*v45
    v223       = M_xy*S_xxxy
    v261       = M_xx*S_xxxy
    v286       = M_yy*S_xxxy
    v341       = M_yz*S_xxxy
    v391       = M_xz*S_xxxy
    v463       = M_xxy*S_xxxy
    v510       = M_yyy*S_xxxy
    v545       = M_xxx*S_xxxy
    v590       = M_xyy*S_xxxy
    v699       = M_xyz*S_xxxy
    v834       = M_yyz*S_xxxy
    Ms_xxxy    = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + v47 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v48 + 5.0d0*v49 + 5.0d0*v50 - 2.0d0*v51 - 2.0d0*v52 - 2.0d0*v53)))
    S_xxxz     = v45*v5
    v228       = M_xz*S_xxxz
    v292       = M_yz*S_xxxz
    v294       = M_xx*S_xxxz
    v332       = M_yy*S_xxxz
    v352       = 0.242424242424242d0*v228
    v386       = M_xy*S_xxxz
    v471       = M_xxz*S_xxxz
    v519       = M_yyz*S_xxxz
    v599       = M_xyz*S_xxxz
    v643       = M_xxx*S_xxxz
    v690       = M_xyy*S_xxxz
    v805       = M_xxy*S_xxxz
    v827       = M_yyy*S_xxxz
    v846       = 0.839160839160839d0*v599
    Ms_xxxz    = Ms_xxxz + (0.142857142857143d0*(13.0d0*v55 + 15.0d0*v56 + 6.0d0*(-v57 + v58 + v60 + &
      v61 - v62)) + M_0*S_xxxz + M_xxxz + S_xx*v59 + S_xz*v54 - v46*y)
    S_xxyy     = 0.0285714285714286d0*v29 - v63*v8 - v63*v9 + v64
    v198       = M_xx*S_xxyy
    v230       = M_yy*S_xxyy
    v252       = M_xy*S_xxyy
    v328       = M_xz*S_xxyy
    v403       = M_yz*S_xxyy
    v435       = M_xxx*S_xxyy
    v483       = M_xyy*S_xxyy
    v567       = M_xxy*S_xxyy
    v608       = M_yyy*S_xxyy
    v681       = M_xxz*S_xxyy
    v724       = M_yyz*S_xxyy
    v777       = M_xyz*S_xxyy
    Ms_xxyy    = Ms_xxyy + (M_0*S_xxyy + v39 + v66 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v33 + 39.0d0*(v32 + v34) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v36 + 10.0d0*v37 + 10.0d0*v40 + 12.0d0*v41 + 12.0d0*v42 + &
      12.0d0*v43 + 10.0d0*v67 + 10.0d0*v68)))
    S_xxyz     = v6*(v69 + v8)
    v243       = M_yz*S_xxyz
    v285       = M_xz*S_xxyz
    v316       = M_xy*S_xxyz
    v368       = M_xx*S_xxyz
    v393       = M_yy*S_xxyz
    v499       = M_xyz*S_xxyz
    v581       = M_xxz*S_xxyz
    v623       = M_yyz*S_xxyz
    v665       = M_xxy*S_xxyz
    v710       = M_yyy*S_xxyz
    v813       = M_xyy*S_xxyz
    Ms_xxyz    = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v72 + v73) + 2.0d0*(v74 - v75) + 9.0d0*(v70 &
      + v71 + v76)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v65)
    S_xxzz     = -(S_xxxx + S_xxyy)
    v199       = M_xx*S_xxzz
    v231       = M_yy*S_xxzz
    v253       = M_xy*S_xxzz
    v329       = M_xz*S_xxzz
    v365       = M_yz*S_xxzz
    v436       = M_xxx*S_xxzz
    v484       = M_xyy*S_xxzz
    v568       = M_xxy*S_xxzz
    v609       = M_yyy*S_xxzz
    v682       = M_xxz*S_xxzz
    v725       = M_yyz*S_xxzz
    v778       = M_xyz*S_xxzz
    S_xyyy     = v4*v77
    v262       = M_xx*S_xyyy
    v287       = M_yy*S_xyyy
    v342       = M_yz*S_xyyy
    v349       = M_xy*S_xyyy
    v392       = M_xz*S_xyyy
    v464       = M_xxy*S_xyyy
    v511       = M_yyy*S_xyyy
    v546       = M_xxx*S_xyyy
    v591       = M_xyy*S_xyyy
    v700       = M_xyz*S_xyyy
    v810       = M_xxz*S_xyyy
    Ms_xyyy    = Ms_xyyy + (M_0*S_xyyy + M_xyyy + M_yyy*x + v47 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v48 - 2.0d0*v49 - 2.0d0*v50 + 5.0d0*v51 + 5.0d0*v52 + 5.0d0*v53 &
      )))
    S_xyyz     = v5*(v69 + v9)
    v293       = M_yz*S_xyyz
    v295       = M_xx*S_xyyz
    v333       = M_yy*S_xyyz
    v353       = M_xz*S_xyyz
    v387       = M_xy*S_xyyz
    v472       = M_xxz*S_xyyz
    v520       = M_yyz*S_xyyz
    v600       = M_xyz*S_xyyz
    v644       = M_xxx*S_xyyz
    v691       = M_xyy*S_xyyz
    v806       = M_xxy*S_xyyz
    Ms_xyyz    = Ms_xyyz + (0.142857142857143d0*(2.0d0*(v55 - v56) + 12.0d0*(v57 + v62) + 9.0d0*(v58 &
      + v60 + v61)) + M_0*S_xyyz + M_xyyz + M_xyz*v38 + M_yyz*x)
    S_xyzz     = -(S_xxxy + S_xyyy)
    S_xzzz     = -(S_xxxz + S_xyyz)
    S_yyyy     = 0.142857142857143d0*(-6.0d0*v79) + v30 + v78
    v200       = M_xx*S_yyyy
    v232       = M_yy*S_yyyy
    v277       = M_xy*S_yyyy
    v330       = M_xz*S_yyyy
    v404       = M_yz*S_yyyy
    v437       = M_xxx*S_yyyy
    v485       = M_xyy*S_yyyy
    v569       = M_xxy*S_yyyy
    v610       = M_yyy*S_yyyy
    v683       = M_xxz*S_yyyy
    v726       = M_yyz*S_yyyy
    v822       = M_xyz*S_yyyy
    Ms_yyyy    = Ms_yyyy + (M_0*S_yyyy + v35 - v66 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v42 - 96.0d0*v43 + 80.0d0*v67 - 60.0d0*v68 + &
      24.0d0*(v36 + v41)))
    S_yyyz     = v6*v77
    v356       = M_yz*S_yyyz
    v357       = 0.242424242424242d0*v356
    v369       = M_xx*S_yyyz
    v394       = M_yy*S_yyyz
    v408       = M_xz*S_yyyz
    v412       = M_xy*S_yyyz
    v582       = M_xxz*S_yyyz
    v624       = M_yyz*S_yyyz
    v666       = M_xxy*S_yyyz
    v711       = M_yyy*S_yyyz
    v752       = M_xyz*S_yyyz
    v753       = 0.839160839160839d0*v752
    v791       = M_xxx*S_yyyz
    v814       = M_xyy*S_yyyz
    Ms_yyyz    = Ms_yyyz + (0.142857142857143d0*(13.0d0*v74 + 15.0d0*v75 + 6.0d0*(v70 + v71 - v72 - &
      v73 + v76)) + M_0*S_yyyz + M_yy*v80 + M_yyyz + S_yy*v81 - v46*x)
    S_yyzz     = -(S_xxyy + S_yyyy)
    v201       = M_xx*S_yyzz
    v233       = M_yy*S_yyzz
    v254       = M_xy*S_yyzz
    v260       = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz + &
      4.0d0*v246 - v247 - 24.0d0*v248 - 30.0d0*v249 - v250 - v251 - &
      30.0d0*v252 - v253 - v254 - 24.0d0*v255 - v256 + 4.0d0*v257 - &
      v258 - v259))
    v331       = M_xz*S_yyzz
    v366       = M_yz*S_yyzz
    v367       = -0.0303030303030303d0*(M_yyyyyz + v361 + v364 + v874 + 5.0d0*(v359 + &
      v360 + v362 + v363 + v365 + v366))
    v411       = -0.0303030303030303d0*(M_xxxxxz + v315 + v340 + v873 + 5.0d0*(v306 + &
      v314 + v323 + v329 + v331 + v339))
    v438       = M_xxx*S_yyzz
    v486       = M_xyy*S_yyzz
    v570       = M_xxy*S_yyzz
    v611       = M_yyy*S_yyzz
    v684       = M_xxz*S_yyzz
    v727       = M_yyz*S_yyzz
    v779       = M_xyz*S_yyzz
    S_yzzz     = -(S_xxyz + S_yyyz)
    S_zzzz     = -(S_xxzz + S_yyzz)
    S_xxxxx    = x*(0.111111111111111d0*(-10.0d0*v31) + v28 + v82)
    v429       = M_xx*S_xxxxx
    v505       = M_yy*S_xxxxx
    v585       = M_xy*S_xxxxx
    v701       = M_xz*S_xxxxx
    v835       = M_yz*S_xxxxx
    Ms_xxxxx   = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v87 &
      - 30.0d0*(M_xxxyy + v91) + 330.0d0*(v83 + v85) - 140.0d0*(v88 + &
      v89) + 120.0d0*(v100 + v103 + v96 + v97) + 60.0d0*(v84 + v86 + &
      v95 + v99) - 300.0d0*(v90 + v92 + v94 + v98) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v101 + v102 + v93)))
    S_xxxxy    = v105*y
    v477       = M_xy*S_xxxxy
    v540       = M_xx*S_xxxxy
    v602       = M_yy*S_xxxxy
    v732       = M_yz*S_xxxxy
    v823       = M_xz*S_xxxxy
    Ms_xxxxy   = Ms_xxxxy + (M_0*S_xxxxy + v108 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v112) + &
      78.0d0*(v109 + v114) + 4.0d0*(v110 + v126) + 56.0d0*(v111 + v113 &
      + v119) + 8.0d0*(v125 + v127 + v129 + v131) - (2.0d0*M_xxyyy + &
      24.0d0*v115 + 30.0d0*v116 + 28.0d0*v117 + 28.0d0*v118 + 48.0d0* &
      v120 + 48.0d0*v121 + 48.0d0*v122 + 48.0d0*v123 + 24.0d0*v124 + &
      v128 + 28.0d0*v130)))
    S_xxxxz    = v105*z
    v500       = M_xz*S_xxxxz
    v627       = M_yz*S_xxxxz
    v638       = M_xx*S_xxxxz
    v706       = M_yy*S_xxxxz
    v811       = M_xy*S_xxxxz
    v853       = -0.20979020979021d0*v638
    v881       = v853 + v854
    Ms_xxxxz   = Ms_xxxxz + (M_0*S_xxxxz + v137 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v141 &
      + 56.0d0*v142 + 106.0d0*(v138 + v145) + 4.0d0*(v139 + v154) + &
      104.0d0*(v140 + v148) + 32.0d0*(v146 + v150) + 48.0d0*(v147 + &
      v149) + 8.0d0*(v151 + v155) - (M_yyyyz + 36.0d0*v143 + 28.0d0* &
      v144 + 8.0d0*v152 + 5.0d0*v153 + 36.0d0*v156 + 8.0d0*v157)))
    S_xxxyy    = x*(-v10*v9 + v104 + v158 + v64)
    v430       = M_xx*S_xxxyy
    v506       = M_yy*S_xxxyy
    v586       = M_xy*S_xxxyy
    v702       = M_xz*S_xxxyy
    v836       = M_yz*S_xxxyy
    Ms_xxxyy   = Ms_xxxyy + (M_0*S_xxxyy + v159 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v87 + &
      112.0d0*v88 - 14.0d0*v89 + 141.0d0*v91 - 3.0d0*(M_xyyyy + v101) + &
      159.0d0*(v84 + v95) + 75.0d0*(v86 + v99) + 276.0d0*(v90 + v94) - &
      60.0d0*(v100 + v103 + v96 + v97) - 18.0d0*(v83 + v85 + v92 + v98 &
      ) - 42.0d0*(v160 + v161 + v162 + v163 + v164 + v165)))
    S_xxxyz    = v12*v7
    v525       = M_yz*S_xxxyz
    v601       = M_xz*S_xxxyz
    v689       = M_xy*S_xxxyz
    v782       = M_yy*S_xxxyz
    v790       = M_xx*S_xxxyz
    v847       = 0.839160839160839d0*v601
    Ms_xxxyz   = Ms_xxxyz + (0.333333333333333d0*(5.0d0*(v166 + v167 + v179) + 7.0d0*(v169 + v170 + &
      v171) + 2.0d0*(-v172 + v173 - v174 + v176 + v177 - v178)) + M_0* &
      S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy*v168 + S_xx*v175 + S_xxy*v59 &
      + S_xyz*v54)
    S_xxxzz    = -(S_xxxxx + S_xxxyy)
    v431       = M_xx*S_xxxzz
    v507       = M_yy*S_xxxzz
    v587       = M_xy*S_xxxzz
    v703       = M_xz*S_xxxzz
    v787       = M_yz*S_xxxzz
    v861       = 0.34965034965035d0*v703
    S_xxyyy    = y*(-v10*v8 + v104 + v180)
    v478       = M_xy*S_xxyyy
    v541       = M_xx*S_xxyyy
    v603       = M_yy*S_xxyyy
    v733       = M_yz*S_xxyyy
    v824       = M_xz*S_xxyyy
    Ms_xxyyy   = Ms_xxyyy + (M_0*S_xxyyy + v108 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v116 &
      - 17.0d0*v128 + 112.0d0*v181 - 14.0d0*v182 - 3.0d0*(M_xxxxy + &
      v112) + 75.0d0*(v110 + v126) + 159.0d0*(v115 + v124) + 276.0d0*( &
      v120 + v121) - 60.0d0*(v109 + v114 + v122 + v123) - 18.0d0*(v125 &
      + v127 + v129 + v131) - 42.0d0*(v111 + v113 + v117 + v118 + v119 &
      + v130)))
    S_xxyyz    = z*(0.0158730158730159d0*v29 + v158 + v180)
    v501       = M_xz*S_xxyyz
    v628       = M_yz*S_xxyyz
    v639       = M_xx*S_xxyyz
    v707       = M_yy*S_xxyyz
    v770       = M_xy*S_xxyyz
    Ms_xxyyz   = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v134 + v135) + 9.0d0*(v141 + v153) + 112.0d0*(v144 + v183) + &
      6.0d0*(v140 + v148 + v152 + v157) + 132.0d0*(v143 + v147 + v149 + &
      v156) + 81.0d0*(v132 + v139 + v146 + v150 + v154) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v133 + 5.0d0*v136 + 6.0d0* &
      v138 + 14.0d0*v142 + 6.0d0*v145 + 6.0d0*v151 + 6.0d0*v155 + &
      14.0d0*v184)))
    S_xxyzz    = -(S_xxxxy + S_xxyyy)
    v479       = M_xy*S_xxyzz
    v542       = M_xx*S_xxyzz
    v604       = M_yy*S_xxyzz
    v734       = M_yz*S_xxyzz
    v735       = 0.34965034965035d0*v734
    v780       = M_xz*S_xxyzz
    S_xxzzz    = -(S_xxxxz + S_xxyyz)
    v502       = M_xz*S_xxzzz
    v535       = M_yz*S_xxzzz
    v640       = M_xx*S_xxzzz
    v708       = M_yy*S_xxzzz
    v771       = M_xy*S_xxzzz
    S_xyyyy    = v185*x
    v432       = M_xx*S_xyyyy
    v508       = M_yy*S_xyyyy
    v588       = M_xy*S_xyyyy
    v704       = M_xz*S_xyyyy
    v837       = M_yz*S_xyyyy
    Ms_xyyyy   = Ms_xyyyy + (M_0*S_xyyyy + v159 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v101) + &
      78.0d0*(v100 + v96) + 4.0d0*(v86 + v99) + 56.0d0*(v160 + v161 + &
      v164) + 8.0d0*(v83 + v85 + v92 + v98) - (2.0d0*M_xxxyy + 48.0d0* &
      v103 + 28.0d0*v162 + 28.0d0*v163 + 28.0d0*v165 + 24.0d0*v84 + v87 &
      + 48.0d0*v90 + 30.0d0*v91 + 48.0d0*v94 + 24.0d0*v95 + 48.0d0*v97 &
      )))
    S_xyyyz    = v13*v7
    v756       = M_yz*S_xyyyz
    v757       = 0.839160839160839d0*v756
    v758       = M_xx*S_xyyyz
    v826       = M_yy*S_xyyyz
    v848       = M_xz*S_xyyyz
    v858       = M_xy*S_xyyyz
    Ms_xyyyz   = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v172 + v174 + v178) + &
      5.0d0*(v173 + v176 + v177) + 2.0d0*(v166 + v167 - v169 - v170 - &
      v171 + v179)) + M_0*S_xyyyz + M_xyy*v80 + M_xyyyz + M_yyyz*x + &
      S_xyy*v81 + S_yy*v175)
    S_xyyzz    = -(S_xxxyy + S_xyyyy)
    v433       = M_xx*S_xyyzz
    v509       = M_yy*S_xyyzz
    v589       = M_xy*S_xyyzz
    v705       = M_xz*S_xyyzz
    v788       = M_yz*S_xyyzz
    v862       = 0.34965034965035d0*v705
    S_xyzzz    = -(S_xxxyz + S_xyyyz)
    S_xzzzz    = -(S_xxxzz + S_xyyzz)
    S_yyyyy    = y*(0.111111111111111d0*(-10.0d0*v79) + v78 + v82)
    v480       = M_xy*S_yyyyy
    v543       = M_xx*S_yyyyy
    v605       = M_yy*S_yyyyy
    v736       = M_yz*S_yyyyy
    v825       = M_xz*S_yyyyy
    Ms_yyyyy   = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v128 &
      - 30.0d0*(M_xxyyy + v116) + 330.0d0*(v125 + v127) - 140.0d0*(v181 &
      + v182) + 120.0d0*(v109 + v114 + v122 + v123) + 60.0d0*(v110 + &
      v115 + v124 + v126) - 300.0d0*(v120 + v121 + v129 + v131) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v106 + v107 + v112)))
    S_yyyyz    = v185*z
    v503       = M_xz*S_yyyyz
    v629       = M_yz*S_yyyyz
    v630       = M_yy*S_yyyyz
    v631       = -0.20979020979021d0*v630
    v878       = v631 + v633
    v641       = M_xx*S_yyyyz
    v812       = M_xy*S_yyyyz
    Ms_yyyyz   = Ms_yyyyz + (M_0*S_yyyyz + v137 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v153 &
      + 56.0d0*v184 + 8.0d0*(v138 + v145) + 32.0d0*(v139 + v154) + &
      48.0d0*(v143 + v156) + 4.0d0*(v146 + v150) + 106.0d0*(v151 + v155 &
      ) + 104.0d0*(v152 + v157) - (M_xxxxz + 8.0d0*v140 + 5.0d0*v141 + &
      36.0d0*v147 + 8.0d0*v148 + 36.0d0*v149 + 28.0d0*v183)))
    S_yyyzz    = -(S_xxyyy + S_yyyyy)
    v481       = M_xy*S_yyyzz
    v544       = M_xx*S_yyyzz
    v606       = M_yy*S_yyyzz
    v737       = M_yz*S_yyyzz
    v738       = 0.34965034965035d0*v737
    v781       = M_xz*S_yyyzz
    S_yyzzz    = -(S_xxyyz + S_yyyyz)
    v504       = M_xz*S_yyzzz
    v536       = M_yz*S_yyzzz
    v537       = 0.00233100233100233d0*(-75.0d0*v528 + 5.0d0*(6.0d0*v529 + 6.0d0*v530 + &
      v531 + 6.0d0*v532 + 6.0d0*v533 + v534 + 6.0d0*v535 + 6.0d0*v536 + &
      v877))
    v642       = M_xx*S_yyzzz
    v709       = M_yy*S_yyzzz
    v746       = 0.00233100233100233d0*(-75.0d0*v745 + 5.0d0*(6.0d0*v462 + 6.0d0*v475 + &
      v476 + 6.0d0*v498 + 6.0d0*v502 + 6.0d0*v504 + 6.0d0*v523 + v524 + &
      v876))
    v772       = M_xy*S_yyzzz
    v789       = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 70.0d0*v759 + 5.0d0*(-3.0d0* &
      M_xxxyzzz - 3.0d0*M_xyyyzzz + 12.0d0*v758 + 12.0d0*v760 - 15.0d0* &
      v761 - 15.0d0*v762 - 3.0d0*v763 - 54.0d0*v764 - 114.0d0*v765 - &
      15.0d0*v766 - 3.0d0*v767 - 15.0d0*v768 - 3.0d0*v769 - 114.0d0* &
      v770 - 3.0d0*v771 - 3.0d0*v772 + 12.0d0*v773 - 15.0d0*v774 - &
      15.0d0*v775 - 3.0d0*v776 - 54.0d0*v777 - 15.0d0*v778 - 15.0d0* &
      v779 - 15.0d0*v780 - 15.0d0*v781 + 12.0d0*v782 - 15.0d0*v783 - &
      3.0d0*v784 - 15.0d0*v785 - 3.0d0*v786 - 15.0d0*v787 - 15.0d0*v788 &
      ))
    S_yzzzz    = -(S_xxyzz + S_yyyzz)
    S_zzzzz    = -(S_xxzzz + S_yyzzz)
    S_xxxxxx   = v186 + v188 + 0.0909090909090909d0*(-15.0d0*v189 + 5.0d0*v190)
    Ms_xxxxxx  = Ms_xxxxxx + (M_0*S_xxxxxx + M_yyyyz*v193 + v196 + 0.00432900432900433d0*(136.0d0* &
      M_xxxxxx - 75.0d0*M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + &
      2360.0d0*v202 + 576.0d0*v206 - 2340.0d0*v213 - 2260.0d0*v220 + &
      1440.0d0*v225 + 1620.0d0*(v197 + v204) - 600.0d0*(v207 + v208) - &
      120.0d0*(v214 + v234) + 840.0d0*(v218 + v243) - 160.0d0*(v235 + &
      v240) + 90.0d0*(-M_xxxxzz + v198 + v215) + 360.0d0*(v205 - v210 + &
      v229) + 30.0d0*(v219 + v238 + v239) - 180.0d0*(M_xxxxyy + v212 + &
      v226 + v227) + 720.0d0*(v203 + v216 + v224 + v230) - 1680.0d0*( &
      v209 + v211 + v223 + v228) - 165.0d0*(v199 + v200 + v201 + v221 + &
      v236 + v241) + 60.0d0*(v217 - v222 - v231 - v232 - v233 - v237 - &
      v242)))
    S_xxxxxy   = v245*v4
    Ms_xxxxxy  = Ms_xxxxxy + (M_0*S_xxxxxy + v260 - v270*z + 0.0303030303030303d0*(-70.0d0*v269 - &
      10.0d0*v273 + 28.0d0*(M_xxxxxy + v265) + 20.0d0*(v262 + v279) - &
      60.0d0*(v271 + v292) + 100.0d0*(v264 + v266 + v276) + 190.0d0*( &
      v261 + v263 + v267 + v272) - 140.0d0*(v274 + v275 + v283 + v285) &
      - 5.0d0*(M_xyyyyy + v277 + v281 + v289 + v290) + 40.0d0*(-v268 + &
      v278 + v280 + v282 + v284 - v286 + v287 + v288 + v291 + v293)))
    S_xxxxxz   = v245*v5
    Ms_xxxxxz  = Ms_xxxxxz + (M_0*S_xxxxxz + M_xxz*v312 + S_xxz*v296 - v303 - v308 - v325 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 68.0d0*v299 + 250.0d0*( &
      v294 + v304) + 220.0d0*(v298 + v327) + 80.0d0*(v305 + v332) + &
      90.0d0*(v309 + v328) - 140.0d0*(v311 + v316) + 160.0d0*(v313 + &
      v317) + 10890.0d0*(-M_xxxyyz + v302 - v310) + 100.0d0*(v300 - &
      v301 - v341) + 20.0d0*(v295 + v297 + v321 + v337) - 5.0d0*( &
      M_xxxzzz + M_xyyyyz + M_xyyzzz + v315 + v336 + v340) + 40.0d0*( &
      v318 - v319 + v322 - v326 + v333 - v334 + v338 - v342) - 25.0d0*( &
      v306 + v314 + v320 + v323 + v329 + v330 + v331 + v335 + v339)))
    S_xxxxyy   = 0.0303030303030303d0*(-3.0d0*v189 + 2.0d0*v190) + v344 + v345 + v346*v9
    Ms_xxxxyy  = Ms_xxxxyy + (M_0*S_xxxxyy + v347 - v348 - v352 + v355 + v357 + v358*(M_yyyyz + v0) + &
      0.00432900432900433d0*(-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - &
      11.0d0*M_xxxxzz - 5.0d0*M_yyyyyy - 4.0d0*M_yyyyzz - 64.0d0*v206 + &
      412.0d0*v207 - 36.0d0*v208 + 628.0d0*v210 + 1800.0d0*v213 - &
      720.0d0*v225 - 82.0d0*(v197 + v204) + 942.0d0*(v198 + v215) + &
      2.0d0*(v200 + v236) - 60.0d0*(v202 + v220) + 760.0d0*(v203 + v224 &
      ) + 1288.0d0*(v209 + v223) - 220.0d0*(v214 + v234) - 402.0d0*( &
      v216 + v230) - 392.0d0*(v218 + v243) + 37.0d0*(v232 + v237) + &
      80.0d0*(v235 + v240) + 268.0d0*(v205 - v217 + v229) - 8.0d0*(v219 &
      + v238 + v239) - 22.0d0*(M_xxyyyy + v212 + v226 + v227) - 26.0d0* &
      (v199 + v201 + v221 + v241) - 19.0d0*(v222 + v231 + v233 + v242) &
      - 448.0d0*(v349 + v350 + v351 + v353)))
    S_xxxxyz   = v6*(-v343 + v28 + v346)
    Ms_xxxxyz  = Ms_xxxxyz + (M_0*S_xxxxyz + v367 + 0.0303030303030303d0*(26.0d0*v380 + 32.0d0*( &
      M_xxxxyz + v373) + 40.0d0*(v385 + v395) + 8.0d0*(v394 + v400) + &
      96.0d0*(v375 + v376 + v386) + 170.0d0*(v368 + v377 + v382 + v384 &
      ) + 4.0d0*(v369 + v383 + v393 + v399) + 160.0d0*(v370 + v374 + &
      v390 + v391) + 64.0d0*(v371 + v372 + v388 + v392 + v402) - (2.0d0 &
      *M_xxyyyz + 40.0d0*v378 + 18.0d0*v379 + 38.0d0*v381 + 64.0d0*v387 &
      + 64.0d0*v389 + 13.0d0*v396 + 5.0d0*v397 + v398 + 40.0d0*v401 + &
      18.0d0*v403 + 13.0d0*v404)))
    S_xxxyyy   = v4*(0.0909090909090909d0*v29 + v405 + v406 + v64)
    Ms_xxxyyy  = Ms_xxxyyy + (0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v246 + v257) + 75.0d0*(v248 + v255) + 69.0d0*(v249 + v252) + &
      25.0d0*(v269 + v273) + 31.0d0*(v262 + v268 + v279 + v286) - ( &
      M_xxxxxy + 11.0d0*M_xxxyz*v407 + M_xxxyzz + M_xyyyyy + 11.0d0* &
      M_xyyyz*v407 + M_xyyyzz + v247 + v250 + v251 + v253 + v254 + v256 &
      + v258 + v259 + 10.0d0*v261 + 10.0d0*v263 + 7.0d0*v264 + v265 + &
      7.0d0*v266 + 10.0d0*v267 + 6.0d0*v271 + 10.0d0*v272 + 10.0d0*v274 &
      + 10.0d0*v275 + 7.0d0*v276 + 7.0d0*v277 + 10.0d0*v278 + 10.0d0* &
      v280 + 7.0d0*v281 + 10.0d0*v282 + 10.0d0*v283 + 10.0d0*v284 + &
      10.0d0*v285 + 10.0d0*v287 + 10.0d0*v288 + 7.0d0*v289 + v290 + &
      10.0d0*v291 + 6.0d0*v292 + 10.0d0*v293 + 6.0d0*v408 + 6.0d0*v409 &
      )))
    S_xxxyyz   = v5*(0.0909090909090909d0*(-v31) + v406 + v410)
    Ms_xxxyyz  = Ms_xxxyyz + (M_0*S_xxxyyz + M_xxyy*v168 + S_xxyy*v59 + v303 + v308 + v325 + v411 + &
      0.0303030303030303d0*(31.0d0*M_xxxyyz + v299 + 47.0d0*v302 + &
      79.0d0*v310 + 103.0d0*(v295 + v321) + 55.0d0*(v297 + v337) + &
      88.0d0*(v301 + v341) + 43.0d0*(v305 + v332) + 152.0d0*(v311 + &
      v316) + 95.0d0*(v313 + v317) + 13.0d0*(v320 + v330 + v335) + &
      10.0d0*(v319 + v326 + v334 + v342) - (M_xyyyyz + 4.0d0*v294 + &
      v298 + 7.0d0*v300 + 4.0d0*v304 + 10.0d0*v318 + 10.0d0*v322 + v327 &
      + 10.0d0*v333 + v336 + 10.0d0*v338 + 18.0d0*v412 + 18.0d0*v413 + &
      18.0d0*v414)))
    S_xxyyyy   = 0.0303030303030303d0*(-3.0d0*v415 + 2.0d0*v417) + v344 + v346*v8 + v416
    Ms_xxyyyy  = Ms_xxyyyy + (M_0*S_xxyyyy + v347 + v348 + v352 - v355 - v357 + v358*(M_xxxxz + v0) + &
      0.00432900432900433d0*(-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0 &
      *M_xxyyyy - 12.0d0*M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v213 + &
      628.0d0*v217 + 1800.0d0*v225 + 412.0d0*v226 - 64.0d0*v238 - &
      36.0d0*v418 + 37.0d0*(v197 + v204) - 402.0d0*(v198 + v215) + &
      80.0d0*(v202 + v220) - 220.0d0*(v203 + v224) + 2.0d0*(v205 + v229 &
      ) + 760.0d0*(v214 + v234) + 942.0d0*(v216 + v230) - 82.0d0*(v232 &
      + v237) - 60.0d0*(v235 + v240) + 1288.0d0*(v349 + v350) - 392.0d0 &
      *(v351 + v353) + 268.0d0*(v200 - v210 + v236) - 8.0d0*(v206 + &
      v212 + v227) - 22.0d0*(M_xxxxyy + v207 + v219 + v239) - 19.0d0*( &
      v199 + v201 + v221 + v241) - 448.0d0*(v209 + v218 + v223 + v243) &
      - 26.0d0*(v222 + v231 + v233 + v242)))
    S_xxyyyz   = v6*(0.0909090909090909d0*(-v79) + v405 + v410)
    Ms_xxyyyz  = Ms_xxyyyz + (M_0*S_xxyyyz + v367 + v419 + v421 + v422 + 0.0303030303030303d0*(31.0d0* &
      M_xxyyyz + 47.0d0*v380 + 79.0d0*v381 + v397 + 43.0d0*(v369 + v399 &
      ) + 95.0d0*(v378 + v401) + 99.0d0*(v379 + v403) + 103.0d0*(v383 + &
      v393) + 55.0d0*(v385 + v395) + 152.0d0*(v387 + v389) + 88.0d0*( &
      v388 + v392) + 13.0d0*(v371 + v372 + v402) + 10.0d0*(v370 + v374 &
      + v390 + v391) - (M_xxxxyz + 10.0d0*v368 + v373 + 18.0d0*v375 + &
      18.0d0*v376 + 10.0d0*v377 + 10.0d0*v382 + 10.0d0*v384 + 18.0d0* &
      v386 + 4.0d0*v394 + v396 + 7.0d0*v398 + 4.0d0*v400 + v404)))
    S_xyyyyy   = v4*v423
    Ms_xyyyyy  = Ms_xyyyyy + (M_0*S_xyyyyy + v260 - v420*z + 0.0303030303030303d0*(-10.0d0*v269 - &
      70.0d0*v273 + 28.0d0*(M_xyyyyy + v290) + 20.0d0*(v268 + v286) - &
      60.0d0*(v408 + v409) + 100.0d0*(v277 + v281 + v289) + 190.0d0*( &
      v278 + v280 + v287 + v288) - 140.0d0*(v282 + v284 + v291 + v293) &
      - 5.0d0*(M_xxxxxy + v264 + v265 + v266 + v276) + 40.0d0*(v261 - &
      v262 + v263 + v267 + v272 + v274 + v275 - v279 + v283 + v285)))
    S_xyyyyz   = v5*(0.0909090909090909d0*(-6.0d0*v79) + v346 + v78)
    Ms_xyyyyz  = Ms_xyyyyz + (M_0*S_xyyyyz + v411 + 0.0303030303030303d0*(26.0d0*v302 + 32.0d0*( &
      M_xyyyyz + v336) + 8.0d0*(v294 + v304) + 40.0d0*(v297 + v337) + &
      96.0d0*(v412 + v413 + v414) + 4.0d0*(v295 + v305 + v321 + v332) + &
      170.0d0*(v318 + v322 + v333 + v338) + 160.0d0*(v319 + v326 + v334 &
      + v342) + 64.0d0*(v301 + v320 + v330 + v335 + v341) - (2.0d0* &
      M_xxxyyz + 13.0d0*v298 + 5.0d0*v299 + v300 + 18.0d0*v309 + 38.0d0 &
      *v310 + 64.0d0*v311 + 40.0d0*v313 + 64.0d0*v316 + 40.0d0*v317 + &
      13.0d0*v327 + 18.0d0*v328)))
    S_yyyyyy   = v188 + v424 + 0.0909090909090909d0*(-15.0d0*v415 + 5.0d0*v417)
    Ms_yyyyyy  = Ms_yyyyyy + (M_0*S_yyyyyy + v196 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v213 - &
      2340.0d0*v225 + 2360.0d0*v235 + 576.0d0*v238 - 2260.0d0*v240 - &
      160.0d0*(v202 + v220) - 120.0d0*(v203 + v224) - 600.0d0*(v226 + &
      v418) + 1620.0d0*(v232 + v237) + 840.0d0*(v351 + v353) + 90.0d0*( &
      -M_yyyyzz + v216 + v230) + 360.0d0*(v200 - v217 + v236) - 180.0d0 &
      *(M_xxyyyy + v207 + v219 + v239) + 720.0d0*(v198 + v214 + v215 + &
      v234) + 30.0d0*(v206 + v208 + v212 + v227) - 1680.0d0*(v349 + &
      v350 + v354 + v356) - 165.0d0*(v205 + v222 + v229 + v231 + v233 + &
      v242) + 60.0d0*(-v197 - v199 - v201 - v204 + v210 - v221 - v241)))
    S_yyyyyz   = v423*v6
    Ms_yyyyyz  = Ms_yyyyyz + (M_0*S_yyyyyz + M_yyy*v425 + M_yyz*v426 - v419 - v421 - v422 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 68.0d0*v397 + 80.0d0*( &
      v369 + v399) + 160.0d0*(v378 + v401) + 90.0d0*(v379 + v403) - &
      140.0d0*(v387 + v389) + 250.0d0*(v394 + v400) + 220.0d0*(v396 + &
      v404) + 10890.0d0*(-M_xxyyyz + v380 - v381) + 100.0d0*(-v388 - &
      v392 + v398) + 20.0d0*(v383 + v385 + v393 + v395) - 5.0d0*( &
      M_xxxxyz + M_xxyzzz + M_yyyzzz + v361 + v364 + v373) + 40.0d0*( &
      v368 - v370 - v374 + v377 + v382 + v384 - v390 - v391) - 25.0d0*( &
      v359 + v360 + v362 + v363 + v365 + v366 + v371 + v372 + v402)))
    S_xxxxxxx  = x*(v186 + v427 + 0.00699300699300699d0*(-231.0d0*v189 + 105.0d0*v190))
    Ms_xxxxxxx = Ms_xxxxxxx + (M_0*S_xxxxxxx + v428 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*v443 - 1260.0d0*v447 - 630.0d0*v449 - 525.0d0*x*(M_xxyyyy &
      + M_xxyyzz) + 70.0d0*(M_xyyyyyy + v515) + 3444.0d0*(v429 + v441) &
      - 1050.0d0*(v430 + v452) + 6860.0d0*(v434 + v439) + 1470.0d0*( &
      v435 + v465) - 1176.0d0*(v444 + v445) - 7980.0d0*(v450 + v463) + &
      1680.0d0*(v453 + v506) - 7420.0d0*(v458 + v471) + 5040.0d0*(v466 &
      + v483) + 5880.0d0*(v469 + v499) + 105.0d0*(-M_xxxyyyy + &
      M_xyyyyzz + v517) + 35.0d0*(M_xxxzzzz + M_xyyzzzz + v476 + v524) &
      + 2520.0d0*(v440 + v456 + v482 + v525) - 4200.0d0*(v446 + v448 + &
      v477 + v500) - 280.0d0*(v459 + v472 + v494 + v519) - 1120.0d0*( &
      v488 + v495 + v511 + v520) - 1155.0d0*(v431 + v432 + v433 + v460 &
      + v489 + v496) - 735.0d0*(v436 + v437 + v438 + v473 + v512 + v521 &
      ) + 840.0d0*(v442 - v451 - v464 - v487 + v505 - v510) + 420.0d0*( &
      -M_xxxxxyy + v454 + v455 - v461 + v467 + v468 - v474 + v478 - &
      v484 - v485 - v486 - v490 - v497 + v501 - v507 - v508 - v509 - &
      v513 - v522) + 210.0d0*(-M_xxxxxzz + v457 + v462 + v470 + v475 + &
      v479 + v480 + v481 + v491 + v492 + v493 + v498 + v502 + v503 + &
      v504 + v514 + v516 + v518 + v523)))
    S_xxxxxxy  = v527*y
    Ms_xxxxxxy = Ms_xxxxxxy + (M_0*S_xxxxxxy + v537 + v538 + v539 + 0.00233100233100233d0*(-105.0d0* &
      M_xxyyyyy + 10.0d0*M_yyyyyyy - 1200.0d0*v554 - 45.0d0*y*(M_xxyyyy &
      - M_yyyyzz) + 304.0d0*(M_xxxxxxy + v550) - 120.0d0*(M_xxxxyzz + &
      v557) + 150.0d0*(v541 + v573) + 4640.0d0*(v545 + v558) - 3870.0d0 &
      *(v567 + v571) - 315.0d0*(v569 + v612) + 840.0d0*(v572 + v608) + &
      1020.0d0*(v574 + v603) + 1140.0d0*(v576 + v628) - 3940.0d0*(v577 &
      + v581) + 1040.0d0*(v578 + v623) - 220.0d0*(v610 + v613) - &
      160.0d0*(v620 + v624) + 1344.0d0*(v549 + v551 + v585) + 40.0d0*( &
      -v582 + v616 - v619) - 2880.0d0*(v562 + v564 + v599 + v601) + &
      960.0d0*(v546 - v555 - v556 + v592 - v627) + 480.0d0*(v548 - v553 &
      - v561 - v602 + v607) + 60.0d0*(v575 - v584 - v609 - v611 - v626 &
      ) + 3360.0d0*(v540 + v547 + v552 - v560 + v566 - v586) + 1920.0d0 &
      *(-v559 - v590 + v591 + v593 + v597 + v600) + 30.0d0*(-v580 - &
      v604 - v605 - v606 - v615 + v617 + v618 - v622 + v629) - 240.0d0* &
      (M_xxxxyyy + v563 + v565 + v587 + v588 + v589 + v594 + v595 + &
      v596 + v598) - 195.0d0*(v542 + v543 + v544 + v568 + v570 + v579 + &
      v583 + v614 + v621 + v625)))
    S_xxxxxxz  = v527*z
    Ms_xxxxxxz = Ms_xxxxxxz + (M_0*S_xxxxxxz + v636 - v652 + v679 + v718 + v722 + v735 + v738 + v878 + &
      v883 + 0.00233100233100233d0*(304.0d0*M_xxxxxxz - 105.0d0* &
      M_xxyyyyz + 10.0d0*M_yyyyyyz + 784.0d0*v648 + 1344.0d0*v649 - &
      600.0d0*v656 - 555.0d0*v670 + 40.0d0*v715 + 30.0d0*v740 + &
      4320.0d0*(v638 + v654) + 7520.0d0*(v643 + v661) + 6720.0d0*(v645 &
      + v680) + 3264.0d0*(v647 + v701) + 1440.0d0*(v655 + v706) - &
      4800.0d0*(v657 + v699) - 2880.0d0*(v660 + v689) + 3840.0d0*(v662 &
      + v690) - 5100.0d0*(v665 + v676) + 2970.0d0*(v667 + v681) + &
      1080.0d0*(v668 + v724) - 780.0d0*(v669 + v733) + 900.0d0*(v673 + &
      v707) - 735.0d0*(v683 + v712) - 160.0d0*(v711 + v720) + 150.0d0*( &
      v714 + v736) - 120.0d0*(M_xxxxzzz + v666 + v719) + 960.0d0*(v644 &
      - v653 + v695) + 60.0d0*(v671 + v713 + v726) - 240.0d0*(M_xxxxyyz &
      + v664 + v694 + v698) - 775.0d0*(v682 + v684 + v685 + v728) - &
      100.0d0*(v686 + v725 + v727 + v729) + 480.0d0*(v646 + v658 - v659 &
      + v702 + v723) + 90.0d0*(v639 + v672 - v688 - v708 - v709 - v731 &
      ) - 225.0d0*(v640 + v641 + v642 + v687 + v716 + v730) + 1920.0d0* &
      (-v650 + v691 - v692 + v696 - v700 - v732) - 1200.0d0*(v663 + &
      v677 + v693 + v697 + v703 + v704 + v705 + v710)))
    S_xxxxxyy  = x*(0.00699300699300699d0*(10.0d0*v190) + v345 + v741 + v742*v9 + v879)
    Ms_xxxxxyy = Ms_xxxxxyy + (M_0*S_xxxxxyy + v746 - v747 + v748 + v751 + v753 + v755 + v757 + &
      0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0*M_xxxxxyy - &
      116.0d0*v443 + 732.0d0*v444 - 36.0d0*v445 + 1350.0d0*v447 - &
      45.0d0*v449 - 780.0d0*v454 - 600.0d0*v455 - 35.0d0*(M_xyyyyyy + &
      v515) - 210.0d0*(v429 + v441) + 2550.0d0*(v430 + v452) - 190.0d0* &
      (v434 + v439) + 2730.0d0*(v435 + v465) + 1620.0d0*(v440 + v482) + &
      444.0d0*(v442 + v505) + 2820.0d0*(v446 + v477) + 5160.0d0*(v450 + &
      v463) - 420.0d0*(v451 + v510) - 1110.0d0*(v453 + v506) - 1080.0d0 &
      *(v456 + v525) - 100.0d0*(v458 + v471) - 700.0d0*(v459 + v519) - &
      1380.0d0*(v464 + v487) - 2790.0d0*(v466 + v483) - 1740.0d0*(v467 &
      + v478) - 1560.0d0*(v468 + v501) - 2760.0d0*(v469 + v499) - &
      1660.0d0*(v472 + v494) + 255.0d0*(v485 + v490 + v508 + v513) + &
      560.0d0*(v488 + v495 + v511 + v520) + 30.0d0*(-M_xyyyyzz + v492 + &
      v503 + v516 - v517) - 120.0d0*(v431 + v433 + v460 + v496 + v749) &
      + 90.0d0*(-M_xxxyyyy - v436 + v437 - v438 - v473 + v512 - v521) - &
      105.0d0*(v461 + v474 + v484 + v486 + v497 + v507 + v509 + v522) + &
      60.0d0*(v432 - v448 - v457 - v470 - v479 - v480 - v481 + v489 - &
      v491 - v493 - v500 - v514 - v518)))
    S_xxxxxyz  = v7*(-v743 + v28 + v742)
    Ms_xxxxxyz = Ms_xxxxxyz + (M_0*S_xxxxxyz + M_xxyz*v312 + S_xxyz*v296 + v789 + 0.00699300699300699d0 &
      *(-250.0d0*v801 - 30.0d0*v808 + 128.0d0*(M_xxxxxyz + v795) - &
      270.0d0*(v800 + v836) + 390.0d0*(v807 + v824) + 1430.0d0*(M_xxxy* &
      S_xxz + M_xxz*S_xxxy) + 288.0d0*(v793 + v794 + v835) + 480.0d0*( &
      v797 + v798 + v811) - 75.0d0*(v817 + v825 + v829) + 1110.0d0*( &
      v790 + v802 + v803 + v805) + 60.0d0*(v791 + v809 + v813 + v832) + &
      960.0d0*(v792 + v796 + v821 + v823) + 280.0d0*(-v799 + v804 + &
      v827 - v834) + 600.0d0*(-v806 + v810 + v815 - v820) + 120.0d0*( &
      v814 + v819 + v826 + v833) - 195.0d0*(v816 + v822 + v828 + v837) &
      - 15.0d0*(M_xyyyyyz + v812 + v818 + v830 + v831)))
    S_xxxxyyy  = y*(0.00699300699300699d0*(-33.0d0*v189 + 18.0d0*v190) + v839 + v880)
    Ms_xxxxyyy = Ms_xxxxyyy + (M_0*S_xxxxyyy + v841 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v531 + v534 + 330.0d0*v554 + 380.0d0*v561 &
      + 630.0d0*(v541 + v573) + 560.0d0*(v546 + v592) + 200.0d0*(v548 + &
      v607) + 420.0d0*(v553 + v602) + 1320.0d0*(v559 + v590) + 1140.0d0 &
      *(v560 + v586) + 1710.0d0*(v567 + v571) + 9.0d0*(v605 + v615) + &
      25.0d0*(v610 + v613) + 30.0d0*(v618 + v629) + 40.0d0*(v620 + v624 &
      ) + 6.0d0*(v529 + v530 + v532 + v533 + v535 + v536 + v617) - ( &
      16.0d0*M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + &
      M_yyyyyyy + 15.0d0*v528 + 150.0d0*v540 + 30.0d0*v542 + 18.0d0* &
      v543 + 30.0d0*v544 + 140.0d0*v545 + 150.0d0*v547 + 96.0d0*v549 + &
      16.0d0*v550 + 96.0d0*v551 + 150.0d0*v552 + 60.0d0*v555 + 60.0d0* &
      v556 + 15.0d0*v557 + 140.0d0*v558 + 30.0d0*v563 + 30.0d0*v565 + &
      150.0d0*v566 + 30.0d0*v568 + 150.0d0*v569 + 30.0d0*v570 + 270.0d0 &
      *v572 + 270.0d0*v574 + 120.0d0*v575 + 240.0d0*v576 + 140.0d0*v577 &
      + 260.0d0*v578 + 30.0d0*v579 + 15.0d0*v580 + 140.0d0*v581 + &
      140.0d0*v582 + 30.0d0*v583 + 15.0d0*v584 + 96.0d0*v585 + 30.0d0* &
      v587 + 270.0d0*v588 + 30.0d0*v589 + 480.0d0*v591 + 480.0d0*v593 + &
      270.0d0*v594 + 30.0d0*v595 + 30.0d0*v596 + 480.0d0*v597 + 30.0d0* &
      v598 + 480.0d0*v600 + 270.0d0*v603 + 15.0d0*v604 + 15.0d0*v606 + &
      270.0d0*v608 + 15.0d0*v609 + 15.0d0*v611 + 150.0d0*v612 + 18.0d0* &
      v614 + v616 + 140.0d0*v619 + 30.0d0*v621 + 15.0d0*v622 + 260.0d0* &
      v623 + 30.0d0*v625 + 15.0d0*v626 + 60.0d0*v627 + 240.0d0*v628 + &
      143.0d0*v842 + 143.0d0*v843 + 150.0d0*v844 + 240.0d0*v845 + &
      143.0d0*v846 + 143.0d0*v847 + 240.0d0*v848)))
    S_xxxxyyz  = z*(0.00699300699300699d0*(6.0d0*v190) + v741 + v849 + v880)
    Ms_xxxxyyz = Ms_xxxxyyz + (M_0*S_xxxxyyz + v851 - v852 - v855 - v856 + v857 - v860 - v861 - v862 + &
      v881 + 0.00233100233100233d0*(390.0d0*M_xxxxyyz - 7.0d0*M_yyyyyyz &
      - 6.0d0*M_yyyyzzz + 690.0d0*v651 + 780.0d0*v653 + 1260.0d0*v659 - &
      37.0d0*v715 - 12.0d0*v740 - 16.0d0*(M_xxxxxxz + v648) + 45.0d0*( &
      v630 + v632) - 20.0d0*(v643 + v661) + 2160.0d0*(v644 + v695) - &
      90.0d0*(v645 + v680) + 840.0d0*(v646 + v723) + 1380.0d0*(v650 + &
      v732) + 540.0d0*(v655 + v706) + 3720.0d0*(v657 + v699) + 1860.0d0 &
      *(v658 + v702) + 2520.0d0*(v660 + v689) + 1560.0d0*(v662 + v690) &
      + 4200.0d0*(v665 + v676) - 450.0d0*(v668 + v724) - 270.0d0*(v673 &
      + v707) + 300.0d0*(v677 + v710) + 330.0d0*(v683 + v712) + 570.0d0 &
      *(v693 + v704) + 40.0d0*(v711 + v720) - 105.0d0*(v713 + v726) - &
      132.0d0*(v714 + v736) - 720.0d0*(v858 + v859) - 96.0d0*(v647 + &
      v649 + v701) - 420.0d0*(v666 + v671 + v719) + 2250.0d0*(v639 + &
      v667 + v672 + v681) - 36.0d0*(v640 + v642 + v687 + v730) - &
      110.0d0*(v682 + v684 + v685 + v728) - 65.0d0*(v686 + v725 + v727 &
      + v729) - 27.0d0*(v688 + v708 + v709 + v731) + 480.0d0*(-v691 + &
      v692 - v696 + v700) - 30.0d0*(M_xxyyyyz + v664 + v694 + v698 + &
      v717) + 60.0d0*(v669 - v678 - v721 + v733 - v734 - v737)))
    S_xxxyyyy  = x*(0.00699300699300699d0*(-33.0d0*v415 + 18.0d0*v417) + v839 + v882)
    Ms_xxxyyyy = Ms_xxxyyyy + (M_0*S_xxxyyyy + v748 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + 380.0d0*v454 + v476 + v524 + 330.0d0*v749 &
      + 9.0d0*(v429 + v441) + 420.0d0*(v432 + v489) + 25.0d0*(v434 + &
      v439) + 200.0d0*(v437 + v512) + 30.0d0*(v448 + v500) + 560.0d0*( &
      v451 + v510) + 630.0d0*(v453 + v506) + 40.0d0*(v458 + v471) + &
      1320.0d0*(v464 + v487) + 1710.0d0*(v466 + v483) + 1140.0d0*(v467 &
      + v478) + 6.0d0*(v445 + v462 + v475 + v498 + v502 + v504 + v523) &
      - (M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + 270.0d0*v430 + 15.0d0*v431 + 15.0d0*v433 + 270.0d0* &
      v435 + 15.0d0*v436 + 15.0d0*v438 + 150.0d0*v440 + 18.0d0*v442 + &
      v443 + 30.0d0*v444 + 270.0d0*v446 + 150.0d0*v447 + 480.0d0*v450 + &
      270.0d0*v452 + 120.0d0*v455 + 240.0d0*v456 + 30.0d0*v457 + &
      140.0d0*v459 + 15.0d0*v460 + 30.0d0*v461 + 480.0d0*v463 + 270.0d0 &
      *v465 + 240.0d0*v468 + 480.0d0*v469 + 30.0d0*v470 + 260.0d0*v472 &
      + 15.0d0*v473 + 30.0d0*v474 + 270.0d0*v477 + 30.0d0*v479 + 96.0d0 &
      *v480 + 30.0d0*v481 + 150.0d0*v482 + 30.0d0*v484 + 150.0d0*v485 + &
      30.0d0*v486 + 140.0d0*v488 + 150.0d0*v490 + 96.0d0*v491 + 60.0d0* &
      v492 + 30.0d0*v493 + 260.0d0*v494 + 140.0d0*v495 + 15.0d0*v496 + &
      30.0d0*v497 + 480.0d0*v499 + 240.0d0*v501 + 60.0d0*v503 + 18.0d0* &
      v505 + 30.0d0*v507 + 150.0d0*v508 + 30.0d0*v509 + 140.0d0*v511 + &
      150.0d0*v513 + 96.0d0*v514 + 16.0d0*v515 + 60.0d0*v516 + 15.0d0* &
      v517 + 30.0d0*v518 + 140.0d0*v519 + 140.0d0*v520 + 15.0d0*v521 + &
      30.0d0*v522 + 240.0d0*v525 + 15.0d0*v745 + 143.0d0*v751 + 143.0d0 &
      *v753 + 143.0d0*v755 + 143.0d0*v757)))
    S_xxxyyyz  = v7*(v64 + 0.00699300699300699d0*(9.0d0*v29 + 3.0d0*(-11.0d0*v31 - 11.0d0 &
      *v79)))
    Ms_xxxyyyz = Ms_xxxyyyz + (0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*v759 + 945.0d0*(v765 + v770) + 345.0d0*(v801 + v808) + &
      245.0d0*(v791 + v804 + v827 + v832) + 525.0d0*(v799 + v810 + v815 &
      + v834) + 1125.0d0*(v764 + v777 + v806 + v809 + v813 + v820) + &
      21.0d0*(v793 + v794 + v817 + v825 + v829 + v835) - 75.0d0*(v797 + &
      v798 + v811 + v812 + v818 + v831) + 465.0d0*(v758 + v760 + v773 + &
      v782 + v800 + v807 + v824 + v836) - 60.0d0*(v790 + v802 + v803 + &
      v805 + v814 + v819 + v826 + v833) + 15.0d0*(v792 + v796 + v816 + &
      v821 + v822 + v823 + v828 + v837) - 9.0d0*(M_xxxxxyz + M_xxxyzzz &
      + M_xyyyyyz + M_xyyyzzz + v763 + v767 + v769 + v771 + v772 + v776 &
      + v784 + v786 + v795 + v830) - 45.0d0*(v761 + v762 + v766 + v768 &
      + v774 + v775 + v778 + v779 + v780 + v781 + v783 + v785 + v787 + &
      v788)))
    S_xxyyyyy  = y*(0.00699300699300699d0*(10.0d0*v417) + v416 + v742*v8 + v864 + v879)
    Ms_xxyyyyy = Ms_xxyyyyy + (M_0*S_xxyyyyy + v537 - v539 + v841 + v842 + v843 + v846 + v847 + &
      0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0*M_yyyyyyy - &
      780.0d0*v561 - 600.0d0*v575 + 732.0d0*v595 - 116.0d0*v616 - &
      36.0d0*v617 + 1350.0d0*v844 - 45.0d0*v865 - 35.0d0*(M_xxxxxxy + &
      v550) - 1110.0d0*(v541 + v573) + 444.0d0*(v543 + v614) - 420.0d0* &
      (v546 + v592) - 1380.0d0*(v559 + v590) - 1740.0d0*(v560 + v586) - &
      2790.0d0*(v567 + v571) + 1620.0d0*(v569 + v612) + 2730.0d0*(v572 &
      + v608) + 2550.0d0*(v574 + v603) - 1560.0d0*(v576 + v628) - &
      1660.0d0*(v578 + v623) - 700.0d0*(v582 + v619) + 2820.0d0*(v588 + &
      v594) + 5160.0d0*(v591 + v593) - 2760.0d0*(v597 + v600) - 210.0d0 &
      *(v605 + v615) - 190.0d0*(v610 + v613) - 100.0d0*(v620 + v624) - &
      1080.0d0*(v845 + v848) + 255.0d0*(v540 + v547 + v552 + v566) + &
      560.0d0*(v545 + v558 + v577 + v581) + 30.0d0*(-M_xxxxyzz + v555 + &
      v556 - v557 + v627) - 120.0d0*(v554 + v580 + v604 + v606 + v622) &
      + 90.0d0*(-M_xxxxyyy + v548 - v584 + v607 - v609 - v611 - v626) - &
      105.0d0*(v542 + v544 + v568 + v570 + v579 + v583 + v621 + v625) + &
      60.0d0*(-v549 - v551 + v553 - v563 - v565 - v585 - v587 - v589 - &
      v596 - v598 + v602 - v618 - v629)))
    S_xxyyyyz  = z*(0.00699300699300699d0*(6.0d0*v417) + v849 + v864 + v882)
    Ms_xxyyyyz = Ms_xxyyyyz + (M_0*S_xxyyyyz - v636 + v652 - v679 - v718 - v722 - v735 - v738 + v851 + &
      v878 + 0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0*M_xxxxzzz &
      + 390.0d0*M_xxyyyyz - 37.0d0*v648 + 690.0d0*v670 + 1260.0d0*v671 &
      + 780.0d0*v694 - 12.0d0*v869 - 16.0d0*(M_yyyyyyz + v715) + 45.0d0 &
      *(v638 + v654) - 270.0d0*(v639 + v672) + 540.0d0*(v641 + v716) + &
      40.0d0*(v643 + v661) + 300.0d0*(v644 + v695) - 105.0d0*(v645 + &
      v680) + 330.0d0*(v646 + v723) - 132.0d0*(v647 + v701) + 570.0d0*( &
      v650 + v732) - 720.0d0*(v660 + v689) + 1560.0d0*(v666 + v719) - &
      450.0d0*(v667 + v681) + 1860.0d0*(v669 + v733) + 2160.0d0*(v677 + &
      v710) + 840.0d0*(v683 + v712) + 4200.0d0*(v691 + v696) + 3720.0d0 &
      *(v692 + v700) + 1380.0d0*(v693 + v704) - 20.0d0*(v711 + v720) - &
      90.0d0*(v713 + v726) + 2520.0d0*(v858 + v859) - 420.0d0*(v659 + &
      v662 + v690) - 96.0d0*(v714 + v736 + v867) - 27.0d0*(v640 + v642 &
      + v687 + v730) + 480.0d0*(v657 - v665 - v676 + v699) + 2250.0d0*( &
      v668 + v673 + v707 + v724) - 65.0d0*(v682 + v684 + v685 + v728) - &
      110.0d0*(v686 + v725 + v727 + v729) - 36.0d0*(v688 + v708 + v709 &
      + v731) - 30.0d0*(M_xxxxyyz + v653 + v656 + v866 + v868) + 60.0d0 &
      *(v658 - v663 - v697 + v702 - v703 - v705)))
    S_xyyyyyy  = v870*x
    Ms_xyyyyyy = Ms_xyyyyyy + (M_0*S_xyyyyyy + v428 + v746 + v747 + 0.00233100233100233d0*(10.0d0* &
      M_xxxxxxx - 105.0d0*M_xxxxxyy - 1200.0d0*v749 - 45.0d0*x*( &
      M_xxxxyy - M_xxxxzz) + 304.0d0*(M_xyyyyyy + v515) - 120.0d0*( &
      M_xyyyyzz + v517) + 1020.0d0*(v430 + v452) - 220.0d0*(v434 + v439 &
      ) + 840.0d0*(v435 + v465) - 315.0d0*(v440 + v482) + 150.0d0*(v453 &
      + v506) - 160.0d0*(v458 + v471) - 3870.0d0*(v466 + v483) + &
      1140.0d0*(v468 + v501) + 1040.0d0*(v472 + v494) + 4640.0d0*(v488 &
      + v511) - 3940.0d0*(v495 + v520) + 40.0d0*(v443 - v459 - v519) + &
      1344.0d0*(v480 + v491 + v514) - 2880.0d0*(v750 + v752 + v754 + &
      v756) + 480.0d0*(-v432 + v437 - v454 - v489 + v512) + 60.0d0*( &
      -v436 - v438 + v455 - v473 - v521) + 960.0d0*(v451 - v492 - v503 &
      + v510 - v516) + 1920.0d0*(v450 + v463 - v464 + v469 - v487 + &
      v499) + 3360.0d0*(-v467 - v478 + v485 + v490 + v508 + v513) + &
      30.0d0*(-v429 - v431 - v433 - v441 + v445 + v448 - v460 - v496 + &
      v500) - 240.0d0*(M_xxxyyyy + v444 + v446 + v457 + v470 + v477 + &
      v479 + v481 + v493 + v518) - 195.0d0*(v442 + v461 + v474 + v484 + &
      v486 + v497 + v505 + v507 + v509 + v522)))
    S_xyyyyyz  = v7*(0.0769230769230769d0*(-10.0d0*v79) + v742 + v78)
    Ms_xyyyyyz = Ms_xyyyyyz + (M_0*S_xyyyyyz + M_xyyy*v425 + M_xyyz*v426 + v789 + 0.00699300699300699d0 &
      *(-30.0d0*v801 - 250.0d0*v808 + 128.0d0*(M_xyyyyyz + v830) + &
      390.0d0*(v800 + v836) - 270.0d0*(v807 + v824) + 1430.0d0*(M_yyy* &
      S_xyyz + M_yyz*S_xyyy) - 75.0d0*(v793 + v794 + v835) + 480.0d0*( &
      v812 + v818 + v831) + 288.0d0*(v817 + v825 + v829) + 120.0d0*( &
      v790 + v802 + v803 + v805) + 280.0d0*(v791 - v810 - v815 + v832) &
      - 195.0d0*(v792 + v796 + v821 + v823) + 600.0d0*(v799 - v809 - &
      v813 + v834) + 60.0d0*(v804 + v806 + v820 + v827) + 1110.0d0*( &
      v814 + v819 + v826 + v833) + 960.0d0*(v816 + v822 + v828 + v837) &
      - 15.0d0*(M_xxxxxyz + v795 + v797 + v798 + v811)))
    S_yyyyyyy  = y*(0.00699300699300699d0*(-231.0d0*v415 + 105.0d0*v417) + v424 + v427)
    Ms_yyyyyyy = Ms_yyyyyyy + (M_0*S_yyyyyyy + v538 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      952.0d0*v616 - 1260.0d0*v844 - 630.0d0*v865 - 525.0d0*y*(M_xxxxyy &
      + M_xxyyzz) + 70.0d0*(M_xxxxxxy + v550) + 1680.0d0*(v541 + v573) &
      + 5040.0d0*(v567 + v571) + 1470.0d0*(v572 + v608) - 1050.0d0*( &
      v574 + v603) - 7980.0d0*(v591 + v593) - 1176.0d0*(v595 + v617) + &
      5880.0d0*(v597 + v600) + 3444.0d0*(v605 + v615) + 6860.0d0*(v610 &
      + v613) - 7420.0d0*(v620 + v624) + 105.0d0*(-M_xxxxyyy + &
      M_xxxxyzz + v557) + 35.0d0*(M_xxyzzzz + M_yyyzzzz + v531 + v534) &
      - 1120.0d0*(v545 + v558 + v577 + v581) + 2520.0d0*(v569 + v612 + &
      v845 + v848) - 280.0d0*(v578 + v582 + v619 + v623) - 4200.0d0*( &
      v588 + v594 + v618 + v629) + 840.0d0*(v543 - v546 - v559 - v590 - &
      v592 + v614) - 735.0d0*(v548 + v584 + v607 + v609 + v611 + v626) &
      - 1155.0d0*(v553 + v580 + v602 + v604 + v606 + v622) + 420.0d0*( &
      -M_xxyyyyy - v540 - v542 - v544 - v547 - v552 + v560 + v561 - &
      v566 - v568 - v570 + v575 + v576 - v579 - v583 + v586 - v621 - &
      v625 + v628) + 210.0d0*(-M_yyyyyzz + v529 + v530 + v532 + v533 + &
      v535 + v536 + v549 + v551 + v555 + v556 + v563 + v565 + v585 + &
      v587 + v589 + v596 + v598 + v627)))
    S_yyyyyyz  = v870*z
    Ms_yyyyyyz = Ms_yyyyyyz + (M_0*S_yyyyyyz + v852 + v855 + v856 - v857 + v860 + v861 + v862 + v881 + &
      v883 + 0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0* &
      M_xxxxyyz + 304.0d0*M_yyyyyyz + 40.0d0*v648 - 555.0d0*v651 + &
      784.0d0*v715 - 600.0d0*v717 + 1344.0d0*v867 + 30.0d0*v869 + &
      4320.0d0*(v630 + v632) + 900.0d0*(v639 + v672) + 1440.0d0*(v641 + &
      v716) - 160.0d0*(v643 + v661) - 735.0d0*(v646 + v723) + 150.0d0*( &
      v647 + v701) - 780.0d0*(v658 + v702) + 3840.0d0*(v666 + v719) + &
      1080.0d0*(v667 + v681) + 2970.0d0*(v668 + v724) - 5100.0d0*(v691 &
      + v696) - 4800.0d0*(v692 + v700) + 7520.0d0*(v711 + v720) + &
      6720.0d0*(v713 + v726) + 3264.0d0*(v714 + v736) - 2880.0d0*(v858 &
      + v859) - 120.0d0*(M_yyyyzzz + v662 + v690) + 60.0d0*(v645 + v659 &
      + v680) + 960.0d0*(v677 - v694 + v710) - 240.0d0*(M_xxyyyyz + &
      v653 + v866 + v868) - 100.0d0*(v682 + v684 + v685 + v728) - &
      775.0d0*(v686 + v725 + v727 + v729) + 480.0d0*(v669 - v671 + v683 &
      + v712 + v733) + 90.0d0*(-v640 - v642 + v673 - v687 + v707 - v730 &
      ) - 225.0d0*(v655 + v688 + v706 + v708 + v709 + v731) + 1920.0d0* &
      (-v657 + v665 + v676 - v693 - v699 - v704) - 1200.0d0*(v644 + &
      v650 + v678 + v695 + v721 + v732 + v734 + v737)))
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
#undef  Ms_xxxxxxx          
#undef  M_xxxxxxx           
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxy           
#undef  Ms_xxxxxxz          
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  Ms_xxxxxyy          
#undef  M_xxxxxyz           
#undef  Ms_xxxxxyz          
#undef  Ms_xxxxyyy          
#undef  M_xxxxyyy           
#undef  Ms_xxxxyyz          
#undef  M_xxxxyyz           
#undef  Ms_xxxyyyy          
#undef  M_xxxyyyy           
#undef  Ms_xxxyyyz          
#undef  M_xxxyyyz           
#undef  Ms_xxyyyyy          
#undef  M_xxyyyyy           
#undef  Ms_xxyyyyz          
#undef  M_xxyyyyz           
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyyz          
#undef  Ms_yyyyyyy          
#undef  M_yyyyyyy           
#undef  M_yyyyyyz           
#undef  Ms_yyyyyyz          
    end subroutine mom_es_M2M_add
    
! OPS  1770*ADD + 2*DIV + 2369*MUL + 175*NEG + POW + 52*SUB = 4369  (5807 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v430, v431, v432, v433, v44, v45, v46, v47,&
                v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58,&
                v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7,&
                v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80,&
                v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91,&
                v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_x, D_y, D_z,&
                D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
                D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx,&
                D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz,&
                D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz,&
                D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy,&
                D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz,&
                D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz,&
                D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz,&
                D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz,&
                D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz,&
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy,&
                D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy,&
                D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz,&
                D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz,&
                D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy,&
                D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz,&
                D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz,&
                D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx,&
                D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz,&
                D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy,&
                D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy,&
                D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz,&
                D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz,&
                D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz,&
                D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz,&
                D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz,&
                D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz,&
                M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz,&
                M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz,&
                M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz,&
                M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz,&
                M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz,&
                M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz,&
                M_zzzzzzz
#define y                    r(2)
#define L_x                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define M_xx                 M(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define M_xy                 M(2)
#define L_xx                 L(3)
#define M_xz                 M(3)
#define M_yy                 M(4)
#define L_xy                 L(4)
#define L_xz                 L(5)
#define M_yz                 M(5)
#define L_yy                 L(6)
#define M_xxx                M(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define L_xxx                L(8)
#define M_xxz                M(8)
#define M_xyy                M(9)
#define L_xxy                L(9)
#define L_xxz                L(10)
#define M_xyz                M(10)
#define L_xyy                L(11)
#define M_yyy                M(11)
#define M_yyz                M(12)
#define L_xyz                L(12)
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
#define L_xxyy               L(18)
#define M_xyyy               M(18)
#define M_xyyz               M(19)
#define L_xxyz               L(19)
#define M_yyyy               M(20)
#define L_xyyy               L(20)
#define L_xyyz               L(21)
#define M_yyyz               M(21)
#define L_yyyy               L(22)
#define M_xxxxx              M(22)
#define L_yyyz               L(23)
#define M_xxxxy              M(23)
#define M_xxxxz              M(24)
#define L_xxxxx              L(24)
#define L_xxxxy              L(25)
#define M_xxxyy              M(25)
#define L_xxxxz              L(26)
#define M_xxxyz              M(26)
#define L_xxxyy              L(27)
#define M_xxyyy              M(27)
#define L_xxxyz              L(28)
#define M_xxyyz              M(28)
#define L_xxyyy              L(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define L_xxyyz              L(30)
#define L_xyyyy              L(31)
#define M_yyyyy              M(31)
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
#define L_xxxxyy             L(38)
#define M_xxxyyy             M(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define L_xxxyyy             L(40)
#define M_xxyyyy             M(40)
#define M_xxyyyz             M(41)
#define L_xxxyyz             L(41)
#define M_xyyyyy             M(42)
#define L_xxyyyy             L(42)
#define M_xyyyyz             M(43)
#define L_xxyyyz             L(43)
#define M_yyyyyy             M(44)
#define L_xyyyyy             L(44)
#define M_yyyyyz             M(45)
#define L_xyyyyz             L(45)
#define M_xxxxxxx            M(46)
#define L_yyyyyy             L(46)
#define M_xxxxxxy            M(47)
#define L_yyyyyz             L(47)
#define L_xxxxxxx            L(48)
#define M_xxxxxxz            M(48)
#define M_xxxxxyy            M(49)
#define L_xxxxxxy            L(49)
#define M_xxxxxyz            M(50)
#define L_xxxxxxz            L(50)
#define M_xxxxyyy            M(51)
#define L_xxxxxyy            L(51)
#define L_xxxxxyz            L(52)
#define M_xxxxyyz            M(52)
#define L_xxxxyyy            L(53)
#define M_xxxyyyy            M(53)
#define M_xxxyyyz            M(54)
#define L_xxxxyyz            L(54)
#define L_xxxyyyy            L(55)
#define M_xxyyyyy            M(55)
#define L_xxxyyyz            L(56)
#define M_xxyyyyz            M(56)
#define L_xxyyyyy            L(57)
#define M_xyyyyyy            M(57)
#define L_xxyyyyz            L(58)
#define M_xyyyyyz            M(58)
#define M_yyyyyyy            M(59)
#define L_xyyyyyy            L(59)
#define L_xyyyyyz            L(60)
#define M_yyyyyyz            M(60)
#define L_yyyyyyy            L(61)
#define L_yyyyyyz            L(62)
#define L_xxxxxxxx           L(63)
#define L_xxxxxxxy           L(64)
#define L_xxxxxxxz           L(65)
#define L_xxxxxxyy           L(66)
#define L_xxxxxxyz           L(67)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define L_xxxxyyyy           L(70)
#define L_xxxxyyyz           L(71)
#define L_xxxyyyyy           L(72)
#define L_xxxyyyyz           L(73)
#define L_xxyyyyyy           L(74)
#define L_xxyyyyyz           L(75)
#define L_xyyyyyyy           L(76)
#define L_xyyyyyyz           L(77)
#define L_yyyyyyyy           L(78)
#define L_yyyyyyyz           L(79)
    v429       = y*z
    v430       = x*y
    v415       = 15.0d0*v429
    v417       = v430
    v419       = v429
    v112       = 0.5d0*M_xx
    v122       = 0.166666666666667d0*M_xxx
    v123       = 0.5d0*M_xxy
    v124       = 0.5d0*M_xxz
    v143       = 0.0416666666666667d0*M_xxxx
    v144       = 0.166666666666667d0*M_xxxy
    v145       = 0.166666666666667d0*M_xxxz
    v146       = 0.25d0*M_xxyy
    v147       = 0.5d0*M_xxyz
    v179       = 0.00833333333333333d0*M_xxxxx
    v180       = 0.0416666666666667d0*M_xxxxy
    v181       = 0.0416666666666667d0*M_xxxxz
    v182       = 0.0833333333333333d0*M_xxxyy
    v183       = 0.166666666666667d0*M_xxxyz
    v185       = 0.0833333333333333d0*M_xxyyy
    v186       = 0.25d0*M_xxyyz
    v247       = 0.00138888888888889d0*M_xxxxxx
    v248       = 0.00833333333333333d0*M_xxxxxy
    v249       = 0.00833333333333333d0*M_xxxxxz
    v250       = 0.0208333333333333d0*M_xxxxyy
    v251       = 0.0416666666666667d0*M_xxxxyz
    v253       = 0.0277777777777778d0*M_xxxyyy
    v254       = 0.0833333333333333d0*M_xxxyyz
    v257       = 0.0208333333333333d0*M_xxyyyy
    v258       = 0.0833333333333333d0*M_xxyyyz
    v291       = 0.5d0*M_yy
    v293       = 0.166666666666667d0*M_yyy
    v298       = 0.0416666666666667d0*M_yyyy
    v307       = 0.00833333333333333d0*M_yyyyy
    v323       = 0.00138888888888889d0*M_yyyyyy
    v347       = 0.000198412698412698d0*M_xxxxxxx
    v348       = 0.00138888888888889d0*M_xxxxxxy
    v349       = 0.00138888888888889d0*M_xxxxxxz
    v350       = 0.00416666666666667d0*M_xxxxxyy
    v351       = 0.00833333333333333d0*M_xxxxxyz
    v353       = 0.00694444444444444d0*M_xxxxyyy
    v354       = 0.0208333333333333d0*M_xxxxyyz
    v357       = 0.00694444444444444d0*M_xxxyyyy
    v358       = 0.0277777777777778d0*M_xxxyyyz
    v362       = 0.00416666666666667d0*M_xxyyyyy
    v363       = 0.0208333333333333d0*M_xxyyyyz
    v368       = 0.000198412698412698d0*M_yyyyyyy
    v369       = 0.00138888888888889d0*M_yyyyyyz
    v370       = 0.00833333333333333d0*M_yyyyyz
    v372       = 0.0416666666666667d0*M_yyyyz
    v375       = 0.166666666666667d0*M_yyyz
    v379       = 0.5d0*M_yyz
    v390       = 0.5d0*M_xyy
    v392       = 0.166666666666667d0*M_xyyy
    v394       = 0.0416666666666667d0*M_xyyyy
    v396       = 0.00833333333333333d0*M_xyyyyy
    v398       = 0.00138888888888889d0*M_xyyyyyy
    M_zz       = -(M_xx + M_yy)
    v384       = 0.5d0*M_zz
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    v391       = 0.5d0*M_yzz
    M_zzz      = -(M_xxz + M_yyz)
    v385       = 0.166666666666667d0*M_zzz
    M_xxzz     = -(M_xxxx + M_xxyy)
    v148       = 0.25d0*M_xxzz
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v380       = 0.25d0*M_yyzz
    M_yzzz     = -(M_xxyz + M_yyyz)
    v393       = 0.166666666666667d0*M_yzzz
    M_zzzz     = -(M_xxzz + M_yyzz)
    v386       = 0.0416666666666667d0*M_zzzz
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    v184       = 0.0833333333333333d0*M_xxxzz
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    v187       = 0.25d0*M_xxyzz
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    v188       = 0.0833333333333333d0*M_xxzzz
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    v376       = 0.0833333333333333d0*M_yyyzz
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v381       = 0.0833333333333333d0*M_yyzzz
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    v395       = 0.0416666666666667d0*M_yzzzz
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    v387       = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    v252       = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    v255       = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    v256       = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    v259       = 0.125d0*M_xxyyzz
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    v260       = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    v261       = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    v373       = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v377       = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v382       = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    v397       = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    v388       = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v352       = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    v355       = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v356       = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v359       = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    v360       = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    v361       = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v364       = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v365       = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    v366       = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v367       = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v371       = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v374       = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v378       = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v383       = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    v399       = 0.00138888888888889d0*M_yzzzzzz
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    v389       = 0.000198412698412698d0*M_zzzzzzz
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v400       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v400
    v24        = 7.0d0*v0
    a3         = a1*a2
    a4         = a2*a2
    v19        = a4
    v54        = 33.0d0*v19
    v82        = 143.0d0*v19
    a5         = a2*a3
    a6         = a3*a3
    v49        = a6
    v73        = 429.0d0*v49
    v74        = -v73
    a7         = a3*a4
    a8         = a4*a4
    b2         = b1*b1
    v1         = b2
    v401       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v402       = v1*v19
    v27        = v401
    v29        = 7.0d0*v1
    v59        = v402
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v403       = v0*v31
    v65        = v403
    v66        = 33.0d0*v31
    v90        = 143.0d0*v31
    v91        = -429.0d0*v65
    b5         = b2*b3
    b6         = b3*b3
    v68        = b6
    v92        = 429.0d0*v68
    v93        = -v92
    b7         = b3*b4
    b8         = b4*b4
    c2         = c1*c1
    h          = c2 + v0 + v1
    v404       = 3.0d0*h
    v405       = h*v0
    v406       = h*v1
    v407       = h*v19
    v409       = v1*v405
    v411       = h*v31
    v4         = -h
    v12        = v404
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v408       = v0*v17
    v410       = v1*v17
    v18        = 3.0d0*v17
    v20        = v405
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v406
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 - 945.0d0*v19 + 630.0d0*v405
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 - 945.0d0*v31 + 630.0d0*v406
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v407
    v51        = v408
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v409
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v410
    v67        = v33 + v53 + v66
    v69        = v411
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v425       = -v85
    v86        = 9.0d0*v17
    v87        = 198.0d0*v57
    v88        = h*v66
    v89        = -18.0d0*v64 + v46 + v88
    v94        = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97        = h*h*h*h
    v98        = 35.0d0*v97
    v99        = 12012.0d0*h
    v100       = v17*v19
    v101       = v0*v46
    v103       = -v72
    v104       = v103 + 715.0d0*v49 - 1001.0d0*v50 + 385.0d0*v51
    v106       = v17*v401
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v426       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v116       = -v108
    v117       = -1430.0d0*v57
    v427       = v116 + v117
    v119       = -1351350.0d0*v409
    v428       = v111 + v119
    v131       = v1*v46
    v132       = v31*v405
    v134       = -(3.0d0*v46 + 286.0d0*v57)
    v208       = v17*v31
    v290       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
    u2         = 1.0/h
    u          = sqrt(u2)
    u3         = u*u2
    v2         = u3
    D_x        = -v2*x
    D_y        = -v2*y
    D_z        = -v2*z
    u4         = u2*u2
    u5         = u2*u3
    v3         = u5
    v412       = 3.0d0*v3
    v6         = v412*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v412*v419
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v413       = 3.0d0*v8
    v9         = v8*x
    v11        = v413*(h - v10)
    D_xxx      = -3.0d0*v9*(v400 - v404)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    D_xyz      = -v415*v9
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = v413*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v414       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v414*y
    v26        = v414*z
    v28        = v15*v415
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v262       = 0.5d0*D_xxyy
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    v277       = 0.5d0*D_xxzz
    D_xyyy     = v22*v30
    D_xyyz     = v26*(v29 + v4)
    D_xyzz     = -(D_xxxy + D_xyyy)
    v334       = 0.5d0*D_xyzz
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v431       = v34*z
    v416       = 15.0d0*v34
    v35        = v416*x
    v39        = v431
    v41        = 315.0d0*v417*v431
    v42        = v416*y
    D_xxxxx    = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy    = v34*v38*y
    D_xxxxz    = v38*v39
    D_xxxyy    = v35*(v40 + h*v24 + 21.0d0*v32)
    v189       = 0.5d0*D_xxxyy
    D_xxxyz    = v41*(h - v5)
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    v199       = 0.5d0*D_xxxzz
    D_xxyyy    = v42*(v40 + h*v29 + 21.0d0*v20)
    v228       = 0.5d0*D_xxyyy
    v263       = 0.166666666666667d0*D_xxyyy
    D_xxyyz    = v39*(v36 - 945.0d0*v401 + 105.0d0*(v405 + v406))
    v273       = 0.5d0*D_xxyyz
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    v238       = 0.5d0*D_xxyzz
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    v278       = 0.166666666666667d0*D_xxzzz
    v286       = 0.5d0*D_xxzzz
    D_xyyyy    = v34*v43*x
    D_xyyyz    = v41*(h - v7)
    v330       = 0.5d0*D_xyyyz
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    v314       = 0.5d0*D_xyyzz
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    v335       = 0.166666666666667d0*D_xyzzz
    v343       = 0.5d0*D_xyzzz
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    D_yyyyy    = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz    = v39*v43
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    u12        = u6*u6
    u13        = u6*u7
    v44        = u13
    v432       = 315.0d0*v44
    v418       = v432*x
    v45        = 45.0d0*v44
    v52        = v418*y
    v56        = v418*z
    v60        = v419*v432
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 + v17*v29 - 21.0d0*v407 + 14.0d0*v51 + 231.0d0*v59)
    v149       = 0.5d0*D_xxxxyy
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    v155       = 0.5d0*D_xxxxzz
    D_xxxyyy   = 945.0d0*v417*v44*(11.0d0*v27 + v17 + v61 + v62)
    v168       = 0.5d0*D_xxxyyy
    v190       = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    v196       = 0.5d0*D_xxxyyz
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    v174       = 0.5d0*D_xxxyzz
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    v200       = 0.166666666666667d0*D_xxxzzz
    v205       = 0.5d0*D_xxxzzz
    D_xxyyyy   = v45*(v58 + v17*v24 - 21.0d0*v411 + 14.0d0*v64 + 231.0d0*v65)
    v217       = 0.5d0*D_xxyyyy
    v229       = 0.166666666666667d0*D_xxyyyy
    v264       = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz   = v60*(-9.0d0*v20 + v62 + v63)
    v235       = 0.5d0*D_xxyyyz
    v270       = 0.166666666666667d0*D_xxyyyz
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    v223       = 0.5d0*D_xxyyzz
    v274       = 0.25d0*D_xxyyzz
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    v239       = 0.166666666666667d0*D_xxyzzz
    v244       = 0.5d0*D_xxyzzz
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    v279       = 0.0416666666666667d0*D_xxzzzz
    v287       = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy   = v52*v67
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    v311       = 0.5d0*D_xyyyyz
    v327       = 0.166666666666667d0*D_xyyyyz
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    v302       = 0.5d0*D_xyyyzz
    v331       = 0.25d0*D_xyyyzz
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    v315       = 0.166666666666667d0*D_xyyzzz
    v320       = 0.5d0*D_xyyzzz
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    v336       = 0.0416666666666667d0*D_xyzzzz
    v344       = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy   = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz   = v60*v67
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    u14        = u7*u7
    u15        = u7*u8
    v70        = u15
    v433       = 945.0d0*v70
    v420       = 315.0d0*v70
    v71        = v420*x
    v75        = v420*y
    v77        = v420*z
    v81        = v419*v433*x
    v83        = v433
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    L_xxxxxxx  = L_xxxxxxx + (D_xxxxxxx*M_0)
    D_xxxxxxy  = v75*v76
    L_xxxxxxy  = L_xxxxxxy + (D_xxxxxxy*M_0)
    D_xxxxxxz  = v76*v77
    L_xxxxxxz  = L_xxxxxxz + (D_xxxxxxz*M_0)
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v125       = 0.5d0*D_xxxxxyy
    L_xxxxxyy  = L_xxxxxyy + (D_xxxxxyy*M_0)
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxyz  = L_xxxxxyz + (D_xxxxxyz*M_0)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    v128       = 0.5d0*D_xxxxxzz
    D_xxxxyyy  = -v83*y*(v425 + v1*v18 + v1*v82 - v84)
    v137       = 0.5d0*D_xxxxyyy
    v150       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy  = L_xxxxyyy + (D_xxxxyyy*M_0)
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    v153       = 0.5d0*D_xxxxyyz
    L_xxxxyyz  = L_xxxxyyz + (D_xxxxyyz*M_0)
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    v140       = 0.5d0*D_xxxxyzz
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    v156       = 0.166666666666667d0*D_xxxxzzz
    v158       = 0.5d0*D_xxxxzzz
    D_xxxyyyy  = -v83*x*(v425 + v0*v18 + v0*v90 - v89)
    v162       = 0.5d0*D_xxxyyyy
    v169       = 0.166666666666667d0*D_xxxyyyy
    v191       = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy  = L_xxxyyyy + (D_xxxyyyy*M_0)
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v172       = 0.5d0*D_xxxyyyz
    v194       = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyyz  = L_xxxyyyz + (D_xxxyyyz*M_0)
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    v165       = 0.5d0*D_xxxyyzz
    v197       = 0.25d0*D_xxxyyzz
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    v175       = 0.166666666666667d0*D_xxxyzzz
    v177       = 0.5d0*D_xxxyzzz
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    v201       = 0.0416666666666667d0*D_xxxzzzz
    v206       = 0.166666666666667d0*D_xxxzzzz
    D_xxyyyyy  = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    v211       = 0.5d0*D_xxyyyyy
    v218       = 0.166666666666667d0*D_xxyyyyy
    v230       = 0.0416666666666667d0*D_xxyyyyy
    v265       = 0.00833333333333333d0*D_xxyyyyy
    L_xxyyyyy  = L_xxyyyyy + (D_xxyyyyy*M_0)
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    v221       = 0.5d0*D_xxyyyyz
    v233       = 0.166666666666667d0*D_xxyyyyz
    v268       = 0.0416666666666667d0*D_xxyyyyz
    L_xxyyyyz  = L_xxyyyyz + (D_xxyyyyz*M_0)
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    v214       = 0.5d0*D_xxyyyzz
    v236       = 0.25d0*D_xxyyyzz
    v271       = 0.0833333333333333d0*D_xxyyyzz
    v283       = 0.166666666666667d0*D_xxyyyzz
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    v224       = 0.166666666666667d0*D_xxyyzzz
    v226       = 0.5d0*D_xxyyzzz
    v275       = 0.0833333333333333d0*D_xxyyzzz
    v284       = 0.25d0*D_xxyyzzz
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    v240       = 0.0416666666666667d0*D_xxyzzzz
    v245       = 0.166666666666667d0*D_xxyzzzz
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    v280       = 0.00833333333333333d0*D_xxzzzzz
    v288       = 0.0416666666666667d0*D_xxzzzzz
    D_xyyyyyy  = v71*v94
    L_xyyyyyy  = L_xyyyyyy + (D_xyyyyyy*M_0)
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    v300       = 0.5d0*D_xyyyyyz
    v309       = 0.166666666666667d0*D_xyyyyyz
    v325       = 0.0416666666666667d0*D_xyyyyyz
    L_xyyyyyz  = L_xyyyyyz + (D_xyyyyyz*M_0)
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    v295       = 0.5d0*D_xyyyyzz
    v312       = 0.25d0*D_xyyyyzz
    v328       = 0.0833333333333333d0*D_xyyyyzz
    v340       = 0.166666666666667d0*D_xyyyyzz
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    v303       = 0.166666666666667d0*D_xyyyzzz
    v305       = 0.5d0*D_xyyyzzz
    v332       = 0.0833333333333333d0*D_xyyyzzz
    v341       = 0.25d0*D_xyyyzzz
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    v316       = 0.0416666666666667d0*D_xyyzzzz
    v321       = 0.166666666666667d0*D_xyyzzzz
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    v337       = 0.00833333333333333d0*D_xyzzzzz
    v345       = 0.0416666666666667d0*D_xyzzzzz
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    L_yyyyyyy  = L_yyyyyyy + (D_yyyyyyy*M_0)
    D_yyyyyyz  = v77*v94
    L_yyyyyyz  = L_yyyyyyz + (D_yyyyyyz*M_0)
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v421       = v430*v95
    v422       = v95*z
    v423       = v422*x
    v424       = v422*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v421
    v105       = 2835.0d0*v423
    v110       = v424
    v115       = 945.0d0*v421
    v118       = v423
    v133       = 2835.0d0*v424
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = L_xxxxxxxx + (D_xxxxxxxx*M_0)
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = L_xxxxxxxy + (D_xxxxxxxy*M_0)
    D_xxxxxxxz = v104*v105
    L_xxxxxxxz = L_xxxxxxxz + (D_xxxxxxxz*M_0)
    D_xxxxxxyy = -v96*(v426 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    v113       = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy = L_xxxxxxyy + (D_xxxxxxyy*M_0)
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v408 + 155925.0d0*(-13.0d0*v407 + 13.0d0*v49))
    L_xxxxxxyz = L_xxxxxxyz + (D_xxxxxxyz*M_0)
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    v114       = 0.5d0*D_xxxxxxzz
    L_xxxxxx   = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxxx*v112 + D_xxxxxxxy*M_xy + D_xxxxxxxz*M_xz + &
      D_xxxxxxyz*M_yz + M_yy*v113 + M_zz*v114)
    D_xxxxxyyy = v115*(v427 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v120       = 0.5d0*D_xxxxxyyy
    v126       = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy = L_xxxxxyyy + (D_xxxxxyyy*M_0)
    D_xxxxxyyz = v118*(v428 + 2027025.0d0*v402 - 135135.0d0*v407 + 103950.0d0*v408 + &
      155925.0d0*v410)
    v127       = 0.5d0*D_xxxxxyyz
    L_xxxxxyyz = L_xxxxxyyz + (D_xxxxxyyz*M_0)
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    v121       = 0.5d0*D_xxxxxyzz
    L_xxxxxy   = L_xxxxxy + (D_xxxxxxxy*v112 + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + D_xxxxxy*M_0 + &
      D_xxxxxyyz*M_yz + M_yy*v120 + M_zz*v121)
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    v129       = 0.166666666666667d0*D_xxxxxzzz
    v130       = 0.5d0*D_xxxxxzzz
    L_xxxxx    = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxxx*v112 + D_xxxxxxxx*v122 + D_xxxxxxxy*v123 + &
      D_xxxxxxxz*v124 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz* &
      M_xz + D_xxxxxyz*M_yz + M_xyy*v113 + M_xzz*v114 + M_yy*v125 + &
      M_yyy*v126 + M_yyz*v127 + M_yzz*v121 + M_zz*v128 + M_zzz*v129)
    L_xxxxxz   = L_xxxxxz + (D_xxxxxxxz*v112 + D_xxxxxxyz*M_xy + D_xxxxxxzz*M_xz + D_xxxxxyzz*M_yz + &
      D_xxxxxz*M_0 + M_yy*v127 + M_zz*v130)
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v131) - 858.0d0*(v1*v50 + v132))
    v135       = 0.5d0*D_xxxxyyyy
    v138       = 0.166666666666667d0*D_xxxxyyyy
    v151       = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy = L_xxxxyyyy + (D_xxxxyyyy*M_0)
    D_xxxxyyyz = v133*(v134 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v139       = 0.5d0*D_xxxxyyyz
    v152       = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyyz = L_xxxxyyyz + (D_xxxxyyyz*M_0)
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    v136       = 0.5d0*D_xxxxyyzz
    v154       = 0.25d0*D_xxxxyyzz
    L_xxxxyy   = L_xxxxyy + (D_xxxxxxyy*v112 + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + D_xxxxyy*M_0 + &
      D_xxxxyyyz*M_yz + M_yy*v135 + M_zz*v136)
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    v141       = 0.166666666666667d0*D_xxxxyzzz
    v142       = 0.5d0*D_xxxxyzzz
    L_xxxxy    = L_xxxxy + (D_xxxxxxxy*v122 + D_xxxxxxy*v112 + D_xxxxxxyy*v123 + D_xxxxxxyz*v124 + &
      D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 &
      + D_xxxxyyz*M_yz + M_xyy*v120 + M_xzz*v121 + M_yy*v137 + M_yyy* &
      v138 + M_yyz*v139 + M_yzz*v136 + M_zz*v140 + M_zzz*v141)
    L_xxxxyz   = L_xxxxyz + (D_xxxxxxyz*v112 + D_xxxxxyyz*M_xy + D_xxxxxyzz*M_xz + D_xxxxyyzz*M_yz + &
      D_xxxxyz*M_0 + M_yy*v139 + M_zz*v142)
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    v157       = 0.0416666666666667d0*D_xxxxzzzz
    v159       = 0.166666666666667d0*D_xxxxzzzz
    L_xxxx     = L_xxxx + (D_xxxx*M_0 + D_xxxxxx*v112 + D_xxxxxxx*v122 + D_xxxxxxxx*v143 + &
      D_xxxxxxxy*v144 + D_xxxxxxxz*v145 + D_xxxxxxy*v123 + D_xxxxxxyy* &
      v146 + D_xxxxxxyz*v147 + D_xxxxxxz*v124 + D_xxxxxxzz*v148 + &
      D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz*M_yz + &
      M_xyy*v125 + M_xyyy*v126 + M_xyyz*v127 + M_xyzz*v121 + M_xzz*v128 &
      + M_xzzz*v129 + M_yy*v149 + M_yyy*v150 + M_yyyy*v151 + M_yyyz* &
      v152 + M_yyz*v153 + M_yyzz*v154 + M_yzz*v140 + M_yzzz*v141 + M_zz &
      *v155 + M_zzz*v156 + M_zzzz*v157)
    L_xxxxz    = L_xxxxz + (D_xxxxxxxz*v122 + D_xxxxxxyz*v123 + D_xxxxxxz*v112 + D_xxxxxxzz*v124 + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz* &
      M_yz + D_xxxxz*M_0 + M_xyy*v127 + M_xzz*v130 + M_yy*v153 + M_yyy* &
      v152 + M_yyz*v136 + M_yzz*v142 + M_zz*v158 + M_zzz*v159)
    D_xxxyyyyy = v115*(v427 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v160       = 0.5d0*D_xxxyyyyy
    v163       = 0.166666666666667d0*D_xxxyyyyy
    v170       = 0.0416666666666667d0*D_xxxyyyyy
    v192       = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy = L_xxxyyyyy + (D_xxxyyyyy*M_0)
    D_xxxyyyyz = v105*(v134 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v164       = 0.5d0*D_xxxyyyyz
    v171       = 0.166666666666667d0*D_xxxyyyyz
    v193       = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyyz = L_xxxyyyyz + (D_xxxyyyyz*M_0)
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    v161       = 0.5d0*D_xxxyyyzz
    v173       = 0.25d0*D_xxxyyyzz
    v195       = 0.0833333333333333d0*D_xxxyyyzz
    v203       = 0.166666666666667d0*D_xxxyyyzz
    L_xxxyyy   = L_xxxyyy + (D_xxxxxyyy*v112 + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + D_xxxyyy*M_0 + &
      D_xxxyyyyz*M_yz + M_yy*v160 + M_zz*v161)
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    v166       = 0.166666666666667d0*D_xxxyyzzz
    v167       = 0.5d0*D_xxxyyzzz
    v198       = 0.0833333333333333d0*D_xxxyyzzz
    v204       = 0.25d0*D_xxxyyzzz
    L_xxxyy    = L_xxxyy + (D_xxxxxxyy*v122 + D_xxxxxyy*v112 + D_xxxxxyyy*v123 + D_xxxxxyyz*v124 + &
      D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 &
      + D_xxxyyyz*M_yz + M_xyy*v135 + M_xzz*v136 + M_yy*v162 + M_yyy* &
      v163 + M_yyz*v164 + M_yzz*v161 + M_zz*v165 + M_zzz*v166)
    L_xxxyyz   = L_xxxyyz + (D_xxxxxyyz*v112 + D_xxxxyyyz*M_xy + D_xxxxyyzz*M_xz + D_xxxyyyzz*M_yz + &
      D_xxxyyz*M_0 + M_yy*v164 + M_zz*v167)
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    v176       = 0.0416666666666667d0*D_xxxyzzzz
    v178       = 0.166666666666667d0*D_xxxyzzzz
    L_xxxy     = L_xxxy + (D_xxxxxxxy*v143 + D_xxxxxxy*v122 + D_xxxxxxyy*v144 + D_xxxxxxyz*v145 + &
      D_xxxxxy*v112 + D_xxxxxyy*v123 + D_xxxxxyyy*v146 + D_xxxxxyyz* &
      v147 + D_xxxxxyz*v124 + D_xxxxxyzz*v148 + D_xxxxyy*M_xy + &
      D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz*M_yz + &
      M_xyy*v137 + M_xyyy*v138 + M_xyyz*v139 + M_xyzz*v136 + M_xzz*v140 &
      + M_xzzz*v141 + M_yy*v168 + M_yyy*v169 + M_yyyy*v170 + M_yyyz* &
      v171 + M_yyz*v172 + M_yyzz*v173 + M_yzz*v165 + M_yzzz*v166 + M_zz &
      *v174 + M_zzz*v175 + M_zzzz*v176)
    L_xxxyz    = L_xxxyz + (D_xxxxxxyz*v122 + D_xxxxxyyz*v123 + D_xxxxxyz*v112 + D_xxxxxyzz*v124 + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz* &
      M_yz + D_xxxyz*M_0 + M_xyy*v139 + M_xzz*v142 + M_yy*v172 + M_yyy* &
      v171 + M_yyz*v161 + M_yzz*v167 + M_zz*v177 + M_zzz*v178)
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    v202       = 0.00833333333333333d0*D_xxxzzzzz
    v207       = 0.0416666666666667d0*D_xxxzzzzz
    L_xxx      = L_xxx + (D_xxx*M_0 + D_xxxxx*v112 + D_xxxxxx*v122 + D_xxxxxxx*v143 + D_xxxxxxxx* &
      v179 + D_xxxxxxxy*v180 + D_xxxxxxxz*v181 + D_xxxxxxy*v144 + &
      D_xxxxxxyy*v182 + D_xxxxxxyz*v183 + D_xxxxxxz*v145 + D_xxxxxxzz* &
      v184 + D_xxxxxy*v123 + D_xxxxxyy*v146 + D_xxxxxyyy*v185 + &
      D_xxxxxyyz*v186 + D_xxxxxyz*v147 + D_xxxxxyzz*v187 + D_xxxxxz* &
      v124 + D_xxxxxzz*v148 + D_xxxxxzzz*v188 + D_xxxxy*M_xy + D_xxxxyz &
      *M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz + M_xyy*v149 + M_xyyy*v150 + &
      M_xyyyy*v151 + M_xyyyz*v152 + M_xyyz*v153 + M_xyyzz*v154 + M_xyzz &
      *v140 + M_xyzzz*v141 + M_xzz*v155 + M_xzzz*v156 + M_xzzzz*v157 + &
      M_yy*v189 + M_yyy*v190 + M_yyyy*v191 + M_yyyyy*v192 + M_yyyyz* &
      v193 + M_yyyz*v194 + M_yyyzz*v195 + M_yyz*v196 + M_yyzz*v197 + &
      M_yyzzz*v198 + M_yzz*v174 + M_yzzz*v175 + M_yzzzz*v176 + M_zz* &
      v199 + M_zzz*v200 + M_zzzz*v201 + M_zzzzz*v202)
    L_xxxz     = L_xxxz + (D_xxxxxxxz*v143 + D_xxxxxxyz*v144 + D_xxxxxxz*v122 + D_xxxxxxzz*v145 + &
      D_xxxxxyyz*v146 + D_xxxxxyz*v123 + D_xxxxxyzz*v147 + D_xxxxxz* &
      v112 + D_xxxxxzz*v124 + D_xxxxxzzz*v148 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz*M_0 + &
      M_xyy*v153 + M_xyyy*v152 + M_xyyz*v136 + M_xyzz*v142 + M_xzz*v158 &
      + M_xzzz*v159 + M_yy*v196 + M_yyy*v194 + M_yyyy*v193 + M_yyyz* &
      v203 + M_yyz*v165 + M_yyzz*v204 + M_yzz*v177 + M_yzzz*v178 + M_zz &
      *v205 + M_zzz*v206 + M_zzzz*v207)
    D_xxyyyyyy = -v96*(v426 + h*v92 + v0*v108 + 135.0d0*v131 - 495.0d0*v208 + 6435.0d0*( &
      -v0*v68 + v132))
    v209       = 0.5d0*D_xxyyyyyy
    v212       = 0.166666666666667d0*D_xxyyyyyy
    v219       = 0.0416666666666667d0*D_xxyyyyyy
    v231       = 0.00833333333333333d0*D_xxyyyyyy
    v266       = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy = L_xxyyyyyy + (D_xxyyyyyy*M_0)
    D_xxyyyyyz = v110*(v428 + 2027025.0d0*v403 + 155925.0d0*v408 + 103950.0d0*v410 - &
      135135.0d0*v411)
    v213       = 0.5d0*D_xxyyyyyz
    v220       = 0.166666666666667d0*D_xxyyyyyz
    v232       = 0.0416666666666667d0*D_xxyyyyyz
    v267       = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyyz = L_xxyyyyyz + (D_xxyyyyyz*M_0)
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    v210       = 0.5d0*D_xxyyyyzz
    v222       = 0.25d0*D_xxyyyyzz
    v234       = 0.0833333333333333d0*D_xxyyyyzz
    v242       = 0.166666666666667d0*D_xxyyyyzz
    v269       = 0.0208333333333333d0*D_xxyyyyzz
    v282       = 0.0416666666666667d0*D_xxyyyyzz
    L_xxyyyy   = L_xxyyyy + (D_xxxxyyyy*v112 + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + D_xxyyyy*M_0 + &
      D_xxyyyyyz*M_yz + M_yy*v209 + M_zz*v210)
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    v215       = 0.166666666666667d0*D_xxyyyzzz
    v216       = 0.5d0*D_xxyyyzzz
    v237       = 0.0833333333333333d0*D_xxyyyzzz
    v243       = 0.25d0*D_xxyyyzzz
    v272       = 0.0277777777777778d0*D_xxyyyzzz
    L_xxyyy    = L_xxyyy + (D_xxxxxyyy*v122 + D_xxxxyyy*v112 + D_xxxxyyyy*v123 + D_xxxxyyyz*v124 + &
      D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 &
      + D_xxyyyyz*M_yz + M_xyy*v160 + M_xzz*v161 + M_yy*v211 + M_yyy* &
      v212 + M_yyz*v213 + M_yzz*v210 + M_zz*v214 + M_zzz*v215)
    L_xxyyyz   = L_xxyyyz + (D_xxxxyyyz*v112 + D_xxxyyyyz*M_xy + D_xxxyyyzz*M_xz + D_xxyyyyzz*M_yz + &
      D_xxyyyz*M_0 + M_yy*v213 + M_zz*v216)
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    v225       = 0.0416666666666667d0*D_xxyyzzzz
    v227       = 0.166666666666667d0*D_xxyyzzzz
    v276       = 0.0208333333333333d0*D_xxyyzzzz
    v285       = 0.0833333333333333d0*D_xxyyzzzz
    L_xxyy     = L_xxyy + (D_xxxxxxyy*v143 + D_xxxxxyy*v122 + D_xxxxxyyy*v144 + D_xxxxxyyz*v145 + &
      D_xxxxyy*v112 + D_xxxxyyy*v123 + D_xxxxyyyy*v146 + D_xxxxyyyz* &
      v147 + D_xxxxyyz*v124 + D_xxxxyyzz*v148 + D_xxxyyy*M_xy + &
      D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz*M_yz + &
      M_xyy*v162 + M_xyyy*v163 + M_xyyz*v164 + M_xyzz*v161 + M_xzz*v165 &
      + M_xzzz*v166 + M_yy*v217 + M_yyy*v218 + M_yyyy*v219 + M_yyyz* &
      v220 + M_yyz*v221 + M_yyzz*v222 + M_yzz*v214 + M_yzzz*v215 + M_zz &
      *v223 + M_zzz*v224 + M_zzzz*v225)
    L_xxyyz    = L_xxyyz + (D_xxxxxyyz*v122 + D_xxxxyyyz*v123 + D_xxxxyyz*v112 + D_xxxxyyzz*v124 + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz* &
      M_yz + D_xxyyz*M_0 + M_xyy*v164 + M_xzz*v167 + M_yy*v221 + M_yyy* &
      v220 + M_yyz*v210 + M_yzz*v216 + M_zz*v226 + M_zzz*v227)
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    v241       = 0.00833333333333333d0*D_xxyzzzzz
    v246       = 0.0416666666666667d0*D_xxyzzzzz
    L_xxy      = L_xxy + (D_xxxxxxxy*v179 + D_xxxxxxy*v143 + D_xxxxxxyy*v180 + D_xxxxxxyz*v181 + &
      D_xxxxxy*v122 + D_xxxxxyy*v144 + D_xxxxxyyy*v182 + D_xxxxxyyz* &
      v183 + D_xxxxxyz*v145 + D_xxxxxyzz*v184 + D_xxxxy*v112 + D_xxxxyy &
      *v123 + D_xxxxyyy*v146 + D_xxxxyyyy*v185 + D_xxxxyyyz*v186 + &
      D_xxxxyyz*v147 + D_xxxxyyzz*v187 + D_xxxxyz*v124 + D_xxxxyzz*v148 &
      + D_xxxxyzzz*v188 + D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz &
      + D_xxy*M_0 + D_xxyyz*M_yz + M_xyy*v168 + M_xyyy*v169 + M_xyyyy* &
      v170 + M_xyyyz*v171 + M_xyyz*v172 + M_xyyzz*v173 + M_xyzz*v165 + &
      M_xyzzz*v166 + M_xzz*v174 + M_xzzz*v175 + M_xzzzz*v176 + M_yy* &
      v228 + M_yyy*v229 + M_yyyy*v230 + M_yyyyy*v231 + M_yyyyz*v232 + &
      M_yyyz*v233 + M_yyyzz*v234 + M_yyz*v235 + M_yyzz*v236 + M_yyzzz* &
      v237 + M_yzz*v223 + M_yzzz*v224 + M_yzzzz*v225 + M_zz*v238 + &
      M_zzz*v239 + M_zzzz*v240 + M_zzzzz*v241)
    L_xxyz     = L_xxyz + (D_xxxxxxyz*v143 + D_xxxxxyyz*v144 + D_xxxxxyz*v122 + D_xxxxxyzz*v145 + &
      D_xxxxyyyz*v146 + D_xxxxyyz*v123 + D_xxxxyyzz*v147 + D_xxxxyz* &
      v112 + D_xxxxyzz*v124 + D_xxxxyzzz*v148 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz*M_0 + &
      M_xyy*v172 + M_xyyy*v171 + M_xyyz*v161 + M_xyzz*v167 + M_xzz*v177 &
      + M_xzzz*v178 + M_yy*v235 + M_yyy*v233 + M_yyyy*v232 + M_yyyz* &
      v242 + M_yyz*v214 + M_yyzz*v243 + M_yzz*v226 + M_yzzz*v227 + M_zz &
      *v244 + M_zzz*v245 + M_zzzz*v246)
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    v281       = 0.00138888888888889d0*D_xxzzzzzz
    v289       = 0.00833333333333333d0*D_xxzzzzzz
    L_xx       = L_xx + (D_xx*M_0 + D_xxxx*v112 + D_xxxxx*v122 + D_xxxxxx*v143 + D_xxxxxxx*v179 + &
      D_xxxxxxxx*v247 + D_xxxxxxxy*v248 + D_xxxxxxxz*v249 + D_xxxxxxy* &
      v180 + D_xxxxxxyy*v250 + D_xxxxxxyz*v251 + D_xxxxxxz*v181 + &
      D_xxxxxxzz*v252 + D_xxxxxy*v144 + D_xxxxxyy*v182 + D_xxxxxyyy* &
      v253 + D_xxxxxyyz*v254 + D_xxxxxyz*v183 + D_xxxxxyzz*v255 + &
      D_xxxxxz*v145 + D_xxxxxzz*v184 + D_xxxxxzzz*v256 + D_xxxxy*v123 + &
      D_xxxxyy*v146 + D_xxxxyyy*v185 + D_xxxxyyyy*v257 + D_xxxxyyyz* &
      v258 + D_xxxxyyz*v186 + D_xxxxyyzz*v259 + D_xxxxyz*v147 + &
      D_xxxxyzz*v187 + D_xxxxyzzz*v260 + D_xxxxz*v124 + D_xxxxzz*v148 + &
      D_xxxxzzz*v188 + D_xxxxzzzz*v261 + D_xxxy*M_xy + D_xxxyz*M_xyz + &
      D_xxxz*M_xz + D_xxyz*M_yz + M_xyy*v189 + M_xyyy*v190 + M_xyyyy* &
      v191 + M_xyyyyy*v192 + M_xyyyyz*v193 + M_xyyyz*v194 + M_xyyyzz* &
      v195 + M_xyyz*v196 + M_xyyzz*v197 + M_xyyzzz*v198 + M_xyzz*v174 + &
      M_xyzzz*v175 + M_xyzzzz*v176 + M_xzz*v199 + M_xzzz*v200 + M_xzzzz &
      *v201 + M_xzzzzz*v202 + M_yy*v262 + M_yyy*v263 + M_yyyy*v264 + &
      M_yyyyy*v265 + M_yyyyyy*v266 + M_yyyyyz*v267 + M_yyyyz*v268 + &
      M_yyyyzz*v269 + M_yyyz*v270 + M_yyyzz*v271 + M_yyyzzz*v272 + &
      M_yyz*v273 + M_yyzz*v274 + M_yyzzz*v275 + M_yyzzzz*v276 + M_yzz* &
      v238 + M_yzzz*v239 + M_yzzzz*v240 + M_yzzzzz*v241 + M_zz*v277 + &
      M_zzz*v278 + M_zzzz*v279 + M_zzzzz*v280 + M_zzzzzz*v281)
    L_xxz      = L_xxz + (D_xxxxxxxz*v179 + D_xxxxxxyz*v180 + D_xxxxxxz*v143 + D_xxxxxxzz*v181 + &
      D_xxxxxyyz*v182 + D_xxxxxyz*v144 + D_xxxxxyzz*v183 + D_xxxxxz* &
      v122 + D_xxxxxzz*v145 + D_xxxxxzzz*v184 + D_xxxxyyyz*v185 + &
      D_xxxxyyz*v146 + D_xxxxyyzz*v186 + D_xxxxyz*v123 + D_xxxxyzz*v147 &
      + D_xxxxyzzz*v187 + D_xxxxz*v112 + D_xxxxzz*v124 + D_xxxxzzz*v148 &
      + D_xxxxzzzz*v188 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz &
      + D_xxyzz*M_yz + D_xxz*M_0 + M_xyy*v196 + M_xyyy*v194 + M_xyyyy* &
      v193 + M_xyyyz*v203 + M_xyyz*v165 + M_xyyzz*v204 + M_xyzz*v177 + &
      M_xyzzz*v178 + M_xzz*v205 + M_xzzz*v206 + M_xzzzz*v207 + M_yy* &
      v273 + M_yyy*v270 + M_yyyy*v268 + M_yyyyy*v267 + M_yyyyz*v282 + &
      M_yyyz*v283 + M_yyyzz*v237 + M_yyz*v223 + M_yyzz*v284 + M_yyzzz* &
      v285 + M_yzz*v244 + M_yzzz*v245 + M_yzzzz*v246 + M_zz*v286 + &
      M_zzz*v287 + M_zzzz*v288 + M_zzzzz*v289)
    D_xyyyyyyy = v102*v290
    L_xyyyyyyy = L_xyyyyyyy + (D_xyyyyyyy*M_0)
    D_xyyyyyyz = v118*(v111 + 467775.0d0*v410 + 155925.0d0*(-13.0d0*v411 + 13.0d0*v68))
    v294       = 0.5d0*D_xyyyyyyz
    v299       = 0.166666666666667d0*D_xyyyyyyz
    v308       = 0.0416666666666667d0*D_xyyyyyyz
    v324       = 0.00833333333333333d0*D_xyyyyyyz
    L_xyyyyyyz = L_xyyyyyyz + (D_xyyyyyyz*M_0)
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    v292       = 0.5d0*D_xyyyyyzz
    v301       = 0.25d0*D_xyyyyyzz
    v310       = 0.0833333333333333d0*D_xyyyyyzz
    v318       = 0.166666666666667d0*D_xyyyyyzz
    v326       = 0.0208333333333333d0*D_xyyyyyzz
    v339       = 0.0416666666666667d0*D_xyyyyyzz
    L_xyyyyy   = L_xyyyyy + (D_xxxyyyyy*v112 + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + D_xyyyyy*M_0 + &
      D_xyyyyyyy*v291 + D_xyyyyyyz*M_yz + M_zz*v292)
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    v296       = 0.166666666666667d0*D_xyyyyzzz
    v297       = 0.5d0*D_xyyyyzzz
    v313       = 0.0833333333333333d0*D_xyyyyzzz
    v319       = 0.25d0*D_xyyyyzzz
    v329       = 0.0277777777777778d0*D_xyyyyzzz
    L_xyyyy    = L_xyyyy + (D_xxxxyyyy*v122 + D_xxxyyyy*v112 + D_xxxyyyyy*v123 + D_xxxyyyyz*v124 + &
      D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 &
      + D_xyyyyyy*v291 + D_xyyyyyyy*v293 + D_xyyyyyz*M_yz + M_xyy*v209 &
      + M_xzz*v210 + M_yyz*v294 + M_yzz*v292 + M_zz*v295 + M_zzz*v296)
    L_xyyyyz   = L_xyyyyz + (D_xxxyyyyz*v112 + D_xxyyyyyz*M_xy + D_xxyyyyzz*M_xz + D_xyyyyyyz*v291 + &
      D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + M_zz*v297)
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    v304       = 0.0416666666666667d0*D_xyyyzzzz
    v306       = 0.166666666666667d0*D_xyyyzzzz
    v333       = 0.0208333333333333d0*D_xyyyzzzz
    v342       = 0.0833333333333333d0*D_xyyyzzzz
    L_xyyy     = L_xyyy + (D_xxxxxyyy*v143 + D_xxxxyyy*v122 + D_xxxxyyyy*v144 + D_xxxxyyyz*v145 + &
      D_xxxyyy*v112 + D_xxxyyyy*v123 + D_xxxyyyyy*v146 + D_xxxyyyyz* &
      v147 + D_xxxyyyz*v124 + D_xxxyyyzz*v148 + D_xxyyyy*M_xy + &
      D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy*v291 + &
      D_xyyyyyy*v293 + D_xyyyyyyy*v298 + D_xyyyyz*M_yz + M_xyy*v211 + &
      M_xyyy*v212 + M_xyyz*v213 + M_xyzz*v210 + M_xzz*v214 + M_xzzz* &
      v215 + M_yyyz*v299 + M_yyz*v300 + M_yyzz*v301 + M_yzz*v295 + &
      M_yzzz*v296 + M_zz*v302 + M_zzz*v303 + M_zzzz*v304)
    L_xyyyz    = L_xyyyz + (D_xxxxyyyz*v122 + D_xxxyyyyz*v123 + D_xxxyyyz*v112 + D_xxxyyyzz*v124 + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyyyz* &
      v293 + D_xyyyyyz*v291 + D_xyyyyzz*M_yz + D_xyyyz*M_0 + M_xyy*v213 &
      + M_xzz*v216 + M_yyz*v292 + M_yzz*v297 + M_zz*v305 + M_zzz*v306)
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    v317       = 0.00833333333333333d0*D_xyyzzzzz
    v322       = 0.0416666666666667d0*D_xyyzzzzz
    L_xyy      = L_xyy + (D_xxxxxxyy*v179 + D_xxxxxyy*v143 + D_xxxxxyyy*v180 + D_xxxxxyyz*v181 + &
      D_xxxxyy*v122 + D_xxxxyyy*v144 + D_xxxxyyyy*v182 + D_xxxxyyyz* &
      v183 + D_xxxxyyz*v145 + D_xxxxyyzz*v184 + D_xxxyy*v112 + D_xxxyyy &
      *v123 + D_xxxyyyy*v146 + D_xxxyyyyy*v185 + D_xxxyyyyz*v186 + &
      D_xxxyyyz*v147 + D_xxxyyyzz*v187 + D_xxxyyz*v124 + D_xxxyyzz*v148 &
      + D_xxxyyzzz*v188 + D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz &
      + D_xyy*M_0 + D_xyyyy*v291 + D_xyyyyy*v293 + D_xyyyyyy*v298 + &
      D_xyyyyyyy*v307 + D_xyyyz*M_yz + M_xyy*v217 + M_xyyy*v218 + &
      M_xyyyy*v219 + M_xyyyz*v220 + M_xyyz*v221 + M_xyyzz*v222 + M_xyzz &
      *v214 + M_xyzzz*v215 + M_xzz*v223 + M_xzzz*v224 + M_xzzzz*v225 + &
      M_yyyyz*v308 + M_yyyz*v309 + M_yyyzz*v310 + M_yyz*v311 + M_yyzz* &
      v312 + M_yyzzz*v313 + M_yzz*v302 + M_yzzz*v303 + M_yzzzz*v304 + &
      M_zz*v314 + M_zzz*v315 + M_zzzz*v316 + M_zzzzz*v317)
    L_xyyz     = L_xyyz + (D_xxxxxyyz*v143 + D_xxxxyyyz*v144 + D_xxxxyyz*v122 + D_xxxxyyzz*v145 + &
      D_xxxyyyyz*v146 + D_xxxyyyz*v123 + D_xxxyyyzz*v147 + D_xxxyyz* &
      v112 + D_xxxyyzz*v124 + D_xxxyyzzz*v148 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyyz*v298 + D_xyyyyyz* &
      v293 + D_xyyyyz*v291 + D_xyyyzz*M_yz + D_xyyz*M_0 + M_xyy*v221 + &
      M_xyyy*v220 + M_xyyz*v210 + M_xyzz*v216 + M_xzz*v226 + M_xzzz* &
      v227 + M_yyyz*v318 + M_yyz*v295 + M_yyzz*v319 + M_yzz*v305 + &
      M_yzzz*v306 + M_zz*v320 + M_zzz*v321 + M_zzzz*v322)
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    v338       = 0.00138888888888889d0*D_xyzzzzzz
    v346       = 0.00833333333333333d0*D_xyzzzzzz
    L_xy       = L_xy + (D_xxxxxxxy*v247 + D_xxxxxxy*v179 + D_xxxxxxyy*v248 + D_xxxxxxyz*v249 + &
      D_xxxxxy*v143 + D_xxxxxyy*v180 + D_xxxxxyyy*v250 + D_xxxxxyyz* &
      v251 + D_xxxxxyz*v181 + D_xxxxxyzz*v252 + D_xxxxy*v122 + D_xxxxyy &
      *v144 + D_xxxxyyy*v182 + D_xxxxyyyy*v253 + D_xxxxyyyz*v254 + &
      D_xxxxyyz*v183 + D_xxxxyyzz*v255 + D_xxxxyz*v145 + D_xxxxyzz*v184 &
      + D_xxxxyzzz*v256 + D_xxxy*v112 + D_xxxyy*v123 + D_xxxyyy*v146 + &
      D_xxxyyyy*v185 + D_xxxyyyyy*v257 + D_xxxyyyyz*v258 + D_xxxyyyz* &
      v186 + D_xxxyyyzz*v259 + D_xxxyyz*v147 + D_xxxyyzz*v187 + &
      D_xxxyyzzz*v260 + D_xxxyz*v124 + D_xxxyzz*v148 + D_xxxyzzz*v188 + &
      D_xxxyzzzz*v261 + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + &
      D_xy*M_0 + D_xyyy*v291 + D_xyyyy*v293 + D_xyyyyy*v298 + D_xyyyyyy &
      *v307 + D_xyyyyyyy*v323 + D_xyyz*M_yz + M_xyy*v228 + M_xyyy*v229 &
      + M_xyyyy*v230 + M_xyyyyy*v231 + M_xyyyyz*v232 + M_xyyyz*v233 + &
      M_xyyyzz*v234 + M_xyyz*v235 + M_xyyzz*v236 + M_xyyzzz*v237 + &
      M_xyzz*v223 + M_xyzzz*v224 + M_xyzzzz*v225 + M_xzz*v238 + M_xzzz* &
      v239 + M_xzzzz*v240 + M_xzzzzz*v241 + M_yyyyyz*v324 + M_yyyyz* &
      v325 + M_yyyyzz*v326 + M_yyyz*v327 + M_yyyzz*v328 + M_yyyzzz*v329 &
      + M_yyz*v330 + M_yyzz*v331 + M_yyzzz*v332 + M_yyzzzz*v333 + M_yzz &
      *v314 + M_yzzz*v315 + M_yzzzz*v316 + M_yzzzzz*v317 + M_zz*v334 + &
      M_zzz*v335 + M_zzzz*v336 + M_zzzzz*v337 + M_zzzzzz*v338)
    L_xyz      = L_xyz + (D_xxxxxxyz*v179 + D_xxxxxyyz*v180 + D_xxxxxyz*v143 + D_xxxxxyzz*v181 + &
      D_xxxxyyyz*v182 + D_xxxxyyz*v144 + D_xxxxyyzz*v183 + D_xxxxyz* &
      v122 + D_xxxxyzz*v145 + D_xxxxyzzz*v184 + D_xxxyyyyz*v185 + &
      D_xxxyyyz*v146 + D_xxxyyyzz*v186 + D_xxxyyz*v123 + D_xxxyyzz*v147 &
      + D_xxxyyzzz*v187 + D_xxxyz*v112 + D_xxxyzz*v124 + D_xxxyzzz*v148 &
      + D_xxxyzzzz*v188 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz &
      + D_xyyyyyyz*v307 + D_xyyyyyz*v298 + D_xyyyyz*v293 + D_xyyyz*v291 &
      + D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v235 + M_xyyy*v233 + M_xyyyy* &
      v232 + M_xyyyz*v242 + M_xyyz*v214 + M_xyyzz*v243 + M_xyzz*v226 + &
      M_xyzzz*v227 + M_xzz*v244 + M_xzzz*v245 + M_xzzzz*v246 + M_yyyyz* &
      v339 + M_yyyz*v340 + M_yyyzz*v313 + M_yyz*v302 + M_yyzz*v341 + &
      M_yyzzz*v342 + M_yzz*v320 + M_yzzz*v321 + M_yzzzz*v322 + M_zz* &
      v343 + M_zzz*v344 + M_zzzz*v345 + M_zzzzz*v346)
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = L_x + (D_x*M_0 + D_xxx*v112 + D_xxxx*v122 + D_xxxxx*v143 + D_xxxxxx*v179 + &
      D_xxxxxxx*v247 + D_xxxxxxxx*v347 + D_xxxxxxxy*v348 + D_xxxxxxxz* &
      v349 + D_xxxxxxy*v248 + D_xxxxxxyy*v350 + D_xxxxxxyz*v351 + &
      D_xxxxxxz*v249 + D_xxxxxxzz*v352 + D_xxxxxy*v180 + D_xxxxxyy*v250 &
      + D_xxxxxyyy*v353 + D_xxxxxyyz*v354 + D_xxxxxyz*v251 + D_xxxxxyzz &
      *v355 + D_xxxxxz*v181 + D_xxxxxzz*v252 + D_xxxxxzzz*v356 + &
      D_xxxxy*v144 + D_xxxxyy*v182 + D_xxxxyyy*v253 + D_xxxxyyyy*v357 + &
      D_xxxxyyyz*v358 + D_xxxxyyz*v254 + D_xxxxyyzz*v359 + D_xxxxyz* &
      v183 + D_xxxxyzz*v255 + D_xxxxyzzz*v360 + D_xxxxz*v145 + D_xxxxzz &
      *v184 + D_xxxxzzz*v256 + D_xxxxzzzz*v361 + D_xxxy*v123 + D_xxxyy* &
      v146 + D_xxxyyy*v185 + D_xxxyyyy*v257 + D_xxxyyyyy*v362 + &
      D_xxxyyyyz*v363 + D_xxxyyyz*v258 + D_xxxyyyzz*v364 + D_xxxyyz* &
      v186 + D_xxxyyzz*v259 + D_xxxyyzzz*v365 + D_xxxyz*v147 + D_xxxyzz &
      *v187 + D_xxxyzzz*v260 + D_xxxyzzzz*v366 + D_xxxz*v124 + D_xxxzz* &
      v148 + D_xxxzzz*v188 + D_xxxzzzz*v261 + D_xxxzzzzz*v367 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v291 + D_xyyy*v293 + &
      D_xyyyy*v298 + D_xyyyyy*v307 + D_xyyyyyy*v323 + D_xyyyyyyy*v368 + &
      D_xyyyyyyz*v369 + D_xyyyyyz*v370 + D_xyyyyyzz*v371 + D_xyyyyz* &
      v372 + D_xyyyyzz*v373 + D_xyyyyzzz*v374 + D_xyyyz*v375 + D_xyyyzz &
      *v376 + D_xyyyzzz*v377 + D_xyyyzzzz*v378 + D_xyyz*v379 + D_xyyzz* &
      v380 + D_xyyzzz*v381 + D_xyyzzzz*v382 + D_xyyzzzzz*v383 + D_xyz* &
      M_yz + D_xzz*v384 + D_xzzz*v385 + D_xzzzz*v386 + D_xzzzzz*v387 + &
      D_xzzzzzz*v388 + D_xzzzzzzz*v389 + M_xyy*v262 + M_xyyy*v263 + &
      M_xyyyy*v264 + M_xyyyyy*v265 + M_xyyyyyy*v266 + M_xyyyyyz*v267 + &
      M_xyyyyz*v268 + M_xyyyyzz*v269 + M_xyyyz*v270 + M_xyyyzz*v271 + &
      M_xyyyzzz*v272 + M_xyyz*v273 + M_xyyzz*v274 + M_xyyzzz*v275 + &
      M_xyyzzzz*v276 + M_xyzz*v238 + M_xyzzz*v239 + M_xyzzzz*v240 + &
      M_xyzzzzz*v241 + M_xzz*v277 + M_xzzz*v278 + M_xzzzz*v279 + &
      M_xzzzzz*v280 + M_xzzzzzz*v281 + M_yzz*v334 + M_yzzz*v335 + &
      M_yzzzz*v336 + M_yzzzzz*v337 + M_yzzzzzz*v338)
    L_xz       = L_xz + (D_xxxxxxxz*v247 + D_xxxxxxyz*v248 + D_xxxxxxz*v179 + D_xxxxxxzz*v249 + &
      D_xxxxxyyz*v250 + D_xxxxxyz*v180 + D_xxxxxyzz*v251 + D_xxxxxz* &
      v143 + D_xxxxxzz*v181 + D_xxxxxzzz*v252 + D_xxxxyyyz*v253 + &
      D_xxxxyyz*v182 + D_xxxxyyzz*v254 + D_xxxxyz*v144 + D_xxxxyzz*v183 &
      + D_xxxxyzzz*v255 + D_xxxxz*v122 + D_xxxxzz*v145 + D_xxxxzzz*v184 &
      + D_xxxxzzzz*v256 + D_xxxyyyyz*v257 + D_xxxyyyz*v185 + D_xxxyyyzz &
      *v258 + D_xxxyyz*v146 + D_xxxyyzz*v186 + D_xxxyyzzz*v259 + &
      D_xxxyz*v123 + D_xxxyzz*v147 + D_xxxyzzz*v187 + D_xxxyzzzz*v260 + &
      D_xxxz*v112 + D_xxxzz*v124 + D_xxxzzz*v148 + D_xxxzzzz*v188 + &
      D_xxxzzzzz*v261 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + &
      D_xyyyyyyz*v323 + D_xyyyyyz*v307 + D_xyyyyyzz*v370 + D_xyyyyz* &
      v298 + D_xyyyyzz*v372 + D_xyyyyzzz*v373 + D_xyyyz*v293 + D_xyyyzz &
      *v375 + D_xyyyzzz*v376 + D_xyyyzzzz*v377 + D_xyyz*v291 + D_xyyzz* &
      v379 + D_xyyzzz*v380 + D_xyyzzzz*v381 + D_xyyzzzzz*v382 + D_xyzz* &
      M_yz + D_xz*M_0 + D_xzzz*v384 + D_xzzzz*v385 + D_xzzzzz*v386 + &
      D_xzzzzzz*v387 + D_xzzzzzzz*v388 + M_xyy*v273 + M_xyyy*v270 + &
      M_xyyyy*v268 + M_xyyyyy*v267 + M_xyyyyz*v282 + M_xyyyz*v283 + &
      M_xyyyzz*v237 + M_xyyz*v223 + M_xyyzz*v284 + M_xyyzzz*v285 + &
      M_xyzz*v244 + M_xyzzz*v245 + M_xyzzzz*v246 + M_xzz*v286 + M_xzzz* &
      v287 + M_xzzzz*v288 + M_xzzzzz*v289 + M_yzz*v343 + M_yzzz*v344 + &
      M_yzzzz*v345 + M_yzzzzz*v346)
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v208 - (1260.0d0*v131 + v68*v99))
    L_yyyyyyyy = L_yyyyyyyy + (D_yyyyyyyy*M_0)
    D_yyyyyyyz = v133*v290
    L_yyyyyyyz = L_yyyyyyyz + (D_yyyyyyyz*M_0)
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = L_yyyyyy + (D_xxyyyyyy*v112 + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + &
      D_yyyyyyyy*v291 + D_yyyyyyyz*M_yz + D_yyyyyyzz*v384)
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = L_yyyyy + (D_xxxyyyyy*v122 + D_xxyyyyy*v112 + D_xxyyyyyy*v123 + D_xxyyyyyz*v124 + &
      D_xyyyyyy*M_xy + D_xyyyyyyy*v390 + D_xyyyyyyz*M_xyz + D_xyyyyyz* &
      M_xz + D_yyyyy*M_0 + D_yyyyyyy*v291 + D_yyyyyyyy*v293 + &
      D_yyyyyyyz*v379 + D_yyyyyyz*M_yz + D_yyyyyyzz*v391 + D_yyyyyzz* &
      v384 + D_yyyyyzzz*v385 + M_xzz*v292)
    L_yyyyyz   = L_yyyyyz + (D_xxyyyyyz*v112 + D_xyyyyyyz*M_xy + D_xyyyyyzz*M_xz + D_yyyyyyyz*v291 + &
      D_yyyyyyzz*M_yz + D_yyyyyz*M_0 + D_yyyyyzzz*v384)
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = L_yyyy + (D_xxxxyyyy*v143 + D_xxxyyyy*v122 + D_xxxyyyyy*v144 + D_xxxyyyyz*v145 + &
      D_xxyyyy*v112 + D_xxyyyyy*v123 + D_xxyyyyyy*v146 + D_xxyyyyyz* &
      v147 + D_xxyyyyz*v124 + D_xxyyyyzz*v148 + D_xyyyyy*M_xy + &
      D_xyyyyyy*v390 + D_xyyyyyyy*v392 + D_xyyyyyz*M_xyz + D_xyyyyz* &
      M_xz + D_yyyy*M_0 + D_yyyyyy*v291 + D_yyyyyyy*v293 + D_yyyyyyyy* &
      v298 + D_yyyyyyyz*v375 + D_yyyyyyz*v379 + D_yyyyyyzz*v380 + &
      D_yyyyyz*M_yz + D_yyyyyzz*v391 + D_yyyyyzzz*v393 + D_yyyyzz*v384 &
      + D_yyyyzzz*v385 + D_yyyyzzzz*v386 + M_xyyz*v294 + M_xyzz*v292 + &
      M_xzz*v295 + M_xzzz*v296)
    L_yyyyz    = L_yyyyz + (D_xxxyyyyz*v122 + D_xxyyyyyz*v123 + D_xxyyyyz*v112 + D_xxyyyyzz*v124 + &
      D_xyyyyyyz*v390 + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyzz* &
      M_xz + D_yyyyyyyz*v293 + D_yyyyyyz*v291 + D_yyyyyyzz*v379 + &
      D_yyyyyzz*M_yz + D_yyyyyzzz*v391 + D_yyyyz*M_0 + D_yyyyzzz*v384 + &
      D_yyyyzzzz*v385 + M_xzz*v297)
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = L_yyy + (D_xxxxxyyy*v179 + D_xxxxyyy*v143 + D_xxxxyyyy*v180 + D_xxxxyyyz*v181 + &
      D_xxxyyy*v122 + D_xxxyyyy*v144 + D_xxxyyyyy*v182 + D_xxxyyyyz* &
      v183 + D_xxxyyyz*v145 + D_xxxyyyzz*v184 + D_xxyyy*v112 + D_xxyyyy &
      *v123 + D_xxyyyyy*v146 + D_xxyyyyyy*v185 + D_xxyyyyyz*v186 + &
      D_xxyyyyz*v147 + D_xxyyyyzz*v187 + D_xxyyyz*v124 + D_xxyyyzz*v148 &
      + D_xxyyyzzz*v188 + D_xyyyy*M_xy + D_xyyyyy*v390 + D_xyyyyyy*v392 &
      + D_xyyyyyyy*v394 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v291 + D_yyyyyy*v293 + D_yyyyyyy*v298 + D_yyyyyyyy*v307 + &
      D_yyyyyyyz*v372 + D_yyyyyyz*v375 + D_yyyyyyzz*v376 + D_yyyyyz* &
      v379 + D_yyyyyzz*v380 + D_yyyyyzzz*v381 + D_yyyyz*M_yz + D_yyyyzz &
      *v391 + D_yyyyzzz*v393 + D_yyyyzzzz*v395 + D_yyyzz*v384 + &
      D_yyyzzz*v385 + D_yyyzzzz*v386 + D_yyyzzzzz*v387 + M_xyyyz*v299 + &
      M_xyyz*v300 + M_xyyzz*v301 + M_xyzz*v295 + M_xyzzz*v296 + M_xzz* &
      v302 + M_xzzz*v303 + M_xzzzz*v304)
    L_yyyz     = L_yyyz + (D_xxxxyyyz*v143 + D_xxxyyyyz*v144 + D_xxxyyyz*v122 + D_xxxyyyzz*v145 + &
      D_xxyyyyyz*v146 + D_xxyyyyz*v123 + D_xxyyyyzz*v147 + D_xxyyyz* &
      v112 + D_xxyyyzz*v124 + D_xxyyyzzz*v148 + D_xyyyyyyz*v392 + &
      D_xyyyyyz*v390 + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz &
      + D_yyyyyyyz*v298 + D_yyyyyyz*v293 + D_yyyyyyzz*v375 + D_yyyyyz* &
      v291 + D_yyyyyzz*v379 + D_yyyyyzzz*v380 + D_yyyyzz*M_yz + &
      D_yyyyzzz*v391 + D_yyyyzzzz*v393 + D_yyyz*M_0 + D_yyyzzz*v384 + &
      D_yyyzzzz*v385 + D_yyyzzzzz*v386 + M_xyyz*v292 + M_xyzz*v297 + &
      M_xzz*v305 + M_xzzz*v306)
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = L_yy + (D_xxxxxxyy*v247 + D_xxxxxyy*v179 + D_xxxxxyyy*v248 + D_xxxxxyyz*v249 + &
      D_xxxxyy*v143 + D_xxxxyyy*v180 + D_xxxxyyyy*v250 + D_xxxxyyyz* &
      v251 + D_xxxxyyz*v181 + D_xxxxyyzz*v252 + D_xxxyy*v122 + D_xxxyyy &
      *v144 + D_xxxyyyy*v182 + D_xxxyyyyy*v253 + D_xxxyyyyz*v254 + &
      D_xxxyyyz*v183 + D_xxxyyyzz*v255 + D_xxxyyz*v145 + D_xxxyyzz*v184 &
      + D_xxxyyzzz*v256 + D_xxyy*v112 + D_xxyyy*v123 + D_xxyyyy*v146 + &
      D_xxyyyyy*v185 + D_xxyyyyyy*v257 + D_xxyyyyyz*v258 + D_xxyyyyz* &
      v186 + D_xxyyyyzz*v259 + D_xxyyyz*v147 + D_xxyyyzz*v187 + &
      D_xxyyyzzz*v260 + D_xxyyz*v124 + D_xxyyzz*v148 + D_xxyyzzz*v188 + &
      D_xxyyzzzz*v261 + D_xyyy*M_xy + D_xyyyy*v390 + D_xyyyyy*v392 + &
      D_xyyyyyy*v394 + D_xyyyyyyy*v396 + D_xyyyz*M_xyz + D_xyyz*M_xz + &
      D_yy*M_0 + D_yyyy*v291 + D_yyyyy*v293 + D_yyyyyy*v298 + D_yyyyyyy &
      *v307 + D_yyyyyyyy*v323 + D_yyyyyyyz*v370 + D_yyyyyyz*v372 + &
      D_yyyyyyzz*v373 + D_yyyyyz*v375 + D_yyyyyzz*v376 + D_yyyyyzzz* &
      v377 + D_yyyyz*v379 + D_yyyyzz*v380 + D_yyyyzzz*v381 + D_yyyyzzzz &
      *v382 + D_yyyz*M_yz + D_yyyzz*v391 + D_yyyzzz*v393 + D_yyyzzzz* &
      v395 + D_yyyzzzzz*v397 + D_yyzz*v384 + D_yyzzz*v385 + D_yyzzzz* &
      v386 + D_yyzzzzz*v387 + D_yyzzzzzz*v388 + M_xyyyyz*v308 + M_xyyyz &
      *v309 + M_xyyyzz*v310 + M_xyyz*v311 + M_xyyzz*v312 + M_xyyzzz* &
      v313 + M_xyzz*v302 + M_xyzzz*v303 + M_xyzzzz*v304 + M_xzz*v314 + &
      M_xzzz*v315 + M_xzzzz*v316 + M_xzzzzz*v317)
    L_yyz      = L_yyz + (D_xxxxxyyz*v179 + D_xxxxyyyz*v180 + D_xxxxyyz*v143 + D_xxxxyyzz*v181 + &
      D_xxxyyyyz*v182 + D_xxxyyyz*v144 + D_xxxyyyzz*v183 + D_xxxyyz* &
      v122 + D_xxxyyzz*v145 + D_xxxyyzzz*v184 + D_xxyyyyyz*v185 + &
      D_xxyyyyz*v146 + D_xxyyyyzz*v186 + D_xxyyyz*v123 + D_xxyyyzz*v147 &
      + D_xxyyyzzz*v187 + D_xxyyz*v112 + D_xxyyzz*v124 + D_xxyyzzz*v148 &
      + D_xxyyzzzz*v188 + D_xyyyyyyz*v394 + D_xyyyyyz*v392 + D_xyyyyz* &
      v390 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyyz* &
      v307 + D_yyyyyyz*v298 + D_yyyyyyzz*v372 + D_yyyyyz*v293 + &
      D_yyyyyzz*v375 + D_yyyyyzzz*v376 + D_yyyyz*v291 + D_yyyyzz*v379 + &
      D_yyyyzzz*v380 + D_yyyyzzzz*v381 + D_yyyzz*M_yz + D_yyyzzz*v391 + &
      D_yyyzzzz*v393 + D_yyyzzzzz*v395 + D_yyz*M_0 + D_yyzzz*v384 + &
      D_yyzzzz*v385 + D_yyzzzzz*v386 + D_yyzzzzzz*v387 + M_xyyyz*v318 + &
      M_xyyz*v295 + M_xyyzz*v319 + M_xyzz*v305 + M_xyzzz*v306 + M_xzz* &
      v320 + M_xzzz*v321 + M_xzzzz*v322)
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = L_y + (D_xxxxxxxy*v347 + D_xxxxxxy*v247 + D_xxxxxxyy*v348 + D_xxxxxxyz*v349 + &
      D_xxxxxy*v179 + D_xxxxxyy*v248 + D_xxxxxyyy*v350 + D_xxxxxyyz* &
      v351 + D_xxxxxyz*v249 + D_xxxxxyzz*v352 + D_xxxxy*v143 + D_xxxxyy &
      *v180 + D_xxxxyyy*v250 + D_xxxxyyyy*v353 + D_xxxxyyyz*v354 + &
      D_xxxxyyz*v251 + D_xxxxyyzz*v355 + D_xxxxyz*v181 + D_xxxxyzz*v252 &
      + D_xxxxyzzz*v356 + D_xxxy*v122 + D_xxxyy*v144 + D_xxxyyy*v182 + &
      D_xxxyyyy*v253 + D_xxxyyyyy*v357 + D_xxxyyyyz*v358 + D_xxxyyyz* &
      v254 + D_xxxyyyzz*v359 + D_xxxyyz*v183 + D_xxxyyzz*v255 + &
      D_xxxyyzzz*v360 + D_xxxyz*v145 + D_xxxyzz*v184 + D_xxxyzzz*v256 + &
      D_xxxyzzzz*v361 + D_xxy*v112 + D_xxyy*v123 + D_xxyyy*v146 + &
      D_xxyyyy*v185 + D_xxyyyyy*v257 + D_xxyyyyyy*v362 + D_xxyyyyyz* &
      v363 + D_xxyyyyz*v258 + D_xxyyyyzz*v364 + D_xxyyyz*v186 + &
      D_xxyyyzz*v259 + D_xxyyyzzz*v365 + D_xxyyz*v147 + D_xxyyzz*v187 + &
      D_xxyyzzz*v260 + D_xxyyzzzz*v366 + D_xxyz*v124 + D_xxyzz*v148 + &
      D_xxyzzz*v188 + D_xxyzzzz*v261 + D_xxyzzzzz*v367 + D_xyy*M_xy + &
      D_xyyy*v390 + D_xyyyy*v392 + D_xyyyyy*v394 + D_xyyyyyy*v396 + &
      D_xyyyyyyy*v398 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy* &
      v291 + D_yyyy*v293 + D_yyyyy*v298 + D_yyyyyy*v307 + D_yyyyyyy* &
      v323 + D_yyyyyyyy*v368 + D_yyyyyyyz*v369 + D_yyyyyyz*v370 + &
      D_yyyyyyzz*v371 + D_yyyyyz*v372 + D_yyyyyzz*v373 + D_yyyyyzzz* &
      v374 + D_yyyyz*v375 + D_yyyyzz*v376 + D_yyyyzzz*v377 + D_yyyyzzzz &
      *v378 + D_yyyz*v379 + D_yyyzz*v380 + D_yyyzzz*v381 + D_yyyzzzz* &
      v382 + D_yyyzzzzz*v383 + D_yyz*M_yz + D_yyzz*v391 + D_yyzzz*v393 &
      + D_yyzzzz*v395 + D_yyzzzzz*v397 + D_yyzzzzzz*v399 + D_yzz*v384 + &
      D_yzzz*v385 + D_yzzzz*v386 + D_yzzzzz*v387 + D_yzzzzzz*v388 + &
      D_yzzzzzzz*v389 + M_xyyyyyz*v324 + M_xyyyyz*v325 + M_xyyyyzz*v326 &
      + M_xyyyz*v327 + M_xyyyzz*v328 + M_xyyyzzz*v329 + M_xyyz*v330 + &
      M_xyyzz*v331 + M_xyyzzz*v332 + M_xyyzzzz*v333 + M_xyzz*v314 + &
      M_xyzzz*v315 + M_xyzzzz*v316 + M_xyzzzzz*v317 + M_xzz*v334 + &
      M_xzzz*v335 + M_xzzzz*v336 + M_xzzzzz*v337 + M_xzzzzzz*v338)
    L_yz       = L_yz + (D_xxxxxxyz*v247 + D_xxxxxyyz*v248 + D_xxxxxyz*v179 + D_xxxxxyzz*v249 + &
      D_xxxxyyyz*v250 + D_xxxxyyz*v180 + D_xxxxyyzz*v251 + D_xxxxyz* &
      v143 + D_xxxxyzz*v181 + D_xxxxyzzz*v252 + D_xxxyyyyz*v253 + &
      D_xxxyyyz*v182 + D_xxxyyyzz*v254 + D_xxxyyz*v144 + D_xxxyyzz*v183 &
      + D_xxxyyzzz*v255 + D_xxxyz*v122 + D_xxxyzz*v145 + D_xxxyzzz*v184 &
      + D_xxxyzzzz*v256 + D_xxyyyyyz*v257 + D_xxyyyyz*v185 + D_xxyyyyzz &
      *v258 + D_xxyyyz*v146 + D_xxyyyzz*v186 + D_xxyyyzzz*v259 + &
      D_xxyyz*v123 + D_xxyyzz*v147 + D_xxyyzzz*v187 + D_xxyyzzzz*v260 + &
      D_xxyz*v112 + D_xxyzz*v124 + D_xxyzzz*v148 + D_xxyzzzz*v188 + &
      D_xxyzzzzz*v261 + D_xyyyyyyz*v396 + D_xyyyyyz*v394 + D_xyyyyz* &
      v392 + D_xyyyz*v390 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + &
      D_yyyyyyyz*v323 + D_yyyyyyz*v307 + D_yyyyyyzz*v370 + D_yyyyyz* &
      v298 + D_yyyyyzz*v372 + D_yyyyyzzz*v373 + D_yyyyz*v293 + D_yyyyzz &
      *v375 + D_yyyyzzz*v376 + D_yyyyzzzz*v377 + D_yyyz*v291 + D_yyyzz* &
      v379 + D_yyyzzz*v380 + D_yyyzzzz*v381 + D_yyyzzzzz*v382 + D_yyzz* &
      M_yz + D_yyzzz*v391 + D_yyzzzz*v393 + D_yyzzzzz*v395 + D_yyzzzzzz &
      *v397 + D_yz*M_0 + D_yzzz*v384 + D_yzzzz*v385 + D_yzzzzz*v386 + &
      D_yzzzzzz*v387 + D_yzzzzzzz*v388 + M_xyyyyz*v339 + M_xyyyz*v340 + &
      M_xyyyzz*v313 + M_xyyz*v302 + M_xyyzz*v341 + M_xyyzzz*v342 + &
      M_xyzz*v320 + M_xyzzz*v321 + M_xyzzzz*v322 + M_xzz*v343 + M_xzzz* &
      v344 + M_xzzzz*v345 + M_xzzzzz*v346)
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_z        = L_z + (0.00138888888888889d0*(20.0d0*D_xyyyzzzz*M_xyyyzzz + 180.0d0*D_xyyzzz* &
      M_xyyzz + 60.0d0*D_xyyzzzz*M_xyyzzz + 360.0d0*D_xzzz*M_xzz + &
      D_xzzzzzzz*M_xzzzzzz + 6.0d0*(D_xyyyyyzz*M_xyyyyyz + D_xzzzzzz* &
      M_xzzzzz) + 30.0d0*(D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + &
      15.0d0*(D_xyyyyzzz*M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz) + 120.0d0*( &
      D_xyyyzz*M_xyyyz + D_xzzzz*M_xzzz)) + D_xxxxxxxz*v347 + &
      D_xxxxxxyz*v348 + D_xxxxxxz*v247 + D_xxxxxxzz*v349 + D_xxxxxyyz* &
      v350 + D_xxxxxyz*v248 + D_xxxxxyzz*v351 + D_xxxxxz*v179 + &
      D_xxxxxzz*v249 + D_xxxxxzzz*v352 + D_xxxxyyyz*v353 + D_xxxxyyz* &
      v250 + D_xxxxyyzz*v354 + D_xxxxyz*v180 + D_xxxxyzz*v251 + &
      D_xxxxyzzz*v355 + D_xxxxz*v143 + D_xxxxzz*v181 + D_xxxxzzz*v252 + &
      D_xxxxzzzz*v356 + D_xxxyyyyz*v357 + D_xxxyyyz*v253 + D_xxxyyyzz* &
      v358 + D_xxxyyz*v182 + D_xxxyyzz*v254 + D_xxxyyzzz*v359 + D_xxxyz &
      *v144 + D_xxxyzz*v183 + D_xxxyzzz*v255 + D_xxxyzzzz*v360 + D_xxxz &
      *v122 + D_xxxzz*v145 + D_xxxzzz*v184 + D_xxxzzzz*v256 + &
      D_xxxzzzzz*v361 + D_xxyyyyyz*v362 + D_xxyyyyz*v257 + D_xxyyyyzz* &
      v363 + D_xxyyyz*v185 + D_xxyyyzz*v258 + D_xxyyyzzz*v364 + D_xxyyz &
      *v146 + D_xxyyzz*v186 + D_xxyyzzz*v259 + D_xxyyzzzz*v365 + D_xxyz &
      *v123 + D_xxyzz*v147 + D_xxyzzz*v187 + D_xxyzzzz*v260 + &
      D_xxyzzzzz*v366 + D_xxz*v112 + D_xxzz*v124 + D_xxzzz*v148 + &
      D_xxzzzz*v188 + D_xxzzzzz*v261 + D_xxzzzzzz*v367 + D_xyyyyyyz* &
      v398 + D_xyyyyyz*v396 + D_xyyyyz*v394 + D_xyyyz*v392 + D_xyyz* &
      v390 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyyyyyz*v368 + &
      D_yyyyyyz*v323 + D_yyyyyyzz*v369 + D_yyyyyz*v307 + D_yyyyyzz*v370 &
      + D_yyyyyzzz*v371 + D_yyyyz*v298 + D_yyyyzz*v372 + D_yyyyzzz*v373 &
      + D_yyyyzzzz*v374 + D_yyyz*v293 + D_yyyzz*v375 + D_yyyzzz*v376 + &
      D_yyyzzzz*v377 + D_yyyzzzzz*v378 + D_yyz*v291 + D_yyzz*v379 + &
      D_yyzzz*v380 + D_yyzzzz*v381 + D_yyzzzzz*v382 + D_yyzzzzzz*v383 + &
      D_yzz*M_yz + D_yzzz*v391 + D_yzzzz*v393 + D_yzzzzz*v395 + &
      D_yzzzzzz*v397 + D_yzzzzzzz*v399 + D_z*M_0 + D_zzz*v384 + D_zzzz* &
      v385 + D_zzzzz*v386 + D_zzzzzz*v387 + D_zzzzzzz*v388 + D_zzzzzzzz &
      *v389 + M_xyyyzz*v332 + M_xyyz*v314 + M_xyzz*v343 + M_xyzzz*v344 &
      + M_xyzzzz*v345 + M_xyzzzzz*v346)
#undef  y                   
#undef  L_x                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  M_xx                
#undef  L_y                 
#undef  L_z                 
#undef  M_xy                
#undef  L_xx                
#undef  M_xz                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  L_xxx               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xyz               
#undef  L_xyy               
#undef  M_yyy               
#undef  M_yyz               
#undef  L_xyz               
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
#undef  L_xxyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xxyz              
#undef  M_yyyy              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  M_yyyz              
#undef  L_yyyy              
#undef  M_xxxxx             
#undef  L_yyyz              
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xxxyy             
#undef  L_xxxxz             
#undef  M_xxxyz             
#undef  L_xxxyy             
#undef  M_xxyyy             
#undef  L_xxxyz             
#undef  M_xxyyz             
#undef  L_xxyyy             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  M_yyyyy             
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
#undef  L_xxxxyy            
#undef  M_xxxyyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
#undef  M_xyyyyy            
#undef  L_xxyyyy            
#undef  M_xyyyyz            
#undef  L_xxyyyz            
#undef  M_yyyyyy            
#undef  L_xyyyyy            
#undef  M_yyyyyz            
#undef  L_xyyyyz            
#undef  M_xxxxxxx           
#undef  L_yyyyyy            
#undef  M_xxxxxxy           
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  L_xxxxxxy           
#undef  M_xxxxxyz           
#undef  L_xxxxxxz           
#undef  M_xxxxyyy           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_xxxxyyz           
#undef  L_xxxxyyy           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  M_xxyyyyy           
#undef  L_xxxyyyz           
#undef  M_xxyyyyz           
#undef  L_xxyyyyy           
#undef  M_xyyyyyy           
#undef  L_xxyyyyz           
#undef  M_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  M_yyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  L_xxxxxxxx          
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  L_xxxxxxyz          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  L_yyyyyyyz          
    end subroutine mom_es_M2L_add
    
! OPS  870*ADD + 2*DIV + 1004*MUL + 84*NEG + POW = 1961  (6417 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz,&
                L_xxxxxxzz, L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz,&
                L_xxxxzzzz, L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz,&
                L_xxyyyyzz, L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz,&
                L_xyyyyyzz, L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz,&
                L_xzzzzzzz, L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz,&
                L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
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
#define L_yy                 L(6)
#define Ls_yy                Ls(6)
#define Ls_yz                Ls(7)
#define L_yz                 L(7)
#define Ls_xxx               Ls(8)
#define L_xxx                L(8)
#define Ls_xxy               Ls(9)
#define L_xxy                L(9)
#define Ls_xxz               Ls(10)
#define L_xxz                L(10)
#define Ls_xyy               Ls(11)
#define L_xyy                L(11)
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
#define L_yyyyy              L(33)
#define Ls_yyyyy             Ls(33)
#define L_yyyyz              L(34)
#define Ls_yyyyz             Ls(34)
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
#define L_xxxyyz             L(41)
#define Ls_xxxyyz            Ls(41)
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
#define Ls_xxxxyyy           Ls(53)
#define L_xxxxyyy            L(53)
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
#define L_xxxxxxxx           L(63)
#define Ls_xxxxxxxx          Ls(63)
#define Ls_xxxxxxxy          Ls(64)
#define L_xxxxxxxy           L(64)
#define Ls_xxxxxxxz          Ls(65)
#define L_xxxxxxxz           L(65)
#define Ls_xxxxxxyy          Ls(66)
#define L_xxxxxxyy           L(66)
#define Ls_xxxxxxyz          Ls(67)
#define L_xxxxxxyz           L(67)
#define Ls_xxxxxyyy          Ls(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define Ls_xxxxxyyz          Ls(69)
#define Ls_xxxxyyyy          Ls(70)
#define L_xxxxyyyy           L(70)
#define L_xxxxyyyz           L(71)
#define Ls_xxxxyyyz          Ls(71)
#define Ls_xxxyyyyy          Ls(72)
#define L_xxxyyyyy           L(72)
#define Ls_xxxyyyyz          Ls(73)
#define L_xxxyyyyz           L(73)
#define L_xxyyyyyy           L(74)
#define Ls_xxyyyyyy          Ls(74)
#define Ls_xxyyyyyz          Ls(75)
#define L_xxyyyyyz           L(75)
#define L_xyyyyyyy           L(76)
#define Ls_xyyyyyyy          Ls(76)
#define Ls_xyyyyyyz          Ls(77)
#define L_xyyyyyyz           L(77)
#define L_yyyyyyyy           L(78)
#define Ls_yyyyyyyy          Ls(78)
#define Ls_yyyyyyyz          Ls(79)
#define L_yyyyyyyz           L(79)
    v0          = L_xxxxxxx + L_xxxxxxxy*y + L_xxxxxxxz*z
    v1          = L_xxxxxxy + L_xxxxxxyz*z
    v2          = L_xxxxxxyy*y + v1
    v3          = L_xxxxxyy + L_xxxxxyyz*z
    v4          = L_xxxxxyyy*y + v3
    v5          = L_xxxxyyy + L_xxxxyyyz*z
    v6          = L_xxxxyyyy*y + v5
    v7          = L_xxxyyyy + L_xxxyyyyz*z
    v8          = L_xxxyyyyy*y + v7
    v9          = L_xxyyyyy + L_xxyyyyyz*z
    v10         = L_xxyyyyyy*y + v9
    v11         = L_xyyyyyy + L_xyyyyyyz*z
    v12         = L_xyyyyyyy*y + v11
    v13         = L_yyyyyyy + L_yyyyyyyz*z
    v14         = L_xxxxxxz*z
    v21         = v1*y
    v23         = L_xxxxxyz*z
    v26         = v3*y
    v29         = L_xxxxxz*z
    v40         = 0.5d0*x
    v46         = L_xxxxyyz*z
    v49         = v5*y
    v52         = L_xxxxyz*z
    v63         = L_xxxxz*z
    v77         = 0.166666666666667d0*x
    v87         = L_xxxyyyz*z
    v90         = v7*y
    v93         = L_xxxyyz*z
    v104        = L_xxxyz*z
    v120        = L_xxxz*z
    v137        = 0.0416666666666667d0*x
    v149        = L_xxyyyyz*z
    v152        = v9*y
    v155        = L_xxyyyz*z
    v166        = L_xxyyz*z
    v182        = L_xxyz*z
    v202        = L_xxz*z
    v221        = 0.00833333333333333d0*x
    v235        = L_xyyyyyz*z
    v238        = v11*y
    v241        = L_xyyyyz*z
    v252        = L_xyyyz*z
    v268        = L_xyyz*z
    v288        = L_xyz*z
    v326        = 0.00138888888888889d0*y
    v331        = 0.00138888888888889d0*x
    v342        = L_yyyyyyz*z
    v345        = L_yyyyyz*z
    v347        = 0.5d0*y
    v351        = L_yyyyz*z
    v354        = 0.166666666666667d0*y
    v360        = L_yyyz*z
    v364        = 0.0416666666666667d0*y
    v371        = L_yyz*z
    v376        = 0.00833333333333333d0*y
    Ls_xxxxxxx  = Ls_xxxxxxx + (L_xxxxxxxx*x + v0)
    Ls_xxxxxxy  = Ls_xxxxxxy + (L_xxxxxxxy*x + v2)
    Ls_xxxxxyy  = Ls_xxxxxyy + (L_xxxxxxyy*x + v4)
    Ls_xxxxyyy  = Ls_xxxxyyy + (L_xxxxxyyy*x + v6)
    Ls_xxxyyyy  = Ls_xxxyyyy + (L_xxxxyyyy*x + v8)
    Ls_xxyyyyy  = Ls_xxyyyyy + (L_xxxyyyyy*x + v10)
    Ls_xyyyyyy  = Ls_xyyyyyy + (L_xxyyyyyy*x + v12)
    Ls_yyyyyyy  = Ls_yyyyyyy + (v13 + L_xyyyyyyy*x + L_yyyyyyyy*y)
    Ls_xxxxxxxx = Ls_xxxxxxxx + (L_xxxxxxxx)
    Ls_xxxxxxxy = Ls_xxxxxxxy + (L_xxxxxxxy)
    Ls_xxxxxxxz = Ls_xxxxxxxz + (L_xxxxxxxz)
    Ls_xxxxxxyy = Ls_xxxxxxyy + (L_xxxxxxyy)
    Ls_xxxxxxyz = Ls_xxxxxxyz + (L_xxxxxxyz)
    Ls_xxxxxyyy = Ls_xxxxxyyy + (L_xxxxxyyy)
    Ls_xxxxxyyz = Ls_xxxxxyyz + (L_xxxxxyyz)
    Ls_xxxxyyyy = Ls_xxxxyyyy + (L_xxxxyyyy)
    Ls_xxxxyyyz = Ls_xxxxyyyz + (L_xxxxyyyz)
    Ls_xxxyyyyy = Ls_xxxyyyyy + (L_xxxyyyyy)
    Ls_xxxyyyyz = Ls_xxxyyyyz + (L_xxxyyyyz)
    Ls_xxyyyyyy = Ls_xxyyyyyy + (L_xxyyyyyy)
    Ls_xxyyyyyz = Ls_xxyyyyyz + (L_xxyyyyyz)
    Ls_xyyyyyyy = Ls_xyyyyyyy + (L_xyyyyyyy)
    Ls_xyyyyyyz = Ls_xyyyyyyz + (L_xyyyyyyz)
    Ls_yyyyyyyy = Ls_yyyyyyyy + (L_yyyyyyyy)
    Ls_yyyyyyyz = Ls_yyyyyyyz + (L_yyyyyyyz)
    L_zz        = -(L_xx + L_yy)
    L_xzz       = -(L_xxx + L_xyy)
    v333        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v388        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    v224        = L_xxzz*z
    L_xyzz      = -(L_xxxy + L_xyyy)
    v301        = L_xyzz*z
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    v381        = L_yyzz*z
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    v140        = L_xxxzz*z
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    v193        = L_xxyzz*z
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    v279        = L_xyyzz*z
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    v368        = L_yyyzz*z
    L_yyzzz     = -(L_xxyyz + L_yyyyz)
    L_yzzzz     = -(L_xxyzz + L_yyyzz)
    L_zzzzz     = -(L_xxzzz + L_yyzzz)
    L_xxxxzz    = -(L_xxxxxx + L_xxxxyy)
    v80         = L_xxxxzz*z
    L_xxxyzz    = -(L_xxxxxy + L_xxxyyy)
    v113        = L_xxxyzz*z
    L_xxxzzz    = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz    = -(L_xxxxyy + L_xxyyyy)
    v175        = L_xxyyzz*z
    L_xxyzzz    = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz    = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz    = -(L_xxxyyy + L_xyyyyy)
    v261        = L_xyyyzz*z
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    v357        = L_yyyyzz*z
    L_yyyzzz    = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz    = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz    = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz    = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz   = -(L_xxxxxxx + L_xxxxxyy)
    v42         = L_xxxxxzz*z
    L_xxxxyzz   = -(L_xxxxxxy + L_xxxxyyy)
    v59         = L_xxxxyzz*z
    L_xxxxzzz   = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz   = -(L_xxxxxyy + L_xxxyyyy)
    v100        = L_xxxyyzz*z
    L_xxxyzzz   = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz   = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz   = -(L_xxxxyyy + L_xxyyyyy)
    v162        = L_xxyyyzz*z
    L_xxyyzzz   = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz   = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz   = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz   = -(L_xxxyyyy + L_xyyyyyy)
    v248        = L_xyyyyzz*z
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    v349        = L_yyyyyzz*z
    L_yyyyzzz   = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz   = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz   = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz   = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz   = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz  = -(L_xxxxxxxx + L_xxxxxxyy)
    v22         = L_xxxxxxz + L_xxxxxxyz*y + L_xxxxxxzz*z
    Ls_xxxxxxz  = Ls_xxxxxxz + (L_xxxxxxxz*x + v22)
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    v27         = L_xxxxxyz + L_xxxxxyzz*z
    v28         = L_xxxxxyyz*y + v27
    v45         = v27*y
    Ls_xxxxxyz  = Ls_xxxxxyz + (L_xxxxxxyz*x + v28)
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    v50         = L_xxxxyyz + L_xxxxyyzz*z
    v51         = L_xxxxyyyz*y + v50
    v62         = v50*y
    Ls_xxxxyyz  = Ls_xxxxyyz + (L_xxxxxyyz*x + v51)
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    v91         = L_xxxyyyz + L_xxxyyyzz*z
    v92         = L_xxxyyyyz*y + v91
    v103        = v91*y
    Ls_xxxyyyz  = Ls_xxxyyyz + (L_xxxxyyyz*x + v92)
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    v153        = L_xxyyyyz + L_xxyyyyzz*z
    v154        = L_xxyyyyyz*y + v153
    v165        = v153*y
    Ls_xxyyyyz  = Ls_xxyyyyz + (L_xxxyyyyz*x + v154)
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    v239        = L_xyyyyyz + L_xyyyyyzz*z
    v240        = L_xyyyyyyz*y + v239
    v251        = v239*y
    Ls_xyyyyyz  = Ls_xyyyyyz + (L_xxyyyyyz*x + v240)
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    v344        = L_yyyyyyz + L_yyyyyyzz*z
    Ls_yyyyyyz  = Ls_yyyyyyz + (v344 + L_xyyyyyyz*x + L_yyyyyyyz*y)
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v15         = a2
    v16         = 0.5d0*v15
    v76         = 0.25d0*v15
    v136        = 0.0833333333333333d0*v15
    v220        = 0.0208333333333333d0*v15
    v330        = 0.00416666666666667d0*v15
    a3          = a1*a2
    v30         = a3
    v31         = 0.166666666666667d0*v30
    v135        = 0.0833333333333333d0*v30
    v219        = 0.0277777777777778d0*v30
    v329        = 0.00694444444444444d0*v30
    a4          = a2*a2
    v64         = a4
    v65         = 0.0416666666666667d0*v64
    v216        = 0.0208333333333333d0*v64
    v328        = 0.00694444444444444d0*v64
    a5          = a2*a3
    v121        = a5
    v122        = 0.00833333333333333d0*v121
    v324        = 0.00416666666666667d0*v121
    a6          = a3*a3
    v203        = 0.00138888888888889d0*a6
    a7          = a3*a4
    v312        = 0.000198412698412698d0*a7
    a8          = a4*a4
    b2          = b1*b1
    v17         = b2
    v18         = L_xxxxxxyy*v17
    v24         = L_xxxxxyyy*v17
    v37         = 0.5d0*v17
    v43         = L_xxxxxyyz*v17
    v47         = L_xxxxyyyy*v17
    v60         = L_xxxxyyyz*v17
    v78         = 3.0d0*v17
    v88         = L_xxxyyyyy*v17
    v101        = L_xxxyyyyz*v17
    v150        = L_xxyyyyyy*v17
    v163        = L_xxyyyyyz*v17
    v236        = L_xyyyyyyy*v17
    v249        = L_xyyyyyyz*v17
    v325        = 0.00416666666666667d0*v17
    v353        = 0.25d0*v17
    v363        = 0.0833333333333333d0*v17
    v375        = 0.0208333333333333d0*v17
    b3          = b1*b2
    v32         = b3
    v33         = L_xxxxxyyy*v32
    v53         = L_xxxxyyyy*v32
    v72         = 0.166666666666667d0*v32
    v81         = L_xxxxyyyz*v32
    v94         = L_xxxyyyyy*v32
    v114        = L_xxxyyyyz*v32
    v138        = 4.0d0*v32
    v156        = L_xxyyyyyy*v32
    v176        = L_xxyyyyyz*v32
    v242        = L_xyyyyyyy*v32
    v262        = L_xyyyyyyz*v32
    v323        = 0.00694444444444444d0*v32
    v362        = 0.0833333333333333d0*v32
    v374        = 0.0277777777777778d0*v32
    b4          = b2*b2
    v66         = b4
    v67         = L_xxxxyyyy*v66
    v105        = L_xxxyyyyy*v66
    v130        = 0.0416666666666667d0*v66
    v141        = L_xxxyyyyz*v66
    v167        = L_xxyyyyyy*v66
    v194        = L_xxyyyyyz*v66
    v222        = 5.0d0*v66
    v253        = L_xyyyyyyy*v66
    v280        = L_xyyyyyyz*v66
    v322        = 0.00694444444444444d0*v66
    v373        = 0.0208333333333333d0*v66
    b5          = b2*b3
    v123        = b5
    v124        = L_xxxyyyyy*v123
    v183        = L_xxyyyyyy*v123
    v212        = 0.00833333333333333d0*v123
    v225        = L_xxyyyyyz*v123
    v269        = L_xyyyyyyy*v123
    v302        = L_xyyyyyyz*v123
    v321        = 0.00416666666666667d0*v123
    v332        = 6.0d0*v123
    b6          = b3*b3
    v204        = b6
    v205        = L_xxyyyyyy*v204
    v289        = L_xyyyyyyy*v204
    v320        = 0.00138888888888889d0*v204
    v334        = L_xyyyyyyz*v204
    b7          = b3*b4
    v313        = 0.000198412698412698d0*b7
    b8          = b4*b4
    c2          = c1*c1
    v19         = c2
    v314        = 0.5d0*v19
    v355        = 3.0d0*v19
    v365        = 12.0d0*v19
    v377        = 60.0d0*v19
    v384        = 360.0d0*v19
    v206        = L_xxzz*v19
    v290        = L_xyzz*v19
    v125        = L_xxxzz*v19
    v184        = L_xxyzz*v19
    v226        = L_xxzzz*v19
    v270        = L_xyyzz*v19
    v303        = L_xyzzz*v19
    v68         = L_xxxxzz*v19
    v106        = L_xxxyzz*v19
    v142        = L_xxxzzz*v19
    v168        = L_xxyyzz*v19
    v195        = L_xxyzzz*v19
    v254        = L_xyyyzz*v19
    v281        = L_xyyzzz*v19
    v34         = L_xxxxxzz*v19
    v54         = L_xxxxyzz*v19
    v82         = L_xxxxzzz*v19
    v95         = L_xxxyyzz*v19
    v115        = L_xxxyzzz*v19
    v157        = L_xxyyyzz*v19
    v177        = L_xxyyzzz*v19
    v243        = L_xyyyyzz*v19
    v263        = L_xyyyzzz*v19
    v20         = L_xxxxxxzz*v19
    v41         = v18 + v20 + 2.0d0*(L_xxxxxx + v14 + v21)
    Ls_xxxxxx   = Ls_xxxxxx + (0.5d0*(v18 + v20) + L_xxxxxx + L_xxxxxxxx*v16 + v0*x + v14 + v21)
    v25         = L_xxxxxyzz*v19
    v38         = v25 + 2.0d0*(L_xxxxxy + v23)
    v39         = v38*y
    v58         = 2.0d0*v26 + v24 + v38
    Ls_xxxxxy   = Ls_xxxxxy + (0.5d0*(v24 + v25) + L_xxxxxxxy*v16 + L_xxxxxy + v2*x + v23 + v26)
    v44         = L_xxxxxzzz*v19
    v86         = v43 + v44 + 2.0d0*(L_xxxxxz + v42 + v45)
    Ls_xxxxxz   = Ls_xxxxxz + (0.5d0*(v43 + v44) + L_xxxxxxxz*v16 + L_xxxxxz + v22*x + v42 + v45)
    v48         = L_xxxxyyzz*v19
    v56         = v48 + 2.0d0*(L_xxxxyy + v46)
    v57         = v56*y
    v73         = v17*v56
    v99         = 2.0d0*v49 + v47 + v56
    Ls_xxxxyy   = Ls_xxxxyy + (0.5d0*(v47 + v48) + L_xxxxxxyy*v16 + L_xxxxyy + v4*x + v46 + v49)
    v61         = L_xxxxyzzz*v19
    v84         = v61 + 2.0d0*(L_xxxxyz + v59)
    v85         = v84*y
    v119        = 2.0d0*v62 + v60 + v84
    Ls_xxxxyz   = Ls_xxxxyz + (0.5d0*(v60 + v61) + L_xxxxxxyz*v16 + L_xxxxyz + v28*x + v59 + v62)
    v89         = L_xxxyyyzz*v19
    v97         = v89 + 2.0d0*(L_xxxyyy + v87)
    v98         = v97*y
    v109        = v17*v97
    v131        = v32*v97
    v161        = 2.0d0*v90 + v88 + v97
    Ls_xxxyyy   = Ls_xxxyyy + (0.5d0*(v88 + v89) + L_xxxxxyyy*v16 + L_xxxyyy + v6*x + v87 + v90)
    v102        = L_xxxyyzzz*v19
    v117        = v102 + 2.0d0*(L_xxxyyz + v100)
    v118        = v117*y
    v145        = v117*v17
    v181        = 2.0d0*v103 + v101 + v117
    Ls_xxxyyz   = Ls_xxxyyz + (0.5d0*(v101 + v102) + L_xxxxxyyz*v16 + L_xxxyyz + v100 + v103 + v51*x)
    v151        = L_xxyyyyzz*v19
    v159        = v151 + 2.0d0*(L_xxyyyy + v149)
    v160        = v159*y
    v171        = v159*v17
    v188        = v159*v32
    v213        = v159*v66
    v247        = 2.0d0*v152 + v150 + v159
    Ls_xxyyyy   = Ls_xxyyyy + (0.5d0*(v150 + v151) + L_xxxxyyyy*v16 + L_xxyyyy + v149 + v152 + v8*x)
    v164        = L_xxyyyzzz*v19
    v179        = v164 + 2.0d0*(L_xxyyyz + v162)
    v180        = v179*y
    v198        = v17*v179
    v230        = v179*v32
    v267        = 2.0d0*v165 + v163 + v179
    Ls_xxyyyz   = Ls_xxyyyz + (0.5d0*(v163 + v164) + L_xxxxyyyz*v16 + L_xxyyyz + v162 + v165 + v92*x)
    v237        = L_xyyyyyzz*v19
    v245        = v237 + 2.0d0*(L_xyyyyy + v235)
    v246        = v245*y
    v257        = v17*v245
    v274        = v245*v32
    v295        = v245*v66
    Ls_xyyyyy   = Ls_xyyyyy + (0.5d0*(v236 + v237) + L_xxxyyyyy*v16 + L_xyyyyy + v10*x + v235 + v238)
    v250        = L_xyyyyzzz*v19
    v265        = v250 + 2.0d0*(L_xyyyyz + v248)
    v266        = v265*y
    v284        = v17*v265
    v307        = v265*v32
    v336        = v265*v66
    Ls_xyyyyz   = Ls_xyyyyz + (0.5d0*(v249 + v250) + L_xxxyyyyz*v16 + L_xyyyyz + v154*x + v248 + v251)
    v343        = L_yyyyyyzz*v19
    v348        = v343 + 2.0d0*(L_yyyyyy + v342)
    Ls_yyyyyy   = Ls_yyyyyy + (0.5d0*v343 + L_xxyyyyyy*v16 + L_yyyyyy + L_yyyyyyyy*v37 + v12*x + v13*y &
      + v342)
    v350        = L_yyyyyzzz*v19
    v359        = v350 + 2.0d0*(L_yyyyyz + v349)
    Ls_yyyyyz   = Ls_yyyyyz + (0.5d0*v350 + L_xxyyyyyz*v16 + L_yyyyyyyz*v37 + L_yyyyyz + v240*x + v344* &
      y + v349)
    h           = v15 + v17 + v19
    u2          = 1.0/h
    u           = sqrt(u2)
    u3          = u*u2
    u4          = u2*u2
    u5          = u2*u3
    u6          = u3*u3
    u7          = u3*u4
    u8          = u4*u4
    u9          = u4*u5
    u10         = u5*u5
    u11         = u5*u6
    u12         = u6*u6
    u13         = u6*u7
    u14         = u7*u7
    u15         = u7*u8
    u16         = u8*u8
    u17         = u8*u9
    c3          = c1*c2
    v35         = c3
    v315        = 0.166666666666667d0*v35
    v366        = 4.0d0*v35
    v378        = 20.0d0*v35
    v385        = 120.0d0*v35
    v207        = L_xxzzz*v35
    v291        = L_xyzzz*v35
    v126        = L_xxxzzz*v35
    v185        = L_xxyzzz*v35
    v227        = L_xxzzzz*v35
    v271        = L_xyyzzz*v35
    v304        = L_xyzzzz*v35
    v69         = L_xxxxzzz*v35
    v107        = L_xxxyzzz*v35
    v143        = L_xxxzzzz*v35
    v169        = L_xxyyzzz*v35
    v196        = L_xxyzzzz*v35
    v255        = L_xyyyzzz*v35
    v282        = L_xyyzzzz*v35
    v36         = L_xxxxxzzz*v35
    v79         = v33 + v36 + v3*v78 + 6.0d0*(L_xxxxx + v29) + 3.0d0*(v34 + v39)
    Ls_xxxxx    = Ls_xxxxx + (0.166666666666667d0*(v33 + v36 + 3.0d0*(v34 + v39)) + L_xxxxx + &
      L_xxxxxxxx*v31 + v0*v16 + v29 + v3*v37 + v40*v41)
    v55         = L_xxxxyzzz*v35
    v74         = v55 + 3.0d0*(2.0d0*L_xxxxy + 2.0d0*v52 + v54)
    v75         = v74*y
    v112        = v53 + v74 + v5*v78 + 3.0d0*v57
    Ls_xxxxy    = Ls_xxxxy + (0.166666666666667d0*(v53 + v55 + 3.0d0*(v54 + v57)) + L_xxxxxxxy*v31 + &
      L_xxxxy + v16*v2 + v37*v5 + v40*v58 + v52)
    v83         = L_xxxxzzzz*v35
    v148        = v81 + v83 + v50*v78 + 6.0d0*(L_xxxxz + v80) + 3.0d0*(v82 + v85)
    Ls_xxxxz    = Ls_xxxxz + (0.166666666666667d0*(v81 + v83 + 3.0d0*(v82 + v85)) + L_xxxxxxxz*v31 + &
      L_xxxxz + v16*v22 + v37*v50 + v40*v86 + v80)
    v96         = L_xxxyyzzz*v35
    v110        = v96 + 3.0d0*(2.0d0*L_xxxyy + 2.0d0*v93 + v95)
    v111        = v110*y
    v132        = v110*v17
    v174        = v110 + v94 + v7*v78 + 3.0d0*v98
    Ls_xxxyy    = Ls_xxxyy + (0.166666666666667d0*(v94 + v96 + 3.0d0*(v95 + v98)) + L_xxxxxxyy*v31 + &
      L_xxxyy + v16*v4 + v37*v7 + v40*v99 + v93)
    v116        = L_xxxyzzzz*v35
    v146        = v116 + 3.0d0*(2.0d0*L_xxxyz + 2.0d0*v113 + v115)
    v147        = v146*y
    v201        = v114 + v146 + 3.0d0*v118 + v78*v91
    Ls_xxxyz    = Ls_xxxyz + (0.166666666666667d0*(v114 + v116 + 3.0d0*(v115 + v118)) + L_xxxxxxyz*v31 &
      + L_xxxyz + v113 + v119*v40 + v16*v28 + v37*v91)
    v158        = L_xxyyyzzz*v35
    v172        = v158 + 3.0d0*(2.0d0*L_xxyyy + 2.0d0*v155 + v157)
    v173        = v172*y
    v189        = v17*v172
    v214        = v172*v32
    v260        = v156 + v172 + 3.0d0*v160 + v78*v9
    Ls_xxyyy    = Ls_xxyyy + (0.166666666666667d0*(v156 + v158 + 3.0d0*(v157 + v160)) + L_xxxxxyyy*v31 &
      + L_xxyyy + v155 + v16*v6 + v161*v40 + v37*v9)
    v178        = L_xxyyzzzz*v35
    v199        = v178 + 3.0d0*(2.0d0*L_xxyyz + 2.0d0*v175 + v177)
    v200        = v199*y
    v231        = v17*v199
    v287        = v176 + v199 + v153*v78 + 3.0d0*v180
    Ls_xxyyz    = Ls_xxyyz + (0.166666666666667d0*(v176 + v178 + 3.0d0*(v177 + v180)) + L_xxxxxyyz*v31 &
      + L_xxyyz + v153*v37 + v16*v51 + v175 + v181*v40)
    v244        = L_xyyyyzzz*v35
    v258        = v244 + 3.0d0*(2.0d0*L_xyyyy + 2.0d0*v241 + v243)
    v259        = v258*y
    v275        = v17*v258
    v296        = v258*v32
    Ls_xyyyy    = Ls_xyyyy + (0.166666666666667d0*(v242 + v244 + 3.0d0*(v243 + v246)) + L_xxxxyyyy*v31 &
      + L_xyyyy + v11*v37 + v16*v8 + v241 + v247*v40)
    v264        = L_xyyyzzzz*v35
    v285        = v264 + 3.0d0*(2.0d0*L_xyyyz + 2.0d0*v261 + v263)
    v286        = v285*y
    v308        = v17*v285
    v337        = v285*v32
    Ls_xyyyz    = Ls_xyyyz + (0.166666666666667d0*(v262 + v264 + 3.0d0*(v263 + v266)) + L_xxxxyyyz*v31 &
      + L_xyyyz + v16*v92 + v239*v37 + v261 + v267*v40)
    v346        = L_yyyyyzzz*v35
    v356        = v346 + L_yyyyyzz*v355 + 6.0d0*(L_yyyyy + v345)
    Ls_yyyyy    = Ls_yyyyy + (0.166666666666667d0*v346 + L_xxxyyyyy*v31 + L_yyyyy + L_yyyyyyyy*v72 + &
      L_yyyyyzz*v314 + v10*v16 + v13*v37 + v345 + v347*v348 + v40*(v236 &
      + 2.0d0*v238 + v245))
    v358        = L_yyyyzzzz*v35
    v370        = v358 + L_yyyyzzz*v355 + 6.0d0*(L_yyyyz + v357)
    Ls_yyyyz    = Ls_yyyyz + (0.166666666666667d0*v358 + L_xxxyyyyz*v31 + L_yyyyyyyz*v72 + L_yyyyz + &
      L_yyyyzzz*v314 + v154*v16 + v344*v37 + v347*v359 + v357 + v40*( &
      v249 + 2.0d0*v251 + v265))
    c4          = c2*c2
    v70         = c4
    v316        = 0.0416666666666667d0*v70
    v379        = 5.0d0*v70
    v386        = 30.0d0*v70
    v208        = L_xxzzzz*v70
    v292        = L_xyzzzz*v70
    v127        = L_xxxzzzz*v70
    v186        = L_xxyzzzz*v70
    v228        = L_xxzzzzz*v70
    v272        = L_xyyzzzz*v70
    v305        = L_xyzzzzz*v70
    v71         = L_xxxxzzzz*v70
    v139        = v67 + v71 + v138*v5 + 12.0d0*v68 + 6.0d0*v73 + 24.0d0*(L_xxxx + v63) + &
      4.0d0*(v69 + v75)
    Ls_xxxx     = Ls_xxxx + (0.0416666666666667d0*(v67 + 12.0d0*v68 + v71 + 6.0d0*v73 + 4.0d0*(v69 + &
      v75)) + L_xxxx + L_xxxxxxxx*v65 + v0*v31 + v41*v76 + v5*v72 + v63 &
      + v77*v79)
    v108        = L_xxxyzzzz*v70
    v133        = v108 + 12.0d0*v106 + 4.0d0*(6.0d0*L_xxxy + 6.0d0*v104 + v107)
    v134        = v133*y
    v192        = v105 + v133 + 6.0d0*v109 + 4.0d0*v111 + v138*v7
    Ls_xxxy     = Ls_xxxy + (0.0416666666666667d0*(v105 + 12.0d0*v106 + v108 + 6.0d0*v109 + 4.0d0*( &
      v107 + v111)) + L_xxxxxxxy*v65 + L_xxxy + v104 + v112*v77 + v2* &
      v31 + v58*v76 + v7*v72)
    v144        = L_xxxzzzzz*v70
    v234        = v141 + v144 + v138*v91 + 12.0d0*v142 + 6.0d0*v145 + 24.0d0*(L_xxxz + &
      v140) + 4.0d0*(v143 + v147)
    Ls_xxxz     = Ls_xxxz + (0.0416666666666667d0*(v141 + 12.0d0*v142 + v144 + 6.0d0*v145 + 4.0d0*( &
      v143 + v147)) + L_xxxxxxxz*v65 + L_xxxz + v140 + v148*v77 + v22* &
      v31 + v72*v91 + v76*v86)
    v170        = L_xxyyzzzz*v70
    v190        = v170 + 12.0d0*v168 + 4.0d0*(6.0d0*L_xxyy + 6.0d0*v166 + v169)
    v191        = v190*y
    v215        = v17*v190
    v278        = v167 + v190 + v138*v9 + 6.0d0*v171 + 4.0d0*v173
    Ls_xxyy     = Ls_xxyy + (0.0416666666666667d0*(v167 + 12.0d0*v168 + v170 + 6.0d0*v171 + 4.0d0*( &
      v169 + v173)) + L_xxxxxxyy*v65 + L_xxyy + v166 + v174*v77 + v31* &
      v4 + v72*v9 + v76*v99)
    v197        = L_xxyzzzzz*v70
    v232        = v197 + 12.0d0*v195 + 4.0d0*(6.0d0*L_xxyz + 6.0d0*v193 + v196)
    v233        = v232*y
    v311        = v194 + v232 + v138*v153 + 6.0d0*v198 + 4.0d0*v200
    Ls_xxyz     = Ls_xxyz + (0.0416666666666667d0*(v194 + 12.0d0*v195 + v197 + 6.0d0*v198 + 4.0d0*( &
      v196 + v200)) + L_xxxxxxyz*v65 + L_xxyz + v119*v76 + v153*v72 + &
      v193 + v201*v77 + v28*v31)
    v256        = L_xyyyzzzz*v70
    v276        = v256 + 12.0d0*v254 + 4.0d0*(6.0d0*L_xyyy + 6.0d0*v252 + v255)
    v277        = v276*y
    v297        = v17*v276
    Ls_xyyy     = Ls_xyyy + (0.0416666666666667d0*(v253 + 12.0d0*v254 + v256 + 6.0d0*v257 + 4.0d0*( &
      v255 + v259)) + L_xxxxxyyy*v65 + L_xyyy + v11*v72 + v161*v76 + &
      v252 + v260*v77 + v31*v6)
    v283        = L_xyyzzzzz*v70
    v309        = v283 + 12.0d0*v281 + 4.0d0*(6.0d0*L_xyyz + 6.0d0*v279 + v282)
    v310        = v309*y
    v338        = v17*v309
    Ls_xyyz     = Ls_xyyz + (0.0416666666666667d0*(v280 + 12.0d0*v281 + v283 + 6.0d0*v284 + 4.0d0*( &
      v282 + v286)) + L_xxxxxyyz*v65 + L_xyyz + v181*v76 + v239*v72 + &
      v279 + v287*v77 + v31*v51)
    v352        = L_yyyyzzzz*v70
    v367        = v352 + L_yyyyzz*v365 + L_yyyyzzz*v366 + 24.0d0*(L_yyyy + v351)
    Ls_yyyy     = Ls_yyyy + (0.0416666666666667d0*v352 + L_xxxxyyyy*v65 + L_yyyy + L_yyyyyyyy*v130 + &
      L_yyyyzz*v314 + L_yyyyzzz*v315 + v13*v72 + v247*v76 + v31*v8 + &
      v348*v353 + v351 + v354*v356 + v77*(v11*v78 + v242 + 3.0d0*v246 + &
      v258))
    v369        = L_yyyzzzzz*v70
    v383        = v369 + L_yyyzzz*v365 + L_yyyzzzz*v366 + 24.0d0*(L_yyyz + v368)
    Ls_yyyz     = Ls_yyyz + (0.0416666666666667d0*v369 + L_xxxxyyyz*v65 + L_yyyyyyyz*v130 + L_yyyz + &
      L_yyyzzz*v314 + L_yyyzzzz*v315 + v267*v76 + v31*v92 + v344*v72 + &
      v353*v359 + v354*v370 + v368 + v77*(v239*v78 + v262 + 3.0d0*v266 &
      + v285))
    c5          = c2*c3
    v128        = c5
    v317        = 0.00833333333333333d0*v128
    v387        = 6.0d0*v128
    v209        = L_xxzzzzz*v128
    v293        = L_xyzzzzz*v128
    v129        = L_xxxzzzzz*v128
    v223        = v124 + v129 + 60.0d0*v125 + 20.0d0*v126 + v222*v7 + 120.0d0*(L_xxx + &
      v120) + 5.0d0*(v127 + v134) + 10.0d0*(v131 + v132)
    Ls_xxx      = Ls_xxx + (0.00833333333333333d0*(v124 + 60.0d0*v125 + 20.0d0*v126 + v129 + 5.0d0*( &
      v127 + v134) + 10.0d0*(v131 + v132)) + L_xxx + L_xxxxxxxx*v122 + &
      v0*v65 + v120 + v130*v7 + v135*v41 + v136*v79 + v137*v139)
    v187        = L_xxyzzzzz*v128
    v217        = v187 + 60.0d0*v184 + 20.0d0*v185 + 5.0d0*(24.0d0*L_xxy + 24.0d0*v182 + &
      v186)
    v218        = v217*y
    v300        = v183 + v217 + 5.0d0*v191 + v222*v9 + 10.0d0*(v188 + v189)
    Ls_xxy      = Ls_xxy + (0.00833333333333333d0*(v183 + 60.0d0*v184 + 20.0d0*v185 + v187 + 5.0d0*( &
      v186 + v191) + 10.0d0*(v188 + v189)) + L_xxxxxxxy*v122 + L_xxy + &
      v112*v136 + v130*v9 + v135*v58 + v137*v192 + v182 + v2*v65)
    v229        = L_xxzzzzzz*v128
    v341        = v225 + v229 + v153*v222 + 60.0d0*v226 + 20.0d0*v227 + 120.0d0*(L_xxz + &
      v224) + 5.0d0*(v228 + v233) + 10.0d0*(v230 + v231)
    Ls_xxz      = Ls_xxz + (0.00833333333333333d0*(v225 + 60.0d0*v226 + 20.0d0*v227 + v229 + 5.0d0*( &
      v228 + v233) + 10.0d0*(v230 + v231)) + L_xxxxxxxz*v122 + L_xxz + &
      v130*v153 + v135*v86 + v136*v148 + v137*v234 + v22*v65 + v224)
    v273        = L_xyyzzzzz*v128
    v298        = v273 + 60.0d0*v270 + 20.0d0*v271 + 5.0d0*(24.0d0*L_xyy + 24.0d0*v268 + &
      v272)
    v299        = v298*y
    Ls_xyy      = Ls_xyy + (0.00833333333333333d0*(v269 + 60.0d0*v270 + 20.0d0*v271 + v273 + 5.0d0*( &
      v272 + v277) + 10.0d0*(v274 + v275)) + L_xxxxxxyy*v122 + L_xyy + &
      v11*v130 + v135*v99 + v136*v174 + v137*v278 + v268 + v4*v65)
    v306        = L_xyzzzzzz*v128
    v339        = v306 + 60.0d0*v303 + 20.0d0*v304 + 5.0d0*(24.0d0*L_xyz + 24.0d0*v301 + &
      v305)
    v340        = v339*y
    Ls_xyz      = Ls_xyz + (0.00833333333333333d0*(v302 + 60.0d0*v303 + 20.0d0*v304 + v306 + 5.0d0*( &
      v305 + v310) + 10.0d0*(v307 + v308)) + L_xxxxxxyz*v122 + L_xyz + &
      v119*v135 + v130*v239 + v136*v201 + v137*v311 + v28*v65 + v301)
    v361        = L_yyyzzzzz*v128
    v380        = v361 + L_yyyzz*v377 + L_yyyzzz*v378 + L_yyyzzzz*v379 + 120.0d0*(L_yyy + &
      v360)
    Ls_yyy      = Ls_yyy + (0.00833333333333333d0*v361 + L_xxxxxyyy*v122 + L_yyy + L_yyyyyyyy*v212 + &
      L_yyyzz*v314 + L_yyyzzz*v315 + L_yyyzzzz*v316 + v13*v130 + v135* &
      v161 + v136*v260 + v137*(v11*v138 + v253 + 6.0d0*v257 + 4.0d0* &
      v259 + v276) + v348*v362 + v356*v363 + v360 + v364*v367 + v6*v65)
    v382        = L_yyzzzzzz*v128
    v390        = v382 + L_yyzzz*v377 + L_yyzzzz*v378 + L_yyzzzzz*v379 + 120.0d0*(L_yyz + &
      v381)
    Ls_yyz      = Ls_yyz + (0.00833333333333333d0*v382 + L_xxxxxyyz*v122 + L_yyyyyyyz*v212 + L_yyz + &
      L_yyzzz*v314 + L_yyzzzz*v315 + L_yyzzzzz*v316 + v130*v344 + v135* &
      v181 + v136*v287 + v137*(v138*v239 + v280 + 6.0d0*v284 + 4.0d0* &
      v286 + v309) + v359*v362 + v363*v370 + v364*v383 + v381 + v51*v65)
    c6          = c3*c3
    v210        = c6
    v318        = 0.00138888888888889d0*v210
    v211        = L_xxzzzzzz*v210
    Ls_xx       = Ls_xx + (0.00138888888888889d0*(v205 + 360.0d0*v206 + 120.0d0*v207 + 30.0d0*v208 &
      + v211 + 20.0d0*v214 + 6.0d0*(v209 + v218) + 15.0d0*(v213 + v215 &
      )) + L_xx + L_xxxxxxxx*v203 + v0*v122 + v139*v220 + v202 + v212* &
      v9 + v216*v41 + v219*v79 + v221*v223)
    v294        = L_xyzzzzzz*v210
    v327        = v294 + 360.0d0*v290 + 120.0d0*v291 + 30.0d0*v292 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v288 + v293)
    Ls_xy       = Ls_xy + (0.00138888888888889d0*(v289 + 360.0d0*v290 + 120.0d0*v291 + 30.0d0*v292 &
      + v294 + 20.0d0*v296 + 6.0d0*(v293 + v299) + 15.0d0*(v295 + v297 &
      )) + L_xxxxxxxy*v203 + L_xy + v11*v212 + v112*v219 + v122*v2 + &
      v192*v220 + v216*v58 + v221*v300 + v288)
    v335        = L_xzzzzzzz*v210
    Ls_xz       = Ls_xz + (0.00138888888888889d0*(v334 + v335 + 20.0d0*v337 + 6.0d0*v340 + 15.0d0*( &
      v336 + v338)) + L_xxxxxxxz*v203 + L_xz + L_xzzz*v314 + L_xzzzz* &
      v315 + L_xzzzzz*v316 + L_xzzzzzz*v317 + v122*v22 + v148*v219 + &
      v212*v239 + v216*v86 + v220*v234 + v221*v341 + v333)
    v372        = L_yyzzzzzz*v210
    Ls_yy       = Ls_yy + (0.00138888888888889d0*v372 + L_xxxxxxyy*v203 + L_yy + L_yyyyyyyy*v320 + &
      L_yyzz*v314 + L_yyzzz*v315 + L_yyzzzz*v316 + L_yyzzzzz*v317 + &
      v122*v4 + v13*v212 + v174*v219 + v216*v99 + v220*v278 + v221*(v11 &
      *v222 + v269 + 10.0d0*v274 + 10.0d0*v275 + 5.0d0*v277 + v298) + &
      v348*v373 + v356*v374 + v367*v375 + v371 + v376*v380)
    v389        = L_yzzzzzzz*v210
    Ls_yz       = Ls_yz + (0.00138888888888889d0*v389 + L_xxxxxxyz*v203 + L_yyyyyyyz*v320 + L_yz + &
      L_yzzz*v314 + L_yzzzz*v315 + L_yzzzzz*v316 + L_yzzzzzz*v317 + &
      v119*v216 + v122*v28 + v201*v219 + v212*v344 + v220*v311 + v221*( &
      v222*v239 + v302 + 10.0d0*v307 + 10.0d0*v308 + 5.0d0*v310 + v339 &
      ) + v359*v373 + v370*v374 + v375*v383 + v376*v390 + v388)
    c7          = c3*c4
    v319        = 0.000198412698412698d0*c7
    Ls_x        = Ls_x + (L_x + L_xxxxxxxx*v312 + L_xyyyyyyy*v313 + L_xz*z + L_xzz*v314 + L_xzzz* &
      v315 + L_xzzzz*v316 + L_xzzzzz*v317 + L_xzzzzzz*v318 + L_xzzzzzzz &
      *v319 + v0*v203 + v11*v320 + v139*v329 + v223*v330 + v245*v321 + &
      v258*v322 + v276*v323 + v298*v325 + v324*v41 + v326*v327 + v328* &
      v79 + v331*(720.0d0*L_xx + 720.0d0*v202 + v205 + 360.0d0*v206 + &
      120.0d0*v207 + 30.0d0*v208 + 6.0d0*v209 + v211 + 15.0d0*v213 + &
      20.0d0*v214 + 15.0d0*v215 + 6.0d0*v218 + v332*v9))
    Ls_y        = Ls_y + (L_y + L_xxxxxxxy*v312 + L_yyyyyyyy*v313 + L_yz*z + L_yzz*v314 + L_yzzz* &
      v315 + L_yzzzz*v316 + L_yzzzzz*v317 + L_yzzzzzz*v318 + L_yzzzzzzz &
      *v319 + v112*v328 + v13*v320 + v192*v329 + v2*v203 + v300*v330 + &
      v321*v348 + v322*v356 + v323*v367 + v324*v58 + v325*v380 + v326*( &
      720.0d0*L_yy + L_yyzz*v384 + L_yyzzz*v385 + L_yyzzzz*v386 + &
      L_yyzzzzz*v387 + 720.0d0*v371 + v372) + v331*(v11*v332 + v289 + &
      15.0d0*v295 + 20.0d0*v296 + 15.0d0*v297 + 6.0d0*v299 + v327))
    Ls_z        = Ls_z + (L_z + L_xxxxxxxz*v312 + L_yyyyyyyz*v313 + L_zz*z + L_zzz*v314 + L_zzzz* &
      v315 + L_zzzzz*v316 + L_zzzzzz*v317 + L_zzzzzzz*v318 + L_zzzzzzzz &
      *v319 + v148*v328 + v203*v22 + v234*v329 + v320*v344 + v321*v359 &
      + v322*v370 + v323*v383 + v324*v86 + v325*v390 + v326*(720.0d0* &
      L_yz + L_yzzz*v384 + L_yzzzz*v385 + L_yzzzzz*v386 + L_yzzzzzz* &
      v387 + 720.0d0*v388 + v389) + v330*v341 + v331*(720.0d0*L_xz + &
      L_xzzz*v384 + L_xzzzz*v385 + L_xzzzzz*v386 + L_xzzzzzz*v387 + &
      v239*v332 + 720.0d0*v333 + v334 + v335 + 15.0d0*v336 + 20.0d0* &
      v337 + 15.0d0*v338 + 6.0d0*v340))
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
#undef  L_yy                
#undef  Ls_yy               
#undef  Ls_yz               
#undef  L_yz                
#undef  Ls_xxx              
#undef  L_xxx               
#undef  Ls_xxy              
#undef  L_xxy               
#undef  Ls_xxz              
#undef  L_xxz               
#undef  Ls_xyy              
#undef  L_xyy               
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
#undef  L_yyyyy             
#undef  Ls_yyyyy            
#undef  L_yyyyz             
#undef  Ls_yyyyz            
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
#undef  L_xxxyyz            
#undef  Ls_xxxyyz           
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
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
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
#undef  L_xxxxxxxx          
#undef  Ls_xxxxxxxx         
#undef  Ls_xxxxxxxy         
#undef  L_xxxxxxxy          
#undef  Ls_xxxxxxxz         
#undef  L_xxxxxxxz          
#undef  Ls_xxxxxxyy         
#undef  L_xxxxxxyy          
#undef  Ls_xxxxxxyz         
#undef  L_xxxxxxyz          
#undef  Ls_xxxxxyyy         
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  Ls_xxxxxyyz         
#undef  Ls_xxxxyyyy         
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  Ls_xxxxyyyz         
#undef  Ls_xxxyyyyy         
#undef  L_xxxyyyyy          
#undef  Ls_xxxyyyyz         
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  Ls_xxyyyyyy         
#undef  Ls_xxyyyyyz         
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  Ls_xyyyyyyy         
#undef  Ls_xyyyyyyz         
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L_add
    
! OPS  1770*ADD + 2*DIV + 2369*MUL + 175*NEG + POW + 52*SUB = 4369  (5807 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v430, v431, v432, v433, v44, v45, v46, v47,&
                v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58,&
                v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7,&
                v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80,&
                v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91,&
                v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_x, D_y, D_z,&
                D_xx, D_xy, D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz,&
                D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx,&
                D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz,&
                D_xyzz, D_xzzz, D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz,&
                D_xxxxx, D_xxxxy, D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy,&
                D_xxyyz, D_xxyzz, D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz,&
                D_xzzzz, D_yyyyy, D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz,&
                D_xxxxxx, D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz,&
                D_xxxyyy, D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz,&
                D_xxyyzz, D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz,&
                D_xyyzzz, D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz,&
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy,&
                D_xxxxxxz, D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy,&
                D_xxxxyyz, D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz,&
                D_xxxyyzz, D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz,&
                D_xxyyyzz, D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy,&
                D_xyyyyyz, D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz,&
                D_xzzzzzz, D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz,&
                D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx,&
                D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz,&
                D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy,&
                D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy,&
                D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz,&
                D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz,&
                D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz,&
                D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz,&
                D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz,&
                D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, M_zz, M_xzz,&
                M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz,&
                M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz,&
                M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz,&
                M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz,&
                M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz,&
                M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz,&
                M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz,&
                M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz,&
                M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz,&
                M_zzzzzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define x                    r(1:2,1)
#define M_xx                 M(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define M_xy                 M(1:2,2)
#define L_xx                 L(1:2,3)
#define M_xz                 M(1:2,3)
#define M_yy                 M(1:2,4)
#define L_xy                 L(1:2,4)
#define L_xz                 L(1:2,5)
#define M_yz                 M(1:2,5)
#define L_yy                 L(1:2,6)
#define M_xxx                M(1:2,6)
#define L_yz                 L(1:2,7)
#define M_xxy                M(1:2,7)
#define L_xxx                L(1:2,8)
#define M_xxz                M(1:2,8)
#define M_xyy                M(1:2,9)
#define L_xxy                L(1:2,9)
#define L_xxz                L(1:2,10)
#define M_xyz                M(1:2,10)
#define L_xyy                L(1:2,11)
#define M_yyy                M(1:2,11)
#define M_yyz                M(1:2,12)
#define L_xyz                L(1:2,12)
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
#define L_xxyy               L(1:2,18)
#define M_xyyy               M(1:2,18)
#define M_xyyz               M(1:2,19)
#define L_xxyz               L(1:2,19)
#define M_yyyy               M(1:2,20)
#define L_xyyy               L(1:2,20)
#define L_xyyz               L(1:2,21)
#define M_yyyz               M(1:2,21)
#define L_yyyy               L(1:2,22)
#define M_xxxxx              M(1:2,22)
#define L_yyyz               L(1:2,23)
#define M_xxxxy              M(1:2,23)
#define M_xxxxz              M(1:2,24)
#define L_xxxxx              L(1:2,24)
#define L_xxxxy              L(1:2,25)
#define M_xxxyy              M(1:2,25)
#define L_xxxxz              L(1:2,26)
#define M_xxxyz              M(1:2,26)
#define L_xxxyy              L(1:2,27)
#define M_xxyyy              M(1:2,27)
#define L_xxxyz              L(1:2,28)
#define M_xxyyz              M(1:2,28)
#define L_xxyyy              L(1:2,29)
#define M_xyyyy              M(1:2,29)
#define M_xyyyz              M(1:2,30)
#define L_xxyyz              L(1:2,30)
#define L_xyyyy              L(1:2,31)
#define M_yyyyy              M(1:2,31)
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
#define L_xxxxyy             L(1:2,38)
#define M_xxxyyy             M(1:2,38)
#define L_xxxxyz             L(1:2,39)
#define M_xxxyyz             M(1:2,39)
#define L_xxxyyy             L(1:2,40)
#define M_xxyyyy             M(1:2,40)
#define M_xxyyyz             M(1:2,41)
#define L_xxxyyz             L(1:2,41)
#define M_xyyyyy             M(1:2,42)
#define L_xxyyyy             L(1:2,42)
#define M_xyyyyz             M(1:2,43)
#define L_xxyyyz             L(1:2,43)
#define M_yyyyyy             M(1:2,44)
#define L_xyyyyy             L(1:2,44)
#define M_yyyyyz             M(1:2,45)
#define L_xyyyyz             L(1:2,45)
#define M_xxxxxxx            M(1:2,46)
#define L_yyyyyy             L(1:2,46)
#define M_xxxxxxy            M(1:2,47)
#define L_yyyyyz             L(1:2,47)
#define L_xxxxxxx            L(1:2,48)
#define M_xxxxxxz            M(1:2,48)
#define M_xxxxxyy            M(1:2,49)
#define L_xxxxxxy            L(1:2,49)
#define M_xxxxxyz            M(1:2,50)
#define L_xxxxxxz            L(1:2,50)
#define M_xxxxyyy            M(1:2,51)
#define L_xxxxxyy            L(1:2,51)
#define L_xxxxxyz            L(1:2,52)
#define M_xxxxyyz            M(1:2,52)
#define L_xxxxyyy            L(1:2,53)
#define M_xxxyyyy            M(1:2,53)
#define M_xxxyyyz            M(1:2,54)
#define L_xxxxyyz            L(1:2,54)
#define L_xxxyyyy            L(1:2,55)
#define M_xxyyyyy            M(1:2,55)
#define L_xxxyyyz            L(1:2,56)
#define M_xxyyyyz            M(1:2,56)
#define L_xxyyyyy            L(1:2,57)
#define M_xyyyyyy            M(1:2,57)
#define L_xxyyyyz            L(1:2,58)
#define M_xyyyyyz            M(1:2,58)
#define M_yyyyyyy            M(1:2,59)
#define L_xyyyyyy            L(1:2,59)
#define L_xyyyyyz            L(1:2,60)
#define M_yyyyyyz            M(1:2,60)
#define L_yyyyyyy            L(1:2,61)
#define L_yyyyyyz            L(1:2,62)
#define L_xxxxxxxx           L(1:2,63)
#define L_xxxxxxxy           L(1:2,64)
#define L_xxxxxxxz           L(1:2,65)
#define L_xxxxxxyy           L(1:2,66)
#define L_xxxxxxyz           L(1:2,67)
#define L_xxxxxyyy           L(1:2,68)
#define L_xxxxxyyz           L(1:2,69)
#define L_xxxxyyyy           L(1:2,70)
#define L_xxxxyyyz           L(1:2,71)
#define L_xxxyyyyy           L(1:2,72)
#define L_xxxyyyyz           L(1:2,73)
#define L_xxyyyyyy           L(1:2,74)
#define L_xxyyyyyz           L(1:2,75)
#define L_xyyyyyyy           L(1:2,76)
#define L_xyyyyyyz           L(1:2,77)
#define L_yyyyyyyy           L(1:2,78)
#define L_yyyyyyyz           L(1:2,79)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v429       = y*z
    v430       = x*y
    v415       = 15.0d0*v429
    v417       = v430
    v419       = v429
    v112       = 0.5d0*M_xx
    v122       = 0.166666666666667d0*M_xxx
    v123       = 0.5d0*M_xxy
    v124       = 0.5d0*M_xxz
    v143       = 0.0416666666666667d0*M_xxxx
    v144       = 0.166666666666667d0*M_xxxy
    v145       = 0.166666666666667d0*M_xxxz
    v146       = 0.25d0*M_xxyy
    v147       = 0.5d0*M_xxyz
    v179       = 0.00833333333333333d0*M_xxxxx
    v180       = 0.0416666666666667d0*M_xxxxy
    v181       = 0.0416666666666667d0*M_xxxxz
    v182       = 0.0833333333333333d0*M_xxxyy
    v183       = 0.166666666666667d0*M_xxxyz
    v185       = 0.0833333333333333d0*M_xxyyy
    v186       = 0.25d0*M_xxyyz
    v247       = 0.00138888888888889d0*M_xxxxxx
    v248       = 0.00833333333333333d0*M_xxxxxy
    v249       = 0.00833333333333333d0*M_xxxxxz
    v250       = 0.0208333333333333d0*M_xxxxyy
    v251       = 0.0416666666666667d0*M_xxxxyz
    v253       = 0.0277777777777778d0*M_xxxyyy
    v254       = 0.0833333333333333d0*M_xxxyyz
    v257       = 0.0208333333333333d0*M_xxyyyy
    v258       = 0.0833333333333333d0*M_xxyyyz
    v291       = 0.5d0*M_yy
    v293       = 0.166666666666667d0*M_yyy
    v298       = 0.0416666666666667d0*M_yyyy
    v307       = 0.00833333333333333d0*M_yyyyy
    v323       = 0.00138888888888889d0*M_yyyyyy
    v347       = 0.000198412698412698d0*M_xxxxxxx
    v348       = 0.00138888888888889d0*M_xxxxxxy
    v349       = 0.00138888888888889d0*M_xxxxxxz
    v350       = 0.00416666666666667d0*M_xxxxxyy
    v351       = 0.00833333333333333d0*M_xxxxxyz
    v353       = 0.00694444444444444d0*M_xxxxyyy
    v354       = 0.0208333333333333d0*M_xxxxyyz
    v357       = 0.00694444444444444d0*M_xxxyyyy
    v358       = 0.0277777777777778d0*M_xxxyyyz
    v362       = 0.00416666666666667d0*M_xxyyyyy
    v363       = 0.0208333333333333d0*M_xxyyyyz
    v368       = 0.000198412698412698d0*M_yyyyyyy
    v369       = 0.00138888888888889d0*M_yyyyyyz
    v370       = 0.00833333333333333d0*M_yyyyyz
    v372       = 0.0416666666666667d0*M_yyyyz
    v375       = 0.166666666666667d0*M_yyyz
    v379       = 0.5d0*M_yyz
    v390       = 0.5d0*M_xyy
    v392       = 0.166666666666667d0*M_xyyy
    v394       = 0.0416666666666667d0*M_xyyyy
    v396       = 0.00833333333333333d0*M_xyyyyy
    v398       = 0.00138888888888889d0*M_xyyyyyy
    M_zz       = -(M_xx + M_yy)
    v384       = 0.5d0*M_zz
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    v391       = 0.5d0*M_yzz
    M_zzz      = -(M_xxz + M_yyz)
    v385       = 0.166666666666667d0*M_zzz
    M_xxzz     = -(M_xxxx + M_xxyy)
    v148       = 0.25d0*M_xxzz
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v380       = 0.25d0*M_yyzz
    M_yzzz     = -(M_xxyz + M_yyyz)
    v393       = 0.166666666666667d0*M_yzzz
    M_zzzz     = -(M_xxzz + M_yyzz)
    v386       = 0.0416666666666667d0*M_zzzz
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    v184       = 0.0833333333333333d0*M_xxxzz
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    v187       = 0.25d0*M_xxyzz
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    v188       = 0.0833333333333333d0*M_xxzzz
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -(M_xxxzz + M_xyyzz)
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    v376       = 0.0833333333333333d0*M_yyyzz
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v381       = 0.0833333333333333d0*M_yyzzz
    M_yzzzz    = -(M_xxyzz + M_yyyzz)
    v395       = 0.0416666666666667d0*M_yzzzz
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    v387       = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    v252       = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    v255       = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    v256       = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    v259       = 0.125d0*M_xxyyzz
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    v260       = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    v261       = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    v373       = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v377       = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v382       = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz   = -(M_xxyzzz + M_yyyzzz)
    v397       = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz   = -(M_xxzzzz + M_yyzzzz)
    v388       = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v352       = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    v355       = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v356       = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v359       = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    v360       = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    v361       = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v364       = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v365       = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    v366       = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v367       = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v371       = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v374       = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v378       = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v383       = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz  = -(M_xxyzzzz + M_yyyzzzz)
    v399       = 0.00138888888888889d0*M_yzzzzzz
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    v389       = 0.000198412698412698d0*M_zzzzzzz
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v400       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v400
    v24        = 7.0d0*v0
    a3         = a1*a2
    a4         = a2*a2
    v19        = a4
    v54        = 33.0d0*v19
    v82        = 143.0d0*v19
    a5         = a2*a3
    a6         = a3*a3
    v49        = a6
    v73        = 429.0d0*v49
    v74        = -v73
    a7         = a3*a4
    a8         = a4*a4
    b2         = b1*b1
    v1         = b2
    v401       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v402       = v1*v19
    v27        = v401
    v29        = 7.0d0*v1
    v59        = v402
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v403       = v0*v31
    v65        = v403
    v66        = 33.0d0*v31
    v90        = 143.0d0*v31
    v91        = -429.0d0*v65
    b5         = b2*b3
    b6         = b3*b3
    v68        = b6
    v92        = 429.0d0*v68
    v93        = -v92
    b7         = b3*b4
    b8         = b4*b4
    c2         = c1*c1
    h          = c2 + v0 + v1
    v404       = 3.0d0*h
    v405       = h*v0
    v406       = h*v1
    v407       = h*v19
    v409       = v1*v405
    v411       = h*v31
    v4         = -h
    v12        = v404
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v408       = v0*v17
    v410       = v1*v17
    v18        = 3.0d0*v17
    v20        = v405
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v406
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 - 945.0d0*v19 + 630.0d0*v405
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 - 945.0d0*v31 + 630.0d0*v406
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v407
    v51        = v408
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v409
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v410
    v67        = v33 + v53 + v66
    v69        = v411
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v425       = -v85
    v86        = 9.0d0*v17
    v87        = 198.0d0*v57
    v88        = h*v66
    v89        = -18.0d0*v64 + v46 + v88
    v94        = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97        = h*h*h*h
    v98        = 35.0d0*v97
    v99        = 12012.0d0*h
    v100       = v17*v19
    v101       = v0*v46
    v103       = -v72
    v104       = v103 + 715.0d0*v49 - 1001.0d0*v50 + 385.0d0*v51
    v106       = v17*v401
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v426       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v116       = -v108
    v117       = -1430.0d0*v57
    v427       = v116 + v117
    v119       = -1351350.0d0*v409
    v428       = v111 + v119
    v131       = v1*v46
    v132       = v31*v405
    v134       = -(3.0d0*v46 + 286.0d0*v57)
    v208       = v17*v31
    v290       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
    u2         = 1.0/h
    u          = sqrt(u2)
    u3         = u*u2
    v2         = u3
    D_x        = -v2*x
    D_y        = -v2*y
    D_z        = -v2*z
    u4         = u2*u2
    u5         = u2*u3
    v3         = u5
    v412       = 3.0d0*v3
    v6         = v412*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v412*v419
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v413       = 3.0d0*v8
    v9         = v8*x
    v11        = v413*(h - v10)
    D_xxx      = -3.0d0*v9*(v400 - v404)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    D_xyz      = -v415*v9
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = v413*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v414       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v414*y
    v26        = v414*z
    v28        = v15*v415
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v262       = 0.5d0*D_xxyy
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    v277       = 0.5d0*D_xxzz
    D_xyyy     = v22*v30
    D_xyyz     = v26*(v29 + v4)
    D_xyzz     = -(D_xxxy + D_xyyy)
    v334       = 0.5d0*D_xyzz
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v431       = v34*z
    v416       = 15.0d0*v34
    v35        = v416*x
    v39        = v431
    v41        = 315.0d0*v417*v431
    v42        = v416*y
    D_xxxxx    = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy    = v34*v38*y
    D_xxxxz    = v38*v39
    D_xxxyy    = v35*(v40 + h*v24 + 21.0d0*v32)
    v189       = 0.5d0*D_xxxyy
    D_xxxyz    = v41*(h - v5)
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    v199       = 0.5d0*D_xxxzz
    D_xxyyy    = v42*(v40 + h*v29 + 21.0d0*v20)
    v228       = 0.5d0*D_xxyyy
    v263       = 0.166666666666667d0*D_xxyyy
    D_xxyyz    = v39*(v36 - 945.0d0*v401 + 105.0d0*(v405 + v406))
    v273       = 0.5d0*D_xxyyz
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    v238       = 0.5d0*D_xxyzz
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    v278       = 0.166666666666667d0*D_xxzzz
    v286       = 0.5d0*D_xxzzz
    D_xyyyy    = v34*v43*x
    D_xyyyz    = v41*(h - v7)
    v330       = 0.5d0*D_xyyyz
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    v314       = 0.5d0*D_xyyzz
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
    v335       = 0.166666666666667d0*D_xyzzz
    v343       = 0.5d0*D_xyzzz
    D_xzzzz    = -(D_xxxzz + D_xyyzz)
    D_yyyyy    = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz    = v39*v43
    D_yyyzz    = -(D_xxyyy + D_yyyyy)
    D_yyzzz    = -(D_xxyyz + D_yyyyz)
    D_yzzzz    = -(D_xxyzz + D_yyyzz)
    D_zzzzz    = -(D_xxzzz + D_yyzzz)
    u12        = u6*u6
    u13        = u6*u7
    v44        = u13
    v432       = 315.0d0*v44
    v418       = v432*x
    v45        = 45.0d0*v44
    v52        = v418*y
    v56        = v418*z
    v60        = v419*v432
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 + v17*v29 - 21.0d0*v407 + 14.0d0*v51 + 231.0d0*v59)
    v149       = 0.5d0*D_xxxxyy
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    v155       = 0.5d0*D_xxxxzz
    D_xxxyyy   = 945.0d0*v417*v44*(11.0d0*v27 + v17 + v61 + v62)
    v168       = 0.5d0*D_xxxyyy
    v190       = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    v196       = 0.5d0*D_xxxyyz
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    v174       = 0.5d0*D_xxxyzz
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    v200       = 0.166666666666667d0*D_xxxzzz
    v205       = 0.5d0*D_xxxzzz
    D_xxyyyy   = v45*(v58 + v17*v24 - 21.0d0*v411 + 14.0d0*v64 + 231.0d0*v65)
    v217       = 0.5d0*D_xxyyyy
    v229       = 0.166666666666667d0*D_xxyyyy
    v264       = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz   = v60*(-9.0d0*v20 + v62 + v63)
    v235       = 0.5d0*D_xxyyyz
    v270       = 0.166666666666667d0*D_xxyyyz
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    v223       = 0.5d0*D_xxyyzz
    v274       = 0.25d0*D_xxyyzz
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    v239       = 0.166666666666667d0*D_xxyzzz
    v244       = 0.5d0*D_xxyzzz
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    v279       = 0.0416666666666667d0*D_xxzzzz
    v287       = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy   = v52*v67
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    v311       = 0.5d0*D_xyyyyz
    v327       = 0.166666666666667d0*D_xyyyyz
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    v302       = 0.5d0*D_xyyyzz
    v331       = 0.25d0*D_xyyyzz
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    v315       = 0.166666666666667d0*D_xyyzzz
    v320       = 0.5d0*D_xyyzzz
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
    v336       = 0.0416666666666667d0*D_xyzzzz
    v344       = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz   = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy   = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz   = v60*v67
    D_yyyyzz   = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz   = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz   = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz   = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz   = -(D_xxzzzz + D_yyzzzz)
    u14        = u7*u7
    u15        = u7*u8
    v70        = u15
    v433       = 945.0d0*v70
    v420       = 315.0d0*v70
    v71        = v420*x
    v75        = v420*y
    v77        = v420*z
    v81        = v419*v433*x
    v83        = v433
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    L_xxxxxxx  = D_xxxxxxx*M_0
    D_xxxxxxy  = v75*v76
    L_xxxxxxy  = D_xxxxxxy*M_0
    D_xxxxxxz  = v76*v77
    L_xxxxxxz  = D_xxxxxxz*M_0
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v125       = 0.5d0*D_xxxxxyy
    L_xxxxxyy  = D_xxxxxyy*M_0
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxyz  = D_xxxxxyz*M_0
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    v128       = 0.5d0*D_xxxxxzz
    D_xxxxyyy  = -v83*y*(v425 + v1*v18 + v1*v82 - v84)
    v137       = 0.5d0*D_xxxxyyy
    v150       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy  = D_xxxxyyy*M_0
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    v153       = 0.5d0*D_xxxxyyz
    L_xxxxyyz  = D_xxxxyyz*M_0
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    v140       = 0.5d0*D_xxxxyzz
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    v156       = 0.166666666666667d0*D_xxxxzzz
    v158       = 0.5d0*D_xxxxzzz
    D_xxxyyyy  = -v83*x*(v425 + v0*v18 + v0*v90 - v89)
    v162       = 0.5d0*D_xxxyyyy
    v169       = 0.166666666666667d0*D_xxxyyyy
    v191       = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy  = D_xxxyyyy*M_0
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v172       = 0.5d0*D_xxxyyyz
    v194       = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyyz  = D_xxxyyyz*M_0
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    v165       = 0.5d0*D_xxxyyzz
    v197       = 0.25d0*D_xxxyyzz
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    v175       = 0.166666666666667d0*D_xxxyzzz
    v177       = 0.5d0*D_xxxyzzz
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    v201       = 0.0416666666666667d0*D_xxxzzzz
    v206       = 0.166666666666667d0*D_xxxzzzz
    D_xxyyyyy  = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    v211       = 0.5d0*D_xxyyyyy
    v218       = 0.166666666666667d0*D_xxyyyyy
    v230       = 0.0416666666666667d0*D_xxyyyyy
    v265       = 0.00833333333333333d0*D_xxyyyyy
    L_xxyyyyy  = D_xxyyyyy*M_0
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    v221       = 0.5d0*D_xxyyyyz
    v233       = 0.166666666666667d0*D_xxyyyyz
    v268       = 0.0416666666666667d0*D_xxyyyyz
    L_xxyyyyz  = D_xxyyyyz*M_0
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    v214       = 0.5d0*D_xxyyyzz
    v236       = 0.25d0*D_xxyyyzz
    v271       = 0.0833333333333333d0*D_xxyyyzz
    v283       = 0.166666666666667d0*D_xxyyyzz
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    v224       = 0.166666666666667d0*D_xxyyzzz
    v226       = 0.5d0*D_xxyyzzz
    v275       = 0.0833333333333333d0*D_xxyyzzz
    v284       = 0.25d0*D_xxyyzzz
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    v240       = 0.0416666666666667d0*D_xxyzzzz
    v245       = 0.166666666666667d0*D_xxyzzzz
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    v280       = 0.00833333333333333d0*D_xxzzzzz
    v288       = 0.0416666666666667d0*D_xxzzzzz
    D_xyyyyyy  = v71*v94
    L_xyyyyyy  = D_xyyyyyy*M_0
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    v300       = 0.5d0*D_xyyyyyz
    v309       = 0.166666666666667d0*D_xyyyyyz
    v325       = 0.0416666666666667d0*D_xyyyyyz
    L_xyyyyyz  = D_xyyyyyz*M_0
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    v295       = 0.5d0*D_xyyyyzz
    v312       = 0.25d0*D_xyyyyzz
    v328       = 0.0833333333333333d0*D_xyyyyzz
    v340       = 0.166666666666667d0*D_xyyyyzz
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    v303       = 0.166666666666667d0*D_xyyyzzz
    v305       = 0.5d0*D_xyyyzzz
    v332       = 0.0833333333333333d0*D_xyyyzzz
    v341       = 0.25d0*D_xyyyzzz
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    v316       = 0.0416666666666667d0*D_xyyzzzz
    v321       = 0.166666666666667d0*D_xyyzzzz
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    v337       = 0.00833333333333333d0*D_xyzzzzz
    v345       = 0.0416666666666667d0*D_xyzzzzz
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    L_yyyyyyy  = D_yyyyyyy*M_0
    D_yyyyyyz  = v77*v94
    L_yyyyyyz  = D_yyyyyyz*M_0
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v421       = v430*v95
    v422       = v95*z
    v423       = v422*x
    v424       = v422*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v421
    v105       = 2835.0d0*v423
    v110       = v424
    v115       = 945.0d0*v421
    v118       = v423
    v133       = 2835.0d0*v424
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = v104*v105
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = -v96*(v426 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    v113       = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v408 + 155925.0d0*(-13.0d0*v407 + 13.0d0*v49))
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    v114       = 0.5d0*D_xxxxxxzz
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxxx*v112 + D_xxxxxxxy*M_xy + D_xxxxxxxz*M_xz + &
      D_xxxxxxyz*M_yz + M_yy*v113 + M_zz*v114
    D_xxxxxyyy = v115*(v427 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v120       = 0.5d0*D_xxxxxyyy
    v126       = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = v118*(v428 + 2027025.0d0*v402 - 135135.0d0*v407 + 103950.0d0*v408 + &
      155925.0d0*v410)
    v127       = 0.5d0*D_xxxxxyyz
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    v121       = 0.5d0*D_xxxxxyzz
    L_xxxxxy   = D_xxxxxxxy*v112 + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + D_xxxxxy*M_0 + &
      D_xxxxxyyz*M_yz + M_yy*v120 + M_zz*v121
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    v129       = 0.166666666666667d0*D_xxxxxzzz
    v130       = 0.5d0*D_xxxxxzzz
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxxx*v112 + D_xxxxxxxx*v122 + D_xxxxxxxy*v123 + &
      D_xxxxxxxz*v124 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz* &
      M_xz + D_xxxxxyz*M_yz + M_xyy*v113 + M_xzz*v114 + M_yy*v125 + &
      M_yyy*v126 + M_yyz*v127 + M_yzz*v121 + M_zz*v128 + M_zzz*v129
    L_xxxxxz   = D_xxxxxxxz*v112 + D_xxxxxxyz*M_xy + D_xxxxxxzz*M_xz + D_xxxxxyzz*M_yz + &
      D_xxxxxz*M_0 + M_yy*v127 + M_zz*v130
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v131) - 858.0d0*(v1*v50 + v132))
    v135       = 0.5d0*D_xxxxyyyy
    v138       = 0.166666666666667d0*D_xxxxyyyy
    v151       = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = v133*(v134 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v139       = 0.5d0*D_xxxxyyyz
    v152       = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    v136       = 0.5d0*D_xxxxyyzz
    v154       = 0.25d0*D_xxxxyyzz
    L_xxxxyy   = D_xxxxxxyy*v112 + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + D_xxxxyy*M_0 + &
      D_xxxxyyyz*M_yz + M_yy*v135 + M_zz*v136
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    v141       = 0.166666666666667d0*D_xxxxyzzz
    v142       = 0.5d0*D_xxxxyzzz
    L_xxxxy    = D_xxxxxxxy*v122 + D_xxxxxxy*v112 + D_xxxxxxyy*v123 + D_xxxxxxyz*v124 + &
      D_xxxxxyy*M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 &
      + D_xxxxyyz*M_yz + M_xyy*v120 + M_xzz*v121 + M_yy*v137 + M_yyy* &
      v138 + M_yyz*v139 + M_yzz*v136 + M_zz*v140 + M_zzz*v141
    L_xxxxyz   = D_xxxxxxyz*v112 + D_xxxxxyyz*M_xy + D_xxxxxyzz*M_xz + D_xxxxyyzz*M_yz + &
      D_xxxxyz*M_0 + M_yy*v139 + M_zz*v142
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    v157       = 0.0416666666666667d0*D_xxxxzzzz
    v159       = 0.166666666666667d0*D_xxxxzzzz
    L_xxxx     = D_xxxx*M_0 + D_xxxxxx*v112 + D_xxxxxxx*v122 + D_xxxxxxxx*v143 + &
      D_xxxxxxxy*v144 + D_xxxxxxxz*v145 + D_xxxxxxy*v123 + D_xxxxxxyy* &
      v146 + D_xxxxxxyz*v147 + D_xxxxxxz*v124 + D_xxxxxxzz*v148 + &
      D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxyz*M_yz + &
      M_xyy*v125 + M_xyyy*v126 + M_xyyz*v127 + M_xyzz*v121 + M_xzz*v128 &
      + M_xzzz*v129 + M_yy*v149 + M_yyy*v150 + M_yyyy*v151 + M_yyyz* &
      v152 + M_yyz*v153 + M_yyzz*v154 + M_yzz*v140 + M_yzzz*v141 + M_zz &
      *v155 + M_zzz*v156 + M_zzzz*v157
    L_xxxxz    = D_xxxxxxxz*v122 + D_xxxxxxyz*v123 + D_xxxxxxz*v112 + D_xxxxxxzz*v124 + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz* &
      M_yz + D_xxxxz*M_0 + M_xyy*v127 + M_xzz*v130 + M_yy*v153 + M_yyy* &
      v152 + M_yyz*v136 + M_yzz*v142 + M_zz*v158 + M_zzz*v159
    D_xxxyyyyy = v115*(v427 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v160       = 0.5d0*D_xxxyyyyy
    v163       = 0.166666666666667d0*D_xxxyyyyy
    v170       = 0.0416666666666667d0*D_xxxyyyyy
    v192       = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = v105*(v134 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v164       = 0.5d0*D_xxxyyyyz
    v171       = 0.166666666666667d0*D_xxxyyyyz
    v193       = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    v161       = 0.5d0*D_xxxyyyzz
    v173       = 0.25d0*D_xxxyyyzz
    v195       = 0.0833333333333333d0*D_xxxyyyzz
    v203       = 0.166666666666667d0*D_xxxyyyzz
    L_xxxyyy   = D_xxxxxyyy*v112 + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + D_xxxyyy*M_0 + &
      D_xxxyyyyz*M_yz + M_yy*v160 + M_zz*v161
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    v166       = 0.166666666666667d0*D_xxxyyzzz
    v167       = 0.5d0*D_xxxyyzzz
    v198       = 0.0833333333333333d0*D_xxxyyzzz
    v204       = 0.25d0*D_xxxyyzzz
    L_xxxyy    = D_xxxxxxyy*v122 + D_xxxxxyy*v112 + D_xxxxxyyy*v123 + D_xxxxxyyz*v124 + &
      D_xxxxyyy*M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 &
      + D_xxxyyyz*M_yz + M_xyy*v135 + M_xzz*v136 + M_yy*v162 + M_yyy* &
      v163 + M_yyz*v164 + M_yzz*v161 + M_zz*v165 + M_zzz*v166
    L_xxxyyz   = D_xxxxxyyz*v112 + D_xxxxyyyz*M_xy + D_xxxxyyzz*M_xz + D_xxxyyyzz*M_yz + &
      D_xxxyyz*M_0 + M_yy*v164 + M_zz*v167
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    v176       = 0.0416666666666667d0*D_xxxyzzzz
    v178       = 0.166666666666667d0*D_xxxyzzzz
    L_xxxy     = D_xxxxxxxy*v143 + D_xxxxxxy*v122 + D_xxxxxxyy*v144 + D_xxxxxxyz*v145 + &
      D_xxxxxy*v112 + D_xxxxxyy*v123 + D_xxxxxyyy*v146 + D_xxxxxyyz* &
      v147 + D_xxxxxyz*v124 + D_xxxxxyzz*v148 + D_xxxxyy*M_xy + &
      D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz*M_yz + &
      M_xyy*v137 + M_xyyy*v138 + M_xyyz*v139 + M_xyzz*v136 + M_xzz*v140 &
      + M_xzzz*v141 + M_yy*v168 + M_yyy*v169 + M_yyyy*v170 + M_yyyz* &
      v171 + M_yyz*v172 + M_yyzz*v173 + M_yzz*v165 + M_yzzz*v166 + M_zz &
      *v174 + M_zzz*v175 + M_zzzz*v176
    L_xxxyz    = D_xxxxxxyz*v122 + D_xxxxxyyz*v123 + D_xxxxxyz*v112 + D_xxxxxyzz*v124 + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz* &
      M_yz + D_xxxyz*M_0 + M_xyy*v139 + M_xzz*v142 + M_yy*v172 + M_yyy* &
      v171 + M_yyz*v161 + M_yzz*v167 + M_zz*v177 + M_zzz*v178
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    v202       = 0.00833333333333333d0*D_xxxzzzzz
    v207       = 0.0416666666666667d0*D_xxxzzzzz
    L_xxx      = D_xxx*M_0 + D_xxxxx*v112 + D_xxxxxx*v122 + D_xxxxxxx*v143 + D_xxxxxxxx* &
      v179 + D_xxxxxxxy*v180 + D_xxxxxxxz*v181 + D_xxxxxxy*v144 + &
      D_xxxxxxyy*v182 + D_xxxxxxyz*v183 + D_xxxxxxz*v145 + D_xxxxxxzz* &
      v184 + D_xxxxxy*v123 + D_xxxxxyy*v146 + D_xxxxxyyy*v185 + &
      D_xxxxxyyz*v186 + D_xxxxxyz*v147 + D_xxxxxyzz*v187 + D_xxxxxz* &
      v124 + D_xxxxxzz*v148 + D_xxxxxzzz*v188 + D_xxxxy*M_xy + D_xxxxyz &
      *M_xyz + D_xxxxz*M_xz + D_xxxyz*M_yz + M_xyy*v149 + M_xyyy*v150 + &
      M_xyyyy*v151 + M_xyyyz*v152 + M_xyyz*v153 + M_xyyzz*v154 + M_xyzz &
      *v140 + M_xyzzz*v141 + M_xzz*v155 + M_xzzz*v156 + M_xzzzz*v157 + &
      M_yy*v189 + M_yyy*v190 + M_yyyy*v191 + M_yyyyy*v192 + M_yyyyz* &
      v193 + M_yyyz*v194 + M_yyyzz*v195 + M_yyz*v196 + M_yyzz*v197 + &
      M_yyzzz*v198 + M_yzz*v174 + M_yzzz*v175 + M_yzzzz*v176 + M_zz* &
      v199 + M_zzz*v200 + M_zzzz*v201 + M_zzzzz*v202
    L_xxxz     = D_xxxxxxxz*v143 + D_xxxxxxyz*v144 + D_xxxxxxz*v122 + D_xxxxxxzz*v145 + &
      D_xxxxxyyz*v146 + D_xxxxxyz*v123 + D_xxxxxyzz*v147 + D_xxxxxz* &
      v112 + D_xxxxxzz*v124 + D_xxxxxzzz*v148 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz*M_0 + &
      M_xyy*v153 + M_xyyy*v152 + M_xyyz*v136 + M_xyzz*v142 + M_xzz*v158 &
      + M_xzzz*v159 + M_yy*v196 + M_yyy*v194 + M_yyyy*v193 + M_yyyz* &
      v203 + M_yyz*v165 + M_yyzz*v204 + M_yzz*v177 + M_yzzz*v178 + M_zz &
      *v205 + M_zzz*v206 + M_zzzz*v207
    D_xxyyyyyy = -v96*(v426 + h*v92 + v0*v108 + 135.0d0*v131 - 495.0d0*v208 + 6435.0d0*( &
      -v0*v68 + v132))
    v209       = 0.5d0*D_xxyyyyyy
    v212       = 0.166666666666667d0*D_xxyyyyyy
    v219       = 0.0416666666666667d0*D_xxyyyyyy
    v231       = 0.00833333333333333d0*D_xxyyyyyy
    v266       = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = v110*(v428 + 2027025.0d0*v403 + 155925.0d0*v408 + 103950.0d0*v410 - &
      135135.0d0*v411)
    v213       = 0.5d0*D_xxyyyyyz
    v220       = 0.166666666666667d0*D_xxyyyyyz
    v232       = 0.0416666666666667d0*D_xxyyyyyz
    v267       = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    v210       = 0.5d0*D_xxyyyyzz
    v222       = 0.25d0*D_xxyyyyzz
    v234       = 0.0833333333333333d0*D_xxyyyyzz
    v242       = 0.166666666666667d0*D_xxyyyyzz
    v269       = 0.0208333333333333d0*D_xxyyyyzz
    v282       = 0.0416666666666667d0*D_xxyyyyzz
    L_xxyyyy   = D_xxxxyyyy*v112 + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + D_xxyyyy*M_0 + &
      D_xxyyyyyz*M_yz + M_yy*v209 + M_zz*v210
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    v215       = 0.166666666666667d0*D_xxyyyzzz
    v216       = 0.5d0*D_xxyyyzzz
    v237       = 0.0833333333333333d0*D_xxyyyzzz
    v243       = 0.25d0*D_xxyyyzzz
    v272       = 0.0277777777777778d0*D_xxyyyzzz
    L_xxyyy    = D_xxxxxyyy*v122 + D_xxxxyyy*v112 + D_xxxxyyyy*v123 + D_xxxxyyyz*v124 + &
      D_xxxyyyy*M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 &
      + D_xxyyyyz*M_yz + M_xyy*v160 + M_xzz*v161 + M_yy*v211 + M_yyy* &
      v212 + M_yyz*v213 + M_yzz*v210 + M_zz*v214 + M_zzz*v215
    L_xxyyyz   = D_xxxxyyyz*v112 + D_xxxyyyyz*M_xy + D_xxxyyyzz*M_xz + D_xxyyyyzz*M_yz + &
      D_xxyyyz*M_0 + M_yy*v213 + M_zz*v216
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    v225       = 0.0416666666666667d0*D_xxyyzzzz
    v227       = 0.166666666666667d0*D_xxyyzzzz
    v276       = 0.0208333333333333d0*D_xxyyzzzz
    v285       = 0.0833333333333333d0*D_xxyyzzzz
    L_xxyy     = D_xxxxxxyy*v143 + D_xxxxxyy*v122 + D_xxxxxyyy*v144 + D_xxxxxyyz*v145 + &
      D_xxxxyy*v112 + D_xxxxyyy*v123 + D_xxxxyyyy*v146 + D_xxxxyyyz* &
      v147 + D_xxxxyyz*v124 + D_xxxxyyzz*v148 + D_xxxyyy*M_xy + &
      D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz*M_yz + &
      M_xyy*v162 + M_xyyy*v163 + M_xyyz*v164 + M_xyzz*v161 + M_xzz*v165 &
      + M_xzzz*v166 + M_yy*v217 + M_yyy*v218 + M_yyyy*v219 + M_yyyz* &
      v220 + M_yyz*v221 + M_yyzz*v222 + M_yzz*v214 + M_yzzz*v215 + M_zz &
      *v223 + M_zzz*v224 + M_zzzz*v225
    L_xxyyz    = D_xxxxxyyz*v122 + D_xxxxyyyz*v123 + D_xxxxyyz*v112 + D_xxxxyyzz*v124 + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz* &
      M_yz + D_xxyyz*M_0 + M_xyy*v164 + M_xzz*v167 + M_yy*v221 + M_yyy* &
      v220 + M_yyz*v210 + M_yzz*v216 + M_zz*v226 + M_zzz*v227
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    v241       = 0.00833333333333333d0*D_xxyzzzzz
    v246       = 0.0416666666666667d0*D_xxyzzzzz
    L_xxy      = D_xxxxxxxy*v179 + D_xxxxxxy*v143 + D_xxxxxxyy*v180 + D_xxxxxxyz*v181 + &
      D_xxxxxy*v122 + D_xxxxxyy*v144 + D_xxxxxyyy*v182 + D_xxxxxyyz* &
      v183 + D_xxxxxyz*v145 + D_xxxxxyzz*v184 + D_xxxxy*v112 + D_xxxxyy &
      *v123 + D_xxxxyyy*v146 + D_xxxxyyyy*v185 + D_xxxxyyyz*v186 + &
      D_xxxxyyz*v147 + D_xxxxyyzz*v187 + D_xxxxyz*v124 + D_xxxxyzz*v148 &
      + D_xxxxyzzz*v188 + D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz &
      + D_xxy*M_0 + D_xxyyz*M_yz + M_xyy*v168 + M_xyyy*v169 + M_xyyyy* &
      v170 + M_xyyyz*v171 + M_xyyz*v172 + M_xyyzz*v173 + M_xyzz*v165 + &
      M_xyzzz*v166 + M_xzz*v174 + M_xzzz*v175 + M_xzzzz*v176 + M_yy* &
      v228 + M_yyy*v229 + M_yyyy*v230 + M_yyyyy*v231 + M_yyyyz*v232 + &
      M_yyyz*v233 + M_yyyzz*v234 + M_yyz*v235 + M_yyzz*v236 + M_yyzzz* &
      v237 + M_yzz*v223 + M_yzzz*v224 + M_yzzzz*v225 + M_zz*v238 + &
      M_zzz*v239 + M_zzzz*v240 + M_zzzzz*v241
    L_xxyz     = D_xxxxxxyz*v143 + D_xxxxxyyz*v144 + D_xxxxxyz*v122 + D_xxxxxyzz*v145 + &
      D_xxxxyyyz*v146 + D_xxxxyyz*v123 + D_xxxxyyzz*v147 + D_xxxxyz* &
      v112 + D_xxxxyzz*v124 + D_xxxxyzzz*v148 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz*M_0 + &
      M_xyy*v172 + M_xyyy*v171 + M_xyyz*v161 + M_xyzz*v167 + M_xzz*v177 &
      + M_xzzz*v178 + M_yy*v235 + M_yyy*v233 + M_yyyy*v232 + M_yyyz* &
      v242 + M_yyz*v214 + M_yyzz*v243 + M_yzz*v226 + M_yzzz*v227 + M_zz &
      *v244 + M_zzz*v245 + M_zzzz*v246
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    v281       = 0.00138888888888889d0*D_xxzzzzzz
    v289       = 0.00833333333333333d0*D_xxzzzzzz
    L_xx       = D_xx*M_0 + D_xxxx*v112 + D_xxxxx*v122 + D_xxxxxx*v143 + D_xxxxxxx*v179 + &
      D_xxxxxxxx*v247 + D_xxxxxxxy*v248 + D_xxxxxxxz*v249 + D_xxxxxxy* &
      v180 + D_xxxxxxyy*v250 + D_xxxxxxyz*v251 + D_xxxxxxz*v181 + &
      D_xxxxxxzz*v252 + D_xxxxxy*v144 + D_xxxxxyy*v182 + D_xxxxxyyy* &
      v253 + D_xxxxxyyz*v254 + D_xxxxxyz*v183 + D_xxxxxyzz*v255 + &
      D_xxxxxz*v145 + D_xxxxxzz*v184 + D_xxxxxzzz*v256 + D_xxxxy*v123 + &
      D_xxxxyy*v146 + D_xxxxyyy*v185 + D_xxxxyyyy*v257 + D_xxxxyyyz* &
      v258 + D_xxxxyyz*v186 + D_xxxxyyzz*v259 + D_xxxxyz*v147 + &
      D_xxxxyzz*v187 + D_xxxxyzzz*v260 + D_xxxxz*v124 + D_xxxxzz*v148 + &
      D_xxxxzzz*v188 + D_xxxxzzzz*v261 + D_xxxy*M_xy + D_xxxyz*M_xyz + &
      D_xxxz*M_xz + D_xxyz*M_yz + M_xyy*v189 + M_xyyy*v190 + M_xyyyy* &
      v191 + M_xyyyyy*v192 + M_xyyyyz*v193 + M_xyyyz*v194 + M_xyyyzz* &
      v195 + M_xyyz*v196 + M_xyyzz*v197 + M_xyyzzz*v198 + M_xyzz*v174 + &
      M_xyzzz*v175 + M_xyzzzz*v176 + M_xzz*v199 + M_xzzz*v200 + M_xzzzz &
      *v201 + M_xzzzzz*v202 + M_yy*v262 + M_yyy*v263 + M_yyyy*v264 + &
      M_yyyyy*v265 + M_yyyyyy*v266 + M_yyyyyz*v267 + M_yyyyz*v268 + &
      M_yyyyzz*v269 + M_yyyz*v270 + M_yyyzz*v271 + M_yyyzzz*v272 + &
      M_yyz*v273 + M_yyzz*v274 + M_yyzzz*v275 + M_yyzzzz*v276 + M_yzz* &
      v238 + M_yzzz*v239 + M_yzzzz*v240 + M_yzzzzz*v241 + M_zz*v277 + &
      M_zzz*v278 + M_zzzz*v279 + M_zzzzz*v280 + M_zzzzzz*v281
    L_xxz      = D_xxxxxxxz*v179 + D_xxxxxxyz*v180 + D_xxxxxxz*v143 + D_xxxxxxzz*v181 + &
      D_xxxxxyyz*v182 + D_xxxxxyz*v144 + D_xxxxxyzz*v183 + D_xxxxxz* &
      v122 + D_xxxxxzz*v145 + D_xxxxxzzz*v184 + D_xxxxyyyz*v185 + &
      D_xxxxyyz*v146 + D_xxxxyyzz*v186 + D_xxxxyz*v123 + D_xxxxyzz*v147 &
      + D_xxxxyzzz*v187 + D_xxxxz*v112 + D_xxxxzz*v124 + D_xxxxzzz*v148 &
      + D_xxxxzzzz*v188 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz &
      + D_xxyzz*M_yz + D_xxz*M_0 + M_xyy*v196 + M_xyyy*v194 + M_xyyyy* &
      v193 + M_xyyyz*v203 + M_xyyz*v165 + M_xyyzz*v204 + M_xyzz*v177 + &
      M_xyzzz*v178 + M_xzz*v205 + M_xzzz*v206 + M_xzzzz*v207 + M_yy* &
      v273 + M_yyy*v270 + M_yyyy*v268 + M_yyyyy*v267 + M_yyyyz*v282 + &
      M_yyyz*v283 + M_yyyzz*v237 + M_yyz*v223 + M_yyzz*v284 + M_yyzzz* &
      v285 + M_yzz*v244 + M_yzzz*v245 + M_yzzzz*v246 + M_zz*v286 + &
      M_zzz*v287 + M_zzzz*v288 + M_zzzzz*v289
    D_xyyyyyyy = v102*v290
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = v118*(v111 + 467775.0d0*v410 + 155925.0d0*(-13.0d0*v411 + 13.0d0*v68))
    v294       = 0.5d0*D_xyyyyyyz
    v299       = 0.166666666666667d0*D_xyyyyyyz
    v308       = 0.0416666666666667d0*D_xyyyyyyz
    v324       = 0.00833333333333333d0*D_xyyyyyyz
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    v292       = 0.5d0*D_xyyyyyzz
    v301       = 0.25d0*D_xyyyyyzz
    v310       = 0.0833333333333333d0*D_xyyyyyzz
    v318       = 0.166666666666667d0*D_xyyyyyzz
    v326       = 0.0208333333333333d0*D_xyyyyyzz
    v339       = 0.0416666666666667d0*D_xyyyyyzz
    L_xyyyyy   = D_xxxyyyyy*v112 + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + D_xyyyyy*M_0 + &
      D_xyyyyyyy*v291 + D_xyyyyyyz*M_yz + M_zz*v292
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    v296       = 0.166666666666667d0*D_xyyyyzzz
    v297       = 0.5d0*D_xyyyyzzz
    v313       = 0.0833333333333333d0*D_xyyyyzzz
    v319       = 0.25d0*D_xyyyyzzz
    v329       = 0.0277777777777778d0*D_xyyyyzzz
    L_xyyyy    = D_xxxxyyyy*v122 + D_xxxyyyy*v112 + D_xxxyyyyy*v123 + D_xxxyyyyz*v124 + &
      D_xxyyyyy*M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 &
      + D_xyyyyyy*v291 + D_xyyyyyyy*v293 + D_xyyyyyz*M_yz + M_xyy*v209 &
      + M_xzz*v210 + M_yyz*v294 + M_yzz*v292 + M_zz*v295 + M_zzz*v296
    L_xyyyyz   = D_xxxyyyyz*v112 + D_xxyyyyyz*M_xy + D_xxyyyyzz*M_xz + D_xyyyyyyz*v291 + &
      D_xyyyyyzz*M_yz + D_xyyyyz*M_0 + M_zz*v297
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    v304       = 0.0416666666666667d0*D_xyyyzzzz
    v306       = 0.166666666666667d0*D_xyyyzzzz
    v333       = 0.0208333333333333d0*D_xyyyzzzz
    v342       = 0.0833333333333333d0*D_xyyyzzzz
    L_xyyy     = D_xxxxxyyy*v143 + D_xxxxyyy*v122 + D_xxxxyyyy*v144 + D_xxxxyyyz*v145 + &
      D_xxxyyy*v112 + D_xxxyyyy*v123 + D_xxxyyyyy*v146 + D_xxxyyyyz* &
      v147 + D_xxxyyyz*v124 + D_xxxyyyzz*v148 + D_xxyyyy*M_xy + &
      D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy*v291 + &
      D_xyyyyyy*v293 + D_xyyyyyyy*v298 + D_xyyyyz*M_yz + M_xyy*v211 + &
      M_xyyy*v212 + M_xyyz*v213 + M_xyzz*v210 + M_xzz*v214 + M_xzzz* &
      v215 + M_yyyz*v299 + M_yyz*v300 + M_yyzz*v301 + M_yzz*v295 + &
      M_yzzz*v296 + M_zz*v302 + M_zzz*v303 + M_zzzz*v304
    L_xyyyz    = D_xxxxyyyz*v122 + D_xxxyyyyz*v123 + D_xxxyyyz*v112 + D_xxxyyyzz*v124 + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyyyz* &
      v293 + D_xyyyyyz*v291 + D_xyyyyzz*M_yz + D_xyyyz*M_0 + M_xyy*v213 &
      + M_xzz*v216 + M_yyz*v292 + M_yzz*v297 + M_zz*v305 + M_zzz*v306
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    v317       = 0.00833333333333333d0*D_xyyzzzzz
    v322       = 0.0416666666666667d0*D_xyyzzzzz
    L_xyy      = D_xxxxxxyy*v179 + D_xxxxxyy*v143 + D_xxxxxyyy*v180 + D_xxxxxyyz*v181 + &
      D_xxxxyy*v122 + D_xxxxyyy*v144 + D_xxxxyyyy*v182 + D_xxxxyyyz* &
      v183 + D_xxxxyyz*v145 + D_xxxxyyzz*v184 + D_xxxyy*v112 + D_xxxyyy &
      *v123 + D_xxxyyyy*v146 + D_xxxyyyyy*v185 + D_xxxyyyyz*v186 + &
      D_xxxyyyz*v147 + D_xxxyyyzz*v187 + D_xxxyyz*v124 + D_xxxyyzz*v148 &
      + D_xxxyyzzz*v188 + D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz &
      + D_xyy*M_0 + D_xyyyy*v291 + D_xyyyyy*v293 + D_xyyyyyy*v298 + &
      D_xyyyyyyy*v307 + D_xyyyz*M_yz + M_xyy*v217 + M_xyyy*v218 + &
      M_xyyyy*v219 + M_xyyyz*v220 + M_xyyz*v221 + M_xyyzz*v222 + M_xyzz &
      *v214 + M_xyzzz*v215 + M_xzz*v223 + M_xzzz*v224 + M_xzzzz*v225 + &
      M_yyyyz*v308 + M_yyyz*v309 + M_yyyzz*v310 + M_yyz*v311 + M_yyzz* &
      v312 + M_yyzzz*v313 + M_yzz*v302 + M_yzzz*v303 + M_yzzzz*v304 + &
      M_zz*v314 + M_zzz*v315 + M_zzzz*v316 + M_zzzzz*v317
    L_xyyz     = D_xxxxxyyz*v143 + D_xxxxyyyz*v144 + D_xxxxyyz*v122 + D_xxxxyyzz*v145 + &
      D_xxxyyyyz*v146 + D_xxxyyyz*v123 + D_xxxyyyzz*v147 + D_xxxyyz* &
      v112 + D_xxxyyzz*v124 + D_xxxyyzzz*v148 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyyz*v298 + D_xyyyyyz* &
      v293 + D_xyyyyz*v291 + D_xyyyzz*M_yz + D_xyyz*M_0 + M_xyy*v221 + &
      M_xyyy*v220 + M_xyyz*v210 + M_xyzz*v216 + M_xzz*v226 + M_xzzz* &
      v227 + M_yyyz*v318 + M_yyz*v295 + M_yyzz*v319 + M_yzz*v305 + &
      M_yzzz*v306 + M_zz*v320 + M_zzz*v321 + M_zzzz*v322
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    v338       = 0.00138888888888889d0*D_xyzzzzzz
    v346       = 0.00833333333333333d0*D_xyzzzzzz
    L_xy       = D_xxxxxxxy*v247 + D_xxxxxxy*v179 + D_xxxxxxyy*v248 + D_xxxxxxyz*v249 + &
      D_xxxxxy*v143 + D_xxxxxyy*v180 + D_xxxxxyyy*v250 + D_xxxxxyyz* &
      v251 + D_xxxxxyz*v181 + D_xxxxxyzz*v252 + D_xxxxy*v122 + D_xxxxyy &
      *v144 + D_xxxxyyy*v182 + D_xxxxyyyy*v253 + D_xxxxyyyz*v254 + &
      D_xxxxyyz*v183 + D_xxxxyyzz*v255 + D_xxxxyz*v145 + D_xxxxyzz*v184 &
      + D_xxxxyzzz*v256 + D_xxxy*v112 + D_xxxyy*v123 + D_xxxyyy*v146 + &
      D_xxxyyyy*v185 + D_xxxyyyyy*v257 + D_xxxyyyyz*v258 + D_xxxyyyz* &
      v186 + D_xxxyyyzz*v259 + D_xxxyyz*v147 + D_xxxyyzz*v187 + &
      D_xxxyyzzz*v260 + D_xxxyz*v124 + D_xxxyzz*v148 + D_xxxyzzz*v188 + &
      D_xxxyzzzz*v261 + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + &
      D_xy*M_0 + D_xyyy*v291 + D_xyyyy*v293 + D_xyyyyy*v298 + D_xyyyyyy &
      *v307 + D_xyyyyyyy*v323 + D_xyyz*M_yz + M_xyy*v228 + M_xyyy*v229 &
      + M_xyyyy*v230 + M_xyyyyy*v231 + M_xyyyyz*v232 + M_xyyyz*v233 + &
      M_xyyyzz*v234 + M_xyyz*v235 + M_xyyzz*v236 + M_xyyzzz*v237 + &
      M_xyzz*v223 + M_xyzzz*v224 + M_xyzzzz*v225 + M_xzz*v238 + M_xzzz* &
      v239 + M_xzzzz*v240 + M_xzzzzz*v241 + M_yyyyyz*v324 + M_yyyyz* &
      v325 + M_yyyyzz*v326 + M_yyyz*v327 + M_yyyzz*v328 + M_yyyzzz*v329 &
      + M_yyz*v330 + M_yyzz*v331 + M_yyzzz*v332 + M_yyzzzz*v333 + M_yzz &
      *v314 + M_yzzz*v315 + M_yzzzz*v316 + M_yzzzzz*v317 + M_zz*v334 + &
      M_zzz*v335 + M_zzzz*v336 + M_zzzzz*v337 + M_zzzzzz*v338
    L_xyz      = D_xxxxxxyz*v179 + D_xxxxxyyz*v180 + D_xxxxxyz*v143 + D_xxxxxyzz*v181 + &
      D_xxxxyyyz*v182 + D_xxxxyyz*v144 + D_xxxxyyzz*v183 + D_xxxxyz* &
      v122 + D_xxxxyzz*v145 + D_xxxxyzzz*v184 + D_xxxyyyyz*v185 + &
      D_xxxyyyz*v146 + D_xxxyyyzz*v186 + D_xxxyyz*v123 + D_xxxyyzz*v147 &
      + D_xxxyyzzz*v187 + D_xxxyz*v112 + D_xxxyzz*v124 + D_xxxyzzz*v148 &
      + D_xxxyzzzz*v188 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz &
      + D_xyyyyyyz*v307 + D_xyyyyyz*v298 + D_xyyyyz*v293 + D_xyyyz*v291 &
      + D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v235 + M_xyyy*v233 + M_xyyyy* &
      v232 + M_xyyyz*v242 + M_xyyz*v214 + M_xyyzz*v243 + M_xyzz*v226 + &
      M_xyzzz*v227 + M_xzz*v244 + M_xzzz*v245 + M_xzzzz*v246 + M_yyyyz* &
      v339 + M_yyyz*v340 + M_yyyzz*v313 + M_yyz*v302 + M_yyzz*v341 + &
      M_yyzzz*v342 + M_yzz*v320 + M_yzzz*v321 + M_yzzzz*v322 + M_zz* &
      v343 + M_zzz*v344 + M_zzzz*v345 + M_zzzzz*v346
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = D_x*M_0 + D_xxx*v112 + D_xxxx*v122 + D_xxxxx*v143 + D_xxxxxx*v179 + &
      D_xxxxxxx*v247 + D_xxxxxxxx*v347 + D_xxxxxxxy*v348 + D_xxxxxxxz* &
      v349 + D_xxxxxxy*v248 + D_xxxxxxyy*v350 + D_xxxxxxyz*v351 + &
      D_xxxxxxz*v249 + D_xxxxxxzz*v352 + D_xxxxxy*v180 + D_xxxxxyy*v250 &
      + D_xxxxxyyy*v353 + D_xxxxxyyz*v354 + D_xxxxxyz*v251 + D_xxxxxyzz &
      *v355 + D_xxxxxz*v181 + D_xxxxxzz*v252 + D_xxxxxzzz*v356 + &
      D_xxxxy*v144 + D_xxxxyy*v182 + D_xxxxyyy*v253 + D_xxxxyyyy*v357 + &
      D_xxxxyyyz*v358 + D_xxxxyyz*v254 + D_xxxxyyzz*v359 + D_xxxxyz* &
      v183 + D_xxxxyzz*v255 + D_xxxxyzzz*v360 + D_xxxxz*v145 + D_xxxxzz &
      *v184 + D_xxxxzzz*v256 + D_xxxxzzzz*v361 + D_xxxy*v123 + D_xxxyy* &
      v146 + D_xxxyyy*v185 + D_xxxyyyy*v257 + D_xxxyyyyy*v362 + &
      D_xxxyyyyz*v363 + D_xxxyyyz*v258 + D_xxxyyyzz*v364 + D_xxxyyz* &
      v186 + D_xxxyyzz*v259 + D_xxxyyzzz*v365 + D_xxxyz*v147 + D_xxxyzz &
      *v187 + D_xxxyzzz*v260 + D_xxxyzzzz*v366 + D_xxxz*v124 + D_xxxzz* &
      v148 + D_xxxzzz*v188 + D_xxxzzzz*v261 + D_xxxzzzzz*v367 + D_xxy* &
      M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xyy*v291 + D_xyyy*v293 + &
      D_xyyyy*v298 + D_xyyyyy*v307 + D_xyyyyyy*v323 + D_xyyyyyyy*v368 + &
      D_xyyyyyyz*v369 + D_xyyyyyz*v370 + D_xyyyyyzz*v371 + D_xyyyyz* &
      v372 + D_xyyyyzz*v373 + D_xyyyyzzz*v374 + D_xyyyz*v375 + D_xyyyzz &
      *v376 + D_xyyyzzz*v377 + D_xyyyzzzz*v378 + D_xyyz*v379 + D_xyyzz* &
      v380 + D_xyyzzz*v381 + D_xyyzzzz*v382 + D_xyyzzzzz*v383 + D_xyz* &
      M_yz + D_xzz*v384 + D_xzzz*v385 + D_xzzzz*v386 + D_xzzzzz*v387 + &
      D_xzzzzzz*v388 + D_xzzzzzzz*v389 + M_xyy*v262 + M_xyyy*v263 + &
      M_xyyyy*v264 + M_xyyyyy*v265 + M_xyyyyyy*v266 + M_xyyyyyz*v267 + &
      M_xyyyyz*v268 + M_xyyyyzz*v269 + M_xyyyz*v270 + M_xyyyzz*v271 + &
      M_xyyyzzz*v272 + M_xyyz*v273 + M_xyyzz*v274 + M_xyyzzz*v275 + &
      M_xyyzzzz*v276 + M_xyzz*v238 + M_xyzzz*v239 + M_xyzzzz*v240 + &
      M_xyzzzzz*v241 + M_xzz*v277 + M_xzzz*v278 + M_xzzzz*v279 + &
      M_xzzzzz*v280 + M_xzzzzzz*v281 + M_yzz*v334 + M_yzzz*v335 + &
      M_yzzzz*v336 + M_yzzzzz*v337 + M_yzzzzzz*v338
    L_xz       = D_xxxxxxxz*v247 + D_xxxxxxyz*v248 + D_xxxxxxz*v179 + D_xxxxxxzz*v249 + &
      D_xxxxxyyz*v250 + D_xxxxxyz*v180 + D_xxxxxyzz*v251 + D_xxxxxz* &
      v143 + D_xxxxxzz*v181 + D_xxxxxzzz*v252 + D_xxxxyyyz*v253 + &
      D_xxxxyyz*v182 + D_xxxxyyzz*v254 + D_xxxxyz*v144 + D_xxxxyzz*v183 &
      + D_xxxxyzzz*v255 + D_xxxxz*v122 + D_xxxxzz*v145 + D_xxxxzzz*v184 &
      + D_xxxxzzzz*v256 + D_xxxyyyyz*v257 + D_xxxyyyz*v185 + D_xxxyyyzz &
      *v258 + D_xxxyyz*v146 + D_xxxyyzz*v186 + D_xxxyyzzz*v259 + &
      D_xxxyz*v123 + D_xxxyzz*v147 + D_xxxyzzz*v187 + D_xxxyzzzz*v260 + &
      D_xxxz*v112 + D_xxxzz*v124 + D_xxxzzz*v148 + D_xxxzzzz*v188 + &
      D_xxxzzzzz*v261 + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxzz*M_xz + &
      D_xyyyyyyz*v323 + D_xyyyyyz*v307 + D_xyyyyyzz*v370 + D_xyyyyz* &
      v298 + D_xyyyyzz*v372 + D_xyyyyzzz*v373 + D_xyyyz*v293 + D_xyyyzz &
      *v375 + D_xyyyzzz*v376 + D_xyyyzzzz*v377 + D_xyyz*v291 + D_xyyzz* &
      v379 + D_xyyzzz*v380 + D_xyyzzzz*v381 + D_xyyzzzzz*v382 + D_xyzz* &
      M_yz + D_xz*M_0 + D_xzzz*v384 + D_xzzzz*v385 + D_xzzzzz*v386 + &
      D_xzzzzzz*v387 + D_xzzzzzzz*v388 + M_xyy*v273 + M_xyyy*v270 + &
      M_xyyyy*v268 + M_xyyyyy*v267 + M_xyyyyz*v282 + M_xyyyz*v283 + &
      M_xyyyzz*v237 + M_xyyz*v223 + M_xyyzz*v284 + M_xyyzzz*v285 + &
      M_xyzz*v244 + M_xyzzz*v245 + M_xyzzzz*v246 + M_xzz*v286 + M_xzzz* &
      v287 + M_xzzzz*v288 + M_xzzzzz*v289 + M_yzz*v343 + M_yzzz*v344 + &
      M_yzzzz*v345 + M_yzzzzz*v346
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v208 - (1260.0d0*v131 + v68*v99))
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = v133*v290
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = D_xxyyyyyy*v112 + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + &
      D_yyyyyyyy*v291 + D_yyyyyyyz*M_yz + D_yyyyyyzz*v384
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = D_xxxyyyyy*v122 + D_xxyyyyy*v112 + D_xxyyyyyy*v123 + D_xxyyyyyz*v124 + &
      D_xyyyyyy*M_xy + D_xyyyyyyy*v390 + D_xyyyyyyz*M_xyz + D_xyyyyyz* &
      M_xz + D_yyyyy*M_0 + D_yyyyyyy*v291 + D_yyyyyyyy*v293 + &
      D_yyyyyyyz*v379 + D_yyyyyyz*M_yz + D_yyyyyyzz*v391 + D_yyyyyzz* &
      v384 + D_yyyyyzzz*v385 + M_xzz*v292
    L_yyyyyz   = D_xxyyyyyz*v112 + D_xyyyyyyz*M_xy + D_xyyyyyzz*M_xz + D_yyyyyyyz*v291 + &
      D_yyyyyyzz*M_yz + D_yyyyyz*M_0 + D_yyyyyzzz*v384
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = D_xxxxyyyy*v143 + D_xxxyyyy*v122 + D_xxxyyyyy*v144 + D_xxxyyyyz*v145 + &
      D_xxyyyy*v112 + D_xxyyyyy*v123 + D_xxyyyyyy*v146 + D_xxyyyyyz* &
      v147 + D_xxyyyyz*v124 + D_xxyyyyzz*v148 + D_xyyyyy*M_xy + &
      D_xyyyyyy*v390 + D_xyyyyyyy*v392 + D_xyyyyyz*M_xyz + D_xyyyyz* &
      M_xz + D_yyyy*M_0 + D_yyyyyy*v291 + D_yyyyyyy*v293 + D_yyyyyyyy* &
      v298 + D_yyyyyyyz*v375 + D_yyyyyyz*v379 + D_yyyyyyzz*v380 + &
      D_yyyyyz*M_yz + D_yyyyyzz*v391 + D_yyyyyzzz*v393 + D_yyyyzz*v384 &
      + D_yyyyzzz*v385 + D_yyyyzzzz*v386 + M_xyyz*v294 + M_xyzz*v292 + &
      M_xzz*v295 + M_xzzz*v296
    L_yyyyz    = D_xxxyyyyz*v122 + D_xxyyyyyz*v123 + D_xxyyyyz*v112 + D_xxyyyyzz*v124 + &
      D_xyyyyyyz*v390 + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyzz* &
      M_xz + D_yyyyyyyz*v293 + D_yyyyyyz*v291 + D_yyyyyyzz*v379 + &
      D_yyyyyzz*M_yz + D_yyyyyzzz*v391 + D_yyyyz*M_0 + D_yyyyzzz*v384 + &
      D_yyyyzzzz*v385 + M_xzz*v297
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = D_xxxxxyyy*v179 + D_xxxxyyy*v143 + D_xxxxyyyy*v180 + D_xxxxyyyz*v181 + &
      D_xxxyyy*v122 + D_xxxyyyy*v144 + D_xxxyyyyy*v182 + D_xxxyyyyz* &
      v183 + D_xxxyyyz*v145 + D_xxxyyyzz*v184 + D_xxyyy*v112 + D_xxyyyy &
      *v123 + D_xxyyyyy*v146 + D_xxyyyyyy*v185 + D_xxyyyyyz*v186 + &
      D_xxyyyyz*v147 + D_xxyyyyzz*v187 + D_xxyyyz*v124 + D_xxyyyzz*v148 &
      + D_xxyyyzzz*v188 + D_xyyyy*M_xy + D_xyyyyy*v390 + D_xyyyyyy*v392 &
      + D_xyyyyyyy*v394 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v291 + D_yyyyyy*v293 + D_yyyyyyy*v298 + D_yyyyyyyy*v307 + &
      D_yyyyyyyz*v372 + D_yyyyyyz*v375 + D_yyyyyyzz*v376 + D_yyyyyz* &
      v379 + D_yyyyyzz*v380 + D_yyyyyzzz*v381 + D_yyyyz*M_yz + D_yyyyzz &
      *v391 + D_yyyyzzz*v393 + D_yyyyzzzz*v395 + D_yyyzz*v384 + &
      D_yyyzzz*v385 + D_yyyzzzz*v386 + D_yyyzzzzz*v387 + M_xyyyz*v299 + &
      M_xyyz*v300 + M_xyyzz*v301 + M_xyzz*v295 + M_xyzzz*v296 + M_xzz* &
      v302 + M_xzzz*v303 + M_xzzzz*v304
    L_yyyz     = D_xxxxyyyz*v143 + D_xxxyyyyz*v144 + D_xxxyyyz*v122 + D_xxxyyyzz*v145 + &
      D_xxyyyyyz*v146 + D_xxyyyyz*v123 + D_xxyyyyzz*v147 + D_xxyyyz* &
      v112 + D_xxyyyzz*v124 + D_xxyyyzzz*v148 + D_xyyyyyyz*v392 + &
      D_xyyyyyz*v390 + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyzz*M_xz &
      + D_yyyyyyyz*v298 + D_yyyyyyz*v293 + D_yyyyyyzz*v375 + D_yyyyyz* &
      v291 + D_yyyyyzz*v379 + D_yyyyyzzz*v380 + D_yyyyzz*M_yz + &
      D_yyyyzzz*v391 + D_yyyyzzzz*v393 + D_yyyz*M_0 + D_yyyzzz*v384 + &
      D_yyyzzzz*v385 + D_yyyzzzzz*v386 + M_xyyz*v292 + M_xyzz*v297 + &
      M_xzz*v305 + M_xzzz*v306
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = D_xxxxxxyy*v247 + D_xxxxxyy*v179 + D_xxxxxyyy*v248 + D_xxxxxyyz*v249 + &
      D_xxxxyy*v143 + D_xxxxyyy*v180 + D_xxxxyyyy*v250 + D_xxxxyyyz* &
      v251 + D_xxxxyyz*v181 + D_xxxxyyzz*v252 + D_xxxyy*v122 + D_xxxyyy &
      *v144 + D_xxxyyyy*v182 + D_xxxyyyyy*v253 + D_xxxyyyyz*v254 + &
      D_xxxyyyz*v183 + D_xxxyyyzz*v255 + D_xxxyyz*v145 + D_xxxyyzz*v184 &
      + D_xxxyyzzz*v256 + D_xxyy*v112 + D_xxyyy*v123 + D_xxyyyy*v146 + &
      D_xxyyyyy*v185 + D_xxyyyyyy*v257 + D_xxyyyyyz*v258 + D_xxyyyyz* &
      v186 + D_xxyyyyzz*v259 + D_xxyyyz*v147 + D_xxyyyzz*v187 + &
      D_xxyyyzzz*v260 + D_xxyyz*v124 + D_xxyyzz*v148 + D_xxyyzzz*v188 + &
      D_xxyyzzzz*v261 + D_xyyy*M_xy + D_xyyyy*v390 + D_xyyyyy*v392 + &
      D_xyyyyyy*v394 + D_xyyyyyyy*v396 + D_xyyyz*M_xyz + D_xyyz*M_xz + &
      D_yy*M_0 + D_yyyy*v291 + D_yyyyy*v293 + D_yyyyyy*v298 + D_yyyyyyy &
      *v307 + D_yyyyyyyy*v323 + D_yyyyyyyz*v370 + D_yyyyyyz*v372 + &
      D_yyyyyyzz*v373 + D_yyyyyz*v375 + D_yyyyyzz*v376 + D_yyyyyzzz* &
      v377 + D_yyyyz*v379 + D_yyyyzz*v380 + D_yyyyzzz*v381 + D_yyyyzzzz &
      *v382 + D_yyyz*M_yz + D_yyyzz*v391 + D_yyyzzz*v393 + D_yyyzzzz* &
      v395 + D_yyyzzzzz*v397 + D_yyzz*v384 + D_yyzzz*v385 + D_yyzzzz* &
      v386 + D_yyzzzzz*v387 + D_yyzzzzzz*v388 + M_xyyyyz*v308 + M_xyyyz &
      *v309 + M_xyyyzz*v310 + M_xyyz*v311 + M_xyyzz*v312 + M_xyyzzz* &
      v313 + M_xyzz*v302 + M_xyzzz*v303 + M_xyzzzz*v304 + M_xzz*v314 + &
      M_xzzz*v315 + M_xzzzz*v316 + M_xzzzzz*v317
    L_yyz      = D_xxxxxyyz*v179 + D_xxxxyyyz*v180 + D_xxxxyyz*v143 + D_xxxxyyzz*v181 + &
      D_xxxyyyyz*v182 + D_xxxyyyz*v144 + D_xxxyyyzz*v183 + D_xxxyyz* &
      v122 + D_xxxyyzz*v145 + D_xxxyyzzz*v184 + D_xxyyyyyz*v185 + &
      D_xxyyyyz*v146 + D_xxyyyyzz*v186 + D_xxyyyz*v123 + D_xxyyyzz*v147 &
      + D_xxyyyzzz*v187 + D_xxyyz*v112 + D_xxyyzz*v124 + D_xxyyzzz*v148 &
      + D_xxyyzzzz*v188 + D_xyyyyyyz*v394 + D_xyyyyyz*v392 + D_xyyyyz* &
      v390 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyyz* &
      v307 + D_yyyyyyz*v298 + D_yyyyyyzz*v372 + D_yyyyyz*v293 + &
      D_yyyyyzz*v375 + D_yyyyyzzz*v376 + D_yyyyz*v291 + D_yyyyzz*v379 + &
      D_yyyyzzz*v380 + D_yyyyzzzz*v381 + D_yyyzz*M_yz + D_yyyzzz*v391 + &
      D_yyyzzzz*v393 + D_yyyzzzzz*v395 + D_yyz*M_0 + D_yyzzz*v384 + &
      D_yyzzzz*v385 + D_yyzzzzz*v386 + D_yyzzzzzz*v387 + M_xyyyz*v318 + &
      M_xyyz*v295 + M_xyyzz*v319 + M_xyzz*v305 + M_xyzzz*v306 + M_xzz* &
      v320 + M_xzzz*v321 + M_xzzzz*v322
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = D_xxxxxxxy*v347 + D_xxxxxxy*v247 + D_xxxxxxyy*v348 + D_xxxxxxyz*v349 + &
      D_xxxxxy*v179 + D_xxxxxyy*v248 + D_xxxxxyyy*v350 + D_xxxxxyyz* &
      v351 + D_xxxxxyz*v249 + D_xxxxxyzz*v352 + D_xxxxy*v143 + D_xxxxyy &
      *v180 + D_xxxxyyy*v250 + D_xxxxyyyy*v353 + D_xxxxyyyz*v354 + &
      D_xxxxyyz*v251 + D_xxxxyyzz*v355 + D_xxxxyz*v181 + D_xxxxyzz*v252 &
      + D_xxxxyzzz*v356 + D_xxxy*v122 + D_xxxyy*v144 + D_xxxyyy*v182 + &
      D_xxxyyyy*v253 + D_xxxyyyyy*v357 + D_xxxyyyyz*v358 + D_xxxyyyz* &
      v254 + D_xxxyyyzz*v359 + D_xxxyyz*v183 + D_xxxyyzz*v255 + &
      D_xxxyyzzz*v360 + D_xxxyz*v145 + D_xxxyzz*v184 + D_xxxyzzz*v256 + &
      D_xxxyzzzz*v361 + D_xxy*v112 + D_xxyy*v123 + D_xxyyy*v146 + &
      D_xxyyyy*v185 + D_xxyyyyy*v257 + D_xxyyyyyy*v362 + D_xxyyyyyz* &
      v363 + D_xxyyyyz*v258 + D_xxyyyyzz*v364 + D_xxyyyz*v186 + &
      D_xxyyyzz*v259 + D_xxyyyzzz*v365 + D_xxyyz*v147 + D_xxyyzz*v187 + &
      D_xxyyzzz*v260 + D_xxyyzzzz*v366 + D_xxyz*v124 + D_xxyzz*v148 + &
      D_xxyzzz*v188 + D_xxyzzzz*v261 + D_xxyzzzzz*v367 + D_xyy*M_xy + &
      D_xyyy*v390 + D_xyyyy*v392 + D_xyyyyy*v394 + D_xyyyyyy*v396 + &
      D_xyyyyyyy*v398 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy* &
      v291 + D_yyyy*v293 + D_yyyyy*v298 + D_yyyyyy*v307 + D_yyyyyyy* &
      v323 + D_yyyyyyyy*v368 + D_yyyyyyyz*v369 + D_yyyyyyz*v370 + &
      D_yyyyyyzz*v371 + D_yyyyyz*v372 + D_yyyyyzz*v373 + D_yyyyyzzz* &
      v374 + D_yyyyz*v375 + D_yyyyzz*v376 + D_yyyyzzz*v377 + D_yyyyzzzz &
      *v378 + D_yyyz*v379 + D_yyyzz*v380 + D_yyyzzz*v381 + D_yyyzzzz* &
      v382 + D_yyyzzzzz*v383 + D_yyz*M_yz + D_yyzz*v391 + D_yyzzz*v393 &
      + D_yyzzzz*v395 + D_yyzzzzz*v397 + D_yyzzzzzz*v399 + D_yzz*v384 + &
      D_yzzz*v385 + D_yzzzz*v386 + D_yzzzzz*v387 + D_yzzzzzz*v388 + &
      D_yzzzzzzz*v389 + M_xyyyyyz*v324 + M_xyyyyz*v325 + M_xyyyyzz*v326 &
      + M_xyyyz*v327 + M_xyyyzz*v328 + M_xyyyzzz*v329 + M_xyyz*v330 + &
      M_xyyzz*v331 + M_xyyzzz*v332 + M_xyyzzzz*v333 + M_xyzz*v314 + &
      M_xyzzz*v315 + M_xyzzzz*v316 + M_xyzzzzz*v317 + M_xzz*v334 + &
      M_xzzz*v335 + M_xzzzz*v336 + M_xzzzzz*v337 + M_xzzzzzz*v338
    L_yz       = D_xxxxxxyz*v247 + D_xxxxxyyz*v248 + D_xxxxxyz*v179 + D_xxxxxyzz*v249 + &
      D_xxxxyyyz*v250 + D_xxxxyyz*v180 + D_xxxxyyzz*v251 + D_xxxxyz* &
      v143 + D_xxxxyzz*v181 + D_xxxxyzzz*v252 + D_xxxyyyyz*v253 + &
      D_xxxyyyz*v182 + D_xxxyyyzz*v254 + D_xxxyyz*v144 + D_xxxyyzz*v183 &
      + D_xxxyyzzz*v255 + D_xxxyz*v122 + D_xxxyzz*v145 + D_xxxyzzz*v184 &
      + D_xxxyzzzz*v256 + D_xxyyyyyz*v257 + D_xxyyyyz*v185 + D_xxyyyyzz &
      *v258 + D_xxyyyz*v146 + D_xxyyyzz*v186 + D_xxyyyzzz*v259 + &
      D_xxyyz*v123 + D_xxyyzz*v147 + D_xxyyzzz*v187 + D_xxyyzzzz*v260 + &
      D_xxyz*v112 + D_xxyzz*v124 + D_xxyzzz*v148 + D_xxyzzzz*v188 + &
      D_xxyzzzzz*v261 + D_xyyyyyyz*v396 + D_xyyyyyz*v394 + D_xyyyyz* &
      v392 + D_xyyyz*v390 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + &
      D_yyyyyyyz*v323 + D_yyyyyyz*v307 + D_yyyyyyzz*v370 + D_yyyyyz* &
      v298 + D_yyyyyzz*v372 + D_yyyyyzzz*v373 + D_yyyyz*v293 + D_yyyyzz &
      *v375 + D_yyyyzzz*v376 + D_yyyyzzzz*v377 + D_yyyz*v291 + D_yyyzz* &
      v379 + D_yyyzzz*v380 + D_yyyzzzz*v381 + D_yyyzzzzz*v382 + D_yyzz* &
      M_yz + D_yyzzz*v391 + D_yyzzzz*v393 + D_yyzzzzz*v395 + D_yyzzzzzz &
      *v397 + D_yz*M_0 + D_yzzz*v384 + D_yzzzz*v385 + D_yzzzzz*v386 + &
      D_yzzzzzz*v387 + D_yzzzzzzz*v388 + M_xyyyyz*v339 + M_xyyyz*v340 + &
      M_xyyyzz*v313 + M_xyyz*v302 + M_xyyzz*v341 + M_xyyzzz*v342 + &
      M_xyzz*v320 + M_xyzzz*v321 + M_xyzzzz*v322 + M_xzz*v343 + M_xzzz* &
      v344 + M_xzzzz*v345 + M_xzzzzz*v346
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_z        = 0.00138888888888889d0*(20.0d0*D_xyyyzzzz*M_xyyyzzz + 180.0d0*D_xyyzzz* &
      M_xyyzz + 60.0d0*D_xyyzzzz*M_xyyzzz + 360.0d0*D_xzzz*M_xzz + &
      D_xzzzzzzz*M_xzzzzzz + 6.0d0*(D_xyyyyyzz*M_xyyyyyz + D_xzzzzzz* &
      M_xzzzzz) + 30.0d0*(D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + &
      15.0d0*(D_xyyyyzzz*M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz) + 120.0d0*( &
      D_xyyyzz*M_xyyyz + D_xzzzz*M_xzzz)) + D_xxxxxxxz*v347 + &
      D_xxxxxxyz*v348 + D_xxxxxxz*v247 + D_xxxxxxzz*v349 + D_xxxxxyyz* &
      v350 + D_xxxxxyz*v248 + D_xxxxxyzz*v351 + D_xxxxxz*v179 + &
      D_xxxxxzz*v249 + D_xxxxxzzz*v352 + D_xxxxyyyz*v353 + D_xxxxyyz* &
      v250 + D_xxxxyyzz*v354 + D_xxxxyz*v180 + D_xxxxyzz*v251 + &
      D_xxxxyzzz*v355 + D_xxxxz*v143 + D_xxxxzz*v181 + D_xxxxzzz*v252 + &
      D_xxxxzzzz*v356 + D_xxxyyyyz*v357 + D_xxxyyyz*v253 + D_xxxyyyzz* &
      v358 + D_xxxyyz*v182 + D_xxxyyzz*v254 + D_xxxyyzzz*v359 + D_xxxyz &
      *v144 + D_xxxyzz*v183 + D_xxxyzzz*v255 + D_xxxyzzzz*v360 + D_xxxz &
      *v122 + D_xxxzz*v145 + D_xxxzzz*v184 + D_xxxzzzz*v256 + &
      D_xxxzzzzz*v361 + D_xxyyyyyz*v362 + D_xxyyyyz*v257 + D_xxyyyyzz* &
      v363 + D_xxyyyz*v185 + D_xxyyyzz*v258 + D_xxyyyzzz*v364 + D_xxyyz &
      *v146 + D_xxyyzz*v186 + D_xxyyzzz*v259 + D_xxyyzzzz*v365 + D_xxyz &
      *v123 + D_xxyzz*v147 + D_xxyzzz*v187 + D_xxyzzzz*v260 + &
      D_xxyzzzzz*v366 + D_xxz*v112 + D_xxzz*v124 + D_xxzzz*v148 + &
      D_xxzzzz*v188 + D_xxzzzzz*v261 + D_xxzzzzzz*v367 + D_xyyyyyyz* &
      v398 + D_xyyyyyz*v396 + D_xyyyyz*v394 + D_xyyyz*v392 + D_xyyz* &
      v390 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz*M_xz + D_yyyyyyyz*v368 + &
      D_yyyyyyz*v323 + D_yyyyyyzz*v369 + D_yyyyyz*v307 + D_yyyyyzz*v370 &
      + D_yyyyyzzz*v371 + D_yyyyz*v298 + D_yyyyzz*v372 + D_yyyyzzz*v373 &
      + D_yyyyzzzz*v374 + D_yyyz*v293 + D_yyyzz*v375 + D_yyyzzz*v376 + &
      D_yyyzzzz*v377 + D_yyyzzzzz*v378 + D_yyz*v291 + D_yyzz*v379 + &
      D_yyzzz*v380 + D_yyzzzz*v381 + D_yyzzzzz*v382 + D_yyzzzzzz*v383 + &
      D_yzz*M_yz + D_yzzz*v391 + D_yzzzz*v393 + D_yzzzzz*v395 + &
      D_yzzzzzz*v397 + D_yzzzzzzz*v399 + D_z*M_0 + D_zzz*v384 + D_zzzz* &
      v385 + D_zzzzz*v386 + D_zzzzzz*v387 + D_zzzzzzz*v388 + D_zzzzzzzz &
      *v389 + M_xyyyzz*v332 + M_xyyz*v314 + M_xyzz*v343 + M_xyzzz*v344 &
      + M_xyzzzz*v345 + M_xyzzzzz*v346
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
#undef  L_xx                
#undef  M_xz                
#undef  M_yy                
#undef  L_xy                
#undef  L_xz                
#undef  M_yz                
#undef  L_yy                
#undef  M_xxx               
#undef  L_yz                
#undef  M_xxy               
#undef  L_xxx               
#undef  M_xxz               
#undef  M_xyy               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xyz               
#undef  L_xyy               
#undef  M_yyy               
#undef  M_yyz               
#undef  L_xyz               
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
#undef  L_xxyy              
#undef  M_xyyy              
#undef  M_xyyz              
#undef  L_xxyz              
#undef  M_yyyy              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  M_yyyz              
#undef  L_yyyy              
#undef  M_xxxxx             
#undef  L_yyyz              
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xxxyy             
#undef  L_xxxxz             
#undef  M_xxxyz             
#undef  L_xxxyy             
#undef  M_xxyyy             
#undef  L_xxxyz             
#undef  M_xxyyz             
#undef  L_xxyyy             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  M_yyyyy             
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
#undef  L_xxxxyy            
#undef  M_xxxyyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  L_xxxyyz            
#undef  M_xyyyyy            
#undef  L_xxyyyy            
#undef  M_xyyyyz            
#undef  L_xxyyyz            
#undef  M_yyyyyy            
#undef  L_xyyyyy            
#undef  M_yyyyyz            
#undef  L_xyyyyz            
#undef  M_xxxxxxx           
#undef  L_yyyyyy            
#undef  M_xxxxxxy           
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  L_xxxxxxy           
#undef  M_xxxxxyz           
#undef  L_xxxxxxz           
#undef  M_xxxxyyy           
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_xxxxyyz           
#undef  L_xxxxyyy           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  M_xxyyyyy           
#undef  L_xxxyyyz           
#undef  M_xxyyyyz           
#undef  L_xxyyyyy           
#undef  M_xyyyyyy           
#undef  L_xxyyyyz           
#undef  M_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_xyyyyyy           
#undef  L_xyyyyyz           
#undef  M_yyyyyyz           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  L_xxxxxxxx          
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  L_xxxxxxyz          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  L_yyyyyyyz          
    end subroutine mom_es_M2L2
    
! OPS  303*ADD + 2*DIV + 431*MUL + 84*NEG + POW = 821  (1511 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v11, v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21,&
                v22, v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32,&
                v33, v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43,&
                v44, v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54,&
                v55, v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65,&
                v66, v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76,&
                v77, v78, v79, v8, v80, v81, v9, h, u, L_zz, L_xzz, L_yzz,&
                L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz,&
                L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz,&
                L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz,&
                L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz,&
                L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz,&
                L_xxxxxzz, L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz,&
                L_xxxzzzz, L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz,&
                L_xyyyyzz, L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz,&
                L_yyyyyzz, L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz,&
                L_zzzzzzz, L_xxxxxxzz, L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz,&
                L_xxxxyzzz, L_xxxxzzzz, L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz,&
                L_xxxzzzzz, L_xxyyyyzz, L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz,&
                L_xxzzzzzz, L_xyyyyyzz, L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz,&
                L_xyzzzzzz, L_xzzzzzzz, L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz,&
                L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
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
#define L_xxxxxxxx           L(1:2,63)
#define L_xxxxxxxy           L(1:2,64)
#define L_xxxxxxxz           L(1:2,65)
#define L_xxxxxxyy           L(1:2,66)
#define L_xxxxxxyz           L(1:2,67)
#define L_xxxxxyyy           L(1:2,68)
#define L_xxxxxyyz           L(1:2,69)
#define L_xxxxyyyy           L(1:2,70)
#define L_xxxxyyyz           L(1:2,71)
#define L_xxxyyyyy           L(1:2,72)
#define L_xxxyyyyz           L(1:2,73)
#define L_xxyyyyyy           L(1:2,74)
#define L_xxyyyyyz           L(1:2,75)
#define L_xyyyyyyy           L(1:2,76)
#define L_xyyyyyyz           L(1:2,77)
#define L_yyyyyyyy           L(1:2,78)
#define L_yyyyyyyz           L(1:2,79)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v15        = L_xyyyyyy + L_xyyyyyyz*z
    v19        = 2.0d0*z
    v23        = 6.0d0*z
    v28        = 24.0d0*z
    v34        = 2.0d0*y
    v35        = L_xxxxxxy + L_xxxxxxyz*z
    v37        = 120.0d0*z
    v42        = 0.00138888888888889d0*y
    v43        = 720.0d0*z
    v51        = L_xxxxxyy + L_xxxxxyyz*z
    v52        = 3.0d0*y
    v56        = L_xxxxyyy + L_xxxxyyyz*z
    v59        = 4.0d0*y
    v64        = L_xxxyyyy + L_xxxyyyyz*z
    v69        = 5.0d0*y
    v71        = 0.00138888888888889d0*x
    v73        = L_xxyyyyy + L_xxyyyyyz*z
    v80        = 6.0d0*y
    L_zz       = -(L_xx + L_yy)
    L_xzz      = -(L_xxx + L_xyy)
    L_yzz      = -(L_xxy + L_yyy)
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    L_xyzz     = -(L_xxxy + L_xyyy)
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    L_yyzzz    = -(L_xxyyz + L_yyyyz)
    L_yzzzz    = -(L_xxyzz + L_yyyzz)
    L_zzzzz    = -(L_xxzzz + L_yyzzz)
    L_xxxxzz   = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz   = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz   = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz   = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz   = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz   = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz   = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz   = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz   = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz   = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz   = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz  = -(L_xxxxxxx + L_xxxxxyy)
    L_xxxxyzz  = -(L_xxxxxxy + L_xxxxyyy)
    L_xxxxzzz  = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz  = -(L_xxxxxyy + L_xxxyyyy)
    L_xxxyzzz  = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz  = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz  = -(L_xxxxyyy + L_xxyyyyy)
    L_xxyyzzz  = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz  = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz  = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz  = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz  = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz  = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz  = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz  = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz  = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz = -(L_xxxxxxxx + L_xxxxxxyy)
    L_xxxxxyzz = -(L_xxxxxxxy + L_xxxxxyyy)
    L_xxxxxzzz = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz = -(L_xxxxxxyy + L_xxxxyyyy)
    L_xxxxyzzz = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz = -(L_xxxxxyyy + L_xxxyyyyy)
    L_xxxyyzzz = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz = -(L_xxxxyyyy + L_xxyyyyyy)
    L_xxyyyzzz = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz = -(L_xxxyyyyy + L_xyyyyyyy)
    L_xyyyyzzz = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz = -(L_xxyyyyyy + L_yyyyyyyy)
    L_yyyyyzzz = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz = -(L_xxzzzzzz + L_yyzzzzzz)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v61        = a2
    v62        = 0.00416666666666667d0*v61
    a3         = a1*a2
    v54        = 0.00694444444444444d0*a3
    a4         = a2*a2
    v49        = 0.00694444444444444d0*a4
    a5         = a2*a3
    v32        = 0.00416666666666667d0*a5
    a6         = a3*a3
    v16        = 0.00138888888888889d0*a6
    a7         = a3*a4
    v0         = 0.000198412698412698d0*a7
    a8         = a4*a4
    b2         = b1*b1
    v33        = b2
    v36        = 0.00416666666666667d0*v33
    v50        = 3.0d0*v33
    v57        = 6.0d0*v33
    v67        = 10.0d0*v33
    v78        = 15.0d0*v33
    b3         = b1*b2
    v26        = b3
    v27        = 0.00694444444444444d0*v26
    v55        = 4.0d0*v26
    v65        = 10.0d0*v26
    v76        = 20.0d0*v26
    b4         = b2*b2
    v21        = b4
    v22        = 0.00694444444444444d0*v21
    v63        = 5.0d0*v21
    v74        = 15.0d0*v21
    b5         = b2*b3
    v17        = b5
    v18        = 0.00416666666666667d0*v17
    v72        = 6.0d0*v17
    b6         = b3*b3
    v13        = b6
    v14        = 0.00138888888888889d0*v13
    b7         = b3*b4
    v1         = 0.000198412698412698d0*b7
    b8         = b4*b4
    c2         = c1*c1
    v2         = c2
    v3         = 0.5d0*v2
    v24        = 3.0d0*v2
    v29        = 12.0d0*v2
    v38        = 60.0d0*v2
    v44        = 360.0d0*v2
    v53        = 2.0d0*L_xxxxxy + L_xxxxxyz*v19 + L_xxxxxyzz*v2
    v58        = 2.0d0*L_xxxxyy + L_xxxxyyz*v19 + L_xxxxyyzz*v2
    v66        = 2.0d0*L_xxxyyy + L_xxxyyyz*v19 + L_xxxyyyzz*v2
    v75        = 2.0d0*L_xxyyyy + L_xxyyyyz*v19 + L_xxyyyyzz*v2
    v20        = 2.0d0*L_xyyyyy + L_xyyyyyz*v19 + L_xyyyyyzz*v2
    h          = v2 + v33 + v61
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
    u16        = u8*u8
    u17        = u8*u9
    c3         = c1*c2
    v4         = c3
    v5         = 0.166666666666667d0*v4
    v30        = 4.0d0*v4
    v39        = 20.0d0*v4
    v45        = 120.0d0*v4
    v60        = 6.0d0*L_xxxxy + L_xxxxyz*v23 + L_xxxxyzz*v24 + L_xxxxyzzz*v4
    v68        = 6.0d0*L_xxxyy + L_xxxyyz*v23 + L_xxxyyzz*v24 + L_xxxyyzzz*v4
    v77        = 6.0d0*L_xxyyy + L_xxyyyz*v23 + L_xxyyyzz*v24 + L_xxyyyzzz*v4
    v25        = 6.0d0*L_xyyyy + L_xyyyyz*v23 + L_xyyyyzz*v24 + L_xyyyyzzz*v4
    c4         = c2*c2
    v6         = c4
    v7         = 0.0416666666666667d0*v6
    v40        = 5.0d0*v6
    v46        = 30.0d0*v6
    v70        = 24.0d0*L_xxxy + L_xxxyz*v28 + L_xxxyzz*v29 + L_xxxyzzz*v30 + L_xxxyzzzz* &
      v6
    v79        = 24.0d0*L_xxyy + L_xxyyz*v28 + L_xxyyzz*v29 + L_xxyyzzz*v30 + L_xxyyzzzz* &
      v6
    v31        = 24.0d0*L_xyyy + L_xyyyz*v28 + L_xyyyzz*v29 + L_xyyyzzz*v30 + L_xyyyzzzz* &
      v6
    c5         = c2*c3
    v8         = c5
    v9         = 0.00833333333333333d0*v8
    v47        = 6.0d0*v8
    v81        = 120.0d0*L_xxy + L_xxyz*v37 + L_xxyzz*v38 + L_xxyzzz*v39 + L_xxyzzzz*v40 &
      + L_xxyzzzzz*v8
    v41        = 120.0d0*L_xyy + L_xyyz*v37 + L_xyyzz*v38 + L_xyyzzz*v39 + L_xyyzzzz*v40 &
      + L_xyyzzzzz*v8
    c6         = c3*c3
    v10        = c6
    v11        = 0.00138888888888889d0*v10
    v48        = 720.0d0*L_xy + L_xyz*v43 + L_xyzz*v44 + L_xyzzz*v45 + L_xyzzzz*v46 + &
      L_xyzzzzz*v47 + L_xyzzzzzz*v10
    c7         = c3*c4
    v12        = 0.000198412698412698d0*c7
    Phi_x      = L_x + L_xxxxxxxx*v0 + L_xyyyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v9 + L_xzzzzzz*v11 + L_xzzzzzzz*v12 + v14* &
      v15 + v16*(L_xxxxxxx + L_xxxxxxxy*y + L_xxxxxxxz*z) + v18*v20 + &
      v22*v25 + v27*v31 + v32*(2.0d0*L_xxxxxx + L_xxxxxxyy*v33 + &
      L_xxxxxxz*v19 + L_xxxxxxzz*v2 + v34*v35) + v36*v41 + v42*v48 + &
      v49*(6.0d0*L_xxxxx + L_xxxxxyyy*v26 + L_xxxxxz*v23 + L_xxxxxzz* &
      v24 + L_xxxxxzzz*v4 + v50*v51 + v52*v53) + v54*(24.0d0*L_xxxx + &
      L_xxxxyyyy*v21 + L_xxxxz*v28 + L_xxxxzz*v29 + L_xxxxzzz*v30 + &
      L_xxxxzzzz*v6 + v55*v56 + v57*v58 + v59*v60) + v62*(120.0d0*L_xxx &
      + L_xxxyyyyy*v17 + L_xxxz*v37 + L_xxxzz*v38 + L_xxxzzz*v39 + &
      L_xxxzzzz*v40 + L_xxxzzzzz*v8 + v63*v64 + v65*v66 + v67*v68 + v69 &
      *v70) + v71*(720.0d0*L_xx + L_xxyyyyyy*v13 + L_xxz*v43 + L_xxzz* &
      v44 + L_xxzzz*v45 + L_xxzzzz*v46 + L_xxzzzzz*v47 + L_xxzzzzzz*v10 &
      + v72*v73 + v74*v75 + v76*v77 + v78*v79 + v80*v81)
    Phi_y      = L_y + L_xxxxxxxy*v0 + L_yyyyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v9 + L_yzzzzzz*v11 + L_yzzzzzzz*v12 + v14*( &
      L_yyyyyyy + L_yyyyyyyz*z) + v16*(L_xxxxxxyy*y + v35) + v18*(2.0d0 &
      *L_yyyyyy + L_yyyyyyz*v19 + L_yyyyyyzz*v2) + v22*(6.0d0*L_yyyyy + &
      L_yyyyyz*v23 + L_yyyyyzz*v24 + L_yyyyyzzz*v4) + v27*(24.0d0* &
      L_yyyy + L_yyyyz*v28 + L_yyyyzz*v29 + L_yyyyzzz*v30 + L_yyyyzzzz* &
      v6) + v32*(L_xxxxxyyy*v33 + v34*v51 + v53) + v36*(120.0d0*L_yyy + &
      L_yyyz*v37 + L_yyyzz*v38 + L_yyyzzz*v39 + L_yyyzzzz*v40 + &
      L_yyyzzzzz*v8) + v42*(720.0d0*L_yy + L_yyz*v43 + L_yyzz*v44 + &
      L_yyzzz*v45 + L_yyzzzz*v46 + L_yyzzzzz*v47 + L_yyzzzzzz*v10) + &
      v49*(L_xxxxyyyy*v26 + v50*v56 + v52*v58 + v60) + v54*(L_xxxyyyyy* &
      v21 + v55*v64 + v57*v66 + v59*v68 + v70) + v62*(L_xxyyyyyy*v17 + &
      v63*v73 + v65*v75 + v67*v77 + v69*v79 + v81) + v71*(L_xyyyyyyy* &
      v13 + v15*v72 + v20*v74 + v25*v76 + v31*v78 + v41*v80 + v48)
    Phi_z      = L_z + L_xxxxxxxz*v0 + L_yyyyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v9 + L_zzzzzzz*v11 + L_zzzzzzzz*v12 + v14*( &
      L_yyyyyyz + L_yyyyyyzz*z) + v16*(L_xxxxxxyz*y + L_xxxxxxz + &
      L_xxxxxxzz*z) + v18*(2.0d0*L_yyyyyz + L_yyyyyzz*v19 + L_yyyyyzzz* &
      v2) + v22*(6.0d0*L_yyyyz + L_yyyyzz*v23 + L_yyyyzzz*v24 + &
      L_yyyyzzzz*v4) + v27*(24.0d0*L_yyyz + L_yyyzz*v28 + L_yyyzzz*v29 &
      + L_yyyzzzz*v30 + L_yyyzzzzz*v6) + v32*(L_xxxxxyyz*v33 + 2.0d0* &
      L_xxxxxz + L_xxxxxzz*v19 + L_xxxxxzzz*v2 + v34*(L_xxxxxyz + &
      L_xxxxxyzz*z)) + v36*(120.0d0*L_yyz + L_yyzz*v37 + L_yyzzz*v38 + &
      L_yyzzzz*v39 + L_yyzzzzz*v40 + L_yyzzzzzz*v8) + v42*(720.0d0*L_yz &
      + L_yzz*v43 + L_yzzz*v44 + L_yzzzz*v45 + L_yzzzzz*v46 + L_yzzzzzz &
      *v47 + L_yzzzzzzz*v10) + v49*(L_xxxxyyyz*v26 + 6.0d0*L_xxxxz + &
      L_xxxxzz*v23 + L_xxxxzzz*v24 + L_xxxxzzzz*v4 + v50*(L_xxxxyyz + &
      L_xxxxyyzz*z) + v52*(2.0d0*L_xxxxyz + L_xxxxyzz*v19 + L_xxxxyzzz* &
      v2)) + v54*(L_xxxyyyyz*v21 + 24.0d0*L_xxxz + L_xxxzz*v28 + &
      L_xxxzzz*v29 + L_xxxzzzz*v30 + L_xxxzzzzz*v6 + v55*(L_xxxyyyz + &
      L_xxxyyyzz*z) + v57*(2.0d0*L_xxxyyz + L_xxxyyzz*v19 + L_xxxyyzzz* &
      v2) + v59*(6.0d0*L_xxxyz + L_xxxyzz*v23 + L_xxxyzzz*v24 + &
      L_xxxyzzzz*v4)) + v62*(L_xxyyyyyz*v17 + 120.0d0*L_xxz + L_xxzz* &
      v37 + L_xxzzz*v38 + L_xxzzzz*v39 + L_xxzzzzz*v40 + L_xxzzzzzz*v8 &
      + v63*(L_xxyyyyz + L_xxyyyyzz*z) + v65*(2.0d0*L_xxyyyz + &
      L_xxyyyzz*v19 + L_xxyyyzzz*v2) + v67*(6.0d0*L_xxyyz + L_xxyyzz* &
      v23 + L_xxyyzzz*v24 + L_xxyyzzzz*v4) + v69*(24.0d0*L_xxyz + &
      L_xxyzz*v28 + L_xxyzzz*v29 + L_xxyzzzz*v30 + L_xxyzzzzz*v6)) + &
      v71*(L_xyyyyyyz*v13 + 720.0d0*L_xz + L_xzz*v43 + L_xzzz*v44 + &
      L_xzzzz*v45 + L_xzzzzz*v46 + L_xzzzzzz*v47 + L_xzzzzzzz*v10 + v72 &
      *(L_xyyyyyz + L_xyyyyyzz*z) + v74*(2.0d0*L_xyyyyz + L_xyyyyzz*v19 &
      + L_xyyyyzzz*v2) + v76*(6.0d0*L_xyyyz + L_xyyyzz*v23 + L_xyyyzzz* &
      v24 + L_xyyyzzzz*v4) + v78*(24.0d0*L_xyyz + L_xyyzz*v28 + &
      L_xyyzzz*v29 + L_xyyzzzz*v30 + L_xyyzzzzz*v6) + v80*(120.0d0* &
      L_xyz + L_xyzz*v37 + L_xyzzz*v38 + L_xyzzzz*v39 + L_xyzzzzz*v40 + &
      L_xyzzzzzz*v8))
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
#undef  L_xxxxxxxx          
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  L_xxxxxxyz          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  L_xxxyyyyy          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2P2
    
! OPS  870*ADD + 2*DIV + 1004*MUL + 84*NEG + POW = 1961  (6417 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v114, v115, v116, v117, v118,&
                v119, v12, v120, v121, v122, v123, v124, v125, v126, v127,&
                v128, v129, v13, v130, v131, v132, v133, v134, v135, v136,&
                v137, v138, v139, v14, v140, v141, v142, v143, v144, v145,&
                v146, v147, v148, v149, v15, v150, v151, v152, v153, v154,&
                v155, v156, v157, v158, v159, v16, v160, v161, v162, v163,&
                v164, v165, v166, v167, v168, v169, v17, v170, v171, v172,&
                v173, v174, v175, v176, v177, v178, v179, v18, v180, v181,&
                v182, v183, v184, v185, v186, v187, v188, v189, v19, v190,&
                v191, v192, v193, v194, v195, v196, v197, v198, v199, v2, v20,&
                v200, v201, v202, v203, v204, v205, v206, v207, v208, v209,&
                v21, v210, v211, v212, v213, v214, v215, v216, v217, v218,&
                v219, v22, v220, v221, v222, v223, v224, v225, v226, v227,&
                v228, v229, v23, v230, v231, v232, v233, v234, v235, v236,&
                v237, v238, v239, v24, v240, v241, v242, v243, v244, v245,&
                v246, v247, v248, v249, v25, v250, v251, v252, v253, v254,&
                v255, v256, v257, v258, v259, v26, v260, v261, v262, v263,&
                v264, v265, v266, v267, v268, v269, v27, v270, v271, v272,&
                v273, v274, v275, v276, v277, v278, v279, v28, v280, v281,&
                v282, v283, v284, v285, v286, v287, v288, v289, v29, v290,&
                v291, v292, v293, v294, v295, v296, v297, v298, v299, v3, v30,&
                v300, v301, v302, v303, v304, v305, v306, v307, v308, v309,&
                v31, v310, v311, v312, v313, v314, v315, v316, v317, v318,&
                v319, v32, v320, v321, v322, v323, v324, v325, v326, v327,&
                v328, v329, v33, v330, v331, v332, v333, v334, v335, v336,&
                v337, v338, v339, v34, v340, v341, v342, v343, v344, v345,&
                v346, v347, v348, v349, v35, v350, v351, v352, v353, v354,&
                v355, v356, v357, v358, v359, v36, v360, v361, v362, v363,&
                v364, v365, v366, v367, v368, v369, v37, v370, v371, v372,&
                v373, v374, v375, v376, v377, v378, v379, v38, v380, v381,&
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
                L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz,&
                L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz,&
                L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz,&
                L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz,&
                L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz,&
                L_xxxxyzz, L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz,&
                L_xxyyyzz, L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz,&
                L_xyyyzzz, L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz,&
                L_yyyyzzz, L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz,&
                L_xxxxxxzz, L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz,&
                L_xxxxzzzz, L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz,&
                L_xxyyyyzz, L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz,&
                L_xyyyyyzz, L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz,&
                L_xzzzzzzz, L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz,&
                L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz
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
#define L_yy                 L(1:2,6)
#define Ls_yy                Ls(1:2,6)
#define Ls_yz                Ls(1:2,7)
#define L_yz                 L(1:2,7)
#define Ls_xxx               Ls(1:2,8)
#define L_xxx                L(1:2,8)
#define Ls_xxy               Ls(1:2,9)
#define L_xxy                L(1:2,9)
#define Ls_xxz               Ls(1:2,10)
#define L_xxz                L(1:2,10)
#define Ls_xyy               Ls(1:2,11)
#define L_xyy                L(1:2,11)
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
#define L_yyyyy              L(1:2,33)
#define Ls_yyyyy             Ls(1:2,33)
#define L_yyyyz              L(1:2,34)
#define Ls_yyyyz             Ls(1:2,34)
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
#define L_xxxyyz             L(1:2,41)
#define Ls_xxxyyz            Ls(1:2,41)
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
#define Ls_xxxxyyy           Ls(1:2,53)
#define L_xxxxyyy            L(1:2,53)
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
#define L_xxxxxxxx           L(1:2,63)
#define Ls_xxxxxxxx          Ls(1:2,63)
#define Ls_xxxxxxxy          Ls(1:2,64)
#define L_xxxxxxxy           L(1:2,64)
#define Ls_xxxxxxxz          Ls(1:2,65)
#define L_xxxxxxxz           L(1:2,65)
#define Ls_xxxxxxyy          Ls(1:2,66)
#define L_xxxxxxyy           L(1:2,66)
#define Ls_xxxxxxyz          Ls(1:2,67)
#define L_xxxxxxyz           L(1:2,67)
#define Ls_xxxxxyyy          Ls(1:2,68)
#define L_xxxxxyyy           L(1:2,68)
#define L_xxxxxyyz           L(1:2,69)
#define Ls_xxxxxyyz          Ls(1:2,69)
#define Ls_xxxxyyyy          Ls(1:2,70)
#define L_xxxxyyyy           L(1:2,70)
#define L_xxxxyyyz           L(1:2,71)
#define Ls_xxxxyyyz          Ls(1:2,71)
#define Ls_xxxyyyyy          Ls(1:2,72)
#define L_xxxyyyyy           L(1:2,72)
#define Ls_xxxyyyyz          Ls(1:2,73)
#define L_xxxyyyyz           L(1:2,73)
#define L_xxyyyyyy           L(1:2,74)
#define Ls_xxyyyyyy          Ls(1:2,74)
#define Ls_xxyyyyyz          Ls(1:2,75)
#define L_xxyyyyyz           L(1:2,75)
#define L_xyyyyyyy           L(1:2,76)
#define Ls_xyyyyyyy          Ls(1:2,76)
#define Ls_xyyyyyyz          Ls(1:2,77)
#define L_xyyyyyyz           L(1:2,77)
#define L_yyyyyyyy           L(1:2,78)
#define Ls_yyyyyyyy          Ls(1:2,78)
#define Ls_yyyyyyyz          Ls(1:2,79)
#define L_yyyyyyyz           L(1:2,79)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0          = L_xxxxxxx + L_xxxxxxxy*y + L_xxxxxxxz*z
    v1          = L_xxxxxxy + L_xxxxxxyz*z
    v2          = L_xxxxxxyy*y + v1
    v3          = L_xxxxxyy + L_xxxxxyyz*z
    v4          = L_xxxxxyyy*y + v3
    v5          = L_xxxxyyy + L_xxxxyyyz*z
    v6          = L_xxxxyyyy*y + v5
    v7          = L_xxxyyyy + L_xxxyyyyz*z
    v8          = L_xxxyyyyy*y + v7
    v9          = L_xxyyyyy + L_xxyyyyyz*z
    v10         = L_xxyyyyyy*y + v9
    v11         = L_xyyyyyy + L_xyyyyyyz*z
    v12         = L_xyyyyyyy*y + v11
    v13         = L_yyyyyyy + L_yyyyyyyz*z
    v14         = L_xxxxxxz*z
    v21         = v1*y
    v23         = L_xxxxxyz*z
    v26         = v3*y
    v29         = L_xxxxxz*z
    v40         = 0.5d0*x
    v46         = L_xxxxyyz*z
    v49         = v5*y
    v52         = L_xxxxyz*z
    v63         = L_xxxxz*z
    v77         = 0.166666666666667d0*x
    v87         = L_xxxyyyz*z
    v90         = v7*y
    v93         = L_xxxyyz*z
    v104        = L_xxxyz*z
    v120        = L_xxxz*z
    v137        = 0.0416666666666667d0*x
    v149        = L_xxyyyyz*z
    v152        = v9*y
    v155        = L_xxyyyz*z
    v166        = L_xxyyz*z
    v182        = L_xxyz*z
    v202        = L_xxz*z
    v221        = 0.00833333333333333d0*x
    v235        = L_xyyyyyz*z
    v238        = v11*y
    v241        = L_xyyyyz*z
    v252        = L_xyyyz*z
    v268        = L_xyyz*z
    v288        = L_xyz*z
    v326        = 0.00138888888888889d0*y
    v331        = 0.00138888888888889d0*x
    v342        = L_yyyyyyz*z
    v345        = L_yyyyyz*z
    v347        = 0.5d0*y
    v351        = L_yyyyz*z
    v354        = 0.166666666666667d0*y
    v360        = L_yyyz*z
    v364        = 0.0416666666666667d0*y
    v371        = L_yyz*z
    v376        = 0.00833333333333333d0*y
    Ls_xxxxxxx  = L_xxxxxxxx*x + v0
    Ls_xxxxxxy  = L_xxxxxxxy*x + v2
    Ls_xxxxxyy  = L_xxxxxxyy*x + v4
    Ls_xxxxyyy  = L_xxxxxyyy*x + v6
    Ls_xxxyyyy  = L_xxxxyyyy*x + v8
    Ls_xxyyyyy  = L_xxxyyyyy*x + v10
    Ls_xyyyyyy  = L_xxyyyyyy*x + v12
    Ls_yyyyyyy  = v13 + L_xyyyyyyy*x + L_yyyyyyyy*y
    Ls_xxxxxxxx = L_xxxxxxxx
    Ls_xxxxxxxy = L_xxxxxxxy
    Ls_xxxxxxxz = L_xxxxxxxz
    Ls_xxxxxxyy = L_xxxxxxyy
    Ls_xxxxxxyz = L_xxxxxxyz
    Ls_xxxxxyyy = L_xxxxxyyy
    Ls_xxxxxyyz = L_xxxxxyyz
    Ls_xxxxyyyy = L_xxxxyyyy
    Ls_xxxxyyyz = L_xxxxyyyz
    Ls_xxxyyyyy = L_xxxyyyyy
    Ls_xxxyyyyz = L_xxxyyyyz
    Ls_xxyyyyyy = L_xxyyyyyy
    Ls_xxyyyyyz = L_xxyyyyyz
    Ls_xyyyyyyy = L_xyyyyyyy
    Ls_xyyyyyyz = L_xyyyyyyz
    Ls_yyyyyyyy = L_yyyyyyyy
    Ls_yyyyyyyz = L_yyyyyyyz
    L_zz        = -(L_xx + L_yy)
    L_xzz       = -(L_xxx + L_xyy)
    v333        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v388        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    v224        = L_xxzz*z
    L_xyzz      = -(L_xxxy + L_xyyy)
    v301        = L_xyzz*z
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    v381        = L_yyzz*z
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    v140        = L_xxxzz*z
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    v193        = L_xxyzz*z
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    v279        = L_xyyzz*z
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    v368        = L_yyyzz*z
    L_yyzzz     = -(L_xxyyz + L_yyyyz)
    L_yzzzz     = -(L_xxyzz + L_yyyzz)
    L_zzzzz     = -(L_xxzzz + L_yyzzz)
    L_xxxxzz    = -(L_xxxxxx + L_xxxxyy)
    v80         = L_xxxxzz*z
    L_xxxyzz    = -(L_xxxxxy + L_xxxyyy)
    v113        = L_xxxyzz*z
    L_xxxzzz    = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz    = -(L_xxxxyy + L_xxyyyy)
    v175        = L_xxyyzz*z
    L_xxyzzz    = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz    = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz    = -(L_xxxyyy + L_xyyyyy)
    v261        = L_xyyyzz*z
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    v357        = L_yyyyzz*z
    L_yyyzzz    = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz    = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz    = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz    = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz   = -(L_xxxxxxx + L_xxxxxyy)
    v42         = L_xxxxxzz*z
    L_xxxxyzz   = -(L_xxxxxxy + L_xxxxyyy)
    v59         = L_xxxxyzz*z
    L_xxxxzzz   = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz   = -(L_xxxxxyy + L_xxxyyyy)
    v100        = L_xxxyyzz*z
    L_xxxyzzz   = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz   = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz   = -(L_xxxxyyy + L_xxyyyyy)
    v162        = L_xxyyyzz*z
    L_xxyyzzz   = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz   = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz   = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz   = -(L_xxxyyyy + L_xyyyyyy)
    v248        = L_xyyyyzz*z
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    v349        = L_yyyyyzz*z
    L_yyyyzzz   = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz   = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz   = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz   = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz   = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz  = -(L_xxxxxxxx + L_xxxxxxyy)
    v22         = L_xxxxxxz + L_xxxxxxyz*y + L_xxxxxxzz*z
    Ls_xxxxxxz  = L_xxxxxxxz*x + v22
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    v27         = L_xxxxxyz + L_xxxxxyzz*z
    v28         = L_xxxxxyyz*y + v27
    v45         = v27*y
    Ls_xxxxxyz  = L_xxxxxxyz*x + v28
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    v50         = L_xxxxyyz + L_xxxxyyzz*z
    v51         = L_xxxxyyyz*y + v50
    v62         = v50*y
    Ls_xxxxyyz  = L_xxxxxyyz*x + v51
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    v91         = L_xxxyyyz + L_xxxyyyzz*z
    v92         = L_xxxyyyyz*y + v91
    v103        = v91*y
    Ls_xxxyyyz  = L_xxxxyyyz*x + v92
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    v153        = L_xxyyyyz + L_xxyyyyzz*z
    v154        = L_xxyyyyyz*y + v153
    v165        = v153*y
    Ls_xxyyyyz  = L_xxxyyyyz*x + v154
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    v239        = L_xyyyyyz + L_xyyyyyzz*z
    v240        = L_xyyyyyyz*y + v239
    v251        = v239*y
    Ls_xyyyyyz  = L_xxyyyyyz*x + v240
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    v344        = L_yyyyyyz + L_yyyyyyzz*z
    Ls_yyyyyyz  = v344 + L_xyyyyyyz*x + L_yyyyyyyz*y
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v15         = a2
    v16         = 0.5d0*v15
    v76         = 0.25d0*v15
    v136        = 0.0833333333333333d0*v15
    v220        = 0.0208333333333333d0*v15
    v330        = 0.00416666666666667d0*v15
    a3          = a1*a2
    v30         = a3
    v31         = 0.166666666666667d0*v30
    v135        = 0.0833333333333333d0*v30
    v219        = 0.0277777777777778d0*v30
    v329        = 0.00694444444444444d0*v30
    a4          = a2*a2
    v64         = a4
    v65         = 0.0416666666666667d0*v64
    v216        = 0.0208333333333333d0*v64
    v328        = 0.00694444444444444d0*v64
    a5          = a2*a3
    v121        = a5
    v122        = 0.00833333333333333d0*v121
    v324        = 0.00416666666666667d0*v121
    a6          = a3*a3
    v203        = 0.00138888888888889d0*a6
    a7          = a3*a4
    v312        = 0.000198412698412698d0*a7
    a8          = a4*a4
    b2          = b1*b1
    v17         = b2
    v18         = L_xxxxxxyy*v17
    v24         = L_xxxxxyyy*v17
    v37         = 0.5d0*v17
    v43         = L_xxxxxyyz*v17
    v47         = L_xxxxyyyy*v17
    v60         = L_xxxxyyyz*v17
    v78         = 3.0d0*v17
    v88         = L_xxxyyyyy*v17
    v101        = L_xxxyyyyz*v17
    v150        = L_xxyyyyyy*v17
    v163        = L_xxyyyyyz*v17
    v236        = L_xyyyyyyy*v17
    v249        = L_xyyyyyyz*v17
    v325        = 0.00416666666666667d0*v17
    v353        = 0.25d0*v17
    v363        = 0.0833333333333333d0*v17
    v375        = 0.0208333333333333d0*v17
    b3          = b1*b2
    v32         = b3
    v33         = L_xxxxxyyy*v32
    v53         = L_xxxxyyyy*v32
    v72         = 0.166666666666667d0*v32
    v81         = L_xxxxyyyz*v32
    v94         = L_xxxyyyyy*v32
    v114        = L_xxxyyyyz*v32
    v138        = 4.0d0*v32
    v156        = L_xxyyyyyy*v32
    v176        = L_xxyyyyyz*v32
    v242        = L_xyyyyyyy*v32
    v262        = L_xyyyyyyz*v32
    v323        = 0.00694444444444444d0*v32
    v362        = 0.0833333333333333d0*v32
    v374        = 0.0277777777777778d0*v32
    b4          = b2*b2
    v66         = b4
    v67         = L_xxxxyyyy*v66
    v105        = L_xxxyyyyy*v66
    v130        = 0.0416666666666667d0*v66
    v141        = L_xxxyyyyz*v66
    v167        = L_xxyyyyyy*v66
    v194        = L_xxyyyyyz*v66
    v222        = 5.0d0*v66
    v253        = L_xyyyyyyy*v66
    v280        = L_xyyyyyyz*v66
    v322        = 0.00694444444444444d0*v66
    v373        = 0.0208333333333333d0*v66
    b5          = b2*b3
    v123        = b5
    v124        = L_xxxyyyyy*v123
    v183        = L_xxyyyyyy*v123
    v212        = 0.00833333333333333d0*v123
    v225        = L_xxyyyyyz*v123
    v269        = L_xyyyyyyy*v123
    v302        = L_xyyyyyyz*v123
    v321        = 0.00416666666666667d0*v123
    v332        = 6.0d0*v123
    b6          = b3*b3
    v204        = b6
    v205        = L_xxyyyyyy*v204
    v289        = L_xyyyyyyy*v204
    v320        = 0.00138888888888889d0*v204
    v334        = L_xyyyyyyz*v204
    b7          = b3*b4
    v313        = 0.000198412698412698d0*b7
    b8          = b4*b4
    c2          = c1*c1
    v19         = c2
    v314        = 0.5d0*v19
    v355        = 3.0d0*v19
    v365        = 12.0d0*v19
    v377        = 60.0d0*v19
    v384        = 360.0d0*v19
    v206        = L_xxzz*v19
    v290        = L_xyzz*v19
    v125        = L_xxxzz*v19
    v184        = L_xxyzz*v19
    v226        = L_xxzzz*v19
    v270        = L_xyyzz*v19
    v303        = L_xyzzz*v19
    v68         = L_xxxxzz*v19
    v106        = L_xxxyzz*v19
    v142        = L_xxxzzz*v19
    v168        = L_xxyyzz*v19
    v195        = L_xxyzzz*v19
    v254        = L_xyyyzz*v19
    v281        = L_xyyzzz*v19
    v34         = L_xxxxxzz*v19
    v54         = L_xxxxyzz*v19
    v82         = L_xxxxzzz*v19
    v95         = L_xxxyyzz*v19
    v115        = L_xxxyzzz*v19
    v157        = L_xxyyyzz*v19
    v177        = L_xxyyzzz*v19
    v243        = L_xyyyyzz*v19
    v263        = L_xyyyzzz*v19
    v20         = L_xxxxxxzz*v19
    v41         = v18 + v20 + 2.0d0*(L_xxxxxx + v14 + v21)
    Ls_xxxxxx   = 0.5d0*(v18 + v20) + L_xxxxxx + L_xxxxxxxx*v16 + v0*x + v14 + v21
    v25         = L_xxxxxyzz*v19
    v38         = v25 + 2.0d0*(L_xxxxxy + v23)
    v39         = v38*y
    v58         = 2.0d0*v26 + v24 + v38
    Ls_xxxxxy   = 0.5d0*(v24 + v25) + L_xxxxxxxy*v16 + L_xxxxxy + v2*x + v23 + v26
    v44         = L_xxxxxzzz*v19
    v86         = v43 + v44 + 2.0d0*(L_xxxxxz + v42 + v45)
    Ls_xxxxxz   = 0.5d0*(v43 + v44) + L_xxxxxxxz*v16 + L_xxxxxz + v22*x + v42 + v45
    v48         = L_xxxxyyzz*v19
    v56         = v48 + 2.0d0*(L_xxxxyy + v46)
    v57         = v56*y
    v73         = v17*v56
    v99         = 2.0d0*v49 + v47 + v56
    Ls_xxxxyy   = 0.5d0*(v47 + v48) + L_xxxxxxyy*v16 + L_xxxxyy + v4*x + v46 + v49
    v61         = L_xxxxyzzz*v19
    v84         = v61 + 2.0d0*(L_xxxxyz + v59)
    v85         = v84*y
    v119        = 2.0d0*v62 + v60 + v84
    Ls_xxxxyz   = 0.5d0*(v60 + v61) + L_xxxxxxyz*v16 + L_xxxxyz + v28*x + v59 + v62
    v89         = L_xxxyyyzz*v19
    v97         = v89 + 2.0d0*(L_xxxyyy + v87)
    v98         = v97*y
    v109        = v17*v97
    v131        = v32*v97
    v161        = 2.0d0*v90 + v88 + v97
    Ls_xxxyyy   = 0.5d0*(v88 + v89) + L_xxxxxyyy*v16 + L_xxxyyy + v6*x + v87 + v90
    v102        = L_xxxyyzzz*v19
    v117        = v102 + 2.0d0*(L_xxxyyz + v100)
    v118        = v117*y
    v145        = v117*v17
    v181        = 2.0d0*v103 + v101 + v117
    Ls_xxxyyz   = 0.5d0*(v101 + v102) + L_xxxxxyyz*v16 + L_xxxyyz + v100 + v103 + v51*x
    v151        = L_xxyyyyzz*v19
    v159        = v151 + 2.0d0*(L_xxyyyy + v149)
    v160        = v159*y
    v171        = v159*v17
    v188        = v159*v32
    v213        = v159*v66
    v247        = 2.0d0*v152 + v150 + v159
    Ls_xxyyyy   = 0.5d0*(v150 + v151) + L_xxxxyyyy*v16 + L_xxyyyy + v149 + v152 + v8*x
    v164        = L_xxyyyzzz*v19
    v179        = v164 + 2.0d0*(L_xxyyyz + v162)
    v180        = v179*y
    v198        = v17*v179
    v230        = v179*v32
    v267        = 2.0d0*v165 + v163 + v179
    Ls_xxyyyz   = 0.5d0*(v163 + v164) + L_xxxxyyyz*v16 + L_xxyyyz + v162 + v165 + v92*x
    v237        = L_xyyyyyzz*v19
    v245        = v237 + 2.0d0*(L_xyyyyy + v235)
    v246        = v245*y
    v257        = v17*v245
    v274        = v245*v32
    v295        = v245*v66
    Ls_xyyyyy   = 0.5d0*(v236 + v237) + L_xxxyyyyy*v16 + L_xyyyyy + v10*x + v235 + v238
    v250        = L_xyyyyzzz*v19
    v265        = v250 + 2.0d0*(L_xyyyyz + v248)
    v266        = v265*y
    v284        = v17*v265
    v307        = v265*v32
    v336        = v265*v66
    Ls_xyyyyz   = 0.5d0*(v249 + v250) + L_xxxyyyyz*v16 + L_xyyyyz + v154*x + v248 + v251
    v343        = L_yyyyyyzz*v19
    v348        = v343 + 2.0d0*(L_yyyyyy + v342)
    Ls_yyyyyy   = 0.5d0*v343 + L_xxyyyyyy*v16 + L_yyyyyy + L_yyyyyyyy*v37 + v12*x + v13*y &
      + v342
    v350        = L_yyyyyzzz*v19
    v359        = v350 + 2.0d0*(L_yyyyyz + v349)
    Ls_yyyyyz   = 0.5d0*v350 + L_xxyyyyyz*v16 + L_yyyyyyyz*v37 + L_yyyyyz + v240*x + v344* &
      y + v349
    h           = v15 + v17 + v19
    u2          = 1.0/h
    u           = sqrt(u2)
    u3          = u*u2
    u4          = u2*u2
    u5          = u2*u3
    u6          = u3*u3
    u7          = u3*u4
    u8          = u4*u4
    u9          = u4*u5
    u10         = u5*u5
    u11         = u5*u6
    u12         = u6*u6
    u13         = u6*u7
    u14         = u7*u7
    u15         = u7*u8
    u16         = u8*u8
    u17         = u8*u9
    c3          = c1*c2
    v35         = c3
    v315        = 0.166666666666667d0*v35
    v366        = 4.0d0*v35
    v378        = 20.0d0*v35
    v385        = 120.0d0*v35
    v207        = L_xxzzz*v35
    v291        = L_xyzzz*v35
    v126        = L_xxxzzz*v35
    v185        = L_xxyzzz*v35
    v227        = L_xxzzzz*v35
    v271        = L_xyyzzz*v35
    v304        = L_xyzzzz*v35
    v69         = L_xxxxzzz*v35
    v107        = L_xxxyzzz*v35
    v143        = L_xxxzzzz*v35
    v169        = L_xxyyzzz*v35
    v196        = L_xxyzzzz*v35
    v255        = L_xyyyzzz*v35
    v282        = L_xyyzzzz*v35
    v36         = L_xxxxxzzz*v35
    v79         = v33 + v36 + v3*v78 + 6.0d0*(L_xxxxx + v29) + 3.0d0*(v34 + v39)
    Ls_xxxxx    = 0.166666666666667d0*(v33 + v36 + 3.0d0*(v34 + v39)) + L_xxxxx + &
      L_xxxxxxxx*v31 + v0*v16 + v29 + v3*v37 + v40*v41
    v55         = L_xxxxyzzz*v35
    v74         = v55 + 3.0d0*(2.0d0*L_xxxxy + 2.0d0*v52 + v54)
    v75         = v74*y
    v112        = v53 + v74 + v5*v78 + 3.0d0*v57
    Ls_xxxxy    = 0.166666666666667d0*(v53 + v55 + 3.0d0*(v54 + v57)) + L_xxxxxxxy*v31 + &
      L_xxxxy + v16*v2 + v37*v5 + v40*v58 + v52
    v83         = L_xxxxzzzz*v35
    v148        = v81 + v83 + v50*v78 + 6.0d0*(L_xxxxz + v80) + 3.0d0*(v82 + v85)
    Ls_xxxxz    = 0.166666666666667d0*(v81 + v83 + 3.0d0*(v82 + v85)) + L_xxxxxxxz*v31 + &
      L_xxxxz + v16*v22 + v37*v50 + v40*v86 + v80
    v96         = L_xxxyyzzz*v35
    v110        = v96 + 3.0d0*(2.0d0*L_xxxyy + 2.0d0*v93 + v95)
    v111        = v110*y
    v132        = v110*v17
    v174        = v110 + v94 + v7*v78 + 3.0d0*v98
    Ls_xxxyy    = 0.166666666666667d0*(v94 + v96 + 3.0d0*(v95 + v98)) + L_xxxxxxyy*v31 + &
      L_xxxyy + v16*v4 + v37*v7 + v40*v99 + v93
    v116        = L_xxxyzzzz*v35
    v146        = v116 + 3.0d0*(2.0d0*L_xxxyz + 2.0d0*v113 + v115)
    v147        = v146*y
    v201        = v114 + v146 + 3.0d0*v118 + v78*v91
    Ls_xxxyz    = 0.166666666666667d0*(v114 + v116 + 3.0d0*(v115 + v118)) + L_xxxxxxyz*v31 &
      + L_xxxyz + v113 + v119*v40 + v16*v28 + v37*v91
    v158        = L_xxyyyzzz*v35
    v172        = v158 + 3.0d0*(2.0d0*L_xxyyy + 2.0d0*v155 + v157)
    v173        = v172*y
    v189        = v17*v172
    v214        = v172*v32
    v260        = v156 + v172 + 3.0d0*v160 + v78*v9
    Ls_xxyyy    = 0.166666666666667d0*(v156 + v158 + 3.0d0*(v157 + v160)) + L_xxxxxyyy*v31 &
      + L_xxyyy + v155 + v16*v6 + v161*v40 + v37*v9
    v178        = L_xxyyzzzz*v35
    v199        = v178 + 3.0d0*(2.0d0*L_xxyyz + 2.0d0*v175 + v177)
    v200        = v199*y
    v231        = v17*v199
    v287        = v176 + v199 + v153*v78 + 3.0d0*v180
    Ls_xxyyz    = 0.166666666666667d0*(v176 + v178 + 3.0d0*(v177 + v180)) + L_xxxxxyyz*v31 &
      + L_xxyyz + v153*v37 + v16*v51 + v175 + v181*v40
    v244        = L_xyyyyzzz*v35
    v258        = v244 + 3.0d0*(2.0d0*L_xyyyy + 2.0d0*v241 + v243)
    v259        = v258*y
    v275        = v17*v258
    v296        = v258*v32
    Ls_xyyyy    = 0.166666666666667d0*(v242 + v244 + 3.0d0*(v243 + v246)) + L_xxxxyyyy*v31 &
      + L_xyyyy + v11*v37 + v16*v8 + v241 + v247*v40
    v264        = L_xyyyzzzz*v35
    v285        = v264 + 3.0d0*(2.0d0*L_xyyyz + 2.0d0*v261 + v263)
    v286        = v285*y
    v308        = v17*v285
    v337        = v285*v32
    Ls_xyyyz    = 0.166666666666667d0*(v262 + v264 + 3.0d0*(v263 + v266)) + L_xxxxyyyz*v31 &
      + L_xyyyz + v16*v92 + v239*v37 + v261 + v267*v40
    v346        = L_yyyyyzzz*v35
    v356        = v346 + L_yyyyyzz*v355 + 6.0d0*(L_yyyyy + v345)
    Ls_yyyyy    = 0.166666666666667d0*v346 + L_xxxyyyyy*v31 + L_yyyyy + L_yyyyyyyy*v72 + &
      L_yyyyyzz*v314 + v10*v16 + v13*v37 + v345 + v347*v348 + v40*(v236 &
      + 2.0d0*v238 + v245)
    v358        = L_yyyyzzzz*v35
    v370        = v358 + L_yyyyzzz*v355 + 6.0d0*(L_yyyyz + v357)
    Ls_yyyyz    = 0.166666666666667d0*v358 + L_xxxyyyyz*v31 + L_yyyyyyyz*v72 + L_yyyyz + &
      L_yyyyzzz*v314 + v154*v16 + v344*v37 + v347*v359 + v357 + v40*( &
      v249 + 2.0d0*v251 + v265)
    c4          = c2*c2
    v70         = c4
    v316        = 0.0416666666666667d0*v70
    v379        = 5.0d0*v70
    v386        = 30.0d0*v70
    v208        = L_xxzzzz*v70
    v292        = L_xyzzzz*v70
    v127        = L_xxxzzzz*v70
    v186        = L_xxyzzzz*v70
    v228        = L_xxzzzzz*v70
    v272        = L_xyyzzzz*v70
    v305        = L_xyzzzzz*v70
    v71         = L_xxxxzzzz*v70
    v139        = v67 + v71 + v138*v5 + 12.0d0*v68 + 6.0d0*v73 + 24.0d0*(L_xxxx + v63) + &
      4.0d0*(v69 + v75)
    Ls_xxxx     = 0.0416666666666667d0*(v67 + 12.0d0*v68 + v71 + 6.0d0*v73 + 4.0d0*(v69 + &
      v75)) + L_xxxx + L_xxxxxxxx*v65 + v0*v31 + v41*v76 + v5*v72 + v63 &
      + v77*v79
    v108        = L_xxxyzzzz*v70
    v133        = v108 + 12.0d0*v106 + 4.0d0*(6.0d0*L_xxxy + 6.0d0*v104 + v107)
    v134        = v133*y
    v192        = v105 + v133 + 6.0d0*v109 + 4.0d0*v111 + v138*v7
    Ls_xxxy     = 0.0416666666666667d0*(v105 + 12.0d0*v106 + v108 + 6.0d0*v109 + 4.0d0*( &
      v107 + v111)) + L_xxxxxxxy*v65 + L_xxxy + v104 + v112*v77 + v2* &
      v31 + v58*v76 + v7*v72
    v144        = L_xxxzzzzz*v70
    v234        = v141 + v144 + v138*v91 + 12.0d0*v142 + 6.0d0*v145 + 24.0d0*(L_xxxz + &
      v140) + 4.0d0*(v143 + v147)
    Ls_xxxz     = 0.0416666666666667d0*(v141 + 12.0d0*v142 + v144 + 6.0d0*v145 + 4.0d0*( &
      v143 + v147)) + L_xxxxxxxz*v65 + L_xxxz + v140 + v148*v77 + v22* &
      v31 + v72*v91 + v76*v86
    v170        = L_xxyyzzzz*v70
    v190        = v170 + 12.0d0*v168 + 4.0d0*(6.0d0*L_xxyy + 6.0d0*v166 + v169)
    v191        = v190*y
    v215        = v17*v190
    v278        = v167 + v190 + v138*v9 + 6.0d0*v171 + 4.0d0*v173
    Ls_xxyy     = 0.0416666666666667d0*(v167 + 12.0d0*v168 + v170 + 6.0d0*v171 + 4.0d0*( &
      v169 + v173)) + L_xxxxxxyy*v65 + L_xxyy + v166 + v174*v77 + v31* &
      v4 + v72*v9 + v76*v99
    v197        = L_xxyzzzzz*v70
    v232        = v197 + 12.0d0*v195 + 4.0d0*(6.0d0*L_xxyz + 6.0d0*v193 + v196)
    v233        = v232*y
    v311        = v194 + v232 + v138*v153 + 6.0d0*v198 + 4.0d0*v200
    Ls_xxyz     = 0.0416666666666667d0*(v194 + 12.0d0*v195 + v197 + 6.0d0*v198 + 4.0d0*( &
      v196 + v200)) + L_xxxxxxyz*v65 + L_xxyz + v119*v76 + v153*v72 + &
      v193 + v201*v77 + v28*v31
    v256        = L_xyyyzzzz*v70
    v276        = v256 + 12.0d0*v254 + 4.0d0*(6.0d0*L_xyyy + 6.0d0*v252 + v255)
    v277        = v276*y
    v297        = v17*v276
    Ls_xyyy     = 0.0416666666666667d0*(v253 + 12.0d0*v254 + v256 + 6.0d0*v257 + 4.0d0*( &
      v255 + v259)) + L_xxxxxyyy*v65 + L_xyyy + v11*v72 + v161*v76 + &
      v252 + v260*v77 + v31*v6
    v283        = L_xyyzzzzz*v70
    v309        = v283 + 12.0d0*v281 + 4.0d0*(6.0d0*L_xyyz + 6.0d0*v279 + v282)
    v310        = v309*y
    v338        = v17*v309
    Ls_xyyz     = 0.0416666666666667d0*(v280 + 12.0d0*v281 + v283 + 6.0d0*v284 + 4.0d0*( &
      v282 + v286)) + L_xxxxxyyz*v65 + L_xyyz + v181*v76 + v239*v72 + &
      v279 + v287*v77 + v31*v51
    v352        = L_yyyyzzzz*v70
    v367        = v352 + L_yyyyzz*v365 + L_yyyyzzz*v366 + 24.0d0*(L_yyyy + v351)
    Ls_yyyy     = 0.0416666666666667d0*v352 + L_xxxxyyyy*v65 + L_yyyy + L_yyyyyyyy*v130 + &
      L_yyyyzz*v314 + L_yyyyzzz*v315 + v13*v72 + v247*v76 + v31*v8 + &
      v348*v353 + v351 + v354*v356 + v77*(v11*v78 + v242 + 3.0d0*v246 + &
      v258)
    v369        = L_yyyzzzzz*v70
    v383        = v369 + L_yyyzzz*v365 + L_yyyzzzz*v366 + 24.0d0*(L_yyyz + v368)
    Ls_yyyz     = 0.0416666666666667d0*v369 + L_xxxxyyyz*v65 + L_yyyyyyyz*v130 + L_yyyz + &
      L_yyyzzz*v314 + L_yyyzzzz*v315 + v267*v76 + v31*v92 + v344*v72 + &
      v353*v359 + v354*v370 + v368 + v77*(v239*v78 + v262 + 3.0d0*v266 &
      + v285)
    c5          = c2*c3
    v128        = c5
    v317        = 0.00833333333333333d0*v128
    v387        = 6.0d0*v128
    v209        = L_xxzzzzz*v128
    v293        = L_xyzzzzz*v128
    v129        = L_xxxzzzzz*v128
    v223        = v124 + v129 + 60.0d0*v125 + 20.0d0*v126 + v222*v7 + 120.0d0*(L_xxx + &
      v120) + 5.0d0*(v127 + v134) + 10.0d0*(v131 + v132)
    Ls_xxx      = 0.00833333333333333d0*(v124 + 60.0d0*v125 + 20.0d0*v126 + v129 + 5.0d0*( &
      v127 + v134) + 10.0d0*(v131 + v132)) + L_xxx + L_xxxxxxxx*v122 + &
      v0*v65 + v120 + v130*v7 + v135*v41 + v136*v79 + v137*v139
    v187        = L_xxyzzzzz*v128
    v217        = v187 + 60.0d0*v184 + 20.0d0*v185 + 5.0d0*(24.0d0*L_xxy + 24.0d0*v182 + &
      v186)
    v218        = v217*y
    v300        = v183 + v217 + 5.0d0*v191 + v222*v9 + 10.0d0*(v188 + v189)
    Ls_xxy      = 0.00833333333333333d0*(v183 + 60.0d0*v184 + 20.0d0*v185 + v187 + 5.0d0*( &
      v186 + v191) + 10.0d0*(v188 + v189)) + L_xxxxxxxy*v122 + L_xxy + &
      v112*v136 + v130*v9 + v135*v58 + v137*v192 + v182 + v2*v65
    v229        = L_xxzzzzzz*v128
    v341        = v225 + v229 + v153*v222 + 60.0d0*v226 + 20.0d0*v227 + 120.0d0*(L_xxz + &
      v224) + 5.0d0*(v228 + v233) + 10.0d0*(v230 + v231)
    Ls_xxz      = 0.00833333333333333d0*(v225 + 60.0d0*v226 + 20.0d0*v227 + v229 + 5.0d0*( &
      v228 + v233) + 10.0d0*(v230 + v231)) + L_xxxxxxxz*v122 + L_xxz + &
      v130*v153 + v135*v86 + v136*v148 + v137*v234 + v22*v65 + v224
    v273        = L_xyyzzzzz*v128
    v298        = v273 + 60.0d0*v270 + 20.0d0*v271 + 5.0d0*(24.0d0*L_xyy + 24.0d0*v268 + &
      v272)
    v299        = v298*y
    Ls_xyy      = 0.00833333333333333d0*(v269 + 60.0d0*v270 + 20.0d0*v271 + v273 + 5.0d0*( &
      v272 + v277) + 10.0d0*(v274 + v275)) + L_xxxxxxyy*v122 + L_xyy + &
      v11*v130 + v135*v99 + v136*v174 + v137*v278 + v268 + v4*v65
    v306        = L_xyzzzzzz*v128
    v339        = v306 + 60.0d0*v303 + 20.0d0*v304 + 5.0d0*(24.0d0*L_xyz + 24.0d0*v301 + &
      v305)
    v340        = v339*y
    Ls_xyz      = 0.00833333333333333d0*(v302 + 60.0d0*v303 + 20.0d0*v304 + v306 + 5.0d0*( &
      v305 + v310) + 10.0d0*(v307 + v308)) + L_xxxxxxyz*v122 + L_xyz + &
      v119*v135 + v130*v239 + v136*v201 + v137*v311 + v28*v65 + v301
    v361        = L_yyyzzzzz*v128
    v380        = v361 + L_yyyzz*v377 + L_yyyzzz*v378 + L_yyyzzzz*v379 + 120.0d0*(L_yyy + &
      v360)
    Ls_yyy      = 0.00833333333333333d0*v361 + L_xxxxxyyy*v122 + L_yyy + L_yyyyyyyy*v212 + &
      L_yyyzz*v314 + L_yyyzzz*v315 + L_yyyzzzz*v316 + v13*v130 + v135* &
      v161 + v136*v260 + v137*(v11*v138 + v253 + 6.0d0*v257 + 4.0d0* &
      v259 + v276) + v348*v362 + v356*v363 + v360 + v364*v367 + v6*v65
    v382        = L_yyzzzzzz*v128
    v390        = v382 + L_yyzzz*v377 + L_yyzzzz*v378 + L_yyzzzzz*v379 + 120.0d0*(L_yyz + &
      v381)
    Ls_yyz      = 0.00833333333333333d0*v382 + L_xxxxxyyz*v122 + L_yyyyyyyz*v212 + L_yyz + &
      L_yyzzz*v314 + L_yyzzzz*v315 + L_yyzzzzz*v316 + v130*v344 + v135* &
      v181 + v136*v287 + v137*(v138*v239 + v280 + 6.0d0*v284 + 4.0d0* &
      v286 + v309) + v359*v362 + v363*v370 + v364*v383 + v381 + v51*v65
    c6          = c3*c3
    v210        = c6
    v318        = 0.00138888888888889d0*v210
    v211        = L_xxzzzzzz*v210
    Ls_xx       = 0.00138888888888889d0*(v205 + 360.0d0*v206 + 120.0d0*v207 + 30.0d0*v208 &
      + v211 + 20.0d0*v214 + 6.0d0*(v209 + v218) + 15.0d0*(v213 + v215 &
      )) + L_xx + L_xxxxxxxx*v203 + v0*v122 + v139*v220 + v202 + v212* &
      v9 + v216*v41 + v219*v79 + v221*v223
    v294        = L_xyzzzzzz*v210
    v327        = v294 + 360.0d0*v290 + 120.0d0*v291 + 30.0d0*v292 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v288 + v293)
    Ls_xy       = 0.00138888888888889d0*(v289 + 360.0d0*v290 + 120.0d0*v291 + 30.0d0*v292 &
      + v294 + 20.0d0*v296 + 6.0d0*(v293 + v299) + 15.0d0*(v295 + v297 &
      )) + L_xxxxxxxy*v203 + L_xy + v11*v212 + v112*v219 + v122*v2 + &
      v192*v220 + v216*v58 + v221*v300 + v288
    v335        = L_xzzzzzzz*v210
    Ls_xz       = 0.00138888888888889d0*(v334 + v335 + 20.0d0*v337 + 6.0d0*v340 + 15.0d0*( &
      v336 + v338)) + L_xxxxxxxz*v203 + L_xz + L_xzzz*v314 + L_xzzzz* &
      v315 + L_xzzzzz*v316 + L_xzzzzzz*v317 + v122*v22 + v148*v219 + &
      v212*v239 + v216*v86 + v220*v234 + v221*v341 + v333
    v372        = L_yyzzzzzz*v210
    Ls_yy       = 0.00138888888888889d0*v372 + L_xxxxxxyy*v203 + L_yy + L_yyyyyyyy*v320 + &
      L_yyzz*v314 + L_yyzzz*v315 + L_yyzzzz*v316 + L_yyzzzzz*v317 + &
      v122*v4 + v13*v212 + v174*v219 + v216*v99 + v220*v278 + v221*(v11 &
      *v222 + v269 + 10.0d0*v274 + 10.0d0*v275 + 5.0d0*v277 + v298) + &
      v348*v373 + v356*v374 + v367*v375 + v371 + v376*v380
    v389        = L_yzzzzzzz*v210
    Ls_yz       = 0.00138888888888889d0*v389 + L_xxxxxxyz*v203 + L_yyyyyyyz*v320 + L_yz + &
      L_yzzz*v314 + L_yzzzz*v315 + L_yzzzzz*v316 + L_yzzzzzz*v317 + &
      v119*v216 + v122*v28 + v201*v219 + v212*v344 + v220*v311 + v221*( &
      v222*v239 + v302 + 10.0d0*v307 + 10.0d0*v308 + 5.0d0*v310 + v339 &
      ) + v359*v373 + v370*v374 + v375*v383 + v376*v390 + v388
    c7          = c3*c4
    v319        = 0.000198412698412698d0*c7
    Ls_x        = L_x + L_xxxxxxxx*v312 + L_xyyyyyyy*v313 + L_xz*z + L_xzz*v314 + L_xzzz* &
      v315 + L_xzzzz*v316 + L_xzzzzz*v317 + L_xzzzzzz*v318 + L_xzzzzzzz &
      *v319 + v0*v203 + v11*v320 + v139*v329 + v223*v330 + v245*v321 + &
      v258*v322 + v276*v323 + v298*v325 + v324*v41 + v326*v327 + v328* &
      v79 + v331*(720.0d0*L_xx + 720.0d0*v202 + v205 + 360.0d0*v206 + &
      120.0d0*v207 + 30.0d0*v208 + 6.0d0*v209 + v211 + 15.0d0*v213 + &
      20.0d0*v214 + 15.0d0*v215 + 6.0d0*v218 + v332*v9)
    Ls_y        = L_y + L_xxxxxxxy*v312 + L_yyyyyyyy*v313 + L_yz*z + L_yzz*v314 + L_yzzz* &
      v315 + L_yzzzz*v316 + L_yzzzzz*v317 + L_yzzzzzz*v318 + L_yzzzzzzz &
      *v319 + v112*v328 + v13*v320 + v192*v329 + v2*v203 + v300*v330 + &
      v321*v348 + v322*v356 + v323*v367 + v324*v58 + v325*v380 + v326*( &
      720.0d0*L_yy + L_yyzz*v384 + L_yyzzz*v385 + L_yyzzzz*v386 + &
      L_yyzzzzz*v387 + 720.0d0*v371 + v372) + v331*(v11*v332 + v289 + &
      15.0d0*v295 + 20.0d0*v296 + 15.0d0*v297 + 6.0d0*v299 + v327)
    Ls_z        = L_z + L_xxxxxxxz*v312 + L_yyyyyyyz*v313 + L_zz*z + L_zzz*v314 + L_zzzz* &
      v315 + L_zzzzz*v316 + L_zzzzzz*v317 + L_zzzzzzz*v318 + L_zzzzzzzz &
      *v319 + v148*v328 + v203*v22 + v234*v329 + v320*v344 + v321*v359 &
      + v322*v370 + v323*v383 + v324*v86 + v325*v390 + v326*(720.0d0* &
      L_yz + L_yzzz*v384 + L_yzzzz*v385 + L_yzzzzz*v386 + L_yzzzzzz* &
      v387 + 720.0d0*v388 + v389) + v330*v341 + v331*(720.0d0*L_xz + &
      L_xzzz*v384 + L_xzzzz*v385 + L_xzzzzz*v386 + L_xzzzzzz*v387 + &
      v239*v332 + 720.0d0*v333 + v334 + v335 + 15.0d0*v336 + 20.0d0* &
      v337 + 15.0d0*v338 + 6.0d0*v340)
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
#undef  L_yy                
#undef  Ls_yy               
#undef  Ls_yz               
#undef  L_yz                
#undef  Ls_xxx              
#undef  L_xxx               
#undef  Ls_xxy              
#undef  L_xxy               
#undef  Ls_xxz              
#undef  L_xxz               
#undef  Ls_xyy              
#undef  L_xyy               
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
#undef  L_yyyyy             
#undef  Ls_yyyyy            
#undef  L_yyyyz             
#undef  Ls_yyyyz            
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
#undef  L_xxxyyz            
#undef  Ls_xxxyyz           
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
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
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
#undef  L_xxxxxxxx          
#undef  Ls_xxxxxxxx         
#undef  Ls_xxxxxxxy         
#undef  L_xxxxxxxy          
#undef  Ls_xxxxxxxz         
#undef  L_xxxxxxxz          
#undef  Ls_xxxxxxyy         
#undef  L_xxxxxxyy          
#undef  Ls_xxxxxxyz         
#undef  L_xxxxxxyz          
#undef  Ls_xxxxxyyy         
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  Ls_xxxxxyyz         
#undef  Ls_xxxxyyyy         
#undef  L_xxxxyyyy          
#undef  L_xxxxyyyz          
#undef  Ls_xxxxyyyz         
#undef  Ls_xxxyyyyy         
#undef  L_xxxyyyyy          
#undef  Ls_xxxyyyyz         
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  Ls_xxyyyyyy         
#undef  Ls_xxyyyyyz         
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  Ls_xyyyyyyy         
#undef  Ls_xyyyyyyz         
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L2_add
#endif
end module mom8
