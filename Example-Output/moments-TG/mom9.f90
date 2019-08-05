!
! This file was automatically generated with moments11.py in the DEV directory.
! DO NOT modify this file.
! Generated on: 2019-Aug-04 with python 2.7.16 and sympy 1.1.1
!
#include "polaris.h"
module mom9
use types
implicit none
#if FMM_EXPANSION_ORDER==9
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
        
    
! OPS  2*ADD + 2*DIV + 407*MUL + POW = 412  (1116 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v106,&
                v107, v108, v109, v11, v110, v111, v112, v113, v114, v115,&
                v116, v117, v118, v119, v12, v120, v121, v122, v123, v124,&
                v125, v126, v127, v128, v129, v13, v130, v131, v132, v133,&
                v134, v135, v136, v137, v138, v139, v14, v140, v141, v142,&
                v143, v144, v15, v16, v17, v18, v19, v2, v20, v21, v22, v23,&
                v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34,&
                v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45,&
                v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u
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
#define M_xxxxxxxx           M(120)
#define M_xxxxxxxy           M(121)
#define M_xxxxxxxz           M(122)
#define M_xxxxxxyy           M(123)
#define M_xxxxxxyz           M(124)
#define M_xxxxxxzz           M(125)
#define M_xxxxxyyy           M(126)
#define M_xxxxxyyz           M(127)
#define M_xxxxxyzz           M(128)
#define M_xxxxxzzz           M(129)
#define M_xxxxyyyy           M(130)
#define M_xxxxyyyz           M(131)
#define M_xxxxyyzz           M(132)
#define M_xxxxyzzz           M(133)
#define M_xxxxzzzz           M(134)
#define M_xxxyyyyy           M(135)
#define M_xxxyyyyz           M(136)
#define M_xxxyyyzz           M(137)
#define M_xxxyyzzz           M(138)
#define M_xxxyzzzz           M(139)
#define M_xxxzzzzz           M(140)
#define M_xxyyyyyy           M(141)
#define M_xxyyyyyz           M(142)
#define M_xxyyyyzz           M(143)
#define M_xxyyyzzz           M(144)
#define M_xxyyzzzz           M(145)
#define M_xxyzzzzz           M(146)
#define M_xxzzzzzz           M(147)
#define M_xyyyyyyy           M(148)
#define M_xyyyyyyz           M(149)
#define M_xyyyyyzz           M(150)
#define M_xyyyyzzz           M(151)
#define M_xyyyzzzz           M(152)
#define M_xyyzzzzz           M(153)
#define M_xyzzzzzz           M(154)
#define M_xzzzzzzz           M(155)
#define M_yyyyyyyy           M(156)
#define M_yyyyyyyz           M(157)
#define M_yyyyyyzz           M(158)
#define M_yyyyyzzz           M(159)
#define M_yyyyzzzz           M(160)
#define M_yyyzzzzz           M(161)
#define M_yyzzzzzz           M(162)
#define M_yzzzzzzz           M(163)
#define M_zzzzzzzz           M(164)
#define M_xxxxxxxxx          M(165)
#define M_xxxxxxxxy          M(166)
#define M_xxxxxxxxz          M(167)
#define M_xxxxxxxyy          M(168)
#define M_xxxxxxxyz          M(169)
#define M_xxxxxxxzz          M(170)
#define M_xxxxxxyyy          M(171)
#define M_xxxxxxyyz          M(172)
#define M_xxxxxxyzz          M(173)
#define M_xxxxxxzzz          M(174)
#define M_xxxxxyyyy          M(175)
#define M_xxxxxyyyz          M(176)
#define M_xxxxxyyzz          M(177)
#define M_xxxxxyzzz          M(178)
#define M_xxxxxzzzz          M(179)
#define M_xxxxyyyyy          M(180)
#define M_xxxxyyyyz          M(181)
#define M_xxxxyyyzz          M(182)
#define M_xxxxyyzzz          M(183)
#define M_xxxxyzzzz          M(184)
#define M_xxxxzzzzz          M(185)
#define M_xxxyyyyyy          M(186)
#define M_xxxyyyyyz          M(187)
#define M_xxxyyyyzz          M(188)
#define M_xxxyyyzzz          M(189)
#define M_xxxyyzzzz          M(190)
#define M_xxxyzzzzz          M(191)
#define M_xxxzzzzzz          M(192)
#define M_xxyyyyyyy          M(193)
#define M_xxyyyyyyz          M(194)
#define M_xxyyyyyzz          M(195)
#define M_xxyyyyzzz          M(196)
#define M_xxyyyzzzz          M(197)
#define M_xxyyzzzzz          M(198)
#define M_xxyzzzzzz          M(199)
#define M_xxzzzzzzz          M(200)
#define M_xyyyyyyyy          M(201)
#define M_xyyyyyyyz          M(202)
#define M_xyyyyyyzz          M(203)
#define M_xyyyyyzzz          M(204)
#define M_xyyyyzzzz          M(205)
#define M_xyyyzzzzz          M(206)
#define M_xyyzzzzzz          M(207)
#define M_xyzzzzzzz          M(208)
#define M_xzzzzzzzz          M(209)
#define M_yyyyyyyyy          M(210)
#define M_yyyyyyyyz          M(211)
#define M_yyyyyyyzz          M(212)
#define M_yyyyyyzzz          M(213)
#define M_yyyyyzzzz          M(214)
#define M_yyyyzzzzz          M(215)
#define M_yyyzzzzzz          M(216)
#define M_yyzzzzzzz          M(217)
#define M_yzzzzzzzz          M(218)
#define M_zzzzzzzzz          M(219)
    v125        = W*y
    v126        = W*z
    v127        = 0.5d0*W
    v128        = 0.166666666666667d0*W
    v129        = 0.0416666666666667d0*W
    v132        = 0.00833333333333333d0*W
    v135        = 0.00138888888888889d0*W
    v138        = 0.000198412698412698d0*W
    v141        = 2.48015873015873d-5*W
    v144        = 9.92063492063492d-5*W
    v0          = W*x
    v1          = v125
    v2          = v126
    v3          = v127
    v5          = v0*y
    v6          = v0*z
    v8          = v1*z
    v10         = v128
    v13         = v127*x
    v18         = v129
    v22         = v128*x
    v29         = v132
    v36         = v129*x
    v45         = v135
    v54         = v132*x
    v64         = v138
    v76         = v135*x
    v87         = v141
    v101        = v138*x
    v112        = 2.75573192239859d-6*W
    v124        = v141*x
    M_0         = W
    M_x         = v0
    M_y         = v1
    M_z         = v2
    M_xy        = v5
    M_xz        = v6
    M_yz        = v8
    M_xyz       = v5*z
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v4          = a2
    v130        = W*v4
    v12         = 0.5d0*v4
    v21         = 0.25d0*v130
    v33         = 0.0833333333333333d0*v130
    v34         = v126*v4
    v35         = v125*v4
    v52         = 0.0208333333333333d0*v130
    v72         = 0.00416666666666667d0*v130
    v73         = v129*v4
    v98         = 0.000694444444444444d0*v130
    v123        = 9.92063492063492d-5*v130
    M_xx        = v3*v4
    M_xxy       = v1*v12
    M_xxz       = v12*v2
    M_xxyz      = v12*v8
    a3          = a1*a2
    v11         = a3
    v133        = W*v11
    v20         = 0.166666666666667d0*v11
    v32         = 0.0833333333333333d0*v133
    v49         = 0.0277777777777778d0*v133
    v50         = v133*z
    v51         = v133*y
    v71         = 0.00694444444444444d0*v133
    v96         = v11*v135
    v97         = 0.0138888888888889d0*v133
    v120        = 0.000231481481481481d0*v133
    v121        = v133
    M_xxx       = v10*v11
    M_xxxy      = v1*v20
    M_xxxz      = v2*v20
    M_xxxyz     = v20*v8
    a4          = a2*a2
    v19         = a4
    v136        = W*v19
    v31         = 0.0416666666666667d0*v19
    v48         = 0.0208333333333333d0*v136
    v68         = 0.00694444444444444d0*v136
    v69         = v126*v19
    v70         = v125*v19
    v94         = 0.00173611111111111d0*v136
    v118        = 0.000347222222222222d0*v136
    v119        = 0.00347222222222222d0*v136
    M_xxxx      = v18*v19
    M_xxxxy     = v1*v31
    M_xxxxz     = v2*v31
    M_xxxxyz    = v31*v8
    a5          = a2*a3
    v30         = a5
    v139        = W*v30
    v47         = 0.00833333333333333d0*v30
    v67         = 0.00416666666666667d0*v139
    v91         = v135*v30
    v92         = v126*v30
    v93         = v125*v30
    v116        = 0.000347222222222222d0*v139
    M_xxxxx     = v29*v30
    M_xxxxxy    = v1*v47
    M_xxxxxz    = v2*v47
    M_xxxxxyz   = v47*v8
    a6          = a3*a3
    v46         = a6
    v142        = W*v46
    v66         = 0.00138888888888889d0*v46
    v90         = 0.000694444444444444d0*v142
    v115        = 0.000231481481481481d0*v142
    M_xxxxxx    = v45*v46
    M_xxxxxxy   = v1*v66
    M_xxxxxxz   = v2*v66
    M_xxxxxxyz  = v66*v8
    a7          = a3*a4
    v65         = a7
    v89         = 0.000198412698412698d0*v65
    v114        = v144*v65
    M_xxxxxxx   = v64*v65
    M_xxxxxxxy  = v1*v89
    M_xxxxxxxz  = v2*v89
    M_xxxxxxxyz = v8*v89
    a8          = a4*a4
    v88         = a8
    v113        = 2.48015873015873d-5*v88
    M_xxxxxxxx  = v87*v88
    M_xxxxxxxxy = v1*v113
    M_xxxxxxxxz = v113*v2
    a9          = a4*a5
    M_xxxxxxxxx = a9*v112
    b2          = b1*b1
    v7          = b2
    v131        = W*v7
    v15         = 0.5d0*v7
    v26         = v131
    v37         = v131*x
    v53         = v131*v4
    M_yy        = v3*v7
    M_xyy       = v13*v7
    M_yyz       = v15*v2
    M_xxyy      = v21*v7
    M_xyyz      = v15*v6
    M_xxxyy     = v32*v7
    M_xxyyz     = 0.25d0*v34*v7
    M_xxxxyy    = v48*v7
    M_xxxyyz    = 0.0833333333333333d0*v50*v7
    M_xxxxxyy   = v67*v7
    M_xxxxyyz   = 0.0208333333333333d0*v69*v7
    M_xxxxxxyy  = v7*v90
    M_xxxxxyyz  = 0.00416666666666667d0*v7*v92
    M_xxxxxxxyy = v114*v7
    M_xxxxxxyyz = 0.000694444444444444d0*v2*v46*v7
    b3          = b1*b2
    v14         = b3
    v134        = W*v14
    v24         = 0.166666666666667d0*v14
    v41         = v134
    v55         = v134*x
    v100        = v134*v4
    M_yyy       = v10*v14
    M_xyyy      = v14*v22
    M_yyyz      = v2*v24
    M_xxyyy     = v14*v33
    M_xyyyz     = v24*v6
    M_xxxyyy    = v14*v49
    M_xxyyyz    = 0.0833333333333333d0*v14*v34
    M_xxxxyyy   = v14*v68
    M_xxxyyyz   = 0.0277777777777778d0*v14*v50
    M_xxxxxyyy  = v14*v91
    M_xxxxyyyz  = 0.00694444444444444d0*v14*v69
    M_xxxxxxyyy = v115*v14
    M_xxxxxyyyz = 0.00138888888888889d0*v14*v92
    b4          = b2*b2
    v23         = b4
    v137        = W*v23
    v39         = 0.0416666666666667d0*v23
    v59         = v137
    v77         = v137*x
    v99         = v137*v4
    M_yyyy      = v18*v23
    M_xyyyy     = v23*v36
    M_yyyyz     = v2*v39
    M_xxyyyy    = v23*v52
    M_xyyyyz    = v39*v6
    M_xxxyyyy   = v23*v71
    M_xxyyyyz   = 0.0208333333333333d0*v23*v34
    M_xxxxyyyy  = v23*v94
    M_xxxyyyyz  = 0.00694444444444444d0*v23*v50
    M_xxxxxyyyy = v116*v23
    M_xxxxyyyyz = 0.00173611111111111d0*v23*v69
    b5          = b2*b3
    v38         = b5
    v140        = W*v38
    v57         = 0.00833333333333333d0*v38
    v81         = v140
    M_yyyyy     = v29*v38
    M_xyyyyy    = v38*v54
    M_yyyyyz    = v2*v57
    M_xxyyyyy   = v38*v72
    M_xyyyyyz   = v57*v6
    M_xxxyyyyy  = v38*v96
    M_xxyyyyyz  = 0.00416666666666667d0*v34*v38
    M_xxxxyyyyy = v118*v38
    M_xxxyyyyyz = 0.00138888888888889d0*v38*v50
    b6          = b3*b3
    v56         = b6
    v143        = W*v56
    v79         = 0.00138888888888889d0*v56
    v105        = v143
    M_yyyyyy    = v45*v56
    M_xyyyyyy   = v56*v76
    M_yyyyyyz   = v2*v79
    M_xxyyyyyy  = v56*v98
    M_xyyyyyyz  = v6*v79
    M_xxxyyyyyy = v120*v56
    M_xxyyyyyyz = 0.000694444444444444d0*v34*v56
    b7          = b3*b4
    v78         = b7
    v103        = 0.000198412698412698d0*v78
    M_yyyyyyy   = v64*v78
    M_xyyyyyyy  = v101*v78
    M_yyyyyyyz  = v103*v2
    M_xxyyyyyyy = v123*v78
    M_xyyyyyyyz = v103*v6
    b8          = b4*b4
    v102        = b8
    M_yyyyyyyy  = v102*v87
    M_xyyyyyyyy = v102*v124
    M_yyyyyyyyz = 2.48015873015873d-5*v102*v2
    b9          = b4*b5
    M_yyyyyyyyy = b9*v112
    c2          = c1*c1
    v9          = c2
    v16         = 0.5d0*v9
    v25         = 0.25d0*v9
    v40         = 0.0833333333333333d0*v9
    v58         = 0.0208333333333333d0*v9
    v74         = v14*v9
    v80         = 0.00416666666666667d0*v9
    v95         = 0.0104166666666667d0*v9
    v104        = 0.000694444444444444d0*v9
    v117        = 0.00208333333333333d0*v9
    M_zz        = v3*v9
    M_xzz       = v13*v9
    M_yzz       = v1*v16
    M_xxzz      = v21*v9
    M_xyzz      = v16*v5
    M_yyzz      = v25*v26
    M_xxxzz     = v32*v9
    M_xxyzz     = v25*v35
    M_xyyzz     = v25*v37
    M_yyyzz     = v40*v41
    M_xxxxzz    = v48*v9
    M_xxxyzz    = v40*v51
    M_xxyyzz    = 0.125d0*v53*v9
    M_xyyyzz    = v40*v55
    M_yyyyzz    = v58*v59
    M_xxxxxzz   = v67*v9
    M_xxxxyzz   = v58*v70
    M_xxxyyzz   = v11*v18*v7*v9
    M_xxyyyzz   = v73*v74
    M_xyyyyzz   = v58*v77
    M_yyyyyzz   = v80*v81
    M_xxxxxxzz  = v9*v90
    M_xxxxxyzz  = v80*v93
    M_xxxxyyzz  = v131*v19*v95
    M_xxxyyyzz  = v74*v97
    M_xxyyyyzz  = v95*v99
    M_xyyyyyzz  = v140*v80*x
    M_yyyyyyzz  = v104*v105
    M_xxxxxxxzz = v114*v9
    M_xxxxxxyzz = v104*v125*v46
    M_xxxxxyyzz = v117*v131*v30
    M_xxxxyyyzz = v119*v74
    M_xxxyyyyzz = 0.00347222222222222d0*v121*v23*v9
    M_xxyyyyyzz = v117*v140*v4
    M_xyyyyyyzz = v104*v143*x
    M_yyyyyyyzz = v144*v78*v9
    h           = v4 + v7 + v9
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
    u18         = u9*u9
    u19         = u10*u9
    c3          = c1*c2
    v17         = c3
    v27         = 0.166666666666667d0*v17
    v42         = 0.0833333333333333d0*v17
    v60         = 0.0277777777777778d0*v17
    v75         = v17*v7
    v82         = 0.00694444444444444d0*v17
    v106        = v17*v38
    M_zzz       = v10*v17
    M_xzzz      = v17*v22
    M_yzzz      = v1*v27
    M_xxzzz     = v17*v33
    M_xyzzz     = v27*v5
    M_yyzzz     = v26*v42
    M_xxxzzz    = v17*v49
    M_xxyzzz    = v35*v42
    M_xyyzzz    = v37*v42
    M_yyyzzz    = v41*v60
    M_xxxxzzz   = v17*v68
    M_xxxyzzz   = v51*v60
    M_xxyyzzz   = v73*v75
    M_xyyyzzz   = v55*v60
    M_yyyyzzz   = v59*v82
    M_xxxxxzzz  = v17*v91
    M_xxxxyzzz  = v70*v82
    M_xxxyyzzz  = v75*v97
    M_xxyyyzzz  = 0.0138888888888889d0*v100*v17
    M_xyyyyzzz  = v77*v82
    M_yyyyyzzz  = v106*v45
    M_xxxxxxzzz = v115*v17
    M_xxxxxyzzz = 0.00138888888888889d0*v17*v93
    M_xxxxyyzzz = v119*v75
    M_xxxyyyzzz = 0.00462962962962963d0*v121*v14*v17
    M_xxyyyyzzz = 0.00347222222222222d0*v17*v99
    M_xyyyyyzzz = v106*v76
    M_yyyyyyzzz = 0.000231481481481481d0*v105*v17
    c4          = c2*c2
    v28         = c4
    v43         = 0.0416666666666667d0*v28
    v61         = 0.0208333333333333d0*v28
    v83         = 0.00694444444444444d0*v28
    v107        = 0.00173611111111111d0*v28
    v122        = 0.00347222222222222d0*v28
    M_zzzz      = v18*v28
    M_xzzzz     = v28*v36
    M_yzzzz     = v1*v43
    M_xxzzzz    = v28*v52
    M_xyzzzz    = v43*v5
    M_yyzzzz    = v26*v61
    M_xxxzzzz   = v28*v71
    M_xxyzzzz   = v35*v61
    M_xyyzzzz   = v37*v61
    M_yyyzzzz   = v41*v83
    M_xxxxzzzz  = v28*v94
    M_xxxyzzzz  = v51*v83
    M_xxyyzzzz  = 0.0104166666666667d0*v28*v53
    M_xyyyzzzz  = v55*v83
    M_yyyyzzzz  = v107*v59
    M_xxxxxzzzz = v116*v28
    M_xxxxyzzzz = v107*v70
    M_xxxyyzzzz = v122*v133*v7
    M_xxyyyzzzz = v100*v122
    M_xyyyyzzzz = v107*v77
    M_yyyyyzzzz = 0.000347222222222222d0*v28*v81
    c5          = c2*c3
    v44         = c5
    v62         = 0.00833333333333333d0*v44
    v84         = 0.00416666666666667d0*v44
    v108        = v14*v44
    M_zzzzz     = v29*v44
    M_xzzzzz    = v44*v54
    M_yzzzzz    = v1*v62
    M_xxzzzzz   = v44*v72
    M_xyzzzzz   = v5*v62
    M_yyzzzzz   = v26*v84
    M_xxxzzzzz  = v44*v96
    M_xxyzzzzz  = v35*v84
    M_xyyzzzzz  = v37*v84
    M_yyyzzzzz  = v108*v45
    M_xxxxzzzzz = v118*v44
    M_xxxyzzzzz = 0.00138888888888889d0*v44*v51
    M_xxyyzzzzz = 0.00208333333333333d0*v44*v53
    M_xyyyzzzzz = v108*v76
    M_yyyyzzzzz = 0.000347222222222222d0*v44*v59
    c6          = c3*c3
    v63         = c6
    v85         = 0.00138888888888889d0*v63
    v109        = 0.000694444444444444d0*v63
    M_zzzzzz    = v45*v63
    M_xzzzzzz   = v63*v76
    M_yzzzzzz   = v1*v85
    M_xxzzzzzz  = v63*v98
    M_xyzzzzzz  = v5*v85
    M_yyzzzzzz  = v109*v26
    M_xxxzzzzzz = v120*v63
    M_xxyzzzzzz = v109*v35
    M_xyyzzzzzz = v109*v37
    M_yyyzzzzzz = 0.000231481481481481d0*v41*v63
    c7          = c3*c4
    v86         = c7
    v110        = 0.000198412698412698d0*v86
    M_zzzzzzz   = v64*v86
    M_xzzzzzzz  = v101*v86
    M_yzzzzzzz  = v1*v110
    M_xxzzzzzzz = v123*v86
    M_xyzzzzzzz = v110*v5
    M_yyzzzzzzz = 9.92063492063492d-5*v26*v86
    c8          = c4*c4
    v111        = c8
    M_zzzzzzzz  = v111*v87
    M_xzzzzzzzz = v111*v124
    M_yzzzzzzzz = 2.48015873015873d-5*v1*v111
    c9          = c4*c5
    M_zzzzzzzzz = c9*v112
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
#undef  M_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  M_xxxxxxzz          
#undef  M_xxxxxyyy          
#undef  M_xxxxxyyz          
#undef  M_xxxxxyzz          
#undef  M_xxxxxzzz          
#undef  M_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  M_xxxxyyzz          
#undef  M_xxxxyzzz          
#undef  M_xxxxzzzz          
#undef  M_xxxyyyyy          
#undef  M_xxxyyyyz          
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  M_xxxyzzzz          
#undef  M_xxxzzzzz          
#undef  M_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  M_xxyyyyzz          
#undef  M_xxyyyzzz          
#undef  M_xxyyzzzz          
#undef  M_xxyzzzzz          
#undef  M_xxzzzzzz          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  M_xyyyyyzz          
#undef  M_xyyyyzzz          
#undef  M_xyyyzzzz          
#undef  M_xyyzzzzz          
#undef  M_xyzzzzzz          
#undef  M_xzzzzzzz          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
#undef  M_yyyyyyzz          
#undef  M_yyyyyzzz          
#undef  M_yyyyzzzz          
#undef  M_yyyzzzzz          
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  M_zzzzzzzz          
#undef  M_xxxxxxxxx         
#undef  M_xxxxxxxxy         
#undef  M_xxxxxxxxz         
#undef  M_xxxxxxxyy         
#undef  M_xxxxxxxyz         
#undef  M_xxxxxxxzz         
#undef  M_xxxxxxyyy         
#undef  M_xxxxxxyyz         
#undef  M_xxxxxxyzz         
#undef  M_xxxxxxzzz         
#undef  M_xxxxxyyyy         
#undef  M_xxxxxyyyz         
#undef  M_xxxxxyyzz         
#undef  M_xxxxxyzzz         
#undef  M_xxxxxzzzz         
#undef  M_xxxxyyyyy         
#undef  M_xxxxyyyyz         
#undef  M_xxxxyyyzz         
#undef  M_xxxxyyzzz         
#undef  M_xxxxyzzzz         
#undef  M_xxxxzzzzz         
#undef  M_xxxyyyyyy         
#undef  M_xxxyyyyyz         
#undef  M_xxxyyyyzz         
#undef  M_xxxyyyzzz         
#undef  M_xxxyyzzzz         
#undef  M_xxxyzzzzz         
#undef  M_xxxzzzzzz         
#undef  M_xxyyyyyyy         
#undef  M_xxyyyyyyz         
#undef  M_xxyyyyyzz         
#undef  M_xxyyyyzzz         
#undef  M_xxyyyzzzz         
#undef  M_xxyyzzzzz         
#undef  M_xxyzzzzzz         
#undef  M_xxzzzzzzz         
#undef  M_xyyyyyyyy         
#undef  M_xyyyyyyyz         
#undef  M_xyyyyyyzz         
#undef  M_xyyyyyzzz         
#undef  M_xyyyyzzzz         
#undef  M_xyyyzzzzz         
#undef  M_xyyzzzzzz         
#undef  M_xyzzzzzzz         
#undef  M_xzzzzzzzz         
#undef  M_yyyyyyyyy         
#undef  M_yyyyyyyyz         
#undef  M_yyyyyyyzz         
#undef  M_yyyyyyzzz         
#undef  M_yyyyyzzzz         
#undef  M_yyyyzzzzz         
#undef  M_yyyzzzzzz         
#undef  M_yyzzzzzzz         
#undef  M_yzzzzzzzz         
#undef  M_zzzzzzzzz         
    end subroutine mom_es_P2M
    
! OPS  3843*ADD + 2*DIV + 4008*MUL + POW = 7854  (20401 before optimization)
subroutine mom_es_M2M(M, r, Ms)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v1000, v1001, v1002, v1003, v1004,&
                v1005, v1006, v1007, v1008, v1009, v101, v1010, v1011, v1012,&
                v1013, v1014, v1015, v1016, v1017, v1018, v1019, v102, v1020,&
                v1021, v1022, v1023, v1024, v1025, v1026, v1027, v1028, v1029,&
                v103, v1030, v1031, v1032, v1033, v1034, v1035, v1036, v1037,&
                v1038, v1039, v104, v1040, v1041, v1042, v1043, v1044, v1045,&
                v1046, v1047, v1048, v1049, v105, v1050, v1051, v1052, v1053,&
                v1054, v1055, v1056, v1057, v1058, v1059, v106, v1060, v1061,&
                v1062, v1063, v1064, v1065, v1066, v1067, v1068, v1069, v107,&
                v1070, v1071, v1072, v1073, v1074, v1075, v1076, v1077, v1078,&
                v1079, v108, v1080, v1081, v1082, v1083, v1084, v1085, v1086,&
                v1087, v1088, v1089, v109, v1090, v1091, v1092, v1093, v1094,&
                v1095, v1096, v1097, v1098, v1099, v11, v110, v1100, v1101,&
                v1102, v1103, v1104, v1105, v1106, v1107, v1108, v1109, v111,&
                v1110, v1111, v1112, v1113, v1114, v1115, v1116, v1117, v1118,&
                v1119, v112, v1120, v1121, v1122, v1123, v1124, v1125, v1126,&
                v1127, v1128, v1129, v113, v1130, v1131, v1132, v1133, v1134,&
                v1135, v1136, v1137, v1138, v1139, v114, v1140, v1141, v1142,&
                v1143, v1144, v1145, v1146, v115, v116, v117, v118, v119, v12,&
                v120, v121, v122, v123, v124, v125, v126, v127, v128, v129,&
                v13, v130, v131, v132, v133, v134, v135, v136, v137, v138,&
                v139, v14, v140, v141, v142, v143, v144, v145, v146, v147,&
                v148, v149, v15, v150, v151, v152, v153, v154, v155, v156,&
                v157, v158, v159, v16, v160, v161, v162, v163, v164, v165,&
                v166, v167, v168, v169, v17, v170, v171, v172, v173, v174,&
                v175, v176, v177, v178, v179, v18, v180, v181, v182, v183,&
                v184, v185, v186, v187, v188, v189, v19, v190, v191, v192,&
                v193, v194, v195, v196, v197, v198, v199, v2, v20, v200, v201,&
                v202, v203, v204, v205, v206, v207, v208, v209, v21, v210,&
                v211, v212, v213, v214, v215, v216, v217, v218, v219, v22,&
                v220, v221, v222, v223, v224, v225, v226, v227, v228, v229,&
                v23, v230, v231, v232, v233, v234, v235, v236, v237, v238,&
                v239, v24, v240, v241, v242, v243, v244, v245, v246, v247,&
                v248, v249, v25, v250, v251, v252, v253, v254, v255, v256,&
                v257, v258, v259, v26, v260, v261, v262, v263, v264, v265,&
                v266, v267, v268, v269, v27, v270, v271, v272, v273, v274,&
                v275, v276, v277, v278, v279, v28, v280, v281, v282, v283,&
                v284, v285, v286, v287, v288, v289, v29, v290, v291, v292,&
                v293, v294, v295, v296, v297, v298, v299, v3, v30, v300, v301,&
                v302, v303, v304, v305, v306, v307, v308, v309, v31, v310,&
                v311, v312, v313, v314, v315, v316, v317, v318, v319, v32,&
                v320, v321, v322, v323, v324, v325, v326, v327, v328, v329,&
                v33, v330, v331, v332, v333, v334, v335, v336, v337, v338,&
                v339, v34, v340, v341, v342, v343, v344, v345, v346, v347,&
                v348, v349, v35, v350, v351, v352, v353, v354, v355, v356,&
                v357, v358, v359, v36, v360, v361, v362, v363, v364, v365,&
                v366, v367, v368, v369, v37, v370, v371, v372, v373, v374,&
                v375, v376, v377, v378, v379, v38, v380, v381, v382, v383,&
                v384, v385, v386, v387, v388, v389, v39, v390, v391, v392,&
                v393, v394, v395, v396, v397, v398, v399, v4, v40, v400, v401,&
                v402, v403, v404, v405, v406, v407, v408, v409, v41, v410,&
                v411, v412, v413, v414, v415, v416, v417, v418, v419, v42,&
                v420, v421, v422, v423, v424, v425, v426, v427, v428, v429,&
                v43, v430, v431, v432, v433, v434, v435, v436, v437, v438,&
                v439, v44, v440, v441, v442, v443, v444, v445, v446, v447,&
                v448, v449, v45, v450, v451, v452, v453, v454, v455, v456,&
                v457, v458, v459, v46, v460, v461, v462, v463, v464, v465,&
                v466, v467, v468, v469, v47, v470, v471, v472, v473, v474,&
                v475, v476, v477, v478, v479, v48, v480, v481, v482, v483,&
                v484, v485, v486, v487, v488, v489, v49, v490, v491, v492,&
                v493, v494, v495, v496, v497, v498, v499, v5, v50, v500, v501,&
                v502, v503, v504, v505, v506, v507, v508, v509, v51, v510,&
                v511, v512, v513, v514, v515, v516, v517, v518, v519, v52,&
                v520, v521, v522, v523, v524, v525, v526, v527, v528, v529,&
                v53, v530, v531, v532, v533, v534, v535, v536, v537, v538,&
                v539, v54, v540, v541, v542, v543, v544, v545, v546, v547,&
                v548, v549, v55, v550, v551, v552, v553, v554, v555, v556,&
                v557, v558, v559, v56, v560, v561, v562, v563, v564, v565,&
                v566, v567, v568, v569, v57, v570, v571, v572, v573, v574,&
                v575, v576, v577, v578, v579, v58, v580, v581, v582, v583,&
                v584, v585, v586, v587, v588, v589, v59, v590, v591, v592,&
                v593, v594, v595, v596, v597, v598, v599, v6, v60, v600, v601,&
                v602, v603, v604, v605, v606, v607, v608, v609, v61, v610,&
                v611, v612, v613, v614, v615, v616, v617, v618, v619, v62,&
                v620, v621, v622, v623, v624, v625, v626, v627, v628, v629,&
                v63, v630, v631, v632, v633, v634, v635, v636, v637, v638,&
                v639, v64, v640, v641, v642, v643, v644, v645, v646, v647,&
                v648, v649, v65, v650, v651, v652, v653, v654, v655, v656,&
                v657, v658, v659, v66, v660, v661, v662, v663, v664, v665,&
                v666, v667, v668, v669, v67, v670, v671, v672, v673, v674,&
                v675, v676, v677, v678, v679, v68, v680, v681, v682, v683,&
                v684, v685, v686, v687, v688, v689, v69, v690, v691, v692,&
                v693, v694, v695, v696, v697, v698, v699, v7, v70, v700, v701,&
                v702, v703, v704, v705, v706, v707, v708, v709, v71, v710,&
                v711, v712, v713, v714, v715, v716, v717, v718, v719, v72,&
                v720, v721, v722, v723, v724, v725, v726, v727, v728, v729,&
                v73, v730, v731, v732, v733, v734, v735, v736, v737, v738,&
                v739, v74, v740, v741, v742, v743, v744, v745, v746, v747,&
                v748, v749, v75, v750, v751, v752, v753, v754, v755, v756,&
                v757, v758, v759, v76, v760, v761, v762, v763, v764, v765,&
                v766, v767, v768, v769, v77, v770, v771, v772, v773, v774,&
                v775, v776, v777, v778, v779, v78, v780, v781, v782, v783,&
                v784, v785, v786, v787, v788, v789, v79, v790, v791, v792,&
                v793, v794, v795, v796, v797, v798, v799, v8, v80, v800, v801,&
                v802, v803, v804, v805, v806, v807, v808, v809, v81, v810,&
                v811, v812, v813, v814, v815, v816, v817, v818, v819, v82,&
                v820, v821, v822, v823, v824, v825, v826, v827, v828, v829,&
                v83, v830, v831, v832, v833, v834, v835, v836, v837, v838,&
                v839, v84, v840, v841, v842, v843, v844, v845, v846, v847,&
                v848, v849, v85, v850, v851, v852, v853, v854, v855, v856,&
                v857, v858, v859, v86, v860, v861, v862, v863, v864, v865,&
                v866, v867, v868, v869, v87, v870, v871, v872, v873, v874,&
                v875, v876, v877, v878, v879, v88, v880, v881, v882, v883,&
                v884, v885, v886, v887, v888, v889, v89, v890, v891, v892,&
                v893, v894, v895, v896, v897, v898, v899, v9, v90, v900, v901,&
                v902, v903, v904, v905, v906, v907, v908, v909, v91, v910,&
                v911, v912, v913, v914, v915, v916, v917, v918, v919, v92,&
                v920, v921, v922, v923, v924, v925, v926, v927, v928, v929,&
                v93, v930, v931, v932, v933, v934, v935, v936, v937, v938,&
                v939, v94, v940, v941, v942, v943, v944, v945, v946, v947,&
                v948, v949, v95, v950, v951, v952, v953, v954, v955, v956,&
                v957, v958, v959, v96, v960, v961, v962, v963, v964, v965,&
                v966, v967, v968, v969, v97, v970, v971, v972, v973, v974,&
                v975, v976, v977, v978, v979, v98, v980, v981, v982, v983,&
                v984, v985, v986, v987, v988, v989, v99, v990, v991, v992,&
                v993, v994, v995, v996, v997, v998, v999, h, u
#define y                    r(2)
#define z                    r(3)
#define M_0                  M(0)
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
#define Ms_zz                Ms(9)
#define M_zz                 M(9)
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
#define M_yyy                M(16)
#define Ms_yyy               Ms(16)
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
#define M_xxxz               M(22)
#define Ms_xxxz              Ms(22)
#define M_xxyy               M(23)
#define Ms_xxyy              Ms(23)
#define Ms_xxyz              Ms(24)
#define M_xxyz               M(24)
#define M_xxzz               M(25)
#define Ms_xxzz              Ms(25)
#define Ms_xyyy              Ms(26)
#define M_xyyy               M(26)
#define Ms_xyyz              Ms(27)
#define M_xyyz               M(27)
#define Ms_xyzz              Ms(28)
#define M_xyzz               M(28)
#define Ms_xzzz              Ms(29)
#define M_xzzz               M(29)
#define Ms_yyyy              Ms(30)
#define M_yyyy               M(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define Ms_yyzz              Ms(32)
#define M_yyzz               M(32)
#define Ms_yzzz              Ms(33)
#define M_yzzz               M(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
#define M_xxxxx              M(35)
#define Ms_xxxxx             Ms(35)
#define Ms_xxxxy             Ms(36)
#define M_xxxxy              M(36)
#define M_xxxxz              M(37)
#define Ms_xxxxz             Ms(37)
#define M_xxxyy              M(38)
#define Ms_xxxyy             Ms(38)
#define Ms_xxxyz             Ms(39)
#define M_xxxyz              M(39)
#define Ms_xxxzz             Ms(40)
#define M_xxxzz              M(40)
#define Ms_xxyyy             Ms(41)
#define M_xxyyy              M(41)
#define M_xxyyz              M(42)
#define Ms_xxyyz             Ms(42)
#define Ms_xxyzz             Ms(43)
#define M_xxyzz              M(43)
#define M_xxzzz              M(44)
#define Ms_xxzzz             Ms(44)
#define Ms_xyyyy             Ms(45)
#define M_xyyyy              M(45)
#define M_xyyyz              M(46)
#define Ms_xyyyz             Ms(46)
#define Ms_xyyzz             Ms(47)
#define M_xyyzz              M(47)
#define M_xyzzz              M(48)
#define Ms_xyzzz             Ms(48)
#define M_xzzzz              M(49)
#define Ms_xzzzz             Ms(49)
#define Ms_yyyyy             Ms(50)
#define M_yyyyy              M(50)
#define Ms_yyyyz             Ms(51)
#define M_yyyyz              M(51)
#define M_yyyzz              M(52)
#define Ms_yyyzz             Ms(52)
#define Ms_yyzzz             Ms(53)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define Ms_yzzzz             Ms(54)
#define M_zzzzz              M(55)
#define Ms_zzzzz             Ms(55)
#define M_xxxxxx             M(56)
#define Ms_xxxxxx            Ms(56)
#define Ms_xxxxxy            Ms(57)
#define M_xxxxxy             M(57)
#define Ms_xxxxxz            Ms(58)
#define M_xxxxxz             M(58)
#define Ms_xxxxyy            Ms(59)
#define M_xxxxyy             M(59)
#define M_xxxxyz             M(60)
#define Ms_xxxxyz            Ms(60)
#define Ms_xxxxzz            Ms(61)
#define M_xxxxzz             M(61)
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
#define M_xxyyyz             M(67)
#define Ms_xxyyyz            Ms(67)
#define M_xxyyzz             M(68)
#define Ms_xxyyzz            Ms(68)
#define M_xxyzzz             M(69)
#define Ms_xxyzzz            Ms(69)
#define M_xxzzzz             M(70)
#define Ms_xxzzzz            Ms(70)
#define M_xyyyyy             M(71)
#define Ms_xyyyyy            Ms(71)
#define Ms_xyyyyz            Ms(72)
#define M_xyyyyz             M(72)
#define Ms_xyyyzz            Ms(73)
#define M_xyyyzz             M(73)
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
#define M_yyyyzz             M(79)
#define Ms_yyyyzz            Ms(79)
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
#define M_xxxxxxy            M(85)
#define Ms_xxxxxxy           Ms(85)
#define M_xxxxxxz            M(86)
#define Ms_xxxxxxz           Ms(86)
#define Ms_xxxxxyy           Ms(87)
#define M_xxxxxyy            M(87)
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
#define Ms_xxxxzzz           Ms(93)
#define M_xxxxzzz            M(93)
#define Ms_xxxyyyy           Ms(94)
#define M_xxxyyyy            M(94)
#define Ms_xxxyyyz           Ms(95)
#define M_xxxyyyz            M(95)
#define Ms_xxxyyzz           Ms(96)
#define M_xxxyyzz            M(96)
#define Ms_xxxyzzz           Ms(97)
#define M_xxxyzzz            M(97)
#define Ms_xxxzzzz           Ms(98)
#define M_xxxzzzz            M(98)
#define Ms_xxyyyyy           Ms(99)
#define M_xxyyyyy            M(99)
#define Ms_xxyyyyz           Ms(100)
#define M_xxyyyyz            M(100)
#define M_xxyyyzz            M(101)
#define Ms_xxyyyzz           Ms(101)
#define Ms_xxyyzzz           Ms(102)
#define M_xxyyzzz            M(102)
#define Ms_xxyzzzz           Ms(103)
#define M_xxyzzzz            M(103)
#define M_xxzzzzz            M(104)
#define Ms_xxzzzzz           Ms(104)
#define Ms_xyyyyyy           Ms(105)
#define M_xyyyyyy            M(105)
#define Ms_xyyyyyz           Ms(106)
#define M_xyyyyyz            M(106)
#define Ms_xyyyyzz           Ms(107)
#define M_xyyyyzz            M(107)
#define Ms_xyyyzzz           Ms(108)
#define M_xyyyzzz            M(108)
#define Ms_xyyzzzz           Ms(109)
#define M_xyyzzzz            M(109)
#define Ms_xyzzzzz           Ms(110)
#define M_xyzzzzz            M(110)
#define Ms_xzzzzzz           Ms(111)
#define M_xzzzzzz            M(111)
#define M_yyyyyyy            M(112)
#define Ms_yyyyyyy           Ms(112)
#define M_yyyyyyz            M(113)
#define Ms_yyyyyyz           Ms(113)
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
#define M_zzzzzzz            M(119)
#define Ms_zzzzzzz           Ms(119)
#define M_xxxxxxxx           M(120)
#define Ms_xxxxxxxx          Ms(120)
#define M_xxxxxxxy           M(121)
#define Ms_xxxxxxxy          Ms(121)
#define Ms_xxxxxxxz          Ms(122)
#define M_xxxxxxxz           M(122)
#define Ms_xxxxxxyy          Ms(123)
#define M_xxxxxxyy           M(123)
#define M_xxxxxxyz           M(124)
#define Ms_xxxxxxyz          Ms(124)
#define Ms_xxxxxxzz          Ms(125)
#define M_xxxxxxzz           M(125)
#define M_xxxxxyyy           M(126)
#define Ms_xxxxxyyy          Ms(126)
#define Ms_xxxxxyyz          Ms(127)
#define M_xxxxxyyz           M(127)
#define M_xxxxxyzz           M(128)
#define Ms_xxxxxyzz          Ms(128)
#define Ms_xxxxxzzz          Ms(129)
#define M_xxxxxzzz           M(129)
#define M_xxxxyyyy           M(130)
#define Ms_xxxxyyyy          Ms(130)
#define M_xxxxyyyz           M(131)
#define Ms_xxxxyyyz          Ms(131)
#define M_xxxxyyzz           M(132)
#define Ms_xxxxyyzz          Ms(132)
#define Ms_xxxxyzzz          Ms(133)
#define M_xxxxyzzz           M(133)
#define M_xxxxzzzz           M(134)
#define Ms_xxxxzzzz          Ms(134)
#define M_xxxyyyyy           M(135)
#define Ms_xxxyyyyy          Ms(135)
#define M_xxxyyyyz           M(136)
#define Ms_xxxyyyyz          Ms(136)
#define Ms_xxxyyyzz          Ms(137)
#define M_xxxyyyzz           M(137)
#define M_xxxyyzzz           M(138)
#define Ms_xxxyyzzz          Ms(138)
#define M_xxxyzzzz           M(139)
#define Ms_xxxyzzzz          Ms(139)
#define Ms_xxxzzzzz          Ms(140)
#define M_xxxzzzzz           M(140)
#define M_xxyyyyyy           M(141)
#define Ms_xxyyyyyy          Ms(141)
#define M_xxyyyyyz           M(142)
#define Ms_xxyyyyyz          Ms(142)
#define M_xxyyyyzz           M(143)
#define Ms_xxyyyyzz          Ms(143)
#define Ms_xxyyyzzz          Ms(144)
#define M_xxyyyzzz           M(144)
#define Ms_xxyyzzzz          Ms(145)
#define M_xxyyzzzz           M(145)
#define Ms_xxyzzzzz          Ms(146)
#define M_xxyzzzzz           M(146)
#define M_xxzzzzzz           M(147)
#define Ms_xxzzzzzz          Ms(147)
#define Ms_xyyyyyyy          Ms(148)
#define M_xyyyyyyy           M(148)
#define Ms_xyyyyyyz          Ms(149)
#define M_xyyyyyyz           M(149)
#define M_xyyyyyzz           M(150)
#define Ms_xyyyyyzz          Ms(150)
#define M_xyyyyzzz           M(151)
#define Ms_xyyyyzzz          Ms(151)
#define M_xyyyzzzz           M(152)
#define Ms_xyyyzzzz          Ms(152)
#define M_xyyzzzzz           M(153)
#define Ms_xyyzzzzz          Ms(153)
#define M_xyzzzzzz           M(154)
#define Ms_xyzzzzzz          Ms(154)
#define M_xzzzzzzz           M(155)
#define Ms_xzzzzzzz          Ms(155)
#define Ms_yyyyyyyy          Ms(156)
#define M_yyyyyyyy           M(156)
#define Ms_yyyyyyyz          Ms(157)
#define M_yyyyyyyz           M(157)
#define Ms_yyyyyyzz          Ms(158)
#define M_yyyyyyzz           M(158)
#define Ms_yyyyyzzz          Ms(159)
#define M_yyyyyzzz           M(159)
#define M_yyyyzzzz           M(160)
#define Ms_yyyyzzzz          Ms(160)
#define M_yyyzzzzz           M(161)
#define Ms_yyyzzzzz          Ms(161)
#define Ms_yyzzzzzz          Ms(162)
#define M_yyzzzzzz           M(162)
#define M_yzzzzzzz           M(163)
#define Ms_yzzzzzzz          Ms(163)
#define Ms_zzzzzzzz          Ms(164)
#define M_zzzzzzzz           M(164)
#define Ms_xxxxxxxxx         Ms(165)
#define M_xxxxxxxxx          M(165)
#define M_xxxxxxxxy          M(166)
#define Ms_xxxxxxxxy         Ms(166)
#define Ms_xxxxxxxxz         Ms(167)
#define M_xxxxxxxxz          M(167)
#define Ms_xxxxxxxyy         Ms(168)
#define M_xxxxxxxyy          M(168)
#define M_xxxxxxxyz          M(169)
#define Ms_xxxxxxxyz         Ms(169)
#define Ms_xxxxxxxzz         Ms(170)
#define M_xxxxxxxzz          M(170)
#define M_xxxxxxyyy          M(171)
#define Ms_xxxxxxyyy         Ms(171)
#define Ms_xxxxxxyyz         Ms(172)
#define M_xxxxxxyyz          M(172)
#define Ms_xxxxxxyzz         Ms(173)
#define M_xxxxxxyzz          M(173)
#define Ms_xxxxxxzzz         Ms(174)
#define M_xxxxxxzzz          M(174)
#define M_xxxxxyyyy          M(175)
#define Ms_xxxxxyyyy         Ms(175)
#define M_xxxxxyyyz          M(176)
#define Ms_xxxxxyyyz         Ms(176)
#define M_xxxxxyyzz          M(177)
#define Ms_xxxxxyyzz         Ms(177)
#define M_xxxxxyzzz          M(178)
#define Ms_xxxxxyzzz         Ms(178)
#define M_xxxxxzzzz          M(179)
#define Ms_xxxxxzzzz         Ms(179)
#define M_xxxxyyyyy          M(180)
#define Ms_xxxxyyyyy         Ms(180)
#define Ms_xxxxyyyyz         Ms(181)
#define M_xxxxyyyyz          M(181)
#define Ms_xxxxyyyzz         Ms(182)
#define M_xxxxyyyzz          M(182)
#define M_xxxxyyzzz          M(183)
#define Ms_xxxxyyzzz         Ms(183)
#define M_xxxxyzzzz          M(184)
#define Ms_xxxxyzzzz         Ms(184)
#define Ms_xxxxzzzzz         Ms(185)
#define M_xxxxzzzzz          M(185)
#define M_xxxyyyyyy          M(186)
#define Ms_xxxyyyyyy         Ms(186)
#define M_xxxyyyyyz          M(187)
#define Ms_xxxyyyyyz         Ms(187)
#define M_xxxyyyyzz          M(188)
#define Ms_xxxyyyyzz         Ms(188)
#define M_xxxyyyzzz          M(189)
#define Ms_xxxyyyzzz         Ms(189)
#define Ms_xxxyyzzzz         Ms(190)
#define M_xxxyyzzzz          M(190)
#define Ms_xxxyzzzzz         Ms(191)
#define M_xxxyzzzzz          M(191)
#define Ms_xxxzzzzzz         Ms(192)
#define M_xxxzzzzzz          M(192)
#define M_xxyyyyyyy          M(193)
#define Ms_xxyyyyyyy         Ms(193)
#define Ms_xxyyyyyyz         Ms(194)
#define M_xxyyyyyyz          M(194)
#define Ms_xxyyyyyzz         Ms(195)
#define M_xxyyyyyzz          M(195)
#define M_xxyyyyzzz          M(196)
#define Ms_xxyyyyzzz         Ms(196)
#define M_xxyyyzzzz          M(197)
#define Ms_xxyyyzzzz         Ms(197)
#define M_xxyyzzzzz          M(198)
#define Ms_xxyyzzzzz         Ms(198)
#define Ms_xxyzzzzzz         Ms(199)
#define M_xxyzzzzzz          M(199)
#define Ms_xxzzzzzzz         Ms(200)
#define M_xxzzzzzzz          M(200)
#define M_xyyyyyyyy          M(201)
#define Ms_xyyyyyyyy         Ms(201)
#define Ms_xyyyyyyyz         Ms(202)
#define M_xyyyyyyyz          M(202)
#define Ms_xyyyyyyzz         Ms(203)
#define M_xyyyyyyzz          M(203)
#define Ms_xyyyyyzzz         Ms(204)
#define M_xyyyyyzzz          M(204)
#define Ms_xyyyyzzzz         Ms(205)
#define M_xyyyyzzzz          M(205)
#define M_xyyyzzzzz          M(206)
#define Ms_xyyyzzzzz         Ms(206)
#define M_xyyzzzzzz          M(207)
#define Ms_xyyzzzzzz         Ms(207)
#define Ms_xyzzzzzzz         Ms(208)
#define M_xyzzzzzzz          M(208)
#define M_xzzzzzzzz          M(209)
#define Ms_xzzzzzzzz         Ms(209)
#define Ms_yyyyyyyyy         Ms(210)
#define M_yyyyyyyyy          M(210)
#define M_yyyyyyyyz          M(211)
#define Ms_yyyyyyyyz         Ms(211)
#define M_yyyyyyyzz          M(212)
#define Ms_yyyyyyyzz         Ms(212)
#define Ms_yyyyyyzzz         Ms(213)
#define M_yyyyyyzzz          M(213)
#define M_yyyyyzzzz          M(214)
#define Ms_yyyyyzzzz         Ms(214)
#define M_yyyyzzzzz          M(215)
#define Ms_yyyyzzzzz         Ms(215)
#define M_yyyzzzzzz          M(216)
#define Ms_yyyzzzzzz         Ms(216)
#define M_yyzzzzzzz          M(217)
#define Ms_yyzzzzzzz         Ms(217)
#define Ms_yzzzzzzzz         Ms(218)
#define M_yzzzzzzzz          M(218)
#define Ms_zzzzzzzzz         Ms(219)
#define M_zzzzzzzzz          M(219)
    v1067        = M_0*x
    v1068        = M_0*y
    v1069        = M_0*z
    v1070        = 0.0416666666666667d0*M_0
    v1084        = 0.00138888888888889d0*M_0
    v1124        = 9.92063492063492d-5*M_0
    v1126        = 0.000347222222222222d0*M_0
    v0           = v1067
    v1           = M_x + v0
    v2           = v1068
    v3           = M_y + v2
    v4           = M_z + v1069
    v5           = M_x*x
    v6           = M_xx + v5
    v7           = 0.5d0*M_0
    v9           = M_y*x
    v10          = M_xy + v9
    v11          = M_x*y
    v12          = v0*y
    v13          = v10 + v11 + v12
    v14          = M_z*x
    v15          = M_xz + v14
    v16          = M_x*z
    v17          = v0*z + v15 + v16
    v18          = M_y*y
    v19          = M_yy + v18
    v21          = M_z*y
    v22          = M_yz + v21
    v23          = M_y*z
    v24          = v2*z + v22 + v23
    v25          = M_z*z
    v26          = M_zz + v25
    v28          = M_xx*x
    v29          = M_xxx + v28
    v30          = 0.166666666666667d0*M_0
    v33          = M_xy*x
    v34          = M_xxy + v33
    v35          = M_xx*y
    v36          = v5*y
    v37          = v34 + v35 + v36
    v38          = M_xz*x
    v39          = M_xxz + v38
    v40          = M_xx*z
    v41          = v5*z
    v42          = v39 + v40 + v41
    v44          = M_yy*x
    v45          = M_xyy + v44
    v46          = M_xy*y
    v47          = v9*y
    v48          = v45 + v46 + v47
    v49          = M_xy*z
    v50          = v9*z
    v51          = v49 + v50
    v52          = M_xz*y
    v1135        = M_xyz + v52
    v53          = M_yz*x
    v54          = v11*z
    v55          = v14*y
    v1079        = v53 + v55
    v57          = M_zz*x
    v58          = M_xzz + v57
    v59          = M_xz*z
    v60          = v14*z
    v61          = v58 + v59 + v60
    v62          = M_yy*y
    v63          = M_yyy + v62
    v65          = M_yz*y
    v66          = M_yyz + v65
    v67          = M_yy*z
    v68          = v18*z
    v69          = v66 + v67 + v68
    v70          = M_zz*y
    v71          = M_yzz + v70
    v72          = M_yz*z
    v73          = v21*z
    v74          = v71 + v72 + v73
    v75          = M_zz*z
    v76          = M_zzz + v75
    v78          = M_xxx*x
    v79          = M_xxxx + v78
    v80          = v1070
    v83          = M_xxy*x
    v84          = M_xxxy + v83
    v85          = M_xxx*y
    v86          = v28*y
    v87          = v85 + v86
    v88          = v84 + v87
    v89          = M_xy + v11
    v90          = M_xxz*x
    v91          = M_xxxz + v90
    v92          = M_xxx*z
    v93          = v28*z
    v94          = v92 + v93
    v95          = v91 + v94
    v96          = M_xz + v16
    v97          = M_xyy*x
    v98          = M_xxyy + v97
    v99          = M_xxy*y
    v100         = v33*y
    v101         = v100 + v98 + v99
    v104         = 0.25d0*M_0
    v106         = M_xxy*z
    v107         = v35*z
    v108         = v106 + v107
    v109         = M_xxz*y
    v1136        = M_xxyz + v109
    v110         = M_xyz*x
    v111         = v33*z
    v1104        = v110 + v111
    v112         = v38*y
    v113         = M_xzz*x
    v114         = M_xxzz + v113
    v115         = M_xxz*z
    v116         = v38*z
    v117         = v114 + v115 + v116
    v121         = M_yyy*x
    v122         = M_xyyy + v121
    v123         = M_xyy*y
    v124         = v44*y
    v125         = v122 + v123 + v124
    v127         = M_xyy*z
    v128         = v44*z
    v129         = v127 + v128
    v130         = M_xyz*y
    v131         = M_yyz*x
    v1138        = M_xyyz + v131
    v132         = v46*z
    v1097        = v130 + v132
    v133         = v53*y
    v134         = M_xyz*z
    v135         = v52*z
    v136         = v134 + v135
    v137         = M_xzz*y
    v1139        = M_xyzz + v137
    v138         = M_yzz*x
    v139         = v53*z
    v140         = v57*y
    v1092        = v138 + v140
    v141         = M_zzz*x
    v142         = M_xzzz + v141
    v143         = M_xzz*z
    v144         = v57*z
    v145         = v142 + v143 + v144
    v147         = M_yyy*y
    v148         = M_yyyy + v147
    v150         = M_yyz*y
    v151         = M_yyyz + v150
    v152         = M_yyy*z
    v153         = v62*z
    v154         = v152 + v153
    v155         = v151 + v154
    v156         = M_yz + v23
    v157         = M_yzz*y
    v158         = M_yyzz + v157
    v159         = M_yyz*z
    v160         = v65*z
    v161         = v158 + v159 + v160
    v165         = M_zzz*y
    v166         = M_yzzz + v165
    v167         = M_yzz*z
    v168         = v70*z
    v169         = v166 + v167 + v168
    v170         = M_zzz*z
    v171         = M_zzzz + v170
    v173         = M_xxxx*x
    v174         = 0.00833333333333333d0*M_0
    v177         = M_xxxx*y
    v178         = M_xxxxy + v177
    v179         = M_xxxy*x
    v180         = v78*y
    v181         = M_xxy + v35
    v182         = M_xxxx*z
    v183         = M_xxxxz + v182
    v184         = M_xxxz*x
    v185         = v78*z
    v186         = M_xxz + v40
    v187         = M_xxyy*x
    v188         = M_xxxyy + v187
    v189         = M_xxxy*y
    v190         = v83*y
    v194         = 0.25d0*M_x
    v195         = M_xxxy*z
    v196         = v85*z
    v197         = v195 + v196
    v198         = M_xxxz*y
    v1140        = M_xxxyz + v198
    v199         = M_xxyz*x
    v200         = v83*z
    v1128        = v199 + v200
    v201         = v90*y
    v202         = v1135
    v203         = v49 + v54
    v204         = v202 + v203
    v205         = M_xxzz*x
    v206         = M_xxxzz + v205
    v207         = M_xxxz*z
    v208         = v90*z
    v211         = M_xyyy*x
    v212         = M_xxyyy + v211
    v213         = M_xxyy*y
    v214         = v97*y
    v219         = M_xxyy*z
    v1077        = M_xxyyz + v219
    v220         = v97*z
    v221         = v1077 + v220
    v222         = M_xxyz*y
    v223         = M_xyyz*x
    v1144        = v221 + v223
    v1133        = v222 + v223
    v224         = v99*z
    v1112        = v222 + v224
    v225         = v110*y
    v226         = v100*z
    v229         = M_xxyz*z
    v230         = v109*z
    v231         = v229 + v230
    v232         = M_xxzz*y
    v1143        = M_xxyzz + v232
    v233         = M_xyzz*x
    v234         = v110*z
    v235         = v113*y
    v1119        = v233 + v235
    v236         = v112*z
    v240         = M_xzzz*x
    v241         = M_xxzzz + v240
    v242         = M_xxzz*z
    v243         = v113*z
    v246         = M_yyyy*x
    v247         = M_xyyyy + v246
    v248         = M_xyyy*y
    v249         = v121*y
    v251         = M_xyyy*z
    v252         = v121*z
    v253         = v251 + v252
    v254         = M_xyyz*y
    v255         = M_yyyz*x
    v1141        = M_xyyyz + v255
    v256         = v123*z
    v1127        = v254 + v256
    v257         = v131*y
    v258         = M_xyz + v53
    v259         = v258 + v51
    v260         = v131*z
    v261         = v133*z + v260
    v262         = M_xyyz*z
    v263         = M_xyzz*y
    v264         = M_yyzz*x
    v265         = v130*z
    v1131        = v262 + v265
    v266         = v138*y
    v1145        = v263 + v266
    v270         = M_xyzz*z
    v271         = v137*z
    v272         = v270 + v271
    v273         = M_xzzz*y
    v1142        = M_xyzzz + v273
    v274         = M_yzzz*x
    v275         = v138*z
    v276         = v141*y
    v1105        = v274 + v276
    v277         = v1079
    v278         = v202 + v277
    v279         = M_zzzz*x
    v280         = M_xzzzz + v279
    v281         = M_xzzz*z
    v282         = v141*z
    v284         = M_yyyy*y
    v286         = M_yyyy*z
    v287         = M_yyyyz + v286
    v288         = M_yyyz*y
    v289         = v147*z
    v290         = M_yyz + v67
    v291         = M_yyzz*y
    v292         = M_yyyzz + v291
    v293         = M_yyyz*z
    v294         = v150*z
    v299         = M_yzzz*y
    v300         = M_yyzzz + v299
    v301         = M_yyzz*z
    v302         = v157*z
    v307         = M_zzzz*y
    v308         = M_yzzzz + v307
    v309         = M_yzzz*z
    v310         = v165*z
    v311         = M_zzzz*z
    v313         = M_xxxxx*x
    v314         = v1084
    v317         = M_xxxxx*y
    v318         = M_xxxxxy + v317
    v319         = M_xxxxy*x
    v320         = v173*y
    v321         = M_xxxy + v85
    v322         = M_xxxxx*z
    v323         = M_xxxxxz + v322
    v324         = M_xxxxz*x
    v325         = v173*z
    v326         = M_xxxz + v92
    v327         = M_xxxxy*y
    v328         = M_xxxxyy + v327
    v329         = M_xxxyy*x
    v330         = v179*y
    v331         = 0.5d0*M_xxxx
    v336         = M_xyy + v46
    v337         = M_xxxxy*z
    v338         = M_xxxxz*y
    v339         = v177*z + M_xxxxyz + v337 + v338
    v340         = M_xxxyz*x
    v341         = v179*z
    v342         = v184*y
    v343         = v1136
    v344         = v108 + v343
    v345         = M_xxxxz*z
    v346         = M_xxxxzz + v345
    v347         = M_xxxzz*x
    v348         = v184*z
    v349         = M_xzz + v59
    v350         = M_xxxyy*y
    v351         = M_xxyyy*x
    v352         = v187*y
    v353         = 0.166666666666667d0*M_xxx
    v354         = 0.5d0*M_xxxy
    v356         = v11 + v9
    v358         = M_xxxyy*z
    v359         = M_xxxyz*y
    v360         = v189*z
    v361         = M_xxxyyz + v358 + v359 + v360
    v362         = M_xxyyz*x
    v363         = v187*z
    v364         = v199*y
    v366         = M_xxxyz*z
    v367         = M_xxxzz*y
    v368         = v198*z
    v369         = M_xxxyzz + v366 + v367 + v368
    v370         = M_xxyzz*x
    v371         = v199*z
    v372         = v205*y
    v374         = M_xxxzz*z
    v375         = M_xxzzz*x
    v376         = v205*z
    v377         = v14 + v16
    v379         = M_xyyyy*x
    v380         = M_xxyyyy + v379
    v381         = M_xxyyy*y
    v382         = v211*y
    v386         = M_xxyyy*z
    v387         = M_xyyyz*x
    v388         = v211*z
    v389         = M_xxyyyz + v386 + v387 + v388
    v390         = M_xxyyz*y
    v391         = v213*z
    v392         = v223*y
    v393         = M_xxyyz*z
    v394         = v222*z
    v1090        = v393 + v394
    v395         = v223*z
    v396         = v225*z
    v1091        = v395 + v396
    v397         = v1090 + v1091
    v398         = M_xxyzz*y
    v1146        = M_xxyyzz + v398
    v399         = M_xyyzz*x
    v400         = v233*y
    v1137        = v399 + v400
    v1132        = v1137
    v412         = M_xxzzz*y
    v413         = M_xyzzz*x
    v414         = v240*y
    v415         = M_xxyzzz + v412 + v413 + v414
    v416         = M_xxyzz*z
    v417         = v232*z
    v418         = v233*z
    v420         = M_xzzzz*x
    v421         = M_xxzzzz + v420
    v422         = M_xxzzz*z
    v423         = v240*z
    v424         = M_yyyyy*x
    v425         = M_xyyyyy + v424
    v426         = M_xyyyy*y
    v427         = v246*y
    v429         = M_xyyyy*z
    v430         = M_yyyyz*x
    v431         = v246*z + M_xyyyyz + v429 + v430
    v432         = M_xyyyz*y
    v433         = v248*z
    v434         = v255*y
    v435         = v1138
    v436         = v129 + v435
    v437         = M_xyyyz*z
    v438         = M_yyyzz*x
    v439         = v255*z
    v440         = M_xyyyzz + v437 + v438 + v439
    v441         = M_xyyzz*y
    v442         = v254*z
    v443         = v264*y
    v445         = M_xyzzz*y
    v446         = M_yyzzz*x
    v447         = v274*y
    v448         = M_xyyzzz + v445 + v446 + v447
    v449         = M_xyyzz*z
    v450         = v263*z
    v451         = v264*z
    v453         = M_xzzzz*y
    v454         = M_yzzzz*x
    v455         = v279*y
    v456         = M_xyzzzz + v453 + v454 + v455
    v457         = M_xyzzz*z
    v458         = v273*z
    v459         = v274*z
    v460         = v1139
    v461         = v1092
    v462         = v460 + v461
    v463         = M_zzzzz*x
    v464         = M_xzzzzz + v463
    v465         = M_xzzzz*z
    v466         = v279*z
    v468         = M_yyyyy*y
    v470         = M_yyyyy*z
    v471         = M_yyyyyz + v470
    v472         = M_yyyyz*y
    v473         = v284*z
    v474         = M_yyyz + v152
    v475         = M_yyyyz*z
    v476         = M_yyyyzz + v475
    v477         = M_yyyzz*y
    v478         = v288*z
    v481         = M_yzz + v72
    v482         = M_yyyzz*z
    v483         = M_yyzzz*y
    v484         = v291*z
    v486         = v21 + v23
    v488         = M_yzzzz*y
    v489         = M_yyzzzz + v488
    v490         = M_yyzzz*z
    v491         = v299*z
    v493         = M_zzzzz*y
    v494         = M_yzzzzz + v493
    v495         = M_yzzzz*z
    v496         = v307*z
    v497         = M_zzzzz*z
    v499         = M_xxxxxx*x
    v500         = 0.000198412698412698d0*M_0
    v503         = M_xxxxxx*y
    v504         = M_xxxxxxy + v503
    v505         = M_xxxxxy*x
    v506         = v313*y
    v507         = M_xxxxxx*z
    v508         = M_xxxxxxz + v507
    v509         = M_xxxxxz*x
    v510         = v313*z
    v511         = M_xxxxxy*y
    v512         = M_xxxxyy*x
    v513         = v319*y
    v514         = 0.5d0*M_xxxxx
    v518         = M_xxyy + v99
    v519         = M_xxxxxy*z
    v520         = M_xxxxxz*y
    v521         = v317*z + M_xxxxxyz + v519 + v520
    v522         = M_xxxxyz*x
    v523         = v319*z
    v524         = v324*y
    v525         = v1140
    v526         = v197 + v525
    v527         = M_xxxxxz*z
    v528         = M_xxxxzz*x
    v529         = v324*z
    v530         = M_xxzz + v115
    v531         = M_xxxxyy*y
    v532         = M_xxxyyy*x
    v533         = v329*y
    v534         = 0.166666666666667d0*M_xxxx
    v535         = 0.5d0*M_xxxxy
    v540         = v33 + v35
    v541         = M_xxxxyy*z
    v542         = M_xxxxyz*y
    v543         = M_xxxyyz*x
    v544         = v327*z
    v545         = v329*z
    v546         = v340*y
    v547         = 0.5d0*M_xxxxz
    v548         = M_xyyz + v127
    v549         = v1097
    v550         = v548 + v549
    v551         = M_xxxxyz*z
    v552         = M_xxxxzz*y
    v553         = M_xxxyzz*x
    v554         = v338*z
    v555         = v340*z
    v556         = v347*y
    v558         = v136 + v460
    v559         = M_xxxxzz*z
    v560         = M_xxxzzz*x
    v561         = v347*z
    v563         = v38 + v40
    v564         = M_xxxyyy*y
    v565         = M_xxyyyy*x
    v566         = v351*y
    v567         = 0.166666666666667d0*M_xxxy
    v573         = v44 + v46
    v574         = M_xxxyyy*z
    v575         = M_xxxyyz*y
    v576         = M_xxyyyz*x
    v577         = v350*z
    v578         = v351*z
    v579         = v362*y
    v580         = 0.166666666666667d0*M_xxxz
    v581         = M_xyz + v49
    v583         = v50 + v52 + v53 + v54
    v584         = M_xxxyyz*z
    v585         = M_xxxyzz*y
    v586         = M_xxyyzz*x
    v587         = v359*z
    v588         = v362*z
    v589         = v370*y
    v599         = M_xxxyzz*z
    v600         = M_xxxzzz*y
    v601         = M_xxyzzz*x
    v602         = v367*z
    v603         = v370*z
    v604         = v375*y
    v606         = v203 + v277
    v607         = M_xxxzzz*z
    v608         = M_xxzzzz*x
    v609         = v375*z
    v611         = v57 + v59
    v612         = M_xxyyyy*y
    v613         = M_xyyyyy*x
    v614         = v379*y
    v618         = M_xxyyyy*z
    v619         = M_xxyyyz*y
    v620         = M_xyyyyz*x
    v621         = v381*z
    v622         = v379*z
    v623         = v387*y
    v625         = M_xxyz + v106
    v626         = v1104
    v627         = v625 + v626
    v628         = M_xxyyyz*z
    v629         = M_xxyyzz*y
    v630         = M_xyyyzz*x
    v631         = v390*z
    v632         = v387*z
    v633         = v399*y
    v641         = M_xxyyzz*z
    v642         = M_xxyzzz*y
    v643         = M_xyyzzz*x
    v644         = v398*z
    v645         = v399*z
    v646         = v413*y
    v655         = M_xxyzzz*z
    v656         = M_xxzzzz*y
    v657         = M_xyzzzz*x
    v658         = v412*z
    v659         = v413*z
    v660         = v420*y
    v662         = v110 + v112
    v663         = v343 + v662
    v664         = M_xxzzzz*z
    v665         = M_xzzzzz*x
    v666         = v420*z
    v667         = M_yyyyyy*x
    v668         = M_xyyyyyy + v667
    v669         = M_xyyyyy*y
    v670         = v424*y
    v672         = M_xyyyyy*z
    v673         = M_yyyyyz*x
    v674         = v424*z + M_xyyyyyz + v672 + v673
    v675         = M_xyyyyz*y
    v676         = v426*z
    v677         = v430*y
    v678         = v1141
    v679         = v253 + v678
    v680         = M_xyyyyz*z
    v681         = M_xyyyzz*y
    v682         = M_yyyyzz*x
    v683         = v432*z
    v684         = v430*z
    v685         = v438*y
    v687         = M_xyzz + v138
    v688         = v134 + v139
    v689         = v687 + v688
    v690         = M_xyyyzz*z
    v691         = M_xyyzzz*y
    v692         = M_yyyzzz*x
    v693         = v441*z
    v694         = v438*z
    v695         = v446*y
    v697         = v49 + v52
    v698         = v50 + v55
    v699         = v697 + v698
    v700         = M_xyyzzz*z
    v701         = M_xyzzzz*y
    v702         = M_yyzzzz*x
    v703         = v445*z
    v704         = v446*z
    v705         = v454*y
    v707         = v130 + v133
    v708         = v435 + v707
    v709         = M_xzzzzz*y
    v710         = M_yzzzzz*x
    v711         = v463*y
    v712         = M_xyzzzzz + v709 + v710 + v711
    v713         = M_xyzzzz*z
    v714         = v453*z
    v715         = v454*z
    v716         = v1142
    v717         = v1105
    v718         = v716 + v717
    v719         = M_zzzzzz*x
    v720         = M_xzzzzzz + v719
    v721         = M_xzzzzz*z
    v722         = v463*z
    v724         = M_yyyyyy*y
    v726         = M_yyyyyy*z
    v727         = M_yyyyyyz + v726
    v728         = M_yyyyyz*y
    v729         = v468*z
    v730         = M_yyyyyz*z
    v731         = M_yyyyzz*y
    v732         = v472*z
    v736         = M_yyzz + v159
    v737         = M_yyyyzz*z
    v738         = M_yyyzzz*y
    v739         = v477*z
    v741         = v65 + v67
    v742         = M_yyyzzz*z
    v743         = M_yyzzzz*y
    v744         = v483*z
    v748         = v70 + v72
    v749         = M_yyzzzz*z
    v750         = M_yzzzzz*y
    v751         = v488*z
    v753         = M_zzzzzz*y
    v754         = M_yzzzzzz + v753
    v755         = M_yzzzzz*z
    v756         = v493*z
    v757         = M_zzzzzz*z
    v759         = M_xxxxxxx*x
    v760         = 2.48015873015873d-5*M_0
    v763         = M_xxxxxxx*y
    v764         = M_xxxxxxy*x
    v765         = v499*y
    v766         = M_xxxxxxz*x
    v767         = M_xxxxxxy*y
    v768         = M_xxxxxyy*x
    v769         = v505*y
    v770         = 0.5d0*M_xxxxxx
    v774         = 0.25d0*M_xxxx
    v775         = M_xxxyy + v189
    v776         = M_xxxxxxz*y
    v777         = M_xxxxxyz*x
    v778         = v509*y
    v779         = M_xxxxxzz*x
    v780         = M_xxxzz + v207
    v781         = M_xxxxxyy*y
    v782         = M_xxxxyyy*x
    v783         = v512*y
    v784         = 0.166666666666667d0*M_xxxxx
    v785         = 0.5d0*M_xxxxxy
    v789         = 0.25d0*M_xxxy
    v791         = M_xyyy + v123
    v792         = M_xxxxxyz*y
    v793         = M_xxxxyyz*x
    v794         = v522*y
    v795         = 0.5d0*M_xxxxxz
    v796         = v1077
    v797         = v1112 + v796
    v798         = M_xxxxxzz*y
    v799         = M_xxxxyzz*x
    v800         = v528*y
    v802         = v1143
    v803         = v231 + v802
    v804         = M_xxxxzzz*x
    v805         = M_xzzz + v143
    v806         = M_xxxxyyy*y
    v807         = M_xxxyyyy*x
    v808         = v532*y
    v809         = 0.0416666666666667d0*M_xxxx
    v810         = 0.166666666666667d0*M_xxxxy
    v811         = 0.5d0*M_xxxxyy
    v815         = M_xxxxyyz*y
    v816         = M_xxxyyyz*x
    v817         = v543*y
    v818         = 0.5d0*M_xxxxyz
    v819         = 0.166666666666667d0*M_xxxxz
    v821         = M_xxxxyzz*y
    v822         = M_xxxyyzz*x
    v823         = v553*y
    v824         = 0.5d0*M_xxxxzz
    v831         = M_xxxxzzz*y
    v832         = M_xxxyzzz*x
    v833         = v560*y
    v835         = M_xxxzzzz*x
    v838         = M_xxxyyyy*y
    v839         = M_xxyyyyy*x
    v840         = v565*y
    v841         = 0.166666666666667d0*M_xxxyy
    v846         = M_xxxyyyz*y
    v847         = M_xxyyyyz*x
    v848         = v576*y
    v849         = 0.166666666666667d0*M_xxxyz
    v851         = M_xxxyyzz*y
    v852         = M_xxyyyzz*x
    v853         = v586*y
    v854         = 0.166666666666667d0*M_xxxzz
    v861         = M_xxxyzzz*y
    v862         = M_xxyyzzz*x
    v863         = v601*y
    v869         = M_xxxzzzz*y
    v870         = M_xxyzzzz*x
    v871         = v608*y
    v873         = M_xxzzzzz*x
    v874         = M_xxyyyyy*y
    v875         = M_xyyyyyy*x
    v876         = v613*y
    v878         = M_xxyyyyz*y
    v879         = M_xyyyyyz*x
    v880         = v620*y
    v882         = v1144
    v883         = M_xxyyyzz*y
    v884         = M_xyyyyzz*x
    v885         = v630*y
    v892         = M_xxyyzzz*y
    v893         = M_xyyyzzz*x
    v894         = v643*y
    v898         = M_xxyzzzz*y
    v899         = M_xyyzzzz*x
    v900         = v657*y
    v908         = v220 + v224
    v910         = M_xxzzzzz*y
    v911         = M_xyzzzzz*x
    v912         = v665*y
    v914         = v1119
    v915         = v802 + v914
    v916         = M_xzzzzzz*x
    v917         = M_xyyyyyy*y
    v918         = M_yyyyyyy*x
    v919         = v667*y
    v921         = M_xyyyyyz*y
    v922         = M_yyyyyyz*x
    v923         = v673*y
    v924         = M_xyyyyzz*y
    v925         = M_yyyyyzz*x
    v926         = v682*y
    v928         = M_xyyzz + v264
    v929         = v260 + v262
    v930         = v928 + v929
    v931         = M_xyyyzzz*y
    v932         = M_yyyyzzz*x
    v933         = v692*y
    v935         = M_xyyzzzz*y
    v936         = M_yyyzzzz*x
    v937         = v702*y
    v939         = M_xyzzzzz*y
    v940         = M_yyzzzzz*x
    v941         = v710*y
    v943         = v1145
    v944         = v928 + v943
    v945         = M_xzzzzzz*y
    v946         = M_yzzzzzz*x
    v947         = v719*y
    v948         = M_zzzzzzz*x
    v950         = M_yyyyyyy*y
    v952         = M_yyyyyyz*y
    v953         = M_yyyyyzz*y
    v956         = M_yyyzz + v293
    v957         = M_yyyyzzz*y
    v959         = M_yzzz + v167
    v960         = M_yyyzzzz*y
    v964         = M_yyzzzzz*y
    v966         = M_yzzzzzz*y
    v968         = M_zzzzzzz*y
    v970         = 2.75573192239859d-6*M_0
    v972         = 0.5d0*M_xxxxxxx
    v977         = 0.25d0*M_xxxxx
    v978         = 0.166666666666667d0*M_xxxxxx
    v979         = 0.5d0*M_xxxxxxy
    v982         = 0.25d0*M_xxxxy
    v985         = 0.5d0*M_xxxxxxz
    v987         = 0.25d0*M_xxxxz
    v988         = 0.0416666666666667d0*M_xxxxx
    v989         = 0.166666666666667d0*M_xxxxxy
    v990         = 0.5d0*M_xxxxxyy
    v993         = 0.00138888888888889d0*M_y
    v996         = 0.5d0*M_xxxxxyz
    v997         = 0.166666666666667d0*M_xxxxxz
    v998         = M_xxxyz + v195
    v999         = 0.00138888888888889d0*M_z
    v1000        = M_xyyyz + v251
    v1001        = v1127
    v1002        = v1128
    v1003        = 0.5d0*M_xxxxxzz
    v1007        = v1146
    v1009        = v199 + v201
    v1011        = 0.0416666666666667d0*M_xxxxy
    v1012        = 0.166666666666667d0*M_xxxxyy
    v1013        = 0.5d0*M_xxxxyyy
    v1019        = 0.5d0*M_xxxxyyz
    v1020        = 0.166666666666667d0*M_xxxxyz
    v1021        = 0.0416666666666667d0*M_xxxxz
    v1022        = 0.5d0*M_xxxxyzz
    v1023        = 0.166666666666667d0*M_xxxxzz
    v1030        = 0.5d0*M_xxxxzzz
    v1037        = 0.166666666666667d0*M_xxxyyy
    v1041        = 0.166666666666667d0*M_xxxyyz
    v1043        = 0.166666666666667d0*M_xxxyzz
    v1049        = 0.166666666666667d0*M_xxxzzz
    v1061        = 0.00138888888888889d0*(M_x + v1067)
    v1062        = M_xyzzz + v274
    v1063        = v270 + v275
    v1064        = v254 + v257
    Ms_0         = M_0
    Ms_x         = v1
    Ms_y         = v3
    Ms_z         = v4
    Ms_xy        = v13
    Ms_xz        = v17
    Ms_yz        = v24
    Ms_xyz       = v12*z + v1079 + v1135 + v51 + v54
    c1           = z
    b1           = y
    a1           = x
    a2           = a1*a1
    v8           = a2
    v1075        = M_0*v8
    v1102        = 0.125d0*v8
    v32          = 0.5d0*v8
    v103         = M_yy*v8
    v119         = M_zz*v8
    v192         = M_xyy*v8
    v210         = M_xzz*v8
    v216         = M_yyy*v8
    v217         = 0.0833333333333333d0*v1075
    v228         = M_yyz*v8
    v238         = M_yzz*v8
    v245         = M_zzz*v8
    v335         = 0.25d0*v8
    v383         = 0.0208333333333333d0*v1075
    v403         = M_yyzz*v8
    v409         = v18*v8
    v410         = v25*v8
    v570         = M_x*v8
    v593         = v46*v8
    v594         = v59*v8
    v595         = v1102
    v615         = 0.00416666666666667d0*v1075
    v616         = M_y*v8
    v635         = M_yyyzz*v8
    v637         = v62*v8
    v638         = v72*v8
    v648         = M_yyzzz*v8
    v650         = v65*v8
    v651         = v75*v8
    v652         = M_z*v8
    v844         = M_xy*v8
    v868         = M_xz*v8
    v877         = 0.000694444444444444d0*v1075
    v887         = v159*v8
    v902         = v157*v8
    v1016        = M_xx*v8
    v1027        = 0.0416666666666667d0*v8
    v1028        = v293*v8
    v1029        = v291*v8
    v1033        = v301*v8
    v1034        = v299*v8
    v1050        = 0.0138888888888889d0*v8
    v1056        = v1124*v8
    Ms_xx        = v6 + v7*v8
    Ms_xxy       = v3*v32 + v37
    Ms_xxz       = v32*v4 + v42
    Ms_xxyz      = v24*v32 + v36*z + v108 + v1104 + v112 + v1136
    a3           = a1*a2
    v31          = a3
    v1074        = 0.0833333333333333d0*v31
    v1087        = M_x*v31
    v1088        = 0.0277777777777778d0*v31
    v1098        = M_0*v31
    v1101        = M_y*v31
    v1103        = M_z*v31
    v1114        = 0.00694444444444444d0*v31
    v1129        = 0.00138888888888889d0*v31
    v82          = 0.166666666666667d0*v31
    v193         = M_0*v1074
    v334         = v1087
    v355         = M_0*v1088
    v517         = v1074
    v537         = v1088
    v568         = 0.00694444444444444d0*v1098
    v572         = v1101
    v610         = v1103
    v830         = 0.0416666666666667d0*v31
    v842         = v1084*v31
    v976         = M_xxxx*v31
    v1015        = M_x*v1129
    v1038        = 0.000231481481481481d0*v1098
    v1042        = v1129
    Ms_xxx       = v29 + M_x*v32 + v30*v31
    Ms_xxxy      = v88 + v3*v82 + v32*v89
    Ms_xxxz      = v95 + v32*v96 + v4*v82
    Ms_xxxyz     = v204*v32 + v24*v82 + v86*z + v1128 + v1140 + v197 + v201
    a4           = a2*a2
    v81          = a4
    v1085        = 0.0208333333333333d0*v81
    v1096        = 0.00694444444444444d0*v81
    v1113        = M_0*v81
    v176         = 0.0416666666666667d0*v81
    v332         = M_0*v1085
    v516         = M_x*v81
    v536         = M_0*v1096
    v773         = v1085
    v787         = v1096
    v812         = 0.00173611111111111d0*v1113
    v1014        = v1126*v81
    v1017        = M_y*v81
    v1025        = 0.00347222222222222d0*v1113
    Ms_xxxx      = v79 + M_x*v82 + M_xx*v32 + v80*v81
    Ms_xxxxy     = v178 + v179 + v180 + v176*v3 + v181*v32 + v82*v89
    Ms_xxxxz     = v183 + v184 + v185 + v176*v4 + v186*v32 + v82*v96
    Ms_xxxxyz    = v339 + v340 + v341 + v342 + v176*v24 + v180*z + v204*v82 + v32*v344
    a5           = a2*a3
    v175         = a5
    v1095        = 0.00416666666666667d0*v175
    v316         = 0.00833333333333333d0*v175
    v515         = M_0*v1095
    v772         = M_x*v175
    v786         = v1084*v175
    v975         = v1095
    v984         = 0.00138888888888889d0*v175
    v991         = v1126*v175
    Ms_xxxxx     = M_xxxxx + v173 + M_x*v176 + M_xx*v82 + M_xxx*v32 + v174*v175
    Ms_xxxxxy    = v318 + v319 + v320 + v176*v89 + v181*v82 + v3*v316 + v32*v321
    Ms_xxxxxz    = v323 + v324 + v325 + v176*v96 + v186*v82 + v316*v4 + v32*v326
    Ms_xxxxxyz   = v521 + v522 + v523 + v524 + v176*v204 + v24*v316 + v32*v526 + v320*z + &
      v344*v82
    a6           = a3*a3
    v315         = a6
    v1111        = M_0*v315
    v502         = 0.00138888888888889d0*v315
    v771         = 0.000694444444444444d0*v1111
    v974         = M_x*v315
    v980         = 0.000231481481481481d0*v1111
    Ms_xxxxxx    = M_xxxxxx + v313 + M_x*v316 + M_xx*v176 + M_xxx*v82 + M_xxxx*v32 + v314* &
      v315
    Ms_xxxxxxy   = v504 + v505 + v506 + v176*v181 + v178*v32 + v3*v502 + v316*v89 + v321* &
      v82
    Ms_xxxxxxz   = v508 + v509 + v510 + v176*v186 + v183*v32 + v316*v96 + v326*v82 + v4* &
      v502
    Ms_xxxxxxyz  = M_xxxxxxyz + v776 + v777 + v778 + M_xxxxxxy*z + v176*v344 + v204*v316 + &
      v24*v502 + v32*v339 + v503*z + v505*z + v506*z + v526*v82
    a7           = a3*a4
    v501         = a7
    v762         = 0.000198412698412698d0*v501
    v973         = v1124*v501
    Ms_xxxxxxx   = M_xxxxxxx + v499 + M_x*v502 + M_xx*v316 + M_xxx*v176 + M_xxxx*v82 + &
      M_xxxxx*v32 + v500*v501
    Ms_xxxxxxxy  = M_xxxxxxxy + v763 + v764 + v765 + v176*v321 + v178*v82 + v181*v316 + v3* &
      v762 + v318*v32 + v502*v89
    Ms_xxxxxxxz  = M_xxxxxxxz + v766 + M_xxxxxxx*z + v176*v326 + v183*v82 + v186*v316 + v32 &
      *v323 + v4*v762 + v499*z + v502*v96
    Ms_xxxxxxxyz = M_xxxxxxxyz + M_xxxxxxxy*z + M_xxxxxxxz*y + M_xxxxxxyz*x + v176*v526 + &
      v204*v502 + v24*v762 + v316*v344 + v32*v521 + v339*v82 + v763*z + &
      v764*z + v765*z + v766*y
    a8           = a4*a4
    v761         = a8
    v971         = 2.48015873015873d-5*v761
    Ms_xxxxxxxx  = M_xxxxxxxx + v759 + M_x*v762 + M_xx*v502 + M_xxx*v316 + M_xxxx*v176 + &
      M_xxxxx*v82 + M_xxxxxx*v32 + v760*v761
    Ms_xxxxxxxxy = M_xxxxxxxxy + M_xxxxxxxx*y + M_xxxxxxxy*x + v176*v178 + v181*v502 + v3* &
      v971 + v316*v321 + v318*v82 + v32*v504 + v759*y + v762*v89
    Ms_xxxxxxxxz = M_xxxxxxxxz + M_xxxxxxxx*z + M_xxxxxxxz*x + v176*v183 + v186*v502 + v316 &
      *v326 + v32*v508 + v323*v82 + v4*v971 + v759*z + v762*v96
    a9           = a4*a5
    Ms_xxxxxxxxx = M_xxxxxxxxx + M_x*v971 + M_xx*v762 + M_xxx*v502 + M_xxxx*v316 + M_xxxxx* &
      v176 + M_xxxxxx*v82 + M_xxxxxxx*v32 + M_xxxxxxxx*x + a9*v970
    b2           = b1*b1
    v20          = b2
    v1071        = v20*v8
    v1076        = 0.25d0*v20
    v1083        = M_0*v20
    v1086        = 0.0833333333333333d0*v20
    v1117        = 0.0416666666666667d0*v20
    v1125        = 0.000694444444444444d0*v20
    v43          = 0.5d0*v20
    v102         = M_xx*v20
    v105         = v1071
    v163         = M_zz*v20
    v191         = M_xxx*v20
    v215         = M_xxy*v20
    v218         = v1076*v8
    v227         = M_xxz*v20
    v268         = M_xzz*v20
    v296         = M_yzz*v20
    v304         = M_zzz*v20
    v306         = v1083
    v333         = v1086
    v357         = v1086*v8
    v365         = v1086*v31
    v385         = v1076
    v402         = M_xxzz*v20
    v406         = v119*v20
    v408         = v20*v5
    v539         = v1085*v20
    v591         = M_xxxzz*v20
    v592         = v20*v28
    v636         = v20*v33
    v647         = M_xxzzz*v20
    v649         = v20*v38
    v653         = v102 + v103
    v654         = v408 + v409 + v653
    v746         = M_y*v20
    v790         = v1095*v20
    v814         = 0.0208333333333333d0*v1071
    v826         = v115*v20
    v857         = v20*v72
    v865         = v20*v75
    v867         = v1083*v31
    v901         = v113*v20
    v904         = v1083*v8
    v905         = v227 + v228
    v906         = v649 + v650 + v905
    v909         = M_z*v105
    v983         = v1125*v315
    v995         = v191 + v192
    v1005        = v20*v207
    v1018        = v215 + v216
    v1031        = v20*v242
    v1047        = v1117
    v1048        = v20*v205
    v1058        = v20*v240
    Ms_yy        = v19 + v20*v7
    Ms_xyy       = v1*v43 + v48
    Ms_yyz       = v4*v43 + v69
    Ms_xxyy      = 0.5d0*(v102 + v103) + v101 + v104*v105 + v18*v32 + v43*v5
    Ms_xyyz      = v17*v43 + v47*z + v1097 + v1138 + v129 + v133
    Ms_xxxyy     = 0.5d0*(v191 + v192) + v105*v194 + v188 + v189 + v19*v82 + v190 + v193* &
      v20 + v28*v43 + v32*v46
    Ms_xxyyz     = 0.5d0*(v227 + v228) + v1112 + v1144 + v218*v4 + v225 + v226 + v32*v65 + &
      v32*v67 + v32*v68 + v38*v43 + v40*v43 + v41*v43
    Ms_xxxxyy    = v328 + v329 + v330 + M_xxyy*v32 + v102*v335 + v176*v19 + v20*v331 + v20* &
      v332 + v32*v99 + v333*v334 + v336*v82 + v43*v78
    Ms_xxxyyz    = v361 + v362 + v363 + v364 + M_xxxz*v43 + M_xyyz*v32 + v127*v32 + v130* &
      v32 + v132*v32 + v190*z + v218*v96 + v365*v4 + v43*v90 + v43*v92 &
      + v43*v93 + v69*v82
    Ms_xxxxxyy   = 0.0208333333333333d0*(v20*v516) + M_xxxxxyy + M_xxxyy*v32 + v102*v517 + &
      v173*v43 + v176*v336 + v189*v32 + v19*v316 + v191*v335 + v20*v514 &
      + v20*v515 + v511 + v512 + v513 + v518*v82
    Ms_xxxxyyz   = M_xxxxyyz + v541 + v542 + v543 + v544 + v545 + v546 + M_xxyyz*v32 + v176 &
      *v69 + v182*v43 + v184*v43 + v185*v43 + v186*v218 + v20*v547 + &
      v219*v32 + v222*v32 + v224*v32 + v330*z + v365*v96 + v4*v539 + &
      v550*v82
    Ms_xxxxxxyy  = 0.00416666666666667d0*(v20*v772) + M_xxxxxxyy + M_xxxxyy*v32 + v102*v773 &
      + v105*v774 + v176*v518 + v19*v502 + v191*v517 + v20*v770 + v20* &
      v771 + v313*v43 + v316*v336 + v32*v327 + v767 + v768 + v769 + &
      v775*v82
    Ms_xxxxxyyz  = M_xxxxxyyz + v792 + v793 + v794 + M_xxxxxyy*z + M_xxxyyz*v32 + v176*v550 &
      + v186*v365 + v20*v795 + v218*v326 + v316*v69 + v32*v358 + v32* &
      v359 + v32*v360 + v322*v43 + v324*v43 + v325*v43 + v4*v790 + v511 &
      *z + v512*z + v513*z + v539*v96 + v797*v82
    Ms_xxxxxxxyy = M_xxxxxxxyy + M_xxxxxxxy*y + M_xxxxxxyy*x + M_xxxxxyy*v32 + v102*v975 + &
      v105*v977 + v1125*v974 + v176*v775 + v19*v762 + v191*v773 + v20* &
      v972 + v20*v973 + v316*v518 + v32*v511 + v328*v82 + v333*v976 + &
      v336*v502 + v43*v499 + v764*y
    Ms_xxxxxxyyz = M_xxxxxxyyz + M_xxxxxxyy*z + M_xxxxxxyz*y + M_xxxxxyyz*x + M_xxxxyyz*v32 &
      + v176*v797 + v183*v218 + v186*v539 + v20*v985 + v316*v550 + v32* &
      v541 + v32*v542 + v32*v544 + v326*v365 + v361*v82 + v4*v983 + v43 &
      *v507 + v43*v509 + v43*v510 + v502*v69 + v767*z + v768*z + v769*z &
      + v777*y + v790*v96
    b3           = b1*b2
    v64          = b3
    v1081        = M_0*v64
    v1089        = 0.0833333333333333d0*v64
    v1100        = 0.0277777777777778d0*v64
    v1109        = M_z*v64
    v126         = 0.166666666666667d0*v64
    v298         = v1081
    v384         = v1089*v8
    v538         = M_x*v64
    v571         = v1100
    v582         = v1088*v64
    v617         = v1089
    v747         = v1109
    v788         = M_xx*v64
    v813         = v1114*v64
    v820         = v1096*v64
    v859         = v1081*v31
    v890         = 0.0416666666666667d0*v64
    v896         = v1081*v8
    v981         = M_xxx*v64
    v994         = v175*v64
    Ms_yyy       = v63 + M_y*v43 + v30*v64
    Ms_xyyy      = v125 + v1*v126 + v10*v43
    Ms_yyyz      = v155 + v126*v4 + v156*v43
    Ms_xxyyy     = 0.5d0*(v215 + v216) + M_y*v218 + v126*v6 + v212 + v213 + v214 + v217*v64 &
      + v32*v62 + v33*v43
    Ms_xyyyz     = v124*z + v126*v17 + v259*v43 + v1127 + v1141 + v253 + v257
    Ms_xxxyyy    = M_xxxyyy + v350 + v351 + v352 + M_xy*v218 + M_xyyy*v32 + M_yyy*v82 + &
      v123*v32 + v126*v28 + v20*v354 + v353*v64 + v355*v64 + v356*v357 &
      + v43*v83 + v62*v82
    Ms_xxyyyz    = v389 + v390 + v391 + v392 + M_xxyz*v43 + M_yyyz*v32 + v106*v43 + v110* &
      v43 + v111*v43 + v126*v42 + v150*v32 + v152*v32 + v153*v32 + v156 &
      *v218 + v214*z + v384*v4
    Ms_xxxxyyy   = M_xxxxyyy + v531 + v532 + v533 + M_xxyyy*v32 + M_xyyy*v82 + M_y*v539 + &
      v123*v82 + v126*v78 + v176*v63 + v179*v43 + v20*v535 + v213*v32 + &
      v215*v335 + v357*v540 + v534*v64 + v536*v64 + v537*v538
    Ms_xxxyyyz   = M_xxxyyyz + v574 + v575 + v576 + v577 + v578 + v579 + M_xxxyz*v43 + &
      M_xyyyz*v32 + M_yyyz*v82 + v126*v90 + v126*v92 + v126*v93 + v150* &
      v82 + v152*v82 + v153*v82 + v195*v43 + v199*v43 + v200*v43 + v218 &
      *v581 + v251*v32 + v254*v32 + v256*v32 + v352*z + v357*v583 + v4* &
      v582 + v580*v64
    Ms_xxxxxyyy  = M_xxxxxyyy + v781 + v782 + v783 + M_xxxyyy*v32 + M_xxyyy*v82 + M_xy*v539 &
      + M_y*v790 + v105*v789 + v126*v173 + v176*v791 + v20*v785 + v213* &
      v82 + v316*v63 + v319*v43 + v32*v350 + v357*(v83 + v85) + v537* &
      v788 + v538*v787 + v64*v784 + v64*v786
    Ms_xxxxyyyz  = M_xxxxyyyz + v815 + v816 + v817 + M_xxxxyyy*z + M_xxyyyz*v32 + M_xyyyz* &
      v82 + v126*v182 + v126*v184 + v126*v185 + v155*v176 + v156*v539 + &
      v20*v818 + v218*v625 + v251*v82 + v254*v82 + v256*v82 + v32*v386 &
      + v32*v390 + v32*v391 + v337*v43 + v340*v43 + v341*v43 + v357*( &
      v107 + v109 + v626) + v4*v820 + v531*z + v532*z + v533*z + v582* &
      v96 + v64*v819
    Ms_xxxxxxyyy = M_xxxxxxyyy + M_xxxxxxyy*y + M_xxxxxyyy*x + M_xxxxyyy*v32 + M_xxxyyy*v82 &
      + M_xy*v790 + M_y*v983 + v105*v982 + v126*v313 + v176*(M_xxyyy + &
      v213) + v20*v979 + v215*v773 + v316*v791 + v32*v531 + v350*v82 + &
      v357*(v177 + v179) + v43*v505 + v537*v981 + v64*v978 + v64*v980 + &
      v768*y + v787*v788 + v984*(v121 + v124 + v538)
    Ms_xxxxxyyyz = 0.00138888888888889d0*(v994*(v1069 + 720.0d0*v999)) + M_xxxxxyyy*z + &
      M_xxxxxyyyz + M_xxxxxyyz*y + M_xxxxyyyz*x + M_xxxyyyz*v32 + &
      M_xxyyyz*v82 + v126*v322 + v126*v324 + v126*v325 + v155*v316 + &
      v156*v790 + v176*(v1000 + v1001) + v186*v582 + v20*v996 + v218* &
      v998 + v32*v574 + v32*v575 + v32*v577 + v357*(v1002 + v196 + v198 &
      ) + v386*v82 + v390*v82 + v391*v82 + v43*v519 + v43*v522 + v43* &
      v523 + v539*v581 + v64*v997 + v781*z + v782*z + v783*z + v793*y + &
      v820*v96
    b4           = b2*b2
    v149         = b4
    v1099        = 0.0208333333333333d0*v149
    v1116        = 0.00694444444444444d0*v149
    v1130        = 0.0104166666666667d0*v149
    v250         = 0.0416666666666667d0*v149
    v480         = M_0*v149
    v569         = v1099
    v624         = v1099*v8
    v735         = M_y*v149
    v845         = v1116
    v850         = v1116*v31
    v992         = 0.00173611111111111d0*v149
    v1045        = 0.00347222222222222d0*v149
    Ms_yyyy      = v148 + M_y*v126 + M_yy*v43 + v149*v80
    Ms_xyyyy     = v247 + v248 + v249 + v1*v250 + v10*v126 + v43*v45
    Ms_yyyyz     = v287 + v288 + v289 + v126*v156 + v250*v4 + v290*v43
    Ms_xxyyyy    = v380 + v381 + v382 + M_xxyy*v43 + M_y*v384 + M_yyyy*v32 + v103*v385 + &
      v126*v34 + v147*v32 + v149*v383 + v250*v6 + v43*v97
    Ms_xyyyyz    = v431 + v432 + v433 + v434 + v126*v259 + v17*v250 + v249*z + v43*v436
    Ms_xxxyyyy   = M_xxxyyyy + v564 + v565 + v566 + M_xxxyy*v43 + M_xyyyy*v32 + M_yyyy*v82 &
      + v126*v83 + v147*v82 + v149*v568 + v187*v43 + v192*v385 + v248* &
      v32 + v250*v29 + v357*v573 + v567*v64 + v569*v570 + v571*v572
    Ms_xxyyyyz   = M_xxyyyyz + v618 + v619 + v620 + v621 + v622 + v623 + M_xxyyz*v43 + &
      M_yyyyz*v32 + v126*v627 + v156*v384 + v218*v290 + v219*v43 + v220 &
      *v43 + v223*v43 + v250*v42 + v286*v32 + v288*v32 + v289*v32 + &
      v382*z + v4*v624
    Ms_xxxxyyyy  = M_xxxxyyyy + v806 + v807 + v808 + M_xxyy*v218 + M_xxyyyy*v32 + M_xy*v582 &
      + M_xyyyy*v82 + M_yyyy*v176 + v126*v179 + v147*v176 + v149*v809 + &
      v149*v812 + v20*v811 + v248*v82 + v250*v78 + v32*v381 + v329*v43 &
      + v356*v813 + v357*(v97 + v99) + v64*v810 + v653*v814
    Ms_xxxyyyyz  = M_xxxyyyyz + v846 + v847 + v848 + M_xxxyyyy*z + M_xxxyyz*v43 + M_xyyyyz* &
      v32 + M_yyyyz*v82 + v126*v195 + v126*v199 + v126*v200 + v156*v582 &
      + v218*v548 + v250*v95 + v286*v82 + v288*v82 + v289*v82 + v32* &
      v429 + v32*v432 + v32*v433 + v357*(v128 + v131 + v549) + v358*v43 &
      + v362*v43 + v363*v43 + v4*v850 + v564*z + v565*z + v566*z + v624 &
      *v96 + v64*v849
    Ms_xxxxxyyyy = M_xxxxxyyyy + M_xxxxxyyy*y + M_xxxxyyyy*x + M_xxxyy*v218 + M_xxxyyyy*v32 &
      + M_xxy*v582 + M_xxyyyy*v82 + M_xyyyy*v176 + M_yy*v790 + v126* &
      v319 + v148*v316 + v149*v988 + v149*v991 + v173*v250 + v176*v248 &
      + v20*v990 + v32*v564 + v357*(v187 + v189) + v381*v82 + v43*v512 &
      + v516*v992 + v540*v813 + v64*v989 + v782*y + v814*v995 + v993* &
      v994
    Ms_xxxxyyyyz = M_xxxxyyyyz + M_xxxxyyyy*z + M_xxxxyyyz*y + M_xxxyyyyz*x + M_xxyyyyz*v32 &
      + M_xyyyyz*v82 + M_yyyyz*v176 + v1019*v20 + v1020*v64 + v1021* &
      v149 + v126*v337 + v126*v340 + v126*v341 + v176*v286 + v176*v288 &
      + v176*v289 + v182*v250 + v184*v250 + v185*v250 + v218*v796 + v32 &
      *v618 + v32*v619 + v32*v621 + v357*(v1133 + v908) + v4*v81*v992 + &
      v429*v82 + v43*v541 + v43*v543 + v43*v545 + v432*v82 + v433*v82 + &
      v581*v582 + v583*v813 + v806*z + v807*z + v808*z + v814*(v20*v40 &
      + v67*v8 + v905) + v816*y
    b5           = b2*b3
    v285         = b5
    v1115        = 0.00416666666666667d0*v285
    v428         = 0.00833333333333333d0*v285
    v734         = M_0*v285
    v843         = v1115
    v881         = v1115*v8
    v1040        = 0.00138888888888889d0*v285
    Ms_yyyyy     = M_yyyyy + v284 + M_y*v250 + M_yy*v126 + M_yyy*v43 + v174*v285
    Ms_xyyyyy    = v425 + v426 + v427 + v1*v428 + v10*v250 + v122*v43 + v126*v45
    Ms_yyyyyz    = v471 + v472 + v473 + v126*v290 + v156*v250 + v4*v428 + v43*v474
    Ms_xxyyyyy   = M_xxyyyyy + v612 + v613 + v614 + M_xxyyy*v43 + M_yyyyy*v32 + v103*v617 + &
      v126*v98 + v211*v43 + v216*v385 + v250*v34 + v284*v32 + v285*v615 &
      + v428*v6 + v569*v616
    Ms_xyyyyyz   = v674 + v675 + v676 + v677 + v126*v436 + v17*v428 + v250*v259 + v427*z + &
      v43*v679
    Ms_xxxyyyyy  = M_xxxyyyyy + v838 + v839 + v840 + M_xxxyyy*v43 + M_xyyy*v218 + M_xyyyyy* &
      v32 + M_yy*v582 + M_yyyyy*v82 + v126*v187 + v250*v84 + v284*v82 + &
      v285*v842 + v29*v428 + v32*v426 + v351*v43 + v357*(v121 + v123) + &
      v569*v844 + v570*v843 + v572*v845 + v64*v841
    Ms_xxyyyyyz  = M_xxyyyyyz + v878 + v879 + v880 + M_xxyyyyy*z + M_xxyyyz*v43 + M_yyyyyz* &
      v32 + v126*v882 + v156*v624 + v218*v474 + v250*v627 + v290*v384 + &
      v32*v470 + v32*v472 + v32*v473 + v386*v43 + v387*v43 + v388*v43 + &
      v4*v881 + v42*v428 + v612*z + v613*z + v614*z
    Ms_xxxxyyyyy = M_xxxxyyyyy + M_xxxxyyyy*y + M_xxxyyyyy*x + M_xxyyy*v218 + M_xxyyyyy*v32 &
      + M_xyy*v582 + M_xyyyyy*v82 + M_yyyyy*v176 + v1011*v149 + v1012* &
      v64 + v1013*v20 + v1014*v285 + v1015*v285 + v1016*v843 + v1017* &
      v992 + v1018*v814 + v126*v329 + v176*v284 + v179*v250 + v32*v612 &
      + v357*(v211 + v213) + v426*v82 + v428*v79 + v43*v532 + v573*v813 &
      + v807*y
    Ms_xxxyyyyyz = M_xxxyyyyyz + M_xxxyyyyy*z + M_xxxyyyyz*y + M_xxxyyyz*v43 + M_xxyyyyyz*x &
      + M_xyyyyyz*v32 + M_yyyyyz*v82 + v1000*v218 + v1041*v64 + v1042* &
      v285*v4 + v126*v358 + v126*v362 + v126*v363 + v156*v850 + v250*( &
      v1002 + v998) + v290*v582 + v32*v672 + v32*v675 + v32*v676 + v357 &
      *(v1001 + v252 + v255) + v428*v95 + v43*v574 + v43*v576 + v43* &
      v578 + v470*v82 + v472*v82 + v473*v82 + v581*v624 + v838*z + v839 &
      *z + v840*z + v847*y + v881*v96
    b6           = b3*b3
    v469         = b6
    v671         = 0.00138888888888889d0*v469
    v955         = M_0*v469
    v1039        = 0.000694444444444444d0*v469
    Ms_yyyyyy    = M_yyyyyy + v468 + M_y*v428 + M_yy*v250 + M_yyy*v126 + M_yyyy*v43 + v314* &
      v469
    Ms_xyyyyyy   = v668 + v669 + v670 + v1*v671 + v10*v428 + v122*v126 + v247*v43 + v250* &
      v45
    Ms_yyyyyyz   = v727 + v728 + v729 + v126*v474 + v156*v428 + v250*v290 + v287*v43 + v4* &
      v671
    Ms_xxyyyyyy  = M_xxyyyyyy + v874 + v875 + v876 + M_xxyyyy*v43 + M_yyyy*v218 + M_yyyyyy* &
      v32 + v103*v569 + v126*v212 + v216*v617 + v250*v98 + v32*v468 + &
      v34*v428 + v379*v43 + v469*v877 + v6*v671 + v616*v843
    Ms_xyyyyyyz  = M_xyyyyyyz + v921 + v922 + v923 + M_xyyyyyy*z + v126*v679 + v17*v671 + &
      v250*v436 + v259*v428 + v43*v431 + v667*z + v669*z + v670*z
    Ms_xxxyyyyyy = M_xxxyyyyyy + M_xxxyyyy*v43 + M_xxxyyyyy*y + M_xxyyyyyy*x + M_xyyyy*v218 &
      + M_xyyyyyy*v32 + M_yy*v850 + M_yyy*v582 + M_yyyyyy*v82 + v1037* &
      v64 + v1038*v469 + v1039*v570 + v1040*(v572 + v87) + v126*v351 + &
      v188*v250 + v192*v569 + v32*v669 + v357*(v246 + v248) + v428*v84 &
      + v43*v565 + v468*v82 + v839*y + v843*v844
    Ms_xxyyyyyyz = M_xxyyyyyyz + M_xxyyyyyy*z + M_xxyyyyyz*y + M_xxyyyyz*v43 + M_xyyyyyyz*x &
      + M_yyyyyyz*v32 + v1039*v4*v8 + v126*v389 + v156*v881 + v218*v287 &
      + v250*v882 + v290*v624 + v32*v726 + v32*v728 + v32*v729 + v384* &
      v474 + v42*v671 + v428*v627 + v43*v618 + v43*v620 + v43*v622 + &
      v874*z + v875*z + v876*z + v879*y
    b7           = b3*b4
    v725         = b7
    v920         = 0.000198412698412698d0*v725
    Ms_yyyyyyy   = M_yyyyyyy + v724 + M_y*v671 + M_yy*v428 + M_yyy*v250 + M_yyyy*v126 + &
      M_yyyyy*v43 + v500*v725
    Ms_xyyyyyyy  = M_xyyyyyyy + v917 + v918 + v919 + v1*v920 + v10*v671 + v122*v250 + v126* &
      v247 + v425*v43 + v428*v45
    Ms_yyyyyyyz  = M_yyyyyyyz + v952 + M_yyyyyyy*z + v126*v287 + v156*v671 + v250*v474 + &
      v290*v428 + v4*v920 + v43*v471 + v724*z
    Ms_xxyyyyyyy = M_xxyyyyyyy + M_xxyyyyy*v43 + M_xxyyyyyy*y + M_xyyyyyyy*x + M_yyyy*v384 &
      + M_yyyyy*v218 + M_yyyyyyy*v32 + v103*v843 + v1039*v616 + v1056* &
      v725 + v126*v380 + v212*v250 + v216*v569 + v32*v724 + v34*v671 + &
      v428*v98 + v43*v613 + v6*v920 + v875*y
    Ms_xyyyyyyyz = M_xyyyyyyyz + M_xyyyyyyy*z + M_xyyyyyyz*y + M_yyyyyyyz*x + v126*v431 + &
      v17*v920 + v250*v679 + v259*v671 + v428*v436 + v43*v674 + v917*z &
      + v918*z + v919*z + v922*y
    b8           = b4*b4
    v951         = b8
    v1059        = 2.48015873015873d-5*v951
    Ms_yyyyyyyy  = M_yyyyyyyy + v950 + M_y*v920 + M_yy*v671 + M_yyy*v428 + M_yyyy*v250 + &
      M_yyyyy*v126 + M_yyyyyy*v43 + v760*v951
    Ms_xyyyyyyyy = M_xyyyyyyyy + M_xyyyyyyy*y + M_yyyyyyyy*x + v1*v1059 + v10*v920 + v122* &
      v428 + v126*v425 + v247*v250 + v43*v668 + v45*v671 + v918*y
    Ms_yyyyyyyyz = M_yyyyyyyyz + M_yyyyyyyy*z + M_yyyyyyyz*y + v1059*v4 + v126*v471 + v156* &
      v920 + v250*v287 + v290*v671 + v428*v474 + v43*v727 + v950*z
    b9           = b4*b5
    Ms_yyyyyyyyy = M_yyyyyyyyy + M_y*v1059 + M_yy*v920 + M_yyy*v671 + M_yyyy*v428 + M_yyyyy &
      *v250 + M_yyyyyy*v126 + M_yyyyyyy*v43 + M_yyyyyyyy*y + b9*v970
    c2           = c1*c1
    v27          = c2
    v1072        = v27*v8
    v1073        = v20*v27
    v1078        = 0.25d0*v27
    v1080        = 0.0833333333333333d0*v27
    v1093        = 0.0208333333333333d0*v27
    v1106        = 0.00416666666666667d0*v27
    v1120        = 0.000694444444444444d0*v27
    v56          = 0.5d0*v27
    v118         = M_xx*v27
    v120         = v1072
    v162         = M_yy*v27
    v164         = v1073
    v209         = M_xxx*v27
    v237         = M_xxy*v27
    v239         = v1078*v8
    v244         = M_xxz*v27
    v267         = M_xyy*v27
    v269         = v1076*v27
    v295         = M_yyy*v27
    v297         = v1080
    v303         = M_yyz*v27
    v373         = v1080*v31
    v378         = v1080*v8
    v401         = M_xxyy*v27
    v404         = v102*v27
    v405         = v103*v27
    v407         = v1078
    v411         = 0.125d0*v1073
    v444         = v1080*v64
    v479         = v1093
    v487         = v1086*v27
    v557         = v1093*v81
    v590         = M_xxxyy*v27
    v596         = M_x*v164
    v597         = v162 + v163
    v598         = v597 + v18*v27 + v20*v25
    v634         = M_xxyyy*v27
    v639         = v118 + v119
    v640         = v27*v5 + v410 + v639
    v686         = v1099*v27
    v733         = v1106
    v801         = v1095*v27
    v825         = v27*v99
    v827         = 0.0104166666666667d0*v1073
    v828         = v267 + v268
    v829         = v828 + v20*v59 + v27*v46
    v837         = v1093*v8
    v855         = v27*v28
    v856         = v27*v62
    v858         = 0.0138888888888889d0*v27
    v1134        = v64*v858
    v860         = v1072*v1117
    v864         = v27*v65
    v886         = v27*v97
    v888         = v237 + v238
    v889         = v27*v33 + v638 + v888
    v891         = M_y*v120
    v895         = v27*v38
    v897         = v1073*v1102
    v927         = v1106*v285
    v954         = v1120
    v963         = v1093*v20
    v986         = v1120*v315
    v1004        = v189*v27
    v1006        = v1102*v27
    v1010        = v209 + v210
    v1024        = v213*v27
    v1026        = v295 + v296
    v1032        = v303 + v304
    v1036        = v244 + v245
    v1044        = v187*v27
    v1046        = v1072*v1130
    v1053        = 0.0416666666666667d0*v27
    v1057        = v211*v27
    v1060        = v1120*v469
    Ms_zz        = v26 + v27*v7
    Ms_xzz       = v1*v56 + v61
    Ms_yzz       = v3*v56 + v74
    Ms_xxzz      = 0.5d0*(v118 + v119) + v104*v120 + v117 + v25*v32 + v5*v56
    Ms_xyzz      = v13*v56 + v55*z + v1092 + v1139 + v136 + v139
    Ms_yyzz      = 0.5d0*(v162 + v163) + v104*v164 + v161 + v18*v56 + v25*v43
    Ms_xxxzz     = 0.5d0*(v209 + v210) + v120*v194 + v193*v27 + v206 + v207 + v208 + v26* &
      v82 + v28*v56 + v32*v59
    Ms_xxyzz     = 0.5d0*(v237 + v238) + v1119 + v1143 + v231 + v234 + v236 + v239*v3 + v32 &
      *v70 + v32*v72 + v32*v73 + v33*v56 + v35*v56 + v36*v56
    Ms_xyyzz     = 0.5d0*(v267 + v268) + M_xyyzz + v1*v269 + v1131 + v1145 + v261 + v264 + &
      v43*v57 + v43*v59 + v43*v60 + v44*v56 + v46*v56 + v47*v56
    Ms_yyyzz     = 0.5d0*(v295 + v296) + M_y*v269 + v126*v26 + v292 + v293 + v294 + v297* &
      v298 + v43*v72 + v56*v62
    Ms_xxxxzz    = v346 + v347 + v348 + M_xxzz*v32 + v115*v32 + v118*v335 + v176*v26 + v27* &
      v331 + v27*v332 + v297*v334 + v349*v82 + v56*v78
    Ms_xxxyzz    = v369 + v370 + v371 + v372 + M_xyzz*v32 + v134*v32 + v135*v32 + v137*v32 &
      + v201*z + v239*v89 + v27*v354 + v3*v373 + v56*v83 + v56*v85 + &
      v56*v86 + v74*v82
    Ms_xxyyzz    = 0.25d0*(v404 + v405 + v406 + 2.0d0*(v401 + v402 + v403)) + v100*v56 + &
      v1075*v411 + v113*v43 + v1132 + v1146 + v115*v43 + v116*v43 + &
      v157*v32 + v159*v32 + v160*v32 + v385*v410 + v397 + v407*v408 + &
      v407*v409 + v56*v97 + v56*v99
    Ms_xyyyzz    = v440 + v441 + v442 + v443 + M_xyyy*v56 + M_xyzz*v43 + v1*v444 + v10*v269 &
      + v121*v56 + v123*v56 + v124*v56 + v126*v61 + v134*v43 + v138*v43 &
      + v139*v43 + v257*z
    Ms_yyyyzz    = v476 + v477 + v478 + M_y*v444 + M_yyyy*v56 + M_yyzz*v43 + v126*v481 + &
      v147*v56 + v159*v43 + v162*v385 + v250*v26 + v479*v480
    Ms_xxxxxzz   = M_xxxxxzz + v527 + v528 + v529 + M_xxxzz*v32 + v118*v517 + v173*v56 + &
      v176*v349 + v207*v32 + v209*v335 + v26*v316 + v27*v514 + v27*v515 &
      + v479*v516 + v530*v82
    Ms_xxxxyzz   = M_xxxxyzz + v551 + v552 + v553 + v554 + v555 + v556 + M_xxyzz*v32 + v176 &
      *v74 + v177*v56 + v179*v56 + v180*v56 + v181*v239 + v229*v32 + &
      v230*v32 + v232*v32 + v27*v535 + v3*v557 + v342*z + v373*v89 + &
      v558*v82
    Ms_xxxyyzz   = 0.5d0*(v590 + v591) + M_xxxyyzz + M_xyyzz*v32 + v1070*v164*v31 + v161* &
      v82 + v187*v56 + v189*v56 + v190*v56 + v191*v407 + v192*v407 + &
      v205*v43 + v207*v43 + v208*v43 + v210*v385 + v262*v32 + v263*v32 &
      + v265*v32 + v364*z + v385*v594 + v407*v592 + v407*v593 + v517* &
      v598 + v584 + v585 + v586 + v587 + v588 + v589 + v595*v596
    Ms_xxyyyzz   = 0.5d0*(v634 + v635) + M_xxyyyzz + M_xxyzz*v43 + v1070*v120*v64 + v117* &
      v126 + v211*v56 + v213*v56 + v214*v56 + v215*v407 + v216*v407 + &
      v229*v43 + v233*v43 + v234*v43 + v238*v385 + v291*v32 + v293*v32 &
      + v294*v32 + v385*v638 + v392*z + v407*v636 + v407*v637 + v411* &
      v616 + v617*v640 + v628 + v629 + v630 + v631 + v632 + v633
    Ms_xyyyyzz   = M_xyyyyzz + v680 + v681 + v682 + v683 + v684 + v685 + M_xyyyy*v56 + &
      M_xyyzz*v43 + v1*v686 + v10*v444 + v126*v689 + v246*v56 + v248* &
      v56 + v249*v56 + v250*v61 + v260*v43 + v262*v43 + v264*v43 + v269 &
      *v45 + v434*z
    Ms_yyyyyzz   = M_yyyyyzz + v730 + v731 + v732 + M_yyyyy*v56 + M_yyyzz*v43 + v126*v736 + &
      v162*v617 + v250*v481 + v26*v428 + v284*v56 + v293*v43 + v295* &
      v385 + v479*v735 + v733*v734
    Ms_xxxxxxzz  = M_xxxxxxzz + v779 + M_xxxxxxz*z + M_xxxxzz*v32 + v118*v773 + v120*v774 + &
      v176*v530 + v209*v517 + v26*v502 + v27*v770 + v27*v771 + v313*v56 &
      + v316*v349 + v32*v345 + v509*z + v733*v772 + v780*v82
    Ms_xxxxxyzz  = M_xxxxxyzz + v798 + v799 + v800 + M_xxxxxyz*z + M_xxxyzz*v32 + v176*v558 &
      + v181*v373 + v239*v321 + v27*v785 + v3*v801 + v316*v74 + v317* &
      v56 + v319*v56 + v32*v366 + v32*v367 + v32*v368 + v320*v56 + v520 &
      *z + v522*z + v524*z + v557*v89 + v803*v82
    Ms_xxxxyyzz  = M_xxxxyyzz + v821 + v822 + v823 + M_xxxxyyz*z + M_xxyyzz*v32 + v1113* &
      v827 + v164*v774 + v20*v824 + v269*v78 + v27*v811 + v32*v393 + &
      v32*v394 + v32*v398 + v327*v56 + v329*v56 + v330*v56 + v335*v401 &
      + v335*v402 + v335*v825 + v335*v826 + v345*v43 + v347*v43 + v348* &
      v43 + v404*v595 + v517*v829 + v542*z + v543*z + v546*z + v598* &
      v773 + v82*(M_xyyzz + v1131 + v263) + v830*(v261 + v264 + v266 + &
      v596)
    Ms_xxxyyyzz  = M_xxxyyyzz + v851 + v852 + v853 + M_xxxyyy*v56 + M_xxxyyyz*z + M_xxxyzz* &
      v43 + M_xyyy*v239 + M_xyyyzz*v32 + M_xyzz*v218 + M_yyyzz*v82 + &
      v123*v239 + v126*v205 + v126*v207 + v126*v208 + v134*v218 + v164* &
      v789 + v209*v617 + v210*v617 + v26*v582 + v269*v83 + v291*v82 + &
      v293*v82 + v294*v82 + v295*v517 + v296*v517 + v32*v437 + v32*v441 &
      + v32*v442 + v350*v56 + v351*v56 + v352*v56 + v356*v860 + v366* &
      v43 + v370*v43 + v371*v43 + v411*v844 + v517*v856 + v517*v857 + &
      v575*z + v576*z + v579*z + v594*v617 + v617*v855 + v64*v854 + &
      v858*v859
    Ms_xxyyyyzz  = 0.0104166666666667d0*(v1072*v480) + M_xxyyyy*v56 + M_xxyyyyz*z + &
      M_xxyyyyzz + M_xxyyzz*v43 + M_yyyy*v239 + M_yyyyzz*v32 + v103* &
      v411 + v126*(M_xxyzz + v229 + v233 + v234) + v147*v239 + v32*v475 &
      + v32*v477 + v32*v478 + v379*v56 + v381*v56 + v382*v56 + v385* &
      v401 + v385*v403 + v385*v886 + v385*v887 + v393*v43 + v395*v43 + &
      v399*v43 + v569*v640 + v617*v889 + v619*z + v620*z + v623*z + &
      v883 + v884 + v885 + v890*(v230 + v232 + v235 + v236 + v891)
    Ms_xyyyyyzz  = M_xyyyyyzz + v924 + v925 + v926 + M_xyyyyy*v56 + M_xyyyyyz*z + M_xyyyzz* &
      v43 + v1*v927 + v10*v686 + v122*v269 + v126*v930 + v250*v689 + &
      v424*v56 + v426*v56 + v427*v56 + v428*v61 + v43*v437 + v43*v438 + &
      v43*v439 + v444*v45 + v673*z + v675*z + v677*z
    Ms_yyyyyyzz  = M_yyyyyyzz + v953 + M_y*v927 + M_yyyy*v269 + M_yyyyyy*v56 + M_yyyyyyz*z &
      + M_yyyyzz*v43 + v126*v956 + v162*v569 + v250*v736 + v26*v671 + &
      v295*v617 + v428*v481 + v43*v475 + v468*v56 + v728*z + v954*v955
    Ms_xxxxxxxzz = M_xxxxxxxzz + M_xxxxxxxz*z + M_xxxxxxzz*x + M_xxxxxzz*v32 + v118*v975 + &
      v120*v977 + v176*v780 + v209*v773 + v26*v762 + v27*v972 + v27* &
      v973 + v297*v976 + v316*v530 + v32*v527 + v346*v82 + v349*v502 + &
      v499*v56 + v766*z + v954*v974
    Ms_xxxxxxyzz = M_xxxxxxyzz + M_xxxxxxyz*z + M_xxxxxxzz*y + M_xxxxxyzz*x + M_xxxxyzz*v32 &
      + v176*v803 + v178*v239 + v181*v557 + v27*v979 + v3*v986 + v316* &
      v558 + v32*v551 + v32*v552 + v32*v554 + v321*v373 + v369*v82 + &
      v502*v74 + v503*v56 + v505*v56 + v506*v56 + v776*z + v777*z + &
      v778*z + v779*y + v801*v89
    Ms_xxxxxyyzz = 0.00208333333333333d0*(v1083*v175*v27 + 5.0d0*v596*v81) + M_xxxxxyyz*z + &
      M_xxxxxyyzz + M_xxxxxyzz*y + M_xxxxyyzz*x + M_xxxyyzz*v32 + v1003 &
      *v20 + v1004*v335 + v1005*v335 + v1006*v191 + v161*v316 + v164* &
      v977 + v173*v269 + v27*v990 + v32*v584 + v32*v585 + v32*v587 + &
      v335*v590 + v335*v591 + v43*v527 + v43*v528 + v43*v529 + v511*v56 &
      + v512*v56 + v513*v56 + v517*(v401 + v402 + v825 + v826) + v598* &
      v975 + v773*v829 + v792*z + v793*z + v794*z + v799*y + v82*(v1007 &
      + v1090) + v830*(v1091 + v1137 + v404)
    Ms_xxxxyyyzz = M_xxxxyyyzz + M_xxxx*v444 + M_xxxxyyyz*z + M_xxxxyyzz*y + M_xxxyyyzz*x + &
      M_xxyyyzz*v32 + M_xxyzz*v218 + M_xxzz*v384 + M_xyyy*v373 + &
      M_xyyyzz*v82 + M_xyzz*v365 + v1006*v215 + v1013*v27 + v1017*v827 &
      + v1022*v20 + v1023*v64 + v1024*v335 + v1025*v27*v64 + v1027*( &
      v1028 + v1029 + v118*v64 + v27*v636 + v294*v8 + v635) + v1087* &
      v1134 + v115*v384 + v123*v373 + v126*v345 + v126*v347 + v126*v348 &
      + v134*v365 + v164*v982 + v179*v269 + v218*v229 + v26*v820 + v32* &
      v628 + v32*v629 + v32*v631 + v335*v634 + v349*v582 + v43*v551 + &
      v43*v553 + v43*v555 + v437*v82 + v441*v82 + v442*v82 + v444*v78 + &
      v531*v56 + v532*v56 + v533*v56 + v773*(v1026 + v856 + v857) + &
      v815*z + v816*z + v817*z + v822*y
    Ms_xxxyyyyzz = M_xxxyyyyzz + M_x*v1046 + M_xxxy*v444 + M_xxxyyyy*v56 + M_xxxyyyyz*z + &
      M_xxxyyyzz*y + M_xxxyyzz*v43 + M_xxyyyyzz*x + M_xyyyy*v239 + &
      M_xyyyyzz*v32 + M_xyyzz*v218 + M_xyzz*v384 + M_yyyy*v373 + &
      M_yyyyzz*v82 + M_yyzz*v365 + v1043*v64 + v1044*v385 + v1045*v1098 &
      *v27 + v1047*(v1005 + v1048 + v162*v31 + v20*v208 + v27*v593 + &
      v591) + v1101*v1134 + v126*v366 + v126*v370 + v126*v371 + v134* &
      v384 + v147*v373 + v159*v365 + v192*v411 + v218*v262 + v239*v248 &
      + v26*v850 + v32*v680 + v32*v681 + v32*v683 + v385*v590 + v43* &
      v584 + v43*v586 + v43*v588 + v444*v83 + v475*v82 + v477*v82 + &
      v478*v82 + v481*v582 + v56*v564 + v56*v565 + v56*v566 + v569*( &
      v1010 + v594 + v855) + v846*z + v847*z + v848*z + v852*y
    Ms_xxyyyyyzz = 0.00208333333333333d0*(v1072*v734) + M_xxyyyyy*v56 + M_xxyyyyyz*z + &
      M_xxyyyyyzz + M_xxyyyyzz*y + M_xxyyyzz*v43 + M_xyyyyyzz*x + &
      M_yyyyy*v239 + M_yyyyyzz*v32 + v1028*v385 + v1057*v385 + v1130* &
      v891 + v117*v428 + v126*(M_xxyyzz + v393 + v395 + v399) + v216* &
      v411 + v239*v284 + v32*v730 + v32*v731 + v32*v732 + v385*v634 + &
      v385*v635 + v43*v628 + v43*v630 + v43*v632 + v56*v612 + v56*v613 &
      + v56*v614 + v569*v889 + v617*(v401 + v403 + v886 + v887) + v640* &
      v843 + v878*z + v879*z + v880*z + v884*y + v890*(v394 + v396 + &
      v398 + v400 + v405)
    Ms_xyyyyyyzz = M_xyyyyyyzz + M_xyyyyyy*v56 + M_xyyyyyyz*z + M_xyyyyyzz*y + M_xyyyyzz* &
      v43 + M_yyyyyyzz*x + v1*v1060 + v10*v927 + v122*v444 + v126*v440 &
      + v247*v269 + v250*v930 + v428*v689 + v43*v680 + v43*v682 + v43* &
      v684 + v45*v686 + v56*v667 + v56*v669 + v56*v670 + v61*v671 + &
      v921*z + v922*z + v923*z + v925*y
    Ms_yyyyyyyzz = M_yyyyyyyzz + M_y*v1060 + M_yyyy*v444 + M_yyyyy*v269 + M_yyyyyyy*v56 + &
      M_yyyyyyyz*z + M_yyyyyyzz*y + M_yyyyyzz*v43 + v1124*v27*v725 + &
      v126*v476 + v162*v843 + v250*v956 + v26*v920 + v295*v569 + v428* &
      v736 + v43*v730 + v481*v671 + v56*v724 + v952*z
    h            = v20 + v27 + v8
    u2           = 1.0/h
    u            = sqrt(u2)
    u3           = u*u2
    u4           = u2*u2
    u5           = u2*u3
    u6           = u3*u3
    u7           = u3*u4
    u8           = u4*u4
    u9           = u4*u5
    u10          = u5*u5
    u11          = u5*u6
    u12          = u6*u6
    u13          = u6*u7
    u14          = u7*u7
    u15          = u7*u8
    u16          = u8*u8
    u17          = u8*u9
    u18          = u9*u9
    u19          = u10*u9
    c3           = c1*c2
    v77          = c3
    v1082        = 0.0833333333333333d0*v77
    v1107        = M_y*v77
    v1122        = 0.00694444444444444d0*v77
    v146         = 0.166666666666667d0*v77
    v305         = v1082
    v419         = v1082*v8
    v452         = v1086*v77
    v485         = 0.0277777777777778d0*v77
    v562         = M_x*v77
    v605         = v1088*v77
    v696         = v1100*v77
    v740         = v1107
    v834         = v1096*v77
    v836         = v1114*v77
    v866         = 0.0138888888888889d0*v77
    v907         = 0.0416666666666667d0*v77
    v934         = v1116*v77
    v958         = v285*v77
    v962         = v1122*v64
    v1008        = v175*v77
    Ms_zzz       = v76 + M_z*v56 + v30*v77
    Ms_xzzz      = v145 + v1*v146 + v15*v56
    Ms_yzzz      = v169 + v146*v3 + v22*v56
    Ms_xxzzz     = 0.5d0*(v244 + v245) + M_z*v239 + v146*v6 + v217*v77 + v241 + v242 + v243 &
      + v32*v75 + v38*v56
    Ms_xyzzz     = v13*v146 + v140*z + v278*v56 + v1105 + v1142 + v272 + v275
    Ms_yyzzz     = 0.5d0*(v303 + v304) + M_z*v269 + v146*v19 + v300 + v301 + v302 + v305* &
      v306 + v43*v75 + v56*v65
    Ms_xxxzzz    = M_xxxzzz + v374 + v375 + v376 + M_xxxz*v56 + M_xz*v239 + M_xzzz*v32 + &
      M_zzz*v82 + v143*v32 + v146*v28 + v353*v77 + v355*v77 + v377*v378 &
      + v56*v90 + v75*v82
    Ms_xxyzzz    = v415 + v416 + v417 + v418 + M_xxyz*v56 + M_yzzz*v32 + v109*v56 + v110* &
      v56 + v112*v56 + v146*v37 + v165*v32 + v167*v32 + v168*v32 + v22* &
      v239 + v235*z + v3*v419
    Ms_xyyzzz    = v448 + v449 + v450 + v451 + M_xyyz*v56 + M_xzzz*v43 + v1*v452 + v130*v56 &
      + v131*v56 + v133*v56 + v141*v43 + v143*v43 + v144*v43 + v146*v48 &
      + v15*v269 + v266*z
    Ms_yyyzzz    = M_yyyzzz + v482 + v483 + v484 + M_yyy*v146 + M_yyyz*v56 + M_yz*v269 + &
      M_yzzz*v43 + M_zzz*v126 + v126*v75 + v146*v62 + v150*v56 + v167* &
      v43 + v298*v485 + v486*v487
    Ms_xxxxzzz   = M_xxxxzzz + v559 + v560 + v561 + M_xxzzz*v32 + M_xzzz*v82 + M_z*v557 + &
      v143*v82 + v146*v78 + v176*v76 + v184*v56 + v242*v32 + v244*v335 &
      + v27*v547 + v378*v563 + v534*v77 + v536*v77 + v537*v562
    Ms_xxxyzzz   = M_xxxyzzz + v599 + v600 + v601 + v602 + v603 + v604 + M_xxxyz*v56 + &
      M_xyzzz*v32 + M_yzzz*v82 + v146*v83 + v146*v85 + v146*v86 + v165* &
      v82 + v167*v82 + v168*v82 + v198*v56 + v199*v56 + v201*v56 + v202 &
      *v239 + v270*v32 + v271*v32 + v273*v32 + v3*v605 + v372*z + v378* &
      v606 + v567*v77
    Ms_xxyyzzz   = 0.5d0*(v647 + v648) + M_xxyyz*v56 + M_xxyyzzz + v101*v146 + v105*v1070* &
      v77 + v222*v56 + v223*v56 + v225*v56 + v227*v407 + v228*v407 + &
      v240*v43 + v242*v43 + v243*v43 + v245*v385 + v299*v32 + v301*v32 &
      + v302*v32 + v305*v654 + v385*v651 + v400*z + v407*v649 + v407* &
      v650 + v411*v652 + v641 + v642 + v643 + v644 + v645 + v646
    Ms_xyyyzzz   = M_xyyyzzz + v690 + v691 + v692 + v693 + v694 + v695 + M_xyyy*v146 + &
      M_xyyyz*v56 + M_xyzzz*v43 + M_xzzz*v126 + v1*v696 + v121*v146 + &
      v123*v146 + v124*v146 + v126*v141 + v126*v143 + v126*v144 + v254* &
      v56 + v255*v56 + v257*v56 + v258*v269 + v270*v43 + v274*v43 + &
      v275*v43 + v443*z + v487*v699
    Ms_yyyyzzz   = M_yyyyzzz + v737 + v738 + v739 + M_yyyy*v146 + M_yyyyz*v56 + M_yyzzz*v43 &
      + M_yzzz*v126 + M_z*v686 + v1122*v480 + v126*v167 + v146*v147 + &
      v250*v76 + v288*v56 + v301*v43 + v303*v385 + v487*v741 + v571* &
      v740
    Ms_xxxxxzzz  = M_xxxxxzzz + v804 + M_xx*v605 + M_xxxxxzz*z + M_xxxz*v239 + M_xxxzzz*v32 &
      + M_xxzzz*v82 + M_xz*v557 + M_z*v801 + v146*v173 + v176*v805 + &
      v242*v82 + v27*v795 + v316*v76 + v32*v374 + v324*v56 + v378*(v90 &
      + v92) + v528*z + v562*v787 + v77*v784 + v77*v786
    Ms_xxxxyzzz  = M_xxxxyzzz + v831 + v832 + v833 + M_xxxxyzz*z + M_xxyzzz*v32 + M_xyzzz* &
      v82 + v146*v177 + v146*v179 + v146*v180 + v169*v176 + v22*v557 + &
      v239*v343 + v27*v818 + v270*v82 + v271*v82 + v273*v82 + v3*v834 + &
      v32*v412 + v32*v416 + v32*v417 + v338*v56 + v340*v56 + v342*v56 + &
      v378*(v108 + v662) + v552*z + v553*z + v556*z + v605*v89 + v77* &
      v810
    Ms_xxxyyzzz  = M_xxxyyzzz + v861 + v862 + v863 + M_xxxyyz*v56 + M_xxxyyzz*z + M_xxxz* &
      v269 + M_xxxzzz*v43 + M_xyyz*v239 + M_xyyzzz*v32 + M_xzzz*v218 + &
      M_yyzzz*v82 + v130*v239 + v143*v218 + v146*v187 + v146*v189 + &
      v146*v190 + v19*v605 + v191*v305 + v192*v305 + v269*v90 + v299* &
      v82 + v301*v82 + v302*v82 + v303*v517 + v304*v517 + v305*v592 + &
      v305*v593 + v32*v445 + v32*v449 + v32*v450 + v359*v56 + v362*v56 &
      + v364*v56 + v374*v43 + v375*v43 + v376*v43 + v377*v860 + v411* &
      v868 + v517*v864 + v517*v865 + v585*z + v586*z + v589*z + v77* &
      v841 + v866*v867
    Ms_xxyyyzzz  = M_xxyyyzzz + v892 + v893 + v894 + M_xxyyy*v146 + M_xxyyyz*v56 + &
      M_xxyyyzz*z + M_xxyz*v269 + M_xxyzzz*v43 + M_xxzzz*v126 + M_yyyz* &
      v239 + M_yyyzzz*v32 + M_yz*v897 + M_yzzz*v218 + v110*v269 + v126* &
      v240 + v126*v242 + v126*v243 + v146*v211 + v146*v213 + v146*v214 &
      + v150*v239 + v167*v218 + v215*v305 + v216*v305 + v244*v617 + &
      v245*v617 + v305*v636 + v305*v637 + v32*v482 + v32*v483 + v32* &
      v484 + v387*v56 + v390*v56 + v392*v56 + v413*v43 + v416*v43 + &
      v418*v43 + v486*v860 + v6*v696 + v617*v651 + v617*v895 + v629*z + &
      v630*z + v633*z + v866*v896
    Ms_xyyyyzzz  = M_xyyyyzzz + v931 + v932 + v933 + M_xyyyy*v146 + M_xyyyyz*v56 + &
      M_xyyyyzz*z + M_xyyzzz*v43 + M_xyzzz*v126 + v1*v934 + v10*v696 + &
      v126*v270 + v126*v274 + v126*v275 + v145*v250 + v146*v246 + v146* &
      v248 + v146*v249 + v15*v686 + v269*v435 + v43*v446 + v43*v449 + &
      v43*v451 + v430*v56 + v432*v56 + v434*v56 + v487*(v129 + v707) + &
      v681*z + v682*z + v685*z
    Ms_yyyyyzzz  = M_yyyyyzzz + v957 + M_yy*v696 + M_yyyyy*v146 + M_yyyyyz*v56 + M_yyyyyzz* &
      z + M_yyyz*v269 + M_yyyzzz*v43 + M_yyzzz*v126 + M_yz*v686 + M_z* &
      v927 + v126*v301 + v146*v284 + v250*v959 + v314*v958 + v428*v76 + &
      v43*v482 + v472*v56 + v487*(v150 + v152) + v731*z + v740*v845
    Ms_xxxxxxzzz = M_xxxxxxzzz + M_xx*v834 + M_xxx*v605 + M_xxxxxxzz*z + M_xxxxxzzz*x + &
      M_xxxxzzz*v32 + M_xxxzzz*v82 + M_xz*v801 + M_z*v986 + v120*v987 + &
      v146*v313 + v176*(M_xxzzz + v242) + v244*v773 + v27*v985 + v316* &
      v805 + v32*v559 + v374*v82 + v378*(v182 + v184) + v509*v56 + v77* &
      v978 + v77*v980 + v779*z + v984*(v141 + v144 + v562)
    Ms_xxxxxyzzz = 0.00138888888888889d0*(v1008*(v1068 + 720.0d0*v993)) + M_xxxxxyzz*z + &
      M_xxxxxyzzz + M_xxxxxzzz*y + M_xxxxyzzz*x + M_xxxyzzz*v32 + &
      M_xxyzzz*v82 + v146*v317 + v146*v319 + v146*v320 + v169*v316 + &
      v176*(v272 + v716) + v181*v605 + v202*v557 + v22*v801 + v239*v525 &
      + v27*v996 + v32*v599 + v32*v600 + v32*v602 + v378*(v1009 + v197 &
      ) + v412*v82 + v416*v82 + v417*v82 + v520*v56 + v522*v56 + v524* &
      v56 + v77*v989 + v798*z + v799*z + v800*z + v804*y + v834*v89
    Ms_xxxxyyzzz = 0.0138888888888889d0*(v20*v31*v562) + M_xxxx*v452 + M_xxxxyyzz*z + &
      M_xxxxyyzzz + M_xxxxyzzz*y + M_xxxyyzzz*x + M_xxyy*v419 + M_xxyyz &
      *v239 + M_xxyyzzz*v32 + M_xyyz*v373 + M_xyyzzz*v82 + M_xzzz*v365 &
      + M_z*v81*v827 + v1006*v227 + v1012*v77 + v1019*v27 + v1025*v20* &
      v77 + v1027*(v102*v77 + v1033 + v1034 + v27*v649 + v302*v8 + v648 &
      ) + v1030*v20 + v1031*v335 + v130*v373 + v143*v365 + v146*v327 + &
      v146*v329 + v146*v330 + v164*v987 + v184*v269 + v19*v834 + v222* &
      v239 + v32*v641 + v32*v642 + v32*v644 + v335*v647 + v336*v605 + &
      v419*v99 + v43*v559 + v43*v560 + v43*v561 + v445*v82 + v449*v82 + &
      v450*v82 + v452*v78 + v542*v56 + v543*v56 + v546*v56 + v773*( &
      v1032 + v864 + v865) + v821*z + v822*z + v823*z + v832*y
    Ms_xxxyyyzzz = 0.00462962962962963d0*(v77*v859) + M_xxxy*v452 + M_xxxyyyz*v56 + &
      M_xxxyyyzz*z + M_xxxyyyzzz + M_xxxyyzzz*y + M_xxxyz*v269 + &
      M_xxxyzzz*v43 + M_xxxz*v444 + M_xxyyyzzz*x + M_xyyy*v419 + &
      M_xyyyz*v239 + M_xyyyzzz*v32 + M_xyz*v897 + M_xyzzz*v218 + M_xzzz &
      *v384 + M_yyy*v605 + M_yyyz*v373 + M_yyyzzz*v82 + M_yzzz*v365 + &
      M_zzz*v582 + v1037*v77 + v1049*v64 + v1050*v1073*(v54 + v698) + &
      v123*v419 + v126*v374 + v126*v375 + v126*v376 + v143*v384 + v146* &
      v350 + v146*v351 + v146*v352 + v150*v373 + v167*v365 + v199*v269 &
      + v218*v270 + v239*v254 + v28*v696 + v32*v690 + v32*v691 + v32* &
      v693 + v43*v599 + v43*v601 + v43*v603 + v444*v90 + v452*v83 + &
      v482*v82 + v483*v82 + v484*v82 + v485*v981 + v56*v575 + v56*v576 &
      + v56*v579 + v582*v75 + v605*v62 + v851*z + v852*z + v853*z + &
      v860*(v53 + v697) + v862*y
    Ms_xxyyyyzzz = M_xxyyyyzzz + M_xxyy*v452 + M_xxyyyy*v146 + M_xxyyyyz*v56 + M_xxyyyyzz*z &
      + M_xxyyyzzz*y + M_xxyyz*v269 + M_xxyyzzz*v43 + M_xxyz*v444 + &
      M_xxyzzz*v126 + M_xyyyyzzz*x + M_yyyy*v419 + M_yyyyz*v239 + &
      M_yyyyzzz*v32 + M_yzzz*v384 + M_z*v1046 + v1033*v385 + v1045* &
      v1075*v77 + v1047*(v103*v77 + v1031 + v1058 + v20*v243 + v27*v650 &
      + v647) + v1050*v1107*v64 + v110*v444 + v126*v413 + v126*v416 + &
      v126*v418 + v146*v379 + v146*v381 + v146*v382 + v147*v419 + v167* &
      v384 + v223*v269 + v228*v411 + v239*v288 + v32*v737 + v32*v738 + &
      v32*v739 + v34*v696 + v385*v648 + v43*v641 + v43*v643 + v43*v645 &
      + v452*v97 + v56*v619 + v56*v620 + v56*v623 + v569*(v1036 + v651 &
      + v895) + v6*v934 + v883*z + v884*z + v885*z + v893*y
    Ms_xyyyyyzzz = M_xyyyyyzzz + M_xyyyyy*v146 + M_xyyyyyz*v56 + M_xyyyyyzz*z + M_xyyyyzzz* &
      y + M_xyyyzzz*v43 + M_xyyzzz*v126 + M_yyyyyzzz*x + v10*v934 + &
      v1061*v958 + v126*v446 + v126*v449 + v126*v451 + v145*v428 + v146 &
      *v424 + v146*v426 + v146*v427 + v15*v927 + v250*(v1062 + v1063) + &
      v258*v686 + v269*v678 + v43*v690 + v43*v692 + v43*v694 + v45*v696 &
      + v487*(v1064 + v253) + v56*v673 + v56*v675 + v56*v677 + v924*z + &
      v925*z + v926*z + v932*y
    Ms_yyyyyyzzz = 0.000231481481481481d0*(v77*v955) + M_yy*v934 + M_yyy*v696 + M_yyyyyy* &
      v146 + M_yyyyyyz*v56 + M_yyyyyyzz*z + M_yyyyyyzzz + M_yyyyyzzz*y &
      + M_yyyyz*v269 + M_yyyyzzz*v43 + M_yyyzzz*v126 + M_yz*v927 + M_z* &
      v1060 + v1040*(v165 + v168 + v740) + v126*v482 + v146*v468 + v250 &
      *(M_yyzzz + v301) + v303*v569 + v428*v959 + v43*v737 + v487*(v286 &
      + v288) + v56*v728 + v953*z
    c4           = c2*c2
    v172         = c4
    v1094        = 0.0208333333333333d0*v172
    v1108        = 0.00694444444444444d0*v172
    v1118        = 0.0104166666666667d0*v172
    v1121        = 0.00173611111111111d0*v172
    v283         = 0.0416666666666667d0*v172
    v492         = v1094
    v661         = v1094*v8
    v706         = v1094*v20
    v745         = v1108
    v872         = v1108*v31
    v903         = v1118
    v938         = v1108*v64
    v961         = v1121
    v1035        = M_z*v1121
    v1051        = 0.00347222222222222d0*v172
    v1052        = v1071*v1118
    v1054        = M_zz*v1108
    Ms_zzzz      = v171 + M_z*v146 + M_zz*v56 + v172*v80
    Ms_xzzzz     = v280 + v281 + v282 + v1*v283 + v146*v15 + v56*v58
    Ms_yzzzz     = v308 + v309 + v310 + v146*v22 + v283*v3 + v56*v71
    Ms_xxzzzz    = v421 + v422 + v423 + M_xxzz*v56 + M_z*v419 + M_zzzz*v32 + v113*v56 + &
      v119*v407 + v146*v39 + v170*v32 + v172*v383 + v283*v6
    Ms_xyzzzz    = v456 + v457 + v458 + v459 + v13*v283 + v146*v278 + v276*z + v462*v56
    Ms_yyzzzz    = v489 + v490 + v491 + M_yyzz*v56 + M_z*v452 + M_zzzz*v43 + v146*v66 + &
      v157*v56 + v163*v407 + v170*v43 + v19*v283 + v306*v492
    Ms_xxxzzzz   = M_xxxzzzz + v607 + v608 + v609 + M_xxxzz*v56 + M_xzzzz*v32 + M_zzzz*v82 &
      + v146*v90 + v170*v82 + v172*v568 + v205*v56 + v210*v407 + v281* &
      v32 + v283*v29 + v378*v611 + v485*v610 + v492*v570 + v580*v77
    Ms_xxyzzzz   = M_xxyzzzz + v655 + v656 + v657 + v658 + v659 + v660 + M_xxyzz*v56 + &
      M_yzzzz*v32 + v146*v663 + v22*v419 + v232*v56 + v233*v56 + v235* &
      v56 + v239*v71 + v283*v37 + v3*v661 + v307*v32 + v309*v32 + v310* &
      v32 + v414*z
    Ms_xyyzzzz   = M_xyyzzzz + v700 + v701 + v702 + v703 + v704 + v705 + M_xyyzz*v56 + &
      M_xzzzz*v43 + v1*v706 + v146*v708 + v15*v452 + v263*v56 + v264* &
      v56 + v266*v56 + v269*v58 + v279*v43 + v281*v43 + v282*v43 + v283 &
      *v48 + v447*z
    Ms_yyyzzzz   = M_yyyzzzz + v742 + v743 + v744 + M_yyyz*v146 + M_yyyzz*v56 + M_yzzzz*v43 &
      + M_zzzz*v126 + v126*v170 + v146*v150 + v283*v63 + v291*v56 + &
      v296*v407 + v298*v745 + v309*v43 + v485*v747 + v487*v748 + v492* &
      v746
    Ms_xxxxzzzz  = M_xxxxzzzz + v835 + M_xxxxzzz*z + M_xxzz*v239 + M_xxzzzz*v32 + M_xz*v605 &
      + M_xzzzz*v82 + M_zzzz*v176 + v146*v184 + v170*v176 + v172*v809 + &
      v172*v812 + v27*v824 + v281*v82 + v283*v78 + v32*v422 + v347*v56 &
      + v377*v836 + v378*(v113 + v115) + v560*z + v639*v837 + v77*v819
    Ms_xxxyzzzz  = M_xxxyzzzz + v869 + v870 + v871 + M_xxxyzz*v56 + M_xxxyzzz*z + M_xyzzzz* &
      v32 + M_yzzzz*v82 + v146*v198 + v146*v199 + v146*v201 + v22*v605 &
      + v239*v460 + v283*v88 + v3*v872 + v307*v82 + v309*v82 + v310*v82 &
      + v32*v453 + v32*v457 + v32*v458 + v367*v56 + v370*v56 + v372*v56 &
      + v378*(v136 + v461) + v600*z + v601*z + v604*z + v661*v89 + v77* &
      v849
    Ms_xxyyzzzz  = M_xxyyzzzz + v898 + v899 + v900 + M_xxyyzz*v56 + M_xxyyzzz*z + M_xxzzzz* &
      v43 + M_yyzzzz*v32 + M_zzzz*v218 + v119*v411 + v146*(M_xxyyz + &
      v1133 + v225) + v170*v218 + v305*v906 + v32*v488 + v32*v490 + v32 &
      *v491 + v398*v56 + v399*v56 + v400*v56 + v402*v407 + v403*v407 + &
      v407*v901 + v407*v902 + v420*v43 + v422*v43 + v423*v43 + v492* &
      v654 + v642*z + v643*z + v646*z + v903*v904 + v907*(v219 + v226 + &
      v908 + v909)
    Ms_xyyyzzzz  = M_xyyyzzzz + v935 + v936 + v937 + M_xyyyz*v146 + M_xyyyzz*v56 + &
      M_xyyyzzz*z + M_xyzzzz*v43 + M_xzzzz*v126 + v1*v938 + v10*v706 + &
      v125*v283 + v126*v279 + v126*v281 + v126*v282 + v146*v254 + v146* &
      v255 + v146*v257 + v15*v696 + v269*v687 + v43*v454 + v43*v457 + &
      v43*v459 + v438*v56 + v441*v56 + v443*v56 + v487*(v137 + v140 + &
      v688) + v691*z + v692*z + v695*z
    Ms_yyyyzzzz  = M_yyyyzzzz + v960 + M_yyyy*v283 + M_yyyyz*v146 + M_yyyyzz*v56 + &
      M_yyyyzzz*z + M_yyzz*v269 + M_yyzzzz*v43 + M_yz*v696 + M_yzzzz* &
      v126 + M_zzzz*v250 + v126*v309 + v146*v288 + v147*v283 + v170* &
      v250 + v43*v490 + v477*v56 + v480*v961 + v486*v962 + v487*(v157 + &
      v159) + v597*v963 + v738*z
    Ms_xxxxxzzzz = M_xxxxxzzzz + M_xxxxxzzz*z + M_xxxxzzzz*x + M_xxxzz*v239 + M_xxxzzzz*v32 &
      + M_xxz*v605 + M_xxzzzz*v82 + M_xzzzz*v176 + M_zz*v801 + v1003* &
      v27 + v1008*v999 + v1010*v837 + v146*v324 + v171*v316 + v172*v988 &
      + v172*v991 + v173*v283 + v176*v281 + v32*v607 + v378*(v205 + &
      v207) + v422*v82 + v516*v961 + v528*v56 + v563*v836 + v77*v997 + &
      v804*z
    Ms_xxxxyzzzz = M_xxxxyzzzz + M_xxxxyzzz*z + M_xxxxzzzz*y + M_xxxyzzzz*x + M_xxyzzzz*v32 &
      + M_xyzzzz*v82 + M_yzzzz*v176 + v1011*v172 + v1020*v77 + v1022* &
      v27 + v146*v338 + v146*v340 + v146*v342 + v176*v307 + v176*v309 + &
      v176*v310 + v177*v283 + v179*v283 + v180*v283 + v202*v605 + v239* &
      v802 + v3*v81*v961 + v32*v655 + v32*v656 + v32*v658 + v378*(v231 &
      + v914) + v453*v82 + v457*v82 + v458*v82 + v552*v56 + v553*v56 + &
      v556*v56 + v606*v836 + v831*z + v832*z + v833*z + v835*y + v837*( &
      v27*v35 + v70*v8 + v888)
    Ms_xxxyyzzzz = M_xxxyyzzzz + M_x*v1052 + M_xxxyyzz*v56 + M_xxxyyzzz*z + M_xxxyzzzz*y + &
      M_xxxz*v452 + M_xxxzzzz*v43 + M_xxyyzzzz*x + M_xyyz*v419 + &
      M_xyyzz*v239 + M_xyyzzzz*v32 + M_xzzzz*v218 + M_yyzz*v373 + &
      M_yyzzzz*v82 + M_zzzz*v365 + v1041*v77 + v1048*v407 + v1051*v867 &
      + v1053*(v1004 + v1044 + v163*v31 + v190*v27 + v20*v594 + v590) + &
      v1103*v20*v866 + v130*v419 + v146*v359 + v146*v362 + v146*v364 + &
      v157*v373 + v170*v365 + v19*v872 + v210*v411 + v218*v281 + v239* &
      v263 + v32*v700 + v32*v701 + v32*v703 + v407*v591 + v43*v607 + &
      v43*v608 + v43*v609 + v452*v90 + v488*v82 + v490*v82 + v491*v82 + &
      v492*(v592 + v593 + v995) + v56*v585 + v56*v586 + v56*v589 + v605 &
      *v66 + v861*z + v862*z + v863*z + v870*y
    Ms_xxyyyzzzz = M_xxyyyzzzz + M_xxyyyz*v146 + M_xxyyyzz*v56 + M_xxyyyzzz*z + M_xxyyzzzz* &
      y + M_xxyz*v452 + M_xxyzz*v269 + M_xxyzzzz*v43 + M_xxzz*v444 + &
      M_xxzzzz*v126 + M_xyyyzzzz*x + M_y*v1052 + M_yyyz*v419 + &
      M_yyyzzzz*v32 + M_yzzzz*v218 + M_zzzz*v384 + v1029*v407 + v1051* &
      v896 + v1053*(v1024 + v1057 + v119*v64 + v20*v638 + v214*v27 + &
      v634) + v110*v452 + v1109*v8*v866 + v113*v444 + v126*v420 + v126* &
      v422 + v126*v423 + v146*v387 + v146*v390 + v146*v392 + v150*v419 &
      + v170*v384 + v218*v309 + v233*v269 + v238*v411 + v32*v742 + v32* &
      v743 + v32*v744 + v39*v696 + v407*v635 + v43*v655 + v43*v657 + &
      v43*v659 + v492*(v1018 + v636 + v637) + v56*v629 + v56*v630 + v56 &
      *v633 + v6*v938 + v892*z + v893*z + v894*z + v899*y
    Ms_xyyyyzzzz = M_xyyyyzzzz + M_xyyyy*v283 + M_xyyyyz*v146 + M_xyyyyzz*v56 + M_xyyyyzzz* &
      z + M_xyyyzzzz*y + M_xyyzzzz*v43 + M_xyzzzz*v126 + M_xzzzz*v250 + &
      M_yyyyzzzz*x + v1*v149*v961 + v126*v454 + v126*v457 + v126*v459 + &
      v146*v430 + v146*v432 + v146*v434 + v246*v283 + v248*v283 + v249* &
      v283 + v250*v279 + v250*v281 + v250*v282 + v258*v696 + v269*v928 &
      + v43*v700 + v43*v702 + v43*v704 + v487*(v929 + v943) + v56*v681 &
      + v56*v682 + v56*v685 + v699*v962 + v931*z + v932*z + v933*z + &
      v936*y + v963*(v20*v57 + v27*v44 + v828)
    Ms_yyyyyzzzz = 0.000347222222222222d0*(v172*v734) + M_yyyyy*v283 + M_yyyyyz*v146 + &
      M_yyyyyzz*v56 + M_yyyyyzzz*z + M_yyyyyzzzz + M_yyyyzzzz*y + &
      M_yyyzz*v269 + M_yyyzzzz*v43 + M_yyz*v696 + M_yyzzzz*v126 + &
      M_yzzzz*v250 + M_zz*v927 + v1026*v963 + v126*v490 + v146*v472 + &
      v171*v428 + v250*v309 + v283*v284 + v43*v742 + v487*(v291 + v293 &
      ) + v56*v731 + v735*v961 + v741*v962 + v957*z + v958*v999
    c5           = c2*c3
    v312         = c5
    v1110        = 0.00416666666666667d0*v312
    v467         = 0.00833333333333333d0*v312
    v752         = v1110
    v913         = v1110*v8
    v942         = v1110*v20
    v965         = v312*v64
    v1055        = 0.00138888888888889d0*v312
    Ms_zzzzz     = M_zzzzz + v311 + M_z*v283 + M_zz*v146 + M_zzz*v56 + v174*v312
    Ms_xzzzzz    = v464 + v465 + v466 + v1*v467 + v142*v56 + v146*v58 + v15*v283
    Ms_yzzzzz    = v494 + v495 + v496 + v146*v71 + v166*v56 + v22*v283 + v3*v467
    Ms_xxzzzzz   = M_xxzzzzz + v664 + v665 + v666 + M_xxzzz*v56 + M_zzzzz*v32 + v114*v146 + &
      v119*v305 + v240*v56 + v245*v407 + v283*v39 + v311*v32 + v312* &
      v615 + v467*v6 + v492*v652
    Ms_xyzzzzz   = v712 + v713 + v714 + v715 + v13*v467 + v146*v462 + v278*v283 + v455*z + &
      v56*v718
    Ms_yyzzzzz   = M_yyzzzzz + v749 + v750 + v751 + M_yyzzz*v56 + M_z*v706 + M_zzzzz*v43 + &
      v146*v158 + v163*v305 + v19*v467 + v283*v66 + v299*v56 + v304* &
      v407 + v306*v752 + v311*v43
    Ms_xxxzzzzz  = M_xxxzzzzz + v873 + M_xxxzzz*v56 + M_xxxzzzz*z + M_xzzz*v239 + M_xzzzzz* &
      v32 + M_zz*v605 + M_zzzzz*v82 + v146*v205 + v283*v91 + v29*v467 + &
      v311*v82 + v312*v842 + v32*v465 + v375*v56 + v378*(v141 + v143) + &
      v492*v868 + v570*v752 + v608*z + v610*v745 + v77*v854
    Ms_xxyzzzzz  = M_xxyzzzzz + v910 + v911 + v912 + M_xxyzzz*v56 + M_xxyzzzz*z + M_yzzzzz* &
      v32 + v146*v915 + v166*v239 + v22*v661 + v283*v663 + v3*v913 + &
      v32*v493 + v32*v495 + v32*v496 + v37*v467 + v412*v56 + v413*v56 + &
      v414*v56 + v419*v71 + v656*z + v657*z + v660*z
    Ms_xyyzzzzz  = M_xyyzzzzz + v939 + v940 + v941 + M_xyyzzz*v56 + M_xyyzzzz*z + M_xzzzzz* &
      v43 + v1*v942 + v142*v269 + v146*v944 + v15*v706 + v283*v708 + &
      v43*v463 + v43*v465 + v43*v466 + v445*v56 + v446*v56 + v447*v56 + &
      v452*v58 + v467*v48 + v701*z + v702*z + v705*z
    Ms_yyyzzzzz  = M_yyyzzzzz + v964 + M_yyyzz*v146 + M_yyyzzz*v56 + M_yyyzzzz*z + M_yz* &
      v706 + M_yzzz*v269 + M_yzzzzz*v43 + M_zz*v696 + M_zzzzz*v126 + &
      v126*v311 + v146*v291 + v151*v283 + v314*v965 + v43*v495 + v467* &
      v63 + v483*v56 + v487*(v165 + v167) + v743*z + v745*v747 + v746* &
      v752
    Ms_xxxxzzzzz = M_xxxxzzzzz + M_xxxxzzzz*z + M_xxxzzzzz*x + M_xxzzz*v239 + M_xxzzzzz*v32 &
      + M_xzz*v605 + M_xzzzzz*v82 + M_zzzzz*v176 + v1014*v312 + v1015* &
      v312 + v1016*v752 + v1021*v172 + v1023*v77 + v1030*v27 + v1035* &
      v81 + v1036*v837 + v146*v347 + v176*v311 + v184*v283 + v32*v664 + &
      v378*(v240 + v242) + v465*v82 + v467*v79 + v56*v560 + v611*v836 + &
      v835*z
    Ms_xxxyzzzzz = M_xxxyzzzzz + M_xxxyzzz*v56 + M_xxxyzzzz*z + M_xxxzzzzz*y + M_xxyzzzzz*x &
      + M_xyzzzzz*v32 + M_yzzzzz*v82 + v1042*v3*v312 + v1043*v77 + v146 &
      *v367 + v146*v370 + v146*v372 + v202*v661 + v22*v872 + v239*v716 &
      + v283*(v1009 + v525) + v32*v709 + v32*v713 + v32*v714 + v378*( &
      v272 + v717) + v467*v88 + v493*v82 + v495*v82 + v496*v82 + v56* &
      v600 + v56*v601 + v56*v604 + v605*v71 + v869*z + v870*z + v871*z &
      + v873*y + v89*v913
    Ms_xxyyzzzzz = 0.00208333333333333d0*(v312*v904) + M_xxyyzzz*v56 + M_xxyyzzzz*z + &
      M_xxyyzzzzz + M_xxyzzzzz*y + M_xxzzzzz*v43 + M_xyyzzzzz*x + &
      M_yyzzzzz*v32 + M_zzzzz*v218 + v101*v467 + v1034*v407 + v1058* &
      v407 + v146*(v1007 + v1132) + v218*v311 + v245*v411 + v305*(v402 &
      + v403 + v901 + v902) + v32*v749 + v32*v750 + v32*v751 + v407* &
      v647 + v407*v648 + v43*v664 + v43*v665 + v43*v666 + v492*v906 + &
      v56*v642 + v56*v643 + v56*v646 + v654*v752 + v898*z + v899*z + &
      v900*z + v903*v909 + v907*(v397 + v406) + v911*y
    Ms_xyyyzzzzz = M_xyyyzzzzz + M_xyyyzz*v146 + M_xyyyzzz*v56 + M_xyyyzzzz*z + M_xyyzzzzz* &
      y + M_xyzzzzz*v43 + M_xzzzzz*v126 + M_yyyzzzzz*x + v10*v942 + &
      v1061*v965 + v1062*v269 + v125*v467 + v126*v463 + v126*v465 + &
      v126*v466 + v146*v438 + v146*v441 + v146*v443 + v15*v938 + v258* &
      v706 + v283*(v1064 + v678) + v43*v710 + v43*v713 + v43*v715 + &
      v487*(v1063 + v273 + v276) + v56*v691 + v56*v692 + v56*v695 + v58 &
      *v696 + v935*z + v936*z + v937*z + v940*y
    Ms_yyyyzzzzz = 0.000347222222222222d0*(v312*v480) + M_yy*v942 + M_yyyyz*v283 + M_yyyyzz &
      *v146 + M_yyyyzzz*v56 + M_yyyyzzzz*z + M_yyyyzzzzz + M_yyyzzzzz*y &
      + M_yyzzz*v269 + M_yyzzzzz*v43 + M_yzz*v696 + M_yzzzzz*v126 + &
      M_zzzzz*v250 + v1032*v963 + v1035*v149 + v126*v495 + v146*v477 + &
      v148*v467 + v250*v311 + v283*v288 + v43*v749 + v487*(v299 + v301 &
      ) + v56*v738 + v748*v962 + v960*z + v965*v993
    c6           = c3*c3
    v498         = c6
    v1123        = 0.000694444444444444d0*v498
    v723         = 0.00138888888888889d0*v498
    v967         = v1123
    v1065        = v1123*v20
    Ms_zzzzzz    = M_zzzzzz + v497 + M_z*v467 + M_zz*v283 + M_zzz*v146 + M_zzzz*v56 + v314* &
      v498
    Ms_xzzzzzz   = v720 + v721 + v722 + v1*v723 + v142*v146 + v15*v467 + v280*v56 + v283* &
      v58
    Ms_yzzzzzz   = v754 + v755 + v756 + v146*v166 + v22*v467 + v283*v71 + v3*v723 + v308* &
      v56
    Ms_xxzzzzzz  = M_xxzzzzzz + v916 + M_xxzzzz*v56 + M_xxzzzzz*z + M_zzzz*v239 + M_zzzzzz* &
      v32 + v114*v283 + v119*v492 + v146*v241 + v245*v305 + v32*v497 + &
      v39*v467 + v420*v56 + v498*v877 + v6*v723 + v652*v752 + v665*z
    Ms_xyzzzzzz  = M_xyzzzzzz + v945 + v946 + v947 + M_xyzzzzz*z + v13*v723 + v146*v718 + &
      v278*v467 + v283*v462 + v456*v56 + v709*z + v710*z + v711*z
    Ms_yyzzzzzz  = M_yyzzzzzz + v966 + M_yyzzzz*v56 + M_yyzzzzz*z + M_z*v942 + M_zzzz*v269 &
      + M_zzzzzz*v43 + v146*v300 + v158*v283 + v163*v492 + v19*v723 + &
      v304*v305 + v306*v967 + v43*v497 + v467*v66 + v488*v56 + v750*z
    Ms_xxxzzzzzz = M_xxxzzzzzz + M_xxxzzzz*v56 + M_xxxzzzzz*z + M_xxzzzzzz*x + M_xzzzz*v239 &
      + M_xzzzzzz*v32 + M_zzz*v605 + M_zzzzzz*v82 + v1038*v498 + v1049* &
      v77 + v1054*v31 + v1055*(v610 + v94) + v146*v375 + v206*v283 + &
      v210*v492 + v32*v721 + v378*(v279 + v281) + v467*v91 + v497*v82 + &
      v56*v608 + v570*v967 + v752*v868 + v873*z
    Ms_xxyzzzzzz = M_xxyzzzzzz + M_xxyzzzz*v56 + M_xxyzzzzz*z + M_xxzzzzzz*y + M_xyzzzzzz*x &
      + M_yzzzzzz*v32 + v146*v415 + v166*v419 + v22*v913 + v239*v308 + &
      v283*v915 + v3*v8*v967 + v32*v753 + v32*v755 + v32*v756 + v37* &
      v723 + v467*v663 + v56*v656 + v56*v657 + v56*v660 + v661*v71 + &
      v910*z + v911*z + v912*z + v916*y
    Ms_xyyzzzzzz = M_xyyzzzzzz + M_xyyzzzz*v56 + M_xyyzzzzz*z + M_xyzzzzzz*y + M_xzzzzzz* &
      v43 + M_yyzzzzzz*x + v1*v1065 + v142*v452 + v146*v448 + v15*v942 &
      + v269*v280 + v283*v944 + v43*v719 + v43*v721 + v43*v722 + v467* &
      v708 + v48*v723 + v56*v701 + v56*v702 + v56*v705 + v58*v706 + &
      v939*z + v940*z + v941*z + v946*y
    Ms_yyyzzzzzz = 0.000231481481481481d0*(v298*v498) + M_yyyzzz*v146 + M_yyyzzzz*v56 + &
      M_yyyzzzzz*z + M_yyyzzzzzz + M_yyzzzzzz*y + M_yz*v942 + M_yzzzz* &
      v269 + M_yzzzzzz*v43 + M_zzz*v696 + M_zzzzzz*v126 + v1054*v64 + &
      v1055*(v154 + v747) + v126*v497 + v146*v483 + v151*v467 + v283* &
      v292 + v296*v492 + v43*v755 + v487*(v307 + v309) + v56*v743 + &
      v746*v967 + v964*z
    c7           = c3*c4
    v758         = c7
    v949         = 0.000198412698412698d0*v758
    Ms_zzzzzzz   = M_zzzzzzz + v757 + M_z*v723 + M_zz*v467 + M_zzz*v283 + M_zzzz*v146 + &
      M_zzzzz*v56 + v500*v758
    Ms_xzzzzzzz  = M_xzzzzzzz + v948 + M_xzzzzzz*z + v1*v949 + v142*v283 + v146*v280 + v15* &
      v723 + v464*v56 + v467*v58 + v719*z
    Ms_yzzzzzzz  = M_yzzzzzzz + v968 + M_yzzzzzz*z + v146*v308 + v166*v283 + v22*v723 + v3* &
      v949 + v467*v71 + v494*v56 + v753*z
    Ms_xxzzzzzzz = M_xxzzzzzzz + M_xxzzzzz*v56 + M_xxzzzzzz*z + M_xzzzzzzz*x + M_zzzz*v419 &
      + M_zzzzz*v239 + M_zzzzzzz*v32 + v1056*v758 + v114*v467 + v119* &
      v752 + v146*v421 + v241*v283 + v245*v492 + v32*v757 + v39*v723 + &
      v56*v665 + v6*v949 + v652*v967 + v916*z
    Ms_xyzzzzzzz = M_xyzzzzzzz + M_xyzzzzzz*z + M_xzzzzzzz*y + M_yzzzzzzz*x + v13*v949 + &
      v146*v456 + v278*v723 + v283*v718 + v462*v467 + v56*v712 + v945*z &
      + v946*z + v947*z + v948*y
    Ms_yyzzzzzzz = 9.92063492063492d-5*(v306*v758) + M_yyzzzzz*v56 + M_yyzzzzzz*z + &
      M_yyzzzzzzz + M_yzzzzzzz*y + M_z*v1065 + M_zzzz*v452 + M_zzzzz* &
      v269 + M_zzzzzzz*v43 + v146*v489 + v158*v467 + v163*v752 + v19* &
      v949 + v283*v300 + v304*v492 + v43*v757 + v56*v750 + v66*v723 + &
      v966*z
    c8           = c4*c4
    v969         = c8
    v1066        = 2.48015873015873d-5*v969
    Ms_zzzzzzzz  = M_zzzzzzzz + M_z*v949 + M_zz*v723 + M_zzz*v467 + M_zzzz*v283 + M_zzzzz* &
      v146 + M_zzzzzz*v56 + M_zzzzzzz*z + v760*v969
    Ms_xzzzzzzzz = M_xzzzzzzzz + M_xzzzzzzz*z + M_zzzzzzzz*x + v1*v1066 + v142*v467 + v146* &
      v464 + v15*v949 + v280*v283 + v56*v720 + v58*v723 + v948*z
    Ms_yzzzzzzzz = M_yzzzzzzzz + M_yzzzzzzz*z + M_zzzzzzzz*y + v1066*v3 + v146*v494 + v166* &
      v467 + v22*v949 + v283*v308 + v56*v754 + v71*v723 + v968*z
    c9           = c4*c5
    Ms_zzzzzzzzz = M_zzzzzzzzz + M_z*v1066 + M_zz*v949 + M_zzz*v723 + M_zzzz*v467 + M_zzzzz &
      *v283 + M_zzzzzz*v146 + M_zzzzzzz*v56 + M_zzzzzzzz*z + c9*v970
#undef  y                   
#undef  z                   
#undef  M_0                 
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
#undef  Ms_zz               
#undef  M_zz                
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
#undef  M_yyy               
#undef  Ms_yyy              
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
#undef  M_xxxz              
#undef  Ms_xxxz             
#undef  M_xxyy              
#undef  Ms_xxyy             
#undef  Ms_xxyz             
#undef  M_xxyz              
#undef  M_xxzz              
#undef  Ms_xxzz             
#undef  Ms_xyyy             
#undef  M_xyyy              
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  Ms_xyzz             
#undef  M_xyzz              
#undef  Ms_xzzz             
#undef  M_xzzz              
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  Ms_yyzz             
#undef  M_yyzz              
#undef  Ms_yzzz             
#undef  M_yzzz              
#undef  M_zzzz              
#undef  Ms_zzzz             
#undef  M_xxxxx             
#undef  Ms_xxxxx            
#undef  Ms_xxxxy            
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  Ms_xxxxz            
#undef  M_xxxyy             
#undef  Ms_xxxyy            
#undef  Ms_xxxyz            
#undef  M_xxxyz             
#undef  Ms_xxxzz            
#undef  M_xxxzz             
#undef  Ms_xxyyy            
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  Ms_xxyyz            
#undef  Ms_xxyzz            
#undef  M_xxyzz             
#undef  M_xxzzz             
#undef  Ms_xxzzz            
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  Ms_xyyzz            
#undef  M_xyyzz             
#undef  M_xyzzz             
#undef  Ms_xyzzz            
#undef  M_xzzzz             
#undef  Ms_xzzzz            
#undef  Ms_yyyyy            
#undef  M_yyyyy             
#undef  Ms_yyyyz            
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  Ms_yyyzz            
#undef  Ms_yyzzz            
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  Ms_yzzzz            
#undef  M_zzzzz             
#undef  Ms_zzzzz            
#undef  M_xxxxxx            
#undef  Ms_xxxxxx           
#undef  Ms_xxxxxy           
#undef  M_xxxxxy            
#undef  Ms_xxxxxz           
#undef  M_xxxxxz            
#undef  Ms_xxxxyy           
#undef  M_xxxxyy            
#undef  M_xxxxyz            
#undef  Ms_xxxxyz           
#undef  Ms_xxxxzz           
#undef  M_xxxxzz            
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
#undef  M_xxyyyz            
#undef  Ms_xxyyyz           
#undef  M_xxyyzz            
#undef  Ms_xxyyzz           
#undef  M_xxyzzz            
#undef  Ms_xxyzzz           
#undef  M_xxzzzz            
#undef  Ms_xxzzzz           
#undef  M_xyyyyy            
#undef  Ms_xyyyyy           
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  Ms_xyyyzz           
#undef  M_xyyyzz            
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
#undef  M_yyyyzz            
#undef  Ms_yyyyzz           
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
#undef  M_xxxxxxy           
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxz           
#undef  Ms_xxxxxxz          
#undef  Ms_xxxxxyy          
#undef  M_xxxxxyy           
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
#undef  Ms_xxxxzzz          
#undef  M_xxxxzzz           
#undef  Ms_xxxyyyy          
#undef  M_xxxyyyy           
#undef  Ms_xxxyyyz          
#undef  M_xxxyyyz           
#undef  Ms_xxxyyzz          
#undef  M_xxxyyzz           
#undef  Ms_xxxyzzz          
#undef  M_xxxyzzz           
#undef  Ms_xxxzzzz          
#undef  M_xxxzzzz           
#undef  Ms_xxyyyyy          
#undef  M_xxyyyyy           
#undef  Ms_xxyyyyz          
#undef  M_xxyyyyz           
#undef  M_xxyyyzz           
#undef  Ms_xxyyyzz          
#undef  Ms_xxyyzzz          
#undef  M_xxyyzzz           
#undef  Ms_xxyzzzz          
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  Ms_xxzzzzz          
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyz          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyzz          
#undef  M_xyyyyzz           
#undef  Ms_xyyyzzz          
#undef  M_xyyyzzz           
#undef  Ms_xyyzzzz          
#undef  M_xyyzzzz           
#undef  Ms_xyzzzzz          
#undef  M_xyzzzzz           
#undef  Ms_xzzzzzz          
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  Ms_yyyyyyy          
#undef  M_yyyyyyz           
#undef  Ms_yyyyyyz          
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
#undef  M_zzzzzzz           
#undef  Ms_zzzzzzz          
#undef  M_xxxxxxxx          
#undef  Ms_xxxxxxxx         
#undef  M_xxxxxxxy          
#undef  Ms_xxxxxxxy         
#undef  Ms_xxxxxxxz         
#undef  M_xxxxxxxz          
#undef  Ms_xxxxxxyy         
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  Ms_xxxxxxyz         
#undef  Ms_xxxxxxzz         
#undef  M_xxxxxxzz          
#undef  M_xxxxxyyy          
#undef  Ms_xxxxxyyy         
#undef  Ms_xxxxxyyz         
#undef  M_xxxxxyyz          
#undef  M_xxxxxyzz          
#undef  Ms_xxxxxyzz         
#undef  Ms_xxxxxzzz         
#undef  M_xxxxxzzz          
#undef  M_xxxxyyyy          
#undef  Ms_xxxxyyyy         
#undef  M_xxxxyyyz          
#undef  Ms_xxxxyyyz         
#undef  M_xxxxyyzz          
#undef  Ms_xxxxyyzz         
#undef  Ms_xxxxyzzz         
#undef  M_xxxxyzzz          
#undef  M_xxxxzzzz          
#undef  Ms_xxxxzzzz         
#undef  M_xxxyyyyy          
#undef  Ms_xxxyyyyy         
#undef  M_xxxyyyyz          
#undef  Ms_xxxyyyyz         
#undef  Ms_xxxyyyzz         
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  Ms_xxxyyzzz         
#undef  M_xxxyzzzz          
#undef  Ms_xxxyzzzz         
#undef  Ms_xxxzzzzz         
#undef  M_xxxzzzzz          
#undef  M_xxyyyyyy          
#undef  Ms_xxyyyyyy         
#undef  M_xxyyyyyz          
#undef  Ms_xxyyyyyz         
#undef  M_xxyyyyzz          
#undef  Ms_xxyyyyzz         
#undef  Ms_xxyyyzzz         
#undef  M_xxyyyzzz          
#undef  Ms_xxyyzzzz         
#undef  M_xxyyzzzz          
#undef  Ms_xxyzzzzz         
#undef  M_xxyzzzzz          
#undef  M_xxzzzzzz          
#undef  Ms_xxzzzzzz         
#undef  Ms_xyyyyyyy         
#undef  M_xyyyyyyy          
#undef  Ms_xyyyyyyz         
#undef  M_xyyyyyyz          
#undef  M_xyyyyyzz          
#undef  Ms_xyyyyyzz         
#undef  M_xyyyyzzz          
#undef  Ms_xyyyyzzz         
#undef  M_xyyyzzzz          
#undef  Ms_xyyyzzzz         
#undef  M_xyyzzzzz          
#undef  Ms_xyyzzzzz         
#undef  M_xyzzzzzz          
#undef  Ms_xyzzzzzz         
#undef  M_xzzzzzzz          
#undef  Ms_xzzzzzzz         
#undef  Ms_yyyyyyyy         
#undef  M_yyyyyyyy          
#undef  Ms_yyyyyyyz         
#undef  M_yyyyyyyz          
#undef  Ms_yyyyyyzz         
#undef  M_yyyyyyzz          
#undef  Ms_yyyyyzzz         
#undef  M_yyyyyzzz          
#undef  M_yyyyzzzz          
#undef  Ms_yyyyzzzz         
#undef  M_yyyzzzzz          
#undef  Ms_yyyzzzzz         
#undef  Ms_yyzzzzzz         
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  Ms_yzzzzzzz         
#undef  Ms_zzzzzzzz         
#undef  M_zzzzzzzz          
#undef  Ms_xxxxxxxxx        
#undef  M_xxxxxxxxx         
#undef  M_xxxxxxxxy         
#undef  Ms_xxxxxxxxy        
#undef  Ms_xxxxxxxxz        
#undef  M_xxxxxxxxz         
#undef  Ms_xxxxxxxyy        
#undef  M_xxxxxxxyy         
#undef  M_xxxxxxxyz         
#undef  Ms_xxxxxxxyz        
#undef  Ms_xxxxxxxzz        
#undef  M_xxxxxxxzz         
#undef  M_xxxxxxyyy         
#undef  Ms_xxxxxxyyy        
#undef  Ms_xxxxxxyyz        
#undef  M_xxxxxxyyz         
#undef  Ms_xxxxxxyzz        
#undef  M_xxxxxxyzz         
#undef  Ms_xxxxxxzzz        
#undef  M_xxxxxxzzz         
#undef  M_xxxxxyyyy         
#undef  Ms_xxxxxyyyy        
#undef  M_xxxxxyyyz         
#undef  Ms_xxxxxyyyz        
#undef  M_xxxxxyyzz         
#undef  Ms_xxxxxyyzz        
#undef  M_xxxxxyzzz         
#undef  Ms_xxxxxyzzz        
#undef  M_xxxxxzzzz         
#undef  Ms_xxxxxzzzz        
#undef  M_xxxxyyyyy         
#undef  Ms_xxxxyyyyy        
#undef  Ms_xxxxyyyyz        
#undef  M_xxxxyyyyz         
#undef  Ms_xxxxyyyzz        
#undef  M_xxxxyyyzz         
#undef  M_xxxxyyzzz         
#undef  Ms_xxxxyyzzz        
#undef  M_xxxxyzzzz         
#undef  Ms_xxxxyzzzz        
#undef  Ms_xxxxzzzzz        
#undef  M_xxxxzzzzz         
#undef  M_xxxyyyyyy         
#undef  Ms_xxxyyyyyy        
#undef  M_xxxyyyyyz         
#undef  Ms_xxxyyyyyz        
#undef  M_xxxyyyyzz         
#undef  Ms_xxxyyyyzz        
#undef  M_xxxyyyzzz         
#undef  Ms_xxxyyyzzz        
#undef  Ms_xxxyyzzzz        
#undef  M_xxxyyzzzz         
#undef  Ms_xxxyzzzzz        
#undef  M_xxxyzzzzz         
#undef  Ms_xxxzzzzzz        
#undef  M_xxxzzzzzz         
#undef  M_xxyyyyyyy         
#undef  Ms_xxyyyyyyy        
#undef  Ms_xxyyyyyyz        
#undef  M_xxyyyyyyz         
#undef  Ms_xxyyyyyzz        
#undef  M_xxyyyyyzz         
#undef  M_xxyyyyzzz         
#undef  Ms_xxyyyyzzz        
#undef  M_xxyyyzzzz         
#undef  Ms_xxyyyzzzz        
#undef  M_xxyyzzzzz         
#undef  Ms_xxyyzzzzz        
#undef  Ms_xxyzzzzzz        
#undef  M_xxyzzzzzz         
#undef  Ms_xxzzzzzzz        
#undef  M_xxzzzzzzz         
#undef  M_xyyyyyyyy         
#undef  Ms_xyyyyyyyy        
#undef  Ms_xyyyyyyyz        
#undef  M_xyyyyyyyz         
#undef  Ms_xyyyyyyzz        
#undef  M_xyyyyyyzz         
#undef  Ms_xyyyyyzzz        
#undef  M_xyyyyyzzz         
#undef  Ms_xyyyyzzzz        
#undef  M_xyyyyzzzz         
#undef  M_xyyyzzzzz         
#undef  Ms_xyyyzzzzz        
#undef  M_xyyzzzzzz         
#undef  Ms_xyyzzzzzz        
#undef  Ms_xyzzzzzzz        
#undef  M_xyzzzzzzz         
#undef  M_xzzzzzzzz         
#undef  Ms_xzzzzzzzz        
#undef  Ms_yyyyyyyyy        
#undef  M_yyyyyyyyy         
#undef  M_yyyyyyyyz         
#undef  Ms_yyyyyyyyz        
#undef  M_yyyyyyyzz         
#undef  Ms_yyyyyyyzz        
#undef  Ms_yyyyyyzzz        
#undef  M_yyyyyyzzz         
#undef  M_yyyyyzzzz         
#undef  Ms_yyyyyzzzz        
#undef  M_yyyyzzzzz         
#undef  Ms_yyyyzzzzz        
#undef  M_yyyzzzzzz         
#undef  Ms_yyyzzzzzz        
#undef  M_yyzzzzzzz         
#undef  Ms_yyzzzzzzz        
#undef  Ms_yzzzzzzzz        
#undef  M_yzzzzzzzz         
#undef  Ms_zzzzzzzzz        
#undef  M_zzzzzzzzz         
    end subroutine mom_es_M2M
    
! OPS  3371*ADD + 2*DIV + 3770*MUL + 169*NEG + POW + 84*SUB = 7397  (9601 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v207, v208, v209, v21, v22, v23, v24, v25, v26, v27, v28, v29,&
                v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
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
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx, D_xxxxxxxy,&
                D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz, D_xxxxxyyy,&
                D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy, D_xxxxyyyz,&
                D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy, D_xxxyyyyz,&
                D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz, D_xxyyyyyy,&
                D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz, D_xxyzzzzz,&
                D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz, D_xyyyyzzz,&
                D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz, D_yyyyyyyy,&
                D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz, D_yyyzzzzz,&
                D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, D_xxxxxxxxx, D_xxxxxxxxy,&
                D_xxxxxxxxz, D_xxxxxxxyy, D_xxxxxxxyz, D_xxxxxxxzz,&
                D_xxxxxxyyy, D_xxxxxxyyz, D_xxxxxxyzz, D_xxxxxxzzz,&
                D_xxxxxyyyy, D_xxxxxyyyz, D_xxxxxyyzz, D_xxxxxyzzz,&
                D_xxxxxzzzz, D_xxxxyyyyy, D_xxxxyyyyz, D_xxxxyyyzz,&
                D_xxxxyyzzz, D_xxxxyzzzz, D_xxxxzzzzz, D_xxxyyyyyy,&
                D_xxxyyyyyz, D_xxxyyyyzz, D_xxxyyyzzz, D_xxxyyzzzz,&
                D_xxxyzzzzz, D_xxxzzzzzz, D_xxyyyyyyy, D_xxyyyyyyz,&
                D_xxyyyyyzz, D_xxyyyyzzz, D_xxyyyzzzz, D_xxyyzzzzz,&
                D_xxyzzzzzz, D_xxzzzzzzz, D_xyyyyyyyy, D_xyyyyyyyz,&
                D_xyyyyyyzz, D_xyyyyyzzz, D_xyyyyzzzz, D_xyyyzzzzz,&
                D_xyyzzzzzz, D_xyzzzzzzz, D_xzzzzzzzz, D_yyyyyyyyy,&
                D_yyyyyyyyz, D_yyyyyyyzz, D_yyyyyyzzz, D_yyyyyzzzz,&
                D_yyyyzzzzz, D_yyyzzzzzz, D_yyzzzzzzz, D_yzzzzzzzz,&
                D_zzzzzzzzz
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
#define L_xx                 L(4)
#define M_xx                 M(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define L_xz                 L(6)
#define M_xz                 M(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define L_yz                 L(8)
#define M_yz                 M(8)
#define M_zz                 M(9)
#define L_xxx                L(9)
#define M_xxx                M(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define M_xxy                M(11)
#define M_xxz                M(12)
#define L_xyy                L(12)
#define M_xyy                M(13)
#define L_xyz                L(13)
#define M_xyz                M(14)
#define L_yyy                L(14)
#define L_yyz                L(15)
#define M_xzz                M(15)
#define M_yyy                M(16)
#define L_xxxx               L(16)
#define M_yyz                M(17)
#define L_xxxy               L(17)
#define M_yzz                M(18)
#define L_xxxz               L(18)
#define L_xxyy               L(19)
#define M_zzz                M(19)
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
#define L_xxxxx              L(25)
#define L_xxxxy              L(26)
#define M_xyyy               M(26)
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
#define L_xyyyz              L(33)
#define M_yzzz               M(33)
#define L_yyyyy              L(34)
#define M_zzzz               M(34)
#define L_yyyyz              L(35)
#define M_xxxxx              M(35)
#define L_xxxxxx             L(36)
#define M_xxxxy              M(36)
#define L_xxxxxy             L(37)
#define M_xxxxz              M(37)
#define L_xxxxxz             L(38)
#define M_xxxyy              M(38)
#define L_xxxxyy             L(39)
#define M_xxxyz              M(39)
#define L_xxxxyz             L(40)
#define M_xxxzz              M(40)
#define L_xxxyyy             L(41)
#define M_xxyyy              M(41)
#define L_xxxyyz             L(42)
#define M_xxyyz              M(42)
#define M_xxyzz              M(43)
#define L_xxyyyy             L(43)
#define M_xxzzz              M(44)
#define L_xxyyyz             L(44)
#define M_xyyyy              M(45)
#define L_xyyyyy             L(45)
#define M_xyyyz              M(46)
#define L_xyyyyz             L(46)
#define M_xyyzz              M(47)
#define L_yyyyyy             L(47)
#define L_yyyyyz             L(48)
#define M_xyzzz              M(48)
#define M_xzzzz              M(49)
#define L_xxxxxxx            L(49)
#define L_xxxxxxy            L(50)
#define M_yyyyy              M(50)
#define L_xxxxxxz            L(51)
#define M_yyyyz              M(51)
#define M_yyyzz              M(52)
#define L_xxxxxyy            L(52)
#define L_xxxxxyz            L(53)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define L_xxxxyyy            L(54)
#define M_zzzzz              M(55)
#define L_xxxxyyz            L(55)
#define M_xxxxxx             M(56)
#define L_xxxyyyy            L(56)
#define L_xxxyyyz            L(57)
#define M_xxxxxy             M(57)
#define M_xxxxxz             M(58)
#define L_xxyyyyy            L(58)
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
#define L_xxxxxxxx           L(64)
#define M_xxxyzz             M(64)
#define M_xxxzzz             M(65)
#define L_xxxxxxxy           L(65)
#define L_xxxxxxxz           L(66)
#define M_xxyyyy             M(66)
#define L_xxxxxxyy           L(67)
#define M_xxyyyz             M(67)
#define M_xxyyzz             M(68)
#define L_xxxxxxyz           L(68)
#define M_xxyzzz             M(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define M_xxzzzz             M(70)
#define L_xxxxyyyy           L(71)
#define M_xyyyyy             M(71)
#define L_xxxxyyyz           L(72)
#define M_xyyyyz             M(72)
#define M_xyyyzz             M(73)
#define L_xxxyyyyy           L(73)
#define M_xyyzzz             M(74)
#define L_xxxyyyyz           L(74)
#define L_xxyyyyyy           L(75)
#define M_xyzzzz             M(75)
#define M_xzzzzz             M(76)
#define L_xxyyyyyz           L(76)
#define M_yyyyyy             M(77)
#define L_xyyyyyyy           L(77)
#define M_yyyyyz             M(78)
#define L_xyyyyyyz           L(78)
#define L_yyyyyyyy           L(79)
#define M_yyyyzz             M(79)
#define L_yyyyyyyz           L(80)
#define M_yyyzzz             M(80)
#define L_xxxxxxxxx          L(81)
#define M_yyzzzz             M(81)
#define M_yzzzzz             M(82)
#define L_xxxxxxxxy          L(82)
#define L_xxxxxxxxz          L(83)
#define M_zzzzzz             M(83)
#define L_xxxxxxxyy          L(84)
#define M_xxxxxxx            M(84)
#define L_xxxxxxxyz          L(85)
#define M_xxxxxxy            M(85)
#define M_xxxxxxz            M(86)
#define L_xxxxxxyyy          L(86)
#define L_xxxxxxyyz          L(87)
#define M_xxxxxyy            M(87)
#define M_xxxxxyz            M(88)
#define L_xxxxxyyyy          L(88)
#define M_xxxxxzz            M(89)
#define L_xxxxxyyyz          L(89)
#define M_xxxxyyy            M(90)
#define L_xxxxyyyyy          L(90)
#define L_xxxxyyyyz          L(91)
#define M_xxxxyyz            M(91)
#define M_xxxxyzz            M(92)
#define L_xxxyyyyyy          L(92)
#define M_xxxxzzz            M(93)
#define L_xxxyyyyyz          L(93)
#define L_xxyyyyyyy          L(94)
#define M_xxxyyyy            M(94)
#define M_xxxyyyz            M(95)
#define L_xxyyyyyyz          L(95)
#define L_xyyyyyyyy          L(96)
#define M_xxxyyzz            M(96)
#define M_xxxyzzz            M(97)
#define L_xyyyyyyyz          L(97)
#define M_xxxzzzz            M(98)
#define L_yyyyyyyyy          L(98)
#define L_yyyyyyyyz          L(99)
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
#define M_xxxxxxxx           M(120)
#define M_xxxxxxxy           M(121)
#define M_xxxxxxxz           M(122)
#define M_xxxxxxyy           M(123)
#define M_xxxxxxyz           M(124)
#define M_xxxxxxzz           M(125)
#define M_xxxxxyyy           M(126)
#define M_xxxxxyyz           M(127)
#define M_xxxxxyzz           M(128)
#define M_xxxxxzzz           M(129)
#define M_xxxxyyyy           M(130)
#define M_xxxxyyyz           M(131)
#define M_xxxxyyzz           M(132)
#define M_xxxxyzzz           M(133)
#define M_xxxxzzzz           M(134)
#define M_xxxyyyyy           M(135)
#define M_xxxyyyyz           M(136)
#define M_xxxyyyzz           M(137)
#define M_xxxyyzzz           M(138)
#define M_xxxyzzzz           M(139)
#define M_xxxzzzzz           M(140)
#define M_xxyyyyyy           M(141)
#define M_xxyyyyyz           M(142)
#define M_xxyyyyzz           M(143)
#define M_xxyyyzzz           M(144)
#define M_xxyyzzzz           M(145)
#define M_xxyzzzzz           M(146)
#define M_xxzzzzzz           M(147)
#define M_xyyyyyyy           M(148)
#define M_xyyyyyyz           M(149)
#define M_xyyyyyzz           M(150)
#define M_xyyyyzzz           M(151)
#define M_xyyyzzzz           M(152)
#define M_xyyzzzzz           M(153)
#define M_xyzzzzzz           M(154)
#define M_xzzzzzzz           M(155)
#define M_yyyyyyyy           M(156)
#define M_yyyyyyyz           M(157)
#define M_yyyyyyzz           M(158)
#define M_yyyyyzzz           M(159)
#define M_yyyyzzzz           M(160)
#define M_yyyzzzzz           M(161)
#define M_yyzzzzzz           M(162)
#define M_yzzzzzzz           M(163)
#define M_zzzzzzzz           M(164)
#define M_xxxxxxxxx          M(165)
#define M_xxxxxxxxy          M(166)
#define M_xxxxxxxxz          M(167)
#define M_xxxxxxxyy          M(168)
#define M_xxxxxxxyz          M(169)
#define M_xxxxxxxzz          M(170)
#define M_xxxxxxyyy          M(171)
#define M_xxxxxxyyz          M(172)
#define M_xxxxxxyzz          M(173)
#define M_xxxxxxzzz          M(174)
#define M_xxxxxyyyy          M(175)
#define M_xxxxxyyyz          M(176)
#define M_xxxxxyyzz          M(177)
#define M_xxxxxyzzz          M(178)
#define M_xxxxxzzzz          M(179)
#define M_xxxxyyyyy          M(180)
#define M_xxxxyyyyz          M(181)
#define M_xxxxyyyzz          M(182)
#define M_xxxxyyzzz          M(183)
#define M_xxxxyzzzz          M(184)
#define M_xxxxzzzzz          M(185)
#define M_xxxyyyyyy          M(186)
#define M_xxxyyyyyz          M(187)
#define M_xxxyyyyzz          M(188)
#define M_xxxyyyzzz          M(189)
#define M_xxxyyzzzz          M(190)
#define M_xxxyzzzzz          M(191)
#define M_xxxzzzzzz          M(192)
#define M_xxyyyyyyy          M(193)
#define M_xxyyyyyyz          M(194)
#define M_xxyyyyyzz          M(195)
#define M_xxyyyyzzz          M(196)
#define M_xxyyyzzzz          M(197)
#define M_xxyyzzzzz          M(198)
#define M_xxyzzzzzz          M(199)
#define M_xxzzzzzzz          M(200)
#define M_xyyyyyyyy          M(201)
#define M_xyyyyyyyz          M(202)
#define M_xyyyyyyzz          M(203)
#define M_xyyyyyzzz          M(204)
#define M_xyyyyzzzz          M(205)
#define M_xyyyzzzzz          M(206)
#define M_xyyzzzzzz          M(207)
#define M_xyzzzzzzz          M(208)
#define M_xzzzzzzzz          M(209)
#define M_yyyyyyyyy          M(210)
#define M_yyyyyyyyz          M(211)
#define M_yyyyyyyzz          M(212)
#define M_yyyyyyzzz          M(213)
#define M_yyyyyzzzz          M(214)
#define M_yyyyzzzzz          M(215)
#define M_yyyzzzzzz          M(216)
#define M_yyzzzzzzz          M(217)
#define M_yzzzzzzzz          M(218)
#define M_zzzzzzzzz          M(219)
    v204        = y*z
    v205        = x*y
    v184        = 15.0d0*v204
    v186        = v205
    v188        = v204
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v0          = a2
    v155        = 5.0d0*v0
    v5          = 3.0d0*v0
    v10         = v155
    v24         = 7.0d0*v0
    a3          = a1*a2
    a4          = a2*a2
    v19         = a4
    v159        = 143.0d0*v19
    v54         = 33.0d0*v19
    v82         = v159
    a5          = a2*a3
    a6          = a3*a3
    v49         = a6
    v73         = 429.0d0*v49
    v74         = -v73
    v105        = 715.0d0*v49
    a7          = a3*a4
    a8          = a4*a4
    v99         = a8
    a9          = a4*a5
    b2          = b1*b1
    v1          = b2
    v156        = v0*v1
    v7          = 3.0d0*v1
    v14         = 5.0d0*v1
    v157        = v1*v19
    v27         = v156
    v29         = 7.0d0*v1
    v161        = v1*v49
    v59         = v157
    v80         = -429.0d0*v59
    v111        = v161
    b3          = b1*b2
    b4          = b2*b2
    v31         = b4
    v158        = v0*v31
    v160        = 143.0d0*v31
    v162        = v19*v31
    v65         = v158
    v66         = 33.0d0*v31
    v90         = v160
    v91         = -429.0d0*v65
    v121        = v162
    v148        = -12155.0d0*v121
    b5          = b2*b3
    b6          = b3*b3
    v68         = b6
    v163        = v0*v68
    v92         = 429.0d0*v68
    v93         = -v92
    v127        = v163
    v128        = 715.0d0*v68
    b7          = b3*b4
    b8          = b4*b4
    v130        = b8
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v0 + v1
    v164        = 3.0d0*h
    v165        = h*v0
    v166        = h*v1
    v167        = h*v19
    v169        = v1*v165
    v171        = h*v31
    v172        = h*v49
    v176        = v166*v19
    v178        = v165*v31
    v180        = h*v68
    v4          = -h
    v12         = v164
    v13         = -15.0d0*v1 + v12
    v17         = h*h
    v168        = v0*v17
    v170        = v1*v17
    v173        = v17*v19
    v175        = v156*v17
    v179        = v17*v31
    v18         = 3.0d0*v17
    v20         = v165
    v21         = -30.0d0*v20
    v23         = -v12
    v25         = v23 + v24
    v30         = v23 + v29
    v32         = v166
    v33         = -30.0d0*v32
    v36         = -15.0d0*v17
    v37         = -45.0d0*v17
    v38         = v37 + 630.0d0*v165 - 945.0d0*v19
    v40         = -(v18 + 63.0d0*v27)
    v43         = v37 + 630.0d0*v166 - 945.0d0*v31
    v46         = h*h*h
    v174        = v0*v46
    v177        = v1*v46
    v47         = 5.0d0*v46
    v48         = -v47
    v50         = v167
    v51         = v168
    v53         = 5.0d0*v17
    v55         = v21 + v53 + v54
    v57         = v169
    v58         = -(v46 + 126.0d0*v57)
    v61         = -v0*v12
    v62         = -v1*v12
    v63         = v17 + 33.0d0*v27
    v64         = v170
    v67         = v33 + v53 + v66
    v69         = v171
    v72         = 35.0d0*v46
    v76         = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78         = v47 + 330.0d0*v57
    v79         = h*v54
    v84         = -18.0d0*v51 + v46 + v79
    v85         = 66.0d0*v57
    v197        = -v85
    v86         = 9.0d0*v17
    v87         = 198.0d0*v57
    v88         = h*v66
    v89         = -18.0d0*v64 + v46 + v88
    v94         = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97         = h*h*h*h
    v98         = 35.0d0*v97
    v100        = v172
    v101        = v173
    v102        = v174
    v104        = -v72
    v106        = v104 + v105 - 1001.0d0*v50 + 385.0d0*v51
    v108        = v175
    v109        = 5.0d0*(297.0d0*v108 + v97)
    v198        = -v109
    v110        = 45.0d0*v46
    v112        = v176
    v114        = -14175.0d0*v46
    v116        = -v110
    v117        = -1430.0d0*v57
    v199        = v116 + v117
    v119        = -1351350.0d0*v169
    v200        = v114 + v119
    v120        = v177
    v122        = v178
    v124        = 3.0d0*v46
    v125        = -(v124 + 286.0d0*v57)
    v126        = v179
    v129        = v104 + v128 + 385.0d0*v64 - 1001.0d0*v69
    v131        = v180
    v134        = -315.0d0*v97
    v136        = -99225.0d0*v97
    v137        = v136 + 56756700.0d0*v172 - 28378350.0d0*v173 + 4365900.0d0*v174 - &
      34459425.0d0*v99
    v139        = 385.0d0*(v102 + v120) - (5005.0d0*v108 + v98)
    v141        = 7.0d0*v46
    v142        = -42525.0d0*v97
    v143        = -6081075.0d0*v175
    v201        = v142 + v143
    v145        = -(429.0d0*v108 + v97)
    v146        = -v17*v82
    v147        = -15.0d0*v97
    v149        = -2860.0d0*v108
    v202        = v147 + v148 + v149
    v150        = v124 + 130.0d0*v57
    v203        = -v150
    v152        = -v17*v90
    v154        = v136 - 34459425.0d0*v130 + 4365900.0d0*v177 - 28378350.0d0*v179 + &
      56756700.0d0*v180
    u2          = 1.0/h
    u           = sqrt(u2)
    D_0         = u
    u3          = u*u2
    v2          = u3
    D_x         = -v2*x
    D_y         = -v2*y
    D_z         = -v2*z
    u4          = u2*u2
    u5          = u2*u3
    v3          = u5
    v181        = 3.0d0*v3
    v6          = v181*x
    D_xx        = v3*(v4 + v5)
    D_xy        = v6*y
    D_xz        = v6*z
    D_yy        = v3*(v4 + v7)
    D_yz        = v181*v188
    D_zz        = -(D_xx + D_yy)
    u6          = u3*u3
    u7          = u3*u4
    v8          = u7
    v182        = 3.0d0*v8
    v9          = v8*x
    v11         = v182*(h - v10)
    D_xxx       = -3.0d0*v9*(v155 - v164)
    D_xxy       = v11*y
    D_xxz       = v11*z
    D_xyy       = v13*v9
    D_xyz       = -v184*v9
    D_xzz       = -(D_xxx + D_xyy)
    D_yyy       = v182*y*(v12 - v14)
    D_yyz       = v13*v8*z
    D_yzz       = -(D_xxy + D_yyy)
    D_zzz       = -(D_xxz + D_yyz)
    u8          = u4*u4
    u9          = u4*u5
    v15         = u9
    v183        = 15.0d0*v15*x
    v16         = 3.0d0*v15
    v22         = v183*y
    v26         = v183*z
    v28         = v15*v184
    D_xxxx      = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy      = v22*v25
    D_xxxz      = v25*v26
    D_xxyy      = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz      = v28*(v24 + v4)
    D_xxzz      = -(D_xxxx + D_xxyy)
    D_xyyy      = v22*v30
    D_xyyz      = v26*(v29 + v4)
    D_xyzz      = -(D_xxxy + D_xyyy)
    D_xzzz      = -(D_xxxz + D_xyyz)
    D_yyyy      = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz      = v28*v30
    D_yyzz      = -(D_xxyy + D_yyyy)
    D_yzzz      = -(D_xxyz + D_yyyz)
    D_zzzz      = -(D_xxzz + D_yyzz)
    u10         = u5*u5
    u11         = u5*u6
    v34         = u11
    v206        = v34*z
    v185        = 15.0d0*v34
    v35         = v185*x
    v39         = v206
    v41         = 315.0d0*v186*v206
    v42         = v185*y
    D_xxxxx     = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy     = v34*v38*y
    D_xxxxz     = v38*v39
    D_xxxyy     = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz     = v41*(h - v5)
    D_xxxzz     = -(D_xxxxx + D_xxxyy)
    D_xxyyy     = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz     = v39*(v36 - 945.0d0*v156 + 105.0d0*(v165 + v166))
    D_xxyzz     = -(D_xxxxy + D_xxyyy)
    D_xxzzz     = -(D_xxxxz + D_xxyyz)
    D_xyyyy     = v34*v43*x
    D_xyyyz     = v41*(h - v7)
    D_xyyzz     = -(D_xxxyy + D_xyyyy)
    D_xyzzz     = -(D_xxxyz + D_xyyyz)
    D_xzzzz     = -(D_xxxzz + D_xyyzz)
    D_yyyyy     = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz     = v39*v43
    D_yyyzz     = -(D_xxyyy + D_yyyyy)
    D_yyzzz     = -(D_xxyyz + D_yyyyz)
    D_yzzzz     = -(D_xxyzz + D_yyyzz)
    D_zzzzz     = -(D_xxzzz + D_yyzzz)
    u12         = u6*u6
    u13         = u6*u7
    v44         = u13
    v207        = 315.0d0*v44
    v187        = v207*x
    v45         = 45.0d0*v44
    v52         = v187*y
    v56         = v187*z
    v60         = v188*v207
    D_xxxxxx    = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy    = v52*v55
    D_xxxxxz    = v55*v56
    D_xxxxyy    = v45*(v58 - 21.0d0*v167 + v17*v29 + 14.0d0*v51 + 231.0d0*v59)
    D_xxxxyz    = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz    = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy    = 945.0d0*v186*v44*(11.0d0*v27 + v17 + v61 + v62)
    D_xxxyyz    = v56*(-9.0d0*v32 + v61 + v63)
    D_xxxyzz    = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz    = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy    = v45*(v58 + v17*v24 - 21.0d0*v171 + 14.0d0*v64 + 231.0d0*v65)
    D_xxyyyz    = v60*(-9.0d0*v20 + v62 + v63)
    D_xxyyzz    = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz    = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz    = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy    = v52*v67
    D_xyyyyz    = v56*(-18.0d0*v32 + v17 + v66)
    D_xyyyzz    = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz    = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz    = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz    = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy    = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz    = v60*v67
    D_yyyyzz    = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz    = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz    = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz    = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz    = -(D_xxzzzz + D_yyzzzz)
    u14         = u7*u7
    u15         = u7*u8
    v70         = u15
    v208        = 945.0d0*v70
    v189        = 315.0d0*v70
    v71         = v189*x
    v75         = v189*y
    v77         = v189*z
    v81         = v188*v208*x
    v83         = v208
    D_xxxxxxx   = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy   = v75*v76
    D_xxxxxxz   = v76*v77
    D_xxxxxyy   = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    D_xxxxxyz   = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz   = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy   = -v83*y*(v197 + v1*v18 + v1*v82 - v84)
    D_xxxxyyz   = v77*(-v1*v86 + v80 + v84 + v87)
    D_xxxxyzz   = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz   = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy   = -v83*x*(v197 + v0*v18 + v0*v90 - v89)
    D_xxxyyyz   = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    D_xxxyyzz   = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz   = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz   = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy   = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    D_xxyyyyz   = v77*(-v0*v86 + v87 + v89 + v91)
    D_xxyyyzz   = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz   = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz   = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz   = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy   = v71*v94
    D_xyyyyyz   = v81*(v36 + 110.0d0*v32 - v90)
    D_xyyyyzz   = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz   = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz   = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz   = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz   = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy   = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz   = v77*v94
    D_yyyyyzz   = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz   = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz   = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz   = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz   = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz   = -(D_xxzzzzz + D_yyzzzzz)
    u16         = u8*u8
    u17         = u8*u9
    v95         = u17
    v190        = v205*v95
    v191        = v95*z
    v192        = v191*x
    v193        = v191*y
    v96         = 315.0d0*v95
    v103        = 2835.0d0*v190
    v107        = 2835.0d0*v192
    v113        = v193
    v115        = 945.0d0*v190
    v118        = v192
    v123        = 2835.0d0*v193
    D_xxxxxxxx  = v96*(v98 - 12012.0d0*v100 + 6930.0d0*v101 - 1260.0d0*v102 + 6435.0d0*v99 &
      )
    D_xxxxxxxy  = v103*v106
    D_xxxxxxxz  = v106*v107
    D_xxxxxxyy  = -v96*(v198 + h*v73 + v1*v110 - 495.0d0*v101 + 135.0d0*v102 + 6435.0d0*( &
      -v111 + v112))
    D_xxxxxxyz  = v113*(v114 + 467775.0d0*v168 + 155925.0d0*(-13.0d0*v167 + 13.0d0*v49))
    D_xxxxxxzz  = -(D_xxxxxxxx + D_xxxxxxyy)
    D_xxxxxyyy  = v115*(v199 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    D_xxxxxyyz  = v118*(v200 + 2027025.0d0*v157 - 135135.0d0*v167 + 103950.0d0*v168 + &
      155925.0d0*v170)
    D_xxxxxyzz  = -(D_xxxxxxxy + D_xxxxxyyy)
    D_xxxxxzzz  = -(D_xxxxxxxz + D_xxxxxyyz)
    D_xxxxyyyy  = 945.0d0*v95*(v97 + 396.0d0*v108 + 2145.0d0*v121 + v17*v54 + v17*v66 - &
      18.0d0*(v102 + v120) - 858.0d0*(v112 + v122))
    D_xxxxyyyz  = v123*(v125 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    D_xxxxyyzz  = -(D_xxxxxxyy + D_xxxxyyyy)
    D_xxxxyzzz  = -(D_xxxxxxyz + D_xxxxyyyz)
    D_xxxxzzzz  = -(D_xxxxxxzz + D_xxxxyyzz)
    D_xxxyyyyy  = v115*(v199 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    D_xxxyyyyz  = v107*(v125 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    D_xxxyyyzz  = -(D_xxxxxyyy + D_xxxyyyyy)
    D_xxxyyzzz  = -(D_xxxxxyyz + D_xxxyyyyz)
    D_xxxyzzzz  = -(D_xxxxxyzz + D_xxxyyyzz)
    D_xxxzzzzz  = -(D_xxxxxzzz + D_xxxyyzzz)
    D_xxyyyyyy  = -v96*(v198 + h*v92 + v0*v110 + 135.0d0*v120 - 495.0d0*v126 + 6435.0d0*( &
      v122 - v127))
    D_xxyyyyyz  = v113*(v200 + 2027025.0d0*v158 + 155925.0d0*v168 + 103950.0d0*v170 - &
      135135.0d0*v171)
    D_xxyyyyzz  = -(D_xxxxyyyy + D_xxyyyyyy)
    D_xxyyyzzz  = -(D_xxxxyyyz + D_xxyyyyyz)
    D_xxyyzzzz  = -(D_xxxxyyzz + D_xxyyyyzz)
    D_xxyzzzzz  = -(D_xxxxyzzz + D_xxyyyzzz)
    D_xxzzzzzz  = -(D_xxxxzzzz + D_xxyyzzzz)
    D_xyyyyyyy  = v103*v129
    D_xyyyyyyz  = v118*(v114 + 467775.0d0*v170 + 155925.0d0*(-13.0d0*v171 + 13.0d0*v68))
    D_xyyyyyzz  = -(D_xxxyyyyy + D_xyyyyyyy)
    D_xyyyyzzz  = -(D_xxxyyyyz + D_xyyyyyyz)
    D_xyyyzzzz  = -(D_xxxyyyzz + D_xyyyyyzz)
    D_xyyzzzzz  = -(D_xxxyyzzz + D_xyyyyzzz)
    D_xyzzzzzz  = -(D_xxxyzzzz + D_xyyyzzzz)
    D_xzzzzzzz  = -(D_xxxzzzzz + D_xyyzzzzz)
    D_yyyyyyyy  = v96*(v98 - 1260.0d0*v120 + 6930.0d0*v126 + 6435.0d0*v130 - 12012.0d0* &
      v131)
    D_yyyyyyyz  = v123*v129
    D_yyyyyyzz  = -(D_xxyyyyyy + D_yyyyyyyy)
    D_yyyyyzzz  = -(D_xxyyyyyz + D_yyyyyyyz)
    D_yyyyzzzz  = -(D_xxyyyyzz + D_yyyyyyzz)
    D_yyyzzzzz  = -(D_xxyyyzzz + D_yyyyyzzz)
    D_yyzzzzzz  = -(D_xxyyzzzz + D_yyyyzzzz)
    D_yzzzzzzz  = -(D_xxyzzzzz + D_yyyzzzzz)
    D_zzzzzzzz  = -(D_xxzzzzzz + D_yyzzzzzz)
    u18         = u9*u9
    u19         = u10*u9
    v132        = u19
    v209        = v132*x
    v194        = v209
    v195        = v132*y
    v196        = v132*z
    v133        = 2835.0d0*v194
    v135        = v195
    v138        = v196
    v140        = 155925.0d0*v188*v209
    v144        = 14175.0d0*v196
    v151        = 2835.0d0*v195
    v153        = v194
    D_xxxxxxxxx = v133*(v134 + 25740.0d0*v100 - 18018.0d0*v101 + 4620.0d0*v102 - 12155.0d0 &
      *v99)
    L_xxxxxxxxx = D_xxxxxxxxx*M_0
    D_xxxxxxxxy = v135*v137
    L_xxxxxxxxy = D_xxxxxxxxy*M_0
    D_xxxxxxxxz = v137*v138
    L_xxxxxxxx  = D_xxxxxxxx*M_0 + D_xxxxxxxxx*M_x + D_xxxxxxxxy*M_y + D_xxxxxxxxz*M_z
    L_xxxxxxxxz = D_xxxxxxxxz*M_0
    D_xxxxxxxyy = v133*(v139 + h*v105 - 1001.0d0*v101 - 12155.0d0*v111 + 15015.0d0*v112)
    L_xxxxxxxyy = D_xxxxxxxyy*M_0
    D_xxxxxxxyz = v140*(v141 - 221.0d0*v49 + 273.0d0*v50 - 91.0d0*v51)
    L_xxxxxxxy  = D_xxxxxxxxy*M_x + D_xxxxxxxy*M_0 + D_xxxxxxxyy*M_y + D_xxxxxxxyz*M_z
    L_xxxxxxxyz = D_xxxxxxxyz*M_0
    D_xxxxxxxzz = -(D_xxxxxxxxx + D_xxxxxxxyy)
    L_xxxxxxx   = D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxxx*M_xx + D_xxxxxxxxy*M_xy + &
      D_xxxxxxxxz*M_xz + D_xxxxxxxy*M_y + D_xxxxxxxyy*M_yy + &
      D_xxxxxxxyz*M_yz + D_xxxxxxxz*M_z + D_xxxxxxxzz*M_zz
    L_xxxxxxxz  = D_xxxxxxxxz*M_x + D_xxxxxxxyz*M_y + D_xxxxxxxz*M_0 + D_xxxxxxxzz*M_z
    D_xxxxxxyyy = v135*(v201 - 34459425.0d0*v161 + 1403325.0d0*v174 + 30405375.0d0*v176 + &
      155925.0d0*(39.0d0*v172 - 39.0d0*v173 + v177))
    L_xxxxxxyyy = D_xxxxxxyyy*M_0
    D_xxxxxxyyz = v144*(v145 + v146 + 33.0d0*v102 - 2431.0d0*v111 + 2145.0d0*v112 + 11.0d0 &
      *v120 + 143.0d0*v172)
    L_xxxxxxyy  = D_xxxxxxxyy*M_x + D_xxxxxxyy*M_0 + D_xxxxxxyyy*M_y + D_xxxxxxyyz*M_z
    L_xxxxxxyyz = D_xxxxxxyyz*M_0
    D_xxxxxxyzz = -(D_xxxxxxxxy + D_xxxxxxyyy)
    L_xxxxxxy   = D_xxxxxxxxy*M_xx + D_xxxxxxxy*M_x + D_xxxxxxxyy*M_xy + D_xxxxxxxyz*M_xz &
      + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyyy*M_yy + D_xxxxxxyyz &
      *M_yz + D_xxxxxxyz*M_z + D_xxxxxxyzz*M_zz
    L_xxxxxxyz  = D_xxxxxxxyz*M_x + D_xxxxxxyyz*M_y + D_xxxxxxyz*M_0 + D_xxxxxxyzz*M_z
    D_xxxxxxzzz = -(D_xxxxxxxxz + D_xxxxxxyyz)
    L_xxxxxx    = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*M_xx + D_xxxxxxxxx*M_xxx + &
      D_xxxxxxxxy*M_xxy + D_xxxxxxxxz*M_xxz + D_xxxxxxxy*M_xy + &
      D_xxxxxxxyy*M_xyy + D_xxxxxxxyz*M_xyz + D_xxxxxxxz*M_xz + &
      D_xxxxxxxzz*M_xzz + D_xxxxxxy*M_y + D_xxxxxxyy*M_yy + D_xxxxxxyyy &
      *M_yyy + D_xxxxxxyyz*M_yyz + D_xxxxxxyz*M_yz + D_xxxxxxyzz*M_yzz &
      + D_xxxxxxz*M_z + D_xxxxxxzz*M_zz + D_xxxxxxzzz*M_zzz
    L_xxxxxxz   = D_xxxxxxxxz*M_xx + D_xxxxxxxyz*M_xy + D_xxxxxxxz*M_x + D_xxxxxxxzz*M_xz &
      + D_xxxxxxyyz*M_yy + D_xxxxxxyz*M_y + D_xxxxxxyzz*M_yz + &
      D_xxxxxxz*M_0 + D_xxxxxxzz*M_z + D_xxxxxxzzz*M_zz
    D_xxxxxyyyy = v133*(v146 + v202 + 110.0d0*v102 + 4290.0d0*v112 + 330.0d0*v120 + &
      7150.0d0*v122 - 715.0d0*v126)
    L_xxxxxyyyy = D_xxxxxyyyy*M_0
    D_xxxxxyyyz = -v140*(v203 - 39.0d0*v50 + 26.0d0*v51 + 221.0d0*v59 + 13.0d0*v64)
    L_xxxxxyyy  = D_xxxxxxyyy*M_x + D_xxxxxyyy*M_0 + D_xxxxxyyyy*M_y + D_xxxxxyyyz*M_z
    L_xxxxxyyyz = D_xxxxxyyyz*M_0
    D_xxxxxyyzz = -(D_xxxxxxxyy + D_xxxxxyyyy)
    L_xxxxxyy   = D_xxxxxxxyy*M_xx + D_xxxxxxyy*M_x + D_xxxxxxyyy*M_xy + D_xxxxxxyyz*M_xz &
      + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyyy*M_yy + D_xxxxxyyyz &
      *M_yz + D_xxxxxyyz*M_z + D_xxxxxyyzz*M_zz
    L_xxxxxyyz  = D_xxxxxxyyz*M_x + D_xxxxxyyyz*M_y + D_xxxxxyyz*M_0 + D_xxxxxyyzz*M_z
    D_xxxxxyzzz = -(D_xxxxxxxyz + D_xxxxxyyyz)
    L_xxxxxy    = D_xxxxxxxxy*M_xxx + D_xxxxxxxy*M_xx + D_xxxxxxxyy*M_xxy + D_xxxxxxxyz* &
      M_xxz + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyyy*M_xyy + &
      D_xxxxxxyyz*M_xyz + D_xxxxxxyz*M_xz + D_xxxxxxyzz*M_xzz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyy*M_yy + D_xxxxxyyyy* &
      M_yyy + D_xxxxxyyyz*M_yyz + D_xxxxxyyz*M_yz + D_xxxxxyyzz*M_yzz + &
      D_xxxxxyz*M_z + D_xxxxxyzz*M_zz + D_xxxxxyzzz*M_zzz
    L_xxxxxyz   = D_xxxxxxxyz*M_xx + D_xxxxxxyyz*M_xy + D_xxxxxxyz*M_x + D_xxxxxxyzz*M_xz &
      + D_xxxxxyyyz*M_yy + D_xxxxxyyz*M_y + D_xxxxxyyzz*M_yz + &
      D_xxxxxyz*M_0 + D_xxxxxyzz*M_z + D_xxxxxyzzz*M_zz
    D_xxxxxzzzz = -(D_xxxxxxxzz + D_xxxxxyyzz)
    L_xxxxx     = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxxx*M_xxx + &
      D_xxxxxxxxx*M_xxxx + D_xxxxxxxxy*M_xxxy + D_xxxxxxxxz*M_xxxz + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxyy*M_xxyy + D_xxxxxxxyz*M_xxyz + &
      D_xxxxxxxz*M_xxz + D_xxxxxxxzz*M_xxzz + D_xxxxxxy*M_xy + &
      D_xxxxxxyy*M_xyy + D_xxxxxxyyy*M_xyyy + D_xxxxxxyyz*M_xyyz + &
      D_xxxxxxyz*M_xyz + D_xxxxxxyzz*M_xyzz + D_xxxxxxz*M_xz + &
      D_xxxxxxzz*M_xzz + D_xxxxxxzzz*M_xzzz + D_xxxxxy*M_y + D_xxxxxyy* &
      M_yy + D_xxxxxyyy*M_yyy + D_xxxxxyyyy*M_yyyy + D_xxxxxyyyz*M_yyyz &
      + D_xxxxxyyz*M_yyz + D_xxxxxyyzz*M_yyzz + D_xxxxxyz*M_yz + &
      D_xxxxxyzz*M_yzz + D_xxxxxyzzz*M_yzzz + D_xxxxxz*M_z + D_xxxxxzz* &
      M_zz + D_xxxxxzzz*M_zzz + D_xxxxxzzzz*M_zzzz
    L_xxxxxz    = D_xxxxxxxxz*M_xxx + D_xxxxxxxyz*M_xxy + D_xxxxxxxz*M_xx + D_xxxxxxxzz* &
      M_xxz + D_xxxxxxyyz*M_xyy + D_xxxxxxyz*M_xy + D_xxxxxxyzz*M_xyz + &
      D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + D_xxxxxxzzz*M_xzz + D_xxxxxyyyz &
      *M_yyy + D_xxxxxyyz*M_yy + D_xxxxxyyzz*M_yyz + D_xxxxxyz*M_y + &
      D_xxxxxyzz*M_yz + D_xxxxxyzzz*M_yzz + D_xxxxxz*M_0 + D_xxxxxzz* &
      M_z + D_xxxxxzzz*M_zz + D_xxxxxzzzz*M_zzz
    D_xxxxyyyyy = v151*(v152 + v202 - 715.0d0*v101 + 330.0d0*v102 + 7150.0d0*v112 + &
      110.0d0*v120 + 4290.0d0*v122)
    L_xxxxyyyyy = D_xxxxyyyyy*M_0
    D_xxxxyyyyz = -2835.0d0*v138*(v159*v17 + v160*v17 + 12155.0d0*v162 + 1716.0d0*v175 + &
      3.0d0*v97 - 66.0d0*(v174 + v177) - 4290.0d0*(v176 + v178))
    L_xxxxyyyy  = D_xxxxxyyyy*M_x + D_xxxxyyyy*M_0 + D_xxxxyyyyy*M_y + D_xxxxyyyyz*M_z
    L_xxxxyyyyz = D_xxxxyyyyz*M_0
    D_xxxxyyyzz = -(D_xxxxxxyyy + D_xxxxyyyyy)
    L_xxxxyyy   = D_xxxxxxyyy*M_xx + D_xxxxxyyy*M_x + D_xxxxxyyyy*M_xy + D_xxxxxyyyz*M_xz &
      + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyyy*M_yy + D_xxxxyyyyz &
      *M_yz + D_xxxxyyyz*M_z + D_xxxxyyyzz*M_zz
    L_xxxxyyyz  = D_xxxxxyyyz*M_x + D_xxxxyyyyz*M_y + D_xxxxyyyz*M_0 + D_xxxxyyyzz*M_z
    D_xxxxyyzzz = -(D_xxxxxxyyz + D_xxxxyyyyz)
    L_xxxxyy    = D_xxxxxxxyy*M_xxx + D_xxxxxxyy*M_xx + D_xxxxxxyyy*M_xxy + D_xxxxxxyyz* &
      M_xxz + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyyy*M_xyy + &
      D_xxxxxyyyz*M_xyz + D_xxxxxyyz*M_xz + D_xxxxxyyzz*M_xzz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyy*M_yy + D_xxxxyyyyy* &
      M_yyy + D_xxxxyyyyz*M_yyz + D_xxxxyyyz*M_yz + D_xxxxyyyzz*M_yzz + &
      D_xxxxyyz*M_z + D_xxxxyyzz*M_zz + D_xxxxyyzzz*M_zzz
    L_xxxxyyz   = D_xxxxxxyyz*M_xx + D_xxxxxyyyz*M_xy + D_xxxxxyyz*M_x + D_xxxxxyyzz*M_xz &
      + D_xxxxyyyyz*M_yy + D_xxxxyyyz*M_y + D_xxxxyyyzz*M_yz + &
      D_xxxxyyz*M_0 + D_xxxxyyzz*M_z + D_xxxxyyzzz*M_zz
    D_xxxxyzzzz = -(D_xxxxxxyzz + D_xxxxyyyzz)
    L_xxxxy     = D_xxxxxxxxy*M_xxxx + D_xxxxxxxy*M_xxx + D_xxxxxxxyy*M_xxxy + D_xxxxxxxyz &
      *M_xxxz + D_xxxxxxy*M_xx + D_xxxxxxyy*M_xxy + D_xxxxxxyyy*M_xxyy &
      + D_xxxxxxyyz*M_xxyz + D_xxxxxxyz*M_xxz + D_xxxxxxyzz*M_xxzz + &
      D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyy*M_xyy + D_xxxxxyyyy* &
      M_xyyy + D_xxxxxyyyz*M_xyyz + D_xxxxxyyz*M_xyz + D_xxxxxyyzz* &
      M_xyzz + D_xxxxxyz*M_xz + D_xxxxxyzz*M_xzz + D_xxxxxyzzz*M_xzzz + &
      D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyyy*M_yyy + &
      D_xxxxyyyyy*M_yyyy + D_xxxxyyyyz*M_yyyz + D_xxxxyyyz*M_yyz + &
      D_xxxxyyyzz*M_yyzz + D_xxxxyyz*M_yz + D_xxxxyyzz*M_yzz + &
      D_xxxxyyzzz*M_yzzz + D_xxxxyz*M_z + D_xxxxyzz*M_zz + D_xxxxyzzz* &
      M_zzz + D_xxxxyzzzz*M_zzzz
    L_xxxxyz    = D_xxxxxxxyz*M_xxx + D_xxxxxxyyz*M_xxy + D_xxxxxxyz*M_xx + D_xxxxxxyzz* &
      M_xxz + D_xxxxxyyyz*M_xyy + D_xxxxxyyz*M_xy + D_xxxxxyyzz*M_xyz + &
      D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + D_xxxxxyzzz*M_xzz + D_xxxxyyyyz &
      *M_yyy + D_xxxxyyyz*M_yy + D_xxxxyyyzz*M_yyz + D_xxxxyyz*M_y + &
      D_xxxxyyzz*M_yz + D_xxxxyyzzz*M_yzz + D_xxxxyz*M_0 + D_xxxxyzz* &
      M_z + D_xxxxyzzz*M_zz + D_xxxxyzzzz*M_zzz
    D_xxxxzzzzz = -(D_xxxxxxzzz + D_xxxxyyzzz)
    L_xxxx      = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxxx* &
      M_xxxx + D_xxxxxxxxx*M_xxxxx + D_xxxxxxxxy*M_xxxxy + D_xxxxxxxxz* &
      M_xxxxz + D_xxxxxxxy*M_xxxy + D_xxxxxxxyy*M_xxxyy + D_xxxxxxxyz* &
      M_xxxyz + D_xxxxxxxz*M_xxxz + D_xxxxxxxzz*M_xxxzz + D_xxxxxxy* &
      M_xxy + D_xxxxxxyy*M_xxyy + D_xxxxxxyyy*M_xxyyy + D_xxxxxxyyz* &
      M_xxyyz + D_xxxxxxyz*M_xxyz + D_xxxxxxyzz*M_xxyzz + D_xxxxxxz* &
      M_xxz + D_xxxxxxzz*M_xxzz + D_xxxxxxzzz*M_xxzzz + D_xxxxxy*M_xy + &
      D_xxxxxyy*M_xyy + D_xxxxxyyy*M_xyyy + D_xxxxxyyyy*M_xyyyy + &
      D_xxxxxyyyz*M_xyyyz + D_xxxxxyyz*M_xyyz + D_xxxxxyyzz*M_xyyzz + &
      D_xxxxxyz*M_xyz + D_xxxxxyzz*M_xyzz + D_xxxxxyzzz*M_xyzzz + &
      D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxxzzz*M_xzzz + D_xxxxxzzzz &
      *M_xzzzz + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + &
      D_xxxxyyyy*M_yyyy + D_xxxxyyyyy*M_yyyyy + D_xxxxyyyyz*M_yyyyz + &
      D_xxxxyyyz*M_yyyz + D_xxxxyyyzz*M_yyyzz + D_xxxxyyz*M_yyz + &
      D_xxxxyyzz*M_yyzz + D_xxxxyyzzz*M_yyzzz + D_xxxxyz*M_yz + &
      D_xxxxyzz*M_yzz + D_xxxxyzzz*M_yzzz + D_xxxxyzzzz*M_yzzzz + &
      D_xxxxz*M_z + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz + D_xxxxzzzz*M_zzzz &
      + D_xxxxzzzzz*M_zzzzz
    L_xxxxz     = D_xxxxxxxxz*M_xxxx + D_xxxxxxxyz*M_xxxy + D_xxxxxxxz*M_xxx + D_xxxxxxxzz &
      *M_xxxz + D_xxxxxxyyz*M_xxyy + D_xxxxxxyz*M_xxy + D_xxxxxxyzz* &
      M_xxyz + D_xxxxxxz*M_xx + D_xxxxxxzz*M_xxz + D_xxxxxxzzz*M_xxzz + &
      D_xxxxxyyyz*M_xyyy + D_xxxxxyyz*M_xyy + D_xxxxxyyzz*M_xyyz + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxyzzz*M_xyzz + D_xxxxxz &
      *M_x + D_xxxxxzz*M_xz + D_xxxxxzzz*M_xzz + D_xxxxxzzzz*M_xzzz + &
      D_xxxxyyyyz*M_yyyy + D_xxxxyyyz*M_yyy + D_xxxxyyyzz*M_yyyz + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyyzzz*M_yyzz + D_xxxxyz &
      *M_y + D_xxxxyzz*M_yz + D_xxxxyzzz*M_yzz + D_xxxxyzzzz*M_yzzz + &
      D_xxxxz*M_0 + D_xxxxzz*M_z + D_xxxxzzz*M_zz + D_xxxxzzzz*M_zzz + &
      D_xxxxzzzzz*M_zzzz
    D_xxxyyyyyy = v153*(v201 - 34459425.0d0*v163 + 1403325.0d0*v177 + 30405375.0d0*v178 + &
      155925.0d0*(v174 - 39.0d0*v179 + 39.0d0*v180))
    L_xxxyyyyyy = D_xxxyyyyyy*M_0
    D_xxxyyyyyz = -v140*(v203 + 13.0d0*v51 + 26.0d0*v64 + 221.0d0*v65 - 39.0d0*v69)
    L_xxxyyyyy  = D_xxxxyyyyy*M_x + D_xxxyyyyy*M_0 + D_xxxyyyyyy*M_y + D_xxxyyyyyz*M_z
    L_xxxyyyyyz = D_xxxyyyyyz*M_0
    D_xxxyyyyzz = -(D_xxxxxyyyy + D_xxxyyyyyy)
    L_xxxyyyy   = D_xxxxxyyyy*M_xx + D_xxxxyyyy*M_x + D_xxxxyyyyy*M_xy + D_xxxxyyyyz*M_xz &
      + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyyy*M_yy + D_xxxyyyyyz &
      *M_yz + D_xxxyyyyz*M_z + D_xxxyyyyzz*M_zz
    L_xxxyyyyz  = D_xxxxyyyyz*M_x + D_xxxyyyyyz*M_y + D_xxxyyyyz*M_0 + D_xxxyyyyzz*M_z
    D_xxxyyyzzz = -(D_xxxxxyyyz + D_xxxyyyyyz)
    L_xxxyyy    = D_xxxxxxyyy*M_xxx + D_xxxxxyyy*M_xx + D_xxxxxyyyy*M_xxy + D_xxxxxyyyz* &
      M_xxz + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyyy*M_xyy + &
      D_xxxxyyyyz*M_xyz + D_xxxxyyyz*M_xz + D_xxxxyyyzz*M_xzz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyy*M_yy + D_xxxyyyyyy* &
      M_yyy + D_xxxyyyyyz*M_yyz + D_xxxyyyyz*M_yz + D_xxxyyyyzz*M_yzz + &
      D_xxxyyyz*M_z + D_xxxyyyzz*M_zz + D_xxxyyyzzz*M_zzz
    L_xxxyyyz   = D_xxxxxyyyz*M_xx + D_xxxxyyyyz*M_xy + D_xxxxyyyz*M_x + D_xxxxyyyzz*M_xz &
      + D_xxxyyyyyz*M_yy + D_xxxyyyyz*M_y + D_xxxyyyyzz*M_yz + &
      D_xxxyyyz*M_0 + D_xxxyyyzz*M_z + D_xxxyyyzzz*M_zz
    D_xxxyyzzzz = -(D_xxxxxyyzz + D_xxxyyyyzz)
    L_xxxyy     = D_xxxxxxxyy*M_xxxx + D_xxxxxxyy*M_xxx + D_xxxxxxyyy*M_xxxy + D_xxxxxxyyz &
      *M_xxxz + D_xxxxxyy*M_xx + D_xxxxxyyy*M_xxy + D_xxxxxyyyy*M_xxyy &
      + D_xxxxxyyyz*M_xxyz + D_xxxxxyyz*M_xxz + D_xxxxxyyzz*M_xxzz + &
      D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyy*M_xyy + D_xxxxyyyyy* &
      M_xyyy + D_xxxxyyyyz*M_xyyz + D_xxxxyyyz*M_xyz + D_xxxxyyyzz* &
      M_xyzz + D_xxxxyyz*M_xz + D_xxxxyyzz*M_xzz + D_xxxxyyzzz*M_xzzz + &
      D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyyy*M_yyy + &
      D_xxxyyyyyy*M_yyyy + D_xxxyyyyyz*M_yyyz + D_xxxyyyyz*M_yyz + &
      D_xxxyyyyzz*M_yyzz + D_xxxyyyz*M_yz + D_xxxyyyzz*M_yzz + &
      D_xxxyyyzzz*M_yzzz + D_xxxyyz*M_z + D_xxxyyzz*M_zz + D_xxxyyzzz* &
      M_zzz + D_xxxyyzzzz*M_zzzz
    L_xxxyyz    = D_xxxxxxyyz*M_xxx + D_xxxxxyyyz*M_xxy + D_xxxxxyyz*M_xx + D_xxxxxyyzz* &
      M_xxz + D_xxxxyyyyz*M_xyy + D_xxxxyyyz*M_xy + D_xxxxyyyzz*M_xyz + &
      D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + D_xxxxyyzzz*M_xzz + D_xxxyyyyyz &
      *M_yyy + D_xxxyyyyz*M_yy + D_xxxyyyyzz*M_yyz + D_xxxyyyz*M_y + &
      D_xxxyyyzz*M_yz + D_xxxyyyzzz*M_yzz + D_xxxyyz*M_0 + D_xxxyyzz* &
      M_z + D_xxxyyzzz*M_zz + D_xxxyyzzzz*M_zzz
    D_xxxyzzzzz = -(D_xxxxxyzzz + D_xxxyyyzzz)
    L_xxxy      = D_xxxxxxxxy*M_xxxxx + D_xxxxxxxy*M_xxxx + D_xxxxxxxyy*M_xxxxy + &
      D_xxxxxxxyz*M_xxxxz + D_xxxxxxy*M_xxx + D_xxxxxxyy*M_xxxy + &
      D_xxxxxxyyy*M_xxxyy + D_xxxxxxyyz*M_xxxyz + D_xxxxxxyz*M_xxxz + &
      D_xxxxxxyzz*M_xxxzz + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + &
      D_xxxxxyyy*M_xxyy + D_xxxxxyyyy*M_xxyyy + D_xxxxxyyyz*M_xxyyz + &
      D_xxxxxyyz*M_xxyz + D_xxxxxyyzz*M_xxyzz + D_xxxxxyz*M_xxz + &
      D_xxxxxyzz*M_xxzz + D_xxxxxyzzz*M_xxzzz + D_xxxxy*M_x + D_xxxxyy* &
      M_xy + D_xxxxyyy*M_xyy + D_xxxxyyyy*M_xyyy + D_xxxxyyyyy*M_xyyyy &
      + D_xxxxyyyyz*M_xyyyz + D_xxxxyyyz*M_xyyz + D_xxxxyyyzz*M_xyyzz + &
      D_xxxxyyz*M_xyz + D_xxxxyyzz*M_xyzz + D_xxxxyyzzz*M_xyzzz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxxyzzz*M_xzzz + D_xxxxyzzzz &
      *M_xzzzz + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyyy* &
      M_yyy + D_xxxyyyyy*M_yyyy + D_xxxyyyyyy*M_yyyyy + D_xxxyyyyyz* &
      M_yyyyz + D_xxxyyyyz*M_yyyz + D_xxxyyyyzz*M_yyyzz + D_xxxyyyz* &
      M_yyz + D_xxxyyyzz*M_yyzz + D_xxxyyyzzz*M_yyzzz + D_xxxyyz*M_yz + &
      D_xxxyyzz*M_yzz + D_xxxyyzzz*M_yzzz + D_xxxyyzzzz*M_yzzzz + &
      D_xxxyz*M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz + D_xxxyzzzz*M_zzzz &
      + D_xxxyzzzzz*M_zzzzz
    L_xxxyz     = D_xxxxxxxyz*M_xxxx + D_xxxxxxyyz*M_xxxy + D_xxxxxxyz*M_xxx + D_xxxxxxyzz &
      *M_xxxz + D_xxxxxyyyz*M_xxyy + D_xxxxxyyz*M_xxy + D_xxxxxyyzz* &
      M_xxyz + D_xxxxxyz*M_xx + D_xxxxxyzz*M_xxz + D_xxxxxyzzz*M_xxzz + &
      D_xxxxyyyyz*M_xyyy + D_xxxxyyyz*M_xyy + D_xxxxyyyzz*M_xyyz + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyyzzz*M_xyzz + D_xxxxyz &
      *M_x + D_xxxxyzz*M_xz + D_xxxxyzzz*M_xzz + D_xxxxyzzzz*M_xzzz + &
      D_xxxyyyyyz*M_yyyy + D_xxxyyyyz*M_yyy + D_xxxyyyyzz*M_yyyz + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyyzzz*M_yyzz + D_xxxyyz &
      *M_y + D_xxxyyzz*M_yz + D_xxxyyzzz*M_yzz + D_xxxyyzzzz*M_yzzz + &
      D_xxxyz*M_0 + D_xxxyzz*M_z + D_xxxyzzz*M_zz + D_xxxyzzzz*M_zzz + &
      D_xxxyzzzzz*M_zzzz
    D_xxxzzzzzz = -(D_xxxxxzzzz + D_xxxyyzzzz)
    L_xxx       = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxxx*M_xxxxx + D_xxxxxxxxx*M_xxxxxx + D_xxxxxxxxy* &
      M_xxxxxy + D_xxxxxxxxz*M_xxxxxz + D_xxxxxxxy*M_xxxxy + &
      D_xxxxxxxyy*M_xxxxyy + D_xxxxxxxyz*M_xxxxyz + D_xxxxxxxz*M_xxxxz &
      + D_xxxxxxxzz*M_xxxxzz + D_xxxxxxy*M_xxxy + D_xxxxxxyy*M_xxxyy + &
      D_xxxxxxyyy*M_xxxyyy + D_xxxxxxyyz*M_xxxyyz + D_xxxxxxyz*M_xxxyz &
      + D_xxxxxxyzz*M_xxxyzz + D_xxxxxxz*M_xxxz + D_xxxxxxzz*M_xxxzz + &
      D_xxxxxxzzz*M_xxxzzz + D_xxxxxy*M_xxy + D_xxxxxyy*M_xxyy + &
      D_xxxxxyyy*M_xxyyy + D_xxxxxyyyy*M_xxyyyy + D_xxxxxyyyz*M_xxyyyz &
      + D_xxxxxyyz*M_xxyyz + D_xxxxxyyzz*M_xxyyzz + D_xxxxxyz*M_xxyz + &
      D_xxxxxyzz*M_xxyzz + D_xxxxxyzzz*M_xxyzzz + D_xxxxxz*M_xxz + &
      D_xxxxxzz*M_xxzz + D_xxxxxzzz*M_xxzzz + D_xxxxxzzzz*M_xxzzzz + &
      D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyyy*M_xyyy + D_xxxxyyyy* &
      M_xyyyy + D_xxxxyyyyy*M_xyyyyy + D_xxxxyyyyz*M_xyyyyz + &
      D_xxxxyyyz*M_xyyyz + D_xxxxyyyzz*M_xyyyzz + D_xxxxyyz*M_xyyz + &
      D_xxxxyyzz*M_xyyzz + D_xxxxyyzzz*M_xyyzzz + D_xxxxyz*M_xyz + &
      D_xxxxyzz*M_xyzz + D_xxxxyzzz*M_xyzzz + D_xxxxyzzzz*M_xyzzzz + &
      D_xxxxz*M_xz + D_xxxxzz*M_xzz + D_xxxxzzz*M_xzzz + D_xxxxzzzz* &
      M_xzzzz + D_xxxxzzzzz*M_xzzzzz + D_xxxy*M_y + D_xxxyy*M_yy + &
      D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyyy*M_yyyyy + &
      D_xxxyyyyyy*M_yyyyyy + D_xxxyyyyyz*M_yyyyyz + D_xxxyyyyz*M_yyyyz &
      + D_xxxyyyyzz*M_yyyyzz + D_xxxyyyz*M_yyyz + D_xxxyyyzz*M_yyyzz + &
      D_xxxyyyzzz*M_yyyzzz + D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + &
      D_xxxyyzzz*M_yyzzz + D_xxxyyzzzz*M_yyzzzz + D_xxxyz*M_yz + &
      D_xxxyzz*M_yzz + D_xxxyzzz*M_yzzz + D_xxxyzzzz*M_yzzzz + &
      D_xxxyzzzzz*M_yzzzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz &
      + D_xxxzzzz*M_zzzz + D_xxxzzzzz*M_zzzzz + D_xxxzzzzzz*M_zzzzzz
    L_xxxz      = D_xxxxxxxxz*M_xxxxx + D_xxxxxxxyz*M_xxxxy + D_xxxxxxxz*M_xxxx + &
      D_xxxxxxxzz*M_xxxxz + D_xxxxxxyyz*M_xxxyy + D_xxxxxxyz*M_xxxy + &
      D_xxxxxxyzz*M_xxxyz + D_xxxxxxz*M_xxx + D_xxxxxxzz*M_xxxz + &
      D_xxxxxxzzz*M_xxxzz + D_xxxxxyyyz*M_xxyyy + D_xxxxxyyz*M_xxyy + &
      D_xxxxxyyzz*M_xxyyz + D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz + &
      D_xxxxxyzzz*M_xxyzz + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + &
      D_xxxxxzzz*M_xxzz + D_xxxxxzzzz*M_xxzzz + D_xxxxyyyyz*M_xyyyy + &
      D_xxxxyyyz*M_xyyy + D_xxxxyyyzz*M_xyyyz + D_xxxxyyz*M_xyy + &
      D_xxxxyyzz*M_xyyz + D_xxxxyyzzz*M_xyyzz + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxyzzz*M_xyzz + D_xxxxyzzzz*M_xyzzz + &
      D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxxzzzz*M_xzzz &
      + D_xxxxzzzzz*M_xzzzz + D_xxxyyyyyz*M_yyyyy + D_xxxyyyyz*M_yyyy + &
      D_xxxyyyyzz*M_yyyyz + D_xxxyyyz*M_yyy + D_xxxyyyzz*M_yyyz + &
      D_xxxyyyzzz*M_yyyzz + D_xxxyyz*M_yy + D_xxxyyzz*M_yyz + &
      D_xxxyyzzz*M_yyzz + D_xxxyyzzzz*M_yyzzz + D_xxxyz*M_y + D_xxxyzz* &
      M_yz + D_xxxyzzz*M_yzz + D_xxxyzzzz*M_yzzz + D_xxxyzzzzz*M_yzzzz &
      + D_xxxz*M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz + &
      D_xxxzzzzz*M_zzzz + D_xxxzzzzzz*M_zzzzz
    D_xxyyyyyyy = v151*(v139 + h*v128 + 15015.0d0*v122 - 1001.0d0*v126 - 12155.0d0*v127)
    L_xxyyyyyyy = D_xxyyyyyyy*M_0
    D_xxyyyyyyz = v144*(v145 + v152 + 11.0d0*v102 + 33.0d0*v120 + 2145.0d0*v122 - 2431.0d0 &
      *v127 + 143.0d0*v180)
    L_xxyyyyyy  = D_xxxyyyyyy*M_x + D_xxyyyyyy*M_0 + D_xxyyyyyyy*M_y + D_xxyyyyyyz*M_z
    L_xxyyyyyyz = D_xxyyyyyyz*M_0
    D_xxyyyyyzz = -(D_xxxxyyyyy + D_xxyyyyyyy)
    L_xxyyyyy   = D_xxxxyyyyy*M_xx + D_xxxyyyyy*M_x + D_xxxyyyyyy*M_xy + D_xxxyyyyyz*M_xz &
      + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyyy*M_yy + D_xxyyyyyyz &
      *M_yz + D_xxyyyyyz*M_z + D_xxyyyyyzz*M_zz
    L_xxyyyyyz  = D_xxxyyyyyz*M_x + D_xxyyyyyyz*M_y + D_xxyyyyyz*M_0 + D_xxyyyyyzz*M_z
    D_xxyyyyzzz = -(D_xxxxyyyyz + D_xxyyyyyyz)
    L_xxyyyy    = D_xxxxxyyyy*M_xxx + D_xxxxyyyy*M_xx + D_xxxxyyyyy*M_xxy + D_xxxxyyyyz* &
      M_xxz + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyyy*M_xyy + &
      D_xxxyyyyyz*M_xyz + D_xxxyyyyz*M_xz + D_xxxyyyyzz*M_xzz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyy*M_yy + D_xxyyyyyyy* &
      M_yyy + D_xxyyyyyyz*M_yyz + D_xxyyyyyz*M_yz + D_xxyyyyyzz*M_yzz + &
      D_xxyyyyz*M_z + D_xxyyyyzz*M_zz + D_xxyyyyzzz*M_zzz
    L_xxyyyyz   = D_xxxxyyyyz*M_xx + D_xxxyyyyyz*M_xy + D_xxxyyyyz*M_x + D_xxxyyyyzz*M_xz &
      + D_xxyyyyyyz*M_yy + D_xxyyyyyz*M_y + D_xxyyyyyzz*M_yz + &
      D_xxyyyyz*M_0 + D_xxyyyyzz*M_z + D_xxyyyyzzz*M_zz
    D_xxyyyzzzz = -(D_xxxxyyyzz + D_xxyyyyyzz)
    L_xxyyy     = D_xxxxxxyyy*M_xxxx + D_xxxxxyyy*M_xxx + D_xxxxxyyyy*M_xxxy + D_xxxxxyyyz &
      *M_xxxz + D_xxxxyyy*M_xx + D_xxxxyyyy*M_xxy + D_xxxxyyyyy*M_xxyy &
      + D_xxxxyyyyz*M_xxyz + D_xxxxyyyz*M_xxz + D_xxxxyyyzz*M_xxzz + &
      D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyy*M_xyy + D_xxxyyyyyy* &
      M_xyyy + D_xxxyyyyyz*M_xyyz + D_xxxyyyyz*M_xyz + D_xxxyyyyzz* &
      M_xyzz + D_xxxyyyz*M_xz + D_xxxyyyzz*M_xzz + D_xxxyyyzzz*M_xzzz + &
      D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyyy*M_yyy + &
      D_xxyyyyyyy*M_yyyy + D_xxyyyyyyz*M_yyyz + D_xxyyyyyz*M_yyz + &
      D_xxyyyyyzz*M_yyzz + D_xxyyyyz*M_yz + D_xxyyyyzz*M_yzz + &
      D_xxyyyyzzz*M_yzzz + D_xxyyyz*M_z + D_xxyyyzz*M_zz + D_xxyyyzzz* &
      M_zzz + D_xxyyyzzzz*M_zzzz
    L_xxyyyz    = D_xxxxxyyyz*M_xxx + D_xxxxyyyyz*M_xxy + D_xxxxyyyz*M_xx + D_xxxxyyyzz* &
      M_xxz + D_xxxyyyyyz*M_xyy + D_xxxyyyyz*M_xy + D_xxxyyyyzz*M_xyz + &
      D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + D_xxxyyyzzz*M_xzz + D_xxyyyyyyz &
      *M_yyy + D_xxyyyyyz*M_yy + D_xxyyyyyzz*M_yyz + D_xxyyyyz*M_y + &
      D_xxyyyyzz*M_yz + D_xxyyyyzzz*M_yzz + D_xxyyyz*M_0 + D_xxyyyzz* &
      M_z + D_xxyyyzzz*M_zz + D_xxyyyzzzz*M_zzz
    D_xxyyzzzzz = -(D_xxxxyyzzz + D_xxyyyyzzz)
    L_xxyy      = D_xxxxxxxyy*M_xxxxx + D_xxxxxxyy*M_xxxx + D_xxxxxxyyy*M_xxxxy + &
      D_xxxxxxyyz*M_xxxxz + D_xxxxxyy*M_xxx + D_xxxxxyyy*M_xxxy + &
      D_xxxxxyyyy*M_xxxyy + D_xxxxxyyyz*M_xxxyz + D_xxxxxyyz*M_xxxz + &
      D_xxxxxyyzz*M_xxxzz + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + &
      D_xxxxyyyy*M_xxyy + D_xxxxyyyyy*M_xxyyy + D_xxxxyyyyz*M_xxyyz + &
      D_xxxxyyyz*M_xxyz + D_xxxxyyyzz*M_xxyzz + D_xxxxyyz*M_xxz + &
      D_xxxxyyzz*M_xxzz + D_xxxxyyzzz*M_xxzzz + D_xxxyy*M_x + D_xxxyyy* &
      M_xy + D_xxxyyyy*M_xyy + D_xxxyyyyy*M_xyyy + D_xxxyyyyyy*M_xyyyy &
      + D_xxxyyyyyz*M_xyyyz + D_xxxyyyyz*M_xyyz + D_xxxyyyyzz*M_xyyzz + &
      D_xxxyyyz*M_xyz + D_xxxyyyzz*M_xyzz + D_xxxyyyzzz*M_xyzzz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxxyyzzz*M_xzzz + D_xxxyyzzzz &
      *M_xzzzz + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyyy* &
      M_yyy + D_xxyyyyyy*M_yyyy + D_xxyyyyyyy*M_yyyyy + D_xxyyyyyyz* &
      M_yyyyz + D_xxyyyyyz*M_yyyz + D_xxyyyyyzz*M_yyyzz + D_xxyyyyz* &
      M_yyz + D_xxyyyyzz*M_yyzz + D_xxyyyyzzz*M_yyzzz + D_xxyyyz*M_yz + &
      D_xxyyyzz*M_yzz + D_xxyyyzzz*M_yzzz + D_xxyyyzzzz*M_yzzzz + &
      D_xxyyz*M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz + D_xxyyzzzz*M_zzzz &
      + D_xxyyzzzzz*M_zzzzz
    L_xxyyz     = D_xxxxxxyyz*M_xxxx + D_xxxxxyyyz*M_xxxy + D_xxxxxyyz*M_xxx + D_xxxxxyyzz &
      *M_xxxz + D_xxxxyyyyz*M_xxyy + D_xxxxyyyz*M_xxy + D_xxxxyyyzz* &
      M_xxyz + D_xxxxyyz*M_xx + D_xxxxyyzz*M_xxz + D_xxxxyyzzz*M_xxzz + &
      D_xxxyyyyyz*M_xyyy + D_xxxyyyyz*M_xyy + D_xxxyyyyzz*M_xyyz + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyyzzz*M_xyzz + D_xxxyyz &
      *M_x + D_xxxyyzz*M_xz + D_xxxyyzzz*M_xzz + D_xxxyyzzzz*M_xzzz + &
      D_xxyyyyyyz*M_yyyy + D_xxyyyyyz*M_yyy + D_xxyyyyyzz*M_yyyz + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyyzzz*M_yyzz + D_xxyyyz &
      *M_y + D_xxyyyzz*M_yz + D_xxyyyzzz*M_yzz + D_xxyyyzzzz*M_yzzz + &
      D_xxyyz*M_0 + D_xxyyzz*M_z + D_xxyyzzz*M_zz + D_xxyyzzzz*M_zzz + &
      D_xxyyzzzzz*M_zzzz
    D_xxyzzzzzz = -(D_xxxxyzzzz + D_xxyyyzzzz)
    L_xxy       = D_xxxxxxxxy*M_xxxxxx + D_xxxxxxxy*M_xxxxx + D_xxxxxxxyy*M_xxxxxy + &
      D_xxxxxxxyz*M_xxxxxz + D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + &
      D_xxxxxxyyy*M_xxxxyy + D_xxxxxxyyz*M_xxxxyz + D_xxxxxxyz*M_xxxxz &
      + D_xxxxxxyzz*M_xxxxzz + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + &
      D_xxxxxyyy*M_xxxyy + D_xxxxxyyyy*M_xxxyyy + D_xxxxxyyyz*M_xxxyyz &
      + D_xxxxxyyz*M_xxxyz + D_xxxxxyyzz*M_xxxyzz + D_xxxxxyz*M_xxxz + &
      D_xxxxxyzz*M_xxxzz + D_xxxxxyzzz*M_xxxzzz + D_xxxxy*M_xx + &
      D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyyy*M_xxyyy + &
      D_xxxxyyyyy*M_xxyyyy + D_xxxxyyyyz*M_xxyyyz + D_xxxxyyyz*M_xxyyz &
      + D_xxxxyyyzz*M_xxyyzz + D_xxxxyyz*M_xxyz + D_xxxxyyzz*M_xxyzz + &
      D_xxxxyyzzz*M_xxyzzz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + &
      D_xxxxyzzz*M_xxzzz + D_xxxxyzzzz*M_xxzzzz + D_xxxy*M_x + D_xxxyy* &
      M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + D_xxxyyyyy*M_xyyyy + &
      D_xxxyyyyyy*M_xyyyyy + D_xxxyyyyyz*M_xyyyyz + D_xxxyyyyz*M_xyyyz &
      + D_xxxyyyyzz*M_xyyyzz + D_xxxyyyz*M_xyyz + D_xxxyyyzz*M_xyyzz + &
      D_xxxyyyzzz*M_xyyzzz + D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + &
      D_xxxyyzzz*M_xyzzz + D_xxxyyzzzz*M_xyzzzz + D_xxxyz*M_xz + &
      D_xxxyzz*M_xzz + D_xxxyzzz*M_xzzz + D_xxxyzzzz*M_xzzzz + &
      D_xxxyzzzzz*M_xzzzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyyy*M_yyyyy + &
      D_xxyyyyyyy*M_yyyyyy + D_xxyyyyyyz*M_yyyyyz + D_xxyyyyyz*M_yyyyz &
      + D_xxyyyyyzz*M_yyyyzz + D_xxyyyyz*M_yyyz + D_xxyyyyzz*M_yyyzz + &
      D_xxyyyyzzz*M_yyyzzz + D_xxyyyz*M_yyz + D_xxyyyzz*M_yyzz + &
      D_xxyyyzzz*M_yyzzz + D_xxyyyzzzz*M_yyzzzz + D_xxyyz*M_yz + &
      D_xxyyzz*M_yzz + D_xxyyzzz*M_yzzz + D_xxyyzzzz*M_yzzzz + &
      D_xxyyzzzzz*M_yzzzzz + D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz &
      + D_xxyzzzz*M_zzzz + D_xxyzzzzz*M_zzzzz + D_xxyzzzzzz*M_zzzzzz
    L_xxyz      = D_xxxxxxxyz*M_xxxxx + D_xxxxxxyyz*M_xxxxy + D_xxxxxxyz*M_xxxx + &
      D_xxxxxxyzz*M_xxxxz + D_xxxxxyyyz*M_xxxyy + D_xxxxxyyz*M_xxxy + &
      D_xxxxxyyzz*M_xxxyz + D_xxxxxyz*M_xxx + D_xxxxxyzz*M_xxxz + &
      D_xxxxxyzzz*M_xxxzz + D_xxxxyyyyz*M_xxyyy + D_xxxxyyyz*M_xxyy + &
      D_xxxxyyyzz*M_xxyyz + D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz + &
      D_xxxxyyzzz*M_xxyzz + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + &
      D_xxxxyzzz*M_xxzz + D_xxxxyzzzz*M_xxzzz + D_xxxyyyyyz*M_xyyyy + &
      D_xxxyyyyz*M_xyyy + D_xxxyyyyzz*M_xyyyz + D_xxxyyyz*M_xyy + &
      D_xxxyyyzz*M_xyyz + D_xxxyyyzzz*M_xyyzz + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyyzzz*M_xyzz + D_xxxyyzzzz*M_xyzzz + &
      D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxxyzzzz*M_xzzz &
      + D_xxxyzzzzz*M_xzzzz + D_xxyyyyyyz*M_yyyyy + D_xxyyyyyz*M_yyyy + &
      D_xxyyyyyzz*M_yyyyz + D_xxyyyyz*M_yyy + D_xxyyyyzz*M_yyyz + &
      D_xxyyyyzzz*M_yyyzz + D_xxyyyz*M_yy + D_xxyyyzz*M_yyz + &
      D_xxyyyzzz*M_yyzz + D_xxyyyzzzz*M_yyzzz + D_xxyyz*M_y + D_xxyyzz* &
      M_yz + D_xxyyzzz*M_yzz + D_xxyyzzzz*M_yzzz + D_xxyyzzzzz*M_yzzzz &
      + D_xxyz*M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz + &
      D_xxyzzzzz*M_zzzz + D_xxyzzzzzz*M_zzzzz
    D_xxzzzzzzz = -(D_xxxxzzzzz + D_xxyyzzzzz)
    L_xx        = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxxx*M_xxxxxx + D_xxxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxxy*M_xxxxxxy + D_xxxxxxxxz*M_xxxxxxz + D_xxxxxxxy* &
      M_xxxxxy + D_xxxxxxxyy*M_xxxxxyy + D_xxxxxxxyz*M_xxxxxyz + &
      D_xxxxxxxz*M_xxxxxz + D_xxxxxxxzz*M_xxxxxzz + D_xxxxxxy*M_xxxxy + &
      D_xxxxxxyy*M_xxxxyy + D_xxxxxxyyy*M_xxxxyyy + D_xxxxxxyyz* &
      M_xxxxyyz + D_xxxxxxyz*M_xxxxyz + D_xxxxxxyzz*M_xxxxyzz + &
      D_xxxxxxz*M_xxxxz + D_xxxxxxzz*M_xxxxzz + D_xxxxxxzzz*M_xxxxzzz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyyy*M_xxxyyy + &
      D_xxxxxyyyy*M_xxxyyyy + D_xxxxxyyyz*M_xxxyyyz + D_xxxxxyyz* &
      M_xxxyyz + D_xxxxxyyzz*M_xxxyyzz + D_xxxxxyz*M_xxxyz + D_xxxxxyzz &
      *M_xxxyzz + D_xxxxxyzzz*M_xxxyzzz + D_xxxxxz*M_xxxz + D_xxxxxzz* &
      M_xxxzz + D_xxxxxzzz*M_xxxzzz + D_xxxxxzzzz*M_xxxzzzz + D_xxxxy* &
      M_xxy + D_xxxxyy*M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyyy*M_xxyyyy &
      + D_xxxxyyyyy*M_xxyyyyy + D_xxxxyyyyz*M_xxyyyyz + D_xxxxyyyz* &
      M_xxyyyz + D_xxxxyyyzz*M_xxyyyzz + D_xxxxyyz*M_xxyyz + D_xxxxyyzz &
      *M_xxyyzz + D_xxxxyyzzz*M_xxyyzzz + D_xxxxyz*M_xxyz + D_xxxxyzz* &
      M_xxyzz + D_xxxxyzzz*M_xxyzzz + D_xxxxyzzzz*M_xxyzzzz + D_xxxxz* &
      M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz*M_xxzzz + D_xxxxzzzz*M_xxzzzz &
      + D_xxxxzzzzz*M_xxzzzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy* &
      M_xyyy + D_xxxyyyy*M_xyyyy + D_xxxyyyyy*M_xyyyyy + D_xxxyyyyyy* &
      M_xyyyyyy + D_xxxyyyyyz*M_xyyyyyz + D_xxxyyyyz*M_xyyyyz + &
      D_xxxyyyyzz*M_xyyyyzz + D_xxxyyyz*M_xyyyz + D_xxxyyyzz*M_xyyyzz + &
      D_xxxyyyzzz*M_xyyyzzz + D_xxxyyz*M_xyyz + D_xxxyyzz*M_xyyzz + &
      D_xxxyyzzz*M_xyyzzz + D_xxxyyzzzz*M_xyyzzzz + D_xxxyz*M_xyz + &
      D_xxxyzz*M_xyzz + D_xxxyzzz*M_xyzzz + D_xxxyzzzz*M_xyzzzz + &
      D_xxxyzzzzz*M_xyzzzzz + D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz* &
      M_xzzz + D_xxxzzzz*M_xzzzz + D_xxxzzzzz*M_xzzzzz + D_xxxzzzzzz* &
      M_xzzzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + D_xxyyyy* &
      M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyyy*M_yyyyyy + D_xxyyyyyyy* &
      M_yyyyyyy + D_xxyyyyyyz*M_yyyyyyz + D_xxyyyyyz*M_yyyyyz + &
      D_xxyyyyyzz*M_yyyyyzz + D_xxyyyyz*M_yyyyz + D_xxyyyyzz*M_yyyyzz + &
      D_xxyyyyzzz*M_yyyyzzz + D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + &
      D_xxyyyzzz*M_yyyzzz + D_xxyyyzzzz*M_yyyzzzz + D_xxyyz*M_yyz + &
      D_xxyyzz*M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyyzzzz*M_yyzzzz + &
      D_xxyyzzzzz*M_yyzzzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz* &
      M_yzzz + D_xxyzzzz*M_yzzzz + D_xxyzzzzz*M_yzzzzz + D_xxyzzzzzz* &
      M_yzzzzzz + D_xxz*M_z + D_xxzz*M_zz + D_xxzzz*M_zzz + D_xxzzzz* &
      M_zzzz + D_xxzzzzz*M_zzzzz + D_xxzzzzzz*M_zzzzzz + D_xxzzzzzzz* &
      M_zzzzzzz
    L_xxz       = D_xxxxxxxxz*M_xxxxxx + D_xxxxxxxyz*M_xxxxxy + D_xxxxxxxz*M_xxxxx + &
      D_xxxxxxxzz*M_xxxxxz + D_xxxxxxyyz*M_xxxxyy + D_xxxxxxyz*M_xxxxy &
      + D_xxxxxxyzz*M_xxxxyz + D_xxxxxxz*M_xxxx + D_xxxxxxzz*M_xxxxz + &
      D_xxxxxxzzz*M_xxxxzz + D_xxxxxyyyz*M_xxxyyy + D_xxxxxyyz*M_xxxyy &
      + D_xxxxxyyzz*M_xxxyyz + D_xxxxxyz*M_xxxy + D_xxxxxyzz*M_xxxyz + &
      D_xxxxxyzzz*M_xxxyzz + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + &
      D_xxxxxzzz*M_xxxzz + D_xxxxxzzzz*M_xxxzzz + D_xxxxyyyyz*M_xxyyyy &
      + D_xxxxyyyz*M_xxyyy + D_xxxxyyyzz*M_xxyyyz + D_xxxxyyz*M_xxyy + &
      D_xxxxyyzz*M_xxyyz + D_xxxxyyzzz*M_xxyyzz + D_xxxxyz*M_xxy + &
      D_xxxxyzz*M_xxyz + D_xxxxyzzz*M_xxyzz + D_xxxxyzzzz*M_xxyzzz + &
      D_xxxxz*M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxxzzzz* &
      M_xxzzz + D_xxxxzzzzz*M_xxzzzz + D_xxxyyyyyz*M_xyyyyy + &
      D_xxxyyyyz*M_xyyyy + D_xxxyyyyzz*M_xyyyyz + D_xxxyyyz*M_xyyy + &
      D_xxxyyyzz*M_xyyyz + D_xxxyyyzzz*M_xyyyzz + D_xxxyyz*M_xyy + &
      D_xxxyyzz*M_xyyz + D_xxxyyzzz*M_xyyzz + D_xxxyyzzzz*M_xyyzzz + &
      D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxyzzz*M_xyzz + D_xxxyzzzz* &
      M_xyzzz + D_xxxyzzzzz*M_xyzzzz + D_xxxz*M_x + D_xxxzz*M_xz + &
      D_xxxzzz*M_xzz + D_xxxzzzz*M_xzzz + D_xxxzzzzz*M_xzzzz + &
      D_xxxzzzzzz*M_xzzzzz + D_xxyyyyyyz*M_yyyyyy + D_xxyyyyyz*M_yyyyy &
      + D_xxyyyyyzz*M_yyyyyz + D_xxyyyyz*M_yyyy + D_xxyyyyzz*M_yyyyz + &
      D_xxyyyyzzz*M_yyyyzz + D_xxyyyz*M_yyy + D_xxyyyzz*M_yyyz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyyzzzz*M_yyyzzz + D_xxyyz*M_yy + &
      D_xxyyzz*M_yyz + D_xxyyzzz*M_yyzz + D_xxyyzzzz*M_yyzzz + &
      D_xxyyzzzzz*M_yyzzzz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz &
      + D_xxyzzzz*M_yzzz + D_xxyzzzzz*M_yzzzz + D_xxyzzzzzz*M_yzzzzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + &
      D_xxzzzzz*M_zzzz + D_xxzzzzzz*M_zzzzz + D_xxzzzzzzz*M_zzzzzz
    D_xyyyyyyyy = v153*v154
    L_xyyyyyyyy = D_xyyyyyyyy*M_0
    D_xyyyyyyyz = v140*(v141 - 91.0d0*v64 - 221.0d0*v68 + 273.0d0*v69)
    L_xyyyyyyy  = D_xxyyyyyyy*M_x + D_xyyyyyyy*M_0 + D_xyyyyyyyy*M_y + D_xyyyyyyyz*M_z
    L_xyyyyyyyz = D_xyyyyyyyz*M_0
    D_xyyyyyyzz = -(D_xxxyyyyyy + D_xyyyyyyyy)
    L_xyyyyyy   = D_xxxyyyyyy*M_xx + D_xxyyyyyy*M_x + D_xxyyyyyyy*M_xy + D_xxyyyyyyz*M_xz &
      + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyyy*M_yy + D_xyyyyyyyz &
      *M_yz + D_xyyyyyyz*M_z + D_xyyyyyyzz*M_zz
    L_xyyyyyyz  = D_xxyyyyyyz*M_x + D_xyyyyyyyz*M_y + D_xyyyyyyz*M_0 + D_xyyyyyyzz*M_z
    D_xyyyyyzzz = -(D_xxxyyyyyz + D_xyyyyyyyz)
    L_xyyyyy    = D_xxxxyyyyy*M_xxx + D_xxxyyyyy*M_xx + D_xxxyyyyyy*M_xxy + D_xxxyyyyyz* &
      M_xxz + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyyy*M_xyy + &
      D_xxyyyyyyz*M_xyz + D_xxyyyyyz*M_xz + D_xxyyyyyzz*M_xzz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyy*M_yy + D_xyyyyyyyy* &
      M_yyy + D_xyyyyyyyz*M_yyz + D_xyyyyyyz*M_yz + D_xyyyyyyzz*M_yzz + &
      D_xyyyyyz*M_z + D_xyyyyyzz*M_zz + D_xyyyyyzzz*M_zzz
    L_xyyyyyz   = D_xxxyyyyyz*M_xx + D_xxyyyyyyz*M_xy + D_xxyyyyyz*M_x + D_xxyyyyyzz*M_xz &
      + D_xyyyyyyyz*M_yy + D_xyyyyyyz*M_y + D_xyyyyyyzz*M_yz + &
      D_xyyyyyz*M_0 + D_xyyyyyzz*M_z + D_xyyyyyzzz*M_zz
    D_xyyyyzzzz = -(D_xxxyyyyzz + D_xyyyyyyzz)
    L_xyyyy     = D_xxxxxyyyy*M_xxxx + D_xxxxyyyy*M_xxx + D_xxxxyyyyy*M_xxxy + D_xxxxyyyyz &
      *M_xxxz + D_xxxyyyy*M_xx + D_xxxyyyyy*M_xxy + D_xxxyyyyyy*M_xxyy &
      + D_xxxyyyyyz*M_xxyz + D_xxxyyyyz*M_xxz + D_xxxyyyyzz*M_xxzz + &
      D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyy*M_xyy + D_xxyyyyyyy* &
      M_xyyy + D_xxyyyyyyz*M_xyyz + D_xxyyyyyz*M_xyz + D_xxyyyyyzz* &
      M_xyzz + D_xxyyyyz*M_xz + D_xxyyyyzz*M_xzz + D_xxyyyyzzz*M_xzzz + &
      D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyyy*M_yyy + &
      D_xyyyyyyyy*M_yyyy + D_xyyyyyyyz*M_yyyz + D_xyyyyyyz*M_yyz + &
      D_xyyyyyyzz*M_yyzz + D_xyyyyyz*M_yz + D_xyyyyyzz*M_yzz + &
      D_xyyyyyzzz*M_yzzz + D_xyyyyz*M_z + D_xyyyyzz*M_zz + D_xyyyyzzz* &
      M_zzz + D_xyyyyzzzz*M_zzzz
    L_xyyyyz    = D_xxxxyyyyz*M_xxx + D_xxxyyyyyz*M_xxy + D_xxxyyyyz*M_xx + D_xxxyyyyzz* &
      M_xxz + D_xxyyyyyyz*M_xyy + D_xxyyyyyz*M_xy + D_xxyyyyyzz*M_xyz + &
      D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + D_xxyyyyzzz*M_xzz + D_xyyyyyyyz &
      *M_yyy + D_xyyyyyyz*M_yy + D_xyyyyyyzz*M_yyz + D_xyyyyyz*M_y + &
      D_xyyyyyzz*M_yz + D_xyyyyyzzz*M_yzz + D_xyyyyz*M_0 + D_xyyyyzz* &
      M_z + D_xyyyyzzz*M_zz + D_xyyyyzzzz*M_zzz
    D_xyyyzzzzz = -(D_xxxyyyzzz + D_xyyyyyzzz)
    L_xyyy      = D_xxxxxxyyy*M_xxxxx + D_xxxxxyyy*M_xxxx + D_xxxxxyyyy*M_xxxxy + &
      D_xxxxxyyyz*M_xxxxz + D_xxxxyyy*M_xxx + D_xxxxyyyy*M_xxxy + &
      D_xxxxyyyyy*M_xxxyy + D_xxxxyyyyz*M_xxxyz + D_xxxxyyyz*M_xxxz + &
      D_xxxxyyyzz*M_xxxzz + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + &
      D_xxxyyyyy*M_xxyy + D_xxxyyyyyy*M_xxyyy + D_xxxyyyyyz*M_xxyyz + &
      D_xxxyyyyz*M_xxyz + D_xxxyyyyzz*M_xxyzz + D_xxxyyyz*M_xxz + &
      D_xxxyyyzz*M_xxzz + D_xxxyyyzzz*M_xxzzz + D_xxyyy*M_x + D_xxyyyy* &
      M_xy + D_xxyyyyy*M_xyy + D_xxyyyyyy*M_xyyy + D_xxyyyyyyy*M_xyyyy &
      + D_xxyyyyyyz*M_xyyyz + D_xxyyyyyz*M_xyyz + D_xxyyyyyzz*M_xyyzz + &
      D_xxyyyyz*M_xyz + D_xxyyyyzz*M_xyzz + D_xxyyyyzzz*M_xyzzz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xxyyyzzz*M_xzzz + D_xxyyyzzzz &
      *M_xzzzz + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyyy* &
      M_yyy + D_xyyyyyyy*M_yyyy + D_xyyyyyyyy*M_yyyyy + D_xyyyyyyyz* &
      M_yyyyz + D_xyyyyyyz*M_yyyz + D_xyyyyyyzz*M_yyyzz + D_xyyyyyz* &
      M_yyz + D_xyyyyyzz*M_yyzz + D_xyyyyyzzz*M_yyzzz + D_xyyyyz*M_yz + &
      D_xyyyyzz*M_yzz + D_xyyyyzzz*M_yzzz + D_xyyyyzzzz*M_yzzzz + &
      D_xyyyz*M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz + D_xyyyzzzz*M_zzzz &
      + D_xyyyzzzzz*M_zzzzz
    L_xyyyz     = D_xxxxxyyyz*M_xxxx + D_xxxxyyyyz*M_xxxy + D_xxxxyyyz*M_xxx + D_xxxxyyyzz &
      *M_xxxz + D_xxxyyyyyz*M_xxyy + D_xxxyyyyz*M_xxy + D_xxxyyyyzz* &
      M_xxyz + D_xxxyyyz*M_xx + D_xxxyyyzz*M_xxz + D_xxxyyyzzz*M_xxzz + &
      D_xxyyyyyyz*M_xyyy + D_xxyyyyyz*M_xyy + D_xxyyyyyzz*M_xyyz + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyyzzz*M_xyzz + D_xxyyyz &
      *M_x + D_xxyyyzz*M_xz + D_xxyyyzzz*M_xzz + D_xxyyyzzzz*M_xzzz + &
      D_xyyyyyyyz*M_yyyy + D_xyyyyyyz*M_yyy + D_xyyyyyyzz*M_yyyz + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyyzzz*M_yyzz + D_xyyyyz &
      *M_y + D_xyyyyzz*M_yz + D_xyyyyzzz*M_yzz + D_xyyyyzzzz*M_yzzz + &
      D_xyyyz*M_0 + D_xyyyzz*M_z + D_xyyyzzz*M_zz + D_xyyyzzzz*M_zzz + &
      D_xyyyzzzzz*M_zzzz
    D_xyyzzzzzz = -(D_xxxyyzzzz + D_xyyyyzzzz)
    L_xyy       = D_xxxxxxxyy*M_xxxxxx + D_xxxxxxyy*M_xxxxx + D_xxxxxxyyy*M_xxxxxy + &
      D_xxxxxxyyz*M_xxxxxz + D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + &
      D_xxxxxyyyy*M_xxxxyy + D_xxxxxyyyz*M_xxxxyz + D_xxxxxyyz*M_xxxxz &
      + D_xxxxxyyzz*M_xxxxzz + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + &
      D_xxxxyyyy*M_xxxyy + D_xxxxyyyyy*M_xxxyyy + D_xxxxyyyyz*M_xxxyyz &
      + D_xxxxyyyz*M_xxxyz + D_xxxxyyyzz*M_xxxyzz + D_xxxxyyz*M_xxxz + &
      D_xxxxyyzz*M_xxxzz + D_xxxxyyzzz*M_xxxzzz + D_xxxyy*M_xx + &
      D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyyy*M_xxyyy + &
      D_xxxyyyyyy*M_xxyyyy + D_xxxyyyyyz*M_xxyyyz + D_xxxyyyyz*M_xxyyz &
      + D_xxxyyyyzz*M_xxyyzz + D_xxxyyyz*M_xxyz + D_xxxyyyzz*M_xxyzz + &
      D_xxxyyyzzz*M_xxyzzz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + &
      D_xxxyyzzz*M_xxzzz + D_xxxyyzzzz*M_xxzzzz + D_xxyy*M_x + D_xxyyy* &
      M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + D_xxyyyyyy*M_xyyyy + &
      D_xxyyyyyyy*M_xyyyyy + D_xxyyyyyyz*M_xyyyyz + D_xxyyyyyz*M_xyyyz &
      + D_xxyyyyyzz*M_xyyyzz + D_xxyyyyz*M_xyyz + D_xxyyyyzz*M_xyyzz + &
      D_xxyyyyzzz*M_xyyzzz + D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + &
      D_xxyyyzzz*M_xyzzz + D_xxyyyzzzz*M_xyzzzz + D_xxyyz*M_xz + &
      D_xxyyzz*M_xzz + D_xxyyzzz*M_xzzz + D_xxyyzzzz*M_xzzzz + &
      D_xxyyzzzzz*M_xzzzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyyy*M_yyyyy + &
      D_xyyyyyyyy*M_yyyyyy + D_xyyyyyyyz*M_yyyyyz + D_xyyyyyyz*M_yyyyz &
      + D_xyyyyyyzz*M_yyyyzz + D_xyyyyyz*M_yyyz + D_xyyyyyzz*M_yyyzz + &
      D_xyyyyyzzz*M_yyyzzz + D_xyyyyz*M_yyz + D_xyyyyzz*M_yyzz + &
      D_xyyyyzzz*M_yyzzz + D_xyyyyzzzz*M_yyzzzz + D_xyyyz*M_yz + &
      D_xyyyzz*M_yzz + D_xyyyzzz*M_yzzz + D_xyyyzzzz*M_yzzzz + &
      D_xyyyzzzzz*M_yzzzzz + D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz &
      + D_xyyzzzz*M_zzzz + D_xyyzzzzz*M_zzzzz + D_xyyzzzzzz*M_zzzzzz
    L_xyyz      = D_xxxxxxyyz*M_xxxxx + D_xxxxxyyyz*M_xxxxy + D_xxxxxyyz*M_xxxx + &
      D_xxxxxyyzz*M_xxxxz + D_xxxxyyyyz*M_xxxyy + D_xxxxyyyz*M_xxxy + &
      D_xxxxyyyzz*M_xxxyz + D_xxxxyyz*M_xxx + D_xxxxyyzz*M_xxxz + &
      D_xxxxyyzzz*M_xxxzz + D_xxxyyyyyz*M_xxyyy + D_xxxyyyyz*M_xxyy + &
      D_xxxyyyyzz*M_xxyyz + D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz + &
      D_xxxyyyzzz*M_xxyzz + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + &
      D_xxxyyzzz*M_xxzz + D_xxxyyzzzz*M_xxzzz + D_xxyyyyyyz*M_xyyyy + &
      D_xxyyyyyz*M_xyyy + D_xxyyyyyzz*M_xyyyz + D_xxyyyyz*M_xyy + &
      D_xxyyyyzz*M_xyyz + D_xxyyyyzzz*M_xyyzz + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyyzzz*M_xyzz + D_xxyyyzzzz*M_xyzzz + &
      D_xxyyz*M_x + D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xxyyzzzz*M_xzzz &
      + D_xxyyzzzzz*M_xzzzz + D_xyyyyyyyz*M_yyyyy + D_xyyyyyyz*M_yyyy + &
      D_xyyyyyyzz*M_yyyyz + D_xyyyyyz*M_yyy + D_xyyyyyzz*M_yyyz + &
      D_xyyyyyzzz*M_yyyzz + D_xyyyyz*M_yy + D_xyyyyzz*M_yyz + &
      D_xyyyyzzz*M_yyzz + D_xyyyyzzzz*M_yyzzz + D_xyyyz*M_y + D_xyyyzz* &
      M_yz + D_xyyyzzz*M_yzz + D_xyyyzzzz*M_yzzz + D_xyyyzzzzz*M_yzzzz &
      + D_xyyz*M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz + &
      D_xyyzzzzz*M_zzzz + D_xyyzzzzzz*M_zzzzz
    D_xyzzzzzzz = -(D_xxxyzzzzz + D_xyyyzzzzz)
    L_xy        = D_xxxxxxxxy*M_xxxxxxx + D_xxxxxxxy*M_xxxxxx + D_xxxxxxxyy*M_xxxxxxy + &
      D_xxxxxxxyz*M_xxxxxxz + D_xxxxxxy*M_xxxxx + D_xxxxxxyy*M_xxxxxy + &
      D_xxxxxxyyy*M_xxxxxyy + D_xxxxxxyyz*M_xxxxxyz + D_xxxxxxyz* &
      M_xxxxxz + D_xxxxxxyzz*M_xxxxxzz + D_xxxxxy*M_xxxx + D_xxxxxyy* &
      M_xxxxy + D_xxxxxyyy*M_xxxxyy + D_xxxxxyyyy*M_xxxxyyy + &
      D_xxxxxyyyz*M_xxxxyyz + D_xxxxxyyz*M_xxxxyz + D_xxxxxyyzz* &
      M_xxxxyzz + D_xxxxxyz*M_xxxxz + D_xxxxxyzz*M_xxxxzz + D_xxxxxyzzz &
      *M_xxxxzzz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy*M_xxxyy &
      + D_xxxxyyyy*M_xxxyyy + D_xxxxyyyyy*M_xxxyyyy + D_xxxxyyyyz* &
      M_xxxyyyz + D_xxxxyyyz*M_xxxyyz + D_xxxxyyyzz*M_xxxyyzz + &
      D_xxxxyyz*M_xxxyz + D_xxxxyyzz*M_xxxyzz + D_xxxxyyzzz*M_xxxyzzz + &
      D_xxxxyz*M_xxxz + D_xxxxyzz*M_xxxzz + D_xxxxyzzz*M_xxxzzz + &
      D_xxxxyzzzz*M_xxxzzzz + D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyy* &
      M_xxyy + D_xxxyyyy*M_xxyyy + D_xxxyyyyy*M_xxyyyy + D_xxxyyyyyy* &
      M_xxyyyyy + D_xxxyyyyyz*M_xxyyyyz + D_xxxyyyyz*M_xxyyyz + &
      D_xxxyyyyzz*M_xxyyyzz + D_xxxyyyz*M_xxyyz + D_xxxyyyzz*M_xxyyzz + &
      D_xxxyyyzzz*M_xxyyzzz + D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + &
      D_xxxyyzzz*M_xxyzzz + D_xxxyyzzzz*M_xxyzzzz + D_xxxyz*M_xxz + &
      D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxxyzzzz*M_xxzzzz + &
      D_xxxyzzzzz*M_xxzzzzz + D_xxy*M_x + D_xxyy*M_xy + D_xxyyy*M_xyy + &
      D_xxyyyy*M_xyyy + D_xxyyyyy*M_xyyyy + D_xxyyyyyy*M_xyyyyy + &
      D_xxyyyyyyy*M_xyyyyyy + D_xxyyyyyyz*M_xyyyyyz + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyyyyzz*M_xyyyyzz + D_xxyyyyz*M_xyyyz + D_xxyyyyzz &
      *M_xyyyzz + D_xxyyyyzzz*M_xyyyzzz + D_xxyyyz*M_xyyz + D_xxyyyzz* &
      M_xyyzz + D_xxyyyzzz*M_xyyzzz + D_xxyyyzzzz*M_xyyzzzz + D_xxyyz* &
      M_xyz + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyyzzzz*M_xyzzzz &
      + D_xxyyzzzzz*M_xyzzzzz + D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz* &
      M_xzzz + D_xxyzzzz*M_xzzzz + D_xxyzzzzz*M_xzzzzz + D_xxyzzzzzz* &
      M_xzzzzzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + &
      D_xyyyyy*M_yyyy + D_xyyyyyy*M_yyyyy + D_xyyyyyyy*M_yyyyyy + &
      D_xyyyyyyyy*M_yyyyyyy + D_xyyyyyyyz*M_yyyyyyz + D_xyyyyyyz* &
      M_yyyyyz + D_xyyyyyyzz*M_yyyyyzz + D_xyyyyyz*M_yyyyz + D_xyyyyyzz &
      *M_yyyyzz + D_xyyyyyzzz*M_yyyyzzz + D_xyyyyz*M_yyyz + D_xyyyyzz* &
      M_yyyzz + D_xyyyyzzz*M_yyyzzz + D_xyyyyzzzz*M_yyyzzzz + D_xyyyz* &
      M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz*M_yyzzz + D_xyyyzzzz*M_yyzzzz &
      + D_xyyyzzzzz*M_yyzzzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz* &
      M_yzzz + D_xyyzzzz*M_yzzzz + D_xyyzzzzz*M_yzzzzz + D_xyyzzzzzz* &
      M_yzzzzzz + D_xyz*M_z + D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz* &
      M_zzzz + D_xyzzzzz*M_zzzzz + D_xyzzzzzz*M_zzzzzz + D_xyzzzzzzz* &
      M_zzzzzzz
    L_xyz       = D_xxxxxxxyz*M_xxxxxx + D_xxxxxxyyz*M_xxxxxy + D_xxxxxxyz*M_xxxxx + &
      D_xxxxxxyzz*M_xxxxxz + D_xxxxxyyyz*M_xxxxyy + D_xxxxxyyz*M_xxxxy &
      + D_xxxxxyyzz*M_xxxxyz + D_xxxxxyz*M_xxxx + D_xxxxxyzz*M_xxxxz + &
      D_xxxxxyzzz*M_xxxxzz + D_xxxxyyyyz*M_xxxyyy + D_xxxxyyyz*M_xxxyy &
      + D_xxxxyyyzz*M_xxxyyz + D_xxxxyyz*M_xxxy + D_xxxxyyzz*M_xxxyz + &
      D_xxxxyyzzz*M_xxxyzz + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + &
      D_xxxxyzzz*M_xxxzz + D_xxxxyzzzz*M_xxxzzz + D_xxxyyyyyz*M_xxyyyy &
      + D_xxxyyyyz*M_xxyyy + D_xxxyyyyzz*M_xxyyyz + D_xxxyyyz*M_xxyy + &
      D_xxxyyyzz*M_xxyyz + D_xxxyyyzzz*M_xxyyzz + D_xxxyyz*M_xxy + &
      D_xxxyyzz*M_xxyz + D_xxxyyzzz*M_xxyzz + D_xxxyyzzzz*M_xxyzzz + &
      D_xxxyz*M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxxyzzzz* &
      M_xxzzz + D_xxxyzzzzz*M_xxzzzz + D_xxyyyyyyz*M_xyyyyy + &
      D_xxyyyyyz*M_xyyyy + D_xxyyyyyzz*M_xyyyyz + D_xxyyyyz*M_xyyy + &
      D_xxyyyyzz*M_xyyyz + D_xxyyyyzzz*M_xyyyzz + D_xxyyyz*M_xyy + &
      D_xxyyyzz*M_xyyz + D_xxyyyzzz*M_xyyzz + D_xxyyyzzzz*M_xyyzzz + &
      D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyyzzz*M_xyzz + D_xxyyzzzz* &
      M_xyzzz + D_xxyyzzzzz*M_xyzzzz + D_xxyz*M_x + D_xxyzz*M_xz + &
      D_xxyzzz*M_xzz + D_xxyzzzz*M_xzzz + D_xxyzzzzz*M_xzzzz + &
      D_xxyzzzzzz*M_xzzzzz + D_xyyyyyyyz*M_yyyyyy + D_xyyyyyyz*M_yyyyy &
      + D_xyyyyyyzz*M_yyyyyz + D_xyyyyyz*M_yyyy + D_xyyyyyzz*M_yyyyz + &
      D_xyyyyyzzz*M_yyyyzz + D_xyyyyz*M_yyy + D_xyyyyzz*M_yyyz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyyzzzz*M_yyyzzz + D_xyyyz*M_yy + &
      D_xyyyzz*M_yyz + D_xyyyzzz*M_yyzz + D_xyyyzzzz*M_yyzzz + &
      D_xyyyzzzzz*M_yyzzzz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz &
      + D_xyyzzzz*M_yzzz + D_xyyzzzzz*M_yzzzz + D_xyyzzzzzz*M_yzzzzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + &
      D_xyzzzzz*M_zzzz + D_xyzzzzzz*M_zzzzz + D_xyzzzzzzz*M_zzzzzz
    D_xzzzzzzzz = -(D_xxxzzzzzz + D_xyyzzzzzz)
    L_x         = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxxx*M_xxxxxxxx + D_xxxxxxxxy*M_xxxxxxxy + D_xxxxxxxxz* &
      M_xxxxxxxz + D_xxxxxxxy*M_xxxxxxy + D_xxxxxxxyy*M_xxxxxxyy + &
      D_xxxxxxxyz*M_xxxxxxyz + D_xxxxxxxz*M_xxxxxxz + D_xxxxxxxzz* &
      M_xxxxxxzz + D_xxxxxxy*M_xxxxxy + D_xxxxxxyy*M_xxxxxyy + &
      D_xxxxxxyyy*M_xxxxxyyy + D_xxxxxxyyz*M_xxxxxyyz + D_xxxxxxyz* &
      M_xxxxxyz + D_xxxxxxyzz*M_xxxxxyzz + D_xxxxxxz*M_xxxxxz + &
      D_xxxxxxzz*M_xxxxxzz + D_xxxxxxzzz*M_xxxxxzzz + D_xxxxxy*M_xxxxy &
      + D_xxxxxyy*M_xxxxyy + D_xxxxxyyy*M_xxxxyyy + D_xxxxxyyyy* &
      M_xxxxyyyy + D_xxxxxyyyz*M_xxxxyyyz + D_xxxxxyyz*M_xxxxyyz + &
      D_xxxxxyyzz*M_xxxxyyzz + D_xxxxxyz*M_xxxxyz + D_xxxxxyzz* &
      M_xxxxyzz + D_xxxxxyzzz*M_xxxxyzzz + D_xxxxxz*M_xxxxz + D_xxxxxzz &
      *M_xxxxzz + D_xxxxxzzz*M_xxxxzzz + D_xxxxxzzzz*M_xxxxzzzz + &
      D_xxxxy*M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + &
      D_xxxxyyyy*M_xxxyyyy + D_xxxxyyyyy*M_xxxyyyyy + D_xxxxyyyyz* &
      M_xxxyyyyz + D_xxxxyyyz*M_xxxyyyz + D_xxxxyyyzz*M_xxxyyyzz + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyyzz + D_xxxxyyzzz* &
      M_xxxyyzzz + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + D_xxxxyzzz* &
      M_xxxyzzz + D_xxxxyzzzz*M_xxxyzzzz + D_xxxxz*M_xxxz + D_xxxxzz* &
      M_xxxzz + D_xxxxzzz*M_xxxzzz + D_xxxxzzzz*M_xxxzzzz + D_xxxxzzzzz &
      *M_xxxzzzzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy*M_xxyyy + &
      D_xxxyyyy*M_xxyyyy + D_xxxyyyyy*M_xxyyyyy + D_xxxyyyyyy* &
      M_xxyyyyyy + D_xxxyyyyyz*M_xxyyyyyz + D_xxxyyyyz*M_xxyyyyz + &
      D_xxxyyyyzz*M_xxyyyyzz + D_xxxyyyz*M_xxyyyz + D_xxxyyyzz* &
      M_xxyyyzz + D_xxxyyyzzz*M_xxyyyzzz + D_xxxyyz*M_xxyyz + D_xxxyyzz &
      *M_xxyyzz + D_xxxyyzzz*M_xxyyzzz + D_xxxyyzzzz*M_xxyyzzzz + &
      D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + &
      D_xxxyzzzz*M_xxyzzzz + D_xxxyzzzzz*M_xxyzzzzz + D_xxxz*M_xxz + &
      D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxxzzzzz*M_xxzzzzz + D_xxxzzzzzz*M_xxzzzzzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyyy* &
      M_xyyyyy + D_xxyyyyyy*M_xyyyyyy + D_xxyyyyyyy*M_xyyyyyyy + &
      D_xxyyyyyyz*M_xyyyyyyz + D_xxyyyyyz*M_xyyyyyz + D_xxyyyyyzz* &
      M_xyyyyyzz + D_xxyyyyz*M_xyyyyz + D_xxyyyyzz*M_xyyyyzz + &
      D_xxyyyyzzz*M_xyyyyzzz + D_xxyyyz*M_xyyyz + D_xxyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyyzzz + D_xxyyyzzzz*M_xyyyzzzz + D_xxyyz*M_xyyz + &
      D_xxyyzz*M_xyyzz + D_xxyyzzz*M_xyyzzz + D_xxyyzzzz*M_xyyzzzz + &
      D_xxyyzzzzz*M_xyyzzzzz + D_xxyz*M_xyz + D_xxyzz*M_xyzz + D_xxyzzz &
      *M_xyzzz + D_xxyzzzz*M_xyzzzz + D_xxyzzzzz*M_xyzzzzz + &
      D_xxyzzzzzz*M_xyzzzzzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz* &
      M_xzzz + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xxzzzzzz* &
      M_xzzzzzz + D_xxzzzzzzz*M_xzzzzzzz + D_xy*M_y + D_xyy*M_yy + &
      D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + D_xyyyyyy* &
      M_yyyyyy + D_xyyyyyyy*M_yyyyyyy + D_xyyyyyyyy*M_yyyyyyyy + &
      D_xyyyyyyyz*M_yyyyyyyz + D_xyyyyyyz*M_yyyyyyz + D_xyyyyyyzz* &
      M_yyyyyyzz + D_xyyyyyz*M_yyyyyz + D_xyyyyyzz*M_yyyyyzz + &
      D_xyyyyyzzz*M_yyyyyzzz + D_xyyyyz*M_yyyyz + D_xyyyyzz*M_yyyyzz + &
      D_xyyyyzzz*M_yyyyzzz + D_xyyyyzzzz*M_yyyyzzzz + D_xyyyz*M_yyyz + &
      D_xyyyzz*M_yyyzz + D_xyyyzzz*M_yyyzzz + D_xyyyzzzz*M_yyyzzzz + &
      D_xyyyzzzzz*M_yyyzzzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz &
      *M_yyzzz + D_xyyzzzz*M_yyzzzz + D_xyyzzzzz*M_yyzzzzz + &
      D_xyyzzzzzz*M_yyzzzzzz + D_xyz*M_yz + D_xyzz*M_yzz + D_xyzzz* &
      M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + D_xyzzzzzz* &
      M_yzzzzzz + D_xyzzzzzzz*M_yzzzzzzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + D_xzzzzzz* &
      M_zzzzzz + D_xzzzzzzz*M_zzzzzzz + D_xzzzzzzzz*M_zzzzzzzz
    L_xz        = D_xxxxxxxxz*M_xxxxxxx + D_xxxxxxxyz*M_xxxxxxy + D_xxxxxxxz*M_xxxxxx + &
      D_xxxxxxxzz*M_xxxxxxz + D_xxxxxxyyz*M_xxxxxyy + D_xxxxxxyz* &
      M_xxxxxy + D_xxxxxxyzz*M_xxxxxyz + D_xxxxxxz*M_xxxxx + D_xxxxxxzz &
      *M_xxxxxz + D_xxxxxxzzz*M_xxxxxzz + D_xxxxxyyyz*M_xxxxyyy + &
      D_xxxxxyyz*M_xxxxyy + D_xxxxxyyzz*M_xxxxyyz + D_xxxxxyz*M_xxxxy + &
      D_xxxxxyzz*M_xxxxyz + D_xxxxxyzzz*M_xxxxyzz + D_xxxxxz*M_xxxx + &
      D_xxxxxzz*M_xxxxz + D_xxxxxzzz*M_xxxxzz + D_xxxxxzzzz*M_xxxxzzz + &
      D_xxxxyyyyz*M_xxxyyyy + D_xxxxyyyz*M_xxxyyy + D_xxxxyyyzz* &
      M_xxxyyyz + D_xxxxyyz*M_xxxyy + D_xxxxyyzz*M_xxxyyz + D_xxxxyyzzz &
      *M_xxxyyzz + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz + D_xxxxyzzz* &
      M_xxxyzz + D_xxxxyzzzz*M_xxxyzzz + D_xxxxz*M_xxx + D_xxxxzz* &
      M_xxxz + D_xxxxzzz*M_xxxzz + D_xxxxzzzz*M_xxxzzz + D_xxxxzzzzz* &
      M_xxxzzzz + D_xxxyyyyyz*M_xxyyyyy + D_xxxyyyyz*M_xxyyyy + &
      D_xxxyyyyzz*M_xxyyyyz + D_xxxyyyz*M_xxyyy + D_xxxyyyzz*M_xxyyyz + &
      D_xxxyyyzzz*M_xxyyyzz + D_xxxyyz*M_xxyy + D_xxxyyzz*M_xxyyz + &
      D_xxxyyzzz*M_xxyyzz + D_xxxyyzzzz*M_xxyyzzz + D_xxxyz*M_xxy + &
      D_xxxyzz*M_xxyz + D_xxxyzzz*M_xxyzz + D_xxxyzzzz*M_xxyzzz + &
      D_xxxyzzzzz*M_xxyzzzz + D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxxzzz* &
      M_xxzz + D_xxxzzzz*M_xxzzz + D_xxxzzzzz*M_xxzzzz + D_xxxzzzzzz* &
      M_xxzzzzz + D_xxyyyyyyz*M_xyyyyyy + D_xxyyyyyz*M_xyyyyy + &
      D_xxyyyyyzz*M_xyyyyyz + D_xxyyyyz*M_xyyyy + D_xxyyyyzz*M_xyyyyz + &
      D_xxyyyyzzz*M_xyyyyzz + D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + &
      D_xxyyyzzz*M_xyyyzz + D_xxyyyzzzz*M_xyyyzzz + D_xxyyz*M_xyy + &
      D_xxyyzz*M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyyzzzz*M_xyyzzz + &
      D_xxyyzzzzz*M_xyyzzzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz* &
      M_xyzz + D_xxyzzzz*M_xyzzz + D_xxyzzzzz*M_xyzzzz + D_xxyzzzzzz* &
      M_xyzzzzz + D_xxz*M_x + D_xxzz*M_xz + D_xxzzz*M_xzz + D_xxzzzz* &
      M_xzzz + D_xxzzzzz*M_xzzzz + D_xxzzzzzz*M_xzzzzz + D_xxzzzzzzz* &
      M_xzzzzzz + D_xyyyyyyyz*M_yyyyyyy + D_xyyyyyyz*M_yyyyyy + &
      D_xyyyyyyzz*M_yyyyyyz + D_xyyyyyz*M_yyyyy + D_xyyyyyzz*M_yyyyyz + &
      D_xyyyyyzzz*M_yyyyyzz + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + &
      D_xyyyyzzz*M_yyyyzz + D_xyyyyzzzz*M_yyyyzzz + D_xyyyz*M_yyy + &
      D_xyyyzz*M_yyyz + D_xyyyzzz*M_yyyzz + D_xyyyzzzz*M_yyyzzz + &
      D_xyyyzzzzz*M_yyyzzzz + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyyzzz* &
      M_yyzz + D_xyyzzzz*M_yyzzz + D_xyyzzzzz*M_yyzzzz + D_xyyzzzzzz* &
      M_yyzzzzz + D_xyz*M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xyzzzz* &
      M_yzzz + D_xyzzzzz*M_yzzzz + D_xyzzzzzz*M_yzzzzz + D_xyzzzzzzz* &
      M_yzzzzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz + D_xzzzz*M_zzz + &
      D_xzzzzz*M_zzzz + D_xzzzzzz*M_zzzzz + D_xzzzzzzz*M_zzzzzz + &
      D_xzzzzzzzz*M_zzzzzzz
    D_yyyyyyyyy = v151*(v134 + 4620.0d0*v120 - 18018.0d0*v126 - 12155.0d0*v130 + 25740.0d0 &
      *v131)
    L_yyyyyyyyy = D_yyyyyyyyy*M_0
    D_yyyyyyyyz = v138*v154
    L_yyyyyyyy  = D_xyyyyyyyy*M_x + D_yyyyyyyy*M_0 + D_yyyyyyyyy*M_y + D_yyyyyyyyz*M_z
    L_yyyyyyyyz = D_yyyyyyyyz*M_0
    D_yyyyyyyzz = -(D_xxyyyyyyy + D_yyyyyyyyy)
    L_yyyyyyy   = D_xxyyyyyyy*M_xx + D_xyyyyyyy*M_x + D_xyyyyyyyy*M_xy + D_xyyyyyyyz*M_xz &
      + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyyy*M_yy + D_yyyyyyyyz &
      *M_yz + D_yyyyyyyz*M_z + D_yyyyyyyzz*M_zz
    L_yyyyyyyz  = D_xyyyyyyyz*M_x + D_yyyyyyyyz*M_y + D_yyyyyyyz*M_0 + D_yyyyyyyzz*M_z
    D_yyyyyyzzz = -(D_xxyyyyyyz + D_yyyyyyyyz)
    L_yyyyyy    = D_xxxyyyyyy*M_xxx + D_xxyyyyyy*M_xx + D_xxyyyyyyy*M_xxy + D_xxyyyyyyz* &
      M_xxz + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyyy*M_xyy + &
      D_xyyyyyyyz*M_xyz + D_xyyyyyyz*M_xz + D_xyyyyyyzz*M_xzz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*M_yy + D_yyyyyyyyy* &
      M_yyy + D_yyyyyyyyz*M_yyz + D_yyyyyyyz*M_yz + D_yyyyyyyzz*M_yzz + &
      D_yyyyyyz*M_z + D_yyyyyyzz*M_zz + D_yyyyyyzzz*M_zzz
    L_yyyyyyz   = D_xxyyyyyyz*M_xx + D_xyyyyyyyz*M_xy + D_xyyyyyyz*M_x + D_xyyyyyyzz*M_xz &
      + D_yyyyyyyyz*M_yy + D_yyyyyyyz*M_y + D_yyyyyyyzz*M_yz + &
      D_yyyyyyz*M_0 + D_yyyyyyzz*M_z + D_yyyyyyzzz*M_zz
    D_yyyyyzzzz = -(D_xxyyyyyzz + D_yyyyyyyzz)
    L_yyyyy     = D_xxxxyyyyy*M_xxxx + D_xxxyyyyy*M_xxx + D_xxxyyyyyy*M_xxxy + D_xxxyyyyyz &
      *M_xxxz + D_xxyyyyy*M_xx + D_xxyyyyyy*M_xxy + D_xxyyyyyyy*M_xxyy &
      + D_xxyyyyyyz*M_xxyz + D_xxyyyyyz*M_xxz + D_xxyyyyyzz*M_xxzz + &
      D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyy*M_xyy + D_xyyyyyyyy* &
      M_xyyy + D_xyyyyyyyz*M_xyyz + D_xyyyyyyz*M_xyz + D_xyyyyyyzz* &
      M_xyzz + D_xyyyyyz*M_xz + D_xyyyyyzz*M_xzz + D_xyyyyyzzz*M_xzzz + &
      D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyyy*M_yyy + &
      D_yyyyyyyyy*M_yyyy + D_yyyyyyyyz*M_yyyz + D_yyyyyyyz*M_yyz + &
      D_yyyyyyyzz*M_yyzz + D_yyyyyyz*M_yz + D_yyyyyyzz*M_yzz + &
      D_yyyyyyzzz*M_yzzz + D_yyyyyz*M_z + D_yyyyyzz*M_zz + D_yyyyyzzz* &
      M_zzz + D_yyyyyzzzz*M_zzzz
    L_yyyyyz    = D_xxxyyyyyz*M_xxx + D_xxyyyyyyz*M_xxy + D_xxyyyyyz*M_xx + D_xxyyyyyzz* &
      M_xxz + D_xyyyyyyyz*M_xyy + D_xyyyyyyz*M_xy + D_xyyyyyyzz*M_xyz + &
      D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + D_xyyyyyzzz*M_xzz + D_yyyyyyyyz &
      *M_yyy + D_yyyyyyyz*M_yy + D_yyyyyyyzz*M_yyz + D_yyyyyyz*M_y + &
      D_yyyyyyzz*M_yz + D_yyyyyyzzz*M_yzz + D_yyyyyz*M_0 + D_yyyyyzz* &
      M_z + D_yyyyyzzz*M_zz + D_yyyyyzzzz*M_zzz
    D_yyyyzzzzz = -(D_xxyyyyzzz + D_yyyyyyzzz)
    L_yyyy      = D_xxxxxyyyy*M_xxxxx + D_xxxxyyyy*M_xxxx + D_xxxxyyyyy*M_xxxxy + &
      D_xxxxyyyyz*M_xxxxz + D_xxxyyyy*M_xxx + D_xxxyyyyy*M_xxxy + &
      D_xxxyyyyyy*M_xxxyy + D_xxxyyyyyz*M_xxxyz + D_xxxyyyyz*M_xxxz + &
      D_xxxyyyyzz*M_xxxzz + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + &
      D_xxyyyyyy*M_xxyy + D_xxyyyyyyy*M_xxyyy + D_xxyyyyyyz*M_xxyyz + &
      D_xxyyyyyz*M_xxyz + D_xxyyyyyzz*M_xxyzz + D_xxyyyyz*M_xxz + &
      D_xxyyyyzz*M_xxzz + D_xxyyyyzzz*M_xxzzz + D_xyyyy*M_x + D_xyyyyy* &
      M_xy + D_xyyyyyy*M_xyy + D_xyyyyyyy*M_xyyy + D_xyyyyyyyy*M_xyyyy &
      + D_xyyyyyyyz*M_xyyyz + D_xyyyyyyz*M_xyyz + D_xyyyyyyzz*M_xyyzz + &
      D_xyyyyyz*M_xyz + D_xyyyyyzz*M_xyzz + D_xyyyyyzzz*M_xyzzz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_xyyyyzzz*M_xzzz + D_xyyyyzzzz &
      *M_xzzzz + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyyy* &
      M_yyy + D_yyyyyyyy*M_yyyy + D_yyyyyyyyy*M_yyyyy + D_yyyyyyyyz* &
      M_yyyyz + D_yyyyyyyz*M_yyyz + D_yyyyyyyzz*M_yyyzz + D_yyyyyyz* &
      M_yyz + D_yyyyyyzz*M_yyzz + D_yyyyyyzzz*M_yyzzz + D_yyyyyz*M_yz + &
      D_yyyyyzz*M_yzz + D_yyyyyzzz*M_yzzz + D_yyyyyzzzz*M_yzzzz + &
      D_yyyyz*M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz + D_yyyyzzzz*M_zzzz &
      + D_yyyyzzzzz*M_zzzzz
    L_yyyyz     = D_xxxxyyyyz*M_xxxx + D_xxxyyyyyz*M_xxxy + D_xxxyyyyz*M_xxx + D_xxxyyyyzz &
      *M_xxxz + D_xxyyyyyyz*M_xxyy + D_xxyyyyyz*M_xxy + D_xxyyyyyzz* &
      M_xxyz + D_xxyyyyz*M_xx + D_xxyyyyzz*M_xxz + D_xxyyyyzzz*M_xxzz + &
      D_xyyyyyyyz*M_xyyy + D_xyyyyyyz*M_xyy + D_xyyyyyyzz*M_xyyz + &
      D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyyzzz*M_xyzz + D_xyyyyz &
      *M_x + D_xyyyyzz*M_xz + D_xyyyyzzz*M_xzz + D_xyyyyzzzz*M_xzzz + &
      D_yyyyyyyyz*M_yyyy + D_yyyyyyyz*M_yyy + D_yyyyyyyzz*M_yyyz + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyyzzz*M_yyzz + D_yyyyyz &
      *M_y + D_yyyyyzz*M_yz + D_yyyyyzzz*M_yzz + D_yyyyyzzzz*M_yzzz + &
      D_yyyyz*M_0 + D_yyyyzz*M_z + D_yyyyzzz*M_zz + D_yyyyzzzz*M_zzz + &
      D_yyyyzzzzz*M_zzzz
    D_yyyzzzzzz = -(D_xxyyyzzzz + D_yyyyyzzzz)
    L_yyy       = D_xxxxxxyyy*M_xxxxxx + D_xxxxxyyy*M_xxxxx + D_xxxxxyyyy*M_xxxxxy + &
      D_xxxxxyyyz*M_xxxxxz + D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + &
      D_xxxxyyyyy*M_xxxxyy + D_xxxxyyyyz*M_xxxxyz + D_xxxxyyyz*M_xxxxz &
      + D_xxxxyyyzz*M_xxxxzz + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + &
      D_xxxyyyyy*M_xxxyy + D_xxxyyyyyy*M_xxxyyy + D_xxxyyyyyz*M_xxxyyz &
      + D_xxxyyyyz*M_xxxyz + D_xxxyyyyzz*M_xxxyzz + D_xxxyyyz*M_xxxz + &
      D_xxxyyyzz*M_xxxzz + D_xxxyyyzzz*M_xxxzzz + D_xxyyy*M_xx + &
      D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyyy*M_xxyyy + &
      D_xxyyyyyyy*M_xxyyyy + D_xxyyyyyyz*M_xxyyyz + D_xxyyyyyz*M_xxyyz &
      + D_xxyyyyyzz*M_xxyyzz + D_xxyyyyz*M_xxyz + D_xxyyyyzz*M_xxyzz + &
      D_xxyyyyzzz*M_xxyzzz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + &
      D_xxyyyzzz*M_xxzzz + D_xxyyyzzzz*M_xxzzzz + D_xyyy*M_x + D_xyyyy* &
      M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + D_xyyyyyyy*M_xyyyy + &
      D_xyyyyyyyy*M_xyyyyy + D_xyyyyyyyz*M_xyyyyz + D_xyyyyyyz*M_xyyyz &
      + D_xyyyyyyzz*M_xyyyzz + D_xyyyyyz*M_xyyz + D_xyyyyyzz*M_xyyzz + &
      D_xyyyyyzzz*M_xyyzzz + D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + &
      D_xyyyyzzz*M_xyzzz + D_xyyyyzzzz*M_xyzzzz + D_xyyyz*M_xz + &
      D_xyyyzz*M_xzz + D_xyyyzzz*M_xzzz + D_xyyyzzzz*M_xzzzz + &
      D_xyyyzzzzz*M_xzzzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyyy*M_yyyyy + &
      D_yyyyyyyyy*M_yyyyyy + D_yyyyyyyyz*M_yyyyyz + D_yyyyyyyz*M_yyyyz &
      + D_yyyyyyyzz*M_yyyyzz + D_yyyyyyz*M_yyyz + D_yyyyyyzz*M_yyyzz + &
      D_yyyyyyzzz*M_yyyzzz + D_yyyyyz*M_yyz + D_yyyyyzz*M_yyzz + &
      D_yyyyyzzz*M_yyzzz + D_yyyyyzzzz*M_yyzzzz + D_yyyyz*M_yz + &
      D_yyyyzz*M_yzz + D_yyyyzzz*M_yzzz + D_yyyyzzzz*M_yzzzz + &
      D_yyyyzzzzz*M_yzzzzz + D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz &
      + D_yyyzzzz*M_zzzz + D_yyyzzzzz*M_zzzzz + D_yyyzzzzzz*M_zzzzzz
    L_yyyz      = D_xxxxxyyyz*M_xxxxx + D_xxxxyyyyz*M_xxxxy + D_xxxxyyyz*M_xxxx + &
      D_xxxxyyyzz*M_xxxxz + D_xxxyyyyyz*M_xxxyy + D_xxxyyyyz*M_xxxy + &
      D_xxxyyyyzz*M_xxxyz + D_xxxyyyz*M_xxx + D_xxxyyyzz*M_xxxz + &
      D_xxxyyyzzz*M_xxxzz + D_xxyyyyyyz*M_xxyyy + D_xxyyyyyz*M_xxyy + &
      D_xxyyyyyzz*M_xxyyz + D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz + &
      D_xxyyyyzzz*M_xxyzz + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + &
      D_xxyyyzzz*M_xxzz + D_xxyyyzzzz*M_xxzzz + D_xyyyyyyyz*M_xyyyy + &
      D_xyyyyyyz*M_xyyy + D_xyyyyyyzz*M_xyyyz + D_xyyyyyz*M_xyy + &
      D_xyyyyyzz*M_xyyz + D_xyyyyyzzz*M_xyyzz + D_xyyyyz*M_xy + &
      D_xyyyyzz*M_xyz + D_xyyyyzzz*M_xyzz + D_xyyyyzzzz*M_xyzzz + &
      D_xyyyz*M_x + D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_xyyyzzzz*M_xzzz &
      + D_xyyyzzzzz*M_xzzzz + D_yyyyyyyyz*M_yyyyy + D_yyyyyyyz*M_yyyy + &
      D_yyyyyyyzz*M_yyyyz + D_yyyyyyz*M_yyy + D_yyyyyyzz*M_yyyz + &
      D_yyyyyyzzz*M_yyyzz + D_yyyyyz*M_yy + D_yyyyyzz*M_yyz + &
      D_yyyyyzzz*M_yyzz + D_yyyyyzzzz*M_yyzzz + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyyzzz*M_yzz + D_yyyyzzzz*M_yzzz + D_yyyyzzzzz*M_yzzzz &
      + D_yyyz*M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz + &
      D_yyyzzzzz*M_zzzz + D_yyyzzzzzz*M_zzzzz
    D_yyzzzzzzz = -(D_xxyyzzzzz + D_yyyyzzzzz)
    L_yy        = D_xxxxxxxyy*M_xxxxxxx + D_xxxxxxyy*M_xxxxxx + D_xxxxxxyyy*M_xxxxxxy + &
      D_xxxxxxyyz*M_xxxxxxz + D_xxxxxyy*M_xxxxx + D_xxxxxyyy*M_xxxxxy + &
      D_xxxxxyyyy*M_xxxxxyy + D_xxxxxyyyz*M_xxxxxyz + D_xxxxxyyz* &
      M_xxxxxz + D_xxxxxyyzz*M_xxxxxzz + D_xxxxyy*M_xxxx + D_xxxxyyy* &
      M_xxxxy + D_xxxxyyyy*M_xxxxyy + D_xxxxyyyyy*M_xxxxyyy + &
      D_xxxxyyyyz*M_xxxxyyz + D_xxxxyyyz*M_xxxxyz + D_xxxxyyyzz* &
      M_xxxxyzz + D_xxxxyyz*M_xxxxz + D_xxxxyyzz*M_xxxxzz + D_xxxxyyzzz &
      *M_xxxxzzz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy*M_xxxyy &
      + D_xxxyyyyy*M_xxxyyy + D_xxxyyyyyy*M_xxxyyyy + D_xxxyyyyyz* &
      M_xxxyyyz + D_xxxyyyyz*M_xxxyyz + D_xxxyyyyzz*M_xxxyyzz + &
      D_xxxyyyz*M_xxxyz + D_xxxyyyzz*M_xxxyzz + D_xxxyyyzzz*M_xxxyzzz + &
      D_xxxyyz*M_xxxz + D_xxxyyzz*M_xxxzz + D_xxxyyzzz*M_xxxzzz + &
      D_xxxyyzzzz*M_xxxzzzz + D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyy* &
      M_xxyy + D_xxyyyyy*M_xxyyy + D_xxyyyyyy*M_xxyyyy + D_xxyyyyyyy* &
      M_xxyyyyy + D_xxyyyyyyz*M_xxyyyyz + D_xxyyyyyz*M_xxyyyz + &
      D_xxyyyyyzz*M_xxyyyzz + D_xxyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyyzz + &
      D_xxyyyyzzz*M_xxyyzzz + D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + &
      D_xxyyyzzz*M_xxyzzz + D_xxyyyzzzz*M_xxyzzzz + D_xxyyz*M_xxz + &
      D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xxyyzzzz*M_xxzzzz + &
      D_xxyyzzzzz*M_xxzzzzz + D_xyy*M_x + D_xyyy*M_xy + D_xyyyy*M_xyy + &
      D_xyyyyy*M_xyyy + D_xyyyyyy*M_xyyyy + D_xyyyyyyy*M_xyyyyy + &
      D_xyyyyyyyy*M_xyyyyyy + D_xyyyyyyyz*M_xyyyyyz + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyyyyzz*M_xyyyyzz + D_xyyyyyz*M_xyyyz + D_xyyyyyzz &
      *M_xyyyzz + D_xyyyyyzzz*M_xyyyzzz + D_xyyyyz*M_xyyz + D_xyyyyzz* &
      M_xyyzz + D_xyyyyzzz*M_xyyzzz + D_xyyyyzzzz*M_xyyzzzz + D_xyyyz* &
      M_xyz + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyyzzzz*M_xyzzzz &
      + D_xyyyzzzzz*M_xyzzzzz + D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz* &
      M_xzzz + D_xyyzzzz*M_xzzzz + D_xyyzzzzz*M_xzzzzz + D_xyyzzzzzz* &
      M_xzzzzzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + &
      D_yyyyyy*M_yyyy + D_yyyyyyy*M_yyyyy + D_yyyyyyyy*M_yyyyyy + &
      D_yyyyyyyyy*M_yyyyyyy + D_yyyyyyyyz*M_yyyyyyz + D_yyyyyyyz* &
      M_yyyyyz + D_yyyyyyyzz*M_yyyyyzz + D_yyyyyyz*M_yyyyz + D_yyyyyyzz &
      *M_yyyyzz + D_yyyyyyzzz*M_yyyyzzz + D_yyyyyz*M_yyyz + D_yyyyyzz* &
      M_yyyzz + D_yyyyyzzz*M_yyyzzz + D_yyyyyzzzz*M_yyyzzzz + D_yyyyz* &
      M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz*M_yyzzz + D_yyyyzzzz*M_yyzzzz &
      + D_yyyyzzzzz*M_yyzzzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz* &
      M_yzzz + D_yyyzzzz*M_yzzzz + D_yyyzzzzz*M_yzzzzz + D_yyyzzzzzz* &
      M_yzzzzzz + D_yyz*M_z + D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz* &
      M_zzzz + D_yyzzzzz*M_zzzzz + D_yyzzzzzz*M_zzzzzz + D_yyzzzzzzz* &
      M_zzzzzzz
    L_yyz       = D_xxxxxxyyz*M_xxxxxx + D_xxxxxyyyz*M_xxxxxy + D_xxxxxyyz*M_xxxxx + &
      D_xxxxxyyzz*M_xxxxxz + D_xxxxyyyyz*M_xxxxyy + D_xxxxyyyz*M_xxxxy &
      + D_xxxxyyyzz*M_xxxxyz + D_xxxxyyz*M_xxxx + D_xxxxyyzz*M_xxxxz + &
      D_xxxxyyzzz*M_xxxxzz + D_xxxyyyyyz*M_xxxyyy + D_xxxyyyyz*M_xxxyy &
      + D_xxxyyyyzz*M_xxxyyz + D_xxxyyyz*M_xxxy + D_xxxyyyzz*M_xxxyz + &
      D_xxxyyyzzz*M_xxxyzz + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + &
      D_xxxyyzzz*M_xxxzz + D_xxxyyzzzz*M_xxxzzz + D_xxyyyyyyz*M_xxyyyy &
      + D_xxyyyyyz*M_xxyyy + D_xxyyyyyzz*M_xxyyyz + D_xxyyyyz*M_xxyy + &
      D_xxyyyyzz*M_xxyyz + D_xxyyyyzzz*M_xxyyzz + D_xxyyyz*M_xxy + &
      D_xxyyyzz*M_xxyz + D_xxyyyzzz*M_xxyzz + D_xxyyyzzzz*M_xxyzzz + &
      D_xxyyz*M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xxyyzzzz* &
      M_xxzzz + D_xxyyzzzzz*M_xxzzzz + D_xyyyyyyyz*M_xyyyyy + &
      D_xyyyyyyz*M_xyyyy + D_xyyyyyyzz*M_xyyyyz + D_xyyyyyz*M_xyyy + &
      D_xyyyyyzz*M_xyyyz + D_xyyyyyzzz*M_xyyyzz + D_xyyyyz*M_xyy + &
      D_xyyyyzz*M_xyyz + D_xyyyyzzz*M_xyyzz + D_xyyyyzzzz*M_xyyzzz + &
      D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyyzzz*M_xyzz + D_xyyyzzzz* &
      M_xyzzz + D_xyyyzzzzz*M_xyzzzz + D_xyyz*M_x + D_xyyzz*M_xz + &
      D_xyyzzz*M_xzz + D_xyyzzzz*M_xzzz + D_xyyzzzzz*M_xzzzz + &
      D_xyyzzzzzz*M_xzzzzz + D_yyyyyyyyz*M_yyyyyy + D_yyyyyyyz*M_yyyyy &
      + D_yyyyyyyzz*M_yyyyyz + D_yyyyyyz*M_yyyy + D_yyyyyyzz*M_yyyyz + &
      D_yyyyyyzzz*M_yyyyzz + D_yyyyyz*M_yyy + D_yyyyyzz*M_yyyz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyyzzzz*M_yyyzzz + D_yyyyz*M_yy + &
      D_yyyyzz*M_yyz + D_yyyyzzz*M_yyzz + D_yyyyzzzz*M_yyzzz + &
      D_yyyyzzzzz*M_yyzzzz + D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz &
      + D_yyyzzzz*M_yzzz + D_yyyzzzzz*M_yzzzz + D_yyyzzzzzz*M_yzzzzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + &
      D_yyzzzzz*M_zzzz + D_yyzzzzzz*M_zzzzz + D_yyzzzzzzz*M_zzzzzz
    D_yzzzzzzzz = -(D_xxyzzzzzz + D_yyyzzzzzz)
    L_y         = D_xxxxxxxxy*M_xxxxxxxx + D_xxxxxxxy*M_xxxxxxx + D_xxxxxxxyy*M_xxxxxxxy + &
      D_xxxxxxxyz*M_xxxxxxxz + D_xxxxxxy*M_xxxxxx + D_xxxxxxyy* &
      M_xxxxxxy + D_xxxxxxyyy*M_xxxxxxyy + D_xxxxxxyyz*M_xxxxxxyz + &
      D_xxxxxxyz*M_xxxxxxz + D_xxxxxxyzz*M_xxxxxxzz + D_xxxxxy*M_xxxxx &
      + D_xxxxxyy*M_xxxxxy + D_xxxxxyyy*M_xxxxxyy + D_xxxxxyyyy* &
      M_xxxxxyyy + D_xxxxxyyyz*M_xxxxxyyz + D_xxxxxyyz*M_xxxxxyz + &
      D_xxxxxyyzz*M_xxxxxyzz + D_xxxxxyz*M_xxxxxz + D_xxxxxyzz* &
      M_xxxxxzz + D_xxxxxyzzz*M_xxxxxzzz + D_xxxxy*M_xxxx + D_xxxxyy* &
      M_xxxxy + D_xxxxyyy*M_xxxxyy + D_xxxxyyyy*M_xxxxyyy + D_xxxxyyyyy &
      *M_xxxxyyyy + D_xxxxyyyyz*M_xxxxyyyz + D_xxxxyyyz*M_xxxxyyz + &
      D_xxxxyyyzz*M_xxxxyyzz + D_xxxxyyz*M_xxxxyz + D_xxxxyyzz* &
      M_xxxxyzz + D_xxxxyyzzz*M_xxxxyzzz + D_xxxxyz*M_xxxxz + D_xxxxyzz &
      *M_xxxxzz + D_xxxxyzzz*M_xxxxzzz + D_xxxxyzzzz*M_xxxxzzzz + &
      D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy* &
      M_xxxyyy + D_xxxyyyyy*M_xxxyyyy + D_xxxyyyyyy*M_xxxyyyyy + &
      D_xxxyyyyyz*M_xxxyyyyz + D_xxxyyyyz*M_xxxyyyz + D_xxxyyyyzz* &
      M_xxxyyyzz + D_xxxyyyz*M_xxxyyz + D_xxxyyyzz*M_xxxyyzz + &
      D_xxxyyyzzz*M_xxxyyzzz + D_xxxyyz*M_xxxyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyyzzz*M_xxxyzzz + D_xxxyyzzzz*M_xxxyzzzz + D_xxxyz*M_xxxz + &
      D_xxxyzz*M_xxxzz + D_xxxyzzz*M_xxxzzz + D_xxxyzzzz*M_xxxzzzz + &
      D_xxxyzzzzz*M_xxxzzzzz + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyy* &
      M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyyy*M_xxyyyy + D_xxyyyyyy* &
      M_xxyyyyy + D_xxyyyyyyy*M_xxyyyyyy + D_xxyyyyyyz*M_xxyyyyyz + &
      D_xxyyyyyz*M_xxyyyyz + D_xxyyyyyzz*M_xxyyyyzz + D_xxyyyyz* &
      M_xxyyyz + D_xxyyyyzz*M_xxyyyzz + D_xxyyyyzzz*M_xxyyyzzz + &
      D_xxyyyz*M_xxyyz + D_xxyyyzz*M_xxyyzz + D_xxyyyzzz*M_xxyyzzz + &
      D_xxyyyzzzz*M_xxyyzzzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyyzzzz*M_xxyzzzz + D_xxyyzzzzz* &
      M_xxyzzzzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz + D_xxyzzz*M_xxzzz + &
      D_xxyzzzz*M_xxzzzz + D_xxyzzzzz*M_xxzzzzz + D_xxyzzzzzz* &
      M_xxzzzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + D_xyyyy* &
      M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + D_xyyyyyyy* &
      M_xyyyyyy + D_xyyyyyyyy*M_xyyyyyyy + D_xyyyyyyyz*M_xyyyyyyz + &
      D_xyyyyyyz*M_xyyyyyz + D_xyyyyyyzz*M_xyyyyyzz + D_xyyyyyz* &
      M_xyyyyz + D_xyyyyyzz*M_xyyyyzz + D_xyyyyyzzz*M_xyyyyzzz + &
      D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + D_xyyyyzzz*M_xyyyzzz + &
      D_xyyyyzzzz*M_xyyyzzzz + D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + &
      D_xyyyzzz*M_xyyzzz + D_xyyyzzzz*M_xyyzzzz + D_xyyyzzzzz* &
      M_xyyzzzzz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + &
      D_xyyzzzz*M_xyzzzz + D_xyyzzzzz*M_xyzzzzz + D_xyyzzzzzz* &
      M_xyzzzzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + &
      D_xyzzzz*M_xzzzz + D_xyzzzzz*M_xzzzzz + D_xyzzzzzz*M_xzzzzzz + &
      D_xyzzzzzzz*M_xzzzzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy &
      *M_yyy + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + &
      D_yyyyyyyy*M_yyyyyyy + D_yyyyyyyyy*M_yyyyyyyy + D_yyyyyyyyz* &
      M_yyyyyyyz + D_yyyyyyyz*M_yyyyyyz + D_yyyyyyyzz*M_yyyyyyzz + &
      D_yyyyyyz*M_yyyyyz + D_yyyyyyzz*M_yyyyyzz + D_yyyyyyzzz* &
      M_yyyyyzzz + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + D_yyyyyzzz* &
      M_yyyyzzz + D_yyyyyzzzz*M_yyyyzzzz + D_yyyyz*M_yyyz + D_yyyyzz* &
      M_yyyzz + D_yyyyzzz*M_yyyzzz + D_yyyyzzzz*M_yyyzzzz + D_yyyyzzzzz &
      *M_yyyzzzzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyyzzz*M_yyzzz + &
      D_yyyzzzz*M_yyzzzz + D_yyyzzzzz*M_yyzzzzz + D_yyyzzzzzz* &
      M_yyzzzzzz + D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + &
      D_yyzzzz*M_yzzzz + D_yyzzzzz*M_yzzzzz + D_yyzzzzzz*M_yzzzzzz + &
      D_yyzzzzzzz*M_yzzzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + &
      D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz + &
      D_yzzzzzzz*M_zzzzzzz + D_yzzzzzzzz*M_zzzzzzzz
    L_yz        = D_xxxxxxxyz*M_xxxxxxx + D_xxxxxxyyz*M_xxxxxxy + D_xxxxxxyz*M_xxxxxx + &
      D_xxxxxxyzz*M_xxxxxxz + D_xxxxxyyyz*M_xxxxxyy + D_xxxxxyyz* &
      M_xxxxxy + D_xxxxxyyzz*M_xxxxxyz + D_xxxxxyz*M_xxxxx + D_xxxxxyzz &
      *M_xxxxxz + D_xxxxxyzzz*M_xxxxxzz + D_xxxxyyyyz*M_xxxxyyy + &
      D_xxxxyyyz*M_xxxxyy + D_xxxxyyyzz*M_xxxxyyz + D_xxxxyyz*M_xxxxy + &
      D_xxxxyyzz*M_xxxxyz + D_xxxxyyzzz*M_xxxxyzz + D_xxxxyz*M_xxxx + &
      D_xxxxyzz*M_xxxxz + D_xxxxyzzz*M_xxxxzz + D_xxxxyzzzz*M_xxxxzzz + &
      D_xxxyyyyyz*M_xxxyyyy + D_xxxyyyyz*M_xxxyyy + D_xxxyyyyzz* &
      M_xxxyyyz + D_xxxyyyz*M_xxxyy + D_xxxyyyzz*M_xxxyyz + D_xxxyyyzzz &
      *M_xxxyyzz + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz + D_xxxyyzzz* &
      M_xxxyzz + D_xxxyyzzzz*M_xxxyzzz + D_xxxyz*M_xxx + D_xxxyzz* &
      M_xxxz + D_xxxyzzz*M_xxxzz + D_xxxyzzzz*M_xxxzzz + D_xxxyzzzzz* &
      M_xxxzzzz + D_xxyyyyyyz*M_xxyyyyy + D_xxyyyyyz*M_xxyyyy + &
      D_xxyyyyyzz*M_xxyyyyz + D_xxyyyyz*M_xxyyy + D_xxyyyyzz*M_xxyyyz + &
      D_xxyyyyzzz*M_xxyyyzz + D_xxyyyz*M_xxyy + D_xxyyyzz*M_xxyyz + &
      D_xxyyyzzz*M_xxyyzz + D_xxyyyzzzz*M_xxyyzzz + D_xxyyz*M_xxy + &
      D_xxyyzz*M_xxyz + D_xxyyzzz*M_xxyzz + D_xxyyzzzz*M_xxyzzz + &
      D_xxyyzzzzz*M_xxyzzzz + D_xxyz*M_xx + D_xxyzz*M_xxz + D_xxyzzz* &
      M_xxzz + D_xxyzzzz*M_xxzzz + D_xxyzzzzz*M_xxzzzz + D_xxyzzzzzz* &
      M_xxzzzzz + D_xyyyyyyyz*M_xyyyyyy + D_xyyyyyyz*M_xyyyyy + &
      D_xyyyyyyzz*M_xyyyyyz + D_xyyyyyz*M_xyyyy + D_xyyyyyzz*M_xyyyyz + &
      D_xyyyyyzzz*M_xyyyyzz + D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + &
      D_xyyyyzzz*M_xyyyzz + D_xyyyyzzzz*M_xyyyzzz + D_xyyyz*M_xyy + &
      D_xyyyzz*M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyyzzzz*M_xyyzzz + &
      D_xyyyzzzzz*M_xyyzzzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz* &
      M_xyzz + D_xyyzzzz*M_xyzzz + D_xyyzzzzz*M_xyzzzz + D_xyyzzzzzz* &
      M_xyzzzzz + D_xyz*M_x + D_xyzz*M_xz + D_xyzzz*M_xzz + D_xyzzzz* &
      M_xzzz + D_xyzzzzz*M_xzzzz + D_xyzzzzzz*M_xzzzzz + D_xyzzzzzzz* &
      M_xzzzzzz + D_yyyyyyyyz*M_yyyyyyy + D_yyyyyyyz*M_yyyyyy + &
      D_yyyyyyyzz*M_yyyyyyz + D_yyyyyyz*M_yyyyy + D_yyyyyyzz*M_yyyyyz + &
      D_yyyyyyzzz*M_yyyyyzz + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + &
      D_yyyyyzzz*M_yyyyzz + D_yyyyyzzzz*M_yyyyzzz + D_yyyyz*M_yyy + &
      D_yyyyzz*M_yyyz + D_yyyyzzz*M_yyyzz + D_yyyyzzzz*M_yyyzzz + &
      D_yyyyzzzzz*M_yyyzzzz + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyyzzz* &
      M_yyzz + D_yyyzzzz*M_yyzzz + D_yyyzzzzz*M_yyzzzz + D_yyyzzzzzz* &
      M_yyzzzzz + D_yyz*M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yyzzzz* &
      M_yzzz + D_yyzzzzz*M_yzzzz + D_yyzzzzzz*M_yzzzzz + D_yyzzzzzzz* &
      M_yzzzzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz + D_yzzzz*M_zzz + &
      D_yzzzzz*M_zzzz + D_yzzzzzz*M_zzzzz + D_yzzzzzzz*M_zzzzzz + &
      D_yzzzzzzzz*M_zzzzzzz
    D_zzzzzzzzz = -(D_xxzzzzzzz + D_yyzzzzzzz)
    L_0         = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxxx* &
      M_xxxxxxxx + D_xxxxxxxxx*M_xxxxxxxxx + D_xxxxxxxxy*M_xxxxxxxxy + &
      D_xxxxxxxxz*M_xxxxxxxxz + D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxyy* &
      M_xxxxxxxyy + D_xxxxxxxyz*M_xxxxxxxyz + D_xxxxxxxz*M_xxxxxxxz + &
      D_xxxxxxxzz*M_xxxxxxxzz + D_xxxxxxy*M_xxxxxxy + D_xxxxxxyy* &
      M_xxxxxxyy + D_xxxxxxyyy*M_xxxxxxyyy + D_xxxxxxyyz*M_xxxxxxyyz + &
      D_xxxxxxyz*M_xxxxxxyz + D_xxxxxxyzz*M_xxxxxxyzz + D_xxxxxxz* &
      M_xxxxxxz + D_xxxxxxzz*M_xxxxxxzz + D_xxxxxxzzz*M_xxxxxxzzz + &
      D_xxxxxy*M_xxxxxy + D_xxxxxyy*M_xxxxxyy + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxyyyy*M_xxxxxyyyy + D_xxxxxyyyz*M_xxxxxyyyz + D_xxxxxyyz* &
      M_xxxxxyyz + D_xxxxxyyzz*M_xxxxxyyzz + D_xxxxxyz*M_xxxxxyz + &
      D_xxxxxyzz*M_xxxxxyzz + D_xxxxxyzzz*M_xxxxxyzzz + D_xxxxxz* &
      M_xxxxxz + D_xxxxxzz*M_xxxxxzz + D_xxxxxzzz*M_xxxxxzzz + &
      D_xxxxxzzzz*M_xxxxxzzzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + &
      D_xxxxyyy*M_xxxxyyy + D_xxxxyyyy*M_xxxxyyyy + D_xxxxyyyyy* &
      M_xxxxyyyyy + D_xxxxyyyyz*M_xxxxyyyyz + D_xxxxyyyz*M_xxxxyyyz + &
      D_xxxxyyyzz*M_xxxxyyyzz + D_xxxxyyz*M_xxxxyyz + D_xxxxyyzz* &
      M_xxxxyyzz + D_xxxxyyzzz*M_xxxxyyzzz + D_xxxxyz*M_xxxxyz + &
      D_xxxxyzz*M_xxxxyzz + D_xxxxyzzz*M_xxxxyzzz + D_xxxxyzzzz* &
      M_xxxxyzzzz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxxzzz* &
      M_xxxxzzz + D_xxxxzzzz*M_xxxxzzzz + D_xxxxzzzzz*M_xxxxzzzzz + &
      D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyyy* &
      M_xxxyyyy + D_xxxyyyyy*M_xxxyyyyy + D_xxxyyyyyy*M_xxxyyyyyy + &
      D_xxxyyyyyz*M_xxxyyyyyz + D_xxxyyyyz*M_xxxyyyyz + D_xxxyyyyzz* &
      M_xxxyyyyzz + D_xxxyyyz*M_xxxyyyz + D_xxxyyyzz*M_xxxyyyzz + &
      D_xxxyyyzzz*M_xxxyyyzzz + D_xxxyyz*M_xxxyyz + D_xxxyyzz*M_xxxyyzz &
      + D_xxxyyzzz*M_xxxyyzzz + D_xxxyyzzzz*M_xxxyyzzzz + D_xxxyz* &
      M_xxxyz + D_xxxyzz*M_xxxyzz + D_xxxyzzz*M_xxxyzzz + D_xxxyzzzz* &
      M_xxxyzzzz + D_xxxyzzzzz*M_xxxyzzzzz + D_xxxz*M_xxxz + D_xxxzz* &
      M_xxxzz + D_xxxzzz*M_xxxzzz + D_xxxzzzz*M_xxxzzzz + D_xxxzzzzz* &
      M_xxxzzzzz + D_xxxzzzzzz*M_xxxzzzzzz + D_xxy*M_xxy + D_xxyy* &
      M_xxyy + D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy* &
      M_xxyyyyy + D_xxyyyyyy*M_xxyyyyyy + D_xxyyyyyyy*M_xxyyyyyyy + &
      D_xxyyyyyyz*M_xxyyyyyyz + D_xxyyyyyz*M_xxyyyyyz + D_xxyyyyyzz* &
      M_xxyyyyyzz + D_xxyyyyz*M_xxyyyyz + D_xxyyyyzz*M_xxyyyyzz + &
      D_xxyyyyzzz*M_xxyyyyzzz + D_xxyyyz*M_xxyyyz + D_xxyyyzz*M_xxyyyzz &
      + D_xxyyyzzz*M_xxyyyzzz + D_xxyyyzzzz*M_xxyyyzzzz + D_xxyyz* &
      M_xxyyz + D_xxyyzz*M_xxyyzz + D_xxyyzzz*M_xxyyzzz + D_xxyyzzzz* &
      M_xxyyzzzz + D_xxyyzzzzz*M_xxyyzzzzz + D_xxyz*M_xxyz + D_xxyzz* &
      M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz*M_xxyzzzz + D_xxyzzzzz* &
      M_xxyzzzzz + D_xxyzzzzzz*M_xxyzzzzzz + D_xxz*M_xxz + D_xxzz* &
      M_xxzz + D_xxzzz*M_xxzzz + D_xxzzzz*M_xxzzzz + D_xxzzzzz* &
      M_xxzzzzz + D_xxzzzzzz*M_xxzzzzzz + D_xxzzzzzzz*M_xxzzzzzzz + &
      D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + D_xyyyy*M_xyyyy + &
      D_xyyyyy*M_xyyyyy + D_xyyyyyy*M_xyyyyyy + D_xyyyyyyy*M_xyyyyyyy + &
      D_xyyyyyyyy*M_xyyyyyyyy + D_xyyyyyyyz*M_xyyyyyyyz + D_xyyyyyyz* &
      M_xyyyyyyz + D_xyyyyyyzz*M_xyyyyyyzz + D_xyyyyyz*M_xyyyyyz + &
      D_xyyyyyzz*M_xyyyyyzz + D_xyyyyyzzz*M_xyyyyyzzz + D_xyyyyz* &
      M_xyyyyz + D_xyyyyzz*M_xyyyyzz + D_xyyyyzzz*M_xyyyyzzz + &
      D_xyyyyzzzz*M_xyyyyzzzz + D_xyyyz*M_xyyyz + D_xyyyzz*M_xyyyzz + &
      D_xyyyzzz*M_xyyyzzz + D_xyyyzzzz*M_xyyyzzzz + D_xyyyzzzzz* &
      M_xyyyzzzzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz &
      + D_xyyzzzz*M_xyyzzzz + D_xyyzzzzz*M_xyyzzzzz + D_xyyzzzzzz* &
      M_xyyzzzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz + &
      D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + D_xyzzzzzz*M_xyzzzzzz + &
      D_xyzzzzzzz*M_xyzzzzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz &
      + D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_xzzzzzz*M_xzzzzzz + &
      D_xzzzzzzz*M_xzzzzzzz + D_xzzzzzzzz*M_xzzzzzzzz + D_y*M_y + D_yy* &
      M_yy + D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy* &
      M_yyyyyy + D_yyyyyyy*M_yyyyyyy + D_yyyyyyyy*M_yyyyyyyy + &
      D_yyyyyyyyy*M_yyyyyyyyy + D_yyyyyyyyz*M_yyyyyyyyz + D_yyyyyyyz* &
      M_yyyyyyyz + D_yyyyyyyzz*M_yyyyyyyzz + D_yyyyyyz*M_yyyyyyz + &
      D_yyyyyyzz*M_yyyyyyzz + D_yyyyyyzzz*M_yyyyyyzzz + D_yyyyyz* &
      M_yyyyyz + D_yyyyyzz*M_yyyyyzz + D_yyyyyzzz*M_yyyyyzzz + &
      D_yyyyyzzzz*M_yyyyyzzzz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + &
      D_yyyyzzz*M_yyyyzzz + D_yyyyzzzz*M_yyyyzzzz + D_yyyyzzzzz* &
      M_yyyyzzzzz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz &
      + D_yyyzzzz*M_yyyzzzz + D_yyyzzzzz*M_yyyzzzzz + D_yyyzzzzzz* &
      M_yyyzzzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + &
      D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + D_yyzzzzzz*M_yyzzzzzz + &
      D_yyzzzzzzz*M_yyzzzzzzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz &
      + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz + D_yzzzzzz*M_yzzzzzz + &
      D_yzzzzzzz*M_yzzzzzzz + D_yzzzzzzzz*M_yzzzzzzzz + D_z*M_z + D_zz* &
      M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz* &
      M_zzzzzz + D_zzzzzzz*M_zzzzzzz + D_zzzzzzzz*M_zzzzzzzz + &
      D_zzzzzzzzz*M_zzzzzzzzz
    L_z         = D_xxxxxxxxz*M_xxxxxxxx + D_xxxxxxxyz*M_xxxxxxxy + D_xxxxxxxz*M_xxxxxxx + &
      D_xxxxxxxzz*M_xxxxxxxz + D_xxxxxxyyz*M_xxxxxxyy + D_xxxxxxyz* &
      M_xxxxxxy + D_xxxxxxyzz*M_xxxxxxyz + D_xxxxxxz*M_xxxxxx + &
      D_xxxxxxzz*M_xxxxxxz + D_xxxxxxzzz*M_xxxxxxzz + D_xxxxxyyyz* &
      M_xxxxxyyy + D_xxxxxyyz*M_xxxxxyy + D_xxxxxyyzz*M_xxxxxyyz + &
      D_xxxxxyz*M_xxxxxy + D_xxxxxyzz*M_xxxxxyz + D_xxxxxyzzz* &
      M_xxxxxyzz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + D_xxxxxzzz* &
      M_xxxxxzz + D_xxxxxzzzz*M_xxxxxzzz + D_xxxxyyyyz*M_xxxxyyyy + &
      D_xxxxyyyz*M_xxxxyyy + D_xxxxyyyzz*M_xxxxyyyz + D_xxxxyyz* &
      M_xxxxyy + D_xxxxyyzz*M_xxxxyyz + D_xxxxyyzzz*M_xxxxyyzz + &
      D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + D_xxxxyzzz*M_xxxxyzz + &
      D_xxxxyzzzz*M_xxxxyzzz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + &
      D_xxxxzzz*M_xxxxzz + D_xxxxzzzz*M_xxxxzzz + D_xxxxzzzzz* &
      M_xxxxzzzz + D_xxxyyyyyz*M_xxxyyyyy + D_xxxyyyyz*M_xxxyyyy + &
      D_xxxyyyyzz*M_xxxyyyyz + D_xxxyyyz*M_xxxyyy + D_xxxyyyzz* &
      M_xxxyyyz + D_xxxyyyzzz*M_xxxyyyzz + D_xxxyyz*M_xxxyy + D_xxxyyzz &
      *M_xxxyyz + D_xxxyyzzz*M_xxxyyzz + D_xxxyyzzzz*M_xxxyyzzz + &
      D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + &
      D_xxxyzzzz*M_xxxyzzz + D_xxxyzzzzz*M_xxxyzzzz + D_xxxz*M_xxx + &
      D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz*M_xxxzzz + &
      D_xxxzzzzz*M_xxxzzzz + D_xxxzzzzzz*M_xxxzzzzz + D_xxyyyyyyz* &
      M_xxyyyyyy + D_xxyyyyyz*M_xxyyyyy + D_xxyyyyyzz*M_xxyyyyyz + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz + D_xxyyyyzzz* &
      M_xxyyyyzz + D_xxyyyz*M_xxyyy + D_xxyyyzz*M_xxyyyz + D_xxyyyzzz* &
      M_xxyyyzz + D_xxyyyzzzz*M_xxyyyzzz + D_xxyyz*M_xxyy + D_xxyyzz* &
      M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyyzzzz*M_xxyyzzz + D_xxyyzzzzz &
      *M_xxyyzzzz + D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + &
      D_xxyzzzz*M_xxyzzz + D_xxyzzzzz*M_xxyzzzz + D_xxyzzzzzz* &
      M_xxyzzzzz + D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + &
      D_xxzzzz*M_xxzzz + D_xxzzzzz*M_xxzzzz + D_xxzzzzzz*M_xxzzzzz + &
      D_xxzzzzzzz*M_xxzzzzzz + D_xyyyyyyyz*M_xyyyyyyy + D_xyyyyyyz* &
      M_xyyyyyy + D_xyyyyyyzz*M_xyyyyyyz + D_xyyyyyz*M_xyyyyy + &
      D_xyyyyyzz*M_xyyyyyz + D_xyyyyyzzz*M_xyyyyyzz + D_xyyyyz*M_xyyyy &
      + D_xyyyyzz*M_xyyyyz + D_xyyyyzzz*M_xyyyyzz + D_xyyyyzzzz* &
      M_xyyyyzzz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + D_xyyyzzz* &
      M_xyyyzz + D_xyyyzzzz*M_xyyyzzz + D_xyyyzzzzz*M_xyyyzzzz + D_xyyz &
      *M_xyy + D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + D_xyyzzzz*M_xyyzzz + &
      D_xyyzzzzz*M_xyyzzzz + D_xyyzzzzzz*M_xyyzzzzz + D_xyz*M_xy + &
      D_xyzz*M_xyz + D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + D_xyzzzzz* &
      M_xyzzzz + D_xyzzzzzz*M_xyzzzzz + D_xyzzzzzzz*M_xyzzzzzz + D_xz* &
      M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_xzzzzzz*M_xzzzzz + D_xzzzzzzz*M_xzzzzzz + D_xzzzzzzzz &
      *M_xzzzzzzz + D_yyyyyyyyz*M_yyyyyyyy + D_yyyyyyyz*M_yyyyyyy + &
      D_yyyyyyyzz*M_yyyyyyyz + D_yyyyyyz*M_yyyyyy + D_yyyyyyzz* &
      M_yyyyyyz + D_yyyyyyzzz*M_yyyyyyzz + D_yyyyyz*M_yyyyy + D_yyyyyzz &
      *M_yyyyyz + D_yyyyyzzz*M_yyyyyzz + D_yyyyyzzzz*M_yyyyyzzz + &
      D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + D_yyyyzzz*M_yyyyzz + &
      D_yyyyzzzz*M_yyyyzzz + D_yyyyzzzzz*M_yyyyzzzz + D_yyyz*M_yyy + &
      D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + D_yyyzzzz*M_yyyzzz + &
      D_yyyzzzzz*M_yyyzzzz + D_yyyzzzzzz*M_yyyzzzzz + D_yyz*M_yy + &
      D_yyzz*M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz* &
      M_yyzzzz + D_yyzzzzzz*M_yyzzzzz + D_yyzzzzzzz*M_yyzzzzzz + D_yz* &
      M_y + D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz* &
      M_yzzzz + D_yzzzzzz*M_yzzzzz + D_yzzzzzzz*M_yzzzzzz + D_yzzzzzzzz &
      *M_yzzzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + &
      D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz + &
      D_zzzzzzzz*M_zzzzzzz + D_zzzzzzzzz*M_zzzzzzzz
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  L_xx                
#undef  M_xx                
#undef  L_xy                
#undef  M_xy                
#undef  L_xz                
#undef  M_xz                
#undef  M_yy                
#undef  L_yy                
#undef  L_yz                
#undef  M_yz                
#undef  M_zz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_xzz               
#undef  M_yyy               
#undef  L_xxxx              
#undef  M_yyz               
#undef  L_xxxy              
#undef  M_yzz               
#undef  L_xxxz              
#undef  L_xxyy              
#undef  M_zzz               
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
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xyyy              
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
#undef  L_xyyyz             
#undef  M_yzzz              
#undef  L_yyyyy             
#undef  M_zzzz              
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  L_xxxxxx            
#undef  M_xxxxy             
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  L_xxxxxz            
#undef  M_xxxyy             
#undef  L_xxxxyy            
#undef  M_xxxyz             
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  L_xxxyyy            
#undef  M_xxyyy             
#undef  L_xxxyyz            
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  M_xxzzz             
#undef  L_xxyyyz            
#undef  M_xyyyy             
#undef  L_xyyyyy            
#undef  M_xyyyz             
#undef  L_xyyyyz            
#undef  M_xyyzz             
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  M_xyzzz             
#undef  M_xzzzz             
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  M_yyyyy             
#undef  L_xxxxxxz           
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  L_xxxxyyy           
#undef  M_zzzzz             
#undef  L_xxxxyyz           
#undef  M_xxxxxx            
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  L_xxyyyyy           
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
#undef  L_xxxxxxxx          
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  M_xxyyyy            
#undef  L_xxxxxxyy          
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  L_xxxxxxyz          
#undef  M_xxyzzz            
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxzzzz            
#undef  L_xxxxyyyy          
#undef  M_xyyyyy            
#undef  L_xxxxyyyz          
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  L_xxxyyyyy          
#undef  M_xyyzzz            
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  M_xyzzzz            
#undef  M_xzzzzz            
#undef  L_xxyyyyyz          
#undef  M_yyyyyy            
#undef  L_xyyyyyyy          
#undef  M_yyyyyz            
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  M_yyyyzz            
#undef  L_yyyyyyyz          
#undef  M_yyyzzz            
#undef  L_xxxxxxxxx         
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  L_xxxxxxxxy         
#undef  L_xxxxxxxxz         
#undef  M_zzzzzz            
#undef  L_xxxxxxxyy         
#undef  M_xxxxxxx           
#undef  L_xxxxxxxyz         
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  L_xxxxxxyyy         
#undef  L_xxxxxxyyz         
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  L_xxxxxyyyy         
#undef  M_xxxxxzz           
#undef  L_xxxxxyyyz         
#undef  M_xxxxyyy           
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  L_xxxyyyyyy         
#undef  M_xxxxzzz           
#undef  L_xxxyyyyyz         
#undef  L_xxyyyyyyy         
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxyyyyyyz         
#undef  L_xyyyyyyyy         
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  L_xyyyyyyyz         
#undef  M_xxxzzzz           
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
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
#undef  M_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  M_xxxxxxzz          
#undef  M_xxxxxyyy          
#undef  M_xxxxxyyz          
#undef  M_xxxxxyzz          
#undef  M_xxxxxzzz          
#undef  M_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  M_xxxxyyzz          
#undef  M_xxxxyzzz          
#undef  M_xxxxzzzz          
#undef  M_xxxyyyyy          
#undef  M_xxxyyyyz          
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  M_xxxyzzzz          
#undef  M_xxxzzzzz          
#undef  M_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  M_xxyyyyzz          
#undef  M_xxyyyzzz          
#undef  M_xxyyzzzz          
#undef  M_xxyzzzzz          
#undef  M_xxzzzzzz          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  M_xyyyyyzz          
#undef  M_xyyyyzzz          
#undef  M_xyyyzzzz          
#undef  M_xyyzzzzz          
#undef  M_xyzzzzzz          
#undef  M_xzzzzzzz          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
#undef  M_yyyyyyzz          
#undef  M_yyyyyzzz          
#undef  M_yyyyzzzz          
#undef  M_yyyzzzzz          
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  M_zzzzzzzz          
#undef  M_xxxxxxxxx         
#undef  M_xxxxxxxxy         
#undef  M_xxxxxxxxz         
#undef  M_xxxxxxxyy         
#undef  M_xxxxxxxyz         
#undef  M_xxxxxxxzz         
#undef  M_xxxxxxyyy         
#undef  M_xxxxxxyyz         
#undef  M_xxxxxxyzz         
#undef  M_xxxxxxzzz         
#undef  M_xxxxxyyyy         
#undef  M_xxxxxyyyz         
#undef  M_xxxxxyyzz         
#undef  M_xxxxxyzzz         
#undef  M_xxxxxzzzz         
#undef  M_xxxxyyyyy         
#undef  M_xxxxyyyyz         
#undef  M_xxxxyyyzz         
#undef  M_xxxxyyzzz         
#undef  M_xxxxyzzzz         
#undef  M_xxxxzzzzz         
#undef  M_xxxyyyyyy         
#undef  M_xxxyyyyyz         
#undef  M_xxxyyyyzz         
#undef  M_xxxyyyzzz         
#undef  M_xxxyyzzzz         
#undef  M_xxxyzzzzz         
#undef  M_xxxzzzzzz         
#undef  M_xxyyyyyyy         
#undef  M_xxyyyyyyz         
#undef  M_xxyyyyyzz         
#undef  M_xxyyyyzzz         
#undef  M_xxyyyzzzz         
#undef  M_xxyyzzzzz         
#undef  M_xxyzzzzzz         
#undef  M_xxzzzzzzz         
#undef  M_xyyyyyyyy         
#undef  M_xyyyyyyyz         
#undef  M_xyyyyyyzz         
#undef  M_xyyyyyzzz         
#undef  M_xyyyyzzzz         
#undef  M_xyyyzzzzz         
#undef  M_xyyzzzzzz         
#undef  M_xyzzzzzzz         
#undef  M_xzzzzzzzz         
#undef  M_yyyyyyyyy         
#undef  M_yyyyyyyyz         
#undef  M_yyyyyyyzz         
#undef  M_yyyyyyzzz         
#undef  M_yyyyyzzzz         
#undef  M_yyyyzzzzz         
#undef  M_yyyzzzzzz         
#undef  M_yyzzzzzzz         
#undef  M_yzzzzzzzz         
#undef  M_zzzzzzzzz         
    end subroutine mom_es_M2L
    
! OPS  1297*ADD + 2*DIV + 1539*MUL + 120*NEG + POW = 2959  (11370 before optimization)
subroutine mom_es_L2L(L, r, Ls)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v534, v535, v536, v537, v538, v539, v54, v540, v541, v542,&
                v543, v544, v545, v546, v547, v548, v549, v55, v550, v551,&
                v552, v553, v554, v555, v556, v557, v558, v559, v56, v560,&
                v561, v562, v563, v564, v565, v566, v567, v568, v569, v57,&
                v570, v571, v572, v573, v574, v575, v576, v577, v578, v579,&
                v58, v580, v581, v582, v583, v584, v585, v586, v587, v588,&
                v589, v59, v590, v591, v592, v593, v594, v595, v596, v597,&
                v598, v599, v6, v60, v600, v601, v602, v603, v604, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz,&
                L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz,&
                L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz,&
                L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz,&
                L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz, L_xxxxxxzz,&
                L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz, L_xxxxzzzz,&
                L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz, L_xxyyyyzz,&
                L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz, L_xyyyyyzz,&
                L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz, L_xzzzzzzz,&
                L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz,&
                L_yzzzzzzz, L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz, L_xxxxxxzzz,&
                L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz, L_xxxxyyyzz,&
                L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz, L_xxxyyyyzz,&
                L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz, L_xxxzzzzzz,&
                L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz, L_xxyyzzzzz,&
                L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz, L_xyyyyyzzz,&
                L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz, L_xyzzzzzzz,&
                L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz, L_yyyyyzzzz,&
                L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz, L_yzzzzzzzz,&
                L_zzzzzzzzz
#define y                    r(2)
#define Ls_0                 Ls(0)
#define L_0                  L(0)
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
#define L_xy                 L(5)
#define Ls_xy                Ls(5)
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
#define L_xxxz               L(18)
#define Ls_xxxz              Ls(18)
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
#define L_xxxxy              L(26)
#define Ls_xxxxy             Ls(26)
#define L_xxxxz              L(27)
#define Ls_xxxxz             Ls(27)
#define Ls_xxxyy             Ls(28)
#define L_xxxyy              L(28)
#define L_xxxyz              L(29)
#define Ls_xxxyz             Ls(29)
#define Ls_xxyyy             Ls(30)
#define L_xxyyy              L(30)
#define Ls_xxyyz             Ls(31)
#define L_xxyyz              L(31)
#define L_xyyyy              L(32)
#define Ls_xyyyy             Ls(32)
#define Ls_xyyyz             Ls(33)
#define L_xyyyz              L(33)
#define L_yyyyy              L(34)
#define Ls_yyyyy             Ls(34)
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
#define L_xxxxyz             L(40)
#define Ls_xxxxyz            Ls(40)
#define L_xxxyyy             L(41)
#define Ls_xxxyyy            Ls(41)
#define Ls_xxxyyz            Ls(42)
#define L_xxxyyz             L(42)
#define Ls_xxyyyy            Ls(43)
#define L_xxyyyy             L(43)
#define Ls_xxyyyz            Ls(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define Ls_xyyyyy            Ls(45)
#define Ls_xyyyyz            Ls(46)
#define L_xyyyyz             L(46)
#define L_yyyyyy             L(47)
#define Ls_yyyyyy            Ls(47)
#define Ls_yyyyyz            Ls(48)
#define L_yyyyyz             L(48)
#define L_xxxxxxx            L(49)
#define Ls_xxxxxxx           Ls(49)
#define Ls_xxxxxxy           Ls(50)
#define L_xxxxxxy            L(50)
#define Ls_xxxxxxz           Ls(51)
#define L_xxxxxxz            L(51)
#define Ls_xxxxxyy           Ls(52)
#define L_xxxxxyy            L(52)
#define L_xxxxxyz            L(53)
#define Ls_xxxxxyz           Ls(53)
#define Ls_xxxxyyy           Ls(54)
#define L_xxxxyyy            L(54)
#define Ls_xxxxyyz           Ls(55)
#define L_xxxxyyz            L(55)
#define Ls_xxxyyyy           Ls(56)
#define L_xxxyyyy            L(56)
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
#define L_yyyyyyz            L(63)
#define Ls_yyyyyyz           Ls(63)
#define L_xxxxxxxx           L(64)
#define Ls_xxxxxxxx          Ls(64)
#define L_xxxxxxxy           L(65)
#define Ls_xxxxxxxy          Ls(65)
#define L_xxxxxxxz           L(66)
#define Ls_xxxxxxxz          Ls(66)
#define L_xxxxxxyy           L(67)
#define Ls_xxxxxxyy          Ls(67)
#define Ls_xxxxxxyz          Ls(68)
#define L_xxxxxxyz           L(68)
#define Ls_xxxxxyyy          Ls(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define Ls_xxxxxyyz          Ls(70)
#define L_xxxxyyyy           L(71)
#define Ls_xxxxyyyy          Ls(71)
#define L_xxxxyyyz           L(72)
#define Ls_xxxxyyyz          Ls(72)
#define L_xxxyyyyy           L(73)
#define Ls_xxxyyyyy          Ls(73)
#define Ls_xxxyyyyz          Ls(74)
#define L_xxxyyyyz           L(74)
#define L_xxyyyyyy           L(75)
#define Ls_xxyyyyyy          Ls(75)
#define Ls_xxyyyyyz          Ls(76)
#define L_xxyyyyyz           L(76)
#define L_xyyyyyyy           L(77)
#define Ls_xyyyyyyy          Ls(77)
#define Ls_xyyyyyyz          Ls(78)
#define L_xyyyyyyz           L(78)
#define L_yyyyyyyy           L(79)
#define Ls_yyyyyyyy          Ls(79)
#define Ls_yyyyyyyz          Ls(80)
#define L_yyyyyyyz           L(80)
#define L_xxxxxxxxx          L(81)
#define Ls_xxxxxxxxx         Ls(81)
#define L_xxxxxxxxy          L(82)
#define Ls_xxxxxxxxy         Ls(82)
#define Ls_xxxxxxxxz         Ls(83)
#define L_xxxxxxxxz          L(83)
#define L_xxxxxxxyy          L(84)
#define Ls_xxxxxxxyy         Ls(84)
#define Ls_xxxxxxxyz         Ls(85)
#define L_xxxxxxxyz          L(85)
#define L_xxxxxxyyy          L(86)
#define Ls_xxxxxxyyy         Ls(86)
#define Ls_xxxxxxyyz         Ls(87)
#define L_xxxxxxyyz          L(87)
#define Ls_xxxxxyyyy         Ls(88)
#define L_xxxxxyyyy          L(88)
#define L_xxxxxyyyz          L(89)
#define Ls_xxxxxyyyz         Ls(89)
#define Ls_xxxxyyyyy         Ls(90)
#define L_xxxxyyyyy          L(90)
#define L_xxxxyyyyz          L(91)
#define Ls_xxxxyyyyz         Ls(91)
#define L_xxxyyyyyy          L(92)
#define Ls_xxxyyyyyy         Ls(92)
#define L_xxxyyyyyz          L(93)
#define Ls_xxxyyyyyz         Ls(93)
#define Ls_xxyyyyyyy         Ls(94)
#define L_xxyyyyyyy          L(94)
#define Ls_xxyyyyyyz         Ls(95)
#define L_xxyyyyyyz          L(95)
#define Ls_xyyyyyyyy         Ls(96)
#define L_xyyyyyyyy          L(96)
#define Ls_xyyyyyyyz         Ls(97)
#define L_xyyyyyyyz          L(97)
#define Ls_yyyyyyyyy         Ls(98)
#define L_yyyyyyyyy          L(98)
#define L_yyyyyyyyz          L(99)
#define Ls_yyyyyyyyz         Ls(99)
    v0           = L_xxxxxxxx + L_xxxxxxxxy*y + L_xxxxxxxxz*z
    v1           = L_xxxxxxxy + L_xxxxxxxyz*z
    v2           = L_xxxxxxxyy*y + v1
    v3           = L_xxxxxxyy + L_xxxxxxyyz*z
    v4           = L_xxxxxxyyy*y + v3
    v5           = L_xxxxxyyy + L_xxxxxyyyz*z
    v6           = L_xxxxxyyyy*y + v5
    v7           = L_xxxxyyyy + L_xxxxyyyyz*z
    v8           = L_xxxxyyyyy*y + v7
    v9           = L_xxxyyyyy + L_xxxyyyyyz*z
    v10          = L_xxxyyyyyy*y + v9
    v11          = L_xxyyyyyy + L_xxyyyyyyz*z
    v12          = L_xxyyyyyyy*y + v11
    v13          = L_xyyyyyyy + L_xyyyyyyyz*z
    v14          = L_xyyyyyyyy*y + v13
    v15          = L_yyyyyyyy + L_yyyyyyyyz*z
    v16          = L_xxxxxxxz*z
    v23          = v1*y
    v25          = L_xxxxxxyz*z
    v28          = v3*y
    v31          = L_xxxxxxz*z
    v42          = 0.5d0*x
    v48          = L_xxxxxyyz*z
    v51          = v5*y
    v54          = L_xxxxxyz*z
    v65          = L_xxxxxz*z
    v79          = 0.166666666666667d0*x
    v89          = L_xxxxyyyz*z
    v92          = v7*y
    v95          = L_xxxxyyz*z
    v106         = L_xxxxyz*z
    v122         = L_xxxxz*z
    v139         = 0.0416666666666667d0*x
    v151         = L_xxxyyyyz*z
    v154         = v9*y
    v157         = L_xxxyyyz*z
    v168         = L_xxxyyz*z
    v184         = L_xxxyz*z
    v204         = L_xxxz*z
    v224         = 0.00833333333333333d0*x
    v238         = L_xxyyyyyz*z
    v241         = v11*y
    v244         = L_xxyyyyz*z
    v255         = L_xxyyyz*z
    v271         = L_xxyyz*z
    v291         = L_xxyz*z
    v315         = L_xxz*z
    v338         = 0.00138888888888889d0*x
    v354         = L_xyyyyyyz*z
    v357         = v13*y
    v360         = L_xyyyyyz*z
    v371         = L_xyyyyz*z
    v387         = L_xyyyz*z
    v407         = L_xyyz*z
    v431         = L_xyz*z
    v459         = L_xz*z
    v484         = 0.000198412698412698d0*x
    v502         = L_yyyyyyyz*z
    v505         = L_yyyyyyz*z
    v508         = 0.5d0*y
    v512         = L_yyyyyz*z
    v517         = 0.166666666666667d0*y
    v523         = L_yyyyz*z
    v530         = 0.0416666666666667d0*y
    v537         = L_yyyz*z
    v546         = 0.00833333333333333d0*y
    v554         = L_yyz*z
    v565         = 0.00138888888888889d0*y
    v574         = L_yz*z
    v588         = 0.000198412698412698d0*y
    Ls_xxxxxxxx  = L_xxxxxxxxx*x + v0
    Ls_xxxxxxxy  = L_xxxxxxxxy*x + v2
    Ls_xxxxxxyy  = L_xxxxxxxyy*x + v4
    Ls_xxxxxyyy  = L_xxxxxxyyy*x + v6
    Ls_xxxxyyyy  = L_xxxxxyyyy*x + v8
    Ls_xxxyyyyy  = L_xxxxyyyyy*x + v10
    Ls_xxyyyyyy  = L_xxxyyyyyy*x + v12
    Ls_xyyyyyyy  = L_xxyyyyyyy*x + v14
    Ls_yyyyyyyy  = v15 + L_xyyyyyyyy*x + L_yyyyyyyyy*y
    Ls_xxxxxxxxx = L_xxxxxxxxx
    Ls_xxxxxxxxy = L_xxxxxxxxy
    Ls_xxxxxxxxz = L_xxxxxxxxz
    Ls_xxxxxxxyy = L_xxxxxxxyy
    Ls_xxxxxxxyz = L_xxxxxxxyz
    Ls_xxxxxxyyy = L_xxxxxxyyy
    Ls_xxxxxxyyz = L_xxxxxxyyz
    Ls_xxxxxyyyy = L_xxxxxyyyy
    Ls_xxxxxyyyz = L_xxxxxyyyz
    Ls_xxxxyyyyy = L_xxxxyyyyy
    Ls_xxxxyyyyz = L_xxxxyyyyz
    Ls_xxxyyyyyy = L_xxxyyyyyy
    Ls_xxxyyyyyz = L_xxxyyyyyz
    Ls_xxyyyyyyy = L_xxyyyyyyy
    Ls_xxyyyyyyz = L_xxyyyyyyz
    Ls_xyyyyyyyy = L_xyyyyyyyy
    Ls_xyyyyyyyz = L_xyyyyyyyz
    Ls_yyyyyyyyy = L_yyyyyyyyy
    Ls_yyyyyyyyz = L_yyyyyyyyz
    L_zz         = -(L_xx + L_yy)
    L_xzz        = -(L_xxx + L_xyy)
    v487         = L_xzz*z
    L_yzz        = -(L_xxy + L_yyy)
    v590         = L_yzz*z
    L_zzz        = -(L_xxz + L_yyz)
    L_xxzz       = -(L_xxxx + L_xxyy)
    v341         = L_xxzz*z
    L_xyzz       = -(L_xxxy + L_xyyy)
    v446         = L_xyzz*z
    L_xzzz       = -(L_xxxz + L_xyyz)
    L_yyzz       = -(L_xxyy + L_yyyy)
    v567         = L_yyzz*z
    L_yzzz       = -(L_xxyz + L_yyyz)
    L_zzzz       = -(L_xxzz + L_yyzz)
    L_xxxzz      = -(L_xxxxx + L_xxxyy)
    v227         = L_xxxzz*z
    L_xxyzz      = -(L_xxxxy + L_xxyyy)
    v304         = L_xxyzz*z
    L_xxzzz      = -(L_xxxxz + L_xxyyz)
    L_xyyzz      = -(L_xxxyy + L_xyyyy)
    v420         = L_xyyzz*z
    L_xyzzz      = -(L_xxxyz + L_xyyyz)
    L_xzzzz      = -(L_xxxzz + L_xyyzz)
    L_yyyzz      = -(L_xxyyy + L_yyyyy)
    v548         = L_yyyzz*z
    L_yyzzz      = -(L_xxyyz + L_yyyyz)
    L_yzzzz      = -(L_xxyzz + L_yyyzz)
    L_zzzzz      = -(L_xxzzz + L_yyzzz)
    L_xxxxzz     = -(L_xxxxxx + L_xxxxyy)
    v142         = L_xxxxzz*z
    L_xxxyzz     = -(L_xxxxxy + L_xxxyyy)
    v195         = L_xxxyzz*z
    L_xxxzzz     = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz     = -(L_xxxxyy + L_xxyyyy)
    v282         = L_xxyyzz*z
    L_xxyzzz     = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz     = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz     = -(L_xxxyyy + L_xyyyyy)
    v398         = L_xyyyzz*z
    L_xyyzzz     = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz     = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz     = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz     = -(L_xxyyyy + L_yyyyyy)
    v532         = L_yyyyzz*z
    L_yyyzzz     = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz     = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz     = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz     = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz    = -(L_xxxxxxx + L_xxxxxyy)
    v82          = L_xxxxxzz*z
    L_xxxxyzz    = -(L_xxxxxxy + L_xxxxyyy)
    v115         = L_xxxxyzz*z
    L_xxxxzzz    = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz    = -(L_xxxxxyy + L_xxxyyyy)
    v177         = L_xxxyyzz*z
    L_xxxyzzz    = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz    = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz    = -(L_xxxxyyy + L_xxyyyyy)
    v264         = L_xxyyyzz*z
    L_xxyyzzz    = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz    = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz    = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz    = -(L_xxxyyyy + L_xyyyyyy)
    v380         = L_xyyyyzz*z
    L_xyyyzzz    = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz    = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz    = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz    = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz    = -(L_xxyyyyy + L_yyyyyyy)
    v519         = L_yyyyyzz*z
    L_yyyyzzz    = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz    = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz    = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz    = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz    = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz   = -(L_xxxxxxxx + L_xxxxxxyy)
    v44          = L_xxxxxxzz*z
    L_xxxxxyzz   = -(L_xxxxxxxy + L_xxxxxyyy)
    v61          = L_xxxxxyzz*z
    L_xxxxxzzz   = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz   = -(L_xxxxxxyy + L_xxxxyyyy)
    v102         = L_xxxxyyzz*z
    L_xxxxyzzz   = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz   = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz   = -(L_xxxxxyyy + L_xxxyyyyy)
    v164         = L_xxxyyyzz*z
    L_xxxyyzzz   = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz   = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz   = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz   = -(L_xxxxyyyy + L_xxyyyyyy)
    v251         = L_xxyyyyzz*z
    L_xxyyyzzz   = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz   = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz   = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz   = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz   = -(L_xxxyyyyy + L_xyyyyyyy)
    v367         = L_xyyyyyzz*z
    L_xyyyyzzz   = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz   = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz   = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz   = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz   = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz   = -(L_xxyyyyyy + L_yyyyyyyy)
    v510         = L_yyyyyyzz*z
    L_yyyyyzzz   = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz   = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz   = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz   = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz   = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz   = -(L_xxzzzzzz + L_yyzzzzzz)
    L_xxxxxxxzz  = -(L_xxxxxxxxx + L_xxxxxxxyy)
    v24          = L_xxxxxxxz + L_xxxxxxxyz*y + L_xxxxxxxzz*z
    Ls_xxxxxxxz  = L_xxxxxxxxz*x + v24
    L_xxxxxxyzz  = -(L_xxxxxxxxy + L_xxxxxxyyy)
    v29          = L_xxxxxxyz + L_xxxxxxyzz*z
    v30          = L_xxxxxxyyz*y + v29
    v47          = v29*y
    Ls_xxxxxxyz  = L_xxxxxxxyz*x + v30
    L_xxxxxxzzz  = -(L_xxxxxxxxz + L_xxxxxxyyz)
    L_xxxxxyyzz  = -(L_xxxxxxxyy + L_xxxxxyyyy)
    v52          = L_xxxxxyyz + L_xxxxxyyzz*z
    v53          = L_xxxxxyyyz*y + v52
    v64          = v52*y
    Ls_xxxxxyyz  = L_xxxxxxyyz*x + v53
    L_xxxxxyzzz  = -(L_xxxxxxxyz + L_xxxxxyyyz)
    L_xxxxxzzzz  = -(L_xxxxxxxzz + L_xxxxxyyzz)
    L_xxxxyyyzz  = -(L_xxxxxxyyy + L_xxxxyyyyy)
    v93          = L_xxxxyyyz + L_xxxxyyyzz*z
    v94          = L_xxxxyyyyz*y + v93
    v105         = v93*y
    Ls_xxxxyyyz  = L_xxxxxyyyz*x + v94
    L_xxxxyyzzz  = -(L_xxxxxxyyz + L_xxxxyyyyz)
    L_xxxxyzzzz  = -(L_xxxxxxyzz + L_xxxxyyyzz)
    L_xxxxzzzzz  = -(L_xxxxxxzzz + L_xxxxyyzzz)
    L_xxxyyyyzz  = -(L_xxxxxyyyy + L_xxxyyyyyy)
    v155         = L_xxxyyyyz + L_xxxyyyyzz*z
    v156         = L_xxxyyyyyz*y + v155
    v167         = v155*y
    Ls_xxxyyyyz  = L_xxxxyyyyz*x + v156
    L_xxxyyyzzz  = -(L_xxxxxyyyz + L_xxxyyyyyz)
    L_xxxyyzzzz  = -(L_xxxxxyyzz + L_xxxyyyyzz)
    L_xxxyzzzzz  = -(L_xxxxxyzzz + L_xxxyyyzzz)
    L_xxxzzzzzz  = -(L_xxxxxzzzz + L_xxxyyzzzz)
    L_xxyyyyyzz  = -(L_xxxxyyyyy + L_xxyyyyyyy)
    v242         = L_xxyyyyyz + L_xxyyyyyzz*z
    v243         = L_xxyyyyyyz*y + v242
    v254         = v242*y
    Ls_xxyyyyyz  = L_xxxyyyyyz*x + v243
    L_xxyyyyzzz  = -(L_xxxxyyyyz + L_xxyyyyyyz)
    L_xxyyyzzzz  = -(L_xxxxyyyzz + L_xxyyyyyzz)
    L_xxyyzzzzz  = -(L_xxxxyyzzz + L_xxyyyyzzz)
    L_xxyzzzzzz  = -(L_xxxxyzzzz + L_xxyyyzzzz)
    L_xxzzzzzzz  = -(L_xxxxzzzzz + L_xxyyzzzzz)
    L_xyyyyyyzz  = -(L_xxxyyyyyy + L_xyyyyyyyy)
    v358         = L_xyyyyyyz + L_xyyyyyyzz*z
    v359         = L_xyyyyyyyz*y + v358
    v370         = v358*y
    Ls_xyyyyyyz  = L_xxyyyyyyz*x + v359
    L_xyyyyyzzz  = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz  = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz  = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz  = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz  = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz  = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz  = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v504         = L_yyyyyyyz + L_yyyyyyyzz*z
    Ls_yyyyyyyz  = v504 + L_xyyyyyyyz*x + L_yyyyyyyyz*y
    L_yyyyyyzzz  = -(L_xxyyyyyyz + L_yyyyyyyyz)
    L_yyyyyzzzz  = -(L_xxyyyyyzz + L_yyyyyyyzz)
    L_yyyyzzzzz  = -(L_xxyyyyzzz + L_yyyyyyzzz)
    L_yyyzzzzzz  = -(L_xxyyyzzzz + L_yyyyyzzzz)
    L_yyzzzzzzz  = -(L_xxyyzzzzz + L_yyyyzzzzz)
    L_yzzzzzzzz  = -(L_xxyzzzzzz + L_yyyzzzzzz)
    L_zzzzzzzzz  = -(L_xxzzzzzzz + L_yyzzzzzzz)
    c1           = z
    b1           = y
    a1           = x
    a2           = a1*a1
    v17          = a2
    v18          = 0.5d0*v17
    v78          = 0.25d0*v17
    v138         = 0.0833333333333333d0*v17
    v223         = 0.0208333333333333d0*v17
    v337         = 0.00416666666666667d0*v17
    v483         = 0.000694444444444444d0*v17
    a3           = a1*a2
    v32          = a3
    v33          = 0.166666666666667d0*v32
    v137         = 0.0833333333333333d0*v32
    v222         = 0.0277777777777778d0*v32
    v336         = 0.00694444444444444d0*v32
    v482         = 0.00138888888888889d0*v32
    a4           = a2*a2
    v66          = a4
    v67          = 0.0416666666666667d0*v66
    v219         = 0.0208333333333333d0*v66
    v335         = 0.00694444444444444d0*v66
    v481         = 0.00173611111111111d0*v66
    a5           = a2*a3
    v123         = a5
    v124         = 0.00833333333333333d0*v123
    v331         = 0.00416666666666667d0*v123
    v480         = 0.00138888888888889d0*v123
    a6           = a3*a3
    v205         = a6
    v206         = 0.00138888888888889d0*v205
    v475         = 0.000694444444444444d0*v205
    a7           = a3*a4
    v316         = a7
    v317         = 0.000198412698412698d0*v316
    a8           = a4*a4
    v460         = 2.48015873015873d-5*a8
    a9           = a4*a5
    b2           = b1*b1
    v19          = b2
    v20          = L_xxxxxxxyy*v19
    v26          = L_xxxxxxyyy*v19
    v39          = 0.5d0*v19
    v45          = L_xxxxxxyyz*v19
    v49          = L_xxxxxyyyy*v19
    v62          = L_xxxxxyyyz*v19
    v80          = 3.0d0*v19
    v90          = L_xxxxyyyyy*v19
    v103         = L_xxxxyyyyz*v19
    v152         = L_xxxyyyyyy*v19
    v165         = L_xxxyyyyyz*v19
    v239         = L_xxyyyyyyy*v19
    v252         = L_xxyyyyyyz*v19
    v355         = L_xyyyyyyyy*v19
    v368         = L_xyyyyyyyz*v19
    v516         = 0.25d0*v19
    v529         = 0.0833333333333333d0*v19
    v545         = 0.0208333333333333d0*v19
    v564         = 0.00416666666666667d0*v19
    v587         = 0.000694444444444444d0*v19
    b3           = b1*b2
    v34          = b3
    v35          = L_xxxxxxyyy*v34
    v55          = L_xxxxxyyyy*v34
    v74          = 0.166666666666667d0*v34
    v83          = L_xxxxxyyyz*v34
    v96          = L_xxxxyyyyy*v34
    v116         = L_xxxxyyyyz*v34
    v140         = 4.0d0*v34
    v158         = L_xxxyyyyyy*v34
    v178         = L_xxxyyyyyz*v34
    v245         = L_xxyyyyyyy*v34
    v265         = L_xxyyyyyyz*v34
    v361         = L_xyyyyyyyy*v34
    v381         = L_xyyyyyyyz*v34
    v528         = 0.0833333333333333d0*v34
    v544         = 0.0277777777777778d0*v34
    v563         = 0.00694444444444444d0*v34
    v586         = 0.00138888888888889d0*v34
    b4           = b2*b2
    v68          = b4
    v69          = L_xxxxxyyyy*v68
    v107         = L_xxxxyyyyy*v68
    v132         = 0.0416666666666667d0*v68
    v143         = L_xxxxyyyyz*v68
    v169         = L_xxxyyyyyy*v68
    v196         = L_xxxyyyyyz*v68
    v225         = 5.0d0*v68
    v256         = L_xxyyyyyyy*v68
    v283         = L_xxyyyyyyz*v68
    v372         = L_xyyyyyyyy*v68
    v399         = L_xyyyyyyyz*v68
    v543         = 0.0208333333333333d0*v68
    v562         = 0.00694444444444444d0*v68
    v585         = 0.00173611111111111d0*v68
    b5           = b2*b3
    v125         = b5
    v126         = L_xxxxyyyyy*v125
    v185         = L_xxxyyyyyy*v125
    v215         = 0.00833333333333333d0*v125
    v228         = L_xxxyyyyyz*v125
    v272         = L_xxyyyyyyy*v125
    v305         = L_xxyyyyyyz*v125
    v339         = 6.0d0*v125
    v388         = L_xyyyyyyyy*v125
    v421         = L_xyyyyyyyz*v125
    v561         = 0.00416666666666667d0*v125
    v584         = 0.00138888888888889d0*v125
    b6           = b3*b3
    v207         = b6
    v208         = L_xxxyyyyyy*v207
    v292         = L_xxyyyyyyy*v207
    v327         = 0.00138888888888889d0*v207
    v342         = L_xxyyyyyyz*v207
    v408         = L_xyyyyyyyy*v207
    v447         = L_xyyyyyyyz*v207
    v485         = 7.0d0*v207
    v583         = 0.000694444444444444d0*v207
    b7           = b3*b4
    v318         = b7
    v319         = L_xxyyyyyyy*v318
    v432         = L_xyyyyyyyy*v318
    v471         = 0.000198412698412698d0*v318
    v488         = L_xyyyyyyyz*v318
    b8           = b4*b4
    v461         = b8
    v462         = L_xyyyyyyyy*v461
    v575         = 2.48015873015873d-5*v461
    b9           = b4*b5
    c2           = c1*c1
    v21          = c2
    v598         = 0.5d0*v21
    v463         = L_xzz*v21
    v576         = L_yzz*v21
    v320         = L_xxzz*v21
    v433         = L_xyzz*v21
    v489         = L_xzzz*v21
    v555         = L_yyzz*v21
    v591         = L_yzzz*v21
    v209         = L_xxxzz*v21
    v293         = L_xxyzz*v21
    v343         = L_xxzzz*v21
    v409         = L_xyyzz*v21
    v448         = L_xyzzz*v21
    v538         = L_yyyzz*v21
    v568         = L_yyzzz*v21
    v127         = L_xxxxzz*v21
    v186         = L_xxxyzz*v21
    v229         = L_xxxzzz*v21
    v273         = L_xxyyzz*v21
    v306         = L_xxyzzz*v21
    v389         = L_xyyyzz*v21
    v422         = L_xyyzzz*v21
    v524         = L_yyyyzz*v21
    v549         = L_yyyzzz*v21
    v70          = L_xxxxxzz*v21
    v108         = L_xxxxyzz*v21
    v144         = L_xxxxzzz*v21
    v170         = L_xxxyyzz*v21
    v197         = L_xxxyzzz*v21
    v257         = L_xxyyyzz*v21
    v284         = L_xxyyzzz*v21
    v373         = L_xyyyyzz*v21
    v400         = L_xyyyzzz*v21
    v513         = L_yyyyyzz*v21
    v533         = L_yyyyzzz*v21
    v36          = L_xxxxxxzz*v21
    v56          = L_xxxxxyzz*v21
    v84          = L_xxxxxzzz*v21
    v97          = L_xxxxyyzz*v21
    v117         = L_xxxxyzzz*v21
    v159         = L_xxxyyyzz*v21
    v179         = L_xxxyyzzz*v21
    v246         = L_xxyyyyzz*v21
    v266         = L_xxyyyzzz*v21
    v362         = L_xyyyyyzz*v21
    v382         = L_xyyyyzzz*v21
    v506         = L_yyyyyyzz*v21
    v520         = L_yyyyyzzz*v21
    v22          = L_xxxxxxxzz*v21
    v43          = v20 + v22 + 2.0d0*(L_xxxxxxx + v16 + v23)
    Ls_xxxxxxx   = 0.5d0*(v20 + v22) + L_xxxxxxx + L_xxxxxxxxx*v18 + v0*x + v16 + v23
    v27          = L_xxxxxxyzz*v21
    v40          = v27 + 2.0d0*(L_xxxxxxy + v25)
    v41          = v40*y
    v60          = 2.0d0*v28 + v26 + v40
    Ls_xxxxxxy   = 0.5d0*(v26 + v27) + L_xxxxxxxxy*v18 + L_xxxxxxy + v2*x + v25 + v28
    v46          = L_xxxxxxzzz*v21
    v88          = v45 + v46 + 2.0d0*(L_xxxxxxz + v44 + v47)
    Ls_xxxxxxz   = 0.5d0*(v45 + v46) + L_xxxxxxxxz*v18 + L_xxxxxxz + v24*x + v44 + v47
    v50          = L_xxxxxyyzz*v21
    v58          = v50 + 2.0d0*(L_xxxxxyy + v48)
    v59          = v58*y
    v75          = v19*v58
    v101         = 2.0d0*v51 + v49 + v58
    Ls_xxxxxyy   = 0.5d0*(v49 + v50) + L_xxxxxxxyy*v18 + L_xxxxxyy + v4*x + v48 + v51
    v63          = L_xxxxxyzzz*v21
    v86          = v63 + 2.0d0*(L_xxxxxyz + v61)
    v87          = v86*y
    v121         = 2.0d0*v64 + v62 + v86
    Ls_xxxxxyz   = 0.5d0*(v62 + v63) + L_xxxxxxxyz*v18 + L_xxxxxyz + v30*x + v61 + v64
    v91          = L_xxxxyyyzz*v21
    v99          = v91 + 2.0d0*(L_xxxxyyy + v89)
    v100         = v99*y
    v111         = v19*v99
    v133         = v34*v99
    v163         = 2.0d0*v92 + v90 + v99
    Ls_xxxxyyy   = 0.5d0*(v90 + v91) + L_xxxxxxyyy*v18 + L_xxxxyyy + v6*x + v89 + v92
    v104         = L_xxxxyyzzz*v21
    v119         = v104 + 2.0d0*(L_xxxxyyz + v102)
    v120         = v119*y
    v147         = v119*v19
    v183         = 2.0d0*v105 + v103 + v119
    Ls_xxxxyyz   = 0.5d0*(v103 + v104) + L_xxxxxxyyz*v18 + L_xxxxyyz + v102 + v105 + v53*x
    v153         = L_xxxyyyyzz*v21
    v161         = v153 + 2.0d0*(L_xxxyyyy + v151)
    v162         = v161*y
    v173         = v161*v19
    v190         = v161*v34
    v216         = v161*v68
    v250         = 2.0d0*v154 + v152 + v161
    Ls_xxxyyyy   = 0.5d0*(v152 + v153) + L_xxxxxyyyy*v18 + L_xxxyyyy + v151 + v154 + v8*x
    v166         = L_xxxyyyzzz*v21
    v181         = v166 + 2.0d0*(L_xxxyyyz + v164)
    v182         = v181*y
    v200         = v181*v19
    v233         = v181*v34
    v270         = 2.0d0*v167 + v165 + v181
    Ls_xxxyyyz   = 0.5d0*(v165 + v166) + L_xxxxxyyyz*v18 + L_xxxyyyz + v164 + v167 + v94*x
    v240         = L_xxyyyyyzz*v21
    v248         = v240 + 2.0d0*(L_xxyyyyy + v238)
    v249         = v248*y
    v260         = v19*v248
    v277         = v248*v34
    v298         = v248*v68
    v328         = v125*v248
    v366         = 2.0d0*v241 + v239 + v248
    Ls_xxyyyyy   = 0.5d0*(v239 + v240) + L_xxxxyyyyy*v18 + L_xxyyyyy + v10*x + v238 + v241
    v253         = L_xxyyyyzzz*v21
    v268         = v253 + 2.0d0*(L_xxyyyyz + v251)
    v269         = v268*y
    v287         = v19*v268
    v310         = v268*v34
    v348         = v268*v68
    v386         = 2.0d0*v254 + v252 + v268
    Ls_xxyyyyz   = 0.5d0*(v252 + v253) + L_xxxxyyyyz*v18 + L_xxyyyyz + v156*x + v251 + v254
    v356         = L_xyyyyyyzz*v21
    v364         = v356 + 2.0d0*(L_xyyyyyy + v354)
    v365         = v364*y
    v376         = v19*v364
    v393         = v34*v364
    v414         = v364*v68
    v439         = v125*v364
    v472         = v207*v364
    Ls_xyyyyyy   = 0.5d0*(v355 + v356) + L_xxxyyyyyy*v18 + L_xyyyyyy + v12*x + v354 + v357
    v369         = L_xyyyyyzzz*v21
    v384         = v369 + 2.0d0*(L_xyyyyyz + v367)
    v385         = v384*y
    v403         = v19*v384
    v426         = v34*v384
    v453         = v384*v68
    v495         = v125*v384
    Ls_xyyyyyz   = 0.5d0*(v368 + v369) + L_xxxyyyyyz*v18 + L_xyyyyyz + v243*x + v367 + v370
    v503         = L_yyyyyyyzz*v21
    v509         = v503 + 2.0d0*(L_yyyyyyy + v502)
    Ls_yyyyyyy   = 0.5d0*v503 + L_xxyyyyyyy*v18 + L_yyyyyyy + L_yyyyyyyyy*v39 + v14*x + v15 &
      *y + v502
    v511         = L_yyyyyyzzz*v21
    v522         = v511 + 2.0d0*(L_yyyyyyz + v510)
    Ls_yyyyyyz   = 0.5d0*v511 + L_xxyyyyyyz*v18 + L_yyyyyyyyz*v39 + L_yyyyyyz + v359*x + &
      v504*y + v510
    h            = v17 + v19 + v21
    u2           = 1.0/h
    u            = sqrt(u2)
    u3           = u*u2
    u4           = u2*u2
    u5           = u2*u3
    u6           = u3*u3
    u7           = u3*u4
    u8           = u4*u4
    u9           = u4*u5
    u10          = u5*u5
    u11          = u5*u6
    u12          = u6*u6
    u13          = u6*u7
    u14          = u7*u7
    u15          = u7*u8
    u16          = u8*u8
    u17          = u8*u9
    u18          = u9*u9
    u19          = u10*u9
    c3           = c1*c2
    v37          = c3
    v599         = 0.166666666666667d0*v37
    v464         = L_xzzz*v37
    v577         = L_yzzz*v37
    v321         = L_xxzzz*v37
    v434         = L_xyzzz*v37
    v490         = L_xzzzz*v37
    v556         = L_yyzzz*v37
    v592         = L_yzzzz*v37
    v210         = L_xxxzzz*v37
    v294         = L_xxyzzz*v37
    v344         = L_xxzzzz*v37
    v410         = L_xyyzzz*v37
    v449         = L_xyzzzz*v37
    v539         = L_yyyzzz*v37
    v569         = L_yyzzzz*v37
    v128         = L_xxxxzzz*v37
    v187         = L_xxxyzzz*v37
    v230         = L_xxxzzzz*v37
    v274         = L_xxyyzzz*v37
    v307         = L_xxyzzzz*v37
    v390         = L_xyyyzzz*v37
    v423         = L_xyyzzzz*v37
    v525         = L_yyyyzzz*v37
    v550         = L_yyyzzzz*v37
    v71          = L_xxxxxzzz*v37
    v109         = L_xxxxyzzz*v37
    v145         = L_xxxxzzzz*v37
    v171         = L_xxxyyzzz*v37
    v198         = L_xxxyzzzz*v37
    v258         = L_xxyyyzzz*v37
    v285         = L_xxyyzzzz*v37
    v374         = L_xyyyyzzz*v37
    v401         = L_xyyyzzzz*v37
    v514         = L_yyyyyzzz*v37
    v534         = L_yyyyzzzz*v37
    v38          = L_xxxxxxzzz*v37
    v81          = v35 + v38 + v3*v80 + 6.0d0*(L_xxxxxx + v31) + 3.0d0*(v36 + v41)
    Ls_xxxxxx    = 0.166666666666667d0*(v35 + v38 + 3.0d0*(v36 + v41)) + L_xxxxxx + &
      L_xxxxxxxxx*v33 + v0*v18 + v3*v39 + v31 + v42*v43
    v57          = L_xxxxxyzzz*v37
    v76          = v57 + 3.0d0*(2.0d0*L_xxxxxy + 2.0d0*v54 + v56)
    v77          = v76*y
    v114         = v55 + v76 + v5*v80 + 3.0d0*v59
    Ls_xxxxxy    = 0.166666666666667d0*(v55 + v57 + 3.0d0*(v56 + v59)) + L_xxxxxxxxy*v33 + &
      L_xxxxxy + v18*v2 + v39*v5 + v42*v60 + v54
    v85          = L_xxxxxzzzz*v37
    v150         = v83 + v85 + v52*v80 + 6.0d0*(L_xxxxxz + v82) + 3.0d0*(v84 + v87)
    Ls_xxxxxz    = 0.166666666666667d0*(v83 + v85 + 3.0d0*(v84 + v87)) + L_xxxxxxxxz*v33 + &
      L_xxxxxz + v18*v24 + v39*v52 + v42*v88 + v82
    v98          = L_xxxxyyzzz*v37
    v112         = v98 + 3.0d0*(2.0d0*L_xxxxyy + 2.0d0*v95 + v97)
    v113         = v112*y
    v134         = v112*v19
    v176         = 3.0d0*v100 + v7*v80 + v112 + v96
    Ls_xxxxyy    = 0.166666666666667d0*(v96 + v98 + 3.0d0*(v100 + v97)) + L_xxxxxxxyy*v33 + &
      L_xxxxyy + v101*v42 + v18*v4 + v39*v7 + v95
    v118         = L_xxxxyzzzz*v37
    v148         = v118 + 3.0d0*(2.0d0*L_xxxxyz + 2.0d0*v115 + v117)
    v149         = v148*y
    v203         = v116 + v148 + 3.0d0*v120 + v80*v93
    Ls_xxxxyz    = 0.166666666666667d0*(v116 + v118 + 3.0d0*(v117 + v120)) + L_xxxxxxxyz* &
      v33 + L_xxxxyz + v115 + v121*v42 + v18*v30 + v39*v93
    v160         = L_xxxyyyzzz*v37
    v174         = v160 + 3.0d0*(2.0d0*L_xxxyyy + 2.0d0*v157 + v159)
    v175         = v174*y
    v191         = v174*v19
    v217         = v174*v34
    v263         = v158 + v174 + 3.0d0*v162 + v80*v9
    Ls_xxxyyy    = 0.166666666666667d0*(v158 + v160 + 3.0d0*(v159 + v162)) + L_xxxxxxyyy* &
      v33 + L_xxxyyy + v157 + v163*v42 + v18*v6 + v39*v9
    v180         = L_xxxyyzzzz*v37
    v201         = v180 + 3.0d0*(2.0d0*L_xxxyyz + 2.0d0*v177 + v179)
    v202         = v201*y
    v234         = v19*v201
    v290         = v178 + v201 + v155*v80 + 3.0d0*v182
    Ls_xxxyyz    = 0.166666666666667d0*(v178 + v180 + 3.0d0*(v179 + v182)) + L_xxxxxxyyz* &
      v33 + L_xxxyyz + v155*v39 + v177 + v18*v53 + v183*v42
    v247         = L_xxyyyyzzz*v37
    v261         = v247 + 3.0d0*(2.0d0*L_xxyyyy + 2.0d0*v244 + v246)
    v262         = v261*y
    v278         = v19*v261
    v299         = v261*v34
    v329         = v261*v68
    v379         = v245 + v261 + v11*v80 + 3.0d0*v249
    Ls_xxyyyy    = 0.166666666666667d0*(v245 + v247 + 3.0d0*(v246 + v249)) + L_xxxxxyyyy* &
      v33 + L_xxyyyy + v11*v39 + v18*v8 + v244 + v250*v42
    v267         = L_xxyyyzzzz*v37
    v288         = v267 + 3.0d0*(2.0d0*L_xxyyyz + 2.0d0*v264 + v266)
    v289         = v288*y
    v311         = v19*v288
    v349         = v288*v34
    v406         = v265 + v288 + v242*v80 + 3.0d0*v269
    Ls_xxyyyz    = 0.166666666666667d0*(v265 + v267 + 3.0d0*(v266 + v269)) + L_xxxxxyyyz* &
      v33 + L_xxyyyz + v18*v94 + v242*v39 + v264 + v270*v42
    v363         = L_xyyyyyzzz*v37
    v377         = v363 + 3.0d0*(2.0d0*L_xyyyyy + 2.0d0*v360 + v362)
    v378         = v377*y
    v394         = v19*v377
    v415         = v34*v377
    v440         = v377*v68
    v473         = v125*v377
    Ls_xyyyyy    = 0.166666666666667d0*(v361 + v363 + 3.0d0*(v362 + v365)) + L_xxxxyyyyy* &
      v33 + L_xyyyyy + v10*v18 + v13*v39 + v360 + v366*v42
    v383         = L_xyyyyzzzz*v37
    v404         = v383 + 3.0d0*(2.0d0*L_xyyyyz + 2.0d0*v380 + v382)
    v405         = v404*y
    v427         = v19*v404
    v454         = v34*v404
    v496         = v404*v68
    Ls_xyyyyz    = 0.166666666666667d0*(v381 + v383 + 3.0d0*(v382 + v385)) + L_xxxxyyyyz* &
      v33 + L_xyyyyz + v156*v18 + v358*v39 + v380 + v386*v42
    v507         = L_yyyyyyzzz*v37
    v518         = v507 + 3.0d0*(2.0d0*L_yyyyyy + 2.0d0*v505 + v506)
    Ls_yyyyyy    = 0.166666666666667d0*(3.0d0*v506 + v507) + L_xxxyyyyyy*v33 + L_yyyyyy + &
      L_yyyyyyyyy*v74 + v12*v18 + v15*v39 + v42*(v355 + 2.0d0*v357 + &
      v364) + v505 + v508*v509
    v521         = L_yyyyyzzzz*v37
    v536         = v521 + 3.0d0*(2.0d0*L_yyyyyz + 2.0d0*v519 + v520)
    Ls_yyyyyz    = 0.166666666666667d0*(3.0d0*v520 + v521) + L_xxxyyyyyz*v33 + L_yyyyyyyyz* &
      v74 + L_yyyyyz + v18*v243 + v39*v504 + v42*(v368 + 2.0d0*v370 + &
      v384) + v508*v522 + v519
    c4           = c2*c2
    v72          = c4
    v600         = 0.0416666666666667d0*v72
    v465         = L_xzzzz*v72
    v578         = L_yzzzz*v72
    v322         = L_xxzzzz*v72
    v435         = L_xyzzzz*v72
    v491         = L_xzzzzz*v72
    v557         = L_yyzzzz*v72
    v593         = L_yzzzzz*v72
    v211         = L_xxxzzzz*v72
    v295         = L_xxyzzzz*v72
    v345         = L_xxzzzzz*v72
    v411         = L_xyyzzzz*v72
    v450         = L_xyzzzzz*v72
    v540         = L_yyyzzzz*v72
    v570         = L_yyzzzzz*v72
    v129         = L_xxxxzzzz*v72
    v188         = L_xxxyzzzz*v72
    v231         = L_xxxzzzzz*v72
    v275         = L_xxyyzzzz*v72
    v308         = L_xxyzzzzz*v72
    v391         = L_xyyyzzzz*v72
    v424         = L_xyyzzzzz*v72
    v526         = L_yyyyzzzz*v72
    v551         = L_yyyzzzzz*v72
    v73          = L_xxxxxzzzz*v72
    v141         = v69 + v73 + v140*v5 + 12.0d0*v70 + 6.0d0*v75 + 24.0d0*(L_xxxxx + v65) + &
      4.0d0*(v71 + v77)
    Ls_xxxxx     = 0.0416666666666667d0*(v69 + 12.0d0*v70 + v73 + 6.0d0*v75 + 4.0d0*(v71 + &
      v77)) + L_xxxxx + L_xxxxxxxxx*v67 + v0*v33 + v43*v78 + v5*v74 + &
      v65 + v79*v81
    v110         = L_xxxxyzzzz*v72
    v135         = v110 + 12.0d0*v108 + 4.0d0*(6.0d0*L_xxxxy + 6.0d0*v106 + v109)
    v136         = v135*y
    v194         = v107 + v135 + 6.0d0*v111 + 4.0d0*v113 + v140*v7
    Ls_xxxxy     = 0.0416666666666667d0*(v107 + 12.0d0*v108 + v110 + 6.0d0*v111 + 4.0d0*( &
      v109 + v113)) + L_xxxxxxxxy*v67 + L_xxxxy + v106 + v114*v79 + v2* &
      v33 + v60*v78 + v7*v74
    v146         = L_xxxxzzzzz*v72
    v237         = v143 + v146 + v140*v93 + 12.0d0*v144 + 6.0d0*v147 + 24.0d0*(L_xxxxz + &
      v142) + 4.0d0*(v145 + v149)
    Ls_xxxxz     = 0.0416666666666667d0*(v143 + 12.0d0*v144 + v146 + 6.0d0*v147 + 4.0d0*( &
      v145 + v149)) + L_xxxxxxxxz*v67 + L_xxxxz + v142 + v150*v79 + v24 &
      *v33 + v74*v93 + v78*v88
    v172         = L_xxxyyzzzz*v72
    v192         = v172 + 12.0d0*v170 + 4.0d0*(6.0d0*L_xxxyy + 6.0d0*v168 + v171)
    v193         = v192*y
    v218         = v19*v192
    v281         = v169 + v192 + v140*v9 + 6.0d0*v173 + 4.0d0*v175
    Ls_xxxyy     = 0.0416666666666667d0*(v169 + 12.0d0*v170 + v172 + 6.0d0*v173 + 4.0d0*( &
      v171 + v175)) + L_xxxxxxxyy*v67 + L_xxxyy + v101*v78 + v168 + &
      v176*v79 + v33*v4 + v74*v9
    v199         = L_xxxyzzzzz*v72
    v235         = v199 + 12.0d0*v197 + 4.0d0*(6.0d0*L_xxxyz + 6.0d0*v195 + v198)
    v236         = v235*y
    v314         = v196 + v235 + v140*v155 + 6.0d0*v200 + 4.0d0*v202
    Ls_xxxyz     = 0.0416666666666667d0*(v196 + 12.0d0*v197 + v199 + 6.0d0*v200 + 4.0d0*( &
      v198 + v202)) + L_xxxxxxxyz*v67 + L_xxxyz + v121*v78 + v155*v74 + &
      v195 + v203*v79 + v30*v33
    v259         = L_xxyyyzzzz*v72
    v279         = v259 + 12.0d0*v257 + 4.0d0*(6.0d0*L_xxyyy + 6.0d0*v255 + v258)
    v280         = v279*y
    v300         = v19*v279
    v330         = v279*v34
    v397         = v256 + v279 + v11*v140 + 6.0d0*v260 + 4.0d0*v262
    Ls_xxyyy     = 0.0416666666666667d0*(v256 + 12.0d0*v257 + v259 + 6.0d0*v260 + 4.0d0*( &
      v258 + v262)) + L_xxxxxxyyy*v67 + L_xxyyy + v11*v74 + v163*v78 + &
      v255 + v263*v79 + v33*v6
    v286         = L_xxyyzzzzz*v72
    v312         = v286 + 12.0d0*v284 + 4.0d0*(6.0d0*L_xxyyz + 6.0d0*v282 + v285)
    v313         = v312*y
    v350         = v19*v312
    v430         = v283 + v312 + v140*v242 + 6.0d0*v287 + 4.0d0*v289
    Ls_xxyyz     = 0.0416666666666667d0*(v283 + 12.0d0*v284 + v286 + 6.0d0*v287 + 4.0d0*( &
      v285 + v289)) + L_xxxxxxyyz*v67 + L_xxyyz + v183*v78 + v242*v74 + &
      v282 + v290*v79 + v33*v53
    v375         = L_xyyyyzzzz*v72
    v395         = v375 + 12.0d0*v373 + 4.0d0*(6.0d0*L_xyyyy + 6.0d0*v371 + v374)
    v396         = v395*y
    v416         = v19*v395
    v441         = v34*v395
    v474         = v395*v68
    Ls_xyyyy     = 0.0416666666666667d0*(v372 + 12.0d0*v373 + v375 + 6.0d0*v376 + 4.0d0*( &
      v374 + v378)) + L_xxxxxyyyy*v67 + L_xyyyy + v13*v74 + v250*v78 + &
      v33*v8 + v371 + v379*v79
    v402         = L_xyyyzzzzz*v72
    v428         = v402 + 12.0d0*v400 + 4.0d0*(6.0d0*L_xyyyz + 6.0d0*v398 + v401)
    v429         = v428*y
    v455         = v19*v428
    v497         = v34*v428
    Ls_xyyyz     = 0.0416666666666667d0*(v399 + 12.0d0*v400 + v402 + 6.0d0*v403 + 4.0d0*( &
      v401 + v405)) + L_xxxxxyyyz*v67 + L_xyyyz + v270*v78 + v33*v94 + &
      v358*v74 + v398 + v406*v79
    v515         = L_yyyyyzzzz*v72
    v531         = v515 + 12.0d0*v513 + 4.0d0*(6.0d0*L_yyyyy + 6.0d0*v512 + v514)
    Ls_yyyyy     = 0.0416666666666667d0*(12.0d0*v513 + 4.0d0*v514 + v515) + L_xxxxyyyyy*v67 &
      + L_yyyyy + L_yyyyyyyyy*v132 + v10*v33 + v15*v74 + v366*v78 + &
      v509*v516 + v512 + v517*v518 + v79*(v13*v80 + v361 + 3.0d0*v365 + &
      v377)
    v535         = L_yyyyzzzzz*v72
    v553         = v535 + 12.0d0*v533 + 4.0d0*(6.0d0*L_yyyyz + 6.0d0*v532 + v534)
    Ls_yyyyz     = 0.0416666666666667d0*(12.0d0*v533 + 4.0d0*v534 + v535) + L_xxxxyyyyz*v67 &
      + L_yyyyyyyyz*v132 + L_yyyyz + v156*v33 + v386*v78 + v504*v74 + &
      v516*v522 + v517*v536 + v532 + v79*(v358*v80 + v381 + 3.0d0*v385 &
      + v404)
    c5           = c2*c3
    v130         = c5
    v601         = 0.00833333333333333d0*v130
    v466         = L_xzzzzz*v130
    v579         = L_yzzzzz*v130
    v323         = L_xxzzzzz*v130
    v436         = L_xyzzzzz*v130
    v492         = L_xzzzzzz*v130
    v558         = L_yyzzzzz*v130
    v594         = L_yzzzzzz*v130
    v212         = L_xxxzzzzz*v130
    v296         = L_xxyzzzzz*v130
    v346         = L_xxzzzzzz*v130
    v412         = L_xyyzzzzz*v130
    v451         = L_xyzzzzzz*v130
    v541         = L_yyyzzzzz*v130
    v571         = L_yyzzzzzz*v130
    v131         = L_xxxxzzzzz*v130
    v226         = v126 + v131 + 60.0d0*v127 + 20.0d0*v128 + v225*v7 + 120.0d0*(L_xxxx + &
      v122) + 5.0d0*(v129 + v136) + 10.0d0*(v133 + v134)
    Ls_xxxx      = 0.00833333333333333d0*(v126 + 60.0d0*v127 + 20.0d0*v128 + v131 + 5.0d0*( &
      v129 + v136) + 10.0d0*(v133 + v134)) + L_xxxx + L_xxxxxxxxx*v124 &
      + v0*v67 + v122 + v132*v7 + v137*v43 + v138*v81 + v139*v141
    v189         = L_xxxyzzzzz*v130
    v220         = v189 + 60.0d0*v186 + 20.0d0*v187 + 5.0d0*(24.0d0*L_xxxy + 24.0d0*v184 + &
      v188)
    v221         = v220*y
    v303         = v185 + v220 + 5.0d0*v193 + v225*v9 + 10.0d0*(v190 + v191)
    Ls_xxxy      = 0.00833333333333333d0*(v185 + 60.0d0*v186 + 20.0d0*v187 + v189 + 5.0d0*( &
      v188 + v193) + 10.0d0*(v190 + v191)) + L_xxxxxxxxy*v124 + L_xxxy &
      + v114*v138 + v132*v9 + v137*v60 + v139*v194 + v184 + v2*v67
    v232         = L_xxxzzzzzz*v130
    v353         = v228 + v232 + v155*v225 + 60.0d0*v229 + 20.0d0*v230 + 120.0d0*(L_xxxz + &
      v227) + 5.0d0*(v231 + v236) + 10.0d0*(v233 + v234)
    Ls_xxxz      = 0.00833333333333333d0*(v228 + 60.0d0*v229 + 20.0d0*v230 + v232 + 5.0d0*( &
      v231 + v236) + 10.0d0*(v233 + v234)) + L_xxxxxxxxz*v124 + L_xxxz &
      + v132*v155 + v137*v88 + v138*v150 + v139*v237 + v227 + v24*v67
    v276         = L_xxyyzzzzz*v130
    v301         = v276 + 60.0d0*v273 + 20.0d0*v274 + 5.0d0*(24.0d0*L_xxyy + 24.0d0*v271 + &
      v275)
    v302         = v301*y
    v332         = v19*v301
    v419         = v272 + v301 + v11*v225 + 5.0d0*v280 + 10.0d0*(v277 + v278)
    Ls_xxyy      = 0.00833333333333333d0*(v272 + 60.0d0*v273 + 20.0d0*v274 + v276 + 5.0d0*( &
      v275 + v280) + 10.0d0*(v277 + v278)) + L_xxxxxxxyy*v124 + L_xxyy &
      + v101*v137 + v11*v132 + v138*v176 + v139*v281 + v271 + v4*v67
    v309         = L_xxyzzzzzz*v130
    v351         = v309 + 60.0d0*v306 + 20.0d0*v307 + 5.0d0*(24.0d0*L_xxyz + 24.0d0*v304 + &
      v308)
    v352         = v351*y
    v458         = v305 + v351 + v225*v242 + 5.0d0*v313 + 10.0d0*(v310 + v311)
    Ls_xxyz      = 0.00833333333333333d0*(v305 + 60.0d0*v306 + 20.0d0*v307 + v309 + 5.0d0*( &
      v308 + v313) + 10.0d0*(v310 + v311)) + L_xxxxxxxyz*v124 + L_xxyz &
      + v121*v137 + v132*v242 + v138*v203 + v139*v314 + v30*v67 + v304
    v392         = L_xyyyzzzzz*v130
    v417         = v392 + 60.0d0*v389 + 20.0d0*v390 + 5.0d0*(24.0d0*L_xyyy + 24.0d0*v387 + &
      v391)
    v418         = v417*y
    v442         = v19*v417
    v476         = v34*v417
    Ls_xyyy      = 0.00833333333333333d0*(v388 + 60.0d0*v389 + 20.0d0*v390 + v392 + 5.0d0*( &
      v391 + v396) + 10.0d0*(v393 + v394)) + L_xxxxxxyyy*v124 + L_xyyy &
      + v13*v132 + v137*v163 + v138*v263 + v139*v397 + v387 + v6*v67
    v425         = L_xyyzzzzzz*v130
    v456         = v425 + 60.0d0*v422 + 20.0d0*v423 + 5.0d0*(24.0d0*L_xyyz + 24.0d0*v420 + &
      v424)
    v457         = v456*y
    v498         = v19*v456
    Ls_xyyz      = 0.00833333333333333d0*(v421 + 60.0d0*v422 + 20.0d0*v423 + v425 + 5.0d0*( &
      v424 + v429) + 10.0d0*(v426 + v427)) + L_xxxxxxyyz*v124 + L_xyyz &
      + v132*v358 + v137*v183 + v138*v290 + v139*v430 + v420 + v53*v67
    v527         = L_yyyyzzzzz*v130
    v547         = v527 + 60.0d0*v524 + 20.0d0*v525 + 5.0d0*(24.0d0*L_yyyy + 24.0d0*v523 + &
      v526)
    Ls_yyyy      = 0.00833333333333333d0*(60.0d0*v524 + 20.0d0*v525 + 5.0d0*v526 + v527) + &
      L_xxxxxyyyy*v124 + L_yyyy + L_yyyyyyyyy*v215 + v132*v15 + v137* &
      v250 + v138*v379 + v139*(v13*v140 + v372 + 6.0d0*v376 + 4.0d0* &
      v378 + v395) + v509*v528 + v518*v529 + v523 + v530*v531 + v67*v8
    v552         = L_yyyzzzzzz*v130
    v573         = v552 + 60.0d0*v549 + 20.0d0*v550 + 5.0d0*(24.0d0*L_yyyz + 24.0d0*v548 + &
      v551)
    Ls_yyyz      = 0.00833333333333333d0*(60.0d0*v549 + 20.0d0*v550 + 5.0d0*v551 + v552) + &
      L_xxxxxyyyz*v124 + L_yyyyyyyyz*v215 + L_yyyz + v132*v504 + v137* &
      v270 + v138*v406 + v139*(v140*v358 + v399 + 6.0d0*v403 + 4.0d0* &
      v405 + v428) + v522*v528 + v529*v536 + v530*v553 + v548 + v67*v94
    c6           = c3*c3
    v213         = c6
    v602         = 0.00138888888888889d0*v213
    v467         = L_xzzzzzz*v213
    v580         = L_yzzzzzz*v213
    v324         = L_xxzzzzzz*v213
    v437         = L_xyzzzzzz*v213
    v493         = L_xzzzzzzz*v213
    v559         = L_yyzzzzzz*v213
    v595         = L_yzzzzzzz*v213
    v214         = L_xxxzzzzzz*v213
    v340         = v208 + v214 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 + 20.0d0*v217 + &
      v339*v9 + 720.0d0*(L_xxx + v204) + 6.0d0*(v212 + v221) + 15.0d0*( &
      v216 + v218)
    Ls_xxx       = 0.00138888888888889d0*(v208 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 &
      + v214 + 20.0d0*v217 + 6.0d0*(v212 + v221) + 15.0d0*(v216 + v218 &
      )) + L_xxx + L_xxxxxxxxx*v206 + v0*v124 + v141*v223 + v204 + v215 &
      *v9 + v219*v43 + v222*v81 + v224*v226
    v297         = L_xxyzzzzzz*v213
    v333         = v297 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 + 6.0d0*(120.0d0*L_xxy &
      + 120.0d0*v291 + v296)
    v334         = v333*y
    v445         = v292 + v333 + v11*v339 + 20.0d0*v299 + 6.0d0*v302 + 15.0d0*(v298 + v300)
    Ls_xxy       = 0.00138888888888889d0*(v292 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 &
      + v297 + 20.0d0*v299 + 6.0d0*(v296 + v302) + 15.0d0*(v298 + v300 &
      )) + L_xxxxxxxxy*v206 + L_xxy + v11*v215 + v114*v222 + v124*v2 + &
      v194*v223 + v219*v60 + v224*v303 + v291
    v347         = L_xxzzzzzzz*v213
    v501         = v342 + v347 + v242*v339 + 360.0d0*v343 + 120.0d0*v344 + 30.0d0*v345 + &
      20.0d0*v349 + 720.0d0*(L_xxz + v341) + 6.0d0*(v346 + v352) + &
      15.0d0*(v348 + v350)
    Ls_xxz       = 0.00138888888888889d0*(v342 + 360.0d0*v343 + 120.0d0*v344 + 30.0d0*v345 &
      + v347 + 20.0d0*v349 + 6.0d0*(v346 + v352) + 15.0d0*(v348 + v350 &
      )) + L_xxxxxxxxz*v206 + L_xxz + v124*v24 + v150*v222 + v215*v242 &
      + v219*v88 + v223*v237 + v224*v353 + v341
    v413         = L_xyyzzzzzz*v213
    v443         = v413 + 360.0d0*v409 + 120.0d0*v410 + 30.0d0*v411 + 6.0d0*(120.0d0*L_xyy &
      + 120.0d0*v407 + v412)
    v444         = v443*y
    v477         = v19*v443
    Ls_xyy       = 0.00138888888888889d0*(v408 + 360.0d0*v409 + 120.0d0*v410 + 30.0d0*v411 &
      + v413 + 20.0d0*v415 + 6.0d0*(v412 + v418) + 15.0d0*(v414 + v416 &
      )) + L_xxxxxxxyy*v206 + L_xyy + v101*v219 + v124*v4 + v13*v215 + &
      v176*v222 + v223*v281 + v224*v419 + v407
    v452         = L_xyzzzzzzz*v213
    v499         = v452 + 360.0d0*v448 + 120.0d0*v449 + 30.0d0*v450 + 6.0d0*(120.0d0*L_xyz &
      + 120.0d0*v446 + v451)
    v500         = v499*y
    Ls_xyz       = 0.00138888888888889d0*(v447 + 360.0d0*v448 + 120.0d0*v449 + 30.0d0*v450 &
      + v452 + 20.0d0*v454 + 6.0d0*(v451 + v457) + 15.0d0*(v453 + v455 &
      )) + L_xxxxxxxyz*v206 + L_xyz + v121*v219 + v124*v30 + v203*v222 &
      + v215*v358 + v223*v314 + v224*v458 + v446
    v542         = L_yyyzzzzzz*v213
    v566         = v542 + 360.0d0*v538 + 120.0d0*v539 + 30.0d0*v540 + 6.0d0*(120.0d0*L_yyy &
      + 120.0d0*v537 + v541)
    Ls_yyy       = 0.00138888888888889d0*(360.0d0*v538 + 120.0d0*v539 + 30.0d0*v540 + 6.0d0 &
      *v541 + v542) + L_xxxxxxyyy*v206 + L_yyy + L_yyyyyyyyy*v327 + &
      v124*v6 + v15*v215 + v163*v219 + v222*v263 + v223*v397 + v224*( &
      v13*v225 + v388 + 10.0d0*v393 + 10.0d0*v394 + 5.0d0*v396 + v417) &
      + v509*v543 + v518*v544 + v531*v545 + v537 + v546*v547
    v572         = L_yyzzzzzzz*v213
    v597         = v572 + 360.0d0*v568 + 120.0d0*v569 + 30.0d0*v570 + 6.0d0*(120.0d0*L_yyz &
      + 120.0d0*v567 + v571)
    Ls_yyz       = 0.00138888888888889d0*(360.0d0*v568 + 120.0d0*v569 + 30.0d0*v570 + 6.0d0 &
      *v571 + v572) + L_xxxxxxyyz*v206 + L_yyyyyyyyz*v327 + L_yyz + &
      v124*v53 + v183*v219 + v215*v504 + v222*v290 + v223*v430 + v224*( &
      v225*v358 + v421 + 10.0d0*v426 + 10.0d0*v427 + 5.0d0*v429 + v456 &
      ) + v522*v543 + v536*v544 + v545*v553 + v546*v573 + v567
    c7           = c3*c4
    v325         = c7
    v603         = 0.000198412698412698d0*v325
    v468         = L_xzzzzzzz*v325
    v581         = L_yzzzzzzz*v325
    v326         = L_xxzzzzzzz*v325
    v486         = v319 + v326 + v11*v485 + 2520.0d0*v320 + 840.0d0*v321 + 210.0d0*v322 + &
      42.0d0*v323 + 5040.0d0*(L_xx + v315) + 7.0d0*(v324 + v334) + &
      21.0d0*(v328 + v332) + 35.0d0*(v329 + v330)
    Ls_xx        = 0.000198412698412698d0*(v319 + 2520.0d0*v320 + 840.0d0*v321 + 210.0d0* &
      v322 + 42.0d0*v323 + v326 + 7.0d0*(v324 + v334) + 21.0d0*(v328 + &
      v332) + 35.0d0*(v329 + v330)) + L_xx + L_xxxxxxxxx*v317 + v0*v206 &
      + v11*v327 + v141*v336 + v226*v337 + v315 + v331*v43 + v335*v81 + &
      v338*v340
    v438         = L_xyzzzzzzz*v325
    v478         = v438 + 2520.0d0*v433 + 840.0d0*v434 + 210.0d0*v435 + 42.0d0*v436 + 7.0d0 &
      *(720.0d0*L_xy + 720.0d0*v431 + v437)
    v479         = v478*y
    Ls_xy        = 0.000198412698412698d0*(v432 + 2520.0d0*v433 + 840.0d0*v434 + 210.0d0* &
      v435 + 42.0d0*v436 + v438 + 7.0d0*(v437 + v444) + 21.0d0*(v439 + &
      v442) + 35.0d0*(v440 + v441)) + L_xxxxxxxxy*v317 + L_xy + v114* &
      v335 + v13*v327 + v194*v336 + v2*v206 + v303*v337 + v331*v60 + &
      v338*v445 + v431
    v494         = L_xzzzzzzzz*v325
    Ls_xz        = 0.000198412698412698d0*(v488 + 2520.0d0*v489 + 840.0d0*v490 + 210.0d0* &
      v491 + 42.0d0*v492 + v494 + 7.0d0*(v493 + v500) + 21.0d0*(v495 + &
      v498) + 35.0d0*(v496 + v497)) + L_xxxxxxxxz*v317 + L_xz + v150* &
      v335 + v206*v24 + v237*v336 + v327*v358 + v331*v88 + v337*v353 + &
      v338*v501 + v487
    v560         = L_yyzzzzzzz*v325
    v589         = v560 + 2520.0d0*v555 + 840.0d0*v556 + 210.0d0*v557 + 42.0d0*v558 + 7.0d0 &
      *(720.0d0*L_yy + 720.0d0*v554 + v559)
    Ls_yy        = 0.000198412698412698d0*(2520.0d0*v555 + 840.0d0*v556 + 210.0d0*v557 + &
      42.0d0*v558 + 7.0d0*v559 + v560) + L_xxxxxxxyy*v317 + L_yy + &
      L_yyyyyyyyy*v471 + v101*v331 + v15*v327 + v176*v335 + v206*v4 + &
      v281*v336 + v337*v419 + v338*(v13*v339 + v408 + 15.0d0*v414 + &
      20.0d0*v415 + 15.0d0*v416 + 6.0d0*v418 + v443) + v509*v561 + v518 &
      *v562 + v531*v563 + v547*v564 + v554 + v565*v566
    v596         = L_yzzzzzzzz*v325
    Ls_yz        = 0.000198412698412698d0*(2520.0d0*v591 + 840.0d0*v592 + 210.0d0*v593 + &
      42.0d0*v594 + 7.0d0*v595 + v596) + L_xxxxxxxyz*v317 + L_yyyyyyyyz &
      *v471 + L_yz + v121*v331 + v203*v335 + v206*v30 + v314*v336 + &
      v327*v504 + v337*v458 + v338*(v339*v358 + v447 + 15.0d0*v453 + &
      20.0d0*v454 + 15.0d0*v455 + 6.0d0*v457 + v499) + v522*v561 + v536 &
      *v562 + v553*v563 + v564*v573 + v565*v597 + v590
    c8           = c4*c4
    v469         = c8
    v604         = 2.48015873015873d-5*v469
    v470         = L_xzzzzzzzz*v469
    Ls_x         = 2.48015873015873d-5*(v462 + 20160.0d0*v463 + 6720.0d0*v464 + 1680.0d0* &
      v465 + 336.0d0*v466 + v470 + 70.0d0*v474 + 8.0d0*(v468 + v479) + &
      28.0d0*(v472 + v477) + 56.0d0*(v467 + v473 + v476)) + L_x + &
      L_xxxxxxxxx*v460 + v0*v317 + v13*v471 + v141*v481 + v226*v482 + &
      v340*v483 + v43*v475 + v459 + v480*v81 + v484*v486
    v582         = L_yzzzzzzzz*v469
    Ls_y         = 2.48015873015873d-5*(20160.0d0*v576 + 6720.0d0*v577 + 1680.0d0*v578 + &
      336.0d0*v579 + 56.0d0*v580 + 8.0d0*v581 + v582) + L_xxxxxxxxy* &
      v460 + L_y + L_yyyyyyyyy*v575 + v114*v480 + v15*v471 + v194*v481 &
      + v2*v317 + v303*v482 + v445*v483 + v475*v60 + v484*(v13*v485 + &
      v432 + 21.0d0*v439 + 35.0d0*v440 + 35.0d0*v441 + 21.0d0*v442 + &
      7.0d0*v444 + v478) + v509*v583 + v518*v584 + v531*v585 + v547* &
      v586 + v566*v587 + v574 + v588*v589
    Ls_z         = L_z + L_xxxxxxxxz*v460 + L_yyyyyyyyz*v575 + L_zz*z + L_zzz*v598 + L_zzzz &
      *v599 + L_zzzzz*v600 + L_zzzzzz*v601 + L_zzzzzzz*v602 + &
      L_zzzzzzzz*v603 + L_zzzzzzzzz*v604 + v150*v480 + v237*v481 + v24* &
      v317 + v353*v482 + v471*v504 + v475*v88 + v483*v501 + v484*( &
      5040.0d0*L_xz + v358*v485 + 5040.0d0*v487 + v488 + 2520.0d0*v489 &
      + 840.0d0*v490 + 210.0d0*v491 + 42.0d0*v492 + 7.0d0*v493 + v494 + &
      21.0d0*v495 + 35.0d0*v496 + 35.0d0*v497 + 21.0d0*v498 + 7.0d0* &
      v500) + v522*v583 + v536*v584 + v553*v585 + v573*v586 + v587*v597 &
      + v588*(5040.0d0*L_yz + 5040.0d0*v590 + 2520.0d0*v591 + 840.0d0* &
      v592 + 210.0d0*v593 + 42.0d0*v594 + 7.0d0*v595 + v596)
    c9           = c4*c5
    Ls_0         = 2.75573192239859d-6*(L_xxxxxxxxx*a9 + L_yyyyyyyyy*b9 + L_zzzzzzzzz*c9 + &
      9.0d0*(x*(40320.0d0*L_x + 8.0d0*v13*v318 + 40320.0d0*v459 + v462 &
      + 20160.0d0*v463 + 6720.0d0*v464 + 1680.0d0*v465 + 336.0d0*v466 + &
      56.0d0*v467 + 8.0d0*v468 + v470 + 28.0d0*v472 + 56.0d0*v473 + &
      70.0d0*v474 + 56.0d0*v476 + 28.0d0*v477 + 8.0d0*v479) + y*( &
      40320.0d0*L_y + 40320.0d0*v574 + 20160.0d0*v576 + 6720.0d0*v577 + &
      1680.0d0*v578 + 336.0d0*v579 + 56.0d0*v580 + 8.0d0*v581 + v582)) &
      + 126.0d0*(v123*v141 + v125*v531 + v226*v66 + v547*v68) + 36.0d0* &
      (v17*v486 + v19*v589 + v316*v43 + v318*v509) + 84.0d0*(v205*v81 + &
      v207*v518 + v32*v340 + v34*v566)) + L_0 + L_z*z + L_zz*v598 + &
      L_zzz*v599 + L_zzzz*v600 + L_zzzzz*v601 + L_zzzzzz*v602 + &
      L_zzzzzzz*v603 + L_zzzzzzzz*v604 + v0*v460 + v15*v575
#undef  y                   
#undef  Ls_0                
#undef  L_0                 
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
#undef  L_xy                
#undef  Ls_xy               
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
#undef  L_xxxz              
#undef  Ls_xxxz             
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
#undef  L_xxxxy             
#undef  Ls_xxxxy            
#undef  L_xxxxz             
#undef  Ls_xxxxz            
#undef  Ls_xxxyy            
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  Ls_xxxyz            
#undef  Ls_xxyyy            
#undef  L_xxyyy             
#undef  Ls_xxyyz            
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  Ls_xyyyy            
#undef  Ls_xyyyz            
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  Ls_yyyyy            
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
#undef  L_xxxxyz            
#undef  Ls_xxxxyz           
#undef  L_xxxyyy            
#undef  Ls_xxxyyy           
#undef  Ls_xxxyyz           
#undef  L_xxxyyz            
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  Ls_xyyyyy           
#undef  Ls_xyyyyz           
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  Ls_yyyyyy           
#undef  Ls_yyyyyz           
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  Ls_xxxxxxx          
#undef  Ls_xxxxxxy          
#undef  L_xxxxxxy           
#undef  Ls_xxxxxxz          
#undef  L_xxxxxxz           
#undef  Ls_xxxxxyy          
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  Ls_xxxxxyz          
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
#undef  Ls_xxxxyyz          
#undef  L_xxxxyyz           
#undef  Ls_xxxyyyy          
#undef  L_xxxyyyy           
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
#undef  L_yyyyyyz           
#undef  Ls_yyyyyyz          
#undef  L_xxxxxxxx          
#undef  Ls_xxxxxxxx         
#undef  L_xxxxxxxy          
#undef  Ls_xxxxxxxy         
#undef  L_xxxxxxxz          
#undef  Ls_xxxxxxxz         
#undef  L_xxxxxxyy          
#undef  Ls_xxxxxxyy         
#undef  Ls_xxxxxxyz         
#undef  L_xxxxxxyz          
#undef  Ls_xxxxxyyy         
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  Ls_xxxxxyyz         
#undef  L_xxxxyyyy          
#undef  Ls_xxxxyyyy         
#undef  L_xxxxyyyz          
#undef  Ls_xxxxyyyz         
#undef  L_xxxyyyyy          
#undef  Ls_xxxyyyyy         
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
#undef  L_xxxxxxxxx         
#undef  Ls_xxxxxxxxx        
#undef  L_xxxxxxxxy         
#undef  Ls_xxxxxxxxy        
#undef  Ls_xxxxxxxxz        
#undef  L_xxxxxxxxz         
#undef  L_xxxxxxxyy         
#undef  Ls_xxxxxxxyy        
#undef  Ls_xxxxxxxyz        
#undef  L_xxxxxxxyz         
#undef  L_xxxxxxyyy         
#undef  Ls_xxxxxxyyy        
#undef  Ls_xxxxxxyyz        
#undef  L_xxxxxxyyz         
#undef  Ls_xxxxxyyyy        
#undef  L_xxxxxyyyy         
#undef  L_xxxxxyyyz         
#undef  Ls_xxxxxyyyz        
#undef  Ls_xxxxyyyyy        
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  Ls_xxxxyyyyz        
#undef  L_xxxyyyyyy         
#undef  Ls_xxxyyyyyy        
#undef  L_xxxyyyyyz         
#undef  Ls_xxxyyyyyz        
#undef  Ls_xxyyyyyyy        
#undef  L_xxyyyyyyy         
#undef  Ls_xxyyyyyyz        
#undef  L_xxyyyyyyz         
#undef  Ls_xyyyyyyyy        
#undef  L_xyyyyyyyy         
#undef  Ls_xyyyyyyyz        
#undef  L_xyyyyyyyz         
#undef  Ls_yyyyyyyyy        
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
#undef  Ls_yyyyyyyyz        
    end subroutine mom_es_L2L
    
! OPS  608*ADD + 2*DIV + 819*MUL + 121*NEG + POW = 1551  (5081 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v243, v244, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
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
                L_yyzzzzz, L_yzzzzzz, L_zzzzzzz, L_xxxxxxzz, L_xxxxxyzz,&
                L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz, L_xxxxzzzz, L_xxxyyyzz,&
                L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz, L_xxyyyyzz, L_xxyyyzzz,&
                L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz, L_xyyyyyzz, L_xyyyyzzz,&
                L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz, L_xzzzzzzz, L_yyyyyyzz,&
                L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz,&
                L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz, L_xxxxxxzzz,&
                L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz, L_xxxxyyyzz,&
                L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz, L_xxxyyyyzz,&
                L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz, L_xxxzzzzzz,&
                L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz, L_xxyyzzzzz,&
                L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz, L_xyyyyyzzz,&
                L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz, L_xyzzzzzzz,&
                L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz, L_yyyyyzzzz,&
                L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz, L_yzzzzzzzz,&
                L_zzzzzzzzz
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
#define L_xxxxxxxx           L(64)
#define L_xxxxxxxy           L(65)
#define L_xxxxxxxz           L(66)
#define L_xxxxxxyy           L(67)
#define L_xxxxxxyz           L(68)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define L_xxxxyyyy           L(71)
#define L_xxxxyyyz           L(72)
#define L_xxxyyyyy           L(73)
#define L_xxxyyyyz           L(74)
#define L_xxyyyyyy           L(75)
#define L_xxyyyyyz           L(76)
#define L_xyyyyyyy           L(77)
#define L_xyyyyyyz           L(78)
#define L_yyyyyyyy           L(79)
#define L_yyyyyyyz           L(80)
#define L_xxxxxxxxx          L(81)
#define L_xxxxxxxxy          L(82)
#define L_xxxxxxxxz          L(83)
#define L_xxxxxxxyy          L(84)
#define L_xxxxxxxyz          L(85)
#define L_xxxxxxyyy          L(86)
#define L_xxxxxxyyz          L(87)
#define L_xxxxxyyyy          L(88)
#define L_xxxxxyyyz          L(89)
#define L_xxxxyyyyy          L(90)
#define L_xxxxyyyyz          L(91)
#define L_xxxyyyyyy          L(92)
#define L_xxxyyyyyz          L(93)
#define L_xxyyyyyyy          L(94)
#define L_xxyyyyyyz          L(95)
#define L_xyyyyyyyy          L(96)
#define L_xyyyyyyyz          L(97)
#define L_yyyyyyyyy          L(98)
#define L_yyyyyyyyz          L(99)
    v0          = L_xxz*z
    v18         = L_xxyyyyyy + L_xxyyyyyyz*z
    v22         = L_xxxxxxxx + L_xxxxxxxxy*y + L_xxxxxxxxz*z
    v24         = 2.0d0*z
    v28         = 6.0d0*z
    v33         = 24.0d0*z
    v41         = 2.0d0*y
    v42         = L_xxxxxxxy + L_xxxxxxxyz*z
    v44         = 120.0d0*z
    v50         = 720.0d0*z
    v60         = L_xxxxxxyy + L_xxxxxxyyz*z
    v61         = 3.0d0*y
    v67         = L_xxxxxyyy + L_xxxxxyyyz*z
    v70         = 4.0d0*y
    v76         = L_xxxxyyyy + L_xxxxyyyyz*z
    v81         = 5.0d0*y
    v84         = 0.00138888888888889d0*x
    v86         = L_xxxyyyyy + L_xxxyyyyyz*z
    v93         = 6.0d0*y
    v96         = L_xyz*z
    v104        = L_xyyyyyyy + L_xyyyyyyyz*z
    v106        = L_xxxxxxxyy*y + v42
    v122        = L_xz*z
    v147        = 0.000198412698412698d0*x
    v190        = L_yyz*z
    v198        = L_yyyyyyyy + L_yyyyyyyyz*z
    v207        = 0.00138888888888889d0*y
    v209        = L_yz*z
    v223        = 0.000198412698412698d0*y
    L_zz        = -(L_xx + L_yy)
    L_xzz       = -(L_xxx + L_xyy)
    v149        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v225        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    L_xyzz      = -(L_xxxy + L_xyyy)
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    L_yyzzz     = -(L_xxyyz + L_yyyyz)
    L_yzzzz     = -(L_xxyzz + L_yyyzz)
    L_zzzzz     = -(L_xxzzz + L_yyzzz)
    L_xxxxzz    = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz    = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz    = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz    = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz    = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz    = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz    = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz    = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz    = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz    = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz    = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz   = -(L_xxxxxxx + L_xxxxxyy)
    L_xxxxyzz   = -(L_xxxxxxy + L_xxxxyyy)
    L_xxxxzzz   = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz   = -(L_xxxxxyy + L_xxxyyyy)
    L_xxxyzzz   = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz   = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz   = -(L_xxxxyyy + L_xxyyyyy)
    L_xxyyzzz   = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz   = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz   = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz   = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz   = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz   = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz   = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz   = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz   = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz  = -(L_xxxxxxxx + L_xxxxxxyy)
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    L_xxxxxxxzz = -(L_xxxxxxxxx + L_xxxxxxxyy)
    v159        = L_xxxxxxxz + L_xxxxxxxyz*y + L_xxxxxxxzz*z
    L_xxxxxxyzz = -(L_xxxxxxxxy + L_xxxxxxyyy)
    v166        = L_xxxxxxyz + L_xxxxxxyzz*z
    L_xxxxxxzzz = -(L_xxxxxxxxz + L_xxxxxxyyz)
    L_xxxxxyyzz = -(L_xxxxxxxyy + L_xxxxxyyyy)
    v172        = L_xxxxxyyz + L_xxxxxyyzz*z
    L_xxxxxyzzz = -(L_xxxxxxxyz + L_xxxxxyyyz)
    L_xxxxxzzzz = -(L_xxxxxxxzz + L_xxxxxyyzz)
    L_xxxxyyyzz = -(L_xxxxxxyyy + L_xxxxyyyyy)
    v175        = L_xxxxyyyz + L_xxxxyyyzz*z
    L_xxxxyyzzz = -(L_xxxxxxyyz + L_xxxxyyyyz)
    L_xxxxyzzzz = -(L_xxxxxxyzz + L_xxxxyyyzz)
    L_xxxxzzzzz = -(L_xxxxxxzzz + L_xxxxyyzzz)
    L_xxxyyyyzz = -(L_xxxxxyyyy + L_xxxyyyyyy)
    v179        = L_xxxyyyyz + L_xxxyyyyzz*z
    L_xxxyyyzzz = -(L_xxxxxyyyz + L_xxxyyyyyz)
    L_xxxyyzzzz = -(L_xxxxxyyzz + L_xxxyyyyzz)
    L_xxxyzzzzz = -(L_xxxxxyzzz + L_xxxyyyzzz)
    L_xxxzzzzzz = -(L_xxxxxzzzz + L_xxxyyzzzz)
    L_xxyyyyyzz = -(L_xxxxyyyyy + L_xxyyyyyyy)
    v184        = L_xxyyyyyz + L_xxyyyyyzz*z
    L_xxyyyyzzz = -(L_xxxxyyyyz + L_xxyyyyyyz)
    L_xxyyyzzzz = -(L_xxxxyyyzz + L_xxyyyyyzz)
    L_xxyyzzzzz = -(L_xxxxyyzzz + L_xxyyyyzzz)
    L_xxyzzzzzz = -(L_xxxxyzzzz + L_xxyyyzzzz)
    L_xxzzzzzzz = -(L_xxxxzzzzz + L_xxyyzzzzz)
    L_xyyyyyyzz = -(L_xxxyyyyyy + L_xyyyyyyyy)
    v157        = L_xyyyyyyz + L_xyyyyyyzz*z
    L_xyyyyyzzz = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v232        = L_yyyyyyyz + L_yyyyyyyzz*z
    L_yyyyyyzzz = -(L_xxyyyyyyz + L_yyyyyyyyz)
    L_yyyyyzzzz = -(L_xxyyyyyzz + L_yyyyyyyzz)
    L_yyyyzzzzz = -(L_xxyyyyzzz + L_yyyyyyzzz)
    L_yyyzzzzzz = -(L_xxyyyzzzz + L_yyyyyzzzz)
    L_yyzzzzzzz = -(L_xxyyzzzzz + L_yyyyzzzzz)
    L_yzzzzzzzz = -(L_xxyzzzzzz + L_yyyzzzzzz)
    L_zzzzzzzzz = -(L_xxzzzzzzz + L_yyzzzzzzz)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v73         = a2
    v74         = 0.00416666666666667d0*v73
    v146        = 0.000694444444444444d0*v73
    a3          = a1*a2
    v64         = a3
    v65         = 0.00694444444444444d0*v64
    v145        = 0.00138888888888889d0*v64
    a4          = a2*a2
    v57         = a4
    v58         = 0.00694444444444444d0*v57
    v144        = 0.00173611111111111d0*v57
    a5          = a2*a3
    v38         = a5
    v39         = 0.00416666666666667d0*v38
    v143        = 0.00138888888888889d0*v38
    a6          = a3*a3
    v20         = a6
    v21         = 0.00138888888888889d0*v20
    v138        = 0.000694444444444444d0*v20
    a7          = a3*a4
    v1          = a7
    v2          = 0.000198412698412698d0*v1
    a8          = a4*a4
    v123        = 2.48015873015873d-5*a8
    a9          = a4*a5
    b2          = b1*b1
    v40         = b2
    v59         = 3.0d0*v40
    v68         = 6.0d0*v40
    v79         = 10.0d0*v40
    v91         = 15.0d0*v40
    v205        = 0.00416666666666667d0*v40
    v222        = 0.000694444444444444d0*v40
    b3          = b1*b2
    v32         = b3
    v66         = 4.0d0*v32
    v77         = 10.0d0*v32
    v89         = 20.0d0*v32
    v203        = 0.00694444444444444d0*v32
    v221        = 0.00138888888888889d0*v32
    b4          = b2*b2
    v27         = b4
    v75         = 5.0d0*v27
    v87         = 15.0d0*v27
    v201        = 0.00694444444444444d0*v27
    v220        = 0.00173611111111111d0*v27
    b5          = b2*b3
    v23         = b5
    v85         = 6.0d0*v23
    v199        = 0.00416666666666667d0*v23
    v219        = 0.00138888888888889d0*v23
    b6          = b3*b3
    v17         = b6
    v19         = v17*v18
    v105        = v104*v17
    v197        = 0.00138888888888889d0*v17
    v218        = 0.000694444444444444d0*v17
    v158        = v157*v17
    b7          = b3*b4
    v3          = b7
    v4          = L_xxyyyyyyy*v3
    v97         = L_xyyyyyyyy*v3
    v134        = 0.000198412698412698d0*v3
    v150        = L_xyyyyyyyz*v3
    b8          = b4*b4
    v124        = b8
    v125        = L_xyyyyyyyy*v124
    v210        = 2.48015873015873d-5*v124
    b9          = b4*b5
    c2          = c1*c1
    v5          = c2
    v29         = 3.0d0*v5
    v34         = 12.0d0*v5
    v45         = 60.0d0*v5
    v51         = 360.0d0*v5
    v238        = 0.5d0*v5
    v126        = L_xzz*v5
    v211        = L_yzz*v5
    v6          = L_xxzz*v5
    v98         = L_xyzz*v5
    v151        = L_xzzz*v5
    v191        = L_yyzz*v5
    v226        = L_yzzz*v5
    v43         = 2.0d0*L_xxxxxxx + L_xxxxxxxyy*v40 + L_xxxxxxxz*v24 + L_xxxxxxxzz*v5 + &
      v41*v42
    v62         = 2.0d0*L_xxxxxxy + L_xxxxxxyz*v24 + L_xxxxxxyzz*v5
    v113        = v62 + L_xxxxxxyyy*v40 + v41*v60
    v167        = L_xxxxxxyyz*v40 + 2.0d0*L_xxxxxxz + L_xxxxxxzz*v24 + L_xxxxxxzzz*v5 + &
      v166*v41
    v69         = 2.0d0*L_xxxxxyy + L_xxxxxyyz*v24 + L_xxxxxyyzz*v5
    v173        = 2.0d0*L_xxxxxyz + L_xxxxxyzz*v24 + L_xxxxxyzzz*v5
    v78         = 2.0d0*L_xxxxyyy + L_xxxxyyyz*v24 + L_xxxxyyyzz*v5
    v176        = 2.0d0*L_xxxxyyz + L_xxxxyyzz*v24 + L_xxxxyyzzz*v5
    v88         = 2.0d0*L_xxxyyyy + L_xxxyyyyz*v24 + L_xxxyyyyzz*v5
    v180        = 2.0d0*L_xxxyyyz + L_xxxyyyzz*v24 + L_xxxyyyzzz*v5
    v25         = 2.0d0*L_xxyyyyy + L_xxyyyyyz*v24 + L_xxyyyyyzz*v5
    v26         = v23*v25
    v185        = 2.0d0*L_xxyyyyz + L_xxyyyyzz*v24 + L_xxyyyyzzz*v5
    v107        = 2.0d0*L_xyyyyyy + L_xyyyyyyz*v24 + L_xyyyyyyzz*v5
    v108        = v107*v23
    v135        = v107*v17
    v160        = 2.0d0*L_xyyyyyz + L_xyyyyyzz*v24 + L_xyyyyyzzz*v5
    v161        = v160*v23
    v200        = 2.0d0*L_yyyyyyy + L_yyyyyyyz*v24 + L_yyyyyyyzz*v5
    v233        = 2.0d0*L_yyyyyyz + L_yyyyyyzz*v24 + L_yyyyyyzzz*v5
    h           = v40 + v5 + v73
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
    u18         = u9*u9
    u19         = u10*u9
    c3          = c1*c2
    v7          = c3
    v35         = 4.0d0*v7
    v46         = 20.0d0*v7
    v52         = 120.0d0*v7
    v239        = 0.166666666666667d0*v7
    v127        = L_xzzz*v7
    v212        = L_yzzz*v7
    v8          = L_xxzzz*v7
    v99         = L_xyzzz*v7
    v152        = L_xzzzz*v7
    v192        = L_yyzzz*v7
    v227        = L_yzzzz*v7
    v63         = 6.0d0*L_xxxxxx + L_xxxxxxyyy*v32 + L_xxxxxxz*v28 + L_xxxxxxzz*v29 + &
      L_xxxxxxzzz*v7 + v59*v60 + v61*v62
    v71         = 6.0d0*L_xxxxxy + L_xxxxxyz*v28 + L_xxxxxyzz*v29 + L_xxxxxyzzz*v7
    v118        = v71 + L_xxxxxyyyy*v32 + v59*v67 + v61*v69
    v174        = L_xxxxxyyyz*v32 + 6.0d0*L_xxxxxz + L_xxxxxzz*v28 + L_xxxxxzzz*v29 + &
      L_xxxxxzzzz*v7 + v172*v59 + v173*v61
    v80         = 6.0d0*L_xxxxyy + L_xxxxyyz*v28 + L_xxxxyyzz*v29 + L_xxxxyyzzz*v7
    v177        = 6.0d0*L_xxxxyz + L_xxxxyzz*v28 + L_xxxxyzzz*v29 + L_xxxxyzzzz*v7
    v90         = 6.0d0*L_xxxyyy + L_xxxyyyz*v28 + L_xxxyyyzz*v29 + L_xxxyyyzzz*v7
    v181        = 6.0d0*L_xxxyyz + L_xxxyyzz*v28 + L_xxxyyzzz*v29 + L_xxxyyzzzz*v7
    v30         = 6.0d0*L_xxyyyy + L_xxyyyyz*v28 + L_xxyyyyzz*v29 + L_xxyyyyzzz*v7
    v31         = v27*v30
    v186        = 6.0d0*L_xxyyyz + L_xxyyyzz*v28 + L_xxyyyzzz*v29 + L_xxyyyzzzz*v7
    v109        = 6.0d0*L_xyyyyy + L_xyyyyyz*v28 + L_xyyyyyzz*v29 + L_xyyyyyzzz*v7
    v110        = v109*v27
    v136        = v109*v23
    v162        = 6.0d0*L_xyyyyz + L_xyyyyzz*v28 + L_xyyyyzzz*v29 + L_xyyyyzzzz*v7
    v163        = v162*v27
    v202        = 6.0d0*L_yyyyyy + L_yyyyyyz*v28 + L_yyyyyyzz*v29 + L_yyyyyyzzz*v7
    v234        = 6.0d0*L_yyyyyz + L_yyyyyzz*v28 + L_yyyyyzzz*v29 + L_yyyyyzzzz*v7
    c4          = c2*c2
    v9          = c4
    v47         = 5.0d0*v9
    v53         = 30.0d0*v9
    v240        = 0.0416666666666667d0*v9
    v128        = L_xzzzz*v9
    v213        = L_yzzzz*v9
    v10         = L_xxzzzz*v9
    v100        = L_xyzzzz*v9
    v153        = L_xzzzzz*v9
    v193        = L_yyzzzz*v9
    v228        = L_yzzzzz*v9
    v72         = 24.0d0*L_xxxxx + L_xxxxxyyyy*v27 + L_xxxxxz*v33 + L_xxxxxzz*v34 + &
      L_xxxxxzzz*v35 + L_xxxxxzzzz*v9 + v66*v67 + v68*v69 + v70*v71
    v82         = 24.0d0*L_xxxxy + L_xxxxyz*v33 + L_xxxxyzz*v34 + L_xxxxyzzz*v35 + &
      L_xxxxyzzzz*v9
    v119        = v82 + L_xxxxyyyyy*v27 + v66*v76 + v68*v78 + v70*v80
    v178        = L_xxxxyyyyz*v27 + 24.0d0*L_xxxxz + L_xxxxzz*v33 + L_xxxxzzz*v34 + &
      L_xxxxzzzz*v35 + L_xxxxzzzzz*v9 + v175*v66 + v176*v68 + v177*v70
    v92         = 24.0d0*L_xxxyy + L_xxxyyz*v33 + L_xxxyyzz*v34 + L_xxxyyzzz*v35 + &
      L_xxxyyzzzz*v9
    v182        = 24.0d0*L_xxxyz + L_xxxyzz*v33 + L_xxxyzzz*v34 + L_xxxyzzzz*v35 + &
      L_xxxyzzzzz*v9
    v36         = 24.0d0*L_xxyyy + L_xxyyyz*v33 + L_xxyyyzz*v34 + L_xxyyyzzz*v35 + &
      L_xxyyyzzzz*v9
    v37         = v32*v36
    v187        = 24.0d0*L_xxyyz + L_xxyyzz*v33 + L_xxyyzzz*v34 + L_xxyyzzzz*v35 + &
      L_xxyyzzzzz*v9
    v111        = 24.0d0*L_xyyyy + L_xyyyyz*v33 + L_xyyyyzz*v34 + L_xyyyyzzz*v35 + &
      L_xyyyyzzzz*v9
    v112        = v111*v32
    v137        = v111*v27
    v164        = 24.0d0*L_xyyyz + L_xyyyzz*v33 + L_xyyyzzz*v34 + L_xyyyzzzz*v35 + &
      L_xyyyzzzzz*v9
    v165        = v164*v32
    v204        = 24.0d0*L_yyyyy + L_yyyyyz*v33 + L_yyyyyzz*v34 + L_yyyyyzzz*v35 + &
      L_yyyyyzzzz*v9
    v235        = 24.0d0*L_yyyyz + L_yyyyzz*v33 + L_yyyyzzz*v34 + L_yyyyzzzz*v35 + &
      L_yyyyzzzzz*v9
    c5          = c2*c3
    v11         = c5
    v54         = 6.0d0*v11
    v241        = 0.00833333333333333d0*v11
    v129        = L_xzzzzz*v11
    v214        = L_yzzzzz*v11
    v12         = L_xxzzzzz*v11
    v101        = L_xyzzzzz*v11
    v154        = L_xzzzzzz*v11
    v194        = L_yyzzzzz*v11
    v229        = L_yzzzzzz*v11
    v83         = 120.0d0*L_xxxx + L_xxxxyyyyy*v23 + L_xxxxz*v44 + L_xxxxzz*v45 + &
      L_xxxxzzz*v46 + L_xxxxzzzz*v47 + L_xxxxzzzzz*v11 + v75*v76 + v77* &
      v78 + v79*v80 + v81*v82
    v94         = 120.0d0*L_xxxy + L_xxxyz*v44 + L_xxxyzz*v45 + L_xxxyzzz*v46 + L_xxxyzzzz &
      *v47 + L_xxxyzzzzz*v11
    v120        = v94 + L_xxxyyyyyy*v23 + v75*v86 + v77*v88 + v79*v90 + v81*v92
    v183        = L_xxxyyyyyz*v23 + 120.0d0*L_xxxz + L_xxxzz*v44 + L_xxxzzz*v45 + &
      L_xxxzzzz*v46 + L_xxxzzzzz*v47 + L_xxxzzzzzz*v11 + v179*v75 + &
      v180*v77 + v181*v79 + v182*v81
    v48         = 120.0d0*L_xxyy + L_xxyyz*v44 + L_xxyyzz*v45 + L_xxyyzzz*v46 + L_xxyyzzzz &
      *v47 + L_xxyyzzzzz*v11
    v49         = v40*v48
    v188        = 120.0d0*L_xxyz + L_xxyzz*v44 + L_xxyzzz*v45 + L_xxyzzzz*v46 + L_xxyzzzzz &
      *v47 + L_xxyzzzzzz*v11
    v114        = 120.0d0*L_xyyy + L_xyyyz*v44 + L_xyyyzz*v45 + L_xyyyzzz*v46 + L_xyyyzzzz &
      *v47 + L_xyyyzzzzz*v11
    v115        = v114*v40
    v139        = v114*v32
    v168        = 120.0d0*L_xyyz + L_xyyzz*v44 + L_xyyzzz*v45 + L_xyyzzzz*v46 + L_xyyzzzzz &
      *v47 + L_xyyzzzzzz*v11
    v169        = v168*v40
    v206        = 120.0d0*L_yyyy + L_yyyyz*v44 + L_yyyyzz*v45 + L_yyyyzzz*v46 + L_yyyyzzzz &
      *v47 + L_yyyyzzzzz*v11
    v236        = 120.0d0*L_yyyz + L_yyyzz*v44 + L_yyyzzz*v45 + L_yyyzzzz*v46 + L_yyyzzzzz &
      *v47 + L_yyyzzzzzz*v11
    c6          = c3*c3
    v13         = c6
    v242        = 0.00138888888888889d0*v13
    v130        = L_xzzzzzz*v13
    v215        = L_yzzzzzz*v13
    v14         = L_xxzzzzzz*v13
    v102        = L_xyzzzzzz*v13
    v155        = L_xzzzzzzz*v13
    v195        = L_yyzzzzzz*v13
    v230        = L_yzzzzzzz*v13
    v95         = 720.0d0*L_xxx + L_xxxyyyyyy*v17 + L_xxxz*v50 + L_xxxzz*v51 + L_xxxzzz* &
      v52 + L_xxxzzzz*v53 + L_xxxzzzzz*v54 + L_xxxzzzzzz*v13 + v85*v86 &
      + v87*v88 + v89*v90 + v91*v92 + v93*v94
    v55         = 720.0d0*L_xxy + L_xxyz*v50 + L_xxyzz*v51 + L_xxyzzz*v52 + L_xxyzzzz*v53 &
      + L_xxyzzzzz*v54 + L_xxyzzzzzz*v13
    v56         = v55*y
    v121        = v55 + L_xxyyyyyyy*v17 + v18*v85 + v25*v87 + v30*v89 + v36*v91 + v48*v93
    v189        = L_xxyyyyyyz*v17 + 720.0d0*L_xxz + L_xxzz*v50 + L_xxzzz*v51 + L_xxzzzz* &
      v52 + L_xxzzzzz*v53 + L_xxzzzzzz*v54 + L_xxzzzzzzz*v13 + v184*v85 &
      + v185*v87 + v186*v89 + v187*v91 + v188*v93
    v116        = 720.0d0*L_xyy + L_xyyz*v50 + L_xyyzz*v51 + L_xyyzzz*v52 + L_xyyzzzz*v53 &
      + L_xyyzzzzz*v54 + L_xyyzzzzzz*v13
    v117        = v116*y
    v140        = v116*v40
    v170        = 720.0d0*L_xyz + L_xyzz*v50 + L_xyzzz*v51 + L_xyzzzz*v52 + L_xyzzzzz*v53 &
      + L_xyzzzzzz*v54 + L_xyzzzzzzz*v13
    v171        = v170*y
    v208        = 720.0d0*L_yyy + L_yyyz*v50 + L_yyyzz*v51 + L_yyyzzz*v52 + L_yyyzzzz*v53 &
      + L_yyyzzzzz*v54 + L_yyyzzzzzz*v13
    v237        = 720.0d0*L_yyz + L_yyzz*v50 + L_yyzzz*v51 + L_yyzzzz*v52 + L_yyzzzzz*v53 &
      + L_yyzzzzzz*v54 + L_yyzzzzzzz*v13
    c7          = c3*c4
    v15         = c7
    v243        = 0.000198412698412698d0*v15
    v131        = L_xzzzzzzz*v15
    v216        = L_yzzzzzzz*v15
    v16         = L_xxzzzzzzz*v15
    v148        = v16 + v4 + 210.0d0*v10 + 42.0d0*v12 + 2520.0d0*v6 + 840.0d0*v8 + 7.0d0*( &
      720.0d0*L_xx + 720.0d0*v0 + v14 + v19 + 3.0d0*v26 + 5.0d0*v31 + &
      5.0d0*v37 + 3.0d0*v49 + v56)
    Phi_xx      = L_xx + L_xxxxxxxxx*v2 + v0 + v21*v22 + v39*v43 + v58*v63 + v65*v72 + v74 &
      *v83 + v84*v95 + 0.000198412698412698d0*(210.0d0*v10 + 42.0d0*v12 &
      + v16 + v4 + 2520.0d0*v6 + 840.0d0*v8 + 21.0d0*(v26 + v49) + &
      35.0d0*(v31 + v37) + 7.0d0*(v14 + v19 + v56))
    v103        = L_xyzzzzzzz*v15
    v141        = v103 + 210.0d0*v100 + 42.0d0*v101 + 2520.0d0*v98 + 840.0d0*v99 + 7.0d0*( &
      720.0d0*L_xy + v102 + 720.0d0*v96)
    v142        = v141*y
    Phi_xy      = 0.000198412698412698d0*(210.0d0*v100 + 42.0d0*v101 + v103 + v97 + &
      2520.0d0*v98 + 840.0d0*v99 + 21.0d0*(v108 + v115) + 35.0d0*(v110 &
      + v112) + 7.0d0*(v102 + v105 + v117)) + L_xxxxxxxxy*v2 + L_xy + &
      v106*v21 + v113*v39 + v118*v58 + v119*v65 + v120*v74 + v121*v84 + &
      v96
    v156        = L_xzzzzzzzz*v15
    Phi_xz      = 0.000198412698412698d0*(v150 + 2520.0d0*v151 + 840.0d0*v152 + 210.0d0* &
      v153 + 42.0d0*v154 + v156 + 21.0d0*(v161 + v169) + 35.0d0*(v163 + &
      v165) + 7.0d0*(v155 + v158 + v171)) + L_xxxxxxxxz*v2 + L_xz + &
      v149 + v159*v21 + v167*v39 + v174*v58 + v178*v65 + v183*v74 + &
      v189*v84
    v196        = L_yyzzzzzzz*v15
    v224        = v196 + 2520.0d0*v191 + 840.0d0*v192 + 210.0d0*v193 + 42.0d0*v194 + 7.0d0 &
      *(720.0d0*L_yy + 720.0d0*v190 + v195)
    Phi_yy      = 0.000198412698412698d0*(2520.0d0*v191 + 840.0d0*v192 + 210.0d0*v193 + &
      42.0d0*v194 + 7.0d0*v195 + v196) + L_xxxxxxxyy*v2 + L_yy + &
      L_yyyyyyyyy*v134 + v190 + v197*v198 + v199*v200 + v201*v202 + &
      v203*v204 + v205*v206 + v207*v208 + v21*(L_xxxxxxyyy*y + v60) + &
      v39*(L_xxxxxyyyy*v40 + v41*v67 + v69) + v58*(L_xxxxyyyyy*v32 + &
      v59*v76 + v61*v78 + v80) + v65*(L_xxxyyyyyy*v27 + v66*v86 + v68* &
      v88 + v70*v90 + v92) + v74*(L_xxyyyyyyy*v23 + v18*v75 + v25*v77 + &
      v30*v79 + v36*v81 + v48) + v84*(L_xyyyyyyyy*v17 + v104*v85 + v107 &
      *v87 + v109*v89 + v111*v91 + v114*v93 + v116)
    Phi_zz      = -(Phi_xx + Phi_yy)
    v231        = L_yzzzzzzzz*v15
    Phi_yz      = 0.000198412698412698d0*(2520.0d0*v226 + 840.0d0*v227 + 210.0d0*v228 + &
      42.0d0*v229 + 7.0d0*v230 + v231) + L_xxxxxxxyz*v2 + L_yyyyyyyyz* &
      v134 + L_yz + v197*v232 + v199*v233 + v201*v234 + v203*v235 + &
      v205*v236 + v207*v237 + v21*(L_xxxxxxyyz*y + v166) + v225 + v39*( &
      L_xxxxxyyyz*v40 + v172*v41 + v173) + v58*(L_xxxxyyyyz*v32 + v175* &
      v59 + v176*v61 + v177) + v65*(L_xxxyyyyyz*v27 + v179*v66 + v180* &
      v68 + v181*v70 + v182) + v74*(L_xxyyyyyyz*v23 + v184*v75 + v185* &
      v77 + v186*v79 + v187*v81 + v188) + v84*(L_xyyyyyyyz*v17 + v157* &
      v85 + v160*v87 + v162*v89 + v164*v91 + v168*v93 + v170)
    c8          = c4*c4
    v132        = c8
    v244        = 2.48015873015873d-5*v132
    v133        = L_xzzzzzzzz*v132
    Phi_x       = 2.48015873015873d-5*(v125 + 20160.0d0*v126 + 6720.0d0*v127 + 1680.0d0* &
      v128 + 336.0d0*v129 + v133 + 70.0d0*v137 + 8.0d0*(v131 + v142) + &
      28.0d0*(v135 + v140) + 56.0d0*(v130 + v136 + v139)) + L_x + &
      L_xxxxxxxxx*v123 + v104*v134 + v122 + v138*v43 + v143*v63 + v144* &
      v72 + v145*v83 + v146*v95 + v147*v148 + v2*v22
    v217        = L_yzzzzzzzz*v132
    Phi_y       = 2.48015873015873d-5*(20160.0d0*v211 + 6720.0d0*v212 + 1680.0d0*v213 + &
      336.0d0*v214 + 56.0d0*v215 + 8.0d0*v216 + v217) + L_xxxxxxxxy* &
      v123 + L_y + L_yyyyyyyyy*v210 + v106*v2 + v113*v138 + v118*v143 + &
      v119*v144 + v120*v145 + v121*v146 + v134*v198 + v147*(7.0d0*v105 &
      + 21.0d0*v108 + 35.0d0*v110 + 35.0d0*v112 + 21.0d0*v115 + 7.0d0* &
      v117 + v141 + v97) + v200*v218 + v202*v219 + v204*v220 + v206* &
      v221 + v208*v222 + v209 + v223*v224
    Phi_z       = L_z + L_xxxxxxxxz*v123 + L_yyyyyyyyz*v210 + L_zz*z + L_zzz*v238 + L_zzzz &
      *v239 + L_zzzzz*v240 + L_zzzzzz*v241 + L_zzzzzzz*v242 + &
      L_zzzzzzzz*v243 + L_zzzzzzzzz*v244 + v134*v232 + v138*v167 + v143 &
      *v174 + v144*v178 + v145*v183 + v146*v189 + v147*(5040.0d0*L_xz + &
      5040.0d0*v149 + v150 + 2520.0d0*v151 + 840.0d0*v152 + 210.0d0* &
      v153 + 42.0d0*v154 + 7.0d0*v155 + v156 + 7.0d0*v158 + 21.0d0*v161 &
      + 35.0d0*v163 + 35.0d0*v165 + 21.0d0*v169 + 7.0d0*v171) + v159*v2 &
      + v218*v233 + v219*v234 + v220*v235 + v221*v236 + v222*v237 + &
      v223*(5040.0d0*L_yz + 5040.0d0*v225 + 2520.0d0*v226 + 840.0d0* &
      v227 + 210.0d0*v228 + 42.0d0*v229 + 7.0d0*v230 + v231)
    c9          = c4*c5
    Phi_0       = 2.75573192239859d-6*(L_xxxxxxxxx*a9 + L_yyyyyyyyy*b9 + L_zzzzzzzzz*c9 + &
      9.0d0*(x*(40320.0d0*L_x + 8.0d0*v104*v3 + 40320.0d0*v122 + v125 + &
      20160.0d0*v126 + 6720.0d0*v127 + 1680.0d0*v128 + 336.0d0*v129 + &
      56.0d0*v130 + 8.0d0*v131 + v133 + 28.0d0*v135 + 56.0d0*v136 + &
      70.0d0*v137 + 56.0d0*v139 + 28.0d0*v140 + 8.0d0*v142) + y*( &
      40320.0d0*L_y + 40320.0d0*v209 + 20160.0d0*v211 + 6720.0d0*v212 + &
      1680.0d0*v213 + 336.0d0*v214 + 56.0d0*v215 + 8.0d0*v216 + v217)) &
      + 36.0d0*(v1*v43 + v148*v73 + v200*v3 + v224*v40) + 84.0d0*(v17* &
      v202 + v20*v63 + v208*v32 + v64*v95) + 126.0d0*(v204*v23 + v206* &
      v27 + v38*v72 + v57*v83)) + L_0 + L_z*z + L_zz*v238 + L_zzz*v239 &
      + L_zzzz*v240 + L_zzzzz*v241 + L_zzzzzz*v242 + L_zzzzzzz*v243 + &
      L_zzzzzzzz*v244 + v123*v22 + v198*v210
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
#undef  L_xxxxxxxxx         
#undef  L_xxxxxxxxy         
#undef  L_xxxxxxxxz         
#undef  L_xxxxxxxyy         
#undef  L_xxxxxxxyz         
#undef  L_xxxxxxyyy         
#undef  L_xxxxxxyyz         
#undef  L_xxxxxyyyy         
#undef  L_xxxxxyyyz         
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  L_xxxyyyyyy         
#undef  L_xxxyyyyyz         
#undef  L_xxyyyyyyy         
#undef  L_xxyyyyyyz         
#undef  L_xyyyyyyyy         
#undef  L_xyyyyyyyz         
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
    end subroutine mom_es_L2P
    
! OPS  3843*ADD + 2*DIV + 4008*MUL + POW = 7854  (20401 before optimization)
subroutine mom_es_M2M_add(M, r, Ms)
    real(dp), intent(in)    :: M(0:MOM_ES_M_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ms(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v1000, v1001, v1002, v1003, v1004,&
                v1005, v1006, v1007, v1008, v1009, v101, v1010, v1011, v1012,&
                v1013, v1014, v1015, v1016, v1017, v1018, v1019, v102, v1020,&
                v1021, v1022, v1023, v1024, v1025, v1026, v1027, v1028, v1029,&
                v103, v1030, v1031, v1032, v1033, v1034, v1035, v1036, v1037,&
                v1038, v1039, v104, v1040, v1041, v1042, v1043, v1044, v1045,&
                v1046, v1047, v1048, v1049, v105, v1050, v1051, v1052, v1053,&
                v1054, v1055, v1056, v1057, v1058, v1059, v106, v1060, v1061,&
                v1062, v1063, v1064, v1065, v1066, v1067, v1068, v1069, v107,&
                v1070, v1071, v1072, v1073, v1074, v1075, v1076, v1077, v1078,&
                v1079, v108, v1080, v1081, v1082, v1083, v1084, v1085, v1086,&
                v1087, v1088, v1089, v109, v1090, v1091, v1092, v1093, v1094,&
                v1095, v1096, v1097, v1098, v1099, v11, v110, v1100, v1101,&
                v1102, v1103, v1104, v1105, v1106, v1107, v1108, v1109, v111,&
                v1110, v1111, v1112, v1113, v1114, v1115, v1116, v1117, v1118,&
                v1119, v112, v1120, v1121, v1122, v1123, v1124, v1125, v1126,&
                v1127, v1128, v1129, v113, v1130, v1131, v1132, v1133, v1134,&
                v1135, v1136, v1137, v1138, v1139, v114, v1140, v1141, v1142,&
                v1143, v1144, v1145, v1146, v115, v116, v117, v118, v119, v12,&
                v120, v121, v122, v123, v124, v125, v126, v127, v128, v129,&
                v13, v130, v131, v132, v133, v134, v135, v136, v137, v138,&
                v139, v14, v140, v141, v142, v143, v144, v145, v146, v147,&
                v148, v149, v15, v150, v151, v152, v153, v154, v155, v156,&
                v157, v158, v159, v16, v160, v161, v162, v163, v164, v165,&
                v166, v167, v168, v169, v17, v170, v171, v172, v173, v174,&
                v175, v176, v177, v178, v179, v18, v180, v181, v182, v183,&
                v184, v185, v186, v187, v188, v189, v19, v190, v191, v192,&
                v193, v194, v195, v196, v197, v198, v199, v2, v20, v200, v201,&
                v202, v203, v204, v205, v206, v207, v208, v209, v21, v210,&
                v211, v212, v213, v214, v215, v216, v217, v218, v219, v22,&
                v220, v221, v222, v223, v224, v225, v226, v227, v228, v229,&
                v23, v230, v231, v232, v233, v234, v235, v236, v237, v238,&
                v239, v24, v240, v241, v242, v243, v244, v245, v246, v247,&
                v248, v249, v25, v250, v251, v252, v253, v254, v255, v256,&
                v257, v258, v259, v26, v260, v261, v262, v263, v264, v265,&
                v266, v267, v268, v269, v27, v270, v271, v272, v273, v274,&
                v275, v276, v277, v278, v279, v28, v280, v281, v282, v283,&
                v284, v285, v286, v287, v288, v289, v29, v290, v291, v292,&
                v293, v294, v295, v296, v297, v298, v299, v3, v30, v300, v301,&
                v302, v303, v304, v305, v306, v307, v308, v309, v31, v310,&
                v311, v312, v313, v314, v315, v316, v317, v318, v319, v32,&
                v320, v321, v322, v323, v324, v325, v326, v327, v328, v329,&
                v33, v330, v331, v332, v333, v334, v335, v336, v337, v338,&
                v339, v34, v340, v341, v342, v343, v344, v345, v346, v347,&
                v348, v349, v35, v350, v351, v352, v353, v354, v355, v356,&
                v357, v358, v359, v36, v360, v361, v362, v363, v364, v365,&
                v366, v367, v368, v369, v37, v370, v371, v372, v373, v374,&
                v375, v376, v377, v378, v379, v38, v380, v381, v382, v383,&
                v384, v385, v386, v387, v388, v389, v39, v390, v391, v392,&
                v393, v394, v395, v396, v397, v398, v399, v4, v40, v400, v401,&
                v402, v403, v404, v405, v406, v407, v408, v409, v41, v410,&
                v411, v412, v413, v414, v415, v416, v417, v418, v419, v42,&
                v420, v421, v422, v423, v424, v425, v426, v427, v428, v429,&
                v43, v430, v431, v432, v433, v434, v435, v436, v437, v438,&
                v439, v44, v440, v441, v442, v443, v444, v445, v446, v447,&
                v448, v449, v45, v450, v451, v452, v453, v454, v455, v456,&
                v457, v458, v459, v46, v460, v461, v462, v463, v464, v465,&
                v466, v467, v468, v469, v47, v470, v471, v472, v473, v474,&
                v475, v476, v477, v478, v479, v48, v480, v481, v482, v483,&
                v484, v485, v486, v487, v488, v489, v49, v490, v491, v492,&
                v493, v494, v495, v496, v497, v498, v499, v5, v50, v500, v501,&
                v502, v503, v504, v505, v506, v507, v508, v509, v51, v510,&
                v511, v512, v513, v514, v515, v516, v517, v518, v519, v52,&
                v520, v521, v522, v523, v524, v525, v526, v527, v528, v529,&
                v53, v530, v531, v532, v533, v534, v535, v536, v537, v538,&
                v539, v54, v540, v541, v542, v543, v544, v545, v546, v547,&
                v548, v549, v55, v550, v551, v552, v553, v554, v555, v556,&
                v557, v558, v559, v56, v560, v561, v562, v563, v564, v565,&
                v566, v567, v568, v569, v57, v570, v571, v572, v573, v574,&
                v575, v576, v577, v578, v579, v58, v580, v581, v582, v583,&
                v584, v585, v586, v587, v588, v589, v59, v590, v591, v592,&
                v593, v594, v595, v596, v597, v598, v599, v6, v60, v600, v601,&
                v602, v603, v604, v605, v606, v607, v608, v609, v61, v610,&
                v611, v612, v613, v614, v615, v616, v617, v618, v619, v62,&
                v620, v621, v622, v623, v624, v625, v626, v627, v628, v629,&
                v63, v630, v631, v632, v633, v634, v635, v636, v637, v638,&
                v639, v64, v640, v641, v642, v643, v644, v645, v646, v647,&
                v648, v649, v65, v650, v651, v652, v653, v654, v655, v656,&
                v657, v658, v659, v66, v660, v661, v662, v663, v664, v665,&
                v666, v667, v668, v669, v67, v670, v671, v672, v673, v674,&
                v675, v676, v677, v678, v679, v68, v680, v681, v682, v683,&
                v684, v685, v686, v687, v688, v689, v69, v690, v691, v692,&
                v693, v694, v695, v696, v697, v698, v699, v7, v70, v700, v701,&
                v702, v703, v704, v705, v706, v707, v708, v709, v71, v710,&
                v711, v712, v713, v714, v715, v716, v717, v718, v719, v72,&
                v720, v721, v722, v723, v724, v725, v726, v727, v728, v729,&
                v73, v730, v731, v732, v733, v734, v735, v736, v737, v738,&
                v739, v74, v740, v741, v742, v743, v744, v745, v746, v747,&
                v748, v749, v75, v750, v751, v752, v753, v754, v755, v756,&
                v757, v758, v759, v76, v760, v761, v762, v763, v764, v765,&
                v766, v767, v768, v769, v77, v770, v771, v772, v773, v774,&
                v775, v776, v777, v778, v779, v78, v780, v781, v782, v783,&
                v784, v785, v786, v787, v788, v789, v79, v790, v791, v792,&
                v793, v794, v795, v796, v797, v798, v799, v8, v80, v800, v801,&
                v802, v803, v804, v805, v806, v807, v808, v809, v81, v810,&
                v811, v812, v813, v814, v815, v816, v817, v818, v819, v82,&
                v820, v821, v822, v823, v824, v825, v826, v827, v828, v829,&
                v83, v830, v831, v832, v833, v834, v835, v836, v837, v838,&
                v839, v84, v840, v841, v842, v843, v844, v845, v846, v847,&
                v848, v849, v85, v850, v851, v852, v853, v854, v855, v856,&
                v857, v858, v859, v86, v860, v861, v862, v863, v864, v865,&
                v866, v867, v868, v869, v87, v870, v871, v872, v873, v874,&
                v875, v876, v877, v878, v879, v88, v880, v881, v882, v883,&
                v884, v885, v886, v887, v888, v889, v89, v890, v891, v892,&
                v893, v894, v895, v896, v897, v898, v899, v9, v90, v900, v901,&
                v902, v903, v904, v905, v906, v907, v908, v909, v91, v910,&
                v911, v912, v913, v914, v915, v916, v917, v918, v919, v92,&
                v920, v921, v922, v923, v924, v925, v926, v927, v928, v929,&
                v93, v930, v931, v932, v933, v934, v935, v936, v937, v938,&
                v939, v94, v940, v941, v942, v943, v944, v945, v946, v947,&
                v948, v949, v95, v950, v951, v952, v953, v954, v955, v956,&
                v957, v958, v959, v96, v960, v961, v962, v963, v964, v965,&
                v966, v967, v968, v969, v97, v970, v971, v972, v973, v974,&
                v975, v976, v977, v978, v979, v98, v980, v981, v982, v983,&
                v984, v985, v986, v987, v988, v989, v99, v990, v991, v992,&
                v993, v994, v995, v996, v997, v998, v999, h, u
#define y                    r(2)
#define z                    r(3)
#define M_0                  M(0)
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
#define Ms_zz                Ms(9)
#define M_zz                 M(9)
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
#define M_yyy                M(16)
#define Ms_yyy               Ms(16)
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
#define M_xxxz               M(22)
#define Ms_xxxz              Ms(22)
#define M_xxyy               M(23)
#define Ms_xxyy              Ms(23)
#define Ms_xxyz              Ms(24)
#define M_xxyz               M(24)
#define M_xxzz               M(25)
#define Ms_xxzz              Ms(25)
#define Ms_xyyy              Ms(26)
#define M_xyyy               M(26)
#define Ms_xyyz              Ms(27)
#define M_xyyz               M(27)
#define Ms_xyzz              Ms(28)
#define M_xyzz               M(28)
#define Ms_xzzz              Ms(29)
#define M_xzzz               M(29)
#define Ms_yyyy              Ms(30)
#define M_yyyy               M(30)
#define M_yyyz               M(31)
#define Ms_yyyz              Ms(31)
#define Ms_yyzz              Ms(32)
#define M_yyzz               M(32)
#define Ms_yzzz              Ms(33)
#define M_yzzz               M(33)
#define M_zzzz               M(34)
#define Ms_zzzz              Ms(34)
#define M_xxxxx              M(35)
#define Ms_xxxxx             Ms(35)
#define Ms_xxxxy             Ms(36)
#define M_xxxxy              M(36)
#define M_xxxxz              M(37)
#define Ms_xxxxz             Ms(37)
#define M_xxxyy              M(38)
#define Ms_xxxyy             Ms(38)
#define Ms_xxxyz             Ms(39)
#define M_xxxyz              M(39)
#define Ms_xxxzz             Ms(40)
#define M_xxxzz              M(40)
#define Ms_xxyyy             Ms(41)
#define M_xxyyy              M(41)
#define M_xxyyz              M(42)
#define Ms_xxyyz             Ms(42)
#define Ms_xxyzz             Ms(43)
#define M_xxyzz              M(43)
#define M_xxzzz              M(44)
#define Ms_xxzzz             Ms(44)
#define Ms_xyyyy             Ms(45)
#define M_xyyyy              M(45)
#define M_xyyyz              M(46)
#define Ms_xyyyz             Ms(46)
#define Ms_xyyzz             Ms(47)
#define M_xyyzz              M(47)
#define M_xyzzz              M(48)
#define Ms_xyzzz             Ms(48)
#define M_xzzzz              M(49)
#define Ms_xzzzz             Ms(49)
#define Ms_yyyyy             Ms(50)
#define M_yyyyy              M(50)
#define Ms_yyyyz             Ms(51)
#define M_yyyyz              M(51)
#define M_yyyzz              M(52)
#define Ms_yyyzz             Ms(52)
#define Ms_yyzzz             Ms(53)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define Ms_yzzzz             Ms(54)
#define M_zzzzz              M(55)
#define Ms_zzzzz             Ms(55)
#define M_xxxxxx             M(56)
#define Ms_xxxxxx            Ms(56)
#define Ms_xxxxxy            Ms(57)
#define M_xxxxxy             M(57)
#define Ms_xxxxxz            Ms(58)
#define M_xxxxxz             M(58)
#define Ms_xxxxyy            Ms(59)
#define M_xxxxyy             M(59)
#define M_xxxxyz             M(60)
#define Ms_xxxxyz            Ms(60)
#define Ms_xxxxzz            Ms(61)
#define M_xxxxzz             M(61)
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
#define M_xxyyyz             M(67)
#define Ms_xxyyyz            Ms(67)
#define M_xxyyzz             M(68)
#define Ms_xxyyzz            Ms(68)
#define M_xxyzzz             M(69)
#define Ms_xxyzzz            Ms(69)
#define M_xxzzzz             M(70)
#define Ms_xxzzzz            Ms(70)
#define M_xyyyyy             M(71)
#define Ms_xyyyyy            Ms(71)
#define Ms_xyyyyz            Ms(72)
#define M_xyyyyz             M(72)
#define Ms_xyyyzz            Ms(73)
#define M_xyyyzz             M(73)
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
#define M_yyyyzz             M(79)
#define Ms_yyyyzz            Ms(79)
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
#define M_xxxxxxy            M(85)
#define Ms_xxxxxxy           Ms(85)
#define M_xxxxxxz            M(86)
#define Ms_xxxxxxz           Ms(86)
#define Ms_xxxxxyy           Ms(87)
#define M_xxxxxyy            M(87)
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
#define Ms_xxxxzzz           Ms(93)
#define M_xxxxzzz            M(93)
#define Ms_xxxyyyy           Ms(94)
#define M_xxxyyyy            M(94)
#define Ms_xxxyyyz           Ms(95)
#define M_xxxyyyz            M(95)
#define Ms_xxxyyzz           Ms(96)
#define M_xxxyyzz            M(96)
#define Ms_xxxyzzz           Ms(97)
#define M_xxxyzzz            M(97)
#define Ms_xxxzzzz           Ms(98)
#define M_xxxzzzz            M(98)
#define Ms_xxyyyyy           Ms(99)
#define M_xxyyyyy            M(99)
#define Ms_xxyyyyz           Ms(100)
#define M_xxyyyyz            M(100)
#define M_xxyyyzz            M(101)
#define Ms_xxyyyzz           Ms(101)
#define Ms_xxyyzzz           Ms(102)
#define M_xxyyzzz            M(102)
#define Ms_xxyzzzz           Ms(103)
#define M_xxyzzzz            M(103)
#define M_xxzzzzz            M(104)
#define Ms_xxzzzzz           Ms(104)
#define Ms_xyyyyyy           Ms(105)
#define M_xyyyyyy            M(105)
#define Ms_xyyyyyz           Ms(106)
#define M_xyyyyyz            M(106)
#define Ms_xyyyyzz           Ms(107)
#define M_xyyyyzz            M(107)
#define Ms_xyyyzzz           Ms(108)
#define M_xyyyzzz            M(108)
#define Ms_xyyzzzz           Ms(109)
#define M_xyyzzzz            M(109)
#define Ms_xyzzzzz           Ms(110)
#define M_xyzzzzz            M(110)
#define Ms_xzzzzzz           Ms(111)
#define M_xzzzzzz            M(111)
#define M_yyyyyyy            M(112)
#define Ms_yyyyyyy           Ms(112)
#define M_yyyyyyz            M(113)
#define Ms_yyyyyyz           Ms(113)
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
#define M_zzzzzzz            M(119)
#define Ms_zzzzzzz           Ms(119)
#define M_xxxxxxxx           M(120)
#define Ms_xxxxxxxx          Ms(120)
#define M_xxxxxxxy           M(121)
#define Ms_xxxxxxxy          Ms(121)
#define Ms_xxxxxxxz          Ms(122)
#define M_xxxxxxxz           M(122)
#define Ms_xxxxxxyy          Ms(123)
#define M_xxxxxxyy           M(123)
#define M_xxxxxxyz           M(124)
#define Ms_xxxxxxyz          Ms(124)
#define Ms_xxxxxxzz          Ms(125)
#define M_xxxxxxzz           M(125)
#define M_xxxxxyyy           M(126)
#define Ms_xxxxxyyy          Ms(126)
#define Ms_xxxxxyyz          Ms(127)
#define M_xxxxxyyz           M(127)
#define M_xxxxxyzz           M(128)
#define Ms_xxxxxyzz          Ms(128)
#define Ms_xxxxxzzz          Ms(129)
#define M_xxxxxzzz           M(129)
#define M_xxxxyyyy           M(130)
#define Ms_xxxxyyyy          Ms(130)
#define M_xxxxyyyz           M(131)
#define Ms_xxxxyyyz          Ms(131)
#define M_xxxxyyzz           M(132)
#define Ms_xxxxyyzz          Ms(132)
#define Ms_xxxxyzzz          Ms(133)
#define M_xxxxyzzz           M(133)
#define M_xxxxzzzz           M(134)
#define Ms_xxxxzzzz          Ms(134)
#define M_xxxyyyyy           M(135)
#define Ms_xxxyyyyy          Ms(135)
#define M_xxxyyyyz           M(136)
#define Ms_xxxyyyyz          Ms(136)
#define Ms_xxxyyyzz          Ms(137)
#define M_xxxyyyzz           M(137)
#define M_xxxyyzzz           M(138)
#define Ms_xxxyyzzz          Ms(138)
#define M_xxxyzzzz           M(139)
#define Ms_xxxyzzzz          Ms(139)
#define Ms_xxxzzzzz          Ms(140)
#define M_xxxzzzzz           M(140)
#define M_xxyyyyyy           M(141)
#define Ms_xxyyyyyy          Ms(141)
#define M_xxyyyyyz           M(142)
#define Ms_xxyyyyyz          Ms(142)
#define M_xxyyyyzz           M(143)
#define Ms_xxyyyyzz          Ms(143)
#define Ms_xxyyyzzz          Ms(144)
#define M_xxyyyzzz           M(144)
#define Ms_xxyyzzzz          Ms(145)
#define M_xxyyzzzz           M(145)
#define Ms_xxyzzzzz          Ms(146)
#define M_xxyzzzzz           M(146)
#define M_xxzzzzzz           M(147)
#define Ms_xxzzzzzz          Ms(147)
#define Ms_xyyyyyyy          Ms(148)
#define M_xyyyyyyy           M(148)
#define Ms_xyyyyyyz          Ms(149)
#define M_xyyyyyyz           M(149)
#define M_xyyyyyzz           M(150)
#define Ms_xyyyyyzz          Ms(150)
#define M_xyyyyzzz           M(151)
#define Ms_xyyyyzzz          Ms(151)
#define M_xyyyzzzz           M(152)
#define Ms_xyyyzzzz          Ms(152)
#define M_xyyzzzzz           M(153)
#define Ms_xyyzzzzz          Ms(153)
#define M_xyzzzzzz           M(154)
#define Ms_xyzzzzzz          Ms(154)
#define M_xzzzzzzz           M(155)
#define Ms_xzzzzzzz          Ms(155)
#define Ms_yyyyyyyy          Ms(156)
#define M_yyyyyyyy           M(156)
#define Ms_yyyyyyyz          Ms(157)
#define M_yyyyyyyz           M(157)
#define Ms_yyyyyyzz          Ms(158)
#define M_yyyyyyzz           M(158)
#define Ms_yyyyyzzz          Ms(159)
#define M_yyyyyzzz           M(159)
#define M_yyyyzzzz           M(160)
#define Ms_yyyyzzzz          Ms(160)
#define M_yyyzzzzz           M(161)
#define Ms_yyyzzzzz          Ms(161)
#define Ms_yyzzzzzz          Ms(162)
#define M_yyzzzzzz           M(162)
#define M_yzzzzzzz           M(163)
#define Ms_yzzzzzzz          Ms(163)
#define Ms_zzzzzzzz          Ms(164)
#define M_zzzzzzzz           M(164)
#define Ms_xxxxxxxxx         Ms(165)
#define M_xxxxxxxxx          M(165)
#define M_xxxxxxxxy          M(166)
#define Ms_xxxxxxxxy         Ms(166)
#define Ms_xxxxxxxxz         Ms(167)
#define M_xxxxxxxxz          M(167)
#define Ms_xxxxxxxyy         Ms(168)
#define M_xxxxxxxyy          M(168)
#define M_xxxxxxxyz          M(169)
#define Ms_xxxxxxxyz         Ms(169)
#define Ms_xxxxxxxzz         Ms(170)
#define M_xxxxxxxzz          M(170)
#define M_xxxxxxyyy          M(171)
#define Ms_xxxxxxyyy         Ms(171)
#define Ms_xxxxxxyyz         Ms(172)
#define M_xxxxxxyyz          M(172)
#define Ms_xxxxxxyzz         Ms(173)
#define M_xxxxxxyzz          M(173)
#define Ms_xxxxxxzzz         Ms(174)
#define M_xxxxxxzzz          M(174)
#define M_xxxxxyyyy          M(175)
#define Ms_xxxxxyyyy         Ms(175)
#define M_xxxxxyyyz          M(176)
#define Ms_xxxxxyyyz         Ms(176)
#define M_xxxxxyyzz          M(177)
#define Ms_xxxxxyyzz         Ms(177)
#define M_xxxxxyzzz          M(178)
#define Ms_xxxxxyzzz         Ms(178)
#define M_xxxxxzzzz          M(179)
#define Ms_xxxxxzzzz         Ms(179)
#define M_xxxxyyyyy          M(180)
#define Ms_xxxxyyyyy         Ms(180)
#define Ms_xxxxyyyyz         Ms(181)
#define M_xxxxyyyyz          M(181)
#define Ms_xxxxyyyzz         Ms(182)
#define M_xxxxyyyzz          M(182)
#define M_xxxxyyzzz          M(183)
#define Ms_xxxxyyzzz         Ms(183)
#define M_xxxxyzzzz          M(184)
#define Ms_xxxxyzzzz         Ms(184)
#define Ms_xxxxzzzzz         Ms(185)
#define M_xxxxzzzzz          M(185)
#define M_xxxyyyyyy          M(186)
#define Ms_xxxyyyyyy         Ms(186)
#define M_xxxyyyyyz          M(187)
#define Ms_xxxyyyyyz         Ms(187)
#define M_xxxyyyyzz          M(188)
#define Ms_xxxyyyyzz         Ms(188)
#define M_xxxyyyzzz          M(189)
#define Ms_xxxyyyzzz         Ms(189)
#define Ms_xxxyyzzzz         Ms(190)
#define M_xxxyyzzzz          M(190)
#define Ms_xxxyzzzzz         Ms(191)
#define M_xxxyzzzzz          M(191)
#define Ms_xxxzzzzzz         Ms(192)
#define M_xxxzzzzzz          M(192)
#define M_xxyyyyyyy          M(193)
#define Ms_xxyyyyyyy         Ms(193)
#define Ms_xxyyyyyyz         Ms(194)
#define M_xxyyyyyyz          M(194)
#define Ms_xxyyyyyzz         Ms(195)
#define M_xxyyyyyzz          M(195)
#define M_xxyyyyzzz          M(196)
#define Ms_xxyyyyzzz         Ms(196)
#define M_xxyyyzzzz          M(197)
#define Ms_xxyyyzzzz         Ms(197)
#define M_xxyyzzzzz          M(198)
#define Ms_xxyyzzzzz         Ms(198)
#define Ms_xxyzzzzzz         Ms(199)
#define M_xxyzzzzzz          M(199)
#define Ms_xxzzzzzzz         Ms(200)
#define M_xxzzzzzzz          M(200)
#define M_xyyyyyyyy          M(201)
#define Ms_xyyyyyyyy         Ms(201)
#define Ms_xyyyyyyyz         Ms(202)
#define M_xyyyyyyyz          M(202)
#define Ms_xyyyyyyzz         Ms(203)
#define M_xyyyyyyzz          M(203)
#define Ms_xyyyyyzzz         Ms(204)
#define M_xyyyyyzzz          M(204)
#define Ms_xyyyyzzzz         Ms(205)
#define M_xyyyyzzzz          M(205)
#define M_xyyyzzzzz          M(206)
#define Ms_xyyyzzzzz         Ms(206)
#define M_xyyzzzzzz          M(207)
#define Ms_xyyzzzzzz         Ms(207)
#define Ms_xyzzzzzzz         Ms(208)
#define M_xyzzzzzzz          M(208)
#define M_xzzzzzzzz          M(209)
#define Ms_xzzzzzzzz         Ms(209)
#define Ms_yyyyyyyyy         Ms(210)
#define M_yyyyyyyyy          M(210)
#define M_yyyyyyyyz          M(211)
#define Ms_yyyyyyyyz         Ms(211)
#define M_yyyyyyyzz          M(212)
#define Ms_yyyyyyyzz         Ms(212)
#define Ms_yyyyyyzzz         Ms(213)
#define M_yyyyyyzzz          M(213)
#define M_yyyyyzzzz          M(214)
#define Ms_yyyyyzzzz         Ms(214)
#define M_yyyyzzzzz          M(215)
#define Ms_yyyyzzzzz         Ms(215)
#define M_yyyzzzzzz          M(216)
#define Ms_yyyzzzzzz         Ms(216)
#define M_yyzzzzzzz          M(217)
#define Ms_yyzzzzzzz         Ms(217)
#define Ms_yzzzzzzzz         Ms(218)
#define M_yzzzzzzzz          M(218)
#define Ms_zzzzzzzzz         Ms(219)
#define M_zzzzzzzzz          M(219)
    v1067        = M_0*x
    v1068        = M_0*y
    v1069        = M_0*z
    v1070        = 0.0416666666666667d0*M_0
    v1084        = 0.00138888888888889d0*M_0
    v1124        = 9.92063492063492d-5*M_0
    v1126        = 0.000347222222222222d0*M_0
    v0           = v1067
    v1           = M_x + v0
    v2           = v1068
    v3           = M_y + v2
    v4           = M_z + v1069
    v5           = M_x*x
    v6           = M_xx + v5
    v7           = 0.5d0*M_0
    v9           = M_y*x
    v10          = M_xy + v9
    v11          = M_x*y
    v12          = v0*y
    v13          = v10 + v11 + v12
    v14          = M_z*x
    v15          = M_xz + v14
    v16          = M_x*z
    v17          = v0*z + v15 + v16
    v18          = M_y*y
    v19          = M_yy + v18
    v21          = M_z*y
    v22          = M_yz + v21
    v23          = M_y*z
    v24          = v2*z + v22 + v23
    v25          = M_z*z
    v26          = M_zz + v25
    v28          = M_xx*x
    v29          = M_xxx + v28
    v30          = 0.166666666666667d0*M_0
    v33          = M_xy*x
    v34          = M_xxy + v33
    v35          = M_xx*y
    v36          = v5*y
    v37          = v34 + v35 + v36
    v38          = M_xz*x
    v39          = M_xxz + v38
    v40          = M_xx*z
    v41          = v5*z
    v42          = v39 + v40 + v41
    v44          = M_yy*x
    v45          = M_xyy + v44
    v46          = M_xy*y
    v47          = v9*y
    v48          = v45 + v46 + v47
    v49          = M_xy*z
    v50          = v9*z
    v51          = v49 + v50
    v52          = M_xz*y
    v1135        = M_xyz + v52
    v53          = M_yz*x
    v54          = v11*z
    v55          = v14*y
    v1079        = v53 + v55
    v57          = M_zz*x
    v58          = M_xzz + v57
    v59          = M_xz*z
    v60          = v14*z
    v61          = v58 + v59 + v60
    v62          = M_yy*y
    v63          = M_yyy + v62
    v65          = M_yz*y
    v66          = M_yyz + v65
    v67          = M_yy*z
    v68          = v18*z
    v69          = v66 + v67 + v68
    v70          = M_zz*y
    v71          = M_yzz + v70
    v72          = M_yz*z
    v73          = v21*z
    v74          = v71 + v72 + v73
    v75          = M_zz*z
    v76          = M_zzz + v75
    v78          = M_xxx*x
    v79          = M_xxxx + v78
    v80          = v1070
    v83          = M_xxy*x
    v84          = M_xxxy + v83
    v85          = M_xxx*y
    v86          = v28*y
    v87          = v85 + v86
    v88          = v84 + v87
    v89          = M_xy + v11
    v90          = M_xxz*x
    v91          = M_xxxz + v90
    v92          = M_xxx*z
    v93          = v28*z
    v94          = v92 + v93
    v95          = v91 + v94
    v96          = M_xz + v16
    v97          = M_xyy*x
    v98          = M_xxyy + v97
    v99          = M_xxy*y
    v100         = v33*y
    v101         = v100 + v98 + v99
    v104         = 0.25d0*M_0
    v106         = M_xxy*z
    v107         = v35*z
    v108         = v106 + v107
    v109         = M_xxz*y
    v1136        = M_xxyz + v109
    v110         = M_xyz*x
    v111         = v33*z
    v1104        = v110 + v111
    v112         = v38*y
    v113         = M_xzz*x
    v114         = M_xxzz + v113
    v115         = M_xxz*z
    v116         = v38*z
    v117         = v114 + v115 + v116
    v121         = M_yyy*x
    v122         = M_xyyy + v121
    v123         = M_xyy*y
    v124         = v44*y
    v125         = v122 + v123 + v124
    v127         = M_xyy*z
    v128         = v44*z
    v129         = v127 + v128
    v130         = M_xyz*y
    v131         = M_yyz*x
    v1138        = M_xyyz + v131
    v132         = v46*z
    v1097        = v130 + v132
    v133         = v53*y
    v134         = M_xyz*z
    v135         = v52*z
    v136         = v134 + v135
    v137         = M_xzz*y
    v1139        = M_xyzz + v137
    v138         = M_yzz*x
    v139         = v53*z
    v140         = v57*y
    v1092        = v138 + v140
    v141         = M_zzz*x
    v142         = M_xzzz + v141
    v143         = M_xzz*z
    v144         = v57*z
    v145         = v142 + v143 + v144
    v147         = M_yyy*y
    v148         = M_yyyy + v147
    v150         = M_yyz*y
    v151         = M_yyyz + v150
    v152         = M_yyy*z
    v153         = v62*z
    v154         = v152 + v153
    v155         = v151 + v154
    v156         = M_yz + v23
    v157         = M_yzz*y
    v158         = M_yyzz + v157
    v159         = M_yyz*z
    v160         = v65*z
    v161         = v158 + v159 + v160
    v165         = M_zzz*y
    v166         = M_yzzz + v165
    v167         = M_yzz*z
    v168         = v70*z
    v169         = v166 + v167 + v168
    v170         = M_zzz*z
    v171         = M_zzzz + v170
    v173         = M_xxxx*x
    v174         = 0.00833333333333333d0*M_0
    v177         = M_xxxx*y
    v178         = M_xxxxy + v177
    v179         = M_xxxy*x
    v180         = v78*y
    v181         = M_xxy + v35
    v182         = M_xxxx*z
    v183         = M_xxxxz + v182
    v184         = M_xxxz*x
    v185         = v78*z
    v186         = M_xxz + v40
    v187         = M_xxyy*x
    v188         = M_xxxyy + v187
    v189         = M_xxxy*y
    v190         = v83*y
    v194         = 0.25d0*M_x
    v195         = M_xxxy*z
    v196         = v85*z
    v197         = v195 + v196
    v198         = M_xxxz*y
    v1140        = M_xxxyz + v198
    v199         = M_xxyz*x
    v200         = v83*z
    v1128        = v199 + v200
    v201         = v90*y
    v202         = v1135
    v203         = v49 + v54
    v204         = v202 + v203
    v205         = M_xxzz*x
    v206         = M_xxxzz + v205
    v207         = M_xxxz*z
    v208         = v90*z
    v211         = M_xyyy*x
    v212         = M_xxyyy + v211
    v213         = M_xxyy*y
    v214         = v97*y
    v219         = M_xxyy*z
    v1077        = M_xxyyz + v219
    v220         = v97*z
    v221         = v1077 + v220
    v222         = M_xxyz*y
    v223         = M_xyyz*x
    v1144        = v221 + v223
    v1133        = v222 + v223
    v224         = v99*z
    v1112        = v222 + v224
    v225         = v110*y
    v226         = v100*z
    v229         = M_xxyz*z
    v230         = v109*z
    v231         = v229 + v230
    v232         = M_xxzz*y
    v1143        = M_xxyzz + v232
    v233         = M_xyzz*x
    v234         = v110*z
    v235         = v113*y
    v1119        = v233 + v235
    v236         = v112*z
    v240         = M_xzzz*x
    v241         = M_xxzzz + v240
    v242         = M_xxzz*z
    v243         = v113*z
    v246         = M_yyyy*x
    v247         = M_xyyyy + v246
    v248         = M_xyyy*y
    v249         = v121*y
    v251         = M_xyyy*z
    v252         = v121*z
    v253         = v251 + v252
    v254         = M_xyyz*y
    v255         = M_yyyz*x
    v1141        = M_xyyyz + v255
    v256         = v123*z
    v1127        = v254 + v256
    v257         = v131*y
    v258         = M_xyz + v53
    v259         = v258 + v51
    v260         = v131*z
    v261         = v133*z + v260
    v262         = M_xyyz*z
    v263         = M_xyzz*y
    v264         = M_yyzz*x
    v265         = v130*z
    v1131        = v262 + v265
    v266         = v138*y
    v1145        = v263 + v266
    v270         = M_xyzz*z
    v271         = v137*z
    v272         = v270 + v271
    v273         = M_xzzz*y
    v1142        = M_xyzzz + v273
    v274         = M_yzzz*x
    v275         = v138*z
    v276         = v141*y
    v1105        = v274 + v276
    v277         = v1079
    v278         = v202 + v277
    v279         = M_zzzz*x
    v280         = M_xzzzz + v279
    v281         = M_xzzz*z
    v282         = v141*z
    v284         = M_yyyy*y
    v286         = M_yyyy*z
    v287         = M_yyyyz + v286
    v288         = M_yyyz*y
    v289         = v147*z
    v290         = M_yyz + v67
    v291         = M_yyzz*y
    v292         = M_yyyzz + v291
    v293         = M_yyyz*z
    v294         = v150*z
    v299         = M_yzzz*y
    v300         = M_yyzzz + v299
    v301         = M_yyzz*z
    v302         = v157*z
    v307         = M_zzzz*y
    v308         = M_yzzzz + v307
    v309         = M_yzzz*z
    v310         = v165*z
    v311         = M_zzzz*z
    v313         = M_xxxxx*x
    v314         = v1084
    v317         = M_xxxxx*y
    v318         = M_xxxxxy + v317
    v319         = M_xxxxy*x
    v320         = v173*y
    v321         = M_xxxy + v85
    v322         = M_xxxxx*z
    v323         = M_xxxxxz + v322
    v324         = M_xxxxz*x
    v325         = v173*z
    v326         = M_xxxz + v92
    v327         = M_xxxxy*y
    v328         = M_xxxxyy + v327
    v329         = M_xxxyy*x
    v330         = v179*y
    v331         = 0.5d0*M_xxxx
    v336         = M_xyy + v46
    v337         = M_xxxxy*z
    v338         = M_xxxxz*y
    v339         = v177*z + M_xxxxyz + v337 + v338
    v340         = M_xxxyz*x
    v341         = v179*z
    v342         = v184*y
    v343         = v1136
    v344         = v108 + v343
    v345         = M_xxxxz*z
    v346         = M_xxxxzz + v345
    v347         = M_xxxzz*x
    v348         = v184*z
    v349         = M_xzz + v59
    v350         = M_xxxyy*y
    v351         = M_xxyyy*x
    v352         = v187*y
    v353         = 0.166666666666667d0*M_xxx
    v354         = 0.5d0*M_xxxy
    v356         = v11 + v9
    v358         = M_xxxyy*z
    v359         = M_xxxyz*y
    v360         = v189*z
    v361         = M_xxxyyz + v358 + v359 + v360
    v362         = M_xxyyz*x
    v363         = v187*z
    v364         = v199*y
    v366         = M_xxxyz*z
    v367         = M_xxxzz*y
    v368         = v198*z
    v369         = M_xxxyzz + v366 + v367 + v368
    v370         = M_xxyzz*x
    v371         = v199*z
    v372         = v205*y
    v374         = M_xxxzz*z
    v375         = M_xxzzz*x
    v376         = v205*z
    v377         = v14 + v16
    v379         = M_xyyyy*x
    v380         = M_xxyyyy + v379
    v381         = M_xxyyy*y
    v382         = v211*y
    v386         = M_xxyyy*z
    v387         = M_xyyyz*x
    v388         = v211*z
    v389         = M_xxyyyz + v386 + v387 + v388
    v390         = M_xxyyz*y
    v391         = v213*z
    v392         = v223*y
    v393         = M_xxyyz*z
    v394         = v222*z
    v1090        = v393 + v394
    v395         = v223*z
    v396         = v225*z
    v1091        = v395 + v396
    v397         = v1090 + v1091
    v398         = M_xxyzz*y
    v1146        = M_xxyyzz + v398
    v399         = M_xyyzz*x
    v400         = v233*y
    v1137        = v399 + v400
    v1132        = v1137
    v412         = M_xxzzz*y
    v413         = M_xyzzz*x
    v414         = v240*y
    v415         = M_xxyzzz + v412 + v413 + v414
    v416         = M_xxyzz*z
    v417         = v232*z
    v418         = v233*z
    v420         = M_xzzzz*x
    v421         = M_xxzzzz + v420
    v422         = M_xxzzz*z
    v423         = v240*z
    v424         = M_yyyyy*x
    v425         = M_xyyyyy + v424
    v426         = M_xyyyy*y
    v427         = v246*y
    v429         = M_xyyyy*z
    v430         = M_yyyyz*x
    v431         = v246*z + M_xyyyyz + v429 + v430
    v432         = M_xyyyz*y
    v433         = v248*z
    v434         = v255*y
    v435         = v1138
    v436         = v129 + v435
    v437         = M_xyyyz*z
    v438         = M_yyyzz*x
    v439         = v255*z
    v440         = M_xyyyzz + v437 + v438 + v439
    v441         = M_xyyzz*y
    v442         = v254*z
    v443         = v264*y
    v445         = M_xyzzz*y
    v446         = M_yyzzz*x
    v447         = v274*y
    v448         = M_xyyzzz + v445 + v446 + v447
    v449         = M_xyyzz*z
    v450         = v263*z
    v451         = v264*z
    v453         = M_xzzzz*y
    v454         = M_yzzzz*x
    v455         = v279*y
    v456         = M_xyzzzz + v453 + v454 + v455
    v457         = M_xyzzz*z
    v458         = v273*z
    v459         = v274*z
    v460         = v1139
    v461         = v1092
    v462         = v460 + v461
    v463         = M_zzzzz*x
    v464         = M_xzzzzz + v463
    v465         = M_xzzzz*z
    v466         = v279*z
    v468         = M_yyyyy*y
    v470         = M_yyyyy*z
    v471         = M_yyyyyz + v470
    v472         = M_yyyyz*y
    v473         = v284*z
    v474         = M_yyyz + v152
    v475         = M_yyyyz*z
    v476         = M_yyyyzz + v475
    v477         = M_yyyzz*y
    v478         = v288*z
    v481         = M_yzz + v72
    v482         = M_yyyzz*z
    v483         = M_yyzzz*y
    v484         = v291*z
    v486         = v21 + v23
    v488         = M_yzzzz*y
    v489         = M_yyzzzz + v488
    v490         = M_yyzzz*z
    v491         = v299*z
    v493         = M_zzzzz*y
    v494         = M_yzzzzz + v493
    v495         = M_yzzzz*z
    v496         = v307*z
    v497         = M_zzzzz*z
    v499         = M_xxxxxx*x
    v500         = 0.000198412698412698d0*M_0
    v503         = M_xxxxxx*y
    v504         = M_xxxxxxy + v503
    v505         = M_xxxxxy*x
    v506         = v313*y
    v507         = M_xxxxxx*z
    v508         = M_xxxxxxz + v507
    v509         = M_xxxxxz*x
    v510         = v313*z
    v511         = M_xxxxxy*y
    v512         = M_xxxxyy*x
    v513         = v319*y
    v514         = 0.5d0*M_xxxxx
    v518         = M_xxyy + v99
    v519         = M_xxxxxy*z
    v520         = M_xxxxxz*y
    v521         = v317*z + M_xxxxxyz + v519 + v520
    v522         = M_xxxxyz*x
    v523         = v319*z
    v524         = v324*y
    v525         = v1140
    v526         = v197 + v525
    v527         = M_xxxxxz*z
    v528         = M_xxxxzz*x
    v529         = v324*z
    v530         = M_xxzz + v115
    v531         = M_xxxxyy*y
    v532         = M_xxxyyy*x
    v533         = v329*y
    v534         = 0.166666666666667d0*M_xxxx
    v535         = 0.5d0*M_xxxxy
    v540         = v33 + v35
    v541         = M_xxxxyy*z
    v542         = M_xxxxyz*y
    v543         = M_xxxyyz*x
    v544         = v327*z
    v545         = v329*z
    v546         = v340*y
    v547         = 0.5d0*M_xxxxz
    v548         = M_xyyz + v127
    v549         = v1097
    v550         = v548 + v549
    v551         = M_xxxxyz*z
    v552         = M_xxxxzz*y
    v553         = M_xxxyzz*x
    v554         = v338*z
    v555         = v340*z
    v556         = v347*y
    v558         = v136 + v460
    v559         = M_xxxxzz*z
    v560         = M_xxxzzz*x
    v561         = v347*z
    v563         = v38 + v40
    v564         = M_xxxyyy*y
    v565         = M_xxyyyy*x
    v566         = v351*y
    v567         = 0.166666666666667d0*M_xxxy
    v573         = v44 + v46
    v574         = M_xxxyyy*z
    v575         = M_xxxyyz*y
    v576         = M_xxyyyz*x
    v577         = v350*z
    v578         = v351*z
    v579         = v362*y
    v580         = 0.166666666666667d0*M_xxxz
    v581         = M_xyz + v49
    v583         = v50 + v52 + v53 + v54
    v584         = M_xxxyyz*z
    v585         = M_xxxyzz*y
    v586         = M_xxyyzz*x
    v587         = v359*z
    v588         = v362*z
    v589         = v370*y
    v599         = M_xxxyzz*z
    v600         = M_xxxzzz*y
    v601         = M_xxyzzz*x
    v602         = v367*z
    v603         = v370*z
    v604         = v375*y
    v606         = v203 + v277
    v607         = M_xxxzzz*z
    v608         = M_xxzzzz*x
    v609         = v375*z
    v611         = v57 + v59
    v612         = M_xxyyyy*y
    v613         = M_xyyyyy*x
    v614         = v379*y
    v618         = M_xxyyyy*z
    v619         = M_xxyyyz*y
    v620         = M_xyyyyz*x
    v621         = v381*z
    v622         = v379*z
    v623         = v387*y
    v625         = M_xxyz + v106
    v626         = v1104
    v627         = v625 + v626
    v628         = M_xxyyyz*z
    v629         = M_xxyyzz*y
    v630         = M_xyyyzz*x
    v631         = v390*z
    v632         = v387*z
    v633         = v399*y
    v641         = M_xxyyzz*z
    v642         = M_xxyzzz*y
    v643         = M_xyyzzz*x
    v644         = v398*z
    v645         = v399*z
    v646         = v413*y
    v655         = M_xxyzzz*z
    v656         = M_xxzzzz*y
    v657         = M_xyzzzz*x
    v658         = v412*z
    v659         = v413*z
    v660         = v420*y
    v662         = v110 + v112
    v663         = v343 + v662
    v664         = M_xxzzzz*z
    v665         = M_xzzzzz*x
    v666         = v420*z
    v667         = M_yyyyyy*x
    v668         = M_xyyyyyy + v667
    v669         = M_xyyyyy*y
    v670         = v424*y
    v672         = M_xyyyyy*z
    v673         = M_yyyyyz*x
    v674         = v424*z + M_xyyyyyz + v672 + v673
    v675         = M_xyyyyz*y
    v676         = v426*z
    v677         = v430*y
    v678         = v1141
    v679         = v253 + v678
    v680         = M_xyyyyz*z
    v681         = M_xyyyzz*y
    v682         = M_yyyyzz*x
    v683         = v432*z
    v684         = v430*z
    v685         = v438*y
    v687         = M_xyzz + v138
    v688         = v134 + v139
    v689         = v687 + v688
    v690         = M_xyyyzz*z
    v691         = M_xyyzzz*y
    v692         = M_yyyzzz*x
    v693         = v441*z
    v694         = v438*z
    v695         = v446*y
    v697         = v49 + v52
    v698         = v50 + v55
    v699         = v697 + v698
    v700         = M_xyyzzz*z
    v701         = M_xyzzzz*y
    v702         = M_yyzzzz*x
    v703         = v445*z
    v704         = v446*z
    v705         = v454*y
    v707         = v130 + v133
    v708         = v435 + v707
    v709         = M_xzzzzz*y
    v710         = M_yzzzzz*x
    v711         = v463*y
    v712         = M_xyzzzzz + v709 + v710 + v711
    v713         = M_xyzzzz*z
    v714         = v453*z
    v715         = v454*z
    v716         = v1142
    v717         = v1105
    v718         = v716 + v717
    v719         = M_zzzzzz*x
    v720         = M_xzzzzzz + v719
    v721         = M_xzzzzz*z
    v722         = v463*z
    v724         = M_yyyyyy*y
    v726         = M_yyyyyy*z
    v727         = M_yyyyyyz + v726
    v728         = M_yyyyyz*y
    v729         = v468*z
    v730         = M_yyyyyz*z
    v731         = M_yyyyzz*y
    v732         = v472*z
    v736         = M_yyzz + v159
    v737         = M_yyyyzz*z
    v738         = M_yyyzzz*y
    v739         = v477*z
    v741         = v65 + v67
    v742         = M_yyyzzz*z
    v743         = M_yyzzzz*y
    v744         = v483*z
    v748         = v70 + v72
    v749         = M_yyzzzz*z
    v750         = M_yzzzzz*y
    v751         = v488*z
    v753         = M_zzzzzz*y
    v754         = M_yzzzzzz + v753
    v755         = M_yzzzzz*z
    v756         = v493*z
    v757         = M_zzzzzz*z
    v759         = M_xxxxxxx*x
    v760         = 2.48015873015873d-5*M_0
    v763         = M_xxxxxxx*y
    v764         = M_xxxxxxy*x
    v765         = v499*y
    v766         = M_xxxxxxz*x
    v767         = M_xxxxxxy*y
    v768         = M_xxxxxyy*x
    v769         = v505*y
    v770         = 0.5d0*M_xxxxxx
    v774         = 0.25d0*M_xxxx
    v775         = M_xxxyy + v189
    v776         = M_xxxxxxz*y
    v777         = M_xxxxxyz*x
    v778         = v509*y
    v779         = M_xxxxxzz*x
    v780         = M_xxxzz + v207
    v781         = M_xxxxxyy*y
    v782         = M_xxxxyyy*x
    v783         = v512*y
    v784         = 0.166666666666667d0*M_xxxxx
    v785         = 0.5d0*M_xxxxxy
    v789         = 0.25d0*M_xxxy
    v791         = M_xyyy + v123
    v792         = M_xxxxxyz*y
    v793         = M_xxxxyyz*x
    v794         = v522*y
    v795         = 0.5d0*M_xxxxxz
    v796         = v1077
    v797         = v1112 + v796
    v798         = M_xxxxxzz*y
    v799         = M_xxxxyzz*x
    v800         = v528*y
    v802         = v1143
    v803         = v231 + v802
    v804         = M_xxxxzzz*x
    v805         = M_xzzz + v143
    v806         = M_xxxxyyy*y
    v807         = M_xxxyyyy*x
    v808         = v532*y
    v809         = 0.0416666666666667d0*M_xxxx
    v810         = 0.166666666666667d0*M_xxxxy
    v811         = 0.5d0*M_xxxxyy
    v815         = M_xxxxyyz*y
    v816         = M_xxxyyyz*x
    v817         = v543*y
    v818         = 0.5d0*M_xxxxyz
    v819         = 0.166666666666667d0*M_xxxxz
    v821         = M_xxxxyzz*y
    v822         = M_xxxyyzz*x
    v823         = v553*y
    v824         = 0.5d0*M_xxxxzz
    v831         = M_xxxxzzz*y
    v832         = M_xxxyzzz*x
    v833         = v560*y
    v835         = M_xxxzzzz*x
    v838         = M_xxxyyyy*y
    v839         = M_xxyyyyy*x
    v840         = v565*y
    v841         = 0.166666666666667d0*M_xxxyy
    v846         = M_xxxyyyz*y
    v847         = M_xxyyyyz*x
    v848         = v576*y
    v849         = 0.166666666666667d0*M_xxxyz
    v851         = M_xxxyyzz*y
    v852         = M_xxyyyzz*x
    v853         = v586*y
    v854         = 0.166666666666667d0*M_xxxzz
    v861         = M_xxxyzzz*y
    v862         = M_xxyyzzz*x
    v863         = v601*y
    v869         = M_xxxzzzz*y
    v870         = M_xxyzzzz*x
    v871         = v608*y
    v873         = M_xxzzzzz*x
    v874         = M_xxyyyyy*y
    v875         = M_xyyyyyy*x
    v876         = v613*y
    v878         = M_xxyyyyz*y
    v879         = M_xyyyyyz*x
    v880         = v620*y
    v882         = v1144
    v883         = M_xxyyyzz*y
    v884         = M_xyyyyzz*x
    v885         = v630*y
    v892         = M_xxyyzzz*y
    v893         = M_xyyyzzz*x
    v894         = v643*y
    v898         = M_xxyzzzz*y
    v899         = M_xyyzzzz*x
    v900         = v657*y
    v908         = v220 + v224
    v910         = M_xxzzzzz*y
    v911         = M_xyzzzzz*x
    v912         = v665*y
    v914         = v1119
    v915         = v802 + v914
    v916         = M_xzzzzzz*x
    v917         = M_xyyyyyy*y
    v918         = M_yyyyyyy*x
    v919         = v667*y
    v921         = M_xyyyyyz*y
    v922         = M_yyyyyyz*x
    v923         = v673*y
    v924         = M_xyyyyzz*y
    v925         = M_yyyyyzz*x
    v926         = v682*y
    v928         = M_xyyzz + v264
    v929         = v260 + v262
    v930         = v928 + v929
    v931         = M_xyyyzzz*y
    v932         = M_yyyyzzz*x
    v933         = v692*y
    v935         = M_xyyzzzz*y
    v936         = M_yyyzzzz*x
    v937         = v702*y
    v939         = M_xyzzzzz*y
    v940         = M_yyzzzzz*x
    v941         = v710*y
    v943         = v1145
    v944         = v928 + v943
    v945         = M_xzzzzzz*y
    v946         = M_yzzzzzz*x
    v947         = v719*y
    v948         = M_zzzzzzz*x
    v950         = M_yyyyyyy*y
    v952         = M_yyyyyyz*y
    v953         = M_yyyyyzz*y
    v956         = M_yyyzz + v293
    v957         = M_yyyyzzz*y
    v959         = M_yzzz + v167
    v960         = M_yyyzzzz*y
    v964         = M_yyzzzzz*y
    v966         = M_yzzzzzz*y
    v968         = M_zzzzzzz*y
    v970         = 2.75573192239859d-6*M_0
    v972         = 0.5d0*M_xxxxxxx
    v977         = 0.25d0*M_xxxxx
    v978         = 0.166666666666667d0*M_xxxxxx
    v979         = 0.5d0*M_xxxxxxy
    v982         = 0.25d0*M_xxxxy
    v985         = 0.5d0*M_xxxxxxz
    v987         = 0.25d0*M_xxxxz
    v988         = 0.0416666666666667d0*M_xxxxx
    v989         = 0.166666666666667d0*M_xxxxxy
    v990         = 0.5d0*M_xxxxxyy
    v993         = 0.00138888888888889d0*M_y
    v996         = 0.5d0*M_xxxxxyz
    v997         = 0.166666666666667d0*M_xxxxxz
    v998         = M_xxxyz + v195
    v999         = 0.00138888888888889d0*M_z
    v1000        = M_xyyyz + v251
    v1001        = v1127
    v1002        = v1128
    v1003        = 0.5d0*M_xxxxxzz
    v1007        = v1146
    v1009        = v199 + v201
    v1011        = 0.0416666666666667d0*M_xxxxy
    v1012        = 0.166666666666667d0*M_xxxxyy
    v1013        = 0.5d0*M_xxxxyyy
    v1019        = 0.5d0*M_xxxxyyz
    v1020        = 0.166666666666667d0*M_xxxxyz
    v1021        = 0.0416666666666667d0*M_xxxxz
    v1022        = 0.5d0*M_xxxxyzz
    v1023        = 0.166666666666667d0*M_xxxxzz
    v1030        = 0.5d0*M_xxxxzzz
    v1037        = 0.166666666666667d0*M_xxxyyy
    v1041        = 0.166666666666667d0*M_xxxyyz
    v1043        = 0.166666666666667d0*M_xxxyzz
    v1049        = 0.166666666666667d0*M_xxxzzz
    v1061        = 0.00138888888888889d0*(M_x + v1067)
    v1062        = M_xyzzz + v274
    v1063        = v270 + v275
    v1064        = v254 + v257
    Ms_0         = Ms_0 + (M_0)
    Ms_x         = Ms_x + (v1)
    Ms_y         = Ms_y + (v3)
    Ms_z         = Ms_z + (v4)
    Ms_xy        = Ms_xy + (v13)
    Ms_xz        = Ms_xz + (v17)
    Ms_yz        = Ms_yz + (v24)
    Ms_xyz       = Ms_xyz + (v12*z + v1079 + v1135 + v51 + v54)
    c1           = z
    b1           = y
    a1           = x
    a2           = a1*a1
    v8           = a2
    v1075        = M_0*v8
    v1102        = 0.125d0*v8
    v32          = 0.5d0*v8
    v103         = M_yy*v8
    v119         = M_zz*v8
    v192         = M_xyy*v8
    v210         = M_xzz*v8
    v216         = M_yyy*v8
    v217         = 0.0833333333333333d0*v1075
    v228         = M_yyz*v8
    v238         = M_yzz*v8
    v245         = M_zzz*v8
    v335         = 0.25d0*v8
    v383         = 0.0208333333333333d0*v1075
    v403         = M_yyzz*v8
    v409         = v18*v8
    v410         = v25*v8
    v570         = M_x*v8
    v593         = v46*v8
    v594         = v59*v8
    v595         = v1102
    v615         = 0.00416666666666667d0*v1075
    v616         = M_y*v8
    v635         = M_yyyzz*v8
    v637         = v62*v8
    v638         = v72*v8
    v648         = M_yyzzz*v8
    v650         = v65*v8
    v651         = v75*v8
    v652         = M_z*v8
    v844         = M_xy*v8
    v868         = M_xz*v8
    v877         = 0.000694444444444444d0*v1075
    v887         = v159*v8
    v902         = v157*v8
    v1016        = M_xx*v8
    v1027        = 0.0416666666666667d0*v8
    v1028        = v293*v8
    v1029        = v291*v8
    v1033        = v301*v8
    v1034        = v299*v8
    v1050        = 0.0138888888888889d0*v8
    v1056        = v1124*v8
    Ms_xx        = Ms_xx + (v6 + v7*v8)
    Ms_xxy       = Ms_xxy + (v3*v32 + v37)
    Ms_xxz       = Ms_xxz + (v32*v4 + v42)
    Ms_xxyz      = Ms_xxyz + (v24*v32 + v36*z + v108 + v1104 + v112 + v1136)
    a3           = a1*a2
    v31          = a3
    v1074        = 0.0833333333333333d0*v31
    v1087        = M_x*v31
    v1088        = 0.0277777777777778d0*v31
    v1098        = M_0*v31
    v1101        = M_y*v31
    v1103        = M_z*v31
    v1114        = 0.00694444444444444d0*v31
    v1129        = 0.00138888888888889d0*v31
    v82          = 0.166666666666667d0*v31
    v193         = M_0*v1074
    v334         = v1087
    v355         = M_0*v1088
    v517         = v1074
    v537         = v1088
    v568         = 0.00694444444444444d0*v1098
    v572         = v1101
    v610         = v1103
    v830         = 0.0416666666666667d0*v31
    v842         = v1084*v31
    v976         = M_xxxx*v31
    v1015        = M_x*v1129
    v1038        = 0.000231481481481481d0*v1098
    v1042        = v1129
    Ms_xxx       = Ms_xxx + (v29 + M_x*v32 + v30*v31)
    Ms_xxxy      = Ms_xxxy + (v88 + v3*v82 + v32*v89)
    Ms_xxxz      = Ms_xxxz + (v95 + v32*v96 + v4*v82)
    Ms_xxxyz     = Ms_xxxyz + (v204*v32 + v24*v82 + v86*z + v1128 + v1140 + v197 + v201)
    a4           = a2*a2
    v81          = a4
    v1085        = 0.0208333333333333d0*v81
    v1096        = 0.00694444444444444d0*v81
    v1113        = M_0*v81
    v176         = 0.0416666666666667d0*v81
    v332         = M_0*v1085
    v516         = M_x*v81
    v536         = M_0*v1096
    v773         = v1085
    v787         = v1096
    v812         = 0.00173611111111111d0*v1113
    v1014        = v1126*v81
    v1017        = M_y*v81
    v1025        = 0.00347222222222222d0*v1113
    Ms_xxxx      = Ms_xxxx + (v79 + M_x*v82 + M_xx*v32 + v80*v81)
    Ms_xxxxy     = Ms_xxxxy + (v178 + v179 + v180 + v176*v3 + v181*v32 + v82*v89)
    Ms_xxxxz     = Ms_xxxxz + (v183 + v184 + v185 + v176*v4 + v186*v32 + v82*v96)
    Ms_xxxxyz    = Ms_xxxxyz + (v339 + v340 + v341 + v342 + v176*v24 + v180*z + v204*v82 + v32*v344)
    a5           = a2*a3
    v175         = a5
    v1095        = 0.00416666666666667d0*v175
    v316         = 0.00833333333333333d0*v175
    v515         = M_0*v1095
    v772         = M_x*v175
    v786         = v1084*v175
    v975         = v1095
    v984         = 0.00138888888888889d0*v175
    v991         = v1126*v175
    Ms_xxxxx     = Ms_xxxxx + (M_xxxxx + v173 + M_x*v176 + M_xx*v82 + M_xxx*v32 + v174*v175)
    Ms_xxxxxy    = Ms_xxxxxy + (v318 + v319 + v320 + v176*v89 + v181*v82 + v3*v316 + v32*v321)
    Ms_xxxxxz    = Ms_xxxxxz + (v323 + v324 + v325 + v176*v96 + v186*v82 + v316*v4 + v32*v326)
    Ms_xxxxxyz   = Ms_xxxxxyz + (v521 + v522 + v523 + v524 + v176*v204 + v24*v316 + v32*v526 + v320*z + &
      v344*v82)
    a6           = a3*a3
    v315         = a6
    v1111        = M_0*v315
    v502         = 0.00138888888888889d0*v315
    v771         = 0.000694444444444444d0*v1111
    v974         = M_x*v315
    v980         = 0.000231481481481481d0*v1111
    Ms_xxxxxx    = Ms_xxxxxx + (M_xxxxxx + v313 + M_x*v316 + M_xx*v176 + M_xxx*v82 + M_xxxx*v32 + v314* &
      v315)
    Ms_xxxxxxy   = Ms_xxxxxxy + (v504 + v505 + v506 + v176*v181 + v178*v32 + v3*v502 + v316*v89 + v321* &
      v82)
    Ms_xxxxxxz   = Ms_xxxxxxz + (v508 + v509 + v510 + v176*v186 + v183*v32 + v316*v96 + v326*v82 + v4* &
      v502)
    Ms_xxxxxxyz  = Ms_xxxxxxyz + (M_xxxxxxyz + v776 + v777 + v778 + M_xxxxxxy*z + v176*v344 + v204*v316 + &
      v24*v502 + v32*v339 + v503*z + v505*z + v506*z + v526*v82)
    a7           = a3*a4
    v501         = a7
    v762         = 0.000198412698412698d0*v501
    v973         = v1124*v501
    Ms_xxxxxxx   = Ms_xxxxxxx + (M_xxxxxxx + v499 + M_x*v502 + M_xx*v316 + M_xxx*v176 + M_xxxx*v82 + &
      M_xxxxx*v32 + v500*v501)
    Ms_xxxxxxxy  = Ms_xxxxxxxy + (M_xxxxxxxy + v763 + v764 + v765 + v176*v321 + v178*v82 + v181*v316 + v3* &
      v762 + v318*v32 + v502*v89)
    Ms_xxxxxxxz  = Ms_xxxxxxxz + (M_xxxxxxxz + v766 + M_xxxxxxx*z + v176*v326 + v183*v82 + v186*v316 + v32 &
      *v323 + v4*v762 + v499*z + v502*v96)
    Ms_xxxxxxxyz = Ms_xxxxxxxyz + (M_xxxxxxxyz + M_xxxxxxxy*z + M_xxxxxxxz*y + M_xxxxxxyz*x + v176*v526 + &
      v204*v502 + v24*v762 + v316*v344 + v32*v521 + v339*v82 + v763*z + &
      v764*z + v765*z + v766*y)
    a8           = a4*a4
    v761         = a8
    v971         = 2.48015873015873d-5*v761
    Ms_xxxxxxxx  = Ms_xxxxxxxx + (M_xxxxxxxx + v759 + M_x*v762 + M_xx*v502 + M_xxx*v316 + M_xxxx*v176 + &
      M_xxxxx*v82 + M_xxxxxx*v32 + v760*v761)
    Ms_xxxxxxxxy = Ms_xxxxxxxxy + (M_xxxxxxxxy + M_xxxxxxxx*y + M_xxxxxxxy*x + v176*v178 + v181*v502 + v3* &
      v971 + v316*v321 + v318*v82 + v32*v504 + v759*y + v762*v89)
    Ms_xxxxxxxxz = Ms_xxxxxxxxz + (M_xxxxxxxxz + M_xxxxxxxx*z + M_xxxxxxxz*x + v176*v183 + v186*v502 + v316 &
      *v326 + v32*v508 + v323*v82 + v4*v971 + v759*z + v762*v96)
    a9           = a4*a5
    Ms_xxxxxxxxx = Ms_xxxxxxxxx + (M_xxxxxxxxx + M_x*v971 + M_xx*v762 + M_xxx*v502 + M_xxxx*v316 + M_xxxxx* &
      v176 + M_xxxxxx*v82 + M_xxxxxxx*v32 + M_xxxxxxxx*x + a9*v970)
    b2           = b1*b1
    v20          = b2
    v1071        = v20*v8
    v1076        = 0.25d0*v20
    v1083        = M_0*v20
    v1086        = 0.0833333333333333d0*v20
    v1117        = 0.0416666666666667d0*v20
    v1125        = 0.000694444444444444d0*v20
    v43          = 0.5d0*v20
    v102         = M_xx*v20
    v105         = v1071
    v163         = M_zz*v20
    v191         = M_xxx*v20
    v215         = M_xxy*v20
    v218         = v1076*v8
    v227         = M_xxz*v20
    v268         = M_xzz*v20
    v296         = M_yzz*v20
    v304         = M_zzz*v20
    v306         = v1083
    v333         = v1086
    v357         = v1086*v8
    v365         = v1086*v31
    v385         = v1076
    v402         = M_xxzz*v20
    v406         = v119*v20
    v408         = v20*v5
    v539         = v1085*v20
    v591         = M_xxxzz*v20
    v592         = v20*v28
    v636         = v20*v33
    v647         = M_xxzzz*v20
    v649         = v20*v38
    v653         = v102 + v103
    v654         = v408 + v409 + v653
    v746         = M_y*v20
    v790         = v1095*v20
    v814         = 0.0208333333333333d0*v1071
    v826         = v115*v20
    v857         = v20*v72
    v865         = v20*v75
    v867         = v1083*v31
    v901         = v113*v20
    v904         = v1083*v8
    v905         = v227 + v228
    v906         = v649 + v650 + v905
    v909         = M_z*v105
    v983         = v1125*v315
    v995         = v191 + v192
    v1005        = v20*v207
    v1018        = v215 + v216
    v1031        = v20*v242
    v1047        = v1117
    v1048        = v20*v205
    v1058        = v20*v240
    Ms_yy        = Ms_yy + (v19 + v20*v7)
    Ms_xyy       = Ms_xyy + (v1*v43 + v48)
    Ms_yyz       = Ms_yyz + (v4*v43 + v69)
    Ms_xxyy      = Ms_xxyy + (0.5d0*(v102 + v103) + v101 + v104*v105 + v18*v32 + v43*v5)
    Ms_xyyz      = Ms_xyyz + (v17*v43 + v47*z + v1097 + v1138 + v129 + v133)
    Ms_xxxyy     = Ms_xxxyy + (0.5d0*(v191 + v192) + v105*v194 + v188 + v189 + v19*v82 + v190 + v193* &
      v20 + v28*v43 + v32*v46)
    Ms_xxyyz     = Ms_xxyyz + (0.5d0*(v227 + v228) + v1112 + v1144 + v218*v4 + v225 + v226 + v32*v65 + &
      v32*v67 + v32*v68 + v38*v43 + v40*v43 + v41*v43)
    Ms_xxxxyy    = Ms_xxxxyy + (v328 + v329 + v330 + M_xxyy*v32 + v102*v335 + v176*v19 + v20*v331 + v20* &
      v332 + v32*v99 + v333*v334 + v336*v82 + v43*v78)
    Ms_xxxyyz    = Ms_xxxyyz + (v361 + v362 + v363 + v364 + M_xxxz*v43 + M_xyyz*v32 + v127*v32 + v130* &
      v32 + v132*v32 + v190*z + v218*v96 + v365*v4 + v43*v90 + v43*v92 &
      + v43*v93 + v69*v82)
    Ms_xxxxxyy   = Ms_xxxxxyy + (0.0208333333333333d0*(v20*v516) + M_xxxxxyy + M_xxxyy*v32 + v102*v517 + &
      v173*v43 + v176*v336 + v189*v32 + v19*v316 + v191*v335 + v20*v514 &
      + v20*v515 + v511 + v512 + v513 + v518*v82)
    Ms_xxxxyyz   = Ms_xxxxyyz + (M_xxxxyyz + v541 + v542 + v543 + v544 + v545 + v546 + M_xxyyz*v32 + v176 &
      *v69 + v182*v43 + v184*v43 + v185*v43 + v186*v218 + v20*v547 + &
      v219*v32 + v222*v32 + v224*v32 + v330*z + v365*v96 + v4*v539 + &
      v550*v82)
    Ms_xxxxxxyy  = Ms_xxxxxxyy + (0.00416666666666667d0*(v20*v772) + M_xxxxxxyy + M_xxxxyy*v32 + v102*v773 &
      + v105*v774 + v176*v518 + v19*v502 + v191*v517 + v20*v770 + v20* &
      v771 + v313*v43 + v316*v336 + v32*v327 + v767 + v768 + v769 + &
      v775*v82)
    Ms_xxxxxyyz  = Ms_xxxxxyyz + (M_xxxxxyyz + v792 + v793 + v794 + M_xxxxxyy*z + M_xxxyyz*v32 + v176*v550 &
      + v186*v365 + v20*v795 + v218*v326 + v316*v69 + v32*v358 + v32* &
      v359 + v32*v360 + v322*v43 + v324*v43 + v325*v43 + v4*v790 + v511 &
      *z + v512*z + v513*z + v539*v96 + v797*v82)
    Ms_xxxxxxxyy = Ms_xxxxxxxyy + (M_xxxxxxxyy + M_xxxxxxxy*y + M_xxxxxxyy*x + M_xxxxxyy*v32 + v102*v975 + &
      v105*v977 + v1125*v974 + v176*v775 + v19*v762 + v191*v773 + v20* &
      v972 + v20*v973 + v316*v518 + v32*v511 + v328*v82 + v333*v976 + &
      v336*v502 + v43*v499 + v764*y)
    Ms_xxxxxxyyz = Ms_xxxxxxyyz + (M_xxxxxxyyz + M_xxxxxxyy*z + M_xxxxxxyz*y + M_xxxxxyyz*x + M_xxxxyyz*v32 &
      + v176*v797 + v183*v218 + v186*v539 + v20*v985 + v316*v550 + v32* &
      v541 + v32*v542 + v32*v544 + v326*v365 + v361*v82 + v4*v983 + v43 &
      *v507 + v43*v509 + v43*v510 + v502*v69 + v767*z + v768*z + v769*z &
      + v777*y + v790*v96)
    b3           = b1*b2
    v64          = b3
    v1081        = M_0*v64
    v1089        = 0.0833333333333333d0*v64
    v1100        = 0.0277777777777778d0*v64
    v1109        = M_z*v64
    v126         = 0.166666666666667d0*v64
    v298         = v1081
    v384         = v1089*v8
    v538         = M_x*v64
    v571         = v1100
    v582         = v1088*v64
    v617         = v1089
    v747         = v1109
    v788         = M_xx*v64
    v813         = v1114*v64
    v820         = v1096*v64
    v859         = v1081*v31
    v890         = 0.0416666666666667d0*v64
    v896         = v1081*v8
    v981         = M_xxx*v64
    v994         = v175*v64
    Ms_yyy       = Ms_yyy + (v63 + M_y*v43 + v30*v64)
    Ms_xyyy      = Ms_xyyy + (v125 + v1*v126 + v10*v43)
    Ms_yyyz      = Ms_yyyz + (v155 + v126*v4 + v156*v43)
    Ms_xxyyy     = Ms_xxyyy + (0.5d0*(v215 + v216) + M_y*v218 + v126*v6 + v212 + v213 + v214 + v217*v64 &
      + v32*v62 + v33*v43)
    Ms_xyyyz     = Ms_xyyyz + (v124*z + v126*v17 + v259*v43 + v1127 + v1141 + v253 + v257)
    Ms_xxxyyy    = Ms_xxxyyy + (M_xxxyyy + v350 + v351 + v352 + M_xy*v218 + M_xyyy*v32 + M_yyy*v82 + &
      v123*v32 + v126*v28 + v20*v354 + v353*v64 + v355*v64 + v356*v357 &
      + v43*v83 + v62*v82)
    Ms_xxyyyz    = Ms_xxyyyz + (v389 + v390 + v391 + v392 + M_xxyz*v43 + M_yyyz*v32 + v106*v43 + v110* &
      v43 + v111*v43 + v126*v42 + v150*v32 + v152*v32 + v153*v32 + v156 &
      *v218 + v214*z + v384*v4)
    Ms_xxxxyyy   = Ms_xxxxyyy + (M_xxxxyyy + v531 + v532 + v533 + M_xxyyy*v32 + M_xyyy*v82 + M_y*v539 + &
      v123*v82 + v126*v78 + v176*v63 + v179*v43 + v20*v535 + v213*v32 + &
      v215*v335 + v357*v540 + v534*v64 + v536*v64 + v537*v538)
    Ms_xxxyyyz   = Ms_xxxyyyz + (M_xxxyyyz + v574 + v575 + v576 + v577 + v578 + v579 + M_xxxyz*v43 + &
      M_xyyyz*v32 + M_yyyz*v82 + v126*v90 + v126*v92 + v126*v93 + v150* &
      v82 + v152*v82 + v153*v82 + v195*v43 + v199*v43 + v200*v43 + v218 &
      *v581 + v251*v32 + v254*v32 + v256*v32 + v352*z + v357*v583 + v4* &
      v582 + v580*v64)
    Ms_xxxxxyyy  = Ms_xxxxxyyy + (M_xxxxxyyy + v781 + v782 + v783 + M_xxxyyy*v32 + M_xxyyy*v82 + M_xy*v539 &
      + M_y*v790 + v105*v789 + v126*v173 + v176*v791 + v20*v785 + v213* &
      v82 + v316*v63 + v319*v43 + v32*v350 + v357*(v83 + v85) + v537* &
      v788 + v538*v787 + v64*v784 + v64*v786)
    Ms_xxxxyyyz  = Ms_xxxxyyyz + (M_xxxxyyyz + v815 + v816 + v817 + M_xxxxyyy*z + M_xxyyyz*v32 + M_xyyyz* &
      v82 + v126*v182 + v126*v184 + v126*v185 + v155*v176 + v156*v539 + &
      v20*v818 + v218*v625 + v251*v82 + v254*v82 + v256*v82 + v32*v386 &
      + v32*v390 + v32*v391 + v337*v43 + v340*v43 + v341*v43 + v357*( &
      v107 + v109 + v626) + v4*v820 + v531*z + v532*z + v533*z + v582* &
      v96 + v64*v819)
    Ms_xxxxxxyyy = Ms_xxxxxxyyy + (M_xxxxxxyyy + M_xxxxxxyy*y + M_xxxxxyyy*x + M_xxxxyyy*v32 + M_xxxyyy*v82 &
      + M_xy*v790 + M_y*v983 + v105*v982 + v126*v313 + v176*(M_xxyyy + &
      v213) + v20*v979 + v215*v773 + v316*v791 + v32*v531 + v350*v82 + &
      v357*(v177 + v179) + v43*v505 + v537*v981 + v64*v978 + v64*v980 + &
      v768*y + v787*v788 + v984*(v121 + v124 + v538))
    Ms_xxxxxyyyz = Ms_xxxxxyyyz + (0.00138888888888889d0*(v994*(v1069 + 720.0d0*v999)) + M_xxxxxyyy*z + &
      M_xxxxxyyyz + M_xxxxxyyz*y + M_xxxxyyyz*x + M_xxxyyyz*v32 + &
      M_xxyyyz*v82 + v126*v322 + v126*v324 + v126*v325 + v155*v316 + &
      v156*v790 + v176*(v1000 + v1001) + v186*v582 + v20*v996 + v218* &
      v998 + v32*v574 + v32*v575 + v32*v577 + v357*(v1002 + v196 + v198 &
      ) + v386*v82 + v390*v82 + v391*v82 + v43*v519 + v43*v522 + v43* &
      v523 + v539*v581 + v64*v997 + v781*z + v782*z + v783*z + v793*y + &
      v820*v96)
    b4           = b2*b2
    v149         = b4
    v1099        = 0.0208333333333333d0*v149
    v1116        = 0.00694444444444444d0*v149
    v1130        = 0.0104166666666667d0*v149
    v250         = 0.0416666666666667d0*v149
    v480         = M_0*v149
    v569         = v1099
    v624         = v1099*v8
    v735         = M_y*v149
    v845         = v1116
    v850         = v1116*v31
    v992         = 0.00173611111111111d0*v149
    v1045        = 0.00347222222222222d0*v149
    Ms_yyyy      = Ms_yyyy + (v148 + M_y*v126 + M_yy*v43 + v149*v80)
    Ms_xyyyy     = Ms_xyyyy + (v247 + v248 + v249 + v1*v250 + v10*v126 + v43*v45)
    Ms_yyyyz     = Ms_yyyyz + (v287 + v288 + v289 + v126*v156 + v250*v4 + v290*v43)
    Ms_xxyyyy    = Ms_xxyyyy + (v380 + v381 + v382 + M_xxyy*v43 + M_y*v384 + M_yyyy*v32 + v103*v385 + &
      v126*v34 + v147*v32 + v149*v383 + v250*v6 + v43*v97)
    Ms_xyyyyz    = Ms_xyyyyz + (v431 + v432 + v433 + v434 + v126*v259 + v17*v250 + v249*z + v43*v436)
    Ms_xxxyyyy   = Ms_xxxyyyy + (M_xxxyyyy + v564 + v565 + v566 + M_xxxyy*v43 + M_xyyyy*v32 + M_yyyy*v82 &
      + v126*v83 + v147*v82 + v149*v568 + v187*v43 + v192*v385 + v248* &
      v32 + v250*v29 + v357*v573 + v567*v64 + v569*v570 + v571*v572)
    Ms_xxyyyyz   = Ms_xxyyyyz + (M_xxyyyyz + v618 + v619 + v620 + v621 + v622 + v623 + M_xxyyz*v43 + &
      M_yyyyz*v32 + v126*v627 + v156*v384 + v218*v290 + v219*v43 + v220 &
      *v43 + v223*v43 + v250*v42 + v286*v32 + v288*v32 + v289*v32 + &
      v382*z + v4*v624)
    Ms_xxxxyyyy  = Ms_xxxxyyyy + (M_xxxxyyyy + v806 + v807 + v808 + M_xxyy*v218 + M_xxyyyy*v32 + M_xy*v582 &
      + M_xyyyy*v82 + M_yyyy*v176 + v126*v179 + v147*v176 + v149*v809 + &
      v149*v812 + v20*v811 + v248*v82 + v250*v78 + v32*v381 + v329*v43 &
      + v356*v813 + v357*(v97 + v99) + v64*v810 + v653*v814)
    Ms_xxxyyyyz  = Ms_xxxyyyyz + (M_xxxyyyyz + v846 + v847 + v848 + M_xxxyyyy*z + M_xxxyyz*v43 + M_xyyyyz* &
      v32 + M_yyyyz*v82 + v126*v195 + v126*v199 + v126*v200 + v156*v582 &
      + v218*v548 + v250*v95 + v286*v82 + v288*v82 + v289*v82 + v32* &
      v429 + v32*v432 + v32*v433 + v357*(v128 + v131 + v549) + v358*v43 &
      + v362*v43 + v363*v43 + v4*v850 + v564*z + v565*z + v566*z + v624 &
      *v96 + v64*v849)
    Ms_xxxxxyyyy = Ms_xxxxxyyyy + (M_xxxxxyyyy + M_xxxxxyyy*y + M_xxxxyyyy*x + M_xxxyy*v218 + M_xxxyyyy*v32 &
      + M_xxy*v582 + M_xxyyyy*v82 + M_xyyyy*v176 + M_yy*v790 + v126* &
      v319 + v148*v316 + v149*v988 + v149*v991 + v173*v250 + v176*v248 &
      + v20*v990 + v32*v564 + v357*(v187 + v189) + v381*v82 + v43*v512 &
      + v516*v992 + v540*v813 + v64*v989 + v782*y + v814*v995 + v993* &
      v994)
    Ms_xxxxyyyyz = Ms_xxxxyyyyz + (M_xxxxyyyyz + M_xxxxyyyy*z + M_xxxxyyyz*y + M_xxxyyyyz*x + M_xxyyyyz*v32 &
      + M_xyyyyz*v82 + M_yyyyz*v176 + v1019*v20 + v1020*v64 + v1021* &
      v149 + v126*v337 + v126*v340 + v126*v341 + v176*v286 + v176*v288 &
      + v176*v289 + v182*v250 + v184*v250 + v185*v250 + v218*v796 + v32 &
      *v618 + v32*v619 + v32*v621 + v357*(v1133 + v908) + v4*v81*v992 + &
      v429*v82 + v43*v541 + v43*v543 + v43*v545 + v432*v82 + v433*v82 + &
      v581*v582 + v583*v813 + v806*z + v807*z + v808*z + v814*(v20*v40 &
      + v67*v8 + v905) + v816*y)
    b5           = b2*b3
    v285         = b5
    v1115        = 0.00416666666666667d0*v285
    v428         = 0.00833333333333333d0*v285
    v734         = M_0*v285
    v843         = v1115
    v881         = v1115*v8
    v1040        = 0.00138888888888889d0*v285
    Ms_yyyyy     = Ms_yyyyy + (M_yyyyy + v284 + M_y*v250 + M_yy*v126 + M_yyy*v43 + v174*v285)
    Ms_xyyyyy    = Ms_xyyyyy + (v425 + v426 + v427 + v1*v428 + v10*v250 + v122*v43 + v126*v45)
    Ms_yyyyyz    = Ms_yyyyyz + (v471 + v472 + v473 + v126*v290 + v156*v250 + v4*v428 + v43*v474)
    Ms_xxyyyyy   = Ms_xxyyyyy + (M_xxyyyyy + v612 + v613 + v614 + M_xxyyy*v43 + M_yyyyy*v32 + v103*v617 + &
      v126*v98 + v211*v43 + v216*v385 + v250*v34 + v284*v32 + v285*v615 &
      + v428*v6 + v569*v616)
    Ms_xyyyyyz   = Ms_xyyyyyz + (v674 + v675 + v676 + v677 + v126*v436 + v17*v428 + v250*v259 + v427*z + &
      v43*v679)
    Ms_xxxyyyyy  = Ms_xxxyyyyy + (M_xxxyyyyy + v838 + v839 + v840 + M_xxxyyy*v43 + M_xyyy*v218 + M_xyyyyy* &
      v32 + M_yy*v582 + M_yyyyy*v82 + v126*v187 + v250*v84 + v284*v82 + &
      v285*v842 + v29*v428 + v32*v426 + v351*v43 + v357*(v121 + v123) + &
      v569*v844 + v570*v843 + v572*v845 + v64*v841)
    Ms_xxyyyyyz  = Ms_xxyyyyyz + (M_xxyyyyyz + v878 + v879 + v880 + M_xxyyyyy*z + M_xxyyyz*v43 + M_yyyyyz* &
      v32 + v126*v882 + v156*v624 + v218*v474 + v250*v627 + v290*v384 + &
      v32*v470 + v32*v472 + v32*v473 + v386*v43 + v387*v43 + v388*v43 + &
      v4*v881 + v42*v428 + v612*z + v613*z + v614*z)
    Ms_xxxxyyyyy = Ms_xxxxyyyyy + (M_xxxxyyyyy + M_xxxxyyyy*y + M_xxxyyyyy*x + M_xxyyy*v218 + M_xxyyyyy*v32 &
      + M_xyy*v582 + M_xyyyyy*v82 + M_yyyyy*v176 + v1011*v149 + v1012* &
      v64 + v1013*v20 + v1014*v285 + v1015*v285 + v1016*v843 + v1017* &
      v992 + v1018*v814 + v126*v329 + v176*v284 + v179*v250 + v32*v612 &
      + v357*(v211 + v213) + v426*v82 + v428*v79 + v43*v532 + v573*v813 &
      + v807*y)
    Ms_xxxyyyyyz = Ms_xxxyyyyyz + (M_xxxyyyyyz + M_xxxyyyyy*z + M_xxxyyyyz*y + M_xxxyyyz*v43 + M_xxyyyyyz*x &
      + M_xyyyyyz*v32 + M_yyyyyz*v82 + v1000*v218 + v1041*v64 + v1042* &
      v285*v4 + v126*v358 + v126*v362 + v126*v363 + v156*v850 + v250*( &
      v1002 + v998) + v290*v582 + v32*v672 + v32*v675 + v32*v676 + v357 &
      *(v1001 + v252 + v255) + v428*v95 + v43*v574 + v43*v576 + v43* &
      v578 + v470*v82 + v472*v82 + v473*v82 + v581*v624 + v838*z + v839 &
      *z + v840*z + v847*y + v881*v96)
    b6           = b3*b3
    v469         = b6
    v671         = 0.00138888888888889d0*v469
    v955         = M_0*v469
    v1039        = 0.000694444444444444d0*v469
    Ms_yyyyyy    = Ms_yyyyyy + (M_yyyyyy + v468 + M_y*v428 + M_yy*v250 + M_yyy*v126 + M_yyyy*v43 + v314* &
      v469)
    Ms_xyyyyyy   = Ms_xyyyyyy + (v668 + v669 + v670 + v1*v671 + v10*v428 + v122*v126 + v247*v43 + v250* &
      v45)
    Ms_yyyyyyz   = Ms_yyyyyyz + (v727 + v728 + v729 + v126*v474 + v156*v428 + v250*v290 + v287*v43 + v4* &
      v671)
    Ms_xxyyyyyy  = Ms_xxyyyyyy + (M_xxyyyyyy + v874 + v875 + v876 + M_xxyyyy*v43 + M_yyyy*v218 + M_yyyyyy* &
      v32 + v103*v569 + v126*v212 + v216*v617 + v250*v98 + v32*v468 + &
      v34*v428 + v379*v43 + v469*v877 + v6*v671 + v616*v843)
    Ms_xyyyyyyz  = Ms_xyyyyyyz + (M_xyyyyyyz + v921 + v922 + v923 + M_xyyyyyy*z + v126*v679 + v17*v671 + &
      v250*v436 + v259*v428 + v43*v431 + v667*z + v669*z + v670*z)
    Ms_xxxyyyyyy = Ms_xxxyyyyyy + (M_xxxyyyyyy + M_xxxyyyy*v43 + M_xxxyyyyy*y + M_xxyyyyyy*x + M_xyyyy*v218 &
      + M_xyyyyyy*v32 + M_yy*v850 + M_yyy*v582 + M_yyyyyy*v82 + v1037* &
      v64 + v1038*v469 + v1039*v570 + v1040*(v572 + v87) + v126*v351 + &
      v188*v250 + v192*v569 + v32*v669 + v357*(v246 + v248) + v428*v84 &
      + v43*v565 + v468*v82 + v839*y + v843*v844)
    Ms_xxyyyyyyz = Ms_xxyyyyyyz + (M_xxyyyyyyz + M_xxyyyyyy*z + M_xxyyyyyz*y + M_xxyyyyz*v43 + M_xyyyyyyz*x &
      + M_yyyyyyz*v32 + v1039*v4*v8 + v126*v389 + v156*v881 + v218*v287 &
      + v250*v882 + v290*v624 + v32*v726 + v32*v728 + v32*v729 + v384* &
      v474 + v42*v671 + v428*v627 + v43*v618 + v43*v620 + v43*v622 + &
      v874*z + v875*z + v876*z + v879*y)
    b7           = b3*b4
    v725         = b7
    v920         = 0.000198412698412698d0*v725
    Ms_yyyyyyy   = Ms_yyyyyyy + (M_yyyyyyy + v724 + M_y*v671 + M_yy*v428 + M_yyy*v250 + M_yyyy*v126 + &
      M_yyyyy*v43 + v500*v725)
    Ms_xyyyyyyy  = Ms_xyyyyyyy + (M_xyyyyyyy + v917 + v918 + v919 + v1*v920 + v10*v671 + v122*v250 + v126* &
      v247 + v425*v43 + v428*v45)
    Ms_yyyyyyyz  = Ms_yyyyyyyz + (M_yyyyyyyz + v952 + M_yyyyyyy*z + v126*v287 + v156*v671 + v250*v474 + &
      v290*v428 + v4*v920 + v43*v471 + v724*z)
    Ms_xxyyyyyyy = Ms_xxyyyyyyy + (M_xxyyyyyyy + M_xxyyyyy*v43 + M_xxyyyyyy*y + M_xyyyyyyy*x + M_yyyy*v384 &
      + M_yyyyy*v218 + M_yyyyyyy*v32 + v103*v843 + v1039*v616 + v1056* &
      v725 + v126*v380 + v212*v250 + v216*v569 + v32*v724 + v34*v671 + &
      v428*v98 + v43*v613 + v6*v920 + v875*y)
    Ms_xyyyyyyyz = Ms_xyyyyyyyz + (M_xyyyyyyyz + M_xyyyyyyy*z + M_xyyyyyyz*y + M_yyyyyyyz*x + v126*v431 + &
      v17*v920 + v250*v679 + v259*v671 + v428*v436 + v43*v674 + v917*z &
      + v918*z + v919*z + v922*y)
    b8           = b4*b4
    v951         = b8
    v1059        = 2.48015873015873d-5*v951
    Ms_yyyyyyyy  = Ms_yyyyyyyy + (M_yyyyyyyy + v950 + M_y*v920 + M_yy*v671 + M_yyy*v428 + M_yyyy*v250 + &
      M_yyyyy*v126 + M_yyyyyy*v43 + v760*v951)
    Ms_xyyyyyyyy = Ms_xyyyyyyyy + (M_xyyyyyyyy + M_xyyyyyyy*y + M_yyyyyyyy*x + v1*v1059 + v10*v920 + v122* &
      v428 + v126*v425 + v247*v250 + v43*v668 + v45*v671 + v918*y)
    Ms_yyyyyyyyz = Ms_yyyyyyyyz + (M_yyyyyyyyz + M_yyyyyyyy*z + M_yyyyyyyz*y + v1059*v4 + v126*v471 + v156* &
      v920 + v250*v287 + v290*v671 + v428*v474 + v43*v727 + v950*z)
    b9           = b4*b5
    Ms_yyyyyyyyy = Ms_yyyyyyyyy + (M_yyyyyyyyy + M_y*v1059 + M_yy*v920 + M_yyy*v671 + M_yyyy*v428 + M_yyyyy &
      *v250 + M_yyyyyy*v126 + M_yyyyyyy*v43 + M_yyyyyyyy*y + b9*v970)
    c2           = c1*c1
    v27          = c2
    v1072        = v27*v8
    v1073        = v20*v27
    v1078        = 0.25d0*v27
    v1080        = 0.0833333333333333d0*v27
    v1093        = 0.0208333333333333d0*v27
    v1106        = 0.00416666666666667d0*v27
    v1120        = 0.000694444444444444d0*v27
    v56          = 0.5d0*v27
    v118         = M_xx*v27
    v120         = v1072
    v162         = M_yy*v27
    v164         = v1073
    v209         = M_xxx*v27
    v237         = M_xxy*v27
    v239         = v1078*v8
    v244         = M_xxz*v27
    v267         = M_xyy*v27
    v269         = v1076*v27
    v295         = M_yyy*v27
    v297         = v1080
    v303         = M_yyz*v27
    v373         = v1080*v31
    v378         = v1080*v8
    v401         = M_xxyy*v27
    v404         = v102*v27
    v405         = v103*v27
    v407         = v1078
    v411         = 0.125d0*v1073
    v444         = v1080*v64
    v479         = v1093
    v487         = v1086*v27
    v557         = v1093*v81
    v590         = M_xxxyy*v27
    v596         = M_x*v164
    v597         = v162 + v163
    v598         = v597 + v18*v27 + v20*v25
    v634         = M_xxyyy*v27
    v639         = v118 + v119
    v640         = v27*v5 + v410 + v639
    v686         = v1099*v27
    v733         = v1106
    v801         = v1095*v27
    v825         = v27*v99
    v827         = 0.0104166666666667d0*v1073
    v828         = v267 + v268
    v829         = v828 + v20*v59 + v27*v46
    v837         = v1093*v8
    v855         = v27*v28
    v856         = v27*v62
    v858         = 0.0138888888888889d0*v27
    v1134        = v64*v858
    v860         = v1072*v1117
    v864         = v27*v65
    v886         = v27*v97
    v888         = v237 + v238
    v889         = v27*v33 + v638 + v888
    v891         = M_y*v120
    v895         = v27*v38
    v897         = v1073*v1102
    v927         = v1106*v285
    v954         = v1120
    v963         = v1093*v20
    v986         = v1120*v315
    v1004        = v189*v27
    v1006        = v1102*v27
    v1010        = v209 + v210
    v1024        = v213*v27
    v1026        = v295 + v296
    v1032        = v303 + v304
    v1036        = v244 + v245
    v1044        = v187*v27
    v1046        = v1072*v1130
    v1053        = 0.0416666666666667d0*v27
    v1057        = v211*v27
    v1060        = v1120*v469
    Ms_zz        = Ms_zz + (v26 + v27*v7)
    Ms_xzz       = Ms_xzz + (v1*v56 + v61)
    Ms_yzz       = Ms_yzz + (v3*v56 + v74)
    Ms_xxzz      = Ms_xxzz + (0.5d0*(v118 + v119) + v104*v120 + v117 + v25*v32 + v5*v56)
    Ms_xyzz      = Ms_xyzz + (v13*v56 + v55*z + v1092 + v1139 + v136 + v139)
    Ms_yyzz      = Ms_yyzz + (0.5d0*(v162 + v163) + v104*v164 + v161 + v18*v56 + v25*v43)
    Ms_xxxzz     = Ms_xxxzz + (0.5d0*(v209 + v210) + v120*v194 + v193*v27 + v206 + v207 + v208 + v26* &
      v82 + v28*v56 + v32*v59)
    Ms_xxyzz     = Ms_xxyzz + (0.5d0*(v237 + v238) + v1119 + v1143 + v231 + v234 + v236 + v239*v3 + v32 &
      *v70 + v32*v72 + v32*v73 + v33*v56 + v35*v56 + v36*v56)
    Ms_xyyzz     = Ms_xyyzz + (0.5d0*(v267 + v268) + M_xyyzz + v1*v269 + v1131 + v1145 + v261 + v264 + &
      v43*v57 + v43*v59 + v43*v60 + v44*v56 + v46*v56 + v47*v56)
    Ms_yyyzz     = Ms_yyyzz + (0.5d0*(v295 + v296) + M_y*v269 + v126*v26 + v292 + v293 + v294 + v297* &
      v298 + v43*v72 + v56*v62)
    Ms_xxxxzz    = Ms_xxxxzz + (v346 + v347 + v348 + M_xxzz*v32 + v115*v32 + v118*v335 + v176*v26 + v27* &
      v331 + v27*v332 + v297*v334 + v349*v82 + v56*v78)
    Ms_xxxyzz    = Ms_xxxyzz + (v369 + v370 + v371 + v372 + M_xyzz*v32 + v134*v32 + v135*v32 + v137*v32 &
      + v201*z + v239*v89 + v27*v354 + v3*v373 + v56*v83 + v56*v85 + &
      v56*v86 + v74*v82)
    Ms_xxyyzz    = Ms_xxyyzz + (0.25d0*(v404 + v405 + v406 + 2.0d0*(v401 + v402 + v403)) + v100*v56 + &
      v1075*v411 + v113*v43 + v1132 + v1146 + v115*v43 + v116*v43 + &
      v157*v32 + v159*v32 + v160*v32 + v385*v410 + v397 + v407*v408 + &
      v407*v409 + v56*v97 + v56*v99)
    Ms_xyyyzz    = Ms_xyyyzz + (v440 + v441 + v442 + v443 + M_xyyy*v56 + M_xyzz*v43 + v1*v444 + v10*v269 &
      + v121*v56 + v123*v56 + v124*v56 + v126*v61 + v134*v43 + v138*v43 &
      + v139*v43 + v257*z)
    Ms_yyyyzz    = Ms_yyyyzz + (v476 + v477 + v478 + M_y*v444 + M_yyyy*v56 + M_yyzz*v43 + v126*v481 + &
      v147*v56 + v159*v43 + v162*v385 + v250*v26 + v479*v480)
    Ms_xxxxxzz   = Ms_xxxxxzz + (M_xxxxxzz + v527 + v528 + v529 + M_xxxzz*v32 + v118*v517 + v173*v56 + &
      v176*v349 + v207*v32 + v209*v335 + v26*v316 + v27*v514 + v27*v515 &
      + v479*v516 + v530*v82)
    Ms_xxxxyzz   = Ms_xxxxyzz + (M_xxxxyzz + v551 + v552 + v553 + v554 + v555 + v556 + M_xxyzz*v32 + v176 &
      *v74 + v177*v56 + v179*v56 + v180*v56 + v181*v239 + v229*v32 + &
      v230*v32 + v232*v32 + v27*v535 + v3*v557 + v342*z + v373*v89 + &
      v558*v82)
    Ms_xxxyyzz   = Ms_xxxyyzz + (0.5d0*(v590 + v591) + M_xxxyyzz + M_xyyzz*v32 + v1070*v164*v31 + v161* &
      v82 + v187*v56 + v189*v56 + v190*v56 + v191*v407 + v192*v407 + &
      v205*v43 + v207*v43 + v208*v43 + v210*v385 + v262*v32 + v263*v32 &
      + v265*v32 + v364*z + v385*v594 + v407*v592 + v407*v593 + v517* &
      v598 + v584 + v585 + v586 + v587 + v588 + v589 + v595*v596)
    Ms_xxyyyzz   = Ms_xxyyyzz + (0.5d0*(v634 + v635) + M_xxyyyzz + M_xxyzz*v43 + v1070*v120*v64 + v117* &
      v126 + v211*v56 + v213*v56 + v214*v56 + v215*v407 + v216*v407 + &
      v229*v43 + v233*v43 + v234*v43 + v238*v385 + v291*v32 + v293*v32 &
      + v294*v32 + v385*v638 + v392*z + v407*v636 + v407*v637 + v411* &
      v616 + v617*v640 + v628 + v629 + v630 + v631 + v632 + v633)
    Ms_xyyyyzz   = Ms_xyyyyzz + (M_xyyyyzz + v680 + v681 + v682 + v683 + v684 + v685 + M_xyyyy*v56 + &
      M_xyyzz*v43 + v1*v686 + v10*v444 + v126*v689 + v246*v56 + v248* &
      v56 + v249*v56 + v250*v61 + v260*v43 + v262*v43 + v264*v43 + v269 &
      *v45 + v434*z)
    Ms_yyyyyzz   = Ms_yyyyyzz + (M_yyyyyzz + v730 + v731 + v732 + M_yyyyy*v56 + M_yyyzz*v43 + v126*v736 + &
      v162*v617 + v250*v481 + v26*v428 + v284*v56 + v293*v43 + v295* &
      v385 + v479*v735 + v733*v734)
    Ms_xxxxxxzz  = Ms_xxxxxxzz + (M_xxxxxxzz + v779 + M_xxxxxxz*z + M_xxxxzz*v32 + v118*v773 + v120*v774 + &
      v176*v530 + v209*v517 + v26*v502 + v27*v770 + v27*v771 + v313*v56 &
      + v316*v349 + v32*v345 + v509*z + v733*v772 + v780*v82)
    Ms_xxxxxyzz  = Ms_xxxxxyzz + (M_xxxxxyzz + v798 + v799 + v800 + M_xxxxxyz*z + M_xxxyzz*v32 + v176*v558 &
      + v181*v373 + v239*v321 + v27*v785 + v3*v801 + v316*v74 + v317* &
      v56 + v319*v56 + v32*v366 + v32*v367 + v32*v368 + v320*v56 + v520 &
      *z + v522*z + v524*z + v557*v89 + v803*v82)
    Ms_xxxxyyzz  = Ms_xxxxyyzz + (M_xxxxyyzz + v821 + v822 + v823 + M_xxxxyyz*z + M_xxyyzz*v32 + v1113* &
      v827 + v164*v774 + v20*v824 + v269*v78 + v27*v811 + v32*v393 + &
      v32*v394 + v32*v398 + v327*v56 + v329*v56 + v330*v56 + v335*v401 &
      + v335*v402 + v335*v825 + v335*v826 + v345*v43 + v347*v43 + v348* &
      v43 + v404*v595 + v517*v829 + v542*z + v543*z + v546*z + v598* &
      v773 + v82*(M_xyyzz + v1131 + v263) + v830*(v261 + v264 + v266 + &
      v596))
    Ms_xxxyyyzz  = Ms_xxxyyyzz + (M_xxxyyyzz + v851 + v852 + v853 + M_xxxyyy*v56 + M_xxxyyyz*z + M_xxxyzz* &
      v43 + M_xyyy*v239 + M_xyyyzz*v32 + M_xyzz*v218 + M_yyyzz*v82 + &
      v123*v239 + v126*v205 + v126*v207 + v126*v208 + v134*v218 + v164* &
      v789 + v209*v617 + v210*v617 + v26*v582 + v269*v83 + v291*v82 + &
      v293*v82 + v294*v82 + v295*v517 + v296*v517 + v32*v437 + v32*v441 &
      + v32*v442 + v350*v56 + v351*v56 + v352*v56 + v356*v860 + v366* &
      v43 + v370*v43 + v371*v43 + v411*v844 + v517*v856 + v517*v857 + &
      v575*z + v576*z + v579*z + v594*v617 + v617*v855 + v64*v854 + &
      v858*v859)
    Ms_xxyyyyzz  = Ms_xxyyyyzz + (0.0104166666666667d0*(v1072*v480) + M_xxyyyy*v56 + M_xxyyyyz*z + &
      M_xxyyyyzz + M_xxyyzz*v43 + M_yyyy*v239 + M_yyyyzz*v32 + v103* &
      v411 + v126*(M_xxyzz + v229 + v233 + v234) + v147*v239 + v32*v475 &
      + v32*v477 + v32*v478 + v379*v56 + v381*v56 + v382*v56 + v385* &
      v401 + v385*v403 + v385*v886 + v385*v887 + v393*v43 + v395*v43 + &
      v399*v43 + v569*v640 + v617*v889 + v619*z + v620*z + v623*z + &
      v883 + v884 + v885 + v890*(v230 + v232 + v235 + v236 + v891))
    Ms_xyyyyyzz  = Ms_xyyyyyzz + (M_xyyyyyzz + v924 + v925 + v926 + M_xyyyyy*v56 + M_xyyyyyz*z + M_xyyyzz* &
      v43 + v1*v927 + v10*v686 + v122*v269 + v126*v930 + v250*v689 + &
      v424*v56 + v426*v56 + v427*v56 + v428*v61 + v43*v437 + v43*v438 + &
      v43*v439 + v444*v45 + v673*z + v675*z + v677*z)
    Ms_yyyyyyzz  = Ms_yyyyyyzz + (M_yyyyyyzz + v953 + M_y*v927 + M_yyyy*v269 + M_yyyyyy*v56 + M_yyyyyyz*z &
      + M_yyyyzz*v43 + v126*v956 + v162*v569 + v250*v736 + v26*v671 + &
      v295*v617 + v428*v481 + v43*v475 + v468*v56 + v728*z + v954*v955)
    Ms_xxxxxxxzz = Ms_xxxxxxxzz + (M_xxxxxxxzz + M_xxxxxxxz*z + M_xxxxxxzz*x + M_xxxxxzz*v32 + v118*v975 + &
      v120*v977 + v176*v780 + v209*v773 + v26*v762 + v27*v972 + v27* &
      v973 + v297*v976 + v316*v530 + v32*v527 + v346*v82 + v349*v502 + &
      v499*v56 + v766*z + v954*v974)
    Ms_xxxxxxyzz = Ms_xxxxxxyzz + (M_xxxxxxyzz + M_xxxxxxyz*z + M_xxxxxxzz*y + M_xxxxxyzz*x + M_xxxxyzz*v32 &
      + v176*v803 + v178*v239 + v181*v557 + v27*v979 + v3*v986 + v316* &
      v558 + v32*v551 + v32*v552 + v32*v554 + v321*v373 + v369*v82 + &
      v502*v74 + v503*v56 + v505*v56 + v506*v56 + v776*z + v777*z + &
      v778*z + v779*y + v801*v89)
    Ms_xxxxxyyzz = Ms_xxxxxyyzz + (0.00208333333333333d0*(v1083*v175*v27 + 5.0d0*v596*v81) + M_xxxxxyyz*z + &
      M_xxxxxyyzz + M_xxxxxyzz*y + M_xxxxyyzz*x + M_xxxyyzz*v32 + v1003 &
      *v20 + v1004*v335 + v1005*v335 + v1006*v191 + v161*v316 + v164* &
      v977 + v173*v269 + v27*v990 + v32*v584 + v32*v585 + v32*v587 + &
      v335*v590 + v335*v591 + v43*v527 + v43*v528 + v43*v529 + v511*v56 &
      + v512*v56 + v513*v56 + v517*(v401 + v402 + v825 + v826) + v598* &
      v975 + v773*v829 + v792*z + v793*z + v794*z + v799*y + v82*(v1007 &
      + v1090) + v830*(v1091 + v1137 + v404))
    Ms_xxxxyyyzz = Ms_xxxxyyyzz + (M_xxxxyyyzz + M_xxxx*v444 + M_xxxxyyyz*z + M_xxxxyyzz*y + M_xxxyyyzz*x + &
      M_xxyyyzz*v32 + M_xxyzz*v218 + M_xxzz*v384 + M_xyyy*v373 + &
      M_xyyyzz*v82 + M_xyzz*v365 + v1006*v215 + v1013*v27 + v1017*v827 &
      + v1022*v20 + v1023*v64 + v1024*v335 + v1025*v27*v64 + v1027*( &
      v1028 + v1029 + v118*v64 + v27*v636 + v294*v8 + v635) + v1087* &
      v1134 + v115*v384 + v123*v373 + v126*v345 + v126*v347 + v126*v348 &
      + v134*v365 + v164*v982 + v179*v269 + v218*v229 + v26*v820 + v32* &
      v628 + v32*v629 + v32*v631 + v335*v634 + v349*v582 + v43*v551 + &
      v43*v553 + v43*v555 + v437*v82 + v441*v82 + v442*v82 + v444*v78 + &
      v531*v56 + v532*v56 + v533*v56 + v773*(v1026 + v856 + v857) + &
      v815*z + v816*z + v817*z + v822*y)
    Ms_xxxyyyyzz = Ms_xxxyyyyzz + (M_xxxyyyyzz + M_x*v1046 + M_xxxy*v444 + M_xxxyyyy*v56 + M_xxxyyyyz*z + &
      M_xxxyyyzz*y + M_xxxyyzz*v43 + M_xxyyyyzz*x + M_xyyyy*v239 + &
      M_xyyyyzz*v32 + M_xyyzz*v218 + M_xyzz*v384 + M_yyyy*v373 + &
      M_yyyyzz*v82 + M_yyzz*v365 + v1043*v64 + v1044*v385 + v1045*v1098 &
      *v27 + v1047*(v1005 + v1048 + v162*v31 + v20*v208 + v27*v593 + &
      v591) + v1101*v1134 + v126*v366 + v126*v370 + v126*v371 + v134* &
      v384 + v147*v373 + v159*v365 + v192*v411 + v218*v262 + v239*v248 &
      + v26*v850 + v32*v680 + v32*v681 + v32*v683 + v385*v590 + v43* &
      v584 + v43*v586 + v43*v588 + v444*v83 + v475*v82 + v477*v82 + &
      v478*v82 + v481*v582 + v56*v564 + v56*v565 + v56*v566 + v569*( &
      v1010 + v594 + v855) + v846*z + v847*z + v848*z + v852*y)
    Ms_xxyyyyyzz = Ms_xxyyyyyzz + (0.00208333333333333d0*(v1072*v734) + M_xxyyyyy*v56 + M_xxyyyyyz*z + &
      M_xxyyyyyzz + M_xxyyyyzz*y + M_xxyyyzz*v43 + M_xyyyyyzz*x + &
      M_yyyyy*v239 + M_yyyyyzz*v32 + v1028*v385 + v1057*v385 + v1130* &
      v891 + v117*v428 + v126*(M_xxyyzz + v393 + v395 + v399) + v216* &
      v411 + v239*v284 + v32*v730 + v32*v731 + v32*v732 + v385*v634 + &
      v385*v635 + v43*v628 + v43*v630 + v43*v632 + v56*v612 + v56*v613 &
      + v56*v614 + v569*v889 + v617*(v401 + v403 + v886 + v887) + v640* &
      v843 + v878*z + v879*z + v880*z + v884*y + v890*(v394 + v396 + &
      v398 + v400 + v405))
    Ms_xyyyyyyzz = Ms_xyyyyyyzz + (M_xyyyyyyzz + M_xyyyyyy*v56 + M_xyyyyyyz*z + M_xyyyyyzz*y + M_xyyyyzz* &
      v43 + M_yyyyyyzz*x + v1*v1060 + v10*v927 + v122*v444 + v126*v440 &
      + v247*v269 + v250*v930 + v428*v689 + v43*v680 + v43*v682 + v43* &
      v684 + v45*v686 + v56*v667 + v56*v669 + v56*v670 + v61*v671 + &
      v921*z + v922*z + v923*z + v925*y)
    Ms_yyyyyyyzz = Ms_yyyyyyyzz + (M_yyyyyyyzz + M_y*v1060 + M_yyyy*v444 + M_yyyyy*v269 + M_yyyyyyy*v56 + &
      M_yyyyyyyz*z + M_yyyyyyzz*y + M_yyyyyzz*v43 + v1124*v27*v725 + &
      v126*v476 + v162*v843 + v250*v956 + v26*v920 + v295*v569 + v428* &
      v736 + v43*v730 + v481*v671 + v56*v724 + v952*z)
    h            = v20 + v27 + v8
    u2           = 1.0/h
    u            = sqrt(u2)
    u3           = u*u2
    u4           = u2*u2
    u5           = u2*u3
    u6           = u3*u3
    u7           = u3*u4
    u8           = u4*u4
    u9           = u4*u5
    u10          = u5*u5
    u11          = u5*u6
    u12          = u6*u6
    u13          = u6*u7
    u14          = u7*u7
    u15          = u7*u8
    u16          = u8*u8
    u17          = u8*u9
    u18          = u9*u9
    u19          = u10*u9
    c3           = c1*c2
    v77          = c3
    v1082        = 0.0833333333333333d0*v77
    v1107        = M_y*v77
    v1122        = 0.00694444444444444d0*v77
    v146         = 0.166666666666667d0*v77
    v305         = v1082
    v419         = v1082*v8
    v452         = v1086*v77
    v485         = 0.0277777777777778d0*v77
    v562         = M_x*v77
    v605         = v1088*v77
    v696         = v1100*v77
    v740         = v1107
    v834         = v1096*v77
    v836         = v1114*v77
    v866         = 0.0138888888888889d0*v77
    v907         = 0.0416666666666667d0*v77
    v934         = v1116*v77
    v958         = v285*v77
    v962         = v1122*v64
    v1008        = v175*v77
    Ms_zzz       = Ms_zzz + (v76 + M_z*v56 + v30*v77)
    Ms_xzzz      = Ms_xzzz + (v145 + v1*v146 + v15*v56)
    Ms_yzzz      = Ms_yzzz + (v169 + v146*v3 + v22*v56)
    Ms_xxzzz     = Ms_xxzzz + (0.5d0*(v244 + v245) + M_z*v239 + v146*v6 + v217*v77 + v241 + v242 + v243 &
      + v32*v75 + v38*v56)
    Ms_xyzzz     = Ms_xyzzz + (v13*v146 + v140*z + v278*v56 + v1105 + v1142 + v272 + v275)
    Ms_yyzzz     = Ms_yyzzz + (0.5d0*(v303 + v304) + M_z*v269 + v146*v19 + v300 + v301 + v302 + v305* &
      v306 + v43*v75 + v56*v65)
    Ms_xxxzzz    = Ms_xxxzzz + (M_xxxzzz + v374 + v375 + v376 + M_xxxz*v56 + M_xz*v239 + M_xzzz*v32 + &
      M_zzz*v82 + v143*v32 + v146*v28 + v353*v77 + v355*v77 + v377*v378 &
      + v56*v90 + v75*v82)
    Ms_xxyzzz    = Ms_xxyzzz + (v415 + v416 + v417 + v418 + M_xxyz*v56 + M_yzzz*v32 + v109*v56 + v110* &
      v56 + v112*v56 + v146*v37 + v165*v32 + v167*v32 + v168*v32 + v22* &
      v239 + v235*z + v3*v419)
    Ms_xyyzzz    = Ms_xyyzzz + (v448 + v449 + v450 + v451 + M_xyyz*v56 + M_xzzz*v43 + v1*v452 + v130*v56 &
      + v131*v56 + v133*v56 + v141*v43 + v143*v43 + v144*v43 + v146*v48 &
      + v15*v269 + v266*z)
    Ms_yyyzzz    = Ms_yyyzzz + (M_yyyzzz + v482 + v483 + v484 + M_yyy*v146 + M_yyyz*v56 + M_yz*v269 + &
      M_yzzz*v43 + M_zzz*v126 + v126*v75 + v146*v62 + v150*v56 + v167* &
      v43 + v298*v485 + v486*v487)
    Ms_xxxxzzz   = Ms_xxxxzzz + (M_xxxxzzz + v559 + v560 + v561 + M_xxzzz*v32 + M_xzzz*v82 + M_z*v557 + &
      v143*v82 + v146*v78 + v176*v76 + v184*v56 + v242*v32 + v244*v335 &
      + v27*v547 + v378*v563 + v534*v77 + v536*v77 + v537*v562)
    Ms_xxxyzzz   = Ms_xxxyzzz + (M_xxxyzzz + v599 + v600 + v601 + v602 + v603 + v604 + M_xxxyz*v56 + &
      M_xyzzz*v32 + M_yzzz*v82 + v146*v83 + v146*v85 + v146*v86 + v165* &
      v82 + v167*v82 + v168*v82 + v198*v56 + v199*v56 + v201*v56 + v202 &
      *v239 + v270*v32 + v271*v32 + v273*v32 + v3*v605 + v372*z + v378* &
      v606 + v567*v77)
    Ms_xxyyzzz   = Ms_xxyyzzz + (0.5d0*(v647 + v648) + M_xxyyz*v56 + M_xxyyzzz + v101*v146 + v105*v1070* &
      v77 + v222*v56 + v223*v56 + v225*v56 + v227*v407 + v228*v407 + &
      v240*v43 + v242*v43 + v243*v43 + v245*v385 + v299*v32 + v301*v32 &
      + v302*v32 + v305*v654 + v385*v651 + v400*z + v407*v649 + v407* &
      v650 + v411*v652 + v641 + v642 + v643 + v644 + v645 + v646)
    Ms_xyyyzzz   = Ms_xyyyzzz + (M_xyyyzzz + v690 + v691 + v692 + v693 + v694 + v695 + M_xyyy*v146 + &
      M_xyyyz*v56 + M_xyzzz*v43 + M_xzzz*v126 + v1*v696 + v121*v146 + &
      v123*v146 + v124*v146 + v126*v141 + v126*v143 + v126*v144 + v254* &
      v56 + v255*v56 + v257*v56 + v258*v269 + v270*v43 + v274*v43 + &
      v275*v43 + v443*z + v487*v699)
    Ms_yyyyzzz   = Ms_yyyyzzz + (M_yyyyzzz + v737 + v738 + v739 + M_yyyy*v146 + M_yyyyz*v56 + M_yyzzz*v43 &
      + M_yzzz*v126 + M_z*v686 + v1122*v480 + v126*v167 + v146*v147 + &
      v250*v76 + v288*v56 + v301*v43 + v303*v385 + v487*v741 + v571* &
      v740)
    Ms_xxxxxzzz  = Ms_xxxxxzzz + (M_xxxxxzzz + v804 + M_xx*v605 + M_xxxxxzz*z + M_xxxz*v239 + M_xxxzzz*v32 &
      + M_xxzzz*v82 + M_xz*v557 + M_z*v801 + v146*v173 + v176*v805 + &
      v242*v82 + v27*v795 + v316*v76 + v32*v374 + v324*v56 + v378*(v90 &
      + v92) + v528*z + v562*v787 + v77*v784 + v77*v786)
    Ms_xxxxyzzz  = Ms_xxxxyzzz + (M_xxxxyzzz + v831 + v832 + v833 + M_xxxxyzz*z + M_xxyzzz*v32 + M_xyzzz* &
      v82 + v146*v177 + v146*v179 + v146*v180 + v169*v176 + v22*v557 + &
      v239*v343 + v27*v818 + v270*v82 + v271*v82 + v273*v82 + v3*v834 + &
      v32*v412 + v32*v416 + v32*v417 + v338*v56 + v340*v56 + v342*v56 + &
      v378*(v108 + v662) + v552*z + v553*z + v556*z + v605*v89 + v77* &
      v810)
    Ms_xxxyyzzz  = Ms_xxxyyzzz + (M_xxxyyzzz + v861 + v862 + v863 + M_xxxyyz*v56 + M_xxxyyzz*z + M_xxxz* &
      v269 + M_xxxzzz*v43 + M_xyyz*v239 + M_xyyzzz*v32 + M_xzzz*v218 + &
      M_yyzzz*v82 + v130*v239 + v143*v218 + v146*v187 + v146*v189 + &
      v146*v190 + v19*v605 + v191*v305 + v192*v305 + v269*v90 + v299* &
      v82 + v301*v82 + v302*v82 + v303*v517 + v304*v517 + v305*v592 + &
      v305*v593 + v32*v445 + v32*v449 + v32*v450 + v359*v56 + v362*v56 &
      + v364*v56 + v374*v43 + v375*v43 + v376*v43 + v377*v860 + v411* &
      v868 + v517*v864 + v517*v865 + v585*z + v586*z + v589*z + v77* &
      v841 + v866*v867)
    Ms_xxyyyzzz  = Ms_xxyyyzzz + (M_xxyyyzzz + v892 + v893 + v894 + M_xxyyy*v146 + M_xxyyyz*v56 + &
      M_xxyyyzz*z + M_xxyz*v269 + M_xxyzzz*v43 + M_xxzzz*v126 + M_yyyz* &
      v239 + M_yyyzzz*v32 + M_yz*v897 + M_yzzz*v218 + v110*v269 + v126* &
      v240 + v126*v242 + v126*v243 + v146*v211 + v146*v213 + v146*v214 &
      + v150*v239 + v167*v218 + v215*v305 + v216*v305 + v244*v617 + &
      v245*v617 + v305*v636 + v305*v637 + v32*v482 + v32*v483 + v32* &
      v484 + v387*v56 + v390*v56 + v392*v56 + v413*v43 + v416*v43 + &
      v418*v43 + v486*v860 + v6*v696 + v617*v651 + v617*v895 + v629*z + &
      v630*z + v633*z + v866*v896)
    Ms_xyyyyzzz  = Ms_xyyyyzzz + (M_xyyyyzzz + v931 + v932 + v933 + M_xyyyy*v146 + M_xyyyyz*v56 + &
      M_xyyyyzz*z + M_xyyzzz*v43 + M_xyzzz*v126 + v1*v934 + v10*v696 + &
      v126*v270 + v126*v274 + v126*v275 + v145*v250 + v146*v246 + v146* &
      v248 + v146*v249 + v15*v686 + v269*v435 + v43*v446 + v43*v449 + &
      v43*v451 + v430*v56 + v432*v56 + v434*v56 + v487*(v129 + v707) + &
      v681*z + v682*z + v685*z)
    Ms_yyyyyzzz  = Ms_yyyyyzzz + (M_yyyyyzzz + v957 + M_yy*v696 + M_yyyyy*v146 + M_yyyyyz*v56 + M_yyyyyzz* &
      z + M_yyyz*v269 + M_yyyzzz*v43 + M_yyzzz*v126 + M_yz*v686 + M_z* &
      v927 + v126*v301 + v146*v284 + v250*v959 + v314*v958 + v428*v76 + &
      v43*v482 + v472*v56 + v487*(v150 + v152) + v731*z + v740*v845)
    Ms_xxxxxxzzz = Ms_xxxxxxzzz + (M_xxxxxxzzz + M_xx*v834 + M_xxx*v605 + M_xxxxxxzz*z + M_xxxxxzzz*x + &
      M_xxxxzzz*v32 + M_xxxzzz*v82 + M_xz*v801 + M_z*v986 + v120*v987 + &
      v146*v313 + v176*(M_xxzzz + v242) + v244*v773 + v27*v985 + v316* &
      v805 + v32*v559 + v374*v82 + v378*(v182 + v184) + v509*v56 + v77* &
      v978 + v77*v980 + v779*z + v984*(v141 + v144 + v562))
    Ms_xxxxxyzzz = Ms_xxxxxyzzz + (0.00138888888888889d0*(v1008*(v1068 + 720.0d0*v993)) + M_xxxxxyzz*z + &
      M_xxxxxyzzz + M_xxxxxzzz*y + M_xxxxyzzz*x + M_xxxyzzz*v32 + &
      M_xxyzzz*v82 + v146*v317 + v146*v319 + v146*v320 + v169*v316 + &
      v176*(v272 + v716) + v181*v605 + v202*v557 + v22*v801 + v239*v525 &
      + v27*v996 + v32*v599 + v32*v600 + v32*v602 + v378*(v1009 + v197 &
      ) + v412*v82 + v416*v82 + v417*v82 + v520*v56 + v522*v56 + v524* &
      v56 + v77*v989 + v798*z + v799*z + v800*z + v804*y + v834*v89)
    Ms_xxxxyyzzz = Ms_xxxxyyzzz + (0.0138888888888889d0*(v20*v31*v562) + M_xxxx*v452 + M_xxxxyyzz*z + &
      M_xxxxyyzzz + M_xxxxyzzz*y + M_xxxyyzzz*x + M_xxyy*v419 + M_xxyyz &
      *v239 + M_xxyyzzz*v32 + M_xyyz*v373 + M_xyyzzz*v82 + M_xzzz*v365 &
      + M_z*v81*v827 + v1006*v227 + v1012*v77 + v1019*v27 + v1025*v20* &
      v77 + v1027*(v102*v77 + v1033 + v1034 + v27*v649 + v302*v8 + v648 &
      ) + v1030*v20 + v1031*v335 + v130*v373 + v143*v365 + v146*v327 + &
      v146*v329 + v146*v330 + v164*v987 + v184*v269 + v19*v834 + v222* &
      v239 + v32*v641 + v32*v642 + v32*v644 + v335*v647 + v336*v605 + &
      v419*v99 + v43*v559 + v43*v560 + v43*v561 + v445*v82 + v449*v82 + &
      v450*v82 + v452*v78 + v542*v56 + v543*v56 + v546*v56 + v773*( &
      v1032 + v864 + v865) + v821*z + v822*z + v823*z + v832*y)
    Ms_xxxyyyzzz = Ms_xxxyyyzzz + (0.00462962962962963d0*(v77*v859) + M_xxxy*v452 + M_xxxyyyz*v56 + &
      M_xxxyyyzz*z + M_xxxyyyzzz + M_xxxyyzzz*y + M_xxxyz*v269 + &
      M_xxxyzzz*v43 + M_xxxz*v444 + M_xxyyyzzz*x + M_xyyy*v419 + &
      M_xyyyz*v239 + M_xyyyzzz*v32 + M_xyz*v897 + M_xyzzz*v218 + M_xzzz &
      *v384 + M_yyy*v605 + M_yyyz*v373 + M_yyyzzz*v82 + M_yzzz*v365 + &
      M_zzz*v582 + v1037*v77 + v1049*v64 + v1050*v1073*(v54 + v698) + &
      v123*v419 + v126*v374 + v126*v375 + v126*v376 + v143*v384 + v146* &
      v350 + v146*v351 + v146*v352 + v150*v373 + v167*v365 + v199*v269 &
      + v218*v270 + v239*v254 + v28*v696 + v32*v690 + v32*v691 + v32* &
      v693 + v43*v599 + v43*v601 + v43*v603 + v444*v90 + v452*v83 + &
      v482*v82 + v483*v82 + v484*v82 + v485*v981 + v56*v575 + v56*v576 &
      + v56*v579 + v582*v75 + v605*v62 + v851*z + v852*z + v853*z + &
      v860*(v53 + v697) + v862*y)
    Ms_xxyyyyzzz = Ms_xxyyyyzzz + (M_xxyyyyzzz + M_xxyy*v452 + M_xxyyyy*v146 + M_xxyyyyz*v56 + M_xxyyyyzz*z &
      + M_xxyyyzzz*y + M_xxyyz*v269 + M_xxyyzzz*v43 + M_xxyz*v444 + &
      M_xxyzzz*v126 + M_xyyyyzzz*x + M_yyyy*v419 + M_yyyyz*v239 + &
      M_yyyyzzz*v32 + M_yzzz*v384 + M_z*v1046 + v1033*v385 + v1045* &
      v1075*v77 + v1047*(v103*v77 + v1031 + v1058 + v20*v243 + v27*v650 &
      + v647) + v1050*v1107*v64 + v110*v444 + v126*v413 + v126*v416 + &
      v126*v418 + v146*v379 + v146*v381 + v146*v382 + v147*v419 + v167* &
      v384 + v223*v269 + v228*v411 + v239*v288 + v32*v737 + v32*v738 + &
      v32*v739 + v34*v696 + v385*v648 + v43*v641 + v43*v643 + v43*v645 &
      + v452*v97 + v56*v619 + v56*v620 + v56*v623 + v569*(v1036 + v651 &
      + v895) + v6*v934 + v883*z + v884*z + v885*z + v893*y)
    Ms_xyyyyyzzz = Ms_xyyyyyzzz + (M_xyyyyyzzz + M_xyyyyy*v146 + M_xyyyyyz*v56 + M_xyyyyyzz*z + M_xyyyyzzz* &
      y + M_xyyyzzz*v43 + M_xyyzzz*v126 + M_yyyyyzzz*x + v10*v934 + &
      v1061*v958 + v126*v446 + v126*v449 + v126*v451 + v145*v428 + v146 &
      *v424 + v146*v426 + v146*v427 + v15*v927 + v250*(v1062 + v1063) + &
      v258*v686 + v269*v678 + v43*v690 + v43*v692 + v43*v694 + v45*v696 &
      + v487*(v1064 + v253) + v56*v673 + v56*v675 + v56*v677 + v924*z + &
      v925*z + v926*z + v932*y)
    Ms_yyyyyyzzz = Ms_yyyyyyzzz + (0.000231481481481481d0*(v77*v955) + M_yy*v934 + M_yyy*v696 + M_yyyyyy* &
      v146 + M_yyyyyyz*v56 + M_yyyyyyzz*z + M_yyyyyyzzz + M_yyyyyzzz*y &
      + M_yyyyz*v269 + M_yyyyzzz*v43 + M_yyyzzz*v126 + M_yz*v927 + M_z* &
      v1060 + v1040*(v165 + v168 + v740) + v126*v482 + v146*v468 + v250 &
      *(M_yyzzz + v301) + v303*v569 + v428*v959 + v43*v737 + v487*(v286 &
      + v288) + v56*v728 + v953*z)
    c4           = c2*c2
    v172         = c4
    v1094        = 0.0208333333333333d0*v172
    v1108        = 0.00694444444444444d0*v172
    v1118        = 0.0104166666666667d0*v172
    v1121        = 0.00173611111111111d0*v172
    v283         = 0.0416666666666667d0*v172
    v492         = v1094
    v661         = v1094*v8
    v706         = v1094*v20
    v745         = v1108
    v872         = v1108*v31
    v903         = v1118
    v938         = v1108*v64
    v961         = v1121
    v1035        = M_z*v1121
    v1051        = 0.00347222222222222d0*v172
    v1052        = v1071*v1118
    v1054        = M_zz*v1108
    Ms_zzzz      = Ms_zzzz + (v171 + M_z*v146 + M_zz*v56 + v172*v80)
    Ms_xzzzz     = Ms_xzzzz + (v280 + v281 + v282 + v1*v283 + v146*v15 + v56*v58)
    Ms_yzzzz     = Ms_yzzzz + (v308 + v309 + v310 + v146*v22 + v283*v3 + v56*v71)
    Ms_xxzzzz    = Ms_xxzzzz + (v421 + v422 + v423 + M_xxzz*v56 + M_z*v419 + M_zzzz*v32 + v113*v56 + &
      v119*v407 + v146*v39 + v170*v32 + v172*v383 + v283*v6)
    Ms_xyzzzz    = Ms_xyzzzz + (v456 + v457 + v458 + v459 + v13*v283 + v146*v278 + v276*z + v462*v56)
    Ms_yyzzzz    = Ms_yyzzzz + (v489 + v490 + v491 + M_yyzz*v56 + M_z*v452 + M_zzzz*v43 + v146*v66 + &
      v157*v56 + v163*v407 + v170*v43 + v19*v283 + v306*v492)
    Ms_xxxzzzz   = Ms_xxxzzzz + (M_xxxzzzz + v607 + v608 + v609 + M_xxxzz*v56 + M_xzzzz*v32 + M_zzzz*v82 &
      + v146*v90 + v170*v82 + v172*v568 + v205*v56 + v210*v407 + v281* &
      v32 + v283*v29 + v378*v611 + v485*v610 + v492*v570 + v580*v77)
    Ms_xxyzzzz   = Ms_xxyzzzz + (M_xxyzzzz + v655 + v656 + v657 + v658 + v659 + v660 + M_xxyzz*v56 + &
      M_yzzzz*v32 + v146*v663 + v22*v419 + v232*v56 + v233*v56 + v235* &
      v56 + v239*v71 + v283*v37 + v3*v661 + v307*v32 + v309*v32 + v310* &
      v32 + v414*z)
    Ms_xyyzzzz   = Ms_xyyzzzz + (M_xyyzzzz + v700 + v701 + v702 + v703 + v704 + v705 + M_xyyzz*v56 + &
      M_xzzzz*v43 + v1*v706 + v146*v708 + v15*v452 + v263*v56 + v264* &
      v56 + v266*v56 + v269*v58 + v279*v43 + v281*v43 + v282*v43 + v283 &
      *v48 + v447*z)
    Ms_yyyzzzz   = Ms_yyyzzzz + (M_yyyzzzz + v742 + v743 + v744 + M_yyyz*v146 + M_yyyzz*v56 + M_yzzzz*v43 &
      + M_zzzz*v126 + v126*v170 + v146*v150 + v283*v63 + v291*v56 + &
      v296*v407 + v298*v745 + v309*v43 + v485*v747 + v487*v748 + v492* &
      v746)
    Ms_xxxxzzzz  = Ms_xxxxzzzz + (M_xxxxzzzz + v835 + M_xxxxzzz*z + M_xxzz*v239 + M_xxzzzz*v32 + M_xz*v605 &
      + M_xzzzz*v82 + M_zzzz*v176 + v146*v184 + v170*v176 + v172*v809 + &
      v172*v812 + v27*v824 + v281*v82 + v283*v78 + v32*v422 + v347*v56 &
      + v377*v836 + v378*(v113 + v115) + v560*z + v639*v837 + v77*v819)
    Ms_xxxyzzzz  = Ms_xxxyzzzz + (M_xxxyzzzz + v869 + v870 + v871 + M_xxxyzz*v56 + M_xxxyzzz*z + M_xyzzzz* &
      v32 + M_yzzzz*v82 + v146*v198 + v146*v199 + v146*v201 + v22*v605 &
      + v239*v460 + v283*v88 + v3*v872 + v307*v82 + v309*v82 + v310*v82 &
      + v32*v453 + v32*v457 + v32*v458 + v367*v56 + v370*v56 + v372*v56 &
      + v378*(v136 + v461) + v600*z + v601*z + v604*z + v661*v89 + v77* &
      v849)
    Ms_xxyyzzzz  = Ms_xxyyzzzz + (M_xxyyzzzz + v898 + v899 + v900 + M_xxyyzz*v56 + M_xxyyzzz*z + M_xxzzzz* &
      v43 + M_yyzzzz*v32 + M_zzzz*v218 + v119*v411 + v146*(M_xxyyz + &
      v1133 + v225) + v170*v218 + v305*v906 + v32*v488 + v32*v490 + v32 &
      *v491 + v398*v56 + v399*v56 + v400*v56 + v402*v407 + v403*v407 + &
      v407*v901 + v407*v902 + v420*v43 + v422*v43 + v423*v43 + v492* &
      v654 + v642*z + v643*z + v646*z + v903*v904 + v907*(v219 + v226 + &
      v908 + v909))
    Ms_xyyyzzzz  = Ms_xyyyzzzz + (M_xyyyzzzz + v935 + v936 + v937 + M_xyyyz*v146 + M_xyyyzz*v56 + &
      M_xyyyzzz*z + M_xyzzzz*v43 + M_xzzzz*v126 + v1*v938 + v10*v706 + &
      v125*v283 + v126*v279 + v126*v281 + v126*v282 + v146*v254 + v146* &
      v255 + v146*v257 + v15*v696 + v269*v687 + v43*v454 + v43*v457 + &
      v43*v459 + v438*v56 + v441*v56 + v443*v56 + v487*(v137 + v140 + &
      v688) + v691*z + v692*z + v695*z)
    Ms_yyyyzzzz  = Ms_yyyyzzzz + (M_yyyyzzzz + v960 + M_yyyy*v283 + M_yyyyz*v146 + M_yyyyzz*v56 + &
      M_yyyyzzz*z + M_yyzz*v269 + M_yyzzzz*v43 + M_yz*v696 + M_yzzzz* &
      v126 + M_zzzz*v250 + v126*v309 + v146*v288 + v147*v283 + v170* &
      v250 + v43*v490 + v477*v56 + v480*v961 + v486*v962 + v487*(v157 + &
      v159) + v597*v963 + v738*z)
    Ms_xxxxxzzzz = Ms_xxxxxzzzz + (M_xxxxxzzzz + M_xxxxxzzz*z + M_xxxxzzzz*x + M_xxxzz*v239 + M_xxxzzzz*v32 &
      + M_xxz*v605 + M_xxzzzz*v82 + M_xzzzz*v176 + M_zz*v801 + v1003* &
      v27 + v1008*v999 + v1010*v837 + v146*v324 + v171*v316 + v172*v988 &
      + v172*v991 + v173*v283 + v176*v281 + v32*v607 + v378*(v205 + &
      v207) + v422*v82 + v516*v961 + v528*v56 + v563*v836 + v77*v997 + &
      v804*z)
    Ms_xxxxyzzzz = Ms_xxxxyzzzz + (M_xxxxyzzzz + M_xxxxyzzz*z + M_xxxxzzzz*y + M_xxxyzzzz*x + M_xxyzzzz*v32 &
      + M_xyzzzz*v82 + M_yzzzz*v176 + v1011*v172 + v1020*v77 + v1022* &
      v27 + v146*v338 + v146*v340 + v146*v342 + v176*v307 + v176*v309 + &
      v176*v310 + v177*v283 + v179*v283 + v180*v283 + v202*v605 + v239* &
      v802 + v3*v81*v961 + v32*v655 + v32*v656 + v32*v658 + v378*(v231 &
      + v914) + v453*v82 + v457*v82 + v458*v82 + v552*v56 + v553*v56 + &
      v556*v56 + v606*v836 + v831*z + v832*z + v833*z + v835*y + v837*( &
      v27*v35 + v70*v8 + v888))
    Ms_xxxyyzzzz = Ms_xxxyyzzzz + (M_xxxyyzzzz + M_x*v1052 + M_xxxyyzz*v56 + M_xxxyyzzz*z + M_xxxyzzzz*y + &
      M_xxxz*v452 + M_xxxzzzz*v43 + M_xxyyzzzz*x + M_xyyz*v419 + &
      M_xyyzz*v239 + M_xyyzzzz*v32 + M_xzzzz*v218 + M_yyzz*v373 + &
      M_yyzzzz*v82 + M_zzzz*v365 + v1041*v77 + v1048*v407 + v1051*v867 &
      + v1053*(v1004 + v1044 + v163*v31 + v190*v27 + v20*v594 + v590) + &
      v1103*v20*v866 + v130*v419 + v146*v359 + v146*v362 + v146*v364 + &
      v157*v373 + v170*v365 + v19*v872 + v210*v411 + v218*v281 + v239* &
      v263 + v32*v700 + v32*v701 + v32*v703 + v407*v591 + v43*v607 + &
      v43*v608 + v43*v609 + v452*v90 + v488*v82 + v490*v82 + v491*v82 + &
      v492*(v592 + v593 + v995) + v56*v585 + v56*v586 + v56*v589 + v605 &
      *v66 + v861*z + v862*z + v863*z + v870*y)
    Ms_xxyyyzzzz = Ms_xxyyyzzzz + (M_xxyyyzzzz + M_xxyyyz*v146 + M_xxyyyzz*v56 + M_xxyyyzzz*z + M_xxyyzzzz* &
      y + M_xxyz*v452 + M_xxyzz*v269 + M_xxyzzzz*v43 + M_xxzz*v444 + &
      M_xxzzzz*v126 + M_xyyyzzzz*x + M_y*v1052 + M_yyyz*v419 + &
      M_yyyzzzz*v32 + M_yzzzz*v218 + M_zzzz*v384 + v1029*v407 + v1051* &
      v896 + v1053*(v1024 + v1057 + v119*v64 + v20*v638 + v214*v27 + &
      v634) + v110*v452 + v1109*v8*v866 + v113*v444 + v126*v420 + v126* &
      v422 + v126*v423 + v146*v387 + v146*v390 + v146*v392 + v150*v419 &
      + v170*v384 + v218*v309 + v233*v269 + v238*v411 + v32*v742 + v32* &
      v743 + v32*v744 + v39*v696 + v407*v635 + v43*v655 + v43*v657 + &
      v43*v659 + v492*(v1018 + v636 + v637) + v56*v629 + v56*v630 + v56 &
      *v633 + v6*v938 + v892*z + v893*z + v894*z + v899*y)
    Ms_xyyyyzzzz = Ms_xyyyyzzzz + (M_xyyyyzzzz + M_xyyyy*v283 + M_xyyyyz*v146 + M_xyyyyzz*v56 + M_xyyyyzzz* &
      z + M_xyyyzzzz*y + M_xyyzzzz*v43 + M_xyzzzz*v126 + M_xzzzz*v250 + &
      M_yyyyzzzz*x + v1*v149*v961 + v126*v454 + v126*v457 + v126*v459 + &
      v146*v430 + v146*v432 + v146*v434 + v246*v283 + v248*v283 + v249* &
      v283 + v250*v279 + v250*v281 + v250*v282 + v258*v696 + v269*v928 &
      + v43*v700 + v43*v702 + v43*v704 + v487*(v929 + v943) + v56*v681 &
      + v56*v682 + v56*v685 + v699*v962 + v931*z + v932*z + v933*z + &
      v936*y + v963*(v20*v57 + v27*v44 + v828))
    Ms_yyyyyzzzz = Ms_yyyyyzzzz + (0.000347222222222222d0*(v172*v734) + M_yyyyy*v283 + M_yyyyyz*v146 + &
      M_yyyyyzz*v56 + M_yyyyyzzz*z + M_yyyyyzzzz + M_yyyyzzzz*y + &
      M_yyyzz*v269 + M_yyyzzzz*v43 + M_yyz*v696 + M_yyzzzz*v126 + &
      M_yzzzz*v250 + M_zz*v927 + v1026*v963 + v126*v490 + v146*v472 + &
      v171*v428 + v250*v309 + v283*v284 + v43*v742 + v487*(v291 + v293 &
      ) + v56*v731 + v735*v961 + v741*v962 + v957*z + v958*v999)
    c5           = c2*c3
    v312         = c5
    v1110        = 0.00416666666666667d0*v312
    v467         = 0.00833333333333333d0*v312
    v752         = v1110
    v913         = v1110*v8
    v942         = v1110*v20
    v965         = v312*v64
    v1055        = 0.00138888888888889d0*v312
    Ms_zzzzz     = Ms_zzzzz + (M_zzzzz + v311 + M_z*v283 + M_zz*v146 + M_zzz*v56 + v174*v312)
    Ms_xzzzzz    = Ms_xzzzzz + (v464 + v465 + v466 + v1*v467 + v142*v56 + v146*v58 + v15*v283)
    Ms_yzzzzz    = Ms_yzzzzz + (v494 + v495 + v496 + v146*v71 + v166*v56 + v22*v283 + v3*v467)
    Ms_xxzzzzz   = Ms_xxzzzzz + (M_xxzzzzz + v664 + v665 + v666 + M_xxzzz*v56 + M_zzzzz*v32 + v114*v146 + &
      v119*v305 + v240*v56 + v245*v407 + v283*v39 + v311*v32 + v312* &
      v615 + v467*v6 + v492*v652)
    Ms_xyzzzzz   = Ms_xyzzzzz + (v712 + v713 + v714 + v715 + v13*v467 + v146*v462 + v278*v283 + v455*z + &
      v56*v718)
    Ms_yyzzzzz   = Ms_yyzzzzz + (M_yyzzzzz + v749 + v750 + v751 + M_yyzzz*v56 + M_z*v706 + M_zzzzz*v43 + &
      v146*v158 + v163*v305 + v19*v467 + v283*v66 + v299*v56 + v304* &
      v407 + v306*v752 + v311*v43)
    Ms_xxxzzzzz  = Ms_xxxzzzzz + (M_xxxzzzzz + v873 + M_xxxzzz*v56 + M_xxxzzzz*z + M_xzzz*v239 + M_xzzzzz* &
      v32 + M_zz*v605 + M_zzzzz*v82 + v146*v205 + v283*v91 + v29*v467 + &
      v311*v82 + v312*v842 + v32*v465 + v375*v56 + v378*(v141 + v143) + &
      v492*v868 + v570*v752 + v608*z + v610*v745 + v77*v854)
    Ms_xxyzzzzz  = Ms_xxyzzzzz + (M_xxyzzzzz + v910 + v911 + v912 + M_xxyzzz*v56 + M_xxyzzzz*z + M_yzzzzz* &
      v32 + v146*v915 + v166*v239 + v22*v661 + v283*v663 + v3*v913 + &
      v32*v493 + v32*v495 + v32*v496 + v37*v467 + v412*v56 + v413*v56 + &
      v414*v56 + v419*v71 + v656*z + v657*z + v660*z)
    Ms_xyyzzzzz  = Ms_xyyzzzzz + (M_xyyzzzzz + v939 + v940 + v941 + M_xyyzzz*v56 + M_xyyzzzz*z + M_xzzzzz* &
      v43 + v1*v942 + v142*v269 + v146*v944 + v15*v706 + v283*v708 + &
      v43*v463 + v43*v465 + v43*v466 + v445*v56 + v446*v56 + v447*v56 + &
      v452*v58 + v467*v48 + v701*z + v702*z + v705*z)
    Ms_yyyzzzzz  = Ms_yyyzzzzz + (M_yyyzzzzz + v964 + M_yyyzz*v146 + M_yyyzzz*v56 + M_yyyzzzz*z + M_yz* &
      v706 + M_yzzz*v269 + M_yzzzzz*v43 + M_zz*v696 + M_zzzzz*v126 + &
      v126*v311 + v146*v291 + v151*v283 + v314*v965 + v43*v495 + v467* &
      v63 + v483*v56 + v487*(v165 + v167) + v743*z + v745*v747 + v746* &
      v752)
    Ms_xxxxzzzzz = Ms_xxxxzzzzz + (M_xxxxzzzzz + M_xxxxzzzz*z + M_xxxzzzzz*x + M_xxzzz*v239 + M_xxzzzzz*v32 &
      + M_xzz*v605 + M_xzzzzz*v82 + M_zzzzz*v176 + v1014*v312 + v1015* &
      v312 + v1016*v752 + v1021*v172 + v1023*v77 + v1030*v27 + v1035* &
      v81 + v1036*v837 + v146*v347 + v176*v311 + v184*v283 + v32*v664 + &
      v378*(v240 + v242) + v465*v82 + v467*v79 + v56*v560 + v611*v836 + &
      v835*z)
    Ms_xxxyzzzzz = Ms_xxxyzzzzz + (M_xxxyzzzzz + M_xxxyzzz*v56 + M_xxxyzzzz*z + M_xxxzzzzz*y + M_xxyzzzzz*x &
      + M_xyzzzzz*v32 + M_yzzzzz*v82 + v1042*v3*v312 + v1043*v77 + v146 &
      *v367 + v146*v370 + v146*v372 + v202*v661 + v22*v872 + v239*v716 &
      + v283*(v1009 + v525) + v32*v709 + v32*v713 + v32*v714 + v378*( &
      v272 + v717) + v467*v88 + v493*v82 + v495*v82 + v496*v82 + v56* &
      v600 + v56*v601 + v56*v604 + v605*v71 + v869*z + v870*z + v871*z &
      + v873*y + v89*v913)
    Ms_xxyyzzzzz = Ms_xxyyzzzzz + (0.00208333333333333d0*(v312*v904) + M_xxyyzzz*v56 + M_xxyyzzzz*z + &
      M_xxyyzzzzz + M_xxyzzzzz*y + M_xxzzzzz*v43 + M_xyyzzzzz*x + &
      M_yyzzzzz*v32 + M_zzzzz*v218 + v101*v467 + v1034*v407 + v1058* &
      v407 + v146*(v1007 + v1132) + v218*v311 + v245*v411 + v305*(v402 &
      + v403 + v901 + v902) + v32*v749 + v32*v750 + v32*v751 + v407* &
      v647 + v407*v648 + v43*v664 + v43*v665 + v43*v666 + v492*v906 + &
      v56*v642 + v56*v643 + v56*v646 + v654*v752 + v898*z + v899*z + &
      v900*z + v903*v909 + v907*(v397 + v406) + v911*y)
    Ms_xyyyzzzzz = Ms_xyyyzzzzz + (M_xyyyzzzzz + M_xyyyzz*v146 + M_xyyyzzz*v56 + M_xyyyzzzz*z + M_xyyzzzzz* &
      y + M_xyzzzzz*v43 + M_xzzzzz*v126 + M_yyyzzzzz*x + v10*v942 + &
      v1061*v965 + v1062*v269 + v125*v467 + v126*v463 + v126*v465 + &
      v126*v466 + v146*v438 + v146*v441 + v146*v443 + v15*v938 + v258* &
      v706 + v283*(v1064 + v678) + v43*v710 + v43*v713 + v43*v715 + &
      v487*(v1063 + v273 + v276) + v56*v691 + v56*v692 + v56*v695 + v58 &
      *v696 + v935*z + v936*z + v937*z + v940*y)
    Ms_yyyyzzzzz = Ms_yyyyzzzzz + (0.000347222222222222d0*(v312*v480) + M_yy*v942 + M_yyyyz*v283 + M_yyyyzz &
      *v146 + M_yyyyzzz*v56 + M_yyyyzzzz*z + M_yyyyzzzzz + M_yyyzzzzz*y &
      + M_yyzzz*v269 + M_yyzzzzz*v43 + M_yzz*v696 + M_yzzzzz*v126 + &
      M_zzzzz*v250 + v1032*v963 + v1035*v149 + v126*v495 + v146*v477 + &
      v148*v467 + v250*v311 + v283*v288 + v43*v749 + v487*(v299 + v301 &
      ) + v56*v738 + v748*v962 + v960*z + v965*v993)
    c6           = c3*c3
    v498         = c6
    v1123        = 0.000694444444444444d0*v498
    v723         = 0.00138888888888889d0*v498
    v967         = v1123
    v1065        = v1123*v20
    Ms_zzzzzz    = Ms_zzzzzz + (M_zzzzzz + v497 + M_z*v467 + M_zz*v283 + M_zzz*v146 + M_zzzz*v56 + v314* &
      v498)
    Ms_xzzzzzz   = Ms_xzzzzzz + (v720 + v721 + v722 + v1*v723 + v142*v146 + v15*v467 + v280*v56 + v283* &
      v58)
    Ms_yzzzzzz   = Ms_yzzzzzz + (v754 + v755 + v756 + v146*v166 + v22*v467 + v283*v71 + v3*v723 + v308* &
      v56)
    Ms_xxzzzzzz  = Ms_xxzzzzzz + (M_xxzzzzzz + v916 + M_xxzzzz*v56 + M_xxzzzzz*z + M_zzzz*v239 + M_zzzzzz* &
      v32 + v114*v283 + v119*v492 + v146*v241 + v245*v305 + v32*v497 + &
      v39*v467 + v420*v56 + v498*v877 + v6*v723 + v652*v752 + v665*z)
    Ms_xyzzzzzz  = Ms_xyzzzzzz + (M_xyzzzzzz + v945 + v946 + v947 + M_xyzzzzz*z + v13*v723 + v146*v718 + &
      v278*v467 + v283*v462 + v456*v56 + v709*z + v710*z + v711*z)
    Ms_yyzzzzzz  = Ms_yyzzzzzz + (M_yyzzzzzz + v966 + M_yyzzzz*v56 + M_yyzzzzz*z + M_z*v942 + M_zzzz*v269 &
      + M_zzzzzz*v43 + v146*v300 + v158*v283 + v163*v492 + v19*v723 + &
      v304*v305 + v306*v967 + v43*v497 + v467*v66 + v488*v56 + v750*z)
    Ms_xxxzzzzzz = Ms_xxxzzzzzz + (M_xxxzzzzzz + M_xxxzzzz*v56 + M_xxxzzzzz*z + M_xxzzzzzz*x + M_xzzzz*v239 &
      + M_xzzzzzz*v32 + M_zzz*v605 + M_zzzzzz*v82 + v1038*v498 + v1049* &
      v77 + v1054*v31 + v1055*(v610 + v94) + v146*v375 + v206*v283 + &
      v210*v492 + v32*v721 + v378*(v279 + v281) + v467*v91 + v497*v82 + &
      v56*v608 + v570*v967 + v752*v868 + v873*z)
    Ms_xxyzzzzzz = Ms_xxyzzzzzz + (M_xxyzzzzzz + M_xxyzzzz*v56 + M_xxyzzzzz*z + M_xxzzzzzz*y + M_xyzzzzzz*x &
      + M_yzzzzzz*v32 + v146*v415 + v166*v419 + v22*v913 + v239*v308 + &
      v283*v915 + v3*v8*v967 + v32*v753 + v32*v755 + v32*v756 + v37* &
      v723 + v467*v663 + v56*v656 + v56*v657 + v56*v660 + v661*v71 + &
      v910*z + v911*z + v912*z + v916*y)
    Ms_xyyzzzzzz = Ms_xyyzzzzzz + (M_xyyzzzzzz + M_xyyzzzz*v56 + M_xyyzzzzz*z + M_xyzzzzzz*y + M_xzzzzzz* &
      v43 + M_yyzzzzzz*x + v1*v1065 + v142*v452 + v146*v448 + v15*v942 &
      + v269*v280 + v283*v944 + v43*v719 + v43*v721 + v43*v722 + v467* &
      v708 + v48*v723 + v56*v701 + v56*v702 + v56*v705 + v58*v706 + &
      v939*z + v940*z + v941*z + v946*y)
    Ms_yyyzzzzzz = Ms_yyyzzzzzz + (0.000231481481481481d0*(v298*v498) + M_yyyzzz*v146 + M_yyyzzzz*v56 + &
      M_yyyzzzzz*z + M_yyyzzzzzz + M_yyzzzzzz*y + M_yz*v942 + M_yzzzz* &
      v269 + M_yzzzzzz*v43 + M_zzz*v696 + M_zzzzzz*v126 + v1054*v64 + &
      v1055*(v154 + v747) + v126*v497 + v146*v483 + v151*v467 + v283* &
      v292 + v296*v492 + v43*v755 + v487*(v307 + v309) + v56*v743 + &
      v746*v967 + v964*z)
    c7           = c3*c4
    v758         = c7
    v949         = 0.000198412698412698d0*v758
    Ms_zzzzzzz   = Ms_zzzzzzz + (M_zzzzzzz + v757 + M_z*v723 + M_zz*v467 + M_zzz*v283 + M_zzzz*v146 + &
      M_zzzzz*v56 + v500*v758)
    Ms_xzzzzzzz  = Ms_xzzzzzzz + (M_xzzzzzzz + v948 + M_xzzzzzz*z + v1*v949 + v142*v283 + v146*v280 + v15* &
      v723 + v464*v56 + v467*v58 + v719*z)
    Ms_yzzzzzzz  = Ms_yzzzzzzz + (M_yzzzzzzz + v968 + M_yzzzzzz*z + v146*v308 + v166*v283 + v22*v723 + v3* &
      v949 + v467*v71 + v494*v56 + v753*z)
    Ms_xxzzzzzzz = Ms_xxzzzzzzz + (M_xxzzzzzzz + M_xxzzzzz*v56 + M_xxzzzzzz*z + M_xzzzzzzz*x + M_zzzz*v419 &
      + M_zzzzz*v239 + M_zzzzzzz*v32 + v1056*v758 + v114*v467 + v119* &
      v752 + v146*v421 + v241*v283 + v245*v492 + v32*v757 + v39*v723 + &
      v56*v665 + v6*v949 + v652*v967 + v916*z)
    Ms_xyzzzzzzz = Ms_xyzzzzzzz + (M_xyzzzzzzz + M_xyzzzzzz*z + M_xzzzzzzz*y + M_yzzzzzzz*x + v13*v949 + &
      v146*v456 + v278*v723 + v283*v718 + v462*v467 + v56*v712 + v945*z &
      + v946*z + v947*z + v948*y)
    Ms_yyzzzzzzz = Ms_yyzzzzzzz + (9.92063492063492d-5*(v306*v758) + M_yyzzzzz*v56 + M_yyzzzzzz*z + &
      M_yyzzzzzzz + M_yzzzzzzz*y + M_z*v1065 + M_zzzz*v452 + M_zzzzz* &
      v269 + M_zzzzzzz*v43 + v146*v489 + v158*v467 + v163*v752 + v19* &
      v949 + v283*v300 + v304*v492 + v43*v757 + v56*v750 + v66*v723 + &
      v966*z)
    c8           = c4*c4
    v969         = c8
    v1066        = 2.48015873015873d-5*v969
    Ms_zzzzzzzz  = Ms_zzzzzzzz + (M_zzzzzzzz + M_z*v949 + M_zz*v723 + M_zzz*v467 + M_zzzz*v283 + M_zzzzz* &
      v146 + M_zzzzzz*v56 + M_zzzzzzz*z + v760*v969)
    Ms_xzzzzzzzz = Ms_xzzzzzzzz + (M_xzzzzzzzz + M_xzzzzzzz*z + M_zzzzzzzz*x + v1*v1066 + v142*v467 + v146* &
      v464 + v15*v949 + v280*v283 + v56*v720 + v58*v723 + v948*z)
    Ms_yzzzzzzzz = Ms_yzzzzzzzz + (M_yzzzzzzzz + M_yzzzzzzz*z + M_zzzzzzzz*y + v1066*v3 + v146*v494 + v166* &
      v467 + v22*v949 + v283*v308 + v56*v754 + v71*v723 + v968*z)
    c9           = c4*c5
    Ms_zzzzzzzzz = Ms_zzzzzzzzz + (M_zzzzzzzzz + M_z*v1066 + M_zz*v949 + M_zzz*v723 + M_zzzz*v467 + M_zzzzz &
      *v283 + M_zzzzzz*v146 + M_zzzzzzz*v56 + M_zzzzzzzz*z + c9*v970)
#undef  y                   
#undef  z                   
#undef  M_0                 
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
#undef  Ms_zz               
#undef  M_zz                
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
#undef  M_yyy               
#undef  Ms_yyy              
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
#undef  M_xxxz              
#undef  Ms_xxxz             
#undef  M_xxyy              
#undef  Ms_xxyy             
#undef  Ms_xxyz             
#undef  M_xxyz              
#undef  M_xxzz              
#undef  Ms_xxzz             
#undef  Ms_xyyy             
#undef  M_xyyy              
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  Ms_xyzz             
#undef  M_xyzz              
#undef  Ms_xzzz             
#undef  M_xzzz              
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  M_yyyz              
#undef  Ms_yyyz             
#undef  Ms_yyzz             
#undef  M_yyzz              
#undef  Ms_yzzz             
#undef  M_yzzz              
#undef  M_zzzz              
#undef  Ms_zzzz             
#undef  M_xxxxx             
#undef  Ms_xxxxx            
#undef  Ms_xxxxy            
#undef  M_xxxxy             
#undef  M_xxxxz             
#undef  Ms_xxxxz            
#undef  M_xxxyy             
#undef  Ms_xxxyy            
#undef  Ms_xxxyz            
#undef  M_xxxyz             
#undef  Ms_xxxzz            
#undef  M_xxxzz             
#undef  Ms_xxyyy            
#undef  M_xxyyy             
#undef  M_xxyyz             
#undef  Ms_xxyyz            
#undef  Ms_xxyzz            
#undef  M_xxyzz             
#undef  M_xxzzz             
#undef  Ms_xxzzz            
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  Ms_xyyzz            
#undef  M_xyyzz             
#undef  M_xyzzz             
#undef  Ms_xyzzz            
#undef  M_xzzzz             
#undef  Ms_xzzzz            
#undef  Ms_yyyyy            
#undef  M_yyyyy             
#undef  Ms_yyyyz            
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  Ms_yyyzz            
#undef  Ms_yyzzz            
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  Ms_yzzzz            
#undef  M_zzzzz             
#undef  Ms_zzzzz            
#undef  M_xxxxxx            
#undef  Ms_xxxxxx           
#undef  Ms_xxxxxy           
#undef  M_xxxxxy            
#undef  Ms_xxxxxz           
#undef  M_xxxxxz            
#undef  Ms_xxxxyy           
#undef  M_xxxxyy            
#undef  M_xxxxyz            
#undef  Ms_xxxxyz           
#undef  Ms_xxxxzz           
#undef  M_xxxxzz            
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
#undef  M_xxyyyz            
#undef  Ms_xxyyyz           
#undef  M_xxyyzz            
#undef  Ms_xxyyzz           
#undef  M_xxyzzz            
#undef  Ms_xxyzzz           
#undef  M_xxzzzz            
#undef  Ms_xxzzzz           
#undef  M_xyyyyy            
#undef  Ms_xyyyyy           
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  Ms_xyyyzz           
#undef  M_xyyyzz            
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
#undef  M_yyyyzz            
#undef  Ms_yyyyzz           
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
#undef  M_xxxxxxy           
#undef  Ms_xxxxxxy          
#undef  M_xxxxxxz           
#undef  Ms_xxxxxxz          
#undef  Ms_xxxxxyy          
#undef  M_xxxxxyy           
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
#undef  Ms_xxxxzzz          
#undef  M_xxxxzzz           
#undef  Ms_xxxyyyy          
#undef  M_xxxyyyy           
#undef  Ms_xxxyyyz          
#undef  M_xxxyyyz           
#undef  Ms_xxxyyzz          
#undef  M_xxxyyzz           
#undef  Ms_xxxyzzz          
#undef  M_xxxyzzz           
#undef  Ms_xxxzzzz          
#undef  M_xxxzzzz           
#undef  Ms_xxyyyyy          
#undef  M_xxyyyyy           
#undef  Ms_xxyyyyz          
#undef  M_xxyyyyz           
#undef  M_xxyyyzz           
#undef  Ms_xxyyyzz          
#undef  Ms_xxyyzzz          
#undef  M_xxyyzzz           
#undef  Ms_xxyzzzz          
#undef  M_xxyzzzz           
#undef  M_xxzzzzz           
#undef  Ms_xxzzzzz          
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyz          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyzz          
#undef  M_xyyyyzz           
#undef  Ms_xyyyzzz          
#undef  M_xyyyzzz           
#undef  Ms_xyyzzzz          
#undef  M_xyyzzzz           
#undef  Ms_xyzzzzz          
#undef  M_xyzzzzz           
#undef  Ms_xzzzzzz          
#undef  M_xzzzzzz           
#undef  M_yyyyyyy           
#undef  Ms_yyyyyyy          
#undef  M_yyyyyyz           
#undef  Ms_yyyyyyz          
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
#undef  M_zzzzzzz           
#undef  Ms_zzzzzzz          
#undef  M_xxxxxxxx          
#undef  Ms_xxxxxxxx         
#undef  M_xxxxxxxy          
#undef  Ms_xxxxxxxy         
#undef  Ms_xxxxxxxz         
#undef  M_xxxxxxxz          
#undef  Ms_xxxxxxyy         
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  Ms_xxxxxxyz         
#undef  Ms_xxxxxxzz         
#undef  M_xxxxxxzz          
#undef  M_xxxxxyyy          
#undef  Ms_xxxxxyyy         
#undef  Ms_xxxxxyyz         
#undef  M_xxxxxyyz          
#undef  M_xxxxxyzz          
#undef  Ms_xxxxxyzz         
#undef  Ms_xxxxxzzz         
#undef  M_xxxxxzzz          
#undef  M_xxxxyyyy          
#undef  Ms_xxxxyyyy         
#undef  M_xxxxyyyz          
#undef  Ms_xxxxyyyz         
#undef  M_xxxxyyzz          
#undef  Ms_xxxxyyzz         
#undef  Ms_xxxxyzzz         
#undef  M_xxxxyzzz          
#undef  M_xxxxzzzz          
#undef  Ms_xxxxzzzz         
#undef  M_xxxyyyyy          
#undef  Ms_xxxyyyyy         
#undef  M_xxxyyyyz          
#undef  Ms_xxxyyyyz         
#undef  Ms_xxxyyyzz         
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  Ms_xxxyyzzz         
#undef  M_xxxyzzzz          
#undef  Ms_xxxyzzzz         
#undef  Ms_xxxzzzzz         
#undef  M_xxxzzzzz          
#undef  M_xxyyyyyy          
#undef  Ms_xxyyyyyy         
#undef  M_xxyyyyyz          
#undef  Ms_xxyyyyyz         
#undef  M_xxyyyyzz          
#undef  Ms_xxyyyyzz         
#undef  Ms_xxyyyzzz         
#undef  M_xxyyyzzz          
#undef  Ms_xxyyzzzz         
#undef  M_xxyyzzzz          
#undef  Ms_xxyzzzzz         
#undef  M_xxyzzzzz          
#undef  M_xxzzzzzz          
#undef  Ms_xxzzzzzz         
#undef  Ms_xyyyyyyy         
#undef  M_xyyyyyyy          
#undef  Ms_xyyyyyyz         
#undef  M_xyyyyyyz          
#undef  M_xyyyyyzz          
#undef  Ms_xyyyyyzz         
#undef  M_xyyyyzzz          
#undef  Ms_xyyyyzzz         
#undef  M_xyyyzzzz          
#undef  Ms_xyyyzzzz         
#undef  M_xyyzzzzz          
#undef  Ms_xyyzzzzz         
#undef  M_xyzzzzzz          
#undef  Ms_xyzzzzzz         
#undef  M_xzzzzzzz          
#undef  Ms_xzzzzzzz         
#undef  Ms_yyyyyyyy         
#undef  M_yyyyyyyy          
#undef  Ms_yyyyyyyz         
#undef  M_yyyyyyyz          
#undef  Ms_yyyyyyzz         
#undef  M_yyyyyyzz          
#undef  Ms_yyyyyzzz         
#undef  M_yyyyyzzz          
#undef  M_yyyyzzzz          
#undef  Ms_yyyyzzzz         
#undef  M_yyyzzzzz          
#undef  Ms_yyyzzzzz         
#undef  Ms_yyzzzzzz         
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  Ms_yzzzzzzz         
#undef  Ms_zzzzzzzz         
#undef  M_zzzzzzzz          
#undef  Ms_xxxxxxxxx        
#undef  M_xxxxxxxxx         
#undef  M_xxxxxxxxy         
#undef  Ms_xxxxxxxxy        
#undef  Ms_xxxxxxxxz        
#undef  M_xxxxxxxxz         
#undef  Ms_xxxxxxxyy        
#undef  M_xxxxxxxyy         
#undef  M_xxxxxxxyz         
#undef  Ms_xxxxxxxyz        
#undef  Ms_xxxxxxxzz        
#undef  M_xxxxxxxzz         
#undef  M_xxxxxxyyy         
#undef  Ms_xxxxxxyyy        
#undef  Ms_xxxxxxyyz        
#undef  M_xxxxxxyyz         
#undef  Ms_xxxxxxyzz        
#undef  M_xxxxxxyzz         
#undef  Ms_xxxxxxzzz        
#undef  M_xxxxxxzzz         
#undef  M_xxxxxyyyy         
#undef  Ms_xxxxxyyyy        
#undef  M_xxxxxyyyz         
#undef  Ms_xxxxxyyyz        
#undef  M_xxxxxyyzz         
#undef  Ms_xxxxxyyzz        
#undef  M_xxxxxyzzz         
#undef  Ms_xxxxxyzzz        
#undef  M_xxxxxzzzz         
#undef  Ms_xxxxxzzzz        
#undef  M_xxxxyyyyy         
#undef  Ms_xxxxyyyyy        
#undef  Ms_xxxxyyyyz        
#undef  M_xxxxyyyyz         
#undef  Ms_xxxxyyyzz        
#undef  M_xxxxyyyzz         
#undef  M_xxxxyyzzz         
#undef  Ms_xxxxyyzzz        
#undef  M_xxxxyzzzz         
#undef  Ms_xxxxyzzzz        
#undef  Ms_xxxxzzzzz        
#undef  M_xxxxzzzzz         
#undef  M_xxxyyyyyy         
#undef  Ms_xxxyyyyyy        
#undef  M_xxxyyyyyz         
#undef  Ms_xxxyyyyyz        
#undef  M_xxxyyyyzz         
#undef  Ms_xxxyyyyzz        
#undef  M_xxxyyyzzz         
#undef  Ms_xxxyyyzzz        
#undef  Ms_xxxyyzzzz        
#undef  M_xxxyyzzzz         
#undef  Ms_xxxyzzzzz        
#undef  M_xxxyzzzzz         
#undef  Ms_xxxzzzzzz        
#undef  M_xxxzzzzzz         
#undef  M_xxyyyyyyy         
#undef  Ms_xxyyyyyyy        
#undef  Ms_xxyyyyyyz        
#undef  M_xxyyyyyyz         
#undef  Ms_xxyyyyyzz        
#undef  M_xxyyyyyzz         
#undef  M_xxyyyyzzz         
#undef  Ms_xxyyyyzzz        
#undef  M_xxyyyzzzz         
#undef  Ms_xxyyyzzzz        
#undef  M_xxyyzzzzz         
#undef  Ms_xxyyzzzzz        
#undef  Ms_xxyzzzzzz        
#undef  M_xxyzzzzzz         
#undef  Ms_xxzzzzzzz        
#undef  M_xxzzzzzzz         
#undef  M_xyyyyyyyy         
#undef  Ms_xyyyyyyyy        
#undef  Ms_xyyyyyyyz        
#undef  M_xyyyyyyyz         
#undef  Ms_xyyyyyyzz        
#undef  M_xyyyyyyzz         
#undef  Ms_xyyyyyzzz        
#undef  M_xyyyyyzzz         
#undef  Ms_xyyyyzzzz        
#undef  M_xyyyyzzzz         
#undef  M_xyyyzzzzz         
#undef  Ms_xyyyzzzzz        
#undef  M_xyyzzzzzz         
#undef  Ms_xyyzzzzzz        
#undef  Ms_xyzzzzzzz        
#undef  M_xyzzzzzzz         
#undef  M_xzzzzzzzz         
#undef  Ms_xzzzzzzzz        
#undef  Ms_yyyyyyyyy        
#undef  M_yyyyyyyyy         
#undef  M_yyyyyyyyz         
#undef  Ms_yyyyyyyyz        
#undef  M_yyyyyyyzz         
#undef  Ms_yyyyyyyzz        
#undef  Ms_yyyyyyzzz        
#undef  M_yyyyyyzzz         
#undef  M_yyyyyzzzz         
#undef  Ms_yyyyyzzzz        
#undef  M_yyyyzzzzz         
#undef  Ms_yyyyzzzzz        
#undef  M_yyyzzzzzz         
#undef  Ms_yyyzzzzzz        
#undef  M_yyzzzzzzz         
#undef  Ms_yyzzzzzzz        
#undef  Ms_yzzzzzzzz        
#undef  M_yzzzzzzzz         
#undef  Ms_zzzzzzzzz        
#undef  M_zzzzzzzzz         
    end subroutine mom_es_M2M_add
    
! OPS  3371*ADD + 2*DIV + 3770*MUL + 169*NEG + POW + 84*SUB = 7397  (9601 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v207, v208, v209, v21, v22, v23, v24, v25, v26, v27, v28, v29,&
                v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
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
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx, D_xxxxxxxy,&
                D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz, D_xxxxxyyy,&
                D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy, D_xxxxyyyz,&
                D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy, D_xxxyyyyz,&
                D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz, D_xxyyyyyy,&
                D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz, D_xxyzzzzz,&
                D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz, D_xyyyyzzz,&
                D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz, D_yyyyyyyy,&
                D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz, D_yyyzzzzz,&
                D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, D_xxxxxxxxx, D_xxxxxxxxy,&
                D_xxxxxxxxz, D_xxxxxxxyy, D_xxxxxxxyz, D_xxxxxxxzz,&
                D_xxxxxxyyy, D_xxxxxxyyz, D_xxxxxxyzz, D_xxxxxxzzz,&
                D_xxxxxyyyy, D_xxxxxyyyz, D_xxxxxyyzz, D_xxxxxyzzz,&
                D_xxxxxzzzz, D_xxxxyyyyy, D_xxxxyyyyz, D_xxxxyyyzz,&
                D_xxxxyyzzz, D_xxxxyzzzz, D_xxxxzzzzz, D_xxxyyyyyy,&
                D_xxxyyyyyz, D_xxxyyyyzz, D_xxxyyyzzz, D_xxxyyzzzz,&
                D_xxxyzzzzz, D_xxxzzzzzz, D_xxyyyyyyy, D_xxyyyyyyz,&
                D_xxyyyyyzz, D_xxyyyyzzz, D_xxyyyzzzz, D_xxyyzzzzz,&
                D_xxyzzzzzz, D_xxzzzzzzz, D_xyyyyyyyy, D_xyyyyyyyz,&
                D_xyyyyyyzz, D_xyyyyyzzz, D_xyyyyzzzz, D_xyyyzzzzz,&
                D_xyyzzzzzz, D_xyzzzzzzz, D_xzzzzzzzz, D_yyyyyyyyy,&
                D_yyyyyyyyz, D_yyyyyyyzz, D_yyyyyyzzz, D_yyyyyzzzz,&
                D_yyyyzzzzz, D_yyyzzzzzz, D_yyzzzzzzz, D_yzzzzzzzz,&
                D_zzzzzzzzz
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define L_y                  L(2)
#define M_y                  M(2)
#define L_z                  L(3)
#define M_z                  M(3)
#define L_xx                 L(4)
#define M_xx                 M(4)
#define L_xy                 L(5)
#define M_xy                 M(5)
#define L_xz                 L(6)
#define M_xz                 M(6)
#define M_yy                 M(7)
#define L_yy                 L(7)
#define L_yz                 L(8)
#define M_yz                 M(8)
#define M_zz                 M(9)
#define L_xxx                L(9)
#define M_xxx                M(10)
#define L_xxy                L(10)
#define L_xxz                L(11)
#define M_xxy                M(11)
#define M_xxz                M(12)
#define L_xyy                L(12)
#define M_xyy                M(13)
#define L_xyz                L(13)
#define M_xyz                M(14)
#define L_yyy                L(14)
#define L_yyz                L(15)
#define M_xzz                M(15)
#define M_yyy                M(16)
#define L_xxxx               L(16)
#define M_yyz                M(17)
#define L_xxxy               L(17)
#define M_yzz                M(18)
#define L_xxxz               L(18)
#define L_xxyy               L(19)
#define M_zzz                M(19)
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
#define L_xxxxx              L(25)
#define L_xxxxy              L(26)
#define M_xyyy               M(26)
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
#define L_xyyyz              L(33)
#define M_yzzz               M(33)
#define L_yyyyy              L(34)
#define M_zzzz               M(34)
#define L_yyyyz              L(35)
#define M_xxxxx              M(35)
#define L_xxxxxx             L(36)
#define M_xxxxy              M(36)
#define L_xxxxxy             L(37)
#define M_xxxxz              M(37)
#define L_xxxxxz             L(38)
#define M_xxxyy              M(38)
#define L_xxxxyy             L(39)
#define M_xxxyz              M(39)
#define L_xxxxyz             L(40)
#define M_xxxzz              M(40)
#define L_xxxyyy             L(41)
#define M_xxyyy              M(41)
#define L_xxxyyz             L(42)
#define M_xxyyz              M(42)
#define M_xxyzz              M(43)
#define L_xxyyyy             L(43)
#define M_xxzzz              M(44)
#define L_xxyyyz             L(44)
#define M_xyyyy              M(45)
#define L_xyyyyy             L(45)
#define M_xyyyz              M(46)
#define L_xyyyyz             L(46)
#define M_xyyzz              M(47)
#define L_yyyyyy             L(47)
#define L_yyyyyz             L(48)
#define M_xyzzz              M(48)
#define M_xzzzz              M(49)
#define L_xxxxxxx            L(49)
#define L_xxxxxxy            L(50)
#define M_yyyyy              M(50)
#define L_xxxxxxz            L(51)
#define M_yyyyz              M(51)
#define M_yyyzz              M(52)
#define L_xxxxxyy            L(52)
#define L_xxxxxyz            L(53)
#define M_yyzzz              M(53)
#define M_yzzzz              M(54)
#define L_xxxxyyy            L(54)
#define M_zzzzz              M(55)
#define L_xxxxyyz            L(55)
#define M_xxxxxx             M(56)
#define L_xxxyyyy            L(56)
#define L_xxxyyyz            L(57)
#define M_xxxxxy             M(57)
#define M_xxxxxz             M(58)
#define L_xxyyyyy            L(58)
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
#define L_xxxxxxxx           L(64)
#define M_xxxyzz             M(64)
#define M_xxxzzz             M(65)
#define L_xxxxxxxy           L(65)
#define L_xxxxxxxz           L(66)
#define M_xxyyyy             M(66)
#define L_xxxxxxyy           L(67)
#define M_xxyyyz             M(67)
#define M_xxyyzz             M(68)
#define L_xxxxxxyz           L(68)
#define M_xxyzzz             M(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define M_xxzzzz             M(70)
#define L_xxxxyyyy           L(71)
#define M_xyyyyy             M(71)
#define L_xxxxyyyz           L(72)
#define M_xyyyyz             M(72)
#define M_xyyyzz             M(73)
#define L_xxxyyyyy           L(73)
#define M_xyyzzz             M(74)
#define L_xxxyyyyz           L(74)
#define L_xxyyyyyy           L(75)
#define M_xyzzzz             M(75)
#define M_xzzzzz             M(76)
#define L_xxyyyyyz           L(76)
#define M_yyyyyy             M(77)
#define L_xyyyyyyy           L(77)
#define M_yyyyyz             M(78)
#define L_xyyyyyyz           L(78)
#define L_yyyyyyyy           L(79)
#define M_yyyyzz             M(79)
#define L_yyyyyyyz           L(80)
#define M_yyyzzz             M(80)
#define L_xxxxxxxxx          L(81)
#define M_yyzzzz             M(81)
#define M_yzzzzz             M(82)
#define L_xxxxxxxxy          L(82)
#define L_xxxxxxxxz          L(83)
#define M_zzzzzz             M(83)
#define L_xxxxxxxyy          L(84)
#define M_xxxxxxx            M(84)
#define L_xxxxxxxyz          L(85)
#define M_xxxxxxy            M(85)
#define M_xxxxxxz            M(86)
#define L_xxxxxxyyy          L(86)
#define L_xxxxxxyyz          L(87)
#define M_xxxxxyy            M(87)
#define M_xxxxxyz            M(88)
#define L_xxxxxyyyy          L(88)
#define M_xxxxxzz            M(89)
#define L_xxxxxyyyz          L(89)
#define M_xxxxyyy            M(90)
#define L_xxxxyyyyy          L(90)
#define L_xxxxyyyyz          L(91)
#define M_xxxxyyz            M(91)
#define M_xxxxyzz            M(92)
#define L_xxxyyyyyy          L(92)
#define M_xxxxzzz            M(93)
#define L_xxxyyyyyz          L(93)
#define L_xxyyyyyyy          L(94)
#define M_xxxyyyy            M(94)
#define M_xxxyyyz            M(95)
#define L_xxyyyyyyz          L(95)
#define L_xyyyyyyyy          L(96)
#define M_xxxyyzz            M(96)
#define M_xxxyzzz            M(97)
#define L_xyyyyyyyz          L(97)
#define M_xxxzzzz            M(98)
#define L_yyyyyyyyy          L(98)
#define L_yyyyyyyyz          L(99)
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
#define M_xxxxxxxx           M(120)
#define M_xxxxxxxy           M(121)
#define M_xxxxxxxz           M(122)
#define M_xxxxxxyy           M(123)
#define M_xxxxxxyz           M(124)
#define M_xxxxxxzz           M(125)
#define M_xxxxxyyy           M(126)
#define M_xxxxxyyz           M(127)
#define M_xxxxxyzz           M(128)
#define M_xxxxxzzz           M(129)
#define M_xxxxyyyy           M(130)
#define M_xxxxyyyz           M(131)
#define M_xxxxyyzz           M(132)
#define M_xxxxyzzz           M(133)
#define M_xxxxzzzz           M(134)
#define M_xxxyyyyy           M(135)
#define M_xxxyyyyz           M(136)
#define M_xxxyyyzz           M(137)
#define M_xxxyyzzz           M(138)
#define M_xxxyzzzz           M(139)
#define M_xxxzzzzz           M(140)
#define M_xxyyyyyy           M(141)
#define M_xxyyyyyz           M(142)
#define M_xxyyyyzz           M(143)
#define M_xxyyyzzz           M(144)
#define M_xxyyzzzz           M(145)
#define M_xxyzzzzz           M(146)
#define M_xxzzzzzz           M(147)
#define M_xyyyyyyy           M(148)
#define M_xyyyyyyz           M(149)
#define M_xyyyyyzz           M(150)
#define M_xyyyyzzz           M(151)
#define M_xyyyzzzz           M(152)
#define M_xyyzzzzz           M(153)
#define M_xyzzzzzz           M(154)
#define M_xzzzzzzz           M(155)
#define M_yyyyyyyy           M(156)
#define M_yyyyyyyz           M(157)
#define M_yyyyyyzz           M(158)
#define M_yyyyyzzz           M(159)
#define M_yyyyzzzz           M(160)
#define M_yyyzzzzz           M(161)
#define M_yyzzzzzz           M(162)
#define M_yzzzzzzz           M(163)
#define M_zzzzzzzz           M(164)
#define M_xxxxxxxxx          M(165)
#define M_xxxxxxxxy          M(166)
#define M_xxxxxxxxz          M(167)
#define M_xxxxxxxyy          M(168)
#define M_xxxxxxxyz          M(169)
#define M_xxxxxxxzz          M(170)
#define M_xxxxxxyyy          M(171)
#define M_xxxxxxyyz          M(172)
#define M_xxxxxxyzz          M(173)
#define M_xxxxxxzzz          M(174)
#define M_xxxxxyyyy          M(175)
#define M_xxxxxyyyz          M(176)
#define M_xxxxxyyzz          M(177)
#define M_xxxxxyzzz          M(178)
#define M_xxxxxzzzz          M(179)
#define M_xxxxyyyyy          M(180)
#define M_xxxxyyyyz          M(181)
#define M_xxxxyyyzz          M(182)
#define M_xxxxyyzzz          M(183)
#define M_xxxxyzzzz          M(184)
#define M_xxxxzzzzz          M(185)
#define M_xxxyyyyyy          M(186)
#define M_xxxyyyyyz          M(187)
#define M_xxxyyyyzz          M(188)
#define M_xxxyyyzzz          M(189)
#define M_xxxyyzzzz          M(190)
#define M_xxxyzzzzz          M(191)
#define M_xxxzzzzzz          M(192)
#define M_xxyyyyyyy          M(193)
#define M_xxyyyyyyz          M(194)
#define M_xxyyyyyzz          M(195)
#define M_xxyyyyzzz          M(196)
#define M_xxyyyzzzz          M(197)
#define M_xxyyzzzzz          M(198)
#define M_xxyzzzzzz          M(199)
#define M_xxzzzzzzz          M(200)
#define M_xyyyyyyyy          M(201)
#define M_xyyyyyyyz          M(202)
#define M_xyyyyyyzz          M(203)
#define M_xyyyyyzzz          M(204)
#define M_xyyyyzzzz          M(205)
#define M_xyyyzzzzz          M(206)
#define M_xyyzzzzzz          M(207)
#define M_xyzzzzzzz          M(208)
#define M_xzzzzzzzz          M(209)
#define M_yyyyyyyyy          M(210)
#define M_yyyyyyyyz          M(211)
#define M_yyyyyyyzz          M(212)
#define M_yyyyyyzzz          M(213)
#define M_yyyyyzzzz          M(214)
#define M_yyyyzzzzz          M(215)
#define M_yyyzzzzzz          M(216)
#define M_yyzzzzzzz          M(217)
#define M_yzzzzzzzz          M(218)
#define M_zzzzzzzzz          M(219)
    v204        = y*z
    v205        = x*y
    v184        = 15.0d0*v204
    v186        = v205
    v188        = v204
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v0          = a2
    v155        = 5.0d0*v0
    v5          = 3.0d0*v0
    v10         = v155
    v24         = 7.0d0*v0
    a3          = a1*a2
    a4          = a2*a2
    v19         = a4
    v159        = 143.0d0*v19
    v54         = 33.0d0*v19
    v82         = v159
    a5          = a2*a3
    a6          = a3*a3
    v49         = a6
    v73         = 429.0d0*v49
    v74         = -v73
    v105        = 715.0d0*v49
    a7          = a3*a4
    a8          = a4*a4
    v99         = a8
    a9          = a4*a5
    b2          = b1*b1
    v1          = b2
    v156        = v0*v1
    v7          = 3.0d0*v1
    v14         = 5.0d0*v1
    v157        = v1*v19
    v27         = v156
    v29         = 7.0d0*v1
    v161        = v1*v49
    v59         = v157
    v80         = -429.0d0*v59
    v111        = v161
    b3          = b1*b2
    b4          = b2*b2
    v31         = b4
    v158        = v0*v31
    v160        = 143.0d0*v31
    v162        = v19*v31
    v65         = v158
    v66         = 33.0d0*v31
    v90         = v160
    v91         = -429.0d0*v65
    v121        = v162
    v148        = -12155.0d0*v121
    b5          = b2*b3
    b6          = b3*b3
    v68         = b6
    v163        = v0*v68
    v92         = 429.0d0*v68
    v93         = -v92
    v127        = v163
    v128        = 715.0d0*v68
    b7          = b3*b4
    b8          = b4*b4
    v130        = b8
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v0 + v1
    v164        = 3.0d0*h
    v165        = h*v0
    v166        = h*v1
    v167        = h*v19
    v169        = v1*v165
    v171        = h*v31
    v172        = h*v49
    v176        = v166*v19
    v178        = v165*v31
    v180        = h*v68
    v4          = -h
    v12         = v164
    v13         = -15.0d0*v1 + v12
    v17         = h*h
    v168        = v0*v17
    v170        = v1*v17
    v173        = v17*v19
    v175        = v156*v17
    v179        = v17*v31
    v18         = 3.0d0*v17
    v20         = v165
    v21         = -30.0d0*v20
    v23         = -v12
    v25         = v23 + v24
    v30         = v23 + v29
    v32         = v166
    v33         = -30.0d0*v32
    v36         = -15.0d0*v17
    v37         = -45.0d0*v17
    v38         = v37 + 630.0d0*v165 - 945.0d0*v19
    v40         = -(v18 + 63.0d0*v27)
    v43         = v37 + 630.0d0*v166 - 945.0d0*v31
    v46         = h*h*h
    v174        = v0*v46
    v177        = v1*v46
    v47         = 5.0d0*v46
    v48         = -v47
    v50         = v167
    v51         = v168
    v53         = 5.0d0*v17
    v55         = v21 + v53 + v54
    v57         = v169
    v58         = -(v46 + 126.0d0*v57)
    v61         = -v0*v12
    v62         = -v1*v12
    v63         = v17 + 33.0d0*v27
    v64         = v170
    v67         = v33 + v53 + v66
    v69         = v171
    v72         = 35.0d0*v46
    v76         = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78         = v47 + 330.0d0*v57
    v79         = h*v54
    v84         = -18.0d0*v51 + v46 + v79
    v85         = 66.0d0*v57
    v197        = -v85
    v86         = 9.0d0*v17
    v87         = 198.0d0*v57
    v88         = h*v66
    v89         = -18.0d0*v64 + v46 + v88
    v94         = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97         = h*h*h*h
    v98         = 35.0d0*v97
    v100        = v172
    v101        = v173
    v102        = v174
    v104        = -v72
    v106        = v104 + v105 - 1001.0d0*v50 + 385.0d0*v51
    v108        = v175
    v109        = 5.0d0*(297.0d0*v108 + v97)
    v198        = -v109
    v110        = 45.0d0*v46
    v112        = v176
    v114        = -14175.0d0*v46
    v116        = -v110
    v117        = -1430.0d0*v57
    v199        = v116 + v117
    v119        = -1351350.0d0*v169
    v200        = v114 + v119
    v120        = v177
    v122        = v178
    v124        = 3.0d0*v46
    v125        = -(v124 + 286.0d0*v57)
    v126        = v179
    v129        = v104 + v128 + 385.0d0*v64 - 1001.0d0*v69
    v131        = v180
    v134        = -315.0d0*v97
    v136        = -99225.0d0*v97
    v137        = v136 + 56756700.0d0*v172 - 28378350.0d0*v173 + 4365900.0d0*v174 - &
      34459425.0d0*v99
    v139        = 385.0d0*(v102 + v120) - (5005.0d0*v108 + v98)
    v141        = 7.0d0*v46
    v142        = -42525.0d0*v97
    v143        = -6081075.0d0*v175
    v201        = v142 + v143
    v145        = -(429.0d0*v108 + v97)
    v146        = -v17*v82
    v147        = -15.0d0*v97
    v149        = -2860.0d0*v108
    v202        = v147 + v148 + v149
    v150        = v124 + 130.0d0*v57
    v203        = -v150
    v152        = -v17*v90
    v154        = v136 - 34459425.0d0*v130 + 4365900.0d0*v177 - 28378350.0d0*v179 + &
      56756700.0d0*v180
    u2          = 1.0/h
    u           = sqrt(u2)
    D_0         = u
    u3          = u*u2
    v2          = u3
    D_x         = -v2*x
    D_y         = -v2*y
    D_z         = -v2*z
    u4          = u2*u2
    u5          = u2*u3
    v3          = u5
    v181        = 3.0d0*v3
    v6          = v181*x
    D_xx        = v3*(v4 + v5)
    D_xy        = v6*y
    D_xz        = v6*z
    D_yy        = v3*(v4 + v7)
    D_yz        = v181*v188
    D_zz        = -(D_xx + D_yy)
    u6          = u3*u3
    u7          = u3*u4
    v8          = u7
    v182        = 3.0d0*v8
    v9          = v8*x
    v11         = v182*(h - v10)
    D_xxx       = -3.0d0*v9*(v155 - v164)
    D_xxy       = v11*y
    D_xxz       = v11*z
    D_xyy       = v13*v9
    D_xyz       = -v184*v9
    D_xzz       = -(D_xxx + D_xyy)
    D_yyy       = v182*y*(v12 - v14)
    D_yyz       = v13*v8*z
    D_yzz       = -(D_xxy + D_yyy)
    D_zzz       = -(D_xxz + D_yyz)
    u8          = u4*u4
    u9          = u4*u5
    v15         = u9
    v183        = 15.0d0*v15*x
    v16         = 3.0d0*v15
    v22         = v183*y
    v26         = v183*z
    v28         = v15*v184
    D_xxxx      = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy      = v22*v25
    D_xxxz      = v25*v26
    D_xxyy      = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz      = v28*(v24 + v4)
    D_xxzz      = -(D_xxxx + D_xxyy)
    D_xyyy      = v22*v30
    D_xyyz      = v26*(v29 + v4)
    D_xyzz      = -(D_xxxy + D_xyyy)
    D_xzzz      = -(D_xxxz + D_xyyz)
    D_yyyy      = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz      = v28*v30
    D_yyzz      = -(D_xxyy + D_yyyy)
    D_yzzz      = -(D_xxyz + D_yyyz)
    D_zzzz      = -(D_xxzz + D_yyzz)
    u10         = u5*u5
    u11         = u5*u6
    v34         = u11
    v206        = v34*z
    v185        = 15.0d0*v34
    v35         = v185*x
    v39         = v206
    v41         = 315.0d0*v186*v206
    v42         = v185*y
    D_xxxxx     = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy     = v34*v38*y
    D_xxxxz     = v38*v39
    D_xxxyy     = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz     = v41*(h - v5)
    D_xxxzz     = -(D_xxxxx + D_xxxyy)
    D_xxyyy     = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz     = v39*(v36 - 945.0d0*v156 + 105.0d0*(v165 + v166))
    D_xxyzz     = -(D_xxxxy + D_xxyyy)
    D_xxzzz     = -(D_xxxxz + D_xxyyz)
    D_xyyyy     = v34*v43*x
    D_xyyyz     = v41*(h - v7)
    D_xyyzz     = -(D_xxxyy + D_xyyyy)
    D_xyzzz     = -(D_xxxyz + D_xyyyz)
    D_xzzzz     = -(D_xxxzz + D_xyyzz)
    D_yyyyy     = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz     = v39*v43
    D_yyyzz     = -(D_xxyyy + D_yyyyy)
    D_yyzzz     = -(D_xxyyz + D_yyyyz)
    D_yzzzz     = -(D_xxyzz + D_yyyzz)
    D_zzzzz     = -(D_xxzzz + D_yyzzz)
    u12         = u6*u6
    u13         = u6*u7
    v44         = u13
    v207        = 315.0d0*v44
    v187        = v207*x
    v45         = 45.0d0*v44
    v52         = v187*y
    v56         = v187*z
    v60         = v188*v207
    D_xxxxxx    = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy    = v52*v55
    D_xxxxxz    = v55*v56
    D_xxxxyy    = v45*(v58 - 21.0d0*v167 + v17*v29 + 14.0d0*v51 + 231.0d0*v59)
    D_xxxxyz    = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz    = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy    = 945.0d0*v186*v44*(11.0d0*v27 + v17 + v61 + v62)
    D_xxxyyz    = v56*(-9.0d0*v32 + v61 + v63)
    D_xxxyzz    = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz    = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy    = v45*(v58 + v17*v24 - 21.0d0*v171 + 14.0d0*v64 + 231.0d0*v65)
    D_xxyyyz    = v60*(-9.0d0*v20 + v62 + v63)
    D_xxyyzz    = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz    = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz    = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy    = v52*v67
    D_xyyyyz    = v56*(-18.0d0*v32 + v17 + v66)
    D_xyyyzz    = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz    = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz    = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz    = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy    = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz    = v60*v67
    D_yyyyzz    = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz    = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz    = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz    = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz    = -(D_xxzzzz + D_yyzzzz)
    u14         = u7*u7
    u15         = u7*u8
    v70         = u15
    v208        = 945.0d0*v70
    v189        = 315.0d0*v70
    v71         = v189*x
    v75         = v189*y
    v77         = v189*z
    v81         = v188*v208*x
    v83         = v208
    D_xxxxxxx   = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy   = v75*v76
    D_xxxxxxz   = v76*v77
    D_xxxxxyy   = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    D_xxxxxyz   = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz   = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy   = -v83*y*(v197 + v1*v18 + v1*v82 - v84)
    D_xxxxyyz   = v77*(-v1*v86 + v80 + v84 + v87)
    D_xxxxyzz   = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz   = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy   = -v83*x*(v197 + v0*v18 + v0*v90 - v89)
    D_xxxyyyz   = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    D_xxxyyzz   = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz   = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz   = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy   = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    D_xxyyyyz   = v77*(-v0*v86 + v87 + v89 + v91)
    D_xxyyyzz   = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz   = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz   = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz   = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy   = v71*v94
    D_xyyyyyz   = v81*(v36 + 110.0d0*v32 - v90)
    D_xyyyyzz   = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz   = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz   = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz   = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz   = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy   = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz   = v77*v94
    D_yyyyyzz   = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz   = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz   = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz   = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz   = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz   = -(D_xxzzzzz + D_yyzzzzz)
    u16         = u8*u8
    u17         = u8*u9
    v95         = u17
    v190        = v205*v95
    v191        = v95*z
    v192        = v191*x
    v193        = v191*y
    v96         = 315.0d0*v95
    v103        = 2835.0d0*v190
    v107        = 2835.0d0*v192
    v113        = v193
    v115        = 945.0d0*v190
    v118        = v192
    v123        = 2835.0d0*v193
    D_xxxxxxxx  = v96*(v98 - 12012.0d0*v100 + 6930.0d0*v101 - 1260.0d0*v102 + 6435.0d0*v99 &
      )
    D_xxxxxxxy  = v103*v106
    D_xxxxxxxz  = v106*v107
    D_xxxxxxyy  = -v96*(v198 + h*v73 + v1*v110 - 495.0d0*v101 + 135.0d0*v102 + 6435.0d0*( &
      -v111 + v112))
    D_xxxxxxyz  = v113*(v114 + 467775.0d0*v168 + 155925.0d0*(-13.0d0*v167 + 13.0d0*v49))
    D_xxxxxxzz  = -(D_xxxxxxxx + D_xxxxxxyy)
    D_xxxxxyyy  = v115*(v199 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    D_xxxxxyyz  = v118*(v200 + 2027025.0d0*v157 - 135135.0d0*v167 + 103950.0d0*v168 + &
      155925.0d0*v170)
    D_xxxxxyzz  = -(D_xxxxxxxy + D_xxxxxyyy)
    D_xxxxxzzz  = -(D_xxxxxxxz + D_xxxxxyyz)
    D_xxxxyyyy  = 945.0d0*v95*(v97 + 396.0d0*v108 + 2145.0d0*v121 + v17*v54 + v17*v66 - &
      18.0d0*(v102 + v120) - 858.0d0*(v112 + v122))
    D_xxxxyyyz  = v123*(v125 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    D_xxxxyyzz  = -(D_xxxxxxyy + D_xxxxyyyy)
    D_xxxxyzzz  = -(D_xxxxxxyz + D_xxxxyyyz)
    D_xxxxzzzz  = -(D_xxxxxxzz + D_xxxxyyzz)
    D_xxxyyyyy  = v115*(v199 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    D_xxxyyyyz  = v107*(v125 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    D_xxxyyyzz  = -(D_xxxxxyyy + D_xxxyyyyy)
    D_xxxyyzzz  = -(D_xxxxxyyz + D_xxxyyyyz)
    D_xxxyzzzz  = -(D_xxxxxyzz + D_xxxyyyzz)
    D_xxxzzzzz  = -(D_xxxxxzzz + D_xxxyyzzz)
    D_xxyyyyyy  = -v96*(v198 + h*v92 + v0*v110 + 135.0d0*v120 - 495.0d0*v126 + 6435.0d0*( &
      v122 - v127))
    D_xxyyyyyz  = v113*(v200 + 2027025.0d0*v158 + 155925.0d0*v168 + 103950.0d0*v170 - &
      135135.0d0*v171)
    D_xxyyyyzz  = -(D_xxxxyyyy + D_xxyyyyyy)
    D_xxyyyzzz  = -(D_xxxxyyyz + D_xxyyyyyz)
    D_xxyyzzzz  = -(D_xxxxyyzz + D_xxyyyyzz)
    D_xxyzzzzz  = -(D_xxxxyzzz + D_xxyyyzzz)
    D_xxzzzzzz  = -(D_xxxxzzzz + D_xxyyzzzz)
    D_xyyyyyyy  = v103*v129
    D_xyyyyyyz  = v118*(v114 + 467775.0d0*v170 + 155925.0d0*(-13.0d0*v171 + 13.0d0*v68))
    D_xyyyyyzz  = -(D_xxxyyyyy + D_xyyyyyyy)
    D_xyyyyzzz  = -(D_xxxyyyyz + D_xyyyyyyz)
    D_xyyyzzzz  = -(D_xxxyyyzz + D_xyyyyyzz)
    D_xyyzzzzz  = -(D_xxxyyzzz + D_xyyyyzzz)
    D_xyzzzzzz  = -(D_xxxyzzzz + D_xyyyzzzz)
    D_xzzzzzzz  = -(D_xxxzzzzz + D_xyyzzzzz)
    D_yyyyyyyy  = v96*(v98 - 1260.0d0*v120 + 6930.0d0*v126 + 6435.0d0*v130 - 12012.0d0* &
      v131)
    D_yyyyyyyz  = v123*v129
    D_yyyyyyzz  = -(D_xxyyyyyy + D_yyyyyyyy)
    D_yyyyyzzz  = -(D_xxyyyyyz + D_yyyyyyyz)
    D_yyyyzzzz  = -(D_xxyyyyzz + D_yyyyyyzz)
    D_yyyzzzzz  = -(D_xxyyyzzz + D_yyyyyzzz)
    D_yyzzzzzz  = -(D_xxyyzzzz + D_yyyyzzzz)
    D_yzzzzzzz  = -(D_xxyzzzzz + D_yyyzzzzz)
    D_zzzzzzzz  = -(D_xxzzzzzz + D_yyzzzzzz)
    u18         = u9*u9
    u19         = u10*u9
    v132        = u19
    v209        = v132*x
    v194        = v209
    v195        = v132*y
    v196        = v132*z
    v133        = 2835.0d0*v194
    v135        = v195
    v138        = v196
    v140        = 155925.0d0*v188*v209
    v144        = 14175.0d0*v196
    v151        = 2835.0d0*v195
    v153        = v194
    D_xxxxxxxxx = v133*(v134 + 25740.0d0*v100 - 18018.0d0*v101 + 4620.0d0*v102 - 12155.0d0 &
      *v99)
    L_xxxxxxxxx = L_xxxxxxxxx + (D_xxxxxxxxx*M_0)
    D_xxxxxxxxy = v135*v137
    L_xxxxxxxxy = L_xxxxxxxxy + (D_xxxxxxxxy*M_0)
    D_xxxxxxxxz = v137*v138
    L_xxxxxxxx  = L_xxxxxxxx + (D_xxxxxxxx*M_0 + D_xxxxxxxxx*M_x + D_xxxxxxxxy*M_y + D_xxxxxxxxz*M_z)
    L_xxxxxxxxz = L_xxxxxxxxz + (D_xxxxxxxxz*M_0)
    D_xxxxxxxyy = v133*(v139 + h*v105 - 1001.0d0*v101 - 12155.0d0*v111 + 15015.0d0*v112)
    L_xxxxxxxyy = L_xxxxxxxyy + (D_xxxxxxxyy*M_0)
    D_xxxxxxxyz = v140*(v141 - 221.0d0*v49 + 273.0d0*v50 - 91.0d0*v51)
    L_xxxxxxxy  = L_xxxxxxxy + (D_xxxxxxxxy*M_x + D_xxxxxxxy*M_0 + D_xxxxxxxyy*M_y + D_xxxxxxxyz*M_z)
    L_xxxxxxxyz = L_xxxxxxxyz + (D_xxxxxxxyz*M_0)
    D_xxxxxxxzz = -(D_xxxxxxxxx + D_xxxxxxxyy)
    L_xxxxxxx   = L_xxxxxxx + (D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxxx*M_xx + D_xxxxxxxxy*M_xy + &
      D_xxxxxxxxz*M_xz + D_xxxxxxxy*M_y + D_xxxxxxxyy*M_yy + &
      D_xxxxxxxyz*M_yz + D_xxxxxxxz*M_z + D_xxxxxxxzz*M_zz)
    L_xxxxxxxz  = L_xxxxxxxz + (D_xxxxxxxxz*M_x + D_xxxxxxxyz*M_y + D_xxxxxxxz*M_0 + D_xxxxxxxzz*M_z)
    D_xxxxxxyyy = v135*(v201 - 34459425.0d0*v161 + 1403325.0d0*v174 + 30405375.0d0*v176 + &
      155925.0d0*(39.0d0*v172 - 39.0d0*v173 + v177))
    L_xxxxxxyyy = L_xxxxxxyyy + (D_xxxxxxyyy*M_0)
    D_xxxxxxyyz = v144*(v145 + v146 + 33.0d0*v102 - 2431.0d0*v111 + 2145.0d0*v112 + 11.0d0 &
      *v120 + 143.0d0*v172)
    L_xxxxxxyy  = L_xxxxxxyy + (D_xxxxxxxyy*M_x + D_xxxxxxyy*M_0 + D_xxxxxxyyy*M_y + D_xxxxxxyyz*M_z)
    L_xxxxxxyyz = L_xxxxxxyyz + (D_xxxxxxyyz*M_0)
    D_xxxxxxyzz = -(D_xxxxxxxxy + D_xxxxxxyyy)
    L_xxxxxxy   = L_xxxxxxy + (D_xxxxxxxxy*M_xx + D_xxxxxxxy*M_x + D_xxxxxxxyy*M_xy + D_xxxxxxxyz*M_xz &
      + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyyy*M_yy + D_xxxxxxyyz &
      *M_yz + D_xxxxxxyz*M_z + D_xxxxxxyzz*M_zz)
    L_xxxxxxyz  = L_xxxxxxyz + (D_xxxxxxxyz*M_x + D_xxxxxxyyz*M_y + D_xxxxxxyz*M_0 + D_xxxxxxyzz*M_z)
    D_xxxxxxzzz = -(D_xxxxxxxxz + D_xxxxxxyyz)
    L_xxxxxx    = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*M_xx + D_xxxxxxxxx*M_xxx + &
      D_xxxxxxxxy*M_xxy + D_xxxxxxxxz*M_xxz + D_xxxxxxxy*M_xy + &
      D_xxxxxxxyy*M_xyy + D_xxxxxxxyz*M_xyz + D_xxxxxxxz*M_xz + &
      D_xxxxxxxzz*M_xzz + D_xxxxxxy*M_y + D_xxxxxxyy*M_yy + D_xxxxxxyyy &
      *M_yyy + D_xxxxxxyyz*M_yyz + D_xxxxxxyz*M_yz + D_xxxxxxyzz*M_yzz &
      + D_xxxxxxz*M_z + D_xxxxxxzz*M_zz + D_xxxxxxzzz*M_zzz)
    L_xxxxxxz   = L_xxxxxxz + (D_xxxxxxxxz*M_xx + D_xxxxxxxyz*M_xy + D_xxxxxxxz*M_x + D_xxxxxxxzz*M_xz &
      + D_xxxxxxyyz*M_yy + D_xxxxxxyz*M_y + D_xxxxxxyzz*M_yz + &
      D_xxxxxxz*M_0 + D_xxxxxxzz*M_z + D_xxxxxxzzz*M_zz)
    D_xxxxxyyyy = v133*(v146 + v202 + 110.0d0*v102 + 4290.0d0*v112 + 330.0d0*v120 + &
      7150.0d0*v122 - 715.0d0*v126)
    L_xxxxxyyyy = L_xxxxxyyyy + (D_xxxxxyyyy*M_0)
    D_xxxxxyyyz = -v140*(v203 - 39.0d0*v50 + 26.0d0*v51 + 221.0d0*v59 + 13.0d0*v64)
    L_xxxxxyyy  = L_xxxxxyyy + (D_xxxxxxyyy*M_x + D_xxxxxyyy*M_0 + D_xxxxxyyyy*M_y + D_xxxxxyyyz*M_z)
    L_xxxxxyyyz = L_xxxxxyyyz + (D_xxxxxyyyz*M_0)
    D_xxxxxyyzz = -(D_xxxxxxxyy + D_xxxxxyyyy)
    L_xxxxxyy   = L_xxxxxyy + (D_xxxxxxxyy*M_xx + D_xxxxxxyy*M_x + D_xxxxxxyyy*M_xy + D_xxxxxxyyz*M_xz &
      + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyyy*M_yy + D_xxxxxyyyz &
      *M_yz + D_xxxxxyyz*M_z + D_xxxxxyyzz*M_zz)
    L_xxxxxyyz  = L_xxxxxyyz + (D_xxxxxxyyz*M_x + D_xxxxxyyyz*M_y + D_xxxxxyyz*M_0 + D_xxxxxyyzz*M_z)
    D_xxxxxyzzz = -(D_xxxxxxxyz + D_xxxxxyyyz)
    L_xxxxxy    = L_xxxxxy + (D_xxxxxxxxy*M_xxx + D_xxxxxxxy*M_xx + D_xxxxxxxyy*M_xxy + D_xxxxxxxyz* &
      M_xxz + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyyy*M_xyy + &
      D_xxxxxxyyz*M_xyz + D_xxxxxxyz*M_xz + D_xxxxxxyzz*M_xzz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyy*M_yy + D_xxxxxyyyy* &
      M_yyy + D_xxxxxyyyz*M_yyz + D_xxxxxyyz*M_yz + D_xxxxxyyzz*M_yzz + &
      D_xxxxxyz*M_z + D_xxxxxyzz*M_zz + D_xxxxxyzzz*M_zzz)
    L_xxxxxyz   = L_xxxxxyz + (D_xxxxxxxyz*M_xx + D_xxxxxxyyz*M_xy + D_xxxxxxyz*M_x + D_xxxxxxyzz*M_xz &
      + D_xxxxxyyyz*M_yy + D_xxxxxyyz*M_y + D_xxxxxyyzz*M_yz + &
      D_xxxxxyz*M_0 + D_xxxxxyzz*M_z + D_xxxxxyzzz*M_zz)
    D_xxxxxzzzz = -(D_xxxxxxxzz + D_xxxxxyyzz)
    L_xxxxx     = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxxx*M_xxx + &
      D_xxxxxxxxx*M_xxxx + D_xxxxxxxxy*M_xxxy + D_xxxxxxxxz*M_xxxz + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxyy*M_xxyy + D_xxxxxxxyz*M_xxyz + &
      D_xxxxxxxz*M_xxz + D_xxxxxxxzz*M_xxzz + D_xxxxxxy*M_xy + &
      D_xxxxxxyy*M_xyy + D_xxxxxxyyy*M_xyyy + D_xxxxxxyyz*M_xyyz + &
      D_xxxxxxyz*M_xyz + D_xxxxxxyzz*M_xyzz + D_xxxxxxz*M_xz + &
      D_xxxxxxzz*M_xzz + D_xxxxxxzzz*M_xzzz + D_xxxxxy*M_y + D_xxxxxyy* &
      M_yy + D_xxxxxyyy*M_yyy + D_xxxxxyyyy*M_yyyy + D_xxxxxyyyz*M_yyyz &
      + D_xxxxxyyz*M_yyz + D_xxxxxyyzz*M_yyzz + D_xxxxxyz*M_yz + &
      D_xxxxxyzz*M_yzz + D_xxxxxyzzz*M_yzzz + D_xxxxxz*M_z + D_xxxxxzz* &
      M_zz + D_xxxxxzzz*M_zzz + D_xxxxxzzzz*M_zzzz)
    L_xxxxxz    = L_xxxxxz + (D_xxxxxxxxz*M_xxx + D_xxxxxxxyz*M_xxy + D_xxxxxxxz*M_xx + D_xxxxxxxzz* &
      M_xxz + D_xxxxxxyyz*M_xyy + D_xxxxxxyz*M_xy + D_xxxxxxyzz*M_xyz + &
      D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + D_xxxxxxzzz*M_xzz + D_xxxxxyyyz &
      *M_yyy + D_xxxxxyyz*M_yy + D_xxxxxyyzz*M_yyz + D_xxxxxyz*M_y + &
      D_xxxxxyzz*M_yz + D_xxxxxyzzz*M_yzz + D_xxxxxz*M_0 + D_xxxxxzz* &
      M_z + D_xxxxxzzz*M_zz + D_xxxxxzzzz*M_zzz)
    D_xxxxyyyyy = v151*(v152 + v202 - 715.0d0*v101 + 330.0d0*v102 + 7150.0d0*v112 + &
      110.0d0*v120 + 4290.0d0*v122)
    L_xxxxyyyyy = L_xxxxyyyyy + (D_xxxxyyyyy*M_0)
    D_xxxxyyyyz = -2835.0d0*v138*(v159*v17 + v160*v17 + 12155.0d0*v162 + 1716.0d0*v175 + &
      3.0d0*v97 - 66.0d0*(v174 + v177) - 4290.0d0*(v176 + v178))
    L_xxxxyyyy  = L_xxxxyyyy + (D_xxxxxyyyy*M_x + D_xxxxyyyy*M_0 + D_xxxxyyyyy*M_y + D_xxxxyyyyz*M_z)
    L_xxxxyyyyz = L_xxxxyyyyz + (D_xxxxyyyyz*M_0)
    D_xxxxyyyzz = -(D_xxxxxxyyy + D_xxxxyyyyy)
    L_xxxxyyy   = L_xxxxyyy + (D_xxxxxxyyy*M_xx + D_xxxxxyyy*M_x + D_xxxxxyyyy*M_xy + D_xxxxxyyyz*M_xz &
      + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyyy*M_yy + D_xxxxyyyyz &
      *M_yz + D_xxxxyyyz*M_z + D_xxxxyyyzz*M_zz)
    L_xxxxyyyz  = L_xxxxyyyz + (D_xxxxxyyyz*M_x + D_xxxxyyyyz*M_y + D_xxxxyyyz*M_0 + D_xxxxyyyzz*M_z)
    D_xxxxyyzzz = -(D_xxxxxxyyz + D_xxxxyyyyz)
    L_xxxxyy    = L_xxxxyy + (D_xxxxxxxyy*M_xxx + D_xxxxxxyy*M_xx + D_xxxxxxyyy*M_xxy + D_xxxxxxyyz* &
      M_xxz + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyyy*M_xyy + &
      D_xxxxxyyyz*M_xyz + D_xxxxxyyz*M_xz + D_xxxxxyyzz*M_xzz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyy*M_yy + D_xxxxyyyyy* &
      M_yyy + D_xxxxyyyyz*M_yyz + D_xxxxyyyz*M_yz + D_xxxxyyyzz*M_yzz + &
      D_xxxxyyz*M_z + D_xxxxyyzz*M_zz + D_xxxxyyzzz*M_zzz)
    L_xxxxyyz   = L_xxxxyyz + (D_xxxxxxyyz*M_xx + D_xxxxxyyyz*M_xy + D_xxxxxyyz*M_x + D_xxxxxyyzz*M_xz &
      + D_xxxxyyyyz*M_yy + D_xxxxyyyz*M_y + D_xxxxyyyzz*M_yz + &
      D_xxxxyyz*M_0 + D_xxxxyyzz*M_z + D_xxxxyyzzz*M_zz)
    D_xxxxyzzzz = -(D_xxxxxxyzz + D_xxxxyyyzz)
    L_xxxxy     = L_xxxxy + (D_xxxxxxxxy*M_xxxx + D_xxxxxxxy*M_xxx + D_xxxxxxxyy*M_xxxy + D_xxxxxxxyz &
      *M_xxxz + D_xxxxxxy*M_xx + D_xxxxxxyy*M_xxy + D_xxxxxxyyy*M_xxyy &
      + D_xxxxxxyyz*M_xxyz + D_xxxxxxyz*M_xxz + D_xxxxxxyzz*M_xxzz + &
      D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyy*M_xyy + D_xxxxxyyyy* &
      M_xyyy + D_xxxxxyyyz*M_xyyz + D_xxxxxyyz*M_xyz + D_xxxxxyyzz* &
      M_xyzz + D_xxxxxyz*M_xz + D_xxxxxyzz*M_xzz + D_xxxxxyzzz*M_xzzz + &
      D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyyy*M_yyy + &
      D_xxxxyyyyy*M_yyyy + D_xxxxyyyyz*M_yyyz + D_xxxxyyyz*M_yyz + &
      D_xxxxyyyzz*M_yyzz + D_xxxxyyz*M_yz + D_xxxxyyzz*M_yzz + &
      D_xxxxyyzzz*M_yzzz + D_xxxxyz*M_z + D_xxxxyzz*M_zz + D_xxxxyzzz* &
      M_zzz + D_xxxxyzzzz*M_zzzz)
    L_xxxxyz    = L_xxxxyz + (D_xxxxxxxyz*M_xxx + D_xxxxxxyyz*M_xxy + D_xxxxxxyz*M_xx + D_xxxxxxyzz* &
      M_xxz + D_xxxxxyyyz*M_xyy + D_xxxxxyyz*M_xy + D_xxxxxyyzz*M_xyz + &
      D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + D_xxxxxyzzz*M_xzz + D_xxxxyyyyz &
      *M_yyy + D_xxxxyyyz*M_yy + D_xxxxyyyzz*M_yyz + D_xxxxyyz*M_y + &
      D_xxxxyyzz*M_yz + D_xxxxyyzzz*M_yzz + D_xxxxyz*M_0 + D_xxxxyzz* &
      M_z + D_xxxxyzzz*M_zz + D_xxxxyzzzz*M_zzz)
    D_xxxxzzzzz = -(D_xxxxxxzzz + D_xxxxyyzzz)
    L_xxxx      = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxxx* &
      M_xxxx + D_xxxxxxxxx*M_xxxxx + D_xxxxxxxxy*M_xxxxy + D_xxxxxxxxz* &
      M_xxxxz + D_xxxxxxxy*M_xxxy + D_xxxxxxxyy*M_xxxyy + D_xxxxxxxyz* &
      M_xxxyz + D_xxxxxxxz*M_xxxz + D_xxxxxxxzz*M_xxxzz + D_xxxxxxy* &
      M_xxy + D_xxxxxxyy*M_xxyy + D_xxxxxxyyy*M_xxyyy + D_xxxxxxyyz* &
      M_xxyyz + D_xxxxxxyz*M_xxyz + D_xxxxxxyzz*M_xxyzz + D_xxxxxxz* &
      M_xxz + D_xxxxxxzz*M_xxzz + D_xxxxxxzzz*M_xxzzz + D_xxxxxy*M_xy + &
      D_xxxxxyy*M_xyy + D_xxxxxyyy*M_xyyy + D_xxxxxyyyy*M_xyyyy + &
      D_xxxxxyyyz*M_xyyyz + D_xxxxxyyz*M_xyyz + D_xxxxxyyzz*M_xyyzz + &
      D_xxxxxyz*M_xyz + D_xxxxxyzz*M_xyzz + D_xxxxxyzzz*M_xyzzz + &
      D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxxzzz*M_xzzz + D_xxxxxzzzz &
      *M_xzzzz + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + &
      D_xxxxyyyy*M_yyyy + D_xxxxyyyyy*M_yyyyy + D_xxxxyyyyz*M_yyyyz + &
      D_xxxxyyyz*M_yyyz + D_xxxxyyyzz*M_yyyzz + D_xxxxyyz*M_yyz + &
      D_xxxxyyzz*M_yyzz + D_xxxxyyzzz*M_yyzzz + D_xxxxyz*M_yz + &
      D_xxxxyzz*M_yzz + D_xxxxyzzz*M_yzzz + D_xxxxyzzzz*M_yzzzz + &
      D_xxxxz*M_z + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz + D_xxxxzzzz*M_zzzz &
      + D_xxxxzzzzz*M_zzzzz)
    L_xxxxz     = L_xxxxz + (D_xxxxxxxxz*M_xxxx + D_xxxxxxxyz*M_xxxy + D_xxxxxxxz*M_xxx + D_xxxxxxxzz &
      *M_xxxz + D_xxxxxxyyz*M_xxyy + D_xxxxxxyz*M_xxy + D_xxxxxxyzz* &
      M_xxyz + D_xxxxxxz*M_xx + D_xxxxxxzz*M_xxz + D_xxxxxxzzz*M_xxzz + &
      D_xxxxxyyyz*M_xyyy + D_xxxxxyyz*M_xyy + D_xxxxxyyzz*M_xyyz + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxyzzz*M_xyzz + D_xxxxxz &
      *M_x + D_xxxxxzz*M_xz + D_xxxxxzzz*M_xzz + D_xxxxxzzzz*M_xzzz + &
      D_xxxxyyyyz*M_yyyy + D_xxxxyyyz*M_yyy + D_xxxxyyyzz*M_yyyz + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyyzzz*M_yyzz + D_xxxxyz &
      *M_y + D_xxxxyzz*M_yz + D_xxxxyzzz*M_yzz + D_xxxxyzzzz*M_yzzz + &
      D_xxxxz*M_0 + D_xxxxzz*M_z + D_xxxxzzz*M_zz + D_xxxxzzzz*M_zzz + &
      D_xxxxzzzzz*M_zzzz)
    D_xxxyyyyyy = v153*(v201 - 34459425.0d0*v163 + 1403325.0d0*v177 + 30405375.0d0*v178 + &
      155925.0d0*(v174 - 39.0d0*v179 + 39.0d0*v180))
    L_xxxyyyyyy = L_xxxyyyyyy + (D_xxxyyyyyy*M_0)
    D_xxxyyyyyz = -v140*(v203 + 13.0d0*v51 + 26.0d0*v64 + 221.0d0*v65 - 39.0d0*v69)
    L_xxxyyyyy  = L_xxxyyyyy + (D_xxxxyyyyy*M_x + D_xxxyyyyy*M_0 + D_xxxyyyyyy*M_y + D_xxxyyyyyz*M_z)
    L_xxxyyyyyz = L_xxxyyyyyz + (D_xxxyyyyyz*M_0)
    D_xxxyyyyzz = -(D_xxxxxyyyy + D_xxxyyyyyy)
    L_xxxyyyy   = L_xxxyyyy + (D_xxxxxyyyy*M_xx + D_xxxxyyyy*M_x + D_xxxxyyyyy*M_xy + D_xxxxyyyyz*M_xz &
      + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyyy*M_yy + D_xxxyyyyyz &
      *M_yz + D_xxxyyyyz*M_z + D_xxxyyyyzz*M_zz)
    L_xxxyyyyz  = L_xxxyyyyz + (D_xxxxyyyyz*M_x + D_xxxyyyyyz*M_y + D_xxxyyyyz*M_0 + D_xxxyyyyzz*M_z)
    D_xxxyyyzzz = -(D_xxxxxyyyz + D_xxxyyyyyz)
    L_xxxyyy    = L_xxxyyy + (D_xxxxxxyyy*M_xxx + D_xxxxxyyy*M_xx + D_xxxxxyyyy*M_xxy + D_xxxxxyyyz* &
      M_xxz + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyyy*M_xyy + &
      D_xxxxyyyyz*M_xyz + D_xxxxyyyz*M_xz + D_xxxxyyyzz*M_xzz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyy*M_yy + D_xxxyyyyyy* &
      M_yyy + D_xxxyyyyyz*M_yyz + D_xxxyyyyz*M_yz + D_xxxyyyyzz*M_yzz + &
      D_xxxyyyz*M_z + D_xxxyyyzz*M_zz + D_xxxyyyzzz*M_zzz)
    L_xxxyyyz   = L_xxxyyyz + (D_xxxxxyyyz*M_xx + D_xxxxyyyyz*M_xy + D_xxxxyyyz*M_x + D_xxxxyyyzz*M_xz &
      + D_xxxyyyyyz*M_yy + D_xxxyyyyz*M_y + D_xxxyyyyzz*M_yz + &
      D_xxxyyyz*M_0 + D_xxxyyyzz*M_z + D_xxxyyyzzz*M_zz)
    D_xxxyyzzzz = -(D_xxxxxyyzz + D_xxxyyyyzz)
    L_xxxyy     = L_xxxyy + (D_xxxxxxxyy*M_xxxx + D_xxxxxxyy*M_xxx + D_xxxxxxyyy*M_xxxy + D_xxxxxxyyz &
      *M_xxxz + D_xxxxxyy*M_xx + D_xxxxxyyy*M_xxy + D_xxxxxyyyy*M_xxyy &
      + D_xxxxxyyyz*M_xxyz + D_xxxxxyyz*M_xxz + D_xxxxxyyzz*M_xxzz + &
      D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyy*M_xyy + D_xxxxyyyyy* &
      M_xyyy + D_xxxxyyyyz*M_xyyz + D_xxxxyyyz*M_xyz + D_xxxxyyyzz* &
      M_xyzz + D_xxxxyyz*M_xz + D_xxxxyyzz*M_xzz + D_xxxxyyzzz*M_xzzz + &
      D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyyy*M_yyy + &
      D_xxxyyyyyy*M_yyyy + D_xxxyyyyyz*M_yyyz + D_xxxyyyyz*M_yyz + &
      D_xxxyyyyzz*M_yyzz + D_xxxyyyz*M_yz + D_xxxyyyzz*M_yzz + &
      D_xxxyyyzzz*M_yzzz + D_xxxyyz*M_z + D_xxxyyzz*M_zz + D_xxxyyzzz* &
      M_zzz + D_xxxyyzzzz*M_zzzz)
    L_xxxyyz    = L_xxxyyz + (D_xxxxxxyyz*M_xxx + D_xxxxxyyyz*M_xxy + D_xxxxxyyz*M_xx + D_xxxxxyyzz* &
      M_xxz + D_xxxxyyyyz*M_xyy + D_xxxxyyyz*M_xy + D_xxxxyyyzz*M_xyz + &
      D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + D_xxxxyyzzz*M_xzz + D_xxxyyyyyz &
      *M_yyy + D_xxxyyyyz*M_yy + D_xxxyyyyzz*M_yyz + D_xxxyyyz*M_y + &
      D_xxxyyyzz*M_yz + D_xxxyyyzzz*M_yzz + D_xxxyyz*M_0 + D_xxxyyzz* &
      M_z + D_xxxyyzzz*M_zz + D_xxxyyzzzz*M_zzz)
    D_xxxyzzzzz = -(D_xxxxxyzzz + D_xxxyyyzzz)
    L_xxxy      = L_xxxy + (D_xxxxxxxxy*M_xxxxx + D_xxxxxxxy*M_xxxx + D_xxxxxxxyy*M_xxxxy + &
      D_xxxxxxxyz*M_xxxxz + D_xxxxxxy*M_xxx + D_xxxxxxyy*M_xxxy + &
      D_xxxxxxyyy*M_xxxyy + D_xxxxxxyyz*M_xxxyz + D_xxxxxxyz*M_xxxz + &
      D_xxxxxxyzz*M_xxxzz + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + &
      D_xxxxxyyy*M_xxyy + D_xxxxxyyyy*M_xxyyy + D_xxxxxyyyz*M_xxyyz + &
      D_xxxxxyyz*M_xxyz + D_xxxxxyyzz*M_xxyzz + D_xxxxxyz*M_xxz + &
      D_xxxxxyzz*M_xxzz + D_xxxxxyzzz*M_xxzzz + D_xxxxy*M_x + D_xxxxyy* &
      M_xy + D_xxxxyyy*M_xyy + D_xxxxyyyy*M_xyyy + D_xxxxyyyyy*M_xyyyy &
      + D_xxxxyyyyz*M_xyyyz + D_xxxxyyyz*M_xyyz + D_xxxxyyyzz*M_xyyzz + &
      D_xxxxyyz*M_xyz + D_xxxxyyzz*M_xyzz + D_xxxxyyzzz*M_xyzzz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxxyzzz*M_xzzz + D_xxxxyzzzz &
      *M_xzzzz + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyyy* &
      M_yyy + D_xxxyyyyy*M_yyyy + D_xxxyyyyyy*M_yyyyy + D_xxxyyyyyz* &
      M_yyyyz + D_xxxyyyyz*M_yyyz + D_xxxyyyyzz*M_yyyzz + D_xxxyyyz* &
      M_yyz + D_xxxyyyzz*M_yyzz + D_xxxyyyzzz*M_yyzzz + D_xxxyyz*M_yz + &
      D_xxxyyzz*M_yzz + D_xxxyyzzz*M_yzzz + D_xxxyyzzzz*M_yzzzz + &
      D_xxxyz*M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz + D_xxxyzzzz*M_zzzz &
      + D_xxxyzzzzz*M_zzzzz)
    L_xxxyz     = L_xxxyz + (D_xxxxxxxyz*M_xxxx + D_xxxxxxyyz*M_xxxy + D_xxxxxxyz*M_xxx + D_xxxxxxyzz &
      *M_xxxz + D_xxxxxyyyz*M_xxyy + D_xxxxxyyz*M_xxy + D_xxxxxyyzz* &
      M_xxyz + D_xxxxxyz*M_xx + D_xxxxxyzz*M_xxz + D_xxxxxyzzz*M_xxzz + &
      D_xxxxyyyyz*M_xyyy + D_xxxxyyyz*M_xyy + D_xxxxyyyzz*M_xyyz + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyyzzz*M_xyzz + D_xxxxyz &
      *M_x + D_xxxxyzz*M_xz + D_xxxxyzzz*M_xzz + D_xxxxyzzzz*M_xzzz + &
      D_xxxyyyyyz*M_yyyy + D_xxxyyyyz*M_yyy + D_xxxyyyyzz*M_yyyz + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyyzzz*M_yyzz + D_xxxyyz &
      *M_y + D_xxxyyzz*M_yz + D_xxxyyzzz*M_yzz + D_xxxyyzzzz*M_yzzz + &
      D_xxxyz*M_0 + D_xxxyzz*M_z + D_xxxyzzz*M_zz + D_xxxyzzzz*M_zzz + &
      D_xxxyzzzzz*M_zzzz)
    D_xxxzzzzzz = -(D_xxxxxzzzz + D_xxxyyzzzz)
    L_xxx       = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxxx*M_xxxxx + D_xxxxxxxxx*M_xxxxxx + D_xxxxxxxxy* &
      M_xxxxxy + D_xxxxxxxxz*M_xxxxxz + D_xxxxxxxy*M_xxxxy + &
      D_xxxxxxxyy*M_xxxxyy + D_xxxxxxxyz*M_xxxxyz + D_xxxxxxxz*M_xxxxz &
      + D_xxxxxxxzz*M_xxxxzz + D_xxxxxxy*M_xxxy + D_xxxxxxyy*M_xxxyy + &
      D_xxxxxxyyy*M_xxxyyy + D_xxxxxxyyz*M_xxxyyz + D_xxxxxxyz*M_xxxyz &
      + D_xxxxxxyzz*M_xxxyzz + D_xxxxxxz*M_xxxz + D_xxxxxxzz*M_xxxzz + &
      D_xxxxxxzzz*M_xxxzzz + D_xxxxxy*M_xxy + D_xxxxxyy*M_xxyy + &
      D_xxxxxyyy*M_xxyyy + D_xxxxxyyyy*M_xxyyyy + D_xxxxxyyyz*M_xxyyyz &
      + D_xxxxxyyz*M_xxyyz + D_xxxxxyyzz*M_xxyyzz + D_xxxxxyz*M_xxyz + &
      D_xxxxxyzz*M_xxyzz + D_xxxxxyzzz*M_xxyzzz + D_xxxxxz*M_xxz + &
      D_xxxxxzz*M_xxzz + D_xxxxxzzz*M_xxzzz + D_xxxxxzzzz*M_xxzzzz + &
      D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyyy*M_xyyy + D_xxxxyyyy* &
      M_xyyyy + D_xxxxyyyyy*M_xyyyyy + D_xxxxyyyyz*M_xyyyyz + &
      D_xxxxyyyz*M_xyyyz + D_xxxxyyyzz*M_xyyyzz + D_xxxxyyz*M_xyyz + &
      D_xxxxyyzz*M_xyyzz + D_xxxxyyzzz*M_xyyzzz + D_xxxxyz*M_xyz + &
      D_xxxxyzz*M_xyzz + D_xxxxyzzz*M_xyzzz + D_xxxxyzzzz*M_xyzzzz + &
      D_xxxxz*M_xz + D_xxxxzz*M_xzz + D_xxxxzzz*M_xzzz + D_xxxxzzzz* &
      M_xzzzz + D_xxxxzzzzz*M_xzzzzz + D_xxxy*M_y + D_xxxyy*M_yy + &
      D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyyy*M_yyyyy + &
      D_xxxyyyyyy*M_yyyyyy + D_xxxyyyyyz*M_yyyyyz + D_xxxyyyyz*M_yyyyz &
      + D_xxxyyyyzz*M_yyyyzz + D_xxxyyyz*M_yyyz + D_xxxyyyzz*M_yyyzz + &
      D_xxxyyyzzz*M_yyyzzz + D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + &
      D_xxxyyzzz*M_yyzzz + D_xxxyyzzzz*M_yyzzzz + D_xxxyz*M_yz + &
      D_xxxyzz*M_yzz + D_xxxyzzz*M_yzzz + D_xxxyzzzz*M_yzzzz + &
      D_xxxyzzzzz*M_yzzzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz &
      + D_xxxzzzz*M_zzzz + D_xxxzzzzz*M_zzzzz + D_xxxzzzzzz*M_zzzzzz)
    L_xxxz      = L_xxxz + (D_xxxxxxxxz*M_xxxxx + D_xxxxxxxyz*M_xxxxy + D_xxxxxxxz*M_xxxx + &
      D_xxxxxxxzz*M_xxxxz + D_xxxxxxyyz*M_xxxyy + D_xxxxxxyz*M_xxxy + &
      D_xxxxxxyzz*M_xxxyz + D_xxxxxxz*M_xxx + D_xxxxxxzz*M_xxxz + &
      D_xxxxxxzzz*M_xxxzz + D_xxxxxyyyz*M_xxyyy + D_xxxxxyyz*M_xxyy + &
      D_xxxxxyyzz*M_xxyyz + D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz + &
      D_xxxxxyzzz*M_xxyzz + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + &
      D_xxxxxzzz*M_xxzz + D_xxxxxzzzz*M_xxzzz + D_xxxxyyyyz*M_xyyyy + &
      D_xxxxyyyz*M_xyyy + D_xxxxyyyzz*M_xyyyz + D_xxxxyyz*M_xyy + &
      D_xxxxyyzz*M_xyyz + D_xxxxyyzzz*M_xyyzz + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxyzzz*M_xyzz + D_xxxxyzzzz*M_xyzzz + &
      D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxxzzzz*M_xzzz &
      + D_xxxxzzzzz*M_xzzzz + D_xxxyyyyyz*M_yyyyy + D_xxxyyyyz*M_yyyy + &
      D_xxxyyyyzz*M_yyyyz + D_xxxyyyz*M_yyy + D_xxxyyyzz*M_yyyz + &
      D_xxxyyyzzz*M_yyyzz + D_xxxyyz*M_yy + D_xxxyyzz*M_yyz + &
      D_xxxyyzzz*M_yyzz + D_xxxyyzzzz*M_yyzzz + D_xxxyz*M_y + D_xxxyzz* &
      M_yz + D_xxxyzzz*M_yzz + D_xxxyzzzz*M_yzzz + D_xxxyzzzzz*M_yzzzz &
      + D_xxxz*M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz + &
      D_xxxzzzzz*M_zzzz + D_xxxzzzzzz*M_zzzzz)
    D_xxyyyyyyy = v151*(v139 + h*v128 + 15015.0d0*v122 - 1001.0d0*v126 - 12155.0d0*v127)
    L_xxyyyyyyy = L_xxyyyyyyy + (D_xxyyyyyyy*M_0)
    D_xxyyyyyyz = v144*(v145 + v152 + 11.0d0*v102 + 33.0d0*v120 + 2145.0d0*v122 - 2431.0d0 &
      *v127 + 143.0d0*v180)
    L_xxyyyyyy  = L_xxyyyyyy + (D_xxxyyyyyy*M_x + D_xxyyyyyy*M_0 + D_xxyyyyyyy*M_y + D_xxyyyyyyz*M_z)
    L_xxyyyyyyz = L_xxyyyyyyz + (D_xxyyyyyyz*M_0)
    D_xxyyyyyzz = -(D_xxxxyyyyy + D_xxyyyyyyy)
    L_xxyyyyy   = L_xxyyyyy + (D_xxxxyyyyy*M_xx + D_xxxyyyyy*M_x + D_xxxyyyyyy*M_xy + D_xxxyyyyyz*M_xz &
      + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyyy*M_yy + D_xxyyyyyyz &
      *M_yz + D_xxyyyyyz*M_z + D_xxyyyyyzz*M_zz)
    L_xxyyyyyz  = L_xxyyyyyz + (D_xxxyyyyyz*M_x + D_xxyyyyyyz*M_y + D_xxyyyyyz*M_0 + D_xxyyyyyzz*M_z)
    D_xxyyyyzzz = -(D_xxxxyyyyz + D_xxyyyyyyz)
    L_xxyyyy    = L_xxyyyy + (D_xxxxxyyyy*M_xxx + D_xxxxyyyy*M_xx + D_xxxxyyyyy*M_xxy + D_xxxxyyyyz* &
      M_xxz + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyyy*M_xyy + &
      D_xxxyyyyyz*M_xyz + D_xxxyyyyz*M_xz + D_xxxyyyyzz*M_xzz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyy*M_yy + D_xxyyyyyyy* &
      M_yyy + D_xxyyyyyyz*M_yyz + D_xxyyyyyz*M_yz + D_xxyyyyyzz*M_yzz + &
      D_xxyyyyz*M_z + D_xxyyyyzz*M_zz + D_xxyyyyzzz*M_zzz)
    L_xxyyyyz   = L_xxyyyyz + (D_xxxxyyyyz*M_xx + D_xxxyyyyyz*M_xy + D_xxxyyyyz*M_x + D_xxxyyyyzz*M_xz &
      + D_xxyyyyyyz*M_yy + D_xxyyyyyz*M_y + D_xxyyyyyzz*M_yz + &
      D_xxyyyyz*M_0 + D_xxyyyyzz*M_z + D_xxyyyyzzz*M_zz)
    D_xxyyyzzzz = -(D_xxxxyyyzz + D_xxyyyyyzz)
    L_xxyyy     = L_xxyyy + (D_xxxxxxyyy*M_xxxx + D_xxxxxyyy*M_xxx + D_xxxxxyyyy*M_xxxy + D_xxxxxyyyz &
      *M_xxxz + D_xxxxyyy*M_xx + D_xxxxyyyy*M_xxy + D_xxxxyyyyy*M_xxyy &
      + D_xxxxyyyyz*M_xxyz + D_xxxxyyyz*M_xxz + D_xxxxyyyzz*M_xxzz + &
      D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyy*M_xyy + D_xxxyyyyyy* &
      M_xyyy + D_xxxyyyyyz*M_xyyz + D_xxxyyyyz*M_xyz + D_xxxyyyyzz* &
      M_xyzz + D_xxxyyyz*M_xz + D_xxxyyyzz*M_xzz + D_xxxyyyzzz*M_xzzz + &
      D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyyy*M_yyy + &
      D_xxyyyyyyy*M_yyyy + D_xxyyyyyyz*M_yyyz + D_xxyyyyyz*M_yyz + &
      D_xxyyyyyzz*M_yyzz + D_xxyyyyz*M_yz + D_xxyyyyzz*M_yzz + &
      D_xxyyyyzzz*M_yzzz + D_xxyyyz*M_z + D_xxyyyzz*M_zz + D_xxyyyzzz* &
      M_zzz + D_xxyyyzzzz*M_zzzz)
    L_xxyyyz    = L_xxyyyz + (D_xxxxxyyyz*M_xxx + D_xxxxyyyyz*M_xxy + D_xxxxyyyz*M_xx + D_xxxxyyyzz* &
      M_xxz + D_xxxyyyyyz*M_xyy + D_xxxyyyyz*M_xy + D_xxxyyyyzz*M_xyz + &
      D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + D_xxxyyyzzz*M_xzz + D_xxyyyyyyz &
      *M_yyy + D_xxyyyyyz*M_yy + D_xxyyyyyzz*M_yyz + D_xxyyyyz*M_y + &
      D_xxyyyyzz*M_yz + D_xxyyyyzzz*M_yzz + D_xxyyyz*M_0 + D_xxyyyzz* &
      M_z + D_xxyyyzzz*M_zz + D_xxyyyzzzz*M_zzz)
    D_xxyyzzzzz = -(D_xxxxyyzzz + D_xxyyyyzzz)
    L_xxyy      = L_xxyy + (D_xxxxxxxyy*M_xxxxx + D_xxxxxxyy*M_xxxx + D_xxxxxxyyy*M_xxxxy + &
      D_xxxxxxyyz*M_xxxxz + D_xxxxxyy*M_xxx + D_xxxxxyyy*M_xxxy + &
      D_xxxxxyyyy*M_xxxyy + D_xxxxxyyyz*M_xxxyz + D_xxxxxyyz*M_xxxz + &
      D_xxxxxyyzz*M_xxxzz + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + &
      D_xxxxyyyy*M_xxyy + D_xxxxyyyyy*M_xxyyy + D_xxxxyyyyz*M_xxyyz + &
      D_xxxxyyyz*M_xxyz + D_xxxxyyyzz*M_xxyzz + D_xxxxyyz*M_xxz + &
      D_xxxxyyzz*M_xxzz + D_xxxxyyzzz*M_xxzzz + D_xxxyy*M_x + D_xxxyyy* &
      M_xy + D_xxxyyyy*M_xyy + D_xxxyyyyy*M_xyyy + D_xxxyyyyyy*M_xyyyy &
      + D_xxxyyyyyz*M_xyyyz + D_xxxyyyyz*M_xyyz + D_xxxyyyyzz*M_xyyzz + &
      D_xxxyyyz*M_xyz + D_xxxyyyzz*M_xyzz + D_xxxyyyzzz*M_xyzzz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxxyyzzz*M_xzzz + D_xxxyyzzzz &
      *M_xzzzz + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyyy* &
      M_yyy + D_xxyyyyyy*M_yyyy + D_xxyyyyyyy*M_yyyyy + D_xxyyyyyyz* &
      M_yyyyz + D_xxyyyyyz*M_yyyz + D_xxyyyyyzz*M_yyyzz + D_xxyyyyz* &
      M_yyz + D_xxyyyyzz*M_yyzz + D_xxyyyyzzz*M_yyzzz + D_xxyyyz*M_yz + &
      D_xxyyyzz*M_yzz + D_xxyyyzzz*M_yzzz + D_xxyyyzzzz*M_yzzzz + &
      D_xxyyz*M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz + D_xxyyzzzz*M_zzzz &
      + D_xxyyzzzzz*M_zzzzz)
    L_xxyyz     = L_xxyyz + (D_xxxxxxyyz*M_xxxx + D_xxxxxyyyz*M_xxxy + D_xxxxxyyz*M_xxx + D_xxxxxyyzz &
      *M_xxxz + D_xxxxyyyyz*M_xxyy + D_xxxxyyyz*M_xxy + D_xxxxyyyzz* &
      M_xxyz + D_xxxxyyz*M_xx + D_xxxxyyzz*M_xxz + D_xxxxyyzzz*M_xxzz + &
      D_xxxyyyyyz*M_xyyy + D_xxxyyyyz*M_xyy + D_xxxyyyyzz*M_xyyz + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyyzzz*M_xyzz + D_xxxyyz &
      *M_x + D_xxxyyzz*M_xz + D_xxxyyzzz*M_xzz + D_xxxyyzzzz*M_xzzz + &
      D_xxyyyyyyz*M_yyyy + D_xxyyyyyz*M_yyy + D_xxyyyyyzz*M_yyyz + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyyzzz*M_yyzz + D_xxyyyz &
      *M_y + D_xxyyyzz*M_yz + D_xxyyyzzz*M_yzz + D_xxyyyzzzz*M_yzzz + &
      D_xxyyz*M_0 + D_xxyyzz*M_z + D_xxyyzzz*M_zz + D_xxyyzzzz*M_zzz + &
      D_xxyyzzzzz*M_zzzz)
    D_xxyzzzzzz = -(D_xxxxyzzzz + D_xxyyyzzzz)
    L_xxy       = L_xxy + (D_xxxxxxxxy*M_xxxxxx + D_xxxxxxxy*M_xxxxx + D_xxxxxxxyy*M_xxxxxy + &
      D_xxxxxxxyz*M_xxxxxz + D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + &
      D_xxxxxxyyy*M_xxxxyy + D_xxxxxxyyz*M_xxxxyz + D_xxxxxxyz*M_xxxxz &
      + D_xxxxxxyzz*M_xxxxzz + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + &
      D_xxxxxyyy*M_xxxyy + D_xxxxxyyyy*M_xxxyyy + D_xxxxxyyyz*M_xxxyyz &
      + D_xxxxxyyz*M_xxxyz + D_xxxxxyyzz*M_xxxyzz + D_xxxxxyz*M_xxxz + &
      D_xxxxxyzz*M_xxxzz + D_xxxxxyzzz*M_xxxzzz + D_xxxxy*M_xx + &
      D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyyy*M_xxyyy + &
      D_xxxxyyyyy*M_xxyyyy + D_xxxxyyyyz*M_xxyyyz + D_xxxxyyyz*M_xxyyz &
      + D_xxxxyyyzz*M_xxyyzz + D_xxxxyyz*M_xxyz + D_xxxxyyzz*M_xxyzz + &
      D_xxxxyyzzz*M_xxyzzz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + &
      D_xxxxyzzz*M_xxzzz + D_xxxxyzzzz*M_xxzzzz + D_xxxy*M_x + D_xxxyy* &
      M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + D_xxxyyyyy*M_xyyyy + &
      D_xxxyyyyyy*M_xyyyyy + D_xxxyyyyyz*M_xyyyyz + D_xxxyyyyz*M_xyyyz &
      + D_xxxyyyyzz*M_xyyyzz + D_xxxyyyz*M_xyyz + D_xxxyyyzz*M_xyyzz + &
      D_xxxyyyzzz*M_xyyzzz + D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + &
      D_xxxyyzzz*M_xyzzz + D_xxxyyzzzz*M_xyzzzz + D_xxxyz*M_xz + &
      D_xxxyzz*M_xzz + D_xxxyzzz*M_xzzz + D_xxxyzzzz*M_xzzzz + &
      D_xxxyzzzzz*M_xzzzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyyy*M_yyyyy + &
      D_xxyyyyyyy*M_yyyyyy + D_xxyyyyyyz*M_yyyyyz + D_xxyyyyyz*M_yyyyz &
      + D_xxyyyyyzz*M_yyyyzz + D_xxyyyyz*M_yyyz + D_xxyyyyzz*M_yyyzz + &
      D_xxyyyyzzz*M_yyyzzz + D_xxyyyz*M_yyz + D_xxyyyzz*M_yyzz + &
      D_xxyyyzzz*M_yyzzz + D_xxyyyzzzz*M_yyzzzz + D_xxyyz*M_yz + &
      D_xxyyzz*M_yzz + D_xxyyzzz*M_yzzz + D_xxyyzzzz*M_yzzzz + &
      D_xxyyzzzzz*M_yzzzzz + D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz &
      + D_xxyzzzz*M_zzzz + D_xxyzzzzz*M_zzzzz + D_xxyzzzzzz*M_zzzzzz)
    L_xxyz      = L_xxyz + (D_xxxxxxxyz*M_xxxxx + D_xxxxxxyyz*M_xxxxy + D_xxxxxxyz*M_xxxx + &
      D_xxxxxxyzz*M_xxxxz + D_xxxxxyyyz*M_xxxyy + D_xxxxxyyz*M_xxxy + &
      D_xxxxxyyzz*M_xxxyz + D_xxxxxyz*M_xxx + D_xxxxxyzz*M_xxxz + &
      D_xxxxxyzzz*M_xxxzz + D_xxxxyyyyz*M_xxyyy + D_xxxxyyyz*M_xxyy + &
      D_xxxxyyyzz*M_xxyyz + D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz + &
      D_xxxxyyzzz*M_xxyzz + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + &
      D_xxxxyzzz*M_xxzz + D_xxxxyzzzz*M_xxzzz + D_xxxyyyyyz*M_xyyyy + &
      D_xxxyyyyz*M_xyyy + D_xxxyyyyzz*M_xyyyz + D_xxxyyyz*M_xyy + &
      D_xxxyyyzz*M_xyyz + D_xxxyyyzzz*M_xyyzz + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyyzzz*M_xyzz + D_xxxyyzzzz*M_xyzzz + &
      D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxxyzzzz*M_xzzz &
      + D_xxxyzzzzz*M_xzzzz + D_xxyyyyyyz*M_yyyyy + D_xxyyyyyz*M_yyyy + &
      D_xxyyyyyzz*M_yyyyz + D_xxyyyyz*M_yyy + D_xxyyyyzz*M_yyyz + &
      D_xxyyyyzzz*M_yyyzz + D_xxyyyz*M_yy + D_xxyyyzz*M_yyz + &
      D_xxyyyzzz*M_yyzz + D_xxyyyzzzz*M_yyzzz + D_xxyyz*M_y + D_xxyyzz* &
      M_yz + D_xxyyzzz*M_yzz + D_xxyyzzzz*M_yzzz + D_xxyyzzzzz*M_yzzzz &
      + D_xxyz*M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz + &
      D_xxyzzzzz*M_zzzz + D_xxyzzzzzz*M_zzzzz)
    D_xxzzzzzzz = -(D_xxxxzzzzz + D_xxyyzzzzz)
    L_xx        = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxxx*M_xxxxxx + D_xxxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxxy*M_xxxxxxy + D_xxxxxxxxz*M_xxxxxxz + D_xxxxxxxy* &
      M_xxxxxy + D_xxxxxxxyy*M_xxxxxyy + D_xxxxxxxyz*M_xxxxxyz + &
      D_xxxxxxxz*M_xxxxxz + D_xxxxxxxzz*M_xxxxxzz + D_xxxxxxy*M_xxxxy + &
      D_xxxxxxyy*M_xxxxyy + D_xxxxxxyyy*M_xxxxyyy + D_xxxxxxyyz* &
      M_xxxxyyz + D_xxxxxxyz*M_xxxxyz + D_xxxxxxyzz*M_xxxxyzz + &
      D_xxxxxxz*M_xxxxz + D_xxxxxxzz*M_xxxxzz + D_xxxxxxzzz*M_xxxxzzz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyyy*M_xxxyyy + &
      D_xxxxxyyyy*M_xxxyyyy + D_xxxxxyyyz*M_xxxyyyz + D_xxxxxyyz* &
      M_xxxyyz + D_xxxxxyyzz*M_xxxyyzz + D_xxxxxyz*M_xxxyz + D_xxxxxyzz &
      *M_xxxyzz + D_xxxxxyzzz*M_xxxyzzz + D_xxxxxz*M_xxxz + D_xxxxxzz* &
      M_xxxzz + D_xxxxxzzz*M_xxxzzz + D_xxxxxzzzz*M_xxxzzzz + D_xxxxy* &
      M_xxy + D_xxxxyy*M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyyy*M_xxyyyy &
      + D_xxxxyyyyy*M_xxyyyyy + D_xxxxyyyyz*M_xxyyyyz + D_xxxxyyyz* &
      M_xxyyyz + D_xxxxyyyzz*M_xxyyyzz + D_xxxxyyz*M_xxyyz + D_xxxxyyzz &
      *M_xxyyzz + D_xxxxyyzzz*M_xxyyzzz + D_xxxxyz*M_xxyz + D_xxxxyzz* &
      M_xxyzz + D_xxxxyzzz*M_xxyzzz + D_xxxxyzzzz*M_xxyzzzz + D_xxxxz* &
      M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz*M_xxzzz + D_xxxxzzzz*M_xxzzzz &
      + D_xxxxzzzzz*M_xxzzzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy* &
      M_xyyy + D_xxxyyyy*M_xyyyy + D_xxxyyyyy*M_xyyyyy + D_xxxyyyyyy* &
      M_xyyyyyy + D_xxxyyyyyz*M_xyyyyyz + D_xxxyyyyz*M_xyyyyz + &
      D_xxxyyyyzz*M_xyyyyzz + D_xxxyyyz*M_xyyyz + D_xxxyyyzz*M_xyyyzz + &
      D_xxxyyyzzz*M_xyyyzzz + D_xxxyyz*M_xyyz + D_xxxyyzz*M_xyyzz + &
      D_xxxyyzzz*M_xyyzzz + D_xxxyyzzzz*M_xyyzzzz + D_xxxyz*M_xyz + &
      D_xxxyzz*M_xyzz + D_xxxyzzz*M_xyzzz + D_xxxyzzzz*M_xyzzzz + &
      D_xxxyzzzzz*M_xyzzzzz + D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz* &
      M_xzzz + D_xxxzzzz*M_xzzzz + D_xxxzzzzz*M_xzzzzz + D_xxxzzzzzz* &
      M_xzzzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + D_xxyyyy* &
      M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyyy*M_yyyyyy + D_xxyyyyyyy* &
      M_yyyyyyy + D_xxyyyyyyz*M_yyyyyyz + D_xxyyyyyz*M_yyyyyz + &
      D_xxyyyyyzz*M_yyyyyzz + D_xxyyyyz*M_yyyyz + D_xxyyyyzz*M_yyyyzz + &
      D_xxyyyyzzz*M_yyyyzzz + D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + &
      D_xxyyyzzz*M_yyyzzz + D_xxyyyzzzz*M_yyyzzzz + D_xxyyz*M_yyz + &
      D_xxyyzz*M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyyzzzz*M_yyzzzz + &
      D_xxyyzzzzz*M_yyzzzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz* &
      M_yzzz + D_xxyzzzz*M_yzzzz + D_xxyzzzzz*M_yzzzzz + D_xxyzzzzzz* &
      M_yzzzzzz + D_xxz*M_z + D_xxzz*M_zz + D_xxzzz*M_zzz + D_xxzzzz* &
      M_zzzz + D_xxzzzzz*M_zzzzz + D_xxzzzzzz*M_zzzzzz + D_xxzzzzzzz* &
      M_zzzzzzz)
    L_xxz       = L_xxz + (D_xxxxxxxxz*M_xxxxxx + D_xxxxxxxyz*M_xxxxxy + D_xxxxxxxz*M_xxxxx + &
      D_xxxxxxxzz*M_xxxxxz + D_xxxxxxyyz*M_xxxxyy + D_xxxxxxyz*M_xxxxy &
      + D_xxxxxxyzz*M_xxxxyz + D_xxxxxxz*M_xxxx + D_xxxxxxzz*M_xxxxz + &
      D_xxxxxxzzz*M_xxxxzz + D_xxxxxyyyz*M_xxxyyy + D_xxxxxyyz*M_xxxyy &
      + D_xxxxxyyzz*M_xxxyyz + D_xxxxxyz*M_xxxy + D_xxxxxyzz*M_xxxyz + &
      D_xxxxxyzzz*M_xxxyzz + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + &
      D_xxxxxzzz*M_xxxzz + D_xxxxxzzzz*M_xxxzzz + D_xxxxyyyyz*M_xxyyyy &
      + D_xxxxyyyz*M_xxyyy + D_xxxxyyyzz*M_xxyyyz + D_xxxxyyz*M_xxyy + &
      D_xxxxyyzz*M_xxyyz + D_xxxxyyzzz*M_xxyyzz + D_xxxxyz*M_xxy + &
      D_xxxxyzz*M_xxyz + D_xxxxyzzz*M_xxyzz + D_xxxxyzzzz*M_xxyzzz + &
      D_xxxxz*M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxxzzzz* &
      M_xxzzz + D_xxxxzzzzz*M_xxzzzz + D_xxxyyyyyz*M_xyyyyy + &
      D_xxxyyyyz*M_xyyyy + D_xxxyyyyzz*M_xyyyyz + D_xxxyyyz*M_xyyy + &
      D_xxxyyyzz*M_xyyyz + D_xxxyyyzzz*M_xyyyzz + D_xxxyyz*M_xyy + &
      D_xxxyyzz*M_xyyz + D_xxxyyzzz*M_xyyzz + D_xxxyyzzzz*M_xyyzzz + &
      D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxyzzz*M_xyzz + D_xxxyzzzz* &
      M_xyzzz + D_xxxyzzzzz*M_xyzzzz + D_xxxz*M_x + D_xxxzz*M_xz + &
      D_xxxzzz*M_xzz + D_xxxzzzz*M_xzzz + D_xxxzzzzz*M_xzzzz + &
      D_xxxzzzzzz*M_xzzzzz + D_xxyyyyyyz*M_yyyyyy + D_xxyyyyyz*M_yyyyy &
      + D_xxyyyyyzz*M_yyyyyz + D_xxyyyyz*M_yyyy + D_xxyyyyzz*M_yyyyz + &
      D_xxyyyyzzz*M_yyyyzz + D_xxyyyz*M_yyy + D_xxyyyzz*M_yyyz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyyzzzz*M_yyyzzz + D_xxyyz*M_yy + &
      D_xxyyzz*M_yyz + D_xxyyzzz*M_yyzz + D_xxyyzzzz*M_yyzzz + &
      D_xxyyzzzzz*M_yyzzzz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz &
      + D_xxyzzzz*M_yzzz + D_xxyzzzzz*M_yzzzz + D_xxyzzzzzz*M_yzzzzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + &
      D_xxzzzzz*M_zzzz + D_xxzzzzzz*M_zzzzz + D_xxzzzzzzz*M_zzzzzz)
    D_xyyyyyyyy = v153*v154
    L_xyyyyyyyy = L_xyyyyyyyy + (D_xyyyyyyyy*M_0)
    D_xyyyyyyyz = v140*(v141 - 91.0d0*v64 - 221.0d0*v68 + 273.0d0*v69)
    L_xyyyyyyy  = L_xyyyyyyy + (D_xxyyyyyyy*M_x + D_xyyyyyyy*M_0 + D_xyyyyyyyy*M_y + D_xyyyyyyyz*M_z)
    L_xyyyyyyyz = L_xyyyyyyyz + (D_xyyyyyyyz*M_0)
    D_xyyyyyyzz = -(D_xxxyyyyyy + D_xyyyyyyyy)
    L_xyyyyyy   = L_xyyyyyy + (D_xxxyyyyyy*M_xx + D_xxyyyyyy*M_x + D_xxyyyyyyy*M_xy + D_xxyyyyyyz*M_xz &
      + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyyy*M_yy + D_xyyyyyyyz &
      *M_yz + D_xyyyyyyz*M_z + D_xyyyyyyzz*M_zz)
    L_xyyyyyyz  = L_xyyyyyyz + (D_xxyyyyyyz*M_x + D_xyyyyyyyz*M_y + D_xyyyyyyz*M_0 + D_xyyyyyyzz*M_z)
    D_xyyyyyzzz = -(D_xxxyyyyyz + D_xyyyyyyyz)
    L_xyyyyy    = L_xyyyyy + (D_xxxxyyyyy*M_xxx + D_xxxyyyyy*M_xx + D_xxxyyyyyy*M_xxy + D_xxxyyyyyz* &
      M_xxz + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyyy*M_xyy + &
      D_xxyyyyyyz*M_xyz + D_xxyyyyyz*M_xz + D_xxyyyyyzz*M_xzz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyy*M_yy + D_xyyyyyyyy* &
      M_yyy + D_xyyyyyyyz*M_yyz + D_xyyyyyyz*M_yz + D_xyyyyyyzz*M_yzz + &
      D_xyyyyyz*M_z + D_xyyyyyzz*M_zz + D_xyyyyyzzz*M_zzz)
    L_xyyyyyz   = L_xyyyyyz + (D_xxxyyyyyz*M_xx + D_xxyyyyyyz*M_xy + D_xxyyyyyz*M_x + D_xxyyyyyzz*M_xz &
      + D_xyyyyyyyz*M_yy + D_xyyyyyyz*M_y + D_xyyyyyyzz*M_yz + &
      D_xyyyyyz*M_0 + D_xyyyyyzz*M_z + D_xyyyyyzzz*M_zz)
    D_xyyyyzzzz = -(D_xxxyyyyzz + D_xyyyyyyzz)
    L_xyyyy     = L_xyyyy + (D_xxxxxyyyy*M_xxxx + D_xxxxyyyy*M_xxx + D_xxxxyyyyy*M_xxxy + D_xxxxyyyyz &
      *M_xxxz + D_xxxyyyy*M_xx + D_xxxyyyyy*M_xxy + D_xxxyyyyyy*M_xxyy &
      + D_xxxyyyyyz*M_xxyz + D_xxxyyyyz*M_xxz + D_xxxyyyyzz*M_xxzz + &
      D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyy*M_xyy + D_xxyyyyyyy* &
      M_xyyy + D_xxyyyyyyz*M_xyyz + D_xxyyyyyz*M_xyz + D_xxyyyyyzz* &
      M_xyzz + D_xxyyyyz*M_xz + D_xxyyyyzz*M_xzz + D_xxyyyyzzz*M_xzzz + &
      D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyyy*M_yyy + &
      D_xyyyyyyyy*M_yyyy + D_xyyyyyyyz*M_yyyz + D_xyyyyyyz*M_yyz + &
      D_xyyyyyyzz*M_yyzz + D_xyyyyyz*M_yz + D_xyyyyyzz*M_yzz + &
      D_xyyyyyzzz*M_yzzz + D_xyyyyz*M_z + D_xyyyyzz*M_zz + D_xyyyyzzz* &
      M_zzz + D_xyyyyzzzz*M_zzzz)
    L_xyyyyz    = L_xyyyyz + (D_xxxxyyyyz*M_xxx + D_xxxyyyyyz*M_xxy + D_xxxyyyyz*M_xx + D_xxxyyyyzz* &
      M_xxz + D_xxyyyyyyz*M_xyy + D_xxyyyyyz*M_xy + D_xxyyyyyzz*M_xyz + &
      D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + D_xxyyyyzzz*M_xzz + D_xyyyyyyyz &
      *M_yyy + D_xyyyyyyz*M_yy + D_xyyyyyyzz*M_yyz + D_xyyyyyz*M_y + &
      D_xyyyyyzz*M_yz + D_xyyyyyzzz*M_yzz + D_xyyyyz*M_0 + D_xyyyyzz* &
      M_z + D_xyyyyzzz*M_zz + D_xyyyyzzzz*M_zzz)
    D_xyyyzzzzz = -(D_xxxyyyzzz + D_xyyyyyzzz)
    L_xyyy      = L_xyyy + (D_xxxxxxyyy*M_xxxxx + D_xxxxxyyy*M_xxxx + D_xxxxxyyyy*M_xxxxy + &
      D_xxxxxyyyz*M_xxxxz + D_xxxxyyy*M_xxx + D_xxxxyyyy*M_xxxy + &
      D_xxxxyyyyy*M_xxxyy + D_xxxxyyyyz*M_xxxyz + D_xxxxyyyz*M_xxxz + &
      D_xxxxyyyzz*M_xxxzz + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + &
      D_xxxyyyyy*M_xxyy + D_xxxyyyyyy*M_xxyyy + D_xxxyyyyyz*M_xxyyz + &
      D_xxxyyyyz*M_xxyz + D_xxxyyyyzz*M_xxyzz + D_xxxyyyz*M_xxz + &
      D_xxxyyyzz*M_xxzz + D_xxxyyyzzz*M_xxzzz + D_xxyyy*M_x + D_xxyyyy* &
      M_xy + D_xxyyyyy*M_xyy + D_xxyyyyyy*M_xyyy + D_xxyyyyyyy*M_xyyyy &
      + D_xxyyyyyyz*M_xyyyz + D_xxyyyyyz*M_xyyz + D_xxyyyyyzz*M_xyyzz + &
      D_xxyyyyz*M_xyz + D_xxyyyyzz*M_xyzz + D_xxyyyyzzz*M_xyzzz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xxyyyzzz*M_xzzz + D_xxyyyzzzz &
      *M_xzzzz + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyyy* &
      M_yyy + D_xyyyyyyy*M_yyyy + D_xyyyyyyyy*M_yyyyy + D_xyyyyyyyz* &
      M_yyyyz + D_xyyyyyyz*M_yyyz + D_xyyyyyyzz*M_yyyzz + D_xyyyyyz* &
      M_yyz + D_xyyyyyzz*M_yyzz + D_xyyyyyzzz*M_yyzzz + D_xyyyyz*M_yz + &
      D_xyyyyzz*M_yzz + D_xyyyyzzz*M_yzzz + D_xyyyyzzzz*M_yzzzz + &
      D_xyyyz*M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz + D_xyyyzzzz*M_zzzz &
      + D_xyyyzzzzz*M_zzzzz)
    L_xyyyz     = L_xyyyz + (D_xxxxxyyyz*M_xxxx + D_xxxxyyyyz*M_xxxy + D_xxxxyyyz*M_xxx + D_xxxxyyyzz &
      *M_xxxz + D_xxxyyyyyz*M_xxyy + D_xxxyyyyz*M_xxy + D_xxxyyyyzz* &
      M_xxyz + D_xxxyyyz*M_xx + D_xxxyyyzz*M_xxz + D_xxxyyyzzz*M_xxzz + &
      D_xxyyyyyyz*M_xyyy + D_xxyyyyyz*M_xyy + D_xxyyyyyzz*M_xyyz + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyyzzz*M_xyzz + D_xxyyyz &
      *M_x + D_xxyyyzz*M_xz + D_xxyyyzzz*M_xzz + D_xxyyyzzzz*M_xzzz + &
      D_xyyyyyyyz*M_yyyy + D_xyyyyyyz*M_yyy + D_xyyyyyyzz*M_yyyz + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyyzzz*M_yyzz + D_xyyyyz &
      *M_y + D_xyyyyzz*M_yz + D_xyyyyzzz*M_yzz + D_xyyyyzzzz*M_yzzz + &
      D_xyyyz*M_0 + D_xyyyzz*M_z + D_xyyyzzz*M_zz + D_xyyyzzzz*M_zzz + &
      D_xyyyzzzzz*M_zzzz)
    D_xyyzzzzzz = -(D_xxxyyzzzz + D_xyyyyzzzz)
    L_xyy       = L_xyy + (D_xxxxxxxyy*M_xxxxxx + D_xxxxxxyy*M_xxxxx + D_xxxxxxyyy*M_xxxxxy + &
      D_xxxxxxyyz*M_xxxxxz + D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + &
      D_xxxxxyyyy*M_xxxxyy + D_xxxxxyyyz*M_xxxxyz + D_xxxxxyyz*M_xxxxz &
      + D_xxxxxyyzz*M_xxxxzz + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + &
      D_xxxxyyyy*M_xxxyy + D_xxxxyyyyy*M_xxxyyy + D_xxxxyyyyz*M_xxxyyz &
      + D_xxxxyyyz*M_xxxyz + D_xxxxyyyzz*M_xxxyzz + D_xxxxyyz*M_xxxz + &
      D_xxxxyyzz*M_xxxzz + D_xxxxyyzzz*M_xxxzzz + D_xxxyy*M_xx + &
      D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyyy*M_xxyyy + &
      D_xxxyyyyyy*M_xxyyyy + D_xxxyyyyyz*M_xxyyyz + D_xxxyyyyz*M_xxyyz &
      + D_xxxyyyyzz*M_xxyyzz + D_xxxyyyz*M_xxyz + D_xxxyyyzz*M_xxyzz + &
      D_xxxyyyzzz*M_xxyzzz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + &
      D_xxxyyzzz*M_xxzzz + D_xxxyyzzzz*M_xxzzzz + D_xxyy*M_x + D_xxyyy* &
      M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + D_xxyyyyyy*M_xyyyy + &
      D_xxyyyyyyy*M_xyyyyy + D_xxyyyyyyz*M_xyyyyz + D_xxyyyyyz*M_xyyyz &
      + D_xxyyyyyzz*M_xyyyzz + D_xxyyyyz*M_xyyz + D_xxyyyyzz*M_xyyzz + &
      D_xxyyyyzzz*M_xyyzzz + D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + &
      D_xxyyyzzz*M_xyzzz + D_xxyyyzzzz*M_xyzzzz + D_xxyyz*M_xz + &
      D_xxyyzz*M_xzz + D_xxyyzzz*M_xzzz + D_xxyyzzzz*M_xzzzz + &
      D_xxyyzzzzz*M_xzzzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyyy*M_yyyyy + &
      D_xyyyyyyyy*M_yyyyyy + D_xyyyyyyyz*M_yyyyyz + D_xyyyyyyz*M_yyyyz &
      + D_xyyyyyyzz*M_yyyyzz + D_xyyyyyz*M_yyyz + D_xyyyyyzz*M_yyyzz + &
      D_xyyyyyzzz*M_yyyzzz + D_xyyyyz*M_yyz + D_xyyyyzz*M_yyzz + &
      D_xyyyyzzz*M_yyzzz + D_xyyyyzzzz*M_yyzzzz + D_xyyyz*M_yz + &
      D_xyyyzz*M_yzz + D_xyyyzzz*M_yzzz + D_xyyyzzzz*M_yzzzz + &
      D_xyyyzzzzz*M_yzzzzz + D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz &
      + D_xyyzzzz*M_zzzz + D_xyyzzzzz*M_zzzzz + D_xyyzzzzzz*M_zzzzzz)
    L_xyyz      = L_xyyz + (D_xxxxxxyyz*M_xxxxx + D_xxxxxyyyz*M_xxxxy + D_xxxxxyyz*M_xxxx + &
      D_xxxxxyyzz*M_xxxxz + D_xxxxyyyyz*M_xxxyy + D_xxxxyyyz*M_xxxy + &
      D_xxxxyyyzz*M_xxxyz + D_xxxxyyz*M_xxx + D_xxxxyyzz*M_xxxz + &
      D_xxxxyyzzz*M_xxxzz + D_xxxyyyyyz*M_xxyyy + D_xxxyyyyz*M_xxyy + &
      D_xxxyyyyzz*M_xxyyz + D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz + &
      D_xxxyyyzzz*M_xxyzz + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + &
      D_xxxyyzzz*M_xxzz + D_xxxyyzzzz*M_xxzzz + D_xxyyyyyyz*M_xyyyy + &
      D_xxyyyyyz*M_xyyy + D_xxyyyyyzz*M_xyyyz + D_xxyyyyz*M_xyy + &
      D_xxyyyyzz*M_xyyz + D_xxyyyyzzz*M_xyyzz + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyyzzz*M_xyzz + D_xxyyyzzzz*M_xyzzz + &
      D_xxyyz*M_x + D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xxyyzzzz*M_xzzz &
      + D_xxyyzzzzz*M_xzzzz + D_xyyyyyyyz*M_yyyyy + D_xyyyyyyz*M_yyyy + &
      D_xyyyyyyzz*M_yyyyz + D_xyyyyyz*M_yyy + D_xyyyyyzz*M_yyyz + &
      D_xyyyyyzzz*M_yyyzz + D_xyyyyz*M_yy + D_xyyyyzz*M_yyz + &
      D_xyyyyzzz*M_yyzz + D_xyyyyzzzz*M_yyzzz + D_xyyyz*M_y + D_xyyyzz* &
      M_yz + D_xyyyzzz*M_yzz + D_xyyyzzzz*M_yzzz + D_xyyyzzzzz*M_yzzzz &
      + D_xyyz*M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz + &
      D_xyyzzzzz*M_zzzz + D_xyyzzzzzz*M_zzzzz)
    D_xyzzzzzzz = -(D_xxxyzzzzz + D_xyyyzzzzz)
    L_xy        = L_xy + (D_xxxxxxxxy*M_xxxxxxx + D_xxxxxxxy*M_xxxxxx + D_xxxxxxxyy*M_xxxxxxy + &
      D_xxxxxxxyz*M_xxxxxxz + D_xxxxxxy*M_xxxxx + D_xxxxxxyy*M_xxxxxy + &
      D_xxxxxxyyy*M_xxxxxyy + D_xxxxxxyyz*M_xxxxxyz + D_xxxxxxyz* &
      M_xxxxxz + D_xxxxxxyzz*M_xxxxxzz + D_xxxxxy*M_xxxx + D_xxxxxyy* &
      M_xxxxy + D_xxxxxyyy*M_xxxxyy + D_xxxxxyyyy*M_xxxxyyy + &
      D_xxxxxyyyz*M_xxxxyyz + D_xxxxxyyz*M_xxxxyz + D_xxxxxyyzz* &
      M_xxxxyzz + D_xxxxxyz*M_xxxxz + D_xxxxxyzz*M_xxxxzz + D_xxxxxyzzz &
      *M_xxxxzzz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy*M_xxxyy &
      + D_xxxxyyyy*M_xxxyyy + D_xxxxyyyyy*M_xxxyyyy + D_xxxxyyyyz* &
      M_xxxyyyz + D_xxxxyyyz*M_xxxyyz + D_xxxxyyyzz*M_xxxyyzz + &
      D_xxxxyyz*M_xxxyz + D_xxxxyyzz*M_xxxyzz + D_xxxxyyzzz*M_xxxyzzz + &
      D_xxxxyz*M_xxxz + D_xxxxyzz*M_xxxzz + D_xxxxyzzz*M_xxxzzz + &
      D_xxxxyzzzz*M_xxxzzzz + D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyy* &
      M_xxyy + D_xxxyyyy*M_xxyyy + D_xxxyyyyy*M_xxyyyy + D_xxxyyyyyy* &
      M_xxyyyyy + D_xxxyyyyyz*M_xxyyyyz + D_xxxyyyyz*M_xxyyyz + &
      D_xxxyyyyzz*M_xxyyyzz + D_xxxyyyz*M_xxyyz + D_xxxyyyzz*M_xxyyzz + &
      D_xxxyyyzzz*M_xxyyzzz + D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + &
      D_xxxyyzzz*M_xxyzzz + D_xxxyyzzzz*M_xxyzzzz + D_xxxyz*M_xxz + &
      D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxxyzzzz*M_xxzzzz + &
      D_xxxyzzzzz*M_xxzzzzz + D_xxy*M_x + D_xxyy*M_xy + D_xxyyy*M_xyy + &
      D_xxyyyy*M_xyyy + D_xxyyyyy*M_xyyyy + D_xxyyyyyy*M_xyyyyy + &
      D_xxyyyyyyy*M_xyyyyyy + D_xxyyyyyyz*M_xyyyyyz + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyyyyzz*M_xyyyyzz + D_xxyyyyz*M_xyyyz + D_xxyyyyzz &
      *M_xyyyzz + D_xxyyyyzzz*M_xyyyzzz + D_xxyyyz*M_xyyz + D_xxyyyzz* &
      M_xyyzz + D_xxyyyzzz*M_xyyzzz + D_xxyyyzzzz*M_xyyzzzz + D_xxyyz* &
      M_xyz + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyyzzzz*M_xyzzzz &
      + D_xxyyzzzzz*M_xyzzzzz + D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz* &
      M_xzzz + D_xxyzzzz*M_xzzzz + D_xxyzzzzz*M_xzzzzz + D_xxyzzzzzz* &
      M_xzzzzzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + &
      D_xyyyyy*M_yyyy + D_xyyyyyy*M_yyyyy + D_xyyyyyyy*M_yyyyyy + &
      D_xyyyyyyyy*M_yyyyyyy + D_xyyyyyyyz*M_yyyyyyz + D_xyyyyyyz* &
      M_yyyyyz + D_xyyyyyyzz*M_yyyyyzz + D_xyyyyyz*M_yyyyz + D_xyyyyyzz &
      *M_yyyyzz + D_xyyyyyzzz*M_yyyyzzz + D_xyyyyz*M_yyyz + D_xyyyyzz* &
      M_yyyzz + D_xyyyyzzz*M_yyyzzz + D_xyyyyzzzz*M_yyyzzzz + D_xyyyz* &
      M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz*M_yyzzz + D_xyyyzzzz*M_yyzzzz &
      + D_xyyyzzzzz*M_yyzzzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz* &
      M_yzzz + D_xyyzzzz*M_yzzzz + D_xyyzzzzz*M_yzzzzz + D_xyyzzzzzz* &
      M_yzzzzzz + D_xyz*M_z + D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz* &
      M_zzzz + D_xyzzzzz*M_zzzzz + D_xyzzzzzz*M_zzzzzz + D_xyzzzzzzz* &
      M_zzzzzzz)
    L_xyz       = L_xyz + (D_xxxxxxxyz*M_xxxxxx + D_xxxxxxyyz*M_xxxxxy + D_xxxxxxyz*M_xxxxx + &
      D_xxxxxxyzz*M_xxxxxz + D_xxxxxyyyz*M_xxxxyy + D_xxxxxyyz*M_xxxxy &
      + D_xxxxxyyzz*M_xxxxyz + D_xxxxxyz*M_xxxx + D_xxxxxyzz*M_xxxxz + &
      D_xxxxxyzzz*M_xxxxzz + D_xxxxyyyyz*M_xxxyyy + D_xxxxyyyz*M_xxxyy &
      + D_xxxxyyyzz*M_xxxyyz + D_xxxxyyz*M_xxxy + D_xxxxyyzz*M_xxxyz + &
      D_xxxxyyzzz*M_xxxyzz + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + &
      D_xxxxyzzz*M_xxxzz + D_xxxxyzzzz*M_xxxzzz + D_xxxyyyyyz*M_xxyyyy &
      + D_xxxyyyyz*M_xxyyy + D_xxxyyyyzz*M_xxyyyz + D_xxxyyyz*M_xxyy + &
      D_xxxyyyzz*M_xxyyz + D_xxxyyyzzz*M_xxyyzz + D_xxxyyz*M_xxy + &
      D_xxxyyzz*M_xxyz + D_xxxyyzzz*M_xxyzz + D_xxxyyzzzz*M_xxyzzz + &
      D_xxxyz*M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxxyzzzz* &
      M_xxzzz + D_xxxyzzzzz*M_xxzzzz + D_xxyyyyyyz*M_xyyyyy + &
      D_xxyyyyyz*M_xyyyy + D_xxyyyyyzz*M_xyyyyz + D_xxyyyyz*M_xyyy + &
      D_xxyyyyzz*M_xyyyz + D_xxyyyyzzz*M_xyyyzz + D_xxyyyz*M_xyy + &
      D_xxyyyzz*M_xyyz + D_xxyyyzzz*M_xyyzz + D_xxyyyzzzz*M_xyyzzz + &
      D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyyzzz*M_xyzz + D_xxyyzzzz* &
      M_xyzzz + D_xxyyzzzzz*M_xyzzzz + D_xxyz*M_x + D_xxyzz*M_xz + &
      D_xxyzzz*M_xzz + D_xxyzzzz*M_xzzz + D_xxyzzzzz*M_xzzzz + &
      D_xxyzzzzzz*M_xzzzzz + D_xyyyyyyyz*M_yyyyyy + D_xyyyyyyz*M_yyyyy &
      + D_xyyyyyyzz*M_yyyyyz + D_xyyyyyz*M_yyyy + D_xyyyyyzz*M_yyyyz + &
      D_xyyyyyzzz*M_yyyyzz + D_xyyyyz*M_yyy + D_xyyyyzz*M_yyyz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyyzzzz*M_yyyzzz + D_xyyyz*M_yy + &
      D_xyyyzz*M_yyz + D_xyyyzzz*M_yyzz + D_xyyyzzzz*M_yyzzz + &
      D_xyyyzzzzz*M_yyzzzz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz &
      + D_xyyzzzz*M_yzzz + D_xyyzzzzz*M_yzzzz + D_xyyzzzzzz*M_yzzzzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + &
      D_xyzzzzz*M_zzzz + D_xyzzzzzz*M_zzzzz + D_xyzzzzzzz*M_zzzzzz)
    D_xzzzzzzzz = -(D_xxxzzzzzz + D_xyyzzzzzz)
    L_x         = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxxx*M_xxxxxxxx + D_xxxxxxxxy*M_xxxxxxxy + D_xxxxxxxxz* &
      M_xxxxxxxz + D_xxxxxxxy*M_xxxxxxy + D_xxxxxxxyy*M_xxxxxxyy + &
      D_xxxxxxxyz*M_xxxxxxyz + D_xxxxxxxz*M_xxxxxxz + D_xxxxxxxzz* &
      M_xxxxxxzz + D_xxxxxxy*M_xxxxxy + D_xxxxxxyy*M_xxxxxyy + &
      D_xxxxxxyyy*M_xxxxxyyy + D_xxxxxxyyz*M_xxxxxyyz + D_xxxxxxyz* &
      M_xxxxxyz + D_xxxxxxyzz*M_xxxxxyzz + D_xxxxxxz*M_xxxxxz + &
      D_xxxxxxzz*M_xxxxxzz + D_xxxxxxzzz*M_xxxxxzzz + D_xxxxxy*M_xxxxy &
      + D_xxxxxyy*M_xxxxyy + D_xxxxxyyy*M_xxxxyyy + D_xxxxxyyyy* &
      M_xxxxyyyy + D_xxxxxyyyz*M_xxxxyyyz + D_xxxxxyyz*M_xxxxyyz + &
      D_xxxxxyyzz*M_xxxxyyzz + D_xxxxxyz*M_xxxxyz + D_xxxxxyzz* &
      M_xxxxyzz + D_xxxxxyzzz*M_xxxxyzzz + D_xxxxxz*M_xxxxz + D_xxxxxzz &
      *M_xxxxzz + D_xxxxxzzz*M_xxxxzzz + D_xxxxxzzzz*M_xxxxzzzz + &
      D_xxxxy*M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + &
      D_xxxxyyyy*M_xxxyyyy + D_xxxxyyyyy*M_xxxyyyyy + D_xxxxyyyyz* &
      M_xxxyyyyz + D_xxxxyyyz*M_xxxyyyz + D_xxxxyyyzz*M_xxxyyyzz + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyyzz + D_xxxxyyzzz* &
      M_xxxyyzzz + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + D_xxxxyzzz* &
      M_xxxyzzz + D_xxxxyzzzz*M_xxxyzzzz + D_xxxxz*M_xxxz + D_xxxxzz* &
      M_xxxzz + D_xxxxzzz*M_xxxzzz + D_xxxxzzzz*M_xxxzzzz + D_xxxxzzzzz &
      *M_xxxzzzzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy*M_xxyyy + &
      D_xxxyyyy*M_xxyyyy + D_xxxyyyyy*M_xxyyyyy + D_xxxyyyyyy* &
      M_xxyyyyyy + D_xxxyyyyyz*M_xxyyyyyz + D_xxxyyyyz*M_xxyyyyz + &
      D_xxxyyyyzz*M_xxyyyyzz + D_xxxyyyz*M_xxyyyz + D_xxxyyyzz* &
      M_xxyyyzz + D_xxxyyyzzz*M_xxyyyzzz + D_xxxyyz*M_xxyyz + D_xxxyyzz &
      *M_xxyyzz + D_xxxyyzzz*M_xxyyzzz + D_xxxyyzzzz*M_xxyyzzzz + &
      D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + &
      D_xxxyzzzz*M_xxyzzzz + D_xxxyzzzzz*M_xxyzzzzz + D_xxxz*M_xxz + &
      D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxxzzzzz*M_xxzzzzz + D_xxxzzzzzz*M_xxzzzzzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyyy* &
      M_xyyyyy + D_xxyyyyyy*M_xyyyyyy + D_xxyyyyyyy*M_xyyyyyyy + &
      D_xxyyyyyyz*M_xyyyyyyz + D_xxyyyyyz*M_xyyyyyz + D_xxyyyyyzz* &
      M_xyyyyyzz + D_xxyyyyz*M_xyyyyz + D_xxyyyyzz*M_xyyyyzz + &
      D_xxyyyyzzz*M_xyyyyzzz + D_xxyyyz*M_xyyyz + D_xxyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyyzzz + D_xxyyyzzzz*M_xyyyzzzz + D_xxyyz*M_xyyz + &
      D_xxyyzz*M_xyyzz + D_xxyyzzz*M_xyyzzz + D_xxyyzzzz*M_xyyzzzz + &
      D_xxyyzzzzz*M_xyyzzzzz + D_xxyz*M_xyz + D_xxyzz*M_xyzz + D_xxyzzz &
      *M_xyzzz + D_xxyzzzz*M_xyzzzz + D_xxyzzzzz*M_xyzzzzz + &
      D_xxyzzzzzz*M_xyzzzzzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz* &
      M_xzzz + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xxzzzzzz* &
      M_xzzzzzz + D_xxzzzzzzz*M_xzzzzzzz + D_xy*M_y + D_xyy*M_yy + &
      D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + D_xyyyyyy* &
      M_yyyyyy + D_xyyyyyyy*M_yyyyyyy + D_xyyyyyyyy*M_yyyyyyyy + &
      D_xyyyyyyyz*M_yyyyyyyz + D_xyyyyyyz*M_yyyyyyz + D_xyyyyyyzz* &
      M_yyyyyyzz + D_xyyyyyz*M_yyyyyz + D_xyyyyyzz*M_yyyyyzz + &
      D_xyyyyyzzz*M_yyyyyzzz + D_xyyyyz*M_yyyyz + D_xyyyyzz*M_yyyyzz + &
      D_xyyyyzzz*M_yyyyzzz + D_xyyyyzzzz*M_yyyyzzzz + D_xyyyz*M_yyyz + &
      D_xyyyzz*M_yyyzz + D_xyyyzzz*M_yyyzzz + D_xyyyzzzz*M_yyyzzzz + &
      D_xyyyzzzzz*M_yyyzzzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz &
      *M_yyzzz + D_xyyzzzz*M_yyzzzz + D_xyyzzzzz*M_yyzzzzz + &
      D_xyyzzzzzz*M_yyzzzzzz + D_xyz*M_yz + D_xyzz*M_yzz + D_xyzzz* &
      M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + D_xyzzzzzz* &
      M_yzzzzzz + D_xyzzzzzzz*M_yzzzzzzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + D_xzzzzzz* &
      M_zzzzzz + D_xzzzzzzz*M_zzzzzzz + D_xzzzzzzzz*M_zzzzzzzz)
    L_xz        = L_xz + (D_xxxxxxxxz*M_xxxxxxx + D_xxxxxxxyz*M_xxxxxxy + D_xxxxxxxz*M_xxxxxx + &
      D_xxxxxxxzz*M_xxxxxxz + D_xxxxxxyyz*M_xxxxxyy + D_xxxxxxyz* &
      M_xxxxxy + D_xxxxxxyzz*M_xxxxxyz + D_xxxxxxz*M_xxxxx + D_xxxxxxzz &
      *M_xxxxxz + D_xxxxxxzzz*M_xxxxxzz + D_xxxxxyyyz*M_xxxxyyy + &
      D_xxxxxyyz*M_xxxxyy + D_xxxxxyyzz*M_xxxxyyz + D_xxxxxyz*M_xxxxy + &
      D_xxxxxyzz*M_xxxxyz + D_xxxxxyzzz*M_xxxxyzz + D_xxxxxz*M_xxxx + &
      D_xxxxxzz*M_xxxxz + D_xxxxxzzz*M_xxxxzz + D_xxxxxzzzz*M_xxxxzzz + &
      D_xxxxyyyyz*M_xxxyyyy + D_xxxxyyyz*M_xxxyyy + D_xxxxyyyzz* &
      M_xxxyyyz + D_xxxxyyz*M_xxxyy + D_xxxxyyzz*M_xxxyyz + D_xxxxyyzzz &
      *M_xxxyyzz + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz + D_xxxxyzzz* &
      M_xxxyzz + D_xxxxyzzzz*M_xxxyzzz + D_xxxxz*M_xxx + D_xxxxzz* &
      M_xxxz + D_xxxxzzz*M_xxxzz + D_xxxxzzzz*M_xxxzzz + D_xxxxzzzzz* &
      M_xxxzzzz + D_xxxyyyyyz*M_xxyyyyy + D_xxxyyyyz*M_xxyyyy + &
      D_xxxyyyyzz*M_xxyyyyz + D_xxxyyyz*M_xxyyy + D_xxxyyyzz*M_xxyyyz + &
      D_xxxyyyzzz*M_xxyyyzz + D_xxxyyz*M_xxyy + D_xxxyyzz*M_xxyyz + &
      D_xxxyyzzz*M_xxyyzz + D_xxxyyzzzz*M_xxyyzzz + D_xxxyz*M_xxy + &
      D_xxxyzz*M_xxyz + D_xxxyzzz*M_xxyzz + D_xxxyzzzz*M_xxyzzz + &
      D_xxxyzzzzz*M_xxyzzzz + D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxxzzz* &
      M_xxzz + D_xxxzzzz*M_xxzzz + D_xxxzzzzz*M_xxzzzz + D_xxxzzzzzz* &
      M_xxzzzzz + D_xxyyyyyyz*M_xyyyyyy + D_xxyyyyyz*M_xyyyyy + &
      D_xxyyyyyzz*M_xyyyyyz + D_xxyyyyz*M_xyyyy + D_xxyyyyzz*M_xyyyyz + &
      D_xxyyyyzzz*M_xyyyyzz + D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + &
      D_xxyyyzzz*M_xyyyzz + D_xxyyyzzzz*M_xyyyzzz + D_xxyyz*M_xyy + &
      D_xxyyzz*M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyyzzzz*M_xyyzzz + &
      D_xxyyzzzzz*M_xyyzzzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz* &
      M_xyzz + D_xxyzzzz*M_xyzzz + D_xxyzzzzz*M_xyzzzz + D_xxyzzzzzz* &
      M_xyzzzzz + D_xxz*M_x + D_xxzz*M_xz + D_xxzzz*M_xzz + D_xxzzzz* &
      M_xzzz + D_xxzzzzz*M_xzzzz + D_xxzzzzzz*M_xzzzzz + D_xxzzzzzzz* &
      M_xzzzzzz + D_xyyyyyyyz*M_yyyyyyy + D_xyyyyyyz*M_yyyyyy + &
      D_xyyyyyyzz*M_yyyyyyz + D_xyyyyyz*M_yyyyy + D_xyyyyyzz*M_yyyyyz + &
      D_xyyyyyzzz*M_yyyyyzz + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + &
      D_xyyyyzzz*M_yyyyzz + D_xyyyyzzzz*M_yyyyzzz + D_xyyyz*M_yyy + &
      D_xyyyzz*M_yyyz + D_xyyyzzz*M_yyyzz + D_xyyyzzzz*M_yyyzzz + &
      D_xyyyzzzzz*M_yyyzzzz + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyyzzz* &
      M_yyzz + D_xyyzzzz*M_yyzzz + D_xyyzzzzz*M_yyzzzz + D_xyyzzzzzz* &
      M_yyzzzzz + D_xyz*M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xyzzzz* &
      M_yzzz + D_xyzzzzz*M_yzzzz + D_xyzzzzzz*M_yzzzzz + D_xyzzzzzzz* &
      M_yzzzzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz + D_xzzzz*M_zzz + &
      D_xzzzzz*M_zzzz + D_xzzzzzz*M_zzzzz + D_xzzzzzzz*M_zzzzzz + &
      D_xzzzzzzzz*M_zzzzzzz)
    D_yyyyyyyyy = v151*(v134 + 4620.0d0*v120 - 18018.0d0*v126 - 12155.0d0*v130 + 25740.0d0 &
      *v131)
    L_yyyyyyyyy = L_yyyyyyyyy + (D_yyyyyyyyy*M_0)
    D_yyyyyyyyz = v138*v154
    L_yyyyyyyy  = L_yyyyyyyy + (D_xyyyyyyyy*M_x + D_yyyyyyyy*M_0 + D_yyyyyyyyy*M_y + D_yyyyyyyyz*M_z)
    L_yyyyyyyyz = L_yyyyyyyyz + (D_yyyyyyyyz*M_0)
    D_yyyyyyyzz = -(D_xxyyyyyyy + D_yyyyyyyyy)
    L_yyyyyyy   = L_yyyyyyy + (D_xxyyyyyyy*M_xx + D_xyyyyyyy*M_x + D_xyyyyyyyy*M_xy + D_xyyyyyyyz*M_xz &
      + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyyy*M_yy + D_yyyyyyyyz &
      *M_yz + D_yyyyyyyz*M_z + D_yyyyyyyzz*M_zz)
    L_yyyyyyyz  = L_yyyyyyyz + (D_xyyyyyyyz*M_x + D_yyyyyyyyz*M_y + D_yyyyyyyz*M_0 + D_yyyyyyyzz*M_z)
    D_yyyyyyzzz = -(D_xxyyyyyyz + D_yyyyyyyyz)
    L_yyyyyy    = L_yyyyyy + (D_xxxyyyyyy*M_xxx + D_xxyyyyyy*M_xx + D_xxyyyyyyy*M_xxy + D_xxyyyyyyz* &
      M_xxz + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyyy*M_xyy + &
      D_xyyyyyyyz*M_xyz + D_xyyyyyyz*M_xz + D_xyyyyyyzz*M_xzz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*M_yy + D_yyyyyyyyy* &
      M_yyy + D_yyyyyyyyz*M_yyz + D_yyyyyyyz*M_yz + D_yyyyyyyzz*M_yzz + &
      D_yyyyyyz*M_z + D_yyyyyyzz*M_zz + D_yyyyyyzzz*M_zzz)
    L_yyyyyyz   = L_yyyyyyz + (D_xxyyyyyyz*M_xx + D_xyyyyyyyz*M_xy + D_xyyyyyyz*M_x + D_xyyyyyyzz*M_xz &
      + D_yyyyyyyyz*M_yy + D_yyyyyyyz*M_y + D_yyyyyyyzz*M_yz + &
      D_yyyyyyz*M_0 + D_yyyyyyzz*M_z + D_yyyyyyzzz*M_zz)
    D_yyyyyzzzz = -(D_xxyyyyyzz + D_yyyyyyyzz)
    L_yyyyy     = L_yyyyy + (D_xxxxyyyyy*M_xxxx + D_xxxyyyyy*M_xxx + D_xxxyyyyyy*M_xxxy + D_xxxyyyyyz &
      *M_xxxz + D_xxyyyyy*M_xx + D_xxyyyyyy*M_xxy + D_xxyyyyyyy*M_xxyy &
      + D_xxyyyyyyz*M_xxyz + D_xxyyyyyz*M_xxz + D_xxyyyyyzz*M_xxzz + &
      D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyy*M_xyy + D_xyyyyyyyy* &
      M_xyyy + D_xyyyyyyyz*M_xyyz + D_xyyyyyyz*M_xyz + D_xyyyyyyzz* &
      M_xyzz + D_xyyyyyz*M_xz + D_xyyyyyzz*M_xzz + D_xyyyyyzzz*M_xzzz + &
      D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyyy*M_yyy + &
      D_yyyyyyyyy*M_yyyy + D_yyyyyyyyz*M_yyyz + D_yyyyyyyz*M_yyz + &
      D_yyyyyyyzz*M_yyzz + D_yyyyyyz*M_yz + D_yyyyyyzz*M_yzz + &
      D_yyyyyyzzz*M_yzzz + D_yyyyyz*M_z + D_yyyyyzz*M_zz + D_yyyyyzzz* &
      M_zzz + D_yyyyyzzzz*M_zzzz)
    L_yyyyyz    = L_yyyyyz + (D_xxxyyyyyz*M_xxx + D_xxyyyyyyz*M_xxy + D_xxyyyyyz*M_xx + D_xxyyyyyzz* &
      M_xxz + D_xyyyyyyyz*M_xyy + D_xyyyyyyz*M_xy + D_xyyyyyyzz*M_xyz + &
      D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + D_xyyyyyzzz*M_xzz + D_yyyyyyyyz &
      *M_yyy + D_yyyyyyyz*M_yy + D_yyyyyyyzz*M_yyz + D_yyyyyyz*M_y + &
      D_yyyyyyzz*M_yz + D_yyyyyyzzz*M_yzz + D_yyyyyz*M_0 + D_yyyyyzz* &
      M_z + D_yyyyyzzz*M_zz + D_yyyyyzzzz*M_zzz)
    D_yyyyzzzzz = -(D_xxyyyyzzz + D_yyyyyyzzz)
    L_yyyy      = L_yyyy + (D_xxxxxyyyy*M_xxxxx + D_xxxxyyyy*M_xxxx + D_xxxxyyyyy*M_xxxxy + &
      D_xxxxyyyyz*M_xxxxz + D_xxxyyyy*M_xxx + D_xxxyyyyy*M_xxxy + &
      D_xxxyyyyyy*M_xxxyy + D_xxxyyyyyz*M_xxxyz + D_xxxyyyyz*M_xxxz + &
      D_xxxyyyyzz*M_xxxzz + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + &
      D_xxyyyyyy*M_xxyy + D_xxyyyyyyy*M_xxyyy + D_xxyyyyyyz*M_xxyyz + &
      D_xxyyyyyz*M_xxyz + D_xxyyyyyzz*M_xxyzz + D_xxyyyyz*M_xxz + &
      D_xxyyyyzz*M_xxzz + D_xxyyyyzzz*M_xxzzz + D_xyyyy*M_x + D_xyyyyy* &
      M_xy + D_xyyyyyy*M_xyy + D_xyyyyyyy*M_xyyy + D_xyyyyyyyy*M_xyyyy &
      + D_xyyyyyyyz*M_xyyyz + D_xyyyyyyz*M_xyyz + D_xyyyyyyzz*M_xyyzz + &
      D_xyyyyyz*M_xyz + D_xyyyyyzz*M_xyzz + D_xyyyyyzzz*M_xyzzz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_xyyyyzzz*M_xzzz + D_xyyyyzzzz &
      *M_xzzzz + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyyy* &
      M_yyy + D_yyyyyyyy*M_yyyy + D_yyyyyyyyy*M_yyyyy + D_yyyyyyyyz* &
      M_yyyyz + D_yyyyyyyz*M_yyyz + D_yyyyyyyzz*M_yyyzz + D_yyyyyyz* &
      M_yyz + D_yyyyyyzz*M_yyzz + D_yyyyyyzzz*M_yyzzz + D_yyyyyz*M_yz + &
      D_yyyyyzz*M_yzz + D_yyyyyzzz*M_yzzz + D_yyyyyzzzz*M_yzzzz + &
      D_yyyyz*M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz + D_yyyyzzzz*M_zzzz &
      + D_yyyyzzzzz*M_zzzzz)
    L_yyyyz     = L_yyyyz + (D_xxxxyyyyz*M_xxxx + D_xxxyyyyyz*M_xxxy + D_xxxyyyyz*M_xxx + D_xxxyyyyzz &
      *M_xxxz + D_xxyyyyyyz*M_xxyy + D_xxyyyyyz*M_xxy + D_xxyyyyyzz* &
      M_xxyz + D_xxyyyyz*M_xx + D_xxyyyyzz*M_xxz + D_xxyyyyzzz*M_xxzz + &
      D_xyyyyyyyz*M_xyyy + D_xyyyyyyz*M_xyy + D_xyyyyyyzz*M_xyyz + &
      D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyyzzz*M_xyzz + D_xyyyyz &
      *M_x + D_xyyyyzz*M_xz + D_xyyyyzzz*M_xzz + D_xyyyyzzzz*M_xzzz + &
      D_yyyyyyyyz*M_yyyy + D_yyyyyyyz*M_yyy + D_yyyyyyyzz*M_yyyz + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyyzzz*M_yyzz + D_yyyyyz &
      *M_y + D_yyyyyzz*M_yz + D_yyyyyzzz*M_yzz + D_yyyyyzzzz*M_yzzz + &
      D_yyyyz*M_0 + D_yyyyzz*M_z + D_yyyyzzz*M_zz + D_yyyyzzzz*M_zzz + &
      D_yyyyzzzzz*M_zzzz)
    D_yyyzzzzzz = -(D_xxyyyzzzz + D_yyyyyzzzz)
    L_yyy       = L_yyy + (D_xxxxxxyyy*M_xxxxxx + D_xxxxxyyy*M_xxxxx + D_xxxxxyyyy*M_xxxxxy + &
      D_xxxxxyyyz*M_xxxxxz + D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + &
      D_xxxxyyyyy*M_xxxxyy + D_xxxxyyyyz*M_xxxxyz + D_xxxxyyyz*M_xxxxz &
      + D_xxxxyyyzz*M_xxxxzz + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + &
      D_xxxyyyyy*M_xxxyy + D_xxxyyyyyy*M_xxxyyy + D_xxxyyyyyz*M_xxxyyz &
      + D_xxxyyyyz*M_xxxyz + D_xxxyyyyzz*M_xxxyzz + D_xxxyyyz*M_xxxz + &
      D_xxxyyyzz*M_xxxzz + D_xxxyyyzzz*M_xxxzzz + D_xxyyy*M_xx + &
      D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyyy*M_xxyyy + &
      D_xxyyyyyyy*M_xxyyyy + D_xxyyyyyyz*M_xxyyyz + D_xxyyyyyz*M_xxyyz &
      + D_xxyyyyyzz*M_xxyyzz + D_xxyyyyz*M_xxyz + D_xxyyyyzz*M_xxyzz + &
      D_xxyyyyzzz*M_xxyzzz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + &
      D_xxyyyzzz*M_xxzzz + D_xxyyyzzzz*M_xxzzzz + D_xyyy*M_x + D_xyyyy* &
      M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + D_xyyyyyyy*M_xyyyy + &
      D_xyyyyyyyy*M_xyyyyy + D_xyyyyyyyz*M_xyyyyz + D_xyyyyyyz*M_xyyyz &
      + D_xyyyyyyzz*M_xyyyzz + D_xyyyyyz*M_xyyz + D_xyyyyyzz*M_xyyzz + &
      D_xyyyyyzzz*M_xyyzzz + D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + &
      D_xyyyyzzz*M_xyzzz + D_xyyyyzzzz*M_xyzzzz + D_xyyyz*M_xz + &
      D_xyyyzz*M_xzz + D_xyyyzzz*M_xzzz + D_xyyyzzzz*M_xzzzz + &
      D_xyyyzzzzz*M_xzzzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyyy*M_yyyyy + &
      D_yyyyyyyyy*M_yyyyyy + D_yyyyyyyyz*M_yyyyyz + D_yyyyyyyz*M_yyyyz &
      + D_yyyyyyyzz*M_yyyyzz + D_yyyyyyz*M_yyyz + D_yyyyyyzz*M_yyyzz + &
      D_yyyyyyzzz*M_yyyzzz + D_yyyyyz*M_yyz + D_yyyyyzz*M_yyzz + &
      D_yyyyyzzz*M_yyzzz + D_yyyyyzzzz*M_yyzzzz + D_yyyyz*M_yz + &
      D_yyyyzz*M_yzz + D_yyyyzzz*M_yzzz + D_yyyyzzzz*M_yzzzz + &
      D_yyyyzzzzz*M_yzzzzz + D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz &
      + D_yyyzzzz*M_zzzz + D_yyyzzzzz*M_zzzzz + D_yyyzzzzzz*M_zzzzzz)
    L_yyyz      = L_yyyz + (D_xxxxxyyyz*M_xxxxx + D_xxxxyyyyz*M_xxxxy + D_xxxxyyyz*M_xxxx + &
      D_xxxxyyyzz*M_xxxxz + D_xxxyyyyyz*M_xxxyy + D_xxxyyyyz*M_xxxy + &
      D_xxxyyyyzz*M_xxxyz + D_xxxyyyz*M_xxx + D_xxxyyyzz*M_xxxz + &
      D_xxxyyyzzz*M_xxxzz + D_xxyyyyyyz*M_xxyyy + D_xxyyyyyz*M_xxyy + &
      D_xxyyyyyzz*M_xxyyz + D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz + &
      D_xxyyyyzzz*M_xxyzz + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + &
      D_xxyyyzzz*M_xxzz + D_xxyyyzzzz*M_xxzzz + D_xyyyyyyyz*M_xyyyy + &
      D_xyyyyyyz*M_xyyy + D_xyyyyyyzz*M_xyyyz + D_xyyyyyz*M_xyy + &
      D_xyyyyyzz*M_xyyz + D_xyyyyyzzz*M_xyyzz + D_xyyyyz*M_xy + &
      D_xyyyyzz*M_xyz + D_xyyyyzzz*M_xyzz + D_xyyyyzzzz*M_xyzzz + &
      D_xyyyz*M_x + D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_xyyyzzzz*M_xzzz &
      + D_xyyyzzzzz*M_xzzzz + D_yyyyyyyyz*M_yyyyy + D_yyyyyyyz*M_yyyy + &
      D_yyyyyyyzz*M_yyyyz + D_yyyyyyz*M_yyy + D_yyyyyyzz*M_yyyz + &
      D_yyyyyyzzz*M_yyyzz + D_yyyyyz*M_yy + D_yyyyyzz*M_yyz + &
      D_yyyyyzzz*M_yyzz + D_yyyyyzzzz*M_yyzzz + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyyzzz*M_yzz + D_yyyyzzzz*M_yzzz + D_yyyyzzzzz*M_yzzzz &
      + D_yyyz*M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz + &
      D_yyyzzzzz*M_zzzz + D_yyyzzzzzz*M_zzzzz)
    D_yyzzzzzzz = -(D_xxyyzzzzz + D_yyyyzzzzz)
    L_yy        = L_yy + (D_xxxxxxxyy*M_xxxxxxx + D_xxxxxxyy*M_xxxxxx + D_xxxxxxyyy*M_xxxxxxy + &
      D_xxxxxxyyz*M_xxxxxxz + D_xxxxxyy*M_xxxxx + D_xxxxxyyy*M_xxxxxy + &
      D_xxxxxyyyy*M_xxxxxyy + D_xxxxxyyyz*M_xxxxxyz + D_xxxxxyyz* &
      M_xxxxxz + D_xxxxxyyzz*M_xxxxxzz + D_xxxxyy*M_xxxx + D_xxxxyyy* &
      M_xxxxy + D_xxxxyyyy*M_xxxxyy + D_xxxxyyyyy*M_xxxxyyy + &
      D_xxxxyyyyz*M_xxxxyyz + D_xxxxyyyz*M_xxxxyz + D_xxxxyyyzz* &
      M_xxxxyzz + D_xxxxyyz*M_xxxxz + D_xxxxyyzz*M_xxxxzz + D_xxxxyyzzz &
      *M_xxxxzzz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy*M_xxxyy &
      + D_xxxyyyyy*M_xxxyyy + D_xxxyyyyyy*M_xxxyyyy + D_xxxyyyyyz* &
      M_xxxyyyz + D_xxxyyyyz*M_xxxyyz + D_xxxyyyyzz*M_xxxyyzz + &
      D_xxxyyyz*M_xxxyz + D_xxxyyyzz*M_xxxyzz + D_xxxyyyzzz*M_xxxyzzz + &
      D_xxxyyz*M_xxxz + D_xxxyyzz*M_xxxzz + D_xxxyyzzz*M_xxxzzz + &
      D_xxxyyzzzz*M_xxxzzzz + D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyy* &
      M_xxyy + D_xxyyyyy*M_xxyyy + D_xxyyyyyy*M_xxyyyy + D_xxyyyyyyy* &
      M_xxyyyyy + D_xxyyyyyyz*M_xxyyyyz + D_xxyyyyyz*M_xxyyyz + &
      D_xxyyyyyzz*M_xxyyyzz + D_xxyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyyzz + &
      D_xxyyyyzzz*M_xxyyzzz + D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + &
      D_xxyyyzzz*M_xxyzzz + D_xxyyyzzzz*M_xxyzzzz + D_xxyyz*M_xxz + &
      D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xxyyzzzz*M_xxzzzz + &
      D_xxyyzzzzz*M_xxzzzzz + D_xyy*M_x + D_xyyy*M_xy + D_xyyyy*M_xyy + &
      D_xyyyyy*M_xyyy + D_xyyyyyy*M_xyyyy + D_xyyyyyyy*M_xyyyyy + &
      D_xyyyyyyyy*M_xyyyyyy + D_xyyyyyyyz*M_xyyyyyz + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyyyyzz*M_xyyyyzz + D_xyyyyyz*M_xyyyz + D_xyyyyyzz &
      *M_xyyyzz + D_xyyyyyzzz*M_xyyyzzz + D_xyyyyz*M_xyyz + D_xyyyyzz* &
      M_xyyzz + D_xyyyyzzz*M_xyyzzz + D_xyyyyzzzz*M_xyyzzzz + D_xyyyz* &
      M_xyz + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyyzzzz*M_xyzzzz &
      + D_xyyyzzzzz*M_xyzzzzz + D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz* &
      M_xzzz + D_xyyzzzz*M_xzzzz + D_xyyzzzzz*M_xzzzzz + D_xyyzzzzzz* &
      M_xzzzzzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + &
      D_yyyyyy*M_yyyy + D_yyyyyyy*M_yyyyy + D_yyyyyyyy*M_yyyyyy + &
      D_yyyyyyyyy*M_yyyyyyy + D_yyyyyyyyz*M_yyyyyyz + D_yyyyyyyz* &
      M_yyyyyz + D_yyyyyyyzz*M_yyyyyzz + D_yyyyyyz*M_yyyyz + D_yyyyyyzz &
      *M_yyyyzz + D_yyyyyyzzz*M_yyyyzzz + D_yyyyyz*M_yyyz + D_yyyyyzz* &
      M_yyyzz + D_yyyyyzzz*M_yyyzzz + D_yyyyyzzzz*M_yyyzzzz + D_yyyyz* &
      M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz*M_yyzzz + D_yyyyzzzz*M_yyzzzz &
      + D_yyyyzzzzz*M_yyzzzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz* &
      M_yzzz + D_yyyzzzz*M_yzzzz + D_yyyzzzzz*M_yzzzzz + D_yyyzzzzzz* &
      M_yzzzzzz + D_yyz*M_z + D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz* &
      M_zzzz + D_yyzzzzz*M_zzzzz + D_yyzzzzzz*M_zzzzzz + D_yyzzzzzzz* &
      M_zzzzzzz)
    L_yyz       = L_yyz + (D_xxxxxxyyz*M_xxxxxx + D_xxxxxyyyz*M_xxxxxy + D_xxxxxyyz*M_xxxxx + &
      D_xxxxxyyzz*M_xxxxxz + D_xxxxyyyyz*M_xxxxyy + D_xxxxyyyz*M_xxxxy &
      + D_xxxxyyyzz*M_xxxxyz + D_xxxxyyz*M_xxxx + D_xxxxyyzz*M_xxxxz + &
      D_xxxxyyzzz*M_xxxxzz + D_xxxyyyyyz*M_xxxyyy + D_xxxyyyyz*M_xxxyy &
      + D_xxxyyyyzz*M_xxxyyz + D_xxxyyyz*M_xxxy + D_xxxyyyzz*M_xxxyz + &
      D_xxxyyyzzz*M_xxxyzz + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + &
      D_xxxyyzzz*M_xxxzz + D_xxxyyzzzz*M_xxxzzz + D_xxyyyyyyz*M_xxyyyy &
      + D_xxyyyyyz*M_xxyyy + D_xxyyyyyzz*M_xxyyyz + D_xxyyyyz*M_xxyy + &
      D_xxyyyyzz*M_xxyyz + D_xxyyyyzzz*M_xxyyzz + D_xxyyyz*M_xxy + &
      D_xxyyyzz*M_xxyz + D_xxyyyzzz*M_xxyzz + D_xxyyyzzzz*M_xxyzzz + &
      D_xxyyz*M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xxyyzzzz* &
      M_xxzzz + D_xxyyzzzzz*M_xxzzzz + D_xyyyyyyyz*M_xyyyyy + &
      D_xyyyyyyz*M_xyyyy + D_xyyyyyyzz*M_xyyyyz + D_xyyyyyz*M_xyyy + &
      D_xyyyyyzz*M_xyyyz + D_xyyyyyzzz*M_xyyyzz + D_xyyyyz*M_xyy + &
      D_xyyyyzz*M_xyyz + D_xyyyyzzz*M_xyyzz + D_xyyyyzzzz*M_xyyzzz + &
      D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyyzzz*M_xyzz + D_xyyyzzzz* &
      M_xyzzz + D_xyyyzzzzz*M_xyzzzz + D_xyyz*M_x + D_xyyzz*M_xz + &
      D_xyyzzz*M_xzz + D_xyyzzzz*M_xzzz + D_xyyzzzzz*M_xzzzz + &
      D_xyyzzzzzz*M_xzzzzz + D_yyyyyyyyz*M_yyyyyy + D_yyyyyyyz*M_yyyyy &
      + D_yyyyyyyzz*M_yyyyyz + D_yyyyyyz*M_yyyy + D_yyyyyyzz*M_yyyyz + &
      D_yyyyyyzzz*M_yyyyzz + D_yyyyyz*M_yyy + D_yyyyyzz*M_yyyz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyyzzzz*M_yyyzzz + D_yyyyz*M_yy + &
      D_yyyyzz*M_yyz + D_yyyyzzz*M_yyzz + D_yyyyzzzz*M_yyzzz + &
      D_yyyyzzzzz*M_yyzzzz + D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz &
      + D_yyyzzzz*M_yzzz + D_yyyzzzzz*M_yzzzz + D_yyyzzzzzz*M_yzzzzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + &
      D_yyzzzzz*M_zzzz + D_yyzzzzzz*M_zzzzz + D_yyzzzzzzz*M_zzzzzz)
    D_yzzzzzzzz = -(D_xxyzzzzzz + D_yyyzzzzzz)
    L_y         = L_y + (D_xxxxxxxxy*M_xxxxxxxx + D_xxxxxxxy*M_xxxxxxx + D_xxxxxxxyy*M_xxxxxxxy + &
      D_xxxxxxxyz*M_xxxxxxxz + D_xxxxxxy*M_xxxxxx + D_xxxxxxyy* &
      M_xxxxxxy + D_xxxxxxyyy*M_xxxxxxyy + D_xxxxxxyyz*M_xxxxxxyz + &
      D_xxxxxxyz*M_xxxxxxz + D_xxxxxxyzz*M_xxxxxxzz + D_xxxxxy*M_xxxxx &
      + D_xxxxxyy*M_xxxxxy + D_xxxxxyyy*M_xxxxxyy + D_xxxxxyyyy* &
      M_xxxxxyyy + D_xxxxxyyyz*M_xxxxxyyz + D_xxxxxyyz*M_xxxxxyz + &
      D_xxxxxyyzz*M_xxxxxyzz + D_xxxxxyz*M_xxxxxz + D_xxxxxyzz* &
      M_xxxxxzz + D_xxxxxyzzz*M_xxxxxzzz + D_xxxxy*M_xxxx + D_xxxxyy* &
      M_xxxxy + D_xxxxyyy*M_xxxxyy + D_xxxxyyyy*M_xxxxyyy + D_xxxxyyyyy &
      *M_xxxxyyyy + D_xxxxyyyyz*M_xxxxyyyz + D_xxxxyyyz*M_xxxxyyz + &
      D_xxxxyyyzz*M_xxxxyyzz + D_xxxxyyz*M_xxxxyz + D_xxxxyyzz* &
      M_xxxxyzz + D_xxxxyyzzz*M_xxxxyzzz + D_xxxxyz*M_xxxxz + D_xxxxyzz &
      *M_xxxxzz + D_xxxxyzzz*M_xxxxzzz + D_xxxxyzzzz*M_xxxxzzzz + &
      D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy* &
      M_xxxyyy + D_xxxyyyyy*M_xxxyyyy + D_xxxyyyyyy*M_xxxyyyyy + &
      D_xxxyyyyyz*M_xxxyyyyz + D_xxxyyyyz*M_xxxyyyz + D_xxxyyyyzz* &
      M_xxxyyyzz + D_xxxyyyz*M_xxxyyz + D_xxxyyyzz*M_xxxyyzz + &
      D_xxxyyyzzz*M_xxxyyzzz + D_xxxyyz*M_xxxyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyyzzz*M_xxxyzzz + D_xxxyyzzzz*M_xxxyzzzz + D_xxxyz*M_xxxz + &
      D_xxxyzz*M_xxxzz + D_xxxyzzz*M_xxxzzz + D_xxxyzzzz*M_xxxzzzz + &
      D_xxxyzzzzz*M_xxxzzzzz + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyy* &
      M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyyy*M_xxyyyy + D_xxyyyyyy* &
      M_xxyyyyy + D_xxyyyyyyy*M_xxyyyyyy + D_xxyyyyyyz*M_xxyyyyyz + &
      D_xxyyyyyz*M_xxyyyyz + D_xxyyyyyzz*M_xxyyyyzz + D_xxyyyyz* &
      M_xxyyyz + D_xxyyyyzz*M_xxyyyzz + D_xxyyyyzzz*M_xxyyyzzz + &
      D_xxyyyz*M_xxyyz + D_xxyyyzz*M_xxyyzz + D_xxyyyzzz*M_xxyyzzz + &
      D_xxyyyzzzz*M_xxyyzzzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyyzzzz*M_xxyzzzz + D_xxyyzzzzz* &
      M_xxyzzzzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz + D_xxyzzz*M_xxzzz + &
      D_xxyzzzz*M_xxzzzz + D_xxyzzzzz*M_xxzzzzz + D_xxyzzzzzz* &
      M_xxzzzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + D_xyyyy* &
      M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + D_xyyyyyyy* &
      M_xyyyyyy + D_xyyyyyyyy*M_xyyyyyyy + D_xyyyyyyyz*M_xyyyyyyz + &
      D_xyyyyyyz*M_xyyyyyz + D_xyyyyyyzz*M_xyyyyyzz + D_xyyyyyz* &
      M_xyyyyz + D_xyyyyyzz*M_xyyyyzz + D_xyyyyyzzz*M_xyyyyzzz + &
      D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + D_xyyyyzzz*M_xyyyzzz + &
      D_xyyyyzzzz*M_xyyyzzzz + D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + &
      D_xyyyzzz*M_xyyzzz + D_xyyyzzzz*M_xyyzzzz + D_xyyyzzzzz* &
      M_xyyzzzzz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + &
      D_xyyzzzz*M_xyzzzz + D_xyyzzzzz*M_xyzzzzz + D_xyyzzzzzz* &
      M_xyzzzzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + &
      D_xyzzzz*M_xzzzz + D_xyzzzzz*M_xzzzzz + D_xyzzzzzz*M_xzzzzzz + &
      D_xyzzzzzzz*M_xzzzzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy &
      *M_yyy + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + &
      D_yyyyyyyy*M_yyyyyyy + D_yyyyyyyyy*M_yyyyyyyy + D_yyyyyyyyz* &
      M_yyyyyyyz + D_yyyyyyyz*M_yyyyyyz + D_yyyyyyyzz*M_yyyyyyzz + &
      D_yyyyyyz*M_yyyyyz + D_yyyyyyzz*M_yyyyyzz + D_yyyyyyzzz* &
      M_yyyyyzzz + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + D_yyyyyzzz* &
      M_yyyyzzz + D_yyyyyzzzz*M_yyyyzzzz + D_yyyyz*M_yyyz + D_yyyyzz* &
      M_yyyzz + D_yyyyzzz*M_yyyzzz + D_yyyyzzzz*M_yyyzzzz + D_yyyyzzzzz &
      *M_yyyzzzzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyyzzz*M_yyzzz + &
      D_yyyzzzz*M_yyzzzz + D_yyyzzzzz*M_yyzzzzz + D_yyyzzzzzz* &
      M_yyzzzzzz + D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + &
      D_yyzzzz*M_yzzzz + D_yyzzzzz*M_yzzzzz + D_yyzzzzzz*M_yzzzzzz + &
      D_yyzzzzzzz*M_yzzzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + &
      D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz + &
      D_yzzzzzzz*M_zzzzzzz + D_yzzzzzzzz*M_zzzzzzzz)
    L_yz        = L_yz + (D_xxxxxxxyz*M_xxxxxxx + D_xxxxxxyyz*M_xxxxxxy + D_xxxxxxyz*M_xxxxxx + &
      D_xxxxxxyzz*M_xxxxxxz + D_xxxxxyyyz*M_xxxxxyy + D_xxxxxyyz* &
      M_xxxxxy + D_xxxxxyyzz*M_xxxxxyz + D_xxxxxyz*M_xxxxx + D_xxxxxyzz &
      *M_xxxxxz + D_xxxxxyzzz*M_xxxxxzz + D_xxxxyyyyz*M_xxxxyyy + &
      D_xxxxyyyz*M_xxxxyy + D_xxxxyyyzz*M_xxxxyyz + D_xxxxyyz*M_xxxxy + &
      D_xxxxyyzz*M_xxxxyz + D_xxxxyyzzz*M_xxxxyzz + D_xxxxyz*M_xxxx + &
      D_xxxxyzz*M_xxxxz + D_xxxxyzzz*M_xxxxzz + D_xxxxyzzzz*M_xxxxzzz + &
      D_xxxyyyyyz*M_xxxyyyy + D_xxxyyyyz*M_xxxyyy + D_xxxyyyyzz* &
      M_xxxyyyz + D_xxxyyyz*M_xxxyy + D_xxxyyyzz*M_xxxyyz + D_xxxyyyzzz &
      *M_xxxyyzz + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz + D_xxxyyzzz* &
      M_xxxyzz + D_xxxyyzzzz*M_xxxyzzz + D_xxxyz*M_xxx + D_xxxyzz* &
      M_xxxz + D_xxxyzzz*M_xxxzz + D_xxxyzzzz*M_xxxzzz + D_xxxyzzzzz* &
      M_xxxzzzz + D_xxyyyyyyz*M_xxyyyyy + D_xxyyyyyz*M_xxyyyy + &
      D_xxyyyyyzz*M_xxyyyyz + D_xxyyyyz*M_xxyyy + D_xxyyyyzz*M_xxyyyz + &
      D_xxyyyyzzz*M_xxyyyzz + D_xxyyyz*M_xxyy + D_xxyyyzz*M_xxyyz + &
      D_xxyyyzzz*M_xxyyzz + D_xxyyyzzzz*M_xxyyzzz + D_xxyyz*M_xxy + &
      D_xxyyzz*M_xxyz + D_xxyyzzz*M_xxyzz + D_xxyyzzzz*M_xxyzzz + &
      D_xxyyzzzzz*M_xxyzzzz + D_xxyz*M_xx + D_xxyzz*M_xxz + D_xxyzzz* &
      M_xxzz + D_xxyzzzz*M_xxzzz + D_xxyzzzzz*M_xxzzzz + D_xxyzzzzzz* &
      M_xxzzzzz + D_xyyyyyyyz*M_xyyyyyy + D_xyyyyyyz*M_xyyyyy + &
      D_xyyyyyyzz*M_xyyyyyz + D_xyyyyyz*M_xyyyy + D_xyyyyyzz*M_xyyyyz + &
      D_xyyyyyzzz*M_xyyyyzz + D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + &
      D_xyyyyzzz*M_xyyyzz + D_xyyyyzzzz*M_xyyyzzz + D_xyyyz*M_xyy + &
      D_xyyyzz*M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyyzzzz*M_xyyzzz + &
      D_xyyyzzzzz*M_xyyzzzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz* &
      M_xyzz + D_xyyzzzz*M_xyzzz + D_xyyzzzzz*M_xyzzzz + D_xyyzzzzzz* &
      M_xyzzzzz + D_xyz*M_x + D_xyzz*M_xz + D_xyzzz*M_xzz + D_xyzzzz* &
      M_xzzz + D_xyzzzzz*M_xzzzz + D_xyzzzzzz*M_xzzzzz + D_xyzzzzzzz* &
      M_xzzzzzz + D_yyyyyyyyz*M_yyyyyyy + D_yyyyyyyz*M_yyyyyy + &
      D_yyyyyyyzz*M_yyyyyyz + D_yyyyyyz*M_yyyyy + D_yyyyyyzz*M_yyyyyz + &
      D_yyyyyyzzz*M_yyyyyzz + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + &
      D_yyyyyzzz*M_yyyyzz + D_yyyyyzzzz*M_yyyyzzz + D_yyyyz*M_yyy + &
      D_yyyyzz*M_yyyz + D_yyyyzzz*M_yyyzz + D_yyyyzzzz*M_yyyzzz + &
      D_yyyyzzzzz*M_yyyzzzz + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyyzzz* &
      M_yyzz + D_yyyzzzz*M_yyzzz + D_yyyzzzzz*M_yyzzzz + D_yyyzzzzzz* &
      M_yyzzzzz + D_yyz*M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yyzzzz* &
      M_yzzz + D_yyzzzzz*M_yzzzz + D_yyzzzzzz*M_yzzzzz + D_yyzzzzzzz* &
      M_yzzzzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz + D_yzzzz*M_zzz + &
      D_yzzzzz*M_zzzz + D_yzzzzzz*M_zzzzz + D_yzzzzzzz*M_zzzzzz + &
      D_yzzzzzzzz*M_zzzzzzz)
    D_zzzzzzzzz = -(D_xxzzzzzzz + D_yyzzzzzzz)
    L_0         = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxxx* &
      M_xxxxxxxx + D_xxxxxxxxx*M_xxxxxxxxx + D_xxxxxxxxy*M_xxxxxxxxy + &
      D_xxxxxxxxz*M_xxxxxxxxz + D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxyy* &
      M_xxxxxxxyy + D_xxxxxxxyz*M_xxxxxxxyz + D_xxxxxxxz*M_xxxxxxxz + &
      D_xxxxxxxzz*M_xxxxxxxzz + D_xxxxxxy*M_xxxxxxy + D_xxxxxxyy* &
      M_xxxxxxyy + D_xxxxxxyyy*M_xxxxxxyyy + D_xxxxxxyyz*M_xxxxxxyyz + &
      D_xxxxxxyz*M_xxxxxxyz + D_xxxxxxyzz*M_xxxxxxyzz + D_xxxxxxz* &
      M_xxxxxxz + D_xxxxxxzz*M_xxxxxxzz + D_xxxxxxzzz*M_xxxxxxzzz + &
      D_xxxxxy*M_xxxxxy + D_xxxxxyy*M_xxxxxyy + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxyyyy*M_xxxxxyyyy + D_xxxxxyyyz*M_xxxxxyyyz + D_xxxxxyyz* &
      M_xxxxxyyz + D_xxxxxyyzz*M_xxxxxyyzz + D_xxxxxyz*M_xxxxxyz + &
      D_xxxxxyzz*M_xxxxxyzz + D_xxxxxyzzz*M_xxxxxyzzz + D_xxxxxz* &
      M_xxxxxz + D_xxxxxzz*M_xxxxxzz + D_xxxxxzzz*M_xxxxxzzz + &
      D_xxxxxzzzz*M_xxxxxzzzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + &
      D_xxxxyyy*M_xxxxyyy + D_xxxxyyyy*M_xxxxyyyy + D_xxxxyyyyy* &
      M_xxxxyyyyy + D_xxxxyyyyz*M_xxxxyyyyz + D_xxxxyyyz*M_xxxxyyyz + &
      D_xxxxyyyzz*M_xxxxyyyzz + D_xxxxyyz*M_xxxxyyz + D_xxxxyyzz* &
      M_xxxxyyzz + D_xxxxyyzzz*M_xxxxyyzzz + D_xxxxyz*M_xxxxyz + &
      D_xxxxyzz*M_xxxxyzz + D_xxxxyzzz*M_xxxxyzzz + D_xxxxyzzzz* &
      M_xxxxyzzzz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxxzzz* &
      M_xxxxzzz + D_xxxxzzzz*M_xxxxzzzz + D_xxxxzzzzz*M_xxxxzzzzz + &
      D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyyy* &
      M_xxxyyyy + D_xxxyyyyy*M_xxxyyyyy + D_xxxyyyyyy*M_xxxyyyyyy + &
      D_xxxyyyyyz*M_xxxyyyyyz + D_xxxyyyyz*M_xxxyyyyz + D_xxxyyyyzz* &
      M_xxxyyyyzz + D_xxxyyyz*M_xxxyyyz + D_xxxyyyzz*M_xxxyyyzz + &
      D_xxxyyyzzz*M_xxxyyyzzz + D_xxxyyz*M_xxxyyz + D_xxxyyzz*M_xxxyyzz &
      + D_xxxyyzzz*M_xxxyyzzz + D_xxxyyzzzz*M_xxxyyzzzz + D_xxxyz* &
      M_xxxyz + D_xxxyzz*M_xxxyzz + D_xxxyzzz*M_xxxyzzz + D_xxxyzzzz* &
      M_xxxyzzzz + D_xxxyzzzzz*M_xxxyzzzzz + D_xxxz*M_xxxz + D_xxxzz* &
      M_xxxzz + D_xxxzzz*M_xxxzzz + D_xxxzzzz*M_xxxzzzz + D_xxxzzzzz* &
      M_xxxzzzzz + D_xxxzzzzzz*M_xxxzzzzzz + D_xxy*M_xxy + D_xxyy* &
      M_xxyy + D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy* &
      M_xxyyyyy + D_xxyyyyyy*M_xxyyyyyy + D_xxyyyyyyy*M_xxyyyyyyy + &
      D_xxyyyyyyz*M_xxyyyyyyz + D_xxyyyyyz*M_xxyyyyyz + D_xxyyyyyzz* &
      M_xxyyyyyzz + D_xxyyyyz*M_xxyyyyz + D_xxyyyyzz*M_xxyyyyzz + &
      D_xxyyyyzzz*M_xxyyyyzzz + D_xxyyyz*M_xxyyyz + D_xxyyyzz*M_xxyyyzz &
      + D_xxyyyzzz*M_xxyyyzzz + D_xxyyyzzzz*M_xxyyyzzzz + D_xxyyz* &
      M_xxyyz + D_xxyyzz*M_xxyyzz + D_xxyyzzz*M_xxyyzzz + D_xxyyzzzz* &
      M_xxyyzzzz + D_xxyyzzzzz*M_xxyyzzzzz + D_xxyz*M_xxyz + D_xxyzz* &
      M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz*M_xxyzzzz + D_xxyzzzzz* &
      M_xxyzzzzz + D_xxyzzzzzz*M_xxyzzzzzz + D_xxz*M_xxz + D_xxzz* &
      M_xxzz + D_xxzzz*M_xxzzz + D_xxzzzz*M_xxzzzz + D_xxzzzzz* &
      M_xxzzzzz + D_xxzzzzzz*M_xxzzzzzz + D_xxzzzzzzz*M_xxzzzzzzz + &
      D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + D_xyyyy*M_xyyyy + &
      D_xyyyyy*M_xyyyyy + D_xyyyyyy*M_xyyyyyy + D_xyyyyyyy*M_xyyyyyyy + &
      D_xyyyyyyyy*M_xyyyyyyyy + D_xyyyyyyyz*M_xyyyyyyyz + D_xyyyyyyz* &
      M_xyyyyyyz + D_xyyyyyyzz*M_xyyyyyyzz + D_xyyyyyz*M_xyyyyyz + &
      D_xyyyyyzz*M_xyyyyyzz + D_xyyyyyzzz*M_xyyyyyzzz + D_xyyyyz* &
      M_xyyyyz + D_xyyyyzz*M_xyyyyzz + D_xyyyyzzz*M_xyyyyzzz + &
      D_xyyyyzzzz*M_xyyyyzzzz + D_xyyyz*M_xyyyz + D_xyyyzz*M_xyyyzz + &
      D_xyyyzzz*M_xyyyzzz + D_xyyyzzzz*M_xyyyzzzz + D_xyyyzzzzz* &
      M_xyyyzzzzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz &
      + D_xyyzzzz*M_xyyzzzz + D_xyyzzzzz*M_xyyzzzzz + D_xyyzzzzzz* &
      M_xyyzzzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz + &
      D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + D_xyzzzzzz*M_xyzzzzzz + &
      D_xyzzzzzzz*M_xyzzzzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz &
      + D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_xzzzzzz*M_xzzzzzz + &
      D_xzzzzzzz*M_xzzzzzzz + D_xzzzzzzzz*M_xzzzzzzzz + D_y*M_y + D_yy* &
      M_yy + D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy* &
      M_yyyyyy + D_yyyyyyy*M_yyyyyyy + D_yyyyyyyy*M_yyyyyyyy + &
      D_yyyyyyyyy*M_yyyyyyyyy + D_yyyyyyyyz*M_yyyyyyyyz + D_yyyyyyyz* &
      M_yyyyyyyz + D_yyyyyyyzz*M_yyyyyyyzz + D_yyyyyyz*M_yyyyyyz + &
      D_yyyyyyzz*M_yyyyyyzz + D_yyyyyyzzz*M_yyyyyyzzz + D_yyyyyz* &
      M_yyyyyz + D_yyyyyzz*M_yyyyyzz + D_yyyyyzzz*M_yyyyyzzz + &
      D_yyyyyzzzz*M_yyyyyzzzz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + &
      D_yyyyzzz*M_yyyyzzz + D_yyyyzzzz*M_yyyyzzzz + D_yyyyzzzzz* &
      M_yyyyzzzzz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz &
      + D_yyyzzzz*M_yyyzzzz + D_yyyzzzzz*M_yyyzzzzz + D_yyyzzzzzz* &
      M_yyyzzzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + &
      D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + D_yyzzzzzz*M_yyzzzzzz + &
      D_yyzzzzzzz*M_yyzzzzzzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz &
      + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz + D_yzzzzzz*M_yzzzzzz + &
      D_yzzzzzzz*M_yzzzzzzz + D_yzzzzzzzz*M_yzzzzzzzz + D_z*M_z + D_zz* &
      M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz* &
      M_zzzzzz + D_zzzzzzz*M_zzzzzzz + D_zzzzzzzz*M_zzzzzzzz + &
      D_zzzzzzzzz*M_zzzzzzzzz)
    L_z         = L_z + (D_xxxxxxxxz*M_xxxxxxxx + D_xxxxxxxyz*M_xxxxxxxy + D_xxxxxxxz*M_xxxxxxx + &
      D_xxxxxxxzz*M_xxxxxxxz + D_xxxxxxyyz*M_xxxxxxyy + D_xxxxxxyz* &
      M_xxxxxxy + D_xxxxxxyzz*M_xxxxxxyz + D_xxxxxxz*M_xxxxxx + &
      D_xxxxxxzz*M_xxxxxxz + D_xxxxxxzzz*M_xxxxxxzz + D_xxxxxyyyz* &
      M_xxxxxyyy + D_xxxxxyyz*M_xxxxxyy + D_xxxxxyyzz*M_xxxxxyyz + &
      D_xxxxxyz*M_xxxxxy + D_xxxxxyzz*M_xxxxxyz + D_xxxxxyzzz* &
      M_xxxxxyzz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + D_xxxxxzzz* &
      M_xxxxxzz + D_xxxxxzzzz*M_xxxxxzzz + D_xxxxyyyyz*M_xxxxyyyy + &
      D_xxxxyyyz*M_xxxxyyy + D_xxxxyyyzz*M_xxxxyyyz + D_xxxxyyz* &
      M_xxxxyy + D_xxxxyyzz*M_xxxxyyz + D_xxxxyyzzz*M_xxxxyyzz + &
      D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + D_xxxxyzzz*M_xxxxyzz + &
      D_xxxxyzzzz*M_xxxxyzzz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + &
      D_xxxxzzz*M_xxxxzz + D_xxxxzzzz*M_xxxxzzz + D_xxxxzzzzz* &
      M_xxxxzzzz + D_xxxyyyyyz*M_xxxyyyyy + D_xxxyyyyz*M_xxxyyyy + &
      D_xxxyyyyzz*M_xxxyyyyz + D_xxxyyyz*M_xxxyyy + D_xxxyyyzz* &
      M_xxxyyyz + D_xxxyyyzzz*M_xxxyyyzz + D_xxxyyz*M_xxxyy + D_xxxyyzz &
      *M_xxxyyz + D_xxxyyzzz*M_xxxyyzz + D_xxxyyzzzz*M_xxxyyzzz + &
      D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + &
      D_xxxyzzzz*M_xxxyzzz + D_xxxyzzzzz*M_xxxyzzzz + D_xxxz*M_xxx + &
      D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz*M_xxxzzz + &
      D_xxxzzzzz*M_xxxzzzz + D_xxxzzzzzz*M_xxxzzzzz + D_xxyyyyyyz* &
      M_xxyyyyyy + D_xxyyyyyz*M_xxyyyyy + D_xxyyyyyzz*M_xxyyyyyz + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz + D_xxyyyyzzz* &
      M_xxyyyyzz + D_xxyyyz*M_xxyyy + D_xxyyyzz*M_xxyyyz + D_xxyyyzzz* &
      M_xxyyyzz + D_xxyyyzzzz*M_xxyyyzzz + D_xxyyz*M_xxyy + D_xxyyzz* &
      M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyyzzzz*M_xxyyzzz + D_xxyyzzzzz &
      *M_xxyyzzzz + D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + &
      D_xxyzzzz*M_xxyzzz + D_xxyzzzzz*M_xxyzzzz + D_xxyzzzzzz* &
      M_xxyzzzzz + D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + &
      D_xxzzzz*M_xxzzz + D_xxzzzzz*M_xxzzzz + D_xxzzzzzz*M_xxzzzzz + &
      D_xxzzzzzzz*M_xxzzzzzz + D_xyyyyyyyz*M_xyyyyyyy + D_xyyyyyyz* &
      M_xyyyyyy + D_xyyyyyyzz*M_xyyyyyyz + D_xyyyyyz*M_xyyyyy + &
      D_xyyyyyzz*M_xyyyyyz + D_xyyyyyzzz*M_xyyyyyzz + D_xyyyyz*M_xyyyy &
      + D_xyyyyzz*M_xyyyyz + D_xyyyyzzz*M_xyyyyzz + D_xyyyyzzzz* &
      M_xyyyyzzz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + D_xyyyzzz* &
      M_xyyyzz + D_xyyyzzzz*M_xyyyzzz + D_xyyyzzzzz*M_xyyyzzzz + D_xyyz &
      *M_xyy + D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + D_xyyzzzz*M_xyyzzz + &
      D_xyyzzzzz*M_xyyzzzz + D_xyyzzzzzz*M_xyyzzzzz + D_xyz*M_xy + &
      D_xyzz*M_xyz + D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + D_xyzzzzz* &
      M_xyzzzz + D_xyzzzzzz*M_xyzzzzz + D_xyzzzzzzz*M_xyzzzzzz + D_xz* &
      M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_xzzzzzz*M_xzzzzz + D_xzzzzzzz*M_xzzzzzz + D_xzzzzzzzz &
      *M_xzzzzzzz + D_yyyyyyyyz*M_yyyyyyyy + D_yyyyyyyz*M_yyyyyyy + &
      D_yyyyyyyzz*M_yyyyyyyz + D_yyyyyyz*M_yyyyyy + D_yyyyyyzz* &
      M_yyyyyyz + D_yyyyyyzzz*M_yyyyyyzz + D_yyyyyz*M_yyyyy + D_yyyyyzz &
      *M_yyyyyz + D_yyyyyzzz*M_yyyyyzz + D_yyyyyzzzz*M_yyyyyzzz + &
      D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + D_yyyyzzz*M_yyyyzz + &
      D_yyyyzzzz*M_yyyyzzz + D_yyyyzzzzz*M_yyyyzzzz + D_yyyz*M_yyy + &
      D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + D_yyyzzzz*M_yyyzzz + &
      D_yyyzzzzz*M_yyyzzzz + D_yyyzzzzzz*M_yyyzzzzz + D_yyz*M_yy + &
      D_yyzz*M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz* &
      M_yyzzzz + D_yyzzzzzz*M_yyzzzzz + D_yyzzzzzzz*M_yyzzzzzz + D_yz* &
      M_y + D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz* &
      M_yzzzz + D_yzzzzzz*M_yzzzzz + D_yzzzzzzz*M_yzzzzzz + D_yzzzzzzzz &
      *M_yzzzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + &
      D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz + &
      D_zzzzzzzz*M_zzzzzzz + D_zzzzzzzzz*M_zzzzzzzz)
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  L_xx                
#undef  M_xx                
#undef  L_xy                
#undef  M_xy                
#undef  L_xz                
#undef  M_xz                
#undef  M_yy                
#undef  L_yy                
#undef  L_yz                
#undef  M_yz                
#undef  M_zz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_xzz               
#undef  M_yyy               
#undef  L_xxxx              
#undef  M_yyz               
#undef  L_xxxy              
#undef  M_yzz               
#undef  L_xxxz              
#undef  L_xxyy              
#undef  M_zzz               
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
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xyyy              
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
#undef  L_xyyyz             
#undef  M_yzzz              
#undef  L_yyyyy             
#undef  M_zzzz              
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  L_xxxxxx            
#undef  M_xxxxy             
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  L_xxxxxz            
#undef  M_xxxyy             
#undef  L_xxxxyy            
#undef  M_xxxyz             
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  L_xxxyyy            
#undef  M_xxyyy             
#undef  L_xxxyyz            
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  M_xxzzz             
#undef  L_xxyyyz            
#undef  M_xyyyy             
#undef  L_xyyyyy            
#undef  M_xyyyz             
#undef  L_xyyyyz            
#undef  M_xyyzz             
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  M_xyzzz             
#undef  M_xzzzz             
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  M_yyyyy             
#undef  L_xxxxxxz           
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  L_xxxxyyy           
#undef  M_zzzzz             
#undef  L_xxxxyyz           
#undef  M_xxxxxx            
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  L_xxyyyyy           
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
#undef  L_xxxxxxxx          
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  M_xxyyyy            
#undef  L_xxxxxxyy          
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  L_xxxxxxyz          
#undef  M_xxyzzz            
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxzzzz            
#undef  L_xxxxyyyy          
#undef  M_xyyyyy            
#undef  L_xxxxyyyz          
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  L_xxxyyyyy          
#undef  M_xyyzzz            
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  M_xyzzzz            
#undef  M_xzzzzz            
#undef  L_xxyyyyyz          
#undef  M_yyyyyy            
#undef  L_xyyyyyyy          
#undef  M_yyyyyz            
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  M_yyyyzz            
#undef  L_yyyyyyyz          
#undef  M_yyyzzz            
#undef  L_xxxxxxxxx         
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  L_xxxxxxxxy         
#undef  L_xxxxxxxxz         
#undef  M_zzzzzz            
#undef  L_xxxxxxxyy         
#undef  M_xxxxxxx           
#undef  L_xxxxxxxyz         
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  L_xxxxxxyyy         
#undef  L_xxxxxxyyz         
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  L_xxxxxyyyy         
#undef  M_xxxxxzz           
#undef  L_xxxxxyyyz         
#undef  M_xxxxyyy           
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  L_xxxyyyyyy         
#undef  M_xxxxzzz           
#undef  L_xxxyyyyyz         
#undef  L_xxyyyyyyy         
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxyyyyyyz         
#undef  L_xyyyyyyyy         
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  L_xyyyyyyyz         
#undef  M_xxxzzzz           
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
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
#undef  M_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  M_xxxxxxzz          
#undef  M_xxxxxyyy          
#undef  M_xxxxxyyz          
#undef  M_xxxxxyzz          
#undef  M_xxxxxzzz          
#undef  M_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  M_xxxxyyzz          
#undef  M_xxxxyzzz          
#undef  M_xxxxzzzz          
#undef  M_xxxyyyyy          
#undef  M_xxxyyyyz          
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  M_xxxyzzzz          
#undef  M_xxxzzzzz          
#undef  M_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  M_xxyyyyzz          
#undef  M_xxyyyzzz          
#undef  M_xxyyzzzz          
#undef  M_xxyzzzzz          
#undef  M_xxzzzzzz          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  M_xyyyyyzz          
#undef  M_xyyyyzzz          
#undef  M_xyyyzzzz          
#undef  M_xyyzzzzz          
#undef  M_xyzzzzzz          
#undef  M_xzzzzzzz          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
#undef  M_yyyyyyzz          
#undef  M_yyyyyzzz          
#undef  M_yyyyzzzz          
#undef  M_yyyzzzzz          
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  M_zzzzzzzz          
#undef  M_xxxxxxxxx         
#undef  M_xxxxxxxxy         
#undef  M_xxxxxxxxz         
#undef  M_xxxxxxxyy         
#undef  M_xxxxxxxyz         
#undef  M_xxxxxxxzz         
#undef  M_xxxxxxyyy         
#undef  M_xxxxxxyyz         
#undef  M_xxxxxxyzz         
#undef  M_xxxxxxzzz         
#undef  M_xxxxxyyyy         
#undef  M_xxxxxyyyz         
#undef  M_xxxxxyyzz         
#undef  M_xxxxxyzzz         
#undef  M_xxxxxzzzz         
#undef  M_xxxxyyyyy         
#undef  M_xxxxyyyyz         
#undef  M_xxxxyyyzz         
#undef  M_xxxxyyzzz         
#undef  M_xxxxyzzzz         
#undef  M_xxxxzzzzz         
#undef  M_xxxyyyyyy         
#undef  M_xxxyyyyyz         
#undef  M_xxxyyyyzz         
#undef  M_xxxyyyzzz         
#undef  M_xxxyyzzzz         
#undef  M_xxxyzzzzz         
#undef  M_xxxzzzzzz         
#undef  M_xxyyyyyyy         
#undef  M_xxyyyyyyz         
#undef  M_xxyyyyyzz         
#undef  M_xxyyyyzzz         
#undef  M_xxyyyzzzz         
#undef  M_xxyyzzzzz         
#undef  M_xxyzzzzzz         
#undef  M_xxzzzzzzz         
#undef  M_xyyyyyyyy         
#undef  M_xyyyyyyyz         
#undef  M_xyyyyyyzz         
#undef  M_xyyyyyzzz         
#undef  M_xyyyyzzzz         
#undef  M_xyyyzzzzz         
#undef  M_xyyzzzzzz         
#undef  M_xyzzzzzzz         
#undef  M_xzzzzzzzz         
#undef  M_yyyyyyyyy         
#undef  M_yyyyyyyyz         
#undef  M_yyyyyyyzz         
#undef  M_yyyyyyzzz         
#undef  M_yyyyyzzzz         
#undef  M_yyyyzzzzz         
#undef  M_yyyzzzzzz         
#undef  M_yyzzzzzzz         
#undef  M_yzzzzzzzz         
#undef  M_zzzzzzzzz         
    end subroutine mom_es_M2L_add
    
! OPS  1297*ADD + 2*DIV + 1539*MUL + 120*NEG + POW = 2959  (11370 before optimization)
subroutine mom_es_L2L_add(L, r, Ls)
    real(dp), intent(in)    :: L(0:MOM_ES_L_END)
    real(dp), intent(in)    :: r(1:3)
    real(dp), intent(inout) :: Ls(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v534, v535, v536, v537, v538, v539, v54, v540, v541, v542,&
                v543, v544, v545, v546, v547, v548, v549, v55, v550, v551,&
                v552, v553, v554, v555, v556, v557, v558, v559, v56, v560,&
                v561, v562, v563, v564, v565, v566, v567, v568, v569, v57,&
                v570, v571, v572, v573, v574, v575, v576, v577, v578, v579,&
                v58, v580, v581, v582, v583, v584, v585, v586, v587, v588,&
                v589, v59, v590, v591, v592, v593, v594, v595, v596, v597,&
                v598, v599, v6, v60, v600, v601, v602, v603, v604, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz,&
                L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz,&
                L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz,&
                L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz,&
                L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz, L_xxxxxxzz,&
                L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz, L_xxxxzzzz,&
                L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz, L_xxyyyyzz,&
                L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz, L_xyyyyyzz,&
                L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz, L_xzzzzzzz,&
                L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz,&
                L_yzzzzzzz, L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz, L_xxxxxxzzz,&
                L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz, L_xxxxyyyzz,&
                L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz, L_xxxyyyyzz,&
                L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz, L_xxxzzzzzz,&
                L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz, L_xxyyzzzzz,&
                L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz, L_xyyyyyzzz,&
                L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz, L_xyzzzzzzz,&
                L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz, L_yyyyyzzzz,&
                L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz, L_yzzzzzzzz,&
                L_zzzzzzzzz
#define y                    r(2)
#define Ls_0                 Ls(0)
#define L_0                  L(0)
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
#define L_xy                 L(5)
#define Ls_xy                Ls(5)
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
#define L_xxxz               L(18)
#define Ls_xxxz              Ls(18)
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
#define L_xxxxy              L(26)
#define Ls_xxxxy             Ls(26)
#define L_xxxxz              L(27)
#define Ls_xxxxz             Ls(27)
#define Ls_xxxyy             Ls(28)
#define L_xxxyy              L(28)
#define L_xxxyz              L(29)
#define Ls_xxxyz             Ls(29)
#define Ls_xxyyy             Ls(30)
#define L_xxyyy              L(30)
#define Ls_xxyyz             Ls(31)
#define L_xxyyz              L(31)
#define L_xyyyy              L(32)
#define Ls_xyyyy             Ls(32)
#define Ls_xyyyz             Ls(33)
#define L_xyyyz              L(33)
#define L_yyyyy              L(34)
#define Ls_yyyyy             Ls(34)
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
#define L_xxxxyz             L(40)
#define Ls_xxxxyz            Ls(40)
#define L_xxxyyy             L(41)
#define Ls_xxxyyy            Ls(41)
#define Ls_xxxyyz            Ls(42)
#define L_xxxyyz             L(42)
#define Ls_xxyyyy            Ls(43)
#define L_xxyyyy             L(43)
#define Ls_xxyyyz            Ls(44)
#define L_xxyyyz             L(44)
#define L_xyyyyy             L(45)
#define Ls_xyyyyy            Ls(45)
#define Ls_xyyyyz            Ls(46)
#define L_xyyyyz             L(46)
#define L_yyyyyy             L(47)
#define Ls_yyyyyy            Ls(47)
#define Ls_yyyyyz            Ls(48)
#define L_yyyyyz             L(48)
#define L_xxxxxxx            L(49)
#define Ls_xxxxxxx           Ls(49)
#define Ls_xxxxxxy           Ls(50)
#define L_xxxxxxy            L(50)
#define Ls_xxxxxxz           Ls(51)
#define L_xxxxxxz            L(51)
#define Ls_xxxxxyy           Ls(52)
#define L_xxxxxyy            L(52)
#define L_xxxxxyz            L(53)
#define Ls_xxxxxyz           Ls(53)
#define Ls_xxxxyyy           Ls(54)
#define L_xxxxyyy            L(54)
#define Ls_xxxxyyz           Ls(55)
#define L_xxxxyyz            L(55)
#define Ls_xxxyyyy           Ls(56)
#define L_xxxyyyy            L(56)
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
#define L_yyyyyyz            L(63)
#define Ls_yyyyyyz           Ls(63)
#define L_xxxxxxxx           L(64)
#define Ls_xxxxxxxx          Ls(64)
#define L_xxxxxxxy           L(65)
#define Ls_xxxxxxxy          Ls(65)
#define L_xxxxxxxz           L(66)
#define Ls_xxxxxxxz          Ls(66)
#define L_xxxxxxyy           L(67)
#define Ls_xxxxxxyy          Ls(67)
#define Ls_xxxxxxyz          Ls(68)
#define L_xxxxxxyz           L(68)
#define Ls_xxxxxyyy          Ls(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define Ls_xxxxxyyz          Ls(70)
#define L_xxxxyyyy           L(71)
#define Ls_xxxxyyyy          Ls(71)
#define L_xxxxyyyz           L(72)
#define Ls_xxxxyyyz          Ls(72)
#define L_xxxyyyyy           L(73)
#define Ls_xxxyyyyy          Ls(73)
#define Ls_xxxyyyyz          Ls(74)
#define L_xxxyyyyz           L(74)
#define L_xxyyyyyy           L(75)
#define Ls_xxyyyyyy          Ls(75)
#define Ls_xxyyyyyz          Ls(76)
#define L_xxyyyyyz           L(76)
#define L_xyyyyyyy           L(77)
#define Ls_xyyyyyyy          Ls(77)
#define Ls_xyyyyyyz          Ls(78)
#define L_xyyyyyyz           L(78)
#define L_yyyyyyyy           L(79)
#define Ls_yyyyyyyy          Ls(79)
#define Ls_yyyyyyyz          Ls(80)
#define L_yyyyyyyz           L(80)
#define L_xxxxxxxxx          L(81)
#define Ls_xxxxxxxxx         Ls(81)
#define L_xxxxxxxxy          L(82)
#define Ls_xxxxxxxxy         Ls(82)
#define Ls_xxxxxxxxz         Ls(83)
#define L_xxxxxxxxz          L(83)
#define L_xxxxxxxyy          L(84)
#define Ls_xxxxxxxyy         Ls(84)
#define Ls_xxxxxxxyz         Ls(85)
#define L_xxxxxxxyz          L(85)
#define L_xxxxxxyyy          L(86)
#define Ls_xxxxxxyyy         Ls(86)
#define Ls_xxxxxxyyz         Ls(87)
#define L_xxxxxxyyz          L(87)
#define Ls_xxxxxyyyy         Ls(88)
#define L_xxxxxyyyy          L(88)
#define L_xxxxxyyyz          L(89)
#define Ls_xxxxxyyyz         Ls(89)
#define Ls_xxxxyyyyy         Ls(90)
#define L_xxxxyyyyy          L(90)
#define L_xxxxyyyyz          L(91)
#define Ls_xxxxyyyyz         Ls(91)
#define L_xxxyyyyyy          L(92)
#define Ls_xxxyyyyyy         Ls(92)
#define L_xxxyyyyyz          L(93)
#define Ls_xxxyyyyyz         Ls(93)
#define Ls_xxyyyyyyy         Ls(94)
#define L_xxyyyyyyy          L(94)
#define Ls_xxyyyyyyz         Ls(95)
#define L_xxyyyyyyz          L(95)
#define Ls_xyyyyyyyy         Ls(96)
#define L_xyyyyyyyy          L(96)
#define Ls_xyyyyyyyz         Ls(97)
#define L_xyyyyyyyz          L(97)
#define Ls_yyyyyyyyy         Ls(98)
#define L_yyyyyyyyy          L(98)
#define L_yyyyyyyyz          L(99)
#define Ls_yyyyyyyyz         Ls(99)
    v0           = L_xxxxxxxx + L_xxxxxxxxy*y + L_xxxxxxxxz*z
    v1           = L_xxxxxxxy + L_xxxxxxxyz*z
    v2           = L_xxxxxxxyy*y + v1
    v3           = L_xxxxxxyy + L_xxxxxxyyz*z
    v4           = L_xxxxxxyyy*y + v3
    v5           = L_xxxxxyyy + L_xxxxxyyyz*z
    v6           = L_xxxxxyyyy*y + v5
    v7           = L_xxxxyyyy + L_xxxxyyyyz*z
    v8           = L_xxxxyyyyy*y + v7
    v9           = L_xxxyyyyy + L_xxxyyyyyz*z
    v10          = L_xxxyyyyyy*y + v9
    v11          = L_xxyyyyyy + L_xxyyyyyyz*z
    v12          = L_xxyyyyyyy*y + v11
    v13          = L_xyyyyyyy + L_xyyyyyyyz*z
    v14          = L_xyyyyyyyy*y + v13
    v15          = L_yyyyyyyy + L_yyyyyyyyz*z
    v16          = L_xxxxxxxz*z
    v23          = v1*y
    v25          = L_xxxxxxyz*z
    v28          = v3*y
    v31          = L_xxxxxxz*z
    v42          = 0.5d0*x
    v48          = L_xxxxxyyz*z
    v51          = v5*y
    v54          = L_xxxxxyz*z
    v65          = L_xxxxxz*z
    v79          = 0.166666666666667d0*x
    v89          = L_xxxxyyyz*z
    v92          = v7*y
    v95          = L_xxxxyyz*z
    v106         = L_xxxxyz*z
    v122         = L_xxxxz*z
    v139         = 0.0416666666666667d0*x
    v151         = L_xxxyyyyz*z
    v154         = v9*y
    v157         = L_xxxyyyz*z
    v168         = L_xxxyyz*z
    v184         = L_xxxyz*z
    v204         = L_xxxz*z
    v224         = 0.00833333333333333d0*x
    v238         = L_xxyyyyyz*z
    v241         = v11*y
    v244         = L_xxyyyyz*z
    v255         = L_xxyyyz*z
    v271         = L_xxyyz*z
    v291         = L_xxyz*z
    v315         = L_xxz*z
    v338         = 0.00138888888888889d0*x
    v354         = L_xyyyyyyz*z
    v357         = v13*y
    v360         = L_xyyyyyz*z
    v371         = L_xyyyyz*z
    v387         = L_xyyyz*z
    v407         = L_xyyz*z
    v431         = L_xyz*z
    v459         = L_xz*z
    v484         = 0.000198412698412698d0*x
    v502         = L_yyyyyyyz*z
    v505         = L_yyyyyyz*z
    v508         = 0.5d0*y
    v512         = L_yyyyyz*z
    v517         = 0.166666666666667d0*y
    v523         = L_yyyyz*z
    v530         = 0.0416666666666667d0*y
    v537         = L_yyyz*z
    v546         = 0.00833333333333333d0*y
    v554         = L_yyz*z
    v565         = 0.00138888888888889d0*y
    v574         = L_yz*z
    v588         = 0.000198412698412698d0*y
    Ls_xxxxxxxx  = Ls_xxxxxxxx + (L_xxxxxxxxx*x + v0)
    Ls_xxxxxxxy  = Ls_xxxxxxxy + (L_xxxxxxxxy*x + v2)
    Ls_xxxxxxyy  = Ls_xxxxxxyy + (L_xxxxxxxyy*x + v4)
    Ls_xxxxxyyy  = Ls_xxxxxyyy + (L_xxxxxxyyy*x + v6)
    Ls_xxxxyyyy  = Ls_xxxxyyyy + (L_xxxxxyyyy*x + v8)
    Ls_xxxyyyyy  = Ls_xxxyyyyy + (L_xxxxyyyyy*x + v10)
    Ls_xxyyyyyy  = Ls_xxyyyyyy + (L_xxxyyyyyy*x + v12)
    Ls_xyyyyyyy  = Ls_xyyyyyyy + (L_xxyyyyyyy*x + v14)
    Ls_yyyyyyyy  = Ls_yyyyyyyy + (v15 + L_xyyyyyyyy*x + L_yyyyyyyyy*y)
    Ls_xxxxxxxxx = Ls_xxxxxxxxx + (L_xxxxxxxxx)
    Ls_xxxxxxxxy = Ls_xxxxxxxxy + (L_xxxxxxxxy)
    Ls_xxxxxxxxz = Ls_xxxxxxxxz + (L_xxxxxxxxz)
    Ls_xxxxxxxyy = Ls_xxxxxxxyy + (L_xxxxxxxyy)
    Ls_xxxxxxxyz = Ls_xxxxxxxyz + (L_xxxxxxxyz)
    Ls_xxxxxxyyy = Ls_xxxxxxyyy + (L_xxxxxxyyy)
    Ls_xxxxxxyyz = Ls_xxxxxxyyz + (L_xxxxxxyyz)
    Ls_xxxxxyyyy = Ls_xxxxxyyyy + (L_xxxxxyyyy)
    Ls_xxxxxyyyz = Ls_xxxxxyyyz + (L_xxxxxyyyz)
    Ls_xxxxyyyyy = Ls_xxxxyyyyy + (L_xxxxyyyyy)
    Ls_xxxxyyyyz = Ls_xxxxyyyyz + (L_xxxxyyyyz)
    Ls_xxxyyyyyy = Ls_xxxyyyyyy + (L_xxxyyyyyy)
    Ls_xxxyyyyyz = Ls_xxxyyyyyz + (L_xxxyyyyyz)
    Ls_xxyyyyyyy = Ls_xxyyyyyyy + (L_xxyyyyyyy)
    Ls_xxyyyyyyz = Ls_xxyyyyyyz + (L_xxyyyyyyz)
    Ls_xyyyyyyyy = Ls_xyyyyyyyy + (L_xyyyyyyyy)
    Ls_xyyyyyyyz = Ls_xyyyyyyyz + (L_xyyyyyyyz)
    Ls_yyyyyyyyy = Ls_yyyyyyyyy + (L_yyyyyyyyy)
    Ls_yyyyyyyyz = Ls_yyyyyyyyz + (L_yyyyyyyyz)
    L_zz         = -(L_xx + L_yy)
    L_xzz        = -(L_xxx + L_xyy)
    v487         = L_xzz*z
    L_yzz        = -(L_xxy + L_yyy)
    v590         = L_yzz*z
    L_zzz        = -(L_xxz + L_yyz)
    L_xxzz       = -(L_xxxx + L_xxyy)
    v341         = L_xxzz*z
    L_xyzz       = -(L_xxxy + L_xyyy)
    v446         = L_xyzz*z
    L_xzzz       = -(L_xxxz + L_xyyz)
    L_yyzz       = -(L_xxyy + L_yyyy)
    v567         = L_yyzz*z
    L_yzzz       = -(L_xxyz + L_yyyz)
    L_zzzz       = -(L_xxzz + L_yyzz)
    L_xxxzz      = -(L_xxxxx + L_xxxyy)
    v227         = L_xxxzz*z
    L_xxyzz      = -(L_xxxxy + L_xxyyy)
    v304         = L_xxyzz*z
    L_xxzzz      = -(L_xxxxz + L_xxyyz)
    L_xyyzz      = -(L_xxxyy + L_xyyyy)
    v420         = L_xyyzz*z
    L_xyzzz      = -(L_xxxyz + L_xyyyz)
    L_xzzzz      = -(L_xxxzz + L_xyyzz)
    L_yyyzz      = -(L_xxyyy + L_yyyyy)
    v548         = L_yyyzz*z
    L_yyzzz      = -(L_xxyyz + L_yyyyz)
    L_yzzzz      = -(L_xxyzz + L_yyyzz)
    L_zzzzz      = -(L_xxzzz + L_yyzzz)
    L_xxxxzz     = -(L_xxxxxx + L_xxxxyy)
    v142         = L_xxxxzz*z
    L_xxxyzz     = -(L_xxxxxy + L_xxxyyy)
    v195         = L_xxxyzz*z
    L_xxxzzz     = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz     = -(L_xxxxyy + L_xxyyyy)
    v282         = L_xxyyzz*z
    L_xxyzzz     = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz     = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz     = -(L_xxxyyy + L_xyyyyy)
    v398         = L_xyyyzz*z
    L_xyyzzz     = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz     = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz     = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz     = -(L_xxyyyy + L_yyyyyy)
    v532         = L_yyyyzz*z
    L_yyyzzz     = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz     = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz     = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz     = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz    = -(L_xxxxxxx + L_xxxxxyy)
    v82          = L_xxxxxzz*z
    L_xxxxyzz    = -(L_xxxxxxy + L_xxxxyyy)
    v115         = L_xxxxyzz*z
    L_xxxxzzz    = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz    = -(L_xxxxxyy + L_xxxyyyy)
    v177         = L_xxxyyzz*z
    L_xxxyzzz    = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz    = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz    = -(L_xxxxyyy + L_xxyyyyy)
    v264         = L_xxyyyzz*z
    L_xxyyzzz    = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz    = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz    = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz    = -(L_xxxyyyy + L_xyyyyyy)
    v380         = L_xyyyyzz*z
    L_xyyyzzz    = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz    = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz    = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz    = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz    = -(L_xxyyyyy + L_yyyyyyy)
    v519         = L_yyyyyzz*z
    L_yyyyzzz    = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz    = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz    = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz    = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz    = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz   = -(L_xxxxxxxx + L_xxxxxxyy)
    v44          = L_xxxxxxzz*z
    L_xxxxxyzz   = -(L_xxxxxxxy + L_xxxxxyyy)
    v61          = L_xxxxxyzz*z
    L_xxxxxzzz   = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz   = -(L_xxxxxxyy + L_xxxxyyyy)
    v102         = L_xxxxyyzz*z
    L_xxxxyzzz   = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz   = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz   = -(L_xxxxxyyy + L_xxxyyyyy)
    v164         = L_xxxyyyzz*z
    L_xxxyyzzz   = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz   = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz   = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz   = -(L_xxxxyyyy + L_xxyyyyyy)
    v251         = L_xxyyyyzz*z
    L_xxyyyzzz   = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz   = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz   = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz   = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz   = -(L_xxxyyyyy + L_xyyyyyyy)
    v367         = L_xyyyyyzz*z
    L_xyyyyzzz   = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz   = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz   = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz   = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz   = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz   = -(L_xxyyyyyy + L_yyyyyyyy)
    v510         = L_yyyyyyzz*z
    L_yyyyyzzz   = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz   = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz   = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz   = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz   = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz   = -(L_xxzzzzzz + L_yyzzzzzz)
    L_xxxxxxxzz  = -(L_xxxxxxxxx + L_xxxxxxxyy)
    v24          = L_xxxxxxxz + L_xxxxxxxyz*y + L_xxxxxxxzz*z
    Ls_xxxxxxxz  = Ls_xxxxxxxz + (L_xxxxxxxxz*x + v24)
    L_xxxxxxyzz  = -(L_xxxxxxxxy + L_xxxxxxyyy)
    v29          = L_xxxxxxyz + L_xxxxxxyzz*z
    v30          = L_xxxxxxyyz*y + v29
    v47          = v29*y
    Ls_xxxxxxyz  = Ls_xxxxxxyz + (L_xxxxxxxyz*x + v30)
    L_xxxxxxzzz  = -(L_xxxxxxxxz + L_xxxxxxyyz)
    L_xxxxxyyzz  = -(L_xxxxxxxyy + L_xxxxxyyyy)
    v52          = L_xxxxxyyz + L_xxxxxyyzz*z
    v53          = L_xxxxxyyyz*y + v52
    v64          = v52*y
    Ls_xxxxxyyz  = Ls_xxxxxyyz + (L_xxxxxxyyz*x + v53)
    L_xxxxxyzzz  = -(L_xxxxxxxyz + L_xxxxxyyyz)
    L_xxxxxzzzz  = -(L_xxxxxxxzz + L_xxxxxyyzz)
    L_xxxxyyyzz  = -(L_xxxxxxyyy + L_xxxxyyyyy)
    v93          = L_xxxxyyyz + L_xxxxyyyzz*z
    v94          = L_xxxxyyyyz*y + v93
    v105         = v93*y
    Ls_xxxxyyyz  = Ls_xxxxyyyz + (L_xxxxxyyyz*x + v94)
    L_xxxxyyzzz  = -(L_xxxxxxyyz + L_xxxxyyyyz)
    L_xxxxyzzzz  = -(L_xxxxxxyzz + L_xxxxyyyzz)
    L_xxxxzzzzz  = -(L_xxxxxxzzz + L_xxxxyyzzz)
    L_xxxyyyyzz  = -(L_xxxxxyyyy + L_xxxyyyyyy)
    v155         = L_xxxyyyyz + L_xxxyyyyzz*z
    v156         = L_xxxyyyyyz*y + v155
    v167         = v155*y
    Ls_xxxyyyyz  = Ls_xxxyyyyz + (L_xxxxyyyyz*x + v156)
    L_xxxyyyzzz  = -(L_xxxxxyyyz + L_xxxyyyyyz)
    L_xxxyyzzzz  = -(L_xxxxxyyzz + L_xxxyyyyzz)
    L_xxxyzzzzz  = -(L_xxxxxyzzz + L_xxxyyyzzz)
    L_xxxzzzzzz  = -(L_xxxxxzzzz + L_xxxyyzzzz)
    L_xxyyyyyzz  = -(L_xxxxyyyyy + L_xxyyyyyyy)
    v242         = L_xxyyyyyz + L_xxyyyyyzz*z
    v243         = L_xxyyyyyyz*y + v242
    v254         = v242*y
    Ls_xxyyyyyz  = Ls_xxyyyyyz + (L_xxxyyyyyz*x + v243)
    L_xxyyyyzzz  = -(L_xxxxyyyyz + L_xxyyyyyyz)
    L_xxyyyzzzz  = -(L_xxxxyyyzz + L_xxyyyyyzz)
    L_xxyyzzzzz  = -(L_xxxxyyzzz + L_xxyyyyzzz)
    L_xxyzzzzzz  = -(L_xxxxyzzzz + L_xxyyyzzzz)
    L_xxzzzzzzz  = -(L_xxxxzzzzz + L_xxyyzzzzz)
    L_xyyyyyyzz  = -(L_xxxyyyyyy + L_xyyyyyyyy)
    v358         = L_xyyyyyyz + L_xyyyyyyzz*z
    v359         = L_xyyyyyyyz*y + v358
    v370         = v358*y
    Ls_xyyyyyyz  = Ls_xyyyyyyz + (L_xxyyyyyyz*x + v359)
    L_xyyyyyzzz  = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz  = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz  = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz  = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz  = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz  = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz  = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v504         = L_yyyyyyyz + L_yyyyyyyzz*z
    Ls_yyyyyyyz  = Ls_yyyyyyyz + (v504 + L_xyyyyyyyz*x + L_yyyyyyyyz*y)
    L_yyyyyyzzz  = -(L_xxyyyyyyz + L_yyyyyyyyz)
    L_yyyyyzzzz  = -(L_xxyyyyyzz + L_yyyyyyyzz)
    L_yyyyzzzzz  = -(L_xxyyyyzzz + L_yyyyyyzzz)
    L_yyyzzzzzz  = -(L_xxyyyzzzz + L_yyyyyzzzz)
    L_yyzzzzzzz  = -(L_xxyyzzzzz + L_yyyyzzzzz)
    L_yzzzzzzzz  = -(L_xxyzzzzzz + L_yyyzzzzzz)
    L_zzzzzzzzz  = -(L_xxzzzzzzz + L_yyzzzzzzz)
    c1           = z
    b1           = y
    a1           = x
    a2           = a1*a1
    v17          = a2
    v18          = 0.5d0*v17
    v78          = 0.25d0*v17
    v138         = 0.0833333333333333d0*v17
    v223         = 0.0208333333333333d0*v17
    v337         = 0.00416666666666667d0*v17
    v483         = 0.000694444444444444d0*v17
    a3           = a1*a2
    v32          = a3
    v33          = 0.166666666666667d0*v32
    v137         = 0.0833333333333333d0*v32
    v222         = 0.0277777777777778d0*v32
    v336         = 0.00694444444444444d0*v32
    v482         = 0.00138888888888889d0*v32
    a4           = a2*a2
    v66          = a4
    v67          = 0.0416666666666667d0*v66
    v219         = 0.0208333333333333d0*v66
    v335         = 0.00694444444444444d0*v66
    v481         = 0.00173611111111111d0*v66
    a5           = a2*a3
    v123         = a5
    v124         = 0.00833333333333333d0*v123
    v331         = 0.00416666666666667d0*v123
    v480         = 0.00138888888888889d0*v123
    a6           = a3*a3
    v205         = a6
    v206         = 0.00138888888888889d0*v205
    v475         = 0.000694444444444444d0*v205
    a7           = a3*a4
    v316         = a7
    v317         = 0.000198412698412698d0*v316
    a8           = a4*a4
    v460         = 2.48015873015873d-5*a8
    a9           = a4*a5
    b2           = b1*b1
    v19          = b2
    v20          = L_xxxxxxxyy*v19
    v26          = L_xxxxxxyyy*v19
    v39          = 0.5d0*v19
    v45          = L_xxxxxxyyz*v19
    v49          = L_xxxxxyyyy*v19
    v62          = L_xxxxxyyyz*v19
    v80          = 3.0d0*v19
    v90          = L_xxxxyyyyy*v19
    v103         = L_xxxxyyyyz*v19
    v152         = L_xxxyyyyyy*v19
    v165         = L_xxxyyyyyz*v19
    v239         = L_xxyyyyyyy*v19
    v252         = L_xxyyyyyyz*v19
    v355         = L_xyyyyyyyy*v19
    v368         = L_xyyyyyyyz*v19
    v516         = 0.25d0*v19
    v529         = 0.0833333333333333d0*v19
    v545         = 0.0208333333333333d0*v19
    v564         = 0.00416666666666667d0*v19
    v587         = 0.000694444444444444d0*v19
    b3           = b1*b2
    v34          = b3
    v35          = L_xxxxxxyyy*v34
    v55          = L_xxxxxyyyy*v34
    v74          = 0.166666666666667d0*v34
    v83          = L_xxxxxyyyz*v34
    v96          = L_xxxxyyyyy*v34
    v116         = L_xxxxyyyyz*v34
    v140         = 4.0d0*v34
    v158         = L_xxxyyyyyy*v34
    v178         = L_xxxyyyyyz*v34
    v245         = L_xxyyyyyyy*v34
    v265         = L_xxyyyyyyz*v34
    v361         = L_xyyyyyyyy*v34
    v381         = L_xyyyyyyyz*v34
    v528         = 0.0833333333333333d0*v34
    v544         = 0.0277777777777778d0*v34
    v563         = 0.00694444444444444d0*v34
    v586         = 0.00138888888888889d0*v34
    b4           = b2*b2
    v68          = b4
    v69          = L_xxxxxyyyy*v68
    v107         = L_xxxxyyyyy*v68
    v132         = 0.0416666666666667d0*v68
    v143         = L_xxxxyyyyz*v68
    v169         = L_xxxyyyyyy*v68
    v196         = L_xxxyyyyyz*v68
    v225         = 5.0d0*v68
    v256         = L_xxyyyyyyy*v68
    v283         = L_xxyyyyyyz*v68
    v372         = L_xyyyyyyyy*v68
    v399         = L_xyyyyyyyz*v68
    v543         = 0.0208333333333333d0*v68
    v562         = 0.00694444444444444d0*v68
    v585         = 0.00173611111111111d0*v68
    b5           = b2*b3
    v125         = b5
    v126         = L_xxxxyyyyy*v125
    v185         = L_xxxyyyyyy*v125
    v215         = 0.00833333333333333d0*v125
    v228         = L_xxxyyyyyz*v125
    v272         = L_xxyyyyyyy*v125
    v305         = L_xxyyyyyyz*v125
    v339         = 6.0d0*v125
    v388         = L_xyyyyyyyy*v125
    v421         = L_xyyyyyyyz*v125
    v561         = 0.00416666666666667d0*v125
    v584         = 0.00138888888888889d0*v125
    b6           = b3*b3
    v207         = b6
    v208         = L_xxxyyyyyy*v207
    v292         = L_xxyyyyyyy*v207
    v327         = 0.00138888888888889d0*v207
    v342         = L_xxyyyyyyz*v207
    v408         = L_xyyyyyyyy*v207
    v447         = L_xyyyyyyyz*v207
    v485         = 7.0d0*v207
    v583         = 0.000694444444444444d0*v207
    b7           = b3*b4
    v318         = b7
    v319         = L_xxyyyyyyy*v318
    v432         = L_xyyyyyyyy*v318
    v471         = 0.000198412698412698d0*v318
    v488         = L_xyyyyyyyz*v318
    b8           = b4*b4
    v461         = b8
    v462         = L_xyyyyyyyy*v461
    v575         = 2.48015873015873d-5*v461
    b9           = b4*b5
    c2           = c1*c1
    v21          = c2
    v598         = 0.5d0*v21
    v463         = L_xzz*v21
    v576         = L_yzz*v21
    v320         = L_xxzz*v21
    v433         = L_xyzz*v21
    v489         = L_xzzz*v21
    v555         = L_yyzz*v21
    v591         = L_yzzz*v21
    v209         = L_xxxzz*v21
    v293         = L_xxyzz*v21
    v343         = L_xxzzz*v21
    v409         = L_xyyzz*v21
    v448         = L_xyzzz*v21
    v538         = L_yyyzz*v21
    v568         = L_yyzzz*v21
    v127         = L_xxxxzz*v21
    v186         = L_xxxyzz*v21
    v229         = L_xxxzzz*v21
    v273         = L_xxyyzz*v21
    v306         = L_xxyzzz*v21
    v389         = L_xyyyzz*v21
    v422         = L_xyyzzz*v21
    v524         = L_yyyyzz*v21
    v549         = L_yyyzzz*v21
    v70          = L_xxxxxzz*v21
    v108         = L_xxxxyzz*v21
    v144         = L_xxxxzzz*v21
    v170         = L_xxxyyzz*v21
    v197         = L_xxxyzzz*v21
    v257         = L_xxyyyzz*v21
    v284         = L_xxyyzzz*v21
    v373         = L_xyyyyzz*v21
    v400         = L_xyyyzzz*v21
    v513         = L_yyyyyzz*v21
    v533         = L_yyyyzzz*v21
    v36          = L_xxxxxxzz*v21
    v56          = L_xxxxxyzz*v21
    v84          = L_xxxxxzzz*v21
    v97          = L_xxxxyyzz*v21
    v117         = L_xxxxyzzz*v21
    v159         = L_xxxyyyzz*v21
    v179         = L_xxxyyzzz*v21
    v246         = L_xxyyyyzz*v21
    v266         = L_xxyyyzzz*v21
    v362         = L_xyyyyyzz*v21
    v382         = L_xyyyyzzz*v21
    v506         = L_yyyyyyzz*v21
    v520         = L_yyyyyzzz*v21
    v22          = L_xxxxxxxzz*v21
    v43          = v20 + v22 + 2.0d0*(L_xxxxxxx + v16 + v23)
    Ls_xxxxxxx   = Ls_xxxxxxx + (0.5d0*(v20 + v22) + L_xxxxxxx + L_xxxxxxxxx*v18 + v0*x + v16 + v23)
    v27          = L_xxxxxxyzz*v21
    v40          = v27 + 2.0d0*(L_xxxxxxy + v25)
    v41          = v40*y
    v60          = 2.0d0*v28 + v26 + v40
    Ls_xxxxxxy   = Ls_xxxxxxy + (0.5d0*(v26 + v27) + L_xxxxxxxxy*v18 + L_xxxxxxy + v2*x + v25 + v28)
    v46          = L_xxxxxxzzz*v21
    v88          = v45 + v46 + 2.0d0*(L_xxxxxxz + v44 + v47)
    Ls_xxxxxxz   = Ls_xxxxxxz + (0.5d0*(v45 + v46) + L_xxxxxxxxz*v18 + L_xxxxxxz + v24*x + v44 + v47)
    v50          = L_xxxxxyyzz*v21
    v58          = v50 + 2.0d0*(L_xxxxxyy + v48)
    v59          = v58*y
    v75          = v19*v58
    v101         = 2.0d0*v51 + v49 + v58
    Ls_xxxxxyy   = Ls_xxxxxyy + (0.5d0*(v49 + v50) + L_xxxxxxxyy*v18 + L_xxxxxyy + v4*x + v48 + v51)
    v63          = L_xxxxxyzzz*v21
    v86          = v63 + 2.0d0*(L_xxxxxyz + v61)
    v87          = v86*y
    v121         = 2.0d0*v64 + v62 + v86
    Ls_xxxxxyz   = Ls_xxxxxyz + (0.5d0*(v62 + v63) + L_xxxxxxxyz*v18 + L_xxxxxyz + v30*x + v61 + v64)
    v91          = L_xxxxyyyzz*v21
    v99          = v91 + 2.0d0*(L_xxxxyyy + v89)
    v100         = v99*y
    v111         = v19*v99
    v133         = v34*v99
    v163         = 2.0d0*v92 + v90 + v99
    Ls_xxxxyyy   = Ls_xxxxyyy + (0.5d0*(v90 + v91) + L_xxxxxxyyy*v18 + L_xxxxyyy + v6*x + v89 + v92)
    v104         = L_xxxxyyzzz*v21
    v119         = v104 + 2.0d0*(L_xxxxyyz + v102)
    v120         = v119*y
    v147         = v119*v19
    v183         = 2.0d0*v105 + v103 + v119
    Ls_xxxxyyz   = Ls_xxxxyyz + (0.5d0*(v103 + v104) + L_xxxxxxyyz*v18 + L_xxxxyyz + v102 + v105 + v53*x)
    v153         = L_xxxyyyyzz*v21
    v161         = v153 + 2.0d0*(L_xxxyyyy + v151)
    v162         = v161*y
    v173         = v161*v19
    v190         = v161*v34
    v216         = v161*v68
    v250         = 2.0d0*v154 + v152 + v161
    Ls_xxxyyyy   = Ls_xxxyyyy + (0.5d0*(v152 + v153) + L_xxxxxyyyy*v18 + L_xxxyyyy + v151 + v154 + v8*x)
    v166         = L_xxxyyyzzz*v21
    v181         = v166 + 2.0d0*(L_xxxyyyz + v164)
    v182         = v181*y
    v200         = v181*v19
    v233         = v181*v34
    v270         = 2.0d0*v167 + v165 + v181
    Ls_xxxyyyz   = Ls_xxxyyyz + (0.5d0*(v165 + v166) + L_xxxxxyyyz*v18 + L_xxxyyyz + v164 + v167 + v94*x)
    v240         = L_xxyyyyyzz*v21
    v248         = v240 + 2.0d0*(L_xxyyyyy + v238)
    v249         = v248*y
    v260         = v19*v248
    v277         = v248*v34
    v298         = v248*v68
    v328         = v125*v248
    v366         = 2.0d0*v241 + v239 + v248
    Ls_xxyyyyy   = Ls_xxyyyyy + (0.5d0*(v239 + v240) + L_xxxxyyyyy*v18 + L_xxyyyyy + v10*x + v238 + v241)
    v253         = L_xxyyyyzzz*v21
    v268         = v253 + 2.0d0*(L_xxyyyyz + v251)
    v269         = v268*y
    v287         = v19*v268
    v310         = v268*v34
    v348         = v268*v68
    v386         = 2.0d0*v254 + v252 + v268
    Ls_xxyyyyz   = Ls_xxyyyyz + (0.5d0*(v252 + v253) + L_xxxxyyyyz*v18 + L_xxyyyyz + v156*x + v251 + v254)
    v356         = L_xyyyyyyzz*v21
    v364         = v356 + 2.0d0*(L_xyyyyyy + v354)
    v365         = v364*y
    v376         = v19*v364
    v393         = v34*v364
    v414         = v364*v68
    v439         = v125*v364
    v472         = v207*v364
    Ls_xyyyyyy   = Ls_xyyyyyy + (0.5d0*(v355 + v356) + L_xxxyyyyyy*v18 + L_xyyyyyy + v12*x + v354 + v357)
    v369         = L_xyyyyyzzz*v21
    v384         = v369 + 2.0d0*(L_xyyyyyz + v367)
    v385         = v384*y
    v403         = v19*v384
    v426         = v34*v384
    v453         = v384*v68
    v495         = v125*v384
    Ls_xyyyyyz   = Ls_xyyyyyz + (0.5d0*(v368 + v369) + L_xxxyyyyyz*v18 + L_xyyyyyz + v243*x + v367 + v370)
    v503         = L_yyyyyyyzz*v21
    v509         = v503 + 2.0d0*(L_yyyyyyy + v502)
    Ls_yyyyyyy   = Ls_yyyyyyy + (0.5d0*v503 + L_xxyyyyyyy*v18 + L_yyyyyyy + L_yyyyyyyyy*v39 + v14*x + v15 &
      *y + v502)
    v511         = L_yyyyyyzzz*v21
    v522         = v511 + 2.0d0*(L_yyyyyyz + v510)
    Ls_yyyyyyz   = Ls_yyyyyyz + (0.5d0*v511 + L_xxyyyyyyz*v18 + L_yyyyyyyyz*v39 + L_yyyyyyz + v359*x + &
      v504*y + v510)
    h            = v17 + v19 + v21
    u2           = 1.0/h
    u            = sqrt(u2)
    u3           = u*u2
    u4           = u2*u2
    u5           = u2*u3
    u6           = u3*u3
    u7           = u3*u4
    u8           = u4*u4
    u9           = u4*u5
    u10          = u5*u5
    u11          = u5*u6
    u12          = u6*u6
    u13          = u6*u7
    u14          = u7*u7
    u15          = u7*u8
    u16          = u8*u8
    u17          = u8*u9
    u18          = u9*u9
    u19          = u10*u9
    c3           = c1*c2
    v37          = c3
    v599         = 0.166666666666667d0*v37
    v464         = L_xzzz*v37
    v577         = L_yzzz*v37
    v321         = L_xxzzz*v37
    v434         = L_xyzzz*v37
    v490         = L_xzzzz*v37
    v556         = L_yyzzz*v37
    v592         = L_yzzzz*v37
    v210         = L_xxxzzz*v37
    v294         = L_xxyzzz*v37
    v344         = L_xxzzzz*v37
    v410         = L_xyyzzz*v37
    v449         = L_xyzzzz*v37
    v539         = L_yyyzzz*v37
    v569         = L_yyzzzz*v37
    v128         = L_xxxxzzz*v37
    v187         = L_xxxyzzz*v37
    v230         = L_xxxzzzz*v37
    v274         = L_xxyyzzz*v37
    v307         = L_xxyzzzz*v37
    v390         = L_xyyyzzz*v37
    v423         = L_xyyzzzz*v37
    v525         = L_yyyyzzz*v37
    v550         = L_yyyzzzz*v37
    v71          = L_xxxxxzzz*v37
    v109         = L_xxxxyzzz*v37
    v145         = L_xxxxzzzz*v37
    v171         = L_xxxyyzzz*v37
    v198         = L_xxxyzzzz*v37
    v258         = L_xxyyyzzz*v37
    v285         = L_xxyyzzzz*v37
    v374         = L_xyyyyzzz*v37
    v401         = L_xyyyzzzz*v37
    v514         = L_yyyyyzzz*v37
    v534         = L_yyyyzzzz*v37
    v38          = L_xxxxxxzzz*v37
    v81          = v35 + v38 + v3*v80 + 6.0d0*(L_xxxxxx + v31) + 3.0d0*(v36 + v41)
    Ls_xxxxxx    = Ls_xxxxxx + (0.166666666666667d0*(v35 + v38 + 3.0d0*(v36 + v41)) + L_xxxxxx + &
      L_xxxxxxxxx*v33 + v0*v18 + v3*v39 + v31 + v42*v43)
    v57          = L_xxxxxyzzz*v37
    v76          = v57 + 3.0d0*(2.0d0*L_xxxxxy + 2.0d0*v54 + v56)
    v77          = v76*y
    v114         = v55 + v76 + v5*v80 + 3.0d0*v59
    Ls_xxxxxy    = Ls_xxxxxy + (0.166666666666667d0*(v55 + v57 + 3.0d0*(v56 + v59)) + L_xxxxxxxxy*v33 + &
      L_xxxxxy + v18*v2 + v39*v5 + v42*v60 + v54)
    v85          = L_xxxxxzzzz*v37
    v150         = v83 + v85 + v52*v80 + 6.0d0*(L_xxxxxz + v82) + 3.0d0*(v84 + v87)
    Ls_xxxxxz    = Ls_xxxxxz + (0.166666666666667d0*(v83 + v85 + 3.0d0*(v84 + v87)) + L_xxxxxxxxz*v33 + &
      L_xxxxxz + v18*v24 + v39*v52 + v42*v88 + v82)
    v98          = L_xxxxyyzzz*v37
    v112         = v98 + 3.0d0*(2.0d0*L_xxxxyy + 2.0d0*v95 + v97)
    v113         = v112*y
    v134         = v112*v19
    v176         = 3.0d0*v100 + v7*v80 + v112 + v96
    Ls_xxxxyy    = Ls_xxxxyy + (0.166666666666667d0*(v96 + v98 + 3.0d0*(v100 + v97)) + L_xxxxxxxyy*v33 + &
      L_xxxxyy + v101*v42 + v18*v4 + v39*v7 + v95)
    v118         = L_xxxxyzzzz*v37
    v148         = v118 + 3.0d0*(2.0d0*L_xxxxyz + 2.0d0*v115 + v117)
    v149         = v148*y
    v203         = v116 + v148 + 3.0d0*v120 + v80*v93
    Ls_xxxxyz    = Ls_xxxxyz + (0.166666666666667d0*(v116 + v118 + 3.0d0*(v117 + v120)) + L_xxxxxxxyz* &
      v33 + L_xxxxyz + v115 + v121*v42 + v18*v30 + v39*v93)
    v160         = L_xxxyyyzzz*v37
    v174         = v160 + 3.0d0*(2.0d0*L_xxxyyy + 2.0d0*v157 + v159)
    v175         = v174*y
    v191         = v174*v19
    v217         = v174*v34
    v263         = v158 + v174 + 3.0d0*v162 + v80*v9
    Ls_xxxyyy    = Ls_xxxyyy + (0.166666666666667d0*(v158 + v160 + 3.0d0*(v159 + v162)) + L_xxxxxxyyy* &
      v33 + L_xxxyyy + v157 + v163*v42 + v18*v6 + v39*v9)
    v180         = L_xxxyyzzzz*v37
    v201         = v180 + 3.0d0*(2.0d0*L_xxxyyz + 2.0d0*v177 + v179)
    v202         = v201*y
    v234         = v19*v201
    v290         = v178 + v201 + v155*v80 + 3.0d0*v182
    Ls_xxxyyz    = Ls_xxxyyz + (0.166666666666667d0*(v178 + v180 + 3.0d0*(v179 + v182)) + L_xxxxxxyyz* &
      v33 + L_xxxyyz + v155*v39 + v177 + v18*v53 + v183*v42)
    v247         = L_xxyyyyzzz*v37
    v261         = v247 + 3.0d0*(2.0d0*L_xxyyyy + 2.0d0*v244 + v246)
    v262         = v261*y
    v278         = v19*v261
    v299         = v261*v34
    v329         = v261*v68
    v379         = v245 + v261 + v11*v80 + 3.0d0*v249
    Ls_xxyyyy    = Ls_xxyyyy + (0.166666666666667d0*(v245 + v247 + 3.0d0*(v246 + v249)) + L_xxxxxyyyy* &
      v33 + L_xxyyyy + v11*v39 + v18*v8 + v244 + v250*v42)
    v267         = L_xxyyyzzzz*v37
    v288         = v267 + 3.0d0*(2.0d0*L_xxyyyz + 2.0d0*v264 + v266)
    v289         = v288*y
    v311         = v19*v288
    v349         = v288*v34
    v406         = v265 + v288 + v242*v80 + 3.0d0*v269
    Ls_xxyyyz    = Ls_xxyyyz + (0.166666666666667d0*(v265 + v267 + 3.0d0*(v266 + v269)) + L_xxxxxyyyz* &
      v33 + L_xxyyyz + v18*v94 + v242*v39 + v264 + v270*v42)
    v363         = L_xyyyyyzzz*v37
    v377         = v363 + 3.0d0*(2.0d0*L_xyyyyy + 2.0d0*v360 + v362)
    v378         = v377*y
    v394         = v19*v377
    v415         = v34*v377
    v440         = v377*v68
    v473         = v125*v377
    Ls_xyyyyy    = Ls_xyyyyy + (0.166666666666667d0*(v361 + v363 + 3.0d0*(v362 + v365)) + L_xxxxyyyyy* &
      v33 + L_xyyyyy + v10*v18 + v13*v39 + v360 + v366*v42)
    v383         = L_xyyyyzzzz*v37
    v404         = v383 + 3.0d0*(2.0d0*L_xyyyyz + 2.0d0*v380 + v382)
    v405         = v404*y
    v427         = v19*v404
    v454         = v34*v404
    v496         = v404*v68
    Ls_xyyyyz    = Ls_xyyyyz + (0.166666666666667d0*(v381 + v383 + 3.0d0*(v382 + v385)) + L_xxxxyyyyz* &
      v33 + L_xyyyyz + v156*v18 + v358*v39 + v380 + v386*v42)
    v507         = L_yyyyyyzzz*v37
    v518         = v507 + 3.0d0*(2.0d0*L_yyyyyy + 2.0d0*v505 + v506)
    Ls_yyyyyy    = Ls_yyyyyy + (0.166666666666667d0*(3.0d0*v506 + v507) + L_xxxyyyyyy*v33 + L_yyyyyy + &
      L_yyyyyyyyy*v74 + v12*v18 + v15*v39 + v42*(v355 + 2.0d0*v357 + &
      v364) + v505 + v508*v509)
    v521         = L_yyyyyzzzz*v37
    v536         = v521 + 3.0d0*(2.0d0*L_yyyyyz + 2.0d0*v519 + v520)
    Ls_yyyyyz    = Ls_yyyyyz + (0.166666666666667d0*(3.0d0*v520 + v521) + L_xxxyyyyyz*v33 + L_yyyyyyyyz* &
      v74 + L_yyyyyz + v18*v243 + v39*v504 + v42*(v368 + 2.0d0*v370 + &
      v384) + v508*v522 + v519)
    c4           = c2*c2
    v72          = c4
    v600         = 0.0416666666666667d0*v72
    v465         = L_xzzzz*v72
    v578         = L_yzzzz*v72
    v322         = L_xxzzzz*v72
    v435         = L_xyzzzz*v72
    v491         = L_xzzzzz*v72
    v557         = L_yyzzzz*v72
    v593         = L_yzzzzz*v72
    v211         = L_xxxzzzz*v72
    v295         = L_xxyzzzz*v72
    v345         = L_xxzzzzz*v72
    v411         = L_xyyzzzz*v72
    v450         = L_xyzzzzz*v72
    v540         = L_yyyzzzz*v72
    v570         = L_yyzzzzz*v72
    v129         = L_xxxxzzzz*v72
    v188         = L_xxxyzzzz*v72
    v231         = L_xxxzzzzz*v72
    v275         = L_xxyyzzzz*v72
    v308         = L_xxyzzzzz*v72
    v391         = L_xyyyzzzz*v72
    v424         = L_xyyzzzzz*v72
    v526         = L_yyyyzzzz*v72
    v551         = L_yyyzzzzz*v72
    v73          = L_xxxxxzzzz*v72
    v141         = v69 + v73 + v140*v5 + 12.0d0*v70 + 6.0d0*v75 + 24.0d0*(L_xxxxx + v65) + &
      4.0d0*(v71 + v77)
    Ls_xxxxx     = Ls_xxxxx + (0.0416666666666667d0*(v69 + 12.0d0*v70 + v73 + 6.0d0*v75 + 4.0d0*(v71 + &
      v77)) + L_xxxxx + L_xxxxxxxxx*v67 + v0*v33 + v43*v78 + v5*v74 + &
      v65 + v79*v81)
    v110         = L_xxxxyzzzz*v72
    v135         = v110 + 12.0d0*v108 + 4.0d0*(6.0d0*L_xxxxy + 6.0d0*v106 + v109)
    v136         = v135*y
    v194         = v107 + v135 + 6.0d0*v111 + 4.0d0*v113 + v140*v7
    Ls_xxxxy     = Ls_xxxxy + (0.0416666666666667d0*(v107 + 12.0d0*v108 + v110 + 6.0d0*v111 + 4.0d0*( &
      v109 + v113)) + L_xxxxxxxxy*v67 + L_xxxxy + v106 + v114*v79 + v2* &
      v33 + v60*v78 + v7*v74)
    v146         = L_xxxxzzzzz*v72
    v237         = v143 + v146 + v140*v93 + 12.0d0*v144 + 6.0d0*v147 + 24.0d0*(L_xxxxz + &
      v142) + 4.0d0*(v145 + v149)
    Ls_xxxxz     = Ls_xxxxz + (0.0416666666666667d0*(v143 + 12.0d0*v144 + v146 + 6.0d0*v147 + 4.0d0*( &
      v145 + v149)) + L_xxxxxxxxz*v67 + L_xxxxz + v142 + v150*v79 + v24 &
      *v33 + v74*v93 + v78*v88)
    v172         = L_xxxyyzzzz*v72
    v192         = v172 + 12.0d0*v170 + 4.0d0*(6.0d0*L_xxxyy + 6.0d0*v168 + v171)
    v193         = v192*y
    v218         = v19*v192
    v281         = v169 + v192 + v140*v9 + 6.0d0*v173 + 4.0d0*v175
    Ls_xxxyy     = Ls_xxxyy + (0.0416666666666667d0*(v169 + 12.0d0*v170 + v172 + 6.0d0*v173 + 4.0d0*( &
      v171 + v175)) + L_xxxxxxxyy*v67 + L_xxxyy + v101*v78 + v168 + &
      v176*v79 + v33*v4 + v74*v9)
    v199         = L_xxxyzzzzz*v72
    v235         = v199 + 12.0d0*v197 + 4.0d0*(6.0d0*L_xxxyz + 6.0d0*v195 + v198)
    v236         = v235*y
    v314         = v196 + v235 + v140*v155 + 6.0d0*v200 + 4.0d0*v202
    Ls_xxxyz     = Ls_xxxyz + (0.0416666666666667d0*(v196 + 12.0d0*v197 + v199 + 6.0d0*v200 + 4.0d0*( &
      v198 + v202)) + L_xxxxxxxyz*v67 + L_xxxyz + v121*v78 + v155*v74 + &
      v195 + v203*v79 + v30*v33)
    v259         = L_xxyyyzzzz*v72
    v279         = v259 + 12.0d0*v257 + 4.0d0*(6.0d0*L_xxyyy + 6.0d0*v255 + v258)
    v280         = v279*y
    v300         = v19*v279
    v330         = v279*v34
    v397         = v256 + v279 + v11*v140 + 6.0d0*v260 + 4.0d0*v262
    Ls_xxyyy     = Ls_xxyyy + (0.0416666666666667d0*(v256 + 12.0d0*v257 + v259 + 6.0d0*v260 + 4.0d0*( &
      v258 + v262)) + L_xxxxxxyyy*v67 + L_xxyyy + v11*v74 + v163*v78 + &
      v255 + v263*v79 + v33*v6)
    v286         = L_xxyyzzzzz*v72
    v312         = v286 + 12.0d0*v284 + 4.0d0*(6.0d0*L_xxyyz + 6.0d0*v282 + v285)
    v313         = v312*y
    v350         = v19*v312
    v430         = v283 + v312 + v140*v242 + 6.0d0*v287 + 4.0d0*v289
    Ls_xxyyz     = Ls_xxyyz + (0.0416666666666667d0*(v283 + 12.0d0*v284 + v286 + 6.0d0*v287 + 4.0d0*( &
      v285 + v289)) + L_xxxxxxyyz*v67 + L_xxyyz + v183*v78 + v242*v74 + &
      v282 + v290*v79 + v33*v53)
    v375         = L_xyyyyzzzz*v72
    v395         = v375 + 12.0d0*v373 + 4.0d0*(6.0d0*L_xyyyy + 6.0d0*v371 + v374)
    v396         = v395*y
    v416         = v19*v395
    v441         = v34*v395
    v474         = v395*v68
    Ls_xyyyy     = Ls_xyyyy + (0.0416666666666667d0*(v372 + 12.0d0*v373 + v375 + 6.0d0*v376 + 4.0d0*( &
      v374 + v378)) + L_xxxxxyyyy*v67 + L_xyyyy + v13*v74 + v250*v78 + &
      v33*v8 + v371 + v379*v79)
    v402         = L_xyyyzzzzz*v72
    v428         = v402 + 12.0d0*v400 + 4.0d0*(6.0d0*L_xyyyz + 6.0d0*v398 + v401)
    v429         = v428*y
    v455         = v19*v428
    v497         = v34*v428
    Ls_xyyyz     = Ls_xyyyz + (0.0416666666666667d0*(v399 + 12.0d0*v400 + v402 + 6.0d0*v403 + 4.0d0*( &
      v401 + v405)) + L_xxxxxyyyz*v67 + L_xyyyz + v270*v78 + v33*v94 + &
      v358*v74 + v398 + v406*v79)
    v515         = L_yyyyyzzzz*v72
    v531         = v515 + 12.0d0*v513 + 4.0d0*(6.0d0*L_yyyyy + 6.0d0*v512 + v514)
    Ls_yyyyy     = Ls_yyyyy + (0.0416666666666667d0*(12.0d0*v513 + 4.0d0*v514 + v515) + L_xxxxyyyyy*v67 &
      + L_yyyyy + L_yyyyyyyyy*v132 + v10*v33 + v15*v74 + v366*v78 + &
      v509*v516 + v512 + v517*v518 + v79*(v13*v80 + v361 + 3.0d0*v365 + &
      v377))
    v535         = L_yyyyzzzzz*v72
    v553         = v535 + 12.0d0*v533 + 4.0d0*(6.0d0*L_yyyyz + 6.0d0*v532 + v534)
    Ls_yyyyz     = Ls_yyyyz + (0.0416666666666667d0*(12.0d0*v533 + 4.0d0*v534 + v535) + L_xxxxyyyyz*v67 &
      + L_yyyyyyyyz*v132 + L_yyyyz + v156*v33 + v386*v78 + v504*v74 + &
      v516*v522 + v517*v536 + v532 + v79*(v358*v80 + v381 + 3.0d0*v385 &
      + v404))
    c5           = c2*c3
    v130         = c5
    v601         = 0.00833333333333333d0*v130
    v466         = L_xzzzzz*v130
    v579         = L_yzzzzz*v130
    v323         = L_xxzzzzz*v130
    v436         = L_xyzzzzz*v130
    v492         = L_xzzzzzz*v130
    v558         = L_yyzzzzz*v130
    v594         = L_yzzzzzz*v130
    v212         = L_xxxzzzzz*v130
    v296         = L_xxyzzzzz*v130
    v346         = L_xxzzzzzz*v130
    v412         = L_xyyzzzzz*v130
    v451         = L_xyzzzzzz*v130
    v541         = L_yyyzzzzz*v130
    v571         = L_yyzzzzzz*v130
    v131         = L_xxxxzzzzz*v130
    v226         = v126 + v131 + 60.0d0*v127 + 20.0d0*v128 + v225*v7 + 120.0d0*(L_xxxx + &
      v122) + 5.0d0*(v129 + v136) + 10.0d0*(v133 + v134)
    Ls_xxxx      = Ls_xxxx + (0.00833333333333333d0*(v126 + 60.0d0*v127 + 20.0d0*v128 + v131 + 5.0d0*( &
      v129 + v136) + 10.0d0*(v133 + v134)) + L_xxxx + L_xxxxxxxxx*v124 &
      + v0*v67 + v122 + v132*v7 + v137*v43 + v138*v81 + v139*v141)
    v189         = L_xxxyzzzzz*v130
    v220         = v189 + 60.0d0*v186 + 20.0d0*v187 + 5.0d0*(24.0d0*L_xxxy + 24.0d0*v184 + &
      v188)
    v221         = v220*y
    v303         = v185 + v220 + 5.0d0*v193 + v225*v9 + 10.0d0*(v190 + v191)
    Ls_xxxy      = Ls_xxxy + (0.00833333333333333d0*(v185 + 60.0d0*v186 + 20.0d0*v187 + v189 + 5.0d0*( &
      v188 + v193) + 10.0d0*(v190 + v191)) + L_xxxxxxxxy*v124 + L_xxxy &
      + v114*v138 + v132*v9 + v137*v60 + v139*v194 + v184 + v2*v67)
    v232         = L_xxxzzzzzz*v130
    v353         = v228 + v232 + v155*v225 + 60.0d0*v229 + 20.0d0*v230 + 120.0d0*(L_xxxz + &
      v227) + 5.0d0*(v231 + v236) + 10.0d0*(v233 + v234)
    Ls_xxxz      = Ls_xxxz + (0.00833333333333333d0*(v228 + 60.0d0*v229 + 20.0d0*v230 + v232 + 5.0d0*( &
      v231 + v236) + 10.0d0*(v233 + v234)) + L_xxxxxxxxz*v124 + L_xxxz &
      + v132*v155 + v137*v88 + v138*v150 + v139*v237 + v227 + v24*v67)
    v276         = L_xxyyzzzzz*v130
    v301         = v276 + 60.0d0*v273 + 20.0d0*v274 + 5.0d0*(24.0d0*L_xxyy + 24.0d0*v271 + &
      v275)
    v302         = v301*y
    v332         = v19*v301
    v419         = v272 + v301 + v11*v225 + 5.0d0*v280 + 10.0d0*(v277 + v278)
    Ls_xxyy      = Ls_xxyy + (0.00833333333333333d0*(v272 + 60.0d0*v273 + 20.0d0*v274 + v276 + 5.0d0*( &
      v275 + v280) + 10.0d0*(v277 + v278)) + L_xxxxxxxyy*v124 + L_xxyy &
      + v101*v137 + v11*v132 + v138*v176 + v139*v281 + v271 + v4*v67)
    v309         = L_xxyzzzzzz*v130
    v351         = v309 + 60.0d0*v306 + 20.0d0*v307 + 5.0d0*(24.0d0*L_xxyz + 24.0d0*v304 + &
      v308)
    v352         = v351*y
    v458         = v305 + v351 + v225*v242 + 5.0d0*v313 + 10.0d0*(v310 + v311)
    Ls_xxyz      = Ls_xxyz + (0.00833333333333333d0*(v305 + 60.0d0*v306 + 20.0d0*v307 + v309 + 5.0d0*( &
      v308 + v313) + 10.0d0*(v310 + v311)) + L_xxxxxxxyz*v124 + L_xxyz &
      + v121*v137 + v132*v242 + v138*v203 + v139*v314 + v30*v67 + v304)
    v392         = L_xyyyzzzzz*v130
    v417         = v392 + 60.0d0*v389 + 20.0d0*v390 + 5.0d0*(24.0d0*L_xyyy + 24.0d0*v387 + &
      v391)
    v418         = v417*y
    v442         = v19*v417
    v476         = v34*v417
    Ls_xyyy      = Ls_xyyy + (0.00833333333333333d0*(v388 + 60.0d0*v389 + 20.0d0*v390 + v392 + 5.0d0*( &
      v391 + v396) + 10.0d0*(v393 + v394)) + L_xxxxxxyyy*v124 + L_xyyy &
      + v13*v132 + v137*v163 + v138*v263 + v139*v397 + v387 + v6*v67)
    v425         = L_xyyzzzzzz*v130
    v456         = v425 + 60.0d0*v422 + 20.0d0*v423 + 5.0d0*(24.0d0*L_xyyz + 24.0d0*v420 + &
      v424)
    v457         = v456*y
    v498         = v19*v456
    Ls_xyyz      = Ls_xyyz + (0.00833333333333333d0*(v421 + 60.0d0*v422 + 20.0d0*v423 + v425 + 5.0d0*( &
      v424 + v429) + 10.0d0*(v426 + v427)) + L_xxxxxxyyz*v124 + L_xyyz &
      + v132*v358 + v137*v183 + v138*v290 + v139*v430 + v420 + v53*v67)
    v527         = L_yyyyzzzzz*v130
    v547         = v527 + 60.0d0*v524 + 20.0d0*v525 + 5.0d0*(24.0d0*L_yyyy + 24.0d0*v523 + &
      v526)
    Ls_yyyy      = Ls_yyyy + (0.00833333333333333d0*(60.0d0*v524 + 20.0d0*v525 + 5.0d0*v526 + v527) + &
      L_xxxxxyyyy*v124 + L_yyyy + L_yyyyyyyyy*v215 + v132*v15 + v137* &
      v250 + v138*v379 + v139*(v13*v140 + v372 + 6.0d0*v376 + 4.0d0* &
      v378 + v395) + v509*v528 + v518*v529 + v523 + v530*v531 + v67*v8)
    v552         = L_yyyzzzzzz*v130
    v573         = v552 + 60.0d0*v549 + 20.0d0*v550 + 5.0d0*(24.0d0*L_yyyz + 24.0d0*v548 + &
      v551)
    Ls_yyyz      = Ls_yyyz + (0.00833333333333333d0*(60.0d0*v549 + 20.0d0*v550 + 5.0d0*v551 + v552) + &
      L_xxxxxyyyz*v124 + L_yyyyyyyyz*v215 + L_yyyz + v132*v504 + v137* &
      v270 + v138*v406 + v139*(v140*v358 + v399 + 6.0d0*v403 + 4.0d0* &
      v405 + v428) + v522*v528 + v529*v536 + v530*v553 + v548 + v67*v94)
    c6           = c3*c3
    v213         = c6
    v602         = 0.00138888888888889d0*v213
    v467         = L_xzzzzzz*v213
    v580         = L_yzzzzzz*v213
    v324         = L_xxzzzzzz*v213
    v437         = L_xyzzzzzz*v213
    v493         = L_xzzzzzzz*v213
    v559         = L_yyzzzzzz*v213
    v595         = L_yzzzzzzz*v213
    v214         = L_xxxzzzzzz*v213
    v340         = v208 + v214 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 + 20.0d0*v217 + &
      v339*v9 + 720.0d0*(L_xxx + v204) + 6.0d0*(v212 + v221) + 15.0d0*( &
      v216 + v218)
    Ls_xxx       = Ls_xxx + (0.00138888888888889d0*(v208 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 &
      + v214 + 20.0d0*v217 + 6.0d0*(v212 + v221) + 15.0d0*(v216 + v218 &
      )) + L_xxx + L_xxxxxxxxx*v206 + v0*v124 + v141*v223 + v204 + v215 &
      *v9 + v219*v43 + v222*v81 + v224*v226)
    v297         = L_xxyzzzzzz*v213
    v333         = v297 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 + 6.0d0*(120.0d0*L_xxy &
      + 120.0d0*v291 + v296)
    v334         = v333*y
    v445         = v292 + v333 + v11*v339 + 20.0d0*v299 + 6.0d0*v302 + 15.0d0*(v298 + v300)
    Ls_xxy       = Ls_xxy + (0.00138888888888889d0*(v292 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 &
      + v297 + 20.0d0*v299 + 6.0d0*(v296 + v302) + 15.0d0*(v298 + v300 &
      )) + L_xxxxxxxxy*v206 + L_xxy + v11*v215 + v114*v222 + v124*v2 + &
      v194*v223 + v219*v60 + v224*v303 + v291)
    v347         = L_xxzzzzzzz*v213
    v501         = v342 + v347 + v242*v339 + 360.0d0*v343 + 120.0d0*v344 + 30.0d0*v345 + &
      20.0d0*v349 + 720.0d0*(L_xxz + v341) + 6.0d0*(v346 + v352) + &
      15.0d0*(v348 + v350)
    Ls_xxz       = Ls_xxz + (0.00138888888888889d0*(v342 + 360.0d0*v343 + 120.0d0*v344 + 30.0d0*v345 &
      + v347 + 20.0d0*v349 + 6.0d0*(v346 + v352) + 15.0d0*(v348 + v350 &
      )) + L_xxxxxxxxz*v206 + L_xxz + v124*v24 + v150*v222 + v215*v242 &
      + v219*v88 + v223*v237 + v224*v353 + v341)
    v413         = L_xyyzzzzzz*v213
    v443         = v413 + 360.0d0*v409 + 120.0d0*v410 + 30.0d0*v411 + 6.0d0*(120.0d0*L_xyy &
      + 120.0d0*v407 + v412)
    v444         = v443*y
    v477         = v19*v443
    Ls_xyy       = Ls_xyy + (0.00138888888888889d0*(v408 + 360.0d0*v409 + 120.0d0*v410 + 30.0d0*v411 &
      + v413 + 20.0d0*v415 + 6.0d0*(v412 + v418) + 15.0d0*(v414 + v416 &
      )) + L_xxxxxxxyy*v206 + L_xyy + v101*v219 + v124*v4 + v13*v215 + &
      v176*v222 + v223*v281 + v224*v419 + v407)
    v452         = L_xyzzzzzzz*v213
    v499         = v452 + 360.0d0*v448 + 120.0d0*v449 + 30.0d0*v450 + 6.0d0*(120.0d0*L_xyz &
      + 120.0d0*v446 + v451)
    v500         = v499*y
    Ls_xyz       = Ls_xyz + (0.00138888888888889d0*(v447 + 360.0d0*v448 + 120.0d0*v449 + 30.0d0*v450 &
      + v452 + 20.0d0*v454 + 6.0d0*(v451 + v457) + 15.0d0*(v453 + v455 &
      )) + L_xxxxxxxyz*v206 + L_xyz + v121*v219 + v124*v30 + v203*v222 &
      + v215*v358 + v223*v314 + v224*v458 + v446)
    v542         = L_yyyzzzzzz*v213
    v566         = v542 + 360.0d0*v538 + 120.0d0*v539 + 30.0d0*v540 + 6.0d0*(120.0d0*L_yyy &
      + 120.0d0*v537 + v541)
    Ls_yyy       = Ls_yyy + (0.00138888888888889d0*(360.0d0*v538 + 120.0d0*v539 + 30.0d0*v540 + 6.0d0 &
      *v541 + v542) + L_xxxxxxyyy*v206 + L_yyy + L_yyyyyyyyy*v327 + &
      v124*v6 + v15*v215 + v163*v219 + v222*v263 + v223*v397 + v224*( &
      v13*v225 + v388 + 10.0d0*v393 + 10.0d0*v394 + 5.0d0*v396 + v417) &
      + v509*v543 + v518*v544 + v531*v545 + v537 + v546*v547)
    v572         = L_yyzzzzzzz*v213
    v597         = v572 + 360.0d0*v568 + 120.0d0*v569 + 30.0d0*v570 + 6.0d0*(120.0d0*L_yyz &
      + 120.0d0*v567 + v571)
    Ls_yyz       = Ls_yyz + (0.00138888888888889d0*(360.0d0*v568 + 120.0d0*v569 + 30.0d0*v570 + 6.0d0 &
      *v571 + v572) + L_xxxxxxyyz*v206 + L_yyyyyyyyz*v327 + L_yyz + &
      v124*v53 + v183*v219 + v215*v504 + v222*v290 + v223*v430 + v224*( &
      v225*v358 + v421 + 10.0d0*v426 + 10.0d0*v427 + 5.0d0*v429 + v456 &
      ) + v522*v543 + v536*v544 + v545*v553 + v546*v573 + v567)
    c7           = c3*c4
    v325         = c7
    v603         = 0.000198412698412698d0*v325
    v468         = L_xzzzzzzz*v325
    v581         = L_yzzzzzzz*v325
    v326         = L_xxzzzzzzz*v325
    v486         = v319 + v326 + v11*v485 + 2520.0d0*v320 + 840.0d0*v321 + 210.0d0*v322 + &
      42.0d0*v323 + 5040.0d0*(L_xx + v315) + 7.0d0*(v324 + v334) + &
      21.0d0*(v328 + v332) + 35.0d0*(v329 + v330)
    Ls_xx        = Ls_xx + (0.000198412698412698d0*(v319 + 2520.0d0*v320 + 840.0d0*v321 + 210.0d0* &
      v322 + 42.0d0*v323 + v326 + 7.0d0*(v324 + v334) + 21.0d0*(v328 + &
      v332) + 35.0d0*(v329 + v330)) + L_xx + L_xxxxxxxxx*v317 + v0*v206 &
      + v11*v327 + v141*v336 + v226*v337 + v315 + v331*v43 + v335*v81 + &
      v338*v340)
    v438         = L_xyzzzzzzz*v325
    v478         = v438 + 2520.0d0*v433 + 840.0d0*v434 + 210.0d0*v435 + 42.0d0*v436 + 7.0d0 &
      *(720.0d0*L_xy + 720.0d0*v431 + v437)
    v479         = v478*y
    Ls_xy        = Ls_xy + (0.000198412698412698d0*(v432 + 2520.0d0*v433 + 840.0d0*v434 + 210.0d0* &
      v435 + 42.0d0*v436 + v438 + 7.0d0*(v437 + v444) + 21.0d0*(v439 + &
      v442) + 35.0d0*(v440 + v441)) + L_xxxxxxxxy*v317 + L_xy + v114* &
      v335 + v13*v327 + v194*v336 + v2*v206 + v303*v337 + v331*v60 + &
      v338*v445 + v431)
    v494         = L_xzzzzzzzz*v325
    Ls_xz        = Ls_xz + (0.000198412698412698d0*(v488 + 2520.0d0*v489 + 840.0d0*v490 + 210.0d0* &
      v491 + 42.0d0*v492 + v494 + 7.0d0*(v493 + v500) + 21.0d0*(v495 + &
      v498) + 35.0d0*(v496 + v497)) + L_xxxxxxxxz*v317 + L_xz + v150* &
      v335 + v206*v24 + v237*v336 + v327*v358 + v331*v88 + v337*v353 + &
      v338*v501 + v487)
    v560         = L_yyzzzzzzz*v325
    v589         = v560 + 2520.0d0*v555 + 840.0d0*v556 + 210.0d0*v557 + 42.0d0*v558 + 7.0d0 &
      *(720.0d0*L_yy + 720.0d0*v554 + v559)
    Ls_yy        = Ls_yy + (0.000198412698412698d0*(2520.0d0*v555 + 840.0d0*v556 + 210.0d0*v557 + &
      42.0d0*v558 + 7.0d0*v559 + v560) + L_xxxxxxxyy*v317 + L_yy + &
      L_yyyyyyyyy*v471 + v101*v331 + v15*v327 + v176*v335 + v206*v4 + &
      v281*v336 + v337*v419 + v338*(v13*v339 + v408 + 15.0d0*v414 + &
      20.0d0*v415 + 15.0d0*v416 + 6.0d0*v418 + v443) + v509*v561 + v518 &
      *v562 + v531*v563 + v547*v564 + v554 + v565*v566)
    v596         = L_yzzzzzzzz*v325
    Ls_yz        = Ls_yz + (0.000198412698412698d0*(2520.0d0*v591 + 840.0d0*v592 + 210.0d0*v593 + &
      42.0d0*v594 + 7.0d0*v595 + v596) + L_xxxxxxxyz*v317 + L_yyyyyyyyz &
      *v471 + L_yz + v121*v331 + v203*v335 + v206*v30 + v314*v336 + &
      v327*v504 + v337*v458 + v338*(v339*v358 + v447 + 15.0d0*v453 + &
      20.0d0*v454 + 15.0d0*v455 + 6.0d0*v457 + v499) + v522*v561 + v536 &
      *v562 + v553*v563 + v564*v573 + v565*v597 + v590)
    c8           = c4*c4
    v469         = c8
    v604         = 2.48015873015873d-5*v469
    v470         = L_xzzzzzzzz*v469
    Ls_x         = Ls_x + (2.48015873015873d-5*(v462 + 20160.0d0*v463 + 6720.0d0*v464 + 1680.0d0* &
      v465 + 336.0d0*v466 + v470 + 70.0d0*v474 + 8.0d0*(v468 + v479) + &
      28.0d0*(v472 + v477) + 56.0d0*(v467 + v473 + v476)) + L_x + &
      L_xxxxxxxxx*v460 + v0*v317 + v13*v471 + v141*v481 + v226*v482 + &
      v340*v483 + v43*v475 + v459 + v480*v81 + v484*v486)
    v582         = L_yzzzzzzzz*v469
    Ls_y         = Ls_y + (2.48015873015873d-5*(20160.0d0*v576 + 6720.0d0*v577 + 1680.0d0*v578 + &
      336.0d0*v579 + 56.0d0*v580 + 8.0d0*v581 + v582) + L_xxxxxxxxy* &
      v460 + L_y + L_yyyyyyyyy*v575 + v114*v480 + v15*v471 + v194*v481 &
      + v2*v317 + v303*v482 + v445*v483 + v475*v60 + v484*(v13*v485 + &
      v432 + 21.0d0*v439 + 35.0d0*v440 + 35.0d0*v441 + 21.0d0*v442 + &
      7.0d0*v444 + v478) + v509*v583 + v518*v584 + v531*v585 + v547* &
      v586 + v566*v587 + v574 + v588*v589)
    Ls_z         = Ls_z + (L_z + L_xxxxxxxxz*v460 + L_yyyyyyyyz*v575 + L_zz*z + L_zzz*v598 + L_zzzz &
      *v599 + L_zzzzz*v600 + L_zzzzzz*v601 + L_zzzzzzz*v602 + &
      L_zzzzzzzz*v603 + L_zzzzzzzzz*v604 + v150*v480 + v237*v481 + v24* &
      v317 + v353*v482 + v471*v504 + v475*v88 + v483*v501 + v484*( &
      5040.0d0*L_xz + v358*v485 + 5040.0d0*v487 + v488 + 2520.0d0*v489 &
      + 840.0d0*v490 + 210.0d0*v491 + 42.0d0*v492 + 7.0d0*v493 + v494 + &
      21.0d0*v495 + 35.0d0*v496 + 35.0d0*v497 + 21.0d0*v498 + 7.0d0* &
      v500) + v522*v583 + v536*v584 + v553*v585 + v573*v586 + v587*v597 &
      + v588*(5040.0d0*L_yz + 5040.0d0*v590 + 2520.0d0*v591 + 840.0d0* &
      v592 + 210.0d0*v593 + 42.0d0*v594 + 7.0d0*v595 + v596))
    c9           = c4*c5
    Ls_0         = Ls_0 + (2.75573192239859d-6*(L_xxxxxxxxx*a9 + L_yyyyyyyyy*b9 + L_zzzzzzzzz*c9 + &
      9.0d0*(x*(40320.0d0*L_x + 8.0d0*v13*v318 + 40320.0d0*v459 + v462 &
      + 20160.0d0*v463 + 6720.0d0*v464 + 1680.0d0*v465 + 336.0d0*v466 + &
      56.0d0*v467 + 8.0d0*v468 + v470 + 28.0d0*v472 + 56.0d0*v473 + &
      70.0d0*v474 + 56.0d0*v476 + 28.0d0*v477 + 8.0d0*v479) + y*( &
      40320.0d0*L_y + 40320.0d0*v574 + 20160.0d0*v576 + 6720.0d0*v577 + &
      1680.0d0*v578 + 336.0d0*v579 + 56.0d0*v580 + 8.0d0*v581 + v582)) &
      + 126.0d0*(v123*v141 + v125*v531 + v226*v66 + v547*v68) + 36.0d0* &
      (v17*v486 + v19*v589 + v316*v43 + v318*v509) + 84.0d0*(v205*v81 + &
      v207*v518 + v32*v340 + v34*v566)) + L_0 + L_z*z + L_zz*v598 + &
      L_zzz*v599 + L_zzzz*v600 + L_zzzzz*v601 + L_zzzzzz*v602 + &
      L_zzzzzzz*v603 + L_zzzzzzzz*v604 + v0*v460 + v15*v575)
#undef  y                   
#undef  Ls_0                
#undef  L_0                 
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
#undef  L_xy                
#undef  Ls_xy               
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
#undef  L_xxxz              
#undef  Ls_xxxz             
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
#undef  L_xxxxy             
#undef  Ls_xxxxy            
#undef  L_xxxxz             
#undef  Ls_xxxxz            
#undef  Ls_xxxyy            
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  Ls_xxxyz            
#undef  Ls_xxyyy            
#undef  L_xxyyy             
#undef  Ls_xxyyz            
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  Ls_xyyyy            
#undef  Ls_xyyyz            
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  Ls_yyyyy            
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
#undef  L_xxxxyz            
#undef  Ls_xxxxyz           
#undef  L_xxxyyy            
#undef  Ls_xxxyyy           
#undef  Ls_xxxyyz           
#undef  L_xxxyyz            
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  Ls_xyyyyy           
#undef  Ls_xyyyyz           
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  Ls_yyyyyy           
#undef  Ls_yyyyyz           
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  Ls_xxxxxxx          
#undef  Ls_xxxxxxy          
#undef  L_xxxxxxy           
#undef  Ls_xxxxxxz          
#undef  L_xxxxxxz           
#undef  Ls_xxxxxyy          
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  Ls_xxxxxyz          
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
#undef  Ls_xxxxyyz          
#undef  L_xxxxyyz           
#undef  Ls_xxxyyyy          
#undef  L_xxxyyyy           
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
#undef  L_yyyyyyz           
#undef  Ls_yyyyyyz          
#undef  L_xxxxxxxx          
#undef  Ls_xxxxxxxx         
#undef  L_xxxxxxxy          
#undef  Ls_xxxxxxxy         
#undef  L_xxxxxxxz          
#undef  Ls_xxxxxxxz         
#undef  L_xxxxxxyy          
#undef  Ls_xxxxxxyy         
#undef  Ls_xxxxxxyz         
#undef  L_xxxxxxyz          
#undef  Ls_xxxxxyyy         
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  Ls_xxxxxyyz         
#undef  L_xxxxyyyy          
#undef  Ls_xxxxyyyy         
#undef  L_xxxxyyyz          
#undef  Ls_xxxxyyyz         
#undef  L_xxxyyyyy          
#undef  Ls_xxxyyyyy         
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
#undef  L_xxxxxxxxx         
#undef  Ls_xxxxxxxxx        
#undef  L_xxxxxxxxy         
#undef  Ls_xxxxxxxxy        
#undef  Ls_xxxxxxxxz        
#undef  L_xxxxxxxxz         
#undef  L_xxxxxxxyy         
#undef  Ls_xxxxxxxyy        
#undef  Ls_xxxxxxxyz        
#undef  L_xxxxxxxyz         
#undef  L_xxxxxxyyy         
#undef  Ls_xxxxxxyyy        
#undef  Ls_xxxxxxyyz        
#undef  L_xxxxxxyyz         
#undef  Ls_xxxxxyyyy        
#undef  L_xxxxxyyyy         
#undef  L_xxxxxyyyz         
#undef  Ls_xxxxxyyyz        
#undef  Ls_xxxxyyyyy        
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  Ls_xxxxyyyyz        
#undef  L_xxxyyyyyy         
#undef  Ls_xxxyyyyyy        
#undef  L_xxxyyyyyz         
#undef  Ls_xxxyyyyyz        
#undef  Ls_xxyyyyyyy        
#undef  L_xxyyyyyyy         
#undef  Ls_xxyyyyyyz        
#undef  L_xxyyyyyyz         
#undef  Ls_xyyyyyyyy        
#undef  L_xyyyyyyyy         
#undef  Ls_xyyyyyyyz        
#undef  L_xyyyyyyyz         
#undef  Ls_yyyyyyyyy        
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
#undef  Ls_yyyyyyyyz        
    end subroutine mom_es_L2L_add
    
! OPS  3371*ADD + 2*DIV + 3770*MUL + 169*NEG + POW + 84*SUB = 7397  (9601 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v207, v208, v209, v21, v22, v23, v24, v25, v26, v27, v28, v29,&
                v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, D_0, D_x, D_y, D_z, D_xx, D_xy,&
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
                D_yyzzzzz, D_yzzzzzz, D_zzzzzzz, D_xxxxxxxx, D_xxxxxxxy,&
                D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz, D_xxxxxxzz, D_xxxxxyyy,&
                D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz, D_xxxxyyyy, D_xxxxyyyz,&
                D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz, D_xxxyyyyy, D_xxxyyyyz,&
                D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz, D_xxxzzzzz, D_xxyyyyyy,&
                D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz, D_xxyyzzzz, D_xxyzzzzz,&
                D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz, D_xyyyyyzz, D_xyyyyzzz,&
                D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz, D_xzzzzzzz, D_yyyyyyyy,&
                D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz, D_yyyyzzzz, D_yyyzzzzz,&
                D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz, D_xxxxxxxxx, D_xxxxxxxxy,&
                D_xxxxxxxxz, D_xxxxxxxyy, D_xxxxxxxyz, D_xxxxxxxzz,&
                D_xxxxxxyyy, D_xxxxxxyyz, D_xxxxxxyzz, D_xxxxxxzzz,&
                D_xxxxxyyyy, D_xxxxxyyyz, D_xxxxxyyzz, D_xxxxxyzzz,&
                D_xxxxxzzzz, D_xxxxyyyyy, D_xxxxyyyyz, D_xxxxyyyzz,&
                D_xxxxyyzzz, D_xxxxyzzzz, D_xxxxzzzzz, D_xxxyyyyyy,&
                D_xxxyyyyyz, D_xxxyyyyzz, D_xxxyyyzzz, D_xxxyyzzzz,&
                D_xxxyzzzzz, D_xxxzzzzzz, D_xxyyyyyyy, D_xxyyyyyyz,&
                D_xxyyyyyzz, D_xxyyyyzzz, D_xxyyyzzzz, D_xxyyzzzzz,&
                D_xxyzzzzzz, D_xxzzzzzzz, D_xyyyyyyyy, D_xyyyyyyyz,&
                D_xyyyyyyzz, D_xyyyyyzzz, D_xyyyyzzzz, D_xyyyzzzzz,&
                D_xyyzzzzzz, D_xyzzzzzzz, D_xzzzzzzzz, D_yyyyyyyyy,&
                D_yyyyyyyyz, D_yyyyyyyzz, D_yyyyyyzzz, D_yyyyyzzzz,&
                D_yyyyzzzzz, D_yyyzzzzzz, D_yyzzzzzzz, D_yzzzzzzzz,&
                D_zzzzzzzzz
#define y                    r(1:2,2)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
#define L_y                  L(1:2,2)
#define M_y                  M(1:2,2)
#define L_z                  L(1:2,3)
#define M_z                  M(1:2,3)
#define L_xx                 L(1:2,4)
#define M_xx                 M(1:2,4)
#define L_xy                 L(1:2,5)
#define M_xy                 M(1:2,5)
#define L_xz                 L(1:2,6)
#define M_xz                 M(1:2,6)
#define M_yy                 M(1:2,7)
#define L_yy                 L(1:2,7)
#define L_yz                 L(1:2,8)
#define M_yz                 M(1:2,8)
#define M_zz                 M(1:2,9)
#define L_xxx                L(1:2,9)
#define M_xxx                M(1:2,10)
#define L_xxy                L(1:2,10)
#define L_xxz                L(1:2,11)
#define M_xxy                M(1:2,11)
#define M_xxz                M(1:2,12)
#define L_xyy                L(1:2,12)
#define M_xyy                M(1:2,13)
#define L_xyz                L(1:2,13)
#define M_xyz                M(1:2,14)
#define L_yyy                L(1:2,14)
#define L_yyz                L(1:2,15)
#define M_xzz                M(1:2,15)
#define M_yyy                M(1:2,16)
#define L_xxxx               L(1:2,16)
#define M_yyz                M(1:2,17)
#define L_xxxy               L(1:2,17)
#define M_yzz                M(1:2,18)
#define L_xxxz               L(1:2,18)
#define L_xxyy               L(1:2,19)
#define M_zzz                M(1:2,19)
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
#define L_xxxxx              L(1:2,25)
#define L_xxxxy              L(1:2,26)
#define M_xyyy               M(1:2,26)
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
#define L_xyyyz              L(1:2,33)
#define M_yzzz               M(1:2,33)
#define L_yyyyy              L(1:2,34)
#define M_zzzz               M(1:2,34)
#define L_yyyyz              L(1:2,35)
#define M_xxxxx              M(1:2,35)
#define L_xxxxxx             L(1:2,36)
#define M_xxxxy              M(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define M_xxxxz              M(1:2,37)
#define L_xxxxxz             L(1:2,38)
#define M_xxxyy              M(1:2,38)
#define L_xxxxyy             L(1:2,39)
#define M_xxxyz              M(1:2,39)
#define L_xxxxyz             L(1:2,40)
#define M_xxxzz              M(1:2,40)
#define L_xxxyyy             L(1:2,41)
#define M_xxyyy              M(1:2,41)
#define L_xxxyyz             L(1:2,42)
#define M_xxyyz              M(1:2,42)
#define M_xxyzz              M(1:2,43)
#define L_xxyyyy             L(1:2,43)
#define M_xxzzz              M(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define M_xyyyy              M(1:2,45)
#define L_xyyyyy             L(1:2,45)
#define M_xyyyz              M(1:2,46)
#define L_xyyyyz             L(1:2,46)
#define M_xyyzz              M(1:2,47)
#define L_yyyyyy             L(1:2,47)
#define L_yyyyyz             L(1:2,48)
#define M_xyzzz              M(1:2,48)
#define M_xzzzz              M(1:2,49)
#define L_xxxxxxx            L(1:2,49)
#define L_xxxxxxy            L(1:2,50)
#define M_yyyyy              M(1:2,50)
#define L_xxxxxxz            L(1:2,51)
#define M_yyyyz              M(1:2,51)
#define M_yyyzz              M(1:2,52)
#define L_xxxxxyy            L(1:2,52)
#define L_xxxxxyz            L(1:2,53)
#define M_yyzzz              M(1:2,53)
#define M_yzzzz              M(1:2,54)
#define L_xxxxyyy            L(1:2,54)
#define M_zzzzz              M(1:2,55)
#define L_xxxxyyz            L(1:2,55)
#define M_xxxxxx             M(1:2,56)
#define L_xxxyyyy            L(1:2,56)
#define L_xxxyyyz            L(1:2,57)
#define M_xxxxxy             M(1:2,57)
#define M_xxxxxz             M(1:2,58)
#define L_xxyyyyy            L(1:2,58)
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
#define L_xxxxxxxx           L(1:2,64)
#define M_xxxyzz             M(1:2,64)
#define M_xxxzzz             M(1:2,65)
#define L_xxxxxxxy           L(1:2,65)
#define L_xxxxxxxz           L(1:2,66)
#define M_xxyyyy             M(1:2,66)
#define L_xxxxxxyy           L(1:2,67)
#define M_xxyyyz             M(1:2,67)
#define M_xxyyzz             M(1:2,68)
#define L_xxxxxxyz           L(1:2,68)
#define M_xxyzzz             M(1:2,69)
#define L_xxxxxyyy           L(1:2,69)
#define L_xxxxxyyz           L(1:2,70)
#define M_xxzzzz             M(1:2,70)
#define L_xxxxyyyy           L(1:2,71)
#define M_xyyyyy             M(1:2,71)
#define L_xxxxyyyz           L(1:2,72)
#define M_xyyyyz             M(1:2,72)
#define M_xyyyzz             M(1:2,73)
#define L_xxxyyyyy           L(1:2,73)
#define M_xyyzzz             M(1:2,74)
#define L_xxxyyyyz           L(1:2,74)
#define L_xxyyyyyy           L(1:2,75)
#define M_xyzzzz             M(1:2,75)
#define M_xzzzzz             M(1:2,76)
#define L_xxyyyyyz           L(1:2,76)
#define M_yyyyyy             M(1:2,77)
#define L_xyyyyyyy           L(1:2,77)
#define M_yyyyyz             M(1:2,78)
#define L_xyyyyyyz           L(1:2,78)
#define L_yyyyyyyy           L(1:2,79)
#define M_yyyyzz             M(1:2,79)
#define L_yyyyyyyz           L(1:2,80)
#define M_yyyzzz             M(1:2,80)
#define L_xxxxxxxxx          L(1:2,81)
#define M_yyzzzz             M(1:2,81)
#define M_yzzzzz             M(1:2,82)
#define L_xxxxxxxxy          L(1:2,82)
#define L_xxxxxxxxz          L(1:2,83)
#define M_zzzzzz             M(1:2,83)
#define L_xxxxxxxyy          L(1:2,84)
#define M_xxxxxxx            M(1:2,84)
#define L_xxxxxxxyz          L(1:2,85)
#define M_xxxxxxy            M(1:2,85)
#define M_xxxxxxz            M(1:2,86)
#define L_xxxxxxyyy          L(1:2,86)
#define L_xxxxxxyyz          L(1:2,87)
#define M_xxxxxyy            M(1:2,87)
#define M_xxxxxyz            M(1:2,88)
#define L_xxxxxyyyy          L(1:2,88)
#define M_xxxxxzz            M(1:2,89)
#define L_xxxxxyyyz          L(1:2,89)
#define M_xxxxyyy            M(1:2,90)
#define L_xxxxyyyyy          L(1:2,90)
#define L_xxxxyyyyz          L(1:2,91)
#define M_xxxxyyz            M(1:2,91)
#define M_xxxxyzz            M(1:2,92)
#define L_xxxyyyyyy          L(1:2,92)
#define M_xxxxzzz            M(1:2,93)
#define L_xxxyyyyyz          L(1:2,93)
#define L_xxyyyyyyy          L(1:2,94)
#define M_xxxyyyy            M(1:2,94)
#define M_xxxyyyz            M(1:2,95)
#define L_xxyyyyyyz          L(1:2,95)
#define L_xyyyyyyyy          L(1:2,96)
#define M_xxxyyzz            M(1:2,96)
#define M_xxxyzzz            M(1:2,97)
#define L_xyyyyyyyz          L(1:2,97)
#define M_xxxzzzz            M(1:2,98)
#define L_yyyyyyyyy          L(1:2,98)
#define L_yyyyyyyyz          L(1:2,99)
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
#define M_xxxxxxxx           M(1:2,120)
#define M_xxxxxxxy           M(1:2,121)
#define M_xxxxxxxz           M(1:2,122)
#define M_xxxxxxyy           M(1:2,123)
#define M_xxxxxxyz           M(1:2,124)
#define M_xxxxxxzz           M(1:2,125)
#define M_xxxxxyyy           M(1:2,126)
#define M_xxxxxyyz           M(1:2,127)
#define M_xxxxxyzz           M(1:2,128)
#define M_xxxxxzzz           M(1:2,129)
#define M_xxxxyyyy           M(1:2,130)
#define M_xxxxyyyz           M(1:2,131)
#define M_xxxxyyzz           M(1:2,132)
#define M_xxxxyzzz           M(1:2,133)
#define M_xxxxzzzz           M(1:2,134)
#define M_xxxyyyyy           M(1:2,135)
#define M_xxxyyyyz           M(1:2,136)
#define M_xxxyyyzz           M(1:2,137)
#define M_xxxyyzzz           M(1:2,138)
#define M_xxxyzzzz           M(1:2,139)
#define M_xxxzzzzz           M(1:2,140)
#define M_xxyyyyyy           M(1:2,141)
#define M_xxyyyyyz           M(1:2,142)
#define M_xxyyyyzz           M(1:2,143)
#define M_xxyyyzzz           M(1:2,144)
#define M_xxyyzzzz           M(1:2,145)
#define M_xxyzzzzz           M(1:2,146)
#define M_xxzzzzzz           M(1:2,147)
#define M_xyyyyyyy           M(1:2,148)
#define M_xyyyyyyz           M(1:2,149)
#define M_xyyyyyzz           M(1:2,150)
#define M_xyyyyzzz           M(1:2,151)
#define M_xyyyzzzz           M(1:2,152)
#define M_xyyzzzzz           M(1:2,153)
#define M_xyzzzzzz           M(1:2,154)
#define M_xzzzzzzz           M(1:2,155)
#define M_yyyyyyyy           M(1:2,156)
#define M_yyyyyyyz           M(1:2,157)
#define M_yyyyyyzz           M(1:2,158)
#define M_yyyyyzzz           M(1:2,159)
#define M_yyyyzzzz           M(1:2,160)
#define M_yyyzzzzz           M(1:2,161)
#define M_yyzzzzzz           M(1:2,162)
#define M_yzzzzzzz           M(1:2,163)
#define M_zzzzzzzz           M(1:2,164)
#define M_xxxxxxxxx          M(1:2,165)
#define M_xxxxxxxxy          M(1:2,166)
#define M_xxxxxxxxz          M(1:2,167)
#define M_xxxxxxxyy          M(1:2,168)
#define M_xxxxxxxyz          M(1:2,169)
#define M_xxxxxxxzz          M(1:2,170)
#define M_xxxxxxyyy          M(1:2,171)
#define M_xxxxxxyyz          M(1:2,172)
#define M_xxxxxxyzz          M(1:2,173)
#define M_xxxxxxzzz          M(1:2,174)
#define M_xxxxxyyyy          M(1:2,175)
#define M_xxxxxyyyz          M(1:2,176)
#define M_xxxxxyyzz          M(1:2,177)
#define M_xxxxxyzzz          M(1:2,178)
#define M_xxxxxzzzz          M(1:2,179)
#define M_xxxxyyyyy          M(1:2,180)
#define M_xxxxyyyyz          M(1:2,181)
#define M_xxxxyyyzz          M(1:2,182)
#define M_xxxxyyzzz          M(1:2,183)
#define M_xxxxyzzzz          M(1:2,184)
#define M_xxxxzzzzz          M(1:2,185)
#define M_xxxyyyyyy          M(1:2,186)
#define M_xxxyyyyyz          M(1:2,187)
#define M_xxxyyyyzz          M(1:2,188)
#define M_xxxyyyzzz          M(1:2,189)
#define M_xxxyyzzzz          M(1:2,190)
#define M_xxxyzzzzz          M(1:2,191)
#define M_xxxzzzzzz          M(1:2,192)
#define M_xxyyyyyyy          M(1:2,193)
#define M_xxyyyyyyz          M(1:2,194)
#define M_xxyyyyyzz          M(1:2,195)
#define M_xxyyyyzzz          M(1:2,196)
#define M_xxyyyzzzz          M(1:2,197)
#define M_xxyyzzzzz          M(1:2,198)
#define M_xxyzzzzzz          M(1:2,199)
#define M_xxzzzzzzz          M(1:2,200)
#define M_xyyyyyyyy          M(1:2,201)
#define M_xyyyyyyyz          M(1:2,202)
#define M_xyyyyyyzz          M(1:2,203)
#define M_xyyyyyzzz          M(1:2,204)
#define M_xyyyyzzzz          M(1:2,205)
#define M_xyyyzzzzz          M(1:2,206)
#define M_xyyzzzzzz          M(1:2,207)
#define M_xyzzzzzzz          M(1:2,208)
#define M_xzzzzzzzz          M(1:2,209)
#define M_yyyyyyyyy          M(1:2,210)
#define M_yyyyyyyyz          M(1:2,211)
#define M_yyyyyyyzz          M(1:2,212)
#define M_yyyyyyzzz          M(1:2,213)
#define M_yyyyyzzzz          M(1:2,214)
#define M_yyyyzzzzz          M(1:2,215)
#define M_yyyzzzzzz          M(1:2,216)
#define M_yyzzzzzzz          M(1:2,217)
#define M_yzzzzzzzz          M(1:2,218)
#define M_zzzzzzzzz          M(1:2,219)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v204        = y*z
    v205        = x*y
    v184        = 15.0d0*v204
    v186        = v205
    v188        = v204
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v0          = a2
    v155        = 5.0d0*v0
    v5          = 3.0d0*v0
    v10         = v155
    v24         = 7.0d0*v0
    a3          = a1*a2
    a4          = a2*a2
    v19         = a4
    v159        = 143.0d0*v19
    v54         = 33.0d0*v19
    v82         = v159
    a5          = a2*a3
    a6          = a3*a3
    v49         = a6
    v73         = 429.0d0*v49
    v74         = -v73
    v105        = 715.0d0*v49
    a7          = a3*a4
    a8          = a4*a4
    v99         = a8
    a9          = a4*a5
    b2          = b1*b1
    v1          = b2
    v156        = v0*v1
    v7          = 3.0d0*v1
    v14         = 5.0d0*v1
    v157        = v1*v19
    v27         = v156
    v29         = 7.0d0*v1
    v161        = v1*v49
    v59         = v157
    v80         = -429.0d0*v59
    v111        = v161
    b3          = b1*b2
    b4          = b2*b2
    v31         = b4
    v158        = v0*v31
    v160        = 143.0d0*v31
    v162        = v19*v31
    v65         = v158
    v66         = 33.0d0*v31
    v90         = v160
    v91         = -429.0d0*v65
    v121        = v162
    v148        = -12155.0d0*v121
    b5          = b2*b3
    b6          = b3*b3
    v68         = b6
    v163        = v0*v68
    v92         = 429.0d0*v68
    v93         = -v92
    v127        = v163
    v128        = 715.0d0*v68
    b7          = b3*b4
    b8          = b4*b4
    v130        = b8
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v0 + v1
    v164        = 3.0d0*h
    v165        = h*v0
    v166        = h*v1
    v167        = h*v19
    v169        = v1*v165
    v171        = h*v31
    v172        = h*v49
    v176        = v166*v19
    v178        = v165*v31
    v180        = h*v68
    v4          = -h
    v12         = v164
    v13         = -15.0d0*v1 + v12
    v17         = h*h
    v168        = v0*v17
    v170        = v1*v17
    v173        = v17*v19
    v175        = v156*v17
    v179        = v17*v31
    v18         = 3.0d0*v17
    v20         = v165
    v21         = -30.0d0*v20
    v23         = -v12
    v25         = v23 + v24
    v30         = v23 + v29
    v32         = v166
    v33         = -30.0d0*v32
    v36         = -15.0d0*v17
    v37         = -45.0d0*v17
    v38         = v37 + 630.0d0*v165 - 945.0d0*v19
    v40         = -(v18 + 63.0d0*v27)
    v43         = v37 + 630.0d0*v166 - 945.0d0*v31
    v46         = h*h*h
    v174        = v0*v46
    v177        = v1*v46
    v47         = 5.0d0*v46
    v48         = -v47
    v50         = v167
    v51         = v168
    v53         = 5.0d0*v17
    v55         = v21 + v53 + v54
    v57         = v169
    v58         = -(v46 + 126.0d0*v57)
    v61         = -v0*v12
    v62         = -v1*v12
    v63         = v17 + 33.0d0*v27
    v64         = v170
    v67         = v33 + v53 + v66
    v69         = v171
    v72         = 35.0d0*v46
    v76         = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78         = v47 + 330.0d0*v57
    v79         = h*v54
    v84         = -18.0d0*v51 + v46 + v79
    v85         = 66.0d0*v57
    v197        = -v85
    v86         = 9.0d0*v17
    v87         = 198.0d0*v57
    v88         = h*v66
    v89         = -18.0d0*v64 + v46 + v88
    v94         = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97         = h*h*h*h
    v98         = 35.0d0*v97
    v100        = v172
    v101        = v173
    v102        = v174
    v104        = -v72
    v106        = v104 + v105 - 1001.0d0*v50 + 385.0d0*v51
    v108        = v175
    v109        = 5.0d0*(297.0d0*v108 + v97)
    v198        = -v109
    v110        = 45.0d0*v46
    v112        = v176
    v114        = -14175.0d0*v46
    v116        = -v110
    v117        = -1430.0d0*v57
    v199        = v116 + v117
    v119        = -1351350.0d0*v169
    v200        = v114 + v119
    v120        = v177
    v122        = v178
    v124        = 3.0d0*v46
    v125        = -(v124 + 286.0d0*v57)
    v126        = v179
    v129        = v104 + v128 + 385.0d0*v64 - 1001.0d0*v69
    v131        = v180
    v134        = -315.0d0*v97
    v136        = -99225.0d0*v97
    v137        = v136 + 56756700.0d0*v172 - 28378350.0d0*v173 + 4365900.0d0*v174 - &
      34459425.0d0*v99
    v139        = 385.0d0*(v102 + v120) - (5005.0d0*v108 + v98)
    v141        = 7.0d0*v46
    v142        = -42525.0d0*v97
    v143        = -6081075.0d0*v175
    v201        = v142 + v143
    v145        = -(429.0d0*v108 + v97)
    v146        = -v17*v82
    v147        = -15.0d0*v97
    v149        = -2860.0d0*v108
    v202        = v147 + v148 + v149
    v150        = v124 + 130.0d0*v57
    v203        = -v150
    v152        = -v17*v90
    v154        = v136 - 34459425.0d0*v130 + 4365900.0d0*v177 - 28378350.0d0*v179 + &
      56756700.0d0*v180
    u2          = 1.0/h
    u           = sqrt(u2)
    D_0         = u
    u3          = u*u2
    v2          = u3
    D_x         = -v2*x
    D_y         = -v2*y
    D_z         = -v2*z
    u4          = u2*u2
    u5          = u2*u3
    v3          = u5
    v181        = 3.0d0*v3
    v6          = v181*x
    D_xx        = v3*(v4 + v5)
    D_xy        = v6*y
    D_xz        = v6*z
    D_yy        = v3*(v4 + v7)
    D_yz        = v181*v188
    D_zz        = -(D_xx + D_yy)
    u6          = u3*u3
    u7          = u3*u4
    v8          = u7
    v182        = 3.0d0*v8
    v9          = v8*x
    v11         = v182*(h - v10)
    D_xxx       = -3.0d0*v9*(v155 - v164)
    D_xxy       = v11*y
    D_xxz       = v11*z
    D_xyy       = v13*v9
    D_xyz       = -v184*v9
    D_xzz       = -(D_xxx + D_xyy)
    D_yyy       = v182*y*(v12 - v14)
    D_yyz       = v13*v8*z
    D_yzz       = -(D_xxy + D_yyy)
    D_zzz       = -(D_xxz + D_yyz)
    u8          = u4*u4
    u9          = u4*u5
    v15         = u9
    v183        = 15.0d0*v15*x
    v16         = 3.0d0*v15
    v22         = v183*y
    v26         = v183*z
    v28         = v15*v184
    D_xxxx      = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy      = v22*v25
    D_xxxz      = v25*v26
    D_xxyy      = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz      = v28*(v24 + v4)
    D_xxzz      = -(D_xxxx + D_xxyy)
    D_xyyy      = v22*v30
    D_xyyz      = v26*(v29 + v4)
    D_xyzz      = -(D_xxxy + D_xyyy)
    D_xzzz      = -(D_xxxz + D_xyyz)
    D_yyyy      = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz      = v28*v30
    D_yyzz      = -(D_xxyy + D_yyyy)
    D_yzzz      = -(D_xxyz + D_yyyz)
    D_zzzz      = -(D_xxzz + D_yyzz)
    u10         = u5*u5
    u11         = u5*u6
    v34         = u11
    v206        = v34*z
    v185        = 15.0d0*v34
    v35         = v185*x
    v39         = v206
    v41         = 315.0d0*v186*v206
    v42         = v185*y
    D_xxxxx     = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy     = v34*v38*y
    D_xxxxz     = v38*v39
    D_xxxyy     = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz     = v41*(h - v5)
    D_xxxzz     = -(D_xxxxx + D_xxxyy)
    D_xxyyy     = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz     = v39*(v36 - 945.0d0*v156 + 105.0d0*(v165 + v166))
    D_xxyzz     = -(D_xxxxy + D_xxyyy)
    D_xxzzz     = -(D_xxxxz + D_xxyyz)
    D_xyyyy     = v34*v43*x
    D_xyyyz     = v41*(h - v7)
    D_xyyzz     = -(D_xxxyy + D_xyyyy)
    D_xyzzz     = -(D_xxxyz + D_xyyyz)
    D_xzzzz     = -(D_xxxzz + D_xyyzz)
    D_yyyyy     = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz     = v39*v43
    D_yyyzz     = -(D_xxyyy + D_yyyyy)
    D_yyzzz     = -(D_xxyyz + D_yyyyz)
    D_yzzzz     = -(D_xxyzz + D_yyyzz)
    D_zzzzz     = -(D_xxzzz + D_yyzzz)
    u12         = u6*u6
    u13         = u6*u7
    v44         = u13
    v207        = 315.0d0*v44
    v187        = v207*x
    v45         = 45.0d0*v44
    v52         = v187*y
    v56         = v187*z
    v60         = v188*v207
    D_xxxxxx    = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy    = v52*v55
    D_xxxxxz    = v55*v56
    D_xxxxyy    = v45*(v58 - 21.0d0*v167 + v17*v29 + 14.0d0*v51 + 231.0d0*v59)
    D_xxxxyz    = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz    = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy    = 945.0d0*v186*v44*(11.0d0*v27 + v17 + v61 + v62)
    D_xxxyyz    = v56*(-9.0d0*v32 + v61 + v63)
    D_xxxyzz    = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz    = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy    = v45*(v58 + v17*v24 - 21.0d0*v171 + 14.0d0*v64 + 231.0d0*v65)
    D_xxyyyz    = v60*(-9.0d0*v20 + v62 + v63)
    D_xxyyzz    = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz    = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz    = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy    = v52*v67
    D_xyyyyz    = v56*(-18.0d0*v32 + v17 + v66)
    D_xyyyzz    = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz    = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz    = -(D_xxxyzz + D_xyyyzz)
    D_xzzzzz    = -(D_xxxzzz + D_xyyzzz)
    D_yyyyyy    = v45*(v48 + 105.0d0*v64 + 231.0d0*v68 - 315.0d0*v69)
    D_yyyyyz    = v60*v67
    D_yyyyzz    = -(D_xxyyyy + D_yyyyyy)
    D_yyyzzz    = -(D_xxyyyz + D_yyyyyz)
    D_yyzzzz    = -(D_xxyyzz + D_yyyyzz)
    D_yzzzzz    = -(D_xxyzzz + D_yyyzzz)
    D_zzzzzz    = -(D_xxzzzz + D_yyzzzz)
    u14         = u7*u7
    u15         = u7*u8
    v70         = u15
    v208        = 945.0d0*v70
    v189        = 315.0d0*v70
    v71         = v189*x
    v75         = v189*y
    v77         = v189*z
    v81         = v188*v208*x
    v83         = v208
    D_xxxxxxx   = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy   = v75*v76
    D_xxxxxxz   = v76*v77
    D_xxxxxyy   = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    D_xxxxxyz   = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz   = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy   = -v83*y*(v197 + v1*v18 + v1*v82 - v84)
    D_xxxxyyz   = v77*(-v1*v86 + v80 + v84 + v87)
    D_xxxxyzz   = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz   = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy   = -v83*x*(v197 + v0*v18 + v0*v90 - v89)
    D_xxxyyyz   = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    D_xxxyyzz   = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz   = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz   = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy   = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    D_xxyyyyz   = v77*(-v0*v86 + v87 + v89 + v91)
    D_xxyyyzz   = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz   = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz   = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz   = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy   = v71*v94
    D_xyyyyyz   = v81*(v36 + 110.0d0*v32 - v90)
    D_xyyyyzz   = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz   = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz   = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz   = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz   = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy   = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz   = v77*v94
    D_yyyyyzz   = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz   = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz   = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz   = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz   = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz   = -(D_xxzzzzz + D_yyzzzzz)
    u16         = u8*u8
    u17         = u8*u9
    v95         = u17
    v190        = v205*v95
    v191        = v95*z
    v192        = v191*x
    v193        = v191*y
    v96         = 315.0d0*v95
    v103        = 2835.0d0*v190
    v107        = 2835.0d0*v192
    v113        = v193
    v115        = 945.0d0*v190
    v118        = v192
    v123        = 2835.0d0*v193
    D_xxxxxxxx  = v96*(v98 - 12012.0d0*v100 + 6930.0d0*v101 - 1260.0d0*v102 + 6435.0d0*v99 &
      )
    D_xxxxxxxy  = v103*v106
    D_xxxxxxxz  = v106*v107
    D_xxxxxxyy  = -v96*(v198 + h*v73 + v1*v110 - 495.0d0*v101 + 135.0d0*v102 + 6435.0d0*( &
      -v111 + v112))
    D_xxxxxxyz  = v113*(v114 + 467775.0d0*v168 + 155925.0d0*(-13.0d0*v167 + 13.0d0*v49))
    D_xxxxxxzz  = -(D_xxxxxxxx + D_xxxxxxyy)
    D_xxxxxyyy  = v115*(v199 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    D_xxxxxyyz  = v118*(v200 + 2027025.0d0*v157 - 135135.0d0*v167 + 103950.0d0*v168 + &
      155925.0d0*v170)
    D_xxxxxyzz  = -(D_xxxxxxxy + D_xxxxxyyy)
    D_xxxxxzzz  = -(D_xxxxxxxz + D_xxxxxyyz)
    D_xxxxyyyy  = 945.0d0*v95*(v97 + 396.0d0*v108 + 2145.0d0*v121 + v17*v54 + v17*v66 - &
      18.0d0*(v102 + v120) - 858.0d0*(v112 + v122))
    D_xxxxyyyz  = v123*(v125 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    D_xxxxyyzz  = -(D_xxxxxxyy + D_xxxxyyyy)
    D_xxxxyzzz  = -(D_xxxxxxyz + D_xxxxyyyz)
    D_xxxxzzzz  = -(D_xxxxxxzz + D_xxxxyyzz)
    D_xxxyyyyy  = v115*(v199 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    D_xxxyyyyz  = v107*(v125 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    D_xxxyyyzz  = -(D_xxxxxyyy + D_xxxyyyyy)
    D_xxxyyzzz  = -(D_xxxxxyyz + D_xxxyyyyz)
    D_xxxyzzzz  = -(D_xxxxxyzz + D_xxxyyyzz)
    D_xxxzzzzz  = -(D_xxxxxzzz + D_xxxyyzzz)
    D_xxyyyyyy  = -v96*(v198 + h*v92 + v0*v110 + 135.0d0*v120 - 495.0d0*v126 + 6435.0d0*( &
      v122 - v127))
    D_xxyyyyyz  = v113*(v200 + 2027025.0d0*v158 + 155925.0d0*v168 + 103950.0d0*v170 - &
      135135.0d0*v171)
    D_xxyyyyzz  = -(D_xxxxyyyy + D_xxyyyyyy)
    D_xxyyyzzz  = -(D_xxxxyyyz + D_xxyyyyyz)
    D_xxyyzzzz  = -(D_xxxxyyzz + D_xxyyyyzz)
    D_xxyzzzzz  = -(D_xxxxyzzz + D_xxyyyzzz)
    D_xxzzzzzz  = -(D_xxxxzzzz + D_xxyyzzzz)
    D_xyyyyyyy  = v103*v129
    D_xyyyyyyz  = v118*(v114 + 467775.0d0*v170 + 155925.0d0*(-13.0d0*v171 + 13.0d0*v68))
    D_xyyyyyzz  = -(D_xxxyyyyy + D_xyyyyyyy)
    D_xyyyyzzz  = -(D_xxxyyyyz + D_xyyyyyyz)
    D_xyyyzzzz  = -(D_xxxyyyzz + D_xyyyyyzz)
    D_xyyzzzzz  = -(D_xxxyyzzz + D_xyyyyzzz)
    D_xyzzzzzz  = -(D_xxxyzzzz + D_xyyyzzzz)
    D_xzzzzzzz  = -(D_xxxzzzzz + D_xyyzzzzz)
    D_yyyyyyyy  = v96*(v98 - 1260.0d0*v120 + 6930.0d0*v126 + 6435.0d0*v130 - 12012.0d0* &
      v131)
    D_yyyyyyyz  = v123*v129
    D_yyyyyyzz  = -(D_xxyyyyyy + D_yyyyyyyy)
    D_yyyyyzzz  = -(D_xxyyyyyz + D_yyyyyyyz)
    D_yyyyzzzz  = -(D_xxyyyyzz + D_yyyyyyzz)
    D_yyyzzzzz  = -(D_xxyyyzzz + D_yyyyyzzz)
    D_yyzzzzzz  = -(D_xxyyzzzz + D_yyyyzzzz)
    D_yzzzzzzz  = -(D_xxyzzzzz + D_yyyzzzzz)
    D_zzzzzzzz  = -(D_xxzzzzzz + D_yyzzzzzz)
    u18         = u9*u9
    u19         = u10*u9
    v132        = u19
    v209        = v132*x
    v194        = v209
    v195        = v132*y
    v196        = v132*z
    v133        = 2835.0d0*v194
    v135        = v195
    v138        = v196
    v140        = 155925.0d0*v188*v209
    v144        = 14175.0d0*v196
    v151        = 2835.0d0*v195
    v153        = v194
    D_xxxxxxxxx = v133*(v134 + 25740.0d0*v100 - 18018.0d0*v101 + 4620.0d0*v102 - 12155.0d0 &
      *v99)
    L_xxxxxxxxx = D_xxxxxxxxx*M_0
    D_xxxxxxxxy = v135*v137
    L_xxxxxxxxy = D_xxxxxxxxy*M_0
    D_xxxxxxxxz = v137*v138
    L_xxxxxxxx  = D_xxxxxxxx*M_0 + D_xxxxxxxxx*M_x + D_xxxxxxxxy*M_y + D_xxxxxxxxz*M_z
    L_xxxxxxxxz = D_xxxxxxxxz*M_0
    D_xxxxxxxyy = v133*(v139 + h*v105 - 1001.0d0*v101 - 12155.0d0*v111 + 15015.0d0*v112)
    L_xxxxxxxyy = D_xxxxxxxyy*M_0
    D_xxxxxxxyz = v140*(v141 - 221.0d0*v49 + 273.0d0*v50 - 91.0d0*v51)
    L_xxxxxxxy  = D_xxxxxxxxy*M_x + D_xxxxxxxy*M_0 + D_xxxxxxxyy*M_y + D_xxxxxxxyz*M_z
    L_xxxxxxxyz = D_xxxxxxxyz*M_0
    D_xxxxxxxzz = -(D_xxxxxxxxx + D_xxxxxxxyy)
    L_xxxxxxx   = D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxxx*M_xx + D_xxxxxxxxy*M_xy + &
      D_xxxxxxxxz*M_xz + D_xxxxxxxy*M_y + D_xxxxxxxyy*M_yy + &
      D_xxxxxxxyz*M_yz + D_xxxxxxxz*M_z + D_xxxxxxxzz*M_zz
    L_xxxxxxxz  = D_xxxxxxxxz*M_x + D_xxxxxxxyz*M_y + D_xxxxxxxz*M_0 + D_xxxxxxxzz*M_z
    D_xxxxxxyyy = v135*(v201 - 34459425.0d0*v161 + 1403325.0d0*v174 + 30405375.0d0*v176 + &
      155925.0d0*(39.0d0*v172 - 39.0d0*v173 + v177))
    L_xxxxxxyyy = D_xxxxxxyyy*M_0
    D_xxxxxxyyz = v144*(v145 + v146 + 33.0d0*v102 - 2431.0d0*v111 + 2145.0d0*v112 + 11.0d0 &
      *v120 + 143.0d0*v172)
    L_xxxxxxyy  = D_xxxxxxxyy*M_x + D_xxxxxxyy*M_0 + D_xxxxxxyyy*M_y + D_xxxxxxyyz*M_z
    L_xxxxxxyyz = D_xxxxxxyyz*M_0
    D_xxxxxxyzz = -(D_xxxxxxxxy + D_xxxxxxyyy)
    L_xxxxxxy   = D_xxxxxxxxy*M_xx + D_xxxxxxxy*M_x + D_xxxxxxxyy*M_xy + D_xxxxxxxyz*M_xz &
      + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyyy*M_yy + D_xxxxxxyyz &
      *M_yz + D_xxxxxxyz*M_z + D_xxxxxxyzz*M_zz
    L_xxxxxxyz  = D_xxxxxxxyz*M_x + D_xxxxxxyyz*M_y + D_xxxxxxyz*M_0 + D_xxxxxxyzz*M_z
    D_xxxxxxzzz = -(D_xxxxxxxxz + D_xxxxxxyyz)
    L_xxxxxx    = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*M_xx + D_xxxxxxxxx*M_xxx + &
      D_xxxxxxxxy*M_xxy + D_xxxxxxxxz*M_xxz + D_xxxxxxxy*M_xy + &
      D_xxxxxxxyy*M_xyy + D_xxxxxxxyz*M_xyz + D_xxxxxxxz*M_xz + &
      D_xxxxxxxzz*M_xzz + D_xxxxxxy*M_y + D_xxxxxxyy*M_yy + D_xxxxxxyyy &
      *M_yyy + D_xxxxxxyyz*M_yyz + D_xxxxxxyz*M_yz + D_xxxxxxyzz*M_yzz &
      + D_xxxxxxz*M_z + D_xxxxxxzz*M_zz + D_xxxxxxzzz*M_zzz
    L_xxxxxxz   = D_xxxxxxxxz*M_xx + D_xxxxxxxyz*M_xy + D_xxxxxxxz*M_x + D_xxxxxxxzz*M_xz &
      + D_xxxxxxyyz*M_yy + D_xxxxxxyz*M_y + D_xxxxxxyzz*M_yz + &
      D_xxxxxxz*M_0 + D_xxxxxxzz*M_z + D_xxxxxxzzz*M_zz
    D_xxxxxyyyy = v133*(v146 + v202 + 110.0d0*v102 + 4290.0d0*v112 + 330.0d0*v120 + &
      7150.0d0*v122 - 715.0d0*v126)
    L_xxxxxyyyy = D_xxxxxyyyy*M_0
    D_xxxxxyyyz = -v140*(v203 - 39.0d0*v50 + 26.0d0*v51 + 221.0d0*v59 + 13.0d0*v64)
    L_xxxxxyyy  = D_xxxxxxyyy*M_x + D_xxxxxyyy*M_0 + D_xxxxxyyyy*M_y + D_xxxxxyyyz*M_z
    L_xxxxxyyyz = D_xxxxxyyyz*M_0
    D_xxxxxyyzz = -(D_xxxxxxxyy + D_xxxxxyyyy)
    L_xxxxxyy   = D_xxxxxxxyy*M_xx + D_xxxxxxyy*M_x + D_xxxxxxyyy*M_xy + D_xxxxxxyyz*M_xz &
      + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyyy*M_yy + D_xxxxxyyyz &
      *M_yz + D_xxxxxyyz*M_z + D_xxxxxyyzz*M_zz
    L_xxxxxyyz  = D_xxxxxxyyz*M_x + D_xxxxxyyyz*M_y + D_xxxxxyyz*M_0 + D_xxxxxyyzz*M_z
    D_xxxxxyzzz = -(D_xxxxxxxyz + D_xxxxxyyyz)
    L_xxxxxy    = D_xxxxxxxxy*M_xxx + D_xxxxxxxy*M_xx + D_xxxxxxxyy*M_xxy + D_xxxxxxxyz* &
      M_xxz + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyyy*M_xyy + &
      D_xxxxxxyyz*M_xyz + D_xxxxxxyz*M_xz + D_xxxxxxyzz*M_xzz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyy*M_yy + D_xxxxxyyyy* &
      M_yyy + D_xxxxxyyyz*M_yyz + D_xxxxxyyz*M_yz + D_xxxxxyyzz*M_yzz + &
      D_xxxxxyz*M_z + D_xxxxxyzz*M_zz + D_xxxxxyzzz*M_zzz
    L_xxxxxyz   = D_xxxxxxxyz*M_xx + D_xxxxxxyyz*M_xy + D_xxxxxxyz*M_x + D_xxxxxxyzz*M_xz &
      + D_xxxxxyyyz*M_yy + D_xxxxxyyz*M_y + D_xxxxxyyzz*M_yz + &
      D_xxxxxyz*M_0 + D_xxxxxyzz*M_z + D_xxxxxyzzz*M_zz
    D_xxxxxzzzz = -(D_xxxxxxxzz + D_xxxxxyyzz)
    L_xxxxx     = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxxx*M_xxx + &
      D_xxxxxxxxx*M_xxxx + D_xxxxxxxxy*M_xxxy + D_xxxxxxxxz*M_xxxz + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxyy*M_xxyy + D_xxxxxxxyz*M_xxyz + &
      D_xxxxxxxz*M_xxz + D_xxxxxxxzz*M_xxzz + D_xxxxxxy*M_xy + &
      D_xxxxxxyy*M_xyy + D_xxxxxxyyy*M_xyyy + D_xxxxxxyyz*M_xyyz + &
      D_xxxxxxyz*M_xyz + D_xxxxxxyzz*M_xyzz + D_xxxxxxz*M_xz + &
      D_xxxxxxzz*M_xzz + D_xxxxxxzzz*M_xzzz + D_xxxxxy*M_y + D_xxxxxyy* &
      M_yy + D_xxxxxyyy*M_yyy + D_xxxxxyyyy*M_yyyy + D_xxxxxyyyz*M_yyyz &
      + D_xxxxxyyz*M_yyz + D_xxxxxyyzz*M_yyzz + D_xxxxxyz*M_yz + &
      D_xxxxxyzz*M_yzz + D_xxxxxyzzz*M_yzzz + D_xxxxxz*M_z + D_xxxxxzz* &
      M_zz + D_xxxxxzzz*M_zzz + D_xxxxxzzzz*M_zzzz
    L_xxxxxz    = D_xxxxxxxxz*M_xxx + D_xxxxxxxyz*M_xxy + D_xxxxxxxz*M_xx + D_xxxxxxxzz* &
      M_xxz + D_xxxxxxyyz*M_xyy + D_xxxxxxyz*M_xy + D_xxxxxxyzz*M_xyz + &
      D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + D_xxxxxxzzz*M_xzz + D_xxxxxyyyz &
      *M_yyy + D_xxxxxyyz*M_yy + D_xxxxxyyzz*M_yyz + D_xxxxxyz*M_y + &
      D_xxxxxyzz*M_yz + D_xxxxxyzzz*M_yzz + D_xxxxxz*M_0 + D_xxxxxzz* &
      M_z + D_xxxxxzzz*M_zz + D_xxxxxzzzz*M_zzz
    D_xxxxyyyyy = v151*(v152 + v202 - 715.0d0*v101 + 330.0d0*v102 + 7150.0d0*v112 + &
      110.0d0*v120 + 4290.0d0*v122)
    L_xxxxyyyyy = D_xxxxyyyyy*M_0
    D_xxxxyyyyz = -2835.0d0*v138*(v159*v17 + v160*v17 + 12155.0d0*v162 + 1716.0d0*v175 + &
      3.0d0*v97 - 66.0d0*(v174 + v177) - 4290.0d0*(v176 + v178))
    L_xxxxyyyy  = D_xxxxxyyyy*M_x + D_xxxxyyyy*M_0 + D_xxxxyyyyy*M_y + D_xxxxyyyyz*M_z
    L_xxxxyyyyz = D_xxxxyyyyz*M_0
    D_xxxxyyyzz = -(D_xxxxxxyyy + D_xxxxyyyyy)
    L_xxxxyyy   = D_xxxxxxyyy*M_xx + D_xxxxxyyy*M_x + D_xxxxxyyyy*M_xy + D_xxxxxyyyz*M_xz &
      + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyyy*M_yy + D_xxxxyyyyz &
      *M_yz + D_xxxxyyyz*M_z + D_xxxxyyyzz*M_zz
    L_xxxxyyyz  = D_xxxxxyyyz*M_x + D_xxxxyyyyz*M_y + D_xxxxyyyz*M_0 + D_xxxxyyyzz*M_z
    D_xxxxyyzzz = -(D_xxxxxxyyz + D_xxxxyyyyz)
    L_xxxxyy    = D_xxxxxxxyy*M_xxx + D_xxxxxxyy*M_xx + D_xxxxxxyyy*M_xxy + D_xxxxxxyyz* &
      M_xxz + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyyy*M_xyy + &
      D_xxxxxyyyz*M_xyz + D_xxxxxyyz*M_xz + D_xxxxxyyzz*M_xzz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyy*M_yy + D_xxxxyyyyy* &
      M_yyy + D_xxxxyyyyz*M_yyz + D_xxxxyyyz*M_yz + D_xxxxyyyzz*M_yzz + &
      D_xxxxyyz*M_z + D_xxxxyyzz*M_zz + D_xxxxyyzzz*M_zzz
    L_xxxxyyz   = D_xxxxxxyyz*M_xx + D_xxxxxyyyz*M_xy + D_xxxxxyyz*M_x + D_xxxxxyyzz*M_xz &
      + D_xxxxyyyyz*M_yy + D_xxxxyyyz*M_y + D_xxxxyyyzz*M_yz + &
      D_xxxxyyz*M_0 + D_xxxxyyzz*M_z + D_xxxxyyzzz*M_zz
    D_xxxxyzzzz = -(D_xxxxxxyzz + D_xxxxyyyzz)
    L_xxxxy     = D_xxxxxxxxy*M_xxxx + D_xxxxxxxy*M_xxx + D_xxxxxxxyy*M_xxxy + D_xxxxxxxyz &
      *M_xxxz + D_xxxxxxy*M_xx + D_xxxxxxyy*M_xxy + D_xxxxxxyyy*M_xxyy &
      + D_xxxxxxyyz*M_xxyz + D_xxxxxxyz*M_xxz + D_xxxxxxyzz*M_xxzz + &
      D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyy*M_xyy + D_xxxxxyyyy* &
      M_xyyy + D_xxxxxyyyz*M_xyyz + D_xxxxxyyz*M_xyz + D_xxxxxyyzz* &
      M_xyzz + D_xxxxxyz*M_xz + D_xxxxxyzz*M_xzz + D_xxxxxyzzz*M_xzzz + &
      D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyyy*M_yyy + &
      D_xxxxyyyyy*M_yyyy + D_xxxxyyyyz*M_yyyz + D_xxxxyyyz*M_yyz + &
      D_xxxxyyyzz*M_yyzz + D_xxxxyyz*M_yz + D_xxxxyyzz*M_yzz + &
      D_xxxxyyzzz*M_yzzz + D_xxxxyz*M_z + D_xxxxyzz*M_zz + D_xxxxyzzz* &
      M_zzz + D_xxxxyzzzz*M_zzzz
    L_xxxxyz    = D_xxxxxxxyz*M_xxx + D_xxxxxxyyz*M_xxy + D_xxxxxxyz*M_xx + D_xxxxxxyzz* &
      M_xxz + D_xxxxxyyyz*M_xyy + D_xxxxxyyz*M_xy + D_xxxxxyyzz*M_xyz + &
      D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + D_xxxxxyzzz*M_xzz + D_xxxxyyyyz &
      *M_yyy + D_xxxxyyyz*M_yy + D_xxxxyyyzz*M_yyz + D_xxxxyyz*M_y + &
      D_xxxxyyzz*M_yz + D_xxxxyyzzz*M_yzz + D_xxxxyz*M_0 + D_xxxxyzz* &
      M_z + D_xxxxyzzz*M_zz + D_xxxxyzzzz*M_zzz
    D_xxxxzzzzz = -(D_xxxxxxzzz + D_xxxxyyzzz)
    L_xxxx      = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxxx* &
      M_xxxx + D_xxxxxxxxx*M_xxxxx + D_xxxxxxxxy*M_xxxxy + D_xxxxxxxxz* &
      M_xxxxz + D_xxxxxxxy*M_xxxy + D_xxxxxxxyy*M_xxxyy + D_xxxxxxxyz* &
      M_xxxyz + D_xxxxxxxz*M_xxxz + D_xxxxxxxzz*M_xxxzz + D_xxxxxxy* &
      M_xxy + D_xxxxxxyy*M_xxyy + D_xxxxxxyyy*M_xxyyy + D_xxxxxxyyz* &
      M_xxyyz + D_xxxxxxyz*M_xxyz + D_xxxxxxyzz*M_xxyzz + D_xxxxxxz* &
      M_xxz + D_xxxxxxzz*M_xxzz + D_xxxxxxzzz*M_xxzzz + D_xxxxxy*M_xy + &
      D_xxxxxyy*M_xyy + D_xxxxxyyy*M_xyyy + D_xxxxxyyyy*M_xyyyy + &
      D_xxxxxyyyz*M_xyyyz + D_xxxxxyyz*M_xyyz + D_xxxxxyyzz*M_xyyzz + &
      D_xxxxxyz*M_xyz + D_xxxxxyzz*M_xyzz + D_xxxxxyzzz*M_xyzzz + &
      D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxxzzz*M_xzzz + D_xxxxxzzzz &
      *M_xzzzz + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + &
      D_xxxxyyyy*M_yyyy + D_xxxxyyyyy*M_yyyyy + D_xxxxyyyyz*M_yyyyz + &
      D_xxxxyyyz*M_yyyz + D_xxxxyyyzz*M_yyyzz + D_xxxxyyz*M_yyz + &
      D_xxxxyyzz*M_yyzz + D_xxxxyyzzz*M_yyzzz + D_xxxxyz*M_yz + &
      D_xxxxyzz*M_yzz + D_xxxxyzzz*M_yzzz + D_xxxxyzzzz*M_yzzzz + &
      D_xxxxz*M_z + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz + D_xxxxzzzz*M_zzzz &
      + D_xxxxzzzzz*M_zzzzz
    L_xxxxz     = D_xxxxxxxxz*M_xxxx + D_xxxxxxxyz*M_xxxy + D_xxxxxxxz*M_xxx + D_xxxxxxxzz &
      *M_xxxz + D_xxxxxxyyz*M_xxyy + D_xxxxxxyz*M_xxy + D_xxxxxxyzz* &
      M_xxyz + D_xxxxxxz*M_xx + D_xxxxxxzz*M_xxz + D_xxxxxxzzz*M_xxzz + &
      D_xxxxxyyyz*M_xyyy + D_xxxxxyyz*M_xyy + D_xxxxxyyzz*M_xyyz + &
      D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxyzzz*M_xyzz + D_xxxxxz &
      *M_x + D_xxxxxzz*M_xz + D_xxxxxzzz*M_xzz + D_xxxxxzzzz*M_xzzz + &
      D_xxxxyyyyz*M_yyyy + D_xxxxyyyz*M_yyy + D_xxxxyyyzz*M_yyyz + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyyzzz*M_yyzz + D_xxxxyz &
      *M_y + D_xxxxyzz*M_yz + D_xxxxyzzz*M_yzz + D_xxxxyzzzz*M_yzzz + &
      D_xxxxz*M_0 + D_xxxxzz*M_z + D_xxxxzzz*M_zz + D_xxxxzzzz*M_zzz + &
      D_xxxxzzzzz*M_zzzz
    D_xxxyyyyyy = v153*(v201 - 34459425.0d0*v163 + 1403325.0d0*v177 + 30405375.0d0*v178 + &
      155925.0d0*(v174 - 39.0d0*v179 + 39.0d0*v180))
    L_xxxyyyyyy = D_xxxyyyyyy*M_0
    D_xxxyyyyyz = -v140*(v203 + 13.0d0*v51 + 26.0d0*v64 + 221.0d0*v65 - 39.0d0*v69)
    L_xxxyyyyy  = D_xxxxyyyyy*M_x + D_xxxyyyyy*M_0 + D_xxxyyyyyy*M_y + D_xxxyyyyyz*M_z
    L_xxxyyyyyz = D_xxxyyyyyz*M_0
    D_xxxyyyyzz = -(D_xxxxxyyyy + D_xxxyyyyyy)
    L_xxxyyyy   = D_xxxxxyyyy*M_xx + D_xxxxyyyy*M_x + D_xxxxyyyyy*M_xy + D_xxxxyyyyz*M_xz &
      + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyyy*M_yy + D_xxxyyyyyz &
      *M_yz + D_xxxyyyyz*M_z + D_xxxyyyyzz*M_zz
    L_xxxyyyyz  = D_xxxxyyyyz*M_x + D_xxxyyyyyz*M_y + D_xxxyyyyz*M_0 + D_xxxyyyyzz*M_z
    D_xxxyyyzzz = -(D_xxxxxyyyz + D_xxxyyyyyz)
    L_xxxyyy    = D_xxxxxxyyy*M_xxx + D_xxxxxyyy*M_xx + D_xxxxxyyyy*M_xxy + D_xxxxxyyyz* &
      M_xxz + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyyy*M_xyy + &
      D_xxxxyyyyz*M_xyz + D_xxxxyyyz*M_xz + D_xxxxyyyzz*M_xzz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyy*M_yy + D_xxxyyyyyy* &
      M_yyy + D_xxxyyyyyz*M_yyz + D_xxxyyyyz*M_yz + D_xxxyyyyzz*M_yzz + &
      D_xxxyyyz*M_z + D_xxxyyyzz*M_zz + D_xxxyyyzzz*M_zzz
    L_xxxyyyz   = D_xxxxxyyyz*M_xx + D_xxxxyyyyz*M_xy + D_xxxxyyyz*M_x + D_xxxxyyyzz*M_xz &
      + D_xxxyyyyyz*M_yy + D_xxxyyyyz*M_y + D_xxxyyyyzz*M_yz + &
      D_xxxyyyz*M_0 + D_xxxyyyzz*M_z + D_xxxyyyzzz*M_zz
    D_xxxyyzzzz = -(D_xxxxxyyzz + D_xxxyyyyzz)
    L_xxxyy     = D_xxxxxxxyy*M_xxxx + D_xxxxxxyy*M_xxx + D_xxxxxxyyy*M_xxxy + D_xxxxxxyyz &
      *M_xxxz + D_xxxxxyy*M_xx + D_xxxxxyyy*M_xxy + D_xxxxxyyyy*M_xxyy &
      + D_xxxxxyyyz*M_xxyz + D_xxxxxyyz*M_xxz + D_xxxxxyyzz*M_xxzz + &
      D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyy*M_xyy + D_xxxxyyyyy* &
      M_xyyy + D_xxxxyyyyz*M_xyyz + D_xxxxyyyz*M_xyz + D_xxxxyyyzz* &
      M_xyzz + D_xxxxyyz*M_xz + D_xxxxyyzz*M_xzz + D_xxxxyyzzz*M_xzzz + &
      D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyyy*M_yyy + &
      D_xxxyyyyyy*M_yyyy + D_xxxyyyyyz*M_yyyz + D_xxxyyyyz*M_yyz + &
      D_xxxyyyyzz*M_yyzz + D_xxxyyyz*M_yz + D_xxxyyyzz*M_yzz + &
      D_xxxyyyzzz*M_yzzz + D_xxxyyz*M_z + D_xxxyyzz*M_zz + D_xxxyyzzz* &
      M_zzz + D_xxxyyzzzz*M_zzzz
    L_xxxyyz    = D_xxxxxxyyz*M_xxx + D_xxxxxyyyz*M_xxy + D_xxxxxyyz*M_xx + D_xxxxxyyzz* &
      M_xxz + D_xxxxyyyyz*M_xyy + D_xxxxyyyz*M_xy + D_xxxxyyyzz*M_xyz + &
      D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + D_xxxxyyzzz*M_xzz + D_xxxyyyyyz &
      *M_yyy + D_xxxyyyyz*M_yy + D_xxxyyyyzz*M_yyz + D_xxxyyyz*M_y + &
      D_xxxyyyzz*M_yz + D_xxxyyyzzz*M_yzz + D_xxxyyz*M_0 + D_xxxyyzz* &
      M_z + D_xxxyyzzz*M_zz + D_xxxyyzzzz*M_zzz
    D_xxxyzzzzz = -(D_xxxxxyzzz + D_xxxyyyzzz)
    L_xxxy      = D_xxxxxxxxy*M_xxxxx + D_xxxxxxxy*M_xxxx + D_xxxxxxxyy*M_xxxxy + &
      D_xxxxxxxyz*M_xxxxz + D_xxxxxxy*M_xxx + D_xxxxxxyy*M_xxxy + &
      D_xxxxxxyyy*M_xxxyy + D_xxxxxxyyz*M_xxxyz + D_xxxxxxyz*M_xxxz + &
      D_xxxxxxyzz*M_xxxzz + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + &
      D_xxxxxyyy*M_xxyy + D_xxxxxyyyy*M_xxyyy + D_xxxxxyyyz*M_xxyyz + &
      D_xxxxxyyz*M_xxyz + D_xxxxxyyzz*M_xxyzz + D_xxxxxyz*M_xxz + &
      D_xxxxxyzz*M_xxzz + D_xxxxxyzzz*M_xxzzz + D_xxxxy*M_x + D_xxxxyy* &
      M_xy + D_xxxxyyy*M_xyy + D_xxxxyyyy*M_xyyy + D_xxxxyyyyy*M_xyyyy &
      + D_xxxxyyyyz*M_xyyyz + D_xxxxyyyz*M_xyyz + D_xxxxyyyzz*M_xyyzz + &
      D_xxxxyyz*M_xyz + D_xxxxyyzz*M_xyzz + D_xxxxyyzzz*M_xyzzz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxxyzzz*M_xzzz + D_xxxxyzzzz &
      *M_xzzzz + D_xxxy*M_0 + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyyy* &
      M_yyy + D_xxxyyyyy*M_yyyy + D_xxxyyyyyy*M_yyyyy + D_xxxyyyyyz* &
      M_yyyyz + D_xxxyyyyz*M_yyyz + D_xxxyyyyzz*M_yyyzz + D_xxxyyyz* &
      M_yyz + D_xxxyyyzz*M_yyzz + D_xxxyyyzzz*M_yyzzz + D_xxxyyz*M_yz + &
      D_xxxyyzz*M_yzz + D_xxxyyzzz*M_yzzz + D_xxxyyzzzz*M_yzzzz + &
      D_xxxyz*M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz + D_xxxyzzzz*M_zzzz &
      + D_xxxyzzzzz*M_zzzzz
    L_xxxyz     = D_xxxxxxxyz*M_xxxx + D_xxxxxxyyz*M_xxxy + D_xxxxxxyz*M_xxx + D_xxxxxxyzz &
      *M_xxxz + D_xxxxxyyyz*M_xxyy + D_xxxxxyyz*M_xxy + D_xxxxxyyzz* &
      M_xxyz + D_xxxxxyz*M_xx + D_xxxxxyzz*M_xxz + D_xxxxxyzzz*M_xxzz + &
      D_xxxxyyyyz*M_xyyy + D_xxxxyyyz*M_xyy + D_xxxxyyyzz*M_xyyz + &
      D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyyzzz*M_xyzz + D_xxxxyz &
      *M_x + D_xxxxyzz*M_xz + D_xxxxyzzz*M_xzz + D_xxxxyzzzz*M_xzzz + &
      D_xxxyyyyyz*M_yyyy + D_xxxyyyyz*M_yyy + D_xxxyyyyzz*M_yyyz + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyyzzz*M_yyzz + D_xxxyyz &
      *M_y + D_xxxyyzz*M_yz + D_xxxyyzzz*M_yzz + D_xxxyyzzzz*M_yzzz + &
      D_xxxyz*M_0 + D_xxxyzz*M_z + D_xxxyzzz*M_zz + D_xxxyzzzz*M_zzz + &
      D_xxxyzzzzz*M_zzzz
    D_xxxzzzzzz = -(D_xxxxxzzzz + D_xxxyyzzzz)
    L_xxx       = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxxx*M_xxxxx + D_xxxxxxxxx*M_xxxxxx + D_xxxxxxxxy* &
      M_xxxxxy + D_xxxxxxxxz*M_xxxxxz + D_xxxxxxxy*M_xxxxy + &
      D_xxxxxxxyy*M_xxxxyy + D_xxxxxxxyz*M_xxxxyz + D_xxxxxxxz*M_xxxxz &
      + D_xxxxxxxzz*M_xxxxzz + D_xxxxxxy*M_xxxy + D_xxxxxxyy*M_xxxyy + &
      D_xxxxxxyyy*M_xxxyyy + D_xxxxxxyyz*M_xxxyyz + D_xxxxxxyz*M_xxxyz &
      + D_xxxxxxyzz*M_xxxyzz + D_xxxxxxz*M_xxxz + D_xxxxxxzz*M_xxxzz + &
      D_xxxxxxzzz*M_xxxzzz + D_xxxxxy*M_xxy + D_xxxxxyy*M_xxyy + &
      D_xxxxxyyy*M_xxyyy + D_xxxxxyyyy*M_xxyyyy + D_xxxxxyyyz*M_xxyyyz &
      + D_xxxxxyyz*M_xxyyz + D_xxxxxyyzz*M_xxyyzz + D_xxxxxyz*M_xxyz + &
      D_xxxxxyzz*M_xxyzz + D_xxxxxyzzz*M_xxyzzz + D_xxxxxz*M_xxz + &
      D_xxxxxzz*M_xxzz + D_xxxxxzzz*M_xxzzz + D_xxxxxzzzz*M_xxzzzz + &
      D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyyy*M_xyyy + D_xxxxyyyy* &
      M_xyyyy + D_xxxxyyyyy*M_xyyyyy + D_xxxxyyyyz*M_xyyyyz + &
      D_xxxxyyyz*M_xyyyz + D_xxxxyyyzz*M_xyyyzz + D_xxxxyyz*M_xyyz + &
      D_xxxxyyzz*M_xyyzz + D_xxxxyyzzz*M_xyyzzz + D_xxxxyz*M_xyz + &
      D_xxxxyzz*M_xyzz + D_xxxxyzzz*M_xyzzz + D_xxxxyzzzz*M_xyzzzz + &
      D_xxxxz*M_xz + D_xxxxzz*M_xzz + D_xxxxzzz*M_xzzz + D_xxxxzzzz* &
      M_xzzzz + D_xxxxzzzzz*M_xzzzzz + D_xxxy*M_y + D_xxxyy*M_yy + &
      D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyyy*M_yyyyy + &
      D_xxxyyyyyy*M_yyyyyy + D_xxxyyyyyz*M_yyyyyz + D_xxxyyyyz*M_yyyyz &
      + D_xxxyyyyzz*M_yyyyzz + D_xxxyyyz*M_yyyz + D_xxxyyyzz*M_yyyzz + &
      D_xxxyyyzzz*M_yyyzzz + D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + &
      D_xxxyyzzz*M_yyzzz + D_xxxyyzzzz*M_yyzzzz + D_xxxyz*M_yz + &
      D_xxxyzz*M_yzz + D_xxxyzzz*M_yzzz + D_xxxyzzzz*M_yzzzz + &
      D_xxxyzzzzz*M_yzzzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz &
      + D_xxxzzzz*M_zzzz + D_xxxzzzzz*M_zzzzz + D_xxxzzzzzz*M_zzzzzz
    L_xxxz      = D_xxxxxxxxz*M_xxxxx + D_xxxxxxxyz*M_xxxxy + D_xxxxxxxz*M_xxxx + &
      D_xxxxxxxzz*M_xxxxz + D_xxxxxxyyz*M_xxxyy + D_xxxxxxyz*M_xxxy + &
      D_xxxxxxyzz*M_xxxyz + D_xxxxxxz*M_xxx + D_xxxxxxzz*M_xxxz + &
      D_xxxxxxzzz*M_xxxzz + D_xxxxxyyyz*M_xxyyy + D_xxxxxyyz*M_xxyy + &
      D_xxxxxyyzz*M_xxyyz + D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz + &
      D_xxxxxyzzz*M_xxyzz + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + &
      D_xxxxxzzz*M_xxzz + D_xxxxxzzzz*M_xxzzz + D_xxxxyyyyz*M_xyyyy + &
      D_xxxxyyyz*M_xyyy + D_xxxxyyyzz*M_xyyyz + D_xxxxyyz*M_xyy + &
      D_xxxxyyzz*M_xyyz + D_xxxxyyzzz*M_xyyzz + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxyzzz*M_xyzz + D_xxxxyzzzz*M_xyzzz + &
      D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxxzzzz*M_xzzz &
      + D_xxxxzzzzz*M_xzzzz + D_xxxyyyyyz*M_yyyyy + D_xxxyyyyz*M_yyyy + &
      D_xxxyyyyzz*M_yyyyz + D_xxxyyyz*M_yyy + D_xxxyyyzz*M_yyyz + &
      D_xxxyyyzzz*M_yyyzz + D_xxxyyz*M_yy + D_xxxyyzz*M_yyz + &
      D_xxxyyzzz*M_yyzz + D_xxxyyzzzz*M_yyzzz + D_xxxyz*M_y + D_xxxyzz* &
      M_yz + D_xxxyzzz*M_yzz + D_xxxyzzzz*M_yzzz + D_xxxyzzzzz*M_yzzzz &
      + D_xxxz*M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz + &
      D_xxxzzzzz*M_zzzz + D_xxxzzzzzz*M_zzzzz
    D_xxyyyyyyy = v151*(v139 + h*v128 + 15015.0d0*v122 - 1001.0d0*v126 - 12155.0d0*v127)
    L_xxyyyyyyy = D_xxyyyyyyy*M_0
    D_xxyyyyyyz = v144*(v145 + v152 + 11.0d0*v102 + 33.0d0*v120 + 2145.0d0*v122 - 2431.0d0 &
      *v127 + 143.0d0*v180)
    L_xxyyyyyy  = D_xxxyyyyyy*M_x + D_xxyyyyyy*M_0 + D_xxyyyyyyy*M_y + D_xxyyyyyyz*M_z
    L_xxyyyyyyz = D_xxyyyyyyz*M_0
    D_xxyyyyyzz = -(D_xxxxyyyyy + D_xxyyyyyyy)
    L_xxyyyyy   = D_xxxxyyyyy*M_xx + D_xxxyyyyy*M_x + D_xxxyyyyyy*M_xy + D_xxxyyyyyz*M_xz &
      + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyyy*M_yy + D_xxyyyyyyz &
      *M_yz + D_xxyyyyyz*M_z + D_xxyyyyyzz*M_zz
    L_xxyyyyyz  = D_xxxyyyyyz*M_x + D_xxyyyyyyz*M_y + D_xxyyyyyz*M_0 + D_xxyyyyyzz*M_z
    D_xxyyyyzzz = -(D_xxxxyyyyz + D_xxyyyyyyz)
    L_xxyyyy    = D_xxxxxyyyy*M_xxx + D_xxxxyyyy*M_xx + D_xxxxyyyyy*M_xxy + D_xxxxyyyyz* &
      M_xxz + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyyy*M_xyy + &
      D_xxxyyyyyz*M_xyz + D_xxxyyyyz*M_xz + D_xxxyyyyzz*M_xzz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyy*M_yy + D_xxyyyyyyy* &
      M_yyy + D_xxyyyyyyz*M_yyz + D_xxyyyyyz*M_yz + D_xxyyyyyzz*M_yzz + &
      D_xxyyyyz*M_z + D_xxyyyyzz*M_zz + D_xxyyyyzzz*M_zzz
    L_xxyyyyz   = D_xxxxyyyyz*M_xx + D_xxxyyyyyz*M_xy + D_xxxyyyyz*M_x + D_xxxyyyyzz*M_xz &
      + D_xxyyyyyyz*M_yy + D_xxyyyyyz*M_y + D_xxyyyyyzz*M_yz + &
      D_xxyyyyz*M_0 + D_xxyyyyzz*M_z + D_xxyyyyzzz*M_zz
    D_xxyyyzzzz = -(D_xxxxyyyzz + D_xxyyyyyzz)
    L_xxyyy     = D_xxxxxxyyy*M_xxxx + D_xxxxxyyy*M_xxx + D_xxxxxyyyy*M_xxxy + D_xxxxxyyyz &
      *M_xxxz + D_xxxxyyy*M_xx + D_xxxxyyyy*M_xxy + D_xxxxyyyyy*M_xxyy &
      + D_xxxxyyyyz*M_xxyz + D_xxxxyyyz*M_xxz + D_xxxxyyyzz*M_xxzz + &
      D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyy*M_xyy + D_xxxyyyyyy* &
      M_xyyy + D_xxxyyyyyz*M_xyyz + D_xxxyyyyz*M_xyz + D_xxxyyyyzz* &
      M_xyzz + D_xxxyyyz*M_xz + D_xxxyyyzz*M_xzz + D_xxxyyyzzz*M_xzzz + &
      D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyyy*M_yyy + &
      D_xxyyyyyyy*M_yyyy + D_xxyyyyyyz*M_yyyz + D_xxyyyyyz*M_yyz + &
      D_xxyyyyyzz*M_yyzz + D_xxyyyyz*M_yz + D_xxyyyyzz*M_yzz + &
      D_xxyyyyzzz*M_yzzz + D_xxyyyz*M_z + D_xxyyyzz*M_zz + D_xxyyyzzz* &
      M_zzz + D_xxyyyzzzz*M_zzzz
    L_xxyyyz    = D_xxxxxyyyz*M_xxx + D_xxxxyyyyz*M_xxy + D_xxxxyyyz*M_xx + D_xxxxyyyzz* &
      M_xxz + D_xxxyyyyyz*M_xyy + D_xxxyyyyz*M_xy + D_xxxyyyyzz*M_xyz + &
      D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + D_xxxyyyzzz*M_xzz + D_xxyyyyyyz &
      *M_yyy + D_xxyyyyyz*M_yy + D_xxyyyyyzz*M_yyz + D_xxyyyyz*M_y + &
      D_xxyyyyzz*M_yz + D_xxyyyyzzz*M_yzz + D_xxyyyz*M_0 + D_xxyyyzz* &
      M_z + D_xxyyyzzz*M_zz + D_xxyyyzzzz*M_zzz
    D_xxyyzzzzz = -(D_xxxxyyzzz + D_xxyyyyzzz)
    L_xxyy      = D_xxxxxxxyy*M_xxxxx + D_xxxxxxyy*M_xxxx + D_xxxxxxyyy*M_xxxxy + &
      D_xxxxxxyyz*M_xxxxz + D_xxxxxyy*M_xxx + D_xxxxxyyy*M_xxxy + &
      D_xxxxxyyyy*M_xxxyy + D_xxxxxyyyz*M_xxxyz + D_xxxxxyyz*M_xxxz + &
      D_xxxxxyyzz*M_xxxzz + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + &
      D_xxxxyyyy*M_xxyy + D_xxxxyyyyy*M_xxyyy + D_xxxxyyyyz*M_xxyyz + &
      D_xxxxyyyz*M_xxyz + D_xxxxyyyzz*M_xxyzz + D_xxxxyyz*M_xxz + &
      D_xxxxyyzz*M_xxzz + D_xxxxyyzzz*M_xxzzz + D_xxxyy*M_x + D_xxxyyy* &
      M_xy + D_xxxyyyy*M_xyy + D_xxxyyyyy*M_xyyy + D_xxxyyyyyy*M_xyyyy &
      + D_xxxyyyyyz*M_xyyyz + D_xxxyyyyz*M_xyyz + D_xxxyyyyzz*M_xyyzz + &
      D_xxxyyyz*M_xyz + D_xxxyyyzz*M_xyzz + D_xxxyyyzzz*M_xyzzz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxxyyzzz*M_xzzz + D_xxxyyzzzz &
      *M_xzzzz + D_xxyy*M_0 + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyyy* &
      M_yyy + D_xxyyyyyy*M_yyyy + D_xxyyyyyyy*M_yyyyy + D_xxyyyyyyz* &
      M_yyyyz + D_xxyyyyyz*M_yyyz + D_xxyyyyyzz*M_yyyzz + D_xxyyyyz* &
      M_yyz + D_xxyyyyzz*M_yyzz + D_xxyyyyzzz*M_yyzzz + D_xxyyyz*M_yz + &
      D_xxyyyzz*M_yzz + D_xxyyyzzz*M_yzzz + D_xxyyyzzzz*M_yzzzz + &
      D_xxyyz*M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz + D_xxyyzzzz*M_zzzz &
      + D_xxyyzzzzz*M_zzzzz
    L_xxyyz     = D_xxxxxxyyz*M_xxxx + D_xxxxxyyyz*M_xxxy + D_xxxxxyyz*M_xxx + D_xxxxxyyzz &
      *M_xxxz + D_xxxxyyyyz*M_xxyy + D_xxxxyyyz*M_xxy + D_xxxxyyyzz* &
      M_xxyz + D_xxxxyyz*M_xx + D_xxxxyyzz*M_xxz + D_xxxxyyzzz*M_xxzz + &
      D_xxxyyyyyz*M_xyyy + D_xxxyyyyz*M_xyy + D_xxxyyyyzz*M_xyyz + &
      D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyyzzz*M_xyzz + D_xxxyyz &
      *M_x + D_xxxyyzz*M_xz + D_xxxyyzzz*M_xzz + D_xxxyyzzzz*M_xzzz + &
      D_xxyyyyyyz*M_yyyy + D_xxyyyyyz*M_yyy + D_xxyyyyyzz*M_yyyz + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyyzzz*M_yyzz + D_xxyyyz &
      *M_y + D_xxyyyzz*M_yz + D_xxyyyzzz*M_yzz + D_xxyyyzzzz*M_yzzz + &
      D_xxyyz*M_0 + D_xxyyzz*M_z + D_xxyyzzz*M_zz + D_xxyyzzzz*M_zzz + &
      D_xxyyzzzzz*M_zzzz
    D_xxyzzzzzz = -(D_xxxxyzzzz + D_xxyyyzzzz)
    L_xxy       = D_xxxxxxxxy*M_xxxxxx + D_xxxxxxxy*M_xxxxx + D_xxxxxxxyy*M_xxxxxy + &
      D_xxxxxxxyz*M_xxxxxz + D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + &
      D_xxxxxxyyy*M_xxxxyy + D_xxxxxxyyz*M_xxxxyz + D_xxxxxxyz*M_xxxxz &
      + D_xxxxxxyzz*M_xxxxzz + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + &
      D_xxxxxyyy*M_xxxyy + D_xxxxxyyyy*M_xxxyyy + D_xxxxxyyyz*M_xxxyyz &
      + D_xxxxxyyz*M_xxxyz + D_xxxxxyyzz*M_xxxyzz + D_xxxxxyz*M_xxxz + &
      D_xxxxxyzz*M_xxxzz + D_xxxxxyzzz*M_xxxzzz + D_xxxxy*M_xx + &
      D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyyy*M_xxyyy + &
      D_xxxxyyyyy*M_xxyyyy + D_xxxxyyyyz*M_xxyyyz + D_xxxxyyyz*M_xxyyz &
      + D_xxxxyyyzz*M_xxyyzz + D_xxxxyyz*M_xxyz + D_xxxxyyzz*M_xxyzz + &
      D_xxxxyyzzz*M_xxyzzz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + &
      D_xxxxyzzz*M_xxzzz + D_xxxxyzzzz*M_xxzzzz + D_xxxy*M_x + D_xxxyy* &
      M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + D_xxxyyyyy*M_xyyyy + &
      D_xxxyyyyyy*M_xyyyyy + D_xxxyyyyyz*M_xyyyyz + D_xxxyyyyz*M_xyyyz &
      + D_xxxyyyyzz*M_xyyyzz + D_xxxyyyz*M_xyyz + D_xxxyyyzz*M_xyyzz + &
      D_xxxyyyzzz*M_xyyzzz + D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + &
      D_xxxyyzzz*M_xyzzz + D_xxxyyzzzz*M_xyzzzz + D_xxxyz*M_xz + &
      D_xxxyzz*M_xzz + D_xxxyzzz*M_xzzz + D_xxxyzzzz*M_xzzzz + &
      D_xxxyzzzzz*M_xzzzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyyy*M_yyyyy + &
      D_xxyyyyyyy*M_yyyyyy + D_xxyyyyyyz*M_yyyyyz + D_xxyyyyyz*M_yyyyz &
      + D_xxyyyyyzz*M_yyyyzz + D_xxyyyyz*M_yyyz + D_xxyyyyzz*M_yyyzz + &
      D_xxyyyyzzz*M_yyyzzz + D_xxyyyz*M_yyz + D_xxyyyzz*M_yyzz + &
      D_xxyyyzzz*M_yyzzz + D_xxyyyzzzz*M_yyzzzz + D_xxyyz*M_yz + &
      D_xxyyzz*M_yzz + D_xxyyzzz*M_yzzz + D_xxyyzzzz*M_yzzzz + &
      D_xxyyzzzzz*M_yzzzzz + D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz &
      + D_xxyzzzz*M_zzzz + D_xxyzzzzz*M_zzzzz + D_xxyzzzzzz*M_zzzzzz
    L_xxyz      = D_xxxxxxxyz*M_xxxxx + D_xxxxxxyyz*M_xxxxy + D_xxxxxxyz*M_xxxx + &
      D_xxxxxxyzz*M_xxxxz + D_xxxxxyyyz*M_xxxyy + D_xxxxxyyz*M_xxxy + &
      D_xxxxxyyzz*M_xxxyz + D_xxxxxyz*M_xxx + D_xxxxxyzz*M_xxxz + &
      D_xxxxxyzzz*M_xxxzz + D_xxxxyyyyz*M_xxyyy + D_xxxxyyyz*M_xxyy + &
      D_xxxxyyyzz*M_xxyyz + D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz + &
      D_xxxxyyzzz*M_xxyzz + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + &
      D_xxxxyzzz*M_xxzz + D_xxxxyzzzz*M_xxzzz + D_xxxyyyyyz*M_xyyyy + &
      D_xxxyyyyz*M_xyyy + D_xxxyyyyzz*M_xyyyz + D_xxxyyyz*M_xyy + &
      D_xxxyyyzz*M_xyyz + D_xxxyyyzzz*M_xyyzz + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyyzzz*M_xyzz + D_xxxyyzzzz*M_xyzzz + &
      D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxxyzzzz*M_xzzz &
      + D_xxxyzzzzz*M_xzzzz + D_xxyyyyyyz*M_yyyyy + D_xxyyyyyz*M_yyyy + &
      D_xxyyyyyzz*M_yyyyz + D_xxyyyyz*M_yyy + D_xxyyyyzz*M_yyyz + &
      D_xxyyyyzzz*M_yyyzz + D_xxyyyz*M_yy + D_xxyyyzz*M_yyz + &
      D_xxyyyzzz*M_yyzz + D_xxyyyzzzz*M_yyzzz + D_xxyyz*M_y + D_xxyyzz* &
      M_yz + D_xxyyzzz*M_yzz + D_xxyyzzzz*M_yzzz + D_xxyyzzzzz*M_yzzzz &
      + D_xxyz*M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz + &
      D_xxyzzzzz*M_zzzz + D_xxyzzzzzz*M_zzzzz
    D_xxzzzzzzz = -(D_xxxxzzzzz + D_xxyyzzzzz)
    L_xx        = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxxx*M_xxxxxx + D_xxxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxxy*M_xxxxxxy + D_xxxxxxxxz*M_xxxxxxz + D_xxxxxxxy* &
      M_xxxxxy + D_xxxxxxxyy*M_xxxxxyy + D_xxxxxxxyz*M_xxxxxyz + &
      D_xxxxxxxz*M_xxxxxz + D_xxxxxxxzz*M_xxxxxzz + D_xxxxxxy*M_xxxxy + &
      D_xxxxxxyy*M_xxxxyy + D_xxxxxxyyy*M_xxxxyyy + D_xxxxxxyyz* &
      M_xxxxyyz + D_xxxxxxyz*M_xxxxyz + D_xxxxxxyzz*M_xxxxyzz + &
      D_xxxxxxz*M_xxxxz + D_xxxxxxzz*M_xxxxzz + D_xxxxxxzzz*M_xxxxzzz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyyy*M_xxxyyy + &
      D_xxxxxyyyy*M_xxxyyyy + D_xxxxxyyyz*M_xxxyyyz + D_xxxxxyyz* &
      M_xxxyyz + D_xxxxxyyzz*M_xxxyyzz + D_xxxxxyz*M_xxxyz + D_xxxxxyzz &
      *M_xxxyzz + D_xxxxxyzzz*M_xxxyzzz + D_xxxxxz*M_xxxz + D_xxxxxzz* &
      M_xxxzz + D_xxxxxzzz*M_xxxzzz + D_xxxxxzzzz*M_xxxzzzz + D_xxxxy* &
      M_xxy + D_xxxxyy*M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyyy*M_xxyyyy &
      + D_xxxxyyyyy*M_xxyyyyy + D_xxxxyyyyz*M_xxyyyyz + D_xxxxyyyz* &
      M_xxyyyz + D_xxxxyyyzz*M_xxyyyzz + D_xxxxyyz*M_xxyyz + D_xxxxyyzz &
      *M_xxyyzz + D_xxxxyyzzz*M_xxyyzzz + D_xxxxyz*M_xxyz + D_xxxxyzz* &
      M_xxyzz + D_xxxxyzzz*M_xxyzzz + D_xxxxyzzzz*M_xxyzzzz + D_xxxxz* &
      M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz*M_xxzzz + D_xxxxzzzz*M_xxzzzz &
      + D_xxxxzzzzz*M_xxzzzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy* &
      M_xyyy + D_xxxyyyy*M_xyyyy + D_xxxyyyyy*M_xyyyyy + D_xxxyyyyyy* &
      M_xyyyyyy + D_xxxyyyyyz*M_xyyyyyz + D_xxxyyyyz*M_xyyyyz + &
      D_xxxyyyyzz*M_xyyyyzz + D_xxxyyyz*M_xyyyz + D_xxxyyyzz*M_xyyyzz + &
      D_xxxyyyzzz*M_xyyyzzz + D_xxxyyz*M_xyyz + D_xxxyyzz*M_xyyzz + &
      D_xxxyyzzz*M_xyyzzz + D_xxxyyzzzz*M_xyyzzzz + D_xxxyz*M_xyz + &
      D_xxxyzz*M_xyzz + D_xxxyzzz*M_xyzzz + D_xxxyzzzz*M_xyzzzz + &
      D_xxxyzzzzz*M_xyzzzzz + D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz* &
      M_xzzz + D_xxxzzzz*M_xzzzz + D_xxxzzzzz*M_xzzzzz + D_xxxzzzzzz* &
      M_xzzzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + D_xxyyyy* &
      M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyyy*M_yyyyyy + D_xxyyyyyyy* &
      M_yyyyyyy + D_xxyyyyyyz*M_yyyyyyz + D_xxyyyyyz*M_yyyyyz + &
      D_xxyyyyyzz*M_yyyyyzz + D_xxyyyyz*M_yyyyz + D_xxyyyyzz*M_yyyyzz + &
      D_xxyyyyzzz*M_yyyyzzz + D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + &
      D_xxyyyzzz*M_yyyzzz + D_xxyyyzzzz*M_yyyzzzz + D_xxyyz*M_yyz + &
      D_xxyyzz*M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyyzzzz*M_yyzzzz + &
      D_xxyyzzzzz*M_yyzzzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz* &
      M_yzzz + D_xxyzzzz*M_yzzzz + D_xxyzzzzz*M_yzzzzz + D_xxyzzzzzz* &
      M_yzzzzzz + D_xxz*M_z + D_xxzz*M_zz + D_xxzzz*M_zzz + D_xxzzzz* &
      M_zzzz + D_xxzzzzz*M_zzzzz + D_xxzzzzzz*M_zzzzzz + D_xxzzzzzzz* &
      M_zzzzzzz
    L_xxz       = D_xxxxxxxxz*M_xxxxxx + D_xxxxxxxyz*M_xxxxxy + D_xxxxxxxz*M_xxxxx + &
      D_xxxxxxxzz*M_xxxxxz + D_xxxxxxyyz*M_xxxxyy + D_xxxxxxyz*M_xxxxy &
      + D_xxxxxxyzz*M_xxxxyz + D_xxxxxxz*M_xxxx + D_xxxxxxzz*M_xxxxz + &
      D_xxxxxxzzz*M_xxxxzz + D_xxxxxyyyz*M_xxxyyy + D_xxxxxyyz*M_xxxyy &
      + D_xxxxxyyzz*M_xxxyyz + D_xxxxxyz*M_xxxy + D_xxxxxyzz*M_xxxyz + &
      D_xxxxxyzzz*M_xxxyzz + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + &
      D_xxxxxzzz*M_xxxzz + D_xxxxxzzzz*M_xxxzzz + D_xxxxyyyyz*M_xxyyyy &
      + D_xxxxyyyz*M_xxyyy + D_xxxxyyyzz*M_xxyyyz + D_xxxxyyz*M_xxyy + &
      D_xxxxyyzz*M_xxyyz + D_xxxxyyzzz*M_xxyyzz + D_xxxxyz*M_xxy + &
      D_xxxxyzz*M_xxyz + D_xxxxyzzz*M_xxyzz + D_xxxxyzzzz*M_xxyzzz + &
      D_xxxxz*M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxxzzzz* &
      M_xxzzz + D_xxxxzzzzz*M_xxzzzz + D_xxxyyyyyz*M_xyyyyy + &
      D_xxxyyyyz*M_xyyyy + D_xxxyyyyzz*M_xyyyyz + D_xxxyyyz*M_xyyy + &
      D_xxxyyyzz*M_xyyyz + D_xxxyyyzzz*M_xyyyzz + D_xxxyyz*M_xyy + &
      D_xxxyyzz*M_xyyz + D_xxxyyzzz*M_xyyzz + D_xxxyyzzzz*M_xyyzzz + &
      D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxyzzz*M_xyzz + D_xxxyzzzz* &
      M_xyzzz + D_xxxyzzzzz*M_xyzzzz + D_xxxz*M_x + D_xxxzz*M_xz + &
      D_xxxzzz*M_xzz + D_xxxzzzz*M_xzzz + D_xxxzzzzz*M_xzzzz + &
      D_xxxzzzzzz*M_xzzzzz + D_xxyyyyyyz*M_yyyyyy + D_xxyyyyyz*M_yyyyy &
      + D_xxyyyyyzz*M_yyyyyz + D_xxyyyyz*M_yyyy + D_xxyyyyzz*M_yyyyz + &
      D_xxyyyyzzz*M_yyyyzz + D_xxyyyz*M_yyy + D_xxyyyzz*M_yyyz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyyzzzz*M_yyyzzz + D_xxyyz*M_yy + &
      D_xxyyzz*M_yyz + D_xxyyzzz*M_yyzz + D_xxyyzzzz*M_yyzzz + &
      D_xxyyzzzzz*M_yyzzzz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz &
      + D_xxyzzzz*M_yzzz + D_xxyzzzzz*M_yzzzz + D_xxyzzzzzz*M_yzzzzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + &
      D_xxzzzzz*M_zzzz + D_xxzzzzzz*M_zzzzz + D_xxzzzzzzz*M_zzzzzz
    D_xyyyyyyyy = v153*v154
    L_xyyyyyyyy = D_xyyyyyyyy*M_0
    D_xyyyyyyyz = v140*(v141 - 91.0d0*v64 - 221.0d0*v68 + 273.0d0*v69)
    L_xyyyyyyy  = D_xxyyyyyyy*M_x + D_xyyyyyyy*M_0 + D_xyyyyyyyy*M_y + D_xyyyyyyyz*M_z
    L_xyyyyyyyz = D_xyyyyyyyz*M_0
    D_xyyyyyyzz = -(D_xxxyyyyyy + D_xyyyyyyyy)
    L_xyyyyyy   = D_xxxyyyyyy*M_xx + D_xxyyyyyy*M_x + D_xxyyyyyyy*M_xy + D_xxyyyyyyz*M_xz &
      + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyyy*M_yy + D_xyyyyyyyz &
      *M_yz + D_xyyyyyyz*M_z + D_xyyyyyyzz*M_zz
    L_xyyyyyyz  = D_xxyyyyyyz*M_x + D_xyyyyyyyz*M_y + D_xyyyyyyz*M_0 + D_xyyyyyyzz*M_z
    D_xyyyyyzzz = -(D_xxxyyyyyz + D_xyyyyyyyz)
    L_xyyyyy    = D_xxxxyyyyy*M_xxx + D_xxxyyyyy*M_xx + D_xxxyyyyyy*M_xxy + D_xxxyyyyyz* &
      M_xxz + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyyy*M_xyy + &
      D_xxyyyyyyz*M_xyz + D_xxyyyyyz*M_xz + D_xxyyyyyzz*M_xzz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyy*M_yy + D_xyyyyyyyy* &
      M_yyy + D_xyyyyyyyz*M_yyz + D_xyyyyyyz*M_yz + D_xyyyyyyzz*M_yzz + &
      D_xyyyyyz*M_z + D_xyyyyyzz*M_zz + D_xyyyyyzzz*M_zzz
    L_xyyyyyz   = D_xxxyyyyyz*M_xx + D_xxyyyyyyz*M_xy + D_xxyyyyyz*M_x + D_xxyyyyyzz*M_xz &
      + D_xyyyyyyyz*M_yy + D_xyyyyyyz*M_y + D_xyyyyyyzz*M_yz + &
      D_xyyyyyz*M_0 + D_xyyyyyzz*M_z + D_xyyyyyzzz*M_zz
    D_xyyyyzzzz = -(D_xxxyyyyzz + D_xyyyyyyzz)
    L_xyyyy     = D_xxxxxyyyy*M_xxxx + D_xxxxyyyy*M_xxx + D_xxxxyyyyy*M_xxxy + D_xxxxyyyyz &
      *M_xxxz + D_xxxyyyy*M_xx + D_xxxyyyyy*M_xxy + D_xxxyyyyyy*M_xxyy &
      + D_xxxyyyyyz*M_xxyz + D_xxxyyyyz*M_xxz + D_xxxyyyyzz*M_xxzz + &
      D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyy*M_xyy + D_xxyyyyyyy* &
      M_xyyy + D_xxyyyyyyz*M_xyyz + D_xxyyyyyz*M_xyz + D_xxyyyyyzz* &
      M_xyzz + D_xxyyyyz*M_xz + D_xxyyyyzz*M_xzz + D_xxyyyyzzz*M_xzzz + &
      D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyyy*M_yyy + &
      D_xyyyyyyyy*M_yyyy + D_xyyyyyyyz*M_yyyz + D_xyyyyyyz*M_yyz + &
      D_xyyyyyyzz*M_yyzz + D_xyyyyyz*M_yz + D_xyyyyyzz*M_yzz + &
      D_xyyyyyzzz*M_yzzz + D_xyyyyz*M_z + D_xyyyyzz*M_zz + D_xyyyyzzz* &
      M_zzz + D_xyyyyzzzz*M_zzzz
    L_xyyyyz    = D_xxxxyyyyz*M_xxx + D_xxxyyyyyz*M_xxy + D_xxxyyyyz*M_xx + D_xxxyyyyzz* &
      M_xxz + D_xxyyyyyyz*M_xyy + D_xxyyyyyz*M_xy + D_xxyyyyyzz*M_xyz + &
      D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + D_xxyyyyzzz*M_xzz + D_xyyyyyyyz &
      *M_yyy + D_xyyyyyyz*M_yy + D_xyyyyyyzz*M_yyz + D_xyyyyyz*M_y + &
      D_xyyyyyzz*M_yz + D_xyyyyyzzz*M_yzz + D_xyyyyz*M_0 + D_xyyyyzz* &
      M_z + D_xyyyyzzz*M_zz + D_xyyyyzzzz*M_zzz
    D_xyyyzzzzz = -(D_xxxyyyzzz + D_xyyyyyzzz)
    L_xyyy      = D_xxxxxxyyy*M_xxxxx + D_xxxxxyyy*M_xxxx + D_xxxxxyyyy*M_xxxxy + &
      D_xxxxxyyyz*M_xxxxz + D_xxxxyyy*M_xxx + D_xxxxyyyy*M_xxxy + &
      D_xxxxyyyyy*M_xxxyy + D_xxxxyyyyz*M_xxxyz + D_xxxxyyyz*M_xxxz + &
      D_xxxxyyyzz*M_xxxzz + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + &
      D_xxxyyyyy*M_xxyy + D_xxxyyyyyy*M_xxyyy + D_xxxyyyyyz*M_xxyyz + &
      D_xxxyyyyz*M_xxyz + D_xxxyyyyzz*M_xxyzz + D_xxxyyyz*M_xxz + &
      D_xxxyyyzz*M_xxzz + D_xxxyyyzzz*M_xxzzz + D_xxyyy*M_x + D_xxyyyy* &
      M_xy + D_xxyyyyy*M_xyy + D_xxyyyyyy*M_xyyy + D_xxyyyyyyy*M_xyyyy &
      + D_xxyyyyyyz*M_xyyyz + D_xxyyyyyz*M_xyyz + D_xxyyyyyzz*M_xyyzz + &
      D_xxyyyyz*M_xyz + D_xxyyyyzz*M_xyzz + D_xxyyyyzzz*M_xyzzz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xxyyyzzz*M_xzzz + D_xxyyyzzzz &
      *M_xzzzz + D_xyyy*M_0 + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyyy* &
      M_yyy + D_xyyyyyyy*M_yyyy + D_xyyyyyyyy*M_yyyyy + D_xyyyyyyyz* &
      M_yyyyz + D_xyyyyyyz*M_yyyz + D_xyyyyyyzz*M_yyyzz + D_xyyyyyz* &
      M_yyz + D_xyyyyyzz*M_yyzz + D_xyyyyyzzz*M_yyzzz + D_xyyyyz*M_yz + &
      D_xyyyyzz*M_yzz + D_xyyyyzzz*M_yzzz + D_xyyyyzzzz*M_yzzzz + &
      D_xyyyz*M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz + D_xyyyzzzz*M_zzzz &
      + D_xyyyzzzzz*M_zzzzz
    L_xyyyz     = D_xxxxxyyyz*M_xxxx + D_xxxxyyyyz*M_xxxy + D_xxxxyyyz*M_xxx + D_xxxxyyyzz &
      *M_xxxz + D_xxxyyyyyz*M_xxyy + D_xxxyyyyz*M_xxy + D_xxxyyyyzz* &
      M_xxyz + D_xxxyyyz*M_xx + D_xxxyyyzz*M_xxz + D_xxxyyyzzz*M_xxzz + &
      D_xxyyyyyyz*M_xyyy + D_xxyyyyyz*M_xyy + D_xxyyyyyzz*M_xyyz + &
      D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyyzzz*M_xyzz + D_xxyyyz &
      *M_x + D_xxyyyzz*M_xz + D_xxyyyzzz*M_xzz + D_xxyyyzzzz*M_xzzz + &
      D_xyyyyyyyz*M_yyyy + D_xyyyyyyz*M_yyy + D_xyyyyyyzz*M_yyyz + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyyzzz*M_yyzz + D_xyyyyz &
      *M_y + D_xyyyyzz*M_yz + D_xyyyyzzz*M_yzz + D_xyyyyzzzz*M_yzzz + &
      D_xyyyz*M_0 + D_xyyyzz*M_z + D_xyyyzzz*M_zz + D_xyyyzzzz*M_zzz + &
      D_xyyyzzzzz*M_zzzz
    D_xyyzzzzzz = -(D_xxxyyzzzz + D_xyyyyzzzz)
    L_xyy       = D_xxxxxxxyy*M_xxxxxx + D_xxxxxxyy*M_xxxxx + D_xxxxxxyyy*M_xxxxxy + &
      D_xxxxxxyyz*M_xxxxxz + D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + &
      D_xxxxxyyyy*M_xxxxyy + D_xxxxxyyyz*M_xxxxyz + D_xxxxxyyz*M_xxxxz &
      + D_xxxxxyyzz*M_xxxxzz + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + &
      D_xxxxyyyy*M_xxxyy + D_xxxxyyyyy*M_xxxyyy + D_xxxxyyyyz*M_xxxyyz &
      + D_xxxxyyyz*M_xxxyz + D_xxxxyyyzz*M_xxxyzz + D_xxxxyyz*M_xxxz + &
      D_xxxxyyzz*M_xxxzz + D_xxxxyyzzz*M_xxxzzz + D_xxxyy*M_xx + &
      D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyyy*M_xxyyy + &
      D_xxxyyyyyy*M_xxyyyy + D_xxxyyyyyz*M_xxyyyz + D_xxxyyyyz*M_xxyyz &
      + D_xxxyyyyzz*M_xxyyzz + D_xxxyyyz*M_xxyz + D_xxxyyyzz*M_xxyzz + &
      D_xxxyyyzzz*M_xxyzzz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + &
      D_xxxyyzzz*M_xxzzz + D_xxxyyzzzz*M_xxzzzz + D_xxyy*M_x + D_xxyyy* &
      M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + D_xxyyyyyy*M_xyyyy + &
      D_xxyyyyyyy*M_xyyyyy + D_xxyyyyyyz*M_xyyyyz + D_xxyyyyyz*M_xyyyz &
      + D_xxyyyyyzz*M_xyyyzz + D_xxyyyyz*M_xyyz + D_xxyyyyzz*M_xyyzz + &
      D_xxyyyyzzz*M_xyyzzz + D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + &
      D_xxyyyzzz*M_xyzzz + D_xxyyyzzzz*M_xyzzzz + D_xxyyz*M_xz + &
      D_xxyyzz*M_xzz + D_xxyyzzz*M_xzzz + D_xxyyzzzz*M_xzzzz + &
      D_xxyyzzzzz*M_xzzzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyyy*M_yyyyy + &
      D_xyyyyyyyy*M_yyyyyy + D_xyyyyyyyz*M_yyyyyz + D_xyyyyyyz*M_yyyyz &
      + D_xyyyyyyzz*M_yyyyzz + D_xyyyyyz*M_yyyz + D_xyyyyyzz*M_yyyzz + &
      D_xyyyyyzzz*M_yyyzzz + D_xyyyyz*M_yyz + D_xyyyyzz*M_yyzz + &
      D_xyyyyzzz*M_yyzzz + D_xyyyyzzzz*M_yyzzzz + D_xyyyz*M_yz + &
      D_xyyyzz*M_yzz + D_xyyyzzz*M_yzzz + D_xyyyzzzz*M_yzzzz + &
      D_xyyyzzzzz*M_yzzzzz + D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz &
      + D_xyyzzzz*M_zzzz + D_xyyzzzzz*M_zzzzz + D_xyyzzzzzz*M_zzzzzz
    L_xyyz      = D_xxxxxxyyz*M_xxxxx + D_xxxxxyyyz*M_xxxxy + D_xxxxxyyz*M_xxxx + &
      D_xxxxxyyzz*M_xxxxz + D_xxxxyyyyz*M_xxxyy + D_xxxxyyyz*M_xxxy + &
      D_xxxxyyyzz*M_xxxyz + D_xxxxyyz*M_xxx + D_xxxxyyzz*M_xxxz + &
      D_xxxxyyzzz*M_xxxzz + D_xxxyyyyyz*M_xxyyy + D_xxxyyyyz*M_xxyy + &
      D_xxxyyyyzz*M_xxyyz + D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz + &
      D_xxxyyyzzz*M_xxyzz + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + &
      D_xxxyyzzz*M_xxzz + D_xxxyyzzzz*M_xxzzz + D_xxyyyyyyz*M_xyyyy + &
      D_xxyyyyyz*M_xyyy + D_xxyyyyyzz*M_xyyyz + D_xxyyyyz*M_xyy + &
      D_xxyyyyzz*M_xyyz + D_xxyyyyzzz*M_xyyzz + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyyzzz*M_xyzz + D_xxyyyzzzz*M_xyzzz + &
      D_xxyyz*M_x + D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xxyyzzzz*M_xzzz &
      + D_xxyyzzzzz*M_xzzzz + D_xyyyyyyyz*M_yyyyy + D_xyyyyyyz*M_yyyy + &
      D_xyyyyyyzz*M_yyyyz + D_xyyyyyz*M_yyy + D_xyyyyyzz*M_yyyz + &
      D_xyyyyyzzz*M_yyyzz + D_xyyyyz*M_yy + D_xyyyyzz*M_yyz + &
      D_xyyyyzzz*M_yyzz + D_xyyyyzzzz*M_yyzzz + D_xyyyz*M_y + D_xyyyzz* &
      M_yz + D_xyyyzzz*M_yzz + D_xyyyzzzz*M_yzzz + D_xyyyzzzzz*M_yzzzz &
      + D_xyyz*M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz + &
      D_xyyzzzzz*M_zzzz + D_xyyzzzzzz*M_zzzzz
    D_xyzzzzzzz = -(D_xxxyzzzzz + D_xyyyzzzzz)
    L_xy        = D_xxxxxxxxy*M_xxxxxxx + D_xxxxxxxy*M_xxxxxx + D_xxxxxxxyy*M_xxxxxxy + &
      D_xxxxxxxyz*M_xxxxxxz + D_xxxxxxy*M_xxxxx + D_xxxxxxyy*M_xxxxxy + &
      D_xxxxxxyyy*M_xxxxxyy + D_xxxxxxyyz*M_xxxxxyz + D_xxxxxxyz* &
      M_xxxxxz + D_xxxxxxyzz*M_xxxxxzz + D_xxxxxy*M_xxxx + D_xxxxxyy* &
      M_xxxxy + D_xxxxxyyy*M_xxxxyy + D_xxxxxyyyy*M_xxxxyyy + &
      D_xxxxxyyyz*M_xxxxyyz + D_xxxxxyyz*M_xxxxyz + D_xxxxxyyzz* &
      M_xxxxyzz + D_xxxxxyz*M_xxxxz + D_xxxxxyzz*M_xxxxzz + D_xxxxxyzzz &
      *M_xxxxzzz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy*M_xxxyy &
      + D_xxxxyyyy*M_xxxyyy + D_xxxxyyyyy*M_xxxyyyy + D_xxxxyyyyz* &
      M_xxxyyyz + D_xxxxyyyz*M_xxxyyz + D_xxxxyyyzz*M_xxxyyzz + &
      D_xxxxyyz*M_xxxyz + D_xxxxyyzz*M_xxxyzz + D_xxxxyyzzz*M_xxxyzzz + &
      D_xxxxyz*M_xxxz + D_xxxxyzz*M_xxxzz + D_xxxxyzzz*M_xxxzzz + &
      D_xxxxyzzzz*M_xxxzzzz + D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyy* &
      M_xxyy + D_xxxyyyy*M_xxyyy + D_xxxyyyyy*M_xxyyyy + D_xxxyyyyyy* &
      M_xxyyyyy + D_xxxyyyyyz*M_xxyyyyz + D_xxxyyyyz*M_xxyyyz + &
      D_xxxyyyyzz*M_xxyyyzz + D_xxxyyyz*M_xxyyz + D_xxxyyyzz*M_xxyyzz + &
      D_xxxyyyzzz*M_xxyyzzz + D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + &
      D_xxxyyzzz*M_xxyzzz + D_xxxyyzzzz*M_xxyzzzz + D_xxxyz*M_xxz + &
      D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxxyzzzz*M_xxzzzz + &
      D_xxxyzzzzz*M_xxzzzzz + D_xxy*M_x + D_xxyy*M_xy + D_xxyyy*M_xyy + &
      D_xxyyyy*M_xyyy + D_xxyyyyy*M_xyyyy + D_xxyyyyyy*M_xyyyyy + &
      D_xxyyyyyyy*M_xyyyyyy + D_xxyyyyyyz*M_xyyyyyz + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyyyyzz*M_xyyyyzz + D_xxyyyyz*M_xyyyz + D_xxyyyyzz &
      *M_xyyyzz + D_xxyyyyzzz*M_xyyyzzz + D_xxyyyz*M_xyyz + D_xxyyyzz* &
      M_xyyzz + D_xxyyyzzz*M_xyyzzz + D_xxyyyzzzz*M_xyyzzzz + D_xxyyz* &
      M_xyz + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyyzzzz*M_xyzzzz &
      + D_xxyyzzzzz*M_xyzzzzz + D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz* &
      M_xzzz + D_xxyzzzz*M_xzzzz + D_xxyzzzzz*M_xzzzzz + D_xxyzzzzzz* &
      M_xzzzzzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + &
      D_xyyyyy*M_yyyy + D_xyyyyyy*M_yyyyy + D_xyyyyyyy*M_yyyyyy + &
      D_xyyyyyyyy*M_yyyyyyy + D_xyyyyyyyz*M_yyyyyyz + D_xyyyyyyz* &
      M_yyyyyz + D_xyyyyyyzz*M_yyyyyzz + D_xyyyyyz*M_yyyyz + D_xyyyyyzz &
      *M_yyyyzz + D_xyyyyyzzz*M_yyyyzzz + D_xyyyyz*M_yyyz + D_xyyyyzz* &
      M_yyyzz + D_xyyyyzzz*M_yyyzzz + D_xyyyyzzzz*M_yyyzzzz + D_xyyyz* &
      M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz*M_yyzzz + D_xyyyzzzz*M_yyzzzz &
      + D_xyyyzzzzz*M_yyzzzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz* &
      M_yzzz + D_xyyzzzz*M_yzzzz + D_xyyzzzzz*M_yzzzzz + D_xyyzzzzzz* &
      M_yzzzzzz + D_xyz*M_z + D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz* &
      M_zzzz + D_xyzzzzz*M_zzzzz + D_xyzzzzzz*M_zzzzzz + D_xyzzzzzzz* &
      M_zzzzzzz
    L_xyz       = D_xxxxxxxyz*M_xxxxxx + D_xxxxxxyyz*M_xxxxxy + D_xxxxxxyz*M_xxxxx + &
      D_xxxxxxyzz*M_xxxxxz + D_xxxxxyyyz*M_xxxxyy + D_xxxxxyyz*M_xxxxy &
      + D_xxxxxyyzz*M_xxxxyz + D_xxxxxyz*M_xxxx + D_xxxxxyzz*M_xxxxz + &
      D_xxxxxyzzz*M_xxxxzz + D_xxxxyyyyz*M_xxxyyy + D_xxxxyyyz*M_xxxyy &
      + D_xxxxyyyzz*M_xxxyyz + D_xxxxyyz*M_xxxy + D_xxxxyyzz*M_xxxyz + &
      D_xxxxyyzzz*M_xxxyzz + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + &
      D_xxxxyzzz*M_xxxzz + D_xxxxyzzzz*M_xxxzzz + D_xxxyyyyyz*M_xxyyyy &
      + D_xxxyyyyz*M_xxyyy + D_xxxyyyyzz*M_xxyyyz + D_xxxyyyz*M_xxyy + &
      D_xxxyyyzz*M_xxyyz + D_xxxyyyzzz*M_xxyyzz + D_xxxyyz*M_xxy + &
      D_xxxyyzz*M_xxyz + D_xxxyyzzz*M_xxyzz + D_xxxyyzzzz*M_xxyzzz + &
      D_xxxyz*M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxxyzzzz* &
      M_xxzzz + D_xxxyzzzzz*M_xxzzzz + D_xxyyyyyyz*M_xyyyyy + &
      D_xxyyyyyz*M_xyyyy + D_xxyyyyyzz*M_xyyyyz + D_xxyyyyz*M_xyyy + &
      D_xxyyyyzz*M_xyyyz + D_xxyyyyzzz*M_xyyyzz + D_xxyyyz*M_xyy + &
      D_xxyyyzz*M_xyyz + D_xxyyyzzz*M_xyyzz + D_xxyyyzzzz*M_xyyzzz + &
      D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyyzzz*M_xyzz + D_xxyyzzzz* &
      M_xyzzz + D_xxyyzzzzz*M_xyzzzz + D_xxyz*M_x + D_xxyzz*M_xz + &
      D_xxyzzz*M_xzz + D_xxyzzzz*M_xzzz + D_xxyzzzzz*M_xzzzz + &
      D_xxyzzzzzz*M_xzzzzz + D_xyyyyyyyz*M_yyyyyy + D_xyyyyyyz*M_yyyyy &
      + D_xyyyyyyzz*M_yyyyyz + D_xyyyyyz*M_yyyy + D_xyyyyyzz*M_yyyyz + &
      D_xyyyyyzzz*M_yyyyzz + D_xyyyyz*M_yyy + D_xyyyyzz*M_yyyz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyyzzzz*M_yyyzzz + D_xyyyz*M_yy + &
      D_xyyyzz*M_yyz + D_xyyyzzz*M_yyzz + D_xyyyzzzz*M_yyzzz + &
      D_xyyyzzzzz*M_yyzzzz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz &
      + D_xyyzzzz*M_yzzz + D_xyyzzzzz*M_yzzzz + D_xyyzzzzzz*M_yzzzzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + &
      D_xyzzzzz*M_zzzz + D_xyzzzzzz*M_zzzzz + D_xyzzzzzzz*M_zzzzzz
    D_xzzzzzzzz = -(D_xxxzzzzzz + D_xyyzzzzzz)
    L_x         = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxxx*M_xxxxxxxx + D_xxxxxxxxy*M_xxxxxxxy + D_xxxxxxxxz* &
      M_xxxxxxxz + D_xxxxxxxy*M_xxxxxxy + D_xxxxxxxyy*M_xxxxxxyy + &
      D_xxxxxxxyz*M_xxxxxxyz + D_xxxxxxxz*M_xxxxxxz + D_xxxxxxxzz* &
      M_xxxxxxzz + D_xxxxxxy*M_xxxxxy + D_xxxxxxyy*M_xxxxxyy + &
      D_xxxxxxyyy*M_xxxxxyyy + D_xxxxxxyyz*M_xxxxxyyz + D_xxxxxxyz* &
      M_xxxxxyz + D_xxxxxxyzz*M_xxxxxyzz + D_xxxxxxz*M_xxxxxz + &
      D_xxxxxxzz*M_xxxxxzz + D_xxxxxxzzz*M_xxxxxzzz + D_xxxxxy*M_xxxxy &
      + D_xxxxxyy*M_xxxxyy + D_xxxxxyyy*M_xxxxyyy + D_xxxxxyyyy* &
      M_xxxxyyyy + D_xxxxxyyyz*M_xxxxyyyz + D_xxxxxyyz*M_xxxxyyz + &
      D_xxxxxyyzz*M_xxxxyyzz + D_xxxxxyz*M_xxxxyz + D_xxxxxyzz* &
      M_xxxxyzz + D_xxxxxyzzz*M_xxxxyzzz + D_xxxxxz*M_xxxxz + D_xxxxxzz &
      *M_xxxxzz + D_xxxxxzzz*M_xxxxzzz + D_xxxxxzzzz*M_xxxxzzzz + &
      D_xxxxy*M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + &
      D_xxxxyyyy*M_xxxyyyy + D_xxxxyyyyy*M_xxxyyyyy + D_xxxxyyyyz* &
      M_xxxyyyyz + D_xxxxyyyz*M_xxxyyyz + D_xxxxyyyzz*M_xxxyyyzz + &
      D_xxxxyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyyzz + D_xxxxyyzzz* &
      M_xxxyyzzz + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + D_xxxxyzzz* &
      M_xxxyzzz + D_xxxxyzzzz*M_xxxyzzzz + D_xxxxz*M_xxxz + D_xxxxzz* &
      M_xxxzz + D_xxxxzzz*M_xxxzzz + D_xxxxzzzz*M_xxxzzzz + D_xxxxzzzzz &
      *M_xxxzzzzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy*M_xxyyy + &
      D_xxxyyyy*M_xxyyyy + D_xxxyyyyy*M_xxyyyyy + D_xxxyyyyyy* &
      M_xxyyyyyy + D_xxxyyyyyz*M_xxyyyyyz + D_xxxyyyyz*M_xxyyyyz + &
      D_xxxyyyyzz*M_xxyyyyzz + D_xxxyyyz*M_xxyyyz + D_xxxyyyzz* &
      M_xxyyyzz + D_xxxyyyzzz*M_xxyyyzzz + D_xxxyyz*M_xxyyz + D_xxxyyzz &
      *M_xxyyzz + D_xxxyyzzz*M_xxyyzzz + D_xxxyyzzzz*M_xxyyzzzz + &
      D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + &
      D_xxxyzzzz*M_xxyzzzz + D_xxxyzzzzz*M_xxyzzzzz + D_xxxz*M_xxz + &
      D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxxzzzz*M_xxzzzz + &
      D_xxxzzzzz*M_xxzzzzz + D_xxxzzzzzz*M_xxzzzzzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyyy* &
      M_xyyyyy + D_xxyyyyyy*M_xyyyyyy + D_xxyyyyyyy*M_xyyyyyyy + &
      D_xxyyyyyyz*M_xyyyyyyz + D_xxyyyyyz*M_xyyyyyz + D_xxyyyyyzz* &
      M_xyyyyyzz + D_xxyyyyz*M_xyyyyz + D_xxyyyyzz*M_xyyyyzz + &
      D_xxyyyyzzz*M_xyyyyzzz + D_xxyyyz*M_xyyyz + D_xxyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyyzzz + D_xxyyyzzzz*M_xyyyzzzz + D_xxyyz*M_xyyz + &
      D_xxyyzz*M_xyyzz + D_xxyyzzz*M_xyyzzz + D_xxyyzzzz*M_xyyzzzz + &
      D_xxyyzzzzz*M_xyyzzzzz + D_xxyz*M_xyz + D_xxyzz*M_xyzz + D_xxyzzz &
      *M_xyzzz + D_xxyzzzz*M_xyzzzz + D_xxyzzzzz*M_xyzzzzz + &
      D_xxyzzzzzz*M_xyzzzzzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz* &
      M_xzzz + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xxzzzzzz* &
      M_xzzzzzz + D_xxzzzzzzz*M_xzzzzzzz + D_xy*M_y + D_xyy*M_yy + &
      D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + D_xyyyyyy* &
      M_yyyyyy + D_xyyyyyyy*M_yyyyyyy + D_xyyyyyyyy*M_yyyyyyyy + &
      D_xyyyyyyyz*M_yyyyyyyz + D_xyyyyyyz*M_yyyyyyz + D_xyyyyyyzz* &
      M_yyyyyyzz + D_xyyyyyz*M_yyyyyz + D_xyyyyyzz*M_yyyyyzz + &
      D_xyyyyyzzz*M_yyyyyzzz + D_xyyyyz*M_yyyyz + D_xyyyyzz*M_yyyyzz + &
      D_xyyyyzzz*M_yyyyzzz + D_xyyyyzzzz*M_yyyyzzzz + D_xyyyz*M_yyyz + &
      D_xyyyzz*M_yyyzz + D_xyyyzzz*M_yyyzzz + D_xyyyzzzz*M_yyyzzzz + &
      D_xyyyzzzzz*M_yyyzzzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz &
      *M_yyzzz + D_xyyzzzz*M_yyzzzz + D_xyyzzzzz*M_yyzzzzz + &
      D_xyyzzzzzz*M_yyzzzzzz + D_xyz*M_yz + D_xyzz*M_yzz + D_xyzzz* &
      M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + D_xyzzzzzz* &
      M_yzzzzzz + D_xyzzzzzzz*M_yzzzzzzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + D_xzzzzzz* &
      M_zzzzzz + D_xzzzzzzz*M_zzzzzzz + D_xzzzzzzzz*M_zzzzzzzz
    L_xz        = D_xxxxxxxxz*M_xxxxxxx + D_xxxxxxxyz*M_xxxxxxy + D_xxxxxxxz*M_xxxxxx + &
      D_xxxxxxxzz*M_xxxxxxz + D_xxxxxxyyz*M_xxxxxyy + D_xxxxxxyz* &
      M_xxxxxy + D_xxxxxxyzz*M_xxxxxyz + D_xxxxxxz*M_xxxxx + D_xxxxxxzz &
      *M_xxxxxz + D_xxxxxxzzz*M_xxxxxzz + D_xxxxxyyyz*M_xxxxyyy + &
      D_xxxxxyyz*M_xxxxyy + D_xxxxxyyzz*M_xxxxyyz + D_xxxxxyz*M_xxxxy + &
      D_xxxxxyzz*M_xxxxyz + D_xxxxxyzzz*M_xxxxyzz + D_xxxxxz*M_xxxx + &
      D_xxxxxzz*M_xxxxz + D_xxxxxzzz*M_xxxxzz + D_xxxxxzzzz*M_xxxxzzz + &
      D_xxxxyyyyz*M_xxxyyyy + D_xxxxyyyz*M_xxxyyy + D_xxxxyyyzz* &
      M_xxxyyyz + D_xxxxyyz*M_xxxyy + D_xxxxyyzz*M_xxxyyz + D_xxxxyyzzz &
      *M_xxxyyzz + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz + D_xxxxyzzz* &
      M_xxxyzz + D_xxxxyzzzz*M_xxxyzzz + D_xxxxz*M_xxx + D_xxxxzz* &
      M_xxxz + D_xxxxzzz*M_xxxzz + D_xxxxzzzz*M_xxxzzz + D_xxxxzzzzz* &
      M_xxxzzzz + D_xxxyyyyyz*M_xxyyyyy + D_xxxyyyyz*M_xxyyyy + &
      D_xxxyyyyzz*M_xxyyyyz + D_xxxyyyz*M_xxyyy + D_xxxyyyzz*M_xxyyyz + &
      D_xxxyyyzzz*M_xxyyyzz + D_xxxyyz*M_xxyy + D_xxxyyzz*M_xxyyz + &
      D_xxxyyzzz*M_xxyyzz + D_xxxyyzzzz*M_xxyyzzz + D_xxxyz*M_xxy + &
      D_xxxyzz*M_xxyz + D_xxxyzzz*M_xxyzz + D_xxxyzzzz*M_xxyzzz + &
      D_xxxyzzzzz*M_xxyzzzz + D_xxxz*M_xx + D_xxxzz*M_xxz + D_xxxzzz* &
      M_xxzz + D_xxxzzzz*M_xxzzz + D_xxxzzzzz*M_xxzzzz + D_xxxzzzzzz* &
      M_xxzzzzz + D_xxyyyyyyz*M_xyyyyyy + D_xxyyyyyz*M_xyyyyy + &
      D_xxyyyyyzz*M_xyyyyyz + D_xxyyyyz*M_xyyyy + D_xxyyyyzz*M_xyyyyz + &
      D_xxyyyyzzz*M_xyyyyzz + D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + &
      D_xxyyyzzz*M_xyyyzz + D_xxyyyzzzz*M_xyyyzzz + D_xxyyz*M_xyy + &
      D_xxyyzz*M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyyzzzz*M_xyyzzz + &
      D_xxyyzzzzz*M_xyyzzzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz* &
      M_xyzz + D_xxyzzzz*M_xyzzz + D_xxyzzzzz*M_xyzzzz + D_xxyzzzzzz* &
      M_xyzzzzz + D_xxz*M_x + D_xxzz*M_xz + D_xxzzz*M_xzz + D_xxzzzz* &
      M_xzzz + D_xxzzzzz*M_xzzzz + D_xxzzzzzz*M_xzzzzz + D_xxzzzzzzz* &
      M_xzzzzzz + D_xyyyyyyyz*M_yyyyyyy + D_xyyyyyyz*M_yyyyyy + &
      D_xyyyyyyzz*M_yyyyyyz + D_xyyyyyz*M_yyyyy + D_xyyyyyzz*M_yyyyyz + &
      D_xyyyyyzzz*M_yyyyyzz + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + &
      D_xyyyyzzz*M_yyyyzz + D_xyyyyzzzz*M_yyyyzzz + D_xyyyz*M_yyy + &
      D_xyyyzz*M_yyyz + D_xyyyzzz*M_yyyzz + D_xyyyzzzz*M_yyyzzz + &
      D_xyyyzzzzz*M_yyyzzzz + D_xyyz*M_yy + D_xyyzz*M_yyz + D_xyyzzz* &
      M_yyzz + D_xyyzzzz*M_yyzzz + D_xyyzzzzz*M_yyzzzz + D_xyyzzzzzz* &
      M_yyzzzzz + D_xyz*M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xyzzzz* &
      M_yzzz + D_xyzzzzz*M_yzzzz + D_xyzzzzzz*M_yzzzzz + D_xyzzzzzzz* &
      M_yzzzzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz*M_zz + D_xzzzz*M_zzz + &
      D_xzzzzz*M_zzzz + D_xzzzzzz*M_zzzzz + D_xzzzzzzz*M_zzzzzz + &
      D_xzzzzzzzz*M_zzzzzzz
    D_yyyyyyyyy = v151*(v134 + 4620.0d0*v120 - 18018.0d0*v126 - 12155.0d0*v130 + 25740.0d0 &
      *v131)
    L_yyyyyyyyy = D_yyyyyyyyy*M_0
    D_yyyyyyyyz = v138*v154
    L_yyyyyyyy  = D_xyyyyyyyy*M_x + D_yyyyyyyy*M_0 + D_yyyyyyyyy*M_y + D_yyyyyyyyz*M_z
    L_yyyyyyyyz = D_yyyyyyyyz*M_0
    D_yyyyyyyzz = -(D_xxyyyyyyy + D_yyyyyyyyy)
    L_yyyyyyy   = D_xxyyyyyyy*M_xx + D_xyyyyyyy*M_x + D_xyyyyyyyy*M_xy + D_xyyyyyyyz*M_xz &
      + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyyy*M_yy + D_yyyyyyyyz &
      *M_yz + D_yyyyyyyz*M_z + D_yyyyyyyzz*M_zz
    L_yyyyyyyz  = D_xyyyyyyyz*M_x + D_yyyyyyyyz*M_y + D_yyyyyyyz*M_0 + D_yyyyyyyzz*M_z
    D_yyyyyyzzz = -(D_xxyyyyyyz + D_yyyyyyyyz)
    L_yyyyyy    = D_xxxyyyyyy*M_xxx + D_xxyyyyyy*M_xx + D_xxyyyyyyy*M_xxy + D_xxyyyyyyz* &
      M_xxz + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyyy*M_xyy + &
      D_xyyyyyyyz*M_xyz + D_xyyyyyyz*M_xz + D_xyyyyyyzz*M_xzz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*M_yy + D_yyyyyyyyy* &
      M_yyy + D_yyyyyyyyz*M_yyz + D_yyyyyyyz*M_yz + D_yyyyyyyzz*M_yzz + &
      D_yyyyyyz*M_z + D_yyyyyyzz*M_zz + D_yyyyyyzzz*M_zzz
    L_yyyyyyz   = D_xxyyyyyyz*M_xx + D_xyyyyyyyz*M_xy + D_xyyyyyyz*M_x + D_xyyyyyyzz*M_xz &
      + D_yyyyyyyyz*M_yy + D_yyyyyyyz*M_y + D_yyyyyyyzz*M_yz + &
      D_yyyyyyz*M_0 + D_yyyyyyzz*M_z + D_yyyyyyzzz*M_zz
    D_yyyyyzzzz = -(D_xxyyyyyzz + D_yyyyyyyzz)
    L_yyyyy     = D_xxxxyyyyy*M_xxxx + D_xxxyyyyy*M_xxx + D_xxxyyyyyy*M_xxxy + D_xxxyyyyyz &
      *M_xxxz + D_xxyyyyy*M_xx + D_xxyyyyyy*M_xxy + D_xxyyyyyyy*M_xxyy &
      + D_xxyyyyyyz*M_xxyz + D_xxyyyyyz*M_xxz + D_xxyyyyyzz*M_xxzz + &
      D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyy*M_xyy + D_xyyyyyyyy* &
      M_xyyy + D_xyyyyyyyz*M_xyyz + D_xyyyyyyz*M_xyz + D_xyyyyyyzz* &
      M_xyzz + D_xyyyyyz*M_xz + D_xyyyyyzz*M_xzz + D_xyyyyyzzz*M_xzzz + &
      D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyyy*M_yyy + &
      D_yyyyyyyyy*M_yyyy + D_yyyyyyyyz*M_yyyz + D_yyyyyyyz*M_yyz + &
      D_yyyyyyyzz*M_yyzz + D_yyyyyyz*M_yz + D_yyyyyyzz*M_yzz + &
      D_yyyyyyzzz*M_yzzz + D_yyyyyz*M_z + D_yyyyyzz*M_zz + D_yyyyyzzz* &
      M_zzz + D_yyyyyzzzz*M_zzzz
    L_yyyyyz    = D_xxxyyyyyz*M_xxx + D_xxyyyyyyz*M_xxy + D_xxyyyyyz*M_xx + D_xxyyyyyzz* &
      M_xxz + D_xyyyyyyyz*M_xyy + D_xyyyyyyz*M_xy + D_xyyyyyyzz*M_xyz + &
      D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + D_xyyyyyzzz*M_xzz + D_yyyyyyyyz &
      *M_yyy + D_yyyyyyyz*M_yy + D_yyyyyyyzz*M_yyz + D_yyyyyyz*M_y + &
      D_yyyyyyzz*M_yz + D_yyyyyyzzz*M_yzz + D_yyyyyz*M_0 + D_yyyyyzz* &
      M_z + D_yyyyyzzz*M_zz + D_yyyyyzzzz*M_zzz
    D_yyyyzzzzz = -(D_xxyyyyzzz + D_yyyyyyzzz)
    L_yyyy      = D_xxxxxyyyy*M_xxxxx + D_xxxxyyyy*M_xxxx + D_xxxxyyyyy*M_xxxxy + &
      D_xxxxyyyyz*M_xxxxz + D_xxxyyyy*M_xxx + D_xxxyyyyy*M_xxxy + &
      D_xxxyyyyyy*M_xxxyy + D_xxxyyyyyz*M_xxxyz + D_xxxyyyyz*M_xxxz + &
      D_xxxyyyyzz*M_xxxzz + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + &
      D_xxyyyyyy*M_xxyy + D_xxyyyyyyy*M_xxyyy + D_xxyyyyyyz*M_xxyyz + &
      D_xxyyyyyz*M_xxyz + D_xxyyyyyzz*M_xxyzz + D_xxyyyyz*M_xxz + &
      D_xxyyyyzz*M_xxzz + D_xxyyyyzzz*M_xxzzz + D_xyyyy*M_x + D_xyyyyy* &
      M_xy + D_xyyyyyy*M_xyy + D_xyyyyyyy*M_xyyy + D_xyyyyyyyy*M_xyyyy &
      + D_xyyyyyyyz*M_xyyyz + D_xyyyyyyz*M_xyyz + D_xyyyyyyzz*M_xyyzz + &
      D_xyyyyyz*M_xyz + D_xyyyyyzz*M_xyzz + D_xyyyyyzzz*M_xyzzz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_xyyyyzzz*M_xzzz + D_xyyyyzzzz &
      *M_xzzzz + D_yyyy*M_0 + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyyy* &
      M_yyy + D_yyyyyyyy*M_yyyy + D_yyyyyyyyy*M_yyyyy + D_yyyyyyyyz* &
      M_yyyyz + D_yyyyyyyz*M_yyyz + D_yyyyyyyzz*M_yyyzz + D_yyyyyyz* &
      M_yyz + D_yyyyyyzz*M_yyzz + D_yyyyyyzzz*M_yyzzz + D_yyyyyz*M_yz + &
      D_yyyyyzz*M_yzz + D_yyyyyzzz*M_yzzz + D_yyyyyzzzz*M_yzzzz + &
      D_yyyyz*M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz + D_yyyyzzzz*M_zzzz &
      + D_yyyyzzzzz*M_zzzzz
    L_yyyyz     = D_xxxxyyyyz*M_xxxx + D_xxxyyyyyz*M_xxxy + D_xxxyyyyz*M_xxx + D_xxxyyyyzz &
      *M_xxxz + D_xxyyyyyyz*M_xxyy + D_xxyyyyyz*M_xxy + D_xxyyyyyzz* &
      M_xxyz + D_xxyyyyz*M_xx + D_xxyyyyzz*M_xxz + D_xxyyyyzzz*M_xxzz + &
      D_xyyyyyyyz*M_xyyy + D_xyyyyyyz*M_xyy + D_xyyyyyyzz*M_xyyz + &
      D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyyzzz*M_xyzz + D_xyyyyz &
      *M_x + D_xyyyyzz*M_xz + D_xyyyyzzz*M_xzz + D_xyyyyzzzz*M_xzzz + &
      D_yyyyyyyyz*M_yyyy + D_yyyyyyyz*M_yyy + D_yyyyyyyzz*M_yyyz + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyyzzz*M_yyzz + D_yyyyyz &
      *M_y + D_yyyyyzz*M_yz + D_yyyyyzzz*M_yzz + D_yyyyyzzzz*M_yzzz + &
      D_yyyyz*M_0 + D_yyyyzz*M_z + D_yyyyzzz*M_zz + D_yyyyzzzz*M_zzz + &
      D_yyyyzzzzz*M_zzzz
    D_yyyzzzzzz = -(D_xxyyyzzzz + D_yyyyyzzzz)
    L_yyy       = D_xxxxxxyyy*M_xxxxxx + D_xxxxxyyy*M_xxxxx + D_xxxxxyyyy*M_xxxxxy + &
      D_xxxxxyyyz*M_xxxxxz + D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + &
      D_xxxxyyyyy*M_xxxxyy + D_xxxxyyyyz*M_xxxxyz + D_xxxxyyyz*M_xxxxz &
      + D_xxxxyyyzz*M_xxxxzz + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + &
      D_xxxyyyyy*M_xxxyy + D_xxxyyyyyy*M_xxxyyy + D_xxxyyyyyz*M_xxxyyz &
      + D_xxxyyyyz*M_xxxyz + D_xxxyyyyzz*M_xxxyzz + D_xxxyyyz*M_xxxz + &
      D_xxxyyyzz*M_xxxzz + D_xxxyyyzzz*M_xxxzzz + D_xxyyy*M_xx + &
      D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyyy*M_xxyyy + &
      D_xxyyyyyyy*M_xxyyyy + D_xxyyyyyyz*M_xxyyyz + D_xxyyyyyz*M_xxyyz &
      + D_xxyyyyyzz*M_xxyyzz + D_xxyyyyz*M_xxyz + D_xxyyyyzz*M_xxyzz + &
      D_xxyyyyzzz*M_xxyzzz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + &
      D_xxyyyzzz*M_xxzzz + D_xxyyyzzzz*M_xxzzzz + D_xyyy*M_x + D_xyyyy* &
      M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + D_xyyyyyyy*M_xyyyy + &
      D_xyyyyyyyy*M_xyyyyy + D_xyyyyyyyz*M_xyyyyz + D_xyyyyyyz*M_xyyyz &
      + D_xyyyyyyzz*M_xyyyzz + D_xyyyyyz*M_xyyz + D_xyyyyyzz*M_xyyzz + &
      D_xyyyyyzzz*M_xyyzzz + D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + &
      D_xyyyyzzz*M_xyzzz + D_xyyyyzzzz*M_xyzzzz + D_xyyyz*M_xz + &
      D_xyyyzz*M_xzz + D_xyyyzzz*M_xzzz + D_xyyyzzzz*M_xzzzz + &
      D_xyyyzzzzz*M_xzzzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyyy*M_yyyyy + &
      D_yyyyyyyyy*M_yyyyyy + D_yyyyyyyyz*M_yyyyyz + D_yyyyyyyz*M_yyyyz &
      + D_yyyyyyyzz*M_yyyyzz + D_yyyyyyz*M_yyyz + D_yyyyyyzz*M_yyyzz + &
      D_yyyyyyzzz*M_yyyzzz + D_yyyyyz*M_yyz + D_yyyyyzz*M_yyzz + &
      D_yyyyyzzz*M_yyzzz + D_yyyyyzzzz*M_yyzzzz + D_yyyyz*M_yz + &
      D_yyyyzz*M_yzz + D_yyyyzzz*M_yzzz + D_yyyyzzzz*M_yzzzz + &
      D_yyyyzzzzz*M_yzzzzz + D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz &
      + D_yyyzzzz*M_zzzz + D_yyyzzzzz*M_zzzzz + D_yyyzzzzzz*M_zzzzzz
    L_yyyz      = D_xxxxxyyyz*M_xxxxx + D_xxxxyyyyz*M_xxxxy + D_xxxxyyyz*M_xxxx + &
      D_xxxxyyyzz*M_xxxxz + D_xxxyyyyyz*M_xxxyy + D_xxxyyyyz*M_xxxy + &
      D_xxxyyyyzz*M_xxxyz + D_xxxyyyz*M_xxx + D_xxxyyyzz*M_xxxz + &
      D_xxxyyyzzz*M_xxxzz + D_xxyyyyyyz*M_xxyyy + D_xxyyyyyz*M_xxyy + &
      D_xxyyyyyzz*M_xxyyz + D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz + &
      D_xxyyyyzzz*M_xxyzz + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + &
      D_xxyyyzzz*M_xxzz + D_xxyyyzzzz*M_xxzzz + D_xyyyyyyyz*M_xyyyy + &
      D_xyyyyyyz*M_xyyy + D_xyyyyyyzz*M_xyyyz + D_xyyyyyz*M_xyy + &
      D_xyyyyyzz*M_xyyz + D_xyyyyyzzz*M_xyyzz + D_xyyyyz*M_xy + &
      D_xyyyyzz*M_xyz + D_xyyyyzzz*M_xyzz + D_xyyyyzzzz*M_xyzzz + &
      D_xyyyz*M_x + D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_xyyyzzzz*M_xzzz &
      + D_xyyyzzzzz*M_xzzzz + D_yyyyyyyyz*M_yyyyy + D_yyyyyyyz*M_yyyy + &
      D_yyyyyyyzz*M_yyyyz + D_yyyyyyz*M_yyy + D_yyyyyyzz*M_yyyz + &
      D_yyyyyyzzz*M_yyyzz + D_yyyyyz*M_yy + D_yyyyyzz*M_yyz + &
      D_yyyyyzzz*M_yyzz + D_yyyyyzzzz*M_yyzzz + D_yyyyz*M_y + D_yyyyzz* &
      M_yz + D_yyyyzzz*M_yzz + D_yyyyzzzz*M_yzzz + D_yyyyzzzzz*M_yzzzz &
      + D_yyyz*M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz + &
      D_yyyzzzzz*M_zzzz + D_yyyzzzzzz*M_zzzzz
    D_yyzzzzzzz = -(D_xxyyzzzzz + D_yyyyzzzzz)
    L_yy        = D_xxxxxxxyy*M_xxxxxxx + D_xxxxxxyy*M_xxxxxx + D_xxxxxxyyy*M_xxxxxxy + &
      D_xxxxxxyyz*M_xxxxxxz + D_xxxxxyy*M_xxxxx + D_xxxxxyyy*M_xxxxxy + &
      D_xxxxxyyyy*M_xxxxxyy + D_xxxxxyyyz*M_xxxxxyz + D_xxxxxyyz* &
      M_xxxxxz + D_xxxxxyyzz*M_xxxxxzz + D_xxxxyy*M_xxxx + D_xxxxyyy* &
      M_xxxxy + D_xxxxyyyy*M_xxxxyy + D_xxxxyyyyy*M_xxxxyyy + &
      D_xxxxyyyyz*M_xxxxyyz + D_xxxxyyyz*M_xxxxyz + D_xxxxyyyzz* &
      M_xxxxyzz + D_xxxxyyz*M_xxxxz + D_xxxxyyzz*M_xxxxzz + D_xxxxyyzzz &
      *M_xxxxzzz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy*M_xxxyy &
      + D_xxxyyyyy*M_xxxyyy + D_xxxyyyyyy*M_xxxyyyy + D_xxxyyyyyz* &
      M_xxxyyyz + D_xxxyyyyz*M_xxxyyz + D_xxxyyyyzz*M_xxxyyzz + &
      D_xxxyyyz*M_xxxyz + D_xxxyyyzz*M_xxxyzz + D_xxxyyyzzz*M_xxxyzzz + &
      D_xxxyyz*M_xxxz + D_xxxyyzz*M_xxxzz + D_xxxyyzzz*M_xxxzzz + &
      D_xxxyyzzzz*M_xxxzzzz + D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyy* &
      M_xxyy + D_xxyyyyy*M_xxyyy + D_xxyyyyyy*M_xxyyyy + D_xxyyyyyyy* &
      M_xxyyyyy + D_xxyyyyyyz*M_xxyyyyz + D_xxyyyyyz*M_xxyyyz + &
      D_xxyyyyyzz*M_xxyyyzz + D_xxyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyyzz + &
      D_xxyyyyzzz*M_xxyyzzz + D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + &
      D_xxyyyzzz*M_xxyzzz + D_xxyyyzzzz*M_xxyzzzz + D_xxyyz*M_xxz + &
      D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xxyyzzzz*M_xxzzzz + &
      D_xxyyzzzzz*M_xxzzzzz + D_xyy*M_x + D_xyyy*M_xy + D_xyyyy*M_xyy + &
      D_xyyyyy*M_xyyy + D_xyyyyyy*M_xyyyy + D_xyyyyyyy*M_xyyyyy + &
      D_xyyyyyyyy*M_xyyyyyy + D_xyyyyyyyz*M_xyyyyyz + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyyyyzz*M_xyyyyzz + D_xyyyyyz*M_xyyyz + D_xyyyyyzz &
      *M_xyyyzz + D_xyyyyyzzz*M_xyyyzzz + D_xyyyyz*M_xyyz + D_xyyyyzz* &
      M_xyyzz + D_xyyyyzzz*M_xyyzzz + D_xyyyyzzzz*M_xyyzzzz + D_xyyyz* &
      M_xyz + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyyzzzz*M_xyzzzz &
      + D_xyyyzzzzz*M_xyzzzzz + D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz* &
      M_xzzz + D_xyyzzzz*M_xzzzz + D_xyyzzzzz*M_xzzzzz + D_xyyzzzzzz* &
      M_xzzzzzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + &
      D_yyyyyy*M_yyyy + D_yyyyyyy*M_yyyyy + D_yyyyyyyy*M_yyyyyy + &
      D_yyyyyyyyy*M_yyyyyyy + D_yyyyyyyyz*M_yyyyyyz + D_yyyyyyyz* &
      M_yyyyyz + D_yyyyyyyzz*M_yyyyyzz + D_yyyyyyz*M_yyyyz + D_yyyyyyzz &
      *M_yyyyzz + D_yyyyyyzzz*M_yyyyzzz + D_yyyyyz*M_yyyz + D_yyyyyzz* &
      M_yyyzz + D_yyyyyzzz*M_yyyzzz + D_yyyyyzzzz*M_yyyzzzz + D_yyyyz* &
      M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz*M_yyzzz + D_yyyyzzzz*M_yyzzzz &
      + D_yyyyzzzzz*M_yyzzzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz* &
      M_yzzz + D_yyyzzzz*M_yzzzz + D_yyyzzzzz*M_yzzzzz + D_yyyzzzzzz* &
      M_yzzzzzz + D_yyz*M_z + D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz* &
      M_zzzz + D_yyzzzzz*M_zzzzz + D_yyzzzzzz*M_zzzzzz + D_yyzzzzzzz* &
      M_zzzzzzz
    L_yyz       = D_xxxxxxyyz*M_xxxxxx + D_xxxxxyyyz*M_xxxxxy + D_xxxxxyyz*M_xxxxx + &
      D_xxxxxyyzz*M_xxxxxz + D_xxxxyyyyz*M_xxxxyy + D_xxxxyyyz*M_xxxxy &
      + D_xxxxyyyzz*M_xxxxyz + D_xxxxyyz*M_xxxx + D_xxxxyyzz*M_xxxxz + &
      D_xxxxyyzzz*M_xxxxzz + D_xxxyyyyyz*M_xxxyyy + D_xxxyyyyz*M_xxxyy &
      + D_xxxyyyyzz*M_xxxyyz + D_xxxyyyz*M_xxxy + D_xxxyyyzz*M_xxxyz + &
      D_xxxyyyzzz*M_xxxyzz + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + &
      D_xxxyyzzz*M_xxxzz + D_xxxyyzzzz*M_xxxzzz + D_xxyyyyyyz*M_xxyyyy &
      + D_xxyyyyyz*M_xxyyy + D_xxyyyyyzz*M_xxyyyz + D_xxyyyyz*M_xxyy + &
      D_xxyyyyzz*M_xxyyz + D_xxyyyyzzz*M_xxyyzz + D_xxyyyz*M_xxy + &
      D_xxyyyzz*M_xxyz + D_xxyyyzzz*M_xxyzz + D_xxyyyzzzz*M_xxyzzz + &
      D_xxyyz*M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xxyyzzzz* &
      M_xxzzz + D_xxyyzzzzz*M_xxzzzz + D_xyyyyyyyz*M_xyyyyy + &
      D_xyyyyyyz*M_xyyyy + D_xyyyyyyzz*M_xyyyyz + D_xyyyyyz*M_xyyy + &
      D_xyyyyyzz*M_xyyyz + D_xyyyyyzzz*M_xyyyzz + D_xyyyyz*M_xyy + &
      D_xyyyyzz*M_xyyz + D_xyyyyzzz*M_xyyzz + D_xyyyyzzzz*M_xyyzzz + &
      D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyyzzz*M_xyzz + D_xyyyzzzz* &
      M_xyzzz + D_xyyyzzzzz*M_xyzzzz + D_xyyz*M_x + D_xyyzz*M_xz + &
      D_xyyzzz*M_xzz + D_xyyzzzz*M_xzzz + D_xyyzzzzz*M_xzzzz + &
      D_xyyzzzzzz*M_xzzzzz + D_yyyyyyyyz*M_yyyyyy + D_yyyyyyyz*M_yyyyy &
      + D_yyyyyyyzz*M_yyyyyz + D_yyyyyyz*M_yyyy + D_yyyyyyzz*M_yyyyz + &
      D_yyyyyyzzz*M_yyyyzz + D_yyyyyz*M_yyy + D_yyyyyzz*M_yyyz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyyzzzz*M_yyyzzz + D_yyyyz*M_yy + &
      D_yyyyzz*M_yyz + D_yyyyzzz*M_yyzz + D_yyyyzzzz*M_yyzzz + &
      D_yyyyzzzzz*M_yyzzzz + D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz &
      + D_yyyzzzz*M_yzzz + D_yyyzzzzz*M_yzzzz + D_yyyzzzzzz*M_yzzzzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + &
      D_yyzzzzz*M_zzzz + D_yyzzzzzz*M_zzzzz + D_yyzzzzzzz*M_zzzzzz
    D_yzzzzzzzz = -(D_xxyzzzzzz + D_yyyzzzzzz)
    L_y         = D_xxxxxxxxy*M_xxxxxxxx + D_xxxxxxxy*M_xxxxxxx + D_xxxxxxxyy*M_xxxxxxxy + &
      D_xxxxxxxyz*M_xxxxxxxz + D_xxxxxxy*M_xxxxxx + D_xxxxxxyy* &
      M_xxxxxxy + D_xxxxxxyyy*M_xxxxxxyy + D_xxxxxxyyz*M_xxxxxxyz + &
      D_xxxxxxyz*M_xxxxxxz + D_xxxxxxyzz*M_xxxxxxzz + D_xxxxxy*M_xxxxx &
      + D_xxxxxyy*M_xxxxxy + D_xxxxxyyy*M_xxxxxyy + D_xxxxxyyyy* &
      M_xxxxxyyy + D_xxxxxyyyz*M_xxxxxyyz + D_xxxxxyyz*M_xxxxxyz + &
      D_xxxxxyyzz*M_xxxxxyzz + D_xxxxxyz*M_xxxxxz + D_xxxxxyzz* &
      M_xxxxxzz + D_xxxxxyzzz*M_xxxxxzzz + D_xxxxy*M_xxxx + D_xxxxyy* &
      M_xxxxy + D_xxxxyyy*M_xxxxyy + D_xxxxyyyy*M_xxxxyyy + D_xxxxyyyyy &
      *M_xxxxyyyy + D_xxxxyyyyz*M_xxxxyyyz + D_xxxxyyyz*M_xxxxyyz + &
      D_xxxxyyyzz*M_xxxxyyzz + D_xxxxyyz*M_xxxxyz + D_xxxxyyzz* &
      M_xxxxyzz + D_xxxxyyzzz*M_xxxxyzzz + D_xxxxyz*M_xxxxz + D_xxxxyzz &
      *M_xxxxzz + D_xxxxyzzz*M_xxxxzzz + D_xxxxyzzzz*M_xxxxzzzz + &
      D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy* &
      M_xxxyyy + D_xxxyyyyy*M_xxxyyyy + D_xxxyyyyyy*M_xxxyyyyy + &
      D_xxxyyyyyz*M_xxxyyyyz + D_xxxyyyyz*M_xxxyyyz + D_xxxyyyyzz* &
      M_xxxyyyzz + D_xxxyyyz*M_xxxyyz + D_xxxyyyzz*M_xxxyyzz + &
      D_xxxyyyzzz*M_xxxyyzzz + D_xxxyyz*M_xxxyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyyzzz*M_xxxyzzz + D_xxxyyzzzz*M_xxxyzzzz + D_xxxyz*M_xxxz + &
      D_xxxyzz*M_xxxzz + D_xxxyzzz*M_xxxzzz + D_xxxyzzzz*M_xxxzzzz + &
      D_xxxyzzzzz*M_xxxzzzzz + D_xxy*M_xx + D_xxyy*M_xxy + D_xxyyy* &
      M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyyy*M_xxyyyy + D_xxyyyyyy* &
      M_xxyyyyy + D_xxyyyyyyy*M_xxyyyyyy + D_xxyyyyyyz*M_xxyyyyyz + &
      D_xxyyyyyz*M_xxyyyyz + D_xxyyyyyzz*M_xxyyyyzz + D_xxyyyyz* &
      M_xxyyyz + D_xxyyyyzz*M_xxyyyzz + D_xxyyyyzzz*M_xxyyyzzz + &
      D_xxyyyz*M_xxyyz + D_xxyyyzz*M_xxyyzz + D_xxyyyzzz*M_xxyyzzz + &
      D_xxyyyzzzz*M_xxyyzzzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyyzzzz*M_xxyzzzz + D_xxyyzzzzz* &
      M_xxyzzzzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz + D_xxyzzz*M_xxzzz + &
      D_xxyzzzz*M_xxzzzz + D_xxyzzzzz*M_xxzzzzz + D_xxyzzzzzz* &
      M_xxzzzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + D_xyyyy* &
      M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + D_xyyyyyyy* &
      M_xyyyyyy + D_xyyyyyyyy*M_xyyyyyyy + D_xyyyyyyyz*M_xyyyyyyz + &
      D_xyyyyyyz*M_xyyyyyz + D_xyyyyyyzz*M_xyyyyyzz + D_xyyyyyz* &
      M_xyyyyz + D_xyyyyyzz*M_xyyyyzz + D_xyyyyyzzz*M_xyyyyzzz + &
      D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + D_xyyyyzzz*M_xyyyzzz + &
      D_xyyyyzzzz*M_xyyyzzzz + D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + &
      D_xyyyzzz*M_xyyzzz + D_xyyyzzzz*M_xyyzzzz + D_xyyyzzzzz* &
      M_xyyzzzzz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + &
      D_xyyzzzz*M_xyzzzz + D_xyyzzzzz*M_xyzzzzz + D_xyyzzzzzz* &
      M_xyzzzzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + &
      D_xyzzzz*M_xzzzz + D_xyzzzzz*M_xzzzzz + D_xyzzzzzz*M_xzzzzzz + &
      D_xyzzzzzzz*M_xzzzzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy &
      *M_yyy + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + &
      D_yyyyyyyy*M_yyyyyyy + D_yyyyyyyyy*M_yyyyyyyy + D_yyyyyyyyz* &
      M_yyyyyyyz + D_yyyyyyyz*M_yyyyyyz + D_yyyyyyyzz*M_yyyyyyzz + &
      D_yyyyyyz*M_yyyyyz + D_yyyyyyzz*M_yyyyyzz + D_yyyyyyzzz* &
      M_yyyyyzzz + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + D_yyyyyzzz* &
      M_yyyyzzz + D_yyyyyzzzz*M_yyyyzzzz + D_yyyyz*M_yyyz + D_yyyyzz* &
      M_yyyzz + D_yyyyzzz*M_yyyzzz + D_yyyyzzzz*M_yyyzzzz + D_yyyyzzzzz &
      *M_yyyzzzzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyyzzz*M_yyzzz + &
      D_yyyzzzz*M_yyzzzz + D_yyyzzzzz*M_yyzzzzz + D_yyyzzzzzz* &
      M_yyzzzzzz + D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + &
      D_yyzzzz*M_yzzzz + D_yyzzzzz*M_yzzzzz + D_yyzzzzzz*M_yzzzzzz + &
      D_yyzzzzzzz*M_yzzzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + &
      D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz + &
      D_yzzzzzzz*M_zzzzzzz + D_yzzzzzzzz*M_zzzzzzzz
    L_yz        = D_xxxxxxxyz*M_xxxxxxx + D_xxxxxxyyz*M_xxxxxxy + D_xxxxxxyz*M_xxxxxx + &
      D_xxxxxxyzz*M_xxxxxxz + D_xxxxxyyyz*M_xxxxxyy + D_xxxxxyyz* &
      M_xxxxxy + D_xxxxxyyzz*M_xxxxxyz + D_xxxxxyz*M_xxxxx + D_xxxxxyzz &
      *M_xxxxxz + D_xxxxxyzzz*M_xxxxxzz + D_xxxxyyyyz*M_xxxxyyy + &
      D_xxxxyyyz*M_xxxxyy + D_xxxxyyyzz*M_xxxxyyz + D_xxxxyyz*M_xxxxy + &
      D_xxxxyyzz*M_xxxxyz + D_xxxxyyzzz*M_xxxxyzz + D_xxxxyz*M_xxxx + &
      D_xxxxyzz*M_xxxxz + D_xxxxyzzz*M_xxxxzz + D_xxxxyzzzz*M_xxxxzzz + &
      D_xxxyyyyyz*M_xxxyyyy + D_xxxyyyyz*M_xxxyyy + D_xxxyyyyzz* &
      M_xxxyyyz + D_xxxyyyz*M_xxxyy + D_xxxyyyzz*M_xxxyyz + D_xxxyyyzzz &
      *M_xxxyyzz + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz + D_xxxyyzzz* &
      M_xxxyzz + D_xxxyyzzzz*M_xxxyzzz + D_xxxyz*M_xxx + D_xxxyzz* &
      M_xxxz + D_xxxyzzz*M_xxxzz + D_xxxyzzzz*M_xxxzzz + D_xxxyzzzzz* &
      M_xxxzzzz + D_xxyyyyyyz*M_xxyyyyy + D_xxyyyyyz*M_xxyyyy + &
      D_xxyyyyyzz*M_xxyyyyz + D_xxyyyyz*M_xxyyy + D_xxyyyyzz*M_xxyyyz + &
      D_xxyyyyzzz*M_xxyyyzz + D_xxyyyz*M_xxyy + D_xxyyyzz*M_xxyyz + &
      D_xxyyyzzz*M_xxyyzz + D_xxyyyzzzz*M_xxyyzzz + D_xxyyz*M_xxy + &
      D_xxyyzz*M_xxyz + D_xxyyzzz*M_xxyzz + D_xxyyzzzz*M_xxyzzz + &
      D_xxyyzzzzz*M_xxyzzzz + D_xxyz*M_xx + D_xxyzz*M_xxz + D_xxyzzz* &
      M_xxzz + D_xxyzzzz*M_xxzzz + D_xxyzzzzz*M_xxzzzz + D_xxyzzzzzz* &
      M_xxzzzzz + D_xyyyyyyyz*M_xyyyyyy + D_xyyyyyyz*M_xyyyyy + &
      D_xyyyyyyzz*M_xyyyyyz + D_xyyyyyz*M_xyyyy + D_xyyyyyzz*M_xyyyyz + &
      D_xyyyyyzzz*M_xyyyyzz + D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + &
      D_xyyyyzzz*M_xyyyzz + D_xyyyyzzzz*M_xyyyzzz + D_xyyyz*M_xyy + &
      D_xyyyzz*M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyyzzzz*M_xyyzzz + &
      D_xyyyzzzzz*M_xyyzzzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz* &
      M_xyzz + D_xyyzzzz*M_xyzzz + D_xyyzzzzz*M_xyzzzz + D_xyyzzzzzz* &
      M_xyzzzzz + D_xyz*M_x + D_xyzz*M_xz + D_xyzzz*M_xzz + D_xyzzzz* &
      M_xzzz + D_xyzzzzz*M_xzzzz + D_xyzzzzzz*M_xzzzzz + D_xyzzzzzzz* &
      M_xzzzzzz + D_yyyyyyyyz*M_yyyyyyy + D_yyyyyyyz*M_yyyyyy + &
      D_yyyyyyyzz*M_yyyyyyz + D_yyyyyyz*M_yyyyy + D_yyyyyyzz*M_yyyyyz + &
      D_yyyyyyzzz*M_yyyyyzz + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + &
      D_yyyyyzzz*M_yyyyzz + D_yyyyyzzzz*M_yyyyzzz + D_yyyyz*M_yyy + &
      D_yyyyzz*M_yyyz + D_yyyyzzz*M_yyyzz + D_yyyyzzzz*M_yyyzzz + &
      D_yyyyzzzzz*M_yyyzzzz + D_yyyz*M_yy + D_yyyzz*M_yyz + D_yyyzzz* &
      M_yyzz + D_yyyzzzz*M_yyzzz + D_yyyzzzzz*M_yyzzzz + D_yyyzzzzzz* &
      M_yyzzzzz + D_yyz*M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yyzzzz* &
      M_yzzz + D_yyzzzzz*M_yzzzz + D_yyzzzzzz*M_yzzzzz + D_yyzzzzzzz* &
      M_yzzzzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz*M_zz + D_yzzzz*M_zzz + &
      D_yzzzzz*M_zzzz + D_yzzzzzz*M_zzzzz + D_yzzzzzzz*M_zzzzzz + &
      D_yzzzzzzzz*M_zzzzzzz
    D_zzzzzzzzz = -(D_xxzzzzzzz + D_yyzzzzzzz)
    L_0         = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxxx* &
      M_xxxxxxxx + D_xxxxxxxxx*M_xxxxxxxxx + D_xxxxxxxxy*M_xxxxxxxxy + &
      D_xxxxxxxxz*M_xxxxxxxxz + D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxyy* &
      M_xxxxxxxyy + D_xxxxxxxyz*M_xxxxxxxyz + D_xxxxxxxz*M_xxxxxxxz + &
      D_xxxxxxxzz*M_xxxxxxxzz + D_xxxxxxy*M_xxxxxxy + D_xxxxxxyy* &
      M_xxxxxxyy + D_xxxxxxyyy*M_xxxxxxyyy + D_xxxxxxyyz*M_xxxxxxyyz + &
      D_xxxxxxyz*M_xxxxxxyz + D_xxxxxxyzz*M_xxxxxxyzz + D_xxxxxxz* &
      M_xxxxxxz + D_xxxxxxzz*M_xxxxxxzz + D_xxxxxxzzz*M_xxxxxxzzz + &
      D_xxxxxy*M_xxxxxy + D_xxxxxyy*M_xxxxxyy + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxyyyy*M_xxxxxyyyy + D_xxxxxyyyz*M_xxxxxyyyz + D_xxxxxyyz* &
      M_xxxxxyyz + D_xxxxxyyzz*M_xxxxxyyzz + D_xxxxxyz*M_xxxxxyz + &
      D_xxxxxyzz*M_xxxxxyzz + D_xxxxxyzzz*M_xxxxxyzzz + D_xxxxxz* &
      M_xxxxxz + D_xxxxxzz*M_xxxxxzz + D_xxxxxzzz*M_xxxxxzzz + &
      D_xxxxxzzzz*M_xxxxxzzzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + &
      D_xxxxyyy*M_xxxxyyy + D_xxxxyyyy*M_xxxxyyyy + D_xxxxyyyyy* &
      M_xxxxyyyyy + D_xxxxyyyyz*M_xxxxyyyyz + D_xxxxyyyz*M_xxxxyyyz + &
      D_xxxxyyyzz*M_xxxxyyyzz + D_xxxxyyz*M_xxxxyyz + D_xxxxyyzz* &
      M_xxxxyyzz + D_xxxxyyzzz*M_xxxxyyzzz + D_xxxxyz*M_xxxxyz + &
      D_xxxxyzz*M_xxxxyzz + D_xxxxyzzz*M_xxxxyzzz + D_xxxxyzzzz* &
      M_xxxxyzzzz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxxzzz* &
      M_xxxxzzz + D_xxxxzzzz*M_xxxxzzzz + D_xxxxzzzzz*M_xxxxzzzzz + &
      D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyyy* &
      M_xxxyyyy + D_xxxyyyyy*M_xxxyyyyy + D_xxxyyyyyy*M_xxxyyyyyy + &
      D_xxxyyyyyz*M_xxxyyyyyz + D_xxxyyyyz*M_xxxyyyyz + D_xxxyyyyzz* &
      M_xxxyyyyzz + D_xxxyyyz*M_xxxyyyz + D_xxxyyyzz*M_xxxyyyzz + &
      D_xxxyyyzzz*M_xxxyyyzzz + D_xxxyyz*M_xxxyyz + D_xxxyyzz*M_xxxyyzz &
      + D_xxxyyzzz*M_xxxyyzzz + D_xxxyyzzzz*M_xxxyyzzzz + D_xxxyz* &
      M_xxxyz + D_xxxyzz*M_xxxyzz + D_xxxyzzz*M_xxxyzzz + D_xxxyzzzz* &
      M_xxxyzzzz + D_xxxyzzzzz*M_xxxyzzzzz + D_xxxz*M_xxxz + D_xxxzz* &
      M_xxxzz + D_xxxzzz*M_xxxzzz + D_xxxzzzz*M_xxxzzzz + D_xxxzzzzz* &
      M_xxxzzzzz + D_xxxzzzzzz*M_xxxzzzzzz + D_xxy*M_xxy + D_xxyy* &
      M_xxyy + D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy* &
      M_xxyyyyy + D_xxyyyyyy*M_xxyyyyyy + D_xxyyyyyyy*M_xxyyyyyyy + &
      D_xxyyyyyyz*M_xxyyyyyyz + D_xxyyyyyz*M_xxyyyyyz + D_xxyyyyyzz* &
      M_xxyyyyyzz + D_xxyyyyz*M_xxyyyyz + D_xxyyyyzz*M_xxyyyyzz + &
      D_xxyyyyzzz*M_xxyyyyzzz + D_xxyyyz*M_xxyyyz + D_xxyyyzz*M_xxyyyzz &
      + D_xxyyyzzz*M_xxyyyzzz + D_xxyyyzzzz*M_xxyyyzzzz + D_xxyyz* &
      M_xxyyz + D_xxyyzz*M_xxyyzz + D_xxyyzzz*M_xxyyzzz + D_xxyyzzzz* &
      M_xxyyzzzz + D_xxyyzzzzz*M_xxyyzzzzz + D_xxyz*M_xxyz + D_xxyzz* &
      M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz*M_xxyzzzz + D_xxyzzzzz* &
      M_xxyzzzzz + D_xxyzzzzzz*M_xxyzzzzzz + D_xxz*M_xxz + D_xxzz* &
      M_xxzz + D_xxzzz*M_xxzzz + D_xxzzzz*M_xxzzzz + D_xxzzzzz* &
      M_xxzzzzz + D_xxzzzzzz*M_xxzzzzzz + D_xxzzzzzzz*M_xxzzzzzzz + &
      D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + D_xyyyy*M_xyyyy + &
      D_xyyyyy*M_xyyyyy + D_xyyyyyy*M_xyyyyyy + D_xyyyyyyy*M_xyyyyyyy + &
      D_xyyyyyyyy*M_xyyyyyyyy + D_xyyyyyyyz*M_xyyyyyyyz + D_xyyyyyyz* &
      M_xyyyyyyz + D_xyyyyyyzz*M_xyyyyyyzz + D_xyyyyyz*M_xyyyyyz + &
      D_xyyyyyzz*M_xyyyyyzz + D_xyyyyyzzz*M_xyyyyyzzz + D_xyyyyz* &
      M_xyyyyz + D_xyyyyzz*M_xyyyyzz + D_xyyyyzzz*M_xyyyyzzz + &
      D_xyyyyzzzz*M_xyyyyzzzz + D_xyyyz*M_xyyyz + D_xyyyzz*M_xyyyzz + &
      D_xyyyzzz*M_xyyyzzz + D_xyyyzzzz*M_xyyyzzzz + D_xyyyzzzzz* &
      M_xyyyzzzzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz &
      + D_xyyzzzz*M_xyyzzzz + D_xyyzzzzz*M_xyyzzzzz + D_xyyzzzzzz* &
      M_xyyzzzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz + &
      D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + D_xyzzzzzz*M_xyzzzzzz + &
      D_xyzzzzzzz*M_xyzzzzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz &
      + D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_xzzzzzz*M_xzzzzzz + &
      D_xzzzzzzz*M_xzzzzzzz + D_xzzzzzzzz*M_xzzzzzzzz + D_y*M_y + D_yy* &
      M_yy + D_yyy*M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy* &
      M_yyyyyy + D_yyyyyyy*M_yyyyyyy + D_yyyyyyyy*M_yyyyyyyy + &
      D_yyyyyyyyy*M_yyyyyyyyy + D_yyyyyyyyz*M_yyyyyyyyz + D_yyyyyyyz* &
      M_yyyyyyyz + D_yyyyyyyzz*M_yyyyyyyzz + D_yyyyyyz*M_yyyyyyz + &
      D_yyyyyyzz*M_yyyyyyzz + D_yyyyyyzzz*M_yyyyyyzzz + D_yyyyyz* &
      M_yyyyyz + D_yyyyyzz*M_yyyyyzz + D_yyyyyzzz*M_yyyyyzzz + &
      D_yyyyyzzzz*M_yyyyyzzzz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + &
      D_yyyyzzz*M_yyyyzzz + D_yyyyzzzz*M_yyyyzzzz + D_yyyyzzzzz* &
      M_yyyyzzzzz + D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz &
      + D_yyyzzzz*M_yyyzzzz + D_yyyzzzzz*M_yyyzzzzz + D_yyyzzzzzz* &
      M_yyyzzzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + &
      D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + D_yyzzzzzz*M_yyzzzzzz + &
      D_yyzzzzzzz*M_yyzzzzzzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz &
      + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz + D_yzzzzzz*M_yzzzzzz + &
      D_yzzzzzzz*M_yzzzzzzz + D_yzzzzzzzz*M_yzzzzzzzz + D_z*M_z + D_zz* &
      M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz* &
      M_zzzzzz + D_zzzzzzz*M_zzzzzzz + D_zzzzzzzz*M_zzzzzzzz + &
      D_zzzzzzzzz*M_zzzzzzzzz
    L_z         = D_xxxxxxxxz*M_xxxxxxxx + D_xxxxxxxyz*M_xxxxxxxy + D_xxxxxxxz*M_xxxxxxx + &
      D_xxxxxxxzz*M_xxxxxxxz + D_xxxxxxyyz*M_xxxxxxyy + D_xxxxxxyz* &
      M_xxxxxxy + D_xxxxxxyzz*M_xxxxxxyz + D_xxxxxxz*M_xxxxxx + &
      D_xxxxxxzz*M_xxxxxxz + D_xxxxxxzzz*M_xxxxxxzz + D_xxxxxyyyz* &
      M_xxxxxyyy + D_xxxxxyyz*M_xxxxxyy + D_xxxxxyyzz*M_xxxxxyyz + &
      D_xxxxxyz*M_xxxxxy + D_xxxxxyzz*M_xxxxxyz + D_xxxxxyzzz* &
      M_xxxxxyzz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + D_xxxxxzzz* &
      M_xxxxxzz + D_xxxxxzzzz*M_xxxxxzzz + D_xxxxyyyyz*M_xxxxyyyy + &
      D_xxxxyyyz*M_xxxxyyy + D_xxxxyyyzz*M_xxxxyyyz + D_xxxxyyz* &
      M_xxxxyy + D_xxxxyyzz*M_xxxxyyz + D_xxxxyyzzz*M_xxxxyyzz + &
      D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + D_xxxxyzzz*M_xxxxyzz + &
      D_xxxxyzzzz*M_xxxxyzzz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + &
      D_xxxxzzz*M_xxxxzz + D_xxxxzzzz*M_xxxxzzz + D_xxxxzzzzz* &
      M_xxxxzzzz + D_xxxyyyyyz*M_xxxyyyyy + D_xxxyyyyz*M_xxxyyyy + &
      D_xxxyyyyzz*M_xxxyyyyz + D_xxxyyyz*M_xxxyyy + D_xxxyyyzz* &
      M_xxxyyyz + D_xxxyyyzzz*M_xxxyyyzz + D_xxxyyz*M_xxxyy + D_xxxyyzz &
      *M_xxxyyz + D_xxxyyzzz*M_xxxyyzz + D_xxxyyzzzz*M_xxxyyzzz + &
      D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + &
      D_xxxyzzzz*M_xxxyzzz + D_xxxyzzzzz*M_xxxyzzzz + D_xxxz*M_xxx + &
      D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz*M_xxxzzz + &
      D_xxxzzzzz*M_xxxzzzz + D_xxxzzzzzz*M_xxxzzzzz + D_xxyyyyyyz* &
      M_xxyyyyyy + D_xxyyyyyz*M_xxyyyyy + D_xxyyyyyzz*M_xxyyyyyz + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz + D_xxyyyyzzz* &
      M_xxyyyyzz + D_xxyyyz*M_xxyyy + D_xxyyyzz*M_xxyyyz + D_xxyyyzzz* &
      M_xxyyyzz + D_xxyyyzzzz*M_xxyyyzzz + D_xxyyz*M_xxyy + D_xxyyzz* &
      M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyyzzzz*M_xxyyzzz + D_xxyyzzzzz &
      *M_xxyyzzzz + D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + &
      D_xxyzzzz*M_xxyzzz + D_xxyzzzzz*M_xxyzzzz + D_xxyzzzzzz* &
      M_xxyzzzzz + D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + &
      D_xxzzzz*M_xxzzz + D_xxzzzzz*M_xxzzzz + D_xxzzzzzz*M_xxzzzzz + &
      D_xxzzzzzzz*M_xxzzzzzz + D_xyyyyyyyz*M_xyyyyyyy + D_xyyyyyyz* &
      M_xyyyyyy + D_xyyyyyyzz*M_xyyyyyyz + D_xyyyyyz*M_xyyyyy + &
      D_xyyyyyzz*M_xyyyyyz + D_xyyyyyzzz*M_xyyyyyzz + D_xyyyyz*M_xyyyy &
      + D_xyyyyzz*M_xyyyyz + D_xyyyyzzz*M_xyyyyzz + D_xyyyyzzzz* &
      M_xyyyyzzz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + D_xyyyzzz* &
      M_xyyyzz + D_xyyyzzzz*M_xyyyzzz + D_xyyyzzzzz*M_xyyyzzzz + D_xyyz &
      *M_xyy + D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + D_xyyzzzz*M_xyyzzz + &
      D_xyyzzzzz*M_xyyzzzz + D_xyyzzzzzz*M_xyyzzzzz + D_xyz*M_xy + &
      D_xyzz*M_xyz + D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + D_xyzzzzz* &
      M_xyzzzz + D_xyzzzzzz*M_xyzzzzz + D_xyzzzzzzz*M_xyzzzzzz + D_xz* &
      M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_xzzzzzz*M_xzzzzz + D_xzzzzzzz*M_xzzzzzz + D_xzzzzzzzz &
      *M_xzzzzzzz + D_yyyyyyyyz*M_yyyyyyyy + D_yyyyyyyz*M_yyyyyyy + &
      D_yyyyyyyzz*M_yyyyyyyz + D_yyyyyyz*M_yyyyyy + D_yyyyyyzz* &
      M_yyyyyyz + D_yyyyyyzzz*M_yyyyyyzz + D_yyyyyz*M_yyyyy + D_yyyyyzz &
      *M_yyyyyz + D_yyyyyzzz*M_yyyyyzz + D_yyyyyzzzz*M_yyyyyzzz + &
      D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + D_yyyyzzz*M_yyyyzz + &
      D_yyyyzzzz*M_yyyyzzz + D_yyyyzzzzz*M_yyyyzzzz + D_yyyz*M_yyy + &
      D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + D_yyyzzzz*M_yyyzzz + &
      D_yyyzzzzz*M_yyyzzzz + D_yyyzzzzzz*M_yyyzzzzz + D_yyz*M_yy + &
      D_yyzz*M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz* &
      M_yyzzzz + D_yyzzzzzz*M_yyzzzzz + D_yyzzzzzzz*M_yyzzzzzz + D_yz* &
      M_y + D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz* &
      M_yzzzz + D_yzzzzzz*M_yzzzzz + D_yzzzzzzz*M_yzzzzzz + D_yzzzzzzzz &
      *M_yzzzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + &
      D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz + &
      D_zzzzzzzz*M_zzzzzzz + D_zzzzzzzzz*M_zzzzzzzz
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  L_y                 
#undef  M_y                 
#undef  L_z                 
#undef  M_z                 
#undef  L_xx                
#undef  M_xx                
#undef  L_xy                
#undef  M_xy                
#undef  L_xz                
#undef  M_xz                
#undef  M_yy                
#undef  L_yy                
#undef  L_yz                
#undef  M_yz                
#undef  M_zz                
#undef  L_xxx               
#undef  M_xxx               
#undef  L_xxy               
#undef  L_xxz               
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xyy               
#undef  M_xyy               
#undef  L_xyz               
#undef  M_xyz               
#undef  L_yyy               
#undef  L_yyz               
#undef  M_xzz               
#undef  M_yyy               
#undef  L_xxxx              
#undef  M_yyz               
#undef  L_xxxy              
#undef  M_yzz               
#undef  L_xxxz              
#undef  L_xxyy              
#undef  M_zzz               
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
#undef  L_xxxxx             
#undef  L_xxxxy             
#undef  M_xyyy              
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
#undef  L_xyyyz             
#undef  M_yzzz              
#undef  L_yyyyy             
#undef  M_zzzz              
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  L_xxxxxx            
#undef  M_xxxxy             
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  L_xxxxxz            
#undef  M_xxxyy             
#undef  L_xxxxyy            
#undef  M_xxxyz             
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  L_xxxyyy            
#undef  M_xxyyy             
#undef  L_xxxyyz            
#undef  M_xxyyz             
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  M_xxzzz             
#undef  L_xxyyyz            
#undef  M_xyyyy             
#undef  L_xyyyyy            
#undef  M_xyyyz             
#undef  L_xyyyyz            
#undef  M_xyyzz             
#undef  L_yyyyyy            
#undef  L_yyyyyz            
#undef  M_xyzzz             
#undef  M_xzzzz             
#undef  L_xxxxxxx           
#undef  L_xxxxxxy           
#undef  M_yyyyy             
#undef  L_xxxxxxz           
#undef  M_yyyyz             
#undef  M_yyyzz             
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  M_yyzzz             
#undef  M_yzzzz             
#undef  L_xxxxyyy           
#undef  M_zzzzz             
#undef  L_xxxxyyz           
#undef  M_xxxxxx            
#undef  L_xxxyyyy           
#undef  L_xxxyyyz           
#undef  M_xxxxxy            
#undef  M_xxxxxz            
#undef  L_xxyyyyy           
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
#undef  L_xxxxxxxx          
#undef  M_xxxyzz            
#undef  M_xxxzzz            
#undef  L_xxxxxxxy          
#undef  L_xxxxxxxz          
#undef  M_xxyyyy            
#undef  L_xxxxxxyy          
#undef  M_xxyyyz            
#undef  M_xxyyzz            
#undef  L_xxxxxxyz          
#undef  M_xxyzzz            
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxzzzz            
#undef  L_xxxxyyyy          
#undef  M_xyyyyy            
#undef  L_xxxxyyyz          
#undef  M_xyyyyz            
#undef  M_xyyyzz            
#undef  L_xxxyyyyy          
#undef  M_xyyzzz            
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  M_xyzzzz            
#undef  M_xzzzzz            
#undef  L_xxyyyyyz          
#undef  M_yyyyyy            
#undef  L_xyyyyyyy          
#undef  M_yyyyyz            
#undef  L_xyyyyyyz          
#undef  L_yyyyyyyy          
#undef  M_yyyyzz            
#undef  L_yyyyyyyz          
#undef  M_yyyzzz            
#undef  L_xxxxxxxxx         
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  L_xxxxxxxxy         
#undef  L_xxxxxxxxz         
#undef  M_zzzzzz            
#undef  L_xxxxxxxyy         
#undef  M_xxxxxxx           
#undef  L_xxxxxxxyz         
#undef  M_xxxxxxy           
#undef  M_xxxxxxz           
#undef  L_xxxxxxyyy         
#undef  L_xxxxxxyyz         
#undef  M_xxxxxyy           
#undef  M_xxxxxyz           
#undef  L_xxxxxyyyy         
#undef  M_xxxxxzz           
#undef  L_xxxxxyyyz         
#undef  M_xxxxyyy           
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  L_xxxyyyyyy         
#undef  M_xxxxzzz           
#undef  L_xxxyyyyyz         
#undef  L_xxyyyyyyy         
#undef  M_xxxyyyy           
#undef  M_xxxyyyz           
#undef  L_xxyyyyyyz         
#undef  L_xyyyyyyyy         
#undef  M_xxxyyzz           
#undef  M_xxxyzzz           
#undef  L_xyyyyyyyz         
#undef  M_xxxzzzz           
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
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
#undef  M_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  M_xxxxxxzz          
#undef  M_xxxxxyyy          
#undef  M_xxxxxyyz          
#undef  M_xxxxxyzz          
#undef  M_xxxxxzzz          
#undef  M_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  M_xxxxyyzz          
#undef  M_xxxxyzzz          
#undef  M_xxxxzzzz          
#undef  M_xxxyyyyy          
#undef  M_xxxyyyyz          
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  M_xxxyzzzz          
#undef  M_xxxzzzzz          
#undef  M_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  M_xxyyyyzz          
#undef  M_xxyyyzzz          
#undef  M_xxyyzzzz          
#undef  M_xxyzzzzz          
#undef  M_xxzzzzzz          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  M_xyyyyyzz          
#undef  M_xyyyyzzz          
#undef  M_xyyyzzzz          
#undef  M_xyyzzzzz          
#undef  M_xyzzzzzz          
#undef  M_xzzzzzzz          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
#undef  M_yyyyyyzz          
#undef  M_yyyyyzzz          
#undef  M_yyyyzzzz          
#undef  M_yyyzzzzz          
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  M_zzzzzzzz          
#undef  M_xxxxxxxxx         
#undef  M_xxxxxxxxy         
#undef  M_xxxxxxxxz         
#undef  M_xxxxxxxyy         
#undef  M_xxxxxxxyz         
#undef  M_xxxxxxxzz         
#undef  M_xxxxxxyyy         
#undef  M_xxxxxxyyz         
#undef  M_xxxxxxyzz         
#undef  M_xxxxxxzzz         
#undef  M_xxxxxyyyy         
#undef  M_xxxxxyyyz         
#undef  M_xxxxxyyzz         
#undef  M_xxxxxyzzz         
#undef  M_xxxxxzzzz         
#undef  M_xxxxyyyyy         
#undef  M_xxxxyyyyz         
#undef  M_xxxxyyyzz         
#undef  M_xxxxyyzzz         
#undef  M_xxxxyzzzz         
#undef  M_xxxxzzzzz         
#undef  M_xxxyyyyyy         
#undef  M_xxxyyyyyz         
#undef  M_xxxyyyyzz         
#undef  M_xxxyyyzzz         
#undef  M_xxxyyzzzz         
#undef  M_xxxyzzzzz         
#undef  M_xxxzzzzzz         
#undef  M_xxyyyyyyy         
#undef  M_xxyyyyyyz         
#undef  M_xxyyyyyzz         
#undef  M_xxyyyyzzz         
#undef  M_xxyyyzzzz         
#undef  M_xxyyzzzzz         
#undef  M_xxyzzzzzz         
#undef  M_xxzzzzzzz         
#undef  M_xyyyyyyyy         
#undef  M_xyyyyyyyz         
#undef  M_xyyyyyyzz         
#undef  M_xyyyyyzzz         
#undef  M_xyyyyzzzz         
#undef  M_xyyyzzzzz         
#undef  M_xyyzzzzzz         
#undef  M_xyzzzzzzz         
#undef  M_xzzzzzzzz         
#undef  M_yyyyyyyyy         
#undef  M_yyyyyyyyz         
#undef  M_yyyyyyyzz         
#undef  M_yyyyyyzzz         
#undef  M_yyyyyzzzz         
#undef  M_yyyyzzzzz         
#undef  M_yyyzzzzzz         
#undef  M_yyzzzzzzz         
#undef  M_yzzzzzzzz         
#undef  M_zzzzzzzzz         
    end subroutine mom_es_M2L2
    
! OPS  608*ADD + 2*DIV + 819*MUL + 121*NEG + POW = 1551  (5081 before optimization)
subroutine mom_es_L2P2(L1,r1,Phi1, L2,r2,Phi2)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_PHI_END)    :: Phi1,Phi2
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,0:MOM_ES_PHI_END):: Phi
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v243, v244, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33,&
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
                L_yyzzzzz, L_yzzzzzz, L_zzzzzzz, L_xxxxxxzz, L_xxxxxyzz,&
                L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz, L_xxxxzzzz, L_xxxyyyzz,&
                L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz, L_xxyyyyzz, L_xxyyyzzz,&
                L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz, L_xyyyyyzz, L_xyyyyzzz,&
                L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz, L_xzzzzzzz, L_yyyyyyzz,&
                L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz,&
                L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz, L_xxxxxxzzz,&
                L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz, L_xxxxyyyzz,&
                L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz, L_xxxyyyyzz,&
                L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz, L_xxxzzzzzz,&
                L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz, L_xxyyzzzzz,&
                L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz, L_xyyyyyzzz,&
                L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz, L_xyzzzzzzz,&
                L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz, L_yyyyyzzzz,&
                L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz, L_yzzzzzzzz,&
                L_zzzzzzzzz
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
#define L_xxxxxxxx           L(1:2,64)
#define L_xxxxxxxy           L(1:2,65)
#define L_xxxxxxxz           L(1:2,66)
#define L_xxxxxxyy           L(1:2,67)
#define L_xxxxxxyz           L(1:2,68)
#define L_xxxxxyyy           L(1:2,69)
#define L_xxxxxyyz           L(1:2,70)
#define L_xxxxyyyy           L(1:2,71)
#define L_xxxxyyyz           L(1:2,72)
#define L_xxxyyyyy           L(1:2,73)
#define L_xxxyyyyz           L(1:2,74)
#define L_xxyyyyyy           L(1:2,75)
#define L_xxyyyyyz           L(1:2,76)
#define L_xyyyyyyy           L(1:2,77)
#define L_xyyyyyyz           L(1:2,78)
#define L_yyyyyyyy           L(1:2,79)
#define L_yyyyyyyz           L(1:2,80)
#define L_xxxxxxxxx          L(1:2,81)
#define L_xxxxxxxxy          L(1:2,82)
#define L_xxxxxxxxz          L(1:2,83)
#define L_xxxxxxxyy          L(1:2,84)
#define L_xxxxxxxyz          L(1:2,85)
#define L_xxxxxxyyy          L(1:2,86)
#define L_xxxxxxyyz          L(1:2,87)
#define L_xxxxxyyyy          L(1:2,88)
#define L_xxxxxyyyz          L(1:2,89)
#define L_xxxxyyyyy          L(1:2,90)
#define L_xxxxyyyyz          L(1:2,91)
#define L_xxxyyyyyy          L(1:2,92)
#define L_xxxyyyyyz          L(1:2,93)
#define L_xxyyyyyyy          L(1:2,94)
#define L_xxyyyyyyz          L(1:2,95)
#define L_xyyyyyyyy          L(1:2,96)
#define L_xyyyyyyyz          L(1:2,97)
#define L_yyyyyyyyy          L(1:2,98)
#define L_yyyyyyyyz          L(1:2,99)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0          = L_xxz*z
    v18         = L_xxyyyyyy + L_xxyyyyyyz*z
    v22         = L_xxxxxxxx + L_xxxxxxxxy*y + L_xxxxxxxxz*z
    v24         = 2.0d0*z
    v28         = 6.0d0*z
    v33         = 24.0d0*z
    v41         = 2.0d0*y
    v42         = L_xxxxxxxy + L_xxxxxxxyz*z
    v44         = 120.0d0*z
    v50         = 720.0d0*z
    v60         = L_xxxxxxyy + L_xxxxxxyyz*z
    v61         = 3.0d0*y
    v67         = L_xxxxxyyy + L_xxxxxyyyz*z
    v70         = 4.0d0*y
    v76         = L_xxxxyyyy + L_xxxxyyyyz*z
    v81         = 5.0d0*y
    v84         = 0.00138888888888889d0*x
    v86         = L_xxxyyyyy + L_xxxyyyyyz*z
    v93         = 6.0d0*y
    v96         = L_xyz*z
    v104        = L_xyyyyyyy + L_xyyyyyyyz*z
    v106        = L_xxxxxxxyy*y + v42
    v122        = L_xz*z
    v147        = 0.000198412698412698d0*x
    v190        = L_yyz*z
    v198        = L_yyyyyyyy + L_yyyyyyyyz*z
    v207        = 0.00138888888888889d0*y
    v209        = L_yz*z
    v223        = 0.000198412698412698d0*y
    L_zz        = -(L_xx + L_yy)
    L_xzz       = -(L_xxx + L_xyy)
    v149        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v225        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    L_xyzz      = -(L_xxxy + L_xyyy)
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    L_yyzzz     = -(L_xxyyz + L_yyyyz)
    L_yzzzz     = -(L_xxyzz + L_yyyzz)
    L_zzzzz     = -(L_xxzzz + L_yyzzz)
    L_xxxxzz    = -(L_xxxxxx + L_xxxxyy)
    L_xxxyzz    = -(L_xxxxxy + L_xxxyyy)
    L_xxxzzz    = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz    = -(L_xxxxyy + L_xxyyyy)
    L_xxyzzz    = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz    = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz    = -(L_xxxyyy + L_xyyyyy)
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    L_yyyzzz    = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz    = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz    = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz    = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz   = -(L_xxxxxxx + L_xxxxxyy)
    L_xxxxyzz   = -(L_xxxxxxy + L_xxxxyyy)
    L_xxxxzzz   = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz   = -(L_xxxxxyy + L_xxxyyyy)
    L_xxxyzzz   = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz   = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz   = -(L_xxxxyyy + L_xxyyyyy)
    L_xxyyzzz   = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz   = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz   = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz   = -(L_xxxyyyy + L_xyyyyyy)
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    L_yyyyzzz   = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz   = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz   = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz   = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz   = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz  = -(L_xxxxxxxx + L_xxxxxxyy)
    L_xxxxxyzz  = -(L_xxxxxxxy + L_xxxxxyyy)
    L_xxxxxzzz  = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz  = -(L_xxxxxxyy + L_xxxxyyyy)
    L_xxxxyzzz  = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz  = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz  = -(L_xxxxxyyy + L_xxxyyyyy)
    L_xxxyyzzz  = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz  = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz  = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz  = -(L_xxxxyyyy + L_xxyyyyyy)
    L_xxyyyzzz  = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz  = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz  = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz  = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz  = -(L_xxxyyyyy + L_xyyyyyyy)
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    L_yyyyyzzz  = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz  = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz  = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz  = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz  = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz  = -(L_xxzzzzzz + L_yyzzzzzz)
    L_xxxxxxxzz = -(L_xxxxxxxxx + L_xxxxxxxyy)
    v159        = L_xxxxxxxz + L_xxxxxxxyz*y + L_xxxxxxxzz*z
    L_xxxxxxyzz = -(L_xxxxxxxxy + L_xxxxxxyyy)
    v166        = L_xxxxxxyz + L_xxxxxxyzz*z
    L_xxxxxxzzz = -(L_xxxxxxxxz + L_xxxxxxyyz)
    L_xxxxxyyzz = -(L_xxxxxxxyy + L_xxxxxyyyy)
    v172        = L_xxxxxyyz + L_xxxxxyyzz*z
    L_xxxxxyzzz = -(L_xxxxxxxyz + L_xxxxxyyyz)
    L_xxxxxzzzz = -(L_xxxxxxxzz + L_xxxxxyyzz)
    L_xxxxyyyzz = -(L_xxxxxxyyy + L_xxxxyyyyy)
    v175        = L_xxxxyyyz + L_xxxxyyyzz*z
    L_xxxxyyzzz = -(L_xxxxxxyyz + L_xxxxyyyyz)
    L_xxxxyzzzz = -(L_xxxxxxyzz + L_xxxxyyyzz)
    L_xxxxzzzzz = -(L_xxxxxxzzz + L_xxxxyyzzz)
    L_xxxyyyyzz = -(L_xxxxxyyyy + L_xxxyyyyyy)
    v179        = L_xxxyyyyz + L_xxxyyyyzz*z
    L_xxxyyyzzz = -(L_xxxxxyyyz + L_xxxyyyyyz)
    L_xxxyyzzzz = -(L_xxxxxyyzz + L_xxxyyyyzz)
    L_xxxyzzzzz = -(L_xxxxxyzzz + L_xxxyyyzzz)
    L_xxxzzzzzz = -(L_xxxxxzzzz + L_xxxyyzzzz)
    L_xxyyyyyzz = -(L_xxxxyyyyy + L_xxyyyyyyy)
    v184        = L_xxyyyyyz + L_xxyyyyyzz*z
    L_xxyyyyzzz = -(L_xxxxyyyyz + L_xxyyyyyyz)
    L_xxyyyzzzz = -(L_xxxxyyyzz + L_xxyyyyyzz)
    L_xxyyzzzzz = -(L_xxxxyyzzz + L_xxyyyyzzz)
    L_xxyzzzzzz = -(L_xxxxyzzzz + L_xxyyyzzzz)
    L_xxzzzzzzz = -(L_xxxxzzzzz + L_xxyyzzzzz)
    L_xyyyyyyzz = -(L_xxxyyyyyy + L_xyyyyyyyy)
    v157        = L_xyyyyyyz + L_xyyyyyyzz*z
    L_xyyyyyzzz = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v232        = L_yyyyyyyz + L_yyyyyyyzz*z
    L_yyyyyyzzz = -(L_xxyyyyyyz + L_yyyyyyyyz)
    L_yyyyyzzzz = -(L_xxyyyyyzz + L_yyyyyyyzz)
    L_yyyyzzzzz = -(L_xxyyyyzzz + L_yyyyyyzzz)
    L_yyyzzzzzz = -(L_xxyyyzzzz + L_yyyyyzzzz)
    L_yyzzzzzzz = -(L_xxyyzzzzz + L_yyyyzzzzz)
    L_yzzzzzzzz = -(L_xxyzzzzzz + L_yyyzzzzzz)
    L_zzzzzzzzz = -(L_xxzzzzzzz + L_yyzzzzzzz)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v73         = a2
    v74         = 0.00416666666666667d0*v73
    v146        = 0.000694444444444444d0*v73
    a3          = a1*a2
    v64         = a3
    v65         = 0.00694444444444444d0*v64
    v145        = 0.00138888888888889d0*v64
    a4          = a2*a2
    v57         = a4
    v58         = 0.00694444444444444d0*v57
    v144        = 0.00173611111111111d0*v57
    a5          = a2*a3
    v38         = a5
    v39         = 0.00416666666666667d0*v38
    v143        = 0.00138888888888889d0*v38
    a6          = a3*a3
    v20         = a6
    v21         = 0.00138888888888889d0*v20
    v138        = 0.000694444444444444d0*v20
    a7          = a3*a4
    v1          = a7
    v2          = 0.000198412698412698d0*v1
    a8          = a4*a4
    v123        = 2.48015873015873d-5*a8
    a9          = a4*a5
    b2          = b1*b1
    v40         = b2
    v59         = 3.0d0*v40
    v68         = 6.0d0*v40
    v79         = 10.0d0*v40
    v91         = 15.0d0*v40
    v205        = 0.00416666666666667d0*v40
    v222        = 0.000694444444444444d0*v40
    b3          = b1*b2
    v32         = b3
    v66         = 4.0d0*v32
    v77         = 10.0d0*v32
    v89         = 20.0d0*v32
    v203        = 0.00694444444444444d0*v32
    v221        = 0.00138888888888889d0*v32
    b4          = b2*b2
    v27         = b4
    v75         = 5.0d0*v27
    v87         = 15.0d0*v27
    v201        = 0.00694444444444444d0*v27
    v220        = 0.00173611111111111d0*v27
    b5          = b2*b3
    v23         = b5
    v85         = 6.0d0*v23
    v199        = 0.00416666666666667d0*v23
    v219        = 0.00138888888888889d0*v23
    b6          = b3*b3
    v17         = b6
    v19         = v17*v18
    v105        = v104*v17
    v197        = 0.00138888888888889d0*v17
    v218        = 0.000694444444444444d0*v17
    v158        = v157*v17
    b7          = b3*b4
    v3          = b7
    v4          = L_xxyyyyyyy*v3
    v97         = L_xyyyyyyyy*v3
    v134        = 0.000198412698412698d0*v3
    v150        = L_xyyyyyyyz*v3
    b8          = b4*b4
    v124        = b8
    v125        = L_xyyyyyyyy*v124
    v210        = 2.48015873015873d-5*v124
    b9          = b4*b5
    c2          = c1*c1
    v5          = c2
    v29         = 3.0d0*v5
    v34         = 12.0d0*v5
    v45         = 60.0d0*v5
    v51         = 360.0d0*v5
    v238        = 0.5d0*v5
    v126        = L_xzz*v5
    v211        = L_yzz*v5
    v6          = L_xxzz*v5
    v98         = L_xyzz*v5
    v151        = L_xzzz*v5
    v191        = L_yyzz*v5
    v226        = L_yzzz*v5
    v43         = 2.0d0*L_xxxxxxx + L_xxxxxxxyy*v40 + L_xxxxxxxz*v24 + L_xxxxxxxzz*v5 + &
      v41*v42
    v62         = 2.0d0*L_xxxxxxy + L_xxxxxxyz*v24 + L_xxxxxxyzz*v5
    v113        = v62 + L_xxxxxxyyy*v40 + v41*v60
    v167        = L_xxxxxxyyz*v40 + 2.0d0*L_xxxxxxz + L_xxxxxxzz*v24 + L_xxxxxxzzz*v5 + &
      v166*v41
    v69         = 2.0d0*L_xxxxxyy + L_xxxxxyyz*v24 + L_xxxxxyyzz*v5
    v173        = 2.0d0*L_xxxxxyz + L_xxxxxyzz*v24 + L_xxxxxyzzz*v5
    v78         = 2.0d0*L_xxxxyyy + L_xxxxyyyz*v24 + L_xxxxyyyzz*v5
    v176        = 2.0d0*L_xxxxyyz + L_xxxxyyzz*v24 + L_xxxxyyzzz*v5
    v88         = 2.0d0*L_xxxyyyy + L_xxxyyyyz*v24 + L_xxxyyyyzz*v5
    v180        = 2.0d0*L_xxxyyyz + L_xxxyyyzz*v24 + L_xxxyyyzzz*v5
    v25         = 2.0d0*L_xxyyyyy + L_xxyyyyyz*v24 + L_xxyyyyyzz*v5
    v26         = v23*v25
    v185        = 2.0d0*L_xxyyyyz + L_xxyyyyzz*v24 + L_xxyyyyzzz*v5
    v107        = 2.0d0*L_xyyyyyy + L_xyyyyyyz*v24 + L_xyyyyyyzz*v5
    v108        = v107*v23
    v135        = v107*v17
    v160        = 2.0d0*L_xyyyyyz + L_xyyyyyzz*v24 + L_xyyyyyzzz*v5
    v161        = v160*v23
    v200        = 2.0d0*L_yyyyyyy + L_yyyyyyyz*v24 + L_yyyyyyyzz*v5
    v233        = 2.0d0*L_yyyyyyz + L_yyyyyyzz*v24 + L_yyyyyyzzz*v5
    h           = v40 + v5 + v73
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
    u18         = u9*u9
    u19         = u10*u9
    c3          = c1*c2
    v7          = c3
    v35         = 4.0d0*v7
    v46         = 20.0d0*v7
    v52         = 120.0d0*v7
    v239        = 0.166666666666667d0*v7
    v127        = L_xzzz*v7
    v212        = L_yzzz*v7
    v8          = L_xxzzz*v7
    v99         = L_xyzzz*v7
    v152        = L_xzzzz*v7
    v192        = L_yyzzz*v7
    v227        = L_yzzzz*v7
    v63         = 6.0d0*L_xxxxxx + L_xxxxxxyyy*v32 + L_xxxxxxz*v28 + L_xxxxxxzz*v29 + &
      L_xxxxxxzzz*v7 + v59*v60 + v61*v62
    v71         = 6.0d0*L_xxxxxy + L_xxxxxyz*v28 + L_xxxxxyzz*v29 + L_xxxxxyzzz*v7
    v118        = v71 + L_xxxxxyyyy*v32 + v59*v67 + v61*v69
    v174        = L_xxxxxyyyz*v32 + 6.0d0*L_xxxxxz + L_xxxxxzz*v28 + L_xxxxxzzz*v29 + &
      L_xxxxxzzzz*v7 + v172*v59 + v173*v61
    v80         = 6.0d0*L_xxxxyy + L_xxxxyyz*v28 + L_xxxxyyzz*v29 + L_xxxxyyzzz*v7
    v177        = 6.0d0*L_xxxxyz + L_xxxxyzz*v28 + L_xxxxyzzz*v29 + L_xxxxyzzzz*v7
    v90         = 6.0d0*L_xxxyyy + L_xxxyyyz*v28 + L_xxxyyyzz*v29 + L_xxxyyyzzz*v7
    v181        = 6.0d0*L_xxxyyz + L_xxxyyzz*v28 + L_xxxyyzzz*v29 + L_xxxyyzzzz*v7
    v30         = 6.0d0*L_xxyyyy + L_xxyyyyz*v28 + L_xxyyyyzz*v29 + L_xxyyyyzzz*v7
    v31         = v27*v30
    v186        = 6.0d0*L_xxyyyz + L_xxyyyzz*v28 + L_xxyyyzzz*v29 + L_xxyyyzzzz*v7
    v109        = 6.0d0*L_xyyyyy + L_xyyyyyz*v28 + L_xyyyyyzz*v29 + L_xyyyyyzzz*v7
    v110        = v109*v27
    v136        = v109*v23
    v162        = 6.0d0*L_xyyyyz + L_xyyyyzz*v28 + L_xyyyyzzz*v29 + L_xyyyyzzzz*v7
    v163        = v162*v27
    v202        = 6.0d0*L_yyyyyy + L_yyyyyyz*v28 + L_yyyyyyzz*v29 + L_yyyyyyzzz*v7
    v234        = 6.0d0*L_yyyyyz + L_yyyyyzz*v28 + L_yyyyyzzz*v29 + L_yyyyyzzzz*v7
    c4          = c2*c2
    v9          = c4
    v47         = 5.0d0*v9
    v53         = 30.0d0*v9
    v240        = 0.0416666666666667d0*v9
    v128        = L_xzzzz*v9
    v213        = L_yzzzz*v9
    v10         = L_xxzzzz*v9
    v100        = L_xyzzzz*v9
    v153        = L_xzzzzz*v9
    v193        = L_yyzzzz*v9
    v228        = L_yzzzzz*v9
    v72         = 24.0d0*L_xxxxx + L_xxxxxyyyy*v27 + L_xxxxxz*v33 + L_xxxxxzz*v34 + &
      L_xxxxxzzz*v35 + L_xxxxxzzzz*v9 + v66*v67 + v68*v69 + v70*v71
    v82         = 24.0d0*L_xxxxy + L_xxxxyz*v33 + L_xxxxyzz*v34 + L_xxxxyzzz*v35 + &
      L_xxxxyzzzz*v9
    v119        = v82 + L_xxxxyyyyy*v27 + v66*v76 + v68*v78 + v70*v80
    v178        = L_xxxxyyyyz*v27 + 24.0d0*L_xxxxz + L_xxxxzz*v33 + L_xxxxzzz*v34 + &
      L_xxxxzzzz*v35 + L_xxxxzzzzz*v9 + v175*v66 + v176*v68 + v177*v70
    v92         = 24.0d0*L_xxxyy + L_xxxyyz*v33 + L_xxxyyzz*v34 + L_xxxyyzzz*v35 + &
      L_xxxyyzzzz*v9
    v182        = 24.0d0*L_xxxyz + L_xxxyzz*v33 + L_xxxyzzz*v34 + L_xxxyzzzz*v35 + &
      L_xxxyzzzzz*v9
    v36         = 24.0d0*L_xxyyy + L_xxyyyz*v33 + L_xxyyyzz*v34 + L_xxyyyzzz*v35 + &
      L_xxyyyzzzz*v9
    v37         = v32*v36
    v187        = 24.0d0*L_xxyyz + L_xxyyzz*v33 + L_xxyyzzz*v34 + L_xxyyzzzz*v35 + &
      L_xxyyzzzzz*v9
    v111        = 24.0d0*L_xyyyy + L_xyyyyz*v33 + L_xyyyyzz*v34 + L_xyyyyzzz*v35 + &
      L_xyyyyzzzz*v9
    v112        = v111*v32
    v137        = v111*v27
    v164        = 24.0d0*L_xyyyz + L_xyyyzz*v33 + L_xyyyzzz*v34 + L_xyyyzzzz*v35 + &
      L_xyyyzzzzz*v9
    v165        = v164*v32
    v204        = 24.0d0*L_yyyyy + L_yyyyyz*v33 + L_yyyyyzz*v34 + L_yyyyyzzz*v35 + &
      L_yyyyyzzzz*v9
    v235        = 24.0d0*L_yyyyz + L_yyyyzz*v33 + L_yyyyzzz*v34 + L_yyyyzzzz*v35 + &
      L_yyyyzzzzz*v9
    c5          = c2*c3
    v11         = c5
    v54         = 6.0d0*v11
    v241        = 0.00833333333333333d0*v11
    v129        = L_xzzzzz*v11
    v214        = L_yzzzzz*v11
    v12         = L_xxzzzzz*v11
    v101        = L_xyzzzzz*v11
    v154        = L_xzzzzzz*v11
    v194        = L_yyzzzzz*v11
    v229        = L_yzzzzzz*v11
    v83         = 120.0d0*L_xxxx + L_xxxxyyyyy*v23 + L_xxxxz*v44 + L_xxxxzz*v45 + &
      L_xxxxzzz*v46 + L_xxxxzzzz*v47 + L_xxxxzzzzz*v11 + v75*v76 + v77* &
      v78 + v79*v80 + v81*v82
    v94         = 120.0d0*L_xxxy + L_xxxyz*v44 + L_xxxyzz*v45 + L_xxxyzzz*v46 + L_xxxyzzzz &
      *v47 + L_xxxyzzzzz*v11
    v120        = v94 + L_xxxyyyyyy*v23 + v75*v86 + v77*v88 + v79*v90 + v81*v92
    v183        = L_xxxyyyyyz*v23 + 120.0d0*L_xxxz + L_xxxzz*v44 + L_xxxzzz*v45 + &
      L_xxxzzzz*v46 + L_xxxzzzzz*v47 + L_xxxzzzzzz*v11 + v179*v75 + &
      v180*v77 + v181*v79 + v182*v81
    v48         = 120.0d0*L_xxyy + L_xxyyz*v44 + L_xxyyzz*v45 + L_xxyyzzz*v46 + L_xxyyzzzz &
      *v47 + L_xxyyzzzzz*v11
    v49         = v40*v48
    v188        = 120.0d0*L_xxyz + L_xxyzz*v44 + L_xxyzzz*v45 + L_xxyzzzz*v46 + L_xxyzzzzz &
      *v47 + L_xxyzzzzzz*v11
    v114        = 120.0d0*L_xyyy + L_xyyyz*v44 + L_xyyyzz*v45 + L_xyyyzzz*v46 + L_xyyyzzzz &
      *v47 + L_xyyyzzzzz*v11
    v115        = v114*v40
    v139        = v114*v32
    v168        = 120.0d0*L_xyyz + L_xyyzz*v44 + L_xyyzzz*v45 + L_xyyzzzz*v46 + L_xyyzzzzz &
      *v47 + L_xyyzzzzzz*v11
    v169        = v168*v40
    v206        = 120.0d0*L_yyyy + L_yyyyz*v44 + L_yyyyzz*v45 + L_yyyyzzz*v46 + L_yyyyzzzz &
      *v47 + L_yyyyzzzzz*v11
    v236        = 120.0d0*L_yyyz + L_yyyzz*v44 + L_yyyzzz*v45 + L_yyyzzzz*v46 + L_yyyzzzzz &
      *v47 + L_yyyzzzzzz*v11
    c6          = c3*c3
    v13         = c6
    v242        = 0.00138888888888889d0*v13
    v130        = L_xzzzzzz*v13
    v215        = L_yzzzzzz*v13
    v14         = L_xxzzzzzz*v13
    v102        = L_xyzzzzzz*v13
    v155        = L_xzzzzzzz*v13
    v195        = L_yyzzzzzz*v13
    v230        = L_yzzzzzzz*v13
    v95         = 720.0d0*L_xxx + L_xxxyyyyyy*v17 + L_xxxz*v50 + L_xxxzz*v51 + L_xxxzzz* &
      v52 + L_xxxzzzz*v53 + L_xxxzzzzz*v54 + L_xxxzzzzzz*v13 + v85*v86 &
      + v87*v88 + v89*v90 + v91*v92 + v93*v94
    v55         = 720.0d0*L_xxy + L_xxyz*v50 + L_xxyzz*v51 + L_xxyzzz*v52 + L_xxyzzzz*v53 &
      + L_xxyzzzzz*v54 + L_xxyzzzzzz*v13
    v56         = v55*y
    v121        = v55 + L_xxyyyyyyy*v17 + v18*v85 + v25*v87 + v30*v89 + v36*v91 + v48*v93
    v189        = L_xxyyyyyyz*v17 + 720.0d0*L_xxz + L_xxzz*v50 + L_xxzzz*v51 + L_xxzzzz* &
      v52 + L_xxzzzzz*v53 + L_xxzzzzzz*v54 + L_xxzzzzzzz*v13 + v184*v85 &
      + v185*v87 + v186*v89 + v187*v91 + v188*v93
    v116        = 720.0d0*L_xyy + L_xyyz*v50 + L_xyyzz*v51 + L_xyyzzz*v52 + L_xyyzzzz*v53 &
      + L_xyyzzzzz*v54 + L_xyyzzzzzz*v13
    v117        = v116*y
    v140        = v116*v40
    v170        = 720.0d0*L_xyz + L_xyzz*v50 + L_xyzzz*v51 + L_xyzzzz*v52 + L_xyzzzzz*v53 &
      + L_xyzzzzzz*v54 + L_xyzzzzzzz*v13
    v171        = v170*y
    v208        = 720.0d0*L_yyy + L_yyyz*v50 + L_yyyzz*v51 + L_yyyzzz*v52 + L_yyyzzzz*v53 &
      + L_yyyzzzzz*v54 + L_yyyzzzzzz*v13
    v237        = 720.0d0*L_yyz + L_yyzz*v50 + L_yyzzz*v51 + L_yyzzzz*v52 + L_yyzzzzz*v53 &
      + L_yyzzzzzz*v54 + L_yyzzzzzzz*v13
    c7          = c3*c4
    v15         = c7
    v243        = 0.000198412698412698d0*v15
    v131        = L_xzzzzzzz*v15
    v216        = L_yzzzzzzz*v15
    v16         = L_xxzzzzzzz*v15
    v148        = v16 + v4 + 210.0d0*v10 + 42.0d0*v12 + 2520.0d0*v6 + 840.0d0*v8 + 7.0d0*( &
      720.0d0*L_xx + 720.0d0*v0 + v14 + v19 + 3.0d0*v26 + 5.0d0*v31 + &
      5.0d0*v37 + 3.0d0*v49 + v56)
    Phi_xx      = L_xx + L_xxxxxxxxx*v2 + v0 + v21*v22 + v39*v43 + v58*v63 + v65*v72 + v74 &
      *v83 + v84*v95 + 0.000198412698412698d0*(210.0d0*v10 + 42.0d0*v12 &
      + v16 + v4 + 2520.0d0*v6 + 840.0d0*v8 + 21.0d0*(v26 + v49) + &
      35.0d0*(v31 + v37) + 7.0d0*(v14 + v19 + v56))
    v103        = L_xyzzzzzzz*v15
    v141        = v103 + 210.0d0*v100 + 42.0d0*v101 + 2520.0d0*v98 + 840.0d0*v99 + 7.0d0*( &
      720.0d0*L_xy + v102 + 720.0d0*v96)
    v142        = v141*y
    Phi_xy      = 0.000198412698412698d0*(210.0d0*v100 + 42.0d0*v101 + v103 + v97 + &
      2520.0d0*v98 + 840.0d0*v99 + 21.0d0*(v108 + v115) + 35.0d0*(v110 &
      + v112) + 7.0d0*(v102 + v105 + v117)) + L_xxxxxxxxy*v2 + L_xy + &
      v106*v21 + v113*v39 + v118*v58 + v119*v65 + v120*v74 + v121*v84 + &
      v96
    v156        = L_xzzzzzzzz*v15
    Phi_xz      = 0.000198412698412698d0*(v150 + 2520.0d0*v151 + 840.0d0*v152 + 210.0d0* &
      v153 + 42.0d0*v154 + v156 + 21.0d0*(v161 + v169) + 35.0d0*(v163 + &
      v165) + 7.0d0*(v155 + v158 + v171)) + L_xxxxxxxxz*v2 + L_xz + &
      v149 + v159*v21 + v167*v39 + v174*v58 + v178*v65 + v183*v74 + &
      v189*v84
    v196        = L_yyzzzzzzz*v15
    v224        = v196 + 2520.0d0*v191 + 840.0d0*v192 + 210.0d0*v193 + 42.0d0*v194 + 7.0d0 &
      *(720.0d0*L_yy + 720.0d0*v190 + v195)
    Phi_yy      = 0.000198412698412698d0*(2520.0d0*v191 + 840.0d0*v192 + 210.0d0*v193 + &
      42.0d0*v194 + 7.0d0*v195 + v196) + L_xxxxxxxyy*v2 + L_yy + &
      L_yyyyyyyyy*v134 + v190 + v197*v198 + v199*v200 + v201*v202 + &
      v203*v204 + v205*v206 + v207*v208 + v21*(L_xxxxxxyyy*y + v60) + &
      v39*(L_xxxxxyyyy*v40 + v41*v67 + v69) + v58*(L_xxxxyyyyy*v32 + &
      v59*v76 + v61*v78 + v80) + v65*(L_xxxyyyyyy*v27 + v66*v86 + v68* &
      v88 + v70*v90 + v92) + v74*(L_xxyyyyyyy*v23 + v18*v75 + v25*v77 + &
      v30*v79 + v36*v81 + v48) + v84*(L_xyyyyyyyy*v17 + v104*v85 + v107 &
      *v87 + v109*v89 + v111*v91 + v114*v93 + v116)
    Phi_zz      = -(Phi_xx + Phi_yy)
    v231        = L_yzzzzzzzz*v15
    Phi_yz      = 0.000198412698412698d0*(2520.0d0*v226 + 840.0d0*v227 + 210.0d0*v228 + &
      42.0d0*v229 + 7.0d0*v230 + v231) + L_xxxxxxxyz*v2 + L_yyyyyyyyz* &
      v134 + L_yz + v197*v232 + v199*v233 + v201*v234 + v203*v235 + &
      v205*v236 + v207*v237 + v21*(L_xxxxxxyyz*y + v166) + v225 + v39*( &
      L_xxxxxyyyz*v40 + v172*v41 + v173) + v58*(L_xxxxyyyyz*v32 + v175* &
      v59 + v176*v61 + v177) + v65*(L_xxxyyyyyz*v27 + v179*v66 + v180* &
      v68 + v181*v70 + v182) + v74*(L_xxyyyyyyz*v23 + v184*v75 + v185* &
      v77 + v186*v79 + v187*v81 + v188) + v84*(L_xyyyyyyyz*v17 + v157* &
      v85 + v160*v87 + v162*v89 + v164*v91 + v168*v93 + v170)
    c8          = c4*c4
    v132        = c8
    v244        = 2.48015873015873d-5*v132
    v133        = L_xzzzzzzzz*v132
    Phi_x       = 2.48015873015873d-5*(v125 + 20160.0d0*v126 + 6720.0d0*v127 + 1680.0d0* &
      v128 + 336.0d0*v129 + v133 + 70.0d0*v137 + 8.0d0*(v131 + v142) + &
      28.0d0*(v135 + v140) + 56.0d0*(v130 + v136 + v139)) + L_x + &
      L_xxxxxxxxx*v123 + v104*v134 + v122 + v138*v43 + v143*v63 + v144* &
      v72 + v145*v83 + v146*v95 + v147*v148 + v2*v22
    v217        = L_yzzzzzzzz*v132
    Phi_y       = 2.48015873015873d-5*(20160.0d0*v211 + 6720.0d0*v212 + 1680.0d0*v213 + &
      336.0d0*v214 + 56.0d0*v215 + 8.0d0*v216 + v217) + L_xxxxxxxxy* &
      v123 + L_y + L_yyyyyyyyy*v210 + v106*v2 + v113*v138 + v118*v143 + &
      v119*v144 + v120*v145 + v121*v146 + v134*v198 + v147*(7.0d0*v105 &
      + 21.0d0*v108 + 35.0d0*v110 + 35.0d0*v112 + 21.0d0*v115 + 7.0d0* &
      v117 + v141 + v97) + v200*v218 + v202*v219 + v204*v220 + v206* &
      v221 + v208*v222 + v209 + v223*v224
    Phi_z       = L_z + L_xxxxxxxxz*v123 + L_yyyyyyyyz*v210 + L_zz*z + L_zzz*v238 + L_zzzz &
      *v239 + L_zzzzz*v240 + L_zzzzzz*v241 + L_zzzzzzz*v242 + &
      L_zzzzzzzz*v243 + L_zzzzzzzzz*v244 + v134*v232 + v138*v167 + v143 &
      *v174 + v144*v178 + v145*v183 + v146*v189 + v147*(5040.0d0*L_xz + &
      5040.0d0*v149 + v150 + 2520.0d0*v151 + 840.0d0*v152 + 210.0d0* &
      v153 + 42.0d0*v154 + 7.0d0*v155 + v156 + 7.0d0*v158 + 21.0d0*v161 &
      + 35.0d0*v163 + 35.0d0*v165 + 21.0d0*v169 + 7.0d0*v171) + v159*v2 &
      + v218*v233 + v219*v234 + v220*v235 + v221*v236 + v222*v237 + &
      v223*(5040.0d0*L_yz + 5040.0d0*v225 + 2520.0d0*v226 + 840.0d0* &
      v227 + 210.0d0*v228 + 42.0d0*v229 + 7.0d0*v230 + v231)
    c9          = c4*c5
    Phi_0       = 2.75573192239859d-6*(L_xxxxxxxxx*a9 + L_yyyyyyyyy*b9 + L_zzzzzzzzz*c9 + &
      9.0d0*(x*(40320.0d0*L_x + 8.0d0*v104*v3 + 40320.0d0*v122 + v125 + &
      20160.0d0*v126 + 6720.0d0*v127 + 1680.0d0*v128 + 336.0d0*v129 + &
      56.0d0*v130 + 8.0d0*v131 + v133 + 28.0d0*v135 + 56.0d0*v136 + &
      70.0d0*v137 + 56.0d0*v139 + 28.0d0*v140 + 8.0d0*v142) + y*( &
      40320.0d0*L_y + 40320.0d0*v209 + 20160.0d0*v211 + 6720.0d0*v212 + &
      1680.0d0*v213 + 336.0d0*v214 + 56.0d0*v215 + 8.0d0*v216 + v217)) &
      + 36.0d0*(v1*v43 + v148*v73 + v200*v3 + v224*v40) + 84.0d0*(v17* &
      v202 + v20*v63 + v208*v32 + v64*v95) + 126.0d0*(v204*v23 + v206* &
      v27 + v38*v72 + v57*v83)) + L_0 + L_z*z + L_zz*v238 + L_zzz*v239 &
      + L_zzzz*v240 + L_zzzzz*v241 + L_zzzzzz*v242 + L_zzzzzzz*v243 + &
      L_zzzzzzzz*v244 + v123*v22 + v198*v210
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
#undef  L_xxxxxxxxx         
#undef  L_xxxxxxxxy         
#undef  L_xxxxxxxxz         
#undef  L_xxxxxxxyy         
#undef  L_xxxxxxxyz         
#undef  L_xxxxxxyyy         
#undef  L_xxxxxxyyz         
#undef  L_xxxxxyyyy         
#undef  L_xxxxxyyyz         
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  L_xxxyyyyyy         
#undef  L_xxxyyyyyz         
#undef  L_xxyyyyyyy         
#undef  L_xxyyyyyyz         
#undef  L_xyyyyyyyy         
#undef  L_xyyyyyyyz         
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
    end subroutine mom_es_L2P2
    
! OPS  1297*ADD + 2*DIV + 1539*MUL + 120*NEG + POW = 2959  (11370 before optimization)
subroutine mom_es_L2L2_add(L1, r1, L1s, L2, r2, L2s)
    real(dp), intent(in),  dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1s,L2s
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L, Ls
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
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
                v534, v535, v536, v537, v538, v539, v54, v540, v541, v542,&
                v543, v544, v545, v546, v547, v548, v549, v55, v550, v551,&
                v552, v553, v554, v555, v556, v557, v558, v559, v56, v560,&
                v561, v562, v563, v564, v565, v566, v567, v568, v569, v57,&
                v570, v571, v572, v573, v574, v575, v576, v577, v578, v579,&
                v58, v580, v581, v582, v583, v584, v585, v586, v587, v588,&
                v589, v59, v590, v591, v592, v593, v594, v595, v596, v597,&
                v598, v599, v6, v60, v600, v601, v602, v603, v604, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz, L_xxzz,&
                L_xyzz, L_xzzz, L_yyzz, L_yzzz, L_zzzz, L_xxxzz, L_xxyzz,&
                L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz, L_yyyzz, L_yyzzz, L_yzzzz,&
                L_zzzzz, L_xxxxzz, L_xxxyzz, L_xxxzzz, L_xxyyzz, L_xxyzzz,&
                L_xxzzzz, L_xyyyzz, L_xyyzzz, L_xyzzzz, L_xzzzzz, L_yyyyzz,&
                L_yyyzzz, L_yyzzzz, L_yzzzzz, L_zzzzzz, L_xxxxxzz, L_xxxxyzz,&
                L_xxxxzzz, L_xxxyyzz, L_xxxyzzz, L_xxxzzzz, L_xxyyyzz,&
                L_xxyyzzz, L_xxyzzzz, L_xxzzzzz, L_xyyyyzz, L_xyyyzzz,&
                L_xyyzzzz, L_xyzzzzz, L_xzzzzzz, L_yyyyyzz, L_yyyyzzz,&
                L_yyyzzzz, L_yyzzzzz, L_yzzzzzz, L_zzzzzzz, L_xxxxxxzz,&
                L_xxxxxyzz, L_xxxxxzzz, L_xxxxyyzz, L_xxxxyzzz, L_xxxxzzzz,&
                L_xxxyyyzz, L_xxxyyzzz, L_xxxyzzzz, L_xxxzzzzz, L_xxyyyyzz,&
                L_xxyyyzzz, L_xxyyzzzz, L_xxyzzzzz, L_xxzzzzzz, L_xyyyyyzz,&
                L_xyyyyzzz, L_xyyyzzzz, L_xyyzzzzz, L_xyzzzzzz, L_xzzzzzzz,&
                L_yyyyyyzz, L_yyyyyzzz, L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz,&
                L_yzzzzzzz, L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz, L_xxxxxxzzz,&
                L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz, L_xxxxyyyzz,&
                L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz, L_xxxyyyyzz,&
                L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz, L_xxxzzzzzz,&
                L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz, L_xxyyzzzzz,&
                L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz, L_xyyyyyzzz,&
                L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz, L_xyzzzzzzz,&
                L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz, L_yyyyyzzzz,&
                L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz, L_yzzzzzzzz,&
                L_zzzzzzzzz
#define y                    r(1:2,2)
#define Ls_0                 Ls(1:2,0)
#define L_0                  L(1:2,0)
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
#define L_xy                 L(1:2,5)
#define Ls_xy                Ls(1:2,5)
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
#define L_xxxz               L(1:2,18)
#define Ls_xxxz              Ls(1:2,18)
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
#define L_xxxxy              L(1:2,26)
#define Ls_xxxxy             Ls(1:2,26)
#define L_xxxxz              L(1:2,27)
#define Ls_xxxxz             Ls(1:2,27)
#define Ls_xxxyy             Ls(1:2,28)
#define L_xxxyy              L(1:2,28)
#define L_xxxyz              L(1:2,29)
#define Ls_xxxyz             Ls(1:2,29)
#define Ls_xxyyy             Ls(1:2,30)
#define L_xxyyy              L(1:2,30)
#define Ls_xxyyz             Ls(1:2,31)
#define L_xxyyz              L(1:2,31)
#define L_xyyyy              L(1:2,32)
#define Ls_xyyyy             Ls(1:2,32)
#define Ls_xyyyz             Ls(1:2,33)
#define L_xyyyz              L(1:2,33)
#define L_yyyyy              L(1:2,34)
#define Ls_yyyyy             Ls(1:2,34)
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
#define L_xxxxyz             L(1:2,40)
#define Ls_xxxxyz            Ls(1:2,40)
#define L_xxxyyy             L(1:2,41)
#define Ls_xxxyyy            Ls(1:2,41)
#define Ls_xxxyyz            Ls(1:2,42)
#define L_xxxyyz             L(1:2,42)
#define Ls_xxyyyy            Ls(1:2,43)
#define L_xxyyyy             L(1:2,43)
#define Ls_xxyyyz            Ls(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define L_xyyyyy             L(1:2,45)
#define Ls_xyyyyy            Ls(1:2,45)
#define Ls_xyyyyz            Ls(1:2,46)
#define L_xyyyyz             L(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define Ls_yyyyyy            Ls(1:2,47)
#define Ls_yyyyyz            Ls(1:2,48)
#define L_yyyyyz             L(1:2,48)
#define L_xxxxxxx            L(1:2,49)
#define Ls_xxxxxxx           Ls(1:2,49)
#define Ls_xxxxxxy           Ls(1:2,50)
#define L_xxxxxxy            L(1:2,50)
#define Ls_xxxxxxz           Ls(1:2,51)
#define L_xxxxxxz            L(1:2,51)
#define Ls_xxxxxyy           Ls(1:2,52)
#define L_xxxxxyy            L(1:2,52)
#define L_xxxxxyz            L(1:2,53)
#define Ls_xxxxxyz           Ls(1:2,53)
#define Ls_xxxxyyy           Ls(1:2,54)
#define L_xxxxyyy            L(1:2,54)
#define Ls_xxxxyyz           Ls(1:2,55)
#define L_xxxxyyz            L(1:2,55)
#define Ls_xxxyyyy           Ls(1:2,56)
#define L_xxxyyyy            L(1:2,56)
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
#define L_yyyyyyz            L(1:2,63)
#define Ls_yyyyyyz           Ls(1:2,63)
#define L_xxxxxxxx           L(1:2,64)
#define Ls_xxxxxxxx          Ls(1:2,64)
#define L_xxxxxxxy           L(1:2,65)
#define Ls_xxxxxxxy          Ls(1:2,65)
#define L_xxxxxxxz           L(1:2,66)
#define Ls_xxxxxxxz          Ls(1:2,66)
#define L_xxxxxxyy           L(1:2,67)
#define Ls_xxxxxxyy          Ls(1:2,67)
#define Ls_xxxxxxyz          Ls(1:2,68)
#define L_xxxxxxyz           L(1:2,68)
#define Ls_xxxxxyyy          Ls(1:2,69)
#define L_xxxxxyyy           L(1:2,69)
#define L_xxxxxyyz           L(1:2,70)
#define Ls_xxxxxyyz          Ls(1:2,70)
#define L_xxxxyyyy           L(1:2,71)
#define Ls_xxxxyyyy          Ls(1:2,71)
#define L_xxxxyyyz           L(1:2,72)
#define Ls_xxxxyyyz          Ls(1:2,72)
#define L_xxxyyyyy           L(1:2,73)
#define Ls_xxxyyyyy          Ls(1:2,73)
#define Ls_xxxyyyyz          Ls(1:2,74)
#define L_xxxyyyyz           L(1:2,74)
#define L_xxyyyyyy           L(1:2,75)
#define Ls_xxyyyyyy          Ls(1:2,75)
#define Ls_xxyyyyyz          Ls(1:2,76)
#define L_xxyyyyyz           L(1:2,76)
#define L_xyyyyyyy           L(1:2,77)
#define Ls_xyyyyyyy          Ls(1:2,77)
#define Ls_xyyyyyyz          Ls(1:2,78)
#define L_xyyyyyyz           L(1:2,78)
#define L_yyyyyyyy           L(1:2,79)
#define Ls_yyyyyyyy          Ls(1:2,79)
#define Ls_yyyyyyyz          Ls(1:2,80)
#define L_yyyyyyyz           L(1:2,80)
#define L_xxxxxxxxx          L(1:2,81)
#define Ls_xxxxxxxxx         Ls(1:2,81)
#define L_xxxxxxxxy          L(1:2,82)
#define Ls_xxxxxxxxy         Ls(1:2,82)
#define Ls_xxxxxxxxz         Ls(1:2,83)
#define L_xxxxxxxxz          L(1:2,83)
#define L_xxxxxxxyy          L(1:2,84)
#define Ls_xxxxxxxyy         Ls(1:2,84)
#define Ls_xxxxxxxyz         Ls(1:2,85)
#define L_xxxxxxxyz          L(1:2,85)
#define L_xxxxxxyyy          L(1:2,86)
#define Ls_xxxxxxyyy         Ls(1:2,86)
#define Ls_xxxxxxyyz         Ls(1:2,87)
#define L_xxxxxxyyz          L(1:2,87)
#define Ls_xxxxxyyyy         Ls(1:2,88)
#define L_xxxxxyyyy          L(1:2,88)
#define L_xxxxxyyyz          L(1:2,89)
#define Ls_xxxxxyyyz         Ls(1:2,89)
#define Ls_xxxxyyyyy         Ls(1:2,90)
#define L_xxxxyyyyy          L(1:2,90)
#define L_xxxxyyyyz          L(1:2,91)
#define Ls_xxxxyyyyz         Ls(1:2,91)
#define L_xxxyyyyyy          L(1:2,92)
#define Ls_xxxyyyyyy         Ls(1:2,92)
#define L_xxxyyyyyz          L(1:2,93)
#define Ls_xxxyyyyyz         Ls(1:2,93)
#define Ls_xxyyyyyyy         Ls(1:2,94)
#define L_xxyyyyyyy          L(1:2,94)
#define Ls_xxyyyyyyz         Ls(1:2,95)
#define L_xxyyyyyyz          L(1:2,95)
#define Ls_xyyyyyyyy         Ls(1:2,96)
#define L_xyyyyyyyy          L(1:2,96)
#define Ls_xyyyyyyyz         Ls(1:2,97)
#define L_xyyyyyyyz          L(1:2,97)
#define Ls_yyyyyyyyy         Ls(1:2,98)
#define L_yyyyyyyyy          L(1:2,98)
#define L_yyyyyyyyz          L(1:2,99)
#define Ls_yyyyyyyyz         Ls(1:2,99)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0           = L_xxxxxxxx + L_xxxxxxxxy*y + L_xxxxxxxxz*z
    v1           = L_xxxxxxxy + L_xxxxxxxyz*z
    v2           = L_xxxxxxxyy*y + v1
    v3           = L_xxxxxxyy + L_xxxxxxyyz*z
    v4           = L_xxxxxxyyy*y + v3
    v5           = L_xxxxxyyy + L_xxxxxyyyz*z
    v6           = L_xxxxxyyyy*y + v5
    v7           = L_xxxxyyyy + L_xxxxyyyyz*z
    v8           = L_xxxxyyyyy*y + v7
    v9           = L_xxxyyyyy + L_xxxyyyyyz*z
    v10          = L_xxxyyyyyy*y + v9
    v11          = L_xxyyyyyy + L_xxyyyyyyz*z
    v12          = L_xxyyyyyyy*y + v11
    v13          = L_xyyyyyyy + L_xyyyyyyyz*z
    v14          = L_xyyyyyyyy*y + v13
    v15          = L_yyyyyyyy + L_yyyyyyyyz*z
    v16          = L_xxxxxxxz*z
    v23          = v1*y
    v25          = L_xxxxxxyz*z
    v28          = v3*y
    v31          = L_xxxxxxz*z
    v42          = 0.5d0*x
    v48          = L_xxxxxyyz*z
    v51          = v5*y
    v54          = L_xxxxxyz*z
    v65          = L_xxxxxz*z
    v79          = 0.166666666666667d0*x
    v89          = L_xxxxyyyz*z
    v92          = v7*y
    v95          = L_xxxxyyz*z
    v106         = L_xxxxyz*z
    v122         = L_xxxxz*z
    v139         = 0.0416666666666667d0*x
    v151         = L_xxxyyyyz*z
    v154         = v9*y
    v157         = L_xxxyyyz*z
    v168         = L_xxxyyz*z
    v184         = L_xxxyz*z
    v204         = L_xxxz*z
    v224         = 0.00833333333333333d0*x
    v238         = L_xxyyyyyz*z
    v241         = v11*y
    v244         = L_xxyyyyz*z
    v255         = L_xxyyyz*z
    v271         = L_xxyyz*z
    v291         = L_xxyz*z
    v315         = L_xxz*z
    v338         = 0.00138888888888889d0*x
    v354         = L_xyyyyyyz*z
    v357         = v13*y
    v360         = L_xyyyyyz*z
    v371         = L_xyyyyz*z
    v387         = L_xyyyz*z
    v407         = L_xyyz*z
    v431         = L_xyz*z
    v459         = L_xz*z
    v484         = 0.000198412698412698d0*x
    v502         = L_yyyyyyyz*z
    v505         = L_yyyyyyz*z
    v508         = 0.5d0*y
    v512         = L_yyyyyz*z
    v517         = 0.166666666666667d0*y
    v523         = L_yyyyz*z
    v530         = 0.0416666666666667d0*y
    v537         = L_yyyz*z
    v546         = 0.00833333333333333d0*y
    v554         = L_yyz*z
    v565         = 0.00138888888888889d0*y
    v574         = L_yz*z
    v588         = 0.000198412698412698d0*y
    Ls_xxxxxxxx  = L_xxxxxxxxx*x + v0
    Ls_xxxxxxxy  = L_xxxxxxxxy*x + v2
    Ls_xxxxxxyy  = L_xxxxxxxyy*x + v4
    Ls_xxxxxyyy  = L_xxxxxxyyy*x + v6
    Ls_xxxxyyyy  = L_xxxxxyyyy*x + v8
    Ls_xxxyyyyy  = L_xxxxyyyyy*x + v10
    Ls_xxyyyyyy  = L_xxxyyyyyy*x + v12
    Ls_xyyyyyyy  = L_xxyyyyyyy*x + v14
    Ls_yyyyyyyy  = v15 + L_xyyyyyyyy*x + L_yyyyyyyyy*y
    Ls_xxxxxxxxx = L_xxxxxxxxx
    Ls_xxxxxxxxy = L_xxxxxxxxy
    Ls_xxxxxxxxz = L_xxxxxxxxz
    Ls_xxxxxxxyy = L_xxxxxxxyy
    Ls_xxxxxxxyz = L_xxxxxxxyz
    Ls_xxxxxxyyy = L_xxxxxxyyy
    Ls_xxxxxxyyz = L_xxxxxxyyz
    Ls_xxxxxyyyy = L_xxxxxyyyy
    Ls_xxxxxyyyz = L_xxxxxyyyz
    Ls_xxxxyyyyy = L_xxxxyyyyy
    Ls_xxxxyyyyz = L_xxxxyyyyz
    Ls_xxxyyyyyy = L_xxxyyyyyy
    Ls_xxxyyyyyz = L_xxxyyyyyz
    Ls_xxyyyyyyy = L_xxyyyyyyy
    Ls_xxyyyyyyz = L_xxyyyyyyz
    Ls_xyyyyyyyy = L_xyyyyyyyy
    Ls_xyyyyyyyz = L_xyyyyyyyz
    Ls_yyyyyyyyy = L_yyyyyyyyy
    Ls_yyyyyyyyz = L_yyyyyyyyz
    L_zz         = -(L_xx + L_yy)
    L_xzz        = -(L_xxx + L_xyy)
    v487         = L_xzz*z
    L_yzz        = -(L_xxy + L_yyy)
    v590         = L_yzz*z
    L_zzz        = -(L_xxz + L_yyz)
    L_xxzz       = -(L_xxxx + L_xxyy)
    v341         = L_xxzz*z
    L_xyzz       = -(L_xxxy + L_xyyy)
    v446         = L_xyzz*z
    L_xzzz       = -(L_xxxz + L_xyyz)
    L_yyzz       = -(L_xxyy + L_yyyy)
    v567         = L_yyzz*z
    L_yzzz       = -(L_xxyz + L_yyyz)
    L_zzzz       = -(L_xxzz + L_yyzz)
    L_xxxzz      = -(L_xxxxx + L_xxxyy)
    v227         = L_xxxzz*z
    L_xxyzz      = -(L_xxxxy + L_xxyyy)
    v304         = L_xxyzz*z
    L_xxzzz      = -(L_xxxxz + L_xxyyz)
    L_xyyzz      = -(L_xxxyy + L_xyyyy)
    v420         = L_xyyzz*z
    L_xyzzz      = -(L_xxxyz + L_xyyyz)
    L_xzzzz      = -(L_xxxzz + L_xyyzz)
    L_yyyzz      = -(L_xxyyy + L_yyyyy)
    v548         = L_yyyzz*z
    L_yyzzz      = -(L_xxyyz + L_yyyyz)
    L_yzzzz      = -(L_xxyzz + L_yyyzz)
    L_zzzzz      = -(L_xxzzz + L_yyzzz)
    L_xxxxzz     = -(L_xxxxxx + L_xxxxyy)
    v142         = L_xxxxzz*z
    L_xxxyzz     = -(L_xxxxxy + L_xxxyyy)
    v195         = L_xxxyzz*z
    L_xxxzzz     = -(L_xxxxxz + L_xxxyyz)
    L_xxyyzz     = -(L_xxxxyy + L_xxyyyy)
    v282         = L_xxyyzz*z
    L_xxyzzz     = -(L_xxxxyz + L_xxyyyz)
    L_xxzzzz     = -(L_xxxxzz + L_xxyyzz)
    L_xyyyzz     = -(L_xxxyyy + L_xyyyyy)
    v398         = L_xyyyzz*z
    L_xyyzzz     = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz     = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz     = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz     = -(L_xxyyyy + L_yyyyyy)
    v532         = L_yyyyzz*z
    L_yyyzzz     = -(L_xxyyyz + L_yyyyyz)
    L_yyzzzz     = -(L_xxyyzz + L_yyyyzz)
    L_yzzzzz     = -(L_xxyzzz + L_yyyzzz)
    L_zzzzzz     = -(L_xxzzzz + L_yyzzzz)
    L_xxxxxzz    = -(L_xxxxxxx + L_xxxxxyy)
    v82          = L_xxxxxzz*z
    L_xxxxyzz    = -(L_xxxxxxy + L_xxxxyyy)
    v115         = L_xxxxyzz*z
    L_xxxxzzz    = -(L_xxxxxxz + L_xxxxyyz)
    L_xxxyyzz    = -(L_xxxxxyy + L_xxxyyyy)
    v177         = L_xxxyyzz*z
    L_xxxyzzz    = -(L_xxxxxyz + L_xxxyyyz)
    L_xxxzzzz    = -(L_xxxxxzz + L_xxxyyzz)
    L_xxyyyzz    = -(L_xxxxyyy + L_xxyyyyy)
    v264         = L_xxyyyzz*z
    L_xxyyzzz    = -(L_xxxxyyz + L_xxyyyyz)
    L_xxyzzzz    = -(L_xxxxyzz + L_xxyyyzz)
    L_xxzzzzz    = -(L_xxxxzzz + L_xxyyzzz)
    L_xyyyyzz    = -(L_xxxyyyy + L_xyyyyyy)
    v380         = L_xyyyyzz*z
    L_xyyyzzz    = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz    = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz    = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz    = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz    = -(L_xxyyyyy + L_yyyyyyy)
    v519         = L_yyyyyzz*z
    L_yyyyzzz    = -(L_xxyyyyz + L_yyyyyyz)
    L_yyyzzzz    = -(L_xxyyyzz + L_yyyyyzz)
    L_yyzzzzz    = -(L_xxyyzzz + L_yyyyzzz)
    L_yzzzzzz    = -(L_xxyzzzz + L_yyyzzzz)
    L_zzzzzzz    = -(L_xxzzzzz + L_yyzzzzz)
    L_xxxxxxzz   = -(L_xxxxxxxx + L_xxxxxxyy)
    v44          = L_xxxxxxzz*z
    L_xxxxxyzz   = -(L_xxxxxxxy + L_xxxxxyyy)
    v61          = L_xxxxxyzz*z
    L_xxxxxzzz   = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz   = -(L_xxxxxxyy + L_xxxxyyyy)
    v102         = L_xxxxyyzz*z
    L_xxxxyzzz   = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz   = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz   = -(L_xxxxxyyy + L_xxxyyyyy)
    v164         = L_xxxyyyzz*z
    L_xxxyyzzz   = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz   = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz   = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz   = -(L_xxxxyyyy + L_xxyyyyyy)
    v251         = L_xxyyyyzz*z
    L_xxyyyzzz   = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz   = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz   = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz   = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz   = -(L_xxxyyyyy + L_xyyyyyyy)
    v367         = L_xyyyyyzz*z
    L_xyyyyzzz   = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz   = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz   = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz   = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz   = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz   = -(L_xxyyyyyy + L_yyyyyyyy)
    v510         = L_yyyyyyzz*z
    L_yyyyyzzz   = -(L_xxyyyyyz + L_yyyyyyyz)
    L_yyyyzzzz   = -(L_xxyyyyzz + L_yyyyyyzz)
    L_yyyzzzzz   = -(L_xxyyyzzz + L_yyyyyzzz)
    L_yyzzzzzz   = -(L_xxyyzzzz + L_yyyyzzzz)
    L_yzzzzzzz   = -(L_xxyzzzzz + L_yyyzzzzz)
    L_zzzzzzzz   = -(L_xxzzzzzz + L_yyzzzzzz)
    L_xxxxxxxzz  = -(L_xxxxxxxxx + L_xxxxxxxyy)
    v24          = L_xxxxxxxz + L_xxxxxxxyz*y + L_xxxxxxxzz*z
    Ls_xxxxxxxz  = L_xxxxxxxxz*x + v24
    L_xxxxxxyzz  = -(L_xxxxxxxxy + L_xxxxxxyyy)
    v29          = L_xxxxxxyz + L_xxxxxxyzz*z
    v30          = L_xxxxxxyyz*y + v29
    v47          = v29*y
    Ls_xxxxxxyz  = L_xxxxxxxyz*x + v30
    L_xxxxxxzzz  = -(L_xxxxxxxxz + L_xxxxxxyyz)
    L_xxxxxyyzz  = -(L_xxxxxxxyy + L_xxxxxyyyy)
    v52          = L_xxxxxyyz + L_xxxxxyyzz*z
    v53          = L_xxxxxyyyz*y + v52
    v64          = v52*y
    Ls_xxxxxyyz  = L_xxxxxxyyz*x + v53
    L_xxxxxyzzz  = -(L_xxxxxxxyz + L_xxxxxyyyz)
    L_xxxxxzzzz  = -(L_xxxxxxxzz + L_xxxxxyyzz)
    L_xxxxyyyzz  = -(L_xxxxxxyyy + L_xxxxyyyyy)
    v93          = L_xxxxyyyz + L_xxxxyyyzz*z
    v94          = L_xxxxyyyyz*y + v93
    v105         = v93*y
    Ls_xxxxyyyz  = L_xxxxxyyyz*x + v94
    L_xxxxyyzzz  = -(L_xxxxxxyyz + L_xxxxyyyyz)
    L_xxxxyzzzz  = -(L_xxxxxxyzz + L_xxxxyyyzz)
    L_xxxxzzzzz  = -(L_xxxxxxzzz + L_xxxxyyzzz)
    L_xxxyyyyzz  = -(L_xxxxxyyyy + L_xxxyyyyyy)
    v155         = L_xxxyyyyz + L_xxxyyyyzz*z
    v156         = L_xxxyyyyyz*y + v155
    v167         = v155*y
    Ls_xxxyyyyz  = L_xxxxyyyyz*x + v156
    L_xxxyyyzzz  = -(L_xxxxxyyyz + L_xxxyyyyyz)
    L_xxxyyzzzz  = -(L_xxxxxyyzz + L_xxxyyyyzz)
    L_xxxyzzzzz  = -(L_xxxxxyzzz + L_xxxyyyzzz)
    L_xxxzzzzzz  = -(L_xxxxxzzzz + L_xxxyyzzzz)
    L_xxyyyyyzz  = -(L_xxxxyyyyy + L_xxyyyyyyy)
    v242         = L_xxyyyyyz + L_xxyyyyyzz*z
    v243         = L_xxyyyyyyz*y + v242
    v254         = v242*y
    Ls_xxyyyyyz  = L_xxxyyyyyz*x + v243
    L_xxyyyyzzz  = -(L_xxxxyyyyz + L_xxyyyyyyz)
    L_xxyyyzzzz  = -(L_xxxxyyyzz + L_xxyyyyyzz)
    L_xxyyzzzzz  = -(L_xxxxyyzzz + L_xxyyyyzzz)
    L_xxyzzzzzz  = -(L_xxxxyzzzz + L_xxyyyzzzz)
    L_xxzzzzzzz  = -(L_xxxxzzzzz + L_xxyyzzzzz)
    L_xyyyyyyzz  = -(L_xxxyyyyyy + L_xyyyyyyyy)
    v358         = L_xyyyyyyz + L_xyyyyyyzz*z
    v359         = L_xyyyyyyyz*y + v358
    v370         = v358*y
    Ls_xyyyyyyz  = L_xxyyyyyyz*x + v359
    L_xyyyyyzzz  = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz  = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz  = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz  = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz  = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz  = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz  = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v504         = L_yyyyyyyz + L_yyyyyyyzz*z
    Ls_yyyyyyyz  = v504 + L_xyyyyyyyz*x + L_yyyyyyyyz*y
    L_yyyyyyzzz  = -(L_xxyyyyyyz + L_yyyyyyyyz)
    L_yyyyyzzzz  = -(L_xxyyyyyzz + L_yyyyyyyzz)
    L_yyyyzzzzz  = -(L_xxyyyyzzz + L_yyyyyyzzz)
    L_yyyzzzzzz  = -(L_xxyyyzzzz + L_yyyyyzzzz)
    L_yyzzzzzzz  = -(L_xxyyzzzzz + L_yyyyzzzzz)
    L_yzzzzzzzz  = -(L_xxyzzzzzz + L_yyyzzzzzz)
    L_zzzzzzzzz  = -(L_xxzzzzzzz + L_yyzzzzzzz)
    c1           = z
    b1           = y
    a1           = x
    a2           = a1*a1
    v17          = a2
    v18          = 0.5d0*v17
    v78          = 0.25d0*v17
    v138         = 0.0833333333333333d0*v17
    v223         = 0.0208333333333333d0*v17
    v337         = 0.00416666666666667d0*v17
    v483         = 0.000694444444444444d0*v17
    a3           = a1*a2
    v32          = a3
    v33          = 0.166666666666667d0*v32
    v137         = 0.0833333333333333d0*v32
    v222         = 0.0277777777777778d0*v32
    v336         = 0.00694444444444444d0*v32
    v482         = 0.00138888888888889d0*v32
    a4           = a2*a2
    v66          = a4
    v67          = 0.0416666666666667d0*v66
    v219         = 0.0208333333333333d0*v66
    v335         = 0.00694444444444444d0*v66
    v481         = 0.00173611111111111d0*v66
    a5           = a2*a3
    v123         = a5
    v124         = 0.00833333333333333d0*v123
    v331         = 0.00416666666666667d0*v123
    v480         = 0.00138888888888889d0*v123
    a6           = a3*a3
    v205         = a6
    v206         = 0.00138888888888889d0*v205
    v475         = 0.000694444444444444d0*v205
    a7           = a3*a4
    v316         = a7
    v317         = 0.000198412698412698d0*v316
    a8           = a4*a4
    v460         = 2.48015873015873d-5*a8
    a9           = a4*a5
    b2           = b1*b1
    v19          = b2
    v20          = L_xxxxxxxyy*v19
    v26          = L_xxxxxxyyy*v19
    v39          = 0.5d0*v19
    v45          = L_xxxxxxyyz*v19
    v49          = L_xxxxxyyyy*v19
    v62          = L_xxxxxyyyz*v19
    v80          = 3.0d0*v19
    v90          = L_xxxxyyyyy*v19
    v103         = L_xxxxyyyyz*v19
    v152         = L_xxxyyyyyy*v19
    v165         = L_xxxyyyyyz*v19
    v239         = L_xxyyyyyyy*v19
    v252         = L_xxyyyyyyz*v19
    v355         = L_xyyyyyyyy*v19
    v368         = L_xyyyyyyyz*v19
    v516         = 0.25d0*v19
    v529         = 0.0833333333333333d0*v19
    v545         = 0.0208333333333333d0*v19
    v564         = 0.00416666666666667d0*v19
    v587         = 0.000694444444444444d0*v19
    b3           = b1*b2
    v34          = b3
    v35          = L_xxxxxxyyy*v34
    v55          = L_xxxxxyyyy*v34
    v74          = 0.166666666666667d0*v34
    v83          = L_xxxxxyyyz*v34
    v96          = L_xxxxyyyyy*v34
    v116         = L_xxxxyyyyz*v34
    v140         = 4.0d0*v34
    v158         = L_xxxyyyyyy*v34
    v178         = L_xxxyyyyyz*v34
    v245         = L_xxyyyyyyy*v34
    v265         = L_xxyyyyyyz*v34
    v361         = L_xyyyyyyyy*v34
    v381         = L_xyyyyyyyz*v34
    v528         = 0.0833333333333333d0*v34
    v544         = 0.0277777777777778d0*v34
    v563         = 0.00694444444444444d0*v34
    v586         = 0.00138888888888889d0*v34
    b4           = b2*b2
    v68          = b4
    v69          = L_xxxxxyyyy*v68
    v107         = L_xxxxyyyyy*v68
    v132         = 0.0416666666666667d0*v68
    v143         = L_xxxxyyyyz*v68
    v169         = L_xxxyyyyyy*v68
    v196         = L_xxxyyyyyz*v68
    v225         = 5.0d0*v68
    v256         = L_xxyyyyyyy*v68
    v283         = L_xxyyyyyyz*v68
    v372         = L_xyyyyyyyy*v68
    v399         = L_xyyyyyyyz*v68
    v543         = 0.0208333333333333d0*v68
    v562         = 0.00694444444444444d0*v68
    v585         = 0.00173611111111111d0*v68
    b5           = b2*b3
    v125         = b5
    v126         = L_xxxxyyyyy*v125
    v185         = L_xxxyyyyyy*v125
    v215         = 0.00833333333333333d0*v125
    v228         = L_xxxyyyyyz*v125
    v272         = L_xxyyyyyyy*v125
    v305         = L_xxyyyyyyz*v125
    v339         = 6.0d0*v125
    v388         = L_xyyyyyyyy*v125
    v421         = L_xyyyyyyyz*v125
    v561         = 0.00416666666666667d0*v125
    v584         = 0.00138888888888889d0*v125
    b6           = b3*b3
    v207         = b6
    v208         = L_xxxyyyyyy*v207
    v292         = L_xxyyyyyyy*v207
    v327         = 0.00138888888888889d0*v207
    v342         = L_xxyyyyyyz*v207
    v408         = L_xyyyyyyyy*v207
    v447         = L_xyyyyyyyz*v207
    v485         = 7.0d0*v207
    v583         = 0.000694444444444444d0*v207
    b7           = b3*b4
    v318         = b7
    v319         = L_xxyyyyyyy*v318
    v432         = L_xyyyyyyyy*v318
    v471         = 0.000198412698412698d0*v318
    v488         = L_xyyyyyyyz*v318
    b8           = b4*b4
    v461         = b8
    v462         = L_xyyyyyyyy*v461
    v575         = 2.48015873015873d-5*v461
    b9           = b4*b5
    c2           = c1*c1
    v21          = c2
    v598         = 0.5d0*v21
    v463         = L_xzz*v21
    v576         = L_yzz*v21
    v320         = L_xxzz*v21
    v433         = L_xyzz*v21
    v489         = L_xzzz*v21
    v555         = L_yyzz*v21
    v591         = L_yzzz*v21
    v209         = L_xxxzz*v21
    v293         = L_xxyzz*v21
    v343         = L_xxzzz*v21
    v409         = L_xyyzz*v21
    v448         = L_xyzzz*v21
    v538         = L_yyyzz*v21
    v568         = L_yyzzz*v21
    v127         = L_xxxxzz*v21
    v186         = L_xxxyzz*v21
    v229         = L_xxxzzz*v21
    v273         = L_xxyyzz*v21
    v306         = L_xxyzzz*v21
    v389         = L_xyyyzz*v21
    v422         = L_xyyzzz*v21
    v524         = L_yyyyzz*v21
    v549         = L_yyyzzz*v21
    v70          = L_xxxxxzz*v21
    v108         = L_xxxxyzz*v21
    v144         = L_xxxxzzz*v21
    v170         = L_xxxyyzz*v21
    v197         = L_xxxyzzz*v21
    v257         = L_xxyyyzz*v21
    v284         = L_xxyyzzz*v21
    v373         = L_xyyyyzz*v21
    v400         = L_xyyyzzz*v21
    v513         = L_yyyyyzz*v21
    v533         = L_yyyyzzz*v21
    v36          = L_xxxxxxzz*v21
    v56          = L_xxxxxyzz*v21
    v84          = L_xxxxxzzz*v21
    v97          = L_xxxxyyzz*v21
    v117         = L_xxxxyzzz*v21
    v159         = L_xxxyyyzz*v21
    v179         = L_xxxyyzzz*v21
    v246         = L_xxyyyyzz*v21
    v266         = L_xxyyyzzz*v21
    v362         = L_xyyyyyzz*v21
    v382         = L_xyyyyzzz*v21
    v506         = L_yyyyyyzz*v21
    v520         = L_yyyyyzzz*v21
    v22          = L_xxxxxxxzz*v21
    v43          = v20 + v22 + 2.0d0*(L_xxxxxxx + v16 + v23)
    Ls_xxxxxxx   = 0.5d0*(v20 + v22) + L_xxxxxxx + L_xxxxxxxxx*v18 + v0*x + v16 + v23
    v27          = L_xxxxxxyzz*v21
    v40          = v27 + 2.0d0*(L_xxxxxxy + v25)
    v41          = v40*y
    v60          = 2.0d0*v28 + v26 + v40
    Ls_xxxxxxy   = 0.5d0*(v26 + v27) + L_xxxxxxxxy*v18 + L_xxxxxxy + v2*x + v25 + v28
    v46          = L_xxxxxxzzz*v21
    v88          = v45 + v46 + 2.0d0*(L_xxxxxxz + v44 + v47)
    Ls_xxxxxxz   = 0.5d0*(v45 + v46) + L_xxxxxxxxz*v18 + L_xxxxxxz + v24*x + v44 + v47
    v50          = L_xxxxxyyzz*v21
    v58          = v50 + 2.0d0*(L_xxxxxyy + v48)
    v59          = v58*y
    v75          = v19*v58
    v101         = 2.0d0*v51 + v49 + v58
    Ls_xxxxxyy   = 0.5d0*(v49 + v50) + L_xxxxxxxyy*v18 + L_xxxxxyy + v4*x + v48 + v51
    v63          = L_xxxxxyzzz*v21
    v86          = v63 + 2.0d0*(L_xxxxxyz + v61)
    v87          = v86*y
    v121         = 2.0d0*v64 + v62 + v86
    Ls_xxxxxyz   = 0.5d0*(v62 + v63) + L_xxxxxxxyz*v18 + L_xxxxxyz + v30*x + v61 + v64
    v91          = L_xxxxyyyzz*v21
    v99          = v91 + 2.0d0*(L_xxxxyyy + v89)
    v100         = v99*y
    v111         = v19*v99
    v133         = v34*v99
    v163         = 2.0d0*v92 + v90 + v99
    Ls_xxxxyyy   = 0.5d0*(v90 + v91) + L_xxxxxxyyy*v18 + L_xxxxyyy + v6*x + v89 + v92
    v104         = L_xxxxyyzzz*v21
    v119         = v104 + 2.0d0*(L_xxxxyyz + v102)
    v120         = v119*y
    v147         = v119*v19
    v183         = 2.0d0*v105 + v103 + v119
    Ls_xxxxyyz   = 0.5d0*(v103 + v104) + L_xxxxxxyyz*v18 + L_xxxxyyz + v102 + v105 + v53*x
    v153         = L_xxxyyyyzz*v21
    v161         = v153 + 2.0d0*(L_xxxyyyy + v151)
    v162         = v161*y
    v173         = v161*v19
    v190         = v161*v34
    v216         = v161*v68
    v250         = 2.0d0*v154 + v152 + v161
    Ls_xxxyyyy   = 0.5d0*(v152 + v153) + L_xxxxxyyyy*v18 + L_xxxyyyy + v151 + v154 + v8*x
    v166         = L_xxxyyyzzz*v21
    v181         = v166 + 2.0d0*(L_xxxyyyz + v164)
    v182         = v181*y
    v200         = v181*v19
    v233         = v181*v34
    v270         = 2.0d0*v167 + v165 + v181
    Ls_xxxyyyz   = 0.5d0*(v165 + v166) + L_xxxxxyyyz*v18 + L_xxxyyyz + v164 + v167 + v94*x
    v240         = L_xxyyyyyzz*v21
    v248         = v240 + 2.0d0*(L_xxyyyyy + v238)
    v249         = v248*y
    v260         = v19*v248
    v277         = v248*v34
    v298         = v248*v68
    v328         = v125*v248
    v366         = 2.0d0*v241 + v239 + v248
    Ls_xxyyyyy   = 0.5d0*(v239 + v240) + L_xxxxyyyyy*v18 + L_xxyyyyy + v10*x + v238 + v241
    v253         = L_xxyyyyzzz*v21
    v268         = v253 + 2.0d0*(L_xxyyyyz + v251)
    v269         = v268*y
    v287         = v19*v268
    v310         = v268*v34
    v348         = v268*v68
    v386         = 2.0d0*v254 + v252 + v268
    Ls_xxyyyyz   = 0.5d0*(v252 + v253) + L_xxxxyyyyz*v18 + L_xxyyyyz + v156*x + v251 + v254
    v356         = L_xyyyyyyzz*v21
    v364         = v356 + 2.0d0*(L_xyyyyyy + v354)
    v365         = v364*y
    v376         = v19*v364
    v393         = v34*v364
    v414         = v364*v68
    v439         = v125*v364
    v472         = v207*v364
    Ls_xyyyyyy   = 0.5d0*(v355 + v356) + L_xxxyyyyyy*v18 + L_xyyyyyy + v12*x + v354 + v357
    v369         = L_xyyyyyzzz*v21
    v384         = v369 + 2.0d0*(L_xyyyyyz + v367)
    v385         = v384*y
    v403         = v19*v384
    v426         = v34*v384
    v453         = v384*v68
    v495         = v125*v384
    Ls_xyyyyyz   = 0.5d0*(v368 + v369) + L_xxxyyyyyz*v18 + L_xyyyyyz + v243*x + v367 + v370
    v503         = L_yyyyyyyzz*v21
    v509         = v503 + 2.0d0*(L_yyyyyyy + v502)
    Ls_yyyyyyy   = 0.5d0*v503 + L_xxyyyyyyy*v18 + L_yyyyyyy + L_yyyyyyyyy*v39 + v14*x + v15 &
      *y + v502
    v511         = L_yyyyyyzzz*v21
    v522         = v511 + 2.0d0*(L_yyyyyyz + v510)
    Ls_yyyyyyz   = 0.5d0*v511 + L_xxyyyyyyz*v18 + L_yyyyyyyyz*v39 + L_yyyyyyz + v359*x + &
      v504*y + v510
    h            = v17 + v19 + v21
    u2           = 1.0/h
    u            = sqrt(u2)
    u3           = u*u2
    u4           = u2*u2
    u5           = u2*u3
    u6           = u3*u3
    u7           = u3*u4
    u8           = u4*u4
    u9           = u4*u5
    u10          = u5*u5
    u11          = u5*u6
    u12          = u6*u6
    u13          = u6*u7
    u14          = u7*u7
    u15          = u7*u8
    u16          = u8*u8
    u17          = u8*u9
    u18          = u9*u9
    u19          = u10*u9
    c3           = c1*c2
    v37          = c3
    v599         = 0.166666666666667d0*v37
    v464         = L_xzzz*v37
    v577         = L_yzzz*v37
    v321         = L_xxzzz*v37
    v434         = L_xyzzz*v37
    v490         = L_xzzzz*v37
    v556         = L_yyzzz*v37
    v592         = L_yzzzz*v37
    v210         = L_xxxzzz*v37
    v294         = L_xxyzzz*v37
    v344         = L_xxzzzz*v37
    v410         = L_xyyzzz*v37
    v449         = L_xyzzzz*v37
    v539         = L_yyyzzz*v37
    v569         = L_yyzzzz*v37
    v128         = L_xxxxzzz*v37
    v187         = L_xxxyzzz*v37
    v230         = L_xxxzzzz*v37
    v274         = L_xxyyzzz*v37
    v307         = L_xxyzzzz*v37
    v390         = L_xyyyzzz*v37
    v423         = L_xyyzzzz*v37
    v525         = L_yyyyzzz*v37
    v550         = L_yyyzzzz*v37
    v71          = L_xxxxxzzz*v37
    v109         = L_xxxxyzzz*v37
    v145         = L_xxxxzzzz*v37
    v171         = L_xxxyyzzz*v37
    v198         = L_xxxyzzzz*v37
    v258         = L_xxyyyzzz*v37
    v285         = L_xxyyzzzz*v37
    v374         = L_xyyyyzzz*v37
    v401         = L_xyyyzzzz*v37
    v514         = L_yyyyyzzz*v37
    v534         = L_yyyyzzzz*v37
    v38          = L_xxxxxxzzz*v37
    v81          = v35 + v38 + v3*v80 + 6.0d0*(L_xxxxxx + v31) + 3.0d0*(v36 + v41)
    Ls_xxxxxx    = 0.166666666666667d0*(v35 + v38 + 3.0d0*(v36 + v41)) + L_xxxxxx + &
      L_xxxxxxxxx*v33 + v0*v18 + v3*v39 + v31 + v42*v43
    v57          = L_xxxxxyzzz*v37
    v76          = v57 + 3.0d0*(2.0d0*L_xxxxxy + 2.0d0*v54 + v56)
    v77          = v76*y
    v114         = v55 + v76 + v5*v80 + 3.0d0*v59
    Ls_xxxxxy    = 0.166666666666667d0*(v55 + v57 + 3.0d0*(v56 + v59)) + L_xxxxxxxxy*v33 + &
      L_xxxxxy + v18*v2 + v39*v5 + v42*v60 + v54
    v85          = L_xxxxxzzzz*v37
    v150         = v83 + v85 + v52*v80 + 6.0d0*(L_xxxxxz + v82) + 3.0d0*(v84 + v87)
    Ls_xxxxxz    = 0.166666666666667d0*(v83 + v85 + 3.0d0*(v84 + v87)) + L_xxxxxxxxz*v33 + &
      L_xxxxxz + v18*v24 + v39*v52 + v42*v88 + v82
    v98          = L_xxxxyyzzz*v37
    v112         = v98 + 3.0d0*(2.0d0*L_xxxxyy + 2.0d0*v95 + v97)
    v113         = v112*y
    v134         = v112*v19
    v176         = 3.0d0*v100 + v7*v80 + v112 + v96
    Ls_xxxxyy    = 0.166666666666667d0*(v96 + v98 + 3.0d0*(v100 + v97)) + L_xxxxxxxyy*v33 + &
      L_xxxxyy + v101*v42 + v18*v4 + v39*v7 + v95
    v118         = L_xxxxyzzzz*v37
    v148         = v118 + 3.0d0*(2.0d0*L_xxxxyz + 2.0d0*v115 + v117)
    v149         = v148*y
    v203         = v116 + v148 + 3.0d0*v120 + v80*v93
    Ls_xxxxyz    = 0.166666666666667d0*(v116 + v118 + 3.0d0*(v117 + v120)) + L_xxxxxxxyz* &
      v33 + L_xxxxyz + v115 + v121*v42 + v18*v30 + v39*v93
    v160         = L_xxxyyyzzz*v37
    v174         = v160 + 3.0d0*(2.0d0*L_xxxyyy + 2.0d0*v157 + v159)
    v175         = v174*y
    v191         = v174*v19
    v217         = v174*v34
    v263         = v158 + v174 + 3.0d0*v162 + v80*v9
    Ls_xxxyyy    = 0.166666666666667d0*(v158 + v160 + 3.0d0*(v159 + v162)) + L_xxxxxxyyy* &
      v33 + L_xxxyyy + v157 + v163*v42 + v18*v6 + v39*v9
    v180         = L_xxxyyzzzz*v37
    v201         = v180 + 3.0d0*(2.0d0*L_xxxyyz + 2.0d0*v177 + v179)
    v202         = v201*y
    v234         = v19*v201
    v290         = v178 + v201 + v155*v80 + 3.0d0*v182
    Ls_xxxyyz    = 0.166666666666667d0*(v178 + v180 + 3.0d0*(v179 + v182)) + L_xxxxxxyyz* &
      v33 + L_xxxyyz + v155*v39 + v177 + v18*v53 + v183*v42
    v247         = L_xxyyyyzzz*v37
    v261         = v247 + 3.0d0*(2.0d0*L_xxyyyy + 2.0d0*v244 + v246)
    v262         = v261*y
    v278         = v19*v261
    v299         = v261*v34
    v329         = v261*v68
    v379         = v245 + v261 + v11*v80 + 3.0d0*v249
    Ls_xxyyyy    = 0.166666666666667d0*(v245 + v247 + 3.0d0*(v246 + v249)) + L_xxxxxyyyy* &
      v33 + L_xxyyyy + v11*v39 + v18*v8 + v244 + v250*v42
    v267         = L_xxyyyzzzz*v37
    v288         = v267 + 3.0d0*(2.0d0*L_xxyyyz + 2.0d0*v264 + v266)
    v289         = v288*y
    v311         = v19*v288
    v349         = v288*v34
    v406         = v265 + v288 + v242*v80 + 3.0d0*v269
    Ls_xxyyyz    = 0.166666666666667d0*(v265 + v267 + 3.0d0*(v266 + v269)) + L_xxxxxyyyz* &
      v33 + L_xxyyyz + v18*v94 + v242*v39 + v264 + v270*v42
    v363         = L_xyyyyyzzz*v37
    v377         = v363 + 3.0d0*(2.0d0*L_xyyyyy + 2.0d0*v360 + v362)
    v378         = v377*y
    v394         = v19*v377
    v415         = v34*v377
    v440         = v377*v68
    v473         = v125*v377
    Ls_xyyyyy    = 0.166666666666667d0*(v361 + v363 + 3.0d0*(v362 + v365)) + L_xxxxyyyyy* &
      v33 + L_xyyyyy + v10*v18 + v13*v39 + v360 + v366*v42
    v383         = L_xyyyyzzzz*v37
    v404         = v383 + 3.0d0*(2.0d0*L_xyyyyz + 2.0d0*v380 + v382)
    v405         = v404*y
    v427         = v19*v404
    v454         = v34*v404
    v496         = v404*v68
    Ls_xyyyyz    = 0.166666666666667d0*(v381 + v383 + 3.0d0*(v382 + v385)) + L_xxxxyyyyz* &
      v33 + L_xyyyyz + v156*v18 + v358*v39 + v380 + v386*v42
    v507         = L_yyyyyyzzz*v37
    v518         = v507 + 3.0d0*(2.0d0*L_yyyyyy + 2.0d0*v505 + v506)
    Ls_yyyyyy    = 0.166666666666667d0*(3.0d0*v506 + v507) + L_xxxyyyyyy*v33 + L_yyyyyy + &
      L_yyyyyyyyy*v74 + v12*v18 + v15*v39 + v42*(v355 + 2.0d0*v357 + &
      v364) + v505 + v508*v509
    v521         = L_yyyyyzzzz*v37
    v536         = v521 + 3.0d0*(2.0d0*L_yyyyyz + 2.0d0*v519 + v520)
    Ls_yyyyyz    = 0.166666666666667d0*(3.0d0*v520 + v521) + L_xxxyyyyyz*v33 + L_yyyyyyyyz* &
      v74 + L_yyyyyz + v18*v243 + v39*v504 + v42*(v368 + 2.0d0*v370 + &
      v384) + v508*v522 + v519
    c4           = c2*c2
    v72          = c4
    v600         = 0.0416666666666667d0*v72
    v465         = L_xzzzz*v72
    v578         = L_yzzzz*v72
    v322         = L_xxzzzz*v72
    v435         = L_xyzzzz*v72
    v491         = L_xzzzzz*v72
    v557         = L_yyzzzz*v72
    v593         = L_yzzzzz*v72
    v211         = L_xxxzzzz*v72
    v295         = L_xxyzzzz*v72
    v345         = L_xxzzzzz*v72
    v411         = L_xyyzzzz*v72
    v450         = L_xyzzzzz*v72
    v540         = L_yyyzzzz*v72
    v570         = L_yyzzzzz*v72
    v129         = L_xxxxzzzz*v72
    v188         = L_xxxyzzzz*v72
    v231         = L_xxxzzzzz*v72
    v275         = L_xxyyzzzz*v72
    v308         = L_xxyzzzzz*v72
    v391         = L_xyyyzzzz*v72
    v424         = L_xyyzzzzz*v72
    v526         = L_yyyyzzzz*v72
    v551         = L_yyyzzzzz*v72
    v73          = L_xxxxxzzzz*v72
    v141         = v69 + v73 + v140*v5 + 12.0d0*v70 + 6.0d0*v75 + 24.0d0*(L_xxxxx + v65) + &
      4.0d0*(v71 + v77)
    Ls_xxxxx     = 0.0416666666666667d0*(v69 + 12.0d0*v70 + v73 + 6.0d0*v75 + 4.0d0*(v71 + &
      v77)) + L_xxxxx + L_xxxxxxxxx*v67 + v0*v33 + v43*v78 + v5*v74 + &
      v65 + v79*v81
    v110         = L_xxxxyzzzz*v72
    v135         = v110 + 12.0d0*v108 + 4.0d0*(6.0d0*L_xxxxy + 6.0d0*v106 + v109)
    v136         = v135*y
    v194         = v107 + v135 + 6.0d0*v111 + 4.0d0*v113 + v140*v7
    Ls_xxxxy     = 0.0416666666666667d0*(v107 + 12.0d0*v108 + v110 + 6.0d0*v111 + 4.0d0*( &
      v109 + v113)) + L_xxxxxxxxy*v67 + L_xxxxy + v106 + v114*v79 + v2* &
      v33 + v60*v78 + v7*v74
    v146         = L_xxxxzzzzz*v72
    v237         = v143 + v146 + v140*v93 + 12.0d0*v144 + 6.0d0*v147 + 24.0d0*(L_xxxxz + &
      v142) + 4.0d0*(v145 + v149)
    Ls_xxxxz     = 0.0416666666666667d0*(v143 + 12.0d0*v144 + v146 + 6.0d0*v147 + 4.0d0*( &
      v145 + v149)) + L_xxxxxxxxz*v67 + L_xxxxz + v142 + v150*v79 + v24 &
      *v33 + v74*v93 + v78*v88
    v172         = L_xxxyyzzzz*v72
    v192         = v172 + 12.0d0*v170 + 4.0d0*(6.0d0*L_xxxyy + 6.0d0*v168 + v171)
    v193         = v192*y
    v218         = v19*v192
    v281         = v169 + v192 + v140*v9 + 6.0d0*v173 + 4.0d0*v175
    Ls_xxxyy     = 0.0416666666666667d0*(v169 + 12.0d0*v170 + v172 + 6.0d0*v173 + 4.0d0*( &
      v171 + v175)) + L_xxxxxxxyy*v67 + L_xxxyy + v101*v78 + v168 + &
      v176*v79 + v33*v4 + v74*v9
    v199         = L_xxxyzzzzz*v72
    v235         = v199 + 12.0d0*v197 + 4.0d0*(6.0d0*L_xxxyz + 6.0d0*v195 + v198)
    v236         = v235*y
    v314         = v196 + v235 + v140*v155 + 6.0d0*v200 + 4.0d0*v202
    Ls_xxxyz     = 0.0416666666666667d0*(v196 + 12.0d0*v197 + v199 + 6.0d0*v200 + 4.0d0*( &
      v198 + v202)) + L_xxxxxxxyz*v67 + L_xxxyz + v121*v78 + v155*v74 + &
      v195 + v203*v79 + v30*v33
    v259         = L_xxyyyzzzz*v72
    v279         = v259 + 12.0d0*v257 + 4.0d0*(6.0d0*L_xxyyy + 6.0d0*v255 + v258)
    v280         = v279*y
    v300         = v19*v279
    v330         = v279*v34
    v397         = v256 + v279 + v11*v140 + 6.0d0*v260 + 4.0d0*v262
    Ls_xxyyy     = 0.0416666666666667d0*(v256 + 12.0d0*v257 + v259 + 6.0d0*v260 + 4.0d0*( &
      v258 + v262)) + L_xxxxxxyyy*v67 + L_xxyyy + v11*v74 + v163*v78 + &
      v255 + v263*v79 + v33*v6
    v286         = L_xxyyzzzzz*v72
    v312         = v286 + 12.0d0*v284 + 4.0d0*(6.0d0*L_xxyyz + 6.0d0*v282 + v285)
    v313         = v312*y
    v350         = v19*v312
    v430         = v283 + v312 + v140*v242 + 6.0d0*v287 + 4.0d0*v289
    Ls_xxyyz     = 0.0416666666666667d0*(v283 + 12.0d0*v284 + v286 + 6.0d0*v287 + 4.0d0*( &
      v285 + v289)) + L_xxxxxxyyz*v67 + L_xxyyz + v183*v78 + v242*v74 + &
      v282 + v290*v79 + v33*v53
    v375         = L_xyyyyzzzz*v72
    v395         = v375 + 12.0d0*v373 + 4.0d0*(6.0d0*L_xyyyy + 6.0d0*v371 + v374)
    v396         = v395*y
    v416         = v19*v395
    v441         = v34*v395
    v474         = v395*v68
    Ls_xyyyy     = 0.0416666666666667d0*(v372 + 12.0d0*v373 + v375 + 6.0d0*v376 + 4.0d0*( &
      v374 + v378)) + L_xxxxxyyyy*v67 + L_xyyyy + v13*v74 + v250*v78 + &
      v33*v8 + v371 + v379*v79
    v402         = L_xyyyzzzzz*v72
    v428         = v402 + 12.0d0*v400 + 4.0d0*(6.0d0*L_xyyyz + 6.0d0*v398 + v401)
    v429         = v428*y
    v455         = v19*v428
    v497         = v34*v428
    Ls_xyyyz     = 0.0416666666666667d0*(v399 + 12.0d0*v400 + v402 + 6.0d0*v403 + 4.0d0*( &
      v401 + v405)) + L_xxxxxyyyz*v67 + L_xyyyz + v270*v78 + v33*v94 + &
      v358*v74 + v398 + v406*v79
    v515         = L_yyyyyzzzz*v72
    v531         = v515 + 12.0d0*v513 + 4.0d0*(6.0d0*L_yyyyy + 6.0d0*v512 + v514)
    Ls_yyyyy     = 0.0416666666666667d0*(12.0d0*v513 + 4.0d0*v514 + v515) + L_xxxxyyyyy*v67 &
      + L_yyyyy + L_yyyyyyyyy*v132 + v10*v33 + v15*v74 + v366*v78 + &
      v509*v516 + v512 + v517*v518 + v79*(v13*v80 + v361 + 3.0d0*v365 + &
      v377)
    v535         = L_yyyyzzzzz*v72
    v553         = v535 + 12.0d0*v533 + 4.0d0*(6.0d0*L_yyyyz + 6.0d0*v532 + v534)
    Ls_yyyyz     = 0.0416666666666667d0*(12.0d0*v533 + 4.0d0*v534 + v535) + L_xxxxyyyyz*v67 &
      + L_yyyyyyyyz*v132 + L_yyyyz + v156*v33 + v386*v78 + v504*v74 + &
      v516*v522 + v517*v536 + v532 + v79*(v358*v80 + v381 + 3.0d0*v385 &
      + v404)
    c5           = c2*c3
    v130         = c5
    v601         = 0.00833333333333333d0*v130
    v466         = L_xzzzzz*v130
    v579         = L_yzzzzz*v130
    v323         = L_xxzzzzz*v130
    v436         = L_xyzzzzz*v130
    v492         = L_xzzzzzz*v130
    v558         = L_yyzzzzz*v130
    v594         = L_yzzzzzz*v130
    v212         = L_xxxzzzzz*v130
    v296         = L_xxyzzzzz*v130
    v346         = L_xxzzzzzz*v130
    v412         = L_xyyzzzzz*v130
    v451         = L_xyzzzzzz*v130
    v541         = L_yyyzzzzz*v130
    v571         = L_yyzzzzzz*v130
    v131         = L_xxxxzzzzz*v130
    v226         = v126 + v131 + 60.0d0*v127 + 20.0d0*v128 + v225*v7 + 120.0d0*(L_xxxx + &
      v122) + 5.0d0*(v129 + v136) + 10.0d0*(v133 + v134)
    Ls_xxxx      = 0.00833333333333333d0*(v126 + 60.0d0*v127 + 20.0d0*v128 + v131 + 5.0d0*( &
      v129 + v136) + 10.0d0*(v133 + v134)) + L_xxxx + L_xxxxxxxxx*v124 &
      + v0*v67 + v122 + v132*v7 + v137*v43 + v138*v81 + v139*v141
    v189         = L_xxxyzzzzz*v130
    v220         = v189 + 60.0d0*v186 + 20.0d0*v187 + 5.0d0*(24.0d0*L_xxxy + 24.0d0*v184 + &
      v188)
    v221         = v220*y
    v303         = v185 + v220 + 5.0d0*v193 + v225*v9 + 10.0d0*(v190 + v191)
    Ls_xxxy      = 0.00833333333333333d0*(v185 + 60.0d0*v186 + 20.0d0*v187 + v189 + 5.0d0*( &
      v188 + v193) + 10.0d0*(v190 + v191)) + L_xxxxxxxxy*v124 + L_xxxy &
      + v114*v138 + v132*v9 + v137*v60 + v139*v194 + v184 + v2*v67
    v232         = L_xxxzzzzzz*v130
    v353         = v228 + v232 + v155*v225 + 60.0d0*v229 + 20.0d0*v230 + 120.0d0*(L_xxxz + &
      v227) + 5.0d0*(v231 + v236) + 10.0d0*(v233 + v234)
    Ls_xxxz      = 0.00833333333333333d0*(v228 + 60.0d0*v229 + 20.0d0*v230 + v232 + 5.0d0*( &
      v231 + v236) + 10.0d0*(v233 + v234)) + L_xxxxxxxxz*v124 + L_xxxz &
      + v132*v155 + v137*v88 + v138*v150 + v139*v237 + v227 + v24*v67
    v276         = L_xxyyzzzzz*v130
    v301         = v276 + 60.0d0*v273 + 20.0d0*v274 + 5.0d0*(24.0d0*L_xxyy + 24.0d0*v271 + &
      v275)
    v302         = v301*y
    v332         = v19*v301
    v419         = v272 + v301 + v11*v225 + 5.0d0*v280 + 10.0d0*(v277 + v278)
    Ls_xxyy      = 0.00833333333333333d0*(v272 + 60.0d0*v273 + 20.0d0*v274 + v276 + 5.0d0*( &
      v275 + v280) + 10.0d0*(v277 + v278)) + L_xxxxxxxyy*v124 + L_xxyy &
      + v101*v137 + v11*v132 + v138*v176 + v139*v281 + v271 + v4*v67
    v309         = L_xxyzzzzzz*v130
    v351         = v309 + 60.0d0*v306 + 20.0d0*v307 + 5.0d0*(24.0d0*L_xxyz + 24.0d0*v304 + &
      v308)
    v352         = v351*y
    v458         = v305 + v351 + v225*v242 + 5.0d0*v313 + 10.0d0*(v310 + v311)
    Ls_xxyz      = 0.00833333333333333d0*(v305 + 60.0d0*v306 + 20.0d0*v307 + v309 + 5.0d0*( &
      v308 + v313) + 10.0d0*(v310 + v311)) + L_xxxxxxxyz*v124 + L_xxyz &
      + v121*v137 + v132*v242 + v138*v203 + v139*v314 + v30*v67 + v304
    v392         = L_xyyyzzzzz*v130
    v417         = v392 + 60.0d0*v389 + 20.0d0*v390 + 5.0d0*(24.0d0*L_xyyy + 24.0d0*v387 + &
      v391)
    v418         = v417*y
    v442         = v19*v417
    v476         = v34*v417
    Ls_xyyy      = 0.00833333333333333d0*(v388 + 60.0d0*v389 + 20.0d0*v390 + v392 + 5.0d0*( &
      v391 + v396) + 10.0d0*(v393 + v394)) + L_xxxxxxyyy*v124 + L_xyyy &
      + v13*v132 + v137*v163 + v138*v263 + v139*v397 + v387 + v6*v67
    v425         = L_xyyzzzzzz*v130
    v456         = v425 + 60.0d0*v422 + 20.0d0*v423 + 5.0d0*(24.0d0*L_xyyz + 24.0d0*v420 + &
      v424)
    v457         = v456*y
    v498         = v19*v456
    Ls_xyyz      = 0.00833333333333333d0*(v421 + 60.0d0*v422 + 20.0d0*v423 + v425 + 5.0d0*( &
      v424 + v429) + 10.0d0*(v426 + v427)) + L_xxxxxxyyz*v124 + L_xyyz &
      + v132*v358 + v137*v183 + v138*v290 + v139*v430 + v420 + v53*v67
    v527         = L_yyyyzzzzz*v130
    v547         = v527 + 60.0d0*v524 + 20.0d0*v525 + 5.0d0*(24.0d0*L_yyyy + 24.0d0*v523 + &
      v526)
    Ls_yyyy      = 0.00833333333333333d0*(60.0d0*v524 + 20.0d0*v525 + 5.0d0*v526 + v527) + &
      L_xxxxxyyyy*v124 + L_yyyy + L_yyyyyyyyy*v215 + v132*v15 + v137* &
      v250 + v138*v379 + v139*(v13*v140 + v372 + 6.0d0*v376 + 4.0d0* &
      v378 + v395) + v509*v528 + v518*v529 + v523 + v530*v531 + v67*v8
    v552         = L_yyyzzzzzz*v130
    v573         = v552 + 60.0d0*v549 + 20.0d0*v550 + 5.0d0*(24.0d0*L_yyyz + 24.0d0*v548 + &
      v551)
    Ls_yyyz      = 0.00833333333333333d0*(60.0d0*v549 + 20.0d0*v550 + 5.0d0*v551 + v552) + &
      L_xxxxxyyyz*v124 + L_yyyyyyyyz*v215 + L_yyyz + v132*v504 + v137* &
      v270 + v138*v406 + v139*(v140*v358 + v399 + 6.0d0*v403 + 4.0d0* &
      v405 + v428) + v522*v528 + v529*v536 + v530*v553 + v548 + v67*v94
    c6           = c3*c3
    v213         = c6
    v602         = 0.00138888888888889d0*v213
    v467         = L_xzzzzzz*v213
    v580         = L_yzzzzzz*v213
    v324         = L_xxzzzzzz*v213
    v437         = L_xyzzzzzz*v213
    v493         = L_xzzzzzzz*v213
    v559         = L_yyzzzzzz*v213
    v595         = L_yzzzzzzz*v213
    v214         = L_xxxzzzzzz*v213
    v340         = v208 + v214 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 + 20.0d0*v217 + &
      v339*v9 + 720.0d0*(L_xxx + v204) + 6.0d0*(v212 + v221) + 15.0d0*( &
      v216 + v218)
    Ls_xxx       = 0.00138888888888889d0*(v208 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 &
      + v214 + 20.0d0*v217 + 6.0d0*(v212 + v221) + 15.0d0*(v216 + v218 &
      )) + L_xxx + L_xxxxxxxxx*v206 + v0*v124 + v141*v223 + v204 + v215 &
      *v9 + v219*v43 + v222*v81 + v224*v226
    v297         = L_xxyzzzzzz*v213
    v333         = v297 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 + 6.0d0*(120.0d0*L_xxy &
      + 120.0d0*v291 + v296)
    v334         = v333*y
    v445         = v292 + v333 + v11*v339 + 20.0d0*v299 + 6.0d0*v302 + 15.0d0*(v298 + v300)
    Ls_xxy       = 0.00138888888888889d0*(v292 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 &
      + v297 + 20.0d0*v299 + 6.0d0*(v296 + v302) + 15.0d0*(v298 + v300 &
      )) + L_xxxxxxxxy*v206 + L_xxy + v11*v215 + v114*v222 + v124*v2 + &
      v194*v223 + v219*v60 + v224*v303 + v291
    v347         = L_xxzzzzzzz*v213
    v501         = v342 + v347 + v242*v339 + 360.0d0*v343 + 120.0d0*v344 + 30.0d0*v345 + &
      20.0d0*v349 + 720.0d0*(L_xxz + v341) + 6.0d0*(v346 + v352) + &
      15.0d0*(v348 + v350)
    Ls_xxz       = 0.00138888888888889d0*(v342 + 360.0d0*v343 + 120.0d0*v344 + 30.0d0*v345 &
      + v347 + 20.0d0*v349 + 6.0d0*(v346 + v352) + 15.0d0*(v348 + v350 &
      )) + L_xxxxxxxxz*v206 + L_xxz + v124*v24 + v150*v222 + v215*v242 &
      + v219*v88 + v223*v237 + v224*v353 + v341
    v413         = L_xyyzzzzzz*v213
    v443         = v413 + 360.0d0*v409 + 120.0d0*v410 + 30.0d0*v411 + 6.0d0*(120.0d0*L_xyy &
      + 120.0d0*v407 + v412)
    v444         = v443*y
    v477         = v19*v443
    Ls_xyy       = 0.00138888888888889d0*(v408 + 360.0d0*v409 + 120.0d0*v410 + 30.0d0*v411 &
      + v413 + 20.0d0*v415 + 6.0d0*(v412 + v418) + 15.0d0*(v414 + v416 &
      )) + L_xxxxxxxyy*v206 + L_xyy + v101*v219 + v124*v4 + v13*v215 + &
      v176*v222 + v223*v281 + v224*v419 + v407
    v452         = L_xyzzzzzzz*v213
    v499         = v452 + 360.0d0*v448 + 120.0d0*v449 + 30.0d0*v450 + 6.0d0*(120.0d0*L_xyz &
      + 120.0d0*v446 + v451)
    v500         = v499*y
    Ls_xyz       = 0.00138888888888889d0*(v447 + 360.0d0*v448 + 120.0d0*v449 + 30.0d0*v450 &
      + v452 + 20.0d0*v454 + 6.0d0*(v451 + v457) + 15.0d0*(v453 + v455 &
      )) + L_xxxxxxxyz*v206 + L_xyz + v121*v219 + v124*v30 + v203*v222 &
      + v215*v358 + v223*v314 + v224*v458 + v446
    v542         = L_yyyzzzzzz*v213
    v566         = v542 + 360.0d0*v538 + 120.0d0*v539 + 30.0d0*v540 + 6.0d0*(120.0d0*L_yyy &
      + 120.0d0*v537 + v541)
    Ls_yyy       = 0.00138888888888889d0*(360.0d0*v538 + 120.0d0*v539 + 30.0d0*v540 + 6.0d0 &
      *v541 + v542) + L_xxxxxxyyy*v206 + L_yyy + L_yyyyyyyyy*v327 + &
      v124*v6 + v15*v215 + v163*v219 + v222*v263 + v223*v397 + v224*( &
      v13*v225 + v388 + 10.0d0*v393 + 10.0d0*v394 + 5.0d0*v396 + v417) &
      + v509*v543 + v518*v544 + v531*v545 + v537 + v546*v547
    v572         = L_yyzzzzzzz*v213
    v597         = v572 + 360.0d0*v568 + 120.0d0*v569 + 30.0d0*v570 + 6.0d0*(120.0d0*L_yyz &
      + 120.0d0*v567 + v571)
    Ls_yyz       = 0.00138888888888889d0*(360.0d0*v568 + 120.0d0*v569 + 30.0d0*v570 + 6.0d0 &
      *v571 + v572) + L_xxxxxxyyz*v206 + L_yyyyyyyyz*v327 + L_yyz + &
      v124*v53 + v183*v219 + v215*v504 + v222*v290 + v223*v430 + v224*( &
      v225*v358 + v421 + 10.0d0*v426 + 10.0d0*v427 + 5.0d0*v429 + v456 &
      ) + v522*v543 + v536*v544 + v545*v553 + v546*v573 + v567
    c7           = c3*c4
    v325         = c7
    v603         = 0.000198412698412698d0*v325
    v468         = L_xzzzzzzz*v325
    v581         = L_yzzzzzzz*v325
    v326         = L_xxzzzzzzz*v325
    v486         = v319 + v326 + v11*v485 + 2520.0d0*v320 + 840.0d0*v321 + 210.0d0*v322 + &
      42.0d0*v323 + 5040.0d0*(L_xx + v315) + 7.0d0*(v324 + v334) + &
      21.0d0*(v328 + v332) + 35.0d0*(v329 + v330)
    Ls_xx        = 0.000198412698412698d0*(v319 + 2520.0d0*v320 + 840.0d0*v321 + 210.0d0* &
      v322 + 42.0d0*v323 + v326 + 7.0d0*(v324 + v334) + 21.0d0*(v328 + &
      v332) + 35.0d0*(v329 + v330)) + L_xx + L_xxxxxxxxx*v317 + v0*v206 &
      + v11*v327 + v141*v336 + v226*v337 + v315 + v331*v43 + v335*v81 + &
      v338*v340
    v438         = L_xyzzzzzzz*v325
    v478         = v438 + 2520.0d0*v433 + 840.0d0*v434 + 210.0d0*v435 + 42.0d0*v436 + 7.0d0 &
      *(720.0d0*L_xy + 720.0d0*v431 + v437)
    v479         = v478*y
    Ls_xy        = 0.000198412698412698d0*(v432 + 2520.0d0*v433 + 840.0d0*v434 + 210.0d0* &
      v435 + 42.0d0*v436 + v438 + 7.0d0*(v437 + v444) + 21.0d0*(v439 + &
      v442) + 35.0d0*(v440 + v441)) + L_xxxxxxxxy*v317 + L_xy + v114* &
      v335 + v13*v327 + v194*v336 + v2*v206 + v303*v337 + v331*v60 + &
      v338*v445 + v431
    v494         = L_xzzzzzzzz*v325
    Ls_xz        = 0.000198412698412698d0*(v488 + 2520.0d0*v489 + 840.0d0*v490 + 210.0d0* &
      v491 + 42.0d0*v492 + v494 + 7.0d0*(v493 + v500) + 21.0d0*(v495 + &
      v498) + 35.0d0*(v496 + v497)) + L_xxxxxxxxz*v317 + L_xz + v150* &
      v335 + v206*v24 + v237*v336 + v327*v358 + v331*v88 + v337*v353 + &
      v338*v501 + v487
    v560         = L_yyzzzzzzz*v325
    v589         = v560 + 2520.0d0*v555 + 840.0d0*v556 + 210.0d0*v557 + 42.0d0*v558 + 7.0d0 &
      *(720.0d0*L_yy + 720.0d0*v554 + v559)
    Ls_yy        = 0.000198412698412698d0*(2520.0d0*v555 + 840.0d0*v556 + 210.0d0*v557 + &
      42.0d0*v558 + 7.0d0*v559 + v560) + L_xxxxxxxyy*v317 + L_yy + &
      L_yyyyyyyyy*v471 + v101*v331 + v15*v327 + v176*v335 + v206*v4 + &
      v281*v336 + v337*v419 + v338*(v13*v339 + v408 + 15.0d0*v414 + &
      20.0d0*v415 + 15.0d0*v416 + 6.0d0*v418 + v443) + v509*v561 + v518 &
      *v562 + v531*v563 + v547*v564 + v554 + v565*v566
    v596         = L_yzzzzzzzz*v325
    Ls_yz        = 0.000198412698412698d0*(2520.0d0*v591 + 840.0d0*v592 + 210.0d0*v593 + &
      42.0d0*v594 + 7.0d0*v595 + v596) + L_xxxxxxxyz*v317 + L_yyyyyyyyz &
      *v471 + L_yz + v121*v331 + v203*v335 + v206*v30 + v314*v336 + &
      v327*v504 + v337*v458 + v338*(v339*v358 + v447 + 15.0d0*v453 + &
      20.0d0*v454 + 15.0d0*v455 + 6.0d0*v457 + v499) + v522*v561 + v536 &
      *v562 + v553*v563 + v564*v573 + v565*v597 + v590
    c8           = c4*c4
    v469         = c8
    v604         = 2.48015873015873d-5*v469
    v470         = L_xzzzzzzzz*v469
    Ls_x         = 2.48015873015873d-5*(v462 + 20160.0d0*v463 + 6720.0d0*v464 + 1680.0d0* &
      v465 + 336.0d0*v466 + v470 + 70.0d0*v474 + 8.0d0*(v468 + v479) + &
      28.0d0*(v472 + v477) + 56.0d0*(v467 + v473 + v476)) + L_x + &
      L_xxxxxxxxx*v460 + v0*v317 + v13*v471 + v141*v481 + v226*v482 + &
      v340*v483 + v43*v475 + v459 + v480*v81 + v484*v486
    v582         = L_yzzzzzzzz*v469
    Ls_y         = 2.48015873015873d-5*(20160.0d0*v576 + 6720.0d0*v577 + 1680.0d0*v578 + &
      336.0d0*v579 + 56.0d0*v580 + 8.0d0*v581 + v582) + L_xxxxxxxxy* &
      v460 + L_y + L_yyyyyyyyy*v575 + v114*v480 + v15*v471 + v194*v481 &
      + v2*v317 + v303*v482 + v445*v483 + v475*v60 + v484*(v13*v485 + &
      v432 + 21.0d0*v439 + 35.0d0*v440 + 35.0d0*v441 + 21.0d0*v442 + &
      7.0d0*v444 + v478) + v509*v583 + v518*v584 + v531*v585 + v547* &
      v586 + v566*v587 + v574 + v588*v589
    Ls_z         = L_z + L_xxxxxxxxz*v460 + L_yyyyyyyyz*v575 + L_zz*z + L_zzz*v598 + L_zzzz &
      *v599 + L_zzzzz*v600 + L_zzzzzz*v601 + L_zzzzzzz*v602 + &
      L_zzzzzzzz*v603 + L_zzzzzzzzz*v604 + v150*v480 + v237*v481 + v24* &
      v317 + v353*v482 + v471*v504 + v475*v88 + v483*v501 + v484*( &
      5040.0d0*L_xz + v358*v485 + 5040.0d0*v487 + v488 + 2520.0d0*v489 &
      + 840.0d0*v490 + 210.0d0*v491 + 42.0d0*v492 + 7.0d0*v493 + v494 + &
      21.0d0*v495 + 35.0d0*v496 + 35.0d0*v497 + 21.0d0*v498 + 7.0d0* &
      v500) + v522*v583 + v536*v584 + v553*v585 + v573*v586 + v587*v597 &
      + v588*(5040.0d0*L_yz + 5040.0d0*v590 + 2520.0d0*v591 + 840.0d0* &
      v592 + 210.0d0*v593 + 42.0d0*v594 + 7.0d0*v595 + v596)
    c9           = c4*c5
    Ls_0         = 2.75573192239859d-6*(L_xxxxxxxxx*a9 + L_yyyyyyyyy*b9 + L_zzzzzzzzz*c9 + &
      9.0d0*(x*(40320.0d0*L_x + 8.0d0*v13*v318 + 40320.0d0*v459 + v462 &
      + 20160.0d0*v463 + 6720.0d0*v464 + 1680.0d0*v465 + 336.0d0*v466 + &
      56.0d0*v467 + 8.0d0*v468 + v470 + 28.0d0*v472 + 56.0d0*v473 + &
      70.0d0*v474 + 56.0d0*v476 + 28.0d0*v477 + 8.0d0*v479) + y*( &
      40320.0d0*L_y + 40320.0d0*v574 + 20160.0d0*v576 + 6720.0d0*v577 + &
      1680.0d0*v578 + 336.0d0*v579 + 56.0d0*v580 + 8.0d0*v581 + v582)) &
      + 126.0d0*(v123*v141 + v125*v531 + v226*v66 + v547*v68) + 36.0d0* &
      (v17*v486 + v19*v589 + v316*v43 + v318*v509) + 84.0d0*(v205*v81 + &
      v207*v518 + v32*v340 + v34*v566)) + L_0 + L_z*z + L_zz*v598 + &
      L_zzz*v599 + L_zzzz*v600 + L_zzzzz*v601 + L_zzzzzz*v602 + &
      L_zzzzzzz*v603 + L_zzzzzzzz*v604 + v0*v460 + v15*v575
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  y                   
#undef  Ls_0                
#undef  L_0                 
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
#undef  L_xy                
#undef  Ls_xy               
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
#undef  L_xxxz              
#undef  Ls_xxxz             
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
#undef  L_xxxxy             
#undef  Ls_xxxxy            
#undef  L_xxxxz             
#undef  Ls_xxxxz            
#undef  Ls_xxxyy            
#undef  L_xxxyy             
#undef  L_xxxyz             
#undef  Ls_xxxyz            
#undef  Ls_xxyyy            
#undef  L_xxyyy             
#undef  Ls_xxyyz            
#undef  L_xxyyz             
#undef  L_xyyyy             
#undef  Ls_xyyyy            
#undef  Ls_xyyyz            
#undef  L_xyyyz             
#undef  L_yyyyy             
#undef  Ls_yyyyy            
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
#undef  L_xxxxyz            
#undef  Ls_xxxxyz           
#undef  L_xxxyyy            
#undef  Ls_xxxyyy           
#undef  Ls_xxxyyz           
#undef  L_xxxyyz            
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  L_xyyyyy            
#undef  Ls_xyyyyy           
#undef  Ls_xyyyyz           
#undef  L_xyyyyz            
#undef  L_yyyyyy            
#undef  Ls_yyyyyy           
#undef  Ls_yyyyyz           
#undef  L_yyyyyz            
#undef  L_xxxxxxx           
#undef  Ls_xxxxxxx          
#undef  Ls_xxxxxxy          
#undef  L_xxxxxxy           
#undef  Ls_xxxxxxz          
#undef  L_xxxxxxz           
#undef  Ls_xxxxxyy          
#undef  L_xxxxxyy           
#undef  L_xxxxxyz           
#undef  Ls_xxxxxyz          
#undef  Ls_xxxxyyy          
#undef  L_xxxxyyy           
#undef  Ls_xxxxyyz          
#undef  L_xxxxyyz           
#undef  Ls_xxxyyyy          
#undef  L_xxxyyyy           
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
#undef  L_yyyyyyz           
#undef  Ls_yyyyyyz          
#undef  L_xxxxxxxx          
#undef  Ls_xxxxxxxx         
#undef  L_xxxxxxxy          
#undef  Ls_xxxxxxxy         
#undef  L_xxxxxxxz          
#undef  Ls_xxxxxxxz         
#undef  L_xxxxxxyy          
#undef  Ls_xxxxxxyy         
#undef  Ls_xxxxxxyz         
#undef  L_xxxxxxyz          
#undef  Ls_xxxxxyyy         
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  Ls_xxxxxyyz         
#undef  L_xxxxyyyy          
#undef  Ls_xxxxyyyy         
#undef  L_xxxxyyyz          
#undef  Ls_xxxxyyyz         
#undef  L_xxxyyyyy          
#undef  Ls_xxxyyyyy         
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
#undef  L_xxxxxxxxx         
#undef  Ls_xxxxxxxxx        
#undef  L_xxxxxxxxy         
#undef  Ls_xxxxxxxxy        
#undef  Ls_xxxxxxxxz        
#undef  L_xxxxxxxxz         
#undef  L_xxxxxxxyy         
#undef  Ls_xxxxxxxyy        
#undef  Ls_xxxxxxxyz        
#undef  L_xxxxxxxyz         
#undef  L_xxxxxxyyy         
#undef  Ls_xxxxxxyyy        
#undef  Ls_xxxxxxyyz        
#undef  L_xxxxxxyyz         
#undef  Ls_xxxxxyyyy        
#undef  L_xxxxxyyyy         
#undef  L_xxxxxyyyz         
#undef  Ls_xxxxxyyyz        
#undef  Ls_xxxxyyyyy        
#undef  L_xxxxyyyyy         
#undef  L_xxxxyyyyz         
#undef  Ls_xxxxyyyyz        
#undef  L_xxxyyyyyy         
#undef  Ls_xxxyyyyyy        
#undef  L_xxxyyyyyz         
#undef  Ls_xxxyyyyyz        
#undef  Ls_xxyyyyyyy        
#undef  L_xxyyyyyyy         
#undef  Ls_xxyyyyyyz        
#undef  L_xxyyyyyyz         
#undef  Ls_xyyyyyyyy        
#undef  L_xyyyyyyyy         
#undef  Ls_xyyyyyyyz        
#undef  L_xyyyyyyyz         
#undef  Ls_yyyyyyyyy        
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
#undef  Ls_yyyyyyyyz        
    end subroutine mom_es_L2L2_add
#endif
end module mom9
