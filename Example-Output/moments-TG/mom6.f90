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
        
    
! OPS  2*ADD + 2*DIV + 158*MUL + POW = 163  (383 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52,&
                v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v7, v8, v9,&
                h, u
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
    v51      = W*y
    v52      = W*z
    v53      = 0.5d0*W
    v54      = 0.166666666666667d0*W
    v55      = 0.0416666666666667d0*W
    v58      = 0.00833333333333333d0*W
    v61      = 0.0208333333333333d0*W
    v0       = W*x
    v1       = v51
    v2       = v52
    v3       = v53
    v5       = v0*y
    v6       = v0*z
    v8       = v1*z
    v10      = v54
    v13      = v53*x
    v18      = v55
    v22      = v54*x
    v29      = v58
    v36      = v55*x
    v45      = 0.00138888888888889d0*W
    v50      = v58*x
    M_0      = W
    M_x      = v0
    M_y      = v1
    M_z      = v2
    M_xy     = v5
    M_xz     = v6
    M_yz     = v8
    M_xyz    = v5*z
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v4       = a2
    v56      = W*v4
    v12      = 0.5d0*v4
    v21      = 0.25d0*v56
    v33      = 0.0833333333333333d0*v56
    v34      = v4*v52
    v35      = v4*v51
    v49      = v4*v61
    M_xx     = v3*v4
    M_xxy    = v1*v12
    M_xxz    = v12*v2
    M_xxyz   = v12*v8
    a3       = a1*a2
    v11      = a3
    v59      = W*v11
    v20      = 0.166666666666667d0*v11
    v32      = 0.0833333333333333d0*v59
    v48      = 0.0277777777777778d0*v59
    M_xxx    = v10*v11
    M_xxxy   = v1*v20
    M_xxxz   = v2*v20
    M_xxxyz  = v20*v8
    a4       = a2*a2
    v19      = a4
    v31      = 0.0416666666666667d0*v19
    v47      = v19*v61
    M_xxxx   = v18*v19
    M_xxxxy  = v1*v31
    M_xxxxz  = v2*v31
    M_xxxxyz = v31*v8
    a5       = a2*a3
    v30      = a5
    v46      = 0.00833333333333333d0*v30
    M_xxxxx  = v29*v30
    M_xxxxxy = v1*v46
    M_xxxxxz = v2*v46
    a6       = a3*a3
    M_xxxxxx = a6*v45
    b2       = b1*b1
    v7       = b2
    v57      = W*v7
    v15      = 0.5d0*v7
    v26      = v57
    v37      = v57*x
    M_yy     = v3*v7
    M_xyy    = v13*v7
    M_yyz    = v15*v2
    M_xxyy   = v21*v7
    M_xyyz   = v15*v6
    M_xxxyy  = v32*v7
    M_xxyyz  = 0.25d0*v34*v7
    M_xxxxyy = v47*v7
    M_xxxyyz = 0.0833333333333333d0*v11*v2*v7
    b3       = b1*b2
    v14      = b3
    v60      = W*v14
    v24      = 0.166666666666667d0*v14
    v41      = v60
    M_yyy    = v10*v14
    M_xyyy   = v14*v22
    M_yyyz   = v2*v24
    M_xxyyy  = v14*v33
    M_xyyyz  = v24*v6
    M_xxxyyy = v14*v48
    M_xxyyyz = 0.0833333333333333d0*v14*v34
    b4       = b2*b2
    v23      = b4
    v39      = 0.0416666666666667d0*v23
    M_yyyy   = v18*v23
    M_xyyyy  = v23*v36
    M_yyyyz  = v2*v39
    M_xxyyyy = v23*v49
    M_xyyyyz = v39*v6
    b5       = b2*b3
    v38      = b5
    M_yyyyy  = v29*v38
    M_xyyyyy = v38*v50
    M_yyyyyz = 0.00833333333333333d0*v2*v38
    b6       = b3*b3
    M_yyyyyy = b6*v45
    c2       = c1*c1
    v9       = c2
    v16      = 0.5d0*v9
    v25      = 0.25d0*v9
    v40      = 0.0833333333333333d0*v9
    M_zz     = v3*v9
    M_xzz    = v13*v9
    M_yzz    = v1*v16
    M_xxzz   = v21*v9
    M_xyzz   = v16*v5
    M_yyzz   = v25*v26
    M_xxxzz  = v32*v9
    M_xxyzz  = v25*v35
    M_xyyzz  = v25*v37
    M_yyyzz  = v40*v41
    M_xxxxzz = v47*v9
    M_xxxyzz = v11*v40*v51
    M_xxyyzz = 0.125d0*v4*v57*v9
    M_xyyyzz = v40*v60*x
    M_yyyyzz = v23*v61*v9
    h        = v4 + v7 + v9
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
    v17      = c3
    v27      = 0.166666666666667d0*v17
    v42      = 0.0833333333333333d0*v17
    M_zzz    = v10*v17
    M_xzzz   = v17*v22
    M_yzzz   = v1*v27
    M_xxzzz  = v17*v33
    M_xyzzz  = v27*v5
    M_yyzzz  = v26*v42
    M_xxxzzz = v17*v48
    M_xxyzzz = v35*v42
    M_xyyzzz = v37*v42
    M_yyyzzz = 0.0277777777777778d0*v17*v41
    c4       = c2*c2
    v28      = c4
    v43      = 0.0416666666666667d0*v28
    M_zzzz   = v18*v28
    M_xzzzz  = v28*v36
    M_yzzzz  = v1*v43
    M_xxzzzz = v28*v49
    M_xyzzzz = v43*v5
    M_yyzzzz = 0.0208333333333333d0*v26*v28
    c5       = c2*c3
    v44      = c5
    M_zzzzz  = v29*v44
    M_xzzzzz = v44*v50
    M_yzzzzz = 0.00833333333333333d0*v1*v44
    c6       = c3*c3
    M_zzzzzz = c6*v45
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
    end subroutine mom_es_P2M
    
! OPS  691*ADD + 2*DIV + 765*MUL + POW = 1459  (3127 before optimization)
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
                v234, v235, v236, v237, v238, v24, v25, v26, v27, v28, v29,&
                v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u
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
#define Ms_xxxxxx            Ms(56)
#define M_xxxxxx             M(56)
#define Ms_xxxxxy            Ms(57)
#define M_xxxxxy             M(57)
#define Ms_xxxxxz            Ms(58)
#define M_xxxxxz             M(58)
#define M_xxxxyy             M(59)
#define Ms_xxxxyy            Ms(59)
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
#define Ms_xxxzzz            Ms(65)
#define M_xxxzzz             M(65)
#define Ms_xxyyyy            Ms(66)
#define M_xxyyyy             M(66)
#define M_xxyyyz             M(67)
#define Ms_xxyyyz            Ms(67)
#define Ms_xxyyzz            Ms(68)
#define M_xxyyzz             M(68)
#define Ms_xxyzzz            Ms(69)
#define M_xxyzzz             M(69)
#define Ms_xxzzzz            Ms(70)
#define M_xxzzzz             M(70)
#define Ms_xyyyyy            Ms(71)
#define M_xyyyyy             M(71)
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
#define M_yyyyzz             M(79)
#define Ms_yyyyzz            Ms(79)
#define Ms_yyyzzz            Ms(80)
#define M_yyyzzz             M(80)
#define Ms_yyzzzz            Ms(81)
#define M_yyzzzz             M(81)
#define M_yzzzzz             M(82)
#define Ms_yzzzzz            Ms(82)
#define Ms_zzzzzz            Ms(83)
#define M_zzzzzz             M(83)
    v237      = 0.0208333333333333d0*M_0
    v0        = M_0*x
    v1        = M_x + v0
    v2        = M_0*y
    v3        = M_y + v2
    v4        = M_0*z + M_z
    v5        = M_x*x
    v6        = M_xx + v5
    v7        = 0.5d0*M_0
    v9        = M_y*x
    v10       = M_xy + v9
    v11       = M_x*y
    v12       = v0*y
    v13       = v10 + v11 + v12
    v14       = M_z*x
    v15       = M_xz + v14
    v16       = M_x*z
    v17       = v0*z + v15 + v16
    v18       = M_y*y
    v19       = M_yy + v18
    v21       = M_z*y
    v22       = M_yz + v21
    v23       = M_y*z
    v24       = v2*z + v22 + v23
    v25       = M_z*z
    v26       = M_zz + v25
    v28       = M_xx*x
    v29       = 0.166666666666667d0*M_0
    v32       = M_xy*x
    v33       = M_xxy + v32
    v34       = M_xx*y
    v35       = v5*y
    v36       = v33 + v34 + v35
    v37       = M_xz*x
    v38       = M_xxz + v37
    v39       = M_xx*z
    v40       = v5*z
    v41       = v38 + v39 + v40
    v43       = M_yy*x
    v44       = M_xyy + v43
    v45       = M_xy*y
    v46       = v9*y
    v47       = v44 + v45 + v46
    v48       = M_xy*z
    v49       = v48 + v9*z
    v50       = M_xz*y
    v51       = M_yz*x
    v238      = M_xyz + v51
    v52       = v11*z
    v53       = v14*y
    v235      = v50 + v53
    v55       = M_zz*x
    v56       = M_xzz + v55
    v57       = M_xz*z
    v58       = v14*z
    v59       = v56 + v57 + v58
    v60       = M_yy*y
    v62       = M_yz*y
    v63       = M_yyz + v62
    v64       = M_yy*z
    v65       = v18*z
    v66       = v63 + v64 + v65
    v67       = M_zz*y
    v68       = M_yzz + v67
    v69       = M_yz*z
    v70       = v21*z
    v71       = v68 + v69 + v70
    v72       = M_zz*z
    v74       = M_xxx*x
    v75       = 0.0416666666666667d0*M_0
    v78       = M_xxx*y
    v79       = M_xxxy + v78
    v80       = M_xxy*x
    v81       = v28*y
    v82       = M_xy + v11
    v83       = M_xxx*z
    v84       = M_xxxz + v83
    v85       = M_xxz*x
    v86       = v28*z
    v87       = M_xz + v16
    v88       = M_xxy*y
    v89       = M_xyy*x
    v90       = v32*y
    v91       = 0.5d0*M_xx
    v93       = M_xxy*z
    v94       = M_xxz*y
    v95       = v34*z + M_xxyz + v93 + v94
    v96       = M_xyz*x
    v97       = v32*z
    v98       = v37*y
    v99       = M_xxz*z
    v100      = M_xzz*x
    v101      = v37*z
    v102      = M_yyy*x
    v103      = M_xyyy + v102
    v104      = M_xyy*y
    v105      = v43*y
    v107      = M_xyy*z
    v108      = M_yyz*x
    v109      = v43*z + M_xyyz + v107 + v108
    v110      = M_xyz*y
    v111      = v45*z
    v112      = v51*y
    v113      = M_xzz*y
    v114      = M_yzz*x
    v115      = v55*y
    v116      = M_xyzz + v113 + v114 + v115
    v117      = M_xyz*z
    v118      = v50*z
    v119      = v51*z
    v120      = M_zzz*x
    v121      = M_xzzz + v120
    v122      = M_xzz*z
    v123      = v55*z
    v125      = M_yyy*y
    v127      = M_yyy*z
    v128      = M_yyyz + v127
    v129      = M_yyz*y
    v130      = v60*z
    v131      = M_yz + v23
    v132      = M_yyz*z
    v133      = M_yzz*y
    v134      = v62*z
    v137      = M_zzz*y
    v138      = M_yzzz + v137
    v139      = M_yzz*z
    v140      = v67*z
    v141      = M_zzz*z
    v143      = M_xxxx*x
    v144      = 0.00833333333333333d0*M_0
    v147      = M_xxxx*y
    v148      = M_xxxy*x
    v149      = v74*y
    v150      = M_xxy + v34
    v151      = M_xxxz*x
    v152      = M_xxz + v39
    v153      = M_xxxy*y
    v154      = M_xxyy*x
    v155      = v80*y
    v156      = 0.5d0*M_xxx
    v160      = M_xxxz*y
    v161      = M_xxyz*x
    v162      = v85*y
    v163      = M_xyz + v48 + v50 + v52
    v164      = M_xxzz*x
    v165      = M_xxyy*y
    v166      = M_xyyy*x
    v167      = v89*y
    v168      = 0.5d0*M_xxy
    v171      = M_xxyz*y
    v172      = M_xyyz*x
    v173      = v96*y
    v174      = 0.5d0*M_xxz
    v175      = M_xxzz*y
    v176      = M_xyzz*x
    v177      = v100*y
    v179      = M_xzzz*x
    v180      = M_xyyy*y
    v181      = M_yyyy*x
    v182      = v102*y
    v184      = M_xyyz*y
    v185      = M_yyyz*x
    v186      = v108*y
    v187      = v238
    v188      = v187 + v49
    v189      = M_xyzz*y
    v190      = M_yyzz*x
    v191      = v114*y
    v193      = M_xzzz*y
    v194      = M_yzzz*x
    v195      = v120*y
    v196      = v187 + v235
    v197      = M_zzzz*x
    v199      = M_yyyy*y
    v201      = M_yyyz*y
    v202      = M_yyz + v64
    v203      = M_yyzz*y
    v206      = M_yzzz*y
    v208      = M_zzzz*y
    v210      = 0.00138888888888889d0*M_0
    v212      = 0.5d0*M_xxxx
    v217      = 0.166666666666667d0*M_xxx
    v218      = 0.5d0*M_xxxy
    v220      = 0.5d0*M_xxxz
    v221      = 0.5d0*M_xxyy
    v225      = 0.5d0*M_xxyz
    v226      = 0.5d0*M_xxzz
    Ms_0      = M_0
    Ms_x      = v1
    Ms_y      = v3
    Ms_z      = v4
    Ms_xy     = v13
    Ms_xz     = v17
    Ms_yz     = v24
    Ms_xyz    = v12*z + v235 + v238 + v49 + v52
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v8        = a2
    v234      = 0.0833333333333333d0*v8
    v31       = 0.5d0*v8
    v92       = 0.25d0*M_0*v8
    v159      = M_x*v8
    v169      = M_0*v234
    v216      = M_xx*v8
    v222      = v237*v8
    v223      = v234
    Ms_xx     = v6 + v7*v8
    Ms_xxy    = v3*v31 + v36
    Ms_xxz    = v31*v4 + v41
    Ms_xxyz   = v24*v31 + v35*z + v95 + v96 + v97 + v98
    a3        = a1*a2
    v30       = a3
    v232      = M_0*v30
    v77       = 0.166666666666667d0*v30
    v157      = 0.0833333333333333d0*v232
    v215      = M_x*v30
    v219      = 0.0277777777777778d0*v232
    Ms_xxx    = M_xxx + v28 + M_x*v31 + v29*v30
    Ms_xxxy   = v3*v77 + v31*v82 + v79 + v80 + v81
    Ms_xxxz   = v31*v87 + v4*v77 + v84 + v85 + v86
    Ms_xxxyz  = M_xxxyz + v160 + v161 + v162 + M_xxxy*z + v163*v31 + v24*v77 + v78*z + &
      v80*z + v81*z
    a4        = a2*a2
    v76       = a4
    v146      = 0.0416666666666667d0*v76
    v213      = v237*v76
    Ms_xxxx   = M_xxxx + v74 + M_x*v77 + M_xx*v31 + v75*v76
    Ms_xxxxy  = v146*v3 + v150*v31 + v77*v82 + M_xxxxy + v147 + v148 + v149
    Ms_xxxxz  = M_xxxxz + v151 + M_xxxx*z + v146*v4 + v152*v31 + v74*z + v77*v87
    Ms_xxxxyz = M_xxxxyz + M_xxxxy*z + M_xxxxz*y + M_xxxyz*x + v146*v24 + v147*z + v148* &
      z + v149*z + v151*y + v163*v77 + v31*v95
    a5        = a2*a3
    v145      = a5
    v211      = 0.00833333333333333d0*v145
    Ms_xxxxx  = M_xxxxx + v143 + M_x*v146 + M_xx*v77 + M_xxx*v31 + v144*v145
    Ms_xxxxxy = M_xxxxxy + M_xxxxx*y + M_xxxxy*x + v143*y + v146*v82 + v150*v77 + v211* &
      v3 + v31*v79
    Ms_xxxxxz = M_xxxxxz + M_xxxxx*z + M_xxxxz*x + v143*z + v146*v87 + v152*v77 + v211* &
      v4 + v31*v84
    a6        = a3*a3
    Ms_xxxxxx = M_xxxxxx + M_x*v211 + M_xx*v146 + M_xxx*v77 + M_xxxx*v31 + M_xxxxx*x + &
      a6*v210
    b2        = b1*b1
    v20       = b2
    v231      = M_0*v20
    v233      = 0.25d0*v20
    v42       = 0.5d0*v20
    v136      = v231
    v158      = v233
    v170      = v233*v8
    v214      = 0.0833333333333333d0*v20
    Ms_yy     = v19 + v20*v7
    Ms_xyy    = v1*v42 + v47
    Ms_yyz    = v4*v42 + v66
    Ms_xxyy   = M_xxyy + v88 + v89 + v90 + M_yy*v31 + v18*v31 + v20*v91 + v20*v92 + v42* &
      v5
    Ms_xyyz   = v17*v42 + v46*z + v109 + v110 + v111 + v112
    Ms_xxxyy  = M_xxxyy + v153 + v154 + v155 + M_xyy*v31 + v156*v20 + v157*v20 + v158* &
      v159 + v19*v77 + v28*v42 + v31*v45
    Ms_xxyyz  = M_xxyyz + v171 + v172 + v173 + M_xxyy*z + M_yyz*v31 + v170*v4 + v174*v20 &
      + v31*v62 + v31*v64 + v31*v65 + v37*v42 + v39*v42 + v40*v42 + v88 &
      *z + v89*z + v90*z
    Ms_xxxxyy = M_xxxxyy + M_xxxxy*y + M_xxxyy*x + M_xxyy*v31 + v146*v19 + v148*y + v158 &
      *v216 + v20*v212 + v20*v213 + v214*v215 + v31*v88 + v42*v74 + v77 &
      *(M_xyy + v45)
    Ms_xxxyyz = M_xxxyyz + M_xxxyy*z + M_xxxyz*y + M_xxyyz*x + M_xyyz*v31 + v107*v31 + &
      v110*v31 + v111*v31 + v153*z + v154*z + v155*z + v161*y + v170* &
      v87 + v20*v220 + v214*v30*v4 + v42*v83 + v42*v85 + v42*v86 + v66* &
      v77
    b3        = b1*b2
    v61       = b3
    v106      = 0.166666666666667d0*v61
    v205      = M_0*v61
    v224      = M_y*v61
    Ms_yyy    = M_yyy + v60 + M_y*v42 + v29*v61
    Ms_xyyy   = v1*v106 + v10*v42 + v103 + v104 + v105
    Ms_yyyz   = v106*v4 + v131*v42 + v128 + v129 + v130
    Ms_xxyyy  = M_xxyyy + v165 + v166 + v167 + M_y*v170 + M_yyy*v31 + v106*v6 + v168*v20 &
      + v169*v61 + v31*v60 + v32*v42
    Ms_xyyyz  = M_xyyyz + v184 + v185 + v186 + M_xyyy*z + v102*z + v104*z + v105*z + &
      v106*v17 + v188*v42
    Ms_xxxyyy = M_xxxyyy + M_xxxyy*y + M_xxyyy*x + M_xy*v170 + M_xyyy*v31 + M_yyy*v77 + &
      v104*v31 + v106*v28 + v154*y + v20*v218 + v214*v8*(v11 + v9) + &
      v217*v61 + v219*v61 + v42*v80 + v60*v77
    Ms_xxyyyz = M_xxyyyz + M_xxyyy*z + M_xxyyz*y + M_xyyyz*x + M_yyyz*v31 + v106*v41 + &
      v127*v31 + v129*v31 + v130*v31 + v131*v170 + v165*z + v166*z + &
      v167*z + v172*y + v20*v225 + v223*v4*v61 + v42*v93 + v42*v96 + &
      v42*v97
    b4        = b2*b2
    v126      = b4
    v183      = 0.0416666666666667d0*v126
    Ms_yyyy   = M_yyyy + v125 + M_y*v106 + M_yy*v42 + v126*v75
    Ms_xyyyy  = v1*v183 + v10*v106 + v42*v44 + M_xyyyy + v180 + v181 + v182
    Ms_yyyyz  = M_yyyyz + v201 + M_yyyy*z + v106*v131 + v125*z + v183*v4 + v202*v42
    Ms_xxyyyy = M_xxyyyy + M_xxyyy*y + M_xyyyy*x + M_yy*v170 + M_yyyy*v31 + v106*v33 + &
      v125*v31 + v126*v222 + v166*y + v183*v6 + v20*v221 + v223*v224 + &
      v42*v89
    Ms_xyyyyz = M_xyyyyz + M_xyyyy*z + M_xyyyz*y + M_yyyyz*x + v106*v188 + v109*v42 + &
      v17*v183 + v180*z + v181*z + v182*z + v185*y
    b5        = b2*b3
    v200      = b5
    v228      = 0.00833333333333333d0*v200
    Ms_yyyyy  = M_yyyyy + v199 + M_y*v183 + M_yy*v106 + M_yyy*v42 + v144*v200
    Ms_xyyyyy = M_xyyyyy + M_xyyyy*y + M_yyyyy*x + v1*v228 + v10*v183 + v103*v42 + v106* &
      v44 + v181*y
    Ms_yyyyyz = M_yyyyyz + M_yyyyy*z + M_yyyyz*y + v106*v202 + v128*v42 + v131*v183 + &
      v199*z + v228*v4
    b6        = b3*b3
    Ms_yyyyyy = M_yyyyyy + M_y*v228 + M_yy*v183 + M_yyy*v106 + M_yyyy*v42 + M_yyyyy*y + &
      b6*v210
    c2        = c1*c1
    v27       = c2
    v230      = 0.25d0*v27
    v54       = 0.5d0*v27
    v135      = v230
    v178      = v230*v8
    v192      = v233*v27
    v204      = 0.0833333333333333d0*v27
    Ms_zz     = v26 + v27*v7
    Ms_xzz    = v1*v54 + v59
    Ms_yzz    = v3*v54 + v71
    Ms_xxzz   = M_xxzz + v100 + v101 + v99 + M_zz*v31 + v25*v31 + v27*v91 + v27*v92 + v5 &
      *v54
    Ms_xyzz   = v13*v54 + v53*z + v116 + v117 + v118 + v119
    Ms_yyzz   = M_yyzz + v132 + v133 + v134 + M_yy*v54 + M_zz*v42 + v135*v136 + v18*v54 &
      + v25*v42
    Ms_xxxzz  = M_xxxzz + v164 + M_xxxz*z + M_xzz*v31 + v135*v159 + v156*v27 + v157*v27 &
      + v26*v77 + v28*v54 + v31*v57 + v85*z
    Ms_xxyzz  = M_xxyzz + v175 + v176 + v177 + M_xxyz*z + M_yzz*v31 + v168*v27 + v178*v3 &
      + v31*v67 + v31*v69 + v31*v70 + v32*v54 + v34*v54 + v35*v54 + v94 &
      *z + v96*z + v98*z
    Ms_xyyzz  = M_xyyzz + v189 + v190 + v191 + M_xyy*v54 + M_xyyz*z + M_xzz*v42 + v1* &
      v192 + v108*z + v110*z + v112*z + v42*v55 + v42*v57 + v42*v58 + &
      v43*v54 + v45*v54 + v46*v54
    Ms_yyyzz  = M_yyyzz + v203 + M_y*v192 + M_yyy*v54 + M_yyyz*z + M_yzz*v42 + v106*v26 &
      + v129*z + v204*v205 + v42*v69 + v54*v60
    Ms_xxxxzz = M_xxxxzz + M_xxxxz*z + M_xxxzz*x + M_xxzz*v31 + v135*v216 + v146*v26 + &
      v151*z + v204*v215 + v212*v27 + v213*v27 + v31*v99 + v54*v74 + &
      v77*(M_xzz + v57)
    Ms_xxxyzz = M_xxxyzz + M_xxxyz*z + M_xxxzz*y + M_xxyzz*x + M_xyzz*v31 + v113*v31 + &
      v117*v31 + v118*v31 + v160*z + v161*z + v162*z + v164*y + v178* &
      v82 + v204*v3*v30 + v218*v27 + v54*v78 + v54*v80 + v54*v81 + v71* &
      v77
    Ms_xxyyzz = 0.125d0*(v231*v27*v8) + M_xx*v192 + M_xxyyz*z + M_xxyyzz + M_xxyzz*y + &
      M_xyyzz*x + M_yy*v178 + M_yyzz*v31 + M_zz*v170 + v100*v42 + v101* &
      v42 + v132*v31 + v133*v31 + v134*v31 + v170*v25 + v171*z + v172*z &
      + v173*z + v176*y + v178*v18 + v192*v5 + v20*v226 + v221*v27 + &
      v42*v99 + v54*v88 + v54*v89 + v54*v90
    Ms_xyyyzz = M_xyyyzz + M_xyyy*v54 + M_xyyyz*z + M_xyyzz*y + M_xyzz*v42 + M_yyyzz*x + &
      v1*v204*v61 + v10*v192 + v102*v54 + v104*v54 + v105*v54 + v106* &
      v59 + v114*v42 + v117*v42 + v119*v42 + v184*z + v185*z + v186*z + &
      v190*y
    Ms_yyyyzz = M_yyyyzz + M_yy*v192 + M_yyyy*v54 + M_yyyyz*z + M_yyyzz*y + M_yyzz*v42 + &
      v106*(M_yzz + v69) + v125*v54 + v126*v237*v27 + v132*v42 + v183* &
      v26 + v201*z + v204*v224
    h         = v20 + v27 + v8
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
    v73       = c3
    v236      = 0.0833333333333333d0*v73
    v124      = 0.166666666666667d0*v73
    v207      = v236
    v227      = M_z*v236
    Ms_zzz    = M_zzz + v72 + M_z*v54 + v29*v73
    Ms_xzzz   = v1*v124 + v15*v54 + v121 + v122 + v123
    Ms_yzzz   = v124*v3 + v22*v54 + v138 + v139 + v140
    Ms_xxzzz  = M_xxzzz + v179 + M_xxzz*z + M_z*v178 + M_zzz*v31 + v100*z + v124*v6 + &
      v169*v73 + v174*v27 + v31*v72 + v37*v54
    Ms_xyzzz  = M_xyzzz + v193 + v194 + v195 + M_xyzz*z + v113*z + v114*z + v115*z + &
      v124*v13 + v196*v54
    Ms_yyzzz  = M_yyzzz + v206 + M_yyz*v54 + M_yyzz*z + M_z*v192 + M_zzz*v42 + v124*v19 &
      + v133*z + v136*v207 + v42*v72 + v54*v62
    Ms_xxxzzz = M_xxxzzz + M_xxxzz*z + M_xxzzz*x + M_xz*v178 + M_xzzz*v31 + M_zzz*v77 + &
      v122*v31 + v124*v28 + v164*z + v204*v8*(v14 + v16) + v217*v73 + &
      v219*v73 + v220*v27 + v54*v85 + v72*v77
    Ms_xxyzzz = M_xxyzzz + M_xxyzz*z + M_xxzzz*y + M_xyzzz*x + M_yzzz*v31 + v124*v36 + &
      v137*v31 + v139*v31 + v140*v31 + v175*z + v176*z + v177*z + v178* &
      v22 + v179*y + v207*v3*v8 + v225*v27 + v54*v94 + v54*v96 + v54* &
      v98
    Ms_xyyzzz = M_xyyzzz + M_xyyz*v54 + M_xyyzz*z + M_xyzzz*y + M_xzzz*v42 + M_yyzzz*x + &
      v1*v20*v207 + v108*v54 + v110*v54 + v112*v54 + v120*v42 + v122* &
      v42 + v123*v42 + v124*v47 + v15*v192 + v189*z + v190*z + v191*z + &
      v194*y
    Ms_yyyzzz = 0.0277777777777778d0*(v205*v73) + M_yyy*v124 + M_yyyz*v54 + M_yyyzz*z + &
      M_yyyzzz + M_yyzzz*y + M_yz*v192 + M_yzzz*v42 + M_zzz*v106 + v106 &
      *v72 + v124*v60 + v129*v54 + v139*v42 + v20*v204*(v21 + v23) + &
      v203*z
    c4        = c2*c2
    v142      = c4
    v198      = 0.0416666666666667d0*v142
    Ms_zzzz   = M_zzzz + v141 + M_z*v124 + M_zz*v54 + v142*v75
    Ms_xzzzz  = M_xzzzz + v197 + M_xzzz*z + v1*v198 + v120*z + v124*v15 + v54*v56
    Ms_yzzzz  = M_yzzzz + v208 + M_yzzz*z + v124*v22 + v137*z + v198*v3 + v54*v68
    Ms_xxzzzz = M_xxzzzz + M_xxzzz*z + M_xzzzz*x + M_zz*v178 + M_zzzz*v31 + v100*v54 + &
      v124*v38 + v141*v31 + v142*v222 + v179*z + v198*v6 + v226*v27 + &
      v227*v8
    Ms_xyzzzz = M_xyzzzz + M_xyzzz*z + M_xzzzz*y + M_yzzzz*x + v116*v54 + v124*v196 + &
      v13*v198 + v193*z + v194*z + v195*z + v197*y
    Ms_yyzzzz = 0.0208333333333333d0*(v136*v142) + M_yyzz*v54 + M_yyzzz*z + M_yyzzzz + &
      M_yzzzz*y + M_zz*v192 + M_zzzz*v42 + v124*v63 + v133*v54 + v141* &
      v42 + v19*v198 + v20*v227 + v206*z
    c5        = c2*c3
    v209      = c5
    v229      = 0.00833333333333333d0*v209
    Ms_zzzzz  = M_zzzzz + M_z*v198 + M_zz*v124 + M_zzz*v54 + M_zzzz*z + v144*v209
    Ms_xzzzzz = M_xzzzzz + M_xzzzz*z + M_zzzzz*x + v1*v229 + v121*v54 + v124*v56 + v15* &
      v198 + v197*z
    Ms_yzzzzz = M_yzzzzz + M_yzzzz*z + M_zzzzz*y + v124*v68 + v138*v54 + v198*v22 + v208 &
      *z + v229*v3
    c6        = c3*c3
    Ms_zzzzzz = M_zzzzzz + M_z*v229 + M_zz*v198 + M_zzz*v124 + M_zzzz*v54 + M_zzzzz*z + &
      c6*v210
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
#undef  Ms_xxxxxx           
#undef  M_xxxxxx            
#undef  Ms_xxxxxy           
#undef  M_xxxxxy            
#undef  Ms_xxxxxz           
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  Ms_xxxxyy           
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
#undef  Ms_xxxzzz           
#undef  M_xxxzzz            
#undef  Ms_xxyyyy           
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  Ms_xxyyyz           
#undef  Ms_xxyyzz           
#undef  M_xxyyzz            
#undef  Ms_xxyzzz           
#undef  M_xxyzzz            
#undef  Ms_xxzzzz           
#undef  M_xxzzzz            
#undef  Ms_xyyyyy           
#undef  M_xyyyyy            
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
#undef  M_yyyyzz            
#undef  Ms_yyyyzz           
#undef  Ms_yyyzzz           
#undef  M_yyyzzz            
#undef  Ms_yyzzzz           
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  Ms_yzzzzz           
#undef  Ms_zzzzzz           
#undef  M_zzzzzz            
    end subroutine mom_es_M2M
    
! OPS  711*ADD + 2*DIV + 890*MUL + 52*NEG + POW + 20*SUB = 1676  (2235 before optimization)
subroutine mom_es_M2L(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52,&
                v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63,&
                v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74,&
                v75, v76, v77, v78, v79, v8, v9, h, u, D_0, D_x, D_y, D_z,&
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
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
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
#define M_yyz                M(17)
#define L_xxxy               L(17)
#define M_yzz                M(18)
#define L_xxxz               L(18)
#define M_zzz                M(19)
#define L_xxyy               L(19)
#define M_xxxx               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xxxy               M(21)
#define M_xxxz               M(22)
#define L_xyyz               L(22)
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
#define L_yyyyy              L(34)
#define M_zzzz               M(34)
#define L_yyyyz              L(35)
#define M_xxxxx              M(35)
#define M_xxxxy              M(36)
#define L_xxxxxx             L(36)
#define L_xxxxxy             L(37)
#define M_xxxxz              M(37)
#define M_xxxyy              M(38)
#define L_xxxxxz             L(38)
#define M_xxxyz              M(39)
#define L_xxxxyy             L(39)
#define L_xxxxyz             L(40)
#define M_xxxzz              M(40)
#define M_xxyyy              M(41)
#define L_xxxyyy             L(41)
#define M_xxyyz              M(42)
#define L_xxxyyz             L(42)
#define M_xxyzz              M(43)
#define L_xxyyyy             L(43)
#define M_xxzzz              M(44)
#define L_xxyyyz             L(44)
#define M_xyyyy              M(45)
#define L_xyyyyy             L(45)
#define L_xyyyyz             L(46)
#define M_xyyyz              M(46)
#define L_yyyyyy             L(47)
#define M_xyyzz              M(47)
#define L_yyyyyz             L(48)
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
    v77      = y*z
    v71      = 15.0d0*v77
    v73      = x*y
    v75      = v77
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v63      = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v63
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v64      = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v64
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v61      = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v65      = 3.0d0*h
    v66      = h*v0
    v67      = h*v1
    v76      = 21.0d0*h
    v4       = -h
    v12      = v65
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v66
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v67
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 - 945.0d0*v19 + 630.0d0*v66
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 - 945.0d0*v31 + 630.0d0*v67
    v46      = h*h*h
    v47      = -5.0d0*v46
    v48      = 315.0d0*h
    v49      = v0*v17
    v51      = 5.0d0*v17
    v53      = v21 + v51 + v52
    v55      = -(126.0d0*v1*v20 + v46)
    v57      = -v0*v12
    v58      = -v1*v12
    v59      = v17 + 33.0d0*v27
    v60      = v1*v17
    v62      = v33 + v51 + v61
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
    v68      = 3.0d0*v3
    v6       = v68*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v68*v75
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v69      = 3.0d0*v8
    v9       = v8*x
    v11      = v69*(h - v10)
    D_xxx    = -3.0d0*v9*(v63 - v65)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    D_xyz    = -v71*v9
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = v69*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v70      = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v70*y
    v26      = v70*z
    v28      = v15*v71
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    D_xyyy   = v22*v30
    D_xyyz   = v26*(v29 + v4)
    D_xyzz   = -(D_xxxy + D_xyyy)
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v78      = v34*z
    v72      = 15.0d0*v34
    v35      = v72*x
    v39      = v78
    v41      = 315.0d0*v73*v78
    v42      = v72*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy  = v34*v38*y
    D_xxxxz  = v38*v39
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz  = v41*(h - v5)
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz  = v39*(v36 - 945.0d0*v64 + 105.0d0*(v66 + v67))
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    D_xyyyy  = v34*v43*x
    D_xyyyz  = v41*(h - v7)
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz  = v39*v43
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v79      = 315.0d0*v44
    v74      = v79*x
    v45      = 45.0d0*v44
    v50      = v74*y
    v54      = v74*z
    v56      = v75*v79
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = v50*v53
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = v53*v54
    L_xxxxx  = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 + v17*v29 - v19*v76 + 14.0d0*v49)
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxy  = D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyz*M_yz + D_xxxxz*M_z + &
      D_xxxxzz*M_zz
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945.0d0*v44*v73*(11.0d0*v27 + v17 + v57 + v58)
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = v54*(-9.0d0*v32 + v57 + v59)
    L_xxxyy  = D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    L_xxxy   = D_xxxxxy*M_xx + D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyz*M_yz + D_xxxyz*M_z + &
      D_xxxyzz*M_zz
    L_xxxyz  = D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    L_xxx    = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxy*M_xxy &
      + D_xxxxxz*M_xxz + D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyz*M_xyz &
      + D_xxxxz*M_xz + D_xxxxzz*M_xzz + D_xxxy*M_y + D_xxxyy*M_yy + &
      D_xxxyyy*M_yyy + D_xxxyyz*M_yyz + D_xxxyz*M_yz + D_xxxyzz*M_yzz + &
      D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz
    L_xxxz   = D_xxxxxz*M_xx + D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyyz* &
      M_yy + D_xxxyz*M_y + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + &
      D_xxxzzz*M_zz
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 + v17*v24 - v31*v76 + 14.0d0*v60)
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = v56*(-9.0d0*v20 + v58 + v59)
    L_xxyyy  = D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    L_xxyy   = D_xxxxyy*M_xx + D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyz*M_yz + D_xxyyz*M_z + &
      D_xxyyzz*M_zz
    L_xxyyz  = D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    L_xxy    = D_xxxxxy*M_xxx + D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyz*M_xxz + D_xxxy &
      *M_x + D_xxxyy*M_xy + D_xxxyyy*M_xyy + D_xxxyyz*M_xyz + D_xxxyz* &
      M_xz + D_xxxyzz*M_xzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyz*M_yyz + D_xxyyz*M_yz + D_xxyyzz*M_yzz + &
      D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz
    L_xxyz   = D_xxxxyz*M_xx + D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyyz* &
      M_yy + D_xxyyz*M_y + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + &
      D_xxyzzz*M_zz
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    L_xx     = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxy*M_xxxy + D_xxxxxz*M_xxxz + D_xxxxy*M_xxy + D_xxxxyy* &
      M_xxyy + D_xxxxyz*M_xxyz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + &
      D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy*M_xyyy + D_xxxyyz*M_xyyz + &
      D_xxxyz*M_xyz + D_xxxyzz*M_xyzz + D_xxxz*M_xz + D_xxxzz*M_xzz + &
      D_xxxzzz*M_xzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyz*M_yyyz + D_xxyyz*M_yyz + D_xxyyzz* &
      M_yyzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz*M_yzzz + D_xxz* &
      M_z + D_xxzz*M_zz + D_xxzzz*M_zzz + D_xxzzzz*M_zzzz
    L_xxz    = D_xxxxxz*M_xxx + D_xxxxyz*M_xxy + D_xxxxz*M_xx + D_xxxxzz*M_xxz + &
      D_xxxyyz*M_xyy + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + &
      D_xxxzz*M_xz + D_xxxzzz*M_xzz + D_xxyyyz*M_yyy + D_xxyyz*M_yy + &
      D_xxyyzz*M_yyz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz
    D_xyyyyy = v50*v62
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = v54*(-18.0d0*v32 + v17 + v61)
    L_xyyyy  = D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    L_xyyy   = D_xxxyyy*M_xx + D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyz*M_yz + D_xyyyz*M_z + &
      D_xyyyzz*M_zz
    L_xyyyz  = D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    L_xyy    = D_xxxxyy*M_xxx + D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyz*M_xxz + D_xxyy &
      *M_x + D_xxyyy*M_xy + D_xxyyyy*M_xyy + D_xxyyyz*M_xyz + D_xxyyz* &
      M_xz + D_xxyyzz*M_xzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyz*M_yyz + D_xyyyz*M_yz + D_xyyyzz*M_yzz + &
      D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz
    L_xyyz   = D_xxxyyz*M_xx + D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyyz* &
      M_yy + D_xyyyz*M_y + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + &
      D_xyyzzz*M_zz
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    L_xy     = D_xxxxxy*M_xxxx + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyz*M_xxxz + &
      D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyy*M_xxyy + D_xxxyyz*M_xxyz + &
      D_xxxyz*M_xxz + D_xxxyzz*M_xxzz + D_xxy*M_x + D_xxyy*M_xy + &
      D_xxyyy*M_xyy + D_xxyyyy*M_xyyy + D_xxyyyz*M_xyyz + D_xxyyz*M_xyz &
      + D_xxyyzz*M_xyzz + D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz*M_xzzz &
      + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + D_xyyyyy* &
      M_yyyy + D_xyyyyz*M_yyyz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + &
      D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz*M_yzzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz*M_zzzz
    L_xyz    = D_xxxxyz*M_xxx + D_xxxyyz*M_xxy + D_xxxyz*M_xx + D_xxxyzz*M_xxz + &
      D_xxyyyz*M_xyy + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + &
      D_xxyzz*M_xz + D_xxyzzz*M_xzz + D_xyyyyz*M_yyy + D_xyyyz*M_yy + &
      D_xyyyzz*M_yyz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxy*M_xxxxy + D_xxxxxz*M_xxxxz + D_xxxxy* &
      M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyz*M_xxxyz + D_xxxxz*M_xxxz + &
      D_xxxxzz*M_xxxzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy* &
      M_xxyyy + D_xxxyyz*M_xxyyz + D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + &
      D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyz* &
      M_xyyyz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxyzzz*M_xyzzz + D_xxz*M_xz + D_xxzz*M_xzz + &
      D_xxzzz*M_xzzz + D_xxzzzz*M_xzzzz + D_xy*M_y + D_xyy*M_yy + &
      D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + D_xyyyyz* &
      M_yyyyz + D_xyyyz*M_yyyz + D_xyyyzz*M_yyyzz + D_xyyz*M_yyz + &
      D_xyyzz*M_yyzz + D_xyyzzz*M_yyzzz + D_xyz*M_yz + D_xyzz*M_yzz + &
      D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz
    L_xz     = D_xxxxxz*M_xxxx + D_xxxxyz*M_xxxy + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + &
      D_xxxyyz*M_xxyy + D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz*M_xx + &
      D_xxxzz*M_xxz + D_xxxzzz*M_xxzz + D_xxyyyz*M_xyyy + D_xxyyz*M_xyy &
      + D_xxyyzz*M_xyyz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz*M_xyzz &
      + D_xxz*M_x + D_xxzz*M_xz + D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + &
      D_xyyyyz*M_yyyy + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyyz*M_yy + &
      D_xyyzz*M_yyz + D_xyyzzz*M_yyzz + D_xyz*M_y + D_xyzz*M_yz + &
      D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz* &
      M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v60)
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = v56*v62
    L_yyyyy  = D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = D_xxyyyy*M_xx + D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyz*M_yz + D_yyyyz*M_z + &
      D_yyyyzz*M_zz
    L_yyyyz  = D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = D_xxxyyy*M_xxx + D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyz*M_xxz + D_xyyy &
      *M_x + D_xyyyy*M_xy + D_xyyyyy*M_xyy + D_xyyyyz*M_xyz + D_xyyyz* &
      M_xz + D_xyyyzz*M_xzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyz*M_yyz + D_yyyyz*M_yz + D_yyyyzz*M_yzz + &
      D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz
    L_yyyz   = D_xxyyyz*M_xx + D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyz* &
      M_yy + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + D_yyyzz*M_z + &
      D_yyyzzz*M_zz
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = D_xxxxyy*M_xxxx + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyz*M_xxxz + &
      D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyy*M_xxyy + D_xxyyyz*M_xxyz + &
      D_xxyyz*M_xxz + D_xxyyzz*M_xxzz + D_xyy*M_x + D_xyyy*M_xy + &
      D_xyyyy*M_xyy + D_xyyyyy*M_xyyy + D_xyyyyz*M_xyyz + D_xyyyz*M_xyz &
      + D_xyyyzz*M_xyzz + D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz*M_xzzz &
      + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + D_yyyyyy* &
      M_yyyy + D_yyyyyz*M_yyyz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + &
      D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz*M_yzzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz*M_zzzz
    L_yyz    = D_xxxyyz*M_xxx + D_xxyyyz*M_xxy + D_xxyyz*M_xx + D_xxyyzz*M_xxz + &
      D_xyyyyz*M_xyy + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + &
      D_xyyzz*M_xz + D_xyyzzz*M_xzz + D_yyyyyz*M_yyy + D_yyyyz*M_yy + &
      D_yyyyzz*M_yyz + D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = D_xxxxxy*M_xxxxx + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyz*M_xxxxz &
      + D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyz* &
      M_xxxyz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + D_xxy*M_xx + D_xxyy &
      *M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyz*M_xxyyz + &
      D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz &
      + D_xxyzzz*M_xxzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyz*M_xyyyz + D_xyyyz* &
      M_xyyz + D_xyyyzz*M_xyyzz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + &
      D_xyyzzz*M_xyzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + &
      D_xyzzzz*M_xzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy &
      + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyz*M_yyyyz + D_yyyyz* &
      M_yyyz + D_yyyyzz*M_yyyzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + &
      D_yyyzzz*M_yyzzz + D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + &
      D_yyzzzz*M_yzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + D_yzzzz &
      *M_zzzz + D_yzzzzz*M_zzzzz
    L_yz     = D_xxxxyz*M_xxxx + D_xxxyyz*M_xxxy + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + &
      D_xxyyyz*M_xxyy + D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz*M_xx + &
      D_xxyzz*M_xxz + D_xxyzzz*M_xxzz + D_xyyyyz*M_xyyy + D_xyyyz*M_xyy &
      + D_xyyyzz*M_xyyz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz*M_xyzz &
      + D_xyz*M_x + D_xyzz*M_xz + D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + &
      D_yyyyyz*M_yyyy + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyyz*M_yy + &
      D_yyyzz*M_yyz + D_yyyzzz*M_yyzz + D_yyz*M_y + D_yyzz*M_yz + &
      D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz* &
      M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxy*M_xxxxxy + D_xxxxxz* &
      M_xxxxxz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyz* &
      M_xxxxyz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxy*M_xxxy + &
      D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyz*M_xxxyyz + D_xxxyz &
      *M_xxxyz + D_xxxyzz*M_xxxyzz + D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + &
      D_xxxzzz*M_xxxzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyyy*M_xxyyy &
      + D_xxyyyy*M_xxyyyy + D_xxyyyz*M_xxyyyz + D_xxyyz*M_xxyyz + &
      D_xxyyzz*M_xxyyzz + D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz* &
      M_xxyzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xxzzz*M_xxzzz + &
      D_xxzzzz*M_xxzzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + &
      D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyz*M_xyyyyz + D_xyyyz &
      *M_xyyyz + D_xyyyzz*M_xyyyzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + &
      D_xyyzzz*M_xyyzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz &
      + D_xyzzzz*M_xyzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + &
      D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_y*M_y + D_yy*M_yy + D_yyy &
      *M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + &
      D_yyyyyz*M_yyyyyz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + D_yyyz* &
      M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + D_yyzzzz*M_yyzzzz + D_yz*M_yz + &
      D_yzz*M_yzz + D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz &
      + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz + D_zzzzz* &
      M_zzzzz + D_zzzzzz*M_zzzzzz
    L_z      = D_xxxxxz*M_xxxxx + D_xxxxyz*M_xxxxy + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz &
      + D_xxxyyz*M_xxxyy + D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxz* &
      M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxyyyz*M_xxyyy + &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyz*M_xxy + D_xxyzz*M_xxyz &
      + D_xxyzzz*M_xxyzz + D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + &
      D_xxzzzz*M_xxzzz + D_xyyyyz*M_xyyyy + D_xyyyz*M_xyyy + D_xyyyzz* &
      M_xyyyz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_yyyyyz*M_yyyyy + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + &
      D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + D_yyz*M_yy + &
      D_yyzz*M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yz*M_y + &
      D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + &
      D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + D_zzzzz*M_zzzz + &
      D_zzzzzz*M_zzzzz
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
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
#undef  M_yyz               
#undef  L_xxxy              
#undef  M_yzz               
#undef  L_xxxz              
#undef  M_zzz               
#undef  L_xxyy              
#undef  M_xxxx              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xxxy              
#undef  M_xxxz              
#undef  L_xyyz              
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
#undef  L_yyyyy             
#undef  M_zzzz              
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxxz            
#undef  M_xxxyz             
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  L_xxxyyy            
#undef  M_xxyyz             
#undef  L_xxxyyz            
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  M_xxzzz             
#undef  L_xxyyyz            
#undef  M_xyyyy             
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyz             
#undef  L_yyyyyy            
#undef  M_xyyzz             
#undef  L_yyyyyz            
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
    
! OPS  691*ADD + 2*DIV + 765*MUL + POW = 1459  (3127 before optimization)
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
                v234, v235, v236, v237, v238, v24, v25, v26, v27, v28, v29,&
                v3, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40,&
                v41, v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51,&
                v52, v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62,&
                v63, v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u
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
#define Ms_xxxxxx            Ms(56)
#define M_xxxxxx             M(56)
#define Ms_xxxxxy            Ms(57)
#define M_xxxxxy             M(57)
#define Ms_xxxxxz            Ms(58)
#define M_xxxxxz             M(58)
#define M_xxxxyy             M(59)
#define Ms_xxxxyy            Ms(59)
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
#define Ms_xxxzzz            Ms(65)
#define M_xxxzzz             M(65)
#define Ms_xxyyyy            Ms(66)
#define M_xxyyyy             M(66)
#define M_xxyyyz             M(67)
#define Ms_xxyyyz            Ms(67)
#define Ms_xxyyzz            Ms(68)
#define M_xxyyzz             M(68)
#define Ms_xxyzzz            Ms(69)
#define M_xxyzzz             M(69)
#define Ms_xxzzzz            Ms(70)
#define M_xxzzzz             M(70)
#define Ms_xyyyyy            Ms(71)
#define M_xyyyyy             M(71)
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
#define M_yyyyzz             M(79)
#define Ms_yyyyzz            Ms(79)
#define Ms_yyyzzz            Ms(80)
#define M_yyyzzz             M(80)
#define Ms_yyzzzz            Ms(81)
#define M_yyzzzz             M(81)
#define M_yzzzzz             M(82)
#define Ms_yzzzzz            Ms(82)
#define Ms_zzzzzz            Ms(83)
#define M_zzzzzz             M(83)
    v237      = 0.0208333333333333d0*M_0
    v0        = M_0*x
    v1        = M_x + v0
    v2        = M_0*y
    v3        = M_y + v2
    v4        = M_0*z + M_z
    v5        = M_x*x
    v6        = M_xx + v5
    v7        = 0.5d0*M_0
    v9        = M_y*x
    v10       = M_xy + v9
    v11       = M_x*y
    v12       = v0*y
    v13       = v10 + v11 + v12
    v14       = M_z*x
    v15       = M_xz + v14
    v16       = M_x*z
    v17       = v0*z + v15 + v16
    v18       = M_y*y
    v19       = M_yy + v18
    v21       = M_z*y
    v22       = M_yz + v21
    v23       = M_y*z
    v24       = v2*z + v22 + v23
    v25       = M_z*z
    v26       = M_zz + v25
    v28       = M_xx*x
    v29       = 0.166666666666667d0*M_0
    v32       = M_xy*x
    v33       = M_xxy + v32
    v34       = M_xx*y
    v35       = v5*y
    v36       = v33 + v34 + v35
    v37       = M_xz*x
    v38       = M_xxz + v37
    v39       = M_xx*z
    v40       = v5*z
    v41       = v38 + v39 + v40
    v43       = M_yy*x
    v44       = M_xyy + v43
    v45       = M_xy*y
    v46       = v9*y
    v47       = v44 + v45 + v46
    v48       = M_xy*z
    v49       = v48 + v9*z
    v50       = M_xz*y
    v51       = M_yz*x
    v238      = M_xyz + v51
    v52       = v11*z
    v53       = v14*y
    v235      = v50 + v53
    v55       = M_zz*x
    v56       = M_xzz + v55
    v57       = M_xz*z
    v58       = v14*z
    v59       = v56 + v57 + v58
    v60       = M_yy*y
    v62       = M_yz*y
    v63       = M_yyz + v62
    v64       = M_yy*z
    v65       = v18*z
    v66       = v63 + v64 + v65
    v67       = M_zz*y
    v68       = M_yzz + v67
    v69       = M_yz*z
    v70       = v21*z
    v71       = v68 + v69 + v70
    v72       = M_zz*z
    v74       = M_xxx*x
    v75       = 0.0416666666666667d0*M_0
    v78       = M_xxx*y
    v79       = M_xxxy + v78
    v80       = M_xxy*x
    v81       = v28*y
    v82       = M_xy + v11
    v83       = M_xxx*z
    v84       = M_xxxz + v83
    v85       = M_xxz*x
    v86       = v28*z
    v87       = M_xz + v16
    v88       = M_xxy*y
    v89       = M_xyy*x
    v90       = v32*y
    v91       = 0.5d0*M_xx
    v93       = M_xxy*z
    v94       = M_xxz*y
    v95       = v34*z + M_xxyz + v93 + v94
    v96       = M_xyz*x
    v97       = v32*z
    v98       = v37*y
    v99       = M_xxz*z
    v100      = M_xzz*x
    v101      = v37*z
    v102      = M_yyy*x
    v103      = M_xyyy + v102
    v104      = M_xyy*y
    v105      = v43*y
    v107      = M_xyy*z
    v108      = M_yyz*x
    v109      = v43*z + M_xyyz + v107 + v108
    v110      = M_xyz*y
    v111      = v45*z
    v112      = v51*y
    v113      = M_xzz*y
    v114      = M_yzz*x
    v115      = v55*y
    v116      = M_xyzz + v113 + v114 + v115
    v117      = M_xyz*z
    v118      = v50*z
    v119      = v51*z
    v120      = M_zzz*x
    v121      = M_xzzz + v120
    v122      = M_xzz*z
    v123      = v55*z
    v125      = M_yyy*y
    v127      = M_yyy*z
    v128      = M_yyyz + v127
    v129      = M_yyz*y
    v130      = v60*z
    v131      = M_yz + v23
    v132      = M_yyz*z
    v133      = M_yzz*y
    v134      = v62*z
    v137      = M_zzz*y
    v138      = M_yzzz + v137
    v139      = M_yzz*z
    v140      = v67*z
    v141      = M_zzz*z
    v143      = M_xxxx*x
    v144      = 0.00833333333333333d0*M_0
    v147      = M_xxxx*y
    v148      = M_xxxy*x
    v149      = v74*y
    v150      = M_xxy + v34
    v151      = M_xxxz*x
    v152      = M_xxz + v39
    v153      = M_xxxy*y
    v154      = M_xxyy*x
    v155      = v80*y
    v156      = 0.5d0*M_xxx
    v160      = M_xxxz*y
    v161      = M_xxyz*x
    v162      = v85*y
    v163      = M_xyz + v48 + v50 + v52
    v164      = M_xxzz*x
    v165      = M_xxyy*y
    v166      = M_xyyy*x
    v167      = v89*y
    v168      = 0.5d0*M_xxy
    v171      = M_xxyz*y
    v172      = M_xyyz*x
    v173      = v96*y
    v174      = 0.5d0*M_xxz
    v175      = M_xxzz*y
    v176      = M_xyzz*x
    v177      = v100*y
    v179      = M_xzzz*x
    v180      = M_xyyy*y
    v181      = M_yyyy*x
    v182      = v102*y
    v184      = M_xyyz*y
    v185      = M_yyyz*x
    v186      = v108*y
    v187      = v238
    v188      = v187 + v49
    v189      = M_xyzz*y
    v190      = M_yyzz*x
    v191      = v114*y
    v193      = M_xzzz*y
    v194      = M_yzzz*x
    v195      = v120*y
    v196      = v187 + v235
    v197      = M_zzzz*x
    v199      = M_yyyy*y
    v201      = M_yyyz*y
    v202      = M_yyz + v64
    v203      = M_yyzz*y
    v206      = M_yzzz*y
    v208      = M_zzzz*y
    v210      = 0.00138888888888889d0*M_0
    v212      = 0.5d0*M_xxxx
    v217      = 0.166666666666667d0*M_xxx
    v218      = 0.5d0*M_xxxy
    v220      = 0.5d0*M_xxxz
    v221      = 0.5d0*M_xxyy
    v225      = 0.5d0*M_xxyz
    v226      = 0.5d0*M_xxzz
    Ms_0      = Ms_0 + (M_0)
    Ms_x      = Ms_x + (v1)
    Ms_y      = Ms_y + (v3)
    Ms_z      = Ms_z + (v4)
    Ms_xy     = Ms_xy + (v13)
    Ms_xz     = Ms_xz + (v17)
    Ms_yz     = Ms_yz + (v24)
    Ms_xyz    = Ms_xyz + (v12*z + v235 + v238 + v49 + v52)
    c1        = z
    b1        = y
    a1        = x
    a2        = a1*a1
    v8        = a2
    v234      = 0.0833333333333333d0*v8
    v31       = 0.5d0*v8
    v92       = 0.25d0*M_0*v8
    v159      = M_x*v8
    v169      = M_0*v234
    v216      = M_xx*v8
    v222      = v237*v8
    v223      = v234
    Ms_xx     = Ms_xx + (v6 + v7*v8)
    Ms_xxy    = Ms_xxy + (v3*v31 + v36)
    Ms_xxz    = Ms_xxz + (v31*v4 + v41)
    Ms_xxyz   = Ms_xxyz + (v24*v31 + v35*z + v95 + v96 + v97 + v98)
    a3        = a1*a2
    v30       = a3
    v232      = M_0*v30
    v77       = 0.166666666666667d0*v30
    v157      = 0.0833333333333333d0*v232
    v215      = M_x*v30
    v219      = 0.0277777777777778d0*v232
    Ms_xxx    = Ms_xxx + (M_xxx + v28 + M_x*v31 + v29*v30)
    Ms_xxxy   = Ms_xxxy + (v3*v77 + v31*v82 + v79 + v80 + v81)
    Ms_xxxz   = Ms_xxxz + (v31*v87 + v4*v77 + v84 + v85 + v86)
    Ms_xxxyz  = Ms_xxxyz + (M_xxxyz + v160 + v161 + v162 + M_xxxy*z + v163*v31 + v24*v77 + v78*z + &
      v80*z + v81*z)
    a4        = a2*a2
    v76       = a4
    v146      = 0.0416666666666667d0*v76
    v213      = v237*v76
    Ms_xxxx   = Ms_xxxx + (M_xxxx + v74 + M_x*v77 + M_xx*v31 + v75*v76)
    Ms_xxxxy  = Ms_xxxxy + (v146*v3 + v150*v31 + v77*v82 + M_xxxxy + v147 + v148 + v149)
    Ms_xxxxz  = Ms_xxxxz + (M_xxxxz + v151 + M_xxxx*z + v146*v4 + v152*v31 + v74*z + v77*v87)
    Ms_xxxxyz = Ms_xxxxyz + (M_xxxxyz + M_xxxxy*z + M_xxxxz*y + M_xxxyz*x + v146*v24 + v147*z + v148* &
      z + v149*z + v151*y + v163*v77 + v31*v95)
    a5        = a2*a3
    v145      = a5
    v211      = 0.00833333333333333d0*v145
    Ms_xxxxx  = Ms_xxxxx + (M_xxxxx + v143 + M_x*v146 + M_xx*v77 + M_xxx*v31 + v144*v145)
    Ms_xxxxxy = Ms_xxxxxy + (M_xxxxxy + M_xxxxx*y + M_xxxxy*x + v143*y + v146*v82 + v150*v77 + v211* &
      v3 + v31*v79)
    Ms_xxxxxz = Ms_xxxxxz + (M_xxxxxz + M_xxxxx*z + M_xxxxz*x + v143*z + v146*v87 + v152*v77 + v211* &
      v4 + v31*v84)
    a6        = a3*a3
    Ms_xxxxxx = Ms_xxxxxx + (M_xxxxxx + M_x*v211 + M_xx*v146 + M_xxx*v77 + M_xxxx*v31 + M_xxxxx*x + &
      a6*v210)
    b2        = b1*b1
    v20       = b2
    v231      = M_0*v20
    v233      = 0.25d0*v20
    v42       = 0.5d0*v20
    v136      = v231
    v158      = v233
    v170      = v233*v8
    v214      = 0.0833333333333333d0*v20
    Ms_yy     = Ms_yy + (v19 + v20*v7)
    Ms_xyy    = Ms_xyy + (v1*v42 + v47)
    Ms_yyz    = Ms_yyz + (v4*v42 + v66)
    Ms_xxyy   = Ms_xxyy + (M_xxyy + v88 + v89 + v90 + M_yy*v31 + v18*v31 + v20*v91 + v20*v92 + v42* &
      v5)
    Ms_xyyz   = Ms_xyyz + (v17*v42 + v46*z + v109 + v110 + v111 + v112)
    Ms_xxxyy  = Ms_xxxyy + (M_xxxyy + v153 + v154 + v155 + M_xyy*v31 + v156*v20 + v157*v20 + v158* &
      v159 + v19*v77 + v28*v42 + v31*v45)
    Ms_xxyyz  = Ms_xxyyz + (M_xxyyz + v171 + v172 + v173 + M_xxyy*z + M_yyz*v31 + v170*v4 + v174*v20 &
      + v31*v62 + v31*v64 + v31*v65 + v37*v42 + v39*v42 + v40*v42 + v88 &
      *z + v89*z + v90*z)
    Ms_xxxxyy = Ms_xxxxyy + (M_xxxxyy + M_xxxxy*y + M_xxxyy*x + M_xxyy*v31 + v146*v19 + v148*y + v158 &
      *v216 + v20*v212 + v20*v213 + v214*v215 + v31*v88 + v42*v74 + v77 &
      *(M_xyy + v45))
    Ms_xxxyyz = Ms_xxxyyz + (M_xxxyyz + M_xxxyy*z + M_xxxyz*y + M_xxyyz*x + M_xyyz*v31 + v107*v31 + &
      v110*v31 + v111*v31 + v153*z + v154*z + v155*z + v161*y + v170* &
      v87 + v20*v220 + v214*v30*v4 + v42*v83 + v42*v85 + v42*v86 + v66* &
      v77)
    b3        = b1*b2
    v61       = b3
    v106      = 0.166666666666667d0*v61
    v205      = M_0*v61
    v224      = M_y*v61
    Ms_yyy    = Ms_yyy + (M_yyy + v60 + M_y*v42 + v29*v61)
    Ms_xyyy   = Ms_xyyy + (v1*v106 + v10*v42 + v103 + v104 + v105)
    Ms_yyyz   = Ms_yyyz + (v106*v4 + v131*v42 + v128 + v129 + v130)
    Ms_xxyyy  = Ms_xxyyy + (M_xxyyy + v165 + v166 + v167 + M_y*v170 + M_yyy*v31 + v106*v6 + v168*v20 &
      + v169*v61 + v31*v60 + v32*v42)
    Ms_xyyyz  = Ms_xyyyz + (M_xyyyz + v184 + v185 + v186 + M_xyyy*z + v102*z + v104*z + v105*z + &
      v106*v17 + v188*v42)
    Ms_xxxyyy = Ms_xxxyyy + (M_xxxyyy + M_xxxyy*y + M_xxyyy*x + M_xy*v170 + M_xyyy*v31 + M_yyy*v77 + &
      v104*v31 + v106*v28 + v154*y + v20*v218 + v214*v8*(v11 + v9) + &
      v217*v61 + v219*v61 + v42*v80 + v60*v77)
    Ms_xxyyyz = Ms_xxyyyz + (M_xxyyyz + M_xxyyy*z + M_xxyyz*y + M_xyyyz*x + M_yyyz*v31 + v106*v41 + &
      v127*v31 + v129*v31 + v130*v31 + v131*v170 + v165*z + v166*z + &
      v167*z + v172*y + v20*v225 + v223*v4*v61 + v42*v93 + v42*v96 + &
      v42*v97)
    b4        = b2*b2
    v126      = b4
    v183      = 0.0416666666666667d0*v126
    Ms_yyyy   = Ms_yyyy + (M_yyyy + v125 + M_y*v106 + M_yy*v42 + v126*v75)
    Ms_xyyyy  = Ms_xyyyy + (v1*v183 + v10*v106 + v42*v44 + M_xyyyy + v180 + v181 + v182)
    Ms_yyyyz  = Ms_yyyyz + (M_yyyyz + v201 + M_yyyy*z + v106*v131 + v125*z + v183*v4 + v202*v42)
    Ms_xxyyyy = Ms_xxyyyy + (M_xxyyyy + M_xxyyy*y + M_xyyyy*x + M_yy*v170 + M_yyyy*v31 + v106*v33 + &
      v125*v31 + v126*v222 + v166*y + v183*v6 + v20*v221 + v223*v224 + &
      v42*v89)
    Ms_xyyyyz = Ms_xyyyyz + (M_xyyyyz + M_xyyyy*z + M_xyyyz*y + M_yyyyz*x + v106*v188 + v109*v42 + &
      v17*v183 + v180*z + v181*z + v182*z + v185*y)
    b5        = b2*b3
    v200      = b5
    v228      = 0.00833333333333333d0*v200
    Ms_yyyyy  = Ms_yyyyy + (M_yyyyy + v199 + M_y*v183 + M_yy*v106 + M_yyy*v42 + v144*v200)
    Ms_xyyyyy = Ms_xyyyyy + (M_xyyyyy + M_xyyyy*y + M_yyyyy*x + v1*v228 + v10*v183 + v103*v42 + v106* &
      v44 + v181*y)
    Ms_yyyyyz = Ms_yyyyyz + (M_yyyyyz + M_yyyyy*z + M_yyyyz*y + v106*v202 + v128*v42 + v131*v183 + &
      v199*z + v228*v4)
    b6        = b3*b3
    Ms_yyyyyy = Ms_yyyyyy + (M_yyyyyy + M_y*v228 + M_yy*v183 + M_yyy*v106 + M_yyyy*v42 + M_yyyyy*y + &
      b6*v210)
    c2        = c1*c1
    v27       = c2
    v230      = 0.25d0*v27
    v54       = 0.5d0*v27
    v135      = v230
    v178      = v230*v8
    v192      = v233*v27
    v204      = 0.0833333333333333d0*v27
    Ms_zz     = Ms_zz + (v26 + v27*v7)
    Ms_xzz    = Ms_xzz + (v1*v54 + v59)
    Ms_yzz    = Ms_yzz + (v3*v54 + v71)
    Ms_xxzz   = Ms_xxzz + (M_xxzz + v100 + v101 + v99 + M_zz*v31 + v25*v31 + v27*v91 + v27*v92 + v5 &
      *v54)
    Ms_xyzz   = Ms_xyzz + (v13*v54 + v53*z + v116 + v117 + v118 + v119)
    Ms_yyzz   = Ms_yyzz + (M_yyzz + v132 + v133 + v134 + M_yy*v54 + M_zz*v42 + v135*v136 + v18*v54 &
      + v25*v42)
    Ms_xxxzz  = Ms_xxxzz + (M_xxxzz + v164 + M_xxxz*z + M_xzz*v31 + v135*v159 + v156*v27 + v157*v27 &
      + v26*v77 + v28*v54 + v31*v57 + v85*z)
    Ms_xxyzz  = Ms_xxyzz + (M_xxyzz + v175 + v176 + v177 + M_xxyz*z + M_yzz*v31 + v168*v27 + v178*v3 &
      + v31*v67 + v31*v69 + v31*v70 + v32*v54 + v34*v54 + v35*v54 + v94 &
      *z + v96*z + v98*z)
    Ms_xyyzz  = Ms_xyyzz + (M_xyyzz + v189 + v190 + v191 + M_xyy*v54 + M_xyyz*z + M_xzz*v42 + v1* &
      v192 + v108*z + v110*z + v112*z + v42*v55 + v42*v57 + v42*v58 + &
      v43*v54 + v45*v54 + v46*v54)
    Ms_yyyzz  = Ms_yyyzz + (M_yyyzz + v203 + M_y*v192 + M_yyy*v54 + M_yyyz*z + M_yzz*v42 + v106*v26 &
      + v129*z + v204*v205 + v42*v69 + v54*v60)
    Ms_xxxxzz = Ms_xxxxzz + (M_xxxxzz + M_xxxxz*z + M_xxxzz*x + M_xxzz*v31 + v135*v216 + v146*v26 + &
      v151*z + v204*v215 + v212*v27 + v213*v27 + v31*v99 + v54*v74 + &
      v77*(M_xzz + v57))
    Ms_xxxyzz = Ms_xxxyzz + (M_xxxyzz + M_xxxyz*z + M_xxxzz*y + M_xxyzz*x + M_xyzz*v31 + v113*v31 + &
      v117*v31 + v118*v31 + v160*z + v161*z + v162*z + v164*y + v178* &
      v82 + v204*v3*v30 + v218*v27 + v54*v78 + v54*v80 + v54*v81 + v71* &
      v77)
    Ms_xxyyzz = Ms_xxyyzz + (0.125d0*(v231*v27*v8) + M_xx*v192 + M_xxyyz*z + M_xxyyzz + M_xxyzz*y + &
      M_xyyzz*x + M_yy*v178 + M_yyzz*v31 + M_zz*v170 + v100*v42 + v101* &
      v42 + v132*v31 + v133*v31 + v134*v31 + v170*v25 + v171*z + v172*z &
      + v173*z + v176*y + v178*v18 + v192*v5 + v20*v226 + v221*v27 + &
      v42*v99 + v54*v88 + v54*v89 + v54*v90)
    Ms_xyyyzz = Ms_xyyyzz + (M_xyyyzz + M_xyyy*v54 + M_xyyyz*z + M_xyyzz*y + M_xyzz*v42 + M_yyyzz*x + &
      v1*v204*v61 + v10*v192 + v102*v54 + v104*v54 + v105*v54 + v106* &
      v59 + v114*v42 + v117*v42 + v119*v42 + v184*z + v185*z + v186*z + &
      v190*y)
    Ms_yyyyzz = Ms_yyyyzz + (M_yyyyzz + M_yy*v192 + M_yyyy*v54 + M_yyyyz*z + M_yyyzz*y + M_yyzz*v42 + &
      v106*(M_yzz + v69) + v125*v54 + v126*v237*v27 + v132*v42 + v183* &
      v26 + v201*z + v204*v224)
    h         = v20 + v27 + v8
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
    v73       = c3
    v236      = 0.0833333333333333d0*v73
    v124      = 0.166666666666667d0*v73
    v207      = v236
    v227      = M_z*v236
    Ms_zzz    = Ms_zzz + (M_zzz + v72 + M_z*v54 + v29*v73)
    Ms_xzzz   = Ms_xzzz + (v1*v124 + v15*v54 + v121 + v122 + v123)
    Ms_yzzz   = Ms_yzzz + (v124*v3 + v22*v54 + v138 + v139 + v140)
    Ms_xxzzz  = Ms_xxzzz + (M_xxzzz + v179 + M_xxzz*z + M_z*v178 + M_zzz*v31 + v100*z + v124*v6 + &
      v169*v73 + v174*v27 + v31*v72 + v37*v54)
    Ms_xyzzz  = Ms_xyzzz + (M_xyzzz + v193 + v194 + v195 + M_xyzz*z + v113*z + v114*z + v115*z + &
      v124*v13 + v196*v54)
    Ms_yyzzz  = Ms_yyzzz + (M_yyzzz + v206 + M_yyz*v54 + M_yyzz*z + M_z*v192 + M_zzz*v42 + v124*v19 &
      + v133*z + v136*v207 + v42*v72 + v54*v62)
    Ms_xxxzzz = Ms_xxxzzz + (M_xxxzzz + M_xxxzz*z + M_xxzzz*x + M_xz*v178 + M_xzzz*v31 + M_zzz*v77 + &
      v122*v31 + v124*v28 + v164*z + v204*v8*(v14 + v16) + v217*v73 + &
      v219*v73 + v220*v27 + v54*v85 + v72*v77)
    Ms_xxyzzz = Ms_xxyzzz + (M_xxyzzz + M_xxyzz*z + M_xxzzz*y + M_xyzzz*x + M_yzzz*v31 + v124*v36 + &
      v137*v31 + v139*v31 + v140*v31 + v175*z + v176*z + v177*z + v178* &
      v22 + v179*y + v207*v3*v8 + v225*v27 + v54*v94 + v54*v96 + v54* &
      v98)
    Ms_xyyzzz = Ms_xyyzzz + (M_xyyzzz + M_xyyz*v54 + M_xyyzz*z + M_xyzzz*y + M_xzzz*v42 + M_yyzzz*x + &
      v1*v20*v207 + v108*v54 + v110*v54 + v112*v54 + v120*v42 + v122* &
      v42 + v123*v42 + v124*v47 + v15*v192 + v189*z + v190*z + v191*z + &
      v194*y)
    Ms_yyyzzz = Ms_yyyzzz + (0.0277777777777778d0*(v205*v73) + M_yyy*v124 + M_yyyz*v54 + M_yyyzz*z + &
      M_yyyzzz + M_yyzzz*y + M_yz*v192 + M_yzzz*v42 + M_zzz*v106 + v106 &
      *v72 + v124*v60 + v129*v54 + v139*v42 + v20*v204*(v21 + v23) + &
      v203*z)
    c4        = c2*c2
    v142      = c4
    v198      = 0.0416666666666667d0*v142
    Ms_zzzz   = Ms_zzzz + (M_zzzz + v141 + M_z*v124 + M_zz*v54 + v142*v75)
    Ms_xzzzz  = Ms_xzzzz + (M_xzzzz + v197 + M_xzzz*z + v1*v198 + v120*z + v124*v15 + v54*v56)
    Ms_yzzzz  = Ms_yzzzz + (M_yzzzz + v208 + M_yzzz*z + v124*v22 + v137*z + v198*v3 + v54*v68)
    Ms_xxzzzz = Ms_xxzzzz + (M_xxzzzz + M_xxzzz*z + M_xzzzz*x + M_zz*v178 + M_zzzz*v31 + v100*v54 + &
      v124*v38 + v141*v31 + v142*v222 + v179*z + v198*v6 + v226*v27 + &
      v227*v8)
    Ms_xyzzzz = Ms_xyzzzz + (M_xyzzzz + M_xyzzz*z + M_xzzzz*y + M_yzzzz*x + v116*v54 + v124*v196 + &
      v13*v198 + v193*z + v194*z + v195*z + v197*y)
    Ms_yyzzzz = Ms_yyzzzz + (0.0208333333333333d0*(v136*v142) + M_yyzz*v54 + M_yyzzz*z + M_yyzzzz + &
      M_yzzzz*y + M_zz*v192 + M_zzzz*v42 + v124*v63 + v133*v54 + v141* &
      v42 + v19*v198 + v20*v227 + v206*z)
    c5        = c2*c3
    v209      = c5
    v229      = 0.00833333333333333d0*v209
    Ms_zzzzz  = Ms_zzzzz + (M_zzzzz + M_z*v198 + M_zz*v124 + M_zzz*v54 + M_zzzz*z + v144*v209)
    Ms_xzzzzz = Ms_xzzzzz + (M_xzzzzz + M_xzzzz*z + M_zzzzz*x + v1*v229 + v121*v54 + v124*v56 + v15* &
      v198 + v197*z)
    Ms_yzzzzz = Ms_yzzzzz + (M_yzzzzz + M_yzzzz*z + M_zzzzz*y + v124*v68 + v138*v54 + v198*v22 + v208 &
      *z + v229*v3)
    c6        = c3*c3
    Ms_zzzzzz = Ms_zzzzzz + (M_zzzzzz + M_z*v229 + M_zz*v198 + M_zzz*v124 + M_zzzz*v54 + M_zzzzz*z + &
      c6*v210)
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
#undef  Ms_xxxxxx           
#undef  M_xxxxxx            
#undef  Ms_xxxxxy           
#undef  M_xxxxxy            
#undef  Ms_xxxxxz           
#undef  M_xxxxxz            
#undef  M_xxxxyy            
#undef  Ms_xxxxyy           
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
#undef  Ms_xxxzzz           
#undef  M_xxxzzz            
#undef  Ms_xxyyyy           
#undef  M_xxyyyy            
#undef  M_xxyyyz            
#undef  Ms_xxyyyz           
#undef  Ms_xxyyzz           
#undef  M_xxyyzz            
#undef  Ms_xxyzzz           
#undef  M_xxyzzz            
#undef  Ms_xxzzzz           
#undef  M_xxzzzz            
#undef  Ms_xyyyyy           
#undef  M_xyyyyy            
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
#undef  M_yyyyzz            
#undef  Ms_yyyyzz           
#undef  Ms_yyyzzz           
#undef  M_yyyzzz            
#undef  Ms_yyzzzz           
#undef  M_yyzzzz            
#undef  M_yzzzzz            
#undef  Ms_yzzzzz           
#undef  Ms_zzzzzz           
#undef  M_zzzzzz            
    end subroutine mom_es_M2M_add
    
! OPS  711*ADD + 2*DIV + 890*MUL + 52*NEG + POW + 20*SUB = 1676  (2235 before optimization)
subroutine mom_es_M2L_add(M, r, L)
    real(dp), intent(in)  :: M(0:MOM_ES_M_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: L(0:MOM_ES_L_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52,&
                v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63,&
                v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74,&
                v75, v76, v77, v78, v79, v8, v9, h, u, D_0, D_x, D_y, D_z,&
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
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz
#define M_0                  M(0)
#define L_0                  L(0)
#define y                    r(2)
#define z                    r(3)
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
#define M_yyz                M(17)
#define L_xxxy               L(17)
#define M_yzz                M(18)
#define L_xxxz               L(18)
#define M_zzz                M(19)
#define L_xxyy               L(19)
#define M_xxxx               M(20)
#define L_xxyz               L(20)
#define L_xyyy               L(21)
#define M_xxxy               M(21)
#define M_xxxz               M(22)
#define L_xyyz               L(22)
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
#define L_yyyyy              L(34)
#define M_zzzz               M(34)
#define L_yyyyz              L(35)
#define M_xxxxx              M(35)
#define M_xxxxy              M(36)
#define L_xxxxxx             L(36)
#define L_xxxxxy             L(37)
#define M_xxxxz              M(37)
#define M_xxxyy              M(38)
#define L_xxxxxz             L(38)
#define M_xxxyz              M(39)
#define L_xxxxyy             L(39)
#define L_xxxxyz             L(40)
#define M_xxxzz              M(40)
#define M_xxyyy              M(41)
#define L_xxxyyy             L(41)
#define M_xxyyz              M(42)
#define L_xxxyyz             L(42)
#define M_xxyzz              M(43)
#define L_xxyyyy             L(43)
#define M_xxzzz              M(44)
#define L_xxyyyz             L(44)
#define M_xyyyy              M(45)
#define L_xyyyyy             L(45)
#define L_xyyyyz             L(46)
#define M_xyyyz              M(46)
#define L_yyyyyy             L(47)
#define M_xyyzz              M(47)
#define L_yyyyyz             L(48)
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
    v77      = y*z
    v71      = 15.0d0*v77
    v73      = x*y
    v75      = v77
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v63      = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v63
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v64      = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v64
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v61      = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v65      = 3.0d0*h
    v66      = h*v0
    v67      = h*v1
    v76      = 21.0d0*h
    v4       = -h
    v12      = v65
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v66
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v67
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 - 945.0d0*v19 + 630.0d0*v66
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 - 945.0d0*v31 + 630.0d0*v67
    v46      = h*h*h
    v47      = -5.0d0*v46
    v48      = 315.0d0*h
    v49      = v0*v17
    v51      = 5.0d0*v17
    v53      = v21 + v51 + v52
    v55      = -(126.0d0*v1*v20 + v46)
    v57      = -v0*v12
    v58      = -v1*v12
    v59      = v17 + 33.0d0*v27
    v60      = v1*v17
    v62      = v33 + v51 + v61
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
    v68      = 3.0d0*v3
    v6       = v68*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v68*v75
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v69      = 3.0d0*v8
    v9       = v8*x
    v11      = v69*(h - v10)
    D_xxx    = -3.0d0*v9*(v63 - v65)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    D_xyz    = -v71*v9
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = v69*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v70      = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v70*y
    v26      = v70*z
    v28      = v15*v71
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    D_xyyy   = v22*v30
    D_xyyz   = v26*(v29 + v4)
    D_xyzz   = -(D_xxxy + D_xyyy)
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v78      = v34*z
    v72      = 15.0d0*v34
    v35      = v72*x
    v39      = v78
    v41      = 315.0d0*v73*v78
    v42      = v72*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy  = v34*v38*y
    D_xxxxz  = v38*v39
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz  = v41*(h - v5)
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz  = v39*(v36 - 945.0d0*v64 + 105.0d0*(v66 + v67))
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    D_xyyyy  = v34*v43*x
    D_xyyyz  = v41*(h - v7)
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz  = v39*v43
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v79      = 315.0d0*v44
    v74      = v79*x
    v45      = 45.0d0*v44
    v50      = v74*y
    v54      = v74*z
    v56      = v75*v79
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = L_xxxxxx + (D_xxxxxx*M_0)
    D_xxxxxy = v50*v53
    L_xxxxxy = L_xxxxxy + (D_xxxxxy*M_0)
    D_xxxxxz = v53*v54
    L_xxxxx  = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z)
    L_xxxxxz = L_xxxxxz + (D_xxxxxz*M_0)
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 + v17*v29 - v19*v76 + 14.0d0*v49)
    L_xxxxyy = L_xxxxyy + (D_xxxxyy*M_0)
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxy  = L_xxxxy + (D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z)
    L_xxxxyz = L_xxxxyz + (D_xxxxyz*M_0)
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    L_xxxx   = L_xxxx + (D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyz*M_yz + D_xxxxz*M_z + &
      D_xxxxzz*M_zz)
    L_xxxxz  = L_xxxxz + (D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z)
    D_xxxyyy = 945.0d0*v44*v73*(11.0d0*v27 + v17 + v57 + v58)
    L_xxxyyy = L_xxxyyy + (D_xxxyyy*M_0)
    D_xxxyyz = v54*(-9.0d0*v32 + v57 + v59)
    L_xxxyy  = L_xxxyy + (D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z)
    L_xxxyyz = L_xxxyyz + (D_xxxyyz*M_0)
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    L_xxxy   = L_xxxy + (D_xxxxxy*M_xx + D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyz*M_yz + D_xxxyz*M_z + &
      D_xxxyzz*M_zz)
    L_xxxyz  = L_xxxyz + (D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z)
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    L_xxx    = L_xxx + (D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxy*M_xxy &
      + D_xxxxxz*M_xxz + D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyz*M_xyz &
      + D_xxxxz*M_xz + D_xxxxzz*M_xzz + D_xxxy*M_y + D_xxxyy*M_yy + &
      D_xxxyyy*M_yyy + D_xxxyyz*M_yyz + D_xxxyz*M_yz + D_xxxyzz*M_yzz + &
      D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz)
    L_xxxz   = L_xxxz + (D_xxxxxz*M_xx + D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyyz* &
      M_yy + D_xxxyz*M_y + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + &
      D_xxxzzz*M_zz)
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 + v17*v24 - v31*v76 + 14.0d0*v60)
    L_xxyyyy = L_xxyyyy + (D_xxyyyy*M_0)
    D_xxyyyz = v56*(-9.0d0*v20 + v58 + v59)
    L_xxyyy  = L_xxyyy + (D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z)
    L_xxyyyz = L_xxyyyz + (D_xxyyyz*M_0)
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    L_xxyy   = L_xxyy + (D_xxxxyy*M_xx + D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyz*M_yz + D_xxyyz*M_z + &
      D_xxyyzz*M_zz)
    L_xxyyz  = L_xxyyz + (D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z)
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    L_xxy    = L_xxy + (D_xxxxxy*M_xxx + D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyz*M_xxz + D_xxxy &
      *M_x + D_xxxyy*M_xy + D_xxxyyy*M_xyy + D_xxxyyz*M_xyz + D_xxxyz* &
      M_xz + D_xxxyzz*M_xzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyz*M_yyz + D_xxyyz*M_yz + D_xxyyzz*M_yzz + &
      D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz)
    L_xxyz   = L_xxyz + (D_xxxxyz*M_xx + D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyyz* &
      M_yy + D_xxyyz*M_y + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + &
      D_xxyzzz*M_zz)
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    L_xx     = L_xx + (D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxy*M_xxxy + D_xxxxxz*M_xxxz + D_xxxxy*M_xxy + D_xxxxyy* &
      M_xxyy + D_xxxxyz*M_xxyz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + &
      D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy*M_xyyy + D_xxxyyz*M_xyyz + &
      D_xxxyz*M_xyz + D_xxxyzz*M_xyzz + D_xxxz*M_xz + D_xxxzz*M_xzz + &
      D_xxxzzz*M_xzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyz*M_yyyz + D_xxyyz*M_yyz + D_xxyyzz* &
      M_yyzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz*M_yzzz + D_xxz* &
      M_z + D_xxzz*M_zz + D_xxzzz*M_zzz + D_xxzzzz*M_zzzz)
    L_xxz    = L_xxz + (D_xxxxxz*M_xxx + D_xxxxyz*M_xxy + D_xxxxz*M_xx + D_xxxxzz*M_xxz + &
      D_xxxyyz*M_xyy + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + &
      D_xxxzz*M_xz + D_xxxzzz*M_xzz + D_xxyyyz*M_yyy + D_xxyyz*M_yy + &
      D_xxyyzz*M_yyz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz)
    D_xyyyyy = v50*v62
    L_xyyyyy = L_xyyyyy + (D_xyyyyy*M_0)
    D_xyyyyz = v54*(-18.0d0*v32 + v17 + v61)
    L_xyyyy  = L_xyyyy + (D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z)
    L_xyyyyz = L_xyyyyz + (D_xyyyyz*M_0)
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    L_xyyy   = L_xyyy + (D_xxxyyy*M_xx + D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyz*M_yz + D_xyyyz*M_z + &
      D_xyyyzz*M_zz)
    L_xyyyz  = L_xyyyz + (D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z)
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    L_xyy    = L_xyy + (D_xxxxyy*M_xxx + D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyz*M_xxz + D_xxyy &
      *M_x + D_xxyyy*M_xy + D_xxyyyy*M_xyy + D_xxyyyz*M_xyz + D_xxyyz* &
      M_xz + D_xxyyzz*M_xzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyz*M_yyz + D_xyyyz*M_yz + D_xyyyzz*M_yzz + &
      D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz)
    L_xyyz   = L_xyyz + (D_xxxyyz*M_xx + D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyyz* &
      M_yy + D_xyyyz*M_y + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + &
      D_xyyzzz*M_zz)
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    L_xy     = L_xy + (D_xxxxxy*M_xxxx + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyz*M_xxxz + &
      D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyy*M_xxyy + D_xxxyyz*M_xxyz + &
      D_xxxyz*M_xxz + D_xxxyzz*M_xxzz + D_xxy*M_x + D_xxyy*M_xy + &
      D_xxyyy*M_xyy + D_xxyyyy*M_xyyy + D_xxyyyz*M_xyyz + D_xxyyz*M_xyz &
      + D_xxyyzz*M_xyzz + D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz*M_xzzz &
      + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + D_xyyyyy* &
      M_yyyy + D_xyyyyz*M_yyyz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + &
      D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz*M_yzzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz*M_zzzz)
    L_xyz    = L_xyz + (D_xxxxyz*M_xxx + D_xxxyyz*M_xxy + D_xxxyz*M_xx + D_xxxyzz*M_xxz + &
      D_xxyyyz*M_xyy + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + &
      D_xxyzz*M_xz + D_xxyzzz*M_xzz + D_xyyyyz*M_yyy + D_xyyyz*M_yy + &
      D_xyyyzz*M_yyz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz)
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = L_x + (D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxy*M_xxxxy + D_xxxxxz*M_xxxxz + D_xxxxy* &
      M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyz*M_xxxyz + D_xxxxz*M_xxxz + &
      D_xxxxzz*M_xxxzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy* &
      M_xxyyy + D_xxxyyz*M_xxyyz + D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + &
      D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyz* &
      M_xyyyz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxyzzz*M_xyzzz + D_xxz*M_xz + D_xxzz*M_xzz + &
      D_xxzzz*M_xzzz + D_xxzzzz*M_xzzzz + D_xy*M_y + D_xyy*M_yy + &
      D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + D_xyyyyz* &
      M_yyyyz + D_xyyyz*M_yyyz + D_xyyyzz*M_yyyzz + D_xyyz*M_yyz + &
      D_xyyzz*M_yyzz + D_xyyzzz*M_yyzzz + D_xyz*M_yz + D_xyzz*M_yzz + &
      D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz)
    L_xz     = L_xz + (D_xxxxxz*M_xxxx + D_xxxxyz*M_xxxy + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + &
      D_xxxyyz*M_xxyy + D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz*M_xx + &
      D_xxxzz*M_xxz + D_xxxzzz*M_xxzz + D_xxyyyz*M_xyyy + D_xxyyz*M_xyy &
      + D_xxyyzz*M_xyyz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz*M_xyzz &
      + D_xxz*M_x + D_xxzz*M_xz + D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + &
      D_xyyyyz*M_yyyy + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyyz*M_yy + &
      D_xyyzz*M_yyz + D_xyyzzz*M_yyzz + D_xyz*M_y + D_xyzz*M_yz + &
      D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz* &
      M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz)
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v60)
    L_yyyyyy = L_yyyyyy + (D_yyyyyy*M_0)
    D_yyyyyz = v56*v62
    L_yyyyy  = L_yyyyy + (D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z)
    L_yyyyyz = L_yyyyyz + (D_yyyyyz*M_0)
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = L_yyyy + (D_xxyyyy*M_xx + D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyz*M_yz + D_yyyyz*M_z + &
      D_yyyyzz*M_zz)
    L_yyyyz  = L_yyyyz + (D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z)
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = L_yyy + (D_xxxyyy*M_xxx + D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyz*M_xxz + D_xyyy &
      *M_x + D_xyyyy*M_xy + D_xyyyyy*M_xyy + D_xyyyyz*M_xyz + D_xyyyz* &
      M_xz + D_xyyyzz*M_xzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyz*M_yyz + D_yyyyz*M_yz + D_yyyyzz*M_yzz + &
      D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz)
    L_yyyz   = L_yyyz + (D_xxyyyz*M_xx + D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyz* &
      M_yy + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + D_yyyzz*M_z + &
      D_yyyzzz*M_zz)
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = L_yy + (D_xxxxyy*M_xxxx + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyz*M_xxxz + &
      D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyy*M_xxyy + D_xxyyyz*M_xxyz + &
      D_xxyyz*M_xxz + D_xxyyzz*M_xxzz + D_xyy*M_x + D_xyyy*M_xy + &
      D_xyyyy*M_xyy + D_xyyyyy*M_xyyy + D_xyyyyz*M_xyyz + D_xyyyz*M_xyz &
      + D_xyyyzz*M_xyzz + D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz*M_xzzz &
      + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + D_yyyyyy* &
      M_yyyy + D_yyyyyz*M_yyyz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + &
      D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz*M_yzzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz*M_zzzz)
    L_yyz    = L_yyz + (D_xxxyyz*M_xxx + D_xxyyyz*M_xxy + D_xxyyz*M_xx + D_xxyyzz*M_xxz + &
      D_xyyyyz*M_xyy + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + &
      D_xyyzz*M_xz + D_xyyzzz*M_xzz + D_yyyyyz*M_yyy + D_yyyyz*M_yy + &
      D_yyyyzz*M_yyz + D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz)
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = L_y + (D_xxxxxy*M_xxxxx + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyz*M_xxxxz &
      + D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyz* &
      M_xxxyz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + D_xxy*M_xx + D_xxyy &
      *M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyz*M_xxyyz + &
      D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz &
      + D_xxyzzz*M_xxzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyz*M_xyyyz + D_xyyyz* &
      M_xyyz + D_xyyyzz*M_xyyzz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + &
      D_xyyzzz*M_xyzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + &
      D_xyzzzz*M_xzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy &
      + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyz*M_yyyyz + D_yyyyz* &
      M_yyyz + D_yyyyzz*M_yyyzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + &
      D_yyyzzz*M_yyzzz + D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + &
      D_yyzzzz*M_yzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + D_yzzzz &
      *M_zzzz + D_yzzzzz*M_zzzzz)
    L_yz     = L_yz + (D_xxxxyz*M_xxxx + D_xxxyyz*M_xxxy + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + &
      D_xxyyyz*M_xxyy + D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz*M_xx + &
      D_xxyzz*M_xxz + D_xxyzzz*M_xxzz + D_xyyyyz*M_xyyy + D_xyyyz*M_xyy &
      + D_xyyyzz*M_xyyz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz*M_xyzz &
      + D_xyz*M_x + D_xyzz*M_xz + D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + &
      D_yyyyyz*M_yyyy + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyyz*M_yy + &
      D_yyyzz*M_yyz + D_yyyzzz*M_yyzz + D_yyz*M_y + D_yyzz*M_yz + &
      D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz* &
      M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz)
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = L_0 + (D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxy*M_xxxxxy + D_xxxxxz* &
      M_xxxxxz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyz* &
      M_xxxxyz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxy*M_xxxy + &
      D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyz*M_xxxyyz + D_xxxyz &
      *M_xxxyz + D_xxxyzz*M_xxxyzz + D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + &
      D_xxxzzz*M_xxxzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyyy*M_xxyyy &
      + D_xxyyyy*M_xxyyyy + D_xxyyyz*M_xxyyyz + D_xxyyz*M_xxyyz + &
      D_xxyyzz*M_xxyyzz + D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz* &
      M_xxyzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xxzzz*M_xxzzz + &
      D_xxzzzz*M_xxzzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + &
      D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyz*M_xyyyyz + D_xyyyz &
      *M_xyyyz + D_xyyyzz*M_xyyyzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + &
      D_xyyzzz*M_xyyzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz &
      + D_xyzzzz*M_xyzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + &
      D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_y*M_y + D_yy*M_yy + D_yyy &
      *M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + &
      D_yyyyyz*M_yyyyyz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + D_yyyz* &
      M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + D_yyzzzz*M_yyzzzz + D_yz*M_yz + &
      D_yzz*M_yzz + D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz &
      + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz + D_zzzzz* &
      M_zzzzz + D_zzzzzz*M_zzzzzz)
    L_z      = L_z + (D_xxxxxz*M_xxxxx + D_xxxxyz*M_xxxxy + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz &
      + D_xxxyyz*M_xxxyy + D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxz* &
      M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxyyyz*M_xxyyy + &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyz*M_xxy + D_xxyzz*M_xxyz &
      + D_xxyzzz*M_xxyzz + D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + &
      D_xxzzzz*M_xxzzz + D_xyyyyz*M_xyyyy + D_xyyyz*M_xyyy + D_xyyyzz* &
      M_xyyyz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_yyyyyz*M_yyyyy + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + &
      D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + D_yyz*M_yy + &
      D_yyzz*M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yz*M_y + &
      D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + &
      D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + D_zzzzz*M_zzzz + &
      D_zzzzzz*M_zzzzz)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
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
#undef  M_yyz               
#undef  L_xxxy              
#undef  M_yzz               
#undef  L_xxxz              
#undef  M_zzz               
#undef  L_xxyy              
#undef  M_xxxx              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xxxy              
#undef  M_xxxz              
#undef  L_xyyz              
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
#undef  L_yyyyy             
#undef  M_zzzz              
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxxz            
#undef  M_xxxyz             
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  L_xxxyyy            
#undef  M_xxyyz             
#undef  L_xxxyyz            
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  M_xxzzz             
#undef  L_xxyyyz            
#undef  M_xyyyy             
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyz             
#undef  L_yyyyyy            
#undef  M_xyyzz             
#undef  L_yyyyyz            
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
    
! OPS  711*ADD + 2*DIV + 890*MUL + 52*NEG + POW + 20*SUB = 1676  (2235 before optimization)
subroutine mom_es_M2L2(M1, r1, L1, M2,r2,L2)
    real(dp), intent(in),  dimension(0:MOM_ES_M_END)      :: M1,M2
    real(dp), intent(in),  dimension(1:3)                :: r1,r2
    real(dp), intent(out), dimension(0:MOM_ES_L_END)      :: L1,L2
    real(dp),              dimension(1:2,0:MOM_ES_M_END)  :: M
    real(dp),              dimension(1:2,0:MOM_ES_L_END)  :: L
    real(dp),              dimension(1:2,1:3)            :: r
    real(dp), dimension(1:2) :: a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3,&
                c4, c5, c6, u10, u11, u12, u13, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,&
                v2, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v3, v30,&
                v31, v32, v33, v34, v35, v36, v37, v38, v39, v4, v40, v41,&
                v42, v43, v44, v45, v46, v47, v48, v49, v5, v50, v51, v52,&
                v53, v54, v55, v56, v57, v58, v59, v6, v60, v61, v62, v63,&
                v64, v65, v66, v67, v68, v69, v7, v70, v71, v72, v73, v74,&
                v75, v76, v77, v78, v79, v8, v9, h, u, D_0, D_x, D_y, D_z,&
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
                D_yyyzzz, D_yyzzzz, D_yzzzzz, D_zzzzzz
#define M_0                  M(1:2,0)
#define L_0                  L(1:2,0)
#define y                    r(1:2,2)
#define z                    r(1:2,3)
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
#define M_yyz                M(1:2,17)
#define L_xxxy               L(1:2,17)
#define M_yzz                M(1:2,18)
#define L_xxxz               L(1:2,18)
#define M_zzz                M(1:2,19)
#define L_xxyy               L(1:2,19)
#define M_xxxx               M(1:2,20)
#define L_xxyz               L(1:2,20)
#define L_xyyy               L(1:2,21)
#define M_xxxy               M(1:2,21)
#define M_xxxz               M(1:2,22)
#define L_xyyz               L(1:2,22)
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
#define L_yyyyy              L(1:2,34)
#define M_zzzz               M(1:2,34)
#define L_yyyyz              L(1:2,35)
#define M_xxxxx              M(1:2,35)
#define M_xxxxy              M(1:2,36)
#define L_xxxxxx             L(1:2,36)
#define L_xxxxxy             L(1:2,37)
#define M_xxxxz              M(1:2,37)
#define M_xxxyy              M(1:2,38)
#define L_xxxxxz             L(1:2,38)
#define M_xxxyz              M(1:2,39)
#define L_xxxxyy             L(1:2,39)
#define L_xxxxyz             L(1:2,40)
#define M_xxxzz              M(1:2,40)
#define M_xxyyy              M(1:2,41)
#define L_xxxyyy             L(1:2,41)
#define M_xxyyz              M(1:2,42)
#define L_xxxyyz             L(1:2,42)
#define M_xxyzz              M(1:2,43)
#define L_xxyyyy             L(1:2,43)
#define M_xxzzz              M(1:2,44)
#define L_xxyyyz             L(1:2,44)
#define M_xyyyy              M(1:2,45)
#define L_xyyyyy             L(1:2,45)
#define L_xyyyyz             L(1:2,46)
#define M_xyyyz              M(1:2,46)
#define L_yyyyyy             L(1:2,47)
#define M_xyyzz              M(1:2,47)
#define L_yyyyyz             L(1:2,48)
#define M_xyzzz              M(1:2,48)
#define M_xzzzz              M(1:2,49)
#define M_yyyyy              M(1:2,50)
#define M_yyyyz              M(1:2,51)
#define M_yyyzz              M(1:2,52)
#define M_yyzzz              M(1:2,53)
#define M_yzzzz              M(1:2,54)
#define M_zzzzz              M(1:2,55)
#define M_xxxxxx             M(1:2,56)
#define M_xxxxxy             M(1:2,57)
#define M_xxxxxz             M(1:2,58)
#define M_xxxxyy             M(1:2,59)
#define M_xxxxyz             M(1:2,60)
#define M_xxxxzz             M(1:2,61)
#define M_xxxyyy             M(1:2,62)
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
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v77      = y*z
    v71      = 15.0d0*v77
    v73      = x*y
    v75      = v77
    c1       = z
    b1       = y
    a1       = x
    a2       = a1*a1
    v0       = a2
    v63      = 5.0d0*v0
    v5       = 3.0d0*v0
    v10      = v63
    v24      = 7.0d0*v0
    a3       = a1*a2
    a4       = a2*a2
    v19      = a4
    v52      = 33.0d0*v19
    a5       = a2*a3
    a6       = a3*a3
    b2       = b1*b1
    v1       = b2
    v64      = v0*v1
    v7       = 3.0d0*v1
    v14      = 5.0d0*v1
    v27      = v64
    v29      = 7.0d0*v1
    b3       = b1*b2
    b4       = b2*b2
    v31      = b4
    v61      = 33.0d0*v31
    b5       = b2*b3
    b6       = b3*b3
    c2       = c1*c1
    h        = c2 + v0 + v1
    v65      = 3.0d0*h
    v66      = h*v0
    v67      = h*v1
    v76      = 21.0d0*h
    v4       = -h
    v12      = v65
    v13      = -15.0d0*v1 + v12
    v17      = h*h
    v18      = 3.0d0*v17
    v20      = v66
    v21      = -30.0d0*v20
    v23      = -v12
    v25      = v23 + v24
    v30      = v23 + v29
    v32      = v67
    v33      = -30.0d0*v32
    v36      = -15.0d0*v17
    v37      = -45.0d0*v17
    v38      = v37 - 945.0d0*v19 + 630.0d0*v66
    v40      = -(v18 + 63.0d0*v27)
    v43      = v37 - 945.0d0*v31 + 630.0d0*v67
    v46      = h*h*h
    v47      = -5.0d0*v46
    v48      = 315.0d0*h
    v49      = v0*v17
    v51      = 5.0d0*v17
    v53      = v21 + v51 + v52
    v55      = -(126.0d0*v1*v20 + v46)
    v57      = -v0*v12
    v58      = -v1*v12
    v59      = v17 + 33.0d0*v27
    v60      = v1*v17
    v62      = v33 + v51 + v61
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
    v68      = 3.0d0*v3
    v6       = v68*x
    D_xx     = v3*(v4 + v5)
    D_xy     = v6*y
    D_xz     = v6*z
    D_yy     = v3*(v4 + v7)
    D_yz     = v68*v75
    D_zz     = -(D_xx + D_yy)
    u6       = u3*u3
    u7       = u3*u4
    v8       = u7
    v69      = 3.0d0*v8
    v9       = v8*x
    v11      = v69*(h - v10)
    D_xxx    = -3.0d0*v9*(v63 - v65)
    D_xxy    = v11*y
    D_xxz    = v11*z
    D_xyy    = v13*v9
    D_xyz    = -v71*v9
    D_xzz    = -(D_xxx + D_xyy)
    D_yyy    = v69*y*(v12 - v14)
    D_yyz    = v13*v8*z
    D_yzz    = -(D_xxy + D_yyy)
    D_zzz    = -(D_xxz + D_yyz)
    u8       = u4*u4
    u9       = u4*u5
    v15      = u9
    v70      = 15.0d0*v15*x
    v16      = 3.0d0*v15
    v22      = v70*y
    v26      = v70*z
    v28      = v15*v71
    D_xxxx   = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy   = v22*v25
    D_xxxz   = v25*v26
    D_xxyy   = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    D_xxyz   = v28*(v24 + v4)
    D_xxzz   = -(D_xxxx + D_xxyy)
    D_xyyy   = v22*v30
    D_xyyz   = v26*(v29 + v4)
    D_xyzz   = -(D_xxxy + D_xyyy)
    D_xzzz   = -(D_xxxz + D_xyyz)
    D_yyyy   = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz   = v28*v30
    D_yyzz   = -(D_xxyy + D_yyyy)
    D_yzzz   = -(D_xxyz + D_yyyz)
    D_zzzz   = -(D_xxzz + D_yyzz)
    u10      = u5*u5
    u11      = u5*u6
    v34      = u11
    v78      = v34*z
    v72      = 15.0d0*v34
    v35      = v72*x
    v39      = v78
    v41      = 315.0d0*v73*v78
    v42      = v72*y
    D_xxxxx  = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy  = v34*v38*y
    D_xxxxz  = v38*v39
    D_xxxyy  = v35*(v40 + h*v24 + 21.0d0*v32)
    D_xxxyz  = v41*(h - v5)
    D_xxxzz  = -(D_xxxxx + D_xxxyy)
    D_xxyyy  = v42*(v40 + h*v29 + 21.0d0*v20)
    D_xxyyz  = v39*(v36 - 945.0d0*v64 + 105.0d0*(v66 + v67))
    D_xxyzz  = -(D_xxxxy + D_xxyyy)
    D_xxzzz  = -(D_xxxxz + D_xxyyz)
    D_xyyyy  = v34*v43*x
    D_xyyyz  = v41*(h - v7)
    D_xyyzz  = -(D_xxxyy + D_xyyyy)
    D_xyzzz  = -(D_xxxyz + D_xyyyz)
    D_xzzzz  = -(D_xxxzz + D_xyyzz)
    D_yyyyy  = v42*(v36 - 63.0d0*v31 + 70.0d0*v32)
    D_yyyyz  = v39*v43
    D_yyyzz  = -(D_xxyyy + D_yyyyy)
    D_yyzzz  = -(D_xxyyz + D_yyyyz)
    D_yzzzz  = -(D_xxyzz + D_yyyzz)
    D_zzzzz  = -(D_xxzzz + D_yyzzz)
    u12      = u6*u6
    u13      = u6*u7
    v44      = u13
    v79      = 315.0d0*v44
    v74      = v79*x
    v45      = 45.0d0*v44
    v50      = v74*y
    v54      = v74*z
    v56      = v75*v79
    D_xxxxxx = v45*(v47 + 231.0d0*a6 - v19*v48 + 105.0d0*v49)
    L_xxxxxx = D_xxxxxx*M_0
    D_xxxxxy = v50*v53
    L_xxxxxy = D_xxxxxy*M_0
    D_xxxxxz = v53*v54
    L_xxxxx  = D_xxxxx*M_0 + D_xxxxxx*M_x + D_xxxxxy*M_y + D_xxxxxz*M_z
    L_xxxxxz = D_xxxxxz*M_0
    D_xxxxyy = v45*(v55 + 231.0d0*v1*v19 + v17*v29 - v19*v76 + 14.0d0*v49)
    L_xxxxyy = D_xxxxyy*M_0
    D_xxxxyz = v56*(-18.0d0*v20 + v17 + v52)
    L_xxxxy  = D_xxxxxy*M_x + D_xxxxy*M_0 + D_xxxxyy*M_y + D_xxxxyz*M_z
    L_xxxxyz = D_xxxxyz*M_0
    D_xxxxzz = -(D_xxxxxx + D_xxxxyy)
    L_xxxx   = D_xxxx*M_0 + D_xxxxx*M_x + D_xxxxxx*M_xx + D_xxxxxy*M_xy + D_xxxxxz*M_xz &
      + D_xxxxy*M_y + D_xxxxyy*M_yy + D_xxxxyz*M_yz + D_xxxxz*M_z + &
      D_xxxxzz*M_zz
    L_xxxxz  = D_xxxxxz*M_x + D_xxxxyz*M_y + D_xxxxz*M_0 + D_xxxxzz*M_z
    D_xxxyyy = 945.0d0*v44*v73*(11.0d0*v27 + v17 + v57 + v58)
    L_xxxyyy = D_xxxyyy*M_0
    D_xxxyyz = v54*(-9.0d0*v32 + v57 + v59)
    L_xxxyy  = D_xxxxyy*M_x + D_xxxyy*M_0 + D_xxxyyy*M_y + D_xxxyyz*M_z
    L_xxxyyz = D_xxxyyz*M_0
    D_xxxyzz = -(D_xxxxxy + D_xxxyyy)
    L_xxxy   = D_xxxxxy*M_xx + D_xxxxy*M_x + D_xxxxyy*M_xy + D_xxxxyz*M_xz + D_xxxy*M_0 &
      + D_xxxyy*M_y + D_xxxyyy*M_yy + D_xxxyyz*M_yz + D_xxxyz*M_z + &
      D_xxxyzz*M_zz
    L_xxxyz  = D_xxxxyz*M_x + D_xxxyyz*M_y + D_xxxyz*M_0 + D_xxxyzz*M_z
    D_xxxzzz = -(D_xxxxxz + D_xxxyyz)
    L_xxx    = D_xxx*M_0 + D_xxxx*M_x + D_xxxxx*M_xx + D_xxxxxx*M_xxx + D_xxxxxy*M_xxy &
      + D_xxxxxz*M_xxz + D_xxxxy*M_xy + D_xxxxyy*M_xyy + D_xxxxyz*M_xyz &
      + D_xxxxz*M_xz + D_xxxxzz*M_xzz + D_xxxy*M_y + D_xxxyy*M_yy + &
      D_xxxyyy*M_yyy + D_xxxyyz*M_yyz + D_xxxyz*M_yz + D_xxxyzz*M_yzz + &
      D_xxxz*M_z + D_xxxzz*M_zz + D_xxxzzz*M_zzz
    L_xxxz   = D_xxxxxz*M_xx + D_xxxxyz*M_xy + D_xxxxz*M_x + D_xxxxzz*M_xz + D_xxxyyz* &
      M_yy + D_xxxyz*M_y + D_xxxyzz*M_yz + D_xxxz*M_0 + D_xxxzz*M_z + &
      D_xxxzzz*M_zz
    D_xxyyyy = v45*(v55 + 231.0d0*v0*v31 + v17*v24 - v31*v76 + 14.0d0*v60)
    L_xxyyyy = D_xxyyyy*M_0
    D_xxyyyz = v56*(-9.0d0*v20 + v58 + v59)
    L_xxyyy  = D_xxxyyy*M_x + D_xxyyy*M_0 + D_xxyyyy*M_y + D_xxyyyz*M_z
    L_xxyyyz = D_xxyyyz*M_0
    D_xxyyzz = -(D_xxxxyy + D_xxyyyy)
    L_xxyy   = D_xxxxyy*M_xx + D_xxxyy*M_x + D_xxxyyy*M_xy + D_xxxyyz*M_xz + D_xxyy*M_0 &
      + D_xxyyy*M_y + D_xxyyyy*M_yy + D_xxyyyz*M_yz + D_xxyyz*M_z + &
      D_xxyyzz*M_zz
    L_xxyyz  = D_xxxyyz*M_x + D_xxyyyz*M_y + D_xxyyz*M_0 + D_xxyyzz*M_z
    D_xxyzzz = -(D_xxxxyz + D_xxyyyz)
    L_xxy    = D_xxxxxy*M_xxx + D_xxxxy*M_xx + D_xxxxyy*M_xxy + D_xxxxyz*M_xxz + D_xxxy &
      *M_x + D_xxxyy*M_xy + D_xxxyyy*M_xyy + D_xxxyyz*M_xyz + D_xxxyz* &
      M_xz + D_xxxyzz*M_xzz + D_xxy*M_0 + D_xxyy*M_y + D_xxyyy*M_yy + &
      D_xxyyyy*M_yyy + D_xxyyyz*M_yyz + D_xxyyz*M_yz + D_xxyyzz*M_yzz + &
      D_xxyz*M_z + D_xxyzz*M_zz + D_xxyzzz*M_zzz
    L_xxyz   = D_xxxxyz*M_xx + D_xxxyyz*M_xy + D_xxxyz*M_x + D_xxxyzz*M_xz + D_xxyyyz* &
      M_yy + D_xxyyz*M_y + D_xxyyzz*M_yz + D_xxyz*M_0 + D_xxyzz*M_z + &
      D_xxyzzz*M_zz
    D_xxzzzz = -(D_xxxxzz + D_xxyyzz)
    L_xx     = D_xx*M_0 + D_xxx*M_x + D_xxxx*M_xx + D_xxxxx*M_xxx + D_xxxxxx*M_xxxx + &
      D_xxxxxy*M_xxxy + D_xxxxxz*M_xxxz + D_xxxxy*M_xxy + D_xxxxyy* &
      M_xxyy + D_xxxxyz*M_xxyz + D_xxxxz*M_xxz + D_xxxxzz*M_xxzz + &
      D_xxxy*M_xy + D_xxxyy*M_xyy + D_xxxyyy*M_xyyy + D_xxxyyz*M_xyyz + &
      D_xxxyz*M_xyz + D_xxxyzz*M_xyzz + D_xxxz*M_xz + D_xxxzz*M_xzz + &
      D_xxxzzz*M_xzzz + D_xxy*M_y + D_xxyy*M_yy + D_xxyyy*M_yyy + &
      D_xxyyyy*M_yyyy + D_xxyyyz*M_yyyz + D_xxyyz*M_yyz + D_xxyyzz* &
      M_yyzz + D_xxyz*M_yz + D_xxyzz*M_yzz + D_xxyzzz*M_yzzz + D_xxz* &
      M_z + D_xxzz*M_zz + D_xxzzz*M_zzz + D_xxzzzz*M_zzzz
    L_xxz    = D_xxxxxz*M_xxx + D_xxxxyz*M_xxy + D_xxxxz*M_xx + D_xxxxzz*M_xxz + &
      D_xxxyyz*M_xyy + D_xxxyz*M_xy + D_xxxyzz*M_xyz + D_xxxz*M_x + &
      D_xxxzz*M_xz + D_xxxzzz*M_xzz + D_xxyyyz*M_yyy + D_xxyyz*M_yy + &
      D_xxyyzz*M_yyz + D_xxyz*M_y + D_xxyzz*M_yz + D_xxyzzz*M_yzz + &
      D_xxz*M_0 + D_xxzz*M_z + D_xxzzz*M_zz + D_xxzzzz*M_zzz
    D_xyyyyy = v50*v62
    L_xyyyyy = D_xyyyyy*M_0
    D_xyyyyz = v54*(-18.0d0*v32 + v17 + v61)
    L_xyyyy  = D_xxyyyy*M_x + D_xyyyy*M_0 + D_xyyyyy*M_y + D_xyyyyz*M_z
    L_xyyyyz = D_xyyyyz*M_0
    D_xyyyzz = -(D_xxxyyy + D_xyyyyy)
    L_xyyy   = D_xxxyyy*M_xx + D_xxyyy*M_x + D_xxyyyy*M_xy + D_xxyyyz*M_xz + D_xyyy*M_0 &
      + D_xyyyy*M_y + D_xyyyyy*M_yy + D_xyyyyz*M_yz + D_xyyyz*M_z + &
      D_xyyyzz*M_zz
    L_xyyyz  = D_xxyyyz*M_x + D_xyyyyz*M_y + D_xyyyz*M_0 + D_xyyyzz*M_z
    D_xyyzzz = -(D_xxxyyz + D_xyyyyz)
    L_xyy    = D_xxxxyy*M_xxx + D_xxxyy*M_xx + D_xxxyyy*M_xxy + D_xxxyyz*M_xxz + D_xxyy &
      *M_x + D_xxyyy*M_xy + D_xxyyyy*M_xyy + D_xxyyyz*M_xyz + D_xxyyz* &
      M_xz + D_xxyyzz*M_xzz + D_xyy*M_0 + D_xyyy*M_y + D_xyyyy*M_yy + &
      D_xyyyyy*M_yyy + D_xyyyyz*M_yyz + D_xyyyz*M_yz + D_xyyyzz*M_yzz + &
      D_xyyz*M_z + D_xyyzz*M_zz + D_xyyzzz*M_zzz
    L_xyyz   = D_xxxyyz*M_xx + D_xxyyyz*M_xy + D_xxyyz*M_x + D_xxyyzz*M_xz + D_xyyyyz* &
      M_yy + D_xyyyz*M_y + D_xyyyzz*M_yz + D_xyyz*M_0 + D_xyyzz*M_z + &
      D_xyyzzz*M_zz
    D_xyzzzz = -(D_xxxyzz + D_xyyyzz)
    L_xy     = D_xxxxxy*M_xxxx + D_xxxxy*M_xxx + D_xxxxyy*M_xxxy + D_xxxxyz*M_xxxz + &
      D_xxxy*M_xx + D_xxxyy*M_xxy + D_xxxyyy*M_xxyy + D_xxxyyz*M_xxyz + &
      D_xxxyz*M_xxz + D_xxxyzz*M_xxzz + D_xxy*M_x + D_xxyy*M_xy + &
      D_xxyyy*M_xyy + D_xxyyyy*M_xyyy + D_xxyyyz*M_xyyz + D_xxyyz*M_xyz &
      + D_xxyyzz*M_xyzz + D_xxyz*M_xz + D_xxyzz*M_xzz + D_xxyzzz*M_xzzz &
      + D_xy*M_0 + D_xyy*M_y + D_xyyy*M_yy + D_xyyyy*M_yyy + D_xyyyyy* &
      M_yyyy + D_xyyyyz*M_yyyz + D_xyyyz*M_yyz + D_xyyyzz*M_yyzz + &
      D_xyyz*M_yz + D_xyyzz*M_yzz + D_xyyzzz*M_yzzz + D_xyz*M_z + &
      D_xyzz*M_zz + D_xyzzz*M_zzz + D_xyzzzz*M_zzzz
    L_xyz    = D_xxxxyz*M_xxx + D_xxxyyz*M_xxy + D_xxxyz*M_xx + D_xxxyzz*M_xxz + &
      D_xxyyyz*M_xyy + D_xxyyz*M_xy + D_xxyyzz*M_xyz + D_xxyz*M_x + &
      D_xxyzz*M_xz + D_xxyzzz*M_xzz + D_xyyyyz*M_yyy + D_xyyyz*M_yy + &
      D_xyyyzz*M_yyz + D_xyyz*M_y + D_xyyzz*M_yz + D_xyyzzz*M_yzz + &
      D_xyz*M_0 + D_xyzz*M_z + D_xyzzz*M_zz + D_xyzzzz*M_zzz
    D_xzzzzz = -(D_xxxzzz + D_xyyzzz)
    L_x      = D_x*M_0 + D_xx*M_x + D_xxx*M_xx + D_xxxx*M_xxx + D_xxxxx*M_xxxx + &
      D_xxxxxx*M_xxxxx + D_xxxxxy*M_xxxxy + D_xxxxxz*M_xxxxz + D_xxxxy* &
      M_xxxy + D_xxxxyy*M_xxxyy + D_xxxxyz*M_xxxyz + D_xxxxz*M_xxxz + &
      D_xxxxzz*M_xxxzz + D_xxxy*M_xxy + D_xxxyy*M_xxyy + D_xxxyyy* &
      M_xxyyy + D_xxxyyz*M_xxyyz + D_xxxyz*M_xxyz + D_xxxyzz*M_xxyzz + &
      D_xxxz*M_xxz + D_xxxzz*M_xxzz + D_xxxzzz*M_xxzzz + D_xxy*M_xy + &
      D_xxyy*M_xyy + D_xxyyy*M_xyyy + D_xxyyyy*M_xyyyy + D_xxyyyz* &
      M_xyyyz + D_xxyyz*M_xyyz + D_xxyyzz*M_xyyzz + D_xxyz*M_xyz + &
      D_xxyzz*M_xyzz + D_xxyzzz*M_xyzzz + D_xxz*M_xz + D_xxzz*M_xzz + &
      D_xxzzz*M_xzzz + D_xxzzzz*M_xzzzz + D_xy*M_y + D_xyy*M_yy + &
      D_xyyy*M_yyy + D_xyyyy*M_yyyy + D_xyyyyy*M_yyyyy + D_xyyyyz* &
      M_yyyyz + D_xyyyz*M_yyyz + D_xyyyzz*M_yyyzz + D_xyyz*M_yyz + &
      D_xyyzz*M_yyzz + D_xyyzzz*M_yyzzz + D_xyz*M_yz + D_xyzz*M_yzz + &
      D_xyzzz*M_yzzz + D_xyzzzz*M_yzzzz + D_xz*M_z + D_xzz*M_zz + &
      D_xzzz*M_zzz + D_xzzzz*M_zzzz + D_xzzzzz*M_zzzzz
    L_xz     = D_xxxxxz*M_xxxx + D_xxxxyz*M_xxxy + D_xxxxz*M_xxx + D_xxxxzz*M_xxxz + &
      D_xxxyyz*M_xxyy + D_xxxyz*M_xxy + D_xxxyzz*M_xxyz + D_xxxz*M_xx + &
      D_xxxzz*M_xxz + D_xxxzzz*M_xxzz + D_xxyyyz*M_xyyy + D_xxyyz*M_xyy &
      + D_xxyyzz*M_xyyz + D_xxyz*M_xy + D_xxyzz*M_xyz + D_xxyzzz*M_xyzz &
      + D_xxz*M_x + D_xxzz*M_xz + D_xxzzz*M_xzz + D_xxzzzz*M_xzzz + &
      D_xyyyyz*M_yyyy + D_xyyyz*M_yyy + D_xyyyzz*M_yyyz + D_xyyz*M_yy + &
      D_xyyzz*M_yyz + D_xyyzzz*M_yyzz + D_xyz*M_y + D_xyzz*M_yz + &
      D_xyzzz*M_yzz + D_xyzzzz*M_yzzz + D_xz*M_0 + D_xzz*M_z + D_xzzz* &
      M_zz + D_xzzzz*M_zzz + D_xzzzzz*M_zzzz
    D_yyyyyy = v45*(v47 + 231.0d0*b6 - v31*v48 + 105.0d0*v60)
    L_yyyyyy = D_yyyyyy*M_0
    D_yyyyyz = v56*v62
    L_yyyyy  = D_xyyyyy*M_x + D_yyyyy*M_0 + D_yyyyyy*M_y + D_yyyyyz*M_z
    L_yyyyyz = D_yyyyyz*M_0
    D_yyyyzz = -(D_xxyyyy + D_yyyyyy)
    L_yyyy   = D_xxyyyy*M_xx + D_xyyyy*M_x + D_xyyyyy*M_xy + D_xyyyyz*M_xz + D_yyyy*M_0 &
      + D_yyyyy*M_y + D_yyyyyy*M_yy + D_yyyyyz*M_yz + D_yyyyz*M_z + &
      D_yyyyzz*M_zz
    L_yyyyz  = D_xyyyyz*M_x + D_yyyyyz*M_y + D_yyyyz*M_0 + D_yyyyzz*M_z
    D_yyyzzz = -(D_xxyyyz + D_yyyyyz)
    L_yyy    = D_xxxyyy*M_xxx + D_xxyyy*M_xx + D_xxyyyy*M_xxy + D_xxyyyz*M_xxz + D_xyyy &
      *M_x + D_xyyyy*M_xy + D_xyyyyy*M_xyy + D_xyyyyz*M_xyz + D_xyyyz* &
      M_xz + D_xyyyzz*M_xzz + D_yyy*M_0 + D_yyyy*M_y + D_yyyyy*M_yy + &
      D_yyyyyy*M_yyy + D_yyyyyz*M_yyz + D_yyyyz*M_yz + D_yyyyzz*M_yzz + &
      D_yyyz*M_z + D_yyyzz*M_zz + D_yyyzzz*M_zzz
    L_yyyz   = D_xxyyyz*M_xx + D_xyyyyz*M_xy + D_xyyyz*M_x + D_xyyyzz*M_xz + D_yyyyyz* &
      M_yy + D_yyyyz*M_y + D_yyyyzz*M_yz + D_yyyz*M_0 + D_yyyzz*M_z + &
      D_yyyzzz*M_zz
    D_yyzzzz = -(D_xxyyzz + D_yyyyzz)
    L_yy     = D_xxxxyy*M_xxxx + D_xxxyy*M_xxx + D_xxxyyy*M_xxxy + D_xxxyyz*M_xxxz + &
      D_xxyy*M_xx + D_xxyyy*M_xxy + D_xxyyyy*M_xxyy + D_xxyyyz*M_xxyz + &
      D_xxyyz*M_xxz + D_xxyyzz*M_xxzz + D_xyy*M_x + D_xyyy*M_xy + &
      D_xyyyy*M_xyy + D_xyyyyy*M_xyyy + D_xyyyyz*M_xyyz + D_xyyyz*M_xyz &
      + D_xyyyzz*M_xyzz + D_xyyz*M_xz + D_xyyzz*M_xzz + D_xyyzzz*M_xzzz &
      + D_yy*M_0 + D_yyy*M_y + D_yyyy*M_yy + D_yyyyy*M_yyy + D_yyyyyy* &
      M_yyyy + D_yyyyyz*M_yyyz + D_yyyyz*M_yyz + D_yyyyzz*M_yyzz + &
      D_yyyz*M_yz + D_yyyzz*M_yzz + D_yyyzzz*M_yzzz + D_yyz*M_z + &
      D_yyzz*M_zz + D_yyzzz*M_zzz + D_yyzzzz*M_zzzz
    L_yyz    = D_xxxyyz*M_xxx + D_xxyyyz*M_xxy + D_xxyyz*M_xx + D_xxyyzz*M_xxz + &
      D_xyyyyz*M_xyy + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyz*M_x + &
      D_xyyzz*M_xz + D_xyyzzz*M_xzz + D_yyyyyz*M_yyy + D_yyyyz*M_yy + &
      D_yyyyzz*M_yyz + D_yyyz*M_y + D_yyyzz*M_yz + D_yyyzzz*M_yzz + &
      D_yyz*M_0 + D_yyzz*M_z + D_yyzzz*M_zz + D_yyzzzz*M_zzz
    D_yzzzzz = -(D_xxyzzz + D_yyyzzz)
    L_y      = D_xxxxxy*M_xxxxx + D_xxxxy*M_xxxx + D_xxxxyy*M_xxxxy + D_xxxxyz*M_xxxxz &
      + D_xxxy*M_xxx + D_xxxyy*M_xxxy + D_xxxyyy*M_xxxyy + D_xxxyyz* &
      M_xxxyz + D_xxxyz*M_xxxz + D_xxxyzz*M_xxxzz + D_xxy*M_xx + D_xxyy &
      *M_xxy + D_xxyyy*M_xxyy + D_xxyyyy*M_xxyyy + D_xxyyyz*M_xxyyz + &
      D_xxyyz*M_xxyz + D_xxyyzz*M_xxyzz + D_xxyz*M_xxz + D_xxyzz*M_xxzz &
      + D_xxyzzz*M_xxzzz + D_xy*M_x + D_xyy*M_xy + D_xyyy*M_xyy + &
      D_xyyyy*M_xyyy + D_xyyyyy*M_xyyyy + D_xyyyyz*M_xyyyz + D_xyyyz* &
      M_xyyz + D_xyyyzz*M_xyyzz + D_xyyz*M_xyz + D_xyyzz*M_xyzz + &
      D_xyyzzz*M_xyzzz + D_xyz*M_xz + D_xyzz*M_xzz + D_xyzzz*M_xzzz + &
      D_xyzzzz*M_xzzzz + D_y*M_0 + D_yy*M_y + D_yyy*M_yy + D_yyyy*M_yyy &
      + D_yyyyy*M_yyyy + D_yyyyyy*M_yyyyy + D_yyyyyz*M_yyyyz + D_yyyyz* &
      M_yyyz + D_yyyyzz*M_yyyzz + D_yyyz*M_yyz + D_yyyzz*M_yyzz + &
      D_yyyzzz*M_yyzzz + D_yyz*M_yz + D_yyzz*M_yzz + D_yyzzz*M_yzzz + &
      D_yyzzzz*M_yzzzz + D_yz*M_z + D_yzz*M_zz + D_yzzz*M_zzz + D_yzzzz &
      *M_zzzz + D_yzzzzz*M_zzzzz
    L_yz     = D_xxxxyz*M_xxxx + D_xxxyyz*M_xxxy + D_xxxyz*M_xxx + D_xxxyzz*M_xxxz + &
      D_xxyyyz*M_xxyy + D_xxyyz*M_xxy + D_xxyyzz*M_xxyz + D_xxyz*M_xx + &
      D_xxyzz*M_xxz + D_xxyzzz*M_xxzz + D_xyyyyz*M_xyyy + D_xyyyz*M_xyy &
      + D_xyyyzz*M_xyyz + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyyzzz*M_xyzz &
      + D_xyz*M_x + D_xyzz*M_xz + D_xyzzz*M_xzz + D_xyzzzz*M_xzzz + &
      D_yyyyyz*M_yyyy + D_yyyyz*M_yyy + D_yyyyzz*M_yyyz + D_yyyz*M_yy + &
      D_yyyzz*M_yyz + D_yyyzzz*M_yyzz + D_yyz*M_y + D_yyzz*M_yz + &
      D_yyzzz*M_yzz + D_yyzzzz*M_yzzz + D_yz*M_0 + D_yzz*M_z + D_yzzz* &
      M_zz + D_yzzzz*M_zzz + D_yzzzzz*M_zzzz
    D_zzzzzz = -(D_xxzzzz + D_yyzzzz)
    L_0      = D_0*M_0 + D_x*M_x + D_xx*M_xx + D_xxx*M_xxx + D_xxxx*M_xxxx + D_xxxxx* &
      M_xxxxx + D_xxxxxx*M_xxxxxx + D_xxxxxy*M_xxxxxy + D_xxxxxz* &
      M_xxxxxz + D_xxxxy*M_xxxxy + D_xxxxyy*M_xxxxyy + D_xxxxyz* &
      M_xxxxyz + D_xxxxz*M_xxxxz + D_xxxxzz*M_xxxxzz + D_xxxy*M_xxxy + &
      D_xxxyy*M_xxxyy + D_xxxyyy*M_xxxyyy + D_xxxyyz*M_xxxyyz + D_xxxyz &
      *M_xxxyz + D_xxxyzz*M_xxxyzz + D_xxxz*M_xxxz + D_xxxzz*M_xxxzz + &
      D_xxxzzz*M_xxxzzz + D_xxy*M_xxy + D_xxyy*M_xxyy + D_xxyyy*M_xxyyy &
      + D_xxyyyy*M_xxyyyy + D_xxyyyz*M_xxyyyz + D_xxyyz*M_xxyyz + &
      D_xxyyzz*M_xxyyzz + D_xxyz*M_xxyz + D_xxyzz*M_xxyzz + D_xxyzzz* &
      M_xxyzzz + D_xxz*M_xxz + D_xxzz*M_xxzz + D_xxzzz*M_xxzzz + &
      D_xxzzzz*M_xxzzzz + D_xy*M_xy + D_xyy*M_xyy + D_xyyy*M_xyyy + &
      D_xyyyy*M_xyyyy + D_xyyyyy*M_xyyyyy + D_xyyyyz*M_xyyyyz + D_xyyyz &
      *M_xyyyz + D_xyyyzz*M_xyyyzz + D_xyyz*M_xyyz + D_xyyzz*M_xyyzz + &
      D_xyyzzz*M_xyyzzz + D_xyz*M_xyz + D_xyzz*M_xyzz + D_xyzzz*M_xyzzz &
      + D_xyzzzz*M_xyzzzz + D_xz*M_xz + D_xzz*M_xzz + D_xzzz*M_xzzz + &
      D_xzzzz*M_xzzzz + D_xzzzzz*M_xzzzzz + D_y*M_y + D_yy*M_yy + D_yyy &
      *M_yyy + D_yyyy*M_yyyy + D_yyyyy*M_yyyyy + D_yyyyyy*M_yyyyyy + &
      D_yyyyyz*M_yyyyyz + D_yyyyz*M_yyyyz + D_yyyyzz*M_yyyyzz + D_yyyz* &
      M_yyyz + D_yyyzz*M_yyyzz + D_yyyzzz*M_yyyzzz + D_yyz*M_yyz + &
      D_yyzz*M_yyzz + D_yyzzz*M_yyzzz + D_yyzzzz*M_yyzzzz + D_yz*M_yz + &
      D_yzz*M_yzz + D_yzzz*M_yzzz + D_yzzzz*M_yzzzz + D_yzzzzz*M_yzzzzz &
      + D_z*M_z + D_zz*M_zz + D_zzz*M_zzz + D_zzzz*M_zzzz + D_zzzzz* &
      M_zzzzz + D_zzzzzz*M_zzzzzz
    L_z      = D_xxxxxz*M_xxxxx + D_xxxxyz*M_xxxxy + D_xxxxz*M_xxxx + D_xxxxzz*M_xxxxz &
      + D_xxxyyz*M_xxxyy + D_xxxyz*M_xxxy + D_xxxyzz*M_xxxyz + D_xxxz* &
      M_xxx + D_xxxzz*M_xxxz + D_xxxzzz*M_xxxzz + D_xxyyyz*M_xxyyy + &
      D_xxyyz*M_xxyy + D_xxyyzz*M_xxyyz + D_xxyz*M_xxy + D_xxyzz*M_xxyz &
      + D_xxyzzz*M_xxyzz + D_xxz*M_xx + D_xxzz*M_xxz + D_xxzzz*M_xxzz + &
      D_xxzzzz*M_xxzzz + D_xyyyyz*M_xyyyy + D_xyyyz*M_xyyy + D_xyyyzz* &
      M_xyyyz + D_xyyz*M_xyy + D_xyyzz*M_xyyz + D_xyyzzz*M_xyyzz + &
      D_xyz*M_xy + D_xyzz*M_xyz + D_xyzzz*M_xyzz + D_xyzzzz*M_xyzzz + &
      D_xz*M_x + D_xzz*M_xz + D_xzzz*M_xzz + D_xzzzz*M_xzzz + D_xzzzzz* &
      M_xzzzz + D_yyyyyz*M_yyyyy + D_yyyyz*M_yyyy + D_yyyyzz*M_yyyyz + &
      D_yyyz*M_yyy + D_yyyzz*M_yyyz + D_yyyzzz*M_yyyzz + D_yyz*M_yy + &
      D_yyzz*M_yyz + D_yyzzz*M_yyzz + D_yyzzzz*M_yyzzz + D_yz*M_y + &
      D_yzz*M_yz + D_yzzz*M_yzz + D_yzzzz*M_yzzz + D_yzzzzz*M_yzzzz + &
      D_z*M_0 + D_zz*M_z + D_zzz*M_zz + D_zzzz*M_zzz + D_zzzzz*M_zzzz + &
      D_zzzzzz*M_zzzzz
    call unpack2(MOM_ES_L_LEN, L1,L2,L)
#undef  M_0                 
#undef  L_0                 
#undef  y                   
#undef  z                   
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
#undef  M_yyz               
#undef  L_xxxy              
#undef  M_yzz               
#undef  L_xxxz              
#undef  M_zzz               
#undef  L_xxyy              
#undef  M_xxxx              
#undef  L_xxyz              
#undef  L_xyyy              
#undef  M_xxxy              
#undef  M_xxxz              
#undef  L_xyyz              
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
#undef  L_yyyyy             
#undef  M_zzzz              
#undef  L_yyyyz             
#undef  M_xxxxx             
#undef  M_xxxxy             
#undef  L_xxxxxx            
#undef  L_xxxxxy            
#undef  M_xxxxz             
#undef  M_xxxyy             
#undef  L_xxxxxz            
#undef  M_xxxyz             
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxzz             
#undef  M_xxyyy             
#undef  L_xxxyyy            
#undef  M_xxyyz             
#undef  L_xxxyyz            
#undef  M_xxyzz             
#undef  L_xxyyyy            
#undef  M_xxzzz             
#undef  L_xxyyyz            
#undef  M_xyyyy             
#undef  L_xyyyyy            
#undef  L_xyyyyz            
#undef  M_xyyyz             
#undef  L_yyyyyy            
#undef  M_xyyzz             
#undef  L_yyyyyz            
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
