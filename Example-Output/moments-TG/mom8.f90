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
        
    
! OPS  2*ADD + 2*DIV + 304*MUL + POW = 309  (813 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, b1, b2, b3, b4, b5, b6, b7,&
                b8, c1, c2, c3, c4, c5, c6, c7, c8, u10, u11, u12, u13, u14,&
                u15, u16, u17, u2, u3, u4, u5, u6, u7, u8, u9, v0, v1, v10,&
                v100, v101, v102, v103, v104, v105, v106, v107, v108, v109,&
                v11, v110, v111, v112, v113, v12, v13, v14, v15, v16, v17,&
                v18, v19, v2, v20, v21, v22, v23, v24, v25, v26, v27, v28,&
                v29, v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4,&
                v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50,&
                v51, v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61,&
                v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72,&
                v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83,&
                v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94,&
                v95, v96, v97, v98, v99, h, u
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
    v98        = W*y
    v99        = W*z
    v100       = 0.5d0*W
    v101       = 0.166666666666667d0*W
    v102       = 0.0416666666666667d0*W
    v105       = 0.00833333333333333d0*W
    v108       = 0.00138888888888889d0*W
    v111       = 0.000198412698412698d0*W
    v0         = W*x
    v1         = v98
    v2         = v99
    v3         = v100
    v5         = v0*y
    v6         = v0*z
    v8         = v1*z
    v10        = v101
    v13        = v100*x
    v18        = v102
    v22        = v101*x
    v29        = v105
    v36        = v102*x
    v45        = v108
    v54        = v105*x
    v64        = v111
    v76        = v108*x
    v87        = 2.48015873015873d-5*W
    v97        = v111*x
    M_0        = W
    M_x        = v0
    M_y        = v1
    M_z        = v2
    M_xy       = v5
    M_xz       = v6
    M_yz       = v8
    M_xyz      = v5*z
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v4         = a2
    v103       = W*v4
    v12        = 0.5d0*v4
    v21        = 0.25d0*v103
    v33        = 0.0833333333333333d0*v103
    v34        = v4*v99
    v35        = v4*v98
    v52        = 0.0208333333333333d0*v103
    v72        = 0.00416666666666667d0*v103
    v73        = v102*v4
    v96        = 0.000694444444444444d0*v103
    M_xx       = v3*v4
    M_xxy      = v1*v12
    M_xxz      = v12*v2
    M_xxyz     = v12*v8
    a3         = a1*a2
    v11        = a3
    v106       = W*v11
    v20        = 0.166666666666667d0*v11
    v32        = 0.0833333333333333d0*v106
    v49        = 0.0277777777777778d0*v106
    v50        = v11*v99
    v51        = v11*v98
    v71        = 0.00694444444444444d0*v106
    v94        = v108*v11
    v95        = 0.0138888888888889d0*v106
    M_xxx      = v10*v11
    M_xxxy     = v1*v20
    M_xxxz     = v2*v20
    M_xxxyz    = v20*v8
    a4         = a2*a2
    v19        = a4
    v109       = W*v19
    v31        = 0.0416666666666667d0*v19
    v48        = 0.0208333333333333d0*v109
    v68        = 0.00694444444444444d0*v109
    v69        = v19*v99
    v70        = v19*v98
    v92        = 0.00173611111111111d0*v109
    M_xxxx     = v18*v19
    M_xxxxy    = v1*v31
    M_xxxxz    = v2*v31
    M_xxxxyz   = v31*v8
    a5         = a2*a3
    v30        = a5
    v112       = 0.00416666666666667d0*v30
    v47        = 0.00833333333333333d0*v30
    v67        = W*v112
    v90        = v108*v30
    v91        = v112
    M_xxxxx    = v29*v30
    M_xxxxxy   = v1*v47
    M_xxxxxz   = v2*v47
    M_xxxxxyz  = v47*v8
    a6         = a3*a3
    v46        = a6
    v66        = 0.00138888888888889d0*v46
    v89        = 0.000694444444444444d0*W*v46
    M_xxxxxx   = v45*v46
    M_xxxxxxy  = v1*v66
    M_xxxxxxz  = v2*v66
    M_xxxxxxyz = v66*v8
    a7         = a3*a4
    v65        = a7
    v88        = 0.000198412698412698d0*v65
    M_xxxxxxx  = v64*v65
    M_xxxxxxxy = v1*v88
    M_xxxxxxxz = v2*v88
    a8         = a4*a4
    M_xxxxxxxx = a8*v87
    b2         = b1*b1
    v7         = b2
    v104       = W*v7
    v15        = 0.5d0*v7
    v26        = v104
    v37        = v104*x
    v53        = v104*v4
    M_yy       = v3*v7
    M_xyy      = v13*v7
    M_yyz      = v15*v2
    M_xxyy     = v21*v7
    M_xyyz     = v15*v6
    M_xxxyy    = v32*v7
    M_xxyyz    = 0.25d0*v34*v7
    M_xxxxyy   = v48*v7
    M_xxxyyz   = 0.0833333333333333d0*v50*v7
    M_xxxxxyy  = v67*v7
    M_xxxxyyz  = 0.0208333333333333d0*v69*v7
    M_xxxxxxyy = v7*v89
    M_xxxxxyyz = v104*v91*z
    b3         = b1*b2
    v14        = b3
    v107       = W*v14
    v24        = 0.166666666666667d0*v14
    v41        = v107
    v55        = v107*x
    M_yyy      = v10*v14
    M_xyyy     = v14*v22
    M_yyyz     = v2*v24
    M_xxyyy    = v14*v33
    M_xyyyz    = v24*v6
    M_xxxyyy   = v14*v49
    M_xxyyyz   = 0.0833333333333333d0*v14*v34
    M_xxxxyyy  = v14*v68
    M_xxxyyyz  = 0.0277777777777778d0*v14*v50
    M_xxxxxyyy = v14*v90
    M_xxxxyyyz = 0.00694444444444444d0*v14*v69
    b4         = b2*b2
    v23        = b4
    v110       = W*v23
    v39        = 0.0416666666666667d0*v23
    v59        = v110
    v77        = v110*x
    M_yyyy     = v18*v23
    M_xyyyy    = v23*v36
    M_yyyyz    = v2*v39
    M_xxyyyy   = v23*v52
    M_xyyyyz   = v39*v6
    M_xxxyyyy  = v23*v71
    M_xxyyyyz  = 0.0208333333333333d0*v23*v34
    M_xxxxyyyy = v23*v92
    M_xxxyyyyz = 0.00694444444444444d0*v23*v50
    b5         = b2*b3
    v38        = b5
    v57        = 0.00833333333333333d0*v38
    v80        = 0.00416666666666667d0*v38
    M_yyyyy    = v29*v38
    M_xyyyyy   = v38*v54
    M_yyyyyz   = v2*v57
    M_xxyyyyy  = v38*v72
    M_xyyyyyz  = v57*v6
    M_xxxyyyyy = v38*v94
    M_xxyyyyyz = v34*v80
    b6         = b3*b3
    v56        = b6
    v79        = 0.00138888888888889d0*v56
    M_yyyyyy   = v45*v56
    M_xyyyyyy  = v56*v76
    M_yyyyyyz  = v2*v79
    M_xxyyyyyy = v56*v96
    M_xyyyyyyz = v6*v79
    b7         = b3*b4
    v78        = b7
    M_yyyyyyy  = v64*v78
    M_xyyyyyyy = v78*v97
    M_yyyyyyyz = 0.000198412698412698d0*v2*v78
    b8         = b4*b4
    M_yyyyyyyy = b8*v87
    c2         = c1*c1
    v9         = c2
    v113       = W*v9
    v16        = 0.5d0*v9
    v25        = 0.25d0*v9
    v40        = 0.0833333333333333d0*v9
    v58        = 0.0208333333333333d0*v9
    v74        = v14*v9
    v81        = v113
    v93        = 0.0104166666666667d0*v9
    M_zz       = v3*v9
    M_xzz      = v13*v9
    M_yzz      = v1*v16
    M_xxzz     = v21*v9
    M_xyzz     = v16*v5
    M_yyzz     = v25*v26
    M_xxxzz    = v32*v9
    M_xxyzz    = v25*v35
    M_xyyzz    = v25*v37
    M_yyyzz    = v40*v41
    M_xxxxzz   = v48*v9
    M_xxxyzz   = v40*v51
    M_xxyyzz   = 0.125d0*v53*v9
    M_xyyyzz   = v40*v55
    M_yyyyzz   = v58*v59
    M_xxxxxzz  = v67*v9
    M_xxxxyzz  = v58*v70
    M_xxxyyzz  = v11*v18*v7*v9
    M_xxyyyzz  = v73*v74
    M_xyyyyzz  = v58*v77
    M_yyyyyzz  = v80*v81
    M_xxxxxxzz = v89*v9
    M_xxxxxyzz = v113*v91*y
    M_xxxxyyzz = v104*v19*v93
    M_xxxyyyzz = v74*v95
    M_xxyyyyzz = v110*v4*v93
    M_xyyyyyzz = v113*v80*x
    M_yyyyyyzz = 0.000694444444444444d0*v56*v81
    h          = v4 + v7 + v9
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
    v17        = c3
    v27        = 0.166666666666667d0*v17
    v42        = 0.0833333333333333d0*v17
    v60        = 0.0277777777777778d0*v17
    v75        = v17*v7
    v82        = 0.00694444444444444d0*v17
    M_zzz      = v10*v17
    M_xzzz     = v17*v22
    M_yzzz     = v1*v27
    M_xxzzz    = v17*v33
    M_xyzzz    = v27*v5
    M_yyzzz    = v26*v42
    M_xxxzzz   = v17*v49
    M_xxyzzz   = v35*v42
    M_xyyzzz   = v37*v42
    M_yyyzzz   = v41*v60
    M_xxxxzzz  = v17*v68
    M_xxxyzzz  = v51*v60
    M_xxyyzzz  = v73*v75
    M_xyyyzzz  = v55*v60
    M_yyyyzzz  = v59*v82
    M_xxxxxzzz = v17*v90
    M_xxxxyzzz = v70*v82
    M_xxxyyzzz = v75*v95
    M_xxyyyzzz = 0.0138888888888889d0*v107*v17*v4
    M_xyyyyzzz = v77*v82
    M_yyyyyzzz = v17*v38*v45
    c4         = c2*c2
    v28        = c4
    v43        = 0.0416666666666667d0*v28
    v61        = 0.0208333333333333d0*v28
    v83        = 0.00694444444444444d0*v28
    M_zzzz     = v18*v28
    M_xzzzz    = v28*v36
    M_yzzzz    = v1*v43
    M_xxzzzz   = v28*v52
    M_xyzzzz   = v43*v5
    M_yyzzzz   = v26*v61
    M_xxxzzzz  = v28*v71
    M_xxyzzzz  = v35*v61
    M_xyyzzzz  = v37*v61
    M_yyyzzzz  = v41*v83
    M_xxxxzzzz = v28*v92
    M_xxxyzzzz = v51*v83
    M_xxyyzzzz = 0.0104166666666667d0*v28*v53
    M_xyyyzzzz = v55*v83
    M_yyyyzzzz = 0.00173611111111111d0*v28*v59
    c5         = c2*c3
    v44        = c5
    v62        = 0.00833333333333333d0*v44
    v84        = 0.00416666666666667d0*v44
    M_zzzzz    = v29*v44
    M_xzzzzz   = v44*v54
    M_yzzzzz   = v1*v62
    M_xxzzzzz  = v44*v72
    M_xyzzzzz  = v5*v62
    M_yyzzzzz  = v26*v84
    M_xxxzzzzz = v44*v94
    M_xxyzzzzz = v35*v84
    M_xyyzzzzz = v37*v84
    M_yyyzzzzz = v14*v44*v45
    c6         = c3*c3
    v63        = c6
    v85        = 0.00138888888888889d0*v63
    M_zzzzzz   = v45*v63
    M_xzzzzzz  = v63*v76
    M_yzzzzzz  = v1*v85
    M_xxzzzzzz = v63*v96
    M_xyzzzzzz = v5*v85
    M_yyzzzzzz = 0.000694444444444444d0*v26*v63
    c7         = c3*c4
    v86        = c7
    M_zzzzzzz  = v64*v86
    M_xzzzzzzz = v86*v97
    M_yzzzzzzz = 0.000198412698412698d0*v1*v86
    c8         = c4*c4
    M_zzzzzzzz = c8*v87
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
    end subroutine mom_es_P2M
    
! OPS  2289*ADD + 2*DIV + 2417*MUL + POW = 4709  (11633 before optimization)
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
                v700, v701, v702, v703, v704, v71, v72, v73, v74, v75, v76,&
                v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87,&
                v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98,&
                v99, h, u
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
#define M_xxyyz              M(42)
#define Ms_xxyyz             Ms(42)
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
#define Ms_xxxxxyz           Ms(88)
#define M_xxxxxyz            M(88)
#define Ms_xxxxxzz           Ms(89)
#define M_xxxxxzz            M(89)
#define Ms_xxxxyyy           Ms(90)
#define M_xxxxyyy            M(90)
#define Ms_xxxxyyz           Ms(91)
#define M_xxxxyyz            M(91)
#define M_xxxxyzz            M(92)
#define Ms_xxxxyzz           Ms(92)
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
#define Ms_xxxxyyyz          Ms(131)
#define M_xxxxyyyz           M(131)
#define M_xxxxyyzz           M(132)
#define Ms_xxxxyyzz          Ms(132)
#define Ms_xxxxyzzz          Ms(133)
#define M_xxxxyzzz           M(133)
#define Ms_xxxxzzzz          Ms(134)
#define M_xxxxzzzz           M(134)
#define M_xxxyyyyy           M(135)
#define Ms_xxxyyyyy          Ms(135)
#define M_xxxyyyyz           M(136)
#define Ms_xxxyyyyz          Ms(136)
#define Ms_xxxyyyzz          Ms(137)
#define M_xxxyyyzz           M(137)
#define M_xxxyyzzz           M(138)
#define Ms_xxxyyzzz          Ms(138)
#define Ms_xxxyzzzz          Ms(139)
#define M_xxxyzzzz           M(139)
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
#define M_xyyyyyyy           M(148)
#define Ms_xyyyyyyy          Ms(148)
#define M_xyyyyyyz           M(149)
#define Ms_xyyyyyyz          Ms(149)
#define M_xyyyyyzz           M(150)
#define Ms_xyyyyyzz          Ms(150)
#define M_xyyyyzzz           M(151)
#define Ms_xyyyyzzz          Ms(151)
#define M_xyyyzzzz           M(152)
#define Ms_xyyyzzzz          Ms(152)
#define M_xyyzzzzz           M(153)
#define Ms_xyyzzzzz          Ms(153)
#define Ms_xyzzzzzz          Ms(154)
#define M_xyzzzzzz           M(154)
#define M_xzzzzzzz           M(155)
#define Ms_xzzzzzzz          Ms(155)
#define Ms_yyyyyyyy          Ms(156)
#define M_yyyyyyyy           M(156)
#define Ms_yyyyyyyz          Ms(157)
#define M_yyyyyyyz           M(157)
#define M_yyyyyyzz           M(158)
#define Ms_yyyyyyzz          Ms(158)
#define Ms_yyyyyzzz          Ms(159)
#define M_yyyyyzzz           M(159)
#define Ms_yyyyzzzz          Ms(160)
#define M_yyyyzzzz           M(160)
#define M_yyyzzzzz           M(161)
#define Ms_yyyzzzzz          Ms(161)
#define Ms_yyzzzzzz          Ms(162)
#define M_yyzzzzzz           M(162)
#define M_yzzzzzzz           M(163)
#define Ms_yzzzzzzz          Ms(163)
#define M_zzzzzzzz           M(164)
#define Ms_zzzzzzzz          Ms(164)
    v654        = 0.0416666666666667d0*M_0
    v673        = 0.00138888888888889d0*M_0
    v693        = 0.000694444444444444d0*M_0
    v0          = M_0*x
    v1          = M_x + v0
    v2          = M_0*y
    v3          = M_y + v2
    v4          = M_0*z + M_z
    v5          = M_x*x
    v6          = M_xx + v5
    v7          = 0.5d0*M_0
    v9          = M_y*x
    v10         = M_xy + v9
    v11         = M_x*y
    v12         = v0*y
    v13         = v10 + v11 + v12
    v14         = M_z*x
    v15         = M_xz + v14
    v16         = M_x*z
    v17         = v0*z + v15 + v16
    v18         = M_y*y
    v19         = M_yy + v18
    v21         = M_z*y
    v22         = M_yz + v21
    v23         = M_y*z
    v24         = v2*z + v22 + v23
    v25         = M_z*z
    v26         = M_zz + v25
    v28         = M_xx*x
    v29         = M_xxx + v28
    v30         = 0.166666666666667d0*M_0
    v33         = M_xy*x
    v34         = M_xxy + v33
    v35         = M_xx*y
    v36         = v5*y
    v37         = v34 + v35 + v36
    v38         = M_xz*x
    v39         = M_xxz + v38
    v40         = M_xx*z
    v41         = v5*z
    v42         = v39 + v40 + v41
    v44         = M_yy*x
    v45         = M_xyy + v44
    v46         = M_xy*y
    v47         = v9*y
    v48         = v45 + v46 + v47
    v49         = M_xy*z
    v50         = v9*z
    v51         = v49 + v50
    v52         = M_xz*y
    v697        = M_xyz + v52
    v53         = M_yz*x
    v54         = v11*z
    v55         = v14*y
    v668        = v53 + v55
    v57         = M_zz*x
    v58         = M_xzz + v57
    v59         = M_xz*z
    v60         = v14*z
    v61         = v58 + v59 + v60
    v62         = M_yy*y
    v63         = M_yyy + v62
    v65         = M_yz*y
    v66         = M_yyz + v65
    v67         = M_yy*z
    v68         = v18*z
    v69         = v66 + v67 + v68
    v70         = M_zz*y
    v71         = M_yzz + v70
    v72         = M_yz*z
    v73         = v21*z
    v74         = v71 + v72 + v73
    v75         = M_zz*z
    v76         = M_zzz + v75
    v78         = M_xxx*x
    v79         = v654
    v82         = M_xxy*x
    v83         = M_xxxy + v82
    v84         = M_xxx*y
    v85         = v28*y
    v86         = v83 + v84 + v85
    v87         = M_xy + v11
    v88         = M_xxz*x
    v89         = M_xxxz + v88
    v90         = M_xxx*z
    v91         = v28*z
    v92         = v89 + v90 + v91
    v93         = M_xz + v16
    v94         = M_xyy*x
    v95         = M_xxyy + v94
    v96         = M_xxy*y
    v97         = v33*y
    v98         = v95 + v96 + v97
    v101        = 0.25d0*M_0
    v103        = M_xxy*z
    v104        = v35*z
    v105        = v103 + v104
    v106        = M_xxz*y
    v699        = M_xxyz + v106
    v107        = M_xyz*x
    v108        = v33*z
    v688        = v107 + v108
    v109        = v38*y
    v110        = M_xzz*x
    v111        = M_xxzz + v110
    v112        = M_xxz*z
    v113        = v38*z
    v114        = v111 + v112 + v113
    v118        = M_yyy*x
    v119        = M_xyyy + v118
    v120        = M_xyy*y
    v121        = v44*y
    v122        = v119 + v120 + v121
    v124        = M_xyy*z
    v125        = v44*z
    v126        = v124 + v125
    v127        = M_xyz*y
    v128        = M_yyz*x
    v700        = M_xyyz + v128
    v129        = v46*z
    v685        = v127 + v129
    v130        = v53*y
    v131        = M_xyz*z
    v132        = v52*z
    v133        = v131 + v132
    v134        = M_xzz*y
    v701        = M_xyzz + v134
    v135        = M_yzz*x
    v136        = v53*z
    v137        = v57*y
    v678        = v135 + v137
    v138        = M_zzz*x
    v139        = M_xzzz + v138
    v140        = M_xzz*z
    v141        = v57*z
    v142        = v139 + v140 + v141
    v144        = M_yyy*y
    v146        = M_yyz*y
    v147        = M_yyyz + v146
    v148        = M_yyy*z
    v149        = v62*z
    v150        = v147 + v148 + v149
    v151        = M_yz + v23
    v152        = M_yzz*y
    v153        = M_yyzz + v152
    v154        = M_yyz*z
    v155        = v65*z
    v156        = v153 + v154 + v155
    v160        = M_zzz*y
    v161        = M_yzzz + v160
    v162        = M_yzz*z
    v163        = v70*z
    v164        = v161 + v162 + v163
    v165        = M_zzz*z
    v167        = M_xxxx*x
    v168        = 0.00833333333333333d0*M_0
    v171        = M_xxxx*y
    v172        = M_xxxxy + v171
    v173        = M_xxxy*x
    v174        = v78*y
    v175        = M_xxy + v35
    v176        = M_xxxx*z
    v177        = M_xxxxz + v176
    v178        = M_xxxz*x
    v179        = v78*z
    v180        = M_xxz + v40
    v181        = M_xxxy*y
    v182        = M_xxxyy + v181
    v183        = M_xxyy*x
    v184        = v82*y
    v185        = 0.5d0*M_xxx
    v187        = 0.25d0*M_x
    v188        = M_xxxy*z
    v189        = M_xxxz*y
    v190        = v84*z + M_xxxyz + v188 + v189
    v191        = M_xxyz*x
    v192        = v82*z
    v193        = v88*y
    v194        = v697
    v195        = v49 + v54
    v196        = v194 + v195
    v197        = M_xxxz*z
    v198        = M_xxxzz + v197
    v199        = M_xxzz*x
    v200        = v88*z
    v201        = M_xyyy*x
    v202        = M_xxyyy + v201
    v203        = M_xxyy*y
    v204        = v94*y
    v207        = M_xxyy*z
    v208        = v96*z
    v209        = v94*z
    v666        = v207 + v209
    v210        = v97*z + v208 + v666
    v211        = M_xxyz*y
    v212        = M_xyyz*x
    v703        = M_xxyyz + v212
    v213        = v107*y
    v694        = v211 + v213
    v216        = M_xxyz*z
    v217        = v106*z
    v218        = v216 + v217
    v219        = M_xxzz*y
    v702        = M_xxyzz + v219
    v220        = M_xyzz*x
    v221        = v107*z
    v222        = v110*y
    v695        = v220 + v222
    v223        = v109*z
    v227        = M_xzzz*x
    v228        = M_xxzzz + v227
    v229        = M_xxzz*z
    v230        = v110*z
    v231        = M_yyyy*x
    v232        = M_xyyyy + v231
    v233        = M_xyyy*y
    v234        = v118*y
    v236        = M_xyyy*z
    v237        = M_yyyz*x
    v238        = v118*z + M_xyyyz + v236 + v237
    v239        = M_xyyz*y
    v240        = v120*z
    v241        = v128*y
    v242        = M_xyz + v53
    v243        = v242 + v51
    v244        = v128*z
    v245        = v130*z + v244
    v246        = M_xyyz*z
    v247        = M_xyzz*y
    v248        = M_yyzz*x
    v249        = v127*z
    v704        = v246 + v249
    v250        = v135*y
    v698        = v248 + v250
    v696        = v245 + v698
    v254        = M_xzzz*y
    v255        = M_yzzz*x
    v256        = v138*y
    v257        = M_xyzzz + v254 + v255 + v256
    v258        = M_xyzz*z
    v259        = v134*z
    v260        = v135*z
    v261        = v668
    v262        = v194 + v261
    v263        = M_zzzz*x
    v264        = M_xzzzz + v263
    v265        = M_xzzz*z
    v266        = v138*z
    v268        = M_yyyy*y
    v270        = M_yyyy*z
    v271        = M_yyyyz + v270
    v272        = M_yyyz*y
    v273        = v144*z
    v274        = M_yyz + v67
    v275        = M_yyyz*z
    v276        = M_yyyzz + v275
    v277        = M_yyzz*y
    v278        = v146*z
    v281        = M_yzzz*y
    v282        = M_yyzzz + v281
    v283        = M_yyzz*z
    v284        = v152*z
    v287        = M_zzzz*y
    v288        = M_yzzzz + v287
    v289        = M_yzzz*z
    v290        = v160*z
    v291        = M_zzzz*z
    v293        = M_xxxxx*x
    v294        = v673
    v297        = M_xxxxx*y
    v298        = M_xxxxxy + v297
    v299        = M_xxxxy*x
    v300        = v167*y
    v301        = M_xxxy + v84
    v302        = M_xxxxx*z
    v303        = M_xxxxxz + v302
    v304        = M_xxxxz*x
    v305        = v167*z
    v306        = M_xxxz + v90
    v307        = M_xxxxy*y
    v308        = M_xxxyy*x
    v309        = v173*y
    v310        = 0.5d0*M_xxxx
    v315        = M_xyy + v46
    v316        = M_xxxxy*z
    v317        = M_xxxxz*y
    v318        = v171*z + M_xxxxyz + v316 + v317
    v319        = M_xxxyz*x
    v320        = v173*z
    v321        = v178*y
    v322        = v699
    v323        = v105 + v322
    v324        = M_xxxxz*z
    v325        = M_xxxzz*x
    v326        = v178*z
    v327        = M_xzz + v59
    v328        = M_xxxyy*y
    v329        = M_xxyyy*x
    v330        = v183*y
    v331        = 0.166666666666667d0*M_xxx
    v332        = 0.5d0*M_xxxy
    v334        = v11 + v9
    v336        = M_xxxyy*z
    v337        = M_xxxyz*y
    v338        = M_xxyyz*x
    v339        = v181*z
    v340        = v183*z
    v341        = v191*y
    v342        = 0.5d0*M_xxxz
    v344        = M_xxxyz*z
    v345        = M_xxxzz*y
    v346        = M_xxyzz*x
    v347        = v189*z
    v348        = v191*z
    v349        = v199*y
    v351        = M_xxxzz*z
    v352        = M_xxzzz*x
    v353        = v199*z
    v354        = v14 + v16
    v356        = M_xxyyy*y
    v357        = M_xyyyy*x
    v358        = v201*y
    v362        = M_xxyyy*z
    v363        = M_xxyyz*y
    v364        = M_xyyyz*x
    v365        = v203*z
    v366        = v201*z
    v367        = v212*y
    v368        = M_xxyyz*z
    v369        = M_xxyzz*y
    v370        = M_xyyzz*x
    v371        = v211*z
    v372        = v212*z
    v373        = v220*y
    v379        = M_xxyzz*z
    v380        = M_xxzzz*y
    v381        = M_xyzzz*x
    v382        = v219*z
    v383        = v220*z
    v384        = v227*y
    v386        = M_xxzzz*z
    v387        = M_xzzzz*x
    v388        = v227*z
    v389        = M_yyyyy*x
    v390        = M_xyyyyy + v389
    v391        = M_xyyyy*y
    v392        = v231*y
    v394        = M_xyyyy*z
    v395        = M_yyyyz*x
    v396        = v231*z + M_xyyyyz + v394 + v395
    v397        = M_xyyyz*y
    v398        = v233*z
    v399        = v237*y
    v400        = v700
    v401        = v126 + v400
    v402        = M_xyyyz*z
    v403        = M_xyyzz*y
    v404        = M_yyyzz*x
    v405        = v239*z
    v406        = v237*z
    v407        = v248*y
    v409        = M_xyyzz*z
    v410        = M_xyzzz*y
    v411        = M_yyzzz*x
    v412        = v247*z
    v413        = v248*z
    v414        = v255*y
    v416        = M_xzzzz*y
    v417        = M_yzzzz*x
    v418        = v263*y
    v419        = M_xyzzzz + v416 + v417 + v418
    v420        = M_xyzzz*z
    v421        = v254*z
    v422        = v255*z
    v423        = v701
    v424        = v678
    v425        = v423 + v424
    v426        = M_zzzzz*x
    v427        = M_xzzzzz + v426
    v428        = M_xzzzz*z
    v429        = v263*z
    v431        = M_yyyyy*y
    v433        = M_yyyyy*z
    v434        = M_yyyyyz + v433
    v435        = M_yyyyz*y
    v436        = v268*z
    v437        = M_yyyz + v148
    v438        = M_yyyyz*z
    v439        = M_yyyzz*y
    v440        = v272*z
    v443        = M_yzz + v72
    v444        = M_yyyzz*z
    v445        = M_yyzzz*y
    v446        = v277*z
    v448        = v21 + v23
    v450        = M_yyzzz*z
    v451        = M_yzzzz*y
    v452        = v281*z
    v454        = M_zzzzz*y
    v455        = M_yzzzzz + v454
    v456        = M_yzzzz*z
    v457        = v287*z
    v458        = M_zzzzz*z
    v460        = M_xxxxxx*x
    v461        = 0.000198412698412698d0*M_0
    v464        = M_xxxxxx*y
    v465        = M_xxxxxy*x
    v466        = v293*y
    v467        = M_xxxxxz*x
    v468        = M_xxxxxy*y
    v469        = M_xxxxyy*x
    v470        = v299*y
    v471        = 0.5d0*M_xxxxx
    v475        = 0.25d0*M_xxx
    v476        = M_xxyy + v96
    v477        = M_xxxxxz*y
    v478        = M_xxxxyz*x
    v479        = v304*y
    v480        = M_xxxxzz*x
    v481        = M_xxzz + v112
    v482        = M_xxxxyy*y
    v483        = M_xxxyyy*x
    v484        = v308*y
    v485        = 0.166666666666667d0*M_xxxx
    v486        = 0.5d0*M_xxxxy
    v490        = M_xxxxyz*y
    v491        = M_xxxyyz*x
    v492        = v319*y
    v493        = 0.5d0*M_xxxxz
    v494        = M_xyyz + v124
    v495        = v685
    v496        = v494 + v495
    v497        = M_xxxxzz*y
    v498        = M_xxxyzz*x
    v499        = v325*y
    v501        = v133 + v423
    v502        = M_xxxzzz*x
    v503        = M_xxxyyy*y
    v504        = M_xxyyyy*x
    v505        = v329*y
    v506        = 0.166666666666667d0*M_xxxy
    v507        = 0.5d0*M_xxxyy
    v512        = M_xxxyyz*y
    v513        = M_xxyyyz*x
    v514        = v338*y
    v515        = 0.5d0*M_xxxyz
    v516        = 0.166666666666667d0*M_xxxz
    v517        = M_xxxyzz*y
    v518        = M_xxyyzz*x
    v519        = v346*y
    v520        = 0.5d0*M_xxxzz
    v525        = M_xxxzzz*y
    v526        = M_xxyzzz*x
    v527        = v352*y
    v529        = M_xxzzzz*x
    v530        = M_xxyyyy*y
    v531        = M_xyyyyy*x
    v532        = v357*y
    v536        = M_xxyyyz*y
    v537        = M_xyyyyz*x
    v538        = v364*y
    v539        = M_xxyz + v103
    v540        = v688
    v541        = v539 + v540
    v542        = M_xxyyzz*y
    v543        = M_xyyyzz*x
    v544        = v370*y
    v549        = M_xxyzzz*y
    v550        = M_xyyzzz*x
    v551        = v381*y
    v555        = M_xxzzzz*y
    v556        = M_xyzzzz*x
    v557        = v387*y
    v559        = v107 + v109
    v560        = v322 + v559
    v561        = M_xzzzzz*x
    v562        = M_xyyyyy*y
    v563        = M_yyyyyy*x
    v564        = v389*y
    v566        = M_xyyyyz*y
    v567        = M_yyyyyz*x
    v568        = v395*y
    v569        = M_xyyyzz*y
    v570        = M_yyyyzz*x
    v571        = v404*y
    v573        = M_xyzz + v135
    v574        = v131 + v136
    v575        = v573 + v574
    v576        = M_xyyzzz*y
    v577        = M_yyyzzz*x
    v578        = v411*y
    v580        = M_xyzzzz*y
    v581        = M_yyzzzz*x
    v582        = v417*y
    v584        = v127 + v130
    v585        = v400 + v584
    v586        = M_xzzzzz*y
    v587        = M_yzzzzz*x
    v588        = v426*y
    v589        = M_zzzzzz*x
    v591        = M_yyyyyy*y
    v593        = M_yyyyyz*y
    v594        = M_yyyyzz*y
    v598        = M_yyzz + v154
    v599        = M_yyyzzz*y
    v601        = M_yyzzzz*y
    v604        = M_yzzzzz*y
    v606        = M_zzzzzz*y
    v608        = 2.48015873015873d-5*M_0
    v610        = 0.5d0*M_xxxxxx
    v615        = 0.25d0*M_xxxx
    v616        = 0.166666666666667d0*M_xxxxx
    v617        = 0.5d0*M_xxxxxy
    v621        = 0.25d0*M_xxxy
    v623        = 0.5d0*M_xxxxxz
    v624        = v702
    v625        = 0.25d0*M_xxxz
    v627        = 0.0416666666666667d0*M_xxxx
    v628        = 0.166666666666667d0*M_xxxxy
    v629        = 0.5d0*M_xxxxyy
    v631        = 0.5d0*M_xxxxyz
    v632        = 0.166666666666667d0*M_xxxxz
    v633        = 0.5d0*M_xxxxzz
    v634        = 0.25d0*M_xxyy
    v635        = M_xyyzz + v247
    v636        = 0.166666666666667d0*M_xxxyy
    v637        = 0.5d0*M_xxxyyy
    v640        = 0.5d0*M_xxxyyz
    v641        = 0.166666666666667d0*M_xxxyz
    v642        = 0.5d0*M_xxxyzz
    v643        = 0.166666666666667d0*M_xxxzz
    v645        = 0.5d0*M_xxxzzz
    v650        = v703
    Ms_0        = M_0
    Ms_x        = v1
    Ms_y        = v3
    Ms_z        = v4
    Ms_xy       = v13
    Ms_xz       = v17
    Ms_yz       = v24
    Ms_xyz      = v12*z + v51 + v54 + v668 + v697
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v8          = a2
    v656        = M_yy*v8
    v658        = M_zz*v8
    v664        = M_0*v8
    v32         = 0.5d0*v8
    v100        = v656
    v116        = v658
    v205        = 0.0833333333333333d0*v664
    v215        = M_yyz*v8
    v225        = M_yzz*v8
    v314        = 0.25d0*v8
    v359        = 0.0208333333333333d0*v664
    v376        = v18*v8
    v377        = v25*v8
    v510        = M_x*v8
    v533        = 0.00416666666666667d0*v664
    v546        = v72*v8
    v553        = v65*v8
    v648        = v693*v8
    Ms_xx       = v6 + v7*v8
    Ms_xxy      = v3*v32 + v37
    Ms_xxz      = v32*v4 + v42
    Ms_xxyz     = v24*v32 + v36*z + v105 + v109 + v688 + v699
    a3          = a1*a2
    v31         = a3
    v663        = 0.0833333333333333d0*v31
    v686        = 0.00694444444444444d0*v31
    v81         = 0.166666666666667d0*v31
    v186        = M_0*v663
    v313        = M_x*v31
    v333        = 0.0277777777777778d0*M_0*v31
    v474        = v663
    v508        = M_0*v686
    v614        = M_xxx*v31
    v620        = M_xx*v31
    v638        = v31*v673
    v639        = v686
    Ms_xxx      = v29 + M_x*v32 + v30*v31
    Ms_xxxy     = v86 + v3*v81 + v32*v87
    Ms_xxxz     = v92 + v32*v93 + v4*v81
    Ms_xxxyz    = v196*v32 + v24*v81 + v85*z + v190 + v191 + v192 + v193
    a4          = a2*a2
    v80         = a4
    v674        = 0.0208333333333333d0*v80
    v683        = M_0*v80
    v170        = 0.0416666666666667d0*v80
    v311        = M_0*v674
    v473        = M_x*v80
    v487        = 0.00694444444444444d0*v683
    v613        = v674
    v630        = 0.00173611111111111d0*v683
    Ms_xxxx     = M_xxxx + v78 + M_x*v81 + M_xx*v32 + v79*v80
    Ms_xxxxy    = v172 + v173 + v174 + v170*v3 + v175*v32 + v81*v87
    Ms_xxxxz    = v177 + v178 + v179 + v170*v4 + v180*v32 + v81*v93
    Ms_xxxxyz   = v318 + v319 + v320 + v321 + v170*v24 + v174*z + v196*v81 + v32*v323
    a5          = a2*a3
    v169        = a5
    v682        = 0.00416666666666667d0*v169
    v296        = 0.00833333333333333d0*v169
    v472        = M_0*v682
    v612        = M_x*v682
    v618        = v169*v673
    v622        = v682
    Ms_xxxxx    = M_xxxxx + v167 + M_x*v170 + M_xx*v81 + M_xxx*v32 + v168*v169
    Ms_xxxxxy   = v298 + v299 + v300 + v170*v87 + v175*v81 + v296*v3 + v301*v32
    Ms_xxxxxz   = v303 + v304 + v305 + v170*v93 + v180*v81 + v296*v4 + v306*v32
    Ms_xxxxxyz  = M_xxxxxyz + v477 + v478 + v479 + M_xxxxxy*z + v170*v196 + v190*v32 + v24 &
      *v296 + v297*z + v299*z + v300*z + v323*v81
    a6          = a3*a3
    v295        = a6
    v463        = 0.00138888888888889d0*v295
    v611        = v295*v693
    Ms_xxxxxx   = M_xxxxxx + v293 + M_x*v296 + M_xx*v170 + M_xxx*v81 + M_xxxx*v32 + v294* &
      v295
    Ms_xxxxxxy  = M_xxxxxxy + v464 + v465 + v466 + v170*v175 + v172*v32 + v296*v87 + v3* &
      v463 + v301*v81
    Ms_xxxxxxz  = M_xxxxxxz + v467 + M_xxxxxx*z + v170*v180 + v177*v32 + v293*z + v296*v93 &
      + v306*v81 + v4*v463
    Ms_xxxxxxyz = M_xxxxxxyz + M_xxxxxxy*z + M_xxxxxxz*y + M_xxxxxyz*x + v170*v323 + v190* &
      v81 + v196*v296 + v24*v463 + v318*v32 + v464*z + v465*z + v466*z &
      + v467*y
    a7          = a3*a4
    v462        = a7
    v609        = 0.000198412698412698d0*v462
    Ms_xxxxxxx  = M_xxxxxxx + v460 + M_x*v463 + M_xx*v296 + M_xxx*v170 + M_xxxx*v81 + &
      M_xxxxx*v32 + v461*v462
    Ms_xxxxxxxy = M_xxxxxxxy + M_xxxxxxx*y + M_xxxxxxy*x + v170*v301 + v172*v81 + v175* &
      v296 + v298*v32 + v3*v609 + v460*y + v463*v87
    Ms_xxxxxxxz = M_xxxxxxxz + M_xxxxxxx*z + M_xxxxxxz*x + v170*v306 + v177*v81 + v180* &
      v296 + v303*v32 + v4*v609 + v460*z + v463*v93
    a8          = a4*a4
    Ms_xxxxxxxx = M_xxxxxxxx + M_x*v609 + M_xx*v463 + M_xxx*v296 + M_xxxx*v170 + M_xxxxx* &
      v81 + M_xxxxxx*v32 + M_xxxxxxx*x + a8*v608
    b2          = b1*b1
    v20         = b2
    v655        = M_xx*v20
    v661        = M_zz*v20
    v665        = 0.25d0*v20
    v672        = M_0*v20
    v675        = 0.0833333333333333d0*v20
    v43         = 0.5d0*v20
    v99         = v655
    v102        = v20*v8
    v158        = v661
    v206        = v665*v8
    v214        = M_xxz*v20
    v252        = M_xzz*v20
    v286        = v672
    v312        = v675
    v335        = v675*v8
    v343        = v31*v675
    v361        = v665
    v375        = v20*v5
    v489        = v20*v674
    v522        = v20*v59
    v552        = v20*v38
    v554        = v100 + v375 + v376 + v99
    v603        = M_y*v20
    Ms_yy       = v19 + v20*v7
    Ms_xyy      = v1*v43 + v48
    Ms_yyz      = v4*v43 + v69
    Ms_xxyy     = 0.5d0*(v100 + v99) + v101*v102 + v18*v32 + v43*v5 + v98
    Ms_xyyz     = v17*v43 + v47*z + v126 + v130 + v685 + v700
    Ms_xxxyy    = v182 + v183 + v184 + M_xyy*v32 + v102*v187 + v185*v20 + v186*v20 + v19* &
      v81 + v28*v43 + v32*v46
    Ms_xxyyz    = 0.5d0*(v214 + v215) + v206*v4 + v210 + v32*v65 + v32*v67 + v32*v68 + v38 &
      *v43 + v40*v43 + v41*v43 + v694 + v703
    Ms_xxxxyy   = M_xxxxyy + v307 + v308 + v309 + M_xxyy*v32 + v170*v19 + v20*v310 + v20* &
      v311 + v312*v313 + v314*v99 + v315*v81 + v32*v96 + v43*v78
    Ms_xxxyyz   = M_xxxyyz + v336 + v337 + v338 + v339 + v340 + v341 + M_xyyz*v32 + v124* &
      v32 + v127*v32 + v129*v32 + v184*z + v20*v342 + v206*v93 + v343* &
      v4 + v43*v88 + v43*v90 + v43*v91 + v69*v81
    Ms_xxxxxyy  = 0.0208333333333333d0*(v20*v473) + M_xxxxxyy + M_xxxyy*v32 + v102*v475 + &
      v167*v43 + v170*v315 + v181*v32 + v19*v296 + v20*v471 + v20*v472 &
      + v468 + v469 + v470 + v474*v99 + v476*v81
    Ms_xxxxyyz  = M_xxxxyyz + v490 + v491 + v492 + M_xxxxyy*z + M_xxyyz*v32 + v170*v69 + &
      v176*v43 + v178*v43 + v179*v43 + v180*v206 + v20*v493 + v207*v32 &
      + v208*v32 + v211*v32 + v307*z + v308*z + v309*z + v343*v93 + v4* &
      v489 + v496*v81
    Ms_xxxxxxyy = M_xxxxxxyy + M_xxxxxxy*y + M_xxxxxyy*x + M_xxxxyy*v32 + v102*v615 + v170 &
      *v476 + v182*v81 + v19*v463 + v20*v610 + v20*v611 + v20*v612 + &
      v293*v43 + v296*v315 + v307*v32 + v312*v614 + v465*y + v613*v99
    Ms_xxxxxyyz = M_xxxxxyyz + M_xxxxxyy*z + M_xxxxxyz*y + M_xxxxyyz*x + M_xxxyyz*v32 + &
      v170*v496 + v180*v343 + v20*v4*v622 + v20*v623 + v206*v306 + v296 &
      *v69 + v302*v43 + v304*v43 + v305*v43 + v32*v336 + v32*v337 + v32 &
      *v339 + v468*z + v469*z + v470*z + v478*y + v489*v93 + v81*( &
      M_xxyyz + v207 + v208 + v211)
    b3          = b1*b2
    v64         = b3
    v670        = M_0*v64
    v676        = 0.0833333333333333d0*v64
    v684        = 0.0277777777777778d0*v64
    v123        = 0.166666666666667d0*v64
    v280        = v670
    v360        = v676*v8
    v488        = v684
    v511        = v31*v684
    v535        = v676
    v619        = 0.00694444444444444d0*v64
    Ms_yyy      = v63 + M_y*v43 + v30*v64
    Ms_xyyy     = v122 + v1*v123 + v10*v43
    Ms_yyyz     = v150 + v123*v4 + v151*v43
    Ms_xxyyy    = v202 + v203 + v204 + M_xxy*v43 + M_y*v206 + M_yyy*v32 + v123*v6 + v205* &
      v64 + v32*v62 + v33*v43
    Ms_xyyyz    = v121*z + v123*v17 + v243*v43 + v238 + v239 + v240 + v241
    Ms_xxxyyy   = M_xxxyyy + v328 + v329 + v330 + M_xy*v206 + M_xyyy*v32 + M_yyy*v81 + &
      v120*v32 + v123*v28 + v20*v332 + v331*v64 + v333*v64 + v334*v335 &
      + v43*v82 + v62*v81
    Ms_xxyyyz   = M_xxyyyz + v362 + v363 + v364 + v365 + v366 + v367 + M_xxyz*v43 + M_yyyz &
      *v32 + v103*v43 + v107*v43 + v108*v43 + v123*v42 + v146*v32 + &
      v148*v32 + v149*v32 + v151*v206 + v204*z + v360*v4
    Ms_xxxxyyy  = M_xxxxyyy + v482 + v483 + v484 + M_xxy*v206 + M_xxyyy*v32 + M_xyyy*v81 + &
      M_y*v489 + v120*v81 + v123*v78 + v170*v63 + v173*v43 + v20*v486 + &
      v203*v32 + v313*v488 + v335*(v33 + v35) + v485*v64 + v487*v64
    Ms_xxxyyyz  = M_xxxyyyz + v512 + v513 + v514 + M_xxxyyy*z + M_xyyyz*v32 + M_yyyz*v81 + &
      v123*v88 + v123*v90 + v123*v91 + v146*v81 + v148*v81 + v149*v81 + &
      v188*v43 + v191*v43 + v192*v43 + v20*v515 + v206*(M_xyz + v49) + &
      v236*v32 + v239*v32 + v240*v32 + v328*z + v329*z + v330*z + v335* &
      (v50 + v52 + v53 + v54) + v4*v511 + v516*v64
    Ms_xxxxxyyy = M_xxxxxyyy + M_xxxxxyy*y + M_xxxxyyy*x + M_xxxyyy*v32 + M_xxyyy*v81 + &
      M_xy*v489 + v102*v621 + v123*v167 + v170*(M_xyyy + v120) + v20* &
      v617 + v203*v81 + v296*v63 + v299*v43 + v32*v328 + v335*(v82 + &
      v84) + v469*y + v473*v619 + v488*v620 + v603*v622 + v616*v64 + &
      v618*v64
    Ms_xxxxyyyz = M_xxxxyyyz + M_xxxxyyy*z + M_xxxxyyz*y + M_xxxyyyz*x + M_xxyyyz*v32 + &
      M_xyyyz*v81 + v123*v176 + v123*v178 + v123*v179 + v150*v170 + &
      v151*v489 + v20*v631 + v206*v539 + v236*v81 + v239*v81 + v240*v81 &
      + v316*v43 + v319*v43 + v32*v362 + v32*v363 + v32*v365 + v320*v43 &
      + v335*(v104 + v106 + v540) + v4*v619*v80 + v482*z + v483*z + &
      v484*z + v491*y + v511*v93 + v632*v64
    b4          = b2*b2
    v145        = b4
    v687        = 0.0208333333333333d0*v145
    v235        = 0.0416666666666667d0*v145
    v442        = M_0*v145
    v509        = v687
    v534        = v687*v8
    v597        = M_y*v145
    Ms_yyyy     = M_yyyy + v144 + M_y*v123 + M_yy*v43 + v145*v79
    Ms_xyyyy    = v232 + v233 + v234 + v1*v235 + v10*v123 + v43*v45
    Ms_yyyyz    = v271 + v272 + v273 + v123*v151 + v235*v4 + v274*v43
    Ms_xxyyyy   = M_xxyyyy + v356 + v357 + v358 + M_xxyy*v43 + M_y*v360 + M_yyyy*v32 + &
      v100*v361 + v123*v34 + v144*v32 + v145*v359 + v235*v6 + v43*v94
    Ms_xyyyyz   = v396 + v397 + v398 + v399 + v123*v243 + v17*v235 + v234*z + v401*v43
    Ms_xxxyyyy  = M_xxxyyyy + v503 + v504 + v505 + M_xyy*v206 + M_xyyyy*v32 + M_y*v511 + &
      M_yyyy*v81 + v123*v82 + v144*v81 + v145*v508 + v183*v43 + v20* &
      v507 + v233*v32 + v235*v29 + v335*(v44 + v46) + v506*v64 + v509* &
      v510
    Ms_xxyyyyz  = M_xxyyyyz + v536 + v537 + v538 + M_xxyyyy*z + M_xxyyz*v43 + M_yyyyz*v32 &
      + v123*v541 + v151*v360 + v206*v274 + v207*v43 + v209*v43 + v212* &
      v43 + v235*v42 + v270*v32 + v272*v32 + v273*v32 + v356*z + v357*z &
      + v358*z + v4*v534
    Ms_xxxxyyyy = 0.0208333333333333d0*(v102*(v655 + v656)) + M_xxxxyyy*y + M_xxxxyyyy + &
      M_xxxyyyy*x + M_xxyy*v206 + M_xxyyyy*v32 + M_xy*v511 + M_xyyyy* &
      v81 + M_yyyy*v170 + v123*v173 + v144*v170 + v145*v627 + v145*v630 &
      + v20*v629 + v233*v81 + v235*v78 + v308*v43 + v31*v334*v619 + v32 &
      *v356 + v335*(v94 + v96) + v483*y + v628*v64
    Ms_xxxyyyyz = M_xxxyyyyz + M_xxxyyyy*z + M_xxxyyyz*y + M_xxyyyyz*x + M_xyyyyz*v32 + &
      M_yyyyz*v81 + v123*v188 + v123*v191 + v123*v192 + v145*v4*v639 + &
      v151*v511 + v20*v640 + v206*v494 + v235*v92 + v270*v81 + v272*v81 &
      + v273*v81 + v32*v394 + v32*v397 + v32*v398 + v335*(v125 + v128 + &
      v495) + v336*v43 + v338*v43 + v340*v43 + v503*z + v504*z + v505*z &
      + v513*y + v534*v93 + v64*v641
    b5          = b2*b3
    v269        = b5
    v689        = 0.00416666666666667d0*v269
    v393        = 0.00833333333333333d0*v269
    v595        = v689
    v649        = M_y*v689
    Ms_yyyyy    = M_yyyyy + v268 + M_y*v235 + M_yy*v123 + M_yyy*v43 + v168*v269
    Ms_xyyyyy   = v390 + v391 + v392 + v1*v393 + v10*v235 + v119*v43 + v123*v45
    Ms_yyyyyz   = v434 + v435 + v436 + v123*v274 + v151*v235 + v393*v4 + v43*v437
    Ms_xxyyyyy  = M_xxyyyyy + v530 + v531 + v532 + M_xxyyy*v43 + M_y*v534 + M_yyy*v206 + &
      M_yyyyy*v32 + v100*v535 + v123*v95 + v201*v43 + v235*v34 + v268* &
      v32 + v269*v533 + v393*v6
    Ms_xyyyyyz  = M_xyyyyyz + v566 + v567 + v568 + M_xyyyyy*z + v123*v401 + v17*v393 + &
      v235*v243 + v238*v43 + v389*z + v391*z + v392*z
    Ms_xxxyyyyy = M_xxxyyyyy + M_xxxyyyy*y + M_xxyyyyy*x + M_xy*v534 + M_xyyy*v206 + &
      M_xyyyyy*v32 + M_yy*v511 + M_yyyyy*v81 + v123*v183 + v20*v637 + &
      v235*v83 + v268*v81 + v269*v638 + v29*v393 + v32*v391 + v329*v43 &
      + v335*(v118 + v120) + v504*y + v510*v595 + v597*v639 + v636*v64
    Ms_xxyyyyyz = M_xxyyyyyz + M_xxyyyyy*z + M_xxyyyyz*y + M_xxyyyz*v43 + M_xyyyyyz*x + &
      M_yyyyyz*v32 + v123*(v650 + v666) + v151*v534 + v206*v437 + v235* &
      v541 + v274*v360 + v32*v433 + v32*v435 + v32*v436 + v362*v43 + &
      v364*v43 + v366*v43 + v393*v42 + v4*v595*v8 + v530*z + v531*z + &
      v532*z + v537*y
    b6          = b3*b3
    v432        = b6
    v565        = 0.00138888888888889d0*v432
    Ms_yyyyyy   = M_yyyyyy + v431 + M_y*v393 + M_yy*v235 + M_yyy*v123 + M_yyyy*v43 + v294* &
      v432
    Ms_xyyyyyy  = M_xyyyyyy + v562 + v563 + v564 + v1*v565 + v10*v393 + v119*v123 + v232* &
      v43 + v235*v45
    Ms_yyyyyyz  = M_yyyyyyz + v593 + M_yyyyyy*z + v123*v437 + v151*v393 + v235*v274 + v271 &
      *v43 + v4*v565 + v431*z
    Ms_xxyyyyyy = M_xxyyyyyy + M_xxyyyy*v43 + M_xxyyyyy*y + M_xyyyyyy*x + M_yyy*v360 + &
      M_yyyy*v206 + M_yyyyyy*v32 + v100*v509 + v123*v202 + v235*v95 + &
      v32*v431 + v34*v393 + v357*v43 + v432*v648 + v531*y + v565*v6 + &
      v649*v8
    Ms_xyyyyyyz = M_xyyyyyyz + M_xyyyyyy*z + M_xyyyyyz*y + M_yyyyyyz*x + v123*v238 + v17* &
      v565 + v235*v401 + v243*v393 + v396*v43 + v562*z + v563*z + v564* &
      z + v567*y
    b7          = b3*b4
    v592        = b7
    v652        = 0.000198412698412698d0*v592
    Ms_yyyyyyy  = M_yyyyyyy + v591 + M_y*v565 + M_yy*v393 + M_yyy*v235 + M_yyyy*v123 + &
      M_yyyyy*v43 + v461*v592
    Ms_xyyyyyyy = M_xyyyyyyy + M_xyyyyyy*y + M_yyyyyyy*x + v1*v652 + v10*v565 + v119*v235 &
      + v123*v232 + v390*v43 + v393*v45 + v563*y
    Ms_yyyyyyyz = M_yyyyyyyz + M_yyyyyyy*z + M_yyyyyyz*y + v123*v271 + v151*v565 + v235* &
      v437 + v274*v393 + v4*v652 + v43*v434 + v591*z
    b8          = b4*b4
    Ms_yyyyyyyy = M_yyyyyyyy + M_y*v652 + M_yy*v565 + M_yyy*v393 + M_yyyy*v235 + M_yyyyy* &
      v123 + M_yyyyyy*v43 + M_yyyyyyy*y + b8*v608
    c2          = c1*c1
    v27         = c2
    v657        = M_xx*v27
    v659        = v27*v8
    v660        = M_yy*v27
    v662        = v20*v27
    v667        = 0.25d0*v27
    v669        = 0.0833333333333333d0*v27
    v677        = 0.125d0*v662
    v679        = 0.0208333333333333d0*v27
    v690        = M_0*v27
    v56         = 0.5d0*v27
    v115        = v657
    v117        = v659
    v157        = v660
    v159        = v662
    v224        = M_xxy*v27
    v226        = v667*v8
    v251        = M_xyy*v27
    v253        = v27*v665
    v279        = v669
    v350        = v31*v669
    v355        = v669*v8
    v374        = v667
    v378        = v677
    v408        = v64*v669
    v441        = v679
    v449        = v27*v675
    v500        = v679*v80
    v521        = v27*v46
    v523        = M_x*v159
    v524        = v157 + v158 + v18*v27 + v20*v25
    v545        = v27*v33
    v547        = v677*v8
    v548        = v27*v5 + v115 + v116 + v377
    v572        = v27*v687
    v596        = v690
    v626        = M_z*v27
    v644        = 0.0416666666666667d0*v662*v8
    Ms_zz       = v26 + v27*v7
    Ms_xzz      = v1*v56 + v61
    Ms_yzz      = v3*v56 + v74
    Ms_xxzz     = 0.5d0*(v115 + v116) + v101*v117 + v114 + v25*v32 + v5*v56
    Ms_xyzz     = v13*v56 + v55*z + v133 + v136 + v678 + v701
    Ms_yyzz     = 0.5d0*(v157 + v158) + v101*v159 + v156 + v18*v56 + v25*v43
    Ms_xxxzz    = v198 + v199 + v200 + M_xzz*v32 + v117*v187 + v185*v27 + v186*v27 + v26* &
      v81 + v28*v56 + v32*v59
    Ms_xxyzz    = 0.5d0*(v224 + v225) + v218 + v221 + v223 + v226*v3 + v32*v70 + v32*v72 + &
      v32*v73 + v33*v56 + v35*v56 + v36*v56 + v695 + v702
    Ms_xyyzz    = 0.5d0*(v251 + v252) + M_xyyzz + v1*v253 + v247 + v43*v57 + v43*v59 + v43 &
      *v60 + v44*v56 + v46*v56 + v47*v56 + v696 + v704
    Ms_yyyzz    = v276 + v277 + v278 + M_y*v253 + M_yyy*v56 + M_yzz*v43 + v123*v26 + v279* &
      v280 + v43*v72 + v56*v62
    Ms_xxxxzz   = M_xxxxzz + v324 + v325 + v326 + M_xxzz*v32 + v112*v32 + v115*v314 + v170 &
      *v26 + v27*v310 + v27*v311 + v279*v313 + v327*v81 + v56*v78
    Ms_xxxyzz   = M_xxxyzz + v344 + v345 + v346 + v347 + v348 + v349 + M_xyzz*v32 + v131* &
      v32 + v132*v32 + v134*v32 + v193*z + v226*v87 + v27*v332 + v3* &
      v350 + v56*v82 + v56*v84 + v56*v85 + v74*v81
    Ms_xxyyzz   = M_xxyyzz + v368 + v369 + v370 + v371 + v372 + v373 + M_xxyy*v56 + M_xxzz &
      *v43 + M_yyzz*v32 + v100*v374 + v110*v43 + v112*v43 + v113*v43 + &
      v116*v361 + v152*v32 + v154*v32 + v155*v32 + v213*z + v361*v377 + &
      v374*v375 + v374*v376 + v374*v99 + v378*v664 + v56*v94 + v56*v96 &
      + v56*v97
    Ms_xyyyzz   = M_xyyyzz + v402 + v403 + v404 + v405 + v406 + v407 + M_xyyy*v56 + M_xyzz &
      *v43 + v1*v408 + v10*v253 + v118*v56 + v120*v56 + v121*v56 + v123 &
      *v61 + v131*v43 + v135*v43 + v136*v43 + v241*z
    Ms_yyyyzz   = M_yyyyzz + v438 + v439 + v440 + M_y*v408 + M_yyyy*v56 + M_yyzz*v43 + &
      v123*v443 + v144*v56 + v154*v43 + v157*v361 + v235*v26 + v441* &
      v442
    Ms_xxxxxzz  = M_xxxxxzz + v480 + M_xxxxxz*z + M_xxxzz*v32 + v115*v474 + v117*v475 + &
      v167*v56 + v170*v327 + v197*v32 + v26*v296 + v27*v471 + v27*v472 &
      + v304*z + v441*v473 + v481*v81
    Ms_xxxxyzz  = M_xxxxyzz + v497 + v498 + v499 + M_xxxxyz*z + M_xxyzz*v32 + v170*v74 + &
      v171*v56 + v173*v56 + v174*v56 + v175*v226 + v216*v32 + v217*v32 &
      + v219*v32 + v27*v486 + v3*v500 + v317*z + v319*z + v321*z + v350 &
      *v87 + v501*v81
    Ms_xxxyyzz  = 0.125d0*(v523*v8) + M_xxxyyz*z + M_xxxyyzz + M_xyyzz*v32 + v156*v81 + &
      v159*v31*v654 + v159*v475 + v181*v56 + v183*v56 + v184*v56 + v197 &
      *v43 + v199*v43 + v20*v520 + v200*v43 + v246*v32 + v247*v32 + &
      v249*v32 + v251*v314 + v252*v314 + v253*v28 + v27*v507 + v314* &
      v521 + v314*v522 + v337*z + v338*z + v341*z + v474*v524 + v517 + &
      v518 + v519
    Ms_xxyyyzz  = M_xxyyyzz + v542 + v543 + v544 + M_xxyyy*v56 + M_xxyyyz*z + M_xxyzz*v43 &
      + M_y*v547 + M_yyy*v226 + M_yyyzz*v32 + v114*v123 + v117*v64*v654 &
      + v201*v56 + v203*v56 + v204*v56 + v216*v43 + v220*v43 + v221*v43 &
      + v224*v361 + v225*v361 + v226*v62 + v275*v32 + v277*v32 + v278* &
      v32 + v361*v545 + v361*v546 + v363*z + v364*z + v367*z + v535* &
      v548
    Ms_xyyyyzz  = M_xyyyyzz + v569 + v570 + v571 + M_xyyyy*v56 + M_xyyyyz*z + M_xyyzz*v43 &
      + v1*v572 + v10*v408 + v123*v575 + v231*v56 + v233*v56 + v234*v56 &
      + v235*v61 + v244*v43 + v246*v43 + v248*v43 + v253*v45 + v395*z + &
      v397*z + v399*z
    Ms_yyyyyzz  = M_yyyyyzz + v594 + M_yyy*v253 + M_yyyyy*v56 + M_yyyyyz*z + M_yyyzz*v43 + &
      v123*v598 + v157*v535 + v235*v443 + v26*v393 + v268*v56 + v275* &
      v43 + v435*z + v441*v597 + v595*v596
    Ms_xxxxxxzz = M_xxxxxxzz + M_xxxxxxz*z + M_xxxxxzz*x + M_xxxxzz*v32 + v115*v613 + v117 &
      *v615 + v170*v481 + v198*v81 + v26*v463 + v27*v610 + v27*v611 + &
      v27*v612 + v279*v614 + v293*v56 + v296*v327 + v32*v324 + v467*z
    Ms_xxxxxyzz = M_xxxxxyzz + M_xxxxxyz*z + M_xxxxxzz*y + M_xxxxyzz*x + M_xxxyzz*v32 + &
      v170*v501 + v175*v350 + v226*v301 + v27*v3*v622 + v27*v617 + v296 &
      *v74 + v297*v56 + v299*v56 + v300*v56 + v32*v344 + v32*v345 + v32 &
      *v347 + v477*z + v478*z + v479*z + v480*y + v500*v87 + v81*(v218 &
      + v624)
    Ms_xxxxyyzz = 0.0104166666666667d0*(12.0d0*v117*v655 + v27*v672*v80 + 4.0d0*v31*(v523 &
      + v696)) + M_xxxxyyz*z + M_xxxxyyzz + M_xxxxyzz*y + M_xxxyyzz*x + &
      M_xxyyzz*v32 + M_xxzz*v206 + v112*v206 + v117*v634 + v159*v615 + &
      v20*v633 + v226*v96 + v253*v78 + v27*v629 + v307*v56 + v308*v56 + &
      v309*v56 + v32*v368 + v32*v369 + v32*v371 + v324*v43 + v325*v43 + &
      v326*v43 + v474*(v251 + v252 + v521 + v522) + v490*z + v491*z + &
      v492*z + v498*y + v524*v613 + v81*(v635 + v704)
    Ms_xxxyyyzz = 0.0138888888888889d0*(v31*v64*v690) + M_xxx*v408 + M_xxxyyyz*z + &
      M_xxxyyyzz + M_xxxyyzz*y + M_xxyyyzz*x + M_xy*v547 + M_xyyy*v226 &
      + M_xyyyzz*v32 + M_xyzz*v206 + M_xzz*v360 + M_yyy*v350 + M_yyyzz* &
      v81 + M_yzz*v343 + v120*v226 + v123*v197 + v123*v199 + v123*v200 &
      + v131*v206 + v159*v621 + v20*v642 + v253*v82 + v26*v511 + v27* &
      v637 + v275*v81 + v277*v81 + v278*v81 + v28*v408 + v32*v402 + v32 &
      *v403 + v32*v405 + v328*v56 + v329*v56 + v330*v56 + v334*v644 + &
      v343*v72 + v344*v43 + v346*v43 + v348*v43 + v350*v62 + v360*v59 + &
      v512*z + v513*z + v514*z + v518*y + v64*v643
    Ms_xxyyyyzz = 0.0104166666666667d0*(v442*v659 + 4.0d0*v64*(M_y*v117 + v217 + v219 + &
      v222 + v223)) + M_xxyyyy*v56 + M_xxyyyyz*z + M_xxyyyyzz + &
      M_xxyyyzz*y + M_xxyyzz*v43 + M_xyyyyzz*x + M_yyyy*v226 + M_yyyyzz &
      *v32 + M_yyzz*v206 + v100*v378 + v123*(M_xxyzz + v216 + v220 + &
      v221) + v144*v226 + v154*v206 + v159*v634 + v253*v94 + v32*v438 + &
      v32*v439 + v32*v440 + v356*v56 + v357*v56 + v358*v56 + v368*v43 + &
      v370*v43 + v372*v43 + v509*v548 + v535*(v224 + v225 + v545 + v546 &
      ) + v536*z + v537*z + v538*z + v543*y
    Ms_xyyyyyzz = M_xyyyyyzz + M_xyyyyy*v56 + M_xyyyyyz*z + M_xyyyyzz*y + M_xyyyzz*v43 + &
      M_yyyyyzz*x + v1*v27*v595 + v10*v572 + v119*v253 + v123*(M_xyyzz &
      + v244 + v246 + v248) + v235*v575 + v389*v56 + v391*v56 + v392* &
      v56 + v393*v61 + v402*v43 + v404*v43 + v406*v43 + v408*v45 + v566 &
      *z + v567*z + v568*z + v570*y
    Ms_yyyyyyzz = 0.000694444444444444d0*(v432*v596) + M_yyy*v408 + M_yyyy*v253 + M_yyyyyy &
      *v56 + M_yyyyyyz*z + M_yyyyyyzz + M_yyyyyzz*y + M_yyyyzz*v43 + &
      v123*v276 + v157*v509 + v235*v598 + v26*v565 + v27*v649 + v393* &
      v443 + v43*v438 + v431*v56 + v593*z
    h           = v20 + v27 + v8
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
    v77         = c3
    v671        = 0.0833333333333333d0*v77
    v680        = 0.0277777777777778d0*v77
    v143        = 0.166666666666667d0*v77
    v285        = v671
    v385        = v671*v8
    v415        = v675*v77
    v447        = v680
    v528        = v31*v680
    v579        = v684*v77
    v600        = 0.00694444444444444d0*v77
    v646        = 0.0138888888888889d0*v77
    Ms_zzz      = v76 + M_z*v56 + v30*v77
    Ms_xzzz     = v142 + v1*v143 + v15*v56
    Ms_yzzz     = v164 + v143*v3 + v22*v56
    Ms_xxzzz    = v228 + v229 + v230 + M_xxz*v56 + M_z*v226 + M_zzz*v32 + v143*v6 + v205* &
      v77 + v32*v75 + v38*v56
    Ms_xyzzz    = v13*v143 + v137*z + v262*v56 + v257 + v258 + v259 + v260
    Ms_yyzzz    = v282 + v283 + v284 + M_yyz*v56 + M_z*v253 + M_zzz*v43 + v143*v19 + v285* &
      v286 + v43*v75 + v56*v65
    Ms_xxxzzz   = M_xxxzzz + v351 + v352 + v353 + M_xz*v226 + M_xzzz*v32 + M_zzz*v81 + &
      v140*v32 + v143*v28 + v27*v342 + v331*v77 + v333*v77 + v354*v355 &
      + v56*v88 + v75*v81
    Ms_xxyzzz   = M_xxyzzz + v379 + v380 + v381 + v382 + v383 + v384 + M_xxyz*v56 + M_yzzz &
      *v32 + v106*v56 + v107*v56 + v109*v56 + v143*v37 + v160*v32 + &
      v162*v32 + v163*v32 + v22*v226 + v222*z + v3*v385
    Ms_xyyzzz   = M_xyyzzz + v409 + v410 + v411 + v412 + v413 + v414 + M_xyyz*v56 + M_xzzz &
      *v43 + v1*v415 + v127*v56 + v128*v56 + v130*v56 + v138*v43 + v140 &
      *v43 + v141*v43 + v143*v48 + v15*v253 + v250*z
    Ms_yyyzzz   = M_yyyzzz + v444 + v445 + v446 + M_yyy*v143 + M_yyyz*v56 + M_yz*v253 + &
      M_yzzz*v43 + M_zzz*v123 + v123*v75 + v143*v62 + v146*v56 + v162* &
      v43 + v280*v447 + v448*v449
    Ms_xxxxzzz  = M_xxxxzzz + v502 + M_xxxxzz*z + M_xxz*v226 + M_xxzzz*v32 + M_xzzz*v81 + &
      M_z*v500 + v140*v81 + v143*v78 + v170*v76 + v178*v56 + v229*v32 + &
      v27*v493 + v313*v447 + v325*z + v355*(v38 + v40) + v485*v77 + &
      v487*v77
    Ms_xxxyzzz  = M_xxxyzzz + v525 + v526 + v527 + M_xxxyzz*z + M_xyzzz*v32 + M_yzzz*v81 + &
      v143*v82 + v143*v84 + v143*v85 + v160*v81 + v162*v81 + v163*v81 + &
      v189*v56 + v191*v56 + v193*v56 + v194*v226 + v254*v32 + v258*v32 &
      + v259*v32 + v27*v515 + v3*v528 + v345*z + v346*z + v349*z + v355 &
      *(v195 + v261) + v506*v77
    Ms_xxyyzzz  = M_xxyyzzz + v549 + v550 + v551 + M_xxyyz*v56 + M_xxyyzz*z + M_xxzzz*v43 &
      + M_yyzzz*v32 + M_z*v547 + M_zzz*v206 + v102*v654*v77 + v143*v98 &
      + v206*v75 + v211*v56 + v212*v56 + v213*v56 + v214*v374 + v215* &
      v374 + v227*v43 + v229*v43 + v230*v43 + v281*v32 + v283*v32 + &
      v284*v32 + v285*v554 + v369*z + v370*z + v373*z + v374*v552 + &
      v374*v553
    Ms_xyyyzzz  = M_xyyyzzz + v576 + v577 + v578 + M_xyyy*v143 + M_xyyyz*v56 + M_xyyyzz*z &
      + M_xyzzz*v43 + M_xzzz*v123 + v1*v579 + v118*v143 + v120*v143 + &
      v121*v143 + v123*v138 + v123*v140 + v123*v141 + v237*v56 + v239* &
      v56 + v241*v56 + v242*v253 + v255*v43 + v258*v43 + v260*v43 + &
      v403*z + v404*z + v407*z + v449*(v51 + v52 + v55)
    Ms_yyyyzzz  = M_yyyyzzz + v599 + M_y*v579 + M_yyyy*v143 + M_yyyyz*v56 + M_yyyyzz*z + &
      M_yyz*v253 + M_yyzzz*v43 + M_yzzz*v123 + M_z*v572 + v123*v162 + &
      v143*v144 + v235*v76 + v272*v56 + v283*v43 + v439*z + v442*v600 + &
      v449*(v65 + v67)
    Ms_xxxxxzzz = M_xxxxxzzz + M_xxxxxzz*z + M_xxxxzzz*x + M_xxxzzz*v32 + M_xxzzz*v81 + &
      M_xz*v500 + v117*v625 + v143*v167 + v170*(M_xzzz + v140) + v229* &
      v81 + v27*v623 + v296*v76 + v304*v56 + v32*v351 + v355*(v88 + v90 &
      ) + v447*v620 + v473*v600 + v480*z + v616*v77 + v618*v77 + v622* &
      v626
    Ms_xxxxyzzz = M_xxxxyzzz + M_xxxxyzz*z + M_xxxxzzz*y + M_xxxyzzz*x + M_xxyzzz*v32 + &
      M_xyzzz*v81 + v143*v171 + v143*v173 + v143*v174 + v164*v170 + v22 &
      *v500 + v226*v322 + v254*v81 + v258*v81 + v259*v81 + v27*v631 + &
      v3*v600*v80 + v317*v56 + v319*v56 + v32*v379 + v32*v380 + v32* &
      v382 + v321*v56 + v355*(v105 + v559) + v497*z + v498*z + v499*z + &
      v502*y + v528*v87 + v628*v77
    Ms_xxxyyzzz = M_xxxyyzzz + M_xxx*v415 + M_xxxyyzz*z + M_xxxyzzz*y + M_xxyyzzz*x + &
      M_xyy*v385 + M_xyyz*v226 + M_xyyzzz*v32 + M_xz*v547 + M_xzzz*v206 &
      + M_yyz*v350 + M_yyzzz*v81 + M_zzz*v343 + v127*v226 + v140*v206 + &
      v143*v181 + v143*v183 + v143*v184 + v159*v625 + v19*v528 + v20* &
      v645 + v253*v88 + v27*v640 + v28*v415 + v281*v81 + v283*v81 + &
      v284*v81 + v31*v646*v672 + v32*v409 + v32*v410 + v32*v412 + v337* &
      v56 + v338*v56 + v341*v56 + v343*v75 + v350*v65 + v351*v43 + v352 &
      *v43 + v353*v43 + v354*v644 + v385*v46 + v517*z + v518*z + v519*z &
      + v526*y + v636*v77
    Ms_xxyyyzzz = M_xxyyyzzz + M_xxy*v415 + M_xxyyy*v143 + M_xxyyyz*v56 + M_xxyyyzz*z + &
      M_xxyyzzz*y + M_xxyz*v253 + M_xxyzzz*v43 + M_xxz*v408 + M_xxzzz* &
      v123 + M_xyyyzzz*x + M_yyy*v385 + M_yyyz*v226 + M_yyyzzz*v32 + &
      M_yz*v547 + M_yzzz*v206 + M_zzz*v360 + v107*v253 + v123*v227 + &
      v123*v229 + v123*v230 + v143*v201 + v143*v203 + v143*v204 + v146* &
      v226 + v162*v206 + v32*v444 + v32*v445 + v32*v446 + v33*v415 + &
      v360*v75 + v363*v56 + v364*v56 + v367*v56 + v379*v43 + v38*v408 + &
      v381*v43 + v383*v43 + v385*v62 + v448*v644 + v542*z + v543*z + &
      v544*z + v550*y + v579*v6 + v646*v670*v8
    Ms_xyyyyzzz = M_xyyyyzzz + M_xyyyy*v143 + M_xyyyyz*v56 + M_xyyyyzz*z + M_xyyyzzz*y + &
      M_xyyzzz*v43 + M_xyzzz*v123 + M_yyyyzzz*x + v1*v145*v600 + v10* &
      v579 + v123*v255 + v123*v258 + v123*v260 + v142*v235 + v143*v231 &
      + v143*v233 + v143*v234 + v15*v572 + v253*v400 + v395*v56 + v397* &
      v56 + v399*v56 + v409*v43 + v411*v43 + v413*v43 + v449*(v126 + &
      v584) + v569*z + v570*z + v571*z + v577*y
    Ms_yyyyyzzz = M_yyyyyzzz + M_yy*v579 + M_yyyyy*v143 + M_yyyyyz*v56 + M_yyyyyzz*z + &
      M_yyyyzzz*y + M_yyyz*v253 + M_yyyzzz*v43 + M_yyzzz*v123 + M_yz* &
      v572 + v123*v283 + v143*v268 + v235*(M_yzzz + v162) + v269*v294* &
      v77 + v393*v76 + v43*v444 + v435*v56 + v449*(v146 + v148) + v594* &
      z + v595*v626 + v597*v600
    c4          = c2*c2
    v166        = c4
    v681        = 0.0208333333333333d0*v166
    v691        = 0.00694444444444444d0*v166
    v267        = 0.0416666666666667d0*v166
    v453        = v681
    v558        = v681*v8
    v583        = v20*v681
    v602        = v691
    v647        = M_z*v691
    Ms_zzzz     = M_zzzz + v165 + M_z*v143 + M_zz*v56 + v166*v79
    Ms_xzzzz    = v264 + v265 + v266 + v1*v267 + v143*v15 + v56*v58
    Ms_yzzzz    = v288 + v289 + v290 + v143*v22 + v267*v3 + v56*v71
    Ms_xxzzzz   = M_xxzzzz + v386 + v387 + v388 + M_xxzz*v56 + M_z*v385 + M_zzzz*v32 + &
      v110*v56 + v116*v374 + v143*v39 + v165*v32 + v166*v359 + v267*v6
    Ms_xyzzzz   = v419 + v420 + v421 + v422 + v13*v267 + v143*v262 + v256*z + v425*v56
    Ms_yyzzzz   = M_yyzzzz + v450 + v451 + v452 + M_yyzz*v56 + M_z*v415 + M_zzzz*v43 + &
      v143*v66 + v152*v56 + v158*v374 + v165*v43 + v19*v267 + v286*v453
    Ms_xxxzzzz  = M_xxxzzzz + v529 + M_xxxzzz*z + M_xzz*v226 + M_xzzzz*v32 + M_z*v528 + &
      M_zzzz*v81 + v143*v88 + v165*v81 + v166*v508 + v199*v56 + v265* &
      v32 + v267*v29 + v27*v520 + v352*z + v355*(v57 + v59) + v453*v510 &
      + v516*v77
    Ms_xxyzzzz  = M_xxyzzzz + v555 + v556 + v557 + M_xxyzz*v56 + M_xxyzzz*z + M_yzzzz*v32 &
      + v143*v560 + v219*v56 + v22*v385 + v220*v56 + v222*v56 + v226* &
      v71 + v267*v37 + v287*v32 + v289*v32 + v290*v32 + v3*v558 + v380* &
      z + v381*z + v384*z
    Ms_xyyzzzz  = M_xyyzzzz + v580 + v581 + v582 + M_xyyzz*v56 + M_xyyzzz*z + M_xzzzz*v43 &
      + v1*v583 + v143*v585 + v15*v415 + v247*v56 + v248*v56 + v250*v56 &
      + v253*v58 + v263*v43 + v265*v43 + v266*v43 + v267*v48 + v410*z + &
      v411*z + v414*z
    Ms_yyyzzzz  = M_yyyzzzz + v601 + M_yyyz*v143 + M_yyyzz*v56 + M_yyyzzz*z + M_yzz*v253 + &
      M_yzzzz*v43 + M_z*v579 + M_zzzz*v123 + v123*v165 + v143*v146 + &
      v267*v63 + v277*v56 + v280*v602 + v289*v43 + v445*z + v449*(v70 + &
      v72) + v453*v603
    Ms_xxxxzzzz = 0.0208333333333333d0*(v117*(v657 + v658)) + M_xxxxzzz*z + M_xxxxzzzz + &
      M_xxxzzzz*x + M_xxzz*v226 + M_xxzzzz*v32 + M_xz*v528 + M_xzzzz* &
      v81 + M_zzzz*v170 + v143*v178 + v165*v170 + v166*v627 + v166*v630 &
      + v265*v81 + v267*v78 + v27*v633 + v31*v354*v600 + v32*v386 + &
      v325*v56 + v355*(v110 + v112) + v502*z + v632*v77
    Ms_xxxyzzzz = M_xxxyzzzz + M_xxxyzzz*z + M_xxxzzzz*y + M_xxyzzzz*x + M_xyzzzz*v32 + &
      M_yzzzz*v81 + v143*v189 + v143*v191 + v143*v193 + v22*v528 + v226 &
      *v423 + v267*v86 + v27*v642 + v287*v81 + v289*v81 + v290*v81 + v3 &
      *v31*v602 + v32*v416 + v32*v420 + v32*v421 + v345*v56 + v346*v56 &
      + v349*v56 + v355*(v133 + v424) + v525*z + v526*z + v527*z + v529 &
      *y + v558*v87 + v641*v77
    Ms_xxyyzzzz = 0.0104166666666667d0*(M_0*v102*v166 + 4.0d0*v77*(M_z*v102 + v210)) + &
      M_xxyyzz*v56 + M_xxyyzzz*z + M_xxyyzzzz + M_xxyzzzz*y + M_xxzz* &
      v253 + M_xxzzzz*v43 + M_xyyzzzz*x + M_yyzz*v226 + M_yyzzzz*v32 + &
      M_zzzz*v206 + v110*v253 + v116*v378 + v143*(v650 + v694) + v152* &
      v226 + v165*v206 + v285*(v214 + v215 + v552 + v553) + v32*v450 + &
      v32*v451 + v32*v452 + v369*v56 + v370*v56 + v373*v56 + v386*v43 + &
      v387*v43 + v388*v43 + v453*v554 + v549*z + v550*z + v551*z + v556 &
      *y
    Ms_xyyyzzzz = M_xyyyzzzz + M_xyyyz*v143 + M_xyyyzz*v56 + M_xyyyzzz*z + M_xyyzzzz*y + &
      M_xyzzzz*v43 + M_xzzzz*v123 + M_yyyzzzz*x + v1*v602*v64 + v10* &
      v583 + v122*v267 + v123*v263 + v123*v265 + v123*v266 + v143*v237 &
      + v143*v239 + v143*v241 + v15*v579 + v253*v573 + v403*v56 + v404* &
      v56 + v407*v56 + v417*v43 + v420*v43 + v422*v43 + v449*(v134 + &
      v137 + v574) + v576*z + v577*z + v578*z + v581*y
    Ms_yyyyzzzz = 0.00173611111111111d0*(12.0d0*v159*(v660 + v661) + v166*v442) + M_yyyy* &
      v267 + M_yyyyz*v143 + M_yyyyzz*v56 + M_yyyyzzz*z + M_yyyyzzzz + &
      M_yyyzzzz*y + M_yyzz*v253 + M_yyzzzz*v43 + M_yz*v579 + M_yzzzz* &
      v123 + M_zzzz*v235 + v123*v289 + v143*v272 + v144*v267 + v165* &
      v235 + v43*v450 + v439*v56 + v448*v600*v64 + v449*(v152 + v154) + &
      v599*z
    c5          = c2*c3
    v292        = c5
    v692        = 0.00416666666666667d0*v292
    v430        = 0.00833333333333333d0*v292
    v605        = v692
    v651        = M_z*v692
    Ms_zzzzz    = M_zzzzz + v291 + M_z*v267 + M_zz*v143 + M_zzz*v56 + v168*v292
    Ms_xzzzzz   = v427 + v428 + v429 + v1*v430 + v139*v56 + v143*v58 + v15*v267
    Ms_yzzzzz   = v455 + v456 + v457 + v143*v71 + v161*v56 + v22*v267 + v3*v430
    Ms_xxzzzzz  = M_xxzzzzz + v561 + M_xxzzz*v56 + M_xxzzzz*z + M_z*v558 + M_zzz*v226 + &
      M_zzzzz*v32 + v111*v143 + v116*v285 + v227*v56 + v267*v39 + v291* &
      v32 + v292*v533 + v387*z + v430*v6
    Ms_xyzzzzz  = M_xyzzzzz + v586 + v587 + v588 + M_xyzzzz*z + v13*v430 + v143*v425 + &
      v257*v56 + v262*v267 + v416*z + v417*z + v418*z
    Ms_yyzzzzz  = M_yyzzzzz + v604 + M_yyzzz*v56 + M_yyzzzz*z + M_z*v583 + M_zzz*v253 + &
      M_zzzzz*v43 + v143*v153 + v158*v285 + v19*v430 + v267*v66 + v281* &
      v56 + v286*v605 + v291*v43 + v451*z
    Ms_xxxzzzzz = M_xxxzzzzz + M_xxxzzzz*z + M_xxzzzzz*x + M_xz*v558 + M_xzzz*v226 + &
      M_xzzzzz*v32 + M_zz*v528 + M_zzzzz*v81 + v143*v199 + v267*v89 + &
      v27*v645 + v29*v430 + v291*v81 + v292*v638 + v31*v647 + v32*v428 &
      + v352*v56 + v355*(v138 + v140) + v510*v605 + v529*z + v643*v77
    Ms_xxyzzzzz = M_xxyzzzzz + M_xxyzzz*v56 + M_xxyzzzz*z + M_xxzzzzz*y + M_xyzzzzz*x + &
      M_yzzzzz*v32 + v143*(v624 + v695) + v161*v226 + v22*v558 + v267* &
      v560 + v3*v605*v8 + v32*v454 + v32*v456 + v32*v457 + v37*v430 + &
      v380*v56 + v381*v56 + v384*v56 + v385*v71 + v555*z + v556*z + &
      v557*z + v561*y
    Ms_xyyzzzzz = M_xyyzzzzz + M_xyyzzz*v56 + M_xyyzzzz*z + M_xyzzzzz*y + M_xzzzzz*v43 + &
      M_yyzzzzz*x + v1*v20*v605 + v139*v253 + v143*(v635 + v698) + v15* &
      v583 + v267*v585 + v410*v56 + v411*v56 + v414*v56 + v415*v58 + &
      v426*v43 + v428*v43 + v429*v43 + v430*v48 + v580*z + v581*z + &
      v582*z + v587*y
    Ms_yyyzzzzz = M_yyyzzzzz + M_yyyzz*v143 + M_yyyzzz*v56 + M_yyyzzzz*z + M_yyzzzzz*y + &
      M_yz*v583 + M_yzzz*v253 + M_yzzzzz*v43 + M_zz*v579 + M_zzzzz*v123 &
      + v123*v291 + v143*v277 + v147*v267 + v292*v294*v64 + v43*v456 + &
      v430*v63 + v445*v56 + v449*(v160 + v162) + v601*z + v603*v605 + &
      v64*v647
    c6          = c3*c3
    v459        = c6
    v590        = 0.00138888888888889d0*v459
    Ms_zzzzzz   = M_zzzzzz + v458 + M_z*v430 + M_zz*v267 + M_zzz*v143 + M_zzzz*v56 + v294* &
      v459
    Ms_xzzzzzz  = M_xzzzzzz + v589 + M_xzzzzz*z + v1*v590 + v139*v143 + v15*v430 + v264* &
      v56 + v267*v58 + v426*z
    Ms_yzzzzzz  = M_yzzzzzz + v606 + M_yzzzzz*z + v143*v161 + v22*v430 + v267*v71 + v288* &
      v56 + v3*v590 + v454*z
    Ms_xxzzzzzz = M_xxzzzzzz + M_xxzzzz*v56 + M_xxzzzzz*z + M_xzzzzzz*x + M_zzz*v385 + &
      M_zzzz*v226 + M_zzzzzz*v32 + v111*v267 + v116*v453 + v143*v228 + &
      v32*v458 + v387*v56 + v39*v430 + v459*v648 + v561*z + v590*v6 + &
      v651*v8
    Ms_xyzzzzzz = M_xyzzzzzz + M_xyzzzzz*z + M_xzzzzzz*y + M_yzzzzzz*x + v13*v590 + v143* &
      v257 + v262*v430 + v267*v425 + v419*v56 + v586*z + v587*z + v588* &
      z + v589*y
    Ms_yyzzzzzz = 0.000694444444444444d0*(v286*v459) + M_yyzzzz*v56 + M_yyzzzzz*z + &
      M_yyzzzzzz + M_yzzzzzz*y + M_zzz*v415 + M_zzzz*v253 + M_zzzzzz* &
      v43 + v143*v282 + v153*v267 + v158*v453 + v19*v590 + v20*v651 + &
      v43*v458 + v430*v66 + v451*v56 + v604*z
    c7          = c3*c4
    v607        = c7
    v653        = 0.000198412698412698d0*v607
    Ms_zzzzzzz  = M_zzzzzzz + M_z*v590 + M_zz*v430 + M_zzz*v267 + M_zzzz*v143 + M_zzzzz* &
      v56 + M_zzzzzz*z + v461*v607
    Ms_xzzzzzzz = M_xzzzzzzz + M_xzzzzzz*z + M_zzzzzzz*x + v1*v653 + v139*v267 + v143*v264 &
      + v15*v590 + v427*v56 + v430*v58 + v589*z
    Ms_yzzzzzzz = M_yzzzzzzz + M_yzzzzzz*z + M_zzzzzzz*y + v143*v288 + v161*v267 + v22* &
      v590 + v3*v653 + v430*v71 + v455*v56 + v606*z
    c8          = c4*c4
    Ms_zzzzzzzz = M_zzzzzzzz + M_z*v653 + M_zz*v590 + M_zzz*v430 + M_zzzz*v267 + M_zzzzz* &
      v143 + M_zzzzzz*v56 + M_zzzzzzz*z + c8*v608
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
#undef  M_xxyyz             
#undef  Ms_xxyyz            
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
#undef  Ms_xxxxxyz          
#undef  M_xxxxxyz           
#undef  Ms_xxxxxzz          
#undef  M_xxxxxzz           
#undef  Ms_xxxxyyy          
#undef  M_xxxxyyy           
#undef  Ms_xxxxyyz          
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  Ms_xxxxyzz          
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
#undef  Ms_xxxxyyyz         
#undef  M_xxxxyyyz          
#undef  M_xxxxyyzz          
#undef  Ms_xxxxyyzz         
#undef  Ms_xxxxyzzz         
#undef  M_xxxxyzzz          
#undef  Ms_xxxxzzzz         
#undef  M_xxxxzzzz          
#undef  M_xxxyyyyy          
#undef  Ms_xxxyyyyy         
#undef  M_xxxyyyyz          
#undef  Ms_xxxyyyyz         
#undef  Ms_xxxyyyzz         
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  Ms_xxxyyzzz         
#undef  Ms_xxxyzzzz         
#undef  M_xxxyzzzz          
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
#undef  M_xyyyyyyy          
#undef  Ms_xyyyyyyy         
#undef  M_xyyyyyyz          
#undef  Ms_xyyyyyyz         
#undef  M_xyyyyyzz          
#undef  Ms_xyyyyyzz         
#undef  M_xyyyyzzz          
#undef  Ms_xyyyyzzz         
#undef  M_xyyyzzzz          
#undef  Ms_xyyyzzzz         
#undef  M_xyyzzzzz          
#undef  Ms_xyyzzzzz         
#undef  Ms_xyzzzzzz         
#undef  M_xyzzzzzz          
#undef  M_xzzzzzzz          
#undef  Ms_xzzzzzzz         
#undef  Ms_yyyyyyyy         
#undef  M_yyyyyyyy          
#undef  Ms_yyyyyyyz         
#undef  M_yyyyyyyz          
#undef  M_yyyyyyzz          
#undef  Ms_yyyyyyzz         
#undef  Ms_yyyyyzzz         
#undef  M_yyyyyzzz          
#undef  Ms_yyyyzzzz         
#undef  M_yyyyzzzz          
#undef  M_yyyzzzzz          
#undef  Ms_yyyzzzzz         
#undef  Ms_yyzzzzzz         
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  Ms_yzzzzzzz         
#undef  M_zzzzzzzz          
#undef  Ms_zzzzzzzz         
    end subroutine mom_es_M2M
    
! OPS  2123*ADD + 2*DIV + 2437*MUL + 119*NEG + POW + 52*SUB = 4734  (6200 before optimization)
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
                v155, v156, v16, v17, v18, v19, v2, v20, v21, v22, v23, v24,&
                v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
                v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46,&
                v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57,&
                v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68,&
                v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8,&
                v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90,&
                v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_0, D_x,&
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
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz,&
                D_xxxxxxxx, D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz,&
                D_xxxxxxzz, D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz,&
                D_xxxxyyyy, D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz,&
                D_xxxyyyyy, D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz,&
                D_xxxzzzzz, D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz,&
                D_xxyyzzzz, D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz,&
                D_xyyyyyzz, D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz,&
                D_xzzzzzzz, D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz,&
                D_yyyyzzzz, D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define M_y                  M(2)
#define L_y                  L(2)
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
#define L_xyy                L(12)
#define M_xxz                M(12)
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
#define L_xxyyy              L(30)
#define M_yyyy               M(30)
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
#define M_xyyyyz             M(72)
#define L_xxxxyyyz           L(72)
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
    v152       = y*z
    v153       = x*y
    v138       = 15.0d0*v152
    v140       = v153
    v142       = v152
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v123       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v123
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
    v124       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v125       = v1*v19
    v27        = v124
    v29        = 7.0d0*v1
    v59        = v125
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v126       = v0*v31
    v65        = v126
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
    v127       = 3.0d0*h
    v128       = h*v0
    v129       = h*v1
    v130       = h*v19
    v132       = v1*v128
    v134       = h*v31
    v4         = -h
    v12        = v127
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v131       = v0*v17
    v133       = v1*v17
    v18        = 3.0d0*v17
    v20        = v128
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v129
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 + 630.0d0*v128 - 945.0d0*v19
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 + 630.0d0*v129 - 945.0d0*v31
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v130
    v51        = v131
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v132
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v133
    v67        = v33 + v53 + v66
    v69        = v134
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v148       = -v85
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
    v106       = v124*v17
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v149       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v113       = -v108
    v114       = -1430.0d0*v57
    v150       = v113 + v114
    v116       = -1351350.0d0*v132
    v151       = v111 + v116
    v117       = v1*v46
    v118       = v128*v31
    v120       = -(3.0d0*v46 + 286.0d0*v57)
    v121       = v17*v31
    v122       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
    u2         = 1.0/h
    u          = sqrt(u2)
    D_0        = u
    u3         = u*u2
    v2         = u3
    D_x        = -v2*x
    D_y        = -v2*y
    D_z        = -v2*z
    u4         = u2*u2
    u5         = u2*u3
    v3         = u5
    v135       = 3.0d0*v3
    v6         = v135*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v135*v142
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v136       = 3.0d0*v8
    v9         = v8*x
    v11        = v136*(h - v10)
    D_xxx      = -3.0d0*v9*(v123 - v127)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    D_xyz      = -v138*v9
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = v136*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v137       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v137*y
    v26        = v137*z
    v28        = v138*v15
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    D_xyyy     = v22*v30
    D_xyyz     = v26*(v29 + v4)
    D_xyzz     = -(D_xxxy + D_xyyy)
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v154       = v34*z
    v139       = 15.0d0*v34
    v35        = v139*x
    v39        = v154
    v41        = 315.0d0*v140*v154
    v42        = v139*y
    D_xxxxx    = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy    = v34*v38*y
    D_xxxxz    = v38*v39
    D_xxxyy    = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz    = v41*(h - v5)
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    D_xxyyy    = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz    = v39*(v36 - 945.0d0*v124 + 105.0d0*(v128 + v129))
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    D_xyyyy    = v34*v43*x
    D_xyyyz    = v41*(h - v7)
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
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
    v155       = 315.0d0*v44
    v141       = v155*x
    v45        = 45.0d0*v44
    v52        = v141*y
    v56        = v141*z
    v60        = v142*v155
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 - 21.0d0*v130 + v17*v29 + 14.0d0*v51 + 231.0d0*v59)
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy   = 945.0d0*v140*v44*(11.0d0*v27 + v17 + v61 + v62)
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy   = v45*(v58 - 21.0d0*v134 + v17*v24 + 14.0d0*v64 + 231.0d0*v65)
    D_xxyyyz   = v60*(-9.0d0*v20 + v62 + v63)
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy   = v52*v67
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
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
    v156       = 945.0d0*v70
    v143       = 315.0d0*v70
    v71        = v143*x
    v75        = v143*y
    v77        = v143*z
    v81        = v142*v156*x
    v83        = v156
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy  = v75*v76
    D_xxxxxxz  = v76*v77
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy  = -v83*y*(v148 + v1*v18 + v1*v82 - v84)
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy  = -v83*x*(v148 + v0*v18 + v0*v90 - v89)
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy  = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy  = v71*v94
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz  = v77*v94
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v144       = v153*v95
    v145       = v95*z
    v146       = v145*x
    v147       = v145*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v144
    v105       = 2835.0d0*v146
    v110       = v147
    v112       = 945.0d0*v144
    v115       = v146
    v119       = 2835.0d0*v147
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = v104*v105
    L_xxxxxxx  = D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxy*M_y + D_xxxxxxxz*M_z
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = -v96*(v149 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v131 + 155925.0d0*(-13.0d0*v130 + 13.0d0*v49))
    L_xxxxxxy  = D_xxxxxxxy*M_x + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyz*M_z
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*M_xx + D_xxxxxxxy*M_xy + &
      D_xxxxxxxz*M_xz + D_xxxxxxy*M_y + D_xxxxxxyy*M_yy + D_xxxxxxyz* &
      M_yz + D_xxxxxxz*M_z + D_xxxxxxzz*M_zz
    L_xxxxxxz  = D_xxxxxxxz*M_x + D_xxxxxxyz*M_y + D_xxxxxxz*M_0 + D_xxxxxxzz*M_z
    D_xxxxxyyy = v112*(v150 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = v115*(v151 + 2027025.0d0*v125 - 135135.0d0*v130 + 103950.0d0*v131 + &
      155925.0d0*v133)
    L_xxxxxyy  = D_xxxxxxyy*M_x + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyz*M_z
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    L_xxxxxy   = D_xxxxxxxy*M_xx + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyy*M_yy + D_xxxxxyyz*M_yz &
      + D_xxxxxyz*M_z + D_xxxxxyzz*M_zz
    L_xxxxxyz  = D_xxxxxxyz*M_x + D_xxxxxyyz*M_y + D_xxxxxyz*M_0 + D_xxxxxyzz*M_z
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxxx*M_xxx + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxz*M_xxz + D_xxxxxxy*M_xy + D_xxxxxxyy &
      *M_xyy + D_xxxxxxyz*M_xyz + D_xxxxxxz*M_xz + D_xxxxxxzz*M_xzz + &
      D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyyy*M_yyy + D_xxxxxyyz* &
      M_yyz + D_xxxxxyz*M_yz + D_xxxxxyzz*M_yzz + D_xxxxxz*M_z + &
      D_xxxxxzz*M_zz + D_xxxxxzzz*M_zzz
    L_xxxxxz   = D_xxxxxxxz*M_xx + D_xxxxxxyz*M_xy + D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + &
      D_xxxxxyyz*M_yy + D_xxxxxyz*M_y + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 &
      + D_xxxxxzz*M_z + D_xxxxxzzz*M_zz
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v117) - 858.0d0*(v1*v50 + v118))
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = v119*(v120 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    L_xxxxyyy  = D_xxxxxyyy*M_x + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyz*M_z
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    L_xxxxyy   = D_xxxxxxyy*M_xx + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyy*M_yy + D_xxxxyyyz*M_yz &
      + D_xxxxyyz*M_z + D_xxxxyyzz*M_zz
    L_xxxxyyz  = D_xxxxxyyz*M_x + D_xxxxyyyz*M_y + D_xxxxyyz*M_0 + D_xxxxyyzz*M_z
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    L_xxxxy    = D_xxxxxxxy*M_xxx + D_xxxxxxy*M_xx + D_xxxxxxyy*M_xxy + D_xxxxxxyz*M_xxz &
      + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyy*M_xyy + D_xxxxxyyz* &
      M_xyz + D_xxxxxyz*M_xz + D_xxxxxyzz*M_xzz + D_xxxxy*M_0 + &
      D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyyy*M_yyy + D_xxxxyyyz* &
      M_yyz + D_xxxxyyz*M_yz + D_xxxxyyzz*M_yzz + D_xxxxyz*M_z + &
      D_xxxxyzz*M_zz + D_xxxxyzzz*M_zzz
    L_xxxxyz   = D_xxxxxxyz*M_xx + D_xxxxxyyz*M_xy + D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + &
      D_xxxxyyyz*M_yy + D_xxxxyyz*M_y + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 &
      + D_xxxxyzz*M_z + D_xxxxyzzz*M_zz
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    L_xxxx     = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxxx* &
      M_xxxx + D_xxxxxxxy*M_xxxy + D_xxxxxxxz*M_xxxz + D_xxxxxxy*M_xxy &
      + D_xxxxxxyy*M_xxyy + D_xxxxxxyz*M_xxyz + D_xxxxxxz*M_xxz + &
      D_xxxxxxzz*M_xxzz + D_xxxxxy*M_xy + D_xxxxxyy*M_xyy + D_xxxxxyyy* &
      M_xyyy + D_xxxxxyyz*M_xyyz + D_xxxxxyz*M_xyz + D_xxxxxyzz*M_xyzz &
      + D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxxzzz*M_xzzz + D_xxxxy* &
      M_y + D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + D_xxxxyyyy*M_yyyy + &
      D_xxxxyyyz*M_yyyz + D_xxxxyyz*M_yyz + D_xxxxyyzz*M_yyzz + &
      D_xxxxyz*M_yz + D_xxxxyzz*M_yzz + D_xxxxyzzz*M_yzzz + D_xxxxz*M_z &
      + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz + D_xxxxzzzz*M_zzzz
    L_xxxxz    = D_xxxxxxxz*M_xxx + D_xxxxxxyz*M_xxy + D_xxxxxxz*M_xx + D_xxxxxxzz*M_xxz &
      + D_xxxxxyyz*M_xyy + D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxz &
      *M_x + D_xxxxxzz*M_xz + D_xxxxxzzz*M_xzz + D_xxxxyyyz*M_yyy + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyz*M_y + D_xxxxyzz*M_yz &
      + D_xxxxyzzz*M_yzz + D_xxxxz*M_0 + D_xxxxzz*M_z + D_xxxxzzz*M_zz &
      + D_xxxxzzzz*M_zzz
    D_xxxyyyyy = v112*(v150 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = v105*(v120 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    L_xxxyyyy  = D_xxxxyyyy*M_x + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyz*M_z
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    L_xxxyyy   = D_xxxxxyyy*M_xx + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyy*M_yy + D_xxxyyyyz*M_yz &
      + D_xxxyyyz*M_z + D_xxxyyyzz*M_zz
    L_xxxyyyz  = D_xxxxyyyz*M_x + D_xxxyyyyz*M_y + D_xxxyyyz*M_0 + D_xxxyyyzz*M_z
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    L_xxxyy    = D_xxxxxxyy*M_xxx + D_xxxxxyy*M_xx + D_xxxxxyyy*M_xxy + D_xxxxxyyz*M_xxz &
      + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyy*M_xyy + D_xxxxyyyz* &
      M_xyz + D_xxxxyyz*M_xz + D_xxxxyyzz*M_xzz + D_xxxyy*M_0 + &
      D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyyy*M_yyy + D_xxxyyyyz* &
      M_yyz + D_xxxyyyz*M_yz + D_xxxyyyzz*M_yzz + D_xxxyyz*M_z + &
      D_xxxyyzz*M_zz + D_xxxyyzzz*M_zzz
    L_xxxyyz   = D_xxxxxyyz*M_xx + D_xxxxyyyz*M_xy + D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + &
      D_xxxyyyyz*M_yy + D_xxxyyyz*M_y + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 &
      + D_xxxyyzz*M_z + D_xxxyyzzz*M_zz
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    L_xxxy     = D_xxxxxxxy*M_xxxx + D_xxxxxxy*M_xxx + D_xxxxxxyy*M_xxxy + D_xxxxxxyz* &
      M_xxxz + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + D_xxxxxyyy*M_xxyy + &
      D_xxxxxyyz*M_xxyz + D_xxxxxyz*M_xxz + D_xxxxxyzz*M_xxzz + D_xxxxy &
      *M_x + D_xxxxyy*M_xy + D_xxxxyyy*M_xyy + D_xxxxyyyy*M_xyyy + &
      D_xxxxyyyz*M_xyyz + D_xxxxyyz*M_xyz + D_xxxxyyzz*M_xyzz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxxyzzz*M_xzzz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyyy*M_yyy + D_xxxyyyyy* &
      M_yyyy + D_xxxyyyyz*M_yyyz + D_xxxyyyz*M_yyz + D_xxxyyyzz*M_yyzz &
      + D_xxxyyz*M_yz + D_xxxyyzz*M_yzz + D_xxxyyzzz*M_yzzz + D_xxxyz* &
      M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz + D_xxxyzzzz*M_zzzz
    L_xxxyz    = D_xxxxxxyz*M_xxx + D_xxxxxyyz*M_xxy + D_xxxxxyz*M_xx + D_xxxxxyzz*M_xxz &
      + D_xxxxyyyz*M_xyy + D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyz &
      *M_x + D_xxxxyzz*M_xz + D_xxxxyzzz*M_xzz + D_xxxyyyyz*M_yyy + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyz*M_y + D_xxxyyzz*M_yz &
      + D_xxxyyzzz*M_yzz + D_xxxyz*M_0 + D_xxxyzz*M_z + D_xxxyzzz*M_zz &
      + D_xxxyzzzz*M_zzz
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    L_xxx      = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxxx*M_xxxxx + D_xxxxxxxy*M_xxxxy + D_xxxxxxxz* &
      M_xxxxz + D_xxxxxxy*M_xxxy + D_xxxxxxyy*M_xxxyy + D_xxxxxxyz* &
      M_xxxyz + D_xxxxxxz*M_xxxz + D_xxxxxxzz*M_xxxzz + D_xxxxxy*M_xxy &
      + D_xxxxxyy*M_xxyy + D_xxxxxyyy*M_xxyyy + D_xxxxxyyz*M_xxyyz + &
      D_xxxxxyz*M_xxyz + D_xxxxxyzz*M_xxyzz + D_xxxxxz*M_xxz + &
      D_xxxxxzz*M_xxzz + D_xxxxxzzz*M_xxzzz + D_xxxxy*M_xy + D_xxxxyy* &
      M_xyy + D_xxxxyyy*M_xyyy + D_xxxxyyyy*M_xyyyy + D_xxxxyyyz* &
      M_xyyyz + D_xxxxyyz*M_xyyz + D_xxxxyyzz*M_xyyzz + D_xxxxyz*M_xyz &
      + D_xxxxyzz*M_xyzz + D_xxxxyzzz*M_xyzzz + D_xxxxz*M_xz + D_xxxxzz &
      *M_xzz + D_xxxxzzz*M_xzzz + D_xxxxzzzz*M_xzzzz + D_xxxy*M_y + &
      D_xxxyy*M_yy + D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyyy* &
      M_yyyyy + D_xxxyyyyz*M_yyyyz + D_xxxyyyz*M_yyyz + D_xxxyyyzz* &
      M_yyyzz + D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + D_xxxyyzzz*M_yyzzz &
      + D_xxxyz*M_yz + D_xxxyzz*M_yzz + D_xxxyzzz*M_yzzz + D_xxxyzzzz* &
      M_yzzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz + D_xxxzzzz* &
      M_zzzz + D_xxxzzzzz*M_zzzzz
    L_xxxz     = D_xxxxxxxz*M_xxxx + D_xxxxxxyz*M_xxxy + D_xxxxxxz*M_xxx + D_xxxxxxzz* &
      M_xxxz + D_xxxxxyyz*M_xxyy + D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz &
      + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + D_xxxxxzzz*M_xxzz + &
      D_xxxxyyyz*M_xyyy + D_xxxxyyz*M_xyy + D_xxxxyyzz*M_xyyz + &
      D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxyzzz*M_xyzz + D_xxxxz*M_x &
      + D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxxzzzz*M_xzzz + &
      D_xxxyyyyz*M_yyyy + D_xxxyyyz*M_yyy + D_xxxyyyzz*M_yyyz + &
      D_xxxyyz*M_yy + D_xxxyyzz*M_yyz + D_xxxyyzzz*M_yyzz + D_xxxyz*M_y &
      + D_xxxyzz*M_yz + D_xxxyzzz*M_yzz + D_xxxyzzzz*M_yzzz + D_xxxz* &
      M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz + D_xxxzzzzz* &
      M_zzzz
    D_xxyyyyyy = -v96*(v149 + h*v92 + v0*v108 + 135.0d0*v117 - 495.0d0*v121 + 6435.0d0*( &
      -v0*v68 + v118))
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = v110*(v151 + 2027025.0d0*v126 + 155925.0d0*v131 + 103950.0d0*v133 - &
      135135.0d0*v134)
    L_xxyyyyy  = D_xxxyyyyy*M_x + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyz*M_z
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    L_xxyyyy   = D_xxxxyyyy*M_xx + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyy*M_yy + D_xxyyyyyz*M_yz &
      + D_xxyyyyz*M_z + D_xxyyyyzz*M_zz
    L_xxyyyyz  = D_xxxyyyyz*M_x + D_xxyyyyyz*M_y + D_xxyyyyz*M_0 + D_xxyyyyzz*M_z
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    L_xxyyy    = D_xxxxxyyy*M_xxx + D_xxxxyyy*M_xx + D_xxxxyyyy*M_xxy + D_xxxxyyyz*M_xxz &
      + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyy*M_xyy + D_xxxyyyyz* &
      M_xyz + D_xxxyyyz*M_xz + D_xxxyyyzz*M_xzz + D_xxyyy*M_0 + &
      D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyyy*M_yyy + D_xxyyyyyz* &
      M_yyz + D_xxyyyyz*M_yz + D_xxyyyyzz*M_yzz + D_xxyyyz*M_z + &
      D_xxyyyzz*M_zz + D_xxyyyzzz*M_zzz
    L_xxyyyz   = D_xxxxyyyz*M_xx + D_xxxyyyyz*M_xy + D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + &
      D_xxyyyyyz*M_yy + D_xxyyyyz*M_y + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 &
      + D_xxyyyzz*M_z + D_xxyyyzzz*M_zz
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    L_xxyy     = D_xxxxxxyy*M_xxxx + D_xxxxxyy*M_xxx + D_xxxxxyyy*M_xxxy + D_xxxxxyyz* &
      M_xxxz + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + D_xxxxyyyy*M_xxyy + &
      D_xxxxyyyz*M_xxyz + D_xxxxyyz*M_xxz + D_xxxxyyzz*M_xxzz + D_xxxyy &
      *M_x + D_xxxyyy*M_xy + D_xxxyyyy*M_xyy + D_xxxyyyyy*M_xyyy + &
      D_xxxyyyyz*M_xyyz + D_xxxyyyz*M_xyz + D_xxxyyyzz*M_xyzz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxxyyzzz*M_xzzz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyyy*M_yyy + D_xxyyyyyy* &
      M_yyyy + D_xxyyyyyz*M_yyyz + D_xxyyyyz*M_yyz + D_xxyyyyzz*M_yyzz &
      + D_xxyyyz*M_yz + D_xxyyyzz*M_yzz + D_xxyyyzzz*M_yzzz + D_xxyyz* &
      M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz + D_xxyyzzzz*M_zzzz
    L_xxyyz    = D_xxxxxyyz*M_xxx + D_xxxxyyyz*M_xxy + D_xxxxyyz*M_xx + D_xxxxyyzz*M_xxz &
      + D_xxxyyyyz*M_xyy + D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyz &
      *M_x + D_xxxyyzz*M_xz + D_xxxyyzzz*M_xzz + D_xxyyyyyz*M_yyy + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyz*M_y + D_xxyyyzz*M_yz &
      + D_xxyyyzzz*M_yzz + D_xxyyz*M_0 + D_xxyyzz*M_z + D_xxyyzzz*M_zz &
      + D_xxyyzzzz*M_zzz
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    L_xxy      = D_xxxxxxxy*M_xxxxx + D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + D_xxxxxxyz* &
      M_xxxxz + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + D_xxxxxyyy*M_xxxyy &
      + D_xxxxxyyz*M_xxxyz + D_xxxxxyz*M_xxxz + D_xxxxxyzz*M_xxxzz + &
      D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyyy* &
      M_xxyyy + D_xxxxyyyz*M_xxyyz + D_xxxxyyz*M_xxyz + D_xxxxyyzz* &
      M_xxyzz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + D_xxxxyzzz*M_xxzzz &
      + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + &
      D_xxxyyyyy*M_xyyyy + D_xxxyyyyz*M_xyyyz + D_xxxyyyz*M_xyyz + &
      D_xxxyyyzz*M_xyyzz + D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + &
      D_xxxyyzzz*M_xyzzz + D_xxxyz*M_xz + D_xxxyzz*M_xzz + D_xxxyzzz* &
      M_xzzz + D_xxxyzzzz*M_xzzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy* &
      M_yy + D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyyy*M_yyyyy + &
      D_xxyyyyyz*M_yyyyz + D_xxyyyyz*M_yyyz + D_xxyyyyzz*M_yyyzz + &
      D_xxyyyz*M_yyz + D_xxyyyzz*M_yyzz + D_xxyyyzzz*M_yyzzz + D_xxyyz* &
      M_yz + D_xxyyzz*M_yzz + D_xxyyzzz*M_yzzz + D_xxyyzzzz*M_yzzzz + &
      D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz + D_xxyzzzz*M_zzzz + &
      D_xxyzzzzz*M_zzzzz
    L_xxyz     = D_xxxxxxyz*M_xxxx + D_xxxxxyyz*M_xxxy + D_xxxxxyz*M_xxx + D_xxxxxyzz* &
      M_xxxz + D_xxxxyyyz*M_xxyy + D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz &
      + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + D_xxxxyzzz*M_xxzz + &
      D_xxxyyyyz*M_xyyy + D_xxxyyyz*M_xyy + D_xxxyyyzz*M_xyyz + &
      D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyyzzz*M_xyzz + D_xxxyz*M_x &
      + D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxxyzzzz*M_xzzz + &
      D_xxyyyyyz*M_yyyy + D_xxyyyyz*M_yyy + D_xxyyyyzz*M_yyyz + &
      D_xxyyyz*M_yy + D_xxyyyzz*M_yyz + D_xxyyyzzz*M_yyzz + D_xxyyz*M_y &
      + D_xxyyzz*M_yz + D_xxyyzzz*M_yzz + D_xxyyzzzz*M_yzzz + D_xxyz* &
      M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz + D_xxyzzzzz* &
      M_zzzz
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    L_xx       = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxxx*M_xxxxxx + D_xxxxxxxy*M_xxxxxy + &
      D_xxxxxxxz*M_xxxxxz + D_xxxxxxy*M_xxxxy + D_xxxxxxyy*M_xxxxyy + &
      D_xxxxxxyz*M_xxxxyz + D_xxxxxxz*M_xxxxz + D_xxxxxxzz*M_xxxxzz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyyy*M_xxxyyy + &
      D_xxxxxyyz*M_xxxyyz + D_xxxxxyz*M_xxxyz + D_xxxxxyzz*M_xxxyzz + &
      D_xxxxxz*M_xxxz + D_xxxxxzz*M_xxxzz + D_xxxxxzzz*M_xxxzzz + &
      D_xxxxy*M_xxy + D_xxxxyy*M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyyy* &
      M_xxyyyy + D_xxxxyyyz*M_xxyyyz + D_xxxxyyz*M_xxyyz + D_xxxxyyzz* &
      M_xxyyzz + D_xxxxyz*M_xxyz + D_xxxxyzz*M_xxyzz + D_xxxxyzzz* &
      M_xxyzzz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz*M_xxzzz + &
      D_xxxxzzzz*M_xxzzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy* &
      M_xyyy + D_xxxyyyy*M_xyyyy + D_xxxyyyyy*M_xyyyyy + D_xxxyyyyz* &
      M_xyyyyz + D_xxxyyyz*M_xyyyz + D_xxxyyyzz*M_xyyyzz + D_xxxyyz* &
      M_xyyz + D_xxxyyzz*M_xyyzz + D_xxxyyzzz*M_xyyzzz + D_xxxyz*M_xyz &
      + D_xxxyzz*M_xyzz + D_xxxyzzz*M_xyzzz + D_xxxyzzzz*M_xyzzzz + &
      D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz*M_xzzz + D_xxxzzzz*M_xzzzz &
      + D_xxxzzzzz*M_xzzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyyy*M_yyyyyy + &
      D_xxyyyyyz*M_yyyyyz + D_xxyyyyz*M_yyyyz + D_xxyyyyzz*M_yyyyzz + &
      D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + D_xxyyyzzz*M_yyyzzz + &
      D_xxyyz*M_yyz + D_xxyyzz*M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyyzzzz* &
      M_yyzzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz*M_yzzz + &
      D_xxyzzzz*M_yzzzz + D_xxyzzzzz*M_yzzzzz + D_xxz*M_z + D_xxzz*M_zz &
      + D_xxzzz*M_zzz + D_xxzzzz*M_zzzz + D_xxzzzzz*M_zzzzz + &
      D_xxzzzzzz*M_zzzzzz
    L_xxz      = D_xxxxxxxz*M_xxxxx + D_xxxxxxyz*M_xxxxy + D_xxxxxxz*M_xxxx + D_xxxxxxzz* &
      M_xxxxz + D_xxxxxyyz*M_xxxyy + D_xxxxxyz*M_xxxy + D_xxxxxyzz* &
      M_xxxyz + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + D_xxxxxzzz*M_xxxzz &
      + D_xxxxyyyz*M_xxyyy + D_xxxxyyz*M_xxyy + D_xxxxyyzz*M_xxyyz + &
      D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxyzzz*M_xxyzz + D_xxxxz* &
      M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxxzzzz*M_xxzzz + &
      D_xxxyyyyz*M_xyyyy + D_xxxyyyz*M_xyyy + D_xxxyyyzz*M_xyyyz + &
      D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyyzzz*M_xyyzz + D_xxxyz* &
      M_xy + D_xxxyzz*M_xyz + D_xxxyzzz*M_xyzz + D_xxxyzzzz*M_xyzzz + &
      D_xxxz*M_x + D_xxxzz*M_xz + D_xxxzzz*M_xzz + D_xxxzzzz*M_xzzz + &
      D_xxxzzzzz*M_xzzzz + D_xxyyyyyz*M_yyyyy + D_xxyyyyz*M_yyyy + &
      D_xxyyyyzz*M_yyyyz + D_xxyyyz*M_yyy + D_xxyyyzz*M_yyyz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyyzzz* &
      M_yyzz + D_xxyyzzzz*M_yyzzz + D_xxyz*M_y + D_xxyzz*M_yz + &
      D_xxyzzz*M_yzz + D_xxyzzzz*M_yzzz + D_xxyzzzzz*M_yzzzz + D_xxz* &
      M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + D_xxzzzzz* &
      M_zzzz + D_xxzzzzzz*M_zzzzz
    D_xyyyyyyy = v102*v122
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = v115*(v111 + 467775.0d0*v133 + 155925.0d0*(-13.0d0*v134 + 13.0d0*v68))
    L_xyyyyyy  = D_xxyyyyyy*M_x + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyz*M_z
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    L_xyyyyy   = D_xxxyyyyy*M_xx + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyy*M_yy + D_xyyyyyyz*M_yz &
      + D_xyyyyyz*M_z + D_xyyyyyzz*M_zz
    L_xyyyyyz  = D_xxyyyyyz*M_x + D_xyyyyyyz*M_y + D_xyyyyyz*M_0 + D_xyyyyyzz*M_z
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    L_xyyyy    = D_xxxxyyyy*M_xxx + D_xxxyyyy*M_xx + D_xxxyyyyy*M_xxy + D_xxxyyyyz*M_xxz &
      + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyy*M_xyy + D_xxyyyyyz* &
      M_xyz + D_xxyyyyz*M_xz + D_xxyyyyzz*M_xzz + D_xyyyy*M_0 + &
      D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyyy*M_yyy + D_xyyyyyyz* &
      M_yyz + D_xyyyyyz*M_yz + D_xyyyyyzz*M_yzz + D_xyyyyz*M_z + &
      D_xyyyyzz*M_zz + D_xyyyyzzz*M_zzz
    L_xyyyyz   = D_xxxyyyyz*M_xx + D_xxyyyyyz*M_xy + D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + &
      D_xyyyyyyz*M_yy + D_xyyyyyz*M_y + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 &
      + D_xyyyyzz*M_z + D_xyyyyzzz*M_zz
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    L_xyyy     = D_xxxxxyyy*M_xxxx + D_xxxxyyy*M_xxx + D_xxxxyyyy*M_xxxy + D_xxxxyyyz* &
      M_xxxz + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + D_xxxyyyyy*M_xxyy + &
      D_xxxyyyyz*M_xxyz + D_xxxyyyz*M_xxz + D_xxxyyyzz*M_xxzz + D_xxyyy &
      *M_x + D_xxyyyy*M_xy + D_xxyyyyy*M_xyy + D_xxyyyyyy*M_xyyy + &
      D_xxyyyyyz*M_xyyz + D_xxyyyyz*M_xyz + D_xxyyyyzz*M_xyzz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xxyyyzzz*M_xzzz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyyy*M_yyy + D_xyyyyyyy* &
      M_yyyy + D_xyyyyyyz*M_yyyz + D_xyyyyyz*M_yyz + D_xyyyyyzz*M_yyzz &
      + D_xyyyyz*M_yz + D_xyyyyzz*M_yzz + D_xyyyyzzz*M_yzzz + D_xyyyz* &
      M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz + D_xyyyzzzz*M_zzzz
    L_xyyyz    = D_xxxxyyyz*M_xxx + D_xxxyyyyz*M_xxy + D_xxxyyyz*M_xx + D_xxxyyyzz*M_xxz &
      + D_xxyyyyyz*M_xyy + D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyz &
      *M_x + D_xxyyyzz*M_xz + D_xxyyyzzz*M_xzz + D_xyyyyyyz*M_yyy + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyz*M_y + D_xyyyyzz*M_yz &
      + D_xyyyyzzz*M_yzz + D_xyyyz*M_0 + D_xyyyzz*M_z + D_xyyyzzz*M_zz &
      + D_xyyyzzzz*M_zzz
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    L_xyy      = D_xxxxxxyy*M_xxxxx + D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + D_xxxxxyyz* &
      M_xxxxz + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + D_xxxxyyyy*M_xxxyy &
      + D_xxxxyyyz*M_xxxyz + D_xxxxyyz*M_xxxz + D_xxxxyyzz*M_xxxzz + &
      D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyyy* &
      M_xxyyy + D_xxxyyyyz*M_xxyyz + D_xxxyyyz*M_xxyz + D_xxxyyyzz* &
      M_xxyzz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + D_xxxyyzzz*M_xxzzz &
      + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + &
      D_xxyyyyyy*M_xyyyy + D_xxyyyyyz*M_xyyyz + D_xxyyyyz*M_xyyz + &
      D_xxyyyyzz*M_xyyzz + D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + &
      D_xxyyyzzz*M_xyzzz + D_xxyyz*M_xz + D_xxyyzz*M_xzz + D_xxyyzzz* &
      M_xzzz + D_xxyyzzzz*M_xzzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy* &
      M_yy + D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyyy*M_yyyyy + &
      D_xyyyyyyz*M_yyyyz + D_xyyyyyz*M_yyyz + D_xyyyyyzz*M_yyyzz + &
      D_xyyyyz*M_yyz + D_xyyyyzz*M_yyzz + D_xyyyyzzz*M_yyzzz + D_xyyyz* &
      M_yz + D_xyyyzz*M_yzz + D_xyyyzzz*M_yzzz + D_xyyyzzzz*M_yzzzz + &
      D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz + D_xyyzzzz*M_zzzz + &
      D_xyyzzzzz*M_zzzzz
    L_xyyz     = D_xxxxxyyz*M_xxxx + D_xxxxyyyz*M_xxxy + D_xxxxyyz*M_xxx + D_xxxxyyzz* &
      M_xxxz + D_xxxyyyyz*M_xxyy + D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz &
      + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + D_xxxyyzzz*M_xxzz + &
      D_xxyyyyyz*M_xyyy + D_xxyyyyz*M_xyy + D_xxyyyyzz*M_xyyz + &
      D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyyzzz*M_xyzz + D_xxyyz*M_x &
      + D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xxyyzzzz*M_xzzz + &
      D_xyyyyyyz*M_yyyy + D_xyyyyyz*M_yyy + D_xyyyyyzz*M_yyyz + &
      D_xyyyyz*M_yy + D_xyyyyzz*M_yyz + D_xyyyyzzz*M_yyzz + D_xyyyz*M_y &
      + D_xyyyzz*M_yz + D_xyyyzzz*M_yzz + D_xyyyzzzz*M_yzzz + D_xyyz* &
      M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz + D_xyyzzzzz* &
      M_zzzz
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    L_xy       = D_xxxxxxxy*M_xxxxxx + D_xxxxxxy*M_xxxxx + D_xxxxxxyy*M_xxxxxy + &
      D_xxxxxxyz*M_xxxxxz + D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + &
      D_xxxxxyyy*M_xxxxyy + D_xxxxxyyz*M_xxxxyz + D_xxxxxyz*M_xxxxz + &
      D_xxxxxyzz*M_xxxxzz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy &
      *M_xxxyy + D_xxxxyyyy*M_xxxyyy + D_xxxxyyyz*M_xxxyyz + D_xxxxyyz* &
      M_xxxyz + D_xxxxyyzz*M_xxxyzz + D_xxxxyz*M_xxxz + D_xxxxyzz* &
      M_xxxzz + D_xxxxyzzz*M_xxxzzz + D_xxxy*M_xx + D_xxxyy*M_xxy + &
      D_xxxyyy*M_xxyy + D_xxxyyyy*M_xxyyy + D_xxxyyyyy*M_xxyyyy + &
      D_xxxyyyyz*M_xxyyyz + D_xxxyyyz*M_xxyyz + D_xxxyyyzz*M_xxyyzz + &
      D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + D_xxxyyzzz*M_xxyzzz + &
      D_xxxyz*M_xxz + D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxxyzzzz* &
      M_xxzzzz + D_xxy*M_x + D_xxyy*M_xy + D_xxyyy*M_xyy + D_xxyyyy* &
      M_xyyy + D_xxyyyyy*M_xyyyy + D_xxyyyyyy*M_xyyyyy + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyyyz*M_xyyyz + D_xxyyyyzz*M_xyyyzz + D_xxyyyz* &
      M_xyyz + D_xxyyyzz*M_xyyzz + D_xxyyyzzz*M_xyyzzz + D_xxyyz*M_xyz &
      + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyyzzzz*M_xyzzzz + &
      D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz*M_xzzz + D_xxyzzzz*M_xzzzz &
      + D_xxyzzzzz*M_xzzzzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + &
      D_xyyyy*M_yyy + D_xyyyyy*M_yyyy + D_xyyyyyy*M_yyyyy + D_xyyyyyyy* &
      M_yyyyyy + D_xyyyyyyz*M_yyyyyz + D_xyyyyyz*M_yyyyz + D_xyyyyyzz* &
      M_yyyyzz + D_xyyyyz*M_yyyz + D_xyyyyzz*M_yyyzz + D_xyyyyzzz* &
      M_yyyzzz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz*M_yyzzz + &
      D_xyyyzzzz*M_yyzzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz* &
      M_yzzz + D_xyyzzzz*M_yzzzz + D_xyyzzzzz*M_yzzzzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz*M_zzzz + D_xyzzzzz*M_zzzzz &
      + D_xyzzzzzz*M_zzzzzz
    L_xyz      = D_xxxxxxyz*M_xxxxx + D_xxxxxyyz*M_xxxxy + D_xxxxxyz*M_xxxx + D_xxxxxyzz* &
      M_xxxxz + D_xxxxyyyz*M_xxxyy + D_xxxxyyz*M_xxxy + D_xxxxyyzz* &
      M_xxxyz + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + D_xxxxyzzz*M_xxxzz &
      + D_xxxyyyyz*M_xxyyy + D_xxxyyyz*M_xxyy + D_xxxyyyzz*M_xxyyz + &
      D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyyzzz*M_xxyzz + D_xxxyz* &
      M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxxyzzzz*M_xxzzz + &
      D_xxyyyyyz*M_xyyyy + D_xxyyyyz*M_xyyy + D_xxyyyyzz*M_xyyyz + &
      D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyyzzz*M_xyyzz + D_xxyyz* &
      M_xy + D_xxyyzz*M_xyz + D_xxyyzzz*M_xyzz + D_xxyyzzzz*M_xyzzz + &
      D_xxyz*M_x + D_xxyzz*M_xz + D_xxyzzz*M_xzz + D_xxyzzzz*M_xzzz + &
      D_xxyzzzzz*M_xzzzz + D_xyyyyyyz*M_yyyyy + D_xyyyyyz*M_yyyy + &
      D_xyyyyyzz*M_yyyyz + D_xyyyyz*M_yyy + D_xyyyyzz*M_yyyz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyyzzz* &
      M_yyzz + D_xyyyzzzz*M_yyzzz + D_xyyz*M_y + D_xyyzz*M_yz + &
      D_xyyzzz*M_yzz + D_xyyzzzz*M_yzzz + D_xyyzzzzz*M_yzzzz + D_xyz* &
      M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + D_xyzzzzz* &
      M_zzzz + D_xyzzzzzz*M_zzzzz
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxy*M_xxxxxxy + D_xxxxxxxz*M_xxxxxxz + D_xxxxxxy*M_xxxxxy &
      + D_xxxxxxyy*M_xxxxxyy + D_xxxxxxyz*M_xxxxxyz + D_xxxxxxz* &
      M_xxxxxz + D_xxxxxxzz*M_xxxxxzz + D_xxxxxy*M_xxxxy + D_xxxxxyy* &
      M_xxxxyy + D_xxxxxyyy*M_xxxxyyy + D_xxxxxyyz*M_xxxxyyz + &
      D_xxxxxyz*M_xxxxyz + D_xxxxxyzz*M_xxxxyzz + D_xxxxxz*M_xxxxz + &
      D_xxxxxzz*M_xxxxzz + D_xxxxxzzz*M_xxxxzzz + D_xxxxy*M_xxxy + &
      D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + D_xxxxyyyy*M_xxxyyyy + &
      D_xxxxyyyz*M_xxxyyyz + D_xxxxyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyyzz &
      + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + D_xxxxyzzz*M_xxxyzzz + &
      D_xxxxz*M_xxxz + D_xxxxzz*M_xxxzz + D_xxxxzzz*M_xxxzzz + &
      D_xxxxzzzz*M_xxxzzzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy* &
      M_xxyyy + D_xxxyyyy*M_xxyyyy + D_xxxyyyyy*M_xxyyyyy + D_xxxyyyyz* &
      M_xxyyyyz + D_xxxyyyz*M_xxyyyz + D_xxxyyyzz*M_xxyyyzz + D_xxxyyz* &
      M_xxyyz + D_xxxyyzz*M_xxyyzz + D_xxxyyzzz*M_xxyyzzz + D_xxxyz* &
      M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + D_xxxyzzzz* &
      M_xxyzzzz + D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + &
      D_xxxzzzz*M_xxzzzz + D_xxxzzzzz*M_xxzzzzz + D_xxy*M_xy + D_xxyy* &
      M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyyy*M_xyyyyy + &
      D_xxyyyyyy*M_xyyyyyy + D_xxyyyyyz*M_xyyyyyz + D_xxyyyyz*M_xyyyyz &
      + D_xxyyyyzz*M_xyyyyzz + D_xxyyyz*M_xyyyz + D_xxyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyyzzz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + &
      D_xxyyzzz*M_xyyzzz + D_xxyyzzzz*M_xyyzzzz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxyzzz*M_xyzzz + D_xxyzzzz*M_xyzzzz + &
      D_xxyzzzzz*M_xyzzzzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz*M_xzzz &
      + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xxzzzzzz*M_xzzzzzz + &
      D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy* &
      M_yyyyy + D_xyyyyyy*M_yyyyyy + D_xyyyyyyy*M_yyyyyyy + D_xyyyyyyz* &
      M_yyyyyyz + D_xyyyyyz*M_yyyyyz + D_xyyyyyzz*M_yyyyyzz + D_xyyyyz* &
      M_yyyyz + D_xyyyyzz*M_yyyyzz + D_xyyyyzzz*M_yyyyzzz + D_xyyyz* &
      M_yyyz + D_xyyyzz*M_yyyzz + D_xyyyzzz*M_yyyzzz + D_xyyyzzzz* &
      M_yyyzzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz*M_yyzzz + &
      D_xyyzzzz*M_yyzzzz + D_xyyzzzzz*M_yyzzzzz + D_xyz*M_yz + D_xyzz* &
      M_yzz + D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + &
      D_xyzzzzzz*M_yzzzzzz + D_xz*M_z + D_xzz*M_zz + D_xzzz*M_zzz + &
      D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + D_xzzzzzz*M_zzzzzz + &
      D_xzzzzzzz*M_zzzzzzz
    L_xz       = D_xxxxxxxz*M_xxxxxx + D_xxxxxxyz*M_xxxxxy + D_xxxxxxz*M_xxxxx + &
      D_xxxxxxzz*M_xxxxxz + D_xxxxxyyz*M_xxxxyy + D_xxxxxyz*M_xxxxy + &
      D_xxxxxyzz*M_xxxxyz + D_xxxxxz*M_xxxx + D_xxxxxzz*M_xxxxz + &
      D_xxxxxzzz*M_xxxxzz + D_xxxxyyyz*M_xxxyyy + D_xxxxyyz*M_xxxyy + &
      D_xxxxyyzz*M_xxxyyz + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz + &
      D_xxxxyzzz*M_xxxyzz + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxxxzzz &
      *M_xxxzz + D_xxxxzzzz*M_xxxzzz + D_xxxyyyyz*M_xxyyyy + D_xxxyyyz* &
      M_xxyyy + D_xxxyyyzz*M_xxyyyz + D_xxxyyz*M_xxyy + D_xxxyyzz* &
      M_xxyyz + D_xxxyyzzz*M_xxyyzz + D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + &
      D_xxxyzzz*M_xxyzz + D_xxxyzzzz*M_xxyzzz + D_xxxz*M_xx + D_xxxzz* &
      M_xxz + D_xxxzzz*M_xxzz + D_xxxzzzz*M_xxzzz + D_xxxzzzzz*M_xxzzzz &
      + D_xxyyyyyz*M_xyyyyy + D_xxyyyyz*M_xyyyy + D_xxyyyyzz*M_xyyyyz + &
      D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyyyzzz*M_xyyyzz + &
      D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyyzzzz* &
      M_xyyzzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz*M_xyzz + &
      D_xxyzzzz*M_xyzzz + D_xxyzzzzz*M_xyzzzz + D_xxz*M_x + D_xxzz*M_xz &
      + D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + D_xxzzzzz*M_xzzzz + &
      D_xxzzzzzz*M_xzzzzz + D_xyyyyyyz*M_yyyyyy + D_xyyyyyz*M_yyyyy + &
      D_xyyyyyzz*M_yyyyyz + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + &
      D_xyyyyzzz*M_yyyyzz + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyyyzzz &
      *M_yyyzz + D_xyyyzzzz*M_yyyzzz + D_xyyz*M_yy + D_xyyzz*M_yyz + &
      D_xyyzzz*M_yyzz + D_xyyzzzz*M_yyzzz + D_xyyzzzzz*M_yyzzzz + D_xyz &
      *M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xyzzzzz* &
      M_yzzzz + D_xyzzzzzz*M_yzzzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz* &
      M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz + D_xzzzzzz*M_zzzzz + &
      D_xzzzzzzz*M_zzzzzz
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v121 - (1260.0d0*v117 + v68*v99))
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = v119*v122
    L_yyyyyyy  = D_xyyyyyyy*M_x + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyz*M_z
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = D_xxyyyyyy*M_xx + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*M_yy + D_yyyyyyyz*M_yz &
      + D_yyyyyyz*M_z + D_yyyyyyzz*M_zz
    L_yyyyyyz  = D_xyyyyyyz*M_x + D_yyyyyyyz*M_y + D_yyyyyyz*M_0 + D_yyyyyyzz*M_z
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = D_xxxyyyyy*M_xxx + D_xxyyyyy*M_xx + D_xxyyyyyy*M_xxy + D_xxyyyyyz*M_xxz &
      + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyy*M_xyy + D_xyyyyyyz* &
      M_xyz + D_xyyyyyz*M_xz + D_xyyyyyzz*M_xzz + D_yyyyy*M_0 + &
      D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyyy*M_yyy + D_yyyyyyyz* &
      M_yyz + D_yyyyyyz*M_yz + D_yyyyyyzz*M_yzz + D_yyyyyz*M_z + &
      D_yyyyyzz*M_zz + D_yyyyyzzz*M_zzz
    L_yyyyyz   = D_xxyyyyyz*M_xx + D_xyyyyyyz*M_xy + D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + &
      D_yyyyyyyz*M_yy + D_yyyyyyz*M_y + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 &
      + D_yyyyyzz*M_z + D_yyyyyzzz*M_zz
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = D_xxxxyyyy*M_xxxx + D_xxxyyyy*M_xxx + D_xxxyyyyy*M_xxxy + D_xxxyyyyz* &
      M_xxxz + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + D_xxyyyyyy*M_xxyy + &
      D_xxyyyyyz*M_xxyz + D_xxyyyyz*M_xxz + D_xxyyyyzz*M_xxzz + D_xyyyy &
      *M_x + D_xyyyyy*M_xy + D_xyyyyyy*M_xyy + D_xyyyyyyy*M_xyyy + &
      D_xyyyyyyz*M_xyyz + D_xyyyyyz*M_xyz + D_xyyyyyzz*M_xyzz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_xyyyyzzz*M_xzzz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyyy*M_yyy + D_yyyyyyyy* &
      M_yyyy + D_yyyyyyyz*M_yyyz + D_yyyyyyz*M_yyz + D_yyyyyyzz*M_yyzz &
      + D_yyyyyz*M_yz + D_yyyyyzz*M_yzz + D_yyyyyzzz*M_yzzz + D_yyyyz* &
      M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz + D_yyyyzzzz*M_zzzz
    L_yyyyz    = D_xxxyyyyz*M_xxx + D_xxyyyyyz*M_xxy + D_xxyyyyz*M_xx + D_xxyyyyzz*M_xxz &
      + D_xyyyyyyz*M_xyy + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyz &
      *M_x + D_xyyyyzz*M_xz + D_xyyyyzzz*M_xzz + D_yyyyyyyz*M_yyy + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyz*M_y + D_yyyyyzz*M_yz &
      + D_yyyyyzzz*M_yzz + D_yyyyz*M_0 + D_yyyyzz*M_z + D_yyyyzzz*M_zz &
      + D_yyyyzzzz*M_zzz
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = D_xxxxxyyy*M_xxxxx + D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + D_xxxxyyyz* &
      M_xxxxz + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + D_xxxyyyyy*M_xxxyy &
      + D_xxxyyyyz*M_xxxyz + D_xxxyyyz*M_xxxz + D_xxxyyyzz*M_xxxzz + &
      D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyyy* &
      M_xxyyy + D_xxyyyyyz*M_xxyyz + D_xxyyyyz*M_xxyz + D_xxyyyyzz* &
      M_xxyzz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + D_xxyyyzzz*M_xxzzz &
      + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + &
      D_xyyyyyyy*M_xyyyy + D_xyyyyyyz*M_xyyyz + D_xyyyyyz*M_xyyz + &
      D_xyyyyyzz*M_xyyzz + D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + &
      D_xyyyyzzz*M_xyzzz + D_xyyyz*M_xz + D_xyyyzz*M_xzz + D_xyyyzzz* &
      M_xzzz + D_xyyyzzzz*M_xzzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy* &
      M_yy + D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyyy*M_yyyyy + &
      D_yyyyyyyz*M_yyyyz + D_yyyyyyz*M_yyyz + D_yyyyyyzz*M_yyyzz + &
      D_yyyyyz*M_yyz + D_yyyyyzz*M_yyzz + D_yyyyyzzz*M_yyzzz + D_yyyyz* &
      M_yz + D_yyyyzz*M_yzz + D_yyyyzzz*M_yzzz + D_yyyyzzzz*M_yzzzz + &
      D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz + D_yyyzzzz*M_zzzz + &
      D_yyyzzzzz*M_zzzzz
    L_yyyz     = D_xxxxyyyz*M_xxxx + D_xxxyyyyz*M_xxxy + D_xxxyyyz*M_xxx + D_xxxyyyzz* &
      M_xxxz + D_xxyyyyyz*M_xxyy + D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz &
      + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + D_xxyyyzzz*M_xxzz + &
      D_xyyyyyyz*M_xyyy + D_xyyyyyz*M_xyy + D_xyyyyyzz*M_xyyz + &
      D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyyzzz*M_xyzz + D_xyyyz*M_x &
      + D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_xyyyzzzz*M_xzzz + &
      D_yyyyyyyz*M_yyyy + D_yyyyyyz*M_yyy + D_yyyyyyzz*M_yyyz + &
      D_yyyyyz*M_yy + D_yyyyyzz*M_yyz + D_yyyyyzzz*M_yyzz + D_yyyyz*M_y &
      + D_yyyyzz*M_yz + D_yyyyzzz*M_yzz + D_yyyyzzzz*M_yzzz + D_yyyz* &
      M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz + D_yyyzzzzz* &
      M_zzzz
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = D_xxxxxxyy*M_xxxxxx + D_xxxxxyy*M_xxxxx + D_xxxxxyyy*M_xxxxxy + &
      D_xxxxxyyz*M_xxxxxz + D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + &
      D_xxxxyyyy*M_xxxxyy + D_xxxxyyyz*M_xxxxyz + D_xxxxyyz*M_xxxxz + &
      D_xxxxyyzz*M_xxxxzz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy &
      *M_xxxyy + D_xxxyyyyy*M_xxxyyy + D_xxxyyyyz*M_xxxyyz + D_xxxyyyz* &
      M_xxxyz + D_xxxyyyzz*M_xxxyzz + D_xxxyyz*M_xxxz + D_xxxyyzz* &
      M_xxxzz + D_xxxyyzzz*M_xxxzzz + D_xxyy*M_xx + D_xxyyy*M_xxy + &
      D_xxyyyy*M_xxyy + D_xxyyyyy*M_xxyyy + D_xxyyyyyy*M_xxyyyy + &
      D_xxyyyyyz*M_xxyyyz + D_xxyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyyzz + &
      D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + D_xxyyyzzz*M_xxyzzz + &
      D_xxyyz*M_xxz + D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xxyyzzzz* &
      M_xxzzzz + D_xyy*M_x + D_xyyy*M_xy + D_xyyyy*M_xyy + D_xyyyyy* &
      M_xyyy + D_xyyyyyy*M_xyyyy + D_xyyyyyyy*M_xyyyyy + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyyyz*M_xyyyz + D_xyyyyyzz*M_xyyyzz + D_xyyyyz* &
      M_xyyz + D_xyyyyzz*M_xyyzz + D_xyyyyzzz*M_xyyzzz + D_xyyyz*M_xyz &
      + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyyzzzz*M_xyzzzz + &
      D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz*M_xzzz + D_xyyzzzz*M_xzzzz &
      + D_xyyzzzzz*M_xzzzzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + &
      D_yyyyy*M_yyy + D_yyyyyy*M_yyyy + D_yyyyyyy*M_yyyyy + D_yyyyyyyy* &
      M_yyyyyy + D_yyyyyyyz*M_yyyyyz + D_yyyyyyz*M_yyyyz + D_yyyyyyzz* &
      M_yyyyzz + D_yyyyyz*M_yyyz + D_yyyyyzz*M_yyyzz + D_yyyyyzzz* &
      M_yyyzzz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz*M_yyzzz + &
      D_yyyyzzzz*M_yyzzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz* &
      M_yzzz + D_yyyzzzz*M_yzzzz + D_yyyzzzzz*M_yzzzzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz*M_zzzz + D_yyzzzzz*M_zzzzz &
      + D_yyzzzzzz*M_zzzzzz
    L_yyz      = D_xxxxxyyz*M_xxxxx + D_xxxxyyyz*M_xxxxy + D_xxxxyyz*M_xxxx + D_xxxxyyzz* &
      M_xxxxz + D_xxxyyyyz*M_xxxyy + D_xxxyyyz*M_xxxy + D_xxxyyyzz* &
      M_xxxyz + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + D_xxxyyzzz*M_xxxzz &
      + D_xxyyyyyz*M_xxyyy + D_xxyyyyz*M_xxyy + D_xxyyyyzz*M_xxyyz + &
      D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyyzzz*M_xxyzz + D_xxyyz* &
      M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xxyyzzzz*M_xxzzz + &
      D_xyyyyyyz*M_xyyyy + D_xyyyyyz*M_xyyy + D_xyyyyyzz*M_xyyyz + &
      D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyyzzz*M_xyyzz + D_xyyyz* &
      M_xy + D_xyyyzz*M_xyz + D_xyyyzzz*M_xyzz + D_xyyyzzzz*M_xyzzz + &
      D_xyyz*M_x + D_xyyzz*M_xz + D_xyyzzz*M_xzz + D_xyyzzzz*M_xzzz + &
      D_xyyzzzzz*M_xzzzz + D_yyyyyyyz*M_yyyyy + D_yyyyyyz*M_yyyy + &
      D_yyyyyyzz*M_yyyyz + D_yyyyyz*M_yyy + D_yyyyyzz*M_yyyz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyyzzz* &
      M_yyzz + D_yyyyzzzz*M_yyzzz + D_yyyz*M_y + D_yyyzz*M_yz + &
      D_yyyzzz*M_yzz + D_yyyzzzz*M_yzzz + D_yyyzzzzz*M_yzzzz + D_yyz* &
      M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + D_yyzzzzz* &
      M_zzzz + D_yyzzzzzz*M_zzzzz
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = D_xxxxxxxy*M_xxxxxxx + D_xxxxxxy*M_xxxxxx + D_xxxxxxyy*M_xxxxxxy + &
      D_xxxxxxyz*M_xxxxxxz + D_xxxxxy*M_xxxxx + D_xxxxxyy*M_xxxxxy + &
      D_xxxxxyyy*M_xxxxxyy + D_xxxxxyyz*M_xxxxxyz + D_xxxxxyz*M_xxxxxz &
      + D_xxxxxyzz*M_xxxxxzz + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + &
      D_xxxxyyy*M_xxxxyy + D_xxxxyyyy*M_xxxxyyy + D_xxxxyyyz*M_xxxxyyz &
      + D_xxxxyyz*M_xxxxyz + D_xxxxyyzz*M_xxxxyzz + D_xxxxyz*M_xxxxz + &
      D_xxxxyzz*M_xxxxzz + D_xxxxyzzz*M_xxxxzzz + D_xxxy*M_xxx + &
      D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy*M_xxxyyy + &
      D_xxxyyyyy*M_xxxyyyy + D_xxxyyyyz*M_xxxyyyz + D_xxxyyyz*M_xxxyyz &
      + D_xxxyyyzz*M_xxxyyzz + D_xxxyyz*M_xxxyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyyzzz*M_xxxyzzz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + &
      D_xxxyzzz*M_xxxzzz + D_xxxyzzzz*M_xxxzzzz + D_xxy*M_xx + D_xxyy* &
      M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyyy*M_xxyyyy + &
      D_xxyyyyyy*M_xxyyyyy + D_xxyyyyyz*M_xxyyyyz + D_xxyyyyz*M_xxyyyz &
      + D_xxyyyyzz*M_xxyyyzz + D_xxyyyz*M_xxyyz + D_xxyyyzz*M_xxyyzz + &
      D_xxyyyzzz*M_xxyyzzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyyzzzz*M_xxyzzzz + D_xxyz*M_xxz + &
      D_xxyzz*M_xxzz + D_xxyzzz*M_xxzzz + D_xxyzzzz*M_xxzzzz + &
      D_xxyzzzzz*M_xxzzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + &
      D_xyyyyyyy*M_xyyyyyy + D_xyyyyyyz*M_xyyyyyz + D_xyyyyyz*M_xyyyyz &
      + D_xyyyyyzz*M_xyyyyzz + D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyyzzz*M_xyyyzzz + D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + &
      D_xyyyzzz*M_xyyzzz + D_xyyyzzzz*M_xyyzzzz + D_xyyz*M_xyz + &
      D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + D_xyyzzzz*M_xyzzzz + &
      D_xyyzzzzz*M_xyzzzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz &
      + D_xyzzzz*M_xzzzz + D_xyzzzzz*M_xzzzzz + D_xyzzzzzz*M_xzzzzzz + &
      D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyyy*M_yyyy + &
      D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + D_yyyyyyyy*M_yyyyyyy + &
      D_yyyyyyyz*M_yyyyyyz + D_yyyyyyz*M_yyyyyz + D_yyyyyyzz*M_yyyyyzz &
      + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + D_yyyyyzzz*M_yyyyzzz + &
      D_yyyyz*M_yyyz + D_yyyyzz*M_yyyzz + D_yyyyzzz*M_yyyzzz + &
      D_yyyyzzzz*M_yyyzzzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyyzzz* &
      M_yyzzz + D_yyyzzzz*M_yyzzzz + D_yyyzzzzz*M_yyzzzzz + D_yyz*M_yz &
      + D_yyzz*M_yzz + D_yyzzz*M_yzzz + D_yyzzzz*M_yzzzz + D_yyzzzzz* &
      M_yzzzzz + D_yyzzzzzz*M_yzzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz* &
      M_zzz + D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz + &
      D_yzzzzzzz*M_zzzzzzz
    L_yz       = D_xxxxxxyz*M_xxxxxx + D_xxxxxyyz*M_xxxxxy + D_xxxxxyz*M_xxxxx + &
      D_xxxxxyzz*M_xxxxxz + D_xxxxyyyz*M_xxxxyy + D_xxxxyyz*M_xxxxy + &
      D_xxxxyyzz*M_xxxxyz + D_xxxxyz*M_xxxx + D_xxxxyzz*M_xxxxz + &
      D_xxxxyzzz*M_xxxxzz + D_xxxyyyyz*M_xxxyyy + D_xxxyyyz*M_xxxyy + &
      D_xxxyyyzz*M_xxxyyz + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz + &
      D_xxxyyzzz*M_xxxyzz + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xxxyzzz &
      *M_xxxzz + D_xxxyzzzz*M_xxxzzz + D_xxyyyyyz*M_xxyyyy + D_xxyyyyz* &
      M_xxyyy + D_xxyyyyzz*M_xxyyyz + D_xxyyyz*M_xxyy + D_xxyyyzz* &
      M_xxyyz + D_xxyyyzzz*M_xxyyzz + D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + &
      D_xxyyzzz*M_xxyzz + D_xxyyzzzz*M_xxyzzz + D_xxyz*M_xx + D_xxyzz* &
      M_xxz + D_xxyzzz*M_xxzz + D_xxyzzzz*M_xxzzz + D_xxyzzzzz*M_xxzzzz &
      + D_xyyyyyyz*M_xyyyyy + D_xyyyyyz*M_xyyyy + D_xyyyyyzz*M_xyyyyz + &
      D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyyyzzz*M_xyyyzz + &
      D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyyzzzz* &
      M_xyyzzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz*M_xyzz + &
      D_xyyzzzz*M_xyzzz + D_xyyzzzzz*M_xyzzzz + D_xyz*M_x + D_xyzz*M_xz &
      + D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + D_xyzzzzz*M_xzzzz + &
      D_xyzzzzzz*M_xzzzzz + D_yyyyyyyz*M_yyyyyy + D_yyyyyyz*M_yyyyy + &
      D_yyyyyyzz*M_yyyyyz + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + &
      D_yyyyyzzz*M_yyyyzz + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyyyzzz &
      *M_yyyzz + D_yyyyzzzz*M_yyyzzz + D_yyyz*M_yy + D_yyyzz*M_yyz + &
      D_yyyzzz*M_yyzz + D_yyyzzzz*M_yyzzz + D_yyyzzzzz*M_yyzzzz + D_yyz &
      *M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yyzzzzz* &
      M_yzzzz + D_yyzzzzzz*M_yzzzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz* &
      M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz + D_yzzzzzz*M_zzzzz + &
      D_yzzzzzzz*M_zzzzzz
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_0        = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxxx* &
      M_xxxxxxxx + D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxz*M_xxxxxxxz + &
      D_xxxxxxy*M_xxxxxxy + D_xxxxxxyy*M_xxxxxxyy + D_xxxxxxyz* &
      M_xxxxxxyz + D_xxxxxxz*M_xxxxxxz + D_xxxxxxzz*M_xxxxxxzz + &
      D_xxxxxy*M_xxxxxy + D_xxxxxyy*M_xxxxxyy + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxyyz*M_xxxxxyyz + D_xxxxxyz*M_xxxxxyz + D_xxxxxyzz* &
      M_xxxxxyzz + D_xxxxxz*M_xxxxxz + D_xxxxxzz*M_xxxxxzz + D_xxxxxzzz &
      *M_xxxxxzzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyyy* &
      M_xxxxyyy + D_xxxxyyyy*M_xxxxyyyy + D_xxxxyyyz*M_xxxxyyyz + &
      D_xxxxyyz*M_xxxxyyz + D_xxxxyyzz*M_xxxxyyzz + D_xxxxyz*M_xxxxyz + &
      D_xxxxyzz*M_xxxxyzz + D_xxxxyzzz*M_xxxxyzzz + D_xxxxz*M_xxxxz + &
      D_xxxxzz*M_xxxxzz + D_xxxxzzz*M_xxxxzzz + D_xxxxzzzz*M_xxxxzzzz + &
      D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyyy* &
      M_xxxyyyy + D_xxxyyyyy*M_xxxyyyyy + D_xxxyyyyz*M_xxxyyyyz + &
      D_xxxyyyz*M_xxxyyyz + D_xxxyyyzz*M_xxxyyyzz + D_xxxyyz*M_xxxyyz + &
      D_xxxyyzz*M_xxxyyzz + D_xxxyyzzz*M_xxxyyzzz + D_xxxyz*M_xxxyz + &
      D_xxxyzz*M_xxxyzz + D_xxxyzzz*M_xxxyzzz + D_xxxyzzzz*M_xxxyzzzz + &
      D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + D_xxxzzz*M_xxxzzz + D_xxxzzzz* &
      M_xxxzzzz + D_xxxzzzzz*M_xxxzzzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + &
      D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy*M_xxyyyyy + &
      D_xxyyyyyy*M_xxyyyyyy + D_xxyyyyyz*M_xxyyyyyz + D_xxyyyyz* &
      M_xxyyyyz + D_xxyyyyzz*M_xxyyyyzz + D_xxyyyz*M_xxyyyz + D_xxyyyzz &
      *M_xxyyyzz + D_xxyyyzzz*M_xxyyyzzz + D_xxyyz*M_xxyyz + D_xxyyzz* &
      M_xxyyzz + D_xxyyzzz*M_xxyyzzz + D_xxyyzzzz*M_xxyyzzzz + D_xxyz* &
      M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxyzzzz + D_xxyzzzzz*M_xxyzzzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + &
      D_xxzzz*M_xxzzz + D_xxzzzz*M_xxzzzz + D_xxzzzzz*M_xxzzzzz + &
      D_xxzzzzzz*M_xxzzzzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + &
      D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyyy*M_xyyyyyy + &
      D_xyyyyyyy*M_xyyyyyyy + D_xyyyyyyz*M_xyyyyyyz + D_xyyyyyz* &
      M_xyyyyyz + D_xyyyyyzz*M_xyyyyyzz + D_xyyyyz*M_xyyyyz + D_xyyyyzz &
      *M_xyyyyzz + D_xyyyyzzz*M_xyyyyzzz + D_xyyyz*M_xyyyz + D_xyyyzz* &
      M_xyyyzz + D_xyyyzzz*M_xyyyzzz + D_xyyyzzzz*M_xyyyzzzz + D_xyyz* &
      M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz + D_xyyzzzz* &
      M_xyyzzzz + D_xyyzzzzz*M_xyyzzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xyzzz*M_xyzzz + D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + &
      D_xyzzzzzz*M_xyzzzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + &
      D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_xzzzzzz*M_xzzzzzz + &
      D_xzzzzzzz*M_xzzzzzzz + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + &
      D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + D_yyyyyyy* &
      M_yyyyyyy + D_yyyyyyyy*M_yyyyyyyy + D_yyyyyyyz*M_yyyyyyyz + &
      D_yyyyyyz*M_yyyyyyz + D_yyyyyyzz*M_yyyyyyzz + D_yyyyyz*M_yyyyyz + &
      D_yyyyyzz*M_yyyyyzz + D_yyyyyzzz*M_yyyyyzzz + D_yyyyz*M_yyyyz + &
      D_yyyyzz*M_yyyyzz + D_yyyyzzz*M_yyyyzzz + D_yyyyzzzz*M_yyyyzzzz + &
      D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + D_yyyzzzz* &
      M_yyyzzzz + D_yyyzzzzz*M_yyyzzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + &
      D_yyzzz*M_yyzzz + D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + &
      D_yyzzzzzz*M_yyzzzzzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + &
      D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz + D_yzzzzzz*M_yzzzzzz + &
      D_yzzzzzzz*M_yzzzzzzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + &
      D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz*M_zzzzzz + D_zzzzzzz* &
      M_zzzzzzz + D_zzzzzzzz*M_zzzzzzzz
    L_z        = D_xxxxxxxz*M_xxxxxxx + D_xxxxxxyz*M_xxxxxxy + D_xxxxxxz*M_xxxxxx + &
      D_xxxxxxzz*M_xxxxxxz + D_xxxxxyyz*M_xxxxxyy + D_xxxxxyz*M_xxxxxy &
      + D_xxxxxyzz*M_xxxxxyz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + &
      D_xxxxxzzz*M_xxxxxzz + D_xxxxyyyz*M_xxxxyyy + D_xxxxyyz*M_xxxxyy &
      + D_xxxxyyzz*M_xxxxyyz + D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + &
      D_xxxxyzzz*M_xxxxyzz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + &
      D_xxxxzzz*M_xxxxzz + D_xxxxzzzz*M_xxxxzzz + D_xxxyyyyz*M_xxxyyyy &
      + D_xxxyyyz*M_xxxyyy + D_xxxyyyzz*M_xxxyyyz + D_xxxyyz*M_xxxyy + &
      D_xxxyyzz*M_xxxyyz + D_xxxyyzzz*M_xxxyyzz + D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + D_xxxyzzzz*M_xxxyzzz + &
      D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz* &
      M_xxxzzz + D_xxxzzzzz*M_xxxzzzz + D_xxyyyyyz*M_xxyyyyy + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz + D_xxyyyz*M_xxyyy + &
      D_xxyyyzz*M_xxyyyz + D_xxyyyzzz*M_xxyyyzz + D_xxyyz*M_xxyy + &
      D_xxyyzz*M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyyzzzz*M_xxyyzzz + &
      D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + D_xxyzzzz* &
      M_xxyzzz + D_xxyzzzzz*M_xxyzzzz + D_xxz*M_xx + D_xxzz*M_xxz + &
      D_xxzzz*M_xxzz + D_xxzzzz*M_xxzzz + D_xxzzzzz*M_xxzzzz + &
      D_xxzzzzzz*M_xxzzzzz + D_xyyyyyyz*M_xyyyyyy + D_xyyyyyz*M_xyyyyy &
      + D_xyyyyyzz*M_xyyyyyz + D_xyyyyz*M_xyyyy + D_xyyyyzz*M_xyyyyz + &
      D_xyyyyzzz*M_xyyyyzz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + &
      D_xyyyzzz*M_xyyyzz + D_xyyyzzzz*M_xyyyzzz + D_xyyz*M_xyy + &
      D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + D_xyyzzzz*M_xyyzzz + &
      D_xyyzzzzz*M_xyyzzzz + D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz &
      + D_xyzzzz*M_xyzzz + D_xyzzzzz*M_xyzzzz + D_xyzzzzzz*M_xyzzzzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_xzzzzzz*M_xzzzzz + D_xzzzzzzz*M_xzzzzzz + D_yyyyyyyz* &
      M_yyyyyyy + D_yyyyyyz*M_yyyyyy + D_yyyyyyzz*M_yyyyyyz + D_yyyyyz* &
      M_yyyyy + D_yyyyyzz*M_yyyyyz + D_yyyyyzzz*M_yyyyyzz + D_yyyyz* &
      M_yyyy + D_yyyyzz*M_yyyyz + D_yyyyzzz*M_yyyyzz + D_yyyyzzzz* &
      M_yyyyzzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + &
      D_yyyzzzz*M_yyyzzz + D_yyyzzzzz*M_yyyzzzz + D_yyz*M_yy + D_yyzz* &
      M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz*M_yyzzzz + &
      D_yyzzzzzz*M_yyzzzzz + D_yz*M_y + D_yzz*M_yz + D_yzzz*M_yzz + &
      D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + D_yzzzzzz*M_yzzzzz + &
      D_yzzzzzzz*M_yzzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz + D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz + &
      D_zzzzzzzz*M_zzzzzzz
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  M_y                 
#undef  L_y                 
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
#undef  L_xyy               
#undef  M_xxz               
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
#undef  L_xxyyy             
#undef  M_yyyy              
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
#undef  M_xyyyyz            
#undef  L_xxxxyyyz          
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
    end subroutine mom_es_M2L
    
! OPS  915*ADD + 2*DIV + 1085*MUL + 84*NEG + POW = 2087  (7021 before optimization)
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
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
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
                L_yzzzzzzz, L_zzzzzzzz
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
#define L_yy                 L(7)
#define Ls_yy                Ls(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
#define Ls_xxx               Ls(9)
#define L_xxx                L(9)
#define Ls_xxy               Ls(10)
#define L_xxy                L(10)
#define Ls_xxz               Ls(11)
#define L_xxz                L(11)
#define L_xyy                L(12)
#define Ls_xyy               Ls(12)
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
#define L_xxxyyz             L(42)
#define Ls_xxxyyz            Ls(42)
#define Ls_xxyyyy            Ls(43)
#define L_xxyyyy             L(43)
#define Ls_xxyyyz            Ls(44)
#define L_xxyyyz             L(44)
#define Ls_xyyyyy            Ls(45)
#define L_xyyyyy             L(45)
#define L_xyyyyz             L(46)
#define Ls_xyyyyz            Ls(46)
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
#define Ls_xxxxxyz           Ls(53)
#define L_xxxxxyz            L(53)
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
#define L_xyyyyyy            L(60)
#define Ls_xyyyyyy           Ls(60)
#define L_xyyyyyz            L(61)
#define Ls_xyyyyyz           Ls(61)
#define Ls_yyyyyyy           Ls(62)
#define L_yyyyyyy            L(62)
#define Ls_yyyyyyz           Ls(63)
#define L_yyyyyyz            L(63)
#define L_xxxxxxxx           L(64)
#define Ls_xxxxxxxx          Ls(64)
#define Ls_xxxxxxxy          Ls(65)
#define L_xxxxxxxy           L(65)
#define Ls_xxxxxxxz          Ls(66)
#define L_xxxxxxxz           L(66)
#define Ls_xxxxxxyy          Ls(67)
#define L_xxxxxxyy           L(67)
#define Ls_xxxxxxyz          Ls(68)
#define L_xxxxxxyz           L(68)
#define Ls_xxxxxyyy          Ls(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define Ls_xxxxxyyz          Ls(70)
#define Ls_xxxxyyyy          Ls(71)
#define L_xxxxyyyy           L(71)
#define L_xxxxyyyz           L(72)
#define Ls_xxxxyyyz          Ls(72)
#define Ls_xxxyyyyy          Ls(73)
#define L_xxxyyyyy           L(73)
#define Ls_xxxyyyyz          Ls(74)
#define L_xxxyyyyz           L(74)
#define L_xxyyyyyy           L(75)
#define Ls_xxyyyyyy          Ls(75)
#define Ls_xxyyyyyz          Ls(76)
#define L_xxyyyyyz           L(76)
#define L_xyyyyyyy           L(77)
#define Ls_xyyyyyyy          Ls(77)
#define L_xyyyyyyz           L(78)
#define Ls_xyyyyyyz          Ls(78)
#define L_yyyyyyyy           L(79)
#define Ls_yyyyyyyy          Ls(79)
#define Ls_yyyyyyyz          Ls(80)
#define L_yyyyyyyz           L(80)
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
    v222        = 0.00833333333333333d0*x
    v236        = L_xyyyyyz*z
    v239        = v11*y
    v242        = L_xyyyyz*z
    v253        = L_xyyyz*z
    v269        = L_xyyz*z
    v289        = L_xyz*z
    v313        = L_xz*z
    v335        = 0.00138888888888889d0*x
    v351        = L_yyyyyyz*z
    v354        = L_yyyyyz*z
    v357        = 0.5d0*y
    v361        = L_yyyyz*z
    v366        = 0.166666666666667d0*y
    v372        = L_yyyz*z
    v379        = 0.0416666666666667d0*y
    v386        = L_yyz*z
    v395        = 0.00833333333333333d0*y
    v403        = L_yz*z
    v415        = 0.00138888888888889d0*y
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
    v338        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v417        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    v225        = L_xxzz*z
    L_xyzz      = -(L_xxxy + L_xyyy)
    v302        = L_xyzz*z
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    v397        = L_yyzz*z
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    v140        = L_xxxzz*z
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    v193        = L_xxyzz*z
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    v280        = L_xyyzz*z
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    v381        = L_yyyzz*z
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
    v262        = L_xyyyzz*z
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    v368        = L_yyyyzz*z
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
    v249        = L_xyyyyzz*z
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    v359        = L_yyyyyzz*z
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
    v240        = L_xyyyyyz + L_xyyyyyzz*z
    v241        = L_xyyyyyyz*y + v240
    v252        = v240*y
    Ls_xyyyyyz  = L_xxyyyyyz*x + v241
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    v353        = L_yyyyyyz + L_yyyyyyzz*z
    Ls_yyyyyyz  = v353 + L_xyyyyyyz*x + L_yyyyyyyz*y
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
    v221        = 0.0208333333333333d0*v15
    v334        = 0.00416666666666667d0*v15
    a3          = a1*a2
    v30         = a3
    v31         = 0.166666666666667d0*v30
    v135        = 0.0833333333333333d0*v30
    v220        = 0.0277777777777778d0*v30
    v333        = 0.00694444444444444d0*v30
    a4          = a2*a2
    v64         = a4
    v65         = 0.0416666666666667d0*v64
    v217        = 0.0208333333333333d0*v64
    v332        = 0.00694444444444444d0*v64
    a5          = a2*a3
    v121        = a5
    v122        = 0.00833333333333333d0*v121
    v328        = 0.00416666666666667d0*v121
    a6          = a3*a3
    v203        = a6
    v204        = 0.00138888888888889d0*v203
    a7          = a3*a4
    v314        = 0.000198412698412698d0*a7
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
    v237        = L_xyyyyyyy*v17
    v250        = L_xyyyyyyz*v17
    v365        = 0.25d0*v17
    v378        = 0.0833333333333333d0*v17
    v394        = 0.0208333333333333d0*v17
    v414        = 0.00416666666666667d0*v17
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
    v243        = L_xyyyyyyy*v32
    v263        = L_xyyyyyyz*v32
    v377        = 0.0833333333333333d0*v32
    v393        = 0.0277777777777778d0*v32
    v413        = 0.00694444444444444d0*v32
    b4          = b2*b2
    v66         = b4
    v67         = L_xxxxyyyy*v66
    v105        = L_xxxyyyyy*v66
    v130        = 0.0416666666666667d0*v66
    v141        = L_xxxyyyyz*v66
    v167        = L_xxyyyyyy*v66
    v194        = L_xxyyyyyz*v66
    v223        = 5.0d0*v66
    v254        = L_xyyyyyyy*v66
    v281        = L_xyyyyyyz*v66
    v392        = 0.0208333333333333d0*v66
    v412        = 0.00694444444444444d0*v66
    b5          = b2*b3
    v123        = b5
    v124        = L_xxxyyyyy*v123
    v183        = L_xxyyyyyy*v123
    v213        = 0.00833333333333333d0*v123
    v226        = L_xxyyyyyz*v123
    v270        = L_xyyyyyyy*v123
    v303        = L_xyyyyyyz*v123
    v336        = 6.0d0*v123
    v411        = 0.00416666666666667d0*v123
    b6          = b3*b3
    v205        = b6
    v206        = L_xxyyyyyy*v205
    v290        = L_xyyyyyyy*v205
    v324        = 0.00138888888888889d0*v205
    v339        = L_xyyyyyyz*v205
    b7          = b3*b4
    v315        = b7
    v316        = L_xyyyyyyy*v315
    v404        = 0.000198412698412698d0*v315
    b8          = b4*b4
    c2          = c1*c1
    v19         = c2
    v424        = 0.5d0*v19
    v317        = L_xzz*v19
    v405        = L_yzz*v19
    v207        = L_xxzz*v19
    v291        = L_xyzz*v19
    v340        = L_xzzz*v19
    v387        = L_yyzz*v19
    v418        = L_yzzz*v19
    v125        = L_xxxzz*v19
    v184        = L_xxyzz*v19
    v227        = L_xxzzz*v19
    v271        = L_xyyzz*v19
    v304        = L_xyzzz*v19
    v373        = L_yyyzz*v19
    v398        = L_yyzzz*v19
    v68         = L_xxxxzz*v19
    v106        = L_xxxyzz*v19
    v142        = L_xxxzzz*v19
    v168        = L_xxyyzz*v19
    v195        = L_xxyzzz*v19
    v255        = L_xyyyzz*v19
    v282        = L_xyyzzz*v19
    v362        = L_yyyyzz*v19
    v382        = L_yyyzzz*v19
    v34         = L_xxxxxzz*v19
    v54         = L_xxxxyzz*v19
    v82         = L_xxxxzzz*v19
    v95         = L_xxxyyzz*v19
    v115        = L_xxxyzzz*v19
    v157        = L_xxyyyzz*v19
    v177        = L_xxyyzzz*v19
    v244        = L_xyyyyzz*v19
    v264        = L_xyyyzzz*v19
    v355        = L_yyyyyzz*v19
    v369        = L_yyyyzzz*v19
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
    v214        = v159*v66
    v248        = 2.0d0*v152 + v150 + v159
    Ls_xxyyyy   = 0.5d0*(v150 + v151) + L_xxxxyyyy*v16 + L_xxyyyy + v149 + v152 + v8*x
    v164        = L_xxyyyzzz*v19
    v179        = v164 + 2.0d0*(L_xxyyyz + v162)
    v180        = v179*y
    v198        = v17*v179
    v231        = v179*v32
    v268        = 2.0d0*v165 + v163 + v179
    Ls_xxyyyz   = 0.5d0*(v163 + v164) + L_xxxxyyyz*v16 + L_xxyyyz + v162 + v165 + v92*x
    v238        = L_xyyyyyzz*v19
    v246        = v238 + 2.0d0*(L_xyyyyy + v236)
    v247        = v246*y
    v258        = v17*v246
    v275        = v246*v32
    v296        = v246*v66
    v325        = v123*v246
    Ls_xyyyyy   = 0.5d0*(v237 + v238) + L_xxxyyyyy*v16 + L_xyyyyy + v10*x + v236 + v239
    v251        = L_xyyyyzzz*v19
    v266        = v251 + 2.0d0*(L_xyyyyz + v249)
    v267        = v266*y
    v285        = v17*v266
    v308        = v266*v32
    v345        = v266*v66
    Ls_xyyyyz   = 0.5d0*(v250 + v251) + L_xxxyyyyz*v16 + L_xyyyyz + v154*x + v249 + v252
    v352        = L_yyyyyyzz*v19
    v358        = v352 + 2.0d0*(L_yyyyyy + v351)
    Ls_yyyyyy   = 0.5d0*v352 + L_xxyyyyyy*v16 + L_yyyyyy + L_yyyyyyyy*v37 + v12*x + v13*y &
      + v351
    v360        = L_yyyyyzzz*v19
    v371        = v360 + 2.0d0*(L_yyyyyz + v359)
    Ls_yyyyyz   = 0.5d0*v360 + L_xxyyyyyz*v16 + L_yyyyyyyz*v37 + L_yyyyyz + v241*x + v353* &
      y + v359
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
    v425        = 0.166666666666667d0*v35
    v318        = L_xzzz*v35
    v406        = L_yzzz*v35
    v208        = L_xxzzz*v35
    v292        = L_xyzzz*v35
    v341        = L_xzzzz*v35
    v388        = L_yyzzz*v35
    v419        = L_yzzzz*v35
    v126        = L_xxxzzz*v35
    v185        = L_xxyzzz*v35
    v228        = L_xxzzzz*v35
    v272        = L_xyyzzz*v35
    v305        = L_xyzzzz*v35
    v374        = L_yyyzzz*v35
    v399        = L_yyzzzz*v35
    v69         = L_xxxxzzz*v35
    v107        = L_xxxyzzz*v35
    v143        = L_xxxzzzz*v35
    v169        = L_xxyyzzz*v35
    v196        = L_xxyzzzz*v35
    v256        = L_xyyyzzz*v35
    v283        = L_xyyzzzz*v35
    v363        = L_yyyyzzz*v35
    v383        = L_yyyzzzz*v35
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
    v215        = v172*v32
    v261        = v156 + v172 + 3.0d0*v160 + v78*v9
    Ls_xxyyy    = 0.166666666666667d0*(v156 + v158 + 3.0d0*(v157 + v160)) + L_xxxxxyyy*v31 &
      + L_xxyyy + v155 + v16*v6 + v161*v40 + v37*v9
    v178        = L_xxyyzzzz*v35
    v199        = v178 + 3.0d0*(2.0d0*L_xxyyz + 2.0d0*v175 + v177)
    v200        = v199*y
    v232        = v17*v199
    v288        = v176 + v199 + v153*v78 + 3.0d0*v180
    Ls_xxyyz    = 0.166666666666667d0*(v176 + v178 + 3.0d0*(v177 + v180)) + L_xxxxxyyz*v31 &
      + L_xxyyz + v153*v37 + v16*v51 + v175 + v181*v40
    v245        = L_xyyyyzzz*v35
    v259        = v245 + 3.0d0*(2.0d0*L_xyyyy + 2.0d0*v242 + v244)
    v260        = v259*y
    v276        = v17*v259
    v297        = v259*v32
    v326        = v259*v66
    Ls_xyyyy    = 0.166666666666667d0*(v243 + v245 + 3.0d0*(v244 + v247)) + L_xxxxyyyy*v31 &
      + L_xyyyy + v11*v37 + v16*v8 + v242 + v248*v40
    v265        = L_xyyyzzzz*v35
    v286        = v265 + 3.0d0*(2.0d0*L_xyyyz + 2.0d0*v262 + v264)
    v287        = v286*y
    v309        = v17*v286
    v346        = v286*v32
    Ls_xyyyz    = 0.166666666666667d0*(v263 + v265 + 3.0d0*(v264 + v267)) + L_xxxxyyyz*v31 &
      + L_xyyyz + v16*v92 + v240*v37 + v262 + v268*v40
    v356        = L_yyyyyzzz*v35
    v367        = v356 + 3.0d0*(2.0d0*L_yyyyy + 2.0d0*v354 + v355)
    Ls_yyyyy    = 0.166666666666667d0*(3.0d0*v355 + v356) + L_xxxyyyyy*v31 + L_yyyyy + &
      L_yyyyyyyy*v72 + v10*v16 + v13*v37 + v354 + v357*v358 + v40*(v237 &
      + 2.0d0*v239 + v246)
    v370        = L_yyyyzzzz*v35
    v385        = v370 + 3.0d0*(2.0d0*L_yyyyz + 2.0d0*v368 + v369)
    Ls_yyyyz    = 0.166666666666667d0*(3.0d0*v369 + v370) + L_xxxyyyyz*v31 + L_yyyyyyyz* &
      v72 + L_yyyyz + v154*v16 + v353*v37 + v357*v371 + v368 + v40*( &
      v250 + 2.0d0*v252 + v266)
    c4          = c2*c2
    v70         = c4
    v426        = 0.0416666666666667d0*v70
    v319        = L_xzzzz*v70
    v407        = L_yzzzz*v70
    v209        = L_xxzzzz*v70
    v293        = L_xyzzzz*v70
    v342        = L_xzzzzz*v70
    v389        = L_yyzzzz*v70
    v420        = L_yzzzzz*v70
    v127        = L_xxxzzzz*v70
    v186        = L_xxyzzzz*v70
    v229        = L_xxzzzzz*v70
    v273        = L_xyyzzzz*v70
    v306        = L_xyzzzzz*v70
    v375        = L_yyyzzzz*v70
    v400        = L_yyzzzzz*v70
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
    v235        = v141 + v144 + v138*v91 + 12.0d0*v142 + 6.0d0*v145 + 24.0d0*(L_xxxz + &
      v140) + 4.0d0*(v143 + v147)
    Ls_xxxz     = 0.0416666666666667d0*(v141 + 12.0d0*v142 + v144 + 6.0d0*v145 + 4.0d0*( &
      v143 + v147)) + L_xxxxxxxz*v65 + L_xxxz + v140 + v148*v77 + v22* &
      v31 + v72*v91 + v76*v86
    v170        = L_xxyyzzzz*v70
    v190        = v170 + 12.0d0*v168 + 4.0d0*(6.0d0*L_xxyy + 6.0d0*v166 + v169)
    v191        = v190*y
    v216        = v17*v190
    v279        = v167 + v190 + v138*v9 + 6.0d0*v171 + 4.0d0*v173
    Ls_xxyy     = 0.0416666666666667d0*(v167 + 12.0d0*v168 + v170 + 6.0d0*v171 + 4.0d0*( &
      v169 + v173)) + L_xxxxxxyy*v65 + L_xxyy + v166 + v174*v77 + v31* &
      v4 + v72*v9 + v76*v99
    v197        = L_xxyzzzzz*v70
    v233        = v197 + 12.0d0*v195 + 4.0d0*(6.0d0*L_xxyz + 6.0d0*v193 + v196)
    v234        = v233*y
    v312        = v194 + v233 + v138*v153 + 6.0d0*v198 + 4.0d0*v200
    Ls_xxyz     = 0.0416666666666667d0*(v194 + 12.0d0*v195 + v197 + 6.0d0*v198 + 4.0d0*( &
      v196 + v200)) + L_xxxxxxyz*v65 + L_xxyz + v119*v76 + v153*v72 + &
      v193 + v201*v77 + v28*v31
    v257        = L_xyyyzzzz*v70
    v277        = v257 + 12.0d0*v255 + 4.0d0*(6.0d0*L_xyyy + 6.0d0*v253 + v256)
    v278        = v277*y
    v298        = v17*v277
    v327        = v277*v32
    Ls_xyyy     = 0.0416666666666667d0*(v254 + 12.0d0*v255 + v257 + 6.0d0*v258 + 4.0d0*( &
      v256 + v260)) + L_xxxxxyyy*v65 + L_xyyy + v11*v72 + v161*v76 + &
      v253 + v261*v77 + v31*v6
    v284        = L_xyyzzzzz*v70
    v310        = v284 + 12.0d0*v282 + 4.0d0*(6.0d0*L_xyyz + 6.0d0*v280 + v283)
    v311        = v310*y
    v347        = v17*v310
    Ls_xyyz     = 0.0416666666666667d0*(v281 + 12.0d0*v282 + v284 + 6.0d0*v285 + 4.0d0*( &
      v283 + v287)) + L_xxxxxyyz*v65 + L_xyyz + v181*v76 + v240*v72 + &
      v280 + v288*v77 + v31*v51
    v364        = L_yyyyzzzz*v70
    v380        = v364 + 12.0d0*v362 + 4.0d0*(6.0d0*L_yyyy + 6.0d0*v361 + v363)
    Ls_yyyy     = 0.0416666666666667d0*(12.0d0*v362 + 4.0d0*v363 + v364) + L_xxxxyyyy*v65 &
      + L_yyyy + L_yyyyyyyy*v130 + v13*v72 + v248*v76 + v31*v8 + v358* &
      v365 + v361 + v366*v367 + v77*(v11*v78 + v243 + 3.0d0*v247 + v259 &
      )
    v384        = L_yyyzzzzz*v70
    v402        = v384 + 12.0d0*v382 + 4.0d0*(6.0d0*L_yyyz + 6.0d0*v381 + v383)
    Ls_yyyz     = 0.0416666666666667d0*(12.0d0*v382 + 4.0d0*v383 + v384) + L_xxxxyyyz*v65 &
      + L_yyyyyyyz*v130 + L_yyyz + v268*v76 + v31*v92 + v353*v72 + v365 &
      *v371 + v366*v385 + v381 + v77*(v240*v78 + v263 + 3.0d0*v267 + &
      v286)
    c5          = c2*c3
    v128        = c5
    v427        = 0.00833333333333333d0*v128
    v320        = L_xzzzzz*v128
    v408        = L_yzzzzz*v128
    v210        = L_xxzzzzz*v128
    v294        = L_xyzzzzz*v128
    v343        = L_xzzzzzz*v128
    v390        = L_yyzzzzz*v128
    v421        = L_yzzzzzz*v128
    v129        = L_xxxzzzzz*v128
    v224        = v124 + v129 + 60.0d0*v125 + 20.0d0*v126 + v223*v7 + 120.0d0*(L_xxx + &
      v120) + 5.0d0*(v127 + v134) + 10.0d0*(v131 + v132)
    Ls_xxx      = 0.00833333333333333d0*(v124 + 60.0d0*v125 + 20.0d0*v126 + v129 + 5.0d0*( &
      v127 + v134) + 10.0d0*(v131 + v132)) + L_xxx + L_xxxxxxxx*v122 + &
      v0*v65 + v120 + v130*v7 + v135*v41 + v136*v79 + v137*v139
    v187        = L_xxyzzzzz*v128
    v218        = v187 + 60.0d0*v184 + 20.0d0*v185 + 5.0d0*(24.0d0*L_xxy + 24.0d0*v182 + &
      v186)
    v219        = v218*y
    v301        = v183 + v218 + 5.0d0*v191 + v223*v9 + 10.0d0*(v188 + v189)
    Ls_xxy      = 0.00833333333333333d0*(v183 + 60.0d0*v184 + 20.0d0*v185 + v187 + 5.0d0*( &
      v186 + v191) + 10.0d0*(v188 + v189)) + L_xxxxxxxy*v122 + L_xxy + &
      v112*v136 + v130*v9 + v135*v58 + v137*v192 + v182 + v2*v65
    v230        = L_xxzzzzzz*v128
    v350        = v226 + v230 + v153*v223 + 60.0d0*v227 + 20.0d0*v228 + 120.0d0*(L_xxz + &
      v225) + 5.0d0*(v229 + v234) + 10.0d0*(v231 + v232)
    Ls_xxz      = 0.00833333333333333d0*(v226 + 60.0d0*v227 + 20.0d0*v228 + v230 + 5.0d0*( &
      v229 + v234) + 10.0d0*(v231 + v232)) + L_xxxxxxxz*v122 + L_xxz + &
      v130*v153 + v135*v86 + v136*v148 + v137*v235 + v22*v65 + v225
    v274        = L_xyyzzzzz*v128
    v299        = v274 + 60.0d0*v271 + 20.0d0*v272 + 5.0d0*(24.0d0*L_xyy + 24.0d0*v269 + &
      v273)
    v300        = v299*y
    v329        = v17*v299
    Ls_xyy      = 0.00833333333333333d0*(v270 + 60.0d0*v271 + 20.0d0*v272 + v274 + 5.0d0*( &
      v273 + v278) + 10.0d0*(v275 + v276)) + L_xxxxxxyy*v122 + L_xyy + &
      v11*v130 + v135*v99 + v136*v174 + v137*v279 + v269 + v4*v65
    v307        = L_xyzzzzzz*v128
    v348        = v307 + 60.0d0*v304 + 20.0d0*v305 + 5.0d0*(24.0d0*L_xyz + 24.0d0*v302 + &
      v306)
    v349        = v348*y
    Ls_xyz      = 0.00833333333333333d0*(v303 + 60.0d0*v304 + 20.0d0*v305 + v307 + 5.0d0*( &
      v306 + v311) + 10.0d0*(v308 + v309)) + L_xxxxxxyz*v122 + L_xyz + &
      v119*v135 + v130*v240 + v136*v201 + v137*v312 + v28*v65 + v302
    v376        = L_yyyzzzzz*v128
    v396        = v376 + 60.0d0*v373 + 20.0d0*v374 + 5.0d0*(24.0d0*L_yyy + 24.0d0*v372 + &
      v375)
    Ls_yyy      = 0.00833333333333333d0*(60.0d0*v373 + 20.0d0*v374 + 5.0d0*v375 + v376) + &
      L_xxxxxyyy*v122 + L_yyy + L_yyyyyyyy*v213 + v13*v130 + v135*v161 &
      + v136*v261 + v137*(v11*v138 + v254 + 6.0d0*v258 + 4.0d0*v260 + &
      v277) + v358*v377 + v367*v378 + v372 + v379*v380 + v6*v65
    v401        = L_yyzzzzzz*v128
    v423        = v401 + 60.0d0*v398 + 20.0d0*v399 + 5.0d0*(24.0d0*L_yyz + 24.0d0*v397 + &
      v400)
    Ls_yyz      = 0.00833333333333333d0*(60.0d0*v398 + 20.0d0*v399 + 5.0d0*v400 + v401) + &
      L_xxxxxyyz*v122 + L_yyyyyyyz*v213 + L_yyz + v130*v353 + v135*v181 &
      + v136*v288 + v137*(v138*v240 + v281 + 6.0d0*v285 + 4.0d0*v287 + &
      v310) + v371*v377 + v378*v385 + v379*v402 + v397 + v51*v65
    c6          = c3*c3
    v211        = c6
    v428        = 0.00138888888888889d0*v211
    v321        = L_xzzzzzz*v211
    v409        = L_yzzzzzz*v211
    v212        = L_xxzzzzzz*v211
    v337        = v206 + v212 + 360.0d0*v207 + 120.0d0*v208 + 30.0d0*v209 + 20.0d0*v215 + &
      v336*v9 + 720.0d0*(L_xx + v202) + 6.0d0*(v210 + v219) + 15.0d0*( &
      v214 + v216)
    Ls_xx       = 0.00138888888888889d0*(v206 + 360.0d0*v207 + 120.0d0*v208 + 30.0d0*v209 &
      + v212 + 20.0d0*v215 + 6.0d0*(v210 + v219) + 15.0d0*(v214 + v216 &
      )) + L_xx + L_xxxxxxxx*v204 + v0*v122 + v139*v221 + v202 + v213* &
      v9 + v217*v41 + v220*v79 + v222*v224
    v295        = L_xyzzzzzz*v211
    v330        = v295 + 360.0d0*v291 + 120.0d0*v292 + 30.0d0*v293 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v289 + v294)
    v331        = v330*y
    Ls_xy       = 0.00138888888888889d0*(v290 + 360.0d0*v291 + 120.0d0*v292 + 30.0d0*v293 &
      + v295 + 20.0d0*v297 + 6.0d0*(v294 + v300) + 15.0d0*(v296 + v298 &
      )) + L_xxxxxxxy*v204 + L_xy + v11*v213 + v112*v220 + v122*v2 + &
      v192*v221 + v217*v58 + v222*v301 + v289
    v344        = L_xzzzzzzz*v211
    Ls_xz       = 0.00138888888888889d0*(v339 + 360.0d0*v340 + 120.0d0*v341 + 30.0d0*v342 &
      + v344 + 20.0d0*v346 + 6.0d0*(v343 + v349) + 15.0d0*(v345 + v347 &
      )) + L_xxxxxxxz*v204 + L_xz + v122*v22 + v148*v220 + v213*v240 + &
      v217*v86 + v221*v235 + v222*v350 + v338
    v391        = L_yyzzzzzz*v211
    v416        = v391 + 360.0d0*v387 + 120.0d0*v388 + 30.0d0*v389 + 6.0d0*(120.0d0*L_yy + &
      120.0d0*v386 + v390)
    Ls_yy       = 0.00138888888888889d0*(360.0d0*v387 + 120.0d0*v388 + 30.0d0*v389 + 6.0d0 &
      *v390 + v391) + L_xxxxxxyy*v204 + L_yy + L_yyyyyyyy*v324 + v122* &
      v4 + v13*v213 + v174*v220 + v217*v99 + v221*v279 + v222*(v11*v223 &
      + v270 + 10.0d0*v275 + 10.0d0*v276 + 5.0d0*v278 + v299) + v358* &
      v392 + v367*v393 + v380*v394 + v386 + v395*v396
    v422        = L_yzzzzzzz*v211
    Ls_yz       = 0.00138888888888889d0*(360.0d0*v418 + 120.0d0*v419 + 30.0d0*v420 + 6.0d0 &
      *v421 + v422) + L_xxxxxxyz*v204 + L_yyyyyyyz*v324 + L_yz + v119* &
      v217 + v122*v28 + v201*v220 + v213*v353 + v221*v312 + v222*(v223* &
      v240 + v303 + 10.0d0*v308 + 10.0d0*v309 + 5.0d0*v311 + v348) + &
      v371*v392 + v385*v393 + v394*v402 + v395*v423 + v417
    c7          = c3*c4
    v322        = c7
    v429        = 0.000198412698412698d0*v322
    v323        = L_xzzzzzzz*v322
    Ls_x        = 0.000198412698412698d0*(v316 + 2520.0d0*v317 + 840.0d0*v318 + 210.0d0* &
      v319 + 42.0d0*v320 + v323 + 7.0d0*(v321 + v331) + 21.0d0*(v325 + &
      v329) + 35.0d0*(v326 + v327)) + L_x + L_xxxxxxxx*v314 + v0*v204 + &
      v11*v324 + v139*v333 + v224*v334 + v313 + v328*v41 + v332*v79 + &
      v335*v337
    v410        = L_yzzzzzzz*v322
    Ls_y        = 0.000198412698412698d0*(2520.0d0*v405 + 840.0d0*v406 + 210.0d0*v407 + &
      42.0d0*v408 + 7.0d0*v409 + v410) + L_xxxxxxxy*v314 + L_y + &
      L_yyyyyyyy*v404 + v112*v332 + v13*v324 + v192*v333 + v2*v204 + &
      v301*v334 + v328*v58 + v335*(v11*v336 + v290 + 15.0d0*v296 + &
      20.0d0*v297 + 15.0d0*v298 + 6.0d0*v300 + v330) + v358*v411 + v367 &
      *v412 + v380*v413 + v396*v414 + v403 + v415*v416
    Ls_z        = L_z + L_xxxxxxxz*v314 + L_yyyyyyyz*v404 + L_zz*z + L_zzz*v424 + L_zzzz* &
      v425 + L_zzzzz*v426 + L_zzzzzz*v427 + L_zzzzzzz*v428 + L_zzzzzzzz &
      *v429 + v148*v332 + v204*v22 + v235*v333 + v324*v353 + v328*v86 + &
      v334*v350 + v335*(720.0d0*L_xz + v240*v336 + 720.0d0*v338 + v339 &
      + 360.0d0*v340 + 120.0d0*v341 + 30.0d0*v342 + 6.0d0*v343 + v344 + &
      15.0d0*v345 + 20.0d0*v346 + 15.0d0*v347 + 6.0d0*v349) + v371*v411 &
      + v385*v412 + v402*v413 + v414*v423 + v415*(720.0d0*L_yz + &
      720.0d0*v417 + 360.0d0*v418 + 120.0d0*v419 + 30.0d0*v420 + 6.0d0* &
      v421 + v422)
    c8          = c4*c4
    Ls_0        = 2.48015873015873d-5*(L_xxxxxxxx*a8 + L_yyyyyyyy*b8 + L_zzzzzzzz*c8 + &
      70.0d0*(v139*v64 + v380*v66) + 8.0d0*(x*(5040.0d0*L_x + 7.0d0*v11 &
      *v205 + 5040.0d0*v313 + v316 + 2520.0d0*v317 + 840.0d0*v318 + &
      210.0d0*v319 + 42.0d0*v320 + 7.0d0*v321 + v323 + 21.0d0*v325 + &
      35.0d0*v326 + 35.0d0*v327 + 21.0d0*v329 + 7.0d0*v331) + y*( &
      5040.0d0*L_y + 5040.0d0*v403 + 2520.0d0*v405 + 840.0d0*v406 + &
      210.0d0*v407 + 42.0d0*v408 + 7.0d0*v409 + v410)) + 56.0d0*(v121* &
      v79 + v123*v367 + v224*v30 + v32*v396) + 28.0d0*(v15*v337 + v17* &
      v416 + v203*v41 + v205*v358)) + L_0 + L_z*z + L_zz*v424 + L_zzz* &
      v425 + L_zzzz*v426 + L_zzzzz*v427 + L_zzzzzz*v428 + L_zzzzzzz* &
      v429 + v0*v314 + v13*v404
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
#undef  L_xxxyyz            
#undef  Ls_xxxyyz           
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  Ls_xyyyyy           
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  Ls_xyyyyz           
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
#undef  Ls_xxxxxyz          
#undef  L_xxxxxyz           
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
#undef  L_xyyyyyy           
#undef  Ls_xyyyyyy          
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
#undef  L_xyyyyyyz          
#undef  Ls_xyyyyyyz         
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L
    
! OPS  468*ADD + 2*DIV + 635*MUL + 85*NEG + POW = 1191  (3601 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
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
                v191, v192, v193, v194, v195, v196, v197, v2, v20, v21, v22,&
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
                L_zzzzzzzz
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
#define L_yz                 L(8)
#define Phi_yz               Phi(8)
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
    v0         = L_xxz*z
    v16        = L_xxyyyyy + L_xxyyyyyz*z
    v20        = L_xxxxxxx + L_xxxxxxxy*y + L_xxxxxxxz*z
    v22        = 2.0d0*z
    v26        = 6.0d0*z
    v31        = 24.0d0*z
    v38        = 2.0d0*y
    v39        = L_xxxxxxy + L_xxxxxxyz*z
    v41        = 120.0d0*z
    v50        = L_xxxxxyy + L_xxxxxyyz*z
    v51        = 3.0d0*y
    v57        = L_xxxxyyy + L_xxxxyyyz*z
    v60        = 4.0d0*y
    v63        = 0.00833333333333333d0*x
    v65        = L_xxxyyyy + L_xxxyyyyz*z
    v70        = 5.0d0*y
    v73        = L_xyz*z
    v80        = L_xyyyyyy + L_xyyyyyyz*z
    v82        = L_xxxxxxyy*y + v39
    v95        = L_xz*z
    v117       = 0.00138888888888889d0*x
    v151       = L_yyz*z
    v158       = L_yyyyyyy + L_yyyyyyyz*z
    v165       = 0.00833333333333333d0*y
    v167       = L_yz*z
    v179       = 0.00138888888888889d0*y
    L_zz       = -(L_xx + L_yy)
    L_xzz      = -(L_xxx + L_xyy)
    v119       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v181       = L_yzz*z
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
    v128       = L_xxxxxxz + L_xxxxxxyz*y + L_xxxxxxzz*z
    L_xxxxxyzz = -(L_xxxxxxxy + L_xxxxxyyy)
    v135       = L_xxxxxyz + L_xxxxxyzz*z
    L_xxxxxzzz = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz = -(L_xxxxxxyy + L_xxxxyyyy)
    v139       = L_xxxxyyz + L_xxxxyyzz*z
    L_xxxxyzzz = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz = -(L_xxxxxyyy + L_xxxyyyyy)
    v142       = L_xxxyyyz + L_xxxyyyzz*z
    L_xxxyyzzz = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz = -(L_xxxxyyyy + L_xxyyyyyy)
    v146       = L_xxyyyyz + L_xxyyyyzz*z
    L_xxyyyzzz = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz = -(L_xxxyyyyy + L_xyyyyyyy)
    v126       = L_xyyyyyz + L_xyyyyyzz*z
    L_xyyyyzzz = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz = -(L_xxyyyyyy + L_yyyyyyyy)
    v187       = L_yyyyyyz + L_yyyyyyzz*z
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
    v54        = a2
    v55        = 0.0208333333333333d0*v54
    v116       = 0.00416666666666667d0*v54
    a3         = a1*a2
    v47        = a3
    v48        = 0.0277777777777778d0*v47
    v115       = 0.00694444444444444d0*v47
    a4         = a2*a2
    v36        = a4
    v37        = 0.0208333333333333d0*v36
    v114       = 0.00694444444444444d0*v36
    a5         = a2*a3
    v18        = a5
    v19        = 0.00833333333333333d0*v18
    v110       = 0.00416666666666667d0*v18
    a6         = a3*a3
    v1         = a6
    v2         = 0.00138888888888889d0*v1
    a7         = a3*a4
    v96        = 0.000198412698412698d0*a7
    a8         = a4*a4
    b2         = b1*b1
    v30        = b2
    v49        = 3.0d0*v30
    v58        = 6.0d0*v30
    v68        = 10.0d0*v30
    v163       = 0.0208333333333333d0*v30
    v178       = 0.00416666666666667d0*v30
    b3         = b1*b2
    v25        = b3
    v56        = 4.0d0*v25
    v66        = 10.0d0*v25
    v161       = 0.0277777777777778d0*v25
    v177       = 0.00694444444444444d0*v25
    b4         = b2*b2
    v21        = b4
    v64        = 5.0d0*v21
    v159       = 0.0208333333333333d0*v21
    v176       = 0.00694444444444444d0*v21
    b5         = b2*b3
    v15        = b5
    v17        = v15*v16
    v81        = v15*v80
    v157       = 0.00833333333333333d0*v15
    v175       = 0.00416666666666667d0*v15
    v127       = v126*v15
    b6         = b3*b3
    v3         = b6
    v4         = L_xxyyyyyy*v3
    v74        = L_xyyyyyyy*v3
    v106       = 0.00138888888888889d0*v3
    v120       = L_xyyyyyyz*v3
    b7         = b3*b4
    v97        = b7
    v98        = L_xyyyyyyy*v97
    v168       = 0.000198412698412698d0*v97
    b8         = b4*b4
    c2         = c1*c1
    v5         = c2
    v27        = 3.0d0*v5
    v32        = 12.0d0*v5
    v42        = 60.0d0*v5
    v192       = 0.5d0*v5
    v99        = L_xzz*v5
    v169       = L_yzz*v5
    v6         = L_xxzz*v5
    v75        = L_xyzz*v5
    v121       = L_xzzz*v5
    v152       = L_yyzz*v5
    v182       = L_yzzz*v5
    v40        = 2.0d0*L_xxxxxx + L_xxxxxxyy*v30 + L_xxxxxxz*v22 + L_xxxxxxzz*v5 + v38* &
      v39
    v52        = 2.0d0*L_xxxxxy + L_xxxxxyz*v22 + L_xxxxxyzz*v5
    v89        = v52 + L_xxxxxyyy*v30 + v38*v50
    v136       = L_xxxxxyyz*v30 + 2.0d0*L_xxxxxz + L_xxxxxzz*v22 + L_xxxxxzzz*v5 + v135* &
      v38
    v59        = 2.0d0*L_xxxxyy + L_xxxxyyz*v22 + L_xxxxyyzz*v5
    v140       = 2.0d0*L_xxxxyz + L_xxxxyzz*v22 + L_xxxxyzzz*v5
    v67        = 2.0d0*L_xxxyyy + L_xxxyyyz*v22 + L_xxxyyyzz*v5
    v143       = 2.0d0*L_xxxyyz + L_xxxyyzz*v22 + L_xxxyyzzz*v5
    v23        = 2.0d0*L_xxyyyy + L_xxyyyyz*v22 + L_xxyyyyzz*v5
    v24        = v21*v23
    v147       = 2.0d0*L_xxyyyz + L_xxyyyzz*v22 + L_xxyyyzzz*v5
    v83        = 2.0d0*L_xyyyyy + L_xyyyyyz*v22 + L_xyyyyyzz*v5
    v84        = v21*v83
    v107       = v15*v83
    v129       = 2.0d0*L_xyyyyz + L_xyyyyzz*v22 + L_xyyyyzzz*v5
    v130       = v129*v21
    v160       = 2.0d0*L_yyyyyy + L_yyyyyyz*v22 + L_yyyyyyzz*v5
    v188       = 2.0d0*L_yyyyyz + L_yyyyyzz*v22 + L_yyyyyzzz*v5
    h          = v30 + v5 + v54
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
    v7         = c3
    v33        = 4.0d0*v7
    v43        = 20.0d0*v7
    v193       = 0.166666666666667d0*v7
    v100       = L_xzzz*v7
    v170       = L_yzzz*v7
    v8         = L_xxzzz*v7
    v76        = L_xyzzz*v7
    v122       = L_xzzzz*v7
    v153       = L_yyzzz*v7
    v183       = L_yzzzz*v7
    v53        = 6.0d0*L_xxxxx + L_xxxxxyyy*v25 + L_xxxxxz*v26 + L_xxxxxzz*v27 + &
      L_xxxxxzzz*v7 + v49*v50 + v51*v52
    v61        = 6.0d0*L_xxxxy + L_xxxxyz*v26 + L_xxxxyzz*v27 + L_xxxxyzzz*v7
    v92        = v61 + L_xxxxyyyy*v25 + v49*v57 + v51*v59
    v141       = L_xxxxyyyz*v25 + 6.0d0*L_xxxxz + L_xxxxzz*v26 + L_xxxxzzz*v27 + &
      L_xxxxzzzz*v7 + v139*v49 + v140*v51
    v69        = 6.0d0*L_xxxyy + L_xxxyyz*v26 + L_xxxyyzz*v27 + L_xxxyyzzz*v7
    v144       = 6.0d0*L_xxxyz + L_xxxyzz*v26 + L_xxxyzzz*v27 + L_xxxyzzzz*v7
    v28        = 6.0d0*L_xxyyy + L_xxyyyz*v26 + L_xxyyyzz*v27 + L_xxyyyzzz*v7
    v29        = v25*v28
    v148       = 6.0d0*L_xxyyz + L_xxyyzz*v26 + L_xxyyzzz*v27 + L_xxyyzzzz*v7
    v85        = 6.0d0*L_xyyyy + L_xyyyyz*v26 + L_xyyyyzz*v27 + L_xyyyyzzz*v7
    v86        = v25*v85
    v108       = v21*v85
    v131       = 6.0d0*L_xyyyz + L_xyyyzz*v26 + L_xyyyzzz*v27 + L_xyyyzzzz*v7
    v132       = v131*v25
    v162       = 6.0d0*L_yyyyy + L_yyyyyz*v26 + L_yyyyyzz*v27 + L_yyyyyzzz*v7
    v189       = 6.0d0*L_yyyyz + L_yyyyzz*v26 + L_yyyyzzz*v27 + L_yyyyzzzz*v7
    c4         = c2*c2
    v9         = c4
    v44        = 5.0d0*v9
    v194       = 0.0416666666666667d0*v9
    v101       = L_xzzzz*v9
    v171       = L_yzzzz*v9
    v10        = L_xxzzzz*v9
    v77        = L_xyzzzz*v9
    v123       = L_xzzzzz*v9
    v154       = L_yyzzzz*v9
    v184       = L_yzzzzz*v9
    v62        = 24.0d0*L_xxxx + L_xxxxyyyy*v21 + L_xxxxz*v31 + L_xxxxzz*v32 + L_xxxxzzz* &
      v33 + L_xxxxzzzz*v9 + v56*v57 + v58*v59 + v60*v61
    v71        = 24.0d0*L_xxxy + L_xxxyz*v31 + L_xxxyzz*v32 + L_xxxyzzz*v33 + L_xxxyzzzz* &
      v9
    v93        = v71 + L_xxxyyyyy*v21 + v56*v65 + v58*v67 + v60*v69
    v145       = L_xxxyyyyz*v21 + 24.0d0*L_xxxz + L_xxxzz*v31 + L_xxxzzz*v32 + L_xxxzzzz* &
      v33 + L_xxxzzzzz*v9 + v142*v56 + v143*v58 + v144*v60
    v34        = 24.0d0*L_xxyy + L_xxyyz*v31 + L_xxyyzz*v32 + L_xxyyzzz*v33 + L_xxyyzzzz* &
      v9
    v35        = v30*v34
    v149       = 24.0d0*L_xxyz + L_xxyzz*v31 + L_xxyzzz*v32 + L_xxyzzzz*v33 + L_xxyzzzzz* &
      v9
    v87        = 24.0d0*L_xyyy + L_xyyyz*v31 + L_xyyyzz*v32 + L_xyyyzzz*v33 + L_xyyyzzzz* &
      v9
    v88        = v30*v87
    v109       = v25*v87
    v133       = 24.0d0*L_xyyz + L_xyyzz*v31 + L_xyyzzz*v32 + L_xyyzzzz*v33 + L_xyyzzzzz* &
      v9
    v134       = v133*v30
    v164       = 24.0d0*L_yyyy + L_yyyyz*v31 + L_yyyyzz*v32 + L_yyyyzzz*v33 + L_yyyyzzzz* &
      v9
    v190       = 24.0d0*L_yyyz + L_yyyzz*v31 + L_yyyzzz*v32 + L_yyyzzzz*v33 + L_yyyzzzzz* &
      v9
    c5         = c2*c3
    v11        = c5
    v195       = 0.00833333333333333d0*v11
    v102       = L_xzzzzz*v11
    v172       = L_yzzzzz*v11
    v12        = L_xxzzzzz*v11
    v78        = L_xyzzzzz*v11
    v124       = L_xzzzzzz*v11
    v155       = L_yyzzzzz*v11
    v185       = L_yzzzzzz*v11
    v72        = 120.0d0*L_xxx + L_xxxyyyyy*v15 + L_xxxz*v41 + L_xxxzz*v42 + L_xxxzzz*v43 &
      + L_xxxzzzz*v44 + L_xxxzzzzz*v11 + v64*v65 + v66*v67 + v68*v69 + &
      v70*v71
    v45        = 120.0d0*L_xxy + L_xxyz*v41 + L_xxyzz*v42 + L_xxyzzz*v43 + L_xxyzzzz*v44 &
      + L_xxyzzzzz*v11
    v46        = v45*y
    v94        = v45 + L_xxyyyyyy*v15 + v16*v64 + v23*v66 + v28*v68 + v34*v70
    v150       = L_xxyyyyyz*v15 + 120.0d0*L_xxz + L_xxzz*v41 + L_xxzzz*v42 + L_xxzzzz*v43 &
      + L_xxzzzzz*v44 + L_xxzzzzzz*v11 + v146*v64 + v147*v66 + v148*v68 &
      + v149*v70
    v90        = 120.0d0*L_xyy + L_xyyz*v41 + L_xyyzz*v42 + L_xyyzzz*v43 + L_xyyzzzz*v44 &
      + L_xyyzzzzz*v11
    v91        = v90*y
    v111       = v30*v90
    v137       = 120.0d0*L_xyz + L_xyzz*v41 + L_xyzzz*v42 + L_xyzzzz*v43 + L_xyzzzzz*v44 &
      + L_xyzzzzzz*v11
    v138       = v137*y
    v166       = 120.0d0*L_yyy + L_yyyz*v41 + L_yyyzz*v42 + L_yyyzzz*v43 + L_yyyzzzz*v44 &
      + L_yyyzzzzz*v11
    v191       = 120.0d0*L_yyz + L_yyzz*v41 + L_yyzzz*v42 + L_yyzzzz*v43 + L_yyzzzzz*v44 &
      + L_yyzzzzzz*v11
    c6         = c3*c3
    v13        = c6
    v196       = 0.00138888888888889d0*v13
    v103       = L_xzzzzzz*v13
    v173       = L_yzzzzzz*v13
    v14        = L_xxzzzzzz*v13
    v118       = v14 + v4 + 30.0d0*v10 + 20.0d0*v29 + 360.0d0*v6 + 120.0d0*v8 + 720.0d0*( &
      L_xx + v0) + 15.0d0*(v24 + v35) + 6.0d0*(v12 + v17 + v46)
    Phi_xx     = L_xx + L_xxxxxxxx*v2 + v0 + v19*v20 + v37*v40 + v48*v53 + v55*v62 + v63* &
      v72 + 0.00138888888888889d0*(30.0d0*v10 + v14 + 20.0d0*v29 + v4 + &
      360.0d0*v6 + 120.0d0*v8 + 15.0d0*(v24 + v35) + 6.0d0*(v12 + v17 + &
      v46))
    v79        = L_xyzzzzzz*v13
    v112       = v79 + 360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v73 + v78)
    v113       = v112*y
    Phi_xy     = 0.00138888888888889d0*(v74 + 360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + &
      v79 + 20.0d0*v86 + 15.0d0*(v84 + v88) + 6.0d0*(v78 + v81 + v91)) &
      + L_xxxxxxxy*v2 + L_xy + v19*v82 + v37*v89 + v48*v92 + v55*v93 + &
      v63*v94 + v73
    v125       = L_xzzzzzzz*v13
    Phi_xz     = 0.00138888888888889d0*(v120 + 360.0d0*v121 + 120.0d0*v122 + 30.0d0*v123 &
      + v125 + 20.0d0*v132 + 15.0d0*(v130 + v134) + 6.0d0*(v124 + v127 &
      + v138)) + L_xxxxxxxz*v2 + L_xz + v119 + v128*v19 + v136*v37 + &
      v141*v48 + v145*v55 + v150*v63
    v156       = L_yyzzzzzz*v13
    v180       = v156 + 360.0d0*v152 + 120.0d0*v153 + 30.0d0*v154 + 6.0d0*(120.0d0*L_yy + &
      120.0d0*v151 + v155)
    Phi_yy     = 0.00138888888888889d0*(360.0d0*v152 + 120.0d0*v153 + 30.0d0*v154 + 6.0d0 &
      *v155 + v156) + L_xxxxxxyy*v2 + L_yy + L_yyyyyyyy*v106 + v151 + &
      v157*v158 + v159*v160 + v161*v162 + v163*v164 + v165*v166 + v19*( &
      L_xxxxxyyy*y + v50) + v37*(L_xxxxyyyy*v30 + v38*v57 + v59) + v48* &
      (L_xxxyyyyy*v25 + v49*v65 + v51*v67 + v69) + v55*(L_xxyyyyyy*v21 &
      + v16*v56 + v23*v58 + v28*v60 + v34) + v63*(L_xyyyyyyy*v15 + v64* &
      v80 + v66*v83 + v68*v85 + v70*v87 + v90)
    Phi_zz     = -(Phi_xx + Phi_yy)
    v186       = L_yzzzzzzz*v13
    Phi_yz     = 0.00138888888888889d0*(360.0d0*v182 + 120.0d0*v183 + 30.0d0*v184 + 6.0d0 &
      *v185 + v186) + L_xxxxxxyz*v2 + L_yyyyyyyz*v106 + L_yz + v157* &
      v187 + v159*v188 + v161*v189 + v163*v190 + v165*v191 + v181 + v19 &
      *(L_xxxxxyyz*y + v135) + v37*(L_xxxxyyyz*v30 + v139*v38 + v140) + &
      v48*(L_xxxyyyyz*v25 + v142*v49 + v143*v51 + v144) + v55*( &
      L_xxyyyyyz*v21 + v146*v56 + v147*v58 + v148*v60 + v149) + v63*( &
      L_xyyyyyyz*v15 + v126*v64 + v129*v66 + v131*v68 + v133*v70 + v137 &
      )
    c7         = c3*c4
    v104       = c7
    v197       = 0.000198412698412698d0*v104
    v105       = L_xzzzzzzz*v104
    Phi_x      = 0.000198412698412698d0*(840.0d0*v100 + 210.0d0*v101 + 42.0d0*v102 + v105 &
      + v98 + 2520.0d0*v99 + 7.0d0*(v103 + v113) + 21.0d0*(v107 + v111 &
      ) + 35.0d0*(v108 + v109)) + L_x + L_xxxxxxxx*v96 + v106*v80 + &
      v110*v40 + v114*v53 + v115*v62 + v116*v72 + v117*v118 + v2*v20 + &
      v95
    v174       = L_yzzzzzzz*v104
    Phi_y      = 0.000198412698412698d0*(2520.0d0*v169 + 840.0d0*v170 + 210.0d0*v171 + &
      42.0d0*v172 + 7.0d0*v173 + v174) + L_xxxxxxxy*v96 + L_y + &
      L_yyyyyyyy*v168 + v106*v158 + v110*v89 + v114*v92 + v115*v93 + &
      v116*v94 + v117*(v112 + v74 + 6.0d0*v81 + 15.0d0*v84 + 20.0d0*v86 &
      + 15.0d0*v88 + 6.0d0*v91) + v160*v175 + v162*v176 + v164*v177 + &
      v166*v178 + v167 + v179*v180 + v2*v82
    Phi_z      = L_z + L_xxxxxxxz*v96 + L_yyyyyyyz*v168 + L_zz*z + L_zzz*v192 + L_zzzz* &
      v193 + L_zzzzz*v194 + L_zzzzzz*v195 + L_zzzzzzz*v196 + L_zzzzzzzz &
      *v197 + v106*v187 + v110*v136 + v114*v141 + v115*v145 + v116*v150 &
      + v117*(720.0d0*L_xz + 720.0d0*v119 + v120 + 360.0d0*v121 + &
      120.0d0*v122 + 30.0d0*v123 + 6.0d0*v124 + v125 + 6.0d0*v127 + &
      15.0d0*v130 + 20.0d0*v132 + 15.0d0*v134 + 6.0d0*v138) + v128*v2 + &
      v175*v188 + v176*v189 + v177*v190 + v178*v191 + v179*(720.0d0* &
      L_yz + 720.0d0*v181 + 360.0d0*v182 + 120.0d0*v183 + 30.0d0*v184 + &
      6.0d0*v185 + v186)
    c8         = c4*c4
    Phi_0      = 2.48015873015873d-5*(L_xxxxxxxx*a8 + L_yyyyyyyy*b8 + L_zzzzzzzz*c8 + &
      70.0d0*(v164*v21 + v36*v62) + 8.0d0*(x*(5040.0d0*L_x + 840.0d0* &
      v100 + 210.0d0*v101 + 42.0d0*v102 + 7.0d0*v103 + v105 + 21.0d0* &
      v107 + 35.0d0*v108 + 35.0d0*v109 + 21.0d0*v111 + 7.0d0*v113 + &
      7.0d0*v3*v80 + 5040.0d0*v95 + v98 + 2520.0d0*v99) + y*(5040.0d0* &
      L_y + 5040.0d0*v167 + 2520.0d0*v169 + 840.0d0*v170 + 210.0d0*v171 &
      + 42.0d0*v172 + 7.0d0*v173 + v174)) + 28.0d0*(v1*v40 + v118*v54 + &
      v160*v3 + v180*v30) + 56.0d0*(v15*v162 + v166*v25 + v18*v53 + v47 &
      *v72)) + L_0 + L_z*z + L_zz*v192 + L_zzz*v193 + L_zzzz*v194 + &
      L_zzzzz*v195 + L_zzzzzz*v196 + L_zzzzzzz*v197 + v158*v168 + v20* &
      v96
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
#undef  L_yz                
#undef  Phi_yz              
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
    end subroutine mom_es_L2P
    
! OPS  2289*ADD + 2*DIV + 2417*MUL + POW = 4709  (11633 before optimization)
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
                v700, v701, v702, v703, v704, v71, v72, v73, v74, v75, v76,&
                v77, v78, v79, v8, v80, v81, v82, v83, v84, v85, v86, v87,&
                v88, v89, v9, v90, v91, v92, v93, v94, v95, v96, v97, v98,&
                v99, h, u
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
#define M_xxyyz              M(42)
#define Ms_xxyyz             Ms(42)
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
#define Ms_xxxxxyz           Ms(88)
#define M_xxxxxyz            M(88)
#define Ms_xxxxxzz           Ms(89)
#define M_xxxxxzz            M(89)
#define Ms_xxxxyyy           Ms(90)
#define M_xxxxyyy            M(90)
#define Ms_xxxxyyz           Ms(91)
#define M_xxxxyyz            M(91)
#define M_xxxxyzz            M(92)
#define Ms_xxxxyzz           Ms(92)
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
#define Ms_xxxxyyyz          Ms(131)
#define M_xxxxyyyz           M(131)
#define M_xxxxyyzz           M(132)
#define Ms_xxxxyyzz          Ms(132)
#define Ms_xxxxyzzz          Ms(133)
#define M_xxxxyzzz           M(133)
#define Ms_xxxxzzzz          Ms(134)
#define M_xxxxzzzz           M(134)
#define M_xxxyyyyy           M(135)
#define Ms_xxxyyyyy          Ms(135)
#define M_xxxyyyyz           M(136)
#define Ms_xxxyyyyz          Ms(136)
#define Ms_xxxyyyzz          Ms(137)
#define M_xxxyyyzz           M(137)
#define M_xxxyyzzz           M(138)
#define Ms_xxxyyzzz          Ms(138)
#define Ms_xxxyzzzz          Ms(139)
#define M_xxxyzzzz           M(139)
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
#define M_xyyyyyyy           M(148)
#define Ms_xyyyyyyy          Ms(148)
#define M_xyyyyyyz           M(149)
#define Ms_xyyyyyyz          Ms(149)
#define M_xyyyyyzz           M(150)
#define Ms_xyyyyyzz          Ms(150)
#define M_xyyyyzzz           M(151)
#define Ms_xyyyyzzz          Ms(151)
#define M_xyyyzzzz           M(152)
#define Ms_xyyyzzzz          Ms(152)
#define M_xyyzzzzz           M(153)
#define Ms_xyyzzzzz          Ms(153)
#define Ms_xyzzzzzz          Ms(154)
#define M_xyzzzzzz           M(154)
#define M_xzzzzzzz           M(155)
#define Ms_xzzzzzzz          Ms(155)
#define Ms_yyyyyyyy          Ms(156)
#define M_yyyyyyyy           M(156)
#define Ms_yyyyyyyz          Ms(157)
#define M_yyyyyyyz           M(157)
#define M_yyyyyyzz           M(158)
#define Ms_yyyyyyzz          Ms(158)
#define Ms_yyyyyzzz          Ms(159)
#define M_yyyyyzzz           M(159)
#define Ms_yyyyzzzz          Ms(160)
#define M_yyyyzzzz           M(160)
#define M_yyyzzzzz           M(161)
#define Ms_yyyzzzzz          Ms(161)
#define Ms_yyzzzzzz          Ms(162)
#define M_yyzzzzzz           M(162)
#define M_yzzzzzzz           M(163)
#define Ms_yzzzzzzz          Ms(163)
#define M_zzzzzzzz           M(164)
#define Ms_zzzzzzzz          Ms(164)
    v654        = 0.0416666666666667d0*M_0
    v673        = 0.00138888888888889d0*M_0
    v693        = 0.000694444444444444d0*M_0
    v0          = M_0*x
    v1          = M_x + v0
    v2          = M_0*y
    v3          = M_y + v2
    v4          = M_0*z + M_z
    v5          = M_x*x
    v6          = M_xx + v5
    v7          = 0.5d0*M_0
    v9          = M_y*x
    v10         = M_xy + v9
    v11         = M_x*y
    v12         = v0*y
    v13         = v10 + v11 + v12
    v14         = M_z*x
    v15         = M_xz + v14
    v16         = M_x*z
    v17         = v0*z + v15 + v16
    v18         = M_y*y
    v19         = M_yy + v18
    v21         = M_z*y
    v22         = M_yz + v21
    v23         = M_y*z
    v24         = v2*z + v22 + v23
    v25         = M_z*z
    v26         = M_zz + v25
    v28         = M_xx*x
    v29         = M_xxx + v28
    v30         = 0.166666666666667d0*M_0
    v33         = M_xy*x
    v34         = M_xxy + v33
    v35         = M_xx*y
    v36         = v5*y
    v37         = v34 + v35 + v36
    v38         = M_xz*x
    v39         = M_xxz + v38
    v40         = M_xx*z
    v41         = v5*z
    v42         = v39 + v40 + v41
    v44         = M_yy*x
    v45         = M_xyy + v44
    v46         = M_xy*y
    v47         = v9*y
    v48         = v45 + v46 + v47
    v49         = M_xy*z
    v50         = v9*z
    v51         = v49 + v50
    v52         = M_xz*y
    v697        = M_xyz + v52
    v53         = M_yz*x
    v54         = v11*z
    v55         = v14*y
    v668        = v53 + v55
    v57         = M_zz*x
    v58         = M_xzz + v57
    v59         = M_xz*z
    v60         = v14*z
    v61         = v58 + v59 + v60
    v62         = M_yy*y
    v63         = M_yyy + v62
    v65         = M_yz*y
    v66         = M_yyz + v65
    v67         = M_yy*z
    v68         = v18*z
    v69         = v66 + v67 + v68
    v70         = M_zz*y
    v71         = M_yzz + v70
    v72         = M_yz*z
    v73         = v21*z
    v74         = v71 + v72 + v73
    v75         = M_zz*z
    v76         = M_zzz + v75
    v78         = M_xxx*x
    v79         = v654
    v82         = M_xxy*x
    v83         = M_xxxy + v82
    v84         = M_xxx*y
    v85         = v28*y
    v86         = v83 + v84 + v85
    v87         = M_xy + v11
    v88         = M_xxz*x
    v89         = M_xxxz + v88
    v90         = M_xxx*z
    v91         = v28*z
    v92         = v89 + v90 + v91
    v93         = M_xz + v16
    v94         = M_xyy*x
    v95         = M_xxyy + v94
    v96         = M_xxy*y
    v97         = v33*y
    v98         = v95 + v96 + v97
    v101        = 0.25d0*M_0
    v103        = M_xxy*z
    v104        = v35*z
    v105        = v103 + v104
    v106        = M_xxz*y
    v699        = M_xxyz + v106
    v107        = M_xyz*x
    v108        = v33*z
    v688        = v107 + v108
    v109        = v38*y
    v110        = M_xzz*x
    v111        = M_xxzz + v110
    v112        = M_xxz*z
    v113        = v38*z
    v114        = v111 + v112 + v113
    v118        = M_yyy*x
    v119        = M_xyyy + v118
    v120        = M_xyy*y
    v121        = v44*y
    v122        = v119 + v120 + v121
    v124        = M_xyy*z
    v125        = v44*z
    v126        = v124 + v125
    v127        = M_xyz*y
    v128        = M_yyz*x
    v700        = M_xyyz + v128
    v129        = v46*z
    v685        = v127 + v129
    v130        = v53*y
    v131        = M_xyz*z
    v132        = v52*z
    v133        = v131 + v132
    v134        = M_xzz*y
    v701        = M_xyzz + v134
    v135        = M_yzz*x
    v136        = v53*z
    v137        = v57*y
    v678        = v135 + v137
    v138        = M_zzz*x
    v139        = M_xzzz + v138
    v140        = M_xzz*z
    v141        = v57*z
    v142        = v139 + v140 + v141
    v144        = M_yyy*y
    v146        = M_yyz*y
    v147        = M_yyyz + v146
    v148        = M_yyy*z
    v149        = v62*z
    v150        = v147 + v148 + v149
    v151        = M_yz + v23
    v152        = M_yzz*y
    v153        = M_yyzz + v152
    v154        = M_yyz*z
    v155        = v65*z
    v156        = v153 + v154 + v155
    v160        = M_zzz*y
    v161        = M_yzzz + v160
    v162        = M_yzz*z
    v163        = v70*z
    v164        = v161 + v162 + v163
    v165        = M_zzz*z
    v167        = M_xxxx*x
    v168        = 0.00833333333333333d0*M_0
    v171        = M_xxxx*y
    v172        = M_xxxxy + v171
    v173        = M_xxxy*x
    v174        = v78*y
    v175        = M_xxy + v35
    v176        = M_xxxx*z
    v177        = M_xxxxz + v176
    v178        = M_xxxz*x
    v179        = v78*z
    v180        = M_xxz + v40
    v181        = M_xxxy*y
    v182        = M_xxxyy + v181
    v183        = M_xxyy*x
    v184        = v82*y
    v185        = 0.5d0*M_xxx
    v187        = 0.25d0*M_x
    v188        = M_xxxy*z
    v189        = M_xxxz*y
    v190        = v84*z + M_xxxyz + v188 + v189
    v191        = M_xxyz*x
    v192        = v82*z
    v193        = v88*y
    v194        = v697
    v195        = v49 + v54
    v196        = v194 + v195
    v197        = M_xxxz*z
    v198        = M_xxxzz + v197
    v199        = M_xxzz*x
    v200        = v88*z
    v201        = M_xyyy*x
    v202        = M_xxyyy + v201
    v203        = M_xxyy*y
    v204        = v94*y
    v207        = M_xxyy*z
    v208        = v96*z
    v209        = v94*z
    v666        = v207 + v209
    v210        = v97*z + v208 + v666
    v211        = M_xxyz*y
    v212        = M_xyyz*x
    v703        = M_xxyyz + v212
    v213        = v107*y
    v694        = v211 + v213
    v216        = M_xxyz*z
    v217        = v106*z
    v218        = v216 + v217
    v219        = M_xxzz*y
    v702        = M_xxyzz + v219
    v220        = M_xyzz*x
    v221        = v107*z
    v222        = v110*y
    v695        = v220 + v222
    v223        = v109*z
    v227        = M_xzzz*x
    v228        = M_xxzzz + v227
    v229        = M_xxzz*z
    v230        = v110*z
    v231        = M_yyyy*x
    v232        = M_xyyyy + v231
    v233        = M_xyyy*y
    v234        = v118*y
    v236        = M_xyyy*z
    v237        = M_yyyz*x
    v238        = v118*z + M_xyyyz + v236 + v237
    v239        = M_xyyz*y
    v240        = v120*z
    v241        = v128*y
    v242        = M_xyz + v53
    v243        = v242 + v51
    v244        = v128*z
    v245        = v130*z + v244
    v246        = M_xyyz*z
    v247        = M_xyzz*y
    v248        = M_yyzz*x
    v249        = v127*z
    v704        = v246 + v249
    v250        = v135*y
    v698        = v248 + v250
    v696        = v245 + v698
    v254        = M_xzzz*y
    v255        = M_yzzz*x
    v256        = v138*y
    v257        = M_xyzzz + v254 + v255 + v256
    v258        = M_xyzz*z
    v259        = v134*z
    v260        = v135*z
    v261        = v668
    v262        = v194 + v261
    v263        = M_zzzz*x
    v264        = M_xzzzz + v263
    v265        = M_xzzz*z
    v266        = v138*z
    v268        = M_yyyy*y
    v270        = M_yyyy*z
    v271        = M_yyyyz + v270
    v272        = M_yyyz*y
    v273        = v144*z
    v274        = M_yyz + v67
    v275        = M_yyyz*z
    v276        = M_yyyzz + v275
    v277        = M_yyzz*y
    v278        = v146*z
    v281        = M_yzzz*y
    v282        = M_yyzzz + v281
    v283        = M_yyzz*z
    v284        = v152*z
    v287        = M_zzzz*y
    v288        = M_yzzzz + v287
    v289        = M_yzzz*z
    v290        = v160*z
    v291        = M_zzzz*z
    v293        = M_xxxxx*x
    v294        = v673
    v297        = M_xxxxx*y
    v298        = M_xxxxxy + v297
    v299        = M_xxxxy*x
    v300        = v167*y
    v301        = M_xxxy + v84
    v302        = M_xxxxx*z
    v303        = M_xxxxxz + v302
    v304        = M_xxxxz*x
    v305        = v167*z
    v306        = M_xxxz + v90
    v307        = M_xxxxy*y
    v308        = M_xxxyy*x
    v309        = v173*y
    v310        = 0.5d0*M_xxxx
    v315        = M_xyy + v46
    v316        = M_xxxxy*z
    v317        = M_xxxxz*y
    v318        = v171*z + M_xxxxyz + v316 + v317
    v319        = M_xxxyz*x
    v320        = v173*z
    v321        = v178*y
    v322        = v699
    v323        = v105 + v322
    v324        = M_xxxxz*z
    v325        = M_xxxzz*x
    v326        = v178*z
    v327        = M_xzz + v59
    v328        = M_xxxyy*y
    v329        = M_xxyyy*x
    v330        = v183*y
    v331        = 0.166666666666667d0*M_xxx
    v332        = 0.5d0*M_xxxy
    v334        = v11 + v9
    v336        = M_xxxyy*z
    v337        = M_xxxyz*y
    v338        = M_xxyyz*x
    v339        = v181*z
    v340        = v183*z
    v341        = v191*y
    v342        = 0.5d0*M_xxxz
    v344        = M_xxxyz*z
    v345        = M_xxxzz*y
    v346        = M_xxyzz*x
    v347        = v189*z
    v348        = v191*z
    v349        = v199*y
    v351        = M_xxxzz*z
    v352        = M_xxzzz*x
    v353        = v199*z
    v354        = v14 + v16
    v356        = M_xxyyy*y
    v357        = M_xyyyy*x
    v358        = v201*y
    v362        = M_xxyyy*z
    v363        = M_xxyyz*y
    v364        = M_xyyyz*x
    v365        = v203*z
    v366        = v201*z
    v367        = v212*y
    v368        = M_xxyyz*z
    v369        = M_xxyzz*y
    v370        = M_xyyzz*x
    v371        = v211*z
    v372        = v212*z
    v373        = v220*y
    v379        = M_xxyzz*z
    v380        = M_xxzzz*y
    v381        = M_xyzzz*x
    v382        = v219*z
    v383        = v220*z
    v384        = v227*y
    v386        = M_xxzzz*z
    v387        = M_xzzzz*x
    v388        = v227*z
    v389        = M_yyyyy*x
    v390        = M_xyyyyy + v389
    v391        = M_xyyyy*y
    v392        = v231*y
    v394        = M_xyyyy*z
    v395        = M_yyyyz*x
    v396        = v231*z + M_xyyyyz + v394 + v395
    v397        = M_xyyyz*y
    v398        = v233*z
    v399        = v237*y
    v400        = v700
    v401        = v126 + v400
    v402        = M_xyyyz*z
    v403        = M_xyyzz*y
    v404        = M_yyyzz*x
    v405        = v239*z
    v406        = v237*z
    v407        = v248*y
    v409        = M_xyyzz*z
    v410        = M_xyzzz*y
    v411        = M_yyzzz*x
    v412        = v247*z
    v413        = v248*z
    v414        = v255*y
    v416        = M_xzzzz*y
    v417        = M_yzzzz*x
    v418        = v263*y
    v419        = M_xyzzzz + v416 + v417 + v418
    v420        = M_xyzzz*z
    v421        = v254*z
    v422        = v255*z
    v423        = v701
    v424        = v678
    v425        = v423 + v424
    v426        = M_zzzzz*x
    v427        = M_xzzzzz + v426
    v428        = M_xzzzz*z
    v429        = v263*z
    v431        = M_yyyyy*y
    v433        = M_yyyyy*z
    v434        = M_yyyyyz + v433
    v435        = M_yyyyz*y
    v436        = v268*z
    v437        = M_yyyz + v148
    v438        = M_yyyyz*z
    v439        = M_yyyzz*y
    v440        = v272*z
    v443        = M_yzz + v72
    v444        = M_yyyzz*z
    v445        = M_yyzzz*y
    v446        = v277*z
    v448        = v21 + v23
    v450        = M_yyzzz*z
    v451        = M_yzzzz*y
    v452        = v281*z
    v454        = M_zzzzz*y
    v455        = M_yzzzzz + v454
    v456        = M_yzzzz*z
    v457        = v287*z
    v458        = M_zzzzz*z
    v460        = M_xxxxxx*x
    v461        = 0.000198412698412698d0*M_0
    v464        = M_xxxxxx*y
    v465        = M_xxxxxy*x
    v466        = v293*y
    v467        = M_xxxxxz*x
    v468        = M_xxxxxy*y
    v469        = M_xxxxyy*x
    v470        = v299*y
    v471        = 0.5d0*M_xxxxx
    v475        = 0.25d0*M_xxx
    v476        = M_xxyy + v96
    v477        = M_xxxxxz*y
    v478        = M_xxxxyz*x
    v479        = v304*y
    v480        = M_xxxxzz*x
    v481        = M_xxzz + v112
    v482        = M_xxxxyy*y
    v483        = M_xxxyyy*x
    v484        = v308*y
    v485        = 0.166666666666667d0*M_xxxx
    v486        = 0.5d0*M_xxxxy
    v490        = M_xxxxyz*y
    v491        = M_xxxyyz*x
    v492        = v319*y
    v493        = 0.5d0*M_xxxxz
    v494        = M_xyyz + v124
    v495        = v685
    v496        = v494 + v495
    v497        = M_xxxxzz*y
    v498        = M_xxxyzz*x
    v499        = v325*y
    v501        = v133 + v423
    v502        = M_xxxzzz*x
    v503        = M_xxxyyy*y
    v504        = M_xxyyyy*x
    v505        = v329*y
    v506        = 0.166666666666667d0*M_xxxy
    v507        = 0.5d0*M_xxxyy
    v512        = M_xxxyyz*y
    v513        = M_xxyyyz*x
    v514        = v338*y
    v515        = 0.5d0*M_xxxyz
    v516        = 0.166666666666667d0*M_xxxz
    v517        = M_xxxyzz*y
    v518        = M_xxyyzz*x
    v519        = v346*y
    v520        = 0.5d0*M_xxxzz
    v525        = M_xxxzzz*y
    v526        = M_xxyzzz*x
    v527        = v352*y
    v529        = M_xxzzzz*x
    v530        = M_xxyyyy*y
    v531        = M_xyyyyy*x
    v532        = v357*y
    v536        = M_xxyyyz*y
    v537        = M_xyyyyz*x
    v538        = v364*y
    v539        = M_xxyz + v103
    v540        = v688
    v541        = v539 + v540
    v542        = M_xxyyzz*y
    v543        = M_xyyyzz*x
    v544        = v370*y
    v549        = M_xxyzzz*y
    v550        = M_xyyzzz*x
    v551        = v381*y
    v555        = M_xxzzzz*y
    v556        = M_xyzzzz*x
    v557        = v387*y
    v559        = v107 + v109
    v560        = v322 + v559
    v561        = M_xzzzzz*x
    v562        = M_xyyyyy*y
    v563        = M_yyyyyy*x
    v564        = v389*y
    v566        = M_xyyyyz*y
    v567        = M_yyyyyz*x
    v568        = v395*y
    v569        = M_xyyyzz*y
    v570        = M_yyyyzz*x
    v571        = v404*y
    v573        = M_xyzz + v135
    v574        = v131 + v136
    v575        = v573 + v574
    v576        = M_xyyzzz*y
    v577        = M_yyyzzz*x
    v578        = v411*y
    v580        = M_xyzzzz*y
    v581        = M_yyzzzz*x
    v582        = v417*y
    v584        = v127 + v130
    v585        = v400 + v584
    v586        = M_xzzzzz*y
    v587        = M_yzzzzz*x
    v588        = v426*y
    v589        = M_zzzzzz*x
    v591        = M_yyyyyy*y
    v593        = M_yyyyyz*y
    v594        = M_yyyyzz*y
    v598        = M_yyzz + v154
    v599        = M_yyyzzz*y
    v601        = M_yyzzzz*y
    v604        = M_yzzzzz*y
    v606        = M_zzzzzz*y
    v608        = 2.48015873015873d-5*M_0
    v610        = 0.5d0*M_xxxxxx
    v615        = 0.25d0*M_xxxx
    v616        = 0.166666666666667d0*M_xxxxx
    v617        = 0.5d0*M_xxxxxy
    v621        = 0.25d0*M_xxxy
    v623        = 0.5d0*M_xxxxxz
    v624        = v702
    v625        = 0.25d0*M_xxxz
    v627        = 0.0416666666666667d0*M_xxxx
    v628        = 0.166666666666667d0*M_xxxxy
    v629        = 0.5d0*M_xxxxyy
    v631        = 0.5d0*M_xxxxyz
    v632        = 0.166666666666667d0*M_xxxxz
    v633        = 0.5d0*M_xxxxzz
    v634        = 0.25d0*M_xxyy
    v635        = M_xyyzz + v247
    v636        = 0.166666666666667d0*M_xxxyy
    v637        = 0.5d0*M_xxxyyy
    v640        = 0.5d0*M_xxxyyz
    v641        = 0.166666666666667d0*M_xxxyz
    v642        = 0.5d0*M_xxxyzz
    v643        = 0.166666666666667d0*M_xxxzz
    v645        = 0.5d0*M_xxxzzz
    v650        = v703
    Ms_0        = Ms_0 + (M_0)
    Ms_x        = Ms_x + (v1)
    Ms_y        = Ms_y + (v3)
    Ms_z        = Ms_z + (v4)
    Ms_xy       = Ms_xy + (v13)
    Ms_xz       = Ms_xz + (v17)
    Ms_yz       = Ms_yz + (v24)
    Ms_xyz      = Ms_xyz + (v12*z + v51 + v54 + v668 + v697)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v8          = a2
    v656        = M_yy*v8
    v658        = M_zz*v8
    v664        = M_0*v8
    v32         = 0.5d0*v8
    v100        = v656
    v116        = v658
    v205        = 0.0833333333333333d0*v664
    v215        = M_yyz*v8
    v225        = M_yzz*v8
    v314        = 0.25d0*v8
    v359        = 0.0208333333333333d0*v664
    v376        = v18*v8
    v377        = v25*v8
    v510        = M_x*v8
    v533        = 0.00416666666666667d0*v664
    v546        = v72*v8
    v553        = v65*v8
    v648        = v693*v8
    Ms_xx       = Ms_xx + (v6 + v7*v8)
    Ms_xxy      = Ms_xxy + (v3*v32 + v37)
    Ms_xxz      = Ms_xxz + (v32*v4 + v42)
    Ms_xxyz     = Ms_xxyz + (v24*v32 + v36*z + v105 + v109 + v688 + v699)
    a3          = a1*a2
    v31         = a3
    v663        = 0.0833333333333333d0*v31
    v686        = 0.00694444444444444d0*v31
    v81         = 0.166666666666667d0*v31
    v186        = M_0*v663
    v313        = M_x*v31
    v333        = 0.0277777777777778d0*M_0*v31
    v474        = v663
    v508        = M_0*v686
    v614        = M_xxx*v31
    v620        = M_xx*v31
    v638        = v31*v673
    v639        = v686
    Ms_xxx      = Ms_xxx + (v29 + M_x*v32 + v30*v31)
    Ms_xxxy     = Ms_xxxy + (v86 + v3*v81 + v32*v87)
    Ms_xxxz     = Ms_xxxz + (v92 + v32*v93 + v4*v81)
    Ms_xxxyz    = Ms_xxxyz + (v196*v32 + v24*v81 + v85*z + v190 + v191 + v192 + v193)
    a4          = a2*a2
    v80         = a4
    v674        = 0.0208333333333333d0*v80
    v683        = M_0*v80
    v170        = 0.0416666666666667d0*v80
    v311        = M_0*v674
    v473        = M_x*v80
    v487        = 0.00694444444444444d0*v683
    v613        = v674
    v630        = 0.00173611111111111d0*v683
    Ms_xxxx     = Ms_xxxx + (M_xxxx + v78 + M_x*v81 + M_xx*v32 + v79*v80)
    Ms_xxxxy    = Ms_xxxxy + (v172 + v173 + v174 + v170*v3 + v175*v32 + v81*v87)
    Ms_xxxxz    = Ms_xxxxz + (v177 + v178 + v179 + v170*v4 + v180*v32 + v81*v93)
    Ms_xxxxyz   = Ms_xxxxyz + (v318 + v319 + v320 + v321 + v170*v24 + v174*z + v196*v81 + v32*v323)
    a5          = a2*a3
    v169        = a5
    v682        = 0.00416666666666667d0*v169
    v296        = 0.00833333333333333d0*v169
    v472        = M_0*v682
    v612        = M_x*v682
    v618        = v169*v673
    v622        = v682
    Ms_xxxxx    = Ms_xxxxx + (M_xxxxx + v167 + M_x*v170 + M_xx*v81 + M_xxx*v32 + v168*v169)
    Ms_xxxxxy   = Ms_xxxxxy + (v298 + v299 + v300 + v170*v87 + v175*v81 + v296*v3 + v301*v32)
    Ms_xxxxxz   = Ms_xxxxxz + (v303 + v304 + v305 + v170*v93 + v180*v81 + v296*v4 + v306*v32)
    Ms_xxxxxyz  = Ms_xxxxxyz + (M_xxxxxyz + v477 + v478 + v479 + M_xxxxxy*z + v170*v196 + v190*v32 + v24 &
      *v296 + v297*z + v299*z + v300*z + v323*v81)
    a6          = a3*a3
    v295        = a6
    v463        = 0.00138888888888889d0*v295
    v611        = v295*v693
    Ms_xxxxxx   = Ms_xxxxxx + (M_xxxxxx + v293 + M_x*v296 + M_xx*v170 + M_xxx*v81 + M_xxxx*v32 + v294* &
      v295)
    Ms_xxxxxxy  = Ms_xxxxxxy + (M_xxxxxxy + v464 + v465 + v466 + v170*v175 + v172*v32 + v296*v87 + v3* &
      v463 + v301*v81)
    Ms_xxxxxxz  = Ms_xxxxxxz + (M_xxxxxxz + v467 + M_xxxxxx*z + v170*v180 + v177*v32 + v293*z + v296*v93 &
      + v306*v81 + v4*v463)
    Ms_xxxxxxyz = Ms_xxxxxxyz + (M_xxxxxxyz + M_xxxxxxy*z + M_xxxxxxz*y + M_xxxxxyz*x + v170*v323 + v190* &
      v81 + v196*v296 + v24*v463 + v318*v32 + v464*z + v465*z + v466*z &
      + v467*y)
    a7          = a3*a4
    v462        = a7
    v609        = 0.000198412698412698d0*v462
    Ms_xxxxxxx  = Ms_xxxxxxx + (M_xxxxxxx + v460 + M_x*v463 + M_xx*v296 + M_xxx*v170 + M_xxxx*v81 + &
      M_xxxxx*v32 + v461*v462)
    Ms_xxxxxxxy = Ms_xxxxxxxy + (M_xxxxxxxy + M_xxxxxxx*y + M_xxxxxxy*x + v170*v301 + v172*v81 + v175* &
      v296 + v298*v32 + v3*v609 + v460*y + v463*v87)
    Ms_xxxxxxxz = Ms_xxxxxxxz + (M_xxxxxxxz + M_xxxxxxx*z + M_xxxxxxz*x + v170*v306 + v177*v81 + v180* &
      v296 + v303*v32 + v4*v609 + v460*z + v463*v93)
    a8          = a4*a4
    Ms_xxxxxxxx = Ms_xxxxxxxx + (M_xxxxxxxx + M_x*v609 + M_xx*v463 + M_xxx*v296 + M_xxxx*v170 + M_xxxxx* &
      v81 + M_xxxxxx*v32 + M_xxxxxxx*x + a8*v608)
    b2          = b1*b1
    v20         = b2
    v655        = M_xx*v20
    v661        = M_zz*v20
    v665        = 0.25d0*v20
    v672        = M_0*v20
    v675        = 0.0833333333333333d0*v20
    v43         = 0.5d0*v20
    v99         = v655
    v102        = v20*v8
    v158        = v661
    v206        = v665*v8
    v214        = M_xxz*v20
    v252        = M_xzz*v20
    v286        = v672
    v312        = v675
    v335        = v675*v8
    v343        = v31*v675
    v361        = v665
    v375        = v20*v5
    v489        = v20*v674
    v522        = v20*v59
    v552        = v20*v38
    v554        = v100 + v375 + v376 + v99
    v603        = M_y*v20
    Ms_yy       = Ms_yy + (v19 + v20*v7)
    Ms_xyy      = Ms_xyy + (v1*v43 + v48)
    Ms_yyz      = Ms_yyz + (v4*v43 + v69)
    Ms_xxyy     = Ms_xxyy + (0.5d0*(v100 + v99) + v101*v102 + v18*v32 + v43*v5 + v98)
    Ms_xyyz     = Ms_xyyz + (v17*v43 + v47*z + v126 + v130 + v685 + v700)
    Ms_xxxyy    = Ms_xxxyy + (v182 + v183 + v184 + M_xyy*v32 + v102*v187 + v185*v20 + v186*v20 + v19* &
      v81 + v28*v43 + v32*v46)
    Ms_xxyyz    = Ms_xxyyz + (0.5d0*(v214 + v215) + v206*v4 + v210 + v32*v65 + v32*v67 + v32*v68 + v38 &
      *v43 + v40*v43 + v41*v43 + v694 + v703)
    Ms_xxxxyy   = Ms_xxxxyy + (M_xxxxyy + v307 + v308 + v309 + M_xxyy*v32 + v170*v19 + v20*v310 + v20* &
      v311 + v312*v313 + v314*v99 + v315*v81 + v32*v96 + v43*v78)
    Ms_xxxyyz   = Ms_xxxyyz + (M_xxxyyz + v336 + v337 + v338 + v339 + v340 + v341 + M_xyyz*v32 + v124* &
      v32 + v127*v32 + v129*v32 + v184*z + v20*v342 + v206*v93 + v343* &
      v4 + v43*v88 + v43*v90 + v43*v91 + v69*v81)
    Ms_xxxxxyy  = Ms_xxxxxyy + (0.0208333333333333d0*(v20*v473) + M_xxxxxyy + M_xxxyy*v32 + v102*v475 + &
      v167*v43 + v170*v315 + v181*v32 + v19*v296 + v20*v471 + v20*v472 &
      + v468 + v469 + v470 + v474*v99 + v476*v81)
    Ms_xxxxyyz  = Ms_xxxxyyz + (M_xxxxyyz + v490 + v491 + v492 + M_xxxxyy*z + M_xxyyz*v32 + v170*v69 + &
      v176*v43 + v178*v43 + v179*v43 + v180*v206 + v20*v493 + v207*v32 &
      + v208*v32 + v211*v32 + v307*z + v308*z + v309*z + v343*v93 + v4* &
      v489 + v496*v81)
    Ms_xxxxxxyy = Ms_xxxxxxyy + (M_xxxxxxyy + M_xxxxxxy*y + M_xxxxxyy*x + M_xxxxyy*v32 + v102*v615 + v170 &
      *v476 + v182*v81 + v19*v463 + v20*v610 + v20*v611 + v20*v612 + &
      v293*v43 + v296*v315 + v307*v32 + v312*v614 + v465*y + v613*v99)
    Ms_xxxxxyyz = Ms_xxxxxyyz + (M_xxxxxyyz + M_xxxxxyy*z + M_xxxxxyz*y + M_xxxxyyz*x + M_xxxyyz*v32 + &
      v170*v496 + v180*v343 + v20*v4*v622 + v20*v623 + v206*v306 + v296 &
      *v69 + v302*v43 + v304*v43 + v305*v43 + v32*v336 + v32*v337 + v32 &
      *v339 + v468*z + v469*z + v470*z + v478*y + v489*v93 + v81*( &
      M_xxyyz + v207 + v208 + v211))
    b3          = b1*b2
    v64         = b3
    v670        = M_0*v64
    v676        = 0.0833333333333333d0*v64
    v684        = 0.0277777777777778d0*v64
    v123        = 0.166666666666667d0*v64
    v280        = v670
    v360        = v676*v8
    v488        = v684
    v511        = v31*v684
    v535        = v676
    v619        = 0.00694444444444444d0*v64
    Ms_yyy      = Ms_yyy + (v63 + M_y*v43 + v30*v64)
    Ms_xyyy     = Ms_xyyy + (v122 + v1*v123 + v10*v43)
    Ms_yyyz     = Ms_yyyz + (v150 + v123*v4 + v151*v43)
    Ms_xxyyy    = Ms_xxyyy + (v202 + v203 + v204 + M_xxy*v43 + M_y*v206 + M_yyy*v32 + v123*v6 + v205* &
      v64 + v32*v62 + v33*v43)
    Ms_xyyyz    = Ms_xyyyz + (v121*z + v123*v17 + v243*v43 + v238 + v239 + v240 + v241)
    Ms_xxxyyy   = Ms_xxxyyy + (M_xxxyyy + v328 + v329 + v330 + M_xy*v206 + M_xyyy*v32 + M_yyy*v81 + &
      v120*v32 + v123*v28 + v20*v332 + v331*v64 + v333*v64 + v334*v335 &
      + v43*v82 + v62*v81)
    Ms_xxyyyz   = Ms_xxyyyz + (M_xxyyyz + v362 + v363 + v364 + v365 + v366 + v367 + M_xxyz*v43 + M_yyyz &
      *v32 + v103*v43 + v107*v43 + v108*v43 + v123*v42 + v146*v32 + &
      v148*v32 + v149*v32 + v151*v206 + v204*z + v360*v4)
    Ms_xxxxyyy  = Ms_xxxxyyy + (M_xxxxyyy + v482 + v483 + v484 + M_xxy*v206 + M_xxyyy*v32 + M_xyyy*v81 + &
      M_y*v489 + v120*v81 + v123*v78 + v170*v63 + v173*v43 + v20*v486 + &
      v203*v32 + v313*v488 + v335*(v33 + v35) + v485*v64 + v487*v64)
    Ms_xxxyyyz  = Ms_xxxyyyz + (M_xxxyyyz + v512 + v513 + v514 + M_xxxyyy*z + M_xyyyz*v32 + M_yyyz*v81 + &
      v123*v88 + v123*v90 + v123*v91 + v146*v81 + v148*v81 + v149*v81 + &
      v188*v43 + v191*v43 + v192*v43 + v20*v515 + v206*(M_xyz + v49) + &
      v236*v32 + v239*v32 + v240*v32 + v328*z + v329*z + v330*z + v335* &
      (v50 + v52 + v53 + v54) + v4*v511 + v516*v64)
    Ms_xxxxxyyy = Ms_xxxxxyyy + (M_xxxxxyyy + M_xxxxxyy*y + M_xxxxyyy*x + M_xxxyyy*v32 + M_xxyyy*v81 + &
      M_xy*v489 + v102*v621 + v123*v167 + v170*(M_xyyy + v120) + v20* &
      v617 + v203*v81 + v296*v63 + v299*v43 + v32*v328 + v335*(v82 + &
      v84) + v469*y + v473*v619 + v488*v620 + v603*v622 + v616*v64 + &
      v618*v64)
    Ms_xxxxyyyz = Ms_xxxxyyyz + (M_xxxxyyyz + M_xxxxyyy*z + M_xxxxyyz*y + M_xxxyyyz*x + M_xxyyyz*v32 + &
      M_xyyyz*v81 + v123*v176 + v123*v178 + v123*v179 + v150*v170 + &
      v151*v489 + v20*v631 + v206*v539 + v236*v81 + v239*v81 + v240*v81 &
      + v316*v43 + v319*v43 + v32*v362 + v32*v363 + v32*v365 + v320*v43 &
      + v335*(v104 + v106 + v540) + v4*v619*v80 + v482*z + v483*z + &
      v484*z + v491*y + v511*v93 + v632*v64)
    b4          = b2*b2
    v145        = b4
    v687        = 0.0208333333333333d0*v145
    v235        = 0.0416666666666667d0*v145
    v442        = M_0*v145
    v509        = v687
    v534        = v687*v8
    v597        = M_y*v145
    Ms_yyyy     = Ms_yyyy + (M_yyyy + v144 + M_y*v123 + M_yy*v43 + v145*v79)
    Ms_xyyyy    = Ms_xyyyy + (v232 + v233 + v234 + v1*v235 + v10*v123 + v43*v45)
    Ms_yyyyz    = Ms_yyyyz + (v271 + v272 + v273 + v123*v151 + v235*v4 + v274*v43)
    Ms_xxyyyy   = Ms_xxyyyy + (M_xxyyyy + v356 + v357 + v358 + M_xxyy*v43 + M_y*v360 + M_yyyy*v32 + &
      v100*v361 + v123*v34 + v144*v32 + v145*v359 + v235*v6 + v43*v94)
    Ms_xyyyyz   = Ms_xyyyyz + (v396 + v397 + v398 + v399 + v123*v243 + v17*v235 + v234*z + v401*v43)
    Ms_xxxyyyy  = Ms_xxxyyyy + (M_xxxyyyy + v503 + v504 + v505 + M_xyy*v206 + M_xyyyy*v32 + M_y*v511 + &
      M_yyyy*v81 + v123*v82 + v144*v81 + v145*v508 + v183*v43 + v20* &
      v507 + v233*v32 + v235*v29 + v335*(v44 + v46) + v506*v64 + v509* &
      v510)
    Ms_xxyyyyz  = Ms_xxyyyyz + (M_xxyyyyz + v536 + v537 + v538 + M_xxyyyy*z + M_xxyyz*v43 + M_yyyyz*v32 &
      + v123*v541 + v151*v360 + v206*v274 + v207*v43 + v209*v43 + v212* &
      v43 + v235*v42 + v270*v32 + v272*v32 + v273*v32 + v356*z + v357*z &
      + v358*z + v4*v534)
    Ms_xxxxyyyy = Ms_xxxxyyyy + (0.0208333333333333d0*(v102*(v655 + v656)) + M_xxxxyyy*y + M_xxxxyyyy + &
      M_xxxyyyy*x + M_xxyy*v206 + M_xxyyyy*v32 + M_xy*v511 + M_xyyyy* &
      v81 + M_yyyy*v170 + v123*v173 + v144*v170 + v145*v627 + v145*v630 &
      + v20*v629 + v233*v81 + v235*v78 + v308*v43 + v31*v334*v619 + v32 &
      *v356 + v335*(v94 + v96) + v483*y + v628*v64)
    Ms_xxxyyyyz = Ms_xxxyyyyz + (M_xxxyyyyz + M_xxxyyyy*z + M_xxxyyyz*y + M_xxyyyyz*x + M_xyyyyz*v32 + &
      M_yyyyz*v81 + v123*v188 + v123*v191 + v123*v192 + v145*v4*v639 + &
      v151*v511 + v20*v640 + v206*v494 + v235*v92 + v270*v81 + v272*v81 &
      + v273*v81 + v32*v394 + v32*v397 + v32*v398 + v335*(v125 + v128 + &
      v495) + v336*v43 + v338*v43 + v340*v43 + v503*z + v504*z + v505*z &
      + v513*y + v534*v93 + v64*v641)
    b5          = b2*b3
    v269        = b5
    v689        = 0.00416666666666667d0*v269
    v393        = 0.00833333333333333d0*v269
    v595        = v689
    v649        = M_y*v689
    Ms_yyyyy    = Ms_yyyyy + (M_yyyyy + v268 + M_y*v235 + M_yy*v123 + M_yyy*v43 + v168*v269)
    Ms_xyyyyy   = Ms_xyyyyy + (v390 + v391 + v392 + v1*v393 + v10*v235 + v119*v43 + v123*v45)
    Ms_yyyyyz   = Ms_yyyyyz + (v434 + v435 + v436 + v123*v274 + v151*v235 + v393*v4 + v43*v437)
    Ms_xxyyyyy  = Ms_xxyyyyy + (M_xxyyyyy + v530 + v531 + v532 + M_xxyyy*v43 + M_y*v534 + M_yyy*v206 + &
      M_yyyyy*v32 + v100*v535 + v123*v95 + v201*v43 + v235*v34 + v268* &
      v32 + v269*v533 + v393*v6)
    Ms_xyyyyyz  = Ms_xyyyyyz + (M_xyyyyyz + v566 + v567 + v568 + M_xyyyyy*z + v123*v401 + v17*v393 + &
      v235*v243 + v238*v43 + v389*z + v391*z + v392*z)
    Ms_xxxyyyyy = Ms_xxxyyyyy + (M_xxxyyyyy + M_xxxyyyy*y + M_xxyyyyy*x + M_xy*v534 + M_xyyy*v206 + &
      M_xyyyyy*v32 + M_yy*v511 + M_yyyyy*v81 + v123*v183 + v20*v637 + &
      v235*v83 + v268*v81 + v269*v638 + v29*v393 + v32*v391 + v329*v43 &
      + v335*(v118 + v120) + v504*y + v510*v595 + v597*v639 + v636*v64)
    Ms_xxyyyyyz = Ms_xxyyyyyz + (M_xxyyyyyz + M_xxyyyyy*z + M_xxyyyyz*y + M_xxyyyz*v43 + M_xyyyyyz*x + &
      M_yyyyyz*v32 + v123*(v650 + v666) + v151*v534 + v206*v437 + v235* &
      v541 + v274*v360 + v32*v433 + v32*v435 + v32*v436 + v362*v43 + &
      v364*v43 + v366*v43 + v393*v42 + v4*v595*v8 + v530*z + v531*z + &
      v532*z + v537*y)
    b6          = b3*b3
    v432        = b6
    v565        = 0.00138888888888889d0*v432
    Ms_yyyyyy   = Ms_yyyyyy + (M_yyyyyy + v431 + M_y*v393 + M_yy*v235 + M_yyy*v123 + M_yyyy*v43 + v294* &
      v432)
    Ms_xyyyyyy  = Ms_xyyyyyy + (M_xyyyyyy + v562 + v563 + v564 + v1*v565 + v10*v393 + v119*v123 + v232* &
      v43 + v235*v45)
    Ms_yyyyyyz  = Ms_yyyyyyz + (M_yyyyyyz + v593 + M_yyyyyy*z + v123*v437 + v151*v393 + v235*v274 + v271 &
      *v43 + v4*v565 + v431*z)
    Ms_xxyyyyyy = Ms_xxyyyyyy + (M_xxyyyyyy + M_xxyyyy*v43 + M_xxyyyyy*y + M_xyyyyyy*x + M_yyy*v360 + &
      M_yyyy*v206 + M_yyyyyy*v32 + v100*v509 + v123*v202 + v235*v95 + &
      v32*v431 + v34*v393 + v357*v43 + v432*v648 + v531*y + v565*v6 + &
      v649*v8)
    Ms_xyyyyyyz = Ms_xyyyyyyz + (M_xyyyyyyz + M_xyyyyyy*z + M_xyyyyyz*y + M_yyyyyyz*x + v123*v238 + v17* &
      v565 + v235*v401 + v243*v393 + v396*v43 + v562*z + v563*z + v564* &
      z + v567*y)
    b7          = b3*b4
    v592        = b7
    v652        = 0.000198412698412698d0*v592
    Ms_yyyyyyy  = Ms_yyyyyyy + (M_yyyyyyy + v591 + M_y*v565 + M_yy*v393 + M_yyy*v235 + M_yyyy*v123 + &
      M_yyyyy*v43 + v461*v592)
    Ms_xyyyyyyy = Ms_xyyyyyyy + (M_xyyyyyyy + M_xyyyyyy*y + M_yyyyyyy*x + v1*v652 + v10*v565 + v119*v235 &
      + v123*v232 + v390*v43 + v393*v45 + v563*y)
    Ms_yyyyyyyz = Ms_yyyyyyyz + (M_yyyyyyyz + M_yyyyyyy*z + M_yyyyyyz*y + v123*v271 + v151*v565 + v235* &
      v437 + v274*v393 + v4*v652 + v43*v434 + v591*z)
    b8          = b4*b4
    Ms_yyyyyyyy = Ms_yyyyyyyy + (M_yyyyyyyy + M_y*v652 + M_yy*v565 + M_yyy*v393 + M_yyyy*v235 + M_yyyyy* &
      v123 + M_yyyyyy*v43 + M_yyyyyyy*y + b8*v608)
    c2          = c1*c1
    v27         = c2
    v657        = M_xx*v27
    v659        = v27*v8
    v660        = M_yy*v27
    v662        = v20*v27
    v667        = 0.25d0*v27
    v669        = 0.0833333333333333d0*v27
    v677        = 0.125d0*v662
    v679        = 0.0208333333333333d0*v27
    v690        = M_0*v27
    v56         = 0.5d0*v27
    v115        = v657
    v117        = v659
    v157        = v660
    v159        = v662
    v224        = M_xxy*v27
    v226        = v667*v8
    v251        = M_xyy*v27
    v253        = v27*v665
    v279        = v669
    v350        = v31*v669
    v355        = v669*v8
    v374        = v667
    v378        = v677
    v408        = v64*v669
    v441        = v679
    v449        = v27*v675
    v500        = v679*v80
    v521        = v27*v46
    v523        = M_x*v159
    v524        = v157 + v158 + v18*v27 + v20*v25
    v545        = v27*v33
    v547        = v677*v8
    v548        = v27*v5 + v115 + v116 + v377
    v572        = v27*v687
    v596        = v690
    v626        = M_z*v27
    v644        = 0.0416666666666667d0*v662*v8
    Ms_zz       = Ms_zz + (v26 + v27*v7)
    Ms_xzz      = Ms_xzz + (v1*v56 + v61)
    Ms_yzz      = Ms_yzz + (v3*v56 + v74)
    Ms_xxzz     = Ms_xxzz + (0.5d0*(v115 + v116) + v101*v117 + v114 + v25*v32 + v5*v56)
    Ms_xyzz     = Ms_xyzz + (v13*v56 + v55*z + v133 + v136 + v678 + v701)
    Ms_yyzz     = Ms_yyzz + (0.5d0*(v157 + v158) + v101*v159 + v156 + v18*v56 + v25*v43)
    Ms_xxxzz    = Ms_xxxzz + (v198 + v199 + v200 + M_xzz*v32 + v117*v187 + v185*v27 + v186*v27 + v26* &
      v81 + v28*v56 + v32*v59)
    Ms_xxyzz    = Ms_xxyzz + (0.5d0*(v224 + v225) + v218 + v221 + v223 + v226*v3 + v32*v70 + v32*v72 + &
      v32*v73 + v33*v56 + v35*v56 + v36*v56 + v695 + v702)
    Ms_xyyzz    = Ms_xyyzz + (0.5d0*(v251 + v252) + M_xyyzz + v1*v253 + v247 + v43*v57 + v43*v59 + v43 &
      *v60 + v44*v56 + v46*v56 + v47*v56 + v696 + v704)
    Ms_yyyzz    = Ms_yyyzz + (v276 + v277 + v278 + M_y*v253 + M_yyy*v56 + M_yzz*v43 + v123*v26 + v279* &
      v280 + v43*v72 + v56*v62)
    Ms_xxxxzz   = Ms_xxxxzz + (M_xxxxzz + v324 + v325 + v326 + M_xxzz*v32 + v112*v32 + v115*v314 + v170 &
      *v26 + v27*v310 + v27*v311 + v279*v313 + v327*v81 + v56*v78)
    Ms_xxxyzz   = Ms_xxxyzz + (M_xxxyzz + v344 + v345 + v346 + v347 + v348 + v349 + M_xyzz*v32 + v131* &
      v32 + v132*v32 + v134*v32 + v193*z + v226*v87 + v27*v332 + v3* &
      v350 + v56*v82 + v56*v84 + v56*v85 + v74*v81)
    Ms_xxyyzz   = Ms_xxyyzz + (M_xxyyzz + v368 + v369 + v370 + v371 + v372 + v373 + M_xxyy*v56 + M_xxzz &
      *v43 + M_yyzz*v32 + v100*v374 + v110*v43 + v112*v43 + v113*v43 + &
      v116*v361 + v152*v32 + v154*v32 + v155*v32 + v213*z + v361*v377 + &
      v374*v375 + v374*v376 + v374*v99 + v378*v664 + v56*v94 + v56*v96 &
      + v56*v97)
    Ms_xyyyzz   = Ms_xyyyzz + (M_xyyyzz + v402 + v403 + v404 + v405 + v406 + v407 + M_xyyy*v56 + M_xyzz &
      *v43 + v1*v408 + v10*v253 + v118*v56 + v120*v56 + v121*v56 + v123 &
      *v61 + v131*v43 + v135*v43 + v136*v43 + v241*z)
    Ms_yyyyzz   = Ms_yyyyzz + (M_yyyyzz + v438 + v439 + v440 + M_y*v408 + M_yyyy*v56 + M_yyzz*v43 + &
      v123*v443 + v144*v56 + v154*v43 + v157*v361 + v235*v26 + v441* &
      v442)
    Ms_xxxxxzz  = Ms_xxxxxzz + (M_xxxxxzz + v480 + M_xxxxxz*z + M_xxxzz*v32 + v115*v474 + v117*v475 + &
      v167*v56 + v170*v327 + v197*v32 + v26*v296 + v27*v471 + v27*v472 &
      + v304*z + v441*v473 + v481*v81)
    Ms_xxxxyzz  = Ms_xxxxyzz + (M_xxxxyzz + v497 + v498 + v499 + M_xxxxyz*z + M_xxyzz*v32 + v170*v74 + &
      v171*v56 + v173*v56 + v174*v56 + v175*v226 + v216*v32 + v217*v32 &
      + v219*v32 + v27*v486 + v3*v500 + v317*z + v319*z + v321*z + v350 &
      *v87 + v501*v81)
    Ms_xxxyyzz  = Ms_xxxyyzz + (0.125d0*(v523*v8) + M_xxxyyz*z + M_xxxyyzz + M_xyyzz*v32 + v156*v81 + &
      v159*v31*v654 + v159*v475 + v181*v56 + v183*v56 + v184*v56 + v197 &
      *v43 + v199*v43 + v20*v520 + v200*v43 + v246*v32 + v247*v32 + &
      v249*v32 + v251*v314 + v252*v314 + v253*v28 + v27*v507 + v314* &
      v521 + v314*v522 + v337*z + v338*z + v341*z + v474*v524 + v517 + &
      v518 + v519)
    Ms_xxyyyzz  = Ms_xxyyyzz + (M_xxyyyzz + v542 + v543 + v544 + M_xxyyy*v56 + M_xxyyyz*z + M_xxyzz*v43 &
      + M_y*v547 + M_yyy*v226 + M_yyyzz*v32 + v114*v123 + v117*v64*v654 &
      + v201*v56 + v203*v56 + v204*v56 + v216*v43 + v220*v43 + v221*v43 &
      + v224*v361 + v225*v361 + v226*v62 + v275*v32 + v277*v32 + v278* &
      v32 + v361*v545 + v361*v546 + v363*z + v364*z + v367*z + v535* &
      v548)
    Ms_xyyyyzz  = Ms_xyyyyzz + (M_xyyyyzz + v569 + v570 + v571 + M_xyyyy*v56 + M_xyyyyz*z + M_xyyzz*v43 &
      + v1*v572 + v10*v408 + v123*v575 + v231*v56 + v233*v56 + v234*v56 &
      + v235*v61 + v244*v43 + v246*v43 + v248*v43 + v253*v45 + v395*z + &
      v397*z + v399*z)
    Ms_yyyyyzz  = Ms_yyyyyzz + (M_yyyyyzz + v594 + M_yyy*v253 + M_yyyyy*v56 + M_yyyyyz*z + M_yyyzz*v43 + &
      v123*v598 + v157*v535 + v235*v443 + v26*v393 + v268*v56 + v275* &
      v43 + v435*z + v441*v597 + v595*v596)
    Ms_xxxxxxzz = Ms_xxxxxxzz + (M_xxxxxxzz + M_xxxxxxz*z + M_xxxxxzz*x + M_xxxxzz*v32 + v115*v613 + v117 &
      *v615 + v170*v481 + v198*v81 + v26*v463 + v27*v610 + v27*v611 + &
      v27*v612 + v279*v614 + v293*v56 + v296*v327 + v32*v324 + v467*z)
    Ms_xxxxxyzz = Ms_xxxxxyzz + (M_xxxxxyzz + M_xxxxxyz*z + M_xxxxxzz*y + M_xxxxyzz*x + M_xxxyzz*v32 + &
      v170*v501 + v175*v350 + v226*v301 + v27*v3*v622 + v27*v617 + v296 &
      *v74 + v297*v56 + v299*v56 + v300*v56 + v32*v344 + v32*v345 + v32 &
      *v347 + v477*z + v478*z + v479*z + v480*y + v500*v87 + v81*(v218 &
      + v624))
    Ms_xxxxyyzz = Ms_xxxxyyzz + (0.0104166666666667d0*(12.0d0*v117*v655 + v27*v672*v80 + 4.0d0*v31*(v523 &
      + v696)) + M_xxxxyyz*z + M_xxxxyyzz + M_xxxxyzz*y + M_xxxyyzz*x + &
      M_xxyyzz*v32 + M_xxzz*v206 + v112*v206 + v117*v634 + v159*v615 + &
      v20*v633 + v226*v96 + v253*v78 + v27*v629 + v307*v56 + v308*v56 + &
      v309*v56 + v32*v368 + v32*v369 + v32*v371 + v324*v43 + v325*v43 + &
      v326*v43 + v474*(v251 + v252 + v521 + v522) + v490*z + v491*z + &
      v492*z + v498*y + v524*v613 + v81*(v635 + v704))
    Ms_xxxyyyzz = Ms_xxxyyyzz + (0.0138888888888889d0*(v31*v64*v690) + M_xxx*v408 + M_xxxyyyz*z + &
      M_xxxyyyzz + M_xxxyyzz*y + M_xxyyyzz*x + M_xy*v547 + M_xyyy*v226 &
      + M_xyyyzz*v32 + M_xyzz*v206 + M_xzz*v360 + M_yyy*v350 + M_yyyzz* &
      v81 + M_yzz*v343 + v120*v226 + v123*v197 + v123*v199 + v123*v200 &
      + v131*v206 + v159*v621 + v20*v642 + v253*v82 + v26*v511 + v27* &
      v637 + v275*v81 + v277*v81 + v278*v81 + v28*v408 + v32*v402 + v32 &
      *v403 + v32*v405 + v328*v56 + v329*v56 + v330*v56 + v334*v644 + &
      v343*v72 + v344*v43 + v346*v43 + v348*v43 + v350*v62 + v360*v59 + &
      v512*z + v513*z + v514*z + v518*y + v64*v643)
    Ms_xxyyyyzz = Ms_xxyyyyzz + (0.0104166666666667d0*(v442*v659 + 4.0d0*v64*(M_y*v117 + v217 + v219 + &
      v222 + v223)) + M_xxyyyy*v56 + M_xxyyyyz*z + M_xxyyyyzz + &
      M_xxyyyzz*y + M_xxyyzz*v43 + M_xyyyyzz*x + M_yyyy*v226 + M_yyyyzz &
      *v32 + M_yyzz*v206 + v100*v378 + v123*(M_xxyzz + v216 + v220 + &
      v221) + v144*v226 + v154*v206 + v159*v634 + v253*v94 + v32*v438 + &
      v32*v439 + v32*v440 + v356*v56 + v357*v56 + v358*v56 + v368*v43 + &
      v370*v43 + v372*v43 + v509*v548 + v535*(v224 + v225 + v545 + v546 &
      ) + v536*z + v537*z + v538*z + v543*y)
    Ms_xyyyyyzz = Ms_xyyyyyzz + (M_xyyyyyzz + M_xyyyyy*v56 + M_xyyyyyz*z + M_xyyyyzz*y + M_xyyyzz*v43 + &
      M_yyyyyzz*x + v1*v27*v595 + v10*v572 + v119*v253 + v123*(M_xyyzz &
      + v244 + v246 + v248) + v235*v575 + v389*v56 + v391*v56 + v392* &
      v56 + v393*v61 + v402*v43 + v404*v43 + v406*v43 + v408*v45 + v566 &
      *z + v567*z + v568*z + v570*y)
    Ms_yyyyyyzz = Ms_yyyyyyzz + (0.000694444444444444d0*(v432*v596) + M_yyy*v408 + M_yyyy*v253 + M_yyyyyy &
      *v56 + M_yyyyyyz*z + M_yyyyyyzz + M_yyyyyzz*y + M_yyyyzz*v43 + &
      v123*v276 + v157*v509 + v235*v598 + v26*v565 + v27*v649 + v393* &
      v443 + v43*v438 + v431*v56 + v593*z)
    h           = v20 + v27 + v8
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
    v77         = c3
    v671        = 0.0833333333333333d0*v77
    v680        = 0.0277777777777778d0*v77
    v143        = 0.166666666666667d0*v77
    v285        = v671
    v385        = v671*v8
    v415        = v675*v77
    v447        = v680
    v528        = v31*v680
    v579        = v684*v77
    v600        = 0.00694444444444444d0*v77
    v646        = 0.0138888888888889d0*v77
    Ms_zzz      = Ms_zzz + (v76 + M_z*v56 + v30*v77)
    Ms_xzzz     = Ms_xzzz + (v142 + v1*v143 + v15*v56)
    Ms_yzzz     = Ms_yzzz + (v164 + v143*v3 + v22*v56)
    Ms_xxzzz    = Ms_xxzzz + (v228 + v229 + v230 + M_xxz*v56 + M_z*v226 + M_zzz*v32 + v143*v6 + v205* &
      v77 + v32*v75 + v38*v56)
    Ms_xyzzz    = Ms_xyzzz + (v13*v143 + v137*z + v262*v56 + v257 + v258 + v259 + v260)
    Ms_yyzzz    = Ms_yyzzz + (v282 + v283 + v284 + M_yyz*v56 + M_z*v253 + M_zzz*v43 + v143*v19 + v285* &
      v286 + v43*v75 + v56*v65)
    Ms_xxxzzz   = Ms_xxxzzz + (M_xxxzzz + v351 + v352 + v353 + M_xz*v226 + M_xzzz*v32 + M_zzz*v81 + &
      v140*v32 + v143*v28 + v27*v342 + v331*v77 + v333*v77 + v354*v355 &
      + v56*v88 + v75*v81)
    Ms_xxyzzz   = Ms_xxyzzz + (M_xxyzzz + v379 + v380 + v381 + v382 + v383 + v384 + M_xxyz*v56 + M_yzzz &
      *v32 + v106*v56 + v107*v56 + v109*v56 + v143*v37 + v160*v32 + &
      v162*v32 + v163*v32 + v22*v226 + v222*z + v3*v385)
    Ms_xyyzzz   = Ms_xyyzzz + (M_xyyzzz + v409 + v410 + v411 + v412 + v413 + v414 + M_xyyz*v56 + M_xzzz &
      *v43 + v1*v415 + v127*v56 + v128*v56 + v130*v56 + v138*v43 + v140 &
      *v43 + v141*v43 + v143*v48 + v15*v253 + v250*z)
    Ms_yyyzzz   = Ms_yyyzzz + (M_yyyzzz + v444 + v445 + v446 + M_yyy*v143 + M_yyyz*v56 + M_yz*v253 + &
      M_yzzz*v43 + M_zzz*v123 + v123*v75 + v143*v62 + v146*v56 + v162* &
      v43 + v280*v447 + v448*v449)
    Ms_xxxxzzz  = Ms_xxxxzzz + (M_xxxxzzz + v502 + M_xxxxzz*z + M_xxz*v226 + M_xxzzz*v32 + M_xzzz*v81 + &
      M_z*v500 + v140*v81 + v143*v78 + v170*v76 + v178*v56 + v229*v32 + &
      v27*v493 + v313*v447 + v325*z + v355*(v38 + v40) + v485*v77 + &
      v487*v77)
    Ms_xxxyzzz  = Ms_xxxyzzz + (M_xxxyzzz + v525 + v526 + v527 + M_xxxyzz*z + M_xyzzz*v32 + M_yzzz*v81 + &
      v143*v82 + v143*v84 + v143*v85 + v160*v81 + v162*v81 + v163*v81 + &
      v189*v56 + v191*v56 + v193*v56 + v194*v226 + v254*v32 + v258*v32 &
      + v259*v32 + v27*v515 + v3*v528 + v345*z + v346*z + v349*z + v355 &
      *(v195 + v261) + v506*v77)
    Ms_xxyyzzz  = Ms_xxyyzzz + (M_xxyyzzz + v549 + v550 + v551 + M_xxyyz*v56 + M_xxyyzz*z + M_xxzzz*v43 &
      + M_yyzzz*v32 + M_z*v547 + M_zzz*v206 + v102*v654*v77 + v143*v98 &
      + v206*v75 + v211*v56 + v212*v56 + v213*v56 + v214*v374 + v215* &
      v374 + v227*v43 + v229*v43 + v230*v43 + v281*v32 + v283*v32 + &
      v284*v32 + v285*v554 + v369*z + v370*z + v373*z + v374*v552 + &
      v374*v553)
    Ms_xyyyzzz  = Ms_xyyyzzz + (M_xyyyzzz + v576 + v577 + v578 + M_xyyy*v143 + M_xyyyz*v56 + M_xyyyzz*z &
      + M_xyzzz*v43 + M_xzzz*v123 + v1*v579 + v118*v143 + v120*v143 + &
      v121*v143 + v123*v138 + v123*v140 + v123*v141 + v237*v56 + v239* &
      v56 + v241*v56 + v242*v253 + v255*v43 + v258*v43 + v260*v43 + &
      v403*z + v404*z + v407*z + v449*(v51 + v52 + v55))
    Ms_yyyyzzz  = Ms_yyyyzzz + (M_yyyyzzz + v599 + M_y*v579 + M_yyyy*v143 + M_yyyyz*v56 + M_yyyyzz*z + &
      M_yyz*v253 + M_yyzzz*v43 + M_yzzz*v123 + M_z*v572 + v123*v162 + &
      v143*v144 + v235*v76 + v272*v56 + v283*v43 + v439*z + v442*v600 + &
      v449*(v65 + v67))
    Ms_xxxxxzzz = Ms_xxxxxzzz + (M_xxxxxzzz + M_xxxxxzz*z + M_xxxxzzz*x + M_xxxzzz*v32 + M_xxzzz*v81 + &
      M_xz*v500 + v117*v625 + v143*v167 + v170*(M_xzzz + v140) + v229* &
      v81 + v27*v623 + v296*v76 + v304*v56 + v32*v351 + v355*(v88 + v90 &
      ) + v447*v620 + v473*v600 + v480*z + v616*v77 + v618*v77 + v622* &
      v626)
    Ms_xxxxyzzz = Ms_xxxxyzzz + (M_xxxxyzzz + M_xxxxyzz*z + M_xxxxzzz*y + M_xxxyzzz*x + M_xxyzzz*v32 + &
      M_xyzzz*v81 + v143*v171 + v143*v173 + v143*v174 + v164*v170 + v22 &
      *v500 + v226*v322 + v254*v81 + v258*v81 + v259*v81 + v27*v631 + &
      v3*v600*v80 + v317*v56 + v319*v56 + v32*v379 + v32*v380 + v32* &
      v382 + v321*v56 + v355*(v105 + v559) + v497*z + v498*z + v499*z + &
      v502*y + v528*v87 + v628*v77)
    Ms_xxxyyzzz = Ms_xxxyyzzz + (M_xxxyyzzz + M_xxx*v415 + M_xxxyyzz*z + M_xxxyzzz*y + M_xxyyzzz*x + &
      M_xyy*v385 + M_xyyz*v226 + M_xyyzzz*v32 + M_xz*v547 + M_xzzz*v206 &
      + M_yyz*v350 + M_yyzzz*v81 + M_zzz*v343 + v127*v226 + v140*v206 + &
      v143*v181 + v143*v183 + v143*v184 + v159*v625 + v19*v528 + v20* &
      v645 + v253*v88 + v27*v640 + v28*v415 + v281*v81 + v283*v81 + &
      v284*v81 + v31*v646*v672 + v32*v409 + v32*v410 + v32*v412 + v337* &
      v56 + v338*v56 + v341*v56 + v343*v75 + v350*v65 + v351*v43 + v352 &
      *v43 + v353*v43 + v354*v644 + v385*v46 + v517*z + v518*z + v519*z &
      + v526*y + v636*v77)
    Ms_xxyyyzzz = Ms_xxyyyzzz + (M_xxyyyzzz + M_xxy*v415 + M_xxyyy*v143 + M_xxyyyz*v56 + M_xxyyyzz*z + &
      M_xxyyzzz*y + M_xxyz*v253 + M_xxyzzz*v43 + M_xxz*v408 + M_xxzzz* &
      v123 + M_xyyyzzz*x + M_yyy*v385 + M_yyyz*v226 + M_yyyzzz*v32 + &
      M_yz*v547 + M_yzzz*v206 + M_zzz*v360 + v107*v253 + v123*v227 + &
      v123*v229 + v123*v230 + v143*v201 + v143*v203 + v143*v204 + v146* &
      v226 + v162*v206 + v32*v444 + v32*v445 + v32*v446 + v33*v415 + &
      v360*v75 + v363*v56 + v364*v56 + v367*v56 + v379*v43 + v38*v408 + &
      v381*v43 + v383*v43 + v385*v62 + v448*v644 + v542*z + v543*z + &
      v544*z + v550*y + v579*v6 + v646*v670*v8)
    Ms_xyyyyzzz = Ms_xyyyyzzz + (M_xyyyyzzz + M_xyyyy*v143 + M_xyyyyz*v56 + M_xyyyyzz*z + M_xyyyzzz*y + &
      M_xyyzzz*v43 + M_xyzzz*v123 + M_yyyyzzz*x + v1*v145*v600 + v10* &
      v579 + v123*v255 + v123*v258 + v123*v260 + v142*v235 + v143*v231 &
      + v143*v233 + v143*v234 + v15*v572 + v253*v400 + v395*v56 + v397* &
      v56 + v399*v56 + v409*v43 + v411*v43 + v413*v43 + v449*(v126 + &
      v584) + v569*z + v570*z + v571*z + v577*y)
    Ms_yyyyyzzz = Ms_yyyyyzzz + (M_yyyyyzzz + M_yy*v579 + M_yyyyy*v143 + M_yyyyyz*v56 + M_yyyyyzz*z + &
      M_yyyyzzz*y + M_yyyz*v253 + M_yyyzzz*v43 + M_yyzzz*v123 + M_yz* &
      v572 + v123*v283 + v143*v268 + v235*(M_yzzz + v162) + v269*v294* &
      v77 + v393*v76 + v43*v444 + v435*v56 + v449*(v146 + v148) + v594* &
      z + v595*v626 + v597*v600)
    c4          = c2*c2
    v166        = c4
    v681        = 0.0208333333333333d0*v166
    v691        = 0.00694444444444444d0*v166
    v267        = 0.0416666666666667d0*v166
    v453        = v681
    v558        = v681*v8
    v583        = v20*v681
    v602        = v691
    v647        = M_z*v691
    Ms_zzzz     = Ms_zzzz + (M_zzzz + v165 + M_z*v143 + M_zz*v56 + v166*v79)
    Ms_xzzzz    = Ms_xzzzz + (v264 + v265 + v266 + v1*v267 + v143*v15 + v56*v58)
    Ms_yzzzz    = Ms_yzzzz + (v288 + v289 + v290 + v143*v22 + v267*v3 + v56*v71)
    Ms_xxzzzz   = Ms_xxzzzz + (M_xxzzzz + v386 + v387 + v388 + M_xxzz*v56 + M_z*v385 + M_zzzz*v32 + &
      v110*v56 + v116*v374 + v143*v39 + v165*v32 + v166*v359 + v267*v6)
    Ms_xyzzzz   = Ms_xyzzzz + (v419 + v420 + v421 + v422 + v13*v267 + v143*v262 + v256*z + v425*v56)
    Ms_yyzzzz   = Ms_yyzzzz + (M_yyzzzz + v450 + v451 + v452 + M_yyzz*v56 + M_z*v415 + M_zzzz*v43 + &
      v143*v66 + v152*v56 + v158*v374 + v165*v43 + v19*v267 + v286*v453)
    Ms_xxxzzzz  = Ms_xxxzzzz + (M_xxxzzzz + v529 + M_xxxzzz*z + M_xzz*v226 + M_xzzzz*v32 + M_z*v528 + &
      M_zzzz*v81 + v143*v88 + v165*v81 + v166*v508 + v199*v56 + v265* &
      v32 + v267*v29 + v27*v520 + v352*z + v355*(v57 + v59) + v453*v510 &
      + v516*v77)
    Ms_xxyzzzz  = Ms_xxyzzzz + (M_xxyzzzz + v555 + v556 + v557 + M_xxyzz*v56 + M_xxyzzz*z + M_yzzzz*v32 &
      + v143*v560 + v219*v56 + v22*v385 + v220*v56 + v222*v56 + v226* &
      v71 + v267*v37 + v287*v32 + v289*v32 + v290*v32 + v3*v558 + v380* &
      z + v381*z + v384*z)
    Ms_xyyzzzz  = Ms_xyyzzzz + (M_xyyzzzz + v580 + v581 + v582 + M_xyyzz*v56 + M_xyyzzz*z + M_xzzzz*v43 &
      + v1*v583 + v143*v585 + v15*v415 + v247*v56 + v248*v56 + v250*v56 &
      + v253*v58 + v263*v43 + v265*v43 + v266*v43 + v267*v48 + v410*z + &
      v411*z + v414*z)
    Ms_yyyzzzz  = Ms_yyyzzzz + (M_yyyzzzz + v601 + M_yyyz*v143 + M_yyyzz*v56 + M_yyyzzz*z + M_yzz*v253 + &
      M_yzzzz*v43 + M_z*v579 + M_zzzz*v123 + v123*v165 + v143*v146 + &
      v267*v63 + v277*v56 + v280*v602 + v289*v43 + v445*z + v449*(v70 + &
      v72) + v453*v603)
    Ms_xxxxzzzz = Ms_xxxxzzzz + (0.0208333333333333d0*(v117*(v657 + v658)) + M_xxxxzzz*z + M_xxxxzzzz + &
      M_xxxzzzz*x + M_xxzz*v226 + M_xxzzzz*v32 + M_xz*v528 + M_xzzzz* &
      v81 + M_zzzz*v170 + v143*v178 + v165*v170 + v166*v627 + v166*v630 &
      + v265*v81 + v267*v78 + v27*v633 + v31*v354*v600 + v32*v386 + &
      v325*v56 + v355*(v110 + v112) + v502*z + v632*v77)
    Ms_xxxyzzzz = Ms_xxxyzzzz + (M_xxxyzzzz + M_xxxyzzz*z + M_xxxzzzz*y + M_xxyzzzz*x + M_xyzzzz*v32 + &
      M_yzzzz*v81 + v143*v189 + v143*v191 + v143*v193 + v22*v528 + v226 &
      *v423 + v267*v86 + v27*v642 + v287*v81 + v289*v81 + v290*v81 + v3 &
      *v31*v602 + v32*v416 + v32*v420 + v32*v421 + v345*v56 + v346*v56 &
      + v349*v56 + v355*(v133 + v424) + v525*z + v526*z + v527*z + v529 &
      *y + v558*v87 + v641*v77)
    Ms_xxyyzzzz = Ms_xxyyzzzz + (0.0104166666666667d0*(M_0*v102*v166 + 4.0d0*v77*(M_z*v102 + v210)) + &
      M_xxyyzz*v56 + M_xxyyzzz*z + M_xxyyzzzz + M_xxyzzzz*y + M_xxzz* &
      v253 + M_xxzzzz*v43 + M_xyyzzzz*x + M_yyzz*v226 + M_yyzzzz*v32 + &
      M_zzzz*v206 + v110*v253 + v116*v378 + v143*(v650 + v694) + v152* &
      v226 + v165*v206 + v285*(v214 + v215 + v552 + v553) + v32*v450 + &
      v32*v451 + v32*v452 + v369*v56 + v370*v56 + v373*v56 + v386*v43 + &
      v387*v43 + v388*v43 + v453*v554 + v549*z + v550*z + v551*z + v556 &
      *y)
    Ms_xyyyzzzz = Ms_xyyyzzzz + (M_xyyyzzzz + M_xyyyz*v143 + M_xyyyzz*v56 + M_xyyyzzz*z + M_xyyzzzz*y + &
      M_xyzzzz*v43 + M_xzzzz*v123 + M_yyyzzzz*x + v1*v602*v64 + v10* &
      v583 + v122*v267 + v123*v263 + v123*v265 + v123*v266 + v143*v237 &
      + v143*v239 + v143*v241 + v15*v579 + v253*v573 + v403*v56 + v404* &
      v56 + v407*v56 + v417*v43 + v420*v43 + v422*v43 + v449*(v134 + &
      v137 + v574) + v576*z + v577*z + v578*z + v581*y)
    Ms_yyyyzzzz = Ms_yyyyzzzz + (0.00173611111111111d0*(12.0d0*v159*(v660 + v661) + v166*v442) + M_yyyy* &
      v267 + M_yyyyz*v143 + M_yyyyzz*v56 + M_yyyyzzz*z + M_yyyyzzzz + &
      M_yyyzzzz*y + M_yyzz*v253 + M_yyzzzz*v43 + M_yz*v579 + M_yzzzz* &
      v123 + M_zzzz*v235 + v123*v289 + v143*v272 + v144*v267 + v165* &
      v235 + v43*v450 + v439*v56 + v448*v600*v64 + v449*(v152 + v154) + &
      v599*z)
    c5          = c2*c3
    v292        = c5
    v692        = 0.00416666666666667d0*v292
    v430        = 0.00833333333333333d0*v292
    v605        = v692
    v651        = M_z*v692
    Ms_zzzzz    = Ms_zzzzz + (M_zzzzz + v291 + M_z*v267 + M_zz*v143 + M_zzz*v56 + v168*v292)
    Ms_xzzzzz   = Ms_xzzzzz + (v427 + v428 + v429 + v1*v430 + v139*v56 + v143*v58 + v15*v267)
    Ms_yzzzzz   = Ms_yzzzzz + (v455 + v456 + v457 + v143*v71 + v161*v56 + v22*v267 + v3*v430)
    Ms_xxzzzzz  = Ms_xxzzzzz + (M_xxzzzzz + v561 + M_xxzzz*v56 + M_xxzzzz*z + M_z*v558 + M_zzz*v226 + &
      M_zzzzz*v32 + v111*v143 + v116*v285 + v227*v56 + v267*v39 + v291* &
      v32 + v292*v533 + v387*z + v430*v6)
    Ms_xyzzzzz  = Ms_xyzzzzz + (M_xyzzzzz + v586 + v587 + v588 + M_xyzzzz*z + v13*v430 + v143*v425 + &
      v257*v56 + v262*v267 + v416*z + v417*z + v418*z)
    Ms_yyzzzzz  = Ms_yyzzzzz + (M_yyzzzzz + v604 + M_yyzzz*v56 + M_yyzzzz*z + M_z*v583 + M_zzz*v253 + &
      M_zzzzz*v43 + v143*v153 + v158*v285 + v19*v430 + v267*v66 + v281* &
      v56 + v286*v605 + v291*v43 + v451*z)
    Ms_xxxzzzzz = Ms_xxxzzzzz + (M_xxxzzzzz + M_xxxzzzz*z + M_xxzzzzz*x + M_xz*v558 + M_xzzz*v226 + &
      M_xzzzzz*v32 + M_zz*v528 + M_zzzzz*v81 + v143*v199 + v267*v89 + &
      v27*v645 + v29*v430 + v291*v81 + v292*v638 + v31*v647 + v32*v428 &
      + v352*v56 + v355*(v138 + v140) + v510*v605 + v529*z + v643*v77)
    Ms_xxyzzzzz = Ms_xxyzzzzz + (M_xxyzzzzz + M_xxyzzz*v56 + M_xxyzzzz*z + M_xxzzzzz*y + M_xyzzzzz*x + &
      M_yzzzzz*v32 + v143*(v624 + v695) + v161*v226 + v22*v558 + v267* &
      v560 + v3*v605*v8 + v32*v454 + v32*v456 + v32*v457 + v37*v430 + &
      v380*v56 + v381*v56 + v384*v56 + v385*v71 + v555*z + v556*z + &
      v557*z + v561*y)
    Ms_xyyzzzzz = Ms_xyyzzzzz + (M_xyyzzzzz + M_xyyzzz*v56 + M_xyyzzzz*z + M_xyzzzzz*y + M_xzzzzz*v43 + &
      M_yyzzzzz*x + v1*v20*v605 + v139*v253 + v143*(v635 + v698) + v15* &
      v583 + v267*v585 + v410*v56 + v411*v56 + v414*v56 + v415*v58 + &
      v426*v43 + v428*v43 + v429*v43 + v430*v48 + v580*z + v581*z + &
      v582*z + v587*y)
    Ms_yyyzzzzz = Ms_yyyzzzzz + (M_yyyzzzzz + M_yyyzz*v143 + M_yyyzzz*v56 + M_yyyzzzz*z + M_yyzzzzz*y + &
      M_yz*v583 + M_yzzz*v253 + M_yzzzzz*v43 + M_zz*v579 + M_zzzzz*v123 &
      + v123*v291 + v143*v277 + v147*v267 + v292*v294*v64 + v43*v456 + &
      v430*v63 + v445*v56 + v449*(v160 + v162) + v601*z + v603*v605 + &
      v64*v647)
    c6          = c3*c3
    v459        = c6
    v590        = 0.00138888888888889d0*v459
    Ms_zzzzzz   = Ms_zzzzzz + (M_zzzzzz + v458 + M_z*v430 + M_zz*v267 + M_zzz*v143 + M_zzzz*v56 + v294* &
      v459)
    Ms_xzzzzzz  = Ms_xzzzzzz + (M_xzzzzzz + v589 + M_xzzzzz*z + v1*v590 + v139*v143 + v15*v430 + v264* &
      v56 + v267*v58 + v426*z)
    Ms_yzzzzzz  = Ms_yzzzzzz + (M_yzzzzzz + v606 + M_yzzzzz*z + v143*v161 + v22*v430 + v267*v71 + v288* &
      v56 + v3*v590 + v454*z)
    Ms_xxzzzzzz = Ms_xxzzzzzz + (M_xxzzzzzz + M_xxzzzz*v56 + M_xxzzzzz*z + M_xzzzzzz*x + M_zzz*v385 + &
      M_zzzz*v226 + M_zzzzzz*v32 + v111*v267 + v116*v453 + v143*v228 + &
      v32*v458 + v387*v56 + v39*v430 + v459*v648 + v561*z + v590*v6 + &
      v651*v8)
    Ms_xyzzzzzz = Ms_xyzzzzzz + (M_xyzzzzzz + M_xyzzzzz*z + M_xzzzzzz*y + M_yzzzzzz*x + v13*v590 + v143* &
      v257 + v262*v430 + v267*v425 + v419*v56 + v586*z + v587*z + v588* &
      z + v589*y)
    Ms_yyzzzzzz = Ms_yyzzzzzz + (0.000694444444444444d0*(v286*v459) + M_yyzzzz*v56 + M_yyzzzzz*z + &
      M_yyzzzzzz + M_yzzzzzz*y + M_zzz*v415 + M_zzzz*v253 + M_zzzzzz* &
      v43 + v143*v282 + v153*v267 + v158*v453 + v19*v590 + v20*v651 + &
      v43*v458 + v430*v66 + v451*v56 + v604*z)
    c7          = c3*c4
    v607        = c7
    v653        = 0.000198412698412698d0*v607
    Ms_zzzzzzz  = Ms_zzzzzzz + (M_zzzzzzz + M_z*v590 + M_zz*v430 + M_zzz*v267 + M_zzzz*v143 + M_zzzzz* &
      v56 + M_zzzzzz*z + v461*v607)
    Ms_xzzzzzzz = Ms_xzzzzzzz + (M_xzzzzzzz + M_xzzzzzz*z + M_zzzzzzz*x + v1*v653 + v139*v267 + v143*v264 &
      + v15*v590 + v427*v56 + v430*v58 + v589*z)
    Ms_yzzzzzzz = Ms_yzzzzzzz + (M_yzzzzzzz + M_yzzzzzz*z + M_zzzzzzz*y + v143*v288 + v161*v267 + v22* &
      v590 + v3*v653 + v430*v71 + v455*v56 + v606*z)
    c8          = c4*c4
    Ms_zzzzzzzz = Ms_zzzzzzzz + (M_zzzzzzzz + M_z*v653 + M_zz*v590 + M_zzz*v430 + M_zzzz*v267 + M_zzzzz* &
      v143 + M_zzzzzz*v56 + M_zzzzzzz*z + c8*v608)
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
#undef  M_xxyyz             
#undef  Ms_xxyyz            
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
#undef  Ms_xxxxxyz          
#undef  M_xxxxxyz           
#undef  Ms_xxxxxzz          
#undef  M_xxxxxzz           
#undef  Ms_xxxxyyy          
#undef  M_xxxxyyy           
#undef  Ms_xxxxyyz          
#undef  M_xxxxyyz           
#undef  M_xxxxyzz           
#undef  Ms_xxxxyzz          
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
#undef  Ms_xxxxyyyz         
#undef  M_xxxxyyyz          
#undef  M_xxxxyyzz          
#undef  Ms_xxxxyyzz         
#undef  Ms_xxxxyzzz         
#undef  M_xxxxyzzz          
#undef  Ms_xxxxzzzz         
#undef  M_xxxxzzzz          
#undef  M_xxxyyyyy          
#undef  Ms_xxxyyyyy         
#undef  M_xxxyyyyz          
#undef  Ms_xxxyyyyz         
#undef  Ms_xxxyyyzz         
#undef  M_xxxyyyzz          
#undef  M_xxxyyzzz          
#undef  Ms_xxxyyzzz         
#undef  Ms_xxxyzzzz         
#undef  M_xxxyzzzz          
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
#undef  M_xyyyyyyy          
#undef  Ms_xyyyyyyy         
#undef  M_xyyyyyyz          
#undef  Ms_xyyyyyyz         
#undef  M_xyyyyyzz          
#undef  Ms_xyyyyyzz         
#undef  M_xyyyyzzz          
#undef  Ms_xyyyyzzz         
#undef  M_xyyyzzzz          
#undef  Ms_xyyyzzzz         
#undef  M_xyyzzzzz          
#undef  Ms_xyyzzzzz         
#undef  Ms_xyzzzzzz         
#undef  M_xyzzzzzz          
#undef  M_xzzzzzzz          
#undef  Ms_xzzzzzzz         
#undef  Ms_yyyyyyyy         
#undef  M_yyyyyyyy          
#undef  Ms_yyyyyyyz         
#undef  M_yyyyyyyz          
#undef  M_yyyyyyzz          
#undef  Ms_yyyyyyzz         
#undef  Ms_yyyyyzzz         
#undef  M_yyyyyzzz          
#undef  Ms_yyyyzzzz         
#undef  M_yyyyzzzz          
#undef  M_yyyzzzzz          
#undef  Ms_yyyzzzzz         
#undef  Ms_yyzzzzzz         
#undef  M_yyzzzzzz          
#undef  M_yzzzzzzz          
#undef  Ms_yzzzzzzz         
#undef  M_zzzzzzzz          
#undef  Ms_zzzzzzzz         
    end subroutine mom_es_M2M_add
    
! OPS  2123*ADD + 2*DIV + 2437*MUL + 119*NEG + POW + 52*SUB = 4734  (6200 before optimization)
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
                v155, v156, v16, v17, v18, v19, v2, v20, v21, v22, v23, v24,&
                v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
                v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46,&
                v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57,&
                v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68,&
                v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8,&
                v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90,&
                v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_0, D_x,&
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
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz,&
                D_xxxxxxxx, D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz,&
                D_xxxxxxzz, D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz,&
                D_xxxxyyyy, D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz,&
                D_xxxyyyyy, D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz,&
                D_xxxzzzzz, D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz,&
                D_xxyyzzzz, D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz,&
                D_xyyyyyzz, D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz,&
                D_xzzzzzzz, D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz,&
                D_yyyyzzzz, D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz
#define y                    r(2)
#define L_0                  L(0)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
#define L_x                  L(1)
#define M_x                  M(1)
#define M_y                  M(2)
#define L_y                  L(2)
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
#define L_xyy                L(12)
#define M_xxz                M(12)
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
#define L_xxyyy              L(30)
#define M_yyyy               M(30)
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
#define M_xyyyyz             M(72)
#define L_xxxxyyyz           L(72)
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
    v152       = y*z
    v153       = x*y
    v138       = 15.0d0*v152
    v140       = v153
    v142       = v152
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v123       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v123
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
    v124       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v125       = v1*v19
    v27        = v124
    v29        = 7.0d0*v1
    v59        = v125
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v126       = v0*v31
    v65        = v126
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
    v127       = 3.0d0*h
    v128       = h*v0
    v129       = h*v1
    v130       = h*v19
    v132       = v1*v128
    v134       = h*v31
    v4         = -h
    v12        = v127
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v131       = v0*v17
    v133       = v1*v17
    v18        = 3.0d0*v17
    v20        = v128
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v129
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 + 630.0d0*v128 - 945.0d0*v19
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 + 630.0d0*v129 - 945.0d0*v31
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v130
    v51        = v131
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v132
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v133
    v67        = v33 + v53 + v66
    v69        = v134
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v148       = -v85
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
    v106       = v124*v17
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v149       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v113       = -v108
    v114       = -1430.0d0*v57
    v150       = v113 + v114
    v116       = -1351350.0d0*v132
    v151       = v111 + v116
    v117       = v1*v46
    v118       = v128*v31
    v120       = -(3.0d0*v46 + 286.0d0*v57)
    v121       = v17*v31
    v122       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
    u2         = 1.0/h
    u          = sqrt(u2)
    D_0        = u
    u3         = u*u2
    v2         = u3
    D_x        = -v2*x
    D_y        = -v2*y
    D_z        = -v2*z
    u4         = u2*u2
    u5         = u2*u3
    v3         = u5
    v135       = 3.0d0*v3
    v6         = v135*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v135*v142
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v136       = 3.0d0*v8
    v9         = v8*x
    v11        = v136*(h - v10)
    D_xxx      = -3.0d0*v9*(v123 - v127)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    D_xyz      = -v138*v9
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = v136*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v137       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v137*y
    v26        = v137*z
    v28        = v138*v15
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    D_xyyy     = v22*v30
    D_xyyz     = v26*(v29 + v4)
    D_xyzz     = -(D_xxxy + D_xyyy)
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v154       = v34*z
    v139       = 15.0d0*v34
    v35        = v139*x
    v39        = v154
    v41        = 315.0d0*v140*v154
    v42        = v139*y
    D_xxxxx    = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy    = v34*v38*y
    D_xxxxz    = v38*v39
    D_xxxyy    = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz    = v41*(h - v5)
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    D_xxyyy    = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz    = v39*(v36 - 945.0d0*v124 + 105.0d0*(v128 + v129))
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    D_xyyyy    = v34*v43*x
    D_xyyyz    = v41*(h - v7)
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
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
    v155       = 315.0d0*v44
    v141       = v155*x
    v45        = 45.0d0*v44
    v52        = v141*y
    v56        = v141*z
    v60        = v142*v155
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 - 21.0d0*v130 + v17*v29 + 14.0d0*v51 + 231.0d0*v59)
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy   = 945.0d0*v140*v44*(11.0d0*v27 + v17 + v61 + v62)
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy   = v45*(v58 - 21.0d0*v134 + v17*v24 + 14.0d0*v64 + 231.0d0*v65)
    D_xxyyyz   = v60*(-9.0d0*v20 + v62 + v63)
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy   = v52*v67
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
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
    v156       = 945.0d0*v70
    v143       = 315.0d0*v70
    v71        = v143*x
    v75        = v143*y
    v77        = v143*z
    v81        = v142*v156*x
    v83        = v156
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy  = v75*v76
    D_xxxxxxz  = v76*v77
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy  = -v83*y*(v148 + v1*v18 + v1*v82 - v84)
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy  = -v83*x*(v148 + v0*v18 + v0*v90 - v89)
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy  = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy  = v71*v94
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz  = v77*v94
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v144       = v153*v95
    v145       = v95*z
    v146       = v145*x
    v147       = v145*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v144
    v105       = 2835.0d0*v146
    v110       = v147
    v112       = 945.0d0*v144
    v115       = v146
    v119       = 2835.0d0*v147
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = L_xxxxxxxx + (D_xxxxxxxx*M_0)
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = L_xxxxxxxy + (D_xxxxxxxy*M_0)
    D_xxxxxxxz = v104*v105
    L_xxxxxxx  = L_xxxxxxx + (D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxy*M_y + D_xxxxxxxz*M_z)
    L_xxxxxxxz = L_xxxxxxxz + (D_xxxxxxxz*M_0)
    D_xxxxxxyy = -v96*(v149 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    L_xxxxxxyy = L_xxxxxxyy + (D_xxxxxxyy*M_0)
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v131 + 155925.0d0*(-13.0d0*v130 + 13.0d0*v49))
    L_xxxxxxy  = L_xxxxxxy + (D_xxxxxxxy*M_x + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyz*M_z)
    L_xxxxxxyz = L_xxxxxxyz + (D_xxxxxxyz*M_0)
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    L_xxxxxx   = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*M_xx + D_xxxxxxxy*M_xy + &
      D_xxxxxxxz*M_xz + D_xxxxxxy*M_y + D_xxxxxxyy*M_yy + D_xxxxxxyz* &
      M_yz + D_xxxxxxz*M_z + D_xxxxxxzz*M_zz)
    L_xxxxxxz  = L_xxxxxxz + (D_xxxxxxxz*M_x + D_xxxxxxyz*M_y + D_xxxxxxz*M_0 + D_xxxxxxzz*M_z)
    D_xxxxxyyy = v112*(v150 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    L_xxxxxyyy = L_xxxxxyyy + (D_xxxxxyyy*M_0)
    D_xxxxxyyz = v115*(v151 + 2027025.0d0*v125 - 135135.0d0*v130 + 103950.0d0*v131 + &
      155925.0d0*v133)
    L_xxxxxyy  = L_xxxxxyy + (D_xxxxxxyy*M_x + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyz*M_z)
    L_xxxxxyyz = L_xxxxxyyz + (D_xxxxxyyz*M_0)
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    L_xxxxxy   = L_xxxxxy + (D_xxxxxxxy*M_xx + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyy*M_yy + D_xxxxxyyz*M_yz &
      + D_xxxxxyz*M_z + D_xxxxxyzz*M_zz)
    L_xxxxxyz  = L_xxxxxyz + (D_xxxxxxyz*M_x + D_xxxxxyyz*M_y + D_xxxxxyz*M_0 + D_xxxxxyzz*M_z)
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    L_xxxxx    = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxxx*M_xxx + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxz*M_xxz + D_xxxxxxy*M_xy + D_xxxxxxyy &
      *M_xyy + D_xxxxxxyz*M_xyz + D_xxxxxxz*M_xz + D_xxxxxxzz*M_xzz + &
      D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyyy*M_yyy + D_xxxxxyyz* &
      M_yyz + D_xxxxxyz*M_yz + D_xxxxxyzz*M_yzz + D_xxxxxz*M_z + &
      D_xxxxxzz*M_zz + D_xxxxxzzz*M_zzz)
    L_xxxxxz   = L_xxxxxz + (D_xxxxxxxz*M_xx + D_xxxxxxyz*M_xy + D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + &
      D_xxxxxyyz*M_yy + D_xxxxxyz*M_y + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 &
      + D_xxxxxzz*M_z + D_xxxxxzzz*M_zz)
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v117) - 858.0d0*(v1*v50 + v118))
    L_xxxxyyyy = L_xxxxyyyy + (D_xxxxyyyy*M_0)
    D_xxxxyyyz = v119*(v120 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    L_xxxxyyy  = L_xxxxyyy + (D_xxxxxyyy*M_x + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyz*M_z)
    L_xxxxyyyz = L_xxxxyyyz + (D_xxxxyyyz*M_0)
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    L_xxxxyy   = L_xxxxyy + (D_xxxxxxyy*M_xx + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyy*M_yy + D_xxxxyyyz*M_yz &
      + D_xxxxyyz*M_z + D_xxxxyyzz*M_zz)
    L_xxxxyyz  = L_xxxxyyz + (D_xxxxxyyz*M_x + D_xxxxyyyz*M_y + D_xxxxyyz*M_0 + D_xxxxyyzz*M_z)
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    L_xxxxy    = L_xxxxy + (D_xxxxxxxy*M_xxx + D_xxxxxxy*M_xx + D_xxxxxxyy*M_xxy + D_xxxxxxyz*M_xxz &
      + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyy*M_xyy + D_xxxxxyyz* &
      M_xyz + D_xxxxxyz*M_xz + D_xxxxxyzz*M_xzz + D_xxxxy*M_0 + &
      D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyyy*M_yyy + D_xxxxyyyz* &
      M_yyz + D_xxxxyyz*M_yz + D_xxxxyyzz*M_yzz + D_xxxxyz*M_z + &
      D_xxxxyzz*M_zz + D_xxxxyzzz*M_zzz)
    L_xxxxyz   = L_xxxxyz + (D_xxxxxxyz*M_xx + D_xxxxxyyz*M_xy + D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + &
      D_xxxxyyyz*M_yy + D_xxxxyyz*M_y + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 &
      + D_xxxxyzz*M_z + D_xxxxyzzz*M_zz)
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    L_xxxx     = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxxx* &
      M_xxxx + D_xxxxxxxy*M_xxxy + D_xxxxxxxz*M_xxxz + D_xxxxxxy*M_xxy &
      + D_xxxxxxyy*M_xxyy + D_xxxxxxyz*M_xxyz + D_xxxxxxz*M_xxz + &
      D_xxxxxxzz*M_xxzz + D_xxxxxy*M_xy + D_xxxxxyy*M_xyy + D_xxxxxyyy* &
      M_xyyy + D_xxxxxyyz*M_xyyz + D_xxxxxyz*M_xyz + D_xxxxxyzz*M_xyzz &
      + D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxxzzz*M_xzzz + D_xxxxy* &
      M_y + D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + D_xxxxyyyy*M_yyyy + &
      D_xxxxyyyz*M_yyyz + D_xxxxyyz*M_yyz + D_xxxxyyzz*M_yyzz + &
      D_xxxxyz*M_yz + D_xxxxyzz*M_yzz + D_xxxxyzzz*M_yzzz + D_xxxxz*M_z &
      + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz + D_xxxxzzzz*M_zzzz)
    L_xxxxz    = L_xxxxz + (D_xxxxxxxz*M_xxx + D_xxxxxxyz*M_xxy + D_xxxxxxz*M_xx + D_xxxxxxzz*M_xxz &
      + D_xxxxxyyz*M_xyy + D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxz &
      *M_x + D_xxxxxzz*M_xz + D_xxxxxzzz*M_xzz + D_xxxxyyyz*M_yyy + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyz*M_y + D_xxxxyzz*M_yz &
      + D_xxxxyzzz*M_yzz + D_xxxxz*M_0 + D_xxxxzz*M_z + D_xxxxzzz*M_zz &
      + D_xxxxzzzz*M_zzz)
    D_xxxyyyyy = v112*(v150 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    L_xxxyyyyy = L_xxxyyyyy + (D_xxxyyyyy*M_0)
    D_xxxyyyyz = v105*(v120 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    L_xxxyyyy  = L_xxxyyyy + (D_xxxxyyyy*M_x + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyz*M_z)
    L_xxxyyyyz = L_xxxyyyyz + (D_xxxyyyyz*M_0)
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    L_xxxyyy   = L_xxxyyy + (D_xxxxxyyy*M_xx + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyy*M_yy + D_xxxyyyyz*M_yz &
      + D_xxxyyyz*M_z + D_xxxyyyzz*M_zz)
    L_xxxyyyz  = L_xxxyyyz + (D_xxxxyyyz*M_x + D_xxxyyyyz*M_y + D_xxxyyyz*M_0 + D_xxxyyyzz*M_z)
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    L_xxxyy    = L_xxxyy + (D_xxxxxxyy*M_xxx + D_xxxxxyy*M_xx + D_xxxxxyyy*M_xxy + D_xxxxxyyz*M_xxz &
      + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyy*M_xyy + D_xxxxyyyz* &
      M_xyz + D_xxxxyyz*M_xz + D_xxxxyyzz*M_xzz + D_xxxyy*M_0 + &
      D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyyy*M_yyy + D_xxxyyyyz* &
      M_yyz + D_xxxyyyz*M_yz + D_xxxyyyzz*M_yzz + D_xxxyyz*M_z + &
      D_xxxyyzz*M_zz + D_xxxyyzzz*M_zzz)
    L_xxxyyz   = L_xxxyyz + (D_xxxxxyyz*M_xx + D_xxxxyyyz*M_xy + D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + &
      D_xxxyyyyz*M_yy + D_xxxyyyz*M_y + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 &
      + D_xxxyyzz*M_z + D_xxxyyzzz*M_zz)
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    L_xxxy     = L_xxxy + (D_xxxxxxxy*M_xxxx + D_xxxxxxy*M_xxx + D_xxxxxxyy*M_xxxy + D_xxxxxxyz* &
      M_xxxz + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + D_xxxxxyyy*M_xxyy + &
      D_xxxxxyyz*M_xxyz + D_xxxxxyz*M_xxz + D_xxxxxyzz*M_xxzz + D_xxxxy &
      *M_x + D_xxxxyy*M_xy + D_xxxxyyy*M_xyy + D_xxxxyyyy*M_xyyy + &
      D_xxxxyyyz*M_xyyz + D_xxxxyyz*M_xyz + D_xxxxyyzz*M_xyzz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxxyzzz*M_xzzz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyyy*M_yyy + D_xxxyyyyy* &
      M_yyyy + D_xxxyyyyz*M_yyyz + D_xxxyyyz*M_yyz + D_xxxyyyzz*M_yyzz &
      + D_xxxyyz*M_yz + D_xxxyyzz*M_yzz + D_xxxyyzzz*M_yzzz + D_xxxyz* &
      M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz + D_xxxyzzzz*M_zzzz)
    L_xxxyz    = L_xxxyz + (D_xxxxxxyz*M_xxx + D_xxxxxyyz*M_xxy + D_xxxxxyz*M_xx + D_xxxxxyzz*M_xxz &
      + D_xxxxyyyz*M_xyy + D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyz &
      *M_x + D_xxxxyzz*M_xz + D_xxxxyzzz*M_xzz + D_xxxyyyyz*M_yyy + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyz*M_y + D_xxxyyzz*M_yz &
      + D_xxxyyzzz*M_yzz + D_xxxyz*M_0 + D_xxxyzz*M_z + D_xxxyzzz*M_zz &
      + D_xxxyzzzz*M_zzz)
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    L_xxx      = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxxx*M_xxxxx + D_xxxxxxxy*M_xxxxy + D_xxxxxxxz* &
      M_xxxxz + D_xxxxxxy*M_xxxy + D_xxxxxxyy*M_xxxyy + D_xxxxxxyz* &
      M_xxxyz + D_xxxxxxz*M_xxxz + D_xxxxxxzz*M_xxxzz + D_xxxxxy*M_xxy &
      + D_xxxxxyy*M_xxyy + D_xxxxxyyy*M_xxyyy + D_xxxxxyyz*M_xxyyz + &
      D_xxxxxyz*M_xxyz + D_xxxxxyzz*M_xxyzz + D_xxxxxz*M_xxz + &
      D_xxxxxzz*M_xxzz + D_xxxxxzzz*M_xxzzz + D_xxxxy*M_xy + D_xxxxyy* &
      M_xyy + D_xxxxyyy*M_xyyy + D_xxxxyyyy*M_xyyyy + D_xxxxyyyz* &
      M_xyyyz + D_xxxxyyz*M_xyyz + D_xxxxyyzz*M_xyyzz + D_xxxxyz*M_xyz &
      + D_xxxxyzz*M_xyzz + D_xxxxyzzz*M_xyzzz + D_xxxxz*M_xz + D_xxxxzz &
      *M_xzz + D_xxxxzzz*M_xzzz + D_xxxxzzzz*M_xzzzz + D_xxxy*M_y + &
      D_xxxyy*M_yy + D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyyy* &
      M_yyyyy + D_xxxyyyyz*M_yyyyz + D_xxxyyyz*M_yyyz + D_xxxyyyzz* &
      M_yyyzz + D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + D_xxxyyzzz*M_yyzzz &
      + D_xxxyz*M_yz + D_xxxyzz*M_yzz + D_xxxyzzz*M_yzzz + D_xxxyzzzz* &
      M_yzzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz + D_xxxzzzz* &
      M_zzzz + D_xxxzzzzz*M_zzzzz)
    L_xxxz     = L_xxxz + (D_xxxxxxxz*M_xxxx + D_xxxxxxyz*M_xxxy + D_xxxxxxz*M_xxx + D_xxxxxxzz* &
      M_xxxz + D_xxxxxyyz*M_xxyy + D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz &
      + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + D_xxxxxzzz*M_xxzz + &
      D_xxxxyyyz*M_xyyy + D_xxxxyyz*M_xyy + D_xxxxyyzz*M_xyyz + &
      D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxyzzz*M_xyzz + D_xxxxz*M_x &
      + D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxxzzzz*M_xzzz + &
      D_xxxyyyyz*M_yyyy + D_xxxyyyz*M_yyy + D_xxxyyyzz*M_yyyz + &
      D_xxxyyz*M_yy + D_xxxyyzz*M_yyz + D_xxxyyzzz*M_yyzz + D_xxxyz*M_y &
      + D_xxxyzz*M_yz + D_xxxyzzz*M_yzz + D_xxxyzzzz*M_yzzz + D_xxxz* &
      M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz + D_xxxzzzzz* &
      M_zzzz)
    D_xxyyyyyy = -v96*(v149 + h*v92 + v0*v108 + 135.0d0*v117 - 495.0d0*v121 + 6435.0d0*( &
      -v0*v68 + v118))
    L_xxyyyyyy = L_xxyyyyyy + (D_xxyyyyyy*M_0)
    D_xxyyyyyz = v110*(v151 + 2027025.0d0*v126 + 155925.0d0*v131 + 103950.0d0*v133 - &
      135135.0d0*v134)
    L_xxyyyyy  = L_xxyyyyy + (D_xxxyyyyy*M_x + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyz*M_z)
    L_xxyyyyyz = L_xxyyyyyz + (D_xxyyyyyz*M_0)
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    L_xxyyyy   = L_xxyyyy + (D_xxxxyyyy*M_xx + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyy*M_yy + D_xxyyyyyz*M_yz &
      + D_xxyyyyz*M_z + D_xxyyyyzz*M_zz)
    L_xxyyyyz  = L_xxyyyyz + (D_xxxyyyyz*M_x + D_xxyyyyyz*M_y + D_xxyyyyz*M_0 + D_xxyyyyzz*M_z)
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    L_xxyyy    = L_xxyyy + (D_xxxxxyyy*M_xxx + D_xxxxyyy*M_xx + D_xxxxyyyy*M_xxy + D_xxxxyyyz*M_xxz &
      + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyy*M_xyy + D_xxxyyyyz* &
      M_xyz + D_xxxyyyz*M_xz + D_xxxyyyzz*M_xzz + D_xxyyy*M_0 + &
      D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyyy*M_yyy + D_xxyyyyyz* &
      M_yyz + D_xxyyyyz*M_yz + D_xxyyyyzz*M_yzz + D_xxyyyz*M_z + &
      D_xxyyyzz*M_zz + D_xxyyyzzz*M_zzz)
    L_xxyyyz   = L_xxyyyz + (D_xxxxyyyz*M_xx + D_xxxyyyyz*M_xy + D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + &
      D_xxyyyyyz*M_yy + D_xxyyyyz*M_y + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 &
      + D_xxyyyzz*M_z + D_xxyyyzzz*M_zz)
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    L_xxyy     = L_xxyy + (D_xxxxxxyy*M_xxxx + D_xxxxxyy*M_xxx + D_xxxxxyyy*M_xxxy + D_xxxxxyyz* &
      M_xxxz + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + D_xxxxyyyy*M_xxyy + &
      D_xxxxyyyz*M_xxyz + D_xxxxyyz*M_xxz + D_xxxxyyzz*M_xxzz + D_xxxyy &
      *M_x + D_xxxyyy*M_xy + D_xxxyyyy*M_xyy + D_xxxyyyyy*M_xyyy + &
      D_xxxyyyyz*M_xyyz + D_xxxyyyz*M_xyz + D_xxxyyyzz*M_xyzz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxxyyzzz*M_xzzz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyyy*M_yyy + D_xxyyyyyy* &
      M_yyyy + D_xxyyyyyz*M_yyyz + D_xxyyyyz*M_yyz + D_xxyyyyzz*M_yyzz &
      + D_xxyyyz*M_yz + D_xxyyyzz*M_yzz + D_xxyyyzzz*M_yzzz + D_xxyyz* &
      M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz + D_xxyyzzzz*M_zzzz)
    L_xxyyz    = L_xxyyz + (D_xxxxxyyz*M_xxx + D_xxxxyyyz*M_xxy + D_xxxxyyz*M_xx + D_xxxxyyzz*M_xxz &
      + D_xxxyyyyz*M_xyy + D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyz &
      *M_x + D_xxxyyzz*M_xz + D_xxxyyzzz*M_xzz + D_xxyyyyyz*M_yyy + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyz*M_y + D_xxyyyzz*M_yz &
      + D_xxyyyzzz*M_yzz + D_xxyyz*M_0 + D_xxyyzz*M_z + D_xxyyzzz*M_zz &
      + D_xxyyzzzz*M_zzz)
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    L_xxy      = L_xxy + (D_xxxxxxxy*M_xxxxx + D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + D_xxxxxxyz* &
      M_xxxxz + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + D_xxxxxyyy*M_xxxyy &
      + D_xxxxxyyz*M_xxxyz + D_xxxxxyz*M_xxxz + D_xxxxxyzz*M_xxxzz + &
      D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyyy* &
      M_xxyyy + D_xxxxyyyz*M_xxyyz + D_xxxxyyz*M_xxyz + D_xxxxyyzz* &
      M_xxyzz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + D_xxxxyzzz*M_xxzzz &
      + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + &
      D_xxxyyyyy*M_xyyyy + D_xxxyyyyz*M_xyyyz + D_xxxyyyz*M_xyyz + &
      D_xxxyyyzz*M_xyyzz + D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + &
      D_xxxyyzzz*M_xyzzz + D_xxxyz*M_xz + D_xxxyzz*M_xzz + D_xxxyzzz* &
      M_xzzz + D_xxxyzzzz*M_xzzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy* &
      M_yy + D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyyy*M_yyyyy + &
      D_xxyyyyyz*M_yyyyz + D_xxyyyyz*M_yyyz + D_xxyyyyzz*M_yyyzz + &
      D_xxyyyz*M_yyz + D_xxyyyzz*M_yyzz + D_xxyyyzzz*M_yyzzz + D_xxyyz* &
      M_yz + D_xxyyzz*M_yzz + D_xxyyzzz*M_yzzz + D_xxyyzzzz*M_yzzzz + &
      D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz + D_xxyzzzz*M_zzzz + &
      D_xxyzzzzz*M_zzzzz)
    L_xxyz     = L_xxyz + (D_xxxxxxyz*M_xxxx + D_xxxxxyyz*M_xxxy + D_xxxxxyz*M_xxx + D_xxxxxyzz* &
      M_xxxz + D_xxxxyyyz*M_xxyy + D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz &
      + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + D_xxxxyzzz*M_xxzz + &
      D_xxxyyyyz*M_xyyy + D_xxxyyyz*M_xyy + D_xxxyyyzz*M_xyyz + &
      D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyyzzz*M_xyzz + D_xxxyz*M_x &
      + D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxxyzzzz*M_xzzz + &
      D_xxyyyyyz*M_yyyy + D_xxyyyyz*M_yyy + D_xxyyyyzz*M_yyyz + &
      D_xxyyyz*M_yy + D_xxyyyzz*M_yyz + D_xxyyyzzz*M_yyzz + D_xxyyz*M_y &
      + D_xxyyzz*M_yz + D_xxyyzzz*M_yzz + D_xxyyzzzz*M_yzzz + D_xxyz* &
      M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz + D_xxyzzzzz* &
      M_zzzz)
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    L_xx       = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxxx*M_xxxxxx + D_xxxxxxxy*M_xxxxxy + &
      D_xxxxxxxz*M_xxxxxz + D_xxxxxxy*M_xxxxy + D_xxxxxxyy*M_xxxxyy + &
      D_xxxxxxyz*M_xxxxyz + D_xxxxxxz*M_xxxxz + D_xxxxxxzz*M_xxxxzz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyyy*M_xxxyyy + &
      D_xxxxxyyz*M_xxxyyz + D_xxxxxyz*M_xxxyz + D_xxxxxyzz*M_xxxyzz + &
      D_xxxxxz*M_xxxz + D_xxxxxzz*M_xxxzz + D_xxxxxzzz*M_xxxzzz + &
      D_xxxxy*M_xxy + D_xxxxyy*M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyyy* &
      M_xxyyyy + D_xxxxyyyz*M_xxyyyz + D_xxxxyyz*M_xxyyz + D_xxxxyyzz* &
      M_xxyyzz + D_xxxxyz*M_xxyz + D_xxxxyzz*M_xxyzz + D_xxxxyzzz* &
      M_xxyzzz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz*M_xxzzz + &
      D_xxxxzzzz*M_xxzzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy* &
      M_xyyy + D_xxxyyyy*M_xyyyy + D_xxxyyyyy*M_xyyyyy + D_xxxyyyyz* &
      M_xyyyyz + D_xxxyyyz*M_xyyyz + D_xxxyyyzz*M_xyyyzz + D_xxxyyz* &
      M_xyyz + D_xxxyyzz*M_xyyzz + D_xxxyyzzz*M_xyyzzz + D_xxxyz*M_xyz &
      + D_xxxyzz*M_xyzz + D_xxxyzzz*M_xyzzz + D_xxxyzzzz*M_xyzzzz + &
      D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz*M_xzzz + D_xxxzzzz*M_xzzzz &
      + D_xxxzzzzz*M_xzzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyyy*M_yyyyyy + &
      D_xxyyyyyz*M_yyyyyz + D_xxyyyyz*M_yyyyz + D_xxyyyyzz*M_yyyyzz + &
      D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + D_xxyyyzzz*M_yyyzzz + &
      D_xxyyz*M_yyz + D_xxyyzz*M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyyzzzz* &
      M_yyzzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz*M_yzzz + &
      D_xxyzzzz*M_yzzzz + D_xxyzzzzz*M_yzzzzz + D_xxz*M_z + D_xxzz*M_zz &
      + D_xxzzz*M_zzz + D_xxzzzz*M_zzzz + D_xxzzzzz*M_zzzzz + &
      D_xxzzzzzz*M_zzzzzz)
    L_xxz      = L_xxz + (D_xxxxxxxz*M_xxxxx + D_xxxxxxyz*M_xxxxy + D_xxxxxxz*M_xxxx + D_xxxxxxzz* &
      M_xxxxz + D_xxxxxyyz*M_xxxyy + D_xxxxxyz*M_xxxy + D_xxxxxyzz* &
      M_xxxyz + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + D_xxxxxzzz*M_xxxzz &
      + D_xxxxyyyz*M_xxyyy + D_xxxxyyz*M_xxyy + D_xxxxyyzz*M_xxyyz + &
      D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxyzzz*M_xxyzz + D_xxxxz* &
      M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxxzzzz*M_xxzzz + &
      D_xxxyyyyz*M_xyyyy + D_xxxyyyz*M_xyyy + D_xxxyyyzz*M_xyyyz + &
      D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyyzzz*M_xyyzz + D_xxxyz* &
      M_xy + D_xxxyzz*M_xyz + D_xxxyzzz*M_xyzz + D_xxxyzzzz*M_xyzzz + &
      D_xxxz*M_x + D_xxxzz*M_xz + D_xxxzzz*M_xzz + D_xxxzzzz*M_xzzz + &
      D_xxxzzzzz*M_xzzzz + D_xxyyyyyz*M_yyyyy + D_xxyyyyz*M_yyyy + &
      D_xxyyyyzz*M_yyyyz + D_xxyyyz*M_yyy + D_xxyyyzz*M_yyyz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyyzzz* &
      M_yyzz + D_xxyyzzzz*M_yyzzz + D_xxyz*M_y + D_xxyzz*M_yz + &
      D_xxyzzz*M_yzz + D_xxyzzzz*M_yzzz + D_xxyzzzzz*M_yzzzz + D_xxz* &
      M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + D_xxzzzzz* &
      M_zzzz + D_xxzzzzzz*M_zzzzz)
    D_xyyyyyyy = v102*v122
    L_xyyyyyyy = L_xyyyyyyy + (D_xyyyyyyy*M_0)
    D_xyyyyyyz = v115*(v111 + 467775.0d0*v133 + 155925.0d0*(-13.0d0*v134 + 13.0d0*v68))
    L_xyyyyyy  = L_xyyyyyy + (D_xxyyyyyy*M_x + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyz*M_z)
    L_xyyyyyyz = L_xyyyyyyz + (D_xyyyyyyz*M_0)
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    L_xyyyyy   = L_xyyyyy + (D_xxxyyyyy*M_xx + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyy*M_yy + D_xyyyyyyz*M_yz &
      + D_xyyyyyz*M_z + D_xyyyyyzz*M_zz)
    L_xyyyyyz  = L_xyyyyyz + (D_xxyyyyyz*M_x + D_xyyyyyyz*M_y + D_xyyyyyz*M_0 + D_xyyyyyzz*M_z)
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    L_xyyyy    = L_xyyyy + (D_xxxxyyyy*M_xxx + D_xxxyyyy*M_xx + D_xxxyyyyy*M_xxy + D_xxxyyyyz*M_xxz &
      + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyy*M_xyy + D_xxyyyyyz* &
      M_xyz + D_xxyyyyz*M_xz + D_xxyyyyzz*M_xzz + D_xyyyy*M_0 + &
      D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyyy*M_yyy + D_xyyyyyyz* &
      M_yyz + D_xyyyyyz*M_yz + D_xyyyyyzz*M_yzz + D_xyyyyz*M_z + &
      D_xyyyyzz*M_zz + D_xyyyyzzz*M_zzz)
    L_xyyyyz   = L_xyyyyz + (D_xxxyyyyz*M_xx + D_xxyyyyyz*M_xy + D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + &
      D_xyyyyyyz*M_yy + D_xyyyyyz*M_y + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 &
      + D_xyyyyzz*M_z + D_xyyyyzzz*M_zz)
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    L_xyyy     = L_xyyy + (D_xxxxxyyy*M_xxxx + D_xxxxyyy*M_xxx + D_xxxxyyyy*M_xxxy + D_xxxxyyyz* &
      M_xxxz + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + D_xxxyyyyy*M_xxyy + &
      D_xxxyyyyz*M_xxyz + D_xxxyyyz*M_xxz + D_xxxyyyzz*M_xxzz + D_xxyyy &
      *M_x + D_xxyyyy*M_xy + D_xxyyyyy*M_xyy + D_xxyyyyyy*M_xyyy + &
      D_xxyyyyyz*M_xyyz + D_xxyyyyz*M_xyz + D_xxyyyyzz*M_xyzz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xxyyyzzz*M_xzzz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyyy*M_yyy + D_xyyyyyyy* &
      M_yyyy + D_xyyyyyyz*M_yyyz + D_xyyyyyz*M_yyz + D_xyyyyyzz*M_yyzz &
      + D_xyyyyz*M_yz + D_xyyyyzz*M_yzz + D_xyyyyzzz*M_yzzz + D_xyyyz* &
      M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz + D_xyyyzzzz*M_zzzz)
    L_xyyyz    = L_xyyyz + (D_xxxxyyyz*M_xxx + D_xxxyyyyz*M_xxy + D_xxxyyyz*M_xx + D_xxxyyyzz*M_xxz &
      + D_xxyyyyyz*M_xyy + D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyz &
      *M_x + D_xxyyyzz*M_xz + D_xxyyyzzz*M_xzz + D_xyyyyyyz*M_yyy + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyz*M_y + D_xyyyyzz*M_yz &
      + D_xyyyyzzz*M_yzz + D_xyyyz*M_0 + D_xyyyzz*M_z + D_xyyyzzz*M_zz &
      + D_xyyyzzzz*M_zzz)
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    L_xyy      = L_xyy + (D_xxxxxxyy*M_xxxxx + D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + D_xxxxxyyz* &
      M_xxxxz + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + D_xxxxyyyy*M_xxxyy &
      + D_xxxxyyyz*M_xxxyz + D_xxxxyyz*M_xxxz + D_xxxxyyzz*M_xxxzz + &
      D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyyy* &
      M_xxyyy + D_xxxyyyyz*M_xxyyz + D_xxxyyyz*M_xxyz + D_xxxyyyzz* &
      M_xxyzz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + D_xxxyyzzz*M_xxzzz &
      + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + &
      D_xxyyyyyy*M_xyyyy + D_xxyyyyyz*M_xyyyz + D_xxyyyyz*M_xyyz + &
      D_xxyyyyzz*M_xyyzz + D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + &
      D_xxyyyzzz*M_xyzzz + D_xxyyz*M_xz + D_xxyyzz*M_xzz + D_xxyyzzz* &
      M_xzzz + D_xxyyzzzz*M_xzzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy* &
      M_yy + D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyyy*M_yyyyy + &
      D_xyyyyyyz*M_yyyyz + D_xyyyyyz*M_yyyz + D_xyyyyyzz*M_yyyzz + &
      D_xyyyyz*M_yyz + D_xyyyyzz*M_yyzz + D_xyyyyzzz*M_yyzzz + D_xyyyz* &
      M_yz + D_xyyyzz*M_yzz + D_xyyyzzz*M_yzzz + D_xyyyzzzz*M_yzzzz + &
      D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz + D_xyyzzzz*M_zzzz + &
      D_xyyzzzzz*M_zzzzz)
    L_xyyz     = L_xyyz + (D_xxxxxyyz*M_xxxx + D_xxxxyyyz*M_xxxy + D_xxxxyyz*M_xxx + D_xxxxyyzz* &
      M_xxxz + D_xxxyyyyz*M_xxyy + D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz &
      + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + D_xxxyyzzz*M_xxzz + &
      D_xxyyyyyz*M_xyyy + D_xxyyyyz*M_xyy + D_xxyyyyzz*M_xyyz + &
      D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyyzzz*M_xyzz + D_xxyyz*M_x &
      + D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xxyyzzzz*M_xzzz + &
      D_xyyyyyyz*M_yyyy + D_xyyyyyz*M_yyy + D_xyyyyyzz*M_yyyz + &
      D_xyyyyz*M_yy + D_xyyyyzz*M_yyz + D_xyyyyzzz*M_yyzz + D_xyyyz*M_y &
      + D_xyyyzz*M_yz + D_xyyyzzz*M_yzz + D_xyyyzzzz*M_yzzz + D_xyyz* &
      M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz + D_xyyzzzzz* &
      M_zzzz)
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    L_xy       = L_xy + (D_xxxxxxxy*M_xxxxxx + D_xxxxxxy*M_xxxxx + D_xxxxxxyy*M_xxxxxy + &
      D_xxxxxxyz*M_xxxxxz + D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + &
      D_xxxxxyyy*M_xxxxyy + D_xxxxxyyz*M_xxxxyz + D_xxxxxyz*M_xxxxz + &
      D_xxxxxyzz*M_xxxxzz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy &
      *M_xxxyy + D_xxxxyyyy*M_xxxyyy + D_xxxxyyyz*M_xxxyyz + D_xxxxyyz* &
      M_xxxyz + D_xxxxyyzz*M_xxxyzz + D_xxxxyz*M_xxxz + D_xxxxyzz* &
      M_xxxzz + D_xxxxyzzz*M_xxxzzz + D_xxxy*M_xx + D_xxxyy*M_xxy + &
      D_xxxyyy*M_xxyy + D_xxxyyyy*M_xxyyy + D_xxxyyyyy*M_xxyyyy + &
      D_xxxyyyyz*M_xxyyyz + D_xxxyyyz*M_xxyyz + D_xxxyyyzz*M_xxyyzz + &
      D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + D_xxxyyzzz*M_xxyzzz + &
      D_xxxyz*M_xxz + D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxxyzzzz* &
      M_xxzzzz + D_xxy*M_x + D_xxyy*M_xy + D_xxyyy*M_xyy + D_xxyyyy* &
      M_xyyy + D_xxyyyyy*M_xyyyy + D_xxyyyyyy*M_xyyyyy + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyyyz*M_xyyyz + D_xxyyyyzz*M_xyyyzz + D_xxyyyz* &
      M_xyyz + D_xxyyyzz*M_xyyzz + D_xxyyyzzz*M_xyyzzz + D_xxyyz*M_xyz &
      + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyyzzzz*M_xyzzzz + &
      D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz*M_xzzz + D_xxyzzzz*M_xzzzz &
      + D_xxyzzzzz*M_xzzzzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + &
      D_xyyyy*M_yyy + D_xyyyyy*M_yyyy + D_xyyyyyy*M_yyyyy + D_xyyyyyyy* &
      M_yyyyyy + D_xyyyyyyz*M_yyyyyz + D_xyyyyyz*M_yyyyz + D_xyyyyyzz* &
      M_yyyyzz + D_xyyyyz*M_yyyz + D_xyyyyzz*M_yyyzz + D_xyyyyzzz* &
      M_yyyzzz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz*M_yyzzz + &
      D_xyyyzzzz*M_yyzzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz* &
      M_yzzz + D_xyyzzzz*M_yzzzz + D_xyyzzzzz*M_yzzzzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz*M_zzzz + D_xyzzzzz*M_zzzzz &
      + D_xyzzzzzz*M_zzzzzz)
    L_xyz      = L_xyz + (D_xxxxxxyz*M_xxxxx + D_xxxxxyyz*M_xxxxy + D_xxxxxyz*M_xxxx + D_xxxxxyzz* &
      M_xxxxz + D_xxxxyyyz*M_xxxyy + D_xxxxyyz*M_xxxy + D_xxxxyyzz* &
      M_xxxyz + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + D_xxxxyzzz*M_xxxzz &
      + D_xxxyyyyz*M_xxyyy + D_xxxyyyz*M_xxyy + D_xxxyyyzz*M_xxyyz + &
      D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyyzzz*M_xxyzz + D_xxxyz* &
      M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxxyzzzz*M_xxzzz + &
      D_xxyyyyyz*M_xyyyy + D_xxyyyyz*M_xyyy + D_xxyyyyzz*M_xyyyz + &
      D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyyzzz*M_xyyzz + D_xxyyz* &
      M_xy + D_xxyyzz*M_xyz + D_xxyyzzz*M_xyzz + D_xxyyzzzz*M_xyzzz + &
      D_xxyz*M_x + D_xxyzz*M_xz + D_xxyzzz*M_xzz + D_xxyzzzz*M_xzzz + &
      D_xxyzzzzz*M_xzzzz + D_xyyyyyyz*M_yyyyy + D_xyyyyyz*M_yyyy + &
      D_xyyyyyzz*M_yyyyz + D_xyyyyz*M_yyy + D_xyyyyzz*M_yyyz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyyzzz* &
      M_yyzz + D_xyyyzzzz*M_yyzzz + D_xyyz*M_y + D_xyyzz*M_yz + &
      D_xyyzzz*M_yzz + D_xyyzzzz*M_yzzz + D_xyyzzzzz*M_yzzzz + D_xyz* &
      M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + D_xyzzzzz* &
      M_zzzz + D_xyzzzzzz*M_zzzzz)
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxy*M_xxxxxxy + D_xxxxxxxz*M_xxxxxxz + D_xxxxxxy*M_xxxxxy &
      + D_xxxxxxyy*M_xxxxxyy + D_xxxxxxyz*M_xxxxxyz + D_xxxxxxz* &
      M_xxxxxz + D_xxxxxxzz*M_xxxxxzz + D_xxxxxy*M_xxxxy + D_xxxxxyy* &
      M_xxxxyy + D_xxxxxyyy*M_xxxxyyy + D_xxxxxyyz*M_xxxxyyz + &
      D_xxxxxyz*M_xxxxyz + D_xxxxxyzz*M_xxxxyzz + D_xxxxxz*M_xxxxz + &
      D_xxxxxzz*M_xxxxzz + D_xxxxxzzz*M_xxxxzzz + D_xxxxy*M_xxxy + &
      D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + D_xxxxyyyy*M_xxxyyyy + &
      D_xxxxyyyz*M_xxxyyyz + D_xxxxyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyyzz &
      + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + D_xxxxyzzz*M_xxxyzzz + &
      D_xxxxz*M_xxxz + D_xxxxzz*M_xxxzz + D_xxxxzzz*M_xxxzzz + &
      D_xxxxzzzz*M_xxxzzzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy* &
      M_xxyyy + D_xxxyyyy*M_xxyyyy + D_xxxyyyyy*M_xxyyyyy + D_xxxyyyyz* &
      M_xxyyyyz + D_xxxyyyz*M_xxyyyz + D_xxxyyyzz*M_xxyyyzz + D_xxxyyz* &
      M_xxyyz + D_xxxyyzz*M_xxyyzz + D_xxxyyzzz*M_xxyyzzz + D_xxxyz* &
      M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + D_xxxyzzzz* &
      M_xxyzzzz + D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + &
      D_xxxzzzz*M_xxzzzz + D_xxxzzzzz*M_xxzzzzz + D_xxy*M_xy + D_xxyy* &
      M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyyy*M_xyyyyy + &
      D_xxyyyyyy*M_xyyyyyy + D_xxyyyyyz*M_xyyyyyz + D_xxyyyyz*M_xyyyyz &
      + D_xxyyyyzz*M_xyyyyzz + D_xxyyyz*M_xyyyz + D_xxyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyyzzz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + &
      D_xxyyzzz*M_xyyzzz + D_xxyyzzzz*M_xyyzzzz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxyzzz*M_xyzzz + D_xxyzzzz*M_xyzzzz + &
      D_xxyzzzzz*M_xyzzzzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz*M_xzzz &
      + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xxzzzzzz*M_xzzzzzz + &
      D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy* &
      M_yyyyy + D_xyyyyyy*M_yyyyyy + D_xyyyyyyy*M_yyyyyyy + D_xyyyyyyz* &
      M_yyyyyyz + D_xyyyyyz*M_yyyyyz + D_xyyyyyzz*M_yyyyyzz + D_xyyyyz* &
      M_yyyyz + D_xyyyyzz*M_yyyyzz + D_xyyyyzzz*M_yyyyzzz + D_xyyyz* &
      M_yyyz + D_xyyyzz*M_yyyzz + D_xyyyzzz*M_yyyzzz + D_xyyyzzzz* &
      M_yyyzzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz*M_yyzzz + &
      D_xyyzzzz*M_yyzzzz + D_xyyzzzzz*M_yyzzzzz + D_xyz*M_yz + D_xyzz* &
      M_yzz + D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + &
      D_xyzzzzzz*M_yzzzzzz + D_xz*M_z + D_xzz*M_zz + D_xzzz*M_zzz + &
      D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + D_xzzzzzz*M_zzzzzz + &
      D_xzzzzzzz*M_zzzzzzz)
    L_xz       = L_xz + (D_xxxxxxxz*M_xxxxxx + D_xxxxxxyz*M_xxxxxy + D_xxxxxxz*M_xxxxx + &
      D_xxxxxxzz*M_xxxxxz + D_xxxxxyyz*M_xxxxyy + D_xxxxxyz*M_xxxxy + &
      D_xxxxxyzz*M_xxxxyz + D_xxxxxz*M_xxxx + D_xxxxxzz*M_xxxxz + &
      D_xxxxxzzz*M_xxxxzz + D_xxxxyyyz*M_xxxyyy + D_xxxxyyz*M_xxxyy + &
      D_xxxxyyzz*M_xxxyyz + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz + &
      D_xxxxyzzz*M_xxxyzz + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxxxzzz &
      *M_xxxzz + D_xxxxzzzz*M_xxxzzz + D_xxxyyyyz*M_xxyyyy + D_xxxyyyz* &
      M_xxyyy + D_xxxyyyzz*M_xxyyyz + D_xxxyyz*M_xxyy + D_xxxyyzz* &
      M_xxyyz + D_xxxyyzzz*M_xxyyzz + D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + &
      D_xxxyzzz*M_xxyzz + D_xxxyzzzz*M_xxyzzz + D_xxxz*M_xx + D_xxxzz* &
      M_xxz + D_xxxzzz*M_xxzz + D_xxxzzzz*M_xxzzz + D_xxxzzzzz*M_xxzzzz &
      + D_xxyyyyyz*M_xyyyyy + D_xxyyyyz*M_xyyyy + D_xxyyyyzz*M_xyyyyz + &
      D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyyyzzz*M_xyyyzz + &
      D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyyzzzz* &
      M_xyyzzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz*M_xyzz + &
      D_xxyzzzz*M_xyzzz + D_xxyzzzzz*M_xyzzzz + D_xxz*M_x + D_xxzz*M_xz &
      + D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + D_xxzzzzz*M_xzzzz + &
      D_xxzzzzzz*M_xzzzzz + D_xyyyyyyz*M_yyyyyy + D_xyyyyyz*M_yyyyy + &
      D_xyyyyyzz*M_yyyyyz + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + &
      D_xyyyyzzz*M_yyyyzz + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyyyzzz &
      *M_yyyzz + D_xyyyzzzz*M_yyyzzz + D_xyyz*M_yy + D_xyyzz*M_yyz + &
      D_xyyzzz*M_yyzz + D_xyyzzzz*M_yyzzz + D_xyyzzzzz*M_yyzzzz + D_xyz &
      *M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xyzzzzz* &
      M_yzzzz + D_xyzzzzzz*M_yzzzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz* &
      M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz + D_xzzzzzz*M_zzzzz + &
      D_xzzzzzzz*M_zzzzzz)
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v121 - (1260.0d0*v117 + v68*v99))
    L_yyyyyyyy = L_yyyyyyyy + (D_yyyyyyyy*M_0)
    D_yyyyyyyz = v119*v122
    L_yyyyyyy  = L_yyyyyyy + (D_xyyyyyyy*M_x + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyz*M_z)
    L_yyyyyyyz = L_yyyyyyyz + (D_yyyyyyyz*M_0)
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = L_yyyyyy + (D_xxyyyyyy*M_xx + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*M_yy + D_yyyyyyyz*M_yz &
      + D_yyyyyyz*M_z + D_yyyyyyzz*M_zz)
    L_yyyyyyz  = L_yyyyyyz + (D_xyyyyyyz*M_x + D_yyyyyyyz*M_y + D_yyyyyyz*M_0 + D_yyyyyyzz*M_z)
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = L_yyyyy + (D_xxxyyyyy*M_xxx + D_xxyyyyy*M_xx + D_xxyyyyyy*M_xxy + D_xxyyyyyz*M_xxz &
      + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyy*M_xyy + D_xyyyyyyz* &
      M_xyz + D_xyyyyyz*M_xz + D_xyyyyyzz*M_xzz + D_yyyyy*M_0 + &
      D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyyy*M_yyy + D_yyyyyyyz* &
      M_yyz + D_yyyyyyz*M_yz + D_yyyyyyzz*M_yzz + D_yyyyyz*M_z + &
      D_yyyyyzz*M_zz + D_yyyyyzzz*M_zzz)
    L_yyyyyz   = L_yyyyyz + (D_xxyyyyyz*M_xx + D_xyyyyyyz*M_xy + D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + &
      D_yyyyyyyz*M_yy + D_yyyyyyz*M_y + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 &
      + D_yyyyyzz*M_z + D_yyyyyzzz*M_zz)
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = L_yyyy + (D_xxxxyyyy*M_xxxx + D_xxxyyyy*M_xxx + D_xxxyyyyy*M_xxxy + D_xxxyyyyz* &
      M_xxxz + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + D_xxyyyyyy*M_xxyy + &
      D_xxyyyyyz*M_xxyz + D_xxyyyyz*M_xxz + D_xxyyyyzz*M_xxzz + D_xyyyy &
      *M_x + D_xyyyyy*M_xy + D_xyyyyyy*M_xyy + D_xyyyyyyy*M_xyyy + &
      D_xyyyyyyz*M_xyyz + D_xyyyyyz*M_xyz + D_xyyyyyzz*M_xyzz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_xyyyyzzz*M_xzzz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyyy*M_yyy + D_yyyyyyyy* &
      M_yyyy + D_yyyyyyyz*M_yyyz + D_yyyyyyz*M_yyz + D_yyyyyyzz*M_yyzz &
      + D_yyyyyz*M_yz + D_yyyyyzz*M_yzz + D_yyyyyzzz*M_yzzz + D_yyyyz* &
      M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz + D_yyyyzzzz*M_zzzz)
    L_yyyyz    = L_yyyyz + (D_xxxyyyyz*M_xxx + D_xxyyyyyz*M_xxy + D_xxyyyyz*M_xx + D_xxyyyyzz*M_xxz &
      + D_xyyyyyyz*M_xyy + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyz &
      *M_x + D_xyyyyzz*M_xz + D_xyyyyzzz*M_xzz + D_yyyyyyyz*M_yyy + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyz*M_y + D_yyyyyzz*M_yz &
      + D_yyyyyzzz*M_yzz + D_yyyyz*M_0 + D_yyyyzz*M_z + D_yyyyzzz*M_zz &
      + D_yyyyzzzz*M_zzz)
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = L_yyy + (D_xxxxxyyy*M_xxxxx + D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + D_xxxxyyyz* &
      M_xxxxz + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + D_xxxyyyyy*M_xxxyy &
      + D_xxxyyyyz*M_xxxyz + D_xxxyyyz*M_xxxz + D_xxxyyyzz*M_xxxzz + &
      D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyyy* &
      M_xxyyy + D_xxyyyyyz*M_xxyyz + D_xxyyyyz*M_xxyz + D_xxyyyyzz* &
      M_xxyzz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + D_xxyyyzzz*M_xxzzz &
      + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + &
      D_xyyyyyyy*M_xyyyy + D_xyyyyyyz*M_xyyyz + D_xyyyyyz*M_xyyz + &
      D_xyyyyyzz*M_xyyzz + D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + &
      D_xyyyyzzz*M_xyzzz + D_xyyyz*M_xz + D_xyyyzz*M_xzz + D_xyyyzzz* &
      M_xzzz + D_xyyyzzzz*M_xzzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy* &
      M_yy + D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyyy*M_yyyyy + &
      D_yyyyyyyz*M_yyyyz + D_yyyyyyz*M_yyyz + D_yyyyyyzz*M_yyyzz + &
      D_yyyyyz*M_yyz + D_yyyyyzz*M_yyzz + D_yyyyyzzz*M_yyzzz + D_yyyyz* &
      M_yz + D_yyyyzz*M_yzz + D_yyyyzzz*M_yzzz + D_yyyyzzzz*M_yzzzz + &
      D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz + D_yyyzzzz*M_zzzz + &
      D_yyyzzzzz*M_zzzzz)
    L_yyyz     = L_yyyz + (D_xxxxyyyz*M_xxxx + D_xxxyyyyz*M_xxxy + D_xxxyyyz*M_xxx + D_xxxyyyzz* &
      M_xxxz + D_xxyyyyyz*M_xxyy + D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz &
      + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + D_xxyyyzzz*M_xxzz + &
      D_xyyyyyyz*M_xyyy + D_xyyyyyz*M_xyy + D_xyyyyyzz*M_xyyz + &
      D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyyzzz*M_xyzz + D_xyyyz*M_x &
      + D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_xyyyzzzz*M_xzzz + &
      D_yyyyyyyz*M_yyyy + D_yyyyyyz*M_yyy + D_yyyyyyzz*M_yyyz + &
      D_yyyyyz*M_yy + D_yyyyyzz*M_yyz + D_yyyyyzzz*M_yyzz + D_yyyyz*M_y &
      + D_yyyyzz*M_yz + D_yyyyzzz*M_yzz + D_yyyyzzzz*M_yzzz + D_yyyz* &
      M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz + D_yyyzzzzz* &
      M_zzzz)
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = L_yy + (D_xxxxxxyy*M_xxxxxx + D_xxxxxyy*M_xxxxx + D_xxxxxyyy*M_xxxxxy + &
      D_xxxxxyyz*M_xxxxxz + D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + &
      D_xxxxyyyy*M_xxxxyy + D_xxxxyyyz*M_xxxxyz + D_xxxxyyz*M_xxxxz + &
      D_xxxxyyzz*M_xxxxzz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy &
      *M_xxxyy + D_xxxyyyyy*M_xxxyyy + D_xxxyyyyz*M_xxxyyz + D_xxxyyyz* &
      M_xxxyz + D_xxxyyyzz*M_xxxyzz + D_xxxyyz*M_xxxz + D_xxxyyzz* &
      M_xxxzz + D_xxxyyzzz*M_xxxzzz + D_xxyy*M_xx + D_xxyyy*M_xxy + &
      D_xxyyyy*M_xxyy + D_xxyyyyy*M_xxyyy + D_xxyyyyyy*M_xxyyyy + &
      D_xxyyyyyz*M_xxyyyz + D_xxyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyyzz + &
      D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + D_xxyyyzzz*M_xxyzzz + &
      D_xxyyz*M_xxz + D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xxyyzzzz* &
      M_xxzzzz + D_xyy*M_x + D_xyyy*M_xy + D_xyyyy*M_xyy + D_xyyyyy* &
      M_xyyy + D_xyyyyyy*M_xyyyy + D_xyyyyyyy*M_xyyyyy + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyyyz*M_xyyyz + D_xyyyyyzz*M_xyyyzz + D_xyyyyz* &
      M_xyyz + D_xyyyyzz*M_xyyzz + D_xyyyyzzz*M_xyyzzz + D_xyyyz*M_xyz &
      + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyyzzzz*M_xyzzzz + &
      D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz*M_xzzz + D_xyyzzzz*M_xzzzz &
      + D_xyyzzzzz*M_xzzzzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + &
      D_yyyyy*M_yyy + D_yyyyyy*M_yyyy + D_yyyyyyy*M_yyyyy + D_yyyyyyyy* &
      M_yyyyyy + D_yyyyyyyz*M_yyyyyz + D_yyyyyyz*M_yyyyz + D_yyyyyyzz* &
      M_yyyyzz + D_yyyyyz*M_yyyz + D_yyyyyzz*M_yyyzz + D_yyyyyzzz* &
      M_yyyzzz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz*M_yyzzz + &
      D_yyyyzzzz*M_yyzzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz* &
      M_yzzz + D_yyyzzzz*M_yzzzz + D_yyyzzzzz*M_yzzzzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz*M_zzzz + D_yyzzzzz*M_zzzzz &
      + D_yyzzzzzz*M_zzzzzz)
    L_yyz      = L_yyz + (D_xxxxxyyz*M_xxxxx + D_xxxxyyyz*M_xxxxy + D_xxxxyyz*M_xxxx + D_xxxxyyzz* &
      M_xxxxz + D_xxxyyyyz*M_xxxyy + D_xxxyyyz*M_xxxy + D_xxxyyyzz* &
      M_xxxyz + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + D_xxxyyzzz*M_xxxzz &
      + D_xxyyyyyz*M_xxyyy + D_xxyyyyz*M_xxyy + D_xxyyyyzz*M_xxyyz + &
      D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyyzzz*M_xxyzz + D_xxyyz* &
      M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xxyyzzzz*M_xxzzz + &
      D_xyyyyyyz*M_xyyyy + D_xyyyyyz*M_xyyy + D_xyyyyyzz*M_xyyyz + &
      D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyyzzz*M_xyyzz + D_xyyyz* &
      M_xy + D_xyyyzz*M_xyz + D_xyyyzzz*M_xyzz + D_xyyyzzzz*M_xyzzz + &
      D_xyyz*M_x + D_xyyzz*M_xz + D_xyyzzz*M_xzz + D_xyyzzzz*M_xzzz + &
      D_xyyzzzzz*M_xzzzz + D_yyyyyyyz*M_yyyyy + D_yyyyyyz*M_yyyy + &
      D_yyyyyyzz*M_yyyyz + D_yyyyyz*M_yyy + D_yyyyyzz*M_yyyz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyyzzz* &
      M_yyzz + D_yyyyzzzz*M_yyzzz + D_yyyz*M_y + D_yyyzz*M_yz + &
      D_yyyzzz*M_yzz + D_yyyzzzz*M_yzzz + D_yyyzzzzz*M_yzzzz + D_yyz* &
      M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + D_yyzzzzz* &
      M_zzzz + D_yyzzzzzz*M_zzzzz)
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = L_y + (D_xxxxxxxy*M_xxxxxxx + D_xxxxxxy*M_xxxxxx + D_xxxxxxyy*M_xxxxxxy + &
      D_xxxxxxyz*M_xxxxxxz + D_xxxxxy*M_xxxxx + D_xxxxxyy*M_xxxxxy + &
      D_xxxxxyyy*M_xxxxxyy + D_xxxxxyyz*M_xxxxxyz + D_xxxxxyz*M_xxxxxz &
      + D_xxxxxyzz*M_xxxxxzz + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + &
      D_xxxxyyy*M_xxxxyy + D_xxxxyyyy*M_xxxxyyy + D_xxxxyyyz*M_xxxxyyz &
      + D_xxxxyyz*M_xxxxyz + D_xxxxyyzz*M_xxxxyzz + D_xxxxyz*M_xxxxz + &
      D_xxxxyzz*M_xxxxzz + D_xxxxyzzz*M_xxxxzzz + D_xxxy*M_xxx + &
      D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy*M_xxxyyy + &
      D_xxxyyyyy*M_xxxyyyy + D_xxxyyyyz*M_xxxyyyz + D_xxxyyyz*M_xxxyyz &
      + D_xxxyyyzz*M_xxxyyzz + D_xxxyyz*M_xxxyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyyzzz*M_xxxyzzz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + &
      D_xxxyzzz*M_xxxzzz + D_xxxyzzzz*M_xxxzzzz + D_xxy*M_xx + D_xxyy* &
      M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyyy*M_xxyyyy + &
      D_xxyyyyyy*M_xxyyyyy + D_xxyyyyyz*M_xxyyyyz + D_xxyyyyz*M_xxyyyz &
      + D_xxyyyyzz*M_xxyyyzz + D_xxyyyz*M_xxyyz + D_xxyyyzz*M_xxyyzz + &
      D_xxyyyzzz*M_xxyyzzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyyzzzz*M_xxyzzzz + D_xxyz*M_xxz + &
      D_xxyzz*M_xxzz + D_xxyzzz*M_xxzzz + D_xxyzzzz*M_xxzzzz + &
      D_xxyzzzzz*M_xxzzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + &
      D_xyyyyyyy*M_xyyyyyy + D_xyyyyyyz*M_xyyyyyz + D_xyyyyyz*M_xyyyyz &
      + D_xyyyyyzz*M_xyyyyzz + D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyyzzz*M_xyyyzzz + D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + &
      D_xyyyzzz*M_xyyzzz + D_xyyyzzzz*M_xyyzzzz + D_xyyz*M_xyz + &
      D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + D_xyyzzzz*M_xyzzzz + &
      D_xyyzzzzz*M_xyzzzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz &
      + D_xyzzzz*M_xzzzz + D_xyzzzzz*M_xzzzzz + D_xyzzzzzz*M_xzzzzzz + &
      D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyyy*M_yyyy + &
      D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + D_yyyyyyyy*M_yyyyyyy + &
      D_yyyyyyyz*M_yyyyyyz + D_yyyyyyz*M_yyyyyz + D_yyyyyyzz*M_yyyyyzz &
      + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + D_yyyyyzzz*M_yyyyzzz + &
      D_yyyyz*M_yyyz + D_yyyyzz*M_yyyzz + D_yyyyzzz*M_yyyzzz + &
      D_yyyyzzzz*M_yyyzzzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyyzzz* &
      M_yyzzz + D_yyyzzzz*M_yyzzzz + D_yyyzzzzz*M_yyzzzzz + D_yyz*M_yz &
      + D_yyzz*M_yzz + D_yyzzz*M_yzzz + D_yyzzzz*M_yzzzz + D_yyzzzzz* &
      M_yzzzzz + D_yyzzzzzz*M_yzzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz* &
      M_zzz + D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz + &
      D_yzzzzzzz*M_zzzzzzz)
    L_yz       = L_yz + (D_xxxxxxyz*M_xxxxxx + D_xxxxxyyz*M_xxxxxy + D_xxxxxyz*M_xxxxx + &
      D_xxxxxyzz*M_xxxxxz + D_xxxxyyyz*M_xxxxyy + D_xxxxyyz*M_xxxxy + &
      D_xxxxyyzz*M_xxxxyz + D_xxxxyz*M_xxxx + D_xxxxyzz*M_xxxxz + &
      D_xxxxyzzz*M_xxxxzz + D_xxxyyyyz*M_xxxyyy + D_xxxyyyz*M_xxxyy + &
      D_xxxyyyzz*M_xxxyyz + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz + &
      D_xxxyyzzz*M_xxxyzz + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xxxyzzz &
      *M_xxxzz + D_xxxyzzzz*M_xxxzzz + D_xxyyyyyz*M_xxyyyy + D_xxyyyyz* &
      M_xxyyy + D_xxyyyyzz*M_xxyyyz + D_xxyyyz*M_xxyy + D_xxyyyzz* &
      M_xxyyz + D_xxyyyzzz*M_xxyyzz + D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + &
      D_xxyyzzz*M_xxyzz + D_xxyyzzzz*M_xxyzzz + D_xxyz*M_xx + D_xxyzz* &
      M_xxz + D_xxyzzz*M_xxzz + D_xxyzzzz*M_xxzzz + D_xxyzzzzz*M_xxzzzz &
      + D_xyyyyyyz*M_xyyyyy + D_xyyyyyz*M_xyyyy + D_xyyyyyzz*M_xyyyyz + &
      D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyyyzzz*M_xyyyzz + &
      D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyyzzzz* &
      M_xyyzzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz*M_xyzz + &
      D_xyyzzzz*M_xyzzz + D_xyyzzzzz*M_xyzzzz + D_xyz*M_x + D_xyzz*M_xz &
      + D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + D_xyzzzzz*M_xzzzz + &
      D_xyzzzzzz*M_xzzzzz + D_yyyyyyyz*M_yyyyyy + D_yyyyyyz*M_yyyyy + &
      D_yyyyyyzz*M_yyyyyz + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + &
      D_yyyyyzzz*M_yyyyzz + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyyyzzz &
      *M_yyyzz + D_yyyyzzzz*M_yyyzzz + D_yyyz*M_yy + D_yyyzz*M_yyz + &
      D_yyyzzz*M_yyzz + D_yyyzzzz*M_yyzzz + D_yyyzzzzz*M_yyzzzz + D_yyz &
      *M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yyzzzzz* &
      M_yzzzz + D_yyzzzzzz*M_yzzzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz* &
      M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz + D_yzzzzzz*M_zzzzz + &
      D_yzzzzzzz*M_zzzzzz)
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_0        = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxxx* &
      M_xxxxxxxx + D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxz*M_xxxxxxxz + &
      D_xxxxxxy*M_xxxxxxy + D_xxxxxxyy*M_xxxxxxyy + D_xxxxxxyz* &
      M_xxxxxxyz + D_xxxxxxz*M_xxxxxxz + D_xxxxxxzz*M_xxxxxxzz + &
      D_xxxxxy*M_xxxxxy + D_xxxxxyy*M_xxxxxyy + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxyyz*M_xxxxxyyz + D_xxxxxyz*M_xxxxxyz + D_xxxxxyzz* &
      M_xxxxxyzz + D_xxxxxz*M_xxxxxz + D_xxxxxzz*M_xxxxxzz + D_xxxxxzzz &
      *M_xxxxxzzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyyy* &
      M_xxxxyyy + D_xxxxyyyy*M_xxxxyyyy + D_xxxxyyyz*M_xxxxyyyz + &
      D_xxxxyyz*M_xxxxyyz + D_xxxxyyzz*M_xxxxyyzz + D_xxxxyz*M_xxxxyz + &
      D_xxxxyzz*M_xxxxyzz + D_xxxxyzzz*M_xxxxyzzz + D_xxxxz*M_xxxxz + &
      D_xxxxzz*M_xxxxzz + D_xxxxzzz*M_xxxxzzz + D_xxxxzzzz*M_xxxxzzzz + &
      D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyyy* &
      M_xxxyyyy + D_xxxyyyyy*M_xxxyyyyy + D_xxxyyyyz*M_xxxyyyyz + &
      D_xxxyyyz*M_xxxyyyz + D_xxxyyyzz*M_xxxyyyzz + D_xxxyyz*M_xxxyyz + &
      D_xxxyyzz*M_xxxyyzz + D_xxxyyzzz*M_xxxyyzzz + D_xxxyz*M_xxxyz + &
      D_xxxyzz*M_xxxyzz + D_xxxyzzz*M_xxxyzzz + D_xxxyzzzz*M_xxxyzzzz + &
      D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + D_xxxzzz*M_xxxzzz + D_xxxzzzz* &
      M_xxxzzzz + D_xxxzzzzz*M_xxxzzzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + &
      D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy*M_xxyyyyy + &
      D_xxyyyyyy*M_xxyyyyyy + D_xxyyyyyz*M_xxyyyyyz + D_xxyyyyz* &
      M_xxyyyyz + D_xxyyyyzz*M_xxyyyyzz + D_xxyyyz*M_xxyyyz + D_xxyyyzz &
      *M_xxyyyzz + D_xxyyyzzz*M_xxyyyzzz + D_xxyyz*M_xxyyz + D_xxyyzz* &
      M_xxyyzz + D_xxyyzzz*M_xxyyzzz + D_xxyyzzzz*M_xxyyzzzz + D_xxyz* &
      M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxyzzzz + D_xxyzzzzz*M_xxyzzzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + &
      D_xxzzz*M_xxzzz + D_xxzzzz*M_xxzzzz + D_xxzzzzz*M_xxzzzzz + &
      D_xxzzzzzz*M_xxzzzzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + &
      D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyyy*M_xyyyyyy + &
      D_xyyyyyyy*M_xyyyyyyy + D_xyyyyyyz*M_xyyyyyyz + D_xyyyyyz* &
      M_xyyyyyz + D_xyyyyyzz*M_xyyyyyzz + D_xyyyyz*M_xyyyyz + D_xyyyyzz &
      *M_xyyyyzz + D_xyyyyzzz*M_xyyyyzzz + D_xyyyz*M_xyyyz + D_xyyyzz* &
      M_xyyyzz + D_xyyyzzz*M_xyyyzzz + D_xyyyzzzz*M_xyyyzzzz + D_xyyz* &
      M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz + D_xyyzzzz* &
      M_xyyzzzz + D_xyyzzzzz*M_xyyzzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xyzzz*M_xyzzz + D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + &
      D_xyzzzzzz*M_xyzzzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + &
      D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_xzzzzzz*M_xzzzzzz + &
      D_xzzzzzzz*M_xzzzzzzz + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + &
      D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + D_yyyyyyy* &
      M_yyyyyyy + D_yyyyyyyy*M_yyyyyyyy + D_yyyyyyyz*M_yyyyyyyz + &
      D_yyyyyyz*M_yyyyyyz + D_yyyyyyzz*M_yyyyyyzz + D_yyyyyz*M_yyyyyz + &
      D_yyyyyzz*M_yyyyyzz + D_yyyyyzzz*M_yyyyyzzz + D_yyyyz*M_yyyyz + &
      D_yyyyzz*M_yyyyzz + D_yyyyzzz*M_yyyyzzz + D_yyyyzzzz*M_yyyyzzzz + &
      D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + D_yyyzzzz* &
      M_yyyzzzz + D_yyyzzzzz*M_yyyzzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + &
      D_yyzzz*M_yyzzz + D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + &
      D_yyzzzzzz*M_yyzzzzzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + &
      D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz + D_yzzzzzz*M_yzzzzzz + &
      D_yzzzzzzz*M_yzzzzzzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + &
      D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz*M_zzzzzz + D_zzzzzzz* &
      M_zzzzzzz + D_zzzzzzzz*M_zzzzzzzz)
    L_z        = L_z + (D_xxxxxxxz*M_xxxxxxx + D_xxxxxxyz*M_xxxxxxy + D_xxxxxxz*M_xxxxxx + &
      D_xxxxxxzz*M_xxxxxxz + D_xxxxxyyz*M_xxxxxyy + D_xxxxxyz*M_xxxxxy &
      + D_xxxxxyzz*M_xxxxxyz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + &
      D_xxxxxzzz*M_xxxxxzz + D_xxxxyyyz*M_xxxxyyy + D_xxxxyyz*M_xxxxyy &
      + D_xxxxyyzz*M_xxxxyyz + D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + &
      D_xxxxyzzz*M_xxxxyzz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + &
      D_xxxxzzz*M_xxxxzz + D_xxxxzzzz*M_xxxxzzz + D_xxxyyyyz*M_xxxyyyy &
      + D_xxxyyyz*M_xxxyyy + D_xxxyyyzz*M_xxxyyyz + D_xxxyyz*M_xxxyy + &
      D_xxxyyzz*M_xxxyyz + D_xxxyyzzz*M_xxxyyzz + D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + D_xxxyzzzz*M_xxxyzzz + &
      D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz* &
      M_xxxzzz + D_xxxzzzzz*M_xxxzzzz + D_xxyyyyyz*M_xxyyyyy + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz + D_xxyyyz*M_xxyyy + &
      D_xxyyyzz*M_xxyyyz + D_xxyyyzzz*M_xxyyyzz + D_xxyyz*M_xxyy + &
      D_xxyyzz*M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyyzzzz*M_xxyyzzz + &
      D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + D_xxyzzzz* &
      M_xxyzzz + D_xxyzzzzz*M_xxyzzzz + D_xxz*M_xx + D_xxzz*M_xxz + &
      D_xxzzz*M_xxzz + D_xxzzzz*M_xxzzz + D_xxzzzzz*M_xxzzzz + &
      D_xxzzzzzz*M_xxzzzzz + D_xyyyyyyz*M_xyyyyyy + D_xyyyyyz*M_xyyyyy &
      + D_xyyyyyzz*M_xyyyyyz + D_xyyyyz*M_xyyyy + D_xyyyyzz*M_xyyyyz + &
      D_xyyyyzzz*M_xyyyyzz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + &
      D_xyyyzzz*M_xyyyzz + D_xyyyzzzz*M_xyyyzzz + D_xyyz*M_xyy + &
      D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + D_xyyzzzz*M_xyyzzz + &
      D_xyyzzzzz*M_xyyzzzz + D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz &
      + D_xyzzzz*M_xyzzz + D_xyzzzzz*M_xyzzzz + D_xyzzzzzz*M_xyzzzzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_xzzzzzz*M_xzzzzz + D_xzzzzzzz*M_xzzzzzz + D_yyyyyyyz* &
      M_yyyyyyy + D_yyyyyyz*M_yyyyyy + D_yyyyyyzz*M_yyyyyyz + D_yyyyyz* &
      M_yyyyy + D_yyyyyzz*M_yyyyyz + D_yyyyyzzz*M_yyyyyzz + D_yyyyz* &
      M_yyyy + D_yyyyzz*M_yyyyz + D_yyyyzzz*M_yyyyzz + D_yyyyzzzz* &
      M_yyyyzzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + &
      D_yyyzzzz*M_yyyzzz + D_yyyzzzzz*M_yyyzzzz + D_yyz*M_yy + D_yyzz* &
      M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz*M_yyzzzz + &
      D_yyzzzzzz*M_yyzzzzz + D_yz*M_y + D_yzz*M_yz + D_yzzz*M_yzz + &
      D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + D_yzzzzzz*M_yzzzzz + &
      D_yzzzzzzz*M_yzzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz + D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz + &
      D_zzzzzzzz*M_zzzzzzz)
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  M_y                 
#undef  L_y                 
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
#undef  L_xyy               
#undef  M_xxz               
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
#undef  L_xxyyy             
#undef  M_yyyy              
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
#undef  M_xyyyyz            
#undef  L_xxxxyyyz          
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
    end subroutine mom_es_M2L_add
    
! OPS  915*ADD + 2*DIV + 1085*MUL + 84*NEG + POW = 2087  (7021 before optimization)
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
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
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
                L_yzzzzzzz, L_zzzzzzzz
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
#define L_yy                 L(7)
#define Ls_yy                Ls(7)
#define Ls_yz                Ls(8)
#define L_yz                 L(8)
#define Ls_xxx               Ls(9)
#define L_xxx                L(9)
#define Ls_xxy               Ls(10)
#define L_xxy                L(10)
#define Ls_xxz               Ls(11)
#define L_xxz                L(11)
#define L_xyy                L(12)
#define Ls_xyy               Ls(12)
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
#define L_xxxyyz             L(42)
#define Ls_xxxyyz            Ls(42)
#define Ls_xxyyyy            Ls(43)
#define L_xxyyyy             L(43)
#define Ls_xxyyyz            Ls(44)
#define L_xxyyyz             L(44)
#define Ls_xyyyyy            Ls(45)
#define L_xyyyyy             L(45)
#define L_xyyyyz             L(46)
#define Ls_xyyyyz            Ls(46)
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
#define Ls_xxxxxyz           Ls(53)
#define L_xxxxxyz            L(53)
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
#define L_xyyyyyy            L(60)
#define Ls_xyyyyyy           Ls(60)
#define L_xyyyyyz            L(61)
#define Ls_xyyyyyz           Ls(61)
#define Ls_yyyyyyy           Ls(62)
#define L_yyyyyyy            L(62)
#define Ls_yyyyyyz           Ls(63)
#define L_yyyyyyz            L(63)
#define L_xxxxxxxx           L(64)
#define Ls_xxxxxxxx          Ls(64)
#define Ls_xxxxxxxy          Ls(65)
#define L_xxxxxxxy           L(65)
#define Ls_xxxxxxxz          Ls(66)
#define L_xxxxxxxz           L(66)
#define Ls_xxxxxxyy          Ls(67)
#define L_xxxxxxyy           L(67)
#define Ls_xxxxxxyz          Ls(68)
#define L_xxxxxxyz           L(68)
#define Ls_xxxxxyyy          Ls(69)
#define L_xxxxxyyy           L(69)
#define L_xxxxxyyz           L(70)
#define Ls_xxxxxyyz          Ls(70)
#define Ls_xxxxyyyy          Ls(71)
#define L_xxxxyyyy           L(71)
#define L_xxxxyyyz           L(72)
#define Ls_xxxxyyyz          Ls(72)
#define Ls_xxxyyyyy          Ls(73)
#define L_xxxyyyyy           L(73)
#define Ls_xxxyyyyz          Ls(74)
#define L_xxxyyyyz           L(74)
#define L_xxyyyyyy           L(75)
#define Ls_xxyyyyyy          Ls(75)
#define Ls_xxyyyyyz          Ls(76)
#define L_xxyyyyyz           L(76)
#define L_xyyyyyyy           L(77)
#define Ls_xyyyyyyy          Ls(77)
#define L_xyyyyyyz           L(78)
#define Ls_xyyyyyyz          Ls(78)
#define L_yyyyyyyy           L(79)
#define Ls_yyyyyyyy          Ls(79)
#define Ls_yyyyyyyz          Ls(80)
#define L_yyyyyyyz           L(80)
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
    v222        = 0.00833333333333333d0*x
    v236        = L_xyyyyyz*z
    v239        = v11*y
    v242        = L_xyyyyz*z
    v253        = L_xyyyz*z
    v269        = L_xyyz*z
    v289        = L_xyz*z
    v313        = L_xz*z
    v335        = 0.00138888888888889d0*x
    v351        = L_yyyyyyz*z
    v354        = L_yyyyyz*z
    v357        = 0.5d0*y
    v361        = L_yyyyz*z
    v366        = 0.166666666666667d0*y
    v372        = L_yyyz*z
    v379        = 0.0416666666666667d0*y
    v386        = L_yyz*z
    v395        = 0.00833333333333333d0*y
    v403        = L_yz*z
    v415        = 0.00138888888888889d0*y
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
    v338        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v417        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    v225        = L_xxzz*z
    L_xyzz      = -(L_xxxy + L_xyyy)
    v302        = L_xyzz*z
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    v397        = L_yyzz*z
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    v140        = L_xxxzz*z
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    v193        = L_xxyzz*z
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    v280        = L_xyyzz*z
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    v381        = L_yyyzz*z
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
    v262        = L_xyyyzz*z
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    v368        = L_yyyyzz*z
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
    v249        = L_xyyyyzz*z
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    v359        = L_yyyyyzz*z
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
    v240        = L_xyyyyyz + L_xyyyyyzz*z
    v241        = L_xyyyyyyz*y + v240
    v252        = v240*y
    Ls_xyyyyyz  = Ls_xyyyyyz + (L_xxyyyyyz*x + v241)
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    v353        = L_yyyyyyz + L_yyyyyyzz*z
    Ls_yyyyyyz  = Ls_yyyyyyz + (v353 + L_xyyyyyyz*x + L_yyyyyyyz*y)
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
    v221        = 0.0208333333333333d0*v15
    v334        = 0.00416666666666667d0*v15
    a3          = a1*a2
    v30         = a3
    v31         = 0.166666666666667d0*v30
    v135        = 0.0833333333333333d0*v30
    v220        = 0.0277777777777778d0*v30
    v333        = 0.00694444444444444d0*v30
    a4          = a2*a2
    v64         = a4
    v65         = 0.0416666666666667d0*v64
    v217        = 0.0208333333333333d0*v64
    v332        = 0.00694444444444444d0*v64
    a5          = a2*a3
    v121        = a5
    v122        = 0.00833333333333333d0*v121
    v328        = 0.00416666666666667d0*v121
    a6          = a3*a3
    v203        = a6
    v204        = 0.00138888888888889d0*v203
    a7          = a3*a4
    v314        = 0.000198412698412698d0*a7
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
    v237        = L_xyyyyyyy*v17
    v250        = L_xyyyyyyz*v17
    v365        = 0.25d0*v17
    v378        = 0.0833333333333333d0*v17
    v394        = 0.0208333333333333d0*v17
    v414        = 0.00416666666666667d0*v17
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
    v243        = L_xyyyyyyy*v32
    v263        = L_xyyyyyyz*v32
    v377        = 0.0833333333333333d0*v32
    v393        = 0.0277777777777778d0*v32
    v413        = 0.00694444444444444d0*v32
    b4          = b2*b2
    v66         = b4
    v67         = L_xxxxyyyy*v66
    v105        = L_xxxyyyyy*v66
    v130        = 0.0416666666666667d0*v66
    v141        = L_xxxyyyyz*v66
    v167        = L_xxyyyyyy*v66
    v194        = L_xxyyyyyz*v66
    v223        = 5.0d0*v66
    v254        = L_xyyyyyyy*v66
    v281        = L_xyyyyyyz*v66
    v392        = 0.0208333333333333d0*v66
    v412        = 0.00694444444444444d0*v66
    b5          = b2*b3
    v123        = b5
    v124        = L_xxxyyyyy*v123
    v183        = L_xxyyyyyy*v123
    v213        = 0.00833333333333333d0*v123
    v226        = L_xxyyyyyz*v123
    v270        = L_xyyyyyyy*v123
    v303        = L_xyyyyyyz*v123
    v336        = 6.0d0*v123
    v411        = 0.00416666666666667d0*v123
    b6          = b3*b3
    v205        = b6
    v206        = L_xxyyyyyy*v205
    v290        = L_xyyyyyyy*v205
    v324        = 0.00138888888888889d0*v205
    v339        = L_xyyyyyyz*v205
    b7          = b3*b4
    v315        = b7
    v316        = L_xyyyyyyy*v315
    v404        = 0.000198412698412698d0*v315
    b8          = b4*b4
    c2          = c1*c1
    v19         = c2
    v424        = 0.5d0*v19
    v317        = L_xzz*v19
    v405        = L_yzz*v19
    v207        = L_xxzz*v19
    v291        = L_xyzz*v19
    v340        = L_xzzz*v19
    v387        = L_yyzz*v19
    v418        = L_yzzz*v19
    v125        = L_xxxzz*v19
    v184        = L_xxyzz*v19
    v227        = L_xxzzz*v19
    v271        = L_xyyzz*v19
    v304        = L_xyzzz*v19
    v373        = L_yyyzz*v19
    v398        = L_yyzzz*v19
    v68         = L_xxxxzz*v19
    v106        = L_xxxyzz*v19
    v142        = L_xxxzzz*v19
    v168        = L_xxyyzz*v19
    v195        = L_xxyzzz*v19
    v255        = L_xyyyzz*v19
    v282        = L_xyyzzz*v19
    v362        = L_yyyyzz*v19
    v382        = L_yyyzzz*v19
    v34         = L_xxxxxzz*v19
    v54         = L_xxxxyzz*v19
    v82         = L_xxxxzzz*v19
    v95         = L_xxxyyzz*v19
    v115        = L_xxxyzzz*v19
    v157        = L_xxyyyzz*v19
    v177        = L_xxyyzzz*v19
    v244        = L_xyyyyzz*v19
    v264        = L_xyyyzzz*v19
    v355        = L_yyyyyzz*v19
    v369        = L_yyyyzzz*v19
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
    v214        = v159*v66
    v248        = 2.0d0*v152 + v150 + v159
    Ls_xxyyyy   = Ls_xxyyyy + (0.5d0*(v150 + v151) + L_xxxxyyyy*v16 + L_xxyyyy + v149 + v152 + v8*x)
    v164        = L_xxyyyzzz*v19
    v179        = v164 + 2.0d0*(L_xxyyyz + v162)
    v180        = v179*y
    v198        = v17*v179
    v231        = v179*v32
    v268        = 2.0d0*v165 + v163 + v179
    Ls_xxyyyz   = Ls_xxyyyz + (0.5d0*(v163 + v164) + L_xxxxyyyz*v16 + L_xxyyyz + v162 + v165 + v92*x)
    v238        = L_xyyyyyzz*v19
    v246        = v238 + 2.0d0*(L_xyyyyy + v236)
    v247        = v246*y
    v258        = v17*v246
    v275        = v246*v32
    v296        = v246*v66
    v325        = v123*v246
    Ls_xyyyyy   = Ls_xyyyyy + (0.5d0*(v237 + v238) + L_xxxyyyyy*v16 + L_xyyyyy + v10*x + v236 + v239)
    v251        = L_xyyyyzzz*v19
    v266        = v251 + 2.0d0*(L_xyyyyz + v249)
    v267        = v266*y
    v285        = v17*v266
    v308        = v266*v32
    v345        = v266*v66
    Ls_xyyyyz   = Ls_xyyyyz + (0.5d0*(v250 + v251) + L_xxxyyyyz*v16 + L_xyyyyz + v154*x + v249 + v252)
    v352        = L_yyyyyyzz*v19
    v358        = v352 + 2.0d0*(L_yyyyyy + v351)
    Ls_yyyyyy   = Ls_yyyyyy + (0.5d0*v352 + L_xxyyyyyy*v16 + L_yyyyyy + L_yyyyyyyy*v37 + v12*x + v13*y &
      + v351)
    v360        = L_yyyyyzzz*v19
    v371        = v360 + 2.0d0*(L_yyyyyz + v359)
    Ls_yyyyyz   = Ls_yyyyyz + (0.5d0*v360 + L_xxyyyyyz*v16 + L_yyyyyyyz*v37 + L_yyyyyz + v241*x + v353* &
      y + v359)
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
    v425        = 0.166666666666667d0*v35
    v318        = L_xzzz*v35
    v406        = L_yzzz*v35
    v208        = L_xxzzz*v35
    v292        = L_xyzzz*v35
    v341        = L_xzzzz*v35
    v388        = L_yyzzz*v35
    v419        = L_yzzzz*v35
    v126        = L_xxxzzz*v35
    v185        = L_xxyzzz*v35
    v228        = L_xxzzzz*v35
    v272        = L_xyyzzz*v35
    v305        = L_xyzzzz*v35
    v374        = L_yyyzzz*v35
    v399        = L_yyzzzz*v35
    v69         = L_xxxxzzz*v35
    v107        = L_xxxyzzz*v35
    v143        = L_xxxzzzz*v35
    v169        = L_xxyyzzz*v35
    v196        = L_xxyzzzz*v35
    v256        = L_xyyyzzz*v35
    v283        = L_xyyzzzz*v35
    v363        = L_yyyyzzz*v35
    v383        = L_yyyzzzz*v35
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
    v215        = v172*v32
    v261        = v156 + v172 + 3.0d0*v160 + v78*v9
    Ls_xxyyy    = Ls_xxyyy + (0.166666666666667d0*(v156 + v158 + 3.0d0*(v157 + v160)) + L_xxxxxyyy*v31 &
      + L_xxyyy + v155 + v16*v6 + v161*v40 + v37*v9)
    v178        = L_xxyyzzzz*v35
    v199        = v178 + 3.0d0*(2.0d0*L_xxyyz + 2.0d0*v175 + v177)
    v200        = v199*y
    v232        = v17*v199
    v288        = v176 + v199 + v153*v78 + 3.0d0*v180
    Ls_xxyyz    = Ls_xxyyz + (0.166666666666667d0*(v176 + v178 + 3.0d0*(v177 + v180)) + L_xxxxxyyz*v31 &
      + L_xxyyz + v153*v37 + v16*v51 + v175 + v181*v40)
    v245        = L_xyyyyzzz*v35
    v259        = v245 + 3.0d0*(2.0d0*L_xyyyy + 2.0d0*v242 + v244)
    v260        = v259*y
    v276        = v17*v259
    v297        = v259*v32
    v326        = v259*v66
    Ls_xyyyy    = Ls_xyyyy + (0.166666666666667d0*(v243 + v245 + 3.0d0*(v244 + v247)) + L_xxxxyyyy*v31 &
      + L_xyyyy + v11*v37 + v16*v8 + v242 + v248*v40)
    v265        = L_xyyyzzzz*v35
    v286        = v265 + 3.0d0*(2.0d0*L_xyyyz + 2.0d0*v262 + v264)
    v287        = v286*y
    v309        = v17*v286
    v346        = v286*v32
    Ls_xyyyz    = Ls_xyyyz + (0.166666666666667d0*(v263 + v265 + 3.0d0*(v264 + v267)) + L_xxxxyyyz*v31 &
      + L_xyyyz + v16*v92 + v240*v37 + v262 + v268*v40)
    v356        = L_yyyyyzzz*v35
    v367        = v356 + 3.0d0*(2.0d0*L_yyyyy + 2.0d0*v354 + v355)
    Ls_yyyyy    = Ls_yyyyy + (0.166666666666667d0*(3.0d0*v355 + v356) + L_xxxyyyyy*v31 + L_yyyyy + &
      L_yyyyyyyy*v72 + v10*v16 + v13*v37 + v354 + v357*v358 + v40*(v237 &
      + 2.0d0*v239 + v246))
    v370        = L_yyyyzzzz*v35
    v385        = v370 + 3.0d0*(2.0d0*L_yyyyz + 2.0d0*v368 + v369)
    Ls_yyyyz    = Ls_yyyyz + (0.166666666666667d0*(3.0d0*v369 + v370) + L_xxxyyyyz*v31 + L_yyyyyyyz* &
      v72 + L_yyyyz + v154*v16 + v353*v37 + v357*v371 + v368 + v40*( &
      v250 + 2.0d0*v252 + v266))
    c4          = c2*c2
    v70         = c4
    v426        = 0.0416666666666667d0*v70
    v319        = L_xzzzz*v70
    v407        = L_yzzzz*v70
    v209        = L_xxzzzz*v70
    v293        = L_xyzzzz*v70
    v342        = L_xzzzzz*v70
    v389        = L_yyzzzz*v70
    v420        = L_yzzzzz*v70
    v127        = L_xxxzzzz*v70
    v186        = L_xxyzzzz*v70
    v229        = L_xxzzzzz*v70
    v273        = L_xyyzzzz*v70
    v306        = L_xyzzzzz*v70
    v375        = L_yyyzzzz*v70
    v400        = L_yyzzzzz*v70
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
    v235        = v141 + v144 + v138*v91 + 12.0d0*v142 + 6.0d0*v145 + 24.0d0*(L_xxxz + &
      v140) + 4.0d0*(v143 + v147)
    Ls_xxxz     = Ls_xxxz + (0.0416666666666667d0*(v141 + 12.0d0*v142 + v144 + 6.0d0*v145 + 4.0d0*( &
      v143 + v147)) + L_xxxxxxxz*v65 + L_xxxz + v140 + v148*v77 + v22* &
      v31 + v72*v91 + v76*v86)
    v170        = L_xxyyzzzz*v70
    v190        = v170 + 12.0d0*v168 + 4.0d0*(6.0d0*L_xxyy + 6.0d0*v166 + v169)
    v191        = v190*y
    v216        = v17*v190
    v279        = v167 + v190 + v138*v9 + 6.0d0*v171 + 4.0d0*v173
    Ls_xxyy     = Ls_xxyy + (0.0416666666666667d0*(v167 + 12.0d0*v168 + v170 + 6.0d0*v171 + 4.0d0*( &
      v169 + v173)) + L_xxxxxxyy*v65 + L_xxyy + v166 + v174*v77 + v31* &
      v4 + v72*v9 + v76*v99)
    v197        = L_xxyzzzzz*v70
    v233        = v197 + 12.0d0*v195 + 4.0d0*(6.0d0*L_xxyz + 6.0d0*v193 + v196)
    v234        = v233*y
    v312        = v194 + v233 + v138*v153 + 6.0d0*v198 + 4.0d0*v200
    Ls_xxyz     = Ls_xxyz + (0.0416666666666667d0*(v194 + 12.0d0*v195 + v197 + 6.0d0*v198 + 4.0d0*( &
      v196 + v200)) + L_xxxxxxyz*v65 + L_xxyz + v119*v76 + v153*v72 + &
      v193 + v201*v77 + v28*v31)
    v257        = L_xyyyzzzz*v70
    v277        = v257 + 12.0d0*v255 + 4.0d0*(6.0d0*L_xyyy + 6.0d0*v253 + v256)
    v278        = v277*y
    v298        = v17*v277
    v327        = v277*v32
    Ls_xyyy     = Ls_xyyy + (0.0416666666666667d0*(v254 + 12.0d0*v255 + v257 + 6.0d0*v258 + 4.0d0*( &
      v256 + v260)) + L_xxxxxyyy*v65 + L_xyyy + v11*v72 + v161*v76 + &
      v253 + v261*v77 + v31*v6)
    v284        = L_xyyzzzzz*v70
    v310        = v284 + 12.0d0*v282 + 4.0d0*(6.0d0*L_xyyz + 6.0d0*v280 + v283)
    v311        = v310*y
    v347        = v17*v310
    Ls_xyyz     = Ls_xyyz + (0.0416666666666667d0*(v281 + 12.0d0*v282 + v284 + 6.0d0*v285 + 4.0d0*( &
      v283 + v287)) + L_xxxxxyyz*v65 + L_xyyz + v181*v76 + v240*v72 + &
      v280 + v288*v77 + v31*v51)
    v364        = L_yyyyzzzz*v70
    v380        = v364 + 12.0d0*v362 + 4.0d0*(6.0d0*L_yyyy + 6.0d0*v361 + v363)
    Ls_yyyy     = Ls_yyyy + (0.0416666666666667d0*(12.0d0*v362 + 4.0d0*v363 + v364) + L_xxxxyyyy*v65 &
      + L_yyyy + L_yyyyyyyy*v130 + v13*v72 + v248*v76 + v31*v8 + v358* &
      v365 + v361 + v366*v367 + v77*(v11*v78 + v243 + 3.0d0*v247 + v259 &
      ))
    v384        = L_yyyzzzzz*v70
    v402        = v384 + 12.0d0*v382 + 4.0d0*(6.0d0*L_yyyz + 6.0d0*v381 + v383)
    Ls_yyyz     = Ls_yyyz + (0.0416666666666667d0*(12.0d0*v382 + 4.0d0*v383 + v384) + L_xxxxyyyz*v65 &
      + L_yyyyyyyz*v130 + L_yyyz + v268*v76 + v31*v92 + v353*v72 + v365 &
      *v371 + v366*v385 + v381 + v77*(v240*v78 + v263 + 3.0d0*v267 + &
      v286))
    c5          = c2*c3
    v128        = c5
    v427        = 0.00833333333333333d0*v128
    v320        = L_xzzzzz*v128
    v408        = L_yzzzzz*v128
    v210        = L_xxzzzzz*v128
    v294        = L_xyzzzzz*v128
    v343        = L_xzzzzzz*v128
    v390        = L_yyzzzzz*v128
    v421        = L_yzzzzzz*v128
    v129        = L_xxxzzzzz*v128
    v224        = v124 + v129 + 60.0d0*v125 + 20.0d0*v126 + v223*v7 + 120.0d0*(L_xxx + &
      v120) + 5.0d0*(v127 + v134) + 10.0d0*(v131 + v132)
    Ls_xxx      = Ls_xxx + (0.00833333333333333d0*(v124 + 60.0d0*v125 + 20.0d0*v126 + v129 + 5.0d0*( &
      v127 + v134) + 10.0d0*(v131 + v132)) + L_xxx + L_xxxxxxxx*v122 + &
      v0*v65 + v120 + v130*v7 + v135*v41 + v136*v79 + v137*v139)
    v187        = L_xxyzzzzz*v128
    v218        = v187 + 60.0d0*v184 + 20.0d0*v185 + 5.0d0*(24.0d0*L_xxy + 24.0d0*v182 + &
      v186)
    v219        = v218*y
    v301        = v183 + v218 + 5.0d0*v191 + v223*v9 + 10.0d0*(v188 + v189)
    Ls_xxy      = Ls_xxy + (0.00833333333333333d0*(v183 + 60.0d0*v184 + 20.0d0*v185 + v187 + 5.0d0*( &
      v186 + v191) + 10.0d0*(v188 + v189)) + L_xxxxxxxy*v122 + L_xxy + &
      v112*v136 + v130*v9 + v135*v58 + v137*v192 + v182 + v2*v65)
    v230        = L_xxzzzzzz*v128
    v350        = v226 + v230 + v153*v223 + 60.0d0*v227 + 20.0d0*v228 + 120.0d0*(L_xxz + &
      v225) + 5.0d0*(v229 + v234) + 10.0d0*(v231 + v232)
    Ls_xxz      = Ls_xxz + (0.00833333333333333d0*(v226 + 60.0d0*v227 + 20.0d0*v228 + v230 + 5.0d0*( &
      v229 + v234) + 10.0d0*(v231 + v232)) + L_xxxxxxxz*v122 + L_xxz + &
      v130*v153 + v135*v86 + v136*v148 + v137*v235 + v22*v65 + v225)
    v274        = L_xyyzzzzz*v128
    v299        = v274 + 60.0d0*v271 + 20.0d0*v272 + 5.0d0*(24.0d0*L_xyy + 24.0d0*v269 + &
      v273)
    v300        = v299*y
    v329        = v17*v299
    Ls_xyy      = Ls_xyy + (0.00833333333333333d0*(v270 + 60.0d0*v271 + 20.0d0*v272 + v274 + 5.0d0*( &
      v273 + v278) + 10.0d0*(v275 + v276)) + L_xxxxxxyy*v122 + L_xyy + &
      v11*v130 + v135*v99 + v136*v174 + v137*v279 + v269 + v4*v65)
    v307        = L_xyzzzzzz*v128
    v348        = v307 + 60.0d0*v304 + 20.0d0*v305 + 5.0d0*(24.0d0*L_xyz + 24.0d0*v302 + &
      v306)
    v349        = v348*y
    Ls_xyz      = Ls_xyz + (0.00833333333333333d0*(v303 + 60.0d0*v304 + 20.0d0*v305 + v307 + 5.0d0*( &
      v306 + v311) + 10.0d0*(v308 + v309)) + L_xxxxxxyz*v122 + L_xyz + &
      v119*v135 + v130*v240 + v136*v201 + v137*v312 + v28*v65 + v302)
    v376        = L_yyyzzzzz*v128
    v396        = v376 + 60.0d0*v373 + 20.0d0*v374 + 5.0d0*(24.0d0*L_yyy + 24.0d0*v372 + &
      v375)
    Ls_yyy      = Ls_yyy + (0.00833333333333333d0*(60.0d0*v373 + 20.0d0*v374 + 5.0d0*v375 + v376) + &
      L_xxxxxyyy*v122 + L_yyy + L_yyyyyyyy*v213 + v13*v130 + v135*v161 &
      + v136*v261 + v137*(v11*v138 + v254 + 6.0d0*v258 + 4.0d0*v260 + &
      v277) + v358*v377 + v367*v378 + v372 + v379*v380 + v6*v65)
    v401        = L_yyzzzzzz*v128
    v423        = v401 + 60.0d0*v398 + 20.0d0*v399 + 5.0d0*(24.0d0*L_yyz + 24.0d0*v397 + &
      v400)
    Ls_yyz      = Ls_yyz + (0.00833333333333333d0*(60.0d0*v398 + 20.0d0*v399 + 5.0d0*v400 + v401) + &
      L_xxxxxyyz*v122 + L_yyyyyyyz*v213 + L_yyz + v130*v353 + v135*v181 &
      + v136*v288 + v137*(v138*v240 + v281 + 6.0d0*v285 + 4.0d0*v287 + &
      v310) + v371*v377 + v378*v385 + v379*v402 + v397 + v51*v65)
    c6          = c3*c3
    v211        = c6
    v428        = 0.00138888888888889d0*v211
    v321        = L_xzzzzzz*v211
    v409        = L_yzzzzzz*v211
    v212        = L_xxzzzzzz*v211
    v337        = v206 + v212 + 360.0d0*v207 + 120.0d0*v208 + 30.0d0*v209 + 20.0d0*v215 + &
      v336*v9 + 720.0d0*(L_xx + v202) + 6.0d0*(v210 + v219) + 15.0d0*( &
      v214 + v216)
    Ls_xx       = Ls_xx + (0.00138888888888889d0*(v206 + 360.0d0*v207 + 120.0d0*v208 + 30.0d0*v209 &
      + v212 + 20.0d0*v215 + 6.0d0*(v210 + v219) + 15.0d0*(v214 + v216 &
      )) + L_xx + L_xxxxxxxx*v204 + v0*v122 + v139*v221 + v202 + v213* &
      v9 + v217*v41 + v220*v79 + v222*v224)
    v295        = L_xyzzzzzz*v211
    v330        = v295 + 360.0d0*v291 + 120.0d0*v292 + 30.0d0*v293 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v289 + v294)
    v331        = v330*y
    Ls_xy       = Ls_xy + (0.00138888888888889d0*(v290 + 360.0d0*v291 + 120.0d0*v292 + 30.0d0*v293 &
      + v295 + 20.0d0*v297 + 6.0d0*(v294 + v300) + 15.0d0*(v296 + v298 &
      )) + L_xxxxxxxy*v204 + L_xy + v11*v213 + v112*v220 + v122*v2 + &
      v192*v221 + v217*v58 + v222*v301 + v289)
    v344        = L_xzzzzzzz*v211
    Ls_xz       = Ls_xz + (0.00138888888888889d0*(v339 + 360.0d0*v340 + 120.0d0*v341 + 30.0d0*v342 &
      + v344 + 20.0d0*v346 + 6.0d0*(v343 + v349) + 15.0d0*(v345 + v347 &
      )) + L_xxxxxxxz*v204 + L_xz + v122*v22 + v148*v220 + v213*v240 + &
      v217*v86 + v221*v235 + v222*v350 + v338)
    v391        = L_yyzzzzzz*v211
    v416        = v391 + 360.0d0*v387 + 120.0d0*v388 + 30.0d0*v389 + 6.0d0*(120.0d0*L_yy + &
      120.0d0*v386 + v390)
    Ls_yy       = Ls_yy + (0.00138888888888889d0*(360.0d0*v387 + 120.0d0*v388 + 30.0d0*v389 + 6.0d0 &
      *v390 + v391) + L_xxxxxxyy*v204 + L_yy + L_yyyyyyyy*v324 + v122* &
      v4 + v13*v213 + v174*v220 + v217*v99 + v221*v279 + v222*(v11*v223 &
      + v270 + 10.0d0*v275 + 10.0d0*v276 + 5.0d0*v278 + v299) + v358* &
      v392 + v367*v393 + v380*v394 + v386 + v395*v396)
    v422        = L_yzzzzzzz*v211
    Ls_yz       = Ls_yz + (0.00138888888888889d0*(360.0d0*v418 + 120.0d0*v419 + 30.0d0*v420 + 6.0d0 &
      *v421 + v422) + L_xxxxxxyz*v204 + L_yyyyyyyz*v324 + L_yz + v119* &
      v217 + v122*v28 + v201*v220 + v213*v353 + v221*v312 + v222*(v223* &
      v240 + v303 + 10.0d0*v308 + 10.0d0*v309 + 5.0d0*v311 + v348) + &
      v371*v392 + v385*v393 + v394*v402 + v395*v423 + v417)
    c7          = c3*c4
    v322        = c7
    v429        = 0.000198412698412698d0*v322
    v323        = L_xzzzzzzz*v322
    Ls_x        = Ls_x + (0.000198412698412698d0*(v316 + 2520.0d0*v317 + 840.0d0*v318 + 210.0d0* &
      v319 + 42.0d0*v320 + v323 + 7.0d0*(v321 + v331) + 21.0d0*(v325 + &
      v329) + 35.0d0*(v326 + v327)) + L_x + L_xxxxxxxx*v314 + v0*v204 + &
      v11*v324 + v139*v333 + v224*v334 + v313 + v328*v41 + v332*v79 + &
      v335*v337)
    v410        = L_yzzzzzzz*v322
    Ls_y        = Ls_y + (0.000198412698412698d0*(2520.0d0*v405 + 840.0d0*v406 + 210.0d0*v407 + &
      42.0d0*v408 + 7.0d0*v409 + v410) + L_xxxxxxxy*v314 + L_y + &
      L_yyyyyyyy*v404 + v112*v332 + v13*v324 + v192*v333 + v2*v204 + &
      v301*v334 + v328*v58 + v335*(v11*v336 + v290 + 15.0d0*v296 + &
      20.0d0*v297 + 15.0d0*v298 + 6.0d0*v300 + v330) + v358*v411 + v367 &
      *v412 + v380*v413 + v396*v414 + v403 + v415*v416)
    Ls_z        = Ls_z + (L_z + L_xxxxxxxz*v314 + L_yyyyyyyz*v404 + L_zz*z + L_zzz*v424 + L_zzzz* &
      v425 + L_zzzzz*v426 + L_zzzzzz*v427 + L_zzzzzzz*v428 + L_zzzzzzzz &
      *v429 + v148*v332 + v204*v22 + v235*v333 + v324*v353 + v328*v86 + &
      v334*v350 + v335*(720.0d0*L_xz + v240*v336 + 720.0d0*v338 + v339 &
      + 360.0d0*v340 + 120.0d0*v341 + 30.0d0*v342 + 6.0d0*v343 + v344 + &
      15.0d0*v345 + 20.0d0*v346 + 15.0d0*v347 + 6.0d0*v349) + v371*v411 &
      + v385*v412 + v402*v413 + v414*v423 + v415*(720.0d0*L_yz + &
      720.0d0*v417 + 360.0d0*v418 + 120.0d0*v419 + 30.0d0*v420 + 6.0d0* &
      v421 + v422))
    c8          = c4*c4
    Ls_0        = Ls_0 + (2.48015873015873d-5*(L_xxxxxxxx*a8 + L_yyyyyyyy*b8 + L_zzzzzzzz*c8 + &
      70.0d0*(v139*v64 + v380*v66) + 8.0d0*(x*(5040.0d0*L_x + 7.0d0*v11 &
      *v205 + 5040.0d0*v313 + v316 + 2520.0d0*v317 + 840.0d0*v318 + &
      210.0d0*v319 + 42.0d0*v320 + 7.0d0*v321 + v323 + 21.0d0*v325 + &
      35.0d0*v326 + 35.0d0*v327 + 21.0d0*v329 + 7.0d0*v331) + y*( &
      5040.0d0*L_y + 5040.0d0*v403 + 2520.0d0*v405 + 840.0d0*v406 + &
      210.0d0*v407 + 42.0d0*v408 + 7.0d0*v409 + v410)) + 56.0d0*(v121* &
      v79 + v123*v367 + v224*v30 + v32*v396) + 28.0d0*(v15*v337 + v17* &
      v416 + v203*v41 + v205*v358)) + L_0 + L_z*z + L_zz*v424 + L_zzz* &
      v425 + L_zzzz*v426 + L_zzzzz*v427 + L_zzzzzz*v428 + L_zzzzzzz* &
      v429 + v0*v314 + v13*v404)
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
#undef  L_xxxyyz            
#undef  Ls_xxxyyz           
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  Ls_xyyyyy           
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  Ls_xyyyyz           
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
#undef  Ls_xxxxxyz          
#undef  L_xxxxxyz           
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
#undef  L_xyyyyyy           
#undef  Ls_xyyyyyy          
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
#undef  L_xyyyyyyz          
#undef  Ls_xyyyyyyz         
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L_add
    
! OPS  2123*ADD + 2*DIV + 2437*MUL + 119*NEG + POW + 52*SUB = 4734  (6200 before optimization)
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
                v155, v156, v16, v17, v18, v19, v2, v20, v21, v22, v23, v24,&
                v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
                v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46,&
                v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57,&
                v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68,&
                v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8,&
                v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90,&
                v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, D_0, D_x,&
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
                D_yyyyzzz, D_yyyzzzz, D_yyzzzzz, D_yzzzzzz, D_zzzzzzz,&
                D_xxxxxxxx, D_xxxxxxxy, D_xxxxxxxz, D_xxxxxxyy, D_xxxxxxyz,&
                D_xxxxxxzz, D_xxxxxyyy, D_xxxxxyyz, D_xxxxxyzz, D_xxxxxzzz,&
                D_xxxxyyyy, D_xxxxyyyz, D_xxxxyyzz, D_xxxxyzzz, D_xxxxzzzz,&
                D_xxxyyyyy, D_xxxyyyyz, D_xxxyyyzz, D_xxxyyzzz, D_xxxyzzzz,&
                D_xxxzzzzz, D_xxyyyyyy, D_xxyyyyyz, D_xxyyyyzz, D_xxyyyzzz,&
                D_xxyyzzzz, D_xxyzzzzz, D_xxzzzzzz, D_xyyyyyyy, D_xyyyyyyz,&
                D_xyyyyyzz, D_xyyyyzzz, D_xyyyzzzz, D_xyyzzzzz, D_xyzzzzzz,&
                D_xzzzzzzz, D_yyyyyyyy, D_yyyyyyyz, D_yyyyyyzz, D_yyyyyzzz,&
                D_yyyyzzzz, D_yyyzzzzz, D_yyzzzzzz, D_yzzzzzzz, D_zzzzzzzz
#define y                    r(1:2,2)
#define L_0                  L(1:2,0)
#define z                    r(1:2,3)
#define M_0                  M(1:2,0)
#define x                    r(1:2,1)
#define L_x                  L(1:2,1)
#define M_x                  M(1:2,1)
#define M_y                  M(1:2,2)
#define L_y                  L(1:2,2)
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
#define L_xyy                L(1:2,12)
#define M_xxz                M(1:2,12)
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
#define L_xxyyy              L(1:2,30)
#define M_yyyy               M(1:2,30)
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
#define M_xyyyyz             M(1:2,72)
#define L_xxxxyyyz           L(1:2,72)
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
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v152       = y*z
    v153       = x*y
    v138       = 15.0d0*v152
    v140       = v153
    v142       = v152
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v0         = a2
    v123       = 5.0d0*v0
    v5         = 3.0d0*v0
    v10        = v123
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
    v124       = v0*v1
    v7         = 3.0d0*v1
    v14        = 5.0d0*v1
    v125       = v1*v19
    v27        = v124
    v29        = 7.0d0*v1
    v59        = v125
    v80        = -429.0d0*v59
    v109       = 6435.0d0*v1
    b3         = b1*b2
    b4         = b2*b2
    v31        = b4
    v126       = v0*v31
    v65        = v126
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
    v127       = 3.0d0*h
    v128       = h*v0
    v129       = h*v1
    v130       = h*v19
    v132       = v1*v128
    v134       = h*v31
    v4         = -h
    v12        = v127
    v13        = -15.0d0*v1 + v12
    v17        = h*h
    v131       = v0*v17
    v133       = v1*v17
    v18        = 3.0d0*v17
    v20        = v128
    v21        = -30.0d0*v20
    v23        = -v12
    v25        = v23 + v24
    v30        = v23 + v29
    v32        = v129
    v33        = -30.0d0*v32
    v36        = -15.0d0*v17
    v37        = -45.0d0*v17
    v38        = v37 + 630.0d0*v128 - 945.0d0*v19
    v40        = -(v18 + 63.0d0*v27)
    v43        = v37 + 630.0d0*v129 - 945.0d0*v31
    v46        = h*h*h
    v47        = 5.0d0*v46
    v48        = -v47
    v50        = v130
    v51        = v131
    v53        = 5.0d0*v17
    v55        = v21 + v53 + v54
    v57        = v132
    v58        = -(v46 + 126.0d0*v57)
    v61        = -v0*v12
    v62        = -v1*v12
    v63        = v17 + 33.0d0*v27
    v64        = v133
    v67        = v33 + v53 + v66
    v69        = v134
    v72        = 35.0d0*v46
    v76        = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78        = v47 + 330.0d0*v57
    v79        = h*v54
    v84        = -18.0d0*v51 + v46 + v79
    v85        = 66.0d0*v57
    v148       = -v85
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
    v106       = v124*v17
    v107       = 5.0d0*(297.0d0*v106 + v97)
    v149       = -v107
    v108       = 45.0d0*v46
    v111       = -14175.0d0*v46
    v113       = -v108
    v114       = -1430.0d0*v57
    v150       = v113 + v114
    v116       = -1351350.0d0*v132
    v151       = v111 + v116
    v117       = v1*v46
    v118       = v128*v31
    v120       = -(3.0d0*v46 + 286.0d0*v57)
    v121       = v17*v31
    v122       = v103 + 385.0d0*v64 + 715.0d0*v68 - 1001.0d0*v69
    u2         = 1.0/h
    u          = sqrt(u2)
    D_0        = u
    u3         = u*u2
    v2         = u3
    D_x        = -v2*x
    D_y        = -v2*y
    D_z        = -v2*z
    u4         = u2*u2
    u5         = u2*u3
    v3         = u5
    v135       = 3.0d0*v3
    v6         = v135*x
    D_xx       = v3*(v4 + v5)
    D_xy       = v6*y
    D_xz       = v6*z
    D_yy       = v3*(v4 + v7)
    D_yz       = v135*v142
    D_zz       = -(D_xx + D_yy)
    u6         = u3*u3
    u7         = u3*u4
    v8         = u7
    v136       = 3.0d0*v8
    v9         = v8*x
    v11        = v136*(h - v10)
    D_xxx      = -3.0d0*v9*(v123 - v127)
    D_xxy      = v11*y
    D_xxz      = v11*z
    D_xyy      = v13*v9
    D_xyz      = -v138*v9
    D_xzz      = -(D_xxx + D_xyy)
    D_yyy      = v136*y*(v12 - v14)
    D_yyz      = v13*v8*z
    D_yzz      = -(D_xxy + D_yyy)
    D_zzz      = -(D_xxz + D_yyz)
    u8         = u4*u4
    u9         = u4*u5
    v15        = u9
    v137       = 15.0d0*v15*x
    v16        = 3.0d0*v15
    v22        = v137*y
    v26        = v137*z
    v28        = v138*v15
    D_xxxx     = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy     = v22*v25
    D_xxxz     = v25*v26
    D_xxyy     = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz     = v28*(v24 + v4)
    D_xxzz     = -(D_xxxx + D_xxyy)
    D_xyyy     = v22*v30
    D_xyyz     = v26*(v29 + v4)
    D_xyzz     = -(D_xxxy + D_xyyy)
    D_xzzz     = -(D_xxxz + D_xyyz)
    D_yyyy     = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz     = v28*v30
    D_yyzz     = -(D_xxyy + D_yyyy)
    D_yzzz     = -(D_xxyz + D_yyyz)
    D_zzzz     = -(D_xxzz + D_yyzz)
    u10        = u5*u5
    u11        = u5*u6
    v34        = u11
    v154       = v34*z
    v139       = 15.0d0*v34
    v35        = v139*x
    v39        = v154
    v41        = 315.0d0*v140*v154
    v42        = v139*y
    D_xxxxx    = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy    = v34*v38*y
    D_xxxxz    = v38*v39
    D_xxxyy    = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz    = v41*(h - v5)
    D_xxxzz    = -(D_xxxxx + D_xxxyy)
    D_xxyyy    = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz    = v39*(v36 - 945.0d0*v124 + 105.0d0*(v128 + v129))
    D_xxyzz    = -(D_xxxxy + D_xxyyy)
    D_xxzzz    = -(D_xxxxz + D_xxyyz)
    D_xyyyy    = v34*v43*x
    D_xyyyz    = v41*(h - v7)
    D_xyyzz    = -(D_xxxyy + D_xyyyy)
    D_xyzzz    = -(D_xxxyz + D_xyyyz)
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
    v155       = 315.0d0*v44
    v141       = v155*x
    v45        = 45.0d0*v44
    v52        = v141*y
    v56        = v141*z
    v60        = v142*v155
    D_xxxxxx   = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy   = v52*v55
    D_xxxxxz   = v55*v56
    D_xxxxyy   = v45*(v58 - 21.0d0*v130 + v17*v29 + 14.0d0*v51 + 231.0d0*v59)
    D_xxxxyz   = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz   = -(D_xxxxxx + D_xxxxyy)
    D_xxxyyy   = 945.0d0*v140*v44*(11.0d0*v27 + v17 + v61 + v62)
    D_xxxyyz   = v56*(-9.0d0*v32 + v61 + v63)
    D_xxxyzz   = -(D_xxxxxy + D_xxxyyy)
    D_xxxzzz   = -(D_xxxxxz + D_xxxyyz)
    D_xxyyyy   = v45*(v58 - 21.0d0*v134 + v17*v24 + 14.0d0*v64 + 231.0d0*v65)
    D_xxyyyz   = v60*(-9.0d0*v20 + v62 + v63)
    D_xxyyzz   = -(D_xxxxyy + D_xxyyyy)
    D_xxyzzz   = -(D_xxxxyz + D_xxyyyz)
    D_xxzzzz   = -(D_xxxxzz + D_xxyyzz)
    D_xyyyyy   = v52*v67
    D_xyyyyz   = v56*(-18.0d0*v32 + v17 + v66)
    D_xyyyzz   = -(D_xxxyyy + D_xyyyyy)
    D_xyyzzz   = -(D_xxxyyz + D_xyyyyz)
    D_xyzzzz   = -(D_xxxyzz + D_xyyyzz)
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
    v156       = 945.0d0*v70
    v143       = 315.0d0*v70
    v71        = v143*x
    v75        = v143*y
    v77        = v143*z
    v81        = v142*v156*x
    v83        = v156
    D_xxxxxxx  = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy  = v75*v76
    D_xxxxxxz  = v76*v77
    D_xxxxxyy  = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    D_xxxxxyz  = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz  = -(D_xxxxxxx + D_xxxxxyy)
    D_xxxxyyy  = -v83*y*(v148 + v1*v18 + v1*v82 - v84)
    D_xxxxyyz  = v77*(-v1*v86 + v80 + v84 + v87)
    D_xxxxyzz  = -(D_xxxxxxy + D_xxxxyyy)
    D_xxxxzzz  = -(D_xxxxxxz + D_xxxxyyz)
    D_xxxyyyy  = -v83*x*(v148 + v0*v18 + v0*v90 - v89)
    D_xxxyyyz  = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    D_xxxyyzz  = -(D_xxxxxyy + D_xxxyyyy)
    D_xxxyzzz  = -(D_xxxxxyz + D_xxxyyyz)
    D_xxxzzzz  = -(D_xxxxxzz + D_xxxyyzz)
    D_xxyyyyy  = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    D_xxyyyyz  = v77*(-v0*v86 + v87 + v89 + v91)
    D_xxyyyzz  = -(D_xxxxyyy + D_xxyyyyy)
    D_xxyyzzz  = -(D_xxxxyyz + D_xxyyyyz)
    D_xxyzzzz  = -(D_xxxxyzz + D_xxyyyzz)
    D_xxzzzzz  = -(D_xxxxzzz + D_xxyyzzz)
    D_xyyyyyy  = v71*v94
    D_xyyyyyz  = v81*(v36 + 110.0d0*v32 - v90)
    D_xyyyyzz  = -(D_xxxyyyy + D_xyyyyyy)
    D_xyyyzzz  = -(D_xxxyyyz + D_xyyyyyz)
    D_xyyzzzz  = -(D_xxxyyzz + D_xyyyyzz)
    D_xyzzzzz  = -(D_xxxyzzz + D_xyyyzzz)
    D_xzzzzzz  = -(D_xxxzzzz + D_xyyzzzz)
    D_yyyyyyy  = v75*(-315.0d0*v64 + 693.0d0*v69 + v72 + v93)
    D_yyyyyyz  = v77*v94
    D_yyyyyzz  = -(D_xxyyyyy + D_yyyyyyy)
    D_yyyyzzz  = -(D_xxyyyyz + D_yyyyyyz)
    D_yyyzzzz  = -(D_xxyyyzz + D_yyyyyzz)
    D_yyzzzzz  = -(D_xxyyzzz + D_yyyyzzz)
    D_yzzzzzz  = -(D_xxyzzzz + D_yyyzzzz)
    D_zzzzzzz  = -(D_xxzzzzz + D_yyzzzzz)
    u16        = u8*u8
    u17        = u8*u9
    v95        = u17
    v144       = v153*v95
    v145       = v95*z
    v146       = v145*x
    v147       = v145*y
    v96        = 315.0d0*v95
    v102       = 2835.0d0*v144
    v105       = 2835.0d0*v146
    v110       = v147
    v112       = 945.0d0*v144
    v115       = v146
    v119       = 2835.0d0*v147
    D_xxxxxxxx = v96*(v98 + 6435.0d0*a8 + 6930.0d0*v100 - (1260.0d0*v101 + v49*v99))
    L_xxxxxxxx = D_xxxxxxxx*M_0
    D_xxxxxxxy = v102*v104
    L_xxxxxxxy = D_xxxxxxxy*M_0
    D_xxxxxxxz = v104*v105
    L_xxxxxxx  = D_xxxxxxx*M_0 + D_xxxxxxxx*M_x + D_xxxxxxxy*M_y + D_xxxxxxxz*M_z
    L_xxxxxxxz = D_xxxxxxxz*M_0
    D_xxxxxxyy = -v96*(v149 + h*v73 + v1*v108 + 135.0d0*v101 + v109*v50 - (495.0d0*v100 + &
      v109*v49))
    L_xxxxxxyy = D_xxxxxxyy*M_0
    D_xxxxxxyz = v110*(v111 + 467775.0d0*v131 + 155925.0d0*(-13.0d0*v130 + 13.0d0*v49))
    L_xxxxxxy  = D_xxxxxxxy*M_x + D_xxxxxxy*M_0 + D_xxxxxxyy*M_y + D_xxxxxxyz*M_z
    L_xxxxxxyz = D_xxxxxxyz*M_0
    D_xxxxxxzz = -(D_xxxxxxxx + D_xxxxxxyy)
    L_xxxxxx   = D_xxxxxx*M_0 + D_xxxxxxx*M_x + D_xxxxxxxx*M_xx + D_xxxxxxxy*M_xy + &
      D_xxxxxxxz*M_xz + D_xxxxxxy*M_y + D_xxxxxxyy*M_yy + D_xxxxxxyz* &
      M_yz + D_xxxxxxz*M_z + D_xxxxxxzz*M_zz
    L_xxxxxxz  = D_xxxxxxxz*M_x + D_xxxxxxyz*M_y + D_xxxxxxz*M_0 + D_xxxxxxzz*M_z
    D_xxxxxyyy = v112*(v150 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    L_xxxxxyyy = D_xxxxxyyy*M_0
    D_xxxxxyyz = v115*(v151 + 2027025.0d0*v125 - 135135.0d0*v130 + 103950.0d0*v131 + &
      155925.0d0*v133)
    L_xxxxxyy  = D_xxxxxxyy*M_x + D_xxxxxyy*M_0 + D_xxxxxyyy*M_y + D_xxxxxyyz*M_z
    L_xxxxxyyz = D_xxxxxyyz*M_0
    D_xxxxxyzz = -(D_xxxxxxxy + D_xxxxxyyy)
    L_xxxxxy   = D_xxxxxxxy*M_xx + D_xxxxxxy*M_x + D_xxxxxxyy*M_xy + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyy*M_y + D_xxxxxyyy*M_yy + D_xxxxxyyz*M_yz &
      + D_xxxxxyz*M_z + D_xxxxxyzz*M_zz
    L_xxxxxyz  = D_xxxxxxyz*M_x + D_xxxxxyyz*M_y + D_xxxxxyz*M_0 + D_xxxxxyzz*M_z
    D_xxxxxzzz = -(D_xxxxxxxz + D_xxxxxyyz)
    L_xxxxx    = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxxx*M_xx + D_xxxxxxxx*M_xxx + &
      D_xxxxxxxy*M_xxy + D_xxxxxxxz*M_xxz + D_xxxxxxy*M_xy + D_xxxxxxyy &
      *M_xyy + D_xxxxxxyz*M_xyz + D_xxxxxxz*M_xz + D_xxxxxxzz*M_xzz + &
      D_xxxxxy*M_y + D_xxxxxyy*M_yy + D_xxxxxyyy*M_yyy + D_xxxxxyyz* &
      M_yyz + D_xxxxxyz*M_yz + D_xxxxxyzz*M_yzz + D_xxxxxz*M_z + &
      D_xxxxxzz*M_zz + D_xxxxxzzz*M_zzz
    L_xxxxxz   = D_xxxxxxxz*M_xx + D_xxxxxxyz*M_xy + D_xxxxxxz*M_x + D_xxxxxxzz*M_xz + &
      D_xxxxxyyz*M_yy + D_xxxxxyz*M_y + D_xxxxxyzz*M_yz + D_xxxxxz*M_0 &
      + D_xxxxxzz*M_z + D_xxxxxzzz*M_zz
    D_xxxxyyyy = 945.0d0*v95*(v97 + 396.0d0*v106 + v17*v54 + v17*v66 + 2145.0d0*v19*v31 - &
      18.0d0*(v101 + v117) - 858.0d0*(v1*v50 + v118))
    L_xxxxyyyy = D_xxxxyyyy*M_0
    D_xxxxyyyz = v119*(v120 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    L_xxxxyyy  = D_xxxxxyyy*M_x + D_xxxxyyy*M_0 + D_xxxxyyyy*M_y + D_xxxxyyyz*M_z
    L_xxxxyyyz = D_xxxxyyyz*M_0
    D_xxxxyyzz = -(D_xxxxxxyy + D_xxxxyyyy)
    L_xxxxyy   = D_xxxxxxyy*M_xx + D_xxxxxyy*M_x + D_xxxxxyyy*M_xy + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyy*M_y + D_xxxxyyyy*M_yy + D_xxxxyyyz*M_yz &
      + D_xxxxyyz*M_z + D_xxxxyyzz*M_zz
    L_xxxxyyz  = D_xxxxxyyz*M_x + D_xxxxyyyz*M_y + D_xxxxyyz*M_0 + D_xxxxyyzz*M_z
    D_xxxxyzzz = -(D_xxxxxxyz + D_xxxxyyyz)
    L_xxxxy    = D_xxxxxxxy*M_xxx + D_xxxxxxy*M_xx + D_xxxxxxyy*M_xxy + D_xxxxxxyz*M_xxz &
      + D_xxxxxy*M_x + D_xxxxxyy*M_xy + D_xxxxxyyy*M_xyy + D_xxxxxyyz* &
      M_xyz + D_xxxxxyz*M_xz + D_xxxxxyzz*M_xzz + D_xxxxy*M_0 + &
      D_xxxxyy*M_y + D_xxxxyyy*M_yy + D_xxxxyyyy*M_yyy + D_xxxxyyyz* &
      M_yyz + D_xxxxyyz*M_yz + D_xxxxyyzz*M_yzz + D_xxxxyz*M_z + &
      D_xxxxyzz*M_zz + D_xxxxyzzz*M_zzz
    L_xxxxyz   = D_xxxxxxyz*M_xx + D_xxxxxyyz*M_xy + D_xxxxxyz*M_x + D_xxxxxyzz*M_xz + &
      D_xxxxyyyz*M_yy + D_xxxxyyz*M_y + D_xxxxyyzz*M_yz + D_xxxxyz*M_0 &
      + D_xxxxyzz*M_z + D_xxxxyzzz*M_zz
    D_xxxxzzzz = -(D_xxxxxxzz + D_xxxxyyzz)
    L_xxxx     = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxxx*M_xxx + D_xxxxxxxx* &
      M_xxxx + D_xxxxxxxy*M_xxxy + D_xxxxxxxz*M_xxxz + D_xxxxxxy*M_xxy &
      + D_xxxxxxyy*M_xxyy + D_xxxxxxyz*M_xxyz + D_xxxxxxz*M_xxz + &
      D_xxxxxxzz*M_xxzz + D_xxxxxy*M_xy + D_xxxxxyy*M_xyy + D_xxxxxyyy* &
      M_xyyy + D_xxxxxyyz*M_xyyz + D_xxxxxyz*M_xyz + D_xxxxxyzz*M_xyzz &
      + D_xxxxxz*M_xz + D_xxxxxzz*M_xzz + D_xxxxxzzz*M_xzzz + D_xxxxy* &
      M_y + D_xxxxyy*M_yy + D_xxxxyyy*M_yyy + D_xxxxyyyy*M_yyyy + &
      D_xxxxyyyz*M_yyyz + D_xxxxyyz*M_yyz + D_xxxxyyzz*M_yyzz + &
      D_xxxxyz*M_yz + D_xxxxyzz*M_yzz + D_xxxxyzzz*M_yzzz + D_xxxxz*M_z &
      + D_xxxxzz*M_zz + D_xxxxzzz*M_zzz + D_xxxxzzzz*M_zzzz
    L_xxxxz    = D_xxxxxxxz*M_xxx + D_xxxxxxyz*M_xxy + D_xxxxxxz*M_xx + D_xxxxxxzz*M_xxz &
      + D_xxxxxyyz*M_xyy + D_xxxxxyz*M_xy + D_xxxxxyzz*M_xyz + D_xxxxxz &
      *M_x + D_xxxxxzz*M_xz + D_xxxxxzzz*M_xzz + D_xxxxyyyz*M_yyy + &
      D_xxxxyyz*M_yy + D_xxxxyyzz*M_yyz + D_xxxxyz*M_y + D_xxxxyzz*M_yz &
      + D_xxxxyzzz*M_yzz + D_xxxxz*M_0 + D_xxxxzz*M_z + D_xxxxzzz*M_zz &
      + D_xxxxzzzz*M_zzz
    D_xxxyyyyy = v112*(v150 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    L_xxxyyyyy = D_xxxyyyyy*M_0
    D_xxxyyyyz = v105*(v120 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    L_xxxyyyy  = D_xxxxyyyy*M_x + D_xxxyyyy*M_0 + D_xxxyyyyy*M_y + D_xxxyyyyz*M_z
    L_xxxyyyyz = D_xxxyyyyz*M_0
    D_xxxyyyzz = -(D_xxxxxyyy + D_xxxyyyyy)
    L_xxxyyy   = D_xxxxxyyy*M_xx + D_xxxxyyy*M_x + D_xxxxyyyy*M_xy + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyy*M_y + D_xxxyyyyy*M_yy + D_xxxyyyyz*M_yz &
      + D_xxxyyyz*M_z + D_xxxyyyzz*M_zz
    L_xxxyyyz  = D_xxxxyyyz*M_x + D_xxxyyyyz*M_y + D_xxxyyyz*M_0 + D_xxxyyyzz*M_z
    D_xxxyyzzz = -(D_xxxxxyyz + D_xxxyyyyz)
    L_xxxyy    = D_xxxxxxyy*M_xxx + D_xxxxxyy*M_xx + D_xxxxxyyy*M_xxy + D_xxxxxyyz*M_xxz &
      + D_xxxxyy*M_x + D_xxxxyyy*M_xy + D_xxxxyyyy*M_xyy + D_xxxxyyyz* &
      M_xyz + D_xxxxyyz*M_xz + D_xxxxyyzz*M_xzz + D_xxxyy*M_0 + &
      D_xxxyyy*M_y + D_xxxyyyy*M_yy + D_xxxyyyyy*M_yyy + D_xxxyyyyz* &
      M_yyz + D_xxxyyyz*M_yz + D_xxxyyyzz*M_yzz + D_xxxyyz*M_z + &
      D_xxxyyzz*M_zz + D_xxxyyzzz*M_zzz
    L_xxxyyz   = D_xxxxxyyz*M_xx + D_xxxxyyyz*M_xy + D_xxxxyyz*M_x + D_xxxxyyzz*M_xz + &
      D_xxxyyyyz*M_yy + D_xxxyyyz*M_y + D_xxxyyyzz*M_yz + D_xxxyyz*M_0 &
      + D_xxxyyzz*M_z + D_xxxyyzzz*M_zz
    D_xxxyzzzz = -(D_xxxxxyzz + D_xxxyyyzz)
    L_xxxy     = D_xxxxxxxy*M_xxxx + D_xxxxxxy*M_xxx + D_xxxxxxyy*M_xxxy + D_xxxxxxyz* &
      M_xxxz + D_xxxxxy*M_xx + D_xxxxxyy*M_xxy + D_xxxxxyyy*M_xxyy + &
      D_xxxxxyyz*M_xxyz + D_xxxxxyz*M_xxz + D_xxxxxyzz*M_xxzz + D_xxxxy &
      *M_x + D_xxxxyy*M_xy + D_xxxxyyy*M_xyy + D_xxxxyyyy*M_xyyy + &
      D_xxxxyyyz*M_xyyz + D_xxxxyyz*M_xyz + D_xxxxyyzz*M_xyzz + &
      D_xxxxyz*M_xz + D_xxxxyzz*M_xzz + D_xxxxyzzz*M_xzzz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyyy*M_yyy + D_xxxyyyyy* &
      M_yyyy + D_xxxyyyyz*M_yyyz + D_xxxyyyz*M_yyz + D_xxxyyyzz*M_yyzz &
      + D_xxxyyz*M_yz + D_xxxyyzz*M_yzz + D_xxxyyzzz*M_yzzz + D_xxxyz* &
      M_z + D_xxxyzz*M_zz + D_xxxyzzz*M_zzz + D_xxxyzzzz*M_zzzz
    L_xxxyz    = D_xxxxxxyz*M_xxx + D_xxxxxyyz*M_xxy + D_xxxxxyz*M_xx + D_xxxxxyzz*M_xxz &
      + D_xxxxyyyz*M_xyy + D_xxxxyyz*M_xy + D_xxxxyyzz*M_xyz + D_xxxxyz &
      *M_x + D_xxxxyzz*M_xz + D_xxxxyzzz*M_xzz + D_xxxyyyyz*M_yyy + &
      D_xxxyyyz*M_yy + D_xxxyyyzz*M_yyz + D_xxxyyz*M_y + D_xxxyyzz*M_yz &
      + D_xxxyyzzz*M_yzz + D_xxxyz*M_0 + D_xxxyzz*M_z + D_xxxyzzz*M_zz &
      + D_xxxyzzzz*M_zzz
    D_xxxzzzzz = -(D_xxxxxzzz + D_xxxyyzzz)
    L_xxx      = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxxx* &
      M_xxxx + D_xxxxxxxx*M_xxxxx + D_xxxxxxxy*M_xxxxy + D_xxxxxxxz* &
      M_xxxxz + D_xxxxxxy*M_xxxy + D_xxxxxxyy*M_xxxyy + D_xxxxxxyz* &
      M_xxxyz + D_xxxxxxz*M_xxxz + D_xxxxxxzz*M_xxxzz + D_xxxxxy*M_xxy &
      + D_xxxxxyy*M_xxyy + D_xxxxxyyy*M_xxyyy + D_xxxxxyyz*M_xxyyz + &
      D_xxxxxyz*M_xxyz + D_xxxxxyzz*M_xxyzz + D_xxxxxz*M_xxz + &
      D_xxxxxzz*M_xxzz + D_xxxxxzzz*M_xxzzz + D_xxxxy*M_xy + D_xxxxyy* &
      M_xyy + D_xxxxyyy*M_xyyy + D_xxxxyyyy*M_xyyyy + D_xxxxyyyz* &
      M_xyyyz + D_xxxxyyz*M_xyyz + D_xxxxyyzz*M_xyyzz + D_xxxxyz*M_xyz &
      + D_xxxxyzz*M_xyzz + D_xxxxyzzz*M_xyzzz + D_xxxxz*M_xz + D_xxxxzz &
      *M_xzz + D_xxxxzzz*M_xzzz + D_xxxxzzzz*M_xzzzz + D_xxxy*M_y + &
      D_xxxyy*M_yy + D_xxxyyy*M_yyy + D_xxxyyyy*M_yyyy + D_xxxyyyyy* &
      M_yyyyy + D_xxxyyyyz*M_yyyyz + D_xxxyyyz*M_yyyz + D_xxxyyyzz* &
      M_yyyzz + D_xxxyyz*M_yyz + D_xxxyyzz*M_yyzz + D_xxxyyzzz*M_yyzzz &
      + D_xxxyz*M_yz + D_xxxyzz*M_yzz + D_xxxyzzz*M_yzzz + D_xxxyzzzz* &
      M_yzzzz + D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz + D_xxxzzzz* &
      M_zzzz + D_xxxzzzzz*M_zzzzz
    L_xxxz     = D_xxxxxxxz*M_xxxx + D_xxxxxxyz*M_xxxy + D_xxxxxxz*M_xxx + D_xxxxxxzz* &
      M_xxxz + D_xxxxxyyz*M_xxyy + D_xxxxxyz*M_xxy + D_xxxxxyzz*M_xxyz &
      + D_xxxxxz*M_xx + D_xxxxxzz*M_xxz + D_xxxxxzzz*M_xxzz + &
      D_xxxxyyyz*M_xyyy + D_xxxxyyz*M_xyy + D_xxxxyyzz*M_xyyz + &
      D_xxxxyz*M_xy + D_xxxxyzz*M_xyz + D_xxxxyzzz*M_xyzz + D_xxxxz*M_x &
      + D_xxxxzz*M_xz + D_xxxxzzz*M_xzz + D_xxxxzzzz*M_xzzz + &
      D_xxxyyyyz*M_yyyy + D_xxxyyyz*M_yyy + D_xxxyyyzz*M_yyyz + &
      D_xxxyyz*M_yy + D_xxxyyzz*M_yyz + D_xxxyyzzz*M_yyzz + D_xxxyz*M_y &
      + D_xxxyzz*M_yz + D_xxxyzzz*M_yzz + D_xxxyzzzz*M_yzzz + D_xxxz* &
      M_0 + D_xxxzz*M_z + D_xxxzzz*M_zz + D_xxxzzzz*M_zzz + D_xxxzzzzz* &
      M_zzzz
    D_xxyyyyyy = -v96*(v149 + h*v92 + v0*v108 + 135.0d0*v117 - 495.0d0*v121 + 6435.0d0*( &
      -v0*v68 + v118))
    L_xxyyyyyy = D_xxyyyyyy*M_0
    D_xxyyyyyz = v110*(v151 + 2027025.0d0*v126 + 155925.0d0*v131 + 103950.0d0*v133 - &
      135135.0d0*v134)
    L_xxyyyyy  = D_xxxyyyyy*M_x + D_xxyyyyy*M_0 + D_xxyyyyyy*M_y + D_xxyyyyyz*M_z
    L_xxyyyyyz = D_xxyyyyyz*M_0
    D_xxyyyyzz = -(D_xxxxyyyy + D_xxyyyyyy)
    L_xxyyyy   = D_xxxxyyyy*M_xx + D_xxxyyyy*M_x + D_xxxyyyyy*M_xy + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyy*M_y + D_xxyyyyyy*M_yy + D_xxyyyyyz*M_yz &
      + D_xxyyyyz*M_z + D_xxyyyyzz*M_zz
    L_xxyyyyz  = D_xxxyyyyz*M_x + D_xxyyyyyz*M_y + D_xxyyyyz*M_0 + D_xxyyyyzz*M_z
    D_xxyyyzzz = -(D_xxxxyyyz + D_xxyyyyyz)
    L_xxyyy    = D_xxxxxyyy*M_xxx + D_xxxxyyy*M_xx + D_xxxxyyyy*M_xxy + D_xxxxyyyz*M_xxz &
      + D_xxxyyy*M_x + D_xxxyyyy*M_xy + D_xxxyyyyy*M_xyy + D_xxxyyyyz* &
      M_xyz + D_xxxyyyz*M_xz + D_xxxyyyzz*M_xzz + D_xxyyy*M_0 + &
      D_xxyyyy*M_y + D_xxyyyyy*M_yy + D_xxyyyyyy*M_yyy + D_xxyyyyyz* &
      M_yyz + D_xxyyyyz*M_yz + D_xxyyyyzz*M_yzz + D_xxyyyz*M_z + &
      D_xxyyyzz*M_zz + D_xxyyyzzz*M_zzz
    L_xxyyyz   = D_xxxxyyyz*M_xx + D_xxxyyyyz*M_xy + D_xxxyyyz*M_x + D_xxxyyyzz*M_xz + &
      D_xxyyyyyz*M_yy + D_xxyyyyz*M_y + D_xxyyyyzz*M_yz + D_xxyyyz*M_0 &
      + D_xxyyyzz*M_z + D_xxyyyzzz*M_zz
    D_xxyyzzzz = -(D_xxxxyyzz + D_xxyyyyzz)
    L_xxyy     = D_xxxxxxyy*M_xxxx + D_xxxxxyy*M_xxx + D_xxxxxyyy*M_xxxy + D_xxxxxyyz* &
      M_xxxz + D_xxxxyy*M_xx + D_xxxxyyy*M_xxy + D_xxxxyyyy*M_xxyy + &
      D_xxxxyyyz*M_xxyz + D_xxxxyyz*M_xxz + D_xxxxyyzz*M_xxzz + D_xxxyy &
      *M_x + D_xxxyyy*M_xy + D_xxxyyyy*M_xyy + D_xxxyyyyy*M_xyyy + &
      D_xxxyyyyz*M_xyyz + D_xxxyyyz*M_xyz + D_xxxyyyzz*M_xyzz + &
      D_xxxyyz*M_xz + D_xxxyyzz*M_xzz + D_xxxyyzzz*M_xzzz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyyy*M_yyy + D_xxyyyyyy* &
      M_yyyy + D_xxyyyyyz*M_yyyz + D_xxyyyyz*M_yyz + D_xxyyyyzz*M_yyzz &
      + D_xxyyyz*M_yz + D_xxyyyzz*M_yzz + D_xxyyyzzz*M_yzzz + D_xxyyz* &
      M_z + D_xxyyzz*M_zz + D_xxyyzzz*M_zzz + D_xxyyzzzz*M_zzzz
    L_xxyyz    = D_xxxxxyyz*M_xxx + D_xxxxyyyz*M_xxy + D_xxxxyyz*M_xx + D_xxxxyyzz*M_xxz &
      + D_xxxyyyyz*M_xyy + D_xxxyyyz*M_xy + D_xxxyyyzz*M_xyz + D_xxxyyz &
      *M_x + D_xxxyyzz*M_xz + D_xxxyyzzz*M_xzz + D_xxyyyyyz*M_yyy + &
      D_xxyyyyz*M_yy + D_xxyyyyzz*M_yyz + D_xxyyyz*M_y + D_xxyyyzz*M_yz &
      + D_xxyyyzzz*M_yzz + D_xxyyz*M_0 + D_xxyyzz*M_z + D_xxyyzzz*M_zz &
      + D_xxyyzzzz*M_zzz
    D_xxyzzzzz = -(D_xxxxyzzz + D_xxyyyzzz)
    L_xxy      = D_xxxxxxxy*M_xxxxx + D_xxxxxxy*M_xxxx + D_xxxxxxyy*M_xxxxy + D_xxxxxxyz* &
      M_xxxxz + D_xxxxxy*M_xxx + D_xxxxxyy*M_xxxy + D_xxxxxyyy*M_xxxyy &
      + D_xxxxxyyz*M_xxxyz + D_xxxxxyz*M_xxxz + D_xxxxxyzz*M_xxxzz + &
      D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyyy*M_xxyy + D_xxxxyyyy* &
      M_xxyyy + D_xxxxyyyz*M_xxyyz + D_xxxxyyz*M_xxyz + D_xxxxyyzz* &
      M_xxyzz + D_xxxxyz*M_xxz + D_xxxxyzz*M_xxzz + D_xxxxyzzz*M_xxzzz &
      + D_xxxy*M_x + D_xxxyy*M_xy + D_xxxyyy*M_xyy + D_xxxyyyy*M_xyyy + &
      D_xxxyyyyy*M_xyyyy + D_xxxyyyyz*M_xyyyz + D_xxxyyyz*M_xyyz + &
      D_xxxyyyzz*M_xyyzz + D_xxxyyz*M_xyz + D_xxxyyzz*M_xyzz + &
      D_xxxyyzzz*M_xyzzz + D_xxxyz*M_xz + D_xxxyzz*M_xzz + D_xxxyzzz* &
      M_xzzz + D_xxxyzzzz*M_xzzzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy* &
      M_yy + D_xxyyyy*M_yyy + D_xxyyyyy*M_yyyy + D_xxyyyyyy*M_yyyyy + &
      D_xxyyyyyz*M_yyyyz + D_xxyyyyz*M_yyyz + D_xxyyyyzz*M_yyyzz + &
      D_xxyyyz*M_yyz + D_xxyyyzz*M_yyzz + D_xxyyyzzz*M_yyzzz + D_xxyyz* &
      M_yz + D_xxyyzz*M_yzz + D_xxyyzzz*M_yzzz + D_xxyyzzzz*M_yzzzz + &
      D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz + D_xxyzzzz*M_zzzz + &
      D_xxyzzzzz*M_zzzzz
    L_xxyz     = D_xxxxxxyz*M_xxxx + D_xxxxxyyz*M_xxxy + D_xxxxxyz*M_xxx + D_xxxxxyzz* &
      M_xxxz + D_xxxxyyyz*M_xxyy + D_xxxxyyz*M_xxy + D_xxxxyyzz*M_xxyz &
      + D_xxxxyz*M_xx + D_xxxxyzz*M_xxz + D_xxxxyzzz*M_xxzz + &
      D_xxxyyyyz*M_xyyy + D_xxxyyyz*M_xyy + D_xxxyyyzz*M_xyyz + &
      D_xxxyyz*M_xy + D_xxxyyzz*M_xyz + D_xxxyyzzz*M_xyzz + D_xxxyz*M_x &
      + D_xxxyzz*M_xz + D_xxxyzzz*M_xzz + D_xxxyzzzz*M_xzzz + &
      D_xxyyyyyz*M_yyyy + D_xxyyyyz*M_yyy + D_xxyyyyzz*M_yyyz + &
      D_xxyyyz*M_yy + D_xxyyyzz*M_yyz + D_xxyyyzzz*M_yyzz + D_xxyyz*M_y &
      + D_xxyyzz*M_yz + D_xxyyzzz*M_yzz + D_xxyyzzzz*M_yzzz + D_xxyz* &
      M_0 + D_xxyzz*M_z + D_xxyzzz*M_zz + D_xxyzzzz*M_zzz + D_xxyzzzzz* &
      M_zzzz
    D_xxzzzzzz = -(D_xxxxzzzz + D_xxyyzzzz)
    L_xx       = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxxx*M_xxxxx + D_xxxxxxxx*M_xxxxxx + D_xxxxxxxy*M_xxxxxy + &
      D_xxxxxxxz*M_xxxxxz + D_xxxxxxy*M_xxxxy + D_xxxxxxyy*M_xxxxyy + &
      D_xxxxxxyz*M_xxxxyz + D_xxxxxxz*M_xxxxz + D_xxxxxxzz*M_xxxxzz + &
      D_xxxxxy*M_xxxy + D_xxxxxyy*M_xxxyy + D_xxxxxyyy*M_xxxyyy + &
      D_xxxxxyyz*M_xxxyyz + D_xxxxxyz*M_xxxyz + D_xxxxxyzz*M_xxxyzz + &
      D_xxxxxz*M_xxxz + D_xxxxxzz*M_xxxzz + D_xxxxxzzz*M_xxxzzz + &
      D_xxxxy*M_xxy + D_xxxxyy*M_xxyy + D_xxxxyyy*M_xxyyy + D_xxxxyyyy* &
      M_xxyyyy + D_xxxxyyyz*M_xxyyyz + D_xxxxyyz*M_xxyyz + D_xxxxyyzz* &
      M_xxyyzz + D_xxxxyz*M_xxyz + D_xxxxyzz*M_xxyzz + D_xxxxyzzz* &
      M_xxyzzz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + D_xxxxzzz*M_xxzzz + &
      D_xxxxzzzz*M_xxzzzz + D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy* &
      M_xyyy + D_xxxyyyy*M_xyyyy + D_xxxyyyyy*M_xyyyyy + D_xxxyyyyz* &
      M_xyyyyz + D_xxxyyyz*M_xyyyz + D_xxxyyyzz*M_xyyyzz + D_xxxyyz* &
      M_xyyz + D_xxxyyzz*M_xyyzz + D_xxxyyzzz*M_xyyzzz + D_xxxyz*M_xyz &
      + D_xxxyzz*M_xyzz + D_xxxyzzz*M_xyzzz + D_xxxyzzzz*M_xyzzzz + &
      D_xxxz*M_xz + D_xxxzz*M_xzz + D_xxxzzz*M_xzzz + D_xxxzzzz*M_xzzzz &
      + D_xxxzzzzz*M_xzzzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyyy*M_yyyyy + D_xxyyyyyy*M_yyyyyy + &
      D_xxyyyyyz*M_yyyyyz + D_xxyyyyz*M_yyyyz + D_xxyyyyzz*M_yyyyzz + &
      D_xxyyyz*M_yyyz + D_xxyyyzz*M_yyyzz + D_xxyyyzzz*M_yyyzzz + &
      D_xxyyz*M_yyz + D_xxyyzz*M_yyzz + D_xxyyzzz*M_yyzzz + D_xxyyzzzz* &
      M_yyzzzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz*M_yzzz + &
      D_xxyzzzz*M_yzzzz + D_xxyzzzzz*M_yzzzzz + D_xxz*M_z + D_xxzz*M_zz &
      + D_xxzzz*M_zzz + D_xxzzzz*M_zzzz + D_xxzzzzz*M_zzzzz + &
      D_xxzzzzzz*M_zzzzzz
    L_xxz      = D_xxxxxxxz*M_xxxxx + D_xxxxxxyz*M_xxxxy + D_xxxxxxz*M_xxxx + D_xxxxxxzz* &
      M_xxxxz + D_xxxxxyyz*M_xxxyy + D_xxxxxyz*M_xxxy + D_xxxxxyzz* &
      M_xxxyz + D_xxxxxz*M_xxx + D_xxxxxzz*M_xxxz + D_xxxxxzzz*M_xxxzz &
      + D_xxxxyyyz*M_xxyyy + D_xxxxyyz*M_xxyy + D_xxxxyyzz*M_xxyyz + &
      D_xxxxyz*M_xxy + D_xxxxyzz*M_xxyz + D_xxxxyzzz*M_xxyzz + D_xxxxz* &
      M_xx + D_xxxxzz*M_xxz + D_xxxxzzz*M_xxzz + D_xxxxzzzz*M_xxzzz + &
      D_xxxyyyyz*M_xyyyy + D_xxxyyyz*M_xyyy + D_xxxyyyzz*M_xyyyz + &
      D_xxxyyz*M_xyy + D_xxxyyzz*M_xyyz + D_xxxyyzzz*M_xyyzz + D_xxxyz* &
      M_xy + D_xxxyzz*M_xyz + D_xxxyzzz*M_xyzz + D_xxxyzzzz*M_xyzzz + &
      D_xxxz*M_x + D_xxxzz*M_xz + D_xxxzzz*M_xzz + D_xxxzzzz*M_xzzz + &
      D_xxxzzzzz*M_xzzzz + D_xxyyyyyz*M_yyyyy + D_xxyyyyz*M_yyyy + &
      D_xxyyyyzz*M_yyyyz + D_xxyyyz*M_yyy + D_xxyyyzz*M_yyyz + &
      D_xxyyyzzz*M_yyyzz + D_xxyyz*M_yy + D_xxyyzz*M_yyz + D_xxyyzzz* &
      M_yyzz + D_xxyyzzzz*M_yyzzz + D_xxyz*M_y + D_xxyzz*M_yz + &
      D_xxyzzz*M_yzz + D_xxyzzzz*M_yzzz + D_xxyzzzzz*M_yzzzz + D_xxz* &
      M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz + D_xxzzzzz* &
      M_zzzz + D_xxzzzzzz*M_zzzzz
    D_xyyyyyyy = v102*v122
    L_xyyyyyyy = D_xyyyyyyy*M_0
    D_xyyyyyyz = v115*(v111 + 467775.0d0*v133 + 155925.0d0*(-13.0d0*v134 + 13.0d0*v68))
    L_xyyyyyy  = D_xxyyyyyy*M_x + D_xyyyyyy*M_0 + D_xyyyyyyy*M_y + D_xyyyyyyz*M_z
    L_xyyyyyyz = D_xyyyyyyz*M_0
    D_xyyyyyzz = -(D_xxxyyyyy + D_xyyyyyyy)
    L_xyyyyy   = D_xxxyyyyy*M_xx + D_xxyyyyy*M_x + D_xxyyyyyy*M_xy + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyy*M_y + D_xyyyyyyy*M_yy + D_xyyyyyyz*M_yz &
      + D_xyyyyyz*M_z + D_xyyyyyzz*M_zz
    L_xyyyyyz  = D_xxyyyyyz*M_x + D_xyyyyyyz*M_y + D_xyyyyyz*M_0 + D_xyyyyyzz*M_z
    D_xyyyyzzz = -(D_xxxyyyyz + D_xyyyyyyz)
    L_xyyyy    = D_xxxxyyyy*M_xxx + D_xxxyyyy*M_xx + D_xxxyyyyy*M_xxy + D_xxxyyyyz*M_xxz &
      + D_xxyyyy*M_x + D_xxyyyyy*M_xy + D_xxyyyyyy*M_xyy + D_xxyyyyyz* &
      M_xyz + D_xxyyyyz*M_xz + D_xxyyyyzz*M_xzz + D_xyyyy*M_0 + &
      D_xyyyyy*M_y + D_xyyyyyy*M_yy + D_xyyyyyyy*M_yyy + D_xyyyyyyz* &
      M_yyz + D_xyyyyyz*M_yz + D_xyyyyyzz*M_yzz + D_xyyyyz*M_z + &
      D_xyyyyzz*M_zz + D_xyyyyzzz*M_zzz
    L_xyyyyz   = D_xxxyyyyz*M_xx + D_xxyyyyyz*M_xy + D_xxyyyyz*M_x + D_xxyyyyzz*M_xz + &
      D_xyyyyyyz*M_yy + D_xyyyyyz*M_y + D_xyyyyyzz*M_yz + D_xyyyyz*M_0 &
      + D_xyyyyzz*M_z + D_xyyyyzzz*M_zz
    D_xyyyzzzz = -(D_xxxyyyzz + D_xyyyyyzz)
    L_xyyy     = D_xxxxxyyy*M_xxxx + D_xxxxyyy*M_xxx + D_xxxxyyyy*M_xxxy + D_xxxxyyyz* &
      M_xxxz + D_xxxyyy*M_xx + D_xxxyyyy*M_xxy + D_xxxyyyyy*M_xxyy + &
      D_xxxyyyyz*M_xxyz + D_xxxyyyz*M_xxz + D_xxxyyyzz*M_xxzz + D_xxyyy &
      *M_x + D_xxyyyy*M_xy + D_xxyyyyy*M_xyy + D_xxyyyyyy*M_xyyy + &
      D_xxyyyyyz*M_xyyz + D_xxyyyyz*M_xyz + D_xxyyyyzz*M_xyzz + &
      D_xxyyyz*M_xz + D_xxyyyzz*M_xzz + D_xxyyyzzz*M_xzzz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyyy*M_yyy + D_xyyyyyyy* &
      M_yyyy + D_xyyyyyyz*M_yyyz + D_xyyyyyz*M_yyz + D_xyyyyyzz*M_yyzz &
      + D_xyyyyz*M_yz + D_xyyyyzz*M_yzz + D_xyyyyzzz*M_yzzz + D_xyyyz* &
      M_z + D_xyyyzz*M_zz + D_xyyyzzz*M_zzz + D_xyyyzzzz*M_zzzz
    L_xyyyz    = D_xxxxyyyz*M_xxx + D_xxxyyyyz*M_xxy + D_xxxyyyz*M_xx + D_xxxyyyzz*M_xxz &
      + D_xxyyyyyz*M_xyy + D_xxyyyyz*M_xy + D_xxyyyyzz*M_xyz + D_xxyyyz &
      *M_x + D_xxyyyzz*M_xz + D_xxyyyzzz*M_xzz + D_xyyyyyyz*M_yyy + &
      D_xyyyyyz*M_yy + D_xyyyyyzz*M_yyz + D_xyyyyz*M_y + D_xyyyyzz*M_yz &
      + D_xyyyyzzz*M_yzz + D_xyyyz*M_0 + D_xyyyzz*M_z + D_xyyyzzz*M_zz &
      + D_xyyyzzzz*M_zzz
    D_xyyzzzzz = -(D_xxxyyzzz + D_xyyyyzzz)
    L_xyy      = D_xxxxxxyy*M_xxxxx + D_xxxxxyy*M_xxxx + D_xxxxxyyy*M_xxxxy + D_xxxxxyyz* &
      M_xxxxz + D_xxxxyy*M_xxx + D_xxxxyyy*M_xxxy + D_xxxxyyyy*M_xxxyy &
      + D_xxxxyyyz*M_xxxyz + D_xxxxyyz*M_xxxz + D_xxxxyyzz*M_xxxzz + &
      D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyyy*M_xxyy + D_xxxyyyyy* &
      M_xxyyy + D_xxxyyyyz*M_xxyyz + D_xxxyyyz*M_xxyz + D_xxxyyyzz* &
      M_xxyzz + D_xxxyyz*M_xxz + D_xxxyyzz*M_xxzz + D_xxxyyzzz*M_xxzzz &
      + D_xxyy*M_x + D_xxyyy*M_xy + D_xxyyyy*M_xyy + D_xxyyyyy*M_xyyy + &
      D_xxyyyyyy*M_xyyyy + D_xxyyyyyz*M_xyyyz + D_xxyyyyz*M_xyyz + &
      D_xxyyyyzz*M_xyyzz + D_xxyyyz*M_xyz + D_xxyyyzz*M_xyzz + &
      D_xxyyyzzz*M_xyzzz + D_xxyyz*M_xz + D_xxyyzz*M_xzz + D_xxyyzzz* &
      M_xzzz + D_xxyyzzzz*M_xzzzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy* &
      M_yy + D_xyyyyy*M_yyy + D_xyyyyyy*M_yyyy + D_xyyyyyyy*M_yyyyy + &
      D_xyyyyyyz*M_yyyyz + D_xyyyyyz*M_yyyz + D_xyyyyyzz*M_yyyzz + &
      D_xyyyyz*M_yyz + D_xyyyyzz*M_yyzz + D_xyyyyzzz*M_yyzzz + D_xyyyz* &
      M_yz + D_xyyyzz*M_yzz + D_xyyyzzz*M_yzzz + D_xyyyzzzz*M_yzzzz + &
      D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz + D_xyyzzzz*M_zzzz + &
      D_xyyzzzzz*M_zzzzz
    L_xyyz     = D_xxxxxyyz*M_xxxx + D_xxxxyyyz*M_xxxy + D_xxxxyyz*M_xxx + D_xxxxyyzz* &
      M_xxxz + D_xxxyyyyz*M_xxyy + D_xxxyyyz*M_xxy + D_xxxyyyzz*M_xxyz &
      + D_xxxyyz*M_xx + D_xxxyyzz*M_xxz + D_xxxyyzzz*M_xxzz + &
      D_xxyyyyyz*M_xyyy + D_xxyyyyz*M_xyy + D_xxyyyyzz*M_xyyz + &
      D_xxyyyz*M_xy + D_xxyyyzz*M_xyz + D_xxyyyzzz*M_xyzz + D_xxyyz*M_x &
      + D_xxyyzz*M_xz + D_xxyyzzz*M_xzz + D_xxyyzzzz*M_xzzz + &
      D_xyyyyyyz*M_yyyy + D_xyyyyyz*M_yyy + D_xyyyyyzz*M_yyyz + &
      D_xyyyyz*M_yy + D_xyyyyzz*M_yyz + D_xyyyyzzz*M_yyzz + D_xyyyz*M_y &
      + D_xyyyzz*M_yz + D_xyyyzzz*M_yzz + D_xyyyzzzz*M_yzzz + D_xyyz* &
      M_0 + D_xyyzz*M_z + D_xyyzzz*M_zz + D_xyyzzzz*M_zzz + D_xyyzzzzz* &
      M_zzzz
    D_xyzzzzzz = -(D_xxxyzzzz + D_xyyyzzzz)
    L_xy       = D_xxxxxxxy*M_xxxxxx + D_xxxxxxy*M_xxxxx + D_xxxxxxyy*M_xxxxxy + &
      D_xxxxxxyz*M_xxxxxz + D_xxxxxy*M_xxxx + D_xxxxxyy*M_xxxxy + &
      D_xxxxxyyy*M_xxxxyy + D_xxxxxyyz*M_xxxxyz + D_xxxxxyz*M_xxxxz + &
      D_xxxxxyzz*M_xxxxzz + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyyy &
      *M_xxxyy + D_xxxxyyyy*M_xxxyyy + D_xxxxyyyz*M_xxxyyz + D_xxxxyyz* &
      M_xxxyz + D_xxxxyyzz*M_xxxyzz + D_xxxxyz*M_xxxz + D_xxxxyzz* &
      M_xxxzz + D_xxxxyzzz*M_xxxzzz + D_xxxy*M_xx + D_xxxyy*M_xxy + &
      D_xxxyyy*M_xxyy + D_xxxyyyy*M_xxyyy + D_xxxyyyyy*M_xxyyyy + &
      D_xxxyyyyz*M_xxyyyz + D_xxxyyyz*M_xxyyz + D_xxxyyyzz*M_xxyyzz + &
      D_xxxyyz*M_xxyz + D_xxxyyzz*M_xxyzz + D_xxxyyzzz*M_xxyzzz + &
      D_xxxyz*M_xxz + D_xxxyzz*M_xxzz + D_xxxyzzz*M_xxzzz + D_xxxyzzzz* &
      M_xxzzzz + D_xxy*M_x + D_xxyy*M_xy + D_xxyyy*M_xyy + D_xxyyyy* &
      M_xyyy + D_xxyyyyy*M_xyyyy + D_xxyyyyyy*M_xyyyyy + D_xxyyyyyz* &
      M_xyyyyz + D_xxyyyyz*M_xyyyz + D_xxyyyyzz*M_xyyyzz + D_xxyyyz* &
      M_xyyz + D_xxyyyzz*M_xyyzz + D_xxyyyzzz*M_xyyzzz + D_xxyyz*M_xyz &
      + D_xxyyzz*M_xyzz + D_xxyyzzz*M_xyzzz + D_xxyyzzzz*M_xyzzzz + &
      D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz*M_xzzz + D_xxyzzzz*M_xzzzz &
      + D_xxyzzzzz*M_xzzzzz + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + &
      D_xyyyy*M_yyy + D_xyyyyy*M_yyyy + D_xyyyyyy*M_yyyyy + D_xyyyyyyy* &
      M_yyyyyy + D_xyyyyyyz*M_yyyyyz + D_xyyyyyz*M_yyyyz + D_xyyyyyzz* &
      M_yyyyzz + D_xyyyyz*M_yyyz + D_xyyyyzz*M_yyyzz + D_xyyyyzzz* &
      M_yyyzzz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + D_xyyyzzz*M_yyzzz + &
      D_xyyyzzzz*M_yyzzzz + D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz* &
      M_yzzz + D_xyyzzzz*M_yzzzz + D_xyyzzzzz*M_yzzzzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz*M_zzzz + D_xyzzzzz*M_zzzzz &
      + D_xyzzzzzz*M_zzzzzz
    L_xyz      = D_xxxxxxyz*M_xxxxx + D_xxxxxyyz*M_xxxxy + D_xxxxxyz*M_xxxx + D_xxxxxyzz* &
      M_xxxxz + D_xxxxyyyz*M_xxxyy + D_xxxxyyz*M_xxxy + D_xxxxyyzz* &
      M_xxxyz + D_xxxxyz*M_xxx + D_xxxxyzz*M_xxxz + D_xxxxyzzz*M_xxxzz &
      + D_xxxyyyyz*M_xxyyy + D_xxxyyyz*M_xxyy + D_xxxyyyzz*M_xxyyz + &
      D_xxxyyz*M_xxy + D_xxxyyzz*M_xxyz + D_xxxyyzzz*M_xxyzz + D_xxxyz* &
      M_xx + D_xxxyzz*M_xxz + D_xxxyzzz*M_xxzz + D_xxxyzzzz*M_xxzzz + &
      D_xxyyyyyz*M_xyyyy + D_xxyyyyz*M_xyyy + D_xxyyyyzz*M_xyyyz + &
      D_xxyyyz*M_xyy + D_xxyyyzz*M_xyyz + D_xxyyyzzz*M_xyyzz + D_xxyyz* &
      M_xy + D_xxyyzz*M_xyz + D_xxyyzzz*M_xyzz + D_xxyyzzzz*M_xyzzz + &
      D_xxyz*M_x + D_xxyzz*M_xz + D_xxyzzz*M_xzz + D_xxyzzzz*M_xzzz + &
      D_xxyzzzzz*M_xzzzz + D_xyyyyyyz*M_yyyyy + D_xyyyyyz*M_yyyy + &
      D_xyyyyyzz*M_yyyyz + D_xyyyyz*M_yyy + D_xyyyyzz*M_yyyz + &
      D_xyyyyzzz*M_yyyzz + D_xyyyz*M_yy + D_xyyyzz*M_yyz + D_xyyyzzz* &
      M_yyzz + D_xyyyzzzz*M_yyzzz + D_xyyz*M_y + D_xyyzz*M_yz + &
      D_xyyzzz*M_yzz + D_xyyzzzz*M_yzzz + D_xyyzzzzz*M_yzzzz + D_xyz* &
      M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz + D_xyzzzzz* &
      M_zzzz + D_xyzzzzzz*M_zzzzz
    D_xzzzzzzz = -(D_xxxzzzzz + D_xyyzzzzz)
    L_x        = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxxx*M_xxxxxx + D_xxxxxxxx*M_xxxxxxx + &
      D_xxxxxxxy*M_xxxxxxy + D_xxxxxxxz*M_xxxxxxz + D_xxxxxxy*M_xxxxxy &
      + D_xxxxxxyy*M_xxxxxyy + D_xxxxxxyz*M_xxxxxyz + D_xxxxxxz* &
      M_xxxxxz + D_xxxxxxzz*M_xxxxxzz + D_xxxxxy*M_xxxxy + D_xxxxxyy* &
      M_xxxxyy + D_xxxxxyyy*M_xxxxyyy + D_xxxxxyyz*M_xxxxyyz + &
      D_xxxxxyz*M_xxxxyz + D_xxxxxyzz*M_xxxxyzz + D_xxxxxz*M_xxxxz + &
      D_xxxxxzz*M_xxxxzz + D_xxxxxzzz*M_xxxxzzz + D_xxxxy*M_xxxy + &
      D_xxxxyy*M_xxxyy + D_xxxxyyy*M_xxxyyy + D_xxxxyyyy*M_xxxyyyy + &
      D_xxxxyyyz*M_xxxyyyz + D_xxxxyyz*M_xxxyyz + D_xxxxyyzz*M_xxxyyzz &
      + D_xxxxyz*M_xxxyz + D_xxxxyzz*M_xxxyzz + D_xxxxyzzz*M_xxxyzzz + &
      D_xxxxz*M_xxxz + D_xxxxzz*M_xxxzz + D_xxxxzzz*M_xxxzzz + &
      D_xxxxzzzz*M_xxxzzzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy* &
      M_xxyyy + D_xxxyyyy*M_xxyyyy + D_xxxyyyyy*M_xxyyyyy + D_xxxyyyyz* &
      M_xxyyyyz + D_xxxyyyz*M_xxyyyz + D_xxxyyyzz*M_xxyyyzz + D_xxxyyz* &
      M_xxyyz + D_xxxyyzz*M_xxyyzz + D_xxxyyzzz*M_xxyyzzz + D_xxxyz* &
      M_xxyz + D_xxxyzz*M_xxyzz + D_xxxyzzz*M_xxyzzz + D_xxxyzzzz* &
      M_xxyzzzz + D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + &
      D_xxxzzzz*M_xxzzzz + D_xxxzzzzz*M_xxzzzzz + D_xxy*M_xy + D_xxyy* &
      M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyyy*M_xyyyyy + &
      D_xxyyyyyy*M_xyyyyyy + D_xxyyyyyz*M_xyyyyyz + D_xxyyyyz*M_xyyyyz &
      + D_xxyyyyzz*M_xyyyyzz + D_xxyyyz*M_xyyyz + D_xxyyyzz*M_xyyyzz + &
      D_xxyyyzzz*M_xyyyzzz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + &
      D_xxyyzzz*M_xyyzzz + D_xxyyzzzz*M_xyyzzzz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxyzzz*M_xyzzz + D_xxyzzzz*M_xyzzzz + &
      D_xxyzzzzz*M_xyzzzzz + D_xxz*M_xz + D_xxzz*M_xzz + D_xxzzz*M_xzzz &
      + D_xxzzzz*M_xzzzz + D_xxzzzzz*M_xzzzzz + D_xxzzzzzz*M_xzzzzzz + &
      D_xy*M_y + D_xyy*M_yy + D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy* &
      M_yyyyy + D_xyyyyyy*M_yyyyyy + D_xyyyyyyy*M_yyyyyyy + D_xyyyyyyz* &
      M_yyyyyyz + D_xyyyyyz*M_yyyyyz + D_xyyyyyzz*M_yyyyyzz + D_xyyyyz* &
      M_yyyyz + D_xyyyyzz*M_yyyyzz + D_xyyyyzzz*M_yyyyzzz + D_xyyyz* &
      M_yyyz + D_xyyyzz*M_yyyzz + D_xyyyzzz*M_yyyzzz + D_xyyyzzzz* &
      M_yyyzzzz + D_xyyz*M_yyz + D_xyyzz*M_yyzz + D_xyyzzz*M_yyzzz + &
      D_xyyzzzz*M_yyzzzz + D_xyyzzzzz*M_yyzzzzz + D_xyz*M_yz + D_xyzz* &
      M_yzz + D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xyzzzzz*M_yzzzzz + &
      D_xyzzzzzz*M_yzzzzzz + D_xz*M_z + D_xzz*M_zz + D_xzzz*M_zzz + &
      D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz + D_xzzzzzz*M_zzzzzz + &
      D_xzzzzzzz*M_zzzzzzz
    L_xz       = D_xxxxxxxz*M_xxxxxx + D_xxxxxxyz*M_xxxxxy + D_xxxxxxz*M_xxxxx + &
      D_xxxxxxzz*M_xxxxxz + D_xxxxxyyz*M_xxxxyy + D_xxxxxyz*M_xxxxy + &
      D_xxxxxyzz*M_xxxxyz + D_xxxxxz*M_xxxx + D_xxxxxzz*M_xxxxz + &
      D_xxxxxzzz*M_xxxxzz + D_xxxxyyyz*M_xxxyyy + D_xxxxyyz*M_xxxyy + &
      D_xxxxyyzz*M_xxxyyz + D_xxxxyz*M_xxxy + D_xxxxyzz*M_xxxyz + &
      D_xxxxyzzz*M_xxxyzz + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + D_xxxxzzz &
      *M_xxxzz + D_xxxxzzzz*M_xxxzzz + D_xxxyyyyz*M_xxyyyy + D_xxxyyyz* &
      M_xxyyy + D_xxxyyyzz*M_xxyyyz + D_xxxyyz*M_xxyy + D_xxxyyzz* &
      M_xxyyz + D_xxxyyzzz*M_xxyyzz + D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + &
      D_xxxyzzz*M_xxyzz + D_xxxyzzzz*M_xxyzzz + D_xxxz*M_xx + D_xxxzz* &
      M_xxz + D_xxxzzz*M_xxzz + D_xxxzzzz*M_xxzzz + D_xxxzzzzz*M_xxzzzz &
      + D_xxyyyyyz*M_xyyyyy + D_xxyyyyz*M_xyyyy + D_xxyyyyzz*M_xyyyyz + &
      D_xxyyyz*M_xyyy + D_xxyyyzz*M_xyyyz + D_xxyyyzzz*M_xyyyzz + &
      D_xxyyz*M_xyy + D_xxyyzz*M_xyyz + D_xxyyzzz*M_xyyzz + D_xxyyzzzz* &
      M_xyyzzz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz*M_xyzz + &
      D_xxyzzzz*M_xyzzz + D_xxyzzzzz*M_xyzzzz + D_xxz*M_x + D_xxzz*M_xz &
      + D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + D_xxzzzzz*M_xzzzz + &
      D_xxzzzzzz*M_xzzzzz + D_xyyyyyyz*M_yyyyyy + D_xyyyyyz*M_yyyyy + &
      D_xyyyyyzz*M_yyyyyz + D_xyyyyz*M_yyyy + D_xyyyyzz*M_yyyyz + &
      D_xyyyyzzz*M_yyyyzz + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyyyzzz &
      *M_yyyzz + D_xyyyzzzz*M_yyyzzz + D_xyyz*M_yy + D_xyyzz*M_yyz + &
      D_xyyzzz*M_yyzz + D_xyyzzzz*M_yyzzz + D_xyyzzzzz*M_yyzzzz + D_xyz &
      *M_y + D_xyzz*M_yz + D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xyzzzzz* &
      M_yzzzz + D_xyzzzzzz*M_yzzzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz* &
      M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz + D_xzzzzzz*M_zzzzz + &
      D_xzzzzzzz*M_zzzzzz
    D_yyyyyyyy = v96*(v98 + 6435.0d0*b8 + 6930.0d0*v121 - (1260.0d0*v117 + v68*v99))
    L_yyyyyyyy = D_yyyyyyyy*M_0
    D_yyyyyyyz = v119*v122
    L_yyyyyyy  = D_xyyyyyyy*M_x + D_yyyyyyy*M_0 + D_yyyyyyyy*M_y + D_yyyyyyyz*M_z
    L_yyyyyyyz = D_yyyyyyyz*M_0
    D_yyyyyyzz = -(D_xxyyyyyy + D_yyyyyyyy)
    L_yyyyyy   = D_xxyyyyyy*M_xx + D_xyyyyyy*M_x + D_xyyyyyyy*M_xy + D_xyyyyyyz*M_xz + &
      D_yyyyyy*M_0 + D_yyyyyyy*M_y + D_yyyyyyyy*M_yy + D_yyyyyyyz*M_yz &
      + D_yyyyyyz*M_z + D_yyyyyyzz*M_zz
    L_yyyyyyz  = D_xyyyyyyz*M_x + D_yyyyyyyz*M_y + D_yyyyyyz*M_0 + D_yyyyyyzz*M_z
    D_yyyyyzzz = -(D_xxyyyyyz + D_yyyyyyyz)
    L_yyyyy    = D_xxxyyyyy*M_xxx + D_xxyyyyy*M_xx + D_xxyyyyyy*M_xxy + D_xxyyyyyz*M_xxz &
      + D_xyyyyy*M_x + D_xyyyyyy*M_xy + D_xyyyyyyy*M_xyy + D_xyyyyyyz* &
      M_xyz + D_xyyyyyz*M_xz + D_xyyyyyzz*M_xzz + D_yyyyy*M_0 + &
      D_yyyyyy*M_y + D_yyyyyyy*M_yy + D_yyyyyyyy*M_yyy + D_yyyyyyyz* &
      M_yyz + D_yyyyyyz*M_yz + D_yyyyyyzz*M_yzz + D_yyyyyz*M_z + &
      D_yyyyyzz*M_zz + D_yyyyyzzz*M_zzz
    L_yyyyyz   = D_xxyyyyyz*M_xx + D_xyyyyyyz*M_xy + D_xyyyyyz*M_x + D_xyyyyyzz*M_xz + &
      D_yyyyyyyz*M_yy + D_yyyyyyz*M_y + D_yyyyyyzz*M_yz + D_yyyyyz*M_0 &
      + D_yyyyyzz*M_z + D_yyyyyzzz*M_zz
    D_yyyyzzzz = -(D_xxyyyyzz + D_yyyyyyzz)
    L_yyyy     = D_xxxxyyyy*M_xxxx + D_xxxyyyy*M_xxx + D_xxxyyyyy*M_xxxy + D_xxxyyyyz* &
      M_xxxz + D_xxyyyy*M_xx + D_xxyyyyy*M_xxy + D_xxyyyyyy*M_xxyy + &
      D_xxyyyyyz*M_xxyz + D_xxyyyyz*M_xxz + D_xxyyyyzz*M_xxzz + D_xyyyy &
      *M_x + D_xyyyyy*M_xy + D_xyyyyyy*M_xyy + D_xyyyyyyy*M_xyyy + &
      D_xyyyyyyz*M_xyyz + D_xyyyyyz*M_xyz + D_xyyyyyzz*M_xyzz + &
      D_xyyyyz*M_xz + D_xyyyyzz*M_xzz + D_xyyyyzzz*M_xzzz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyyy*M_yyy + D_yyyyyyyy* &
      M_yyyy + D_yyyyyyyz*M_yyyz + D_yyyyyyz*M_yyz + D_yyyyyyzz*M_yyzz &
      + D_yyyyyz*M_yz + D_yyyyyzz*M_yzz + D_yyyyyzzz*M_yzzz + D_yyyyz* &
      M_z + D_yyyyzz*M_zz + D_yyyyzzz*M_zzz + D_yyyyzzzz*M_zzzz
    L_yyyyz    = D_xxxyyyyz*M_xxx + D_xxyyyyyz*M_xxy + D_xxyyyyz*M_xx + D_xxyyyyzz*M_xxz &
      + D_xyyyyyyz*M_xyy + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + D_xyyyyz &
      *M_x + D_xyyyyzz*M_xz + D_xyyyyzzz*M_xzz + D_yyyyyyyz*M_yyy + &
      D_yyyyyyz*M_yy + D_yyyyyyzz*M_yyz + D_yyyyyz*M_y + D_yyyyyzz*M_yz &
      + D_yyyyyzzz*M_yzz + D_yyyyz*M_0 + D_yyyyzz*M_z + D_yyyyzzz*M_zz &
      + D_yyyyzzzz*M_zzz
    D_yyyzzzzz = -(D_xxyyyzzz + D_yyyyyzzz)
    L_yyy      = D_xxxxxyyy*M_xxxxx + D_xxxxyyy*M_xxxx + D_xxxxyyyy*M_xxxxy + D_xxxxyyyz* &
      M_xxxxz + D_xxxyyy*M_xxx + D_xxxyyyy*M_xxxy + D_xxxyyyyy*M_xxxyy &
      + D_xxxyyyyz*M_xxxyz + D_xxxyyyz*M_xxxz + D_xxxyyyzz*M_xxxzz + &
      D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyyy*M_xxyy + D_xxyyyyyy* &
      M_xxyyy + D_xxyyyyyz*M_xxyyz + D_xxyyyyz*M_xxyz + D_xxyyyyzz* &
      M_xxyzz + D_xxyyyz*M_xxz + D_xxyyyzz*M_xxzz + D_xxyyyzzz*M_xxzzz &
      + D_xyyy*M_x + D_xyyyy*M_xy + D_xyyyyy*M_xyy + D_xyyyyyy*M_xyyy + &
      D_xyyyyyyy*M_xyyyy + D_xyyyyyyz*M_xyyyz + D_xyyyyyz*M_xyyz + &
      D_xyyyyyzz*M_xyyzz + D_xyyyyz*M_xyz + D_xyyyyzz*M_xyzz + &
      D_xyyyyzzz*M_xyzzz + D_xyyyz*M_xz + D_xyyyzz*M_xzz + D_xyyyzzz* &
      M_xzzz + D_xyyyzzzz*M_xzzzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy* &
      M_yy + D_yyyyyy*M_yyy + D_yyyyyyy*M_yyyy + D_yyyyyyyy*M_yyyyy + &
      D_yyyyyyyz*M_yyyyz + D_yyyyyyz*M_yyyz + D_yyyyyyzz*M_yyyzz + &
      D_yyyyyz*M_yyz + D_yyyyyzz*M_yyzz + D_yyyyyzzz*M_yyzzz + D_yyyyz* &
      M_yz + D_yyyyzz*M_yzz + D_yyyyzzz*M_yzzz + D_yyyyzzzz*M_yzzzz + &
      D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz + D_yyyzzzz*M_zzzz + &
      D_yyyzzzzz*M_zzzzz
    L_yyyz     = D_xxxxyyyz*M_xxxx + D_xxxyyyyz*M_xxxy + D_xxxyyyz*M_xxx + D_xxxyyyzz* &
      M_xxxz + D_xxyyyyyz*M_xxyy + D_xxyyyyz*M_xxy + D_xxyyyyzz*M_xxyz &
      + D_xxyyyz*M_xx + D_xxyyyzz*M_xxz + D_xxyyyzzz*M_xxzz + &
      D_xyyyyyyz*M_xyyy + D_xyyyyyz*M_xyy + D_xyyyyyzz*M_xyyz + &
      D_xyyyyz*M_xy + D_xyyyyzz*M_xyz + D_xyyyyzzz*M_xyzz + D_xyyyz*M_x &
      + D_xyyyzz*M_xz + D_xyyyzzz*M_xzz + D_xyyyzzzz*M_xzzz + &
      D_yyyyyyyz*M_yyyy + D_yyyyyyz*M_yyy + D_yyyyyyzz*M_yyyz + &
      D_yyyyyz*M_yy + D_yyyyyzz*M_yyz + D_yyyyyzzz*M_yyzz + D_yyyyz*M_y &
      + D_yyyyzz*M_yz + D_yyyyzzz*M_yzz + D_yyyyzzzz*M_yzzz + D_yyyz* &
      M_0 + D_yyyzz*M_z + D_yyyzzz*M_zz + D_yyyzzzz*M_zzz + D_yyyzzzzz* &
      M_zzzz
    D_yyzzzzzz = -(D_xxyyzzzz + D_yyyyzzzz)
    L_yy       = D_xxxxxxyy*M_xxxxxx + D_xxxxxyy*M_xxxxx + D_xxxxxyyy*M_xxxxxy + &
      D_xxxxxyyz*M_xxxxxz + D_xxxxyy*M_xxxx + D_xxxxyyy*M_xxxxy + &
      D_xxxxyyyy*M_xxxxyy + D_xxxxyyyz*M_xxxxyz + D_xxxxyyz*M_xxxxz + &
      D_xxxxyyzz*M_xxxxzz + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyyy &
      *M_xxxyy + D_xxxyyyyy*M_xxxyyy + D_xxxyyyyz*M_xxxyyz + D_xxxyyyz* &
      M_xxxyz + D_xxxyyyzz*M_xxxyzz + D_xxxyyz*M_xxxz + D_xxxyyzz* &
      M_xxxzz + D_xxxyyzzz*M_xxxzzz + D_xxyy*M_xx + D_xxyyy*M_xxy + &
      D_xxyyyy*M_xxyy + D_xxyyyyy*M_xxyyy + D_xxyyyyyy*M_xxyyyy + &
      D_xxyyyyyz*M_xxyyyz + D_xxyyyyz*M_xxyyz + D_xxyyyyzz*M_xxyyzz + &
      D_xxyyyz*M_xxyz + D_xxyyyzz*M_xxyzz + D_xxyyyzzz*M_xxyzzz + &
      D_xxyyz*M_xxz + D_xxyyzz*M_xxzz + D_xxyyzzz*M_xxzzz + D_xxyyzzzz* &
      M_xxzzzz + D_xyy*M_x + D_xyyy*M_xy + D_xyyyy*M_xyy + D_xyyyyy* &
      M_xyyy + D_xyyyyyy*M_xyyyy + D_xyyyyyyy*M_xyyyyy + D_xyyyyyyz* &
      M_xyyyyz + D_xyyyyyz*M_xyyyz + D_xyyyyyzz*M_xyyyzz + D_xyyyyz* &
      M_xyyz + D_xyyyyzz*M_xyyzz + D_xyyyyzzz*M_xyyzzz + D_xyyyz*M_xyz &
      + D_xyyyzz*M_xyzz + D_xyyyzzz*M_xyzzz + D_xyyyzzzz*M_xyzzzz + &
      D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz*M_xzzz + D_xyyzzzz*M_xzzzz &
      + D_xyyzzzzz*M_xzzzzz + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + &
      D_yyyyy*M_yyy + D_yyyyyy*M_yyyy + D_yyyyyyy*M_yyyyy + D_yyyyyyyy* &
      M_yyyyyy + D_yyyyyyyz*M_yyyyyz + D_yyyyyyz*M_yyyyz + D_yyyyyyzz* &
      M_yyyyzz + D_yyyyyz*M_yyyz + D_yyyyyzz*M_yyyzz + D_yyyyyzzz* &
      M_yyyzzz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + D_yyyyzzz*M_yyzzz + &
      D_yyyyzzzz*M_yyzzzz + D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz* &
      M_yzzz + D_yyyzzzz*M_yzzzz + D_yyyzzzzz*M_yzzzzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz*M_zzzz + D_yyzzzzz*M_zzzzz &
      + D_yyzzzzzz*M_zzzzzz
    L_yyz      = D_xxxxxyyz*M_xxxxx + D_xxxxyyyz*M_xxxxy + D_xxxxyyz*M_xxxx + D_xxxxyyzz* &
      M_xxxxz + D_xxxyyyyz*M_xxxyy + D_xxxyyyz*M_xxxy + D_xxxyyyzz* &
      M_xxxyz + D_xxxyyz*M_xxx + D_xxxyyzz*M_xxxz + D_xxxyyzzz*M_xxxzz &
      + D_xxyyyyyz*M_xxyyy + D_xxyyyyz*M_xxyy + D_xxyyyyzz*M_xxyyz + &
      D_xxyyyz*M_xxy + D_xxyyyzz*M_xxyz + D_xxyyyzzz*M_xxyzz + D_xxyyz* &
      M_xx + D_xxyyzz*M_xxz + D_xxyyzzz*M_xxzz + D_xxyyzzzz*M_xxzzz + &
      D_xyyyyyyz*M_xyyyy + D_xyyyyyz*M_xyyy + D_xyyyyyzz*M_xyyyz + &
      D_xyyyyz*M_xyy + D_xyyyyzz*M_xyyz + D_xyyyyzzz*M_xyyzz + D_xyyyz* &
      M_xy + D_xyyyzz*M_xyz + D_xyyyzzz*M_xyzz + D_xyyyzzzz*M_xyzzz + &
      D_xyyz*M_x + D_xyyzz*M_xz + D_xyyzzz*M_xzz + D_xyyzzzz*M_xzzz + &
      D_xyyzzzzz*M_xzzzz + D_yyyyyyyz*M_yyyyy + D_yyyyyyz*M_yyyy + &
      D_yyyyyyzz*M_yyyyz + D_yyyyyz*M_yyy + D_yyyyyzz*M_yyyz + &
      D_yyyyyzzz*M_yyyzz + D_yyyyz*M_yy + D_yyyyzz*M_yyz + D_yyyyzzz* &
      M_yyzz + D_yyyyzzzz*M_yyzzz + D_yyyz*M_y + D_yyyzz*M_yz + &
      D_yyyzzz*M_yzz + D_yyyzzzz*M_yzzz + D_yyyzzzzz*M_yzzzz + D_yyz* &
      M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz + D_yyzzzzz* &
      M_zzzz + D_yyzzzzzz*M_zzzzz
    D_yzzzzzzz = -(D_xxyzzzzz + D_yyyzzzzz)
    L_y        = D_xxxxxxxy*M_xxxxxxx + D_xxxxxxy*M_xxxxxx + D_xxxxxxyy*M_xxxxxxy + &
      D_xxxxxxyz*M_xxxxxxz + D_xxxxxy*M_xxxxx + D_xxxxxyy*M_xxxxxy + &
      D_xxxxxyyy*M_xxxxxyy + D_xxxxxyyz*M_xxxxxyz + D_xxxxxyz*M_xxxxxz &
      + D_xxxxxyzz*M_xxxxxzz + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + &
      D_xxxxyyy*M_xxxxyy + D_xxxxyyyy*M_xxxxyyy + D_xxxxyyyz*M_xxxxyyz &
      + D_xxxxyyz*M_xxxxyz + D_xxxxyyzz*M_xxxxyzz + D_xxxxyz*M_xxxxz + &
      D_xxxxyzz*M_xxxxzz + D_xxxxyzzz*M_xxxxzzz + D_xxxy*M_xxx + &
      D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyyy*M_xxxyyy + &
      D_xxxyyyyy*M_xxxyyyy + D_xxxyyyyz*M_xxxyyyz + D_xxxyyyz*M_xxxyyz &
      + D_xxxyyyzz*M_xxxyyzz + D_xxxyyz*M_xxxyz + D_xxxyyzz*M_xxxyzz + &
      D_xxxyyzzz*M_xxxyzzz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + &
      D_xxxyzzz*M_xxxzzz + D_xxxyzzzz*M_xxxzzzz + D_xxy*M_xx + D_xxyy* &
      M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyyy*M_xxyyyy + &
      D_xxyyyyyy*M_xxyyyyy + D_xxyyyyyz*M_xxyyyyz + D_xxyyyyz*M_xxyyyz &
      + D_xxyyyyzz*M_xxyyyzz + D_xxyyyz*M_xxyyz + D_xxyyyzz*M_xxyyzz + &
      D_xxyyyzzz*M_xxyyzzz + D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + &
      D_xxyyzzz*M_xxyzzz + D_xxyyzzzz*M_xxyzzzz + D_xxyz*M_xxz + &
      D_xxyzz*M_xxzz + D_xxyzzz*M_xxzzz + D_xxyzzzz*M_xxzzzz + &
      D_xxyzzzzz*M_xxzzzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyyy*M_xyyyyy + &
      D_xyyyyyyy*M_xyyyyyy + D_xyyyyyyz*M_xyyyyyz + D_xyyyyyz*M_xyyyyz &
      + D_xyyyyyzz*M_xyyyyzz + D_xyyyyz*M_xyyyz + D_xyyyyzz*M_xyyyzz + &
      D_xyyyyzzz*M_xyyyzzz + D_xyyyz*M_xyyz + D_xyyyzz*M_xyyzz + &
      D_xyyyzzz*M_xyyzzz + D_xyyyzzzz*M_xyyzzzz + D_xyyz*M_xyz + &
      D_xyyzz*M_xyzz + D_xyyzzz*M_xyzzz + D_xyyzzzz*M_xyzzzz + &
      D_xyyzzzzz*M_xyzzzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz &
      + D_xyzzzz*M_xzzzz + D_xyzzzzz*M_xzzzzz + D_xyzzzzzz*M_xzzzzzz + &
      D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy + D_yyyyy*M_yyyy + &
      D_yyyyyy*M_yyyyy + D_yyyyyyy*M_yyyyyy + D_yyyyyyyy*M_yyyyyyy + &
      D_yyyyyyyz*M_yyyyyyz + D_yyyyyyz*M_yyyyyz + D_yyyyyyzz*M_yyyyyzz &
      + D_yyyyyz*M_yyyyz + D_yyyyyzz*M_yyyyzz + D_yyyyyzzz*M_yyyyzzz + &
      D_yyyyz*M_yyyz + D_yyyyzz*M_yyyzz + D_yyyyzzz*M_yyyzzz + &
      D_yyyyzzzz*M_yyyzzzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + D_yyyzzz* &
      M_yyzzz + D_yyyzzzz*M_yyzzzz + D_yyyzzzzz*M_yyzzzzz + D_yyz*M_yz &
      + D_yyzz*M_yzz + D_yyzzz*M_yzzz + D_yyzzzz*M_yzzzz + D_yyzzzzz* &
      M_yzzzzz + D_yyzzzzzz*M_yzzzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz* &
      M_zzz + D_yzzzz*M_zzzz + D_yzzzzz*M_zzzzz + D_yzzzzzz*M_zzzzzz + &
      D_yzzzzzzz*M_zzzzzzz
    L_yz       = D_xxxxxxyz*M_xxxxxx + D_xxxxxyyz*M_xxxxxy + D_xxxxxyz*M_xxxxx + &
      D_xxxxxyzz*M_xxxxxz + D_xxxxyyyz*M_xxxxyy + D_xxxxyyz*M_xxxxy + &
      D_xxxxyyzz*M_xxxxyz + D_xxxxyz*M_xxxx + D_xxxxyzz*M_xxxxz + &
      D_xxxxyzzz*M_xxxxzz + D_xxxyyyyz*M_xxxyyy + D_xxxyyyz*M_xxxyy + &
      D_xxxyyyzz*M_xxxyyz + D_xxxyyz*M_xxxy + D_xxxyyzz*M_xxxyz + &
      D_xxxyyzzz*M_xxxyzz + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + D_xxxyzzz &
      *M_xxxzz + D_xxxyzzzz*M_xxxzzz + D_xxyyyyyz*M_xxyyyy + D_xxyyyyz* &
      M_xxyyy + D_xxyyyyzz*M_xxyyyz + D_xxyyyz*M_xxyy + D_xxyyyzz* &
      M_xxyyz + D_xxyyyzzz*M_xxyyzz + D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + &
      D_xxyyzzz*M_xxyzz + D_xxyyzzzz*M_xxyzzz + D_xxyz*M_xx + D_xxyzz* &
      M_xxz + D_xxyzzz*M_xxzz + D_xxyzzzz*M_xxzzz + D_xxyzzzzz*M_xxzzzz &
      + D_xyyyyyyz*M_xyyyyy + D_xyyyyyz*M_xyyyy + D_xyyyyyzz*M_xyyyyz + &
      D_xyyyyz*M_xyyy + D_xyyyyzz*M_xyyyz + D_xyyyyzzz*M_xyyyzz + &
      D_xyyyz*M_xyy + D_xyyyzz*M_xyyz + D_xyyyzzz*M_xyyzz + D_xyyyzzzz* &
      M_xyyzzz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz*M_xyzz + &
      D_xyyzzzz*M_xyzzz + D_xyyzzzzz*M_xyzzzz + D_xyz*M_x + D_xyzz*M_xz &
      + D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + D_xyzzzzz*M_xzzzz + &
      D_xyzzzzzz*M_xzzzzz + D_yyyyyyyz*M_yyyyyy + D_yyyyyyz*M_yyyyy + &
      D_yyyyyyzz*M_yyyyyz + D_yyyyyz*M_yyyy + D_yyyyyzz*M_yyyyz + &
      D_yyyyyzzz*M_yyyyzz + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyyyzzz &
      *M_yyyzz + D_yyyyzzzz*M_yyyzzz + D_yyyz*M_yy + D_yyyzz*M_yyz + &
      D_yyyzzz*M_yyzz + D_yyyzzzz*M_yyzzz + D_yyyzzzzz*M_yyzzzz + D_yyz &
      *M_y + D_yyzz*M_yz + D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yyzzzzz* &
      M_yzzzz + D_yyzzzzzz*M_yzzzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz* &
      M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz + D_yzzzzzz*M_zzzzz + &
      D_yzzzzzzz*M_zzzzzz
    D_zzzzzzzz = -(D_xxzzzzzz + D_yyzzzzzz)
    L_0        = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxxx*M_xxxxxxx + D_xxxxxxxx* &
      M_xxxxxxxx + D_xxxxxxxy*M_xxxxxxxy + D_xxxxxxxz*M_xxxxxxxz + &
      D_xxxxxxy*M_xxxxxxy + D_xxxxxxyy*M_xxxxxxyy + D_xxxxxxyz* &
      M_xxxxxxyz + D_xxxxxxz*M_xxxxxxz + D_xxxxxxzz*M_xxxxxxzz + &
      D_xxxxxy*M_xxxxxy + D_xxxxxyy*M_xxxxxyy + D_xxxxxyyy*M_xxxxxyyy + &
      D_xxxxxyyz*M_xxxxxyyz + D_xxxxxyz*M_xxxxxyz + D_xxxxxyzz* &
      M_xxxxxyzz + D_xxxxxz*M_xxxxxz + D_xxxxxzz*M_xxxxxzz + D_xxxxxzzz &
      *M_xxxxxzzz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyyy* &
      M_xxxxyyy + D_xxxxyyyy*M_xxxxyyyy + D_xxxxyyyz*M_xxxxyyyz + &
      D_xxxxyyz*M_xxxxyyz + D_xxxxyyzz*M_xxxxyyzz + D_xxxxyz*M_xxxxyz + &
      D_xxxxyzz*M_xxxxyzz + D_xxxxyzzz*M_xxxxyzzz + D_xxxxz*M_xxxxz + &
      D_xxxxzz*M_xxxxzz + D_xxxxzzz*M_xxxxzzz + D_xxxxzzzz*M_xxxxzzzz + &
      D_xxxy*M_xxxy + D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyyy* &
      M_xxxyyyy + D_xxxyyyyy*M_xxxyyyyy + D_xxxyyyyz*M_xxxyyyyz + &
      D_xxxyyyz*M_xxxyyyz + D_xxxyyyzz*M_xxxyyyzz + D_xxxyyz*M_xxxyyz + &
      D_xxxyyzz*M_xxxyyzz + D_xxxyyzzz*M_xxxyyzzz + D_xxxyz*M_xxxyz + &
      D_xxxyzz*M_xxxyzz + D_xxxyzzz*M_xxxyzzz + D_xxxyzzzz*M_xxxyzzzz + &
      D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + D_xxxzzz*M_xxxzzz + D_xxxzzzz* &
      M_xxxzzzz + D_xxxzzzzz*M_xxxzzzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + &
      D_xxyyy*M_xxyyy + D_xxyyyy*M_xxyyyy + D_xxyyyyy*M_xxyyyyy + &
      D_xxyyyyyy*M_xxyyyyyy + D_xxyyyyyz*M_xxyyyyyz + D_xxyyyyz* &
      M_xxyyyyz + D_xxyyyyzz*M_xxyyyyzz + D_xxyyyz*M_xxyyyz + D_xxyyyzz &
      *M_xxyyyzz + D_xxyyyzzz*M_xxyyyzzz + D_xxyyz*M_xxyyz + D_xxyyzz* &
      M_xxyyzz + D_xxyyzzz*M_xxyyzzz + D_xxyyzzzz*M_xxyyzzzz + D_xxyz* &
      M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz*M_xxyzzz + D_xxyzzzz* &
      M_xxyzzzz + D_xxyzzzzz*M_xxyzzzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + &
      D_xxzzz*M_xxzzz + D_xxzzzz*M_xxzzzz + D_xxzzzzz*M_xxzzzzz + &
      D_xxzzzzzz*M_xxzzzzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + &
      D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyyy*M_xyyyyyy + &
      D_xyyyyyyy*M_xyyyyyyy + D_xyyyyyyz*M_xyyyyyyz + D_xyyyyyz* &
      M_xyyyyyz + D_xyyyyyzz*M_xyyyyyzz + D_xyyyyz*M_xyyyyz + D_xyyyyzz &
      *M_xyyyyzz + D_xyyyyzzz*M_xyyyyzzz + D_xyyyz*M_xyyyz + D_xyyyzz* &
      M_xyyyzz + D_xyyyzzz*M_xyyyzzz + D_xyyyzzzz*M_xyyyzzzz + D_xyyz* &
      M_xyyz + D_xyyzz*M_xyyzz + D_xyyzzz*M_xyyzzz + D_xyyzzzz* &
      M_xyyzzzz + D_xyyzzzzz*M_xyyzzzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + &
      D_xyzzz*M_xyzzz + D_xyzzzz*M_xyzzzz + D_xyzzzzz*M_xyzzzzz + &
      D_xyzzzzzz*M_xyzzzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + &
      D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_xzzzzzz*M_xzzzzzz + &
      D_xzzzzzzz*M_xzzzzzzz + D_y*M_y + D_yy*M_yy + D_yyy*M_yyy + &
      D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + D_yyyyyyy* &
      M_yyyyyyy + D_yyyyyyyy*M_yyyyyyyy + D_yyyyyyyz*M_yyyyyyyz + &
      D_yyyyyyz*M_yyyyyyz + D_yyyyyyzz*M_yyyyyyzz + D_yyyyyz*M_yyyyyz + &
      D_yyyyyzz*M_yyyyyzz + D_yyyyyzzz*M_yyyyyzzz + D_yyyyz*M_yyyyz + &
      D_yyyyzz*M_yyyyzz + D_yyyyzzz*M_yyyyzzz + D_yyyyzzzz*M_yyyyzzzz + &
      D_yyyz*M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + D_yyyzzzz* &
      M_yyyzzzz + D_yyyzzzzz*M_yyyzzzzz + D_yyz*M_yyz + D_yyzz*M_yyzz + &
      D_yyzzz*M_yyzzz + D_yyzzzz*M_yyzzzz + D_yyzzzzz*M_yyzzzzz + &
      D_yyzzzzzz*M_yyzzzzzz + D_yz*M_yz + D_yzz*M_yzz + D_yzzz*M_yzzz + &
      D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz + D_yzzzzzz*M_yzzzzzz + &
      D_yzzzzzzz*M_yzzzzzzz + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + &
      D_zzzz*M_zzzz + D_zzzzz*M_zzzzz + D_zzzzzz*M_zzzzzz + D_zzzzzzz* &
      M_zzzzzzz + D_zzzzzzzz*M_zzzzzzzz
    L_z        = D_xxxxxxxz*M_xxxxxxx + D_xxxxxxyz*M_xxxxxxy + D_xxxxxxz*M_xxxxxx + &
      D_xxxxxxzz*M_xxxxxxz + D_xxxxxyyz*M_xxxxxyy + D_xxxxxyz*M_xxxxxy &
      + D_xxxxxyzz*M_xxxxxyz + D_xxxxxz*M_xxxxx + D_xxxxxzz*M_xxxxxz + &
      D_xxxxxzzz*M_xxxxxzz + D_xxxxyyyz*M_xxxxyyy + D_xxxxyyz*M_xxxxyy &
      + D_xxxxyyzz*M_xxxxyyz + D_xxxxyz*M_xxxxy + D_xxxxyzz*M_xxxxyz + &
      D_xxxxyzzz*M_xxxxyzz + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz + &
      D_xxxxzzz*M_xxxxzz + D_xxxxzzzz*M_xxxxzzz + D_xxxyyyyz*M_xxxyyyy &
      + D_xxxyyyz*M_xxxyyy + D_xxxyyyzz*M_xxxyyyz + D_xxxyyz*M_xxxyy + &
      D_xxxyyzz*M_xxxyyz + D_xxxyyzzz*M_xxxyyzz + D_xxxyz*M_xxxy + &
      D_xxxyzz*M_xxxyz + D_xxxyzzz*M_xxxyzz + D_xxxyzzzz*M_xxxyzzz + &
      D_xxxz*M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxxzzzz* &
      M_xxxzzz + D_xxxzzzzz*M_xxxzzzz + D_xxyyyyyz*M_xxyyyyy + &
      D_xxyyyyz*M_xxyyyy + D_xxyyyyzz*M_xxyyyyz + D_xxyyyz*M_xxyyy + &
      D_xxyyyzz*M_xxyyyz + D_xxyyyzzz*M_xxyyyzz + D_xxyyz*M_xxyy + &
      D_xxyyzz*M_xxyyz + D_xxyyzzz*M_xxyyzz + D_xxyyzzzz*M_xxyyzzz + &
      D_xxyz*M_xxy + D_xxyzz*M_xxyz + D_xxyzzz*M_xxyzz + D_xxyzzzz* &
      M_xxyzzz + D_xxyzzzzz*M_xxyzzzz + D_xxz*M_xx + D_xxzz*M_xxz + &
      D_xxzzz*M_xxzz + D_xxzzzz*M_xxzzz + D_xxzzzzz*M_xxzzzz + &
      D_xxzzzzzz*M_xxzzzzz + D_xyyyyyyz*M_xyyyyyy + D_xyyyyyz*M_xyyyyy &
      + D_xyyyyyzz*M_xyyyyyz + D_xyyyyz*M_xyyyy + D_xyyyyzz*M_xyyyyz + &
      D_xyyyyzzz*M_xyyyyzz + D_xyyyz*M_xyyy + D_xyyyzz*M_xyyyz + &
      D_xyyyzzz*M_xyyyzz + D_xyyyzzzz*M_xyyyzzz + D_xyyz*M_xyy + &
      D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + D_xyyzzzz*M_xyyzzz + &
      D_xyyzzzzz*M_xyyzzzz + D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz &
      + D_xyzzzz*M_xyzzz + D_xyzzzzz*M_xyzzzz + D_xyzzzzzz*M_xyzzzzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_xzzzzzz*M_xzzzzz + D_xzzzzzzz*M_xzzzzzz + D_yyyyyyyz* &
      M_yyyyyyy + D_yyyyyyz*M_yyyyyy + D_yyyyyyzz*M_yyyyyyz + D_yyyyyz* &
      M_yyyyy + D_yyyyyzz*M_yyyyyz + D_yyyyyzzz*M_yyyyyzz + D_yyyyz* &
      M_yyyy + D_yyyyzz*M_yyyyz + D_yyyyzzz*M_yyyyzz + D_yyyyzzzz* &
      M_yyyyzzz + D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + &
      D_yyyzzzz*M_yyyzzz + D_yyyzzzzz*M_yyyzzzz + D_yyz*M_yy + D_yyzz* &
      M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yyzzzzz*M_yyzzzz + &
      D_yyzzzzzz*M_yyzzzzz + D_yz*M_y + D_yzz*M_yz + D_yzzz*M_yzz + &
      D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + D_yzzzzzz*M_yzzzzz + &
      D_yzzzzzzz*M_yzzzzzz + D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz* &
      M_zzz + D_zzzzz*M_zzzz + D_zzzzzz*M_zzzzz + D_zzzzzzz*M_zzzzzz + &
      D_zzzzzzzz*M_zzzzzzz
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  y                   
#undef  L_0                 
#undef  z                   
#undef  M_0                 
#undef  x                   
#undef  L_x                 
#undef  M_x                 
#undef  M_y                 
#undef  L_y                 
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
#undef  L_xyy               
#undef  M_xxz               
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
#undef  L_xxyyy             
#undef  M_yyyy              
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
#undef  M_xyyyyz            
#undef  L_xxxxyyyz          
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
    end subroutine mom_es_M2L2
    
! OPS  468*ADD + 2*DIV + 635*MUL + 85*NEG + POW = 1191  (3601 before optimization)
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
                v191, v192, v193, v194, v195, v196, v197, v2, v20, v21, v22,&
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
                L_zzzzzzzz
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
#define L_yz                 L(1:2,8)
#define Phi_yz               Phi(1:2,8)
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
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v0         = L_xxz*z
    v16        = L_xxyyyyy + L_xxyyyyyz*z
    v20        = L_xxxxxxx + L_xxxxxxxy*y + L_xxxxxxxz*z
    v22        = 2.0d0*z
    v26        = 6.0d0*z
    v31        = 24.0d0*z
    v38        = 2.0d0*y
    v39        = L_xxxxxxy + L_xxxxxxyz*z
    v41        = 120.0d0*z
    v50        = L_xxxxxyy + L_xxxxxyyz*z
    v51        = 3.0d0*y
    v57        = L_xxxxyyy + L_xxxxyyyz*z
    v60        = 4.0d0*y
    v63        = 0.00833333333333333d0*x
    v65        = L_xxxyyyy + L_xxxyyyyz*z
    v70        = 5.0d0*y
    v73        = L_xyz*z
    v80        = L_xyyyyyy + L_xyyyyyyz*z
    v82        = L_xxxxxxyy*y + v39
    v95        = L_xz*z
    v117       = 0.00138888888888889d0*x
    v151       = L_yyz*z
    v158       = L_yyyyyyy + L_yyyyyyyz*z
    v165       = 0.00833333333333333d0*y
    v167       = L_yz*z
    v179       = 0.00138888888888889d0*y
    L_zz       = -(L_xx + L_yy)
    L_xzz      = -(L_xxx + L_xyy)
    v119       = L_xzz*z
    L_yzz      = -(L_xxy + L_yyy)
    v181       = L_yzz*z
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
    v128       = L_xxxxxxz + L_xxxxxxyz*y + L_xxxxxxzz*z
    L_xxxxxyzz = -(L_xxxxxxxy + L_xxxxxyyy)
    v135       = L_xxxxxyz + L_xxxxxyzz*z
    L_xxxxxzzz = -(L_xxxxxxxz + L_xxxxxyyz)
    L_xxxxyyzz = -(L_xxxxxxyy + L_xxxxyyyy)
    v139       = L_xxxxyyz + L_xxxxyyzz*z
    L_xxxxyzzz = -(L_xxxxxxyz + L_xxxxyyyz)
    L_xxxxzzzz = -(L_xxxxxxzz + L_xxxxyyzz)
    L_xxxyyyzz = -(L_xxxxxyyy + L_xxxyyyyy)
    v142       = L_xxxyyyz + L_xxxyyyzz*z
    L_xxxyyzzz = -(L_xxxxxyyz + L_xxxyyyyz)
    L_xxxyzzzz = -(L_xxxxxyzz + L_xxxyyyzz)
    L_xxxzzzzz = -(L_xxxxxzzz + L_xxxyyzzz)
    L_xxyyyyzz = -(L_xxxxyyyy + L_xxyyyyyy)
    v146       = L_xxyyyyz + L_xxyyyyzz*z
    L_xxyyyzzz = -(L_xxxxyyyz + L_xxyyyyyz)
    L_xxyyzzzz = -(L_xxxxyyzz + L_xxyyyyzz)
    L_xxyzzzzz = -(L_xxxxyzzz + L_xxyyyzzz)
    L_xxzzzzzz = -(L_xxxxzzzz + L_xxyyzzzz)
    L_xyyyyyzz = -(L_xxxyyyyy + L_xyyyyyyy)
    v126       = L_xyyyyyz + L_xyyyyyzz*z
    L_xyyyyzzz = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz = -(L_xxyyyyyy + L_yyyyyyyy)
    v187       = L_yyyyyyz + L_yyyyyyzz*z
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
    v54        = a2
    v55        = 0.0208333333333333d0*v54
    v116       = 0.00416666666666667d0*v54
    a3         = a1*a2
    v47        = a3
    v48        = 0.0277777777777778d0*v47
    v115       = 0.00694444444444444d0*v47
    a4         = a2*a2
    v36        = a4
    v37        = 0.0208333333333333d0*v36
    v114       = 0.00694444444444444d0*v36
    a5         = a2*a3
    v18        = a5
    v19        = 0.00833333333333333d0*v18
    v110       = 0.00416666666666667d0*v18
    a6         = a3*a3
    v1         = a6
    v2         = 0.00138888888888889d0*v1
    a7         = a3*a4
    v96        = 0.000198412698412698d0*a7
    a8         = a4*a4
    b2         = b1*b1
    v30        = b2
    v49        = 3.0d0*v30
    v58        = 6.0d0*v30
    v68        = 10.0d0*v30
    v163       = 0.0208333333333333d0*v30
    v178       = 0.00416666666666667d0*v30
    b3         = b1*b2
    v25        = b3
    v56        = 4.0d0*v25
    v66        = 10.0d0*v25
    v161       = 0.0277777777777778d0*v25
    v177       = 0.00694444444444444d0*v25
    b4         = b2*b2
    v21        = b4
    v64        = 5.0d0*v21
    v159       = 0.0208333333333333d0*v21
    v176       = 0.00694444444444444d0*v21
    b5         = b2*b3
    v15        = b5
    v17        = v15*v16
    v81        = v15*v80
    v157       = 0.00833333333333333d0*v15
    v175       = 0.00416666666666667d0*v15
    v127       = v126*v15
    b6         = b3*b3
    v3         = b6
    v4         = L_xxyyyyyy*v3
    v74        = L_xyyyyyyy*v3
    v106       = 0.00138888888888889d0*v3
    v120       = L_xyyyyyyz*v3
    b7         = b3*b4
    v97        = b7
    v98        = L_xyyyyyyy*v97
    v168       = 0.000198412698412698d0*v97
    b8         = b4*b4
    c2         = c1*c1
    v5         = c2
    v27        = 3.0d0*v5
    v32        = 12.0d0*v5
    v42        = 60.0d0*v5
    v192       = 0.5d0*v5
    v99        = L_xzz*v5
    v169       = L_yzz*v5
    v6         = L_xxzz*v5
    v75        = L_xyzz*v5
    v121       = L_xzzz*v5
    v152       = L_yyzz*v5
    v182       = L_yzzz*v5
    v40        = 2.0d0*L_xxxxxx + L_xxxxxxyy*v30 + L_xxxxxxz*v22 + L_xxxxxxzz*v5 + v38* &
      v39
    v52        = 2.0d0*L_xxxxxy + L_xxxxxyz*v22 + L_xxxxxyzz*v5
    v89        = v52 + L_xxxxxyyy*v30 + v38*v50
    v136       = L_xxxxxyyz*v30 + 2.0d0*L_xxxxxz + L_xxxxxzz*v22 + L_xxxxxzzz*v5 + v135* &
      v38
    v59        = 2.0d0*L_xxxxyy + L_xxxxyyz*v22 + L_xxxxyyzz*v5
    v140       = 2.0d0*L_xxxxyz + L_xxxxyzz*v22 + L_xxxxyzzz*v5
    v67        = 2.0d0*L_xxxyyy + L_xxxyyyz*v22 + L_xxxyyyzz*v5
    v143       = 2.0d0*L_xxxyyz + L_xxxyyzz*v22 + L_xxxyyzzz*v5
    v23        = 2.0d0*L_xxyyyy + L_xxyyyyz*v22 + L_xxyyyyzz*v5
    v24        = v21*v23
    v147       = 2.0d0*L_xxyyyz + L_xxyyyzz*v22 + L_xxyyyzzz*v5
    v83        = 2.0d0*L_xyyyyy + L_xyyyyyz*v22 + L_xyyyyyzz*v5
    v84        = v21*v83
    v107       = v15*v83
    v129       = 2.0d0*L_xyyyyz + L_xyyyyzz*v22 + L_xyyyyzzz*v5
    v130       = v129*v21
    v160       = 2.0d0*L_yyyyyy + L_yyyyyyz*v22 + L_yyyyyyzz*v5
    v188       = 2.0d0*L_yyyyyz + L_yyyyyzz*v22 + L_yyyyyzzz*v5
    h          = v30 + v5 + v54
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
    v7         = c3
    v33        = 4.0d0*v7
    v43        = 20.0d0*v7
    v193       = 0.166666666666667d0*v7
    v100       = L_xzzz*v7
    v170       = L_yzzz*v7
    v8         = L_xxzzz*v7
    v76        = L_xyzzz*v7
    v122       = L_xzzzz*v7
    v153       = L_yyzzz*v7
    v183       = L_yzzzz*v7
    v53        = 6.0d0*L_xxxxx + L_xxxxxyyy*v25 + L_xxxxxz*v26 + L_xxxxxzz*v27 + &
      L_xxxxxzzz*v7 + v49*v50 + v51*v52
    v61        = 6.0d0*L_xxxxy + L_xxxxyz*v26 + L_xxxxyzz*v27 + L_xxxxyzzz*v7
    v92        = v61 + L_xxxxyyyy*v25 + v49*v57 + v51*v59
    v141       = L_xxxxyyyz*v25 + 6.0d0*L_xxxxz + L_xxxxzz*v26 + L_xxxxzzz*v27 + &
      L_xxxxzzzz*v7 + v139*v49 + v140*v51
    v69        = 6.0d0*L_xxxyy + L_xxxyyz*v26 + L_xxxyyzz*v27 + L_xxxyyzzz*v7
    v144       = 6.0d0*L_xxxyz + L_xxxyzz*v26 + L_xxxyzzz*v27 + L_xxxyzzzz*v7
    v28        = 6.0d0*L_xxyyy + L_xxyyyz*v26 + L_xxyyyzz*v27 + L_xxyyyzzz*v7
    v29        = v25*v28
    v148       = 6.0d0*L_xxyyz + L_xxyyzz*v26 + L_xxyyzzz*v27 + L_xxyyzzzz*v7
    v85        = 6.0d0*L_xyyyy + L_xyyyyz*v26 + L_xyyyyzz*v27 + L_xyyyyzzz*v7
    v86        = v25*v85
    v108       = v21*v85
    v131       = 6.0d0*L_xyyyz + L_xyyyzz*v26 + L_xyyyzzz*v27 + L_xyyyzzzz*v7
    v132       = v131*v25
    v162       = 6.0d0*L_yyyyy + L_yyyyyz*v26 + L_yyyyyzz*v27 + L_yyyyyzzz*v7
    v189       = 6.0d0*L_yyyyz + L_yyyyzz*v26 + L_yyyyzzz*v27 + L_yyyyzzzz*v7
    c4         = c2*c2
    v9         = c4
    v44        = 5.0d0*v9
    v194       = 0.0416666666666667d0*v9
    v101       = L_xzzzz*v9
    v171       = L_yzzzz*v9
    v10        = L_xxzzzz*v9
    v77        = L_xyzzzz*v9
    v123       = L_xzzzzz*v9
    v154       = L_yyzzzz*v9
    v184       = L_yzzzzz*v9
    v62        = 24.0d0*L_xxxx + L_xxxxyyyy*v21 + L_xxxxz*v31 + L_xxxxzz*v32 + L_xxxxzzz* &
      v33 + L_xxxxzzzz*v9 + v56*v57 + v58*v59 + v60*v61
    v71        = 24.0d0*L_xxxy + L_xxxyz*v31 + L_xxxyzz*v32 + L_xxxyzzz*v33 + L_xxxyzzzz* &
      v9
    v93        = v71 + L_xxxyyyyy*v21 + v56*v65 + v58*v67 + v60*v69
    v145       = L_xxxyyyyz*v21 + 24.0d0*L_xxxz + L_xxxzz*v31 + L_xxxzzz*v32 + L_xxxzzzz* &
      v33 + L_xxxzzzzz*v9 + v142*v56 + v143*v58 + v144*v60
    v34        = 24.0d0*L_xxyy + L_xxyyz*v31 + L_xxyyzz*v32 + L_xxyyzzz*v33 + L_xxyyzzzz* &
      v9
    v35        = v30*v34
    v149       = 24.0d0*L_xxyz + L_xxyzz*v31 + L_xxyzzz*v32 + L_xxyzzzz*v33 + L_xxyzzzzz* &
      v9
    v87        = 24.0d0*L_xyyy + L_xyyyz*v31 + L_xyyyzz*v32 + L_xyyyzzz*v33 + L_xyyyzzzz* &
      v9
    v88        = v30*v87
    v109       = v25*v87
    v133       = 24.0d0*L_xyyz + L_xyyzz*v31 + L_xyyzzz*v32 + L_xyyzzzz*v33 + L_xyyzzzzz* &
      v9
    v134       = v133*v30
    v164       = 24.0d0*L_yyyy + L_yyyyz*v31 + L_yyyyzz*v32 + L_yyyyzzz*v33 + L_yyyyzzzz* &
      v9
    v190       = 24.0d0*L_yyyz + L_yyyzz*v31 + L_yyyzzz*v32 + L_yyyzzzz*v33 + L_yyyzzzzz* &
      v9
    c5         = c2*c3
    v11        = c5
    v195       = 0.00833333333333333d0*v11
    v102       = L_xzzzzz*v11
    v172       = L_yzzzzz*v11
    v12        = L_xxzzzzz*v11
    v78        = L_xyzzzzz*v11
    v124       = L_xzzzzzz*v11
    v155       = L_yyzzzzz*v11
    v185       = L_yzzzzzz*v11
    v72        = 120.0d0*L_xxx + L_xxxyyyyy*v15 + L_xxxz*v41 + L_xxxzz*v42 + L_xxxzzz*v43 &
      + L_xxxzzzz*v44 + L_xxxzzzzz*v11 + v64*v65 + v66*v67 + v68*v69 + &
      v70*v71
    v45        = 120.0d0*L_xxy + L_xxyz*v41 + L_xxyzz*v42 + L_xxyzzz*v43 + L_xxyzzzz*v44 &
      + L_xxyzzzzz*v11
    v46        = v45*y
    v94        = v45 + L_xxyyyyyy*v15 + v16*v64 + v23*v66 + v28*v68 + v34*v70
    v150       = L_xxyyyyyz*v15 + 120.0d0*L_xxz + L_xxzz*v41 + L_xxzzz*v42 + L_xxzzzz*v43 &
      + L_xxzzzzz*v44 + L_xxzzzzzz*v11 + v146*v64 + v147*v66 + v148*v68 &
      + v149*v70
    v90        = 120.0d0*L_xyy + L_xyyz*v41 + L_xyyzz*v42 + L_xyyzzz*v43 + L_xyyzzzz*v44 &
      + L_xyyzzzzz*v11
    v91        = v90*y
    v111       = v30*v90
    v137       = 120.0d0*L_xyz + L_xyzz*v41 + L_xyzzz*v42 + L_xyzzzz*v43 + L_xyzzzzz*v44 &
      + L_xyzzzzzz*v11
    v138       = v137*y
    v166       = 120.0d0*L_yyy + L_yyyz*v41 + L_yyyzz*v42 + L_yyyzzz*v43 + L_yyyzzzz*v44 &
      + L_yyyzzzzz*v11
    v191       = 120.0d0*L_yyz + L_yyzz*v41 + L_yyzzz*v42 + L_yyzzzz*v43 + L_yyzzzzz*v44 &
      + L_yyzzzzzz*v11
    c6         = c3*c3
    v13        = c6
    v196       = 0.00138888888888889d0*v13
    v103       = L_xzzzzzz*v13
    v173       = L_yzzzzzz*v13
    v14        = L_xxzzzzzz*v13
    v118       = v14 + v4 + 30.0d0*v10 + 20.0d0*v29 + 360.0d0*v6 + 120.0d0*v8 + 720.0d0*( &
      L_xx + v0) + 15.0d0*(v24 + v35) + 6.0d0*(v12 + v17 + v46)
    Phi_xx     = L_xx + L_xxxxxxxx*v2 + v0 + v19*v20 + v37*v40 + v48*v53 + v55*v62 + v63* &
      v72 + 0.00138888888888889d0*(30.0d0*v10 + v14 + 20.0d0*v29 + v4 + &
      360.0d0*v6 + 120.0d0*v8 + 15.0d0*(v24 + v35) + 6.0d0*(v12 + v17 + &
      v46))
    v79        = L_xyzzzzzz*v13
    v112       = v79 + 360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v73 + v78)
    v113       = v112*y
    Phi_xy     = 0.00138888888888889d0*(v74 + 360.0d0*v75 + 120.0d0*v76 + 30.0d0*v77 + &
      v79 + 20.0d0*v86 + 15.0d0*(v84 + v88) + 6.0d0*(v78 + v81 + v91)) &
      + L_xxxxxxxy*v2 + L_xy + v19*v82 + v37*v89 + v48*v92 + v55*v93 + &
      v63*v94 + v73
    v125       = L_xzzzzzzz*v13
    Phi_xz     = 0.00138888888888889d0*(v120 + 360.0d0*v121 + 120.0d0*v122 + 30.0d0*v123 &
      + v125 + 20.0d0*v132 + 15.0d0*(v130 + v134) + 6.0d0*(v124 + v127 &
      + v138)) + L_xxxxxxxz*v2 + L_xz + v119 + v128*v19 + v136*v37 + &
      v141*v48 + v145*v55 + v150*v63
    v156       = L_yyzzzzzz*v13
    v180       = v156 + 360.0d0*v152 + 120.0d0*v153 + 30.0d0*v154 + 6.0d0*(120.0d0*L_yy + &
      120.0d0*v151 + v155)
    Phi_yy     = 0.00138888888888889d0*(360.0d0*v152 + 120.0d0*v153 + 30.0d0*v154 + 6.0d0 &
      *v155 + v156) + L_xxxxxxyy*v2 + L_yy + L_yyyyyyyy*v106 + v151 + &
      v157*v158 + v159*v160 + v161*v162 + v163*v164 + v165*v166 + v19*( &
      L_xxxxxyyy*y + v50) + v37*(L_xxxxyyyy*v30 + v38*v57 + v59) + v48* &
      (L_xxxyyyyy*v25 + v49*v65 + v51*v67 + v69) + v55*(L_xxyyyyyy*v21 &
      + v16*v56 + v23*v58 + v28*v60 + v34) + v63*(L_xyyyyyyy*v15 + v64* &
      v80 + v66*v83 + v68*v85 + v70*v87 + v90)
    Phi_zz     = -(Phi_xx + Phi_yy)
    v186       = L_yzzzzzzz*v13
    Phi_yz     = 0.00138888888888889d0*(360.0d0*v182 + 120.0d0*v183 + 30.0d0*v184 + 6.0d0 &
      *v185 + v186) + L_xxxxxxyz*v2 + L_yyyyyyyz*v106 + L_yz + v157* &
      v187 + v159*v188 + v161*v189 + v163*v190 + v165*v191 + v181 + v19 &
      *(L_xxxxxyyz*y + v135) + v37*(L_xxxxyyyz*v30 + v139*v38 + v140) + &
      v48*(L_xxxyyyyz*v25 + v142*v49 + v143*v51 + v144) + v55*( &
      L_xxyyyyyz*v21 + v146*v56 + v147*v58 + v148*v60 + v149) + v63*( &
      L_xyyyyyyz*v15 + v126*v64 + v129*v66 + v131*v68 + v133*v70 + v137 &
      )
    c7         = c3*c4
    v104       = c7
    v197       = 0.000198412698412698d0*v104
    v105       = L_xzzzzzzz*v104
    Phi_x      = 0.000198412698412698d0*(840.0d0*v100 + 210.0d0*v101 + 42.0d0*v102 + v105 &
      + v98 + 2520.0d0*v99 + 7.0d0*(v103 + v113) + 21.0d0*(v107 + v111 &
      ) + 35.0d0*(v108 + v109)) + L_x + L_xxxxxxxx*v96 + v106*v80 + &
      v110*v40 + v114*v53 + v115*v62 + v116*v72 + v117*v118 + v2*v20 + &
      v95
    v174       = L_yzzzzzzz*v104
    Phi_y      = 0.000198412698412698d0*(2520.0d0*v169 + 840.0d0*v170 + 210.0d0*v171 + &
      42.0d0*v172 + 7.0d0*v173 + v174) + L_xxxxxxxy*v96 + L_y + &
      L_yyyyyyyy*v168 + v106*v158 + v110*v89 + v114*v92 + v115*v93 + &
      v116*v94 + v117*(v112 + v74 + 6.0d0*v81 + 15.0d0*v84 + 20.0d0*v86 &
      + 15.0d0*v88 + 6.0d0*v91) + v160*v175 + v162*v176 + v164*v177 + &
      v166*v178 + v167 + v179*v180 + v2*v82
    Phi_z      = L_z + L_xxxxxxxz*v96 + L_yyyyyyyz*v168 + L_zz*z + L_zzz*v192 + L_zzzz* &
      v193 + L_zzzzz*v194 + L_zzzzzz*v195 + L_zzzzzzz*v196 + L_zzzzzzzz &
      *v197 + v106*v187 + v110*v136 + v114*v141 + v115*v145 + v116*v150 &
      + v117*(720.0d0*L_xz + 720.0d0*v119 + v120 + 360.0d0*v121 + &
      120.0d0*v122 + 30.0d0*v123 + 6.0d0*v124 + v125 + 6.0d0*v127 + &
      15.0d0*v130 + 20.0d0*v132 + 15.0d0*v134 + 6.0d0*v138) + v128*v2 + &
      v175*v188 + v176*v189 + v177*v190 + v178*v191 + v179*(720.0d0* &
      L_yz + 720.0d0*v181 + 360.0d0*v182 + 120.0d0*v183 + 30.0d0*v184 + &
      6.0d0*v185 + v186)
    c8         = c4*c4
    Phi_0      = 2.48015873015873d-5*(L_xxxxxxxx*a8 + L_yyyyyyyy*b8 + L_zzzzzzzz*c8 + &
      70.0d0*(v164*v21 + v36*v62) + 8.0d0*(x*(5040.0d0*L_x + 840.0d0* &
      v100 + 210.0d0*v101 + 42.0d0*v102 + 7.0d0*v103 + v105 + 21.0d0* &
      v107 + 35.0d0*v108 + 35.0d0*v109 + 21.0d0*v111 + 7.0d0*v113 + &
      7.0d0*v3*v80 + 5040.0d0*v95 + v98 + 2520.0d0*v99) + y*(5040.0d0* &
      L_y + 5040.0d0*v167 + 2520.0d0*v169 + 840.0d0*v170 + 210.0d0*v171 &
      + 42.0d0*v172 + 7.0d0*v173 + v174)) + 28.0d0*(v1*v40 + v118*v54 + &
      v160*v3 + v180*v30) + 56.0d0*(v15*v162 + v166*v25 + v18*v53 + v47 &
      *v72)) + L_0 + L_z*z + L_zz*v192 + L_zzz*v193 + L_zzzz*v194 + &
      L_zzzzz*v195 + L_zzzzzz*v196 + L_zzzzzzz*v197 + v158*v168 + v20* &
      v96
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
#undef  L_yz                
#undef  Phi_yz              
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
    end subroutine mom_es_L2P2
    
! OPS  915*ADD + 2*DIV + 1085*MUL + 84*NEG + POW = 2087  (7021 before optimization)
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
                v382, v383, v384, v385, v386, v387, v388, v389, v39, v390,&
                v391, v392, v393, v394, v395, v396, v397, v398, v399, v4, v40,&
                v400, v401, v402, v403, v404, v405, v406, v407, v408, v409,&
                v41, v410, v411, v412, v413, v414, v415, v416, v417, v418,&
                v419, v42, v420, v421, v422, v423, v424, v425, v426, v427,&
                v428, v429, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
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
                L_yzzzzzzz, L_zzzzzzzz
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
#define L_yy                 L(1:2,7)
#define Ls_yy                Ls(1:2,7)
#define Ls_yz                Ls(1:2,8)
#define L_yz                 L(1:2,8)
#define Ls_xxx               Ls(1:2,9)
#define L_xxx                L(1:2,9)
#define Ls_xxy               Ls(1:2,10)
#define L_xxy                L(1:2,10)
#define Ls_xxz               Ls(1:2,11)
#define L_xxz                L(1:2,11)
#define L_xyy                L(1:2,12)
#define Ls_xyy               Ls(1:2,12)
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
#define L_xxxyyz             L(1:2,42)
#define Ls_xxxyyz            Ls(1:2,42)
#define Ls_xxyyyy            Ls(1:2,43)
#define L_xxyyyy             L(1:2,43)
#define Ls_xxyyyz            Ls(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define Ls_xyyyyy            Ls(1:2,45)
#define L_xyyyyy             L(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define Ls_xyyyyz            Ls(1:2,46)
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
#define Ls_xxxxxyz           Ls(1:2,53)
#define L_xxxxxyz            L(1:2,53)
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
#define L_xyyyyyy            L(1:2,60)
#define Ls_xyyyyyy           Ls(1:2,60)
#define L_xyyyyyz            L(1:2,61)
#define Ls_xyyyyyz           Ls(1:2,61)
#define Ls_yyyyyyy           Ls(1:2,62)
#define L_yyyyyyy            L(1:2,62)
#define Ls_yyyyyyz           Ls(1:2,63)
#define L_yyyyyyz            L(1:2,63)
#define L_xxxxxxxx           L(1:2,64)
#define Ls_xxxxxxxx          Ls(1:2,64)
#define Ls_xxxxxxxy          Ls(1:2,65)
#define L_xxxxxxxy           L(1:2,65)
#define Ls_xxxxxxxz          Ls(1:2,66)
#define L_xxxxxxxz           L(1:2,66)
#define Ls_xxxxxxyy          Ls(1:2,67)
#define L_xxxxxxyy           L(1:2,67)
#define Ls_xxxxxxyz          Ls(1:2,68)
#define L_xxxxxxyz           L(1:2,68)
#define Ls_xxxxxyyy          Ls(1:2,69)
#define L_xxxxxyyy           L(1:2,69)
#define L_xxxxxyyz           L(1:2,70)
#define Ls_xxxxxyyz          Ls(1:2,70)
#define Ls_xxxxyyyy          Ls(1:2,71)
#define L_xxxxyyyy           L(1:2,71)
#define L_xxxxyyyz           L(1:2,72)
#define Ls_xxxxyyyz          Ls(1:2,72)
#define Ls_xxxyyyyy          Ls(1:2,73)
#define L_xxxyyyyy           L(1:2,73)
#define Ls_xxxyyyyz          Ls(1:2,74)
#define L_xxxyyyyz           L(1:2,74)
#define L_xxyyyyyy           L(1:2,75)
#define Ls_xxyyyyyy          Ls(1:2,75)
#define Ls_xxyyyyyz          Ls(1:2,76)
#define L_xxyyyyyz           L(1:2,76)
#define L_xyyyyyyy           L(1:2,77)
#define Ls_xyyyyyyy          Ls(1:2,77)
#define L_xyyyyyyz           L(1:2,78)
#define Ls_xyyyyyyz          Ls(1:2,78)
#define L_yyyyyyyy           L(1:2,79)
#define Ls_yyyyyyyy          Ls(1:2,79)
#define Ls_yyyyyyyz          Ls(1:2,80)
#define L_yyyyyyyz           L(1:2,80)
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
    v222        = 0.00833333333333333d0*x
    v236        = L_xyyyyyz*z
    v239        = v11*y
    v242        = L_xyyyyz*z
    v253        = L_xyyyz*z
    v269        = L_xyyz*z
    v289        = L_xyz*z
    v313        = L_xz*z
    v335        = 0.00138888888888889d0*x
    v351        = L_yyyyyyz*z
    v354        = L_yyyyyz*z
    v357        = 0.5d0*y
    v361        = L_yyyyz*z
    v366        = 0.166666666666667d0*y
    v372        = L_yyyz*z
    v379        = 0.0416666666666667d0*y
    v386        = L_yyz*z
    v395        = 0.00833333333333333d0*y
    v403        = L_yz*z
    v415        = 0.00138888888888889d0*y
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
    v338        = L_xzz*z
    L_yzz       = -(L_xxy + L_yyy)
    v417        = L_yzz*z
    L_zzz       = -(L_xxz + L_yyz)
    L_xxzz      = -(L_xxxx + L_xxyy)
    v225        = L_xxzz*z
    L_xyzz      = -(L_xxxy + L_xyyy)
    v302        = L_xyzz*z
    L_xzzz      = -(L_xxxz + L_xyyz)
    L_yyzz      = -(L_xxyy + L_yyyy)
    v397        = L_yyzz*z
    L_yzzz      = -(L_xxyz + L_yyyz)
    L_zzzz      = -(L_xxzz + L_yyzz)
    L_xxxzz     = -(L_xxxxx + L_xxxyy)
    v140        = L_xxxzz*z
    L_xxyzz     = -(L_xxxxy + L_xxyyy)
    v193        = L_xxyzz*z
    L_xxzzz     = -(L_xxxxz + L_xxyyz)
    L_xyyzz     = -(L_xxxyy + L_xyyyy)
    v280        = L_xyyzz*z
    L_xyzzz     = -(L_xxxyz + L_xyyyz)
    L_xzzzz     = -(L_xxxzz + L_xyyzz)
    L_yyyzz     = -(L_xxyyy + L_yyyyy)
    v381        = L_yyyzz*z
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
    v262        = L_xyyyzz*z
    L_xyyzzz    = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz    = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz    = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz    = -(L_xxyyyy + L_yyyyyy)
    v368        = L_yyyyzz*z
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
    v249        = L_xyyyyzz*z
    L_xyyyzzz   = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz   = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz   = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz   = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz   = -(L_xxyyyyy + L_yyyyyyy)
    v359        = L_yyyyyzz*z
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
    v240        = L_xyyyyyz + L_xyyyyyzz*z
    v241        = L_xyyyyyyz*y + v240
    v252        = v240*y
    Ls_xyyyyyz  = L_xxyyyyyz*x + v241
    L_xyyyyzzz  = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz  = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz  = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz  = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz  = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz  = -(L_xxyyyyyy + L_yyyyyyyy)
    v353        = L_yyyyyyz + L_yyyyyyzz*z
    Ls_yyyyyyz  = v353 + L_xyyyyyyz*x + L_yyyyyyyz*y
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
    v221        = 0.0208333333333333d0*v15
    v334        = 0.00416666666666667d0*v15
    a3          = a1*a2
    v30         = a3
    v31         = 0.166666666666667d0*v30
    v135        = 0.0833333333333333d0*v30
    v220        = 0.0277777777777778d0*v30
    v333        = 0.00694444444444444d0*v30
    a4          = a2*a2
    v64         = a4
    v65         = 0.0416666666666667d0*v64
    v217        = 0.0208333333333333d0*v64
    v332        = 0.00694444444444444d0*v64
    a5          = a2*a3
    v121        = a5
    v122        = 0.00833333333333333d0*v121
    v328        = 0.00416666666666667d0*v121
    a6          = a3*a3
    v203        = a6
    v204        = 0.00138888888888889d0*v203
    a7          = a3*a4
    v314        = 0.000198412698412698d0*a7
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
    v237        = L_xyyyyyyy*v17
    v250        = L_xyyyyyyz*v17
    v365        = 0.25d0*v17
    v378        = 0.0833333333333333d0*v17
    v394        = 0.0208333333333333d0*v17
    v414        = 0.00416666666666667d0*v17
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
    v243        = L_xyyyyyyy*v32
    v263        = L_xyyyyyyz*v32
    v377        = 0.0833333333333333d0*v32
    v393        = 0.0277777777777778d0*v32
    v413        = 0.00694444444444444d0*v32
    b4          = b2*b2
    v66         = b4
    v67         = L_xxxxyyyy*v66
    v105        = L_xxxyyyyy*v66
    v130        = 0.0416666666666667d0*v66
    v141        = L_xxxyyyyz*v66
    v167        = L_xxyyyyyy*v66
    v194        = L_xxyyyyyz*v66
    v223        = 5.0d0*v66
    v254        = L_xyyyyyyy*v66
    v281        = L_xyyyyyyz*v66
    v392        = 0.0208333333333333d0*v66
    v412        = 0.00694444444444444d0*v66
    b5          = b2*b3
    v123        = b5
    v124        = L_xxxyyyyy*v123
    v183        = L_xxyyyyyy*v123
    v213        = 0.00833333333333333d0*v123
    v226        = L_xxyyyyyz*v123
    v270        = L_xyyyyyyy*v123
    v303        = L_xyyyyyyz*v123
    v336        = 6.0d0*v123
    v411        = 0.00416666666666667d0*v123
    b6          = b3*b3
    v205        = b6
    v206        = L_xxyyyyyy*v205
    v290        = L_xyyyyyyy*v205
    v324        = 0.00138888888888889d0*v205
    v339        = L_xyyyyyyz*v205
    b7          = b3*b4
    v315        = b7
    v316        = L_xyyyyyyy*v315
    v404        = 0.000198412698412698d0*v315
    b8          = b4*b4
    c2          = c1*c1
    v19         = c2
    v424        = 0.5d0*v19
    v317        = L_xzz*v19
    v405        = L_yzz*v19
    v207        = L_xxzz*v19
    v291        = L_xyzz*v19
    v340        = L_xzzz*v19
    v387        = L_yyzz*v19
    v418        = L_yzzz*v19
    v125        = L_xxxzz*v19
    v184        = L_xxyzz*v19
    v227        = L_xxzzz*v19
    v271        = L_xyyzz*v19
    v304        = L_xyzzz*v19
    v373        = L_yyyzz*v19
    v398        = L_yyzzz*v19
    v68         = L_xxxxzz*v19
    v106        = L_xxxyzz*v19
    v142        = L_xxxzzz*v19
    v168        = L_xxyyzz*v19
    v195        = L_xxyzzz*v19
    v255        = L_xyyyzz*v19
    v282        = L_xyyzzz*v19
    v362        = L_yyyyzz*v19
    v382        = L_yyyzzz*v19
    v34         = L_xxxxxzz*v19
    v54         = L_xxxxyzz*v19
    v82         = L_xxxxzzz*v19
    v95         = L_xxxyyzz*v19
    v115        = L_xxxyzzz*v19
    v157        = L_xxyyyzz*v19
    v177        = L_xxyyzzz*v19
    v244        = L_xyyyyzz*v19
    v264        = L_xyyyzzz*v19
    v355        = L_yyyyyzz*v19
    v369        = L_yyyyzzz*v19
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
    v214        = v159*v66
    v248        = 2.0d0*v152 + v150 + v159
    Ls_xxyyyy   = 0.5d0*(v150 + v151) + L_xxxxyyyy*v16 + L_xxyyyy + v149 + v152 + v8*x
    v164        = L_xxyyyzzz*v19
    v179        = v164 + 2.0d0*(L_xxyyyz + v162)
    v180        = v179*y
    v198        = v17*v179
    v231        = v179*v32
    v268        = 2.0d0*v165 + v163 + v179
    Ls_xxyyyz   = 0.5d0*(v163 + v164) + L_xxxxyyyz*v16 + L_xxyyyz + v162 + v165 + v92*x
    v238        = L_xyyyyyzz*v19
    v246        = v238 + 2.0d0*(L_xyyyyy + v236)
    v247        = v246*y
    v258        = v17*v246
    v275        = v246*v32
    v296        = v246*v66
    v325        = v123*v246
    Ls_xyyyyy   = 0.5d0*(v237 + v238) + L_xxxyyyyy*v16 + L_xyyyyy + v10*x + v236 + v239
    v251        = L_xyyyyzzz*v19
    v266        = v251 + 2.0d0*(L_xyyyyz + v249)
    v267        = v266*y
    v285        = v17*v266
    v308        = v266*v32
    v345        = v266*v66
    Ls_xyyyyz   = 0.5d0*(v250 + v251) + L_xxxyyyyz*v16 + L_xyyyyz + v154*x + v249 + v252
    v352        = L_yyyyyyzz*v19
    v358        = v352 + 2.0d0*(L_yyyyyy + v351)
    Ls_yyyyyy   = 0.5d0*v352 + L_xxyyyyyy*v16 + L_yyyyyy + L_yyyyyyyy*v37 + v12*x + v13*y &
      + v351
    v360        = L_yyyyyzzz*v19
    v371        = v360 + 2.0d0*(L_yyyyyz + v359)
    Ls_yyyyyz   = 0.5d0*v360 + L_xxyyyyyz*v16 + L_yyyyyyyz*v37 + L_yyyyyz + v241*x + v353* &
      y + v359
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
    v425        = 0.166666666666667d0*v35
    v318        = L_xzzz*v35
    v406        = L_yzzz*v35
    v208        = L_xxzzz*v35
    v292        = L_xyzzz*v35
    v341        = L_xzzzz*v35
    v388        = L_yyzzz*v35
    v419        = L_yzzzz*v35
    v126        = L_xxxzzz*v35
    v185        = L_xxyzzz*v35
    v228        = L_xxzzzz*v35
    v272        = L_xyyzzz*v35
    v305        = L_xyzzzz*v35
    v374        = L_yyyzzz*v35
    v399        = L_yyzzzz*v35
    v69         = L_xxxxzzz*v35
    v107        = L_xxxyzzz*v35
    v143        = L_xxxzzzz*v35
    v169        = L_xxyyzzz*v35
    v196        = L_xxyzzzz*v35
    v256        = L_xyyyzzz*v35
    v283        = L_xyyzzzz*v35
    v363        = L_yyyyzzz*v35
    v383        = L_yyyzzzz*v35
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
    v215        = v172*v32
    v261        = v156 + v172 + 3.0d0*v160 + v78*v9
    Ls_xxyyy    = 0.166666666666667d0*(v156 + v158 + 3.0d0*(v157 + v160)) + L_xxxxxyyy*v31 &
      + L_xxyyy + v155 + v16*v6 + v161*v40 + v37*v9
    v178        = L_xxyyzzzz*v35
    v199        = v178 + 3.0d0*(2.0d0*L_xxyyz + 2.0d0*v175 + v177)
    v200        = v199*y
    v232        = v17*v199
    v288        = v176 + v199 + v153*v78 + 3.0d0*v180
    Ls_xxyyz    = 0.166666666666667d0*(v176 + v178 + 3.0d0*(v177 + v180)) + L_xxxxxyyz*v31 &
      + L_xxyyz + v153*v37 + v16*v51 + v175 + v181*v40
    v245        = L_xyyyyzzz*v35
    v259        = v245 + 3.0d0*(2.0d0*L_xyyyy + 2.0d0*v242 + v244)
    v260        = v259*y
    v276        = v17*v259
    v297        = v259*v32
    v326        = v259*v66
    Ls_xyyyy    = 0.166666666666667d0*(v243 + v245 + 3.0d0*(v244 + v247)) + L_xxxxyyyy*v31 &
      + L_xyyyy + v11*v37 + v16*v8 + v242 + v248*v40
    v265        = L_xyyyzzzz*v35
    v286        = v265 + 3.0d0*(2.0d0*L_xyyyz + 2.0d0*v262 + v264)
    v287        = v286*y
    v309        = v17*v286
    v346        = v286*v32
    Ls_xyyyz    = 0.166666666666667d0*(v263 + v265 + 3.0d0*(v264 + v267)) + L_xxxxyyyz*v31 &
      + L_xyyyz + v16*v92 + v240*v37 + v262 + v268*v40
    v356        = L_yyyyyzzz*v35
    v367        = v356 + 3.0d0*(2.0d0*L_yyyyy + 2.0d0*v354 + v355)
    Ls_yyyyy    = 0.166666666666667d0*(3.0d0*v355 + v356) + L_xxxyyyyy*v31 + L_yyyyy + &
      L_yyyyyyyy*v72 + v10*v16 + v13*v37 + v354 + v357*v358 + v40*(v237 &
      + 2.0d0*v239 + v246)
    v370        = L_yyyyzzzz*v35
    v385        = v370 + 3.0d0*(2.0d0*L_yyyyz + 2.0d0*v368 + v369)
    Ls_yyyyz    = 0.166666666666667d0*(3.0d0*v369 + v370) + L_xxxyyyyz*v31 + L_yyyyyyyz* &
      v72 + L_yyyyz + v154*v16 + v353*v37 + v357*v371 + v368 + v40*( &
      v250 + 2.0d0*v252 + v266)
    c4          = c2*c2
    v70         = c4
    v426        = 0.0416666666666667d0*v70
    v319        = L_xzzzz*v70
    v407        = L_yzzzz*v70
    v209        = L_xxzzzz*v70
    v293        = L_xyzzzz*v70
    v342        = L_xzzzzz*v70
    v389        = L_yyzzzz*v70
    v420        = L_yzzzzz*v70
    v127        = L_xxxzzzz*v70
    v186        = L_xxyzzzz*v70
    v229        = L_xxzzzzz*v70
    v273        = L_xyyzzzz*v70
    v306        = L_xyzzzzz*v70
    v375        = L_yyyzzzz*v70
    v400        = L_yyzzzzz*v70
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
    v235        = v141 + v144 + v138*v91 + 12.0d0*v142 + 6.0d0*v145 + 24.0d0*(L_xxxz + &
      v140) + 4.0d0*(v143 + v147)
    Ls_xxxz     = 0.0416666666666667d0*(v141 + 12.0d0*v142 + v144 + 6.0d0*v145 + 4.0d0*( &
      v143 + v147)) + L_xxxxxxxz*v65 + L_xxxz + v140 + v148*v77 + v22* &
      v31 + v72*v91 + v76*v86
    v170        = L_xxyyzzzz*v70
    v190        = v170 + 12.0d0*v168 + 4.0d0*(6.0d0*L_xxyy + 6.0d0*v166 + v169)
    v191        = v190*y
    v216        = v17*v190
    v279        = v167 + v190 + v138*v9 + 6.0d0*v171 + 4.0d0*v173
    Ls_xxyy     = 0.0416666666666667d0*(v167 + 12.0d0*v168 + v170 + 6.0d0*v171 + 4.0d0*( &
      v169 + v173)) + L_xxxxxxyy*v65 + L_xxyy + v166 + v174*v77 + v31* &
      v4 + v72*v9 + v76*v99
    v197        = L_xxyzzzzz*v70
    v233        = v197 + 12.0d0*v195 + 4.0d0*(6.0d0*L_xxyz + 6.0d0*v193 + v196)
    v234        = v233*y
    v312        = v194 + v233 + v138*v153 + 6.0d0*v198 + 4.0d0*v200
    Ls_xxyz     = 0.0416666666666667d0*(v194 + 12.0d0*v195 + v197 + 6.0d0*v198 + 4.0d0*( &
      v196 + v200)) + L_xxxxxxyz*v65 + L_xxyz + v119*v76 + v153*v72 + &
      v193 + v201*v77 + v28*v31
    v257        = L_xyyyzzzz*v70
    v277        = v257 + 12.0d0*v255 + 4.0d0*(6.0d0*L_xyyy + 6.0d0*v253 + v256)
    v278        = v277*y
    v298        = v17*v277
    v327        = v277*v32
    Ls_xyyy     = 0.0416666666666667d0*(v254 + 12.0d0*v255 + v257 + 6.0d0*v258 + 4.0d0*( &
      v256 + v260)) + L_xxxxxyyy*v65 + L_xyyy + v11*v72 + v161*v76 + &
      v253 + v261*v77 + v31*v6
    v284        = L_xyyzzzzz*v70
    v310        = v284 + 12.0d0*v282 + 4.0d0*(6.0d0*L_xyyz + 6.0d0*v280 + v283)
    v311        = v310*y
    v347        = v17*v310
    Ls_xyyz     = 0.0416666666666667d0*(v281 + 12.0d0*v282 + v284 + 6.0d0*v285 + 4.0d0*( &
      v283 + v287)) + L_xxxxxyyz*v65 + L_xyyz + v181*v76 + v240*v72 + &
      v280 + v288*v77 + v31*v51
    v364        = L_yyyyzzzz*v70
    v380        = v364 + 12.0d0*v362 + 4.0d0*(6.0d0*L_yyyy + 6.0d0*v361 + v363)
    Ls_yyyy     = 0.0416666666666667d0*(12.0d0*v362 + 4.0d0*v363 + v364) + L_xxxxyyyy*v65 &
      + L_yyyy + L_yyyyyyyy*v130 + v13*v72 + v248*v76 + v31*v8 + v358* &
      v365 + v361 + v366*v367 + v77*(v11*v78 + v243 + 3.0d0*v247 + v259 &
      )
    v384        = L_yyyzzzzz*v70
    v402        = v384 + 12.0d0*v382 + 4.0d0*(6.0d0*L_yyyz + 6.0d0*v381 + v383)
    Ls_yyyz     = 0.0416666666666667d0*(12.0d0*v382 + 4.0d0*v383 + v384) + L_xxxxyyyz*v65 &
      + L_yyyyyyyz*v130 + L_yyyz + v268*v76 + v31*v92 + v353*v72 + v365 &
      *v371 + v366*v385 + v381 + v77*(v240*v78 + v263 + 3.0d0*v267 + &
      v286)
    c5          = c2*c3
    v128        = c5
    v427        = 0.00833333333333333d0*v128
    v320        = L_xzzzzz*v128
    v408        = L_yzzzzz*v128
    v210        = L_xxzzzzz*v128
    v294        = L_xyzzzzz*v128
    v343        = L_xzzzzzz*v128
    v390        = L_yyzzzzz*v128
    v421        = L_yzzzzzz*v128
    v129        = L_xxxzzzzz*v128
    v224        = v124 + v129 + 60.0d0*v125 + 20.0d0*v126 + v223*v7 + 120.0d0*(L_xxx + &
      v120) + 5.0d0*(v127 + v134) + 10.0d0*(v131 + v132)
    Ls_xxx      = 0.00833333333333333d0*(v124 + 60.0d0*v125 + 20.0d0*v126 + v129 + 5.0d0*( &
      v127 + v134) + 10.0d0*(v131 + v132)) + L_xxx + L_xxxxxxxx*v122 + &
      v0*v65 + v120 + v130*v7 + v135*v41 + v136*v79 + v137*v139
    v187        = L_xxyzzzzz*v128
    v218        = v187 + 60.0d0*v184 + 20.0d0*v185 + 5.0d0*(24.0d0*L_xxy + 24.0d0*v182 + &
      v186)
    v219        = v218*y
    v301        = v183 + v218 + 5.0d0*v191 + v223*v9 + 10.0d0*(v188 + v189)
    Ls_xxy      = 0.00833333333333333d0*(v183 + 60.0d0*v184 + 20.0d0*v185 + v187 + 5.0d0*( &
      v186 + v191) + 10.0d0*(v188 + v189)) + L_xxxxxxxy*v122 + L_xxy + &
      v112*v136 + v130*v9 + v135*v58 + v137*v192 + v182 + v2*v65
    v230        = L_xxzzzzzz*v128
    v350        = v226 + v230 + v153*v223 + 60.0d0*v227 + 20.0d0*v228 + 120.0d0*(L_xxz + &
      v225) + 5.0d0*(v229 + v234) + 10.0d0*(v231 + v232)
    Ls_xxz      = 0.00833333333333333d0*(v226 + 60.0d0*v227 + 20.0d0*v228 + v230 + 5.0d0*( &
      v229 + v234) + 10.0d0*(v231 + v232)) + L_xxxxxxxz*v122 + L_xxz + &
      v130*v153 + v135*v86 + v136*v148 + v137*v235 + v22*v65 + v225
    v274        = L_xyyzzzzz*v128
    v299        = v274 + 60.0d0*v271 + 20.0d0*v272 + 5.0d0*(24.0d0*L_xyy + 24.0d0*v269 + &
      v273)
    v300        = v299*y
    v329        = v17*v299
    Ls_xyy      = 0.00833333333333333d0*(v270 + 60.0d0*v271 + 20.0d0*v272 + v274 + 5.0d0*( &
      v273 + v278) + 10.0d0*(v275 + v276)) + L_xxxxxxyy*v122 + L_xyy + &
      v11*v130 + v135*v99 + v136*v174 + v137*v279 + v269 + v4*v65
    v307        = L_xyzzzzzz*v128
    v348        = v307 + 60.0d0*v304 + 20.0d0*v305 + 5.0d0*(24.0d0*L_xyz + 24.0d0*v302 + &
      v306)
    v349        = v348*y
    Ls_xyz      = 0.00833333333333333d0*(v303 + 60.0d0*v304 + 20.0d0*v305 + v307 + 5.0d0*( &
      v306 + v311) + 10.0d0*(v308 + v309)) + L_xxxxxxyz*v122 + L_xyz + &
      v119*v135 + v130*v240 + v136*v201 + v137*v312 + v28*v65 + v302
    v376        = L_yyyzzzzz*v128
    v396        = v376 + 60.0d0*v373 + 20.0d0*v374 + 5.0d0*(24.0d0*L_yyy + 24.0d0*v372 + &
      v375)
    Ls_yyy      = 0.00833333333333333d0*(60.0d0*v373 + 20.0d0*v374 + 5.0d0*v375 + v376) + &
      L_xxxxxyyy*v122 + L_yyy + L_yyyyyyyy*v213 + v13*v130 + v135*v161 &
      + v136*v261 + v137*(v11*v138 + v254 + 6.0d0*v258 + 4.0d0*v260 + &
      v277) + v358*v377 + v367*v378 + v372 + v379*v380 + v6*v65
    v401        = L_yyzzzzzz*v128
    v423        = v401 + 60.0d0*v398 + 20.0d0*v399 + 5.0d0*(24.0d0*L_yyz + 24.0d0*v397 + &
      v400)
    Ls_yyz      = 0.00833333333333333d0*(60.0d0*v398 + 20.0d0*v399 + 5.0d0*v400 + v401) + &
      L_xxxxxyyz*v122 + L_yyyyyyyz*v213 + L_yyz + v130*v353 + v135*v181 &
      + v136*v288 + v137*(v138*v240 + v281 + 6.0d0*v285 + 4.0d0*v287 + &
      v310) + v371*v377 + v378*v385 + v379*v402 + v397 + v51*v65
    c6          = c3*c3
    v211        = c6
    v428        = 0.00138888888888889d0*v211
    v321        = L_xzzzzzz*v211
    v409        = L_yzzzzzz*v211
    v212        = L_xxzzzzzz*v211
    v337        = v206 + v212 + 360.0d0*v207 + 120.0d0*v208 + 30.0d0*v209 + 20.0d0*v215 + &
      v336*v9 + 720.0d0*(L_xx + v202) + 6.0d0*(v210 + v219) + 15.0d0*( &
      v214 + v216)
    Ls_xx       = 0.00138888888888889d0*(v206 + 360.0d0*v207 + 120.0d0*v208 + 30.0d0*v209 &
      + v212 + 20.0d0*v215 + 6.0d0*(v210 + v219) + 15.0d0*(v214 + v216 &
      )) + L_xx + L_xxxxxxxx*v204 + v0*v122 + v139*v221 + v202 + v213* &
      v9 + v217*v41 + v220*v79 + v222*v224
    v295        = L_xyzzzzzz*v211
    v330        = v295 + 360.0d0*v291 + 120.0d0*v292 + 30.0d0*v293 + 6.0d0*(120.0d0*L_xy + &
      120.0d0*v289 + v294)
    v331        = v330*y
    Ls_xy       = 0.00138888888888889d0*(v290 + 360.0d0*v291 + 120.0d0*v292 + 30.0d0*v293 &
      + v295 + 20.0d0*v297 + 6.0d0*(v294 + v300) + 15.0d0*(v296 + v298 &
      )) + L_xxxxxxxy*v204 + L_xy + v11*v213 + v112*v220 + v122*v2 + &
      v192*v221 + v217*v58 + v222*v301 + v289
    v344        = L_xzzzzzzz*v211
    Ls_xz       = 0.00138888888888889d0*(v339 + 360.0d0*v340 + 120.0d0*v341 + 30.0d0*v342 &
      + v344 + 20.0d0*v346 + 6.0d0*(v343 + v349) + 15.0d0*(v345 + v347 &
      )) + L_xxxxxxxz*v204 + L_xz + v122*v22 + v148*v220 + v213*v240 + &
      v217*v86 + v221*v235 + v222*v350 + v338
    v391        = L_yyzzzzzz*v211
    v416        = v391 + 360.0d0*v387 + 120.0d0*v388 + 30.0d0*v389 + 6.0d0*(120.0d0*L_yy + &
      120.0d0*v386 + v390)
    Ls_yy       = 0.00138888888888889d0*(360.0d0*v387 + 120.0d0*v388 + 30.0d0*v389 + 6.0d0 &
      *v390 + v391) + L_xxxxxxyy*v204 + L_yy + L_yyyyyyyy*v324 + v122* &
      v4 + v13*v213 + v174*v220 + v217*v99 + v221*v279 + v222*(v11*v223 &
      + v270 + 10.0d0*v275 + 10.0d0*v276 + 5.0d0*v278 + v299) + v358* &
      v392 + v367*v393 + v380*v394 + v386 + v395*v396
    v422        = L_yzzzzzzz*v211
    Ls_yz       = 0.00138888888888889d0*(360.0d0*v418 + 120.0d0*v419 + 30.0d0*v420 + 6.0d0 &
      *v421 + v422) + L_xxxxxxyz*v204 + L_yyyyyyyz*v324 + L_yz + v119* &
      v217 + v122*v28 + v201*v220 + v213*v353 + v221*v312 + v222*(v223* &
      v240 + v303 + 10.0d0*v308 + 10.0d0*v309 + 5.0d0*v311 + v348) + &
      v371*v392 + v385*v393 + v394*v402 + v395*v423 + v417
    c7          = c3*c4
    v322        = c7
    v429        = 0.000198412698412698d0*v322
    v323        = L_xzzzzzzz*v322
    Ls_x        = 0.000198412698412698d0*(v316 + 2520.0d0*v317 + 840.0d0*v318 + 210.0d0* &
      v319 + 42.0d0*v320 + v323 + 7.0d0*(v321 + v331) + 21.0d0*(v325 + &
      v329) + 35.0d0*(v326 + v327)) + L_x + L_xxxxxxxx*v314 + v0*v204 + &
      v11*v324 + v139*v333 + v224*v334 + v313 + v328*v41 + v332*v79 + &
      v335*v337
    v410        = L_yzzzzzzz*v322
    Ls_y        = 0.000198412698412698d0*(2520.0d0*v405 + 840.0d0*v406 + 210.0d0*v407 + &
      42.0d0*v408 + 7.0d0*v409 + v410) + L_xxxxxxxy*v314 + L_y + &
      L_yyyyyyyy*v404 + v112*v332 + v13*v324 + v192*v333 + v2*v204 + &
      v301*v334 + v328*v58 + v335*(v11*v336 + v290 + 15.0d0*v296 + &
      20.0d0*v297 + 15.0d0*v298 + 6.0d0*v300 + v330) + v358*v411 + v367 &
      *v412 + v380*v413 + v396*v414 + v403 + v415*v416
    Ls_z        = L_z + L_xxxxxxxz*v314 + L_yyyyyyyz*v404 + L_zz*z + L_zzz*v424 + L_zzzz* &
      v425 + L_zzzzz*v426 + L_zzzzzz*v427 + L_zzzzzzz*v428 + L_zzzzzzzz &
      *v429 + v148*v332 + v204*v22 + v235*v333 + v324*v353 + v328*v86 + &
      v334*v350 + v335*(720.0d0*L_xz + v240*v336 + 720.0d0*v338 + v339 &
      + 360.0d0*v340 + 120.0d0*v341 + 30.0d0*v342 + 6.0d0*v343 + v344 + &
      15.0d0*v345 + 20.0d0*v346 + 15.0d0*v347 + 6.0d0*v349) + v371*v411 &
      + v385*v412 + v402*v413 + v414*v423 + v415*(720.0d0*L_yz + &
      720.0d0*v417 + 360.0d0*v418 + 120.0d0*v419 + 30.0d0*v420 + 6.0d0* &
      v421 + v422)
    c8          = c4*c4
    Ls_0        = 2.48015873015873d-5*(L_xxxxxxxx*a8 + L_yyyyyyyy*b8 + L_zzzzzzzz*c8 + &
      70.0d0*(v139*v64 + v380*v66) + 8.0d0*(x*(5040.0d0*L_x + 7.0d0*v11 &
      *v205 + 5040.0d0*v313 + v316 + 2520.0d0*v317 + 840.0d0*v318 + &
      210.0d0*v319 + 42.0d0*v320 + 7.0d0*v321 + v323 + 21.0d0*v325 + &
      35.0d0*v326 + 35.0d0*v327 + 21.0d0*v329 + 7.0d0*v331) + y*( &
      5040.0d0*L_y + 5040.0d0*v403 + 2520.0d0*v405 + 840.0d0*v406 + &
      210.0d0*v407 + 42.0d0*v408 + 7.0d0*v409 + v410)) + 56.0d0*(v121* &
      v79 + v123*v367 + v224*v30 + v32*v396) + 28.0d0*(v15*v337 + v17* &
      v416 + v203*v41 + v205*v358)) + L_0 + L_z*z + L_zz*v424 + L_zzz* &
      v425 + L_zzzz*v426 + L_zzzzz*v427 + L_zzzzzz*v428 + L_zzzzzzz* &
      v429 + v0*v314 + v13*v404
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
#undef  L_xxxyyz            
#undef  Ls_xxxyyz           
#undef  Ls_xxyyyy           
#undef  L_xxyyyy            
#undef  Ls_xxyyyz           
#undef  L_xxyyyz            
#undef  Ls_xyyyyy           
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  Ls_xyyyyz           
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
#undef  Ls_xxxxxyz          
#undef  L_xxxxxyz           
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
#undef  L_xyyyyyy           
#undef  Ls_xyyyyyy          
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
#undef  L_xyyyyyyz          
#undef  Ls_xyyyyyyz         
#undef  L_yyyyyyyy          
#undef  Ls_yyyyyyyy         
#undef  Ls_yyyyyyyz         
#undef  L_yyyyyyyz          
    end subroutine mom_es_L2L2_add
#endif
end module mom8
