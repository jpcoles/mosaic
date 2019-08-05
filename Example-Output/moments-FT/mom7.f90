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
        
    
! OPS  91*ADD + 203*MUL + 31*NEG + 17*SUB = 342  (1085 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v11, v12, v13, v14, v15,&
                v16, v17, v18, v19, v2, v20, v21, v22, v23, v24, v25, v26,&
                v27, v28, v29, v3, v30, v31, v32, v33, v34, v35, v36, v37,&
                v38, v39, v4, v40, v41, v42, v43, v44, v45, v46, v47, v48,&
                v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v6,&
                v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70,&
                v71, v8, v9, h, u
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
#define M_xxxxxxx            M(49)
#define M_xxxxxxy            M(50)
#define M_xxxxxxz            M(51)
#define M_xxxxxyy            M(52)
#define M_xxxxxyz            M(53)
#define M_xxxxyyy            M(54)
#define M_xxxxyyz            M(55)
#define M_xxxyyyy            M(56)
#define M_xxxyyyz            M(57)
#define M_xxyyyyy            M(58)
#define M_xxyyyyz            M(59)
#define M_xyyyyyy            M(60)
#define M_xyyyyyz            M(61)
#define M_yyyyyyy            M(62)
#define M_yyyyyyz            M(63)
    v0        = W*x
    v1        = W*y
    v2        = W*z
    v3        = v0*y
    v4        = v0*z
    v5        = v1*z
    v6        = v3*z
    M_0       = W
    M_x       = v0
    M_y       = v1
    M_z       = v2
    M_xy      = v3
    M_xz      = v4
    M_yz      = v5
    M_xyz     = v6
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v7        = a2
    v48       = 3.0d0*v7
    a3        = a1*a2
    a4        = a2*a2
    v18       = a4
    a5        = a2*a3
    a6        = a3*a3
    v36       = a6
    a7        = a3*a4
    b2        = b1*b1
    v8        = b2
    v9        = v7 + v8
    v24       = v7*v8
    v44       = v18*v8
    v49       = 3.0d0*v8
    b3        = b1*b2
    b4        = b2*b2
    v28       = b4
    v51       = v28*v7
    b5        = b2*b3
    b6        = b3*b3
    v54       = b6
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v9
    v66       = h*v7
    v67       = h*v8
    v10       = 0.333333333333333d0*h
    v11       = -v10
    v12       = v11 + v7
    v13       = v11 + v8
    v14       = -0.6d0*h
    v15       = -0.2d0*h
    v16       = v15 + v7
    v17       = v15 + v8
    v19       = h*h
    v20       = 0.0857142857142857d0*v19
    v21       = v66
    v22       = -0.428571428571429d0*h
    v23       = v22 + v7
    v25       = 0.142857142857143d0*h
    v26       = -v25
    v27       = v22 + v8
    v29       = v67
    v30       = 0.238095238095238d0*v19
    v31       = 0.0476190476190476d0*v19
    v32       = 0.333333333333333d0*(-2.0d0*v21) + v18 + v31
    v33       = v24 + v31
    v68       = -v33
    v34       = h*v9
    v35       = 0.333333333333333d0*(-2.0d0*v29) + v28 + v31
    v37       = h*h*h
    v38       = -0.0216450216450216d0*v37
    v39       = h*v18
    v40       = v19*v7
    v41       = 0.151515151515152d0*v19
    v42       = 0.0909090909090909d0*(-10.0d0*v21) + v18 + v41
    v43       = -0.00432900432900433d0*v37
    v45       = 0.0303030303030303d0*v19
    v46       = v66*(v7 + 6.0d0*v8)
    v47       = 0.0909090909090909d0*h
    v50       = v24 + v45
    v69       = -v50
    v52       = v67*(6.0d0*v7 + v8)
    v53       = 0.0909090909090909d0*(-10.0d0*v29) + v28 + v41
    v55       = h*v28
    v56       = v19*v8
    v57       = -0.0815850815850816d0*v37
    v58       = -0.0116550116550117d0*v37
    v59       = v36 + v58 + 0.00699300699300699d0*(-165.0d0*v39 + 45.0d0*v40)
    v60       = 0.104895104895105d0*v19
    v61       = -0.00699300699300699d0*(66.0d0*v21*v8 + v37)
    v62       = 0.020979020979021d0*v56
    v70       = v44 + v62
    v63       = -0.00233100233100233d0*v37
    v64       = 0.020979020979021d0*v40
    v71       = v51 + v64
    v65       = v54 + v58 + 0.00699300699300699d0*(-165.0d0*v55 + 45.0d0*v56)
    M_xx      = W*v12
    M_yy      = W*v13
    M_xxx     = v0*(v14 + v7)
    M_xxy     = v1*v16
    M_xxz     = v16*v2
    M_xyy     = v0*v17
    M_yyy     = v1*(v14 + v8)
    M_yyz     = v17*v2
    M_xxxx    = W*(0.142857142857143d0*(-6.0d0*v21) + v18 + v20)
    M_xxxy    = v23*v3
    M_xxxz    = v23*v4
    M_xxyy    = W*(0.0285714285714286d0*v19 + v24 - v25*v9)
    M_xxyz    = v5*(v26 + v7)
    M_xyyy    = v27*v3
    M_xyyz    = v4*(v26 + v8)
    M_yyyy    = W*(0.142857142857143d0*(-6.0d0*v29) + v20 + v28)
    M_yyyz    = v27*v5
    M_xxxxx   = v0*(0.111111111111111d0*(-10.0d0*v21) + v18 + v30)
    M_xxxxy   = v1*v32
    M_xxxxz   = v2*v32
    M_xxxyy   = -v0*(0.111111111111111d0*v21 + v10*v8 + v68)
    M_xxxyz   = v12*v6
    M_xxyyy   = -v1*(0.111111111111111d0*v29 + v10*v7 + v68)
    M_xxyyz   = v2*(v24 + 0.0158730158730159d0*(v19 - 7.0d0*v34))
    M_xyyyy   = v0*v35
    M_xyyyz   = v13*v6
    M_yyyyy   = v1*(0.111111111111111d0*(-10.0d0*v29) + v28 + v30)
    M_yyyyz   = v2*v35
    M_xxxxxx  = W*(v36 + v38 + 0.0909090909090909d0*(-15.0d0*v39 + 5.0d0*v40))
    M_xxxxxy  = v3*v42
    M_xxxxxz  = v4*v42
    M_xxxxyy  = W*(0.0909090909090909d0*(-v46) + v43 + v44 + v45*(2.0d0*v7 + v8))
    M_xxxxyz  = v5*(0.0909090909090909d0*(-6.0d0*v21) + v18 + v45)
    M_xxxyyy  = v3*(v24 - v47*(-h + v48 + v49))
    M_xxxyyz  = -v4*(v47*(v49 + v7) + v69)
    M_xxyyyy  = W*(0.0909090909090909d0*(-v52) + v43 + v45*(v7 + 2.0d0*v8) + v51)
    M_xxyyyz  = -v5*(v47*(v48 + v8) + v69)
    M_xyyyyy  = v3*v53
    M_xyyyyz  = v4*(0.0909090909090909d0*(-6.0d0*v29) + v28 + v45)
    M_yyyyyy  = W*(v38 + v54 + 0.0909090909090909d0*(-15.0d0*v55 + 5.0d0*v56))
    M_yyyyyz  = v5*v53
    M_xxxxxxx = v0*(v36 + v57 + 0.00699300699300699d0*(-231.0d0*v39 + 105.0d0*v40))
    M_xxxxxxy = v1*v59
    M_xxxxxxz = v2*v59
    M_xxxxxyy = v0*(0.00699300699300699d0*(-11.0d0*v21*(v7 + 10.0d0*v8) + 10.0d0*v40) + &
      v44 + v58 + v60*v8)
    M_xxxxxyz = v6*(0.0769230769230769d0*(-10.0d0*v21) + v18 + v60)
    M_xxxxyyy = v1*(0.00699300699300699d0*(-33.0d0*v39 + 18.0d0*v40) + v61 + v70)
    M_xxxxyyz = v2*(0.00699300699300699d0*(6.0d0*v40 - 11.0d0*v46) + v63 + v70)
    M_xxxyyyy = v0*(0.00699300699300699d0*(-33.0d0*v55 + 18.0d0*v56) + v61 + v71)
    M_xxxyyyz = v6*(v24 + 0.00699300699300699d0*(9.0d0*v19 - 33.0d0*v34))
    M_xxyyyyy = v1*(0.00699300699300699d0*(-11.0d0*v29*(10.0d0*v7 + v8) + 10.0d0*v56) + &
      v51 + v58 + v60*v7)
    M_xxyyyyz = v2*(0.00699300699300699d0*(-11.0d0*v52 + 6.0d0*v56) + v63 + v71)
    M_xyyyyyy = v0*v65
    M_xyyyyyz = v6*(0.0769230769230769d0*(-10.0d0*v29) + v28 + v60)
    M_yyyyyyy = v1*(v54 + v57 + 0.00699300699300699d0*(-231.0d0*v55 + 105.0d0*v56))
    M_yyyyyyz = v2*v65
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
    
! OPS  2591*ADD + 2576*MUL + 142*NEG + 688*SUB = 5997  (11463 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v1000, v1001,&
                v1002, v1003, v1004, v1005, v1006, v1007, v1008, v1009, v101,&
                v1010, v1011, v1012, v1013, v1014, v1015, v1016, v1017, v1018,&
                v1019, v102, v1020, v1021, v1022, v1023, v1024, v1025, v1026,&
                v1027, v1028, v1029, v103, v1030, v1031, v1032, v1033, v1034,&
                v1035, v1036, v1037, v1038, v1039, v104, v1040, v1041, v1042,&
                v1043, v1044, v1045, v1046, v1047, v1048, v1049, v105, v1050,&
                v1051, v1052, v1053, v1054, v1055, v1056, v1057, v1058, v1059,&
                v106, v1060, v1061, v1062, v1063, v1064, v1065, v1066, v1067,&
                v1068, v1069, v107, v1070, v1071, v1072, v1073, v1074, v1075,&
                v1076, v1077, v1078, v1079, v108, v1080, v1081, v1082, v1083,&
                v1084, v1085, v1086, v1087, v1088, v1089, v109, v1090, v11,&
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
                v238, v239, v24, v240, v241, v242, v243, v244, v245, v246,&
                v247, v248, v249, v25, v250, v251, v252, v253, v254, v255,&
                v256, v257, v258, v259, v26, v260, v261, v262, v263, v264,&
                v265, v266, v267, v268, v269, v27, v270, v271, v272, v273,&
                v274, v275, v276, v277, v278, v279, v28, v280, v281, v282,&
                v283, v284, v285, v286, v287, v288, v289, v29, v290, v291,&
                v292, v293, v294, v295, v296, v297, v298, v299, v3, v30, v300,&
                v301, v302, v303, v304, v305, v306, v307, v308, v309, v31,&
                v310, v311, v312, v313, v314, v315, v316, v317, v318, v319,&
                v32, v320, v321, v322, v323, v324, v325, v326, v327, v328,&
                v329, v33, v330, v331, v332, v333, v334, v335, v336, v337,&
                v338, v339, v34, v340, v341, v342, v343, v344, v345, v346,&
                v347, v348, v349, v35, v350, v351, v352, v353, v354, v355,&
                v356, v357, v358, v359, v36, v360, v361, v362, v363, v364,&
                v365, v366, v367, v368, v369, v37, v370, v371, v372, v373,&
                v374, v375, v376, v377, v378, v379, v38, v380, v381, v382,&
                v383, v384, v385, v386, v387, v388, v389, v39, v390, v391,&
                v392, v393, v394, v395, v396, v397, v398, v399, v4, v40, v400,&
                v401, v402, v403, v404, v405, v406, v407, v408, v409, v41,&
                v410, v411, v412, v413, v414, v415, v416, v417, v418, v419,&
                v42, v420, v421, v422, v423, v424, v425, v426, v427, v428,&
                v429, v43, v430, v431, v432, v433, v434, v435, v436, v437,&
                v438, v439, v44, v440, v441, v442, v443, v444, v445, v446,&
                v447, v448, v449, v45, v450, v451, v452, v453, v454, v455,&
                v456, v457, v458, v459, v46, v460, v461, v462, v463, v464,&
                v465, v466, v467, v468, v469, v47, v470, v471, v472, v473,&
                v474, v475, v476, v477, v478, v479, v48, v480, v481, v482,&
                v483, v484, v485, v486, v487, v488, v489, v49, v490, v491,&
                v492, v493, v494, v495, v496, v497, v498, v499, v5, v50, v500,&
                v501, v502, v503, v504, v505, v506, v507, v508, v509, v51,&
                v510, v511, v512, v513, v514, v515, v516, v517, v518, v519,&
                v52, v520, v521, v522, v523, v524, v525, v526, v527, v528,&
                v529, v53, v530, v531, v532, v533, v534, v535, v536, v537,&
                v538, v539, v54, v540, v541, v542, v543, v544, v545, v546,&
                v547, v548, v549, v55, v550, v551, v552, v553, v554, v555,&
                v556, v557, v558, v559, v56, v560, v561, v562, v563, v564,&
                v565, v566, v567, v568, v569, v57, v570, v571, v572, v573,&
                v574, v575, v576, v577, v578, v579, v58, v580, v581, v582,&
                v583, v584, v585, v586, v587, v588, v589, v59, v590, v591,&
                v592, v593, v594, v595, v596, v597, v598, v599, v6, v60, v600,&
                v601, v602, v603, v604, v605, v606, v607, v608, v609, v61,&
                v610, v611, v612, v613, v614, v615, v616, v617, v618, v619,&
                v62, v620, v621, v622, v623, v624, v625, v626, v627, v628,&
                v629, v63, v630, v631, v632, v633, v634, v635, v636, v637,&
                v638, v639, v64, v640, v641, v642, v643, v644, v645, v646,&
                v647, v648, v649, v65, v650, v651, v652, v653, v654, v655,&
                v656, v657, v658, v659, v66, v660, v661, v662, v663, v664,&
                v665, v666, v667, v668, v669, v67, v670, v671, v672, v673,&
                v674, v675, v676, v677, v678, v679, v68, v680, v681, v682,&
                v683, v684, v685, v686, v687, v688, v689, v69, v690, v691,&
                v692, v693, v694, v695, v696, v697, v698, v699, v7, v70, v700,&
                v701, v702, v703, v704, v705, v706, v707, v708, v709, v71,&
                v710, v711, v712, v713, v714, v715, v716, v717, v718, v719,&
                v72, v720, v721, v722, v723, v724, v725, v726, v727, v728,&
                v729, v73, v730, v731, v732, v733, v734, v735, v736, v737,&
                v738, v739, v74, v740, v741, v742, v743, v744, v745, v746,&
                v747, v748, v749, v75, v750, v751, v752, v753, v754, v755,&
                v756, v757, v758, v759, v76, v760, v761, v762, v763, v764,&
                v765, v766, v767, v768, v769, v77, v770, v771, v772, v773,&
                v774, v775, v776, v777, v778, v779, v78, v780, v781, v782,&
                v783, v784, v785, v786, v787, v788, v789, v79, v790, v791,&
                v792, v793, v794, v795, v796, v797, v798, v799, v8, v80, v800,&
                v801, v802, v803, v804, v805, v806, v807, v808, v809, v81,&
                v810, v811, v812, v813, v814, v815, v816, v817, v818, v819,&
                v82, v820, v821, v822, v823, v824, v825, v826, v827, v828,&
                v829, v83, v830, v831, v832, v833, v834, v835, v836, v837,&
                v838, v839, v84, v840, v841, v842, v843, v844, v845, v846,&
                v847, v848, v849, v85, v850, v851, v852, v853, v854, v855,&
                v856, v857, v858, v859, v86, v860, v861, v862, v863, v864,&
                v865, v866, v867, v868, v869, v87, v870, v871, v872, v873,&
                v874, v875, v876, v877, v878, v879, v88, v880, v881, v882,&
                v883, v884, v885, v886, v887, v888, v889, v89, v890, v891,&
                v892, v893, v894, v895, v896, v897, v898, v899, v9, v90, v900,&
                v901, v902, v903, v904, v905, v906, v907, v908, v909, v91,&
                v910, v911, v912, v913, v914, v915, v916, v917, v918, v919,&
                v92, v920, v921, v922, v923, v924, v925, v926, v927, v928,&
                v929, v93, v930, v931, v932, v933, v934, v935, v936, v937,&
                v938, v939, v94, v940, v941, v942, v943, v944, v945, v946,&
                v947, v948, v949, v95, v950, v951, v952, v953, v954, v955,&
                v956, v957, v958, v959, v96, v960, v961, v962, v963, v964,&
                v965, v966, v967, v968, v969, v97, v970, v971, v972, v973,&
                v974, v975, v976, v977, v978, v979, v98, v980, v981, v982,&
                v983, v984, v985, v986, v987, v988, v989, v99, v990, v991,&
                v992, v993, v994, v995, v996, v997, v998, v999, h, u, M_zz,&
                M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz,&
                M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz,&
                M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz,&
                M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz,&
                M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz,&
                M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz,&
                M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz,&
                M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz,&
                M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz,&
                M_yzzzzzz, M_zzzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz,&
                S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz,&
                S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy,&
                S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy,&
                S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz,&
                S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz, S_xxzzz,&
                S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy, S_yyyyz,&
                S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz, S_xxxxxx, S_xxxxxy,&
                S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxxzz, S_xxxyyy, S_xxxyyz,&
                S_xxxyzz, S_xxxzzz, S_xxyyyy, S_xxyyyz, S_xxyyzz, S_xxyzzz,&
                S_xxzzzz, S_xyyyyy, S_xyyyyz, S_xyyyzz, S_xyyzzz, S_xyzzzz,&
                S_xzzzzz, S_yyyyyy, S_yyyyyz, S_yyyyzz, S_yyyzzz, S_yyzzzz,&
                S_yzzzzz, S_zzzzzz, S_xxxxxxx, S_xxxxxxy, S_xxxxxxz,&
                S_xxxxxyy, S_xxxxxyz, S_xxxxyyy, S_xxxxyyz, S_xxxyyyy,&
                S_xxxyyyz, S_xxyyyyy, S_xxyyyyz, S_xyyyyyy, S_xyyyyyz,&
                S_yyyyyyy, S_yyyyyyz
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
#define Ms_xxxxxxx           Ms(49)
#define M_xxxxxxx            M(49)
#define Ms_xxxxxxy           Ms(50)
#define M_xxxxxxy            M(50)
#define Ms_xxxxxxz           Ms(51)
#define M_xxxxxxz            M(51)
#define M_xxxxxyy            M(52)
#define Ms_xxxxxyy           Ms(52)
#define Ms_xxxxxyz           Ms(53)
#define M_xxxxxyz            M(53)
#define Ms_xxxxyyy           Ms(54)
#define M_xxxxyyy            M(54)
#define Ms_xxxxyyz           Ms(55)
#define M_xxxxyyz            M(55)
#define Ms_xxxyyyy           Ms(56)
#define M_xxxyyyy            M(56)
#define Ms_xxxyyyz           Ms(57)
#define M_xxxyyyz            M(57)
#define Ms_xxyyyyy           Ms(58)
#define M_xxyyyyy            M(58)
#define Ms_xxyyyyz           Ms(59)
#define M_xxyyyyz            M(59)
#define M_xyyyyyy            M(60)
#define Ms_xyyyyyy           Ms(60)
#define M_xyyyyyz            M(61)
#define Ms_xyyyyyz           Ms(61)
#define Ms_yyyyyyy           Ms(62)
#define M_yyyyyyy            M(62)
#define M_yyyyyyz            M(63)
#define Ms_yyyyyyz           Ms(63)
    v0         = x*y
    v1         = x*z
    v2         = y*z
    v3         = v0*z
    v9         = M_x*x
    v10        = M_y*y
    v11        = -0.666666666666667d0*M_z*z
    v15        = M_xx*x
    v16        = M_xy*y
    v17        = M_xz*z
    v23        = M_xy*x
    v25        = M_yy*y
    v26        = M_yz*z
    v29        = M_xx*z
    v30        = M_xz*x
    v32        = M_yy*z
    v33        = M_yz*y
    v47        = M_xxx*x
    v48        = 1.71428571428571d0*y
    v49        = M_xxy*v48
    v50        = M_xxz*z
    v52        = 1.71428571428571d0*M_y
    v59        = 0.857142857142857d0*M_xyz
    v64        = M_xxy*x
    v67        = M_xyy*y
    v71        = 3.0d0*M_xx
    v72        = M_xxx*z
    v73        = M_xxz*x
    v75        = M_xyy*z
    v76        = 3.0d0*M_xz
    v84        = 1.71428571428571d0*M_x
    v86        = 1.71428571428571d0*x
    v87        = M_xyy*v86
    v89        = M_yyy*y
    v90        = M_yyz*z
    v94        = M_xxy*z
    v98        = M_yyy*z
    v99        = M_yyz*y
    v107       = 3.0d0*M_yz
    v118       = M_xxxx*x
    v119       = M_xxxy*y
    v120       = M_xxxz*z
    v122       = M_xxyy*x
    v133       = M_yyyy*x
    v148       = M_xxxx*y
    v149       = M_xxxy*x
    v152       = M_xxyy*y
    v153       = M_xxyz*z
    v167       = M_yyyy*y
    v172       = M_xxyy*z
    v185       = M_xxxx*z
    v186       = M_xxxz*x
    v188       = M_xxyz*y
    v198       = M_yyyy*z
    v208       = M_xyyy*y
    v209       = M_xyyz*z
    v217       = M_xxxy*z
    v219       = M_xxyz*x
    v223       = M_xyyy*z
    v224       = M_xyyz*y
    v225       = 3.0d0*M_xyz
    v235       = M_xyyy*x
    v236       = M_yyyz*z
    v239       = M_xyyz*x
    v241       = M_yyyz*y
    v248       = M_xxyyz*z
    v272       = M_xxxxx*x
    v273       = M_xxxxy*y
    v274       = M_xxxxz*z
    v276       = M_xxxyy*x
    v283       = M_xxyyy*y
    v292       = M_xyyyy*x
    v309       = M_yyyyy*y
    v310       = M_yyyyz*z
    v346       = M_xxxxx*y
    v347       = M_xxxxy*x
    v350       = M_xxxyy*y
    v351       = 1.81818181818182d0*M_xxxyz
    v354       = M_xxyyy*x
    v362       = M_xyyyy*y
    v374       = M_yyyyy*x
    v386       = 10.0d0*M_xxx
    v389       = M_xxxxx*z
    v390       = M_xxxxz*x
    v392       = M_xxxyy*z
    v393       = v351*y
    v400       = M_xxyyz*x
    v410       = M_xyyyy*z
    v414       = 5.45454545454545d0*M_xyz
    v427       = M_yyyyz*x
    v472       = M_xxxxy*z
    v473       = M_xxxxz*y
    v475       = M_xxxyz*x
    v480       = M_xxyyy*z
    v481       = M_xxyyz*y
    v500       = M_yyyyy*z
    v501       = M_yyyyz*y
    v513       = 0.545454545454545d0*z
    v516       = 0.545454545454545d0*M_z
    v520       = M_xyyyz*y
    v529       = 1.81818181818182d0*M_xyyyz
    v530       = v529*x
    v561       = M_xxxxxx*x
    v562       = M_xxxxxy*y
    v563       = M_xxxxxz*z
    v565       = M_xxxxyy*x
    v572       = M_xxxyyy*y
    v573       = M_xxxyyz*z
    v586       = M_xxyyyy*x
    v611       = M_xyyyyy*y
    v612       = M_xyyyyz*z
    v640       = M_yyyyyy*x
    v690       = M_xxxxxx*y
    v691       = M_xxxxxy*x
    v694       = M_xxxxyy*y
    v695       = M_xxxxyz*z
    v701       = M_xxxyyy*x
    v715       = M_xxyyyy*y
    v716       = M_xxyyyz*z
    v736       = M_xyyyyy*x
    v764       = M_yyyyyy*y
    v765       = M_yyyyyz*z
    v814       = M_xxxxxx*z
    v815       = M_xxxxxz*x
    v817       = M_xxxxyy*z
    v818       = 0.559440559440559d0*v817
    v819       = M_xxxxyz*y
    v825       = M_xxxyyz*x
    v836       = M_xxyyyy*z
    v837       = M_xxyyyz*y
    v860       = M_xyyyyz*x
    v890       = M_yyyyyy*z
    v891       = M_yyyyyz*y
    v947       = M_xxxyyy*z
    v990       = M_xxxxxy*z
    v991       = M_xxxxxz*y
    v993       = M_xxxxyz*x
    v997       = M_xxxyyz*y
    v1004      = M_xxyyyz*x
    v1013      = M_xyyyyy*z
    v1014      = M_xyyyyz*y
    v1029      = M_yyyyyz*x
    v1060      = 0.559440559440559d0*v836
    Ms_0       = M_0
    Ms_x       = M_0*x + M_x
    Ms_y       = M_0*y + M_y
    Ms_z       = M_0*z + M_z
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    v124       = M_xxzz*x
    v139       = M_xxzz*y
    v173       = M_xxzz*z
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v134       = M_yyzz*x
    v142       = M_yyzz*y
    v176       = M_yyzz*z
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    v278       = M_xxxzz*x
    v323       = M_xxxzz*y
    v396       = M_xxxzz*z
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    v285       = M_xxyzz*y
    v326       = M_xxyzz*x
    v454       = M_xxyzz*z
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    v250       = M_xxzzz*z
    v405       = M_xxzzz*x
    v456       = M_xxzzz*y
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    v1078      = M_xxxzz + M_xyyzz
    v293       = M_xyyzz*x
    v332       = M_xyyzz*y
    v413       = M_xyyzz*z
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -v1078
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    v1079      = M_xxyzz + M_yyyzz
    v311       = M_yyyzz*y
    v336       = M_yyyzz*x
    v459       = M_yyyzz*z
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v253       = M_yyzzz*z
    v431       = M_yyzzz*x
    v461       = M_yyzzz*y
    M_yzzzz    = -v1079
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    v567       = M_xxxxzz*x
    v697       = M_xxxxzz*y
    v822       = M_xxxxzz*z
    v935       = 0.104895104895105d0*v567
    v1057      = 0.174825174825175d0*v822
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    v575       = M_xxxyzz*y
    v703       = M_xxxyzz*x
    v949       = M_xxxyzz*z
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    v580       = M_xxxzzz*z
    v830       = M_xxxzzz*x
    v951       = M_xxxzzz*y
    v1059      = 0.0699300699300699d0*v830
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    v588       = M_xxyyzz*x
    v658       = M_xxyyzz*y
    v786       = M_xxyyzz*z
    v787       = -1.22377622377622d0*v786
    v1061      = -0.244755244755245d0*v786
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    v659       = M_xxyzzz*z
    v844       = M_xxyzzz*y
    v845       = 0.0699300699300699d0*v844
    v955       = M_xxyzzz*x
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    v596       = M_xxzzzz*x
    v661       = M_xxzzzz*y
    v788       = M_xxzzzz*z
    v789       = 0.0815850815850816d0*v788
    v1062      = 0.0163170163170163d0*v788
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    v613       = M_xyyyzz*y
    v737       = M_xyyyzz*x
    v962       = M_xyyyzz*z
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    v1080      = M_xxxzzz + M_xyyzzz
    v618       = M_xyyzzz*z
    v864       = M_xyyzzz*x
    v964       = M_xyyzzz*y
    v1066      = 0.0699300699300699d0*v864
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -v1080
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    v642       = M_yyyyzz*x
    v767       = M_yyyyzz*y
    v768       = 0.104895104895105d0*v767
    v895       = M_yyyyzz*z
    v896       = 0.174825174825175d0*v895
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v1081      = M_xxyzzz + M_yyyzzz
    v665       = M_yyyzzz*z
    v901       = M_yyyzzz*y
    v902       = 0.0699300699300699d0*v901
    v974       = M_yyyzzz*x
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v1089      = M_xxzzzz + M_yyzzzz
    v649       = M_yyzzzz*x
    v667       = M_yyzzzz*y
    v790       = M_yyzzzz*z
    v791       = 0.0815850815850816d0*v790
    v1069      = 0.0163170163170163d0*v790
    M_yzzzzz   = -v1081
    M_zzzzzz   = -v1089
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v932       = 0.034965034965035d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v1051      = 0.034965034965035d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v537       = -0.244755244755245d0*M_xxxyyzz
    v933       = -0.104895104895105d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v673       = -0.244755244755245d0*M_xxyyyzz
    v1042      = -0.104895104895105d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v783       = -0.244755244755245d0*M_xxyyzzz
    v1052      = -0.048951048951049d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v784       = 0.0116550116550117d0*M_xxzzzzz
    v1053      = 0.00233100233100233d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    v1082      = M_xxxzzzz + M_xyyzzzz
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -v1082
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v674       = 0.034965034965035d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v798       = 0.034965034965035d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v1083      = M_xxyzzzz + M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v785       = 0.0116550116550117d0*M_yyzzzzz
    v1054      = 0.00233100233100233d0*M_yyzzzzz
    M_yzzzzzz  = -v1083
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    S_0        = 1
    S_x        = x
    S_y        = y
    S_z        = z
    S_xy       = v0
    v18        = M_y*S_xy
    v22        = M_x*S_xy
    v42        = M_xy*S_xy
    v63        = M_xx*S_xy
    v69        = M_yy*S_xy
    v79        = M_yz*S_xy
    v96        = M_xz*S_xy
    v121       = M_xxy*S_xy
    v147       = M_xxx*S_xy
    v157       = M_xyy*S_xy
    v175       = M_xyz*S_xy
    v212       = M_yyy*S_xy
    v220       = M_xxz*S_xy
    v229       = M_yyz*S_xy
    v275       = M_xxxy*S_xy
    v325       = M_xxyy*S_xy
    v327       = M_xxzz*S_xy
    v337       = M_yyzz*S_xy
    v345       = M_xxxx*S_xy
    v373       = M_yyyy*S_xy
    v401       = M_xxyz*S_xy
    v446       = M_xyyy*S_xy
    v476       = M_xxxz*S_xy
    v489       = M_xyyz*S_xy
    v522       = M_yyyz*S_xy
    v564       = M_xxxxy*S_xy
    v585       = M_xxyyy*S_xy
    v590       = M_xxyzz*S_xy
    v639       = M_yyyyy*S_xy
    v643       = M_yyyzz*S_xy
    v689       = M_xxxxx*S_xy
    v700       = M_xxxyy*S_xy
    v705       = M_xxxzz*S_xy
    v735       = M_xyyyy*S_xy
    v739       = M_xyyzz*S_xy
    v826       = M_xxxyz*S_xy
    v953       = M_xxyyz*S_xy
    v957       = M_xxzzz*S_xy
    v976       = M_yyzzz*S_xy
    v994       = M_xxxxz*S_xy
    v1030      = M_yyyyz*S_xy
    v1064      = M_xyyyz*S_xy
    Ms_xy      = M_xy + M_0*S_xy + M_x*y + M_y*x
    S_xz       = v1
    v19        = M_z*S_xz
    v28        = M_x*S_xz
    v51        = M_xz*S_xz
    v78        = M_yy*S_xz
    v95        = M_xy*S_xz
    v123       = M_xxz*S_xz
    v158       = M_xyz*S_xz
    v184       = M_xxx*S_xz
    v191       = M_xyy*S_xz
    v213       = M_yyz*S_xz
    v218       = 3.0d0*S_xz
    v228       = M_yyy*S_xz
    v277       = M_xxxz*S_xz
    v355       = M_xxyz*S_xz
    v388       = M_xxxx*S_xz
    v399       = M_xxyy*S_xz
    v404       = M_xxzz*S_xz
    v426       = M_yyyy*S_xz
    v430       = M_yyzz*S_xz
    v444       = 0.242424242424242d0*v277
    v447       = M_xyyz*S_xz
    v474       = M_xxxy*S_xz
    v488       = M_xyyy*S_xz
    v515       = M_yyyz*S_xz
    v566       = M_xxxxz*S_xz
    v587       = M_xxyyz*S_xz
    v595       = M_xxzzz*S_xz
    v641       = M_yyyyz*S_xz
    v648       = M_yyzzz*S_xz
    v702       = M_xxxyz*S_xz
    v813       = M_xxxxx*S_xz
    v824       = M_xxxyy*S_xz
    v829       = M_xxxzz*S_xz
    v859       = M_xyyyy*S_xz
    v863       = M_xyyzz*S_xz
    v954       = M_xxyzz*S_xz
    v973       = M_yyyzz*S_xz
    v992       = M_xxxxy*S_xz
    v1003      = M_xxyyy*S_xz
    v1028      = M_yyyyy*S_xz
    v1043      = 0.839160839160839d0*v702
    v1045      = M_xyyyz*S_xz
    v1058      = 0.34965034965035d0*v829
    v1065      = 0.34965034965035d0*v863
    Ms_xz      = M_xz + M_0*S_xz + M_x*z + M_z*x
    S_yz       = v2
    v27        = M_z*S_yz
    v31        = M_y*S_yz
    v55        = M_yz*S_yz
    v74        = M_xy*S_yz
    v93        = M_xx*S_yz
    v106       = 3.0d0*S_yz
    v128       = M_xyz*S_yz
    v154       = M_xxz*S_yz
    v168       = M_yyz*S_yz
    v187       = M_xxy*S_yz
    v197       = M_yyy*S_yz
    v216       = M_xxx*S_yz
    v284       = M_xxyz*S_yz
    v352       = M_xxxz*S_yz
    v363       = M_xyyz*S_yz
    v391       = M_xxxy*S_yz
    v409       = M_xyyy*S_yz
    v450       = M_yyyz*S_yz
    v451       = 0.242424242424242d0*v450
    v455       = M_xxzz*S_yz
    v460       = M_yyzz*S_yz
    v471       = M_xxxx*S_yz
    v479       = M_xxyy*S_yz
    v499       = M_yyyy*S_yz
    v574       = M_xxxyz*S_yz
    v660       = M_xxzzz*S_yz
    v666       = M_yyzzz*S_yz
    v696       = M_xxxxz*S_yz
    v717       = M_xxyyz*S_yz
    v766       = M_yyyyz*S_yz
    v816       = M_xxxxy*S_yz
    v835       = M_xxyyy*S_yz
    v842       = M_xxyzz*S_yz
    v843       = 0.34965034965035d0*v842
    v889       = M_yyyyy*S_yz
    v899       = M_yyyzz*S_yz
    v900       = 0.34965034965035d0*v899
    v936       = M_xyyyz*S_yz
    v937       = 0.839160839160839d0*v936
    v950       = M_xxxzz*S_yz
    v963       = M_xyyzz*S_yz
    v989       = M_xxxxx*S_yz
    v996       = M_xxxyy*S_yz
    v1012      = M_xyyyy*S_yz
    Ms_yz      = M_yz + M_0*S_yz + M_y*z + M_z*y
    S_xyz      = v3
    v60        = 0.857142857142857d0*S_xyz
    v61        = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v60 + v59*z)
    v135       = M_yz*S_xyz
    v159       = M_xz*S_xyz
    v174       = M_xy*S_xyz
    v251       = M_xyz*S_xyz
    v356       = M_xxz*S_xyz
    v375       = M_yyz*S_xyz
    v397       = 5.45454545454545d0*S_xyz
    v398       = M_xxy*v397
    v425       = M_yyy*S_xyz
    v470       = M_xxx*S_xyz
    v528       = M_xyy*v397
    v589       = M_xxyz*S_xyz
    v704       = M_xxxz*S_xyz
    v738       = M_xyyz*S_xyz
    v823       = M_xxxy*S_xyz
    v858       = M_xyyy*S_xyz
    v940       = M_yyyz*S_xyz
    v941       = 0.839160839160839d0*v940
    v952       = M_xxyy*S_xyz
    v956       = M_xxzz*S_xyz
    v975       = M_yyzz*S_xyz
    v988       = M_xxxx*S_xyz
    v1027      = M_yyyy*S_xyz
    v1044      = 0.839160839160839d0*v704
    Ms_xyz     = M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v4         = a2
    a3         = a1*a2
    a4         = a2*a2
    v37        = a4
    a5         = a2*a3
    a6         = a3*a3
    v243       = a6
    a7         = a3*a4
    b2         = b1*b1
    v5         = b2
    v83        = v4*v5
    v441       = v37*v5
    b3         = b1*b2
    b4         = b2*b2
    v104       = b4
    v524       = v104*v4
    b5         = b2*b3
    b6         = b3*b3
    v533       = b6
    b7         = b3*b4
    c2         = c1*c1
    h          = c2 + v4 + v5
    v6         = 0.333333333333333d0*h
    v7         = -v6
    v8         = v4 + v7
    v12        = v5 + v7
    v13        = -0.6d0*h
    v20        = -0.2d0*h
    v21        = v20 + v4
    v36        = v20 + v5
    v38        = h*h
    v39        = 0.0857142857142857d0*v38
    v40        = h*v4
    v57        = -0.428571428571429d0*h
    v58        = v4 + v57
    v82        = 0.142857142857143d0*h
    v92        = -v82
    v103       = v5 + v57
    v105       = h*v5
    v108       = 0.238095238095238d0*v38
    v137       = 0.0476190476190476d0*v38
    v138       = 0.333333333333333d0*(-2.0d0*v40) + v137 + v37
    v205       = -0.111111111111111d0*v40
    v233       = 0.111111111111111d0*(-v105) + v83
    v242       = 0.333333333333333d0*(-2.0d0*v105) + v104 + v137
    v244       = h*h*h
    v245       = -0.0216450216450216d0*v244
    v246       = h*v37
    v247       = v38*v4
    v318       = 0.151515151515152d0*v38
    v319       = 0.0909090909090909d0*(-10.0d0*v40) + v318 + v37
    v439       = 0.545454545454545d0*v40
    v440       = -0.00432900432900433d0*(v244 + 231.0d0*v439*v5)
    v442       = 0.0303030303030303d0*v38
    v511       = -0.272727272727273d0*v40
    v512       = -0.272727272727273d0*v105
    v517       = v442 + v83
    v523       = h*v104
    v525       = v38*v5
    v532       = 0.0909090909090909d0*(-10.0d0*v105) + v104 + v318
    v536       = -0.0815850815850816d0*v244
    v656       = -0.0116550116550117d0*v244
    v657       = v243 + v656 + 0.00699300699300699d0*(-165.0d0*v246 + 45.0d0*v247)
    v927       = -0.0769230769230769d0*v246
    v928       = 0.104895104895105d0*v38
    v929       = 0.769230769230769d0*v40
    v930       = -v5*v929
    v1085      = v656 + v930
    v1039      = -0.461538461538462d0*v40*v5
    v1040      = v1039 + 0.00699300699300699d0*(-v244)
    v1041      = 0.020979020979021d0*v525
    v1086      = v1041 + v441
    v1049      = v1039 + 0.00233100233100233d0*(-v244)
    v1075      = 0.020979020979021d0*v247
    v1088      = v1075 + v524
    v1076      = -0.0769230769230769d0*v523
    v1077      = 0.00699300699300699d0*(-165.0d0*v523 + 45.0d0*v525) + v533 + v656
    S_xx       = v8
    v14        = M_x*S_xx
    v34        = M_z*S_xx
    v43        = M_yy*S_xx
    v46        = M_xx*S_xx
    v65        = M_xy*S_xx
    v100       = M_yz*S_xx
    v116       = M_xxx*S_xx
    v126       = M_xyy*S_xx
    v150       = M_xxy*S_xx
    v165       = M_yyy*S_xx
    v189       = M_xxz*S_xx
    v199       = M_yyz*S_xx
    v270       = M_xxxx*S_xx
    v281       = M_xxyy*S_xx
    v287       = M_xxzz*S_xx
    v307       = M_yyyy*S_xx
    v313       = M_yyzz*S_xx
    v348       = M_xxxy*S_xx
    v360       = M_xyyy*S_xx
    v394       = M_xxxz*S_xx
    v411       = M_xyyz*S_xx
    v482       = M_xxyz*S_xx
    v502       = M_yyyz*S_xx
    v559       = M_xxxxx*S_xx
    v570       = M_xxxyy*S_xx
    v578       = M_xxxzz*S_xx
    v609       = M_xyyyy*S_xx
    v616       = M_xyyzz*S_xx
    v692       = M_xxxxy*S_xx
    v713       = M_xxyyy*S_xx
    v720       = M_xxyzz*S_xx
    v762       = M_yyyyy*S_xx
    v771       = M_yyyzz*S_xx
    v820       = M_xxxxz*S_xx
    v838       = M_xxyyz*S_xx
    v853       = M_xxzzz*S_xx
    v892       = M_yyyyz*S_xx
    v910       = M_yyzzz*S_xx
    v961       = M_xyyyz*S_xx
    v998       = M_xxxyz*S_xx
    Ms_xx      = 0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11
    S_yy       = v12
    v24        = M_y*S_yy
    v35        = M_z*S_yy
    v41        = M_xx*S_yy
    v44        = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v42 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v41 + 4.0d0*v43))
    v54        = M_yy*S_yy
    v66        = M_xy*S_yy
    v77        = M_xz*S_yy
    v117       = M_xxx*S_yy
    v127       = M_xyy*S_yy
    v151       = M_xxy*S_yy
    v166       = M_yyy*S_yy
    v190       = M_xxz*S_yy
    v200       = M_yyz*S_yy
    v271       = M_xxxx*S_yy
    v282       = M_xxyy*S_yy
    v288       = M_xxzz*S_yy
    v308       = M_yyyy*S_yy
    v314       = M_yyzz*S_yy
    v349       = M_xxxy*S_yy
    v361       = M_xyyy*S_yy
    v395       = M_xxxz*S_yy
    v412       = M_xyyz*S_yy
    v483       = M_xxyz*S_yy
    v503       = M_yyyz*S_yy
    v560       = M_xxxxx*S_yy
    v571       = M_xxxyy*S_yy
    v579       = M_xxxzz*S_yy
    v610       = M_xyyyy*S_yy
    v617       = M_xyyzz*S_yy
    v693       = M_xxxxy*S_yy
    v714       = M_xxyyy*S_yy
    v721       = M_xxyzz*S_yy
    v763       = M_yyyyy*S_yy
    v772       = M_yyyzz*S_yy
    v821       = M_xxxxz*S_yy
    v839       = M_xxyyz*S_yy
    v854       = M_xxzzz*S_yy
    v893       = M_yyyyz*S_yy
    v894       = -0.20979020979021d0*v893
    v911       = M_yyzzz*S_yy
    v948       = M_xxxyz*S_yy
    v1015      = M_xyyyz*S_yy
    Ms_yy      = 0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11
    S_zz       = -(S_xx + S_yy)
    S_xxx      = x*(v13 + v4)
    v45        = M_x*S_xxx
    v80        = M_z*S_xxx
    v114       = M_xx*S_xxx
    v131       = M_yy*S_xxx
    v155       = M_xy*S_xxx
    v192       = M_xz*S_xxx
    v230       = M_yz*S_xxx
    v268       = M_xxx*S_xxx
    v290       = M_xyy*S_xxx
    v335       = M_yyy*S_xxx
    v353       = M_xxy*S_xxx
    v402       = 10.0d0*S_xxx
    v428       = M_yyz*S_xxx
    v490       = M_xyz*S_xxx
    v557       = M_xxxx*S_xxx
    v583       = M_xxyy*S_xxx
    v593       = M_xxzz*S_xxx
    v637       = M_yyyy*S_xxx
    v646       = M_yyzz*S_xxx
    v698       = M_xxxy*S_xxx
    v733       = M_xyyy*S_xxx
    v827       = M_xxxz*S_xxx
    v861       = M_xyyz*S_xxx
    v1031      = M_yyyz*S_xxx
    Ms_xxx     = M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19))
    S_xxy      = v21*y
    v53        = S_xxy*v52
    v62        = M_x*S_xxy
    v101       = M_z*S_xxy
    v125       = M_xy*S_xxy
    v145       = M_xx*S_xxy
    v163       = M_yy*S_xxy
    v201       = M_yz*S_xxy
    v279       = M_xxy*S_xxy
    v305       = M_yyy*S_xxy
    v331       = M_xyy*S_xxy
    v344       = M_xxx*S_xxy
    v415       = S_xxy*v414
    v484       = M_xxz*S_xxy
    v504       = M_yyz*S_xxy
    v568       = M_xxxy*S_xxy
    v607       = M_xyyy*S_xxy
    v687       = M_xxxx*S_xxy
    v711       = M_xxyy*S_xxy
    v724       = M_xxzz*S_xxy
    v760       = M_yyyy*S_xxy
    v775       = M_yyzz*S_xxy
    v840       = M_xxyz*S_xxy
    v897       = M_yyyz*S_xxy
    v999       = M_xxxz*S_xxy
    v1016      = M_xyyz*S_xxy
    Ms_xxy     = M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v22 + 4.0d0* &
      v23 - v24 - v25 - v26 - v27))
    S_xxz      = v21*z
    v56        = M_z*S_xxz
    v70        = M_x*S_xxz
    v129       = M_xz*S_xxz
    v169       = M_yz*S_xxz
    v182       = M_xx*S_xxz
    v195       = M_yy*S_xxz
    v221       = M_xy*S_xxz
    v252       = M_yyz*S_xxz
    v286       = M_xxz*S_xxz
    v364       = M_xyz*S_xxz
    v407       = M_xyy*S_xxz
    v477       = M_xxy*S_xxz
    v498       = M_yyy*S_xxz
    v576       = M_xxxz*S_xxz
    v614       = M_xyyz*S_xxz
    v718       = M_xxyz*S_xxz
    v769       = M_yyyz*S_xxz
    v811       = M_xxxx*S_xxz
    v833       = M_xxyy*S_xxz
    v851       = M_xxzz*S_xxz
    v887       = M_yyyy*S_xxz
    v908       = M_yyzz*S_xxz
    v1011      = M_xyyy*S_xxz
    Ms_xxz     = M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v28 + v30) + 7.0d0*(v29 + v34) + 2.0d0 &
      *(-v31 + v32 - v33 + v35))
    S_xyy      = v36*x
    v68        = M_y*S_xyy
    v81        = M_z*S_xyy
    v85        = S_xyy*v84
    v115       = M_xx*S_xyy
    v132       = M_yy*S_xyy
    v156       = M_xy*S_xyy
    v193       = M_xz*S_xyy
    v269       = M_xxx*S_xyy
    v291       = M_xyy*S_xyy
    v324       = M_xxy*S_xyy
    v372       = M_yyy*S_xyy
    v403       = M_xxz*S_xyy
    v429       = M_yyz*S_xyy
    v531       = S_xyy*v414
    v558       = M_xxxx*S_xyy
    v584       = M_xxyy*S_xyy
    v594       = M_xxzz*S_xyy
    v638       = M_yyyy*S_xyy
    v647       = M_yyzz*S_xyy
    v699       = M_xxxy*S_xyy
    v734       = M_xyyy*S_xyy
    v828       = M_xxxz*S_xyy
    v862       = M_xyyz*S_xyy
    v1005      = M_xxyz*S_xyy
    v1032      = M_yyyz*S_xyy
    Ms_xyy     = M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19))
    S_xzz      = -(S_xxx + S_xyy)
    S_yyy      = y*(v13 + v5)
    v88        = M_y*S_yyy
    v102       = M_z*S_yyy
    v146       = M_xx*S_yyy
    v164       = M_yy*S_yyy
    v202       = M_yz*S_yyy
    v207       = M_xy*S_yyy
    v226       = M_xz*S_yyy
    v280       = M_xxy*S_yyy
    v306       = M_yyy*S_yyy
    v322       = M_xxx*S_yyy
    v359       = M_xyy*S_yyy
    v416       = M_xyz*S_yyy
    v485       = M_xxz*S_yyy
    v535       = 10.0d0*S_yyy
    v569       = M_xxxy*S_yyy
    v608       = M_xyyy*S_yyy
    v688       = M_xxxx*S_yyy
    v712       = M_xxyy*S_yyy
    v725       = M_xxzz*S_yyy
    v761       = M_yyyy*S_yyy
    v776       = M_yyzz*S_yyy
    v841       = M_xxyz*S_yyy
    v898       = M_yyyz*S_yyy
    v1000      = M_xxxz*S_yyy
    Ms_yyy     = M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v22 - 2.0d0*v23 + 3.0d0*v24 + &
      3.0d0*v25 - 2.0d0*v26 - 2.0d0*v27))
    S_yyz      = v36*z
    v91        = M_z*S_yyz
    v97        = M_y*S_yyz
    v170       = M_yz*S_yyz
    v183       = M_xx*S_yyz
    v196       = M_yy*S_yyz
    v210       = M_xz*S_yyz
    v222       = M_xy*S_yyz
    v249       = M_xxz*S_yyz
    v312       = M_yyz*S_yyz
    v365       = M_xyz*S_yyz
    v387       = M_xxx*S_yyz
    v408       = M_xyy*S_yyz
    v478       = M_xxy*S_yyz
    v534       = 10.0d0*S_yyz
    v577       = M_xxxz*S_yyz
    v615       = M_xyyz*S_yyz
    v719       = M_xxyz*S_yyz
    v770       = M_yyyz*S_yyz
    v812       = M_xxxx*S_yyz
    v834       = M_xxyy*S_yyz
    v852       = M_xxzz*S_yyz
    v888       = M_yyyy*S_yyz
    v909       = M_yyzz*S_yyz
    v995       = M_xxxy*S_yyz
    Ms_yyz     = M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v31 + v33) + 7.0d0*(v32 + v35) + 2.0d0 &
      *(-v28 + v29 - v30 + v34))
    S_yzz      = -(S_xxy + S_yyy)
    S_zzz      = -(S_xxz + S_yyz)
    S_xxxx     = 0.142857142857143d0*(-6.0d0*v40) + v37 + v39
    v109       = M_x*S_xxxx
    v160       = M_y*S_xxxx
    v203       = M_z*S_xxxx
    v263       = M_xx*S_xxxx
    v300       = M_yy*S_xxxx
    v357       = M_xy*S_xxxx
    v417       = M_xz*S_xxxx
    v505       = M_yz*S_xxxx
    v552       = M_xxx*S_xxxx
    v602       = M_xyy*S_xxxx
    v706       = M_xxy*S_xxxx
    v755       = M_yyy*S_xxxx
    v846       = M_xxz*S_xxxx
    v903       = M_yyz*S_xxxx
    v1017      = M_xyz*S_xxxx
    Ms_xxxx    = M_0*S_xxxx + v44 - v49 - v53 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v46 - 96.0d0*v51 + 80.0d0*(v45 + v47) - &
      60.0d0*(v50 + v56) + 24.0d0*(v54 + v55))
    S_xxxy     = v0*v58
    v130       = M_y*S_xxxy
    v144       = M_x*S_xxxy
    v231       = M_z*S_xxxy
    v289       = M_xy*S_xxxy
    v342       = M_xx*S_xxxy
    v370       = M_yy*S_xxxy
    v432       = M_yz*S_xxxy
    v491       = M_xz*S_xxxy
    v581       = M_xxy*S_xxxy
    v635       = M_yyy*S_xxxy
    v685       = M_xxx*S_xxxy
    v731       = M_xyy*S_xxxy
    v865       = M_xyz*S_xxxy
    v1033      = M_yyz*S_xxxy
    Ms_xxxy    = M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v61 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 - 2.0d0*v66 &
      - 2.0d0*v67 - 2.0d0*v68 - 2.0d0*v69))
    S_xxxz     = v1*v58
    v136       = M_z*S_xxxz
    v181       = M_x*S_xxxz
    v294       = M_xz*S_xxxz
    v376       = M_yz*S_xxxz
    v384       = M_xx*S_xxxz
    v423       = M_yy*S_xxxz
    v448       = 0.242424242424242d0*v294
    v486       = M_xy*S_xxxz
    v591       = M_xxz*S_xxxz
    v644       = M_yyz*S_xxxz
    v740       = M_xyz*S_xxxz
    v809       = M_xxx*S_xxxz
    v856       = M_xyy*S_xxxz
    v1001      = M_xxy*S_xxxz
    v1026      = M_yyy*S_xxxz
    v1046      = 0.839160839160839d0*v740
    Ms_xxxz    = 0.142857142857143d0*(15.0d0*(v70 + v73) + 13.0d0*(v72 + v80) + 6.0d0*( &
      -v74 + v75 + v77 + v78 - v79 + v81)) + M_0*S_xxxz + M_xxxz - M_y* &
      v60 + S_xx*v76 + S_xz*v71 - v59*y
    S_xxyy     = 0.0285714285714286d0*v38 - v4*v82 - v5*v82 + v83
    v110       = M_x*S_xxyy
    v161       = M_y*S_xxyy
    v177       = M_z*S_xxyy
    v264       = M_xx*S_xxyy
    v301       = M_yy*S_xxyy
    v328       = M_xy*S_xxyy
    v418       = M_xz*S_xxyy
    v506       = M_yz*S_xxyy
    v553       = M_xxx*S_xxyy
    v603       = M_xyy*S_xxyy
    v707       = M_xxy*S_xxyy
    v756       = M_yyy*S_xxyy
    v847       = M_xxz*S_xxyy
    v904       = M_yyz*S_xxyy
    v965       = M_xyz*S_xxyy
    Ms_xxyy    = 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v42 + 39.0d0*(v41 + v43) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v45 + 12.0d0*v46 + &
      10.0d0*v47 + 10.0d0*v50 + 12.0d0*v51 + 12.0d0*v54 + 12.0d0*v55 + &
      10.0d0*v56 + 10.0d0*v88 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91)) &
      + M_0*S_xxyy + v49 + v53 + v85 + v87
    S_xxyz     = v2*(v4 + v92)
    v171       = M_z*S_xxyz
    v194       = M_y*S_xxyz
    v215       = M_x*S_xxyz
    v315       = M_yz*S_xxyz
    v366       = M_xz*S_xxyz
    v406       = M_xy*S_xxyz
    v468       = M_xx*S_xxyz
    v496       = M_yy*S_xxyz
    v619       = M_xyz*S_xxyz
    v722       = M_xxz*S_xxyz
    v773       = M_yyz*S_xxyz
    v831       = M_xxy*S_xxyz
    v885       = M_yyy*S_xxyz
    v1009      = M_xyy*S_xxyz
    Ms_xxyz    = 0.142857142857143d0*(12.0d0*(v95 + v96) + 9.0d0*(v100 + v101 + v93 + v94 &
      ) + 2.0d0*(v102 - v97 + v98 - v99)) + M_0*S_xxyz + M_xxyz + M_xxz &
      *y + M_xyz*v86 + M_y*S_xxz + S_xyz*v84
    S_xxzz     = -(S_xxxx + S_xxyy)
    v111       = M_x*S_xxzz
    v140       = M_y*S_xxzz
    v178       = M_z*S_xxzz
    v265       = M_xx*S_xxzz
    v302       = M_yy*S_xxzz
    v329       = M_xy*S_xxzz
    v419       = M_xz*S_xxzz
    v462       = M_yz*S_xxzz
    v554       = M_xxx*S_xxzz
    v604       = M_xyy*S_xxzz
    v708       = M_xxy*S_xxzz
    v757       = M_yyy*S_xxzz
    v848       = M_xxz*S_xxzz
    v905       = M_yyz*S_xxzz
    v966       = M_xyz*S_xxzz
    S_xyyy     = v0*v103
    v211       = M_y*S_xyyy
    v232       = M_z*S_xyyy
    v234       = M_x*S_xyyy
    v343       = M_xx*S_xyyy
    v371       = M_yy*S_xyyy
    v433       = M_yz*S_xyyy
    v445       = M_xy*S_xyyy
    v492       = M_xz*S_xyyy
    v582       = M_xxy*S_xyyy
    v636       = M_yyy*S_xyyy
    v686       = M_xxx*S_xyyy
    v732       = M_xyy*S_xyyy
    v866       = M_xyz*S_xyyy
    v1006      = M_xxz*S_xyyy
    Ms_xyyy    = M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v61 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 + 5.0d0*v66 &
      + 5.0d0*v67 + 5.0d0*v68 + 5.0d0*v69))
    S_xyyz     = v1*(v5 + v92)
    v214       = M_z*S_xyyz
    v227       = M_y*S_xyyz
    v238       = M_x*S_xyyz
    v377       = M_yz*S_xyyz
    v385       = M_xx*S_xyyz
    v424       = M_yy*S_xyyz
    v449       = M_xz*S_xyyz
    v487       = M_xy*S_xyyz
    v592       = M_xxz*S_xyyz
    v645       = M_yyz*S_xyyz
    v741       = M_xyz*S_xyyz
    v810       = M_xxx*S_xyyz
    v857       = M_xyy*S_xyyz
    v1002      = M_xxy*S_xyyz
    Ms_xyyz    = 0.142857142857143d0*(12.0d0*(v74 + v79) + 2.0d0*(-v70 + v72 - v73 + v80 &
      ) + 9.0d0*(v75 + v77 + v78 + v81)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v48 + M_yyz*x + S_xyz*v52
    S_xyzz     = -(S_xxxy + S_xyyy)
    S_xzzz     = -(S_xxxz + S_xyyz)
    S_yyyy     = 0.142857142857143d0*(-6.0d0*v105) + v104 + v39
    v112       = M_x*S_yyyy
    v162       = M_y*S_yyyy
    v204       = M_z*S_yyyy
    v266       = M_xx*S_yyyy
    v303       = M_yy*S_yyyy
    v358       = M_xy*S_yyyy
    v420       = M_xz*S_yyyy
    v507       = M_yz*S_yyyy
    v555       = M_xxx*S_yyyy
    v605       = M_xyy*S_yyyy
    v709       = M_xxy*S_yyyy
    v758       = M_yyy*S_yyyy
    v849       = M_xxz*S_yyyy
    v906       = M_yyz*S_yyyy
    v1018      = M_xyz*S_yyyy
    Ms_yyyy    = M_0*S_yyyy + v44 - v85 - v87 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v54 - 96.0d0*v55 + 24.0d0*(v46 + v51) + &
      80.0d0*(v88 + v89) - 60.0d0*(v90 + v91))
    S_yyyz     = v103*v2
    v237       = M_z*S_yyyz
    v240       = M_y*S_yyyz
    v452       = M_yz*S_yyyz
    v453       = 0.242424242424242d0*v452
    v469       = M_xx*S_yyyz
    v497       = M_yy*S_yyyz
    v514       = M_xz*S_yyyz
    v519       = M_xy*S_yyyz
    v723       = M_xxz*S_yyyz
    v774       = M_yyz*S_yyyz
    v832       = M_xxy*S_yyyz
    v886       = M_yyy*S_yyyz
    v938       = M_xyz*S_yyyz
    v939       = 0.839160839160839d0*v938
    v987       = M_xxx*S_yyyz
    v1010      = M_xyy*S_yyyz
    Ms_yyyz    = 0.142857142857143d0*(13.0d0*(v102 + v98) + 15.0d0*(v97 + v99) + 6.0d0*( &
      v100 + v101 + v93 + v94 - v95 - v96)) + M_0*S_yyyz - M_x*v60 + &
      M_yy*v106 + M_yyyz + S_yy*v107 - v59*x
    S_yyzz     = -(S_xxyy + S_yyyy)
    v113       = M_x*S_yyzz
    v141       = M_y*S_yyzz
    v143       = -0.0476190476190476d0*(M_yyyyy + v1079 + v139 + v140 + v141 + v142)
    v179       = M_z*S_yyzz
    v180       = 0.0476190476190476d0*(18.0d0*(v172 + v177) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v173 + 48.0d0*v174 + 48.0d0*v175 + 5.0d0*v176 + &
      5.0d0*v178 + 5.0d0*v179))
    v206       = -0.0476190476190476d0*(M_xxxxx + v1078 + v111 + v113 + v124 + v134)
    v267       = M_xx*S_yyzz
    v304       = M_yy*S_yyzz
    v330       = M_xy*S_yyzz
    v421       = M_xz*S_yyzz
    v463       = M_yz*S_yyzz
    v556       = M_xxx*S_yyzz
    v606       = M_xyy*S_yyzz
    v710       = M_xxy*S_yyzz
    v759       = M_yyy*S_yyzz
    v850       = M_xxz*S_yyzz
    v907       = M_yyz*S_yyzz
    v967       = M_xyz*S_yyzz
    S_yzzz     = -(S_xxyz + S_yyyz)
    S_zzzz     = -(S_xxzz + S_yyzz)
    S_xxxxx    = x*(0.111111111111111d0*(-10.0d0*v40) + v108 + v37)
    v258       = M_x*S_xxxxx
    v367       = M_y*S_xxxxx
    v434       = M_z*S_xxxxx
    v547       = M_xx*S_xxxxx
    v630       = M_yy*S_xxxxx
    v726       = M_xy*S_xxxxx
    v867       = M_xz*S_xxxxx
    v1034      = M_yz*S_xxxxx
    Ms_xxxxx   = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v109 + v118) + 330.0d0*(v114 + v116) - 30.0d0*(M_xxxyy + v110 + &
      v122) + 60.0d0*(v115 + v117 + v126 + v131) - 140.0d0*(v119 + v120 &
      + v130 + v136) - 300.0d0*(v121 + v123 + v125 + v129) + 120.0d0*( &
      v127 + v128 + v132 + v135) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v111 + v112 + v113 + v124 + v133 + v134))
    S_xxxxy    = v138*y
    v295       = M_y*S_xxxxy
    v339       = M_x*S_xxxxy
    v508       = M_z*S_xxxxy
    v597       = M_xy*S_xxxxy
    v680       = M_xx*S_xxxxy
    v750       = M_yy*S_xxxxy
    v912       = M_yz*S_xxxxy
    v1019      = M_xz*S_xxxxy
    Ms_xxxxy   = M_0*S_xxxxy + v143 + 0.0476190476190476d0*(78.0d0*(v145 + v150) + 4.0d0* &
      (v146 + v165) + 20.0d0*(M_xxxxy + v148 + v160) + 56.0d0*(v144 + &
      v147 + v149 + v155) + 8.0d0*(v164 + v166 + v168 + v170) - (2.0d0* &
      M_xxyyy + 24.0d0*v151 + 30.0d0*v152 + 28.0d0*v153 + 28.0d0*v154 + &
      48.0d0*v156 + 48.0d0*v157 + 48.0d0*v158 + 48.0d0*v159 + 30.0d0* &
      v161 + v162 + 24.0d0*v163 + v167 + 28.0d0*v169 + 28.0d0*v171))
    S_xxxxz    = v138*z
    v316       = M_z*S_xxxxz
    v379       = M_x*S_xxxxz
    v493       = M_y*S_xxxxz
    v620       = M_xz*S_xxxxz
    v777       = M_yz*S_xxxxz
    v804       = M_xx*S_xxxxz
    v879       = M_yy*S_xxxxz
    v1007      = M_xy*S_xxxxz
    v1050      = -0.20979020979021d0*(v804 + v820)
    Ms_xxxxz   = M_0*S_xxxxz + v180 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v181 &
      + v186) + 106.0d0*(v182 + v189) + 4.0d0*(v183 + v199) + 104.0d0*( &
      v184 + v192) + 44.0d0*(v185 + v203) + 32.0d0*(v190 + v195) + &
      48.0d0*(v191 + v193) + 8.0d0*(v196 + v200) - (M_yyyyz + 36.0d0* &
      v187 + 28.0d0*v188 + 28.0d0*v194 + 8.0d0*v197 + 5.0d0*v198 + &
      36.0d0*v201 + 8.0d0*v202 + 5.0d0*v204))
    S_xxxyy    = x*(-v5*v6 + v137 + v205 + v83)
    v259       = M_x*S_xxxyy
    v368       = M_y*S_xxxyy
    v435       = M_z*S_xxxyy
    v548       = M_xx*S_xxxyy
    v631       = M_yy*S_xxxyy
    v727       = M_xy*S_xxxyy
    v868       = M_xz*S_xxxyy
    v1035      = M_yz*S_xxxyy
    Ms_xxxyy   = M_0*S_xxxyy + v206 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v109 &
      + v118) + 141.0d0*(v110 + v122) + 159.0d0*(v115 + v126) + 75.0d0* &
      (v117 + v131) + 112.0d0*(v119 + v130) - 14.0d0*(v120 + v136) + &
      276.0d0*(v121 + v125) - 3.0d0*(M_xyyyy + v112 + v133) - 18.0d0*( &
      v114 + v116 + v123 + v129) - 60.0d0*(v127 + v128 + v132 + v135) - &
      42.0d0*(v207 + v208 + v209 + v210 + v211 + v212 + v213 + v214))
    S_xxxyz    = v3*v8
    v378       = 1.81818181818182d0*S_xxxyz
    v422       = M_y*v378
    v467       = M_x*S_xxxyz
    v650       = M_yz*S_xxxyz
    v742       = M_xz*S_xxxyz
    v855       = M_xy*S_xxxyz
    v972       = M_yy*S_xxxyz
    v986       = M_xx*S_xxxyz
    v1047      = 0.839160839160839d0*v742
    Ms_xxxyz   = 0.333333333333333d0*(7.0d0*(v215 + v219 + v220 + v221) + 5.0d0*(v216 + &
      v217 + v230 + v231) + 2.0d0*(-v222 + v223 - v224 + v226 - v227 + &
      v228 - v229 + v232)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy* &
      v218 + M_y*S_xxxz + S_xx*v225 + S_xxy*v76 + S_xyz*v71
    S_xxxzz    = -(S_xxxxx + S_xxxyy)
    v260       = M_x*S_xxxzz
    v333       = M_y*S_xxxzz
    v436       = M_z*S_xxxzz
    v549       = M_xx*S_xxxzz
    v632       = M_yy*S_xxxzz
    v728       = M_xy*S_xxxzz
    v869       = M_xz*S_xxxzz
    v977       = M_yz*S_xxxzz
    v1067      = 0.34965034965035d0*v869
    S_xxyyy    = y*(-v4*v6 + v137 + v233)
    v296       = M_y*S_xxyyy
    v340       = M_x*S_xxyyy
    v509       = M_z*S_xxyyy
    v598       = M_xy*S_xxyyy
    v681       = M_xx*S_xxyyy
    v751       = M_yy*S_xxyyy
    v913       = M_yz*S_xxyyy
    v1020      = M_xz*S_xxyyy
    Ms_xxyyy   = M_0*S_xxyyy + v143 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v146 &
      + v165) + 159.0d0*(v151 + v163) + 141.0d0*(v152 + v161) + 276.0d0 &
      *(v156 + v157) - 17.0d0*(v162 + v167) + 112.0d0*(v234 + v235) - &
      14.0d0*(v236 + v237) - 3.0d0*(M_xxxxy + v148 + v160) - 60.0d0*( &
      v145 + v150 + v158 + v159) - 18.0d0*(v164 + v166 + v168 + v170) - &
      42.0d0*(v144 + v147 + v149 + v153 + v154 + v155 + v169 + v171))
    S_xxyyz    = z*(0.0158730158730159d0*v38 + v205 + v233)
    v254       = M_z*S_xxyyz
    v380       = M_x*S_xxyyz
    v494       = M_y*S_xxyyz
    v621       = M_xz*S_xxyyz
    v778       = M_yz*S_xxyyz
    v805       = M_xx*S_xxyyz
    v880       = M_yy*S_xxyyz
    v958       = M_xy*S_xxyyz
    Ms_xxyyz   = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v174 + v175) + 6.0d0*(v184 + v192 + v197 + v202) + 9.0d0*(v185 + &
      v198 + v203 + v204) + 132.0d0*(v187 + v191 + v193 + v201) + &
      112.0d0*(v188 + v194 + v238 + v239) + 81.0d0*(v172 + v177 + v183 &
      + v190 + v195 + v199) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v173 + 5.0d0*v176 + 5.0d0*v178 + 5.0d0*v179 + 14.0d0*v181 + &
      6.0d0*v182 + 14.0d0*v186 + 6.0d0*v189 + 6.0d0*v196 + 6.0d0*v200 + &
      14.0d0*v240 + 14.0d0*v241))
    S_xxyzz    = -(S_xxxxy + S_xxyyy)
    v297       = M_y*S_xxyzz
    v320       = M_x*S_xxyzz
    v464       = M_z*S_xxyzz
    v599       = M_xy*S_xxyzz
    v682       = M_xx*S_xxyzz
    v752       = M_yy*S_xxyzz
    v914       = M_yz*S_xxyzz
    v915       = 0.34965034965035d0*v914
    v968       = M_xz*S_xxyzz
    S_xxzzz    = -(S_xxxxz + S_xxyyz)
    v255       = M_z*S_xxzzz
    v381       = M_x*S_xxzzz
    v457       = M_y*S_xxzzz
    v622       = M_xz*S_xxzzz
    v668       = M_yz*S_xxzzz
    v806       = M_xx*S_xxzzz
    v881       = M_yy*S_xxzzz
    v959       = M_xy*S_xxzzz
    S_xyyyy    = v242*x
    v261       = M_x*S_xyyyy
    v369       = M_y*S_xyyyy
    v437       = M_z*S_xyyyy
    v550       = M_xx*S_xyyyy
    v633       = M_yy*S_xyyyy
    v729       = M_xy*S_xyyyy
    v870       = M_xz*S_xyyyy
    v1036      = M_yz*S_xyyyy
    Ms_xyyyy   = M_0*S_xyyyy + v206 + 0.0476190476190476d0*(4.0d0*(v117 + v131) + 78.0d0* &
      (v127 + v132) + 20.0d0*(M_xyyyy + v112 + v133) + 8.0d0*(v114 + &
      v116 + v123 + v129) + 56.0d0*(v207 + v208 + v211 + v212) - (2.0d0 &
      *M_xxxyy + v109 + 30.0d0*v110 + 24.0d0*v115 + v118 + 48.0d0*v121 &
      + 30.0d0*v122 + 48.0d0*v125 + 24.0d0*v126 + 48.0d0*v128 + 48.0d0* &
      v135 + 28.0d0*v209 + 28.0d0*v210 + 28.0d0*v213 + 28.0d0*v214))
    S_xyyyz    = v12*v3
    v521       = M_y*S_xyyyz
    v526       = 1.81818181818182d0*S_xyyyz
    v527       = M_x*v526
    v942       = M_yz*S_xyyyz
    v943       = 0.839160839160839d0*v942
    v946       = M_xx*S_xyyyz
    v1025      = M_yy*S_xyyyz
    v1048      = M_xz*S_xyyyz
    v1063      = M_xy*S_xyyyz
    Ms_xyyyz   = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v222 + v224 + v227 + v229 &
      ) + 5.0d0*(v223 + v226 + v228 + v232) + 2.0d0*(-v215 + v216 + &
      v217 - v219 - v220 - v221 + v230 + v231)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v106 + M_xyyyz + M_yyyz*x + S_xyy*v107 + S_yy*v225
    S_xyyzz    = -(S_xxxyy + S_xyyyy)
    v262       = M_x*S_xyyzz
    v334       = M_y*S_xyyzz
    v438       = M_z*S_xyyzz
    v551       = M_xx*S_xyyzz
    v634       = M_yy*S_xyyzz
    v730       = M_xy*S_xyyzz
    v871       = M_xz*S_xyyzz
    v978       = M_yz*S_xyyzz
    v1068      = 0.34965034965035d0*v871
    S_xyzzz    = -(S_xxxyz + S_xyyyz)
    S_xzzzz    = -(S_xxxzz + S_xyyzz)
    S_yyyyy    = y*(0.111111111111111d0*(-10.0d0*v105) + v104 + v108)
    v298       = M_y*S_yyyyy
    v341       = M_x*S_yyyyy
    v510       = M_z*S_yyyyy
    v600       = M_xy*S_yyyyy
    v683       = M_xx*S_yyyyy
    v753       = M_yy*S_yyyyy
    v916       = M_yz*S_yyyyy
    v1021      = M_xz*S_yyyyy
    Ms_yyyyy   = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v162 + v167) + 330.0d0*(v164 + v166) - 30.0d0*(M_xxyyy + v152 + &
      v161) + 120.0d0*(v145 + v150 + v158 + v159) + 60.0d0*(v146 + v151 &
      + v163 + v165) - 300.0d0*(v156 + v157 + v168 + v170) - 140.0d0*( &
      v234 + v235 + v236 + v237) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v139 + v140 + v141 + v142 + v148 + v160))
    S_yyyyz    = v242*z
    v317       = M_z*S_yyyyz
    v382       = M_x*S_yyyyz
    v495       = M_y*S_yyyyz
    v623       = M_xz*S_yyyyz
    v779       = M_yz*S_yyyyz
    v807       = M_xx*S_yyyyz
    v882       = M_yy*S_yyyyz
    v883       = -0.20979020979021d0*v882
    v1090      = v883 + v894
    v1008      = M_xy*S_yyyyz
    Ms_yyyyz   = M_0*S_yyyyz + v180 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v182 &
      + v189) + 32.0d0*(v183 + v199) + 48.0d0*(v187 + v201) + 4.0d0*( &
      v190 + v195) + 106.0d0*(v196 + v200) + 104.0d0*(v197 + v202) + &
      44.0d0*(v198 + v204) + 56.0d0*(v240 + v241) - (M_xxxxz + 8.0d0* &
      v184 + 5.0d0*v185 + 36.0d0*v191 + 8.0d0*v192 + 36.0d0*v193 + &
      5.0d0*v203 + 28.0d0*v238 + 28.0d0*v239))
    S_yyyzz    = -(S_xxyyy + S_yyyyy)
    v299       = M_y*S_yyyzz
    v321       = M_x*S_yyyzz
    v338       = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz - &
      v320 - v321 + 4.0d0*v322 - v323 - 24.0d0*v324 - 30.0d0*v325 - &
      v326 - v327 - 30.0d0*v328 - v329 - v330 - 24.0d0*v331 - v332 - &
      v333 - v334 + 4.0d0*v335 - v336 - v337))
    v465       = M_z*S_yyyzz
    v601       = M_xy*S_yyyzz
    v684       = M_xx*S_yyyzz
    v754       = M_yy*S_yyyzz
    v917       = M_yz*S_yyyzz
    v918       = 0.34965034965035d0*v917
    v969       = M_xz*S_yyyzz
    S_yyzzz    = -(S_xxyyz + S_yyyyz)
    v256       = M_z*S_yyzzz
    v1084      = v1089 - 15.0d0*M_xxyyzz + 3.0d0*(2.0d0*v250 + 2.0d0*v253 + 2.0d0*v255 + &
      2.0d0*v256)
    v257       = 0.00432900432900433d0*(1440.0d0*v251 + 5.0d0*(v1084 + 12.0d0*v248 - &
      8.0d0*v249 - 8.0d0*v252 + 12.0d0*v254))
    v383       = M_x*S_yyzzz
    v443       = 0.00432900432900433d0*(v1084 - 720.0d0*v251 - 240.0d0*(v248 + v254) - &
      260.0d0*(v249 + v252))
    v458       = M_y*S_yyzzz
    v466       = -0.0303030303030303d0*(M_yyyyyz + v1081 + v456 + v457 + v458 + v461 + &
      5.0d0*(v454 + v455 + v459 + v460 + v462 + v463 + v464 + v465))
    v518       = -0.0303030303030303d0*(M_xxxxxz + v1080 + v381 + v383 + v405 + v431 + &
      5.0d0*(v396 + v404 + v413 + v419 + v421 + v430 + v436 + v438))
    v624       = M_xz*S_yyzzz
    v669       = M_yz*S_yyzzz
    v808       = M_xx*S_yyzzz
    v884       = M_yy*S_yyzzz
    v960       = M_xy*S_yyzzz
    S_yzzzz    = -(S_xxyzz + S_yyyzz)
    S_zzzzz    = -(S_xxzzz + S_yyzzz)
    S_xxxxxx   = v243 + v245 + 0.0909090909090909d0*(-15.0d0*v246 + 5.0d0*v247)
    v538       = M_x*S_xxxxxx
    v743       = M_y*S_xxxxxx
    v919       = M_z*S_xxxxxx
    Ms_xxxxxx  = M_0*S_xxxxxx + v257 + 0.00432900432900433d0*(136.0d0*M_xxxxxx - 75.0d0* &
      M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + 2360.0d0*v268 - &
      2340.0d0*v279 - 2260.0d0*v286 + 1440.0d0*v291 + 576.0d0*(v258 + &
      v272) + 1620.0d0*(v263 + v270) - 120.0d0*(v280 + v305) + 840.0d0* &
      (v284 + v315) - 160.0d0*(v306 + v312) + 90.0d0*(-M_xxxxzz + v264 &
      + v281) + 360.0d0*(-v259 + v271 - v276 + v300) + 720.0d0*(v269 + &
      v282 + v290 + v301) - 600.0d0*(v273 + v274 + v295 + v316) - &
      1680.0d0*(v275 + v277 + v289 + v294) - 165.0d0*(v265 + v266 + &
      v267 + v287 + v307 + v313) - 180.0d0*(M_xxxxyy + v260 + v261 + &
      v262 + v278 + v292 + v293) + 60.0d0*(v283 - v288 + v296 - v302 - &
      v303 - v304 - v308 - v314) + 30.0d0*(v285 + v297 + v298 + v299 + &
      v309 + v310 + v311 + v317))
    S_xxxxxy   = v0*v319
    v625       = M_y*S_xxxxxy
    v675       = M_x*S_xxxxxy
    v1037      = M_z*S_xxxxxy
    Ms_xxxxxy  = M_0*S_xxxxxy - M_z*v378 + v338 - v351*z + 0.0303030303030303d0*(-10.0d0* &
      (v340 + v354) + 20.0d0*(v343 + v360) - 70.0d0*(v350 + v368) - &
      60.0d0*(v352 + v376) + 28.0d0*(M_xxxxxy + v346 + v367) + 100.0d0* &
      (v339 + v345 + v347 + v357) + 190.0d0*(v342 + v344 + v348 + v353 &
      ) - 140.0d0*(v355 + v356 + v364 + v366) - 5.0d0*(M_xyyyyy + v341 &
      + v358 + v362 + v369 + v373 + v374) + 40.0d0*(-v349 + v359 + v361 &
      + v363 + v365 - v370 + v371 + v372 + v375 + v377))
    S_xxxxxz   = v1*v319
    v651       = M_z*S_xxxxxz
    v799       = M_x*S_xxxxxz
    v1022      = M_y*S_xxxxxz
    Ms_xxxxxz  = M_0*S_xxxxxz + M_xxz*v402 + S_xxz*v386 - v393 - v398 - v415 - v422 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 250.0d0*(v384 + v394) + &
      220.0d0*(v388 + v417) + 68.0d0*(v389 + v434) + 80.0d0*(v395 + &
      v423) + 90.0d0*(v399 + v418) - 140.0d0*(v401 + v406) + 160.0d0*( &
      v403 + v407) + 100.0d0*(v379 + v390 - v391 - v432) + 20.0d0*(v385 &
      + v387 + v411 + v428) + 10890.0d0*(-M_xxxyyz - v380 + v392 - v400 &
      + v435) + 40.0d0*(v408 - v409 + v412 - v416 + v424 - v425 + v429 &
      - v433) - 5.0d0*(M_xxxzzz + M_xyyyyz + M_xyyzzz + v381 + v382 + &
      v383 + v405 + v427 + v431) - 25.0d0*(v396 + v404 + v410 + v413 + &
      v419 + v420 + v421 + v426 + v430 + v436 + v437 + v438))
    S_xxxxyy   = 0.0303030303030303d0*(-3.0d0*v246 + 2.0d0*v247) + v440 + v441 + v442*v5
    v539       = M_x*S_xxxxyy
    v744       = M_y*S_xxxxyy
    v920       = M_z*S_xxxxyy
    v921       = 0.559440559440559d0*v920
    Ms_xxxxyy  = M_0*S_xxxxyy + v443 - v444 - v448 + v451 + v453 + 0.00432900432900433d0* &
      (-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - 11.0d0*M_xxxxzz - 5.0d0* &
      M_yyyyyy - 4.0d0*M_yyyyzz + 1800.0d0*v279 - 720.0d0*v291 - 64.0d0 &
      *(v258 + v272) + 628.0d0*(v259 + v276) - 82.0d0*(v263 + v270) + &
      942.0d0*(v264 + v281) + 2.0d0*(v266 + v307) - 60.0d0*(v268 + v286 &
      ) + 760.0d0*(v269 + v290) + 412.0d0*(v273 + v295) - 36.0d0*(v274 &
      + v316) + 1288.0d0*(v275 + v289) - 220.0d0*(v280 + v305) - &
      402.0d0*(v282 + v301) - 392.0d0*(v284 + v315) + 37.0d0*(v303 + &
      v308) + 80.0d0*(v306 + v312) + 6.0d0*(v310 + v317) - 26.0d0*(v265 &
      + v267 + v287 + v313) + 268.0d0*(v271 - v283 - v296 + v300) - &
      19.0d0*(v288 + v302 + v304 + v314) - 448.0d0*(v445 + v446 + v447 &
      + v449) - 8.0d0*(v285 + v297 + v298 + v299 + v309 + v311) - &
      22.0d0*(M_xxyyyy + v260 + v261 + v262 + v278 + v292 + v293))
    S_xxxxyz   = v2*(-v439 + v37 + v442)
    v780       = M_z*S_xxxxyz
    v872       = M_y*S_xxxxyz
    v983       = M_x*S_xxxxyz
    Ms_xxxxyz  = M_0*S_xxxxyz + v466 + 0.0303030303030303d0*(26.0d0*(v480 + v509) + &
      40.0d0*(v485 + v498) + 8.0d0*(v497 + v503) + 32.0d0*(M_xxxxyz + &
      v473 + v493) + 96.0d0*(v467 + v475 + v476 + v486) + 170.0d0*(v468 &
      + v477 + v482 + v484) + 4.0d0*(v469 + v483 + v496 + v502) + &
      160.0d0*(v470 + v474 + v490 + v491) + 64.0d0*(v471 + v472 + v488 &
      + v492 + v505 + v508) - (2.0d0*M_xxyyyz + 40.0d0*v478 + 18.0d0* &
      v479 + 38.0d0*v481 + 64.0d0*v487 + 64.0d0*v489 + 38.0d0*v494 + &
      v495 + 13.0d0*v499 + 5.0d0*v500 + v501 + 40.0d0*v504 + 18.0d0* &
      v506 + 13.0d0*v507 + 5.0d0*v510))
    S_xxxxzz   = -(S_xxxxxx + S_xxxxyy)
    v540       = M_x*S_xxxxzz
    v745       = M_y*S_xxxxzz
    v922       = M_z*S_xxxxzz
    v934       = 0.104895104895105d0*v540
    v1070      = 0.174825174825175d0*v922
    S_xxxyyy   = v0*(0.0909090909090909d0*v38 + v511 + v512 + v83)
    v626       = M_y*S_xxxyyy
    v676       = M_x*S_xxxyyy
    v979       = M_z*S_xxxyyy
    Ms_xxxyyy  = 0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v322 + v335) + 75.0d0*(v324 + v331) + 69.0d0*(v325 + v328) + &
      25.0d0*(v340 + v350 + v354 + v368) + 31.0d0*(v343 + v349 + v360 + &
      v370) - (M_xxxxxy + 11.0d0*M_xxxyz*v513 + M_xxxyzz + M_xyyyyy + &
      11.0d0*M_xyyyz*v513 + M_xyyyzz + 11.0d0*S_xxxyz*v516 + 11.0d0* &
      S_xyyyz*v516 + v320 + v321 + v323 + v326 + v327 + v329 + v330 + &
      v332 + v333 + v334 + v336 + v337 + 7.0d0*v339 + v341 + 10.0d0* &
      v342 + 10.0d0*v344 + 7.0d0*v345 + v346 + 7.0d0*v347 + 10.0d0*v348 &
      + 6.0d0*v352 + 10.0d0*v353 + 10.0d0*v355 + 10.0d0*v356 + 7.0d0* &
      v357 + 7.0d0*v358 + 10.0d0*v359 + 10.0d0*v361 + 7.0d0*v362 + &
      10.0d0*v363 + 10.0d0*v364 + 10.0d0*v365 + 10.0d0*v366 + v367 + &
      7.0d0*v369 + 10.0d0*v371 + 10.0d0*v372 + 7.0d0*v373 + v374 + &
      10.0d0*v375 + 6.0d0*v376 + 10.0d0*v377 + 6.0d0*v514 + 6.0d0*v515 &
      ))
    S_xxxyyz   = v1*(0.0909090909090909d0*(-v40) + v512 + v517)
    v652       = M_z*S_xxxyyz
    v800       = M_x*S_xxxyyz
    v1023      = M_y*S_xxxyyz
    Ms_xxxyyz  = M_0*S_xxxyyz + M_xxyy*v218 + S_xxyy*v76 + v393 + v398 + v415 + v422 + &
      v518 + 0.0303030303030303d0*(31.0d0*M_xxxyyz + v389 + v434 + &
      79.0d0*(v380 + v400) + 103.0d0*(v385 + v411) + 55.0d0*(v387 + &
      v428) + 88.0d0*(v391 + v432) + 47.0d0*(v392 + v435) + 43.0d0*( &
      v395 + v423) + 152.0d0*(v401 + v406) + 95.0d0*(v403 + v407) + &
      10.0d0*(v409 + v416 + v425 + v433) + 13.0d0*(v410 + v420 + v426 + &
      v437) - (M_xyyyyz + 7.0d0*v379 + v382 + 4.0d0*v384 + v388 + 7.0d0 &
      *v390 + 4.0d0*v394 + 10.0d0*v408 + 10.0d0*v412 + v417 + 10.0d0* &
      v424 + v427 + 10.0d0*v429 + 18.0d0*v519 + 18.0d0*v520 + 18.0d0* &
      v521 + 18.0d0*v522))
    S_xxxyzz   = -(S_xxxxxy + S_xxxyyy)
    v627       = M_y*S_xxxyzz
    v677       = M_x*S_xxxyzz
    v980       = M_z*S_xxxyzz
    S_xxxzzz   = -(S_xxxxxz + S_xxxyyz)
    v653       = M_z*S_xxxzzz
    v801       = M_x*S_xxxzzz
    v970       = M_y*S_xxxzzz
    v1055      = 0.0699300699300699d0*v801
    S_xxyyyy   = 0.0303030303030303d0*(-3.0d0*v523 + 2.0d0*v525) + v4*v442 + v440 + v524
    v541       = M_x*S_xxyyyy
    v746       = M_y*S_xxyyyy
    v923       = M_z*S_xxyyyy
    v1071      = 0.559440559440559d0*v923
    Ms_xxyyyy  = M_0*S_xxyyyy + v443 + v444 + v448 - v451 - v453 + 0.00432900432900433d0* &
      (-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0*M_xxyyyy - 12.0d0* &
      M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v279 + 1800.0d0*v291 + &
      412.0d0*(v261 + v292) + 37.0d0*(v263 + v270) - 402.0d0*(v264 + &
      v281) + 80.0d0*(v268 + v286) - 220.0d0*(v269 + v290) + 2.0d0*( &
      v271 + v300) + 6.0d0*(v274 + v316) + 760.0d0*(v280 + v305) + &
      942.0d0*(v282 + v301) + 628.0d0*(v283 + v296) - 64.0d0*(v298 + &
      v309) - 82.0d0*(v303 + v308) - 60.0d0*(v306 + v312) - 36.0d0*( &
      v310 + v317) + 1288.0d0*(v445 + v446) - 392.0d0*(v447 + v449) + &
      268.0d0*(-v259 + v266 - v276 + v307) - 19.0d0*(v265 + v267 + v287 &
      + v313) - 448.0d0*(v275 + v284 + v289 + v315) - 26.0d0*(v288 + &
      v302 + v304 + v314) - 8.0d0*(v258 + v260 + v262 + v272 + v278 + &
      v293) - 22.0d0*(M_xxxxyy + v273 + v285 + v295 + v297 + v299 + &
      v311))
    S_xxyyyz   = v2*(0.0909090909090909d0*(-v105) + v511 + v517)
    v781       = M_z*S_xxyyyz
    v873       = M_y*S_xxyyyz
    v984       = M_x*S_xxyyyz
    Ms_xxyyyz  = M_0*S_xxyyyz + v466 + v527 + v528 + v530 + v531 + 0.0303030303030303d0*( &
      31.0d0*M_xxyyyz + v500 + v510 + 43.0d0*(v469 + v502) + 95.0d0*( &
      v478 + v504) + 99.0d0*(v479 + v506) + 47.0d0*(v480 + v509) + &
      79.0d0*(v481 + v494) + 103.0d0*(v483 + v496) + 55.0d0*(v485 + &
      v498) + 152.0d0*(v487 + v489) + 88.0d0*(v488 + v492) + 10.0d0*( &
      v470 + v474 + v490 + v491) + 13.0d0*(v471 + v472 + v505 + v508) - &
      (M_xxxxyz + 18.0d0*v467 + 10.0d0*v468 + v473 + 18.0d0*v475 + &
      18.0d0*v476 + 10.0d0*v477 + 10.0d0*v482 + 10.0d0*v484 + 18.0d0* &
      v486 + v493 + 7.0d0*v495 + 4.0d0*v497 + v499 + 7.0d0*v501 + 4.0d0 &
      *v503 + v507))
    S_xxyyzz   = -(S_xxxxyy + S_xxyyyy)
    v542       = M_x*S_xxyyzz
    v662       = M_y*S_xxyyzz
    v792       = M_z*S_xxyyzz
    v793       = -1.22377622377622d0*v792
    v1072      = -0.244755244755245d0*v792
    S_xxyzzz   = -(S_xxxxyz + S_xxyyyz)
    v670       = M_z*S_xxyzzz
    v874       = M_y*S_xxyzzz
    v875       = 0.0699300699300699d0*v874
    v944       = M_x*S_xxyzzz
    S_xxzzzz   = -(S_xxxxzz + S_xxyyzz)
    v543       = M_x*S_xxzzzz
    v663       = M_y*S_xxzzzz
    v794       = M_z*S_xxzzzz
    v795       = 0.0815850815850816d0*v794
    v1073      = 0.0163170163170163d0*v794
    S_xyyyyy   = v0*v532
    v628       = M_y*S_xyyyyy
    v678       = M_x*S_xyyyyy
    v1038      = M_z*S_xyyyyy
    Ms_xyyyyy  = M_0*S_xyyyyy - M_z*v526 + v338 - v529*z + 0.0303030303030303d0*(-70.0d0* &
      (v340 + v354) + 20.0d0*(v349 + v370) - 10.0d0*(v350 + v368) - &
      60.0d0*(v514 + v515) + 28.0d0*(M_xyyyyy + v341 + v374) + 100.0d0* &
      (v358 + v362 + v369 + v373) + 190.0d0*(v359 + v361 + v371 + v372 &
      ) - 140.0d0*(v363 + v365 + v375 + v377) - 5.0d0*(M_xxxxxy + v339 &
      + v345 + v346 + v347 + v357 + v367) + 40.0d0*(v342 - v343 + v344 &
      + v348 + v353 + v355 + v356 - v360 + v364 + v366))
    S_xyyyyz   = v1*(0.0909090909090909d0*(-6.0d0*v105) + v104 + v442)
    v654       = M_z*S_xyyyyz
    v802       = M_x*S_xyyyyz
    v1024      = M_y*S_xyyyyz
    Ms_xyyyyz  = M_0*S_xyyyyz + v518 + 0.0303030303030303d0*(8.0d0*(v384 + v394) + 40.0d0 &
      *(v387 + v428) + 26.0d0*(v392 + v435) + 32.0d0*(M_xyyyyz + v382 + &
      v427) + 4.0d0*(v385 + v395 + v411 + v423) + 170.0d0*(v408 + v412 &
      + v424 + v429) + 160.0d0*(v409 + v416 + v425 + v433) + 96.0d0*( &
      v519 + v520 + v521 + v522) + 64.0d0*(v391 + v410 + v420 + v426 + &
      v432 + v437) - (2.0d0*M_xxxyyz + v379 + 38.0d0*v380 + 13.0d0*v388 &
      + 5.0d0*v389 + v390 + 18.0d0*v399 + 38.0d0*v400 + 64.0d0*v401 + &
      40.0d0*v403 + 64.0d0*v406 + 40.0d0*v407 + 13.0d0*v417 + 18.0d0* &
      v418 + 5.0d0*v434))
    S_xyyyzz   = -(S_xxxyyy + S_xyyyyy)
    v629       = M_y*S_xyyyzz
    v679       = M_x*S_xyyyzz
    v981       = M_z*S_xyyyzz
    S_xyyzzz   = -(S_xxxyyz + S_xyyyyz)
    v655       = M_z*S_xyyzzz
    v803       = M_x*S_xyyzzz
    v971       = M_y*S_xyyzzz
    v1056      = 0.0699300699300699d0*v803
    S_xyzzzz   = -(S_xxxyzz + S_xyyyzz)
    S_xzzzzz   = -(S_xxxzzz + S_xyyzzz)
    S_yyyyyy   = v245 + v533 + 0.0909090909090909d0*(-15.0d0*v523 + 5.0d0*v525)
    v544       = M_x*S_yyyyyy
    v747       = M_y*S_yyyyyy
    v924       = M_z*S_yyyyyy
    Ms_yyyyyy  = M_0*S_yyyyyy + v257 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v279 - &
      2340.0d0*v291 + 2360.0d0*v306 - 2260.0d0*v312 - 160.0d0*(v268 + &
      v286) - 120.0d0*(v269 + v290) + 576.0d0*(v298 + v309) + 1620.0d0* &
      (v303 + v308) + 840.0d0*(v447 + v449) + 90.0d0*(-M_yyyyzz + v282 &
      + v301) - 600.0d0*(v261 + v292 + v310 + v317) + 720.0d0*(v264 + &
      v280 + v281 + v305) + 360.0d0*(v266 - v283 - v296 + v307) - &
      1680.0d0*(v445 + v446 + v450 + v452) - 165.0d0*(v271 + v288 + &
      v300 + v302 + v304 + v314) - 180.0d0*(M_xxyyyy + v273 + v285 + &
      v295 + v297 + v299 + v311) + 30.0d0*(v258 + v260 + v262 + v272 + &
      v274 + v278 + v293 + v316) + 60.0d0*(v259 - v263 - v265 - v267 - &
      v270 + v276 - v287 - v313))
    S_yyyyyz   = v2*v532
    v782       = M_z*S_yyyyyz
    v876       = M_y*S_yyyyyz
    v985       = M_x*S_yyyyyz
    Ms_yyyyyz  = M_0*S_yyyyyz + M_yyy*v534 + M_yyz*v535 - v527 - v528 - v530 - v531 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 80.0d0*(v469 + v502) + &
      160.0d0*(v478 + v504) + 90.0d0*(v479 + v506) - 140.0d0*(v487 + &
      v489) + 250.0d0*(v497 + v503) + 220.0d0*(v499 + v507) + 68.0d0*( &
      v500 + v510) + 20.0d0*(v483 + v485 + v496 + v498) + 100.0d0*( &
      -v488 - v492 + v495 + v501) + 10890.0d0*(-M_xxyyyz + v480 - v481 &
      - v494 + v509) + 40.0d0*(v468 - v470 - v474 + v477 + v482 + v484 &
      - v490 - v491) - 5.0d0*(M_xxxxyz + M_xxyzzz + M_yyyzzz + v456 + &
      v457 + v458 + v461 + v473 + v493) - 25.0d0*(v454 + v455 + v459 + &
      v460 + v462 + v463 + v464 + v465 + v471 + v472 + v505 + v508))
    S_yyyyzz   = -(S_xxyyyy + S_yyyyyy)
    v545       = M_x*S_yyyyzz
    v748       = M_y*S_yyyyzz
    v749       = 0.104895104895105d0*v748
    v925       = M_z*S_yyyyzz
    v926       = 0.174825174825175d0*v925
    S_yyyzzz   = -(S_xxyyyz + S_yyyyyz)
    v671       = M_z*S_yyyzzz
    v877       = M_y*S_yyyzzz
    v878       = 0.0699300699300699d0*v877
    v945       = M_x*S_yyyzzz
    v982       = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 5.0d0*(-3.0d0*M_xxxyzzz - &
      3.0d0*M_xyyyzzz - 3.0d0*v944 - 3.0d0*v945 + 12.0d0*v946 + 14.0d0* &
      v947 + 12.0d0*v948 - 15.0d0*v949 - 15.0d0*v950 - 3.0d0*v951 - &
      54.0d0*v952 - 114.0d0*v953 - 15.0d0*v954 - 3.0d0*v955 - 15.0d0* &
      v956 - 3.0d0*v957 - 114.0d0*v958 - 3.0d0*v959 - 3.0d0*v960 + &
      12.0d0*v961 - 15.0d0*v962 - 15.0d0*v963 - 3.0d0*v964 - 54.0d0* &
      v965 - 15.0d0*v966 - 15.0d0*v967 - 15.0d0*v968 - 15.0d0*v969 - &
      3.0d0*v970 - 3.0d0*v971 + 12.0d0*v972 - 15.0d0*v973 - 3.0d0*v974 &
      - 15.0d0*v975 - 3.0d0*v976 - 15.0d0*v977 - 15.0d0*v978 + 14.0d0* &
      v979 - 15.0d0*v980 - 15.0d0*v981))
    S_yyzzzz   = -(S_xxyyzz + S_yyyyzz)
    v546       = M_x*S_yyzzzz
    v664       = M_y*S_yyzzzz
    v672       = 0.00233100233100233d0*(5.0d0*(v1083 - 15.0d0*v658 + 6.0d0*v659 + 6.0d0* &
      v660 + v661 - 15.0d0*v662 + v663 + v664 + 6.0d0*v665 + 6.0d0*v666 &
      + v667 + 6.0d0*v668 + 6.0d0*v669 + 6.0d0*v670 + 6.0d0*v671))
    v796       = M_z*S_yyzzzz
    v797       = 0.0815850815850816d0*v796
    v931       = 0.00233100233100233d0*(5.0d0*(v1082 - 15.0d0*v542 + v543 + v546 + 6.0d0* &
      v580 - 15.0d0*v588 + 6.0d0*v595 + v596 + 6.0d0*v618 + 6.0d0*v622 &
      + 6.0d0*v624 + 6.0d0*v648 + v649 + 6.0d0*v653 + 6.0d0*v655))
    v1074      = 0.0163170163170163d0*v796
    v1087      = v1052 + v1053 + v1054 + v1061 + v1062 + v1069 + v1072 + v1073 + v1074
    S_yzzzzz   = -(S_xxyzzz + S_yyyzzz)
    S_zzzzzz   = -(S_xxzzzz + S_yyzzzz)
    S_xxxxxxx  = x*(v243 + v536 + 0.00699300699300699d0*(-231.0d0*v246 + 105.0d0*v247))
    Ms_xxxxxxx = M_0*S_xxxxxxx + v537 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*(v538 + v561) - 1260.0d0*(v539 + v565) - 630.0d0*(v540 + &
      v567) + 3444.0d0*(v547 + v559) - 1050.0d0*(v548 + v570) + &
      6860.0d0*(v552 + v557) + 1470.0d0*(v553 + v583) - 7980.0d0*(v568 &
      + v581) + 1680.0d0*(v571 + v631) - 7420.0d0*(v576 + v591) + &
      5040.0d0*(v584 + v603) + 5880.0d0*(v589 + v619) + 70.0d0*( &
      M_xyyyyyy + v544 + v640) + 105.0d0*(-M_xxxyyyy + M_xyyyyzz + v545 &
      + v642) - 525.0d0*(v541 + v542 + v586 + v588) + 2520.0d0*(v558 + &
      v574 + v602 + v650) - 1176.0d0*(v562 + v563 + v625 + v651) - &
      4200.0d0*(v564 + v566 + v597 + v620) - 280.0d0*(v577 + v592 + &
      v614 + v644) - 1120.0d0*(v608 + v615 + v636 + v645) + 35.0d0*( &
      M_xxxzzzz + M_xyyzzzz + v543 + v546 + v596 + v649) - 1155.0d0*( &
      v549 + v550 + v551 + v578 + v609 + v616) - 735.0d0*(v554 + v555 + &
      v556 + v593 + v637 + v646) + 840.0d0*(v560 - v569 - v582 - v607 + &
      v630 - v635) + 420.0d0*(-M_xxxxxyy + v572 + v573 - v579 + v585 + &
      v587 - v594 + v598 - v604 - v605 - v606 - v610 - v617 + v621 + &
      v626 - v632 - v633 - v634 - v638 - v647 + v652) + 210.0d0*( &
      -M_xxxxxzz + v575 + v580 + v590 + v595 + v599 + v600 + v601 + &
      v611 + v612 + v613 + v618 + v622 + v623 + v624 + v627 + v628 + &
      v629 + v639 + v641 + v643 + v648 + v653 + v654 + v655))
    S_xxxxxxy  = v657*y
    Ms_xxxxxxy = M_0*S_xxxxxxy + v672 + v673 + v674 + v749 + v768 + 0.00233100233100233d0 &
      *(-105.0d0*M_xxyyyyy + 10.0d0*M_yyyyyyy + 150.0d0*(v681 + v713) + &
      4640.0d0*(v685 + v698) - 1200.0d0*(v694 + v744) - 3870.0d0*(v707 &
      + v711) - 315.0d0*(v709 + v760) + 840.0d0*(v712 + v756) + &
      1020.0d0*(v714 + v751) - 45.0d0*(v715 + v746) + 1140.0d0*(v717 + &
      v778) - 3940.0d0*(v718 + v722) + 1040.0d0*(v719 + v773) - 220.0d0 &
      *(v758 + v761) - 160.0d0*(v770 + v774) + 304.0d0*(M_xxxxxxy + &
      v690 + v743) - 120.0d0*(M_xxxxyzz + v697 + v745) + 1344.0d0*(v675 &
      + v689 + v691 + v726) - 2880.0d0*(v702 + v704 + v740 + v742) + &
      40.0d0*(-v723 + v747 + v764 - v769) + 480.0d0*(-v676 + v688 - &
      v693 - v701 - v750 + v755) + 3360.0d0*(v680 + v687 + v692 - v700 &
      + v706 - v727) + 960.0d0*(v686 - v695 - v696 + v733 - v777 - v780 &
      ) + 1920.0d0*(-v699 - v731 + v732 + v734 + v738 + v741) + 60.0d0* &
      (v716 - v725 - v757 - v759 - v776 + v781) - 195.0d0*(v682 + v683 &
      + v684 + v708 + v710 + v720 + v724 + v762 + v771 + v775) + 30.0d0 &
      *(-v721 - v752 - v753 - v754 - v763 + v765 + v766 - v772 + v779 + &
      v782) - 240.0d0*(M_xxxxyyy + v677 + v678 + v679 + v703 + v705 + &
      v728 + v729 + v730 + v735 + v736 + v737 + v739))
    S_xxxxxxz  = v657*z
    Ms_xxxxxxz = M_0*S_xxxxxxz + v1090 + v783 + v784 + v785 + v787 + v789 + v791 + v793 + &
      v795 + v797 + v798 - v818 + v843 + v845 + v875 + v878 + v896 + &
      v900 + v902 + v915 + v918 - v921 + v926 + 0.00233100233100233d0*( &
      304.0d0*M_xxxxxxz - 105.0d0*M_xxyyyyz + 10.0d0*M_yyyyyyz + &
      1344.0d0*(v799 + v815) + 4320.0d0*(v804 + v820) + 7520.0d0*(v809 &
      + v827) + 6720.0d0*(v811 + v846) + 3264.0d0*(v813 + v867) + &
      784.0d0*(v814 + v919) + 1440.0d0*(v821 + v879) - 600.0d0*(v822 + &
      v922) - 4800.0d0*(v823 + v865) - 2880.0d0*(v826 + v855) + &
      3840.0d0*(v828 + v856) - 5100.0d0*(v831 + v840) + 2970.0d0*(v833 &
      + v847) + 1080.0d0*(v834 + v904) - 780.0d0*(v835 + v913) - &
      555.0d0*(v836 + v923) + 900.0d0*(v839 + v880) - 735.0d0*(v849 + &
      v887) + 30.0d0*(v876 + v891) - 160.0d0*(v886 + v898) + 150.0d0*( &
      v889 + v916) + 40.0d0*(v890 + v924) - 120.0d0*(M_xxxxzzz + v832 + &
      v897) + 960.0d0*(v810 - v819 + v861 - v872) + 60.0d0*(v837 + v873 &
      + v888 + v906) - 775.0d0*(v848 + v850 + v851 + v908) - 100.0d0*( &
      v852 + v905 + v907 + v909) + 480.0d0*(-v800 + v812 + v824 - v825 &
      + v868 + v903) + 90.0d0*(v805 + v838 - v854 - v881 - v884 - v911 &
      ) - 225.0d0*(v806 + v807 + v808 + v853 + v892 + v910) + 1920.0d0* &
      (-v816 + v857 - v858 + v862 - v866 - v912) - 240.0d0*(M_xxxxyyz + &
      v801 + v802 + v803 + v830 + v860 + v864) - 1200.0d0*(v829 + v841 &
      + v859 + v863 + v869 + v870 + v871 + v885))
    S_xxxxxyy  = x*(0.00699300699300699d0*(10.0d0*v247) + v1085 + v441 + v5*v928 + v927)
    Ms_xxxxxyy = M_0*S_xxxxxyy + v931 - v932 + v933 - v934 - v935 + v937 + v939 + v941 + &
      v943 + 0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0* &
      M_xxxxxyy - 116.0d0*(v538 + v561) + 1350.0d0*(v539 + v565) - &
      210.0d0*(v547 + v559) + 2550.0d0*(v548 + v570) - 190.0d0*(v552 + &
      v557) + 2730.0d0*(v553 + v583) + 1620.0d0*(v558 + v602) + 444.0d0 &
      *(v560 + v630) + 732.0d0*(v562 + v625) - 36.0d0*(v563 + v651) + &
      2820.0d0*(v564 + v597) + 5160.0d0*(v568 + v581) - 420.0d0*(v569 + &
      v635) - 1110.0d0*(v571 + v631) - 780.0d0*(v572 + v626) - 600.0d0* &
      (v573 + v652) - 1080.0d0*(v574 + v650) - 100.0d0*(v576 + v591) - &
      700.0d0*(v577 + v644) - 1380.0d0*(v582 + v607) - 2790.0d0*(v584 + &
      v603) - 1740.0d0*(v585 + v598) - 1560.0d0*(v587 + v621) - &
      2760.0d0*(v589 + v619) - 1660.0d0*(v592 + v614) - 35.0d0*( &
      M_xyyyyyy + v544 + v640) + 255.0d0*(v605 + v610 + v633 + v638) + &
      560.0d0*(v608 + v615 + v636 + v645) - 120.0d0*(v541 + v549 + v551 &
      + v578 + v586 + v616) + 90.0d0*(-M_xxxyyyy - v554 + v555 - v556 - &
      v593 + v637 - v646) + 30.0d0*(-M_xyyyyzz - v545 + v612 + v623 + &
      v641 - v642 + v654) - 105.0d0*(v579 + v594 + v604 + v606 + v617 + &
      v632 + v634 + v647) + 60.0d0*(v550 - v566 - v575 - v590 - v599 - &
      v600 - v601 + v609 - v611 - v613 - v620 - v627 - v628 - v629 - &
      v639 - v643))
    S_xxxxxyz  = v3*(-v929 + v37 + v928)
    Ms_xxxxxyz = M_0*S_xxxxxyz + M_xxyz*v402 + S_xxyz*v386 + v982 + 0.00699300699300699d0 &
      *(390.0d0*(v1003 + v1020) - 30.0d0*(v1004 + v984) - 250.0d0*( &
      v1023 + v997) - 270.0d0*(v1035 + v996) + 1430.0d0*(M_xxxy*S_xxz + &
      M_xxz*S_xxxy) + 128.0d0*(M_xxxxxyz + v1022 + v991) + 280.0d0*( &
      v1000 + v1026 - v1033 - v995) + 1110.0d0*(v1001 + v986 + v998 + &
      v999) + 600.0d0*(-v1002 + v1006 + v1011 - v1016) + 60.0d0*(v1005 &
      + v1009 + v1031 + v987) + 480.0d0*(v1007 + v983 + v993 + v994) + &
      120.0d0*(v1010 + v1015 + v1025 + v1032) - 195.0d0*(v1012 + v1018 &
      + v1027 + v1036) - 75.0d0*(v1013 + v1021 + v1028 + v1038) + &
      960.0d0*(v1017 + v1019 + v988 + v992) + 288.0d0*(v1034 + v1037 + &
      v989 + v990) - 15.0d0*(M_xyyyyyz + v1008 + v1014 + v1024 + v1029 &
      + v1030 + v985))
    S_xxxxyyy  = y*(v1040 + v1086 + 0.00699300699300699d0*(-33.0d0*v246 + 18.0d0*v247))
    Ms_xxxxyyy = M_0*S_xxxxyyy + v1042 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v661 + v663 + v664 + v667 + 380.0d0*(v676 &
      + v701) + 630.0d0*(v681 + v713) + 560.0d0*(v686 + v733) + 200.0d0 &
      *(v688 + v755) + 420.0d0*(v693 + v750) + 330.0d0*(v694 + v744) + &
      1320.0d0*(v699 + v731) + 1140.0d0*(v700 + v727) + 1710.0d0*(v707 &
      + v711) + 9.0d0*(v753 + v763) + 25.0d0*(v758 + v761) + 30.0d0*( &
      v766 + v779) + 40.0d0*(v770 + v774) + 6.0d0*(v659 + v660 + v665 + &
      v666 + v668 + v669 + v670 + v671 + v765 + v782) - (16.0d0* &
      M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + M_yyyyyyy + &
      143.0d0*v1043 + 143.0d0*v1044 + 240.0d0*v1045 + 143.0d0*v1046 + &
      143.0d0*v1047 + 240.0d0*v1048 + 15.0d0*v658 + 15.0d0*v662 + &
      96.0d0*v675 + 30.0d0*v677 + 30.0d0*v678 + 30.0d0*v679 + 150.0d0* &
      v680 + 30.0d0*v682 + 18.0d0*v683 + 30.0d0*v684 + 140.0d0*v685 + &
      150.0d0*v687 + 96.0d0*v689 + 16.0d0*v690 + 96.0d0*v691 + 150.0d0* &
      v692 + 60.0d0*v695 + 60.0d0*v696 + 15.0d0*v697 + 140.0d0*v698 + &
      30.0d0*v703 + 30.0d0*v705 + 150.0d0*v706 + 30.0d0*v708 + 150.0d0* &
      v709 + 30.0d0*v710 + 270.0d0*v712 + 270.0d0*v714 + 150.0d0*v715 + &
      120.0d0*v716 + 240.0d0*v717 + 140.0d0*v718 + 260.0d0*v719 + &
      30.0d0*v720 + 15.0d0*v721 + 140.0d0*v722 + 140.0d0*v723 + 30.0d0* &
      v724 + 15.0d0*v725 + 96.0d0*v726 + 30.0d0*v728 + 270.0d0*v729 + &
      30.0d0*v730 + 480.0d0*v732 + 480.0d0*v734 + 270.0d0*v735 + 30.0d0 &
      *v736 + 30.0d0*v737 + 480.0d0*v738 + 30.0d0*v739 + 480.0d0*v741 + &
      16.0d0*v743 + 15.0d0*v745 + 150.0d0*v746 + v747 + 270.0d0*v751 + &
      15.0d0*v752 + 15.0d0*v754 + 270.0d0*v756 + 15.0d0*v757 + 15.0d0* &
      v759 + 150.0d0*v760 + 18.0d0*v762 + v764 + 140.0d0*v769 + 30.0d0* &
      v771 + 15.0d0*v772 + 260.0d0*v773 + 30.0d0*v775 + 15.0d0*v776 + &
      60.0d0*v777 + 240.0d0*v778 + 60.0d0*v780 + 120.0d0*v781))
    S_xxxxyyz  = z*(0.00699300699300699d0*(6.0d0*v247) + v1049 + v1086 + v927)
    Ms_xxxxyyz = M_0*S_xxxxyyz + v1050 - v1051 - v1055 - v1056 - v1057 - v1058 - v1059 + &
      v1060 - v1065 - v1066 - v1067 - v1068 - v1070 + v1071 + v1087 + &
      0.00233100233100233d0*(390.0d0*M_xxxxyyz - 7.0d0*M_yyyyyyz - &
      6.0d0*M_yyyyzzz - 720.0d0*(v1063 + v1064) + 1260.0d0*(v800 + v825 &
      ) - 20.0d0*(v809 + v827) + 2160.0d0*(v810 + v861) - 90.0d0*(v811 &
      + v846) + 840.0d0*(v812 + v903) + 1380.0d0*(v816 + v912) + &
      690.0d0*(v817 + v920) + 780.0d0*(v819 + v872) + 540.0d0*(v821 + &
      v879) + 3720.0d0*(v823 + v865) + 1860.0d0*(v824 + v868) + &
      2520.0d0*(v826 + v855) + 1560.0d0*(v828 + v856) + 4200.0d0*(v831 &
      + v840) - 450.0d0*(v834 + v904) - 270.0d0*(v839 + v880) + 300.0d0 &
      *(v841 + v885) + 330.0d0*(v849 + v887) + 570.0d0*(v859 + v870) + &
      45.0d0*(v882 + v893) + 40.0d0*(v886 + v898) - 105.0d0*(v888 + &
      v906) - 132.0d0*(v889 + v916) - 37.0d0*(v890 + v924) - 16.0d0*( &
      M_xxxxxxz + v814 + v919) - 96.0d0*(v799 + v813 + v815 + v867) + &
      2250.0d0*(v805 + v833 + v838 + v847) - 36.0d0*(v806 + v808 + v853 &
      + v910) - 420.0d0*(v832 + v837 + v873 + v897) - 110.0d0*(v848 + &
      v850 + v851 + v908) - 65.0d0*(v852 + v905 + v907 + v909) - 27.0d0 &
      *(v854 + v881 + v884 + v911) + 480.0d0*(-v857 + v858 - v862 + &
      v866) - 30.0d0*(M_xxyyyyz + v802 + v860 + v895 + v925) + 60.0d0*( &
      v835 - v842 - v899 + v913 - v914 - v917) - 12.0d0*(v844 + v874 + &
      v876 + v877 + v891 + v901))
    S_xxxyyyy  = x*(v1040 + v1088 + 0.00699300699300699d0*(-33.0d0*v523 + 18.0d0*v525))
    Ms_xxxyyyy = M_0*S_xxxyyyy + v933 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + v543 + v546 + v596 + v649 + 330.0d0*(v541 &
      + v586) + 9.0d0*(v547 + v559) + 420.0d0*(v550 + v609) + 25.0d0*( &
      v552 + v557) + 200.0d0*(v555 + v637) + 30.0d0*(v566 + v620) + &
      560.0d0*(v569 + v635) + 630.0d0*(v571 + v631) + 380.0d0*(v572 + &
      v626) + 40.0d0*(v576 + v591) + 1320.0d0*(v582 + v607) + 1710.0d0* &
      (v584 + v603) + 1140.0d0*(v585 + v598) + 6.0d0*(v563 + v580 + &
      v595 + v618 + v622 + v624 + v648 + v651 + v653 + v655) - ( &
      M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + v538 + 150.0d0*v539 + 15.0d0*v542 + 16.0d0*v544 + &
      15.0d0*v545 + 270.0d0*v548 + 15.0d0*v549 + 15.0d0*v551 + 270.0d0* &
      v553 + 15.0d0*v554 + 15.0d0*v556 + 150.0d0*v558 + 18.0d0*v560 + &
      v561 + 30.0d0*v562 + 270.0d0*v564 + 150.0d0*v565 + 480.0d0*v568 + &
      270.0d0*v570 + 120.0d0*v573 + 240.0d0*v574 + 30.0d0*v575 + &
      140.0d0*v577 + 15.0d0*v578 + 30.0d0*v579 + 480.0d0*v581 + 270.0d0 &
      *v583 + 240.0d0*v587 + 15.0d0*v588 + 480.0d0*v589 + 30.0d0*v590 + &
      260.0d0*v592 + 15.0d0*v593 + 30.0d0*v594 + 270.0d0*v597 + 30.0d0* &
      v599 + 96.0d0*v600 + 30.0d0*v601 + 150.0d0*v602 + 30.0d0*v604 + &
      150.0d0*v605 + 30.0d0*v606 + 140.0d0*v608 + 150.0d0*v610 + 96.0d0 &
      *v611 + 60.0d0*v612 + 30.0d0*v613 + 260.0d0*v614 + 140.0d0*v615 + &
      15.0d0*v616 + 30.0d0*v617 + 480.0d0*v619 + 240.0d0*v621 + 60.0d0* &
      v623 + 30.0d0*v625 + 30.0d0*v627 + 96.0d0*v628 + 30.0d0*v629 + &
      18.0d0*v630 + 30.0d0*v632 + 150.0d0*v633 + 30.0d0*v634 + 140.0d0* &
      v636 + 150.0d0*v638 + 96.0d0*v639 + 16.0d0*v640 + 60.0d0*v641 + &
      15.0d0*v642 + 30.0d0*v643 + 140.0d0*v644 + 140.0d0*v645 + 15.0d0* &
      v646 + 30.0d0*v647 + 240.0d0*v650 + 120.0d0*v652 + 60.0d0*v654 + &
      143.0d0*v937 + 143.0d0*v939 + 143.0d0*v941 + 143.0d0*v943))
    S_xxxyyyz  = -v3*0.00699300699300699d0*(-9.0d0*v38 - 143.0d0*v83 + 33.0d0*(v105 + v40 &
      ))
    Ms_xxxyyyz = 0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*(v947 + v979) + 945.0d0*(v953 + v958) + 245.0d0*(v1000 + &
      v1026 + v1031 + v987) + 345.0d0*(v1004 + v1023 + v984 + v997) + &
      525.0d0*(v1006 + v1011 + v1033 + v995) + 1125.0d0*(v1002 + v1005 &
      + v1009 + v1016 + v952 + v965) - 60.0d0*(v1001 + v1010 + v1015 + &
      v1025 + v1032 + v986 + v998 + v999) + 465.0d0*(v1003 + v1020 + &
      v1035 + v946 + v948 + v961 + v972 + v996) - 75.0d0*(v1007 + v1008 &
      + v1014 + v1024 + v1030 + v983 + v993 + v994) + 15.0d0*(v1012 + &
      v1017 + v1018 + v1019 + v1027 + v1036 + v988 + v992) + 21.0d0*( &
      v1013 + v1021 + v1028 + v1034 + v1037 + v1038 + v989 + v990) - &
      45.0d0*(v949 + v950 + v954 + v956 + v962 + v963 + v966 + v967 + &
      v968 + v969 + v973 + v975 + v977 + v978 + v980 + v981) - 9.0d0*( &
      M_xxxxxyz + M_xxxyzzz + M_xyyyyyz + M_xyyyzzz + v1022 + v1029 + &
      v944 + v945 + v951 + v955 + v957 + v959 + v960 + v964 + v970 + &
      v971 + v974 + v976 + v985 + v991))
    S_xxyyyyy  = y*(0.00699300699300699d0*(10.0d0*v525) + v1076 + v1085 + v4*v928 + v524)
    Ms_xxyyyyy = M_0*S_xxyyyyy + v1042 + v1043 + v1044 + v1046 + v1047 + v672 - v674 - &
      v749 - v768 + 0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0* &
      M_yyyyyyy - 1080.0d0*(v1045 + v1048) - 780.0d0*(v676 + v701) + &
      732.0d0*(v678 + v736) - 1110.0d0*(v681 + v713) + 444.0d0*(v683 + &
      v762) - 420.0d0*(v686 + v733) - 1380.0d0*(v699 + v731) - 1740.0d0 &
      *(v700 + v727) - 2790.0d0*(v707 + v711) + 1620.0d0*(v709 + v760) &
      + 2730.0d0*(v712 + v756) + 2550.0d0*(v714 + v751) + 1350.0d0*( &
      v715 + v746) - 600.0d0*(v716 + v781) - 1560.0d0*(v717 + v778) - &
      1660.0d0*(v719 + v773) - 700.0d0*(v723 + v769) + 2820.0d0*(v729 + &
      v735) + 5160.0d0*(v732 + v734) - 2760.0d0*(v738 + v741) - 116.0d0 &
      *(v747 + v764) - 210.0d0*(v753 + v763) - 190.0d0*(v758 + v761) - &
      36.0d0*(v765 + v782) - 100.0d0*(v770 + v774) - 35.0d0*(M_xxxxxxy &
      + v690 + v743) + 255.0d0*(v680 + v687 + v692 + v706) + 560.0d0*( &
      v685 + v698 + v718 + v722) - 120.0d0*(v694 + v721 + v744 + v752 + &
      v754 + v772) + 90.0d0*(-M_xxxxyyy + v688 - v725 + v755 - v757 - &
      v759 - v776) + 30.0d0*(-M_xxxxyzz + v695 + v696 - v697 - v745 + &
      v777 + v780) - 105.0d0*(v682 + v684 + v708 + v710 + v720 + v724 + &
      v771 + v775) + 60.0d0*(-v675 - v677 - v679 - v689 - v691 + v693 - &
      v703 - v705 - v726 - v728 - v730 - v737 - v739 + v750 - v766 - &
      v779))
    S_xxyyyyz  = z*(0.00699300699300699d0*(6.0d0*v525) + v1049 + v1076 + v1088)
    Ms_xxyyyyz = M_0*S_xxyyyyz + v1087 + v1090 - v798 + v818 - v843 - v845 - v875 - v878 &
      - v896 - v900 - v902 - v915 - v918 + v921 - v926 + &
      0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0*M_xxxxzzz + &
      390.0d0*M_xxyyyyz + 2520.0d0*(v1063 + v1064) + 780.0d0*(v802 + &
      v860) + 45.0d0*(v804 + v820) - 270.0d0*(v805 + v838) + 540.0d0*( &
      v807 + v892) + 40.0d0*(v809 + v827) + 300.0d0*(v810 + v861) - &
      105.0d0*(v811 + v846) + 330.0d0*(v812 + v903) - 132.0d0*(v813 + &
      v867) - 37.0d0*(v814 + v919) + 570.0d0*(v816 + v912) - 720.0d0*( &
      v826 + v855) + 1560.0d0*(v832 + v897) - 450.0d0*(v833 + v847) + &
      1860.0d0*(v835 + v913) + 690.0d0*(v836 + v923) + 1260.0d0*(v837 + &
      v873) + 2160.0d0*(v841 + v885) + 840.0d0*(v849 + v887) + 4200.0d0 &
      *(v857 + v862) + 3720.0d0*(v858 + v866) + 1380.0d0*(v859 + v870) &
      - 20.0d0*(v886 + v898) - 90.0d0*(v888 + v906) - 16.0d0*(M_yyyyyyz &
      + v890 + v924) - 420.0d0*(v800 + v825 + v828 + v856) - 27.0d0*( &
      v806 + v808 + v853 + v910) + 480.0d0*(v823 - v831 - v840 + v865) &
      + 2250.0d0*(v834 + v839 + v880 + v904) - 65.0d0*(v848 + v850 + &
      v851 + v908) - 110.0d0*(v852 + v905 + v907 + v909) - 36.0d0*(v854 &
      + v881 + v884 + v911) - 96.0d0*(v876 + v889 + v891 + v916) - &
      30.0d0*(M_xxxxyyz + v819 + v822 + v872 + v922) - 12.0d0*(v799 + &
      v801 + v803 + v815 + v830 + v864) + 60.0d0*(v824 - v829 - v863 + &
      v868 - v869 - v871))
    S_xyyyyyy  = v1077*x
    Ms_xyyyyyy = M_0*S_xyyyyyy + v537 + v931 + v932 + v934 + v935 + 0.00233100233100233d0 &
      *(10.0d0*M_xxxxxxx - 105.0d0*M_xxxxxyy - 45.0d0*(v539 + v565) - &
      1200.0d0*(v541 + v586) + 1020.0d0*(v548 + v570) - 220.0d0*(v552 + &
      v557) + 840.0d0*(v553 + v583) - 315.0d0*(v558 + v602) + 150.0d0*( &
      v571 + v631) - 160.0d0*(v576 + v591) - 3870.0d0*(v584 + v603) + &
      1140.0d0*(v587 + v621) + 1040.0d0*(v592 + v614) + 4640.0d0*(v608 &
      + v636) - 3940.0d0*(v615 + v645) + 304.0d0*(M_xyyyyyy + v544 + &
      v640) - 120.0d0*(M_xyyyyzz + v545 + v642) + 40.0d0*(v538 + v561 - &
      v577 - v644) + 1344.0d0*(v600 + v611 + v628 + v639) - 2880.0d0*( &
      v936 + v938 + v940 + v942) + 480.0d0*(-v550 + v555 - v572 - v609 &
      - v626 + v637) + 60.0d0*(-v554 - v556 + v573 - v593 - v646 + v652 &
      ) + 1920.0d0*(v568 + v581 - v582 + v589 - v607 + v619) + 960.0d0* &
      (v569 - v612 - v623 + v635 - v641 - v654) + 3360.0d0*(-v585 - &
      v598 + v605 + v610 + v633 + v638) + 30.0d0*(-v547 - v549 - v551 - &
      v559 + v563 + v566 - v578 - v616 + v620 + v651) - 195.0d0*(v560 + &
      v579 + v594 + v604 + v606 + v617 + v630 + v632 + v634 + v647) - &
      240.0d0*(M_xxxyyyy + v562 + v564 + v575 + v590 + v597 + v599 + &
      v601 + v613 + v625 + v627 + v629 + v643))
    S_xyyyyyz  = v3*(0.0769230769230769d0*(-10.0d0*v105) + v104 + v928)
    Ms_xyyyyyz = M_0*S_xyyyyyz + M_xyyy*v534 + M_xyyz*v535 + v982 + 0.00699300699300699d0 &
      *(-270.0d0*(v1003 + v1020) - 250.0d0*(v1004 + v984) - 30.0d0*( &
      v1023 + v997) + 390.0d0*(v1035 + v996) + 1430.0d0*(M_yyy*S_xyyz + &
      M_yyz*S_xyyy) + 128.0d0*(M_xyyyyyz + v1029 + v985) + 60.0d0*( &
      v1000 + v1002 + v1016 + v1026) + 120.0d0*(v1001 + v986 + v998 + &
      v999) + 600.0d0*(-v1005 - v1009 + v1033 + v995) + 280.0d0*(-v1006 &
      - v1011 + v1031 + v987) + 480.0d0*(v1008 + v1014 + v1024 + v1030 &
      ) + 1110.0d0*(v1010 + v1015 + v1025 + v1032) + 960.0d0*(v1012 + &
      v1018 + v1027 + v1036) + 288.0d0*(v1013 + v1021 + v1028 + v1038) &
      - 195.0d0*(v1017 + v1019 + v988 + v992) - 75.0d0*(v1034 + v1037 + &
      v989 + v990) - 15.0d0*(M_xxxxxyz + v1007 + v1022 + v983 + v991 + &
      v993 + v994))
    S_yyyyyyy  = y*(0.00699300699300699d0*(-231.0d0*v523 + 105.0d0*v525) + v533 + v536)
    Ms_yyyyyyy = M_0*S_yyyyyyy + v673 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      1680.0d0*(v681 + v713) + 5040.0d0*(v707 + v711) + 1470.0d0*(v712 &
      + v756) - 1050.0d0*(v714 + v751) - 1260.0d0*(v715 + v746) - &
      7980.0d0*(v732 + v734) + 5880.0d0*(v738 + v741) + 952.0d0*(v747 + &
      v764) - 630.0d0*(v748 + v767) + 3444.0d0*(v753 + v763) + 6860.0d0 &
      *(v758 + v761) - 7420.0d0*(v770 + v774) + 70.0d0*(M_xxxxxxy + &
      v690 + v743) + 105.0d0*(-M_xxxxyyy + M_xxxxyzz + v697 + v745) + &
      2520.0d0*(v1045 + v1048 + v709 + v760) - 525.0d0*(v658 + v662 + &
      v694 + v744) - 1176.0d0*(v678 + v736 + v765 + v782) - 1120.0d0*( &
      v685 + v698 + v718 + v722) - 280.0d0*(v719 + v723 + v769 + v773) &
      - 4200.0d0*(v729 + v735 + v766 + v779) + 35.0d0*(M_xxyzzzz + &
      M_yyyzzzz + v661 + v663 + v664 + v667) + 840.0d0*(v683 - v686 - &
      v699 - v731 - v733 + v762) - 735.0d0*(v688 + v725 + v755 + v757 + &
      v759 + v776) - 1155.0d0*(v693 + v721 + v750 + v752 + v754 + v772 &
      ) + 420.0d0*(-M_xxyyyyy + v676 - v680 - v682 - v684 - v687 - v692 &
      + v700 + v701 - v706 - v708 - v710 + v716 + v717 - v720 - v724 + &
      v727 - v771 - v775 + v778 + v781) + 210.0d0*(-M_yyyyyzz + v659 + &
      v660 + v665 + v666 + v668 + v669 + v670 + v671 + v675 + v677 + &
      v679 + v689 + v691 + v695 + v696 + v703 + v705 + v726 + v728 + &
      v730 + v737 + v739 + v777 + v780))
    S_yyyyyyz  = v1077*z
    Ms_yyyyyyz = M_0*S_yyyyyyz + v1050 + v1051 + v1055 + v1056 + v1057 + v1058 + v1059 - &
      v1060 + v1065 + v1066 + v1067 + v1068 + v1070 - v1071 + v783 + &
      v784 + v785 + v787 + v789 + v791 + v793 + v795 + v797 + &
      0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0*M_xxxxyyz + &
      304.0d0*M_yyyyyyz - 2880.0d0*(v1063 + v1064) + 30.0d0*(v799 + &
      v815) + 900.0d0*(v805 + v838) + 1440.0d0*(v807 + v892) - 160.0d0* &
      (v809 + v827) - 735.0d0*(v812 + v903) + 150.0d0*(v813 + v867) + &
      40.0d0*(v814 + v919) - 555.0d0*(v817 + v920) - 780.0d0*(v824 + &
      v868) + 3840.0d0*(v832 + v897) + 1080.0d0*(v833 + v847) + &
      2970.0d0*(v834 + v904) - 5100.0d0*(v857 + v862) - 4800.0d0*(v858 &
      + v866) + 1344.0d0*(v876 + v891) + 4320.0d0*(v882 + v893) + &
      7520.0d0*(v886 + v898) + 6720.0d0*(v888 + v906) + 3264.0d0*(v889 &
      + v916) + 784.0d0*(v890 + v924) - 600.0d0*(v895 + v925) - 120.0d0 &
      *(M_yyyyzzz + v828 + v856) + 60.0d0*(v800 + v811 + v825 + v846) + &
      960.0d0*(-v802 + v841 - v860 + v885) - 100.0d0*(v848 + v850 + &
      v851 + v908) - 775.0d0*(v852 + v905 + v907 + v909) + 90.0d0*( &
      -v806 - v808 + v839 - v853 + v880 - v910) - 225.0d0*(v821 + v854 &
      + v879 + v881 + v884 + v911) + 1920.0d0*(-v823 + v831 + v840 - &
      v859 - v865 - v870) + 480.0d0*(v835 - v837 + v849 - v873 + v887 + &
      v913) - 240.0d0*(M_xxyyyyz + v819 + v844 + v872 + v874 + v877 + &
      v901) - 1200.0d0*(v810 + v816 + v842 + v861 + v899 + v912 + v914 &
      + v917))
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
#undef  Ms_xxxxxxx          
#undef  M_xxxxxxx           
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxy           
#undef  Ms_xxxxxxz          
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  Ms_xxxxxyy          
#undef  Ms_xxxxxyz          
#undef  M_xxxxxyz           
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
    
! OPS  1265*ADD + 2*DIV + 1717*MUL + 138*NEG + POW + 35*SUB = 3158  (4070 before optimization)
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
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v291, v292, v293, v294,&
                v295, v296, v297, v298, v299, v3, v30, v300, v301, v302, v303,&
                v304, v305, v306, v307, v308, v309, v31, v310, v311, v312,&
                v313, v314, v315, v316, v317, v318, v319, v32, v320, v321,&
                v322, v323, v324, v325, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
                D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz,&
                D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz,&
                D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz,&
                D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy,&
                D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz,&
                D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy,&
                D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx,&
                D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy,&
                D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz,&
                D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz,&
                D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz,&
                D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy, D_xxxxxxz,&
                D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy, D_xxxxyyz,&
                D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz, D_xxxyyzz,&
                D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz, D_xxyyyzz,&
                D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy, D_xyyyyyz,&
                D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz, D_xzzzzzz,&
                D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz, D_yyyzzzz,&
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz,&
                M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz,&
                M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz,&
                M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz,&
                M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz,&
                M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz, M_xxxzzzz,&
                M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz, M_xyyyyzz,&
                M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz, M_yyyyyzz,&
                M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz, M_zzzzzzz
#define M_0                  M(0)
#define y                    r(2)
#define x                    r(1)
#define L_0                  L(0)
#define z                    r(3)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define M_z                  M(3)
#define L_z                  L(3)
#define L_xx                 L(4)
#define M_xx                 M(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define L_xz                 L(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define L_yz                 L(8)
#define M_yz                 M(8)
#define L_xxx                L(9)
#define M_xxx                M(9)
#define L_xxy                L(10)
#define M_xxy                M(10)
#define L_xxz                L(11)
#define M_xxz                M(11)
#define L_xyy                L(12)
#define M_xyy                M(12)
#define L_xyz                L(13)
#define M_xyz                M(13)
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
#define M_xxyz               M(20)
#define L_xxyz               L(20)
#define M_xyyy               M(21)
#define L_xyyy               L(21)
#define L_xyyz               L(22)
#define M_xyyz               M(22)
#define L_yyyy               L(23)
#define M_yyyy               M(23)
#define L_yyyz               L(24)
#define M_yyyz               M(24)
#define L_xxxxx              L(25)
#define M_xxxxx              M(25)
#define M_xxxxy              M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define M_xxxyy              M(28)
#define L_xxxyy              L(28)
#define M_xxxyz              M(29)
#define L_xxxyz              L(29)
#define L_xxyyy              L(30)
#define M_xxyyy              M(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define L_xyyyy              L(32)
#define M_xyyyy              M(32)
#define M_xyyyz              M(33)
#define L_xyyyz              L(33)
#define M_yyyyy              M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_yyyyz              M(35)
#define L_xxxxxx             L(36)
#define M_xxxxxx             M(36)
#define L_xxxxxy             L(37)
#define M_xxxxxy             M(37)
#define M_xxxxxz             M(38)
#define L_xxxxxz             L(38)
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
#define L_xxyyyz             L(44)
#define M_xxyyyz             M(44)
#define L_xyyyyy             L(45)
#define M_xyyyyy             M(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define L_yyyyyy             L(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define L_yyyyyz             L(48)
#define L_xxxxxxx            L(49)
#define M_xxxxxxx            M(49)
#define M_xxxxxxy            M(50)
#define L_xxxxxxy            L(50)
#define M_xxxxxxz            M(51)
#define L_xxxxxxz            L(51)
#define M_xxxxxyy            M(52)
#define L_xxxxxyy            L(52)
#define M_xxxxxyz            M(53)
#define L_xxxxxyz            L(53)
#define M_xxxxyyy            M(54)
#define L_xxxxyyy            L(54)
#define L_xxxxyyz            L(55)
#define M_xxxxyyz            M(55)
#define M_xxxyyyy            M(56)
#define L_xxxyyyy            L(56)
#define M_xxxyyyz            M(57)
#define L_xxxyyyz            L(57)
#define L_xxyyyyy            L(58)
#define M_xxyyyyy            M(58)
#define M_xxyyyyz            M(59)
#define L_xxyyyyz            L(59)
#define M_xyyyyyy            M(60)
#define L_xyyyyyy            L(60)
#define M_xyyyyyz            M(61)
#define L_xyyyyyz            L(61)
#define M_yyyyyyy            M(62)
#define L_yyyyyyy            L(62)
#define L_yyyyyyz            L(63)
#define M_yyyyyyz            M(63)
    v323      = y*z
    v324      = 945.0d0*x
    v316      = 15.0d0*v323
    v320      = v323
    v61       = v324
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
    v218      = 0.00138888888888889d0*M_xxxxxx
    v219      = 0.00833333333333333d0*M_xxxxxy
    v220      = 0.00833333333333333d0*M_xxxxxz
    v221      = 0.0208333333333333d0*M_xxxxyy
    v222      = 0.0416666666666667d0*M_xxxxyz
    v224      = 0.0277777777777778d0*M_xxxyyy
    v225      = 0.0833333333333333d0*M_xxxyyz
    v228      = 0.0208333333333333d0*M_xxyyyy
    v229      = 0.0833333333333333d0*M_xxyyyz
    v261      = 0.5d0*M_yy
    v263      = 0.166666666666667d0*M_yyy
    v264      = 0.5d0*M_yyz
    v268      = 0.0416666666666667d0*M_yyyy
    v269      = 0.166666666666667d0*M_yyyz
    v276      = 0.00833333333333333d0*M_yyyyy
    v277      = 0.0416666666666667d0*M_yyyyz
    v287      = 0.00138888888888889d0*M_yyyyyy
    v288      = 0.00833333333333333d0*M_yyyyyz
    M_zz      = -(M_xx + M_yy)
    v301      = 0.5d0*M_zz
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    v302      = 0.166666666666667d0*M_zzz
    M_xxzz    = -(M_xxxx + M_xxyy)
    v117      = 0.25d0*M_xxzz
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v270      = 0.25d0*M_yyzz
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    v303      = 0.0416666666666667d0*M_zzzz
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
    v278      = 0.0833333333333333d0*M_yyyzz
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v279      = 0.0833333333333333d0*M_yyzzz
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    v304      = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    v223      = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    v226      = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    v227      = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    v230      = 0.125d0*M_xxyyzz
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    v231      = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    v232      = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    v289      = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v290      = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v291      = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    v305      = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz = -(M_xxzzzzz + M_yyzzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v306      = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v306
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
    v307      = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v307
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
    v308      = 3.0d0*h
    v309      = h*v0
    v310      = h*v1
    v311      = h*v19
    v312      = h*v31
    v4        = -h
    v12       = v308
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v309
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v310
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v309
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 - 945.0d0*v31 + 630.0d0*v310
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v311
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v309
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v312
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v86       = -18.0d0*v51 + v46 + v79
    v87       = 66.0d0*v57
    v322      = -v87
    v88       = 9.0d0*v17
    v89       = 198.0d0*v57
    v101      = h*v67
    v102      = -18.0d0*v65 + v101 + v46
    v179      = v178 + v47 - 135.0d0*v65 + 495.0d0*v70
    u2        = 1.0/h
    u         = sqrt(u2)
    D_0       = u
    u3        = u*u2
    v2        = u3
    D_x       = -v2*x
    D_y       = -v2*y
    D_z       = -v2*z
    u4        = u2*u2
    u5        = u2*u3
    v3        = u5
    v313      = 3.0d0*v3
    v6        = v313*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v313*v320
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v314      = 3.0d0*v8
    v9        = v8*x
    v11       = v314*(h - v10)
    D_xxx     = -3.0d0*v9*(v306 - v308)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    v233      = 0.5d0*D_xyy
    D_xyz     = -v316*v9
    D_xzz     = -(D_xxx + D_xyy)
    v248      = 0.5d0*D_xzz
    D_yyy     = v314*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    v292      = 0.5d0*D_yzz
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v315      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v315*y
    v26       = v315*z
    v28       = v15*v316
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v159      = 0.5d0*D_xxyy
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    v169      = 0.5d0*D_xxzz
    D_xyyy    = v22*v30
    v199      = 0.5d0*D_xyyy
    v234      = 0.166666666666667d0*D_xyyy
    D_xyyz    = v26*(v29 + v4)
    v244      = 0.5d0*D_xyyz
    D_xyzz    = -(D_xxxy + D_xyyy)
    v209      = 0.5d0*D_xyzz
    D_xzzz    = -(D_xxxz + D_xyyz)
    v249      = 0.166666666666667d0*D_xzzz
    v257      = 0.5d0*D_xzzz
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    v280      = 0.5d0*D_yyzz
    D_yzzz    = -(D_xxyz + D_yyyz)
    v293      = 0.166666666666667d0*D_yzzz
    v297      = 0.5d0*D_yzzz
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v317      = 15.0d0*v34
    v318      = v34*z
    v35       = v317*x
    v39       = v318
    v41       = 315.0d0*v318*x*y
    v42       = v317*y
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
    D_xxyyz   = v39*(v36 - 945.0d0*v307 + 105.0d0*(v309 + v310))
    v166      = 0.5d0*D_xxyyz
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    v144      = 0.5d0*D_xxyzz
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    v170      = 0.166666666666667d0*D_xxzzz
    v175      = 0.5d0*D_xxzzz
    D_xyyyy   = v34*v43*x
    v188      = 0.5d0*D_xyyyy
    v200      = 0.166666666666667d0*D_xyyyy
    v235      = 0.0416666666666667d0*D_xyyyy
    D_xyyyz   = v41*(h - v7)
    v206      = 0.5d0*D_xyyyz
    v241      = 0.166666666666667d0*D_xyyyz
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    v194      = 0.5d0*D_xyyzz
    v245      = 0.25d0*D_xyyzz
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    v210      = 0.166666666666667d0*D_xyzzz
    v215      = 0.5d0*D_xyzzz
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    v250      = 0.0416666666666667d0*D_xzzzz
    v258      = 0.166666666666667d0*D_xzzzz
    D_yyyyy   = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz   = v39*v43
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    v271      = 0.5d0*D_yyyzz
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    v281      = 0.166666666666667d0*D_yyzzz
    v284      = 0.5d0*D_yyzzz
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    v294      = 0.0416666666666667d0*D_yzzzz
    v298      = 0.166666666666667d0*D_yzzzz
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    u12       = u6*u6
    u13       = u6*u7
    v44       = u13
    v325      = 315.0d0*v44
    v319      = v325*x
    v45       = 45.0d0*v44
    v52       = v319*y
    v56       = v319*z
    v60       = v320*v325
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy  = v52*v55
    D_xxxxxz  = v55*v56
    D_xxxxyy  = v45*(v58 + v17*v29 - 21.0d0*v311 + 14.0d0*v51 + 231.0d0*v59)
    v95       = 0.5d0*D_xxxxyy
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    v98       = 0.5d0*D_xxxxzz
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    v106      = 0.5d0*D_xxxyyy
    v119      = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    v122      = 0.5d0*D_xxxyyz
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    v109      = 0.5d0*D_xxxyzz
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    v125      = 0.166666666666667d0*D_xxxzzz
    v127      = 0.5d0*D_xxxzzz
    D_xxyyyy  = v45*(v58 + v17*v24 - 21.0d0*v312 + 14.0d0*v65 + 231.0d0*v66)
    v132      = 0.5d0*D_xxyyyy
    v139      = 0.166666666666667d0*D_xxyyyy
    v161      = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    v142      = 0.5d0*D_xxyyyz
    v164      = 0.166666666666667d0*D_xxyyyz
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
    v182      = 0.5d0*D_xyyyyy
    v189      = 0.166666666666667d0*D_xyyyyy
    v201      = 0.0416666666666667d0*D_xyyyyy
    v236      = 0.00833333333333333d0*D_xyyyyy
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    v192      = 0.5d0*D_xyyyyz
    v204      = 0.166666666666667d0*D_xyyyyz
    v239      = 0.0416666666666667d0*D_xyyyyz
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    v185      = 0.5d0*D_xyyyzz
    v207      = 0.25d0*D_xyyyzz
    v242      = 0.0833333333333333d0*D_xyyyzz
    v254      = 0.166666666666667d0*D_xyyyzz
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    v195      = 0.166666666666667d0*D_xyyzzz
    v197      = 0.5d0*D_xyyzzz
    v246      = 0.0833333333333333d0*D_xyyzzz
    v255      = 0.25d0*D_xyyzzz
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    v211      = 0.0416666666666667d0*D_xyzzzz
    v216      = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    v251      = 0.00833333333333333d0*D_xzzzzz
    v259      = 0.0416666666666667d0*D_xzzzzz
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    D_yyyyyz  = v60*v68
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    v265      = 0.5d0*D_yyyyzz
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    v272      = 0.166666666666667d0*D_yyyzzz
    v274      = 0.5d0*D_yyyzzz
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    v282      = 0.0416666666666667d0*D_yyzzzz
    v285      = 0.166666666666667d0*D_yyzzzz
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    v295      = 0.00833333333333333d0*D_yzzzzz
    v299      = 0.0416666666666667d0*D_yzzzzz
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v321      = 315.0d0*v71
    v72       = v321*x
    v75       = v321*y
    v77       = v321*z
    v81       = v320*v324*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = v75*v76
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = v76*v77
    L_xxxxxx  = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    v84       = 0.5d0*D_xxxxxyy
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxy  = D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    v85       = 0.5d0*D_xxxxxzz
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*v83 + D_xxxxxxy*M_xy + D_xxxxxxz* &
      M_xz + D_xxxxxy*M_y + D_xxxxxyz*M_yz + D_xxxxxz*M_z + M_yy*v84 + &
      M_zz*v85
    L_xxxxxz  = D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z
    D_xxxxyyy = -945.0d0*v71*y*(v322 + v1*v18 + v1*v82 - v86)
    v90       = 0.5d0*D_xxxxyyy
    v96       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = v77*(-v1*v88 + v80 + v86 + v89)
    v97       = 0.5d0*D_xxxxyyz
    L_xxxxyy  = D_xxxxxyy*M_x + D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyz*M_z
    L_xxxxyyz = D_xxxxyyz*M_0
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    v91       = 0.5d0*D_xxxxyzz
    L_xxxxy   = D_xxxxxxy*v83 + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + D_xxxxy &
      *M_0 + D_xxxxyy*M_y + D_xxxxyyz*M_yz + D_xxxxyz*M_z + M_yy*v90 + &
      M_zz*v91
    L_xxxxyz  = D_xxxxxyz*M_x + D_xxxxyyz*M_y + D_xxxxyz*M_0 + D_xxxxyzz*M_z
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    v99       = 0.166666666666667d0*D_xxxxzzz
    v100      = 0.5d0*D_xxxxzzz
    L_xxxx    = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v83 + D_xxxxxxx*v92 + D_xxxxxxy*v93 &
      + D_xxxxxxz*v94 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_xyy*v84 + M_xzz* &
      v85 + M_yy*v95 + M_yyy*v96 + M_yyz*v97 + M_yzz*v91 + M_zz*v98 + &
      M_zzz*v99
    L_xxxxz   = D_xxxxxxz*v83 + D_xxxxxyz*M_xy + D_xxxxxz*M_x + D_xxxxxzz*M_xz + &
      D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + D_xxxxzz*M_z + M_yy &
      *v97 + M_zz*v100
    D_xxxyyyy = -v61*v71*(v322 + v0*v103 + v0*v18 - v102)
    v104      = 0.5d0*D_xxxyyyy
    v107      = 0.166666666666667d0*D_xxxyyyy
    v120      = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v88))
    v108      = 0.5d0*D_xxxyyyz
    v121      = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyy  = D_xxxxyyy*M_x + D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyz*M_z
    L_xxxyyyz = D_xxxyyyz*M_0
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    v105      = 0.5d0*D_xxxyyzz
    v123      = 0.25d0*D_xxxyyzz
    L_xxxyy   = D_xxxxxyy*v83 + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + D_xxxyy &
      *M_0 + D_xxxyyy*M_y + D_xxxyyyz*M_yz + D_xxxyyz*M_z + M_yy*v104 + &
      M_zz*v105
    L_xxxyyz  = D_xxxxyyz*M_x + D_xxxyyyz*M_y + D_xxxyyz*M_0 + D_xxxyyzz*M_z
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    v110      = 0.166666666666667d0*D_xxxyzzz
    v111      = 0.5d0*D_xxxyzzz
    L_xxxy    = D_xxxxxxy*v92 + D_xxxxxy*v83 + D_xxxxxyy*v93 + D_xxxxxyz*v94 + D_xxxxy* &
      M_x + D_xxxxyy*M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy* &
      M_0 + D_xxxyy*M_y + D_xxxyyz*M_yz + D_xxxyz*M_z + M_xyy*v90 + &
      M_xzz*v91 + M_yy*v106 + M_yyy*v107 + M_yyz*v108 + M_yzz*v105 + &
      M_zz*v109 + M_zzz*v110
    L_xxxyz   = D_xxxxxyz*v83 + D_xxxxyyz*M_xy + D_xxxxyz*M_x + D_xxxxyzz*M_xz + &
      D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + D_xxxyzz*M_z + M_yy &
      *v108 + M_zz*v111
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    v126      = 0.0416666666666667d0*D_xxxzzzz
    v128      = 0.166666666666667d0*D_xxxzzzz
    L_xxx     = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v83 + D_xxxxxx*v92 + D_xxxxxxx*v112 + &
      D_xxxxxxy*v113 + D_xxxxxxz*v114 + D_xxxxxy*v93 + D_xxxxxyy*v115 + &
      D_xxxxxyz*v116 + D_xxxxxz*v94 + D_xxxxxzz*v117 + D_xxxxy*M_xy + &
      D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxy*M_y + D_xxxyz*M_yz + &
      D_xxxz*M_z + M_xyy*v95 + M_xyyy*v96 + M_xyyz*v97 + M_xyzz*v91 + &
      M_xzz*v98 + M_xzzz*v99 + M_yy*v118 + M_yyy*v119 + M_yyyy*v120 + &
      M_yyyz*v121 + M_yyz*v122 + M_yyzz*v123 + M_yzz*v109 + M_yzzz*v110 &
      + M_zz*v124 + M_zzz*v125 + M_zzzz*v126
    L_xxxz    = D_xxxxxxz*v92 + D_xxxxxyz*v93 + D_xxxxxz*v83 + D_xxxxxzz*v94 + D_xxxxyz* &
      M_xy + D_xxxxyzz*M_xyz + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz* &
      M_y + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_xyy*v97 + &
      M_xzz*v100 + M_yy*v122 + M_yyy*v121 + M_yyz*v105 + M_yzz*v111 + &
      M_zz*v127 + M_zzz*v128
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
    L_xxyyyy  = D_xxxyyyy*M_x + D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyz*M_z
    L_xxyyyyz = D_xxyyyyz*M_0
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    v131      = 0.5d0*D_xxyyyzz
    v143      = 0.25d0*D_xxyyyzz
    v165      = 0.0833333333333333d0*D_xxyyyzz
    v173      = 0.166666666666667d0*D_xxyyyzz
    L_xxyyy   = D_xxxxyyy*v83 + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + D_xxyyy &
      *M_0 + D_xxyyyy*M_y + D_xxyyyyz*M_yz + D_xxyyyz*M_z + M_yy*v130 + &
      M_zz*v131
    L_xxyyyz  = D_xxxyyyz*M_x + D_xxyyyyz*M_y + D_xxyyyz*M_0 + D_xxyyyzz*M_z
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    v136      = 0.166666666666667d0*D_xxyyzzz
    v137      = 0.5d0*D_xxyyzzz
    v168      = 0.0833333333333333d0*D_xxyyzzz
    v174      = 0.25d0*D_xxyyzzz
    L_xxyy    = D_xxxxxyy*v92 + D_xxxxyy*v83 + D_xxxxyyy*v93 + D_xxxxyyz*v94 + D_xxxyy* &
      M_x + D_xxxyyy*M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy* &
      M_0 + D_xxyyy*M_y + D_xxyyyz*M_yz + D_xxyyz*M_z + M_xyy*v104 + &
      M_xzz*v105 + M_yy*v132 + M_yyy*v133 + M_yyz*v134 + M_yzz*v131 + &
      M_zz*v135 + M_zzz*v136
    L_xxyyz   = D_xxxxyyz*v83 + D_xxxyyyz*M_xy + D_xxxyyz*M_x + D_xxxyyzz*M_xz + &
      D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + D_xxyyzz*M_z + M_yy &
      *v134 + M_zz*v137
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    v146      = 0.0416666666666667d0*D_xxyzzzz
    v148      = 0.166666666666667d0*D_xxyzzzz
    L_xxy     = D_xxxxxxy*v112 + D_xxxxxy*v92 + D_xxxxxyy*v113 + D_xxxxxyz*v114 + &
      D_xxxxy*v83 + D_xxxxyy*v93 + D_xxxxyyy*v115 + D_xxxxyyz*v116 + &
      D_xxxxyz*v94 + D_xxxxyzz*v117 + D_xxxy*M_x + D_xxxyy*M_xy + &
      D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyz* &
      M_yz + D_xxyz*M_z + M_xyy*v106 + M_xyyy*v107 + M_xyyz*v108 + &
      M_xyzz*v105 + M_xzz*v109 + M_xzzz*v110 + M_yy*v138 + M_yyy*v139 + &
      M_yyyy*v140 + M_yyyz*v141 + M_yyz*v142 + M_yyzz*v143 + M_yzz*v135 &
      + M_yzzz*v136 + M_zz*v144 + M_zzz*v145 + M_zzzz*v146
    L_xxyz    = D_xxxxxyz*v92 + D_xxxxyyz*v93 + D_xxxxyz*v83 + D_xxxxyzz*v94 + D_xxxyyz* &
      M_xy + D_xxxyyzz*M_xyz + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz* &
      M_y + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_xyy*v108 + &
      M_xzz*v111 + M_yy*v142 + M_yyy*v141 + M_yyz*v131 + M_yzz*v137 + &
      M_zz*v147 + M_zzz*v148
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    v172      = 0.00833333333333333d0*D_xxzzzzz
    v177      = 0.0416666666666667d0*D_xxzzzzz
    L_xx      = D_xx*M_0 + D_xxx*M_x + D_xxxx*v83 + D_xxxxx*v92 + D_xxxxxx*v112 + &
      D_xxxxxxx*v149 + D_xxxxxxy*v150 + D_xxxxxxz*v151 + D_xxxxxy*v113 &
      + D_xxxxxyy*v152 + D_xxxxxyz*v153 + D_xxxxxz*v114 + D_xxxxxzz* &
      v154 + D_xxxxy*v93 + D_xxxxyy*v115 + D_xxxxyyy*v155 + D_xxxxyyz* &
      v156 + D_xxxxyz*v116 + D_xxxxyzz*v157 + D_xxxxz*v94 + D_xxxxzz* &
      v117 + D_xxxxzzz*v158 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz &
      + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + M_xyy*v118 + M_xyyy*v119 &
      + M_xyyyy*v120 + M_xyyyz*v121 + M_xyyz*v122 + M_xyyzz*v123 + &
      M_xyzz*v109 + M_xyzzz*v110 + M_xzz*v124 + M_xzzz*v125 + M_xzzzz* &
      v126 + M_yy*v159 + M_yyy*v160 + M_yyyy*v161 + M_yyyyy*v162 + &
      M_yyyyz*v163 + M_yyyz*v164 + M_yyyzz*v165 + M_yyz*v166 + M_yyzz* &
      v167 + M_yyzzz*v168 + M_yzz*v144 + M_yzzz*v145 + M_yzzzz*v146 + &
      M_zz*v169 + M_zzz*v170 + M_zzzz*v171 + M_zzzzz*v172
    L_xxz     = D_xxxxxxz*v112 + D_xxxxxyz*v113 + D_xxxxxz*v92 + D_xxxxxzz*v114 + &
      D_xxxxyyz*v115 + D_xxxxyz*v93 + D_xxxxyzz*v116 + D_xxxxz*v83 + &
      D_xxxxzz*v94 + D_xxxxzzz*v117 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + &
      D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 &
      + D_xxzz*M_z + M_xyy*v122 + M_xyyy*v121 + M_xyyz*v105 + M_xyzz* &
      v111 + M_xzz*v127 + M_xzzz*v128 + M_yy*v166 + M_yyy*v164 + M_yyyy &
      *v163 + M_yyyz*v173 + M_yyz*v135 + M_yyzz*v174 + M_yzz*v147 + &
      M_yzzz*v148 + M_zz*v175 + M_zzz*v176 + M_zzzz*v177
    D_xyyyyyy = v179*v72
    v180      = 0.5d0*D_xyyyyyy
    v183      = 0.166666666666667d0*D_xyyyyyy
    v190      = 0.0416666666666667d0*D_xyyyyyy
    v202      = 0.00833333333333333d0*D_xyyyyyy
    v237      = 0.00138888888888889d0*D_xyyyyyy
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = v81*(v36 - v103 + 110.0d0*v32)
    v184      = 0.5d0*D_xyyyyyz
    v191      = 0.166666666666667d0*D_xyyyyyz
    v203      = 0.0416666666666667d0*D_xyyyyyz
    v238      = 0.00833333333333333d0*D_xyyyyyz
    L_xyyyyy  = D_xxyyyyy*M_x + D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyz*M_z
    L_xyyyyyz = D_xyyyyyz*M_0
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    v181      = 0.5d0*D_xyyyyzz
    v193      = 0.25d0*D_xyyyyzz
    v205      = 0.0833333333333333d0*D_xyyyyzz
    v213      = 0.166666666666667d0*D_xyyyyzz
    v240      = 0.0208333333333333d0*D_xyyyyzz
    v253      = 0.0416666666666667d0*D_xyyyyzz
    L_xyyyy   = D_xxxyyyy*v83 + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + D_xyyyy &
      *M_0 + D_xyyyyy*M_y + D_xyyyyyz*M_yz + D_xyyyyz*M_z + M_yy*v180 + &
      M_zz*v181
    L_xyyyyz  = D_xxyyyyz*M_x + D_xyyyyyz*M_y + D_xyyyyz*M_0 + D_xyyyyzz*M_z
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    v186      = 0.166666666666667d0*D_xyyyzzz
    v187      = 0.5d0*D_xyyyzzz
    v208      = 0.0833333333333333d0*D_xyyyzzz
    v214      = 0.25d0*D_xyyyzzz
    v243      = 0.0277777777777778d0*D_xyyyzzz
    L_xyyy    = D_xxxxyyy*v92 + D_xxxyyy*v83 + D_xxxyyyy*v93 + D_xxxyyyz*v94 + D_xxyyy* &
      M_x + D_xxyyyy*M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy* &
      M_0 + D_xyyyy*M_y + D_xyyyyz*M_yz + D_xyyyz*M_z + M_xyy*v130 + &
      M_xzz*v131 + M_yy*v182 + M_yyy*v183 + M_yyz*v184 + M_yzz*v181 + &
      M_zz*v185 + M_zzz*v186
    L_xyyyz   = D_xxxyyyz*v83 + D_xxyyyyz*M_xy + D_xxyyyz*M_x + D_xxyyyzz*M_xz + &
      D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + D_xyyyzz*M_z + M_yy &
      *v184 + M_zz*v187
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    v196      = 0.0416666666666667d0*D_xyyzzzz
    v198      = 0.166666666666667d0*D_xyyzzzz
    v247      = 0.0208333333333333d0*D_xyyzzzz
    v256      = 0.0833333333333333d0*D_xyyzzzz
    L_xyy     = D_xxxxxyy*v112 + D_xxxxyy*v92 + D_xxxxyyy*v113 + D_xxxxyyz*v114 + &
      D_xxxyy*v83 + D_xxxyyy*v93 + D_xxxyyyy*v115 + D_xxxyyyz*v116 + &
      D_xxxyyz*v94 + D_xxxyyzz*v117 + D_xxyy*M_x + D_xxyyy*M_xy + &
      D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyz* &
      M_yz + D_xyyz*M_z + M_xyy*v132 + M_xyyy*v133 + M_xyyz*v134 + &
      M_xyzz*v131 + M_xzz*v135 + M_xzzz*v136 + M_yy*v188 + M_yyy*v189 + &
      M_yyyy*v190 + M_yyyz*v191 + M_yyz*v192 + M_yyzz*v193 + M_yzz*v185 &
      + M_yzzz*v186 + M_zz*v194 + M_zzz*v195 + M_zzzz*v196
    L_xyyz    = D_xxxxyyz*v92 + D_xxxyyyz*v93 + D_xxxyyz*v83 + D_xxxyyzz*v94 + D_xxyyyz* &
      M_xy + D_xxyyyzz*M_xyz + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz* &
      M_y + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_xyy*v134 + &
      M_xzz*v137 + M_yy*v192 + M_yyy*v191 + M_yyz*v181 + M_yzz*v187 + &
      M_zz*v197 + M_zzz*v198
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    v212      = 0.00833333333333333d0*D_xyzzzzz
    v217      = 0.0416666666666667d0*D_xyzzzzz
    L_xy      = D_xxxxxxy*v149 + D_xxxxxy*v112 + D_xxxxxyy*v150 + D_xxxxxyz*v151 + &
      D_xxxxy*v92 + D_xxxxyy*v113 + D_xxxxyyy*v152 + D_xxxxyyz*v153 + &
      D_xxxxyz*v114 + D_xxxxyzz*v154 + D_xxxy*v83 + D_xxxyy*v93 + &
      D_xxxyyy*v115 + D_xxxyyyy*v155 + D_xxxyyyz*v156 + D_xxxyyz*v116 + &
      D_xxxyyzz*v157 + D_xxxyz*v94 + D_xxxyzz*v117 + D_xxxyzzz*v158 + &
      D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 &
      + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v138 + M_xyyy*v139 &
      + M_xyyyy*v140 + M_xyyyz*v141 + M_xyyz*v142 + M_xyyzz*v143 + &
      M_xyzz*v135 + M_xyzzz*v136 + M_xzz*v144 + M_xzzz*v145 + M_xzzzz* &
      v146 + M_yy*v199 + M_yyy*v200 + M_yyyy*v201 + M_yyyyy*v202 + &
      M_yyyyz*v203 + M_yyyz*v204 + M_yyyzz*v205 + M_yyz*v206 + M_yyzz* &
      v207 + M_yyzzz*v208 + M_yzz*v194 + M_yzzz*v195 + M_yzzzz*v196 + &
      M_zz*v209 + M_zzz*v210 + M_zzzz*v211 + M_zzzzz*v212
    L_xyz     = D_xxxxxyz*v112 + D_xxxxyyz*v113 + D_xxxxyz*v92 + D_xxxxyzz*v114 + &
      D_xxxyyyz*v115 + D_xxxyyz*v93 + D_xxxyyzz*v116 + D_xxxyz*v83 + &
      D_xxxyzz*v94 + D_xxxyzzz*v117 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + &
      D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 &
      + D_xyzz*M_z + M_xyy*v142 + M_xyyy*v141 + M_xyyz*v131 + M_xyzz* &
      v137 + M_xzz*v147 + M_xzzz*v148 + M_yy*v206 + M_yyy*v204 + M_yyyy &
      *v203 + M_yyyz*v213 + M_yyz*v185 + M_yyzz*v214 + M_yzz*v197 + &
      M_yzzz*v198 + M_zz*v215 + M_zzz*v216 + M_zzzz*v217
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    v252      = 0.00138888888888889d0*D_xzzzzzz
    v260      = 0.00833333333333333d0*D_xzzzzzz
    L_x       = D_x*M_0 + D_xx*M_x + D_xxx*v83 + D_xxxx*v92 + D_xxxxx*v112 + D_xxxxxx* &
      v149 + D_xxxxxxx*v218 + D_xxxxxxy*v219 + D_xxxxxxz*v220 + &
      D_xxxxxy*v150 + D_xxxxxyy*v221 + D_xxxxxyz*v222 + D_xxxxxz*v151 + &
      D_xxxxxzz*v223 + D_xxxxy*v113 + D_xxxxyy*v152 + D_xxxxyyy*v224 + &
      D_xxxxyyz*v225 + D_xxxxyz*v153 + D_xxxxyzz*v226 + D_xxxxz*v114 + &
      D_xxxxzz*v154 + D_xxxxzzz*v227 + D_xxxy*v93 + D_xxxyy*v115 + &
      D_xxxyyy*v155 + D_xxxyyyy*v228 + D_xxxyyyz*v229 + D_xxxyyz*v156 + &
      D_xxxyyzz*v230 + D_xxxyz*v116 + D_xxxyzz*v157 + D_xxxyzzz*v231 + &
      D_xxxz*v94 + D_xxxzz*v117 + D_xxxzzz*v158 + D_xxxzzzz*v232 + &
      D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + &
      D_xz*M_z + M_xyy*v159 + M_xyyy*v160 + M_xyyyy*v161 + M_xyyyyy* &
      v162 + M_xyyyyz*v163 + M_xyyyz*v164 + M_xyyyzz*v165 + M_xyyz*v166 &
      + M_xyyzz*v167 + M_xyyzzz*v168 + M_xyzz*v144 + M_xyzzz*v145 + &
      M_xyzzzz*v146 + M_xzz*v169 + M_xzzz*v170 + M_xzzzz*v171 + &
      M_xzzzzz*v172 + M_yy*v233 + M_yyy*v234 + M_yyyy*v235 + M_yyyyy* &
      v236 + M_yyyyyy*v237 + M_yyyyyz*v238 + M_yyyyz*v239 + M_yyyyzz* &
      v240 + M_yyyz*v241 + M_yyyzz*v242 + M_yyyzzz*v243 + M_yyz*v244 + &
      M_yyzz*v245 + M_yyzzz*v246 + M_yyzzzz*v247 + M_yzz*v209 + M_yzzz* &
      v210 + M_yzzzz*v211 + M_yzzzzz*v212 + M_zz*v248 + M_zzz*v249 + &
      M_zzzz*v250 + M_zzzzz*v251 + M_zzzzzz*v252
    L_xz      = D_xxxxxxz*v149 + D_xxxxxyz*v150 + D_xxxxxz*v112 + D_xxxxxzz*v151 + &
      D_xxxxyyz*v152 + D_xxxxyz*v113 + D_xxxxyzz*v153 + D_xxxxz*v92 + &
      D_xxxxzz*v114 + D_xxxxzzz*v154 + D_xxxyyyz*v155 + D_xxxyyz*v115 + &
      D_xxxyyzz*v156 + D_xxxyz*v93 + D_xxxyzz*v116 + D_xxxyzzz*v157 + &
      D_xxxz*v83 + D_xxxzz*v94 + D_xxxzzz*v117 + D_xxxzzzz*v158 + &
      D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y &
      + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + M_xyy*v166 + M_xyyy*v164 + &
      M_xyyyy*v163 + M_xyyyz*v173 + M_xyyz*v135 + M_xyyzz*v174 + M_xyzz &
      *v147 + M_xyzzz*v148 + M_xzz*v175 + M_xzzz*v176 + M_xzzzz*v177 + &
      M_yy*v244 + M_yyy*v241 + M_yyyy*v239 + M_yyyyy*v238 + M_yyyyz* &
      v253 + M_yyyz*v254 + M_yyyzz*v208 + M_yyz*v194 + M_yyzz*v255 + &
      M_yyzzz*v256 + M_yzz*v215 + M_yzzz*v216 + M_yzzzz*v217 + M_zz* &
      v257 + M_zzz*v258 + M_zzzz*v259 + M_zzzzz*v260
    D_yyyyyyy = v75*(v178 + v73 - 315.0d0*v65 + 693.0d0*v70)
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = v179*v77
    L_yyyyyy  = D_xyyyyyy*M_x + D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyz*M_z
    L_yyyyyyz = D_yyyyyyz*M_0
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    v262      = 0.5d0*D_yyyyyzz
    L_yyyyy   = D_xxyyyyy*v83 + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + D_yyyyy &
      *M_0 + D_yyyyyy*M_y + D_yyyyyyy*v261 + D_yyyyyyz*M_yz + D_yyyyyz* &
      M_z + M_zz*v262
    L_yyyyyz  = D_xyyyyyz*M_x + D_yyyyyyz*M_y + D_yyyyyz*M_0 + D_yyyyyzz*M_z
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    v266      = 0.166666666666667d0*D_yyyyzzz
    v267      = 0.5d0*D_yyyyzzz
    L_yyyy    = D_xxxyyyy*v92 + D_xxyyyy*v83 + D_xxyyyyy*v93 + D_xxyyyyz*v94 + D_xyyyy* &
      M_x + D_xyyyyy*M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy* &
      M_0 + D_yyyyy*M_y + D_yyyyyy*v261 + D_yyyyyyy*v263 + D_yyyyyyz* &
      v264 + D_yyyyyz*M_yz + D_yyyyz*M_z + M_xyy*v180 + M_xzz*v181 + &
      M_yzz*v262 + M_zz*v265 + M_zzz*v266
    L_yyyyz   = D_xxyyyyz*v83 + D_xyyyyyz*M_xy + D_xyyyyz*M_x + D_xyyyyzz*M_xz + &
      D_yyyyyyz*v261 + D_yyyyyz*M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + &
      D_yyyyzz*M_z + M_zz*v267
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    v273      = 0.0416666666666667d0*D_yyyzzzz
    v275      = 0.166666666666667d0*D_yyyzzzz
    L_yyy     = D_xxxxyyy*v112 + D_xxxyyy*v92 + D_xxxyyyy*v113 + D_xxxyyyz*v114 + &
      D_xxyyy*v83 + D_xxyyyy*v93 + D_xxyyyyy*v115 + D_xxyyyyz*v116 + &
      D_xxyyyz*v94 + D_xxyyyzz*v117 + D_xyyy*M_x + D_xyyyy*M_xy + &
      D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy* &
      v261 + D_yyyyyy*v263 + D_yyyyyyy*v268 + D_yyyyyyz*v269 + D_yyyyyz &
      *v264 + D_yyyyyzz*v270 + D_yyyyz*M_yz + D_yyyz*M_z + M_xyy*v182 + &
      M_xyyy*v183 + M_xyyz*v184 + M_xyzz*v181 + M_xzz*v185 + M_xzzz* &
      v186 + M_yzz*v265 + M_yzzz*v266 + M_zz*v271 + M_zzz*v272 + M_zzzz &
      *v273
    L_yyyz    = D_xxxyyyz*v92 + D_xxyyyyz*v93 + D_xxyyyz*v83 + D_xxyyyzz*v94 + D_xyyyyz* &
      M_xy + D_xyyyyzz*M_xyz + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyyz* &
      v263 + D_yyyyyz*v261 + D_yyyyyzz*v264 + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzz*M_z + M_xyy*v184 + M_xzz*v187 + M_yzz &
      *v267 + M_zz*v274 + M_zzz*v275
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    v283      = 0.00833333333333333d0*D_yyzzzzz
    v286      = 0.0416666666666667d0*D_yyzzzzz
    L_yy      = D_xxxxxyy*v149 + D_xxxxyy*v112 + D_xxxxyyy*v150 + D_xxxxyyz*v151 + &
      D_xxxyy*v92 + D_xxxyyy*v113 + D_xxxyyyy*v152 + D_xxxyyyz*v153 + &
      D_xxxyyz*v114 + D_xxxyyzz*v154 + D_xxyy*v83 + D_xxyyy*v93 + &
      D_xxyyyy*v115 + D_xxyyyyy*v155 + D_xxyyyyz*v156 + D_xxyyyz*v116 + &
      D_xxyyyzz*v157 + D_xxyyz*v94 + D_xxyyzz*v117 + D_xxyyzzz*v158 + &
      D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 &
      + D_yyy*M_y + D_yyyy*v261 + D_yyyyy*v263 + D_yyyyyy*v268 + &
      D_yyyyyyy*v276 + D_yyyyyyz*v277 + D_yyyyyz*v269 + D_yyyyyzz*v278 &
      + D_yyyyz*v264 + D_yyyyzz*v270 + D_yyyyzzz*v279 + D_yyyz*M_yz + &
      D_yyz*M_z + M_xyy*v188 + M_xyyy*v189 + M_xyyyy*v190 + M_xyyyz* &
      v191 + M_xyyz*v192 + M_xyyzz*v193 + M_xyzz*v185 + M_xyzzz*v186 + &
      M_xzz*v194 + M_xzzz*v195 + M_xzzzz*v196 + M_yzz*v271 + M_yzzz* &
      v272 + M_yzzzz*v273 + M_zz*v280 + M_zzz*v281 + M_zzzz*v282 + &
      M_zzzzz*v283
    L_yyz     = D_xxxxyyz*v112 + D_xxxyyyz*v113 + D_xxxyyz*v92 + D_xxxyyzz*v114 + &
      D_xxyyyyz*v115 + D_xxyyyz*v93 + D_xxyyyzz*v116 + D_xxyyz*v83 + &
      D_xxyyzz*v94 + D_xxyyzzz*v117 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + &
      D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyyyz*v268 + D_yyyyyz*v263 + &
      D_yyyyyzz*v269 + D_yyyyz*v261 + D_yyyyzz*v264 + D_yyyyzzz*v270 + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_xyy*v192 + &
      M_xyyy*v191 + M_xyyz*v181 + M_xyzz*v187 + M_xzz*v197 + M_xzzz* &
      v198 + M_yzz*v274 + M_yzzz*v275 + M_zz*v284 + M_zzz*v285 + M_zzzz &
      *v286
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    v296      = 0.00138888888888889d0*D_yzzzzzz
    v300      = 0.00833333333333333d0*D_yzzzzzz
    L_y       = D_xxxxxxy*v218 + D_xxxxxy*v149 + D_xxxxxyy*v219 + D_xxxxxyz*v220 + &
      D_xxxxy*v112 + D_xxxxyy*v150 + D_xxxxyyy*v221 + D_xxxxyyz*v222 + &
      D_xxxxyz*v151 + D_xxxxyzz*v223 + D_xxxy*v92 + D_xxxyy*v113 + &
      D_xxxyyy*v152 + D_xxxyyyy*v224 + D_xxxyyyz*v225 + D_xxxyyz*v153 + &
      D_xxxyyzz*v226 + D_xxxyz*v114 + D_xxxyzz*v154 + D_xxxyzzz*v227 + &
      D_xxy*v83 + D_xxyy*v93 + D_xxyyy*v115 + D_xxyyyy*v155 + D_xxyyyyy &
      *v228 + D_xxyyyyz*v229 + D_xxyyyz*v156 + D_xxyyyzz*v230 + D_xxyyz &
      *v116 + D_xxyyzz*v157 + D_xxyyzzz*v231 + D_xxyz*v94 + D_xxyzz* &
      v117 + D_xxyzzz*v158 + D_xxyzzzz*v232 + D_xy*M_x + D_xyy*M_xy + &
      D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v261 + &
      D_yyyy*v263 + D_yyyyy*v268 + D_yyyyyy*v276 + D_yyyyyyy*v287 + &
      D_yyyyyyz*v288 + D_yyyyyz*v277 + D_yyyyyzz*v289 + D_yyyyz*v269 + &
      D_yyyyzz*v278 + D_yyyyzzz*v290 + D_yyyz*v264 + D_yyyzz*v270 + &
      D_yyyzzz*v279 + D_yyyzzzz*v291 + D_yyz*M_yz + D_yz*M_z + M_xyy* &
      v199 + M_xyyy*v200 + M_xyyyy*v201 + M_xyyyyy*v202 + M_xyyyyz*v203 &
      + M_xyyyz*v204 + M_xyyyzz*v205 + M_xyyz*v206 + M_xyyzz*v207 + &
      M_xyyzzz*v208 + M_xyzz*v194 + M_xyzzz*v195 + M_xyzzzz*v196 + &
      M_xzz*v209 + M_xzzz*v210 + M_xzzzz*v211 + M_xzzzzz*v212 + M_yzz* &
      v280 + M_yzzz*v281 + M_yzzzz*v282 + M_yzzzzz*v283 + M_zz*v292 + &
      M_zzz*v293 + M_zzzz*v294 + M_zzzzz*v295 + M_zzzzzz*v296
    L_yz      = D_xxxxxyz*v149 + D_xxxxyyz*v150 + D_xxxxyz*v112 + D_xxxxyzz*v151 + &
      D_xxxyyyz*v152 + D_xxxyyz*v113 + D_xxxyyzz*v153 + D_xxxyz*v92 + &
      D_xxxyzz*v114 + D_xxxyzzz*v154 + D_xxyyyyz*v155 + D_xxyyyz*v115 + &
      D_xxyyyzz*v156 + D_xxyyz*v93 + D_xxyyzz*v116 + D_xxyyzzz*v157 + &
      D_xxyz*v83 + D_xxyzz*v94 + D_xxyzzz*v117 + D_xxyzzzz*v158 + &
      D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyyyyyz &
      *v276 + D_yyyyyz*v268 + D_yyyyyzz*v277 + D_yyyyz*v263 + D_yyyyzz* &
      v269 + D_yyyyzzz*v278 + D_yyyz*v261 + D_yyyzz*v264 + D_yyyzzz* &
      v270 + D_yyyzzzz*v279 + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + &
      D_yzz*M_z + M_xyy*v206 + M_xyyy*v204 + M_xyyyy*v203 + M_xyyyz* &
      v213 + M_xyyz*v185 + M_xyyzz*v214 + M_xyzz*v197 + M_xyzzz*v198 + &
      M_xzz*v215 + M_xzzz*v216 + M_xzzzz*v217 + M_yzz*v284 + M_yzzz* &
      v285 + M_yzzzz*v286 + M_zz*v297 + M_zzz*v298 + M_zzzz*v299 + &
      M_zzzzz*v300
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_0       = 0.000198412698412698d0*(D_xxxxxxx*M_xxxxxxx + 42.0d0*D_xxxxxyz*M_xxxxxyz &
      + D_yyyyyyy*M_yyyyyyy + D_zzzzzzz*M_zzzzzzz + 140.0d0*(D_xxxyyyz* &
      M_xxxyyyz + D_xxxyzzz*M_xxxyzzz) + 7.0d0*(D_xxxxxxy*M_xxxxxxy + &
      D_xxxxxxz*M_xxxxxxz + D_yyyyyyz*M_yyyyyyz) + 210.0d0*(D_xxxyyzz* &
      M_xxxyyzz + D_xxyyyzz*M_xxyyyzz + D_xxyyzzz*M_xxyyzzz) + 105.0d0* &
      (D_xxxxyyz*M_xxxxyyz + D_xxxxyzz*M_xxxxyzz + D_xxyyyyz*M_xxyyyyz &
      + D_xxyzzzz*M_xxyzzzz) + 21.0d0*(D_xxxxxyy*M_xxxxxyy + D_xxxxxzz* &
      M_xxxxxzz + D_xxyyyyy*M_xxyyyyy + D_xxzzzzz*M_xxzzzzz + D_yyyyyzz &
      *M_yyyyyzz + D_yyzzzzz*M_yyzzzzz) + 35.0d0*(D_xxxxyyy*M_xxxxyyy + &
      D_xxxxzzz*M_xxxxzzz + D_xxxyyyy*M_xxxyyyy + D_xxxzzzz*M_xxxzzzz + &
      D_yyyyzzz*M_yyyyzzz + D_yyyzzzz*M_yyyzzzz)) + D_0*M_0 + D_x*M_x + &
      D_xx*v83 + D_xxx*v92 + D_xxxx*v112 + D_xxxxx*v149 + D_xxxxxx*v218 &
      + D_xxxxxy*v219 + D_xxxxxz*v220 + D_xxxxy*v150 + D_xxxxyy*v221 + &
      D_xxxxyz*v222 + D_xxxxz*v151 + D_xxxxzz*v223 + D_xxxy*v113 + &
      D_xxxyy*v152 + D_xxxyyy*v224 + D_xxxyyz*v225 + D_xxxyz*v153 + &
      D_xxxyzz*v226 + D_xxxz*v114 + D_xxxzz*v154 + D_xxxzzz*v227 + &
      D_xxy*v93 + D_xxyy*v115 + D_xxyyy*v155 + D_xxyyyy*v228 + D_xxyyyz &
      *v229 + D_xxyyz*v156 + D_xxyyzz*v230 + D_xxyz*v116 + D_xxyzz*v157 &
      + D_xxyzzz*v231 + D_xxz*v94 + D_xxzz*v117 + D_xxzzz*v158 + &
      D_xxzzzz*v232 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + &
      D_yy*v261 + D_yyy*v263 + D_yyyy*v268 + D_yyyyy*v276 + D_yyyyyy* &
      v287 + D_yyyyyz*v288 + D_yyyyz*v277 + D_yyyyzz*v289 + D_yyyz*v269 &
      + D_yyyzz*v278 + D_yyyzzz*v290 + D_yyz*v264 + D_yyzz*v270 + &
      D_yyzzz*v279 + D_yyzzzz*v291 + D_yz*M_yz + D_z*M_z + D_zz*v301 + &
      D_zzz*v302 + D_zzzz*v303 + D_zzzzz*v304 + D_zzzzzz*v305 + M_xyy* &
      v233 + M_xyyy*v234 + M_xyyyy*v235 + M_xyyyyy*v236 + M_xyyyyyy* &
      v237 + M_xyyyyyz*v238 + M_xyyyyz*v239 + M_xyyyyzz*v240 + M_xyyyz* &
      v241 + M_xyyyzz*v242 + M_xyyyzzz*v243 + M_xyyz*v244 + M_xyyzz* &
      v245 + M_xyyzzz*v246 + M_xyyzzzz*v247 + M_xyzz*v209 + M_xyzzz* &
      v210 + M_xyzzzz*v211 + M_xyzzzzz*v212 + M_xzz*v248 + M_xzzz*v249 &
      + M_xzzzz*v250 + M_xzzzzz*v251 + M_xzzzzzz*v252 + M_yzz*v292 + &
      M_yzzz*v293 + M_yzzzz*v294 + M_yzzzzz*v295 + M_yzzzzzz*v296
    L_z       = D_xxxxxxz*v218 + D_xxxxxyz*v219 + D_xxxxxz*v149 + D_xxxxxzz*v220 + &
      D_xxxxyyz*v221 + D_xxxxyz*v150 + D_xxxxyzz*v222 + D_xxxxz*v112 + &
      D_xxxxzz*v151 + D_xxxxzzz*v223 + D_xxxyyyz*v224 + D_xxxyyz*v152 + &
      D_xxxyyzz*v225 + D_xxxyz*v113 + D_xxxyzz*v153 + D_xxxyzzz*v226 + &
      D_xxxz*v92 + D_xxxzz*v114 + D_xxxzzz*v154 + D_xxxzzzz*v227 + &
      D_xxyyyyz*v228 + D_xxyyyz*v155 + D_xxyyyzz*v229 + D_xxyyz*v115 + &
      D_xxyyzz*v156 + D_xxyyzzz*v230 + D_xxyz*v93 + D_xxyzz*v116 + &
      D_xxyzzz*v157 + D_xxyzzzz*v231 + D_xxz*v83 + D_xxzz*v94 + D_xxzzz &
      *v117 + D_xxzzzz*v158 + D_xxzzzzz*v232 + D_xyz*M_xy + D_xyzz* &
      M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyyyz*v287 + D_yyyyyz*v276 + &
      D_yyyyyzz*v288 + D_yyyyz*v268 + D_yyyyzz*v277 + D_yyyyzzz*v289 + &
      D_yyyz*v263 + D_yyyzz*v269 + D_yyyzzz*v278 + D_yyyzzzz*v290 + &
      D_yyz*v261 + D_yyzz*v264 + D_yyzzz*v270 + D_yyzzzz*v279 + &
      D_yyzzzzz*v291 + D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + &
      D_zzz*v301 + D_zzzz*v302 + D_zzzzz*v303 + D_zzzzzz*v304 + &
      D_zzzzzzz*v305 + M_xyy*v244 + M_xyyy*v241 + M_xyyyy*v239 + &
      M_xyyyyy*v238 + M_xyyyyz*v253 + M_xyyyz*v254 + M_xyyyzz*v208 + &
      M_xyyz*v194 + M_xyyzz*v255 + M_xyyzzz*v256 + M_xyzz*v215 + &
      M_xyzzz*v216 + M_xyzzzz*v217 + M_xzz*v257 + M_xzzz*v258 + M_xzzzz &
      *v259 + M_xzzzzz*v260 + M_yzz*v297 + M_yzzz*v298 + M_yzzzz*v299 + &
      M_yzzzzz*v300
#undef  M_0                 
#undef  y                   
#undef  x                   
#undef  L_0                 
#undef  z                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  M_z                 
#undef  L_z                 
#undef  L_xx                
#undef  M_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
#undef  M_yy                
#undef  L_yy                
#undef  L_yz                
#undef  M_yz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  M_xxy               
#undef  L_xxz               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
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
#undef  M_xxyz              
#undef  L_xxyz              
#undef  M_xyyy              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  L_yyyz              
#undef  M_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxyy             
#undef  M_xxxyz             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  M_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  L_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  L_xxxxxz            
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
#undef  L_xxyyyz            
#undef  M_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  L_xxxxxxy           
#undef  M_xxxxxxz           
#undef  L_xxxxxxz           
#undef  M_xxxxxyy           
#undef  L_xxxxxyy           
#undef  M_xxxxxyz           
#undef  L_xxxxxyz           
#undef  M_xxxxyyy           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  M_xxxxyyz           
#undef  M_xxxyyyy           
#undef  L_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  L_xxyyyyz           
#undef  M_xyyyyyy           
#undef  L_xyyyyyy           
#undef  M_xyyyyyz           
#undef  L_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_yyyyyyz           
    end subroutine mom_es_M2L
    
! OPS  616*ADD + 2*DIV + 729*MUL + 56*NEG + POW = 1404  (4106 before optimization)
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
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v3, v30, v31, v32, v33,&
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
                L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz,&
                L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz,&
                L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz,&
                L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz,&
                L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
#define Ls_xxy               Ls(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define Ls_xxz               Ls(11)
#define Ls_xyy               Ls(12)
#define L_xyy                L(12)
#define Ls_xyz               Ls(13)
#define L_xyz                L(13)
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
#define Ls_xxxxxxx           Ls(49)
#define L_xxxxxxx            L(49)
#define Ls_xxxxxxy           Ls(50)
#define L_xxxxxxy            L(50)
#define Ls_xxxxxxz           Ls(51)
#define L_xxxxxxz            L(51)
#define Ls_xxxxxyy           Ls(52)
#define L_xxxxxyy            L(52)
#define Ls_xxxxxyz           Ls(53)
#define L_xxxxxyz            L(53)
#define L_xxxxyyy            L(54)
#define Ls_xxxxyyy           Ls(54)
#define Ls_xxxxyyz           Ls(55)
#define L_xxxxyyz            L(55)
#define L_xxxyyyy            L(56)
#define Ls_xxxyyyy           Ls(56)
#define Ls_xxxyyyz           Ls(57)
#define L_xxxyyyz            L(57)
#define Ls_xxyyyyy           Ls(58)
#define L_xxyyyyy            L(58)
#define Ls_xxyyyyz           Ls(59)
#define L_xxyyyyz            L(59)
#define Ls_xyyyyyy           Ls(60)
#define L_xyyyyyy            L(60)
#define L_xyyyyyz            L(61)
#define Ls_xyyyyyz           Ls(61)
#define Ls_yyyyyyy           Ls(62)
#define L_yyyyyyy            L(62)
#define Ls_yyyyyyz           Ls(63)
#define L_yyyyyyz            L(63)
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
    v135       = 0.0416666666666667d0*x
    v147       = L_xyyyyz*z
    v150       = v9*y
    v153       = L_xyyyz*z
    v164       = L_xyyz*z
    v180       = L_xyz*z
    v200       = L_xz*z
    v219       = 0.00833333333333333d0*x
    v233       = L_yyyyyz*z
    v236       = L_yyyyz*z
    v239       = 0.5d0*y
    v243       = L_yyyz*z
    v248       = 0.166666666666667d0*y
    v254       = L_yyz*z
    v261       = 0.0416666666666667d0*y
    v268       = L_yz*z
    v278       = 0.00833333333333333d0*y
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
    v222       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v280       = L_yzz*z
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    v138       = L_xxzz*z
    L_xyzz     = -(L_xxxy + L_xyyy)
    v191       = L_xyzz*z
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    v263       = L_yyzz*z
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    v78        = L_xxxzz*z
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    v111       = L_xxyzz*z
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    v173       = L_xyyzz*z
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    v250       = L_yyyzz*z
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
    v160       = L_xyyyzz*z
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    v241       = L_yyyyzz*z
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
    v151       = L_xyyyyz + L_xyyyyzz*z
    v152       = L_xyyyyyz*y + v151
    v163       = v151*y
    Ls_xyyyyz  = L_xxyyyyz*x + v152
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    v235       = L_yyyyyz + L_yyyyyzz*z
    Ls_yyyyyz  = v235 + L_xyyyyyz*x + L_yyyyyyz*y
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
    v134       = 0.0833333333333333d0*v13
    v218       = 0.0208333333333333d0*v13
    a3         = a1*a2
    v28        = a3
    v29        = 0.166666666666667d0*v28
    v133       = 0.0833333333333333d0*v28
    v217       = 0.0277777777777778d0*v28
    a4         = a2*a2
    v62        = a4
    v63        = 0.0416666666666667d0*v62
    v214       = 0.0208333333333333d0*v62
    a5         = a2*a3
    v119       = a5
    v120       = 0.00833333333333333d0*v119
    a6         = a3*a3
    v201       = 0.00138888888888889d0*a6
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
    v148       = L_xyyyyyy*v15
    v161       = L_xyyyyyz*v15
    v247       = 0.25d0*v15
    v260       = 0.0833333333333333d0*v15
    v277       = 0.0208333333333333d0*v15
    b3         = b1*b2
    v30        = b3
    v31        = L_xxxxyyy*v30
    v51        = L_xxxyyyy*v30
    v70        = 0.166666666666667d0*v30
    v79        = L_xxxyyyz*v30
    v92        = L_xxyyyyy*v30
    v112       = L_xxyyyyz*v30
    v136       = 4.0d0*v30
    v154       = L_xyyyyyy*v30
    v174       = L_xyyyyyz*v30
    v259       = 0.0833333333333333d0*v30
    v276       = 0.0277777777777778d0*v30
    b4         = b2*b2
    v64        = b4
    v65        = L_xxxyyyy*v64
    v103       = L_xxyyyyy*v64
    v128       = 0.0416666666666667d0*v64
    v139       = L_xxyyyyz*v64
    v165       = L_xyyyyyy*v64
    v192       = L_xyyyyyz*v64
    v220       = 5.0d0*v64
    v275       = 0.0208333333333333d0*v64
    b5         = b2*b3
    v121       = b5
    v122       = L_xxyyyyy*v121
    v181       = L_xyyyyyy*v121
    v210       = 0.00833333333333333d0*v121
    v223       = L_xyyyyyz*v121
    b6         = b3*b3
    v202       = b6
    v203       = L_xyyyyyy*v202
    v269       = 0.00138888888888889d0*v202
    b7         = b3*b4
    c2         = c1*c1
    v17        = c2
    v286       = 0.5d0*v17
    v204       = L_xzz*v17
    v270       = L_yzz*v17
    v123       = L_xxzz*v17
    v182       = L_xyzz*v17
    v224       = L_xzzz*v17
    v255       = L_yyzz*v17
    v281       = L_yzzz*v17
    v66        = L_xxxzz*v17
    v104       = L_xxyzz*v17
    v140       = L_xxzzz*v17
    v166       = L_xyyzz*v17
    v193       = L_xyzzz*v17
    v244       = L_yyyzz*v17
    v264       = L_yyzzz*v17
    v32        = L_xxxxzz*v17
    v52        = L_xxxyzz*v17
    v80        = L_xxxzzz*v17
    v93        = L_xxyyzz*v17
    v113       = L_xxyzzz*v17
    v155       = L_xyyyzz*v17
    v175       = L_xyyzzz*v17
    v237       = L_yyyyzz*v17
    v251       = L_yyyzzz*v17
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
    v129       = v30*v95
    v159       = 2.0d0*v88 + v86 + v95
    Ls_xxyyy   = 0.5d0*(v86 + v87) + L_xxxxyyy*v14 + L_xxyyy + v6*x + v85 + v88
    v100       = L_xxyyzzz*v17
    v115       = v100 + 2.0d0*(L_xxyyz + v98)
    v116       = v115*y
    v143       = v115*v15
    v179       = 2.0d0*v101 + v115 + v99
    Ls_xxyyz   = 0.5d0*(v100 + v99) + L_xxxxyyz*v14 + L_xxyyz + v101 + v49*x + v98
    v149       = L_xyyyyzz*v17
    v157       = v149 + 2.0d0*(L_xyyyy + v147)
    v158       = v157*y
    v169       = v15*v157
    v186       = v157*v30
    v211       = v157*v64
    Ls_xyyyy   = 0.5d0*(v148 + v149) + L_xxxyyyy*v14 + L_xyyyy + v147 + v150 + v8*x
    v162       = L_xyyyzzz*v17
    v177       = v162 + 2.0d0*(L_xyyyz + v160)
    v178       = v177*y
    v196       = v15*v177
    v228       = v177*v30
    Ls_xyyyz   = 0.5d0*(v161 + v162) + L_xxxyyyz*v14 + L_xyyyz + v160 + v163 + v90*x
    v234       = L_yyyyyzz*v17
    v240       = v234 + 2.0d0*(L_yyyyy + v233)
    Ls_yyyyy   = 0.5d0*v234 + L_xxyyyyy*v14 + L_yyyyy + L_yyyyyyy*v35 + v10*x + v11*y + &
      v233
    v242       = L_yyyyzzz*v17
    v253       = v242 + 2.0d0*(L_yyyyz + v241)
    Ls_yyyyz   = 0.5d0*v242 + L_xxyyyyz*v14 + L_yyyyyyz*v35 + L_yyyyz + v152*x + v235*y + &
      v241
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
    v287       = 0.166666666666667d0*v33
    v205       = L_xzzz*v33
    v271       = L_yzzz*v33
    v124       = L_xxzzz*v33
    v183       = L_xyzzz*v33
    v225       = L_xzzzz*v33
    v256       = L_yyzzz*v33
    v282       = L_yzzzz*v33
    v67        = L_xxxzzz*v33
    v105       = L_xxyzzz*v33
    v141       = L_xxzzzz*v33
    v167       = L_xyyzzz*v33
    v194       = L_xyzzzz*v33
    v245       = L_yyyzzz*v33
    v265       = L_yyzzzz*v33
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
    v146       = v79 + v81 + v48*v76 + 6.0d0*(L_xxxz + v78) + 3.0d0*(v80 + v83)
    Ls_xxxz    = 0.166666666666667d0*(v79 + v81 + 3.0d0*(v80 + v83)) + L_xxxxxxz*v29 + &
      L_xxxz + v14*v20 + v35*v48 + v38*v84 + v78
    v94        = L_xxyyzzz*v33
    v108       = v94 + 3.0d0*(2.0d0*L_xxyy + 2.0d0*v91 + v93)
    v109       = v108*y
    v130       = v108*v15
    v172       = v108 + v92 + v7*v76 + 3.0d0*v96
    Ls_xxyy    = 0.166666666666667d0*(v92 + v94 + 3.0d0*(v93 + v96)) + L_xxxxxyy*v29 + &
      L_xxyy + v14*v4 + v35*v7 + v38*v97 + v91
    v114       = L_xxyzzzz*v33
    v144       = v114 + 3.0d0*(2.0d0*L_xxyz + 2.0d0*v111 + v113)
    v145       = v144*y
    v199       = v112 + v144 + 3.0d0*v116 + v76*v89
    Ls_xxyz    = 0.166666666666667d0*(v112 + v114 + 3.0d0*(v113 + v116)) + L_xxxxxyz*v29 &
      + L_xxyz + v111 + v117*v38 + v14*v26 + v35*v89
    v156       = L_xyyyzzz*v33
    v170       = v156 + 3.0d0*(2.0d0*L_xyyy + 2.0d0*v153 + v155)
    v171       = v170*y
    v187       = v15*v170
    v212       = v170*v30
    Ls_xyyy    = 0.166666666666667d0*(v154 + v156 + 3.0d0*(v155 + v158)) + L_xxxxyyy*v29 &
      + L_xyyy + v14*v6 + v153 + v159*v38 + v35*v9
    v176       = L_xyyzzzz*v33
    v197       = v176 + 3.0d0*(2.0d0*L_xyyz + 2.0d0*v173 + v175)
    v198       = v197*y
    v229       = v15*v197
    Ls_xyyz    = 0.166666666666667d0*(v174 + v176 + 3.0d0*(v175 + v178)) + L_xxxxyyz*v29 &
      + L_xyyz + v14*v49 + v151*v35 + v173 + v179*v38
    v238       = L_yyyyzzz*v33
    v249       = v238 + 3.0d0*(2.0d0*L_yyyy + 2.0d0*v236 + v237)
    Ls_yyyy    = 0.166666666666667d0*(3.0d0*v237 + v238) + L_xxxyyyy*v29 + L_yyyy + &
      L_yyyyyyy*v70 + v11*v35 + v14*v8 + v236 + v239*v240 + v38*(v148 + &
      2.0d0*v150 + v157)
    v252       = L_yyyzzzz*v33
    v267       = v252 + 3.0d0*(2.0d0*L_yyyz + 2.0d0*v250 + v251)
    Ls_yyyz    = 0.166666666666667d0*(3.0d0*v251 + v252) + L_xxxyyyz*v29 + L_yyyyyyz*v70 &
      + L_yyyz + v14*v90 + v235*v35 + v239*v253 + v250 + v38*(v161 + &
      2.0d0*v163 + v177)
    c4         = c2*c2
    v68        = c4
    v288       = 0.0416666666666667d0*v68
    v206       = L_xzzzz*v68
    v272       = L_yzzzz*v68
    v125       = L_xxzzzz*v68
    v184       = L_xyzzzz*v68
    v226       = L_xzzzzz*v68
    v257       = L_yyzzzz*v68
    v283       = L_yzzzzz*v68
    v69        = L_xxxzzzz*v68
    v137       = v65 + v69 + v136*v5 + 12.0d0*v66 + 6.0d0*v71 + 24.0d0*(L_xxx + v61) + &
      4.0d0*(v67 + v73)
    Ls_xxx     = 0.0416666666666667d0*(v65 + 12.0d0*v66 + v69 + 6.0d0*v71 + 4.0d0*(v67 + &
      v73)) + L_xxx + L_xxxxxxx*v63 + v0*v29 + v39*v74 + v5*v70 + v61 + &
      v75*v77
    v106       = L_xxyzzzz*v68
    v131       = v106 + 12.0d0*v104 + 4.0d0*(6.0d0*L_xxy + 6.0d0*v102 + v105)
    v132       = v131*y
    v190       = v103 + v131 + 6.0d0*v107 + 4.0d0*v109 + v136*v7
    Ls_xxy     = 0.0416666666666667d0*(v103 + 12.0d0*v104 + v106 + 6.0d0*v107 + 4.0d0*( &
      v105 + v109)) + L_xxxxxxy*v63 + L_xxy + v102 + v110*v75 + v2*v29 &
      + v56*v74 + v7*v70
    v142       = L_xxzzzzz*v68
    v232       = v139 + v142 + v136*v89 + 12.0d0*v140 + 6.0d0*v143 + 24.0d0*(L_xxz + v138 &
      ) + 4.0d0*(v141 + v145)
    Ls_xxz     = 0.0416666666666667d0*(v139 + 12.0d0*v140 + v142 + 6.0d0*v143 + 4.0d0*( &
      v141 + v145)) + L_xxxxxxz*v63 + L_xxz + v138 + v146*v75 + v20*v29 &
      + v70*v89 + v74*v84
    v168       = L_xyyzzzz*v68
    v188       = v168 + 12.0d0*v166 + 4.0d0*(6.0d0*L_xyy + 6.0d0*v164 + v167)
    v189       = v188*y
    v213       = v15*v188
    Ls_xyy     = 0.0416666666666667d0*(v165 + 12.0d0*v166 + v168 + 6.0d0*v169 + 4.0d0*( &
      v167 + v171)) + L_xxxxxyy*v63 + L_xyy + v164 + v172*v75 + v29*v4 &
      + v70*v9 + v74*v97
    v195       = L_xyzzzzz*v68
    v230       = v195 + 12.0d0*v193 + 4.0d0*(6.0d0*L_xyz + 6.0d0*v191 + v194)
    v231       = v230*y
    Ls_xyz     = 0.0416666666666667d0*(v192 + 12.0d0*v193 + v195 + 6.0d0*v196 + 4.0d0*( &
      v194 + v198)) + L_xxxxxyz*v63 + L_xyz + v117*v74 + v151*v70 + &
      v191 + v199*v75 + v26*v29
    v246       = L_yyyzzzz*v68
    v262       = v246 + 12.0d0*v244 + 4.0d0*(6.0d0*L_yyy + 6.0d0*v243 + v245)
    Ls_yyy     = 0.0416666666666667d0*(12.0d0*v244 + 4.0d0*v245 + v246) + L_xxxxyyy*v63 + &
      L_yyy + L_yyyyyyy*v128 + v11*v70 + v159*v74 + v240*v247 + v243 + &
      v248*v249 + v29*v6 + v75*(v154 + 3.0d0*v158 + v170 + v76*v9)
    v266       = L_yyzzzzz*v68
    v285       = v266 + 12.0d0*v264 + 4.0d0*(6.0d0*L_yyz + 6.0d0*v263 + v265)
    Ls_yyz     = 0.0416666666666667d0*(12.0d0*v264 + 4.0d0*v265 + v266) + L_xxxxyyz*v63 + &
      L_yyyyyyz*v128 + L_yyz + v179*v74 + v235*v70 + v247*v253 + v248* &
      v267 + v263 + v29*v49 + v75*(v151*v76 + v174 + 3.0d0*v178 + v197)
    c5         = c2*c3
    v126       = c5
    v289       = 0.00833333333333333d0*v126
    v207       = L_xzzzzz*v126
    v273       = L_yzzzzz*v126
    v127       = L_xxzzzzz*v126
    v221       = v122 + v127 + 60.0d0*v123 + 20.0d0*v124 + v220*v7 + 120.0d0*(L_xx + v118 &
      ) + 5.0d0*(v125 + v132) + 10.0d0*(v129 + v130)
    Ls_xx      = 0.00833333333333333d0*(v122 + 60.0d0*v123 + 20.0d0*v124 + v127 + 5.0d0*( &
      v125 + v132) + 10.0d0*(v129 + v130)) + L_xx + L_xxxxxxx*v120 + v0 &
      *v63 + v118 + v128*v7 + v133*v39 + v134*v77 + v135*v137
    v185       = L_xyzzzzz*v126
    v215       = v185 + 60.0d0*v182 + 20.0d0*v183 + 5.0d0*(24.0d0*L_xy + 24.0d0*v180 + &
      v184)
    v216       = v215*y
    Ls_xy      = 0.00833333333333333d0*(v181 + 60.0d0*v182 + 20.0d0*v183 + v185 + 5.0d0*( &
      v184 + v189) + 10.0d0*(v186 + v187)) + L_xxxxxxy*v120 + L_xy + &
      v110*v134 + v128*v9 + v133*v56 + v135*v190 + v180 + v2*v63
    v227       = L_xzzzzzz*v126
    Ls_xz      = 0.00833333333333333d0*(v223 + 60.0d0*v224 + 20.0d0*v225 + v227 + 5.0d0*( &
      v226 + v231) + 10.0d0*(v228 + v229)) + L_xxxxxxz*v120 + L_xz + &
      v128*v151 + v133*v84 + v134*v146 + v135*v232 + v20*v63 + v222
    v258       = L_yyzzzzz*v126
    v279       = v258 + 60.0d0*v255 + 20.0d0*v256 + 5.0d0*(24.0d0*L_yy + 24.0d0*v254 + &
      v257)
    Ls_yy      = 0.00833333333333333d0*(60.0d0*v255 + 20.0d0*v256 + 5.0d0*v257 + v258) + &
      L_xxxxxyy*v120 + L_yy + L_yyyyyyy*v210 + v11*v128 + v133*v97 + &
      v134*v172 + v135*(v136*v9 + v165 + 6.0d0*v169 + 4.0d0*v171 + v188 &
      ) + v240*v259 + v249*v260 + v254 + v261*v262 + v4*v63
    v284       = L_yzzzzzz*v126
    Ls_yz      = 0.00833333333333333d0*(60.0d0*v281 + 20.0d0*v282 + 5.0d0*v283 + v284) + &
      L_xxxxxyz*v120 + L_yyyyyyz*v210 + L_yz + v117*v133 + v128*v235 + &
      v134*v199 + v135*(v136*v151 + v192 + 6.0d0*v196 + 4.0d0*v198 + &
      v230) + v253*v259 + v26*v63 + v260*v267 + v261*v285 + v280
    c6         = c3*c3
    v208       = c6
    v290       = 0.00138888888888889d0*v208
    v209       = L_xzzzzzz*v208
    Ls_x       = 0.00138888888888889d0*(v203 + 360.0d0*v204 + 120.0d0*v205 + 30.0d0*v206 &
      + v209 + 20.0d0*v212 + 6.0d0*(v207 + v216) + 15.0d0*(v211 + v213 &
      )) + L_x + L_xxxxxxx*v201 + v0*v120 + v137*v218 + v200 + v210*v9 &
      + v214*v39 + v217*v77 + v219*v221
    v274       = L_yzzzzzz*v208
    Ls_y       = 0.00138888888888889d0*(360.0d0*v270 + 120.0d0*v271 + 30.0d0*v272 + 6.0d0 &
      *v273 + v274) + L_xxxxxxy*v201 + L_y + L_yyyyyyy*v269 + v11*v210 &
      + v110*v217 + v120*v2 + v190*v218 + v214*v56 + v219*(v181 + &
      10.0d0*v186 + 10.0d0*v187 + 5.0d0*v189 + v215 + v220*v9) + v240* &
      v275 + v249*v276 + v262*v277 + v268 + v278*v279
    Ls_z       = L_z + L_xxxxxxz*v201 + L_yyyyyyz*v269 + L_zz*z + L_zzz*v286 + L_zzzz* &
      v287 + L_zzzzz*v288 + L_zzzzzz*v289 + L_zzzzzzz*v290 + v120*v20 + &
      v146*v217 + v210*v235 + v214*v84 + v218*v232 + v219*(120.0d0*L_xz &
      + v151*v220 + 120.0d0*v222 + v223 + 60.0d0*v224 + 20.0d0*v225 + &
      5.0d0*v226 + v227 + 10.0d0*v228 + 10.0d0*v229 + 5.0d0*v231) + &
      v253*v275 + v267*v276 + v277*v285 + v278*(120.0d0*L_yz + 120.0d0* &
      v280 + 60.0d0*v281 + 20.0d0*v282 + 5.0d0*v283 + v284)
    c7         = c3*c4
    Ls_0       = 0.000198412698412698d0*(L_xxxxxxx*a7 + L_yyyyyyy*b7 + L_zzzzzzz*c7 + &
      7.0d0*(x*(720.0d0*L_x + 6.0d0*v121*v9 + 720.0d0*v200 + v203 + &
      360.0d0*v204 + 120.0d0*v205 + 30.0d0*v206 + 6.0d0*v207 + v209 + &
      15.0d0*v211 + 20.0d0*v212 + 15.0d0*v213 + 6.0d0*v216) + y*( &
      720.0d0*L_y + 720.0d0*v268 + 360.0d0*v270 + 120.0d0*v271 + 30.0d0 &
      *v272 + 6.0d0*v273 + v274)) + 21.0d0*(v119*v39 + v121*v240 + v13* &
      v221 + v15*v279) + 35.0d0*(v137*v28 + v249*v64 + v262*v30 + v62* &
      v77)) + L_0 + L_z*z + L_zz*v286 + L_zzz*v287 + L_zzzz*v288 + &
      L_zzzzz*v289 + L_zzzzzz*v290 + v0*v201 + v11*v269
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
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
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
    
! OPS  350*ADD + 2*DIV + 477*MUL + 57*NEG + POW = 887  (2436 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v16, v17, v18, v19, v2,&
                v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52,&
                v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63,&
                v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74,&
                v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84, v85,&
                v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95, v96,&
                v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz,&
                L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz,&
                L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz,&
                L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz,&
                L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
#define Phi_0                Phi(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
#define L_x                  L(1)
#define Phi_x                Phi(1)
#define Phi_y                Phi(2)
#define L_y                  L(2)
#define L_z                  L(3)
#define Phi_z                Phi(3)
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
#define L_xxxxxxx            L(49)
#define L_xxxxxxy            L(50)
#define L_xxxxxxz            L(51)
#define L_xxxxxyy            L(52)
#define L_xxxxxyz            L(53)
#define L_xxxxyyy            L(54)
#define L_xxxxyyz            L(55)
#define L_xxxyyyy            L(56)
#define L_xxxyyyz            L(57)
#define L_xxyyyyy            L(58)
#define L_xxyyyyz            L(59)
#define L_xyyyyyy            L(60)
#define L_xyyyyyz            L(61)
#define L_yyyyyyy            L(62)
#define L_yyyyyyz            L(63)
    v0        = L_xxz*z
    v14       = L_xxyyyy + L_xxyyyyz*z
    v18       = L_xxxxxx + L_xxxxxxy*y + L_xxxxxxz*z
    v20       = 2.0d0*z
    v24       = 6.0d0*z
    v28       = 24.0d0*z
    v35       = 2.0d0*y
    v36       = L_xxxxxy + L_xxxxxyz*z
    v41       = L_xxxxyy + L_xxxxyyz*z
    v42       = 3.0d0*y
    v45       = 0.0416666666666667d0*x
    v47       = L_xxxyyy + L_xxxyyyz*z
    v50       = 4.0d0*y
    v53       = L_xyz*z
    v59       = L_xyyyyy + L_xyyyyyz*z
    v61       = L_xxxxxyy*y + v36
    v71       = L_xz*z
    v90       = 0.00833333333333333d0*x
    v116      = L_yyz*z
    v122      = L_yyyyyy + L_yyyyyyz*z
    v127      = 0.0416666666666667d0*y
    v129      = L_yz*z
    v139      = 0.00833333333333333d0*y
    L_zz      = -(L_xx + L_yy)
    L_xzz     = -(L_xxx + L_xyy)
    v92       = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v141      = L_yzz*z
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
    v100      = L_xxxxxz + L_xxxxxyz*y + L_xxxxxzz*z
    L_xxxxyzz = -(L_xxxxxxy + L_xxxxyyy)
    v107      = L_xxxxyz + L_xxxxyzz*z
    L_xxxxzzz = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz = -(L_xxxxxyy + L_xxxyyyy)
    v109      = L_xxxyyz + L_xxxyyzz*z
    L_xxxyzzz = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz = -(L_xxxxyyy + L_xxyyyyy)
    v112      = L_xxyyyz + L_xxyyyzz*z
    L_xxyyzzz = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz = -(L_xxxyyyy + L_xyyyyyy)
    v98       = L_xyyyyz + L_xyyyyzz*z
    L_xyyyzzz = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz = -(L_xxyyyyy + L_yyyyyyy)
    v146      = L_yyyyyz + L_yyyyyzz*z
    L_yyyyzzz = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz = -(L_xxzzzzz + L_yyzzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v38       = a2
    v39       = 0.0833333333333333d0*v38
    v89       = 0.0208333333333333d0*v38
    a3        = a1*a2
    v33       = a3
    v34       = 0.0833333333333333d0*v33
    v88       = 0.0277777777777778d0*v33
    a4        = a2*a2
    v16       = a4
    v17       = 0.0416666666666667d0*v16
    v85       = 0.0208333333333333d0*v16
    a5        = a2*a3
    v1        = a5
    v2        = 0.00833333333333333d0*v1
    a6        = a3*a3
    v72       = 0.00138888888888889d0*a6
    a7        = a3*a4
    b2        = b1*b1
    v23       = b2
    v40       = 3.0d0*v23
    v48       = 6.0d0*v23
    v125      = 0.0833333333333333d0*v23
    v138      = 0.0208333333333333d0*v23
    b3        = b1*b2
    v19       = b3
    v46       = 4.0d0*v19
    v123      = 0.0833333333333333d0*v19
    v137      = 0.0277777777777778d0*v19
    b4        = b2*b2
    v13       = b4
    v15       = v13*v14
    v60       = v13*v59
    v121      = 0.0416666666666667d0*v13
    v136      = 0.0208333333333333d0*v13
    v99       = v13*v98
    b5        = b2*b3
    v3        = b5
    v4        = L_xxyyyyy*v3
    v54       = L_xyyyyyy*v3
    v81       = 0.00833333333333333d0*v3
    v93       = L_xyyyyyz*v3
    b6        = b3*b3
    v73       = b6
    v74       = L_xyyyyyy*v73
    v130      = 0.00138888888888889d0*v73
    b7        = b3*b4
    c2        = c1*c1
    v5        = c2
    v25       = 3.0d0*v5
    v29       = 12.0d0*v5
    v150      = 0.5d0*v5
    v75       = L_xzz*v5
    v131      = L_yzz*v5
    v6        = L_xxzz*v5
    v55       = L_xyzz*v5
    v94       = L_xzzz*v5
    v117      = L_yyzz*v5
    v142      = L_yzzz*v5
    v37       = 2.0d0*L_xxxxx + L_xxxxxyy*v23 + L_xxxxxz*v20 + L_xxxxxzz*v5 + v35*v36
    v43       = 2.0d0*L_xxxxy + L_xxxxyz*v20 + L_xxxxyzz*v5
    v68       = v43 + L_xxxxyyy*v23 + v35*v41
    v108      = L_xxxxyyz*v23 + 2.0d0*L_xxxxz + L_xxxxzz*v20 + L_xxxxzzz*v5 + v107*v35
    v49       = 2.0d0*L_xxxyy + L_xxxyyz*v20 + L_xxxyyzz*v5
    v110      = 2.0d0*L_xxxyz + L_xxxyzz*v20 + L_xxxyzzz*v5
    v21       = 2.0d0*L_xxyyy + L_xxyyyz*v20 + L_xxyyyzz*v5
    v22       = v19*v21
    v113      = 2.0d0*L_xxyyz + L_xxyyzz*v20 + L_xxyyzzz*v5
    v62       = 2.0d0*L_xyyyy + L_xyyyyz*v20 + L_xyyyyzz*v5
    v63       = v19*v62
    v82       = v13*v62
    v101      = 2.0d0*L_xyyyz + L_xyyyzz*v20 + L_xyyyzzz*v5
    v102      = v101*v19
    v124      = 2.0d0*L_yyyyy + L_yyyyyz*v20 + L_yyyyyzz*v5
    v147      = 2.0d0*L_yyyyz + L_yyyyzz*v20 + L_yyyyzzz*v5
    h         = v23 + v38 + v5
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
    v7        = c3
    v30       = 4.0d0*v7
    v151      = 0.166666666666667d0*v7
    v76       = L_xzzz*v7
    v132      = L_yzzz*v7
    v8        = L_xxzzz*v7
    v56       = L_xyzzz*v7
    v95       = L_xzzzz*v7
    v118      = L_yyzzz*v7
    v143      = L_yzzzz*v7
    v44       = 6.0d0*L_xxxx + L_xxxxyyy*v19 + L_xxxxz*v24 + L_xxxxzz*v25 + L_xxxxzzz*v7 &
      + v40*v41 + v42*v43
    v51       = 6.0d0*L_xxxy + L_xxxyz*v24 + L_xxxyzz*v25 + L_xxxyzzz*v7
    v69       = v51 + L_xxxyyyy*v19 + v40*v47 + v42*v49
    v111      = L_xxxyyyz*v19 + 6.0d0*L_xxxz + L_xxxzz*v24 + L_xxxzzz*v25 + L_xxxzzzz*v7 &
      + v109*v40 + v110*v42
    v26       = 6.0d0*L_xxyy + L_xxyyz*v24 + L_xxyyzz*v25 + L_xxyyzzz*v7
    v27       = v23*v26
    v114      = 6.0d0*L_xxyz + L_xxyzz*v24 + L_xxyzzz*v25 + L_xxyzzzz*v7
    v64       = 6.0d0*L_xyyy + L_xyyyz*v24 + L_xyyyzz*v25 + L_xyyyzzz*v7
    v65       = v23*v64
    v83       = v19*v64
    v103      = 6.0d0*L_xyyz + L_xyyzz*v24 + L_xyyzzz*v25 + L_xyyzzzz*v7
    v104      = v103*v23
    v126      = 6.0d0*L_yyyy + L_yyyyz*v24 + L_yyyyzz*v25 + L_yyyyzzz*v7
    v148      = 6.0d0*L_yyyz + L_yyyzz*v24 + L_yyyzzz*v25 + L_yyyzzzz*v7
    c4        = c2*c2
    v9        = c4
    v152      = 0.0416666666666667d0*v9
    v77       = L_xzzzz*v9
    v133      = L_yzzzz*v9
    v10       = L_xxzzzz*v9
    v57       = L_xyzzzz*v9
    v96       = L_xzzzzz*v9
    v119      = L_yyzzzz*v9
    v144      = L_yzzzzz*v9
    v52       = 24.0d0*L_xxx + L_xxxyyyy*v13 + L_xxxz*v28 + L_xxxzz*v29 + L_xxxzzz*v30 + &
      L_xxxzzzz*v9 + v46*v47 + v48*v49 + v50*v51
    v31       = 24.0d0*L_xxy + L_xxyz*v28 + L_xxyzz*v29 + L_xxyzzz*v30 + L_xxyzzzz*v9
    v32       = v31*y
    v70       = v31 + L_xxyyyyy*v13 + v14*v46 + v21*v48 + v26*v50
    v115      = L_xxyyyyz*v13 + 24.0d0*L_xxz + L_xxzz*v28 + L_xxzzz*v29 + L_xxzzzz*v30 + &
      L_xxzzzzz*v9 + v112*v46 + v113*v48 + v114*v50
    v66       = 24.0d0*L_xyy + L_xyyz*v28 + L_xyyzz*v29 + L_xyyzzz*v30 + L_xyyzzzz*v9
    v67       = v66*y
    v84       = v23*v66
    v105      = 24.0d0*L_xyz + L_xyzz*v28 + L_xyzzz*v29 + L_xyzzzz*v30 + L_xyzzzzz*v9
    v106      = v105*y
    v128      = 24.0d0*L_yyy + L_yyyz*v28 + L_yyyzz*v29 + L_yyyzzz*v30 + L_yyyzzzz*v9
    v149      = 24.0d0*L_yyz + L_yyzz*v28 + L_yyzzz*v29 + L_yyzzzz*v30 + L_yyzzzzz*v9
    c5        = c2*c3
    v11       = c5
    v153      = 0.00833333333333333d0*v11
    v78       = L_xzzzzz*v11
    v134      = L_yzzzzz*v11
    v12       = L_xxzzzzz*v11
    v91       = v12 + v4 + 60.0d0*v6 + 20.0d0*v8 + 5.0d0*(24.0d0*L_xx + 24.0d0*v0 + v10 &
      + v15 + 2.0d0*v22 + 2.0d0*v27 + v32)
    Phi_xx    = 0.00833333333333333d0*(v12 + v4 + 60.0d0*v6 + 20.0d0*v8 + 10.0d0*(v22 + &
      v27) + 5.0d0*(v10 + v15 + v32)) + L_xx + L_xxxxxxx*v2 + v0 + v17* &
      v18 + v34*v37 + v39*v44 + v45*v52
    v58       = L_xyzzzzz*v11
    v86       = v58 + 60.0d0*v55 + 20.0d0*v56 + 5.0d0*(24.0d0*L_xy + 24.0d0*v53 + v57)
    v87       = v86*y
    Phi_xy    = 0.00833333333333333d0*(v54 + 60.0d0*v55 + 20.0d0*v56 + v58 + 10.0d0*(v63 &
      + v65) + 5.0d0*(v57 + v60 + v67)) + L_xxxxxxy*v2 + L_xy + v17*v61 &
      + v34*v68 + v39*v69 + v45*v70 + v53
    v97       = L_xzzzzzz*v11
    Phi_xz    = 0.00833333333333333d0*(v93 + 60.0d0*v94 + 20.0d0*v95 + v97 + 10.0d0*( &
      v102 + v104) + 5.0d0*(v106 + v96 + v99)) + L_xxxxxxz*v2 + L_xz + &
      v100*v17 + v108*v34 + v111*v39 + v115*v45 + v92
    v120      = L_yyzzzzz*v11
    v140      = v120 + 60.0d0*v117 + 20.0d0*v118 + 5.0d0*(24.0d0*L_yy + 24.0d0*v116 + &
      v119)
    Phi_yy    = 0.00833333333333333d0*(60.0d0*v117 + 20.0d0*v118 + 5.0d0*v119 + v120) + &
      L_xxxxxyy*v2 + L_yy + L_yyyyyyy*v81 + v116 + v121*v122 + v123* &
      v124 + v125*v126 + v127*v128 + v17*(L_xxxxyyy*y + v41) + v34*( &
      L_xxxyyyy*v23 + v35*v47 + v49) + v39*(L_xxyyyyy*v19 + v14*v40 + &
      v21*v42 + v26) + v45*(L_xyyyyyy*v13 + v46*v59 + v48*v62 + v50*v64 &
      + v66)
    Phi_zz    = -(Phi_xx + Phi_yy)
    v145      = L_yzzzzzz*v11
    Phi_yz    = 0.00833333333333333d0*(60.0d0*v142 + 20.0d0*v143 + 5.0d0*v144 + v145) + &
      L_xxxxxyz*v2 + L_yyyyyyz*v81 + L_yz + v121*v146 + v123*v147 + &
      v125*v148 + v127*v149 + v141 + v17*(L_xxxxyyz*y + v107) + v34*( &
      L_xxxyyyz*v23 + v109*v35 + v110) + v39*(L_xxyyyyz*v19 + v112*v40 &
      + v113*v42 + v114) + v45*(L_xyyyyyz*v13 + v101*v48 + v103*v50 + &
      v105 + v46*v98)
    c6        = c3*c3
    v79       = c6
    v154      = 0.00138888888888889d0*v79
    v80       = L_xzzzzzz*v79
    Phi_x     = 0.00138888888888889d0*(v74 + 360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + &
      v80 + 20.0d0*v83 + 6.0d0*(v78 + v87) + 15.0d0*(v82 + v84)) + L_x &
      + L_xxxxxxx*v72 + v18*v2 + v37*v85 + v44*v88 + v52*v89 + v59*v81 &
      + v71 + v90*v91
    v135      = L_yzzzzzz*v79
    Phi_y     = 0.00138888888888889d0*(360.0d0*v131 + 120.0d0*v132 + 30.0d0*v133 + 6.0d0 &
      *v134 + v135) + L_xxxxxxy*v72 + L_y + L_yyyyyyy*v130 + v122*v81 + &
      v124*v136 + v126*v137 + v128*v138 + v129 + v139*v140 + v2*v61 + &
      v68*v85 + v69*v88 + v70*v89 + v90*(v54 + 5.0d0*v60 + 10.0d0*v63 + &
      10.0d0*v65 + 5.0d0*v67 + v86)
    Phi_z     = L_z + L_xxxxxxz*v72 + L_yyyyyyz*v130 + L_zz*z + L_zzz*v150 + L_zzzz*v151 &
      + L_zzzzz*v152 + L_zzzzzz*v153 + L_zzzzzzz*v154 + v100*v2 + v108* &
      v85 + v111*v88 + v115*v89 + v136*v147 + v137*v148 + v138*v149 + &
      v139*(120.0d0*L_yz + 120.0d0*v141 + 60.0d0*v142 + 20.0d0*v143 + &
      5.0d0*v144 + v145) + v146*v81 + v90*(120.0d0*L_xz + 10.0d0*v102 + &
      10.0d0*v104 + 5.0d0*v106 + 120.0d0*v92 + v93 + 60.0d0*v94 + &
      20.0d0*v95 + 5.0d0*v96 + v97 + 5.0d0*v99)
    c7        = c3*c4
    Phi_0     = 0.000198412698412698d0*(L_xxxxxxx*a7 + L_yyyyyyy*b7 + L_zzzzzzz*c7 + &
      7.0d0*(x*(720.0d0*L_x + 6.0d0*v3*v59 + 720.0d0*v71 + v74 + &
      360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + 6.0d0*v78 + v80 + 15.0d0 &
      *v82 + 20.0d0*v83 + 15.0d0*v84 + 6.0d0*v87) + y*(720.0d0*L_y + &
      720.0d0*v129 + 360.0d0*v131 + 120.0d0*v132 + 30.0d0*v133 + 6.0d0* &
      v134 + v135)) + 21.0d0*(v1*v37 + v124*v3 + v140*v23 + v38*v91) + &
      35.0d0*(v126*v13 + v128*v19 + v16*v44 + v33*v52)) + L_0 + L_z*z + &
      L_zz*v150 + L_zzz*v151 + L_zzzz*v152 + L_zzzzz*v153 + L_zzzzzz* &
      v154 + v122*v130 + v18*v72
#undef  Phi_0               
#undef  L_0                 
#undef  y                   
#undef  z                   
#undef  x                   
#undef  L_x                 
#undef  Phi_x               
#undef  Phi_y               
#undef  L_y                 
#undef  L_z                 
#undef  Phi_z               
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
    
! OPS  2591*ADD + 2576*MUL + 142*NEG + 688*SUB = 5997  (11463 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v1000, v1001,&
                v1002, v1003, v1004, v1005, v1006, v1007, v1008, v1009, v101,&
                v1010, v1011, v1012, v1013, v1014, v1015, v1016, v1017, v1018,&
                v1019, v102, v1020, v1021, v1022, v1023, v1024, v1025, v1026,&
                v1027, v1028, v1029, v103, v1030, v1031, v1032, v1033, v1034,&
                v1035, v1036, v1037, v1038, v1039, v104, v1040, v1041, v1042,&
                v1043, v1044, v1045, v1046, v1047, v1048, v1049, v105, v1050,&
                v1051, v1052, v1053, v1054, v1055, v1056, v1057, v1058, v1059,&
                v106, v1060, v1061, v1062, v1063, v1064, v1065, v1066, v1067,&
                v1068, v1069, v107, v1070, v1071, v1072, v1073, v1074, v1075,&
                v1076, v1077, v1078, v1079, v108, v1080, v1081, v1082, v1083,&
                v1084, v1085, v1086, v1087, v1088, v1089, v109, v1090, v11,&
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
                v238, v239, v24, v240, v241, v242, v243, v244, v245, v246,&
                v247, v248, v249, v25, v250, v251, v252, v253, v254, v255,&
                v256, v257, v258, v259, v26, v260, v261, v262, v263, v264,&
                v265, v266, v267, v268, v269, v27, v270, v271, v272, v273,&
                v274, v275, v276, v277, v278, v279, v28, v280, v281, v282,&
                v283, v284, v285, v286, v287, v288, v289, v29, v290, v291,&
                v292, v293, v294, v295, v296, v297, v298, v299, v3, v30, v300,&
                v301, v302, v303, v304, v305, v306, v307, v308, v309, v31,&
                v310, v311, v312, v313, v314, v315, v316, v317, v318, v319,&
                v32, v320, v321, v322, v323, v324, v325, v326, v327, v328,&
                v329, v33, v330, v331, v332, v333, v334, v335, v336, v337,&
                v338, v339, v34, v340, v341, v342, v343, v344, v345, v346,&
                v347, v348, v349, v35, v350, v351, v352, v353, v354, v355,&
                v356, v357, v358, v359, v36, v360, v361, v362, v363, v364,&
                v365, v366, v367, v368, v369, v37, v370, v371, v372, v373,&
                v374, v375, v376, v377, v378, v379, v38, v380, v381, v382,&
                v383, v384, v385, v386, v387, v388, v389, v39, v390, v391,&
                v392, v393, v394, v395, v396, v397, v398, v399, v4, v40, v400,&
                v401, v402, v403, v404, v405, v406, v407, v408, v409, v41,&
                v410, v411, v412, v413, v414, v415, v416, v417, v418, v419,&
                v42, v420, v421, v422, v423, v424, v425, v426, v427, v428,&
                v429, v43, v430, v431, v432, v433, v434, v435, v436, v437,&
                v438, v439, v44, v440, v441, v442, v443, v444, v445, v446,&
                v447, v448, v449, v45, v450, v451, v452, v453, v454, v455,&
                v456, v457, v458, v459, v46, v460, v461, v462, v463, v464,&
                v465, v466, v467, v468, v469, v47, v470, v471, v472, v473,&
                v474, v475, v476, v477, v478, v479, v48, v480, v481, v482,&
                v483, v484, v485, v486, v487, v488, v489, v49, v490, v491,&
                v492, v493, v494, v495, v496, v497, v498, v499, v5, v50, v500,&
                v501, v502, v503, v504, v505, v506, v507, v508, v509, v51,&
                v510, v511, v512, v513, v514, v515, v516, v517, v518, v519,&
                v52, v520, v521, v522, v523, v524, v525, v526, v527, v528,&
                v529, v53, v530, v531, v532, v533, v534, v535, v536, v537,&
                v538, v539, v54, v540, v541, v542, v543, v544, v545, v546,&
                v547, v548, v549, v55, v550, v551, v552, v553, v554, v555,&
                v556, v557, v558, v559, v56, v560, v561, v562, v563, v564,&
                v565, v566, v567, v568, v569, v57, v570, v571, v572, v573,&
                v574, v575, v576, v577, v578, v579, v58, v580, v581, v582,&
                v583, v584, v585, v586, v587, v588, v589, v59, v590, v591,&
                v592, v593, v594, v595, v596, v597, v598, v599, v6, v60, v600,&
                v601, v602, v603, v604, v605, v606, v607, v608, v609, v61,&
                v610, v611, v612, v613, v614, v615, v616, v617, v618, v619,&
                v62, v620, v621, v622, v623, v624, v625, v626, v627, v628,&
                v629, v63, v630, v631, v632, v633, v634, v635, v636, v637,&
                v638, v639, v64, v640, v641, v642, v643, v644, v645, v646,&
                v647, v648, v649, v65, v650, v651, v652, v653, v654, v655,&
                v656, v657, v658, v659, v66, v660, v661, v662, v663, v664,&
                v665, v666, v667, v668, v669, v67, v670, v671, v672, v673,&
                v674, v675, v676, v677, v678, v679, v68, v680, v681, v682,&
                v683, v684, v685, v686, v687, v688, v689, v69, v690, v691,&
                v692, v693, v694, v695, v696, v697, v698, v699, v7, v70, v700,&
                v701, v702, v703, v704, v705, v706, v707, v708, v709, v71,&
                v710, v711, v712, v713, v714, v715, v716, v717, v718, v719,&
                v72, v720, v721, v722, v723, v724, v725, v726, v727, v728,&
                v729, v73, v730, v731, v732, v733, v734, v735, v736, v737,&
                v738, v739, v74, v740, v741, v742, v743, v744, v745, v746,&
                v747, v748, v749, v75, v750, v751, v752, v753, v754, v755,&
                v756, v757, v758, v759, v76, v760, v761, v762, v763, v764,&
                v765, v766, v767, v768, v769, v77, v770, v771, v772, v773,&
                v774, v775, v776, v777, v778, v779, v78, v780, v781, v782,&
                v783, v784, v785, v786, v787, v788, v789, v79, v790, v791,&
                v792, v793, v794, v795, v796, v797, v798, v799, v8, v80, v800,&
                v801, v802, v803, v804, v805, v806, v807, v808, v809, v81,&
                v810, v811, v812, v813, v814, v815, v816, v817, v818, v819,&
                v82, v820, v821, v822, v823, v824, v825, v826, v827, v828,&
                v829, v83, v830, v831, v832, v833, v834, v835, v836, v837,&
                v838, v839, v84, v840, v841, v842, v843, v844, v845, v846,&
                v847, v848, v849, v85, v850, v851, v852, v853, v854, v855,&
                v856, v857, v858, v859, v86, v860, v861, v862, v863, v864,&
                v865, v866, v867, v868, v869, v87, v870, v871, v872, v873,&
                v874, v875, v876, v877, v878, v879, v88, v880, v881, v882,&
                v883, v884, v885, v886, v887, v888, v889, v89, v890, v891,&
                v892, v893, v894, v895, v896, v897, v898, v899, v9, v90, v900,&
                v901, v902, v903, v904, v905, v906, v907, v908, v909, v91,&
                v910, v911, v912, v913, v914, v915, v916, v917, v918, v919,&
                v92, v920, v921, v922, v923, v924, v925, v926, v927, v928,&
                v929, v93, v930, v931, v932, v933, v934, v935, v936, v937,&
                v938, v939, v94, v940, v941, v942, v943, v944, v945, v946,&
                v947, v948, v949, v95, v950, v951, v952, v953, v954, v955,&
                v956, v957, v958, v959, v96, v960, v961, v962, v963, v964,&
                v965, v966, v967, v968, v969, v97, v970, v971, v972, v973,&
                v974, v975, v976, v977, v978, v979, v98, v980, v981, v982,&
                v983, v984, v985, v986, v987, v988, v989, v99, v990, v991,&
                v992, v993, v994, v995, v996, v997, v998, v999, h, u, M_zz,&
                M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz,&
                M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz,&
                M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz,&
                M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz,&
                M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz,&
                M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz, M_xxxyyzz,&
                M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz, M_xxyzzzz,&
                M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz, M_xyzzzzz,&
                M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz, M_yyzzzzz,&
                M_yzzzzzz, M_zzzzzzz, S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz,&
                S_yy, S_yz, S_zz, S_xxx, S_xxy, S_xxz, S_xyy, S_xyz, S_xzz,&
                S_yyy, S_yyz, S_yzz, S_zzz, S_xxxx, S_xxxy, S_xxxz, S_xxyy,&
                S_xxyz, S_xxzz, S_xyyy, S_xyyz, S_xyzz, S_xzzz, S_yyyy,&
                S_yyyz, S_yyzz, S_yzzz, S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz,&
                S_xxxyy, S_xxxyz, S_xxxzz, S_xxyyy, S_xxyyz, S_xxyzz, S_xxzzz,&
                S_xyyyy, S_xyyyz, S_xyyzz, S_xyzzz, S_xzzzz, S_yyyyy, S_yyyyz,&
                S_yyyzz, S_yyzzz, S_yzzzz, S_zzzzz, S_xxxxxx, S_xxxxxy,&
                S_xxxxxz, S_xxxxyy, S_xxxxyz, S_xxxxzz, S_xxxyyy, S_xxxyyz,&
                S_xxxyzz, S_xxxzzz, S_xxyyyy, S_xxyyyz, S_xxyyzz, S_xxyzzz,&
                S_xxzzzz, S_xyyyyy, S_xyyyyz, S_xyyyzz, S_xyyzzz, S_xyzzzz,&
                S_xzzzzz, S_yyyyyy, S_yyyyyz, S_yyyyzz, S_yyyzzz, S_yyzzzz,&
                S_yzzzzz, S_zzzzzz, S_xxxxxxx, S_xxxxxxy, S_xxxxxxz,&
                S_xxxxxyy, S_xxxxxyz, S_xxxxyyy, S_xxxxyyz, S_xxxyyyy,&
                S_xxxyyyz, S_xxyyyyy, S_xxyyyyz, S_xyyyyyy, S_xyyyyyz,&
                S_yyyyyyy, S_yyyyyyz
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
#define Ms_xxxxxxx           Ms(49)
#define M_xxxxxxx            M(49)
#define Ms_xxxxxxy           Ms(50)
#define M_xxxxxxy            M(50)
#define Ms_xxxxxxz           Ms(51)
#define M_xxxxxxz            M(51)
#define M_xxxxxyy            M(52)
#define Ms_xxxxxyy           Ms(52)
#define Ms_xxxxxyz           Ms(53)
#define M_xxxxxyz            M(53)
#define Ms_xxxxyyy           Ms(54)
#define M_xxxxyyy            M(54)
#define Ms_xxxxyyz           Ms(55)
#define M_xxxxyyz            M(55)
#define Ms_xxxyyyy           Ms(56)
#define M_xxxyyyy            M(56)
#define Ms_xxxyyyz           Ms(57)
#define M_xxxyyyz            M(57)
#define Ms_xxyyyyy           Ms(58)
#define M_xxyyyyy            M(58)
#define Ms_xxyyyyz           Ms(59)
#define M_xxyyyyz            M(59)
#define M_xyyyyyy            M(60)
#define Ms_xyyyyyy           Ms(60)
#define M_xyyyyyz            M(61)
#define Ms_xyyyyyz           Ms(61)
#define Ms_yyyyyyy           Ms(62)
#define M_yyyyyyy            M(62)
#define M_yyyyyyz            M(63)
#define Ms_yyyyyyz           Ms(63)
    v0         = x*y
    v1         = x*z
    v2         = y*z
    v3         = v0*z
    v9         = M_x*x
    v10        = M_y*y
    v11        = -0.666666666666667d0*M_z*z
    v15        = M_xx*x
    v16        = M_xy*y
    v17        = M_xz*z
    v23        = M_xy*x
    v25        = M_yy*y
    v26        = M_yz*z
    v29        = M_xx*z
    v30        = M_xz*x
    v32        = M_yy*z
    v33        = M_yz*y
    v47        = M_xxx*x
    v48        = 1.71428571428571d0*y
    v49        = M_xxy*v48
    v50        = M_xxz*z
    v52        = 1.71428571428571d0*M_y
    v59        = 0.857142857142857d0*M_xyz
    v64        = M_xxy*x
    v67        = M_xyy*y
    v71        = 3.0d0*M_xx
    v72        = M_xxx*z
    v73        = M_xxz*x
    v75        = M_xyy*z
    v76        = 3.0d0*M_xz
    v84        = 1.71428571428571d0*M_x
    v86        = 1.71428571428571d0*x
    v87        = M_xyy*v86
    v89        = M_yyy*y
    v90        = M_yyz*z
    v94        = M_xxy*z
    v98        = M_yyy*z
    v99        = M_yyz*y
    v107       = 3.0d0*M_yz
    v118       = M_xxxx*x
    v119       = M_xxxy*y
    v120       = M_xxxz*z
    v122       = M_xxyy*x
    v133       = M_yyyy*x
    v148       = M_xxxx*y
    v149       = M_xxxy*x
    v152       = M_xxyy*y
    v153       = M_xxyz*z
    v167       = M_yyyy*y
    v172       = M_xxyy*z
    v185       = M_xxxx*z
    v186       = M_xxxz*x
    v188       = M_xxyz*y
    v198       = M_yyyy*z
    v208       = M_xyyy*y
    v209       = M_xyyz*z
    v217       = M_xxxy*z
    v219       = M_xxyz*x
    v223       = M_xyyy*z
    v224       = M_xyyz*y
    v225       = 3.0d0*M_xyz
    v235       = M_xyyy*x
    v236       = M_yyyz*z
    v239       = M_xyyz*x
    v241       = M_yyyz*y
    v248       = M_xxyyz*z
    v272       = M_xxxxx*x
    v273       = M_xxxxy*y
    v274       = M_xxxxz*z
    v276       = M_xxxyy*x
    v283       = M_xxyyy*y
    v292       = M_xyyyy*x
    v309       = M_yyyyy*y
    v310       = M_yyyyz*z
    v346       = M_xxxxx*y
    v347       = M_xxxxy*x
    v350       = M_xxxyy*y
    v351       = 1.81818181818182d0*M_xxxyz
    v354       = M_xxyyy*x
    v362       = M_xyyyy*y
    v374       = M_yyyyy*x
    v386       = 10.0d0*M_xxx
    v389       = M_xxxxx*z
    v390       = M_xxxxz*x
    v392       = M_xxxyy*z
    v393       = v351*y
    v400       = M_xxyyz*x
    v410       = M_xyyyy*z
    v414       = 5.45454545454545d0*M_xyz
    v427       = M_yyyyz*x
    v472       = M_xxxxy*z
    v473       = M_xxxxz*y
    v475       = M_xxxyz*x
    v480       = M_xxyyy*z
    v481       = M_xxyyz*y
    v500       = M_yyyyy*z
    v501       = M_yyyyz*y
    v513       = 0.545454545454545d0*z
    v516       = 0.545454545454545d0*M_z
    v520       = M_xyyyz*y
    v529       = 1.81818181818182d0*M_xyyyz
    v530       = v529*x
    v561       = M_xxxxxx*x
    v562       = M_xxxxxy*y
    v563       = M_xxxxxz*z
    v565       = M_xxxxyy*x
    v572       = M_xxxyyy*y
    v573       = M_xxxyyz*z
    v586       = M_xxyyyy*x
    v611       = M_xyyyyy*y
    v612       = M_xyyyyz*z
    v640       = M_yyyyyy*x
    v690       = M_xxxxxx*y
    v691       = M_xxxxxy*x
    v694       = M_xxxxyy*y
    v695       = M_xxxxyz*z
    v701       = M_xxxyyy*x
    v715       = M_xxyyyy*y
    v716       = M_xxyyyz*z
    v736       = M_xyyyyy*x
    v764       = M_yyyyyy*y
    v765       = M_yyyyyz*z
    v814       = M_xxxxxx*z
    v815       = M_xxxxxz*x
    v817       = M_xxxxyy*z
    v818       = 0.559440559440559d0*v817
    v819       = M_xxxxyz*y
    v825       = M_xxxyyz*x
    v836       = M_xxyyyy*z
    v837       = M_xxyyyz*y
    v860       = M_xyyyyz*x
    v890       = M_yyyyyy*z
    v891       = M_yyyyyz*y
    v947       = M_xxxyyy*z
    v990       = M_xxxxxy*z
    v991       = M_xxxxxz*y
    v993       = M_xxxxyz*x
    v997       = M_xxxyyz*y
    v1004      = M_xxyyyz*x
    v1013      = M_xyyyyy*z
    v1014      = M_xyyyyz*y
    v1029      = M_yyyyyz*x
    v1060      = 0.559440559440559d0*v836
    Ms_0       = Ms_0 + (M_0)
    Ms_x       = Ms_x + (M_0*x + M_x)
    Ms_y       = Ms_y + (M_0*y + M_y)
    Ms_z       = Ms_z + (M_0*z + M_z)
    M_zz       = -(M_xx + M_yy)
    M_xzz      = -(M_xxx + M_xyy)
    M_yzz      = -(M_xxy + M_yyy)
    M_zzz      = -(M_xxz + M_yyz)
    M_xxzz     = -(M_xxxx + M_xxyy)
    v124       = M_xxzz*x
    v139       = M_xxzz*y
    v173       = M_xxzz*z
    M_xyzz     = -(M_xxxy + M_xyyy)
    M_xzzz     = -(M_xxxz + M_xyyz)
    M_yyzz     = -(M_xxyy + M_yyyy)
    v134       = M_yyzz*x
    v142       = M_yyzz*y
    v176       = M_yyzz*z
    M_yzzz     = -(M_xxyz + M_yyyz)
    M_zzzz     = -(M_xxzz + M_yyzz)
    M_xxxzz    = -(M_xxxxx + M_xxxyy)
    v278       = M_xxxzz*x
    v323       = M_xxxzz*y
    v396       = M_xxxzz*z
    M_xxyzz    = -(M_xxxxy + M_xxyyy)
    v285       = M_xxyzz*y
    v326       = M_xxyzz*x
    v454       = M_xxyzz*z
    M_xxzzz    = -(M_xxxxz + M_xxyyz)
    v250       = M_xxzzz*z
    v405       = M_xxzzz*x
    v456       = M_xxzzz*y
    M_xyyzz    = -(M_xxxyy + M_xyyyy)
    v1078      = M_xxxzz + M_xyyzz
    v293       = M_xyyzz*x
    v332       = M_xyyzz*y
    v413       = M_xyyzz*z
    M_xyzzz    = -(M_xxxyz + M_xyyyz)
    M_xzzzz    = -v1078
    M_yyyzz    = -(M_xxyyy + M_yyyyy)
    v1079      = M_xxyzz + M_yyyzz
    v311       = M_yyyzz*y
    v336       = M_yyyzz*x
    v459       = M_yyyzz*z
    M_yyzzz    = -(M_xxyyz + M_yyyyz)
    v253       = M_yyzzz*z
    v431       = M_yyzzz*x
    v461       = M_yyzzz*y
    M_yzzzz    = -v1079
    M_zzzzz    = -(M_xxzzz + M_yyzzz)
    M_xxxxzz   = -(M_xxxxxx + M_xxxxyy)
    v567       = M_xxxxzz*x
    v697       = M_xxxxzz*y
    v822       = M_xxxxzz*z
    v935       = 0.104895104895105d0*v567
    v1057      = 0.174825174825175d0*v822
    M_xxxyzz   = -(M_xxxxxy + M_xxxyyy)
    v575       = M_xxxyzz*y
    v703       = M_xxxyzz*x
    v949       = M_xxxyzz*z
    M_xxxzzz   = -(M_xxxxxz + M_xxxyyz)
    v580       = M_xxxzzz*z
    v830       = M_xxxzzz*x
    v951       = M_xxxzzz*y
    v1059      = 0.0699300699300699d0*v830
    M_xxyyzz   = -(M_xxxxyy + M_xxyyyy)
    v588       = M_xxyyzz*x
    v658       = M_xxyyzz*y
    v786       = M_xxyyzz*z
    v787       = -1.22377622377622d0*v786
    v1061      = -0.244755244755245d0*v786
    M_xxyzzz   = -(M_xxxxyz + M_xxyyyz)
    v659       = M_xxyzzz*z
    v844       = M_xxyzzz*y
    v845       = 0.0699300699300699d0*v844
    v955       = M_xxyzzz*x
    M_xxzzzz   = -(M_xxxxzz + M_xxyyzz)
    v596       = M_xxzzzz*x
    v661       = M_xxzzzz*y
    v788       = M_xxzzzz*z
    v789       = 0.0815850815850816d0*v788
    v1062      = 0.0163170163170163d0*v788
    M_xyyyzz   = -(M_xxxyyy + M_xyyyyy)
    v613       = M_xyyyzz*y
    v737       = M_xyyyzz*x
    v962       = M_xyyyzz*z
    M_xyyzzz   = -(M_xxxyyz + M_xyyyyz)
    v1080      = M_xxxzzz + M_xyyzzz
    v618       = M_xyyzzz*z
    v864       = M_xyyzzz*x
    v964       = M_xyyzzz*y
    v1066      = 0.0699300699300699d0*v864
    M_xyzzzz   = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz   = -v1080
    M_yyyyzz   = -(M_xxyyyy + M_yyyyyy)
    v642       = M_yyyyzz*x
    v767       = M_yyyyzz*y
    v768       = 0.104895104895105d0*v767
    v895       = M_yyyyzz*z
    v896       = 0.174825174825175d0*v895
    M_yyyzzz   = -(M_xxyyyz + M_yyyyyz)
    v1081      = M_xxyzzz + M_yyyzzz
    v665       = M_yyyzzz*z
    v901       = M_yyyzzz*y
    v902       = 0.0699300699300699d0*v901
    v974       = M_yyyzzz*x
    M_yyzzzz   = -(M_xxyyzz + M_yyyyzz)
    v1089      = M_xxzzzz + M_yyzzzz
    v649       = M_yyzzzz*x
    v667       = M_yyzzzz*y
    v790       = M_yyzzzz*z
    v791       = 0.0815850815850816d0*v790
    v1069      = 0.0163170163170163d0*v790
    M_yzzzzz   = -v1081
    M_zzzzzz   = -v1089
    M_xxxxxzz  = -(M_xxxxxxx + M_xxxxxyy)
    v932       = 0.034965034965035d0*M_xxxxxzz
    M_xxxxyzz  = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz  = -(M_xxxxxxz + M_xxxxyyz)
    v1051      = 0.034965034965035d0*M_xxxxzzz
    M_xxxyyzz  = -(M_xxxxxyy + M_xxxyyyy)
    v537       = -0.244755244755245d0*M_xxxyyzz
    v933       = -0.104895104895105d0*M_xxxyyzz
    M_xxxyzzz  = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz  = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz  = -(M_xxxxyyy + M_xxyyyyy)
    v673       = -0.244755244755245d0*M_xxyyyzz
    v1042      = -0.104895104895105d0*M_xxyyyzz
    M_xxyyzzz  = -(M_xxxxyyz + M_xxyyyyz)
    v783       = -0.244755244755245d0*M_xxyyzzz
    v1052      = -0.048951048951049d0*M_xxyyzzz
    M_xxyzzzz  = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz  = -(M_xxxxzzz + M_xxyyzzz)
    v784       = 0.0116550116550117d0*M_xxzzzzz
    v1053      = 0.00233100233100233d0*M_xxzzzzz
    M_xyyyyzz  = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz  = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz  = -(M_xxxyyzz + M_xyyyyzz)
    v1082      = M_xxxzzzz + M_xyyzzzz
    M_xyzzzzz  = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz  = -v1082
    M_yyyyyzz  = -(M_xxyyyyy + M_yyyyyyy)
    v674       = 0.034965034965035d0*M_yyyyyzz
    M_yyyyzzz  = -(M_xxyyyyz + M_yyyyyyz)
    v798       = 0.034965034965035d0*M_yyyyzzz
    M_yyyzzzz  = -(M_xxyyyzz + M_yyyyyzz)
    v1083      = M_xxyzzzz + M_yyyzzzz
    M_yyzzzzz  = -(M_xxyyzzz + M_yyyyzzz)
    v785       = 0.0116550116550117d0*M_yyzzzzz
    v1054      = 0.00233100233100233d0*M_yyzzzzz
    M_yzzzzzz  = -v1083
    M_zzzzzzz  = -(M_xxzzzzz + M_yyzzzzz)
    S_0        = 1
    S_x        = x
    S_y        = y
    S_z        = z
    S_xy       = v0
    v18        = M_y*S_xy
    v22        = M_x*S_xy
    v42        = M_xy*S_xy
    v63        = M_xx*S_xy
    v69        = M_yy*S_xy
    v79        = M_yz*S_xy
    v96        = M_xz*S_xy
    v121       = M_xxy*S_xy
    v147       = M_xxx*S_xy
    v157       = M_xyy*S_xy
    v175       = M_xyz*S_xy
    v212       = M_yyy*S_xy
    v220       = M_xxz*S_xy
    v229       = M_yyz*S_xy
    v275       = M_xxxy*S_xy
    v325       = M_xxyy*S_xy
    v327       = M_xxzz*S_xy
    v337       = M_yyzz*S_xy
    v345       = M_xxxx*S_xy
    v373       = M_yyyy*S_xy
    v401       = M_xxyz*S_xy
    v446       = M_xyyy*S_xy
    v476       = M_xxxz*S_xy
    v489       = M_xyyz*S_xy
    v522       = M_yyyz*S_xy
    v564       = M_xxxxy*S_xy
    v585       = M_xxyyy*S_xy
    v590       = M_xxyzz*S_xy
    v639       = M_yyyyy*S_xy
    v643       = M_yyyzz*S_xy
    v689       = M_xxxxx*S_xy
    v700       = M_xxxyy*S_xy
    v705       = M_xxxzz*S_xy
    v735       = M_xyyyy*S_xy
    v739       = M_xyyzz*S_xy
    v826       = M_xxxyz*S_xy
    v953       = M_xxyyz*S_xy
    v957       = M_xxzzz*S_xy
    v976       = M_yyzzz*S_xy
    v994       = M_xxxxz*S_xy
    v1030      = M_yyyyz*S_xy
    v1064      = M_xyyyz*S_xy
    Ms_xy      = Ms_xy + (M_xy + M_0*S_xy + M_x*y + M_y*x)
    S_xz       = v1
    v19        = M_z*S_xz
    v28        = M_x*S_xz
    v51        = M_xz*S_xz
    v78        = M_yy*S_xz
    v95        = M_xy*S_xz
    v123       = M_xxz*S_xz
    v158       = M_xyz*S_xz
    v184       = M_xxx*S_xz
    v191       = M_xyy*S_xz
    v213       = M_yyz*S_xz
    v218       = 3.0d0*S_xz
    v228       = M_yyy*S_xz
    v277       = M_xxxz*S_xz
    v355       = M_xxyz*S_xz
    v388       = M_xxxx*S_xz
    v399       = M_xxyy*S_xz
    v404       = M_xxzz*S_xz
    v426       = M_yyyy*S_xz
    v430       = M_yyzz*S_xz
    v444       = 0.242424242424242d0*v277
    v447       = M_xyyz*S_xz
    v474       = M_xxxy*S_xz
    v488       = M_xyyy*S_xz
    v515       = M_yyyz*S_xz
    v566       = M_xxxxz*S_xz
    v587       = M_xxyyz*S_xz
    v595       = M_xxzzz*S_xz
    v641       = M_yyyyz*S_xz
    v648       = M_yyzzz*S_xz
    v702       = M_xxxyz*S_xz
    v813       = M_xxxxx*S_xz
    v824       = M_xxxyy*S_xz
    v829       = M_xxxzz*S_xz
    v859       = M_xyyyy*S_xz
    v863       = M_xyyzz*S_xz
    v954       = M_xxyzz*S_xz
    v973       = M_yyyzz*S_xz
    v992       = M_xxxxy*S_xz
    v1003      = M_xxyyy*S_xz
    v1028      = M_yyyyy*S_xz
    v1043      = 0.839160839160839d0*v702
    v1045      = M_xyyyz*S_xz
    v1058      = 0.34965034965035d0*v829
    v1065      = 0.34965034965035d0*v863
    Ms_xz      = Ms_xz + (M_xz + M_0*S_xz + M_x*z + M_z*x)
    S_yz       = v2
    v27        = M_z*S_yz
    v31        = M_y*S_yz
    v55        = M_yz*S_yz
    v74        = M_xy*S_yz
    v93        = M_xx*S_yz
    v106       = 3.0d0*S_yz
    v128       = M_xyz*S_yz
    v154       = M_xxz*S_yz
    v168       = M_yyz*S_yz
    v187       = M_xxy*S_yz
    v197       = M_yyy*S_yz
    v216       = M_xxx*S_yz
    v284       = M_xxyz*S_yz
    v352       = M_xxxz*S_yz
    v363       = M_xyyz*S_yz
    v391       = M_xxxy*S_yz
    v409       = M_xyyy*S_yz
    v450       = M_yyyz*S_yz
    v451       = 0.242424242424242d0*v450
    v455       = M_xxzz*S_yz
    v460       = M_yyzz*S_yz
    v471       = M_xxxx*S_yz
    v479       = M_xxyy*S_yz
    v499       = M_yyyy*S_yz
    v574       = M_xxxyz*S_yz
    v660       = M_xxzzz*S_yz
    v666       = M_yyzzz*S_yz
    v696       = M_xxxxz*S_yz
    v717       = M_xxyyz*S_yz
    v766       = M_yyyyz*S_yz
    v816       = M_xxxxy*S_yz
    v835       = M_xxyyy*S_yz
    v842       = M_xxyzz*S_yz
    v843       = 0.34965034965035d0*v842
    v889       = M_yyyyy*S_yz
    v899       = M_yyyzz*S_yz
    v900       = 0.34965034965035d0*v899
    v936       = M_xyyyz*S_yz
    v937       = 0.839160839160839d0*v936
    v950       = M_xxxzz*S_yz
    v963       = M_xyyzz*S_yz
    v989       = M_xxxxx*S_yz
    v996       = M_xxxyy*S_yz
    v1012      = M_xyyyy*S_yz
    Ms_yz      = Ms_yz + (M_yz + M_0*S_yz + M_y*z + M_z*y)
    S_xyz      = v3
    v60        = 0.857142857142857d0*S_xyz
    v61        = -(0.142857142857143d0*(6.0d0*(M_xz*S_yz + M_yz*S_xz)) + M_z*v60 + v59*z)
    v135       = M_yz*S_xyz
    v159       = M_xz*S_xyz
    v174       = M_xy*S_xyz
    v251       = M_xyz*S_xyz
    v356       = M_xxz*S_xyz
    v375       = M_yyz*S_xyz
    v397       = 5.45454545454545d0*S_xyz
    v398       = M_xxy*v397
    v425       = M_yyy*S_xyz
    v470       = M_xxx*S_xyz
    v528       = M_xyy*v397
    v589       = M_xxyz*S_xyz
    v704       = M_xxxz*S_xyz
    v738       = M_xyyz*S_xyz
    v823       = M_xxxy*S_xyz
    v858       = M_xyyy*S_xyz
    v940       = M_yyyz*S_xyz
    v941       = 0.839160839160839d0*v940
    v952       = M_xxyy*S_xyz
    v956       = M_xxzz*S_xyz
    v975       = M_yyzz*S_xyz
    v988       = M_xxxx*S_xyz
    v1027      = M_yyyy*S_xyz
    v1044      = 0.839160839160839d0*v704
    Ms_xyz     = Ms_xyz + (M_xyz + M_0*S_xyz + M_x*S_yz + M_xy*z + M_xz*y + M_y*S_xz + M_yz*x + M_z &
      *S_xy)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v4         = a2
    a3         = a1*a2
    a4         = a2*a2
    v37        = a4
    a5         = a2*a3
    a6         = a3*a3
    v243       = a6
    a7         = a3*a4
    b2         = b1*b1
    v5         = b2
    v83        = v4*v5
    v441       = v37*v5
    b3         = b1*b2
    b4         = b2*b2
    v104       = b4
    v524       = v104*v4
    b5         = b2*b3
    b6         = b3*b3
    v533       = b6
    b7         = b3*b4
    c2         = c1*c1
    h          = c2 + v4 + v5
    v6         = 0.333333333333333d0*h
    v7         = -v6
    v8         = v4 + v7
    v12        = v5 + v7
    v13        = -0.6d0*h
    v20        = -0.2d0*h
    v21        = v20 + v4
    v36        = v20 + v5
    v38        = h*h
    v39        = 0.0857142857142857d0*v38
    v40        = h*v4
    v57        = -0.428571428571429d0*h
    v58        = v4 + v57
    v82        = 0.142857142857143d0*h
    v92        = -v82
    v103       = v5 + v57
    v105       = h*v5
    v108       = 0.238095238095238d0*v38
    v137       = 0.0476190476190476d0*v38
    v138       = 0.333333333333333d0*(-2.0d0*v40) + v137 + v37
    v205       = -0.111111111111111d0*v40
    v233       = 0.111111111111111d0*(-v105) + v83
    v242       = 0.333333333333333d0*(-2.0d0*v105) + v104 + v137
    v244       = h*h*h
    v245       = -0.0216450216450216d0*v244
    v246       = h*v37
    v247       = v38*v4
    v318       = 0.151515151515152d0*v38
    v319       = 0.0909090909090909d0*(-10.0d0*v40) + v318 + v37
    v439       = 0.545454545454545d0*v40
    v440       = -0.00432900432900433d0*(v244 + 231.0d0*v439*v5)
    v442       = 0.0303030303030303d0*v38
    v511       = -0.272727272727273d0*v40
    v512       = -0.272727272727273d0*v105
    v517       = v442 + v83
    v523       = h*v104
    v525       = v38*v5
    v532       = 0.0909090909090909d0*(-10.0d0*v105) + v104 + v318
    v536       = -0.0815850815850816d0*v244
    v656       = -0.0116550116550117d0*v244
    v657       = v243 + v656 + 0.00699300699300699d0*(-165.0d0*v246 + 45.0d0*v247)
    v927       = -0.0769230769230769d0*v246
    v928       = 0.104895104895105d0*v38
    v929       = 0.769230769230769d0*v40
    v930       = -v5*v929
    v1085      = v656 + v930
    v1039      = -0.461538461538462d0*v40*v5
    v1040      = v1039 + 0.00699300699300699d0*(-v244)
    v1041      = 0.020979020979021d0*v525
    v1086      = v1041 + v441
    v1049      = v1039 + 0.00233100233100233d0*(-v244)
    v1075      = 0.020979020979021d0*v247
    v1088      = v1075 + v524
    v1076      = -0.0769230769230769d0*v523
    v1077      = 0.00699300699300699d0*(-165.0d0*v523 + 45.0d0*v525) + v533 + v656
    S_xx       = v8
    v14        = M_x*S_xx
    v34        = M_z*S_xx
    v43        = M_yy*S_xx
    v46        = M_xx*S_xx
    v65        = M_xy*S_xx
    v100       = M_yz*S_xx
    v116       = M_xxx*S_xx
    v126       = M_xyy*S_xx
    v150       = M_xxy*S_xx
    v165       = M_yyy*S_xx
    v189       = M_xxz*S_xx
    v199       = M_yyz*S_xx
    v270       = M_xxxx*S_xx
    v281       = M_xxyy*S_xx
    v287       = M_xxzz*S_xx
    v307       = M_yyyy*S_xx
    v313       = M_yyzz*S_xx
    v348       = M_xxxy*S_xx
    v360       = M_xyyy*S_xx
    v394       = M_xxxz*S_xx
    v411       = M_xyyz*S_xx
    v482       = M_xxyz*S_xx
    v502       = M_yyyz*S_xx
    v559       = M_xxxxx*S_xx
    v570       = M_xxxyy*S_xx
    v578       = M_xxxzz*S_xx
    v609       = M_xyyyy*S_xx
    v616       = M_xyyzz*S_xx
    v692       = M_xxxxy*S_xx
    v713       = M_xxyyy*S_xx
    v720       = M_xxyzz*S_xx
    v762       = M_yyyyy*S_xx
    v771       = M_yyyzz*S_xx
    v820       = M_xxxxz*S_xx
    v838       = M_xxyyz*S_xx
    v853       = M_xxzzz*S_xx
    v892       = M_yyyyz*S_xx
    v910       = M_yyzzz*S_xx
    v961       = M_xyyyz*S_xx
    v998       = M_xxxyz*S_xx
    Ms_xx      = Ms_xx + (0.333333333333333d0*(-2.0d0*v10 + 4.0d0*v9) + M_0*S_xx + M_xx + v11)
    S_yy       = v12
    v24        = M_y*S_yy
    v35        = M_z*S_yy
    v41        = M_xx*S_yy
    v44        = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v42 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v41 + 4.0d0*v43))
    v54        = M_yy*S_yy
    v66        = M_xy*S_yy
    v77        = M_xz*S_yy
    v117       = M_xxx*S_yy
    v127       = M_xyy*S_yy
    v151       = M_xxy*S_yy
    v166       = M_yyy*S_yy
    v190       = M_xxz*S_yy
    v200       = M_yyz*S_yy
    v271       = M_xxxx*S_yy
    v282       = M_xxyy*S_yy
    v288       = M_xxzz*S_yy
    v308       = M_yyyy*S_yy
    v314       = M_yyzz*S_yy
    v349       = M_xxxy*S_yy
    v361       = M_xyyy*S_yy
    v395       = M_xxxz*S_yy
    v412       = M_xyyz*S_yy
    v483       = M_xxyz*S_yy
    v503       = M_yyyz*S_yy
    v560       = M_xxxxx*S_yy
    v571       = M_xxxyy*S_yy
    v579       = M_xxxzz*S_yy
    v610       = M_xyyyy*S_yy
    v617       = M_xyyzz*S_yy
    v693       = M_xxxxy*S_yy
    v714       = M_xxyyy*S_yy
    v721       = M_xxyzz*S_yy
    v763       = M_yyyyy*S_yy
    v772       = M_yyyzz*S_yy
    v821       = M_xxxxz*S_yy
    v839       = M_xxyyz*S_yy
    v854       = M_xxzzz*S_yy
    v893       = M_yyyyz*S_yy
    v894       = -0.20979020979021d0*v893
    v911       = M_yyzzz*S_yy
    v948       = M_xxxyz*S_yy
    v1015      = M_xyyyz*S_yy
    Ms_yy      = Ms_yy + (0.333333333333333d0*(4.0d0*v10 - 2.0d0*v9) + M_0*S_yy + M_yy + v11)
    S_zz       = -(S_xx + S_yy)
    S_xxx      = x*(v13 + v4)
    v45        = M_x*S_xxx
    v80        = M_z*S_xxx
    v114       = M_xx*S_xxx
    v131       = M_yy*S_xxx
    v155       = M_xy*S_xxx
    v192       = M_xz*S_xxx
    v230       = M_yz*S_xxx
    v268       = M_xxx*S_xxx
    v290       = M_xyy*S_xxx
    v335       = M_yyy*S_xxx
    v353       = M_xxy*S_xxx
    v402       = 10.0d0*S_xxx
    v428       = M_yyz*S_xxx
    v490       = M_xyz*S_xxx
    v557       = M_xxxx*S_xxx
    v583       = M_xxyy*S_xxx
    v593       = M_xxzz*S_xxx
    v637       = M_yyyy*S_xxx
    v646       = M_yyzz*S_xxx
    v698       = M_xxxy*S_xxx
    v733       = M_xyyy*S_xxx
    v827       = M_xxxz*S_xxx
    v861       = M_xyyz*S_xxx
    v1031      = M_yyyz*S_xxx
    Ms_xxx     = Ms_xxx + (M_0*S_xxx + M_xxx + 0.2d0*(3.0d0*(3.0d0*v14 + 3.0d0*v15 - 2.0d0*v16 - &
      2.0d0*v17 - 2.0d0*v18 - 2.0d0*v19)))
    S_xxy      = v21*y
    v53        = S_xxy*v52
    v62        = M_x*S_xxy
    v101       = M_z*S_xxy
    v125       = M_xy*S_xxy
    v145       = M_xx*S_xxy
    v163       = M_yy*S_xxy
    v201       = M_yz*S_xxy
    v279       = M_xxy*S_xxy
    v305       = M_yyy*S_xxy
    v331       = M_xyy*S_xxy
    v344       = M_xxx*S_xxy
    v415       = S_xxy*v414
    v484       = M_xxz*S_xxy
    v504       = M_yyz*S_xxy
    v568       = M_xxxy*S_xxy
    v607       = M_xyyy*S_xxy
    v687       = M_xxxx*S_xxy
    v711       = M_xxyy*S_xxy
    v724       = M_xxzz*S_xxy
    v760       = M_yyyy*S_xxy
    v775       = M_yyzz*S_xxy
    v840       = M_xxyz*S_xxy
    v897       = M_yyyz*S_xxy
    v999       = M_xxxz*S_xxy
    v1016      = M_xyyz*S_xxy
    Ms_xxy     = Ms_xxy + (M_0*S_xxy + M_xx*y + M_xxy + M_y*S_xx + 0.2d0*(2.0d0*(4.0d0*v22 + 4.0d0* &
      v23 - v24 - v25 - v26 - v27)))
    S_xxz      = v21*z
    v56        = M_z*S_xxz
    v70        = M_x*S_xxz
    v129       = M_xz*S_xxz
    v169       = M_yz*S_xxz
    v182       = M_xx*S_xxz
    v195       = M_yy*S_xxz
    v221       = M_xy*S_xxz
    v252       = M_yyz*S_xxz
    v286       = M_xxz*S_xxz
    v364       = M_xyz*S_xxz
    v407       = M_xyy*S_xxz
    v477       = M_xxy*S_xxz
    v498       = M_yyy*S_xxz
    v576       = M_xxxz*S_xxz
    v614       = M_xyyz*S_xxz
    v718       = M_xxyz*S_xxz
    v769       = M_yyyz*S_xxz
    v811       = M_xxxx*S_xxz
    v833       = M_xxyy*S_xxz
    v851       = M_xxzz*S_xxz
    v887       = M_yyyy*S_xxz
    v908       = M_yyzz*S_xxz
    v1011      = M_xyyy*S_xxz
    Ms_xxz     = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(8.0d0*(v28 + v30) + 7.0d0*(v29 + v34) + 2.0d0 &
      *(-v31 + v32 - v33 + v35)))
    S_xyy      = v36*x
    v68        = M_y*S_xyy
    v81        = M_z*S_xyy
    v85        = S_xyy*v84
    v115       = M_xx*S_xyy
    v132       = M_yy*S_xyy
    v156       = M_xy*S_xyy
    v193       = M_xz*S_xyy
    v269       = M_xxx*S_xyy
    v291       = M_xyy*S_xyy
    v324       = M_xxy*S_xyy
    v372       = M_yyy*S_xyy
    v403       = M_xxz*S_xyy
    v429       = M_yyz*S_xyy
    v531       = S_xyy*v414
    v558       = M_xxxx*S_xyy
    v584       = M_xxyy*S_xyy
    v594       = M_xxzz*S_xyy
    v638       = M_yyyy*S_xyy
    v647       = M_yyzz*S_xyy
    v699       = M_xxxy*S_xyy
    v734       = M_xyyy*S_xyy
    v828       = M_xxxz*S_xyy
    v862       = M_xyyz*S_xyy
    v1005      = M_xxyz*S_xyy
    v1032      = M_yyyz*S_xyy
    Ms_xyy     = Ms_xyy + (M_0*S_xyy + M_x*S_yy + M_xyy + M_yy*x + 0.2d0*(2.0d0*(-v14 - v15 + 4.0d0 &
      *v16 - v17 + 4.0d0*v18 - v19)))
    S_xzz      = -(S_xxx + S_xyy)
    S_yyy      = y*(v13 + v5)
    v88        = M_y*S_yyy
    v102       = M_z*S_yyy
    v146       = M_xx*S_yyy
    v164       = M_yy*S_yyy
    v202       = M_yz*S_yyy
    v207       = M_xy*S_yyy
    v226       = M_xz*S_yyy
    v280       = M_xxy*S_yyy
    v306       = M_yyy*S_yyy
    v322       = M_xxx*S_yyy
    v359       = M_xyy*S_yyy
    v416       = M_xyz*S_yyy
    v485       = M_xxz*S_yyy
    v535       = 10.0d0*S_yyy
    v569       = M_xxxy*S_yyy
    v608       = M_xyyy*S_yyy
    v688       = M_xxxx*S_yyy
    v712       = M_xxyy*S_yyy
    v725       = M_xxzz*S_yyy
    v761       = M_yyyy*S_yyy
    v776       = M_yyzz*S_yyy
    v841       = M_xxyz*S_yyy
    v898       = M_yyyz*S_yyy
    v1000      = M_xxxz*S_yyy
    Ms_yyy     = Ms_yyy + (M_0*S_yyy + M_yyy + 0.2d0*(3.0d0*(-2.0d0*v22 - 2.0d0*v23 + 3.0d0*v24 + &
      3.0d0*v25 - 2.0d0*v26 - 2.0d0*v27)))
    S_yyz      = v36*z
    v91        = M_z*S_yyz
    v97        = M_y*S_yyz
    v170       = M_yz*S_yyz
    v183       = M_xx*S_yyz
    v196       = M_yy*S_yyz
    v210       = M_xz*S_yyz
    v222       = M_xy*S_yyz
    v249       = M_xxz*S_yyz
    v312       = M_yyz*S_yyz
    v365       = M_xyz*S_yyz
    v387       = M_xxx*S_yyz
    v408       = M_xyy*S_yyz
    v478       = M_xxy*S_yyz
    v534       = 10.0d0*S_yyz
    v577       = M_xxxz*S_yyz
    v615       = M_xyyz*S_yyz
    v719       = M_xxyz*S_yyz
    v770       = M_yyyz*S_yyz
    v812       = M_xxxx*S_yyz
    v834       = M_xxyy*S_yyz
    v852       = M_xxzz*S_yyz
    v888       = M_yyyy*S_yyz
    v909       = M_yyzz*S_yyz
    v995       = M_xxxy*S_yyz
    Ms_yyz     = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(8.0d0*(v31 + v33) + 7.0d0*(v32 + v35) + 2.0d0 &
      *(-v28 + v29 - v30 + v34)))
    S_yzz      = -(S_xxy + S_yyy)
    S_zzz      = -(S_xxz + S_yyz)
    S_xxxx     = 0.142857142857143d0*(-6.0d0*v40) + v37 + v39
    v109       = M_x*S_xxxx
    v160       = M_y*S_xxxx
    v203       = M_z*S_xxxx
    v263       = M_xx*S_xxxx
    v300       = M_yy*S_xxxx
    v357       = M_xy*S_xxxx
    v417       = M_xz*S_xxxx
    v505       = M_yz*S_xxxx
    v552       = M_xxx*S_xxxx
    v602       = M_xyy*S_xxxx
    v706       = M_xxy*S_xxxx
    v755       = M_yyy*S_xxxx
    v846       = M_xxz*S_xxxx
    v903       = M_yyz*S_xxxx
    v1017      = M_xyz*S_xxxx
    Ms_xxxx    = Ms_xxxx + (M_0*S_xxxx + v44 - v49 - v53 + 0.0285714285714286d0*(32.0d0*M_xxxx - &
      3.0d0*M_yyyy + 114.0d0*v46 - 96.0d0*v51 + 80.0d0*(v45 + v47) - &
      60.0d0*(v50 + v56) + 24.0d0*(v54 + v55)))
    S_xxxy     = v0*v58
    v130       = M_y*S_xxxy
    v144       = M_x*S_xxxy
    v231       = M_z*S_xxxy
    v289       = M_xy*S_xxxy
    v342       = M_xx*S_xxxy
    v370       = M_yy*S_xxxy
    v432       = M_yz*S_xxxy
    v491       = M_xz*S_xxxy
    v581       = M_xxy*S_xxxy
    v635       = M_yyy*S_xxxy
    v685       = M_xxx*S_xxxy
    v731       = M_xyy*S_xxxy
    v865       = M_xyz*S_xxxy
    v1033      = M_yyz*S_xxxy
    Ms_xxxy    = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + M_y*S_xxx + v61 + 0.142857142857143d0*( &
      3.0d0*(5.0d0*v62 + 5.0d0*v63 + 5.0d0*v64 + 5.0d0*v65 - 2.0d0*v66 &
      - 2.0d0*v67 - 2.0d0*v68 - 2.0d0*v69)))
    S_xxxz     = v1*v58
    v136       = M_z*S_xxxz
    v181       = M_x*S_xxxz
    v294       = M_xz*S_xxxz
    v376       = M_yz*S_xxxz
    v384       = M_xx*S_xxxz
    v423       = M_yy*S_xxxz
    v448       = 0.242424242424242d0*v294
    v486       = M_xy*S_xxxz
    v591       = M_xxz*S_xxxz
    v644       = M_yyz*S_xxxz
    v740       = M_xyz*S_xxxz
    v809       = M_xxx*S_xxxz
    v856       = M_xyy*S_xxxz
    v1001      = M_xxy*S_xxxz
    v1026      = M_yyy*S_xxxz
    v1046      = 0.839160839160839d0*v740
    Ms_xxxz    = Ms_xxxz + (0.142857142857143d0*(15.0d0*(v70 + v73) + 13.0d0*(v72 + v80) + 6.0d0*( &
      -v74 + v75 + v77 + v78 - v79 + v81)) + M_0*S_xxxz + M_xxxz - M_y* &
      v60 + S_xx*v76 + S_xz*v71 - v59*y)
    S_xxyy     = 0.0285714285714286d0*v38 - v4*v82 - v5*v82 + v83
    v110       = M_x*S_xxyy
    v161       = M_y*S_xxyy
    v177       = M_z*S_xxyy
    v264       = M_xx*S_xxyy
    v301       = M_yy*S_xxyy
    v328       = M_xy*S_xxyy
    v418       = M_xz*S_xxyy
    v506       = M_yz*S_xxyy
    v553       = M_xxx*S_xxyy
    v603       = M_xyy*S_xxyy
    v707       = M_xxy*S_xxyy
    v756       = M_yyy*S_xxyy
    v847       = M_xxz*S_xxyy
    v904       = M_yyz*S_xxyy
    v965       = M_xyz*S_xxyy
    Ms_xxyy    = Ms_xxyy + (0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0*v42 + 39.0d0*(v41 + v43) - &
      (M_xxxx + M_xxzz + M_yyyy + M_yyzz + 10.0d0*v45 + 12.0d0*v46 + &
      10.0d0*v47 + 10.0d0*v50 + 12.0d0*v51 + 12.0d0*v54 + 12.0d0*v55 + &
      10.0d0*v56 + 10.0d0*v88 + 10.0d0*v89 + 10.0d0*v90 + 10.0d0*v91)) &
      + M_0*S_xxyy + v49 + v53 + v85 + v87)
    S_xxyz     = v2*(v4 + v92)
    v171       = M_z*S_xxyz
    v194       = M_y*S_xxyz
    v215       = M_x*S_xxyz
    v315       = M_yz*S_xxyz
    v366       = M_xz*S_xxyz
    v406       = M_xy*S_xxyz
    v468       = M_xx*S_xxyz
    v496       = M_yy*S_xxyz
    v619       = M_xyz*S_xxyz
    v722       = M_xxz*S_xxyz
    v773       = M_yyz*S_xxyz
    v831       = M_xxy*S_xxyz
    v885       = M_yyy*S_xxyz
    v1009      = M_xyy*S_xxyz
    Ms_xxyz    = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v95 + v96) + 9.0d0*(v100 + v101 + v93 + v94 &
      ) + 2.0d0*(v102 - v97 + v98 - v99)) + M_0*S_xxyz + M_xxyz + M_xxz &
      *y + M_xyz*v86 + M_y*S_xxz + S_xyz*v84)
    S_xxzz     = -(S_xxxx + S_xxyy)
    v111       = M_x*S_xxzz
    v140       = M_y*S_xxzz
    v178       = M_z*S_xxzz
    v265       = M_xx*S_xxzz
    v302       = M_yy*S_xxzz
    v329       = M_xy*S_xxzz
    v419       = M_xz*S_xxzz
    v462       = M_yz*S_xxzz
    v554       = M_xxx*S_xxzz
    v604       = M_xyy*S_xxzz
    v708       = M_xxy*S_xxzz
    v757       = M_yyy*S_xxzz
    v848       = M_xxz*S_xxzz
    v905       = M_yyz*S_xxzz
    v966       = M_xyz*S_xxzz
    S_xyyy     = v0*v103
    v211       = M_y*S_xyyy
    v232       = M_z*S_xyyy
    v234       = M_x*S_xyyy
    v343       = M_xx*S_xyyy
    v371       = M_yy*S_xyyy
    v433       = M_yz*S_xyyy
    v445       = M_xy*S_xyyy
    v492       = M_xz*S_xyyy
    v582       = M_xxy*S_xyyy
    v636       = M_yyy*S_xyyy
    v686       = M_xxx*S_xyyy
    v732       = M_xyy*S_xyyy
    v866       = M_xyz*S_xyyy
    v1006      = M_xxz*S_xyyy
    Ms_xyyy    = Ms_xyyy + (M_0*S_xyyy + M_x*S_yyy + M_xyyy + M_yyy*x + v61 + 0.142857142857143d0*( &
      3.0d0*(-2.0d0*v62 - 2.0d0*v63 - 2.0d0*v64 - 2.0d0*v65 + 5.0d0*v66 &
      + 5.0d0*v67 + 5.0d0*v68 + 5.0d0*v69)))
    S_xyyz     = v1*(v5 + v92)
    v214       = M_z*S_xyyz
    v227       = M_y*S_xyyz
    v238       = M_x*S_xyyz
    v377       = M_yz*S_xyyz
    v385       = M_xx*S_xyyz
    v424       = M_yy*S_xyyz
    v449       = M_xz*S_xyyz
    v487       = M_xy*S_xyyz
    v592       = M_xxz*S_xyyz
    v645       = M_yyz*S_xyyz
    v741       = M_xyz*S_xyyz
    v810       = M_xxx*S_xyyz
    v857       = M_xyy*S_xyyz
    v1002      = M_xxy*S_xyyz
    Ms_xyyz    = Ms_xyyz + (0.142857142857143d0*(12.0d0*(v74 + v79) + 2.0d0*(-v70 + v72 - v73 + v80 &
      ) + 9.0d0*(v75 + v77 + v78 + v81)) + M_0*S_xyyz + M_x*S_yyz + &
      M_xyyz + M_xyz*v48 + M_yyz*x + S_xyz*v52)
    S_xyzz     = -(S_xxxy + S_xyyy)
    S_xzzz     = -(S_xxxz + S_xyyz)
    S_yyyy     = 0.142857142857143d0*(-6.0d0*v105) + v104 + v39
    v112       = M_x*S_yyyy
    v162       = M_y*S_yyyy
    v204       = M_z*S_yyyy
    v266       = M_xx*S_yyyy
    v303       = M_yy*S_yyyy
    v358       = M_xy*S_yyyy
    v420       = M_xz*S_yyyy
    v507       = M_yz*S_yyyy
    v555       = M_xxx*S_yyyy
    v605       = M_xyy*S_yyyy
    v709       = M_xxy*S_yyyy
    v758       = M_yyy*S_yyyy
    v849       = M_xxz*S_yyyy
    v906       = M_yyz*S_yyyy
    v1018      = M_xyz*S_yyyy
    Ms_yyyy    = Ms_yyyy + (M_0*S_yyyy + v44 - v85 - v87 + 0.0285714285714286d0*(-3.0d0*M_xxxx + &
      32.0d0*M_yyyy + 114.0d0*v54 - 96.0d0*v55 + 24.0d0*(v46 + v51) + &
      80.0d0*(v88 + v89) - 60.0d0*(v90 + v91)))
    S_yyyz     = v103*v2
    v237       = M_z*S_yyyz
    v240       = M_y*S_yyyz
    v452       = M_yz*S_yyyz
    v453       = 0.242424242424242d0*v452
    v469       = M_xx*S_yyyz
    v497       = M_yy*S_yyyz
    v514       = M_xz*S_yyyz
    v519       = M_xy*S_yyyz
    v723       = M_xxz*S_yyyz
    v774       = M_yyz*S_yyyz
    v832       = M_xxy*S_yyyz
    v886       = M_yyy*S_yyyz
    v938       = M_xyz*S_yyyz
    v939       = 0.839160839160839d0*v938
    v987       = M_xxx*S_yyyz
    v1010      = M_xyy*S_yyyz
    Ms_yyyz    = Ms_yyyz + (0.142857142857143d0*(13.0d0*(v102 + v98) + 15.0d0*(v97 + v99) + 6.0d0*( &
      v100 + v101 + v93 + v94 - v95 - v96)) + M_0*S_yyyz - M_x*v60 + &
      M_yy*v106 + M_yyyz + S_yy*v107 - v59*x)
    S_yyzz     = -(S_xxyy + S_yyyy)
    v113       = M_x*S_yyzz
    v141       = M_y*S_yyzz
    v143       = -0.0476190476190476d0*(M_yyyyy + v1079 + v139 + v140 + v141 + v142)
    v179       = M_z*S_yyzz
    v180       = 0.0476190476190476d0*(18.0d0*(v172 + v177) - (2.0d0*M_xxyyz + M_xxzzz + &
      M_yyzzz + 5.0d0*v173 + 48.0d0*v174 + 48.0d0*v175 + 5.0d0*v176 + &
      5.0d0*v178 + 5.0d0*v179))
    v206       = -0.0476190476190476d0*(M_xxxxx + v1078 + v111 + v113 + v124 + v134)
    v267       = M_xx*S_yyzz
    v304       = M_yy*S_yyzz
    v330       = M_xy*S_yyzz
    v421       = M_xz*S_yyzz
    v463       = M_yz*S_yyzz
    v556       = M_xxx*S_yyzz
    v606       = M_xyy*S_yyzz
    v710       = M_xxy*S_yyzz
    v759       = M_yyy*S_yyzz
    v850       = M_xxz*S_yyzz
    v907       = M_yyz*S_yyzz
    v967       = M_xyz*S_yyzz
    S_yzzz     = -(S_xxyz + S_yyyz)
    S_zzzz     = -(S_xxzz + S_yyzz)
    S_xxxxx    = x*(0.111111111111111d0*(-10.0d0*v40) + v108 + v37)
    v258       = M_x*S_xxxxx
    v367       = M_y*S_xxxxx
    v434       = M_z*S_xxxxx
    v547       = M_xx*S_xxxxx
    v630       = M_yy*S_xxxxx
    v726       = M_xy*S_xxxxx
    v867       = M_xz*S_xxxxx
    v1034      = M_yz*S_xxxxx
    Ms_xxxxx   = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*( &
      v109 + v118) + 330.0d0*(v114 + v116) - 30.0d0*(M_xxxyy + v110 + &
      v122) + 60.0d0*(v115 + v117 + v126 + v131) - 140.0d0*(v119 + v120 &
      + v130 + v136) - 300.0d0*(v121 + v123 + v125 + v129) + 120.0d0*( &
      v127 + v128 + v132 + v135) - 15.0d0*(M_xxxzz + M_xyyyy + M_xyyzz &
      + v111 + v112 + v113 + v124 + v133 + v134)))
    S_xxxxy    = v138*y
    v295       = M_y*S_xxxxy
    v339       = M_x*S_xxxxy
    v508       = M_z*S_xxxxy
    v597       = M_xy*S_xxxxy
    v680       = M_xx*S_xxxxy
    v750       = M_yy*S_xxxxy
    v912       = M_yz*S_xxxxy
    v1019      = M_xz*S_xxxxy
    Ms_xxxxy   = Ms_xxxxy + (M_0*S_xxxxy + v143 + 0.0476190476190476d0*(78.0d0*(v145 + v150) + 4.0d0* &
      (v146 + v165) + 20.0d0*(M_xxxxy + v148 + v160) + 56.0d0*(v144 + &
      v147 + v149 + v155) + 8.0d0*(v164 + v166 + v168 + v170) - (2.0d0* &
      M_xxyyy + 24.0d0*v151 + 30.0d0*v152 + 28.0d0*v153 + 28.0d0*v154 + &
      48.0d0*v156 + 48.0d0*v157 + 48.0d0*v158 + 48.0d0*v159 + 30.0d0* &
      v161 + v162 + 24.0d0*v163 + v167 + 28.0d0*v169 + 28.0d0*v171)))
    S_xxxxz    = v138*z
    v316       = M_z*S_xxxxz
    v379       = M_x*S_xxxxz
    v493       = M_y*S_xxxxz
    v620       = M_xz*S_xxxxz
    v777       = M_yz*S_xxxxz
    v804       = M_xx*S_xxxxz
    v879       = M_yy*S_xxxxz
    v1007      = M_xy*S_xxxxz
    v1050      = -0.20979020979021d0*(v804 + v820)
    Ms_xxxxz   = Ms_xxxxz + (M_0*S_xxxxz + v180 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 56.0d0*(v181 &
      + v186) + 106.0d0*(v182 + v189) + 4.0d0*(v183 + v199) + 104.0d0*( &
      v184 + v192) + 44.0d0*(v185 + v203) + 32.0d0*(v190 + v195) + &
      48.0d0*(v191 + v193) + 8.0d0*(v196 + v200) - (M_yyyyz + 36.0d0* &
      v187 + 28.0d0*v188 + 28.0d0*v194 + 8.0d0*v197 + 5.0d0*v198 + &
      36.0d0*v201 + 8.0d0*v202 + 5.0d0*v204)))
    S_xxxyy    = x*(-v5*v6 + v137 + v205 + v83)
    v259       = M_x*S_xxxyy
    v368       = M_y*S_xxxyy
    v435       = M_z*S_xxxyy
    v548       = M_xx*S_xxxyy
    v631       = M_yy*S_xxxyy
    v727       = M_xy*S_xxxyy
    v868       = M_xz*S_xxxyy
    v1035      = M_yz*S_xxxyy
    Ms_xxxyy   = Ms_xxxyy + (M_0*S_xxxyy + v206 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*(v109 &
      + v118) + 141.0d0*(v110 + v122) + 159.0d0*(v115 + v126) + 75.0d0* &
      (v117 + v131) + 112.0d0*(v119 + v130) - 14.0d0*(v120 + v136) + &
      276.0d0*(v121 + v125) - 3.0d0*(M_xyyyy + v112 + v133) - 18.0d0*( &
      v114 + v116 + v123 + v129) - 60.0d0*(v127 + v128 + v132 + v135) - &
      42.0d0*(v207 + v208 + v209 + v210 + v211 + v212 + v213 + v214)))
    S_xxxyz    = v3*v8
    v378       = 1.81818181818182d0*S_xxxyz
    v422       = M_y*v378
    v467       = M_x*S_xxxyz
    v650       = M_yz*S_xxxyz
    v742       = M_xz*S_xxxyz
    v855       = M_xy*S_xxxyz
    v972       = M_yy*S_xxxyz
    v986       = M_xx*S_xxxyz
    v1047      = 0.839160839160839d0*v742
    Ms_xxxyz   = Ms_xxxyz + (0.333333333333333d0*(7.0d0*(v215 + v219 + v220 + v221) + 5.0d0*(v216 + &
      v217 + v230 + v231) + 2.0d0*(-v222 + v223 - v224 + v226 - v227 + &
      v228 - v229 + v232)) + M_0*S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy* &
      v218 + M_y*S_xxxz + S_xx*v225 + S_xxy*v76 + S_xyz*v71)
    S_xxxzz    = -(S_xxxxx + S_xxxyy)
    v260       = M_x*S_xxxzz
    v333       = M_y*S_xxxzz
    v436       = M_z*S_xxxzz
    v549       = M_xx*S_xxxzz
    v632       = M_yy*S_xxxzz
    v728       = M_xy*S_xxxzz
    v869       = M_xz*S_xxxzz
    v977       = M_yz*S_xxxzz
    v1067      = 0.34965034965035d0*v869
    S_xxyyy    = y*(-v4*v6 + v137 + v233)
    v296       = M_y*S_xxyyy
    v340       = M_x*S_xxyyy
    v509       = M_z*S_xxyyy
    v598       = M_xy*S_xxyyy
    v681       = M_xx*S_xxyyy
    v751       = M_yy*S_xxyyy
    v913       = M_yz*S_xxyyy
    v1020      = M_xz*S_xxyyy
    Ms_xxyyy   = Ms_xxyyy + (M_0*S_xxyyy + v143 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 75.0d0*(v146 &
      + v165) + 159.0d0*(v151 + v163) + 141.0d0*(v152 + v161) + 276.0d0 &
      *(v156 + v157) - 17.0d0*(v162 + v167) + 112.0d0*(v234 + v235) - &
      14.0d0*(v236 + v237) - 3.0d0*(M_xxxxy + v148 + v160) - 60.0d0*( &
      v145 + v150 + v158 + v159) - 18.0d0*(v164 + v166 + v168 + v170) - &
      42.0d0*(v144 + v147 + v149 + v153 + v154 + v155 + v169 + v171)))
    S_xxyyz    = z*(0.0158730158730159d0*v38 + v205 + v233)
    v254       = M_z*S_xxyyz
    v380       = M_x*S_xxyyz
    v494       = M_y*S_xxyyz
    v621       = M_xz*S_xxyyz
    v778       = M_yz*S_xxyyz
    v805       = M_xx*S_xxyyz
    v880       = M_yy*S_xxyyz
    v958       = M_xy*S_xxyyz
    Ms_xxyyz   = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v174 + v175) + 6.0d0*(v184 + v192 + v197 + v202) + 9.0d0*(v185 + &
      v198 + v203 + v204) + 132.0d0*(v187 + v191 + v193 + v201) + &
      112.0d0*(v188 + v194 + v238 + v239) + 81.0d0*(v172 + v177 + v183 &
      + v190 + v195 + v199) - (M_xxxxz + M_xxzzz + M_yyyyz + M_yyzzz + &
      5.0d0*v173 + 5.0d0*v176 + 5.0d0*v178 + 5.0d0*v179 + 14.0d0*v181 + &
      6.0d0*v182 + 14.0d0*v186 + 6.0d0*v189 + 6.0d0*v196 + 6.0d0*v200 + &
      14.0d0*v240 + 14.0d0*v241)))
    S_xxyzz    = -(S_xxxxy + S_xxyyy)
    v297       = M_y*S_xxyzz
    v320       = M_x*S_xxyzz
    v464       = M_z*S_xxyzz
    v599       = M_xy*S_xxyzz
    v682       = M_xx*S_xxyzz
    v752       = M_yy*S_xxyzz
    v914       = M_yz*S_xxyzz
    v915       = 0.34965034965035d0*v914
    v968       = M_xz*S_xxyzz
    S_xxzzz    = -(S_xxxxz + S_xxyyz)
    v255       = M_z*S_xxzzz
    v381       = M_x*S_xxzzz
    v457       = M_y*S_xxzzz
    v622       = M_xz*S_xxzzz
    v668       = M_yz*S_xxzzz
    v806       = M_xx*S_xxzzz
    v881       = M_yy*S_xxzzz
    v959       = M_xy*S_xxzzz
    S_xyyyy    = v242*x
    v261       = M_x*S_xyyyy
    v369       = M_y*S_xyyyy
    v437       = M_z*S_xyyyy
    v550       = M_xx*S_xyyyy
    v633       = M_yy*S_xyyyy
    v729       = M_xy*S_xyyyy
    v870       = M_xz*S_xyyyy
    v1036      = M_yz*S_xyyyy
    Ms_xyyyy   = Ms_xyyyy + (M_0*S_xyyyy + v206 + 0.0476190476190476d0*(4.0d0*(v117 + v131) + 78.0d0* &
      (v127 + v132) + 20.0d0*(M_xyyyy + v112 + v133) + 8.0d0*(v114 + &
      v116 + v123 + v129) + 56.0d0*(v207 + v208 + v211 + v212) - (2.0d0 &
      *M_xxxyy + v109 + 30.0d0*v110 + 24.0d0*v115 + v118 + 48.0d0*v121 &
      + 30.0d0*v122 + 48.0d0*v125 + 24.0d0*v126 + 48.0d0*v128 + 48.0d0* &
      v135 + 28.0d0*v209 + 28.0d0*v210 + 28.0d0*v213 + 28.0d0*v214)))
    S_xyyyz    = v12*v3
    v521       = M_y*S_xyyyz
    v526       = 1.81818181818182d0*S_xyyyz
    v527       = M_x*v526
    v942       = M_yz*S_xyyyz
    v943       = 0.839160839160839d0*v942
    v946       = M_xx*S_xyyyz
    v1025      = M_yy*S_xyyyz
    v1048      = M_xz*S_xyyyz
    v1063      = M_xy*S_xyyyz
    Ms_xyyyz   = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v222 + v224 + v227 + v229 &
      ) + 5.0d0*(v223 + v226 + v228 + v232) + 2.0d0*(-v215 + v216 + &
      v217 - v219 - v220 - v221 + v230 + v231)) + M_0*S_xyyyz + M_x* &
      S_yyyz + M_xyy*v106 + M_xyyyz + M_yyyz*x + S_xyy*v107 + S_yy*v225)
    S_xyyzz    = -(S_xxxyy + S_xyyyy)
    v262       = M_x*S_xyyzz
    v334       = M_y*S_xyyzz
    v438       = M_z*S_xyyzz
    v551       = M_xx*S_xyyzz
    v634       = M_yy*S_xyyzz
    v730       = M_xy*S_xyyzz
    v871       = M_xz*S_xyyzz
    v978       = M_yz*S_xyyzz
    v1068      = 0.34965034965035d0*v871
    S_xyzzz    = -(S_xxxyz + S_xyyyz)
    S_xzzzz    = -(S_xxxzz + S_xyyzz)
    S_yyyyy    = y*(0.111111111111111d0*(-10.0d0*v105) + v104 + v108)
    v298       = M_y*S_yyyyy
    v341       = M_x*S_yyyyy
    v510       = M_z*S_yyyyy
    v600       = M_xy*S_yyyyy
    v683       = M_xx*S_yyyyy
    v753       = M_yy*S_yyyyy
    v916       = M_yz*S_yyyyy
    v1021      = M_xz*S_yyyyy
    Ms_yyyyy   = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*( &
      v162 + v167) + 330.0d0*(v164 + v166) - 30.0d0*(M_xxyyy + v152 + &
      v161) + 120.0d0*(v145 + v150 + v158 + v159) + 60.0d0*(v146 + v151 &
      + v163 + v165) - 300.0d0*(v156 + v157 + v168 + v170) - 140.0d0*( &
      v234 + v235 + v236 + v237) - 15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz &
      + v139 + v140 + v141 + v142 + v148 + v160)))
    S_yyyyz    = v242*z
    v317       = M_z*S_yyyyz
    v382       = M_x*S_yyyyz
    v495       = M_y*S_yyyyz
    v623       = M_xz*S_yyyyz
    v779       = M_yz*S_yyyyz
    v807       = M_xx*S_yyyyz
    v882       = M_yy*S_yyyyz
    v883       = -0.20979020979021d0*v882
    v1090      = v883 + v894
    v1008      = M_xy*S_yyyyz
    Ms_yyyyz   = Ms_yyyyz + (M_0*S_yyyyz + v180 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 8.0d0*(v182 &
      + v189) + 32.0d0*(v183 + v199) + 48.0d0*(v187 + v201) + 4.0d0*( &
      v190 + v195) + 106.0d0*(v196 + v200) + 104.0d0*(v197 + v202) + &
      44.0d0*(v198 + v204) + 56.0d0*(v240 + v241) - (M_xxxxz + 8.0d0* &
      v184 + 5.0d0*v185 + 36.0d0*v191 + 8.0d0*v192 + 36.0d0*v193 + &
      5.0d0*v203 + 28.0d0*v238 + 28.0d0*v239)))
    S_yyyzz    = -(S_xxyyy + S_yyyyy)
    v299       = M_y*S_yyyzz
    v321       = M_x*S_yyyzz
    v338       = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz - &
      v320 - v321 + 4.0d0*v322 - v323 - 24.0d0*v324 - 30.0d0*v325 - &
      v326 - v327 - 30.0d0*v328 - v329 - v330 - 24.0d0*v331 - v332 - &
      v333 - v334 + 4.0d0*v335 - v336 - v337))
    v465       = M_z*S_yyyzz
    v601       = M_xy*S_yyyzz
    v684       = M_xx*S_yyyzz
    v754       = M_yy*S_yyyzz
    v917       = M_yz*S_yyyzz
    v918       = 0.34965034965035d0*v917
    v969       = M_xz*S_yyyzz
    S_yyzzz    = -(S_xxyyz + S_yyyyz)
    v256       = M_z*S_yyzzz
    v1084      = v1089 - 15.0d0*M_xxyyzz + 3.0d0*(2.0d0*v250 + 2.0d0*v253 + 2.0d0*v255 + &
      2.0d0*v256)
    v257       = 0.00432900432900433d0*(1440.0d0*v251 + 5.0d0*(v1084 + 12.0d0*v248 - &
      8.0d0*v249 - 8.0d0*v252 + 12.0d0*v254))
    v383       = M_x*S_yyzzz
    v443       = 0.00432900432900433d0*(v1084 - 720.0d0*v251 - 240.0d0*(v248 + v254) - &
      260.0d0*(v249 + v252))
    v458       = M_y*S_yyzzz
    v466       = -0.0303030303030303d0*(M_yyyyyz + v1081 + v456 + v457 + v458 + v461 + &
      5.0d0*(v454 + v455 + v459 + v460 + v462 + v463 + v464 + v465))
    v518       = -0.0303030303030303d0*(M_xxxxxz + v1080 + v381 + v383 + v405 + v431 + &
      5.0d0*(v396 + v404 + v413 + v419 + v421 + v430 + v436 + v438))
    v624       = M_xz*S_yyzzz
    v669       = M_yz*S_yyzzz
    v808       = M_xx*S_yyzzz
    v884       = M_yy*S_yyzzz
    v960       = M_xy*S_yyzzz
    S_yzzzz    = -(S_xxyzz + S_yyyzz)
    S_zzzzz    = -(S_xxzzz + S_yyzzz)
    S_xxxxxx   = v243 + v245 + 0.0909090909090909d0*(-15.0d0*v246 + 5.0d0*v247)
    v538       = M_x*S_xxxxxx
    v743       = M_y*S_xxxxxx
    v919       = M_z*S_xxxxxx
    Ms_xxxxxx  = Ms_xxxxxx + (M_0*S_xxxxxx + v257 + 0.00432900432900433d0*(136.0d0*M_xxxxxx - 75.0d0* &
      M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + 2360.0d0*v268 - &
      2340.0d0*v279 - 2260.0d0*v286 + 1440.0d0*v291 + 576.0d0*(v258 + &
      v272) + 1620.0d0*(v263 + v270) - 120.0d0*(v280 + v305) + 840.0d0* &
      (v284 + v315) - 160.0d0*(v306 + v312) + 90.0d0*(-M_xxxxzz + v264 &
      + v281) + 360.0d0*(-v259 + v271 - v276 + v300) + 720.0d0*(v269 + &
      v282 + v290 + v301) - 600.0d0*(v273 + v274 + v295 + v316) - &
      1680.0d0*(v275 + v277 + v289 + v294) - 165.0d0*(v265 + v266 + &
      v267 + v287 + v307 + v313) - 180.0d0*(M_xxxxyy + v260 + v261 + &
      v262 + v278 + v292 + v293) + 60.0d0*(v283 - v288 + v296 - v302 - &
      v303 - v304 - v308 - v314) + 30.0d0*(v285 + v297 + v298 + v299 + &
      v309 + v310 + v311 + v317)))
    S_xxxxxy   = v0*v319
    v625       = M_y*S_xxxxxy
    v675       = M_x*S_xxxxxy
    v1037      = M_z*S_xxxxxy
    Ms_xxxxxy  = Ms_xxxxxy + (M_0*S_xxxxxy - M_z*v378 + v338 - v351*z + 0.0303030303030303d0*(-10.0d0* &
      (v340 + v354) + 20.0d0*(v343 + v360) - 70.0d0*(v350 + v368) - &
      60.0d0*(v352 + v376) + 28.0d0*(M_xxxxxy + v346 + v367) + 100.0d0* &
      (v339 + v345 + v347 + v357) + 190.0d0*(v342 + v344 + v348 + v353 &
      ) - 140.0d0*(v355 + v356 + v364 + v366) - 5.0d0*(M_xyyyyy + v341 &
      + v358 + v362 + v369 + v373 + v374) + 40.0d0*(-v349 + v359 + v361 &
      + v363 + v365 - v370 + v371 + v372 + v375 + v377)))
    S_xxxxxz   = v1*v319
    v651       = M_z*S_xxxxxz
    v799       = M_x*S_xxxxxz
    v1022      = M_y*S_xxxxxz
    Ms_xxxxxz  = Ms_xxxxxz + (M_0*S_xxxxxz + M_xxz*v402 + S_xxz*v386 - v393 - v398 - v415 - v422 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 250.0d0*(v384 + v394) + &
      220.0d0*(v388 + v417) + 68.0d0*(v389 + v434) + 80.0d0*(v395 + &
      v423) + 90.0d0*(v399 + v418) - 140.0d0*(v401 + v406) + 160.0d0*( &
      v403 + v407) + 100.0d0*(v379 + v390 - v391 - v432) + 20.0d0*(v385 &
      + v387 + v411 + v428) + 10890.0d0*(-M_xxxyyz - v380 + v392 - v400 &
      + v435) + 40.0d0*(v408 - v409 + v412 - v416 + v424 - v425 + v429 &
      - v433) - 5.0d0*(M_xxxzzz + M_xyyyyz + M_xyyzzz + v381 + v382 + &
      v383 + v405 + v427 + v431) - 25.0d0*(v396 + v404 + v410 + v413 + &
      v419 + v420 + v421 + v426 + v430 + v436 + v437 + v438)))
    S_xxxxyy   = 0.0303030303030303d0*(-3.0d0*v246 + 2.0d0*v247) + v440 + v441 + v442*v5
    v539       = M_x*S_xxxxyy
    v744       = M_y*S_xxxxyy
    v920       = M_z*S_xxxxyy
    v921       = 0.559440559440559d0*v920
    Ms_xxxxyy  = Ms_xxxxyy + (M_0*S_xxxxyy + v443 - v444 - v448 + v451 + v453 + 0.00432900432900433d0* &
      (-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - 11.0d0*M_xxxxzz - 5.0d0* &
      M_yyyyyy - 4.0d0*M_yyyyzz + 1800.0d0*v279 - 720.0d0*v291 - 64.0d0 &
      *(v258 + v272) + 628.0d0*(v259 + v276) - 82.0d0*(v263 + v270) + &
      942.0d0*(v264 + v281) + 2.0d0*(v266 + v307) - 60.0d0*(v268 + v286 &
      ) + 760.0d0*(v269 + v290) + 412.0d0*(v273 + v295) - 36.0d0*(v274 &
      + v316) + 1288.0d0*(v275 + v289) - 220.0d0*(v280 + v305) - &
      402.0d0*(v282 + v301) - 392.0d0*(v284 + v315) + 37.0d0*(v303 + &
      v308) + 80.0d0*(v306 + v312) + 6.0d0*(v310 + v317) - 26.0d0*(v265 &
      + v267 + v287 + v313) + 268.0d0*(v271 - v283 - v296 + v300) - &
      19.0d0*(v288 + v302 + v304 + v314) - 448.0d0*(v445 + v446 + v447 &
      + v449) - 8.0d0*(v285 + v297 + v298 + v299 + v309 + v311) - &
      22.0d0*(M_xxyyyy + v260 + v261 + v262 + v278 + v292 + v293)))
    S_xxxxyz   = v2*(-v439 + v37 + v442)
    v780       = M_z*S_xxxxyz
    v872       = M_y*S_xxxxyz
    v983       = M_x*S_xxxxyz
    Ms_xxxxyz  = Ms_xxxxyz + (M_0*S_xxxxyz + v466 + 0.0303030303030303d0*(26.0d0*(v480 + v509) + &
      40.0d0*(v485 + v498) + 8.0d0*(v497 + v503) + 32.0d0*(M_xxxxyz + &
      v473 + v493) + 96.0d0*(v467 + v475 + v476 + v486) + 170.0d0*(v468 &
      + v477 + v482 + v484) + 4.0d0*(v469 + v483 + v496 + v502) + &
      160.0d0*(v470 + v474 + v490 + v491) + 64.0d0*(v471 + v472 + v488 &
      + v492 + v505 + v508) - (2.0d0*M_xxyyyz + 40.0d0*v478 + 18.0d0* &
      v479 + 38.0d0*v481 + 64.0d0*v487 + 64.0d0*v489 + 38.0d0*v494 + &
      v495 + 13.0d0*v499 + 5.0d0*v500 + v501 + 40.0d0*v504 + 18.0d0* &
      v506 + 13.0d0*v507 + 5.0d0*v510)))
    S_xxxxzz   = -(S_xxxxxx + S_xxxxyy)
    v540       = M_x*S_xxxxzz
    v745       = M_y*S_xxxxzz
    v922       = M_z*S_xxxxzz
    v934       = 0.104895104895105d0*v540
    v1070      = 0.174825174825175d0*v922
    S_xxxyyy   = v0*(0.0909090909090909d0*v38 + v511 + v512 + v83)
    v626       = M_y*S_xxxyyy
    v676       = M_x*S_xxxyyy
    v979       = M_z*S_xxxyyy
    Ms_xxxyyy  = Ms_xxxyyy + (0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v322 + v335) + 75.0d0*(v324 + v331) + 69.0d0*(v325 + v328) + &
      25.0d0*(v340 + v350 + v354 + v368) + 31.0d0*(v343 + v349 + v360 + &
      v370) - (M_xxxxxy + 11.0d0*M_xxxyz*v513 + M_xxxyzz + M_xyyyyy + &
      11.0d0*M_xyyyz*v513 + M_xyyyzz + 11.0d0*S_xxxyz*v516 + 11.0d0* &
      S_xyyyz*v516 + v320 + v321 + v323 + v326 + v327 + v329 + v330 + &
      v332 + v333 + v334 + v336 + v337 + 7.0d0*v339 + v341 + 10.0d0* &
      v342 + 10.0d0*v344 + 7.0d0*v345 + v346 + 7.0d0*v347 + 10.0d0*v348 &
      + 6.0d0*v352 + 10.0d0*v353 + 10.0d0*v355 + 10.0d0*v356 + 7.0d0* &
      v357 + 7.0d0*v358 + 10.0d0*v359 + 10.0d0*v361 + 7.0d0*v362 + &
      10.0d0*v363 + 10.0d0*v364 + 10.0d0*v365 + 10.0d0*v366 + v367 + &
      7.0d0*v369 + 10.0d0*v371 + 10.0d0*v372 + 7.0d0*v373 + v374 + &
      10.0d0*v375 + 6.0d0*v376 + 10.0d0*v377 + 6.0d0*v514 + 6.0d0*v515 &
      )))
    S_xxxyyz   = v1*(0.0909090909090909d0*(-v40) + v512 + v517)
    v652       = M_z*S_xxxyyz
    v800       = M_x*S_xxxyyz
    v1023      = M_y*S_xxxyyz
    Ms_xxxyyz  = Ms_xxxyyz + (M_0*S_xxxyyz + M_xxyy*v218 + S_xxyy*v76 + v393 + v398 + v415 + v422 + &
      v518 + 0.0303030303030303d0*(31.0d0*M_xxxyyz + v389 + v434 + &
      79.0d0*(v380 + v400) + 103.0d0*(v385 + v411) + 55.0d0*(v387 + &
      v428) + 88.0d0*(v391 + v432) + 47.0d0*(v392 + v435) + 43.0d0*( &
      v395 + v423) + 152.0d0*(v401 + v406) + 95.0d0*(v403 + v407) + &
      10.0d0*(v409 + v416 + v425 + v433) + 13.0d0*(v410 + v420 + v426 + &
      v437) - (M_xyyyyz + 7.0d0*v379 + v382 + 4.0d0*v384 + v388 + 7.0d0 &
      *v390 + 4.0d0*v394 + 10.0d0*v408 + 10.0d0*v412 + v417 + 10.0d0* &
      v424 + v427 + 10.0d0*v429 + 18.0d0*v519 + 18.0d0*v520 + 18.0d0* &
      v521 + 18.0d0*v522)))
    S_xxxyzz   = -(S_xxxxxy + S_xxxyyy)
    v627       = M_y*S_xxxyzz
    v677       = M_x*S_xxxyzz
    v980       = M_z*S_xxxyzz
    S_xxxzzz   = -(S_xxxxxz + S_xxxyyz)
    v653       = M_z*S_xxxzzz
    v801       = M_x*S_xxxzzz
    v970       = M_y*S_xxxzzz
    v1055      = 0.0699300699300699d0*v801
    S_xxyyyy   = 0.0303030303030303d0*(-3.0d0*v523 + 2.0d0*v525) + v4*v442 + v440 + v524
    v541       = M_x*S_xxyyyy
    v746       = M_y*S_xxyyyy
    v923       = M_z*S_xxyyyy
    v1071      = 0.559440559440559d0*v923
    Ms_xxyyyy  = Ms_xxyyyy + (M_0*S_xxyyyy + v443 + v444 + v448 - v451 - v453 + 0.00432900432900433d0* &
      (-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0*M_xxyyyy - 12.0d0* &
      M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v279 + 1800.0d0*v291 + &
      412.0d0*(v261 + v292) + 37.0d0*(v263 + v270) - 402.0d0*(v264 + &
      v281) + 80.0d0*(v268 + v286) - 220.0d0*(v269 + v290) + 2.0d0*( &
      v271 + v300) + 6.0d0*(v274 + v316) + 760.0d0*(v280 + v305) + &
      942.0d0*(v282 + v301) + 628.0d0*(v283 + v296) - 64.0d0*(v298 + &
      v309) - 82.0d0*(v303 + v308) - 60.0d0*(v306 + v312) - 36.0d0*( &
      v310 + v317) + 1288.0d0*(v445 + v446) - 392.0d0*(v447 + v449) + &
      268.0d0*(-v259 + v266 - v276 + v307) - 19.0d0*(v265 + v267 + v287 &
      + v313) - 448.0d0*(v275 + v284 + v289 + v315) - 26.0d0*(v288 + &
      v302 + v304 + v314) - 8.0d0*(v258 + v260 + v262 + v272 + v278 + &
      v293) - 22.0d0*(M_xxxxyy + v273 + v285 + v295 + v297 + v299 + &
      v311)))
    S_xxyyyz   = v2*(0.0909090909090909d0*(-v105) + v511 + v517)
    v781       = M_z*S_xxyyyz
    v873       = M_y*S_xxyyyz
    v984       = M_x*S_xxyyyz
    Ms_xxyyyz  = Ms_xxyyyz + (M_0*S_xxyyyz + v466 + v527 + v528 + v530 + v531 + 0.0303030303030303d0*( &
      31.0d0*M_xxyyyz + v500 + v510 + 43.0d0*(v469 + v502) + 95.0d0*( &
      v478 + v504) + 99.0d0*(v479 + v506) + 47.0d0*(v480 + v509) + &
      79.0d0*(v481 + v494) + 103.0d0*(v483 + v496) + 55.0d0*(v485 + &
      v498) + 152.0d0*(v487 + v489) + 88.0d0*(v488 + v492) + 10.0d0*( &
      v470 + v474 + v490 + v491) + 13.0d0*(v471 + v472 + v505 + v508) - &
      (M_xxxxyz + 18.0d0*v467 + 10.0d0*v468 + v473 + 18.0d0*v475 + &
      18.0d0*v476 + 10.0d0*v477 + 10.0d0*v482 + 10.0d0*v484 + 18.0d0* &
      v486 + v493 + 7.0d0*v495 + 4.0d0*v497 + v499 + 7.0d0*v501 + 4.0d0 &
      *v503 + v507)))
    S_xxyyzz   = -(S_xxxxyy + S_xxyyyy)
    v542       = M_x*S_xxyyzz
    v662       = M_y*S_xxyyzz
    v792       = M_z*S_xxyyzz
    v793       = -1.22377622377622d0*v792
    v1072      = -0.244755244755245d0*v792
    S_xxyzzz   = -(S_xxxxyz + S_xxyyyz)
    v670       = M_z*S_xxyzzz
    v874       = M_y*S_xxyzzz
    v875       = 0.0699300699300699d0*v874
    v944       = M_x*S_xxyzzz
    S_xxzzzz   = -(S_xxxxzz + S_xxyyzz)
    v543       = M_x*S_xxzzzz
    v663       = M_y*S_xxzzzz
    v794       = M_z*S_xxzzzz
    v795       = 0.0815850815850816d0*v794
    v1073      = 0.0163170163170163d0*v794
    S_xyyyyy   = v0*v532
    v628       = M_y*S_xyyyyy
    v678       = M_x*S_xyyyyy
    v1038      = M_z*S_xyyyyy
    Ms_xyyyyy  = Ms_xyyyyy + (M_0*S_xyyyyy - M_z*v526 + v338 - v529*z + 0.0303030303030303d0*(-70.0d0* &
      (v340 + v354) + 20.0d0*(v349 + v370) - 10.0d0*(v350 + v368) - &
      60.0d0*(v514 + v515) + 28.0d0*(M_xyyyyy + v341 + v374) + 100.0d0* &
      (v358 + v362 + v369 + v373) + 190.0d0*(v359 + v361 + v371 + v372 &
      ) - 140.0d0*(v363 + v365 + v375 + v377) - 5.0d0*(M_xxxxxy + v339 &
      + v345 + v346 + v347 + v357 + v367) + 40.0d0*(v342 - v343 + v344 &
      + v348 + v353 + v355 + v356 - v360 + v364 + v366)))
    S_xyyyyz   = v1*(0.0909090909090909d0*(-6.0d0*v105) + v104 + v442)
    v654       = M_z*S_xyyyyz
    v802       = M_x*S_xyyyyz
    v1024      = M_y*S_xyyyyz
    Ms_xyyyyz  = Ms_xyyyyz + (M_0*S_xyyyyz + v518 + 0.0303030303030303d0*(8.0d0*(v384 + v394) + 40.0d0 &
      *(v387 + v428) + 26.0d0*(v392 + v435) + 32.0d0*(M_xyyyyz + v382 + &
      v427) + 4.0d0*(v385 + v395 + v411 + v423) + 170.0d0*(v408 + v412 &
      + v424 + v429) + 160.0d0*(v409 + v416 + v425 + v433) + 96.0d0*( &
      v519 + v520 + v521 + v522) + 64.0d0*(v391 + v410 + v420 + v426 + &
      v432 + v437) - (2.0d0*M_xxxyyz + v379 + 38.0d0*v380 + 13.0d0*v388 &
      + 5.0d0*v389 + v390 + 18.0d0*v399 + 38.0d0*v400 + 64.0d0*v401 + &
      40.0d0*v403 + 64.0d0*v406 + 40.0d0*v407 + 13.0d0*v417 + 18.0d0* &
      v418 + 5.0d0*v434)))
    S_xyyyzz   = -(S_xxxyyy + S_xyyyyy)
    v629       = M_y*S_xyyyzz
    v679       = M_x*S_xyyyzz
    v981       = M_z*S_xyyyzz
    S_xyyzzz   = -(S_xxxyyz + S_xyyyyz)
    v655       = M_z*S_xyyzzz
    v803       = M_x*S_xyyzzz
    v971       = M_y*S_xyyzzz
    v1056      = 0.0699300699300699d0*v803
    S_xyzzzz   = -(S_xxxyzz + S_xyyyzz)
    S_xzzzzz   = -(S_xxxzzz + S_xyyzzz)
    S_yyyyyy   = v245 + v533 + 0.0909090909090909d0*(-15.0d0*v523 + 5.0d0*v525)
    v544       = M_x*S_yyyyyy
    v747       = M_y*S_yyyyyy
    v924       = M_z*S_yyyyyy
    Ms_yyyyyy  = Ms_yyyyyy + (M_0*S_yyyyyy + v257 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v279 - &
      2340.0d0*v291 + 2360.0d0*v306 - 2260.0d0*v312 - 160.0d0*(v268 + &
      v286) - 120.0d0*(v269 + v290) + 576.0d0*(v298 + v309) + 1620.0d0* &
      (v303 + v308) + 840.0d0*(v447 + v449) + 90.0d0*(-M_yyyyzz + v282 &
      + v301) - 600.0d0*(v261 + v292 + v310 + v317) + 720.0d0*(v264 + &
      v280 + v281 + v305) + 360.0d0*(v266 - v283 - v296 + v307) - &
      1680.0d0*(v445 + v446 + v450 + v452) - 165.0d0*(v271 + v288 + &
      v300 + v302 + v304 + v314) - 180.0d0*(M_xxyyyy + v273 + v285 + &
      v295 + v297 + v299 + v311) + 30.0d0*(v258 + v260 + v262 + v272 + &
      v274 + v278 + v293 + v316) + 60.0d0*(v259 - v263 - v265 - v267 - &
      v270 + v276 - v287 - v313)))
    S_yyyyyz   = v2*v532
    v782       = M_z*S_yyyyyz
    v876       = M_y*S_yyyyyz
    v985       = M_x*S_yyyyyz
    Ms_yyyyyz  = Ms_yyyyyz + (M_0*S_yyyyyz + M_yyy*v534 + M_yyz*v535 - v527 - v528 - v530 - v531 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 80.0d0*(v469 + v502) + &
      160.0d0*(v478 + v504) + 90.0d0*(v479 + v506) - 140.0d0*(v487 + &
      v489) + 250.0d0*(v497 + v503) + 220.0d0*(v499 + v507) + 68.0d0*( &
      v500 + v510) + 20.0d0*(v483 + v485 + v496 + v498) + 100.0d0*( &
      -v488 - v492 + v495 + v501) + 10890.0d0*(-M_xxyyyz + v480 - v481 &
      - v494 + v509) + 40.0d0*(v468 - v470 - v474 + v477 + v482 + v484 &
      - v490 - v491) - 5.0d0*(M_xxxxyz + M_xxyzzz + M_yyyzzz + v456 + &
      v457 + v458 + v461 + v473 + v493) - 25.0d0*(v454 + v455 + v459 + &
      v460 + v462 + v463 + v464 + v465 + v471 + v472 + v505 + v508)))
    S_yyyyzz   = -(S_xxyyyy + S_yyyyyy)
    v545       = M_x*S_yyyyzz
    v748       = M_y*S_yyyyzz
    v749       = 0.104895104895105d0*v748
    v925       = M_z*S_yyyyzz
    v926       = 0.174825174825175d0*v925
    S_yyyzzz   = -(S_xxyyyz + S_yyyyyz)
    v671       = M_z*S_yyyzzz
    v877       = M_y*S_yyyzzz
    v878       = 0.0699300699300699d0*v877
    v945       = M_x*S_yyyzzz
    v982       = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 5.0d0*(-3.0d0*M_xxxyzzz - &
      3.0d0*M_xyyyzzz - 3.0d0*v944 - 3.0d0*v945 + 12.0d0*v946 + 14.0d0* &
      v947 + 12.0d0*v948 - 15.0d0*v949 - 15.0d0*v950 - 3.0d0*v951 - &
      54.0d0*v952 - 114.0d0*v953 - 15.0d0*v954 - 3.0d0*v955 - 15.0d0* &
      v956 - 3.0d0*v957 - 114.0d0*v958 - 3.0d0*v959 - 3.0d0*v960 + &
      12.0d0*v961 - 15.0d0*v962 - 15.0d0*v963 - 3.0d0*v964 - 54.0d0* &
      v965 - 15.0d0*v966 - 15.0d0*v967 - 15.0d0*v968 - 15.0d0*v969 - &
      3.0d0*v970 - 3.0d0*v971 + 12.0d0*v972 - 15.0d0*v973 - 3.0d0*v974 &
      - 15.0d0*v975 - 3.0d0*v976 - 15.0d0*v977 - 15.0d0*v978 + 14.0d0* &
      v979 - 15.0d0*v980 - 15.0d0*v981))
    S_yyzzzz   = -(S_xxyyzz + S_yyyyzz)
    v546       = M_x*S_yyzzzz
    v664       = M_y*S_yyzzzz
    v672       = 0.00233100233100233d0*(5.0d0*(v1083 - 15.0d0*v658 + 6.0d0*v659 + 6.0d0* &
      v660 + v661 - 15.0d0*v662 + v663 + v664 + 6.0d0*v665 + 6.0d0*v666 &
      + v667 + 6.0d0*v668 + 6.0d0*v669 + 6.0d0*v670 + 6.0d0*v671))
    v796       = M_z*S_yyzzzz
    v797       = 0.0815850815850816d0*v796
    v931       = 0.00233100233100233d0*(5.0d0*(v1082 - 15.0d0*v542 + v543 + v546 + 6.0d0* &
      v580 - 15.0d0*v588 + 6.0d0*v595 + v596 + 6.0d0*v618 + 6.0d0*v622 &
      + 6.0d0*v624 + 6.0d0*v648 + v649 + 6.0d0*v653 + 6.0d0*v655))
    v1074      = 0.0163170163170163d0*v796
    v1087      = v1052 + v1053 + v1054 + v1061 + v1062 + v1069 + v1072 + v1073 + v1074
    S_yzzzzz   = -(S_xxyzzz + S_yyyzzz)
    S_zzzzzz   = -(S_xxzzzz + S_yyzzzz)
    S_xxxxxxx  = x*(v243 + v536 + 0.00699300699300699d0*(-231.0d0*v246 + 105.0d0*v247))
    Ms_xxxxxxx = Ms_xxxxxxx + (M_0*S_xxxxxxx + v537 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*(v538 + v561) - 1260.0d0*(v539 + v565) - 630.0d0*(v540 + &
      v567) + 3444.0d0*(v547 + v559) - 1050.0d0*(v548 + v570) + &
      6860.0d0*(v552 + v557) + 1470.0d0*(v553 + v583) - 7980.0d0*(v568 &
      + v581) + 1680.0d0*(v571 + v631) - 7420.0d0*(v576 + v591) + &
      5040.0d0*(v584 + v603) + 5880.0d0*(v589 + v619) + 70.0d0*( &
      M_xyyyyyy + v544 + v640) + 105.0d0*(-M_xxxyyyy + M_xyyyyzz + v545 &
      + v642) - 525.0d0*(v541 + v542 + v586 + v588) + 2520.0d0*(v558 + &
      v574 + v602 + v650) - 1176.0d0*(v562 + v563 + v625 + v651) - &
      4200.0d0*(v564 + v566 + v597 + v620) - 280.0d0*(v577 + v592 + &
      v614 + v644) - 1120.0d0*(v608 + v615 + v636 + v645) + 35.0d0*( &
      M_xxxzzzz + M_xyyzzzz + v543 + v546 + v596 + v649) - 1155.0d0*( &
      v549 + v550 + v551 + v578 + v609 + v616) - 735.0d0*(v554 + v555 + &
      v556 + v593 + v637 + v646) + 840.0d0*(v560 - v569 - v582 - v607 + &
      v630 - v635) + 420.0d0*(-M_xxxxxyy + v572 + v573 - v579 + v585 + &
      v587 - v594 + v598 - v604 - v605 - v606 - v610 - v617 + v621 + &
      v626 - v632 - v633 - v634 - v638 - v647 + v652) + 210.0d0*( &
      -M_xxxxxzz + v575 + v580 + v590 + v595 + v599 + v600 + v601 + &
      v611 + v612 + v613 + v618 + v622 + v623 + v624 + v627 + v628 + &
      v629 + v639 + v641 + v643 + v648 + v653 + v654 + v655)))
    S_xxxxxxy  = v657*y
    Ms_xxxxxxy = Ms_xxxxxxy + (M_0*S_xxxxxxy + v672 + v673 + v674 + v749 + v768 + 0.00233100233100233d0 &
      *(-105.0d0*M_xxyyyyy + 10.0d0*M_yyyyyyy + 150.0d0*(v681 + v713) + &
      4640.0d0*(v685 + v698) - 1200.0d0*(v694 + v744) - 3870.0d0*(v707 &
      + v711) - 315.0d0*(v709 + v760) + 840.0d0*(v712 + v756) + &
      1020.0d0*(v714 + v751) - 45.0d0*(v715 + v746) + 1140.0d0*(v717 + &
      v778) - 3940.0d0*(v718 + v722) + 1040.0d0*(v719 + v773) - 220.0d0 &
      *(v758 + v761) - 160.0d0*(v770 + v774) + 304.0d0*(M_xxxxxxy + &
      v690 + v743) - 120.0d0*(M_xxxxyzz + v697 + v745) + 1344.0d0*(v675 &
      + v689 + v691 + v726) - 2880.0d0*(v702 + v704 + v740 + v742) + &
      40.0d0*(-v723 + v747 + v764 - v769) + 480.0d0*(-v676 + v688 - &
      v693 - v701 - v750 + v755) + 3360.0d0*(v680 + v687 + v692 - v700 &
      + v706 - v727) + 960.0d0*(v686 - v695 - v696 + v733 - v777 - v780 &
      ) + 1920.0d0*(-v699 - v731 + v732 + v734 + v738 + v741) + 60.0d0* &
      (v716 - v725 - v757 - v759 - v776 + v781) - 195.0d0*(v682 + v683 &
      + v684 + v708 + v710 + v720 + v724 + v762 + v771 + v775) + 30.0d0 &
      *(-v721 - v752 - v753 - v754 - v763 + v765 + v766 - v772 + v779 + &
      v782) - 240.0d0*(M_xxxxyyy + v677 + v678 + v679 + v703 + v705 + &
      v728 + v729 + v730 + v735 + v736 + v737 + v739)))
    S_xxxxxxz  = v657*z
    Ms_xxxxxxz = Ms_xxxxxxz + (M_0*S_xxxxxxz + v1090 + v783 + v784 + v785 + v787 + v789 + v791 + v793 + &
      v795 + v797 + v798 - v818 + v843 + v845 + v875 + v878 + v896 + &
      v900 + v902 + v915 + v918 - v921 + v926 + 0.00233100233100233d0*( &
      304.0d0*M_xxxxxxz - 105.0d0*M_xxyyyyz + 10.0d0*M_yyyyyyz + &
      1344.0d0*(v799 + v815) + 4320.0d0*(v804 + v820) + 7520.0d0*(v809 &
      + v827) + 6720.0d0*(v811 + v846) + 3264.0d0*(v813 + v867) + &
      784.0d0*(v814 + v919) + 1440.0d0*(v821 + v879) - 600.0d0*(v822 + &
      v922) - 4800.0d0*(v823 + v865) - 2880.0d0*(v826 + v855) + &
      3840.0d0*(v828 + v856) - 5100.0d0*(v831 + v840) + 2970.0d0*(v833 &
      + v847) + 1080.0d0*(v834 + v904) - 780.0d0*(v835 + v913) - &
      555.0d0*(v836 + v923) + 900.0d0*(v839 + v880) - 735.0d0*(v849 + &
      v887) + 30.0d0*(v876 + v891) - 160.0d0*(v886 + v898) + 150.0d0*( &
      v889 + v916) + 40.0d0*(v890 + v924) - 120.0d0*(M_xxxxzzz + v832 + &
      v897) + 960.0d0*(v810 - v819 + v861 - v872) + 60.0d0*(v837 + v873 &
      + v888 + v906) - 775.0d0*(v848 + v850 + v851 + v908) - 100.0d0*( &
      v852 + v905 + v907 + v909) + 480.0d0*(-v800 + v812 + v824 - v825 &
      + v868 + v903) + 90.0d0*(v805 + v838 - v854 - v881 - v884 - v911 &
      ) - 225.0d0*(v806 + v807 + v808 + v853 + v892 + v910) + 1920.0d0* &
      (-v816 + v857 - v858 + v862 - v866 - v912) - 240.0d0*(M_xxxxyyz + &
      v801 + v802 + v803 + v830 + v860 + v864) - 1200.0d0*(v829 + v841 &
      + v859 + v863 + v869 + v870 + v871 + v885)))
    S_xxxxxyy  = x*(0.00699300699300699d0*(10.0d0*v247) + v1085 + v441 + v5*v928 + v927)
    Ms_xxxxxyy = Ms_xxxxxyy + (M_0*S_xxxxxyy + v931 - v932 + v933 - v934 - v935 + v937 + v939 + v941 + &
      v943 + 0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0* &
      M_xxxxxyy - 116.0d0*(v538 + v561) + 1350.0d0*(v539 + v565) - &
      210.0d0*(v547 + v559) + 2550.0d0*(v548 + v570) - 190.0d0*(v552 + &
      v557) + 2730.0d0*(v553 + v583) + 1620.0d0*(v558 + v602) + 444.0d0 &
      *(v560 + v630) + 732.0d0*(v562 + v625) - 36.0d0*(v563 + v651) + &
      2820.0d0*(v564 + v597) + 5160.0d0*(v568 + v581) - 420.0d0*(v569 + &
      v635) - 1110.0d0*(v571 + v631) - 780.0d0*(v572 + v626) - 600.0d0* &
      (v573 + v652) - 1080.0d0*(v574 + v650) - 100.0d0*(v576 + v591) - &
      700.0d0*(v577 + v644) - 1380.0d0*(v582 + v607) - 2790.0d0*(v584 + &
      v603) - 1740.0d0*(v585 + v598) - 1560.0d0*(v587 + v621) - &
      2760.0d0*(v589 + v619) - 1660.0d0*(v592 + v614) - 35.0d0*( &
      M_xyyyyyy + v544 + v640) + 255.0d0*(v605 + v610 + v633 + v638) + &
      560.0d0*(v608 + v615 + v636 + v645) - 120.0d0*(v541 + v549 + v551 &
      + v578 + v586 + v616) + 90.0d0*(-M_xxxyyyy - v554 + v555 - v556 - &
      v593 + v637 - v646) + 30.0d0*(-M_xyyyyzz - v545 + v612 + v623 + &
      v641 - v642 + v654) - 105.0d0*(v579 + v594 + v604 + v606 + v617 + &
      v632 + v634 + v647) + 60.0d0*(v550 - v566 - v575 - v590 - v599 - &
      v600 - v601 + v609 - v611 - v613 - v620 - v627 - v628 - v629 - &
      v639 - v643)))
    S_xxxxxyz  = v3*(-v929 + v37 + v928)
    Ms_xxxxxyz = Ms_xxxxxyz + (M_0*S_xxxxxyz + M_xxyz*v402 + S_xxyz*v386 + v982 + 0.00699300699300699d0 &
      *(390.0d0*(v1003 + v1020) - 30.0d0*(v1004 + v984) - 250.0d0*( &
      v1023 + v997) - 270.0d0*(v1035 + v996) + 1430.0d0*(M_xxxy*S_xxz + &
      M_xxz*S_xxxy) + 128.0d0*(M_xxxxxyz + v1022 + v991) + 280.0d0*( &
      v1000 + v1026 - v1033 - v995) + 1110.0d0*(v1001 + v986 + v998 + &
      v999) + 600.0d0*(-v1002 + v1006 + v1011 - v1016) + 60.0d0*(v1005 &
      + v1009 + v1031 + v987) + 480.0d0*(v1007 + v983 + v993 + v994) + &
      120.0d0*(v1010 + v1015 + v1025 + v1032) - 195.0d0*(v1012 + v1018 &
      + v1027 + v1036) - 75.0d0*(v1013 + v1021 + v1028 + v1038) + &
      960.0d0*(v1017 + v1019 + v988 + v992) + 288.0d0*(v1034 + v1037 + &
      v989 + v990) - 15.0d0*(M_xyyyyyz + v1008 + v1014 + v1024 + v1029 &
      + v1030 + v985)))
    S_xxxxyyy  = y*(v1040 + v1086 + 0.00699300699300699d0*(-33.0d0*v246 + 18.0d0*v247))
    Ms_xxxxyyy = Ms_xxxxyyy + (M_0*S_xxxxyyy + v1042 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v661 + v663 + v664 + v667 + 380.0d0*(v676 &
      + v701) + 630.0d0*(v681 + v713) + 560.0d0*(v686 + v733) + 200.0d0 &
      *(v688 + v755) + 420.0d0*(v693 + v750) + 330.0d0*(v694 + v744) + &
      1320.0d0*(v699 + v731) + 1140.0d0*(v700 + v727) + 1710.0d0*(v707 &
      + v711) + 9.0d0*(v753 + v763) + 25.0d0*(v758 + v761) + 30.0d0*( &
      v766 + v779) + 40.0d0*(v770 + v774) + 6.0d0*(v659 + v660 + v665 + &
      v666 + v668 + v669 + v670 + v671 + v765 + v782) - (16.0d0* &
      M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + M_yyyyyyy + &
      143.0d0*v1043 + 143.0d0*v1044 + 240.0d0*v1045 + 143.0d0*v1046 + &
      143.0d0*v1047 + 240.0d0*v1048 + 15.0d0*v658 + 15.0d0*v662 + &
      96.0d0*v675 + 30.0d0*v677 + 30.0d0*v678 + 30.0d0*v679 + 150.0d0* &
      v680 + 30.0d0*v682 + 18.0d0*v683 + 30.0d0*v684 + 140.0d0*v685 + &
      150.0d0*v687 + 96.0d0*v689 + 16.0d0*v690 + 96.0d0*v691 + 150.0d0* &
      v692 + 60.0d0*v695 + 60.0d0*v696 + 15.0d0*v697 + 140.0d0*v698 + &
      30.0d0*v703 + 30.0d0*v705 + 150.0d0*v706 + 30.0d0*v708 + 150.0d0* &
      v709 + 30.0d0*v710 + 270.0d0*v712 + 270.0d0*v714 + 150.0d0*v715 + &
      120.0d0*v716 + 240.0d0*v717 + 140.0d0*v718 + 260.0d0*v719 + &
      30.0d0*v720 + 15.0d0*v721 + 140.0d0*v722 + 140.0d0*v723 + 30.0d0* &
      v724 + 15.0d0*v725 + 96.0d0*v726 + 30.0d0*v728 + 270.0d0*v729 + &
      30.0d0*v730 + 480.0d0*v732 + 480.0d0*v734 + 270.0d0*v735 + 30.0d0 &
      *v736 + 30.0d0*v737 + 480.0d0*v738 + 30.0d0*v739 + 480.0d0*v741 + &
      16.0d0*v743 + 15.0d0*v745 + 150.0d0*v746 + v747 + 270.0d0*v751 + &
      15.0d0*v752 + 15.0d0*v754 + 270.0d0*v756 + 15.0d0*v757 + 15.0d0* &
      v759 + 150.0d0*v760 + 18.0d0*v762 + v764 + 140.0d0*v769 + 30.0d0* &
      v771 + 15.0d0*v772 + 260.0d0*v773 + 30.0d0*v775 + 15.0d0*v776 + &
      60.0d0*v777 + 240.0d0*v778 + 60.0d0*v780 + 120.0d0*v781)))
    S_xxxxyyz  = z*(0.00699300699300699d0*(6.0d0*v247) + v1049 + v1086 + v927)
    Ms_xxxxyyz = Ms_xxxxyyz + (M_0*S_xxxxyyz + v1050 - v1051 - v1055 - v1056 - v1057 - v1058 - v1059 + &
      v1060 - v1065 - v1066 - v1067 - v1068 - v1070 + v1071 + v1087 + &
      0.00233100233100233d0*(390.0d0*M_xxxxyyz - 7.0d0*M_yyyyyyz - &
      6.0d0*M_yyyyzzz - 720.0d0*(v1063 + v1064) + 1260.0d0*(v800 + v825 &
      ) - 20.0d0*(v809 + v827) + 2160.0d0*(v810 + v861) - 90.0d0*(v811 &
      + v846) + 840.0d0*(v812 + v903) + 1380.0d0*(v816 + v912) + &
      690.0d0*(v817 + v920) + 780.0d0*(v819 + v872) + 540.0d0*(v821 + &
      v879) + 3720.0d0*(v823 + v865) + 1860.0d0*(v824 + v868) + &
      2520.0d0*(v826 + v855) + 1560.0d0*(v828 + v856) + 4200.0d0*(v831 &
      + v840) - 450.0d0*(v834 + v904) - 270.0d0*(v839 + v880) + 300.0d0 &
      *(v841 + v885) + 330.0d0*(v849 + v887) + 570.0d0*(v859 + v870) + &
      45.0d0*(v882 + v893) + 40.0d0*(v886 + v898) - 105.0d0*(v888 + &
      v906) - 132.0d0*(v889 + v916) - 37.0d0*(v890 + v924) - 16.0d0*( &
      M_xxxxxxz + v814 + v919) - 96.0d0*(v799 + v813 + v815 + v867) + &
      2250.0d0*(v805 + v833 + v838 + v847) - 36.0d0*(v806 + v808 + v853 &
      + v910) - 420.0d0*(v832 + v837 + v873 + v897) - 110.0d0*(v848 + &
      v850 + v851 + v908) - 65.0d0*(v852 + v905 + v907 + v909) - 27.0d0 &
      *(v854 + v881 + v884 + v911) + 480.0d0*(-v857 + v858 - v862 + &
      v866) - 30.0d0*(M_xxyyyyz + v802 + v860 + v895 + v925) + 60.0d0*( &
      v835 - v842 - v899 + v913 - v914 - v917) - 12.0d0*(v844 + v874 + &
      v876 + v877 + v891 + v901)))
    S_xxxyyyy  = x*(v1040 + v1088 + 0.00699300699300699d0*(-33.0d0*v523 + 18.0d0*v525))
    Ms_xxxyyyy = Ms_xxxyyyy + (M_0*S_xxxyyyy + v933 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + v543 + v546 + v596 + v649 + 330.0d0*(v541 &
      + v586) + 9.0d0*(v547 + v559) + 420.0d0*(v550 + v609) + 25.0d0*( &
      v552 + v557) + 200.0d0*(v555 + v637) + 30.0d0*(v566 + v620) + &
      560.0d0*(v569 + v635) + 630.0d0*(v571 + v631) + 380.0d0*(v572 + &
      v626) + 40.0d0*(v576 + v591) + 1320.0d0*(v582 + v607) + 1710.0d0* &
      (v584 + v603) + 1140.0d0*(v585 + v598) + 6.0d0*(v563 + v580 + &
      v595 + v618 + v622 + v624 + v648 + v651 + v653 + v655) - ( &
      M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + v538 + 150.0d0*v539 + 15.0d0*v542 + 16.0d0*v544 + &
      15.0d0*v545 + 270.0d0*v548 + 15.0d0*v549 + 15.0d0*v551 + 270.0d0* &
      v553 + 15.0d0*v554 + 15.0d0*v556 + 150.0d0*v558 + 18.0d0*v560 + &
      v561 + 30.0d0*v562 + 270.0d0*v564 + 150.0d0*v565 + 480.0d0*v568 + &
      270.0d0*v570 + 120.0d0*v573 + 240.0d0*v574 + 30.0d0*v575 + &
      140.0d0*v577 + 15.0d0*v578 + 30.0d0*v579 + 480.0d0*v581 + 270.0d0 &
      *v583 + 240.0d0*v587 + 15.0d0*v588 + 480.0d0*v589 + 30.0d0*v590 + &
      260.0d0*v592 + 15.0d0*v593 + 30.0d0*v594 + 270.0d0*v597 + 30.0d0* &
      v599 + 96.0d0*v600 + 30.0d0*v601 + 150.0d0*v602 + 30.0d0*v604 + &
      150.0d0*v605 + 30.0d0*v606 + 140.0d0*v608 + 150.0d0*v610 + 96.0d0 &
      *v611 + 60.0d0*v612 + 30.0d0*v613 + 260.0d0*v614 + 140.0d0*v615 + &
      15.0d0*v616 + 30.0d0*v617 + 480.0d0*v619 + 240.0d0*v621 + 60.0d0* &
      v623 + 30.0d0*v625 + 30.0d0*v627 + 96.0d0*v628 + 30.0d0*v629 + &
      18.0d0*v630 + 30.0d0*v632 + 150.0d0*v633 + 30.0d0*v634 + 140.0d0* &
      v636 + 150.0d0*v638 + 96.0d0*v639 + 16.0d0*v640 + 60.0d0*v641 + &
      15.0d0*v642 + 30.0d0*v643 + 140.0d0*v644 + 140.0d0*v645 + 15.0d0* &
      v646 + 30.0d0*v647 + 240.0d0*v650 + 120.0d0*v652 + 60.0d0*v654 + &
      143.0d0*v937 + 143.0d0*v939 + 143.0d0*v941 + 143.0d0*v943)))
    S_xxxyyyz  = -v3*0.00699300699300699d0*(-9.0d0*v38 - 143.0d0*v83 + 33.0d0*(v105 + v40 &
      ))
    Ms_xxxyyyz = Ms_xxxyyyz + (0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*(v947 + v979) + 945.0d0*(v953 + v958) + 245.0d0*(v1000 + &
      v1026 + v1031 + v987) + 345.0d0*(v1004 + v1023 + v984 + v997) + &
      525.0d0*(v1006 + v1011 + v1033 + v995) + 1125.0d0*(v1002 + v1005 &
      + v1009 + v1016 + v952 + v965) - 60.0d0*(v1001 + v1010 + v1015 + &
      v1025 + v1032 + v986 + v998 + v999) + 465.0d0*(v1003 + v1020 + &
      v1035 + v946 + v948 + v961 + v972 + v996) - 75.0d0*(v1007 + v1008 &
      + v1014 + v1024 + v1030 + v983 + v993 + v994) + 15.0d0*(v1012 + &
      v1017 + v1018 + v1019 + v1027 + v1036 + v988 + v992) + 21.0d0*( &
      v1013 + v1021 + v1028 + v1034 + v1037 + v1038 + v989 + v990) - &
      45.0d0*(v949 + v950 + v954 + v956 + v962 + v963 + v966 + v967 + &
      v968 + v969 + v973 + v975 + v977 + v978 + v980 + v981) - 9.0d0*( &
      M_xxxxxyz + M_xxxyzzz + M_xyyyyyz + M_xyyyzzz + v1022 + v1029 + &
      v944 + v945 + v951 + v955 + v957 + v959 + v960 + v964 + v970 + &
      v971 + v974 + v976 + v985 + v991)))
    S_xxyyyyy  = y*(0.00699300699300699d0*(10.0d0*v525) + v1076 + v1085 + v4*v928 + v524)
    Ms_xxyyyyy = Ms_xxyyyyy + (M_0*S_xxyyyyy + v1042 + v1043 + v1044 + v1046 + v1047 + v672 - v674 - &
      v749 - v768 + 0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0* &
      M_yyyyyyy - 1080.0d0*(v1045 + v1048) - 780.0d0*(v676 + v701) + &
      732.0d0*(v678 + v736) - 1110.0d0*(v681 + v713) + 444.0d0*(v683 + &
      v762) - 420.0d0*(v686 + v733) - 1380.0d0*(v699 + v731) - 1740.0d0 &
      *(v700 + v727) - 2790.0d0*(v707 + v711) + 1620.0d0*(v709 + v760) &
      + 2730.0d0*(v712 + v756) + 2550.0d0*(v714 + v751) + 1350.0d0*( &
      v715 + v746) - 600.0d0*(v716 + v781) - 1560.0d0*(v717 + v778) - &
      1660.0d0*(v719 + v773) - 700.0d0*(v723 + v769) + 2820.0d0*(v729 + &
      v735) + 5160.0d0*(v732 + v734) - 2760.0d0*(v738 + v741) - 116.0d0 &
      *(v747 + v764) - 210.0d0*(v753 + v763) - 190.0d0*(v758 + v761) - &
      36.0d0*(v765 + v782) - 100.0d0*(v770 + v774) - 35.0d0*(M_xxxxxxy &
      + v690 + v743) + 255.0d0*(v680 + v687 + v692 + v706) + 560.0d0*( &
      v685 + v698 + v718 + v722) - 120.0d0*(v694 + v721 + v744 + v752 + &
      v754 + v772) + 90.0d0*(-M_xxxxyyy + v688 - v725 + v755 - v757 - &
      v759 - v776) + 30.0d0*(-M_xxxxyzz + v695 + v696 - v697 - v745 + &
      v777 + v780) - 105.0d0*(v682 + v684 + v708 + v710 + v720 + v724 + &
      v771 + v775) + 60.0d0*(-v675 - v677 - v679 - v689 - v691 + v693 - &
      v703 - v705 - v726 - v728 - v730 - v737 - v739 + v750 - v766 - &
      v779)))
    S_xxyyyyz  = z*(0.00699300699300699d0*(6.0d0*v525) + v1049 + v1076 + v1088)
    Ms_xxyyyyz = Ms_xxyyyyz + (M_0*S_xxyyyyz + v1087 + v1090 - v798 + v818 - v843 - v845 - v875 - v878 &
      - v896 - v900 - v902 - v915 - v918 + v921 - v926 + &
      0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0*M_xxxxzzz + &
      390.0d0*M_xxyyyyz + 2520.0d0*(v1063 + v1064) + 780.0d0*(v802 + &
      v860) + 45.0d0*(v804 + v820) - 270.0d0*(v805 + v838) + 540.0d0*( &
      v807 + v892) + 40.0d0*(v809 + v827) + 300.0d0*(v810 + v861) - &
      105.0d0*(v811 + v846) + 330.0d0*(v812 + v903) - 132.0d0*(v813 + &
      v867) - 37.0d0*(v814 + v919) + 570.0d0*(v816 + v912) - 720.0d0*( &
      v826 + v855) + 1560.0d0*(v832 + v897) - 450.0d0*(v833 + v847) + &
      1860.0d0*(v835 + v913) + 690.0d0*(v836 + v923) + 1260.0d0*(v837 + &
      v873) + 2160.0d0*(v841 + v885) + 840.0d0*(v849 + v887) + 4200.0d0 &
      *(v857 + v862) + 3720.0d0*(v858 + v866) + 1380.0d0*(v859 + v870) &
      - 20.0d0*(v886 + v898) - 90.0d0*(v888 + v906) - 16.0d0*(M_yyyyyyz &
      + v890 + v924) - 420.0d0*(v800 + v825 + v828 + v856) - 27.0d0*( &
      v806 + v808 + v853 + v910) + 480.0d0*(v823 - v831 - v840 + v865) &
      + 2250.0d0*(v834 + v839 + v880 + v904) - 65.0d0*(v848 + v850 + &
      v851 + v908) - 110.0d0*(v852 + v905 + v907 + v909) - 36.0d0*(v854 &
      + v881 + v884 + v911) - 96.0d0*(v876 + v889 + v891 + v916) - &
      30.0d0*(M_xxxxyyz + v819 + v822 + v872 + v922) - 12.0d0*(v799 + &
      v801 + v803 + v815 + v830 + v864) + 60.0d0*(v824 - v829 - v863 + &
      v868 - v869 - v871)))
    S_xyyyyyy  = v1077*x
    Ms_xyyyyyy = Ms_xyyyyyy + (M_0*S_xyyyyyy + v537 + v931 + v932 + v934 + v935 + 0.00233100233100233d0 &
      *(10.0d0*M_xxxxxxx - 105.0d0*M_xxxxxyy - 45.0d0*(v539 + v565) - &
      1200.0d0*(v541 + v586) + 1020.0d0*(v548 + v570) - 220.0d0*(v552 + &
      v557) + 840.0d0*(v553 + v583) - 315.0d0*(v558 + v602) + 150.0d0*( &
      v571 + v631) - 160.0d0*(v576 + v591) - 3870.0d0*(v584 + v603) + &
      1140.0d0*(v587 + v621) + 1040.0d0*(v592 + v614) + 4640.0d0*(v608 &
      + v636) - 3940.0d0*(v615 + v645) + 304.0d0*(M_xyyyyyy + v544 + &
      v640) - 120.0d0*(M_xyyyyzz + v545 + v642) + 40.0d0*(v538 + v561 - &
      v577 - v644) + 1344.0d0*(v600 + v611 + v628 + v639) - 2880.0d0*( &
      v936 + v938 + v940 + v942) + 480.0d0*(-v550 + v555 - v572 - v609 &
      - v626 + v637) + 60.0d0*(-v554 - v556 + v573 - v593 - v646 + v652 &
      ) + 1920.0d0*(v568 + v581 - v582 + v589 - v607 + v619) + 960.0d0* &
      (v569 - v612 - v623 + v635 - v641 - v654) + 3360.0d0*(-v585 - &
      v598 + v605 + v610 + v633 + v638) + 30.0d0*(-v547 - v549 - v551 - &
      v559 + v563 + v566 - v578 - v616 + v620 + v651) - 195.0d0*(v560 + &
      v579 + v594 + v604 + v606 + v617 + v630 + v632 + v634 + v647) - &
      240.0d0*(M_xxxyyyy + v562 + v564 + v575 + v590 + v597 + v599 + &
      v601 + v613 + v625 + v627 + v629 + v643)))
    S_xyyyyyz  = v3*(0.0769230769230769d0*(-10.0d0*v105) + v104 + v928)
    Ms_xyyyyyz = Ms_xyyyyyz + (M_0*S_xyyyyyz + M_xyyy*v534 + M_xyyz*v535 + v982 + 0.00699300699300699d0 &
      *(-270.0d0*(v1003 + v1020) - 250.0d0*(v1004 + v984) - 30.0d0*( &
      v1023 + v997) + 390.0d0*(v1035 + v996) + 1430.0d0*(M_yyy*S_xyyz + &
      M_yyz*S_xyyy) + 128.0d0*(M_xyyyyyz + v1029 + v985) + 60.0d0*( &
      v1000 + v1002 + v1016 + v1026) + 120.0d0*(v1001 + v986 + v998 + &
      v999) + 600.0d0*(-v1005 - v1009 + v1033 + v995) + 280.0d0*(-v1006 &
      - v1011 + v1031 + v987) + 480.0d0*(v1008 + v1014 + v1024 + v1030 &
      ) + 1110.0d0*(v1010 + v1015 + v1025 + v1032) + 960.0d0*(v1012 + &
      v1018 + v1027 + v1036) + 288.0d0*(v1013 + v1021 + v1028 + v1038) &
      - 195.0d0*(v1017 + v1019 + v988 + v992) - 75.0d0*(v1034 + v1037 + &
      v989 + v990) - 15.0d0*(M_xxxxxyz + v1007 + v1022 + v983 + v991 + &
      v993 + v994)))
    S_yyyyyyy  = y*(0.00699300699300699d0*(-231.0d0*v523 + 105.0d0*v525) + v533 + v536)
    Ms_yyyyyyy = Ms_yyyyyyy + (M_0*S_yyyyyyy + v673 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      1680.0d0*(v681 + v713) + 5040.0d0*(v707 + v711) + 1470.0d0*(v712 &
      + v756) - 1050.0d0*(v714 + v751) - 1260.0d0*(v715 + v746) - &
      7980.0d0*(v732 + v734) + 5880.0d0*(v738 + v741) + 952.0d0*(v747 + &
      v764) - 630.0d0*(v748 + v767) + 3444.0d0*(v753 + v763) + 6860.0d0 &
      *(v758 + v761) - 7420.0d0*(v770 + v774) + 70.0d0*(M_xxxxxxy + &
      v690 + v743) + 105.0d0*(-M_xxxxyyy + M_xxxxyzz + v697 + v745) + &
      2520.0d0*(v1045 + v1048 + v709 + v760) - 525.0d0*(v658 + v662 + &
      v694 + v744) - 1176.0d0*(v678 + v736 + v765 + v782) - 1120.0d0*( &
      v685 + v698 + v718 + v722) - 280.0d0*(v719 + v723 + v769 + v773) &
      - 4200.0d0*(v729 + v735 + v766 + v779) + 35.0d0*(M_xxyzzzz + &
      M_yyyzzzz + v661 + v663 + v664 + v667) + 840.0d0*(v683 - v686 - &
      v699 - v731 - v733 + v762) - 735.0d0*(v688 + v725 + v755 + v757 + &
      v759 + v776) - 1155.0d0*(v693 + v721 + v750 + v752 + v754 + v772 &
      ) + 420.0d0*(-M_xxyyyyy + v676 - v680 - v682 - v684 - v687 - v692 &
      + v700 + v701 - v706 - v708 - v710 + v716 + v717 - v720 - v724 + &
      v727 - v771 - v775 + v778 + v781) + 210.0d0*(-M_yyyyyzz + v659 + &
      v660 + v665 + v666 + v668 + v669 + v670 + v671 + v675 + v677 + &
      v679 + v689 + v691 + v695 + v696 + v703 + v705 + v726 + v728 + &
      v730 + v737 + v739 + v777 + v780)))
    S_yyyyyyz  = v1077*z
    Ms_yyyyyyz = Ms_yyyyyyz + (M_0*S_yyyyyyz + v1050 + v1051 + v1055 + v1056 + v1057 + v1058 + v1059 - &
      v1060 + v1065 + v1066 + v1067 + v1068 + v1070 - v1071 + v783 + &
      v784 + v785 + v787 + v789 + v791 + v793 + v795 + v797 + &
      0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0*M_xxxxyyz + &
      304.0d0*M_yyyyyyz - 2880.0d0*(v1063 + v1064) + 30.0d0*(v799 + &
      v815) + 900.0d0*(v805 + v838) + 1440.0d0*(v807 + v892) - 160.0d0* &
      (v809 + v827) - 735.0d0*(v812 + v903) + 150.0d0*(v813 + v867) + &
      40.0d0*(v814 + v919) - 555.0d0*(v817 + v920) - 780.0d0*(v824 + &
      v868) + 3840.0d0*(v832 + v897) + 1080.0d0*(v833 + v847) + &
      2970.0d0*(v834 + v904) - 5100.0d0*(v857 + v862) - 4800.0d0*(v858 &
      + v866) + 1344.0d0*(v876 + v891) + 4320.0d0*(v882 + v893) + &
      7520.0d0*(v886 + v898) + 6720.0d0*(v888 + v906) + 3264.0d0*(v889 &
      + v916) + 784.0d0*(v890 + v924) - 600.0d0*(v895 + v925) - 120.0d0 &
      *(M_yyyyzzz + v828 + v856) + 60.0d0*(v800 + v811 + v825 + v846) + &
      960.0d0*(-v802 + v841 - v860 + v885) - 100.0d0*(v848 + v850 + &
      v851 + v908) - 775.0d0*(v852 + v905 + v907 + v909) + 90.0d0*( &
      -v806 - v808 + v839 - v853 + v880 - v910) - 225.0d0*(v821 + v854 &
      + v879 + v881 + v884 + v911) + 1920.0d0*(-v823 + v831 + v840 - &
      v859 - v865 - v870) + 480.0d0*(v835 - v837 + v849 - v873 + v887 + &
      v913) - 240.0d0*(M_xxyyyyz + v819 + v844 + v872 + v874 + v877 + &
      v901) - 1200.0d0*(v810 + v816 + v842 + v861 + v899 + v912 + v914 &
      + v917)))
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
#undef  Ms_xxxxxxx          
#undef  M_xxxxxxx           
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxy           
#undef  Ms_xxxxxxz          
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  Ms_xxxxxyy          
#undef  Ms_xxxxxyz          
#undef  M_xxxxxyz           
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
    
! OPS  1265*ADD + 2*DIV + 1717*MUL + 138*NEG + POW + 35*SUB = 3158  (4070 before optimization)
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
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v291, v292, v293, v294,&
                v295, v296, v297, v298, v299, v3, v30, v300, v301, v302, v303,&
                v304, v305, v306, v307, v308, v309, v31, v310, v311, v312,&
                v313, v314, v315, v316, v317, v318, v319, v32, v320, v321,&
                v322, v323, v324, v325, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
                D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz,&
                D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz,&
                D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz,&
                D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy,&
                D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz,&
                D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy,&
                D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx,&
                D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy,&
                D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz,&
                D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz,&
                D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz,&
                D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy, D_xxxxxxz,&
                D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy, D_xxxxyyz,&
                D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz, D_xxxyyzz,&
                D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz, D_xxyyyzz,&
                D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy, D_xyyyyyz,&
                D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz, D_xzzzzzz,&
                D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz, D_yyyzzzz,&
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz,&
                M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz,&
                M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz,&
                M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz,&
                M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz,&
                M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz, M_xxxzzzz,&
                M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz, M_xyyyyzz,&
                M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz, M_yyyyyzz,&
                M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz, M_zzzzzzz
#define M_0                  M(0)
#define y                    r(2)
#define x                    r(1)
#define L_0                  L(0)
#define z                    r(3)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define M_z                  M(3)
#define L_z                  L(3)
#define L_xx                 L(4)
#define M_xx                 M(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define M_xz                 M(6)
#define L_xz                 L(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define L_yz                 L(8)
#define M_yz                 M(8)
#define L_xxx                L(9)
#define M_xxx                M(9)
#define L_xxy                L(10)
#define M_xxy                M(10)
#define L_xxz                L(11)
#define M_xxz                M(11)
#define L_xyy                L(12)
#define M_xyy                M(12)
#define L_xyz                L(13)
#define M_xyz                M(13)
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
#define M_xxyz               M(20)
#define L_xxyz               L(20)
#define M_xyyy               M(21)
#define L_xyyy               L(21)
#define L_xyyz               L(22)
#define M_xyyz               M(22)
#define L_yyyy               L(23)
#define M_yyyy               M(23)
#define L_yyyz               L(24)
#define M_yyyz               M(24)
#define L_xxxxx              L(25)
#define M_xxxxx              M(25)
#define M_xxxxy              M(26)
#define L_xxxxy              L(26)
#define L_xxxxz              L(27)
#define M_xxxxz              M(27)
#define M_xxxyy              M(28)
#define L_xxxyy              L(28)
#define M_xxxyz              M(29)
#define L_xxxyz              L(29)
#define L_xxyyy              L(30)
#define M_xxyyy              M(30)
#define L_xxyyz              L(31)
#define M_xxyyz              M(31)
#define L_xyyyy              L(32)
#define M_xyyyy              M(32)
#define M_xyyyz              M(33)
#define L_xyyyz              L(33)
#define M_yyyyy              M(34)
#define L_yyyyy              L(34)
#define L_yyyyz              L(35)
#define M_yyyyz              M(35)
#define L_xxxxxx             L(36)
#define M_xxxxxx             M(36)
#define L_xxxxxy             L(37)
#define M_xxxxxy             M(37)
#define M_xxxxxz             M(38)
#define L_xxxxxz             L(38)
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
#define L_xxyyyz             L(44)
#define M_xxyyyz             M(44)
#define L_xyyyyy             L(45)
#define M_xyyyyy             M(45)
#define L_xyyyyz             L(46)
#define M_xyyyyz             M(46)
#define L_yyyyyy             L(47)
#define M_yyyyyy             M(47)
#define M_yyyyyz             M(48)
#define L_yyyyyz             L(48)
#define L_xxxxxxx            L(49)
#define M_xxxxxxx            M(49)
#define M_xxxxxxy            M(50)
#define L_xxxxxxy            L(50)
#define M_xxxxxxz            M(51)
#define L_xxxxxxz            L(51)
#define M_xxxxxyy            M(52)
#define L_xxxxxyy            L(52)
#define M_xxxxxyz            M(53)
#define L_xxxxxyz            L(53)
#define M_xxxxyyy            M(54)
#define L_xxxxyyy            L(54)
#define L_xxxxyyz            L(55)
#define M_xxxxyyz            M(55)
#define M_xxxyyyy            M(56)
#define L_xxxyyyy            L(56)
#define M_xxxyyyz            M(57)
#define L_xxxyyyz            L(57)
#define L_xxyyyyy            L(58)
#define M_xxyyyyy            M(58)
#define M_xxyyyyz            M(59)
#define L_xxyyyyz            L(59)
#define M_xyyyyyy            M(60)
#define L_xyyyyyy            L(60)
#define M_xyyyyyz            M(61)
#define L_xyyyyyz            L(61)
#define M_yyyyyyy            M(62)
#define L_yyyyyyy            L(62)
#define L_yyyyyyz            L(63)
#define M_yyyyyyz            M(63)
    v323      = y*z
    v324      = 945.0d0*x
    v316      = 15.0d0*v323
    v320      = v323
    v61       = v324
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
    v218      = 0.00138888888888889d0*M_xxxxxx
    v219      = 0.00833333333333333d0*M_xxxxxy
    v220      = 0.00833333333333333d0*M_xxxxxz
    v221      = 0.0208333333333333d0*M_xxxxyy
    v222      = 0.0416666666666667d0*M_xxxxyz
    v224      = 0.0277777777777778d0*M_xxxyyy
    v225      = 0.0833333333333333d0*M_xxxyyz
    v228      = 0.0208333333333333d0*M_xxyyyy
    v229      = 0.0833333333333333d0*M_xxyyyz
    v261      = 0.5d0*M_yy
    v263      = 0.166666666666667d0*M_yyy
    v264      = 0.5d0*M_yyz
    v268      = 0.0416666666666667d0*M_yyyy
    v269      = 0.166666666666667d0*M_yyyz
    v276      = 0.00833333333333333d0*M_yyyyy
    v277      = 0.0416666666666667d0*M_yyyyz
    v287      = 0.00138888888888889d0*M_yyyyyy
    v288      = 0.00833333333333333d0*M_yyyyyz
    M_zz      = -(M_xx + M_yy)
    v301      = 0.5d0*M_zz
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    v302      = 0.166666666666667d0*M_zzz
    M_xxzz    = -(M_xxxx + M_xxyy)
    v117      = 0.25d0*M_xxzz
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v270      = 0.25d0*M_yyzz
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    v303      = 0.0416666666666667d0*M_zzzz
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
    v278      = 0.0833333333333333d0*M_yyyzz
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v279      = 0.0833333333333333d0*M_yyzzz
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    v304      = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    v223      = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    v226      = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    v227      = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    v230      = 0.125d0*M_xxyyzz
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    v231      = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    v232      = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    v289      = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v290      = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v291      = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    v305      = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz = -(M_xxzzzzz + M_yyzzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v306      = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v306
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
    v307      = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v307
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
    v308      = 3.0d0*h
    v309      = h*v0
    v310      = h*v1
    v311      = h*v19
    v312      = h*v31
    v4        = -h
    v12       = v308
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v309
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v310
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v309
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 - 945.0d0*v31 + 630.0d0*v310
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v311
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v309
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v312
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v86       = -18.0d0*v51 + v46 + v79
    v87       = 66.0d0*v57
    v322      = -v87
    v88       = 9.0d0*v17
    v89       = 198.0d0*v57
    v101      = h*v67
    v102      = -18.0d0*v65 + v101 + v46
    v179      = v178 + v47 - 135.0d0*v65 + 495.0d0*v70
    u2        = 1.0/h
    u         = sqrt(u2)
    D_0       = u
    u3        = u*u2
    v2        = u3
    D_x       = -v2*x
    D_y       = -v2*y
    D_z       = -v2*z
    u4        = u2*u2
    u5        = u2*u3
    v3        = u5
    v313      = 3.0d0*v3
    v6        = v313*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v313*v320
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v314      = 3.0d0*v8
    v9        = v8*x
    v11       = v314*(h - v10)
    D_xxx     = -3.0d0*v9*(v306 - v308)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    v233      = 0.5d0*D_xyy
    D_xyz     = -v316*v9
    D_xzz     = -(D_xxx + D_xyy)
    v248      = 0.5d0*D_xzz
    D_yyy     = v314*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    v292      = 0.5d0*D_yzz
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v315      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v315*y
    v26       = v315*z
    v28       = v15*v316
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v159      = 0.5d0*D_xxyy
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    v169      = 0.5d0*D_xxzz
    D_xyyy    = v22*v30
    v199      = 0.5d0*D_xyyy
    v234      = 0.166666666666667d0*D_xyyy
    D_xyyz    = v26*(v29 + v4)
    v244      = 0.5d0*D_xyyz
    D_xyzz    = -(D_xxxy + D_xyyy)
    v209      = 0.5d0*D_xyzz
    D_xzzz    = -(D_xxxz + D_xyyz)
    v249      = 0.166666666666667d0*D_xzzz
    v257      = 0.5d0*D_xzzz
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    v280      = 0.5d0*D_yyzz
    D_yzzz    = -(D_xxyz + D_yyyz)
    v293      = 0.166666666666667d0*D_yzzz
    v297      = 0.5d0*D_yzzz
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v317      = 15.0d0*v34
    v318      = v34*z
    v35       = v317*x
    v39       = v318
    v41       = 315.0d0*v318*x*y
    v42       = v317*y
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
    D_xxyyz   = v39*(v36 - 945.0d0*v307 + 105.0d0*(v309 + v310))
    v166      = 0.5d0*D_xxyyz
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    v144      = 0.5d0*D_xxyzz
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    v170      = 0.166666666666667d0*D_xxzzz
    v175      = 0.5d0*D_xxzzz
    D_xyyyy   = v34*v43*x
    v188      = 0.5d0*D_xyyyy
    v200      = 0.166666666666667d0*D_xyyyy
    v235      = 0.0416666666666667d0*D_xyyyy
    D_xyyyz   = v41*(h - v7)
    v206      = 0.5d0*D_xyyyz
    v241      = 0.166666666666667d0*D_xyyyz
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    v194      = 0.5d0*D_xyyzz
    v245      = 0.25d0*D_xyyzz
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    v210      = 0.166666666666667d0*D_xyzzz
    v215      = 0.5d0*D_xyzzz
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    v250      = 0.0416666666666667d0*D_xzzzz
    v258      = 0.166666666666667d0*D_xzzzz
    D_yyyyy   = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz   = v39*v43
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    v271      = 0.5d0*D_yyyzz
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    v281      = 0.166666666666667d0*D_yyzzz
    v284      = 0.5d0*D_yyzzz
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    v294      = 0.0416666666666667d0*D_yzzzz
    v298      = 0.166666666666667d0*D_yzzzz
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    u12       = u6*u6
    u13       = u6*u7
    v44       = u13
    v325      = 315.0d0*v44
    v319      = v325*x
    v45       = 45.0d0*v44
    v52       = v319*y
    v56       = v319*z
    v60       = v320*v325
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy  = v52*v55
    D_xxxxxz  = v55*v56
    D_xxxxyy  = v45*(v58 + v17*v29 - 21.0d0*v311 + 14.0d0*v51 + 231.0d0*v59)
    v95       = 0.5d0*D_xxxxyy
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    v98       = 0.5d0*D_xxxxzz
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    v106      = 0.5d0*D_xxxyyy
    v119      = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    v122      = 0.5d0*D_xxxyyz
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    v109      = 0.5d0*D_xxxyzz
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    v125      = 0.166666666666667d0*D_xxxzzz
    v127      = 0.5d0*D_xxxzzz
    D_xxyyyy  = v45*(v58 + v17*v24 - 21.0d0*v312 + 14.0d0*v65 + 231.0d0*v66)
    v132      = 0.5d0*D_xxyyyy
    v139      = 0.166666666666667d0*D_xxyyyy
    v161      = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    v142      = 0.5d0*D_xxyyyz
    v164      = 0.166666666666667d0*D_xxyyyz
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
    v182      = 0.5d0*D_xyyyyy
    v189      = 0.166666666666667d0*D_xyyyyy
    v201      = 0.0416666666666667d0*D_xyyyyy
    v236      = 0.00833333333333333d0*D_xyyyyy
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    v192      = 0.5d0*D_xyyyyz
    v204      = 0.166666666666667d0*D_xyyyyz
    v239      = 0.0416666666666667d0*D_xyyyyz
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    v185      = 0.5d0*D_xyyyzz
    v207      = 0.25d0*D_xyyyzz
    v242      = 0.0833333333333333d0*D_xyyyzz
    v254      = 0.166666666666667d0*D_xyyyzz
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    v195      = 0.166666666666667d0*D_xyyzzz
    v197      = 0.5d0*D_xyyzzz
    v246      = 0.0833333333333333d0*D_xyyzzz
    v255      = 0.25d0*D_xyyzzz
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    v211      = 0.0416666666666667d0*D_xyzzzz
    v216      = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    v251      = 0.00833333333333333d0*D_xzzzzz
    v259      = 0.0416666666666667d0*D_xzzzzz
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    D_yyyyyz  = v60*v68
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    v265      = 0.5d0*D_yyyyzz
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    v272      = 0.166666666666667d0*D_yyyzzz
    v274      = 0.5d0*D_yyyzzz
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    v282      = 0.0416666666666667d0*D_yyzzzz
    v285      = 0.166666666666667d0*D_yyzzzz
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    v295      = 0.00833333333333333d0*D_yzzzzz
    v299      = 0.0416666666666667d0*D_yzzzzz
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v321      = 315.0d0*v71
    v72       = v321*x
    v75       = v321*y
    v77       = v321*z
    v81       = v320*v324*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = L_xxxxxxx + (D_xxxxxxx*M_0)
    D_xxxxxxy = v75*v76
    L_xxxxxxy = L_xxxxxxy + (D_xxxxxxy*M_0)
    D_xxxxxxz = v76*v77
    L_xxxxxx  = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z)
    L_xxxxxxz = L_xxxxxxz + (D_xxxxxxz*M_0)
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    v84       = 0.5d0*D_xxxxxyy
    L_xxxxxyy = L_xxxxxyy + (D_xxxxxyy*M_0)
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxy  = L_xxxxxy + (D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z)
    L_xxxxxyz = L_xxxxxyz + (D_xxxxxyz*M_0)
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    v85       = 0.5d0*D_xxxxxzz
    L_xxxxx   = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*v83 + D_xxxxxxy*M_xy + D_xxxxxxz* &
      M_xz + D_xxxxxy*M_y + D_xxxxxyz*M_yz + D_xxxxxz*M_z + M_yy*v84 + &
      M_zz*v85)
    L_xxxxxz  = L_xxxxxz + (D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z)
    D_xxxxyyy = -945.0d0*v71*y*(v322 + v1*v18 + v1*v82 - v86)
    v90       = 0.5d0*D_xxxxyyy
    v96       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy = L_xxxxyyy + (D_xxxxyyy*M_0)
    D_xxxxyyz = v77*(-v1*v88 + v80 + v86 + v89)
    v97       = 0.5d0*D_xxxxyyz
    L_xxxxyy  = L_xxxxyy + (D_xxxxxyy*M_x + D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyz*M_z)
    L_xxxxyyz = L_xxxxyyz + (D_xxxxyyz*M_0)
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    v91       = 0.5d0*D_xxxxyzz
    L_xxxxy   = L_xxxxy + (D_xxxxxxy*v83 + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + D_xxxxy &
      *M_0 + D_xxxxyy*M_y + D_xxxxyyz*M_yz + D_xxxxyz*M_z + M_yy*v90 + &
      M_zz*v91)
    L_xxxxyz  = L_xxxxyz + (D_xxxxxyz*M_x + D_xxxxyyz*M_y + D_xxxxyz*M_0 + D_xxxxyzz*M_z)
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    v99       = 0.166666666666667d0*D_xxxxzzz
    v100      = 0.5d0*D_xxxxzzz
    L_xxxx    = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v83 + D_xxxxxxx*v92 + D_xxxxxxy*v93 &
      + D_xxxxxxz*v94 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_xyy*v84 + M_xzz* &
      v85 + M_yy*v95 + M_yyy*v96 + M_yyz*v97 + M_yzz*v91 + M_zz*v98 + &
      M_zzz*v99)
    L_xxxxz   = L_xxxxz + (D_xxxxxxz*v83 + D_xxxxxyz*M_xy + D_xxxxxz*M_x + D_xxxxxzz*M_xz + &
      D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + D_xxxxzz*M_z + M_yy &
      *v97 + M_zz*v100)
    D_xxxyyyy = -v61*v71*(v322 + v0*v103 + v0*v18 - v102)
    v104      = 0.5d0*D_xxxyyyy
    v107      = 0.166666666666667d0*D_xxxyyyy
    v120      = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy = L_xxxyyyy + (D_xxxyyyy*M_0)
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v88))
    v108      = 0.5d0*D_xxxyyyz
    v121      = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyy  = L_xxxyyy + (D_xxxxyyy*M_x + D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyz*M_z)
    L_xxxyyyz = L_xxxyyyz + (D_xxxyyyz*M_0)
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    v105      = 0.5d0*D_xxxyyzz
    v123      = 0.25d0*D_xxxyyzz
    L_xxxyy   = L_xxxyy + (D_xxxxxyy*v83 + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + D_xxxyy &
      *M_0 + D_xxxyyy*M_y + D_xxxyyyz*M_yz + D_xxxyyz*M_z + M_yy*v104 + &
      M_zz*v105)
    L_xxxyyz  = L_xxxyyz + (D_xxxxyyz*M_x + D_xxxyyyz*M_y + D_xxxyyz*M_0 + D_xxxyyzz*M_z)
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    v110      = 0.166666666666667d0*D_xxxyzzz
    v111      = 0.5d0*D_xxxyzzz
    L_xxxy    = L_xxxy + (D_xxxxxxy*v92 + D_xxxxxy*v83 + D_xxxxxyy*v93 + D_xxxxxyz*v94 + D_xxxxy* &
      M_x + D_xxxxyy*M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy* &
      M_0 + D_xxxyy*M_y + D_xxxyyz*M_yz + D_xxxyz*M_z + M_xyy*v90 + &
      M_xzz*v91 + M_yy*v106 + M_yyy*v107 + M_yyz*v108 + M_yzz*v105 + &
      M_zz*v109 + M_zzz*v110)
    L_xxxyz   = L_xxxyz + (D_xxxxxyz*v83 + D_xxxxyyz*M_xy + D_xxxxyz*M_x + D_xxxxyzz*M_xz + &
      D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + D_xxxyzz*M_z + M_yy &
      *v108 + M_zz*v111)
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    v126      = 0.0416666666666667d0*D_xxxzzzz
    v128      = 0.166666666666667d0*D_xxxzzzz
    L_xxx     = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v83 + D_xxxxxx*v92 + D_xxxxxxx*v112 + &
      D_xxxxxxy*v113 + D_xxxxxxz*v114 + D_xxxxxy*v93 + D_xxxxxyy*v115 + &
      D_xxxxxyz*v116 + D_xxxxxz*v94 + D_xxxxxzz*v117 + D_xxxxy*M_xy + &
      D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxy*M_y + D_xxxyz*M_yz + &
      D_xxxz*M_z + M_xyy*v95 + M_xyyy*v96 + M_xyyz*v97 + M_xyzz*v91 + &
      M_xzz*v98 + M_xzzz*v99 + M_yy*v118 + M_yyy*v119 + M_yyyy*v120 + &
      M_yyyz*v121 + M_yyz*v122 + M_yyzz*v123 + M_yzz*v109 + M_yzzz*v110 &
      + M_zz*v124 + M_zzz*v125 + M_zzzz*v126)
    L_xxxz    = L_xxxz + (D_xxxxxxz*v92 + D_xxxxxyz*v93 + D_xxxxxz*v83 + D_xxxxxzz*v94 + D_xxxxyz* &
      M_xy + D_xxxxyzz*M_xyz + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz* &
      M_y + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_xyy*v97 + &
      M_xzz*v100 + M_yy*v122 + M_yyy*v121 + M_yyz*v105 + M_yzz*v111 + &
      M_zz*v127 + M_zzz*v128)
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
    L_xxyyyy  = L_xxyyyy + (D_xxxyyyy*M_x + D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyz*M_z)
    L_xxyyyyz = L_xxyyyyz + (D_xxyyyyz*M_0)
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    v131      = 0.5d0*D_xxyyyzz
    v143      = 0.25d0*D_xxyyyzz
    v165      = 0.0833333333333333d0*D_xxyyyzz
    v173      = 0.166666666666667d0*D_xxyyyzz
    L_xxyyy   = L_xxyyy + (D_xxxxyyy*v83 + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + D_xxyyy &
      *M_0 + D_xxyyyy*M_y + D_xxyyyyz*M_yz + D_xxyyyz*M_z + M_yy*v130 + &
      M_zz*v131)
    L_xxyyyz  = L_xxyyyz + (D_xxxyyyz*M_x + D_xxyyyyz*M_y + D_xxyyyz*M_0 + D_xxyyyzz*M_z)
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    v136      = 0.166666666666667d0*D_xxyyzzz
    v137      = 0.5d0*D_xxyyzzz
    v168      = 0.0833333333333333d0*D_xxyyzzz
    v174      = 0.25d0*D_xxyyzzz
    L_xxyy    = L_xxyy + (D_xxxxxyy*v92 + D_xxxxyy*v83 + D_xxxxyyy*v93 + D_xxxxyyz*v94 + D_xxxyy* &
      M_x + D_xxxyyy*M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy* &
      M_0 + D_xxyyy*M_y + D_xxyyyz*M_yz + D_xxyyz*M_z + M_xyy*v104 + &
      M_xzz*v105 + M_yy*v132 + M_yyy*v133 + M_yyz*v134 + M_yzz*v131 + &
      M_zz*v135 + M_zzz*v136)
    L_xxyyz   = L_xxyyz + (D_xxxxyyz*v83 + D_xxxyyyz*M_xy + D_xxxyyz*M_x + D_xxxyyzz*M_xz + &
      D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + D_xxyyzz*M_z + M_yy &
      *v134 + M_zz*v137)
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    v146      = 0.0416666666666667d0*D_xxyzzzz
    v148      = 0.166666666666667d0*D_xxyzzzz
    L_xxy     = L_xxy + (D_xxxxxxy*v112 + D_xxxxxy*v92 + D_xxxxxyy*v113 + D_xxxxxyz*v114 + &
      D_xxxxy*v83 + D_xxxxyy*v93 + D_xxxxyyy*v115 + D_xxxxyyz*v116 + &
      D_xxxxyz*v94 + D_xxxxyzz*v117 + D_xxxy*M_x + D_xxxyy*M_xy + &
      D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyz* &
      M_yz + D_xxyz*M_z + M_xyy*v106 + M_xyyy*v107 + M_xyyz*v108 + &
      M_xyzz*v105 + M_xzz*v109 + M_xzzz*v110 + M_yy*v138 + M_yyy*v139 + &
      M_yyyy*v140 + M_yyyz*v141 + M_yyz*v142 + M_yyzz*v143 + M_yzz*v135 &
      + M_yzzz*v136 + M_zz*v144 + M_zzz*v145 + M_zzzz*v146)
    L_xxyz    = L_xxyz + (D_xxxxxyz*v92 + D_xxxxyyz*v93 + D_xxxxyz*v83 + D_xxxxyzz*v94 + D_xxxyyz* &
      M_xy + D_xxxyyzz*M_xyz + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz* &
      M_y + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_xyy*v108 + &
      M_xzz*v111 + M_yy*v142 + M_yyy*v141 + M_yyz*v131 + M_yzz*v137 + &
      M_zz*v147 + M_zzz*v148)
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    v172      = 0.00833333333333333d0*D_xxzzzzz
    v177      = 0.0416666666666667d0*D_xxzzzzz
    L_xx      = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*v83 + D_xxxxx*v92 + D_xxxxxx*v112 + &
      D_xxxxxxx*v149 + D_xxxxxxy*v150 + D_xxxxxxz*v151 + D_xxxxxy*v113 &
      + D_xxxxxyy*v152 + D_xxxxxyz*v153 + D_xxxxxz*v114 + D_xxxxxzz* &
      v154 + D_xxxxy*v93 + D_xxxxyy*v115 + D_xxxxyyy*v155 + D_xxxxyyz* &
      v156 + D_xxxxyz*v116 + D_xxxxyzz*v157 + D_xxxxz*v94 + D_xxxxzz* &
      v117 + D_xxxxzzz*v158 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz &
      + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + M_xyy*v118 + M_xyyy*v119 &
      + M_xyyyy*v120 + M_xyyyz*v121 + M_xyyz*v122 + M_xyyzz*v123 + &
      M_xyzz*v109 + M_xyzzz*v110 + M_xzz*v124 + M_xzzz*v125 + M_xzzzz* &
      v126 + M_yy*v159 + M_yyy*v160 + M_yyyy*v161 + M_yyyyy*v162 + &
      M_yyyyz*v163 + M_yyyz*v164 + M_yyyzz*v165 + M_yyz*v166 + M_yyzz* &
      v167 + M_yyzzz*v168 + M_yzz*v144 + M_yzzz*v145 + M_yzzzz*v146 + &
      M_zz*v169 + M_zzz*v170 + M_zzzz*v171 + M_zzzzz*v172)
    L_xxz     = L_xxz + (D_xxxxxxz*v112 + D_xxxxxyz*v113 + D_xxxxxz*v92 + D_xxxxxzz*v114 + &
      D_xxxxyyz*v115 + D_xxxxyz*v93 + D_xxxxyzz*v116 + D_xxxxz*v83 + &
      D_xxxxzz*v94 + D_xxxxzzz*v117 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + &
      D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 &
      + D_xxzz*M_z + M_xyy*v122 + M_xyyy*v121 + M_xyyz*v105 + M_xyzz* &
      v111 + M_xzz*v127 + M_xzzz*v128 + M_yy*v166 + M_yyy*v164 + M_yyyy &
      *v163 + M_yyyz*v173 + M_yyz*v135 + M_yyzz*v174 + M_yzz*v147 + &
      M_yzzz*v148 + M_zz*v175 + M_zzz*v176 + M_zzzz*v177)
    D_xyyyyyy = v179*v72
    v180      = 0.5d0*D_xyyyyyy
    v183      = 0.166666666666667d0*D_xyyyyyy
    v190      = 0.0416666666666667d0*D_xyyyyyy
    v202      = 0.00833333333333333d0*D_xyyyyyy
    v237      = 0.00138888888888889d0*D_xyyyyyy
    L_xyyyyyy = L_xyyyyyy + (D_xyyyyyy*M_0)
    D_xyyyyyz = v81*(v36 - v103 + 110.0d0*v32)
    v184      = 0.5d0*D_xyyyyyz
    v191      = 0.166666666666667d0*D_xyyyyyz
    v203      = 0.0416666666666667d0*D_xyyyyyz
    v238      = 0.00833333333333333d0*D_xyyyyyz
    L_xyyyyy  = L_xyyyyy + (D_xxyyyyy*M_x + D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyz*M_z)
    L_xyyyyyz = L_xyyyyyz + (D_xyyyyyz*M_0)
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    v181      = 0.5d0*D_xyyyyzz
    v193      = 0.25d0*D_xyyyyzz
    v205      = 0.0833333333333333d0*D_xyyyyzz
    v213      = 0.166666666666667d0*D_xyyyyzz
    v240      = 0.0208333333333333d0*D_xyyyyzz
    v253      = 0.0416666666666667d0*D_xyyyyzz
    L_xyyyy   = L_xyyyy + (D_xxxyyyy*v83 + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + D_xyyyy &
      *M_0 + D_xyyyyy*M_y + D_xyyyyyz*M_yz + D_xyyyyz*M_z + M_yy*v180 + &
      M_zz*v181)
    L_xyyyyz  = L_xyyyyz + (D_xxyyyyz*M_x + D_xyyyyyz*M_y + D_xyyyyz*M_0 + D_xyyyyzz*M_z)
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    v186      = 0.166666666666667d0*D_xyyyzzz
    v187      = 0.5d0*D_xyyyzzz
    v208      = 0.0833333333333333d0*D_xyyyzzz
    v214      = 0.25d0*D_xyyyzzz
    v243      = 0.0277777777777778d0*D_xyyyzzz
    L_xyyy    = L_xyyy + (D_xxxxyyy*v92 + D_xxxyyy*v83 + D_xxxyyyy*v93 + D_xxxyyyz*v94 + D_xxyyy* &
      M_x + D_xxyyyy*M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy* &
      M_0 + D_xyyyy*M_y + D_xyyyyz*M_yz + D_xyyyz*M_z + M_xyy*v130 + &
      M_xzz*v131 + M_yy*v182 + M_yyy*v183 + M_yyz*v184 + M_yzz*v181 + &
      M_zz*v185 + M_zzz*v186)
    L_xyyyz   = L_xyyyz + (D_xxxyyyz*v83 + D_xxyyyyz*M_xy + D_xxyyyz*M_x + D_xxyyyzz*M_xz + &
      D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + D_xyyyzz*M_z + M_yy &
      *v184 + M_zz*v187)
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    v196      = 0.0416666666666667d0*D_xyyzzzz
    v198      = 0.166666666666667d0*D_xyyzzzz
    v247      = 0.0208333333333333d0*D_xyyzzzz
    v256      = 0.0833333333333333d0*D_xyyzzzz
    L_xyy     = L_xyy + (D_xxxxxyy*v112 + D_xxxxyy*v92 + D_xxxxyyy*v113 + D_xxxxyyz*v114 + &
      D_xxxyy*v83 + D_xxxyyy*v93 + D_xxxyyyy*v115 + D_xxxyyyz*v116 + &
      D_xxxyyz*v94 + D_xxxyyzz*v117 + D_xxyy*M_x + D_xxyyy*M_xy + &
      D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyz* &
      M_yz + D_xyyz*M_z + M_xyy*v132 + M_xyyy*v133 + M_xyyz*v134 + &
      M_xyzz*v131 + M_xzz*v135 + M_xzzz*v136 + M_yy*v188 + M_yyy*v189 + &
      M_yyyy*v190 + M_yyyz*v191 + M_yyz*v192 + M_yyzz*v193 + M_yzz*v185 &
      + M_yzzz*v186 + M_zz*v194 + M_zzz*v195 + M_zzzz*v196)
    L_xyyz    = L_xyyz + (D_xxxxyyz*v92 + D_xxxyyyz*v93 + D_xxxyyz*v83 + D_xxxyyzz*v94 + D_xxyyyz* &
      M_xy + D_xxyyyzz*M_xyz + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz* &
      M_y + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_xyy*v134 + &
      M_xzz*v137 + M_yy*v192 + M_yyy*v191 + M_yyz*v181 + M_yzz*v187 + &
      M_zz*v197 + M_zzz*v198)
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    v212      = 0.00833333333333333d0*D_xyzzzzz
    v217      = 0.0416666666666667d0*D_xyzzzzz
    L_xy      = L_xy + (D_xxxxxxy*v149 + D_xxxxxy*v112 + D_xxxxxyy*v150 + D_xxxxxyz*v151 + &
      D_xxxxy*v92 + D_xxxxyy*v113 + D_xxxxyyy*v152 + D_xxxxyyz*v153 + &
      D_xxxxyz*v114 + D_xxxxyzz*v154 + D_xxxy*v83 + D_xxxyy*v93 + &
      D_xxxyyy*v115 + D_xxxyyyy*v155 + D_xxxyyyz*v156 + D_xxxyyz*v116 + &
      D_xxxyyzz*v157 + D_xxxyz*v94 + D_xxxyzz*v117 + D_xxxyzzz*v158 + &
      D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 &
      + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v138 + M_xyyy*v139 &
      + M_xyyyy*v140 + M_xyyyz*v141 + M_xyyz*v142 + M_xyyzz*v143 + &
      M_xyzz*v135 + M_xyzzz*v136 + M_xzz*v144 + M_xzzz*v145 + M_xzzzz* &
      v146 + M_yy*v199 + M_yyy*v200 + M_yyyy*v201 + M_yyyyy*v202 + &
      M_yyyyz*v203 + M_yyyz*v204 + M_yyyzz*v205 + M_yyz*v206 + M_yyzz* &
      v207 + M_yyzzz*v208 + M_yzz*v194 + M_yzzz*v195 + M_yzzzz*v196 + &
      M_zz*v209 + M_zzz*v210 + M_zzzz*v211 + M_zzzzz*v212)
    L_xyz     = L_xyz + (D_xxxxxyz*v112 + D_xxxxyyz*v113 + D_xxxxyz*v92 + D_xxxxyzz*v114 + &
      D_xxxyyyz*v115 + D_xxxyyz*v93 + D_xxxyyzz*v116 + D_xxxyz*v83 + &
      D_xxxyzz*v94 + D_xxxyzzz*v117 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + &
      D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 &
      + D_xyzz*M_z + M_xyy*v142 + M_xyyy*v141 + M_xyyz*v131 + M_xyzz* &
      v137 + M_xzz*v147 + M_xzzz*v148 + M_yy*v206 + M_yyy*v204 + M_yyyy &
      *v203 + M_yyyz*v213 + M_yyz*v185 + M_yyzz*v214 + M_yzz*v197 + &
      M_yzzz*v198 + M_zz*v215 + M_zzz*v216 + M_zzzz*v217)
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    v252      = 0.00138888888888889d0*D_xzzzzzz
    v260      = 0.00833333333333333d0*D_xzzzzzz
    L_x       = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*v83 + D_xxxx*v92 + D_xxxxx*v112 + D_xxxxxx* &
      v149 + D_xxxxxxx*v218 + D_xxxxxxy*v219 + D_xxxxxxz*v220 + &
      D_xxxxxy*v150 + D_xxxxxyy*v221 + D_xxxxxyz*v222 + D_xxxxxz*v151 + &
      D_xxxxxzz*v223 + D_xxxxy*v113 + D_xxxxyy*v152 + D_xxxxyyy*v224 + &
      D_xxxxyyz*v225 + D_xxxxyz*v153 + D_xxxxyzz*v226 + D_xxxxz*v114 + &
      D_xxxxzz*v154 + D_xxxxzzz*v227 + D_xxxy*v93 + D_xxxyy*v115 + &
      D_xxxyyy*v155 + D_xxxyyyy*v228 + D_xxxyyyz*v229 + D_xxxyyz*v156 + &
      D_xxxyyzz*v230 + D_xxxyz*v116 + D_xxxyzz*v157 + D_xxxyzzz*v231 + &
      D_xxxz*v94 + D_xxxzz*v117 + D_xxxzzz*v158 + D_xxxzzzz*v232 + &
      D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + &
      D_xz*M_z + M_xyy*v159 + M_xyyy*v160 + M_xyyyy*v161 + M_xyyyyy* &
      v162 + M_xyyyyz*v163 + M_xyyyz*v164 + M_xyyyzz*v165 + M_xyyz*v166 &
      + M_xyyzz*v167 + M_xyyzzz*v168 + M_xyzz*v144 + M_xyzzz*v145 + &
      M_xyzzzz*v146 + M_xzz*v169 + M_xzzz*v170 + M_xzzzz*v171 + &
      M_xzzzzz*v172 + M_yy*v233 + M_yyy*v234 + M_yyyy*v235 + M_yyyyy* &
      v236 + M_yyyyyy*v237 + M_yyyyyz*v238 + M_yyyyz*v239 + M_yyyyzz* &
      v240 + M_yyyz*v241 + M_yyyzz*v242 + M_yyyzzz*v243 + M_yyz*v244 + &
      M_yyzz*v245 + M_yyzzz*v246 + M_yyzzzz*v247 + M_yzz*v209 + M_yzzz* &
      v210 + M_yzzzz*v211 + M_yzzzzz*v212 + M_zz*v248 + M_zzz*v249 + &
      M_zzzz*v250 + M_zzzzz*v251 + M_zzzzzz*v252)
    L_xz      = L_xz + (D_xxxxxxz*v149 + D_xxxxxyz*v150 + D_xxxxxz*v112 + D_xxxxxzz*v151 + &
      D_xxxxyyz*v152 + D_xxxxyz*v113 + D_xxxxyzz*v153 + D_xxxxz*v92 + &
      D_xxxxzz*v114 + D_xxxxzzz*v154 + D_xxxyyyz*v155 + D_xxxyyz*v115 + &
      D_xxxyyzz*v156 + D_xxxyz*v93 + D_xxxyzz*v116 + D_xxxyzzz*v157 + &
      D_xxxz*v83 + D_xxxzz*v94 + D_xxxzzz*v117 + D_xxxzzzz*v158 + &
      D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y &
      + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + M_xyy*v166 + M_xyyy*v164 + &
      M_xyyyy*v163 + M_xyyyz*v173 + M_xyyz*v135 + M_xyyzz*v174 + M_xyzz &
      *v147 + M_xyzzz*v148 + M_xzz*v175 + M_xzzz*v176 + M_xzzzz*v177 + &
      M_yy*v244 + M_yyy*v241 + M_yyyy*v239 + M_yyyyy*v238 + M_yyyyz* &
      v253 + M_yyyz*v254 + M_yyyzz*v208 + M_yyz*v194 + M_yyzz*v255 + &
      M_yyzzz*v256 + M_yzz*v215 + M_yzzz*v216 + M_yzzzz*v217 + M_zz* &
      v257 + M_zzz*v258 + M_zzzz*v259 + M_zzzzz*v260)
    D_yyyyyyy = v75*(v178 + v73 - 315.0d0*v65 + 693.0d0*v70)
    L_yyyyyyy = L_yyyyyyy + (D_yyyyyyy*M_0)
    D_yyyyyyz = v179*v77
    L_yyyyyy  = L_yyyyyy + (D_xyyyyyy*M_x + D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyz*M_z)
    L_yyyyyyz = L_yyyyyyz + (D_yyyyyyz*M_0)
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    v262      = 0.5d0*D_yyyyyzz
    L_yyyyy   = L_yyyyy + (D_xxyyyyy*v83 + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + D_yyyyy &
      *M_0 + D_yyyyyy*M_y + D_yyyyyyy*v261 + D_yyyyyyz*M_yz + D_yyyyyz* &
      M_z + M_zz*v262)
    L_yyyyyz  = L_yyyyyz + (D_xyyyyyz*M_x + D_yyyyyyz*M_y + D_yyyyyz*M_0 + D_yyyyyzz*M_z)
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    v266      = 0.166666666666667d0*D_yyyyzzz
    v267      = 0.5d0*D_yyyyzzz
    L_yyyy    = L_yyyy + (D_xxxyyyy*v92 + D_xxyyyy*v83 + D_xxyyyyy*v93 + D_xxyyyyz*v94 + D_xyyyy* &
      M_x + D_xyyyyy*M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy* &
      M_0 + D_yyyyy*M_y + D_yyyyyy*v261 + D_yyyyyyy*v263 + D_yyyyyyz* &
      v264 + D_yyyyyz*M_yz + D_yyyyz*M_z + M_xyy*v180 + M_xzz*v181 + &
      M_yzz*v262 + M_zz*v265 + M_zzz*v266)
    L_yyyyz   = L_yyyyz + (D_xxyyyyz*v83 + D_xyyyyyz*M_xy + D_xyyyyz*M_x + D_xyyyyzz*M_xz + &
      D_yyyyyyz*v261 + D_yyyyyz*M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + &
      D_yyyyzz*M_z + M_zz*v267)
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    v273      = 0.0416666666666667d0*D_yyyzzzz
    v275      = 0.166666666666667d0*D_yyyzzzz
    L_yyy     = L_yyy + (D_xxxxyyy*v112 + D_xxxyyy*v92 + D_xxxyyyy*v113 + D_xxxyyyz*v114 + &
      D_xxyyy*v83 + D_xxyyyy*v93 + D_xxyyyyy*v115 + D_xxyyyyz*v116 + &
      D_xxyyyz*v94 + D_xxyyyzz*v117 + D_xyyy*M_x + D_xyyyy*M_xy + &
      D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy* &
      v261 + D_yyyyyy*v263 + D_yyyyyyy*v268 + D_yyyyyyz*v269 + D_yyyyyz &
      *v264 + D_yyyyyzz*v270 + D_yyyyz*M_yz + D_yyyz*M_z + M_xyy*v182 + &
      M_xyyy*v183 + M_xyyz*v184 + M_xyzz*v181 + M_xzz*v185 + M_xzzz* &
      v186 + M_yzz*v265 + M_yzzz*v266 + M_zz*v271 + M_zzz*v272 + M_zzzz &
      *v273)
    L_yyyz    = L_yyyz + (D_xxxyyyz*v92 + D_xxyyyyz*v93 + D_xxyyyz*v83 + D_xxyyyzz*v94 + D_xyyyyz* &
      M_xy + D_xyyyyzz*M_xyz + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyyz* &
      v263 + D_yyyyyz*v261 + D_yyyyyzz*v264 + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzz*M_z + M_xyy*v184 + M_xzz*v187 + M_yzz &
      *v267 + M_zz*v274 + M_zzz*v275)
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    v283      = 0.00833333333333333d0*D_yyzzzzz
    v286      = 0.0416666666666667d0*D_yyzzzzz
    L_yy      = L_yy + (D_xxxxxyy*v149 + D_xxxxyy*v112 + D_xxxxyyy*v150 + D_xxxxyyz*v151 + &
      D_xxxyy*v92 + D_xxxyyy*v113 + D_xxxyyyy*v152 + D_xxxyyyz*v153 + &
      D_xxxyyz*v114 + D_xxxyyzz*v154 + D_xxyy*v83 + D_xxyyy*v93 + &
      D_xxyyyy*v115 + D_xxyyyyy*v155 + D_xxyyyyz*v156 + D_xxyyyz*v116 + &
      D_xxyyyzz*v157 + D_xxyyz*v94 + D_xxyyzz*v117 + D_xxyyzzz*v158 + &
      D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 &
      + D_yyy*M_y + D_yyyy*v261 + D_yyyyy*v263 + D_yyyyyy*v268 + &
      D_yyyyyyy*v276 + D_yyyyyyz*v277 + D_yyyyyz*v269 + D_yyyyyzz*v278 &
      + D_yyyyz*v264 + D_yyyyzz*v270 + D_yyyyzzz*v279 + D_yyyz*M_yz + &
      D_yyz*M_z + M_xyy*v188 + M_xyyy*v189 + M_xyyyy*v190 + M_xyyyz* &
      v191 + M_xyyz*v192 + M_xyyzz*v193 + M_xyzz*v185 + M_xyzzz*v186 + &
      M_xzz*v194 + M_xzzz*v195 + M_xzzzz*v196 + M_yzz*v271 + M_yzzz* &
      v272 + M_yzzzz*v273 + M_zz*v280 + M_zzz*v281 + M_zzzz*v282 + &
      M_zzzzz*v283)
    L_yyz     = L_yyz + (D_xxxxyyz*v112 + D_xxxyyyz*v113 + D_xxxyyz*v92 + D_xxxyyzz*v114 + &
      D_xxyyyyz*v115 + D_xxyyyz*v93 + D_xxyyyzz*v116 + D_xxyyz*v83 + &
      D_xxyyzz*v94 + D_xxyyzzz*v117 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + &
      D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyyyz*v268 + D_yyyyyz*v263 + &
      D_yyyyyzz*v269 + D_yyyyz*v261 + D_yyyyzz*v264 + D_yyyyzzz*v270 + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_xyy*v192 + &
      M_xyyy*v191 + M_xyyz*v181 + M_xyzz*v187 + M_xzz*v197 + M_xzzz* &
      v198 + M_yzz*v274 + M_yzzz*v275 + M_zz*v284 + M_zzz*v285 + M_zzzz &
      *v286)
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    v296      = 0.00138888888888889d0*D_yzzzzzz
    v300      = 0.00833333333333333d0*D_yzzzzzz
    L_y       = L_y + (D_xxxxxxy*v218 + D_xxxxxy*v149 + D_xxxxxyy*v219 + D_xxxxxyz*v220 + &
      D_xxxxy*v112 + D_xxxxyy*v150 + D_xxxxyyy*v221 + D_xxxxyyz*v222 + &
      D_xxxxyz*v151 + D_xxxxyzz*v223 + D_xxxy*v92 + D_xxxyy*v113 + &
      D_xxxyyy*v152 + D_xxxyyyy*v224 + D_xxxyyyz*v225 + D_xxxyyz*v153 + &
      D_xxxyyzz*v226 + D_xxxyz*v114 + D_xxxyzz*v154 + D_xxxyzzz*v227 + &
      D_xxy*v83 + D_xxyy*v93 + D_xxyyy*v115 + D_xxyyyy*v155 + D_xxyyyyy &
      *v228 + D_xxyyyyz*v229 + D_xxyyyz*v156 + D_xxyyyzz*v230 + D_xxyyz &
      *v116 + D_xxyyzz*v157 + D_xxyyzzz*v231 + D_xxyz*v94 + D_xxyzz* &
      v117 + D_xxyzzz*v158 + D_xxyzzzz*v232 + D_xy*M_x + D_xyy*M_xy + &
      D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v261 + &
      D_yyyy*v263 + D_yyyyy*v268 + D_yyyyyy*v276 + D_yyyyyyy*v287 + &
      D_yyyyyyz*v288 + D_yyyyyz*v277 + D_yyyyyzz*v289 + D_yyyyz*v269 + &
      D_yyyyzz*v278 + D_yyyyzzz*v290 + D_yyyz*v264 + D_yyyzz*v270 + &
      D_yyyzzz*v279 + D_yyyzzzz*v291 + D_yyz*M_yz + D_yz*M_z + M_xyy* &
      v199 + M_xyyy*v200 + M_xyyyy*v201 + M_xyyyyy*v202 + M_xyyyyz*v203 &
      + M_xyyyz*v204 + M_xyyyzz*v205 + M_xyyz*v206 + M_xyyzz*v207 + &
      M_xyyzzz*v208 + M_xyzz*v194 + M_xyzzz*v195 + M_xyzzzz*v196 + &
      M_xzz*v209 + M_xzzz*v210 + M_xzzzz*v211 + M_xzzzzz*v212 + M_yzz* &
      v280 + M_yzzz*v281 + M_yzzzz*v282 + M_yzzzzz*v283 + M_zz*v292 + &
      M_zzz*v293 + M_zzzz*v294 + M_zzzzz*v295 + M_zzzzzz*v296)
    L_yz      = L_yz + (D_xxxxxyz*v149 + D_xxxxyyz*v150 + D_xxxxyz*v112 + D_xxxxyzz*v151 + &
      D_xxxyyyz*v152 + D_xxxyyz*v113 + D_xxxyyzz*v153 + D_xxxyz*v92 + &
      D_xxxyzz*v114 + D_xxxyzzz*v154 + D_xxyyyyz*v155 + D_xxyyyz*v115 + &
      D_xxyyyzz*v156 + D_xxyyz*v93 + D_xxyyzz*v116 + D_xxyyzzz*v157 + &
      D_xxyz*v83 + D_xxyzz*v94 + D_xxyzzz*v117 + D_xxyzzzz*v158 + &
      D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyyyyyz &
      *v276 + D_yyyyyz*v268 + D_yyyyyzz*v277 + D_yyyyz*v263 + D_yyyyzz* &
      v269 + D_yyyyzzz*v278 + D_yyyz*v261 + D_yyyzz*v264 + D_yyyzzz* &
      v270 + D_yyyzzzz*v279 + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + &
      D_yzz*M_z + M_xyy*v206 + M_xyyy*v204 + M_xyyyy*v203 + M_xyyyz* &
      v213 + M_xyyz*v185 + M_xyyzz*v214 + M_xyzz*v197 + M_xyzzz*v198 + &
      M_xzz*v215 + M_xzzz*v216 + M_xzzzz*v217 + M_yzz*v284 + M_yzzz* &
      v285 + M_yzzzz*v286 + M_zz*v297 + M_zzz*v298 + M_zzzz*v299 + &
      M_zzzzz*v300)
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_0       = L_0 + (0.000198412698412698d0*(D_xxxxxxx*M_xxxxxxx + 42.0d0*D_xxxxxyz*M_xxxxxyz &
      + D_yyyyyyy*M_yyyyyyy + D_zzzzzzz*M_zzzzzzz + 140.0d0*(D_xxxyyyz* &
      M_xxxyyyz + D_xxxyzzz*M_xxxyzzz) + 7.0d0*(D_xxxxxxy*M_xxxxxxy + &
      D_xxxxxxz*M_xxxxxxz + D_yyyyyyz*M_yyyyyyz) + 210.0d0*(D_xxxyyzz* &
      M_xxxyyzz + D_xxyyyzz*M_xxyyyzz + D_xxyyzzz*M_xxyyzzz) + 105.0d0* &
      (D_xxxxyyz*M_xxxxyyz + D_xxxxyzz*M_xxxxyzz + D_xxyyyyz*M_xxyyyyz &
      + D_xxyzzzz*M_xxyzzzz) + 21.0d0*(D_xxxxxyy*M_xxxxxyy + D_xxxxxzz* &
      M_xxxxxzz + D_xxyyyyy*M_xxyyyyy + D_xxzzzzz*M_xxzzzzz + D_yyyyyzz &
      *M_yyyyyzz + D_yyzzzzz*M_yyzzzzz) + 35.0d0*(D_xxxxyyy*M_xxxxyyy + &
      D_xxxxzzz*M_xxxxzzz + D_xxxyyyy*M_xxxyyyy + D_xxxzzzz*M_xxxzzzz + &
      D_yyyyzzz*M_yyyyzzz + D_yyyzzzz*M_yyyzzzz)) + D_0*M_0 + D_x*M_x + &
      D_xx*v83 + D_xxx*v92 + D_xxxx*v112 + D_xxxxx*v149 + D_xxxxxx*v218 &
      + D_xxxxxy*v219 + D_xxxxxz*v220 + D_xxxxy*v150 + D_xxxxyy*v221 + &
      D_xxxxyz*v222 + D_xxxxz*v151 + D_xxxxzz*v223 + D_xxxy*v113 + &
      D_xxxyy*v152 + D_xxxyyy*v224 + D_xxxyyz*v225 + D_xxxyz*v153 + &
      D_xxxyzz*v226 + D_xxxz*v114 + D_xxxzz*v154 + D_xxxzzz*v227 + &
      D_xxy*v93 + D_xxyy*v115 + D_xxyyy*v155 + D_xxyyyy*v228 + D_xxyyyz &
      *v229 + D_xxyyz*v156 + D_xxyyzz*v230 + D_xxyz*v116 + D_xxyzz*v157 &
      + D_xxyzzz*v231 + D_xxz*v94 + D_xxzz*v117 + D_xxzzz*v158 + &
      D_xxzzzz*v232 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + &
      D_yy*v261 + D_yyy*v263 + D_yyyy*v268 + D_yyyyy*v276 + D_yyyyyy* &
      v287 + D_yyyyyz*v288 + D_yyyyz*v277 + D_yyyyzz*v289 + D_yyyz*v269 &
      + D_yyyzz*v278 + D_yyyzzz*v290 + D_yyz*v264 + D_yyzz*v270 + &
      D_yyzzz*v279 + D_yyzzzz*v291 + D_yz*M_yz + D_z*M_z + D_zz*v301 + &
      D_zzz*v302 + D_zzzz*v303 + D_zzzzz*v304 + D_zzzzzz*v305 + M_xyy* &
      v233 + M_xyyy*v234 + M_xyyyy*v235 + M_xyyyyy*v236 + M_xyyyyyy* &
      v237 + M_xyyyyyz*v238 + M_xyyyyz*v239 + M_xyyyyzz*v240 + M_xyyyz* &
      v241 + M_xyyyzz*v242 + M_xyyyzzz*v243 + M_xyyz*v244 + M_xyyzz* &
      v245 + M_xyyzzz*v246 + M_xyyzzzz*v247 + M_xyzz*v209 + M_xyzzz* &
      v210 + M_xyzzzz*v211 + M_xyzzzzz*v212 + M_xzz*v248 + M_xzzz*v249 &
      + M_xzzzz*v250 + M_xzzzzz*v251 + M_xzzzzzz*v252 + M_yzz*v292 + &
      M_yzzz*v293 + M_yzzzz*v294 + M_yzzzzz*v295 + M_yzzzzzz*v296)
    L_z       = L_z + (D_xxxxxxz*v218 + D_xxxxxyz*v219 + D_xxxxxz*v149 + D_xxxxxzz*v220 + &
      D_xxxxyyz*v221 + D_xxxxyz*v150 + D_xxxxyzz*v222 + D_xxxxz*v112 + &
      D_xxxxzz*v151 + D_xxxxzzz*v223 + D_xxxyyyz*v224 + D_xxxyyz*v152 + &
      D_xxxyyzz*v225 + D_xxxyz*v113 + D_xxxyzz*v153 + D_xxxyzzz*v226 + &
      D_xxxz*v92 + D_xxxzz*v114 + D_xxxzzz*v154 + D_xxxzzzz*v227 + &
      D_xxyyyyz*v228 + D_xxyyyz*v155 + D_xxyyyzz*v229 + D_xxyyz*v115 + &
      D_xxyyzz*v156 + D_xxyyzzz*v230 + D_xxyz*v93 + D_xxyzz*v116 + &
      D_xxyzzz*v157 + D_xxyzzzz*v231 + D_xxz*v83 + D_xxzz*v94 + D_xxzzz &
      *v117 + D_xxzzzz*v158 + D_xxzzzzz*v232 + D_xyz*M_xy + D_xyzz* &
      M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyyyz*v287 + D_yyyyyz*v276 + &
      D_yyyyyzz*v288 + D_yyyyz*v268 + D_yyyyzz*v277 + D_yyyyzzz*v289 + &
      D_yyyz*v263 + D_yyyzz*v269 + D_yyyzzz*v278 + D_yyyzzzz*v290 + &
      D_yyz*v261 + D_yyzz*v264 + D_yyzzz*v270 + D_yyzzzz*v279 + &
      D_yyzzzzz*v291 + D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + &
      D_zzz*v301 + D_zzzz*v302 + D_zzzzz*v303 + D_zzzzzz*v304 + &
      D_zzzzzzz*v305 + M_xyy*v244 + M_xyyy*v241 + M_xyyyy*v239 + &
      M_xyyyyy*v238 + M_xyyyyz*v253 + M_xyyyz*v254 + M_xyyyzz*v208 + &
      M_xyyz*v194 + M_xyyzz*v255 + M_xyyzzz*v256 + M_xyzz*v215 + &
      M_xyzzz*v216 + M_xyzzzz*v217 + M_xzz*v257 + M_xzzz*v258 + M_xzzzz &
      *v259 + M_xzzzzz*v260 + M_yzz*v297 + M_yzzz*v298 + M_yzzzz*v299 + &
      M_yzzzzz*v300)
#undef  M_0                 
#undef  y                   
#undef  x                   
#undef  L_0                 
#undef  z                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  M_z                 
#undef  L_z                 
#undef  L_xx                
#undef  M_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
#undef  M_yy                
#undef  L_yy                
#undef  L_yz                
#undef  M_yz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  M_xxy               
#undef  L_xxz               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
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
#undef  M_xxyz              
#undef  L_xxyz              
#undef  M_xyyy              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  L_yyyz              
#undef  M_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxyy             
#undef  M_xxxyz             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  M_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  L_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  L_xxxxxz            
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
#undef  L_xxyyyz            
#undef  M_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  L_xxxxxxy           
#undef  M_xxxxxxz           
#undef  L_xxxxxxz           
#undef  M_xxxxxyy           
#undef  L_xxxxxyy           
#undef  M_xxxxxyz           
#undef  L_xxxxxyz           
#undef  M_xxxxyyy           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  M_xxxxyyz           
#undef  M_xxxyyyy           
#undef  L_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  L_xxyyyyz           
#undef  M_xyyyyyy           
#undef  L_xyyyyyy           
#undef  M_xyyyyyz           
#undef  L_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_yyyyyyz           
    end subroutine mom_es_M2L_add
    
! OPS  616*ADD + 2*DIV + 729*MUL + 56*NEG + POW = 1404  (4106 before optimization)
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
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v3, v30, v31, v32, v33,&
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
                L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz,&
                L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz,&
                L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz,&
                L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz,&
                L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
#define Ls_xxy               Ls(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define Ls_xxz               Ls(11)
#define Ls_xyy               Ls(12)
#define L_xyy                L(12)
#define Ls_xyz               Ls(13)
#define L_xyz                L(13)
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
#define Ls_xxxxxxx           Ls(49)
#define L_xxxxxxx            L(49)
#define Ls_xxxxxxy           Ls(50)
#define L_xxxxxxy            L(50)
#define Ls_xxxxxxz           Ls(51)
#define L_xxxxxxz            L(51)
#define Ls_xxxxxyy           Ls(52)
#define L_xxxxxyy            L(52)
#define Ls_xxxxxyz           Ls(53)
#define L_xxxxxyz            L(53)
#define L_xxxxyyy            L(54)
#define Ls_xxxxyyy           Ls(54)
#define Ls_xxxxyyz           Ls(55)
#define L_xxxxyyz            L(55)
#define L_xxxyyyy            L(56)
#define Ls_xxxyyyy           Ls(56)
#define Ls_xxxyyyz           Ls(57)
#define L_xxxyyyz            L(57)
#define Ls_xxyyyyy           Ls(58)
#define L_xxyyyyy            L(58)
#define Ls_xxyyyyz           Ls(59)
#define L_xxyyyyz            L(59)
#define Ls_xyyyyyy           Ls(60)
#define L_xyyyyyy            L(60)
#define L_xyyyyyz            L(61)
#define Ls_xyyyyyz           Ls(61)
#define Ls_yyyyyyy           Ls(62)
#define L_yyyyyyy            L(62)
#define Ls_yyyyyyz           Ls(63)
#define L_yyyyyyz            L(63)
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
    v135       = 0.0416666666666667d0*x
    v147       = L_xyyyyz*z
    v150       = v9*y
    v153       = L_xyyyz*z
    v164       = L_xyyz*z
    v180       = L_xyz*z
    v200       = L_xz*z
    v219       = 0.00833333333333333d0*x
    v233       = L_yyyyyz*z
    v236       = L_yyyyz*z
    v239       = 0.5d0*y
    v243       = L_yyyz*z
    v248       = 0.166666666666667d0*y
    v254       = L_yyz*z
    v261       = 0.0416666666666667d0*y
    v268       = L_yz*z
    v278       = 0.00833333333333333d0*y
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
    v222       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v280       = L_yzz*z
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    v138       = L_xxzz*z
    L_xyzz     = -(L_xxxy + L_xyyy)
    v191       = L_xyzz*z
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    v263       = L_yyzz*z
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    v78        = L_xxxzz*z
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    v111       = L_xxyzz*z
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    v173       = L_xyyzz*z
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    v250       = L_yyyzz*z
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
    v160       = L_xyyyzz*z
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    v241       = L_yyyyzz*z
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
    v151       = L_xyyyyz + L_xyyyyzz*z
    v152       = L_xyyyyyz*y + v151
    v163       = v151*y
    Ls_xyyyyz  = Ls_xyyyyz + (L_xxyyyyz*x + v152)
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    v235       = L_yyyyyz + L_yyyyyzz*z
    Ls_yyyyyz  = Ls_yyyyyz + (v235 + L_xyyyyyz*x + L_yyyyyyz*y)
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
    v134       = 0.0833333333333333d0*v13
    v218       = 0.0208333333333333d0*v13
    a3         = a1*a2
    v28        = a3
    v29        = 0.166666666666667d0*v28
    v133       = 0.0833333333333333d0*v28
    v217       = 0.0277777777777778d0*v28
    a4         = a2*a2
    v62        = a4
    v63        = 0.0416666666666667d0*v62
    v214       = 0.0208333333333333d0*v62
    a5         = a2*a3
    v119       = a5
    v120       = 0.00833333333333333d0*v119
    a6         = a3*a3
    v201       = 0.00138888888888889d0*a6
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
    v148       = L_xyyyyyy*v15
    v161       = L_xyyyyyz*v15
    v247       = 0.25d0*v15
    v260       = 0.0833333333333333d0*v15
    v277       = 0.0208333333333333d0*v15
    b3         = b1*b2
    v30        = b3
    v31        = L_xxxxyyy*v30
    v51        = L_xxxyyyy*v30
    v70        = 0.166666666666667d0*v30
    v79        = L_xxxyyyz*v30
    v92        = L_xxyyyyy*v30
    v112       = L_xxyyyyz*v30
    v136       = 4.0d0*v30
    v154       = L_xyyyyyy*v30
    v174       = L_xyyyyyz*v30
    v259       = 0.0833333333333333d0*v30
    v276       = 0.0277777777777778d0*v30
    b4         = b2*b2
    v64        = b4
    v65        = L_xxxyyyy*v64
    v103       = L_xxyyyyy*v64
    v128       = 0.0416666666666667d0*v64
    v139       = L_xxyyyyz*v64
    v165       = L_xyyyyyy*v64
    v192       = L_xyyyyyz*v64
    v220       = 5.0d0*v64
    v275       = 0.0208333333333333d0*v64
    b5         = b2*b3
    v121       = b5
    v122       = L_xxyyyyy*v121
    v181       = L_xyyyyyy*v121
    v210       = 0.00833333333333333d0*v121
    v223       = L_xyyyyyz*v121
    b6         = b3*b3
    v202       = b6
    v203       = L_xyyyyyy*v202
    v269       = 0.00138888888888889d0*v202
    b7         = b3*b4
    c2         = c1*c1
    v17        = c2
    v286       = 0.5d0*v17
    v204       = L_xzz*v17
    v270       = L_yzz*v17
    v123       = L_xxzz*v17
    v182       = L_xyzz*v17
    v224       = L_xzzz*v17
    v255       = L_yyzz*v17
    v281       = L_yzzz*v17
    v66        = L_xxxzz*v17
    v104       = L_xxyzz*v17
    v140       = L_xxzzz*v17
    v166       = L_xyyzz*v17
    v193       = L_xyzzz*v17
    v244       = L_yyyzz*v17
    v264       = L_yyzzz*v17
    v32        = L_xxxxzz*v17
    v52        = L_xxxyzz*v17
    v80        = L_xxxzzz*v17
    v93        = L_xxyyzz*v17
    v113       = L_xxyzzz*v17
    v155       = L_xyyyzz*v17
    v175       = L_xyyzzz*v17
    v237       = L_yyyyzz*v17
    v251       = L_yyyzzz*v17
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
    v129       = v30*v95
    v159       = 2.0d0*v88 + v86 + v95
    Ls_xxyyy   = Ls_xxyyy + (0.5d0*(v86 + v87) + L_xxxxyyy*v14 + L_xxyyy + v6*x + v85 + v88)
    v100       = L_xxyyzzz*v17
    v115       = v100 + 2.0d0*(L_xxyyz + v98)
    v116       = v115*y
    v143       = v115*v15
    v179       = 2.0d0*v101 + v115 + v99
    Ls_xxyyz   = Ls_xxyyz + (0.5d0*(v100 + v99) + L_xxxxyyz*v14 + L_xxyyz + v101 + v49*x + v98)
    v149       = L_xyyyyzz*v17
    v157       = v149 + 2.0d0*(L_xyyyy + v147)
    v158       = v157*y
    v169       = v15*v157
    v186       = v157*v30
    v211       = v157*v64
    Ls_xyyyy   = Ls_xyyyy + (0.5d0*(v148 + v149) + L_xxxyyyy*v14 + L_xyyyy + v147 + v150 + v8*x)
    v162       = L_xyyyzzz*v17
    v177       = v162 + 2.0d0*(L_xyyyz + v160)
    v178       = v177*y
    v196       = v15*v177
    v228       = v177*v30
    Ls_xyyyz   = Ls_xyyyz + (0.5d0*(v161 + v162) + L_xxxyyyz*v14 + L_xyyyz + v160 + v163 + v90*x)
    v234       = L_yyyyyzz*v17
    v240       = v234 + 2.0d0*(L_yyyyy + v233)
    Ls_yyyyy   = Ls_yyyyy + (0.5d0*v234 + L_xxyyyyy*v14 + L_yyyyy + L_yyyyyyy*v35 + v10*x + v11*y + &
      v233)
    v242       = L_yyyyzzz*v17
    v253       = v242 + 2.0d0*(L_yyyyz + v241)
    Ls_yyyyz   = Ls_yyyyz + (0.5d0*v242 + L_xxyyyyz*v14 + L_yyyyyyz*v35 + L_yyyyz + v152*x + v235*y + &
      v241)
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
    v287       = 0.166666666666667d0*v33
    v205       = L_xzzz*v33
    v271       = L_yzzz*v33
    v124       = L_xxzzz*v33
    v183       = L_xyzzz*v33
    v225       = L_xzzzz*v33
    v256       = L_yyzzz*v33
    v282       = L_yzzzz*v33
    v67        = L_xxxzzz*v33
    v105       = L_xxyzzz*v33
    v141       = L_xxzzzz*v33
    v167       = L_xyyzzz*v33
    v194       = L_xyzzzz*v33
    v245       = L_yyyzzz*v33
    v265       = L_yyzzzz*v33
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
    v146       = v79 + v81 + v48*v76 + 6.0d0*(L_xxxz + v78) + 3.0d0*(v80 + v83)
    Ls_xxxz    = Ls_xxxz + (0.166666666666667d0*(v79 + v81 + 3.0d0*(v80 + v83)) + L_xxxxxxz*v29 + &
      L_xxxz + v14*v20 + v35*v48 + v38*v84 + v78)
    v94        = L_xxyyzzz*v33
    v108       = v94 + 3.0d0*(2.0d0*L_xxyy + 2.0d0*v91 + v93)
    v109       = v108*y
    v130       = v108*v15
    v172       = v108 + v92 + v7*v76 + 3.0d0*v96
    Ls_xxyy    = Ls_xxyy + (0.166666666666667d0*(v92 + v94 + 3.0d0*(v93 + v96)) + L_xxxxxyy*v29 + &
      L_xxyy + v14*v4 + v35*v7 + v38*v97 + v91)
    v114       = L_xxyzzzz*v33
    v144       = v114 + 3.0d0*(2.0d0*L_xxyz + 2.0d0*v111 + v113)
    v145       = v144*y
    v199       = v112 + v144 + 3.0d0*v116 + v76*v89
    Ls_xxyz    = Ls_xxyz + (0.166666666666667d0*(v112 + v114 + 3.0d0*(v113 + v116)) + L_xxxxxyz*v29 &
      + L_xxyz + v111 + v117*v38 + v14*v26 + v35*v89)
    v156       = L_xyyyzzz*v33
    v170       = v156 + 3.0d0*(2.0d0*L_xyyy + 2.0d0*v153 + v155)
    v171       = v170*y
    v187       = v15*v170
    v212       = v170*v30
    Ls_xyyy    = Ls_xyyy + (0.166666666666667d0*(v154 + v156 + 3.0d0*(v155 + v158)) + L_xxxxyyy*v29 &
      + L_xyyy + v14*v6 + v153 + v159*v38 + v35*v9)
    v176       = L_xyyzzzz*v33
    v197       = v176 + 3.0d0*(2.0d0*L_xyyz + 2.0d0*v173 + v175)
    v198       = v197*y
    v229       = v15*v197
    Ls_xyyz    = Ls_xyyz + (0.166666666666667d0*(v174 + v176 + 3.0d0*(v175 + v178)) + L_xxxxyyz*v29 &
      + L_xyyz + v14*v49 + v151*v35 + v173 + v179*v38)
    v238       = L_yyyyzzz*v33
    v249       = v238 + 3.0d0*(2.0d0*L_yyyy + 2.0d0*v236 + v237)
    Ls_yyyy    = Ls_yyyy + (0.166666666666667d0*(3.0d0*v237 + v238) + L_xxxyyyy*v29 + L_yyyy + &
      L_yyyyyyy*v70 + v11*v35 + v14*v8 + v236 + v239*v240 + v38*(v148 + &
      2.0d0*v150 + v157))
    v252       = L_yyyzzzz*v33
    v267       = v252 + 3.0d0*(2.0d0*L_yyyz + 2.0d0*v250 + v251)
    Ls_yyyz    = Ls_yyyz + (0.166666666666667d0*(3.0d0*v251 + v252) + L_xxxyyyz*v29 + L_yyyyyyz*v70 &
      + L_yyyz + v14*v90 + v235*v35 + v239*v253 + v250 + v38*(v161 + &
      2.0d0*v163 + v177))
    c4         = c2*c2
    v68        = c4
    v288       = 0.0416666666666667d0*v68
    v206       = L_xzzzz*v68
    v272       = L_yzzzz*v68
    v125       = L_xxzzzz*v68
    v184       = L_xyzzzz*v68
    v226       = L_xzzzzz*v68
    v257       = L_yyzzzz*v68
    v283       = L_yzzzzz*v68
    v69        = L_xxxzzzz*v68
    v137       = v65 + v69 + v136*v5 + 12.0d0*v66 + 6.0d0*v71 + 24.0d0*(L_xxx + v61) + &
      4.0d0*(v67 + v73)
    Ls_xxx     = Ls_xxx + (0.0416666666666667d0*(v65 + 12.0d0*v66 + v69 + 6.0d0*v71 + 4.0d0*(v67 + &
      v73)) + L_xxx + L_xxxxxxx*v63 + v0*v29 + v39*v74 + v5*v70 + v61 + &
      v75*v77)
    v106       = L_xxyzzzz*v68
    v131       = v106 + 12.0d0*v104 + 4.0d0*(6.0d0*L_xxy + 6.0d0*v102 + v105)
    v132       = v131*y
    v190       = v103 + v131 + 6.0d0*v107 + 4.0d0*v109 + v136*v7
    Ls_xxy     = Ls_xxy + (0.0416666666666667d0*(v103 + 12.0d0*v104 + v106 + 6.0d0*v107 + 4.0d0*( &
      v105 + v109)) + L_xxxxxxy*v63 + L_xxy + v102 + v110*v75 + v2*v29 &
      + v56*v74 + v7*v70)
    v142       = L_xxzzzzz*v68
    v232       = v139 + v142 + v136*v89 + 12.0d0*v140 + 6.0d0*v143 + 24.0d0*(L_xxz + v138 &
      ) + 4.0d0*(v141 + v145)
    Ls_xxz     = Ls_xxz + (0.0416666666666667d0*(v139 + 12.0d0*v140 + v142 + 6.0d0*v143 + 4.0d0*( &
      v141 + v145)) + L_xxxxxxz*v63 + L_xxz + v138 + v146*v75 + v20*v29 &
      + v70*v89 + v74*v84)
    v168       = L_xyyzzzz*v68
    v188       = v168 + 12.0d0*v166 + 4.0d0*(6.0d0*L_xyy + 6.0d0*v164 + v167)
    v189       = v188*y
    v213       = v15*v188
    Ls_xyy     = Ls_xyy + (0.0416666666666667d0*(v165 + 12.0d0*v166 + v168 + 6.0d0*v169 + 4.0d0*( &
      v167 + v171)) + L_xxxxxyy*v63 + L_xyy + v164 + v172*v75 + v29*v4 &
      + v70*v9 + v74*v97)
    v195       = L_xyzzzzz*v68
    v230       = v195 + 12.0d0*v193 + 4.0d0*(6.0d0*L_xyz + 6.0d0*v191 + v194)
    v231       = v230*y
    Ls_xyz     = Ls_xyz + (0.0416666666666667d0*(v192 + 12.0d0*v193 + v195 + 6.0d0*v196 + 4.0d0*( &
      v194 + v198)) + L_xxxxxyz*v63 + L_xyz + v117*v74 + v151*v70 + &
      v191 + v199*v75 + v26*v29)
    v246       = L_yyyzzzz*v68
    v262       = v246 + 12.0d0*v244 + 4.0d0*(6.0d0*L_yyy + 6.0d0*v243 + v245)
    Ls_yyy     = Ls_yyy + (0.0416666666666667d0*(12.0d0*v244 + 4.0d0*v245 + v246) + L_xxxxyyy*v63 + &
      L_yyy + L_yyyyyyy*v128 + v11*v70 + v159*v74 + v240*v247 + v243 + &
      v248*v249 + v29*v6 + v75*(v154 + 3.0d0*v158 + v170 + v76*v9))
    v266       = L_yyzzzzz*v68
    v285       = v266 + 12.0d0*v264 + 4.0d0*(6.0d0*L_yyz + 6.0d0*v263 + v265)
    Ls_yyz     = Ls_yyz + (0.0416666666666667d0*(12.0d0*v264 + 4.0d0*v265 + v266) + L_xxxxyyz*v63 + &
      L_yyyyyyz*v128 + L_yyz + v179*v74 + v235*v70 + v247*v253 + v248* &
      v267 + v263 + v29*v49 + v75*(v151*v76 + v174 + 3.0d0*v178 + v197))
    c5         = c2*c3
    v126       = c5
    v289       = 0.00833333333333333d0*v126
    v207       = L_xzzzzz*v126
    v273       = L_yzzzzz*v126
    v127       = L_xxzzzzz*v126
    v221       = v122 + v127 + 60.0d0*v123 + 20.0d0*v124 + v220*v7 + 120.0d0*(L_xx + v118 &
      ) + 5.0d0*(v125 + v132) + 10.0d0*(v129 + v130)
    Ls_xx      = Ls_xx + (0.00833333333333333d0*(v122 + 60.0d0*v123 + 20.0d0*v124 + v127 + 5.0d0*( &
      v125 + v132) + 10.0d0*(v129 + v130)) + L_xx + L_xxxxxxx*v120 + v0 &
      *v63 + v118 + v128*v7 + v133*v39 + v134*v77 + v135*v137)
    v185       = L_xyzzzzz*v126
    v215       = v185 + 60.0d0*v182 + 20.0d0*v183 + 5.0d0*(24.0d0*L_xy + 24.0d0*v180 + &
      v184)
    v216       = v215*y
    Ls_xy      = Ls_xy + (0.00833333333333333d0*(v181 + 60.0d0*v182 + 20.0d0*v183 + v185 + 5.0d0*( &
      v184 + v189) + 10.0d0*(v186 + v187)) + L_xxxxxxy*v120 + L_xy + &
      v110*v134 + v128*v9 + v133*v56 + v135*v190 + v180 + v2*v63)
    v227       = L_xzzzzzz*v126
    Ls_xz      = Ls_xz + (0.00833333333333333d0*(v223 + 60.0d0*v224 + 20.0d0*v225 + v227 + 5.0d0*( &
      v226 + v231) + 10.0d0*(v228 + v229)) + L_xxxxxxz*v120 + L_xz + &
      v128*v151 + v133*v84 + v134*v146 + v135*v232 + v20*v63 + v222)
    v258       = L_yyzzzzz*v126
    v279       = v258 + 60.0d0*v255 + 20.0d0*v256 + 5.0d0*(24.0d0*L_yy + 24.0d0*v254 + &
      v257)
    Ls_yy      = Ls_yy + (0.00833333333333333d0*(60.0d0*v255 + 20.0d0*v256 + 5.0d0*v257 + v258) + &
      L_xxxxxyy*v120 + L_yy + L_yyyyyyy*v210 + v11*v128 + v133*v97 + &
      v134*v172 + v135*(v136*v9 + v165 + 6.0d0*v169 + 4.0d0*v171 + v188 &
      ) + v240*v259 + v249*v260 + v254 + v261*v262 + v4*v63)
    v284       = L_yzzzzzz*v126
    Ls_yz      = Ls_yz + (0.00833333333333333d0*(60.0d0*v281 + 20.0d0*v282 + 5.0d0*v283 + v284) + &
      L_xxxxxyz*v120 + L_yyyyyyz*v210 + L_yz + v117*v133 + v128*v235 + &
      v134*v199 + v135*(v136*v151 + v192 + 6.0d0*v196 + 4.0d0*v198 + &
      v230) + v253*v259 + v26*v63 + v260*v267 + v261*v285 + v280)
    c6         = c3*c3
    v208       = c6
    v290       = 0.00138888888888889d0*v208
    v209       = L_xzzzzzz*v208
    Ls_x       = Ls_x + (0.00138888888888889d0*(v203 + 360.0d0*v204 + 120.0d0*v205 + 30.0d0*v206 &
      + v209 + 20.0d0*v212 + 6.0d0*(v207 + v216) + 15.0d0*(v211 + v213 &
      )) + L_x + L_xxxxxxx*v201 + v0*v120 + v137*v218 + v200 + v210*v9 &
      + v214*v39 + v217*v77 + v219*v221)
    v274       = L_yzzzzzz*v208
    Ls_y       = Ls_y + (0.00138888888888889d0*(360.0d0*v270 + 120.0d0*v271 + 30.0d0*v272 + 6.0d0 &
      *v273 + v274) + L_xxxxxxy*v201 + L_y + L_yyyyyyy*v269 + v11*v210 &
      + v110*v217 + v120*v2 + v190*v218 + v214*v56 + v219*(v181 + &
      10.0d0*v186 + 10.0d0*v187 + 5.0d0*v189 + v215 + v220*v9) + v240* &
      v275 + v249*v276 + v262*v277 + v268 + v278*v279)
    Ls_z       = Ls_z + (L_z + L_xxxxxxz*v201 + L_yyyyyyz*v269 + L_zz*z + L_zzz*v286 + L_zzzz* &
      v287 + L_zzzzz*v288 + L_zzzzzz*v289 + L_zzzzzzz*v290 + v120*v20 + &
      v146*v217 + v210*v235 + v214*v84 + v218*v232 + v219*(120.0d0*L_xz &
      + v151*v220 + 120.0d0*v222 + v223 + 60.0d0*v224 + 20.0d0*v225 + &
      5.0d0*v226 + v227 + 10.0d0*v228 + 10.0d0*v229 + 5.0d0*v231) + &
      v253*v275 + v267*v276 + v277*v285 + v278*(120.0d0*L_yz + 120.0d0* &
      v280 + 60.0d0*v281 + 20.0d0*v282 + 5.0d0*v283 + v284))
    c7         = c3*c4
    Ls_0       = Ls_0 + (0.000198412698412698d0*(L_xxxxxxx*a7 + L_yyyyyyy*b7 + L_zzzzzzz*c7 + &
      7.0d0*(x*(720.0d0*L_x + 6.0d0*v121*v9 + 720.0d0*v200 + v203 + &
      360.0d0*v204 + 120.0d0*v205 + 30.0d0*v206 + 6.0d0*v207 + v209 + &
      15.0d0*v211 + 20.0d0*v212 + 15.0d0*v213 + 6.0d0*v216) + y*( &
      720.0d0*L_y + 720.0d0*v268 + 360.0d0*v270 + 120.0d0*v271 + 30.0d0 &
      *v272 + 6.0d0*v273 + v274)) + 21.0d0*(v119*v39 + v121*v240 + v13* &
      v221 + v15*v279) + 35.0d0*(v137*v28 + v249*v64 + v262*v30 + v62* &
      v77)) + L_0 + L_z*z + L_zz*v286 + L_zzz*v287 + L_zzzz*v288 + &
      L_zzzzz*v289 + L_zzzzzz*v290 + v0*v201 + v11*v269)
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
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
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
    
! OPS  1265*ADD + 2*DIV + 1717*MUL + 138*NEG + POW + 35*SUB = 3158  (4070 before optimization)
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
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v291, v292, v293, v294,&
                v295, v296, v297, v298, v299, v3, v30, v300, v301, v302, v303,&
                v304, v305, v306, v307, v308, v309, v31, v310, v311, v312,&
                v313, v314, v315, v316, v317, v318, v319, v32, v320, v321,&
                v322, v323, v324, v325, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
                D_xz, D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz,&
                D_xzz, D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz,&
                D_xxyy, D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz,&
                D_yyyy, D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy,&
                D_xxxxz, D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz,&
                D_xxzzz, D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy,&
                D_yyyyz, D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx,&
                D_xxxxxy, D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy,&
                D_xxxyyz, D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz,&
                D_xxyzzz, D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz,&
                D_xyzzzz, D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz,&
                D_yyzzzz, D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy, D_xxxxxxz,&
                D_xxxxxyy, D_xxxxxyz, D_xxxxxzz, D_xxxxyyy, D_xxxxyyz,&
                D_xxxxyzz, D_xxxxzzz, D_xxxyyyy, D_xxxyyyz, D_xxxyyzz,&
                D_xxxyzzz, D_xxxzzzz, D_xxyyyyy, D_xxyyyyz, D_xxyyyzz,&
                D_xxyyzzz, D_xxyzzzz, D_xxzzzzz, D_xyyyyyy, D_xyyyyyz,&
                D_xyyyyzz, D_xyyyzzz, D_xyyzzzz, D_xyzzzzz, D_xzzzzzz,&
                D_yyyyyyy, D_yyyyyyz, D_yyyyyzz, D_yyyyzzz, D_yyyzzzz,&
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, M_zz, M_xzz, M_yzz, M_zzz,&
                M_xxzz, M_xyzz, M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz,&
                M_xxyzz, M_xxzzz, M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz,&
                M_yzzzz, M_zzzzz, M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz,&
                M_xxyzzz, M_xxzzzz, M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz,&
                M_yyyyzz, M_yyyzzz, M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz,&
                M_xxxxyzz, M_xxxxzzz, M_xxxyyzz, M_xxxyzzz, M_xxxzzzz,&
                M_xxyyyzz, M_xxyyzzz, M_xxyzzzz, M_xxzzzzz, M_xyyyyzz,&
                M_xyyyzzz, M_xyyzzzz, M_xyzzzzz, M_xzzzzzz, M_yyyyyzz,&
                M_yyyyzzz, M_yyyzzzz, M_yyzzzzz, M_yzzzzzz, M_zzzzzzz
#define M_0                  M(1:2,0)
#define y                    r(1:2,2)
#define x                    r(1:2,1)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
#define L_y                  L(1:2,2)
#define M_y                  M(1:2,2)
#define M_z                  M(1:2,3)
#define L_z                  L(1:2,3)
#define L_xx                 L(1:2,4)
#define M_xx                 M(1:2,4)
#define L_xy                 L(1:2,5)
#define M_xy                 M(1:2,5)
#define M_xz                 M(1:2,6)
#define L_xz                 L(1:2,6)
#define M_yy                 M(1:2,7)
#define L_yy                 L(1:2,7)
#define L_yz                 L(1:2,8)
#define M_yz                 M(1:2,8)
#define L_xxx                L(1:2,9)
#define M_xxx                M(1:2,9)
#define L_xxy                L(1:2,10)
#define M_xxy                M(1:2,10)
#define L_xxz                L(1:2,11)
#define M_xxz                M(1:2,11)
#define L_xyy                L(1:2,12)
#define M_xyy                M(1:2,12)
#define L_xyz                L(1:2,13)
#define M_xyz                M(1:2,13)
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
#define M_xxyz               M(1:2,20)
#define L_xxyz               L(1:2,20)
#define M_xyyy               M(1:2,21)
#define L_xyyy               L(1:2,21)
#define L_xyyz               L(1:2,22)
#define M_xyyz               M(1:2,22)
#define L_yyyy               L(1:2,23)
#define M_yyyy               M(1:2,23)
#define L_yyyz               L(1:2,24)
#define M_yyyz               M(1:2,24)
#define L_xxxxx              L(1:2,25)
#define M_xxxxx              M(1:2,25)
#define M_xxxxy              M(1:2,26)
#define L_xxxxy              L(1:2,26)
#define L_xxxxz              L(1:2,27)
#define M_xxxxz              M(1:2,27)
#define M_xxxyy              M(1:2,28)
#define L_xxxyy              L(1:2,28)
#define M_xxxyz              M(1:2,29)
#define L_xxxyz              L(1:2,29)
#define L_xxyyy              L(1:2,30)
#define M_xxyyy              M(1:2,30)
#define L_xxyyz              L(1:2,31)
#define M_xxyyz              M(1:2,31)
#define L_xyyyy              L(1:2,32)
#define M_xyyyy              M(1:2,32)
#define M_xyyyz              M(1:2,33)
#define L_xyyyz              L(1:2,33)
#define M_yyyyy              M(1:2,34)
#define L_yyyyy              L(1:2,34)
#define L_yyyyz              L(1:2,35)
#define M_yyyyz              M(1:2,35)
#define L_xxxxxx             L(1:2,36)
#define M_xxxxxx             M(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define M_xxxxxy             M(1:2,37)
#define M_xxxxxz             M(1:2,38)
#define L_xxxxxz             L(1:2,38)
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
#define L_xxyyyz             L(1:2,44)
#define M_xxyyyz             M(1:2,44)
#define L_xyyyyy             L(1:2,45)
#define M_xyyyyy             M(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define M_xyyyyz             M(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define M_yyyyyy             M(1:2,47)
#define M_yyyyyz             M(1:2,48)
#define L_yyyyyz             L(1:2,48)
#define L_xxxxxxx            L(1:2,49)
#define M_xxxxxxx            M(1:2,49)
#define M_xxxxxxy            M(1:2,50)
#define L_xxxxxxy            L(1:2,50)
#define M_xxxxxxz            M(1:2,51)
#define L_xxxxxxz            L(1:2,51)
#define M_xxxxxyy            M(1:2,52)
#define L_xxxxxyy            L(1:2,52)
#define M_xxxxxyz            M(1:2,53)
#define L_xxxxxyz            L(1:2,53)
#define M_xxxxyyy            M(1:2,54)
#define L_xxxxyyy            L(1:2,54)
#define L_xxxxyyz            L(1:2,55)
#define M_xxxxyyz            M(1:2,55)
#define M_xxxyyyy            M(1:2,56)
#define L_xxxyyyy            L(1:2,56)
#define M_xxxyyyz            M(1:2,57)
#define L_xxxyyyz            L(1:2,57)
#define L_xxyyyyy            L(1:2,58)
#define M_xxyyyyy            M(1:2,58)
#define M_xxyyyyz            M(1:2,59)
#define L_xxyyyyz            L(1:2,59)
#define M_xyyyyyy            M(1:2,60)
#define L_xyyyyyy            L(1:2,60)
#define M_xyyyyyz            M(1:2,61)
#define L_xyyyyyz            L(1:2,61)
#define M_yyyyyyy            M(1:2,62)
#define L_yyyyyyy            L(1:2,62)
#define L_yyyyyyz            L(1:2,63)
#define M_yyyyyyz            M(1:2,63)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v323      = y*z
    v324      = 945.0d0*x
    v316      = 15.0d0*v323
    v320      = v323
    v61       = v324
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
    v218      = 0.00138888888888889d0*M_xxxxxx
    v219      = 0.00833333333333333d0*M_xxxxxy
    v220      = 0.00833333333333333d0*M_xxxxxz
    v221      = 0.0208333333333333d0*M_xxxxyy
    v222      = 0.0416666666666667d0*M_xxxxyz
    v224      = 0.0277777777777778d0*M_xxxyyy
    v225      = 0.0833333333333333d0*M_xxxyyz
    v228      = 0.0208333333333333d0*M_xxyyyy
    v229      = 0.0833333333333333d0*M_xxyyyz
    v261      = 0.5d0*M_yy
    v263      = 0.166666666666667d0*M_yyy
    v264      = 0.5d0*M_yyz
    v268      = 0.0416666666666667d0*M_yyyy
    v269      = 0.166666666666667d0*M_yyyz
    v276      = 0.00833333333333333d0*M_yyyyy
    v277      = 0.0416666666666667d0*M_yyyyz
    v287      = 0.00138888888888889d0*M_yyyyyy
    v288      = 0.00833333333333333d0*M_yyyyyz
    M_zz      = -(M_xx + M_yy)
    v301      = 0.5d0*M_zz
    M_xzz     = -(M_xxx + M_xyy)
    M_yzz     = -(M_xxy + M_yyy)
    M_zzz     = -(M_xxz + M_yyz)
    v302      = 0.166666666666667d0*M_zzz
    M_xxzz    = -(M_xxxx + M_xxyy)
    v117      = 0.25d0*M_xxzz
    M_xyzz    = -(M_xxxy + M_xyyy)
    M_xzzz    = -(M_xxxz + M_xyyz)
    M_yyzz    = -(M_xxyy + M_yyyy)
    v270      = 0.25d0*M_yyzz
    M_yzzz    = -(M_xxyz + M_yyyz)
    M_zzzz    = -(M_xxzz + M_yyzz)
    v303      = 0.0416666666666667d0*M_zzzz
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
    v278      = 0.0833333333333333d0*M_yyyzz
    M_yyzzz   = -(M_xxyyz + M_yyyyz)
    v279      = 0.0833333333333333d0*M_yyzzz
    M_yzzzz   = -(M_xxyzz + M_yyyzz)
    M_zzzzz   = -(M_xxzzz + M_yyzzz)
    v304      = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz  = -(M_xxxxxx + M_xxxxyy)
    v223      = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz  = -(M_xxxxxy + M_xxxyyy)
    v226      = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz  = -(M_xxxxxz + M_xxxyyz)
    v227      = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz  = -(M_xxxxyy + M_xxyyyy)
    v230      = 0.125d0*M_xxyyzz
    M_xxyzzz  = -(M_xxxxyz + M_xxyyyz)
    v231      = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz  = -(M_xxxxzz + M_xxyyzz)
    v232      = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz  = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz  = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz  = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz  = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz  = -(M_xxyyyy + M_yyyyyy)
    v289      = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz  = -(M_xxyyyz + M_yyyyyz)
    v290      = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz  = -(M_xxyyzz + M_yyyyzz)
    v291      = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz  = -(M_xxyzzz + M_yyyzzz)
    M_zzzzzz  = -(M_xxzzzz + M_yyzzzz)
    v305      = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz = -(M_xxxxxxx + M_xxxxxyy)
    M_xxxxyzz = -(M_xxxxxxy + M_xxxxyyy)
    M_xxxxzzz = -(M_xxxxxxz + M_xxxxyyz)
    M_xxxyyzz = -(M_xxxxxyy + M_xxxyyyy)
    M_xxxyzzz = -(M_xxxxxyz + M_xxxyyyz)
    M_xxxzzzz = -(M_xxxxxzz + M_xxxyyzz)
    M_xxyyyzz = -(M_xxxxyyy + M_xxyyyyy)
    M_xxyyzzz = -(M_xxxxyyz + M_xxyyyyz)
    M_xxyzzzz = -(M_xxxxyzz + M_xxyyyzz)
    M_xxzzzzz = -(M_xxxxzzz + M_xxyyzzz)
    M_xyyyyzz = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz = -(M_xxyyyyy + M_yyyyyyy)
    M_yyyyzzz = -(M_xxyyyyz + M_yyyyyyz)
    M_yyyzzzz = -(M_xxyyyzz + M_yyyyyzz)
    M_yyzzzzz = -(M_xxyyzzz + M_yyyyzzz)
    M_yzzzzzz = -(M_xxyzzzz + M_yyyzzzz)
    M_zzzzzzz = -(M_xxzzzzz + M_yyzzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v306      = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v306
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
    v307      = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v307
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
    v308      = 3.0d0*h
    v309      = h*v0
    v310      = h*v1
    v311      = h*v19
    v312      = h*v31
    v4        = -h
    v12       = v308
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v309
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v310
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v309
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 - 945.0d0*v31 + 630.0d0*v310
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v311
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v309
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v312
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v86       = -18.0d0*v51 + v46 + v79
    v87       = 66.0d0*v57
    v322      = -v87
    v88       = 9.0d0*v17
    v89       = 198.0d0*v57
    v101      = h*v67
    v102      = -18.0d0*v65 + v101 + v46
    v179      = v178 + v47 - 135.0d0*v65 + 495.0d0*v70
    u2        = 1.0/h
    u         = sqrt(u2)
    D_0       = u
    u3        = u*u2
    v2        = u3
    D_x       = -v2*x
    D_y       = -v2*y
    D_z       = -v2*z
    u4        = u2*u2
    u5        = u2*u3
    v3        = u5
    v313      = 3.0d0*v3
    v6        = v313*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v313*v320
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v314      = 3.0d0*v8
    v9        = v8*x
    v11       = v314*(h - v10)
    D_xxx     = -3.0d0*v9*(v306 - v308)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    v233      = 0.5d0*D_xyy
    D_xyz     = -v316*v9
    D_xzz     = -(D_xxx + D_xyy)
    v248      = 0.5d0*D_xzz
    D_yyy     = v314*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    v292      = 0.5d0*D_yzz
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v315      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v315*y
    v26       = v315*z
    v28       = v15*v316
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v159      = 0.5d0*D_xxyy
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    v169      = 0.5d0*D_xxzz
    D_xyyy    = v22*v30
    v199      = 0.5d0*D_xyyy
    v234      = 0.166666666666667d0*D_xyyy
    D_xyyz    = v26*(v29 + v4)
    v244      = 0.5d0*D_xyyz
    D_xyzz    = -(D_xxxy + D_xyyy)
    v209      = 0.5d0*D_xyzz
    D_xzzz    = -(D_xxxz + D_xyyz)
    v249      = 0.166666666666667d0*D_xzzz
    v257      = 0.5d0*D_xzzz
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    v280      = 0.5d0*D_yyzz
    D_yzzz    = -(D_xxyz + D_yyyz)
    v293      = 0.166666666666667d0*D_yzzz
    v297      = 0.5d0*D_yzzz
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v317      = 15.0d0*v34
    v318      = v34*z
    v35       = v317*x
    v39       = v318
    v41       = 315.0d0*v318*x*y
    v42       = v317*y
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
    D_xxyyz   = v39*(v36 - 945.0d0*v307 + 105.0d0*(v309 + v310))
    v166      = 0.5d0*D_xxyyz
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    v144      = 0.5d0*D_xxyzz
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    v170      = 0.166666666666667d0*D_xxzzz
    v175      = 0.5d0*D_xxzzz
    D_xyyyy   = v34*v43*x
    v188      = 0.5d0*D_xyyyy
    v200      = 0.166666666666667d0*D_xyyyy
    v235      = 0.0416666666666667d0*D_xyyyy
    D_xyyyz   = v41*(h - v7)
    v206      = 0.5d0*D_xyyyz
    v241      = 0.166666666666667d0*D_xyyyz
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    v194      = 0.5d0*D_xyyzz
    v245      = 0.25d0*D_xyyzz
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
    v210      = 0.166666666666667d0*D_xyzzz
    v215      = 0.5d0*D_xyzzz
    D_xzzzz   = -(D_xxxzz + D_xyyzz)
    v250      = 0.0416666666666667d0*D_xzzzz
    v258      = 0.166666666666667d0*D_xzzzz
    D_yyyyy   = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz   = v39*v43
    D_yyyzz   = -(D_xxyyy + D_yyyyy)
    v271      = 0.5d0*D_yyyzz
    D_yyzzz   = -(D_xxyyz + D_yyyyz)
    v281      = 0.166666666666667d0*D_yyzzz
    v284      = 0.5d0*D_yyzzz
    D_yzzzz   = -(D_xxyzz + D_yyyzz)
    v294      = 0.0416666666666667d0*D_yzzzz
    v298      = 0.166666666666667d0*D_yzzzz
    D_zzzzz   = -(D_xxzzz + D_yyzzz)
    u12       = u6*u6
    u13       = u6*u7
    v44       = u13
    v325      = 315.0d0*v44
    v319      = v325*x
    v45       = 45.0d0*v44
    v52       = v319*y
    v56       = v319*z
    v60       = v320*v325
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy  = v52*v55
    D_xxxxxz  = v55*v56
    D_xxxxyy  = v45*(v58 + v17*v29 - 21.0d0*v311 + 14.0d0*v51 + 231.0d0*v59)
    v95       = 0.5d0*D_xxxxyy
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    v98       = 0.5d0*D_xxxxzz
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    v106      = 0.5d0*D_xxxyyy
    v119      = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    v122      = 0.5d0*D_xxxyyz
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    v109      = 0.5d0*D_xxxyzz
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    v125      = 0.166666666666667d0*D_xxxzzz
    v127      = 0.5d0*D_xxxzzz
    D_xxyyyy  = v45*(v58 + v17*v24 - 21.0d0*v312 + 14.0d0*v65 + 231.0d0*v66)
    v132      = 0.5d0*D_xxyyyy
    v139      = 0.166666666666667d0*D_xxyyyy
    v161      = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    v142      = 0.5d0*D_xxyyyz
    v164      = 0.166666666666667d0*D_xxyyyz
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
    v182      = 0.5d0*D_xyyyyy
    v189      = 0.166666666666667d0*D_xyyyyy
    v201      = 0.0416666666666667d0*D_xyyyyy
    v236      = 0.00833333333333333d0*D_xyyyyy
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    v192      = 0.5d0*D_xyyyyz
    v204      = 0.166666666666667d0*D_xyyyyz
    v239      = 0.0416666666666667d0*D_xyyyyz
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    v185      = 0.5d0*D_xyyyzz
    v207      = 0.25d0*D_xyyyzz
    v242      = 0.0833333333333333d0*D_xyyyzz
    v254      = 0.166666666666667d0*D_xyyyzz
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    v195      = 0.166666666666667d0*D_xyyzzz
    v197      = 0.5d0*D_xyyzzz
    v246      = 0.0833333333333333d0*D_xyyzzz
    v255      = 0.25d0*D_xyyzzz
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    v211      = 0.0416666666666667d0*D_xyzzzz
    v216      = 0.166666666666667d0*D_xyzzzz
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    v251      = 0.00833333333333333d0*D_xzzzzz
    v259      = 0.0416666666666667d0*D_xzzzzz
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    D_yyyyyz  = v60*v68
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    v265      = 0.5d0*D_yyyyzz
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    v272      = 0.166666666666667d0*D_yyyzzz
    v274      = 0.5d0*D_yyyzzz
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    v282      = 0.0416666666666667d0*D_yyzzzz
    v285      = 0.166666666666667d0*D_yyzzzz
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    v295      = 0.00833333333333333d0*D_yzzzzz
    v299      = 0.0416666666666667d0*D_yzzzzz
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v321      = 315.0d0*v71
    v72       = v321*x
    v75       = v321*y
    v77       = v321*z
    v81       = v320*v324*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = v75*v76
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = v76*v77
    L_xxxxxx  = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    v84       = 0.5d0*D_xxxxxyy
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxy  = D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    v85       = 0.5d0*D_xxxxxzz
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*v83 + D_xxxxxxy*M_xy + D_xxxxxxz* &
      M_xz + D_xxxxxy*M_y + D_xxxxxyz*M_yz + D_xxxxxz*M_z + M_yy*v84 + &
      M_zz*v85
    L_xxxxxz  = D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z
    D_xxxxyyy = -945.0d0*v71*y*(v322 + v1*v18 + v1*v82 - v86)
    v90       = 0.5d0*D_xxxxyyy
    v96       = 0.166666666666667d0*D_xxxxyyy
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = v77*(-v1*v88 + v80 + v86 + v89)
    v97       = 0.5d0*D_xxxxyyz
    L_xxxxyy  = D_xxxxxyy*M_x + D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyz*M_z
    L_xxxxyyz = D_xxxxyyz*M_0
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    v91       = 0.5d0*D_xxxxyzz
    L_xxxxy   = D_xxxxxxy*v83 + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + D_xxxxy &
      *M_0 + D_xxxxyy*M_y + D_xxxxyyz*M_yz + D_xxxxyz*M_z + M_yy*v90 + &
      M_zz*v91
    L_xxxxyz  = D_xxxxxyz*M_x + D_xxxxyyz*M_y + D_xxxxyz*M_0 + D_xxxxyzz*M_z
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    v99       = 0.166666666666667d0*D_xxxxzzz
    v100      = 0.5d0*D_xxxxzzz
    L_xxxx    = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*v83 + D_xxxxxxx*v92 + D_xxxxxxy*v93 &
      + D_xxxxxxz*v94 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyz*M_yz + D_xxxxz*M_z + M_xyy*v84 + M_xzz* &
      v85 + M_yy*v95 + M_yyy*v96 + M_yyz*v97 + M_yzz*v91 + M_zz*v98 + &
      M_zzz*v99
    L_xxxxz   = D_xxxxxxz*v83 + D_xxxxxyz*M_xy + D_xxxxxz*M_x + D_xxxxxzz*M_xz + &
      D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + D_xxxxzz*M_z + M_yy &
      *v97 + M_zz*v100
    D_xxxyyyy = -v61*v71*(v322 + v0*v103 + v0*v18 - v102)
    v104      = 0.5d0*D_xxxyyyy
    v107      = 0.166666666666667d0*D_xxxyyyy
    v120      = 0.0416666666666667d0*D_xxxyyyy
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v88))
    v108      = 0.5d0*D_xxxyyyz
    v121      = 0.166666666666667d0*D_xxxyyyz
    L_xxxyyy  = D_xxxxyyy*M_x + D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyz*M_z
    L_xxxyyyz = D_xxxyyyz*M_0
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    v105      = 0.5d0*D_xxxyyzz
    v123      = 0.25d0*D_xxxyyzz
    L_xxxyy   = D_xxxxxyy*v83 + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + D_xxxyy &
      *M_0 + D_xxxyyy*M_y + D_xxxyyyz*M_yz + D_xxxyyz*M_z + M_yy*v104 + &
      M_zz*v105
    L_xxxyyz  = D_xxxxyyz*M_x + D_xxxyyyz*M_y + D_xxxyyz*M_0 + D_xxxyyzz*M_z
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    v110      = 0.166666666666667d0*D_xxxyzzz
    v111      = 0.5d0*D_xxxyzzz
    L_xxxy    = D_xxxxxxy*v92 + D_xxxxxy*v83 + D_xxxxxyy*v93 + D_xxxxxyz*v94 + D_xxxxy* &
      M_x + D_xxxxyy*M_xy + D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy* &
      M_0 + D_xxxyy*M_y + D_xxxyyz*M_yz + D_xxxyz*M_z + M_xyy*v90 + &
      M_xzz*v91 + M_yy*v106 + M_yyy*v107 + M_yyz*v108 + M_yzz*v105 + &
      M_zz*v109 + M_zzz*v110
    L_xxxyz   = D_xxxxxyz*v83 + D_xxxxyyz*M_xy + D_xxxxyz*M_x + D_xxxxyzz*M_xz + &
      D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + D_xxxyzz*M_z + M_yy &
      *v108 + M_zz*v111
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    v126      = 0.0416666666666667d0*D_xxxzzzz
    v128      = 0.166666666666667d0*D_xxxzzzz
    L_xxx     = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*v83 + D_xxxxxx*v92 + D_xxxxxxx*v112 + &
      D_xxxxxxy*v113 + D_xxxxxxz*v114 + D_xxxxxy*v93 + D_xxxxxyy*v115 + &
      D_xxxxxyz*v116 + D_xxxxxz*v94 + D_xxxxxzz*v117 + D_xxxxy*M_xy + &
      D_xxxxyz*M_xyz + D_xxxxz*M_xz + D_xxxy*M_y + D_xxxyz*M_yz + &
      D_xxxz*M_z + M_xyy*v95 + M_xyyy*v96 + M_xyyz*v97 + M_xyzz*v91 + &
      M_xzz*v98 + M_xzzz*v99 + M_yy*v118 + M_yyy*v119 + M_yyyy*v120 + &
      M_yyyz*v121 + M_yyz*v122 + M_yyzz*v123 + M_yzz*v109 + M_yzzz*v110 &
      + M_zz*v124 + M_zzz*v125 + M_zzzz*v126
    L_xxxz    = D_xxxxxxz*v92 + D_xxxxxyz*v93 + D_xxxxxz*v83 + D_xxxxxzz*v94 + D_xxxxyz* &
      M_xy + D_xxxxyzz*M_xyz + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyz* &
      M_y + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + M_xyy*v97 + &
      M_xzz*v100 + M_yy*v122 + M_yyy*v121 + M_yyz*v105 + M_yzz*v111 + &
      M_zz*v127 + M_zzz*v128
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
    L_xxyyyy  = D_xxxyyyy*M_x + D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyz*M_z
    L_xxyyyyz = D_xxyyyyz*M_0
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    v131      = 0.5d0*D_xxyyyzz
    v143      = 0.25d0*D_xxyyyzz
    v165      = 0.0833333333333333d0*D_xxyyyzz
    v173      = 0.166666666666667d0*D_xxyyyzz
    L_xxyyy   = D_xxxxyyy*v83 + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + D_xxyyy &
      *M_0 + D_xxyyyy*M_y + D_xxyyyyz*M_yz + D_xxyyyz*M_z + M_yy*v130 + &
      M_zz*v131
    L_xxyyyz  = D_xxxyyyz*M_x + D_xxyyyyz*M_y + D_xxyyyz*M_0 + D_xxyyyzz*M_z
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    v136      = 0.166666666666667d0*D_xxyyzzz
    v137      = 0.5d0*D_xxyyzzz
    v168      = 0.0833333333333333d0*D_xxyyzzz
    v174      = 0.25d0*D_xxyyzzz
    L_xxyy    = D_xxxxxyy*v92 + D_xxxxyy*v83 + D_xxxxyyy*v93 + D_xxxxyyz*v94 + D_xxxyy* &
      M_x + D_xxxyyy*M_xy + D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy* &
      M_0 + D_xxyyy*M_y + D_xxyyyz*M_yz + D_xxyyz*M_z + M_xyy*v104 + &
      M_xzz*v105 + M_yy*v132 + M_yyy*v133 + M_yyz*v134 + M_yzz*v131 + &
      M_zz*v135 + M_zzz*v136
    L_xxyyz   = D_xxxxyyz*v83 + D_xxxyyyz*M_xy + D_xxxyyz*M_x + D_xxxyyzz*M_xz + &
      D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + D_xxyyzz*M_z + M_yy &
      *v134 + M_zz*v137
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    v146      = 0.0416666666666667d0*D_xxyzzzz
    v148      = 0.166666666666667d0*D_xxyzzzz
    L_xxy     = D_xxxxxxy*v112 + D_xxxxxy*v92 + D_xxxxxyy*v113 + D_xxxxxyz*v114 + &
      D_xxxxy*v83 + D_xxxxyy*v93 + D_xxxxyyy*v115 + D_xxxxyyz*v116 + &
      D_xxxxyz*v94 + D_xxxxyzz*v117 + D_xxxy*M_x + D_xxxyy*M_xy + &
      D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyz* &
      M_yz + D_xxyz*M_z + M_xyy*v106 + M_xyyy*v107 + M_xyyz*v108 + &
      M_xyzz*v105 + M_xzz*v109 + M_xzzz*v110 + M_yy*v138 + M_yyy*v139 + &
      M_yyyy*v140 + M_yyyz*v141 + M_yyz*v142 + M_yyzz*v143 + M_yzz*v135 &
      + M_yzzz*v136 + M_zz*v144 + M_zzz*v145 + M_zzzz*v146
    L_xxyz    = D_xxxxxyz*v92 + D_xxxxyyz*v93 + D_xxxxyz*v83 + D_xxxxyzz*v94 + D_xxxyyz* &
      M_xy + D_xxxyyzz*M_xyz + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyz* &
      M_y + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + M_xyy*v108 + &
      M_xzz*v111 + M_yy*v142 + M_yyy*v141 + M_yyz*v131 + M_yzz*v137 + &
      M_zz*v147 + M_zzz*v148
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    v172      = 0.00833333333333333d0*D_xxzzzzz
    v177      = 0.0416666666666667d0*D_xxzzzzz
    L_xx      = D_xx*M_0 + D_xxx*M_x + D_xxxx*v83 + D_xxxxx*v92 + D_xxxxxx*v112 + &
      D_xxxxxxx*v149 + D_xxxxxxy*v150 + D_xxxxxxz*v151 + D_xxxxxy*v113 &
      + D_xxxxxyy*v152 + D_xxxxxyz*v153 + D_xxxxxz*v114 + D_xxxxxzz* &
      v154 + D_xxxxy*v93 + D_xxxxyy*v115 + D_xxxxyyy*v155 + D_xxxxyyz* &
      v156 + D_xxxxyz*v116 + D_xxxxyzz*v157 + D_xxxxz*v94 + D_xxxxzz* &
      v117 + D_xxxxzzz*v158 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz &
      + D_xxy*M_y + D_xxyz*M_yz + D_xxz*M_z + M_xyy*v118 + M_xyyy*v119 &
      + M_xyyyy*v120 + M_xyyyz*v121 + M_xyyz*v122 + M_xyyzz*v123 + &
      M_xyzz*v109 + M_xyzzz*v110 + M_xzz*v124 + M_xzzz*v125 + M_xzzzz* &
      v126 + M_yy*v159 + M_yyy*v160 + M_yyyy*v161 + M_yyyyy*v162 + &
      M_yyyyz*v163 + M_yyyz*v164 + M_yyyzz*v165 + M_yyz*v166 + M_yyzz* &
      v167 + M_yyzzz*v168 + M_yzz*v144 + M_yzzz*v145 + M_yzzzz*v146 + &
      M_zz*v169 + M_zzz*v170 + M_zzzz*v171 + M_zzzzz*v172
    L_xxz     = D_xxxxxxz*v112 + D_xxxxxyz*v113 + D_xxxxxz*v92 + D_xxxxxzz*v114 + &
      D_xxxxyyz*v115 + D_xxxxyz*v93 + D_xxxxyzz*v116 + D_xxxxz*v83 + &
      D_xxxxzz*v94 + D_xxxxzzz*v117 + D_xxxyz*M_xy + D_xxxyzz*M_xyz + &
      D_xxxz*M_x + D_xxxzz*M_xz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxz*M_0 &
      + D_xxzz*M_z + M_xyy*v122 + M_xyyy*v121 + M_xyyz*v105 + M_xyzz* &
      v111 + M_xzz*v127 + M_xzzz*v128 + M_yy*v166 + M_yyy*v164 + M_yyyy &
      *v163 + M_yyyz*v173 + M_yyz*v135 + M_yyzz*v174 + M_yzz*v147 + &
      M_yzzz*v148 + M_zz*v175 + M_zzz*v176 + M_zzzz*v177
    D_xyyyyyy = v179*v72
    v180      = 0.5d0*D_xyyyyyy
    v183      = 0.166666666666667d0*D_xyyyyyy
    v190      = 0.0416666666666667d0*D_xyyyyyy
    v202      = 0.00833333333333333d0*D_xyyyyyy
    v237      = 0.00138888888888889d0*D_xyyyyyy
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = v81*(v36 - v103 + 110.0d0*v32)
    v184      = 0.5d0*D_xyyyyyz
    v191      = 0.166666666666667d0*D_xyyyyyz
    v203      = 0.0416666666666667d0*D_xyyyyyz
    v238      = 0.00833333333333333d0*D_xyyyyyz
    L_xyyyyy  = D_xxyyyyy*M_x + D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyz*M_z
    L_xyyyyyz = D_xyyyyyz*M_0
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    v181      = 0.5d0*D_xyyyyzz
    v193      = 0.25d0*D_xyyyyzz
    v205      = 0.0833333333333333d0*D_xyyyyzz
    v213      = 0.166666666666667d0*D_xyyyyzz
    v240      = 0.0208333333333333d0*D_xyyyyzz
    v253      = 0.0416666666666667d0*D_xyyyyzz
    L_xyyyy   = D_xxxyyyy*v83 + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + D_xyyyy &
      *M_0 + D_xyyyyy*M_y + D_xyyyyyz*M_yz + D_xyyyyz*M_z + M_yy*v180 + &
      M_zz*v181
    L_xyyyyz  = D_xxyyyyz*M_x + D_xyyyyyz*M_y + D_xyyyyz*M_0 + D_xyyyyzz*M_z
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    v186      = 0.166666666666667d0*D_xyyyzzz
    v187      = 0.5d0*D_xyyyzzz
    v208      = 0.0833333333333333d0*D_xyyyzzz
    v214      = 0.25d0*D_xyyyzzz
    v243      = 0.0277777777777778d0*D_xyyyzzz
    L_xyyy    = D_xxxxyyy*v92 + D_xxxyyy*v83 + D_xxxyyyy*v93 + D_xxxyyyz*v94 + D_xxyyy* &
      M_x + D_xxyyyy*M_xy + D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy* &
      M_0 + D_xyyyy*M_y + D_xyyyyz*M_yz + D_xyyyz*M_z + M_xyy*v130 + &
      M_xzz*v131 + M_yy*v182 + M_yyy*v183 + M_yyz*v184 + M_yzz*v181 + &
      M_zz*v185 + M_zzz*v186
    L_xyyyz   = D_xxxyyyz*v83 + D_xxyyyyz*M_xy + D_xxyyyz*M_x + D_xxyyyzz*M_xz + &
      D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + D_xyyyzz*M_z + M_yy &
      *v184 + M_zz*v187
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    v196      = 0.0416666666666667d0*D_xyyzzzz
    v198      = 0.166666666666667d0*D_xyyzzzz
    v247      = 0.0208333333333333d0*D_xyyzzzz
    v256      = 0.0833333333333333d0*D_xyyzzzz
    L_xyy     = D_xxxxxyy*v112 + D_xxxxyy*v92 + D_xxxxyyy*v113 + D_xxxxyyz*v114 + &
      D_xxxyy*v83 + D_xxxyyy*v93 + D_xxxyyyy*v115 + D_xxxyyyz*v116 + &
      D_xxxyyz*v94 + D_xxxyyzz*v117 + D_xxyy*M_x + D_xxyyy*M_xy + &
      D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyz* &
      M_yz + D_xyyz*M_z + M_xyy*v132 + M_xyyy*v133 + M_xyyz*v134 + &
      M_xyzz*v131 + M_xzz*v135 + M_xzzz*v136 + M_yy*v188 + M_yyy*v189 + &
      M_yyyy*v190 + M_yyyz*v191 + M_yyz*v192 + M_yyzz*v193 + M_yzz*v185 &
      + M_yzzz*v186 + M_zz*v194 + M_zzz*v195 + M_zzzz*v196
    L_xyyz    = D_xxxxyyz*v92 + D_xxxyyyz*v93 + D_xxxyyz*v83 + D_xxxyyzz*v94 + D_xxyyyz* &
      M_xy + D_xxyyyzz*M_xyz + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyz* &
      M_y + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + M_xyy*v134 + &
      M_xzz*v137 + M_yy*v192 + M_yyy*v191 + M_yyz*v181 + M_yzz*v187 + &
      M_zz*v197 + M_zzz*v198
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    v212      = 0.00833333333333333d0*D_xyzzzzz
    v217      = 0.0416666666666667d0*D_xyzzzzz
    L_xy      = D_xxxxxxy*v149 + D_xxxxxy*v112 + D_xxxxxyy*v150 + D_xxxxxyz*v151 + &
      D_xxxxy*v92 + D_xxxxyy*v113 + D_xxxxyyy*v152 + D_xxxxyyz*v153 + &
      D_xxxxyz*v114 + D_xxxxyzz*v154 + D_xxxy*v83 + D_xxxyy*v93 + &
      D_xxxyyy*v115 + D_xxxyyyy*v155 + D_xxxyyyz*v156 + D_xxxyyz*v116 + &
      D_xxxyyzz*v157 + D_xxxyz*v94 + D_xxxyzz*v117 + D_xxxyzzz*v158 + &
      D_xxy*M_x + D_xxyy*M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 &
      + D_xyy*M_y + D_xyyz*M_yz + D_xyz*M_z + M_xyy*v138 + M_xyyy*v139 &
      + M_xyyyy*v140 + M_xyyyz*v141 + M_xyyz*v142 + M_xyyzz*v143 + &
      M_xyzz*v135 + M_xyzzz*v136 + M_xzz*v144 + M_xzzz*v145 + M_xzzzz* &
      v146 + M_yy*v199 + M_yyy*v200 + M_yyyy*v201 + M_yyyyy*v202 + &
      M_yyyyz*v203 + M_yyyz*v204 + M_yyyzz*v205 + M_yyz*v206 + M_yyzz* &
      v207 + M_yyzzz*v208 + M_yzz*v194 + M_yzzz*v195 + M_yzzzz*v196 + &
      M_zz*v209 + M_zzz*v210 + M_zzzz*v211 + M_zzzzz*v212
    L_xyz     = D_xxxxxyz*v112 + D_xxxxyyz*v113 + D_xxxxyz*v92 + D_xxxxyzz*v114 + &
      D_xxxyyyz*v115 + D_xxxyyz*v93 + D_xxxyyzz*v116 + D_xxxyz*v83 + &
      D_xxxyzz*v94 + D_xxxyzzz*v117 + D_xxyyz*M_xy + D_xxyyzz*M_xyz + &
      D_xxyz*M_x + D_xxyzz*M_xz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyz*M_0 &
      + D_xyzz*M_z + M_xyy*v142 + M_xyyy*v141 + M_xyyz*v131 + M_xyzz* &
      v137 + M_xzz*v147 + M_xzzz*v148 + M_yy*v206 + M_yyy*v204 + M_yyyy &
      *v203 + M_yyyz*v213 + M_yyz*v185 + M_yyzz*v214 + M_yzz*v197 + &
      M_yzzz*v198 + M_zz*v215 + M_zzz*v216 + M_zzzz*v217
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    v252      = 0.00138888888888889d0*D_xzzzzzz
    v260      = 0.00833333333333333d0*D_xzzzzzz
    L_x       = D_x*M_0 + D_xx*M_x + D_xxx*v83 + D_xxxx*v92 + D_xxxxx*v112 + D_xxxxxx* &
      v149 + D_xxxxxxx*v218 + D_xxxxxxy*v219 + D_xxxxxxz*v220 + &
      D_xxxxxy*v150 + D_xxxxxyy*v221 + D_xxxxxyz*v222 + D_xxxxxz*v151 + &
      D_xxxxxzz*v223 + D_xxxxy*v113 + D_xxxxyy*v152 + D_xxxxyyy*v224 + &
      D_xxxxyyz*v225 + D_xxxxyz*v153 + D_xxxxyzz*v226 + D_xxxxz*v114 + &
      D_xxxxzz*v154 + D_xxxxzzz*v227 + D_xxxy*v93 + D_xxxyy*v115 + &
      D_xxxyyy*v155 + D_xxxyyyy*v228 + D_xxxyyyz*v229 + D_xxxyyz*v156 + &
      D_xxxyyzz*v230 + D_xxxyz*v116 + D_xxxyzz*v157 + D_xxxyzzz*v231 + &
      D_xxxz*v94 + D_xxxzz*v117 + D_xxxzzz*v158 + D_xxxzzzz*v232 + &
      D_xxy*M_xy + D_xxyz*M_xyz + D_xxz*M_xz + D_xy*M_y + D_xyz*M_yz + &
      D_xz*M_z + M_xyy*v159 + M_xyyy*v160 + M_xyyyy*v161 + M_xyyyyy* &
      v162 + M_xyyyyz*v163 + M_xyyyz*v164 + M_xyyyzz*v165 + M_xyyz*v166 &
      + M_xyyzz*v167 + M_xyyzzz*v168 + M_xyzz*v144 + M_xyzzz*v145 + &
      M_xyzzzz*v146 + M_xzz*v169 + M_xzzz*v170 + M_xzzzz*v171 + &
      M_xzzzzz*v172 + M_yy*v233 + M_yyy*v234 + M_yyyy*v235 + M_yyyyy* &
      v236 + M_yyyyyy*v237 + M_yyyyyz*v238 + M_yyyyz*v239 + M_yyyyzz* &
      v240 + M_yyyz*v241 + M_yyyzz*v242 + M_yyyzzz*v243 + M_yyz*v244 + &
      M_yyzz*v245 + M_yyzzz*v246 + M_yyzzzz*v247 + M_yzz*v209 + M_yzzz* &
      v210 + M_yzzzz*v211 + M_yzzzzz*v212 + M_zz*v248 + M_zzz*v249 + &
      M_zzzz*v250 + M_zzzzz*v251 + M_zzzzzz*v252
    L_xz      = D_xxxxxxz*v149 + D_xxxxxyz*v150 + D_xxxxxz*v112 + D_xxxxxzz*v151 + &
      D_xxxxyyz*v152 + D_xxxxyz*v113 + D_xxxxyzz*v153 + D_xxxxz*v92 + &
      D_xxxxzz*v114 + D_xxxxzzz*v154 + D_xxxyyyz*v155 + D_xxxyyz*v115 + &
      D_xxxyyzz*v156 + D_xxxyz*v93 + D_xxxyzz*v116 + D_xxxyzzz*v157 + &
      D_xxxz*v83 + D_xxxzz*v94 + D_xxxzzz*v117 + D_xxxzzzz*v158 + &
      D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxz*M_x + D_xxzz*M_xz + D_xyz*M_y &
      + D_xyzz*M_yz + D_xz*M_0 + D_xzz*M_z + M_xyy*v166 + M_xyyy*v164 + &
      M_xyyyy*v163 + M_xyyyz*v173 + M_xyyz*v135 + M_xyyzz*v174 + M_xyzz &
      *v147 + M_xyzzz*v148 + M_xzz*v175 + M_xzzz*v176 + M_xzzzz*v177 + &
      M_yy*v244 + M_yyy*v241 + M_yyyy*v239 + M_yyyyy*v238 + M_yyyyz* &
      v253 + M_yyyz*v254 + M_yyyzz*v208 + M_yyz*v194 + M_yyzz*v255 + &
      M_yyzzz*v256 + M_yzz*v215 + M_yzzz*v216 + M_yzzzz*v217 + M_zz* &
      v257 + M_zzz*v258 + M_zzzz*v259 + M_zzzzz*v260
    D_yyyyyyy = v75*(v178 + v73 - 315.0d0*v65 + 693.0d0*v70)
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = v179*v77
    L_yyyyyy  = D_xyyyyyy*M_x + D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyz*M_z
    L_yyyyyyz = D_yyyyyyz*M_0
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    v262      = 0.5d0*D_yyyyyzz
    L_yyyyy   = D_xxyyyyy*v83 + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + D_yyyyy &
      *M_0 + D_yyyyyy*M_y + D_yyyyyyy*v261 + D_yyyyyyz*M_yz + D_yyyyyz* &
      M_z + M_zz*v262
    L_yyyyyz  = D_xyyyyyz*M_x + D_yyyyyyz*M_y + D_yyyyyz*M_0 + D_yyyyyzz*M_z
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    v266      = 0.166666666666667d0*D_yyyyzzz
    v267      = 0.5d0*D_yyyyzzz
    L_yyyy    = D_xxxyyyy*v92 + D_xxyyyy*v83 + D_xxyyyyy*v93 + D_xxyyyyz*v94 + D_xyyyy* &
      M_x + D_xyyyyy*M_xy + D_xyyyyyz*M_xyz + D_xyyyyz*M_xz + D_yyyy* &
      M_0 + D_yyyyy*M_y + D_yyyyyy*v261 + D_yyyyyyy*v263 + D_yyyyyyz* &
      v264 + D_yyyyyz*M_yz + D_yyyyz*M_z + M_xyy*v180 + M_xzz*v181 + &
      M_yzz*v262 + M_zz*v265 + M_zzz*v266
    L_yyyyz   = D_xxyyyyz*v83 + D_xyyyyyz*M_xy + D_xyyyyz*M_x + D_xyyyyzz*M_xz + &
      D_yyyyyyz*v261 + D_yyyyyz*M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + &
      D_yyyyzz*M_z + M_zz*v267
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    v273      = 0.0416666666666667d0*D_yyyzzzz
    v275      = 0.166666666666667d0*D_yyyzzzz
    L_yyy     = D_xxxxyyy*v112 + D_xxxyyy*v92 + D_xxxyyyy*v113 + D_xxxyyyz*v114 + &
      D_xxyyy*v83 + D_xxyyyy*v93 + D_xxyyyyy*v115 + D_xxyyyyz*v116 + &
      D_xxyyyz*v94 + D_xxyyyzz*v117 + D_xyyy*M_x + D_xyyyy*M_xy + &
      D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy* &
      v261 + D_yyyyyy*v263 + D_yyyyyyy*v268 + D_yyyyyyz*v269 + D_yyyyyz &
      *v264 + D_yyyyyzz*v270 + D_yyyyz*M_yz + D_yyyz*M_z + M_xyy*v182 + &
      M_xyyy*v183 + M_xyyz*v184 + M_xyzz*v181 + M_xzz*v185 + M_xzzz* &
      v186 + M_yzz*v265 + M_yzzz*v266 + M_zz*v271 + M_zzz*v272 + M_zzzz &
      *v273
    L_yyyz    = D_xxxyyyz*v92 + D_xxyyyyz*v93 + D_xxyyyz*v83 + D_xxyyyzz*v94 + D_xyyyyz* &
      M_xy + D_xyyyyzz*M_xyz + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyyz* &
      v263 + D_yyyyyz*v261 + D_yyyyyzz*v264 + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyz*M_0 + D_yyyzz*M_z + M_xyy*v184 + M_xzz*v187 + M_yzz &
      *v267 + M_zz*v274 + M_zzz*v275
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    v283      = 0.00833333333333333d0*D_yyzzzzz
    v286      = 0.0416666666666667d0*D_yyzzzzz
    L_yy      = D_xxxxxyy*v149 + D_xxxxyy*v112 + D_xxxxyyy*v150 + D_xxxxyyz*v151 + &
      D_xxxyy*v92 + D_xxxyyy*v113 + D_xxxyyyy*v152 + D_xxxyyyz*v153 + &
      D_xxxyyz*v114 + D_xxxyyzz*v154 + D_xxyy*v83 + D_xxyyy*v93 + &
      D_xxyyyy*v115 + D_xxyyyyy*v155 + D_xxyyyyz*v156 + D_xxyyyz*v116 + &
      D_xxyyyzz*v157 + D_xxyyz*v94 + D_xxyyzz*v117 + D_xxyyzzz*v158 + &
      D_xyy*M_x + D_xyyy*M_xy + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 &
      + D_yyy*M_y + D_yyyy*v261 + D_yyyyy*v263 + D_yyyyyy*v268 + &
      D_yyyyyyy*v276 + D_yyyyyyz*v277 + D_yyyyyz*v269 + D_yyyyyzz*v278 &
      + D_yyyyz*v264 + D_yyyyzz*v270 + D_yyyyzzz*v279 + D_yyyz*M_yz + &
      D_yyz*M_z + M_xyy*v188 + M_xyyy*v189 + M_xyyyy*v190 + M_xyyyz* &
      v191 + M_xyyz*v192 + M_xyyzz*v193 + M_xyzz*v185 + M_xyzzz*v186 + &
      M_xzz*v194 + M_xzzz*v195 + M_xzzzz*v196 + M_yzz*v271 + M_yzzz* &
      v272 + M_yzzzz*v273 + M_zz*v280 + M_zzz*v281 + M_zzzz*v282 + &
      M_zzzzz*v283
    L_yyz     = D_xxxxyyz*v112 + D_xxxyyyz*v113 + D_xxxyyz*v92 + D_xxxyyzz*v114 + &
      D_xxyyyyz*v115 + D_xxyyyz*v93 + D_xxyyyzz*v116 + D_xxyyz*v83 + &
      D_xxyyzz*v94 + D_xxyyzzz*v117 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + &
      D_xyyz*M_x + D_xyyzz*M_xz + D_yyyyyyz*v268 + D_yyyyyz*v263 + &
      D_yyyyyzz*v269 + D_yyyyz*v261 + D_yyyyzz*v264 + D_yyyyzzz*v270 + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyz*M_0 + D_yyzz*M_z + M_xyy*v192 + &
      M_xyyy*v191 + M_xyyz*v181 + M_xyzz*v187 + M_xzz*v197 + M_xzzz* &
      v198 + M_yzz*v274 + M_yzzz*v275 + M_zz*v284 + M_zzz*v285 + M_zzzz &
      *v286
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    v296      = 0.00138888888888889d0*D_yzzzzzz
    v300      = 0.00833333333333333d0*D_yzzzzzz
    L_y       = D_xxxxxxy*v218 + D_xxxxxy*v149 + D_xxxxxyy*v219 + D_xxxxxyz*v220 + &
      D_xxxxy*v112 + D_xxxxyy*v150 + D_xxxxyyy*v221 + D_xxxxyyz*v222 + &
      D_xxxxyz*v151 + D_xxxxyzz*v223 + D_xxxy*v92 + D_xxxyy*v113 + &
      D_xxxyyy*v152 + D_xxxyyyy*v224 + D_xxxyyyz*v225 + D_xxxyyz*v153 + &
      D_xxxyyzz*v226 + D_xxxyz*v114 + D_xxxyzz*v154 + D_xxxyzzz*v227 + &
      D_xxy*v83 + D_xxyy*v93 + D_xxyyy*v115 + D_xxyyyy*v155 + D_xxyyyyy &
      *v228 + D_xxyyyyz*v229 + D_xxyyyz*v156 + D_xxyyyzz*v230 + D_xxyyz &
      *v116 + D_xxyyzz*v157 + D_xxyyzzz*v231 + D_xxyz*v94 + D_xxyzz* &
      v117 + D_xxyzzz*v158 + D_xxyzzzz*v232 + D_xy*M_x + D_xyy*M_xy + &
      D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yy*M_y + D_yyy*v261 + &
      D_yyyy*v263 + D_yyyyy*v268 + D_yyyyyy*v276 + D_yyyyyyy*v287 + &
      D_yyyyyyz*v288 + D_yyyyyz*v277 + D_yyyyyzz*v289 + D_yyyyz*v269 + &
      D_yyyyzz*v278 + D_yyyyzzz*v290 + D_yyyz*v264 + D_yyyzz*v270 + &
      D_yyyzzz*v279 + D_yyyzzzz*v291 + D_yyz*M_yz + D_yz*M_z + M_xyy* &
      v199 + M_xyyy*v200 + M_xyyyy*v201 + M_xyyyyy*v202 + M_xyyyyz*v203 &
      + M_xyyyz*v204 + M_xyyyzz*v205 + M_xyyz*v206 + M_xyyzz*v207 + &
      M_xyyzzz*v208 + M_xyzz*v194 + M_xyzzz*v195 + M_xyzzzz*v196 + &
      M_xzz*v209 + M_xzzz*v210 + M_xzzzz*v211 + M_xzzzzz*v212 + M_yzz* &
      v280 + M_yzzz*v281 + M_yzzzz*v282 + M_yzzzzz*v283 + M_zz*v292 + &
      M_zzz*v293 + M_zzzz*v294 + M_zzzzz*v295 + M_zzzzzz*v296
    L_yz      = D_xxxxxyz*v149 + D_xxxxyyz*v150 + D_xxxxyz*v112 + D_xxxxyzz*v151 + &
      D_xxxyyyz*v152 + D_xxxyyz*v113 + D_xxxyyzz*v153 + D_xxxyz*v92 + &
      D_xxxyzz*v114 + D_xxxyzzz*v154 + D_xxyyyyz*v155 + D_xxyyyz*v115 + &
      D_xxyyyzz*v156 + D_xxyyz*v93 + D_xxyyzz*v116 + D_xxyyzzz*v157 + &
      D_xxyz*v83 + D_xxyzz*v94 + D_xxyzzz*v117 + D_xxyzzzz*v158 + &
      D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyz*M_x + D_xyzz*M_xz + D_yyyyyyz &
      *v276 + D_yyyyyz*v268 + D_yyyyyzz*v277 + D_yyyyz*v263 + D_yyyyzz* &
      v269 + D_yyyyzzz*v278 + D_yyyz*v261 + D_yyyzz*v264 + D_yyyzzz* &
      v270 + D_yyyzzzz*v279 + D_yyz*M_y + D_yyzz*M_yz + D_yz*M_0 + &
      D_yzz*M_z + M_xyy*v206 + M_xyyy*v204 + M_xyyyy*v203 + M_xyyyz* &
      v213 + M_xyyz*v185 + M_xyyzz*v214 + M_xyzz*v197 + M_xyzzz*v198 + &
      M_xzz*v215 + M_xzzz*v216 + M_xzzzz*v217 + M_yzz*v284 + M_yzzz* &
      v285 + M_yzzzz*v286 + M_zz*v297 + M_zzz*v298 + M_zzzz*v299 + &
      M_zzzzz*v300
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_0       = 0.000198412698412698d0*(D_xxxxxxx*M_xxxxxxx + 42.0d0*D_xxxxxyz*M_xxxxxyz &
      + D_yyyyyyy*M_yyyyyyy + D_zzzzzzz*M_zzzzzzz + 140.0d0*(D_xxxyyyz* &
      M_xxxyyyz + D_xxxyzzz*M_xxxyzzz) + 7.0d0*(D_xxxxxxy*M_xxxxxxy + &
      D_xxxxxxz*M_xxxxxxz + D_yyyyyyz*M_yyyyyyz) + 210.0d0*(D_xxxyyzz* &
      M_xxxyyzz + D_xxyyyzz*M_xxyyyzz + D_xxyyzzz*M_xxyyzzz) + 105.0d0* &
      (D_xxxxyyz*M_xxxxyyz + D_xxxxyzz*M_xxxxyzz + D_xxyyyyz*M_xxyyyyz &
      + D_xxyzzzz*M_xxyzzzz) + 21.0d0*(D_xxxxxyy*M_xxxxxyy + D_xxxxxzz* &
      M_xxxxxzz + D_xxyyyyy*M_xxyyyyy + D_xxzzzzz*M_xxzzzzz + D_yyyyyzz &
      *M_yyyyyzz + D_yyzzzzz*M_yyzzzzz) + 35.0d0*(D_xxxxyyy*M_xxxxyyy + &
      D_xxxxzzz*M_xxxxzzz + D_xxxyyyy*M_xxxyyyy + D_xxxzzzz*M_xxxzzzz + &
      D_yyyyzzz*M_yyyyzzz + D_yyyzzzz*M_yyyzzzz)) + D_0*M_0 + D_x*M_x + &
      D_xx*v83 + D_xxx*v92 + D_xxxx*v112 + D_xxxxx*v149 + D_xxxxxx*v218 &
      + D_xxxxxy*v219 + D_xxxxxz*v220 + D_xxxxy*v150 + D_xxxxyy*v221 + &
      D_xxxxyz*v222 + D_xxxxz*v151 + D_xxxxzz*v223 + D_xxxy*v113 + &
      D_xxxyy*v152 + D_xxxyyy*v224 + D_xxxyyz*v225 + D_xxxyz*v153 + &
      D_xxxyzz*v226 + D_xxxz*v114 + D_xxxzz*v154 + D_xxxzzz*v227 + &
      D_xxy*v93 + D_xxyy*v115 + D_xxyyy*v155 + D_xxyyyy*v228 + D_xxyyyz &
      *v229 + D_xxyyz*v156 + D_xxyyzz*v230 + D_xxyz*v116 + D_xxyzz*v157 &
      + D_xxyzzz*v231 + D_xxz*v94 + D_xxzz*v117 + D_xxzzz*v158 + &
      D_xxzzzz*v232 + D_xy*M_xy + D_xyz*M_xyz + D_xz*M_xz + D_y*M_y + &
      D_yy*v261 + D_yyy*v263 + D_yyyy*v268 + D_yyyyy*v276 + D_yyyyyy* &
      v287 + D_yyyyyz*v288 + D_yyyyz*v277 + D_yyyyzz*v289 + D_yyyz*v269 &
      + D_yyyzz*v278 + D_yyyzzz*v290 + D_yyz*v264 + D_yyzz*v270 + &
      D_yyzzz*v279 + D_yyzzzz*v291 + D_yz*M_yz + D_z*M_z + D_zz*v301 + &
      D_zzz*v302 + D_zzzz*v303 + D_zzzzz*v304 + D_zzzzzz*v305 + M_xyy* &
      v233 + M_xyyy*v234 + M_xyyyy*v235 + M_xyyyyy*v236 + M_xyyyyyy* &
      v237 + M_xyyyyyz*v238 + M_xyyyyz*v239 + M_xyyyyzz*v240 + M_xyyyz* &
      v241 + M_xyyyzz*v242 + M_xyyyzzz*v243 + M_xyyz*v244 + M_xyyzz* &
      v245 + M_xyyzzz*v246 + M_xyyzzzz*v247 + M_xyzz*v209 + M_xyzzz* &
      v210 + M_xyzzzz*v211 + M_xyzzzzz*v212 + M_xzz*v248 + M_xzzz*v249 &
      + M_xzzzz*v250 + M_xzzzzz*v251 + M_xzzzzzz*v252 + M_yzz*v292 + &
      M_yzzz*v293 + M_yzzzz*v294 + M_yzzzzz*v295 + M_yzzzzzz*v296
    L_z       = D_xxxxxxz*v218 + D_xxxxxyz*v219 + D_xxxxxz*v149 + D_xxxxxzz*v220 + &
      D_xxxxyyz*v221 + D_xxxxyz*v150 + D_xxxxyzz*v222 + D_xxxxz*v112 + &
      D_xxxxzz*v151 + D_xxxxzzz*v223 + D_xxxyyyz*v224 + D_xxxyyz*v152 + &
      D_xxxyyzz*v225 + D_xxxyz*v113 + D_xxxyzz*v153 + D_xxxyzzz*v226 + &
      D_xxxz*v92 + D_xxxzz*v114 + D_xxxzzz*v154 + D_xxxzzzz*v227 + &
      D_xxyyyyz*v228 + D_xxyyyz*v155 + D_xxyyyzz*v229 + D_xxyyz*v115 + &
      D_xxyyzz*v156 + D_xxyyzzz*v230 + D_xxyz*v93 + D_xxyzz*v116 + &
      D_xxyzzz*v157 + D_xxyzzzz*v231 + D_xxz*v83 + D_xxzz*v94 + D_xxzzz &
      *v117 + D_xxzzzz*v158 + D_xxzzzzz*v232 + D_xyz*M_xy + D_xyzz* &
      M_xyz + D_xz*M_x + D_xzz*M_xz + D_yyyyyyz*v287 + D_yyyyyz*v276 + &
      D_yyyyyzz*v288 + D_yyyyz*v268 + D_yyyyzz*v277 + D_yyyyzzz*v289 + &
      D_yyyz*v263 + D_yyyzz*v269 + D_yyyzzz*v278 + D_yyyzzzz*v290 + &
      D_yyz*v261 + D_yyzz*v264 + D_yyzzz*v270 + D_yyzzzz*v279 + &
      D_yyzzzzz*v291 + D_yz*M_y + D_yzz*M_yz + D_z*M_0 + D_zz*M_z + &
      D_zzz*v301 + D_zzzz*v302 + D_zzzzz*v303 + D_zzzzzz*v304 + &
      D_zzzzzzz*v305 + M_xyy*v244 + M_xyyy*v241 + M_xyyyy*v239 + &
      M_xyyyyy*v238 + M_xyyyyz*v253 + M_xyyyz*v254 + M_xyyyzz*v208 + &
      M_xyyz*v194 + M_xyyzz*v255 + M_xyyzzz*v256 + M_xyzz*v215 + &
      M_xyzzz*v216 + M_xyzzzz*v217 + M_xzz*v257 + M_xzzz*v258 + M_xzzzz &
      *v259 + M_xzzzzz*v260 + M_yzz*v297 + M_yzzz*v298 + M_yzzzz*v299 + &
      M_yzzzzz*v300
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  y                   
#undef  x                   
#undef  L_0                 
#undef  z                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  M_z                 
#undef  L_z                 
#undef  L_xx                
#undef  M_xx                
#undef  L_xy                
#undef  M_xy                
#undef  M_xz                
#undef  L_xz                
#undef  M_yy                
#undef  L_yy                
#undef  L_yz                
#undef  M_yz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  M_xxy               
#undef  L_xxz               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
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
#undef  M_xxyz              
#undef  L_xxyz              
#undef  M_xyyy              
#undef  L_xyyy              
#undef  L_xyyz              
#undef  M_xyyz              
#undef  L_yyyy              
#undef  M_yyyy              
#undef  L_yyyz              
#undef  M_yyyz              
#undef  L_xxxxx             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxy             
#undef  L_xxxxz             
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxyy             
#undef  M_xxxyz             
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  M_xxyyy             
#undef  L_xxyyz             
#undef  M_xxyyz             
#undef  L_xyyyy             
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  L_xyyyz             
#undef  M_yyyyy             
#undef  L_yyyyy             
#undef  L_yyyyz             
#undef  M_yyyyz             
#undef  L_xxxxxx            
#undef  M_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  L_xxxxxz            
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
#undef  L_xxyyyz            
#undef  M_xxyyyz            
#undef  L_xyyyyy            
#undef  M_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyyz            
#undef  L_yyyyyy            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  L_xxxxxxy           
#undef  M_xxxxxxz           
#undef  L_xxxxxxz           
#undef  M_xxxxxyy           
#undef  L_xxxxxyy           
#undef  M_xxxxxyz           
#undef  L_xxxxxyz           
#undef  M_xxxxyyy           
#undef  L_xxxxyyy           
#undef  L_xxxxyyz           
#undef  M_xxxxyyz           
#undef  M_xxxyyyy           
#undef  L_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxxyyyz           
#undef  L_xxyyyyy           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  L_xxyyyyz           
#undef  M_xyyyyyy           
#undef  L_xyyyyyy           
#undef  M_xyyyyyz           
#undef  L_xyyyyyz           
#undef  M_yyyyyyy           
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_yyyyyyz           
    end subroutine mom_es_M2L2
    
! OPS  350*ADD + 2*DIV + 477*MUL + 57*NEG + POW = 887  (2436 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v113, v114, v115, v116, v117, v118, v119, v12, v120, v121,&
                v122, v123, v124, v125, v126, v127, v128, v129, v13, v130,&
                v131, v132, v133, v134, v135, v136, v137, v138, v139, v14,&
                v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,&
                v15, v150, v151, v152, v153, v154, v16, v17, v18, v19, v2,&
                v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52,&
                v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63,&
                v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74,&
                v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84, v85,&
                v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95, v96,&
                v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz,&
                L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz,&
                L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz,&
                L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz,&
                L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
#define Phi_0                Phi(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define Phi_x                Phi(1:2,1)
#define Phi_y                Phi(1:2,2)
#define L_y                  L(1:2,2)
#define L_z                  L(1:2,3)
#define Phi_z                Phi(1:2,3)
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
#define L_xxxxxxx            L(1:2,49)
#define L_xxxxxxy            L(1:2,50)
#define L_xxxxxxz            L(1:2,51)
#define L_xxxxxyy            L(1:2,52)
#define L_xxxxxyz            L(1:2,53)
#define L_xxxxyyy            L(1:2,54)
#define L_xxxxyyz            L(1:2,55)
#define L_xxxyyyy            L(1:2,56)
#define L_xxxyyyz            L(1:2,57)
#define L_xxyyyyy            L(1:2,58)
#define L_xxyyyyz            L(1:2,59)
#define L_xyyyyyy            L(1:2,60)
#define L_xyyyyyz            L(1:2,61)
#define L_yyyyyyy            L(1:2,62)
#define L_yyyyyyz            L(1:2,63)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0        = L_xxz*z
    v14       = L_xxyyyy + L_xxyyyyz*z
    v18       = L_xxxxxx + L_xxxxxxy*y + L_xxxxxxz*z
    v20       = 2.0d0*z
    v24       = 6.0d0*z
    v28       = 24.0d0*z
    v35       = 2.0d0*y
    v36       = L_xxxxxy + L_xxxxxyz*z
    v41       = L_xxxxyy + L_xxxxyyz*z
    v42       = 3.0d0*y
    v45       = 0.0416666666666667d0*x
    v47       = L_xxxyyy + L_xxxyyyz*z
    v50       = 4.0d0*y
    v53       = L_xyz*z
    v59       = L_xyyyyy + L_xyyyyyz*z
    v61       = L_xxxxxyy*y + v36
    v71       = L_xz*z
    v90       = 0.00833333333333333d0*x
    v116      = L_yyz*z
    v122      = L_yyyyyy + L_yyyyyyz*z
    v127      = 0.0416666666666667d0*y
    v129      = L_yz*z
    v139      = 0.00833333333333333d0*y
    L_zz      = -(L_xx + L_yy)
    L_xzz     = -(L_xxx + L_xyy)
    v92       = L_xzz*z
    L_yzz     = -(L_xxy + L_yyy)
    v141      = L_yzz*z
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
    v100      = L_xxxxxz + L_xxxxxyz*y + L_xxxxxzz*z
    L_xxxxyzz = -(L_xxxxxxy + L_xxxxyyy)
    v107      = L_xxxxyz + L_xxxxyzz*z
    L_xxxxzzz = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz = -(L_xxxxxyy + L_xxxyyyy)
    v109      = L_xxxyyz + L_xxxyyzz*z
    L_xxxyzzz = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz = -(L_xxxxyyy + L_xxyyyyy)
    v112      = L_xxyyyz + L_xxyyyzz*z
    L_xxyyzzz = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz = -(L_xxxyyyy + L_xyyyyyy)
    v98       = L_xyyyyz + L_xyyyyzz*z
    L_xyyyzzz = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz = -(L_xxyyyyy + L_yyyyyyy)
    v146      = L_yyyyyz + L_yyyyyzz*z
    L_yyyyzzz = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz = -(L_xxzzzzz + L_yyzzzzz)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v38       = a2
    v39       = 0.0833333333333333d0*v38
    v89       = 0.0208333333333333d0*v38
    a3        = a1*a2
    v33       = a3
    v34       = 0.0833333333333333d0*v33
    v88       = 0.0277777777777778d0*v33
    a4        = a2*a2
    v16       = a4
    v17       = 0.0416666666666667d0*v16
    v85       = 0.0208333333333333d0*v16
    a5        = a2*a3
    v1        = a5
    v2        = 0.00833333333333333d0*v1
    a6        = a3*a3
    v72       = 0.00138888888888889d0*a6
    a7        = a3*a4
    b2        = b1*b1
    v23       = b2
    v40       = 3.0d0*v23
    v48       = 6.0d0*v23
    v125      = 0.0833333333333333d0*v23
    v138      = 0.0208333333333333d0*v23
    b3        = b1*b2
    v19       = b3
    v46       = 4.0d0*v19
    v123      = 0.0833333333333333d0*v19
    v137      = 0.0277777777777778d0*v19
    b4        = b2*b2
    v13       = b4
    v15       = v13*v14
    v60       = v13*v59
    v121      = 0.0416666666666667d0*v13
    v136      = 0.0208333333333333d0*v13
    v99       = v13*v98
    b5        = b2*b3
    v3        = b5
    v4        = L_xxyyyyy*v3
    v54       = L_xyyyyyy*v3
    v81       = 0.00833333333333333d0*v3
    v93       = L_xyyyyyz*v3
    b6        = b3*b3
    v73       = b6
    v74       = L_xyyyyyy*v73
    v130      = 0.00138888888888889d0*v73
    b7        = b3*b4
    c2        = c1*c1
    v5        = c2
    v25       = 3.0d0*v5
    v29       = 12.0d0*v5
    v150      = 0.5d0*v5
    v75       = L_xzz*v5
    v131      = L_yzz*v5
    v6        = L_xxzz*v5
    v55       = L_xyzz*v5
    v94       = L_xzzz*v5
    v117      = L_yyzz*v5
    v142      = L_yzzz*v5
    v37       = 2.0d0*L_xxxxx + L_xxxxxyy*v23 + L_xxxxxz*v20 + L_xxxxxzz*v5 + v35*v36
    v43       = 2.0d0*L_xxxxy + L_xxxxyz*v20 + L_xxxxyzz*v5
    v68       = v43 + L_xxxxyyy*v23 + v35*v41
    v108      = L_xxxxyyz*v23 + 2.0d0*L_xxxxz + L_xxxxzz*v20 + L_xxxxzzz*v5 + v107*v35
    v49       = 2.0d0*L_xxxyy + L_xxxyyz*v20 + L_xxxyyzz*v5
    v110      = 2.0d0*L_xxxyz + L_xxxyzz*v20 + L_xxxyzzz*v5
    v21       = 2.0d0*L_xxyyy + L_xxyyyz*v20 + L_xxyyyzz*v5
    v22       = v19*v21
    v113      = 2.0d0*L_xxyyz + L_xxyyzz*v20 + L_xxyyzzz*v5
    v62       = 2.0d0*L_xyyyy + L_xyyyyz*v20 + L_xyyyyzz*v5
    v63       = v19*v62
    v82       = v13*v62
    v101      = 2.0d0*L_xyyyz + L_xyyyzz*v20 + L_xyyyzzz*v5
    v102      = v101*v19
    v124      = 2.0d0*L_yyyyy + L_yyyyyz*v20 + L_yyyyyzz*v5
    v147      = 2.0d0*L_yyyyz + L_yyyyzz*v20 + L_yyyyzzz*v5
    h         = v23 + v38 + v5
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
    v7        = c3
    v30       = 4.0d0*v7
    v151      = 0.166666666666667d0*v7
    v76       = L_xzzz*v7
    v132      = L_yzzz*v7
    v8        = L_xxzzz*v7
    v56       = L_xyzzz*v7
    v95       = L_xzzzz*v7
    v118      = L_yyzzz*v7
    v143      = L_yzzzz*v7
    v44       = 6.0d0*L_xxxx + L_xxxxyyy*v19 + L_xxxxz*v24 + L_xxxxzz*v25 + L_xxxxzzz*v7 &
      + v40*v41 + v42*v43
    v51       = 6.0d0*L_xxxy + L_xxxyz*v24 + L_xxxyzz*v25 + L_xxxyzzz*v7
    v69       = v51 + L_xxxyyyy*v19 + v40*v47 + v42*v49
    v111      = L_xxxyyyz*v19 + 6.0d0*L_xxxz + L_xxxzz*v24 + L_xxxzzz*v25 + L_xxxzzzz*v7 &
      + v109*v40 + v110*v42
    v26       = 6.0d0*L_xxyy + L_xxyyz*v24 + L_xxyyzz*v25 + L_xxyyzzz*v7
    v27       = v23*v26
    v114      = 6.0d0*L_xxyz + L_xxyzz*v24 + L_xxyzzz*v25 + L_xxyzzzz*v7
    v64       = 6.0d0*L_xyyy + L_xyyyz*v24 + L_xyyyzz*v25 + L_xyyyzzz*v7
    v65       = v23*v64
    v83       = v19*v64
    v103      = 6.0d0*L_xyyz + L_xyyzz*v24 + L_xyyzzz*v25 + L_xyyzzzz*v7
    v104      = v103*v23
    v126      = 6.0d0*L_yyyy + L_yyyyz*v24 + L_yyyyzz*v25 + L_yyyyzzz*v7
    v148      = 6.0d0*L_yyyz + L_yyyzz*v24 + L_yyyzzz*v25 + L_yyyzzzz*v7
    c4        = c2*c2
    v9        = c4
    v152      = 0.0416666666666667d0*v9
    v77       = L_xzzzz*v9
    v133      = L_yzzzz*v9
    v10       = L_xxzzzz*v9
    v57       = L_xyzzzz*v9
    v96       = L_xzzzzz*v9
    v119      = L_yyzzzz*v9
    v144      = L_yzzzzz*v9
    v52       = 24.0d0*L_xxx + L_xxxyyyy*v13 + L_xxxz*v28 + L_xxxzz*v29 + L_xxxzzz*v30 + &
      L_xxxzzzz*v9 + v46*v47 + v48*v49 + v50*v51
    v31       = 24.0d0*L_xxy + L_xxyz*v28 + L_xxyzz*v29 + L_xxyzzz*v30 + L_xxyzzzz*v9
    v32       = v31*y
    v70       = v31 + L_xxyyyyy*v13 + v14*v46 + v21*v48 + v26*v50
    v115      = L_xxyyyyz*v13 + 24.0d0*L_xxz + L_xxzz*v28 + L_xxzzz*v29 + L_xxzzzz*v30 + &
      L_xxzzzzz*v9 + v112*v46 + v113*v48 + v114*v50
    v66       = 24.0d0*L_xyy + L_xyyz*v28 + L_xyyzz*v29 + L_xyyzzz*v30 + L_xyyzzzz*v9
    v67       = v66*y
    v84       = v23*v66
    v105      = 24.0d0*L_xyz + L_xyzz*v28 + L_xyzzz*v29 + L_xyzzzz*v30 + L_xyzzzzz*v9
    v106      = v105*y
    v128      = 24.0d0*L_yyy + L_yyyz*v28 + L_yyyzz*v29 + L_yyyzzz*v30 + L_yyyzzzz*v9
    v149      = 24.0d0*L_yyz + L_yyzz*v28 + L_yyzzz*v29 + L_yyzzzz*v30 + L_yyzzzzz*v9
    c5        = c2*c3
    v11       = c5
    v153      = 0.00833333333333333d0*v11
    v78       = L_xzzzzz*v11
    v134      = L_yzzzzz*v11
    v12       = L_xxzzzzz*v11
    v91       = v12 + v4 + 60.0d0*v6 + 20.0d0*v8 + 5.0d0*(24.0d0*L_xx + 24.0d0*v0 + v10 &
      + v15 + 2.0d0*v22 + 2.0d0*v27 + v32)
    Phi_xx    = 0.00833333333333333d0*(v12 + v4 + 60.0d0*v6 + 20.0d0*v8 + 10.0d0*(v22 + &
      v27) + 5.0d0*(v10 + v15 + v32)) + L_xx + L_xxxxxxx*v2 + v0 + v17* &
      v18 + v34*v37 + v39*v44 + v45*v52
    v58       = L_xyzzzzz*v11
    v86       = v58 + 60.0d0*v55 + 20.0d0*v56 + 5.0d0*(24.0d0*L_xy + 24.0d0*v53 + v57)
    v87       = v86*y
    Phi_xy    = 0.00833333333333333d0*(v54 + 60.0d0*v55 + 20.0d0*v56 + v58 + 10.0d0*(v63 &
      + v65) + 5.0d0*(v57 + v60 + v67)) + L_xxxxxxy*v2 + L_xy + v17*v61 &
      + v34*v68 + v39*v69 + v45*v70 + v53
    v97       = L_xzzzzzz*v11
    Phi_xz    = 0.00833333333333333d0*(v93 + 60.0d0*v94 + 20.0d0*v95 + v97 + 10.0d0*( &
      v102 + v104) + 5.0d0*(v106 + v96 + v99)) + L_xxxxxxz*v2 + L_xz + &
      v100*v17 + v108*v34 + v111*v39 + v115*v45 + v92
    v120      = L_yyzzzzz*v11
    v140      = v120 + 60.0d0*v117 + 20.0d0*v118 + 5.0d0*(24.0d0*L_yy + 24.0d0*v116 + &
      v119)
    Phi_yy    = 0.00833333333333333d0*(60.0d0*v117 + 20.0d0*v118 + 5.0d0*v119 + v120) + &
      L_xxxxxyy*v2 + L_yy + L_yyyyyyy*v81 + v116 + v121*v122 + v123* &
      v124 + v125*v126 + v127*v128 + v17*(L_xxxxyyy*y + v41) + v34*( &
      L_xxxyyyy*v23 + v35*v47 + v49) + v39*(L_xxyyyyy*v19 + v14*v40 + &
      v21*v42 + v26) + v45*(L_xyyyyyy*v13 + v46*v59 + v48*v62 + v50*v64 &
      + v66)
    Phi_zz    = -(Phi_xx + Phi_yy)
    v145      = L_yzzzzzz*v11
    Phi_yz    = 0.00833333333333333d0*(60.0d0*v142 + 20.0d0*v143 + 5.0d0*v144 + v145) + &
      L_xxxxxyz*v2 + L_yyyyyyz*v81 + L_yz + v121*v146 + v123*v147 + &
      v125*v148 + v127*v149 + v141 + v17*(L_xxxxyyz*y + v107) + v34*( &
      L_xxxyyyz*v23 + v109*v35 + v110) + v39*(L_xxyyyyz*v19 + v112*v40 &
      + v113*v42 + v114) + v45*(L_xyyyyyz*v13 + v101*v48 + v103*v50 + &
      v105 + v46*v98)
    c6        = c3*c3
    v79       = c6
    v154      = 0.00138888888888889d0*v79
    v80       = L_xzzzzzz*v79
    Phi_x     = 0.00138888888888889d0*(v74 + 360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + &
      v80 + 20.0d0*v83 + 6.0d0*(v78 + v87) + 15.0d0*(v82 + v84)) + L_x &
      + L_xxxxxxx*v72 + v18*v2 + v37*v85 + v44*v88 + v52*v89 + v59*v81 &
      + v71 + v90*v91
    v135      = L_yzzzzzz*v79
    Phi_y     = 0.00138888888888889d0*(360.0d0*v131 + 120.0d0*v132 + 30.0d0*v133 + 6.0d0 &
      *v134 + v135) + L_xxxxxxy*v72 + L_y + L_yyyyyyy*v130 + v122*v81 + &
      v124*v136 + v126*v137 + v128*v138 + v129 + v139*v140 + v2*v61 + &
      v68*v85 + v69*v88 + v70*v89 + v90*(v54 + 5.0d0*v60 + 10.0d0*v63 + &
      10.0d0*v65 + 5.0d0*v67 + v86)
    Phi_z     = L_z + L_xxxxxxz*v72 + L_yyyyyyz*v130 + L_zz*z + L_zzz*v150 + L_zzzz*v151 &
      + L_zzzzz*v152 + L_zzzzzz*v153 + L_zzzzzzz*v154 + v100*v2 + v108* &
      v85 + v111*v88 + v115*v89 + v136*v147 + v137*v148 + v138*v149 + &
      v139*(120.0d0*L_yz + 120.0d0*v141 + 60.0d0*v142 + 20.0d0*v143 + &
      5.0d0*v144 + v145) + v146*v81 + v90*(120.0d0*L_xz + 10.0d0*v102 + &
      10.0d0*v104 + 5.0d0*v106 + 120.0d0*v92 + v93 + 60.0d0*v94 + &
      20.0d0*v95 + 5.0d0*v96 + v97 + 5.0d0*v99)
    c7        = c3*c4
    Phi_0     = 0.000198412698412698d0*(L_xxxxxxx*a7 + L_yyyyyyy*b7 + L_zzzzzzz*c7 + &
      7.0d0*(x*(720.0d0*L_x + 6.0d0*v3*v59 + 720.0d0*v71 + v74 + &
      360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + 6.0d0*v78 + v80 + 15.0d0 &
      *v82 + 20.0d0*v83 + 15.0d0*v84 + 6.0d0*v87) + y*(720.0d0*L_y + &
      720.0d0*v129 + 360.0d0*v131 + 120.0d0*v132 + 30.0d0*v133 + 6.0d0* &
      v134 + v135)) + 21.0d0*(v1*v37 + v124*v3 + v140*v23 + v38*v91) + &
      35.0d0*(v126*v13 + v128*v19 + v16*v44 + v33*v52)) + L_0 + L_z*z + &
      L_zz*v150 + L_zzz*v151 + L_zzzz*v152 + L_zzzzz*v153 + L_zzzzzz* &
      v154 + v122*v130 + v18*v72
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
#undef  L_z                 
#undef  Phi_z               
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
    
! OPS  616*ADD + 2*DIV + 729*MUL + 56*NEG + POW = 1404  (4106 before optimization)
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
                v259, v26, v260, v261, v262, v263, v264, v265, v266, v267,&
                v268, v269, v27, v270, v271, v272, v273, v274, v275, v276,&
                v277, v278, v279, v28, v280, v281, v282, v283, v284, v285,&
                v286, v287, v288, v289, v29, v290, v3, v30, v31, v32, v33,&
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
                L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz,&
                L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz,&
                L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz,&
                L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz,&
                L_yyzzzzz, L_yzzzzzz, L_zzzzzzz
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
#define Ls_xxy               Ls(1:2,10)
#define L_xxy                L(1:2,10)
#define L_xxz                L(1:2,11)
#define Ls_xxz               Ls(1:2,11)
#define Ls_xyy               Ls(1:2,12)
#define L_xyy                L(1:2,12)
#define Ls_xyz               Ls(1:2,13)
#define L_xyz                L(1:2,13)
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
#define Ls_xxxxxxx           Ls(1:2,49)
#define L_xxxxxxx            L(1:2,49)
#define Ls_xxxxxxy           Ls(1:2,50)
#define L_xxxxxxy            L(1:2,50)
#define Ls_xxxxxxz           Ls(1:2,51)
#define L_xxxxxxz            L(1:2,51)
#define Ls_xxxxxyy           Ls(1:2,52)
#define L_xxxxxyy            L(1:2,52)
#define Ls_xxxxxyz           Ls(1:2,53)
#define L_xxxxxyz            L(1:2,53)
#define L_xxxxyyy            L(1:2,54)
#define Ls_xxxxyyy           Ls(1:2,54)
#define Ls_xxxxyyz           Ls(1:2,55)
#define L_xxxxyyz            L(1:2,55)
#define L_xxxyyyy            L(1:2,56)
#define Ls_xxxyyyy           Ls(1:2,56)
#define Ls_xxxyyyz           Ls(1:2,57)
#define L_xxxyyyz            L(1:2,57)
#define Ls_xxyyyyy           Ls(1:2,58)
#define L_xxyyyyy            L(1:2,58)
#define Ls_xxyyyyz           Ls(1:2,59)
#define L_xxyyyyz            L(1:2,59)
#define Ls_xyyyyyy           Ls(1:2,60)
#define L_xyyyyyy            L(1:2,60)
#define L_xyyyyyz            L(1:2,61)
#define Ls_xyyyyyz           Ls(1:2,61)
#define Ls_yyyyyyy           Ls(1:2,62)
#define L_yyyyyyy            L(1:2,62)
#define Ls_yyyyyyz           Ls(1:2,63)
#define L_yyyyyyz            L(1:2,63)
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
    v135       = 0.0416666666666667d0*x
    v147       = L_xyyyyz*z
    v150       = v9*y
    v153       = L_xyyyz*z
    v164       = L_xyyz*z
    v180       = L_xyz*z
    v200       = L_xz*z
    v219       = 0.00833333333333333d0*x
    v233       = L_yyyyyz*z
    v236       = L_yyyyz*z
    v239       = 0.5d0*y
    v243       = L_yyyz*z
    v248       = 0.166666666666667d0*y
    v254       = L_yyz*z
    v261       = 0.0416666666666667d0*y
    v268       = L_yz*z
    v278       = 0.00833333333333333d0*y
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
    v222       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v280       = L_yzz*z
    L_zzz      = -(L_xxz + L_yyz)
    L_xxzz     = -(L_xxxx + L_xxyy)
    v138       = L_xxzz*z
    L_xyzz     = -(L_xxxy + L_xyyy)
    v191       = L_xyzz*z
    L_xzzz     = -(L_xxxz + L_xyyz)
    L_yyzz     = -(L_xxyy + L_yyyy)
    v263       = L_yyzz*z
    L_yzzz     = -(L_xxyz + L_yyyz)
    L_zzzz     = -(L_xxzz + L_yyzz)
    L_xxxzz    = -(L_xxxxx + L_xxxyy)
    v78        = L_xxxzz*z
    L_xxyzz    = -(L_xxxxy + L_xxyyy)
    v111       = L_xxyzz*z
    L_xxzzz    = -(L_xxxxz + L_xxyyz)
    L_xyyzz    = -(L_xxxyy + L_xyyyy)
    v173       = L_xyyzz*z
    L_xyzzz    = -(L_xxxyz + L_xyyyz)
    L_xzzzz    = -(L_xxxzz + L_xyyzz)
    L_yyyzz    = -(L_xxyyy + L_yyyyy)
    v250       = L_yyyzz*z
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
    v160       = L_xyyyzz*z
    L_xyyzzz   = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz   = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz   = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz   = -(L_xxyyyy + L_yyyyyy)
    v241       = L_yyyyzz*z
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
    v151       = L_xyyyyz + L_xyyyyzz*z
    v152       = L_xyyyyyz*y + v151
    v163       = v151*y
    Ls_xyyyyz  = L_xxyyyyz*x + v152
    L_xyyyzzz  = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz  = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz  = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz  = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz  = -(L_xxyyyyy + L_yyyyyyy)
    v235       = L_yyyyyz + L_yyyyyzz*z
    Ls_yyyyyz  = v235 + L_xyyyyyz*x + L_yyyyyyz*y
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
    v134       = 0.0833333333333333d0*v13
    v218       = 0.0208333333333333d0*v13
    a3         = a1*a2
    v28        = a3
    v29        = 0.166666666666667d0*v28
    v133       = 0.0833333333333333d0*v28
    v217       = 0.0277777777777778d0*v28
    a4         = a2*a2
    v62        = a4
    v63        = 0.0416666666666667d0*v62
    v214       = 0.0208333333333333d0*v62
    a5         = a2*a3
    v119       = a5
    v120       = 0.00833333333333333d0*v119
    a6         = a3*a3
    v201       = 0.00138888888888889d0*a6
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
    v148       = L_xyyyyyy*v15
    v161       = L_xyyyyyz*v15
    v247       = 0.25d0*v15
    v260       = 0.0833333333333333d0*v15
    v277       = 0.0208333333333333d0*v15
    b3         = b1*b2
    v30        = b3
    v31        = L_xxxxyyy*v30
    v51        = L_xxxyyyy*v30
    v70        = 0.166666666666667d0*v30
    v79        = L_xxxyyyz*v30
    v92        = L_xxyyyyy*v30
    v112       = L_xxyyyyz*v30
    v136       = 4.0d0*v30
    v154       = L_xyyyyyy*v30
    v174       = L_xyyyyyz*v30
    v259       = 0.0833333333333333d0*v30
    v276       = 0.0277777777777778d0*v30
    b4         = b2*b2
    v64        = b4
    v65        = L_xxxyyyy*v64
    v103       = L_xxyyyyy*v64
    v128       = 0.0416666666666667d0*v64
    v139       = L_xxyyyyz*v64
    v165       = L_xyyyyyy*v64
    v192       = L_xyyyyyz*v64
    v220       = 5.0d0*v64
    v275       = 0.0208333333333333d0*v64
    b5         = b2*b3
    v121       = b5
    v122       = L_xxyyyyy*v121
    v181       = L_xyyyyyy*v121
    v210       = 0.00833333333333333d0*v121
    v223       = L_xyyyyyz*v121
    b6         = b3*b3
    v202       = b6
    v203       = L_xyyyyyy*v202
    v269       = 0.00138888888888889d0*v202
    b7         = b3*b4
    c2         = c1*c1
    v17        = c2
    v286       = 0.5d0*v17
    v204       = L_xzz*v17
    v270       = L_yzz*v17
    v123       = L_xxzz*v17
    v182       = L_xyzz*v17
    v224       = L_xzzz*v17
    v255       = L_yyzz*v17
    v281       = L_yzzz*v17
    v66        = L_xxxzz*v17
    v104       = L_xxyzz*v17
    v140       = L_xxzzz*v17
    v166       = L_xyyzz*v17
    v193       = L_xyzzz*v17
    v244       = L_yyyzz*v17
    v264       = L_yyzzz*v17
    v32        = L_xxxxzz*v17
    v52        = L_xxxyzz*v17
    v80        = L_xxxzzz*v17
    v93        = L_xxyyzz*v17
    v113       = L_xxyzzz*v17
    v155       = L_xyyyzz*v17
    v175       = L_xyyzzz*v17
    v237       = L_yyyyzz*v17
    v251       = L_yyyzzz*v17
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
    v129       = v30*v95
    v159       = 2.0d0*v88 + v86 + v95
    Ls_xxyyy   = 0.5d0*(v86 + v87) + L_xxxxyyy*v14 + L_xxyyy + v6*x + v85 + v88
    v100       = L_xxyyzzz*v17
    v115       = v100 + 2.0d0*(L_xxyyz + v98)
    v116       = v115*y
    v143       = v115*v15
    v179       = 2.0d0*v101 + v115 + v99
    Ls_xxyyz   = 0.5d0*(v100 + v99) + L_xxxxyyz*v14 + L_xxyyz + v101 + v49*x + v98
    v149       = L_xyyyyzz*v17
    v157       = v149 + 2.0d0*(L_xyyyy + v147)
    v158       = v157*y
    v169       = v15*v157
    v186       = v157*v30
    v211       = v157*v64
    Ls_xyyyy   = 0.5d0*(v148 + v149) + L_xxxyyyy*v14 + L_xyyyy + v147 + v150 + v8*x
    v162       = L_xyyyzzz*v17
    v177       = v162 + 2.0d0*(L_xyyyz + v160)
    v178       = v177*y
    v196       = v15*v177
    v228       = v177*v30
    Ls_xyyyz   = 0.5d0*(v161 + v162) + L_xxxyyyz*v14 + L_xyyyz + v160 + v163 + v90*x
    v234       = L_yyyyyzz*v17
    v240       = v234 + 2.0d0*(L_yyyyy + v233)
    Ls_yyyyy   = 0.5d0*v234 + L_xxyyyyy*v14 + L_yyyyy + L_yyyyyyy*v35 + v10*x + v11*y + &
      v233
    v242       = L_yyyyzzz*v17
    v253       = v242 + 2.0d0*(L_yyyyz + v241)
    Ls_yyyyz   = 0.5d0*v242 + L_xxyyyyz*v14 + L_yyyyyyz*v35 + L_yyyyz + v152*x + v235*y + &
      v241
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
    v287       = 0.166666666666667d0*v33
    v205       = L_xzzz*v33
    v271       = L_yzzz*v33
    v124       = L_xxzzz*v33
    v183       = L_xyzzz*v33
    v225       = L_xzzzz*v33
    v256       = L_yyzzz*v33
    v282       = L_yzzzz*v33
    v67        = L_xxxzzz*v33
    v105       = L_xxyzzz*v33
    v141       = L_xxzzzz*v33
    v167       = L_xyyzzz*v33
    v194       = L_xyzzzz*v33
    v245       = L_yyyzzz*v33
    v265       = L_yyzzzz*v33
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
    v146       = v79 + v81 + v48*v76 + 6.0d0*(L_xxxz + v78) + 3.0d0*(v80 + v83)
    Ls_xxxz    = 0.166666666666667d0*(v79 + v81 + 3.0d0*(v80 + v83)) + L_xxxxxxz*v29 + &
      L_xxxz + v14*v20 + v35*v48 + v38*v84 + v78
    v94        = L_xxyyzzz*v33
    v108       = v94 + 3.0d0*(2.0d0*L_xxyy + 2.0d0*v91 + v93)
    v109       = v108*y
    v130       = v108*v15
    v172       = v108 + v92 + v7*v76 + 3.0d0*v96
    Ls_xxyy    = 0.166666666666667d0*(v92 + v94 + 3.0d0*(v93 + v96)) + L_xxxxxyy*v29 + &
      L_xxyy + v14*v4 + v35*v7 + v38*v97 + v91
    v114       = L_xxyzzzz*v33
    v144       = v114 + 3.0d0*(2.0d0*L_xxyz + 2.0d0*v111 + v113)
    v145       = v144*y
    v199       = v112 + v144 + 3.0d0*v116 + v76*v89
    Ls_xxyz    = 0.166666666666667d0*(v112 + v114 + 3.0d0*(v113 + v116)) + L_xxxxxyz*v29 &
      + L_xxyz + v111 + v117*v38 + v14*v26 + v35*v89
    v156       = L_xyyyzzz*v33
    v170       = v156 + 3.0d0*(2.0d0*L_xyyy + 2.0d0*v153 + v155)
    v171       = v170*y
    v187       = v15*v170
    v212       = v170*v30
    Ls_xyyy    = 0.166666666666667d0*(v154 + v156 + 3.0d0*(v155 + v158)) + L_xxxxyyy*v29 &
      + L_xyyy + v14*v6 + v153 + v159*v38 + v35*v9
    v176       = L_xyyzzzz*v33
    v197       = v176 + 3.0d0*(2.0d0*L_xyyz + 2.0d0*v173 + v175)
    v198       = v197*y
    v229       = v15*v197
    Ls_xyyz    = 0.166666666666667d0*(v174 + v176 + 3.0d0*(v175 + v178)) + L_xxxxyyz*v29 &
      + L_xyyz + v14*v49 + v151*v35 + v173 + v179*v38
    v238       = L_yyyyzzz*v33
    v249       = v238 + 3.0d0*(2.0d0*L_yyyy + 2.0d0*v236 + v237)
    Ls_yyyy    = 0.166666666666667d0*(3.0d0*v237 + v238) + L_xxxyyyy*v29 + L_yyyy + &
      L_yyyyyyy*v70 + v11*v35 + v14*v8 + v236 + v239*v240 + v38*(v148 + &
      2.0d0*v150 + v157)
    v252       = L_yyyzzzz*v33
    v267       = v252 + 3.0d0*(2.0d0*L_yyyz + 2.0d0*v250 + v251)
    Ls_yyyz    = 0.166666666666667d0*(3.0d0*v251 + v252) + L_xxxyyyz*v29 + L_yyyyyyz*v70 &
      + L_yyyz + v14*v90 + v235*v35 + v239*v253 + v250 + v38*(v161 + &
      2.0d0*v163 + v177)
    c4         = c2*c2
    v68        = c4
    v288       = 0.0416666666666667d0*v68
    v206       = L_xzzzz*v68
    v272       = L_yzzzz*v68
    v125       = L_xxzzzz*v68
    v184       = L_xyzzzz*v68
    v226       = L_xzzzzz*v68
    v257       = L_yyzzzz*v68
    v283       = L_yzzzzz*v68
    v69        = L_xxxzzzz*v68
    v137       = v65 + v69 + v136*v5 + 12.0d0*v66 + 6.0d0*v71 + 24.0d0*(L_xxx + v61) + &
      4.0d0*(v67 + v73)
    Ls_xxx     = 0.0416666666666667d0*(v65 + 12.0d0*v66 + v69 + 6.0d0*v71 + 4.0d0*(v67 + &
      v73)) + L_xxx + L_xxxxxxx*v63 + v0*v29 + v39*v74 + v5*v70 + v61 + &
      v75*v77
    v106       = L_xxyzzzz*v68
    v131       = v106 + 12.0d0*v104 + 4.0d0*(6.0d0*L_xxy + 6.0d0*v102 + v105)
    v132       = v131*y
    v190       = v103 + v131 + 6.0d0*v107 + 4.0d0*v109 + v136*v7
    Ls_xxy     = 0.0416666666666667d0*(v103 + 12.0d0*v104 + v106 + 6.0d0*v107 + 4.0d0*( &
      v105 + v109)) + L_xxxxxxy*v63 + L_xxy + v102 + v110*v75 + v2*v29 &
      + v56*v74 + v7*v70
    v142       = L_xxzzzzz*v68
    v232       = v139 + v142 + v136*v89 + 12.0d0*v140 + 6.0d0*v143 + 24.0d0*(L_xxz + v138 &
      ) + 4.0d0*(v141 + v145)
    Ls_xxz     = 0.0416666666666667d0*(v139 + 12.0d0*v140 + v142 + 6.0d0*v143 + 4.0d0*( &
      v141 + v145)) + L_xxxxxxz*v63 + L_xxz + v138 + v146*v75 + v20*v29 &
      + v70*v89 + v74*v84
    v168       = L_xyyzzzz*v68
    v188       = v168 + 12.0d0*v166 + 4.0d0*(6.0d0*L_xyy + 6.0d0*v164 + v167)
    v189       = v188*y
    v213       = v15*v188
    Ls_xyy     = 0.0416666666666667d0*(v165 + 12.0d0*v166 + v168 + 6.0d0*v169 + 4.0d0*( &
      v167 + v171)) + L_xxxxxyy*v63 + L_xyy + v164 + v172*v75 + v29*v4 &
      + v70*v9 + v74*v97
    v195       = L_xyzzzzz*v68
    v230       = v195 + 12.0d0*v193 + 4.0d0*(6.0d0*L_xyz + 6.0d0*v191 + v194)
    v231       = v230*y
    Ls_xyz     = 0.0416666666666667d0*(v192 + 12.0d0*v193 + v195 + 6.0d0*v196 + 4.0d0*( &
      v194 + v198)) + L_xxxxxyz*v63 + L_xyz + v117*v74 + v151*v70 + &
      v191 + v199*v75 + v26*v29
    v246       = L_yyyzzzz*v68
    v262       = v246 + 12.0d0*v244 + 4.0d0*(6.0d0*L_yyy + 6.0d0*v243 + v245)
    Ls_yyy     = 0.0416666666666667d0*(12.0d0*v244 + 4.0d0*v245 + v246) + L_xxxxyyy*v63 + &
      L_yyy + L_yyyyyyy*v128 + v11*v70 + v159*v74 + v240*v247 + v243 + &
      v248*v249 + v29*v6 + v75*(v154 + 3.0d0*v158 + v170 + v76*v9)
    v266       = L_yyzzzzz*v68
    v285       = v266 + 12.0d0*v264 + 4.0d0*(6.0d0*L_yyz + 6.0d0*v263 + v265)
    Ls_yyz     = 0.0416666666666667d0*(12.0d0*v264 + 4.0d0*v265 + v266) + L_xxxxyyz*v63 + &
      L_yyyyyyz*v128 + L_yyz + v179*v74 + v235*v70 + v247*v253 + v248* &
      v267 + v263 + v29*v49 + v75*(v151*v76 + v174 + 3.0d0*v178 + v197)
    c5         = c2*c3
    v126       = c5
    v289       = 0.00833333333333333d0*v126
    v207       = L_xzzzzz*v126
    v273       = L_yzzzzz*v126
    v127       = L_xxzzzzz*v126
    v221       = v122 + v127 + 60.0d0*v123 + 20.0d0*v124 + v220*v7 + 120.0d0*(L_xx + v118 &
      ) + 5.0d0*(v125 + v132) + 10.0d0*(v129 + v130)
    Ls_xx      = 0.00833333333333333d0*(v122 + 60.0d0*v123 + 20.0d0*v124 + v127 + 5.0d0*( &
      v125 + v132) + 10.0d0*(v129 + v130)) + L_xx + L_xxxxxxx*v120 + v0 &
      *v63 + v118 + v128*v7 + v133*v39 + v134*v77 + v135*v137
    v185       = L_xyzzzzz*v126
    v215       = v185 + 60.0d0*v182 + 20.0d0*v183 + 5.0d0*(24.0d0*L_xy + 24.0d0*v180 + &
      v184)
    v216       = v215*y
    Ls_xy      = 0.00833333333333333d0*(v181 + 60.0d0*v182 + 20.0d0*v183 + v185 + 5.0d0*( &
      v184 + v189) + 10.0d0*(v186 + v187)) + L_xxxxxxy*v120 + L_xy + &
      v110*v134 + v128*v9 + v133*v56 + v135*v190 + v180 + v2*v63
    v227       = L_xzzzzzz*v126
    Ls_xz      = 0.00833333333333333d0*(v223 + 60.0d0*v224 + 20.0d0*v225 + v227 + 5.0d0*( &
      v226 + v231) + 10.0d0*(v228 + v229)) + L_xxxxxxz*v120 + L_xz + &
      v128*v151 + v133*v84 + v134*v146 + v135*v232 + v20*v63 + v222
    v258       = L_yyzzzzz*v126
    v279       = v258 + 60.0d0*v255 + 20.0d0*v256 + 5.0d0*(24.0d0*L_yy + 24.0d0*v254 + &
      v257)
    Ls_yy      = 0.00833333333333333d0*(60.0d0*v255 + 20.0d0*v256 + 5.0d0*v257 + v258) + &
      L_xxxxxyy*v120 + L_yy + L_yyyyyyy*v210 + v11*v128 + v133*v97 + &
      v134*v172 + v135*(v136*v9 + v165 + 6.0d0*v169 + 4.0d0*v171 + v188 &
      ) + v240*v259 + v249*v260 + v254 + v261*v262 + v4*v63
    v284       = L_yzzzzzz*v126
    Ls_yz      = 0.00833333333333333d0*(60.0d0*v281 + 20.0d0*v282 + 5.0d0*v283 + v284) + &
      L_xxxxxyz*v120 + L_yyyyyyz*v210 + L_yz + v117*v133 + v128*v235 + &
      v134*v199 + v135*(v136*v151 + v192 + 6.0d0*v196 + 4.0d0*v198 + &
      v230) + v253*v259 + v26*v63 + v260*v267 + v261*v285 + v280
    c6         = c3*c3
    v208       = c6
    v290       = 0.00138888888888889d0*v208
    v209       = L_xzzzzzz*v208
    Ls_x       = 0.00138888888888889d0*(v203 + 360.0d0*v204 + 120.0d0*v205 + 30.0d0*v206 &
      + v209 + 20.0d0*v212 + 6.0d0*(v207 + v216) + 15.0d0*(v211 + v213 &
      )) + L_x + L_xxxxxxx*v201 + v0*v120 + v137*v218 + v200 + v210*v9 &
      + v214*v39 + v217*v77 + v219*v221
    v274       = L_yzzzzzz*v208
    Ls_y       = 0.00138888888888889d0*(360.0d0*v270 + 120.0d0*v271 + 30.0d0*v272 + 6.0d0 &
      *v273 + v274) + L_xxxxxxy*v201 + L_y + L_yyyyyyy*v269 + v11*v210 &
      + v110*v217 + v120*v2 + v190*v218 + v214*v56 + v219*(v181 + &
      10.0d0*v186 + 10.0d0*v187 + 5.0d0*v189 + v215 + v220*v9) + v240* &
      v275 + v249*v276 + v262*v277 + v268 + v278*v279
    Ls_z       = L_z + L_xxxxxxz*v201 + L_yyyyyyz*v269 + L_zz*z + L_zzz*v286 + L_zzzz* &
      v287 + L_zzzzz*v288 + L_zzzzzz*v289 + L_zzzzzzz*v290 + v120*v20 + &
      v146*v217 + v210*v235 + v214*v84 + v218*v232 + v219*(120.0d0*L_xz &
      + v151*v220 + 120.0d0*v222 + v223 + 60.0d0*v224 + 20.0d0*v225 + &
      5.0d0*v226 + v227 + 10.0d0*v228 + 10.0d0*v229 + 5.0d0*v231) + &
      v253*v275 + v267*v276 + v277*v285 + v278*(120.0d0*L_yz + 120.0d0* &
      v280 + 60.0d0*v281 + 20.0d0*v282 + 5.0d0*v283 + v284)
    c7         = c3*c4
    Ls_0       = 0.000198412698412698d0*(L_xxxxxxx*a7 + L_yyyyyyy*b7 + L_zzzzzzz*c7 + &
      7.0d0*(x*(720.0d0*L_x + 6.0d0*v121*v9 + 720.0d0*v200 + v203 + &
      360.0d0*v204 + 120.0d0*v205 + 30.0d0*v206 + 6.0d0*v207 + v209 + &
      15.0d0*v211 + 20.0d0*v212 + 15.0d0*v213 + 6.0d0*v216) + y*( &
      720.0d0*L_y + 720.0d0*v268 + 360.0d0*v270 + 120.0d0*v271 + 30.0d0 &
      *v272 + 6.0d0*v273 + v274)) + 21.0d0*(v119*v39 + v121*v240 + v13* &
      v221 + v15*v279) + 35.0d0*(v137*v28 + v249*v64 + v262*v30 + v62* &
      v77)) + L_0 + L_z*z + L_zz*v286 + L_zzz*v287 + L_zzzz*v288 + &
      L_zzzzz*v289 + L_zzzzzz*v290 + v0*v201 + v11*v269
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
#undef  Ls_xxy              
#undef  L_xxy               
#undef  L_xxz               
#undef  Ls_xxz              
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
