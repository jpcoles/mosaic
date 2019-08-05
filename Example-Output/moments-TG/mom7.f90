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
        
    
! OPS  2*ADD + 2*DIV + 224*MUL + POW = 229  (571 before optimization)
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
                v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81,&
                v82, v83, v84, v85, v9, h, u
#define M_0                  M(0)
#define y                    r(2)
#define z                    r(3)
#define x                    r(1)
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
#define M_xxxxxx             M(56)
#define M_xxxxxy             M(57)
#define M_xxxxxz             M(58)
#define M_xxxxyy             M(59)
#define M_xxxxyz             M(60)
#define M_xxxxzz             M(61)
#define M_xxxyyy             M(62)
#define M_xxxyyz             M(63)
#define M_xxxyzz             M(64)
#define M_xxxzzz             M(65)
#define M_xxyyyy             M(66)
#define M_xxyyyz             M(67)
#define M_xxyyzz             M(68)
#define M_xxyzzz             M(69)
#define M_xxzzzz             M(70)
#define M_xyyyyy             M(71)
#define M_xyyyyz             M(72)
#define M_xyyyzz             M(73)
#define M_xyyzzz             M(74)
#define M_xyzzzz             M(75)
#define M_xzzzzz             M(76)
#define M_yyyyyy             M(77)
#define M_yyyyyz             M(78)
#define M_yyyyzz             M(79)
#define M_yyyzzz             M(80)
#define M_yyzzzz             M(81)
#define M_yzzzzz             M(82)
#define M_zzzzzz             M(83)
#define M_xxxxxxx            M(84)
#define M_xxxxxxy            M(85)
#define M_xxxxxxz            M(86)
#define M_xxxxxyy            M(87)
#define M_xxxxxyz            M(88)
#define M_xxxxxzz            M(89)
#define M_xxxxyyy            M(90)
#define M_xxxxyyz            M(91)
#define M_xxxxyzz            M(92)
#define M_xxxxzzz            M(93)
#define M_xxxyyyy            M(94)
#define M_xxxyyyz            M(95)
#define M_xxxyyzz            M(96)
#define M_xxxyzzz            M(97)
#define M_xxxzzzz            M(98)
#define M_xxyyyyy            M(99)
#define M_xxyyyyz            M(100)
#define M_xxyyyzz            M(101)
#define M_xxyyzzz            M(102)
#define M_xxyzzzz            M(103)
#define M_xxzzzzz            M(104)
#define M_xyyyyyy            M(105)
#define M_xyyyyyz            M(106)
#define M_xyyyyzz            M(107)
#define M_xyyyzzz            M(108)
#define M_xyyzzzz            M(109)
#define M_xyzzzzz            M(110)
#define M_xzzzzzz            M(111)
#define M_yyyyyyy            M(112)
#define M_yyyyyyz            M(113)
#define M_yyyyyzz            M(114)
#define M_yyyyzzz            M(115)
#define M_yyyzzzz            M(116)
#define M_yyzzzzz            M(117)
#define M_yzzzzzz            M(118)
#define M_zzzzzzz            M(119)
    v72       = W*y
    v73       = W*z
    v74       = 0.5d0*W
    v75       = 0.166666666666667d0*W
    v76       = 0.0416666666666667d0*W
    v79       = 0.00833333333333333d0*W
    v82       = 0.00138888888888889d0*W
    v85       = 0.00416666666666667d0*W
    v0        = W*x
    v1        = v72
    v2        = v73
    v3        = v74
    v5        = v0*y
    v6        = v0*z
    v8        = v1*z
    v10       = v75
    v13       = v74*x
    v18       = v76
    v22       = v75*x
    v29       = v79
    v36       = v76*x
    v45       = v82
    v54       = v79*x
    v64       = 0.000198412698412698d0*W
    v71       = v82*x
    M_0       = W
    M_x       = v0
    M_y       = v1
    M_z       = v2
    M_xy      = v5
    M_xz      = v6
    M_yz      = v8
    M_xyz     = v5*z
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v4        = a2
    v77       = W*v4
    v12       = 0.5d0*v4
    v21       = 0.25d0*v77
    v33       = 0.0833333333333333d0*v77
    v34       = v4*v73
    v35       = v4*v72
    v52       = 0.0208333333333333d0*v77
    v69       = v4*v85
    v70       = v4*v76
    M_xx      = v3*v4
    M_xxy     = v1*v12
    M_xxz     = v12*v2
    M_xxyz    = v12*v8
    a3        = a1*a2
    v11       = a3
    v80       = W*v11
    v20       = 0.166666666666667d0*v11
    v32       = 0.0833333333333333d0*v80
    v49       = 0.0277777777777778d0*v80
    v50       = v11*v73
    v51       = v11*v72
    v68       = 0.00694444444444444d0*v80
    M_xxx     = v10*v11
    M_xxxy    = v1*v20
    M_xxxz    = v2*v20
    M_xxxyz   = v20*v8
    a4        = a2*a2
    v19       = a4
    v83       = W*v19
    v31       = 0.0416666666666667d0*v19
    v48       = 0.0208333333333333d0*v83
    v67       = 0.00694444444444444d0*v83
    M_xxxx    = v18*v19
    M_xxxxy   = v1*v31
    M_xxxxz   = v2*v31
    M_xxxxyz  = v31*v8
    a5        = a2*a3
    v30       = a5
    v47       = 0.00833333333333333d0*v30
    v66       = v30*v85
    M_xxxxx   = v29*v30
    M_xxxxxy  = v1*v47
    M_xxxxxz  = v2*v47
    M_xxxxxyz = v47*v8
    a6        = a3*a3
    v46       = a6
    v65       = 0.00138888888888889d0*v46
    M_xxxxxx  = v45*v46
    M_xxxxxxy = v1*v65
    M_xxxxxxz = v2*v65
    a7        = a3*a4
    M_xxxxxxx = a7*v64
    b2        = b1*b1
    v7        = b2
    v78       = W*v7
    v15       = 0.5d0*v7
    v26       = v78
    v37       = v78*x
    M_yy      = v3*v7
    M_xyy     = v13*v7
    M_yyz     = v15*v2
    M_xxyy    = v21*v7
    M_xyyz    = v15*v6
    M_xxxyy   = v32*v7
    M_xxyyz   = 0.25d0*v34*v7
    M_xxxxyy  = v48*v7
    M_xxxyyz  = 0.0833333333333333d0*v50*v7
    M_xxxxxyy = v66*v7
    M_xxxxyyz = 0.0208333333333333d0*v19*v2*v7
    b3        = b1*b2
    v14       = b3
    v81       = W*v14
    v24       = 0.166666666666667d0*v14
    v41       = v81
    v55       = v81*x
    M_yyy     = v10*v14
    M_xyyy    = v14*v22
    M_yyyz    = v2*v24
    M_xxyyy   = v14*v33
    M_xyyyz   = v24*v6
    M_xxxyyy  = v14*v49
    M_xxyyyz  = 0.0833333333333333d0*v14*v34
    M_xxxxyyy = v14*v67
    M_xxxyyyz = 0.0277777777777778d0*v14*v50
    b4        = b2*b2
    v23       = b4
    v84       = W*v23
    v39       = 0.0416666666666667d0*v23
    v59       = v84
    M_yyyy    = v18*v23
    M_xyyyy   = v23*v36
    M_yyyyz   = v2*v39
    M_xxyyyy  = v23*v52
    M_xyyyyz  = v39*v6
    M_xxxyyyy = v23*v68
    M_xxyyyyz = 0.0208333333333333d0*v23*v34
    b5        = b2*b3
    v38       = b5
    v57       = 0.00833333333333333d0*v38
    M_yyyyy   = v29*v38
    M_xyyyyy  = v38*v54
    M_yyyyyz  = v2*v57
    M_xxyyyyy = v38*v69
    M_xyyyyyz = v57*v6
    b6        = b3*b3
    v56       = b6
    M_yyyyyy  = v45*v56
    M_xyyyyyy = v56*v71
    M_yyyyyyz = 0.00138888888888889d0*v2*v56
    b7        = b3*b4
    M_yyyyyyy = b7*v64
    c2        = c1*c1
    v9        = c2
    v16       = 0.5d0*v9
    v25       = 0.25d0*v9
    v40       = 0.0833333333333333d0*v9
    v53       = v7*v9
    v58       = 0.0208333333333333d0*v9
    M_zz      = v3*v9
    M_xzz     = v13*v9
    M_yzz     = v1*v16
    M_xxzz    = v21*v9
    M_xyzz    = v16*v5
    M_yyzz    = v25*v26
    M_xxxzz   = v32*v9
    M_xxyzz   = v25*v35
    M_xyyzz   = v25*v37
    M_yyyzz   = v40*v41
    M_xxxxzz  = v48*v9
    M_xxxyzz  = v40*v51
    M_xxyyzz  = 0.125d0*v53*v77
    M_xyyyzz  = v40*v55
    M_yyyyzz  = v58*v59
    M_xxxxxzz = v66*v9
    M_xxxxyzz = v19*v58*v72
    M_xxxyyzz = v11*v53*v76
    M_xxyyyzz = v14*v70*v9
    M_xyyyyzz = v58*v84*x
    M_yyyyyzz = v38*v85*v9
    h         = v4 + v7 + v9
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
    v17       = c3
    v27       = 0.166666666666667d0*v17
    v42       = 0.0833333333333333d0*v17
    v60       = 0.0277777777777778d0*v17
    M_zzz     = v10*v17
    M_xzzz    = v17*v22
    M_yzzz    = v1*v27
    M_xxzzz   = v17*v33
    M_xyzzz   = v27*v5
    M_yyzzz   = v26*v42
    M_xxxzzz  = v17*v49
    M_xxyzzz  = v35*v42
    M_xyyzzz  = v37*v42
    M_yyyzzz  = v41*v60
    M_xxxxzzz = v17*v67
    M_xxxyzzz = v51*v60
    M_xxyyzzz = v17*v7*v70
    M_xyyyzzz = v55*v60
    M_yyyyzzz = 0.00694444444444444d0*v17*v59
    c4        = c2*c2
    v28       = c4
    v43       = 0.0416666666666667d0*v28
    v61       = 0.0208333333333333d0*v28
    M_zzzz    = v18*v28
    M_xzzzz   = v28*v36
    M_yzzzz   = v1*v43
    M_xxzzzz  = v28*v52
    M_xyzzzz  = v43*v5
    M_yyzzzz  = v26*v61
    M_xxxzzzz = v28*v68
    M_xxyzzzz = v35*v61
    M_xyyzzzz = v37*v61
    M_yyyzzzz = 0.00694444444444444d0*v28*v41
    c5        = c2*c3
    v44       = c5
    v62       = 0.00833333333333333d0*v44
    M_zzzzz   = v29*v44
    M_xzzzzz  = v44*v54
    M_yzzzzz  = v1*v62
    M_xxzzzzz = v44*v69
    M_xyzzzzz = v5*v62
    M_yyzzzzz = 0.00416666666666667d0*v26*v44
    c6        = c3*c3
    v63       = c6
    M_zzzzzz  = v45*v63
    M_xzzzzzz = v63*v71
    M_yzzzzzz = 0.00138888888888889d0*v1*v63
    c7        = c3*c4
    M_zzzzzzz = c7*v64
#undef  M_0                 
#undef  y                   
#undef  z                   
#undef  x                   
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
#undef  M_xxxxxx            
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  M_xxxxyz            
#undef  M_xxxxzz            
#undef  M_xxxyyy            
#undef  M_xxxyyz            
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  M_xxyzzz            
#undef  M_xxzzzz            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  M_xyyzzz            
#undef  M_xyzzzz            
#undef  M_xzzzzz            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  M_yyyyzz            
#undef  M_yyyzzz            
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  M_zzzzzz            
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  M_xxxxxzz           
#undef  M_xxxxyyy           
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  M_xxxxzzz           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  M_xxxzzzz           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  M_xxyyyzz           
#undef  M_xxyyzzz           
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  M_xyyyyyy           
#undef  M_xyyyyyz           
#undef  M_xyyyyzz           
#undef  M_xyyyzzz           
#undef  M_xyyzzzz           
#undef  M_xyzzzzz           
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  M_yyyyyyz           
#undef  M_yyyyyzz           
#undef  M_yyyyzzz           
#undef  M_yyyzzzz           
#undef  M_yyzzzzz           
#undef  M_yzzzzzz           
#undef  M_zzzzzzz           
    end subroutine mom_es_P2M
    
! OPS  1304*ADD + 2*DIV + 1399*MUL + POW = 2706  (6255 before optimization)
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
                v413, v414, v415, v416, v417, v418, v419, v42, v420, v421,&
                v422, v423, v424, v425, v426, v427, v428, v429, v43, v430,&
                v431, v432, v433, v434, v435, v436, v437, v44, v45, v46, v47,&
                v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58,&
                v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7,&
                v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80,&
                v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91,&
                v92, v93, v94, v95, v96, v97, v98, v99, h, u
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define z                    r(3)
#define x                    r(1)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
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
#define Ms_xyy               Ms(13)
#define M_xyy                M(13)
#define M_xyz                M(14)
#define Ms_xyz               Ms(14)
#define M_xzz                M(15)
#define Ms_xzz               Ms(15)
#define Ms_yyy               Ms(16)
#define M_yyy                M(16)
#define M_yyz                M(17)
#define Ms_yyz               Ms(17)
#define M_yzz                M(18)
#define Ms_yzz               Ms(18)
#define Ms_zzz               Ms(19)
#define M_zzz                M(19)
#define Ms_xxxx              Ms(20)
#define M_xxxx               M(20)
#define Ms_xxxy              Ms(21)
#define M_xxxy               M(21)
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
#define Ms_xzzz              Ms(29)
#define M_xzzz               M(29)
#define Ms_yyyy              Ms(30)
#define M_yyyy               M(30)
#define Ms_yyyz              Ms(31)
#define M_yyyz               M(31)
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
#define M_xxxyy              M(38)
#define Ms_xxxyy             Ms(38)
#define Ms_xxxyz             Ms(39)
#define M_xxxyz              M(39)
#define M_xxxzz              M(40)
#define Ms_xxxzz             Ms(40)
#define M_xxyyy              M(41)
#define Ms_xxyyy             Ms(41)
#define Ms_xxyyz             Ms(42)
#define M_xxyyz              M(42)
#define Ms_xxyzz             Ms(43)
#define M_xxyzz              M(43)
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
#define M_xzzzz              M(49)
#define Ms_xzzzz             Ms(49)
#define Ms_yyyyy             Ms(50)
#define M_yyyyy              M(50)
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
#define Ms_xxxxxx            Ms(56)
#define M_xxxxxx             M(56)
#define Ms_xxxxxy            Ms(57)
#define M_xxxxxy             M(57)
#define Ms_xxxxxz            Ms(58)
#define M_xxxxxz             M(58)
#define Ms_xxxxyy            Ms(59)
#define M_xxxxyy             M(59)
#define Ms_xxxxyz            Ms(60)
#define M_xxxxyz             M(60)
#define M_xxxxzz             M(61)
#define Ms_xxxxzz            Ms(61)
#define M_xxxyyy             M(62)
#define Ms_xxxyyy            Ms(62)
#define Ms_xxxyyz            Ms(63)
#define M_xxxyyz             M(63)
#define Ms_xxxyzz            Ms(64)
#define M_xxxyzz             M(64)
#define M_xxxzzz             M(65)
#define Ms_xxxzzz            Ms(65)
#define Ms_xxyyyy            Ms(66)
#define M_xxyyyy             M(66)
#define Ms_xxyyyz            Ms(67)
#define M_xxyyyz             M(67)
#define M_xxyyzz             M(68)
#define Ms_xxyyzz            Ms(68)
#define Ms_xxyzzz            Ms(69)
#define M_xxyzzz             M(69)
#define M_xxzzzz             M(70)
#define Ms_xxzzzz            Ms(70)
#define M_xyyyyy             M(71)
#define Ms_xyyyyy            Ms(71)
#define Ms_xyyyyz            Ms(72)
#define M_xyyyyz             M(72)
#define M_xyyyzz             M(73)
#define Ms_xyyyzz            Ms(73)
#define M_xyyzzz             M(74)
#define Ms_xyyzzz            Ms(74)
#define M_xyzzzz             M(75)
#define Ms_xyzzzz            Ms(75)
#define Ms_xzzzzz            Ms(76)
#define M_xzzzzz             M(76)
#define Ms_yyyyyy            Ms(77)
#define M_yyyyyy             M(77)
#define M_yyyyyz             M(78)
#define Ms_yyyyyz            Ms(78)
#define Ms_yyyyzz            Ms(79)
#define M_yyyyzz             M(79)
#define Ms_yyyzzz            Ms(80)
#define M_yyyzzz             M(80)
#define M_yyzzzz             M(81)
#define Ms_yyzzzz            Ms(81)
#define M_yzzzzz             M(82)
#define Ms_yzzzzz            Ms(82)
#define Ms_zzzzzz            Ms(83)
#define M_zzzzzz             M(83)
#define M_xxxxxxx            M(84)
#define Ms_xxxxxxx           Ms(84)
#define Ms_xxxxxxy           Ms(85)
#define M_xxxxxxy            M(85)
#define M_xxxxxxz            M(86)
#define Ms_xxxxxxz           Ms(86)
#define M_xxxxxyy            M(87)
#define Ms_xxxxxyy           Ms(87)
#define M_xxxxxyz            M(88)
#define Ms_xxxxxyz           Ms(88)
#define Ms_xxxxxzz           Ms(89)
#define M_xxxxxzz            M(89)
#define Ms_xxxxyyy           Ms(90)
#define M_xxxxyyy            M(90)
#define Ms_xxxxyyz           Ms(91)
#define M_xxxxyyz            M(91)
#define Ms_xxxxyzz           Ms(92)
#define M_xxxxyzz            M(92)
#define M_xxxxzzz            M(93)
#define Ms_xxxxzzz           Ms(93)
#define Ms_xxxyyyy           Ms(94)
#define M_xxxyyyy            M(94)
#define Ms_xxxyyyz           Ms(95)
#define M_xxxyyyz            M(95)
#define Ms_xxxyyzz           Ms(96)
#define M_xxxyyzz            M(96)
#define M_xxxyzzz            M(97)
#define Ms_xxxyzzz           Ms(97)
#define Ms_xxxzzzz           Ms(98)
#define M_xxxzzzz            M(98)
#define Ms_xxyyyyy           Ms(99)
#define M_xxyyyyy            M(99)
#define M_xxyyyyz            M(100)
#define Ms_xxyyyyz           Ms(100)
#define Ms_xxyyyzz           Ms(101)
#define M_xxyyyzz            M(101)
#define Ms_xxyyzzz           Ms(102)
#define M_xxyyzzz            M(102)
#define Ms_xxyzzzz           Ms(103)
#define M_xxyzzzz            M(103)
#define M_xxzzzzz            M(104)
#define Ms_xxzzzzz           Ms(104)
#define M_xyyyyyy            M(105)
#define Ms_xyyyyyy           Ms(105)
#define M_xyyyyyz            M(106)
#define Ms_xyyyyyz           Ms(106)
#define Ms_xyyyyzz           Ms(107)
#define M_xyyyyzz            M(107)
#define Ms_xyyyzzz           Ms(108)
#define M_xyyyzzz            M(108)
#define Ms_xyyzzzz           Ms(109)
#define M_xyyzzzz            M(109)
#define M_xyzzzzz            M(110)
#define Ms_xyzzzzz           Ms(110)
#define Ms_xzzzzzz           Ms(111)
#define M_xzzzzzz            M(111)
#define M_yyyyyyy            M(112)
#define Ms_yyyyyyy           Ms(112)
#define Ms_yyyyyyz           Ms(113)
#define M_yyyyyyz            M(113)
#define Ms_yyyyyzz           Ms(114)
#define M_yyyyyzz            M(114)
#define Ms_yyyyzzz           Ms(115)
#define M_yyyyzzz            M(115)
#define Ms_yyyzzzz           Ms(116)
#define M_yyyzzzz            M(116)
#define M_yyzzzzz            M(117)
#define Ms_yyzzzzz           Ms(117)
#define Ms_yzzzzzz           Ms(118)
#define M_yzzzzzz            M(118)
#define Ms_zzzzzzz           Ms(119)
#define M_zzzzzzz            M(119)
    v433       = 0.0416666666666667d0*M_0
    v409       = v433
    v427       = 0.00416666666666667d0*M_0
    v0         = M_0*x
    v1         = M_x + v0
    v2         = M_0*y
    v3         = M_y + v2
    v4         = M_0*z + M_z
    v5         = M_x*x
    v6         = M_xx + v5
    v7         = 0.5d0*M_0
    v9         = M_y*x
    v10        = M_xy + v9
    v11        = M_x*y
    v12        = v0*y
    v13        = v10 + v11 + v12
    v14        = M_z*x
    v15        = M_xz + v14
    v16        = M_x*z
    v17        = v0*z + v15 + v16
    v18        = M_y*y
    v19        = M_yy + v18
    v21        = M_z*y
    v22        = M_yz + v21
    v23        = M_y*z
    v24        = v2*z + v22 + v23
    v25        = M_z*z
    v26        = M_zz + v25
    v28        = M_xx*x
    v29        = M_xxx + v28
    v30        = 0.166666666666667d0*M_0
    v33        = M_xy*x
    v34        = M_xxy + v33
    v35        = M_xx*y
    v36        = v5*y
    v37        = v34 + v35 + v36
    v38        = M_xz*x
    v39        = M_xxz + v38
    v40        = M_xx*z
    v41        = v5*z
    v42        = v39 + v40 + v41
    v44        = M_yy*x
    v45        = M_xyy + v44
    v46        = M_xy*y
    v47        = v9*y
    v48        = v45 + v46 + v47
    v49        = M_xy*z
    v50        = v9*z
    v51        = v49 + v50
    v52        = M_xz*y
    v434       = M_xyz + v52
    v53        = M_yz*x
    v54        = v11*z
    v55        = v14*y
    v415       = v53 + v55
    v57        = M_zz*x
    v58        = M_xzz + v57
    v59        = M_xz*z
    v60        = v14*z
    v61        = v58 + v59 + v60
    v62        = M_yy*y
    v63        = M_yyy + v62
    v65        = M_yz*y
    v66        = M_yyz + v65
    v67        = M_yy*z
    v68        = v18*z
    v69        = v66 + v67 + v68
    v70        = M_zz*y
    v71        = M_yzz + v70
    v72        = M_yz*z
    v73        = v21*z
    v74        = v71 + v72 + v73
    v75        = M_zz*z
    v76        = M_zzz + v75
    v78        = M_xxx*x
    v79        = v409
    v82        = M_xxx*y
    v83        = M_xxxy + v82
    v84        = M_xxy*x
    v85        = v28*y
    v86        = M_xy + v11
    v87        = M_xxx*z
    v88        = M_xxxz + v87
    v89        = M_xxz*x
    v90        = v28*z
    v91        = M_xz + v16
    v92        = M_xyy*x
    v93        = M_xxyy + v92
    v94        = M_xxy*y
    v95        = v33*y
    v96        = v93 + v94 + v95
    v100       = M_xxy*z
    v101       = v33*z
    v102       = v100 + v101
    v103       = M_xxz*y
    v104       = M_xyz*x
    v437       = M_xxyz + v104
    v105       = v35*z
    v106       = v38*y
    v431       = v103 + v106
    v107       = M_xzz*x
    v108       = M_xxzz + v107
    v109       = M_xxz*z
    v110       = v38*z
    v111       = v108 + v109 + v110
    v114       = M_yyy*x
    v115       = M_xyyy + v114
    v116       = M_xyy*y
    v117       = v44*y
    v119       = M_xyy*z
    v120       = v119 + v44*z
    v121       = M_xyz*y
    v122       = M_yyz*x
    v435       = M_xyyz + v122
    v123       = v46*z
    v124       = v53*y
    v432       = v121 + v124
    v125       = M_xyz*z
    v126       = v52*z
    v127       = v125 + v126
    v128       = M_xzz*y
    v436       = M_xyzz + v128
    v129       = M_yzz*x
    v130       = v53*z
    v131       = v57*y
    v423       = v129 + v131
    v132       = M_zzz*x
    v133       = M_xzzz + v132
    v134       = M_xzz*z
    v135       = v57*z
    v137       = M_yyy*y
    v139       = M_yyy*z
    v140       = M_yyyz + v139
    v141       = M_yyz*y
    v142       = v62*z
    v143       = M_yz + v23
    v144       = M_yzz*y
    v145       = M_yyzz + v144
    v146       = M_yyz*z
    v147       = v65*z
    v148       = v145 + v146 + v147
    v153       = M_zzz*y
    v154       = M_yzzz + v153
    v155       = M_yzz*z
    v156       = v70*z
    v157       = M_zzz*z
    v159       = M_xxxx*x
    v160       = 0.00833333333333333d0*M_0
    v163       = M_xxxx*y
    v164       = M_xxxxy + v163
    v165       = M_xxxy*x
    v166       = v78*y
    v167       = M_xxy + v35
    v168       = M_xxxx*z
    v169       = M_xxxxz + v168
    v170       = M_xxxz*x
    v171       = v78*z
    v172       = M_xxz + v40
    v173       = M_xxxy*y
    v174       = M_xxyy*x
    v175       = v84*y
    v176       = 0.5d0*M_xxx
    v180       = M_xxxy*z
    v181       = M_xxxz*y
    v182       = v82*z + M_xxxyz + v180 + v181
    v183       = M_xxyz*x
    v184       = v84*z
    v185       = v89*y
    v186       = v434
    v187       = v49 + v54
    v188       = v186 + v187
    v189       = M_xxxz*z
    v190       = M_xxzz*x
    v191       = v89*z
    v192       = M_xxyy*y
    v193       = M_xyyy*x
    v194       = v92*y
    v195       = 0.5d0*M_xxy
    v198       = M_xxyy*z
    v199       = M_xxyz*y
    v200       = M_xyyz*x
    v201       = v94*z
    v202       = v92*z
    v203       = v104*y
    v204       = 0.5d0*M_xxz
    v205       = M_xxyz*z
    v206       = M_xxzz*y
    v207       = M_xyzz*x
    v208       = v103*z
    v209       = v104*z
    v210       = v107*y
    v212       = M_xxzz*z
    v213       = M_xzzz*x
    v214       = v107*z
    v215       = M_yyyy*x
    v216       = M_xyyyy + v215
    v217       = M_xyyy*y
    v218       = v114*y
    v220       = M_xyyy*z
    v221       = M_yyyz*x
    v222       = v114*z + M_xyyyz + v220 + v221
    v223       = M_xyyz*y
    v224       = v116*z
    v225       = v122*y
    v226       = M_xyz + v53
    v227       = v226 + v51
    v228       = M_xyyz*z
    v229       = M_xyzz*y
    v230       = M_yyzz*x
    v231       = v121*z
    v232       = v122*z
    v233       = v129*y
    v235       = M_xzzz*y
    v236       = M_yzzz*x
    v237       = v132*y
    v238       = M_xyzzz + v235 + v236 + v237
    v239       = M_xyzz*z
    v240       = v128*z
    v241       = v129*z
    v242       = v415
    v243       = v186 + v242
    v244       = M_zzzz*x
    v245       = M_xzzzz + v244
    v246       = M_xzzz*z
    v247       = v132*z
    v249       = M_yyyy*y
    v251       = M_yyyy*z
    v252       = M_yyyyz + v251
    v253       = M_yyyz*y
    v254       = v137*z
    v255       = M_yyz + v67
    v256       = M_yyyz*z
    v257       = M_yyzz*y
    v258       = v141*z
    v261       = M_yyzz*z
    v262       = M_yzzz*y
    v263       = v144*z
    v265       = M_zzzz*y
    v266       = M_yzzzz + v265
    v267       = M_yzzz*z
    v268       = v153*z
    v269       = M_zzzz*z
    v271       = M_xxxxx*x
    v272       = 0.00138888888888889d0*M_0
    v275       = M_xxxxx*y
    v276       = M_xxxxy*x
    v277       = v159*y
    v278       = M_xxxxz*x
    v279       = M_xxxxy*y
    v280       = M_xxxyy*x
    v281       = v165*y
    v282       = 0.5d0*M_xxxx
    v286       = M_xyy + v46
    v287       = M_xxxxz*y
    v288       = M_xxxyz*x
    v289       = v170*y
    v290       = M_xxyz + v100 + v103 + v105
    v291       = M_xxxzz*x
    v292       = M_xzz + v59
    v293       = M_xxxyy*y
    v294       = M_xxyyy*x
    v295       = v174*y
    v296       = 0.166666666666667d0*M_xxx
    v297       = 0.5d0*M_xxxy
    v300       = M_xxxyz*y
    v301       = M_xxyyz*x
    v302       = v183*y
    v303       = 0.5d0*M_xxxz
    v305       = M_xxxzz*y
    v306       = M_xxyzz*x
    v307       = v190*y
    v309       = M_xxzzz*x
    v311       = M_xxyyy*y
    v312       = M_xyyyy*x
    v313       = v193*y
    v314       = 0.5d0*M_xxyy
    v318       = M_xxyyz*y
    v319       = M_xyyyz*x
    v320       = v200*y
    v321       = 0.5d0*M_xxyz
    v323       = M_xxyzz*y
    v324       = M_xyyzz*x
    v325       = v207*y
    v326       = 0.5d0*M_xxzz
    v331       = M_xxzzz*y
    v332       = M_xyzzz*x
    v333       = v213*y
    v335       = M_xzzzz*x
    v337       = M_xyyyy*y
    v338       = M_yyyyy*x
    v339       = v215*y
    v341       = M_xyyyz*y
    v342       = M_yyyyz*x
    v343       = v221*y
    v344       = v435
    v345       = v120 + v344
    v346       = M_xyyzz*y
    v347       = M_yyyzz*x
    v348       = v230*y
    v350       = M_xyzzz*y
    v351       = M_yyzzz*x
    v352       = v236*y
    v354       = M_xzzzz*y
    v355       = M_yzzzz*x
    v356       = v244*y
    v357       = v436
    v358       = v357 + v423
    v359       = M_zzzzz*x
    v361       = M_yyyyy*y
    v363       = M_yyyyz*y
    v364       = M_yyyzz*y
    v368       = M_yzz + v72
    v369       = M_yyzzz*y
    v372       = M_yzzzz*y
    v374       = M_zzzzz*y
    v376       = 0.000198412698412698d0*M_0
    v378       = 0.5d0*M_xxxxx
    v383       = 0.166666666666667d0*M_xxxx
    v384       = 0.5d0*M_xxxxy
    v387       = 0.5d0*M_xxxxz
    v389       = 0.166666666666667d0*M_xxxy
    v390       = 0.5d0*M_xxxyy
    v394       = 0.5d0*M_xxxyz
    v395       = 0.166666666666667d0*M_xxxz
    v396       = 0.5d0*M_xxxzz
    v398       = 0.5d0*M_xxyyy
    v400       = 0.5d0*M_xxyyz
    v401       = v437
    v402       = 0.5d0*M_xxyzz
    v404       = 0.5d0*M_xxzzz
    Ms_0       = M_0
    Ms_x       = v1
    Ms_y       = v3
    Ms_z       = v4
    Ms_xy      = v13
    Ms_xz      = v17
    Ms_yz      = v24
    Ms_xyz     = v12*z + v415 + v434 + v51 + v54
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v8         = a2
    v410       = 0.25d0*v8
    v414       = M_0*v8
    v32        = 0.5d0*v8
    v98        = M_yy*v8
    v99        = M_0*v410
    v113       = M_zz*v8
    v179       = M_x*v8
    v196       = 0.0833333333333333d0*v414
    v285       = v410
    v315       = 0.0208333333333333d0*v414
    v317       = M_y*v8
    v328       = v18*v8
    v329       = v25*v8
    v336       = M_z*v8
    v382       = M_xxx*v8
    v399       = v427*v8
    v403       = v409*v8
    Ms_xx      = v6 + v7*v8
    Ms_xxy     = v3*v32 + v37
    Ms_xxz     = v32*v4 + v42
    Ms_xxyz    = v24*v32 + v36*z + v102 + v105 + v431 + v437
    a3         = a1*a2
    v31        = a3
    v412       = 0.0833333333333333d0*v31
    v419       = M_0*v31
    v81        = 0.166666666666667d0*v31
    v177       = M_0*v412
    v284       = M_x*v31
    v298       = 0.0277777777777778d0*v419
    v381       = v412
    v391       = 0.00694444444444444d0*v419
    Ms_xxx     = v29 + M_x*v32 + v30*v31
    Ms_xxxy    = v3*v81 + v32*v86 + v83 + v84 + v85
    Ms_xxxz    = v32*v91 + v4*v81 + v88 + v89 + v90
    Ms_xxxyz   = v188*v32 + v24*v81 + v85*z + v182 + v183 + v184 + v185
    a4         = a2*a2
    v80        = a4
    v418       = M_0*v80
    v162       = 0.0416666666666667d0*v80
    v283       = 0.0208333333333333d0*v418
    v380       = M_x*v80
    v385       = 0.00694444444444444d0*v418
    Ms_xxxx    = M_xxxx + v78 + M_x*v81 + M_xx*v32 + v79*v80
    Ms_xxxxy   = v164 + v165 + v166 + v162*v3 + v167*v32 + v81*v86
    Ms_xxxxz   = v169 + v170 + v171 + v162*v4 + v172*v32 + v81*v91
    Ms_xxxxyz  = M_xxxxyz + v287 + v288 + v289 + M_xxxxy*z + v162*v24 + v163*z + v165*z + &
      v166*z + v188*v81 + v290*v32
    a5         = a2*a3
    v161       = a5
    v274       = 0.00833333333333333d0*v161
    v379       = v161*v427
    Ms_xxxxx   = M_xxxxx + v159 + M_x*v162 + M_xx*v81 + M_xxx*v32 + v160*v161
    Ms_xxxxxy  = M_xxxxxy + v275 + v276 + v277 + v162*v86 + v167*v81 + v274*v3 + v32*v83
    Ms_xxxxxz  = M_xxxxxz + v278 + M_xxxxx*z + v159*z + v162*v91 + v172*v81 + v274*v4 + &
      v32*v88
    Ms_xxxxxyz = M_xxxxxyz + M_xxxxxy*z + M_xxxxxz*y + M_xxxxyz*x + v162*v188 + v182*v32 &
      + v24*v274 + v275*z + v276*z + v277*z + v278*y + v290*v81
    a6         = a3*a3
    v273       = a6
    v377       = 0.00138888888888889d0*v273
    Ms_xxxxxx  = M_xxxxxx + v271 + M_x*v274 + M_xx*v162 + M_xxx*v81 + M_xxxx*v32 + v272* &
      v273
    Ms_xxxxxxy = M_xxxxxxy + M_xxxxxx*y + M_xxxxxy*x + v162*v167 + v164*v32 + v271*y + &
      v274*v86 + v3*v377 + v81*v83
    Ms_xxxxxxz = M_xxxxxxz + M_xxxxxx*z + M_xxxxxz*x + v162*v172 + v169*v32 + v271*z + &
      v274*v91 + v377*v4 + v81*v88
    a7         = a3*a4
    Ms_xxxxxxx = M_xxxxxxx + M_x*v377 + M_xx*v274 + M_xxx*v162 + M_xxxx*v81 + M_xxxxx*v32 &
      + M_xxxxxx*x + a7*v376
    b2         = b1*b1
    v20        = b2
    v413       = 0.25d0*v20
    v420       = 0.0833333333333333d0*v20
    v428       = 0.0208333333333333d0*v20
    v43        = 0.5d0*v20
    v97        = M_xx*v20
    v150       = M_zz*v20
    v152       = M_0*v20
    v178       = v413
    v197       = v413*v8
    v299       = v420*v8
    v304       = v20*v412
    v327       = v20*v5
    v386       = v428*v80
    Ms_yy      = v19 + v20*v7
    Ms_xyy     = v1*v43 + v48
    Ms_yyz     = v4*v43 + v69
    Ms_xxyy    = 0.5d0*(v97 + v98) + v18*v32 + v20*v99 + v43*v5 + v96
    Ms_xyyz    = v17*v43 + v47*z + v120 + v123 + v432 + v435
    Ms_xxxyy   = M_xxxyy + v173 + v174 + v175 + M_xyy*v32 + v176*v20 + v177*v20 + v178* &
      v179 + v19*v81 + v28*v43 + v32*v46
    Ms_xxyyz   = M_xxyyz + v198 + v199 + v200 + v201 + v202 + v203 + M_yyz*v32 + v197*v4 &
      + v20*v204 + v32*v65 + v32*v67 + v32*v68 + v38*v43 + v40*v43 + &
      v41*v43 + v95*z
    Ms_xxxxyy  = M_xxxxyy + v279 + v280 + v281 + M_xxyy*v32 + v162*v19 + v20*v282 + v20* &
      v283 + v284*v420 + v285*v97 + v286*v81 + v32*v94 + v43*v78
    Ms_xxxyyz  = M_xxxyyz + v300 + v301 + v302 + M_xxxyy*z + M_xyyz*v32 + v119*v32 + v121 &
      *v32 + v123*v32 + v173*z + v174*z + v175*z + v197*v91 + v20*v303 &
      + v304*v4 + v43*v87 + v43*v89 + v43*v90 + v69*v81
    Ms_xxxxxyy = M_xxxxxyy + M_xxxxxy*y + M_xxxxyy*x + M_xxxyy*v32 + v159*v43 + v162*v286 &
      + v173*v32 + v178*v382 + v19*v274 + v20*v378 + v20*v379 + v276*y &
      + v380*v428 + v381*v97 + v81*(M_xxyy + v94)
    Ms_xxxxyyz = M_xxxxyyz + M_xxxxyy*z + M_xxxxyz*y + M_xxxyyz*x + M_xxyyz*v32 + v162* &
      v69 + v168*v43 + v170*v43 + v171*v43 + v172*v197 + v198*v32 + &
      v199*v32 + v20*v387 + v201*v32 + v279*z + v280*z + v281*z + v288* &
      y + v304*v91 + v386*v4 + v81*(M_xyyz + v119 + v121 + v123)
    b3         = b1*b2
    v64        = b3
    v421       = 0.0833333333333333d0*v64
    v430       = 0.0277777777777778d0*v64
    v118       = 0.166666666666667d0*v64
    v260       = M_0*v64
    v316       = v421
    v322       = v421*v8
    v367       = M_y*v64
    v393       = v31*v430
    Ms_yyy     = v63 + M_y*v43 + v30*v64
    Ms_xyyy    = v1*v118 + v10*v43 + v115 + v116 + v117
    Ms_yyyz    = v118*v4 + v143*v43 + v140 + v141 + v142
    Ms_xxyyy   = M_xxyyy + v192 + v193 + v194 + M_y*v197 + M_yyy*v32 + v118*v6 + v195*v20 &
      + v196*v64 + v32*v62 + v33*v43
    Ms_xyyyz   = v117*z + v118*v17 + v227*v43 + v222 + v223 + v224 + v225
    Ms_xxxyyy  = M_xxxyyy + v293 + v294 + v295 + M_xy*v197 + M_xyyy*v32 + M_yyy*v81 + &
      v116*v32 + v118*v28 + v20*v297 + v296*v64 + v298*v64 + v299*(v11 &
      + v9) + v43*v84 + v62*v81
    Ms_xxyyyz  = M_xxyyyz + v318 + v319 + v320 + M_xxyyy*z + M_yyyz*v32 + v100*v43 + v101 &
      *v43 + v104*v43 + v118*v42 + v139*v32 + v141*v32 + v142*v32 + &
      v143*v197 + v192*z + v193*z + v194*z + v20*v321 + v322*v4
    Ms_xxxxyyy = M_xxxxyyy + M_xxxxyy*y + M_xxxyyy*x + M_xxy*v197 + M_xxyyy*v32 + M_xyyy* &
      v81 + M_y*v386 + v116*v81 + v118*v78 + v162*v63 + v165*v43 + v192 &
      *v32 + v20*v384 + v280*y + v284*v430 + v299*(v33 + v35) + v383* &
      v64 + v385*v64
    Ms_xxxyyyz = M_xxxyyyz + M_xxxyyy*z + M_xxxyyz*y + M_xxyyyz*x + M_xyyyz*v32 + M_yyyz* &
      v81 + v118*v87 + v118*v89 + v118*v90 + v139*v81 + v141*v81 + v142 &
      *v81 + v180*v43 + v183*v43 + v184*v43 + v197*(M_xyz + v49) + v20* &
      v394 + v220*v32 + v223*v32 + v224*v32 + v293*z + v294*z + v295*z &
      + v299*(v50 + v52 + v53 + v54) + v301*y + v393*v4 + v395*v64
    b4         = b2*b2
    v138       = b4
    v429       = 0.0208333333333333d0*v138
    v219       = 0.0416666666666667d0*v138
    v366       = M_0*v138
    v392       = v429
    Ms_yyyy    = M_yyyy + v137 + M_y*v118 + M_yy*v43 + v138*v79
    Ms_xyyyy   = v216 + v217 + v218 + v1*v219 + v10*v118 + v43*v45
    Ms_yyyyz   = v252 + v253 + v254 + v118*v143 + v219*v4 + v255*v43
    Ms_xxyyyy  = M_xxyyyy + v311 + v312 + v313 + M_yyyy*v32 + v118*v34 + v137*v32 + v138* &
      v315 + v178*v98 + v20*v314 + v219*v6 + v316*v317 + v43*v92
    Ms_xyyyyz  = M_xyyyyz + v341 + v342 + v343 + M_xyyyy*z + v118*v227 + v17*v219 + v215* &
      z + v217*z + v218*z + v345*v43
    Ms_xxxyyyy = M_xxxyyyy + M_xxxyyy*y + M_xxyyyy*x + M_xyy*v197 + M_xyyyy*v32 + M_y* &
      v393 + M_yyyy*v81 + v118*v84 + v137*v81 + v138*v391 + v174*v43 + &
      v179*v392 + v20*v390 + v217*v32 + v219*v29 + v294*y + v299*(v44 + &
      v46) + v389*v64
    Ms_xxyyyyz = M_xxyyyyz + M_xxyyyy*z + M_xxyyyz*y + M_xyyyyz*x + M_yyyyz*v32 + v118*( &
      v102 + v401) + v143*v322 + v197*v255 + v198*v43 + v20*v400 + v200 &
      *v43 + v202*v43 + v219*v42 + v251*v32 + v253*v32 + v254*v32 + &
      v311*z + v312*z + v313*z + v319*y + v392*v4*v8
    b5         = b2*b3
    v250       = b5
    v340       = 0.00833333333333333d0*v250
    Ms_yyyyy   = M_yyyyy + v249 + M_y*v219 + M_yy*v118 + M_yyy*v43 + v160*v250
    Ms_xyyyyy  = M_xyyyyy + v337 + v338 + v339 + v1*v340 + v10*v219 + v115*v43 + v118*v45
    Ms_yyyyyz  = M_yyyyyz + v363 + M_yyyyy*z + v118*v255 + v140*v43 + v143*v219 + v249*z &
      + v340*v4
    Ms_xxyyyyy = M_xxyyyyy + M_xxyyyy*y + M_xyyyyy*x + M_yyy*v197 + M_yyyyy*v32 + v118* &
      v93 + v193*v43 + v20*v398 + v219*v34 + v249*v32 + v250*v399 + &
      v312*y + v316*v98 + v317*v392 + v340*v6
    Ms_xyyyyyz = M_xyyyyyz + M_xyyyyy*z + M_xyyyyz*y + M_yyyyyz*x + v118*v345 + v17*v340 &
      + v219*v227 + v222*v43 + v337*z + v338*z + v339*z + v342*y
    b6         = b3*b3
    v362       = b6
    v405       = 0.00138888888888889d0*v362
    Ms_yyyyyy  = M_yyyyyy + v361 + M_y*v340 + M_yy*v219 + M_yyy*v118 + M_yyyy*v43 + v272* &
      v362
    Ms_xyyyyyy = M_xyyyyyy + M_xyyyyy*y + M_yyyyyy*x + v1*v405 + v10*v340 + v115*v118 + &
      v216*v43 + v219*v45 + v338*y
    Ms_yyyyyyz = M_yyyyyyz + M_yyyyyy*z + M_yyyyyz*y + v118*v140 + v143*v340 + v219*v255 &
      + v252*v43 + v361*z + v4*v405
    b7         = b3*b4
    Ms_yyyyyyy = M_yyyyyyy + M_y*v405 + M_yy*v340 + M_yyy*v219 + M_yyyy*v118 + M_yyyyy* &
      v43 + M_yyyyyy*y + b7*v376
    c2         = c1*c1
    v27        = c2
    v411       = 0.25d0*v27
    v416       = 0.0833333333333333d0*v27
    v422       = v20*v27
    v424       = 0.0208333333333333d0*v27
    v56        = 0.5d0*v27
    v112       = M_xx*v27
    v149       = M_yy*v27
    v151       = v411
    v211       = v411*v8
    v234       = v27*v413
    v259       = v416
    v308       = v31*v416
    v310       = v416*v8
    v330       = 0.125d0*v422
    v349       = v416*v64
    v365       = v424
    v371       = v20*v416
    v388       = v424*v80
    v406       = v27*v429
    Ms_zz      = v26 + v27*v7
    Ms_xzz     = v1*v56 + v61
    Ms_yzz     = v3*v56 + v74
    Ms_xxzz    = 0.5d0*(v112 + v113) + v111 + v25*v32 + v27*v99 + v5*v56
    Ms_xyzz    = v13*v56 + v55*z + v127 + v130 + v423 + v436
    Ms_yyzz    = 0.5d0*(v149 + v150) + v148 + v151*v152 + v18*v56 + v25*v43
    Ms_xxxzz   = M_xxxzz + v189 + v190 + v191 + M_xzz*v32 + v151*v179 + v176*v27 + v177* &
      v27 + v26*v81 + v28*v56 + v32*v59
    Ms_xxyzz   = M_xxyzz + v205 + v206 + v207 + v208 + v209 + v210 + M_yzz*v32 + v106*z + &
      v195*v27 + v211*v3 + v32*v70 + v32*v72 + v32*v73 + v33*v56 + v35* &
      v56 + v36*v56
    Ms_xyyzz   = M_xyyzz + v228 + v229 + v230 + v231 + v232 + v233 + M_xyy*v56 + M_xzz* &
      v43 + v1*v234 + v124*z + v43*v57 + v43*v59 + v43*v60 + v44*v56 + &
      v46*v56 + v47*v56
    Ms_yyyzz   = M_yyyzz + v256 + v257 + v258 + M_y*v234 + M_yyy*v56 + M_yzz*v43 + v118* &
      v26 + v259*v260 + v43*v72 + v56*v62
    Ms_xxxxzz  = M_xxxxzz + v291 + M_xxxxz*z + M_xxzz*v32 + v109*v32 + v112*v285 + v162* &
      v26 + v170*z + v259*v284 + v27*v282 + v27*v283 + v292*v81 + v56* &
      v78
    Ms_xxxyzz  = M_xxxyzz + v305 + v306 + v307 + M_xxxyz*z + M_xyzz*v32 + v125*v32 + v126 &
      *v32 + v128*v32 + v181*z + v183*z + v185*z + v211*v86 + v27*v297 &
      + v3*v308 + v56*v82 + v56*v84 + v56*v85 + v74*v81
    Ms_xxyyzz  = M_xxyyzz + v323 + v324 + v325 + M_xxyyz*z + M_yyzz*v32 + v107*v43 + v109 &
      *v43 + v110*v43 + v113*v178 + v144*v32 + v146*v32 + v147*v32 + &
      v151*v327 + v151*v328 + v151*v97 + v151*v98 + v178*v329 + v199*z &
      + v20*v326 + v200*z + v203*z + v27*v314 + v330*v414 + v56*v92 + &
      v56*v94 + v56*v95
    Ms_xyyyzz  = M_xyyyzz + v346 + v347 + v348 + M_xyyy*v56 + M_xyyyz*z + M_xyzz*v43 + v1 &
      *v349 + v10*v234 + v114*v56 + v116*v56 + v117*v56 + v118*v61 + &
      v125*v43 + v129*v43 + v130*v43 + v221*z + v223*z + v225*z
    Ms_yyyyzz  = M_yyyyzz + v364 + M_yyyy*v56 + M_yyyyz*z + M_yyzz*v43 + v118*v368 + v137 &
      *v56 + v146*v43 + v149*v178 + v219*v26 + v253*z + v259*v367 + &
      v365*v366
    Ms_xxxxxzz = M_xxxxxzz + M_xxxxxz*z + M_xxxxzz*x + M_xxxzz*v32 + v112*v381 + v151* &
      v382 + v159*v56 + v162*v292 + v189*v32 + v26*v274 + v27*v378 + &
      v27*v379 + v278*z + v365*v380 + v81*(M_xxzz + v109)
    Ms_xxxxyzz = M_xxxxyzz + M_xxxxyz*z + M_xxxxzz*y + M_xxxyzz*x + M_xxyzz*v32 + v162* &
      v74 + v163*v56 + v165*v56 + v166*v56 + v167*v211 + v205*v32 + &
      v206*v32 + v208*v32 + v27*v384 + v287*z + v288*z + v289*z + v291* &
      y + v3*v388 + v308*v86 + v81*(v127 + v357)
    Ms_xxxyyzz = M_xxxyyzz + M_xxx*v234 + M_xxxyyz*z + M_xxxyzz*y + M_xxyyzz*x + M_xyy* &
      v211 + M_xyyzz*v32 + M_xzz*v197 + v148*v81 + v173*v56 + v174*v56 &
      + v175*v56 + v179*v330 + v189*v43 + v190*v43 + v191*v43 + v197* &
      v59 + v20*v396 + v211*v46 + v228*v32 + v229*v32 + v231*v32 + v234 &
      *v28 + v27*v390 + v300*z + v301*z + v302*z + v306*y + v31*v422* &
      v433 + v381*(v149 + v150 + v18*v27 + v20*v25)
    Ms_xxyyyzz = M_xxyyyzz + M_xxy*v234 + M_xxyyyz*z + M_xxyyzz*y + M_xyyyzz*x + M_yyy* &
      v211 + M_yyyzz*v32 + M_yzz*v197 + v111*v118 + v192*v56 + v193*v56 &
      + v194*v56 + v197*v72 + v20*v402 + v205*v43 + v207*v43 + v209*v43 &
      + v211*v62 + v234*v33 + v256*v32 + v257*v32 + v258*v32 + v27*v398 &
      + v27*v403*v64 + v316*(v112 + v113 + v27*v5 + v329) + v317*v330 + &
      v318*z + v319*z + v320*z + v324*y
    Ms_xyyyyzz = M_xyyyyzz + M_xyyyy*v56 + M_xyyyyz*z + M_xyyyzz*y + M_xyyzz*v43 + &
      M_yyyyzz*x + v1*v406 + v10*v349 + v118*(M_xyzz + v125 + v129 + &
      v130) + v215*v56 + v217*v56 + v218*v56 + v219*v61 + v228*v43 + &
      v230*v43 + v232*v43 + v234*v45 + v341*z + v342*z + v343*z + v347* &
      y
    Ms_yyyyyzz = M_yyyyyzz + M_y*v406 + M_yyy*v234 + M_yyyyy*v56 + M_yyyyyz*z + M_yyyyzz* &
      y + M_yyyzz*v43 + v118*(M_yyzz + v146) + v149*v316 + v219*v368 + &
      v249*v56 + v250*v27*v427 + v256*v43 + v26*v340 + v363*z
    h          = v20 + v27 + v8
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
    v77        = c3
    v417       = 0.0833333333333333d0*v77
    v425       = 0.0277777777777778d0*v77
    v136       = 0.166666666666667d0*v77
    v264       = v417
    v334       = v417*v8
    v353       = v20*v417
    v370       = v425
    v397       = M_z*v425
    Ms_zzz     = v76 + M_z*v56 + v30*v77
    Ms_xzzz    = v1*v136 + v15*v56 + v133 + v134 + v135
    Ms_yzzz    = v136*v3 + v22*v56 + v154 + v155 + v156
    Ms_xxzzz   = M_xxzzz + v212 + v213 + v214 + M_z*v211 + M_zzz*v32 + v136*v6 + v196*v77 &
      + v204*v27 + v32*v75 + v38*v56
    Ms_xyzzz   = v13*v136 + v131*z + v243*v56 + v238 + v239 + v240 + v241
    Ms_yyzzz   = M_yyzzz + v261 + v262 + v263 + M_yyz*v56 + M_z*v234 + M_zzz*v43 + v136* &
      v19 + v152*v264 + v43*v75 + v56*v65
    Ms_xxxzzz  = M_xxxzzz + v309 + M_xxxzz*z + M_xz*v211 + M_xzzz*v32 + M_zzz*v81 + v134* &
      v32 + v136*v28 + v190*z + v27*v303 + v296*v77 + v298*v77 + v310*( &
      v14 + v16) + v56*v89 + v75*v81
    Ms_xxyzzz  = M_xxyzzz + v331 + v332 + v333 + M_xxyzz*z + M_yzzz*v32 + v103*v56 + v104 &
      *v56 + v106*v56 + v136*v37 + v153*v32 + v155*v32 + v156*v32 + &
      v206*z + v207*z + v210*z + v211*v22 + v27*v321 + v3*v334
    Ms_xyyzzz  = M_xyyzzz + v350 + v351 + v352 + M_xyyz*v56 + M_xyyzz*z + M_xzzz*v43 + v1 &
      *v353 + v121*v56 + v122*v56 + v124*v56 + v132*v43 + v134*v43 + &
      v135*v43 + v136*v48 + v15*v234 + v229*z + v230*z + v233*z
    Ms_yyyzzz  = M_yyyzzz + v369 + M_yyy*v136 + M_yyyz*v56 + M_yyyzz*z + M_yz*v234 + &
      M_yzzz*v43 + M_zzz*v118 + v118*v75 + v136*v62 + v141*v56 + v155* &
      v43 + v257*z + v260*v370 + v371*(v21 + v23)
    Ms_xxxxzzz = M_xxxxzzz + M_xxxxzz*z + M_xxxzzz*x + M_xxz*v211 + M_xxzzz*v32 + M_xzzz* &
      v81 + M_z*v388 + v134*v81 + v136*v78 + v162*v76 + v170*v56 + v212 &
      *v32 + v27*v387 + v284*v370 + v291*z + v310*(v38 + v40) + v383* &
      v77 + v385*v77
    Ms_xxxyzzz = M_xxxyzzz + M_xxxyzz*z + M_xxxzzz*y + M_xxyzzz*x + M_xyzzz*v32 + M_yzzz* &
      v81 + v136*v82 + v136*v84 + v136*v85 + v153*v81 + v155*v81 + v156 &
      *v81 + v181*v56 + v183*v56 + v185*v56 + v186*v211 + v235*v32 + &
      v239*v32 + v240*v32 + v27*v394 + v3*v31*v370 + v305*z + v306*z + &
      v307*z + v309*y + v310*(v187 + v242) + v389*v77
    Ms_xxyyzzz = M_xxyyzzz + M_xxyyzz*z + M_xxyzzz*y + M_xxz*v234 + M_xyyzzz*x + M_yyz* &
      v211 + M_yyzzz*v32 + M_zzz*v197 + v136*v96 + v197*v75 + v199*v56 &
      + v20*v403*v77 + v20*v404 + v200*v56 + v203*v56 + v211*v65 + v212 &
      *v43 + v213*v43 + v214*v43 + v234*v38 + v261*v32 + v262*v32 + &
      v263*v32 + v264*(v327 + v328 + v97 + v98) + v27*v400 + v323*z + &
      v324*z + v325*z + v330*v336 + v332*y
    Ms_xyyyzzz = M_xyyyzzz + M_xyyy*v136 + M_xyyyz*v56 + M_xyyyzz*z + M_xyyzzz*y + &
      M_xyzzz*v43 + M_xzzz*v118 + M_yyyzzz*x + v1*v370*v64 + v114*v136 &
      + v116*v136 + v117*v136 + v118*v132 + v118*v134 + v118*v135 + &
      v221*v56 + v223*v56 + v225*v56 + v226*v234 + v236*v43 + v239*v43 &
      + v241*v43 + v346*z + v347*z + v348*z + v351*y + v371*(v51 + v52 &
      + v55)
    Ms_yyyyzzz = 0.00694444444444444d0*(v366*v77) + M_yyyy*v136 + M_yyyyz*v56 + M_yyyyzz* &
      z + M_yyyyzzz + M_yyyzzz*y + M_yyz*v234 + M_yyzzz*v43 + M_yzzz* &
      v118 + M_z*v406 + v118*v155 + v136*v137 + v219*v76 + v253*v56 + &
      v261*v43 + v364*z + v367*v370 + v371*(v65 + v67)
    c4         = c2*c2
    v158       = c4
    v426       = 0.0208333333333333d0*v158
    v248       = 0.0416666666666667d0*v158
    v373       = v426
    v407       = v20*v426
    Ms_zzzz    = M_zzzz + v157 + M_z*v136 + M_zz*v56 + v158*v79
    Ms_xzzzz   = v245 + v246 + v247 + v1*v248 + v136*v15 + v56*v58
    Ms_yzzzz   = v266 + v267 + v268 + v136*v22 + v248*v3 + v56*v71
    Ms_xxzzzz  = M_xxzzzz + v335 + M_xxzzz*z + M_zzzz*v32 + v107*v56 + v113*v151 + v136* &
      v39 + v157*v32 + v158*v315 + v213*z + v248*v6 + v264*v336 + v27* &
      v326
    Ms_xyzzzz  = M_xyzzzz + v354 + v355 + v356 + M_xyzzz*z + v13*v248 + v136*v243 + v235* &
      z + v236*z + v237*z + v358*v56
    Ms_yyzzzz  = M_yyzzzz + v372 + M_yyzz*v56 + M_yyzzz*z + M_z*v353 + M_zzzz*v43 + v136* &
      v66 + v144*v56 + v150*v151 + v152*v373 + v157*v43 + v19*v248 + &
      v262*z
    Ms_xxxzzzz = M_xxxzzzz + M_xxxzzz*z + M_xxzzzz*x + M_xzz*v211 + M_xzzzz*v32 + M_zzzz* &
      v81 + v136*v89 + v157*v81 + v158*v391 + v179*v373 + v190*v56 + &
      v246*v32 + v248*v29 + v27*v396 + v309*z + v31*v397 + v310*(v57 + &
      v59) + v395*v77
    Ms_xxyzzzz = M_xxyzzzz + M_xxyzzz*z + M_xxzzzz*y + M_xyzzzz*x + M_yzzzz*v32 + v136*( &
      v401 + v431) + v206*v56 + v207*v56 + v210*v56 + v211*v71 + v22* &
      v334 + v248*v37 + v265*v32 + v267*v32 + v268*v32 + v27*v402 + v3* &
      v373*v8 + v331*z + v332*z + v333*z + v335*y
    Ms_xyyzzzz = M_xyyzzzz + M_xyyzz*v56 + M_xyyzzz*z + M_xyzzzz*y + M_xzzzz*v43 + &
      M_yyzzzz*x + v1*v407 + v136*(v344 + v432) + v15*v353 + v229*v56 + &
      v230*v56 + v233*v56 + v234*v58 + v244*v43 + v246*v43 + v247*v43 + &
      v248*v48 + v350*z + v351*z + v352*z + v355*y
    Ms_yyyzzzz = 0.00694444444444444d0*(v158*v260) + M_y*v407 + M_yyyz*v136 + M_yyyzz*v56 &
      + M_yyyzzz*z + M_yyyzzzz + M_yyzzzz*y + M_yzz*v234 + M_yzzzz*v43 &
      + M_zzzz*v118 + v118*v157 + v136*v141 + v248*v63 + v257*v56 + &
      v267*v43 + v369*z + v371*(v70 + v72) + v397*v64
    c5         = c2*c3
    v270       = c5
    v360       = 0.00833333333333333d0*v270
    Ms_zzzzz   = M_zzzzz + v269 + M_z*v248 + M_zz*v136 + M_zzz*v56 + v160*v270
    Ms_xzzzzz  = M_xzzzzz + v359 + M_xzzzz*z + v1*v360 + v133*v56 + v136*v58 + v15*v248 + &
      v244*z
    Ms_yzzzzz  = M_yzzzzz + v374 + M_yzzzz*z + v136*v71 + v154*v56 + v22*v248 + v265*z + &
      v3*v360
    Ms_xxzzzzz = M_xxzzzzz + M_xxzzzz*z + M_xzzzzz*x + M_zzz*v211 + M_zzzzz*v32 + v108* &
      v136 + v113*v264 + v213*v56 + v248*v39 + v269*v32 + v27*v404 + &
      v270*v399 + v335*z + v336*v373 + v360*v6
    Ms_xyzzzzz = M_xyzzzzz + M_xyzzzz*z + M_xzzzzz*y + M_yzzzzz*x + v13*v360 + v136*v358 &
      + v238*v56 + v243*v248 + v354*z + v355*z + v356*z + v359*y
    Ms_yyzzzzz = 0.00416666666666667d0*(v152*v270) + M_yyzzz*v56 + M_yyzzzz*z + M_yyzzzzz &
      + M_yzzzzz*y + M_z*v407 + M_zzz*v234 + M_zzzzz*v43 + v136*v145 + &
      v150*v264 + v19*v360 + v248*v66 + v262*v56 + v269*v43 + v372*z
    c6         = c3*c3
    v375       = c6
    v408       = 0.00138888888888889d0*v375
    Ms_zzzzzz  = M_zzzzzz + M_z*v360 + M_zz*v248 + M_zzz*v136 + M_zzzz*v56 + M_zzzzz*z + &
      v272*v375
    Ms_xzzzzzz = M_xzzzzzz + M_xzzzzz*z + M_zzzzzz*x + v1*v408 + v133*v136 + v15*v360 + &
      v245*v56 + v248*v58 + v359*z
    Ms_yzzzzzz = M_yzzzzzz + M_yzzzzz*z + M_zzzzzz*y + v136*v154 + v22*v360 + v248*v71 + &
      v266*v56 + v3*v408 + v374*z
    c7         = c3*c4
    Ms_zzzzzzz = M_zzzzzzz + M_z*v408 + M_zz*v360 + M_zzz*v248 + M_zzzz*v136 + M_zzzzz* &
      v56 + M_zzzzzz*z + c7*v376
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
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
#undef  Ms_xyy              
#undef  M_xyy               
#undef  M_xyz               
#undef  Ms_xyz              
#undef  M_xzz               
#undef  Ms_xzz              
#undef  Ms_yyy              
#undef  M_yyy               
#undef  M_yyz               
#undef  Ms_yyz              
#undef  M_yzz               
#undef  Ms_yzz              
#undef  Ms_zzz              
#undef  M_zzz               
#undef  Ms_xxxx             
#undef  M_xxxx              
#undef  Ms_xxxy             
#undef  M_xxxy              
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
#undef  Ms_xzzz             
#undef  M_xzzz              
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  Ms_yyyz             
#undef  M_yyyz              
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
#undef  M_xxxyy             
#undef  Ms_xxxyy            
#undef  Ms_xxxyz            
#undef  M_xxxyz             
#undef  M_xxxzz             
#undef  Ms_xxxzz            
#undef  M_xxyyy             
#undef  Ms_xxyyy            
#undef  Ms_xxyyz            
#undef  M_xxyyz             
#undef  Ms_xxyzz            
#undef  M_xxyzz             
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
#undef  M_xzzzz             
#undef  Ms_xzzzz            
#undef  Ms_yyyyy            
#undef  M_yyyyy             
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
#undef  M_xxxxzz            
#undef  Ms_xxxxzz           
#undef  M_xxxyyy            
#undef  Ms_xxxyyy           
#undef  Ms_xxxyyz           
#undef  M_xxxyyz            
#undef  Ms_xxxyzz           
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  Ms_xxxzzz           
#undef  Ms_xxyyyy           
#undef  M_xxyyyy            
#undef  Ms_xxyyyz           
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  Ms_xxyyzz           
#undef  Ms_xxyzzz           
#undef  M_xxyzzz            
#undef  M_xxzzzz            
#undef  Ms_xxzzzz           
#undef  M_xyyyyy            
#undef  Ms_xyyyyy           
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  Ms_xyyyzz           
#undef  M_xyyzzz            
#undef  Ms_xyyzzz           
#undef  M_xyzzzz            
#undef  Ms_xyzzzz           
#undef  Ms_xzzzzz           
#undef  M_xzzzzz            
#undef  Ms_yyyyyy           
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  Ms_yyyyyz           
#undef  Ms_yyyyzz           
#undef  M_yyyyzz            
#undef  Ms_yyyzzz           
#undef  M_yyyzzz            
#undef  M_yyzzzz            
#undef  Ms_yyzzzz           
#undef  M_yzzzzz            
#undef  Ms_yzzzzz           
#undef  Ms_zzzzzz           
#undef  M_zzzzzz            
#undef  M_xxxxxxx           
#undef  Ms_xxxxxxx          
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  Ms_xxxxxxz          
#undef  M_xxxxxyy           
#undef  Ms_xxxxxyy          
#undef  M_xxxxxyz           
#undef  Ms_xxxxxyz          
#undef  Ms_xxxxxzz          
#undef  M_xxxxxzz           
#undef  Ms_xxxxyyy          
#undef  M_xxxxyyy           
#undef  Ms_xxxxyyz          
#undef  M_xxxxyyz           
#undef  Ms_xxxxyzz          
#undef  M_xxxxyzz           
#undef  M_xxxxzzz           
#undef  Ms_xxxxzzz          
#undef  Ms_xxxyyyy          
#undef  M_xxxyyyy           
#undef  Ms_xxxyyyz          
#undef  M_xxxyyyz           
#undef  Ms_xxxyyzz          
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  Ms_xxxyzzz          
#undef  Ms_xxxzzzz          
#undef  M_xxxzzzz           
#undef  Ms_xxyyyyy          
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  Ms_xxyyyyz          
#undef  Ms_xxyyyzz          
#undef  M_xxyyyzz           
#undef  Ms_xxyyzzz          
#undef  M_xxyyzzz           
#undef  Ms_xxyzzzz          
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  Ms_xxzzzzz          
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyyz          
#undef  Ms_xyyyyzz          
#undef  M_xyyyyzz           
#undef  Ms_xyyyzzz          
#undef  M_xyyyzzz           
#undef  Ms_xyyzzzz          
#undef  M_xyyzzzz           
#undef  M_xyzzzzz           
#undef  Ms_xyzzzzz          
#undef  Ms_xzzzzzz          
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  Ms_yyyyyyy          
#undef  Ms_yyyyyyz          
#undef  M_yyyyyyz           
#undef  Ms_yyyyyzz          
#undef  M_yyyyyzz           
#undef  Ms_yyyyzzz          
#undef  M_yyyyzzz           
#undef  Ms_yyyzzzz          
#undef  M_yyyzzzz           
#undef  M_yyzzzzz           
#undef  Ms_yyzzzzz          
#undef  Ms_yzzzzzz          
#undef  M_yzzzzzz           
#undef  Ms_zzzzzzz          
#undef  M_zzzzzzz           
    end subroutine mom_es_M2M
    
! OPS  1265*ADD + 2*DIV + 1496*MUL + 82*NEG + POW + 35*SUB = 2881  (3828 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h,&
                u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz,&
                D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz,&
                D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
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
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz
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
#define M_zz                 M(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define M_xxx                M(10)
#define L_xxz                L(11)
#define M_xxy                M(11)
#define L_xyy                L(12)
#define M_xxz                M(12)
#define L_xyz                L(13)
#define M_xyy                M(13)
#define L_yyy                L(14)
#define M_xyz                M(14)
#define M_xzz                M(15)
#define L_yyz                L(15)
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
#define M_xyzz               M(28)
#define L_xxxyy              L(28)
#define M_xzzz               M(29)
#define L_xxxyz              L(29)
#define L_xxyyy              L(30)
#define M_yyyy               M(30)
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
#define L_xxxxxx             L(36)
#define M_xxxxy              M(36)
#define L_xxxxxy             L(37)
#define M_xxxxz              M(37)
#define M_xxxyy              M(38)
#define L_xxxxxz             L(38)
#define M_xxxyz              M(39)
#define L_xxxxyy             L(39)
#define L_xxxxyz             L(40)
#define M_xxxzz              M(40)
#define L_xxxyyy             L(41)
#define M_xxyyy              M(41)
#define M_xxyyz              M(42)
#define L_xxxyyz             L(42)
#define M_xxyzz              M(43)
#define L_xxyyyy             L(43)
#define L_xxyyyz             L(44)
#define M_xxzzz              M(44)
#define L_xyyyyy             L(45)
#define M_xyyyy              M(45)
#define L_xyyyyz             L(46)
#define M_xyyyz              M(46)
#define L_yyyyyy             L(47)
#define M_xyyzz              M(47)
#define L_yyyyyz             L(48)
#define M_xyzzz              M(48)
#define L_xxxxxxx            L(49)
#define M_xzzzz              M(49)
#define L_xxxxxxy            L(50)
#define M_yyyyy              M(50)
#define M_yyyyz              M(51)
#define L_xxxxxxz            L(51)
#define M_yyyzz              M(52)
#define L_xxxxxyy            L(52)
#define L_xxxxxyz            L(53)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define L_xxxxyyy            L(54)
#define M_zzzzz              M(55)
#define L_xxxxyyz            L(55)
#define L_xxxyyyy            L(56)
#define M_xxxxxx             M(56)
#define L_xxxyyyz            L(57)
#define M_xxxxxy             M(57)
#define L_xxyyyyy            L(58)
#define M_xxxxxz             M(58)
#define M_xxxxyy             M(59)
#define L_xxyyyyz            L(59)
#define M_xxxxyz             M(60)
#define L_xyyyyyy            L(60)
#define M_xxxxzz             M(61)
#define L_xyyyyyz            L(61)
#define M_xxxyyy             M(62)
#define L_yyyyyyy            L(62)
#define L_yyyyyyz            L(63)
#define M_xxxyyz             M(63)
#define M_xxxyzz             M(64)
#define M_xxxzzz             M(65)
#define M_xxyyyy             M(66)
#define M_xxyyyz             M(67)
#define M_xxyyzz             M(68)
#define M_xxyzzz             M(69)
#define M_xxzzzz             M(70)
#define M_xyyyyy             M(71)
#define M_xyyyyz             M(72)
#define M_xyyyzz             M(73)
#define M_xyyzzz             M(74)
#define M_xyzzzz             M(75)
#define M_xzzzzz             M(76)
#define M_yyyyyy             M(77)
#define M_yyyyyz             M(78)
#define M_yyyyzz             M(79)
#define M_yyyzzz             M(80)
#define M_yyzzzz             M(81)
#define M_yzzzzz             M(82)
#define M_zzzzzz             M(83)
#define M_xxxxxxx            M(84)
#define M_xxxxxxy            M(85)
#define M_xxxxxxz            M(86)
#define M_xxxxxyy            M(87)
#define M_xxxxxyz            M(88)
#define M_xxxxxzz            M(89)
#define M_xxxxyyy            M(90)
#define M_xxxxyyz            M(91)
#define M_xxxxyzz            M(92)
#define M_xxxxzzz            M(93)
#define M_xxxyyyy            M(94)
#define M_xxxyyyz            M(95)
#define M_xxxyyzz            M(96)
#define M_xxxyzzz            M(97)
#define M_xxxzzzz            M(98)
#define M_xxyyyyy            M(99)
#define M_xxyyyyz            M(100)
#define M_xxyyyzz            M(101)
#define M_xxyyzzz            M(102)
#define M_xxyzzzz            M(103)
#define M_xxzzzzz            M(104)
#define M_xyyyyyy            M(105)
#define M_xyyyyyz            M(106)
#define M_xyyyyzz            M(107)
#define M_xyyyzzz            M(108)
#define M_xyyzzzz            M(109)
#define M_xyzzzzz            M(110)
#define M_xzzzzzz            M(111)
#define M_yyyyyyy            M(112)
#define M_yyyyyyz            M(113)
#define M_yyyyyzz            M(114)
#define M_yyyyzzz            M(115)
#define M_yyyzzzz            M(116)
#define M_yyzzzzz            M(117)
#define M_yzzzzzz            M(118)
#define M_zzzzzzz            M(119)
    v110      = y*z
    v111      = 945.0d0*x
    v103      = 15.0d0*v110
    v107      = v110
    v61       = v111
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v93       = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v93
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
    v94       = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v94
    v29       = 7.0d0*v1
    v59       = v1*v19
    v80       = -429.0d0*v59
    b3        = b1*b2
    b4        = b2*b2
    v31       = b4
    v66       = v0*v31
    v67       = 33.0d0*v31
    v89       = 143.0d0*v31
    v90       = -429.0d0*v66
    b5        = b2*b3
    b6        = b3*b3
    v69       = b6
    v91       = -429.0d0*v69
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v0 + v1
    v95       = 3.0d0*h
    v96       = h*v0
    v97       = h*v1
    v98       = h*v19
    v99       = h*v31
    v4        = -h
    v12       = v95
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v96
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v97
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v96
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 - 945.0d0*v31 + 630.0d0*v97
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v98
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v96
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v99
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v83       = -18.0d0*v51 + v46 + v79
    v84       = 66.0d0*v57
    v109      = -v84
    v85       = 9.0d0*v17
    v86       = 198.0d0*v57
    v87       = h*v67
    v88       = -18.0d0*v65 + v46 + v87
    v92       = v47 + v91 - 135.0d0*v65 + 495.0d0*v70
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
    v100      = 3.0d0*v3
    v6        = v100*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v100*v107
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v101      = 3.0d0*v8
    v9        = v8*x
    v11       = v101*(h - v10)
    D_xxx     = -3.0d0*v9*(v93 - v95)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    D_xyz     = -v103*v9
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = v101*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v102      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v102*y
    v26       = v102*z
    v28       = v103*v15
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    D_xyyy    = v22*v30
    D_xyyz    = v26*(v29 + v4)
    D_xyzz    = -(D_xxxy + D_xyyy)
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v104      = 15.0d0*v34
    v105      = v34*z
    v35       = v104*x
    v39       = v105
    v41       = 315.0d0*v105*x*y
    v42       = v104*y
    D_xxxxx   = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy   = v34*v38*y
    D_xxxxz   = v38*v39
    D_xxxyy   = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz   = v41*(h - v5)
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    D_xxyyy   = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz   = v39*(v36 - 945.0d0*v94 + 105.0d0*(v96 + v97))
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    D_xyyyy   = v34*v43*x
    D_xyyyz   = v41*(h - v7)
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
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
    v112      = 315.0d0*v44
    v106      = v112*x
    v45       = 45.0d0*v44
    v52       = v106*y
    v56       = v106*z
    v60       = v107*v112
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy  = v52*v55
    D_xxxxxz  = v55*v56
    D_xxxxyy  = v45*(v58 + v17*v29 + 14.0d0*v51 + 231.0d0*v59 - 21.0d0*v98)
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy  = v45*(v58 + v17*v24 + 14.0d0*v65 + 231.0d0*v66 - 21.0d0*v99)
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy  = v52*v68
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    D_yyyyyz  = v60*v68
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v108      = 315.0d0*v71
    v72       = v108*x
    v75       = v108*y
    v77       = v108*z
    v81       = v107*v111*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = v75*v76
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = v76*v77
    L_xxxxxx  = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxy  = D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxy*M_xy + D_xxxxxxz &
      *M_xz + D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + D_xxxxxzz*M_zz
    L_xxxxxz  = D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z
    D_xxxxyyy = -945.0d0*v71*y*(v109 + v1*v18 + v1*v82 - v83)
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = v77*(-v1*v85 + v80 + v83 + v86)
    L_xxxxyy  = D_xxxxxyy*M_x + D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyz*M_z
    L_xxxxyyz = D_xxxxyyz*M_0
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    L_xxxxy   = D_xxxxxxy*M_xx + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + &
      D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyz*M_yz + &
      D_xxxxyz*M_z + D_xxxxyzz*M_zz
    L_xxxxyz  = D_xxxxxyz*M_x + D_xxxxyyz*M_y + D_xxxxyz*M_0 + D_xxxxyzz*M_z
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    L_xxxx    = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxy* &
      M_xxy + D_xxxxxxz*M_xxz + D_xxxxxy*M_xy + D_xxxxxyy*M_xyy + &
      D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxy*M_y + &
      D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + D_xxxxyyz*M_yyz + D_xxxxyz*M_yz &
      + D_xxxxyzz*M_yzz + D_xxxxz*M_z + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz
    L_xxxxz   = D_xxxxxxz*M_xx + D_xxxxxyz*M_xy + D_xxxxxz*M_x + D_xxxxxzz*M_xz + &
      D_xxxxyyz*M_yy + D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + &
      D_xxxxzz*M_z + D_xxxxzzz*M_zz
    D_xxxyyyy = -v61*v71*(v109 + v0*v18 + v0*v89 - v88)
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v85))
    L_xxxyyy  = D_xxxxyyy*M_x + D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyz*M_z
    L_xxxyyyz = D_xxxyyyz*M_0
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    L_xxxyy   = D_xxxxxyy*M_xx + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + &
      D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyz*M_yz + &
      D_xxxyyz*M_z + D_xxxyyzz*M_zz
    L_xxxyyz  = D_xxxxyyz*M_x + D_xxxyyyz*M_y + D_xxxyyz*M_0 + D_xxxyyzz*M_z
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    L_xxxy    = D_xxxxxxy*M_xxx + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + D_xxxxxyz*M_xxz + &
      D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyyy*M_xyy + D_xxxxyyz*M_xyz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxy*M_0 + D_xxxyy*M_y + &
      D_xxxyyy*M_yy + D_xxxyyyy*M_yyy + D_xxxyyyz*M_yyz + D_xxxyyz*M_yz &
      + D_xxxyyzz*M_yzz + D_xxxyz*M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz
    L_xxxyz   = D_xxxxxyz*M_xx + D_xxxxyyz*M_xy + D_xxxxyz*M_x + D_xxxxyzz*M_xz + &
      D_xxxyyyz*M_yy + D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + &
      D_xxxyzz*M_z + D_xxxyzzz*M_zz
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    L_xxx     = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxy*M_xxxy + D_xxxxxxz*M_xxxz + D_xxxxxy*M_xxy + &
      D_xxxxxyy*M_xxyy + D_xxxxxyz*M_xxyz + D_xxxxxz*M_xxz + D_xxxxxzz* &
      M_xxzz + D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyyy*M_xyyy + &
      D_xxxxyyz*M_xyyz + D_xxxxyz*M_xyz + D_xxxxyzz*M_xyzz + D_xxxxz* &
      M_xz + D_xxxxzz*M_xzz + D_xxxxzzz*M_xzzz + D_xxxy*M_y + D_xxxyy* &
      M_yy + D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyz*M_yyyz + &
      D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + D_xxxyz*M_yz + D_xxxyzz*M_yzz &
      + D_xxxyzzz*M_yzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz + &
      D_xxxzzzz*M_zzzz
    L_xxxz    = D_xxxxxxz*M_xxx + D_xxxxxyz*M_xxy + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + &
      D_xxxxyyz*M_xyy + D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxz*M_x + &
      D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxyyyz*M_yyy + D_xxxyyz*M_yy &
      + D_xxxyyzz*M_yyz + D_xxxyz*M_y + D_xxxyzz*M_yz + D_xxxyzzz*M_yzz &
      + D_xxxz*M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz
    D_xxyyyyy = v75*(-45.0d0*v51 - 30.0d0*v65 + v78 + v87 + v90)
    L_xxyyyyy = D_xxyyyyy*M_0
    D_xxyyyyz = v77*(-v0*v85 + v86 + v88 + v90)
    L_xxyyyy  = D_xxxyyyy*M_x + D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyz*M_z
    L_xxyyyyz = D_xxyyyyz*M_0
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    L_xxyyy   = D_xxxxyyy*M_xx + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + &
      D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyz*M_yz + &
      D_xxyyyz*M_z + D_xxyyyzz*M_zz
    L_xxyyyz  = D_xxxyyyz*M_x + D_xxyyyyz*M_y + D_xxyyyz*M_0 + D_xxyyyzz*M_z
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    L_xxyy    = D_xxxxxyy*M_xxx + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + D_xxxxyyz*M_xxz + &
      D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyyy*M_xyy + D_xxxyyyz*M_xyz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxyy*M_0 + D_xxyyy*M_y + &
      D_xxyyyy*M_yy + D_xxyyyyy*M_yyy + D_xxyyyyz*M_yyz + D_xxyyyz*M_yz &
      + D_xxyyyzz*M_yzz + D_xxyyz*M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz
    L_xxyyz   = D_xxxxyyz*M_xx + D_xxxyyyz*M_xy + D_xxxyyz*M_x + D_xxxyyzz*M_xz + &
      D_xxyyyyz*M_yy + D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + &
      D_xxyyzz*M_z + D_xxyyzzz*M_zz
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    L_xxy     = D_xxxxxxy*M_xxxx + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + D_xxxxxyz*M_xxxz &
      + D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyz* &
      M_xxyz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + D_xxxy*M_x + D_xxxyy &
      *M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + D_xxxyyyz*M_xyyz + &
      D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + D_xxxyz*M_xz + D_xxxyzz*M_xzz &
      + D_xxxyzzz*M_xzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyz*M_yyyz + D_xxyyyz* &
      M_yyz + D_xxyyyzz*M_yyzz + D_xxyyz*M_yz + D_xxyyzz*M_yzz + &
      D_xxyyzzz*M_yzzz + D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz + &
      D_xxyzzzz*M_zzzz
    L_xxyz    = D_xxxxxyz*M_xxx + D_xxxxyyz*M_xxy + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + &
      D_xxxyyyz*M_xyy + D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyz*M_x + &
      D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxyyyyz*M_yyy + D_xxyyyz*M_yy &
      + D_xxyyyzz*M_yyz + D_xxyyz*M_y + D_xxyyzz*M_yz + D_xxyyzzz*M_yzz &
      + D_xxyz*M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    L_xx      = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxy*M_xxxxy + D_xxxxxxz*M_xxxxz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyz*M_xxxyz + &
      D_xxxxxz*M_xxxz + D_xxxxxzz*M_xxxzz + D_xxxxy*M_xxy + D_xxxxyy* &
      M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyz*M_xxyyz + D_xxxxyz*M_xxyz &
      + D_xxxxyzz*M_xxyzz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz &
      *M_xxzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy*M_xyyy + &
      D_xxxyyyy*M_xyyyy + D_xxxyyyz*M_xyyyz + D_xxxyyz*M_xyyz + &
      D_xxxyyzz*M_xyyzz + D_xxxyz*M_xyz + D_xxxyzz*M_xyzz + D_xxxyzzz* &
      M_xyzzz + D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz*M_xzzz + &
      D_xxxzzzz*M_xzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyz*M_yyyyz + &
      D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + D_xxyyz*M_yyz + D_xxyyzz* &
      M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + &
      D_xxyzzz*M_yzzz + D_xxyzzzz*M_yzzzz + D_xxz*M_z + D_xxzz*M_zz + &
      D_xxzzz*M_zzz + D_xxzzzz*M_zzzz + D_xxzzzzz*M_zzzzz
    L_xxz     = D_xxxxxxz*M_xxxx + D_xxxxxyz*M_xxxy + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz &
      + D_xxxxyyz*M_xxyy + D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxz* &
      M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxyyyz*M_xyyy + &
      D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyz*M_xy + D_xxxyzz*M_xyz &
      + D_xxxyzzz*M_xyzz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxxzzz*M_xzz + &
      D_xxxzzzz*M_xzzz + D_xxyyyyz*M_yyyy + D_xxyyyz*M_yyy + D_xxyyyzz* &
      M_yyyz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyyzzz*M_yyzz + &
      D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz + D_xxyzzzz*M_yzzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + &
      D_xxzzzzz*M_zzzz
    D_xyyyyyy = v72*v92
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = v81*(v36 + 110.0d0*v32 - v89)
    L_xyyyyy  = D_xxyyyyy*M_x + D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyz*M_z
    L_xyyyyyz = D_xyyyyyz*M_0
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    L_xyyyy   = D_xxxyyyy*M_xx + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + &
      D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyz*M_yz + &
      D_xyyyyz*M_z + D_xyyyyzz*M_zz
    L_xyyyyz  = D_xxyyyyz*M_x + D_xyyyyyz*M_y + D_xyyyyz*M_0 + D_xyyyyzz*M_z
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    L_xyyy    = D_xxxxyyy*M_xxx + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + D_xxxyyyz*M_xxz + &
      D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyyy*M_xyy + D_xxyyyyz*M_xyz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xyyy*M_0 + D_xyyyy*M_y + &
      D_xyyyyy*M_yy + D_xyyyyyy*M_yyy + D_xyyyyyz*M_yyz + D_xyyyyz*M_yz &
      + D_xyyyyzz*M_yzz + D_xyyyz*M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz
    L_xyyyz   = D_xxxyyyz*M_xx + D_xxyyyyz*M_xy + D_xxyyyz*M_x + D_xxyyyzz*M_xz + &
      D_xyyyyyz*M_yy + D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + &
      D_xyyyzz*M_z + D_xyyyzzz*M_zz
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    L_xyy     = D_xxxxxyy*M_xxxx + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + D_xxxxyyz*M_xxxz &
      + D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyz* &
      M_xxyz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + D_xxyy*M_x + D_xxyyy &
      *M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + D_xxyyyyz*M_xyyz + &
      D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + D_xxyyz*M_xz + D_xxyyzz*M_xzz &
      + D_xxyyzzz*M_xzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyz*M_yyyz + D_xyyyyz* &
      M_yyz + D_xyyyyzz*M_yyzz + D_xyyyz*M_yz + D_xyyyzz*M_yzz + &
      D_xyyyzzz*M_yzzz + D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz + &
      D_xyyzzzz*M_zzzz
    L_xyyz    = D_xxxxyyz*M_xxx + D_xxxyyyz*M_xxy + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + &
      D_xxyyyyz*M_xyy + D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyz*M_x + &
      D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xyyyyyz*M_yyy + D_xyyyyz*M_yy &
      + D_xyyyyzz*M_yyz + D_xyyyz*M_y + D_xyyyzz*M_yz + D_xyyyzzz*M_yzz &
      + D_xyyz*M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    L_xy      = D_xxxxxxy*M_xxxxx + D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + D_xxxxxyz* &
      M_xxxxz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy*M_xxxyy + &
      D_xxxxyyz*M_xxxyz + D_xxxxyz*M_xxxz + D_xxxxyzz*M_xxxzz + D_xxxy* &
      M_xx + D_xxxyy*M_xxy + D_xxxyyy*M_xxyy + D_xxxyyyy*M_xxyyy + &
      D_xxxyyyz*M_xxyyz + D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + D_xxxyz &
      *M_xxz + D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxy*M_x + D_xxyy &
      *M_xy + D_xxyyy*M_xyy + D_xxyyyy*M_xyyy + D_xxyyyyy*M_xyyyy + &
      D_xxyyyyz*M_xyyyz + D_xxyyyz*M_xyyz + D_xxyyyzz*M_xyyzz + D_xxyyz &
      *M_xyz + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyz*M_xz + &
      D_xxyzz*M_xzz + D_xxyzzz*M_xzzz + D_xxyzzzz*M_xzzzz + D_xy*M_0 + &
      D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + D_xyyyyy*M_yyyy + &
      D_xyyyyyy*M_yyyyy + D_xyyyyyz*M_yyyyz + D_xyyyyz*M_yyyz + &
      D_xyyyyzz*M_yyyzz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz* &
      M_yyzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz*M_yzzz + &
      D_xyyzzzz*M_yzzzz + D_xyz*M_z + D_xyzz*M_zz + D_xyzzz*M_zzz + &
      D_xyzzzz*M_zzzz + D_xyzzzzz*M_zzzzz
    L_xyz     = D_xxxxxyz*M_xxxx + D_xxxxyyz*M_xxxy + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz &
      + D_xxxyyyz*M_xxyy + D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyz* &
      M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxyyyyz*M_xyyy + &
      D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyz*M_xy + D_xxyyzz*M_xyz &
      + D_xxyyzzz*M_xyzz + D_xxyz*M_x + D_xxyzz*M_xz + D_xxyzzz*M_xzz + &
      D_xxyzzzz*M_xzzz + D_xyyyyyz*M_yyyy + D_xyyyyz*M_yyy + D_xyyyyzz* &
      M_yyyz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyyzzz*M_yyzz + &
      D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz + D_xyyzzzz*M_yzzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + &
      D_xyzzzzz*M_zzzz
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    L_x       = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxy*M_xxxxxy + &
      D_xxxxxxz*M_xxxxxz + D_xxxxxy*M_xxxxy + D_xxxxxyy*M_xxxxyy + &
      D_xxxxxyz*M_xxxxyz + D_xxxxxz*M_xxxxz + D_xxxxxzz*M_xxxxzz + &
      D_xxxxy*M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + &
      D_xxxxz*M_xxxz + D_xxxxzz*M_xxxzz + D_xxxxzzz*M_xxxzzz + D_xxxy* &
      M_xxy + D_xxxyy*M_xxyy + D_xxxyyy*M_xxyyy + D_xxxyyyy*M_xxyyyy + &
      D_xxxyyyz*M_xxyyyz + D_xxxyyz*M_xxyyz + D_xxxyyzz*M_xxyyzz + &
      D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + D_xxxz* &
      M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxy*M_xy + D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + &
      D_xxyyyyy*M_xyyyyy + D_xxyyyyz*M_xyyyyz + D_xxyyyz*M_xyyyz + &
      D_xxyyyzz*M_xyyyzz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + &
      D_xxyyzzz*M_xyyzzz + D_xxyz*M_xyz + D_xxyzz*M_xyzz + D_xxyzzz* &
      M_xyzzz + D_xxyzzzz*M_xyzzzz + D_xxz*M_xz + D_xxzz*M_xzz + &
      D_xxzzz*M_xzzz + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xy*M_y &
      + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + &
      D_xyyyyyy*M_yyyyyy + D_xyyyyyz*M_yyyyyz + D_xyyyyz*M_yyyyz + &
      D_xyyyyzz*M_yyyyzz + D_xyyyz*M_yyyz + D_xyyyzz*M_yyyzz + &
      D_xyyyzzz*M_yyyzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz* &
      M_yyzzz + D_xyyzzzz*M_yyzzzz + D_xyz*M_yz + D_xyzz*M_yzz + &
      D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + D_xz*M_z &
      + D_xzz*M_zz + D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + &
      D_xzzzzzz*M_zzzzzz
    L_xz      = D_xxxxxxz*M_xxxxx + D_xxxxxyz*M_xxxxy + D_xxxxxz*M_xxxx + D_xxxxxzz* &
      M_xxxxz + D_xxxxyyz*M_xxxyy + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz &
      + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxxxzzz*M_xxxzz + D_xxxyyyz &
      *M_xxyyy + D_xxxyyz*M_xxyy + D_xxxyyzz*M_xxyyz + D_xxxyz*M_xxy + &
      D_xxxyzz*M_xxyz + D_xxxyzzz*M_xxyzz + D_xxxz*M_xx + D_xxxzz*M_xxz &
      + D_xxxzzz*M_xxzz + D_xxxzzzz*M_xxzzz + D_xxyyyyz*M_xyyyy + &
      D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyyz*M_xyy + D_xxyyzz* &
      M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyz*M_xy + D_xxyzz*M_xyz + &
      D_xxyzzz*M_xyzz + D_xxyzzzz*M_xyzzz + D_xxz*M_x + D_xxzz*M_xz + &
      D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + D_xxzzzzz*M_xzzzz + D_xyyyyyz* &
      M_yyyyy + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + D_xyyyz*M_yyy + &
      D_xyyyzz*M_yyyz + D_xyyyzzz*M_yyyzz + D_xyyz*M_yy + D_xyyzz*M_yyz &
      + D_xyyzzz*M_yyzz + D_xyyzzzz*M_yyzzz + D_xyz*M_y + D_xyzz*M_yz + &
      D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xyzzzzz*M_yzzzz + D_xz*M_0 + &
      D_xzz*M_z + D_xzzz*M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz + &
      D_xzzzzzz*M_zzzzz
    D_yyyyyyy = v75*(-315.0d0*v65 + 693.0d0*v70 + v73 + v91)
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = v77*v92
    L_yyyyyy  = D_xyyyyyy*M_x + D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyz*M_z
    L_yyyyyyz = D_yyyyyyz*M_0
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    L_yyyyy   = D_xxyyyyy*M_xx + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + &
      D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyz*M_yz + &
      D_yyyyyz*M_z + D_yyyyyzz*M_zz
    L_yyyyyz  = D_xyyyyyz*M_x + D_yyyyyyz*M_y + D_yyyyyz*M_0 + D_yyyyyzz*M_z
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    L_yyyy    = D_xxxyyyy*M_xxx + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + D_xxyyyyz*M_xxz + &
      D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyyy*M_xyy + D_xyyyyyz*M_xyz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_yyyy*M_0 + D_yyyyy*M_y + &
      D_yyyyyy*M_yy + D_yyyyyyy*M_yyy + D_yyyyyyz*M_yyz + D_yyyyyz*M_yz &
      + D_yyyyyzz*M_yzz + D_yyyyz*M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz
    L_yyyyz   = D_xxyyyyz*M_xx + D_xyyyyyz*M_xy + D_xyyyyz*M_x + D_xyyyyzz*M_xz + &
      D_yyyyyyz*M_yy + D_yyyyyz*M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + &
      D_yyyyzz*M_z + D_yyyyzzz*M_zz
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    L_yyy     = D_xxxxyyy*M_xxxx + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + D_xxxyyyz*M_xxxz &
      + D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyz* &
      M_xxyz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + D_xyyy*M_x + D_xyyyy &
      *M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + D_xyyyyyz*M_xyyz + &
      D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + D_xyyyz*M_xz + D_xyyyzz*M_xzz &
      + D_xyyyzzz*M_xzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyz*M_yyyz + D_yyyyyz* &
      M_yyz + D_yyyyyzz*M_yyzz + D_yyyyz*M_yz + D_yyyyzz*M_yzz + &
      D_yyyyzzz*M_yzzz + D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz + &
      D_yyyzzzz*M_zzzz
    L_yyyz    = D_xxxyyyz*M_xxx + D_xxyyyyz*M_xxy + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + &
      D_xyyyyyz*M_xyy + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyz*M_x + &
      D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_yyyyyyz*M_yyy + D_yyyyyz*M_yy &
      + D_yyyyyzz*M_yyz + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyyzzz*M_yzz &
      + D_yyyz*M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    L_yy      = D_xxxxxyy*M_xxxxx + D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + D_xxxxyyz* &
      M_xxxxz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy*M_xxxyy + &
      D_xxxyyyz*M_xxxyz + D_xxxyyz*M_xxxz + D_xxxyyzz*M_xxxzz + D_xxyy* &
      M_xx + D_xxyyy*M_xxy + D_xxyyyy*M_xxyy + D_xxyyyyy*M_xxyyy + &
      D_xxyyyyz*M_xxyyz + D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + D_xxyyz &
      *M_xxz + D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xyy*M_x + D_xyyy &
      *M_xy + D_xyyyy*M_xyy + D_xyyyyy*M_xyyy + D_xyyyyyy*M_xyyyy + &
      D_xyyyyyz*M_xyyyz + D_xyyyyz*M_xyyz + D_xyyyyzz*M_xyyzz + D_xyyyz &
      *M_xyz + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyz*M_xz + &
      D_xyyzz*M_xzz + D_xyyzzz*M_xzzz + D_xyyzzzz*M_xzzzz + D_yy*M_0 + &
      D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + D_yyyyyy*M_yyyy + &
      D_yyyyyyy*M_yyyyy + D_yyyyyyz*M_yyyyz + D_yyyyyz*M_yyyz + &
      D_yyyyyzz*M_yyyzz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz* &
      M_yyzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz*M_yzzz + &
      D_yyyzzzz*M_yzzzz + D_yyz*M_z + D_yyzz*M_zz + D_yyzzz*M_zzz + &
      D_yyzzzz*M_zzzz + D_yyzzzzz*M_zzzzz
    L_yyz     = D_xxxxyyz*M_xxxx + D_xxxyyyz*M_xxxy + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz &
      + D_xxyyyyz*M_xxyy + D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyz* &
      M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xyyyyyz*M_xyyy + &
      D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyz*M_xy + D_xyyyzz*M_xyz &
      + D_xyyyzzz*M_xyzz + D_xyyz*M_x + D_xyyzz*M_xz + D_xyyzzz*M_xzz + &
      D_xyyzzzz*M_xzzz + D_yyyyyyz*M_yyyy + D_yyyyyz*M_yyy + D_yyyyyzz* &
      M_yyyz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyyzzz*M_yyzz + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz + D_yyyzzzz*M_yzzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + &
      D_yyzzzzz*M_zzzz
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    L_y       = D_xxxxxxy*M_xxxxxx + D_xxxxxy*M_xxxxx + D_xxxxxyy*M_xxxxxy + D_xxxxxyz* &
      M_xxxxxz + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyyy*M_xxxxyy &
      + D_xxxxyyz*M_xxxxyz + D_xxxxyz*M_xxxxz + D_xxxxyzz*M_xxxxzz + &
      D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy* &
      M_xxxyyy + D_xxxyyyz*M_xxxyyz + D_xxxyyz*M_xxxyz + D_xxxyyzz* &
      M_xxxyzz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + D_xxxyzzz*M_xxxzzz &
      + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + &
      D_xxyyyyy*M_xxyyyy + D_xxyyyyz*M_xxyyyz + D_xxyyyz*M_xxyyz + &
      D_xxyyyzz*M_xxyyzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz + D_xxyzzz* &
      M_xxzzz + D_xxyzzzz*M_xxzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy* &
      M_xyy + D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + &
      D_xyyyyyz*M_xyyyyz + D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + D_xyyyzzz*M_xyyzzz + D_xyyz* &
      M_xyz + D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + D_xyyzzzz*M_xyzzzz + &
      D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + D_xyzzzz*M_xzzzz + &
      D_xyzzzzz*M_xzzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy* &
      M_yyy + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + &
      D_yyyyyyz*M_yyyyyz + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + &
      D_yyyyz*M_yyyz + D_yyyyzz*M_yyyzz + D_yyyyzzz*M_yyyzzz + D_yyyz* &
      M_yyz + D_yyyzz*M_yyzz + D_yyyzzz*M_yyzzz + D_yyyzzzz*M_yyzzzz + &
      D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + D_yyzzzz*M_yzzzz + &
      D_yyzzzzz*M_yzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + &
      D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz
    L_yz      = D_xxxxxyz*M_xxxxx + D_xxxxyyz*M_xxxxy + D_xxxxyz*M_xxxx + D_xxxxyzz* &
      M_xxxxz + D_xxxyyyz*M_xxxyy + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz &
      + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xxxyzzz*M_xxxzz + D_xxyyyyz &
      *M_xxyyy + D_xxyyyz*M_xxyy + D_xxyyyzz*M_xxyyz + D_xxyyz*M_xxy + &
      D_xxyyzz*M_xxyz + D_xxyyzzz*M_xxyzz + D_xxyz*M_xx + D_xxyzz*M_xxz &
      + D_xxyzzz*M_xxzz + D_xxyzzzz*M_xxzzz + D_xyyyyyz*M_xyyyy + &
      D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyyz*M_xyy + D_xyyyzz* &
      M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyz*M_xy + D_xyyzz*M_xyz + &
      D_xyyzzz*M_xyzz + D_xyyzzzz*M_xyzzz + D_xyz*M_x + D_xyzz*M_xz + &
      D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + D_xyzzzzz*M_xzzzz + D_yyyyyyz* &
      M_yyyyy + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + D_yyyyz*M_yyy + &
      D_yyyyzz*M_yyyz + D_yyyyzzz*M_yyyzz + D_yyyz*M_yy + D_yyyzz*M_yyz &
      + D_yyyzzz*M_yyzz + D_yyyzzzz*M_yyzzz + D_yyz*M_y + D_yyzz*M_yz + &
      D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yyzzzzz*M_yzzzz + D_yz*M_0 + &
      D_yzz*M_z + D_yzzz*M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz + &
      D_yzzzzzz*M_zzzzz
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_0       = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxy* &
      M_xxxxxxy + D_xxxxxxz*M_xxxxxxz + D_xxxxxy*M_xxxxxy + D_xxxxxyy* &
      M_xxxxxyy + D_xxxxxyz*M_xxxxxyz + D_xxxxxz*M_xxxxxz + D_xxxxxzz* &
      M_xxxxxzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyyy* &
      M_xxxxyyy + D_xxxxyyz*M_xxxxyyz + D_xxxxyz*M_xxxxyz + D_xxxxyzz* &
      M_xxxxyzz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxxzzz* &
      M_xxxxzzz + D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + &
      D_xxxyyyy*M_xxxyyyy + D_xxxyyyz*M_xxxyyyz + D_xxxyyz*M_xxxyyz + &
      D_xxxyyzz*M_xxxyyzz + D_xxxyz*M_xxxyz + D_xxxyzz*M_xxxyzz + &
      D_xxxyzzz*M_xxxyzzz + D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + D_xxxzzz* &
      M_xxxzzz + D_xxxzzzz*M_xxxzzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + &
      D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy*M_xxyyyyy + &
      D_xxyyyyz*M_xxyyyyz + D_xxyyyz*M_xxyyyz + D_xxyyyzz*M_xxyyyzz + &
      D_xxyyz*M_xxyyz + D_xxyyzz*M_xxyyzz + D_xxyyzzz*M_xxyyzzz + &
      D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxyzzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xxzzz*M_xxzzz + &
      D_xxzzzz*M_xxzzzz + D_xxzzzzz*M_xxzzzzz + D_xy*M_xy + D_xyy*M_xyy &
      + D_xyyy*M_xyyy + D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyyy &
      *M_xyyyyyy + D_xyyyyyz*M_xyyyyyz + D_xyyyyz*M_xyyyyz + D_xyyyyzz* &
      M_xyyyyzz + D_xyyyz*M_xyyyz + D_xyyyzz*M_xyyyzz + D_xyyyzzz* &
      M_xyyyzzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz + &
      D_xyyzzzz*M_xyyzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz* &
      M_xyzzz + D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + D_xz*M_xz + &
      D_xzz*M_xzz + D_xzzz*M_xzzz + D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz &
      + D_xzzzzzz*M_xzzzzzz + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + &
      D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + D_yyyyyyy* &
      M_yyyyyyy + D_yyyyyyz*M_yyyyyyz + D_yyyyyz*M_yyyyyz + D_yyyyyzz* &
      M_yyyyyzz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + D_yyyyzzz* &
      M_yyyyzzz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + &
      D_yyyzzzz*M_yyyzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + D_yyzzz* &
      M_yyzzz + D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + D_yz*M_yz + &
      D_yzz*M_yzz + D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz &
      + D_yzzzzzz*M_yzzzzzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + &
      D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz*M_zzzzzz + D_zzzzzzz* &
      M_zzzzzzz
    L_z       = D_xxxxxxz*M_xxxxxx + D_xxxxxyz*M_xxxxxy + D_xxxxxz*M_xxxxx + D_xxxxxzz* &
      M_xxxxxz + D_xxxxyyz*M_xxxxyy + D_xxxxyz*M_xxxxy + D_xxxxyzz* &
      M_xxxxyz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + D_xxxxzzz*M_xxxxzz &
      + D_xxxyyyz*M_xxxyyy + D_xxxyyz*M_xxxyy + D_xxxyyzz*M_xxxyyz + &
      D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + D_xxxz* &
      M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz*M_xxxzzz + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyz*M_xxyyy + D_xxyyyzz*M_xxyyyz + &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyz* &
      M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + D_xxyzzzz*M_xxyzzz + &
      D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + D_xxzzzz*M_xxzzz + &
      D_xxzzzzz*M_xxzzzz + D_xyyyyyz*M_xyyyyy + D_xyyyyz*M_xyyyy + &
      D_xyyyyzz*M_xyyyyz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + &
      D_xyyyzzz*M_xyyyzz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyyzzz* &
      M_xyyzz + D_xyyzzzz*M_xyyzzz + D_xyz*M_xy + D_xyzz*M_xyz + &
      D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + D_xyzzzzz*M_xyzzzz + D_xz*M_x &
      + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz*M_xzzzz + &
      D_xzzzzzz*M_xzzzzz + D_yyyyyyz*M_yyyyyy + D_yyyyyz*M_yyyyy + &
      D_yyyyyzz*M_yyyyyz + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + &
      D_yyyyzzz*M_yyyyzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz* &
      M_yyyzz + D_yyyzzzz*M_yyyzzz + D_yyz*M_yy + D_yyzz*M_yyz + &
      D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz*M_yyzzzz + D_yz*M_y &
      + D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + &
      D_yzzzzzz*M_yzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz + D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz
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
#undef  M_zz                
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxx               
#undef  L_xxz               
#undef  M_xxy               
#undef  L_xyy               
#undef  M_xxz               
#undef  L_xyz               
#undef  M_xyy               
#undef  L_yyy               
#undef  M_xyz               
#undef  M_xzz               
#undef  L_yyz               
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
#undef  M_xyzz              
#undef  L_xxxyy             
#undef  M_xzzz              
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  M_yyyy              
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
#undef  L_xxxxxx            
#undef  M_xxxxy             
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxxz            
#undef  M_xxxyz             
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  L_xxxyyy            
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  L_xxxyyz            
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  M_xxzzz             
#undef  L_xyyyyy            
#undef  M_xyyyy             
#undef  L_xyyyyz            
#undef  M_xyyyz             
#undef  L_yyyyyy            
#undef  M_xyyzz             
#undef  L_yyyyyz            
#undef  M_xyzzz             
#undef  L_xxxxxxx           
#undef  M_xzzzz             
#undef  L_xxxxxxy           
#undef  M_yyyyy             
#undef  M_yyyyz             
#undef  L_xxxxxxz           
#undef  M_yyyzz             
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  L_xxxxyyy           
#undef  M_zzzzz             
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  M_xxxxxx            
#undef  L_xxxyyyz           
#undef  M_xxxxxy            
#undef  L_xxyyyyy           
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  L_xxyyyyz           
#undef  M_xxxxyz            
#undef  L_xyyyyyy           
#undef  M_xxxxzz            
#undef  L_xyyyyyz           
#undef  M_xxxyyy            
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_xxxyyz            
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  M_xxyzzz            
#undef  M_xxzzzz            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  M_xyyzzz            
#undef  M_xyzzzz            
#undef  M_xzzzzz            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  M_yyyyzz            
#undef  M_yyyzzz            
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  M_zzzzzz            
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  M_xxxxxzz           
#undef  M_xxxxyyy           
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  M_xxxxzzz           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  M_xxxzzzz           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  M_xxyyyzz           
#undef  M_xxyyzzz           
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  M_xyyyyyy           
#undef  M_xyyyyyz           
#undef  M_xyyyyzz           
#undef  M_xyyyzzz           
#undef  M_xyyzzzz           
#undef  M_xyzzzzz           
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  M_yyyyyyz           
#undef  M_yyyyyzz           
#undef  M_yyyyzzz           
#undef  M_yyyzzzz           
#undef  M_yyzzzzz           
#undef  M_yzzzzzz           
#undef  M_zzzzzzz           
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
    
! OPS  1304*ADD + 2*DIV + 1399*MUL + POW = 2706  (6255 before optimization)
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
                v413, v414, v415, v416, v417, v418, v419, v42, v420, v421,&
                v422, v423, v424, v425, v426, v427, v428, v429, v43, v430,&
                v431, v432, v433, v434, v435, v436, v437, v44, v45, v46, v47,&
                v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57, v58,&
                v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v7,&
                v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8, v80,&
                v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90, v91,&
                v92, v93, v94, v95, v96, v97, v98, v99, h, u
#define M_0                  M(0)
#define y                    r(2)
#define Ms_0                 Ms(0)
#define z                    r(3)
#define x                    r(1)
#define M_x                  M(1)
#define Ms_x                 Ms(1)
#define Ms_y                 Ms(2)
#define M_y                  M(2)
#define Ms_z                 Ms(3)
#define M_z                  M(3)
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
#define Ms_xyy               Ms(13)
#define M_xyy                M(13)
#define M_xyz                M(14)
#define Ms_xyz               Ms(14)
#define M_xzz                M(15)
#define Ms_xzz               Ms(15)
#define Ms_yyy               Ms(16)
#define M_yyy                M(16)
#define M_yyz                M(17)
#define Ms_yyz               Ms(17)
#define M_yzz                M(18)
#define Ms_yzz               Ms(18)
#define Ms_zzz               Ms(19)
#define M_zzz                M(19)
#define Ms_xxxx              Ms(20)
#define M_xxxx               M(20)
#define Ms_xxxy              Ms(21)
#define M_xxxy               M(21)
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
#define Ms_xzzz              Ms(29)
#define M_xzzz               M(29)
#define Ms_yyyy              Ms(30)
#define M_yyyy               M(30)
#define Ms_yyyz              Ms(31)
#define M_yyyz               M(31)
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
#define M_xxxyy              M(38)
#define Ms_xxxyy             Ms(38)
#define Ms_xxxyz             Ms(39)
#define M_xxxyz              M(39)
#define M_xxxzz              M(40)
#define Ms_xxxzz             Ms(40)
#define M_xxyyy              M(41)
#define Ms_xxyyy             Ms(41)
#define Ms_xxyyz             Ms(42)
#define M_xxyyz              M(42)
#define Ms_xxyzz             Ms(43)
#define M_xxyzz              M(43)
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
#define M_xzzzz              M(49)
#define Ms_xzzzz             Ms(49)
#define Ms_yyyyy             Ms(50)
#define M_yyyyy              M(50)
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
#define Ms_xxxxxx            Ms(56)
#define M_xxxxxx             M(56)
#define Ms_xxxxxy            Ms(57)
#define M_xxxxxy             M(57)
#define Ms_xxxxxz            Ms(58)
#define M_xxxxxz             M(58)
#define Ms_xxxxyy            Ms(59)
#define M_xxxxyy             M(59)
#define Ms_xxxxyz            Ms(60)
#define M_xxxxyz             M(60)
#define M_xxxxzz             M(61)
#define Ms_xxxxzz            Ms(61)
#define M_xxxyyy             M(62)
#define Ms_xxxyyy            Ms(62)
#define Ms_xxxyyz            Ms(63)
#define M_xxxyyz             M(63)
#define Ms_xxxyzz            Ms(64)
#define M_xxxyzz             M(64)
#define M_xxxzzz             M(65)
#define Ms_xxxzzz            Ms(65)
#define Ms_xxyyyy            Ms(66)
#define M_xxyyyy             M(66)
#define Ms_xxyyyz            Ms(67)
#define M_xxyyyz             M(67)
#define M_xxyyzz             M(68)
#define Ms_xxyyzz            Ms(68)
#define Ms_xxyzzz            Ms(69)
#define M_xxyzzz             M(69)
#define M_xxzzzz             M(70)
#define Ms_xxzzzz            Ms(70)
#define M_xyyyyy             M(71)
#define Ms_xyyyyy            Ms(71)
#define Ms_xyyyyz            Ms(72)
#define M_xyyyyz             M(72)
#define M_xyyyzz             M(73)
#define Ms_xyyyzz            Ms(73)
#define M_xyyzzz             M(74)
#define Ms_xyyzzz            Ms(74)
#define M_xyzzzz             M(75)
#define Ms_xyzzzz            Ms(75)
#define Ms_xzzzzz            Ms(76)
#define M_xzzzzz             M(76)
#define Ms_yyyyyy            Ms(77)
#define M_yyyyyy             M(77)
#define M_yyyyyz             M(78)
#define Ms_yyyyyz            Ms(78)
#define Ms_yyyyzz            Ms(79)
#define M_yyyyzz             M(79)
#define Ms_yyyzzz            Ms(80)
#define M_yyyzzz             M(80)
#define M_yyzzzz             M(81)
#define Ms_yyzzzz            Ms(81)
#define M_yzzzzz             M(82)
#define Ms_yzzzzz            Ms(82)
#define Ms_zzzzzz            Ms(83)
#define M_zzzzzz             M(83)
#define M_xxxxxxx            M(84)
#define Ms_xxxxxxx           Ms(84)
#define Ms_xxxxxxy           Ms(85)
#define M_xxxxxxy            M(85)
#define M_xxxxxxz            M(86)
#define Ms_xxxxxxz           Ms(86)
#define M_xxxxxyy            M(87)
#define Ms_xxxxxyy           Ms(87)
#define M_xxxxxyz            M(88)
#define Ms_xxxxxyz           Ms(88)
#define Ms_xxxxxzz           Ms(89)
#define M_xxxxxzz            M(89)
#define Ms_xxxxyyy           Ms(90)
#define M_xxxxyyy            M(90)
#define Ms_xxxxyyz           Ms(91)
#define M_xxxxyyz            M(91)
#define Ms_xxxxyzz           Ms(92)
#define M_xxxxyzz            M(92)
#define M_xxxxzzz            M(93)
#define Ms_xxxxzzz           Ms(93)
#define Ms_xxxyyyy           Ms(94)
#define M_xxxyyyy            M(94)
#define Ms_xxxyyyz           Ms(95)
#define M_xxxyyyz            M(95)
#define Ms_xxxyyzz           Ms(96)
#define M_xxxyyzz            M(96)
#define M_xxxyzzz            M(97)
#define Ms_xxxyzzz           Ms(97)
#define Ms_xxxzzzz           Ms(98)
#define M_xxxzzzz            M(98)
#define Ms_xxyyyyy           Ms(99)
#define M_xxyyyyy            M(99)
#define M_xxyyyyz            M(100)
#define Ms_xxyyyyz           Ms(100)
#define Ms_xxyyyzz           Ms(101)
#define M_xxyyyzz            M(101)
#define Ms_xxyyzzz           Ms(102)
#define M_xxyyzzz            M(102)
#define Ms_xxyzzzz           Ms(103)
#define M_xxyzzzz            M(103)
#define M_xxzzzzz            M(104)
#define Ms_xxzzzzz           Ms(104)
#define M_xyyyyyy            M(105)
#define Ms_xyyyyyy           Ms(105)
#define M_xyyyyyz            M(106)
#define Ms_xyyyyyz           Ms(106)
#define Ms_xyyyyzz           Ms(107)
#define M_xyyyyzz            M(107)
#define Ms_xyyyzzz           Ms(108)
#define M_xyyyzzz            M(108)
#define Ms_xyyzzzz           Ms(109)
#define M_xyyzzzz            M(109)
#define M_xyzzzzz            M(110)
#define Ms_xyzzzzz           Ms(110)
#define Ms_xzzzzzz           Ms(111)
#define M_xzzzzzz            M(111)
#define M_yyyyyyy            M(112)
#define Ms_yyyyyyy           Ms(112)
#define Ms_yyyyyyz           Ms(113)
#define M_yyyyyyz            M(113)
#define Ms_yyyyyzz           Ms(114)
#define M_yyyyyzz            M(114)
#define Ms_yyyyzzz           Ms(115)
#define M_yyyyzzz            M(115)
#define Ms_yyyzzzz           Ms(116)
#define M_yyyzzzz            M(116)
#define M_yyzzzzz            M(117)
#define Ms_yyzzzzz           Ms(117)
#define Ms_yzzzzzz           Ms(118)
#define M_yzzzzzz            M(118)
#define Ms_zzzzzzz           Ms(119)
#define M_zzzzzzz            M(119)
    v433       = 0.0416666666666667d0*M_0
    v409       = v433
    v427       = 0.00416666666666667d0*M_0
    v0         = M_0*x
    v1         = M_x + v0
    v2         = M_0*y
    v3         = M_y + v2
    v4         = M_0*z + M_z
    v5         = M_x*x
    v6         = M_xx + v5
    v7         = 0.5d0*M_0
    v9         = M_y*x
    v10        = M_xy + v9
    v11        = M_x*y
    v12        = v0*y
    v13        = v10 + v11 + v12
    v14        = M_z*x
    v15        = M_xz + v14
    v16        = M_x*z
    v17        = v0*z + v15 + v16
    v18        = M_y*y
    v19        = M_yy + v18
    v21        = M_z*y
    v22        = M_yz + v21
    v23        = M_y*z
    v24        = v2*z + v22 + v23
    v25        = M_z*z
    v26        = M_zz + v25
    v28        = M_xx*x
    v29        = M_xxx + v28
    v30        = 0.166666666666667d0*M_0
    v33        = M_xy*x
    v34        = M_xxy + v33
    v35        = M_xx*y
    v36        = v5*y
    v37        = v34 + v35 + v36
    v38        = M_xz*x
    v39        = M_xxz + v38
    v40        = M_xx*z
    v41        = v5*z
    v42        = v39 + v40 + v41
    v44        = M_yy*x
    v45        = M_xyy + v44
    v46        = M_xy*y
    v47        = v9*y
    v48        = v45 + v46 + v47
    v49        = M_xy*z
    v50        = v9*z
    v51        = v49 + v50
    v52        = M_xz*y
    v434       = M_xyz + v52
    v53        = M_yz*x
    v54        = v11*z
    v55        = v14*y
    v415       = v53 + v55
    v57        = M_zz*x
    v58        = M_xzz + v57
    v59        = M_xz*z
    v60        = v14*z
    v61        = v58 + v59 + v60
    v62        = M_yy*y
    v63        = M_yyy + v62
    v65        = M_yz*y
    v66        = M_yyz + v65
    v67        = M_yy*z
    v68        = v18*z
    v69        = v66 + v67 + v68
    v70        = M_zz*y
    v71        = M_yzz + v70
    v72        = M_yz*z
    v73        = v21*z
    v74        = v71 + v72 + v73
    v75        = M_zz*z
    v76        = M_zzz + v75
    v78        = M_xxx*x
    v79        = v409
    v82        = M_xxx*y
    v83        = M_xxxy + v82
    v84        = M_xxy*x
    v85        = v28*y
    v86        = M_xy + v11
    v87        = M_xxx*z
    v88        = M_xxxz + v87
    v89        = M_xxz*x
    v90        = v28*z
    v91        = M_xz + v16
    v92        = M_xyy*x
    v93        = M_xxyy + v92
    v94        = M_xxy*y
    v95        = v33*y
    v96        = v93 + v94 + v95
    v100       = M_xxy*z
    v101       = v33*z
    v102       = v100 + v101
    v103       = M_xxz*y
    v104       = M_xyz*x
    v437       = M_xxyz + v104
    v105       = v35*z
    v106       = v38*y
    v431       = v103 + v106
    v107       = M_xzz*x
    v108       = M_xxzz + v107
    v109       = M_xxz*z
    v110       = v38*z
    v111       = v108 + v109 + v110
    v114       = M_yyy*x
    v115       = M_xyyy + v114
    v116       = M_xyy*y
    v117       = v44*y
    v119       = M_xyy*z
    v120       = v119 + v44*z
    v121       = M_xyz*y
    v122       = M_yyz*x
    v435       = M_xyyz + v122
    v123       = v46*z
    v124       = v53*y
    v432       = v121 + v124
    v125       = M_xyz*z
    v126       = v52*z
    v127       = v125 + v126
    v128       = M_xzz*y
    v436       = M_xyzz + v128
    v129       = M_yzz*x
    v130       = v53*z
    v131       = v57*y
    v423       = v129 + v131
    v132       = M_zzz*x
    v133       = M_xzzz + v132
    v134       = M_xzz*z
    v135       = v57*z
    v137       = M_yyy*y
    v139       = M_yyy*z
    v140       = M_yyyz + v139
    v141       = M_yyz*y
    v142       = v62*z
    v143       = M_yz + v23
    v144       = M_yzz*y
    v145       = M_yyzz + v144
    v146       = M_yyz*z
    v147       = v65*z
    v148       = v145 + v146 + v147
    v153       = M_zzz*y
    v154       = M_yzzz + v153
    v155       = M_yzz*z
    v156       = v70*z
    v157       = M_zzz*z
    v159       = M_xxxx*x
    v160       = 0.00833333333333333d0*M_0
    v163       = M_xxxx*y
    v164       = M_xxxxy + v163
    v165       = M_xxxy*x
    v166       = v78*y
    v167       = M_xxy + v35
    v168       = M_xxxx*z
    v169       = M_xxxxz + v168
    v170       = M_xxxz*x
    v171       = v78*z
    v172       = M_xxz + v40
    v173       = M_xxxy*y
    v174       = M_xxyy*x
    v175       = v84*y
    v176       = 0.5d0*M_xxx
    v180       = M_xxxy*z
    v181       = M_xxxz*y
    v182       = v82*z + M_xxxyz + v180 + v181
    v183       = M_xxyz*x
    v184       = v84*z
    v185       = v89*y
    v186       = v434
    v187       = v49 + v54
    v188       = v186 + v187
    v189       = M_xxxz*z
    v190       = M_xxzz*x
    v191       = v89*z
    v192       = M_xxyy*y
    v193       = M_xyyy*x
    v194       = v92*y
    v195       = 0.5d0*M_xxy
    v198       = M_xxyy*z
    v199       = M_xxyz*y
    v200       = M_xyyz*x
    v201       = v94*z
    v202       = v92*z
    v203       = v104*y
    v204       = 0.5d0*M_xxz
    v205       = M_xxyz*z
    v206       = M_xxzz*y
    v207       = M_xyzz*x
    v208       = v103*z
    v209       = v104*z
    v210       = v107*y
    v212       = M_xxzz*z
    v213       = M_xzzz*x
    v214       = v107*z
    v215       = M_yyyy*x
    v216       = M_xyyyy + v215
    v217       = M_xyyy*y
    v218       = v114*y
    v220       = M_xyyy*z
    v221       = M_yyyz*x
    v222       = v114*z + M_xyyyz + v220 + v221
    v223       = M_xyyz*y
    v224       = v116*z
    v225       = v122*y
    v226       = M_xyz + v53
    v227       = v226 + v51
    v228       = M_xyyz*z
    v229       = M_xyzz*y
    v230       = M_yyzz*x
    v231       = v121*z
    v232       = v122*z
    v233       = v129*y
    v235       = M_xzzz*y
    v236       = M_yzzz*x
    v237       = v132*y
    v238       = M_xyzzz + v235 + v236 + v237
    v239       = M_xyzz*z
    v240       = v128*z
    v241       = v129*z
    v242       = v415
    v243       = v186 + v242
    v244       = M_zzzz*x
    v245       = M_xzzzz + v244
    v246       = M_xzzz*z
    v247       = v132*z
    v249       = M_yyyy*y
    v251       = M_yyyy*z
    v252       = M_yyyyz + v251
    v253       = M_yyyz*y
    v254       = v137*z
    v255       = M_yyz + v67
    v256       = M_yyyz*z
    v257       = M_yyzz*y
    v258       = v141*z
    v261       = M_yyzz*z
    v262       = M_yzzz*y
    v263       = v144*z
    v265       = M_zzzz*y
    v266       = M_yzzzz + v265
    v267       = M_yzzz*z
    v268       = v153*z
    v269       = M_zzzz*z
    v271       = M_xxxxx*x
    v272       = 0.00138888888888889d0*M_0
    v275       = M_xxxxx*y
    v276       = M_xxxxy*x
    v277       = v159*y
    v278       = M_xxxxz*x
    v279       = M_xxxxy*y
    v280       = M_xxxyy*x
    v281       = v165*y
    v282       = 0.5d0*M_xxxx
    v286       = M_xyy + v46
    v287       = M_xxxxz*y
    v288       = M_xxxyz*x
    v289       = v170*y
    v290       = M_xxyz + v100 + v103 + v105
    v291       = M_xxxzz*x
    v292       = M_xzz + v59
    v293       = M_xxxyy*y
    v294       = M_xxyyy*x
    v295       = v174*y
    v296       = 0.166666666666667d0*M_xxx
    v297       = 0.5d0*M_xxxy
    v300       = M_xxxyz*y
    v301       = M_xxyyz*x
    v302       = v183*y
    v303       = 0.5d0*M_xxxz
    v305       = M_xxxzz*y
    v306       = M_xxyzz*x
    v307       = v190*y
    v309       = M_xxzzz*x
    v311       = M_xxyyy*y
    v312       = M_xyyyy*x
    v313       = v193*y
    v314       = 0.5d0*M_xxyy
    v318       = M_xxyyz*y
    v319       = M_xyyyz*x
    v320       = v200*y
    v321       = 0.5d0*M_xxyz
    v323       = M_xxyzz*y
    v324       = M_xyyzz*x
    v325       = v207*y
    v326       = 0.5d0*M_xxzz
    v331       = M_xxzzz*y
    v332       = M_xyzzz*x
    v333       = v213*y
    v335       = M_xzzzz*x
    v337       = M_xyyyy*y
    v338       = M_yyyyy*x
    v339       = v215*y
    v341       = M_xyyyz*y
    v342       = M_yyyyz*x
    v343       = v221*y
    v344       = v435
    v345       = v120 + v344
    v346       = M_xyyzz*y
    v347       = M_yyyzz*x
    v348       = v230*y
    v350       = M_xyzzz*y
    v351       = M_yyzzz*x
    v352       = v236*y
    v354       = M_xzzzz*y
    v355       = M_yzzzz*x
    v356       = v244*y
    v357       = v436
    v358       = v357 + v423
    v359       = M_zzzzz*x
    v361       = M_yyyyy*y
    v363       = M_yyyyz*y
    v364       = M_yyyzz*y
    v368       = M_yzz + v72
    v369       = M_yyzzz*y
    v372       = M_yzzzz*y
    v374       = M_zzzzz*y
    v376       = 0.000198412698412698d0*M_0
    v378       = 0.5d0*M_xxxxx
    v383       = 0.166666666666667d0*M_xxxx
    v384       = 0.5d0*M_xxxxy
    v387       = 0.5d0*M_xxxxz
    v389       = 0.166666666666667d0*M_xxxy
    v390       = 0.5d0*M_xxxyy
    v394       = 0.5d0*M_xxxyz
    v395       = 0.166666666666667d0*M_xxxz
    v396       = 0.5d0*M_xxxzz
    v398       = 0.5d0*M_xxyyy
    v400       = 0.5d0*M_xxyyz
    v401       = v437
    v402       = 0.5d0*M_xxyzz
    v404       = 0.5d0*M_xxzzz
    Ms_0       = Ms_0 + (M_0)
    Ms_x       = Ms_x + (v1)
    Ms_y       = Ms_y + (v3)
    Ms_z       = Ms_z + (v4)
    Ms_xy      = Ms_xy + (v13)
    Ms_xz      = Ms_xz + (v17)
    Ms_yz      = Ms_yz + (v24)
    Ms_xyz     = Ms_xyz + (v12*z + v415 + v434 + v51 + v54)
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v8         = a2
    v410       = 0.25d0*v8
    v414       = M_0*v8
    v32        = 0.5d0*v8
    v98        = M_yy*v8
    v99        = M_0*v410
    v113       = M_zz*v8
    v179       = M_x*v8
    v196       = 0.0833333333333333d0*v414
    v285       = v410
    v315       = 0.0208333333333333d0*v414
    v317       = M_y*v8
    v328       = v18*v8
    v329       = v25*v8
    v336       = M_z*v8
    v382       = M_xxx*v8
    v399       = v427*v8
    v403       = v409*v8
    Ms_xx      = Ms_xx + (v6 + v7*v8)
    Ms_xxy     = Ms_xxy + (v3*v32 + v37)
    Ms_xxz     = Ms_xxz + (v32*v4 + v42)
    Ms_xxyz    = Ms_xxyz + (v24*v32 + v36*z + v102 + v105 + v431 + v437)
    a3         = a1*a2
    v31        = a3
    v412       = 0.0833333333333333d0*v31
    v419       = M_0*v31
    v81        = 0.166666666666667d0*v31
    v177       = M_0*v412
    v284       = M_x*v31
    v298       = 0.0277777777777778d0*v419
    v381       = v412
    v391       = 0.00694444444444444d0*v419
    Ms_xxx     = Ms_xxx + (v29 + M_x*v32 + v30*v31)
    Ms_xxxy    = Ms_xxxy + (v3*v81 + v32*v86 + v83 + v84 + v85)
    Ms_xxxz    = Ms_xxxz + (v32*v91 + v4*v81 + v88 + v89 + v90)
    Ms_xxxyz   = Ms_xxxyz + (v188*v32 + v24*v81 + v85*z + v182 + v183 + v184 + v185)
    a4         = a2*a2
    v80        = a4
    v418       = M_0*v80
    v162       = 0.0416666666666667d0*v80
    v283       = 0.0208333333333333d0*v418
    v380       = M_x*v80
    v385       = 0.00694444444444444d0*v418
    Ms_xxxx    = Ms_xxxx + (M_xxxx + v78 + M_x*v81 + M_xx*v32 + v79*v80)
    Ms_xxxxy   = Ms_xxxxy + (v164 + v165 + v166 + v162*v3 + v167*v32 + v81*v86)
    Ms_xxxxz   = Ms_xxxxz + (v169 + v170 + v171 + v162*v4 + v172*v32 + v81*v91)
    Ms_xxxxyz  = Ms_xxxxyz + (M_xxxxyz + v287 + v288 + v289 + M_xxxxy*z + v162*v24 + v163*z + v165*z + &
      v166*z + v188*v81 + v290*v32)
    a5         = a2*a3
    v161       = a5
    v274       = 0.00833333333333333d0*v161
    v379       = v161*v427
    Ms_xxxxx   = Ms_xxxxx + (M_xxxxx + v159 + M_x*v162 + M_xx*v81 + M_xxx*v32 + v160*v161)
    Ms_xxxxxy  = Ms_xxxxxy + (M_xxxxxy + v275 + v276 + v277 + v162*v86 + v167*v81 + v274*v3 + v32*v83)
    Ms_xxxxxz  = Ms_xxxxxz + (M_xxxxxz + v278 + M_xxxxx*z + v159*z + v162*v91 + v172*v81 + v274*v4 + &
      v32*v88)
    Ms_xxxxxyz = Ms_xxxxxyz + (M_xxxxxyz + M_xxxxxy*z + M_xxxxxz*y + M_xxxxyz*x + v162*v188 + v182*v32 &
      + v24*v274 + v275*z + v276*z + v277*z + v278*y + v290*v81)
    a6         = a3*a3
    v273       = a6
    v377       = 0.00138888888888889d0*v273
    Ms_xxxxxx  = Ms_xxxxxx + (M_xxxxxx + v271 + M_x*v274 + M_xx*v162 + M_xxx*v81 + M_xxxx*v32 + v272* &
      v273)
    Ms_xxxxxxy = Ms_xxxxxxy + (M_xxxxxxy + M_xxxxxx*y + M_xxxxxy*x + v162*v167 + v164*v32 + v271*y + &
      v274*v86 + v3*v377 + v81*v83)
    Ms_xxxxxxz = Ms_xxxxxxz + (M_xxxxxxz + M_xxxxxx*z + M_xxxxxz*x + v162*v172 + v169*v32 + v271*z + &
      v274*v91 + v377*v4 + v81*v88)
    a7         = a3*a4
    Ms_xxxxxxx = Ms_xxxxxxx + (M_xxxxxxx + M_x*v377 + M_xx*v274 + M_xxx*v162 + M_xxxx*v81 + M_xxxxx*v32 &
      + M_xxxxxx*x + a7*v376)
    b2         = b1*b1
    v20        = b2
    v413       = 0.25d0*v20
    v420       = 0.0833333333333333d0*v20
    v428       = 0.0208333333333333d0*v20
    v43        = 0.5d0*v20
    v97        = M_xx*v20
    v150       = M_zz*v20
    v152       = M_0*v20
    v178       = v413
    v197       = v413*v8
    v299       = v420*v8
    v304       = v20*v412
    v327       = v20*v5
    v386       = v428*v80
    Ms_yy      = Ms_yy + (v19 + v20*v7)
    Ms_xyy     = Ms_xyy + (v1*v43 + v48)
    Ms_yyz     = Ms_yyz + (v4*v43 + v69)
    Ms_xxyy    = Ms_xxyy + (0.5d0*(v97 + v98) + v18*v32 + v20*v99 + v43*v5 + v96)
    Ms_xyyz    = Ms_xyyz + (v17*v43 + v47*z + v120 + v123 + v432 + v435)
    Ms_xxxyy   = Ms_xxxyy + (M_xxxyy + v173 + v174 + v175 + M_xyy*v32 + v176*v20 + v177*v20 + v178* &
      v179 + v19*v81 + v28*v43 + v32*v46)
    Ms_xxyyz   = Ms_xxyyz + (M_xxyyz + v198 + v199 + v200 + v201 + v202 + v203 + M_yyz*v32 + v197*v4 &
      + v20*v204 + v32*v65 + v32*v67 + v32*v68 + v38*v43 + v40*v43 + &
      v41*v43 + v95*z)
    Ms_xxxxyy  = Ms_xxxxyy + (M_xxxxyy + v279 + v280 + v281 + M_xxyy*v32 + v162*v19 + v20*v282 + v20* &
      v283 + v284*v420 + v285*v97 + v286*v81 + v32*v94 + v43*v78)
    Ms_xxxyyz  = Ms_xxxyyz + (M_xxxyyz + v300 + v301 + v302 + M_xxxyy*z + M_xyyz*v32 + v119*v32 + v121 &
      *v32 + v123*v32 + v173*z + v174*z + v175*z + v197*v91 + v20*v303 &
      + v304*v4 + v43*v87 + v43*v89 + v43*v90 + v69*v81)
    Ms_xxxxxyy = Ms_xxxxxyy + (M_xxxxxyy + M_xxxxxy*y + M_xxxxyy*x + M_xxxyy*v32 + v159*v43 + v162*v286 &
      + v173*v32 + v178*v382 + v19*v274 + v20*v378 + v20*v379 + v276*y &
      + v380*v428 + v381*v97 + v81*(M_xxyy + v94))
    Ms_xxxxyyz = Ms_xxxxyyz + (M_xxxxyyz + M_xxxxyy*z + M_xxxxyz*y + M_xxxyyz*x + M_xxyyz*v32 + v162* &
      v69 + v168*v43 + v170*v43 + v171*v43 + v172*v197 + v198*v32 + &
      v199*v32 + v20*v387 + v201*v32 + v279*z + v280*z + v281*z + v288* &
      y + v304*v91 + v386*v4 + v81*(M_xyyz + v119 + v121 + v123))
    b3         = b1*b2
    v64        = b3
    v421       = 0.0833333333333333d0*v64
    v430       = 0.0277777777777778d0*v64
    v118       = 0.166666666666667d0*v64
    v260       = M_0*v64
    v316       = v421
    v322       = v421*v8
    v367       = M_y*v64
    v393       = v31*v430
    Ms_yyy     = Ms_yyy + (v63 + M_y*v43 + v30*v64)
    Ms_xyyy    = Ms_xyyy + (v1*v118 + v10*v43 + v115 + v116 + v117)
    Ms_yyyz    = Ms_yyyz + (v118*v4 + v143*v43 + v140 + v141 + v142)
    Ms_xxyyy   = Ms_xxyyy + (M_xxyyy + v192 + v193 + v194 + M_y*v197 + M_yyy*v32 + v118*v6 + v195*v20 &
      + v196*v64 + v32*v62 + v33*v43)
    Ms_xyyyz   = Ms_xyyyz + (v117*z + v118*v17 + v227*v43 + v222 + v223 + v224 + v225)
    Ms_xxxyyy  = Ms_xxxyyy + (M_xxxyyy + v293 + v294 + v295 + M_xy*v197 + M_xyyy*v32 + M_yyy*v81 + &
      v116*v32 + v118*v28 + v20*v297 + v296*v64 + v298*v64 + v299*(v11 &
      + v9) + v43*v84 + v62*v81)
    Ms_xxyyyz  = Ms_xxyyyz + (M_xxyyyz + v318 + v319 + v320 + M_xxyyy*z + M_yyyz*v32 + v100*v43 + v101 &
      *v43 + v104*v43 + v118*v42 + v139*v32 + v141*v32 + v142*v32 + &
      v143*v197 + v192*z + v193*z + v194*z + v20*v321 + v322*v4)
    Ms_xxxxyyy = Ms_xxxxyyy + (M_xxxxyyy + M_xxxxyy*y + M_xxxyyy*x + M_xxy*v197 + M_xxyyy*v32 + M_xyyy* &
      v81 + M_y*v386 + v116*v81 + v118*v78 + v162*v63 + v165*v43 + v192 &
      *v32 + v20*v384 + v280*y + v284*v430 + v299*(v33 + v35) + v383* &
      v64 + v385*v64)
    Ms_xxxyyyz = Ms_xxxyyyz + (M_xxxyyyz + M_xxxyyy*z + M_xxxyyz*y + M_xxyyyz*x + M_xyyyz*v32 + M_yyyz* &
      v81 + v118*v87 + v118*v89 + v118*v90 + v139*v81 + v141*v81 + v142 &
      *v81 + v180*v43 + v183*v43 + v184*v43 + v197*(M_xyz + v49) + v20* &
      v394 + v220*v32 + v223*v32 + v224*v32 + v293*z + v294*z + v295*z &
      + v299*(v50 + v52 + v53 + v54) + v301*y + v393*v4 + v395*v64)
    b4         = b2*b2
    v138       = b4
    v429       = 0.0208333333333333d0*v138
    v219       = 0.0416666666666667d0*v138
    v366       = M_0*v138
    v392       = v429
    Ms_yyyy    = Ms_yyyy + (M_yyyy + v137 + M_y*v118 + M_yy*v43 + v138*v79)
    Ms_xyyyy   = Ms_xyyyy + (v216 + v217 + v218 + v1*v219 + v10*v118 + v43*v45)
    Ms_yyyyz   = Ms_yyyyz + (v252 + v253 + v254 + v118*v143 + v219*v4 + v255*v43)
    Ms_xxyyyy  = Ms_xxyyyy + (M_xxyyyy + v311 + v312 + v313 + M_yyyy*v32 + v118*v34 + v137*v32 + v138* &
      v315 + v178*v98 + v20*v314 + v219*v6 + v316*v317 + v43*v92)
    Ms_xyyyyz  = Ms_xyyyyz + (M_xyyyyz + v341 + v342 + v343 + M_xyyyy*z + v118*v227 + v17*v219 + v215* &
      z + v217*z + v218*z + v345*v43)
    Ms_xxxyyyy = Ms_xxxyyyy + (M_xxxyyyy + M_xxxyyy*y + M_xxyyyy*x + M_xyy*v197 + M_xyyyy*v32 + M_y* &
      v393 + M_yyyy*v81 + v118*v84 + v137*v81 + v138*v391 + v174*v43 + &
      v179*v392 + v20*v390 + v217*v32 + v219*v29 + v294*y + v299*(v44 + &
      v46) + v389*v64)
    Ms_xxyyyyz = Ms_xxyyyyz + (M_xxyyyyz + M_xxyyyy*z + M_xxyyyz*y + M_xyyyyz*x + M_yyyyz*v32 + v118*( &
      v102 + v401) + v143*v322 + v197*v255 + v198*v43 + v20*v400 + v200 &
      *v43 + v202*v43 + v219*v42 + v251*v32 + v253*v32 + v254*v32 + &
      v311*z + v312*z + v313*z + v319*y + v392*v4*v8)
    b5         = b2*b3
    v250       = b5
    v340       = 0.00833333333333333d0*v250
    Ms_yyyyy   = Ms_yyyyy + (M_yyyyy + v249 + M_y*v219 + M_yy*v118 + M_yyy*v43 + v160*v250)
    Ms_xyyyyy  = Ms_xyyyyy + (M_xyyyyy + v337 + v338 + v339 + v1*v340 + v10*v219 + v115*v43 + v118*v45)
    Ms_yyyyyz  = Ms_yyyyyz + (M_yyyyyz + v363 + M_yyyyy*z + v118*v255 + v140*v43 + v143*v219 + v249*z &
      + v340*v4)
    Ms_xxyyyyy = Ms_xxyyyyy + (M_xxyyyyy + M_xxyyyy*y + M_xyyyyy*x + M_yyy*v197 + M_yyyyy*v32 + v118* &
      v93 + v193*v43 + v20*v398 + v219*v34 + v249*v32 + v250*v399 + &
      v312*y + v316*v98 + v317*v392 + v340*v6)
    Ms_xyyyyyz = Ms_xyyyyyz + (M_xyyyyyz + M_xyyyyy*z + M_xyyyyz*y + M_yyyyyz*x + v118*v345 + v17*v340 &
      + v219*v227 + v222*v43 + v337*z + v338*z + v339*z + v342*y)
    b6         = b3*b3
    v362       = b6
    v405       = 0.00138888888888889d0*v362
    Ms_yyyyyy  = Ms_yyyyyy + (M_yyyyyy + v361 + M_y*v340 + M_yy*v219 + M_yyy*v118 + M_yyyy*v43 + v272* &
      v362)
    Ms_xyyyyyy = Ms_xyyyyyy + (M_xyyyyyy + M_xyyyyy*y + M_yyyyyy*x + v1*v405 + v10*v340 + v115*v118 + &
      v216*v43 + v219*v45 + v338*y)
    Ms_yyyyyyz = Ms_yyyyyyz + (M_yyyyyyz + M_yyyyyy*z + M_yyyyyz*y + v118*v140 + v143*v340 + v219*v255 &
      + v252*v43 + v361*z + v4*v405)
    b7         = b3*b4
    Ms_yyyyyyy = Ms_yyyyyyy + (M_yyyyyyy + M_y*v405 + M_yy*v340 + M_yyy*v219 + M_yyyy*v118 + M_yyyyy* &
      v43 + M_yyyyyy*y + b7*v376)
    c2         = c1*c1
    v27        = c2
    v411       = 0.25d0*v27
    v416       = 0.0833333333333333d0*v27
    v422       = v20*v27
    v424       = 0.0208333333333333d0*v27
    v56        = 0.5d0*v27
    v112       = M_xx*v27
    v149       = M_yy*v27
    v151       = v411
    v211       = v411*v8
    v234       = v27*v413
    v259       = v416
    v308       = v31*v416
    v310       = v416*v8
    v330       = 0.125d0*v422
    v349       = v416*v64
    v365       = v424
    v371       = v20*v416
    v388       = v424*v80
    v406       = v27*v429
    Ms_zz      = Ms_zz + (v26 + v27*v7)
    Ms_xzz     = Ms_xzz + (v1*v56 + v61)
    Ms_yzz     = Ms_yzz + (v3*v56 + v74)
    Ms_xxzz    = Ms_xxzz + (0.5d0*(v112 + v113) + v111 + v25*v32 + v27*v99 + v5*v56)
    Ms_xyzz    = Ms_xyzz + (v13*v56 + v55*z + v127 + v130 + v423 + v436)
    Ms_yyzz    = Ms_yyzz + (0.5d0*(v149 + v150) + v148 + v151*v152 + v18*v56 + v25*v43)
    Ms_xxxzz   = Ms_xxxzz + (M_xxxzz + v189 + v190 + v191 + M_xzz*v32 + v151*v179 + v176*v27 + v177* &
      v27 + v26*v81 + v28*v56 + v32*v59)
    Ms_xxyzz   = Ms_xxyzz + (M_xxyzz + v205 + v206 + v207 + v208 + v209 + v210 + M_yzz*v32 + v106*z + &
      v195*v27 + v211*v3 + v32*v70 + v32*v72 + v32*v73 + v33*v56 + v35* &
      v56 + v36*v56)
    Ms_xyyzz   = Ms_xyyzz + (M_xyyzz + v228 + v229 + v230 + v231 + v232 + v233 + M_xyy*v56 + M_xzz* &
      v43 + v1*v234 + v124*z + v43*v57 + v43*v59 + v43*v60 + v44*v56 + &
      v46*v56 + v47*v56)
    Ms_yyyzz   = Ms_yyyzz + (M_yyyzz + v256 + v257 + v258 + M_y*v234 + M_yyy*v56 + M_yzz*v43 + v118* &
      v26 + v259*v260 + v43*v72 + v56*v62)
    Ms_xxxxzz  = Ms_xxxxzz + (M_xxxxzz + v291 + M_xxxxz*z + M_xxzz*v32 + v109*v32 + v112*v285 + v162* &
      v26 + v170*z + v259*v284 + v27*v282 + v27*v283 + v292*v81 + v56* &
      v78)
    Ms_xxxyzz  = Ms_xxxyzz + (M_xxxyzz + v305 + v306 + v307 + M_xxxyz*z + M_xyzz*v32 + v125*v32 + v126 &
      *v32 + v128*v32 + v181*z + v183*z + v185*z + v211*v86 + v27*v297 &
      + v3*v308 + v56*v82 + v56*v84 + v56*v85 + v74*v81)
    Ms_xxyyzz  = Ms_xxyyzz + (M_xxyyzz + v323 + v324 + v325 + M_xxyyz*z + M_yyzz*v32 + v107*v43 + v109 &
      *v43 + v110*v43 + v113*v178 + v144*v32 + v146*v32 + v147*v32 + &
      v151*v327 + v151*v328 + v151*v97 + v151*v98 + v178*v329 + v199*z &
      + v20*v326 + v200*z + v203*z + v27*v314 + v330*v414 + v56*v92 + &
      v56*v94 + v56*v95)
    Ms_xyyyzz  = Ms_xyyyzz + (M_xyyyzz + v346 + v347 + v348 + M_xyyy*v56 + M_xyyyz*z + M_xyzz*v43 + v1 &
      *v349 + v10*v234 + v114*v56 + v116*v56 + v117*v56 + v118*v61 + &
      v125*v43 + v129*v43 + v130*v43 + v221*z + v223*z + v225*z)
    Ms_yyyyzz  = Ms_yyyyzz + (M_yyyyzz + v364 + M_yyyy*v56 + M_yyyyz*z + M_yyzz*v43 + v118*v368 + v137 &
      *v56 + v146*v43 + v149*v178 + v219*v26 + v253*z + v259*v367 + &
      v365*v366)
    Ms_xxxxxzz = Ms_xxxxxzz + (M_xxxxxzz + M_xxxxxz*z + M_xxxxzz*x + M_xxxzz*v32 + v112*v381 + v151* &
      v382 + v159*v56 + v162*v292 + v189*v32 + v26*v274 + v27*v378 + &
      v27*v379 + v278*z + v365*v380 + v81*(M_xxzz + v109))
    Ms_xxxxyzz = Ms_xxxxyzz + (M_xxxxyzz + M_xxxxyz*z + M_xxxxzz*y + M_xxxyzz*x + M_xxyzz*v32 + v162* &
      v74 + v163*v56 + v165*v56 + v166*v56 + v167*v211 + v205*v32 + &
      v206*v32 + v208*v32 + v27*v384 + v287*z + v288*z + v289*z + v291* &
      y + v3*v388 + v308*v86 + v81*(v127 + v357))
    Ms_xxxyyzz = Ms_xxxyyzz + (M_xxxyyzz + M_xxx*v234 + M_xxxyyz*z + M_xxxyzz*y + M_xxyyzz*x + M_xyy* &
      v211 + M_xyyzz*v32 + M_xzz*v197 + v148*v81 + v173*v56 + v174*v56 &
      + v175*v56 + v179*v330 + v189*v43 + v190*v43 + v191*v43 + v197* &
      v59 + v20*v396 + v211*v46 + v228*v32 + v229*v32 + v231*v32 + v234 &
      *v28 + v27*v390 + v300*z + v301*z + v302*z + v306*y + v31*v422* &
      v433 + v381*(v149 + v150 + v18*v27 + v20*v25))
    Ms_xxyyyzz = Ms_xxyyyzz + (M_xxyyyzz + M_xxy*v234 + M_xxyyyz*z + M_xxyyzz*y + M_xyyyzz*x + M_yyy* &
      v211 + M_yyyzz*v32 + M_yzz*v197 + v111*v118 + v192*v56 + v193*v56 &
      + v194*v56 + v197*v72 + v20*v402 + v205*v43 + v207*v43 + v209*v43 &
      + v211*v62 + v234*v33 + v256*v32 + v257*v32 + v258*v32 + v27*v398 &
      + v27*v403*v64 + v316*(v112 + v113 + v27*v5 + v329) + v317*v330 + &
      v318*z + v319*z + v320*z + v324*y)
    Ms_xyyyyzz = Ms_xyyyyzz + (M_xyyyyzz + M_xyyyy*v56 + M_xyyyyz*z + M_xyyyzz*y + M_xyyzz*v43 + &
      M_yyyyzz*x + v1*v406 + v10*v349 + v118*(M_xyzz + v125 + v129 + &
      v130) + v215*v56 + v217*v56 + v218*v56 + v219*v61 + v228*v43 + &
      v230*v43 + v232*v43 + v234*v45 + v341*z + v342*z + v343*z + v347* &
      y)
    Ms_yyyyyzz = Ms_yyyyyzz + (M_yyyyyzz + M_y*v406 + M_yyy*v234 + M_yyyyy*v56 + M_yyyyyz*z + M_yyyyzz* &
      y + M_yyyzz*v43 + v118*(M_yyzz + v146) + v149*v316 + v219*v368 + &
      v249*v56 + v250*v27*v427 + v256*v43 + v26*v340 + v363*z)
    h          = v20 + v27 + v8
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
    v77        = c3
    v417       = 0.0833333333333333d0*v77
    v425       = 0.0277777777777778d0*v77
    v136       = 0.166666666666667d0*v77
    v264       = v417
    v334       = v417*v8
    v353       = v20*v417
    v370       = v425
    v397       = M_z*v425
    Ms_zzz     = Ms_zzz + (v76 + M_z*v56 + v30*v77)
    Ms_xzzz    = Ms_xzzz + (v1*v136 + v15*v56 + v133 + v134 + v135)
    Ms_yzzz    = Ms_yzzz + (v136*v3 + v22*v56 + v154 + v155 + v156)
    Ms_xxzzz   = Ms_xxzzz + (M_xxzzz + v212 + v213 + v214 + M_z*v211 + M_zzz*v32 + v136*v6 + v196*v77 &
      + v204*v27 + v32*v75 + v38*v56)
    Ms_xyzzz   = Ms_xyzzz + (v13*v136 + v131*z + v243*v56 + v238 + v239 + v240 + v241)
    Ms_yyzzz   = Ms_yyzzz + (M_yyzzz + v261 + v262 + v263 + M_yyz*v56 + M_z*v234 + M_zzz*v43 + v136* &
      v19 + v152*v264 + v43*v75 + v56*v65)
    Ms_xxxzzz  = Ms_xxxzzz + (M_xxxzzz + v309 + M_xxxzz*z + M_xz*v211 + M_xzzz*v32 + M_zzz*v81 + v134* &
      v32 + v136*v28 + v190*z + v27*v303 + v296*v77 + v298*v77 + v310*( &
      v14 + v16) + v56*v89 + v75*v81)
    Ms_xxyzzz  = Ms_xxyzzz + (M_xxyzzz + v331 + v332 + v333 + M_xxyzz*z + M_yzzz*v32 + v103*v56 + v104 &
      *v56 + v106*v56 + v136*v37 + v153*v32 + v155*v32 + v156*v32 + &
      v206*z + v207*z + v210*z + v211*v22 + v27*v321 + v3*v334)
    Ms_xyyzzz  = Ms_xyyzzz + (M_xyyzzz + v350 + v351 + v352 + M_xyyz*v56 + M_xyyzz*z + M_xzzz*v43 + v1 &
      *v353 + v121*v56 + v122*v56 + v124*v56 + v132*v43 + v134*v43 + &
      v135*v43 + v136*v48 + v15*v234 + v229*z + v230*z + v233*z)
    Ms_yyyzzz  = Ms_yyyzzz + (M_yyyzzz + v369 + M_yyy*v136 + M_yyyz*v56 + M_yyyzz*z + M_yz*v234 + &
      M_yzzz*v43 + M_zzz*v118 + v118*v75 + v136*v62 + v141*v56 + v155* &
      v43 + v257*z + v260*v370 + v371*(v21 + v23))
    Ms_xxxxzzz = Ms_xxxxzzz + (M_xxxxzzz + M_xxxxzz*z + M_xxxzzz*x + M_xxz*v211 + M_xxzzz*v32 + M_xzzz* &
      v81 + M_z*v388 + v134*v81 + v136*v78 + v162*v76 + v170*v56 + v212 &
      *v32 + v27*v387 + v284*v370 + v291*z + v310*(v38 + v40) + v383* &
      v77 + v385*v77)
    Ms_xxxyzzz = Ms_xxxyzzz + (M_xxxyzzz + M_xxxyzz*z + M_xxxzzz*y + M_xxyzzz*x + M_xyzzz*v32 + M_yzzz* &
      v81 + v136*v82 + v136*v84 + v136*v85 + v153*v81 + v155*v81 + v156 &
      *v81 + v181*v56 + v183*v56 + v185*v56 + v186*v211 + v235*v32 + &
      v239*v32 + v240*v32 + v27*v394 + v3*v31*v370 + v305*z + v306*z + &
      v307*z + v309*y + v310*(v187 + v242) + v389*v77)
    Ms_xxyyzzz = Ms_xxyyzzz + (M_xxyyzzz + M_xxyyzz*z + M_xxyzzz*y + M_xxz*v234 + M_xyyzzz*x + M_yyz* &
      v211 + M_yyzzz*v32 + M_zzz*v197 + v136*v96 + v197*v75 + v199*v56 &
      + v20*v403*v77 + v20*v404 + v200*v56 + v203*v56 + v211*v65 + v212 &
      *v43 + v213*v43 + v214*v43 + v234*v38 + v261*v32 + v262*v32 + &
      v263*v32 + v264*(v327 + v328 + v97 + v98) + v27*v400 + v323*z + &
      v324*z + v325*z + v330*v336 + v332*y)
    Ms_xyyyzzz = Ms_xyyyzzz + (M_xyyyzzz + M_xyyy*v136 + M_xyyyz*v56 + M_xyyyzz*z + M_xyyzzz*y + &
      M_xyzzz*v43 + M_xzzz*v118 + M_yyyzzz*x + v1*v370*v64 + v114*v136 &
      + v116*v136 + v117*v136 + v118*v132 + v118*v134 + v118*v135 + &
      v221*v56 + v223*v56 + v225*v56 + v226*v234 + v236*v43 + v239*v43 &
      + v241*v43 + v346*z + v347*z + v348*z + v351*y + v371*(v51 + v52 &
      + v55))
    Ms_yyyyzzz = Ms_yyyyzzz + (0.00694444444444444d0*(v366*v77) + M_yyyy*v136 + M_yyyyz*v56 + M_yyyyzz* &
      z + M_yyyyzzz + M_yyyzzz*y + M_yyz*v234 + M_yyzzz*v43 + M_yzzz* &
      v118 + M_z*v406 + v118*v155 + v136*v137 + v219*v76 + v253*v56 + &
      v261*v43 + v364*z + v367*v370 + v371*(v65 + v67))
    c4         = c2*c2
    v158       = c4
    v426       = 0.0208333333333333d0*v158
    v248       = 0.0416666666666667d0*v158
    v373       = v426
    v407       = v20*v426
    Ms_zzzz    = Ms_zzzz + (M_zzzz + v157 + M_z*v136 + M_zz*v56 + v158*v79)
    Ms_xzzzz   = Ms_xzzzz + (v245 + v246 + v247 + v1*v248 + v136*v15 + v56*v58)
    Ms_yzzzz   = Ms_yzzzz + (v266 + v267 + v268 + v136*v22 + v248*v3 + v56*v71)
    Ms_xxzzzz  = Ms_xxzzzz + (M_xxzzzz + v335 + M_xxzzz*z + M_zzzz*v32 + v107*v56 + v113*v151 + v136* &
      v39 + v157*v32 + v158*v315 + v213*z + v248*v6 + v264*v336 + v27* &
      v326)
    Ms_xyzzzz  = Ms_xyzzzz + (M_xyzzzz + v354 + v355 + v356 + M_xyzzz*z + v13*v248 + v136*v243 + v235* &
      z + v236*z + v237*z + v358*v56)
    Ms_yyzzzz  = Ms_yyzzzz + (M_yyzzzz + v372 + M_yyzz*v56 + M_yyzzz*z + M_z*v353 + M_zzzz*v43 + v136* &
      v66 + v144*v56 + v150*v151 + v152*v373 + v157*v43 + v19*v248 + &
      v262*z)
    Ms_xxxzzzz = Ms_xxxzzzz + (M_xxxzzzz + M_xxxzzz*z + M_xxzzzz*x + M_xzz*v211 + M_xzzzz*v32 + M_zzzz* &
      v81 + v136*v89 + v157*v81 + v158*v391 + v179*v373 + v190*v56 + &
      v246*v32 + v248*v29 + v27*v396 + v309*z + v31*v397 + v310*(v57 + &
      v59) + v395*v77)
    Ms_xxyzzzz = Ms_xxyzzzz + (M_xxyzzzz + M_xxyzzz*z + M_xxzzzz*y + M_xyzzzz*x + M_yzzzz*v32 + v136*( &
      v401 + v431) + v206*v56 + v207*v56 + v210*v56 + v211*v71 + v22* &
      v334 + v248*v37 + v265*v32 + v267*v32 + v268*v32 + v27*v402 + v3* &
      v373*v8 + v331*z + v332*z + v333*z + v335*y)
    Ms_xyyzzzz = Ms_xyyzzzz + (M_xyyzzzz + M_xyyzz*v56 + M_xyyzzz*z + M_xyzzzz*y + M_xzzzz*v43 + &
      M_yyzzzz*x + v1*v407 + v136*(v344 + v432) + v15*v353 + v229*v56 + &
      v230*v56 + v233*v56 + v234*v58 + v244*v43 + v246*v43 + v247*v43 + &
      v248*v48 + v350*z + v351*z + v352*z + v355*y)
    Ms_yyyzzzz = Ms_yyyzzzz + (0.00694444444444444d0*(v158*v260) + M_y*v407 + M_yyyz*v136 + M_yyyzz*v56 &
      + M_yyyzzz*z + M_yyyzzzz + M_yyzzzz*y + M_yzz*v234 + M_yzzzz*v43 &
      + M_zzzz*v118 + v118*v157 + v136*v141 + v248*v63 + v257*v56 + &
      v267*v43 + v369*z + v371*(v70 + v72) + v397*v64)
    c5         = c2*c3
    v270       = c5
    v360       = 0.00833333333333333d0*v270
    Ms_zzzzz   = Ms_zzzzz + (M_zzzzz + v269 + M_z*v248 + M_zz*v136 + M_zzz*v56 + v160*v270)
    Ms_xzzzzz  = Ms_xzzzzz + (M_xzzzzz + v359 + M_xzzzz*z + v1*v360 + v133*v56 + v136*v58 + v15*v248 + &
      v244*z)
    Ms_yzzzzz  = Ms_yzzzzz + (M_yzzzzz + v374 + M_yzzzz*z + v136*v71 + v154*v56 + v22*v248 + v265*z + &
      v3*v360)
    Ms_xxzzzzz = Ms_xxzzzzz + (M_xxzzzzz + M_xxzzzz*z + M_xzzzzz*x + M_zzz*v211 + M_zzzzz*v32 + v108* &
      v136 + v113*v264 + v213*v56 + v248*v39 + v269*v32 + v27*v404 + &
      v270*v399 + v335*z + v336*v373 + v360*v6)
    Ms_xyzzzzz = Ms_xyzzzzz + (M_xyzzzzz + M_xyzzzz*z + M_xzzzzz*y + M_yzzzzz*x + v13*v360 + v136*v358 &
      + v238*v56 + v243*v248 + v354*z + v355*z + v356*z + v359*y)
    Ms_yyzzzzz = Ms_yyzzzzz + (0.00416666666666667d0*(v152*v270) + M_yyzzz*v56 + M_yyzzzz*z + M_yyzzzzz &
      + M_yzzzzz*y + M_z*v407 + M_zzz*v234 + M_zzzzz*v43 + v136*v145 + &
      v150*v264 + v19*v360 + v248*v66 + v262*v56 + v269*v43 + v372*z)
    c6         = c3*c3
    v375       = c6
    v408       = 0.00138888888888889d0*v375
    Ms_zzzzzz  = Ms_zzzzzz + (M_zzzzzz + M_z*v360 + M_zz*v248 + M_zzz*v136 + M_zzzz*v56 + M_zzzzz*z + &
      v272*v375)
    Ms_xzzzzzz = Ms_xzzzzzz + (M_xzzzzzz + M_xzzzzz*z + M_zzzzzz*x + v1*v408 + v133*v136 + v15*v360 + &
      v245*v56 + v248*v58 + v359*z)
    Ms_yzzzzzz = Ms_yzzzzzz + (M_yzzzzzz + M_yzzzzz*z + M_zzzzzz*y + v136*v154 + v22*v360 + v248*v71 + &
      v266*v56 + v3*v408 + v374*z)
    c7         = c3*c4
    Ms_zzzzzzz = Ms_zzzzzzz + (M_zzzzzzz + M_z*v408 + M_zz*v360 + M_zzz*v248 + M_zzzz*v136 + M_zzzzz* &
      v56 + M_zzzzzz*z + c7*v376)
#undef  M_0                 
#undef  y                   
#undef  Ms_0                
#undef  z                   
#undef  x                   
#undef  M_x                 
#undef  Ms_x                
#undef  Ms_y                
#undef  M_y                 
#undef  Ms_z                
#undef  M_z                 
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
#undef  Ms_xyy              
#undef  M_xyy               
#undef  M_xyz               
#undef  Ms_xyz              
#undef  M_xzz               
#undef  Ms_xzz              
#undef  Ms_yyy              
#undef  M_yyy               
#undef  M_yyz               
#undef  Ms_yyz              
#undef  M_yzz               
#undef  Ms_yzz              
#undef  Ms_zzz              
#undef  M_zzz               
#undef  Ms_xxxx             
#undef  M_xxxx              
#undef  Ms_xxxy             
#undef  M_xxxy              
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
#undef  Ms_xzzz             
#undef  M_xzzz              
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  Ms_yyyz             
#undef  M_yyyz              
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
#undef  M_xxxyy             
#undef  Ms_xxxyy            
#undef  Ms_xxxyz            
#undef  M_xxxyz             
#undef  M_xxxzz             
#undef  Ms_xxxzz            
#undef  M_xxyyy             
#undef  Ms_xxyyy            
#undef  Ms_xxyyz            
#undef  M_xxyyz             
#undef  Ms_xxyzz            
#undef  M_xxyzz             
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
#undef  M_xzzzz             
#undef  Ms_xzzzz            
#undef  Ms_yyyyy            
#undef  M_yyyyy             
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
#undef  M_xxxxzz            
#undef  Ms_xxxxzz           
#undef  M_xxxyyy            
#undef  Ms_xxxyyy           
#undef  Ms_xxxyyz           
#undef  M_xxxyyz            
#undef  Ms_xxxyzz           
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  Ms_xxxzzz           
#undef  Ms_xxyyyy           
#undef  M_xxyyyy            
#undef  Ms_xxyyyz           
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  Ms_xxyyzz           
#undef  Ms_xxyzzz           
#undef  M_xxyzzz            
#undef  M_xxzzzz            
#undef  Ms_xxzzzz           
#undef  M_xyyyyy            
#undef  Ms_xyyyyy           
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  Ms_xyyyzz           
#undef  M_xyyzzz            
#undef  Ms_xyyzzz           
#undef  M_xyzzzz            
#undef  Ms_xyzzzz           
#undef  Ms_xzzzzz           
#undef  M_xzzzzz            
#undef  Ms_yyyyyy           
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  Ms_yyyyyz           
#undef  Ms_yyyyzz           
#undef  M_yyyyzz            
#undef  Ms_yyyzzz           
#undef  M_yyyzzz            
#undef  M_yyzzzz            
#undef  Ms_yyzzzz           
#undef  M_yzzzzz            
#undef  Ms_yzzzzz           
#undef  Ms_zzzzzz           
#undef  M_zzzzzz            
#undef  M_xxxxxxx           
#undef  Ms_xxxxxxx          
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  Ms_xxxxxxz          
#undef  M_xxxxxyy           
#undef  Ms_xxxxxyy          
#undef  M_xxxxxyz           
#undef  Ms_xxxxxyz          
#undef  Ms_xxxxxzz          
#undef  M_xxxxxzz           
#undef  Ms_xxxxyyy          
#undef  M_xxxxyyy           
#undef  Ms_xxxxyyz          
#undef  M_xxxxyyz           
#undef  Ms_xxxxyzz          
#undef  M_xxxxyzz           
#undef  M_xxxxzzz           
#undef  Ms_xxxxzzz          
#undef  Ms_xxxyyyy          
#undef  M_xxxyyyy           
#undef  Ms_xxxyyyz          
#undef  M_xxxyyyz           
#undef  Ms_xxxyyzz          
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  Ms_xxxyzzz          
#undef  Ms_xxxzzzz          
#undef  M_xxxzzzz           
#undef  Ms_xxyyyyy          
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  Ms_xxyyyyz          
#undef  Ms_xxyyyzz          
#undef  M_xxyyyzz           
#undef  Ms_xxyyzzz          
#undef  M_xxyyzzz           
#undef  Ms_xxyzzzz          
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  Ms_xxzzzzz          
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyyz          
#undef  Ms_xyyyyzz          
#undef  M_xyyyyzz           
#undef  Ms_xyyyzzz          
#undef  M_xyyyzzz           
#undef  Ms_xyyzzzz          
#undef  M_xyyzzzz           
#undef  M_xyzzzzz           
#undef  Ms_xyzzzzz          
#undef  Ms_xzzzzzz          
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  Ms_yyyyyyy          
#undef  Ms_yyyyyyz          
#undef  M_yyyyyyz           
#undef  Ms_yyyyyzz          
#undef  M_yyyyyzz           
#undef  Ms_yyyyzzz          
#undef  M_yyyyzzz           
#undef  Ms_yyyzzzz          
#undef  M_yyyzzzz           
#undef  M_yyzzzzz           
#undef  Ms_yyzzzzz          
#undef  Ms_yzzzzzz          
#undef  M_yzzzzzz           
#undef  Ms_zzzzzzz          
#undef  M_zzzzzzz           
    end subroutine mom_es_M2M_add
    
! OPS  1265*ADD + 2*DIV + 1496*MUL + 82*NEG + POW + 35*SUB = 2881  (3828 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, b1, b2, b3, b4, b5, b6, b7, c1,&
                c2, c3, c4, c5, c6, c7, u10, u11, u12, u13, u14, u15, u2, u3,&
                u4, u5, u6, u7, u8, u9, v0, v1, v10, v100, v101, v102, v103,&
                v104, v105, v106, v107, v108, v109, v11, v110, v111, v112,&
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h,&
                u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz,&
                D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz,&
                D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
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
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz
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
#define M_zz                 M(9)
#define L_xxx                L(9)
#define L_xxy                L(10)
#define M_xxx                M(10)
#define L_xxz                L(11)
#define M_xxy                M(11)
#define L_xyy                L(12)
#define M_xxz                M(12)
#define L_xyz                L(13)
#define M_xyy                M(13)
#define L_yyy                L(14)
#define M_xyz                M(14)
#define M_xzz                M(15)
#define L_yyz                L(15)
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
#define M_xyzz               M(28)
#define L_xxxyy              L(28)
#define M_xzzz               M(29)
#define L_xxxyz              L(29)
#define L_xxyyy              L(30)
#define M_yyyy               M(30)
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
#define L_xxxxxx             L(36)
#define M_xxxxy              M(36)
#define L_xxxxxy             L(37)
#define M_xxxxz              M(37)
#define M_xxxyy              M(38)
#define L_xxxxxz             L(38)
#define M_xxxyz              M(39)
#define L_xxxxyy             L(39)
#define L_xxxxyz             L(40)
#define M_xxxzz              M(40)
#define L_xxxyyy             L(41)
#define M_xxyyy              M(41)
#define M_xxyyz              M(42)
#define L_xxxyyz             L(42)
#define M_xxyzz              M(43)
#define L_xxyyyy             L(43)
#define L_xxyyyz             L(44)
#define M_xxzzz              M(44)
#define L_xyyyyy             L(45)
#define M_xyyyy              M(45)
#define L_xyyyyz             L(46)
#define M_xyyyz              M(46)
#define L_yyyyyy             L(47)
#define M_xyyzz              M(47)
#define L_yyyyyz             L(48)
#define M_xyzzz              M(48)
#define L_xxxxxxx            L(49)
#define M_xzzzz              M(49)
#define L_xxxxxxy            L(50)
#define M_yyyyy              M(50)
#define M_yyyyz              M(51)
#define L_xxxxxxz            L(51)
#define M_yyyzz              M(52)
#define L_xxxxxyy            L(52)
#define L_xxxxxyz            L(53)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define L_xxxxyyy            L(54)
#define M_zzzzz              M(55)
#define L_xxxxyyz            L(55)
#define L_xxxyyyy            L(56)
#define M_xxxxxx             M(56)
#define L_xxxyyyz            L(57)
#define M_xxxxxy             M(57)
#define L_xxyyyyy            L(58)
#define M_xxxxxz             M(58)
#define M_xxxxyy             M(59)
#define L_xxyyyyz            L(59)
#define M_xxxxyz             M(60)
#define L_xyyyyyy            L(60)
#define M_xxxxzz             M(61)
#define L_xyyyyyz            L(61)
#define M_xxxyyy             M(62)
#define L_yyyyyyy            L(62)
#define L_yyyyyyz            L(63)
#define M_xxxyyz             M(63)
#define M_xxxyzz             M(64)
#define M_xxxzzz             M(65)
#define M_xxyyyy             M(66)
#define M_xxyyyz             M(67)
#define M_xxyyzz             M(68)
#define M_xxyzzz             M(69)
#define M_xxzzzz             M(70)
#define M_xyyyyy             M(71)
#define M_xyyyyz             M(72)
#define M_xyyyzz             M(73)
#define M_xyyzzz             M(74)
#define M_xyzzzz             M(75)
#define M_xzzzzz             M(76)
#define M_yyyyyy             M(77)
#define M_yyyyyz             M(78)
#define M_yyyyzz             M(79)
#define M_yyyzzz             M(80)
#define M_yyzzzz             M(81)
#define M_yzzzzz             M(82)
#define M_zzzzzz             M(83)
#define M_xxxxxxx            M(84)
#define M_xxxxxxy            M(85)
#define M_xxxxxxz            M(86)
#define M_xxxxxyy            M(87)
#define M_xxxxxyz            M(88)
#define M_xxxxxzz            M(89)
#define M_xxxxyyy            M(90)
#define M_xxxxyyz            M(91)
#define M_xxxxyzz            M(92)
#define M_xxxxzzz            M(93)
#define M_xxxyyyy            M(94)
#define M_xxxyyyz            M(95)
#define M_xxxyyzz            M(96)
#define M_xxxyzzz            M(97)
#define M_xxxzzzz            M(98)
#define M_xxyyyyy            M(99)
#define M_xxyyyyz            M(100)
#define M_xxyyyzz            M(101)
#define M_xxyyzzz            M(102)
#define M_xxyzzzz            M(103)
#define M_xxzzzzz            M(104)
#define M_xyyyyyy            M(105)
#define M_xyyyyyz            M(106)
#define M_xyyyyzz            M(107)
#define M_xyyyzzz            M(108)
#define M_xyyzzzz            M(109)
#define M_xyzzzzz            M(110)
#define M_xzzzzzz            M(111)
#define M_yyyyyyy            M(112)
#define M_yyyyyyz            M(113)
#define M_yyyyyzz            M(114)
#define M_yyyyzzz            M(115)
#define M_yyyzzzz            M(116)
#define M_yyzzzzz            M(117)
#define M_yzzzzzz            M(118)
#define M_zzzzzzz            M(119)
    v110      = y*z
    v111      = 945.0d0*x
    v103      = 15.0d0*v110
    v107      = v110
    v61       = v111
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v93       = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v93
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
    v94       = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v94
    v29       = 7.0d0*v1
    v59       = v1*v19
    v80       = -429.0d0*v59
    b3        = b1*b2
    b4        = b2*b2
    v31       = b4
    v66       = v0*v31
    v67       = 33.0d0*v31
    v89       = 143.0d0*v31
    v90       = -429.0d0*v66
    b5        = b2*b3
    b6        = b3*b3
    v69       = b6
    v91       = -429.0d0*v69
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v0 + v1
    v95       = 3.0d0*h
    v96       = h*v0
    v97       = h*v1
    v98       = h*v19
    v99       = h*v31
    v4        = -h
    v12       = v95
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v96
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v97
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v96
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 - 945.0d0*v31 + 630.0d0*v97
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v98
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v96
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v99
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v83       = -18.0d0*v51 + v46 + v79
    v84       = 66.0d0*v57
    v109      = -v84
    v85       = 9.0d0*v17
    v86       = 198.0d0*v57
    v87       = h*v67
    v88       = -18.0d0*v65 + v46 + v87
    v92       = v47 + v91 - 135.0d0*v65 + 495.0d0*v70
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
    v100      = 3.0d0*v3
    v6        = v100*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v100*v107
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v101      = 3.0d0*v8
    v9        = v8*x
    v11       = v101*(h - v10)
    D_xxx     = -3.0d0*v9*(v93 - v95)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    D_xyz     = -v103*v9
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = v101*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v102      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v102*y
    v26       = v102*z
    v28       = v103*v15
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    D_xyyy    = v22*v30
    D_xyyz    = v26*(v29 + v4)
    D_xyzz    = -(D_xxxy + D_xyyy)
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v104      = 15.0d0*v34
    v105      = v34*z
    v35       = v104*x
    v39       = v105
    v41       = 315.0d0*v105*x*y
    v42       = v104*y
    D_xxxxx   = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy   = v34*v38*y
    D_xxxxz   = v38*v39
    D_xxxyy   = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz   = v41*(h - v5)
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    D_xxyyy   = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz   = v39*(v36 - 945.0d0*v94 + 105.0d0*(v96 + v97))
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    D_xyyyy   = v34*v43*x
    D_xyyyz   = v41*(h - v7)
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
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
    v112      = 315.0d0*v44
    v106      = v112*x
    v45       = 45.0d0*v44
    v52       = v106*y
    v56       = v106*z
    v60       = v107*v112
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy  = v52*v55
    D_xxxxxz  = v55*v56
    D_xxxxyy  = v45*(v58 + v17*v29 + 14.0d0*v51 + 231.0d0*v59 - 21.0d0*v98)
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy  = v45*(v58 + v17*v24 + 14.0d0*v65 + 231.0d0*v66 - 21.0d0*v99)
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy  = v52*v68
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    D_yyyyyz  = v60*v68
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v108      = 315.0d0*v71
    v72       = v108*x
    v75       = v108*y
    v77       = v108*z
    v81       = v107*v111*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = L_xxxxxxx + (D_xxxxxxx*M_0)
    D_xxxxxxy = v75*v76
    L_xxxxxxy = L_xxxxxxy + (D_xxxxxxy*M_0)
    D_xxxxxxz = v76*v77
    L_xxxxxx  = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z)
    L_xxxxxxz = L_xxxxxxz + (D_xxxxxxz*M_0)
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    L_xxxxxyy = L_xxxxxyy + (D_xxxxxyy*M_0)
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxy  = L_xxxxxy + (D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z)
    L_xxxxxyz = L_xxxxxyz + (D_xxxxxyz*M_0)
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    L_xxxxx   = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxy*M_xy + D_xxxxxxz &
      *M_xz + D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + D_xxxxxzz*M_zz)
    L_xxxxxz  = L_xxxxxz + (D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z)
    D_xxxxyyy = -945.0d0*v71*y*(v109 + v1*v18 + v1*v82 - v83)
    L_xxxxyyy = L_xxxxyyy + (D_xxxxyyy*M_0)
    D_xxxxyyz = v77*(-v1*v85 + v80 + v83 + v86)
    L_xxxxyy  = L_xxxxyy + (D_xxxxxyy*M_x + D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyz*M_z)
    L_xxxxyyz = L_xxxxyyz + (D_xxxxyyz*M_0)
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    L_xxxxy   = L_xxxxy + (D_xxxxxxy*M_xx + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + &
      D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyz*M_yz + &
      D_xxxxyz*M_z + D_xxxxyzz*M_zz)
    L_xxxxyz  = L_xxxxyz + (D_xxxxxyz*M_x + D_xxxxyyz*M_y + D_xxxxyz*M_0 + D_xxxxyzz*M_z)
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    L_xxxx    = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxy* &
      M_xxy + D_xxxxxxz*M_xxz + D_xxxxxy*M_xy + D_xxxxxyy*M_xyy + &
      D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxy*M_y + &
      D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + D_xxxxyyz*M_yyz + D_xxxxyz*M_yz &
      + D_xxxxyzz*M_yzz + D_xxxxz*M_z + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz)
    L_xxxxz   = L_xxxxz + (D_xxxxxxz*M_xx + D_xxxxxyz*M_xy + D_xxxxxz*M_x + D_xxxxxzz*M_xz + &
      D_xxxxyyz*M_yy + D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + &
      D_xxxxzz*M_z + D_xxxxzzz*M_zz)
    D_xxxyyyy = -v61*v71*(v109 + v0*v18 + v0*v89 - v88)
    L_xxxyyyy = L_xxxyyyy + (D_xxxyyyy*M_0)
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v85))
    L_xxxyyy  = L_xxxyyy + (D_xxxxyyy*M_x + D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyz*M_z)
    L_xxxyyyz = L_xxxyyyz + (D_xxxyyyz*M_0)
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    L_xxxyy   = L_xxxyy + (D_xxxxxyy*M_xx + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + &
      D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyz*M_yz + &
      D_xxxyyz*M_z + D_xxxyyzz*M_zz)
    L_xxxyyz  = L_xxxyyz + (D_xxxxyyz*M_x + D_xxxyyyz*M_y + D_xxxyyz*M_0 + D_xxxyyzz*M_z)
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    L_xxxy    = L_xxxy + (D_xxxxxxy*M_xxx + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + D_xxxxxyz*M_xxz + &
      D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyyy*M_xyy + D_xxxxyyz*M_xyz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxy*M_0 + D_xxxyy*M_y + &
      D_xxxyyy*M_yy + D_xxxyyyy*M_yyy + D_xxxyyyz*M_yyz + D_xxxyyz*M_yz &
      + D_xxxyyzz*M_yzz + D_xxxyz*M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz)
    L_xxxyz   = L_xxxyz + (D_xxxxxyz*M_xx + D_xxxxyyz*M_xy + D_xxxxyz*M_x + D_xxxxyzz*M_xz + &
      D_xxxyyyz*M_yy + D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + &
      D_xxxyzz*M_z + D_xxxyzzz*M_zz)
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    L_xxx     = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxy*M_xxxy + D_xxxxxxz*M_xxxz + D_xxxxxy*M_xxy + &
      D_xxxxxyy*M_xxyy + D_xxxxxyz*M_xxyz + D_xxxxxz*M_xxz + D_xxxxxzz* &
      M_xxzz + D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyyy*M_xyyy + &
      D_xxxxyyz*M_xyyz + D_xxxxyz*M_xyz + D_xxxxyzz*M_xyzz + D_xxxxz* &
      M_xz + D_xxxxzz*M_xzz + D_xxxxzzz*M_xzzz + D_xxxy*M_y + D_xxxyy* &
      M_yy + D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyz*M_yyyz + &
      D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + D_xxxyz*M_yz + D_xxxyzz*M_yzz &
      + D_xxxyzzz*M_yzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz + &
      D_xxxzzzz*M_zzzz)
    L_xxxz    = L_xxxz + (D_xxxxxxz*M_xxx + D_xxxxxyz*M_xxy + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + &
      D_xxxxyyz*M_xyy + D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxz*M_x + &
      D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxyyyz*M_yyy + D_xxxyyz*M_yy &
      + D_xxxyyzz*M_yyz + D_xxxyz*M_y + D_xxxyzz*M_yz + D_xxxyzzz*M_yzz &
      + D_xxxz*M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz)
    D_xxyyyyy = v75*(-45.0d0*v51 - 30.0d0*v65 + v78 + v87 + v90)
    L_xxyyyyy = L_xxyyyyy + (D_xxyyyyy*M_0)
    D_xxyyyyz = v77*(-v0*v85 + v86 + v88 + v90)
    L_xxyyyy  = L_xxyyyy + (D_xxxyyyy*M_x + D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyz*M_z)
    L_xxyyyyz = L_xxyyyyz + (D_xxyyyyz*M_0)
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    L_xxyyy   = L_xxyyy + (D_xxxxyyy*M_xx + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + &
      D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyz*M_yz + &
      D_xxyyyz*M_z + D_xxyyyzz*M_zz)
    L_xxyyyz  = L_xxyyyz + (D_xxxyyyz*M_x + D_xxyyyyz*M_y + D_xxyyyz*M_0 + D_xxyyyzz*M_z)
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    L_xxyy    = L_xxyy + (D_xxxxxyy*M_xxx + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + D_xxxxyyz*M_xxz + &
      D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyyy*M_xyy + D_xxxyyyz*M_xyz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxyy*M_0 + D_xxyyy*M_y + &
      D_xxyyyy*M_yy + D_xxyyyyy*M_yyy + D_xxyyyyz*M_yyz + D_xxyyyz*M_yz &
      + D_xxyyyzz*M_yzz + D_xxyyz*M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz)
    L_xxyyz   = L_xxyyz + (D_xxxxyyz*M_xx + D_xxxyyyz*M_xy + D_xxxyyz*M_x + D_xxxyyzz*M_xz + &
      D_xxyyyyz*M_yy + D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + &
      D_xxyyzz*M_z + D_xxyyzzz*M_zz)
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    L_xxy     = L_xxy + (D_xxxxxxy*M_xxxx + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + D_xxxxxyz*M_xxxz &
      + D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyz* &
      M_xxyz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + D_xxxy*M_x + D_xxxyy &
      *M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + D_xxxyyyz*M_xyyz + &
      D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + D_xxxyz*M_xz + D_xxxyzz*M_xzz &
      + D_xxxyzzz*M_xzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyz*M_yyyz + D_xxyyyz* &
      M_yyz + D_xxyyyzz*M_yyzz + D_xxyyz*M_yz + D_xxyyzz*M_yzz + &
      D_xxyyzzz*M_yzzz + D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz + &
      D_xxyzzzz*M_zzzz)
    L_xxyz    = L_xxyz + (D_xxxxxyz*M_xxx + D_xxxxyyz*M_xxy + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + &
      D_xxxyyyz*M_xyy + D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyz*M_x + &
      D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxyyyyz*M_yyy + D_xxyyyz*M_yy &
      + D_xxyyyzz*M_yyz + D_xxyyz*M_y + D_xxyyzz*M_yz + D_xxyyzzz*M_yzz &
      + D_xxyz*M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz)
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    L_xx      = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxy*M_xxxxy + D_xxxxxxz*M_xxxxz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyz*M_xxxyz + &
      D_xxxxxz*M_xxxz + D_xxxxxzz*M_xxxzz + D_xxxxy*M_xxy + D_xxxxyy* &
      M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyz*M_xxyyz + D_xxxxyz*M_xxyz &
      + D_xxxxyzz*M_xxyzz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz &
      *M_xxzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy*M_xyyy + &
      D_xxxyyyy*M_xyyyy + D_xxxyyyz*M_xyyyz + D_xxxyyz*M_xyyz + &
      D_xxxyyzz*M_xyyzz + D_xxxyz*M_xyz + D_xxxyzz*M_xyzz + D_xxxyzzz* &
      M_xyzzz + D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz*M_xzzz + &
      D_xxxzzzz*M_xzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyz*M_yyyyz + &
      D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + D_xxyyz*M_yyz + D_xxyyzz* &
      M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + &
      D_xxyzzz*M_yzzz + D_xxyzzzz*M_yzzzz + D_xxz*M_z + D_xxzz*M_zz + &
      D_xxzzz*M_zzz + D_xxzzzz*M_zzzz + D_xxzzzzz*M_zzzzz)
    L_xxz     = L_xxz + (D_xxxxxxz*M_xxxx + D_xxxxxyz*M_xxxy + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz &
      + D_xxxxyyz*M_xxyy + D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxz* &
      M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxyyyz*M_xyyy + &
      D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyz*M_xy + D_xxxyzz*M_xyz &
      + D_xxxyzzz*M_xyzz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxxzzz*M_xzz + &
      D_xxxzzzz*M_xzzz + D_xxyyyyz*M_yyyy + D_xxyyyz*M_yyy + D_xxyyyzz* &
      M_yyyz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyyzzz*M_yyzz + &
      D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz + D_xxyzzzz*M_yzzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + &
      D_xxzzzzz*M_zzzz)
    D_xyyyyyy = v72*v92
    L_xyyyyyy = L_xyyyyyy + (D_xyyyyyy*M_0)
    D_xyyyyyz = v81*(v36 + 110.0d0*v32 - v89)
    L_xyyyyy  = L_xyyyyy + (D_xxyyyyy*M_x + D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyz*M_z)
    L_xyyyyyz = L_xyyyyyz + (D_xyyyyyz*M_0)
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    L_xyyyy   = L_xyyyy + (D_xxxyyyy*M_xx + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + &
      D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyz*M_yz + &
      D_xyyyyz*M_z + D_xyyyyzz*M_zz)
    L_xyyyyz  = L_xyyyyz + (D_xxyyyyz*M_x + D_xyyyyyz*M_y + D_xyyyyz*M_0 + D_xyyyyzz*M_z)
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    L_xyyy    = L_xyyy + (D_xxxxyyy*M_xxx + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + D_xxxyyyz*M_xxz + &
      D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyyy*M_xyy + D_xxyyyyz*M_xyz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xyyy*M_0 + D_xyyyy*M_y + &
      D_xyyyyy*M_yy + D_xyyyyyy*M_yyy + D_xyyyyyz*M_yyz + D_xyyyyz*M_yz &
      + D_xyyyyzz*M_yzz + D_xyyyz*M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz)
    L_xyyyz   = L_xyyyz + (D_xxxyyyz*M_xx + D_xxyyyyz*M_xy + D_xxyyyz*M_x + D_xxyyyzz*M_xz + &
      D_xyyyyyz*M_yy + D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + &
      D_xyyyzz*M_z + D_xyyyzzz*M_zz)
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    L_xyy     = L_xyy + (D_xxxxxyy*M_xxxx + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + D_xxxxyyz*M_xxxz &
      + D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyz* &
      M_xxyz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + D_xxyy*M_x + D_xxyyy &
      *M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + D_xxyyyyz*M_xyyz + &
      D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + D_xxyyz*M_xz + D_xxyyzz*M_xzz &
      + D_xxyyzzz*M_xzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyz*M_yyyz + D_xyyyyz* &
      M_yyz + D_xyyyyzz*M_yyzz + D_xyyyz*M_yz + D_xyyyzz*M_yzz + &
      D_xyyyzzz*M_yzzz + D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz + &
      D_xyyzzzz*M_zzzz)
    L_xyyz    = L_xyyz + (D_xxxxyyz*M_xxx + D_xxxyyyz*M_xxy + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + &
      D_xxyyyyz*M_xyy + D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyz*M_x + &
      D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xyyyyyz*M_yyy + D_xyyyyz*M_yy &
      + D_xyyyyzz*M_yyz + D_xyyyz*M_y + D_xyyyzz*M_yz + D_xyyyzzz*M_yzz &
      + D_xyyz*M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz)
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    L_xy      = L_xy + (D_xxxxxxy*M_xxxxx + D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + D_xxxxxyz* &
      M_xxxxz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy*M_xxxyy + &
      D_xxxxyyz*M_xxxyz + D_xxxxyz*M_xxxz + D_xxxxyzz*M_xxxzz + D_xxxy* &
      M_xx + D_xxxyy*M_xxy + D_xxxyyy*M_xxyy + D_xxxyyyy*M_xxyyy + &
      D_xxxyyyz*M_xxyyz + D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + D_xxxyz &
      *M_xxz + D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxy*M_x + D_xxyy &
      *M_xy + D_xxyyy*M_xyy + D_xxyyyy*M_xyyy + D_xxyyyyy*M_xyyyy + &
      D_xxyyyyz*M_xyyyz + D_xxyyyz*M_xyyz + D_xxyyyzz*M_xyyzz + D_xxyyz &
      *M_xyz + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyz*M_xz + &
      D_xxyzz*M_xzz + D_xxyzzz*M_xzzz + D_xxyzzzz*M_xzzzz + D_xy*M_0 + &
      D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + D_xyyyyy*M_yyyy + &
      D_xyyyyyy*M_yyyyy + D_xyyyyyz*M_yyyyz + D_xyyyyz*M_yyyz + &
      D_xyyyyzz*M_yyyzz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz* &
      M_yyzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz*M_yzzz + &
      D_xyyzzzz*M_yzzzz + D_xyz*M_z + D_xyzz*M_zz + D_xyzzz*M_zzz + &
      D_xyzzzz*M_zzzz + D_xyzzzzz*M_zzzzz)
    L_xyz     = L_xyz + (D_xxxxxyz*M_xxxx + D_xxxxyyz*M_xxxy + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz &
      + D_xxxyyyz*M_xxyy + D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyz* &
      M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxyyyyz*M_xyyy + &
      D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyz*M_xy + D_xxyyzz*M_xyz &
      + D_xxyyzzz*M_xyzz + D_xxyz*M_x + D_xxyzz*M_xz + D_xxyzzz*M_xzz + &
      D_xxyzzzz*M_xzzz + D_xyyyyyz*M_yyyy + D_xyyyyz*M_yyy + D_xyyyyzz* &
      M_yyyz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyyzzz*M_yyzz + &
      D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz + D_xyyzzzz*M_yzzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + &
      D_xyzzzzz*M_zzzz)
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    L_x       = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxy*M_xxxxxy + &
      D_xxxxxxz*M_xxxxxz + D_xxxxxy*M_xxxxy + D_xxxxxyy*M_xxxxyy + &
      D_xxxxxyz*M_xxxxyz + D_xxxxxz*M_xxxxz + D_xxxxxzz*M_xxxxzz + &
      D_xxxxy*M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + &
      D_xxxxz*M_xxxz + D_xxxxzz*M_xxxzz + D_xxxxzzz*M_xxxzzz + D_xxxy* &
      M_xxy + D_xxxyy*M_xxyy + D_xxxyyy*M_xxyyy + D_xxxyyyy*M_xxyyyy + &
      D_xxxyyyz*M_xxyyyz + D_xxxyyz*M_xxyyz + D_xxxyyzz*M_xxyyzz + &
      D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + D_xxxz* &
      M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxy*M_xy + D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + &
      D_xxyyyyy*M_xyyyyy + D_xxyyyyz*M_xyyyyz + D_xxyyyz*M_xyyyz + &
      D_xxyyyzz*M_xyyyzz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + &
      D_xxyyzzz*M_xyyzzz + D_xxyz*M_xyz + D_xxyzz*M_xyzz + D_xxyzzz* &
      M_xyzzz + D_xxyzzzz*M_xyzzzz + D_xxz*M_xz + D_xxzz*M_xzz + &
      D_xxzzz*M_xzzz + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xy*M_y &
      + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + &
      D_xyyyyyy*M_yyyyyy + D_xyyyyyz*M_yyyyyz + D_xyyyyz*M_yyyyz + &
      D_xyyyyzz*M_yyyyzz + D_xyyyz*M_yyyz + D_xyyyzz*M_yyyzz + &
      D_xyyyzzz*M_yyyzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz* &
      M_yyzzz + D_xyyzzzz*M_yyzzzz + D_xyz*M_yz + D_xyzz*M_yzz + &
      D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + D_xz*M_z &
      + D_xzz*M_zz + D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + &
      D_xzzzzzz*M_zzzzzz)
    L_xz      = L_xz + (D_xxxxxxz*M_xxxxx + D_xxxxxyz*M_xxxxy + D_xxxxxz*M_xxxx + D_xxxxxzz* &
      M_xxxxz + D_xxxxyyz*M_xxxyy + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz &
      + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxxxzzz*M_xxxzz + D_xxxyyyz &
      *M_xxyyy + D_xxxyyz*M_xxyy + D_xxxyyzz*M_xxyyz + D_xxxyz*M_xxy + &
      D_xxxyzz*M_xxyz + D_xxxyzzz*M_xxyzz + D_xxxz*M_xx + D_xxxzz*M_xxz &
      + D_xxxzzz*M_xxzz + D_xxxzzzz*M_xxzzz + D_xxyyyyz*M_xyyyy + &
      D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyyz*M_xyy + D_xxyyzz* &
      M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyz*M_xy + D_xxyzz*M_xyz + &
      D_xxyzzz*M_xyzz + D_xxyzzzz*M_xyzzz + D_xxz*M_x + D_xxzz*M_xz + &
      D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + D_xxzzzzz*M_xzzzz + D_xyyyyyz* &
      M_yyyyy + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + D_xyyyz*M_yyy + &
      D_xyyyzz*M_yyyz + D_xyyyzzz*M_yyyzz + D_xyyz*M_yy + D_xyyzz*M_yyz &
      + D_xyyzzz*M_yyzz + D_xyyzzzz*M_yyzzz + D_xyz*M_y + D_xyzz*M_yz + &
      D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xyzzzzz*M_yzzzz + D_xz*M_0 + &
      D_xzz*M_z + D_xzzz*M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz + &
      D_xzzzzzz*M_zzzzz)
    D_yyyyyyy = v75*(-315.0d0*v65 + 693.0d0*v70 + v73 + v91)
    L_yyyyyyy = L_yyyyyyy + (D_yyyyyyy*M_0)
    D_yyyyyyz = v77*v92
    L_yyyyyy  = L_yyyyyy + (D_xyyyyyy*M_x + D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyz*M_z)
    L_yyyyyyz = L_yyyyyyz + (D_yyyyyyz*M_0)
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    L_yyyyy   = L_yyyyy + (D_xxyyyyy*M_xx + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + &
      D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyz*M_yz + &
      D_yyyyyz*M_z + D_yyyyyzz*M_zz)
    L_yyyyyz  = L_yyyyyz + (D_xyyyyyz*M_x + D_yyyyyyz*M_y + D_yyyyyz*M_0 + D_yyyyyzz*M_z)
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    L_yyyy    = L_yyyy + (D_xxxyyyy*M_xxx + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + D_xxyyyyz*M_xxz + &
      D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyyy*M_xyy + D_xyyyyyz*M_xyz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_yyyy*M_0 + D_yyyyy*M_y + &
      D_yyyyyy*M_yy + D_yyyyyyy*M_yyy + D_yyyyyyz*M_yyz + D_yyyyyz*M_yz &
      + D_yyyyyzz*M_yzz + D_yyyyz*M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz)
    L_yyyyz   = L_yyyyz + (D_xxyyyyz*M_xx + D_xyyyyyz*M_xy + D_xyyyyz*M_x + D_xyyyyzz*M_xz + &
      D_yyyyyyz*M_yy + D_yyyyyz*M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + &
      D_yyyyzz*M_z + D_yyyyzzz*M_zz)
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    L_yyy     = L_yyy + (D_xxxxyyy*M_xxxx + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + D_xxxyyyz*M_xxxz &
      + D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyz* &
      M_xxyz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + D_xyyy*M_x + D_xyyyy &
      *M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + D_xyyyyyz*M_xyyz + &
      D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + D_xyyyz*M_xz + D_xyyyzz*M_xzz &
      + D_xyyyzzz*M_xzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyz*M_yyyz + D_yyyyyz* &
      M_yyz + D_yyyyyzz*M_yyzz + D_yyyyz*M_yz + D_yyyyzz*M_yzz + &
      D_yyyyzzz*M_yzzz + D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz + &
      D_yyyzzzz*M_zzzz)
    L_yyyz    = L_yyyz + (D_xxxyyyz*M_xxx + D_xxyyyyz*M_xxy + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + &
      D_xyyyyyz*M_xyy + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyz*M_x + &
      D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_yyyyyyz*M_yyy + D_yyyyyz*M_yy &
      + D_yyyyyzz*M_yyz + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyyzzz*M_yzz &
      + D_yyyz*M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz)
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    L_yy      = L_yy + (D_xxxxxyy*M_xxxxx + D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + D_xxxxyyz* &
      M_xxxxz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy*M_xxxyy + &
      D_xxxyyyz*M_xxxyz + D_xxxyyz*M_xxxz + D_xxxyyzz*M_xxxzz + D_xxyy* &
      M_xx + D_xxyyy*M_xxy + D_xxyyyy*M_xxyy + D_xxyyyyy*M_xxyyy + &
      D_xxyyyyz*M_xxyyz + D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + D_xxyyz &
      *M_xxz + D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xyy*M_x + D_xyyy &
      *M_xy + D_xyyyy*M_xyy + D_xyyyyy*M_xyyy + D_xyyyyyy*M_xyyyy + &
      D_xyyyyyz*M_xyyyz + D_xyyyyz*M_xyyz + D_xyyyyzz*M_xyyzz + D_xyyyz &
      *M_xyz + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyz*M_xz + &
      D_xyyzz*M_xzz + D_xyyzzz*M_xzzz + D_xyyzzzz*M_xzzzz + D_yy*M_0 + &
      D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + D_yyyyyy*M_yyyy + &
      D_yyyyyyy*M_yyyyy + D_yyyyyyz*M_yyyyz + D_yyyyyz*M_yyyz + &
      D_yyyyyzz*M_yyyzz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz* &
      M_yyzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz*M_yzzz + &
      D_yyyzzzz*M_yzzzz + D_yyz*M_z + D_yyzz*M_zz + D_yyzzz*M_zzz + &
      D_yyzzzz*M_zzzz + D_yyzzzzz*M_zzzzz)
    L_yyz     = L_yyz + (D_xxxxyyz*M_xxxx + D_xxxyyyz*M_xxxy + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz &
      + D_xxyyyyz*M_xxyy + D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyz* &
      M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xyyyyyz*M_xyyy + &
      D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyz*M_xy + D_xyyyzz*M_xyz &
      + D_xyyyzzz*M_xyzz + D_xyyz*M_x + D_xyyzz*M_xz + D_xyyzzz*M_xzz + &
      D_xyyzzzz*M_xzzz + D_yyyyyyz*M_yyyy + D_yyyyyz*M_yyy + D_yyyyyzz* &
      M_yyyz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyyzzz*M_yyzz + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz + D_yyyzzzz*M_yzzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + &
      D_yyzzzzz*M_zzzz)
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    L_y       = L_y + (D_xxxxxxy*M_xxxxxx + D_xxxxxy*M_xxxxx + D_xxxxxyy*M_xxxxxy + D_xxxxxyz* &
      M_xxxxxz + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyyy*M_xxxxyy &
      + D_xxxxyyz*M_xxxxyz + D_xxxxyz*M_xxxxz + D_xxxxyzz*M_xxxxzz + &
      D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy* &
      M_xxxyyy + D_xxxyyyz*M_xxxyyz + D_xxxyyz*M_xxxyz + D_xxxyyzz* &
      M_xxxyzz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + D_xxxyzzz*M_xxxzzz &
      + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + &
      D_xxyyyyy*M_xxyyyy + D_xxyyyyz*M_xxyyyz + D_xxyyyz*M_xxyyz + &
      D_xxyyyzz*M_xxyyzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz + D_xxyzzz* &
      M_xxzzz + D_xxyzzzz*M_xxzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy* &
      M_xyy + D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + &
      D_xyyyyyz*M_xyyyyz + D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + D_xyyyzzz*M_xyyzzz + D_xyyz* &
      M_xyz + D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + D_xyyzzzz*M_xyzzzz + &
      D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + D_xyzzzz*M_xzzzz + &
      D_xyzzzzz*M_xzzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy* &
      M_yyy + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + &
      D_yyyyyyz*M_yyyyyz + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + &
      D_yyyyz*M_yyyz + D_yyyyzz*M_yyyzz + D_yyyyzzz*M_yyyzzz + D_yyyz* &
      M_yyz + D_yyyzz*M_yyzz + D_yyyzzz*M_yyzzz + D_yyyzzzz*M_yyzzzz + &
      D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + D_yyzzzz*M_yzzzz + &
      D_yyzzzzz*M_yzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + &
      D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz)
    L_yz      = L_yz + (D_xxxxxyz*M_xxxxx + D_xxxxyyz*M_xxxxy + D_xxxxyz*M_xxxx + D_xxxxyzz* &
      M_xxxxz + D_xxxyyyz*M_xxxyy + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz &
      + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xxxyzzz*M_xxxzz + D_xxyyyyz &
      *M_xxyyy + D_xxyyyz*M_xxyy + D_xxyyyzz*M_xxyyz + D_xxyyz*M_xxy + &
      D_xxyyzz*M_xxyz + D_xxyyzzz*M_xxyzz + D_xxyz*M_xx + D_xxyzz*M_xxz &
      + D_xxyzzz*M_xxzz + D_xxyzzzz*M_xxzzz + D_xyyyyyz*M_xyyyy + &
      D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyyz*M_xyy + D_xyyyzz* &
      M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyz*M_xy + D_xyyzz*M_xyz + &
      D_xyyzzz*M_xyzz + D_xyyzzzz*M_xyzzz + D_xyz*M_x + D_xyzz*M_xz + &
      D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + D_xyzzzzz*M_xzzzz + D_yyyyyyz* &
      M_yyyyy + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + D_yyyyz*M_yyy + &
      D_yyyyzz*M_yyyz + D_yyyyzzz*M_yyyzz + D_yyyz*M_yy + D_yyyzz*M_yyz &
      + D_yyyzzz*M_yyzz + D_yyyzzzz*M_yyzzz + D_yyz*M_y + D_yyzz*M_yz + &
      D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yyzzzzz*M_yzzzz + D_yz*M_0 + &
      D_yzz*M_z + D_yzzz*M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz + &
      D_yzzzzzz*M_zzzzz)
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_0       = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxy* &
      M_xxxxxxy + D_xxxxxxz*M_xxxxxxz + D_xxxxxy*M_xxxxxy + D_xxxxxyy* &
      M_xxxxxyy + D_xxxxxyz*M_xxxxxyz + D_xxxxxz*M_xxxxxz + D_xxxxxzz* &
      M_xxxxxzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyyy* &
      M_xxxxyyy + D_xxxxyyz*M_xxxxyyz + D_xxxxyz*M_xxxxyz + D_xxxxyzz* &
      M_xxxxyzz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxxzzz* &
      M_xxxxzzz + D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + &
      D_xxxyyyy*M_xxxyyyy + D_xxxyyyz*M_xxxyyyz + D_xxxyyz*M_xxxyyz + &
      D_xxxyyzz*M_xxxyyzz + D_xxxyz*M_xxxyz + D_xxxyzz*M_xxxyzz + &
      D_xxxyzzz*M_xxxyzzz + D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + D_xxxzzz* &
      M_xxxzzz + D_xxxzzzz*M_xxxzzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + &
      D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy*M_xxyyyyy + &
      D_xxyyyyz*M_xxyyyyz + D_xxyyyz*M_xxyyyz + D_xxyyyzz*M_xxyyyzz + &
      D_xxyyz*M_xxyyz + D_xxyyzz*M_xxyyzz + D_xxyyzzz*M_xxyyzzz + &
      D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxyzzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xxzzz*M_xxzzz + &
      D_xxzzzz*M_xxzzzz + D_xxzzzzz*M_xxzzzzz + D_xy*M_xy + D_xyy*M_xyy &
      + D_xyyy*M_xyyy + D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyyy &
      *M_xyyyyyy + D_xyyyyyz*M_xyyyyyz + D_xyyyyz*M_xyyyyz + D_xyyyyzz* &
      M_xyyyyzz + D_xyyyz*M_xyyyz + D_xyyyzz*M_xyyyzz + D_xyyyzzz* &
      M_xyyyzzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz + &
      D_xyyzzzz*M_xyyzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz* &
      M_xyzzz + D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + D_xz*M_xz + &
      D_xzz*M_xzz + D_xzzz*M_xzzz + D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz &
      + D_xzzzzzz*M_xzzzzzz + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + &
      D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + D_yyyyyyy* &
      M_yyyyyyy + D_yyyyyyz*M_yyyyyyz + D_yyyyyz*M_yyyyyz + D_yyyyyzz* &
      M_yyyyyzz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + D_yyyyzzz* &
      M_yyyyzzz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + &
      D_yyyzzzz*M_yyyzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + D_yyzzz* &
      M_yyzzz + D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + D_yz*M_yz + &
      D_yzz*M_yzz + D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz &
      + D_yzzzzzz*M_yzzzzzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + &
      D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz*M_zzzzzz + D_zzzzzzz* &
      M_zzzzzzz)
    L_z       = L_z + (D_xxxxxxz*M_xxxxxx + D_xxxxxyz*M_xxxxxy + D_xxxxxz*M_xxxxx + D_xxxxxzz* &
      M_xxxxxz + D_xxxxyyz*M_xxxxyy + D_xxxxyz*M_xxxxy + D_xxxxyzz* &
      M_xxxxyz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + D_xxxxzzz*M_xxxxzz &
      + D_xxxyyyz*M_xxxyyy + D_xxxyyz*M_xxxyy + D_xxxyyzz*M_xxxyyz + &
      D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + D_xxxz* &
      M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz*M_xxxzzz + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyz*M_xxyyy + D_xxyyyzz*M_xxyyyz + &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyz* &
      M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + D_xxyzzzz*M_xxyzzz + &
      D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + D_xxzzzz*M_xxzzz + &
      D_xxzzzzz*M_xxzzzz + D_xyyyyyz*M_xyyyyy + D_xyyyyz*M_xyyyy + &
      D_xyyyyzz*M_xyyyyz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + &
      D_xyyyzzz*M_xyyyzz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyyzzz* &
      M_xyyzz + D_xyyzzzz*M_xyyzzz + D_xyz*M_xy + D_xyzz*M_xyz + &
      D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + D_xyzzzzz*M_xyzzzz + D_xz*M_x &
      + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz*M_xzzzz + &
      D_xzzzzzz*M_xzzzzz + D_yyyyyyz*M_yyyyyy + D_yyyyyz*M_yyyyy + &
      D_yyyyyzz*M_yyyyyz + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + &
      D_yyyyzzz*M_yyyyzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz* &
      M_yyyzz + D_yyyzzzz*M_yyyzzz + D_yyz*M_yy + D_yyzz*M_yyz + &
      D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz*M_yyzzzz + D_yz*M_y &
      + D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + &
      D_yzzzzzz*M_yzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz + D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz)
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
#undef  M_zz                
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxx               
#undef  L_xxz               
#undef  M_xxy               
#undef  L_xyy               
#undef  M_xxz               
#undef  L_xyz               
#undef  M_xyy               
#undef  L_yyy               
#undef  M_xyz               
#undef  M_xzz               
#undef  L_yyz               
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
#undef  M_xyzz              
#undef  L_xxxyy             
#undef  M_xzzz              
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  M_yyyy              
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
#undef  L_xxxxxx            
#undef  M_xxxxy             
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxxz            
#undef  M_xxxyz             
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  L_xxxyyy            
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  L_xxxyyz            
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  M_xxzzz             
#undef  L_xyyyyy            
#undef  M_xyyyy             
#undef  L_xyyyyz            
#undef  M_xyyyz             
#undef  L_yyyyyy            
#undef  M_xyyzz             
#undef  L_yyyyyz            
#undef  M_xyzzz             
#undef  L_xxxxxxx           
#undef  M_xzzzz             
#undef  L_xxxxxxy           
#undef  M_yyyyy             
#undef  M_yyyyz             
#undef  L_xxxxxxz           
#undef  M_yyyzz             
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  L_xxxxyyy           
#undef  M_zzzzz             
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  M_xxxxxx            
#undef  L_xxxyyyz           
#undef  M_xxxxxy            
#undef  L_xxyyyyy           
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  L_xxyyyyz           
#undef  M_xxxxyz            
#undef  L_xyyyyyy           
#undef  M_xxxxzz            
#undef  L_xyyyyyz           
#undef  M_xxxyyy            
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_xxxyyz            
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  M_xxyzzz            
#undef  M_xxzzzz            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  M_xyyzzz            
#undef  M_xyzzzz            
#undef  M_xzzzzz            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  M_yyyyzz            
#undef  M_yyyzzz            
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  M_zzzzzz            
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  M_xxxxxzz           
#undef  M_xxxxyyy           
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  M_xxxxzzz           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  M_xxxzzzz           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  M_xxyyyzz           
#undef  M_xxyyzzz           
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  M_xyyyyyy           
#undef  M_xyyyyyz           
#undef  M_xyyyyzz           
#undef  M_xyyyzzz           
#undef  M_xyyzzzz           
#undef  M_xyzzzzz           
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  M_yyyyyyz           
#undef  M_yyyyyzz           
#undef  M_yyyyzzz           
#undef  M_yyyzzzz           
#undef  M_yyzzzzz           
#undef  M_yzzzzzz           
#undef  M_zzzzzzz           
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
    
! OPS  1265*ADD + 2*DIV + 1496*MUL + 82*NEG + POW + 35*SUB = 2881  (3828 before optimization)
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
                v12, v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22,&
                v23, v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
                v34, v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44,&
                v45, v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55,&
                v56, v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66,&
                v67, v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77,&
                v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88,&
                v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h,&
                u, D_0, D_x, D_y, D_z, D_xx, D_xy, D_xz, D_yy, D_yz, D_zz,&
                D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz, D_yyy, D_yyz, D_yzz,&
                D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy, D_xxyz, D_xxzz, D_xyyy,&
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
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz
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
#define M_zz                 M(1:2,9)
#define L_xxx                L(1:2,9)
#define L_xxy                L(1:2,10)
#define M_xxx                M(1:2,10)
#define L_xxz                L(1:2,11)
#define M_xxy                M(1:2,11)
#define L_xyy                L(1:2,12)
#define M_xxz                M(1:2,12)
#define L_xyz                L(1:2,13)
#define M_xyy                M(1:2,13)
#define L_yyy                L(1:2,14)
#define M_xyz                M(1:2,14)
#define M_xzz                M(1:2,15)
#define L_yyz                L(1:2,15)
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
#define M_xyzz               M(1:2,28)
#define L_xxxyy              L(1:2,28)
#define M_xzzz               M(1:2,29)
#define L_xxxyz              L(1:2,29)
#define L_xxyyy              L(1:2,30)
#define M_yyyy               M(1:2,30)
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
#define L_xxxxxx             L(1:2,36)
#define M_xxxxy              M(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define M_xxxxz              M(1:2,37)
#define M_xxxyy              M(1:2,38)
#define L_xxxxxz             L(1:2,38)
#define M_xxxyz              M(1:2,39)
#define L_xxxxyy             L(1:2,39)
#define L_xxxxyz             L(1:2,40)
#define M_xxxzz              M(1:2,40)
#define L_xxxyyy             L(1:2,41)
#define M_xxyyy              M(1:2,41)
#define M_xxyyz              M(1:2,42)
#define L_xxxyyz             L(1:2,42)
#define M_xxyzz              M(1:2,43)
#define L_xxyyyy             L(1:2,43)
#define L_xxyyyz             L(1:2,44)
#define M_xxzzz              M(1:2,44)
#define L_xyyyyy             L(1:2,45)
#define M_xyyyy              M(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define M_xyyyz              M(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define M_xyyzz              M(1:2,47)
#define L_yyyyyz             L(1:2,48)
#define M_xyzzz              M(1:2,48)
#define L_xxxxxxx            L(1:2,49)
#define M_xzzzz              M(1:2,49)
#define L_xxxxxxy            L(1:2,50)
#define M_yyyyy              M(1:2,50)
#define M_yyyyz              M(1:2,51)
#define L_xxxxxxz            L(1:2,51)
#define M_yyyzz              M(1:2,52)
#define L_xxxxxyy            L(1:2,52)
#define L_xxxxxyz            L(1:2,53)
#define M_yyzzz              M(1:2,53)
#define M_yzzzz              M(1:2,54)
#define L_xxxxyyy            L(1:2,54)
#define M_zzzzz              M(1:2,55)
#define L_xxxxyyz            L(1:2,55)
#define L_xxxyyyy            L(1:2,56)
#define M_xxxxxx             M(1:2,56)
#define L_xxxyyyz            L(1:2,57)
#define M_xxxxxy             M(1:2,57)
#define L_xxyyyyy            L(1:2,58)
#define M_xxxxxz             M(1:2,58)
#define M_xxxxyy             M(1:2,59)
#define L_xxyyyyz            L(1:2,59)
#define M_xxxxyz             M(1:2,60)
#define L_xyyyyyy            L(1:2,60)
#define M_xxxxzz             M(1:2,61)
#define L_xyyyyyz            L(1:2,61)
#define M_xxxyyy             M(1:2,62)
#define L_yyyyyyy            L(1:2,62)
#define L_yyyyyyz            L(1:2,63)
#define M_xxxyyz             M(1:2,63)
#define M_xxxyzz             M(1:2,64)
#define M_xxxzzz             M(1:2,65)
#define M_xxyyyy             M(1:2,66)
#define M_xxyyyz             M(1:2,67)
#define M_xxyyzz             M(1:2,68)
#define M_xxyzzz             M(1:2,69)
#define M_xxzzzz             M(1:2,70)
#define M_xyyyyy             M(1:2,71)
#define M_xyyyyz             M(1:2,72)
#define M_xyyyzz             M(1:2,73)
#define M_xyyzzz             M(1:2,74)
#define M_xyzzzz             M(1:2,75)
#define M_xzzzzz             M(1:2,76)
#define M_yyyyyy             M(1:2,77)
#define M_yyyyyz             M(1:2,78)
#define M_yyyyzz             M(1:2,79)
#define M_yyyzzz             M(1:2,80)
#define M_yyzzzz             M(1:2,81)
#define M_yzzzzz             M(1:2,82)
#define M_zzzzzz             M(1:2,83)
#define M_xxxxxxx            M(1:2,84)
#define M_xxxxxxy            M(1:2,85)
#define M_xxxxxxz            M(1:2,86)
#define M_xxxxxyy            M(1:2,87)
#define M_xxxxxyz            M(1:2,88)
#define M_xxxxxzz            M(1:2,89)
#define M_xxxxyyy            M(1:2,90)
#define M_xxxxyyz            M(1:2,91)
#define M_xxxxyzz            M(1:2,92)
#define M_xxxxzzz            M(1:2,93)
#define M_xxxyyyy            M(1:2,94)
#define M_xxxyyyz            M(1:2,95)
#define M_xxxyyzz            M(1:2,96)
#define M_xxxyzzz            M(1:2,97)
#define M_xxxzzzz            M(1:2,98)
#define M_xxyyyyy            M(1:2,99)
#define M_xxyyyyz            M(1:2,100)
#define M_xxyyyzz            M(1:2,101)
#define M_xxyyzzz            M(1:2,102)
#define M_xxyzzzz            M(1:2,103)
#define M_xxzzzzz            M(1:2,104)
#define M_xyyyyyy            M(1:2,105)
#define M_xyyyyyz            M(1:2,106)
#define M_xyyyyzz            M(1:2,107)
#define M_xyyyzzz            M(1:2,108)
#define M_xyyzzzz            M(1:2,109)
#define M_xyzzzzz            M(1:2,110)
#define M_xzzzzzz            M(1:2,111)
#define M_yyyyyyy            M(1:2,112)
#define M_yyyyyyz            M(1:2,113)
#define M_yyyyyzz            M(1:2,114)
#define M_yyyyzzz            M(1:2,115)
#define M_yyyzzzz            M(1:2,116)
#define M_yyzzzzz            M(1:2,117)
#define M_yzzzzzz            M(1:2,118)
#define M_zzzzzzz            M(1:2,119)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v110      = y*z
    v111      = 945.0d0*x
    v103      = 15.0d0*v110
    v107      = v110
    v61       = v111
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v0        = a2
    v93       = 5.0d0*v0
    v5        = 3.0d0*v0
    v10       = v93
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
    v94       = v0*v1
    v7        = 3.0d0*v1
    v14       = 5.0d0*v1
    v27       = v94
    v29       = 7.0d0*v1
    v59       = v1*v19
    v80       = -429.0d0*v59
    b3        = b1*b2
    b4        = b2*b2
    v31       = b4
    v66       = v0*v31
    v67       = 33.0d0*v31
    v89       = 143.0d0*v31
    v90       = -429.0d0*v66
    b5        = b2*b3
    b6        = b3*b3
    v69       = b6
    v91       = -429.0d0*v69
    b7        = b3*b4
    c2        = c1*c1
    h         = c2 + v0 + v1
    v95       = 3.0d0*h
    v96       = h*v0
    v97       = h*v1
    v98       = h*v19
    v99       = h*v31
    v4        = -h
    v12       = v95
    v13       = -15.0d0*v1 + v12
    v17       = h*h
    v18       = 3.0d0*v17
    v20       = v96
    v21       = -30.0d0*v20
    v23       = -v12
    v25       = v23 + v24
    v30       = v23 + v29
    v32       = v97
    v33       = -30.0d0*v32
    v36       = -15.0d0*v17
    v37       = -45.0d0*v17
    v38       = v37 - 945.0d0*v19 + 630.0d0*v96
    v40       = -(v18 + 63.0d0*v27)
    v43       = v37 - 945.0d0*v31 + 630.0d0*v97
    v46       = h*h*h
    v47       = 5.0d0*v46
    v48       = -v47
    v50       = v98
    v51       = v0*v17
    v53       = 5.0d0*v17
    v55       = v21 + v53 + v54
    v57       = v1*v96
    v58       = -(v46 + 126.0d0*v57)
    v62       = -v0*v12
    v63       = -v1*v12
    v64       = v17 + 33.0d0*v27
    v65       = v1*v17
    v68       = v33 + v53 + v67
    v70       = v99
    v73       = 35.0d0*v46
    v76       = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78       = v47 + 330.0d0*v57
    v79       = h*v54
    v83       = -18.0d0*v51 + v46 + v79
    v84       = 66.0d0*v57
    v109      = -v84
    v85       = 9.0d0*v17
    v86       = 198.0d0*v57
    v87       = h*v67
    v88       = -18.0d0*v65 + v46 + v87
    v92       = v47 + v91 - 135.0d0*v65 + 495.0d0*v70
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
    v100      = 3.0d0*v3
    v6        = v100*x
    D_xx      = v3*(v4 + v5)
    D_xy      = v6*y
    D_xz      = v6*z
    D_yy      = v3*(v4 + v7)
    D_yz      = v100*v107
    D_zz      = -(D_xx + D_yy)
    u6        = u3*u3
    u7        = u3*u4
    v8        = u7
    v101      = 3.0d0*v8
    v9        = v8*x
    v11       = v101*(h - v10)
    D_xxx     = -3.0d0*v9*(v93 - v95)
    D_xxy     = v11*y
    D_xxz     = v11*z
    D_xyy     = v13*v9
    D_xyz     = -v103*v9
    D_xzz     = -(D_xxx + D_xyy)
    D_yyy     = v101*y*(v12 - v14)
    D_yyz     = v13*v8*z
    D_yzz     = -(D_xxy + D_yyy)
    D_zzz     = -(D_xxz + D_yyz)
    u8        = u4*u4
    u9        = u4*u5
    v15       = u9
    v102      = 15.0d0*v15*x
    v16       = 3.0d0*v15
    v22       = v102*y
    v26       = v102*z
    v28       = v103*v15
    D_xxxx    = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy    = v22*v25
    D_xxxz    = v25*v26
    D_xxyy    = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz    = v28*(v24 + v4)
    D_xxzz    = -(D_xxxx + D_xxyy)
    D_xyyy    = v22*v30
    D_xyyz    = v26*(v29 + v4)
    D_xyzz    = -(D_xxxy + D_xyyy)
    D_xzzz    = -(D_xxxz + D_xyyz)
    D_yyyy    = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz    = v28*v30
    D_yyzz    = -(D_xxyy + D_yyyy)
    D_yzzz    = -(D_xxyz + D_yyyz)
    D_zzzz    = -(D_xxzz + D_yyzz)
    u10       = u5*u5
    u11       = u5*u6
    v34       = u11
    v104      = 15.0d0*v34
    v105      = v34*z
    v35       = v104*x
    v39       = v105
    v41       = 315.0d0*v105*x*y
    v42       = v104*y
    D_xxxxx   = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy   = v34*v38*y
    D_xxxxz   = v38*v39
    D_xxxyy   = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz   = v41*(h - v5)
    D_xxxzz   = -(D_xxxxx + D_xxxyy)
    D_xxyyy   = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz   = v39*(v36 - 945.0d0*v94 + 105.0d0*(v96 + v97))
    D_xxyzz   = -(D_xxxxy + D_xxyyy)
    D_xxzzz   = -(D_xxxxz + D_xxyyz)
    D_xyyyy   = v34*v43*x
    D_xyyyz   = v41*(h - v7)
    D_xyyzz   = -(D_xxxyy + D_xyyyy)
    D_xyzzz   = -(D_xxxyz + D_xyyyz)
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
    v112      = 315.0d0*v44
    v106      = v112*x
    v45       = 45.0d0*v44
    v52       = v106*y
    v56       = v106*z
    v60       = v107*v112
    D_xxxxxx  = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy  = v52*v55
    D_xxxxxz  = v55*v56
    D_xxxxyy  = v45*(v58 + v17*v29 + 14.0d0*v51 + 231.0d0*v59 - 21.0d0*v98)
    D_xxxxyz  = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz  = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy  = v44*v61*y*(11.0d0*v27 + v17 + v62 + v63)
    D_xxxyyz  = v56*(-9.0d0*v32 + v62 + v64)
    D_xxxyzz  = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz  = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy  = v45*(v58 + v17*v24 + 14.0d0*v65 + 231.0d0*v66 - 21.0d0*v99)
    D_xxyyyz  = v60*(-9.0d0*v20 + v63 + v64)
    D_xxyyzz  = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz  = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz  = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy  = v52*v68
    D_xyyyyz  = v56*(-18.0d0*v32 + v17 + v67)
    D_xyyyzz  = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz  = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz  = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz  = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy  = v45*(v48 + 105.0d0*v65 + 231.0d0*v69 - 315.0d0*v70)
    D_yyyyyz  = v60*v68
    D_yyyyzz  = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz  = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz  = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz  = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz  = -(D_xxzzzz + D_yyzzzz)
    u14       = u7*u7
    u15       = u7*u8
    v71       = u15
    v108      = 315.0d0*v71
    v72       = v108*x
    v75       = v108*y
    v77       = v108*z
    v81       = v107*v111*v71
    D_xxxxxxx = v72*(693.0d0*v50 - 315.0d0*v51 + v73 + v74)
    L_xxxxxxx = D_xxxxxxx*M_0
    D_xxxxxxy = v75*v76
    L_xxxxxxy = D_xxxxxxy*M_0
    D_xxxxxxz = v76*v77
    L_xxxxxx  = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxy*M_y + D_xxxxxxz*M_z
    L_xxxxxxz = D_xxxxxxz*M_0
    D_xxxxxyy = v72*(-30.0d0*v51 - 45.0d0*v65 + v78 + v79 + v80)
    L_xxxxxyy = D_xxxxxyy*M_0
    D_xxxxxyz = v81*(v36 + 110.0d0*v20 - v82)
    L_xxxxxy  = D_xxxxxxy*M_x + D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyz*M_z
    L_xxxxxyz = D_xxxxxyz*M_0
    D_xxxxxzz = -(D_xxxxxxx + D_xxxxxyy)
    L_xxxxx   = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxy*M_xy + D_xxxxxxz &
      *M_xz + D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyz*M_yz + D_xxxxxz &
      *M_z + D_xxxxxzz*M_zz
    L_xxxxxz  = D_xxxxxxz*M_x + D_xxxxxyz*M_y + D_xxxxxz*M_0 + D_xxxxxzz*M_z
    D_xxxxyyy = -945.0d0*v71*y*(v109 + v1*v18 + v1*v82 - v83)
    L_xxxxyyy = D_xxxxyyy*M_0
    D_xxxxyyz = v77*(-v1*v85 + v80 + v83 + v86)
    L_xxxxyy  = D_xxxxxyy*M_x + D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyz*M_z
    L_xxxxyyz = D_xxxxyyz*M_0
    D_xxxxyzz = -(D_xxxxxxy + D_xxxxyyy)
    L_xxxxy   = D_xxxxxxy*M_xx + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyz*M_xz + &
      D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyz*M_yz + &
      D_xxxxyz*M_z + D_xxxxyzz*M_zz
    L_xxxxyz  = D_xxxxxyz*M_x + D_xxxxyyz*M_y + D_xxxxyz*M_0 + D_xxxxyzz*M_z
    D_xxxxzzz = -(D_xxxxxxz + D_xxxxyyz)
    L_xxxx    = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxy* &
      M_xxy + D_xxxxxxz*M_xxz + D_xxxxxy*M_xy + D_xxxxxyy*M_xyy + &
      D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxy*M_y + &
      D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + D_xxxxyyz*M_yyz + D_xxxxyz*M_yz &
      + D_xxxxyzz*M_yzz + D_xxxxz*M_z + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz
    L_xxxxz   = D_xxxxxxz*M_xx + D_xxxxxyz*M_xy + D_xxxxxz*M_x + D_xxxxxzz*M_xz + &
      D_xxxxyyz*M_yy + D_xxxxyz*M_y + D_xxxxyzz*M_yz + D_xxxxz*M_0 + &
      D_xxxxzz*M_z + D_xxxxzzz*M_zz
    D_xxxyyyy = -v61*v71*(v109 + v0*v18 + v0*v89 - v88)
    L_xxxyyyy = D_xxxyyyy*M_0
    D_xxxyyyz = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v85))
    L_xxxyyy  = D_xxxxyyy*M_x + D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyz*M_z
    L_xxxyyyz = D_xxxyyyz*M_0
    D_xxxyyzz = -(D_xxxxxyy + D_xxxyyyy)
    L_xxxyy   = D_xxxxxyy*M_xx + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyz*M_xz + &
      D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyz*M_yz + &
      D_xxxyyz*M_z + D_xxxyyzz*M_zz
    L_xxxyyz  = D_xxxxyyz*M_x + D_xxxyyyz*M_y + D_xxxyyz*M_0 + D_xxxyyzz*M_z
    D_xxxyzzz = -(D_xxxxxyz + D_xxxyyyz)
    L_xxxy    = D_xxxxxxy*M_xxx + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + D_xxxxxyz*M_xxz + &
      D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyyy*M_xyy + D_xxxxyyz*M_xyz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxy*M_0 + D_xxxyy*M_y + &
      D_xxxyyy*M_yy + D_xxxyyyy*M_yyy + D_xxxyyyz*M_yyz + D_xxxyyz*M_yz &
      + D_xxxyyzz*M_yzz + D_xxxyz*M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz
    L_xxxyz   = D_xxxxxyz*M_xx + D_xxxxyyz*M_xy + D_xxxxyz*M_x + D_xxxxyzz*M_xz + &
      D_xxxyyyz*M_yy + D_xxxyyz*M_y + D_xxxyyzz*M_yz + D_xxxyz*M_0 + &
      D_xxxyzz*M_z + D_xxxyzzz*M_zz
    D_xxxzzzz = -(D_xxxxxzz + D_xxxyyzz)
    L_xxx     = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxy*M_xxxy + D_xxxxxxz*M_xxxz + D_xxxxxy*M_xxy + &
      D_xxxxxyy*M_xxyy + D_xxxxxyz*M_xxyz + D_xxxxxz*M_xxz + D_xxxxxzz* &
      M_xxzz + D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyyy*M_xyyy + &
      D_xxxxyyz*M_xyyz + D_xxxxyz*M_xyz + D_xxxxyzz*M_xyzz + D_xxxxz* &
      M_xz + D_xxxxzz*M_xzz + D_xxxxzzz*M_xzzz + D_xxxy*M_y + D_xxxyy* &
      M_yy + D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyz*M_yyyz + &
      D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + D_xxxyz*M_yz + D_xxxyzz*M_yzz &
      + D_xxxyzzz*M_yzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz + &
      D_xxxzzzz*M_zzzz
    L_xxxz    = D_xxxxxxz*M_xxx + D_xxxxxyz*M_xxy + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + &
      D_xxxxyyz*M_xyy + D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxz*M_x + &
      D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxyyyz*M_yyy + D_xxxyyz*M_yy &
      + D_xxxyyzz*M_yyz + D_xxxyz*M_y + D_xxxyzz*M_yz + D_xxxyzzz*M_yzz &
      + D_xxxz*M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz
    D_xxyyyyy = v75*(-45.0d0*v51 - 30.0d0*v65 + v78 + v87 + v90)
    L_xxyyyyy = D_xxyyyyy*M_0
    D_xxyyyyz = v77*(-v0*v85 + v86 + v88 + v90)
    L_xxyyyy  = D_xxxyyyy*M_x + D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyz*M_z
    L_xxyyyyz = D_xxyyyyz*M_0
    D_xxyyyzz = -(D_xxxxyyy + D_xxyyyyy)
    L_xxyyy   = D_xxxxyyy*M_xx + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyz*M_xz + &
      D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyz*M_yz + &
      D_xxyyyz*M_z + D_xxyyyzz*M_zz
    L_xxyyyz  = D_xxxyyyz*M_x + D_xxyyyyz*M_y + D_xxyyyz*M_0 + D_xxyyyzz*M_z
    D_xxyyzzz = -(D_xxxxyyz + D_xxyyyyz)
    L_xxyy    = D_xxxxxyy*M_xxx + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + D_xxxxyyz*M_xxz + &
      D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyyy*M_xyy + D_xxxyyyz*M_xyz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxyy*M_0 + D_xxyyy*M_y + &
      D_xxyyyy*M_yy + D_xxyyyyy*M_yyy + D_xxyyyyz*M_yyz + D_xxyyyz*M_yz &
      + D_xxyyyzz*M_yzz + D_xxyyz*M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz
    L_xxyyz   = D_xxxxyyz*M_xx + D_xxxyyyz*M_xy + D_xxxyyz*M_x + D_xxxyyzz*M_xz + &
      D_xxyyyyz*M_yy + D_xxyyyz*M_y + D_xxyyyzz*M_yz + D_xxyyz*M_0 + &
      D_xxyyzz*M_z + D_xxyyzzz*M_zz
    D_xxyzzzz = -(D_xxxxyzz + D_xxyyyzz)
    L_xxy     = D_xxxxxxy*M_xxxx + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + D_xxxxxyz*M_xxxz &
      + D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyz* &
      M_xxyz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + D_xxxy*M_x + D_xxxyy &
      *M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + D_xxxyyyz*M_xyyz + &
      D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + D_xxxyz*M_xz + D_xxxyzz*M_xzz &
      + D_xxxyzzz*M_xzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyz*M_yyyz + D_xxyyyz* &
      M_yyz + D_xxyyyzz*M_yyzz + D_xxyyz*M_yz + D_xxyyzz*M_yzz + &
      D_xxyyzzz*M_yzzz + D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz + &
      D_xxyzzzz*M_zzzz
    L_xxyz    = D_xxxxxyz*M_xxx + D_xxxxyyz*M_xxy + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + &
      D_xxxyyyz*M_xyy + D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyz*M_x + &
      D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxyyyyz*M_yyy + D_xxyyyz*M_yy &
      + D_xxyyyzz*M_yyz + D_xxyyz*M_y + D_xxyyzz*M_yz + D_xxyyzzz*M_yzz &
      + D_xxyz*M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz
    D_xxzzzzz = -(D_xxxxzzz + D_xxyyzzz)
    L_xx      = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxy*M_xxxxy + D_xxxxxxz*M_xxxxz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyz*M_xxxyz + &
      D_xxxxxz*M_xxxz + D_xxxxxzz*M_xxxzz + D_xxxxy*M_xxy + D_xxxxyy* &
      M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyz*M_xxyyz + D_xxxxyz*M_xxyz &
      + D_xxxxyzz*M_xxyzz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz &
      *M_xxzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy*M_xyyy + &
      D_xxxyyyy*M_xyyyy + D_xxxyyyz*M_xyyyz + D_xxxyyz*M_xyyz + &
      D_xxxyyzz*M_xyyzz + D_xxxyz*M_xyz + D_xxxyzz*M_xyzz + D_xxxyzzz* &
      M_xyzzz + D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz*M_xzzz + &
      D_xxxzzzz*M_xzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyz*M_yyyyz + &
      D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + D_xxyyz*M_yyz + D_xxyyzz* &
      M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + &
      D_xxyzzz*M_yzzz + D_xxyzzzz*M_yzzzz + D_xxz*M_z + D_xxzz*M_zz + &
      D_xxzzz*M_zzz + D_xxzzzz*M_zzzz + D_xxzzzzz*M_zzzzz
    L_xxz     = D_xxxxxxz*M_xxxx + D_xxxxxyz*M_xxxy + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz &
      + D_xxxxyyz*M_xxyy + D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxz* &
      M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxyyyz*M_xyyy + &
      D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyz*M_xy + D_xxxyzz*M_xyz &
      + D_xxxyzzz*M_xyzz + D_xxxz*M_x + D_xxxzz*M_xz + D_xxxzzz*M_xzz + &
      D_xxxzzzz*M_xzzz + D_xxyyyyz*M_yyyy + D_xxyyyz*M_yyy + D_xxyyyzz* &
      M_yyyz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyyzzz*M_yyzz + &
      D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz + D_xxyzzzz*M_yzzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + &
      D_xxzzzzz*M_zzzz
    D_xyyyyyy = v72*v92
    L_xyyyyyy = D_xyyyyyy*M_0
    D_xyyyyyz = v81*(v36 + 110.0d0*v32 - v89)
    L_xyyyyy  = D_xxyyyyy*M_x + D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyz*M_z
    L_xyyyyyz = D_xyyyyyz*M_0
    D_xyyyyzz = -(D_xxxyyyy + D_xyyyyyy)
    L_xyyyy   = D_xxxyyyy*M_xx + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyz*M_xz + &
      D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyz*M_yz + &
      D_xyyyyz*M_z + D_xyyyyzz*M_zz
    L_xyyyyz  = D_xxyyyyz*M_x + D_xyyyyyz*M_y + D_xyyyyz*M_0 + D_xyyyyzz*M_z
    D_xyyyzzz = -(D_xxxyyyz + D_xyyyyyz)
    L_xyyy    = D_xxxxyyy*M_xxx + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + D_xxxyyyz*M_xxz + &
      D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyyy*M_xyy + D_xxyyyyz*M_xyz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xyyy*M_0 + D_xyyyy*M_y + &
      D_xyyyyy*M_yy + D_xyyyyyy*M_yyy + D_xyyyyyz*M_yyz + D_xyyyyz*M_yz &
      + D_xyyyyzz*M_yzz + D_xyyyz*M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz
    L_xyyyz   = D_xxxyyyz*M_xx + D_xxyyyyz*M_xy + D_xxyyyz*M_x + D_xxyyyzz*M_xz + &
      D_xyyyyyz*M_yy + D_xyyyyz*M_y + D_xyyyyzz*M_yz + D_xyyyz*M_0 + &
      D_xyyyzz*M_z + D_xyyyzzz*M_zz
    D_xyyzzzz = -(D_xxxyyzz + D_xyyyyzz)
    L_xyy     = D_xxxxxyy*M_xxxx + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + D_xxxxyyz*M_xxxz &
      + D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyz* &
      M_xxyz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + D_xxyy*M_x + D_xxyyy &
      *M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + D_xxyyyyz*M_xyyz + &
      D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + D_xxyyz*M_xz + D_xxyyzz*M_xzz &
      + D_xxyyzzz*M_xzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyz*M_yyyz + D_xyyyyz* &
      M_yyz + D_xyyyyzz*M_yyzz + D_xyyyz*M_yz + D_xyyyzz*M_yzz + &
      D_xyyyzzz*M_yzzz + D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz + &
      D_xyyzzzz*M_zzzz
    L_xyyz    = D_xxxxyyz*M_xxx + D_xxxyyyz*M_xxy + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + &
      D_xxyyyyz*M_xyy + D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyz*M_x + &
      D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xyyyyyz*M_yyy + D_xyyyyz*M_yy &
      + D_xyyyyzz*M_yyz + D_xyyyz*M_y + D_xyyyzz*M_yz + D_xyyyzzz*M_yzz &
      + D_xyyz*M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz
    D_xyzzzzz = -(D_xxxyzzz + D_xyyyzzz)
    L_xy      = D_xxxxxxy*M_xxxxx + D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + D_xxxxxyz* &
      M_xxxxz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy*M_xxxyy + &
      D_xxxxyyz*M_xxxyz + D_xxxxyz*M_xxxz + D_xxxxyzz*M_xxxzz + D_xxxy* &
      M_xx + D_xxxyy*M_xxy + D_xxxyyy*M_xxyy + D_xxxyyyy*M_xxyyy + &
      D_xxxyyyz*M_xxyyz + D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + D_xxxyz &
      *M_xxz + D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxy*M_x + D_xxyy &
      *M_xy + D_xxyyy*M_xyy + D_xxyyyy*M_xyyy + D_xxyyyyy*M_xyyyy + &
      D_xxyyyyz*M_xyyyz + D_xxyyyz*M_xyyz + D_xxyyyzz*M_xyyzz + D_xxyyz &
      *M_xyz + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyz*M_xz + &
      D_xxyzz*M_xzz + D_xxyzzz*M_xzzz + D_xxyzzzz*M_xzzzz + D_xy*M_0 + &
      D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + D_xyyyyy*M_yyyy + &
      D_xyyyyyy*M_yyyyy + D_xyyyyyz*M_yyyyz + D_xyyyyz*M_yyyz + &
      D_xyyyyzz*M_yyyzz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz* &
      M_yyzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz*M_yzzz + &
      D_xyyzzzz*M_yzzzz + D_xyz*M_z + D_xyzz*M_zz + D_xyzzz*M_zzz + &
      D_xyzzzz*M_zzzz + D_xyzzzzz*M_zzzzz
    L_xyz     = D_xxxxxyz*M_xxxx + D_xxxxyyz*M_xxxy + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz &
      + D_xxxyyyz*M_xxyy + D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyz* &
      M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxyyyyz*M_xyyy + &
      D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyz*M_xy + D_xxyyzz*M_xyz &
      + D_xxyyzzz*M_xyzz + D_xxyz*M_x + D_xxyzz*M_xz + D_xxyzzz*M_xzz + &
      D_xxyzzzz*M_xzzz + D_xyyyyyz*M_yyyy + D_xyyyyz*M_yyy + D_xyyyyzz* &
      M_yyyz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyyzzz*M_yyzz + &
      D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz + D_xyyzzzz*M_yzzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + &
      D_xyzzzzz*M_zzzz
    D_xzzzzzz = -(D_xxxzzzz + D_xyyzzzz)
    L_x       = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxy*M_xxxxxy + &
      D_xxxxxxz*M_xxxxxz + D_xxxxxy*M_xxxxy + D_xxxxxyy*M_xxxxyy + &
      D_xxxxxyz*M_xxxxyz + D_xxxxxz*M_xxxxz + D_xxxxxzz*M_xxxxzz + &
      D_xxxxy*M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + &
      D_xxxxz*M_xxxz + D_xxxxzz*M_xxxzz + D_xxxxzzz*M_xxxzzz + D_xxxy* &
      M_xxy + D_xxxyy*M_xxyy + D_xxxyyy*M_xxyyy + D_xxxyyyy*M_xxyyyy + &
      D_xxxyyyz*M_xxyyyz + D_xxxyyz*M_xxyyz + D_xxxyyzz*M_xxyyzz + &
      D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + D_xxxz* &
      M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxy*M_xy + D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + &
      D_xxyyyyy*M_xyyyyy + D_xxyyyyz*M_xyyyyz + D_xxyyyz*M_xyyyz + &
      D_xxyyyzz*M_xyyyzz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + &
      D_xxyyzzz*M_xyyzzz + D_xxyz*M_xyz + D_xxyzz*M_xyzz + D_xxyzzz* &
      M_xyzzz + D_xxyzzzz*M_xyzzzz + D_xxz*M_xz + D_xxzz*M_xzz + &
      D_xxzzz*M_xzzz + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xy*M_y &
      + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + &
      D_xyyyyyy*M_yyyyyy + D_xyyyyyz*M_yyyyyz + D_xyyyyz*M_yyyyz + &
      D_xyyyyzz*M_yyyyzz + D_xyyyz*M_yyyz + D_xyyyzz*M_yyyzz + &
      D_xyyyzzz*M_yyyzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz* &
      M_yyzzz + D_xyyzzzz*M_yyzzzz + D_xyz*M_yz + D_xyzz*M_yzz + &
      D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + D_xz*M_z &
      + D_xzz*M_zz + D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + &
      D_xzzzzzz*M_zzzzzz
    L_xz      = D_xxxxxxz*M_xxxxx + D_xxxxxyz*M_xxxxy + D_xxxxxz*M_xxxx + D_xxxxxzz* &
      M_xxxxz + D_xxxxyyz*M_xxxyy + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz &
      + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxxxzzz*M_xxxzz + D_xxxyyyz &
      *M_xxyyy + D_xxxyyz*M_xxyy + D_xxxyyzz*M_xxyyz + D_xxxyz*M_xxy + &
      D_xxxyzz*M_xxyz + D_xxxyzzz*M_xxyzz + D_xxxz*M_xx + D_xxxzz*M_xxz &
      + D_xxxzzz*M_xxzz + D_xxxzzzz*M_xxzzz + D_xxyyyyz*M_xyyyy + &
      D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyyz*M_xyy + D_xxyyzz* &
      M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyz*M_xy + D_xxyzz*M_xyz + &
      D_xxyzzz*M_xyzz + D_xxyzzzz*M_xyzzz + D_xxz*M_x + D_xxzz*M_xz + &
      D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + D_xxzzzzz*M_xzzzz + D_xyyyyyz* &
      M_yyyyy + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + D_xyyyz*M_yyy + &
      D_xyyyzz*M_yyyz + D_xyyyzzz*M_yyyzz + D_xyyz*M_yy + D_xyyzz*M_yyz &
      + D_xyyzzz*M_yyzz + D_xyyzzzz*M_yyzzz + D_xyz*M_y + D_xyzz*M_yz + &
      D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xyzzzzz*M_yzzzz + D_xz*M_0 + &
      D_xzz*M_z + D_xzzz*M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz + &
      D_xzzzzzz*M_zzzzz
    D_yyyyyyy = v75*(-315.0d0*v65 + 693.0d0*v70 + v73 + v91)
    L_yyyyyyy = D_yyyyyyy*M_0
    D_yyyyyyz = v77*v92
    L_yyyyyy  = D_xyyyyyy*M_x + D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyz*M_z
    L_yyyyyyz = D_yyyyyyz*M_0
    D_yyyyyzz = -(D_xxyyyyy + D_yyyyyyy)
    L_yyyyy   = D_xxyyyyy*M_xx + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyz*M_xz + &
      D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyz*M_yz + &
      D_yyyyyz*M_z + D_yyyyyzz*M_zz
    L_yyyyyz  = D_xyyyyyz*M_x + D_yyyyyyz*M_y + D_yyyyyz*M_0 + D_yyyyyzz*M_z
    D_yyyyzzz = -(D_xxyyyyz + D_yyyyyyz)
    L_yyyy    = D_xxxyyyy*M_xxx + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + D_xxyyyyz*M_xxz + &
      D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyyy*M_xyy + D_xyyyyyz*M_xyz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_yyyy*M_0 + D_yyyyy*M_y + &
      D_yyyyyy*M_yy + D_yyyyyyy*M_yyy + D_yyyyyyz*M_yyz + D_yyyyyz*M_yz &
      + D_yyyyyzz*M_yzz + D_yyyyz*M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz
    L_yyyyz   = D_xxyyyyz*M_xx + D_xyyyyyz*M_xy + D_xyyyyz*M_x + D_xyyyyzz*M_xz + &
      D_yyyyyyz*M_yy + D_yyyyyz*M_y + D_yyyyyzz*M_yz + D_yyyyz*M_0 + &
      D_yyyyzz*M_z + D_yyyyzzz*M_zz
    D_yyyzzzz = -(D_xxyyyzz + D_yyyyyzz)
    L_yyy     = D_xxxxyyy*M_xxxx + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + D_xxxyyyz*M_xxxz &
      + D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyz* &
      M_xxyz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + D_xyyy*M_x + D_xyyyy &
      *M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + D_xyyyyyz*M_xyyz + &
      D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + D_xyyyz*M_xz + D_xyyyzz*M_xzz &
      + D_xyyyzzz*M_xzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyz*M_yyyz + D_yyyyyz* &
      M_yyz + D_yyyyyzz*M_yyzz + D_yyyyz*M_yz + D_yyyyzz*M_yzz + &
      D_yyyyzzz*M_yzzz + D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz + &
      D_yyyzzzz*M_zzzz
    L_yyyz    = D_xxxyyyz*M_xxx + D_xxyyyyz*M_xxy + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + &
      D_xyyyyyz*M_xyy + D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyz*M_x + &
      D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_yyyyyyz*M_yyy + D_yyyyyz*M_yy &
      + D_yyyyyzz*M_yyz + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyyzzz*M_yzz &
      + D_yyyz*M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz
    D_yyzzzzz = -(D_xxyyzzz + D_yyyyzzz)
    L_yy      = D_xxxxxyy*M_xxxxx + D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + D_xxxxyyz* &
      M_xxxxz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy*M_xxxyy + &
      D_xxxyyyz*M_xxxyz + D_xxxyyz*M_xxxz + D_xxxyyzz*M_xxxzz + D_xxyy* &
      M_xx + D_xxyyy*M_xxy + D_xxyyyy*M_xxyy + D_xxyyyyy*M_xxyyy + &
      D_xxyyyyz*M_xxyyz + D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + D_xxyyz &
      *M_xxz + D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xyy*M_x + D_xyyy &
      *M_xy + D_xyyyy*M_xyy + D_xyyyyy*M_xyyy + D_xyyyyyy*M_xyyyy + &
      D_xyyyyyz*M_xyyyz + D_xyyyyz*M_xyyz + D_xyyyyzz*M_xyyzz + D_xyyyz &
      *M_xyz + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyz*M_xz + &
      D_xyyzz*M_xzz + D_xyyzzz*M_xzzz + D_xyyzzzz*M_xzzzz + D_yy*M_0 + &
      D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + D_yyyyyy*M_yyyy + &
      D_yyyyyyy*M_yyyyy + D_yyyyyyz*M_yyyyz + D_yyyyyz*M_yyyz + &
      D_yyyyyzz*M_yyyzz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz* &
      M_yyzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz*M_yzzz + &
      D_yyyzzzz*M_yzzzz + D_yyz*M_z + D_yyzz*M_zz + D_yyzzz*M_zzz + &
      D_yyzzzz*M_zzzz + D_yyzzzzz*M_zzzzz
    L_yyz     = D_xxxxyyz*M_xxxx + D_xxxyyyz*M_xxxy + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz &
      + D_xxyyyyz*M_xxyy + D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyz* &
      M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xyyyyyz*M_xyyy + &
      D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyz*M_xy + D_xyyyzz*M_xyz &
      + D_xyyyzzz*M_xyzz + D_xyyz*M_x + D_xyyzz*M_xz + D_xyyzzz*M_xzz + &
      D_xyyzzzz*M_xzzz + D_yyyyyyz*M_yyyy + D_yyyyyz*M_yyy + D_yyyyyzz* &
      M_yyyz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyyzzz*M_yyzz + &
      D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz + D_yyyzzzz*M_yzzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + &
      D_yyzzzzz*M_zzzz
    D_yzzzzzz = -(D_xxyzzzz + D_yyyzzzz)
    L_y       = D_xxxxxxy*M_xxxxxx + D_xxxxxy*M_xxxxx + D_xxxxxyy*M_xxxxxy + D_xxxxxyz* &
      M_xxxxxz + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyyy*M_xxxxyy &
      + D_xxxxyyz*M_xxxxyz + D_xxxxyz*M_xxxxz + D_xxxxyzz*M_xxxxzz + &
      D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy* &
      M_xxxyyy + D_xxxyyyz*M_xxxyyz + D_xxxyyz*M_xxxyz + D_xxxyyzz* &
      M_xxxyzz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + D_xxxyzzz*M_xxxzzz &
      + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + &
      D_xxyyyyy*M_xxyyyy + D_xxyyyyz*M_xxyyyz + D_xxyyyz*M_xxyyz + &
      D_xxyyyzz*M_xxyyzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz + D_xxyzzz* &
      M_xxzzz + D_xxyzzzz*M_xxzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy* &
      M_xyy + D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + &
      D_xyyyyyz*M_xyyyyz + D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + D_xyyyzzz*M_xyyzzz + D_xyyz* &
      M_xyz + D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + D_xyyzzzz*M_xyzzzz + &
      D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + D_xyzzzz*M_xzzzz + &
      D_xyzzzzz*M_xzzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy* &
      M_yyy + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + &
      D_yyyyyyz*M_yyyyyz + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + &
      D_yyyyz*M_yyyz + D_yyyyzz*M_yyyzz + D_yyyyzzz*M_yyyzzz + D_yyyz* &
      M_yyz + D_yyyzz*M_yyzz + D_yyyzzz*M_yyzzz + D_yyyzzzz*M_yyzzzz + &
      D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + D_yyzzzz*M_yzzzz + &
      D_yyzzzzz*M_yzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + &
      D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz
    L_yz      = D_xxxxxyz*M_xxxxx + D_xxxxyyz*M_xxxxy + D_xxxxyz*M_xxxx + D_xxxxyzz* &
      M_xxxxz + D_xxxyyyz*M_xxxyy + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz &
      + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xxxyzzz*M_xxxzz + D_xxyyyyz &
      *M_xxyyy + D_xxyyyz*M_xxyy + D_xxyyyzz*M_xxyyz + D_xxyyz*M_xxy + &
      D_xxyyzz*M_xxyz + D_xxyyzzz*M_xxyzz + D_xxyz*M_xx + D_xxyzz*M_xxz &
      + D_xxyzzz*M_xxzz + D_xxyzzzz*M_xxzzz + D_xyyyyyz*M_xyyyy + &
      D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyyz*M_xyy + D_xyyyzz* &
      M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyz*M_xy + D_xyyzz*M_xyz + &
      D_xyyzzz*M_xyzz + D_xyyzzzz*M_xyzzz + D_xyz*M_x + D_xyzz*M_xz + &
      D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + D_xyzzzzz*M_xzzzz + D_yyyyyyz* &
      M_yyyyy + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + D_yyyyz*M_yyy + &
      D_yyyyzz*M_yyyz + D_yyyyzzz*M_yyyzz + D_yyyz*M_yy + D_yyyzz*M_yyz &
      + D_yyyzzz*M_yyzz + D_yyyzzzz*M_yyzzz + D_yyz*M_y + D_yyzz*M_yz + &
      D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yyzzzzz*M_yzzzz + D_yz*M_0 + &
      D_yzz*M_z + D_yzzz*M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz + &
      D_yzzzzzz*M_zzzzz
    D_zzzzzzz = -(D_xxzzzzz + D_yyzzzzz)
    L_0       = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxy* &
      M_xxxxxxy + D_xxxxxxz*M_xxxxxxz + D_xxxxxy*M_xxxxxy + D_xxxxxyy* &
      M_xxxxxyy + D_xxxxxyz*M_xxxxxyz + D_xxxxxz*M_xxxxxz + D_xxxxxzz* &
      M_xxxxxzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyyy* &
      M_xxxxyyy + D_xxxxyyz*M_xxxxyyz + D_xxxxyz*M_xxxxyz + D_xxxxyzz* &
      M_xxxxyzz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxxzzz* &
      M_xxxxzzz + D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + &
      D_xxxyyyy*M_xxxyyyy + D_xxxyyyz*M_xxxyyyz + D_xxxyyz*M_xxxyyz + &
      D_xxxyyzz*M_xxxyyzz + D_xxxyz*M_xxxyz + D_xxxyzz*M_xxxyzz + &
      D_xxxyzzz*M_xxxyzzz + D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + D_xxxzzz* &
      M_xxxzzz + D_xxxzzzz*M_xxxzzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + &
      D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy*M_xxyyyyy + &
      D_xxyyyyz*M_xxyyyyz + D_xxyyyz*M_xxyyyz + D_xxyyyzz*M_xxyyyzz + &
      D_xxyyz*M_xxyyz + D_xxyyzz*M_xxyyzz + D_xxyyzzz*M_xxyyzzz + &
      D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxyzzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xxzzz*M_xxzzz + &
      D_xxzzzz*M_xxzzzz + D_xxzzzzz*M_xxzzzzz + D_xy*M_xy + D_xyy*M_xyy &
      + D_xyyy*M_xyyy + D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyyy &
      *M_xyyyyyy + D_xyyyyyz*M_xyyyyyz + D_xyyyyz*M_xyyyyz + D_xyyyyzz* &
      M_xyyyyzz + D_xyyyz*M_xyyyz + D_xyyyzz*M_xyyyzz + D_xyyyzzz* &
      M_xyyyzzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz + &
      D_xyyzzzz*M_xyyzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz* &
      M_xyzzz + D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + D_xz*M_xz + &
      D_xzz*M_xzz + D_xzzz*M_xzzz + D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz &
      + D_xzzzzzz*M_xzzzzzz + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + &
      D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + D_yyyyyyy* &
      M_yyyyyyy + D_yyyyyyz*M_yyyyyyz + D_yyyyyz*M_yyyyyz + D_yyyyyzz* &
      M_yyyyyzz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + D_yyyyzzz* &
      M_yyyyzzz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + &
      D_yyyzzzz*M_yyyzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + D_yyzzz* &
      M_yyzzz + D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + D_yz*M_yz + &
      D_yzz*M_yzz + D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz &
      + D_yzzzzzz*M_yzzzzzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + &
      D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz*M_zzzzzz + D_zzzzzzz* &
      M_zzzzzzz
    L_z       = D_xxxxxxz*M_xxxxxx + D_xxxxxyz*M_xxxxxy + D_xxxxxz*M_xxxxx + D_xxxxxzz* &
      M_xxxxxz + D_xxxxyyz*M_xxxxyy + D_xxxxyz*M_xxxxy + D_xxxxyzz* &
      M_xxxxyz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + D_xxxxzzz*M_xxxxzz &
      + D_xxxyyyz*M_xxxyyy + D_xxxyyz*M_xxxyy + D_xxxyyzz*M_xxxyyz + &
      D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + D_xxxz* &
      M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz*M_xxxzzz + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyz*M_xxyyy + D_xxyyyzz*M_xxyyyz + &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyz* &
      M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + D_xxyzzzz*M_xxyzzz + &
      D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + D_xxzzzz*M_xxzzz + &
      D_xxzzzzz*M_xxzzzz + D_xyyyyyz*M_xyyyyy + D_xyyyyz*M_xyyyy + &
      D_xyyyyzz*M_xyyyyz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + &
      D_xyyyzzz*M_xyyyzz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyyzzz* &
      M_xyyzz + D_xyyzzzz*M_xyyzzz + D_xyz*M_xy + D_xyzz*M_xyz + &
      D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + D_xyzzzzz*M_xyzzzz + D_xz*M_x &
      + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz*M_xzzzz + &
      D_xzzzzzz*M_xzzzzz + D_yyyyyyz*M_yyyyyy + D_yyyyyz*M_yyyyy + &
      D_yyyyyzz*M_yyyyyz + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + &
      D_yyyyzzz*M_yyyyzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz* &
      M_yyyzz + D_yyyzzzz*M_yyyzzz + D_yyz*M_yy + D_yyzz*M_yyz + &
      D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz*M_yyzzzz + D_yz*M_y &
      + D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + &
      D_yzzzzzz*M_yzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz + D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz
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
#undef  M_zz                
#undef  L_xxx               
#undef  L_xxy               
#undef  M_xxx               
#undef  L_xxz               
#undef  M_xxy               
#undef  L_xyy               
#undef  M_xxz               
#undef  L_xyz               
#undef  M_xyy               
#undef  L_yyy               
#undef  M_xyz               
#undef  M_xzz               
#undef  L_yyz               
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
#undef  M_xyzz              
#undef  L_xxxyy             
#undef  M_xzzz              
#undef  L_xxxyz             
#undef  L_xxyyy             
#undef  M_yyyy              
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
#undef  L_xxxxxx            
#undef  M_xxxxy             
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxxz            
#undef  M_xxxyz             
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  L_xxxyyy            
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  L_xxxyyz            
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  L_xxyyyz            
#undef  M_xxzzz             
#undef  L_xyyyyy            
#undef  M_xyyyy             
#undef  L_xyyyyz            
#undef  M_xyyyz             
#undef  L_yyyyyy            
#undef  M_xyyzz             
#undef  L_yyyyyz            
#undef  M_xyzzz             
#undef  L_xxxxxxx           
#undef  M_xzzzz             
#undef  L_xxxxxxy           
#undef  M_yyyyy             
#undef  M_yyyyz             
#undef  L_xxxxxxz           
#undef  M_yyyzz             
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  L_xxxxyyy           
#undef  M_zzzzz             
#undef  L_xxxxyyz           
#undef  L_xxxyyyy           
#undef  M_xxxxxx            
#undef  L_xxxyyyz           
#undef  M_xxxxxy            
#undef  L_xxyyyyy           
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  L_xxyyyyz           
#undef  M_xxxxyz            
#undef  L_xyyyyyy           
#undef  M_xxxxzz            
#undef  L_xyyyyyz           
#undef  M_xxxyyy            
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_xxxyyz            
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  M_xxyzzz            
#undef  M_xxzzzz            
#undef  M_xyyyyy            
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  M_xyyzzz            
#undef  M_xyzzzz            
#undef  M_xzzzzz            
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  M_yyyyzz            
#undef  M_yyyzzz            
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  M_zzzzzz            
#undef  M_xxxxxxx           
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  M_xxxxxzz           
#undef  M_xxxxyyy           
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  M_xxxxzzz           
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  M_xxxzzzz           
#undef  M_xxyyyyy           
#undef  M_xxyyyyz           
#undef  M_xxyyyzz           
#undef  M_xxyyzzz           
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  M_xyyyyyy           
#undef  M_xyyyyyz           
#undef  M_xyyyyzz           
#undef  M_xyyyzzz           
#undef  M_xyyzzzz           
#undef  M_xyzzzzz           
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  M_yyyyyyz           
#undef  M_yyyyyzz           
#undef  M_yyyyzzz           
#undef  M_yyyzzzz           
#undef  M_yyzzzzz           
#undef  M_yzzzzzz           
#undef  M_zzzzzzz           
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
