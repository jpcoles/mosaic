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
        
    
! OPS  134*ADD + 298*MUL + 41*NEG + 34*SUB = 507  (1687 before optimization)
subroutine mom_es_P2M(W, r, M)
    real(dp), intent(in)  :: W, r(1:3)
    real(dp), intent(out) :: M(0:MOM_ES_M_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v11, v12, v13,&
                v14, v15, v16, v17, v18, v19, v2, v20, v21, v22, v23, v24,&
                v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34, v35,&
                v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45, v46,&
                v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56, v57,&
                v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67, v68,&
                v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v8,&
                v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9, v90,&
                v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u
#define y                    r(2)
#define z                    r(3)
#define M_0                  M(0)
#define x                    r(1)
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
#define M_xxxxxxxx           M(61)
#define M_xxxxxxxy           M(62)
#define M_xxxxxxxz           M(63)
#define M_xxxxxxyy           M(64)
#define M_xxxxxxyz           M(65)
#define M_xxxxxyyy           M(66)
#define M_xxxxxyyz           M(67)
#define M_xxxxyyyy           M(68)
#define M_xxxxyyyz           M(69)
#define M_xxxyyyyy           M(70)
#define M_xxxyyyyz           M(71)
#define M_xxyyyyyy           M(72)
#define M_xxyyyyyz           M(73)
#define M_xyyyyyyy           M(74)
#define M_xyyyyyyz           M(75)
#define M_yyyyyyyy           M(76)
#define M_yyyyyyyz           M(77)
    v0         = W*x
    v1         = v0*y
    v2         = v0*z
    v3         = W*y
    v4         = v3*z
    v5         = v1*z
    v17        = W*z
    M_0        = W
    M_xy       = v1
    M_xz       = v2
    M_yz       = v4
    M_xyz      = v5
    c1         = z
    b1         = y
    a1         = x
    a2         = a1*a1
    v6         = a2
    v52        = 3.0d0*v6
    a3         = a1*a2
    a4         = a2*a2
    v19        = a4
    a5         = a2*a3
    a6         = a3*a3
    v38        = a6
    a7         = a3*a4
    a8         = a4*a4
    a9         = a4*a5
    b2         = b1*b1
    v7         = b2
    v97        = v6 + v7
    v8         = v97
    v25        = v6*v7
    v46        = v19*v7
    v48        = 2.0d0*v6 + v7
    v49        = v6 + 6.0d0*v7
    v53        = 3.0d0*v7
    v54        = v53 + v6
    v57        = v6 + 2.0d0*v7
    v58        = 6.0d0*v6 + v7
    v60        = v52 + v7
    b3         = b1*b2
    b4         = b2*b2
    v29        = b4
    v56        = v29*v6
    b5         = b2*b3
    b6         = b3*b3
    v62        = b6
    b7         = b3*b4
    b8         = b4*b4
    b9         = b4*b5
    c2         = c1*c1
    h          = c2 + v8
    v98        = h*v6
    v99        = h*v7
    v9         = 0.333333333333333d0*h
    v10        = -v9
    v11        = v10 + v6
    v12        = v10 + v7
    v13        = -0.6d0*h
    v14        = 0.2d0*h
    v15        = -v14
    v16        = v15 + v6
    v18        = v15 + v7
    v20        = h*h
    v21        = 0.0857142857142857d0*v20
    v22        = v98
    v23        = -0.428571428571429d0*h
    v24        = v23 + v6
    v26        = 0.142857142857143d0*h
    v27        = -v26
    v28        = v23 + v7
    v30        = v99
    v31        = 0.238095238095238d0*v20
    v32        = 0.0476190476190476d0*v20
    v33        = 0.666666666666667d0*v22
    v34        = -v33 + v19 + v32
    v35        = v25 + v32
    v100       = -v35
    v36        = h*v8
    v37        = 0.333333333333333d0*(-2.0d0*v30) + v29 + v32
    v39        = h*h*h
    v40        = -0.0216450216450216d0*v39
    v41        = h*v19
    v42        = v20*v6
    v43        = 0.151515151515152d0*v20
    v44        = 0.0909090909090909d0*(-10.0d0*v22) + v19 + v43
    v45        = -0.00432900432900433d0*v39
    v47        = 0.0303030303030303d0*v20
    v50        = v49*v98
    v51        = 0.0909090909090909d0*h
    v55        = v25 + v47
    v101       = -v55
    v59        = v58*v99
    v61        = 0.0909090909090909d0*(-10.0d0*v30) + v29 + v43
    v63        = h*v29
    v64        = v20*v7
    v65        = -0.0815850815850816d0*v39
    v66        = -0.0116550116550117d0*v39
    v67        = v38 + v66 + 0.00699300699300699d0*(-165.0d0*v41 + 45.0d0*v42)
    v68        = 0.104895104895105d0*v20
    v69        = -0.00699300699300699d0*v39
    v70        = v7*v98
    v71        = v69 + 0.0769230769230769d0*(-6.0d0*v70)
    v72        = 0.020979020979021d0*v64
    v102       = v46 + v72
    v73        = -0.00233100233100233d0*v39
    v74        = 0.020979020979021d0*v42
    v103       = v56 + v74
    v75        = v62 + v66 + 0.00699300699300699d0*(-165.0d0*v63 + 45.0d0*v64)
    v76        = h*h*h*h
    v77        = 0.00543900543900544d0*v76
    v78        = h*v38
    v79        = 1.07692307692308d0*v20
    v80        = v39*v6
    v81        = -0.048951048951049d0*v39
    v82        = v38 + v81 + 0.0153846153846154d0*(-91.0d0*v41 + 35.0d0*v42)
    v83        = 0.000777000777000777d0*v76
    v104       = -v83
    v84        = 143.0d0*v39
    v85        = 0.0769230769230769d0*v42
    v86        = -v84
    v87        = -v33*v7
    v88        = 0.00699300699300699d0*(-3.0d0*v39) + v87
    v89        = 0.0769230769230769d0*v20
    v90        = v69 + v87
    v91        = 0.0769230769230769d0*v64
    v92        = 0.0153846153846154d0*v20
    v93        = -0.0041958041958042d0*v39
    v94        = h*v62
    v95        = v39*v7
    v96        = v62 + v81 + 0.0153846153846154d0*(-91.0d0*v63 + 35.0d0*v64)
    M_xx       = W*v11
    M_yy       = W*v12
    M_xxx      = v0*(v13 + v6)
    M_xxy      = v16*v3
    M_xxz      = v16*v17
    M_xyy      = v0*v18
    M_yyy      = v3*(v13 + v7)
    M_yyz      = v17*v18
    M_xxxx     = W*(0.142857142857143d0*(-6.0d0*v22) + v19 + v21)
    M_xxxy     = v1*v24
    M_xxxz     = v2*v24
    M_xxyy     = W*(0.0285714285714286d0*v20 + v25 - v26*v8)
    M_xxyz     = v4*(v27 + v6)
    M_xyyy     = v1*v28
    M_xyyz     = v2*(v27 + v7)
    M_yyyy     = W*(0.142857142857143d0*(-6.0d0*v30) + v21 + v29)
    M_yyyz     = v28*v4
    M_xxxxx    = v0*(0.111111111111111d0*(-10.0d0*v22) + v19 + v31)
    M_xxxxy    = v3*v34
    M_xxxxz    = v17*v34
    M_xxxyy    = -v0*(0.111111111111111d0*v22 + v100 + v7*v9)
    M_xxxyz    = v11*v5
    M_xxyyy    = -v3*(0.111111111111111d0*v30 + v100 + v6*v9)
    M_xxyyz    = v17*(v25 + 0.0158730158730159d0*(v20 - 7.0d0*v36))
    M_xyyyy    = v0*v37
    M_xyyyz    = v12*v5
    M_yyyyy    = v3*(0.111111111111111d0*(-10.0d0*v30) + v29 + v31)
    M_yyyyz    = v17*v37
    M_xxxxxx   = W*(v38 + v40 + 0.0909090909090909d0*(-15.0d0*v41 + 5.0d0*v42))
    M_xxxxxy   = v1*v44
    M_xxxxxz   = v2*v44
    M_xxxxyy   = W*(0.0909090909090909d0*(-v50) + v45 + v46 + v47*v48)
    M_xxxxyz   = v4*(0.0909090909090909d0*(-6.0d0*v22) + v19 + v47)
    M_xxxyyy   = v1*(v25 - v51*(-h + v52 + v53))
    M_xxxyyz   = -v2*(v101 + v51*v54)
    M_xxyyyy   = W*(0.0909090909090909d0*(-v59) + v45 + v47*v57 + v56)
    M_xxyyyz   = -v4*(v101 + v51*v60)
    M_xyyyyy   = v1*v61
    M_xyyyyz   = v2*(0.0909090909090909d0*(-6.0d0*v30) + v29 + v47)
    M_yyyyyy   = W*(v40 + v62 + 0.0909090909090909d0*(-15.0d0*v63 + 5.0d0*v64))
    M_yyyyyz   = v4*v61
    M_xxxxxxx  = v0*(v38 + v65 + 0.00699300699300699d0*(-231.0d0*v41 + 105.0d0*v42))
    M_xxxxxxy  = v3*v67
    M_xxxxxxz  = v17*v67
    M_xxxxxyy  = v0*(0.00699300699300699d0*(-11.0d0*v22*(v6 + 10.0d0*v7) + 10.0d0*v42) + &
      v46 + v66 + v68*v7)
    M_xxxxxyz  = v5*(0.0769230769230769d0*(-10.0d0*v22) + v19 + v68)
    M_xxxxyyy  = v3*(v102 + v71 + 0.00699300699300699d0*(-33.0d0*v41 + 18.0d0*v42))
    M_xxxxyyz  = v17*(v102 + v73 + 0.00699300699300699d0*(6.0d0*v42 - 11.0d0*v50))
    M_xxxyyyy  = v0*(v103 + v71 + 0.00699300699300699d0*(-33.0d0*v63 + 18.0d0*v64))
    M_xxxyyyz  = v5*(v25 + 0.00699300699300699d0*(9.0d0*v20 - 33.0d0*v36))
    M_xxyyyyy  = v3*(0.00699300699300699d0*(-11.0d0*v30*(10.0d0*v6 + v7) + 10.0d0*v64) + &
      v56 + v6*v68 + v66)
    M_xxyyyyz  = v17*(v103 + v73 + 0.00699300699300699d0*(-11.0d0*v59 + 6.0d0*v64))
    M_xyyyyyy  = v0*v75
    M_xyyyyyz  = v5*(0.0769230769230769d0*(-10.0d0*v30) + v29 + v68)
    M_yyyyyyy  = v3*(v62 + v65 + 0.00699300699300699d0*(-231.0d0*v63 + 105.0d0*v64))
    M_yyyyyyz  = v17*v75
    M_xxxxxxxx = W*(0.000466200466200466d0*(-4004.0d0*v78 - 420.0d0*v80) + a8 + v19*v79 + &
      v77)
    M_xxxxxxxy = v1*v82
    M_xxxxxxxz = v2*v82
    M_xxxxxxyy = -W*(v104 + v41*v7 + v7*v84 + 15.0d0*v78 + 429.0d0*v80 - (v38*v7 + v54* &
      v85))
    M_xxxxxxyz = v4*(0.0769230769230769d0*(3.0d0*v42) + v38 - v41 + v86)
    M_xxxxxyyy = v1*(v46 + v88 - v14*v19 + v48*v89)
    M_xxxxxyyz = v2*(0.00512820512820513d0*(-13.0d0*v41 + 10.0d0*v42) + v46 + v90 + v91)
    M_xxxxyyyy = W*(v19*v29 + v92*(v19 + 12.0d0*v25 + v29) + 0.000466200466200466d0*( &
      -18.0d0*v39*v8 - 858.0d0*v70*v97 + v76))
    M_xxxxyyyz = v4*(v46 + v93 - v14*v57*v6 + v58*v92)
    M_xxxyyyyy = v1*(v56 + v88 - v14*v29 + v57*v89)
    M_xxxyyyyz = v2*(v56 + v93 - v14*v48*v7 + v49*v92)
    M_xxyyyyyy = -W*(v104 + v6*v63 + v6*v84 + 15.0d0*v94 + 429.0d0*v95 - (v6*v62 + v60* &
      v91))
    M_xxyyyyyz = v4*(0.00512820512820513d0*(-13.0d0*v63 + 10.0d0*v64) + v56 + v85 + v90)
    M_xyyyyyyy = v1*v96
    M_xyyyyyyz = v2*(0.0769230769230769d0*(3.0d0*v64) + v62 - v63 + v86)
    M_yyyyyyyy = W*(0.000466200466200466d0*(-4004.0d0*v94 - 420.0d0*v95) + b8 + v29*v79 + &
      v77)
    M_yyyyyyyz = v4*v96
#undef  y                   
#undef  z                   
#undef  M_0                 
#undef  x                   
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
#undef  M_xxxxxxxx          
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  M_xxxxxxyy          
#undef  M_xxxxxxyz          
#undef  M_xxxxxyyy          
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  M_xxxxyyyz          
#undef  M_xxxyyyyy          
#undef  M_xxxyyyyz          
#undef  M_xxyyyyyy          
#undef  M_xxyyyyyz          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
    end subroutine mom_es_P2M
    
! OPS  4393*ADD + 4257*MUL + 175*NEG + 1378*SUB = 10203  (20264 before optimization)
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
                v1143, v1144, v1145, v1146, v1147, v1148, v1149, v115, v1150,&
                v1151, v1152, v1153, v1154, v1155, v1156, v1157, v1158, v1159,&
                v116, v1160, v1161, v1162, v1163, v1164, v1165, v1166, v1167,&
                v1168, v1169, v117, v1170, v1171, v1172, v1173, v1174, v1175,&
                v1176, v1177, v1178, v1179, v118, v1180, v1181, v1182, v1183,&
                v1184, v1185, v1186, v1187, v1188, v1189, v119, v1190, v1191,&
                v1192, v1193, v1194, v1195, v1196, v1197, v1198, v1199, v12,&
                v120, v1200, v1201, v1202, v1203, v1204, v1205, v1206, v1207,&
                v1208, v1209, v121, v1210, v1211, v1212, v1213, v1214, v1215,&
                v1216, v1217, v1218, v1219, v122, v1220, v1221, v1222, v1223,&
                v1224, v1225, v1226, v1227, v1228, v1229, v123, v1230, v1231,&
                v1232, v1233, v1234, v1235, v1236, v1237, v1238, v1239, v124,&
                v1240, v1241, v1242, v1243, v1244, v1245, v1246, v1247, v1248,&
                v1249, v125, v1250, v1251, v1252, v1253, v1254, v1255, v1256,&
                v1257, v1258, v1259, v126, v1260, v1261, v1262, v1263, v1264,&
                v1265, v1266, v1267, v1268, v1269, v127, v1270, v1271, v1272,&
                v1273, v1274, v1275, v1276, v1277, v1278, v1279, v128, v1280,&
                v1281, v1282, v1283, v1284, v1285, v1286, v1287, v1288, v1289,&
                v129, v1290, v1291, v1292, v1293, v1294, v1295, v1296, v1297,&
                v1298, v1299, v13, v130, v1300, v1301, v1302, v1303, v1304,&
                v1305, v1306, v1307, v1308, v1309, v131, v1310, v1311, v1312,&
                v1313, v1314, v1315, v1316, v1317, v1318, v1319, v132, v1320,&
                v1321, v1322, v1323, v1324, v1325, v1326, v1327, v1328, v1329,&
                v133, v1330, v1331, v1332, v1333, v1334, v1335, v1336, v1337,&
                v1338, v1339, v134, v1340, v1341, v1342, v1343, v1344, v1345,&
                v1346, v1347, v1348, v1349, v135, v1350, v1351, v1352, v1353,&
                v1354, v1355, v1356, v1357, v1358, v1359, v136, v1360, v1361,&
                v1362, v1363, v1364, v1365, v1366, v1367, v1368, v1369, v137,&
                v1370, v1371, v1372, v1373, v1374, v1375, v1376, v1377, v1378,&
                v1379, v138, v1380, v1381, v1382, v1383, v1384, v1385, v1386,&
                v1387, v1388, v1389, v139, v1390, v1391, v1392, v1393, v1394,&
                v1395, v1396, v1397, v1398, v1399, v14, v140, v1400, v1401,&
                v1402, v1403, v1404, v1405, v1406, v1407, v1408, v1409, v141,&
                v1410, v1411, v1412, v1413, v1414, v1415, v1416, v1417, v1418,&
                v1419, v142, v1420, v1421, v1422, v1423, v1424, v1425, v1426,&
                v1427, v1428, v1429, v143, v1430, v1431, v1432, v1433, v1434,&
                v1435, v1436, v1437, v1438, v1439, v144, v1440, v1441, v1442,&
                v1443, v1444, v1445, v1446, v1447, v1448, v1449, v145, v1450,&
                v1451, v1452, v1453, v1454, v1455, v1456, v1457, v1458, v1459,&
                v146, v1460, v1461, v1462, v1463, v1464, v1465, v1466, v1467,&
                v1468, v1469, v147, v1470, v1471, v1472, v1473, v1474, v1475,&
                v1476, v1477, v1478, v1479, v148, v1480, v1481, v1482, v1483,&
                v1484, v1485, v1486, v1487, v1488, v1489, v149, v1490, v1491,&
                v1492, v1493, v1494, v1495, v1496, v1497, v1498, v1499, v15,&
                v150, v1500, v1501, v1502, v1503, v1504, v1505, v1506, v1507,&
                v1508, v1509, v151, v1510, v1511, v1512, v1513, v1514, v1515,&
                v1516, v1517, v1518, v1519, v152, v1520, v1521, v1522, v1523,&
                v1524, v1525, v1526, v1527, v1528, v1529, v153, v1530, v1531,&
                v1532, v1533, v1534, v1535, v1536, v1537, v1538, v1539, v154,&
                v1540, v1541, v1542, v1543, v1544, v1545, v1546, v1547, v1548,&
                v1549, v155, v1550, v1551, v1552, v1553, v1554, v1555, v1556,&
                v1557, v1558, v1559, v156, v1560, v1561, v1562, v1563, v1564,&
                v1565, v1566, v1567, v1568, v1569, v157, v1570, v1571, v1572,&
                v1573, v1574, v1575, v1576, v1577, v1578, v1579, v158, v1580,&
                v1581, v1582, v1583, v1584, v1585, v1586, v1587, v1588, v1589,&
                v159, v1590, v1591, v1592, v1593, v1594, v1595, v1596, v1597,&
                v1598, v1599, v16, v160, v1600, v1601, v1602, v1603, v1604,&
                v1605, v1606, v1607, v1608, v1609, v161, v1610, v1611, v1612,&
                v1613, v1614, v1615, v1616, v1617, v1618, v1619, v162, v1620,&
                v1621, v1622, v1623, v1624, v1625, v1626, v1627, v1628, v1629,&
                v163, v1630, v1631, v1632, v1633, v1634, v1635, v1636, v164,&
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
                M_yzzzzzz, M_zzzzzzz, M_xxxxxxzz, M_xxxxxyzz, M_xxxxxzzz,&
                M_xxxxyyzz, M_xxxxyzzz, M_xxxxzzzz, M_xxxyyyzz, M_xxxyyzzz,&
                M_xxxyzzzz, M_xxxzzzzz, M_xxyyyyzz, M_xxyyyzzz, M_xxyyzzzz,&
                M_xxyzzzzz, M_xxzzzzzz, M_xyyyyyzz, M_xyyyyzzz, M_xyyyzzzz,&
                M_xyyzzzzz, M_xyzzzzzz, M_xzzzzzzz, M_yyyyyyzz, M_yyyyyzzz,&
                M_yyyyzzzz, M_yyyzzzzz, M_yyzzzzzz, M_yzzzzzzz, M_zzzzzzzz,&
                S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz, S_zz, S_xxx,&
                S_xxy, S_xxz, S_xyy, S_xyz, S_xzz, S_yyy, S_yyz, S_yzz, S_zzz,&
                S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz, S_xxzz, S_xyyy,&
                S_xyyz, S_xyzz, S_xzzz, S_yyyy, S_yyyz, S_yyzz, S_yzzz,&
                S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz,&
                S_xxyyy, S_xxyyz, S_xxyzz, S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz,&
                S_xyzzz, S_xzzzz, S_yyyyy, S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz,&
                S_zzzzz, S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz,&
                S_xxxxzz, S_xxxyyy, S_xxxyyz, S_xxxyzz, S_xxxzzz, S_xxyyyy,&
                S_xxyyyz, S_xxyyzz, S_xxyzzz, S_xxzzzz, S_xyyyyy, S_xyyyyz,&
                S_xyyyzz, S_xyyzzz, S_xyzzzz, S_xzzzzz, S_yyyyyy, S_yyyyyz,&
                S_yyyyzz, S_yyyzzz, S_yyzzzz, S_yzzzzz, S_zzzzzz, S_xxxxxxx,&
                S_xxxxxxy, S_xxxxxxz, S_xxxxxyy, S_xxxxxyz, S_xxxxyyy,&
                S_xxxxyyz, S_xxxyyyy, S_xxxyyyz, S_xxyyyyy, S_xxyyyyz,&
                S_xyyyyyy, S_xyyyyyz, S_yyyyyyy, S_yyyyyyz, S_xxxxxxxx,&
                S_xxxxxxxy, S_xxxxxxxz, S_xxxxxxyy, S_xxxxxxyz, S_xxxxxyyy,&
                S_xxxxxyyz, S_xxxxyyyy, S_xxxxyyyz, S_xxxyyyyy, S_xxxyyyyz,&
                S_xxyyyyyy, S_xxyyyyyz, S_xyyyyyyy, S_xyyyyyyz, S_yyyyyyyy,&
                S_yyyyyyyz
#define M_0                  M(0)
#define Ms_0                 Ms(0)
#define z                    r(3)
#define y                    r(2)
#define x                    r(1)
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
#define M_xyy                M(9)
#define Ms_xyy               Ms(9)
#define M_xyz                M(10)
#define Ms_xyz               Ms(10)
#define Ms_yyy               Ms(11)
#define M_yyy                M(11)
#define M_yyz                M(12)
#define Ms_yyz               Ms(12)
#define Ms_xxxx              Ms(13)
#define M_xxxx               M(13)
#define Ms_xxxy              Ms(14)
#define M_xxxy               M(14)
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
#define Ms_yyyy              Ms(20)
#define M_yyyy               M(20)
#define Ms_yyyz              Ms(21)
#define M_yyyz               M(21)
#define Ms_xxxxx             Ms(22)
#define M_xxxxx              M(22)
#define Ms_xxxxy             Ms(23)
#define M_xxxxy              M(23)
#define Ms_xxxxz             Ms(24)
#define M_xxxxz              M(24)
#define M_xxxyy              M(25)
#define Ms_xxxyy             Ms(25)
#define Ms_xxxyz             Ms(26)
#define M_xxxyz              M(26)
#define M_xxyyy              M(27)
#define Ms_xxyyy             Ms(27)
#define M_xxyyz              M(28)
#define Ms_xxyyz             Ms(28)
#define Ms_xyyyy             Ms(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define Ms_xyyyz             Ms(30)
#define Ms_yyyyy             Ms(31)
#define M_yyyyy              M(31)
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
#define Ms_xxyyyz            Ms(41)
#define M_xxyyyz             M(41)
#define M_xyyyyy             M(42)
#define Ms_xyyyyy            Ms(42)
#define Ms_xyyyyz            Ms(43)
#define M_xyyyyz             M(43)
#define Ms_yyyyyy            Ms(44)
#define M_yyyyyy             M(44)
#define M_yyyyyz             M(45)
#define Ms_yyyyyz            Ms(45)
#define M_xxxxxxx            M(46)
#define Ms_xxxxxxx           Ms(46)
#define Ms_xxxxxxy           Ms(47)
#define M_xxxxxxy            M(47)
#define M_xxxxxxz            M(48)
#define Ms_xxxxxxz           Ms(48)
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
#define M_xxyyyyz            M(56)
#define Ms_xxyyyyz           Ms(56)
#define M_xyyyyyy            M(57)
#define Ms_xyyyyyy           Ms(57)
#define M_xyyyyyz            M(58)
#define Ms_xyyyyyz           Ms(58)
#define M_yyyyyyy            M(59)
#define Ms_yyyyyyy           Ms(59)
#define Ms_yyyyyyz           Ms(60)
#define M_yyyyyyz            M(60)
#define M_xxxxxxxx           M(61)
#define Ms_xxxxxxxx          Ms(61)
#define M_xxxxxxxy           M(62)
#define Ms_xxxxxxxy          Ms(62)
#define Ms_xxxxxxxz          Ms(63)
#define M_xxxxxxxz           M(63)
#define Ms_xxxxxxyy          Ms(64)
#define M_xxxxxxyy           M(64)
#define M_xxxxxxyz           M(65)
#define Ms_xxxxxxyz          Ms(65)
#define M_xxxxxyyy           M(66)
#define Ms_xxxxxyyy          Ms(66)
#define Ms_xxxxxyyz          Ms(67)
#define M_xxxxxyyz           M(67)
#define M_xxxxyyyy           M(68)
#define Ms_xxxxyyyy          Ms(68)
#define Ms_xxxxyyyz          Ms(69)
#define M_xxxxyyyz           M(69)
#define M_xxxyyyyy           M(70)
#define Ms_xxxyyyyy          Ms(70)
#define M_xxxyyyyz           M(71)
#define Ms_xxxyyyyz          Ms(71)
#define M_xxyyyyyy           M(72)
#define Ms_xxyyyyyy          Ms(72)
#define M_xxyyyyyz           M(73)
#define Ms_xxyyyyyz          Ms(73)
#define M_xyyyyyyy           M(74)
#define Ms_xyyyyyyy          Ms(74)
#define M_xyyyyyyz           M(75)
#define Ms_xyyyyyyz          Ms(75)
#define Ms_yyyyyyyy          Ms(76)
#define M_yyyyyyyy           M(76)
#define Ms_yyyyyyyz          Ms(77)
#define M_yyyyyyyz           M(77)
    v6          = x*y
    v7          = x*z
    v8          = y*z
    v9          = v6*z
    v17         = M_xx*x
    v18         = M_xy*y
    v19         = M_xz*z
    v23         = M_xy*x
    v24         = M_yy*y
    v25         = M_yz*z
    v26         = M_xx*z
    v27         = M_xz*x
    v28         = M_yy*z
    v29         = M_yz*y
    v40         = M_xxx*x
    v41         = 1.71428571428571d0*y
    v42         = M_xxy*v41
    v43         = M_xxz*z
    v49         = 0.857142857142857d0*M_xyz
    v52         = M_xxy*x
    v55         = M_xyy*y
    v57         = 3.0d0*M_xx
    v58         = M_xxx*z
    v59         = M_xxz*x
    v61         = M_xyy*z
    v62         = 3.0d0*M_xz
    v68         = 1.71428571428571d0*x
    v69         = M_xyy*v68
    v70         = M_yyy*y
    v71         = M_yyz*z
    v74         = M_xxy*z
    v77         = M_yyy*z
    v78         = M_yyz*y
    v84         = 3.0d0*M_yz
    v90         = M_xxxx*x
    v91         = M_xxxy*y
    v92         = M_xxxz*z
    v94         = M_xxyy*x
    v104        = M_yyyy*x
    v116        = M_xxxx*y
    v117        = M_xxxy*x
    v120        = M_xxyy*y
    v121        = M_xxyz*z
    v132        = M_yyyy*y
    v136        = M_xxyy*z
    v145        = M_xxxx*z
    v146        = M_xxxz*x
    v148        = M_xxyz*y
    v157        = M_yyyy*z
    v165        = M_xyyy*y
    v166        = M_xyyz*z
    v171        = M_xxxy*z
    v173        = M_xxyz*x
    v177        = M_xyyy*z
    v178        = M_xyyz*y
    v179        = 3.0d0*M_xyz
    v185        = M_xyyy*x
    v186        = M_yyyz*z
    v187        = M_xyyz*x
    v188        = M_yyyz*y
    v195        = M_xxyyz*z
    v197        = 0.12987012987013d0*z
    v210        = M_xxxxx*x
    v211        = M_xxxxy*y
    v212        = M_xxxxz*z
    v214        = M_xxxyy*x
    v221        = M_xxyyy*y
    v230        = M_xyyyy*x
    v242        = M_yyyyy*y
    v269        = M_xxxxx*y
    v270        = M_xxxxy*x
    v273        = M_xxxyy*y
    v274        = 1.81818181818182d0*M_xxxyz
    v277        = M_xxyyy*x
    v285        = M_xyyyy*y
    v294        = M_yyyyy*x
    v300        = 10.0d0*M_xxx
    v303        = M_xxxxx*z
    v304        = M_xxxxz*x
    v306        = M_xxxyy*z
    v307        = v274*y
    v314        = M_xxyyz*x
    v324        = M_xyyyy*z
    v328        = 5.45454545454545d0*M_xyz
    v340        = M_yyyyz*x
    v362        = 0.025974025974026d0*z
    v376        = M_xxxxy*z
    v377        = M_xxxxz*y
    v379        = M_xxxyz*x
    v384        = M_xxyyy*z
    v385        = M_xxyyz*y
    v401        = M_yyyyy*z
    v402        = M_yyyyz*y
    v411        = 0.545454545454545d0*z
    v417        = M_xyyyz*y
    v422        = M_yyyyz*z
    v424        = 1.81818181818182d0*M_xyyyz
    v425        = v424*x
    v447        = M_xxxxxx*x
    v448        = M_xxxxxy*y
    v449        = M_xxxxxz*z
    v451        = M_xxxxyy*x
    v458        = M_xxxyyy*y
    v459        = M_xxxyyz*z
    v495        = M_xyyyyy*y
    v496        = M_xyyyyz*z
    v519        = M_yyyyyy*x
    v555        = M_xxxxxx*y
    v556        = M_xxxxxy*x
    v559        = M_xxxxyy*y
    v560        = M_xxxxyz*z
    v566        = M_xxxyyy*x
    v580        = M_xxyyyz*z
    v600        = M_xyyyyy*x
    v621        = M_yyyyyy*y
    v622        = M_yyyyyz*z
    v653        = M_xxxxxx*z
    v654        = M_xxxxxz*x
    v656        = M_xxxxyy*z
    v657        = 0.559440559440559d0*v656
    v658        = M_xxxxyz*y
    v664        = M_xxxyyz*x
    v675        = M_xxyyyy*z
    v676        = M_xxyyyz*y
    v699        = M_xyyyyz*x
    v720        = M_yyyyyy*z
    v754        = M_xxyyyy*x
    v764        = M_xxxyyy*z
    v799        = M_xxxxxy*z
    v800        = M_xxxxxz*y
    v802        = M_xxxxyz*x
    v806        = M_xxxyyz*y
    v813        = M_xxyyyz*x
    v822        = M_xyyyyy*z
    v823        = M_xyyyyz*y
    v835        = M_yyyyyz*x
    v852        = M_xxyyyy*y
    v858        = 0.0163170163170163d0*z
    v860        = 0.909090909090909d0*M_xxxxyyz
    v866        = 0.559440559440559d0*v675
    v875        = 0.909090909090909d0*M_xxyyyyz
    v877        = M_yyyyyz*y
    v934        = M_xxxxxxx*x
    v935        = M_xxxxxxy*y
    v936        = M_xxxxxxz*z
    v938        = M_xxxxxyy*x
    v945        = M_xxxxyyy*y
    v946        = M_xxxxyyz*z
    v956        = M_xxxyyyy*x
    v977        = M_xxyyyyy*y
    v978        = M_xxyyyyz*z
    v1013       = M_xyyyyyy*x
    v1047       = M_yyyyyyy*y
    v1048       = M_yyyyyyz*z
    v1080       = M_xxxyyyz*z
    v1127       = M_xxxxxxx*y
    v1128       = M_xxxxxxy*x
    v1131       = M_xxxxxyy*y
    v1132       = M_xxxxxyz*z
    v1138       = M_xxxxyyy*x
    v1152       = M_xxxyyyy*y
    v1200       = M_xyyyyyy*y
    v1201       = M_xyyyyyz*z
    v1231       = M_yyyyyyy*x
    v1246       = 1.02797202797203d0*x
    v1262       = M_xxxxxxx*z
    v1263       = M_xxxxxxz*x
    v1265       = M_xxxxxyy*z
    v1266       = M_xxxxxyz*y
    v1272       = M_xxxxyyz*x
    v1283       = M_xxxyyyy*z
    v1284       = M_xxxyyyz*y
    v1342       = M_xyyyyyy*z
    v1343       = M_xyyyyyz*y
    v1386       = M_yyyyyyz*x
    v1448       = M_xxxxxxy*z
    v1449       = M_xxxxxxz*y
    v1451       = M_xxxxxyz*x
    v1456       = M_xxxxyyy*z
    v1457       = M_xxxxyyz*y
    v1469       = M_xxxyyyz*x
    v1489       = M_xxyyyyy*z
    v1490       = M_xxyyyyz*y
    v1523       = M_xyyyyyz*x
    v1556       = M_yyyyyyy*z
    v1557       = M_yyyyyyz*y
    v1594       = M_xxyyyyy*x
    v1599       = M_xxyyyyz*x
    v1614       = 1.02797202797203d0*y
    Ms_0        = M_0
    M_zz        = -(M_xx + M_yy)
    M_xzz       = -(M_xxx + M_xyy)
    M_yzz       = -(M_xxy + M_yyy)
    M_zzz       = -(M_xxz + M_yyz)
    M_xxzz      = -(M_xxxx + M_xxyy)
    v96         = M_xxzz*x
    v110        = M_xxzz*y
    v137        = M_xxzz*z
    M_xyzz      = -(M_xxxy + M_xyyy)
    M_xzzz      = -(M_xxxz + M_xyyz)
    M_yyzz      = -(M_xxyy + M_yyyy)
    v105        = M_yyzz*x
    v111        = M_yyzz*y
    v140        = M_yyzz*z
    M_yzzz      = -(M_xxyz + M_yyyz)
    M_zzzz      = -(M_xxzz + M_yyzz)
    M_xxxzz     = -(M_xxxxx + M_xxxyy)
    v216        = M_xxxzz*x
    v251        = M_xxxzz*y
    v310        = M_xxxzz*z
    M_xxyzz     = -(M_xxxxy + M_xxyyy)
    v223        = M_xxyzz*y
    v254        = M_xxyzz*x
    v363        = M_xxyzz*z
    M_xxzzz     = -(M_xxxxz + M_xxyyz)
    v319        = M_xxzzz*x
    v365        = M_xxzzz*y
    M_xyyzz     = -(M_xxxyy + M_xyyyy)
    v1616       = M_xxxzz + M_xyyzz
    v163        = -0.0476190476190476d0*(M_xxxxx + v105 + v1616 + v96)
    v231        = M_xyyzz*x
    v260        = M_xyyzz*y
    v327        = M_xyyzz*z
    M_xyzzz     = -(M_xxxyz + M_xyyyz)
    M_xzzzz     = -v1616
    M_yyyzz     = -(M_xxyyy + M_yyyyy)
    v1617       = M_xxyzz + M_yyyzz
    v112        = -0.0476190476190476d0*(M_yyyyy + v110 + v111 + v1617)
    v243        = M_yyyzz*y
    v262        = M_yyyzz*x
    v366        = M_yyyzz*z
    M_yyzzz     = -(M_xxyyz + M_yyyyz)
    v0          = M_xxzzz + M_yyzzz
    v344        = M_yyzzz*x
    v368        = M_yyzzz*y
    M_yzzzz     = -v1617
    M_zzzzz     = -v0
    M_xxxxzz    = -(M_xxxxxx + M_xxxxyy)
    v453        = M_xxxxzz*x
    v562        = M_xxxxzz*y
    v661        = M_xxxxzz*z
    v864        = 0.174825174825175d0*v661
    M_xxxyzz    = -(M_xxxxxy + M_xxxyyy)
    v461        = M_xxxyzz*y
    v568        = M_xxxyzz*x
    v766        = M_xxxyzz*z
    M_xxxzzz    = -(M_xxxxxz + M_xxxyyz)
    v466        = M_xxxzzz*z
    v669        = M_xxxzzz*x
    v768        = M_xxxzzz*y
    M_xxyyzz    = -(M_xxxxyy + M_xxyyyy)
    v532        = M_xxyyzz*y
    v679        = M_xxyyzz*z
    v680        = -1.22377622377622d0*v679
    v750        = M_xxyyzz*x
    M_xxyzzz    = -(M_xxxxyz + M_xxyyyz)
    v533        = M_xxyzzz*z
    v772        = M_xxyzzz*x
    v876        = M_xxyzzz*y
    M_xxzzzz    = -(M_xxxxzz + M_xxyyzz)
    v480        = M_xxzzzz*x
    v535        = M_xxzzzz*y
    M_xyyyzz    = -(M_xxxyyy + M_xyyyyy)
    v497        = M_xyyyzz*y
    v601        = M_xyyyzz*x
    v779        = M_xyyyzz*z
    M_xyyzzz    = -(M_xxxyyz + M_xyyyyz)
    v1618       = M_xxxzzz + M_xyyzzz
    v1          = v1618
    v502        = M_xyyzzz*z
    v703        = M_xyyzzz*x
    v781        = M_xyyzzz*y
    v879        = x*(M_xxxxxz + v1)
    M_xyzzzz    = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz    = -v1
    M_yyyyzz    = -(M_xxyyyy + M_yyyyyy)
    v521        = M_yyyyzz*x
    v722        = M_yyyyzz*z
    v723        = 0.174825174825175d0*v722
    v874        = M_yyyyzz*y
    M_yyyzzz    = -(M_xxyyyz + M_yyyyyz)
    v1619       = M_xxyzzz + M_yyyzzz
    v2          = v1619
    v536        = M_yyyzzz*z
    v745        = y*(M_yyyyyz + v2)
    v789        = M_yyyzzz*x
    v878        = M_yyyzzz*y
    M_yyzzzz    = -(M_xxyyzz + M_yyyyzz)
    v1620       = M_xxzzzz + M_yyzzzz
    v3          = v1620
    v528        = M_yyzzzz*x
    v538        = M_yyzzzz*y
    v744        = 0.0815850815850816d0*v3*z
    M_yzzzzz    = -v2
    M_zzzzzz    = -v3
    M_xxxxxzz   = -(M_xxxxxxx + M_xxxxxyy)
    v752        = 0.034965034965035d0*M_xxxxxzz
    v940        = M_xxxxxzz*x
    v1134       = M_xxxxxzz*y
    v1269       = M_xxxxxzz*z
    M_xxxxyzz   = -(M_xxxxxxy + M_xxxxyyy)
    v542        = 0.27972027972028d0*M_xxxxyzz
    v888        = M_xxxxyzz*y
    v1140       = M_xxxxyzz*x
    v1460       = M_xxxxyzz*z
    M_xxxxzzz   = -(M_xxxxxxz + M_xxxxyyz)
    v861        = 0.034965034965035d0*M_xxxxzzz
    v952        = M_xxxxzzz*z
    v1277       = M_xxxxzzz*x
    v1464       = M_xxxxzzz*y
    M_xxxyyzz   = -(M_xxxxxyy + M_xxxyyyy)
    v432        = -0.244755244755245d0*M_xxxyyzz
    v753        = -0.104895104895105d0*M_xxxyyzz
    v958        = M_xxxyyzz*x
    v1154       = M_xxxyyzz*y
    v1287       = M_xxxyyzz*z
    M_xxxyzzz   = -(M_xxxxxyz + M_xxxyyyz)
    v1081       = M_xxxyzzz*z
    v1291       = M_xxxyzzz*y
    v1474       = M_xxxyzzz*x
    M_xxxzzzz   = -(M_xxxxxzz + M_xxxyyzz)
    v965        = M_xxxzzzz*x
    v1084       = M_xxxzzzz*y
    v1301       = M_xxxzzzz*z
    M_xxyyyzz   = -(M_xxxxyyy + M_xxyyyyy)
    v543        = -0.244755244755245d0*M_xxyyyzz
    v849        = -0.104895104895105d0*M_xxyyyzz
    v980        = M_xxyyyzz*y
    v1493       = M_xxyyyzz*z
    v1595       = M_xxyyyzz*x
    M_xxyyzzz   = -(M_xxxxyyz + M_xxyyyyz)
    v639        = -0.244755244755245d0*M_xxyyzzz
    v895        = M_xxyyzzz*z
    v1426       = M_xxyyzzz*y
    v1597       = M_xxyyzzz*x
    M_xxyzzzz   = -(M_xxxxyzz + M_xxyyyzz)
    v990        = M_xxyzzzz*y
    v1089       = M_xxyzzzz*x
    v1427       = M_xxyzzzz*z
    M_xxzzzzz   = -(M_xxxxzzz + M_xxyyzzz)
    v640        = 0.0116550116550117d0*M_xxzzzzz
    v899        = M_xxzzzzz*z
    v1326       = M_xxzzzzz*x
    v1429       = M_xxzzzzz*y
    M_xyyyyzz   = -(M_xxxyyyy + M_xyyyyyy)
    v881        = 0.27972027972028d0*M_xyyyyzz
    v904        = M_xyyyyzz*x
    v1203       = M_xyyyyzz*y
    v1346       = M_xyyyyzz*z
    M_xyyyzzz   = -(M_xxxyyyz + M_xyyyyyz)
    v1095       = M_xyyyzzz*z
    v1350       = M_xyyyzzz*y
    v1528       = M_xyyyzzz*x
    M_xyyzzzz   = -(M_xxxyyzz + M_xyyyyzz)
    v1621       = M_xxxzzzz + M_xyyzzzz
    v4          = v1621
    v1020       = M_xyyzzzz*x
    v1098       = M_xyyzzzz*y
    v1360       = M_xyyzzzz*z
    v1423       = v4*x
    M_xyzzzzz   = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz   = -v4
    M_yyyyyzz   = -(M_xxyyyyy + M_yyyyyyy)
    v544        = 0.034965034965035d0*M_yyyyyzz
    v1050       = M_yyyyyzz*y
    v1233       = M_yyyyyzz*x
    v1560       = M_yyyyyzz*z
    M_yyyyzzz   = -(M_xxyyyyz + M_yyyyyyz)
    v641        = 0.034965034965035d0*M_yyyyzzz
    v1055       = M_yyyyzzz*z
    v1391       = M_yyyyzzz*x
    v1564       = M_yyyyzzz*y
    M_yyyzzzz   = -(M_xxyyyzz + M_yyyyyzz)
    v1622       = M_xxyzzzz + M_yyyzzzz
    v5          = v1622
    v1061       = M_yyyzzzz*y
    v1106       = M_yyyzzzz*x
    v1424       = v5*y
    v1430       = M_yyyzzzz*z
    M_yyzzzzz   = -(M_xxyyzzz + M_yyyyzzz)
    v642        = 0.0116550116550117d0*M_yyzzzzz
    v1635       = v639 + v640 + v642 + v680 + v744
    v859        = M_xxzzzz*v858 + M_yyzzzz*v858 + 0.00233100233100233d0*(-21.0d0*M_xxyyzzz &
      + M_xxzzzzz + M_yyzzzzz - 105.0d0*v679)
    v910        = M_yyzzzzz*z
    v1406       = M_yyzzzzz*x
    v1432       = M_yyzzzzz*y
    M_yzzzzzz   = -v5
    M_zzzzzzz   = -(M_xxzzzzz + M_yyzzzzz)
    M_xxxxxxzz  = -(M_xxxxxxxx + M_xxxxxxyy)
    M_xxxxxyzz  = -(M_xxxxxxxy + M_xxxxxyyy)
    M_xxxxxzzz  = -(M_xxxxxxxz + M_xxxxxyyz)
    M_xxxxyyzz  = -(M_xxxxxxyy + M_xxxxyyyy)
    M_xxxxyzzz  = -(M_xxxxxxyz + M_xxxxyyyz)
    M_xxxxzzzz  = -(M_xxxxxxzz + M_xxxxyyzz)
    M_xxxyyyzz  = -(M_xxxxxyyy + M_xxxyyyyy)
    M_xxxyyzzz  = -(M_xxxxxyyz + M_xxxyyyyz)
    M_xxxyzzzz  = -(M_xxxxxyzz + M_xxxyyyzz)
    M_xxxzzzzz  = -(M_xxxxxzzz + M_xxxyyzzz)
    M_xxyyyyzz  = -(M_xxxxyyyy + M_xxyyyyyy)
    M_xxyyyzzz  = -(M_xxxxyyyz + M_xxyyyyyz)
    M_xxyyzzzz  = -(M_xxxxyyzz + M_xxyyyyzz)
    M_xxyzzzzz  = -(M_xxxxyzzz + M_xxyyyzzz)
    M_xxzzzzzz  = -(M_xxxxzzzz + M_xxyyzzzz)
    M_xyyyyyzz  = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz  = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz  = -(M_xxxyyyzz + M_xyyyyyzz)
    v1623       = M_xxxyzzzz + M_xyyyzzzz
    M_xyyzzzzz  = -(M_xxxyyzzz + M_xyyyyzzz)
    v1624       = M_xxxzzzzz + M_xyyzzzzz
    M_xyzzzzzz  = -v1623
    M_xzzzzzzz  = -v1624
    M_yyyyyyzz  = -(M_xxyyyyyy + M_yyyyyyyy)
    M_yyyyyzzz  = -(M_xxyyyyyz + M_yyyyyyyz)
    M_yyyyzzzz  = -(M_xxyyyyzz + M_yyyyyyzz)
    M_yyyzzzzz  = -(M_xxyyyzzz + M_yyyyyzzz)
    v1625       = M_xxyzzzzz + M_yyyzzzzz
    M_yyzzzzzz  = -(M_xxyyzzzz + M_yyyyzzzz)
    M_yzzzzzzz  = -v1625
    M_zzzzzzzz  = -(M_xxzzzzzz + M_yyzzzzzz)
    S_0         = 1
    S_x         = x
    S_y         = y
    S_z         = z
    S_xy        = v6
    v36         = M_xy*S_xy
    v51         = M_xx*S_xy
    v56         = M_yy*S_xy
    v65         = M_yz*S_xy
    v76         = M_xz*S_xy
    v93         = M_xxy*S_xy
    v115        = M_xxx*S_xy
    v125        = M_xyy*S_xy
    v139        = M_xyz*S_xy
    v168        = M_yyy*S_xy
    v174        = M_xxz*S_xy
    v182        = M_yyz*S_xy
    v213        = M_xxxy*S_xy
    v253        = M_xxyy*S_xy
    v255        = M_xxzz*S_xy
    v263        = M_yyzz*S_xy
    v268        = M_xxxx*S_xy
    v293        = M_yyyy*S_xy
    v315        = M_xxyz*S_xy
    v354        = M_xyyy*S_xy
    v380        = M_xxxz*S_xy
    v393        = M_xyyz*S_xy
    v418        = M_yyyz*S_xy
    v450        = M_xxxxy*S_xy
    v471        = M_xxyyy*S_xy
    v474        = M_xxyzz*S_xy
    v518        = M_yyyyy*S_xy
    v522        = M_yyyzz*S_xy
    v554        = M_xxxxx*S_xy
    v565        = M_xxxyy*S_xy
    v570        = M_xxxzz*S_xy
    v599        = M_xyyyy*S_xy
    v603        = M_xyyzz*S_xy
    v665        = M_xxxyz*S_xy
    v770        = M_xxyyz*S_xy
    v774        = M_xxzzz*S_xy
    v791        = M_yyzzz*S_xy
    v803        = M_xxxxz*S_xy
    v836        = M_yyyyz*S_xy
    v868        = M_xyyyz*S_xy
    v890        = M_xxxyyy*S_xy
    v891        = M_xxxyzz*S_xy
    v905        = M_xyyyzz*S_xy
    v937        = M_xxxxxy*S_xy
    v1012       = M_xyyyyy*S_xy
    v1086       = M_xxyyzz*S_xy
    v1091       = M_xxzzzz*S_xy
    v1108       = M_yyzzzz*S_xy
    v1126       = M_xxxxxx*S_xy
    v1137       = M_xxxxyy*S_xy
    v1142       = M_xxxxzz*S_xy
    v1171       = M_xxyyyy*S_xy
    v1230       = M_yyyyyy*S_xy
    v1235       = M_yyyyzz*S_xy
    v1273       = M_xxxxyz*S_xy
    v1308       = M_xxyyyz*S_xy
    v1315       = M_xxyzzz*S_xy
    v1387       = M_yyyyyz*S_xy
    v1395       = M_yyyzzz*S_xy
    v1452       = M_xxxxxz*S_xy
    v1470       = M_xxxyyz*S_xy
    v1478       = M_xxxzzz*S_xy
    v1524       = M_xyyyyz*S_xy
    v1531       = M_xyyzzz*S_xy
    Ms_xy       = M_0*S_xy + M_xy
    S_xz        = v7
    v44         = M_xz*S_xz
    v64         = M_yy*S_xz
    v75         = M_xy*S_xz
    v95         = M_xxz*S_xz
    v126        = M_xyz*S_xz
    v144        = M_xxx*S_xz
    v151        = M_xyy*S_xz
    v169        = M_yyz*S_xz
    v172        = 3.0d0*S_xz
    v181        = M_yyy*S_xz
    v215        = M_xxxz*S_xz
    v278        = M_xxyz*S_xz
    v302        = M_xxxx*S_xz
    v313        = M_xxyy*S_xz
    v318        = M_xxzz*S_xz
    v339        = M_yyyy*S_xz
    v343        = M_yyzz*S_xz
    v352        = 0.242424242424242d0*v215
    v355        = M_xyyz*S_xz
    v378        = M_xxxy*S_xz
    v392        = M_xyyy*S_xz
    v413        = M_yyyz*S_xz
    v452        = M_xxxxz*S_xz
    v472        = M_xxyyz*S_xz
    v479        = M_xxzzz*S_xz
    v520        = M_yyyyz*S_xz
    v527        = M_yyzzz*S_xz
    v567        = M_xxxyz*S_xz
    v652        = M_xxxxx*S_xz
    v663        = M_xxxyy*S_xz
    v668        = M_xxxzz*S_xz
    v698        = M_xyyyy*S_xz
    v702        = M_xyyzz*S_xz
    v771        = M_xxyzz*S_xz
    v788        = M_yyyzz*S_xz
    v801        = M_xxxxy*S_xz
    v812        = M_xxyyy*S_xz
    v834        = M_yyyyy*S_xz
    v850        = 0.839160839160839d0*v567
    v853        = M_xyyyz*S_xz
    v865        = 0.34965034965035d0*v668
    v869        = 0.34965034965035d0*v702
    v939        = M_xxxxxz*S_xz
    v957        = M_xxxyyz*S_xz
    v964        = M_xxxzzz*S_xz
    v1014       = M_xyyyyz*S_xz
    v1019       = M_xyyzzz*S_xz
    v1088       = M_xxyzzz*S_xz
    v1105       = M_yyyzzz*S_xz
    v1139       = M_xxxxyz*S_xz
    v1172       = M_xxyyyz*S_xz
    v1232       = M_yyyyyz*S_xz
    v1261       = M_xxxxxx*S_xz
    v1271       = M_xxxxyy*S_xz
    v1276       = M_xxxxzz*S_xz
    v1307       = M_xxyyyy*S_xz
    v1311       = M_xxyyzz*S_xz
    v1325       = M_xxzzzz*S_xz
    v1385       = M_yyyyyy*S_xz
    v1390       = M_yyyyzz*S_xz
    v1405       = M_yyzzzz*S_xz
    v1450       = M_xxxxxy*S_xz
    v1468       = M_xxxyyy*S_xz
    v1473       = M_xxxyzz*S_xz
    v1522       = M_xyyyyy*S_xz
    v1527       = M_xyyyzz*S_xz
    Ms_xz       = M_0*S_xz + M_xz
    S_yz        = v8
    v46         = M_yz*S_yz
    v50         = -0.142857142857143d0*(7.0d0*v49*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v60         = M_xy*S_yz
    v73         = M_xx*S_yz
    v83         = 3.0d0*S_yz
    v100        = M_xyz*S_yz
    v122        = M_xxz*S_yz
    v133        = M_yyz*S_yz
    v147        = M_xxy*S_yz
    v156        = M_yyy*S_yz
    v170        = M_xxx*S_yz
    v222        = M_xxyz*S_yz
    v275        = M_xxxz*S_yz
    v286        = M_xyyz*S_yz
    v305        = M_xxxy*S_yz
    v323        = M_xyyy*S_yz
    v358        = M_yyyz*S_yz
    v359        = 0.242424242424242d0*v358
    v364        = M_xxzz*S_yz
    v367        = M_yyzz*S_yz
    v375        = M_xxxx*S_yz
    v383        = M_xxyy*S_yz
    v400        = M_yyyy*S_yz
    v460        = M_xxxyz*S_yz
    v534        = M_xxzzz*S_yz
    v537        = M_yyzzz*S_yz
    v561        = M_xxxxz*S_yz
    v581        = M_xxyyz*S_yz
    v623        = M_yyyyz*S_yz
    v655        = M_xxxxy*S_yz
    v674        = M_xxyyy*S_yz
    v683        = M_xxyzz*S_yz
    v684        = 0.34965034965035d0*v683
    v719        = M_yyyyy*S_yz
    v726        = M_yyyzz*S_yz
    v727        = 0.34965034965035d0*v726
    v755        = M_xyyyz*S_yz
    v756        = 0.839160839160839d0*v755
    v767        = M_xxxzz*S_yz
    v780        = M_xyyzz*S_yz
    v798        = M_xxxxx*S_yz
    v805        = M_xxxyy*S_yz
    v821        = M_xyyyy*S_yz
    v947        = M_xxxxyz*S_yz
    v979        = M_xxyyyz*S_yz
    v989        = M_xxyzzz*S_yz
    v1049       = M_yyyyyz*S_yz
    v1060       = M_yyyzzz*S_yz
    v1083       = M_xxxzzz*S_yz
    v1097       = M_xyyzzz*S_yz
    v1133       = M_xxxxxz*S_yz
    v1153       = M_xxxyyz*S_yz
    v1202       = M_xyyyyz*S_yz
    v1264       = M_xxxxxy*S_yz
    v1282       = M_xxxyyy*S_yz
    v1290       = M_xxxyzz*S_yz
    v1341       = M_xyyyyy*S_yz
    v1349       = M_xyyyzz*S_yz
    v1425       = M_xxyyzz*S_yz
    v1428       = M_xxzzzz*S_yz
    v1431       = M_yyzzzz*S_yz
    v1447       = M_xxxxxx*S_yz
    v1455       = M_xxxxyy*S_yz
    v1463       = M_xxxxzz*S_yz
    v1488       = M_xxyyyy*S_yz
    v1555       = M_yyyyyy*S_yz
    v1563       = M_yyyyzz*S_yz
    Ms_yz       = M_0*S_yz + M_yz
    S_xyz       = v9
    v106        = M_yz*S_xyz
    v127        = M_xz*S_xyz
    v138        = M_xy*S_xyz
    v141        = 0.0476190476190476d0*(18.0d0*v136 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v137 + 48.0d0*v138 + 48.0d0*v139 + 5.0d0*v140))
    v198        = M_xyz*S_xyz
    v279        = M_xxz*S_xyz
    v295        = M_yyz*S_xyz
    v311        = 5.45454545454545d0*S_xyz
    v312        = M_xxy*v311
    v338        = M_yyy*S_xyz
    v374        = M_xxx*S_xyz
    v423        = M_xyy*v311
    v473        = M_xxyz*S_xyz
    v569        = M_xxxz*S_xyz
    v602        = M_xyyz*S_xyz
    v662        = M_xxxy*S_xyz
    v697        = M_xyyy*S_xyz
    v759        = M_yyyz*S_xyz
    v760        = 0.839160839160839d0*v759
    v769        = M_xxyy*S_xyz
    v773        = M_xxzz*S_xyz
    v790        = M_yyzz*S_xyz
    v797        = M_xxxx*S_xyz
    v833        = M_yyyy*S_xyz
    v851        = 0.839160839160839d0*v569
    v959        = M_xxxyz*S_xyz
    v1085       = M_xxyyz*S_xyz
    v1090       = M_xxzzz*S_xyz
    v1107       = M_yyzzz*S_xyz
    v1141       = M_xxxxz*S_xyz
    v1234       = M_yyyyz*S_xyz
    v1270       = M_xxxxy*S_xyz
    v1306       = M_xxyyy*S_xyz
    v1314       = M_xxyzz*S_xyz
    v1384       = M_yyyyy*S_xyz
    v1394       = M_yyyzz*S_xyz
    v1417       = M_xyyyz*S_xyz
    v1418       = 3.35664335664336d0*v1417
    v1446       = M_xxxxx*S_xyz
    v1467       = M_xxxyy*S_xyz
    v1477       = M_xxxzz*S_xyz
    v1530       = M_xyyzz*S_xyz
    v1603       = 3.35664335664336d0*v959
    v1606       = M_xyyyy*S_xyz
    Ms_xyz      = M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v10         = a2
    a3          = a1*a2
    a4          = a2*a2
    v31         = a4
    a5          = a2*a3
    a6          = a3*a3
    v190        = a6
    a7          = a3*a4
    a8          = a4*a4
    a9          = a4*a5
    b2          = b1*b1
    v11         = b2
    v1615       = v10*v11
    v67         = v1615
    v349        = v11*v31
    b3          = b1*b2
    b4          = b2*b2
    v81         = b4
    v420        = v10*v81
    b5          = b2*b3
    b6          = b3*b3
    v428        = b6
    b7          = b3*b4
    b8          = b4*b4
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v10 + v11
    v1626       = h*v10
    v12         = 0.333333333333333d0*h
    v13         = -v12
    v14         = v10 + v13
    v15         = v11 + v13
    v16         = -0.6d0*h
    v20         = 0.2d0*h
    v21         = -v20
    v22         = v10 + v21
    v30         = v11 + v21
    v32         = h*h
    v33         = 0.0857142857142857d0*v32
    v34         = v1626
    v47         = -0.428571428571429d0*h
    v48         = v10 + v47
    v66         = 0.142857142857143d0*h
    v72         = -v66
    v80         = v11 + v47
    v82         = h*v11
    v85         = 0.238095238095238d0*v32
    v107        = 0.0476190476190476d0*v32
    v108        = 0.666666666666667d0*v34
    v109        = -v108 + v107 + v31
    v162        = -0.111111111111111d0*v34
    v184        = v67 + 0.111111111111111d0*(-v82)
    v189        = 0.333333333333333d0*(-2.0d0*v82) + v107 + v81
    v191        = h*h*h
    v192        = -0.0216450216450216d0*v191
    v193        = h*v31
    v194        = v10*v32
    v248        = 0.151515151515152d0*v32
    v249        = 0.0909090909090909d0*(-10.0d0*v34) + v248 + v31
    v347        = 0.545454545454545d0*v34
    v348        = -0.00432900432900433d0*(231.0d0*v11*v347 + v191)
    v350        = 0.0303030303030303d0*v32
    v409        = -0.272727272727273d0*v34
    v410        = -0.272727272727273d0*v82
    v414        = v350 + v67
    v419        = h*v81
    v421        = v11*v32
    v427        = 0.0909090909090909d0*(-10.0d0*v82) + v248 + v81
    v431        = -0.0815850815850816d0*v191
    v530        = -0.0116550116550117d0*v191
    v531        = v190 + v530 + 0.00699300699300699d0*(-165.0d0*v193 + 45.0d0*v194)
    v746        = -0.0769230769230769d0*v193
    v747        = 0.104895104895105d0*v32
    v748        = 0.769230769230769d0*v34
    v749        = -v11*v748
    v1629       = v530 + v749
    v843        = 0.00699300699300699d0*v191
    v844        = -v843
    v845        = v11*v1626
    v846        = -0.461538461538462d0*v845
    v847        = v844 + v846
    v848        = 0.020979020979021d0*v421
    v1630       = v349 + v848
    v857        = 0.00233100233100233d0*(-v191) + v846
    v872        = 0.020979020979021d0*v194
    v1632       = v420 + v872
    v873        = -0.0769230769230769d0*v419
    v880        = 0.00699300699300699d0*(-165.0d0*v419 + 45.0d0*v421) + v428 + v530
    v882        = h*h*h*h
    v883        = 0.00543900543900544d0*v882
    v884        = h*v190
    v885        = v31*v32
    v886        = v10*v191
    v1078       = -0.048951048951049d0*v191
    v1079       = v1078 + v190 + 0.0153846153846154d0*(-91.0d0*v193 + 35.0d0*v194)
    v1412       = v1615*v32
    v1413       = 0.000777000777000777d0*(297.0d0*v1412 + v882)
    v1414       = 0.020979020979021d0*v191
    v1415       = v11*v193
    v1589       = 0.0769230769230769d0*v421
    v1633       = v1589 + v349
    v1590       = -v1414
    v1591       = -v20*v31
    v1592       = -v108*v11
    v1636       = v1590 + v1592
    v1596       = v1592 + v844
    v1600       = v32*v81
    v1601       = v11*v191
    v1602       = v10*v419
    v1605       = -0.0013986013986014d0*(3.0d0*v191 + 286.0d0*v845)
    v1608       = 0.0769230769230769d0*v194
    v1634       = v1608 + v420
    v1609       = -v20*v81
    v1610       = h*v428
    v1613       = v1078 + v428 + 0.0153846153846154d0*(-91.0d0*v419 + 35.0d0*v421)
    S_xx        = v14
    v37         = M_yy*S_xx
    v39         = M_xx*S_xx
    v53         = M_xy*S_xx
    v79         = M_yz*S_xx
    v88         = M_xxx*S_xx
    v98         = M_xyy*S_xx
    v118        = M_xxy*S_xx
    v130        = M_yyy*S_xx
    v149        = M_xxz*S_xx
    v158        = M_yyz*S_xx
    v208        = M_xxxx*S_xx
    v219        = M_xxyy*S_xx
    v225        = M_xxzz*S_xx
    v240        = M_yyyy*S_xx
    v245        = M_yyzz*S_xx
    v271        = M_xxxy*S_xx
    v283        = M_xyyy*S_xx
    v308        = M_xxxz*S_xx
    v325        = M_xyyz*S_xx
    v386        = M_xxyz*S_xx
    v403        = M_yyyz*S_xx
    v445        = M_xxxxx*S_xx
    v456        = M_xxxyy*S_xx
    v464        = M_xxxzz*S_xx
    v493        = M_xyyyy*S_xx
    v500        = M_xyyzz*S_xx
    v557        = M_xxxxy*S_xx
    v578        = M_xxyyy*S_xx
    v584        = M_xxyzz*S_xx
    v619        = M_yyyyy*S_xx
    v626        = M_yyyzz*S_xx
    v659        = M_xxxxz*S_xx
    v677        = M_xxyyz*S_xx
    v692        = M_xxzzz*S_xx
    v721        = M_yyyyz*S_xx
    v735        = M_yyzzz*S_xx
    v778        = M_xyyyz*S_xx
    v807        = M_xxxyz*S_xx
    v863        = -0.20979020979021d0*v659
    v932        = M_xxxxxx*S_xx
    v943        = M_xxxxyy*S_xx
    v950        = M_xxxxzz*S_xx
    v975        = M_xxyyyy*S_xx
    v983        = M_xxyyzz*S_xx
    v1000       = M_xxzzzz*S_xx
    v1046       = M_yyyyyy*S_xx
    v1053       = M_yyyyzz*S_xx
    v1071       = M_yyzzzz*S_xx
    v1129       = M_xxxxxy*S_xx
    v1150       = M_xxxyyy*S_xx
    v1157       = M_xxxyzz*S_xx
    v1198       = M_xyyyyy*S_xx
    v1206       = M_xyyyzz*S_xx
    v1267       = M_xxxxxz*S_xx
    v1285       = M_xxxyyz*S_xx
    v1299       = M_xxxzzz*S_xx
    v1344       = M_xyyyyz*S_xx
    v1358       = M_xyyzzz*S_xx
    v1458       = M_xxxxyz*S_xx
    v1491       = M_xxyyyz*S_xx
    v1503       = M_xxyzzz*S_xx
    v1558       = M_yyyyyz*S_xx
    v1572       = M_yyyzzz*S_xx
    Ms_xx       = M_0*S_xx + M_xx
    S_yy        = v15
    v35         = M_xx*S_yy
    v38         = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v36 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v35 + 4.0d0*v37))
    v45         = M_yy*S_yy
    v54         = M_xy*S_yy
    v63         = M_xz*S_yy
    v89         = M_xxx*S_yy
    v99         = M_xyy*S_yy
    v119        = M_xxy*S_yy
    v131        = M_yyy*S_yy
    v150        = M_xxz*S_yy
    v159        = M_yyz*S_yy
    v209        = M_xxxx*S_yy
    v220        = M_xxyy*S_yy
    v226        = M_xxzz*S_yy
    v241        = M_yyyy*S_yy
    v246        = M_yyzz*S_yy
    v272        = M_xxxy*S_yy
    v284        = M_xyyy*S_yy
    v309        = M_xxxz*S_yy
    v326        = M_xyyz*S_yy
    v387        = M_xxyz*S_yy
    v404        = M_yyyz*S_yy
    v446        = M_xxxxx*S_yy
    v457        = M_xxxyy*S_yy
    v465        = M_xxxzz*S_yy
    v494        = M_xyyyy*S_yy
    v501        = M_xyyzz*S_yy
    v558        = M_xxxxy*S_yy
    v579        = M_xxyyy*S_yy
    v585        = M_xxyzz*S_yy
    v620        = M_yyyyy*S_yy
    v627        = M_yyyzz*S_yy
    v637        = M_yyyyz*S_yy
    v638        = -0.20979020979021d0*v637
    v660        = M_xxxxz*S_yy
    v678        = M_xxyyz*S_yy
    v693        = M_xxzzz*S_yy
    v736        = M_yyzzz*S_yy
    v765        = M_xxxyz*S_yy
    v824        = M_xyyyz*S_yy
    v933        = M_xxxxxx*S_yy
    v944        = M_xxxxyy*S_yy
    v951        = M_xxxxzz*S_yy
    v976        = M_xxyyyy*S_yy
    v984        = M_xxyyzz*S_yy
    v1001       = M_xxzzzz*S_yy
    v1054       = M_yyyyzz*S_yy
    v1072       = M_yyzzzz*S_yy
    v1130       = M_xxxxxy*S_yy
    v1151       = M_xxxyyy*S_yy
    v1158       = M_xxxyzz*S_yy
    v1199       = M_xyyyyy*S_yy
    v1207       = M_xyyyzz*S_yy
    v1268       = M_xxxxxz*S_yy
    v1286       = M_xxxyyz*S_yy
    v1300       = M_xxxzzz*S_yy
    v1345       = M_xyyyyz*S_yy
    v1359       = M_xyyzzz*S_yy
    v1422       = M_yyyyyy*S_yy
    v1459       = M_xxxxyz*S_yy
    v1492       = M_xxyyyz*S_yy
    v1504       = M_xxyzzz*S_yy
    v1559       = M_yyyyyz*S_yy
    v1573       = M_yyyzzz*S_yy
    Ms_yy       = M_0*S_yy + M_yy
    S_zz        = -(S_xx + S_yy)
    S_xxx       = x*(v10 + v16)
    v86         = M_xx*S_xxx
    v102        = M_yy*S_xxx
    v123        = M_xy*S_xxx
    v152        = M_xz*S_xxx
    v183        = M_yz*S_xxx
    v206        = M_xxx*S_xxx
    v228        = M_xyy*S_xxx
    v261        = M_yyy*S_xxx
    v276        = M_xxy*S_xxx
    v316        = 10.0d0*S_xxx
    v341        = M_yyz*S_xxx
    v394        = M_xyz*S_xxx
    v443        = M_xxxx*S_xxx
    v469        = M_xxyy*S_xxx
    v477        = M_xxzz*S_xxx
    v516        = M_yyyy*S_xxx
    v525        = M_yyzz*S_xxx
    v563        = M_xxxy*S_xxx
    v597        = M_xyyy*S_xxx
    v666        = M_xxxz*S_xxx
    v700        = M_xyyz*S_xxx
    v837        = M_yyyz*S_xxx
    v930        = M_xxxxx*S_xxx
    v954        = M_xxxyy*S_xxx
    v962        = M_xxxzz*S_xxx
    v1010       = M_xyyyy*S_xxx
    v1017       = M_xyyzz*S_xxx
    v1135       = M_xxxxy*S_xxx
    v1169       = M_xxyyy*S_xxx
    v1174       = M_xxyzz*S_xxx
    v1228       = M_yyyyy*S_xxx
    v1237       = M_yyyzz*S_xxx
    v1274       = M_xxxxz*S_xxx
    v1309       = M_xxyyz*S_xxx
    v1323       = M_xxzzz*S_xxx
    v1388       = M_yyyyz*S_xxx
    v1403       = M_yyzzz*S_xxx
    v1471       = M_xxxyz*S_xxx
    v1525       = M_xyyyz*S_xxx
    Ms_xxx      = 0.2d0*(9.0d0*v17 + 3.0d0*(-2.0d0*v18 - 2.0d0*v19)) + M_0*S_xxx + M_xxx
    S_xxy       = v22*y
    v97         = M_xy*S_xxy
    v113        = M_xx*S_xxy
    v128        = M_yy*S_xxy
    v160        = M_yz*S_xxy
    v217        = M_xxy*S_xxy
    v238        = M_yyy*S_xxy
    v259        = M_xyy*S_xxy
    v267        = M_xxx*S_xxy
    v329        = S_xxy*v328
    v388        = M_xxz*S_xxy
    v405        = M_yyz*S_xxy
    v454        = M_xxxy*S_xxy
    v491        = M_xyyy*S_xxy
    v552        = M_xxxx*S_xxy
    v576        = M_xxyy*S_xxy
    v588        = M_xxzz*S_xxy
    v617        = M_yyyy*S_xxy
    v630        = M_yyzz*S_xxy
    v681        = M_xxyz*S_xxy
    v724        = M_yyyz*S_xxy
    v808        = M_xxxz*S_xxy
    v825        = M_xyyz*S_xxy
    v941        = M_xxxxy*S_xxy
    v973        = M_xxyyy*S_xxy
    v987        = M_xxyzz*S_xxy
    v1044       = M_yyyyy*S_xxy
    v1058       = M_yyyzz*S_xxy
    v1124       = M_xxxxx*S_xxy
    v1148       = M_xxxyy*S_xxy
    v1160       = M_xxxzz*S_xxy
    v1196       = M_xyyyy*S_xxy
    v1209       = M_xyyzz*S_xxy
    v1288       = M_xxxyz*S_xxy
    v1347       = M_xyyyz*S_xxy
    v1461       = M_xxxxz*S_xxy
    v1494       = M_xxyyz*S_xxy
    v1512       = M_xxzzz*S_xxy
    v1561       = M_yyyyz*S_xxy
    v1581       = M_yyzzz*S_xxy
    Ms_xxy      = 0.2d0*(8.0d0*v23 + 2.0d0*(-v24 - v25)) + M_0*S_xxy + M_xx*y + M_xxy
    S_xxz       = v22*z
    v101        = M_xz*S_xxz
    v134        = M_yz*S_xxz
    v142        = M_xx*S_xxz
    v154        = M_yy*S_xxz
    v175        = M_xy*S_xxz
    v199        = M_yyz*S_xxz
    v224        = M_xxz*S_xxz
    v287        = M_xyz*S_xxz
    v321        = M_xyy*S_xxz
    v381        = M_xxy*S_xxz
    v399        = M_yyy*S_xxz
    v462        = M_xxxz*S_xxz
    v498        = M_xyyz*S_xxz
    v582        = M_xxyz*S_xxz
    v624        = M_yyyz*S_xxz
    v650        = M_xxxx*S_xxz
    v672        = M_xxyy*S_xxz
    v690        = M_xxzz*S_xxz
    v717        = M_yyyy*S_xxz
    v733        = M_yyzz*S_xxz
    v820        = M_xyyy*S_xxz
    v948        = M_xxxxz*S_xxz
    v981        = M_xxyyz*S_xxz
    v998        = M_xxzzz*S_xxz
    v1051       = M_yyyyz*S_xxz
    v1069       = M_yyzzz*S_xxz
    v1155       = M_xxxyz*S_xxz
    v1204       = M_xyyyz*S_xxz
    v1259       = M_xxxxx*S_xxz
    v1280       = M_xxxyy*S_xxz
    v1297       = M_xxxzz*S_xxz
    v1339       = M_xyyyy*S_xxz
    v1356       = M_xyyzz*S_xxz
    v1453       = M_xxxxy*S_xxz
    v1486       = M_xxyyy*S_xxz
    v1501       = M_xxyzz*S_xxz
    v1553       = M_yyyyy*S_xxz
    v1570       = M_yyyzz*S_xxz
    Ms_xxz      = M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v26 + 8.0d0*v27 + 2.0d0*(v28 - v29))
    S_xyy       = v30*x
    v87         = M_xx*S_xyy
    v103        = M_yy*S_xyy
    v124        = M_xy*S_xyy
    v153        = M_xz*S_xyy
    v207        = M_xxx*S_xyy
    v229        = M_xyy*S_xyy
    v252        = M_xxy*S_xyy
    v292        = M_yyy*S_xyy
    v317        = M_xxz*S_xyy
    v342        = M_yyz*S_xyy
    v426        = S_xyy*v328
    v444        = M_xxxx*S_xyy
    v470        = M_xxyy*S_xyy
    v478        = M_xxzz*S_xyy
    v517        = M_yyyy*S_xyy
    v526        = M_yyzz*S_xyy
    v564        = M_xxxy*S_xyy
    v598        = M_xyyy*S_xyy
    v667        = M_xxxz*S_xyy
    v701        = M_xyyz*S_xyy
    v814        = M_xxyz*S_xyy
    v838        = M_yyyz*S_xyy
    v931        = M_xxxxx*S_xyy
    v955        = M_xxxyy*S_xyy
    v963        = M_xxxzz*S_xyy
    v1011       = M_xyyyy*S_xyy
    v1018       = M_xyyzz*S_xyy
    v1136       = M_xxxxy*S_xyy
    v1170       = M_xxyyy*S_xyy
    v1175       = M_xxyzz*S_xyy
    v1229       = M_yyyyy*S_xyy
    v1238       = M_yyyzz*S_xyy
    v1275       = M_xxxxz*S_xyy
    v1310       = M_xxyyz*S_xyy
    v1324       = M_xxzzz*S_xyy
    v1389       = M_yyyyz*S_xyy
    v1404       = M_yyzzz*S_xyy
    v1472       = M_xxxyz*S_xyy
    v1526       = M_xyyyz*S_xyy
    Ms_xyy      = 0.2d0*(8.0d0*v18 + 2.0d0*(-v17 - v19)) + M_0*S_xyy + M_xyy + M_yy*x
    S_xzz       = -(S_xxx + S_xyy)
    S_yyy       = y*(v11 + v16)
    v114        = M_xx*S_yyy
    v129        = M_yy*S_yyy
    v161        = M_yz*S_yyy
    v164        = M_xy*S_yyy
    v180        = M_xz*S_yyy
    v218        = M_xxy*S_yyy
    v239        = M_yyy*S_yyy
    v250        = M_xxx*S_yyy
    v282        = M_xyy*S_yyy
    v330        = M_xyz*S_yyy
    v389        = M_xxz*S_yyy
    v430        = 10.0d0*S_yyy
    v455        = M_xxxy*S_yyy
    v492        = M_xyyy*S_yyy
    v553        = M_xxxx*S_yyy
    v577        = M_xxyy*S_yyy
    v589        = M_xxzz*S_yyy
    v618        = M_yyyy*S_yyy
    v631        = M_yyzz*S_yyy
    v682        = M_xxyz*S_yyy
    v725        = M_yyyz*S_yyy
    v809        = M_xxxz*S_yyy
    v942        = M_xxxxy*S_yyy
    v974        = M_xxyyy*S_yyy
    v988        = M_xxyzz*S_yyy
    v1045       = M_yyyyy*S_yyy
    v1059       = M_yyyzz*S_yyy
    v1125       = M_xxxxx*S_yyy
    v1149       = M_xxxyy*S_yyy
    v1161       = M_xxxzz*S_yyy
    v1197       = M_xyyyy*S_yyy
    v1210       = M_xyyzz*S_yyy
    v1289       = M_xxxyz*S_yyy
    v1348       = M_xyyyz*S_yyy
    v1462       = M_xxxxz*S_yyy
    v1495       = M_xxyyz*S_yyy
    v1513       = M_xxzzz*S_yyy
    v1562       = M_yyyyz*S_yyy
    v1582       = M_yyzzz*S_yyy
    Ms_yyy      = 0.2d0*(9.0d0*v24 + 3.0d0*(-2.0d0*v23 - 2.0d0*v25)) + M_0*S_yyy + M_yyy
    S_yyz       = v30*z
    v135        = M_yz*S_yyz
    v143        = M_xx*S_yyz
    v155        = M_yy*S_yyz
    v167        = M_xz*S_yyz
    v176        = M_xy*S_yyz
    v196        = M_xxz*S_yyz
    v200        = M_xxzzz*v197 + M_yyzzz*v197 + 0.00432900432900433d0*(-75.0d0*M_xxyyzz + &
      60.0d0*v195 + 1440.0d0*v198 + 5.0d0*(M_xxzzzz + M_yyzzzz - 8.0d0* &
      v196 - 8.0d0*v199))
    v244        = M_yyz*S_yyz
    v288        = M_xyz*S_yyz
    v301        = M_xxx*S_yyz
    v322        = M_xyy*S_yyz
    v351        = 0.00432900432900433d0*(-15.0d0*M_xxyyzz + v1620 - 240.0d0*v195 - 720.0d0 &
      *v198 - 260.0d0*(v196 + v199))
    v382        = M_xxy*S_yyz
    v429        = 10.0d0*S_yyz
    v463        = M_xxxz*S_yyz
    v499        = M_xyyz*S_yyz
    v583        = M_xxyz*S_yyz
    v625        = M_yyyz*S_yyz
    v651        = M_xxxx*S_yyz
    v673        = M_xxyy*S_yyz
    v691        = M_xxzz*S_yyz
    v718        = M_yyyy*S_yyz
    v734        = M_yyzz*S_yyz
    v804        = M_xxxy*S_yyz
    v949        = M_xxxxz*S_yyz
    v982        = M_xxyyz*S_yyz
    v999        = M_xxzzz*S_yyz
    v1052       = M_yyyyz*S_yyz
    v1070       = M_yyzzz*S_yyz
    v1156       = M_xxxyz*S_yyz
    v1205       = M_xyyyz*S_yyz
    v1260       = M_xxxxx*S_yyz
    v1281       = M_xxxyy*S_yyz
    v1298       = M_xxxzz*S_yyz
    v1340       = M_xyyyy*S_yyz
    v1357       = M_xyyzz*S_yyz
    v1454       = M_xxxxy*S_yyz
    v1487       = M_xxyyy*S_yyz
    v1502       = M_xxyzz*S_yyz
    v1554       = M_yyyyy*S_yyz
    v1571       = M_yyyzz*S_yyz
    Ms_yyz      = M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v28 + 8.0d0*v29 + 2.0d0*(v26 - v27))
    S_yzz       = -(S_xxy + S_yyy)
    S_zzz       = -(S_xxz + S_yyz)
    S_xxxx      = 0.142857142857143d0*(-6.0d0*v34) + v31 + v33
    v201        = M_xx*S_xxxx
    v233        = M_yy*S_xxxx
    v280        = M_xy*S_xxxx
    v331        = M_xz*S_xxxx
    v406        = M_yz*S_xxxx
    v438        = M_xxx*S_xxxx
    v486        = M_xyy*S_xxxx
    v571        = M_xxy*S_xxxx
    v612        = M_yyy*S_xxxx
    v685        = M_xxz*S_xxxx
    v728        = M_yyz*S_xxxx
    v826        = M_xyz*S_xxxx
    v906        = M_yyyy*S_xxxx
    v926        = M_xxxx*S_xxxx
    v971        = M_xxyy*S_xxxx
    v996        = M_xxzz*S_xxxx
    v1067       = M_yyzz*S_xxxx
    v1143       = M_xxxy*S_xxxx
    v1191       = M_xyyy*S_xxxx
    v1292       = M_xxxz*S_xxxx
    v1351       = M_xyyz*S_xxxx
    v1496       = M_xxyz*S_xxxx
    v1565       = M_yyyz*S_xxxx
    Ms_xxxx     = M_0*S_xxxx + v38 - v42 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v39 + 80.0d0*v40 - 60.0d0*v43 - 96.0d0*v44 + &
      24.0d0*(v45 + v46))
    S_xxxy      = v48*v6
    v227        = M_xy*S_xxxy
    v265        = M_xx*S_xxxy
    v290        = M_yy*S_xxxy
    v345        = M_yz*S_xxxy
    v395        = M_xz*S_xxxy
    v467        = M_xxy*S_xxxy
    v514        = M_yyy*S_xxxy
    v550        = M_xxx*S_xxxy
    v595        = M_xyy*S_xxxy
    v704        = M_xyz*S_xxxy
    v839        = M_yyz*S_xxxy
    v903        = M_xyyy*S_xxxy
    v953        = M_xxxy*S_xxxy
    v1122       = M_xxxx*S_xxxy
    v1167       = M_xxyy*S_xxxy
    v1178       = M_xxzz*S_xxxy
    v1226       = M_yyyy*S_xxxy
    v1241       = M_yyzz*S_xxxy
    v1312       = M_xxyz*S_xxxy
    v1392       = M_yyyz*S_xxxy
    v1475       = M_xxxz*S_xxxy
    v1529       = M_xyyz*S_xxxy
    Ms_xxxy     = M_0*S_xxxy + M_xxx*y + M_xxxy + v50 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v51 + 5.0d0*v52 + 5.0d0*v53 - 2.0d0*v54 - 2.0d0*v55 - 2.0d0*v56))
    S_xxxz      = v48*v7
    v232        = M_xz*S_xxxz
    v296        = M_yz*S_xxxz
    v298        = M_xx*S_xxxz
    v336        = M_yy*S_xxxz
    v356        = 0.242424242424242d0*v232
    v390        = M_xy*S_xxxz
    v475        = M_xxz*S_xxxz
    v523        = M_yyz*S_xxxz
    v604        = M_xyz*S_xxxz
    v648        = M_xxx*S_xxxz
    v695        = M_xyy*S_xxxz
    v810        = M_xxy*S_xxxz
    v832        = M_yyy*S_xxxz
    v854        = 0.839160839160839d0*v604
    v960        = M_xxxz*S_xxxz
    v1015       = M_xyyz*S_xxxz
    v1104       = M_yyyz*S_xxxz
    v1173       = M_xxyz*S_xxxz
    v1257       = M_xxxx*S_xxxz
    v1304       = M_xxyy*S_xxxz
    v1321       = M_xxzz*S_xxxz
    v1382       = M_yyyy*S_xxxz
    v1401       = M_yyzz*S_xxxz
    v1465       = M_xxxy*S_xxxz
    v1521       = M_xyyy*S_xxxz
    Ms_xxxz     = 0.142857142857143d0*(13.0d0*v58 + 15.0d0*v59 + 6.0d0*(-v60 + v61 + v63 + &
      v64 - v65)) + M_0*S_xxxz + M_xxxz + S_xx*v62 + S_xz*v57 - v49*y
    S_xxyy      = 0.0285714285714286d0*v32 - v10*v66 - v11*v66 + v67
    v202        = M_xx*S_xxyy
    v234        = M_yy*S_xxyy
    v256        = M_xy*S_xxyy
    v332        = M_xz*S_xxyy
    v407        = M_yz*S_xxyy
    v439        = M_xxx*S_xxyy
    v487        = M_xyy*S_xxyy
    v572        = M_xxy*S_xxyy
    v613        = M_yyy*S_xxyy
    v686        = M_xxz*S_xxyy
    v729        = M_yyz*S_xxyy
    v782        = M_xyz*S_xxyy
    v892        = M_xxyy*S_xxyy
    v896        = M_xxzz*S_xxyy
    v907        = M_yyzz*S_xxyy
    v927        = M_xxxx*S_xxyy
    v1040       = M_yyyy*S_xxyy
    v1144       = M_xxxy*S_xxyy
    v1192       = M_xyyy*S_xxyy
    v1293       = M_xxxz*S_xxyy
    v1352       = M_xyyz*S_xxyy
    v1497       = M_xxyz*S_xxyy
    v1566       = M_yyyz*S_xxyy
    Ms_xxyy     = M_0*S_xxyy + v42 + v69 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v36 + 39.0d0*(v35 + v37) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v39 + 10.0d0*v40 + 10.0d0*v43 + 12.0d0*v44 + 12.0d0*v45 + &
      12.0d0*v46 + 10.0d0*v70 + 10.0d0*v71))
    S_xxyz      = v8*(v10 + v72)
    v247        = M_yz*S_xxyz
    v289        = M_xz*S_xxyz
    v320        = M_xy*S_xxyz
    v372        = M_xx*S_xxyz
    v397        = M_yy*S_xxyz
    v503        = M_xyz*S_xxyz
    v586        = M_xxz*S_xxyz
    v628        = M_yyz*S_xxyz
    v670        = M_xxy*S_xxyz
    v715        = M_yyy*S_xxyz
    v818        = M_xyy*S_xxyz
    v985        = M_xxyz*S_xxyz
    v1056       = M_yyyz*S_xxyz
    v1096       = M_xyyz*S_xxyz
    v1159       = M_xxxz*S_xxyz
    v1278       = M_xxxy*S_xxyz
    v1337       = M_xyyy*S_xxyz
    v1444       = M_xxxx*S_xxyz
    v1484       = M_xxyy*S_xxyz
    v1510       = M_xxzz*S_xxyz
    v1551       = M_yyyy*S_xxyz
    v1579       = M_yyzz*S_xxyz
    Ms_xxyz     = 0.142857142857143d0*(12.0d0*(v75 + v76) + 2.0d0*(v77 - v78) + 9.0d0*(v73 &
      + v74 + v79)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v68
    S_xxzz      = -(S_xxxx + S_xxyy)
    v203        = M_xx*S_xxzz
    v235        = M_yy*S_xxzz
    v257        = M_xy*S_xxzz
    v333        = M_xz*S_xxzz
    v369        = M_yz*S_xxzz
    v440        = M_xxx*S_xxzz
    v488        = M_xyy*S_xxzz
    v573        = M_xxy*S_xxzz
    v614        = M_yyy*S_xxzz
    v687        = M_xxz*S_xxzz
    v730        = M_yyz*S_xxzz
    v783        = M_xyz*S_xxzz
    v893        = M_xxyy*S_xxzz
    v897        = M_xxzz*S_xxzz
    v908        = M_yyzz*S_xxzz
    v928        = M_xxxx*S_xxzz
    v1041       = M_yyyy*S_xxzz
    v1145       = M_xxxy*S_xxzz
    v1193       = M_xyyy*S_xxzz
    v1294       = M_xxxz*S_xxzz
    v1353       = M_xyyz*S_xxzz
    v1498       = M_xxyz*S_xxzz
    v1567       = M_yyyz*S_xxzz
    S_xyyy      = v6*v80
    v266        = M_xx*S_xyyy
    v291        = M_yy*S_xyyy
    v346        = M_yz*S_xyyy
    v353        = M_xy*S_xyyy
    v396        = M_xz*S_xyyy
    v468        = M_xxy*S_xyyy
    v515        = M_yyy*S_xyyy
    v551        = M_xxx*S_xyyy
    v596        = M_xyy*S_xyyy
    v705        = M_xyz*S_xyyy
    v815        = M_xxz*S_xyyy
    v889        = M_xxxy*S_xyyy
    v1009       = M_xyyy*S_xyyy
    v1123       = M_xxxx*S_xyyy
    v1168       = M_xxyy*S_xyyy
    v1179       = M_xxzz*S_xyyy
    v1227       = M_yyyy*S_xyyy
    v1242       = M_yyzz*S_xyyy
    v1313       = M_xxyz*S_xyyy
    v1393       = M_yyyz*S_xyyy
    v1476       = M_xxxz*S_xyyy
    v1612       = M_xyyz*S_xyyy
    Ms_xyyy     = M_0*S_xyyy + M_xyyy + M_yyy*x + v50 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v51 - 2.0d0*v52 - 2.0d0*v53 + 5.0d0*v54 + 5.0d0*v55 + 5.0d0*v56 &
      ))
    S_xyyz      = v7*(v11 + v72)
    v297        = M_yz*S_xyyz
    v299        = M_xx*S_xyyz
    v337        = M_yy*S_xyyz
    v357        = M_xz*S_xyyz
    v391        = M_xy*S_xyyz
    v476        = M_xxz*S_xyyz
    v524        = M_yyz*S_xyyz
    v605        = M_xyz*S_xyyz
    v649        = M_xxx*S_xyyz
    v696        = M_xyy*S_xyyz
    v811        = M_xxy*S_xyyz
    v961        = M_xxxz*S_xyyz
    v1016       = M_xyyz*S_xyyz
    v1087       = M_xxyz*S_xyyz
    v1236       = M_yyyz*S_xyyz
    v1258       = M_xxxx*S_xyyz
    v1305       = M_xxyy*S_xyyz
    v1322       = M_xxzz*S_xyyz
    v1383       = M_yyyy*S_xyyz
    v1402       = M_yyzz*S_xyyz
    v1466       = M_xxxy*S_xyyz
    v1611       = M_xyyy*S_xyyz
    Ms_xyyz     = 0.142857142857143d0*(2.0d0*(v58 - v59) + 12.0d0*(v60 + v65) + 9.0d0*(v61 &
      + v63 + v64)) + M_0*S_xyyz + M_xyyz + M_xyz*v41 + M_yyz*x
    S_xyzz      = -(S_xxxy + S_xyyy)
    S_xzzz      = -(S_xxxz + S_xyyz)
    S_yyyy      = 0.142857142857143d0*(-6.0d0*v82) + v33 + v81
    v204        = M_xx*S_yyyy
    v236        = M_yy*S_yyyy
    v281        = M_xy*S_yyyy
    v334        = M_xz*S_yyyy
    v408        = M_yz*S_yyyy
    v441        = M_xxx*S_yyyy
    v489        = M_xyy*S_yyyy
    v574        = M_xxy*S_yyyy
    v615        = M_yyy*S_yyyy
    v688        = M_xxz*S_yyyy
    v731        = M_yyz*S_yyyy
    v827        = M_xyz*S_yyyy
    v887        = M_xxxx*S_yyyy
    v972        = M_xxyy*S_yyyy
    v997        = M_xxzz*S_yyyy
    v1042       = M_yyyy*S_yyyy
    v1068       = M_yyzz*S_yyyy
    v1146       = M_xxxy*S_yyyy
    v1194       = M_xyyy*S_yyyy
    v1295       = M_xxxz*S_yyyy
    v1354       = M_xyyz*S_yyyy
    v1499       = M_xxyz*S_yyyy
    v1568       = M_yyyz*S_yyyy
    Ms_yyyy     = M_0*S_yyyy + v38 - v69 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v45 - 96.0d0*v46 + 80.0d0*v70 - 60.0d0*v71 + &
      24.0d0*(v39 + v44))
    S_yyyz      = v8*v80
    v360        = M_yz*S_yyyz
    v361        = 0.242424242424242d0*v360
    v373        = M_xx*S_yyyz
    v398        = M_yy*S_yyyz
    v412        = M_xz*S_yyyz
    v416        = M_xy*S_yyyz
    v587        = M_xxz*S_yyyz
    v629        = M_yyz*S_yyyz
    v671        = M_xxy*S_yyyz
    v716        = M_yyy*S_yyyz
    v757        = M_xyz*S_yyyz
    v758        = 0.839160839160839d0*v757
    v796        = M_xxx*S_yyyz
    v819        = M_xyy*S_yyyz
    v986        = M_xxyz*S_yyyz
    v1057       = M_yyyz*S_yyyz
    v1082       = M_xxxz*S_yyyz
    v1208       = M_xyyz*S_yyyz
    v1279       = M_xxxy*S_yyyz
    v1338       = M_xyyy*S_yyyz
    v1445       = M_xxxx*S_yyyz
    v1485       = M_xxyy*S_yyyz
    v1511       = M_xxzz*S_yyyz
    v1552       = M_yyyy*S_yyyz
    v1580       = M_yyzz*S_yyyz
    Ms_yyyz     = 0.142857142857143d0*(13.0d0*v77 + 15.0d0*v78 + 6.0d0*(v73 + v74 - v75 - &
      v76 + v79)) + M_0*S_yyyz + M_yy*v83 + M_yyyz + S_yy*v84 - v49*x
    S_yyzz      = -(S_xxyy + S_yyyy)
    v205        = M_xx*S_yyzz
    v237        = M_yy*S_yyzz
    v258        = M_xy*S_yyzz
    v264        = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz + &
      4.0d0*v250 - v251 - 24.0d0*v252 - 30.0d0*v253 - v254 - v255 - &
      30.0d0*v256 - v257 - v258 - 24.0d0*v259 - v260 + 4.0d0*v261 - &
      v262 - v263))
    v335        = M_xz*S_yyzz
    v370        = M_yz*S_yyzz
    v371        = -0.0303030303030303d0*(M_yyyyyz + v1619 + v365 + v368 + 5.0d0*(v363 + &
      v364 + v366 + v367 + v369 + v370))
    v415        = -0.0303030303030303d0*(M_xxxxxz + v1618 + v319 + v344 + 5.0d0*(v310 + &
      v318 + v327 + v333 + v335 + v343))
    v442        = M_xxx*S_yyzz
    v490        = M_xyy*S_yyzz
    v575        = M_xxy*S_yyzz
    v616        = M_yyy*S_yyzz
    v689        = M_xxz*S_yyzz
    v732        = M_yyz*S_yyzz
    v784        = M_xyz*S_yyzz
    v894        = M_xxyy*S_yyzz
    v898        = M_xxzz*S_yyzz
    v909        = M_yyzz*S_yyzz
    v1627       = 28.0d0*M_xxyyzzzz + 168.0d0*v895 - (M_xxzzzzzz + M_yyzzzzzz + 8.0d0*v899 &
      + 8.0d0*v910) + 70.0d0*(v897 + v898 + v908 + v909)
    v929        = M_xxxx*S_yyzz
    v1043       = M_yyyy*S_yyzz
    v1147       = M_xxxy*S_yyzz
    v1195       = M_xyyy*S_yyzz
    v1296       = M_xxxz*S_yyzz
    v1355       = M_xyyz*S_yyzz
    v1500       = M_xxyz*S_yyzz
    v1569       = M_yyyz*S_yyzz
    S_yzzz      = -(S_xxyz + S_yyyz)
    S_zzzz      = -(S_xxzz + S_yyzz)
    S_xxxxx     = x*(0.111111111111111d0*(-10.0d0*v34) + v31 + v85)
    v433        = M_xx*S_xxxxx
    v509        = M_yy*S_xxxxx
    v590        = M_xy*S_xxxxx
    v706        = M_xz*S_xxxxx
    v840        = M_yz*S_xxxxx
    v921        = M_xxx*S_xxxxx
    v1004       = M_xyy*S_xxxxx
    v1162       = M_xxy*S_xxxxx
    v1221       = M_yyy*S_xxxxx
    v1316       = M_xxz*S_xxxxx
    v1396       = M_yyz*S_xxxxx
    v1532       = M_xyz*S_xxxxx
    Ms_xxxxx    = 0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v90 &
      - 30.0d0*(M_xxxyy + v94) + 330.0d0*(v86 + v88) - 140.0d0*(v91 + &
      v92) + 120.0d0*(v100 + v103 + v106 + v99) - 300.0d0*(v101 + v93 + &
      v95 + v97) + 60.0d0*(v102 + v87 + v89 + v98) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v104 + v105 + v96))
    S_xxxxy     = v109*y
    v481        = M_xy*S_xxxxy
    v545        = M_xx*S_xxxxy
    v607        = M_yy*S_xxxxy
    v737        = M_yz*S_xxxxy
    v828        = M_xz*S_xxxxy
    v966        = M_xxy*S_xxxxy
    v1035       = M_yyy*S_xxxxy
    v1117       = M_xxx*S_xxxxy
    v1186       = M_xyy*S_xxxxy
    v1361       = M_xyz*S_xxxxy
    v1505       = M_xxz*S_xxxxy
    v1574       = M_yyz*S_xxxxy
    Ms_xxxxy    = M_0*S_xxxxy + v112 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v116) + &
      78.0d0*(v113 + v118) + 4.0d0*(v114 + v130) + 56.0d0*(v115 + v117 &
      + v123) + 8.0d0*(v129 + v131 + v133 + v135) - (2.0d0*M_xxyyy + &
      24.0d0*v119 + 30.0d0*v120 + 28.0d0*v121 + 28.0d0*v122 + 48.0d0* &
      v124 + 48.0d0*v125 + 48.0d0*v126 + 48.0d0*v127 + 24.0d0*v128 + &
      v132 + 28.0d0*v134))
    S_xxxxz     = v109*z
    v504        = M_xz*S_xxxxz
    v632        = M_yz*S_xxxxz
    v643        = M_xx*S_xxxxz
    v711        = M_yy*S_xxxxz
    v816        = M_xy*S_xxxxz
    v862        = -0.20979020979021d0*v643
    v1631       = v862 + v863
    v991        = M_xxz*S_xxxxz
    v1062       = M_yyz*S_xxxxz
    v1211       = M_xyz*S_xxxxz
    v1252       = M_xxx*S_xxxxz
    v1332       = M_xyy*S_xxxxz
    v1479       = M_xxy*S_xxxxz
    v1546       = M_yyy*S_xxxxz
    Ms_xxxxz    = M_0*S_xxxxz + v141 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v145 &
      + 56.0d0*v146 + 106.0d0*(v142 + v149) + 4.0d0*(v143 + v158) + &
      104.0d0*(v144 + v152) + 32.0d0*(v150 + v154) + 48.0d0*(v151 + &
      v153) + 8.0d0*(v155 + v159) - (M_yyyyz + 36.0d0*v147 + 28.0d0* &
      v148 + 8.0d0*v156 + 5.0d0*v157 + 36.0d0*v160 + 8.0d0*v161))
    S_xxxyy     = x*(-v11*v12 + v107 + v162 + v67)
    v434        = M_xx*S_xxxyy
    v510        = M_yy*S_xxxyy
    v591        = M_xy*S_xxxyy
    v707        = M_xz*S_xxxyy
    v841        = M_yz*S_xxxyy
    v922        = M_xxx*S_xxxyy
    v1005       = M_xyy*S_xxxyy
    v1163       = M_xxy*S_xxxyy
    v1222       = M_yyy*S_xxxyy
    v1317       = M_xxz*S_xxxyy
    v1397       = M_yyz*S_xxxyy
    v1533       = M_xyz*S_xxxyy
    Ms_xxxyy    = M_0*S_xxxyy + v163 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v90 + &
      112.0d0*v91 - 14.0d0*v92 + 141.0d0*v94 - 3.0d0*(M_xyyyy + v104) + &
      75.0d0*(v102 + v89) + 159.0d0*(v87 + v98) + 276.0d0*(v93 + v97) - &
      60.0d0*(v100 + v103 + v106 + v99) - 18.0d0*(v101 + v86 + v88 + &
      v95) - 42.0d0*(v164 + v165 + v166 + v167 + v168 + v169))
    S_xxxyz     = v14*v9
    v529        = M_yz*S_xxxyz
    v606        = M_xz*S_xxxyz
    v694        = M_xy*S_xxxyz
    v787        = M_yy*S_xxxyz
    v795        = M_xx*S_xxxyz
    v855        = 0.839160839160839d0*v606
    v1021       = M_xyz*S_xxxyz
    v1176       = M_xxz*S_xxxyz
    v1239       = M_yyz*S_xxxyz
    v1302       = M_xxy*S_xxxyz
    v1380       = M_yyy*S_xxxyz
    v1442       = M_xxx*S_xxxyz
    v1519       = M_xyy*S_xxxyz
    v1604       = 3.35664335664336d0*v1021
    Ms_xxxyz    = 0.333333333333333d0*(5.0d0*(v170 + v171 + v183) + 7.0d0*(v173 + v174 + &
      v175) + 2.0d0*(-v176 + v177 - v178 + v180 + v181 - v182)) + M_0* &
      S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy*v172 + S_xx*v179 + S_xxy*v62 &
      + S_xyz*v57
    S_xxxzz     = -(S_xxxxx + S_xxxyy)
    v435        = M_xx*S_xxxzz
    v511        = M_yy*S_xxxzz
    v592        = M_xy*S_xxxzz
    v708        = M_xz*S_xxxzz
    v792        = M_yz*S_xxxzz
    v870        = 0.34965034965035d0*v708
    v923        = M_xxx*S_xxxzz
    v1006       = M_xyy*S_xxxzz
    v1164       = M_xxy*S_xxxzz
    v1223       = M_yyy*S_xxxzz
    v1318       = M_xxz*S_xxxzz
    v1398       = M_yyz*S_xxxzz
    v1534       = M_xyz*S_xxxzz
    S_xxyyy     = y*(-v10*v12 + v107 + v184)
    v482        = M_xy*S_xxyyy
    v546        = M_xx*S_xxyyy
    v608        = M_yy*S_xxyyy
    v738        = M_yz*S_xxyyy
    v829        = M_xz*S_xxyyy
    v967        = M_xxy*S_xxyyy
    v1036       = M_yyy*S_xxyyy
    v1118       = M_xxx*S_xxyyy
    v1187       = M_xyy*S_xxyyy
    v1362       = M_xyz*S_xxyyy
    v1506       = M_xxz*S_xxyyy
    v1575       = M_yyz*S_xxyyy
    Ms_xxyyy    = M_0*S_xxyyy + v112 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v120 &
      - 17.0d0*v132 + 112.0d0*v185 - 14.0d0*v186 - 3.0d0*(M_xxxxy + &
      v116) + 75.0d0*(v114 + v130) + 159.0d0*(v119 + v128) + 276.0d0*( &
      v124 + v125) - 60.0d0*(v113 + v118 + v126 + v127) - 18.0d0*(v129 &
      + v131 + v133 + v135) - 42.0d0*(v115 + v117 + v121 + v122 + v123 &
      + v134))
    S_xxyyz     = z*(0.0158730158730159d0*v32 + v162 + v184)
    v505        = M_xz*S_xxyyz
    v633        = M_yz*S_xxyyz
    v644        = M_xx*S_xxyyz
    v712        = M_yy*S_xxyyz
    v775        = M_xy*S_xxyyz
    v992        = M_xxz*S_xxyyz
    v1063       = M_yyz*S_xxyyz
    v1099       = M_xyz*S_xxyyz
    v1253       = M_xxx*S_xxyyz
    v1333       = M_xyy*S_xxyyz
    v1480       = M_xxy*S_xxyyz
    v1547       = M_yyy*S_xxyyz
    Ms_xxyyz    = 0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v138 + v139) + 9.0d0*(v145 + v157) + 112.0d0*(v148 + v187) + &
      6.0d0*(v144 + v152 + v156 + v161) + 132.0d0*(v147 + v151 + v153 + &
      v160) + 81.0d0*(v136 + v143 + v150 + v154 + v158) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v137 + 5.0d0*v140 + 6.0d0* &
      v142 + 14.0d0*v146 + 6.0d0*v149 + 6.0d0*v155 + 6.0d0*v159 + &
      14.0d0*v188))
    S_xxyzz     = -(S_xxxxy + S_xxyyy)
    v483        = M_xy*S_xxyzz
    v547        = M_xx*S_xxyzz
    v609        = M_yy*S_xxyzz
    v739        = M_yz*S_xxyzz
    v740        = 0.34965034965035d0*v739
    v785        = M_xz*S_xxyzz
    v968        = M_xxy*S_xxyzz
    v1037       = M_yyy*S_xxyzz
    v1119       = M_xxx*S_xxyzz
    v1188       = M_xyy*S_xxyzz
    v1363       = M_xyz*S_xxyzz
    v1507       = M_xxz*S_xxyzz
    v1576       = M_yyz*S_xxyzz
    S_xxzzz     = -(S_xxxxz + S_xxyyz)
    v506        = M_xz*S_xxzzz
    v539        = M_yz*S_xxzzz
    v645        = M_xx*S_xxzzz
    v713        = M_yy*S_xxzzz
    v776        = M_xy*S_xxzzz
    v993        = M_xxz*S_xxzzz
    v1064       = M_yyz*S_xxzzz
    v1100       = M_xyz*S_xxzzz
    v1254       = M_xxx*S_xxzzz
    v1334       = M_xyy*S_xxzzz
    v1481       = M_xxy*S_xxzzz
    v1548       = M_yyy*S_xxzzz
    S_xyyyy     = v189*x
    v436        = M_xx*S_xyyyy
    v512        = M_yy*S_xyyyy
    v593        = M_xy*S_xyyyy
    v709        = M_xz*S_xyyyy
    v842        = M_yz*S_xyyyy
    v924        = M_xxx*S_xyyyy
    v1007       = M_xyy*S_xyyyy
    v1165       = M_xxy*S_xyyyy
    v1224       = M_yyy*S_xyyyy
    v1319       = M_xxz*S_xyyyy
    v1399       = M_yyz*S_xyyyy
    v1607       = M_xyz*S_xyyyy
    Ms_xyyyy    = M_0*S_xyyyy + v163 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v104) + &
      4.0d0*(v102 + v89) + 78.0d0*(v103 + v99) + 56.0d0*(v164 + v165 + &
      v168) + 8.0d0*(v101 + v86 + v88 + v95) - (2.0d0*M_xxxyy + 48.0d0* &
      v100 + 48.0d0*v106 + 28.0d0*v166 + 28.0d0*v167 + 28.0d0*v169 + &
      24.0d0*v87 + v90 + 48.0d0*v93 + 30.0d0*v94 + 48.0d0*v97 + 24.0d0* &
      v98))
    S_xyyyz     = v15*v9
    v761        = M_yz*S_xyyyz
    v762        = 0.839160839160839d0*v761
    v763        = M_xx*S_xyyyz
    v831        = M_yy*S_xyyyz
    v856        = M_xz*S_xyyyz
    v867        = M_xy*S_xyyyz
    v1177       = M_xxz*S_xyyyz
    v1240       = M_yyz*S_xyyyz
    v1303       = M_xxy*S_xyyyz
    v1381       = M_yyy*S_xyyyz
    v1419       = M_xyz*S_xyyyz
    v1420       = 3.35664335664336d0*v1419
    v1443       = M_xxx*S_xyyyz
    v1520       = M_xyy*S_xyyyz
    Ms_xyyyz    = 0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v176 + v178 + v182) + &
      5.0d0*(v177 + v180 + v181) + 2.0d0*(v170 + v171 - v173 - v174 - &
      v175 + v183)) + M_0*S_xyyyz + M_xyy*v83 + M_xyyyz + M_yyyz*x + &
      S_xyy*v84 + S_yy*v179
    S_xyyzz     = -(S_xxxyy + S_xyyyy)
    v437        = M_xx*S_xyyzz
    v513        = M_yy*S_xyyzz
    v594        = M_xy*S_xyyzz
    v710        = M_xz*S_xyyzz
    v793        = M_yz*S_xyyzz
    v871        = 0.34965034965035d0*v710
    v925        = M_xxx*S_xyyzz
    v1008       = M_xyy*S_xyyzz
    v1166       = M_xxy*S_xyyzz
    v1225       = M_yyy*S_xyyzz
    v1320       = M_xxz*S_xyyzz
    v1400       = M_yyz*S_xyyzz
    v1535       = M_xyz*S_xyyzz
    S_xyzzz     = -(S_xxxyz + S_xyyyz)
    S_xzzzz     = -(S_xxxzz + S_xyyzz)
    S_yyyyy     = y*(0.111111111111111d0*(-10.0d0*v82) + v81 + v85)
    v484        = M_xy*S_yyyyy
    v548        = M_xx*S_yyyyy
    v610        = M_yy*S_yyyyy
    v741        = M_yz*S_yyyyy
    v830        = M_xz*S_yyyyy
    v969        = M_xxy*S_yyyyy
    v1038       = M_yyy*S_yyyyy
    v1120       = M_xxx*S_yyyyy
    v1189       = M_xyy*S_yyyyy
    v1364       = M_xyz*S_yyyyy
    v1508       = M_xxz*S_yyyyy
    v1577       = M_yyz*S_yyyyy
    Ms_yyyyy    = 0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v132 &
      - 30.0d0*(M_xxyyy + v120) + 330.0d0*(v129 + v131) - 140.0d0*(v185 &
      + v186) + 120.0d0*(v113 + v118 + v126 + v127) + 60.0d0*(v114 + &
      v119 + v128 + v130) - 300.0d0*(v124 + v125 + v133 + v135) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v110 + v111 + v116))
    S_yyyyz     = v189*z
    v507        = M_xz*S_yyyyz
    v634        = M_yz*S_yyyyz
    v635        = M_yy*S_yyyyz
    v636        = -0.20979020979021d0*v635
    v1628       = v636 + v638
    v646        = M_xx*S_yyyyz
    v817        = M_xy*S_yyyyz
    v994        = M_xxz*S_yyyyz
    v1065       = M_yyz*S_yyyyz
    v1212       = M_xyz*S_yyyyz
    v1255       = M_xxx*S_yyyyz
    v1335       = M_xyy*S_yyyyz
    v1482       = M_xxy*S_yyyyz
    v1549       = M_yyy*S_yyyyz
    Ms_yyyyz    = M_0*S_yyyyz + v141 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v157 &
      + 56.0d0*v188 + 8.0d0*(v142 + v149) + 32.0d0*(v143 + v158) + &
      48.0d0*(v147 + v160) + 4.0d0*(v150 + v154) + 106.0d0*(v155 + v159 &
      ) + 104.0d0*(v156 + v161) - (M_xxxxz + 8.0d0*v144 + 5.0d0*v145 + &
      36.0d0*v151 + 8.0d0*v152 + 36.0d0*v153 + 28.0d0*v187))
    S_yyyzz     = -(S_xxyyy + S_yyyyy)
    v485        = M_xy*S_yyyzz
    v549        = M_xx*S_yyyzz
    v611        = M_yy*S_yyyzz
    v742        = M_yz*S_yyyzz
    v743        = 0.34965034965035d0*v742
    v786        = M_xz*S_yyyzz
    v970        = M_xxy*S_yyyzz
    v1039       = M_yyy*S_yyyzz
    v1121       = M_xxx*S_yyyzz
    v1190       = M_xyy*S_yyyzz
    v1365       = M_xyz*S_yyyzz
    v1509       = M_xxz*S_yyyzz
    v1578       = M_yyz*S_yyyzz
    S_yyzzz     = -(S_xxyyz + S_yyyyz)
    v508        = M_xz*S_yyzzz
    v540        = M_yz*S_yyzzz
    v541        = 0.00233100233100233d0*(-75.0d0*v532 + 5.0d0*(v1622 + 6.0d0*v533 + 6.0d0* &
      v534 + v535 + 6.0d0*v536 + 6.0d0*v537 + v538 + 6.0d0*v539 + 6.0d0 &
      *v540))
    v647        = M_xx*S_yyzzz
    v714        = M_yy*S_yyzzz
    v751        = 0.00233100233100233d0*(-75.0d0*v750 + 5.0d0*(v1621 + 6.0d0*v466 + 6.0d0* &
      v479 + v480 + 6.0d0*v502 + 6.0d0*v506 + 6.0d0*v508 + 6.0d0*v527 + &
      v528))
    v777        = M_xy*S_yyzzz
    v794        = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 70.0d0*v764 + 5.0d0*(-3.0d0* &
      M_xxxyzzz - 3.0d0*M_xyyyzzz + 12.0d0*v763 + 12.0d0*v765 - 15.0d0* &
      v766 - 15.0d0*v767 - 3.0d0*v768 - 54.0d0*v769 - 114.0d0*v770 - &
      15.0d0*v771 - 3.0d0*v772 - 15.0d0*v773 - 3.0d0*v774 - 114.0d0* &
      v775 - 3.0d0*v776 - 3.0d0*v777 + 12.0d0*v778 - 15.0d0*v779 - &
      15.0d0*v780 - 3.0d0*v781 - 54.0d0*v782 - 15.0d0*v783 - 15.0d0* &
      v784 - 15.0d0*v785 - 15.0d0*v786 + 12.0d0*v787 - 15.0d0*v788 - &
      3.0d0*v789 - 15.0d0*v790 - 3.0d0*v791 - 15.0d0*v792 - 15.0d0*v793 &
      ))
    v995        = M_xxz*S_yyzzz
    v1066       = M_yyz*S_yyzzz
    v1101       = M_xyz*S_yyzzz
    v1256       = M_xxx*S_yyzzz
    v1336       = M_xyy*S_yyzzz
    v1483       = M_xxy*S_yyzzz
    v1550       = M_yyy*S_yyzzz
    S_yzzzz     = -(S_xxyzz + S_yyyzz)
    S_zzzzz     = -(S_xxzzz + S_yyzzz)
    S_xxxxxx    = v190 + v192 + 0.0909090909090909d0*(-15.0d0*v193 + 5.0d0*v194)
    v912        = M_xx*S_xxxxxx
    v1027       = M_yy*S_xxxxxx
    v1180       = M_xy*S_xxxxxx
    v1366       = M_xz*S_xxxxxx
    v1583       = M_yz*S_xxxxxx
    Ms_xxxxxx   = M_0*S_xxxxxx + M_yyyyz*v197 + v200 + 0.00432900432900433d0*(136.0d0* &
      M_xxxxxx - 75.0d0*M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + &
      2360.0d0*v206 + 576.0d0*v210 - 2340.0d0*v217 - 2260.0d0*v224 + &
      1440.0d0*v229 + 1620.0d0*(v201 + v208) - 600.0d0*(v211 + v212) - &
      120.0d0*(v218 + v238) + 840.0d0*(v222 + v247) - 160.0d0*(v239 + &
      v244) + 90.0d0*(-M_xxxxzz + v202 + v219) + 360.0d0*(v209 - v214 + &
      v233) + 30.0d0*(v223 + v242 + v243) - 180.0d0*(M_xxxxyy + v216 + &
      v230 + v231) + 720.0d0*(v207 + v220 + v228 + v234) - 1680.0d0*( &
      v213 + v215 + v227 + v232) - 165.0d0*(v203 + v204 + v205 + v225 + &
      v240 + v245) + 60.0d0*(v221 - v226 - v235 - v236 - v237 - v241 - &
      v246))
    S_xxxxxy    = v249*v6
    v1002       = M_xy*S_xxxxxy
    v1112       = M_xx*S_xxxxxy
    v1216       = M_yy*S_xxxxxy
    v1407       = M_yz*S_xxxxxy
    v1536       = M_xz*S_xxxxxy
    Ms_xxxxxy   = M_0*S_xxxxxy + v264 - v274*z + 0.0303030303030303d0*(-70.0d0*v273 - &
      10.0d0*v277 + 28.0d0*(M_xxxxxy + v269) + 20.0d0*(v266 + v283) - &
      60.0d0*(v275 + v296) + 100.0d0*(v268 + v270 + v280) + 190.0d0*( &
      v265 + v267 + v271 + v276) - 140.0d0*(v278 + v279 + v287 + v289) &
      - 5.0d0*(M_xyyyyy + v281 + v285 + v293 + v294) + 40.0d0*(-v272 + &
      v282 + v284 + v286 + v288 - v290 + v291 + v292 + v295 + v297))
    S_xxxxxz    = v249*v7
    v1022       = M_xz*S_xxxxxz
    v1243       = M_yz*S_xxxxxz
    v1247       = M_xx*S_xxxxxz
    v1375       = M_yy*S_xxxxxz
    v1514       = M_xy*S_xxxxxz
    Ms_xxxxxz   = M_0*S_xxxxxz + M_xxz*v316 + S_xxz*v300 - v307 - v312 - v329 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 68.0d0*v303 + 250.0d0*( &
      v298 + v308) + 220.0d0*(v302 + v331) + 80.0d0*(v309 + v336) + &
      90.0d0*(v313 + v332) - 140.0d0*(v315 + v320) + 160.0d0*(v317 + &
      v321) + 10890.0d0*(-M_xxxyyz + v306 - v314) + 100.0d0*(v304 - &
      v305 - v345) + 20.0d0*(v299 + v301 + v325 + v341) - 5.0d0*( &
      M_xxxzzz + M_xyyyyz + M_xyyzzz + v319 + v340 + v344) + 40.0d0*( &
      v322 - v323 + v326 - v330 + v337 - v338 + v342 - v346) - 25.0d0*( &
      v310 + v318 + v324 + v327 + v333 + v334 + v335 + v339 + v343))
    S_xxxxyy    = 0.0303030303030303d0*(-3.0d0*v193 + 2.0d0*v194) + v11*v350 + v348 + v349
    v913        = M_xx*S_xxxxyy
    v1028       = M_yy*S_xxxxyy
    v1181       = M_xy*S_xxxxyy
    v1367       = M_xz*S_xxxxyy
    v1584       = M_yz*S_xxxxyy
    Ms_xxxxyy   = M_0*S_xxxxyy + v351 - v352 - v356 + v359 + v361 + v362*(M_yyyyz + v0) + &
      0.00432900432900433d0*(-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - &
      11.0d0*M_xxxxzz - 5.0d0*M_yyyyyy - 4.0d0*M_yyyyzz - 64.0d0*v210 + &
      412.0d0*v211 - 36.0d0*v212 + 628.0d0*v214 + 1800.0d0*v217 - &
      720.0d0*v229 - 82.0d0*(v201 + v208) + 942.0d0*(v202 + v219) + &
      2.0d0*(v204 + v240) - 60.0d0*(v206 + v224) + 760.0d0*(v207 + v228 &
      ) + 1288.0d0*(v213 + v227) - 220.0d0*(v218 + v238) - 402.0d0*( &
      v220 + v234) - 392.0d0*(v222 + v247) + 37.0d0*(v236 + v241) + &
      80.0d0*(v239 + v244) + 268.0d0*(v209 - v221 + v233) - 8.0d0*(v223 &
      + v242 + v243) - 22.0d0*(M_xxyyyy + v216 + v230 + v231) - 26.0d0* &
      (v203 + v205 + v225 + v245) - 19.0d0*(v226 + v235 + v237 + v246) &
      - 448.0d0*(v353 + v354 + v355 + v357))
    S_xxxxyz    = v8*(-v347 + v31 + v350)
    v1073       = M_yz*S_xxxxyz
    v1213       = M_xz*S_xxxxyz
    v1327       = M_xy*S_xxxxyz
    v1437       = M_xx*S_xxxxyz
    v1541       = M_yy*S_xxxxyz
    Ms_xxxxyz   = M_0*S_xxxxyz + v371 + 0.0303030303030303d0*(26.0d0*v384 + 32.0d0*( &
      M_xxxxyz + v377) + 40.0d0*(v389 + v399) + 8.0d0*(v398 + v404) + &
      96.0d0*(v379 + v380 + v390) + 170.0d0*(v372 + v381 + v386 + v388 &
      ) + 4.0d0*(v373 + v387 + v397 + v403) + 160.0d0*(v374 + v378 + &
      v394 + v395) + 64.0d0*(v375 + v376 + v392 + v396 + v406) - (2.0d0 &
      *M_xxyyyz + 40.0d0*v382 + 18.0d0*v383 + 38.0d0*v385 + 64.0d0*v391 &
      + 64.0d0*v393 + 13.0d0*v400 + 5.0d0*v401 + v402 + 40.0d0*v405 + &
      18.0d0*v407 + 13.0d0*v408))
    S_xxxxzz    = -(S_xxxxxx + S_xxxxyy)
    v914        = M_xx*S_xxxxzz
    v1029       = M_yy*S_xxxxzz
    v1182       = M_xy*S_xxxxzz
    v1368       = M_xz*S_xxxxzz
    v1585       = M_yz*S_xxxxzz
    S_xxxyyy    = v6*(0.0909090909090909d0*v32 + v409 + v410 + v67)
    v900        = M_xy*S_xxxyyy
    v1113       = M_xx*S_xxxyyy
    v1217       = M_yy*S_xxxyyy
    v1408       = M_yz*S_xxxyyy
    v1537       = M_xz*S_xxxyyy
    Ms_xxxyyy   = 0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v250 + v261) + 75.0d0*(v252 + v259) + 69.0d0*(v253 + v256) + &
      25.0d0*(v273 + v277) + 31.0d0*(v266 + v272 + v283 + v290) - ( &
      M_xxxxxy + 11.0d0*M_xxxyz*v411 + M_xxxyzz + M_xyyyyy + 11.0d0* &
      M_xyyyz*v411 + M_xyyyzz + v251 + v254 + v255 + v257 + v258 + v260 &
      + v262 + v263 + 10.0d0*v265 + 10.0d0*v267 + 7.0d0*v268 + v269 + &
      7.0d0*v270 + 10.0d0*v271 + 6.0d0*v275 + 10.0d0*v276 + 10.0d0*v278 &
      + 10.0d0*v279 + 7.0d0*v280 + 7.0d0*v281 + 10.0d0*v282 + 10.0d0* &
      v284 + 7.0d0*v285 + 10.0d0*v286 + 10.0d0*v287 + 10.0d0*v288 + &
      10.0d0*v289 + 10.0d0*v291 + 10.0d0*v292 + 7.0d0*v293 + v294 + &
      10.0d0*v295 + 6.0d0*v296 + 10.0d0*v297 + 6.0d0*v412 + 6.0d0*v413 &
      ))
    S_xxxyyz    = v7*(0.0909090909090909d0*(-v34) + v410 + v414)
    v1023       = M_xz*S_xxxyyz
    v1244       = M_yz*S_xxxyyz
    v1248       = M_xx*S_xxxyyz
    v1376       = M_yy*S_xxxyyz
    v1515       = M_xy*S_xxxyyz
    Ms_xxxyyz   = M_0*S_xxxyyz + M_xxyy*v172 + S_xxyy*v62 + v307 + v312 + v329 + v415 + &
      0.0303030303030303d0*(31.0d0*M_xxxyyz + v303 + 47.0d0*v306 + &
      79.0d0*v314 + 103.0d0*(v299 + v325) + 55.0d0*(v301 + v341) + &
      88.0d0*(v305 + v345) + 43.0d0*(v309 + v336) + 152.0d0*(v315 + &
      v320) + 95.0d0*(v317 + v321) + 13.0d0*(v324 + v334 + v339) + &
      10.0d0*(v323 + v330 + v338 + v346) - (M_xyyyyz + 4.0d0*v298 + &
      v302 + 7.0d0*v304 + 4.0d0*v308 + 10.0d0*v322 + 10.0d0*v326 + v331 &
      + 10.0d0*v337 + v340 + 10.0d0*v342 + 18.0d0*v416 + 18.0d0*v417 + &
      18.0d0*v418))
    S_xxxyzz    = -(S_xxxxxy + S_xxxyyy)
    v901        = M_xy*S_xxxyzz
    v1114       = M_xx*S_xxxyzz
    v1218       = M_yy*S_xxxyzz
    v1409       = M_yz*S_xxxyzz
    v1538       = M_xz*S_xxxyzz
    S_xxxzzz    = -(S_xxxxxz + S_xxxyyz)
    v1024       = M_xz*S_xxxzzz
    v1109       = M_yz*S_xxxzzz
    v1249       = M_xx*S_xxxzzz
    v1377       = M_yy*S_xxxzzz
    v1516       = M_xy*S_xxxzzz
    S_xxyyyy    = 0.0303030303030303d0*(-3.0d0*v419 + 2.0d0*v421) + v10*v350 + v348 + v420
    v915        = M_xx*S_xxyyyy
    v1030       = M_yy*S_xxyyyy
    v1183       = M_xy*S_xxyyyy
    v1369       = M_xz*S_xxyyyy
    v1586       = M_yz*S_xxyyyy
    Ms_xxyyyy   = M_0*S_xxyyyy + v351 + v352 + v356 - v359 - v361 + v362*(M_xxxxz + v0) + &
      0.00432900432900433d0*(-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0 &
      *M_xxyyyy - 12.0d0*M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v217 + &
      628.0d0*v221 + 1800.0d0*v229 + 412.0d0*v230 - 64.0d0*v242 - &
      36.0d0*v422 + 37.0d0*(v201 + v208) - 402.0d0*(v202 + v219) + &
      80.0d0*(v206 + v224) - 220.0d0*(v207 + v228) + 2.0d0*(v209 + v233 &
      ) + 760.0d0*(v218 + v238) + 942.0d0*(v220 + v234) - 82.0d0*(v236 &
      + v241) - 60.0d0*(v239 + v244) + 1288.0d0*(v353 + v354) - 392.0d0 &
      *(v355 + v357) + 268.0d0*(v204 - v214 + v240) - 8.0d0*(v210 + &
      v216 + v231) - 22.0d0*(M_xxxxyy + v211 + v223 + v243) - 19.0d0*( &
      v203 + v205 + v225 + v245) - 448.0d0*(v213 + v222 + v227 + v247) &
      - 26.0d0*(v226 + v235 + v237 + v246))
    S_xxyyyz    = v8*(0.0909090909090909d0*(-v82) + v409 + v414)
    v1074       = M_yz*S_xxyyyz
    v1214       = M_xz*S_xxyyyz
    v1328       = M_xy*S_xxyyyz
    v1438       = M_xx*S_xxyyyz
    v1542       = M_yy*S_xxyyyz
    Ms_xxyyyz   = M_0*S_xxyyyz + v371 + v423 + v425 + v426 + 0.0303030303030303d0*(31.0d0* &
      M_xxyyyz + 47.0d0*v384 + 79.0d0*v385 + v401 + 43.0d0*(v373 + v403 &
      ) + 95.0d0*(v382 + v405) + 99.0d0*(v383 + v407) + 103.0d0*(v387 + &
      v397) + 55.0d0*(v389 + v399) + 152.0d0*(v391 + v393) + 88.0d0*( &
      v392 + v396) + 13.0d0*(v375 + v376 + v406) + 10.0d0*(v374 + v378 &
      + v394 + v395) - (M_xxxxyz + 10.0d0*v372 + v377 + 18.0d0*v379 + &
      18.0d0*v380 + 10.0d0*v381 + 10.0d0*v386 + 10.0d0*v388 + 18.0d0* &
      v390 + 4.0d0*v398 + v400 + 7.0d0*v402 + 4.0d0*v404 + v408))
    S_xxyyzz    = -(S_xxxxyy + S_xxyyyy)
    v916        = M_xx*S_xxyyzz
    v1031       = M_yy*S_xxyyzz
    v1092       = M_xy*S_xxyyzz
    v1370       = M_xz*S_xxyyzz
    v1433       = M_yz*S_xxyyzz
    S_xxyzzz    = -(S_xxxxyz + S_xxyyyz)
    v1075       = M_yz*S_xxyzzz
    v1102       = M_xz*S_xxyzzz
    v1329       = M_xy*S_xxyzzz
    v1439       = M_xx*S_xxyzzz
    v1543       = M_yy*S_xxyzzz
    S_xxzzzz    = -(S_xxxxzz + S_xxyyzz)
    v917        = M_xx*S_xxzzzz
    v1032       = M_yy*S_xxzzzz
    v1093       = M_xy*S_xxzzzz
    v1371       = M_xz*S_xxzzzz
    v1434       = M_yz*S_xxzzzz
    S_xyyyyy    = v427*v6
    v1003       = M_xy*S_xyyyyy
    v1115       = M_xx*S_xyyyyy
    v1219       = M_yy*S_xyyyyy
    v1410       = M_yz*S_xyyyyy
    v1539       = M_xz*S_xyyyyy
    Ms_xyyyyy   = M_0*S_xyyyyy + v264 - v424*z + 0.0303030303030303d0*(-10.0d0*v273 - &
      70.0d0*v277 + 28.0d0*(M_xyyyyy + v294) + 20.0d0*(v272 + v290) - &
      60.0d0*(v412 + v413) + 100.0d0*(v281 + v285 + v293) + 190.0d0*( &
      v282 + v284 + v291 + v292) - 140.0d0*(v286 + v288 + v295 + v297) &
      - 5.0d0*(M_xxxxxy + v268 + v269 + v270 + v280) + 40.0d0*(v265 - &
      v266 + v267 + v271 + v276 + v278 + v279 - v283 + v287 + v289))
    S_xyyyyz    = v7*(0.0909090909090909d0*(-6.0d0*v82) + v350 + v81)
    v1025       = M_xz*S_xyyyyz
    v1245       = M_yz*S_xyyyyz
    v1250       = M_xx*S_xyyyyz
    v1378       = M_yy*S_xyyyyz
    v1517       = M_xy*S_xyyyyz
    Ms_xyyyyz   = M_0*S_xyyyyz + v415 + 0.0303030303030303d0*(26.0d0*v306 + 32.0d0*( &
      M_xyyyyz + v340) + 8.0d0*(v298 + v308) + 40.0d0*(v301 + v341) + &
      96.0d0*(v416 + v417 + v418) + 4.0d0*(v299 + v309 + v325 + v336) + &
      170.0d0*(v322 + v326 + v337 + v342) + 160.0d0*(v323 + v330 + v338 &
      + v346) + 64.0d0*(v305 + v324 + v334 + v339 + v345) - (2.0d0* &
      M_xxxyyz + 13.0d0*v302 + 5.0d0*v303 + v304 + 18.0d0*v313 + 38.0d0 &
      *v314 + 64.0d0*v315 + 40.0d0*v317 + 64.0d0*v320 + 40.0d0*v321 + &
      13.0d0*v331 + 18.0d0*v332))
    S_xyyyzz    = -(S_xxxyyy + S_xyyyyy)
    v902        = M_xy*S_xyyyzz
    v911        = 0.000777000777000777d0*(33768.0d0*v892 + 7.0d0*(v1627 - 576.0d0*v887 + &
      192.0d0*v888 - 1536.0d0*v889 + 768.0d0*v890 + 384.0d0*v891 - &
      324.0d0*v893 - 324.0d0*v894 - 324.0d0*v896 + 768.0d0*v900 + &
      384.0d0*v901 + 384.0d0*v902 - 1536.0d0*v903 + 192.0d0*v904 + &
      384.0d0*v905 - 576.0d0*v906 - 324.0d0*v907))
    v1116       = M_xx*S_xyyyzz
    v1220       = M_yy*S_xyyyzz
    v1411       = M_yz*S_xyyyzz
    v1416       = 0.000777000777000777d0*(-495.0d0*M_xxxxyyyy + v1627 - 20124.0d0*v892 + &
      711.0d0*(v887 + v906) - 402.0d0*(v888 + v904) - 4704.0d0*(v889 + &
      v903) - 9528.0d0*(v890 + v900) - 804.0d0*(v891 + v901 + v902 + &
      v905) - 621.0d0*(v893 + v894 + v896 + v907))
    v1540       = M_xz*S_xyyyzz
    S_xyyzzz    = -(S_xxxyyz + S_xyyyyz)
    v1026       = M_xz*S_xyyzzz
    v1110       = M_yz*S_xyyzzz
    v1251       = M_xx*S_xyyzzz
    v1379       = M_yy*S_xyyzzz
    v1518       = M_xy*S_xyyzzz
    S_xyzzzz    = -(S_xxxyzz + S_xyyyzz)
    S_xzzzzz    = -(S_xxxzzz + S_xyyzzz)
    S_yyyyyy    = v192 + v428 + 0.0909090909090909d0*(-15.0d0*v419 + 5.0d0*v421)
    v918        = M_xx*S_yyyyyy
    v1184       = M_xy*S_yyyyyy
    v1372       = M_xz*S_yyyyyy
    v1421       = M_yy*S_yyyyyy
    v1587       = M_yz*S_yyyyyy
    Ms_yyyyyy   = M_0*S_yyyyyy + v200 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v217 - &
      2340.0d0*v229 + 2360.0d0*v239 + 576.0d0*v242 - 2260.0d0*v244 - &
      160.0d0*(v206 + v224) - 120.0d0*(v207 + v228) - 600.0d0*(v230 + &
      v422) + 1620.0d0*(v236 + v241) + 840.0d0*(v355 + v357) + 90.0d0*( &
      -M_yyyyzz + v220 + v234) + 360.0d0*(v204 - v221 + v240) - 180.0d0 &
      *(M_xxyyyy + v211 + v223 + v243) + 720.0d0*(v202 + v218 + v219 + &
      v238) + 30.0d0*(v210 + v212 + v216 + v231) - 1680.0d0*(v353 + &
      v354 + v358 + v360) - 165.0d0*(v209 + v226 + v233 + v235 + v237 + &
      v246) + 60.0d0*(-v201 - v203 - v205 - v208 + v214 - v225 - v245))
    S_yyyyyz    = v427*v8
    v1076       = M_yz*S_yyyyyz
    v1215       = M_xz*S_yyyyyz
    v1330       = M_xy*S_yyyyyz
    v1440       = M_xx*S_yyyyyz
    v1544       = M_yy*S_yyyyyz
    Ms_yyyyyz   = M_0*S_yyyyyz + M_yyy*v429 + M_yyz*v430 - v423 - v425 - v426 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 68.0d0*v401 + 80.0d0*( &
      v373 + v403) + 160.0d0*(v382 + v405) + 90.0d0*(v383 + v407) - &
      140.0d0*(v391 + v393) + 250.0d0*(v398 + v404) + 220.0d0*(v400 + &
      v408) + 10890.0d0*(-M_xxyyyz + v384 - v385) + 100.0d0*(-v392 - &
      v396 + v402) + 20.0d0*(v387 + v389 + v397 + v399) - 5.0d0*( &
      M_xxxxyz + M_xxyzzz + M_yyyzzz + v365 + v368 + v377) + 40.0d0*( &
      v372 - v374 - v378 + v381 + v386 + v388 - v394 - v395) - 25.0d0*( &
      v363 + v364 + v366 + v367 + v369 + v370 + v375 + v376 + v406))
    S_yyyyzz    = -(S_xxyyyy + S_yyyyyy)
    v919        = M_xx*S_yyyyzz
    v1033       = M_yy*S_yyyyzz
    v1185       = M_xy*S_yyyyzz
    v1373       = M_xz*S_yyyyzz
    v1588       = M_yz*S_yyyyzz
    S_yyyzzz    = -(S_xxyyyz + S_yyyyyz)
    v1077       = M_yz*S_yyyzzz
    v1103       = M_xz*S_yyyzzz
    v1331       = M_xy*S_yyyzzz
    v1441       = M_xx*S_yyyzzz
    v1545       = M_yy*S_yyyzzz
    S_yyzzzz    = -(S_xxyyzz + S_yyyyzz)
    v920        = M_xx*S_yyzzzz
    v1034       = M_yy*S_yyzzzz
    v1094       = M_xy*S_yyzzzz
    v1111       = 0.00699300699300699d0*(-35.0d0*M_xxxyyyzz + 84.0d0*v1080 + 7.0d0*(6.0d0* &
      v1081 - 8.0d0*v1082 + 6.0d0*v1083 + v1084 + 228.0d0*v1085 - &
      15.0d0*v1086 + 208.0d0*v1087 + 6.0d0*v1088 + v1089 + 6.0d0*v1090 &
      + v1091 - 15.0d0*v1092 + v1093 + v1094 + 6.0d0*v1095 + 208.0d0* &
      v1096 + 6.0d0*v1097 + v1098 + 228.0d0*v1099 + 6.0d0*v1100 + 6.0d0 &
      *v1101 + 6.0d0*v1102 + 6.0d0*v1103 - 8.0d0*v1104 + 6.0d0*v1105 + &
      v1106 + 6.0d0*v1107 + v1108 + 6.0d0*v1109 + 6.0d0*v1110 + v1623))
    v1374       = M_xz*S_yyzzzz
    v1435       = M_yz*S_yyzzzz
    v1436       = 0.00699300699300699d0*(-21.0d0*v1426 + v1429 + v1432 + v1625 - 105.0d0*( &
      v1425 + v1433) + 7.0d0*(v1427 + v1428 + v1430 + v1431 + v1434 + &
      v1435))
    v1593       = 0.00233100233100233d0*(-45.0d0*M_xxxyyyzz - 464.0d0*v1080 - 644.0d0*( &
      v1082 + v1104) - 3096.0d0*(v1085 + v1099) - 135.0d0*(v1086 + &
      v1092) - 3276.0d0*(v1087 + v1096) + 9.0d0*(M_xxxyzzzz + &
      M_xyyyzzzz + v1084 + v1089 + v1091 + v1093 + v1094 + v1098 + &
      v1106 + v1108) + 54.0d0*(v1081 + v1083 + v1088 + v1090 + v1095 + &
      v1097 + v1100 + v1101 + v1102 + v1103 + v1105 + v1107 + v1109 + &
      v1110))
    v1598       = 0.00699300699300699d0*(v1326 + v1406 - 21.0d0*v1597 + v1624 - 105.0d0*( &
      v1311 + v1370) + 7.0d0*(v1301 + v1325 + v1360 + v1371 + v1374 + &
      v1405))
    S_yzzzzz    = -(S_xxyzzz + S_yyyzzz)
    S_zzzzzz    = -(S_xxzzzz + S_yyzzzz)
    S_xxxxxxx   = x*(v190 + v431 + 0.00699300699300699d0*(-231.0d0*v193 + 105.0d0*v194))
    Ms_xxxxxxx  = M_0*S_xxxxxxx + v432 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*v447 - 1260.0d0*v451 - 630.0d0*v453 - 525.0d0*x*(M_xxyyyy &
      + M_xxyyzz) + 70.0d0*(M_xyyyyyy + v519) + 3444.0d0*(v433 + v445) &
      - 1050.0d0*(v434 + v456) + 6860.0d0*(v438 + v443) + 1470.0d0*( &
      v439 + v469) - 1176.0d0*(v448 + v449) - 7980.0d0*(v454 + v467) + &
      1680.0d0*(v457 + v510) - 7420.0d0*(v462 + v475) + 5040.0d0*(v470 &
      + v487) + 5880.0d0*(v473 + v503) + 105.0d0*(-M_xxxyyyy + &
      M_xyyyyzz + v521) + 35.0d0*(M_xxxzzzz + M_xyyzzzz + v480 + v528) &
      + 2520.0d0*(v444 + v460 + v486 + v529) - 4200.0d0*(v450 + v452 + &
      v481 + v504) - 280.0d0*(v463 + v476 + v498 + v523) - 1120.0d0*( &
      v492 + v499 + v515 + v524) - 1155.0d0*(v435 + v436 + v437 + v464 &
      + v493 + v500) - 735.0d0*(v440 + v441 + v442 + v477 + v516 + v525 &
      ) + 840.0d0*(v446 - v455 - v468 - v491 + v509 - v514) + 420.0d0*( &
      -M_xxxxxyy + v458 + v459 - v465 + v471 + v472 - v478 + v482 - &
      v488 - v489 - v490 - v494 - v501 + v505 - v511 - v512 - v513 - &
      v517 - v526) + 210.0d0*(-M_xxxxxzz + v461 + v466 + v474 + v479 + &
      v483 + v484 + v485 + v495 + v496 + v497 + v502 + v506 + v507 + &
      v508 + v518 + v520 + v522 + v527))
    S_xxxxxxy   = v531*y
    Ms_xxxxxxy  = M_0*S_xxxxxxy + v541 - v542 + v543 + v544 + 0.00233100233100233d0*( &
      -105.0d0*M_xxyyyyy + 10.0d0*M_yyyyyyy - 1200.0d0*v559 - 120.0d0* &
      v562 - 45.0d0*y*(M_xxyyyy - M_yyyyzz) + 304.0d0*(M_xxxxxxy + v555 &
      ) + 150.0d0*(v546 + v578) + 4640.0d0*(v550 + v563) - 3870.0d0*( &
      v572 + v576) - 315.0d0*(v574 + v617) + 840.0d0*(v577 + v613) + &
      1020.0d0*(v579 + v608) + 1140.0d0*(v581 + v633) - 3940.0d0*(v582 &
      + v586) + 1040.0d0*(v583 + v628) - 220.0d0*(v615 + v618) - &
      160.0d0*(v625 + v629) + 1344.0d0*(v554 + v556 + v590) + 40.0d0*( &
      -v587 + v621 - v624) - 2880.0d0*(v567 + v569 + v604 + v606) + &
      960.0d0*(v551 - v560 - v561 + v597 - v632) + 480.0d0*(v553 - v558 &
      - v566 - v607 + v612) + 60.0d0*(v580 - v589 - v614 - v616 - v631 &
      ) + 3360.0d0*(v545 + v552 + v557 - v565 + v571 - v591) + 1920.0d0 &
      *(-v564 - v595 + v596 + v598 + v602 + v605) + 30.0d0*(-v585 - &
      v609 - v610 - v611 - v620 + v622 + v623 - v627 + v634) - 240.0d0* &
      (M_xxxxyyy + v568 + v570 + v592 + v593 + v594 + v599 + v600 + &
      v601 + v603) - 195.0d0*(v547 + v548 + v549 + v573 + v575 + v584 + &
      v588 + v619 + v626 + v630))
    S_xxxxxxz   = v531*z
    Ms_xxxxxxz  = M_0*S_xxxxxxz + v1628 + v1635 + v641 - v657 + v684 + v723 + v727 + v740 &
      + v743 + 0.00233100233100233d0*(304.0d0*M_xxxxxxz - 105.0d0* &
      M_xxyyyyz + 10.0d0*M_yyyyyyz + 784.0d0*v653 + 1344.0d0*v654 - &
      600.0d0*v661 - 555.0d0*v675 + 40.0d0*v720 + 30.0d0*v745 + &
      4320.0d0*(v643 + v659) + 7520.0d0*(v648 + v666) + 6720.0d0*(v650 &
      + v685) + 3264.0d0*(v652 + v706) + 1440.0d0*(v660 + v711) - &
      4800.0d0*(v662 + v704) - 2880.0d0*(v665 + v694) + 3840.0d0*(v667 &
      + v695) - 5100.0d0*(v670 + v681) + 2970.0d0*(v672 + v686) + &
      1080.0d0*(v673 + v729) - 780.0d0*(v674 + v738) + 900.0d0*(v678 + &
      v712) - 735.0d0*(v688 + v717) - 160.0d0*(v716 + v725) + 150.0d0*( &
      v719 + v741) - 120.0d0*(M_xxxxzzz + v671 + v724) + 960.0d0*(v649 &
      - v658 + v700) + 60.0d0*(v676 + v718 + v731) - 240.0d0*(M_xxxxyyz &
      + v669 + v699 + v703) - 775.0d0*(v687 + v689 + v690 + v733) - &
      100.0d0*(v691 + v730 + v732 + v734) + 480.0d0*(v651 + v663 - v664 &
      + v707 + v728) + 90.0d0*(v644 + v677 - v693 - v713 - v714 - v736 &
      ) - 225.0d0*(v645 + v646 + v647 + v692 + v721 + v735) + 1920.0d0* &
      (-v655 + v696 - v697 + v701 - v705 - v737) - 1200.0d0*(v668 + &
      v682 + v698 + v702 + v708 + v709 + v710 + v715))
    S_xxxxxyy   = x*(0.00699300699300699d0*(10.0d0*v194) + v11*v747 + v1629 + v349 + v746)
    Ms_xxxxxyy  = M_0*S_xxxxxyy + v751 - v752 + v753 + v756 + v758 + v760 + v762 + &
      0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0*M_xxxxxyy - &
      116.0d0*v447 + 732.0d0*v448 - 36.0d0*v449 + 1350.0d0*v451 - &
      45.0d0*v453 - 780.0d0*v458 - 600.0d0*v459 - 35.0d0*(M_xyyyyyy + &
      v519) - 210.0d0*(v433 + v445) + 2550.0d0*(v434 + v456) - 190.0d0* &
      (v438 + v443) + 2730.0d0*(v439 + v469) + 1620.0d0*(v444 + v486) + &
      444.0d0*(v446 + v509) + 2820.0d0*(v450 + v481) + 5160.0d0*(v454 + &
      v467) - 420.0d0*(v455 + v514) - 1110.0d0*(v457 + v510) - 1080.0d0 &
      *(v460 + v529) - 100.0d0*(v462 + v475) - 700.0d0*(v463 + v523) - &
      1380.0d0*(v468 + v491) - 2790.0d0*(v470 + v487) - 1740.0d0*(v471 &
      + v482) - 1560.0d0*(v472 + v505) - 2760.0d0*(v473 + v503) - &
      1660.0d0*(v476 + v498) + 255.0d0*(v489 + v494 + v512 + v517) + &
      560.0d0*(v492 + v499 + v515 + v524) + 30.0d0*(-M_xyyyyzz + v496 + &
      v507 + v520 - v521) - 120.0d0*(v435 + v437 + v464 + v500 + v754) &
      + 90.0d0*(-M_xxxyyyy - v440 + v441 - v442 - v477 + v516 - v525) - &
      105.0d0*(v465 + v478 + v488 + v490 + v501 + v511 + v513 + v526) + &
      60.0d0*(v436 - v452 - v461 - v474 - v483 - v484 - v485 + v493 - &
      v495 - v497 - v504 - v518 - v522))
    S_xxxxxyz   = v9*(-v748 + v31 + v747)
    Ms_xxxxxyz  = M_0*S_xxxxxyz + M_xxyz*v316 + S_xxyz*v300 + v794 + 0.00699300699300699d0 &
      *(-250.0d0*v806 - 30.0d0*v813 + 128.0d0*(M_xxxxxyz + v800) - &
      270.0d0*(v805 + v841) + 390.0d0*(v812 + v829) + 1430.0d0*(M_xxxy* &
      S_xxz + M_xxz*S_xxxy) + 288.0d0*(v798 + v799 + v840) + 480.0d0*( &
      v802 + v803 + v816) - 75.0d0*(v822 + v830 + v834) + 1110.0d0*( &
      v795 + v807 + v808 + v810) + 60.0d0*(v796 + v814 + v818 + v837) + &
      960.0d0*(v797 + v801 + v826 + v828) + 280.0d0*(-v804 + v809 + &
      v832 - v839) + 600.0d0*(-v811 + v815 + v820 - v825) + 120.0d0*( &
      v819 + v824 + v831 + v838) - 195.0d0*(v821 + v827 + v833 + v842) &
      - 15.0d0*(M_xyyyyyz + v817 + v823 + v835 + v836))
    S_xxxxyyy   = y*(v1630 + v847 + 0.00699300699300699d0*(-33.0d0*v193 + 18.0d0*v194))
    Ms_xxxxyyy  = M_0*S_xxxxyyy + v849 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v535 + v538 + 330.0d0*v559 + 380.0d0*v566 &
      + 630.0d0*(v546 + v578) + 560.0d0*(v551 + v597) + 200.0d0*(v553 + &
      v612) + 420.0d0*(v558 + v607) + 1320.0d0*(v564 + v595) + 1140.0d0 &
      *(v565 + v591) + 1710.0d0*(v572 + v576) + 9.0d0*(v610 + v620) + &
      25.0d0*(v615 + v618) + 30.0d0*(v623 + v634) + 40.0d0*(v625 + v629 &
      ) + 6.0d0*(v533 + v534 + v536 + v537 + v539 + v540 + v622) - ( &
      16.0d0*M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + &
      M_yyyyyyy + 15.0d0*v532 + 150.0d0*v545 + 30.0d0*v547 + 18.0d0* &
      v548 + 30.0d0*v549 + 140.0d0*v550 + 150.0d0*v552 + 96.0d0*v554 + &
      16.0d0*v555 + 96.0d0*v556 + 150.0d0*v557 + 60.0d0*v560 + 60.0d0* &
      v561 + 15.0d0*v562 + 140.0d0*v563 + 30.0d0*v568 + 30.0d0*v570 + &
      150.0d0*v571 + 30.0d0*v573 + 150.0d0*v574 + 30.0d0*v575 + 270.0d0 &
      *v577 + 270.0d0*v579 + 120.0d0*v580 + 240.0d0*v581 + 140.0d0*v582 &
      + 260.0d0*v583 + 30.0d0*v584 + 15.0d0*v585 + 140.0d0*v586 + &
      140.0d0*v587 + 30.0d0*v588 + 15.0d0*v589 + 96.0d0*v590 + 30.0d0* &
      v592 + 270.0d0*v593 + 30.0d0*v594 + 480.0d0*v596 + 480.0d0*v598 + &
      270.0d0*v599 + 30.0d0*v600 + 30.0d0*v601 + 480.0d0*v602 + 30.0d0* &
      v603 + 480.0d0*v605 + 270.0d0*v608 + 15.0d0*v609 + 15.0d0*v611 + &
      270.0d0*v613 + 15.0d0*v614 + 15.0d0*v616 + 150.0d0*v617 + 18.0d0* &
      v619 + v621 + 140.0d0*v624 + 30.0d0*v626 + 15.0d0*v627 + 260.0d0* &
      v628 + 30.0d0*v630 + 15.0d0*v631 + 60.0d0*v632 + 240.0d0*v633 + &
      143.0d0*v850 + 143.0d0*v851 + 150.0d0*v852 + 240.0d0*v853 + &
      143.0d0*v854 + 143.0d0*v855 + 240.0d0*v856))
    S_xxxxyyz   = z*(0.00699300699300699d0*(6.0d0*v194) + v1630 + v746 + v857)
    Ms_xxxxyyz  = M_0*S_xxxxyyz + v1631 + v859 + v860 - v861 - v864 - v865 + v866 - v869 - &
      v870 - v871 + 0.00233100233100233d0*(-7.0d0*M_yyyyyyz - 6.0d0* &
      M_yyyyzzz + 690.0d0*v656 + 780.0d0*v658 + 1260.0d0*v664 - 37.0d0* &
      v720 - 12.0d0*v745 - 16.0d0*(M_xxxxxxz + v653) + 45.0d0*(v635 + &
      v637) - 20.0d0*(v648 + v666) + 2160.0d0*(v649 + v700) - 90.0d0*( &
      v650 + v685) + 840.0d0*(v651 + v728) + 1380.0d0*(v655 + v737) + &
      540.0d0*(v660 + v711) + 3720.0d0*(v662 + v704) + 1860.0d0*(v663 + &
      v707) + 2520.0d0*(v665 + v694) + 1560.0d0*(v667 + v695) + &
      4200.0d0*(v670 + v681) - 450.0d0*(v673 + v729) - 270.0d0*(v678 + &
      v712) + 300.0d0*(v682 + v715) + 330.0d0*(v688 + v717) + 570.0d0*( &
      v698 + v709) + 40.0d0*(v716 + v725) - 105.0d0*(v718 + v731) - &
      132.0d0*(v719 + v741) - 720.0d0*(v867 + v868) - 96.0d0*(v652 + &
      v654 + v706) - 420.0d0*(v671 + v676 + v724) + 2250.0d0*(v644 + &
      v672 + v677 + v686) - 36.0d0*(v645 + v647 + v692 + v735) - &
      110.0d0*(v687 + v689 + v690 + v733) - 65.0d0*(v691 + v730 + v732 &
      + v734) - 27.0d0*(v693 + v713 + v714 + v736) + 480.0d0*(-v696 + &
      v697 - v701 + v705) - 30.0d0*(M_xxyyyyz + v669 + v699 + v703 + &
      v722) + 60.0d0*(v674 - v683 - v726 + v738 - v739 - v742))
    S_xxxyyyy   = x*(v1632 + v847 + 0.00699300699300699d0*(-33.0d0*v419 + 18.0d0*v421))
    Ms_xxxyyyy  = M_0*S_xxxyyyy + v753 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + 380.0d0*v458 + v480 + v528 + 330.0d0*v754 &
      + 9.0d0*(v433 + v445) + 420.0d0*(v436 + v493) + 25.0d0*(v438 + &
      v443) + 200.0d0*(v441 + v516) + 30.0d0*(v452 + v504) + 560.0d0*( &
      v455 + v514) + 630.0d0*(v457 + v510) + 40.0d0*(v462 + v475) + &
      1320.0d0*(v468 + v491) + 1710.0d0*(v470 + v487) + 1140.0d0*(v471 &
      + v482) + 6.0d0*(v449 + v466 + v479 + v502 + v506 + v508 + v527) &
      - (M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + 270.0d0*v434 + 15.0d0*v435 + 15.0d0*v437 + 270.0d0* &
      v439 + 15.0d0*v440 + 15.0d0*v442 + 150.0d0*v444 + 18.0d0*v446 + &
      v447 + 30.0d0*v448 + 270.0d0*v450 + 150.0d0*v451 + 480.0d0*v454 + &
      270.0d0*v456 + 120.0d0*v459 + 240.0d0*v460 + 30.0d0*v461 + &
      140.0d0*v463 + 15.0d0*v464 + 30.0d0*v465 + 480.0d0*v467 + 270.0d0 &
      *v469 + 240.0d0*v472 + 480.0d0*v473 + 30.0d0*v474 + 260.0d0*v476 &
      + 15.0d0*v477 + 30.0d0*v478 + 270.0d0*v481 + 30.0d0*v483 + 96.0d0 &
      *v484 + 30.0d0*v485 + 150.0d0*v486 + 30.0d0*v488 + 150.0d0*v489 + &
      30.0d0*v490 + 140.0d0*v492 + 150.0d0*v494 + 96.0d0*v495 + 60.0d0* &
      v496 + 30.0d0*v497 + 260.0d0*v498 + 140.0d0*v499 + 15.0d0*v500 + &
      30.0d0*v501 + 480.0d0*v503 + 240.0d0*v505 + 60.0d0*v507 + 18.0d0* &
      v509 + 30.0d0*v511 + 150.0d0*v512 + 30.0d0*v513 + 140.0d0*v515 + &
      150.0d0*v517 + 96.0d0*v518 + 16.0d0*v519 + 60.0d0*v520 + 15.0d0* &
      v521 + 30.0d0*v522 + 140.0d0*v523 + 140.0d0*v524 + 15.0d0*v525 + &
      30.0d0*v526 + 240.0d0*v529 + 15.0d0*v750 + 143.0d0*v756 + 143.0d0 &
      *v758 + 143.0d0*v760 + 143.0d0*v762))
    S_xxxyyyz   = v9*(v67 + 0.00699300699300699d0*(9.0d0*v32 + 3.0d0*(-11.0d0*v34 - 11.0d0 &
      *v82)))
    Ms_xxxyyyz  = 0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*v764 + 945.0d0*(v770 + v775) + 345.0d0*(v806 + v813) + &
      245.0d0*(v796 + v809 + v832 + v837) + 525.0d0*(v804 + v815 + v820 &
      + v839) + 1125.0d0*(v769 + v782 + v811 + v814 + v818 + v825) + &
      21.0d0*(v798 + v799 + v822 + v830 + v834 + v840) - 75.0d0*(v802 + &
      v803 + v816 + v817 + v823 + v836) + 465.0d0*(v763 + v765 + v778 + &
      v787 + v805 + v812 + v829 + v841) - 60.0d0*(v795 + v807 + v808 + &
      v810 + v819 + v824 + v831 + v838) + 15.0d0*(v797 + v801 + v821 + &
      v826 + v827 + v828 + v833 + v842) - 9.0d0*(M_xxxxxyz + M_xxxyzzz &
      + M_xyyyyyz + M_xyyyzzz + v768 + v772 + v774 + v776 + v777 + v781 &
      + v789 + v791 + v800 + v835) - 45.0d0*(v766 + v767 + v771 + v773 &
      + v779 + v780 + v783 + v784 + v785 + v786 + v788 + v790 + v792 + &
      v793))
    S_xxyyyyy   = y*(0.00699300699300699d0*(10.0d0*v421) + v10*v747 + v1629 + v420 + v873)
    Ms_xxyyyyy  = M_0*S_xxyyyyy + v541 - v544 + v849 + v850 + v851 + v854 + v855 + &
      0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0*M_yyyyyyy - &
      780.0d0*v566 - 600.0d0*v580 + 732.0d0*v600 - 116.0d0*v621 - &
      36.0d0*v622 + 1350.0d0*v852 - 45.0d0*v874 - 35.0d0*(M_xxxxxxy + &
      v555) - 1110.0d0*(v546 + v578) + 444.0d0*(v548 + v619) - 420.0d0* &
      (v551 + v597) - 1380.0d0*(v564 + v595) - 1740.0d0*(v565 + v591) - &
      2790.0d0*(v572 + v576) + 1620.0d0*(v574 + v617) + 2730.0d0*(v577 &
      + v613) + 2550.0d0*(v579 + v608) - 1560.0d0*(v581 + v633) - &
      1660.0d0*(v583 + v628) - 700.0d0*(v587 + v624) + 2820.0d0*(v593 + &
      v599) + 5160.0d0*(v596 + v598) - 2760.0d0*(v602 + v605) - 210.0d0 &
      *(v610 + v620) - 190.0d0*(v615 + v618) - 100.0d0*(v625 + v629) - &
      1080.0d0*(v853 + v856) + 255.0d0*(v545 + v552 + v557 + v571) + &
      560.0d0*(v550 + v563 + v582 + v586) + 30.0d0*(-M_xxxxyzz + v560 + &
      v561 - v562 + v632) - 120.0d0*(v559 + v585 + v609 + v611 + v627) &
      + 90.0d0*(-M_xxxxyyy + v553 - v589 + v612 - v614 - v616 - v631) - &
      105.0d0*(v547 + v549 + v573 + v575 + v584 + v588 + v626 + v630) + &
      60.0d0*(-v554 - v556 + v558 - v568 - v570 - v590 - v592 - v594 - &
      v601 - v603 + v607 - v623 - v634))
    S_xxyyyyz   = z*(0.00699300699300699d0*(6.0d0*v421) + v1632 + v857 + v873)
    Ms_xxyyyyz  = M_0*S_xxyyyyz + v1628 - v641 + v657 - v684 - v723 - v727 - v740 - v743 + &
      v859 + v875 + 0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0* &
      M_xxxxzzz - 37.0d0*v653 + 690.0d0*v675 + 1260.0d0*v676 + 780.0d0* &
      v699 - 12.0d0*v879 - 16.0d0*(M_yyyyyyz + v720) + 45.0d0*(v643 + &
      v659) - 270.0d0*(v644 + v677) + 540.0d0*(v646 + v721) + 40.0d0*( &
      v648 + v666) + 300.0d0*(v649 + v700) - 105.0d0*(v650 + v685) + &
      330.0d0*(v651 + v728) - 132.0d0*(v652 + v706) + 570.0d0*(v655 + &
      v737) - 720.0d0*(v665 + v694) + 1560.0d0*(v671 + v724) - 450.0d0* &
      (v672 + v686) + 1860.0d0*(v674 + v738) + 2160.0d0*(v682 + v715) + &
      840.0d0*(v688 + v717) + 4200.0d0*(v696 + v701) + 3720.0d0*(v697 + &
      v705) + 1380.0d0*(v698 + v709) - 20.0d0*(v716 + v725) - 90.0d0*( &
      v718 + v731) + 2520.0d0*(v867 + v868) - 420.0d0*(v664 + v667 + &
      v695) - 96.0d0*(v719 + v741 + v877) - 27.0d0*(v645 + v647 + v692 &
      + v735) + 480.0d0*(v662 - v670 - v681 + v704) + 2250.0d0*(v673 + &
      v678 + v712 + v729) - 65.0d0*(v687 + v689 + v690 + v733) - &
      110.0d0*(v691 + v730 + v732 + v734) - 36.0d0*(v693 + v713 + v714 &
      + v736) - 30.0d0*(M_xxxxyyz + v658 + v661 + v876 + v878) + 60.0d0 &
      *(v663 - v668 - v702 + v707 - v708 - v710))
    S_xyyyyyy   = v880*x
    Ms_xyyyyyy  = M_0*S_xyyyyyy + v432 + v751 + v752 - v881 + 0.00233100233100233d0*( &
      10.0d0*M_xxxxxxx - 105.0d0*M_xxxxxyy - 120.0d0*v521 - 1200.0d0* &
      v754 - 45.0d0*x*(M_xxxxyy - M_xxxxzz) + 304.0d0*(M_xyyyyyy + v519 &
      ) + 1020.0d0*(v434 + v456) - 220.0d0*(v438 + v443) + 840.0d0*( &
      v439 + v469) - 315.0d0*(v444 + v486) + 150.0d0*(v457 + v510) - &
      160.0d0*(v462 + v475) - 3870.0d0*(v470 + v487) + 1140.0d0*(v472 + &
      v505) + 1040.0d0*(v476 + v498) + 4640.0d0*(v492 + v515) - &
      3940.0d0*(v499 + v524) + 40.0d0*(v447 - v463 - v523) + 1344.0d0*( &
      v484 + v495 + v518) - 2880.0d0*(v755 + v757 + v759 + v761) + &
      480.0d0*(-v436 + v441 - v458 - v493 + v516) + 60.0d0*(-v440 - &
      v442 + v459 - v477 - v525) + 960.0d0*(v455 - v496 - v507 + v514 - &
      v520) + 1920.0d0*(v454 + v467 - v468 + v473 - v491 + v503) + &
      3360.0d0*(-v471 - v482 + v489 + v494 + v512 + v517) + 30.0d0*( &
      -v433 - v435 - v437 - v445 + v449 + v452 - v464 - v500 + v504) - &
      240.0d0*(M_xxxyyyy + v448 + v450 + v461 + v474 + v481 + v483 + &
      v485 + v497 + v522) - 195.0d0*(v446 + v465 + v478 + v488 + v490 + &
      v501 + v509 + v511 + v513 + v526))
    S_xyyyyyz   = v9*(0.0769230769230769d0*(-10.0d0*v82) + v747 + v81)
    Ms_xyyyyyz  = M_0*S_xyyyyyz + M_xyyy*v429 + M_xyyz*v430 + v794 + 0.00699300699300699d0 &
      *(-30.0d0*v806 - 250.0d0*v813 + 128.0d0*(M_xyyyyyz + v835) + &
      390.0d0*(v805 + v841) - 270.0d0*(v812 + v829) + 1430.0d0*(M_yyy* &
      S_xyyz + M_yyz*S_xyyy) - 75.0d0*(v798 + v799 + v840) + 480.0d0*( &
      v817 + v823 + v836) + 288.0d0*(v822 + v830 + v834) + 120.0d0*( &
      v795 + v807 + v808 + v810) + 280.0d0*(v796 - v815 - v820 + v837) &
      - 195.0d0*(v797 + v801 + v826 + v828) + 600.0d0*(v804 - v814 - &
      v818 + v839) + 60.0d0*(v809 + v811 + v825 + v832) + 1110.0d0*( &
      v819 + v824 + v831 + v838) + 960.0d0*(v821 + v827 + v833 + v842) &
      - 15.0d0*(M_xxxxxyz + v800 + v802 + v803 + v816))
    S_yyyyyyy   = y*(0.00699300699300699d0*(-231.0d0*v419 + 105.0d0*v421) + v428 + v431)
    Ms_yyyyyyy  = M_0*S_yyyyyyy + v543 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      952.0d0*v621 - 1260.0d0*v852 - 630.0d0*v874 - 525.0d0*y*(M_xxxxyy &
      + M_xxyyzz) + 70.0d0*(M_xxxxxxy + v555) + 1680.0d0*(v546 + v578) &
      + 5040.0d0*(v572 + v576) + 1470.0d0*(v577 + v613) - 1050.0d0*( &
      v579 + v608) - 7980.0d0*(v596 + v598) - 1176.0d0*(v600 + v622) + &
      5880.0d0*(v602 + v605) + 3444.0d0*(v610 + v620) + 6860.0d0*(v615 &
      + v618) - 7420.0d0*(v625 + v629) + 105.0d0*(-M_xxxxyyy + &
      M_xxxxyzz + v562) + 35.0d0*(M_xxyzzzz + M_yyyzzzz + v535 + v538) &
      - 1120.0d0*(v550 + v563 + v582 + v586) + 2520.0d0*(v574 + v617 + &
      v853 + v856) - 280.0d0*(v583 + v587 + v624 + v628) - 4200.0d0*( &
      v593 + v599 + v623 + v634) + 840.0d0*(v548 - v551 - v564 - v595 - &
      v597 + v619) - 735.0d0*(v553 + v589 + v612 + v614 + v616 + v631) &
      - 1155.0d0*(v558 + v585 + v607 + v609 + v611 + v627) + 420.0d0*( &
      -M_xxyyyyy - v545 - v547 - v549 - v552 - v557 + v565 + v566 - &
      v571 - v573 - v575 + v580 + v581 - v584 - v588 + v591 - v626 - &
      v630 + v633) + 210.0d0*(-M_yyyyyzz + v533 + v534 + v536 + v537 + &
      v539 + v540 + v554 + v556 + v560 + v561 + v568 + v570 + v590 + &
      v592 + v594 + v601 + v603 + v632))
    S_yyyyyyz   = v880*z
    Ms_yyyyyyz  = M_0*S_yyyyyyz + v1631 + v1635 + v861 + v864 + v865 - v866 + v869 + v870 &
      + v871 + 0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0* &
      M_xxxxyyz + 304.0d0*M_yyyyyyz + 40.0d0*v653 - 555.0d0*v656 + &
      784.0d0*v720 - 600.0d0*v722 + 1344.0d0*v877 + 30.0d0*v879 + &
      4320.0d0*(v635 + v637) + 900.0d0*(v644 + v677) + 1440.0d0*(v646 + &
      v721) - 160.0d0*(v648 + v666) - 735.0d0*(v651 + v728) + 150.0d0*( &
      v652 + v706) - 780.0d0*(v663 + v707) + 3840.0d0*(v671 + v724) + &
      1080.0d0*(v672 + v686) + 2970.0d0*(v673 + v729) - 5100.0d0*(v696 &
      + v701) - 4800.0d0*(v697 + v705) + 7520.0d0*(v716 + v725) + &
      6720.0d0*(v718 + v731) + 3264.0d0*(v719 + v741) - 2880.0d0*(v867 &
      + v868) - 120.0d0*(M_yyyyzzz + v667 + v695) + 60.0d0*(v650 + v664 &
      + v685) + 960.0d0*(v682 - v699 + v715) - 240.0d0*(M_xxyyyyz + &
      v658 + v876 + v878) - 100.0d0*(v687 + v689 + v690 + v733) - &
      775.0d0*(v691 + v730 + v732 + v734) + 480.0d0*(v674 - v676 + v688 &
      + v717 + v738) + 90.0d0*(-v645 - v647 + v678 - v692 + v712 - v735 &
      ) - 225.0d0*(v660 + v693 + v711 + v713 + v714 + v736) + 1920.0d0* &
      (-v662 + v670 + v681 - v698 - v704 - v709) - 1200.0d0*(v649 + &
      v655 + v683 + v700 + v726 + v737 + v739 + v742))
    S_xxxxxxxx  = a8 + v883 + 0.000466200466200466d0*(-4004.0d0*v884 + 2310.0d0*v885 - &
      420.0d0*v886)
    Ms_xxxxxxxx = M_0*S_xxxxxxxx + v911 + 0.000155400155400155d0*(1920.0d0*M_xxxxxxxx + &
      3150.0d0*M_xxyyyyzz - 105.0d0*M_yyyyyyyy - 210.0d0*M_yyyyyyzz - &
      140.0d0*M_yyyyzzzz + 5810.0d0*v1042 + 183680.0d0*v926 + 11776.0d0 &
      *v934 - 259840.0d0*v953 - 224000.0d0*v960 + 220640.0d0*v985 + &
      107520.0d0*(v1005 + v955) - 71680.0d0*(v1009 + v1016) + 4480.0d0* &
      (v1013 + v1057) - 17920.0d0*(v1015 + v961) + 161280.0d0*(v1021 + &
      v959) - 14280.0d0*(v1030 + v976) - 12600.0d0*(v1031 + v984) - &
      33600.0d0*(v1036 + v974) - 7980.0d0*(v1040 + v972) - 560.0d0*( &
      v1047 + v1048) + 5460.0d0*(v1053 + v919) - 280.0d0*(v1061 + v990 &
      ) - 8960.0d0*(v1062 + v949) - 38080.0d0*(v1063 + v982) + &
      52416.0d0*(v912 + v932) - 36960.0d0*(v914 + v950) - 32340.0d0*( &
      v915 + v975) - 31500.0d0*(v916 + v983) + 134400.0d0*(v921 + v930 &
      ) - 17024.0d0*(v935 + v936) - 188160.0d0*(v941 + v966) - &
      170240.0d0*(v948 + v991) - 8400.0d0*(v967 + v973) + 7280.0d0*( &
      v981 + v992) + 5880.0d0*(v977 + v978 + v980) + 6720.0d0*( &
      -M_xxxxxxyy + v952 - v956 - v958) - 75264.0d0*(v1002 + v1022 + &
      v937 + v939) + 2240.0d0*(v1020 + v1056 + v965 + v986) + 1890.0d0* &
      (v1041 + v1043 + v1068 + v997) - 20160.0d0*(v1067 + v928 + v929 + &
      v996) + 2100.0d0*(M_xxyyyyyy + v1000 + v1071 + v917 + v920) + &
      53760.0d0*(v1004 + v1073 + v927 + v931 + v947 + v971) + 10920.0d0 &
      *(v1044 + v1058 + v968 + v969 + v970 + v987) - 1680.0d0*(v1049 + &
      v1060 + v1075 + v1076 + v1077 + v989) + 8680.0d0*(v1051 + v1069 + &
      v993 + v994 + v995 + v998) + 1120.0d0*(M_xxxxzzzz + v1052 + v1064 &
      + v1065 + v1066 + v1070 + v999) + 840.0d0*(v1001 + v1032 + v1033 &
      + v1034 - v1050 + v1054 - v1055 + v1072) - 47040.0d0*(v1010 + &
      v1017 + v913 + v923 + v924 + v925 + v943 + v962) + 3360.0d0*( &
      -M_xxxxxxzz + v1037 + v1038 + v1039 + v1045 + v1046 + v1059 - &
      v1074 + v918 - v979 + v988) + 26880.0d0*(-v1006 - v1007 - v1008 - &
      v1011 - v1018 + v1023 + v1028 - v1035 - v938 - v942 + v944 + v957 &
      - v963) + 13440.0d0*(v1003 + v1012 + v1014 + v1019 + v1024 + &
      v1025 + v1026 + v1027 - v1029 - v922 + v933 - v940 + v945 + v946 &
      - v951 - v954 + v964))
    S_xxxxxxxy  = v1079*v6
    Ms_xxxxxxxy = M_0*S_xxxxxxxy + v1111 - v1246*(M_xxyyyyy + M_xxyyyzz) + &
      0.0013986013986014d0*(-560.0d0*M_xxxxxyyy - 175.0d0*M_xxxyyyyy - &
      2352.0d0*v1131 - 1680.0d0*v1138 + 245.0d0*v1152 + 35.0d0*v1154 + &
      400.0d0*(M_xxxxxxxy + v1127) + 70.0d0*(M_xyyyyyyy + v1231) + &
      105.0d0*(M_xyyyyyzz + v1233) - 1190.0d0*(v1113 + v1150) + &
      2170.0d0*(v1118 + v1169) - 672.0d0*(v1130 + v1216) - 8400.0d0*( &
      v1137 + v1181) - 10290.0d0*(v1144 + v1167) - 1645.0d0*(v1146 + &
      v1226) - 13650.0d0*(v1148 + v1163) + 1400.0d0*(v1149 + v1222) + &
      2660.0d0*(v1151 + v1217) + 3500.0d0*(v1153 + v1244) + 2800.0d0*( &
      v1156 + v1239) - 2205.0d0*(v1165 + v1196) + 5880.0d0*(v1168 + &
      v1192) + 7140.0d0*(v1170 + v1187) + 2128.0d0*(v1126 + v1128 + &
      v1180) - 1792.0d0*(v1132 + v1133 + v1243) - 840.0d0*(v1140 + &
      v1142 + v1182) + 12320.0d0*(v1117 + v1122 + v1135 + v1143) + &
      3360.0d0*(v1123 - v1136 - v1186 + v1191) - 11900.0d0*(v1155 + &
      v1159 + v1173 + v1176) - 1540.0d0*(v1194 + v1197 + v1224 + v1227 &
      ) + 315.0d0*(-v1171 - v1183 + v1185 + v1203 + v1235) + 1120.0d0*( &
      v1125 - v1205 - v1208 + v1221 - v1236 - v1240) + 280.0d0*( &
      -M_xxxxxyzz - v1134 - v1177 + v1184 + v1200 - v1204 + v1230) + &
      6720.0d0*(v1112 + v1124 + v1129 - v1139 - v1141 + v1162 - v1211 - &
      v1213) - 1365.0d0*(v1114 + v1115 + v1116 + v1157 + v1160 + v1164 &
      + v1166 + v1198 + v1206 + v1209) - 805.0d0*(v1119 + v1120 + v1121 &
      + v1145 + v1147 + v1174 + v1178 + v1228 + v1237 + v1241) + &
      420.0d0*(-v1161 + v1172 - v1179 - v1193 - v1195 - v1210 + v1214 - &
      v1223 - v1225 - v1242) + 210.0d0*(-v1158 - v1175 - v1188 - v1189 &
      - v1190 - v1199 + v1201 + v1202 - v1207 + v1212 + v1215 - v1218 - &
      v1219 - v1220 - v1229 + v1232 + v1234 - v1238 + v1245))
    S_xxxxxxxz  = v1079*v7
    Ms_xxxxxxxz = M_0*S_xxxxxxxz - v1246*(M_xxyyyyz + M_xxyyzzz) + 0.0013986013986014d0*( &
      400.0d0*M_xxxxxxxz - 560.0d0*M_xxxxxyyz + 1072.0d0*v1262 + &
      2128.0d0*v1263 - 1008.0d0*v1265 - 1792.0d0*v1266 - 1400.0d0*v1269 &
      - 1085.0d0*v1283 - 875.0d0*v1287 - 175.0d0*(M_xxxyyyyz + &
      M_xxxyyzzz) + 70.0d0*(M_xyyyyyyz + v1386) + 105.0d0*(M_xyyyyzzz + &
      v1391) + 8512.0d0*(v1247 + v1267) - 1610.0d0*(v1248 + v1285) + &
      19040.0d0*(v1252 + v1274) + 1750.0d0*(v1253 + v1309) + 22400.0d0* &
      (v1257 + v1292) + 3360.0d0*(v1258 + v1351) + 14560.0d0*(v1259 + &
      v1316) + 5488.0d0*(v1261 + v1366) - 4032.0d0*(v1264 + v1407) + &
      2912.0d0*(v1268 + v1375) - 13440.0d0*(v1270 + v1361) - 6720.0d0*( &
      v1273 + v1327) + 10080.0d0*(v1275 + v1332) - 4200.0d0*(v1276 + &
      v1368) - 20020.0d0*(v1278 + v1312) + 2870.0d0*(v1280 + v1317) + &
      3080.0d0*(v1281 + v1397) - 980.0d0*(v1282 + v1408) + 1820.0d0*( &
      v1286 + v1376) - 15540.0d0*(v1288 + v1302) - 3920.0d0*(v1289 + &
      v1380) + 10710.0d0*(v1293 + v1304) - 2345.0d0*(v1295 + v1382) + &
      7560.0d0*(v1305 + v1352) - 5460.0d0*(v1306 + v1362) - 3885.0d0*( &
      v1307 + v1369) + 6300.0d0*(v1310 + v1333) - 3675.0d0*(v1311 + &
      v1370) - 8400.0d0*(v1313 + v1337) - 5145.0d0*(v1319 + v1339) - &
      1680.0d0*(v1271 + v1272 + v1367) + 525.0d0*(v1346 + v1373 + v1390 &
      ) + 280.0d0*(-M_xxxxxzzz + v1342 + v1372 + v1385) + 35.0d0*( &
      M_xxxzzzzz + M_xyyzzzzz + v1326 + v1406) - 2625.0d0*(v1294 + &
      v1296 + v1321 + v1401) - 5425.0d0*(v1297 + v1318 + v1320 + v1356 &
      ) - 840.0d0*(v1277 + v1279 + v1303 + v1347 + v1392) - 1575.0d0*( &
      v1249 + v1250 + v1251 + v1299 + v1344 + v1358) - 1015.0d0*(v1254 &
      + v1255 + v1256 + v1323 + v1388 + v1403) + 1120.0d0*(v1260 - &
      v1338 - v1348 - v1381 - v1393 + v1396) + 245.0d0*(v1301 + v1325 + &
      v1360 + v1371 + v1374 + v1405) + 420.0d0*(v1284 + v1308 + v1328 + &
      v1340 + v1354 + v1383 + v1399) - 700.0d0*(v1298 + v1322 + v1353 + &
      v1355 + v1357 + v1398 + v1400 + v1402) + 210.0d0*(v1291 + v1315 + &
      v1329 + v1330 + v1331 + v1343 + v1350 + v1387 + v1395) + 1050.0d0 &
      *(v1290 + v1314 + v1341 + v1349 + v1363 + v1364 + v1365 + v1384 + &
      v1394 + v1409 + v1410 + v1411) - 630.0d0*(v1300 + v1324 + v1334 + &
      v1335 + v1336 + v1345 + v1359 + v1377 + v1378 + v1379 + v1389 + &
      v1404))
    S_xxxxxxyy  = 0.00512820512820513d0*(-13.0d0*v884 + 15.0d0*v885) - v10*v1414 + v11* &
      v190 - v11*v843 + v1413 - v1415
    Ms_xxxxxxyy = M_0*S_xxxxxxyy + v1416 + v1418 + v1420 + 0.000155400155400155d0*( &
      -240.0d0*M_xxxxxxxx + 4800.0d0*M_xxxxxxyy - 120.0d0*M_xxxxxxzz - &
      1125.0d0*M_xxxxyyzz + 115.0d0*M_xxxxzzzz - 1005.0d0*M_xxyyyyyy - &
      900.0d0*M_xxyyyyzz + 75.0d0*M_yyyyyyyy + 105.0d0*M_yyyyyyzz + &
      25.0d0*M_yyyyzzzz - 3130.0d0*v1042 + 370.0d0*v1047 + 190.0d0* &
      v1048 + 420.0d0*v1050 + 150.0d0*v1055 + 230.0d0*v1423 + 50.0d0* &
      v1424 - 5440.0d0*v926 - 1568.0d0*v934 + 9952.0d0*v935 - 128.0d0* &
      v936 + 22080.0d0*v938 - 480.0d0*v940 - 16620.0d0*v945 - 11220.0d0 &
      *v946 + 690.0d0*v952 + 142520.0d0*v953 - 5190.0d0*v956 - 2490.0d0 &
      *v958 - 1400.0d0*v960 - 1320.0d0*v977 + 1110.0d0*v978 - 1590.0d0* &
      v980 - 97720.0d0*v985 + 46272.0d0*(v1002 + v937) - 4020.0d0*( &
      v1003 + v1012) + 24960.0d0*(v1004 + v931) - 69960.0d0*(v1005 + &
      v955) + 16140.0d0*(v1007 + v1011) + 35840.0d0*(v1009 + v1016) + &
      6870.0d0*(v1010 + v924) - 2240.0d0*(v1013 + v1057) - 41440.0d0*( &
      v1015 + v961) - 69840.0d0*(v1021 + v959) + 192.0d0*(v1022 + v939 &
      ) - 36840.0d0*(v1023 + v957) + 5520.0d0*(v1027 + v933) - &
      21540.0d0*(v1028 + v944) - 2730.0d0*(v1029 + v951) + 9165.0d0*( &
      v1030 + v976) - 2475.0d0*(v1031 + v984) - 4560.0d0*(v1035 + v942 &
      ) + 17700.0d0*(v1036 + v974) - 1770.0d0*(v1038 + v1045) + &
      6015.0d0*(v1040 + v972) - 3840.0d0*(v1044 + v969) - 1635.0d0*( &
      v1046 + v918) + 610.0d0*(v1051 + v994) - 1010.0d0*(v1052 + v1065 &
      ) + 11480.0d0*(v1056 + v986) - 13520.0d0*(v1062 + v949) + &
      19940.0d0*(v1063 + v982) - 21480.0d0*(v1073 + v947) + 12480.0d0*( &
      v1074 + v979) + 90.0d0*(v1421 + v1422) - 3888.0d0*(v912 + v932) + &
      51870.0d0*(v913 + v943) - 2445.0d0*(v914 + v950) - 30.0d0*(v915 + &
      v975) - 3825.0d0*(v916 + v983) - 5280.0d0*(v921 + v930) + &
      70620.0d0*(v922 + v954) + 55470.0d0*(v927 + v971) + 107580.0d0*( &
      v941 + v966) - 380.0d0*(v948 + v991) - 52500.0d0*(v967 + v973) - &
      54040.0d0*(v981 + v992) + 165.0d0*(v1001 + v1032 + v1034 + v1072 &
      ) - 5460.0d0*(v1006 + v1008 + v1018 + v963) - 3930.0d0*(v1017 + &
      v923 + v925 + v962) - 330.0d0*(v1037 + v1039 + v1059 + v988) - &
      270.0d0*(v1041 + v1043 + v1068 + v997) - 2760.0d0*(v1058 + v968 + &
      v970 + v987) + 430.0d0*(v1064 + v1066 + v1070 + v999) - 1845.0d0* &
      (v1067 + v928 + v929 + v996) + 970.0d0*(v1069 + v993 + v995 + &
      v998) + 255.0d0*(v1000 + v1033 + v1054 + v1071 + v917 + v920) + &
      300.0d0*(v1049 + v1060 + v1075 + v1076 + v1077 + v989) + 1380.0d0 &
      *(v1014 + v1019 + v1024 + v1025 + v1026 - v1053 - v919 + v964))
    S_xxxxxxyz  = v8*(0.0769230769230769d0*(3.0d0*v194) + v190 - v193 + v844)
    Ms_xxxxxxyz = M_0*S_xxxxxxyz - M_xyyyy*v311 - S_xyyyy*v328 + v1436 + &
      0.00699300699300699d0*(2.0d0*M_yyyyyyyz + 3.0d0*M_yyyyyzzz - &
      340.0d0*v1457 - 141.0d0*v1489 - 135.0d0*v1493 + 9.0d0*v1564 + &
      112.0d0*(M_xxxxxxyz + v1449) - 27.0d0*(M_xxyyyyyz + M_xxyyyzzz) - &
      540.0d0*(v1455 + v1584) - 1080.0d0*(v1467 + v1533) + 280.0d0*( &
      v1468 + v1537) - 1000.0d0*(v1470 + v1515) - 1470.0d0*(v1480 + &
      v1494) - 75.0d0*(v1482 + v1561) - 510.0d0*(v1484 + v1497) + &
      990.0d0*(v1486 + v1506) - 345.0d0*(v1488 + v1586) + 15.0d0*( &
      -v1490 + v1560) - 465.0d0*(v1499 + v1551) - 177.0d0*(v1508 + &
      v1553) + 480.0d0*(v1520 + v1526) - 50.0d0*(v1549 + v1562) + &
      42.0d0*(v1554 + v1577) + 38.0d0*(v1555 + v1587) + 8.0d0*(v1556 + &
      v1557) + 45.0d0*(v1563 + v1588) + 272.0d0*(v1447 + v1448 + v1583 &
      ) + 512.0d0*(v1451 + v1452 + v1514) - 150.0d0*(v1460 + v1463 + &
      v1585) + 30.0d0*(-M_xxxxyzzz + v1438 - v1464 + v1491) + 1500.0d0* &
      (v1437 + v1458 + v1461 + v1479) + 2520.0d0*(v1442 + v1465 + v1471 &
      + v1475) + 2300.0d0*(v1444 + v1453 + v1496 + v1505) + 1152.0d0*( &
      v1446 + v1450 + v1532 + v1536) + 400.0d0*(-v1454 + v1462 + v1546 &
      - v1574) + 1120.0d0*(-v1466 + v1476 + v1521 - v1529) + 10.0d0*( &
      v1502 + v1571 + v1576 + v1578) - 18.0d0*(v1513 + v1548 + v1550 + &
      v1582) + 120.0d0*(v1445 + v1459 - v1469 + v1541 + v1565) - 12.0d0 &
      *(v1504 + v1543 + v1544 + v1545 + v1559 + v1573) - 20.0d0*(v1456 &
      + v1511 + v1552 + v1567 + v1568 + v1569 + v1580) + 240.0d0*(v1443 &
      + v1472 + v1485 + v1492 + v1519 + v1525 + v1542 + v1566) - &
      185.0d0*(v1498 + v1500 + v1501 + v1507 + v1509 + v1510 + v1570 + &
      v1579) - 51.0d0*(v1439 + v1440 + v1441 + v1481 + v1483 + v1503 + &
      v1512 + v1558 + v1572 + v1581) - 300.0d0*(v1473 + v1477 + v1522 + &
      v1527 + v1530 + v1534 + v1535 + v1538 + v1539 + v1540) + 60.0d0*( &
      -M_xxxxyyyz - v1474 - v1478 + v1487 - v1495 - v1516 - v1517 - &
      v1518 - v1523 - v1524 - v1528 - v1531 - v1547 + v1575))
    S_xxxxxyyy  = v6*(0.0769230769230769d0*(2.0d0*v194) + v1591 + v1633 + v1636)
    Ms_xxxxxyyy = M_0*S_xxxxxyyy + v1593 + 0.000466200466200466d0*(-390.0d0*M_xxxyyyyy + &
      4962.0d0*v1131 + 6530.0d0*v1138 - 3370.0d0*v1152 - 285.0d0*v1154 &
      - 780.0d0*v1594 - 615.0d0*v1595 - 240.0d0*(M_xxxxxxxy + v1127) - &
      195.0d0*(M_xxxxxyzz + v1134) - 75.0d0*(M_xyyyyyyy + v1231) - &
      30.0d0*(M_xyyyyyzz + v1233) + 12990.0d0*(v1113 + v1150) - 600.0d0 &
      *(v1115 + v1198) + 15330.0d0*(v1118 + v1169) - 210.0d0*(v1120 + &
      v1228) + 10040.0d0*(v1123 + v1191) + 2760.0d0*(v1125 + v1221) + &
      6132.0d0*(v1130 + v1216) + 24060.0d0*(v1136 + v1186) + 20550.0d0* &
      (v1137 + v1181) + 40890.0d0*(v1144 + v1167) - 2830.0d0*(v1146 + &
      v1226) + 38550.0d0*(v1148 + v1163) - 6450.0d0*(v1149 + v1222) - &
      6810.0d0*(v1151 + v1217) - 5400.0d0*(v1153 + v1244) - 6300.0d0*( &
      v1156 + v1239) - 16530.0d0*(v1168 + v1192) - 16890.0d0*(v1170 + &
      v1187) - 8160.0d0*(v1171 + v1183) - 6720.0d0*(v1172 + v1214) - &
      1488.0d0*(v1126 + v1128 + v1180) - 588.0d0*(v1132 + v1133 + v1243 &
      ) - 585.0d0*(v1140 + v1142 + v1182) - 135.0d0*(v1184 + v1200 + &
      v1230) - 90.0d0*(v1185 + v1203 + v1235) + 270.0d0*(v1201 + v1215 &
      + v1232) - 2910.0d0*(v1112 + v1124 + v1129 + v1162) - 2970.0d0*( &
      v1117 + v1122 + v1135 + v1143) - 1380.0d0*(v1139 + v1141 + v1211 &
      + v1213) - 2100.0d0*(v1155 + v1159 + v1173 + v1176) - 7620.0d0*( &
      v1165 + v1177 + v1196 + v1204) + 555.0d0*(v1189 + v1199 + v1219 + &
      v1229) + 1815.0d0*(v1194 + v1197 + v1224 + v1227) + 2520.0d0*( &
      v1205 + v1208 + v1236 + v1240) + 1590.0d0*(M_xxxxxyyy + v1202 + &
      v1212 + v1234 + v1245) - 1260.0d0*(v1114 + v1116 + v1157 + v1160 &
      + v1164 + v1166 + v1206 + v1209) - 870.0d0*(v1119 + v1121 + v1145 &
      + v1147 + v1174 + v1178 + v1237 + v1241) - 765.0d0*(v1158 + v1175 &
      + v1188 + v1190 + v1207 + v1218 + v1220 + v1238) - 705.0d0*(v1161 &
      + v1179 + v1193 + v1195 + v1210 + v1223 + v1225 + v1242))
    S_xxxxxyyz  = v7*(v1596 + v1633 + 0.00512820512820513d0*(-13.0d0*v193 + 10.0d0*v194))
    Ms_xxxxxyyz = M_0*S_xxxxxyyz + v1598 - v881*z + 0.000466200466200466d0*(-80.0d0* &
      M_xxxxxxxz + 1850.0d0*M_xxxxxyyz - 65.0d0*M_xxxxxzzz - 350.0d0* &
      M_xxxyyyyz - 185.0d0*M_xxxyyzzz - 144.0d0*v1262 - 496.0d0*v1263 + &
      3726.0d0*v1265 + 3764.0d0*v1266 - 325.0d0*v1269 + 7310.0d0*v1272 &
      - 195.0d0*v1277 + 1020.0d0*v1283 - 3340.0d0*v1284 - 925.0d0*v1287 &
      - 480.0d0*v1599 - 135.0d0*(M_xyyyyyyz + v1386) - 120.0d0*( &
      M_xyyyyzzz + v1391) - 774.0d0*(v1247 + v1267) + 16470.0d0*(v1248 &
      + v1285) + 150.0d0*(v1250 + v1344) - 530.0d0*(v1252 + v1274) + &
      21650.0d0*(v1253 + v1309) + 280.0d0*(v1255 + v1388) + 15080.0d0*( &
      v1258 + v1351) - 1350.0d0*(v1259 + v1316) + 4440.0d0*(v1260 + &
      v1396) - 816.0d0*(v1261 + v1366) + 7644.0d0*(v1264 + v1407) + &
      2436.0d0*(v1268 + v1375) + 26580.0d0*(v1270 + v1361) + 12810.0d0* &
      (v1271 + v1367) + 14940.0d0*(v1273 + v1327) + 8940.0d0*(v1275 + &
      v1332) - 975.0d0*(v1276 + v1368) + 40040.0d0*(v1278 + v1312) - &
      3220.0d0*(v1279 + v1392) + 19710.0d0*(v1280 + v1317) - 5610.0d0*( &
      v1281 + v1397) - 1740.0d0*(v1282 + v1408) - 2190.0d0*(v1286 + &
      v1376) + 32280.0d0*(v1288 + v1302) + 2940.0d0*(v1289 + v1380) + &
      17130.0d0*(v1293 + v1304) + 2790.0d0*(v1295 + v1382) - 7620.0d0*( &
      v1303 + v1347) - 8970.0d0*(v1305 + v1352) + 1620.0d0*(v1306 + &
      v1362) + 4770.0d0*(v1307 + v1369) - 7740.0d0*(v1308 + v1328) - &
      5550.0d0*(v1310 + v1333) + 6300.0d0*(v1313 + v1337) + 6540.0d0*( &
      v1319 + v1339) - 600.0d0*(v1373 + v1390) - 705.0d0*(v1342 + v1372 &
      + v1385) - 510.0d0*(v1249 + v1251 + v1299 + v1358) - 380.0d0*( &
      v1254 + v1256 + v1323 + v1403) - 1500.0d0*(v1297 + v1318 + v1320 &
      + v1356) + 885.0d0*(v1335 + v1345 + v1378 + v1389) + 840.0d0*( &
      v1338 + v1348 + v1381 + v1393) - 1965.0d0*(v1340 + v1354 + v1383 &
      + v1399) - 2520.0d0*(v1341 + v1364 + v1384 + v1410) - 850.0d0*( &
      v1257 + v1292 + v1294 + v1296 + v1321 + v1401) - 1200.0d0*(v1290 &
      + v1314 + v1349 + v1363 + v1365 + v1394 + v1409 + v1411) - &
      1125.0d0*(v1298 + v1322 + v1353 + v1355 + v1357 + v1398 + v1400 + &
      v1402) - 435.0d0*(v1300 + v1324 + v1334 + v1336 + v1359 + v1377 + &
      v1379 + v1404) - 240.0d0*(v1291 + v1315 + v1329 + v1330 + v1331 + &
      v1343 + v1350 + v1387 + v1395))
    S_xxxxyyyy  = 0.000466200466200466d0*(396.0d0*v1412 + 2145.0d0*v31*v81 + v882 - &
      858.0d0*(v1415 + v1602) + 33.0d0*(v1600 + v885) - 18.0d0*(v1601 + &
      v886))
    Ms_xxxxyyyy = 0.000466200466200466d0*(2145.0d0*M_0*S_xxxxyyyy + 1485.0d0*M_xxxxyyyy + &
      48780.0d0*v892 + 92.0d0*z*(M_xxxxxxz + M_yyyyyyz) + 84.0d0*z*( &
      M_xxxxzzz + M_yyyyzzz) + 15.0d0*(M_xxxxxxzz + M_yyyyyyzz) + &
      14.0d0*(M_xxxxzzzz + M_yyyyzzzz) + 100.0d0*(v1042 + v926) + &
      32.0d0*(v1047 + v934) + 60.0d0*(v1050 + v940) + 560.0d0*(v1057 + &
      v960) + 3285.0d0*(v887 + v906) + 28560.0d0*(v889 + v903) + &
      21360.0d0*(v890 + v900) + 5640.0d0*(v945 + v956) + 34680.0d0*( &
      v1005 + v955 + v967 + v973) + 9240.0d0*(v1010 + v1035 + v924 + &
      v942) + 432.0d0*(v1022 + v1049 + v1076 + v939) + 10020.0d0*(v1028 &
      + v915 + v944 + v975) + 120.0d0*(v1038 + v1045 + v921 + v930) + &
      620.0d0*(v1052 + v1065 + v948 + v991) + 102.0d0*(v1421 + v1422 + &
      v912 + v932) + 70.0d0*(v897 + v898 + v908 + v909) + 28.0d0*( &
      M_xxyyzzzz + v1020 + v1061 + v965 + v990) + 42.0d0*(v1000 + v1001 &
      + v1032 + v1034 + v1071 + v1072 + v917 + v920) + 140.0d0*(v1064 + &
      v1066 + v1069 + v1070 + v993 + v995 + v998 + v999) + 168.0d0*( &
      v1019 + v1024 + v1026 + v1060 + v1075 + v1077 + v895 + v964 + &
      v989) - (330.0d0*M_xxxxxxyy + 285.0d0*M_xxxxyyzz + 330.0d0* &
      M_xxyyyyyy + 285.0d0*M_xxyyyyzz + M_xxzzzzzz + M_yyzzzzzz + &
      4368.0d0*v1002 + 4368.0d0*v1003 + 2640.0d0*v1004 + 1020.0d0*v1006 &
      + 8220.0d0*v1007 + 1020.0d0*v1008 + 8960.0d0*v1009 + 8220.0d0* &
      v1011 + 4368.0d0*v1012 + 628.0d0*v1013 + 3000.0d0*v1014 + &
      3920.0d0*v1015 + 8960.0d0*v1016 + 360.0d0*v1017 + 1020.0d0*v1018 &
      + 3360.0d0*v1023 + 3000.0d0*v1025 + 420.0d0*v1027 + 510.0d0*v1029 &
      + 4440.0d0*v1030 + 630.0d0*v1031 + 120.0d0*v1033 + 5160.0d0*v1036 &
      + 360.0d0*v1037 + 360.0d0*v1039 + 4890.0d0*v1040 + 195.0d0*v1041 &
      + 195.0d0*v1043 + 2640.0d0*v1044 + 420.0d0*v1046 + 1720.0d0*v1051 &
      + 510.0d0*v1053 + 120.0d0*v1054 + 3920.0d0*v1056 + 1020.0d0*v1058 &
      + 360.0d0*v1059 + 1720.0d0*v1062 + 4400.0d0*v1063 + 195.0d0*v1067 &
      + 195.0d0*v1068 + 3000.0d0*v1073 + 3360.0d0*v1074 + 2145.0d0* &
      v1418 + 2145.0d0*v1420 + 2145.0d0*v1603 + 2145.0d0*v1604 + &
      2145.0d0*v542*y + 2145.0d0*v881*x + 1200.0d0*v891 + 720.0d0*v893 &
      + 720.0d0*v894 + 720.0d0*v896 + 8.0d0*v899 + 1200.0d0*v901 + &
      1200.0d0*v902 + 1200.0d0*v905 + 720.0d0*v907 + 8.0d0*v910 + &
      4440.0d0*v913 + 120.0d0*v914 + 630.0d0*v916 + 420.0d0*v918 + &
      510.0d0*v919 + 5160.0d0*v922 + 360.0d0*v923 + 360.0d0*v925 + &
      4890.0d0*v927 + 195.0d0*v928 + 195.0d0*v929 + 2640.0d0*v931 + &
      420.0d0*v933 + 628.0d0*v935 + 4368.0d0*v937 + 2280.0d0*v938 + &
      8220.0d0*v941 + 4440.0d0*v943 + 1440.0d0*v946 + 3000.0d0*v947 + &
      1720.0d0*v949 + 120.0d0*v950 + 510.0d0*v951 + 8960.0d0*v953 + &
      5160.0d0*v954 + 3360.0d0*v957 + 540.0d0*v958 + 3920.0d0*v961 + &
      360.0d0*v962 + 1020.0d0*v963 + 8220.0d0*v966 + 1020.0d0*v968 + &
      2640.0d0*v969 + 1020.0d0*v970 + 4890.0d0*v971 + 4890.0d0*v972 + &
      5160.0d0*v974 + 4440.0d0*v976 + 2280.0d0*v977 + 1440.0d0*v978 + &
      3360.0d0*v979 + 540.0d0*v980 + 4400.0d0*v981 + 4400.0d0*v982 + &
      630.0d0*v983 + 630.0d0*v984 + 8960.0d0*v985 + 3920.0d0*v986 + &
      1020.0d0*v987 + 360.0d0*v988 + 4400.0d0*v992 + 1720.0d0*v994 + &
      195.0d0*v996 + 195.0d0*v997))
    S_xxxxyyyz  = v8*(0.0153846153846154d0*(6.0d0*v194 + v421) + v1591 + v1605 + v349)
    Ms_xxxxyyyz = M_0*S_xxxxyyyz - v875*y + 0.0013986013986014d0*(590.0d0*M_xxxxyyyz - &
      59.0d0*M_xxyyyzzz - 5.0d0*M_yyyyyyyz - 2.0d0*M_yyyyyzzz - 63.0d0* &
      v1426 + 1730.0d0*v1457 + 2060.0d0*v1469 + 204.0d0*v1489 - 295.0d0 &
      *v1493 - 31.0d0*v1556 - 9.0d0*v1557 - 10.0d0*v1560 - 6.0d0*v1564 &
      - 60.0d0*(M_xxxxxxyz + v1449) - 57.0d0*(M_xxxxyzzz + v1464) - &
      315.0d0*(v1425 + v1433) + 3830.0d0*(v1438 + v1491) - 76.0d0*( &
      v1440 + v1558) + 3800.0d0*(v1443 + v1525) + 1460.0d0*(v1445 + &
      v1565) + 3200.0d0*(v1454 + v1574) + 2670.0d0*(v1455 + v1584) + &
      2340.0d0*(v1459 + v1541) + 8960.0d0*(v1466 + v1529) + 7980.0d0*( &
      v1467 + v1533) + 2820.0d0*(v1468 + v1537) + 6020.0d0*(v1470 + &
      v1515) + 7320.0d0*(v1472 + v1519) + 3360.0d0*(v1476 + v1521) + &
      10110.0d0*(v1480 + v1494) - 720.0d0*(v1482 + v1561) + 10350.0d0*( &
      v1484 + v1497) + 4070.0d0*(v1486 + v1506) - 370.0d0*(v1487 + &
      v1575) - 710.0d0*(v1492 + v1542) + 310.0d0*(v1499 + v1551) - &
      1170.0d0*(v1517 + v1524) + 486.0d0*(v1522 + v1539) + 19.0d0*( &
      v1544 + v1559) + 15.0d0*(v1549 + v1562) - 215.0d0*(v1554 + v1577 &
      ) - 139.0d0*(v1555 + v1587) - 30.0d0*(v1563 + v1588) + 630.0d0*( &
      v1606 + v1607) - 70.0d0*(M_xxyyyyyz + v1495 + v1547) - 20.0d0*( &
      v1447 + v1448 + v1583) - 400.0d0*(v1451 + v1452 + v1514) + &
      930.0d0*(v1456 - v1485 - v1566) - 285.0d0*(v1460 + v1463 + v1585 &
      ) + 3.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1429 + v1432) - 450.0d0*( &
      v1437 + v1458 + v1461 + v1479) - 140.0d0*(v1442 + v1465 + v1471 + &
      v1475) - 240.0d0*(v1446 + v1450 + v1532 + v1536) + 1200.0d0*( &
      v1462 - v1520 - v1526 + v1546) - 135.0d0*(v1502 + v1571 + v1576 + &
      v1578) - 69.0d0*(v1504 + v1543 + v1545 + v1573) - 65.0d0*(v1513 + &
      v1548 + v1550 + v1582) + 21.0d0*(v1427 + v1428 + v1430 + v1431 + &
      v1434 + v1435) + 250.0d0*(-v1444 - v1453 - v1496 - v1505 + v1508 &
      + v1553) - 115.0d0*(v1511 + v1552 + v1567 + v1568 + v1569 + v1580 &
      ) - 114.0d0*(v1474 + v1478 + v1516 + v1518 + v1523 + v1528 + &
      v1531) - 570.0d0*(v1473 + v1477 + v1527 + v1530 + v1534 + v1535 + &
      v1538 + v1540) - 390.0d0*(v1498 + v1500 + v1501 + v1507 + v1509 + &
      v1510 + v1570 + v1579) + 120.0d0*(-v1439 - v1441 - v1481 - v1483 &
      + v1488 - v1503 - v1512 - v1572 - v1581 + v1586))
    S_xxxyyyyy  = v6*(0.0769230769230769d0*(2.0d0*v421) + v1609 + v1634 + v1636)
    Ms_xxxyyyyy = M_0*S_xxxyyyyy + v1593 + 0.000466200466200466d0*(-390.0d0*M_xxxxxyyy - &
      780.0d0*v1131 - 3370.0d0*v1138 + 6530.0d0*v1152 - 615.0d0*v1154 + &
      4962.0d0*v1594 - 285.0d0*v1595 - 75.0d0*(M_xxxxxxxy + v1127) - &
      30.0d0*(M_xxxxxyzz + v1134) - 240.0d0*(M_xyyyyyyy + v1231) - &
      195.0d0*(M_xyyyyyzz + v1233) - 6810.0d0*(v1113 + v1150) + &
      6132.0d0*(v1115 + v1198) - 6450.0d0*(v1118 + v1169) + 2760.0d0*( &
      v1120 + v1228) - 2830.0d0*(v1123 + v1191) - 210.0d0*(v1125 + &
      v1221) - 600.0d0*(v1130 + v1216) - 8160.0d0*(v1137 + v1181) - &
      16530.0d0*(v1144 + v1167) + 10040.0d0*(v1146 + v1226) - 16890.0d0 &
      *(v1148 + v1163) + 15330.0d0*(v1149 + v1222) + 12990.0d0*(v1151 + &
      v1217) - 6720.0d0*(v1153 + v1244) + 24060.0d0*(v1165 + v1196) + &
      40890.0d0*(v1168 + v1192) + 38550.0d0*(v1170 + v1187) + 20550.0d0 &
      *(v1171 + v1183) - 5400.0d0*(v1172 + v1214) - 6300.0d0*(v1177 + &
      v1204) - 135.0d0*(v1126 + v1128 + v1180) + 270.0d0*(v1132 + v1133 &
      + v1243) - 90.0d0*(v1140 + v1142 + v1182) - 1488.0d0*(v1184 + &
      v1200 + v1230) - 585.0d0*(v1185 + v1203 + v1235) - 588.0d0*(v1201 &
      + v1215 + v1232) + 555.0d0*(v1112 + v1124 + v1129 + v1162) + &
      1815.0d0*(v1117 + v1122 + v1135 + v1143) - 7620.0d0*(v1136 + &
      v1156 + v1186 + v1239) + 2520.0d0*(v1155 + v1159 + v1173 + v1176 &
      ) - 2910.0d0*(v1189 + v1199 + v1219 + v1229) - 2970.0d0*(v1194 + &
      v1197 + v1224 + v1227) - 1380.0d0*(v1202 + v1212 + v1234 + v1245 &
      ) - 2100.0d0*(v1205 + v1208 + v1236 + v1240) + 1590.0d0*( &
      M_xxxyyyyy + v1139 + v1141 + v1211 + v1213) - 765.0d0*(v1114 + &
      v1116 + v1157 + v1160 + v1164 + v1166 + v1206 + v1209) - 705.0d0* &
      (v1119 + v1121 + v1145 + v1147 + v1174 + v1178 + v1237 + v1241) - &
      1260.0d0*(v1158 + v1175 + v1188 + v1190 + v1207 + v1218 + v1220 + &
      v1238) - 870.0d0*(v1161 + v1179 + v1193 + v1195 + v1210 + v1223 + &
      v1225 + v1242))
    S_xxxyyyyz  = v7*(0.0153846153846154d0*(v194 + 6.0d0*v421) + v1605 + v1609 + v420)
    Ms_xxxyyyyz = M_0*S_xxxyyyyz - v860*x + 0.0013986013986014d0*(-5.0d0*M_xxxxxxxz - &
      2.0d0*M_xxxxxzzz + 590.0d0*M_xxxyyyyz - 59.0d0*M_xxxyyzzz - &
      31.0d0*v1262 - 9.0d0*v1263 + 204.0d0*v1265 - 10.0d0*v1269 - 6.0d0 &
      *v1277 + 2060.0d0*v1284 - 295.0d0*v1287 - 63.0d0*v1597 + 1730.0d0 &
      *v1599 - 60.0d0*(M_xyyyyyyz + v1386) - 57.0d0*(M_xyyyyzzz + v1391 &
      ) + 19.0d0*(v1247 + v1267) - 710.0d0*(v1248 + v1285) + 2340.0d0*( &
      v1250 + v1344) + 15.0d0*(v1252 + v1274) + 310.0d0*(v1258 + v1351 &
      ) - 215.0d0*(v1259 + v1316) - 139.0d0*(v1261 + v1366) + 486.0d0*( &
      v1264 + v1407) - 76.0d0*(v1268 + v1375) + 630.0d0*(v1270 + v1361 &
      ) - 1170.0d0*(v1273 + v1327) - 720.0d0*(v1275 + v1332) - 30.0d0*( &
      v1276 + v1368) + 3360.0d0*(v1279 + v1392) - 370.0d0*(v1280 + &
      v1317) + 4070.0d0*(v1281 + v1397) + 2820.0d0*(v1282 + v1408) + &
      3830.0d0*(v1286 + v1376) + 3800.0d0*(v1289 + v1380) + 1460.0d0*( &
      v1295 + v1382) + 7320.0d0*(v1303 + v1347) + 10350.0d0*(v1305 + &
      v1352) + 7980.0d0*(v1306 + v1362) + 2670.0d0*(v1307 + v1369) + &
      6020.0d0*(v1308 + v1328) + 10110.0d0*(v1310 + v1333) - 315.0d0*( &
      v1311 + v1370) + 8960.0d0*(v1313 + v1337) + 3200.0d0*(v1319 + &
      v1339) - 70.0d0*(M_xxxxxyyz + v1253 + v1309) + 930.0d0*(v1283 - &
      v1293 - v1304) - 400.0d0*(v1330 + v1343 + v1387) - 20.0d0*(v1342 &
      + v1372 + v1385) - 285.0d0*(v1346 + v1373 + v1390) + 3.0d0*( &
      M_xxxzzzzz + M_xyyzzzzz + v1326 + v1406) - 69.0d0*(v1249 + v1251 &
      + v1299 + v1358) - 65.0d0*(v1254 + v1256 + v1323 + v1403) + &
      1200.0d0*(v1255 - v1288 - v1302 + v1388) - 135.0d0*(v1297 + v1318 &
      + v1320 + v1356) - 450.0d0*(v1335 + v1345 + v1378 + v1389) - &
      140.0d0*(v1338 + v1348 + v1381 + v1393) - 240.0d0*(v1341 + v1364 &
      + v1384 + v1410) - 115.0d0*(v1257 + v1292 + v1294 + v1296 + v1321 &
      + v1401) + 250.0d0*(v1260 - v1340 - v1354 - v1383 + v1396 - v1399 &
      ) + 21.0d0*(v1301 + v1325 + v1360 + v1371 + v1374 + v1405) - &
      114.0d0*(v1266 + v1291 + v1315 + v1329 + v1331 + v1350 + v1395) - &
      570.0d0*(v1290 + v1314 + v1349 + v1363 + v1365 + v1394 + v1409 + &
      v1411) - 390.0d0*(v1298 + v1322 + v1353 + v1355 + v1357 + v1398 + &
      v1400 + v1402) + 120.0d0*(v1271 - v1300 - v1324 - v1334 - v1336 - &
      v1359 + v1367 - v1377 - v1379 - v1404))
    S_xxyyyyyy  = 0.00512820512820513d0*(15.0d0*v1600 - 13.0d0*v1610) + v10*v428 - v10* &
      v843 - v11*v1414 + v1413 - v1602
    Ms_xxyyyyyy = M_0*S_xxyyyyyy + v1416 + v1603 + v1604 + 0.000155400155400155d0*(75.0d0* &
      M_xxxxxxxx - 1005.0d0*M_xxxxxxyy + 105.0d0*M_xxxxxxzz - 900.0d0* &
      M_xxxxyyzz + 25.0d0*M_xxxxzzzz + 4800.0d0*M_xxyyyyyy - 1125.0d0* &
      M_xxyyyyzz - 240.0d0*M_yyyyyyyy - 120.0d0*M_yyyyyyzz + 115.0d0* &
      M_yyyyzzzz + 142520.0d0*v1009 + 9952.0d0*v1013 - 97720.0d0*v1016 &
      - 5440.0d0*v1042 - 1568.0d0*v1047 - 128.0d0*v1048 - 480.0d0*v1050 &
      + 690.0d0*v1055 - 1400.0d0*v1057 + 50.0d0*v1423 + 230.0d0*v1424 - &
      3130.0d0*v926 + 370.0d0*v934 + 190.0d0*v936 - 1320.0d0*v938 + &
      420.0d0*v940 - 5190.0d0*v945 + 1110.0d0*v946 + 150.0d0*v952 - &
      16620.0d0*v956 - 1590.0d0*v958 + 22080.0d0*v977 - 11220.0d0*v978 &
      - 2490.0d0*v980 - 4020.0d0*(v1002 + v937) + 46272.0d0*(v1003 + &
      v1012) - 3840.0d0*(v1004 + v931) - 52500.0d0*(v1005 + v955) + &
      107580.0d0*(v1007 + v1011) - 4560.0d0*(v1010 + v924) - 21480.0d0* &
      (v1014 + v1025) + 11480.0d0*(v1015 + v961) + 12480.0d0*(v1023 + &
      v957) - 1635.0d0*(v1027 + v933) - 30.0d0*(v1028 + v944) + &
      51870.0d0*(v1030 + v976) - 3825.0d0*(v1031 + v984) - 2445.0d0*( &
      v1033 + v1054) + 6870.0d0*(v1035 + v942) + 70620.0d0*(v1036 + &
      v974) - 5280.0d0*(v1038 + v1045) + 55470.0d0*(v1040 + v972) + &
      24960.0d0*(v1044 + v969) + 5520.0d0*(v1046 + v918) + 192.0d0*( &
      v1049 + v1076) - 13520.0d0*(v1051 + v994) - 380.0d0*(v1052 + &
      v1065) - 2730.0d0*(v1053 + v919) - 41440.0d0*(v1056 + v986) + &
      610.0d0*(v1062 + v949) - 54040.0d0*(v1063 + v982) - 36840.0d0*( &
      v1074 + v979) - 69840.0d0*(v1417 + v1419) - 3888.0d0*(v1421 + &
      v1422) + 90.0d0*(v912 + v932) + 9165.0d0*(v913 + v943) - &
      21540.0d0*(v915 + v975) - 2475.0d0*(v916 + v983) - 1770.0d0*(v921 &
      + v930) + 17700.0d0*(v922 + v954) + 6015.0d0*(v927 + v971) - &
      2240.0d0*(v935 + v960) + 16140.0d0*(v941 + v966) - 1010.0d0*(v948 &
      + v991) + 35840.0d0*(v953 + v985) - 69960.0d0*(v967 + v973) + &
      19940.0d0*(v981 + v992) + 165.0d0*(v1000 + v1071 + v917 + v920) - &
      2760.0d0*(v1006 + v1008 + v1018 + v963) - 330.0d0*(v1017 + v923 + &
      v925 + v962) - 3930.0d0*(v1037 + v1039 + v1059 + v988) - 1845.0d0 &
      *(v1041 + v1043 + v1068 + v997) - 5460.0d0*(v1058 + v968 + v970 + &
      v987) + 970.0d0*(v1064 + v1066 + v1070 + v999) - 270.0d0*(v1067 + &
      v928 + v929 + v996) + 430.0d0*(v1069 + v993 + v995 + v998) + &
      255.0d0*(v1001 + v1032 + v1034 + v1072 + v914 + v950) + 300.0d0*( &
      v1019 + v1022 + v1024 + v1026 + v939 + v964) + 1380.0d0*(-v1029 + &
      v1060 + v1073 + v1075 + v1077 + v947 - v951 + v989))
    S_xxyyyyyz  = v8*(v1596 + v1634 + 0.00512820512820513d0*(-13.0d0*v419 + 10.0d0*v421))
    Ms_xxyyyyyz = M_0*S_xxyyyyyz + v1436 - v542*z + 0.000466200466200466d0*(-350.0d0* &
      M_xxxxyyyz + 1850.0d0*M_xxyyyyyz - 185.0d0*M_xxyyyzzz - 80.0d0* &
      M_yyyyyyyz - 65.0d0*M_yyyyyzzz + 1020.0d0*v1456 - 480.0d0*v1457 - &
      3340.0d0*v1469 + 3726.0d0*v1489 + 7310.0d0*v1490 - 925.0d0*v1493 &
      + 3764.0d0*v1523 - 144.0d0*v1556 - 496.0d0*v1557 - 325.0d0*v1560 &
      - 195.0d0*v1564 - 135.0d0*(M_xxxxxxyz + v1449) - 120.0d0*( &
      M_xxxxyzzz + v1464) - 2190.0d0*(v1438 + v1491) + 2436.0d0*(v1440 &
      + v1558) + 2940.0d0*(v1443 + v1525) + 2790.0d0*(v1445 + v1565) + &
      6540.0d0*(v1454 + v1574) + 4770.0d0*(v1455 + v1584) + 150.0d0*( &
      v1459 + v1541) + 280.0d0*(v1462 + v1546) - 600.0d0*(v1463 + v1585 &
      ) + 6300.0d0*(v1466 + v1529) + 1620.0d0*(v1467 + v1533) - &
      1740.0d0*(v1468 + v1537) - 7740.0d0*(v1470 + v1515) - 7620.0d0*( &
      v1472 + v1519) - 3220.0d0*(v1476 + v1521) - 5550.0d0*(v1480 + &
      v1494) + 8940.0d0*(v1482 + v1561) - 8970.0d0*(v1484 + v1497) + &
      17130.0d0*(v1485 + v1566) - 5610.0d0*(v1486 + v1506) + 19710.0d0* &
      (v1487 + v1575) + 12810.0d0*(v1488 + v1586) + 16470.0d0*(v1492 + &
      v1542) + 21650.0d0*(v1495 + v1547) + 15080.0d0*(v1499 + v1551) + &
      4440.0d0*(v1508 + v1553) + 14940.0d0*(v1517 + v1524) + 32280.0d0* &
      (v1520 + v1526) + 7644.0d0*(v1522 + v1539) - 774.0d0*(v1544 + &
      v1559) - 530.0d0*(v1549 + v1562) - 1350.0d0*(v1554 + v1577) - &
      816.0d0*(v1555 + v1587) - 975.0d0*(v1563 + v1588) + 26580.0d0*( &
      v1606 + v1607) + 40040.0d0*(v1611 + v1612) - 705.0d0*(v1447 + &
      v1448 + v1583) + 885.0d0*(v1437 + v1458 + v1461 + v1479) + &
      840.0d0*(v1442 + v1465 + v1471 + v1475) - 1965.0d0*(v1444 + v1453 &
      + v1496 + v1505) - 2520.0d0*(v1446 + v1450 + v1532 + v1536) - &
      1500.0d0*(v1502 + v1571 + v1576 + v1578) - 510.0d0*(v1504 + v1543 &
      + v1545 + v1573) - 380.0d0*(v1513 + v1548 + v1550 + v1582) - &
      850.0d0*(v1511 + v1552 + v1567 + v1568 + v1569 + v1580) - 435.0d0 &
      *(v1439 + v1441 + v1481 + v1483 + v1503 + v1512 + v1572 + v1581) &
      - 1200.0d0*(v1473 + v1477 + v1527 + v1530 + v1534 + v1535 + v1538 &
      + v1540) - 1125.0d0*(v1498 + v1500 + v1501 + v1507 + v1509 + &
      v1510 + v1570 + v1579) - 240.0d0*(v1451 + v1452 + v1474 + v1478 + &
      v1514 + v1516 + v1518 + v1528 + v1531))
    S_xyyyyyyy  = v1613*v6
    Ms_xyyyyyyy = M_0*S_xyyyyyyy + v1111 - v1614*(M_xxxxxyy + M_xxxyyzz) + &
      0.0013986013986014d0*(-175.0d0*M_xxxxxyyy - 560.0d0*M_xxxyyyyy + &
      245.0d0*v1138 - 1680.0d0*v1152 - 2352.0d0*v1594 + 35.0d0*v1595 + &
      70.0d0*(M_xxxxxxxy + v1127) + 105.0d0*(M_xxxxxyzz + v1134) + &
      400.0d0*(M_xyyyyyyy + v1231) + 2660.0d0*(v1113 + v1150) - 672.0d0 &
      *(v1115 + v1198) + 1400.0d0*(v1118 + v1169) - 1645.0d0*(v1123 + &
      v1191) - 2205.0d0*(v1136 + v1186) + 5880.0d0*(v1144 + v1167) + &
      7140.0d0*(v1148 + v1163) + 2170.0d0*(v1149 + v1222) - 1190.0d0*( &
      v1151 + v1217) - 10290.0d0*(v1168 + v1192) - 13650.0d0*(v1170 + &
      v1187) - 8400.0d0*(v1171 + v1183) + 3500.0d0*(v1172 + v1214) + &
      2800.0d0*(v1177 + v1204) + 2128.0d0*(v1184 + v1200 + v1230) - &
      840.0d0*(v1185 + v1203 + v1235) - 1792.0d0*(v1201 + v1215 + v1232 &
      ) - 1540.0d0*(v1117 + v1122 + v1135 + v1143) + 3360.0d0*(v1146 - &
      v1165 - v1196 + v1226) + 12320.0d0*(v1194 + v1197 + v1224 + v1227 &
      ) - 11900.0d0*(v1205 + v1208 + v1236 + v1240) + 315.0d0*(-v1137 + &
      v1140 + v1142 - v1181 + v1182) + 1120.0d0*(v1120 - v1155 - v1159 &
      - v1173 - v1176 + v1228) + 280.0d0*(-M_xyyyyyzz + v1126 + v1128 - &
      v1156 + v1180 - v1233 - v1239) + 6720.0d0*(v1189 + v1199 - v1202 &
      - v1212 + v1219 + v1229 - v1234 - v1245) + 420.0d0*(-v1119 - &
      v1121 - v1145 - v1147 + v1153 - v1174 - v1178 - v1237 - v1241 + &
      v1244) - 805.0d0*(v1125 + v1161 + v1179 + v1193 + v1195 + v1210 + &
      v1221 + v1223 + v1225 + v1242) - 1365.0d0*(v1130 + v1158 + v1175 &
      + v1188 + v1190 + v1207 + v1216 + v1218 + v1220 + v1238) + &
      210.0d0*(-v1112 - v1114 - v1116 - v1124 - v1129 + v1132 + v1133 + &
      v1139 + v1141 - v1157 - v1160 - v1162 - v1164 - v1166 - v1206 - &
      v1209 + v1211 + v1213 + v1243))
    S_xyyyyyyz  = v7*(0.0769230769230769d0*(3.0d0*v421) - v419 + v428 + v844)
    Ms_xyyyyyyz = M_0*S_xyyyyyyz + v1598 + 0.00699300699300699d0*(2.0d0*M_xxxxxxxz + 3.0d0 &
      *M_xxxxxzzz - 141.0d0*v1265 + 9.0d0*v1277 - 135.0d0*v1287 - &
      340.0d0*v1599 - 27.0d0*(M_xxxxxyyz + M_xxxyyzzz) + 112.0d0*( &
      M_xyyyyyyz + v1386) - 50.0d0*(v1252 + v1274) - 465.0d0*(v1258 + &
      v1351) + 42.0d0*(v1259 + v1316) - 177.0d0*(v1260 + v1396) + &
      38.0d0*(v1261 + v1366) + 8.0d0*(v1262 + v1263) + 15.0d0*(v1269 - &
      v1272) - 780.0d0*(v1270 + v1361) - 345.0d0*(v1271 + v1367) - &
      75.0d0*(v1275 + v1332) + 45.0d0*(v1276 + v1368) + 990.0d0*(v1281 &
      + v1397) + 280.0d0*(v1282 + v1408) + 480.0d0*(v1288 + v1302) - &
      510.0d0*(v1305 + v1352) - 1080.0d0*(v1306 + v1362) - 540.0d0*( &
      v1307 + v1369) - 1000.0d0*(v1308 + v1328) - 1470.0d0*(v1310 + &
      v1333) + 512.0d0*(v1330 + v1343 + v1387) + 272.0d0*(v1342 + v1372 &
      + v1385) - 150.0d0*(v1346 + v1373 + v1390) + 30.0d0*(-M_xyyyyzzz &
      + v1286 + v1376 - v1391) - 18.0d0*(v1254 + v1256 + v1323 + v1403 &
      ) + 400.0d0*(v1255 - v1319 - v1339 + v1388) + 1120.0d0*(v1279 - &
      v1313 - v1337 + v1392) + 10.0d0*(v1297 + v1318 + v1320 + v1356) + &
      1500.0d0*(v1335 + v1345 + v1378 + v1389) + 2520.0d0*(v1338 + &
      v1348 + v1381 + v1393) + 2300.0d0*(v1340 + v1354 + v1383 + v1399 &
      ) + 1152.0d0*(v1341 + v1364 + v1384 + v1410) + 120.0d0*(v1250 - &
      v1284 + v1295 + v1344 + v1382) - 12.0d0*(v1247 + v1249 + v1251 + &
      v1267 + v1299 + v1358) - 20.0d0*(v1257 + v1283 + v1292 + v1294 + &
      v1296 + v1321 + v1401) + 240.0d0*(v1248 + v1285 + v1289 + v1293 + &
      v1303 + v1304 + v1347 + v1380) - 185.0d0*(v1298 + v1322 + v1353 + &
      v1355 + v1357 + v1398 + v1400 + v1402) - 300.0d0*(v1264 + v1290 + &
      v1314 + v1349 + v1363 + v1365 + v1394 + v1407 + v1409 + v1411) - &
      51.0d0*(v1268 + v1300 + v1324 + v1334 + v1336 + v1359 + v1375 + &
      v1377 + v1379 + v1404) + 60.0d0*(-M_xxxyyyyz - v1253 - v1266 - &
      v1273 + v1280 - v1291 - v1309 - v1315 + v1317 - v1327 - v1329 - &
      v1331 - v1350 - v1395))
    S_yyyyyyyy  = b8 + v883 + 0.000466200466200466d0*(2310.0d0*v1600 - 420.0d0*v1601 - &
      4004.0d0*v1610)
    Ms_yyyyyyyy = M_0*S_yyyyyyyy + v911 + 0.000155400155400155d0*(-105.0d0*M_xxxxxxxx - &
      210.0d0*M_xxxxxxzz + 3150.0d0*M_xxxxyyzz - 140.0d0*M_xxxxzzzz + &
      1920.0d0*M_yyyyyyyy - 259840.0d0*v1009 + 220640.0d0*v1016 + &
      183680.0d0*v1042 + 11776.0d0*v1047 - 224000.0d0*v1057 + 5810.0d0* &
      v926 - 8400.0d0*(v1005 + v955) - 188160.0d0*(v1007 + v1011) - &
      17024.0d0*(v1013 + v1048) - 280.0d0*(v1020 + v965) - 32340.0d0*( &
      v1028 + v944) + 5460.0d0*(v1029 + v951) - 31500.0d0*(v1031 + v984 &
      ) - 36960.0d0*(v1033 + v1054) + 134400.0d0*(v1038 + v1045) - &
      8960.0d0*(v1051 + v994) - 170240.0d0*(v1052 + v1065) - 17920.0d0* &
      (v1056 + v986) + 7280.0d0*(v1063 + v982) + 161280.0d0*(v1417 + &
      v1419) + 52416.0d0*(v1421 + v1422) - 14280.0d0*(v913 + v943) - &
      12600.0d0*(v916 + v983) - 33600.0d0*(v922 + v954) - 7980.0d0*( &
      v927 + v971) - 560.0d0*(v934 + v936) + 4480.0d0*(v935 + v960) - &
      71680.0d0*(v953 + v985) + 107520.0d0*(v967 + v973) - 38080.0d0*( &
      v981 + v992) + 5880.0d0*(v938 + v946 + v958) + 6720.0d0*( &
      -M_xxyyyyyy + v1055 - v945 - v980) - 75264.0d0*(v1003 + v1012 + &
      v1049 + v1076) + 2240.0d0*(v1015 + v1061 + v961 + v990) - &
      20160.0d0*(v1041 + v1043 + v1068 + v997) + 1890.0d0*(v1067 + v928 &
      + v929 + v996) + 2100.0d0*(M_xxxxxxyy + v1001 + v1032 + v1034 + &
      v1072) + 10920.0d0*(v1004 + v1006 + v1008 + v1018 + v931 + v963) &
      + 53760.0d0*(v1014 + v1025 + v1040 + v1044 + v969 + v972) - &
      1680.0d0*(v1019 + v1022 + v1024 + v1026 + v939 + v964) + 8680.0d0 &
      *(v1062 + v1064 + v1066 + v1070 + v949 + v999) + 1120.0d0*( &
      M_yyyyzzzz + v1069 + v948 + v991 + v993 + v995 + v998) + 840.0d0* &
      (v1000 + v1071 + v914 + v917 + v920 - v940 + v950 - v952) - &
      47040.0d0*(v1030 + v1035 + v1037 + v1039 + v1059 + v942 + v976 + &
      v988) + 3360.0d0*(-M_yyyyyyzz + v1017 - v1023 + v1027 + v921 + &
      v923 + v925 + v930 + v933 - v957 + v962) + 26880.0d0*(-v1010 - &
      v1058 + v1074 + v915 - v924 - v941 - v966 - v968 - v970 + v975 - &
      v977 + v979 - v987) + 13440.0d0*(v1002 - v1036 + v1046 - v1050 - &
      v1053 + v1060 + v1073 + v1075 + v1077 + v918 - v919 + v937 + v947 &
      + v956 - v974 + v978 + v989))
    S_yyyyyyyz  = v1613*v8
    Ms_yyyyyyyz = M_0*S_yyyyyyyz - v1614*(M_xxxxyyz + M_xxyyzzz) + 0.0013986013986014d0*( &
      -560.0d0*M_xxyyyyyz + 400.0d0*M_yyyyyyyz - 1085.0d0*v1456 - &
      1008.0d0*v1489 - 875.0d0*v1493 - 1792.0d0*v1523 + 1072.0d0*v1556 &
      + 2128.0d0*v1557 - 1400.0d0*v1560 + 70.0d0*(M_xxxxxxyz + v1449) - &
      175.0d0*(M_xxxxyyyz + M_xxyyyzzz) + 105.0d0*(M_xxxxyzzz + v1464) &
      - 3675.0d0*(v1425 + v1433) + 1820.0d0*(v1438 + v1491) + 2912.0d0* &
      (v1440 + v1558) - 3920.0d0*(v1443 + v1525) - 2345.0d0*(v1445 + &
      v1565) - 5145.0d0*(v1454 + v1574) - 3885.0d0*(v1455 + v1584) - &
      8400.0d0*(v1466 + v1529) - 5460.0d0*(v1467 + v1533) - 980.0d0*( &
      v1468 + v1537) + 6300.0d0*(v1480 + v1494) + 10080.0d0*(v1482 + &
      v1561) + 7560.0d0*(v1484 + v1497) + 10710.0d0*(v1485 + v1566) + &
      3080.0d0*(v1486 + v1506) + 2870.0d0*(v1487 + v1575) - 1610.0d0*( &
      v1492 + v1542) + 1750.0d0*(v1495 + v1547) + 3360.0d0*(v1499 + &
      v1551) - 6720.0d0*(v1517 + v1524) - 15540.0d0*(v1520 + v1526) - &
      4032.0d0*(v1522 + v1539) + 8512.0d0*(v1544 + v1559) + 19040.0d0*( &
      v1549 + v1562) + 22400.0d0*(v1552 + v1568) + 14560.0d0*(v1554 + &
      v1577) + 5488.0d0*(v1555 + v1587) - 4200.0d0*(v1563 + v1588) - &
      13440.0d0*(v1606 + v1607) - 20020.0d0*(v1611 + v1612) + 525.0d0*( &
      v1460 + v1463 + v1585) - 1680.0d0*(v1488 + v1490 + v1586) + &
      35.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1429 + v1432) + 280.0d0*( &
      -M_yyyyyzzz + v1447 + v1448 + v1583) - 5425.0d0*(v1502 + v1571 + &
      v1576 + v1578) - 2625.0d0*(v1511 + v1567 + v1569 + v1580) - &
      840.0d0*(v1472 + v1476 + v1519 + v1521 + v1564) + 245.0d0*(v1427 &
      + v1428 + v1430 + v1431 + v1434 + v1435) + 1120.0d0*(-v1442 - &
      v1465 - v1471 - v1475 + v1508 + v1553) - 1575.0d0*(v1459 + v1504 &
      + v1541 + v1543 + v1545 + v1573) - 1015.0d0*(v1462 + v1513 + &
      v1546 + v1548 + v1550 + v1582) + 420.0d0*(v1444 + v1453 + v1469 + &
      v1470 + v1496 + v1505 + v1515) - 700.0d0*(v1498 + v1500 + v1501 + &
      v1507 + v1509 + v1510 + v1570 + v1579) + 210.0d0*(v1451 + v1452 + &
      v1474 + v1478 + v1514 + v1516 + v1518 + v1528 + v1531) - 630.0d0* &
      (v1437 + v1439 + v1441 + v1458 + v1461 + v1479 + v1481 + v1483 + &
      v1503 + v1512 + v1572 + v1581) + 1050.0d0*(v1446 + v1450 + v1473 &
      + v1477 + v1527 + v1530 + v1532 + v1534 + v1535 + v1536 + v1538 + &
      v1540))
#undef  M_0                 
#undef  Ms_0                
#undef  z                   
#undef  y                   
#undef  x                   
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
#undef  M_xyy               
#undef  Ms_xyy              
#undef  M_xyz               
#undef  Ms_xyz              
#undef  Ms_yyy              
#undef  M_yyy               
#undef  M_yyz               
#undef  Ms_yyz              
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
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  Ms_yyyz             
#undef  M_yyyz              
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
#undef  M_xxyyy             
#undef  Ms_xxyyy            
#undef  M_xxyyz             
#undef  Ms_xxyyz            
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  Ms_yyyyy            
#undef  M_yyyyy             
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
#undef  Ms_xxyyyz           
#undef  M_xxyyyz            
#undef  M_xyyyyy            
#undef  Ms_xyyyyy           
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  Ms_yyyyyy           
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  Ms_yyyyyz           
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
#undef  M_xxyyyyz           
#undef  Ms_xxyyyyz          
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyyz          
#undef  M_yyyyyyy           
#undef  Ms_yyyyyyy          
#undef  Ms_yyyyyyz          
#undef  M_yyyyyyz           
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
#undef  M_xxxxxyyy          
#undef  Ms_xxxxxyyy         
#undef  Ms_xxxxxyyz         
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  Ms_xxxxyyyy         
#undef  Ms_xxxxyyyz         
#undef  M_xxxxyyyz          
#undef  M_xxxyyyyy          
#undef  Ms_xxxyyyyy         
#undef  M_xxxyyyyz          
#undef  Ms_xxxyyyyz         
#undef  M_xxyyyyyy          
#undef  Ms_xxyyyyyy         
#undef  M_xxyyyyyz          
#undef  Ms_xxyyyyyz         
#undef  M_xyyyyyyy          
#undef  Ms_xyyyyyyy         
#undef  M_xyyyyyyz          
#undef  Ms_xyyyyyyz         
#undef  Ms_yyyyyyyy         
#undef  M_yyyyyyyy          
#undef  Ms_yyyyyyyz         
#undef  M_yyyyyyyz          
    end subroutine mom_es_M2M
    
! OPS  2912*ADD + 2*DIV + 3777*MUL + 253*NEG + POW + 84*SUB = 7029  (9178 before optimization)
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
                v598, v599, v6, v60, v600, v601, v602, v603, v604, v605, v606,&
                v607, v608, v609, v61, v610, v611, v612, v613, v614, v615,&
                v616, v617, v618, v619, v62, v620, v621, v622, v623, v624,&
                v625, v626, v627, v628, v629, v63, v630, v631, v632, v633,&
                v634, v635, v636, v637, v638, v639, v64, v640, v641, v642,&
                v643, v644, v645, v646, v647, v648, v649, v65, v650, v651,&
                v652, v653, v654, v655, v656, v657, v658, v659, v66, v660,&
                v661, v662, v663, v664, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz,&
                D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz,&
                D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz,&
                D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy,&
                D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz,&
                D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz,&
                D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz,&
                D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz,&
                D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy, D_xxxxxxz,&
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
                D_zzzzzzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
                M_xxxyyzz, M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz,&
                M_xxyzzzz, M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz,&
                M_xyzzzzz, M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz,&
                M_yyzzzzz, M_yzzzzzz, M_zzzzzzz, M_xxxxxxzz, M_xxxxxyzz,&
                M_xxxxxzzz, M_xxxxyyzz, M_xxxxyzzz, M_xxxxzzzz, M_xxxyyyzz,&
                M_xxxyyzzz, M_xxxyzzzz, M_xxxzzzzz, M_xxyyyyzz, M_xxyyyzzz,&
                M_xxyyzzzz, M_xxyzzzzz, M_xxzzzzzz, M_xyyyyyzz, M_xyyyyzzz,&
                M_xyyyzzzz, M_xyyzzzzz, M_xyzzzzzz, M_xzzzzzzz, M_yyyyyyzz,&
                M_yyyyyzzz, M_yyyyzzzz, M_yyyzzzzz, M_yyzzzzzz, M_yzzzzzzz,&
                M_zzzzzzzz
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
#define M_xxx                M(6)
#define L_yy                 L(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define M_xxz                M(8)
#define L_xxx                L(8)
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
#define M_xxxyyy             M(38)
#define L_xxxxyy             L(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define L_xxxyyy             L(40)
#define M_xxyyyy             M(40)
#define L_xxxyyz             L(41)
#define M_xxyyyz             M(41)
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
#define M_xxxxxxxx           M(61)
#define L_yyyyyyy            L(61)
#define L_yyyyyyz            L(62)
#define M_xxxxxxxy           M(62)
#define M_xxxxxxxz           M(63)
#define L_xxxxxxxx           L(63)
#define M_xxxxxxyy           M(64)
#define L_xxxxxxxy           L(64)
#define M_xxxxxxyz           M(65)
#define L_xxxxxxxz           L(65)
#define L_xxxxxxyy           L(66)
#define M_xxxxxyyy           M(66)
#define L_xxxxxxyz           L(67)
#define M_xxxxxyyz           M(67)
#define M_xxxxyyyy           M(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define M_xxxxyyyz           M(69)
#define L_xxxxyyyy           L(70)
#define M_xxxyyyyy           M(70)
#define L_xxxxyyyz           L(71)
#define M_xxxyyyyz           M(71)
#define M_xxyyyyyy           M(72)
#define L_xxxyyyyy           L(72)
#define M_xxyyyyyz           M(73)
#define L_xxxyyyyz           L(73)
#define L_xxyyyyyy           L(74)
#define M_xyyyyyyy           M(74)
#define M_xyyyyyyz           M(75)
#define L_xxyyyyyz           L(75)
#define L_xyyyyyyy           L(76)
#define M_yyyyyyyy           M(76)
#define M_yyyyyyyz           M(77)
#define L_xyyyyyyz           L(77)
#define L_yyyyyyyy           L(78)
#define L_yyyyyyyz           L(79)
#define L_xxxxxxxxx          L(80)
#define L_xxxxxxxxy          L(81)
#define L_xxxxxxxxz          L(82)
#define L_xxxxxxxyy          L(83)
#define L_xxxxxxxyz          L(84)
#define L_xxxxxxyyy          L(85)
#define L_xxxxxxyyz          L(86)
#define L_xxxxxyyyy          L(87)
#define L_xxxxxyyyz          L(88)
#define L_xxxxyyyyy          L(89)
#define L_xxxxyyyyz          L(90)
#define L_xxxyyyyyy          L(91)
#define L_xxxyyyyyz          L(92)
#define L_xxyyyyyyy          L(93)
#define L_xxyyyyyyz          L(94)
#define L_xyyyyyyyy          L(95)
#define L_xyyyyyyyz          L(96)
#define L_yyyyyyyyy          L(97)
#define L_yyyyyyyyz          L(98)
    v659        = y*z
    v660        = x*y
    v639        = 15.0d0*v659
    v641        = v660
    v643        = v659
    v142        = 0.5d0*M_xx
    v152        = 0.166666666666667d0*M_xxx
    v153        = 0.5d0*M_xxy
    v154        = 0.5d0*M_xxz
    v173        = 0.0416666666666667d0*M_xxxx
    v174        = 0.166666666666667d0*M_xxxy
    v175        = 0.166666666666667d0*M_xxxz
    v176        = 0.25d0*M_xxyy
    v177        = 0.5d0*M_xxyz
    v211        = 0.00833333333333333d0*M_xxxxx
    v212        = 0.0416666666666667d0*M_xxxxy
    v213        = 0.0416666666666667d0*M_xxxxz
    v214        = 0.0833333333333333d0*M_xxxyy
    v215        = 0.166666666666667d0*M_xxxyz
    v217        = 0.0833333333333333d0*M_xxyyy
    v218        = 0.25d0*M_xxyyz
    v279        = 0.00138888888888889d0*M_xxxxxx
    v280        = 0.00833333333333333d0*M_xxxxxy
    v281        = 0.00833333333333333d0*M_xxxxxz
    v282        = 0.0208333333333333d0*M_xxxxyy
    v283        = 0.0416666666666667d0*M_xxxxyz
    v285        = 0.0277777777777778d0*M_xxxyyy
    v286        = 0.0833333333333333d0*M_xxxyyz
    v289        = 0.0208333333333333d0*M_xxyyyy
    v290        = 0.0833333333333333d0*M_xxyyyz
    v388        = 0.000198412698412698d0*M_xxxxxxx
    v389        = 0.00138888888888889d0*M_xxxxxxy
    v390        = 0.00138888888888889d0*M_xxxxxxz
    v391        = 0.00416666666666667d0*M_xxxxxyy
    v392        = 0.00833333333333333d0*M_xxxxxyz
    v394        = 0.00694444444444444d0*M_xxxxyyy
    v395        = 0.0208333333333333d0*M_xxxxyyz
    v398        = 0.00694444444444444d0*M_xxxyyyy
    v399        = 0.0277777777777778d0*M_xxxyyyz
    v403        = 0.00416666666666667d0*M_xxyyyyy
    v404        = 0.0208333333333333d0*M_xxyyyyz
    v450        = 0.5d0*M_yy
    v452        = 0.166666666666667d0*M_yyy
    v457        = 0.0416666666666667d0*M_yyyy
    v466        = 0.00833333333333333d0*M_yyyyy
    v482        = 0.00138888888888889d0*M_yyyyyy
    v506        = 0.000198412698412698d0*M_yyyyyyy
    v541        = 2.48015873015873d-5*M_xxxxxxxx
    v542        = 0.000198412698412698d0*M_xxxxxxxy
    v543        = 0.000198412698412698d0*M_xxxxxxxz
    v544        = 0.000694444444444444d0*M_xxxxxxyy
    v545        = 0.00138888888888889d0*M_xxxxxxyz
    v547        = 0.00138888888888889d0*M_xxxxxyyy
    v548        = 0.00416666666666667d0*M_xxxxxyyz
    v551        = 0.00173611111111111d0*M_xxxxyyyy
    v552        = 0.00694444444444444d0*M_xxxxyyyz
    v556        = 0.00138888888888889d0*M_xxxyyyyy
    v557        = 0.00694444444444444d0*M_xxxyyyyz
    v562        = 0.000694444444444444d0*M_xxyyyyyy
    v563        = 0.00416666666666667d0*M_xxyyyyyz
    v569        = 2.48015873015873d-5*M_yyyyyyyy
    v570        = 0.000198412698412698d0*M_yyyyyyyz
    v571        = 0.00138888888888889d0*M_yyyyyyz
    v573        = 0.00833333333333333d0*M_yyyyyz
    v576        = 0.0416666666666667d0*M_yyyyz
    v580        = 0.166666666666667d0*M_yyyz
    v585        = 0.5d0*M_yyz
    v598        = 0.5d0*M_xyy
    v600        = 0.166666666666667d0*M_xyyy
    v602        = 0.0416666666666667d0*M_xyyyy
    v604        = 0.00833333333333333d0*M_xyyyyy
    v606        = 0.00138888888888889d0*M_xyyyyyy
    v608        = 0.000198412698412698d0*M_xyyyyyyy
    M_zz        = -(M_xx + M_yy)
    v591        = 0.5d0*M_zz
    M_xzz       = -(M_xxx + M_xyy)
    M_yzz       = -(M_xxy + M_yyy)
    v599        = 0.5d0*M_yzz
    M_zzz       = -(M_xxz + M_yyz)
    v592        = 0.166666666666667d0*M_zzz
    M_xxzz      = -(M_xxxx + M_xxyy)
    v178        = 0.25d0*M_xxzz
    M_xyzz      = -(M_xxxy + M_xyyy)
    M_xzzz      = -(M_xxxz + M_xyyz)
    M_yyzz      = -(M_xxyy + M_yyyy)
    v586        = 0.25d0*M_yyzz
    M_yzzz      = -(M_xxyz + M_yyyz)
    v601        = 0.166666666666667d0*M_yzzz
    M_zzzz      = -(M_xxzz + M_yyzz)
    v593        = 0.0416666666666667d0*M_zzzz
    M_xxxzz     = -(M_xxxxx + M_xxxyy)
    v216        = 0.0833333333333333d0*M_xxxzz
    M_xxyzz     = -(M_xxxxy + M_xxyyy)
    v219        = 0.25d0*M_xxyzz
    M_xxzzz     = -(M_xxxxz + M_xxyyz)
    v220        = 0.0833333333333333d0*M_xxzzz
    M_xyyzz     = -(M_xxxyy + M_xyyyy)
    M_xyzzz     = -(M_xxxyz + M_xyyyz)
    M_xzzzz     = -(M_xxxzz + M_xyyzz)
    M_yyyzz     = -(M_xxyyy + M_yyyyy)
    v581        = 0.0833333333333333d0*M_yyyzz
    M_yyzzz     = -(M_xxyyz + M_yyyyz)
    v587        = 0.0833333333333333d0*M_yyzzz
    M_yzzzz     = -(M_xxyzz + M_yyyzz)
    v603        = 0.0416666666666667d0*M_yzzzz
    M_zzzzz     = -(M_xxzzz + M_yyzzz)
    v594        = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz    = -(M_xxxxxx + M_xxxxyy)
    v284        = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz    = -(M_xxxxxy + M_xxxyyy)
    v287        = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz    = -(M_xxxxxz + M_xxxyyz)
    v288        = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz    = -(M_xxxxyy + M_xxyyyy)
    v291        = 0.125d0*M_xxyyzz
    M_xxyzzz    = -(M_xxxxyz + M_xxyyyz)
    v292        = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz    = -(M_xxxxzz + M_xxyyzz)
    v293        = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz    = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz    = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz    = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz    = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz    = -(M_xxyyyy + M_yyyyyy)
    v577        = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz    = -(M_xxyyyz + M_yyyyyz)
    v582        = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz    = -(M_xxyyzz + M_yyyyzz)
    v588        = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz    = -(M_xxyzzz + M_yyyzzz)
    v605        = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz    = -(M_xxzzzz + M_yyzzzz)
    v595        = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz   = -(M_xxxxxxx + M_xxxxxyy)
    v393        = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz   = -(M_xxxxxxy + M_xxxxyyy)
    v396        = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz   = -(M_xxxxxxz + M_xxxxyyz)
    v397        = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz   = -(M_xxxxxyy + M_xxxyyyy)
    v400        = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz   = -(M_xxxxxyz + M_xxxyyyz)
    v401        = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz   = -(M_xxxxxzz + M_xxxyyzz)
    v402        = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz   = -(M_xxxxyyy + M_xxyyyyy)
    v405        = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz   = -(M_xxxxyyz + M_xxyyyyz)
    v406        = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz   = -(M_xxxxyzz + M_xxyyyzz)
    v407        = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz   = -(M_xxxxzzz + M_xxyyzzz)
    v408        = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz   = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz   = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz   = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz   = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz   = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz   = -(M_xxyyyyy + M_yyyyyyy)
    v574        = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz   = -(M_xxyyyyz + M_yyyyyyz)
    v578        = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz   = -(M_xxyyyzz + M_yyyyyzz)
    v583        = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz   = -(M_xxyyzzz + M_yyyyzzz)
    v589        = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz   = -(M_xxyzzzz + M_yyyzzzz)
    v607        = 0.00138888888888889d0*M_yzzzzzz
    M_zzzzzzz   = -(M_xxzzzzz + M_yyzzzzz)
    v596        = 0.000198412698412698d0*M_zzzzzzz
    M_xxxxxxzz  = -(M_xxxxxxxx + M_xxxxxxyy)
    v546        = 0.000694444444444444d0*M_xxxxxxzz
    M_xxxxxyzz  = -(M_xxxxxxxy + M_xxxxxyyy)
    v549        = 0.00416666666666667d0*M_xxxxxyzz
    M_xxxxxzzz  = -(M_xxxxxxxz + M_xxxxxyyz)
    v550        = 0.00138888888888889d0*M_xxxxxzzz
    M_xxxxyyzz  = -(M_xxxxxxyy + M_xxxxyyyy)
    v553        = 0.0104166666666667d0*M_xxxxyyzz
    M_xxxxyzzz  = -(M_xxxxxxyz + M_xxxxyyyz)
    v554        = 0.00694444444444444d0*M_xxxxyzzz
    M_xxxxzzzz  = -(M_xxxxxxzz + M_xxxxyyzz)
    v555        = 0.00173611111111111d0*M_xxxxzzzz
    M_xxxyyyzz  = -(M_xxxxxyyy + M_xxxyyyyy)
    v558        = 0.0138888888888889d0*M_xxxyyyzz
    M_xxxyyzzz  = -(M_xxxxxyyz + M_xxxyyyyz)
    v559        = 0.0138888888888889d0*M_xxxyyzzz
    M_xxxyzzzz  = -(M_xxxxxyzz + M_xxxyyyzz)
    v560        = 0.00694444444444444d0*M_xxxyzzzz
    M_xxxzzzzz  = -(M_xxxxxzzz + M_xxxyyzzz)
    v561        = 0.00138888888888889d0*M_xxxzzzzz
    M_xxyyyyzz  = -(M_xxxxyyyy + M_xxyyyyyy)
    v564        = 0.0104166666666667d0*M_xxyyyyzz
    M_xxyyyzzz  = -(M_xxxxyyyz + M_xxyyyyyz)
    v565        = 0.0138888888888889d0*M_xxyyyzzz
    M_xxyyzzzz  = -(M_xxxxyyzz + M_xxyyyyzz)
    v566        = 0.0104166666666667d0*M_xxyyzzzz
    M_xxyzzzzz  = -(M_xxxxyzzz + M_xxyyyzzz)
    v567        = 0.00416666666666667d0*M_xxyzzzzz
    M_xxzzzzzz  = -(M_xxxxzzzz + M_xxyyzzzz)
    v568        = 0.000694444444444444d0*M_xxzzzzzz
    M_xyyyyyzz  = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz  = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz  = -(M_xxxyyyzz + M_xyyyyyzz)
    M_xyyzzzzz  = -(M_xxxyyzzz + M_xyyyyzzz)
    M_xyzzzzzz  = -(M_xxxyzzzz + M_xyyyzzzz)
    M_xzzzzzzz  = -(M_xxxzzzzz + M_xyyzzzzz)
    M_yyyyyyzz  = -(M_xxyyyyyy + M_yyyyyyyy)
    v572        = 0.000694444444444444d0*M_yyyyyyzz
    M_yyyyyzzz  = -(M_xxyyyyyz + M_yyyyyyyz)
    v575        = 0.00138888888888889d0*M_yyyyyzzz
    M_yyyyzzzz  = -(M_xxyyyyzz + M_yyyyyyzz)
    v579        = 0.00173611111111111d0*M_yyyyzzzz
    M_yyyzzzzz  = -(M_xxyyyzzz + M_yyyyyzzz)
    v584        = 0.00138888888888889d0*M_yyyzzzzz
    M_yyzzzzzz  = -(M_xxyyzzzz + M_yyyyzzzz)
    v590        = 0.000694444444444444d0*M_yyzzzzzz
    M_yzzzzzzz  = -(M_xxyzzzzz + M_yyyzzzzz)
    v609        = 0.000198412698412698d0*M_yzzzzzzz
    M_zzzzzzzz  = -(M_xxzzzzzz + M_yyzzzzzz)
    v597        = 2.48015873015873d-5*M_zzzzzzzz
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v0          = a2
    v610        = 5.0d0*v0
    v5          = 3.0d0*v0
    v10         = v610
    v24         = 7.0d0*v0
    a3          = a1*a2
    a4          = a2*a2
    v19         = a4
    v614        = 143.0d0*v19
    v54         = 33.0d0*v19
    v82         = v614
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
    v611        = v0*v1
    v7          = 3.0d0*v1
    v14         = 5.0d0*v1
    v612        = v1*v19
    v27         = v611
    v29         = 7.0d0*v1
    v616        = v1*v49
    v59         = v612
    v80         = -429.0d0*v59
    v111        = v616
    b3          = b1*b2
    b4          = b2*b2
    v31         = b4
    v613        = v0*v31
    v615        = 143.0d0*v31
    v617        = v19*v31
    v65         = v613
    v66         = 33.0d0*v31
    v90         = v615
    v91         = -429.0d0*v65
    v121        = v617
    v162        = -12155.0d0*v121
    b5          = b2*b3
    b6          = b3*b3
    v68         = b6
    v618        = v0*v68
    v92         = 429.0d0*v68
    v93         = -v92
    v127        = v618
    v128        = 715.0d0*v68
    b7          = b3*b4
    b8          = b4*b4
    v130        = b8
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v0 + v1
    v619        = 3.0d0*h
    v620        = h*v0
    v621        = h*v1
    v622        = h*v19
    v624        = v1*v620
    v626        = h*v31
    v627        = h*v49
    v631        = v19*v621
    v633        = v31*v620
    v635        = h*v68
    v4          = -h
    v12         = v619
    v13         = -15.0d0*v1 + v12
    v17         = h*h
    v623        = v0*v17
    v625        = v1*v17
    v628        = v17*v19
    v630        = v17*v611
    v634        = v17*v31
    v18         = 3.0d0*v17
    v20         = v620
    v21         = -30.0d0*v20
    v23         = -v12
    v25         = v23 + v24
    v30         = v23 + v29
    v32         = v621
    v33         = -30.0d0*v32
    v36         = -15.0d0*v17
    v37         = -45.0d0*v17
    v38         = v37 - 945.0d0*v19 + 630.0d0*v620
    v40         = -(v18 + 63.0d0*v27)
    v43         = v37 - 945.0d0*v31 + 630.0d0*v621
    v46         = h*h*h
    v629        = v0*v46
    v632        = v1*v46
    v47         = 5.0d0*v46
    v48         = -v47
    v50         = v622
    v51         = v623
    v53         = 5.0d0*v17
    v55         = v21 + v53 + v54
    v57         = v624
    v58         = -(v46 + 126.0d0*v57)
    v61         = -v0*v12
    v62         = -v1*v12
    v63         = v17 + 33.0d0*v27
    v64         = v625
    v67         = v33 + v53 + v66
    v69         = v626
    v72         = 35.0d0*v46
    v76         = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78         = v47 + 330.0d0*v57
    v79         = h*v54
    v84         = -18.0d0*v51 + v46 + v79
    v85         = 66.0d0*v57
    v652        = -v85
    v86         = 9.0d0*v17
    v87         = 198.0d0*v57
    v88         = h*v66
    v89         = -18.0d0*v64 + v46 + v88
    v94         = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97         = h*h*h*h
    v98         = 35.0d0*v97
    v100        = v627
    v101        = v628
    v102        = v629
    v104        = -v72
    v106        = v104 + v105 - 1001.0d0*v50 + 385.0d0*v51
    v108        = v630
    v109        = 5.0d0*(297.0d0*v108 + v97)
    v653        = -v109
    v110        = 45.0d0*v46
    v112        = v631
    v114        = -14175.0d0*v46
    v116        = -v110
    v117        = -1430.0d0*v57
    v654        = v116 + v117
    v119        = -1351350.0d0*v624
    v655        = v114 + v119
    v120        = v632
    v122        = v633
    v124        = 3.0d0*v46
    v125        = -(v124 + 286.0d0*v57)
    v126        = v634
    v129        = v104 + v128 + 385.0d0*v64 - 1001.0d0*v69
    v131        = v635
    v134        = -315.0d0*v97
    v136        = -99225.0d0*v97
    v137        = v136 + 56756700.0d0*v627 - 28378350.0d0*v628 + 4365900.0d0*v629 - &
      34459425.0d0*v99
    v139        = 385.0d0*(v102 + v120) - (5005.0d0*v108 + v98)
    v141        = 7.0d0*v46
    v145        = -42525.0d0*v97
    v146        = -6081075.0d0*v630
    v656        = v145 + v146
    v148        = -(429.0d0*v108 + v97)
    v149        = -v17*v82
    v161        = -15.0d0*v97
    v163        = -2860.0d0*v108
    v657        = v161 + v162 + v163
    v164        = v124 + 130.0d0*v57
    v658        = -v164
    v191        = -v17*v90
    v449        = v136 - 34459425.0d0*v130 + 4365900.0d0*v632 - 28378350.0d0*v634 + &
      56756700.0d0*v635
    u2          = 1.0/h
    u           = sqrt(u2)
    u3          = u*u2
    v2          = u3
    D_x         = -v2*x
    D_y         = -v2*y
    D_z         = -v2*z
    u4          = u2*u2
    u5          = u2*u3
    v3          = u5
    v636        = 3.0d0*v3
    v6          = v636*x
    D_xx        = v3*(v4 + v5)
    D_xy        = v6*y
    D_xz        = v6*z
    D_yy        = v3*(v4 + v7)
    D_yz        = v636*v643
    D_zz        = -(D_xx + D_yy)
    u6          = u3*u3
    u7          = u3*u4
    v8          = u7
    v637        = 3.0d0*v8
    v9          = v8*x
    v11         = v637*(h - v10)
    D_xxx       = -3.0d0*v9*(v610 - v619)
    D_xxy       = v11*y
    D_xxz       = v11*z
    D_xyy       = v13*v9
    D_xyz       = -v639*v9
    D_xzz       = -(D_xxx + D_xyy)
    D_yyy       = v637*y*(v12 - v14)
    D_yyz       = v13*v8*z
    D_yzz       = -(D_xxy + D_yyy)
    D_zzz       = -(D_xxz + D_yyz)
    u8          = u4*u4
    u9          = u4*u5
    v15         = u9
    v638        = 15.0d0*v15*x
    v16         = 3.0d0*v15
    v22         = v638*y
    v26         = v638*z
    v28         = v15*v639
    D_xxxx      = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy      = v22*v25
    D_xxxz      = v25*v26
    D_xxyy      = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v409        = 0.5d0*D_xxyy
    D_xxyz      = v28*(v24 + v4)
    D_xxzz      = -(D_xxxx + D_xxyy)
    v430        = 0.5d0*D_xxzz
    D_xyyy      = v22*v30
    D_xyyz      = v26*(v29 + v4)
    D_xyzz      = -(D_xxxy + D_xyyy)
    v522        = 0.5d0*D_xyzz
    D_xzzz      = -(D_xxxz + D_xyyz)
    D_yyyy      = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz      = v28*v30
    D_yyzz      = -(D_xxyy + D_yyyy)
    D_yzzz      = -(D_xxyz + D_yyyz)
    D_zzzz      = -(D_xxzz + D_yyzz)
    u10         = u5*u5
    u11         = u5*u6
    v34         = u11
    v661        = v34*z
    v640        = 15.0d0*v34
    v35         = v640*x
    v39         = v661
    v41         = 315.0d0*v641*v661
    v42         = v640*y
    D_xxxxx     = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy     = v34*v38*y
    D_xxxxz     = v38*v39
    D_xxxyy     = v35*(v40 + h*v24 + 21.0d0*v32)
    v294        = 0.5d0*D_xxxyy
    D_xxxyz     = v41*(h - v5)
    D_xxxzz     = -(D_xxxxx + D_xxxyy)
    v309        = 0.5d0*D_xxxzz
    D_xxyyy     = v42*(v40 + h*v29 + 21.0d0*v20)
    v360        = 0.5d0*D_xxyyy
    v410        = 0.166666666666667d0*D_xxyyy
    D_xxyyz     = v39*(v36 - 945.0d0*v611 + 105.0d0*(v620 + v621))
    v425        = 0.5d0*D_xxyyz
    D_xxyzz     = -(D_xxxxy + D_xxyyy)
    v375        = 0.5d0*D_xxyzz
    D_xxzzz     = -(D_xxxxz + D_xxyyz)
    v431        = 0.166666666666667d0*D_xxzzz
    v444        = 0.5d0*D_xxzzz
    D_xyyyy     = v34*v43*x
    D_xyyyz     = v41*(h - v7)
    v517        = 0.5d0*D_xyyyz
    D_xyyzz     = -(D_xxxyy + D_xyyyy)
    v493        = 0.5d0*D_xyyzz
    D_xyzzz     = -(D_xxxyz + D_xyyyz)
    v523        = 0.166666666666667d0*D_xyzzz
    v536        = 0.5d0*D_xyzzz
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
    v662        = 315.0d0*v44
    v642        = v662*x
    v45         = 45.0d0*v44
    v52         = v642*y
    v56         = v642*z
    v60         = v643*v662
    D_xxxxxx    = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy    = v52*v55
    D_xxxxxz    = v55*v56
    D_xxxxyy    = v45*(v58 + v17*v29 + 14.0d0*v51 + 231.0d0*v59 - 21.0d0*v622)
    v221        = 0.5d0*D_xxxxyy
    D_xxxxyz    = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz    = -(D_xxxxxx + D_xxxxyy)
    v231        = 0.5d0*D_xxxxzz
    D_xxxyyy    = 945.0d0*v44*v641*(11.0d0*v27 + v17 + v61 + v62)
    v260        = 0.5d0*D_xxxyyy
    v295        = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz    = v56*(-9.0d0*v32 + v61 + v63)
    v305        = 0.5d0*D_xxxyyz
    D_xxxyzz    = -(D_xxxxxy + D_xxxyyy)
    v270        = 0.5d0*D_xxxyzz
    D_xxxzzz    = -(D_xxxxxz + D_xxxyyz)
    v310        = 0.166666666666667d0*D_xxxzzz
    v318        = 0.5d0*D_xxxzzz
    D_xxyyyy    = v45*(v58 + v17*v24 - 21.0d0*v626 + 14.0d0*v64 + 231.0d0*v65)
    v341        = 0.5d0*D_xxyyyy
    v361        = 0.166666666666667d0*D_xxyyyy
    v411        = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz    = v60*(-9.0d0*v20 + v62 + v63)
    v371        = 0.5d0*D_xxyyyz
    v421        = 0.166666666666667d0*D_xxyyyz
    D_xxyyzz    = -(D_xxxxyy + D_xxyyyy)
    v351        = 0.5d0*D_xxyyzz
    v426        = 0.25d0*D_xxyyzz
    D_xxyzzz    = -(D_xxxxyz + D_xxyyyz)
    v376        = 0.166666666666667d0*D_xxyzzz
    v384        = 0.5d0*D_xxyzzz
    D_xxzzzz    = -(D_xxxxzz + D_xxyyzz)
    v432        = 0.0416666666666667d0*D_xxzzzz
    v445        = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy    = v52*v67
    D_xyyyyz    = v56*(-18.0d0*v32 + v17 + v66)
    v489        = 0.5d0*D_xyyyyz
    v513        = 0.166666666666667d0*D_xyyyyz
    D_xyyyzz    = -(D_xxxyyy + D_xyyyyy)
    v473        = 0.5d0*D_xyyyzz
    v518        = 0.25d0*D_xyyyzz
    D_xyyzzz    = -(D_xxxyyz + D_xyyyyz)
    v494        = 0.166666666666667d0*D_xyyzzz
    v502        = 0.5d0*D_xyyzzz
    D_xyzzzz    = -(D_xxxyzz + D_xyyyzz)
    v524        = 0.0416666666666667d0*D_xyzzzz
    v537        = 0.166666666666667d0*D_xyzzzz
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
    v663        = 945.0d0*v70
    v644        = 315.0d0*v70
    v71         = v644*x
    v75         = v644*y
    v77         = v644*z
    v81         = v643*v663*x
    v83         = v663
    D_xxxxxxx   = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy   = v75*v76
    D_xxxxxxz   = v76*v77
    D_xxxxxyy   = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v179        = 0.5d0*D_xxxxxyy
    D_xxxxxyz   = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz   = -(D_xxxxxxx + D_xxxxxyy)
    v185        = 0.5d0*D_xxxxxzz
    D_xxxxyyy   = -v83*y*(v652 + v1*v18 + v1*v82 - v84)
    v200        = 0.5d0*D_xxxxyyy
    v222        = 0.166666666666667d0*D_xxxxyyy
    D_xxxxyyz   = v77*(-v1*v86 + v80 + v84 + v87)
    v228        = 0.5d0*D_xxxxyyz
    D_xxxxyzz   = -(D_xxxxxxy + D_xxxxyyy)
    v206        = 0.5d0*D_xxxxyzz
    D_xxxxzzz   = -(D_xxxxxxz + D_xxxxyyz)
    v232        = 0.166666666666667d0*D_xxxxzzz
    v237        = 0.5d0*D_xxxxzzz
    D_xxxyyyy   = -v83*x*(v652 + v0*v18 + v0*v90 - v89)
    v249        = 0.5d0*D_xxxyyyy
    v261        = 0.166666666666667d0*D_xxxyyyy
    v296        = 0.0416666666666667d0*D_xxxyyyy
    D_xxxyyyz   = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v267        = 0.5d0*D_xxxyyyz
    v302        = 0.166666666666667d0*D_xxxyyyz
    D_xxxyyzz   = -(D_xxxxxyy + D_xxxyyyy)
    v255        = 0.5d0*D_xxxyyzz
    v306        = 0.25d0*D_xxxyyzz
    D_xxxyzzz   = -(D_xxxxxyz + D_xxxyyyz)
    v271        = 0.166666666666667d0*D_xxxyzzz
    v276        = 0.5d0*D_xxxyzzz
    D_xxxzzzz   = -(D_xxxxxzz + D_xxxyyzz)
    v311        = 0.0416666666666667d0*D_xxxzzzz
    v319        = 0.166666666666667d0*D_xxxzzzz
    D_xxyyyyy   = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    v330        = 0.5d0*D_xxyyyyy
    v342        = 0.166666666666667d0*D_xxyyyyy
    v362        = 0.0416666666666667d0*D_xxyyyyy
    v412        = 0.00833333333333333d0*D_xxyyyyy
    D_xxyyyyz   = v77*(-v0*v86 + v87 + v89 + v91)
    v348        = 0.5d0*D_xxyyyyz
    v368        = 0.166666666666667d0*D_xxyyyyz
    v418        = 0.0416666666666667d0*D_xxyyyyz
    D_xxyyyzz   = -(D_xxxxyyy + D_xxyyyyy)
    v336        = 0.5d0*D_xxyyyzz
    v372        = 0.25d0*D_xxyyyzz
    v422        = 0.0833333333333333d0*D_xxyyyzz
    v439        = 0.166666666666667d0*D_xxyyyzz
    D_xxyyzzz   = -(D_xxxxyyz + D_xxyyyyz)
    v352        = 0.166666666666667d0*D_xxyyzzz
    v357        = 0.5d0*D_xxyyzzz
    v427        = 0.0833333333333333d0*D_xxyyzzz
    v441        = 0.25d0*D_xxyyzzz
    D_xxyzzzz   = -(D_xxxxyzz + D_xxyyyzz)
    v377        = 0.0416666666666667d0*D_xxyzzzz
    v385        = 0.166666666666667d0*D_xxyzzzz
    D_xxzzzzz   = -(D_xxxxzzz + D_xxyyzzz)
    v433        = 0.00833333333333333d0*D_xxzzzzz
    v446        = 0.0416666666666667d0*D_xxzzzzz
    D_xyyyyyy   = v71*v94
    D_xyyyyyz   = v81*(v36 + 110.0d0*v32 - v90)
    v470        = 0.5d0*D_xyyyyyz
    v486        = 0.166666666666667d0*D_xyyyyyz
    v510        = 0.0416666666666667d0*D_xyyyyyz
    D_xyyyyzz   = -(D_xxxyyyy + D_xyyyyyy)
    v461        = 0.5d0*D_xyyyyzz
    v490        = 0.25d0*D_xyyyyzz
    v514        = 0.0833333333333333d0*D_xyyyyzz
    v531        = 0.166666666666667d0*D_xyyyyzz
    D_xyyyzzz   = -(D_xxxyyyz + D_xyyyyyz)
    v474        = 0.166666666666667d0*D_xyyyzzz
    v479        = 0.5d0*D_xyyyzzz
    v519        = 0.0833333333333333d0*D_xyyyzzz
    v533        = 0.25d0*D_xyyyzzz
    D_xyyzzzz   = -(D_xxxyyzz + D_xyyyyzz)
    v495        = 0.0416666666666667d0*D_xyyzzzz
    v503        = 0.166666666666667d0*D_xyyzzzz
    D_xyzzzzz   = -(D_xxxyzzz + D_xyyyzzz)
    v525        = 0.00833333333333333d0*D_xyzzzzz
    v538        = 0.0416666666666667d0*D_xyzzzzz
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
    v645        = v660*v95
    v646        = v95*z
    v647        = v646*x
    v648        = v646*y
    v96         = 315.0d0*v95
    v103        = 2835.0d0*v645
    v107        = 2835.0d0*v647
    v113        = v648
    v115        = 945.0d0*v645
    v118        = v647
    v123        = 2835.0d0*v648
    D_xxxxxxxx  = v96*(v98 - 12012.0d0*v100 + 6930.0d0*v101 - 1260.0d0*v102 + 6435.0d0*v99 &
      )
    L_xxxxxxxx  = D_xxxxxxxx*M_0
    D_xxxxxxxy  = v103*v106
    L_xxxxxxxy  = D_xxxxxxxy*M_0
    D_xxxxxxxz  = v106*v107
    L_xxxxxxxz  = D_xxxxxxxz*M_0
    D_xxxxxxyy  = -v96*(v653 + h*v73 + v1*v110 - 495.0d0*v101 + 135.0d0*v102 + 6435.0d0*( &
      -v111 + v112))
    v155        = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy  = D_xxxxxxyy*M_0
    D_xxxxxxyz  = v113*(v114 + 467775.0d0*v623 + 155925.0d0*(13.0d0*v49 - 13.0d0*v622))
    L_xxxxxxyz  = D_xxxxxxyz*M_0
    D_xxxxxxzz  = -(D_xxxxxxxx + D_xxxxxxyy)
    v158        = 0.5d0*D_xxxxxxzz
    D_xxxxxyyy  = v115*(v654 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v167        = 0.5d0*D_xxxxxyyy
    v180        = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy  = D_xxxxxyyy*M_0
    D_xxxxxyyz  = v118*(v655 + 2027025.0d0*v612 - 135135.0d0*v622 + 103950.0d0*v623 + &
      155925.0d0*v625)
    v183        = 0.5d0*D_xxxxxyyz
    L_xxxxxyyz  = D_xxxxxyyz*M_0
    D_xxxxxyzz  = -(D_xxxxxxxy + D_xxxxxyyy)
    v170        = 0.5d0*D_xxxxxyzz
    D_xxxxxzzz  = -(D_xxxxxxxz + D_xxxxxyyz)
    v186        = 0.166666666666667d0*D_xxxxxzzz
    v188        = 0.5d0*D_xxxxxzzz
    D_xxxxyyyy  = 945.0d0*v95*(v97 + 396.0d0*v108 + 2145.0d0*v121 + v17*v54 + v17*v66 - &
      18.0d0*(v102 + v120) - 858.0d0*(v112 + v122))
    v194        = 0.5d0*D_xxxxyyyy
    v201        = 0.166666666666667d0*D_xxxxyyyy
    v223        = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy  = D_xxxxyyyy*M_0
    D_xxxxyyyz  = v123*(v125 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v204        = 0.5d0*D_xxxxyyyz
    v226        = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyyz  = D_xxxxyyyz*M_0
    D_xxxxyyzz  = -(D_xxxxxxyy + D_xxxxyyyy)
    v197        = 0.5d0*D_xxxxyyzz
    v229        = 0.25d0*D_xxxxyyzz
    D_xxxxyzzz  = -(D_xxxxxxyz + D_xxxxyyyz)
    v207        = 0.166666666666667d0*D_xxxxyzzz
    v209        = 0.5d0*D_xxxxyzzz
    D_xxxxzzzz  = -(D_xxxxxxzz + D_xxxxyyzz)
    v233        = 0.0416666666666667d0*D_xxxxzzzz
    v238        = 0.166666666666667d0*D_xxxxzzzz
    D_xxxyyyyy  = v115*(v654 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v243        = 0.5d0*D_xxxyyyyy
    v250        = 0.166666666666667d0*D_xxxyyyyy
    v262        = 0.0416666666666667d0*D_xxxyyyyy
    v297        = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy  = D_xxxyyyyy*M_0
    D_xxxyyyyz  = v107*(v125 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v253        = 0.5d0*D_xxxyyyyz
    v265        = 0.166666666666667d0*D_xxxyyyyz
    v300        = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyyz  = D_xxxyyyyz*M_0
    D_xxxyyyzz  = -(D_xxxxxyyy + D_xxxyyyyy)
    v246        = 0.5d0*D_xxxyyyzz
    v268        = 0.25d0*D_xxxyyyzz
    v303        = 0.0833333333333333d0*D_xxxyyyzz
    v315        = 0.166666666666667d0*D_xxxyyyzz
    D_xxxyyzzz  = -(D_xxxxxyyz + D_xxxyyyyz)
    v256        = 0.166666666666667d0*D_xxxyyzzz
    v258        = 0.5d0*D_xxxyyzzz
    v307        = 0.0833333333333333d0*D_xxxyyzzz
    v316        = 0.25d0*D_xxxyyzzz
    D_xxxyzzzz  = -(D_xxxxxyzz + D_xxxyyyzz)
    v272        = 0.0416666666666667d0*D_xxxyzzzz
    v277        = 0.166666666666667d0*D_xxxyzzzz
    D_xxxzzzzz  = -(D_xxxxxzzz + D_xxxyyzzz)
    v312        = 0.00833333333333333d0*D_xxxzzzzz
    v320        = 0.0416666666666667d0*D_xxxzzzzz
    D_xxyyyyyy  = -v96*(v653 + h*v92 + v0*v110 + 135.0d0*v120 - 495.0d0*v126 + 6435.0d0*( &
      v122 - v127))
    v324        = 0.5d0*D_xxyyyyyy
    v331        = 0.166666666666667d0*D_xxyyyyyy
    v343        = 0.0416666666666667d0*D_xxyyyyyy
    v363        = 0.00833333333333333d0*D_xxyyyyyy
    v413        = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy  = D_xxyyyyyy*M_0
    D_xxyyyyyz  = v113*(v655 + 2027025.0d0*v613 + 155925.0d0*v623 + 103950.0d0*v625 - &
      135135.0d0*v626)
    v334        = 0.5d0*D_xxyyyyyz
    v346        = 0.166666666666667d0*D_xxyyyyyz
    v366        = 0.0416666666666667d0*D_xxyyyyyz
    v416        = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyyz  = D_xxyyyyyz*M_0
    D_xxyyyyzz  = -(D_xxxxyyyy + D_xxyyyyyy)
    v327        = 0.5d0*D_xxyyyyzz
    v349        = 0.25d0*D_xxyyyyzz
    v369        = 0.0833333333333333d0*D_xxyyyyzz
    v381        = 0.166666666666667d0*D_xxyyyyzz
    v419        = 0.0208333333333333d0*D_xxyyyyzz
    v437        = 0.0416666666666667d0*D_xxyyyyzz
    D_xxyyyzzz  = -(D_xxxxyyyz + D_xxyyyyyz)
    v337        = 0.166666666666667d0*D_xxyyyzzz
    v339        = 0.5d0*D_xxyyyzzz
    v373        = 0.0833333333333333d0*D_xxyyyzzz
    v382        = 0.25d0*D_xxyyyzzz
    v423        = 0.0277777777777778d0*D_xxyyyzzz
    D_xxyyzzzz  = -(D_xxxxyyzz + D_xxyyyyzz)
    v353        = 0.0416666666666667d0*D_xxyyzzzz
    v358        = 0.166666666666667d0*D_xxyyzzzz
    v428        = 0.0208333333333333d0*D_xxyyzzzz
    v442        = 0.0833333333333333d0*D_xxyyzzzz
    D_xxyzzzzz  = -(D_xxxxyzzz + D_xxyyyzzz)
    v378        = 0.00833333333333333d0*D_xxyzzzzz
    v386        = 0.0416666666666667d0*D_xxyzzzzz
    D_xxzzzzzz  = -(D_xxxxzzzz + D_xxyyzzzz)
    v434        = 0.00138888888888889d0*D_xxzzzzzz
    v447        = 0.00833333333333333d0*D_xxzzzzzz
    D_xyyyyyyy  = v103*v129
    L_xyyyyyyy  = D_xyyyyyyy*M_0
    D_xyyyyyyz  = v118*(v114 + 467775.0d0*v625 + 155925.0d0*(-13.0d0*v626 + 13.0d0*v68))
    v459        = 0.5d0*D_xyyyyyyz
    v468        = 0.166666666666667d0*D_xyyyyyyz
    v484        = 0.0416666666666667d0*D_xyyyyyyz
    v508        = 0.00833333333333333d0*D_xyyyyyyz
    L_xyyyyyyz  = D_xyyyyyyz*M_0
    D_xyyyyyzz  = -(D_xxxyyyyy + D_xyyyyyyy)
    v454        = 0.5d0*D_xyyyyyzz
    v471        = 0.25d0*D_xyyyyyzz
    v487        = 0.0833333333333333d0*D_xyyyyyzz
    v499        = 0.166666666666667d0*D_xyyyyyzz
    v511        = 0.0208333333333333d0*D_xyyyyyzz
    v529        = 0.0416666666666667d0*D_xyyyyyzz
    D_xyyyyzzz  = -(D_xxxyyyyz + D_xyyyyyyz)
    v462        = 0.166666666666667d0*D_xyyyyzzz
    v464        = 0.5d0*D_xyyyyzzz
    v491        = 0.0833333333333333d0*D_xyyyyzzz
    v500        = 0.25d0*D_xyyyyzzz
    v515        = 0.0277777777777778d0*D_xyyyyzzz
    D_xyyyzzzz  = -(D_xxxyyyzz + D_xyyyyyzz)
    v475        = 0.0416666666666667d0*D_xyyyzzzz
    v480        = 0.166666666666667d0*D_xyyyzzzz
    v520        = 0.0208333333333333d0*D_xyyyzzzz
    v534        = 0.0833333333333333d0*D_xyyyzzzz
    D_xyyzzzzz  = -(D_xxxyyzzz + D_xyyyyzzz)
    v496        = 0.00833333333333333d0*D_xyyzzzzz
    v504        = 0.0416666666666667d0*D_xyyzzzzz
    D_xyzzzzzz  = -(D_xxxyzzzz + D_xyyyzzzz)
    v526        = 0.00138888888888889d0*D_xyzzzzzz
    v539        = 0.00833333333333333d0*D_xyzzzzzz
    D_xzzzzzzz  = -(D_xxxzzzzz + D_xyyzzzzz)
    D_yyyyyyyy  = v96*(v98 - 1260.0d0*v120 + 6930.0d0*v126 + 6435.0d0*v130 - 12012.0d0* &
      v131)
    L_yyyyyyyy  = D_yyyyyyyy*M_0
    D_yyyyyyyz  = v123*v129
    L_yyyyyyyz  = D_yyyyyyyz*M_0
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
    v664        = v132*x
    v649        = v664
    v650        = v132*y
    v651        = v132*z
    v133        = 2835.0d0*v649
    v135        = v650
    v138        = v651
    v140        = 155925.0d0*v643*v664
    v147        = 14175.0d0*v651
    v190        = 2835.0d0*v650
    v240        = v649
    D_xxxxxxxxx = v133*(v134 + 25740.0d0*v100 - 18018.0d0*v101 + 4620.0d0*v102 - 12155.0d0 &
      *v99)
    L_xxxxxxxxx = D_xxxxxxxxx*M_0
    D_xxxxxxxxy = v135*v137
    L_xxxxxxxxy = D_xxxxxxxxy*M_0
    D_xxxxxxxxz = v137*v138
    L_xxxxxxxxz = D_xxxxxxxxz*M_0
    D_xxxxxxxyy = v133*(v139 + h*v105 - 1001.0d0*v101 - 12155.0d0*v111 + 15015.0d0*v112)
    v143        = 0.5d0*D_xxxxxxxyy
    L_xxxxxxxyy = D_xxxxxxxyy*M_0
    D_xxxxxxxyz = v140*(v141 - 221.0d0*v49 + 273.0d0*v50 - 91.0d0*v51)
    L_xxxxxxxyz = D_xxxxxxxyz*M_0
    D_xxxxxxxzz = -(D_xxxxxxxxx + D_xxxxxxxyy)
    v144        = 0.5d0*D_xxxxxxxzz
    L_xxxxxxx   = D_xxxxxxx*M_0 + D_xxxxxxxxx*v142 + D_xxxxxxxxy*M_xy + D_xxxxxxxxz*M_xz + &
      D_xxxxxxxyz*M_yz + M_yy*v143 + M_zz*v144
    D_xxxxxxyyy = v135*(v656 - 34459425.0d0*v616 + 1403325.0d0*v629 + 30405375.0d0*v631 + &
      155925.0d0*(39.0d0*v627 - 39.0d0*v628 + v632))
    v150        = 0.5d0*D_xxxxxxyyy
    v156        = 0.166666666666667d0*D_xxxxxxyyy
    L_xxxxxxyyy = D_xxxxxxyyy*M_0
    D_xxxxxxyyz = v147*(v148 + v149 + 33.0d0*v102 - 2431.0d0*v111 + 2145.0d0*v112 + 11.0d0 &
      *v120 + 143.0d0*v627)
    v157        = 0.5d0*D_xxxxxxyyz
    L_xxxxxxyyz = D_xxxxxxyyz*M_0
    D_xxxxxxyzz = -(D_xxxxxxxxy + D_xxxxxxyyy)
    v151        = 0.5d0*D_xxxxxxyzz
    L_xxxxxxy   = D_xxxxxxxxy*v142 + D_xxxxxxxyy*M_xy + D_xxxxxxxyz*M_xz + D_xxxxxxy*M_0 + &
      D_xxxxxxyyz*M_yz + M_yy*v150 + M_zz*v151
    D_xxxxxxzzz = -(D_xxxxxxxxz + D_xxxxxxyyz)
    v159        = 0.166666666666667d0*D_xxxxxxzzz
    v160        = 0.5d0*D_xxxxxxzzz
    L_xxxxxx    = D_xxxxxx*M_0 + D_xxxxxxxx*v142 + D_xxxxxxxxx*v152 + D_xxxxxxxxy*v153 + &
      D_xxxxxxxxz*v154 + D_xxxxxxxy*M_xy + D_xxxxxxxyz*M_xyz + &
      D_xxxxxxxz*M_xz + D_xxxxxxyz*M_yz + M_xyy*v143 + M_xzz*v144 + &
      M_yy*v155 + M_yyy*v156 + M_yyz*v157 + M_yzz*v151 + M_zz*v158 + &
      M_zzz*v159
    L_xxxxxxz   = D_xxxxxxxxz*v142 + D_xxxxxxxyz*M_xy + D_xxxxxxxzz*M_xz + D_xxxxxxyzz* &
      M_yz + D_xxxxxxz*M_0 + M_yy*v157 + M_zz*v160
    D_xxxxxyyyy = v133*(v149 + v657 + 110.0d0*v102 + 4290.0d0*v112 + 330.0d0*v120 + &
      7150.0d0*v122 - 715.0d0*v126)
    v165        = 0.5d0*D_xxxxxyyyy
    v168        = 0.166666666666667d0*D_xxxxxyyyy
    v181        = 0.0416666666666667d0*D_xxxxxyyyy
    L_xxxxxyyyy = D_xxxxxyyyy*M_0
    D_xxxxxyyyz = -v140*(v658 - 39.0d0*v50 + 26.0d0*v51 + 221.0d0*v59 + 13.0d0*v64)
    v169        = 0.5d0*D_xxxxxyyyz
    v182        = 0.166666666666667d0*D_xxxxxyyyz
    L_xxxxxyyyz = D_xxxxxyyyz*M_0
    D_xxxxxyyzz = -(D_xxxxxxxyy + D_xxxxxyyyy)
    v166        = 0.5d0*D_xxxxxyyzz
    v184        = 0.25d0*D_xxxxxyyzz
    L_xxxxxyy   = D_xxxxxxxyy*v142 + D_xxxxxxyyy*M_xy + D_xxxxxxyyz*M_xz + D_xxxxxyy*M_0 + &
      D_xxxxxyyyz*M_yz + M_yy*v165 + M_zz*v166
    D_xxxxxyzzz = -(D_xxxxxxxyz + D_xxxxxyyyz)
    v171        = 0.166666666666667d0*D_xxxxxyzzz
    v172        = 0.5d0*D_xxxxxyzzz
    L_xxxxxy    = D_xxxxxxxxy*v152 + D_xxxxxxxy*v142 + D_xxxxxxxyy*v153 + D_xxxxxxxyz*v154 &
      + D_xxxxxxyy*M_xy + D_xxxxxxyyz*M_xyz + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyyz*M_yz + M_xyy*v150 + M_xzz*v151 + M_yy* &
      v167 + M_yyy*v168 + M_yyz*v169 + M_yzz*v166 + M_zz*v170 + M_zzz* &
      v171
    L_xxxxxyz   = D_xxxxxxxyz*v142 + D_xxxxxxyyz*M_xy + D_xxxxxxyzz*M_xz + D_xxxxxyyzz* &
      M_yz + D_xxxxxyz*M_0 + M_yy*v169 + M_zz*v172
    D_xxxxxzzzz = -(D_xxxxxxxzz + D_xxxxxyyzz)
    v187        = 0.0416666666666667d0*D_xxxxxzzzz
    v189        = 0.166666666666667d0*D_xxxxxzzzz
    L_xxxxx     = D_xxxxx*M_0 + D_xxxxxxx*v142 + D_xxxxxxxx*v152 + D_xxxxxxxxx*v173 + &
      D_xxxxxxxxy*v174 + D_xxxxxxxxz*v175 + D_xxxxxxxy*v153 + &
      D_xxxxxxxyy*v176 + D_xxxxxxxyz*v177 + D_xxxxxxxz*v154 + &
      D_xxxxxxxzz*v178 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz* &
      M_xz + D_xxxxxyz*M_yz + M_xyy*v155 + M_xyyy*v156 + M_xyyz*v157 + &
      M_xyzz*v151 + M_xzz*v158 + M_xzzz*v159 + M_yy*v179 + M_yyy*v180 + &
      M_yyyy*v181 + M_yyyz*v182 + M_yyz*v183 + M_yyzz*v184 + M_yzz*v170 &
      + M_yzzz*v171 + M_zz*v185 + M_zzz*v186 + M_zzzz*v187
    L_xxxxxz    = D_xxxxxxxxz*v152 + D_xxxxxxxyz*v153 + D_xxxxxxxz*v142 + D_xxxxxxxzz*v154 &
      + D_xxxxxxyz*M_xy + D_xxxxxxyzz*M_xyz + D_xxxxxxzz*M_xz + &
      D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + M_xyy*v157 + M_xzz*v160 + M_yy* &
      v183 + M_yyy*v182 + M_yyz*v166 + M_yzz*v172 + M_zz*v188 + M_zzz* &
      v189
    D_xxxxyyyyy = v190*(v191 + v657 - 715.0d0*v101 + 330.0d0*v102 + 7150.0d0*v112 + &
      110.0d0*v120 + 4290.0d0*v122)
    v192        = 0.5d0*D_xxxxyyyyy
    v195        = 0.166666666666667d0*D_xxxxyyyyy
    v202        = 0.0416666666666667d0*D_xxxxyyyyy
    v224        = 0.00833333333333333d0*D_xxxxyyyyy
    L_xxxxyyyyy = D_xxxxyyyyy*M_0
    D_xxxxyyyyz = -2835.0d0*v138*(v17*v614 + v17*v615 + 12155.0d0*v617 + 1716.0d0*v630 + &
      3.0d0*v97 - 66.0d0*(v629 + v632) - 4290.0d0*(v631 + v633))
    v196        = 0.5d0*D_xxxxyyyyz
    v203        = 0.166666666666667d0*D_xxxxyyyyz
    v225        = 0.0416666666666667d0*D_xxxxyyyyz
    L_xxxxyyyyz = D_xxxxyyyyz*M_0
    D_xxxxyyyzz = -(D_xxxxxxyyy + D_xxxxyyyyy)
    v193        = 0.5d0*D_xxxxyyyzz
    v205        = 0.25d0*D_xxxxyyyzz
    v227        = 0.0833333333333333d0*D_xxxxyyyzz
    v235        = 0.166666666666667d0*D_xxxxyyyzz
    L_xxxxyyy   = D_xxxxxxyyy*v142 + D_xxxxxyyyy*M_xy + D_xxxxxyyyz*M_xz + D_xxxxyyy*M_0 + &
      D_xxxxyyyyz*M_yz + M_yy*v192 + M_zz*v193
    D_xxxxyyzzz = -(D_xxxxxxyyz + D_xxxxyyyyz)
    v198        = 0.166666666666667d0*D_xxxxyyzzz
    v199        = 0.5d0*D_xxxxyyzzz
    v230        = 0.0833333333333333d0*D_xxxxyyzzz
    v236        = 0.25d0*D_xxxxyyzzz
    L_xxxxyy    = D_xxxxxxxyy*v152 + D_xxxxxxyy*v142 + D_xxxxxxyyy*v153 + D_xxxxxxyyz*v154 &
      + D_xxxxxyyy*M_xy + D_xxxxxyyyz*M_xyz + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyyz*M_yz + M_xyy*v165 + M_xzz*v166 + M_yy* &
      v194 + M_yyy*v195 + M_yyz*v196 + M_yzz*v193 + M_zz*v197 + M_zzz* &
      v198
    L_xxxxyyz   = D_xxxxxxyyz*v142 + D_xxxxxyyyz*M_xy + D_xxxxxyyzz*M_xz + D_xxxxyyyzz* &
      M_yz + D_xxxxyyz*M_0 + M_yy*v196 + M_zz*v199
    D_xxxxyzzzz = -(D_xxxxxxyzz + D_xxxxyyyzz)
    v208        = 0.0416666666666667d0*D_xxxxyzzzz
    v210        = 0.166666666666667d0*D_xxxxyzzzz
    L_xxxxy     = D_xxxxxxxxy*v173 + D_xxxxxxxy*v152 + D_xxxxxxxyy*v174 + D_xxxxxxxyz*v175 &
      + D_xxxxxxy*v142 + D_xxxxxxyy*v153 + D_xxxxxxyyy*v176 + &
      D_xxxxxxyyz*v177 + D_xxxxxxyz*v154 + D_xxxxxxyzz*v178 + D_xxxxxyy &
      *M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + M_xyy*v167 + M_xyyy*v168 + M_xyyz*v169 + M_xyzz* &
      v166 + M_xzz*v170 + M_xzzz*v171 + M_yy*v200 + M_yyy*v201 + M_yyyy &
      *v202 + M_yyyz*v203 + M_yyz*v204 + M_yyzz*v205 + M_yzz*v197 + &
      M_yzzz*v198 + M_zz*v206 + M_zzz*v207 + M_zzzz*v208
    L_xxxxyz    = D_xxxxxxxyz*v152 + D_xxxxxxyyz*v153 + D_xxxxxxyz*v142 + D_xxxxxxyzz*v154 &
      + D_xxxxxyyz*M_xy + D_xxxxxyyzz*M_xyz + D_xxxxxyzz*M_xz + &
      D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + M_xyy*v169 + M_xzz*v172 + M_yy* &
      v204 + M_yyy*v203 + M_yyz*v193 + M_yzz*v199 + M_zz*v209 + M_zzz* &
      v210
    D_xxxxzzzzz = -(D_xxxxxxzzz + D_xxxxyyzzz)
    v234        = 0.00833333333333333d0*D_xxxxzzzzz
    v239        = 0.0416666666666667d0*D_xxxxzzzzz
    L_xxxx      = D_xxxx*M_0 + D_xxxxxx*v142 + D_xxxxxxx*v152 + D_xxxxxxxx*v173 + &
      D_xxxxxxxxx*v211 + D_xxxxxxxxy*v212 + D_xxxxxxxxz*v213 + &
      D_xxxxxxxy*v174 + D_xxxxxxxyy*v214 + D_xxxxxxxyz*v215 + &
      D_xxxxxxxz*v175 + D_xxxxxxxzz*v216 + D_xxxxxxy*v153 + D_xxxxxxyy* &
      v176 + D_xxxxxxyyy*v217 + D_xxxxxxyyz*v218 + D_xxxxxxyz*v177 + &
      D_xxxxxxyzz*v219 + D_xxxxxxz*v154 + D_xxxxxxzz*v178 + D_xxxxxxzzz &
      *v220 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + &
      D_xxxxyz*M_yz + M_xyy*v179 + M_xyyy*v180 + M_xyyyy*v181 + M_xyyyz &
      *v182 + M_xyyz*v183 + M_xyyzz*v184 + M_xyzz*v170 + M_xyzzz*v171 + &
      M_xzz*v185 + M_xzzz*v186 + M_xzzzz*v187 + M_yy*v221 + M_yyy*v222 &
      + M_yyyy*v223 + M_yyyyy*v224 + M_yyyyz*v225 + M_yyyz*v226 + &
      M_yyyzz*v227 + M_yyz*v228 + M_yyzz*v229 + M_yyzzz*v230 + M_yzz* &
      v206 + M_yzzz*v207 + M_yzzzz*v208 + M_zz*v231 + M_zzz*v232 + &
      M_zzzz*v233 + M_zzzzz*v234
    L_xxxxz     = D_xxxxxxxxz*v173 + D_xxxxxxxyz*v174 + D_xxxxxxxz*v152 + D_xxxxxxxzz*v175 &
      + D_xxxxxxyyz*v176 + D_xxxxxxyz*v153 + D_xxxxxxyzz*v177 + &
      D_xxxxxxz*v142 + D_xxxxxxzz*v154 + D_xxxxxxzzz*v178 + D_xxxxxyz* &
      M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + M_xyy*v183 + M_xyyy*v182 + M_xyyz*v166 + M_xyzz* &
      v172 + M_xzz*v188 + M_xzzz*v189 + M_yy*v228 + M_yyy*v226 + M_yyyy &
      *v225 + M_yyyz*v235 + M_yyz*v197 + M_yyzz*v236 + M_yzz*v209 + &
      M_yzzz*v210 + M_zz*v237 + M_zzz*v238 + M_zzzz*v239
    D_xxxyyyyyy = v240*(v656 - 34459425.0d0*v618 + 1403325.0d0*v632 + 30405375.0d0*v633 + &
      155925.0d0*(v629 - 39.0d0*v634 + 39.0d0*v635))
    v241        = 0.5d0*D_xxxyyyyyy
    v244        = 0.166666666666667d0*D_xxxyyyyyy
    v251        = 0.0416666666666667d0*D_xxxyyyyyy
    v263        = 0.00833333333333333d0*D_xxxyyyyyy
    v298        = 0.00138888888888889d0*D_xxxyyyyyy
    L_xxxyyyyyy = D_xxxyyyyyy*M_0
    D_xxxyyyyyz = -v140*(v658 + 13.0d0*v51 + 26.0d0*v64 + 221.0d0*v65 - 39.0d0*v69)
    v245        = 0.5d0*D_xxxyyyyyz
    v252        = 0.166666666666667d0*D_xxxyyyyyz
    v264        = 0.0416666666666667d0*D_xxxyyyyyz
    v299        = 0.00833333333333333d0*D_xxxyyyyyz
    L_xxxyyyyyz = D_xxxyyyyyz*M_0
    D_xxxyyyyzz = -(D_xxxxxyyyy + D_xxxyyyyyy)
    v242        = 0.5d0*D_xxxyyyyzz
    v254        = 0.25d0*D_xxxyyyyzz
    v266        = 0.0833333333333333d0*D_xxxyyyyzz
    v274        = 0.166666666666667d0*D_xxxyyyyzz
    v301        = 0.0208333333333333d0*D_xxxyyyyzz
    v314        = 0.0416666666666667d0*D_xxxyyyyzz
    L_xxxyyyy   = D_xxxxxyyyy*v142 + D_xxxxyyyyy*M_xy + D_xxxxyyyyz*M_xz + D_xxxyyyy*M_0 + &
      D_xxxyyyyyz*M_yz + M_yy*v241 + M_zz*v242
    D_xxxyyyzzz = -(D_xxxxxyyyz + D_xxxyyyyyz)
    v247        = 0.166666666666667d0*D_xxxyyyzzz
    v248        = 0.5d0*D_xxxyyyzzz
    v269        = 0.0833333333333333d0*D_xxxyyyzzz
    v275        = 0.25d0*D_xxxyyyzzz
    v304        = 0.0277777777777778d0*D_xxxyyyzzz
    L_xxxyyy    = D_xxxxxxyyy*v152 + D_xxxxxyyy*v142 + D_xxxxxyyyy*v153 + D_xxxxxyyyz*v154 &
      + D_xxxxyyyy*M_xy + D_xxxxyyyyz*M_xyz + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyyz*M_yz + M_xyy*v192 + M_xzz*v193 + M_yy* &
      v243 + M_yyy*v244 + M_yyz*v245 + M_yzz*v242 + M_zz*v246 + M_zzz* &
      v247
    L_xxxyyyz   = D_xxxxxyyyz*v142 + D_xxxxyyyyz*M_xy + D_xxxxyyyzz*M_xz + D_xxxyyyyzz* &
      M_yz + D_xxxyyyz*M_0 + M_yy*v245 + M_zz*v248
    D_xxxyyzzzz = -(D_xxxxxyyzz + D_xxxyyyyzz)
    v257        = 0.0416666666666667d0*D_xxxyyzzzz
    v259        = 0.166666666666667d0*D_xxxyyzzzz
    v308        = 0.0208333333333333d0*D_xxxyyzzzz
    v317        = 0.0833333333333333d0*D_xxxyyzzzz
    L_xxxyy     = D_xxxxxxxyy*v173 + D_xxxxxxyy*v152 + D_xxxxxxyyy*v174 + D_xxxxxxyyz*v175 &
      + D_xxxxxyy*v142 + D_xxxxxyyy*v153 + D_xxxxxyyyy*v176 + &
      D_xxxxxyyyz*v177 + D_xxxxxyyz*v154 + D_xxxxxyyzz*v178 + D_xxxxyyy &
      *M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + M_xyy*v194 + M_xyyy*v195 + M_xyyz*v196 + M_xyzz* &
      v193 + M_xzz*v197 + M_xzzz*v198 + M_yy*v249 + M_yyy*v250 + M_yyyy &
      *v251 + M_yyyz*v252 + M_yyz*v253 + M_yyzz*v254 + M_yzz*v246 + &
      M_yzzz*v247 + M_zz*v255 + M_zzz*v256 + M_zzzz*v257
    L_xxxyyz    = D_xxxxxxyyz*v152 + D_xxxxxyyyz*v153 + D_xxxxxyyz*v142 + D_xxxxxyyzz*v154 &
      + D_xxxxyyyz*M_xy + D_xxxxyyyzz*M_xyz + D_xxxxyyzz*M_xz + &
      D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + M_xyy*v196 + M_xzz*v199 + M_yy* &
      v253 + M_yyy*v252 + M_yyz*v242 + M_yzz*v248 + M_zz*v258 + M_zzz* &
      v259
    D_xxxyzzzzz = -(D_xxxxxyzzz + D_xxxyyyzzz)
    v273        = 0.00833333333333333d0*D_xxxyzzzzz
    v278        = 0.0416666666666667d0*D_xxxyzzzzz
    L_xxxy      = D_xxxxxxxxy*v211 + D_xxxxxxxy*v173 + D_xxxxxxxyy*v212 + D_xxxxxxxyz*v213 &
      + D_xxxxxxy*v152 + D_xxxxxxyy*v174 + D_xxxxxxyyy*v214 + &
      D_xxxxxxyyz*v215 + D_xxxxxxyz*v175 + D_xxxxxxyzz*v216 + D_xxxxxy* &
      v142 + D_xxxxxyy*v153 + D_xxxxxyyy*v176 + D_xxxxxyyyy*v217 + &
      D_xxxxxyyyz*v218 + D_xxxxxyyz*v177 + D_xxxxxyyzz*v219 + D_xxxxxyz &
      *v154 + D_xxxxxyzz*v178 + D_xxxxxyzzz*v220 + D_xxxxyy*M_xy + &
      D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz*M_yz + &
      M_xyy*v200 + M_xyyy*v201 + M_xyyyy*v202 + M_xyyyz*v203 + M_xyyz* &
      v204 + M_xyyzz*v205 + M_xyzz*v197 + M_xyzzz*v198 + M_xzz*v206 + &
      M_xzzz*v207 + M_xzzzz*v208 + M_yy*v260 + M_yyy*v261 + M_yyyy*v262 &
      + M_yyyyy*v263 + M_yyyyz*v264 + M_yyyz*v265 + M_yyyzz*v266 + &
      M_yyz*v267 + M_yyzz*v268 + M_yyzzz*v269 + M_yzz*v255 + M_yzzz* &
      v256 + M_yzzzz*v257 + M_zz*v270 + M_zzz*v271 + M_zzzz*v272 + &
      M_zzzzz*v273
    L_xxxyz     = D_xxxxxxxyz*v173 + D_xxxxxxyyz*v174 + D_xxxxxxyz*v152 + D_xxxxxxyzz*v175 &
      + D_xxxxxyyyz*v176 + D_xxxxxyyz*v153 + D_xxxxxyyzz*v177 + &
      D_xxxxxyz*v142 + D_xxxxxyzz*v154 + D_xxxxxyzzz*v178 + D_xxxxyyz* &
      M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + M_xyy*v204 + M_xyyy*v203 + M_xyyz*v193 + M_xyzz* &
      v199 + M_xzz*v209 + M_xzzz*v210 + M_yy*v267 + M_yyy*v265 + M_yyyy &
      *v264 + M_yyyz*v274 + M_yyz*v246 + M_yyzz*v275 + M_yzz*v258 + &
      M_yzzz*v259 + M_zz*v276 + M_zzz*v277 + M_zzzz*v278
    D_xxxzzzzzz = -(D_xxxxxzzzz + D_xxxyyzzzz)
    v313        = 0.00138888888888889d0*D_xxxzzzzzz
    v321        = 0.00833333333333333d0*D_xxxzzzzzz
    L_xxx       = D_xxx*M_0 + D_xxxxx*v142 + D_xxxxxx*v152 + D_xxxxxxx*v173 + D_xxxxxxxx* &
      v211 + D_xxxxxxxxx*v279 + D_xxxxxxxxy*v280 + D_xxxxxxxxz*v281 + &
      D_xxxxxxxy*v212 + D_xxxxxxxyy*v282 + D_xxxxxxxyz*v283 + &
      D_xxxxxxxz*v213 + D_xxxxxxxzz*v284 + D_xxxxxxy*v174 + D_xxxxxxyy* &
      v214 + D_xxxxxxyyy*v285 + D_xxxxxxyyz*v286 + D_xxxxxxyz*v215 + &
      D_xxxxxxyzz*v287 + D_xxxxxxz*v175 + D_xxxxxxzz*v216 + D_xxxxxxzzz &
      *v288 + D_xxxxxy*v153 + D_xxxxxyy*v176 + D_xxxxxyyy*v217 + &
      D_xxxxxyyyy*v289 + D_xxxxxyyyz*v290 + D_xxxxxyyz*v218 + &
      D_xxxxxyyzz*v291 + D_xxxxxyz*v177 + D_xxxxxyzz*v219 + D_xxxxxyzzz &
      *v292 + D_xxxxxz*v154 + D_xxxxxzz*v178 + D_xxxxxzzz*v220 + &
      D_xxxxxzzzz*v293 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxyz*M_yz + M_xyy*v221 + M_xyyy*v222 + M_xyyyy*v223 + M_xyyyyy &
      *v224 + M_xyyyyz*v225 + M_xyyyz*v226 + M_xyyyzz*v227 + M_xyyz* &
      v228 + M_xyyzz*v229 + M_xyyzzz*v230 + M_xyzz*v206 + M_xyzzz*v207 &
      + M_xyzzzz*v208 + M_xzz*v231 + M_xzzz*v232 + M_xzzzz*v233 + &
      M_xzzzzz*v234 + M_yy*v294 + M_yyy*v295 + M_yyyy*v296 + M_yyyyy* &
      v297 + M_yyyyyy*v298 + M_yyyyyz*v299 + M_yyyyz*v300 + M_yyyyzz* &
      v301 + M_yyyz*v302 + M_yyyzz*v303 + M_yyyzzz*v304 + M_yyz*v305 + &
      M_yyzz*v306 + M_yyzzz*v307 + M_yyzzzz*v308 + M_yzz*v270 + M_yzzz* &
      v271 + M_yzzzz*v272 + M_yzzzzz*v273 + M_zz*v309 + M_zzz*v310 + &
      M_zzzz*v311 + M_zzzzz*v312 + M_zzzzzz*v313
    L_xxxz      = D_xxxxxxxxz*v211 + D_xxxxxxxyz*v212 + D_xxxxxxxz*v173 + D_xxxxxxxzz*v213 &
      + D_xxxxxxyyz*v214 + D_xxxxxxyz*v174 + D_xxxxxxyzz*v215 + &
      D_xxxxxxz*v152 + D_xxxxxxzz*v175 + D_xxxxxxzzz*v216 + D_xxxxxyyyz &
      *v217 + D_xxxxxyyz*v176 + D_xxxxxyyzz*v218 + D_xxxxxyz*v153 + &
      D_xxxxxyzz*v177 + D_xxxxxyzzz*v219 + D_xxxxxz*v142 + D_xxxxxzz* &
      v154 + D_xxxxxzzz*v178 + D_xxxxxzzzz*v220 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz*M_0 + &
      M_xyy*v228 + M_xyyy*v226 + M_xyyyy*v225 + M_xyyyz*v235 + M_xyyz* &
      v197 + M_xyyzz*v236 + M_xyzz*v209 + M_xyzzz*v210 + M_xzz*v237 + &
      M_xzzz*v238 + M_xzzzz*v239 + M_yy*v305 + M_yyy*v302 + M_yyyy*v300 &
      + M_yyyyy*v299 + M_yyyyz*v314 + M_yyyz*v315 + M_yyyzz*v269 + &
      M_yyz*v255 + M_yyzz*v316 + M_yyzzz*v317 + M_yzz*v276 + M_yzzz* &
      v277 + M_yzzzz*v278 + M_zz*v318 + M_zzz*v319 + M_zzzz*v320 + &
      M_zzzzz*v321
    D_xxyyyyyyy = v190*(v139 + h*v128 + 15015.0d0*v122 - 1001.0d0*v126 - 12155.0d0*v127)
    v322        = 0.5d0*D_xxyyyyyyy
    v325        = 0.166666666666667d0*D_xxyyyyyyy
    v332        = 0.0416666666666667d0*D_xxyyyyyyy
    v344        = 0.00833333333333333d0*D_xxyyyyyyy
    v364        = 0.00138888888888889d0*D_xxyyyyyyy
    v414        = 0.000198412698412698d0*D_xxyyyyyyy
    L_xxyyyyyyy = D_xxyyyyyyy*M_0
    D_xxyyyyyyz = v147*(v148 + v191 + 11.0d0*v102 + 33.0d0*v120 + 2145.0d0*v122 - 2431.0d0 &
      *v127 + 143.0d0*v635)
    v326        = 0.5d0*D_xxyyyyyyz
    v333        = 0.166666666666667d0*D_xxyyyyyyz
    v345        = 0.0416666666666667d0*D_xxyyyyyyz
    v365        = 0.00833333333333333d0*D_xxyyyyyyz
    v415        = 0.00138888888888889d0*D_xxyyyyyyz
    L_xxyyyyyyz = D_xxyyyyyyz*M_0
    D_xxyyyyyzz = -(D_xxxxyyyyy + D_xxyyyyyyy)
    v323        = 0.5d0*D_xxyyyyyzz
    v335        = 0.25d0*D_xxyyyyyzz
    v347        = 0.0833333333333333d0*D_xxyyyyyzz
    v355        = 0.166666666666667d0*D_xxyyyyyzz
    v367        = 0.0208333333333333d0*D_xxyyyyyzz
    v380        = 0.0416666666666667d0*D_xxyyyyyzz
    v417        = 0.00416666666666667d0*D_xxyyyyyzz
    v436        = 0.00833333333333333d0*D_xxyyyyyzz
    L_xxyyyyy   = D_xxxxyyyyy*v142 + D_xxxyyyyyy*M_xy + D_xxxyyyyyz*M_xz + D_xxyyyyy*M_0 + &
      D_xxyyyyyyz*M_yz + M_yy*v322 + M_zz*v323
    D_xxyyyyzzz = -(D_xxxxyyyyz + D_xxyyyyyyz)
    v328        = 0.166666666666667d0*D_xxyyyyzzz
    v329        = 0.5d0*D_xxyyyyzzz
    v350        = 0.0833333333333333d0*D_xxyyyyzzz
    v356        = 0.25d0*D_xxyyyyzzz
    v370        = 0.0277777777777778d0*D_xxyyyyzzz
    v420        = 0.00694444444444444d0*D_xxyyyyzzz
    v438        = 0.0208333333333333d0*D_xxyyyyzzz
    L_xxyyyy    = D_xxxxxyyyy*v152 + D_xxxxyyyy*v142 + D_xxxxyyyyy*v153 + D_xxxxyyyyz*v154 &
      + D_xxxyyyyy*M_xy + D_xxxyyyyyz*M_xyz + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyyz*M_yz + M_xyy*v241 + M_xzz*v242 + M_yy* &
      v324 + M_yyy*v325 + M_yyz*v326 + M_yzz*v323 + M_zz*v327 + M_zzz* &
      v328
    L_xxyyyyz   = D_xxxxyyyyz*v142 + D_xxxyyyyyz*M_xy + D_xxxyyyyzz*M_xz + D_xxyyyyyzz* &
      M_yz + D_xxyyyyz*M_0 + M_yy*v326 + M_zz*v329
    D_xxyyyzzzz = -(D_xxxxyyyzz + D_xxyyyyyzz)
    v338        = 0.0416666666666667d0*D_xxyyyzzzz
    v340        = 0.166666666666667d0*D_xxyyyzzzz
    v374        = 0.0208333333333333d0*D_xxyyyzzzz
    v383        = 0.0833333333333333d0*D_xxyyyzzzz
    v424        = 0.00694444444444444d0*D_xxyyyzzzz
    v440        = 0.0277777777777778d0*D_xxyyyzzzz
    L_xxyyy     = D_xxxxxxyyy*v173 + D_xxxxxyyy*v152 + D_xxxxxyyyy*v174 + D_xxxxxyyyz*v175 &
      + D_xxxxyyy*v142 + D_xxxxyyyy*v153 + D_xxxxyyyyy*v176 + &
      D_xxxxyyyyz*v177 + D_xxxxyyyz*v154 + D_xxxxyyyzz*v178 + D_xxxyyyy &
      *M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + M_xyy*v243 + M_xyyy*v244 + M_xyyz*v245 + M_xyzz* &
      v242 + M_xzz*v246 + M_xzzz*v247 + M_yy*v330 + M_yyy*v331 + M_yyyy &
      *v332 + M_yyyz*v333 + M_yyz*v334 + M_yyzz*v335 + M_yzz*v327 + &
      M_yzzz*v328 + M_zz*v336 + M_zzz*v337 + M_zzzz*v338
    L_xxyyyz    = D_xxxxxyyyz*v152 + D_xxxxyyyyz*v153 + D_xxxxyyyz*v142 + D_xxxxyyyzz*v154 &
      + D_xxxyyyyz*M_xy + D_xxxyyyyzz*M_xyz + D_xxxyyyzz*M_xz + &
      D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + M_xyy*v245 + M_xzz*v248 + M_yy* &
      v334 + M_yyy*v333 + M_yyz*v323 + M_yzz*v329 + M_zz*v339 + M_zzz* &
      v340
    D_xxyyzzzzz = -(D_xxxxyyzzz + D_xxyyyyzzz)
    v354        = 0.00833333333333333d0*D_xxyyzzzzz
    v359        = 0.0416666666666667d0*D_xxyyzzzzz
    v429        = 0.00416666666666667d0*D_xxyyzzzzz
    v443        = 0.0208333333333333d0*D_xxyyzzzzz
    L_xxyy      = D_xxxxxxxyy*v211 + D_xxxxxxyy*v173 + D_xxxxxxyyy*v212 + D_xxxxxxyyz*v213 &
      + D_xxxxxyy*v152 + D_xxxxxyyy*v174 + D_xxxxxyyyy*v214 + &
      D_xxxxxyyyz*v215 + D_xxxxxyyz*v175 + D_xxxxxyyzz*v216 + D_xxxxyy* &
      v142 + D_xxxxyyy*v153 + D_xxxxyyyy*v176 + D_xxxxyyyyy*v217 + &
      D_xxxxyyyyz*v218 + D_xxxxyyyz*v177 + D_xxxxyyyzz*v219 + D_xxxxyyz &
      *v154 + D_xxxxyyzz*v178 + D_xxxxyyzzz*v220 + D_xxxyyy*M_xy + &
      D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz*M_yz + &
      M_xyy*v249 + M_xyyy*v250 + M_xyyyy*v251 + M_xyyyz*v252 + M_xyyz* &
      v253 + M_xyyzz*v254 + M_xyzz*v246 + M_xyzzz*v247 + M_xzz*v255 + &
      M_xzzz*v256 + M_xzzzz*v257 + M_yy*v341 + M_yyy*v342 + M_yyyy*v343 &
      + M_yyyyy*v344 + M_yyyyz*v345 + M_yyyz*v346 + M_yyyzz*v347 + &
      M_yyz*v348 + M_yyzz*v349 + M_yyzzz*v350 + M_yzz*v336 + M_yzzz* &
      v337 + M_yzzzz*v338 + M_zz*v351 + M_zzz*v352 + M_zzzz*v353 + &
      M_zzzzz*v354
    L_xxyyz     = D_xxxxxxyyz*v173 + D_xxxxxyyyz*v174 + D_xxxxxyyz*v152 + D_xxxxxyyzz*v175 &
      + D_xxxxyyyyz*v176 + D_xxxxyyyz*v153 + D_xxxxyyyzz*v177 + &
      D_xxxxyyz*v142 + D_xxxxyyzz*v154 + D_xxxxyyzzz*v178 + D_xxxyyyz* &
      M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + M_xyy*v253 + M_xyyy*v252 + M_xyyz*v242 + M_xyzz* &
      v248 + M_xzz*v258 + M_xzzz*v259 + M_yy*v348 + M_yyy*v346 + M_yyyy &
      *v345 + M_yyyz*v355 + M_yyz*v327 + M_yyzz*v356 + M_yzz*v339 + &
      M_yzzz*v340 + M_zz*v357 + M_zzz*v358 + M_zzzz*v359
    D_xxyzzzzzz = -(D_xxxxyzzzz + D_xxyyyzzzz)
    v379        = 0.00138888888888889d0*D_xxyzzzzzz
    v387        = 0.00833333333333333d0*D_xxyzzzzzz
    L_xxy       = D_xxxxxxxxy*v279 + D_xxxxxxxy*v211 + D_xxxxxxxyy*v280 + D_xxxxxxxyz*v281 &
      + D_xxxxxxy*v173 + D_xxxxxxyy*v212 + D_xxxxxxyyy*v282 + &
      D_xxxxxxyyz*v283 + D_xxxxxxyz*v213 + D_xxxxxxyzz*v284 + D_xxxxxy* &
      v152 + D_xxxxxyy*v174 + D_xxxxxyyy*v214 + D_xxxxxyyyy*v285 + &
      D_xxxxxyyyz*v286 + D_xxxxxyyz*v215 + D_xxxxxyyzz*v287 + D_xxxxxyz &
      *v175 + D_xxxxxyzz*v216 + D_xxxxxyzzz*v288 + D_xxxxy*v142 + &
      D_xxxxyy*v153 + D_xxxxyyy*v176 + D_xxxxyyyy*v217 + D_xxxxyyyyy* &
      v289 + D_xxxxyyyyz*v290 + D_xxxxyyyz*v218 + D_xxxxyyyzz*v291 + &
      D_xxxxyyz*v177 + D_xxxxyyzz*v219 + D_xxxxyyzzz*v292 + D_xxxxyz* &
      v154 + D_xxxxyzz*v178 + D_xxxxyzzz*v220 + D_xxxxyzzzz*v293 + &
      D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyyz*M_yz + M_xyy*v260 + M_xyyy*v261 + M_xyyyy*v262 + M_xyyyyy &
      *v263 + M_xyyyyz*v264 + M_xyyyz*v265 + M_xyyyzz*v266 + M_xyyz* &
      v267 + M_xyyzz*v268 + M_xyyzzz*v269 + M_xyzz*v255 + M_xyzzz*v256 &
      + M_xyzzzz*v257 + M_xzz*v270 + M_xzzz*v271 + M_xzzzz*v272 + &
      M_xzzzzz*v273 + M_yy*v360 + M_yyy*v361 + M_yyyy*v362 + M_yyyyy* &
      v363 + M_yyyyyy*v364 + M_yyyyyz*v365 + M_yyyyz*v366 + M_yyyyzz* &
      v367 + M_yyyz*v368 + M_yyyzz*v369 + M_yyyzzz*v370 + M_yyz*v371 + &
      M_yyzz*v372 + M_yyzzz*v373 + M_yyzzzz*v374 + M_yzz*v351 + M_yzzz* &
      v352 + M_yzzzz*v353 + M_yzzzzz*v354 + M_zz*v375 + M_zzz*v376 + &
      M_zzzz*v377 + M_zzzzz*v378 + M_zzzzzz*v379
    L_xxyz      = D_xxxxxxxyz*v211 + D_xxxxxxyyz*v212 + D_xxxxxxyz*v173 + D_xxxxxxyzz*v213 &
      + D_xxxxxyyyz*v214 + D_xxxxxyyz*v174 + D_xxxxxyyzz*v215 + &
      D_xxxxxyz*v152 + D_xxxxxyzz*v175 + D_xxxxxyzzz*v216 + D_xxxxyyyyz &
      *v217 + D_xxxxyyyz*v176 + D_xxxxyyyzz*v218 + D_xxxxyyz*v153 + &
      D_xxxxyyzz*v177 + D_xxxxyyzzz*v219 + D_xxxxyz*v142 + D_xxxxyzz* &
      v154 + D_xxxxyzzz*v178 + D_xxxxyzzzz*v220 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz*M_0 + &
      M_xyy*v267 + M_xyyy*v265 + M_xyyyy*v264 + M_xyyyz*v274 + M_xyyz* &
      v246 + M_xyyzz*v275 + M_xyzz*v258 + M_xyzzz*v259 + M_xzz*v276 + &
      M_xzzz*v277 + M_xzzzz*v278 + M_yy*v371 + M_yyy*v368 + M_yyyy*v366 &
      + M_yyyyy*v365 + M_yyyyz*v380 + M_yyyz*v381 + M_yyyzz*v350 + &
      M_yyz*v336 + M_yyzz*v382 + M_yyzzz*v383 + M_yzz*v357 + M_yzzz* &
      v358 + M_yzzzz*v359 + M_zz*v384 + M_zzz*v385 + M_zzzz*v386 + &
      M_zzzzz*v387
    D_xxzzzzzzz = -(D_xxxxzzzzz + D_xxyyzzzzz)
    v435        = 0.000198412698412698d0*D_xxzzzzzzz
    v448        = 0.00138888888888889d0*D_xxzzzzzzz
    L_xx        = D_xx*M_0 + D_xxxx*v142 + D_xxxxx*v152 + D_xxxxxx*v173 + D_xxxxxxx*v211 + &
      D_xxxxxxxx*v279 + D_xxxxxxxxx*v388 + D_xxxxxxxxy*v389 + &
      D_xxxxxxxxz*v390 + D_xxxxxxxy*v280 + D_xxxxxxxyy*v391 + &
      D_xxxxxxxyz*v392 + D_xxxxxxxz*v281 + D_xxxxxxxzz*v393 + D_xxxxxxy &
      *v212 + D_xxxxxxyy*v282 + D_xxxxxxyyy*v394 + D_xxxxxxyyz*v395 + &
      D_xxxxxxyz*v283 + D_xxxxxxyzz*v396 + D_xxxxxxz*v213 + D_xxxxxxzz* &
      v284 + D_xxxxxxzzz*v397 + D_xxxxxy*v174 + D_xxxxxyy*v214 + &
      D_xxxxxyyy*v285 + D_xxxxxyyyy*v398 + D_xxxxxyyyz*v399 + &
      D_xxxxxyyz*v286 + D_xxxxxyyzz*v400 + D_xxxxxyz*v215 + D_xxxxxyzz* &
      v287 + D_xxxxxyzzz*v401 + D_xxxxxz*v175 + D_xxxxxzz*v216 + &
      D_xxxxxzzz*v288 + D_xxxxxzzzz*v402 + D_xxxxy*v153 + D_xxxxyy*v176 &
      + D_xxxxyyy*v217 + D_xxxxyyyy*v289 + D_xxxxyyyyy*v403 + &
      D_xxxxyyyyz*v404 + D_xxxxyyyz*v290 + D_xxxxyyyzz*v405 + D_xxxxyyz &
      *v218 + D_xxxxyyzz*v291 + D_xxxxyyzzz*v406 + D_xxxxyz*v177 + &
      D_xxxxyzz*v219 + D_xxxxyzzz*v292 + D_xxxxyzzzz*v407 + D_xxxxz* &
      v154 + D_xxxxzz*v178 + D_xxxxzzz*v220 + D_xxxxzzzz*v293 + &
      D_xxxxzzzzz*v408 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + &
      D_xxyz*M_yz + M_xyy*v294 + M_xyyy*v295 + M_xyyyy*v296 + M_xyyyyy* &
      v297 + M_xyyyyyy*v298 + M_xyyyyyz*v299 + M_xyyyyz*v300 + &
      M_xyyyyzz*v301 + M_xyyyz*v302 + M_xyyyzz*v303 + M_xyyyzzz*v304 + &
      M_xyyz*v305 + M_xyyzz*v306 + M_xyyzzz*v307 + M_xyyzzzz*v308 + &
      M_xyzz*v270 + M_xyzzz*v271 + M_xyzzzz*v272 + M_xyzzzzz*v273 + &
      M_xzz*v309 + M_xzzz*v310 + M_xzzzz*v311 + M_xzzzzz*v312 + &
      M_xzzzzzz*v313 + M_yy*v409 + M_yyy*v410 + M_yyyy*v411 + M_yyyyy* &
      v412 + M_yyyyyy*v413 + M_yyyyyyy*v414 + M_yyyyyyz*v415 + M_yyyyyz &
      *v416 + M_yyyyyzz*v417 + M_yyyyz*v418 + M_yyyyzz*v419 + M_yyyyzzz &
      *v420 + M_yyyz*v421 + M_yyyzz*v422 + M_yyyzzz*v423 + M_yyyzzzz* &
      v424 + M_yyz*v425 + M_yyzz*v426 + M_yyzzz*v427 + M_yyzzzz*v428 + &
      M_yyzzzzz*v429 + M_yzz*v375 + M_yzzz*v376 + M_yzzzz*v377 + &
      M_yzzzzz*v378 + M_yzzzzzz*v379 + M_zz*v430 + M_zzz*v431 + M_zzzz* &
      v432 + M_zzzzz*v433 + M_zzzzzz*v434 + M_zzzzzzz*v435
    L_xxz       = D_xxxxxxxxz*v279 + D_xxxxxxxyz*v280 + D_xxxxxxxz*v211 + D_xxxxxxxzz*v281 &
      + D_xxxxxxyyz*v282 + D_xxxxxxyz*v212 + D_xxxxxxyzz*v283 + &
      D_xxxxxxz*v173 + D_xxxxxxzz*v213 + D_xxxxxxzzz*v284 + D_xxxxxyyyz &
      *v285 + D_xxxxxyyz*v214 + D_xxxxxyyzz*v286 + D_xxxxxyz*v174 + &
      D_xxxxxyzz*v215 + D_xxxxxyzzz*v287 + D_xxxxxz*v152 + D_xxxxxzz* &
      v175 + D_xxxxxzzz*v216 + D_xxxxxzzzz*v288 + D_xxxxyyyyz*v289 + &
      D_xxxxyyyz*v217 + D_xxxxyyyzz*v290 + D_xxxxyyz*v176 + D_xxxxyyzz* &
      v218 + D_xxxxyyzzz*v291 + D_xxxxyz*v153 + D_xxxxyzz*v177 + &
      D_xxxxyzzz*v219 + D_xxxxyzzzz*v292 + D_xxxxz*v142 + D_xxxxzz*v154 &
      + D_xxxxzzz*v178 + D_xxxxzzzz*v220 + D_xxxxzzzzz*v293 + D_xxxyz* &
      M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_xyy*v305 + M_xyyy*v302 + M_xyyyy*v300 + M_xyyyyy*v299 + &
      M_xyyyyz*v314 + M_xyyyz*v315 + M_xyyyzz*v269 + M_xyyz*v255 + &
      M_xyyzz*v316 + M_xyyzzz*v317 + M_xyzz*v276 + M_xyzzz*v277 + &
      M_xyzzzz*v278 + M_xzz*v318 + M_xzzz*v319 + M_xzzzz*v320 + &
      M_xzzzzz*v321 + M_yy*v425 + M_yyy*v421 + M_yyyy*v418 + M_yyyyy* &
      v416 + M_yyyyyy*v415 + M_yyyyyz*v436 + M_yyyyz*v437 + M_yyyyzz* &
      v438 + M_yyyz*v439 + M_yyyzz*v373 + M_yyyzzz*v440 + M_yyz*v351 + &
      M_yyzz*v441 + M_yyzzz*v442 + M_yyzzzz*v443 + M_yzz*v384 + M_yzzz* &
      v385 + M_yzzzz*v386 + M_yzzzzz*v387 + M_zz*v444 + M_zzz*v445 + &
      M_zzzz*v446 + M_zzzzz*v447 + M_zzzzzz*v448
    D_xyyyyyyyy = v240*v449
    L_xyyyyyyyy = D_xyyyyyyyy*M_0
    D_xyyyyyyyz = v140*(v141 - 91.0d0*v64 - 221.0d0*v68 + 273.0d0*v69)
    v453        = 0.5d0*D_xyyyyyyyz
    v458        = 0.166666666666667d0*D_xyyyyyyyz
    v467        = 0.0416666666666667d0*D_xyyyyyyyz
    v483        = 0.00833333333333333d0*D_xyyyyyyyz
    v507        = 0.00138888888888889d0*D_xyyyyyyyz
    L_xyyyyyyyz = D_xyyyyyyyz*M_0
    D_xyyyyyyzz = -(D_xxxyyyyyy + D_xyyyyyyyy)
    v451        = 0.5d0*D_xyyyyyyzz
    v460        = 0.25d0*D_xyyyyyyzz
    v469        = 0.0833333333333333d0*D_xyyyyyyzz
    v477        = 0.166666666666667d0*D_xyyyyyyzz
    v485        = 0.0208333333333333d0*D_xyyyyyyzz
    v498        = 0.0416666666666667d0*D_xyyyyyyzz
    v509        = 0.00416666666666667d0*D_xyyyyyyzz
    v528        = 0.00833333333333333d0*D_xyyyyyyzz
    L_xyyyyyy   = D_xxxyyyyyy*v142 + D_xxyyyyyyy*M_xy + D_xxyyyyyyz*M_xz + D_xyyyyyy*M_0 + &
      D_xyyyyyyyy*v450 + D_xyyyyyyyz*M_yz + M_zz*v451
    D_xyyyyyzzz = -(D_xxxyyyyyz + D_xyyyyyyyz)
    v455        = 0.166666666666667d0*D_xyyyyyzzz
    v456        = 0.5d0*D_xyyyyyzzz
    v472        = 0.0833333333333333d0*D_xyyyyyzzz
    v478        = 0.25d0*D_xyyyyyzzz
    v488        = 0.0277777777777778d0*D_xyyyyyzzz
    v512        = 0.00694444444444444d0*D_xyyyyyzzz
    v530        = 0.0208333333333333d0*D_xyyyyyzzz
    L_xyyyyy    = D_xxxxyyyyy*v152 + D_xxxyyyyy*v142 + D_xxxyyyyyy*v153 + D_xxxyyyyyz*v154 &
      + D_xxyyyyyy*M_xy + D_xxyyyyyyz*M_xyz + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyyy*v450 + D_xyyyyyyyy*v452 + D_xyyyyyyz* &
      M_yz + M_xyy*v322 + M_xzz*v323 + M_yyz*v453 + M_yzz*v451 + M_zz* &
      v454 + M_zzz*v455
    L_xyyyyyz   = D_xxxyyyyyz*v142 + D_xxyyyyyyz*M_xy + D_xxyyyyyzz*M_xz + D_xyyyyyyyz* &
      v450 + D_xyyyyyyzz*M_yz + D_xyyyyyz*M_0 + M_zz*v456
    D_xyyyyzzzz = -(D_xxxyyyyzz + D_xyyyyyyzz)
    v463        = 0.0416666666666667d0*D_xyyyyzzzz
    v465        = 0.166666666666667d0*D_xyyyyzzzz
    v492        = 0.0208333333333333d0*D_xyyyyzzzz
    v501        = 0.0833333333333333d0*D_xyyyyzzzz
    v516        = 0.00694444444444444d0*D_xyyyyzzzz
    v532        = 0.0277777777777778d0*D_xyyyyzzzz
    L_xyyyy     = D_xxxxxyyyy*v173 + D_xxxxyyyy*v152 + D_xxxxyyyyy*v174 + D_xxxxyyyyz*v175 &
      + D_xxxyyyy*v142 + D_xxxyyyyy*v153 + D_xxxyyyyyy*v176 + &
      D_xxxyyyyyz*v177 + D_xxxyyyyz*v154 + D_xxxyyyyzz*v178 + D_xxyyyyy &
      *M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyy*v450 + D_xyyyyyyy*v452 + D_xyyyyyyyy*v457 + D_xyyyyyz* &
      M_yz + M_xyy*v324 + M_xyyy*v325 + M_xyyz*v326 + M_xyzz*v323 + &
      M_xzz*v327 + M_xzzz*v328 + M_yyyz*v458 + M_yyz*v459 + M_yyzz*v460 &
      + M_yzz*v454 + M_yzzz*v455 + M_zz*v461 + M_zzz*v462 + M_zzzz*v463
    L_xyyyyz    = D_xxxxyyyyz*v152 + D_xxxyyyyyz*v153 + D_xxxyyyyz*v142 + D_xxxyyyyzz*v154 &
      + D_xxyyyyyz*M_xy + D_xxyyyyyzz*M_xyz + D_xxyyyyzz*M_xz + &
      D_xyyyyyyyz*v452 + D_xyyyyyyz*v450 + D_xyyyyyzz*M_yz + D_xyyyyz* &
      M_0 + M_xyy*v326 + M_xzz*v329 + M_yyz*v451 + M_yzz*v456 + M_zz* &
      v464 + M_zzz*v465
    D_xyyyzzzzz = -(D_xxxyyyzzz + D_xyyyyyzzz)
    v476        = 0.00833333333333333d0*D_xyyyzzzzz
    v481        = 0.0416666666666667d0*D_xyyyzzzzz
    v521        = 0.00416666666666667d0*D_xyyyzzzzz
    v535        = 0.0208333333333333d0*D_xyyyzzzzz
    L_xyyy      = D_xxxxxxyyy*v211 + D_xxxxxyyy*v173 + D_xxxxxyyyy*v212 + D_xxxxxyyyz*v213 &
      + D_xxxxyyy*v152 + D_xxxxyyyy*v174 + D_xxxxyyyyy*v214 + &
      D_xxxxyyyyz*v215 + D_xxxxyyyz*v175 + D_xxxxyyyzz*v216 + D_xxxyyy* &
      v142 + D_xxxyyyy*v153 + D_xxxyyyyy*v176 + D_xxxyyyyyy*v217 + &
      D_xxxyyyyyz*v218 + D_xxxyyyyz*v177 + D_xxxyyyyzz*v219 + D_xxxyyyz &
      *v154 + D_xxxyyyzz*v178 + D_xxxyyyzzz*v220 + D_xxyyyy*M_xy + &
      D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy*v450 + &
      D_xyyyyyy*v452 + D_xyyyyyyy*v457 + D_xyyyyyyyy*v466 + D_xyyyyz* &
      M_yz + M_xyy*v330 + M_xyyy*v331 + M_xyyyy*v332 + M_xyyyz*v333 + &
      M_xyyz*v334 + M_xyyzz*v335 + M_xyzz*v327 + M_xyzzz*v328 + M_xzz* &
      v336 + M_xzzz*v337 + M_xzzzz*v338 + M_yyyyz*v467 + M_yyyz*v468 + &
      M_yyyzz*v469 + M_yyz*v470 + M_yyzz*v471 + M_yyzzz*v472 + M_yzz* &
      v461 + M_yzzz*v462 + M_yzzzz*v463 + M_zz*v473 + M_zzz*v474 + &
      M_zzzz*v475 + M_zzzzz*v476
    L_xyyyz     = D_xxxxxyyyz*v173 + D_xxxxyyyyz*v174 + D_xxxxyyyz*v152 + D_xxxxyyyzz*v175 &
      + D_xxxyyyyyz*v176 + D_xxxyyyyz*v153 + D_xxxyyyyzz*v177 + &
      D_xxxyyyz*v142 + D_xxxyyyzz*v154 + D_xxxyyyzzz*v178 + D_xxyyyyz* &
      M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyyyyz*v457 + &
      D_xyyyyyyz*v452 + D_xyyyyyz*v450 + D_xyyyyzz*M_yz + D_xyyyz*M_0 + &
      M_xyy*v334 + M_xyyy*v333 + M_xyyz*v323 + M_xyzz*v329 + M_xzz*v339 &
      + M_xzzz*v340 + M_yyyz*v477 + M_yyz*v454 + M_yyzz*v478 + M_yzz* &
      v464 + M_yzzz*v465 + M_zz*v479 + M_zzz*v480 + M_zzzz*v481
    D_xyyzzzzzz = -(D_xxxyyzzzz + D_xyyyyzzzz)
    v497        = 0.00138888888888889d0*D_xyyzzzzzz
    v505        = 0.00833333333333333d0*D_xyyzzzzzz
    L_xyy       = D_xxxxxxxyy*v279 + D_xxxxxxyy*v211 + D_xxxxxxyyy*v280 + D_xxxxxxyyz*v281 &
      + D_xxxxxyy*v173 + D_xxxxxyyy*v212 + D_xxxxxyyyy*v282 + &
      D_xxxxxyyyz*v283 + D_xxxxxyyz*v213 + D_xxxxxyyzz*v284 + D_xxxxyy* &
      v152 + D_xxxxyyy*v174 + D_xxxxyyyy*v214 + D_xxxxyyyyy*v285 + &
      D_xxxxyyyyz*v286 + D_xxxxyyyz*v215 + D_xxxxyyyzz*v287 + D_xxxxyyz &
      *v175 + D_xxxxyyzz*v216 + D_xxxxyyzzz*v288 + D_xxxyy*v142 + &
      D_xxxyyy*v153 + D_xxxyyyy*v176 + D_xxxyyyyy*v217 + D_xxxyyyyyy* &
      v289 + D_xxxyyyyyz*v290 + D_xxxyyyyz*v218 + D_xxxyyyyzz*v291 + &
      D_xxxyyyz*v177 + D_xxxyyyzz*v219 + D_xxxyyyzzz*v292 + D_xxxyyz* &
      v154 + D_xxxyyzz*v178 + D_xxxyyzzz*v220 + D_xxxyyzzzz*v293 + &
      D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyyy*v450 + D_xyyyyy*v452 + D_xyyyyyy*v457 + D_xyyyyyyy*v466 + &
      D_xyyyyyyyy*v482 + D_xyyyz*M_yz + M_xyy*v341 + M_xyyy*v342 + &
      M_xyyyy*v343 + M_xyyyyy*v344 + M_xyyyyz*v345 + M_xyyyz*v346 + &
      M_xyyyzz*v347 + M_xyyz*v348 + M_xyyzz*v349 + M_xyyzzz*v350 + &
      M_xyzz*v336 + M_xyzzz*v337 + M_xyzzzz*v338 + M_xzz*v351 + M_xzzz* &
      v352 + M_xzzzz*v353 + M_xzzzzz*v354 + M_yyyyyz*v483 + M_yyyyz* &
      v484 + M_yyyyzz*v485 + M_yyyz*v486 + M_yyyzz*v487 + M_yyyzzz*v488 &
      + M_yyz*v489 + M_yyzz*v490 + M_yyzzz*v491 + M_yyzzzz*v492 + M_yzz &
      *v473 + M_yzzz*v474 + M_yzzzz*v475 + M_yzzzzz*v476 + M_zz*v493 + &
      M_zzz*v494 + M_zzzz*v495 + M_zzzzz*v496 + M_zzzzzz*v497
    L_xyyz      = D_xxxxxxyyz*v211 + D_xxxxxyyyz*v212 + D_xxxxxyyz*v173 + D_xxxxxyyzz*v213 &
      + D_xxxxyyyyz*v214 + D_xxxxyyyz*v174 + D_xxxxyyyzz*v215 + &
      D_xxxxyyz*v152 + D_xxxxyyzz*v175 + D_xxxxyyzzz*v216 + D_xxxyyyyyz &
      *v217 + D_xxxyyyyz*v176 + D_xxxyyyyzz*v218 + D_xxxyyyz*v153 + &
      D_xxxyyyzz*v177 + D_xxxyyyzzz*v219 + D_xxxyyz*v142 + D_xxxyyzz* &
      v154 + D_xxxyyzzz*v178 + D_xxxyyzzzz*v220 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyyyz*v466 + D_xyyyyyyz* &
      v457 + D_xyyyyyz*v452 + D_xyyyyz*v450 + D_xyyyzz*M_yz + D_xyyz* &
      M_0 + M_xyy*v348 + M_xyyy*v346 + M_xyyyy*v345 + M_xyyyz*v355 + &
      M_xyyz*v327 + M_xyyzz*v356 + M_xyzz*v339 + M_xyzzz*v340 + M_xzz* &
      v357 + M_xzzz*v358 + M_xzzzz*v359 + M_yyyyz*v498 + M_yyyz*v499 + &
      M_yyyzz*v472 + M_yyz*v461 + M_yyzz*v500 + M_yyzzz*v501 + M_yzz* &
      v479 + M_yzzz*v480 + M_yzzzz*v481 + M_zz*v502 + M_zzz*v503 + &
      M_zzzz*v504 + M_zzzzz*v505
    D_xyzzzzzzz = -(D_xxxyzzzzz + D_xyyyzzzzz)
    v527        = 0.000198412698412698d0*D_xyzzzzzzz
    v540        = 0.00138888888888889d0*D_xyzzzzzzz
    L_xy        = D_xxxxxxxxy*v388 + D_xxxxxxxy*v279 + D_xxxxxxxyy*v389 + D_xxxxxxxyz*v390 &
      + D_xxxxxxy*v211 + D_xxxxxxyy*v280 + D_xxxxxxyyy*v391 + &
      D_xxxxxxyyz*v392 + D_xxxxxxyz*v281 + D_xxxxxxyzz*v393 + D_xxxxxy* &
      v173 + D_xxxxxyy*v212 + D_xxxxxyyy*v282 + D_xxxxxyyyy*v394 + &
      D_xxxxxyyyz*v395 + D_xxxxxyyz*v283 + D_xxxxxyyzz*v396 + D_xxxxxyz &
      *v213 + D_xxxxxyzz*v284 + D_xxxxxyzzz*v397 + D_xxxxy*v152 + &
      D_xxxxyy*v174 + D_xxxxyyy*v214 + D_xxxxyyyy*v285 + D_xxxxyyyyy* &
      v398 + D_xxxxyyyyz*v399 + D_xxxxyyyz*v286 + D_xxxxyyyzz*v400 + &
      D_xxxxyyz*v215 + D_xxxxyyzz*v287 + D_xxxxyyzzz*v401 + D_xxxxyz* &
      v175 + D_xxxxyzz*v216 + D_xxxxyzzz*v288 + D_xxxxyzzzz*v402 + &
      D_xxxy*v142 + D_xxxyy*v153 + D_xxxyyy*v176 + D_xxxyyyy*v217 + &
      D_xxxyyyyy*v289 + D_xxxyyyyyy*v403 + D_xxxyyyyyz*v404 + &
      D_xxxyyyyz*v290 + D_xxxyyyyzz*v405 + D_xxxyyyz*v218 + D_xxxyyyzz* &
      v291 + D_xxxyyyzzz*v406 + D_xxxyyz*v177 + D_xxxyyzz*v219 + &
      D_xxxyyzzz*v292 + D_xxxyyzzzz*v407 + D_xxxyz*v154 + D_xxxyzz*v178 &
      + D_xxxyzzz*v220 + D_xxxyzzzz*v293 + D_xxxyzzzzz*v408 + D_xxyy* &
      M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v450 + &
      D_xyyyy*v452 + D_xyyyyy*v457 + D_xyyyyyy*v466 + D_xyyyyyyy*v482 + &
      D_xyyyyyyyy*v506 + D_xyyz*M_yz + M_xyy*v360 + M_xyyy*v361 + &
      M_xyyyy*v362 + M_xyyyyy*v363 + M_xyyyyyy*v364 + M_xyyyyyz*v365 + &
      M_xyyyyz*v366 + M_xyyyyzz*v367 + M_xyyyz*v368 + M_xyyyzz*v369 + &
      M_xyyyzzz*v370 + M_xyyz*v371 + M_xyyzz*v372 + M_xyyzzz*v373 + &
      M_xyyzzzz*v374 + M_xyzz*v351 + M_xyzzz*v352 + M_xyzzzz*v353 + &
      M_xyzzzzz*v354 + M_xzz*v375 + M_xzzz*v376 + M_xzzzz*v377 + &
      M_xzzzzz*v378 + M_xzzzzzz*v379 + M_yyyyyyz*v507 + M_yyyyyz*v508 + &
      M_yyyyyzz*v509 + M_yyyyz*v510 + M_yyyyzz*v511 + M_yyyyzzz*v512 + &
      M_yyyz*v513 + M_yyyzz*v514 + M_yyyzzz*v515 + M_yyyzzzz*v516 + &
      M_yyz*v517 + M_yyzz*v518 + M_yyzzz*v519 + M_yyzzzz*v520 + &
      M_yyzzzzz*v521 + M_yzz*v493 + M_yzzz*v494 + M_yzzzz*v495 + &
      M_yzzzzz*v496 + M_yzzzzzz*v497 + M_zz*v522 + M_zzz*v523 + M_zzzz* &
      v524 + M_zzzzz*v525 + M_zzzzzz*v526 + M_zzzzzzz*v527
    L_xyz       = D_xxxxxxxyz*v279 + D_xxxxxxyyz*v280 + D_xxxxxxyz*v211 + D_xxxxxxyzz*v281 &
      + D_xxxxxyyyz*v282 + D_xxxxxyyz*v212 + D_xxxxxyyzz*v283 + &
      D_xxxxxyz*v173 + D_xxxxxyzz*v213 + D_xxxxxyzzz*v284 + D_xxxxyyyyz &
      *v285 + D_xxxxyyyz*v214 + D_xxxxyyyzz*v286 + D_xxxxyyz*v174 + &
      D_xxxxyyzz*v215 + D_xxxxyyzzz*v287 + D_xxxxyz*v152 + D_xxxxyzz* &
      v175 + D_xxxxyzzz*v216 + D_xxxxyzzzz*v288 + D_xxxyyyyyz*v289 + &
      D_xxxyyyyz*v217 + D_xxxyyyyzz*v290 + D_xxxyyyz*v176 + D_xxxyyyzz* &
      v218 + D_xxxyyyzzz*v291 + D_xxxyyz*v153 + D_xxxyyzz*v177 + &
      D_xxxyyzzz*v219 + D_xxxyyzzzz*v292 + D_xxxyz*v142 + D_xxxyzz*v154 &
      + D_xxxyzzz*v178 + D_xxxyzzzz*v220 + D_xxxyzzzzz*v293 + D_xxyyz* &
      M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyyyyyyz*v482 + &
      D_xyyyyyyz*v466 + D_xyyyyyz*v457 + D_xyyyyz*v452 + D_xyyyz*v450 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v371 + M_xyyy*v368 + M_xyyyy* &
      v366 + M_xyyyyy*v365 + M_xyyyyz*v380 + M_xyyyz*v381 + M_xyyyzz* &
      v350 + M_xyyz*v336 + M_xyyzz*v382 + M_xyyzzz*v383 + M_xyzz*v357 + &
      M_xyzzz*v358 + M_xyzzzz*v359 + M_xzz*v384 + M_xzzz*v385 + M_xzzzz &
      *v386 + M_xzzzzz*v387 + M_yyyyyz*v528 + M_yyyyz*v529 + M_yyyyzz* &
      v530 + M_yyyz*v531 + M_yyyzz*v491 + M_yyyzzz*v532 + M_yyz*v473 + &
      M_yyzz*v533 + M_yyzzz*v534 + M_yyzzzz*v535 + M_yzz*v502 + M_yzzz* &
      v503 + M_yzzzz*v504 + M_yzzzzz*v505 + M_zz*v536 + M_zzz*v537 + &
      M_zzzz*v538 + M_zzzzz*v539 + M_zzzzzz*v540
    D_xzzzzzzzz = -(D_xxxzzzzzz + D_xyyzzzzzz)
    L_x         = D_x*M_0 + D_xxx*v142 + D_xxxx*v152 + D_xxxxx*v173 + D_xxxxxx*v211 + &
      D_xxxxxxx*v279 + D_xxxxxxxx*v388 + D_xxxxxxxxx*v541 + D_xxxxxxxxy &
      *v542 + D_xxxxxxxxz*v543 + D_xxxxxxxy*v389 + D_xxxxxxxyy*v544 + &
      D_xxxxxxxyz*v545 + D_xxxxxxxz*v390 + D_xxxxxxxzz*v546 + D_xxxxxxy &
      *v280 + D_xxxxxxyy*v391 + D_xxxxxxyyy*v547 + D_xxxxxxyyz*v548 + &
      D_xxxxxxyz*v392 + D_xxxxxxyzz*v549 + D_xxxxxxz*v281 + D_xxxxxxzz* &
      v393 + D_xxxxxxzzz*v550 + D_xxxxxy*v212 + D_xxxxxyy*v282 + &
      D_xxxxxyyy*v394 + D_xxxxxyyyy*v551 + D_xxxxxyyyz*v552 + &
      D_xxxxxyyz*v395 + D_xxxxxyyzz*v553 + D_xxxxxyz*v283 + D_xxxxxyzz* &
      v396 + D_xxxxxyzzz*v554 + D_xxxxxz*v213 + D_xxxxxzz*v284 + &
      D_xxxxxzzz*v397 + D_xxxxxzzzz*v555 + D_xxxxy*v174 + D_xxxxyy*v214 &
      + D_xxxxyyy*v285 + D_xxxxyyyy*v398 + D_xxxxyyyyy*v556 + &
      D_xxxxyyyyz*v557 + D_xxxxyyyz*v399 + D_xxxxyyyzz*v558 + D_xxxxyyz &
      *v286 + D_xxxxyyzz*v400 + D_xxxxyyzzz*v559 + D_xxxxyz*v215 + &
      D_xxxxyzz*v287 + D_xxxxyzzz*v401 + D_xxxxyzzzz*v560 + D_xxxxz* &
      v175 + D_xxxxzz*v216 + D_xxxxzzz*v288 + D_xxxxzzzz*v402 + &
      D_xxxxzzzzz*v561 + D_xxxy*v153 + D_xxxyy*v176 + D_xxxyyy*v217 + &
      D_xxxyyyy*v289 + D_xxxyyyyy*v403 + D_xxxyyyyyy*v562 + D_xxxyyyyyz &
      *v563 + D_xxxyyyyz*v404 + D_xxxyyyyzz*v564 + D_xxxyyyz*v290 + &
      D_xxxyyyzz*v405 + D_xxxyyyzzz*v565 + D_xxxyyz*v218 + D_xxxyyzz* &
      v291 + D_xxxyyzzz*v406 + D_xxxyyzzzz*v566 + D_xxxyz*v177 + &
      D_xxxyzz*v219 + D_xxxyzzz*v292 + D_xxxyzzzz*v407 + D_xxxyzzzzz* &
      v567 + D_xxxz*v154 + D_xxxzz*v178 + D_xxxzzz*v220 + D_xxxzzzz* &
      v293 + D_xxxzzzzz*v408 + D_xxxzzzzzz*v568 + D_xxy*M_xy + D_xxyz* &
      M_xyz + D_xxz*M_xz + D_xyy*v450 + D_xyyy*v452 + D_xyyyy*v457 + &
      D_xyyyyy*v466 + D_xyyyyyy*v482 + D_xyyyyyyy*v506 + D_xyyyyyyyy* &
      v569 + D_xyyyyyyyz*v570 + D_xyyyyyyz*v571 + D_xyyyyyyzz*v572 + &
      D_xyyyyyz*v573 + D_xyyyyyzz*v574 + D_xyyyyyzzz*v575 + D_xyyyyz* &
      v576 + D_xyyyyzz*v577 + D_xyyyyzzz*v578 + D_xyyyyzzzz*v579 + &
      D_xyyyz*v580 + D_xyyyzz*v581 + D_xyyyzzz*v582 + D_xyyyzzzz*v583 + &
      D_xyyyzzzzz*v584 + D_xyyz*v585 + D_xyyzz*v586 + D_xyyzzz*v587 + &
      D_xyyzzzz*v588 + D_xyyzzzzz*v589 + D_xyyzzzzzz*v590 + D_xyz*M_yz &
      + D_xzz*v591 + D_xzzz*v592 + D_xzzzz*v593 + D_xzzzzz*v594 + &
      D_xzzzzzz*v595 + D_xzzzzzzz*v596 + D_xzzzzzzzz*v597 + M_xyy*v409 &
      + M_xyyy*v410 + M_xyyyy*v411 + M_xyyyyy*v412 + M_xyyyyyy*v413 + &
      M_xyyyyyyy*v414 + M_xyyyyyyz*v415 + M_xyyyyyz*v416 + M_xyyyyyzz* &
      v417 + M_xyyyyz*v418 + M_xyyyyzz*v419 + M_xyyyyzzz*v420 + M_xyyyz &
      *v421 + M_xyyyzz*v422 + M_xyyyzzz*v423 + M_xyyyzzzz*v424 + M_xyyz &
      *v425 + M_xyyzz*v426 + M_xyyzzz*v427 + M_xyyzzzz*v428 + &
      M_xyyzzzzz*v429 + M_xyzz*v375 + M_xyzzz*v376 + M_xyzzzz*v377 + &
      M_xyzzzzz*v378 + M_xyzzzzzz*v379 + M_xzz*v430 + M_xzzz*v431 + &
      M_xzzzz*v432 + M_xzzzzz*v433 + M_xzzzzzz*v434 + M_xzzzzzzz*v435 + &
      M_yzz*v522 + M_yzzz*v523 + M_yzzzz*v524 + M_yzzzzz*v525 + &
      M_yzzzzzz*v526 + M_yzzzzzzz*v527
    L_xz        = D_xxxxxxxxz*v388 + D_xxxxxxxyz*v389 + D_xxxxxxxz*v279 + D_xxxxxxxzz*v390 &
      + D_xxxxxxyyz*v391 + D_xxxxxxyz*v280 + D_xxxxxxyzz*v392 + &
      D_xxxxxxz*v211 + D_xxxxxxzz*v281 + D_xxxxxxzzz*v393 + D_xxxxxyyyz &
      *v394 + D_xxxxxyyz*v282 + D_xxxxxyyzz*v395 + D_xxxxxyz*v212 + &
      D_xxxxxyzz*v283 + D_xxxxxyzzz*v396 + D_xxxxxz*v173 + D_xxxxxzz* &
      v213 + D_xxxxxzzz*v284 + D_xxxxxzzzz*v397 + D_xxxxyyyyz*v398 + &
      D_xxxxyyyz*v285 + D_xxxxyyyzz*v399 + D_xxxxyyz*v214 + D_xxxxyyzz* &
      v286 + D_xxxxyyzzz*v400 + D_xxxxyz*v174 + D_xxxxyzz*v215 + &
      D_xxxxyzzz*v287 + D_xxxxyzzzz*v401 + D_xxxxz*v152 + D_xxxxzz*v175 &
      + D_xxxxzzz*v216 + D_xxxxzzzz*v288 + D_xxxxzzzzz*v402 + &
      D_xxxyyyyyz*v403 + D_xxxyyyyz*v289 + D_xxxyyyyzz*v404 + D_xxxyyyz &
      *v217 + D_xxxyyyzz*v290 + D_xxxyyyzzz*v405 + D_xxxyyz*v176 + &
      D_xxxyyzz*v218 + D_xxxyyzzz*v291 + D_xxxyyzzzz*v406 + D_xxxyz* &
      v153 + D_xxxyzz*v177 + D_xxxyzzz*v219 + D_xxxyzzzz*v292 + &
      D_xxxyzzzzz*v407 + D_xxxz*v142 + D_xxxzz*v154 + D_xxxzzz*v178 + &
      D_xxxzzzz*v220 + D_xxxzzzzz*v293 + D_xxxzzzzzz*v408 + D_xxyz*M_xy &
      + D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyyyyyz*v506 + D_xyyyyyyz* &
      v482 + D_xyyyyyyzz*v571 + D_xyyyyyz*v466 + D_xyyyyyzz*v573 + &
      D_xyyyyyzzz*v574 + D_xyyyyz*v457 + D_xyyyyzz*v576 + D_xyyyyzzz* &
      v577 + D_xyyyyzzzz*v578 + D_xyyyz*v452 + D_xyyyzz*v580 + &
      D_xyyyzzz*v581 + D_xyyyzzzz*v582 + D_xyyyzzzzz*v583 + D_xyyz*v450 &
      + D_xyyzz*v585 + D_xyyzzz*v586 + D_xyyzzzz*v587 + D_xyyzzzzz*v588 &
      + D_xyyzzzzzz*v589 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v591 + &
      D_xzzzz*v592 + D_xzzzzz*v593 + D_xzzzzzz*v594 + D_xzzzzzzz*v595 + &
      D_xzzzzzzzz*v596 + M_xyy*v425 + M_xyyy*v421 + M_xyyyy*v418 + &
      M_xyyyyy*v416 + M_xyyyyyy*v415 + M_xyyyyyz*v436 + M_xyyyyz*v437 + &
      M_xyyyyzz*v438 + M_xyyyz*v439 + M_xyyyzz*v373 + M_xyyyzzz*v440 + &
      M_xyyz*v351 + M_xyyzz*v441 + M_xyyzzz*v442 + M_xyyzzzz*v443 + &
      M_xyzz*v384 + M_xyzzz*v385 + M_xyzzzz*v386 + M_xyzzzzz*v387 + &
      M_xzz*v444 + M_xzzz*v445 + M_xzzzz*v446 + M_xzzzzz*v447 + &
      M_xzzzzzz*v448 + M_yzz*v536 + M_yzzz*v537 + M_yzzzz*v538 + &
      M_yzzzzz*v539 + M_yzzzzzz*v540
    D_yyyyyyyyy = v190*(v134 + 4620.0d0*v120 - 18018.0d0*v126 - 12155.0d0*v130 + 25740.0d0 &
      *v131)
    L_yyyyyyyyy = D_yyyyyyyyy*M_0
    D_yyyyyyyyz = v138*v449
    L_yyyyyyyyz = D_yyyyyyyyz*M_0
    D_yyyyyyyzz = -(D_xxyyyyyyy + D_yyyyyyyyy)
    L_yyyyyyy   = D_xxyyyyyyy*v142 + D_xyyyyyyyy*M_xy + D_xyyyyyyyz*M_xz + D_yyyyyyy*M_0 + &
      D_yyyyyyyyy*v450 + D_yyyyyyyyz*M_yz + D_yyyyyyyzz*v591
    D_yyyyyyzzz = -(D_xxyyyyyyz + D_yyyyyyyyz)
    L_yyyyyy    = D_xxxyyyyyy*v152 + D_xxyyyyyy*v142 + D_xxyyyyyyy*v153 + D_xxyyyyyyz*v154 &
      + D_xyyyyyyy*M_xy + D_xyyyyyyyy*v598 + D_xyyyyyyyz*M_xyz + &
      D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + D_yyyyyyyy*v450 + D_yyyyyyyyy* &
      v452 + D_yyyyyyyyz*v585 + D_yyyyyyyz*M_yz + D_yyyyyyyzz*v599 + &
      D_yyyyyyzz*v591 + D_yyyyyyzzz*v592 + M_xzz*v451
    L_yyyyyyz   = D_xxyyyyyyz*v142 + D_xyyyyyyyz*M_xy + D_xyyyyyyzz*M_xz + D_yyyyyyyyz* &
      v450 + D_yyyyyyyzz*M_yz + D_yyyyyyz*M_0 + D_yyyyyyzzz*v591
    D_yyyyyzzzz = -(D_xxyyyyyzz + D_yyyyyyyzz)
    L_yyyyy     = D_xxxxyyyyy*v173 + D_xxxyyyyy*v152 + D_xxxyyyyyy*v174 + D_xxxyyyyyz*v175 &
      + D_xxyyyyy*v142 + D_xxyyyyyy*v153 + D_xxyyyyyyy*v176 + &
      D_xxyyyyyyz*v177 + D_xxyyyyyz*v154 + D_xxyyyyyzz*v178 + D_xyyyyyy &
      *M_xy + D_xyyyyyyy*v598 + D_xyyyyyyyy*v600 + D_xyyyyyyz*M_xyz + &
      D_xyyyyyz*M_xz + D_yyyyy*M_0 + D_yyyyyyy*v450 + D_yyyyyyyy*v452 + &
      D_yyyyyyyyy*v457 + D_yyyyyyyyz*v580 + D_yyyyyyyz*v585 + &
      D_yyyyyyyzz*v586 + D_yyyyyyz*M_yz + D_yyyyyyzz*v599 + D_yyyyyyzzz &
      *v601 + D_yyyyyzz*v591 + D_yyyyyzzz*v592 + D_yyyyyzzzz*v593 + &
      M_xyyz*v453 + M_xyzz*v451 + M_xzz*v454 + M_xzzz*v455
    L_yyyyyz    = D_xxxyyyyyz*v152 + D_xxyyyyyyz*v153 + D_xxyyyyyz*v142 + D_xxyyyyyzz*v154 &
      + D_xyyyyyyyz*v598 + D_xyyyyyyz*M_xy + D_xyyyyyyzz*M_xyz + &
      D_xyyyyyzz*M_xz + D_yyyyyyyyz*v452 + D_yyyyyyyz*v450 + &
      D_yyyyyyyzz*v585 + D_yyyyyyzz*M_yz + D_yyyyyyzzz*v599 + D_yyyyyz* &
      M_0 + D_yyyyyzzz*v591 + D_yyyyyzzzz*v592 + M_xzz*v456
    D_yyyyzzzzz = -(D_xxyyyyzzz + D_yyyyyyzzz)
    L_yyyy      = D_xxxxxyyyy*v211 + D_xxxxyyyy*v173 + D_xxxxyyyyy*v212 + D_xxxxyyyyz*v213 &
      + D_xxxyyyy*v152 + D_xxxyyyyy*v174 + D_xxxyyyyyy*v214 + &
      D_xxxyyyyyz*v215 + D_xxxyyyyz*v175 + D_xxxyyyyzz*v216 + D_xxyyyy* &
      v142 + D_xxyyyyy*v153 + D_xxyyyyyy*v176 + D_xxyyyyyyy*v217 + &
      D_xxyyyyyyz*v218 + D_xxyyyyyz*v177 + D_xxyyyyyzz*v219 + D_xxyyyyz &
      *v154 + D_xxyyyyzz*v178 + D_xxyyyyzzz*v220 + D_xyyyyy*M_xy + &
      D_xyyyyyy*v598 + D_xyyyyyyy*v600 + D_xyyyyyyyy*v602 + D_xyyyyyz* &
      M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyy*v450 + D_yyyyyyy* &
      v452 + D_yyyyyyyy*v457 + D_yyyyyyyyy*v466 + D_yyyyyyyyz*v576 + &
      D_yyyyyyyz*v580 + D_yyyyyyyzz*v581 + D_yyyyyyz*v585 + D_yyyyyyzz* &
      v586 + D_yyyyyyzzz*v587 + D_yyyyyz*M_yz + D_yyyyyzz*v599 + &
      D_yyyyyzzz*v601 + D_yyyyyzzzz*v603 + D_yyyyzz*v591 + D_yyyyzzz* &
      v592 + D_yyyyzzzz*v593 + D_yyyyzzzzz*v594 + M_xyyyz*v458 + M_xyyz &
      *v459 + M_xyyzz*v460 + M_xyzz*v454 + M_xyzzz*v455 + M_xzz*v461 + &
      M_xzzz*v462 + M_xzzzz*v463
    L_yyyyz     = D_xxxxyyyyz*v173 + D_xxxyyyyyz*v174 + D_xxxyyyyz*v152 + D_xxxyyyyzz*v175 &
      + D_xxyyyyyyz*v176 + D_xxyyyyyz*v153 + D_xxyyyyyzz*v177 + &
      D_xxyyyyz*v142 + D_xxyyyyzz*v154 + D_xxyyyyzzz*v178 + D_xyyyyyyyz &
      *v600 + D_xyyyyyyz*v598 + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + &
      D_xyyyyzz*M_xz + D_yyyyyyyyz*v457 + D_yyyyyyyz*v452 + D_yyyyyyyzz &
      *v580 + D_yyyyyyz*v450 + D_yyyyyyzz*v585 + D_yyyyyyzzz*v586 + &
      D_yyyyyzz*M_yz + D_yyyyyzzz*v599 + D_yyyyyzzzz*v601 + D_yyyyz*M_0 &
      + D_yyyyzzz*v591 + D_yyyyzzzz*v592 + D_yyyyzzzzz*v593 + M_xyyz* &
      v451 + M_xyzz*v456 + M_xzz*v464 + M_xzzz*v465
    D_yyyzzzzzz = -(D_xxyyyzzzz + D_yyyyyzzzz)
    L_yyy       = D_xxxxxxyyy*v279 + D_xxxxxyyy*v211 + D_xxxxxyyyy*v280 + D_xxxxxyyyz*v281 &
      + D_xxxxyyy*v173 + D_xxxxyyyy*v212 + D_xxxxyyyyy*v282 + &
      D_xxxxyyyyz*v283 + D_xxxxyyyz*v213 + D_xxxxyyyzz*v284 + D_xxxyyy* &
      v152 + D_xxxyyyy*v174 + D_xxxyyyyy*v214 + D_xxxyyyyyy*v285 + &
      D_xxxyyyyyz*v286 + D_xxxyyyyz*v215 + D_xxxyyyyzz*v287 + D_xxxyyyz &
      *v175 + D_xxxyyyzz*v216 + D_xxxyyyzzz*v288 + D_xxyyy*v142 + &
      D_xxyyyy*v153 + D_xxyyyyy*v176 + D_xxyyyyyy*v217 + D_xxyyyyyyy* &
      v289 + D_xxyyyyyyz*v290 + D_xxyyyyyz*v218 + D_xxyyyyyzz*v291 + &
      D_xxyyyyz*v177 + D_xxyyyyzz*v219 + D_xxyyyyzzz*v292 + D_xxyyyz* &
      v154 + D_xxyyyzz*v178 + D_xxyyyzzz*v220 + D_xxyyyzzzz*v293 + &
      D_xyyyy*M_xy + D_xyyyyy*v598 + D_xyyyyyy*v600 + D_xyyyyyyy*v602 + &
      D_xyyyyyyyy*v604 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v450 + D_yyyyyy*v452 + D_yyyyyyy*v457 + D_yyyyyyyy*v466 + &
      D_yyyyyyyyy*v482 + D_yyyyyyyyz*v573 + D_yyyyyyyz*v576 + &
      D_yyyyyyyzz*v577 + D_yyyyyyz*v580 + D_yyyyyyzz*v581 + D_yyyyyyzzz &
      *v582 + D_yyyyyz*v585 + D_yyyyyzz*v586 + D_yyyyyzzz*v587 + &
      D_yyyyyzzzz*v588 + D_yyyyz*M_yz + D_yyyyzz*v599 + D_yyyyzzz*v601 &
      + D_yyyyzzzz*v603 + D_yyyyzzzzz*v605 + D_yyyzz*v591 + D_yyyzzz* &
      v592 + D_yyyzzzz*v593 + D_yyyzzzzz*v594 + D_yyyzzzzzz*v595 + &
      M_xyyyyz*v467 + M_xyyyz*v468 + M_xyyyzz*v469 + M_xyyz*v470 + &
      M_xyyzz*v471 + M_xyyzzz*v472 + M_xyzz*v461 + M_xyzzz*v462 + &
      M_xyzzzz*v463 + M_xzz*v473 + M_xzzz*v474 + M_xzzzz*v475 + &
      M_xzzzzz*v476
    L_yyyz      = D_xxxxxyyyz*v211 + D_xxxxyyyyz*v212 + D_xxxxyyyz*v173 + D_xxxxyyyzz*v213 &
      + D_xxxyyyyyz*v214 + D_xxxyyyyz*v174 + D_xxxyyyyzz*v215 + &
      D_xxxyyyz*v152 + D_xxxyyyzz*v175 + D_xxxyyyzzz*v216 + D_xxyyyyyyz &
      *v217 + D_xxyyyyyz*v176 + D_xxyyyyyzz*v218 + D_xxyyyyz*v153 + &
      D_xxyyyyzz*v177 + D_xxyyyyzzz*v219 + D_xxyyyz*v142 + D_xxyyyzz* &
      v154 + D_xxyyyzzz*v178 + D_xxyyyzzzz*v220 + D_xyyyyyyyz*v602 + &
      D_xyyyyyyz*v600 + D_xyyyyyz*v598 + D_xyyyyz*M_xy + D_xyyyyzz* &
      M_xyz + D_xyyyzz*M_xz + D_yyyyyyyyz*v466 + D_yyyyyyyz*v457 + &
      D_yyyyyyyzz*v576 + D_yyyyyyz*v452 + D_yyyyyyzz*v580 + D_yyyyyyzzz &
      *v581 + D_yyyyyz*v450 + D_yyyyyzz*v585 + D_yyyyyzzz*v586 + &
      D_yyyyyzzzz*v587 + D_yyyyzz*M_yz + D_yyyyzzz*v599 + D_yyyyzzzz* &
      v601 + D_yyyyzzzzz*v603 + D_yyyz*M_0 + D_yyyzzz*v591 + D_yyyzzzz* &
      v592 + D_yyyzzzzz*v593 + D_yyyzzzzzz*v594 + M_xyyyz*v477 + M_xyyz &
      *v454 + M_xyyzz*v478 + M_xyzz*v464 + M_xyzzz*v465 + M_xzz*v479 + &
      M_xzzz*v480 + M_xzzzz*v481
    D_yyzzzzzzz = -(D_xxyyzzzzz + D_yyyyzzzzz)
    L_yy        = D_xxxxxxxyy*v388 + D_xxxxxxyy*v279 + D_xxxxxxyyy*v389 + D_xxxxxxyyz*v390 &
      + D_xxxxxyy*v211 + D_xxxxxyyy*v280 + D_xxxxxyyyy*v391 + &
      D_xxxxxyyyz*v392 + D_xxxxxyyz*v281 + D_xxxxxyyzz*v393 + D_xxxxyy* &
      v173 + D_xxxxyyy*v212 + D_xxxxyyyy*v282 + D_xxxxyyyyy*v394 + &
      D_xxxxyyyyz*v395 + D_xxxxyyyz*v283 + D_xxxxyyyzz*v396 + D_xxxxyyz &
      *v213 + D_xxxxyyzz*v284 + D_xxxxyyzzz*v397 + D_xxxyy*v152 + &
      D_xxxyyy*v174 + D_xxxyyyy*v214 + D_xxxyyyyy*v285 + D_xxxyyyyyy* &
      v398 + D_xxxyyyyyz*v399 + D_xxxyyyyz*v286 + D_xxxyyyyzz*v400 + &
      D_xxxyyyz*v215 + D_xxxyyyzz*v287 + D_xxxyyyzzz*v401 + D_xxxyyz* &
      v175 + D_xxxyyzz*v216 + D_xxxyyzzz*v288 + D_xxxyyzzzz*v402 + &
      D_xxyy*v142 + D_xxyyy*v153 + D_xxyyyy*v176 + D_xxyyyyy*v217 + &
      D_xxyyyyyy*v289 + D_xxyyyyyyy*v403 + D_xxyyyyyyz*v404 + &
      D_xxyyyyyz*v290 + D_xxyyyyyzz*v405 + D_xxyyyyz*v218 + D_xxyyyyzz* &
      v291 + D_xxyyyyzzz*v406 + D_xxyyyz*v177 + D_xxyyyzz*v219 + &
      D_xxyyyzzz*v292 + D_xxyyyzzzz*v407 + D_xxyyz*v154 + D_xxyyzz*v178 &
      + D_xxyyzzz*v220 + D_xxyyzzzz*v293 + D_xxyyzzzzz*v408 + D_xyyy* &
      M_xy + D_xyyyy*v598 + D_xyyyyy*v600 + D_xyyyyyy*v602 + D_xyyyyyyy &
      *v604 + D_xyyyyyyyy*v606 + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 &
      + D_yyyy*v450 + D_yyyyy*v452 + D_yyyyyy*v457 + D_yyyyyyy*v466 + &
      D_yyyyyyyy*v482 + D_yyyyyyyyy*v506 + D_yyyyyyyyz*v571 + &
      D_yyyyyyyz*v573 + D_yyyyyyyzz*v574 + D_yyyyyyz*v576 + D_yyyyyyzz* &
      v577 + D_yyyyyyzzz*v578 + D_yyyyyz*v580 + D_yyyyyzz*v581 + &
      D_yyyyyzzz*v582 + D_yyyyyzzzz*v583 + D_yyyyz*v585 + D_yyyyzz*v586 &
      + D_yyyyzzz*v587 + D_yyyyzzzz*v588 + D_yyyyzzzzz*v589 + D_yyyz* &
      M_yz + D_yyyzz*v599 + D_yyyzzz*v601 + D_yyyzzzz*v603 + D_yyyzzzzz &
      *v605 + D_yyyzzzzzz*v607 + D_yyzz*v591 + D_yyzzz*v592 + D_yyzzzz* &
      v593 + D_yyzzzzz*v594 + D_yyzzzzzz*v595 + D_yyzzzzzzz*v596 + &
      M_xyyyyyz*v483 + M_xyyyyz*v484 + M_xyyyyzz*v485 + M_xyyyz*v486 + &
      M_xyyyzz*v487 + M_xyyyzzz*v488 + M_xyyz*v489 + M_xyyzz*v490 + &
      M_xyyzzz*v491 + M_xyyzzzz*v492 + M_xyzz*v473 + M_xyzzz*v474 + &
      M_xyzzzz*v475 + M_xyzzzzz*v476 + M_xzz*v493 + M_xzzz*v494 + &
      M_xzzzz*v495 + M_xzzzzz*v496 + M_xzzzzzz*v497
    L_yyz       = D_xxxxxxyyz*v279 + D_xxxxxyyyz*v280 + D_xxxxxyyz*v211 + D_xxxxxyyzz*v281 &
      + D_xxxxyyyyz*v282 + D_xxxxyyyz*v212 + D_xxxxyyyzz*v283 + &
      D_xxxxyyz*v173 + D_xxxxyyzz*v213 + D_xxxxyyzzz*v284 + D_xxxyyyyyz &
      *v285 + D_xxxyyyyz*v214 + D_xxxyyyyzz*v286 + D_xxxyyyz*v174 + &
      D_xxxyyyzz*v215 + D_xxxyyyzzz*v287 + D_xxxyyz*v152 + D_xxxyyzz* &
      v175 + D_xxxyyzzz*v216 + D_xxxyyzzzz*v288 + D_xxyyyyyyz*v289 + &
      D_xxyyyyyz*v217 + D_xxyyyyyzz*v290 + D_xxyyyyz*v176 + D_xxyyyyzz* &
      v218 + D_xxyyyyzzz*v291 + D_xxyyyz*v153 + D_xxyyyzz*v177 + &
      D_xxyyyzzz*v219 + D_xxyyyzzzz*v292 + D_xxyyz*v142 + D_xxyyzz*v154 &
      + D_xxyyzzz*v178 + D_xxyyzzzz*v220 + D_xxyyzzzzz*v293 + &
      D_xyyyyyyyz*v604 + D_xyyyyyyz*v602 + D_xyyyyyz*v600 + D_xyyyyz* &
      v598 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyyyz &
      *v482 + D_yyyyyyyz*v466 + D_yyyyyyyzz*v573 + D_yyyyyyz*v457 + &
      D_yyyyyyzz*v576 + D_yyyyyyzzz*v577 + D_yyyyyz*v452 + D_yyyyyzz* &
      v580 + D_yyyyyzzz*v581 + D_yyyyyzzzz*v582 + D_yyyyz*v450 + &
      D_yyyyzz*v585 + D_yyyyzzz*v586 + D_yyyyzzzz*v587 + D_yyyyzzzzz* &
      v588 + D_yyyzz*M_yz + D_yyyzzz*v599 + D_yyyzzzz*v601 + D_yyyzzzzz &
      *v603 + D_yyyzzzzzz*v605 + D_yyz*M_0 + D_yyzzz*v591 + D_yyzzzz* &
      v592 + D_yyzzzzz*v593 + D_yyzzzzzz*v594 + D_yyzzzzzzz*v595 + &
      M_xyyyyz*v498 + M_xyyyz*v499 + M_xyyyzz*v472 + M_xyyz*v461 + &
      M_xyyzz*v500 + M_xyyzzz*v501 + M_xyzz*v479 + M_xyzzz*v480 + &
      M_xyzzzz*v481 + M_xzz*v502 + M_xzzz*v503 + M_xzzzz*v504 + &
      M_xzzzzz*v505
    D_yzzzzzzzz = -(D_xxyzzzzzz + D_yyyzzzzzz)
    L_y         = D_xxxxxxxxy*v541 + D_xxxxxxxy*v388 + D_xxxxxxxyy*v542 + D_xxxxxxxyz*v543 &
      + D_xxxxxxy*v279 + D_xxxxxxyy*v389 + D_xxxxxxyyy*v544 + &
      D_xxxxxxyyz*v545 + D_xxxxxxyz*v390 + D_xxxxxxyzz*v546 + D_xxxxxy* &
      v211 + D_xxxxxyy*v280 + D_xxxxxyyy*v391 + D_xxxxxyyyy*v547 + &
      D_xxxxxyyyz*v548 + D_xxxxxyyz*v392 + D_xxxxxyyzz*v549 + D_xxxxxyz &
      *v281 + D_xxxxxyzz*v393 + D_xxxxxyzzz*v550 + D_xxxxy*v173 + &
      D_xxxxyy*v212 + D_xxxxyyy*v282 + D_xxxxyyyy*v394 + D_xxxxyyyyy* &
      v551 + D_xxxxyyyyz*v552 + D_xxxxyyyz*v395 + D_xxxxyyyzz*v553 + &
      D_xxxxyyz*v283 + D_xxxxyyzz*v396 + D_xxxxyyzzz*v554 + D_xxxxyz* &
      v213 + D_xxxxyzz*v284 + D_xxxxyzzz*v397 + D_xxxxyzzzz*v555 + &
      D_xxxy*v152 + D_xxxyy*v174 + D_xxxyyy*v214 + D_xxxyyyy*v285 + &
      D_xxxyyyyy*v398 + D_xxxyyyyyy*v556 + D_xxxyyyyyz*v557 + &
      D_xxxyyyyz*v399 + D_xxxyyyyzz*v558 + D_xxxyyyz*v286 + D_xxxyyyzz* &
      v400 + D_xxxyyyzzz*v559 + D_xxxyyz*v215 + D_xxxyyzz*v287 + &
      D_xxxyyzzz*v401 + D_xxxyyzzzz*v560 + D_xxxyz*v175 + D_xxxyzz*v216 &
      + D_xxxyzzz*v288 + D_xxxyzzzz*v402 + D_xxxyzzzzz*v561 + D_xxy* &
      v142 + D_xxyy*v153 + D_xxyyy*v176 + D_xxyyyy*v217 + D_xxyyyyy* &
      v289 + D_xxyyyyyy*v403 + D_xxyyyyyyy*v562 + D_xxyyyyyyz*v563 + &
      D_xxyyyyyz*v404 + D_xxyyyyyzz*v564 + D_xxyyyyz*v290 + D_xxyyyyzz* &
      v405 + D_xxyyyyzzz*v565 + D_xxyyyz*v218 + D_xxyyyzz*v291 + &
      D_xxyyyzzz*v406 + D_xxyyyzzzz*v566 + D_xxyyz*v177 + D_xxyyzz*v219 &
      + D_xxyyzzz*v292 + D_xxyyzzzz*v407 + D_xxyyzzzzz*v567 + D_xxyz* &
      v154 + D_xxyzz*v178 + D_xxyzzz*v220 + D_xxyzzzz*v293 + D_xxyzzzzz &
      *v408 + D_xxyzzzzzz*v568 + D_xyy*M_xy + D_xyyy*v598 + D_xyyyy* &
      v600 + D_xyyyyy*v602 + D_xyyyyyy*v604 + D_xyyyyyyy*v606 + &
      D_xyyyyyyyy*v608 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy* &
      v450 + D_yyyy*v452 + D_yyyyy*v457 + D_yyyyyy*v466 + D_yyyyyyy* &
      v482 + D_yyyyyyyy*v506 + D_yyyyyyyyy*v569 + D_yyyyyyyyz*v570 + &
      D_yyyyyyyz*v571 + D_yyyyyyyzz*v572 + D_yyyyyyz*v573 + D_yyyyyyzz* &
      v574 + D_yyyyyyzzz*v575 + D_yyyyyz*v576 + D_yyyyyzz*v577 + &
      D_yyyyyzzz*v578 + D_yyyyyzzzz*v579 + D_yyyyz*v580 + D_yyyyzz*v581 &
      + D_yyyyzzz*v582 + D_yyyyzzzz*v583 + D_yyyyzzzzz*v584 + D_yyyz* &
      v585 + D_yyyzz*v586 + D_yyyzzz*v587 + D_yyyzzzz*v588 + D_yyyzzzzz &
      *v589 + D_yyyzzzzzz*v590 + D_yyz*M_yz + D_yyzz*v599 + D_yyzzz* &
      v601 + D_yyzzzz*v603 + D_yyzzzzz*v605 + D_yyzzzzzz*v607 + &
      D_yyzzzzzzz*v609 + D_yzz*v591 + D_yzzz*v592 + D_yzzzz*v593 + &
      D_yzzzzz*v594 + D_yzzzzzz*v595 + D_yzzzzzzz*v596 + D_yzzzzzzzz* &
      v597 + M_xyyyyyyz*v507 + M_xyyyyyz*v508 + M_xyyyyyzz*v509 + &
      M_xyyyyz*v510 + M_xyyyyzz*v511 + M_xyyyyzzz*v512 + M_xyyyz*v513 + &
      M_xyyyzz*v514 + M_xyyyzzz*v515 + M_xyyyzzzz*v516 + M_xyyz*v517 + &
      M_xyyzz*v518 + M_xyyzzz*v519 + M_xyyzzzz*v520 + M_xyyzzzzz*v521 + &
      M_xyzz*v493 + M_xyzzz*v494 + M_xyzzzz*v495 + M_xyzzzzz*v496 + &
      M_xyzzzzzz*v497 + M_xzz*v522 + M_xzzz*v523 + M_xzzzz*v524 + &
      M_xzzzzz*v525 + M_xzzzzzz*v526 + M_xzzzzzzz*v527
    L_yz        = D_xxxxxxxyz*v388 + D_xxxxxxyyz*v389 + D_xxxxxxyz*v279 + D_xxxxxxyzz*v390 &
      + D_xxxxxyyyz*v391 + D_xxxxxyyz*v280 + D_xxxxxyyzz*v392 + &
      D_xxxxxyz*v211 + D_xxxxxyzz*v281 + D_xxxxxyzzz*v393 + D_xxxxyyyyz &
      *v394 + D_xxxxyyyz*v282 + D_xxxxyyyzz*v395 + D_xxxxyyz*v212 + &
      D_xxxxyyzz*v283 + D_xxxxyyzzz*v396 + D_xxxxyz*v173 + D_xxxxyzz* &
      v213 + D_xxxxyzzz*v284 + D_xxxxyzzzz*v397 + D_xxxyyyyyz*v398 + &
      D_xxxyyyyz*v285 + D_xxxyyyyzz*v399 + D_xxxyyyz*v214 + D_xxxyyyzz* &
      v286 + D_xxxyyyzzz*v400 + D_xxxyyz*v174 + D_xxxyyzz*v215 + &
      D_xxxyyzzz*v287 + D_xxxyyzzzz*v401 + D_xxxyz*v152 + D_xxxyzz*v175 &
      + D_xxxyzzz*v216 + D_xxxyzzzz*v288 + D_xxxyzzzzz*v402 + &
      D_xxyyyyyyz*v403 + D_xxyyyyyz*v289 + D_xxyyyyyzz*v404 + D_xxyyyyz &
      *v217 + D_xxyyyyzz*v290 + D_xxyyyyzzz*v405 + D_xxyyyz*v176 + &
      D_xxyyyzz*v218 + D_xxyyyzzz*v291 + D_xxyyyzzzz*v406 + D_xxyyz* &
      v153 + D_xxyyzz*v177 + D_xxyyzzz*v219 + D_xxyyzzzz*v292 + &
      D_xxyyzzzzz*v407 + D_xxyz*v142 + D_xxyzz*v154 + D_xxyzzz*v178 + &
      D_xxyzzzz*v220 + D_xxyzzzzz*v293 + D_xxyzzzzzz*v408 + D_xyyyyyyyz &
      *v606 + D_xyyyyyyz*v604 + D_xyyyyyz*v602 + D_xyyyyz*v600 + &
      D_xyyyz*v598 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + &
      D_yyyyyyyyz*v506 + D_yyyyyyyz*v482 + D_yyyyyyyzz*v571 + D_yyyyyyz &
      *v466 + D_yyyyyyzz*v573 + D_yyyyyyzzz*v574 + D_yyyyyz*v457 + &
      D_yyyyyzz*v576 + D_yyyyyzzz*v577 + D_yyyyyzzzz*v578 + D_yyyyz* &
      v452 + D_yyyyzz*v580 + D_yyyyzzz*v581 + D_yyyyzzzz*v582 + &
      D_yyyyzzzzz*v583 + D_yyyz*v450 + D_yyyzz*v585 + D_yyyzzz*v586 + &
      D_yyyzzzz*v587 + D_yyyzzzzz*v588 + D_yyyzzzzzz*v589 + D_yyzz*M_yz &
      + D_yyzzz*v599 + D_yyzzzz*v601 + D_yyzzzzz*v603 + D_yyzzzzzz*v605 &
      + D_yyzzzzzzz*v607 + D_yz*M_0 + D_yzzz*v591 + D_yzzzz*v592 + &
      D_yzzzzz*v593 + D_yzzzzzz*v594 + D_yzzzzzzz*v595 + D_yzzzzzzzz* &
      v596 + M_xyyyyyz*v528 + M_xyyyyz*v529 + M_xyyyyzz*v530 + M_xyyyz* &
      v531 + M_xyyyzz*v491 + M_xyyyzzz*v532 + M_xyyz*v473 + M_xyyzz* &
      v533 + M_xyyzzz*v534 + M_xyyzzzz*v535 + M_xyzz*v502 + M_xyzzz* &
      v503 + M_xyzzzz*v504 + M_xyzzzzz*v505 + M_xzz*v536 + M_xzzz*v537 &
      + M_xzzzz*v538 + M_xzzzzz*v539 + M_xzzzzzz*v540
    D_zzzzzzzzz = -(D_xxzzzzzzz + D_yyzzzzzzz)
    L_z         = 0.000198412698412698d0*(140.0d0*D_xyyyzzzz*M_xyyyzzz + 35.0d0* &
      D_xyyyzzzzz*M_xyyyzzzz + 1260.0d0*D_xyyzzz*M_xyyzz + 420.0d0* &
      D_xyyzzzz*M_xyyzzz + 2520.0d0*D_xzzz*M_xzz + D_xzzzzzzzz* &
      M_xzzzzzzz + 7.0d0*(D_xyyyyyyzz*M_xyyyyyyz + D_xzzzzzzz*M_xzzzzzz &
      ) + 42.0d0*(D_xyyyyyzz*M_xyyyyyz + D_xzzzzzz*M_xzzzzz) + 21.0d0*( &
      D_xyyyyyzzz*M_xyyyyyzz + D_xyyzzzzzz*M_xyyzzzzz) + 210.0d0*( &
      D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + 105.0d0*(D_xyyyyzzz* &
      M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz) + 840.0d0*(D_xyyyzz*M_xyyyz + &
      D_xzzzz*M_xzzz)) + D_xxxxxxxxz*v541 + D_xxxxxxxyz*v542 + &
      D_xxxxxxxz*v388 + D_xxxxxxxzz*v543 + D_xxxxxxyyz*v544 + &
      D_xxxxxxyz*v389 + D_xxxxxxyzz*v545 + D_xxxxxxz*v279 + D_xxxxxxzz* &
      v390 + D_xxxxxxzzz*v546 + D_xxxxxyyyz*v547 + D_xxxxxyyz*v391 + &
      D_xxxxxyyzz*v548 + D_xxxxxyz*v280 + D_xxxxxyzz*v392 + D_xxxxxyzzz &
      *v549 + D_xxxxxz*v211 + D_xxxxxzz*v281 + D_xxxxxzzz*v393 + &
      D_xxxxxzzzz*v550 + D_xxxxyyyyz*v551 + D_xxxxyyyz*v394 + &
      D_xxxxyyyzz*v552 + D_xxxxyyz*v282 + D_xxxxyyzz*v395 + D_xxxxyyzzz &
      *v553 + D_xxxxyz*v212 + D_xxxxyzz*v283 + D_xxxxyzzz*v396 + &
      D_xxxxyzzzz*v554 + D_xxxxz*v173 + D_xxxxzz*v213 + D_xxxxzzz*v284 &
      + D_xxxxzzzz*v397 + D_xxxxzzzzz*v555 + D_xxxyyyyyz*v556 + &
      D_xxxyyyyz*v398 + D_xxxyyyyzz*v557 + D_xxxyyyz*v285 + D_xxxyyyzz* &
      v399 + D_xxxyyyzzz*v558 + D_xxxyyz*v214 + D_xxxyyzz*v286 + &
      D_xxxyyzzz*v400 + D_xxxyyzzzz*v559 + D_xxxyz*v174 + D_xxxyzz*v215 &
      + D_xxxyzzz*v287 + D_xxxyzzzz*v401 + D_xxxyzzzzz*v560 + D_xxxz* &
      v152 + D_xxxzz*v175 + D_xxxzzz*v216 + D_xxxzzzz*v288 + D_xxxzzzzz &
      *v402 + D_xxxzzzzzz*v561 + D_xxyyyyyyz*v562 + D_xxyyyyyz*v403 + &
      D_xxyyyyyzz*v563 + D_xxyyyyz*v289 + D_xxyyyyzz*v404 + D_xxyyyyzzz &
      *v564 + D_xxyyyz*v217 + D_xxyyyzz*v290 + D_xxyyyzzz*v405 + &
      D_xxyyyzzzz*v565 + D_xxyyz*v176 + D_xxyyzz*v218 + D_xxyyzzz*v291 &
      + D_xxyyzzzz*v406 + D_xxyyzzzzz*v566 + D_xxyz*v153 + D_xxyzz*v177 &
      + D_xxyzzz*v219 + D_xxyzzzz*v292 + D_xxyzzzzz*v407 + D_xxyzzzzzz* &
      v567 + D_xxz*v142 + D_xxzz*v154 + D_xxzzz*v178 + D_xxzzzz*v220 + &
      D_xxzzzzz*v293 + D_xxzzzzzz*v408 + D_xxzzzzzzz*v568 + D_xyyyyyyyz &
      *v608 + D_xyyyyyyz*v606 + D_xyyyyyz*v604 + D_xyyyyz*v602 + &
      D_xyyyz*v600 + D_xyyz*v598 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yyyyyyyyz*v569 + D_yyyyyyyz*v506 + D_yyyyyyyzz*v570 + &
      D_yyyyyyz*v482 + D_yyyyyyzz*v571 + D_yyyyyyzzz*v572 + D_yyyyyz* &
      v466 + D_yyyyyzz*v573 + D_yyyyyzzz*v574 + D_yyyyyzzzz*v575 + &
      D_yyyyz*v457 + D_yyyyzz*v576 + D_yyyyzzz*v577 + D_yyyyzzzz*v578 + &
      D_yyyyzzzzz*v579 + D_yyyz*v452 + D_yyyzz*v580 + D_yyyzzz*v581 + &
      D_yyyzzzz*v582 + D_yyyzzzzz*v583 + D_yyyzzzzzz*v584 + D_yyz*v450 &
      + D_yyzz*v585 + D_yyzzz*v586 + D_yyzzzz*v587 + D_yyzzzzz*v588 + &
      D_yyzzzzzz*v589 + D_yyzzzzzzz*v590 + D_yzz*M_yz + D_yzzz*v599 + &
      D_yzzzz*v601 + D_yzzzzz*v603 + D_yzzzzzz*v605 + D_yzzzzzzz*v607 + &
      D_yzzzzzzzz*v609 + D_z*M_0 + D_zzz*v591 + D_zzzz*v592 + D_zzzzz* &
      v593 + D_zzzzzz*v594 + D_zzzzzzz*v595 + D_zzzzzzzz*v596 + &
      D_zzzzzzzzz*v597 + M_xyyyyzzz*v516 + M_xyyyzz*v519 + M_xyyz*v493 &
      + M_xyzz*v536 + M_xyzzz*v537 + M_xyzzzz*v538 + M_xyzzzzz*v539 + &
      M_xyzzzzzz*v540
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
#undef  M_xxx               
#undef  L_yy                
#undef  L_yz                
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xxx               
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
#undef  M_xxxyyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  L_xxxyyz            
#undef  M_xxyyyz            
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
#undef  M_xxxxxxxx          
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  L_xxxxxxxx          
#undef  M_xxxxxxyy          
#undef  L_xxxxxxxy          
#undef  M_xxxxxxyz          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  M_xxxxxyyy          
#undef  L_xxxxxxyz          
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxxxyyyz          
#undef  L_xxxxyyyy          
#undef  M_xxxyyyyy          
#undef  L_xxxxyyyz          
#undef  M_xxxyyyyz          
#undef  M_xxyyyyyy          
#undef  L_xxxyyyyy          
#undef  M_xxyyyyyz          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
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
    end subroutine mom_es_M2L
    
! OPS  1246*ADD + 2*DIV + 1443*MUL + 120*NEG + POW = 2812  (10556 before optimization)
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
                v552, v553, v554, v555, v556, v56, v57, v58, v59, v6, v60,&
                v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71,&
                v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82,&
                v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93,&
                v94, v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
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
                L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz,&
                L_xxxxxxzzz, L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz,&
                L_xxxxyyyzz, L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz,&
                L_xxxyyyyzz, L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz,&
                L_xxxzzzzzz, L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz,&
                L_xxyyzzzzz, L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz,&
                L_xyyyyyzzz, L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz,&
                L_xyzzzzzzz, L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz,&
                L_yyyyyzzzz, L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz,&
                L_yzzzzzzzz, L_zzzzzzzzz
#define y                    r(2)
#define L_x                  L(0)
#define x                    r(1)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define L_xy                 L(4)
#define Ls_xy                Ls(4)
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
#define Ls_xxyyy             Ls(29)
#define L_xxyyy              L(29)
#define Ls_xxyyz             Ls(30)
#define L_xxyyz              L(30)
#define L_xyyyy              L(31)
#define Ls_xyyyy             Ls(31)
#define Ls_xyyyz             Ls(32)
#define L_xyyyz              L(32)
#define L_yyyyy              L(33)
#define Ls_yyyyy             Ls(33)
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
#define L_xxxxyz             L(39)
#define Ls_xxxxyz            Ls(39)
#define L_xxxyyy             L(40)
#define Ls_xxxyyy            Ls(40)
#define Ls_xxxyyz            Ls(41)
#define L_xxxyyz             L(41)
#define Ls_xxyyyy            Ls(42)
#define L_xxyyyy             L(42)
#define Ls_xxyyyz            Ls(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define Ls_xyyyyy            Ls(44)
#define Ls_xyyyyz            Ls(45)
#define L_xyyyyz             L(45)
#define L_yyyyyy             L(46)
#define Ls_yyyyyy            Ls(46)
#define Ls_yyyyyz            Ls(47)
#define L_yyyyyz             L(47)
#define L_xxxxxxx            L(48)
#define Ls_xxxxxxx           Ls(48)
#define Ls_xxxxxxy           Ls(49)
#define L_xxxxxxy            L(49)
#define Ls_xxxxxxz           Ls(50)
#define L_xxxxxxz            L(50)
#define Ls_xxxxxyy           Ls(51)
#define L_xxxxxyy            L(51)
#define L_xxxxxyz            L(52)
#define Ls_xxxxxyz           Ls(52)
#define Ls_xxxxyyy           Ls(53)
#define L_xxxxyyy            L(53)
#define Ls_xxxxyyz           Ls(54)
#define L_xxxxyyz            L(54)
#define Ls_xxxyyyy           Ls(55)
#define L_xxxyyyy            L(55)
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
#define L_yyyyyyz            L(62)
#define Ls_yyyyyyz           Ls(62)
#define Ls_xxxxxxxx          Ls(63)
#define L_xxxxxxxx           L(63)
#define L_xxxxxxxy           L(64)
#define Ls_xxxxxxxy          Ls(64)
#define L_xxxxxxxz           L(65)
#define Ls_xxxxxxxz          Ls(65)
#define L_xxxxxxyy           L(66)
#define Ls_xxxxxxyy          Ls(66)
#define Ls_xxxxxxyz          Ls(67)
#define L_xxxxxxyz           L(67)
#define Ls_xxxxxyyy          Ls(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define Ls_xxxxxyyz          Ls(69)
#define L_xxxxyyyy           L(70)
#define Ls_xxxxyyyy          Ls(70)
#define L_xxxxyyyz           L(71)
#define Ls_xxxxyyyz          Ls(71)
#define L_xxxyyyyy           L(72)
#define Ls_xxxyyyyy          Ls(72)
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
#define Ls_xxxxxxxxx         Ls(80)
#define L_xxxxxxxxx          L(80)
#define Ls_xxxxxxxxy         Ls(81)
#define L_xxxxxxxxy          L(81)
#define Ls_xxxxxxxxz         Ls(82)
#define L_xxxxxxxxz          L(82)
#define L_xxxxxxxyy          L(83)
#define Ls_xxxxxxxyy         Ls(83)
#define Ls_xxxxxxxyz         Ls(84)
#define L_xxxxxxxyz          L(84)
#define L_xxxxxxyyy          L(85)
#define Ls_xxxxxxyyy         Ls(85)
#define Ls_xxxxxxyyz         Ls(86)
#define L_xxxxxxyyz          L(86)
#define Ls_xxxxxyyyy         Ls(87)
#define L_xxxxxyyyy          L(87)
#define L_xxxxxyyyz          L(88)
#define Ls_xxxxxyyyz         Ls(88)
#define Ls_xxxxyyyyy         Ls(89)
#define L_xxxxyyyyy          L(89)
#define L_xxxxyyyyz          L(90)
#define Ls_xxxxyyyyz         Ls(90)
#define L_xxxyyyyyy          L(91)
#define Ls_xxxyyyyyy         Ls(91)
#define L_xxxyyyyyz          L(92)
#define Ls_xxxyyyyyz         Ls(92)
#define L_xxyyyyyyy          L(93)
#define Ls_xxyyyyyyy         Ls(93)
#define L_xxyyyyyyz          L(94)
#define Ls_xxyyyyyyz         Ls(94)
#define Ls_xyyyyyyyy         Ls(95)
#define L_xyyyyyyyy          L(95)
#define Ls_xyyyyyyyz         Ls(96)
#define L_xyyyyyyyz          L(96)
#define Ls_yyyyyyyyy         Ls(97)
#define L_yyyyyyyyy          L(97)
#define L_yyyyyyyyz          L(98)
#define Ls_yyyyyyyyz         Ls(98)
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
    v337         = 0.00138888888888889d0*x
    v353         = L_xyyyyyyz*z
    v356         = v13*y
    v359         = L_xyyyyyz*z
    v370         = L_xyyyyz*z
    v386         = L_xyyyz*z
    v406         = L_xyyz*z
    v430         = L_xyz*z
    v474         = 0.000198412698412698d0*y
    v480         = 0.000198412698412698d0*x
    v492         = L_yyyyyyyz*z
    v495         = L_yyyyyyz*z
    v497         = 0.5d0*y
    v501         = L_yyyyyz*z
    v504         = 0.166666666666667d0*y
    v510         = L_yyyyz*z
    v514         = 0.0416666666666667d0*y
    v521         = L_yyyz*z
    v526         = 0.00833333333333333d0*y
    v534         = L_yyz*z
    v540         = 0.00138888888888889d0*y
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
    v482         = L_xzz*z
    L_yzz        = -(L_xxy + L_yyy)
    v554         = L_yzz*z
    L_zzz        = -(L_xxz + L_yyz)
    L_xxzz       = -(L_xxxx + L_xxyy)
    v340         = L_xxzz*z
    L_xyzz       = -(L_xxxy + L_xyyy)
    v445         = L_xyzz*z
    L_xzzz       = -(L_xxxz + L_xyyz)
    L_yyzz       = -(L_xxyy + L_yyyy)
    v546         = L_yyzz*z
    L_yzzz       = -(L_xxyz + L_yyyz)
    L_zzzz       = -(L_xxzz + L_yyzz)
    L_xxxzz      = -(L_xxxxx + L_xxxyy)
    v227         = L_xxxzz*z
    L_xxyzz      = -(L_xxxxy + L_xxyyy)
    v304         = L_xxyzz*z
    L_xxzzz      = -(L_xxxxz + L_xxyyz)
    L_xyyzz      = -(L_xxxyy + L_xyyyy)
    v419         = L_xyyzz*z
    L_xyzzz      = -(L_xxxyz + L_xyyyz)
    L_xzzzz      = -(L_xxxzz + L_xyyzz)
    L_yyyzz      = -(L_xxyyy + L_yyyyy)
    v531         = L_yyyzz*z
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
    v397         = L_xyyyzz*z
    L_xyyzzz     = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz     = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz     = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz     = -(L_xxyyyy + L_yyyyyy)
    v518         = L_yyyyzz*z
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
    v379         = L_xyyyyzz*z
    L_xyyyzzz    = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz    = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz    = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz    = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz    = -(L_xxyyyyy + L_yyyyyyy)
    v507         = L_yyyyyzz*z
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
    v366         = L_xyyyyyzz*z
    L_xyyyyzzz   = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz   = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz   = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz   = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz   = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz   = -(L_xxyyyyyy + L_yyyyyyyy)
    v499         = L_yyyyyyzz*z
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
    v357         = L_xyyyyyyz + L_xyyyyyyzz*z
    v358         = L_xyyyyyyyz*y + v357
    v369         = v357*y
    Ls_xyyyyyyz  = L_xxyyyyyyz*x + v358
    L_xyyyyyzzz  = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz  = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz  = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz  = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz  = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz  = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz  = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v494         = L_yyyyyyyz + L_yyyyyyyzz*z
    Ls_yyyyyyyz  = v494 + L_xyyyyyyyz*x + L_yyyyyyyyz*y
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
    v336         = 0.00416666666666667d0*v17
    v479         = 0.000694444444444444d0*v17
    a3           = a1*a2
    v32          = a3
    v33          = 0.166666666666667d0*v32
    v137         = 0.0833333333333333d0*v32
    v222         = 0.0277777777777778d0*v32
    v335         = 0.00694444444444444d0*v32
    v478         = 0.00138888888888889d0*v32
    a4           = a2*a2
    v66          = a4
    v67          = 0.0416666666666667d0*v66
    v219         = 0.0208333333333333d0*v66
    v334         = 0.00694444444444444d0*v66
    v477         = 0.00173611111111111d0*v66
    a5           = a2*a3
    v123         = a5
    v124         = 0.00833333333333333d0*v123
    v330         = 0.00416666666666667d0*v123
    v476         = 0.00138888888888889d0*v123
    a6           = a3*a3
    v205         = a6
    v206         = 0.00138888888888889d0*v205
    v471         = 0.000694444444444444d0*v205
    a7           = a3*a4
    v316         = 0.000198412698412698d0*a7
    a8           = a4*a4
    v458         = 2.48015873015873d-5*a8
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
    v354         = L_xyyyyyyyy*v19
    v367         = L_xyyyyyyyz*v19
    v473         = 0.000694444444444444d0*v19
    v503         = 0.25d0*v19
    v513         = 0.0833333333333333d0*v19
    v525         = 0.0208333333333333d0*v19
    v539         = 0.00416666666666667d0*v19
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
    v360         = L_xyyyyyyyy*v34
    v380         = L_xyyyyyyyz*v34
    v472         = 0.00138888888888889d0*v34
    v512         = 0.0833333333333333d0*v34
    v524         = 0.0277777777777778d0*v34
    v538         = 0.00694444444444444d0*v34
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
    v371         = L_xyyyyyyyy*v68
    v398         = L_xyyyyyyyz*v68
    v470         = 0.00173611111111111d0*v68
    v523         = 0.0208333333333333d0*v68
    v537         = 0.00694444444444444d0*v68
    b5           = b2*b3
    v125         = b5
    v126         = L_xxxxyyyyy*v125
    v185         = L_xxxyyyyyy*v125
    v215         = 0.00833333333333333d0*v125
    v228         = L_xxxyyyyyz*v125
    v272         = L_xxyyyyyyy*v125
    v305         = L_xxyyyyyyz*v125
    v338         = 6.0d0*v125
    v387         = L_xyyyyyyyy*v125
    v420         = L_xyyyyyyyz*v125
    v469         = 0.00138888888888889d0*v125
    v536         = 0.00416666666666667d0*v125
    b6           = b3*b3
    v207         = b6
    v208         = L_xxxyyyyyy*v207
    v292         = L_xxyyyyyyy*v207
    v326         = 0.00138888888888889d0*v207
    v341         = L_xxyyyyyyz*v207
    v407         = L_xyyyyyyyy*v207
    v446         = L_xyyyyyyyz*v207
    v468         = 0.000694444444444444d0*v207
    v481         = 7.0d0*v207
    b7           = b3*b4
    v317         = b7
    v318         = L_xxyyyyyyy*v317
    v431         = L_xyyyyyyyy*v317
    v467         = 0.000198412698412698d0*v317
    v483         = L_xyyyyyyyz*v317
    b8           = b4*b4
    v459         = 2.48015873015873d-5*b8
    b9           = b4*b5
    c2           = c1*c1
    v21          = c2
    v460         = 0.5d0*v21
    v505         = 3.0d0*v21
    v515         = 12.0d0*v21
    v527         = 60.0d0*v21
    v541         = 360.0d0*v21
    v549         = 2520.0d0*v21
    v319         = L_xxzz*v21
    v432         = L_xyzz*v21
    v209         = L_xxxzz*v21
    v293         = L_xxyzz*v21
    v342         = L_xxzzz*v21
    v408         = L_xyyzz*v21
    v447         = L_xyzzz*v21
    v127         = L_xxxxzz*v21
    v186         = L_xxxyzz*v21
    v229         = L_xxxzzz*v21
    v273         = L_xxyyzz*v21
    v306         = L_xxyzzz*v21
    v388         = L_xyyyzz*v21
    v421         = L_xyyzzz*v21
    v70          = L_xxxxxzz*v21
    v108         = L_xxxxyzz*v21
    v144         = L_xxxxzzz*v21
    v170         = L_xxxyyzz*v21
    v197         = L_xxxyzzz*v21
    v257         = L_xxyyyzz*v21
    v284         = L_xxyyzzz*v21
    v372         = L_xyyyyzz*v21
    v399         = L_xyyyzzz*v21
    v36          = L_xxxxxxzz*v21
    v56          = L_xxxxxyzz*v21
    v84          = L_xxxxxzzz*v21
    v97          = L_xxxxyyzz*v21
    v117         = L_xxxxyzzz*v21
    v159         = L_xxxyyyzz*v21
    v179         = L_xxxyyzzz*v21
    v246         = L_xxyyyyzz*v21
    v266         = L_xxyyyzzz*v21
    v361         = L_xyyyyyzz*v21
    v381         = L_xyyyyzzz*v21
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
    v327         = v125*v248
    v365         = 2.0d0*v241 + v239 + v248
    Ls_xxyyyyy   = 0.5d0*(v239 + v240) + L_xxxxyyyyy*v18 + L_xxyyyyy + v10*x + v238 + v241
    v253         = L_xxyyyyzzz*v21
    v268         = v253 + 2.0d0*(L_xxyyyyz + v251)
    v269         = v268*y
    v287         = v19*v268
    v310         = v268*v34
    v347         = v268*v68
    v385         = 2.0d0*v254 + v252 + v268
    Ls_xxyyyyz   = 0.5d0*(v252 + v253) + L_xxxxyyyyz*v18 + L_xxyyyyz + v156*x + v251 + v254
    v355         = L_xyyyyyyzz*v21
    v363         = v355 + 2.0d0*(L_xyyyyyy + v353)
    v364         = v363*y
    v375         = v19*v363
    v392         = v34*v363
    v413         = v363*v68
    v438         = v125*v363
    Ls_xyyyyyy   = 0.5d0*(v354 + v355) + L_xxxyyyyyy*v18 + L_xyyyyyy + v12*x + v353 + v356
    v368         = L_xyyyyyzzz*v21
    v383         = v368 + 2.0d0*(L_xyyyyyz + v366)
    v384         = v383*y
    v402         = v19*v383
    v425         = v34*v383
    v452         = v383*v68
    v485         = v125*v383
    Ls_xyyyyyz   = 0.5d0*(v367 + v368) + L_xxxyyyyyz*v18 + L_xyyyyyz + v243*x + v366 + v369
    v493         = L_yyyyyyyzz*v21
    v498         = v493 + 2.0d0*(L_yyyyyyy + v492)
    Ls_yyyyyyy   = 0.5d0*v493 + L_xxyyyyyyy*v18 + L_yyyyyyy + L_yyyyyyyyy*v39 + v14*x + v15 &
      *y + v492
    v500         = L_yyyyyyzzz*v21
    v509         = v500 + 2.0d0*(L_yyyyyyz + v499)
    Ls_yyyyyyz   = 0.5d0*v500 + L_xxyyyyyyz*v18 + L_yyyyyyyyz*v39 + L_yyyyyyz + v358*x + &
      v494*y + v499
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
    v461         = 0.166666666666667d0*v37
    v516         = 4.0d0*v37
    v528         = 20.0d0*v37
    v542         = 120.0d0*v37
    v550         = 840.0d0*v37
    v320         = L_xxzzz*v37
    v433         = L_xyzzz*v37
    v210         = L_xxxzzz*v37
    v294         = L_xxyzzz*v37
    v343         = L_xxzzzz*v37
    v409         = L_xyyzzz*v37
    v448         = L_xyzzzz*v37
    v128         = L_xxxxzzz*v37
    v187         = L_xxxyzzz*v37
    v230         = L_xxxzzzz*v37
    v274         = L_xxyyzzz*v37
    v307         = L_xxyzzzz*v37
    v389         = L_xyyyzzz*v37
    v422         = L_xyyzzzz*v37
    v71          = L_xxxxxzzz*v37
    v109         = L_xxxxyzzz*v37
    v145         = L_xxxxzzzz*v37
    v171         = L_xxxyyzzz*v37
    v198         = L_xxxyzzzz*v37
    v258         = L_xxyyyzzz*v37
    v285         = L_xxyyzzzz*v37
    v373         = L_xyyyyzzz*v37
    v400         = L_xyyyzzzz*v37
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
    v328         = v261*v68
    v378         = v245 + v261 + v11*v80 + 3.0d0*v249
    Ls_xxyyyy    = 0.166666666666667d0*(v245 + v247 + 3.0d0*(v246 + v249)) + L_xxxxxyyyy* &
      v33 + L_xxyyyy + v11*v39 + v18*v8 + v244 + v250*v42
    v267         = L_xxyyyzzzz*v37
    v288         = v267 + 3.0d0*(2.0d0*L_xxyyyz + 2.0d0*v264 + v266)
    v289         = v288*y
    v311         = v19*v288
    v348         = v288*v34
    v405         = v265 + v288 + v242*v80 + 3.0d0*v269
    Ls_xxyyyz    = 0.166666666666667d0*(v265 + v267 + 3.0d0*(v266 + v269)) + L_xxxxxyyyz* &
      v33 + L_xxyyyz + v18*v94 + v242*v39 + v264 + v270*v42
    v362         = L_xyyyyyzzz*v37
    v376         = v362 + 3.0d0*(2.0d0*L_xyyyyy + 2.0d0*v359 + v361)
    v377         = v376*y
    v393         = v19*v376
    v414         = v34*v376
    v439         = v376*v68
    Ls_xyyyyy    = 0.166666666666667d0*(v360 + v362 + 3.0d0*(v361 + v364)) + L_xxxxyyyyy* &
      v33 + L_xyyyyy + v10*v18 + v13*v39 + v359 + v365*v42
    v382         = L_xyyyyzzzz*v37
    v403         = v382 + 3.0d0*(2.0d0*L_xyyyyz + 2.0d0*v379 + v381)
    v404         = v403*y
    v426         = v19*v403
    v453         = v34*v403
    v486         = v403*v68
    Ls_xyyyyz    = 0.166666666666667d0*(v380 + v382 + 3.0d0*(v381 + v384)) + L_xxxxyyyyz* &
      v33 + L_xyyyyz + v156*v18 + v357*v39 + v379 + v385*v42
    v496         = L_yyyyyyzzz*v37
    v506         = v496 + L_yyyyyyzz*v505 + 6.0d0*(L_yyyyyy + v495)
    Ls_yyyyyy    = 0.166666666666667d0*v496 + L_xxxyyyyyy*v33 + L_yyyyyy + L_yyyyyyyyy*v74 &
      + L_yyyyyyzz*v460 + v12*v18 + v15*v39 + v42*(v354 + 2.0d0*v356 + &
      v363) + v495 + v497*v498
    v508         = L_yyyyyzzzz*v37
    v520         = v508 + L_yyyyyzzz*v505 + 6.0d0*(L_yyyyyz + v507)
    Ls_yyyyyz    = 0.166666666666667d0*v508 + L_xxxyyyyyz*v33 + L_yyyyyyyyz*v74 + L_yyyyyz &
      + L_yyyyyzzz*v460 + v18*v243 + v39*v494 + v42*(v367 + 2.0d0*v369 &
      + v383) + v497*v509 + v507
    c4           = c2*c2
    v72          = c4
    v462         = 0.0416666666666667d0*v72
    v529         = 5.0d0*v72
    v543         = 30.0d0*v72
    v551         = 210.0d0*v72
    v321         = L_xxzzzz*v72
    v434         = L_xyzzzz*v72
    v211         = L_xxxzzzz*v72
    v295         = L_xxyzzzz*v72
    v344         = L_xxzzzzz*v72
    v410         = L_xyyzzzz*v72
    v449         = L_xyzzzzz*v72
    v129         = L_xxxxzzzz*v72
    v188         = L_xxxyzzzz*v72
    v231         = L_xxxzzzzz*v72
    v275         = L_xxyyzzzz*v72
    v308         = L_xxyzzzzz*v72
    v390         = L_xyyyzzzz*v72
    v423         = L_xyyzzzzz*v72
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
    v329         = v279*v34
    v396         = v256 + v279 + v11*v140 + 6.0d0*v260 + 4.0d0*v262
    Ls_xxyyy     = 0.0416666666666667d0*(v256 + 12.0d0*v257 + v259 + 6.0d0*v260 + 4.0d0*( &
      v258 + v262)) + L_xxxxxxyyy*v67 + L_xxyyy + v11*v74 + v163*v78 + &
      v255 + v263*v79 + v33*v6
    v286         = L_xxyyzzzzz*v72
    v312         = v286 + 12.0d0*v284 + 4.0d0*(6.0d0*L_xxyyz + 6.0d0*v282 + v285)
    v313         = v312*y
    v349         = v19*v312
    v429         = v283 + v312 + v140*v242 + 6.0d0*v287 + 4.0d0*v289
    Ls_xxyyz     = 0.0416666666666667d0*(v283 + 12.0d0*v284 + v286 + 6.0d0*v287 + 4.0d0*( &
      v285 + v289)) + L_xxxxxxyyz*v67 + L_xxyyz + v183*v78 + v242*v74 + &
      v282 + v290*v79 + v33*v53
    v374         = L_xyyyyzzzz*v72
    v394         = v374 + 12.0d0*v372 + 4.0d0*(6.0d0*L_xyyyy + 6.0d0*v370 + v373)
    v395         = v394*y
    v415         = v19*v394
    v440         = v34*v394
    Ls_xyyyy     = 0.0416666666666667d0*(v371 + 12.0d0*v372 + v374 + 6.0d0*v375 + 4.0d0*( &
      v373 + v377)) + L_xxxxxyyyy*v67 + L_xyyyy + v13*v74 + v250*v78 + &
      v33*v8 + v370 + v378*v79
    v401         = L_xyyyzzzzz*v72
    v427         = v401 + 12.0d0*v399 + 4.0d0*(6.0d0*L_xyyyz + 6.0d0*v397 + v400)
    v428         = v427*y
    v454         = v19*v427
    v487         = v34*v427
    Ls_xyyyz     = 0.0416666666666667d0*(v398 + 12.0d0*v399 + v401 + 6.0d0*v402 + 4.0d0*( &
      v400 + v404)) + L_xxxxxyyyz*v67 + L_xyyyz + v270*v78 + v33*v94 + &
      v357*v74 + v397 + v405*v79
    v502         = L_yyyyyzzzz*v72
    v517         = v502 + L_yyyyyzz*v515 + L_yyyyyzzz*v516 + 24.0d0*(L_yyyyy + v501)
    Ls_yyyyy     = 0.0416666666666667d0*v502 + L_xxxxyyyyy*v67 + L_yyyyy + L_yyyyyyyyy*v132 &
      + L_yyyyyzz*v460 + L_yyyyyzzz*v461 + v10*v33 + v15*v74 + v365*v78 &
      + v498*v503 + v501 + v504*v506 + v79*(v13*v80 + v360 + 3.0d0*v364 &
      + v376)
    v519         = L_yyyyzzzzz*v72
    v533         = v519 + L_yyyyzzz*v515 + L_yyyyzzzz*v516 + 24.0d0*(L_yyyyz + v518)
    Ls_yyyyz     = 0.0416666666666667d0*v519 + L_xxxxyyyyz*v67 + L_yyyyyyyyz*v132 + L_yyyyz &
      + L_yyyyzzz*v460 + L_yyyyzzzz*v461 + v156*v33 + v385*v78 + v494* &
      v74 + v503*v509 + v504*v520 + v518 + v79*(v357*v80 + v380 + 3.0d0 &
      *v384 + v403)
    c5           = c2*c3
    v130         = c5
    v463         = 0.00833333333333333d0*v130
    v544         = 6.0d0*v130
    v552         = 42.0d0*v130
    v322         = L_xxzzzzz*v130
    v435         = L_xyzzzzz*v130
    v212         = L_xxxzzzzz*v130
    v296         = L_xxyzzzzz*v130
    v345         = L_xxzzzzzz*v130
    v411         = L_xyyzzzzz*v130
    v450         = L_xyzzzzzz*v130
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
    v352         = v228 + v232 + v155*v225 + 60.0d0*v229 + 20.0d0*v230 + 120.0d0*(L_xxxz + &
      v227) + 5.0d0*(v231 + v236) + 10.0d0*(v233 + v234)
    Ls_xxxz      = 0.00833333333333333d0*(v228 + 60.0d0*v229 + 20.0d0*v230 + v232 + 5.0d0*( &
      v231 + v236) + 10.0d0*(v233 + v234)) + L_xxxxxxxxz*v124 + L_xxxz &
      + v132*v155 + v137*v88 + v138*v150 + v139*v237 + v227 + v24*v67
    v276         = L_xxyyzzzzz*v130
    v301         = v276 + 60.0d0*v273 + 20.0d0*v274 + 5.0d0*(24.0d0*L_xxyy + 24.0d0*v271 + &
      v275)
    v302         = v301*y
    v331         = v19*v301
    v418         = v272 + v301 + v11*v225 + 5.0d0*v280 + 10.0d0*(v277 + v278)
    Ls_xxyy      = 0.00833333333333333d0*(v272 + 60.0d0*v273 + 20.0d0*v274 + v276 + 5.0d0*( &
      v275 + v280) + 10.0d0*(v277 + v278)) + L_xxxxxxxyy*v124 + L_xxyy &
      + v101*v137 + v11*v132 + v138*v176 + v139*v281 + v271 + v4*v67
    v309         = L_xxyzzzzzz*v130
    v350         = v309 + 60.0d0*v306 + 20.0d0*v307 + 5.0d0*(24.0d0*L_xxyz + 24.0d0*v304 + &
      v308)
    v351         = v350*y
    v457         = v305 + v350 + v225*v242 + 5.0d0*v313 + 10.0d0*(v310 + v311)
    Ls_xxyz      = 0.00833333333333333d0*(v305 + 60.0d0*v306 + 20.0d0*v307 + v309 + 5.0d0*( &
      v308 + v313) + 10.0d0*(v310 + v311)) + L_xxxxxxxyz*v124 + L_xxyz &
      + v121*v137 + v132*v242 + v138*v203 + v139*v314 + v30*v67 + v304
    v391         = L_xyyyzzzzz*v130
    v416         = v391 + 60.0d0*v388 + 20.0d0*v389 + 5.0d0*(24.0d0*L_xyyy + 24.0d0*v386 + &
      v390)
    v417         = v416*y
    v441         = v19*v416
    Ls_xyyy      = 0.00833333333333333d0*(v387 + 60.0d0*v388 + 20.0d0*v389 + v391 + 5.0d0*( &
      v390 + v395) + 10.0d0*(v392 + v393)) + L_xxxxxxyyy*v124 + L_xyyy &
      + v13*v132 + v137*v163 + v138*v263 + v139*v396 + v386 + v6*v67
    v424         = L_xyyzzzzzz*v130
    v455         = v424 + 60.0d0*v421 + 20.0d0*v422 + 5.0d0*(24.0d0*L_xyyz + 24.0d0*v419 + &
      v423)
    v456         = v455*y
    v488         = v19*v455
    Ls_xyyz      = 0.00833333333333333d0*(v420 + 60.0d0*v421 + 20.0d0*v422 + v424 + 5.0d0*( &
      v423 + v428) + 10.0d0*(v425 + v426)) + L_xxxxxxyyz*v124 + L_xyyz &
      + v132*v357 + v137*v183 + v138*v290 + v139*v429 + v419 + v53*v67
    v511         = L_yyyyzzzzz*v130
    v530         = v511 + L_yyyyzz*v527 + L_yyyyzzz*v528 + L_yyyyzzzz*v529 + 120.0d0*( &
      L_yyyy + v510)
    Ls_yyyy      = 0.00833333333333333d0*v511 + L_xxxxxyyyy*v124 + L_yyyy + L_yyyyyyyyy* &
      v215 + L_yyyyzz*v460 + L_yyyyzzz*v461 + L_yyyyzzzz*v462 + v132* &
      v15 + v137*v250 + v138*v378 + v139*(v13*v140 + v371 + 6.0d0*v375 &
      + 4.0d0*v377 + v394) + v498*v512 + v506*v513 + v510 + v514*v517 + &
      v67*v8
    v532         = L_yyyzzzzzz*v130
    v548         = v532 + L_yyyzzz*v527 + L_yyyzzzz*v528 + L_yyyzzzzz*v529 + 120.0d0*( &
      L_yyyz + v531)
    Ls_yyyz      = 0.00833333333333333d0*v532 + L_xxxxxyyyz*v124 + L_yyyyyyyyz*v215 + &
      L_yyyz + L_yyyzzz*v460 + L_yyyzzzz*v461 + L_yyyzzzzz*v462 + v132* &
      v494 + v137*v270 + v138*v405 + v139*(v140*v357 + v398 + 6.0d0* &
      v402 + 4.0d0*v404 + v427) + v509*v512 + v513*v520 + v514*v533 + &
      v531 + v67*v94
    c6           = c3*c3
    v213         = c6
    v464         = 0.00138888888888889d0*v213
    v553         = 7.0d0*v213
    v323         = L_xxzzzzzz*v213
    v436         = L_xyzzzzzz*v213
    v214         = L_xxxzzzzzz*v213
    v339         = v208 + v214 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 + 20.0d0*v217 + &
      v338*v9 + 720.0d0*(L_xxx + v204) + 6.0d0*(v212 + v221) + 15.0d0*( &
      v216 + v218)
    Ls_xxx       = 0.00138888888888889d0*(v208 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 &
      + v214 + 20.0d0*v217 + 6.0d0*(v212 + v221) + 15.0d0*(v216 + v218 &
      )) + L_xxx + L_xxxxxxxxx*v206 + v0*v124 + v141*v223 + v204 + v215 &
      *v9 + v219*v43 + v222*v81 + v224*v226
    v297         = L_xxyzzzzzz*v213
    v332         = v297 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 + 6.0d0*(120.0d0*L_xxy &
      + 120.0d0*v291 + v296)
    v333         = v332*y
    v444         = v292 + v332 + v11*v338 + 20.0d0*v299 + 6.0d0*v302 + 15.0d0*(v298 + v300)
    Ls_xxy       = 0.00138888888888889d0*(v292 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 &
      + v297 + 20.0d0*v299 + 6.0d0*(v296 + v302) + 15.0d0*(v298 + v300 &
      )) + L_xxxxxxxxy*v206 + L_xxy + v11*v215 + v114*v222 + v124*v2 + &
      v194*v223 + v219*v60 + v224*v303 + v291
    v346         = L_xxzzzzzzz*v213
    v491         = v341 + v346 + v242*v338 + 360.0d0*v342 + 120.0d0*v343 + 30.0d0*v344 + &
      20.0d0*v348 + 720.0d0*(L_xxz + v340) + 6.0d0*(v345 + v351) + &
      15.0d0*(v347 + v349)
    Ls_xxz       = 0.00138888888888889d0*(v341 + 360.0d0*v342 + 120.0d0*v343 + 30.0d0*v344 &
      + v346 + 20.0d0*v348 + 6.0d0*(v345 + v351) + 15.0d0*(v347 + v349 &
      )) + L_xxxxxxxxz*v206 + L_xxz + v124*v24 + v150*v222 + v215*v242 &
      + v219*v88 + v223*v237 + v224*v352 + v340
    v412         = L_xyyzzzzzz*v213
    v442         = v412 + 360.0d0*v408 + 120.0d0*v409 + 30.0d0*v410 + 6.0d0*(120.0d0*L_xyy &
      + 120.0d0*v406 + v411)
    v443         = v442*y
    Ls_xyy       = 0.00138888888888889d0*(v407 + 360.0d0*v408 + 120.0d0*v409 + 30.0d0*v410 &
      + v412 + 20.0d0*v414 + 6.0d0*(v411 + v417) + 15.0d0*(v413 + v415 &
      )) + L_xxxxxxxyy*v206 + L_xyy + v101*v219 + v124*v4 + v13*v215 + &
      v176*v222 + v223*v281 + v224*v418 + v406
    v451         = L_xyzzzzzzz*v213
    v489         = v451 + 360.0d0*v447 + 120.0d0*v448 + 30.0d0*v449 + 6.0d0*(120.0d0*L_xyz &
      + 120.0d0*v445 + v450)
    v490         = v489*y
    Ls_xyz       = 0.00138888888888889d0*(v446 + 360.0d0*v447 + 120.0d0*v448 + 30.0d0*v449 &
      + v451 + 20.0d0*v453 + 6.0d0*(v450 + v456) + 15.0d0*(v452 + v454 &
      )) + L_xxxxxxxyz*v206 + L_xyz + v121*v219 + v124*v30 + v203*v222 &
      + v215*v357 + v223*v314 + v224*v457 + v445
    v522         = L_yyyzzzzzz*v213
    v545         = v522 + L_yyyzz*v541 + L_yyyzzz*v542 + L_yyyzzzz*v543 + L_yyyzzzzz*v544 + &
      720.0d0*(L_yyy + v521)
    Ls_yyy       = 0.00138888888888889d0*v522 + L_xxxxxxyyy*v206 + L_yyy + L_yyyyyyyyy*v326 &
      + L_yyyzz*v460 + L_yyyzzz*v461 + L_yyyzzzz*v462 + L_yyyzzzzz*v463 &
      + v124*v6 + v15*v215 + v163*v219 + v222*v263 + v223*v396 + v224*( &
      v13*v225 + v387 + 10.0d0*v392 + 10.0d0*v393 + 5.0d0*v395 + v416) &
      + v498*v523 + v506*v524 + v517*v525 + v521 + v526*v530
    v547         = L_yyzzzzzzz*v213
    v556         = v547 + L_yyzzz*v541 + L_yyzzzz*v542 + L_yyzzzzz*v543 + L_yyzzzzzz*v544 + &
      720.0d0*(L_yyz + v546)
    Ls_yyz       = 0.00138888888888889d0*v547 + L_xxxxxxyyz*v206 + L_yyyyyyyyz*v326 + L_yyz &
      + L_yyzzz*v460 + L_yyzzzz*v461 + L_yyzzzzz*v462 + L_yyzzzzzz*v463 &
      + v124*v53 + v183*v219 + v215*v494 + v222*v290 + v223*v429 + v224 &
      *(v225*v357 + v420 + 10.0d0*v425 + 10.0d0*v426 + 5.0d0*v428 + &
      v455) + v509*v523 + v520*v524 + v525*v533 + v526*v548 + v546
    c7           = c3*c4
    v324         = c7
    v465         = 0.000198412698412698d0*v324
    v325         = L_xxzzzzzzz*v324
    Ls_xx        = 0.000198412698412698d0*(v318 + 2520.0d0*v319 + 840.0d0*v320 + 210.0d0* &
      v321 + 42.0d0*v322 + v325 + 7.0d0*(v323 + v333) + 21.0d0*(v327 + &
      v331) + 35.0d0*(v328 + v329)) + L_xx + L_xxxxxxxxx*v316 + v0*v206 &
      + v11*v326 + v141*v335 + v226*v336 + v315 + v330*v43 + v334*v81 + &
      v337*v339
    v437         = L_xyzzzzzzz*v324
    v475         = v437 + 2520.0d0*v432 + 840.0d0*v433 + 210.0d0*v434 + 42.0d0*v435 + 7.0d0 &
      *(720.0d0*L_xy + 720.0d0*v430 + v436)
    Ls_xy        = 0.000198412698412698d0*(v431 + 2520.0d0*v432 + 840.0d0*v433 + 210.0d0* &
      v434 + 42.0d0*v435 + v437 + 7.0d0*(v436 + v443) + 21.0d0*(v438 + &
      v441) + 35.0d0*(v439 + v440)) + L_xxxxxxxxy*v316 + L_xy + v114* &
      v334 + v13*v326 + v194*v335 + v2*v206 + v303*v336 + v330*v60 + &
      v337*v444 + v430
    v484         = L_xzzzzzzzz*v324
    Ls_xz        = 0.000198412698412698d0*(v483 + v484 + 7.0d0*v490 + 21.0d0*(v485 + v488) &
      + 35.0d0*(v486 + v487)) + L_xxxxxxxxz*v316 + L_xz + L_xzzz*v460 + &
      L_xzzzz*v461 + L_xzzzzz*v462 + L_xzzzzzz*v463 + L_xzzzzzzz*v464 + &
      v150*v334 + v206*v24 + v237*v335 + v326*v357 + v330*v88 + v336* &
      v352 + v337*v491 + v482
    v535         = L_yyzzzzzzz*v324
    Ls_yy        = 0.000198412698412698d0*v535 + L_xxxxxxxyy*v316 + L_yy + L_yyyyyyyyy*v467 &
      + L_yyzz*v460 + L_yyzzz*v461 + L_yyzzzz*v462 + L_yyzzzzz*v463 + &
      L_yyzzzzzz*v464 + v101*v330 + v15*v326 + v176*v334 + v206*v4 + &
      v281*v335 + v336*v418 + v337*(v13*v338 + v407 + 15.0d0*v413 + &
      20.0d0*v414 + 15.0d0*v415 + 6.0d0*v417 + v442) + v498*v536 + v506 &
      *v537 + v517*v538 + v530*v539 + v534 + v540*v545
    v555         = L_yzzzzzzzz*v324
    Ls_yz        = 0.000198412698412698d0*v555 + L_xxxxxxxyz*v316 + L_yyyyyyyyz*v467 + L_yz &
      + L_yzzz*v460 + L_yzzzz*v461 + L_yzzzzz*v462 + L_yzzzzzz*v463 + &
      L_yzzzzzzz*v464 + v121*v330 + v203*v334 + v206*v30 + v314*v335 + &
      v326*v494 + v336*v457 + v337*(v338*v357 + v446 + 15.0d0*v452 + &
      20.0d0*v453 + 15.0d0*v454 + 6.0d0*v456 + v489) + v509*v536 + v520 &
      *v537 + v533*v538 + v539*v548 + v540*v556 + v554
    c8           = c4*c4
    v466         = 2.48015873015873d-5*c8
    Ls_x         = L_x + L_xxxxxxxxx*v458 + L_xyyyyyyyy*v459 + L_xz*z + L_xzz*v460 + L_xzzz &
      *v461 + L_xzzzz*v462 + L_xzzzzz*v463 + L_xzzzzzz*v464 + &
      L_xzzzzzzz*v465 + L_xzzzzzzzz*v466 + v0*v316 + v13*v467 + v141* &
      v477 + v226*v478 + v339*v479 + v363*v468 + v376*v469 + v394*v470 &
      + v416*v472 + v43*v471 + v442*v473 + v474*v475 + v476*v81 + v480* &
      (5040.0d0*L_xx + v11*v481 + 5040.0d0*v315 + v318 + 2520.0d0*v319 &
      + 840.0d0*v320 + 210.0d0*v321 + 42.0d0*v322 + 7.0d0*v323 + v325 + &
      21.0d0*v327 + 35.0d0*v328 + 35.0d0*v329 + 21.0d0*v331 + 7.0d0* &
      v333)
    Ls_y         = L_y + L_xxxxxxxxy*v458 + L_yyyyyyyyy*v459 + L_yz*z + L_yzz*v460 + L_yzzz &
      *v461 + L_yzzzz*v462 + L_yzzzzz*v463 + L_yzzzzzz*v464 + &
      L_yzzzzzzz*v465 + L_yzzzzzzzz*v466 + v114*v476 + v15*v467 + v194* &
      v477 + v2*v316 + v303*v478 + v444*v479 + v468*v498 + v469*v506 + &
      v470*v517 + v471*v60 + v472*v530 + v473*v545 + v474*(5040.0d0* &
      L_yy + L_yyzz*v549 + L_yyzzz*v550 + L_yyzzzz*v551 + L_yyzzzzz* &
      v552 + L_yyzzzzzz*v553 + 5040.0d0*v534 + v535) + v480*(v13*v481 + &
      v431 + 21.0d0*v438 + 35.0d0*v439 + 35.0d0*v440 + 21.0d0*v441 + &
      7.0d0*v443 + v475)
    Ls_z         = L_z + L_xxxxxxxxz*v458 + L_yyyyyyyyz*v459 + L_zz*z + L_zzz*v460 + L_zzzz &
      *v461 + L_zzzzz*v462 + L_zzzzzz*v463 + L_zzzzzzz*v464 + &
      L_zzzzzzzz*v465 + L_zzzzzzzzz*v466 + v150*v476 + v237*v477 + v24* &
      v316 + v352*v478 + v467*v494 + v468*v509 + v469*v520 + v470*v533 &
      + v471*v88 + v472*v548 + v473*v556 + v474*(5040.0d0*L_yz + L_yzzz &
      *v549 + L_yzzzz*v550 + L_yzzzzz*v551 + L_yzzzzzz*v552 + &
      L_yzzzzzzz*v553 + 5040.0d0*v554 + v555) + v479*v491 + v480*( &
      5040.0d0*L_xz + L_xzzz*v549 + L_xzzzz*v550 + L_xzzzzz*v551 + &
      L_xzzzzzz*v552 + L_xzzzzzzz*v553 + v357*v481 + 5040.0d0*v482 + &
      v483 + v484 + 21.0d0*v485 + 35.0d0*v486 + 35.0d0*v487 + 21.0d0* &
      v488 + 7.0d0*v490)
#undef  y                   
#undef  L_x                 
#undef  x                   
#undef  z                   
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
#undef  Ls_xxxxxxxx         
#undef  L_xxxxxxxx          
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
#undef  Ls_xxxxxxxxx        
#undef  L_xxxxxxxxx         
#undef  Ls_xxxxxxxxy        
#undef  L_xxxxxxxxy         
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
#undef  L_xxyyyyyyy         
#undef  Ls_xxyyyyyyy        
#undef  L_xxyyyyyyz         
#undef  Ls_xxyyyyyyz        
#undef  Ls_xyyyyyyyy        
#undef  L_xyyyyyyyy         
#undef  Ls_xyyyyyyyz        
#undef  L_xyyyyyyyz         
#undef  Ls_yyyyyyyyy        
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
#undef  Ls_yyyyyyyyz        
    end subroutine mom_es_L2L
    
! OPS  410*ADD + 2*DIV + 573*MUL + 120*NEG + POW = 1106  (2101 before optimization)
subroutine mom_es_L2P(L, r, Phi)
    real(dp), intent(in)  :: L(0:MOM_ES_L_END)
    real(dp), intent(in)  :: r(1:3)
    real(dp), intent(out) :: Phi(0:MOM_ES_PHI_END)
    real(dp) :: a1, a2, a3, a4, a5, a6, a7, a8, a9, b1, b2, b3, b4, b5, b6,&
                b7, b8, b9, c1, c2, c3, c4, c5, c6, c7, c8, c9, u10, u11, u12,&
                u13, u14, u15, u16, u17, u18, u19, u2, u3, u4, u5, u6, u7, u8,&
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v11, v12,&
                v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22, v23,&
                v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34,&
                v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45,&
                v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz,&
                L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz,&
                L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz,&
                L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz,&
                L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz,&
                L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz, L_xxxyyzz,&
                L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz, L_xxyzzzz,&
                L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz, L_xyzzzzz,&
                L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz, L_yyzzzzz,&
                L_yzzzzzz, L_zzzzzzz, L_xxxxxxzz, L_xxxxxyzz, L_xxxxxzzz,&
                L_xxxxyyzz, L_xxxxyzzz, L_xxxxzzzz, L_xxxyyyzz, L_xxxyyzzz,&
                L_xxxyzzzz, L_xxxzzzzz, L_xxyyyyzz, L_xxyyyzzz, L_xxyyzzzz,&
                L_xxyzzzzz, L_xxzzzzzz, L_xyyyyyzz, L_xyyyyzzz, L_xyyyzzzz,&
                L_xyyzzzzz, L_xyzzzzzz, L_xzzzzzzz, L_yyyyyyzz, L_yyyyyzzz,&
                L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz,&
                L_xxxxxxxzz, L_xxxxxxyzz, L_xxxxxxzzz, L_xxxxxyyzz,&
                L_xxxxxyzzz, L_xxxxxzzzz, L_xxxxyyyzz, L_xxxxyyzzz,&
                L_xxxxyzzzz, L_xxxxzzzzz, L_xxxyyyyzz, L_xxxyyyzzz,&
                L_xxxyyzzzz, L_xxxyzzzzz, L_xxxzzzzzz, L_xxyyyyyzz,&
                L_xxyyyyzzz, L_xxyyyzzzz, L_xxyyzzzzz, L_xxyzzzzzz,&
                L_xxzzzzzzz, L_xyyyyyyzz, L_xyyyyyzzz, L_xyyyyzzzz,&
                L_xyyyzzzzz, L_xyyzzzzzz, L_xyzzzzzzz, L_xzzzzzzzz,&
                L_yyyyyyyzz, L_yyyyyyzzz, L_yyyyyzzzz, L_yyyyzzzzz,&
                L_yyyzzzzzz, L_yyzzzzzzz, L_yzzzzzzzz, L_zzzzzzzzz
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
#define L_xxxxxxxxx          L(80)
#define L_xxxxxxxxy          L(81)
#define L_xxxxxxxxz          L(82)
#define L_xxxxxxxyy          L(83)
#define L_xxxxxxxyz          L(84)
#define L_xxxxxxyyy          L(85)
#define L_xxxxxxyyz          L(86)
#define L_xxxxxyyyy          L(87)
#define L_xxxxxyyyz          L(88)
#define L_xxxxyyyyy          L(89)
#define L_xxxxyyyyz          L(90)
#define L_xxxyyyyyy          L(91)
#define L_xxxyyyyyz          L(92)
#define L_xxyyyyyyy          L(93)
#define L_xxyyyyyyz          L(94)
#define L_xyyyyyyyy          L(95)
#define L_xyyyyyyyz          L(96)
#define L_yyyyyyyyy          L(97)
#define L_yyyyyyyyz          L(98)
    v17         = L_xyyyyyyy + L_xyyyyyyyz*z
    v21         = 2.0d0*z
    v25         = 6.0d0*z
    v30         = 24.0d0*z
    v36         = 2.0d0*y
    v37         = L_xxxxxxxy + L_xxxxxxxyz*z
    v40         = 120.0d0*z
    v46         = 720.0d0*z
    v52         = 0.000198412698412698d0*y
    v53         = 5040.0d0*z
    v62         = L_xxxxxxyy + L_xxxxxxyyz*z
    v63         = 3.0d0*y
    v67         = L_xxxxxyyy + L_xxxxxyyyz*z
    v70         = 4.0d0*y
    v74         = L_xxxxyyyy + L_xxxxyyyyz*z
    v79         = 5.0d0*y
    v84         = L_xxxyyyyy + L_xxxyyyyyz*z
    v91         = 6.0d0*y
    v93         = 0.000198412698412698d0*x
    v95         = L_xxyyyyyy + L_xxyyyyyyz*z
    v104        = 7.0d0*y
    L_zz        = -(L_xx + L_yy)
    L_xzz       = -(L_xxx + L_xyy)
    L_yzz       = -(L_xxy + L_yyy)
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
    L_xxxxxxyzz = -(L_xxxxxxxxy + L_xxxxxxyyy)
    L_xxxxxxzzz = -(L_xxxxxxxxz + L_xxxxxxyyz)
    L_xxxxxyyzz = -(L_xxxxxxxyy + L_xxxxxyyyy)
    L_xxxxxyzzz = -(L_xxxxxxxyz + L_xxxxxyyyz)
    L_xxxxxzzzz = -(L_xxxxxxxzz + L_xxxxxyyzz)
    L_xxxxyyyzz = -(L_xxxxxxyyy + L_xxxxyyyyy)
    L_xxxxyyzzz = -(L_xxxxxxyyz + L_xxxxyyyyz)
    L_xxxxyzzzz = -(L_xxxxxxyzz + L_xxxxyyyzz)
    L_xxxxzzzzz = -(L_xxxxxxzzz + L_xxxxyyzzz)
    L_xxxyyyyzz = -(L_xxxxxyyyy + L_xxxyyyyyy)
    L_xxxyyyzzz = -(L_xxxxxyyyz + L_xxxyyyyyz)
    L_xxxyyzzzz = -(L_xxxxxyyzz + L_xxxyyyyzz)
    L_xxxyzzzzz = -(L_xxxxxyzzz + L_xxxyyyzzz)
    L_xxxzzzzzz = -(L_xxxxxzzzz + L_xxxyyzzzz)
    L_xxyyyyyzz = -(L_xxxxyyyyy + L_xxyyyyyyy)
    L_xxyyyyzzz = -(L_xxxxyyyyz + L_xxyyyyyyz)
    L_xxyyyzzzz = -(L_xxxxyyyzz + L_xxyyyyyzz)
    L_xxyyzzzzz = -(L_xxxxyyzzz + L_xxyyyyzzz)
    L_xxyzzzzzz = -(L_xxxxyzzzz + L_xxyyyzzzz)
    L_xxzzzzzzz = -(L_xxxxzzzzz + L_xxyyzzzzz)
    L_xyyyyyyzz = -(L_xxxyyyyyy + L_xyyyyyyyy)
    L_xyyyyyzzz = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz = -(L_xxyyyyyyy + L_yyyyyyyyy)
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
    v81         = a2
    v82         = 0.000694444444444444d0*v81
    a3          = a1*a2
    v72         = 0.00138888888888889d0*a3
    a4          = a2*a2
    v65         = 0.00173611111111111d0*a4
    a5          = a2*a3
    v60         = 0.00138888888888889d0*a5
    a6          = a3*a3
    v34         = 0.000694444444444444d0*a6
    a7          = a3*a4
    v18         = 0.000198412698412698d0*a7
    a8          = a4*a4
    v0          = 2.48015873015873d-5*a8
    a9          = a4*a5
    b2          = b1*b1
    v35         = b2
    v45         = 0.000694444444444444d0*v35
    v61         = 3.0d0*v35
    v68         = 6.0d0*v35
    v77         = 10.0d0*v35
    v89         = 15.0d0*v35
    v102        = 21.0d0*v35
    b3          = b1*b2
    v38         = b3
    v39         = 0.00138888888888889d0*v38
    v66         = 4.0d0*v38
    v75         = 10.0d0*v38
    v87         = 20.0d0*v38
    v100        = 35.0d0*v38
    b4          = b2*b2
    v28         = b4
    v29         = 0.00173611111111111d0*v28
    v73         = 5.0d0*v28
    v85         = 15.0d0*v28
    v98         = 35.0d0*v28
    b5          = b2*b3
    v23         = b5
    v24         = 0.00138888888888889d0*v23
    v83         = 6.0d0*v23
    v96         = 21.0d0*v23
    b6          = b3*b3
    v19         = b6
    v20         = 0.000694444444444444d0*v19
    v94         = 7.0d0*v19
    b7          = b3*b4
    v15         = b7
    v16         = 0.000198412698412698d0*v15
    b8          = b4*b4
    v1          = 2.48015873015873d-5*b8
    b9          = b4*b5
    c2          = c1*c1
    v2          = c2
    v3          = 0.5d0*v2
    v26         = 3.0d0*v2
    v31         = 12.0d0*v2
    v41         = 60.0d0*v2
    v47         = 360.0d0*v2
    v54         = 2520.0d0*v2
    v64         = 2.0d0*L_xxxxxxy + L_xxxxxxyz*v21 + L_xxxxxxyzz*v2
    v69         = 2.0d0*L_xxxxxyy + L_xxxxxyyz*v21 + L_xxxxxyyzz*v2
    v76         = 2.0d0*L_xxxxyyy + L_xxxxyyyz*v21 + L_xxxxyyyzz*v2
    v86         = 2.0d0*L_xxxyyyy + L_xxxyyyyz*v21 + L_xxxyyyyzz*v2
    v97         = 2.0d0*L_xxyyyyy + L_xxyyyyyz*v21 + L_xxyyyyyzz*v2
    v22         = 2.0d0*L_xyyyyyy + L_xyyyyyyz*v21 + L_xyyyyyyzz*v2
    h           = v2 + v35 + v81
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
    v4          = c3
    v5          = 0.166666666666667d0*v4
    v32         = 4.0d0*v4
    v42         = 20.0d0*v4
    v48         = 120.0d0*v4
    v55         = 840.0d0*v4
    v71         = 6.0d0*L_xxxxxy + L_xxxxxyz*v25 + L_xxxxxyzz*v26 + L_xxxxxyzzz*v4
    v78         = 6.0d0*L_xxxxyy + L_xxxxyyz*v25 + L_xxxxyyzz*v26 + L_xxxxyyzzz*v4
    v88         = 6.0d0*L_xxxyyy + L_xxxyyyz*v25 + L_xxxyyyzz*v26 + L_xxxyyyzzz*v4
    v99         = 6.0d0*L_xxyyyy + L_xxyyyyz*v25 + L_xxyyyyzz*v26 + L_xxyyyyzzz*v4
    v27         = 6.0d0*L_xyyyyy + L_xyyyyyz*v25 + L_xyyyyyzz*v26 + L_xyyyyyzzz*v4
    c4          = c2*c2
    v6          = c4
    v7          = 0.0416666666666667d0*v6
    v43         = 5.0d0*v6
    v49         = 30.0d0*v6
    v56         = 210.0d0*v6
    v80         = 24.0d0*L_xxxxy + L_xxxxyz*v30 + L_xxxxyzz*v31 + L_xxxxyzzz*v32 + &
      L_xxxxyzzzz*v6
    v90         = 24.0d0*L_xxxyy + L_xxxyyz*v30 + L_xxxyyzz*v31 + L_xxxyyzzz*v32 + &
      L_xxxyyzzzz*v6
    v101        = 24.0d0*L_xxyyy + L_xxyyyz*v30 + L_xxyyyzz*v31 + L_xxyyyzzz*v32 + &
      L_xxyyyzzzz*v6
    v33         = 24.0d0*L_xyyyy + L_xyyyyz*v30 + L_xyyyyzz*v31 + L_xyyyyzzz*v32 + &
      L_xyyyyzzzz*v6
    c5          = c2*c3
    v8          = c5
    v9          = 0.00833333333333333d0*v8
    v50         = 6.0d0*v8
    v57         = 42.0d0*v8
    v92         = 120.0d0*L_xxxy + L_xxxyz*v40 + L_xxxyzz*v41 + L_xxxyzzz*v42 + L_xxxyzzzz &
      *v43 + L_xxxyzzzzz*v8
    v103        = 120.0d0*L_xxyy + L_xxyyz*v40 + L_xxyyzz*v41 + L_xxyyzzz*v42 + L_xxyyzzzz &
      *v43 + L_xxyyzzzzz*v8
    v44         = 120.0d0*L_xyyy + L_xyyyz*v40 + L_xyyyzz*v41 + L_xyyyzzz*v42 + L_xyyyzzzz &
      *v43 + L_xyyyzzzzz*v8
    c6          = c3*c3
    v10         = c6
    v11         = 0.00138888888888889d0*v10
    v58         = 7.0d0*v10
    v105        = 720.0d0*L_xxy + L_xxyz*v46 + L_xxyzz*v47 + L_xxyzzz*v48 + L_xxyzzzz*v49 &
      + L_xxyzzzzz*v50 + L_xxyzzzzzz*v10
    v51         = 720.0d0*L_xyy + L_xyyz*v46 + L_xyyzz*v47 + L_xyyzzz*v48 + L_xyyzzzz*v49 &
      + L_xyyzzzzz*v50 + L_xyyzzzzzz*v10
    c7          = c3*c4
    v12         = c7
    v13         = 0.000198412698412698d0*v12
    v59         = 5040.0d0*L_xy + L_xyz*v53 + L_xyzz*v54 + L_xyzzz*v55 + L_xyzzzz*v56 + &
      L_xyzzzzz*v57 + L_xyzzzzzz*v58 + L_xyzzzzzzz*v12
    c8          = c4*c4
    v14         = 2.48015873015873d-5*c8
    Phi_x       = L_x + L_xxxxxxxxx*v0 + L_xyyyyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v9 + L_xzzzzzz*v11 + L_xzzzzzzz*v13 + &
      L_xzzzzzzzz*v14 + v16*v17 + v18*(L_xxxxxxxx + L_xxxxxxxxy*y + &
      L_xxxxxxxxz*z) + v20*v22 + v24*v27 + v29*v33 + v34*(2.0d0* &
      L_xxxxxxx + L_xxxxxxxyy*v35 + L_xxxxxxxz*v21 + L_xxxxxxxzz*v2 + &
      v36*v37) + v39*v44 + v45*v51 + v52*v59 + v60*(6.0d0*L_xxxxxx + &
      L_xxxxxxyyy*v38 + L_xxxxxxz*v25 + L_xxxxxxzz*v26 + L_xxxxxxzzz*v4 &
      + v61*v62 + v63*v64) + v65*(24.0d0*L_xxxxx + L_xxxxxyyyy*v28 + &
      L_xxxxxz*v30 + L_xxxxxzz*v31 + L_xxxxxzzz*v32 + L_xxxxxzzzz*v6 + &
      v66*v67 + v68*v69 + v70*v71) + v72*(120.0d0*L_xxxx + L_xxxxyyyyy* &
      v23 + L_xxxxz*v40 + L_xxxxzz*v41 + L_xxxxzzz*v42 + L_xxxxzzzz*v43 &
      + L_xxxxzzzzz*v8 + v73*v74 + v75*v76 + v77*v78 + v79*v80) + v82*( &
      720.0d0*L_xxx + L_xxxyyyyyy*v19 + L_xxxz*v46 + L_xxxzz*v47 + &
      L_xxxzzz*v48 + L_xxxzzzz*v49 + L_xxxzzzzz*v50 + L_xxxzzzzzz*v10 + &
      v83*v84 + v85*v86 + v87*v88 + v89*v90 + v91*v92) + v93*(5040.0d0* &
      L_xx + L_xxyyyyyyy*v15 + L_xxz*v53 + L_xxzz*v54 + L_xxzzz*v55 + &
      L_xxzzzz*v56 + L_xxzzzzz*v57 + L_xxzzzzzz*v58 + L_xxzzzzzzz*v12 + &
      v100*v101 + v102*v103 + v104*v105 + v94*v95 + v96*v97 + v98*v99)
    Phi_y       = L_y + L_xxxxxxxxy*v0 + L_yyyyyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v9 + L_yzzzzzz*v11 + L_yzzzzzzz*v13 + &
      L_yzzzzzzzz*v14 + v16*(L_yyyyyyyy + L_yyyyyyyyz*z) + v18*( &
      L_xxxxxxxyy*y + v37) + v20*(2.0d0*L_yyyyyyy + L_yyyyyyyz*v21 + &
      L_yyyyyyyzz*v2) + v24*(6.0d0*L_yyyyyy + L_yyyyyyz*v25 + &
      L_yyyyyyzz*v26 + L_yyyyyyzzz*v4) + v29*(24.0d0*L_yyyyy + L_yyyyyz &
      *v30 + L_yyyyyzz*v31 + L_yyyyyzzz*v32 + L_yyyyyzzzz*v6) + v34*( &
      L_xxxxxxyyy*v35 + v36*v62 + v64) + v39*(120.0d0*L_yyyy + L_yyyyz* &
      v40 + L_yyyyzz*v41 + L_yyyyzzz*v42 + L_yyyyzzzz*v43 + L_yyyyzzzzz &
      *v8) + v45*(720.0d0*L_yyy + L_yyyz*v46 + L_yyyzz*v47 + L_yyyzzz* &
      v48 + L_yyyzzzz*v49 + L_yyyzzzzz*v50 + L_yyyzzzzzz*v10) + v52*( &
      5040.0d0*L_yy + L_yyz*v53 + L_yyzz*v54 + L_yyzzz*v55 + L_yyzzzz* &
      v56 + L_yyzzzzz*v57 + L_yyzzzzzz*v58 + L_yyzzzzzzz*v12) + v60*( &
      L_xxxxxyyyy*v38 + v61*v67 + v63*v69 + v71) + v65*(L_xxxxyyyyy*v28 &
      + v66*v74 + v68*v76 + v70*v78 + v80) + v72*(L_xxxyyyyyy*v23 + v73 &
      *v84 + v75*v86 + v77*v88 + v79*v90 + v92) + v82*(L_xxyyyyyyy*v19 &
      + v101*v89 + v103*v91 + v105 + v83*v95 + v85*v97 + v87*v99) + v93 &
      *(L_xyyyyyyyy*v15 + v100*v33 + v102*v44 + v104*v51 + v17*v94 + &
      v22*v96 + v27*v98 + v59)
    Phi_z       = L_z + L_xxxxxxxxz*v0 + L_yyyyyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v9 + L_zzzzzzz*v11 + L_zzzzzzzz*v13 + &
      L_zzzzzzzzz*v14 + v16*(L_yyyyyyyz + L_yyyyyyyzz*z) + v18*( &
      L_xxxxxxxyz*y + L_xxxxxxxz + L_xxxxxxxzz*z) + v20*(2.0d0* &
      L_yyyyyyz + L_yyyyyyzz*v21 + L_yyyyyyzzz*v2) + v24*(6.0d0* &
      L_yyyyyz + L_yyyyyzz*v25 + L_yyyyyzzz*v26 + L_yyyyyzzzz*v4) + v29 &
      *(24.0d0*L_yyyyz + L_yyyyzz*v30 + L_yyyyzzz*v31 + L_yyyyzzzz*v32 &
      + L_yyyyzzzzz*v6) + v34*(L_xxxxxxyyz*v35 + 2.0d0*L_xxxxxxz + &
      L_xxxxxxzz*v21 + L_xxxxxxzzz*v2 + v36*(L_xxxxxxyz + L_xxxxxxyzz*z &
      )) + v39*(120.0d0*L_yyyz + L_yyyzz*v40 + L_yyyzzz*v41 + L_yyyzzzz &
      *v42 + L_yyyzzzzz*v43 + L_yyyzzzzzz*v8) + v45*(720.0d0*L_yyz + &
      L_yyzz*v46 + L_yyzzz*v47 + L_yyzzzz*v48 + L_yyzzzzz*v49 + &
      L_yyzzzzzz*v50 + L_yyzzzzzzz*v10) + v52*(5040.0d0*L_yz + L_yzz* &
      v53 + L_yzzz*v54 + L_yzzzz*v55 + L_yzzzzz*v56 + L_yzzzzzz*v57 + &
      L_yzzzzzzz*v58 + L_yzzzzzzzz*v12) + v60*(L_xxxxxyyyz*v38 + 6.0d0* &
      L_xxxxxz + L_xxxxxzz*v25 + L_xxxxxzzz*v26 + L_xxxxxzzzz*v4 + v61* &
      (L_xxxxxyyz + L_xxxxxyyzz*z) + v63*(2.0d0*L_xxxxxyz + L_xxxxxyzz* &
      v21 + L_xxxxxyzzz*v2)) + v65*(L_xxxxyyyyz*v28 + 24.0d0*L_xxxxz + &
      L_xxxxzz*v30 + L_xxxxzzz*v31 + L_xxxxzzzz*v32 + L_xxxxzzzzz*v6 + &
      v66*(L_xxxxyyyz + L_xxxxyyyzz*z) + v68*(2.0d0*L_xxxxyyz + &
      L_xxxxyyzz*v21 + L_xxxxyyzzz*v2) + v70*(6.0d0*L_xxxxyz + &
      L_xxxxyzz*v25 + L_xxxxyzzz*v26 + L_xxxxyzzzz*v4)) + v72*( &
      L_xxxyyyyyz*v23 + 120.0d0*L_xxxz + L_xxxzz*v40 + L_xxxzzz*v41 + &
      L_xxxzzzz*v42 + L_xxxzzzzz*v43 + L_xxxzzzzzz*v8 + v73*(L_xxxyyyyz &
      + L_xxxyyyyzz*z) + v75*(2.0d0*L_xxxyyyz + L_xxxyyyzz*v21 + &
      L_xxxyyyzzz*v2) + v77*(6.0d0*L_xxxyyz + L_xxxyyzz*v25 + &
      L_xxxyyzzz*v26 + L_xxxyyzzzz*v4) + v79*(24.0d0*L_xxxyz + L_xxxyzz &
      *v30 + L_xxxyzzz*v31 + L_xxxyzzzz*v32 + L_xxxyzzzzz*v6)) + v82*( &
      L_xxyyyyyyz*v19 + 720.0d0*L_xxz + L_xxzz*v46 + L_xxzzz*v47 + &
      L_xxzzzz*v48 + L_xxzzzzz*v49 + L_xxzzzzzz*v50 + L_xxzzzzzzz*v10 + &
      v83*(L_xxyyyyyz + L_xxyyyyyzz*z) + v85*(2.0d0*L_xxyyyyz + &
      L_xxyyyyzz*v21 + L_xxyyyyzzz*v2) + v87*(6.0d0*L_xxyyyz + &
      L_xxyyyzz*v25 + L_xxyyyzzz*v26 + L_xxyyyzzzz*v4) + v89*(24.0d0* &
      L_xxyyz + L_xxyyzz*v30 + L_xxyyzzz*v31 + L_xxyyzzzz*v32 + &
      L_xxyyzzzzz*v6) + v91*(120.0d0*L_xxyz + L_xxyzz*v40 + L_xxyzzz* &
      v41 + L_xxyzzzz*v42 + L_xxyzzzzz*v43 + L_xxyzzzzzz*v8)) + v93*( &
      L_xyyyyyyyz*v15 + 5040.0d0*L_xz + L_xzz*v53 + L_xzzz*v54 + &
      L_xzzzz*v55 + L_xzzzzz*v56 + L_xzzzzzz*v57 + L_xzzzzzzz*v58 + &
      L_xzzzzzzzz*v12 + v100*(24.0d0*L_xyyyz + L_xyyyzz*v30 + L_xyyyzzz &
      *v31 + L_xyyyzzzz*v32 + L_xyyyzzzzz*v6) + v102*(120.0d0*L_xyyz + &
      L_xyyzz*v40 + L_xyyzzz*v41 + L_xyyzzzz*v42 + L_xyyzzzzz*v43 + &
      L_xyyzzzzzz*v8) + v104*(720.0d0*L_xyz + L_xyzz*v46 + L_xyzzz*v47 &
      + L_xyzzzz*v48 + L_xyzzzzz*v49 + L_xyzzzzzz*v50 + L_xyzzzzzzz*v10 &
      ) + v94*(L_xyyyyyyz + L_xyyyyyyzz*z) + v96*(2.0d0*L_xyyyyyz + &
      L_xyyyyyzz*v21 + L_xyyyyyzzz*v2) + v98*(6.0d0*L_xyyyyz + &
      L_xyyyyzz*v25 + L_xyyyyzzz*v26 + L_xyyyyzzzz*v4))
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
    
! OPS  4393*ADD + 4257*MUL + 175*NEG + 1378*SUB = 10203  (20264 before optimization)
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
                v1143, v1144, v1145, v1146, v1147, v1148, v1149, v115, v1150,&
                v1151, v1152, v1153, v1154, v1155, v1156, v1157, v1158, v1159,&
                v116, v1160, v1161, v1162, v1163, v1164, v1165, v1166, v1167,&
                v1168, v1169, v117, v1170, v1171, v1172, v1173, v1174, v1175,&
                v1176, v1177, v1178, v1179, v118, v1180, v1181, v1182, v1183,&
                v1184, v1185, v1186, v1187, v1188, v1189, v119, v1190, v1191,&
                v1192, v1193, v1194, v1195, v1196, v1197, v1198, v1199, v12,&
                v120, v1200, v1201, v1202, v1203, v1204, v1205, v1206, v1207,&
                v1208, v1209, v121, v1210, v1211, v1212, v1213, v1214, v1215,&
                v1216, v1217, v1218, v1219, v122, v1220, v1221, v1222, v1223,&
                v1224, v1225, v1226, v1227, v1228, v1229, v123, v1230, v1231,&
                v1232, v1233, v1234, v1235, v1236, v1237, v1238, v1239, v124,&
                v1240, v1241, v1242, v1243, v1244, v1245, v1246, v1247, v1248,&
                v1249, v125, v1250, v1251, v1252, v1253, v1254, v1255, v1256,&
                v1257, v1258, v1259, v126, v1260, v1261, v1262, v1263, v1264,&
                v1265, v1266, v1267, v1268, v1269, v127, v1270, v1271, v1272,&
                v1273, v1274, v1275, v1276, v1277, v1278, v1279, v128, v1280,&
                v1281, v1282, v1283, v1284, v1285, v1286, v1287, v1288, v1289,&
                v129, v1290, v1291, v1292, v1293, v1294, v1295, v1296, v1297,&
                v1298, v1299, v13, v130, v1300, v1301, v1302, v1303, v1304,&
                v1305, v1306, v1307, v1308, v1309, v131, v1310, v1311, v1312,&
                v1313, v1314, v1315, v1316, v1317, v1318, v1319, v132, v1320,&
                v1321, v1322, v1323, v1324, v1325, v1326, v1327, v1328, v1329,&
                v133, v1330, v1331, v1332, v1333, v1334, v1335, v1336, v1337,&
                v1338, v1339, v134, v1340, v1341, v1342, v1343, v1344, v1345,&
                v1346, v1347, v1348, v1349, v135, v1350, v1351, v1352, v1353,&
                v1354, v1355, v1356, v1357, v1358, v1359, v136, v1360, v1361,&
                v1362, v1363, v1364, v1365, v1366, v1367, v1368, v1369, v137,&
                v1370, v1371, v1372, v1373, v1374, v1375, v1376, v1377, v1378,&
                v1379, v138, v1380, v1381, v1382, v1383, v1384, v1385, v1386,&
                v1387, v1388, v1389, v139, v1390, v1391, v1392, v1393, v1394,&
                v1395, v1396, v1397, v1398, v1399, v14, v140, v1400, v1401,&
                v1402, v1403, v1404, v1405, v1406, v1407, v1408, v1409, v141,&
                v1410, v1411, v1412, v1413, v1414, v1415, v1416, v1417, v1418,&
                v1419, v142, v1420, v1421, v1422, v1423, v1424, v1425, v1426,&
                v1427, v1428, v1429, v143, v1430, v1431, v1432, v1433, v1434,&
                v1435, v1436, v1437, v1438, v1439, v144, v1440, v1441, v1442,&
                v1443, v1444, v1445, v1446, v1447, v1448, v1449, v145, v1450,&
                v1451, v1452, v1453, v1454, v1455, v1456, v1457, v1458, v1459,&
                v146, v1460, v1461, v1462, v1463, v1464, v1465, v1466, v1467,&
                v1468, v1469, v147, v1470, v1471, v1472, v1473, v1474, v1475,&
                v1476, v1477, v1478, v1479, v148, v1480, v1481, v1482, v1483,&
                v1484, v1485, v1486, v1487, v1488, v1489, v149, v1490, v1491,&
                v1492, v1493, v1494, v1495, v1496, v1497, v1498, v1499, v15,&
                v150, v1500, v1501, v1502, v1503, v1504, v1505, v1506, v1507,&
                v1508, v1509, v151, v1510, v1511, v1512, v1513, v1514, v1515,&
                v1516, v1517, v1518, v1519, v152, v1520, v1521, v1522, v1523,&
                v1524, v1525, v1526, v1527, v1528, v1529, v153, v1530, v1531,&
                v1532, v1533, v1534, v1535, v1536, v1537, v1538, v1539, v154,&
                v1540, v1541, v1542, v1543, v1544, v1545, v1546, v1547, v1548,&
                v1549, v155, v1550, v1551, v1552, v1553, v1554, v1555, v1556,&
                v1557, v1558, v1559, v156, v1560, v1561, v1562, v1563, v1564,&
                v1565, v1566, v1567, v1568, v1569, v157, v1570, v1571, v1572,&
                v1573, v1574, v1575, v1576, v1577, v1578, v1579, v158, v1580,&
                v1581, v1582, v1583, v1584, v1585, v1586, v1587, v1588, v1589,&
                v159, v1590, v1591, v1592, v1593, v1594, v1595, v1596, v1597,&
                v1598, v1599, v16, v160, v1600, v1601, v1602, v1603, v1604,&
                v1605, v1606, v1607, v1608, v1609, v161, v1610, v1611, v1612,&
                v1613, v1614, v1615, v1616, v1617, v1618, v1619, v162, v1620,&
                v1621, v1622, v1623, v1624, v1625, v1626, v1627, v1628, v1629,&
                v163, v1630, v1631, v1632, v1633, v1634, v1635, v1636, v164,&
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
                M_yzzzzzz, M_zzzzzzz, M_xxxxxxzz, M_xxxxxyzz, M_xxxxxzzz,&
                M_xxxxyyzz, M_xxxxyzzz, M_xxxxzzzz, M_xxxyyyzz, M_xxxyyzzz,&
                M_xxxyzzzz, M_xxxzzzzz, M_xxyyyyzz, M_xxyyyzzz, M_xxyyzzzz,&
                M_xxyzzzzz, M_xxzzzzzz, M_xyyyyyzz, M_xyyyyzzz, M_xyyyzzzz,&
                M_xyyzzzzz, M_xyzzzzzz, M_xzzzzzzz, M_yyyyyyzz, M_yyyyyzzz,&
                M_yyyyzzzz, M_yyyzzzzz, M_yyzzzzzz, M_yzzzzzzz, M_zzzzzzzz,&
                S_0, S_x, S_y, S_z, S_xx, S_xy, S_xz, S_yy, S_yz, S_zz, S_xxx,&
                S_xxy, S_xxz, S_xyy, S_xyz, S_xzz, S_yyy, S_yyz, S_yzz, S_zzz,&
                S_xxxx, S_xxxy, S_xxxz, S_xxyy, S_xxyz, S_xxzz, S_xyyy,&
                S_xyyz, S_xyzz, S_xzzz, S_yyyy, S_yyyz, S_yyzz, S_yzzz,&
                S_zzzz, S_xxxxx, S_xxxxy, S_xxxxz, S_xxxyy, S_xxxyz, S_xxxzz,&
                S_xxyyy, S_xxyyz, S_xxyzz, S_xxzzz, S_xyyyy, S_xyyyz, S_xyyzz,&
                S_xyzzz, S_xzzzz, S_yyyyy, S_yyyyz, S_yyyzz, S_yyzzz, S_yzzzz,&
                S_zzzzz, S_xxxxxx, S_xxxxxy, S_xxxxxz, S_xxxxyy, S_xxxxyz,&
                S_xxxxzz, S_xxxyyy, S_xxxyyz, S_xxxyzz, S_xxxzzz, S_xxyyyy,&
                S_xxyyyz, S_xxyyzz, S_xxyzzz, S_xxzzzz, S_xyyyyy, S_xyyyyz,&
                S_xyyyzz, S_xyyzzz, S_xyzzzz, S_xzzzzz, S_yyyyyy, S_yyyyyz,&
                S_yyyyzz, S_yyyzzz, S_yyzzzz, S_yzzzzz, S_zzzzzz, S_xxxxxxx,&
                S_xxxxxxy, S_xxxxxxz, S_xxxxxyy, S_xxxxxyz, S_xxxxyyy,&
                S_xxxxyyz, S_xxxyyyy, S_xxxyyyz, S_xxyyyyy, S_xxyyyyz,&
                S_xyyyyyy, S_xyyyyyz, S_yyyyyyy, S_yyyyyyz, S_xxxxxxxx,&
                S_xxxxxxxy, S_xxxxxxxz, S_xxxxxxyy, S_xxxxxxyz, S_xxxxxyyy,&
                S_xxxxxyyz, S_xxxxyyyy, S_xxxxyyyz, S_xxxyyyyy, S_xxxyyyyz,&
                S_xxyyyyyy, S_xxyyyyyz, S_xyyyyyyy, S_xyyyyyyz, S_yyyyyyyy,&
                S_yyyyyyyz
#define M_0                  M(0)
#define Ms_0                 Ms(0)
#define z                    r(3)
#define y                    r(2)
#define x                    r(1)
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
#define M_xyy                M(9)
#define Ms_xyy               Ms(9)
#define M_xyz                M(10)
#define Ms_xyz               Ms(10)
#define Ms_yyy               Ms(11)
#define M_yyy                M(11)
#define M_yyz                M(12)
#define Ms_yyz               Ms(12)
#define Ms_xxxx              Ms(13)
#define M_xxxx               M(13)
#define Ms_xxxy              Ms(14)
#define M_xxxy               M(14)
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
#define Ms_yyyy              Ms(20)
#define M_yyyy               M(20)
#define Ms_yyyz              Ms(21)
#define M_yyyz               M(21)
#define Ms_xxxxx             Ms(22)
#define M_xxxxx              M(22)
#define Ms_xxxxy             Ms(23)
#define M_xxxxy              M(23)
#define Ms_xxxxz             Ms(24)
#define M_xxxxz              M(24)
#define M_xxxyy              M(25)
#define Ms_xxxyy             Ms(25)
#define Ms_xxxyz             Ms(26)
#define M_xxxyz              M(26)
#define M_xxyyy              M(27)
#define Ms_xxyyy             Ms(27)
#define M_xxyyz              M(28)
#define Ms_xxyyz             Ms(28)
#define Ms_xyyyy             Ms(29)
#define M_xyyyy              M(29)
#define M_xyyyz              M(30)
#define Ms_xyyyz             Ms(30)
#define Ms_yyyyy             Ms(31)
#define M_yyyyy              M(31)
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
#define Ms_xxyyyz            Ms(41)
#define M_xxyyyz             M(41)
#define M_xyyyyy             M(42)
#define Ms_xyyyyy            Ms(42)
#define Ms_xyyyyz            Ms(43)
#define M_xyyyyz             M(43)
#define Ms_yyyyyy            Ms(44)
#define M_yyyyyy             M(44)
#define M_yyyyyz             M(45)
#define Ms_yyyyyz            Ms(45)
#define M_xxxxxxx            M(46)
#define Ms_xxxxxxx           Ms(46)
#define Ms_xxxxxxy           Ms(47)
#define M_xxxxxxy            M(47)
#define M_xxxxxxz            M(48)
#define Ms_xxxxxxz           Ms(48)
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
#define M_xxyyyyz            M(56)
#define Ms_xxyyyyz           Ms(56)
#define M_xyyyyyy            M(57)
#define Ms_xyyyyyy           Ms(57)
#define M_xyyyyyz            M(58)
#define Ms_xyyyyyz           Ms(58)
#define M_yyyyyyy            M(59)
#define Ms_yyyyyyy           Ms(59)
#define Ms_yyyyyyz           Ms(60)
#define M_yyyyyyz            M(60)
#define M_xxxxxxxx           M(61)
#define Ms_xxxxxxxx          Ms(61)
#define M_xxxxxxxy           M(62)
#define Ms_xxxxxxxy          Ms(62)
#define Ms_xxxxxxxz          Ms(63)
#define M_xxxxxxxz           M(63)
#define Ms_xxxxxxyy          Ms(64)
#define M_xxxxxxyy           M(64)
#define M_xxxxxxyz           M(65)
#define Ms_xxxxxxyz          Ms(65)
#define M_xxxxxyyy           M(66)
#define Ms_xxxxxyyy          Ms(66)
#define Ms_xxxxxyyz          Ms(67)
#define M_xxxxxyyz           M(67)
#define M_xxxxyyyy           M(68)
#define Ms_xxxxyyyy          Ms(68)
#define Ms_xxxxyyyz          Ms(69)
#define M_xxxxyyyz           M(69)
#define M_xxxyyyyy           M(70)
#define Ms_xxxyyyyy          Ms(70)
#define M_xxxyyyyz           M(71)
#define Ms_xxxyyyyz          Ms(71)
#define M_xxyyyyyy           M(72)
#define Ms_xxyyyyyy          Ms(72)
#define M_xxyyyyyz           M(73)
#define Ms_xxyyyyyz          Ms(73)
#define M_xyyyyyyy           M(74)
#define Ms_xyyyyyyy          Ms(74)
#define M_xyyyyyyz           M(75)
#define Ms_xyyyyyyz          Ms(75)
#define Ms_yyyyyyyy          Ms(76)
#define M_yyyyyyyy           M(76)
#define Ms_yyyyyyyz          Ms(77)
#define M_yyyyyyyz           M(77)
    v6          = x*y
    v7          = x*z
    v8          = y*z
    v9          = v6*z
    v17         = M_xx*x
    v18         = M_xy*y
    v19         = M_xz*z
    v23         = M_xy*x
    v24         = M_yy*y
    v25         = M_yz*z
    v26         = M_xx*z
    v27         = M_xz*x
    v28         = M_yy*z
    v29         = M_yz*y
    v40         = M_xxx*x
    v41         = 1.71428571428571d0*y
    v42         = M_xxy*v41
    v43         = M_xxz*z
    v49         = 0.857142857142857d0*M_xyz
    v52         = M_xxy*x
    v55         = M_xyy*y
    v57         = 3.0d0*M_xx
    v58         = M_xxx*z
    v59         = M_xxz*x
    v61         = M_xyy*z
    v62         = 3.0d0*M_xz
    v68         = 1.71428571428571d0*x
    v69         = M_xyy*v68
    v70         = M_yyy*y
    v71         = M_yyz*z
    v74         = M_xxy*z
    v77         = M_yyy*z
    v78         = M_yyz*y
    v84         = 3.0d0*M_yz
    v90         = M_xxxx*x
    v91         = M_xxxy*y
    v92         = M_xxxz*z
    v94         = M_xxyy*x
    v104        = M_yyyy*x
    v116        = M_xxxx*y
    v117        = M_xxxy*x
    v120        = M_xxyy*y
    v121        = M_xxyz*z
    v132        = M_yyyy*y
    v136        = M_xxyy*z
    v145        = M_xxxx*z
    v146        = M_xxxz*x
    v148        = M_xxyz*y
    v157        = M_yyyy*z
    v165        = M_xyyy*y
    v166        = M_xyyz*z
    v171        = M_xxxy*z
    v173        = M_xxyz*x
    v177        = M_xyyy*z
    v178        = M_xyyz*y
    v179        = 3.0d0*M_xyz
    v185        = M_xyyy*x
    v186        = M_yyyz*z
    v187        = M_xyyz*x
    v188        = M_yyyz*y
    v195        = M_xxyyz*z
    v197        = 0.12987012987013d0*z
    v210        = M_xxxxx*x
    v211        = M_xxxxy*y
    v212        = M_xxxxz*z
    v214        = M_xxxyy*x
    v221        = M_xxyyy*y
    v230        = M_xyyyy*x
    v242        = M_yyyyy*y
    v269        = M_xxxxx*y
    v270        = M_xxxxy*x
    v273        = M_xxxyy*y
    v274        = 1.81818181818182d0*M_xxxyz
    v277        = M_xxyyy*x
    v285        = M_xyyyy*y
    v294        = M_yyyyy*x
    v300        = 10.0d0*M_xxx
    v303        = M_xxxxx*z
    v304        = M_xxxxz*x
    v306        = M_xxxyy*z
    v307        = v274*y
    v314        = M_xxyyz*x
    v324        = M_xyyyy*z
    v328        = 5.45454545454545d0*M_xyz
    v340        = M_yyyyz*x
    v362        = 0.025974025974026d0*z
    v376        = M_xxxxy*z
    v377        = M_xxxxz*y
    v379        = M_xxxyz*x
    v384        = M_xxyyy*z
    v385        = M_xxyyz*y
    v401        = M_yyyyy*z
    v402        = M_yyyyz*y
    v411        = 0.545454545454545d0*z
    v417        = M_xyyyz*y
    v422        = M_yyyyz*z
    v424        = 1.81818181818182d0*M_xyyyz
    v425        = v424*x
    v447        = M_xxxxxx*x
    v448        = M_xxxxxy*y
    v449        = M_xxxxxz*z
    v451        = M_xxxxyy*x
    v458        = M_xxxyyy*y
    v459        = M_xxxyyz*z
    v495        = M_xyyyyy*y
    v496        = M_xyyyyz*z
    v519        = M_yyyyyy*x
    v555        = M_xxxxxx*y
    v556        = M_xxxxxy*x
    v559        = M_xxxxyy*y
    v560        = M_xxxxyz*z
    v566        = M_xxxyyy*x
    v580        = M_xxyyyz*z
    v600        = M_xyyyyy*x
    v621        = M_yyyyyy*y
    v622        = M_yyyyyz*z
    v653        = M_xxxxxx*z
    v654        = M_xxxxxz*x
    v656        = M_xxxxyy*z
    v657        = 0.559440559440559d0*v656
    v658        = M_xxxxyz*y
    v664        = M_xxxyyz*x
    v675        = M_xxyyyy*z
    v676        = M_xxyyyz*y
    v699        = M_xyyyyz*x
    v720        = M_yyyyyy*z
    v754        = M_xxyyyy*x
    v764        = M_xxxyyy*z
    v799        = M_xxxxxy*z
    v800        = M_xxxxxz*y
    v802        = M_xxxxyz*x
    v806        = M_xxxyyz*y
    v813        = M_xxyyyz*x
    v822        = M_xyyyyy*z
    v823        = M_xyyyyz*y
    v835        = M_yyyyyz*x
    v852        = M_xxyyyy*y
    v858        = 0.0163170163170163d0*z
    v860        = 0.909090909090909d0*M_xxxxyyz
    v866        = 0.559440559440559d0*v675
    v875        = 0.909090909090909d0*M_xxyyyyz
    v877        = M_yyyyyz*y
    v934        = M_xxxxxxx*x
    v935        = M_xxxxxxy*y
    v936        = M_xxxxxxz*z
    v938        = M_xxxxxyy*x
    v945        = M_xxxxyyy*y
    v946        = M_xxxxyyz*z
    v956        = M_xxxyyyy*x
    v977        = M_xxyyyyy*y
    v978        = M_xxyyyyz*z
    v1013       = M_xyyyyyy*x
    v1047       = M_yyyyyyy*y
    v1048       = M_yyyyyyz*z
    v1080       = M_xxxyyyz*z
    v1127       = M_xxxxxxx*y
    v1128       = M_xxxxxxy*x
    v1131       = M_xxxxxyy*y
    v1132       = M_xxxxxyz*z
    v1138       = M_xxxxyyy*x
    v1152       = M_xxxyyyy*y
    v1200       = M_xyyyyyy*y
    v1201       = M_xyyyyyz*z
    v1231       = M_yyyyyyy*x
    v1246       = 1.02797202797203d0*x
    v1262       = M_xxxxxxx*z
    v1263       = M_xxxxxxz*x
    v1265       = M_xxxxxyy*z
    v1266       = M_xxxxxyz*y
    v1272       = M_xxxxyyz*x
    v1283       = M_xxxyyyy*z
    v1284       = M_xxxyyyz*y
    v1342       = M_xyyyyyy*z
    v1343       = M_xyyyyyz*y
    v1386       = M_yyyyyyz*x
    v1448       = M_xxxxxxy*z
    v1449       = M_xxxxxxz*y
    v1451       = M_xxxxxyz*x
    v1456       = M_xxxxyyy*z
    v1457       = M_xxxxyyz*y
    v1469       = M_xxxyyyz*x
    v1489       = M_xxyyyyy*z
    v1490       = M_xxyyyyz*y
    v1523       = M_xyyyyyz*x
    v1556       = M_yyyyyyy*z
    v1557       = M_yyyyyyz*y
    v1594       = M_xxyyyyy*x
    v1599       = M_xxyyyyz*x
    v1614       = 1.02797202797203d0*y
    Ms_0        = Ms_0 + (M_0)
    M_zz        = -(M_xx + M_yy)
    M_xzz       = -(M_xxx + M_xyy)
    M_yzz       = -(M_xxy + M_yyy)
    M_zzz       = -(M_xxz + M_yyz)
    M_xxzz      = -(M_xxxx + M_xxyy)
    v96         = M_xxzz*x
    v110        = M_xxzz*y
    v137        = M_xxzz*z
    M_xyzz      = -(M_xxxy + M_xyyy)
    M_xzzz      = -(M_xxxz + M_xyyz)
    M_yyzz      = -(M_xxyy + M_yyyy)
    v105        = M_yyzz*x
    v111        = M_yyzz*y
    v140        = M_yyzz*z
    M_yzzz      = -(M_xxyz + M_yyyz)
    M_zzzz      = -(M_xxzz + M_yyzz)
    M_xxxzz     = -(M_xxxxx + M_xxxyy)
    v216        = M_xxxzz*x
    v251        = M_xxxzz*y
    v310        = M_xxxzz*z
    M_xxyzz     = -(M_xxxxy + M_xxyyy)
    v223        = M_xxyzz*y
    v254        = M_xxyzz*x
    v363        = M_xxyzz*z
    M_xxzzz     = -(M_xxxxz + M_xxyyz)
    v319        = M_xxzzz*x
    v365        = M_xxzzz*y
    M_xyyzz     = -(M_xxxyy + M_xyyyy)
    v1616       = M_xxxzz + M_xyyzz
    v163        = -0.0476190476190476d0*(M_xxxxx + v105 + v1616 + v96)
    v231        = M_xyyzz*x
    v260        = M_xyyzz*y
    v327        = M_xyyzz*z
    M_xyzzz     = -(M_xxxyz + M_xyyyz)
    M_xzzzz     = -v1616
    M_yyyzz     = -(M_xxyyy + M_yyyyy)
    v1617       = M_xxyzz + M_yyyzz
    v112        = -0.0476190476190476d0*(M_yyyyy + v110 + v111 + v1617)
    v243        = M_yyyzz*y
    v262        = M_yyyzz*x
    v366        = M_yyyzz*z
    M_yyzzz     = -(M_xxyyz + M_yyyyz)
    v0          = M_xxzzz + M_yyzzz
    v344        = M_yyzzz*x
    v368        = M_yyzzz*y
    M_yzzzz     = -v1617
    M_zzzzz     = -v0
    M_xxxxzz    = -(M_xxxxxx + M_xxxxyy)
    v453        = M_xxxxzz*x
    v562        = M_xxxxzz*y
    v661        = M_xxxxzz*z
    v864        = 0.174825174825175d0*v661
    M_xxxyzz    = -(M_xxxxxy + M_xxxyyy)
    v461        = M_xxxyzz*y
    v568        = M_xxxyzz*x
    v766        = M_xxxyzz*z
    M_xxxzzz    = -(M_xxxxxz + M_xxxyyz)
    v466        = M_xxxzzz*z
    v669        = M_xxxzzz*x
    v768        = M_xxxzzz*y
    M_xxyyzz    = -(M_xxxxyy + M_xxyyyy)
    v532        = M_xxyyzz*y
    v679        = M_xxyyzz*z
    v680        = -1.22377622377622d0*v679
    v750        = M_xxyyzz*x
    M_xxyzzz    = -(M_xxxxyz + M_xxyyyz)
    v533        = M_xxyzzz*z
    v772        = M_xxyzzz*x
    v876        = M_xxyzzz*y
    M_xxzzzz    = -(M_xxxxzz + M_xxyyzz)
    v480        = M_xxzzzz*x
    v535        = M_xxzzzz*y
    M_xyyyzz    = -(M_xxxyyy + M_xyyyyy)
    v497        = M_xyyyzz*y
    v601        = M_xyyyzz*x
    v779        = M_xyyyzz*z
    M_xyyzzz    = -(M_xxxyyz + M_xyyyyz)
    v1618       = M_xxxzzz + M_xyyzzz
    v1          = v1618
    v502        = M_xyyzzz*z
    v703        = M_xyyzzz*x
    v781        = M_xyyzzz*y
    v879        = x*(M_xxxxxz + v1)
    M_xyzzzz    = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz    = -v1
    M_yyyyzz    = -(M_xxyyyy + M_yyyyyy)
    v521        = M_yyyyzz*x
    v722        = M_yyyyzz*z
    v723        = 0.174825174825175d0*v722
    v874        = M_yyyyzz*y
    M_yyyzzz    = -(M_xxyyyz + M_yyyyyz)
    v1619       = M_xxyzzz + M_yyyzzz
    v2          = v1619
    v536        = M_yyyzzz*z
    v745        = y*(M_yyyyyz + v2)
    v789        = M_yyyzzz*x
    v878        = M_yyyzzz*y
    M_yyzzzz    = -(M_xxyyzz + M_yyyyzz)
    v1620       = M_xxzzzz + M_yyzzzz
    v3          = v1620
    v528        = M_yyzzzz*x
    v538        = M_yyzzzz*y
    v744        = 0.0815850815850816d0*v3*z
    M_yzzzzz    = -v2
    M_zzzzzz    = -v3
    M_xxxxxzz   = -(M_xxxxxxx + M_xxxxxyy)
    v752        = 0.034965034965035d0*M_xxxxxzz
    v940        = M_xxxxxzz*x
    v1134       = M_xxxxxzz*y
    v1269       = M_xxxxxzz*z
    M_xxxxyzz   = -(M_xxxxxxy + M_xxxxyyy)
    v542        = 0.27972027972028d0*M_xxxxyzz
    v888        = M_xxxxyzz*y
    v1140       = M_xxxxyzz*x
    v1460       = M_xxxxyzz*z
    M_xxxxzzz   = -(M_xxxxxxz + M_xxxxyyz)
    v861        = 0.034965034965035d0*M_xxxxzzz
    v952        = M_xxxxzzz*z
    v1277       = M_xxxxzzz*x
    v1464       = M_xxxxzzz*y
    M_xxxyyzz   = -(M_xxxxxyy + M_xxxyyyy)
    v432        = -0.244755244755245d0*M_xxxyyzz
    v753        = -0.104895104895105d0*M_xxxyyzz
    v958        = M_xxxyyzz*x
    v1154       = M_xxxyyzz*y
    v1287       = M_xxxyyzz*z
    M_xxxyzzz   = -(M_xxxxxyz + M_xxxyyyz)
    v1081       = M_xxxyzzz*z
    v1291       = M_xxxyzzz*y
    v1474       = M_xxxyzzz*x
    M_xxxzzzz   = -(M_xxxxxzz + M_xxxyyzz)
    v965        = M_xxxzzzz*x
    v1084       = M_xxxzzzz*y
    v1301       = M_xxxzzzz*z
    M_xxyyyzz   = -(M_xxxxyyy + M_xxyyyyy)
    v543        = -0.244755244755245d0*M_xxyyyzz
    v849        = -0.104895104895105d0*M_xxyyyzz
    v980        = M_xxyyyzz*y
    v1493       = M_xxyyyzz*z
    v1595       = M_xxyyyzz*x
    M_xxyyzzz   = -(M_xxxxyyz + M_xxyyyyz)
    v639        = -0.244755244755245d0*M_xxyyzzz
    v895        = M_xxyyzzz*z
    v1426       = M_xxyyzzz*y
    v1597       = M_xxyyzzz*x
    M_xxyzzzz   = -(M_xxxxyzz + M_xxyyyzz)
    v990        = M_xxyzzzz*y
    v1089       = M_xxyzzzz*x
    v1427       = M_xxyzzzz*z
    M_xxzzzzz   = -(M_xxxxzzz + M_xxyyzzz)
    v640        = 0.0116550116550117d0*M_xxzzzzz
    v899        = M_xxzzzzz*z
    v1326       = M_xxzzzzz*x
    v1429       = M_xxzzzzz*y
    M_xyyyyzz   = -(M_xxxyyyy + M_xyyyyyy)
    v881        = 0.27972027972028d0*M_xyyyyzz
    v904        = M_xyyyyzz*x
    v1203       = M_xyyyyzz*y
    v1346       = M_xyyyyzz*z
    M_xyyyzzz   = -(M_xxxyyyz + M_xyyyyyz)
    v1095       = M_xyyyzzz*z
    v1350       = M_xyyyzzz*y
    v1528       = M_xyyyzzz*x
    M_xyyzzzz   = -(M_xxxyyzz + M_xyyyyzz)
    v1621       = M_xxxzzzz + M_xyyzzzz
    v4          = v1621
    v1020       = M_xyyzzzz*x
    v1098       = M_xyyzzzz*y
    v1360       = M_xyyzzzz*z
    v1423       = v4*x
    M_xyzzzzz   = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz   = -v4
    M_yyyyyzz   = -(M_xxyyyyy + M_yyyyyyy)
    v544        = 0.034965034965035d0*M_yyyyyzz
    v1050       = M_yyyyyzz*y
    v1233       = M_yyyyyzz*x
    v1560       = M_yyyyyzz*z
    M_yyyyzzz   = -(M_xxyyyyz + M_yyyyyyz)
    v641        = 0.034965034965035d0*M_yyyyzzz
    v1055       = M_yyyyzzz*z
    v1391       = M_yyyyzzz*x
    v1564       = M_yyyyzzz*y
    M_yyyzzzz   = -(M_xxyyyzz + M_yyyyyzz)
    v1622       = M_xxyzzzz + M_yyyzzzz
    v5          = v1622
    v1061       = M_yyyzzzz*y
    v1106       = M_yyyzzzz*x
    v1424       = v5*y
    v1430       = M_yyyzzzz*z
    M_yyzzzzz   = -(M_xxyyzzz + M_yyyyzzz)
    v642        = 0.0116550116550117d0*M_yyzzzzz
    v1635       = v639 + v640 + v642 + v680 + v744
    v859        = M_xxzzzz*v858 + M_yyzzzz*v858 + 0.00233100233100233d0*(-21.0d0*M_xxyyzzz &
      + M_xxzzzzz + M_yyzzzzz - 105.0d0*v679)
    v910        = M_yyzzzzz*z
    v1406       = M_yyzzzzz*x
    v1432       = M_yyzzzzz*y
    M_yzzzzzz   = -v5
    M_zzzzzzz   = -(M_xxzzzzz + M_yyzzzzz)
    M_xxxxxxzz  = -(M_xxxxxxxx + M_xxxxxxyy)
    M_xxxxxyzz  = -(M_xxxxxxxy + M_xxxxxyyy)
    M_xxxxxzzz  = -(M_xxxxxxxz + M_xxxxxyyz)
    M_xxxxyyzz  = -(M_xxxxxxyy + M_xxxxyyyy)
    M_xxxxyzzz  = -(M_xxxxxxyz + M_xxxxyyyz)
    M_xxxxzzzz  = -(M_xxxxxxzz + M_xxxxyyzz)
    M_xxxyyyzz  = -(M_xxxxxyyy + M_xxxyyyyy)
    M_xxxyyzzz  = -(M_xxxxxyyz + M_xxxyyyyz)
    M_xxxyzzzz  = -(M_xxxxxyzz + M_xxxyyyzz)
    M_xxxzzzzz  = -(M_xxxxxzzz + M_xxxyyzzz)
    M_xxyyyyzz  = -(M_xxxxyyyy + M_xxyyyyyy)
    M_xxyyyzzz  = -(M_xxxxyyyz + M_xxyyyyyz)
    M_xxyyzzzz  = -(M_xxxxyyzz + M_xxyyyyzz)
    M_xxyzzzzz  = -(M_xxxxyzzz + M_xxyyyzzz)
    M_xxzzzzzz  = -(M_xxxxzzzz + M_xxyyzzzz)
    M_xyyyyyzz  = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz  = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz  = -(M_xxxyyyzz + M_xyyyyyzz)
    v1623       = M_xxxyzzzz + M_xyyyzzzz
    M_xyyzzzzz  = -(M_xxxyyzzz + M_xyyyyzzz)
    v1624       = M_xxxzzzzz + M_xyyzzzzz
    M_xyzzzzzz  = -v1623
    M_xzzzzzzz  = -v1624
    M_yyyyyyzz  = -(M_xxyyyyyy + M_yyyyyyyy)
    M_yyyyyzzz  = -(M_xxyyyyyz + M_yyyyyyyz)
    M_yyyyzzzz  = -(M_xxyyyyzz + M_yyyyyyzz)
    M_yyyzzzzz  = -(M_xxyyyzzz + M_yyyyyzzz)
    v1625       = M_xxyzzzzz + M_yyyzzzzz
    M_yyzzzzzz  = -(M_xxyyzzzz + M_yyyyzzzz)
    M_yzzzzzzz  = -v1625
    M_zzzzzzzz  = -(M_xxzzzzzz + M_yyzzzzzz)
    S_0         = 1
    S_x         = x
    S_y         = y
    S_z         = z
    S_xy        = v6
    v36         = M_xy*S_xy
    v51         = M_xx*S_xy
    v56         = M_yy*S_xy
    v65         = M_yz*S_xy
    v76         = M_xz*S_xy
    v93         = M_xxy*S_xy
    v115        = M_xxx*S_xy
    v125        = M_xyy*S_xy
    v139        = M_xyz*S_xy
    v168        = M_yyy*S_xy
    v174        = M_xxz*S_xy
    v182        = M_yyz*S_xy
    v213        = M_xxxy*S_xy
    v253        = M_xxyy*S_xy
    v255        = M_xxzz*S_xy
    v263        = M_yyzz*S_xy
    v268        = M_xxxx*S_xy
    v293        = M_yyyy*S_xy
    v315        = M_xxyz*S_xy
    v354        = M_xyyy*S_xy
    v380        = M_xxxz*S_xy
    v393        = M_xyyz*S_xy
    v418        = M_yyyz*S_xy
    v450        = M_xxxxy*S_xy
    v471        = M_xxyyy*S_xy
    v474        = M_xxyzz*S_xy
    v518        = M_yyyyy*S_xy
    v522        = M_yyyzz*S_xy
    v554        = M_xxxxx*S_xy
    v565        = M_xxxyy*S_xy
    v570        = M_xxxzz*S_xy
    v599        = M_xyyyy*S_xy
    v603        = M_xyyzz*S_xy
    v665        = M_xxxyz*S_xy
    v770        = M_xxyyz*S_xy
    v774        = M_xxzzz*S_xy
    v791        = M_yyzzz*S_xy
    v803        = M_xxxxz*S_xy
    v836        = M_yyyyz*S_xy
    v868        = M_xyyyz*S_xy
    v890        = M_xxxyyy*S_xy
    v891        = M_xxxyzz*S_xy
    v905        = M_xyyyzz*S_xy
    v937        = M_xxxxxy*S_xy
    v1012       = M_xyyyyy*S_xy
    v1086       = M_xxyyzz*S_xy
    v1091       = M_xxzzzz*S_xy
    v1108       = M_yyzzzz*S_xy
    v1126       = M_xxxxxx*S_xy
    v1137       = M_xxxxyy*S_xy
    v1142       = M_xxxxzz*S_xy
    v1171       = M_xxyyyy*S_xy
    v1230       = M_yyyyyy*S_xy
    v1235       = M_yyyyzz*S_xy
    v1273       = M_xxxxyz*S_xy
    v1308       = M_xxyyyz*S_xy
    v1315       = M_xxyzzz*S_xy
    v1387       = M_yyyyyz*S_xy
    v1395       = M_yyyzzz*S_xy
    v1452       = M_xxxxxz*S_xy
    v1470       = M_xxxyyz*S_xy
    v1478       = M_xxxzzz*S_xy
    v1524       = M_xyyyyz*S_xy
    v1531       = M_xyyzzz*S_xy
    Ms_xy       = Ms_xy + (M_0*S_xy + M_xy)
    S_xz        = v7
    v44         = M_xz*S_xz
    v64         = M_yy*S_xz
    v75         = M_xy*S_xz
    v95         = M_xxz*S_xz
    v126        = M_xyz*S_xz
    v144        = M_xxx*S_xz
    v151        = M_xyy*S_xz
    v169        = M_yyz*S_xz
    v172        = 3.0d0*S_xz
    v181        = M_yyy*S_xz
    v215        = M_xxxz*S_xz
    v278        = M_xxyz*S_xz
    v302        = M_xxxx*S_xz
    v313        = M_xxyy*S_xz
    v318        = M_xxzz*S_xz
    v339        = M_yyyy*S_xz
    v343        = M_yyzz*S_xz
    v352        = 0.242424242424242d0*v215
    v355        = M_xyyz*S_xz
    v378        = M_xxxy*S_xz
    v392        = M_xyyy*S_xz
    v413        = M_yyyz*S_xz
    v452        = M_xxxxz*S_xz
    v472        = M_xxyyz*S_xz
    v479        = M_xxzzz*S_xz
    v520        = M_yyyyz*S_xz
    v527        = M_yyzzz*S_xz
    v567        = M_xxxyz*S_xz
    v652        = M_xxxxx*S_xz
    v663        = M_xxxyy*S_xz
    v668        = M_xxxzz*S_xz
    v698        = M_xyyyy*S_xz
    v702        = M_xyyzz*S_xz
    v771        = M_xxyzz*S_xz
    v788        = M_yyyzz*S_xz
    v801        = M_xxxxy*S_xz
    v812        = M_xxyyy*S_xz
    v834        = M_yyyyy*S_xz
    v850        = 0.839160839160839d0*v567
    v853        = M_xyyyz*S_xz
    v865        = 0.34965034965035d0*v668
    v869        = 0.34965034965035d0*v702
    v939        = M_xxxxxz*S_xz
    v957        = M_xxxyyz*S_xz
    v964        = M_xxxzzz*S_xz
    v1014       = M_xyyyyz*S_xz
    v1019       = M_xyyzzz*S_xz
    v1088       = M_xxyzzz*S_xz
    v1105       = M_yyyzzz*S_xz
    v1139       = M_xxxxyz*S_xz
    v1172       = M_xxyyyz*S_xz
    v1232       = M_yyyyyz*S_xz
    v1261       = M_xxxxxx*S_xz
    v1271       = M_xxxxyy*S_xz
    v1276       = M_xxxxzz*S_xz
    v1307       = M_xxyyyy*S_xz
    v1311       = M_xxyyzz*S_xz
    v1325       = M_xxzzzz*S_xz
    v1385       = M_yyyyyy*S_xz
    v1390       = M_yyyyzz*S_xz
    v1405       = M_yyzzzz*S_xz
    v1450       = M_xxxxxy*S_xz
    v1468       = M_xxxyyy*S_xz
    v1473       = M_xxxyzz*S_xz
    v1522       = M_xyyyyy*S_xz
    v1527       = M_xyyyzz*S_xz
    Ms_xz       = Ms_xz + (M_0*S_xz + M_xz)
    S_yz        = v8
    v46         = M_yz*S_yz
    v50         = -0.142857142857143d0*(7.0d0*v49*z + 6.0d0*(M_xz*S_yz + M_yz*S_xz))
    v60         = M_xy*S_yz
    v73         = M_xx*S_yz
    v83         = 3.0d0*S_yz
    v100        = M_xyz*S_yz
    v122        = M_xxz*S_yz
    v133        = M_yyz*S_yz
    v147        = M_xxy*S_yz
    v156        = M_yyy*S_yz
    v170        = M_xxx*S_yz
    v222        = M_xxyz*S_yz
    v275        = M_xxxz*S_yz
    v286        = M_xyyz*S_yz
    v305        = M_xxxy*S_yz
    v323        = M_xyyy*S_yz
    v358        = M_yyyz*S_yz
    v359        = 0.242424242424242d0*v358
    v364        = M_xxzz*S_yz
    v367        = M_yyzz*S_yz
    v375        = M_xxxx*S_yz
    v383        = M_xxyy*S_yz
    v400        = M_yyyy*S_yz
    v460        = M_xxxyz*S_yz
    v534        = M_xxzzz*S_yz
    v537        = M_yyzzz*S_yz
    v561        = M_xxxxz*S_yz
    v581        = M_xxyyz*S_yz
    v623        = M_yyyyz*S_yz
    v655        = M_xxxxy*S_yz
    v674        = M_xxyyy*S_yz
    v683        = M_xxyzz*S_yz
    v684        = 0.34965034965035d0*v683
    v719        = M_yyyyy*S_yz
    v726        = M_yyyzz*S_yz
    v727        = 0.34965034965035d0*v726
    v755        = M_xyyyz*S_yz
    v756        = 0.839160839160839d0*v755
    v767        = M_xxxzz*S_yz
    v780        = M_xyyzz*S_yz
    v798        = M_xxxxx*S_yz
    v805        = M_xxxyy*S_yz
    v821        = M_xyyyy*S_yz
    v947        = M_xxxxyz*S_yz
    v979        = M_xxyyyz*S_yz
    v989        = M_xxyzzz*S_yz
    v1049       = M_yyyyyz*S_yz
    v1060       = M_yyyzzz*S_yz
    v1083       = M_xxxzzz*S_yz
    v1097       = M_xyyzzz*S_yz
    v1133       = M_xxxxxz*S_yz
    v1153       = M_xxxyyz*S_yz
    v1202       = M_xyyyyz*S_yz
    v1264       = M_xxxxxy*S_yz
    v1282       = M_xxxyyy*S_yz
    v1290       = M_xxxyzz*S_yz
    v1341       = M_xyyyyy*S_yz
    v1349       = M_xyyyzz*S_yz
    v1425       = M_xxyyzz*S_yz
    v1428       = M_xxzzzz*S_yz
    v1431       = M_yyzzzz*S_yz
    v1447       = M_xxxxxx*S_yz
    v1455       = M_xxxxyy*S_yz
    v1463       = M_xxxxzz*S_yz
    v1488       = M_xxyyyy*S_yz
    v1555       = M_yyyyyy*S_yz
    v1563       = M_yyyyzz*S_yz
    Ms_yz       = Ms_yz + (M_0*S_yz + M_yz)
    S_xyz       = v9
    v106        = M_yz*S_xyz
    v127        = M_xz*S_xyz
    v138        = M_xy*S_xyz
    v141        = 0.0476190476190476d0*(18.0d0*v136 - (2.0d0*M_xxyyz + M_xxzzz + M_yyzzz + &
      5.0d0*v137 + 48.0d0*v138 + 48.0d0*v139 + 5.0d0*v140))
    v198        = M_xyz*S_xyz
    v279        = M_xxz*S_xyz
    v295        = M_yyz*S_xyz
    v311        = 5.45454545454545d0*S_xyz
    v312        = M_xxy*v311
    v338        = M_yyy*S_xyz
    v374        = M_xxx*S_xyz
    v423        = M_xyy*v311
    v473        = M_xxyz*S_xyz
    v569        = M_xxxz*S_xyz
    v602        = M_xyyz*S_xyz
    v662        = M_xxxy*S_xyz
    v697        = M_xyyy*S_xyz
    v759        = M_yyyz*S_xyz
    v760        = 0.839160839160839d0*v759
    v769        = M_xxyy*S_xyz
    v773        = M_xxzz*S_xyz
    v790        = M_yyzz*S_xyz
    v797        = M_xxxx*S_xyz
    v833        = M_yyyy*S_xyz
    v851        = 0.839160839160839d0*v569
    v959        = M_xxxyz*S_xyz
    v1085       = M_xxyyz*S_xyz
    v1090       = M_xxzzz*S_xyz
    v1107       = M_yyzzz*S_xyz
    v1141       = M_xxxxz*S_xyz
    v1234       = M_yyyyz*S_xyz
    v1270       = M_xxxxy*S_xyz
    v1306       = M_xxyyy*S_xyz
    v1314       = M_xxyzz*S_xyz
    v1384       = M_yyyyy*S_xyz
    v1394       = M_yyyzz*S_xyz
    v1417       = M_xyyyz*S_xyz
    v1418       = 3.35664335664336d0*v1417
    v1446       = M_xxxxx*S_xyz
    v1467       = M_xxxyy*S_xyz
    v1477       = M_xxxzz*S_xyz
    v1530       = M_xyyzz*S_xyz
    v1603       = 3.35664335664336d0*v959
    v1606       = M_xyyyy*S_xyz
    Ms_xyz      = Ms_xyz + (M_xyz + M_0*S_xyz + M_xy*z + M_xz*y + M_yz*x)
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v10         = a2
    a3          = a1*a2
    a4          = a2*a2
    v31         = a4
    a5          = a2*a3
    a6          = a3*a3
    v190        = a6
    a7          = a3*a4
    a8          = a4*a4
    a9          = a4*a5
    b2          = b1*b1
    v11         = b2
    v1615       = v10*v11
    v67         = v1615
    v349        = v11*v31
    b3          = b1*b2
    b4          = b2*b2
    v81         = b4
    v420        = v10*v81
    b5          = b2*b3
    b6          = b3*b3
    v428        = b6
    b7          = b3*b4
    b8          = b4*b4
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v10 + v11
    v1626       = h*v10
    v12         = 0.333333333333333d0*h
    v13         = -v12
    v14         = v10 + v13
    v15         = v11 + v13
    v16         = -0.6d0*h
    v20         = 0.2d0*h
    v21         = -v20
    v22         = v10 + v21
    v30         = v11 + v21
    v32         = h*h
    v33         = 0.0857142857142857d0*v32
    v34         = v1626
    v47         = -0.428571428571429d0*h
    v48         = v10 + v47
    v66         = 0.142857142857143d0*h
    v72         = -v66
    v80         = v11 + v47
    v82         = h*v11
    v85         = 0.238095238095238d0*v32
    v107        = 0.0476190476190476d0*v32
    v108        = 0.666666666666667d0*v34
    v109        = -v108 + v107 + v31
    v162        = -0.111111111111111d0*v34
    v184        = v67 + 0.111111111111111d0*(-v82)
    v189        = 0.333333333333333d0*(-2.0d0*v82) + v107 + v81
    v191        = h*h*h
    v192        = -0.0216450216450216d0*v191
    v193        = h*v31
    v194        = v10*v32
    v248        = 0.151515151515152d0*v32
    v249        = 0.0909090909090909d0*(-10.0d0*v34) + v248 + v31
    v347        = 0.545454545454545d0*v34
    v348        = -0.00432900432900433d0*(231.0d0*v11*v347 + v191)
    v350        = 0.0303030303030303d0*v32
    v409        = -0.272727272727273d0*v34
    v410        = -0.272727272727273d0*v82
    v414        = v350 + v67
    v419        = h*v81
    v421        = v11*v32
    v427        = 0.0909090909090909d0*(-10.0d0*v82) + v248 + v81
    v431        = -0.0815850815850816d0*v191
    v530        = -0.0116550116550117d0*v191
    v531        = v190 + v530 + 0.00699300699300699d0*(-165.0d0*v193 + 45.0d0*v194)
    v746        = -0.0769230769230769d0*v193
    v747        = 0.104895104895105d0*v32
    v748        = 0.769230769230769d0*v34
    v749        = -v11*v748
    v1629       = v530 + v749
    v843        = 0.00699300699300699d0*v191
    v844        = -v843
    v845        = v11*v1626
    v846        = -0.461538461538462d0*v845
    v847        = v844 + v846
    v848        = 0.020979020979021d0*v421
    v1630       = v349 + v848
    v857        = 0.00233100233100233d0*(-v191) + v846
    v872        = 0.020979020979021d0*v194
    v1632       = v420 + v872
    v873        = -0.0769230769230769d0*v419
    v880        = 0.00699300699300699d0*(-165.0d0*v419 + 45.0d0*v421) + v428 + v530
    v882        = h*h*h*h
    v883        = 0.00543900543900544d0*v882
    v884        = h*v190
    v885        = v31*v32
    v886        = v10*v191
    v1078       = -0.048951048951049d0*v191
    v1079       = v1078 + v190 + 0.0153846153846154d0*(-91.0d0*v193 + 35.0d0*v194)
    v1412       = v1615*v32
    v1413       = 0.000777000777000777d0*(297.0d0*v1412 + v882)
    v1414       = 0.020979020979021d0*v191
    v1415       = v11*v193
    v1589       = 0.0769230769230769d0*v421
    v1633       = v1589 + v349
    v1590       = -v1414
    v1591       = -v20*v31
    v1592       = -v108*v11
    v1636       = v1590 + v1592
    v1596       = v1592 + v844
    v1600       = v32*v81
    v1601       = v11*v191
    v1602       = v10*v419
    v1605       = -0.0013986013986014d0*(3.0d0*v191 + 286.0d0*v845)
    v1608       = 0.0769230769230769d0*v194
    v1634       = v1608 + v420
    v1609       = -v20*v81
    v1610       = h*v428
    v1613       = v1078 + v428 + 0.0153846153846154d0*(-91.0d0*v419 + 35.0d0*v421)
    S_xx        = v14
    v37         = M_yy*S_xx
    v39         = M_xx*S_xx
    v53         = M_xy*S_xx
    v79         = M_yz*S_xx
    v88         = M_xxx*S_xx
    v98         = M_xyy*S_xx
    v118        = M_xxy*S_xx
    v130        = M_yyy*S_xx
    v149        = M_xxz*S_xx
    v158        = M_yyz*S_xx
    v208        = M_xxxx*S_xx
    v219        = M_xxyy*S_xx
    v225        = M_xxzz*S_xx
    v240        = M_yyyy*S_xx
    v245        = M_yyzz*S_xx
    v271        = M_xxxy*S_xx
    v283        = M_xyyy*S_xx
    v308        = M_xxxz*S_xx
    v325        = M_xyyz*S_xx
    v386        = M_xxyz*S_xx
    v403        = M_yyyz*S_xx
    v445        = M_xxxxx*S_xx
    v456        = M_xxxyy*S_xx
    v464        = M_xxxzz*S_xx
    v493        = M_xyyyy*S_xx
    v500        = M_xyyzz*S_xx
    v557        = M_xxxxy*S_xx
    v578        = M_xxyyy*S_xx
    v584        = M_xxyzz*S_xx
    v619        = M_yyyyy*S_xx
    v626        = M_yyyzz*S_xx
    v659        = M_xxxxz*S_xx
    v677        = M_xxyyz*S_xx
    v692        = M_xxzzz*S_xx
    v721        = M_yyyyz*S_xx
    v735        = M_yyzzz*S_xx
    v778        = M_xyyyz*S_xx
    v807        = M_xxxyz*S_xx
    v863        = -0.20979020979021d0*v659
    v932        = M_xxxxxx*S_xx
    v943        = M_xxxxyy*S_xx
    v950        = M_xxxxzz*S_xx
    v975        = M_xxyyyy*S_xx
    v983        = M_xxyyzz*S_xx
    v1000       = M_xxzzzz*S_xx
    v1046       = M_yyyyyy*S_xx
    v1053       = M_yyyyzz*S_xx
    v1071       = M_yyzzzz*S_xx
    v1129       = M_xxxxxy*S_xx
    v1150       = M_xxxyyy*S_xx
    v1157       = M_xxxyzz*S_xx
    v1198       = M_xyyyyy*S_xx
    v1206       = M_xyyyzz*S_xx
    v1267       = M_xxxxxz*S_xx
    v1285       = M_xxxyyz*S_xx
    v1299       = M_xxxzzz*S_xx
    v1344       = M_xyyyyz*S_xx
    v1358       = M_xyyzzz*S_xx
    v1458       = M_xxxxyz*S_xx
    v1491       = M_xxyyyz*S_xx
    v1503       = M_xxyzzz*S_xx
    v1558       = M_yyyyyz*S_xx
    v1572       = M_yyyzzz*S_xx
    Ms_xx       = Ms_xx + (M_0*S_xx + M_xx)
    S_yy        = v15
    v35         = M_xx*S_yy
    v38         = 0.0285714285714286d0*(-6.0d0*M_xxyy - 96.0d0*v36 + 3.0d0*(-M_xxzz - &
      M_yyzz + 4.0d0*v35 + 4.0d0*v37))
    v45         = M_yy*S_yy
    v54         = M_xy*S_yy
    v63         = M_xz*S_yy
    v89         = M_xxx*S_yy
    v99         = M_xyy*S_yy
    v119        = M_xxy*S_yy
    v131        = M_yyy*S_yy
    v150        = M_xxz*S_yy
    v159        = M_yyz*S_yy
    v209        = M_xxxx*S_yy
    v220        = M_xxyy*S_yy
    v226        = M_xxzz*S_yy
    v241        = M_yyyy*S_yy
    v246        = M_yyzz*S_yy
    v272        = M_xxxy*S_yy
    v284        = M_xyyy*S_yy
    v309        = M_xxxz*S_yy
    v326        = M_xyyz*S_yy
    v387        = M_xxyz*S_yy
    v404        = M_yyyz*S_yy
    v446        = M_xxxxx*S_yy
    v457        = M_xxxyy*S_yy
    v465        = M_xxxzz*S_yy
    v494        = M_xyyyy*S_yy
    v501        = M_xyyzz*S_yy
    v558        = M_xxxxy*S_yy
    v579        = M_xxyyy*S_yy
    v585        = M_xxyzz*S_yy
    v620        = M_yyyyy*S_yy
    v627        = M_yyyzz*S_yy
    v637        = M_yyyyz*S_yy
    v638        = -0.20979020979021d0*v637
    v660        = M_xxxxz*S_yy
    v678        = M_xxyyz*S_yy
    v693        = M_xxzzz*S_yy
    v736        = M_yyzzz*S_yy
    v765        = M_xxxyz*S_yy
    v824        = M_xyyyz*S_yy
    v933        = M_xxxxxx*S_yy
    v944        = M_xxxxyy*S_yy
    v951        = M_xxxxzz*S_yy
    v976        = M_xxyyyy*S_yy
    v984        = M_xxyyzz*S_yy
    v1001       = M_xxzzzz*S_yy
    v1054       = M_yyyyzz*S_yy
    v1072       = M_yyzzzz*S_yy
    v1130       = M_xxxxxy*S_yy
    v1151       = M_xxxyyy*S_yy
    v1158       = M_xxxyzz*S_yy
    v1199       = M_xyyyyy*S_yy
    v1207       = M_xyyyzz*S_yy
    v1268       = M_xxxxxz*S_yy
    v1286       = M_xxxyyz*S_yy
    v1300       = M_xxxzzz*S_yy
    v1345       = M_xyyyyz*S_yy
    v1359       = M_xyyzzz*S_yy
    v1422       = M_yyyyyy*S_yy
    v1459       = M_xxxxyz*S_yy
    v1492       = M_xxyyyz*S_yy
    v1504       = M_xxyzzz*S_yy
    v1559       = M_yyyyyz*S_yy
    v1573       = M_yyyzzz*S_yy
    Ms_yy       = Ms_yy + (M_0*S_yy + M_yy)
    S_zz        = -(S_xx + S_yy)
    S_xxx       = x*(v10 + v16)
    v86         = M_xx*S_xxx
    v102        = M_yy*S_xxx
    v123        = M_xy*S_xxx
    v152        = M_xz*S_xxx
    v183        = M_yz*S_xxx
    v206        = M_xxx*S_xxx
    v228        = M_xyy*S_xxx
    v261        = M_yyy*S_xxx
    v276        = M_xxy*S_xxx
    v316        = 10.0d0*S_xxx
    v341        = M_yyz*S_xxx
    v394        = M_xyz*S_xxx
    v443        = M_xxxx*S_xxx
    v469        = M_xxyy*S_xxx
    v477        = M_xxzz*S_xxx
    v516        = M_yyyy*S_xxx
    v525        = M_yyzz*S_xxx
    v563        = M_xxxy*S_xxx
    v597        = M_xyyy*S_xxx
    v666        = M_xxxz*S_xxx
    v700        = M_xyyz*S_xxx
    v837        = M_yyyz*S_xxx
    v930        = M_xxxxx*S_xxx
    v954        = M_xxxyy*S_xxx
    v962        = M_xxxzz*S_xxx
    v1010       = M_xyyyy*S_xxx
    v1017       = M_xyyzz*S_xxx
    v1135       = M_xxxxy*S_xxx
    v1169       = M_xxyyy*S_xxx
    v1174       = M_xxyzz*S_xxx
    v1228       = M_yyyyy*S_xxx
    v1237       = M_yyyzz*S_xxx
    v1274       = M_xxxxz*S_xxx
    v1309       = M_xxyyz*S_xxx
    v1323       = M_xxzzz*S_xxx
    v1388       = M_yyyyz*S_xxx
    v1403       = M_yyzzz*S_xxx
    v1471       = M_xxxyz*S_xxx
    v1525       = M_xyyyz*S_xxx
    Ms_xxx      = Ms_xxx + (0.2d0*(9.0d0*v17 + 3.0d0*(-2.0d0*v18 - 2.0d0*v19)) + M_0*S_xxx + M_xxx)
    S_xxy       = v22*y
    v97         = M_xy*S_xxy
    v113        = M_xx*S_xxy
    v128        = M_yy*S_xxy
    v160        = M_yz*S_xxy
    v217        = M_xxy*S_xxy
    v238        = M_yyy*S_xxy
    v259        = M_xyy*S_xxy
    v267        = M_xxx*S_xxy
    v329        = S_xxy*v328
    v388        = M_xxz*S_xxy
    v405        = M_yyz*S_xxy
    v454        = M_xxxy*S_xxy
    v491        = M_xyyy*S_xxy
    v552        = M_xxxx*S_xxy
    v576        = M_xxyy*S_xxy
    v588        = M_xxzz*S_xxy
    v617        = M_yyyy*S_xxy
    v630        = M_yyzz*S_xxy
    v681        = M_xxyz*S_xxy
    v724        = M_yyyz*S_xxy
    v808        = M_xxxz*S_xxy
    v825        = M_xyyz*S_xxy
    v941        = M_xxxxy*S_xxy
    v973        = M_xxyyy*S_xxy
    v987        = M_xxyzz*S_xxy
    v1044       = M_yyyyy*S_xxy
    v1058       = M_yyyzz*S_xxy
    v1124       = M_xxxxx*S_xxy
    v1148       = M_xxxyy*S_xxy
    v1160       = M_xxxzz*S_xxy
    v1196       = M_xyyyy*S_xxy
    v1209       = M_xyyzz*S_xxy
    v1288       = M_xxxyz*S_xxy
    v1347       = M_xyyyz*S_xxy
    v1461       = M_xxxxz*S_xxy
    v1494       = M_xxyyz*S_xxy
    v1512       = M_xxzzz*S_xxy
    v1561       = M_yyyyz*S_xxy
    v1581       = M_yyzzz*S_xxy
    Ms_xxy      = Ms_xxy + (0.2d0*(8.0d0*v23 + 2.0d0*(-v24 - v25)) + M_0*S_xxy + M_xx*y + M_xxy)
    S_xxz       = v22*z
    v101        = M_xz*S_xxz
    v134        = M_yz*S_xxz
    v142        = M_xx*S_xxz
    v154        = M_yy*S_xxz
    v175        = M_xy*S_xxz
    v199        = M_yyz*S_xxz
    v224        = M_xxz*S_xxz
    v287        = M_xyz*S_xxz
    v321        = M_xyy*S_xxz
    v381        = M_xxy*S_xxz
    v399        = M_yyy*S_xxz
    v462        = M_xxxz*S_xxz
    v498        = M_xyyz*S_xxz
    v582        = M_xxyz*S_xxz
    v624        = M_yyyz*S_xxz
    v650        = M_xxxx*S_xxz
    v672        = M_xxyy*S_xxz
    v690        = M_xxzz*S_xxz
    v717        = M_yyyy*S_xxz
    v733        = M_yyzz*S_xxz
    v820        = M_xyyy*S_xxz
    v948        = M_xxxxz*S_xxz
    v981        = M_xxyyz*S_xxz
    v998        = M_xxzzz*S_xxz
    v1051       = M_yyyyz*S_xxz
    v1069       = M_yyzzz*S_xxz
    v1155       = M_xxxyz*S_xxz
    v1204       = M_xyyyz*S_xxz
    v1259       = M_xxxxx*S_xxz
    v1280       = M_xxxyy*S_xxz
    v1297       = M_xxxzz*S_xxz
    v1339       = M_xyyyy*S_xxz
    v1356       = M_xyyzz*S_xxz
    v1453       = M_xxxxy*S_xxz
    v1486       = M_xxyyy*S_xxz
    v1501       = M_xxyzz*S_xxz
    v1553       = M_yyyyy*S_xxz
    v1570       = M_yyyzz*S_xxz
    Ms_xxz      = Ms_xxz + (M_0*S_xxz + M_xxz + 0.2d0*(7.0d0*v26 + 8.0d0*v27 + 2.0d0*(v28 - v29)))
    S_xyy       = v30*x
    v87         = M_xx*S_xyy
    v103        = M_yy*S_xyy
    v124        = M_xy*S_xyy
    v153        = M_xz*S_xyy
    v207        = M_xxx*S_xyy
    v229        = M_xyy*S_xyy
    v252        = M_xxy*S_xyy
    v292        = M_yyy*S_xyy
    v317        = M_xxz*S_xyy
    v342        = M_yyz*S_xyy
    v426        = S_xyy*v328
    v444        = M_xxxx*S_xyy
    v470        = M_xxyy*S_xyy
    v478        = M_xxzz*S_xyy
    v517        = M_yyyy*S_xyy
    v526        = M_yyzz*S_xyy
    v564        = M_xxxy*S_xyy
    v598        = M_xyyy*S_xyy
    v667        = M_xxxz*S_xyy
    v701        = M_xyyz*S_xyy
    v814        = M_xxyz*S_xyy
    v838        = M_yyyz*S_xyy
    v931        = M_xxxxx*S_xyy
    v955        = M_xxxyy*S_xyy
    v963        = M_xxxzz*S_xyy
    v1011       = M_xyyyy*S_xyy
    v1018       = M_xyyzz*S_xyy
    v1136       = M_xxxxy*S_xyy
    v1170       = M_xxyyy*S_xyy
    v1175       = M_xxyzz*S_xyy
    v1229       = M_yyyyy*S_xyy
    v1238       = M_yyyzz*S_xyy
    v1275       = M_xxxxz*S_xyy
    v1310       = M_xxyyz*S_xyy
    v1324       = M_xxzzz*S_xyy
    v1389       = M_yyyyz*S_xyy
    v1404       = M_yyzzz*S_xyy
    v1472       = M_xxxyz*S_xyy
    v1526       = M_xyyyz*S_xyy
    Ms_xyy      = Ms_xyy + (0.2d0*(8.0d0*v18 + 2.0d0*(-v17 - v19)) + M_0*S_xyy + M_xyy + M_yy*x)
    S_xzz       = -(S_xxx + S_xyy)
    S_yyy       = y*(v11 + v16)
    v114        = M_xx*S_yyy
    v129        = M_yy*S_yyy
    v161        = M_yz*S_yyy
    v164        = M_xy*S_yyy
    v180        = M_xz*S_yyy
    v218        = M_xxy*S_yyy
    v239        = M_yyy*S_yyy
    v250        = M_xxx*S_yyy
    v282        = M_xyy*S_yyy
    v330        = M_xyz*S_yyy
    v389        = M_xxz*S_yyy
    v430        = 10.0d0*S_yyy
    v455        = M_xxxy*S_yyy
    v492        = M_xyyy*S_yyy
    v553        = M_xxxx*S_yyy
    v577        = M_xxyy*S_yyy
    v589        = M_xxzz*S_yyy
    v618        = M_yyyy*S_yyy
    v631        = M_yyzz*S_yyy
    v682        = M_xxyz*S_yyy
    v725        = M_yyyz*S_yyy
    v809        = M_xxxz*S_yyy
    v942        = M_xxxxy*S_yyy
    v974        = M_xxyyy*S_yyy
    v988        = M_xxyzz*S_yyy
    v1045       = M_yyyyy*S_yyy
    v1059       = M_yyyzz*S_yyy
    v1125       = M_xxxxx*S_yyy
    v1149       = M_xxxyy*S_yyy
    v1161       = M_xxxzz*S_yyy
    v1197       = M_xyyyy*S_yyy
    v1210       = M_xyyzz*S_yyy
    v1289       = M_xxxyz*S_yyy
    v1348       = M_xyyyz*S_yyy
    v1462       = M_xxxxz*S_yyy
    v1495       = M_xxyyz*S_yyy
    v1513       = M_xxzzz*S_yyy
    v1562       = M_yyyyz*S_yyy
    v1582       = M_yyzzz*S_yyy
    Ms_yyy      = Ms_yyy + (0.2d0*(9.0d0*v24 + 3.0d0*(-2.0d0*v23 - 2.0d0*v25)) + M_0*S_yyy + M_yyy)
    S_yyz       = v30*z
    v135        = M_yz*S_yyz
    v143        = M_xx*S_yyz
    v155        = M_yy*S_yyz
    v167        = M_xz*S_yyz
    v176        = M_xy*S_yyz
    v196        = M_xxz*S_yyz
    v200        = M_xxzzz*v197 + M_yyzzz*v197 + 0.00432900432900433d0*(-75.0d0*M_xxyyzz + &
      60.0d0*v195 + 1440.0d0*v198 + 5.0d0*(M_xxzzzz + M_yyzzzz - 8.0d0* &
      v196 - 8.0d0*v199))
    v244        = M_yyz*S_yyz
    v288        = M_xyz*S_yyz
    v301        = M_xxx*S_yyz
    v322        = M_xyy*S_yyz
    v351        = 0.00432900432900433d0*(-15.0d0*M_xxyyzz + v1620 - 240.0d0*v195 - 720.0d0 &
      *v198 - 260.0d0*(v196 + v199))
    v382        = M_xxy*S_yyz
    v429        = 10.0d0*S_yyz
    v463        = M_xxxz*S_yyz
    v499        = M_xyyz*S_yyz
    v583        = M_xxyz*S_yyz
    v625        = M_yyyz*S_yyz
    v651        = M_xxxx*S_yyz
    v673        = M_xxyy*S_yyz
    v691        = M_xxzz*S_yyz
    v718        = M_yyyy*S_yyz
    v734        = M_yyzz*S_yyz
    v804        = M_xxxy*S_yyz
    v949        = M_xxxxz*S_yyz
    v982        = M_xxyyz*S_yyz
    v999        = M_xxzzz*S_yyz
    v1052       = M_yyyyz*S_yyz
    v1070       = M_yyzzz*S_yyz
    v1156       = M_xxxyz*S_yyz
    v1205       = M_xyyyz*S_yyz
    v1260       = M_xxxxx*S_yyz
    v1281       = M_xxxyy*S_yyz
    v1298       = M_xxxzz*S_yyz
    v1340       = M_xyyyy*S_yyz
    v1357       = M_xyyzz*S_yyz
    v1454       = M_xxxxy*S_yyz
    v1487       = M_xxyyy*S_yyz
    v1502       = M_xxyzz*S_yyz
    v1554       = M_yyyyy*S_yyz
    v1571       = M_yyyzz*S_yyz
    Ms_yyz      = Ms_yyz + (M_0*S_yyz + M_yyz + 0.2d0*(7.0d0*v28 + 8.0d0*v29 + 2.0d0*(v26 - v27)))
    S_yzz       = -(S_xxy + S_yyy)
    S_zzz       = -(S_xxz + S_yyz)
    S_xxxx      = 0.142857142857143d0*(-6.0d0*v34) + v31 + v33
    v201        = M_xx*S_xxxx
    v233        = M_yy*S_xxxx
    v280        = M_xy*S_xxxx
    v331        = M_xz*S_xxxx
    v406        = M_yz*S_xxxx
    v438        = M_xxx*S_xxxx
    v486        = M_xyy*S_xxxx
    v571        = M_xxy*S_xxxx
    v612        = M_yyy*S_xxxx
    v685        = M_xxz*S_xxxx
    v728        = M_yyz*S_xxxx
    v826        = M_xyz*S_xxxx
    v906        = M_yyyy*S_xxxx
    v926        = M_xxxx*S_xxxx
    v971        = M_xxyy*S_xxxx
    v996        = M_xxzz*S_xxxx
    v1067       = M_yyzz*S_xxxx
    v1143       = M_xxxy*S_xxxx
    v1191       = M_xyyy*S_xxxx
    v1292       = M_xxxz*S_xxxx
    v1351       = M_xyyz*S_xxxx
    v1496       = M_xxyz*S_xxxx
    v1565       = M_yyyz*S_xxxx
    Ms_xxxx     = Ms_xxxx + (M_0*S_xxxx + v38 - v42 + 0.0285714285714286d0*(32.0d0*M_xxxx - 3.0d0* &
      M_yyyy + 114.0d0*v39 + 80.0d0*v40 - 60.0d0*v43 - 96.0d0*v44 + &
      24.0d0*(v45 + v46)))
    S_xxxy      = v48*v6
    v227        = M_xy*S_xxxy
    v265        = M_xx*S_xxxy
    v290        = M_yy*S_xxxy
    v345        = M_yz*S_xxxy
    v395        = M_xz*S_xxxy
    v467        = M_xxy*S_xxxy
    v514        = M_yyy*S_xxxy
    v550        = M_xxx*S_xxxy
    v595        = M_xyy*S_xxxy
    v704        = M_xyz*S_xxxy
    v839        = M_yyz*S_xxxy
    v903        = M_xyyy*S_xxxy
    v953        = M_xxxy*S_xxxy
    v1122       = M_xxxx*S_xxxy
    v1167       = M_xxyy*S_xxxy
    v1178       = M_xxzz*S_xxxy
    v1226       = M_yyyy*S_xxxy
    v1241       = M_yyzz*S_xxxy
    v1312       = M_xxyz*S_xxxy
    v1392       = M_yyyz*S_xxxy
    v1475       = M_xxxz*S_xxxy
    v1529       = M_xyyz*S_xxxy
    Ms_xxxy     = Ms_xxxy + (M_0*S_xxxy + M_xxx*y + M_xxxy + v50 + 0.142857142857143d0*(3.0d0*(5.0d0* &
      v51 + 5.0d0*v52 + 5.0d0*v53 - 2.0d0*v54 - 2.0d0*v55 - 2.0d0*v56)))
    S_xxxz      = v48*v7
    v232        = M_xz*S_xxxz
    v296        = M_yz*S_xxxz
    v298        = M_xx*S_xxxz
    v336        = M_yy*S_xxxz
    v356        = 0.242424242424242d0*v232
    v390        = M_xy*S_xxxz
    v475        = M_xxz*S_xxxz
    v523        = M_yyz*S_xxxz
    v604        = M_xyz*S_xxxz
    v648        = M_xxx*S_xxxz
    v695        = M_xyy*S_xxxz
    v810        = M_xxy*S_xxxz
    v832        = M_yyy*S_xxxz
    v854        = 0.839160839160839d0*v604
    v960        = M_xxxz*S_xxxz
    v1015       = M_xyyz*S_xxxz
    v1104       = M_yyyz*S_xxxz
    v1173       = M_xxyz*S_xxxz
    v1257       = M_xxxx*S_xxxz
    v1304       = M_xxyy*S_xxxz
    v1321       = M_xxzz*S_xxxz
    v1382       = M_yyyy*S_xxxz
    v1401       = M_yyzz*S_xxxz
    v1465       = M_xxxy*S_xxxz
    v1521       = M_xyyy*S_xxxz
    Ms_xxxz     = Ms_xxxz + (0.142857142857143d0*(13.0d0*v58 + 15.0d0*v59 + 6.0d0*(-v60 + v61 + v63 + &
      v64 - v65)) + M_0*S_xxxz + M_xxxz + S_xx*v62 + S_xz*v57 - v49*y)
    S_xxyy      = 0.0285714285714286d0*v32 - v10*v66 - v11*v66 + v67
    v202        = M_xx*S_xxyy
    v234        = M_yy*S_xxyy
    v256        = M_xy*S_xxyy
    v332        = M_xz*S_xxyy
    v407        = M_yz*S_xxyy
    v439        = M_xxx*S_xxyy
    v487        = M_xyy*S_xxyy
    v572        = M_xxy*S_xxyy
    v613        = M_yyy*S_xxyy
    v686        = M_xxz*S_xxyy
    v729        = M_yyz*S_xxyy
    v782        = M_xyz*S_xxyy
    v892        = M_xxyy*S_xxyy
    v896        = M_xxzz*S_xxyy
    v907        = M_yyzz*S_xxyy
    v927        = M_xxxx*S_xxyy
    v1040       = M_yyyy*S_xxyy
    v1144       = M_xxxy*S_xxyy
    v1192       = M_xyyy*S_xxyy
    v1293       = M_xxxz*S_xxyy
    v1352       = M_xyyz*S_xxyy
    v1497       = M_xxyz*S_xxyy
    v1566       = M_yyyz*S_xxyy
    Ms_xxyy     = Ms_xxyy + (M_0*S_xxyy + v42 + v69 + 0.0285714285714286d0*(33.0d0*M_xxyy + 108.0d0* &
      v36 + 39.0d0*(v35 + v37) - (M_xxxx + M_xxzz + M_yyyy + M_yyzz + &
      12.0d0*v39 + 10.0d0*v40 + 10.0d0*v43 + 12.0d0*v44 + 12.0d0*v45 + &
      12.0d0*v46 + 10.0d0*v70 + 10.0d0*v71)))
    S_xxyz      = v8*(v10 + v72)
    v247        = M_yz*S_xxyz
    v289        = M_xz*S_xxyz
    v320        = M_xy*S_xxyz
    v372        = M_xx*S_xxyz
    v397        = M_yy*S_xxyz
    v503        = M_xyz*S_xxyz
    v586        = M_xxz*S_xxyz
    v628        = M_yyz*S_xxyz
    v670        = M_xxy*S_xxyz
    v715        = M_yyy*S_xxyz
    v818        = M_xyy*S_xxyz
    v985        = M_xxyz*S_xxyz
    v1056       = M_yyyz*S_xxyz
    v1096       = M_xyyz*S_xxyz
    v1159       = M_xxxz*S_xxyz
    v1278       = M_xxxy*S_xxyz
    v1337       = M_xyyy*S_xxyz
    v1444       = M_xxxx*S_xxyz
    v1484       = M_xxyy*S_xxyz
    v1510       = M_xxzz*S_xxyz
    v1551       = M_yyyy*S_xxyz
    v1579       = M_yyzz*S_xxyz
    Ms_xxyz     = Ms_xxyz + (0.142857142857143d0*(12.0d0*(v75 + v76) + 2.0d0*(v77 - v78) + 9.0d0*(v73 &
      + v74 + v79)) + M_0*S_xxyz + M_xxyz + M_xxz*y + M_xyz*v68)
    S_xxzz      = -(S_xxxx + S_xxyy)
    v203        = M_xx*S_xxzz
    v235        = M_yy*S_xxzz
    v257        = M_xy*S_xxzz
    v333        = M_xz*S_xxzz
    v369        = M_yz*S_xxzz
    v440        = M_xxx*S_xxzz
    v488        = M_xyy*S_xxzz
    v573        = M_xxy*S_xxzz
    v614        = M_yyy*S_xxzz
    v687        = M_xxz*S_xxzz
    v730        = M_yyz*S_xxzz
    v783        = M_xyz*S_xxzz
    v893        = M_xxyy*S_xxzz
    v897        = M_xxzz*S_xxzz
    v908        = M_yyzz*S_xxzz
    v928        = M_xxxx*S_xxzz
    v1041       = M_yyyy*S_xxzz
    v1145       = M_xxxy*S_xxzz
    v1193       = M_xyyy*S_xxzz
    v1294       = M_xxxz*S_xxzz
    v1353       = M_xyyz*S_xxzz
    v1498       = M_xxyz*S_xxzz
    v1567       = M_yyyz*S_xxzz
    S_xyyy      = v6*v80
    v266        = M_xx*S_xyyy
    v291        = M_yy*S_xyyy
    v346        = M_yz*S_xyyy
    v353        = M_xy*S_xyyy
    v396        = M_xz*S_xyyy
    v468        = M_xxy*S_xyyy
    v515        = M_yyy*S_xyyy
    v551        = M_xxx*S_xyyy
    v596        = M_xyy*S_xyyy
    v705        = M_xyz*S_xyyy
    v815        = M_xxz*S_xyyy
    v889        = M_xxxy*S_xyyy
    v1009       = M_xyyy*S_xyyy
    v1123       = M_xxxx*S_xyyy
    v1168       = M_xxyy*S_xyyy
    v1179       = M_xxzz*S_xyyy
    v1227       = M_yyyy*S_xyyy
    v1242       = M_yyzz*S_xyyy
    v1313       = M_xxyz*S_xyyy
    v1393       = M_yyyz*S_xyyy
    v1476       = M_xxxz*S_xyyy
    v1612       = M_xyyz*S_xyyy
    Ms_xyyy     = Ms_xyyy + (M_0*S_xyyy + M_xyyy + M_yyy*x + v50 + 0.142857142857143d0*(3.0d0*(-2.0d0 &
      *v51 - 2.0d0*v52 - 2.0d0*v53 + 5.0d0*v54 + 5.0d0*v55 + 5.0d0*v56 &
      )))
    S_xyyz      = v7*(v11 + v72)
    v297        = M_yz*S_xyyz
    v299        = M_xx*S_xyyz
    v337        = M_yy*S_xyyz
    v357        = M_xz*S_xyyz
    v391        = M_xy*S_xyyz
    v476        = M_xxz*S_xyyz
    v524        = M_yyz*S_xyyz
    v605        = M_xyz*S_xyyz
    v649        = M_xxx*S_xyyz
    v696        = M_xyy*S_xyyz
    v811        = M_xxy*S_xyyz
    v961        = M_xxxz*S_xyyz
    v1016       = M_xyyz*S_xyyz
    v1087       = M_xxyz*S_xyyz
    v1236       = M_yyyz*S_xyyz
    v1258       = M_xxxx*S_xyyz
    v1305       = M_xxyy*S_xyyz
    v1322       = M_xxzz*S_xyyz
    v1383       = M_yyyy*S_xyyz
    v1402       = M_yyzz*S_xyyz
    v1466       = M_xxxy*S_xyyz
    v1611       = M_xyyy*S_xyyz
    Ms_xyyz     = Ms_xyyz + (0.142857142857143d0*(2.0d0*(v58 - v59) + 12.0d0*(v60 + v65) + 9.0d0*(v61 &
      + v63 + v64)) + M_0*S_xyyz + M_xyyz + M_xyz*v41 + M_yyz*x)
    S_xyzz      = -(S_xxxy + S_xyyy)
    S_xzzz      = -(S_xxxz + S_xyyz)
    S_yyyy      = 0.142857142857143d0*(-6.0d0*v82) + v33 + v81
    v204        = M_xx*S_yyyy
    v236        = M_yy*S_yyyy
    v281        = M_xy*S_yyyy
    v334        = M_xz*S_yyyy
    v408        = M_yz*S_yyyy
    v441        = M_xxx*S_yyyy
    v489        = M_xyy*S_yyyy
    v574        = M_xxy*S_yyyy
    v615        = M_yyy*S_yyyy
    v688        = M_xxz*S_yyyy
    v731        = M_yyz*S_yyyy
    v827        = M_xyz*S_yyyy
    v887        = M_xxxx*S_yyyy
    v972        = M_xxyy*S_yyyy
    v997        = M_xxzz*S_yyyy
    v1042       = M_yyyy*S_yyyy
    v1068       = M_yyzz*S_yyyy
    v1146       = M_xxxy*S_yyyy
    v1194       = M_xyyy*S_yyyy
    v1295       = M_xxxz*S_yyyy
    v1354       = M_xyyz*S_yyyy
    v1499       = M_xxyz*S_yyyy
    v1568       = M_yyyz*S_yyyy
    Ms_yyyy     = Ms_yyyy + (M_0*S_yyyy + v38 - v69 + 0.0285714285714286d0*(-3.0d0*M_xxxx + 32.0d0* &
      M_yyyy + 114.0d0*v45 - 96.0d0*v46 + 80.0d0*v70 - 60.0d0*v71 + &
      24.0d0*(v39 + v44)))
    S_yyyz      = v8*v80
    v360        = M_yz*S_yyyz
    v361        = 0.242424242424242d0*v360
    v373        = M_xx*S_yyyz
    v398        = M_yy*S_yyyz
    v412        = M_xz*S_yyyz
    v416        = M_xy*S_yyyz
    v587        = M_xxz*S_yyyz
    v629        = M_yyz*S_yyyz
    v671        = M_xxy*S_yyyz
    v716        = M_yyy*S_yyyz
    v757        = M_xyz*S_yyyz
    v758        = 0.839160839160839d0*v757
    v796        = M_xxx*S_yyyz
    v819        = M_xyy*S_yyyz
    v986        = M_xxyz*S_yyyz
    v1057       = M_yyyz*S_yyyz
    v1082       = M_xxxz*S_yyyz
    v1208       = M_xyyz*S_yyyz
    v1279       = M_xxxy*S_yyyz
    v1338       = M_xyyy*S_yyyz
    v1445       = M_xxxx*S_yyyz
    v1485       = M_xxyy*S_yyyz
    v1511       = M_xxzz*S_yyyz
    v1552       = M_yyyy*S_yyyz
    v1580       = M_yyzz*S_yyyz
    Ms_yyyz     = Ms_yyyz + (0.142857142857143d0*(13.0d0*v77 + 15.0d0*v78 + 6.0d0*(v73 + v74 - v75 - &
      v76 + v79)) + M_0*S_yyyz + M_yy*v83 + M_yyyz + S_yy*v84 - v49*x)
    S_yyzz      = -(S_xxyy + S_yyyy)
    v205        = M_xx*S_yyzz
    v237        = M_yy*S_yyzz
    v258        = M_xy*S_yyzz
    v264        = 0.0303030303030303d0*(-10.0d0*M_xxxyyy + 5.0d0*(-M_xxxyzz - M_xyyyzz + &
      4.0d0*v250 - v251 - 24.0d0*v252 - 30.0d0*v253 - v254 - v255 - &
      30.0d0*v256 - v257 - v258 - 24.0d0*v259 - v260 + 4.0d0*v261 - &
      v262 - v263))
    v335        = M_xz*S_yyzz
    v370        = M_yz*S_yyzz
    v371        = -0.0303030303030303d0*(M_yyyyyz + v1619 + v365 + v368 + 5.0d0*(v363 + &
      v364 + v366 + v367 + v369 + v370))
    v415        = -0.0303030303030303d0*(M_xxxxxz + v1618 + v319 + v344 + 5.0d0*(v310 + &
      v318 + v327 + v333 + v335 + v343))
    v442        = M_xxx*S_yyzz
    v490        = M_xyy*S_yyzz
    v575        = M_xxy*S_yyzz
    v616        = M_yyy*S_yyzz
    v689        = M_xxz*S_yyzz
    v732        = M_yyz*S_yyzz
    v784        = M_xyz*S_yyzz
    v894        = M_xxyy*S_yyzz
    v898        = M_xxzz*S_yyzz
    v909        = M_yyzz*S_yyzz
    v1627       = 28.0d0*M_xxyyzzzz + 168.0d0*v895 - (M_xxzzzzzz + M_yyzzzzzz + 8.0d0*v899 &
      + 8.0d0*v910) + 70.0d0*(v897 + v898 + v908 + v909)
    v929        = M_xxxx*S_yyzz
    v1043       = M_yyyy*S_yyzz
    v1147       = M_xxxy*S_yyzz
    v1195       = M_xyyy*S_yyzz
    v1296       = M_xxxz*S_yyzz
    v1355       = M_xyyz*S_yyzz
    v1500       = M_xxyz*S_yyzz
    v1569       = M_yyyz*S_yyzz
    S_yzzz      = -(S_xxyz + S_yyyz)
    S_zzzz      = -(S_xxzz + S_yyzz)
    S_xxxxx     = x*(0.111111111111111d0*(-10.0d0*v34) + v31 + v85)
    v433        = M_xx*S_xxxxx
    v509        = M_yy*S_xxxxx
    v590        = M_xy*S_xxxxx
    v706        = M_xz*S_xxxxx
    v840        = M_yz*S_xxxxx
    v921        = M_xxx*S_xxxxx
    v1004       = M_xyy*S_xxxxx
    v1162       = M_xxy*S_xxxxx
    v1221       = M_yyy*S_xxxxx
    v1316       = M_xxz*S_xxxxx
    v1396       = M_yyz*S_xxxxx
    v1532       = M_xyz*S_xxxxx
    Ms_xxxxx    = Ms_xxxxx + (0.0158730158730159d0*(63.0d0*M_0*S_xxxxx + 48.0d0*M_xxxxx + 160.0d0*v90 &
      - 30.0d0*(M_xxxyy + v94) + 330.0d0*(v86 + v88) - 140.0d0*(v91 + &
      v92) + 120.0d0*(v100 + v103 + v106 + v99) - 300.0d0*(v101 + v93 + &
      v95 + v97) + 60.0d0*(v102 + v87 + v89 + v98) - 15.0d0*(M_xxxzz + &
      M_xyyyy + M_xyyzz + v104 + v105 + v96)))
    S_xxxxy     = v109*y
    v481        = M_xy*S_xxxxy
    v545        = M_xx*S_xxxxy
    v607        = M_yy*S_xxxxy
    v737        = M_yz*S_xxxxy
    v828        = M_xz*S_xxxxy
    v966        = M_xxy*S_xxxxy
    v1035       = M_yyy*S_xxxxy
    v1117       = M_xxx*S_xxxxy
    v1186       = M_xyy*S_xxxxy
    v1361       = M_xyz*S_xxxxy
    v1505       = M_xxz*S_xxxxy
    v1574       = M_yyz*S_xxxxy
    Ms_xxxxy    = Ms_xxxxy + (M_0*S_xxxxy + v112 + 0.0476190476190476d0*(20.0d0*(M_xxxxy + v116) + &
      78.0d0*(v113 + v118) + 4.0d0*(v114 + v130) + 56.0d0*(v115 + v117 &
      + v123) + 8.0d0*(v129 + v131 + v133 + v135) - (2.0d0*M_xxyyy + &
      24.0d0*v119 + 30.0d0*v120 + 28.0d0*v121 + 28.0d0*v122 + 48.0d0* &
      v124 + 48.0d0*v125 + 48.0d0*v126 + 48.0d0*v127 + 24.0d0*v128 + &
      v132 + 28.0d0*v134)))
    S_xxxxz     = v109*z
    v504        = M_xz*S_xxxxz
    v632        = M_yz*S_xxxxz
    v643        = M_xx*S_xxxxz
    v711        = M_yy*S_xxxxz
    v816        = M_xy*S_xxxxz
    v862        = -0.20979020979021d0*v643
    v1631       = v862 + v863
    v991        = M_xxz*S_xxxxz
    v1062       = M_yyz*S_xxxxz
    v1211       = M_xyz*S_xxxxz
    v1252       = M_xxx*S_xxxxz
    v1332       = M_xyy*S_xxxxz
    v1479       = M_xxy*S_xxxxz
    v1546       = M_yyy*S_xxxxz
    Ms_xxxxz    = Ms_xxxxz + (M_0*S_xxxxz + v141 + 0.0476190476190476d0*(20.0d0*M_xxxxz + 44.0d0*v145 &
      + 56.0d0*v146 + 106.0d0*(v142 + v149) + 4.0d0*(v143 + v158) + &
      104.0d0*(v144 + v152) + 32.0d0*(v150 + v154) + 48.0d0*(v151 + &
      v153) + 8.0d0*(v155 + v159) - (M_yyyyz + 36.0d0*v147 + 28.0d0* &
      v148 + 8.0d0*v156 + 5.0d0*v157 + 36.0d0*v160 + 8.0d0*v161)))
    S_xxxyy     = x*(-v11*v12 + v107 + v162 + v67)
    v434        = M_xx*S_xxxyy
    v510        = M_yy*S_xxxyy
    v591        = M_xy*S_xxxyy
    v707        = M_xz*S_xxxyy
    v841        = M_yz*S_xxxyy
    v922        = M_xxx*S_xxxyy
    v1005       = M_xyy*S_xxxyy
    v1163       = M_xxy*S_xxxyy
    v1222       = M_yyy*S_xxxyy
    v1317       = M_xxz*S_xxxyy
    v1397       = M_yyz*S_xxxyy
    v1533       = M_xyz*S_xxxyy
    Ms_xxxyy    = Ms_xxxyy + (M_0*S_xxxyy + v163 + 0.0158730158730159d0*(57.0d0*M_xxxyy - 17.0d0*v90 + &
      112.0d0*v91 - 14.0d0*v92 + 141.0d0*v94 - 3.0d0*(M_xyyyy + v104) + &
      75.0d0*(v102 + v89) + 159.0d0*(v87 + v98) + 276.0d0*(v93 + v97) - &
      60.0d0*(v100 + v103 + v106 + v99) - 18.0d0*(v101 + v86 + v88 + &
      v95) - 42.0d0*(v164 + v165 + v166 + v167 + v168 + v169)))
    S_xxxyz     = v14*v9
    v529        = M_yz*S_xxxyz
    v606        = M_xz*S_xxxyz
    v694        = M_xy*S_xxxyz
    v787        = M_yy*S_xxxyz
    v795        = M_xx*S_xxxyz
    v855        = 0.839160839160839d0*v606
    v1021       = M_xyz*S_xxxyz
    v1176       = M_xxz*S_xxxyz
    v1239       = M_yyz*S_xxxyz
    v1302       = M_xxy*S_xxxyz
    v1380       = M_yyy*S_xxxyz
    v1442       = M_xxx*S_xxxyz
    v1519       = M_xyy*S_xxxyz
    v1604       = 3.35664335664336d0*v1021
    Ms_xxxyz    = Ms_xxxyz + (0.333333333333333d0*(5.0d0*(v170 + v171 + v183) + 7.0d0*(v173 + v174 + &
      v175) + 2.0d0*(-v176 + v177 - v178 + v180 + v181 - v182)) + M_0* &
      S_xxxyz + M_xxxyz + M_xxxz*y + M_xxy*v172 + S_xx*v179 + S_xxy*v62 &
      + S_xyz*v57)
    S_xxxzz     = -(S_xxxxx + S_xxxyy)
    v435        = M_xx*S_xxxzz
    v511        = M_yy*S_xxxzz
    v592        = M_xy*S_xxxzz
    v708        = M_xz*S_xxxzz
    v792        = M_yz*S_xxxzz
    v870        = 0.34965034965035d0*v708
    v923        = M_xxx*S_xxxzz
    v1006       = M_xyy*S_xxxzz
    v1164       = M_xxy*S_xxxzz
    v1223       = M_yyy*S_xxxzz
    v1318       = M_xxz*S_xxxzz
    v1398       = M_yyz*S_xxxzz
    v1534       = M_xyz*S_xxxzz
    S_xxyyy     = y*(-v10*v12 + v107 + v184)
    v482        = M_xy*S_xxyyy
    v546        = M_xx*S_xxyyy
    v608        = M_yy*S_xxyyy
    v738        = M_yz*S_xxyyy
    v829        = M_xz*S_xxyyy
    v967        = M_xxy*S_xxyyy
    v1036       = M_yyy*S_xxyyy
    v1118       = M_xxx*S_xxyyy
    v1187       = M_xyy*S_xxyyy
    v1362       = M_xyz*S_xxyyy
    v1506       = M_xxz*S_xxyyy
    v1575       = M_yyz*S_xxyyy
    Ms_xxyyy    = Ms_xxyyy + (M_0*S_xxyyy + v112 + 0.0158730158730159d0*(57.0d0*M_xxyyy + 141.0d0*v120 &
      - 17.0d0*v132 + 112.0d0*v185 - 14.0d0*v186 - 3.0d0*(M_xxxxy + &
      v116) + 75.0d0*(v114 + v130) + 159.0d0*(v119 + v128) + 276.0d0*( &
      v124 + v125) - 60.0d0*(v113 + v118 + v126 + v127) - 18.0d0*(v129 &
      + v131 + v133 + v135) - 42.0d0*(v115 + v117 + v121 + v122 + v123 &
      + v134)))
    S_xxyyz     = z*(0.0158730158730159d0*v32 + v162 + v184)
    v505        = M_xz*S_xxyyz
    v633        = M_yz*S_xxyyz
    v644        = M_xx*S_xxyyz
    v712        = M_yy*S_xxyyz
    v775        = M_xy*S_xxyyz
    v992        = M_xxz*S_xxyyz
    v1063       = M_yyz*S_xxyyz
    v1099       = M_xyz*S_xxyyz
    v1253       = M_xxx*S_xxyyz
    v1333       = M_xyy*S_xxyyz
    v1480       = M_xxy*S_xxyyz
    v1547       = M_yyy*S_xxyyz
    Ms_xxyyz    = Ms_xxyyz + (0.0158730158730159d0*(63.0d0*M_0*S_xxyyz + 61.0d0*M_xxyyz + 204.0d0*( &
      v138 + v139) + 9.0d0*(v145 + v157) + 112.0d0*(v148 + v187) + &
      6.0d0*(v144 + v152 + v156 + v161) + 132.0d0*(v147 + v151 + v153 + &
      v160) + 81.0d0*(v136 + v143 + v150 + v154 + v158) - (M_xxxxz + &
      M_xxzzz + M_yyyyz + M_yyzzz + 5.0d0*v137 + 5.0d0*v140 + 6.0d0* &
      v142 + 14.0d0*v146 + 6.0d0*v149 + 6.0d0*v155 + 6.0d0*v159 + &
      14.0d0*v188)))
    S_xxyzz     = -(S_xxxxy + S_xxyyy)
    v483        = M_xy*S_xxyzz
    v547        = M_xx*S_xxyzz
    v609        = M_yy*S_xxyzz
    v739        = M_yz*S_xxyzz
    v740        = 0.34965034965035d0*v739
    v785        = M_xz*S_xxyzz
    v968        = M_xxy*S_xxyzz
    v1037       = M_yyy*S_xxyzz
    v1119       = M_xxx*S_xxyzz
    v1188       = M_xyy*S_xxyzz
    v1363       = M_xyz*S_xxyzz
    v1507       = M_xxz*S_xxyzz
    v1576       = M_yyz*S_xxyzz
    S_xxzzz     = -(S_xxxxz + S_xxyyz)
    v506        = M_xz*S_xxzzz
    v539        = M_yz*S_xxzzz
    v645        = M_xx*S_xxzzz
    v713        = M_yy*S_xxzzz
    v776        = M_xy*S_xxzzz
    v993        = M_xxz*S_xxzzz
    v1064       = M_yyz*S_xxzzz
    v1100       = M_xyz*S_xxzzz
    v1254       = M_xxx*S_xxzzz
    v1334       = M_xyy*S_xxzzz
    v1481       = M_xxy*S_xxzzz
    v1548       = M_yyy*S_xxzzz
    S_xyyyy     = v189*x
    v436        = M_xx*S_xyyyy
    v512        = M_yy*S_xyyyy
    v593        = M_xy*S_xyyyy
    v709        = M_xz*S_xyyyy
    v842        = M_yz*S_xyyyy
    v924        = M_xxx*S_xyyyy
    v1007       = M_xyy*S_xyyyy
    v1165       = M_xxy*S_xyyyy
    v1224       = M_yyy*S_xyyyy
    v1319       = M_xxz*S_xyyyy
    v1399       = M_yyz*S_xyyyy
    v1607       = M_xyz*S_xyyyy
    Ms_xyyyy    = Ms_xyyyy + (M_0*S_xyyyy + v163 + 0.0476190476190476d0*(20.0d0*(M_xyyyy + v104) + &
      4.0d0*(v102 + v89) + 78.0d0*(v103 + v99) + 56.0d0*(v164 + v165 + &
      v168) + 8.0d0*(v101 + v86 + v88 + v95) - (2.0d0*M_xxxyy + 48.0d0* &
      v100 + 48.0d0*v106 + 28.0d0*v166 + 28.0d0*v167 + 28.0d0*v169 + &
      24.0d0*v87 + v90 + 48.0d0*v93 + 30.0d0*v94 + 48.0d0*v97 + 24.0d0* &
      v98)))
    S_xyyyz     = v15*v9
    v761        = M_yz*S_xyyyz
    v762        = 0.839160839160839d0*v761
    v763        = M_xx*S_xyyyz
    v831        = M_yy*S_xyyyz
    v856        = M_xz*S_xyyyz
    v867        = M_xy*S_xyyyz
    v1177       = M_xxz*S_xyyyz
    v1240       = M_yyz*S_xyyyz
    v1303       = M_xxy*S_xyyyz
    v1381       = M_yyy*S_xyyyz
    v1419       = M_xyz*S_xyyyz
    v1420       = 3.35664335664336d0*v1419
    v1443       = M_xxx*S_xyyyz
    v1520       = M_xyy*S_xyyyz
    Ms_xyyyz    = Ms_xyyyz + (0.333333333333333d0*(9.0d0*M_yy*S_xyz + 7.0d0*(v176 + v178 + v182) + &
      5.0d0*(v177 + v180 + v181) + 2.0d0*(v170 + v171 - v173 - v174 - &
      v175 + v183)) + M_0*S_xyyyz + M_xyy*v83 + M_xyyyz + M_yyyz*x + &
      S_xyy*v84 + S_yy*v179)
    S_xyyzz     = -(S_xxxyy + S_xyyyy)
    v437        = M_xx*S_xyyzz
    v513        = M_yy*S_xyyzz
    v594        = M_xy*S_xyyzz
    v710        = M_xz*S_xyyzz
    v793        = M_yz*S_xyyzz
    v871        = 0.34965034965035d0*v710
    v925        = M_xxx*S_xyyzz
    v1008       = M_xyy*S_xyyzz
    v1166       = M_xxy*S_xyyzz
    v1225       = M_yyy*S_xyyzz
    v1320       = M_xxz*S_xyyzz
    v1400       = M_yyz*S_xyyzz
    v1535       = M_xyz*S_xyyzz
    S_xyzzz     = -(S_xxxyz + S_xyyyz)
    S_xzzzz     = -(S_xxxzz + S_xyyzz)
    S_yyyyy     = y*(0.111111111111111d0*(-10.0d0*v82) + v81 + v85)
    v484        = M_xy*S_yyyyy
    v548        = M_xx*S_yyyyy
    v610        = M_yy*S_yyyyy
    v741        = M_yz*S_yyyyy
    v830        = M_xz*S_yyyyy
    v969        = M_xxy*S_yyyyy
    v1038       = M_yyy*S_yyyyy
    v1120       = M_xxx*S_yyyyy
    v1189       = M_xyy*S_yyyyy
    v1364       = M_xyz*S_yyyyy
    v1508       = M_xxz*S_yyyyy
    v1577       = M_yyz*S_yyyyy
    Ms_yyyyy    = Ms_yyyyy + (0.0158730158730159d0*(63.0d0*M_0*S_yyyyy + 48.0d0*M_yyyyy + 160.0d0*v132 &
      - 30.0d0*(M_xxyyy + v120) + 330.0d0*(v129 + v131) - 140.0d0*(v185 &
      + v186) + 120.0d0*(v113 + v118 + v126 + v127) + 60.0d0*(v114 + &
      v119 + v128 + v130) - 300.0d0*(v124 + v125 + v133 + v135) - &
      15.0d0*(M_xxxxy + M_xxyzz + M_yyyzz + v110 + v111 + v116)))
    S_yyyyz     = v189*z
    v507        = M_xz*S_yyyyz
    v634        = M_yz*S_yyyyz
    v635        = M_yy*S_yyyyz
    v636        = -0.20979020979021d0*v635
    v1628       = v636 + v638
    v646        = M_xx*S_yyyyz
    v817        = M_xy*S_yyyyz
    v994        = M_xxz*S_yyyyz
    v1065       = M_yyz*S_yyyyz
    v1212       = M_xyz*S_yyyyz
    v1255       = M_xxx*S_yyyyz
    v1335       = M_xyy*S_yyyyz
    v1482       = M_xxy*S_yyyyz
    v1549       = M_yyy*S_yyyyz
    Ms_yyyyz    = Ms_yyyyz + (M_0*S_yyyyz + v141 + 0.0476190476190476d0*(20.0d0*M_yyyyz + 44.0d0*v157 &
      + 56.0d0*v188 + 8.0d0*(v142 + v149) + 32.0d0*(v143 + v158) + &
      48.0d0*(v147 + v160) + 4.0d0*(v150 + v154) + 106.0d0*(v155 + v159 &
      ) + 104.0d0*(v156 + v161) - (M_xxxxz + 8.0d0*v144 + 5.0d0*v145 + &
      36.0d0*v151 + 8.0d0*v152 + 36.0d0*v153 + 28.0d0*v187)))
    S_yyyzz     = -(S_xxyyy + S_yyyyy)
    v485        = M_xy*S_yyyzz
    v549        = M_xx*S_yyyzz
    v611        = M_yy*S_yyyzz
    v742        = M_yz*S_yyyzz
    v743        = 0.34965034965035d0*v742
    v786        = M_xz*S_yyyzz
    v970        = M_xxy*S_yyyzz
    v1039       = M_yyy*S_yyyzz
    v1121       = M_xxx*S_yyyzz
    v1190       = M_xyy*S_yyyzz
    v1365       = M_xyz*S_yyyzz
    v1509       = M_xxz*S_yyyzz
    v1578       = M_yyz*S_yyyzz
    S_yyzzz     = -(S_xxyyz + S_yyyyz)
    v508        = M_xz*S_yyzzz
    v540        = M_yz*S_yyzzz
    v541        = 0.00233100233100233d0*(-75.0d0*v532 + 5.0d0*(v1622 + 6.0d0*v533 + 6.0d0* &
      v534 + v535 + 6.0d0*v536 + 6.0d0*v537 + v538 + 6.0d0*v539 + 6.0d0 &
      *v540))
    v647        = M_xx*S_yyzzz
    v714        = M_yy*S_yyzzz
    v751        = 0.00233100233100233d0*(-75.0d0*v750 + 5.0d0*(v1621 + 6.0d0*v466 + 6.0d0* &
      v479 + v480 + 6.0d0*v502 + 6.0d0*v506 + 6.0d0*v508 + 6.0d0*v527 + &
      v528))
    v777        = M_xy*S_yyzzz
    v794        = 0.00699300699300699d0*(-30.0d0*M_xxxyyyz + 70.0d0*v764 + 5.0d0*(-3.0d0* &
      M_xxxyzzz - 3.0d0*M_xyyyzzz + 12.0d0*v763 + 12.0d0*v765 - 15.0d0* &
      v766 - 15.0d0*v767 - 3.0d0*v768 - 54.0d0*v769 - 114.0d0*v770 - &
      15.0d0*v771 - 3.0d0*v772 - 15.0d0*v773 - 3.0d0*v774 - 114.0d0* &
      v775 - 3.0d0*v776 - 3.0d0*v777 + 12.0d0*v778 - 15.0d0*v779 - &
      15.0d0*v780 - 3.0d0*v781 - 54.0d0*v782 - 15.0d0*v783 - 15.0d0* &
      v784 - 15.0d0*v785 - 15.0d0*v786 + 12.0d0*v787 - 15.0d0*v788 - &
      3.0d0*v789 - 15.0d0*v790 - 3.0d0*v791 - 15.0d0*v792 - 15.0d0*v793 &
      ))
    v995        = M_xxz*S_yyzzz
    v1066       = M_yyz*S_yyzzz
    v1101       = M_xyz*S_yyzzz
    v1256       = M_xxx*S_yyzzz
    v1336       = M_xyy*S_yyzzz
    v1483       = M_xxy*S_yyzzz
    v1550       = M_yyy*S_yyzzz
    S_yzzzz     = -(S_xxyzz + S_yyyzz)
    S_zzzzz     = -(S_xxzzz + S_yyzzz)
    S_xxxxxx    = v190 + v192 + 0.0909090909090909d0*(-15.0d0*v193 + 5.0d0*v194)
    v912        = M_xx*S_xxxxxx
    v1027       = M_yy*S_xxxxxx
    v1180       = M_xy*S_xxxxxx
    v1366       = M_xz*S_xxxxxx
    v1583       = M_yz*S_xxxxxx
    Ms_xxxxxx   = Ms_xxxxxx + (M_0*S_xxxxxx + M_yyyyz*v197 + v200 + 0.00432900432900433d0*(136.0d0* &
      M_xxxxxx - 75.0d0*M_xxyyyy + 10.0d0*M_yyyyyy + 15.0d0*M_yyyyzz + &
      2360.0d0*v206 + 576.0d0*v210 - 2340.0d0*v217 - 2260.0d0*v224 + &
      1440.0d0*v229 + 1620.0d0*(v201 + v208) - 600.0d0*(v211 + v212) - &
      120.0d0*(v218 + v238) + 840.0d0*(v222 + v247) - 160.0d0*(v239 + &
      v244) + 90.0d0*(-M_xxxxzz + v202 + v219) + 360.0d0*(v209 - v214 + &
      v233) + 30.0d0*(v223 + v242 + v243) - 180.0d0*(M_xxxxyy + v216 + &
      v230 + v231) + 720.0d0*(v207 + v220 + v228 + v234) - 1680.0d0*( &
      v213 + v215 + v227 + v232) - 165.0d0*(v203 + v204 + v205 + v225 + &
      v240 + v245) + 60.0d0*(v221 - v226 - v235 - v236 - v237 - v241 - &
      v246)))
    S_xxxxxy    = v249*v6
    v1002       = M_xy*S_xxxxxy
    v1112       = M_xx*S_xxxxxy
    v1216       = M_yy*S_xxxxxy
    v1407       = M_yz*S_xxxxxy
    v1536       = M_xz*S_xxxxxy
    Ms_xxxxxy   = Ms_xxxxxy + (M_0*S_xxxxxy + v264 - v274*z + 0.0303030303030303d0*(-70.0d0*v273 - &
      10.0d0*v277 + 28.0d0*(M_xxxxxy + v269) + 20.0d0*(v266 + v283) - &
      60.0d0*(v275 + v296) + 100.0d0*(v268 + v270 + v280) + 190.0d0*( &
      v265 + v267 + v271 + v276) - 140.0d0*(v278 + v279 + v287 + v289) &
      - 5.0d0*(M_xyyyyy + v281 + v285 + v293 + v294) + 40.0d0*(-v272 + &
      v282 + v284 + v286 + v288 - v290 + v291 + v292 + v295 + v297)))
    S_xxxxxz    = v249*v7
    v1022       = M_xz*S_xxxxxz
    v1243       = M_yz*S_xxxxxz
    v1247       = M_xx*S_xxxxxz
    v1375       = M_yy*S_xxxxxz
    v1514       = M_xy*S_xxxxxz
    Ms_xxxxxz   = Ms_xxxxxz + (M_0*S_xxxxxz + M_xxz*v316 + S_xxz*v300 - v307 - v312 - v329 + &
      0.0303030303030303d0*(28.0d0*M_xxxxxz + 68.0d0*v303 + 250.0d0*( &
      v298 + v308) + 220.0d0*(v302 + v331) + 80.0d0*(v309 + v336) + &
      90.0d0*(v313 + v332) - 140.0d0*(v315 + v320) + 160.0d0*(v317 + &
      v321) + 10890.0d0*(-M_xxxyyz + v306 - v314) + 100.0d0*(v304 - &
      v305 - v345) + 20.0d0*(v299 + v301 + v325 + v341) - 5.0d0*( &
      M_xxxzzz + M_xyyyyz + M_xyyzzz + v319 + v340 + v344) + 40.0d0*( &
      v322 - v323 + v326 - v330 + v337 - v338 + v342 - v346) - 25.0d0*( &
      v310 + v318 + v324 + v327 + v333 + v334 + v335 + v339 + v343)))
    S_xxxxyy    = 0.0303030303030303d0*(-3.0d0*v193 + 2.0d0*v194) + v11*v350 + v348 + v349
    v913        = M_xx*S_xxxxyy
    v1028       = M_yy*S_xxxxyy
    v1181       = M_xy*S_xxxxyy
    v1367       = M_xz*S_xxxxyy
    v1584       = M_yz*S_xxxxyy
    Ms_xxxxyy   = Ms_xxxxyy + (M_0*S_xxxxyy + v351 - v352 - v356 + v359 + v361 + v362*(M_yyyyz + v0) + &
      0.00432900432900433d0*(-12.0d0*M_xxxxxx + 202.0d0*M_xxxxyy - &
      11.0d0*M_xxxxzz - 5.0d0*M_yyyyyy - 4.0d0*M_yyyyzz - 64.0d0*v210 + &
      412.0d0*v211 - 36.0d0*v212 + 628.0d0*v214 + 1800.0d0*v217 - &
      720.0d0*v229 - 82.0d0*(v201 + v208) + 942.0d0*(v202 + v219) + &
      2.0d0*(v204 + v240) - 60.0d0*(v206 + v224) + 760.0d0*(v207 + v228 &
      ) + 1288.0d0*(v213 + v227) - 220.0d0*(v218 + v238) - 402.0d0*( &
      v220 + v234) - 392.0d0*(v222 + v247) + 37.0d0*(v236 + v241) + &
      80.0d0*(v239 + v244) + 268.0d0*(v209 - v221 + v233) - 8.0d0*(v223 &
      + v242 + v243) - 22.0d0*(M_xxyyyy + v216 + v230 + v231) - 26.0d0* &
      (v203 + v205 + v225 + v245) - 19.0d0*(v226 + v235 + v237 + v246) &
      - 448.0d0*(v353 + v354 + v355 + v357)))
    S_xxxxyz    = v8*(-v347 + v31 + v350)
    v1073       = M_yz*S_xxxxyz
    v1213       = M_xz*S_xxxxyz
    v1327       = M_xy*S_xxxxyz
    v1437       = M_xx*S_xxxxyz
    v1541       = M_yy*S_xxxxyz
    Ms_xxxxyz   = Ms_xxxxyz + (M_0*S_xxxxyz + v371 + 0.0303030303030303d0*(26.0d0*v384 + 32.0d0*( &
      M_xxxxyz + v377) + 40.0d0*(v389 + v399) + 8.0d0*(v398 + v404) + &
      96.0d0*(v379 + v380 + v390) + 170.0d0*(v372 + v381 + v386 + v388 &
      ) + 4.0d0*(v373 + v387 + v397 + v403) + 160.0d0*(v374 + v378 + &
      v394 + v395) + 64.0d0*(v375 + v376 + v392 + v396 + v406) - (2.0d0 &
      *M_xxyyyz + 40.0d0*v382 + 18.0d0*v383 + 38.0d0*v385 + 64.0d0*v391 &
      + 64.0d0*v393 + 13.0d0*v400 + 5.0d0*v401 + v402 + 40.0d0*v405 + &
      18.0d0*v407 + 13.0d0*v408)))
    S_xxxxzz    = -(S_xxxxxx + S_xxxxyy)
    v914        = M_xx*S_xxxxzz
    v1029       = M_yy*S_xxxxzz
    v1182       = M_xy*S_xxxxzz
    v1368       = M_xz*S_xxxxzz
    v1585       = M_yz*S_xxxxzz
    S_xxxyyy    = v6*(0.0909090909090909d0*v32 + v409 + v410 + v67)
    v900        = M_xy*S_xxxyyy
    v1113       = M_xx*S_xxxyyy
    v1217       = M_yy*S_xxxyyy
    v1408       = M_yz*S_xxxyyy
    v1537       = M_xz*S_xxxyyy
    Ms_xxxyyy   = Ms_xxxyyy + (0.0909090909090909d0*(11.0d0*M_0*S_xxxyyy + 9.0d0*M_xxxyyy + 15.0d0*( &
      v250 + v261) + 75.0d0*(v252 + v259) + 69.0d0*(v253 + v256) + &
      25.0d0*(v273 + v277) + 31.0d0*(v266 + v272 + v283 + v290) - ( &
      M_xxxxxy + 11.0d0*M_xxxyz*v411 + M_xxxyzz + M_xyyyyy + 11.0d0* &
      M_xyyyz*v411 + M_xyyyzz + v251 + v254 + v255 + v257 + v258 + v260 &
      + v262 + v263 + 10.0d0*v265 + 10.0d0*v267 + 7.0d0*v268 + v269 + &
      7.0d0*v270 + 10.0d0*v271 + 6.0d0*v275 + 10.0d0*v276 + 10.0d0*v278 &
      + 10.0d0*v279 + 7.0d0*v280 + 7.0d0*v281 + 10.0d0*v282 + 10.0d0* &
      v284 + 7.0d0*v285 + 10.0d0*v286 + 10.0d0*v287 + 10.0d0*v288 + &
      10.0d0*v289 + 10.0d0*v291 + 10.0d0*v292 + 7.0d0*v293 + v294 + &
      10.0d0*v295 + 6.0d0*v296 + 10.0d0*v297 + 6.0d0*v412 + 6.0d0*v413 &
      )))
    S_xxxyyz    = v7*(0.0909090909090909d0*(-v34) + v410 + v414)
    v1023       = M_xz*S_xxxyyz
    v1244       = M_yz*S_xxxyyz
    v1248       = M_xx*S_xxxyyz
    v1376       = M_yy*S_xxxyyz
    v1515       = M_xy*S_xxxyyz
    Ms_xxxyyz   = Ms_xxxyyz + (M_0*S_xxxyyz + M_xxyy*v172 + S_xxyy*v62 + v307 + v312 + v329 + v415 + &
      0.0303030303030303d0*(31.0d0*M_xxxyyz + v303 + 47.0d0*v306 + &
      79.0d0*v314 + 103.0d0*(v299 + v325) + 55.0d0*(v301 + v341) + &
      88.0d0*(v305 + v345) + 43.0d0*(v309 + v336) + 152.0d0*(v315 + &
      v320) + 95.0d0*(v317 + v321) + 13.0d0*(v324 + v334 + v339) + &
      10.0d0*(v323 + v330 + v338 + v346) - (M_xyyyyz + 4.0d0*v298 + &
      v302 + 7.0d0*v304 + 4.0d0*v308 + 10.0d0*v322 + 10.0d0*v326 + v331 &
      + 10.0d0*v337 + v340 + 10.0d0*v342 + 18.0d0*v416 + 18.0d0*v417 + &
      18.0d0*v418)))
    S_xxxyzz    = -(S_xxxxxy + S_xxxyyy)
    v901        = M_xy*S_xxxyzz
    v1114       = M_xx*S_xxxyzz
    v1218       = M_yy*S_xxxyzz
    v1409       = M_yz*S_xxxyzz
    v1538       = M_xz*S_xxxyzz
    S_xxxzzz    = -(S_xxxxxz + S_xxxyyz)
    v1024       = M_xz*S_xxxzzz
    v1109       = M_yz*S_xxxzzz
    v1249       = M_xx*S_xxxzzz
    v1377       = M_yy*S_xxxzzz
    v1516       = M_xy*S_xxxzzz
    S_xxyyyy    = 0.0303030303030303d0*(-3.0d0*v419 + 2.0d0*v421) + v10*v350 + v348 + v420
    v915        = M_xx*S_xxyyyy
    v1030       = M_yy*S_xxyyyy
    v1183       = M_xy*S_xxyyyy
    v1369       = M_xz*S_xxyyyy
    v1586       = M_yz*S_xxyyyy
    Ms_xxyyyy   = Ms_xxyyyy + (M_0*S_xxyyyy + v351 + v352 + v356 - v359 - v361 + v362*(M_xxxxz + v0) + &
      0.00432900432900433d0*(-5.0d0*M_xxxxxx - 4.0d0*M_xxxxzz + 202.0d0 &
      *M_xxyyyy - 12.0d0*M_yyyyyy - 11.0d0*M_yyyyzz - 720.0d0*v217 + &
      628.0d0*v221 + 1800.0d0*v229 + 412.0d0*v230 - 64.0d0*v242 - &
      36.0d0*v422 + 37.0d0*(v201 + v208) - 402.0d0*(v202 + v219) + &
      80.0d0*(v206 + v224) - 220.0d0*(v207 + v228) + 2.0d0*(v209 + v233 &
      ) + 760.0d0*(v218 + v238) + 942.0d0*(v220 + v234) - 82.0d0*(v236 &
      + v241) - 60.0d0*(v239 + v244) + 1288.0d0*(v353 + v354) - 392.0d0 &
      *(v355 + v357) + 268.0d0*(v204 - v214 + v240) - 8.0d0*(v210 + &
      v216 + v231) - 22.0d0*(M_xxxxyy + v211 + v223 + v243) - 19.0d0*( &
      v203 + v205 + v225 + v245) - 448.0d0*(v213 + v222 + v227 + v247) &
      - 26.0d0*(v226 + v235 + v237 + v246)))
    S_xxyyyz    = v8*(0.0909090909090909d0*(-v82) + v409 + v414)
    v1074       = M_yz*S_xxyyyz
    v1214       = M_xz*S_xxyyyz
    v1328       = M_xy*S_xxyyyz
    v1438       = M_xx*S_xxyyyz
    v1542       = M_yy*S_xxyyyz
    Ms_xxyyyz   = Ms_xxyyyz + (M_0*S_xxyyyz + v371 + v423 + v425 + v426 + 0.0303030303030303d0*(31.0d0* &
      M_xxyyyz + 47.0d0*v384 + 79.0d0*v385 + v401 + 43.0d0*(v373 + v403 &
      ) + 95.0d0*(v382 + v405) + 99.0d0*(v383 + v407) + 103.0d0*(v387 + &
      v397) + 55.0d0*(v389 + v399) + 152.0d0*(v391 + v393) + 88.0d0*( &
      v392 + v396) + 13.0d0*(v375 + v376 + v406) + 10.0d0*(v374 + v378 &
      + v394 + v395) - (M_xxxxyz + 10.0d0*v372 + v377 + 18.0d0*v379 + &
      18.0d0*v380 + 10.0d0*v381 + 10.0d0*v386 + 10.0d0*v388 + 18.0d0* &
      v390 + 4.0d0*v398 + v400 + 7.0d0*v402 + 4.0d0*v404 + v408)))
    S_xxyyzz    = -(S_xxxxyy + S_xxyyyy)
    v916        = M_xx*S_xxyyzz
    v1031       = M_yy*S_xxyyzz
    v1092       = M_xy*S_xxyyzz
    v1370       = M_xz*S_xxyyzz
    v1433       = M_yz*S_xxyyzz
    S_xxyzzz    = -(S_xxxxyz + S_xxyyyz)
    v1075       = M_yz*S_xxyzzz
    v1102       = M_xz*S_xxyzzz
    v1329       = M_xy*S_xxyzzz
    v1439       = M_xx*S_xxyzzz
    v1543       = M_yy*S_xxyzzz
    S_xxzzzz    = -(S_xxxxzz + S_xxyyzz)
    v917        = M_xx*S_xxzzzz
    v1032       = M_yy*S_xxzzzz
    v1093       = M_xy*S_xxzzzz
    v1371       = M_xz*S_xxzzzz
    v1434       = M_yz*S_xxzzzz
    S_xyyyyy    = v427*v6
    v1003       = M_xy*S_xyyyyy
    v1115       = M_xx*S_xyyyyy
    v1219       = M_yy*S_xyyyyy
    v1410       = M_yz*S_xyyyyy
    v1539       = M_xz*S_xyyyyy
    Ms_xyyyyy   = Ms_xyyyyy + (M_0*S_xyyyyy + v264 - v424*z + 0.0303030303030303d0*(-10.0d0*v273 - &
      70.0d0*v277 + 28.0d0*(M_xyyyyy + v294) + 20.0d0*(v272 + v290) - &
      60.0d0*(v412 + v413) + 100.0d0*(v281 + v285 + v293) + 190.0d0*( &
      v282 + v284 + v291 + v292) - 140.0d0*(v286 + v288 + v295 + v297) &
      - 5.0d0*(M_xxxxxy + v268 + v269 + v270 + v280) + 40.0d0*(v265 - &
      v266 + v267 + v271 + v276 + v278 + v279 - v283 + v287 + v289)))
    S_xyyyyz    = v7*(0.0909090909090909d0*(-6.0d0*v82) + v350 + v81)
    v1025       = M_xz*S_xyyyyz
    v1245       = M_yz*S_xyyyyz
    v1250       = M_xx*S_xyyyyz
    v1378       = M_yy*S_xyyyyz
    v1517       = M_xy*S_xyyyyz
    Ms_xyyyyz   = Ms_xyyyyz + (M_0*S_xyyyyz + v415 + 0.0303030303030303d0*(26.0d0*v306 + 32.0d0*( &
      M_xyyyyz + v340) + 8.0d0*(v298 + v308) + 40.0d0*(v301 + v341) + &
      96.0d0*(v416 + v417 + v418) + 4.0d0*(v299 + v309 + v325 + v336) + &
      170.0d0*(v322 + v326 + v337 + v342) + 160.0d0*(v323 + v330 + v338 &
      + v346) + 64.0d0*(v305 + v324 + v334 + v339 + v345) - (2.0d0* &
      M_xxxyyz + 13.0d0*v302 + 5.0d0*v303 + v304 + 18.0d0*v313 + 38.0d0 &
      *v314 + 64.0d0*v315 + 40.0d0*v317 + 64.0d0*v320 + 40.0d0*v321 + &
      13.0d0*v331 + 18.0d0*v332)))
    S_xyyyzz    = -(S_xxxyyy + S_xyyyyy)
    v902        = M_xy*S_xyyyzz
    v911        = 0.000777000777000777d0*(33768.0d0*v892 + 7.0d0*(v1627 - 576.0d0*v887 + &
      192.0d0*v888 - 1536.0d0*v889 + 768.0d0*v890 + 384.0d0*v891 - &
      324.0d0*v893 - 324.0d0*v894 - 324.0d0*v896 + 768.0d0*v900 + &
      384.0d0*v901 + 384.0d0*v902 - 1536.0d0*v903 + 192.0d0*v904 + &
      384.0d0*v905 - 576.0d0*v906 - 324.0d0*v907))
    v1116       = M_xx*S_xyyyzz
    v1220       = M_yy*S_xyyyzz
    v1411       = M_yz*S_xyyyzz
    v1416       = 0.000777000777000777d0*(-495.0d0*M_xxxxyyyy + v1627 - 20124.0d0*v892 + &
      711.0d0*(v887 + v906) - 402.0d0*(v888 + v904) - 4704.0d0*(v889 + &
      v903) - 9528.0d0*(v890 + v900) - 804.0d0*(v891 + v901 + v902 + &
      v905) - 621.0d0*(v893 + v894 + v896 + v907))
    v1540       = M_xz*S_xyyyzz
    S_xyyzzz    = -(S_xxxyyz + S_xyyyyz)
    v1026       = M_xz*S_xyyzzz
    v1110       = M_yz*S_xyyzzz
    v1251       = M_xx*S_xyyzzz
    v1379       = M_yy*S_xyyzzz
    v1518       = M_xy*S_xyyzzz
    S_xyzzzz    = -(S_xxxyzz + S_xyyyzz)
    S_xzzzzz    = -(S_xxxzzz + S_xyyzzz)
    S_yyyyyy    = v192 + v428 + 0.0909090909090909d0*(-15.0d0*v419 + 5.0d0*v421)
    v918        = M_xx*S_yyyyyy
    v1184       = M_xy*S_yyyyyy
    v1372       = M_xz*S_yyyyyy
    v1421       = M_yy*S_yyyyyy
    v1587       = M_yz*S_yyyyyy
    Ms_yyyyyy   = Ms_yyyyyy + (M_0*S_yyyyyy + v200 + 0.00432900432900433d0*(10.0d0*M_xxxxxx - 75.0d0* &
      M_xxxxyy + 15.0d0*M_xxxxzz + 136.0d0*M_yyyyyy + 1440.0d0*v217 - &
      2340.0d0*v229 + 2360.0d0*v239 + 576.0d0*v242 - 2260.0d0*v244 - &
      160.0d0*(v206 + v224) - 120.0d0*(v207 + v228) - 600.0d0*(v230 + &
      v422) + 1620.0d0*(v236 + v241) + 840.0d0*(v355 + v357) + 90.0d0*( &
      -M_yyyyzz + v220 + v234) + 360.0d0*(v204 - v221 + v240) - 180.0d0 &
      *(M_xxyyyy + v211 + v223 + v243) + 720.0d0*(v202 + v218 + v219 + &
      v238) + 30.0d0*(v210 + v212 + v216 + v231) - 1680.0d0*(v353 + &
      v354 + v358 + v360) - 165.0d0*(v209 + v226 + v233 + v235 + v237 + &
      v246) + 60.0d0*(-v201 - v203 - v205 - v208 + v214 - v225 - v245)))
    S_yyyyyz    = v427*v8
    v1076       = M_yz*S_yyyyyz
    v1215       = M_xz*S_yyyyyz
    v1330       = M_xy*S_yyyyyz
    v1440       = M_xx*S_yyyyyz
    v1544       = M_yy*S_yyyyyz
    Ms_yyyyyz   = Ms_yyyyyz + (M_0*S_yyyyyz + M_yyy*v429 + M_yyz*v430 - v423 - v425 - v426 + &
      0.0303030303030303d0*(28.0d0*M_yyyyyz + 68.0d0*v401 + 80.0d0*( &
      v373 + v403) + 160.0d0*(v382 + v405) + 90.0d0*(v383 + v407) - &
      140.0d0*(v391 + v393) + 250.0d0*(v398 + v404) + 220.0d0*(v400 + &
      v408) + 10890.0d0*(-M_xxyyyz + v384 - v385) + 100.0d0*(-v392 - &
      v396 + v402) + 20.0d0*(v387 + v389 + v397 + v399) - 5.0d0*( &
      M_xxxxyz + M_xxyzzz + M_yyyzzz + v365 + v368 + v377) + 40.0d0*( &
      v372 - v374 - v378 + v381 + v386 + v388 - v394 - v395) - 25.0d0*( &
      v363 + v364 + v366 + v367 + v369 + v370 + v375 + v376 + v406)))
    S_yyyyzz    = -(S_xxyyyy + S_yyyyyy)
    v919        = M_xx*S_yyyyzz
    v1033       = M_yy*S_yyyyzz
    v1185       = M_xy*S_yyyyzz
    v1373       = M_xz*S_yyyyzz
    v1588       = M_yz*S_yyyyzz
    S_yyyzzz    = -(S_xxyyyz + S_yyyyyz)
    v1077       = M_yz*S_yyyzzz
    v1103       = M_xz*S_yyyzzz
    v1331       = M_xy*S_yyyzzz
    v1441       = M_xx*S_yyyzzz
    v1545       = M_yy*S_yyyzzz
    S_yyzzzz    = -(S_xxyyzz + S_yyyyzz)
    v920        = M_xx*S_yyzzzz
    v1034       = M_yy*S_yyzzzz
    v1094       = M_xy*S_yyzzzz
    v1111       = 0.00699300699300699d0*(-35.0d0*M_xxxyyyzz + 84.0d0*v1080 + 7.0d0*(6.0d0* &
      v1081 - 8.0d0*v1082 + 6.0d0*v1083 + v1084 + 228.0d0*v1085 - &
      15.0d0*v1086 + 208.0d0*v1087 + 6.0d0*v1088 + v1089 + 6.0d0*v1090 &
      + v1091 - 15.0d0*v1092 + v1093 + v1094 + 6.0d0*v1095 + 208.0d0* &
      v1096 + 6.0d0*v1097 + v1098 + 228.0d0*v1099 + 6.0d0*v1100 + 6.0d0 &
      *v1101 + 6.0d0*v1102 + 6.0d0*v1103 - 8.0d0*v1104 + 6.0d0*v1105 + &
      v1106 + 6.0d0*v1107 + v1108 + 6.0d0*v1109 + 6.0d0*v1110 + v1623))
    v1374       = M_xz*S_yyzzzz
    v1435       = M_yz*S_yyzzzz
    v1436       = 0.00699300699300699d0*(-21.0d0*v1426 + v1429 + v1432 + v1625 - 105.0d0*( &
      v1425 + v1433) + 7.0d0*(v1427 + v1428 + v1430 + v1431 + v1434 + &
      v1435))
    v1593       = 0.00233100233100233d0*(-45.0d0*M_xxxyyyzz - 464.0d0*v1080 - 644.0d0*( &
      v1082 + v1104) - 3096.0d0*(v1085 + v1099) - 135.0d0*(v1086 + &
      v1092) - 3276.0d0*(v1087 + v1096) + 9.0d0*(M_xxxyzzzz + &
      M_xyyyzzzz + v1084 + v1089 + v1091 + v1093 + v1094 + v1098 + &
      v1106 + v1108) + 54.0d0*(v1081 + v1083 + v1088 + v1090 + v1095 + &
      v1097 + v1100 + v1101 + v1102 + v1103 + v1105 + v1107 + v1109 + &
      v1110))
    v1598       = 0.00699300699300699d0*(v1326 + v1406 - 21.0d0*v1597 + v1624 - 105.0d0*( &
      v1311 + v1370) + 7.0d0*(v1301 + v1325 + v1360 + v1371 + v1374 + &
      v1405))
    S_yzzzzz    = -(S_xxyzzz + S_yyyzzz)
    S_zzzzzz    = -(S_xxzzzz + S_yyzzzz)
    S_xxxxxxx   = x*(v190 + v431 + 0.00699300699300699d0*(-231.0d0*v193 + 105.0d0*v194))
    Ms_xxxxxxx  = Ms_xxxxxxx + (M_0*S_xxxxxxx + v432 + 0.00233100233100233d0*(184.0d0*M_xxxxxxx + &
      952.0d0*v447 - 1260.0d0*v451 - 630.0d0*v453 - 525.0d0*x*(M_xxyyyy &
      + M_xxyyzz) + 70.0d0*(M_xyyyyyy + v519) + 3444.0d0*(v433 + v445) &
      - 1050.0d0*(v434 + v456) + 6860.0d0*(v438 + v443) + 1470.0d0*( &
      v439 + v469) - 1176.0d0*(v448 + v449) - 7980.0d0*(v454 + v467) + &
      1680.0d0*(v457 + v510) - 7420.0d0*(v462 + v475) + 5040.0d0*(v470 &
      + v487) + 5880.0d0*(v473 + v503) + 105.0d0*(-M_xxxyyyy + &
      M_xyyyyzz + v521) + 35.0d0*(M_xxxzzzz + M_xyyzzzz + v480 + v528) &
      + 2520.0d0*(v444 + v460 + v486 + v529) - 4200.0d0*(v450 + v452 + &
      v481 + v504) - 280.0d0*(v463 + v476 + v498 + v523) - 1120.0d0*( &
      v492 + v499 + v515 + v524) - 1155.0d0*(v435 + v436 + v437 + v464 &
      + v493 + v500) - 735.0d0*(v440 + v441 + v442 + v477 + v516 + v525 &
      ) + 840.0d0*(v446 - v455 - v468 - v491 + v509 - v514) + 420.0d0*( &
      -M_xxxxxyy + v458 + v459 - v465 + v471 + v472 - v478 + v482 - &
      v488 - v489 - v490 - v494 - v501 + v505 - v511 - v512 - v513 - &
      v517 - v526) + 210.0d0*(-M_xxxxxzz + v461 + v466 + v474 + v479 + &
      v483 + v484 + v485 + v495 + v496 + v497 + v502 + v506 + v507 + &
      v508 + v518 + v520 + v522 + v527)))
    S_xxxxxxy   = v531*y
    Ms_xxxxxxy  = Ms_xxxxxxy + (M_0*S_xxxxxxy + v541 - v542 + v543 + v544 + 0.00233100233100233d0*( &
      -105.0d0*M_xxyyyyy + 10.0d0*M_yyyyyyy - 1200.0d0*v559 - 120.0d0* &
      v562 - 45.0d0*y*(M_xxyyyy - M_yyyyzz) + 304.0d0*(M_xxxxxxy + v555 &
      ) + 150.0d0*(v546 + v578) + 4640.0d0*(v550 + v563) - 3870.0d0*( &
      v572 + v576) - 315.0d0*(v574 + v617) + 840.0d0*(v577 + v613) + &
      1020.0d0*(v579 + v608) + 1140.0d0*(v581 + v633) - 3940.0d0*(v582 &
      + v586) + 1040.0d0*(v583 + v628) - 220.0d0*(v615 + v618) - &
      160.0d0*(v625 + v629) + 1344.0d0*(v554 + v556 + v590) + 40.0d0*( &
      -v587 + v621 - v624) - 2880.0d0*(v567 + v569 + v604 + v606) + &
      960.0d0*(v551 - v560 - v561 + v597 - v632) + 480.0d0*(v553 - v558 &
      - v566 - v607 + v612) + 60.0d0*(v580 - v589 - v614 - v616 - v631 &
      ) + 3360.0d0*(v545 + v552 + v557 - v565 + v571 - v591) + 1920.0d0 &
      *(-v564 - v595 + v596 + v598 + v602 + v605) + 30.0d0*(-v585 - &
      v609 - v610 - v611 - v620 + v622 + v623 - v627 + v634) - 240.0d0* &
      (M_xxxxyyy + v568 + v570 + v592 + v593 + v594 + v599 + v600 + &
      v601 + v603) - 195.0d0*(v547 + v548 + v549 + v573 + v575 + v584 + &
      v588 + v619 + v626 + v630)))
    S_xxxxxxz   = v531*z
    Ms_xxxxxxz  = Ms_xxxxxxz + (M_0*S_xxxxxxz + v1628 + v1635 + v641 - v657 + v684 + v723 + v727 + v740 &
      + v743 + 0.00233100233100233d0*(304.0d0*M_xxxxxxz - 105.0d0* &
      M_xxyyyyz + 10.0d0*M_yyyyyyz + 784.0d0*v653 + 1344.0d0*v654 - &
      600.0d0*v661 - 555.0d0*v675 + 40.0d0*v720 + 30.0d0*v745 + &
      4320.0d0*(v643 + v659) + 7520.0d0*(v648 + v666) + 6720.0d0*(v650 &
      + v685) + 3264.0d0*(v652 + v706) + 1440.0d0*(v660 + v711) - &
      4800.0d0*(v662 + v704) - 2880.0d0*(v665 + v694) + 3840.0d0*(v667 &
      + v695) - 5100.0d0*(v670 + v681) + 2970.0d0*(v672 + v686) + &
      1080.0d0*(v673 + v729) - 780.0d0*(v674 + v738) + 900.0d0*(v678 + &
      v712) - 735.0d0*(v688 + v717) - 160.0d0*(v716 + v725) + 150.0d0*( &
      v719 + v741) - 120.0d0*(M_xxxxzzz + v671 + v724) + 960.0d0*(v649 &
      - v658 + v700) + 60.0d0*(v676 + v718 + v731) - 240.0d0*(M_xxxxyyz &
      + v669 + v699 + v703) - 775.0d0*(v687 + v689 + v690 + v733) - &
      100.0d0*(v691 + v730 + v732 + v734) + 480.0d0*(v651 + v663 - v664 &
      + v707 + v728) + 90.0d0*(v644 + v677 - v693 - v713 - v714 - v736 &
      ) - 225.0d0*(v645 + v646 + v647 + v692 + v721 + v735) + 1920.0d0* &
      (-v655 + v696 - v697 + v701 - v705 - v737) - 1200.0d0*(v668 + &
      v682 + v698 + v702 + v708 + v709 + v710 + v715)))
    S_xxxxxyy   = x*(0.00699300699300699d0*(10.0d0*v194) + v11*v747 + v1629 + v349 + v746)
    Ms_xxxxxyy  = Ms_xxxxxyy + (M_0*S_xxxxxyy + v751 - v752 + v753 + v756 + v758 + v760 + v762 + &
      0.00233100233100233d0*(-20.0d0*M_xxxxxxx + 354.0d0*M_xxxxxyy - &
      116.0d0*v447 + 732.0d0*v448 - 36.0d0*v449 + 1350.0d0*v451 - &
      45.0d0*v453 - 780.0d0*v458 - 600.0d0*v459 - 35.0d0*(M_xyyyyyy + &
      v519) - 210.0d0*(v433 + v445) + 2550.0d0*(v434 + v456) - 190.0d0* &
      (v438 + v443) + 2730.0d0*(v439 + v469) + 1620.0d0*(v444 + v486) + &
      444.0d0*(v446 + v509) + 2820.0d0*(v450 + v481) + 5160.0d0*(v454 + &
      v467) - 420.0d0*(v455 + v514) - 1110.0d0*(v457 + v510) - 1080.0d0 &
      *(v460 + v529) - 100.0d0*(v462 + v475) - 700.0d0*(v463 + v523) - &
      1380.0d0*(v468 + v491) - 2790.0d0*(v470 + v487) - 1740.0d0*(v471 &
      + v482) - 1560.0d0*(v472 + v505) - 2760.0d0*(v473 + v503) - &
      1660.0d0*(v476 + v498) + 255.0d0*(v489 + v494 + v512 + v517) + &
      560.0d0*(v492 + v499 + v515 + v524) + 30.0d0*(-M_xyyyyzz + v496 + &
      v507 + v520 - v521) - 120.0d0*(v435 + v437 + v464 + v500 + v754) &
      + 90.0d0*(-M_xxxyyyy - v440 + v441 - v442 - v477 + v516 - v525) - &
      105.0d0*(v465 + v478 + v488 + v490 + v501 + v511 + v513 + v526) + &
      60.0d0*(v436 - v452 - v461 - v474 - v483 - v484 - v485 + v493 - &
      v495 - v497 - v504 - v518 - v522)))
    S_xxxxxyz   = v9*(-v748 + v31 + v747)
    Ms_xxxxxyz  = Ms_xxxxxyz + (M_0*S_xxxxxyz + M_xxyz*v316 + S_xxyz*v300 + v794 + 0.00699300699300699d0 &
      *(-250.0d0*v806 - 30.0d0*v813 + 128.0d0*(M_xxxxxyz + v800) - &
      270.0d0*(v805 + v841) + 390.0d0*(v812 + v829) + 1430.0d0*(M_xxxy* &
      S_xxz + M_xxz*S_xxxy) + 288.0d0*(v798 + v799 + v840) + 480.0d0*( &
      v802 + v803 + v816) - 75.0d0*(v822 + v830 + v834) + 1110.0d0*( &
      v795 + v807 + v808 + v810) + 60.0d0*(v796 + v814 + v818 + v837) + &
      960.0d0*(v797 + v801 + v826 + v828) + 280.0d0*(-v804 + v809 + &
      v832 - v839) + 600.0d0*(-v811 + v815 + v820 - v825) + 120.0d0*( &
      v819 + v824 + v831 + v838) - 195.0d0*(v821 + v827 + v833 + v842) &
      - 15.0d0*(M_xyyyyyz + v817 + v823 + v835 + v836)))
    S_xxxxyyy   = y*(v1630 + v847 + 0.00699300699300699d0*(-33.0d0*v193 + 18.0d0*v194))
    Ms_xxxxyyy  = Ms_xxxxyyy + (M_0*S_xxxxyyy + v849 + 0.00699300699300699d0*(110.0d0*M_xxxxyyy + &
      M_xxyzzzz + M_yyyzzzz + v535 + v538 + 330.0d0*v559 + 380.0d0*v566 &
      + 630.0d0*(v546 + v578) + 560.0d0*(v551 + v597) + 200.0d0*(v553 + &
      v612) + 420.0d0*(v558 + v607) + 1320.0d0*(v564 + v595) + 1140.0d0 &
      *(v565 + v591) + 1710.0d0*(v572 + v576) + 9.0d0*(v610 + v620) + &
      25.0d0*(v615 + v618) + 30.0d0*(v623 + v634) + 40.0d0*(v625 + v629 &
      ) + 6.0d0*(v533 + v534 + v536 + v537 + v539 + v540 + v622) - ( &
      16.0d0*M_xxxxxxy + 15.0d0*M_xxxxyzz + 18.0d0*M_xxyyyyy + &
      M_yyyyyyy + 15.0d0*v532 + 150.0d0*v545 + 30.0d0*v547 + 18.0d0* &
      v548 + 30.0d0*v549 + 140.0d0*v550 + 150.0d0*v552 + 96.0d0*v554 + &
      16.0d0*v555 + 96.0d0*v556 + 150.0d0*v557 + 60.0d0*v560 + 60.0d0* &
      v561 + 15.0d0*v562 + 140.0d0*v563 + 30.0d0*v568 + 30.0d0*v570 + &
      150.0d0*v571 + 30.0d0*v573 + 150.0d0*v574 + 30.0d0*v575 + 270.0d0 &
      *v577 + 270.0d0*v579 + 120.0d0*v580 + 240.0d0*v581 + 140.0d0*v582 &
      + 260.0d0*v583 + 30.0d0*v584 + 15.0d0*v585 + 140.0d0*v586 + &
      140.0d0*v587 + 30.0d0*v588 + 15.0d0*v589 + 96.0d0*v590 + 30.0d0* &
      v592 + 270.0d0*v593 + 30.0d0*v594 + 480.0d0*v596 + 480.0d0*v598 + &
      270.0d0*v599 + 30.0d0*v600 + 30.0d0*v601 + 480.0d0*v602 + 30.0d0* &
      v603 + 480.0d0*v605 + 270.0d0*v608 + 15.0d0*v609 + 15.0d0*v611 + &
      270.0d0*v613 + 15.0d0*v614 + 15.0d0*v616 + 150.0d0*v617 + 18.0d0* &
      v619 + v621 + 140.0d0*v624 + 30.0d0*v626 + 15.0d0*v627 + 260.0d0* &
      v628 + 30.0d0*v630 + 15.0d0*v631 + 60.0d0*v632 + 240.0d0*v633 + &
      143.0d0*v850 + 143.0d0*v851 + 150.0d0*v852 + 240.0d0*v853 + &
      143.0d0*v854 + 143.0d0*v855 + 240.0d0*v856)))
    S_xxxxyyz   = z*(0.00699300699300699d0*(6.0d0*v194) + v1630 + v746 + v857)
    Ms_xxxxyyz  = Ms_xxxxyyz + (M_0*S_xxxxyyz + v1631 + v859 + v860 - v861 - v864 - v865 + v866 - v869 - &
      v870 - v871 + 0.00233100233100233d0*(-7.0d0*M_yyyyyyz - 6.0d0* &
      M_yyyyzzz + 690.0d0*v656 + 780.0d0*v658 + 1260.0d0*v664 - 37.0d0* &
      v720 - 12.0d0*v745 - 16.0d0*(M_xxxxxxz + v653) + 45.0d0*(v635 + &
      v637) - 20.0d0*(v648 + v666) + 2160.0d0*(v649 + v700) - 90.0d0*( &
      v650 + v685) + 840.0d0*(v651 + v728) + 1380.0d0*(v655 + v737) + &
      540.0d0*(v660 + v711) + 3720.0d0*(v662 + v704) + 1860.0d0*(v663 + &
      v707) + 2520.0d0*(v665 + v694) + 1560.0d0*(v667 + v695) + &
      4200.0d0*(v670 + v681) - 450.0d0*(v673 + v729) - 270.0d0*(v678 + &
      v712) + 300.0d0*(v682 + v715) + 330.0d0*(v688 + v717) + 570.0d0*( &
      v698 + v709) + 40.0d0*(v716 + v725) - 105.0d0*(v718 + v731) - &
      132.0d0*(v719 + v741) - 720.0d0*(v867 + v868) - 96.0d0*(v652 + &
      v654 + v706) - 420.0d0*(v671 + v676 + v724) + 2250.0d0*(v644 + &
      v672 + v677 + v686) - 36.0d0*(v645 + v647 + v692 + v735) - &
      110.0d0*(v687 + v689 + v690 + v733) - 65.0d0*(v691 + v730 + v732 &
      + v734) - 27.0d0*(v693 + v713 + v714 + v736) + 480.0d0*(-v696 + &
      v697 - v701 + v705) - 30.0d0*(M_xxyyyyz + v669 + v699 + v703 + &
      v722) + 60.0d0*(v674 - v683 - v726 + v738 - v739 - v742)))
    S_xxxyyyy   = x*(v1632 + v847 + 0.00699300699300699d0*(-33.0d0*v419 + 18.0d0*v421))
    Ms_xxxyyyy  = Ms_xxxyyyy + (M_0*S_xxxyyyy + v753 + 0.00699300699300699d0*(110.0d0*M_xxxyyyy + &
      M_xxxzzzz + M_xyyzzzz + 380.0d0*v458 + v480 + v528 + 330.0d0*v754 &
      + 9.0d0*(v433 + v445) + 420.0d0*(v436 + v493) + 25.0d0*(v438 + &
      v443) + 200.0d0*(v441 + v516) + 30.0d0*(v452 + v504) + 560.0d0*( &
      v455 + v514) + 630.0d0*(v457 + v510) + 40.0d0*(v462 + v475) + &
      1320.0d0*(v468 + v491) + 1710.0d0*(v470 + v487) + 1140.0d0*(v471 &
      + v482) + 6.0d0*(v449 + v466 + v479 + v502 + v506 + v508 + v527) &
      - (M_xxxxxxx + 18.0d0*M_xxxxxyy + 16.0d0*M_xyyyyyy + 15.0d0* &
      M_xyyyyzz + 270.0d0*v434 + 15.0d0*v435 + 15.0d0*v437 + 270.0d0* &
      v439 + 15.0d0*v440 + 15.0d0*v442 + 150.0d0*v444 + 18.0d0*v446 + &
      v447 + 30.0d0*v448 + 270.0d0*v450 + 150.0d0*v451 + 480.0d0*v454 + &
      270.0d0*v456 + 120.0d0*v459 + 240.0d0*v460 + 30.0d0*v461 + &
      140.0d0*v463 + 15.0d0*v464 + 30.0d0*v465 + 480.0d0*v467 + 270.0d0 &
      *v469 + 240.0d0*v472 + 480.0d0*v473 + 30.0d0*v474 + 260.0d0*v476 &
      + 15.0d0*v477 + 30.0d0*v478 + 270.0d0*v481 + 30.0d0*v483 + 96.0d0 &
      *v484 + 30.0d0*v485 + 150.0d0*v486 + 30.0d0*v488 + 150.0d0*v489 + &
      30.0d0*v490 + 140.0d0*v492 + 150.0d0*v494 + 96.0d0*v495 + 60.0d0* &
      v496 + 30.0d0*v497 + 260.0d0*v498 + 140.0d0*v499 + 15.0d0*v500 + &
      30.0d0*v501 + 480.0d0*v503 + 240.0d0*v505 + 60.0d0*v507 + 18.0d0* &
      v509 + 30.0d0*v511 + 150.0d0*v512 + 30.0d0*v513 + 140.0d0*v515 + &
      150.0d0*v517 + 96.0d0*v518 + 16.0d0*v519 + 60.0d0*v520 + 15.0d0* &
      v521 + 30.0d0*v522 + 140.0d0*v523 + 140.0d0*v524 + 15.0d0*v525 + &
      30.0d0*v526 + 240.0d0*v529 + 15.0d0*v750 + 143.0d0*v756 + 143.0d0 &
      *v758 + 143.0d0*v760 + 143.0d0*v762)))
    S_xxxyyyz   = v9*(v67 + 0.00699300699300699d0*(9.0d0*v32 + 3.0d0*(-11.0d0*v34 - 11.0d0 &
      *v82)))
    Ms_xxxyyyz  = Ms_xxxyyyz + (0.00699300699300699d0*(143.0d0*M_0*S_xxxyyyz + 125.0d0*M_xxxyyyz + &
      185.0d0*v764 + 945.0d0*(v770 + v775) + 345.0d0*(v806 + v813) + &
      245.0d0*(v796 + v809 + v832 + v837) + 525.0d0*(v804 + v815 + v820 &
      + v839) + 1125.0d0*(v769 + v782 + v811 + v814 + v818 + v825) + &
      21.0d0*(v798 + v799 + v822 + v830 + v834 + v840) - 75.0d0*(v802 + &
      v803 + v816 + v817 + v823 + v836) + 465.0d0*(v763 + v765 + v778 + &
      v787 + v805 + v812 + v829 + v841) - 60.0d0*(v795 + v807 + v808 + &
      v810 + v819 + v824 + v831 + v838) + 15.0d0*(v797 + v801 + v821 + &
      v826 + v827 + v828 + v833 + v842) - 9.0d0*(M_xxxxxyz + M_xxxyzzz &
      + M_xyyyyyz + M_xyyyzzz + v768 + v772 + v774 + v776 + v777 + v781 &
      + v789 + v791 + v800 + v835) - 45.0d0*(v766 + v767 + v771 + v773 &
      + v779 + v780 + v783 + v784 + v785 + v786 + v788 + v790 + v792 + &
      v793)))
    S_xxyyyyy   = y*(0.00699300699300699d0*(10.0d0*v421) + v10*v747 + v1629 + v420 + v873)
    Ms_xxyyyyy  = Ms_xxyyyyy + (M_0*S_xxyyyyy + v541 - v544 + v849 + v850 + v851 + v854 + v855 + &
      0.00233100233100233d0*(354.0d0*M_xxyyyyy - 20.0d0*M_yyyyyyy - &
      780.0d0*v566 - 600.0d0*v580 + 732.0d0*v600 - 116.0d0*v621 - &
      36.0d0*v622 + 1350.0d0*v852 - 45.0d0*v874 - 35.0d0*(M_xxxxxxy + &
      v555) - 1110.0d0*(v546 + v578) + 444.0d0*(v548 + v619) - 420.0d0* &
      (v551 + v597) - 1380.0d0*(v564 + v595) - 1740.0d0*(v565 + v591) - &
      2790.0d0*(v572 + v576) + 1620.0d0*(v574 + v617) + 2730.0d0*(v577 &
      + v613) + 2550.0d0*(v579 + v608) - 1560.0d0*(v581 + v633) - &
      1660.0d0*(v583 + v628) - 700.0d0*(v587 + v624) + 2820.0d0*(v593 + &
      v599) + 5160.0d0*(v596 + v598) - 2760.0d0*(v602 + v605) - 210.0d0 &
      *(v610 + v620) - 190.0d0*(v615 + v618) - 100.0d0*(v625 + v629) - &
      1080.0d0*(v853 + v856) + 255.0d0*(v545 + v552 + v557 + v571) + &
      560.0d0*(v550 + v563 + v582 + v586) + 30.0d0*(-M_xxxxyzz + v560 + &
      v561 - v562 + v632) - 120.0d0*(v559 + v585 + v609 + v611 + v627) &
      + 90.0d0*(-M_xxxxyyy + v553 - v589 + v612 - v614 - v616 - v631) - &
      105.0d0*(v547 + v549 + v573 + v575 + v584 + v588 + v626 + v630) + &
      60.0d0*(-v554 - v556 + v558 - v568 - v570 - v590 - v592 - v594 - &
      v601 - v603 + v607 - v623 - v634)))
    S_xxyyyyz   = z*(0.00699300699300699d0*(6.0d0*v421) + v1632 + v857 + v873)
    Ms_xxyyyyz  = Ms_xxyyyyz + (M_0*S_xxyyyyz + v1628 - v641 + v657 - v684 - v723 - v727 - v740 - v743 + &
      v859 + v875 + 0.00233100233100233d0*(-7.0d0*M_xxxxxxz - 6.0d0* &
      M_xxxxzzz - 37.0d0*v653 + 690.0d0*v675 + 1260.0d0*v676 + 780.0d0* &
      v699 - 12.0d0*v879 - 16.0d0*(M_yyyyyyz + v720) + 45.0d0*(v643 + &
      v659) - 270.0d0*(v644 + v677) + 540.0d0*(v646 + v721) + 40.0d0*( &
      v648 + v666) + 300.0d0*(v649 + v700) - 105.0d0*(v650 + v685) + &
      330.0d0*(v651 + v728) - 132.0d0*(v652 + v706) + 570.0d0*(v655 + &
      v737) - 720.0d0*(v665 + v694) + 1560.0d0*(v671 + v724) - 450.0d0* &
      (v672 + v686) + 1860.0d0*(v674 + v738) + 2160.0d0*(v682 + v715) + &
      840.0d0*(v688 + v717) + 4200.0d0*(v696 + v701) + 3720.0d0*(v697 + &
      v705) + 1380.0d0*(v698 + v709) - 20.0d0*(v716 + v725) - 90.0d0*( &
      v718 + v731) + 2520.0d0*(v867 + v868) - 420.0d0*(v664 + v667 + &
      v695) - 96.0d0*(v719 + v741 + v877) - 27.0d0*(v645 + v647 + v692 &
      + v735) + 480.0d0*(v662 - v670 - v681 + v704) + 2250.0d0*(v673 + &
      v678 + v712 + v729) - 65.0d0*(v687 + v689 + v690 + v733) - &
      110.0d0*(v691 + v730 + v732 + v734) - 36.0d0*(v693 + v713 + v714 &
      + v736) - 30.0d0*(M_xxxxyyz + v658 + v661 + v876 + v878) + 60.0d0 &
      *(v663 - v668 - v702 + v707 - v708 - v710)))
    S_xyyyyyy   = v880*x
    Ms_xyyyyyy  = Ms_xyyyyyy + (M_0*S_xyyyyyy + v432 + v751 + v752 - v881 + 0.00233100233100233d0*( &
      10.0d0*M_xxxxxxx - 105.0d0*M_xxxxxyy - 120.0d0*v521 - 1200.0d0* &
      v754 - 45.0d0*x*(M_xxxxyy - M_xxxxzz) + 304.0d0*(M_xyyyyyy + v519 &
      ) + 1020.0d0*(v434 + v456) - 220.0d0*(v438 + v443) + 840.0d0*( &
      v439 + v469) - 315.0d0*(v444 + v486) + 150.0d0*(v457 + v510) - &
      160.0d0*(v462 + v475) - 3870.0d0*(v470 + v487) + 1140.0d0*(v472 + &
      v505) + 1040.0d0*(v476 + v498) + 4640.0d0*(v492 + v515) - &
      3940.0d0*(v499 + v524) + 40.0d0*(v447 - v463 - v523) + 1344.0d0*( &
      v484 + v495 + v518) - 2880.0d0*(v755 + v757 + v759 + v761) + &
      480.0d0*(-v436 + v441 - v458 - v493 + v516) + 60.0d0*(-v440 - &
      v442 + v459 - v477 - v525) + 960.0d0*(v455 - v496 - v507 + v514 - &
      v520) + 1920.0d0*(v454 + v467 - v468 + v473 - v491 + v503) + &
      3360.0d0*(-v471 - v482 + v489 + v494 + v512 + v517) + 30.0d0*( &
      -v433 - v435 - v437 - v445 + v449 + v452 - v464 - v500 + v504) - &
      240.0d0*(M_xxxyyyy + v448 + v450 + v461 + v474 + v481 + v483 + &
      v485 + v497 + v522) - 195.0d0*(v446 + v465 + v478 + v488 + v490 + &
      v501 + v509 + v511 + v513 + v526)))
    S_xyyyyyz   = v9*(0.0769230769230769d0*(-10.0d0*v82) + v747 + v81)
    Ms_xyyyyyz  = Ms_xyyyyyz + (M_0*S_xyyyyyz + M_xyyy*v429 + M_xyyz*v430 + v794 + 0.00699300699300699d0 &
      *(-30.0d0*v806 - 250.0d0*v813 + 128.0d0*(M_xyyyyyz + v835) + &
      390.0d0*(v805 + v841) - 270.0d0*(v812 + v829) + 1430.0d0*(M_yyy* &
      S_xyyz + M_yyz*S_xyyy) - 75.0d0*(v798 + v799 + v840) + 480.0d0*( &
      v817 + v823 + v836) + 288.0d0*(v822 + v830 + v834) + 120.0d0*( &
      v795 + v807 + v808 + v810) + 280.0d0*(v796 - v815 - v820 + v837) &
      - 195.0d0*(v797 + v801 + v826 + v828) + 600.0d0*(v804 - v814 - &
      v818 + v839) + 60.0d0*(v809 + v811 + v825 + v832) + 1110.0d0*( &
      v819 + v824 + v831 + v838) + 960.0d0*(v821 + v827 + v833 + v842) &
      - 15.0d0*(M_xxxxxyz + v800 + v802 + v803 + v816)))
    S_yyyyyyy   = y*(0.00699300699300699d0*(-231.0d0*v419 + 105.0d0*v421) + v428 + v431)
    Ms_yyyyyyy  = Ms_yyyyyyy + (M_0*S_yyyyyyy + v543 + 0.00233100233100233d0*(184.0d0*M_yyyyyyy + &
      952.0d0*v621 - 1260.0d0*v852 - 630.0d0*v874 - 525.0d0*y*(M_xxxxyy &
      + M_xxyyzz) + 70.0d0*(M_xxxxxxy + v555) + 1680.0d0*(v546 + v578) &
      + 5040.0d0*(v572 + v576) + 1470.0d0*(v577 + v613) - 1050.0d0*( &
      v579 + v608) - 7980.0d0*(v596 + v598) - 1176.0d0*(v600 + v622) + &
      5880.0d0*(v602 + v605) + 3444.0d0*(v610 + v620) + 6860.0d0*(v615 &
      + v618) - 7420.0d0*(v625 + v629) + 105.0d0*(-M_xxxxyyy + &
      M_xxxxyzz + v562) + 35.0d0*(M_xxyzzzz + M_yyyzzzz + v535 + v538) &
      - 1120.0d0*(v550 + v563 + v582 + v586) + 2520.0d0*(v574 + v617 + &
      v853 + v856) - 280.0d0*(v583 + v587 + v624 + v628) - 4200.0d0*( &
      v593 + v599 + v623 + v634) + 840.0d0*(v548 - v551 - v564 - v595 - &
      v597 + v619) - 735.0d0*(v553 + v589 + v612 + v614 + v616 + v631) &
      - 1155.0d0*(v558 + v585 + v607 + v609 + v611 + v627) + 420.0d0*( &
      -M_xxyyyyy - v545 - v547 - v549 - v552 - v557 + v565 + v566 - &
      v571 - v573 - v575 + v580 + v581 - v584 - v588 + v591 - v626 - &
      v630 + v633) + 210.0d0*(-M_yyyyyzz + v533 + v534 + v536 + v537 + &
      v539 + v540 + v554 + v556 + v560 + v561 + v568 + v570 + v590 + &
      v592 + v594 + v601 + v603 + v632)))
    S_yyyyyyz   = v880*z
    Ms_yyyyyyz  = Ms_yyyyyyz + (M_0*S_yyyyyyz + v1631 + v1635 + v861 + v864 + v865 - v866 + v869 + v870 &
      + v871 + 0.00233100233100233d0*(10.0d0*M_xxxxxxz - 105.0d0* &
      M_xxxxyyz + 304.0d0*M_yyyyyyz + 40.0d0*v653 - 555.0d0*v656 + &
      784.0d0*v720 - 600.0d0*v722 + 1344.0d0*v877 + 30.0d0*v879 + &
      4320.0d0*(v635 + v637) + 900.0d0*(v644 + v677) + 1440.0d0*(v646 + &
      v721) - 160.0d0*(v648 + v666) - 735.0d0*(v651 + v728) + 150.0d0*( &
      v652 + v706) - 780.0d0*(v663 + v707) + 3840.0d0*(v671 + v724) + &
      1080.0d0*(v672 + v686) + 2970.0d0*(v673 + v729) - 5100.0d0*(v696 &
      + v701) - 4800.0d0*(v697 + v705) + 7520.0d0*(v716 + v725) + &
      6720.0d0*(v718 + v731) + 3264.0d0*(v719 + v741) - 2880.0d0*(v867 &
      + v868) - 120.0d0*(M_yyyyzzz + v667 + v695) + 60.0d0*(v650 + v664 &
      + v685) + 960.0d0*(v682 - v699 + v715) - 240.0d0*(M_xxyyyyz + &
      v658 + v876 + v878) - 100.0d0*(v687 + v689 + v690 + v733) - &
      775.0d0*(v691 + v730 + v732 + v734) + 480.0d0*(v674 - v676 + v688 &
      + v717 + v738) + 90.0d0*(-v645 - v647 + v678 - v692 + v712 - v735 &
      ) - 225.0d0*(v660 + v693 + v711 + v713 + v714 + v736) + 1920.0d0* &
      (-v662 + v670 + v681 - v698 - v704 - v709) - 1200.0d0*(v649 + &
      v655 + v683 + v700 + v726 + v737 + v739 + v742)))
    S_xxxxxxxx  = a8 + v883 + 0.000466200466200466d0*(-4004.0d0*v884 + 2310.0d0*v885 - &
      420.0d0*v886)
    Ms_xxxxxxxx = Ms_xxxxxxxx + (M_0*S_xxxxxxxx + v911 + 0.000155400155400155d0*(1920.0d0*M_xxxxxxxx + &
      3150.0d0*M_xxyyyyzz - 105.0d0*M_yyyyyyyy - 210.0d0*M_yyyyyyzz - &
      140.0d0*M_yyyyzzzz + 5810.0d0*v1042 + 183680.0d0*v926 + 11776.0d0 &
      *v934 - 259840.0d0*v953 - 224000.0d0*v960 + 220640.0d0*v985 + &
      107520.0d0*(v1005 + v955) - 71680.0d0*(v1009 + v1016) + 4480.0d0* &
      (v1013 + v1057) - 17920.0d0*(v1015 + v961) + 161280.0d0*(v1021 + &
      v959) - 14280.0d0*(v1030 + v976) - 12600.0d0*(v1031 + v984) - &
      33600.0d0*(v1036 + v974) - 7980.0d0*(v1040 + v972) - 560.0d0*( &
      v1047 + v1048) + 5460.0d0*(v1053 + v919) - 280.0d0*(v1061 + v990 &
      ) - 8960.0d0*(v1062 + v949) - 38080.0d0*(v1063 + v982) + &
      52416.0d0*(v912 + v932) - 36960.0d0*(v914 + v950) - 32340.0d0*( &
      v915 + v975) - 31500.0d0*(v916 + v983) + 134400.0d0*(v921 + v930 &
      ) - 17024.0d0*(v935 + v936) - 188160.0d0*(v941 + v966) - &
      170240.0d0*(v948 + v991) - 8400.0d0*(v967 + v973) + 7280.0d0*( &
      v981 + v992) + 5880.0d0*(v977 + v978 + v980) + 6720.0d0*( &
      -M_xxxxxxyy + v952 - v956 - v958) - 75264.0d0*(v1002 + v1022 + &
      v937 + v939) + 2240.0d0*(v1020 + v1056 + v965 + v986) + 1890.0d0* &
      (v1041 + v1043 + v1068 + v997) - 20160.0d0*(v1067 + v928 + v929 + &
      v996) + 2100.0d0*(M_xxyyyyyy + v1000 + v1071 + v917 + v920) + &
      53760.0d0*(v1004 + v1073 + v927 + v931 + v947 + v971) + 10920.0d0 &
      *(v1044 + v1058 + v968 + v969 + v970 + v987) - 1680.0d0*(v1049 + &
      v1060 + v1075 + v1076 + v1077 + v989) + 8680.0d0*(v1051 + v1069 + &
      v993 + v994 + v995 + v998) + 1120.0d0*(M_xxxxzzzz + v1052 + v1064 &
      + v1065 + v1066 + v1070 + v999) + 840.0d0*(v1001 + v1032 + v1033 &
      + v1034 - v1050 + v1054 - v1055 + v1072) - 47040.0d0*(v1010 + &
      v1017 + v913 + v923 + v924 + v925 + v943 + v962) + 3360.0d0*( &
      -M_xxxxxxzz + v1037 + v1038 + v1039 + v1045 + v1046 + v1059 - &
      v1074 + v918 - v979 + v988) + 26880.0d0*(-v1006 - v1007 - v1008 - &
      v1011 - v1018 + v1023 + v1028 - v1035 - v938 - v942 + v944 + v957 &
      - v963) + 13440.0d0*(v1003 + v1012 + v1014 + v1019 + v1024 + &
      v1025 + v1026 + v1027 - v1029 - v922 + v933 - v940 + v945 + v946 &
      - v951 - v954 + v964)))
    S_xxxxxxxy  = v1079*v6
    Ms_xxxxxxxy = Ms_xxxxxxxy + (M_0*S_xxxxxxxy + v1111 - v1246*(M_xxyyyyy + M_xxyyyzz) + &
      0.0013986013986014d0*(-560.0d0*M_xxxxxyyy - 175.0d0*M_xxxyyyyy - &
      2352.0d0*v1131 - 1680.0d0*v1138 + 245.0d0*v1152 + 35.0d0*v1154 + &
      400.0d0*(M_xxxxxxxy + v1127) + 70.0d0*(M_xyyyyyyy + v1231) + &
      105.0d0*(M_xyyyyyzz + v1233) - 1190.0d0*(v1113 + v1150) + &
      2170.0d0*(v1118 + v1169) - 672.0d0*(v1130 + v1216) - 8400.0d0*( &
      v1137 + v1181) - 10290.0d0*(v1144 + v1167) - 1645.0d0*(v1146 + &
      v1226) - 13650.0d0*(v1148 + v1163) + 1400.0d0*(v1149 + v1222) + &
      2660.0d0*(v1151 + v1217) + 3500.0d0*(v1153 + v1244) + 2800.0d0*( &
      v1156 + v1239) - 2205.0d0*(v1165 + v1196) + 5880.0d0*(v1168 + &
      v1192) + 7140.0d0*(v1170 + v1187) + 2128.0d0*(v1126 + v1128 + &
      v1180) - 1792.0d0*(v1132 + v1133 + v1243) - 840.0d0*(v1140 + &
      v1142 + v1182) + 12320.0d0*(v1117 + v1122 + v1135 + v1143) + &
      3360.0d0*(v1123 - v1136 - v1186 + v1191) - 11900.0d0*(v1155 + &
      v1159 + v1173 + v1176) - 1540.0d0*(v1194 + v1197 + v1224 + v1227 &
      ) + 315.0d0*(-v1171 - v1183 + v1185 + v1203 + v1235) + 1120.0d0*( &
      v1125 - v1205 - v1208 + v1221 - v1236 - v1240) + 280.0d0*( &
      -M_xxxxxyzz - v1134 - v1177 + v1184 + v1200 - v1204 + v1230) + &
      6720.0d0*(v1112 + v1124 + v1129 - v1139 - v1141 + v1162 - v1211 - &
      v1213) - 1365.0d0*(v1114 + v1115 + v1116 + v1157 + v1160 + v1164 &
      + v1166 + v1198 + v1206 + v1209) - 805.0d0*(v1119 + v1120 + v1121 &
      + v1145 + v1147 + v1174 + v1178 + v1228 + v1237 + v1241) + &
      420.0d0*(-v1161 + v1172 - v1179 - v1193 - v1195 - v1210 + v1214 - &
      v1223 - v1225 - v1242) + 210.0d0*(-v1158 - v1175 - v1188 - v1189 &
      - v1190 - v1199 + v1201 + v1202 - v1207 + v1212 + v1215 - v1218 - &
      v1219 - v1220 - v1229 + v1232 + v1234 - v1238 + v1245)))
    S_xxxxxxxz  = v1079*v7
    Ms_xxxxxxxz = Ms_xxxxxxxz + (M_0*S_xxxxxxxz - v1246*(M_xxyyyyz + M_xxyyzzz) + 0.0013986013986014d0*( &
      400.0d0*M_xxxxxxxz - 560.0d0*M_xxxxxyyz + 1072.0d0*v1262 + &
      2128.0d0*v1263 - 1008.0d0*v1265 - 1792.0d0*v1266 - 1400.0d0*v1269 &
      - 1085.0d0*v1283 - 875.0d0*v1287 - 175.0d0*(M_xxxyyyyz + &
      M_xxxyyzzz) + 70.0d0*(M_xyyyyyyz + v1386) + 105.0d0*(M_xyyyyzzz + &
      v1391) + 8512.0d0*(v1247 + v1267) - 1610.0d0*(v1248 + v1285) + &
      19040.0d0*(v1252 + v1274) + 1750.0d0*(v1253 + v1309) + 22400.0d0* &
      (v1257 + v1292) + 3360.0d0*(v1258 + v1351) + 14560.0d0*(v1259 + &
      v1316) + 5488.0d0*(v1261 + v1366) - 4032.0d0*(v1264 + v1407) + &
      2912.0d0*(v1268 + v1375) - 13440.0d0*(v1270 + v1361) - 6720.0d0*( &
      v1273 + v1327) + 10080.0d0*(v1275 + v1332) - 4200.0d0*(v1276 + &
      v1368) - 20020.0d0*(v1278 + v1312) + 2870.0d0*(v1280 + v1317) + &
      3080.0d0*(v1281 + v1397) - 980.0d0*(v1282 + v1408) + 1820.0d0*( &
      v1286 + v1376) - 15540.0d0*(v1288 + v1302) - 3920.0d0*(v1289 + &
      v1380) + 10710.0d0*(v1293 + v1304) - 2345.0d0*(v1295 + v1382) + &
      7560.0d0*(v1305 + v1352) - 5460.0d0*(v1306 + v1362) - 3885.0d0*( &
      v1307 + v1369) + 6300.0d0*(v1310 + v1333) - 3675.0d0*(v1311 + &
      v1370) - 8400.0d0*(v1313 + v1337) - 5145.0d0*(v1319 + v1339) - &
      1680.0d0*(v1271 + v1272 + v1367) + 525.0d0*(v1346 + v1373 + v1390 &
      ) + 280.0d0*(-M_xxxxxzzz + v1342 + v1372 + v1385) + 35.0d0*( &
      M_xxxzzzzz + M_xyyzzzzz + v1326 + v1406) - 2625.0d0*(v1294 + &
      v1296 + v1321 + v1401) - 5425.0d0*(v1297 + v1318 + v1320 + v1356 &
      ) - 840.0d0*(v1277 + v1279 + v1303 + v1347 + v1392) - 1575.0d0*( &
      v1249 + v1250 + v1251 + v1299 + v1344 + v1358) - 1015.0d0*(v1254 &
      + v1255 + v1256 + v1323 + v1388 + v1403) + 1120.0d0*(v1260 - &
      v1338 - v1348 - v1381 - v1393 + v1396) + 245.0d0*(v1301 + v1325 + &
      v1360 + v1371 + v1374 + v1405) + 420.0d0*(v1284 + v1308 + v1328 + &
      v1340 + v1354 + v1383 + v1399) - 700.0d0*(v1298 + v1322 + v1353 + &
      v1355 + v1357 + v1398 + v1400 + v1402) + 210.0d0*(v1291 + v1315 + &
      v1329 + v1330 + v1331 + v1343 + v1350 + v1387 + v1395) + 1050.0d0 &
      *(v1290 + v1314 + v1341 + v1349 + v1363 + v1364 + v1365 + v1384 + &
      v1394 + v1409 + v1410 + v1411) - 630.0d0*(v1300 + v1324 + v1334 + &
      v1335 + v1336 + v1345 + v1359 + v1377 + v1378 + v1379 + v1389 + &
      v1404)))
    S_xxxxxxyy  = 0.00512820512820513d0*(-13.0d0*v884 + 15.0d0*v885) - v10*v1414 + v11* &
      v190 - v11*v843 + v1413 - v1415
    Ms_xxxxxxyy = Ms_xxxxxxyy + (M_0*S_xxxxxxyy + v1416 + v1418 + v1420 + 0.000155400155400155d0*( &
      -240.0d0*M_xxxxxxxx + 4800.0d0*M_xxxxxxyy - 120.0d0*M_xxxxxxzz - &
      1125.0d0*M_xxxxyyzz + 115.0d0*M_xxxxzzzz - 1005.0d0*M_xxyyyyyy - &
      900.0d0*M_xxyyyyzz + 75.0d0*M_yyyyyyyy + 105.0d0*M_yyyyyyzz + &
      25.0d0*M_yyyyzzzz - 3130.0d0*v1042 + 370.0d0*v1047 + 190.0d0* &
      v1048 + 420.0d0*v1050 + 150.0d0*v1055 + 230.0d0*v1423 + 50.0d0* &
      v1424 - 5440.0d0*v926 - 1568.0d0*v934 + 9952.0d0*v935 - 128.0d0* &
      v936 + 22080.0d0*v938 - 480.0d0*v940 - 16620.0d0*v945 - 11220.0d0 &
      *v946 + 690.0d0*v952 + 142520.0d0*v953 - 5190.0d0*v956 - 2490.0d0 &
      *v958 - 1400.0d0*v960 - 1320.0d0*v977 + 1110.0d0*v978 - 1590.0d0* &
      v980 - 97720.0d0*v985 + 46272.0d0*(v1002 + v937) - 4020.0d0*( &
      v1003 + v1012) + 24960.0d0*(v1004 + v931) - 69960.0d0*(v1005 + &
      v955) + 16140.0d0*(v1007 + v1011) + 35840.0d0*(v1009 + v1016) + &
      6870.0d0*(v1010 + v924) - 2240.0d0*(v1013 + v1057) - 41440.0d0*( &
      v1015 + v961) - 69840.0d0*(v1021 + v959) + 192.0d0*(v1022 + v939 &
      ) - 36840.0d0*(v1023 + v957) + 5520.0d0*(v1027 + v933) - &
      21540.0d0*(v1028 + v944) - 2730.0d0*(v1029 + v951) + 9165.0d0*( &
      v1030 + v976) - 2475.0d0*(v1031 + v984) - 4560.0d0*(v1035 + v942 &
      ) + 17700.0d0*(v1036 + v974) - 1770.0d0*(v1038 + v1045) + &
      6015.0d0*(v1040 + v972) - 3840.0d0*(v1044 + v969) - 1635.0d0*( &
      v1046 + v918) + 610.0d0*(v1051 + v994) - 1010.0d0*(v1052 + v1065 &
      ) + 11480.0d0*(v1056 + v986) - 13520.0d0*(v1062 + v949) + &
      19940.0d0*(v1063 + v982) - 21480.0d0*(v1073 + v947) + 12480.0d0*( &
      v1074 + v979) + 90.0d0*(v1421 + v1422) - 3888.0d0*(v912 + v932) + &
      51870.0d0*(v913 + v943) - 2445.0d0*(v914 + v950) - 30.0d0*(v915 + &
      v975) - 3825.0d0*(v916 + v983) - 5280.0d0*(v921 + v930) + &
      70620.0d0*(v922 + v954) + 55470.0d0*(v927 + v971) + 107580.0d0*( &
      v941 + v966) - 380.0d0*(v948 + v991) - 52500.0d0*(v967 + v973) - &
      54040.0d0*(v981 + v992) + 165.0d0*(v1001 + v1032 + v1034 + v1072 &
      ) - 5460.0d0*(v1006 + v1008 + v1018 + v963) - 3930.0d0*(v1017 + &
      v923 + v925 + v962) - 330.0d0*(v1037 + v1039 + v1059 + v988) - &
      270.0d0*(v1041 + v1043 + v1068 + v997) - 2760.0d0*(v1058 + v968 + &
      v970 + v987) + 430.0d0*(v1064 + v1066 + v1070 + v999) - 1845.0d0* &
      (v1067 + v928 + v929 + v996) + 970.0d0*(v1069 + v993 + v995 + &
      v998) + 255.0d0*(v1000 + v1033 + v1054 + v1071 + v917 + v920) + &
      300.0d0*(v1049 + v1060 + v1075 + v1076 + v1077 + v989) + 1380.0d0 &
      *(v1014 + v1019 + v1024 + v1025 + v1026 - v1053 - v919 + v964)))
    S_xxxxxxyz  = v8*(0.0769230769230769d0*(3.0d0*v194) + v190 - v193 + v844)
    Ms_xxxxxxyz = Ms_xxxxxxyz + (M_0*S_xxxxxxyz - M_xyyyy*v311 - S_xyyyy*v328 + v1436 + &
      0.00699300699300699d0*(2.0d0*M_yyyyyyyz + 3.0d0*M_yyyyyzzz - &
      340.0d0*v1457 - 141.0d0*v1489 - 135.0d0*v1493 + 9.0d0*v1564 + &
      112.0d0*(M_xxxxxxyz + v1449) - 27.0d0*(M_xxyyyyyz + M_xxyyyzzz) - &
      540.0d0*(v1455 + v1584) - 1080.0d0*(v1467 + v1533) + 280.0d0*( &
      v1468 + v1537) - 1000.0d0*(v1470 + v1515) - 1470.0d0*(v1480 + &
      v1494) - 75.0d0*(v1482 + v1561) - 510.0d0*(v1484 + v1497) + &
      990.0d0*(v1486 + v1506) - 345.0d0*(v1488 + v1586) + 15.0d0*( &
      -v1490 + v1560) - 465.0d0*(v1499 + v1551) - 177.0d0*(v1508 + &
      v1553) + 480.0d0*(v1520 + v1526) - 50.0d0*(v1549 + v1562) + &
      42.0d0*(v1554 + v1577) + 38.0d0*(v1555 + v1587) + 8.0d0*(v1556 + &
      v1557) + 45.0d0*(v1563 + v1588) + 272.0d0*(v1447 + v1448 + v1583 &
      ) + 512.0d0*(v1451 + v1452 + v1514) - 150.0d0*(v1460 + v1463 + &
      v1585) + 30.0d0*(-M_xxxxyzzz + v1438 - v1464 + v1491) + 1500.0d0* &
      (v1437 + v1458 + v1461 + v1479) + 2520.0d0*(v1442 + v1465 + v1471 &
      + v1475) + 2300.0d0*(v1444 + v1453 + v1496 + v1505) + 1152.0d0*( &
      v1446 + v1450 + v1532 + v1536) + 400.0d0*(-v1454 + v1462 + v1546 &
      - v1574) + 1120.0d0*(-v1466 + v1476 + v1521 - v1529) + 10.0d0*( &
      v1502 + v1571 + v1576 + v1578) - 18.0d0*(v1513 + v1548 + v1550 + &
      v1582) + 120.0d0*(v1445 + v1459 - v1469 + v1541 + v1565) - 12.0d0 &
      *(v1504 + v1543 + v1544 + v1545 + v1559 + v1573) - 20.0d0*(v1456 &
      + v1511 + v1552 + v1567 + v1568 + v1569 + v1580) + 240.0d0*(v1443 &
      + v1472 + v1485 + v1492 + v1519 + v1525 + v1542 + v1566) - &
      185.0d0*(v1498 + v1500 + v1501 + v1507 + v1509 + v1510 + v1570 + &
      v1579) - 51.0d0*(v1439 + v1440 + v1441 + v1481 + v1483 + v1503 + &
      v1512 + v1558 + v1572 + v1581) - 300.0d0*(v1473 + v1477 + v1522 + &
      v1527 + v1530 + v1534 + v1535 + v1538 + v1539 + v1540) + 60.0d0*( &
      -M_xxxxyyyz - v1474 - v1478 + v1487 - v1495 - v1516 - v1517 - &
      v1518 - v1523 - v1524 - v1528 - v1531 - v1547 + v1575)))
    S_xxxxxyyy  = v6*(0.0769230769230769d0*(2.0d0*v194) + v1591 + v1633 + v1636)
    Ms_xxxxxyyy = Ms_xxxxxyyy + (M_0*S_xxxxxyyy + v1593 + 0.000466200466200466d0*(-390.0d0*M_xxxyyyyy + &
      4962.0d0*v1131 + 6530.0d0*v1138 - 3370.0d0*v1152 - 285.0d0*v1154 &
      - 780.0d0*v1594 - 615.0d0*v1595 - 240.0d0*(M_xxxxxxxy + v1127) - &
      195.0d0*(M_xxxxxyzz + v1134) - 75.0d0*(M_xyyyyyyy + v1231) - &
      30.0d0*(M_xyyyyyzz + v1233) + 12990.0d0*(v1113 + v1150) - 600.0d0 &
      *(v1115 + v1198) + 15330.0d0*(v1118 + v1169) - 210.0d0*(v1120 + &
      v1228) + 10040.0d0*(v1123 + v1191) + 2760.0d0*(v1125 + v1221) + &
      6132.0d0*(v1130 + v1216) + 24060.0d0*(v1136 + v1186) + 20550.0d0* &
      (v1137 + v1181) + 40890.0d0*(v1144 + v1167) - 2830.0d0*(v1146 + &
      v1226) + 38550.0d0*(v1148 + v1163) - 6450.0d0*(v1149 + v1222) - &
      6810.0d0*(v1151 + v1217) - 5400.0d0*(v1153 + v1244) - 6300.0d0*( &
      v1156 + v1239) - 16530.0d0*(v1168 + v1192) - 16890.0d0*(v1170 + &
      v1187) - 8160.0d0*(v1171 + v1183) - 6720.0d0*(v1172 + v1214) - &
      1488.0d0*(v1126 + v1128 + v1180) - 588.0d0*(v1132 + v1133 + v1243 &
      ) - 585.0d0*(v1140 + v1142 + v1182) - 135.0d0*(v1184 + v1200 + &
      v1230) - 90.0d0*(v1185 + v1203 + v1235) + 270.0d0*(v1201 + v1215 &
      + v1232) - 2910.0d0*(v1112 + v1124 + v1129 + v1162) - 2970.0d0*( &
      v1117 + v1122 + v1135 + v1143) - 1380.0d0*(v1139 + v1141 + v1211 &
      + v1213) - 2100.0d0*(v1155 + v1159 + v1173 + v1176) - 7620.0d0*( &
      v1165 + v1177 + v1196 + v1204) + 555.0d0*(v1189 + v1199 + v1219 + &
      v1229) + 1815.0d0*(v1194 + v1197 + v1224 + v1227) + 2520.0d0*( &
      v1205 + v1208 + v1236 + v1240) + 1590.0d0*(M_xxxxxyyy + v1202 + &
      v1212 + v1234 + v1245) - 1260.0d0*(v1114 + v1116 + v1157 + v1160 &
      + v1164 + v1166 + v1206 + v1209) - 870.0d0*(v1119 + v1121 + v1145 &
      + v1147 + v1174 + v1178 + v1237 + v1241) - 765.0d0*(v1158 + v1175 &
      + v1188 + v1190 + v1207 + v1218 + v1220 + v1238) - 705.0d0*(v1161 &
      + v1179 + v1193 + v1195 + v1210 + v1223 + v1225 + v1242)))
    S_xxxxxyyz  = v7*(v1596 + v1633 + 0.00512820512820513d0*(-13.0d0*v193 + 10.0d0*v194))
    Ms_xxxxxyyz = Ms_xxxxxyyz + (M_0*S_xxxxxyyz + v1598 - v881*z + 0.000466200466200466d0*(-80.0d0* &
      M_xxxxxxxz + 1850.0d0*M_xxxxxyyz - 65.0d0*M_xxxxxzzz - 350.0d0* &
      M_xxxyyyyz - 185.0d0*M_xxxyyzzz - 144.0d0*v1262 - 496.0d0*v1263 + &
      3726.0d0*v1265 + 3764.0d0*v1266 - 325.0d0*v1269 + 7310.0d0*v1272 &
      - 195.0d0*v1277 + 1020.0d0*v1283 - 3340.0d0*v1284 - 925.0d0*v1287 &
      - 480.0d0*v1599 - 135.0d0*(M_xyyyyyyz + v1386) - 120.0d0*( &
      M_xyyyyzzz + v1391) - 774.0d0*(v1247 + v1267) + 16470.0d0*(v1248 &
      + v1285) + 150.0d0*(v1250 + v1344) - 530.0d0*(v1252 + v1274) + &
      21650.0d0*(v1253 + v1309) + 280.0d0*(v1255 + v1388) + 15080.0d0*( &
      v1258 + v1351) - 1350.0d0*(v1259 + v1316) + 4440.0d0*(v1260 + &
      v1396) - 816.0d0*(v1261 + v1366) + 7644.0d0*(v1264 + v1407) + &
      2436.0d0*(v1268 + v1375) + 26580.0d0*(v1270 + v1361) + 12810.0d0* &
      (v1271 + v1367) + 14940.0d0*(v1273 + v1327) + 8940.0d0*(v1275 + &
      v1332) - 975.0d0*(v1276 + v1368) + 40040.0d0*(v1278 + v1312) - &
      3220.0d0*(v1279 + v1392) + 19710.0d0*(v1280 + v1317) - 5610.0d0*( &
      v1281 + v1397) - 1740.0d0*(v1282 + v1408) - 2190.0d0*(v1286 + &
      v1376) + 32280.0d0*(v1288 + v1302) + 2940.0d0*(v1289 + v1380) + &
      17130.0d0*(v1293 + v1304) + 2790.0d0*(v1295 + v1382) - 7620.0d0*( &
      v1303 + v1347) - 8970.0d0*(v1305 + v1352) + 1620.0d0*(v1306 + &
      v1362) + 4770.0d0*(v1307 + v1369) - 7740.0d0*(v1308 + v1328) - &
      5550.0d0*(v1310 + v1333) + 6300.0d0*(v1313 + v1337) + 6540.0d0*( &
      v1319 + v1339) - 600.0d0*(v1373 + v1390) - 705.0d0*(v1342 + v1372 &
      + v1385) - 510.0d0*(v1249 + v1251 + v1299 + v1358) - 380.0d0*( &
      v1254 + v1256 + v1323 + v1403) - 1500.0d0*(v1297 + v1318 + v1320 &
      + v1356) + 885.0d0*(v1335 + v1345 + v1378 + v1389) + 840.0d0*( &
      v1338 + v1348 + v1381 + v1393) - 1965.0d0*(v1340 + v1354 + v1383 &
      + v1399) - 2520.0d0*(v1341 + v1364 + v1384 + v1410) - 850.0d0*( &
      v1257 + v1292 + v1294 + v1296 + v1321 + v1401) - 1200.0d0*(v1290 &
      + v1314 + v1349 + v1363 + v1365 + v1394 + v1409 + v1411) - &
      1125.0d0*(v1298 + v1322 + v1353 + v1355 + v1357 + v1398 + v1400 + &
      v1402) - 435.0d0*(v1300 + v1324 + v1334 + v1336 + v1359 + v1377 + &
      v1379 + v1404) - 240.0d0*(v1291 + v1315 + v1329 + v1330 + v1331 + &
      v1343 + v1350 + v1387 + v1395)))
    S_xxxxyyyy  = 0.000466200466200466d0*(396.0d0*v1412 + 2145.0d0*v31*v81 + v882 - &
      858.0d0*(v1415 + v1602) + 33.0d0*(v1600 + v885) - 18.0d0*(v1601 + &
      v886))
    Ms_xxxxyyyy = Ms_xxxxyyyy + (0.000466200466200466d0*(2145.0d0*M_0*S_xxxxyyyy + 1485.0d0*M_xxxxyyyy + &
      48780.0d0*v892 + 92.0d0*z*(M_xxxxxxz + M_yyyyyyz) + 84.0d0*z*( &
      M_xxxxzzz + M_yyyyzzz) + 15.0d0*(M_xxxxxxzz + M_yyyyyyzz) + &
      14.0d0*(M_xxxxzzzz + M_yyyyzzzz) + 100.0d0*(v1042 + v926) + &
      32.0d0*(v1047 + v934) + 60.0d0*(v1050 + v940) + 560.0d0*(v1057 + &
      v960) + 3285.0d0*(v887 + v906) + 28560.0d0*(v889 + v903) + &
      21360.0d0*(v890 + v900) + 5640.0d0*(v945 + v956) + 34680.0d0*( &
      v1005 + v955 + v967 + v973) + 9240.0d0*(v1010 + v1035 + v924 + &
      v942) + 432.0d0*(v1022 + v1049 + v1076 + v939) + 10020.0d0*(v1028 &
      + v915 + v944 + v975) + 120.0d0*(v1038 + v1045 + v921 + v930) + &
      620.0d0*(v1052 + v1065 + v948 + v991) + 102.0d0*(v1421 + v1422 + &
      v912 + v932) + 70.0d0*(v897 + v898 + v908 + v909) + 28.0d0*( &
      M_xxyyzzzz + v1020 + v1061 + v965 + v990) + 42.0d0*(v1000 + v1001 &
      + v1032 + v1034 + v1071 + v1072 + v917 + v920) + 140.0d0*(v1064 + &
      v1066 + v1069 + v1070 + v993 + v995 + v998 + v999) + 168.0d0*( &
      v1019 + v1024 + v1026 + v1060 + v1075 + v1077 + v895 + v964 + &
      v989) - (330.0d0*M_xxxxxxyy + 285.0d0*M_xxxxyyzz + 330.0d0* &
      M_xxyyyyyy + 285.0d0*M_xxyyyyzz + M_xxzzzzzz + M_yyzzzzzz + &
      4368.0d0*v1002 + 4368.0d0*v1003 + 2640.0d0*v1004 + 1020.0d0*v1006 &
      + 8220.0d0*v1007 + 1020.0d0*v1008 + 8960.0d0*v1009 + 8220.0d0* &
      v1011 + 4368.0d0*v1012 + 628.0d0*v1013 + 3000.0d0*v1014 + &
      3920.0d0*v1015 + 8960.0d0*v1016 + 360.0d0*v1017 + 1020.0d0*v1018 &
      + 3360.0d0*v1023 + 3000.0d0*v1025 + 420.0d0*v1027 + 510.0d0*v1029 &
      + 4440.0d0*v1030 + 630.0d0*v1031 + 120.0d0*v1033 + 5160.0d0*v1036 &
      + 360.0d0*v1037 + 360.0d0*v1039 + 4890.0d0*v1040 + 195.0d0*v1041 &
      + 195.0d0*v1043 + 2640.0d0*v1044 + 420.0d0*v1046 + 1720.0d0*v1051 &
      + 510.0d0*v1053 + 120.0d0*v1054 + 3920.0d0*v1056 + 1020.0d0*v1058 &
      + 360.0d0*v1059 + 1720.0d0*v1062 + 4400.0d0*v1063 + 195.0d0*v1067 &
      + 195.0d0*v1068 + 3000.0d0*v1073 + 3360.0d0*v1074 + 2145.0d0* &
      v1418 + 2145.0d0*v1420 + 2145.0d0*v1603 + 2145.0d0*v1604 + &
      2145.0d0*v542*y + 2145.0d0*v881*x + 1200.0d0*v891 + 720.0d0*v893 &
      + 720.0d0*v894 + 720.0d0*v896 + 8.0d0*v899 + 1200.0d0*v901 + &
      1200.0d0*v902 + 1200.0d0*v905 + 720.0d0*v907 + 8.0d0*v910 + &
      4440.0d0*v913 + 120.0d0*v914 + 630.0d0*v916 + 420.0d0*v918 + &
      510.0d0*v919 + 5160.0d0*v922 + 360.0d0*v923 + 360.0d0*v925 + &
      4890.0d0*v927 + 195.0d0*v928 + 195.0d0*v929 + 2640.0d0*v931 + &
      420.0d0*v933 + 628.0d0*v935 + 4368.0d0*v937 + 2280.0d0*v938 + &
      8220.0d0*v941 + 4440.0d0*v943 + 1440.0d0*v946 + 3000.0d0*v947 + &
      1720.0d0*v949 + 120.0d0*v950 + 510.0d0*v951 + 8960.0d0*v953 + &
      5160.0d0*v954 + 3360.0d0*v957 + 540.0d0*v958 + 3920.0d0*v961 + &
      360.0d0*v962 + 1020.0d0*v963 + 8220.0d0*v966 + 1020.0d0*v968 + &
      2640.0d0*v969 + 1020.0d0*v970 + 4890.0d0*v971 + 4890.0d0*v972 + &
      5160.0d0*v974 + 4440.0d0*v976 + 2280.0d0*v977 + 1440.0d0*v978 + &
      3360.0d0*v979 + 540.0d0*v980 + 4400.0d0*v981 + 4400.0d0*v982 + &
      630.0d0*v983 + 630.0d0*v984 + 8960.0d0*v985 + 3920.0d0*v986 + &
      1020.0d0*v987 + 360.0d0*v988 + 4400.0d0*v992 + 1720.0d0*v994 + &
      195.0d0*v996 + 195.0d0*v997)))
    S_xxxxyyyz  = v8*(0.0153846153846154d0*(6.0d0*v194 + v421) + v1591 + v1605 + v349)
    Ms_xxxxyyyz = Ms_xxxxyyyz + (M_0*S_xxxxyyyz - v875*y + 0.0013986013986014d0*(590.0d0*M_xxxxyyyz - &
      59.0d0*M_xxyyyzzz - 5.0d0*M_yyyyyyyz - 2.0d0*M_yyyyyzzz - 63.0d0* &
      v1426 + 1730.0d0*v1457 + 2060.0d0*v1469 + 204.0d0*v1489 - 295.0d0 &
      *v1493 - 31.0d0*v1556 - 9.0d0*v1557 - 10.0d0*v1560 - 6.0d0*v1564 &
      - 60.0d0*(M_xxxxxxyz + v1449) - 57.0d0*(M_xxxxyzzz + v1464) - &
      315.0d0*(v1425 + v1433) + 3830.0d0*(v1438 + v1491) - 76.0d0*( &
      v1440 + v1558) + 3800.0d0*(v1443 + v1525) + 1460.0d0*(v1445 + &
      v1565) + 3200.0d0*(v1454 + v1574) + 2670.0d0*(v1455 + v1584) + &
      2340.0d0*(v1459 + v1541) + 8960.0d0*(v1466 + v1529) + 7980.0d0*( &
      v1467 + v1533) + 2820.0d0*(v1468 + v1537) + 6020.0d0*(v1470 + &
      v1515) + 7320.0d0*(v1472 + v1519) + 3360.0d0*(v1476 + v1521) + &
      10110.0d0*(v1480 + v1494) - 720.0d0*(v1482 + v1561) + 10350.0d0*( &
      v1484 + v1497) + 4070.0d0*(v1486 + v1506) - 370.0d0*(v1487 + &
      v1575) - 710.0d0*(v1492 + v1542) + 310.0d0*(v1499 + v1551) - &
      1170.0d0*(v1517 + v1524) + 486.0d0*(v1522 + v1539) + 19.0d0*( &
      v1544 + v1559) + 15.0d0*(v1549 + v1562) - 215.0d0*(v1554 + v1577 &
      ) - 139.0d0*(v1555 + v1587) - 30.0d0*(v1563 + v1588) + 630.0d0*( &
      v1606 + v1607) - 70.0d0*(M_xxyyyyyz + v1495 + v1547) - 20.0d0*( &
      v1447 + v1448 + v1583) - 400.0d0*(v1451 + v1452 + v1514) + &
      930.0d0*(v1456 - v1485 - v1566) - 285.0d0*(v1460 + v1463 + v1585 &
      ) + 3.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1429 + v1432) - 450.0d0*( &
      v1437 + v1458 + v1461 + v1479) - 140.0d0*(v1442 + v1465 + v1471 + &
      v1475) - 240.0d0*(v1446 + v1450 + v1532 + v1536) + 1200.0d0*( &
      v1462 - v1520 - v1526 + v1546) - 135.0d0*(v1502 + v1571 + v1576 + &
      v1578) - 69.0d0*(v1504 + v1543 + v1545 + v1573) - 65.0d0*(v1513 + &
      v1548 + v1550 + v1582) + 21.0d0*(v1427 + v1428 + v1430 + v1431 + &
      v1434 + v1435) + 250.0d0*(-v1444 - v1453 - v1496 - v1505 + v1508 &
      + v1553) - 115.0d0*(v1511 + v1552 + v1567 + v1568 + v1569 + v1580 &
      ) - 114.0d0*(v1474 + v1478 + v1516 + v1518 + v1523 + v1528 + &
      v1531) - 570.0d0*(v1473 + v1477 + v1527 + v1530 + v1534 + v1535 + &
      v1538 + v1540) - 390.0d0*(v1498 + v1500 + v1501 + v1507 + v1509 + &
      v1510 + v1570 + v1579) + 120.0d0*(-v1439 - v1441 - v1481 - v1483 &
      + v1488 - v1503 - v1512 - v1572 - v1581 + v1586)))
    S_xxxyyyyy  = v6*(0.0769230769230769d0*(2.0d0*v421) + v1609 + v1634 + v1636)
    Ms_xxxyyyyy = Ms_xxxyyyyy + (M_0*S_xxxyyyyy + v1593 + 0.000466200466200466d0*(-390.0d0*M_xxxxxyyy - &
      780.0d0*v1131 - 3370.0d0*v1138 + 6530.0d0*v1152 - 615.0d0*v1154 + &
      4962.0d0*v1594 - 285.0d0*v1595 - 75.0d0*(M_xxxxxxxy + v1127) - &
      30.0d0*(M_xxxxxyzz + v1134) - 240.0d0*(M_xyyyyyyy + v1231) - &
      195.0d0*(M_xyyyyyzz + v1233) - 6810.0d0*(v1113 + v1150) + &
      6132.0d0*(v1115 + v1198) - 6450.0d0*(v1118 + v1169) + 2760.0d0*( &
      v1120 + v1228) - 2830.0d0*(v1123 + v1191) - 210.0d0*(v1125 + &
      v1221) - 600.0d0*(v1130 + v1216) - 8160.0d0*(v1137 + v1181) - &
      16530.0d0*(v1144 + v1167) + 10040.0d0*(v1146 + v1226) - 16890.0d0 &
      *(v1148 + v1163) + 15330.0d0*(v1149 + v1222) + 12990.0d0*(v1151 + &
      v1217) - 6720.0d0*(v1153 + v1244) + 24060.0d0*(v1165 + v1196) + &
      40890.0d0*(v1168 + v1192) + 38550.0d0*(v1170 + v1187) + 20550.0d0 &
      *(v1171 + v1183) - 5400.0d0*(v1172 + v1214) - 6300.0d0*(v1177 + &
      v1204) - 135.0d0*(v1126 + v1128 + v1180) + 270.0d0*(v1132 + v1133 &
      + v1243) - 90.0d0*(v1140 + v1142 + v1182) - 1488.0d0*(v1184 + &
      v1200 + v1230) - 585.0d0*(v1185 + v1203 + v1235) - 588.0d0*(v1201 &
      + v1215 + v1232) + 555.0d0*(v1112 + v1124 + v1129 + v1162) + &
      1815.0d0*(v1117 + v1122 + v1135 + v1143) - 7620.0d0*(v1136 + &
      v1156 + v1186 + v1239) + 2520.0d0*(v1155 + v1159 + v1173 + v1176 &
      ) - 2910.0d0*(v1189 + v1199 + v1219 + v1229) - 2970.0d0*(v1194 + &
      v1197 + v1224 + v1227) - 1380.0d0*(v1202 + v1212 + v1234 + v1245 &
      ) - 2100.0d0*(v1205 + v1208 + v1236 + v1240) + 1590.0d0*( &
      M_xxxyyyyy + v1139 + v1141 + v1211 + v1213) - 765.0d0*(v1114 + &
      v1116 + v1157 + v1160 + v1164 + v1166 + v1206 + v1209) - 705.0d0* &
      (v1119 + v1121 + v1145 + v1147 + v1174 + v1178 + v1237 + v1241) - &
      1260.0d0*(v1158 + v1175 + v1188 + v1190 + v1207 + v1218 + v1220 + &
      v1238) - 870.0d0*(v1161 + v1179 + v1193 + v1195 + v1210 + v1223 + &
      v1225 + v1242)))
    S_xxxyyyyz  = v7*(0.0153846153846154d0*(v194 + 6.0d0*v421) + v1605 + v1609 + v420)
    Ms_xxxyyyyz = Ms_xxxyyyyz + (M_0*S_xxxyyyyz - v860*x + 0.0013986013986014d0*(-5.0d0*M_xxxxxxxz - &
      2.0d0*M_xxxxxzzz + 590.0d0*M_xxxyyyyz - 59.0d0*M_xxxyyzzz - &
      31.0d0*v1262 - 9.0d0*v1263 + 204.0d0*v1265 - 10.0d0*v1269 - 6.0d0 &
      *v1277 + 2060.0d0*v1284 - 295.0d0*v1287 - 63.0d0*v1597 + 1730.0d0 &
      *v1599 - 60.0d0*(M_xyyyyyyz + v1386) - 57.0d0*(M_xyyyyzzz + v1391 &
      ) + 19.0d0*(v1247 + v1267) - 710.0d0*(v1248 + v1285) + 2340.0d0*( &
      v1250 + v1344) + 15.0d0*(v1252 + v1274) + 310.0d0*(v1258 + v1351 &
      ) - 215.0d0*(v1259 + v1316) - 139.0d0*(v1261 + v1366) + 486.0d0*( &
      v1264 + v1407) - 76.0d0*(v1268 + v1375) + 630.0d0*(v1270 + v1361 &
      ) - 1170.0d0*(v1273 + v1327) - 720.0d0*(v1275 + v1332) - 30.0d0*( &
      v1276 + v1368) + 3360.0d0*(v1279 + v1392) - 370.0d0*(v1280 + &
      v1317) + 4070.0d0*(v1281 + v1397) + 2820.0d0*(v1282 + v1408) + &
      3830.0d0*(v1286 + v1376) + 3800.0d0*(v1289 + v1380) + 1460.0d0*( &
      v1295 + v1382) + 7320.0d0*(v1303 + v1347) + 10350.0d0*(v1305 + &
      v1352) + 7980.0d0*(v1306 + v1362) + 2670.0d0*(v1307 + v1369) + &
      6020.0d0*(v1308 + v1328) + 10110.0d0*(v1310 + v1333) - 315.0d0*( &
      v1311 + v1370) + 8960.0d0*(v1313 + v1337) + 3200.0d0*(v1319 + &
      v1339) - 70.0d0*(M_xxxxxyyz + v1253 + v1309) + 930.0d0*(v1283 - &
      v1293 - v1304) - 400.0d0*(v1330 + v1343 + v1387) - 20.0d0*(v1342 &
      + v1372 + v1385) - 285.0d0*(v1346 + v1373 + v1390) + 3.0d0*( &
      M_xxxzzzzz + M_xyyzzzzz + v1326 + v1406) - 69.0d0*(v1249 + v1251 &
      + v1299 + v1358) - 65.0d0*(v1254 + v1256 + v1323 + v1403) + &
      1200.0d0*(v1255 - v1288 - v1302 + v1388) - 135.0d0*(v1297 + v1318 &
      + v1320 + v1356) - 450.0d0*(v1335 + v1345 + v1378 + v1389) - &
      140.0d0*(v1338 + v1348 + v1381 + v1393) - 240.0d0*(v1341 + v1364 &
      + v1384 + v1410) - 115.0d0*(v1257 + v1292 + v1294 + v1296 + v1321 &
      + v1401) + 250.0d0*(v1260 - v1340 - v1354 - v1383 + v1396 - v1399 &
      ) + 21.0d0*(v1301 + v1325 + v1360 + v1371 + v1374 + v1405) - &
      114.0d0*(v1266 + v1291 + v1315 + v1329 + v1331 + v1350 + v1395) - &
      570.0d0*(v1290 + v1314 + v1349 + v1363 + v1365 + v1394 + v1409 + &
      v1411) - 390.0d0*(v1298 + v1322 + v1353 + v1355 + v1357 + v1398 + &
      v1400 + v1402) + 120.0d0*(v1271 - v1300 - v1324 - v1334 - v1336 - &
      v1359 + v1367 - v1377 - v1379 - v1404)))
    S_xxyyyyyy  = 0.00512820512820513d0*(15.0d0*v1600 - 13.0d0*v1610) + v10*v428 - v10* &
      v843 - v11*v1414 + v1413 - v1602
    Ms_xxyyyyyy = Ms_xxyyyyyy + (M_0*S_xxyyyyyy + v1416 + v1603 + v1604 + 0.000155400155400155d0*(75.0d0* &
      M_xxxxxxxx - 1005.0d0*M_xxxxxxyy + 105.0d0*M_xxxxxxzz - 900.0d0* &
      M_xxxxyyzz + 25.0d0*M_xxxxzzzz + 4800.0d0*M_xxyyyyyy - 1125.0d0* &
      M_xxyyyyzz - 240.0d0*M_yyyyyyyy - 120.0d0*M_yyyyyyzz + 115.0d0* &
      M_yyyyzzzz + 142520.0d0*v1009 + 9952.0d0*v1013 - 97720.0d0*v1016 &
      - 5440.0d0*v1042 - 1568.0d0*v1047 - 128.0d0*v1048 - 480.0d0*v1050 &
      + 690.0d0*v1055 - 1400.0d0*v1057 + 50.0d0*v1423 + 230.0d0*v1424 - &
      3130.0d0*v926 + 370.0d0*v934 + 190.0d0*v936 - 1320.0d0*v938 + &
      420.0d0*v940 - 5190.0d0*v945 + 1110.0d0*v946 + 150.0d0*v952 - &
      16620.0d0*v956 - 1590.0d0*v958 + 22080.0d0*v977 - 11220.0d0*v978 &
      - 2490.0d0*v980 - 4020.0d0*(v1002 + v937) + 46272.0d0*(v1003 + &
      v1012) - 3840.0d0*(v1004 + v931) - 52500.0d0*(v1005 + v955) + &
      107580.0d0*(v1007 + v1011) - 4560.0d0*(v1010 + v924) - 21480.0d0* &
      (v1014 + v1025) + 11480.0d0*(v1015 + v961) + 12480.0d0*(v1023 + &
      v957) - 1635.0d0*(v1027 + v933) - 30.0d0*(v1028 + v944) + &
      51870.0d0*(v1030 + v976) - 3825.0d0*(v1031 + v984) - 2445.0d0*( &
      v1033 + v1054) + 6870.0d0*(v1035 + v942) + 70620.0d0*(v1036 + &
      v974) - 5280.0d0*(v1038 + v1045) + 55470.0d0*(v1040 + v972) + &
      24960.0d0*(v1044 + v969) + 5520.0d0*(v1046 + v918) + 192.0d0*( &
      v1049 + v1076) - 13520.0d0*(v1051 + v994) - 380.0d0*(v1052 + &
      v1065) - 2730.0d0*(v1053 + v919) - 41440.0d0*(v1056 + v986) + &
      610.0d0*(v1062 + v949) - 54040.0d0*(v1063 + v982) - 36840.0d0*( &
      v1074 + v979) - 69840.0d0*(v1417 + v1419) - 3888.0d0*(v1421 + &
      v1422) + 90.0d0*(v912 + v932) + 9165.0d0*(v913 + v943) - &
      21540.0d0*(v915 + v975) - 2475.0d0*(v916 + v983) - 1770.0d0*(v921 &
      + v930) + 17700.0d0*(v922 + v954) + 6015.0d0*(v927 + v971) - &
      2240.0d0*(v935 + v960) + 16140.0d0*(v941 + v966) - 1010.0d0*(v948 &
      + v991) + 35840.0d0*(v953 + v985) - 69960.0d0*(v967 + v973) + &
      19940.0d0*(v981 + v992) + 165.0d0*(v1000 + v1071 + v917 + v920) - &
      2760.0d0*(v1006 + v1008 + v1018 + v963) - 330.0d0*(v1017 + v923 + &
      v925 + v962) - 3930.0d0*(v1037 + v1039 + v1059 + v988) - 1845.0d0 &
      *(v1041 + v1043 + v1068 + v997) - 5460.0d0*(v1058 + v968 + v970 + &
      v987) + 970.0d0*(v1064 + v1066 + v1070 + v999) - 270.0d0*(v1067 + &
      v928 + v929 + v996) + 430.0d0*(v1069 + v993 + v995 + v998) + &
      255.0d0*(v1001 + v1032 + v1034 + v1072 + v914 + v950) + 300.0d0*( &
      v1019 + v1022 + v1024 + v1026 + v939 + v964) + 1380.0d0*(-v1029 + &
      v1060 + v1073 + v1075 + v1077 + v947 - v951 + v989)))
    S_xxyyyyyz  = v8*(v1596 + v1634 + 0.00512820512820513d0*(-13.0d0*v419 + 10.0d0*v421))
    Ms_xxyyyyyz = Ms_xxyyyyyz + (M_0*S_xxyyyyyz + v1436 - v542*z + 0.000466200466200466d0*(-350.0d0* &
      M_xxxxyyyz + 1850.0d0*M_xxyyyyyz - 185.0d0*M_xxyyyzzz - 80.0d0* &
      M_yyyyyyyz - 65.0d0*M_yyyyyzzz + 1020.0d0*v1456 - 480.0d0*v1457 - &
      3340.0d0*v1469 + 3726.0d0*v1489 + 7310.0d0*v1490 - 925.0d0*v1493 &
      + 3764.0d0*v1523 - 144.0d0*v1556 - 496.0d0*v1557 - 325.0d0*v1560 &
      - 195.0d0*v1564 - 135.0d0*(M_xxxxxxyz + v1449) - 120.0d0*( &
      M_xxxxyzzz + v1464) - 2190.0d0*(v1438 + v1491) + 2436.0d0*(v1440 &
      + v1558) + 2940.0d0*(v1443 + v1525) + 2790.0d0*(v1445 + v1565) + &
      6540.0d0*(v1454 + v1574) + 4770.0d0*(v1455 + v1584) + 150.0d0*( &
      v1459 + v1541) + 280.0d0*(v1462 + v1546) - 600.0d0*(v1463 + v1585 &
      ) + 6300.0d0*(v1466 + v1529) + 1620.0d0*(v1467 + v1533) - &
      1740.0d0*(v1468 + v1537) - 7740.0d0*(v1470 + v1515) - 7620.0d0*( &
      v1472 + v1519) - 3220.0d0*(v1476 + v1521) - 5550.0d0*(v1480 + &
      v1494) + 8940.0d0*(v1482 + v1561) - 8970.0d0*(v1484 + v1497) + &
      17130.0d0*(v1485 + v1566) - 5610.0d0*(v1486 + v1506) + 19710.0d0* &
      (v1487 + v1575) + 12810.0d0*(v1488 + v1586) + 16470.0d0*(v1492 + &
      v1542) + 21650.0d0*(v1495 + v1547) + 15080.0d0*(v1499 + v1551) + &
      4440.0d0*(v1508 + v1553) + 14940.0d0*(v1517 + v1524) + 32280.0d0* &
      (v1520 + v1526) + 7644.0d0*(v1522 + v1539) - 774.0d0*(v1544 + &
      v1559) - 530.0d0*(v1549 + v1562) - 1350.0d0*(v1554 + v1577) - &
      816.0d0*(v1555 + v1587) - 975.0d0*(v1563 + v1588) + 26580.0d0*( &
      v1606 + v1607) + 40040.0d0*(v1611 + v1612) - 705.0d0*(v1447 + &
      v1448 + v1583) + 885.0d0*(v1437 + v1458 + v1461 + v1479) + &
      840.0d0*(v1442 + v1465 + v1471 + v1475) - 1965.0d0*(v1444 + v1453 &
      + v1496 + v1505) - 2520.0d0*(v1446 + v1450 + v1532 + v1536) - &
      1500.0d0*(v1502 + v1571 + v1576 + v1578) - 510.0d0*(v1504 + v1543 &
      + v1545 + v1573) - 380.0d0*(v1513 + v1548 + v1550 + v1582) - &
      850.0d0*(v1511 + v1552 + v1567 + v1568 + v1569 + v1580) - 435.0d0 &
      *(v1439 + v1441 + v1481 + v1483 + v1503 + v1512 + v1572 + v1581) &
      - 1200.0d0*(v1473 + v1477 + v1527 + v1530 + v1534 + v1535 + v1538 &
      + v1540) - 1125.0d0*(v1498 + v1500 + v1501 + v1507 + v1509 + &
      v1510 + v1570 + v1579) - 240.0d0*(v1451 + v1452 + v1474 + v1478 + &
      v1514 + v1516 + v1518 + v1528 + v1531)))
    S_xyyyyyyy  = v1613*v6
    Ms_xyyyyyyy = Ms_xyyyyyyy + (M_0*S_xyyyyyyy + v1111 - v1614*(M_xxxxxyy + M_xxxyyzz) + &
      0.0013986013986014d0*(-175.0d0*M_xxxxxyyy - 560.0d0*M_xxxyyyyy + &
      245.0d0*v1138 - 1680.0d0*v1152 - 2352.0d0*v1594 + 35.0d0*v1595 + &
      70.0d0*(M_xxxxxxxy + v1127) + 105.0d0*(M_xxxxxyzz + v1134) + &
      400.0d0*(M_xyyyyyyy + v1231) + 2660.0d0*(v1113 + v1150) - 672.0d0 &
      *(v1115 + v1198) + 1400.0d0*(v1118 + v1169) - 1645.0d0*(v1123 + &
      v1191) - 2205.0d0*(v1136 + v1186) + 5880.0d0*(v1144 + v1167) + &
      7140.0d0*(v1148 + v1163) + 2170.0d0*(v1149 + v1222) - 1190.0d0*( &
      v1151 + v1217) - 10290.0d0*(v1168 + v1192) - 13650.0d0*(v1170 + &
      v1187) - 8400.0d0*(v1171 + v1183) + 3500.0d0*(v1172 + v1214) + &
      2800.0d0*(v1177 + v1204) + 2128.0d0*(v1184 + v1200 + v1230) - &
      840.0d0*(v1185 + v1203 + v1235) - 1792.0d0*(v1201 + v1215 + v1232 &
      ) - 1540.0d0*(v1117 + v1122 + v1135 + v1143) + 3360.0d0*(v1146 - &
      v1165 - v1196 + v1226) + 12320.0d0*(v1194 + v1197 + v1224 + v1227 &
      ) - 11900.0d0*(v1205 + v1208 + v1236 + v1240) + 315.0d0*(-v1137 + &
      v1140 + v1142 - v1181 + v1182) + 1120.0d0*(v1120 - v1155 - v1159 &
      - v1173 - v1176 + v1228) + 280.0d0*(-M_xyyyyyzz + v1126 + v1128 - &
      v1156 + v1180 - v1233 - v1239) + 6720.0d0*(v1189 + v1199 - v1202 &
      - v1212 + v1219 + v1229 - v1234 - v1245) + 420.0d0*(-v1119 - &
      v1121 - v1145 - v1147 + v1153 - v1174 - v1178 - v1237 - v1241 + &
      v1244) - 805.0d0*(v1125 + v1161 + v1179 + v1193 + v1195 + v1210 + &
      v1221 + v1223 + v1225 + v1242) - 1365.0d0*(v1130 + v1158 + v1175 &
      + v1188 + v1190 + v1207 + v1216 + v1218 + v1220 + v1238) + &
      210.0d0*(-v1112 - v1114 - v1116 - v1124 - v1129 + v1132 + v1133 + &
      v1139 + v1141 - v1157 - v1160 - v1162 - v1164 - v1166 - v1206 - &
      v1209 + v1211 + v1213 + v1243)))
    S_xyyyyyyz  = v7*(0.0769230769230769d0*(3.0d0*v421) - v419 + v428 + v844)
    Ms_xyyyyyyz = Ms_xyyyyyyz + (M_0*S_xyyyyyyz + v1598 + 0.00699300699300699d0*(2.0d0*M_xxxxxxxz + 3.0d0 &
      *M_xxxxxzzz - 141.0d0*v1265 + 9.0d0*v1277 - 135.0d0*v1287 - &
      340.0d0*v1599 - 27.0d0*(M_xxxxxyyz + M_xxxyyzzz) + 112.0d0*( &
      M_xyyyyyyz + v1386) - 50.0d0*(v1252 + v1274) - 465.0d0*(v1258 + &
      v1351) + 42.0d0*(v1259 + v1316) - 177.0d0*(v1260 + v1396) + &
      38.0d0*(v1261 + v1366) + 8.0d0*(v1262 + v1263) + 15.0d0*(v1269 - &
      v1272) - 780.0d0*(v1270 + v1361) - 345.0d0*(v1271 + v1367) - &
      75.0d0*(v1275 + v1332) + 45.0d0*(v1276 + v1368) + 990.0d0*(v1281 &
      + v1397) + 280.0d0*(v1282 + v1408) + 480.0d0*(v1288 + v1302) - &
      510.0d0*(v1305 + v1352) - 1080.0d0*(v1306 + v1362) - 540.0d0*( &
      v1307 + v1369) - 1000.0d0*(v1308 + v1328) - 1470.0d0*(v1310 + &
      v1333) + 512.0d0*(v1330 + v1343 + v1387) + 272.0d0*(v1342 + v1372 &
      + v1385) - 150.0d0*(v1346 + v1373 + v1390) + 30.0d0*(-M_xyyyyzzz &
      + v1286 + v1376 - v1391) - 18.0d0*(v1254 + v1256 + v1323 + v1403 &
      ) + 400.0d0*(v1255 - v1319 - v1339 + v1388) + 1120.0d0*(v1279 - &
      v1313 - v1337 + v1392) + 10.0d0*(v1297 + v1318 + v1320 + v1356) + &
      1500.0d0*(v1335 + v1345 + v1378 + v1389) + 2520.0d0*(v1338 + &
      v1348 + v1381 + v1393) + 2300.0d0*(v1340 + v1354 + v1383 + v1399 &
      ) + 1152.0d0*(v1341 + v1364 + v1384 + v1410) + 120.0d0*(v1250 - &
      v1284 + v1295 + v1344 + v1382) - 12.0d0*(v1247 + v1249 + v1251 + &
      v1267 + v1299 + v1358) - 20.0d0*(v1257 + v1283 + v1292 + v1294 + &
      v1296 + v1321 + v1401) + 240.0d0*(v1248 + v1285 + v1289 + v1293 + &
      v1303 + v1304 + v1347 + v1380) - 185.0d0*(v1298 + v1322 + v1353 + &
      v1355 + v1357 + v1398 + v1400 + v1402) - 300.0d0*(v1264 + v1290 + &
      v1314 + v1349 + v1363 + v1365 + v1394 + v1407 + v1409 + v1411) - &
      51.0d0*(v1268 + v1300 + v1324 + v1334 + v1336 + v1359 + v1375 + &
      v1377 + v1379 + v1404) + 60.0d0*(-M_xxxyyyyz - v1253 - v1266 - &
      v1273 + v1280 - v1291 - v1309 - v1315 + v1317 - v1327 - v1329 - &
      v1331 - v1350 - v1395)))
    S_yyyyyyyy  = b8 + v883 + 0.000466200466200466d0*(2310.0d0*v1600 - 420.0d0*v1601 - &
      4004.0d0*v1610)
    Ms_yyyyyyyy = Ms_yyyyyyyy + (M_0*S_yyyyyyyy + v911 + 0.000155400155400155d0*(-105.0d0*M_xxxxxxxx - &
      210.0d0*M_xxxxxxzz + 3150.0d0*M_xxxxyyzz - 140.0d0*M_xxxxzzzz + &
      1920.0d0*M_yyyyyyyy - 259840.0d0*v1009 + 220640.0d0*v1016 + &
      183680.0d0*v1042 + 11776.0d0*v1047 - 224000.0d0*v1057 + 5810.0d0* &
      v926 - 8400.0d0*(v1005 + v955) - 188160.0d0*(v1007 + v1011) - &
      17024.0d0*(v1013 + v1048) - 280.0d0*(v1020 + v965) - 32340.0d0*( &
      v1028 + v944) + 5460.0d0*(v1029 + v951) - 31500.0d0*(v1031 + v984 &
      ) - 36960.0d0*(v1033 + v1054) + 134400.0d0*(v1038 + v1045) - &
      8960.0d0*(v1051 + v994) - 170240.0d0*(v1052 + v1065) - 17920.0d0* &
      (v1056 + v986) + 7280.0d0*(v1063 + v982) + 161280.0d0*(v1417 + &
      v1419) + 52416.0d0*(v1421 + v1422) - 14280.0d0*(v913 + v943) - &
      12600.0d0*(v916 + v983) - 33600.0d0*(v922 + v954) - 7980.0d0*( &
      v927 + v971) - 560.0d0*(v934 + v936) + 4480.0d0*(v935 + v960) - &
      71680.0d0*(v953 + v985) + 107520.0d0*(v967 + v973) - 38080.0d0*( &
      v981 + v992) + 5880.0d0*(v938 + v946 + v958) + 6720.0d0*( &
      -M_xxyyyyyy + v1055 - v945 - v980) - 75264.0d0*(v1003 + v1012 + &
      v1049 + v1076) + 2240.0d0*(v1015 + v1061 + v961 + v990) - &
      20160.0d0*(v1041 + v1043 + v1068 + v997) + 1890.0d0*(v1067 + v928 &
      + v929 + v996) + 2100.0d0*(M_xxxxxxyy + v1001 + v1032 + v1034 + &
      v1072) + 10920.0d0*(v1004 + v1006 + v1008 + v1018 + v931 + v963) &
      + 53760.0d0*(v1014 + v1025 + v1040 + v1044 + v969 + v972) - &
      1680.0d0*(v1019 + v1022 + v1024 + v1026 + v939 + v964) + 8680.0d0 &
      *(v1062 + v1064 + v1066 + v1070 + v949 + v999) + 1120.0d0*( &
      M_yyyyzzzz + v1069 + v948 + v991 + v993 + v995 + v998) + 840.0d0* &
      (v1000 + v1071 + v914 + v917 + v920 - v940 + v950 - v952) - &
      47040.0d0*(v1030 + v1035 + v1037 + v1039 + v1059 + v942 + v976 + &
      v988) + 3360.0d0*(-M_yyyyyyzz + v1017 - v1023 + v1027 + v921 + &
      v923 + v925 + v930 + v933 - v957 + v962) + 26880.0d0*(-v1010 - &
      v1058 + v1074 + v915 - v924 - v941 - v966 - v968 - v970 + v975 - &
      v977 + v979 - v987) + 13440.0d0*(v1002 - v1036 + v1046 - v1050 - &
      v1053 + v1060 + v1073 + v1075 + v1077 + v918 - v919 + v937 + v947 &
      + v956 - v974 + v978 + v989)))
    S_yyyyyyyz  = v1613*v8
    Ms_yyyyyyyz = Ms_yyyyyyyz + (M_0*S_yyyyyyyz - v1614*(M_xxxxyyz + M_xxyyzzz) + 0.0013986013986014d0*( &
      -560.0d0*M_xxyyyyyz + 400.0d0*M_yyyyyyyz - 1085.0d0*v1456 - &
      1008.0d0*v1489 - 875.0d0*v1493 - 1792.0d0*v1523 + 1072.0d0*v1556 &
      + 2128.0d0*v1557 - 1400.0d0*v1560 + 70.0d0*(M_xxxxxxyz + v1449) - &
      175.0d0*(M_xxxxyyyz + M_xxyyyzzz) + 105.0d0*(M_xxxxyzzz + v1464) &
      - 3675.0d0*(v1425 + v1433) + 1820.0d0*(v1438 + v1491) + 2912.0d0* &
      (v1440 + v1558) - 3920.0d0*(v1443 + v1525) - 2345.0d0*(v1445 + &
      v1565) - 5145.0d0*(v1454 + v1574) - 3885.0d0*(v1455 + v1584) - &
      8400.0d0*(v1466 + v1529) - 5460.0d0*(v1467 + v1533) - 980.0d0*( &
      v1468 + v1537) + 6300.0d0*(v1480 + v1494) + 10080.0d0*(v1482 + &
      v1561) + 7560.0d0*(v1484 + v1497) + 10710.0d0*(v1485 + v1566) + &
      3080.0d0*(v1486 + v1506) + 2870.0d0*(v1487 + v1575) - 1610.0d0*( &
      v1492 + v1542) + 1750.0d0*(v1495 + v1547) + 3360.0d0*(v1499 + &
      v1551) - 6720.0d0*(v1517 + v1524) - 15540.0d0*(v1520 + v1526) - &
      4032.0d0*(v1522 + v1539) + 8512.0d0*(v1544 + v1559) + 19040.0d0*( &
      v1549 + v1562) + 22400.0d0*(v1552 + v1568) + 14560.0d0*(v1554 + &
      v1577) + 5488.0d0*(v1555 + v1587) - 4200.0d0*(v1563 + v1588) - &
      13440.0d0*(v1606 + v1607) - 20020.0d0*(v1611 + v1612) + 525.0d0*( &
      v1460 + v1463 + v1585) - 1680.0d0*(v1488 + v1490 + v1586) + &
      35.0d0*(M_xxyzzzzz + M_yyyzzzzz + v1429 + v1432) + 280.0d0*( &
      -M_yyyyyzzz + v1447 + v1448 + v1583) - 5425.0d0*(v1502 + v1571 + &
      v1576 + v1578) - 2625.0d0*(v1511 + v1567 + v1569 + v1580) - &
      840.0d0*(v1472 + v1476 + v1519 + v1521 + v1564) + 245.0d0*(v1427 &
      + v1428 + v1430 + v1431 + v1434 + v1435) + 1120.0d0*(-v1442 - &
      v1465 - v1471 - v1475 + v1508 + v1553) - 1575.0d0*(v1459 + v1504 &
      + v1541 + v1543 + v1545 + v1573) - 1015.0d0*(v1462 + v1513 + &
      v1546 + v1548 + v1550 + v1582) + 420.0d0*(v1444 + v1453 + v1469 + &
      v1470 + v1496 + v1505 + v1515) - 700.0d0*(v1498 + v1500 + v1501 + &
      v1507 + v1509 + v1510 + v1570 + v1579) + 210.0d0*(v1451 + v1452 + &
      v1474 + v1478 + v1514 + v1516 + v1518 + v1528 + v1531) - 630.0d0* &
      (v1437 + v1439 + v1441 + v1458 + v1461 + v1479 + v1481 + v1483 + &
      v1503 + v1512 + v1572 + v1581) + 1050.0d0*(v1446 + v1450 + v1473 &
      + v1477 + v1527 + v1530 + v1532 + v1534 + v1535 + v1536 + v1538 + &
      v1540)))
#undef  M_0                 
#undef  Ms_0                
#undef  z                   
#undef  y                   
#undef  x                   
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
#undef  M_xyy               
#undef  Ms_xyy              
#undef  M_xyz               
#undef  Ms_xyz              
#undef  Ms_yyy              
#undef  M_yyy               
#undef  M_yyz               
#undef  Ms_yyz              
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
#undef  M_xyyy              
#undef  Ms_xyyy             
#undef  Ms_xyyz             
#undef  M_xyyz              
#undef  Ms_yyyy             
#undef  M_yyyy              
#undef  Ms_yyyz             
#undef  M_yyyz              
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
#undef  M_xxyyy             
#undef  Ms_xxyyy            
#undef  M_xxyyz             
#undef  Ms_xxyyz            
#undef  Ms_xyyyy            
#undef  M_xyyyy             
#undef  M_xyyyz             
#undef  Ms_xyyyz            
#undef  Ms_yyyyy            
#undef  M_yyyyy             
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
#undef  Ms_xxyyyz           
#undef  M_xxyyyz            
#undef  M_xyyyyy            
#undef  Ms_xyyyyy           
#undef  Ms_xyyyyz           
#undef  M_xyyyyz            
#undef  Ms_yyyyyy           
#undef  M_yyyyyy            
#undef  M_yyyyyz            
#undef  Ms_yyyyyz           
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
#undef  M_xxyyyyz           
#undef  Ms_xxyyyyz          
#undef  M_xyyyyyy           
#undef  Ms_xyyyyyy          
#undef  M_xyyyyyz           
#undef  Ms_xyyyyyz          
#undef  M_yyyyyyy           
#undef  Ms_yyyyyyy          
#undef  Ms_yyyyyyz          
#undef  M_yyyyyyz           
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
#undef  M_xxxxxyyy          
#undef  Ms_xxxxxyyy         
#undef  Ms_xxxxxyyz         
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  Ms_xxxxyyyy         
#undef  Ms_xxxxyyyz         
#undef  M_xxxxyyyz          
#undef  M_xxxyyyyy          
#undef  Ms_xxxyyyyy         
#undef  M_xxxyyyyz          
#undef  Ms_xxxyyyyz         
#undef  M_xxyyyyyy          
#undef  Ms_xxyyyyyy         
#undef  M_xxyyyyyz          
#undef  Ms_xxyyyyyz         
#undef  M_xyyyyyyy          
#undef  Ms_xyyyyyyy         
#undef  M_xyyyyyyz          
#undef  Ms_xyyyyyyz         
#undef  Ms_yyyyyyyy         
#undef  M_yyyyyyyy          
#undef  Ms_yyyyyyyz         
#undef  M_yyyyyyyz          
    end subroutine mom_es_M2M_add
    
! OPS  2912*ADD + 2*DIV + 3777*MUL + 253*NEG + POW + 84*SUB = 7029  (9178 before optimization)
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
                v598, v599, v6, v60, v600, v601, v602, v603, v604, v605, v606,&
                v607, v608, v609, v61, v610, v611, v612, v613, v614, v615,&
                v616, v617, v618, v619, v62, v620, v621, v622, v623, v624,&
                v625, v626, v627, v628, v629, v63, v630, v631, v632, v633,&
                v634, v635, v636, v637, v638, v639, v64, v640, v641, v642,&
                v643, v644, v645, v646, v647, v648, v649, v65, v650, v651,&
                v652, v653, v654, v655, v656, v657, v658, v659, v66, v660,&
                v661, v662, v663, v664, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz,&
                D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz,&
                D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz,&
                D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy,&
                D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz,&
                D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz,&
                D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz,&
                D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz,&
                D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy, D_xxxxxxz,&
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
                D_zzzzzzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
                M_xxxyyzz, M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz,&
                M_xxyzzzz, M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz,&
                M_xyzzzzz, M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz,&
                M_yyzzzzz, M_yzzzzzz, M_zzzzzzz, M_xxxxxxzz, M_xxxxxyzz,&
                M_xxxxxzzz, M_xxxxyyzz, M_xxxxyzzz, M_xxxxzzzz, M_xxxyyyzz,&
                M_xxxyyzzz, M_xxxyzzzz, M_xxxzzzzz, M_xxyyyyzz, M_xxyyyzzz,&
                M_xxyyzzzz, M_xxyzzzzz, M_xxzzzzzz, M_xyyyyyzz, M_xyyyyzzz,&
                M_xyyyzzzz, M_xyyzzzzz, M_xyzzzzzz, M_xzzzzzzz, M_yyyyyyzz,&
                M_yyyyyzzz, M_yyyyzzzz, M_yyyzzzzz, M_yyzzzzzz, M_yzzzzzzz,&
                M_zzzzzzzz
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
#define M_xxx                M(6)
#define L_yy                 L(6)
#define L_yz                 L(7)
#define M_xxy                M(7)
#define M_xxz                M(8)
#define L_xxx                L(8)
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
#define M_xxxyyy             M(38)
#define L_xxxxyy             L(38)
#define L_xxxxyz             L(39)
#define M_xxxyyz             M(39)
#define L_xxxyyy             L(40)
#define M_xxyyyy             M(40)
#define L_xxxyyz             L(41)
#define M_xxyyyz             M(41)
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
#define M_xxxxxxxx           M(61)
#define L_yyyyyyy            L(61)
#define L_yyyyyyz            L(62)
#define M_xxxxxxxy           M(62)
#define M_xxxxxxxz           M(63)
#define L_xxxxxxxx           L(63)
#define M_xxxxxxyy           M(64)
#define L_xxxxxxxy           L(64)
#define M_xxxxxxyz           M(65)
#define L_xxxxxxxz           L(65)
#define L_xxxxxxyy           L(66)
#define M_xxxxxyyy           M(66)
#define L_xxxxxxyz           L(67)
#define M_xxxxxyyz           M(67)
#define M_xxxxyyyy           M(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define M_xxxxyyyz           M(69)
#define L_xxxxyyyy           L(70)
#define M_xxxyyyyy           M(70)
#define L_xxxxyyyz           L(71)
#define M_xxxyyyyz           M(71)
#define M_xxyyyyyy           M(72)
#define L_xxxyyyyy           L(72)
#define M_xxyyyyyz           M(73)
#define L_xxxyyyyz           L(73)
#define L_xxyyyyyy           L(74)
#define M_xyyyyyyy           M(74)
#define M_xyyyyyyz           M(75)
#define L_xxyyyyyz           L(75)
#define L_xyyyyyyy           L(76)
#define M_yyyyyyyy           M(76)
#define M_yyyyyyyz           M(77)
#define L_xyyyyyyz           L(77)
#define L_yyyyyyyy           L(78)
#define L_yyyyyyyz           L(79)
#define L_xxxxxxxxx          L(80)
#define L_xxxxxxxxy          L(81)
#define L_xxxxxxxxz          L(82)
#define L_xxxxxxxyy          L(83)
#define L_xxxxxxxyz          L(84)
#define L_xxxxxxyyy          L(85)
#define L_xxxxxxyyz          L(86)
#define L_xxxxxyyyy          L(87)
#define L_xxxxxyyyz          L(88)
#define L_xxxxyyyyy          L(89)
#define L_xxxxyyyyz          L(90)
#define L_xxxyyyyyy          L(91)
#define L_xxxyyyyyz          L(92)
#define L_xxyyyyyyy          L(93)
#define L_xxyyyyyyz          L(94)
#define L_xyyyyyyyy          L(95)
#define L_xyyyyyyyz          L(96)
#define L_yyyyyyyyy          L(97)
#define L_yyyyyyyyz          L(98)
    v659        = y*z
    v660        = x*y
    v639        = 15.0d0*v659
    v641        = v660
    v643        = v659
    v142        = 0.5d0*M_xx
    v152        = 0.166666666666667d0*M_xxx
    v153        = 0.5d0*M_xxy
    v154        = 0.5d0*M_xxz
    v173        = 0.0416666666666667d0*M_xxxx
    v174        = 0.166666666666667d0*M_xxxy
    v175        = 0.166666666666667d0*M_xxxz
    v176        = 0.25d0*M_xxyy
    v177        = 0.5d0*M_xxyz
    v211        = 0.00833333333333333d0*M_xxxxx
    v212        = 0.0416666666666667d0*M_xxxxy
    v213        = 0.0416666666666667d0*M_xxxxz
    v214        = 0.0833333333333333d0*M_xxxyy
    v215        = 0.166666666666667d0*M_xxxyz
    v217        = 0.0833333333333333d0*M_xxyyy
    v218        = 0.25d0*M_xxyyz
    v279        = 0.00138888888888889d0*M_xxxxxx
    v280        = 0.00833333333333333d0*M_xxxxxy
    v281        = 0.00833333333333333d0*M_xxxxxz
    v282        = 0.0208333333333333d0*M_xxxxyy
    v283        = 0.0416666666666667d0*M_xxxxyz
    v285        = 0.0277777777777778d0*M_xxxyyy
    v286        = 0.0833333333333333d0*M_xxxyyz
    v289        = 0.0208333333333333d0*M_xxyyyy
    v290        = 0.0833333333333333d0*M_xxyyyz
    v388        = 0.000198412698412698d0*M_xxxxxxx
    v389        = 0.00138888888888889d0*M_xxxxxxy
    v390        = 0.00138888888888889d0*M_xxxxxxz
    v391        = 0.00416666666666667d0*M_xxxxxyy
    v392        = 0.00833333333333333d0*M_xxxxxyz
    v394        = 0.00694444444444444d0*M_xxxxyyy
    v395        = 0.0208333333333333d0*M_xxxxyyz
    v398        = 0.00694444444444444d0*M_xxxyyyy
    v399        = 0.0277777777777778d0*M_xxxyyyz
    v403        = 0.00416666666666667d0*M_xxyyyyy
    v404        = 0.0208333333333333d0*M_xxyyyyz
    v450        = 0.5d0*M_yy
    v452        = 0.166666666666667d0*M_yyy
    v457        = 0.0416666666666667d0*M_yyyy
    v466        = 0.00833333333333333d0*M_yyyyy
    v482        = 0.00138888888888889d0*M_yyyyyy
    v506        = 0.000198412698412698d0*M_yyyyyyy
    v541        = 2.48015873015873d-5*M_xxxxxxxx
    v542        = 0.000198412698412698d0*M_xxxxxxxy
    v543        = 0.000198412698412698d0*M_xxxxxxxz
    v544        = 0.000694444444444444d0*M_xxxxxxyy
    v545        = 0.00138888888888889d0*M_xxxxxxyz
    v547        = 0.00138888888888889d0*M_xxxxxyyy
    v548        = 0.00416666666666667d0*M_xxxxxyyz
    v551        = 0.00173611111111111d0*M_xxxxyyyy
    v552        = 0.00694444444444444d0*M_xxxxyyyz
    v556        = 0.00138888888888889d0*M_xxxyyyyy
    v557        = 0.00694444444444444d0*M_xxxyyyyz
    v562        = 0.000694444444444444d0*M_xxyyyyyy
    v563        = 0.00416666666666667d0*M_xxyyyyyz
    v569        = 2.48015873015873d-5*M_yyyyyyyy
    v570        = 0.000198412698412698d0*M_yyyyyyyz
    v571        = 0.00138888888888889d0*M_yyyyyyz
    v573        = 0.00833333333333333d0*M_yyyyyz
    v576        = 0.0416666666666667d0*M_yyyyz
    v580        = 0.166666666666667d0*M_yyyz
    v585        = 0.5d0*M_yyz
    v598        = 0.5d0*M_xyy
    v600        = 0.166666666666667d0*M_xyyy
    v602        = 0.0416666666666667d0*M_xyyyy
    v604        = 0.00833333333333333d0*M_xyyyyy
    v606        = 0.00138888888888889d0*M_xyyyyyy
    v608        = 0.000198412698412698d0*M_xyyyyyyy
    M_zz        = -(M_xx + M_yy)
    v591        = 0.5d0*M_zz
    M_xzz       = -(M_xxx + M_xyy)
    M_yzz       = -(M_xxy + M_yyy)
    v599        = 0.5d0*M_yzz
    M_zzz       = -(M_xxz + M_yyz)
    v592        = 0.166666666666667d0*M_zzz
    M_xxzz      = -(M_xxxx + M_xxyy)
    v178        = 0.25d0*M_xxzz
    M_xyzz      = -(M_xxxy + M_xyyy)
    M_xzzz      = -(M_xxxz + M_xyyz)
    M_yyzz      = -(M_xxyy + M_yyyy)
    v586        = 0.25d0*M_yyzz
    M_yzzz      = -(M_xxyz + M_yyyz)
    v601        = 0.166666666666667d0*M_yzzz
    M_zzzz      = -(M_xxzz + M_yyzz)
    v593        = 0.0416666666666667d0*M_zzzz
    M_xxxzz     = -(M_xxxxx + M_xxxyy)
    v216        = 0.0833333333333333d0*M_xxxzz
    M_xxyzz     = -(M_xxxxy + M_xxyyy)
    v219        = 0.25d0*M_xxyzz
    M_xxzzz     = -(M_xxxxz + M_xxyyz)
    v220        = 0.0833333333333333d0*M_xxzzz
    M_xyyzz     = -(M_xxxyy + M_xyyyy)
    M_xyzzz     = -(M_xxxyz + M_xyyyz)
    M_xzzzz     = -(M_xxxzz + M_xyyzz)
    M_yyyzz     = -(M_xxyyy + M_yyyyy)
    v581        = 0.0833333333333333d0*M_yyyzz
    M_yyzzz     = -(M_xxyyz + M_yyyyz)
    v587        = 0.0833333333333333d0*M_yyzzz
    M_yzzzz     = -(M_xxyzz + M_yyyzz)
    v603        = 0.0416666666666667d0*M_yzzzz
    M_zzzzz     = -(M_xxzzz + M_yyzzz)
    v594        = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz    = -(M_xxxxxx + M_xxxxyy)
    v284        = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz    = -(M_xxxxxy + M_xxxyyy)
    v287        = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz    = -(M_xxxxxz + M_xxxyyz)
    v288        = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz    = -(M_xxxxyy + M_xxyyyy)
    v291        = 0.125d0*M_xxyyzz
    M_xxyzzz    = -(M_xxxxyz + M_xxyyyz)
    v292        = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz    = -(M_xxxxzz + M_xxyyzz)
    v293        = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz    = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz    = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz    = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz    = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz    = -(M_xxyyyy + M_yyyyyy)
    v577        = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz    = -(M_xxyyyz + M_yyyyyz)
    v582        = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz    = -(M_xxyyzz + M_yyyyzz)
    v588        = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz    = -(M_xxyzzz + M_yyyzzz)
    v605        = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz    = -(M_xxzzzz + M_yyzzzz)
    v595        = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz   = -(M_xxxxxxx + M_xxxxxyy)
    v393        = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz   = -(M_xxxxxxy + M_xxxxyyy)
    v396        = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz   = -(M_xxxxxxz + M_xxxxyyz)
    v397        = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz   = -(M_xxxxxyy + M_xxxyyyy)
    v400        = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz   = -(M_xxxxxyz + M_xxxyyyz)
    v401        = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz   = -(M_xxxxxzz + M_xxxyyzz)
    v402        = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz   = -(M_xxxxyyy + M_xxyyyyy)
    v405        = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz   = -(M_xxxxyyz + M_xxyyyyz)
    v406        = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz   = -(M_xxxxyzz + M_xxyyyzz)
    v407        = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz   = -(M_xxxxzzz + M_xxyyzzz)
    v408        = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz   = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz   = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz   = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz   = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz   = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz   = -(M_xxyyyyy + M_yyyyyyy)
    v574        = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz   = -(M_xxyyyyz + M_yyyyyyz)
    v578        = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz   = -(M_xxyyyzz + M_yyyyyzz)
    v583        = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz   = -(M_xxyyzzz + M_yyyyzzz)
    v589        = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz   = -(M_xxyzzzz + M_yyyzzzz)
    v607        = 0.00138888888888889d0*M_yzzzzzz
    M_zzzzzzz   = -(M_xxzzzzz + M_yyzzzzz)
    v596        = 0.000198412698412698d0*M_zzzzzzz
    M_xxxxxxzz  = -(M_xxxxxxxx + M_xxxxxxyy)
    v546        = 0.000694444444444444d0*M_xxxxxxzz
    M_xxxxxyzz  = -(M_xxxxxxxy + M_xxxxxyyy)
    v549        = 0.00416666666666667d0*M_xxxxxyzz
    M_xxxxxzzz  = -(M_xxxxxxxz + M_xxxxxyyz)
    v550        = 0.00138888888888889d0*M_xxxxxzzz
    M_xxxxyyzz  = -(M_xxxxxxyy + M_xxxxyyyy)
    v553        = 0.0104166666666667d0*M_xxxxyyzz
    M_xxxxyzzz  = -(M_xxxxxxyz + M_xxxxyyyz)
    v554        = 0.00694444444444444d0*M_xxxxyzzz
    M_xxxxzzzz  = -(M_xxxxxxzz + M_xxxxyyzz)
    v555        = 0.00173611111111111d0*M_xxxxzzzz
    M_xxxyyyzz  = -(M_xxxxxyyy + M_xxxyyyyy)
    v558        = 0.0138888888888889d0*M_xxxyyyzz
    M_xxxyyzzz  = -(M_xxxxxyyz + M_xxxyyyyz)
    v559        = 0.0138888888888889d0*M_xxxyyzzz
    M_xxxyzzzz  = -(M_xxxxxyzz + M_xxxyyyzz)
    v560        = 0.00694444444444444d0*M_xxxyzzzz
    M_xxxzzzzz  = -(M_xxxxxzzz + M_xxxyyzzz)
    v561        = 0.00138888888888889d0*M_xxxzzzzz
    M_xxyyyyzz  = -(M_xxxxyyyy + M_xxyyyyyy)
    v564        = 0.0104166666666667d0*M_xxyyyyzz
    M_xxyyyzzz  = -(M_xxxxyyyz + M_xxyyyyyz)
    v565        = 0.0138888888888889d0*M_xxyyyzzz
    M_xxyyzzzz  = -(M_xxxxyyzz + M_xxyyyyzz)
    v566        = 0.0104166666666667d0*M_xxyyzzzz
    M_xxyzzzzz  = -(M_xxxxyzzz + M_xxyyyzzz)
    v567        = 0.00416666666666667d0*M_xxyzzzzz
    M_xxzzzzzz  = -(M_xxxxzzzz + M_xxyyzzzz)
    v568        = 0.000694444444444444d0*M_xxzzzzzz
    M_xyyyyyzz  = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz  = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz  = -(M_xxxyyyzz + M_xyyyyyzz)
    M_xyyzzzzz  = -(M_xxxyyzzz + M_xyyyyzzz)
    M_xyzzzzzz  = -(M_xxxyzzzz + M_xyyyzzzz)
    M_xzzzzzzz  = -(M_xxxzzzzz + M_xyyzzzzz)
    M_yyyyyyzz  = -(M_xxyyyyyy + M_yyyyyyyy)
    v572        = 0.000694444444444444d0*M_yyyyyyzz
    M_yyyyyzzz  = -(M_xxyyyyyz + M_yyyyyyyz)
    v575        = 0.00138888888888889d0*M_yyyyyzzz
    M_yyyyzzzz  = -(M_xxyyyyzz + M_yyyyyyzz)
    v579        = 0.00173611111111111d0*M_yyyyzzzz
    M_yyyzzzzz  = -(M_xxyyyzzz + M_yyyyyzzz)
    v584        = 0.00138888888888889d0*M_yyyzzzzz
    M_yyzzzzzz  = -(M_xxyyzzzz + M_yyyyzzzz)
    v590        = 0.000694444444444444d0*M_yyzzzzzz
    M_yzzzzzzz  = -(M_xxyzzzzz + M_yyyzzzzz)
    v609        = 0.000198412698412698d0*M_yzzzzzzz
    M_zzzzzzzz  = -(M_xxzzzzzz + M_yyzzzzzz)
    v597        = 2.48015873015873d-5*M_zzzzzzzz
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v0          = a2
    v610        = 5.0d0*v0
    v5          = 3.0d0*v0
    v10         = v610
    v24         = 7.0d0*v0
    a3          = a1*a2
    a4          = a2*a2
    v19         = a4
    v614        = 143.0d0*v19
    v54         = 33.0d0*v19
    v82         = v614
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
    v611        = v0*v1
    v7          = 3.0d0*v1
    v14         = 5.0d0*v1
    v612        = v1*v19
    v27         = v611
    v29         = 7.0d0*v1
    v616        = v1*v49
    v59         = v612
    v80         = -429.0d0*v59
    v111        = v616
    b3          = b1*b2
    b4          = b2*b2
    v31         = b4
    v613        = v0*v31
    v615        = 143.0d0*v31
    v617        = v19*v31
    v65         = v613
    v66         = 33.0d0*v31
    v90         = v615
    v91         = -429.0d0*v65
    v121        = v617
    v162        = -12155.0d0*v121
    b5          = b2*b3
    b6          = b3*b3
    v68         = b6
    v618        = v0*v68
    v92         = 429.0d0*v68
    v93         = -v92
    v127        = v618
    v128        = 715.0d0*v68
    b7          = b3*b4
    b8          = b4*b4
    v130        = b8
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v0 + v1
    v619        = 3.0d0*h
    v620        = h*v0
    v621        = h*v1
    v622        = h*v19
    v624        = v1*v620
    v626        = h*v31
    v627        = h*v49
    v631        = v19*v621
    v633        = v31*v620
    v635        = h*v68
    v4          = -h
    v12         = v619
    v13         = -15.0d0*v1 + v12
    v17         = h*h
    v623        = v0*v17
    v625        = v1*v17
    v628        = v17*v19
    v630        = v17*v611
    v634        = v17*v31
    v18         = 3.0d0*v17
    v20         = v620
    v21         = -30.0d0*v20
    v23         = -v12
    v25         = v23 + v24
    v30         = v23 + v29
    v32         = v621
    v33         = -30.0d0*v32
    v36         = -15.0d0*v17
    v37         = -45.0d0*v17
    v38         = v37 - 945.0d0*v19 + 630.0d0*v620
    v40         = -(v18 + 63.0d0*v27)
    v43         = v37 - 945.0d0*v31 + 630.0d0*v621
    v46         = h*h*h
    v629        = v0*v46
    v632        = v1*v46
    v47         = 5.0d0*v46
    v48         = -v47
    v50         = v622
    v51         = v623
    v53         = 5.0d0*v17
    v55         = v21 + v53 + v54
    v57         = v624
    v58         = -(v46 + 126.0d0*v57)
    v61         = -v0*v12
    v62         = -v1*v12
    v63         = v17 + 33.0d0*v27
    v64         = v625
    v67         = v33 + v53 + v66
    v69         = v626
    v72         = 35.0d0*v46
    v76         = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78         = v47 + 330.0d0*v57
    v79         = h*v54
    v84         = -18.0d0*v51 + v46 + v79
    v85         = 66.0d0*v57
    v652        = -v85
    v86         = 9.0d0*v17
    v87         = 198.0d0*v57
    v88         = h*v66
    v89         = -18.0d0*v64 + v46 + v88
    v94         = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97         = h*h*h*h
    v98         = 35.0d0*v97
    v100        = v627
    v101        = v628
    v102        = v629
    v104        = -v72
    v106        = v104 + v105 - 1001.0d0*v50 + 385.0d0*v51
    v108        = v630
    v109        = 5.0d0*(297.0d0*v108 + v97)
    v653        = -v109
    v110        = 45.0d0*v46
    v112        = v631
    v114        = -14175.0d0*v46
    v116        = -v110
    v117        = -1430.0d0*v57
    v654        = v116 + v117
    v119        = -1351350.0d0*v624
    v655        = v114 + v119
    v120        = v632
    v122        = v633
    v124        = 3.0d0*v46
    v125        = -(v124 + 286.0d0*v57)
    v126        = v634
    v129        = v104 + v128 + 385.0d0*v64 - 1001.0d0*v69
    v131        = v635
    v134        = -315.0d0*v97
    v136        = -99225.0d0*v97
    v137        = v136 + 56756700.0d0*v627 - 28378350.0d0*v628 + 4365900.0d0*v629 - &
      34459425.0d0*v99
    v139        = 385.0d0*(v102 + v120) - (5005.0d0*v108 + v98)
    v141        = 7.0d0*v46
    v145        = -42525.0d0*v97
    v146        = -6081075.0d0*v630
    v656        = v145 + v146
    v148        = -(429.0d0*v108 + v97)
    v149        = -v17*v82
    v161        = -15.0d0*v97
    v163        = -2860.0d0*v108
    v657        = v161 + v162 + v163
    v164        = v124 + 130.0d0*v57
    v658        = -v164
    v191        = -v17*v90
    v449        = v136 - 34459425.0d0*v130 + 4365900.0d0*v632 - 28378350.0d0*v634 + &
      56756700.0d0*v635
    u2          = 1.0/h
    u           = sqrt(u2)
    u3          = u*u2
    v2          = u3
    D_x         = -v2*x
    D_y         = -v2*y
    D_z         = -v2*z
    u4          = u2*u2
    u5          = u2*u3
    v3          = u5
    v636        = 3.0d0*v3
    v6          = v636*x
    D_xx        = v3*(v4 + v5)
    D_xy        = v6*y
    D_xz        = v6*z
    D_yy        = v3*(v4 + v7)
    D_yz        = v636*v643
    D_zz        = -(D_xx + D_yy)
    u6          = u3*u3
    u7          = u3*u4
    v8          = u7
    v637        = 3.0d0*v8
    v9          = v8*x
    v11         = v637*(h - v10)
    D_xxx       = -3.0d0*v9*(v610 - v619)
    D_xxy       = v11*y
    D_xxz       = v11*z
    D_xyy       = v13*v9
    D_xyz       = -v639*v9
    D_xzz       = -(D_xxx + D_xyy)
    D_yyy       = v637*y*(v12 - v14)
    D_yyz       = v13*v8*z
    D_yzz       = -(D_xxy + D_yyy)
    D_zzz       = -(D_xxz + D_yyz)
    u8          = u4*u4
    u9          = u4*u5
    v15         = u9
    v638        = 15.0d0*v15*x
    v16         = 3.0d0*v15
    v22         = v638*y
    v26         = v638*z
    v28         = v15*v639
    D_xxxx      = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy      = v22*v25
    D_xxxz      = v25*v26
    D_xxyy      = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v409        = 0.5d0*D_xxyy
    D_xxyz      = v28*(v24 + v4)
    D_xxzz      = -(D_xxxx + D_xxyy)
    v430        = 0.5d0*D_xxzz
    D_xyyy      = v22*v30
    D_xyyz      = v26*(v29 + v4)
    D_xyzz      = -(D_xxxy + D_xyyy)
    v522        = 0.5d0*D_xyzz
    D_xzzz      = -(D_xxxz + D_xyyz)
    D_yyyy      = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz      = v28*v30
    D_yyzz      = -(D_xxyy + D_yyyy)
    D_yzzz      = -(D_xxyz + D_yyyz)
    D_zzzz      = -(D_xxzz + D_yyzz)
    u10         = u5*u5
    u11         = u5*u6
    v34         = u11
    v661        = v34*z
    v640        = 15.0d0*v34
    v35         = v640*x
    v39         = v661
    v41         = 315.0d0*v641*v661
    v42         = v640*y
    D_xxxxx     = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy     = v34*v38*y
    D_xxxxz     = v38*v39
    D_xxxyy     = v35*(v40 + h*v24 + 21.0d0*v32)
    v294        = 0.5d0*D_xxxyy
    D_xxxyz     = v41*(h - v5)
    D_xxxzz     = -(D_xxxxx + D_xxxyy)
    v309        = 0.5d0*D_xxxzz
    D_xxyyy     = v42*(v40 + h*v29 + 21.0d0*v20)
    v360        = 0.5d0*D_xxyyy
    v410        = 0.166666666666667d0*D_xxyyy
    D_xxyyz     = v39*(v36 - 945.0d0*v611 + 105.0d0*(v620 + v621))
    v425        = 0.5d0*D_xxyyz
    D_xxyzz     = -(D_xxxxy + D_xxyyy)
    v375        = 0.5d0*D_xxyzz
    D_xxzzz     = -(D_xxxxz + D_xxyyz)
    v431        = 0.166666666666667d0*D_xxzzz
    v444        = 0.5d0*D_xxzzz
    D_xyyyy     = v34*v43*x
    D_xyyyz     = v41*(h - v7)
    v517        = 0.5d0*D_xyyyz
    D_xyyzz     = -(D_xxxyy + D_xyyyy)
    v493        = 0.5d0*D_xyyzz
    D_xyzzz     = -(D_xxxyz + D_xyyyz)
    v523        = 0.166666666666667d0*D_xyzzz
    v536        = 0.5d0*D_xyzzz
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
    v662        = 315.0d0*v44
    v642        = v662*x
    v45         = 45.0d0*v44
    v52         = v642*y
    v56         = v642*z
    v60         = v643*v662
    D_xxxxxx    = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy    = v52*v55
    D_xxxxxz    = v55*v56
    D_xxxxyy    = v45*(v58 + v17*v29 + 14.0d0*v51 + 231.0d0*v59 - 21.0d0*v622)
    v221        = 0.5d0*D_xxxxyy
    D_xxxxyz    = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz    = -(D_xxxxxx + D_xxxxyy)
    v231        = 0.5d0*D_xxxxzz
    D_xxxyyy    = 945.0d0*v44*v641*(11.0d0*v27 + v17 + v61 + v62)
    v260        = 0.5d0*D_xxxyyy
    v295        = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz    = v56*(-9.0d0*v32 + v61 + v63)
    v305        = 0.5d0*D_xxxyyz
    D_xxxyzz    = -(D_xxxxxy + D_xxxyyy)
    v270        = 0.5d0*D_xxxyzz
    D_xxxzzz    = -(D_xxxxxz + D_xxxyyz)
    v310        = 0.166666666666667d0*D_xxxzzz
    v318        = 0.5d0*D_xxxzzz
    D_xxyyyy    = v45*(v58 + v17*v24 - 21.0d0*v626 + 14.0d0*v64 + 231.0d0*v65)
    v341        = 0.5d0*D_xxyyyy
    v361        = 0.166666666666667d0*D_xxyyyy
    v411        = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz    = v60*(-9.0d0*v20 + v62 + v63)
    v371        = 0.5d0*D_xxyyyz
    v421        = 0.166666666666667d0*D_xxyyyz
    D_xxyyzz    = -(D_xxxxyy + D_xxyyyy)
    v351        = 0.5d0*D_xxyyzz
    v426        = 0.25d0*D_xxyyzz
    D_xxyzzz    = -(D_xxxxyz + D_xxyyyz)
    v376        = 0.166666666666667d0*D_xxyzzz
    v384        = 0.5d0*D_xxyzzz
    D_xxzzzz    = -(D_xxxxzz + D_xxyyzz)
    v432        = 0.0416666666666667d0*D_xxzzzz
    v445        = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy    = v52*v67
    D_xyyyyz    = v56*(-18.0d0*v32 + v17 + v66)
    v489        = 0.5d0*D_xyyyyz
    v513        = 0.166666666666667d0*D_xyyyyz
    D_xyyyzz    = -(D_xxxyyy + D_xyyyyy)
    v473        = 0.5d0*D_xyyyzz
    v518        = 0.25d0*D_xyyyzz
    D_xyyzzz    = -(D_xxxyyz + D_xyyyyz)
    v494        = 0.166666666666667d0*D_xyyzzz
    v502        = 0.5d0*D_xyyzzz
    D_xyzzzz    = -(D_xxxyzz + D_xyyyzz)
    v524        = 0.0416666666666667d0*D_xyzzzz
    v537        = 0.166666666666667d0*D_xyzzzz
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
    v663        = 945.0d0*v70
    v644        = 315.0d0*v70
    v71         = v644*x
    v75         = v644*y
    v77         = v644*z
    v81         = v643*v663*x
    v83         = v663
    D_xxxxxxx   = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy   = v75*v76
    D_xxxxxxz   = v76*v77
    D_xxxxxyy   = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v179        = 0.5d0*D_xxxxxyy
    D_xxxxxyz   = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz   = -(D_xxxxxxx + D_xxxxxyy)
    v185        = 0.5d0*D_xxxxxzz
    D_xxxxyyy   = -v83*y*(v652 + v1*v18 + v1*v82 - v84)
    v200        = 0.5d0*D_xxxxyyy
    v222        = 0.166666666666667d0*D_xxxxyyy
    D_xxxxyyz   = v77*(-v1*v86 + v80 + v84 + v87)
    v228        = 0.5d0*D_xxxxyyz
    D_xxxxyzz   = -(D_xxxxxxy + D_xxxxyyy)
    v206        = 0.5d0*D_xxxxyzz
    D_xxxxzzz   = -(D_xxxxxxz + D_xxxxyyz)
    v232        = 0.166666666666667d0*D_xxxxzzz
    v237        = 0.5d0*D_xxxxzzz
    D_xxxyyyy   = -v83*x*(v652 + v0*v18 + v0*v90 - v89)
    v249        = 0.5d0*D_xxxyyyy
    v261        = 0.166666666666667d0*D_xxxyyyy
    v296        = 0.0416666666666667d0*D_xxxyyyy
    D_xxxyyyz   = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v267        = 0.5d0*D_xxxyyyz
    v302        = 0.166666666666667d0*D_xxxyyyz
    D_xxxyyzz   = -(D_xxxxxyy + D_xxxyyyy)
    v255        = 0.5d0*D_xxxyyzz
    v306        = 0.25d0*D_xxxyyzz
    D_xxxyzzz   = -(D_xxxxxyz + D_xxxyyyz)
    v271        = 0.166666666666667d0*D_xxxyzzz
    v276        = 0.5d0*D_xxxyzzz
    D_xxxzzzz   = -(D_xxxxxzz + D_xxxyyzz)
    v311        = 0.0416666666666667d0*D_xxxzzzz
    v319        = 0.166666666666667d0*D_xxxzzzz
    D_xxyyyyy   = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    v330        = 0.5d0*D_xxyyyyy
    v342        = 0.166666666666667d0*D_xxyyyyy
    v362        = 0.0416666666666667d0*D_xxyyyyy
    v412        = 0.00833333333333333d0*D_xxyyyyy
    D_xxyyyyz   = v77*(-v0*v86 + v87 + v89 + v91)
    v348        = 0.5d0*D_xxyyyyz
    v368        = 0.166666666666667d0*D_xxyyyyz
    v418        = 0.0416666666666667d0*D_xxyyyyz
    D_xxyyyzz   = -(D_xxxxyyy + D_xxyyyyy)
    v336        = 0.5d0*D_xxyyyzz
    v372        = 0.25d0*D_xxyyyzz
    v422        = 0.0833333333333333d0*D_xxyyyzz
    v439        = 0.166666666666667d0*D_xxyyyzz
    D_xxyyzzz   = -(D_xxxxyyz + D_xxyyyyz)
    v352        = 0.166666666666667d0*D_xxyyzzz
    v357        = 0.5d0*D_xxyyzzz
    v427        = 0.0833333333333333d0*D_xxyyzzz
    v441        = 0.25d0*D_xxyyzzz
    D_xxyzzzz   = -(D_xxxxyzz + D_xxyyyzz)
    v377        = 0.0416666666666667d0*D_xxyzzzz
    v385        = 0.166666666666667d0*D_xxyzzzz
    D_xxzzzzz   = -(D_xxxxzzz + D_xxyyzzz)
    v433        = 0.00833333333333333d0*D_xxzzzzz
    v446        = 0.0416666666666667d0*D_xxzzzzz
    D_xyyyyyy   = v71*v94
    D_xyyyyyz   = v81*(v36 + 110.0d0*v32 - v90)
    v470        = 0.5d0*D_xyyyyyz
    v486        = 0.166666666666667d0*D_xyyyyyz
    v510        = 0.0416666666666667d0*D_xyyyyyz
    D_xyyyyzz   = -(D_xxxyyyy + D_xyyyyyy)
    v461        = 0.5d0*D_xyyyyzz
    v490        = 0.25d0*D_xyyyyzz
    v514        = 0.0833333333333333d0*D_xyyyyzz
    v531        = 0.166666666666667d0*D_xyyyyzz
    D_xyyyzzz   = -(D_xxxyyyz + D_xyyyyyz)
    v474        = 0.166666666666667d0*D_xyyyzzz
    v479        = 0.5d0*D_xyyyzzz
    v519        = 0.0833333333333333d0*D_xyyyzzz
    v533        = 0.25d0*D_xyyyzzz
    D_xyyzzzz   = -(D_xxxyyzz + D_xyyyyzz)
    v495        = 0.0416666666666667d0*D_xyyzzzz
    v503        = 0.166666666666667d0*D_xyyzzzz
    D_xyzzzzz   = -(D_xxxyzzz + D_xyyyzzz)
    v525        = 0.00833333333333333d0*D_xyzzzzz
    v538        = 0.0416666666666667d0*D_xyzzzzz
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
    v645        = v660*v95
    v646        = v95*z
    v647        = v646*x
    v648        = v646*y
    v96         = 315.0d0*v95
    v103        = 2835.0d0*v645
    v107        = 2835.0d0*v647
    v113        = v648
    v115        = 945.0d0*v645
    v118        = v647
    v123        = 2835.0d0*v648
    D_xxxxxxxx  = v96*(v98 - 12012.0d0*v100 + 6930.0d0*v101 - 1260.0d0*v102 + 6435.0d0*v99 &
      )
    L_xxxxxxxx  = L_xxxxxxxx + (D_xxxxxxxx*M_0)
    D_xxxxxxxy  = v103*v106
    L_xxxxxxxy  = L_xxxxxxxy + (D_xxxxxxxy*M_0)
    D_xxxxxxxz  = v106*v107
    L_xxxxxxxz  = L_xxxxxxxz + (D_xxxxxxxz*M_0)
    D_xxxxxxyy  = -v96*(v653 + h*v73 + v1*v110 - 495.0d0*v101 + 135.0d0*v102 + 6435.0d0*( &
      -v111 + v112))
    v155        = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy  = L_xxxxxxyy + (D_xxxxxxyy*M_0)
    D_xxxxxxyz  = v113*(v114 + 467775.0d0*v623 + 155925.0d0*(13.0d0*v49 - 13.0d0*v622))
    L_xxxxxxyz  = L_xxxxxxyz + (D_xxxxxxyz*M_0)
    D_xxxxxxzz  = -(D_xxxxxxxx + D_xxxxxxyy)
    v158        = 0.5d0*D_xxxxxxzz
    D_xxxxxyyy  = v115*(v654 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v167        = 0.5d0*D_xxxxxyyy
    v180        = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy  = L_xxxxxyyy + (D_xxxxxyyy*M_0)
    D_xxxxxyyz  = v118*(v655 + 2027025.0d0*v612 - 135135.0d0*v622 + 103950.0d0*v623 + &
      155925.0d0*v625)
    v183        = 0.5d0*D_xxxxxyyz
    L_xxxxxyyz  = L_xxxxxyyz + (D_xxxxxyyz*M_0)
    D_xxxxxyzz  = -(D_xxxxxxxy + D_xxxxxyyy)
    v170        = 0.5d0*D_xxxxxyzz
    D_xxxxxzzz  = -(D_xxxxxxxz + D_xxxxxyyz)
    v186        = 0.166666666666667d0*D_xxxxxzzz
    v188        = 0.5d0*D_xxxxxzzz
    D_xxxxyyyy  = 945.0d0*v95*(v97 + 396.0d0*v108 + 2145.0d0*v121 + v17*v54 + v17*v66 - &
      18.0d0*(v102 + v120) - 858.0d0*(v112 + v122))
    v194        = 0.5d0*D_xxxxyyyy
    v201        = 0.166666666666667d0*D_xxxxyyyy
    v223        = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy  = L_xxxxyyyy + (D_xxxxyyyy*M_0)
    D_xxxxyyyz  = v123*(v125 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v204        = 0.5d0*D_xxxxyyyz
    v226        = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyyz  = L_xxxxyyyz + (D_xxxxyyyz*M_0)
    D_xxxxyyzz  = -(D_xxxxxxyy + D_xxxxyyyy)
    v197        = 0.5d0*D_xxxxyyzz
    v229        = 0.25d0*D_xxxxyyzz
    D_xxxxyzzz  = -(D_xxxxxxyz + D_xxxxyyyz)
    v207        = 0.166666666666667d0*D_xxxxyzzz
    v209        = 0.5d0*D_xxxxyzzz
    D_xxxxzzzz  = -(D_xxxxxxzz + D_xxxxyyzz)
    v233        = 0.0416666666666667d0*D_xxxxzzzz
    v238        = 0.166666666666667d0*D_xxxxzzzz
    D_xxxyyyyy  = v115*(v654 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v243        = 0.5d0*D_xxxyyyyy
    v250        = 0.166666666666667d0*D_xxxyyyyy
    v262        = 0.0416666666666667d0*D_xxxyyyyy
    v297        = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy  = L_xxxyyyyy + (D_xxxyyyyy*M_0)
    D_xxxyyyyz  = v107*(v125 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v253        = 0.5d0*D_xxxyyyyz
    v265        = 0.166666666666667d0*D_xxxyyyyz
    v300        = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyyz  = L_xxxyyyyz + (D_xxxyyyyz*M_0)
    D_xxxyyyzz  = -(D_xxxxxyyy + D_xxxyyyyy)
    v246        = 0.5d0*D_xxxyyyzz
    v268        = 0.25d0*D_xxxyyyzz
    v303        = 0.0833333333333333d0*D_xxxyyyzz
    v315        = 0.166666666666667d0*D_xxxyyyzz
    D_xxxyyzzz  = -(D_xxxxxyyz + D_xxxyyyyz)
    v256        = 0.166666666666667d0*D_xxxyyzzz
    v258        = 0.5d0*D_xxxyyzzz
    v307        = 0.0833333333333333d0*D_xxxyyzzz
    v316        = 0.25d0*D_xxxyyzzz
    D_xxxyzzzz  = -(D_xxxxxyzz + D_xxxyyyzz)
    v272        = 0.0416666666666667d0*D_xxxyzzzz
    v277        = 0.166666666666667d0*D_xxxyzzzz
    D_xxxzzzzz  = -(D_xxxxxzzz + D_xxxyyzzz)
    v312        = 0.00833333333333333d0*D_xxxzzzzz
    v320        = 0.0416666666666667d0*D_xxxzzzzz
    D_xxyyyyyy  = -v96*(v653 + h*v92 + v0*v110 + 135.0d0*v120 - 495.0d0*v126 + 6435.0d0*( &
      v122 - v127))
    v324        = 0.5d0*D_xxyyyyyy
    v331        = 0.166666666666667d0*D_xxyyyyyy
    v343        = 0.0416666666666667d0*D_xxyyyyyy
    v363        = 0.00833333333333333d0*D_xxyyyyyy
    v413        = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy  = L_xxyyyyyy + (D_xxyyyyyy*M_0)
    D_xxyyyyyz  = v113*(v655 + 2027025.0d0*v613 + 155925.0d0*v623 + 103950.0d0*v625 - &
      135135.0d0*v626)
    v334        = 0.5d0*D_xxyyyyyz
    v346        = 0.166666666666667d0*D_xxyyyyyz
    v366        = 0.0416666666666667d0*D_xxyyyyyz
    v416        = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyyz  = L_xxyyyyyz + (D_xxyyyyyz*M_0)
    D_xxyyyyzz  = -(D_xxxxyyyy + D_xxyyyyyy)
    v327        = 0.5d0*D_xxyyyyzz
    v349        = 0.25d0*D_xxyyyyzz
    v369        = 0.0833333333333333d0*D_xxyyyyzz
    v381        = 0.166666666666667d0*D_xxyyyyzz
    v419        = 0.0208333333333333d0*D_xxyyyyzz
    v437        = 0.0416666666666667d0*D_xxyyyyzz
    D_xxyyyzzz  = -(D_xxxxyyyz + D_xxyyyyyz)
    v337        = 0.166666666666667d0*D_xxyyyzzz
    v339        = 0.5d0*D_xxyyyzzz
    v373        = 0.0833333333333333d0*D_xxyyyzzz
    v382        = 0.25d0*D_xxyyyzzz
    v423        = 0.0277777777777778d0*D_xxyyyzzz
    D_xxyyzzzz  = -(D_xxxxyyzz + D_xxyyyyzz)
    v353        = 0.0416666666666667d0*D_xxyyzzzz
    v358        = 0.166666666666667d0*D_xxyyzzzz
    v428        = 0.0208333333333333d0*D_xxyyzzzz
    v442        = 0.0833333333333333d0*D_xxyyzzzz
    D_xxyzzzzz  = -(D_xxxxyzzz + D_xxyyyzzz)
    v378        = 0.00833333333333333d0*D_xxyzzzzz
    v386        = 0.0416666666666667d0*D_xxyzzzzz
    D_xxzzzzzz  = -(D_xxxxzzzz + D_xxyyzzzz)
    v434        = 0.00138888888888889d0*D_xxzzzzzz
    v447        = 0.00833333333333333d0*D_xxzzzzzz
    D_xyyyyyyy  = v103*v129
    L_xyyyyyyy  = L_xyyyyyyy + (D_xyyyyyyy*M_0)
    D_xyyyyyyz  = v118*(v114 + 467775.0d0*v625 + 155925.0d0*(-13.0d0*v626 + 13.0d0*v68))
    v459        = 0.5d0*D_xyyyyyyz
    v468        = 0.166666666666667d0*D_xyyyyyyz
    v484        = 0.0416666666666667d0*D_xyyyyyyz
    v508        = 0.00833333333333333d0*D_xyyyyyyz
    L_xyyyyyyz  = L_xyyyyyyz + (D_xyyyyyyz*M_0)
    D_xyyyyyzz  = -(D_xxxyyyyy + D_xyyyyyyy)
    v454        = 0.5d0*D_xyyyyyzz
    v471        = 0.25d0*D_xyyyyyzz
    v487        = 0.0833333333333333d0*D_xyyyyyzz
    v499        = 0.166666666666667d0*D_xyyyyyzz
    v511        = 0.0208333333333333d0*D_xyyyyyzz
    v529        = 0.0416666666666667d0*D_xyyyyyzz
    D_xyyyyzzz  = -(D_xxxyyyyz + D_xyyyyyyz)
    v462        = 0.166666666666667d0*D_xyyyyzzz
    v464        = 0.5d0*D_xyyyyzzz
    v491        = 0.0833333333333333d0*D_xyyyyzzz
    v500        = 0.25d0*D_xyyyyzzz
    v515        = 0.0277777777777778d0*D_xyyyyzzz
    D_xyyyzzzz  = -(D_xxxyyyzz + D_xyyyyyzz)
    v475        = 0.0416666666666667d0*D_xyyyzzzz
    v480        = 0.166666666666667d0*D_xyyyzzzz
    v520        = 0.0208333333333333d0*D_xyyyzzzz
    v534        = 0.0833333333333333d0*D_xyyyzzzz
    D_xyyzzzzz  = -(D_xxxyyzzz + D_xyyyyzzz)
    v496        = 0.00833333333333333d0*D_xyyzzzzz
    v504        = 0.0416666666666667d0*D_xyyzzzzz
    D_xyzzzzzz  = -(D_xxxyzzzz + D_xyyyzzzz)
    v526        = 0.00138888888888889d0*D_xyzzzzzz
    v539        = 0.00833333333333333d0*D_xyzzzzzz
    D_xzzzzzzz  = -(D_xxxzzzzz + D_xyyzzzzz)
    D_yyyyyyyy  = v96*(v98 - 1260.0d0*v120 + 6930.0d0*v126 + 6435.0d0*v130 - 12012.0d0* &
      v131)
    L_yyyyyyyy  = L_yyyyyyyy + (D_yyyyyyyy*M_0)
    D_yyyyyyyz  = v123*v129
    L_yyyyyyyz  = L_yyyyyyyz + (D_yyyyyyyz*M_0)
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
    v664        = v132*x
    v649        = v664
    v650        = v132*y
    v651        = v132*z
    v133        = 2835.0d0*v649
    v135        = v650
    v138        = v651
    v140        = 155925.0d0*v643*v664
    v147        = 14175.0d0*v651
    v190        = 2835.0d0*v650
    v240        = v649
    D_xxxxxxxxx = v133*(v134 + 25740.0d0*v100 - 18018.0d0*v101 + 4620.0d0*v102 - 12155.0d0 &
      *v99)
    L_xxxxxxxxx = L_xxxxxxxxx + (D_xxxxxxxxx*M_0)
    D_xxxxxxxxy = v135*v137
    L_xxxxxxxxy = L_xxxxxxxxy + (D_xxxxxxxxy*M_0)
    D_xxxxxxxxz = v137*v138
    L_xxxxxxxxz = L_xxxxxxxxz + (D_xxxxxxxxz*M_0)
    D_xxxxxxxyy = v133*(v139 + h*v105 - 1001.0d0*v101 - 12155.0d0*v111 + 15015.0d0*v112)
    v143        = 0.5d0*D_xxxxxxxyy
    L_xxxxxxxyy = L_xxxxxxxyy + (D_xxxxxxxyy*M_0)
    D_xxxxxxxyz = v140*(v141 - 221.0d0*v49 + 273.0d0*v50 - 91.0d0*v51)
    L_xxxxxxxyz = L_xxxxxxxyz + (D_xxxxxxxyz*M_0)
    D_xxxxxxxzz = -(D_xxxxxxxxx + D_xxxxxxxyy)
    v144        = 0.5d0*D_xxxxxxxzz
    L_xxxxxxx   = L_xxxxxxx + (D_xxxxxxx*M_0 + D_xxxxxxxxx*v142 + D_xxxxxxxxy*M_xy + D_xxxxxxxxz*M_xz + &
      D_xxxxxxxyz*M_yz + M_yy*v143 + M_zz*v144)
    D_xxxxxxyyy = v135*(v656 - 34459425.0d0*v616 + 1403325.0d0*v629 + 30405375.0d0*v631 + &
      155925.0d0*(39.0d0*v627 - 39.0d0*v628 + v632))
    v150        = 0.5d0*D_xxxxxxyyy
    v156        = 0.166666666666667d0*D_xxxxxxyyy
    L_xxxxxxyyy = L_xxxxxxyyy + (D_xxxxxxyyy*M_0)
    D_xxxxxxyyz = v147*(v148 + v149 + 33.0d0*v102 - 2431.0d0*v111 + 2145.0d0*v112 + 11.0d0 &
      *v120 + 143.0d0*v627)
    v157        = 0.5d0*D_xxxxxxyyz
    L_xxxxxxyyz = L_xxxxxxyyz + (D_xxxxxxyyz*M_0)
    D_xxxxxxyzz = -(D_xxxxxxxxy + D_xxxxxxyyy)
    v151        = 0.5d0*D_xxxxxxyzz
    L_xxxxxxy   = L_xxxxxxy + (D_xxxxxxxxy*v142 + D_xxxxxxxyy*M_xy + D_xxxxxxxyz*M_xz + D_xxxxxxy*M_0 + &
      D_xxxxxxyyz*M_yz + M_yy*v150 + M_zz*v151)
    D_xxxxxxzzz = -(D_xxxxxxxxz + D_xxxxxxyyz)
    v159        = 0.166666666666667d0*D_xxxxxxzzz
    v160        = 0.5d0*D_xxxxxxzzz
    L_xxxxxx    = L_xxxxxx + (D_xxxxxx*M_0 + D_xxxxxxxx*v142 + D_xxxxxxxxx*v152 + D_xxxxxxxxy*v153 + &
      D_xxxxxxxxz*v154 + D_xxxxxxxy*M_xy + D_xxxxxxxyz*M_xyz + &
      D_xxxxxxxz*M_xz + D_xxxxxxyz*M_yz + M_xyy*v143 + M_xzz*v144 + &
      M_yy*v155 + M_yyy*v156 + M_yyz*v157 + M_yzz*v151 + M_zz*v158 + &
      M_zzz*v159)
    L_xxxxxxz   = L_xxxxxxz + (D_xxxxxxxxz*v142 + D_xxxxxxxyz*M_xy + D_xxxxxxxzz*M_xz + D_xxxxxxyzz* &
      M_yz + D_xxxxxxz*M_0 + M_yy*v157 + M_zz*v160)
    D_xxxxxyyyy = v133*(v149 + v657 + 110.0d0*v102 + 4290.0d0*v112 + 330.0d0*v120 + &
      7150.0d0*v122 - 715.0d0*v126)
    v165        = 0.5d0*D_xxxxxyyyy
    v168        = 0.166666666666667d0*D_xxxxxyyyy
    v181        = 0.0416666666666667d0*D_xxxxxyyyy
    L_xxxxxyyyy = L_xxxxxyyyy + (D_xxxxxyyyy*M_0)
    D_xxxxxyyyz = -v140*(v658 - 39.0d0*v50 + 26.0d0*v51 + 221.0d0*v59 + 13.0d0*v64)
    v169        = 0.5d0*D_xxxxxyyyz
    v182        = 0.166666666666667d0*D_xxxxxyyyz
    L_xxxxxyyyz = L_xxxxxyyyz + (D_xxxxxyyyz*M_0)
    D_xxxxxyyzz = -(D_xxxxxxxyy + D_xxxxxyyyy)
    v166        = 0.5d0*D_xxxxxyyzz
    v184        = 0.25d0*D_xxxxxyyzz
    L_xxxxxyy   = L_xxxxxyy + (D_xxxxxxxyy*v142 + D_xxxxxxyyy*M_xy + D_xxxxxxyyz*M_xz + D_xxxxxyy*M_0 + &
      D_xxxxxyyyz*M_yz + M_yy*v165 + M_zz*v166)
    D_xxxxxyzzz = -(D_xxxxxxxyz + D_xxxxxyyyz)
    v171        = 0.166666666666667d0*D_xxxxxyzzz
    v172        = 0.5d0*D_xxxxxyzzz
    L_xxxxxy    = L_xxxxxy + (D_xxxxxxxxy*v152 + D_xxxxxxxy*v142 + D_xxxxxxxyy*v153 + D_xxxxxxxyz*v154 &
      + D_xxxxxxyy*M_xy + D_xxxxxxyyz*M_xyz + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyyz*M_yz + M_xyy*v150 + M_xzz*v151 + M_yy* &
      v167 + M_yyy*v168 + M_yyz*v169 + M_yzz*v166 + M_zz*v170 + M_zzz* &
      v171)
    L_xxxxxyz   = L_xxxxxyz + (D_xxxxxxxyz*v142 + D_xxxxxxyyz*M_xy + D_xxxxxxyzz*M_xz + D_xxxxxyyzz* &
      M_yz + D_xxxxxyz*M_0 + M_yy*v169 + M_zz*v172)
    D_xxxxxzzzz = -(D_xxxxxxxzz + D_xxxxxyyzz)
    v187        = 0.0416666666666667d0*D_xxxxxzzzz
    v189        = 0.166666666666667d0*D_xxxxxzzzz
    L_xxxxx     = L_xxxxx + (D_xxxxx*M_0 + D_xxxxxxx*v142 + D_xxxxxxxx*v152 + D_xxxxxxxxx*v173 + &
      D_xxxxxxxxy*v174 + D_xxxxxxxxz*v175 + D_xxxxxxxy*v153 + &
      D_xxxxxxxyy*v176 + D_xxxxxxxyz*v177 + D_xxxxxxxz*v154 + &
      D_xxxxxxxzz*v178 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz* &
      M_xz + D_xxxxxyz*M_yz + M_xyy*v155 + M_xyyy*v156 + M_xyyz*v157 + &
      M_xyzz*v151 + M_xzz*v158 + M_xzzz*v159 + M_yy*v179 + M_yyy*v180 + &
      M_yyyy*v181 + M_yyyz*v182 + M_yyz*v183 + M_yyzz*v184 + M_yzz*v170 &
      + M_yzzz*v171 + M_zz*v185 + M_zzz*v186 + M_zzzz*v187)
    L_xxxxxz    = L_xxxxxz + (D_xxxxxxxxz*v152 + D_xxxxxxxyz*v153 + D_xxxxxxxz*v142 + D_xxxxxxxzz*v154 &
      + D_xxxxxxyz*M_xy + D_xxxxxxyzz*M_xyz + D_xxxxxxzz*M_xz + &
      D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + M_xyy*v157 + M_xzz*v160 + M_yy* &
      v183 + M_yyy*v182 + M_yyz*v166 + M_yzz*v172 + M_zz*v188 + M_zzz* &
      v189)
    D_xxxxyyyyy = v190*(v191 + v657 - 715.0d0*v101 + 330.0d0*v102 + 7150.0d0*v112 + &
      110.0d0*v120 + 4290.0d0*v122)
    v192        = 0.5d0*D_xxxxyyyyy
    v195        = 0.166666666666667d0*D_xxxxyyyyy
    v202        = 0.0416666666666667d0*D_xxxxyyyyy
    v224        = 0.00833333333333333d0*D_xxxxyyyyy
    L_xxxxyyyyy = L_xxxxyyyyy + (D_xxxxyyyyy*M_0)
    D_xxxxyyyyz = -2835.0d0*v138*(v17*v614 + v17*v615 + 12155.0d0*v617 + 1716.0d0*v630 + &
      3.0d0*v97 - 66.0d0*(v629 + v632) - 4290.0d0*(v631 + v633))
    v196        = 0.5d0*D_xxxxyyyyz
    v203        = 0.166666666666667d0*D_xxxxyyyyz
    v225        = 0.0416666666666667d0*D_xxxxyyyyz
    L_xxxxyyyyz = L_xxxxyyyyz + (D_xxxxyyyyz*M_0)
    D_xxxxyyyzz = -(D_xxxxxxyyy + D_xxxxyyyyy)
    v193        = 0.5d0*D_xxxxyyyzz
    v205        = 0.25d0*D_xxxxyyyzz
    v227        = 0.0833333333333333d0*D_xxxxyyyzz
    v235        = 0.166666666666667d0*D_xxxxyyyzz
    L_xxxxyyy   = L_xxxxyyy + (D_xxxxxxyyy*v142 + D_xxxxxyyyy*M_xy + D_xxxxxyyyz*M_xz + D_xxxxyyy*M_0 + &
      D_xxxxyyyyz*M_yz + M_yy*v192 + M_zz*v193)
    D_xxxxyyzzz = -(D_xxxxxxyyz + D_xxxxyyyyz)
    v198        = 0.166666666666667d0*D_xxxxyyzzz
    v199        = 0.5d0*D_xxxxyyzzz
    v230        = 0.0833333333333333d0*D_xxxxyyzzz
    v236        = 0.25d0*D_xxxxyyzzz
    L_xxxxyy    = L_xxxxyy + (D_xxxxxxxyy*v152 + D_xxxxxxyy*v142 + D_xxxxxxyyy*v153 + D_xxxxxxyyz*v154 &
      + D_xxxxxyyy*M_xy + D_xxxxxyyyz*M_xyz + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyyz*M_yz + M_xyy*v165 + M_xzz*v166 + M_yy* &
      v194 + M_yyy*v195 + M_yyz*v196 + M_yzz*v193 + M_zz*v197 + M_zzz* &
      v198)
    L_xxxxyyz   = L_xxxxyyz + (D_xxxxxxyyz*v142 + D_xxxxxyyyz*M_xy + D_xxxxxyyzz*M_xz + D_xxxxyyyzz* &
      M_yz + D_xxxxyyz*M_0 + M_yy*v196 + M_zz*v199)
    D_xxxxyzzzz = -(D_xxxxxxyzz + D_xxxxyyyzz)
    v208        = 0.0416666666666667d0*D_xxxxyzzzz
    v210        = 0.166666666666667d0*D_xxxxyzzzz
    L_xxxxy     = L_xxxxy + (D_xxxxxxxxy*v173 + D_xxxxxxxy*v152 + D_xxxxxxxyy*v174 + D_xxxxxxxyz*v175 &
      + D_xxxxxxy*v142 + D_xxxxxxyy*v153 + D_xxxxxxyyy*v176 + &
      D_xxxxxxyyz*v177 + D_xxxxxxyz*v154 + D_xxxxxxyzz*v178 + D_xxxxxyy &
      *M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + M_xyy*v167 + M_xyyy*v168 + M_xyyz*v169 + M_xyzz* &
      v166 + M_xzz*v170 + M_xzzz*v171 + M_yy*v200 + M_yyy*v201 + M_yyyy &
      *v202 + M_yyyz*v203 + M_yyz*v204 + M_yyzz*v205 + M_yzz*v197 + &
      M_yzzz*v198 + M_zz*v206 + M_zzz*v207 + M_zzzz*v208)
    L_xxxxyz    = L_xxxxyz + (D_xxxxxxxyz*v152 + D_xxxxxxyyz*v153 + D_xxxxxxyz*v142 + D_xxxxxxyzz*v154 &
      + D_xxxxxyyz*M_xy + D_xxxxxyyzz*M_xyz + D_xxxxxyzz*M_xz + &
      D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + M_xyy*v169 + M_xzz*v172 + M_yy* &
      v204 + M_yyy*v203 + M_yyz*v193 + M_yzz*v199 + M_zz*v209 + M_zzz* &
      v210)
    D_xxxxzzzzz = -(D_xxxxxxzzz + D_xxxxyyzzz)
    v234        = 0.00833333333333333d0*D_xxxxzzzzz
    v239        = 0.0416666666666667d0*D_xxxxzzzzz
    L_xxxx      = L_xxxx + (D_xxxx*M_0 + D_xxxxxx*v142 + D_xxxxxxx*v152 + D_xxxxxxxx*v173 + &
      D_xxxxxxxxx*v211 + D_xxxxxxxxy*v212 + D_xxxxxxxxz*v213 + &
      D_xxxxxxxy*v174 + D_xxxxxxxyy*v214 + D_xxxxxxxyz*v215 + &
      D_xxxxxxxz*v175 + D_xxxxxxxzz*v216 + D_xxxxxxy*v153 + D_xxxxxxyy* &
      v176 + D_xxxxxxyyy*v217 + D_xxxxxxyyz*v218 + D_xxxxxxyz*v177 + &
      D_xxxxxxyzz*v219 + D_xxxxxxz*v154 + D_xxxxxxzz*v178 + D_xxxxxxzzz &
      *v220 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + &
      D_xxxxyz*M_yz + M_xyy*v179 + M_xyyy*v180 + M_xyyyy*v181 + M_xyyyz &
      *v182 + M_xyyz*v183 + M_xyyzz*v184 + M_xyzz*v170 + M_xyzzz*v171 + &
      M_xzz*v185 + M_xzzz*v186 + M_xzzzz*v187 + M_yy*v221 + M_yyy*v222 &
      + M_yyyy*v223 + M_yyyyy*v224 + M_yyyyz*v225 + M_yyyz*v226 + &
      M_yyyzz*v227 + M_yyz*v228 + M_yyzz*v229 + M_yyzzz*v230 + M_yzz* &
      v206 + M_yzzz*v207 + M_yzzzz*v208 + M_zz*v231 + M_zzz*v232 + &
      M_zzzz*v233 + M_zzzzz*v234)
    L_xxxxz     = L_xxxxz + (D_xxxxxxxxz*v173 + D_xxxxxxxyz*v174 + D_xxxxxxxz*v152 + D_xxxxxxxzz*v175 &
      + D_xxxxxxyyz*v176 + D_xxxxxxyz*v153 + D_xxxxxxyzz*v177 + &
      D_xxxxxxz*v142 + D_xxxxxxzz*v154 + D_xxxxxxzzz*v178 + D_xxxxxyz* &
      M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + M_xyy*v183 + M_xyyy*v182 + M_xyyz*v166 + M_xyzz* &
      v172 + M_xzz*v188 + M_xzzz*v189 + M_yy*v228 + M_yyy*v226 + M_yyyy &
      *v225 + M_yyyz*v235 + M_yyz*v197 + M_yyzz*v236 + M_yzz*v209 + &
      M_yzzz*v210 + M_zz*v237 + M_zzz*v238 + M_zzzz*v239)
    D_xxxyyyyyy = v240*(v656 - 34459425.0d0*v618 + 1403325.0d0*v632 + 30405375.0d0*v633 + &
      155925.0d0*(v629 - 39.0d0*v634 + 39.0d0*v635))
    v241        = 0.5d0*D_xxxyyyyyy
    v244        = 0.166666666666667d0*D_xxxyyyyyy
    v251        = 0.0416666666666667d0*D_xxxyyyyyy
    v263        = 0.00833333333333333d0*D_xxxyyyyyy
    v298        = 0.00138888888888889d0*D_xxxyyyyyy
    L_xxxyyyyyy = L_xxxyyyyyy + (D_xxxyyyyyy*M_0)
    D_xxxyyyyyz = -v140*(v658 + 13.0d0*v51 + 26.0d0*v64 + 221.0d0*v65 - 39.0d0*v69)
    v245        = 0.5d0*D_xxxyyyyyz
    v252        = 0.166666666666667d0*D_xxxyyyyyz
    v264        = 0.0416666666666667d0*D_xxxyyyyyz
    v299        = 0.00833333333333333d0*D_xxxyyyyyz
    L_xxxyyyyyz = L_xxxyyyyyz + (D_xxxyyyyyz*M_0)
    D_xxxyyyyzz = -(D_xxxxxyyyy + D_xxxyyyyyy)
    v242        = 0.5d0*D_xxxyyyyzz
    v254        = 0.25d0*D_xxxyyyyzz
    v266        = 0.0833333333333333d0*D_xxxyyyyzz
    v274        = 0.166666666666667d0*D_xxxyyyyzz
    v301        = 0.0208333333333333d0*D_xxxyyyyzz
    v314        = 0.0416666666666667d0*D_xxxyyyyzz
    L_xxxyyyy   = L_xxxyyyy + (D_xxxxxyyyy*v142 + D_xxxxyyyyy*M_xy + D_xxxxyyyyz*M_xz + D_xxxyyyy*M_0 + &
      D_xxxyyyyyz*M_yz + M_yy*v241 + M_zz*v242)
    D_xxxyyyzzz = -(D_xxxxxyyyz + D_xxxyyyyyz)
    v247        = 0.166666666666667d0*D_xxxyyyzzz
    v248        = 0.5d0*D_xxxyyyzzz
    v269        = 0.0833333333333333d0*D_xxxyyyzzz
    v275        = 0.25d0*D_xxxyyyzzz
    v304        = 0.0277777777777778d0*D_xxxyyyzzz
    L_xxxyyy    = L_xxxyyy + (D_xxxxxxyyy*v152 + D_xxxxxyyy*v142 + D_xxxxxyyyy*v153 + D_xxxxxyyyz*v154 &
      + D_xxxxyyyy*M_xy + D_xxxxyyyyz*M_xyz + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyyz*M_yz + M_xyy*v192 + M_xzz*v193 + M_yy* &
      v243 + M_yyy*v244 + M_yyz*v245 + M_yzz*v242 + M_zz*v246 + M_zzz* &
      v247)
    L_xxxyyyz   = L_xxxyyyz + (D_xxxxxyyyz*v142 + D_xxxxyyyyz*M_xy + D_xxxxyyyzz*M_xz + D_xxxyyyyzz* &
      M_yz + D_xxxyyyz*M_0 + M_yy*v245 + M_zz*v248)
    D_xxxyyzzzz = -(D_xxxxxyyzz + D_xxxyyyyzz)
    v257        = 0.0416666666666667d0*D_xxxyyzzzz
    v259        = 0.166666666666667d0*D_xxxyyzzzz
    v308        = 0.0208333333333333d0*D_xxxyyzzzz
    v317        = 0.0833333333333333d0*D_xxxyyzzzz
    L_xxxyy     = L_xxxyy + (D_xxxxxxxyy*v173 + D_xxxxxxyy*v152 + D_xxxxxxyyy*v174 + D_xxxxxxyyz*v175 &
      + D_xxxxxyy*v142 + D_xxxxxyyy*v153 + D_xxxxxyyyy*v176 + &
      D_xxxxxyyyz*v177 + D_xxxxxyyz*v154 + D_xxxxxyyzz*v178 + D_xxxxyyy &
      *M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + M_xyy*v194 + M_xyyy*v195 + M_xyyz*v196 + M_xyzz* &
      v193 + M_xzz*v197 + M_xzzz*v198 + M_yy*v249 + M_yyy*v250 + M_yyyy &
      *v251 + M_yyyz*v252 + M_yyz*v253 + M_yyzz*v254 + M_yzz*v246 + &
      M_yzzz*v247 + M_zz*v255 + M_zzz*v256 + M_zzzz*v257)
    L_xxxyyz    = L_xxxyyz + (D_xxxxxxyyz*v152 + D_xxxxxyyyz*v153 + D_xxxxxyyz*v142 + D_xxxxxyyzz*v154 &
      + D_xxxxyyyz*M_xy + D_xxxxyyyzz*M_xyz + D_xxxxyyzz*M_xz + &
      D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + M_xyy*v196 + M_xzz*v199 + M_yy* &
      v253 + M_yyy*v252 + M_yyz*v242 + M_yzz*v248 + M_zz*v258 + M_zzz* &
      v259)
    D_xxxyzzzzz = -(D_xxxxxyzzz + D_xxxyyyzzz)
    v273        = 0.00833333333333333d0*D_xxxyzzzzz
    v278        = 0.0416666666666667d0*D_xxxyzzzzz
    L_xxxy      = L_xxxy + (D_xxxxxxxxy*v211 + D_xxxxxxxy*v173 + D_xxxxxxxyy*v212 + D_xxxxxxxyz*v213 &
      + D_xxxxxxy*v152 + D_xxxxxxyy*v174 + D_xxxxxxyyy*v214 + &
      D_xxxxxxyyz*v215 + D_xxxxxxyz*v175 + D_xxxxxxyzz*v216 + D_xxxxxy* &
      v142 + D_xxxxxyy*v153 + D_xxxxxyyy*v176 + D_xxxxxyyyy*v217 + &
      D_xxxxxyyyz*v218 + D_xxxxxyyz*v177 + D_xxxxxyyzz*v219 + D_xxxxxyz &
      *v154 + D_xxxxxyzz*v178 + D_xxxxxyzzz*v220 + D_xxxxyy*M_xy + &
      D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz*M_yz + &
      M_xyy*v200 + M_xyyy*v201 + M_xyyyy*v202 + M_xyyyz*v203 + M_xyyz* &
      v204 + M_xyyzz*v205 + M_xyzz*v197 + M_xyzzz*v198 + M_xzz*v206 + &
      M_xzzz*v207 + M_xzzzz*v208 + M_yy*v260 + M_yyy*v261 + M_yyyy*v262 &
      + M_yyyyy*v263 + M_yyyyz*v264 + M_yyyz*v265 + M_yyyzz*v266 + &
      M_yyz*v267 + M_yyzz*v268 + M_yyzzz*v269 + M_yzz*v255 + M_yzzz* &
      v256 + M_yzzzz*v257 + M_zz*v270 + M_zzz*v271 + M_zzzz*v272 + &
      M_zzzzz*v273)
    L_xxxyz     = L_xxxyz + (D_xxxxxxxyz*v173 + D_xxxxxxyyz*v174 + D_xxxxxxyz*v152 + D_xxxxxxyzz*v175 &
      + D_xxxxxyyyz*v176 + D_xxxxxyyz*v153 + D_xxxxxyyzz*v177 + &
      D_xxxxxyz*v142 + D_xxxxxyzz*v154 + D_xxxxxyzzz*v178 + D_xxxxyyz* &
      M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + M_xyy*v204 + M_xyyy*v203 + M_xyyz*v193 + M_xyzz* &
      v199 + M_xzz*v209 + M_xzzz*v210 + M_yy*v267 + M_yyy*v265 + M_yyyy &
      *v264 + M_yyyz*v274 + M_yyz*v246 + M_yyzz*v275 + M_yzz*v258 + &
      M_yzzz*v259 + M_zz*v276 + M_zzz*v277 + M_zzzz*v278)
    D_xxxzzzzzz = -(D_xxxxxzzzz + D_xxxyyzzzz)
    v313        = 0.00138888888888889d0*D_xxxzzzzzz
    v321        = 0.00833333333333333d0*D_xxxzzzzzz
    L_xxx       = L_xxx + (D_xxx*M_0 + D_xxxxx*v142 + D_xxxxxx*v152 + D_xxxxxxx*v173 + D_xxxxxxxx* &
      v211 + D_xxxxxxxxx*v279 + D_xxxxxxxxy*v280 + D_xxxxxxxxz*v281 + &
      D_xxxxxxxy*v212 + D_xxxxxxxyy*v282 + D_xxxxxxxyz*v283 + &
      D_xxxxxxxz*v213 + D_xxxxxxxzz*v284 + D_xxxxxxy*v174 + D_xxxxxxyy* &
      v214 + D_xxxxxxyyy*v285 + D_xxxxxxyyz*v286 + D_xxxxxxyz*v215 + &
      D_xxxxxxyzz*v287 + D_xxxxxxz*v175 + D_xxxxxxzz*v216 + D_xxxxxxzzz &
      *v288 + D_xxxxxy*v153 + D_xxxxxyy*v176 + D_xxxxxyyy*v217 + &
      D_xxxxxyyyy*v289 + D_xxxxxyyyz*v290 + D_xxxxxyyz*v218 + &
      D_xxxxxyyzz*v291 + D_xxxxxyz*v177 + D_xxxxxyzz*v219 + D_xxxxxyzzz &
      *v292 + D_xxxxxz*v154 + D_xxxxxzz*v178 + D_xxxxxzzz*v220 + &
      D_xxxxxzzzz*v293 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxyz*M_yz + M_xyy*v221 + M_xyyy*v222 + M_xyyyy*v223 + M_xyyyyy &
      *v224 + M_xyyyyz*v225 + M_xyyyz*v226 + M_xyyyzz*v227 + M_xyyz* &
      v228 + M_xyyzz*v229 + M_xyyzzz*v230 + M_xyzz*v206 + M_xyzzz*v207 &
      + M_xyzzzz*v208 + M_xzz*v231 + M_xzzz*v232 + M_xzzzz*v233 + &
      M_xzzzzz*v234 + M_yy*v294 + M_yyy*v295 + M_yyyy*v296 + M_yyyyy* &
      v297 + M_yyyyyy*v298 + M_yyyyyz*v299 + M_yyyyz*v300 + M_yyyyzz* &
      v301 + M_yyyz*v302 + M_yyyzz*v303 + M_yyyzzz*v304 + M_yyz*v305 + &
      M_yyzz*v306 + M_yyzzz*v307 + M_yyzzzz*v308 + M_yzz*v270 + M_yzzz* &
      v271 + M_yzzzz*v272 + M_yzzzzz*v273 + M_zz*v309 + M_zzz*v310 + &
      M_zzzz*v311 + M_zzzzz*v312 + M_zzzzzz*v313)
    L_xxxz      = L_xxxz + (D_xxxxxxxxz*v211 + D_xxxxxxxyz*v212 + D_xxxxxxxz*v173 + D_xxxxxxxzz*v213 &
      + D_xxxxxxyyz*v214 + D_xxxxxxyz*v174 + D_xxxxxxyzz*v215 + &
      D_xxxxxxz*v152 + D_xxxxxxzz*v175 + D_xxxxxxzzz*v216 + D_xxxxxyyyz &
      *v217 + D_xxxxxyyz*v176 + D_xxxxxyyzz*v218 + D_xxxxxyz*v153 + &
      D_xxxxxyzz*v177 + D_xxxxxyzzz*v219 + D_xxxxxz*v142 + D_xxxxxzz* &
      v154 + D_xxxxxzzz*v178 + D_xxxxxzzzz*v220 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz*M_0 + &
      M_xyy*v228 + M_xyyy*v226 + M_xyyyy*v225 + M_xyyyz*v235 + M_xyyz* &
      v197 + M_xyyzz*v236 + M_xyzz*v209 + M_xyzzz*v210 + M_xzz*v237 + &
      M_xzzz*v238 + M_xzzzz*v239 + M_yy*v305 + M_yyy*v302 + M_yyyy*v300 &
      + M_yyyyy*v299 + M_yyyyz*v314 + M_yyyz*v315 + M_yyyzz*v269 + &
      M_yyz*v255 + M_yyzz*v316 + M_yyzzz*v317 + M_yzz*v276 + M_yzzz* &
      v277 + M_yzzzz*v278 + M_zz*v318 + M_zzz*v319 + M_zzzz*v320 + &
      M_zzzzz*v321)
    D_xxyyyyyyy = v190*(v139 + h*v128 + 15015.0d0*v122 - 1001.0d0*v126 - 12155.0d0*v127)
    v322        = 0.5d0*D_xxyyyyyyy
    v325        = 0.166666666666667d0*D_xxyyyyyyy
    v332        = 0.0416666666666667d0*D_xxyyyyyyy
    v344        = 0.00833333333333333d0*D_xxyyyyyyy
    v364        = 0.00138888888888889d0*D_xxyyyyyyy
    v414        = 0.000198412698412698d0*D_xxyyyyyyy
    L_xxyyyyyyy = L_xxyyyyyyy + (D_xxyyyyyyy*M_0)
    D_xxyyyyyyz = v147*(v148 + v191 + 11.0d0*v102 + 33.0d0*v120 + 2145.0d0*v122 - 2431.0d0 &
      *v127 + 143.0d0*v635)
    v326        = 0.5d0*D_xxyyyyyyz
    v333        = 0.166666666666667d0*D_xxyyyyyyz
    v345        = 0.0416666666666667d0*D_xxyyyyyyz
    v365        = 0.00833333333333333d0*D_xxyyyyyyz
    v415        = 0.00138888888888889d0*D_xxyyyyyyz
    L_xxyyyyyyz = L_xxyyyyyyz + (D_xxyyyyyyz*M_0)
    D_xxyyyyyzz = -(D_xxxxyyyyy + D_xxyyyyyyy)
    v323        = 0.5d0*D_xxyyyyyzz
    v335        = 0.25d0*D_xxyyyyyzz
    v347        = 0.0833333333333333d0*D_xxyyyyyzz
    v355        = 0.166666666666667d0*D_xxyyyyyzz
    v367        = 0.0208333333333333d0*D_xxyyyyyzz
    v380        = 0.0416666666666667d0*D_xxyyyyyzz
    v417        = 0.00416666666666667d0*D_xxyyyyyzz
    v436        = 0.00833333333333333d0*D_xxyyyyyzz
    L_xxyyyyy   = L_xxyyyyy + (D_xxxxyyyyy*v142 + D_xxxyyyyyy*M_xy + D_xxxyyyyyz*M_xz + D_xxyyyyy*M_0 + &
      D_xxyyyyyyz*M_yz + M_yy*v322 + M_zz*v323)
    D_xxyyyyzzz = -(D_xxxxyyyyz + D_xxyyyyyyz)
    v328        = 0.166666666666667d0*D_xxyyyyzzz
    v329        = 0.5d0*D_xxyyyyzzz
    v350        = 0.0833333333333333d0*D_xxyyyyzzz
    v356        = 0.25d0*D_xxyyyyzzz
    v370        = 0.0277777777777778d0*D_xxyyyyzzz
    v420        = 0.00694444444444444d0*D_xxyyyyzzz
    v438        = 0.0208333333333333d0*D_xxyyyyzzz
    L_xxyyyy    = L_xxyyyy + (D_xxxxxyyyy*v152 + D_xxxxyyyy*v142 + D_xxxxyyyyy*v153 + D_xxxxyyyyz*v154 &
      + D_xxxyyyyy*M_xy + D_xxxyyyyyz*M_xyz + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyyz*M_yz + M_xyy*v241 + M_xzz*v242 + M_yy* &
      v324 + M_yyy*v325 + M_yyz*v326 + M_yzz*v323 + M_zz*v327 + M_zzz* &
      v328)
    L_xxyyyyz   = L_xxyyyyz + (D_xxxxyyyyz*v142 + D_xxxyyyyyz*M_xy + D_xxxyyyyzz*M_xz + D_xxyyyyyzz* &
      M_yz + D_xxyyyyz*M_0 + M_yy*v326 + M_zz*v329)
    D_xxyyyzzzz = -(D_xxxxyyyzz + D_xxyyyyyzz)
    v338        = 0.0416666666666667d0*D_xxyyyzzzz
    v340        = 0.166666666666667d0*D_xxyyyzzzz
    v374        = 0.0208333333333333d0*D_xxyyyzzzz
    v383        = 0.0833333333333333d0*D_xxyyyzzzz
    v424        = 0.00694444444444444d0*D_xxyyyzzzz
    v440        = 0.0277777777777778d0*D_xxyyyzzzz
    L_xxyyy     = L_xxyyy + (D_xxxxxxyyy*v173 + D_xxxxxyyy*v152 + D_xxxxxyyyy*v174 + D_xxxxxyyyz*v175 &
      + D_xxxxyyy*v142 + D_xxxxyyyy*v153 + D_xxxxyyyyy*v176 + &
      D_xxxxyyyyz*v177 + D_xxxxyyyz*v154 + D_xxxxyyyzz*v178 + D_xxxyyyy &
      *M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + M_xyy*v243 + M_xyyy*v244 + M_xyyz*v245 + M_xyzz* &
      v242 + M_xzz*v246 + M_xzzz*v247 + M_yy*v330 + M_yyy*v331 + M_yyyy &
      *v332 + M_yyyz*v333 + M_yyz*v334 + M_yyzz*v335 + M_yzz*v327 + &
      M_yzzz*v328 + M_zz*v336 + M_zzz*v337 + M_zzzz*v338)
    L_xxyyyz    = L_xxyyyz + (D_xxxxxyyyz*v152 + D_xxxxyyyyz*v153 + D_xxxxyyyz*v142 + D_xxxxyyyzz*v154 &
      + D_xxxyyyyz*M_xy + D_xxxyyyyzz*M_xyz + D_xxxyyyzz*M_xz + &
      D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + M_xyy*v245 + M_xzz*v248 + M_yy* &
      v334 + M_yyy*v333 + M_yyz*v323 + M_yzz*v329 + M_zz*v339 + M_zzz* &
      v340)
    D_xxyyzzzzz = -(D_xxxxyyzzz + D_xxyyyyzzz)
    v354        = 0.00833333333333333d0*D_xxyyzzzzz
    v359        = 0.0416666666666667d0*D_xxyyzzzzz
    v429        = 0.00416666666666667d0*D_xxyyzzzzz
    v443        = 0.0208333333333333d0*D_xxyyzzzzz
    L_xxyy      = L_xxyy + (D_xxxxxxxyy*v211 + D_xxxxxxyy*v173 + D_xxxxxxyyy*v212 + D_xxxxxxyyz*v213 &
      + D_xxxxxyy*v152 + D_xxxxxyyy*v174 + D_xxxxxyyyy*v214 + &
      D_xxxxxyyyz*v215 + D_xxxxxyyz*v175 + D_xxxxxyyzz*v216 + D_xxxxyy* &
      v142 + D_xxxxyyy*v153 + D_xxxxyyyy*v176 + D_xxxxyyyyy*v217 + &
      D_xxxxyyyyz*v218 + D_xxxxyyyz*v177 + D_xxxxyyyzz*v219 + D_xxxxyyz &
      *v154 + D_xxxxyyzz*v178 + D_xxxxyyzzz*v220 + D_xxxyyy*M_xy + &
      D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz*M_yz + &
      M_xyy*v249 + M_xyyy*v250 + M_xyyyy*v251 + M_xyyyz*v252 + M_xyyz* &
      v253 + M_xyyzz*v254 + M_xyzz*v246 + M_xyzzz*v247 + M_xzz*v255 + &
      M_xzzz*v256 + M_xzzzz*v257 + M_yy*v341 + M_yyy*v342 + M_yyyy*v343 &
      + M_yyyyy*v344 + M_yyyyz*v345 + M_yyyz*v346 + M_yyyzz*v347 + &
      M_yyz*v348 + M_yyzz*v349 + M_yyzzz*v350 + M_yzz*v336 + M_yzzz* &
      v337 + M_yzzzz*v338 + M_zz*v351 + M_zzz*v352 + M_zzzz*v353 + &
      M_zzzzz*v354)
    L_xxyyz     = L_xxyyz + (D_xxxxxxyyz*v173 + D_xxxxxyyyz*v174 + D_xxxxxyyz*v152 + D_xxxxxyyzz*v175 &
      + D_xxxxyyyyz*v176 + D_xxxxyyyz*v153 + D_xxxxyyyzz*v177 + &
      D_xxxxyyz*v142 + D_xxxxyyzz*v154 + D_xxxxyyzzz*v178 + D_xxxyyyz* &
      M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + M_xyy*v253 + M_xyyy*v252 + M_xyyz*v242 + M_xyzz* &
      v248 + M_xzz*v258 + M_xzzz*v259 + M_yy*v348 + M_yyy*v346 + M_yyyy &
      *v345 + M_yyyz*v355 + M_yyz*v327 + M_yyzz*v356 + M_yzz*v339 + &
      M_yzzz*v340 + M_zz*v357 + M_zzz*v358 + M_zzzz*v359)
    D_xxyzzzzzz = -(D_xxxxyzzzz + D_xxyyyzzzz)
    v379        = 0.00138888888888889d0*D_xxyzzzzzz
    v387        = 0.00833333333333333d0*D_xxyzzzzzz
    L_xxy       = L_xxy + (D_xxxxxxxxy*v279 + D_xxxxxxxy*v211 + D_xxxxxxxyy*v280 + D_xxxxxxxyz*v281 &
      + D_xxxxxxy*v173 + D_xxxxxxyy*v212 + D_xxxxxxyyy*v282 + &
      D_xxxxxxyyz*v283 + D_xxxxxxyz*v213 + D_xxxxxxyzz*v284 + D_xxxxxy* &
      v152 + D_xxxxxyy*v174 + D_xxxxxyyy*v214 + D_xxxxxyyyy*v285 + &
      D_xxxxxyyyz*v286 + D_xxxxxyyz*v215 + D_xxxxxyyzz*v287 + D_xxxxxyz &
      *v175 + D_xxxxxyzz*v216 + D_xxxxxyzzz*v288 + D_xxxxy*v142 + &
      D_xxxxyy*v153 + D_xxxxyyy*v176 + D_xxxxyyyy*v217 + D_xxxxyyyyy* &
      v289 + D_xxxxyyyyz*v290 + D_xxxxyyyz*v218 + D_xxxxyyyzz*v291 + &
      D_xxxxyyz*v177 + D_xxxxyyzz*v219 + D_xxxxyyzzz*v292 + D_xxxxyz* &
      v154 + D_xxxxyzz*v178 + D_xxxxyzzz*v220 + D_xxxxyzzzz*v293 + &
      D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyyz*M_yz + M_xyy*v260 + M_xyyy*v261 + M_xyyyy*v262 + M_xyyyyy &
      *v263 + M_xyyyyz*v264 + M_xyyyz*v265 + M_xyyyzz*v266 + M_xyyz* &
      v267 + M_xyyzz*v268 + M_xyyzzz*v269 + M_xyzz*v255 + M_xyzzz*v256 &
      + M_xyzzzz*v257 + M_xzz*v270 + M_xzzz*v271 + M_xzzzz*v272 + &
      M_xzzzzz*v273 + M_yy*v360 + M_yyy*v361 + M_yyyy*v362 + M_yyyyy* &
      v363 + M_yyyyyy*v364 + M_yyyyyz*v365 + M_yyyyz*v366 + M_yyyyzz* &
      v367 + M_yyyz*v368 + M_yyyzz*v369 + M_yyyzzz*v370 + M_yyz*v371 + &
      M_yyzz*v372 + M_yyzzz*v373 + M_yyzzzz*v374 + M_yzz*v351 + M_yzzz* &
      v352 + M_yzzzz*v353 + M_yzzzzz*v354 + M_zz*v375 + M_zzz*v376 + &
      M_zzzz*v377 + M_zzzzz*v378 + M_zzzzzz*v379)
    L_xxyz      = L_xxyz + (D_xxxxxxxyz*v211 + D_xxxxxxyyz*v212 + D_xxxxxxyz*v173 + D_xxxxxxyzz*v213 &
      + D_xxxxxyyyz*v214 + D_xxxxxyyz*v174 + D_xxxxxyyzz*v215 + &
      D_xxxxxyz*v152 + D_xxxxxyzz*v175 + D_xxxxxyzzz*v216 + D_xxxxyyyyz &
      *v217 + D_xxxxyyyz*v176 + D_xxxxyyyzz*v218 + D_xxxxyyz*v153 + &
      D_xxxxyyzz*v177 + D_xxxxyyzzz*v219 + D_xxxxyz*v142 + D_xxxxyzz* &
      v154 + D_xxxxyzzz*v178 + D_xxxxyzzzz*v220 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz*M_0 + &
      M_xyy*v267 + M_xyyy*v265 + M_xyyyy*v264 + M_xyyyz*v274 + M_xyyz* &
      v246 + M_xyyzz*v275 + M_xyzz*v258 + M_xyzzz*v259 + M_xzz*v276 + &
      M_xzzz*v277 + M_xzzzz*v278 + M_yy*v371 + M_yyy*v368 + M_yyyy*v366 &
      + M_yyyyy*v365 + M_yyyyz*v380 + M_yyyz*v381 + M_yyyzz*v350 + &
      M_yyz*v336 + M_yyzz*v382 + M_yyzzz*v383 + M_yzz*v357 + M_yzzz* &
      v358 + M_yzzzz*v359 + M_zz*v384 + M_zzz*v385 + M_zzzz*v386 + &
      M_zzzzz*v387)
    D_xxzzzzzzz = -(D_xxxxzzzzz + D_xxyyzzzzz)
    v435        = 0.000198412698412698d0*D_xxzzzzzzz
    v448        = 0.00138888888888889d0*D_xxzzzzzzz
    L_xx        = L_xx + (D_xx*M_0 + D_xxxx*v142 + D_xxxxx*v152 + D_xxxxxx*v173 + D_xxxxxxx*v211 + &
      D_xxxxxxxx*v279 + D_xxxxxxxxx*v388 + D_xxxxxxxxy*v389 + &
      D_xxxxxxxxz*v390 + D_xxxxxxxy*v280 + D_xxxxxxxyy*v391 + &
      D_xxxxxxxyz*v392 + D_xxxxxxxz*v281 + D_xxxxxxxzz*v393 + D_xxxxxxy &
      *v212 + D_xxxxxxyy*v282 + D_xxxxxxyyy*v394 + D_xxxxxxyyz*v395 + &
      D_xxxxxxyz*v283 + D_xxxxxxyzz*v396 + D_xxxxxxz*v213 + D_xxxxxxzz* &
      v284 + D_xxxxxxzzz*v397 + D_xxxxxy*v174 + D_xxxxxyy*v214 + &
      D_xxxxxyyy*v285 + D_xxxxxyyyy*v398 + D_xxxxxyyyz*v399 + &
      D_xxxxxyyz*v286 + D_xxxxxyyzz*v400 + D_xxxxxyz*v215 + D_xxxxxyzz* &
      v287 + D_xxxxxyzzz*v401 + D_xxxxxz*v175 + D_xxxxxzz*v216 + &
      D_xxxxxzzz*v288 + D_xxxxxzzzz*v402 + D_xxxxy*v153 + D_xxxxyy*v176 &
      + D_xxxxyyy*v217 + D_xxxxyyyy*v289 + D_xxxxyyyyy*v403 + &
      D_xxxxyyyyz*v404 + D_xxxxyyyz*v290 + D_xxxxyyyzz*v405 + D_xxxxyyz &
      *v218 + D_xxxxyyzz*v291 + D_xxxxyyzzz*v406 + D_xxxxyz*v177 + &
      D_xxxxyzz*v219 + D_xxxxyzzz*v292 + D_xxxxyzzzz*v407 + D_xxxxz* &
      v154 + D_xxxxzz*v178 + D_xxxxzzz*v220 + D_xxxxzzzz*v293 + &
      D_xxxxzzzzz*v408 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + &
      D_xxyz*M_yz + M_xyy*v294 + M_xyyy*v295 + M_xyyyy*v296 + M_xyyyyy* &
      v297 + M_xyyyyyy*v298 + M_xyyyyyz*v299 + M_xyyyyz*v300 + &
      M_xyyyyzz*v301 + M_xyyyz*v302 + M_xyyyzz*v303 + M_xyyyzzz*v304 + &
      M_xyyz*v305 + M_xyyzz*v306 + M_xyyzzz*v307 + M_xyyzzzz*v308 + &
      M_xyzz*v270 + M_xyzzz*v271 + M_xyzzzz*v272 + M_xyzzzzz*v273 + &
      M_xzz*v309 + M_xzzz*v310 + M_xzzzz*v311 + M_xzzzzz*v312 + &
      M_xzzzzzz*v313 + M_yy*v409 + M_yyy*v410 + M_yyyy*v411 + M_yyyyy* &
      v412 + M_yyyyyy*v413 + M_yyyyyyy*v414 + M_yyyyyyz*v415 + M_yyyyyz &
      *v416 + M_yyyyyzz*v417 + M_yyyyz*v418 + M_yyyyzz*v419 + M_yyyyzzz &
      *v420 + M_yyyz*v421 + M_yyyzz*v422 + M_yyyzzz*v423 + M_yyyzzzz* &
      v424 + M_yyz*v425 + M_yyzz*v426 + M_yyzzz*v427 + M_yyzzzz*v428 + &
      M_yyzzzzz*v429 + M_yzz*v375 + M_yzzz*v376 + M_yzzzz*v377 + &
      M_yzzzzz*v378 + M_yzzzzzz*v379 + M_zz*v430 + M_zzz*v431 + M_zzzz* &
      v432 + M_zzzzz*v433 + M_zzzzzz*v434 + M_zzzzzzz*v435)
    L_xxz       = L_xxz + (D_xxxxxxxxz*v279 + D_xxxxxxxyz*v280 + D_xxxxxxxz*v211 + D_xxxxxxxzz*v281 &
      + D_xxxxxxyyz*v282 + D_xxxxxxyz*v212 + D_xxxxxxyzz*v283 + &
      D_xxxxxxz*v173 + D_xxxxxxzz*v213 + D_xxxxxxzzz*v284 + D_xxxxxyyyz &
      *v285 + D_xxxxxyyz*v214 + D_xxxxxyyzz*v286 + D_xxxxxyz*v174 + &
      D_xxxxxyzz*v215 + D_xxxxxyzzz*v287 + D_xxxxxz*v152 + D_xxxxxzz* &
      v175 + D_xxxxxzzz*v216 + D_xxxxxzzzz*v288 + D_xxxxyyyyz*v289 + &
      D_xxxxyyyz*v217 + D_xxxxyyyzz*v290 + D_xxxxyyz*v176 + D_xxxxyyzz* &
      v218 + D_xxxxyyzzz*v291 + D_xxxxyz*v153 + D_xxxxyzz*v177 + &
      D_xxxxyzzz*v219 + D_xxxxyzzzz*v292 + D_xxxxz*v142 + D_xxxxzz*v154 &
      + D_xxxxzzz*v178 + D_xxxxzzzz*v220 + D_xxxxzzzzz*v293 + D_xxxyz* &
      M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_xyy*v305 + M_xyyy*v302 + M_xyyyy*v300 + M_xyyyyy*v299 + &
      M_xyyyyz*v314 + M_xyyyz*v315 + M_xyyyzz*v269 + M_xyyz*v255 + &
      M_xyyzz*v316 + M_xyyzzz*v317 + M_xyzz*v276 + M_xyzzz*v277 + &
      M_xyzzzz*v278 + M_xzz*v318 + M_xzzz*v319 + M_xzzzz*v320 + &
      M_xzzzzz*v321 + M_yy*v425 + M_yyy*v421 + M_yyyy*v418 + M_yyyyy* &
      v416 + M_yyyyyy*v415 + M_yyyyyz*v436 + M_yyyyz*v437 + M_yyyyzz* &
      v438 + M_yyyz*v439 + M_yyyzz*v373 + M_yyyzzz*v440 + M_yyz*v351 + &
      M_yyzz*v441 + M_yyzzz*v442 + M_yyzzzz*v443 + M_yzz*v384 + M_yzzz* &
      v385 + M_yzzzz*v386 + M_yzzzzz*v387 + M_zz*v444 + M_zzz*v445 + &
      M_zzzz*v446 + M_zzzzz*v447 + M_zzzzzz*v448)
    D_xyyyyyyyy = v240*v449
    L_xyyyyyyyy = L_xyyyyyyyy + (D_xyyyyyyyy*M_0)
    D_xyyyyyyyz = v140*(v141 - 91.0d0*v64 - 221.0d0*v68 + 273.0d0*v69)
    v453        = 0.5d0*D_xyyyyyyyz
    v458        = 0.166666666666667d0*D_xyyyyyyyz
    v467        = 0.0416666666666667d0*D_xyyyyyyyz
    v483        = 0.00833333333333333d0*D_xyyyyyyyz
    v507        = 0.00138888888888889d0*D_xyyyyyyyz
    L_xyyyyyyyz = L_xyyyyyyyz + (D_xyyyyyyyz*M_0)
    D_xyyyyyyzz = -(D_xxxyyyyyy + D_xyyyyyyyy)
    v451        = 0.5d0*D_xyyyyyyzz
    v460        = 0.25d0*D_xyyyyyyzz
    v469        = 0.0833333333333333d0*D_xyyyyyyzz
    v477        = 0.166666666666667d0*D_xyyyyyyzz
    v485        = 0.0208333333333333d0*D_xyyyyyyzz
    v498        = 0.0416666666666667d0*D_xyyyyyyzz
    v509        = 0.00416666666666667d0*D_xyyyyyyzz
    v528        = 0.00833333333333333d0*D_xyyyyyyzz
    L_xyyyyyy   = L_xyyyyyy + (D_xxxyyyyyy*v142 + D_xxyyyyyyy*M_xy + D_xxyyyyyyz*M_xz + D_xyyyyyy*M_0 + &
      D_xyyyyyyyy*v450 + D_xyyyyyyyz*M_yz + M_zz*v451)
    D_xyyyyyzzz = -(D_xxxyyyyyz + D_xyyyyyyyz)
    v455        = 0.166666666666667d0*D_xyyyyyzzz
    v456        = 0.5d0*D_xyyyyyzzz
    v472        = 0.0833333333333333d0*D_xyyyyyzzz
    v478        = 0.25d0*D_xyyyyyzzz
    v488        = 0.0277777777777778d0*D_xyyyyyzzz
    v512        = 0.00694444444444444d0*D_xyyyyyzzz
    v530        = 0.0208333333333333d0*D_xyyyyyzzz
    L_xyyyyy    = L_xyyyyy + (D_xxxxyyyyy*v152 + D_xxxyyyyy*v142 + D_xxxyyyyyy*v153 + D_xxxyyyyyz*v154 &
      + D_xxyyyyyy*M_xy + D_xxyyyyyyz*M_xyz + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyyy*v450 + D_xyyyyyyyy*v452 + D_xyyyyyyz* &
      M_yz + M_xyy*v322 + M_xzz*v323 + M_yyz*v453 + M_yzz*v451 + M_zz* &
      v454 + M_zzz*v455)
    L_xyyyyyz   = L_xyyyyyz + (D_xxxyyyyyz*v142 + D_xxyyyyyyz*M_xy + D_xxyyyyyzz*M_xz + D_xyyyyyyyz* &
      v450 + D_xyyyyyyzz*M_yz + D_xyyyyyz*M_0 + M_zz*v456)
    D_xyyyyzzzz = -(D_xxxyyyyzz + D_xyyyyyyzz)
    v463        = 0.0416666666666667d0*D_xyyyyzzzz
    v465        = 0.166666666666667d0*D_xyyyyzzzz
    v492        = 0.0208333333333333d0*D_xyyyyzzzz
    v501        = 0.0833333333333333d0*D_xyyyyzzzz
    v516        = 0.00694444444444444d0*D_xyyyyzzzz
    v532        = 0.0277777777777778d0*D_xyyyyzzzz
    L_xyyyy     = L_xyyyy + (D_xxxxxyyyy*v173 + D_xxxxyyyy*v152 + D_xxxxyyyyy*v174 + D_xxxxyyyyz*v175 &
      + D_xxxyyyy*v142 + D_xxxyyyyy*v153 + D_xxxyyyyyy*v176 + &
      D_xxxyyyyyz*v177 + D_xxxyyyyz*v154 + D_xxxyyyyzz*v178 + D_xxyyyyy &
      *M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyy*v450 + D_xyyyyyyy*v452 + D_xyyyyyyyy*v457 + D_xyyyyyz* &
      M_yz + M_xyy*v324 + M_xyyy*v325 + M_xyyz*v326 + M_xyzz*v323 + &
      M_xzz*v327 + M_xzzz*v328 + M_yyyz*v458 + M_yyz*v459 + M_yyzz*v460 &
      + M_yzz*v454 + M_yzzz*v455 + M_zz*v461 + M_zzz*v462 + M_zzzz*v463)
    L_xyyyyz    = L_xyyyyz + (D_xxxxyyyyz*v152 + D_xxxyyyyyz*v153 + D_xxxyyyyz*v142 + D_xxxyyyyzz*v154 &
      + D_xxyyyyyz*M_xy + D_xxyyyyyzz*M_xyz + D_xxyyyyzz*M_xz + &
      D_xyyyyyyyz*v452 + D_xyyyyyyz*v450 + D_xyyyyyzz*M_yz + D_xyyyyz* &
      M_0 + M_xyy*v326 + M_xzz*v329 + M_yyz*v451 + M_yzz*v456 + M_zz* &
      v464 + M_zzz*v465)
    D_xyyyzzzzz = -(D_xxxyyyzzz + D_xyyyyyzzz)
    v476        = 0.00833333333333333d0*D_xyyyzzzzz
    v481        = 0.0416666666666667d0*D_xyyyzzzzz
    v521        = 0.00416666666666667d0*D_xyyyzzzzz
    v535        = 0.0208333333333333d0*D_xyyyzzzzz
    L_xyyy      = L_xyyy + (D_xxxxxxyyy*v211 + D_xxxxxyyy*v173 + D_xxxxxyyyy*v212 + D_xxxxxyyyz*v213 &
      + D_xxxxyyy*v152 + D_xxxxyyyy*v174 + D_xxxxyyyyy*v214 + &
      D_xxxxyyyyz*v215 + D_xxxxyyyz*v175 + D_xxxxyyyzz*v216 + D_xxxyyy* &
      v142 + D_xxxyyyy*v153 + D_xxxyyyyy*v176 + D_xxxyyyyyy*v217 + &
      D_xxxyyyyyz*v218 + D_xxxyyyyz*v177 + D_xxxyyyyzz*v219 + D_xxxyyyz &
      *v154 + D_xxxyyyzz*v178 + D_xxxyyyzzz*v220 + D_xxyyyy*M_xy + &
      D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy*v450 + &
      D_xyyyyyy*v452 + D_xyyyyyyy*v457 + D_xyyyyyyyy*v466 + D_xyyyyz* &
      M_yz + M_xyy*v330 + M_xyyy*v331 + M_xyyyy*v332 + M_xyyyz*v333 + &
      M_xyyz*v334 + M_xyyzz*v335 + M_xyzz*v327 + M_xyzzz*v328 + M_xzz* &
      v336 + M_xzzz*v337 + M_xzzzz*v338 + M_yyyyz*v467 + M_yyyz*v468 + &
      M_yyyzz*v469 + M_yyz*v470 + M_yyzz*v471 + M_yyzzz*v472 + M_yzz* &
      v461 + M_yzzz*v462 + M_yzzzz*v463 + M_zz*v473 + M_zzz*v474 + &
      M_zzzz*v475 + M_zzzzz*v476)
    L_xyyyz     = L_xyyyz + (D_xxxxxyyyz*v173 + D_xxxxyyyyz*v174 + D_xxxxyyyz*v152 + D_xxxxyyyzz*v175 &
      + D_xxxyyyyyz*v176 + D_xxxyyyyz*v153 + D_xxxyyyyzz*v177 + &
      D_xxxyyyz*v142 + D_xxxyyyzz*v154 + D_xxxyyyzzz*v178 + D_xxyyyyz* &
      M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyyyyz*v457 + &
      D_xyyyyyyz*v452 + D_xyyyyyz*v450 + D_xyyyyzz*M_yz + D_xyyyz*M_0 + &
      M_xyy*v334 + M_xyyy*v333 + M_xyyz*v323 + M_xyzz*v329 + M_xzz*v339 &
      + M_xzzz*v340 + M_yyyz*v477 + M_yyz*v454 + M_yyzz*v478 + M_yzz* &
      v464 + M_yzzz*v465 + M_zz*v479 + M_zzz*v480 + M_zzzz*v481)
    D_xyyzzzzzz = -(D_xxxyyzzzz + D_xyyyyzzzz)
    v497        = 0.00138888888888889d0*D_xyyzzzzzz
    v505        = 0.00833333333333333d0*D_xyyzzzzzz
    L_xyy       = L_xyy + (D_xxxxxxxyy*v279 + D_xxxxxxyy*v211 + D_xxxxxxyyy*v280 + D_xxxxxxyyz*v281 &
      + D_xxxxxyy*v173 + D_xxxxxyyy*v212 + D_xxxxxyyyy*v282 + &
      D_xxxxxyyyz*v283 + D_xxxxxyyz*v213 + D_xxxxxyyzz*v284 + D_xxxxyy* &
      v152 + D_xxxxyyy*v174 + D_xxxxyyyy*v214 + D_xxxxyyyyy*v285 + &
      D_xxxxyyyyz*v286 + D_xxxxyyyz*v215 + D_xxxxyyyzz*v287 + D_xxxxyyz &
      *v175 + D_xxxxyyzz*v216 + D_xxxxyyzzz*v288 + D_xxxyy*v142 + &
      D_xxxyyy*v153 + D_xxxyyyy*v176 + D_xxxyyyyy*v217 + D_xxxyyyyyy* &
      v289 + D_xxxyyyyyz*v290 + D_xxxyyyyz*v218 + D_xxxyyyyzz*v291 + &
      D_xxxyyyz*v177 + D_xxxyyyzz*v219 + D_xxxyyyzzz*v292 + D_xxxyyz* &
      v154 + D_xxxyyzz*v178 + D_xxxyyzzz*v220 + D_xxxyyzzzz*v293 + &
      D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyyy*v450 + D_xyyyyy*v452 + D_xyyyyyy*v457 + D_xyyyyyyy*v466 + &
      D_xyyyyyyyy*v482 + D_xyyyz*M_yz + M_xyy*v341 + M_xyyy*v342 + &
      M_xyyyy*v343 + M_xyyyyy*v344 + M_xyyyyz*v345 + M_xyyyz*v346 + &
      M_xyyyzz*v347 + M_xyyz*v348 + M_xyyzz*v349 + M_xyyzzz*v350 + &
      M_xyzz*v336 + M_xyzzz*v337 + M_xyzzzz*v338 + M_xzz*v351 + M_xzzz* &
      v352 + M_xzzzz*v353 + M_xzzzzz*v354 + M_yyyyyz*v483 + M_yyyyz* &
      v484 + M_yyyyzz*v485 + M_yyyz*v486 + M_yyyzz*v487 + M_yyyzzz*v488 &
      + M_yyz*v489 + M_yyzz*v490 + M_yyzzz*v491 + M_yyzzzz*v492 + M_yzz &
      *v473 + M_yzzz*v474 + M_yzzzz*v475 + M_yzzzzz*v476 + M_zz*v493 + &
      M_zzz*v494 + M_zzzz*v495 + M_zzzzz*v496 + M_zzzzzz*v497)
    L_xyyz      = L_xyyz + (D_xxxxxxyyz*v211 + D_xxxxxyyyz*v212 + D_xxxxxyyz*v173 + D_xxxxxyyzz*v213 &
      + D_xxxxyyyyz*v214 + D_xxxxyyyz*v174 + D_xxxxyyyzz*v215 + &
      D_xxxxyyz*v152 + D_xxxxyyzz*v175 + D_xxxxyyzzz*v216 + D_xxxyyyyyz &
      *v217 + D_xxxyyyyz*v176 + D_xxxyyyyzz*v218 + D_xxxyyyz*v153 + &
      D_xxxyyyzz*v177 + D_xxxyyyzzz*v219 + D_xxxyyz*v142 + D_xxxyyzz* &
      v154 + D_xxxyyzzz*v178 + D_xxxyyzzzz*v220 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyyyz*v466 + D_xyyyyyyz* &
      v457 + D_xyyyyyz*v452 + D_xyyyyz*v450 + D_xyyyzz*M_yz + D_xyyz* &
      M_0 + M_xyy*v348 + M_xyyy*v346 + M_xyyyy*v345 + M_xyyyz*v355 + &
      M_xyyz*v327 + M_xyyzz*v356 + M_xyzz*v339 + M_xyzzz*v340 + M_xzz* &
      v357 + M_xzzz*v358 + M_xzzzz*v359 + M_yyyyz*v498 + M_yyyz*v499 + &
      M_yyyzz*v472 + M_yyz*v461 + M_yyzz*v500 + M_yyzzz*v501 + M_yzz* &
      v479 + M_yzzz*v480 + M_yzzzz*v481 + M_zz*v502 + M_zzz*v503 + &
      M_zzzz*v504 + M_zzzzz*v505)
    D_xyzzzzzzz = -(D_xxxyzzzzz + D_xyyyzzzzz)
    v527        = 0.000198412698412698d0*D_xyzzzzzzz
    v540        = 0.00138888888888889d0*D_xyzzzzzzz
    L_xy        = L_xy + (D_xxxxxxxxy*v388 + D_xxxxxxxy*v279 + D_xxxxxxxyy*v389 + D_xxxxxxxyz*v390 &
      + D_xxxxxxy*v211 + D_xxxxxxyy*v280 + D_xxxxxxyyy*v391 + &
      D_xxxxxxyyz*v392 + D_xxxxxxyz*v281 + D_xxxxxxyzz*v393 + D_xxxxxy* &
      v173 + D_xxxxxyy*v212 + D_xxxxxyyy*v282 + D_xxxxxyyyy*v394 + &
      D_xxxxxyyyz*v395 + D_xxxxxyyz*v283 + D_xxxxxyyzz*v396 + D_xxxxxyz &
      *v213 + D_xxxxxyzz*v284 + D_xxxxxyzzz*v397 + D_xxxxy*v152 + &
      D_xxxxyy*v174 + D_xxxxyyy*v214 + D_xxxxyyyy*v285 + D_xxxxyyyyy* &
      v398 + D_xxxxyyyyz*v399 + D_xxxxyyyz*v286 + D_xxxxyyyzz*v400 + &
      D_xxxxyyz*v215 + D_xxxxyyzz*v287 + D_xxxxyyzzz*v401 + D_xxxxyz* &
      v175 + D_xxxxyzz*v216 + D_xxxxyzzz*v288 + D_xxxxyzzzz*v402 + &
      D_xxxy*v142 + D_xxxyy*v153 + D_xxxyyy*v176 + D_xxxyyyy*v217 + &
      D_xxxyyyyy*v289 + D_xxxyyyyyy*v403 + D_xxxyyyyyz*v404 + &
      D_xxxyyyyz*v290 + D_xxxyyyyzz*v405 + D_xxxyyyz*v218 + D_xxxyyyzz* &
      v291 + D_xxxyyyzzz*v406 + D_xxxyyz*v177 + D_xxxyyzz*v219 + &
      D_xxxyyzzz*v292 + D_xxxyyzzzz*v407 + D_xxxyz*v154 + D_xxxyzz*v178 &
      + D_xxxyzzz*v220 + D_xxxyzzzz*v293 + D_xxxyzzzzz*v408 + D_xxyy* &
      M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v450 + &
      D_xyyyy*v452 + D_xyyyyy*v457 + D_xyyyyyy*v466 + D_xyyyyyyy*v482 + &
      D_xyyyyyyyy*v506 + D_xyyz*M_yz + M_xyy*v360 + M_xyyy*v361 + &
      M_xyyyy*v362 + M_xyyyyy*v363 + M_xyyyyyy*v364 + M_xyyyyyz*v365 + &
      M_xyyyyz*v366 + M_xyyyyzz*v367 + M_xyyyz*v368 + M_xyyyzz*v369 + &
      M_xyyyzzz*v370 + M_xyyz*v371 + M_xyyzz*v372 + M_xyyzzz*v373 + &
      M_xyyzzzz*v374 + M_xyzz*v351 + M_xyzzz*v352 + M_xyzzzz*v353 + &
      M_xyzzzzz*v354 + M_xzz*v375 + M_xzzz*v376 + M_xzzzz*v377 + &
      M_xzzzzz*v378 + M_xzzzzzz*v379 + M_yyyyyyz*v507 + M_yyyyyz*v508 + &
      M_yyyyyzz*v509 + M_yyyyz*v510 + M_yyyyzz*v511 + M_yyyyzzz*v512 + &
      M_yyyz*v513 + M_yyyzz*v514 + M_yyyzzz*v515 + M_yyyzzzz*v516 + &
      M_yyz*v517 + M_yyzz*v518 + M_yyzzz*v519 + M_yyzzzz*v520 + &
      M_yyzzzzz*v521 + M_yzz*v493 + M_yzzz*v494 + M_yzzzz*v495 + &
      M_yzzzzz*v496 + M_yzzzzzz*v497 + M_zz*v522 + M_zzz*v523 + M_zzzz* &
      v524 + M_zzzzz*v525 + M_zzzzzz*v526 + M_zzzzzzz*v527)
    L_xyz       = L_xyz + (D_xxxxxxxyz*v279 + D_xxxxxxyyz*v280 + D_xxxxxxyz*v211 + D_xxxxxxyzz*v281 &
      + D_xxxxxyyyz*v282 + D_xxxxxyyz*v212 + D_xxxxxyyzz*v283 + &
      D_xxxxxyz*v173 + D_xxxxxyzz*v213 + D_xxxxxyzzz*v284 + D_xxxxyyyyz &
      *v285 + D_xxxxyyyz*v214 + D_xxxxyyyzz*v286 + D_xxxxyyz*v174 + &
      D_xxxxyyzz*v215 + D_xxxxyyzzz*v287 + D_xxxxyz*v152 + D_xxxxyzz* &
      v175 + D_xxxxyzzz*v216 + D_xxxxyzzzz*v288 + D_xxxyyyyyz*v289 + &
      D_xxxyyyyz*v217 + D_xxxyyyyzz*v290 + D_xxxyyyz*v176 + D_xxxyyyzz* &
      v218 + D_xxxyyyzzz*v291 + D_xxxyyz*v153 + D_xxxyyzz*v177 + &
      D_xxxyyzzz*v219 + D_xxxyyzzzz*v292 + D_xxxyz*v142 + D_xxxyzz*v154 &
      + D_xxxyzzz*v178 + D_xxxyzzzz*v220 + D_xxxyzzzzz*v293 + D_xxyyz* &
      M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyyyyyyz*v482 + &
      D_xyyyyyyz*v466 + D_xyyyyyz*v457 + D_xyyyyz*v452 + D_xyyyz*v450 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v371 + M_xyyy*v368 + M_xyyyy* &
      v366 + M_xyyyyy*v365 + M_xyyyyz*v380 + M_xyyyz*v381 + M_xyyyzz* &
      v350 + M_xyyz*v336 + M_xyyzz*v382 + M_xyyzzz*v383 + M_xyzz*v357 + &
      M_xyzzz*v358 + M_xyzzzz*v359 + M_xzz*v384 + M_xzzz*v385 + M_xzzzz &
      *v386 + M_xzzzzz*v387 + M_yyyyyz*v528 + M_yyyyz*v529 + M_yyyyzz* &
      v530 + M_yyyz*v531 + M_yyyzz*v491 + M_yyyzzz*v532 + M_yyz*v473 + &
      M_yyzz*v533 + M_yyzzz*v534 + M_yyzzzz*v535 + M_yzz*v502 + M_yzzz* &
      v503 + M_yzzzz*v504 + M_yzzzzz*v505 + M_zz*v536 + M_zzz*v537 + &
      M_zzzz*v538 + M_zzzzz*v539 + M_zzzzzz*v540)
    D_xzzzzzzzz = -(D_xxxzzzzzz + D_xyyzzzzzz)
    L_x         = L_x + (D_x*M_0 + D_xxx*v142 + D_xxxx*v152 + D_xxxxx*v173 + D_xxxxxx*v211 + &
      D_xxxxxxx*v279 + D_xxxxxxxx*v388 + D_xxxxxxxxx*v541 + D_xxxxxxxxy &
      *v542 + D_xxxxxxxxz*v543 + D_xxxxxxxy*v389 + D_xxxxxxxyy*v544 + &
      D_xxxxxxxyz*v545 + D_xxxxxxxz*v390 + D_xxxxxxxzz*v546 + D_xxxxxxy &
      *v280 + D_xxxxxxyy*v391 + D_xxxxxxyyy*v547 + D_xxxxxxyyz*v548 + &
      D_xxxxxxyz*v392 + D_xxxxxxyzz*v549 + D_xxxxxxz*v281 + D_xxxxxxzz* &
      v393 + D_xxxxxxzzz*v550 + D_xxxxxy*v212 + D_xxxxxyy*v282 + &
      D_xxxxxyyy*v394 + D_xxxxxyyyy*v551 + D_xxxxxyyyz*v552 + &
      D_xxxxxyyz*v395 + D_xxxxxyyzz*v553 + D_xxxxxyz*v283 + D_xxxxxyzz* &
      v396 + D_xxxxxyzzz*v554 + D_xxxxxz*v213 + D_xxxxxzz*v284 + &
      D_xxxxxzzz*v397 + D_xxxxxzzzz*v555 + D_xxxxy*v174 + D_xxxxyy*v214 &
      + D_xxxxyyy*v285 + D_xxxxyyyy*v398 + D_xxxxyyyyy*v556 + &
      D_xxxxyyyyz*v557 + D_xxxxyyyz*v399 + D_xxxxyyyzz*v558 + D_xxxxyyz &
      *v286 + D_xxxxyyzz*v400 + D_xxxxyyzzz*v559 + D_xxxxyz*v215 + &
      D_xxxxyzz*v287 + D_xxxxyzzz*v401 + D_xxxxyzzzz*v560 + D_xxxxz* &
      v175 + D_xxxxzz*v216 + D_xxxxzzz*v288 + D_xxxxzzzz*v402 + &
      D_xxxxzzzzz*v561 + D_xxxy*v153 + D_xxxyy*v176 + D_xxxyyy*v217 + &
      D_xxxyyyy*v289 + D_xxxyyyyy*v403 + D_xxxyyyyyy*v562 + D_xxxyyyyyz &
      *v563 + D_xxxyyyyz*v404 + D_xxxyyyyzz*v564 + D_xxxyyyz*v290 + &
      D_xxxyyyzz*v405 + D_xxxyyyzzz*v565 + D_xxxyyz*v218 + D_xxxyyzz* &
      v291 + D_xxxyyzzz*v406 + D_xxxyyzzzz*v566 + D_xxxyz*v177 + &
      D_xxxyzz*v219 + D_xxxyzzz*v292 + D_xxxyzzzz*v407 + D_xxxyzzzzz* &
      v567 + D_xxxz*v154 + D_xxxzz*v178 + D_xxxzzz*v220 + D_xxxzzzz* &
      v293 + D_xxxzzzzz*v408 + D_xxxzzzzzz*v568 + D_xxy*M_xy + D_xxyz* &
      M_xyz + D_xxz*M_xz + D_xyy*v450 + D_xyyy*v452 + D_xyyyy*v457 + &
      D_xyyyyy*v466 + D_xyyyyyy*v482 + D_xyyyyyyy*v506 + D_xyyyyyyyy* &
      v569 + D_xyyyyyyyz*v570 + D_xyyyyyyz*v571 + D_xyyyyyyzz*v572 + &
      D_xyyyyyz*v573 + D_xyyyyyzz*v574 + D_xyyyyyzzz*v575 + D_xyyyyz* &
      v576 + D_xyyyyzz*v577 + D_xyyyyzzz*v578 + D_xyyyyzzzz*v579 + &
      D_xyyyz*v580 + D_xyyyzz*v581 + D_xyyyzzz*v582 + D_xyyyzzzz*v583 + &
      D_xyyyzzzzz*v584 + D_xyyz*v585 + D_xyyzz*v586 + D_xyyzzz*v587 + &
      D_xyyzzzz*v588 + D_xyyzzzzz*v589 + D_xyyzzzzzz*v590 + D_xyz*M_yz &
      + D_xzz*v591 + D_xzzz*v592 + D_xzzzz*v593 + D_xzzzzz*v594 + &
      D_xzzzzzz*v595 + D_xzzzzzzz*v596 + D_xzzzzzzzz*v597 + M_xyy*v409 &
      + M_xyyy*v410 + M_xyyyy*v411 + M_xyyyyy*v412 + M_xyyyyyy*v413 + &
      M_xyyyyyyy*v414 + M_xyyyyyyz*v415 + M_xyyyyyz*v416 + M_xyyyyyzz* &
      v417 + M_xyyyyz*v418 + M_xyyyyzz*v419 + M_xyyyyzzz*v420 + M_xyyyz &
      *v421 + M_xyyyzz*v422 + M_xyyyzzz*v423 + M_xyyyzzzz*v424 + M_xyyz &
      *v425 + M_xyyzz*v426 + M_xyyzzz*v427 + M_xyyzzzz*v428 + &
      M_xyyzzzzz*v429 + M_xyzz*v375 + M_xyzzz*v376 + M_xyzzzz*v377 + &
      M_xyzzzzz*v378 + M_xyzzzzzz*v379 + M_xzz*v430 + M_xzzz*v431 + &
      M_xzzzz*v432 + M_xzzzzz*v433 + M_xzzzzzz*v434 + M_xzzzzzzz*v435 + &
      M_yzz*v522 + M_yzzz*v523 + M_yzzzz*v524 + M_yzzzzz*v525 + &
      M_yzzzzzz*v526 + M_yzzzzzzz*v527)
    L_xz        = L_xz + (D_xxxxxxxxz*v388 + D_xxxxxxxyz*v389 + D_xxxxxxxz*v279 + D_xxxxxxxzz*v390 &
      + D_xxxxxxyyz*v391 + D_xxxxxxyz*v280 + D_xxxxxxyzz*v392 + &
      D_xxxxxxz*v211 + D_xxxxxxzz*v281 + D_xxxxxxzzz*v393 + D_xxxxxyyyz &
      *v394 + D_xxxxxyyz*v282 + D_xxxxxyyzz*v395 + D_xxxxxyz*v212 + &
      D_xxxxxyzz*v283 + D_xxxxxyzzz*v396 + D_xxxxxz*v173 + D_xxxxxzz* &
      v213 + D_xxxxxzzz*v284 + D_xxxxxzzzz*v397 + D_xxxxyyyyz*v398 + &
      D_xxxxyyyz*v285 + D_xxxxyyyzz*v399 + D_xxxxyyz*v214 + D_xxxxyyzz* &
      v286 + D_xxxxyyzzz*v400 + D_xxxxyz*v174 + D_xxxxyzz*v215 + &
      D_xxxxyzzz*v287 + D_xxxxyzzzz*v401 + D_xxxxz*v152 + D_xxxxzz*v175 &
      + D_xxxxzzz*v216 + D_xxxxzzzz*v288 + D_xxxxzzzzz*v402 + &
      D_xxxyyyyyz*v403 + D_xxxyyyyz*v289 + D_xxxyyyyzz*v404 + D_xxxyyyz &
      *v217 + D_xxxyyyzz*v290 + D_xxxyyyzzz*v405 + D_xxxyyz*v176 + &
      D_xxxyyzz*v218 + D_xxxyyzzz*v291 + D_xxxyyzzzz*v406 + D_xxxyz* &
      v153 + D_xxxyzz*v177 + D_xxxyzzz*v219 + D_xxxyzzzz*v292 + &
      D_xxxyzzzzz*v407 + D_xxxz*v142 + D_xxxzz*v154 + D_xxxzzz*v178 + &
      D_xxxzzzz*v220 + D_xxxzzzzz*v293 + D_xxxzzzzzz*v408 + D_xxyz*M_xy &
      + D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyyyyyz*v506 + D_xyyyyyyz* &
      v482 + D_xyyyyyyzz*v571 + D_xyyyyyz*v466 + D_xyyyyyzz*v573 + &
      D_xyyyyyzzz*v574 + D_xyyyyz*v457 + D_xyyyyzz*v576 + D_xyyyyzzz* &
      v577 + D_xyyyyzzzz*v578 + D_xyyyz*v452 + D_xyyyzz*v580 + &
      D_xyyyzzz*v581 + D_xyyyzzzz*v582 + D_xyyyzzzzz*v583 + D_xyyz*v450 &
      + D_xyyzz*v585 + D_xyyzzz*v586 + D_xyyzzzz*v587 + D_xyyzzzzz*v588 &
      + D_xyyzzzzzz*v589 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v591 + &
      D_xzzzz*v592 + D_xzzzzz*v593 + D_xzzzzzz*v594 + D_xzzzzzzz*v595 + &
      D_xzzzzzzzz*v596 + M_xyy*v425 + M_xyyy*v421 + M_xyyyy*v418 + &
      M_xyyyyy*v416 + M_xyyyyyy*v415 + M_xyyyyyz*v436 + M_xyyyyz*v437 + &
      M_xyyyyzz*v438 + M_xyyyz*v439 + M_xyyyzz*v373 + M_xyyyzzz*v440 + &
      M_xyyz*v351 + M_xyyzz*v441 + M_xyyzzz*v442 + M_xyyzzzz*v443 + &
      M_xyzz*v384 + M_xyzzz*v385 + M_xyzzzz*v386 + M_xyzzzzz*v387 + &
      M_xzz*v444 + M_xzzz*v445 + M_xzzzz*v446 + M_xzzzzz*v447 + &
      M_xzzzzzz*v448 + M_yzz*v536 + M_yzzz*v537 + M_yzzzz*v538 + &
      M_yzzzzz*v539 + M_yzzzzzz*v540)
    D_yyyyyyyyy = v190*(v134 + 4620.0d0*v120 - 18018.0d0*v126 - 12155.0d0*v130 + 25740.0d0 &
      *v131)
    L_yyyyyyyyy = L_yyyyyyyyy + (D_yyyyyyyyy*M_0)
    D_yyyyyyyyz = v138*v449
    L_yyyyyyyyz = L_yyyyyyyyz + (D_yyyyyyyyz*M_0)
    D_yyyyyyyzz = -(D_xxyyyyyyy + D_yyyyyyyyy)
    L_yyyyyyy   = L_yyyyyyy + (D_xxyyyyyyy*v142 + D_xyyyyyyyy*M_xy + D_xyyyyyyyz*M_xz + D_yyyyyyy*M_0 + &
      D_yyyyyyyyy*v450 + D_yyyyyyyyz*M_yz + D_yyyyyyyzz*v591)
    D_yyyyyyzzz = -(D_xxyyyyyyz + D_yyyyyyyyz)
    L_yyyyyy    = L_yyyyyy + (D_xxxyyyyyy*v152 + D_xxyyyyyy*v142 + D_xxyyyyyyy*v153 + D_xxyyyyyyz*v154 &
      + D_xyyyyyyy*M_xy + D_xyyyyyyyy*v598 + D_xyyyyyyyz*M_xyz + &
      D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + D_yyyyyyyy*v450 + D_yyyyyyyyy* &
      v452 + D_yyyyyyyyz*v585 + D_yyyyyyyz*M_yz + D_yyyyyyyzz*v599 + &
      D_yyyyyyzz*v591 + D_yyyyyyzzz*v592 + M_xzz*v451)
    L_yyyyyyz   = L_yyyyyyz + (D_xxyyyyyyz*v142 + D_xyyyyyyyz*M_xy + D_xyyyyyyzz*M_xz + D_yyyyyyyyz* &
      v450 + D_yyyyyyyzz*M_yz + D_yyyyyyz*M_0 + D_yyyyyyzzz*v591)
    D_yyyyyzzzz = -(D_xxyyyyyzz + D_yyyyyyyzz)
    L_yyyyy     = L_yyyyy + (D_xxxxyyyyy*v173 + D_xxxyyyyy*v152 + D_xxxyyyyyy*v174 + D_xxxyyyyyz*v175 &
      + D_xxyyyyy*v142 + D_xxyyyyyy*v153 + D_xxyyyyyyy*v176 + &
      D_xxyyyyyyz*v177 + D_xxyyyyyz*v154 + D_xxyyyyyzz*v178 + D_xyyyyyy &
      *M_xy + D_xyyyyyyy*v598 + D_xyyyyyyyy*v600 + D_xyyyyyyz*M_xyz + &
      D_xyyyyyz*M_xz + D_yyyyy*M_0 + D_yyyyyyy*v450 + D_yyyyyyyy*v452 + &
      D_yyyyyyyyy*v457 + D_yyyyyyyyz*v580 + D_yyyyyyyz*v585 + &
      D_yyyyyyyzz*v586 + D_yyyyyyz*M_yz + D_yyyyyyzz*v599 + D_yyyyyyzzz &
      *v601 + D_yyyyyzz*v591 + D_yyyyyzzz*v592 + D_yyyyyzzzz*v593 + &
      M_xyyz*v453 + M_xyzz*v451 + M_xzz*v454 + M_xzzz*v455)
    L_yyyyyz    = L_yyyyyz + (D_xxxyyyyyz*v152 + D_xxyyyyyyz*v153 + D_xxyyyyyz*v142 + D_xxyyyyyzz*v154 &
      + D_xyyyyyyyz*v598 + D_xyyyyyyz*M_xy + D_xyyyyyyzz*M_xyz + &
      D_xyyyyyzz*M_xz + D_yyyyyyyyz*v452 + D_yyyyyyyz*v450 + &
      D_yyyyyyyzz*v585 + D_yyyyyyzz*M_yz + D_yyyyyyzzz*v599 + D_yyyyyz* &
      M_0 + D_yyyyyzzz*v591 + D_yyyyyzzzz*v592 + M_xzz*v456)
    D_yyyyzzzzz = -(D_xxyyyyzzz + D_yyyyyyzzz)
    L_yyyy      = L_yyyy + (D_xxxxxyyyy*v211 + D_xxxxyyyy*v173 + D_xxxxyyyyy*v212 + D_xxxxyyyyz*v213 &
      + D_xxxyyyy*v152 + D_xxxyyyyy*v174 + D_xxxyyyyyy*v214 + &
      D_xxxyyyyyz*v215 + D_xxxyyyyz*v175 + D_xxxyyyyzz*v216 + D_xxyyyy* &
      v142 + D_xxyyyyy*v153 + D_xxyyyyyy*v176 + D_xxyyyyyyy*v217 + &
      D_xxyyyyyyz*v218 + D_xxyyyyyz*v177 + D_xxyyyyyzz*v219 + D_xxyyyyz &
      *v154 + D_xxyyyyzz*v178 + D_xxyyyyzzz*v220 + D_xyyyyy*M_xy + &
      D_xyyyyyy*v598 + D_xyyyyyyy*v600 + D_xyyyyyyyy*v602 + D_xyyyyyz* &
      M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyy*v450 + D_yyyyyyy* &
      v452 + D_yyyyyyyy*v457 + D_yyyyyyyyy*v466 + D_yyyyyyyyz*v576 + &
      D_yyyyyyyz*v580 + D_yyyyyyyzz*v581 + D_yyyyyyz*v585 + D_yyyyyyzz* &
      v586 + D_yyyyyyzzz*v587 + D_yyyyyz*M_yz + D_yyyyyzz*v599 + &
      D_yyyyyzzz*v601 + D_yyyyyzzzz*v603 + D_yyyyzz*v591 + D_yyyyzzz* &
      v592 + D_yyyyzzzz*v593 + D_yyyyzzzzz*v594 + M_xyyyz*v458 + M_xyyz &
      *v459 + M_xyyzz*v460 + M_xyzz*v454 + M_xyzzz*v455 + M_xzz*v461 + &
      M_xzzz*v462 + M_xzzzz*v463)
    L_yyyyz     = L_yyyyz + (D_xxxxyyyyz*v173 + D_xxxyyyyyz*v174 + D_xxxyyyyz*v152 + D_xxxyyyyzz*v175 &
      + D_xxyyyyyyz*v176 + D_xxyyyyyz*v153 + D_xxyyyyyzz*v177 + &
      D_xxyyyyz*v142 + D_xxyyyyzz*v154 + D_xxyyyyzzz*v178 + D_xyyyyyyyz &
      *v600 + D_xyyyyyyz*v598 + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + &
      D_xyyyyzz*M_xz + D_yyyyyyyyz*v457 + D_yyyyyyyz*v452 + D_yyyyyyyzz &
      *v580 + D_yyyyyyz*v450 + D_yyyyyyzz*v585 + D_yyyyyyzzz*v586 + &
      D_yyyyyzz*M_yz + D_yyyyyzzz*v599 + D_yyyyyzzzz*v601 + D_yyyyz*M_0 &
      + D_yyyyzzz*v591 + D_yyyyzzzz*v592 + D_yyyyzzzzz*v593 + M_xyyz* &
      v451 + M_xyzz*v456 + M_xzz*v464 + M_xzzz*v465)
    D_yyyzzzzzz = -(D_xxyyyzzzz + D_yyyyyzzzz)
    L_yyy       = L_yyy + (D_xxxxxxyyy*v279 + D_xxxxxyyy*v211 + D_xxxxxyyyy*v280 + D_xxxxxyyyz*v281 &
      + D_xxxxyyy*v173 + D_xxxxyyyy*v212 + D_xxxxyyyyy*v282 + &
      D_xxxxyyyyz*v283 + D_xxxxyyyz*v213 + D_xxxxyyyzz*v284 + D_xxxyyy* &
      v152 + D_xxxyyyy*v174 + D_xxxyyyyy*v214 + D_xxxyyyyyy*v285 + &
      D_xxxyyyyyz*v286 + D_xxxyyyyz*v215 + D_xxxyyyyzz*v287 + D_xxxyyyz &
      *v175 + D_xxxyyyzz*v216 + D_xxxyyyzzz*v288 + D_xxyyy*v142 + &
      D_xxyyyy*v153 + D_xxyyyyy*v176 + D_xxyyyyyy*v217 + D_xxyyyyyyy* &
      v289 + D_xxyyyyyyz*v290 + D_xxyyyyyz*v218 + D_xxyyyyyzz*v291 + &
      D_xxyyyyz*v177 + D_xxyyyyzz*v219 + D_xxyyyyzzz*v292 + D_xxyyyz* &
      v154 + D_xxyyyzz*v178 + D_xxyyyzzz*v220 + D_xxyyyzzzz*v293 + &
      D_xyyyy*M_xy + D_xyyyyy*v598 + D_xyyyyyy*v600 + D_xyyyyyyy*v602 + &
      D_xyyyyyyyy*v604 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v450 + D_yyyyyy*v452 + D_yyyyyyy*v457 + D_yyyyyyyy*v466 + &
      D_yyyyyyyyy*v482 + D_yyyyyyyyz*v573 + D_yyyyyyyz*v576 + &
      D_yyyyyyyzz*v577 + D_yyyyyyz*v580 + D_yyyyyyzz*v581 + D_yyyyyyzzz &
      *v582 + D_yyyyyz*v585 + D_yyyyyzz*v586 + D_yyyyyzzz*v587 + &
      D_yyyyyzzzz*v588 + D_yyyyz*M_yz + D_yyyyzz*v599 + D_yyyyzzz*v601 &
      + D_yyyyzzzz*v603 + D_yyyyzzzzz*v605 + D_yyyzz*v591 + D_yyyzzz* &
      v592 + D_yyyzzzz*v593 + D_yyyzzzzz*v594 + D_yyyzzzzzz*v595 + &
      M_xyyyyz*v467 + M_xyyyz*v468 + M_xyyyzz*v469 + M_xyyz*v470 + &
      M_xyyzz*v471 + M_xyyzzz*v472 + M_xyzz*v461 + M_xyzzz*v462 + &
      M_xyzzzz*v463 + M_xzz*v473 + M_xzzz*v474 + M_xzzzz*v475 + &
      M_xzzzzz*v476)
    L_yyyz      = L_yyyz + (D_xxxxxyyyz*v211 + D_xxxxyyyyz*v212 + D_xxxxyyyz*v173 + D_xxxxyyyzz*v213 &
      + D_xxxyyyyyz*v214 + D_xxxyyyyz*v174 + D_xxxyyyyzz*v215 + &
      D_xxxyyyz*v152 + D_xxxyyyzz*v175 + D_xxxyyyzzz*v216 + D_xxyyyyyyz &
      *v217 + D_xxyyyyyz*v176 + D_xxyyyyyzz*v218 + D_xxyyyyz*v153 + &
      D_xxyyyyzz*v177 + D_xxyyyyzzz*v219 + D_xxyyyz*v142 + D_xxyyyzz* &
      v154 + D_xxyyyzzz*v178 + D_xxyyyzzzz*v220 + D_xyyyyyyyz*v602 + &
      D_xyyyyyyz*v600 + D_xyyyyyz*v598 + D_xyyyyz*M_xy + D_xyyyyzz* &
      M_xyz + D_xyyyzz*M_xz + D_yyyyyyyyz*v466 + D_yyyyyyyz*v457 + &
      D_yyyyyyyzz*v576 + D_yyyyyyz*v452 + D_yyyyyyzz*v580 + D_yyyyyyzzz &
      *v581 + D_yyyyyz*v450 + D_yyyyyzz*v585 + D_yyyyyzzz*v586 + &
      D_yyyyyzzzz*v587 + D_yyyyzz*M_yz + D_yyyyzzz*v599 + D_yyyyzzzz* &
      v601 + D_yyyyzzzzz*v603 + D_yyyz*M_0 + D_yyyzzz*v591 + D_yyyzzzz* &
      v592 + D_yyyzzzzz*v593 + D_yyyzzzzzz*v594 + M_xyyyz*v477 + M_xyyz &
      *v454 + M_xyyzz*v478 + M_xyzz*v464 + M_xyzzz*v465 + M_xzz*v479 + &
      M_xzzz*v480 + M_xzzzz*v481)
    D_yyzzzzzzz = -(D_xxyyzzzzz + D_yyyyzzzzz)
    L_yy        = L_yy + (D_xxxxxxxyy*v388 + D_xxxxxxyy*v279 + D_xxxxxxyyy*v389 + D_xxxxxxyyz*v390 &
      + D_xxxxxyy*v211 + D_xxxxxyyy*v280 + D_xxxxxyyyy*v391 + &
      D_xxxxxyyyz*v392 + D_xxxxxyyz*v281 + D_xxxxxyyzz*v393 + D_xxxxyy* &
      v173 + D_xxxxyyy*v212 + D_xxxxyyyy*v282 + D_xxxxyyyyy*v394 + &
      D_xxxxyyyyz*v395 + D_xxxxyyyz*v283 + D_xxxxyyyzz*v396 + D_xxxxyyz &
      *v213 + D_xxxxyyzz*v284 + D_xxxxyyzzz*v397 + D_xxxyy*v152 + &
      D_xxxyyy*v174 + D_xxxyyyy*v214 + D_xxxyyyyy*v285 + D_xxxyyyyyy* &
      v398 + D_xxxyyyyyz*v399 + D_xxxyyyyz*v286 + D_xxxyyyyzz*v400 + &
      D_xxxyyyz*v215 + D_xxxyyyzz*v287 + D_xxxyyyzzz*v401 + D_xxxyyz* &
      v175 + D_xxxyyzz*v216 + D_xxxyyzzz*v288 + D_xxxyyzzzz*v402 + &
      D_xxyy*v142 + D_xxyyy*v153 + D_xxyyyy*v176 + D_xxyyyyy*v217 + &
      D_xxyyyyyy*v289 + D_xxyyyyyyy*v403 + D_xxyyyyyyz*v404 + &
      D_xxyyyyyz*v290 + D_xxyyyyyzz*v405 + D_xxyyyyz*v218 + D_xxyyyyzz* &
      v291 + D_xxyyyyzzz*v406 + D_xxyyyz*v177 + D_xxyyyzz*v219 + &
      D_xxyyyzzz*v292 + D_xxyyyzzzz*v407 + D_xxyyz*v154 + D_xxyyzz*v178 &
      + D_xxyyzzz*v220 + D_xxyyzzzz*v293 + D_xxyyzzzzz*v408 + D_xyyy* &
      M_xy + D_xyyyy*v598 + D_xyyyyy*v600 + D_xyyyyyy*v602 + D_xyyyyyyy &
      *v604 + D_xyyyyyyyy*v606 + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 &
      + D_yyyy*v450 + D_yyyyy*v452 + D_yyyyyy*v457 + D_yyyyyyy*v466 + &
      D_yyyyyyyy*v482 + D_yyyyyyyyy*v506 + D_yyyyyyyyz*v571 + &
      D_yyyyyyyz*v573 + D_yyyyyyyzz*v574 + D_yyyyyyz*v576 + D_yyyyyyzz* &
      v577 + D_yyyyyyzzz*v578 + D_yyyyyz*v580 + D_yyyyyzz*v581 + &
      D_yyyyyzzz*v582 + D_yyyyyzzzz*v583 + D_yyyyz*v585 + D_yyyyzz*v586 &
      + D_yyyyzzz*v587 + D_yyyyzzzz*v588 + D_yyyyzzzzz*v589 + D_yyyz* &
      M_yz + D_yyyzz*v599 + D_yyyzzz*v601 + D_yyyzzzz*v603 + D_yyyzzzzz &
      *v605 + D_yyyzzzzzz*v607 + D_yyzz*v591 + D_yyzzz*v592 + D_yyzzzz* &
      v593 + D_yyzzzzz*v594 + D_yyzzzzzz*v595 + D_yyzzzzzzz*v596 + &
      M_xyyyyyz*v483 + M_xyyyyz*v484 + M_xyyyyzz*v485 + M_xyyyz*v486 + &
      M_xyyyzz*v487 + M_xyyyzzz*v488 + M_xyyz*v489 + M_xyyzz*v490 + &
      M_xyyzzz*v491 + M_xyyzzzz*v492 + M_xyzz*v473 + M_xyzzz*v474 + &
      M_xyzzzz*v475 + M_xyzzzzz*v476 + M_xzz*v493 + M_xzzz*v494 + &
      M_xzzzz*v495 + M_xzzzzz*v496 + M_xzzzzzz*v497)
    L_yyz       = L_yyz + (D_xxxxxxyyz*v279 + D_xxxxxyyyz*v280 + D_xxxxxyyz*v211 + D_xxxxxyyzz*v281 &
      + D_xxxxyyyyz*v282 + D_xxxxyyyz*v212 + D_xxxxyyyzz*v283 + &
      D_xxxxyyz*v173 + D_xxxxyyzz*v213 + D_xxxxyyzzz*v284 + D_xxxyyyyyz &
      *v285 + D_xxxyyyyz*v214 + D_xxxyyyyzz*v286 + D_xxxyyyz*v174 + &
      D_xxxyyyzz*v215 + D_xxxyyyzzz*v287 + D_xxxyyz*v152 + D_xxxyyzz* &
      v175 + D_xxxyyzzz*v216 + D_xxxyyzzzz*v288 + D_xxyyyyyyz*v289 + &
      D_xxyyyyyz*v217 + D_xxyyyyyzz*v290 + D_xxyyyyz*v176 + D_xxyyyyzz* &
      v218 + D_xxyyyyzzz*v291 + D_xxyyyz*v153 + D_xxyyyzz*v177 + &
      D_xxyyyzzz*v219 + D_xxyyyzzzz*v292 + D_xxyyz*v142 + D_xxyyzz*v154 &
      + D_xxyyzzz*v178 + D_xxyyzzzz*v220 + D_xxyyzzzzz*v293 + &
      D_xyyyyyyyz*v604 + D_xyyyyyyz*v602 + D_xyyyyyz*v600 + D_xyyyyz* &
      v598 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyyyz &
      *v482 + D_yyyyyyyz*v466 + D_yyyyyyyzz*v573 + D_yyyyyyz*v457 + &
      D_yyyyyyzz*v576 + D_yyyyyyzzz*v577 + D_yyyyyz*v452 + D_yyyyyzz* &
      v580 + D_yyyyyzzz*v581 + D_yyyyyzzzz*v582 + D_yyyyz*v450 + &
      D_yyyyzz*v585 + D_yyyyzzz*v586 + D_yyyyzzzz*v587 + D_yyyyzzzzz* &
      v588 + D_yyyzz*M_yz + D_yyyzzz*v599 + D_yyyzzzz*v601 + D_yyyzzzzz &
      *v603 + D_yyyzzzzzz*v605 + D_yyz*M_0 + D_yyzzz*v591 + D_yyzzzz* &
      v592 + D_yyzzzzz*v593 + D_yyzzzzzz*v594 + D_yyzzzzzzz*v595 + &
      M_xyyyyz*v498 + M_xyyyz*v499 + M_xyyyzz*v472 + M_xyyz*v461 + &
      M_xyyzz*v500 + M_xyyzzz*v501 + M_xyzz*v479 + M_xyzzz*v480 + &
      M_xyzzzz*v481 + M_xzz*v502 + M_xzzz*v503 + M_xzzzz*v504 + &
      M_xzzzzz*v505)
    D_yzzzzzzzz = -(D_xxyzzzzzz + D_yyyzzzzzz)
    L_y         = L_y + (D_xxxxxxxxy*v541 + D_xxxxxxxy*v388 + D_xxxxxxxyy*v542 + D_xxxxxxxyz*v543 &
      + D_xxxxxxy*v279 + D_xxxxxxyy*v389 + D_xxxxxxyyy*v544 + &
      D_xxxxxxyyz*v545 + D_xxxxxxyz*v390 + D_xxxxxxyzz*v546 + D_xxxxxy* &
      v211 + D_xxxxxyy*v280 + D_xxxxxyyy*v391 + D_xxxxxyyyy*v547 + &
      D_xxxxxyyyz*v548 + D_xxxxxyyz*v392 + D_xxxxxyyzz*v549 + D_xxxxxyz &
      *v281 + D_xxxxxyzz*v393 + D_xxxxxyzzz*v550 + D_xxxxy*v173 + &
      D_xxxxyy*v212 + D_xxxxyyy*v282 + D_xxxxyyyy*v394 + D_xxxxyyyyy* &
      v551 + D_xxxxyyyyz*v552 + D_xxxxyyyz*v395 + D_xxxxyyyzz*v553 + &
      D_xxxxyyz*v283 + D_xxxxyyzz*v396 + D_xxxxyyzzz*v554 + D_xxxxyz* &
      v213 + D_xxxxyzz*v284 + D_xxxxyzzz*v397 + D_xxxxyzzzz*v555 + &
      D_xxxy*v152 + D_xxxyy*v174 + D_xxxyyy*v214 + D_xxxyyyy*v285 + &
      D_xxxyyyyy*v398 + D_xxxyyyyyy*v556 + D_xxxyyyyyz*v557 + &
      D_xxxyyyyz*v399 + D_xxxyyyyzz*v558 + D_xxxyyyz*v286 + D_xxxyyyzz* &
      v400 + D_xxxyyyzzz*v559 + D_xxxyyz*v215 + D_xxxyyzz*v287 + &
      D_xxxyyzzz*v401 + D_xxxyyzzzz*v560 + D_xxxyz*v175 + D_xxxyzz*v216 &
      + D_xxxyzzz*v288 + D_xxxyzzzz*v402 + D_xxxyzzzzz*v561 + D_xxy* &
      v142 + D_xxyy*v153 + D_xxyyy*v176 + D_xxyyyy*v217 + D_xxyyyyy* &
      v289 + D_xxyyyyyy*v403 + D_xxyyyyyyy*v562 + D_xxyyyyyyz*v563 + &
      D_xxyyyyyz*v404 + D_xxyyyyyzz*v564 + D_xxyyyyz*v290 + D_xxyyyyzz* &
      v405 + D_xxyyyyzzz*v565 + D_xxyyyz*v218 + D_xxyyyzz*v291 + &
      D_xxyyyzzz*v406 + D_xxyyyzzzz*v566 + D_xxyyz*v177 + D_xxyyzz*v219 &
      + D_xxyyzzz*v292 + D_xxyyzzzz*v407 + D_xxyyzzzzz*v567 + D_xxyz* &
      v154 + D_xxyzz*v178 + D_xxyzzz*v220 + D_xxyzzzz*v293 + D_xxyzzzzz &
      *v408 + D_xxyzzzzzz*v568 + D_xyy*M_xy + D_xyyy*v598 + D_xyyyy* &
      v600 + D_xyyyyy*v602 + D_xyyyyyy*v604 + D_xyyyyyyy*v606 + &
      D_xyyyyyyyy*v608 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy* &
      v450 + D_yyyy*v452 + D_yyyyy*v457 + D_yyyyyy*v466 + D_yyyyyyy* &
      v482 + D_yyyyyyyy*v506 + D_yyyyyyyyy*v569 + D_yyyyyyyyz*v570 + &
      D_yyyyyyyz*v571 + D_yyyyyyyzz*v572 + D_yyyyyyz*v573 + D_yyyyyyzz* &
      v574 + D_yyyyyyzzz*v575 + D_yyyyyz*v576 + D_yyyyyzz*v577 + &
      D_yyyyyzzz*v578 + D_yyyyyzzzz*v579 + D_yyyyz*v580 + D_yyyyzz*v581 &
      + D_yyyyzzz*v582 + D_yyyyzzzz*v583 + D_yyyyzzzzz*v584 + D_yyyz* &
      v585 + D_yyyzz*v586 + D_yyyzzz*v587 + D_yyyzzzz*v588 + D_yyyzzzzz &
      *v589 + D_yyyzzzzzz*v590 + D_yyz*M_yz + D_yyzz*v599 + D_yyzzz* &
      v601 + D_yyzzzz*v603 + D_yyzzzzz*v605 + D_yyzzzzzz*v607 + &
      D_yyzzzzzzz*v609 + D_yzz*v591 + D_yzzz*v592 + D_yzzzz*v593 + &
      D_yzzzzz*v594 + D_yzzzzzz*v595 + D_yzzzzzzz*v596 + D_yzzzzzzzz* &
      v597 + M_xyyyyyyz*v507 + M_xyyyyyz*v508 + M_xyyyyyzz*v509 + &
      M_xyyyyz*v510 + M_xyyyyzz*v511 + M_xyyyyzzz*v512 + M_xyyyz*v513 + &
      M_xyyyzz*v514 + M_xyyyzzz*v515 + M_xyyyzzzz*v516 + M_xyyz*v517 + &
      M_xyyzz*v518 + M_xyyzzz*v519 + M_xyyzzzz*v520 + M_xyyzzzzz*v521 + &
      M_xyzz*v493 + M_xyzzz*v494 + M_xyzzzz*v495 + M_xyzzzzz*v496 + &
      M_xyzzzzzz*v497 + M_xzz*v522 + M_xzzz*v523 + M_xzzzz*v524 + &
      M_xzzzzz*v525 + M_xzzzzzz*v526 + M_xzzzzzzz*v527)
    L_yz        = L_yz + (D_xxxxxxxyz*v388 + D_xxxxxxyyz*v389 + D_xxxxxxyz*v279 + D_xxxxxxyzz*v390 &
      + D_xxxxxyyyz*v391 + D_xxxxxyyz*v280 + D_xxxxxyyzz*v392 + &
      D_xxxxxyz*v211 + D_xxxxxyzz*v281 + D_xxxxxyzzz*v393 + D_xxxxyyyyz &
      *v394 + D_xxxxyyyz*v282 + D_xxxxyyyzz*v395 + D_xxxxyyz*v212 + &
      D_xxxxyyzz*v283 + D_xxxxyyzzz*v396 + D_xxxxyz*v173 + D_xxxxyzz* &
      v213 + D_xxxxyzzz*v284 + D_xxxxyzzzz*v397 + D_xxxyyyyyz*v398 + &
      D_xxxyyyyz*v285 + D_xxxyyyyzz*v399 + D_xxxyyyz*v214 + D_xxxyyyzz* &
      v286 + D_xxxyyyzzz*v400 + D_xxxyyz*v174 + D_xxxyyzz*v215 + &
      D_xxxyyzzz*v287 + D_xxxyyzzzz*v401 + D_xxxyz*v152 + D_xxxyzz*v175 &
      + D_xxxyzzz*v216 + D_xxxyzzzz*v288 + D_xxxyzzzzz*v402 + &
      D_xxyyyyyyz*v403 + D_xxyyyyyz*v289 + D_xxyyyyyzz*v404 + D_xxyyyyz &
      *v217 + D_xxyyyyzz*v290 + D_xxyyyyzzz*v405 + D_xxyyyz*v176 + &
      D_xxyyyzz*v218 + D_xxyyyzzz*v291 + D_xxyyyzzzz*v406 + D_xxyyz* &
      v153 + D_xxyyzz*v177 + D_xxyyzzz*v219 + D_xxyyzzzz*v292 + &
      D_xxyyzzzzz*v407 + D_xxyz*v142 + D_xxyzz*v154 + D_xxyzzz*v178 + &
      D_xxyzzzz*v220 + D_xxyzzzzz*v293 + D_xxyzzzzzz*v408 + D_xyyyyyyyz &
      *v606 + D_xyyyyyyz*v604 + D_xyyyyyz*v602 + D_xyyyyz*v600 + &
      D_xyyyz*v598 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + &
      D_yyyyyyyyz*v506 + D_yyyyyyyz*v482 + D_yyyyyyyzz*v571 + D_yyyyyyz &
      *v466 + D_yyyyyyzz*v573 + D_yyyyyyzzz*v574 + D_yyyyyz*v457 + &
      D_yyyyyzz*v576 + D_yyyyyzzz*v577 + D_yyyyyzzzz*v578 + D_yyyyz* &
      v452 + D_yyyyzz*v580 + D_yyyyzzz*v581 + D_yyyyzzzz*v582 + &
      D_yyyyzzzzz*v583 + D_yyyz*v450 + D_yyyzz*v585 + D_yyyzzz*v586 + &
      D_yyyzzzz*v587 + D_yyyzzzzz*v588 + D_yyyzzzzzz*v589 + D_yyzz*M_yz &
      + D_yyzzz*v599 + D_yyzzzz*v601 + D_yyzzzzz*v603 + D_yyzzzzzz*v605 &
      + D_yyzzzzzzz*v607 + D_yz*M_0 + D_yzzz*v591 + D_yzzzz*v592 + &
      D_yzzzzz*v593 + D_yzzzzzz*v594 + D_yzzzzzzz*v595 + D_yzzzzzzzz* &
      v596 + M_xyyyyyz*v528 + M_xyyyyz*v529 + M_xyyyyzz*v530 + M_xyyyz* &
      v531 + M_xyyyzz*v491 + M_xyyyzzz*v532 + M_xyyz*v473 + M_xyyzz* &
      v533 + M_xyyzzz*v534 + M_xyyzzzz*v535 + M_xyzz*v502 + M_xyzzz* &
      v503 + M_xyzzzz*v504 + M_xyzzzzz*v505 + M_xzz*v536 + M_xzzz*v537 &
      + M_xzzzz*v538 + M_xzzzzz*v539 + M_xzzzzzz*v540)
    D_zzzzzzzzz = -(D_xxzzzzzzz + D_yyzzzzzzz)
    L_z         = L_z + (0.000198412698412698d0*(140.0d0*D_xyyyzzzz*M_xyyyzzz + 35.0d0* &
      D_xyyyzzzzz*M_xyyyzzzz + 1260.0d0*D_xyyzzz*M_xyyzz + 420.0d0* &
      D_xyyzzzz*M_xyyzzz + 2520.0d0*D_xzzz*M_xzz + D_xzzzzzzzz* &
      M_xzzzzzzz + 7.0d0*(D_xyyyyyyzz*M_xyyyyyyz + D_xzzzzzzz*M_xzzzzzz &
      ) + 42.0d0*(D_xyyyyyzz*M_xyyyyyz + D_xzzzzzz*M_xzzzzz) + 21.0d0*( &
      D_xyyyyyzzz*M_xyyyyyzz + D_xyyzzzzzz*M_xyyzzzzz) + 210.0d0*( &
      D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + 105.0d0*(D_xyyyyzzz* &
      M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz) + 840.0d0*(D_xyyyzz*M_xyyyz + &
      D_xzzzz*M_xzzz)) + D_xxxxxxxxz*v541 + D_xxxxxxxyz*v542 + &
      D_xxxxxxxz*v388 + D_xxxxxxxzz*v543 + D_xxxxxxyyz*v544 + &
      D_xxxxxxyz*v389 + D_xxxxxxyzz*v545 + D_xxxxxxz*v279 + D_xxxxxxzz* &
      v390 + D_xxxxxxzzz*v546 + D_xxxxxyyyz*v547 + D_xxxxxyyz*v391 + &
      D_xxxxxyyzz*v548 + D_xxxxxyz*v280 + D_xxxxxyzz*v392 + D_xxxxxyzzz &
      *v549 + D_xxxxxz*v211 + D_xxxxxzz*v281 + D_xxxxxzzz*v393 + &
      D_xxxxxzzzz*v550 + D_xxxxyyyyz*v551 + D_xxxxyyyz*v394 + &
      D_xxxxyyyzz*v552 + D_xxxxyyz*v282 + D_xxxxyyzz*v395 + D_xxxxyyzzz &
      *v553 + D_xxxxyz*v212 + D_xxxxyzz*v283 + D_xxxxyzzz*v396 + &
      D_xxxxyzzzz*v554 + D_xxxxz*v173 + D_xxxxzz*v213 + D_xxxxzzz*v284 &
      + D_xxxxzzzz*v397 + D_xxxxzzzzz*v555 + D_xxxyyyyyz*v556 + &
      D_xxxyyyyz*v398 + D_xxxyyyyzz*v557 + D_xxxyyyz*v285 + D_xxxyyyzz* &
      v399 + D_xxxyyyzzz*v558 + D_xxxyyz*v214 + D_xxxyyzz*v286 + &
      D_xxxyyzzz*v400 + D_xxxyyzzzz*v559 + D_xxxyz*v174 + D_xxxyzz*v215 &
      + D_xxxyzzz*v287 + D_xxxyzzzz*v401 + D_xxxyzzzzz*v560 + D_xxxz* &
      v152 + D_xxxzz*v175 + D_xxxzzz*v216 + D_xxxzzzz*v288 + D_xxxzzzzz &
      *v402 + D_xxxzzzzzz*v561 + D_xxyyyyyyz*v562 + D_xxyyyyyz*v403 + &
      D_xxyyyyyzz*v563 + D_xxyyyyz*v289 + D_xxyyyyzz*v404 + D_xxyyyyzzz &
      *v564 + D_xxyyyz*v217 + D_xxyyyzz*v290 + D_xxyyyzzz*v405 + &
      D_xxyyyzzzz*v565 + D_xxyyz*v176 + D_xxyyzz*v218 + D_xxyyzzz*v291 &
      + D_xxyyzzzz*v406 + D_xxyyzzzzz*v566 + D_xxyz*v153 + D_xxyzz*v177 &
      + D_xxyzzz*v219 + D_xxyzzzz*v292 + D_xxyzzzzz*v407 + D_xxyzzzzzz* &
      v567 + D_xxz*v142 + D_xxzz*v154 + D_xxzzz*v178 + D_xxzzzz*v220 + &
      D_xxzzzzz*v293 + D_xxzzzzzz*v408 + D_xxzzzzzzz*v568 + D_xyyyyyyyz &
      *v608 + D_xyyyyyyz*v606 + D_xyyyyyz*v604 + D_xyyyyz*v602 + &
      D_xyyyz*v600 + D_xyyz*v598 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yyyyyyyyz*v569 + D_yyyyyyyz*v506 + D_yyyyyyyzz*v570 + &
      D_yyyyyyz*v482 + D_yyyyyyzz*v571 + D_yyyyyyzzz*v572 + D_yyyyyz* &
      v466 + D_yyyyyzz*v573 + D_yyyyyzzz*v574 + D_yyyyyzzzz*v575 + &
      D_yyyyz*v457 + D_yyyyzz*v576 + D_yyyyzzz*v577 + D_yyyyzzzz*v578 + &
      D_yyyyzzzzz*v579 + D_yyyz*v452 + D_yyyzz*v580 + D_yyyzzz*v581 + &
      D_yyyzzzz*v582 + D_yyyzzzzz*v583 + D_yyyzzzzzz*v584 + D_yyz*v450 &
      + D_yyzz*v585 + D_yyzzz*v586 + D_yyzzzz*v587 + D_yyzzzzz*v588 + &
      D_yyzzzzzz*v589 + D_yyzzzzzzz*v590 + D_yzz*M_yz + D_yzzz*v599 + &
      D_yzzzz*v601 + D_yzzzzz*v603 + D_yzzzzzz*v605 + D_yzzzzzzz*v607 + &
      D_yzzzzzzzz*v609 + D_z*M_0 + D_zzz*v591 + D_zzzz*v592 + D_zzzzz* &
      v593 + D_zzzzzz*v594 + D_zzzzzzz*v595 + D_zzzzzzzz*v596 + &
      D_zzzzzzzzz*v597 + M_xyyyyzzz*v516 + M_xyyyzz*v519 + M_xyyz*v493 &
      + M_xyzz*v536 + M_xyzzz*v537 + M_xyzzzz*v538 + M_xyzzzzz*v539 + &
      M_xyzzzzzz*v540)
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
#undef  M_xxx               
#undef  L_yy                
#undef  L_yz                
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xxx               
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
#undef  M_xxxyyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  L_xxxyyz            
#undef  M_xxyyyz            
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
#undef  M_xxxxxxxx          
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  L_xxxxxxxx          
#undef  M_xxxxxxyy          
#undef  L_xxxxxxxy          
#undef  M_xxxxxxyz          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  M_xxxxxyyy          
#undef  L_xxxxxxyz          
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxxxyyyz          
#undef  L_xxxxyyyy          
#undef  M_xxxyyyyy          
#undef  L_xxxxyyyz          
#undef  M_xxxyyyyz          
#undef  M_xxyyyyyy          
#undef  L_xxxyyyyy          
#undef  M_xxyyyyyz          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
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
    end subroutine mom_es_M2L_add
    
! OPS  1246*ADD + 2*DIV + 1443*MUL + 120*NEG + POW = 2812  (10556 before optimization)
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
                v552, v553, v554, v555, v556, v56, v57, v58, v59, v6, v60,&
                v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71,&
                v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82,&
                v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93,&
                v94, v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
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
                L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz,&
                L_xxxxxxzzz, L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz,&
                L_xxxxyyyzz, L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz,&
                L_xxxyyyyzz, L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz,&
                L_xxxzzzzzz, L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz,&
                L_xxyyzzzzz, L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz,&
                L_xyyyyyzzz, L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz,&
                L_xyzzzzzzz, L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz,&
                L_yyyyyzzzz, L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz,&
                L_yzzzzzzzz, L_zzzzzzzzz
#define y                    r(2)
#define L_x                  L(0)
#define x                    r(1)
#define z                    r(3)
#define Ls_x                 Ls(0)
#define Ls_y                 Ls(1)
#define L_y                  L(1)
#define L_z                  L(2)
#define Ls_z                 Ls(2)
#define L_xx                 L(3)
#define Ls_xx                Ls(3)
#define L_xy                 L(4)
#define Ls_xy                Ls(4)
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
#define Ls_xxyyy             Ls(29)
#define L_xxyyy              L(29)
#define Ls_xxyyz             Ls(30)
#define L_xxyyz              L(30)
#define L_xyyyy              L(31)
#define Ls_xyyyy             Ls(31)
#define Ls_xyyyz             Ls(32)
#define L_xyyyz              L(32)
#define L_yyyyy              L(33)
#define Ls_yyyyy             Ls(33)
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
#define L_xxxxyz             L(39)
#define Ls_xxxxyz            Ls(39)
#define L_xxxyyy             L(40)
#define Ls_xxxyyy            Ls(40)
#define Ls_xxxyyz            Ls(41)
#define L_xxxyyz             L(41)
#define Ls_xxyyyy            Ls(42)
#define L_xxyyyy             L(42)
#define Ls_xxyyyz            Ls(43)
#define L_xxyyyz             L(43)
#define L_xyyyyy             L(44)
#define Ls_xyyyyy            Ls(44)
#define Ls_xyyyyz            Ls(45)
#define L_xyyyyz             L(45)
#define L_yyyyyy             L(46)
#define Ls_yyyyyy            Ls(46)
#define Ls_yyyyyz            Ls(47)
#define L_yyyyyz             L(47)
#define L_xxxxxxx            L(48)
#define Ls_xxxxxxx           Ls(48)
#define Ls_xxxxxxy           Ls(49)
#define L_xxxxxxy            L(49)
#define Ls_xxxxxxz           Ls(50)
#define L_xxxxxxz            L(50)
#define Ls_xxxxxyy           Ls(51)
#define L_xxxxxyy            L(51)
#define L_xxxxxyz            L(52)
#define Ls_xxxxxyz           Ls(52)
#define Ls_xxxxyyy           Ls(53)
#define L_xxxxyyy            L(53)
#define Ls_xxxxyyz           Ls(54)
#define L_xxxxyyz            L(54)
#define Ls_xxxyyyy           Ls(55)
#define L_xxxyyyy            L(55)
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
#define L_yyyyyyz            L(62)
#define Ls_yyyyyyz           Ls(62)
#define Ls_xxxxxxxx          Ls(63)
#define L_xxxxxxxx           L(63)
#define L_xxxxxxxy           L(64)
#define Ls_xxxxxxxy          Ls(64)
#define L_xxxxxxxz           L(65)
#define Ls_xxxxxxxz          Ls(65)
#define L_xxxxxxyy           L(66)
#define Ls_xxxxxxyy          Ls(66)
#define Ls_xxxxxxyz          Ls(67)
#define L_xxxxxxyz           L(67)
#define Ls_xxxxxyyy          Ls(68)
#define L_xxxxxyyy           L(68)
#define L_xxxxxyyz           L(69)
#define Ls_xxxxxyyz          Ls(69)
#define L_xxxxyyyy           L(70)
#define Ls_xxxxyyyy          Ls(70)
#define L_xxxxyyyz           L(71)
#define Ls_xxxxyyyz          Ls(71)
#define L_xxxyyyyy           L(72)
#define Ls_xxxyyyyy          Ls(72)
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
#define Ls_xxxxxxxxx         Ls(80)
#define L_xxxxxxxxx          L(80)
#define Ls_xxxxxxxxy         Ls(81)
#define L_xxxxxxxxy          L(81)
#define Ls_xxxxxxxxz         Ls(82)
#define L_xxxxxxxxz          L(82)
#define L_xxxxxxxyy          L(83)
#define Ls_xxxxxxxyy         Ls(83)
#define Ls_xxxxxxxyz         Ls(84)
#define L_xxxxxxxyz          L(84)
#define L_xxxxxxyyy          L(85)
#define Ls_xxxxxxyyy         Ls(85)
#define Ls_xxxxxxyyz         Ls(86)
#define L_xxxxxxyyz          L(86)
#define Ls_xxxxxyyyy         Ls(87)
#define L_xxxxxyyyy          L(87)
#define L_xxxxxyyyz          L(88)
#define Ls_xxxxxyyyz         Ls(88)
#define Ls_xxxxyyyyy         Ls(89)
#define L_xxxxyyyyy          L(89)
#define L_xxxxyyyyz          L(90)
#define Ls_xxxxyyyyz         Ls(90)
#define L_xxxyyyyyy          L(91)
#define Ls_xxxyyyyyy         Ls(91)
#define L_xxxyyyyyz          L(92)
#define Ls_xxxyyyyyz         Ls(92)
#define L_xxyyyyyyy          L(93)
#define Ls_xxyyyyyyy         Ls(93)
#define L_xxyyyyyyz          L(94)
#define Ls_xxyyyyyyz         Ls(94)
#define Ls_xyyyyyyyy         Ls(95)
#define L_xyyyyyyyy          L(95)
#define Ls_xyyyyyyyz         Ls(96)
#define L_xyyyyyyyz          L(96)
#define Ls_yyyyyyyyy         Ls(97)
#define L_yyyyyyyyy          L(97)
#define L_yyyyyyyyz          L(98)
#define Ls_yyyyyyyyz         Ls(98)
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
    v337         = 0.00138888888888889d0*x
    v353         = L_xyyyyyyz*z
    v356         = v13*y
    v359         = L_xyyyyyz*z
    v370         = L_xyyyyz*z
    v386         = L_xyyyz*z
    v406         = L_xyyz*z
    v430         = L_xyz*z
    v474         = 0.000198412698412698d0*y
    v480         = 0.000198412698412698d0*x
    v492         = L_yyyyyyyz*z
    v495         = L_yyyyyyz*z
    v497         = 0.5d0*y
    v501         = L_yyyyyz*z
    v504         = 0.166666666666667d0*y
    v510         = L_yyyyz*z
    v514         = 0.0416666666666667d0*y
    v521         = L_yyyz*z
    v526         = 0.00833333333333333d0*y
    v534         = L_yyz*z
    v540         = 0.00138888888888889d0*y
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
    v482         = L_xzz*z
    L_yzz        = -(L_xxy + L_yyy)
    v554         = L_yzz*z
    L_zzz        = -(L_xxz + L_yyz)
    L_xxzz       = -(L_xxxx + L_xxyy)
    v340         = L_xxzz*z
    L_xyzz       = -(L_xxxy + L_xyyy)
    v445         = L_xyzz*z
    L_xzzz       = -(L_xxxz + L_xyyz)
    L_yyzz       = -(L_xxyy + L_yyyy)
    v546         = L_yyzz*z
    L_yzzz       = -(L_xxyz + L_yyyz)
    L_zzzz       = -(L_xxzz + L_yyzz)
    L_xxxzz      = -(L_xxxxx + L_xxxyy)
    v227         = L_xxxzz*z
    L_xxyzz      = -(L_xxxxy + L_xxyyy)
    v304         = L_xxyzz*z
    L_xxzzz      = -(L_xxxxz + L_xxyyz)
    L_xyyzz      = -(L_xxxyy + L_xyyyy)
    v419         = L_xyyzz*z
    L_xyzzz      = -(L_xxxyz + L_xyyyz)
    L_xzzzz      = -(L_xxxzz + L_xyyzz)
    L_yyyzz      = -(L_xxyyy + L_yyyyy)
    v531         = L_yyyzz*z
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
    v397         = L_xyyyzz*z
    L_xyyzzz     = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz     = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz     = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz     = -(L_xxyyyy + L_yyyyyy)
    v518         = L_yyyyzz*z
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
    v379         = L_xyyyyzz*z
    L_xyyyzzz    = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz    = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz    = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz    = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz    = -(L_xxyyyyy + L_yyyyyyy)
    v507         = L_yyyyyzz*z
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
    v366         = L_xyyyyyzz*z
    L_xyyyyzzz   = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz   = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz   = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz   = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz   = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz   = -(L_xxyyyyyy + L_yyyyyyyy)
    v499         = L_yyyyyyzz*z
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
    v357         = L_xyyyyyyz + L_xyyyyyyzz*z
    v358         = L_xyyyyyyyz*y + v357
    v369         = v357*y
    Ls_xyyyyyyz  = Ls_xyyyyyyz + (L_xxyyyyyyz*x + v358)
    L_xyyyyyzzz  = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz  = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz  = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz  = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz  = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz  = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz  = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v494         = L_yyyyyyyz + L_yyyyyyyzz*z
    Ls_yyyyyyyz  = Ls_yyyyyyyz + (v494 + L_xyyyyyyyz*x + L_yyyyyyyyz*y)
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
    v336         = 0.00416666666666667d0*v17
    v479         = 0.000694444444444444d0*v17
    a3           = a1*a2
    v32          = a3
    v33          = 0.166666666666667d0*v32
    v137         = 0.0833333333333333d0*v32
    v222         = 0.0277777777777778d0*v32
    v335         = 0.00694444444444444d0*v32
    v478         = 0.00138888888888889d0*v32
    a4           = a2*a2
    v66          = a4
    v67          = 0.0416666666666667d0*v66
    v219         = 0.0208333333333333d0*v66
    v334         = 0.00694444444444444d0*v66
    v477         = 0.00173611111111111d0*v66
    a5           = a2*a3
    v123         = a5
    v124         = 0.00833333333333333d0*v123
    v330         = 0.00416666666666667d0*v123
    v476         = 0.00138888888888889d0*v123
    a6           = a3*a3
    v205         = a6
    v206         = 0.00138888888888889d0*v205
    v471         = 0.000694444444444444d0*v205
    a7           = a3*a4
    v316         = 0.000198412698412698d0*a7
    a8           = a4*a4
    v458         = 2.48015873015873d-5*a8
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
    v354         = L_xyyyyyyyy*v19
    v367         = L_xyyyyyyyz*v19
    v473         = 0.000694444444444444d0*v19
    v503         = 0.25d0*v19
    v513         = 0.0833333333333333d0*v19
    v525         = 0.0208333333333333d0*v19
    v539         = 0.00416666666666667d0*v19
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
    v360         = L_xyyyyyyyy*v34
    v380         = L_xyyyyyyyz*v34
    v472         = 0.00138888888888889d0*v34
    v512         = 0.0833333333333333d0*v34
    v524         = 0.0277777777777778d0*v34
    v538         = 0.00694444444444444d0*v34
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
    v371         = L_xyyyyyyyy*v68
    v398         = L_xyyyyyyyz*v68
    v470         = 0.00173611111111111d0*v68
    v523         = 0.0208333333333333d0*v68
    v537         = 0.00694444444444444d0*v68
    b5           = b2*b3
    v125         = b5
    v126         = L_xxxxyyyyy*v125
    v185         = L_xxxyyyyyy*v125
    v215         = 0.00833333333333333d0*v125
    v228         = L_xxxyyyyyz*v125
    v272         = L_xxyyyyyyy*v125
    v305         = L_xxyyyyyyz*v125
    v338         = 6.0d0*v125
    v387         = L_xyyyyyyyy*v125
    v420         = L_xyyyyyyyz*v125
    v469         = 0.00138888888888889d0*v125
    v536         = 0.00416666666666667d0*v125
    b6           = b3*b3
    v207         = b6
    v208         = L_xxxyyyyyy*v207
    v292         = L_xxyyyyyyy*v207
    v326         = 0.00138888888888889d0*v207
    v341         = L_xxyyyyyyz*v207
    v407         = L_xyyyyyyyy*v207
    v446         = L_xyyyyyyyz*v207
    v468         = 0.000694444444444444d0*v207
    v481         = 7.0d0*v207
    b7           = b3*b4
    v317         = b7
    v318         = L_xxyyyyyyy*v317
    v431         = L_xyyyyyyyy*v317
    v467         = 0.000198412698412698d0*v317
    v483         = L_xyyyyyyyz*v317
    b8           = b4*b4
    v459         = 2.48015873015873d-5*b8
    b9           = b4*b5
    c2           = c1*c1
    v21          = c2
    v460         = 0.5d0*v21
    v505         = 3.0d0*v21
    v515         = 12.0d0*v21
    v527         = 60.0d0*v21
    v541         = 360.0d0*v21
    v549         = 2520.0d0*v21
    v319         = L_xxzz*v21
    v432         = L_xyzz*v21
    v209         = L_xxxzz*v21
    v293         = L_xxyzz*v21
    v342         = L_xxzzz*v21
    v408         = L_xyyzz*v21
    v447         = L_xyzzz*v21
    v127         = L_xxxxzz*v21
    v186         = L_xxxyzz*v21
    v229         = L_xxxzzz*v21
    v273         = L_xxyyzz*v21
    v306         = L_xxyzzz*v21
    v388         = L_xyyyzz*v21
    v421         = L_xyyzzz*v21
    v70          = L_xxxxxzz*v21
    v108         = L_xxxxyzz*v21
    v144         = L_xxxxzzz*v21
    v170         = L_xxxyyzz*v21
    v197         = L_xxxyzzz*v21
    v257         = L_xxyyyzz*v21
    v284         = L_xxyyzzz*v21
    v372         = L_xyyyyzz*v21
    v399         = L_xyyyzzz*v21
    v36          = L_xxxxxxzz*v21
    v56          = L_xxxxxyzz*v21
    v84          = L_xxxxxzzz*v21
    v97          = L_xxxxyyzz*v21
    v117         = L_xxxxyzzz*v21
    v159         = L_xxxyyyzz*v21
    v179         = L_xxxyyzzz*v21
    v246         = L_xxyyyyzz*v21
    v266         = L_xxyyyzzz*v21
    v361         = L_xyyyyyzz*v21
    v381         = L_xyyyyzzz*v21
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
    v327         = v125*v248
    v365         = 2.0d0*v241 + v239 + v248
    Ls_xxyyyyy   = Ls_xxyyyyy + (0.5d0*(v239 + v240) + L_xxxxyyyyy*v18 + L_xxyyyyy + v10*x + v238 + v241)
    v253         = L_xxyyyyzzz*v21
    v268         = v253 + 2.0d0*(L_xxyyyyz + v251)
    v269         = v268*y
    v287         = v19*v268
    v310         = v268*v34
    v347         = v268*v68
    v385         = 2.0d0*v254 + v252 + v268
    Ls_xxyyyyz   = Ls_xxyyyyz + (0.5d0*(v252 + v253) + L_xxxxyyyyz*v18 + L_xxyyyyz + v156*x + v251 + v254)
    v355         = L_xyyyyyyzz*v21
    v363         = v355 + 2.0d0*(L_xyyyyyy + v353)
    v364         = v363*y
    v375         = v19*v363
    v392         = v34*v363
    v413         = v363*v68
    v438         = v125*v363
    Ls_xyyyyyy   = Ls_xyyyyyy + (0.5d0*(v354 + v355) + L_xxxyyyyyy*v18 + L_xyyyyyy + v12*x + v353 + v356)
    v368         = L_xyyyyyzzz*v21
    v383         = v368 + 2.0d0*(L_xyyyyyz + v366)
    v384         = v383*y
    v402         = v19*v383
    v425         = v34*v383
    v452         = v383*v68
    v485         = v125*v383
    Ls_xyyyyyz   = Ls_xyyyyyz + (0.5d0*(v367 + v368) + L_xxxyyyyyz*v18 + L_xyyyyyz + v243*x + v366 + v369)
    v493         = L_yyyyyyyzz*v21
    v498         = v493 + 2.0d0*(L_yyyyyyy + v492)
    Ls_yyyyyyy   = Ls_yyyyyyy + (0.5d0*v493 + L_xxyyyyyyy*v18 + L_yyyyyyy + L_yyyyyyyyy*v39 + v14*x + v15 &
      *y + v492)
    v500         = L_yyyyyyzzz*v21
    v509         = v500 + 2.0d0*(L_yyyyyyz + v499)
    Ls_yyyyyyz   = Ls_yyyyyyz + (0.5d0*v500 + L_xxyyyyyyz*v18 + L_yyyyyyyyz*v39 + L_yyyyyyz + v358*x + &
      v494*y + v499)
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
    v461         = 0.166666666666667d0*v37
    v516         = 4.0d0*v37
    v528         = 20.0d0*v37
    v542         = 120.0d0*v37
    v550         = 840.0d0*v37
    v320         = L_xxzzz*v37
    v433         = L_xyzzz*v37
    v210         = L_xxxzzz*v37
    v294         = L_xxyzzz*v37
    v343         = L_xxzzzz*v37
    v409         = L_xyyzzz*v37
    v448         = L_xyzzzz*v37
    v128         = L_xxxxzzz*v37
    v187         = L_xxxyzzz*v37
    v230         = L_xxxzzzz*v37
    v274         = L_xxyyzzz*v37
    v307         = L_xxyzzzz*v37
    v389         = L_xyyyzzz*v37
    v422         = L_xyyzzzz*v37
    v71          = L_xxxxxzzz*v37
    v109         = L_xxxxyzzz*v37
    v145         = L_xxxxzzzz*v37
    v171         = L_xxxyyzzz*v37
    v198         = L_xxxyzzzz*v37
    v258         = L_xxyyyzzz*v37
    v285         = L_xxyyzzzz*v37
    v373         = L_xyyyyzzz*v37
    v400         = L_xyyyzzzz*v37
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
    v328         = v261*v68
    v378         = v245 + v261 + v11*v80 + 3.0d0*v249
    Ls_xxyyyy    = Ls_xxyyyy + (0.166666666666667d0*(v245 + v247 + 3.0d0*(v246 + v249)) + L_xxxxxyyyy* &
      v33 + L_xxyyyy + v11*v39 + v18*v8 + v244 + v250*v42)
    v267         = L_xxyyyzzzz*v37
    v288         = v267 + 3.0d0*(2.0d0*L_xxyyyz + 2.0d0*v264 + v266)
    v289         = v288*y
    v311         = v19*v288
    v348         = v288*v34
    v405         = v265 + v288 + v242*v80 + 3.0d0*v269
    Ls_xxyyyz    = Ls_xxyyyz + (0.166666666666667d0*(v265 + v267 + 3.0d0*(v266 + v269)) + L_xxxxxyyyz* &
      v33 + L_xxyyyz + v18*v94 + v242*v39 + v264 + v270*v42)
    v362         = L_xyyyyyzzz*v37
    v376         = v362 + 3.0d0*(2.0d0*L_xyyyyy + 2.0d0*v359 + v361)
    v377         = v376*y
    v393         = v19*v376
    v414         = v34*v376
    v439         = v376*v68
    Ls_xyyyyy    = Ls_xyyyyy + (0.166666666666667d0*(v360 + v362 + 3.0d0*(v361 + v364)) + L_xxxxyyyyy* &
      v33 + L_xyyyyy + v10*v18 + v13*v39 + v359 + v365*v42)
    v382         = L_xyyyyzzzz*v37
    v403         = v382 + 3.0d0*(2.0d0*L_xyyyyz + 2.0d0*v379 + v381)
    v404         = v403*y
    v426         = v19*v403
    v453         = v34*v403
    v486         = v403*v68
    Ls_xyyyyz    = Ls_xyyyyz + (0.166666666666667d0*(v380 + v382 + 3.0d0*(v381 + v384)) + L_xxxxyyyyz* &
      v33 + L_xyyyyz + v156*v18 + v357*v39 + v379 + v385*v42)
    v496         = L_yyyyyyzzz*v37
    v506         = v496 + L_yyyyyyzz*v505 + 6.0d0*(L_yyyyyy + v495)
    Ls_yyyyyy    = Ls_yyyyyy + (0.166666666666667d0*v496 + L_xxxyyyyyy*v33 + L_yyyyyy + L_yyyyyyyyy*v74 &
      + L_yyyyyyzz*v460 + v12*v18 + v15*v39 + v42*(v354 + 2.0d0*v356 + &
      v363) + v495 + v497*v498)
    v508         = L_yyyyyzzzz*v37
    v520         = v508 + L_yyyyyzzz*v505 + 6.0d0*(L_yyyyyz + v507)
    Ls_yyyyyz    = Ls_yyyyyz + (0.166666666666667d0*v508 + L_xxxyyyyyz*v33 + L_yyyyyyyyz*v74 + L_yyyyyz &
      + L_yyyyyzzz*v460 + v18*v243 + v39*v494 + v42*(v367 + 2.0d0*v369 &
      + v383) + v497*v509 + v507)
    c4           = c2*c2
    v72          = c4
    v462         = 0.0416666666666667d0*v72
    v529         = 5.0d0*v72
    v543         = 30.0d0*v72
    v551         = 210.0d0*v72
    v321         = L_xxzzzz*v72
    v434         = L_xyzzzz*v72
    v211         = L_xxxzzzz*v72
    v295         = L_xxyzzzz*v72
    v344         = L_xxzzzzz*v72
    v410         = L_xyyzzzz*v72
    v449         = L_xyzzzzz*v72
    v129         = L_xxxxzzzz*v72
    v188         = L_xxxyzzzz*v72
    v231         = L_xxxzzzzz*v72
    v275         = L_xxyyzzzz*v72
    v308         = L_xxyzzzzz*v72
    v390         = L_xyyyzzzz*v72
    v423         = L_xyyzzzzz*v72
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
    v329         = v279*v34
    v396         = v256 + v279 + v11*v140 + 6.0d0*v260 + 4.0d0*v262
    Ls_xxyyy     = Ls_xxyyy + (0.0416666666666667d0*(v256 + 12.0d0*v257 + v259 + 6.0d0*v260 + 4.0d0*( &
      v258 + v262)) + L_xxxxxxyyy*v67 + L_xxyyy + v11*v74 + v163*v78 + &
      v255 + v263*v79 + v33*v6)
    v286         = L_xxyyzzzzz*v72
    v312         = v286 + 12.0d0*v284 + 4.0d0*(6.0d0*L_xxyyz + 6.0d0*v282 + v285)
    v313         = v312*y
    v349         = v19*v312
    v429         = v283 + v312 + v140*v242 + 6.0d0*v287 + 4.0d0*v289
    Ls_xxyyz     = Ls_xxyyz + (0.0416666666666667d0*(v283 + 12.0d0*v284 + v286 + 6.0d0*v287 + 4.0d0*( &
      v285 + v289)) + L_xxxxxxyyz*v67 + L_xxyyz + v183*v78 + v242*v74 + &
      v282 + v290*v79 + v33*v53)
    v374         = L_xyyyyzzzz*v72
    v394         = v374 + 12.0d0*v372 + 4.0d0*(6.0d0*L_xyyyy + 6.0d0*v370 + v373)
    v395         = v394*y
    v415         = v19*v394
    v440         = v34*v394
    Ls_xyyyy     = Ls_xyyyy + (0.0416666666666667d0*(v371 + 12.0d0*v372 + v374 + 6.0d0*v375 + 4.0d0*( &
      v373 + v377)) + L_xxxxxyyyy*v67 + L_xyyyy + v13*v74 + v250*v78 + &
      v33*v8 + v370 + v378*v79)
    v401         = L_xyyyzzzzz*v72
    v427         = v401 + 12.0d0*v399 + 4.0d0*(6.0d0*L_xyyyz + 6.0d0*v397 + v400)
    v428         = v427*y
    v454         = v19*v427
    v487         = v34*v427
    Ls_xyyyz     = Ls_xyyyz + (0.0416666666666667d0*(v398 + 12.0d0*v399 + v401 + 6.0d0*v402 + 4.0d0*( &
      v400 + v404)) + L_xxxxxyyyz*v67 + L_xyyyz + v270*v78 + v33*v94 + &
      v357*v74 + v397 + v405*v79)
    v502         = L_yyyyyzzzz*v72
    v517         = v502 + L_yyyyyzz*v515 + L_yyyyyzzz*v516 + 24.0d0*(L_yyyyy + v501)
    Ls_yyyyy     = Ls_yyyyy + (0.0416666666666667d0*v502 + L_xxxxyyyyy*v67 + L_yyyyy + L_yyyyyyyyy*v132 &
      + L_yyyyyzz*v460 + L_yyyyyzzz*v461 + v10*v33 + v15*v74 + v365*v78 &
      + v498*v503 + v501 + v504*v506 + v79*(v13*v80 + v360 + 3.0d0*v364 &
      + v376))
    v519         = L_yyyyzzzzz*v72
    v533         = v519 + L_yyyyzzz*v515 + L_yyyyzzzz*v516 + 24.0d0*(L_yyyyz + v518)
    Ls_yyyyz     = Ls_yyyyz + (0.0416666666666667d0*v519 + L_xxxxyyyyz*v67 + L_yyyyyyyyz*v132 + L_yyyyz &
      + L_yyyyzzz*v460 + L_yyyyzzzz*v461 + v156*v33 + v385*v78 + v494* &
      v74 + v503*v509 + v504*v520 + v518 + v79*(v357*v80 + v380 + 3.0d0 &
      *v384 + v403))
    c5           = c2*c3
    v130         = c5
    v463         = 0.00833333333333333d0*v130
    v544         = 6.0d0*v130
    v552         = 42.0d0*v130
    v322         = L_xxzzzzz*v130
    v435         = L_xyzzzzz*v130
    v212         = L_xxxzzzzz*v130
    v296         = L_xxyzzzzz*v130
    v345         = L_xxzzzzzz*v130
    v411         = L_xyyzzzzz*v130
    v450         = L_xyzzzzzz*v130
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
    v352         = v228 + v232 + v155*v225 + 60.0d0*v229 + 20.0d0*v230 + 120.0d0*(L_xxxz + &
      v227) + 5.0d0*(v231 + v236) + 10.0d0*(v233 + v234)
    Ls_xxxz      = Ls_xxxz + (0.00833333333333333d0*(v228 + 60.0d0*v229 + 20.0d0*v230 + v232 + 5.0d0*( &
      v231 + v236) + 10.0d0*(v233 + v234)) + L_xxxxxxxxz*v124 + L_xxxz &
      + v132*v155 + v137*v88 + v138*v150 + v139*v237 + v227 + v24*v67)
    v276         = L_xxyyzzzzz*v130
    v301         = v276 + 60.0d0*v273 + 20.0d0*v274 + 5.0d0*(24.0d0*L_xxyy + 24.0d0*v271 + &
      v275)
    v302         = v301*y
    v331         = v19*v301
    v418         = v272 + v301 + v11*v225 + 5.0d0*v280 + 10.0d0*(v277 + v278)
    Ls_xxyy      = Ls_xxyy + (0.00833333333333333d0*(v272 + 60.0d0*v273 + 20.0d0*v274 + v276 + 5.0d0*( &
      v275 + v280) + 10.0d0*(v277 + v278)) + L_xxxxxxxyy*v124 + L_xxyy &
      + v101*v137 + v11*v132 + v138*v176 + v139*v281 + v271 + v4*v67)
    v309         = L_xxyzzzzzz*v130
    v350         = v309 + 60.0d0*v306 + 20.0d0*v307 + 5.0d0*(24.0d0*L_xxyz + 24.0d0*v304 + &
      v308)
    v351         = v350*y
    v457         = v305 + v350 + v225*v242 + 5.0d0*v313 + 10.0d0*(v310 + v311)
    Ls_xxyz      = Ls_xxyz + (0.00833333333333333d0*(v305 + 60.0d0*v306 + 20.0d0*v307 + v309 + 5.0d0*( &
      v308 + v313) + 10.0d0*(v310 + v311)) + L_xxxxxxxyz*v124 + L_xxyz &
      + v121*v137 + v132*v242 + v138*v203 + v139*v314 + v30*v67 + v304)
    v391         = L_xyyyzzzzz*v130
    v416         = v391 + 60.0d0*v388 + 20.0d0*v389 + 5.0d0*(24.0d0*L_xyyy + 24.0d0*v386 + &
      v390)
    v417         = v416*y
    v441         = v19*v416
    Ls_xyyy      = Ls_xyyy + (0.00833333333333333d0*(v387 + 60.0d0*v388 + 20.0d0*v389 + v391 + 5.0d0*( &
      v390 + v395) + 10.0d0*(v392 + v393)) + L_xxxxxxyyy*v124 + L_xyyy &
      + v13*v132 + v137*v163 + v138*v263 + v139*v396 + v386 + v6*v67)
    v424         = L_xyyzzzzzz*v130
    v455         = v424 + 60.0d0*v421 + 20.0d0*v422 + 5.0d0*(24.0d0*L_xyyz + 24.0d0*v419 + &
      v423)
    v456         = v455*y
    v488         = v19*v455
    Ls_xyyz      = Ls_xyyz + (0.00833333333333333d0*(v420 + 60.0d0*v421 + 20.0d0*v422 + v424 + 5.0d0*( &
      v423 + v428) + 10.0d0*(v425 + v426)) + L_xxxxxxyyz*v124 + L_xyyz &
      + v132*v357 + v137*v183 + v138*v290 + v139*v429 + v419 + v53*v67)
    v511         = L_yyyyzzzzz*v130
    v530         = v511 + L_yyyyzz*v527 + L_yyyyzzz*v528 + L_yyyyzzzz*v529 + 120.0d0*( &
      L_yyyy + v510)
    Ls_yyyy      = Ls_yyyy + (0.00833333333333333d0*v511 + L_xxxxxyyyy*v124 + L_yyyy + L_yyyyyyyyy* &
      v215 + L_yyyyzz*v460 + L_yyyyzzz*v461 + L_yyyyzzzz*v462 + v132* &
      v15 + v137*v250 + v138*v378 + v139*(v13*v140 + v371 + 6.0d0*v375 &
      + 4.0d0*v377 + v394) + v498*v512 + v506*v513 + v510 + v514*v517 + &
      v67*v8)
    v532         = L_yyyzzzzzz*v130
    v548         = v532 + L_yyyzzz*v527 + L_yyyzzzz*v528 + L_yyyzzzzz*v529 + 120.0d0*( &
      L_yyyz + v531)
    Ls_yyyz      = Ls_yyyz + (0.00833333333333333d0*v532 + L_xxxxxyyyz*v124 + L_yyyyyyyyz*v215 + &
      L_yyyz + L_yyyzzz*v460 + L_yyyzzzz*v461 + L_yyyzzzzz*v462 + v132* &
      v494 + v137*v270 + v138*v405 + v139*(v140*v357 + v398 + 6.0d0* &
      v402 + 4.0d0*v404 + v427) + v509*v512 + v513*v520 + v514*v533 + &
      v531 + v67*v94)
    c6           = c3*c3
    v213         = c6
    v464         = 0.00138888888888889d0*v213
    v553         = 7.0d0*v213
    v323         = L_xxzzzzzz*v213
    v436         = L_xyzzzzzz*v213
    v214         = L_xxxzzzzzz*v213
    v339         = v208 + v214 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 + 20.0d0*v217 + &
      v338*v9 + 720.0d0*(L_xxx + v204) + 6.0d0*(v212 + v221) + 15.0d0*( &
      v216 + v218)
    Ls_xxx       = Ls_xxx + (0.00138888888888889d0*(v208 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 &
      + v214 + 20.0d0*v217 + 6.0d0*(v212 + v221) + 15.0d0*(v216 + v218 &
      )) + L_xxx + L_xxxxxxxxx*v206 + v0*v124 + v141*v223 + v204 + v215 &
      *v9 + v219*v43 + v222*v81 + v224*v226)
    v297         = L_xxyzzzzzz*v213
    v332         = v297 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 + 6.0d0*(120.0d0*L_xxy &
      + 120.0d0*v291 + v296)
    v333         = v332*y
    v444         = v292 + v332 + v11*v338 + 20.0d0*v299 + 6.0d0*v302 + 15.0d0*(v298 + v300)
    Ls_xxy       = Ls_xxy + (0.00138888888888889d0*(v292 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 &
      + v297 + 20.0d0*v299 + 6.0d0*(v296 + v302) + 15.0d0*(v298 + v300 &
      )) + L_xxxxxxxxy*v206 + L_xxy + v11*v215 + v114*v222 + v124*v2 + &
      v194*v223 + v219*v60 + v224*v303 + v291)
    v346         = L_xxzzzzzzz*v213
    v491         = v341 + v346 + v242*v338 + 360.0d0*v342 + 120.0d0*v343 + 30.0d0*v344 + &
      20.0d0*v348 + 720.0d0*(L_xxz + v340) + 6.0d0*(v345 + v351) + &
      15.0d0*(v347 + v349)
    Ls_xxz       = Ls_xxz + (0.00138888888888889d0*(v341 + 360.0d0*v342 + 120.0d0*v343 + 30.0d0*v344 &
      + v346 + 20.0d0*v348 + 6.0d0*(v345 + v351) + 15.0d0*(v347 + v349 &
      )) + L_xxxxxxxxz*v206 + L_xxz + v124*v24 + v150*v222 + v215*v242 &
      + v219*v88 + v223*v237 + v224*v352 + v340)
    v412         = L_xyyzzzzzz*v213
    v442         = v412 + 360.0d0*v408 + 120.0d0*v409 + 30.0d0*v410 + 6.0d0*(120.0d0*L_xyy &
      + 120.0d0*v406 + v411)
    v443         = v442*y
    Ls_xyy       = Ls_xyy + (0.00138888888888889d0*(v407 + 360.0d0*v408 + 120.0d0*v409 + 30.0d0*v410 &
      + v412 + 20.0d0*v414 + 6.0d0*(v411 + v417) + 15.0d0*(v413 + v415 &
      )) + L_xxxxxxxyy*v206 + L_xyy + v101*v219 + v124*v4 + v13*v215 + &
      v176*v222 + v223*v281 + v224*v418 + v406)
    v451         = L_xyzzzzzzz*v213
    v489         = v451 + 360.0d0*v447 + 120.0d0*v448 + 30.0d0*v449 + 6.0d0*(120.0d0*L_xyz &
      + 120.0d0*v445 + v450)
    v490         = v489*y
    Ls_xyz       = Ls_xyz + (0.00138888888888889d0*(v446 + 360.0d0*v447 + 120.0d0*v448 + 30.0d0*v449 &
      + v451 + 20.0d0*v453 + 6.0d0*(v450 + v456) + 15.0d0*(v452 + v454 &
      )) + L_xxxxxxxyz*v206 + L_xyz + v121*v219 + v124*v30 + v203*v222 &
      + v215*v357 + v223*v314 + v224*v457 + v445)
    v522         = L_yyyzzzzzz*v213
    v545         = v522 + L_yyyzz*v541 + L_yyyzzz*v542 + L_yyyzzzz*v543 + L_yyyzzzzz*v544 + &
      720.0d0*(L_yyy + v521)
    Ls_yyy       = Ls_yyy + (0.00138888888888889d0*v522 + L_xxxxxxyyy*v206 + L_yyy + L_yyyyyyyyy*v326 &
      + L_yyyzz*v460 + L_yyyzzz*v461 + L_yyyzzzz*v462 + L_yyyzzzzz*v463 &
      + v124*v6 + v15*v215 + v163*v219 + v222*v263 + v223*v396 + v224*( &
      v13*v225 + v387 + 10.0d0*v392 + 10.0d0*v393 + 5.0d0*v395 + v416) &
      + v498*v523 + v506*v524 + v517*v525 + v521 + v526*v530)
    v547         = L_yyzzzzzzz*v213
    v556         = v547 + L_yyzzz*v541 + L_yyzzzz*v542 + L_yyzzzzz*v543 + L_yyzzzzzz*v544 + &
      720.0d0*(L_yyz + v546)
    Ls_yyz       = Ls_yyz + (0.00138888888888889d0*v547 + L_xxxxxxyyz*v206 + L_yyyyyyyyz*v326 + L_yyz &
      + L_yyzzz*v460 + L_yyzzzz*v461 + L_yyzzzzz*v462 + L_yyzzzzzz*v463 &
      + v124*v53 + v183*v219 + v215*v494 + v222*v290 + v223*v429 + v224 &
      *(v225*v357 + v420 + 10.0d0*v425 + 10.0d0*v426 + 5.0d0*v428 + &
      v455) + v509*v523 + v520*v524 + v525*v533 + v526*v548 + v546)
    c7           = c3*c4
    v324         = c7
    v465         = 0.000198412698412698d0*v324
    v325         = L_xxzzzzzzz*v324
    Ls_xx        = Ls_xx + (0.000198412698412698d0*(v318 + 2520.0d0*v319 + 840.0d0*v320 + 210.0d0* &
      v321 + 42.0d0*v322 + v325 + 7.0d0*(v323 + v333) + 21.0d0*(v327 + &
      v331) + 35.0d0*(v328 + v329)) + L_xx + L_xxxxxxxxx*v316 + v0*v206 &
      + v11*v326 + v141*v335 + v226*v336 + v315 + v330*v43 + v334*v81 + &
      v337*v339)
    v437         = L_xyzzzzzzz*v324
    v475         = v437 + 2520.0d0*v432 + 840.0d0*v433 + 210.0d0*v434 + 42.0d0*v435 + 7.0d0 &
      *(720.0d0*L_xy + 720.0d0*v430 + v436)
    Ls_xy        = Ls_xy + (0.000198412698412698d0*(v431 + 2520.0d0*v432 + 840.0d0*v433 + 210.0d0* &
      v434 + 42.0d0*v435 + v437 + 7.0d0*(v436 + v443) + 21.0d0*(v438 + &
      v441) + 35.0d0*(v439 + v440)) + L_xxxxxxxxy*v316 + L_xy + v114* &
      v334 + v13*v326 + v194*v335 + v2*v206 + v303*v336 + v330*v60 + &
      v337*v444 + v430)
    v484         = L_xzzzzzzzz*v324
    Ls_xz        = Ls_xz + (0.000198412698412698d0*(v483 + v484 + 7.0d0*v490 + 21.0d0*(v485 + v488) &
      + 35.0d0*(v486 + v487)) + L_xxxxxxxxz*v316 + L_xz + L_xzzz*v460 + &
      L_xzzzz*v461 + L_xzzzzz*v462 + L_xzzzzzz*v463 + L_xzzzzzzz*v464 + &
      v150*v334 + v206*v24 + v237*v335 + v326*v357 + v330*v88 + v336* &
      v352 + v337*v491 + v482)
    v535         = L_yyzzzzzzz*v324
    Ls_yy        = Ls_yy + (0.000198412698412698d0*v535 + L_xxxxxxxyy*v316 + L_yy + L_yyyyyyyyy*v467 &
      + L_yyzz*v460 + L_yyzzz*v461 + L_yyzzzz*v462 + L_yyzzzzz*v463 + &
      L_yyzzzzzz*v464 + v101*v330 + v15*v326 + v176*v334 + v206*v4 + &
      v281*v335 + v336*v418 + v337*(v13*v338 + v407 + 15.0d0*v413 + &
      20.0d0*v414 + 15.0d0*v415 + 6.0d0*v417 + v442) + v498*v536 + v506 &
      *v537 + v517*v538 + v530*v539 + v534 + v540*v545)
    v555         = L_yzzzzzzzz*v324
    Ls_yz        = Ls_yz + (0.000198412698412698d0*v555 + L_xxxxxxxyz*v316 + L_yyyyyyyyz*v467 + L_yz &
      + L_yzzz*v460 + L_yzzzz*v461 + L_yzzzzz*v462 + L_yzzzzzz*v463 + &
      L_yzzzzzzz*v464 + v121*v330 + v203*v334 + v206*v30 + v314*v335 + &
      v326*v494 + v336*v457 + v337*(v338*v357 + v446 + 15.0d0*v452 + &
      20.0d0*v453 + 15.0d0*v454 + 6.0d0*v456 + v489) + v509*v536 + v520 &
      *v537 + v533*v538 + v539*v548 + v540*v556 + v554)
    c8           = c4*c4
    v466         = 2.48015873015873d-5*c8
    Ls_x         = Ls_x + (L_x + L_xxxxxxxxx*v458 + L_xyyyyyyyy*v459 + L_xz*z + L_xzz*v460 + L_xzzz &
      *v461 + L_xzzzz*v462 + L_xzzzzz*v463 + L_xzzzzzz*v464 + &
      L_xzzzzzzz*v465 + L_xzzzzzzzz*v466 + v0*v316 + v13*v467 + v141* &
      v477 + v226*v478 + v339*v479 + v363*v468 + v376*v469 + v394*v470 &
      + v416*v472 + v43*v471 + v442*v473 + v474*v475 + v476*v81 + v480* &
      (5040.0d0*L_xx + v11*v481 + 5040.0d0*v315 + v318 + 2520.0d0*v319 &
      + 840.0d0*v320 + 210.0d0*v321 + 42.0d0*v322 + 7.0d0*v323 + v325 + &
      21.0d0*v327 + 35.0d0*v328 + 35.0d0*v329 + 21.0d0*v331 + 7.0d0* &
      v333))
    Ls_y         = Ls_y + (L_y + L_xxxxxxxxy*v458 + L_yyyyyyyyy*v459 + L_yz*z + L_yzz*v460 + L_yzzz &
      *v461 + L_yzzzz*v462 + L_yzzzzz*v463 + L_yzzzzzz*v464 + &
      L_yzzzzzzz*v465 + L_yzzzzzzzz*v466 + v114*v476 + v15*v467 + v194* &
      v477 + v2*v316 + v303*v478 + v444*v479 + v468*v498 + v469*v506 + &
      v470*v517 + v471*v60 + v472*v530 + v473*v545 + v474*(5040.0d0* &
      L_yy + L_yyzz*v549 + L_yyzzz*v550 + L_yyzzzz*v551 + L_yyzzzzz* &
      v552 + L_yyzzzzzz*v553 + 5040.0d0*v534 + v535) + v480*(v13*v481 + &
      v431 + 21.0d0*v438 + 35.0d0*v439 + 35.0d0*v440 + 21.0d0*v441 + &
      7.0d0*v443 + v475))
    Ls_z         = Ls_z + (L_z + L_xxxxxxxxz*v458 + L_yyyyyyyyz*v459 + L_zz*z + L_zzz*v460 + L_zzzz &
      *v461 + L_zzzzz*v462 + L_zzzzzz*v463 + L_zzzzzzz*v464 + &
      L_zzzzzzzz*v465 + L_zzzzzzzzz*v466 + v150*v476 + v237*v477 + v24* &
      v316 + v352*v478 + v467*v494 + v468*v509 + v469*v520 + v470*v533 &
      + v471*v88 + v472*v548 + v473*v556 + v474*(5040.0d0*L_yz + L_yzzz &
      *v549 + L_yzzzz*v550 + L_yzzzzz*v551 + L_yzzzzzz*v552 + &
      L_yzzzzzzz*v553 + 5040.0d0*v554 + v555) + v479*v491 + v480*( &
      5040.0d0*L_xz + L_xzzz*v549 + L_xzzzz*v550 + L_xzzzzz*v551 + &
      L_xzzzzzz*v552 + L_xzzzzzzz*v553 + v357*v481 + 5040.0d0*v482 + &
      v483 + v484 + 21.0d0*v485 + 35.0d0*v486 + 35.0d0*v487 + 21.0d0* &
      v488 + 7.0d0*v490))
#undef  y                   
#undef  L_x                 
#undef  x                   
#undef  z                   
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
#undef  Ls_xxxxxxxx         
#undef  L_xxxxxxxx          
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
#undef  Ls_xxxxxxxxx        
#undef  L_xxxxxxxxx         
#undef  Ls_xxxxxxxxy        
#undef  L_xxxxxxxxy         
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
#undef  L_xxyyyyyyy         
#undef  Ls_xxyyyyyyy        
#undef  L_xxyyyyyyz         
#undef  Ls_xxyyyyyyz        
#undef  Ls_xyyyyyyyy        
#undef  L_xyyyyyyyy         
#undef  Ls_xyyyyyyyz        
#undef  L_xyyyyyyyz         
#undef  Ls_yyyyyyyyy        
#undef  L_yyyyyyyyy         
#undef  L_yyyyyyyyz         
#undef  Ls_yyyyyyyyz        
    end subroutine mom_es_L2L_add
    
! OPS  2912*ADD + 2*DIV + 3777*MUL + 253*NEG + POW + 84*SUB = 7029  (9178 before optimization)
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
                v598, v599, v6, v60, v600, v601, v602, v603, v604, v605, v606,&
                v607, v608, v609, v61, v610, v611, v612, v613, v614, v615,&
                v616, v617, v618, v619, v62, v620, v621, v622, v623, v624,&
                v625, v626, v627, v628, v629, v63, v630, v631, v632, v633,&
                v634, v635, v636, v637, v638, v639, v64, v640, v641, v642,&
                v643, v644, v645, v646, v647, v648, v649, v65, v650, v651,&
                v652, v653, v654, v655, v656, v657, v658, v659, v66, v660,&
                v661, v662, v663, v664, v67, v68, v69, v7, v70, v71, v72, v73,&
                v74, v75, v76, v77, v78, v79, v8, v80, v81, v82, v83, v84,&
                v85, v86, v87, v88, v89, v9, v90, v91, v92, v93, v94, v95,&
                v96, v97, v98, v99, h, u, D_x, D_y, D_z, D_xx, D_xy, D_xz,&
                D_yy, D_yz, D_zz, D_xxx, D_xxy, D_xxz, D_xyy, D_xyz, D_xzz,&
                D_yyy, D_yyz, D_yzz, D_zzz, D_xxxx, D_xxxy, D_xxxz, D_xxyy,&
                D_xxyz, D_xxzz, D_xyyy, D_xyyz, D_xyzz, D_xzzz, D_yyyy,&
                D_yyyz, D_yyzz, D_yzzz, D_zzzz, D_xxxxx, D_xxxxy, D_xxxxz,&
                D_xxxyy, D_xxxyz, D_xxxzz, D_xxyyy, D_xxyyz, D_xxyzz, D_xxzzz,&
                D_xyyyy, D_xyyyz, D_xyyzz, D_xyzzz, D_xzzzz, D_yyyyy, D_yyyyz,&
                D_yyyzz, D_yyzzz, D_yzzzz, D_zzzzz, D_xxxxxx, D_xxxxxy,&
                D_xxxxxz, D_xxxxyy, D_xxxxyz, D_xxxxzz, D_xxxyyy, D_xxxyyz,&
                D_xxxyzz, D_xxxzzz, D_xxyyyy, D_xxyyyz, D_xxyyzz, D_xxyzzz,&
                D_xxzzzz, D_xyyyyy, D_xyyyyz, D_xyyyzz, D_xyyzzz, D_xyzzzz,&
                D_xzzzzz, D_yyyyyy, D_yyyyyz, D_yyyyzz, D_yyyzzz, D_yyzzzz,&
                D_yzzzzz, D_zzzzzz, D_xxxxxxx, D_xxxxxxy, D_xxxxxxz,&
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
                D_zzzzzzzzz, M_zz, M_xzz, M_yzz, M_zzz, M_xxzz, M_xyzz,&
                M_xzzz, M_yyzz, M_yzzz, M_zzzz, M_xxxzz, M_xxyzz, M_xxzzz,&
                M_xyyzz, M_xyzzz, M_xzzzz, M_yyyzz, M_yyzzz, M_yzzzz, M_zzzzz,&
                M_xxxxzz, M_xxxyzz, M_xxxzzz, M_xxyyzz, M_xxyzzz, M_xxzzzz,&
                M_xyyyzz, M_xyyzzz, M_xyzzzz, M_xzzzzz, M_yyyyzz, M_yyyzzz,&
                M_yyzzzz, M_yzzzzz, M_zzzzzz, M_xxxxxzz, M_xxxxyzz, M_xxxxzzz,&
                M_xxxyyzz, M_xxxyzzz, M_xxxzzzz, M_xxyyyzz, M_xxyyzzz,&
                M_xxyzzzz, M_xxzzzzz, M_xyyyyzz, M_xyyyzzz, M_xyyzzzz,&
                M_xyzzzzz, M_xzzzzzz, M_yyyyyzz, M_yyyyzzz, M_yyyzzzz,&
                M_yyzzzzz, M_yzzzzzz, M_zzzzzzz, M_xxxxxxzz, M_xxxxxyzz,&
                M_xxxxxzzz, M_xxxxyyzz, M_xxxxyzzz, M_xxxxzzzz, M_xxxyyyzz,&
                M_xxxyyzzz, M_xxxyzzzz, M_xxxzzzzz, M_xxyyyyzz, M_xxyyyzzz,&
                M_xxyyzzzz, M_xxyzzzzz, M_xxzzzzzz, M_xyyyyyzz, M_xyyyyzzz,&
                M_xyyyzzzz, M_xyyzzzzz, M_xyzzzzzz, M_xzzzzzzz, M_yyyyyyzz,&
                M_yyyyyzzz, M_yyyyzzzz, M_yyyzzzzz, M_yyzzzzzz, M_yzzzzzzz,&
                M_zzzzzzzz
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
#define M_xxx                M(1:2,6)
#define L_yy                 L(1:2,6)
#define L_yz                 L(1:2,7)
#define M_xxy                M(1:2,7)
#define M_xxz                M(1:2,8)
#define L_xxx                L(1:2,8)
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
#define M_xxxyyy             M(1:2,38)
#define L_xxxxyy             L(1:2,38)
#define L_xxxxyz             L(1:2,39)
#define M_xxxyyz             M(1:2,39)
#define L_xxxyyy             L(1:2,40)
#define M_xxyyyy             M(1:2,40)
#define L_xxxyyz             L(1:2,41)
#define M_xxyyyz             M(1:2,41)
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
#define M_xxxxxxxx           M(1:2,61)
#define L_yyyyyyy            L(1:2,61)
#define L_yyyyyyz            L(1:2,62)
#define M_xxxxxxxy           M(1:2,62)
#define M_xxxxxxxz           M(1:2,63)
#define L_xxxxxxxx           L(1:2,63)
#define M_xxxxxxyy           M(1:2,64)
#define L_xxxxxxxy           L(1:2,64)
#define M_xxxxxxyz           M(1:2,65)
#define L_xxxxxxxz           L(1:2,65)
#define L_xxxxxxyy           L(1:2,66)
#define M_xxxxxyyy           M(1:2,66)
#define L_xxxxxxyz           L(1:2,67)
#define M_xxxxxyyz           M(1:2,67)
#define M_xxxxyyyy           M(1:2,68)
#define L_xxxxxyyy           L(1:2,68)
#define L_xxxxxyyz           L(1:2,69)
#define M_xxxxyyyz           M(1:2,69)
#define L_xxxxyyyy           L(1:2,70)
#define M_xxxyyyyy           M(1:2,70)
#define L_xxxxyyyz           L(1:2,71)
#define M_xxxyyyyz           M(1:2,71)
#define M_xxyyyyyy           M(1:2,72)
#define L_xxxyyyyy           L(1:2,72)
#define M_xxyyyyyz           M(1:2,73)
#define L_xxxyyyyz           L(1:2,73)
#define L_xxyyyyyy           L(1:2,74)
#define M_xyyyyyyy           M(1:2,74)
#define M_xyyyyyyz           M(1:2,75)
#define L_xxyyyyyz           L(1:2,75)
#define L_xyyyyyyy           L(1:2,76)
#define M_yyyyyyyy           M(1:2,76)
#define M_yyyyyyyz           M(1:2,77)
#define L_xyyyyyyz           L(1:2,77)
#define L_yyyyyyyy           L(1:2,78)
#define L_yyyyyyyz           L(1:2,79)
#define L_xxxxxxxxx          L(1:2,80)
#define L_xxxxxxxxy          L(1:2,81)
#define L_xxxxxxxxz          L(1:2,82)
#define L_xxxxxxxyy          L(1:2,83)
#define L_xxxxxxxyz          L(1:2,84)
#define L_xxxxxxyyy          L(1:2,85)
#define L_xxxxxxyyz          L(1:2,86)
#define L_xxxxxyyyy          L(1:2,87)
#define L_xxxxxyyyz          L(1:2,88)
#define L_xxxxyyyyy          L(1:2,89)
#define L_xxxxyyyyz          L(1:2,90)
#define L_xxxyyyyyy          L(1:2,91)
#define L_xxxyyyyyz          L(1:2,92)
#define L_xxyyyyyyy          L(1:2,93)
#define L_xxyyyyyyz          L(1:2,94)
#define L_xyyyyyyyy          L(1:2,95)
#define L_xyyyyyyyz          L(1:2,96)
#define L_yyyyyyyyy          L(1:2,97)
#define L_yyyyyyyyz          L(1:2,98)
    call pack2(MOM_ES_M_LEN, M1,M2,M)
    call pack2(3, r1,r2,r)
    v659        = y*z
    v660        = x*y
    v639        = 15.0d0*v659
    v641        = v660
    v643        = v659
    v142        = 0.5d0*M_xx
    v152        = 0.166666666666667d0*M_xxx
    v153        = 0.5d0*M_xxy
    v154        = 0.5d0*M_xxz
    v173        = 0.0416666666666667d0*M_xxxx
    v174        = 0.166666666666667d0*M_xxxy
    v175        = 0.166666666666667d0*M_xxxz
    v176        = 0.25d0*M_xxyy
    v177        = 0.5d0*M_xxyz
    v211        = 0.00833333333333333d0*M_xxxxx
    v212        = 0.0416666666666667d0*M_xxxxy
    v213        = 0.0416666666666667d0*M_xxxxz
    v214        = 0.0833333333333333d0*M_xxxyy
    v215        = 0.166666666666667d0*M_xxxyz
    v217        = 0.0833333333333333d0*M_xxyyy
    v218        = 0.25d0*M_xxyyz
    v279        = 0.00138888888888889d0*M_xxxxxx
    v280        = 0.00833333333333333d0*M_xxxxxy
    v281        = 0.00833333333333333d0*M_xxxxxz
    v282        = 0.0208333333333333d0*M_xxxxyy
    v283        = 0.0416666666666667d0*M_xxxxyz
    v285        = 0.0277777777777778d0*M_xxxyyy
    v286        = 0.0833333333333333d0*M_xxxyyz
    v289        = 0.0208333333333333d0*M_xxyyyy
    v290        = 0.0833333333333333d0*M_xxyyyz
    v388        = 0.000198412698412698d0*M_xxxxxxx
    v389        = 0.00138888888888889d0*M_xxxxxxy
    v390        = 0.00138888888888889d0*M_xxxxxxz
    v391        = 0.00416666666666667d0*M_xxxxxyy
    v392        = 0.00833333333333333d0*M_xxxxxyz
    v394        = 0.00694444444444444d0*M_xxxxyyy
    v395        = 0.0208333333333333d0*M_xxxxyyz
    v398        = 0.00694444444444444d0*M_xxxyyyy
    v399        = 0.0277777777777778d0*M_xxxyyyz
    v403        = 0.00416666666666667d0*M_xxyyyyy
    v404        = 0.0208333333333333d0*M_xxyyyyz
    v450        = 0.5d0*M_yy
    v452        = 0.166666666666667d0*M_yyy
    v457        = 0.0416666666666667d0*M_yyyy
    v466        = 0.00833333333333333d0*M_yyyyy
    v482        = 0.00138888888888889d0*M_yyyyyy
    v506        = 0.000198412698412698d0*M_yyyyyyy
    v541        = 2.48015873015873d-5*M_xxxxxxxx
    v542        = 0.000198412698412698d0*M_xxxxxxxy
    v543        = 0.000198412698412698d0*M_xxxxxxxz
    v544        = 0.000694444444444444d0*M_xxxxxxyy
    v545        = 0.00138888888888889d0*M_xxxxxxyz
    v547        = 0.00138888888888889d0*M_xxxxxyyy
    v548        = 0.00416666666666667d0*M_xxxxxyyz
    v551        = 0.00173611111111111d0*M_xxxxyyyy
    v552        = 0.00694444444444444d0*M_xxxxyyyz
    v556        = 0.00138888888888889d0*M_xxxyyyyy
    v557        = 0.00694444444444444d0*M_xxxyyyyz
    v562        = 0.000694444444444444d0*M_xxyyyyyy
    v563        = 0.00416666666666667d0*M_xxyyyyyz
    v569        = 2.48015873015873d-5*M_yyyyyyyy
    v570        = 0.000198412698412698d0*M_yyyyyyyz
    v571        = 0.00138888888888889d0*M_yyyyyyz
    v573        = 0.00833333333333333d0*M_yyyyyz
    v576        = 0.0416666666666667d0*M_yyyyz
    v580        = 0.166666666666667d0*M_yyyz
    v585        = 0.5d0*M_yyz
    v598        = 0.5d0*M_xyy
    v600        = 0.166666666666667d0*M_xyyy
    v602        = 0.0416666666666667d0*M_xyyyy
    v604        = 0.00833333333333333d0*M_xyyyyy
    v606        = 0.00138888888888889d0*M_xyyyyyy
    v608        = 0.000198412698412698d0*M_xyyyyyyy
    M_zz        = -(M_xx + M_yy)
    v591        = 0.5d0*M_zz
    M_xzz       = -(M_xxx + M_xyy)
    M_yzz       = -(M_xxy + M_yyy)
    v599        = 0.5d0*M_yzz
    M_zzz       = -(M_xxz + M_yyz)
    v592        = 0.166666666666667d0*M_zzz
    M_xxzz      = -(M_xxxx + M_xxyy)
    v178        = 0.25d0*M_xxzz
    M_xyzz      = -(M_xxxy + M_xyyy)
    M_xzzz      = -(M_xxxz + M_xyyz)
    M_yyzz      = -(M_xxyy + M_yyyy)
    v586        = 0.25d0*M_yyzz
    M_yzzz      = -(M_xxyz + M_yyyz)
    v601        = 0.166666666666667d0*M_yzzz
    M_zzzz      = -(M_xxzz + M_yyzz)
    v593        = 0.0416666666666667d0*M_zzzz
    M_xxxzz     = -(M_xxxxx + M_xxxyy)
    v216        = 0.0833333333333333d0*M_xxxzz
    M_xxyzz     = -(M_xxxxy + M_xxyyy)
    v219        = 0.25d0*M_xxyzz
    M_xxzzz     = -(M_xxxxz + M_xxyyz)
    v220        = 0.0833333333333333d0*M_xxzzz
    M_xyyzz     = -(M_xxxyy + M_xyyyy)
    M_xyzzz     = -(M_xxxyz + M_xyyyz)
    M_xzzzz     = -(M_xxxzz + M_xyyzz)
    M_yyyzz     = -(M_xxyyy + M_yyyyy)
    v581        = 0.0833333333333333d0*M_yyyzz
    M_yyzzz     = -(M_xxyyz + M_yyyyz)
    v587        = 0.0833333333333333d0*M_yyzzz
    M_yzzzz     = -(M_xxyzz + M_yyyzz)
    v603        = 0.0416666666666667d0*M_yzzzz
    M_zzzzz     = -(M_xxzzz + M_yyzzz)
    v594        = 0.00833333333333333d0*M_zzzzz
    M_xxxxzz    = -(M_xxxxxx + M_xxxxyy)
    v284        = 0.0208333333333333d0*M_xxxxzz
    M_xxxyzz    = -(M_xxxxxy + M_xxxyyy)
    v287        = 0.0833333333333333d0*M_xxxyzz
    M_xxxzzz    = -(M_xxxxxz + M_xxxyyz)
    v288        = 0.0277777777777778d0*M_xxxzzz
    M_xxyyzz    = -(M_xxxxyy + M_xxyyyy)
    v291        = 0.125d0*M_xxyyzz
    M_xxyzzz    = -(M_xxxxyz + M_xxyyyz)
    v292        = 0.0833333333333333d0*M_xxyzzz
    M_xxzzzz    = -(M_xxxxzz + M_xxyyzz)
    v293        = 0.0208333333333333d0*M_xxzzzz
    M_xyyyzz    = -(M_xxxyyy + M_xyyyyy)
    M_xyyzzz    = -(M_xxxyyz + M_xyyyyz)
    M_xyzzzz    = -(M_xxxyzz + M_xyyyzz)
    M_xzzzzz    = -(M_xxxzzz + M_xyyzzz)
    M_yyyyzz    = -(M_xxyyyy + M_yyyyyy)
    v577        = 0.0208333333333333d0*M_yyyyzz
    M_yyyzzz    = -(M_xxyyyz + M_yyyyyz)
    v582        = 0.0277777777777778d0*M_yyyzzz
    M_yyzzzz    = -(M_xxyyzz + M_yyyyzz)
    v588        = 0.0208333333333333d0*M_yyzzzz
    M_yzzzzz    = -(M_xxyzzz + M_yyyzzz)
    v605        = 0.00833333333333333d0*M_yzzzzz
    M_zzzzzz    = -(M_xxzzzz + M_yyzzzz)
    v595        = 0.00138888888888889d0*M_zzzzzz
    M_xxxxxzz   = -(M_xxxxxxx + M_xxxxxyy)
    v393        = 0.00416666666666667d0*M_xxxxxzz
    M_xxxxyzz   = -(M_xxxxxxy + M_xxxxyyy)
    v396        = 0.0208333333333333d0*M_xxxxyzz
    M_xxxxzzz   = -(M_xxxxxxz + M_xxxxyyz)
    v397        = 0.00694444444444444d0*M_xxxxzzz
    M_xxxyyzz   = -(M_xxxxxyy + M_xxxyyyy)
    v400        = 0.0416666666666667d0*M_xxxyyzz
    M_xxxyzzz   = -(M_xxxxxyz + M_xxxyyyz)
    v401        = 0.0277777777777778d0*M_xxxyzzz
    M_xxxzzzz   = -(M_xxxxxzz + M_xxxyyzz)
    v402        = 0.00694444444444444d0*M_xxxzzzz
    M_xxyyyzz   = -(M_xxxxyyy + M_xxyyyyy)
    v405        = 0.0416666666666667d0*M_xxyyyzz
    M_xxyyzzz   = -(M_xxxxyyz + M_xxyyyyz)
    v406        = 0.0416666666666667d0*M_xxyyzzz
    M_xxyzzzz   = -(M_xxxxyzz + M_xxyyyzz)
    v407        = 0.0208333333333333d0*M_xxyzzzz
    M_xxzzzzz   = -(M_xxxxzzz + M_xxyyzzz)
    v408        = 0.00416666666666667d0*M_xxzzzzz
    M_xyyyyzz   = -(M_xxxyyyy + M_xyyyyyy)
    M_xyyyzzz   = -(M_xxxyyyz + M_xyyyyyz)
    M_xyyzzzz   = -(M_xxxyyzz + M_xyyyyzz)
    M_xyzzzzz   = -(M_xxxyzzz + M_xyyyzzz)
    M_xzzzzzz   = -(M_xxxzzzz + M_xyyzzzz)
    M_yyyyyzz   = -(M_xxyyyyy + M_yyyyyyy)
    v574        = 0.00416666666666667d0*M_yyyyyzz
    M_yyyyzzz   = -(M_xxyyyyz + M_yyyyyyz)
    v578        = 0.00694444444444444d0*M_yyyyzzz
    M_yyyzzzz   = -(M_xxyyyzz + M_yyyyyzz)
    v583        = 0.00694444444444444d0*M_yyyzzzz
    M_yyzzzzz   = -(M_xxyyzzz + M_yyyyzzz)
    v589        = 0.00416666666666667d0*M_yyzzzzz
    M_yzzzzzz   = -(M_xxyzzzz + M_yyyzzzz)
    v607        = 0.00138888888888889d0*M_yzzzzzz
    M_zzzzzzz   = -(M_xxzzzzz + M_yyzzzzz)
    v596        = 0.000198412698412698d0*M_zzzzzzz
    M_xxxxxxzz  = -(M_xxxxxxxx + M_xxxxxxyy)
    v546        = 0.000694444444444444d0*M_xxxxxxzz
    M_xxxxxyzz  = -(M_xxxxxxxy + M_xxxxxyyy)
    v549        = 0.00416666666666667d0*M_xxxxxyzz
    M_xxxxxzzz  = -(M_xxxxxxxz + M_xxxxxyyz)
    v550        = 0.00138888888888889d0*M_xxxxxzzz
    M_xxxxyyzz  = -(M_xxxxxxyy + M_xxxxyyyy)
    v553        = 0.0104166666666667d0*M_xxxxyyzz
    M_xxxxyzzz  = -(M_xxxxxxyz + M_xxxxyyyz)
    v554        = 0.00694444444444444d0*M_xxxxyzzz
    M_xxxxzzzz  = -(M_xxxxxxzz + M_xxxxyyzz)
    v555        = 0.00173611111111111d0*M_xxxxzzzz
    M_xxxyyyzz  = -(M_xxxxxyyy + M_xxxyyyyy)
    v558        = 0.0138888888888889d0*M_xxxyyyzz
    M_xxxyyzzz  = -(M_xxxxxyyz + M_xxxyyyyz)
    v559        = 0.0138888888888889d0*M_xxxyyzzz
    M_xxxyzzzz  = -(M_xxxxxyzz + M_xxxyyyzz)
    v560        = 0.00694444444444444d0*M_xxxyzzzz
    M_xxxzzzzz  = -(M_xxxxxzzz + M_xxxyyzzz)
    v561        = 0.00138888888888889d0*M_xxxzzzzz
    M_xxyyyyzz  = -(M_xxxxyyyy + M_xxyyyyyy)
    v564        = 0.0104166666666667d0*M_xxyyyyzz
    M_xxyyyzzz  = -(M_xxxxyyyz + M_xxyyyyyz)
    v565        = 0.0138888888888889d0*M_xxyyyzzz
    M_xxyyzzzz  = -(M_xxxxyyzz + M_xxyyyyzz)
    v566        = 0.0104166666666667d0*M_xxyyzzzz
    M_xxyzzzzz  = -(M_xxxxyzzz + M_xxyyyzzz)
    v567        = 0.00416666666666667d0*M_xxyzzzzz
    M_xxzzzzzz  = -(M_xxxxzzzz + M_xxyyzzzz)
    v568        = 0.000694444444444444d0*M_xxzzzzzz
    M_xyyyyyzz  = -(M_xxxyyyyy + M_xyyyyyyy)
    M_xyyyyzzz  = -(M_xxxyyyyz + M_xyyyyyyz)
    M_xyyyzzzz  = -(M_xxxyyyzz + M_xyyyyyzz)
    M_xyyzzzzz  = -(M_xxxyyzzz + M_xyyyyzzz)
    M_xyzzzzzz  = -(M_xxxyzzzz + M_xyyyzzzz)
    M_xzzzzzzz  = -(M_xxxzzzzz + M_xyyzzzzz)
    M_yyyyyyzz  = -(M_xxyyyyyy + M_yyyyyyyy)
    v572        = 0.000694444444444444d0*M_yyyyyyzz
    M_yyyyyzzz  = -(M_xxyyyyyz + M_yyyyyyyz)
    v575        = 0.00138888888888889d0*M_yyyyyzzz
    M_yyyyzzzz  = -(M_xxyyyyzz + M_yyyyyyzz)
    v579        = 0.00173611111111111d0*M_yyyyzzzz
    M_yyyzzzzz  = -(M_xxyyyzzz + M_yyyyyzzz)
    v584        = 0.00138888888888889d0*M_yyyzzzzz
    M_yyzzzzzz  = -(M_xxyyzzzz + M_yyyyzzzz)
    v590        = 0.000694444444444444d0*M_yyzzzzzz
    M_yzzzzzzz  = -(M_xxyzzzzz + M_yyyzzzzz)
    v609        = 0.000198412698412698d0*M_yzzzzzzz
    M_zzzzzzzz  = -(M_xxzzzzzz + M_yyzzzzzz)
    v597        = 2.48015873015873d-5*M_zzzzzzzz
    c1          = z
    b1          = y
    a1          = x
    a2          = a1*a1
    v0          = a2
    v610        = 5.0d0*v0
    v5          = 3.0d0*v0
    v10         = v610
    v24         = 7.0d0*v0
    a3          = a1*a2
    a4          = a2*a2
    v19         = a4
    v614        = 143.0d0*v19
    v54         = 33.0d0*v19
    v82         = v614
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
    v611        = v0*v1
    v7          = 3.0d0*v1
    v14         = 5.0d0*v1
    v612        = v1*v19
    v27         = v611
    v29         = 7.0d0*v1
    v616        = v1*v49
    v59         = v612
    v80         = -429.0d0*v59
    v111        = v616
    b3          = b1*b2
    b4          = b2*b2
    v31         = b4
    v613        = v0*v31
    v615        = 143.0d0*v31
    v617        = v19*v31
    v65         = v613
    v66         = 33.0d0*v31
    v90         = v615
    v91         = -429.0d0*v65
    v121        = v617
    v162        = -12155.0d0*v121
    b5          = b2*b3
    b6          = b3*b3
    v68         = b6
    v618        = v0*v68
    v92         = 429.0d0*v68
    v93         = -v92
    v127        = v618
    v128        = 715.0d0*v68
    b7          = b3*b4
    b8          = b4*b4
    v130        = b8
    b9          = b4*b5
    c2          = c1*c1
    h           = c2 + v0 + v1
    v619        = 3.0d0*h
    v620        = h*v0
    v621        = h*v1
    v622        = h*v19
    v624        = v1*v620
    v626        = h*v31
    v627        = h*v49
    v631        = v19*v621
    v633        = v31*v620
    v635        = h*v68
    v4          = -h
    v12         = v619
    v13         = -15.0d0*v1 + v12
    v17         = h*h
    v623        = v0*v17
    v625        = v1*v17
    v628        = v17*v19
    v630        = v17*v611
    v634        = v17*v31
    v18         = 3.0d0*v17
    v20         = v620
    v21         = -30.0d0*v20
    v23         = -v12
    v25         = v23 + v24
    v30         = v23 + v29
    v32         = v621
    v33         = -30.0d0*v32
    v36         = -15.0d0*v17
    v37         = -45.0d0*v17
    v38         = v37 - 945.0d0*v19 + 630.0d0*v620
    v40         = -(v18 + 63.0d0*v27)
    v43         = v37 - 945.0d0*v31 + 630.0d0*v621
    v46         = h*h*h
    v629        = v0*v46
    v632        = v1*v46
    v47         = 5.0d0*v46
    v48         = -v47
    v50         = v622
    v51         = v623
    v53         = 5.0d0*v17
    v55         = v21 + v53 + v54
    v57         = v624
    v58         = -(v46 + 126.0d0*v57)
    v61         = -v0*v12
    v62         = -v1*v12
    v63         = v17 + 33.0d0*v27
    v64         = v625
    v67         = v33 + v53 + v66
    v69         = v626
    v72         = 35.0d0*v46
    v76         = v47 + v74 + 495.0d0*v50 - 135.0d0*v51
    v78         = v47 + 330.0d0*v57
    v79         = h*v54
    v84         = -18.0d0*v51 + v46 + v79
    v85         = 66.0d0*v57
    v652        = -v85
    v86         = 9.0d0*v17
    v87         = 198.0d0*v57
    v88         = h*v66
    v89         = -18.0d0*v64 + v46 + v88
    v94         = v47 + v93 - 135.0d0*v64 + 495.0d0*v69
    v97         = h*h*h*h
    v98         = 35.0d0*v97
    v100        = v627
    v101        = v628
    v102        = v629
    v104        = -v72
    v106        = v104 + v105 - 1001.0d0*v50 + 385.0d0*v51
    v108        = v630
    v109        = 5.0d0*(297.0d0*v108 + v97)
    v653        = -v109
    v110        = 45.0d0*v46
    v112        = v631
    v114        = -14175.0d0*v46
    v116        = -v110
    v117        = -1430.0d0*v57
    v654        = v116 + v117
    v119        = -1351350.0d0*v624
    v655        = v114 + v119
    v120        = v632
    v122        = v633
    v124        = 3.0d0*v46
    v125        = -(v124 + 286.0d0*v57)
    v126        = v634
    v129        = v104 + v128 + 385.0d0*v64 - 1001.0d0*v69
    v131        = v635
    v134        = -315.0d0*v97
    v136        = -99225.0d0*v97
    v137        = v136 + 56756700.0d0*v627 - 28378350.0d0*v628 + 4365900.0d0*v629 - &
      34459425.0d0*v99
    v139        = 385.0d0*(v102 + v120) - (5005.0d0*v108 + v98)
    v141        = 7.0d0*v46
    v145        = -42525.0d0*v97
    v146        = -6081075.0d0*v630
    v656        = v145 + v146
    v148        = -(429.0d0*v108 + v97)
    v149        = -v17*v82
    v161        = -15.0d0*v97
    v163        = -2860.0d0*v108
    v657        = v161 + v162 + v163
    v164        = v124 + 130.0d0*v57
    v658        = -v164
    v191        = -v17*v90
    v449        = v136 - 34459425.0d0*v130 + 4365900.0d0*v632 - 28378350.0d0*v634 + &
      56756700.0d0*v635
    u2          = 1.0/h
    u           = sqrt(u2)
    u3          = u*u2
    v2          = u3
    D_x         = -v2*x
    D_y         = -v2*y
    D_z         = -v2*z
    u4          = u2*u2
    u5          = u2*u3
    v3          = u5
    v636        = 3.0d0*v3
    v6          = v636*x
    D_xx        = v3*(v4 + v5)
    D_xy        = v6*y
    D_xz        = v6*z
    D_yy        = v3*(v4 + v7)
    D_yz        = v636*v643
    D_zz        = -(D_xx + D_yy)
    u6          = u3*u3
    u7          = u3*u4
    v8          = u7
    v637        = 3.0d0*v8
    v9          = v8*x
    v11         = v637*(h - v10)
    D_xxx       = -3.0d0*v9*(v610 - v619)
    D_xxy       = v11*y
    D_xxz       = v11*z
    D_xyy       = v13*v9
    D_xyz       = -v639*v9
    D_xzz       = -(D_xxx + D_xyy)
    D_yyy       = v637*y*(v12 - v14)
    D_yyz       = v13*v8*z
    D_yzz       = -(D_xxy + D_yyy)
    D_zzz       = -(D_xxz + D_yyz)
    u8          = u4*u4
    u9          = u4*u5
    v15         = u9
    v638        = 15.0d0*v15*x
    v16         = 3.0d0*v15
    v22         = v638*y
    v26         = v638*z
    v28         = v15*v639
    D_xxxx      = v16*(35.0d0*v19 + v18 + v21)
    D_xxxy      = v22*v25
    D_xxxz      = v25*v26
    D_xxyy      = -v16*(h*v10 + h*v14 - (v17 + 35.0d0*v27))
    v409        = 0.5d0*D_xxyy
    D_xxyz      = v28*(v24 + v4)
    D_xxzz      = -(D_xxxx + D_xxyy)
    v430        = 0.5d0*D_xxzz
    D_xyyy      = v22*v30
    D_xyyz      = v26*(v29 + v4)
    D_xyzz      = -(D_xxxy + D_xyyy)
    v522        = 0.5d0*D_xyzz
    D_xzzz      = -(D_xxxz + D_xyyz)
    D_yyyy      = v16*(35.0d0*v31 + v18 + v33)
    D_yyyz      = v28*v30
    D_yyzz      = -(D_xxyy + D_yyyy)
    D_yzzz      = -(D_xxyz + D_yyyz)
    D_zzzz      = -(D_xxzz + D_yyzz)
    u10         = u5*u5
    u11         = u5*u6
    v34         = u11
    v661        = v34*z
    v640        = 15.0d0*v34
    v35         = v640*x
    v39         = v661
    v41         = 315.0d0*v641*v661
    v42         = v640*y
    D_xxxxx     = v35*(v36 - 63.0d0*v19 + 70.0d0*v20)
    D_xxxxy     = v34*v38*y
    D_xxxxz     = v38*v39
    D_xxxyy     = v35*(v40 + h*v24 + 21.0d0*v32)
    v294        = 0.5d0*D_xxxyy
    D_xxxyz     = v41*(h - v5)
    D_xxxzz     = -(D_xxxxx + D_xxxyy)
    v309        = 0.5d0*D_xxxzz
    D_xxyyy     = v42*(v40 + h*v29 + 21.0d0*v20)
    v360        = 0.5d0*D_xxyyy
    v410        = 0.166666666666667d0*D_xxyyy
    D_xxyyz     = v39*(v36 - 945.0d0*v611 + 105.0d0*(v620 + v621))
    v425        = 0.5d0*D_xxyyz
    D_xxyzz     = -(D_xxxxy + D_xxyyy)
    v375        = 0.5d0*D_xxyzz
    D_xxzzz     = -(D_xxxxz + D_xxyyz)
    v431        = 0.166666666666667d0*D_xxzzz
    v444        = 0.5d0*D_xxzzz
    D_xyyyy     = v34*v43*x
    D_xyyyz     = v41*(h - v7)
    v517        = 0.5d0*D_xyyyz
    D_xyyzz     = -(D_xxxyy + D_xyyyy)
    v493        = 0.5d0*D_xyyzz
    D_xyzzz     = -(D_xxxyz + D_xyyyz)
    v523        = 0.166666666666667d0*D_xyzzz
    v536        = 0.5d0*D_xyzzz
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
    v662        = 315.0d0*v44
    v642        = v662*x
    v45         = 45.0d0*v44
    v52         = v642*y
    v56         = v642*z
    v60         = v643*v662
    D_xxxxxx    = v45*(v48 + 231.0d0*v49 - 315.0d0*v50 + 105.0d0*v51)
    D_xxxxxy    = v52*v55
    D_xxxxxz    = v55*v56
    D_xxxxyy    = v45*(v58 + v17*v29 + 14.0d0*v51 + 231.0d0*v59 - 21.0d0*v622)
    v221        = 0.5d0*D_xxxxyy
    D_xxxxyz    = v60*(-18.0d0*v20 + v17 + v54)
    D_xxxxzz    = -(D_xxxxxx + D_xxxxyy)
    v231        = 0.5d0*D_xxxxzz
    D_xxxyyy    = 945.0d0*v44*v641*(11.0d0*v27 + v17 + v61 + v62)
    v260        = 0.5d0*D_xxxyyy
    v295        = 0.166666666666667d0*D_xxxyyy
    D_xxxyyz    = v56*(-9.0d0*v32 + v61 + v63)
    v305        = 0.5d0*D_xxxyyz
    D_xxxyzz    = -(D_xxxxxy + D_xxxyyy)
    v270        = 0.5d0*D_xxxyzz
    D_xxxzzz    = -(D_xxxxxz + D_xxxyyz)
    v310        = 0.166666666666667d0*D_xxxzzz
    v318        = 0.5d0*D_xxxzzz
    D_xxyyyy    = v45*(v58 + v17*v24 - 21.0d0*v626 + 14.0d0*v64 + 231.0d0*v65)
    v341        = 0.5d0*D_xxyyyy
    v361        = 0.166666666666667d0*D_xxyyyy
    v411        = 0.0416666666666667d0*D_xxyyyy
    D_xxyyyz    = v60*(-9.0d0*v20 + v62 + v63)
    v371        = 0.5d0*D_xxyyyz
    v421        = 0.166666666666667d0*D_xxyyyz
    D_xxyyzz    = -(D_xxxxyy + D_xxyyyy)
    v351        = 0.5d0*D_xxyyzz
    v426        = 0.25d0*D_xxyyzz
    D_xxyzzz    = -(D_xxxxyz + D_xxyyyz)
    v376        = 0.166666666666667d0*D_xxyzzz
    v384        = 0.5d0*D_xxyzzz
    D_xxzzzz    = -(D_xxxxzz + D_xxyyzz)
    v432        = 0.0416666666666667d0*D_xxzzzz
    v445        = 0.166666666666667d0*D_xxzzzz
    D_xyyyyy    = v52*v67
    D_xyyyyz    = v56*(-18.0d0*v32 + v17 + v66)
    v489        = 0.5d0*D_xyyyyz
    v513        = 0.166666666666667d0*D_xyyyyz
    D_xyyyzz    = -(D_xxxyyy + D_xyyyyy)
    v473        = 0.5d0*D_xyyyzz
    v518        = 0.25d0*D_xyyyzz
    D_xyyzzz    = -(D_xxxyyz + D_xyyyyz)
    v494        = 0.166666666666667d0*D_xyyzzz
    v502        = 0.5d0*D_xyyzzz
    D_xyzzzz    = -(D_xxxyzz + D_xyyyzz)
    v524        = 0.0416666666666667d0*D_xyzzzz
    v537        = 0.166666666666667d0*D_xyzzzz
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
    v663        = 945.0d0*v70
    v644        = 315.0d0*v70
    v71         = v644*x
    v75         = v644*y
    v77         = v644*z
    v81         = v643*v663*x
    v83         = v663
    D_xxxxxxx   = v71*(693.0d0*v50 - 315.0d0*v51 + v72 + v74)
    D_xxxxxxy   = v75*v76
    D_xxxxxxz   = v76*v77
    D_xxxxxyy   = v71*(-30.0d0*v51 - 45.0d0*v64 + v78 + v79 + v80)
    v179        = 0.5d0*D_xxxxxyy
    D_xxxxxyz   = v81*(v36 + 110.0d0*v20 - v82)
    D_xxxxxzz   = -(D_xxxxxxx + D_xxxxxyy)
    v185        = 0.5d0*D_xxxxxzz
    D_xxxxyyy   = -v83*y*(v652 + v1*v18 + v1*v82 - v84)
    v200        = 0.5d0*D_xxxxyyy
    v222        = 0.166666666666667d0*D_xxxxyyy
    D_xxxxyyz   = v77*(-v1*v86 + v80 + v84 + v87)
    v228        = 0.5d0*D_xxxxyyz
    D_xxxxyzz   = -(D_xxxxxxy + D_xxxxyyy)
    v206        = 0.5d0*D_xxxxyzz
    D_xxxxzzz   = -(D_xxxxxxz + D_xxxxyyz)
    v232        = 0.166666666666667d0*D_xxxxzzz
    v237        = 0.5d0*D_xxxxzzz
    D_xxxyyyy   = -v83*x*(v652 + v0*v18 + v0*v90 - v89)
    v249        = 0.5d0*D_xxxyyyy
    v261        = 0.166666666666667d0*D_xxxyyyy
    v296        = 0.0416666666666667d0*D_xxxyyyy
    D_xxxyyyz   = v81*(33.0d0*(v20 + v32) - (143.0d0*v27 + v86))
    v267        = 0.5d0*D_xxxyyyz
    v302        = 0.166666666666667d0*D_xxxyyyz
    D_xxxyyzz   = -(D_xxxxxyy + D_xxxyyyy)
    v255        = 0.5d0*D_xxxyyzz
    v306        = 0.25d0*D_xxxyyzz
    D_xxxyzzz   = -(D_xxxxxyz + D_xxxyyyz)
    v271        = 0.166666666666667d0*D_xxxyzzz
    v276        = 0.5d0*D_xxxyzzz
    D_xxxzzzz   = -(D_xxxxxzz + D_xxxyyzz)
    v311        = 0.0416666666666667d0*D_xxxzzzz
    v319        = 0.166666666666667d0*D_xxxzzzz
    D_xxyyyyy   = v75*(-45.0d0*v51 - 30.0d0*v64 + v78 + v88 + v91)
    v330        = 0.5d0*D_xxyyyyy
    v342        = 0.166666666666667d0*D_xxyyyyy
    v362        = 0.0416666666666667d0*D_xxyyyyy
    v412        = 0.00833333333333333d0*D_xxyyyyy
    D_xxyyyyz   = v77*(-v0*v86 + v87 + v89 + v91)
    v348        = 0.5d0*D_xxyyyyz
    v368        = 0.166666666666667d0*D_xxyyyyz
    v418        = 0.0416666666666667d0*D_xxyyyyz
    D_xxyyyzz   = -(D_xxxxyyy + D_xxyyyyy)
    v336        = 0.5d0*D_xxyyyzz
    v372        = 0.25d0*D_xxyyyzz
    v422        = 0.0833333333333333d0*D_xxyyyzz
    v439        = 0.166666666666667d0*D_xxyyyzz
    D_xxyyzzz   = -(D_xxxxyyz + D_xxyyyyz)
    v352        = 0.166666666666667d0*D_xxyyzzz
    v357        = 0.5d0*D_xxyyzzz
    v427        = 0.0833333333333333d0*D_xxyyzzz
    v441        = 0.25d0*D_xxyyzzz
    D_xxyzzzz   = -(D_xxxxyzz + D_xxyyyzz)
    v377        = 0.0416666666666667d0*D_xxyzzzz
    v385        = 0.166666666666667d0*D_xxyzzzz
    D_xxzzzzz   = -(D_xxxxzzz + D_xxyyzzz)
    v433        = 0.00833333333333333d0*D_xxzzzzz
    v446        = 0.0416666666666667d0*D_xxzzzzz
    D_xyyyyyy   = v71*v94
    D_xyyyyyz   = v81*(v36 + 110.0d0*v32 - v90)
    v470        = 0.5d0*D_xyyyyyz
    v486        = 0.166666666666667d0*D_xyyyyyz
    v510        = 0.0416666666666667d0*D_xyyyyyz
    D_xyyyyzz   = -(D_xxxyyyy + D_xyyyyyy)
    v461        = 0.5d0*D_xyyyyzz
    v490        = 0.25d0*D_xyyyyzz
    v514        = 0.0833333333333333d0*D_xyyyyzz
    v531        = 0.166666666666667d0*D_xyyyyzz
    D_xyyyzzz   = -(D_xxxyyyz + D_xyyyyyz)
    v474        = 0.166666666666667d0*D_xyyyzzz
    v479        = 0.5d0*D_xyyyzzz
    v519        = 0.0833333333333333d0*D_xyyyzzz
    v533        = 0.25d0*D_xyyyzzz
    D_xyyzzzz   = -(D_xxxyyzz + D_xyyyyzz)
    v495        = 0.0416666666666667d0*D_xyyzzzz
    v503        = 0.166666666666667d0*D_xyyzzzz
    D_xyzzzzz   = -(D_xxxyzzz + D_xyyyzzz)
    v525        = 0.00833333333333333d0*D_xyzzzzz
    v538        = 0.0416666666666667d0*D_xyzzzzz
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
    v645        = v660*v95
    v646        = v95*z
    v647        = v646*x
    v648        = v646*y
    v96         = 315.0d0*v95
    v103        = 2835.0d0*v645
    v107        = 2835.0d0*v647
    v113        = v648
    v115        = 945.0d0*v645
    v118        = v647
    v123        = 2835.0d0*v648
    D_xxxxxxxx  = v96*(v98 - 12012.0d0*v100 + 6930.0d0*v101 - 1260.0d0*v102 + 6435.0d0*v99 &
      )
    L_xxxxxxxx  = D_xxxxxxxx*M_0
    D_xxxxxxxy  = v103*v106
    L_xxxxxxxy  = D_xxxxxxxy*M_0
    D_xxxxxxxz  = v106*v107
    L_xxxxxxxz  = D_xxxxxxxz*M_0
    D_xxxxxxyy  = -v96*(v653 + h*v73 + v1*v110 - 495.0d0*v101 + 135.0d0*v102 + 6435.0d0*( &
      -v111 + v112))
    v155        = 0.5d0*D_xxxxxxyy
    L_xxxxxxyy  = D_xxxxxxyy*M_0
    D_xxxxxxyz  = v113*(v114 + 467775.0d0*v623 + 155925.0d0*(13.0d0*v49 - 13.0d0*v622))
    L_xxxxxxyz  = D_xxxxxxyz*M_0
    D_xxxxxxzz  = -(D_xxxxxxxx + D_xxxxxxyy)
    v158        = 0.5d0*D_xxxxxxzz
    D_xxxxxyyy  = v115*(v654 - 429.0d0*v50 + 330.0d0*v51 + 2145.0d0*v59 + 165.0d0*v64)
    v167        = 0.5d0*D_xxxxxyyy
    v180        = 0.166666666666667d0*D_xxxxxyyy
    L_xxxxxyyy  = D_xxxxxyyy*M_0
    D_xxxxxyyz  = v118*(v655 + 2027025.0d0*v612 - 135135.0d0*v622 + 103950.0d0*v623 + &
      155925.0d0*v625)
    v183        = 0.5d0*D_xxxxxyyz
    L_xxxxxyyz  = D_xxxxxyyz*M_0
    D_xxxxxyzz  = -(D_xxxxxxxy + D_xxxxxyyy)
    v170        = 0.5d0*D_xxxxxyzz
    D_xxxxxzzz  = -(D_xxxxxxxz + D_xxxxxyyz)
    v186        = 0.166666666666667d0*D_xxxxxzzz
    v188        = 0.5d0*D_xxxxxzzz
    D_xxxxyyyy  = 945.0d0*v95*(v97 + 396.0d0*v108 + 2145.0d0*v121 + v17*v54 + v17*v66 - &
      18.0d0*(v102 + v120) - 858.0d0*(v112 + v122))
    v194        = 0.5d0*D_xxxxyyyy
    v201        = 0.166666666666667d0*D_xxxxyyyy
    v223        = 0.0416666666666667d0*D_xxxxyyyy
    L_xxxxyyyy  = D_xxxxyyyy*M_0
    D_xxxxyyyz  = v123*(v125 - h*v82 + 66.0d0*v51 + 715.0d0*v59 + 11.0d0*v64)
    v204        = 0.5d0*D_xxxxyyyz
    v226        = 0.166666666666667d0*D_xxxxyyyz
    L_xxxxyyyz  = D_xxxxyyyz*M_0
    D_xxxxyyzz  = -(D_xxxxxxyy + D_xxxxyyyy)
    v197        = 0.5d0*D_xxxxyyzz
    v229        = 0.25d0*D_xxxxyyzz
    D_xxxxyzzz  = -(D_xxxxxxyz + D_xxxxyyyz)
    v207        = 0.166666666666667d0*D_xxxxyzzz
    v209        = 0.5d0*D_xxxxyzzz
    D_xxxxzzzz  = -(D_xxxxxxzz + D_xxxxyyzz)
    v233        = 0.0416666666666667d0*D_xxxxzzzz
    v238        = 0.166666666666667d0*D_xxxxzzzz
    D_xxxyyyyy  = v115*(v654 + 165.0d0*v51 + 330.0d0*v64 + 2145.0d0*v65 - 429.0d0*v69)
    v243        = 0.5d0*D_xxxyyyyy
    v250        = 0.166666666666667d0*D_xxxyyyyy
    v262        = 0.0416666666666667d0*D_xxxyyyyy
    v297        = 0.00833333333333333d0*D_xxxyyyyy
    L_xxxyyyyy  = D_xxxyyyyy*M_0
    D_xxxyyyyz  = v107*(v125 - h*v90 + 11.0d0*v51 + 66.0d0*v64 + 715.0d0*v65)
    v253        = 0.5d0*D_xxxyyyyz
    v265        = 0.166666666666667d0*D_xxxyyyyz
    v300        = 0.0416666666666667d0*D_xxxyyyyz
    L_xxxyyyyz  = D_xxxyyyyz*M_0
    D_xxxyyyzz  = -(D_xxxxxyyy + D_xxxyyyyy)
    v246        = 0.5d0*D_xxxyyyzz
    v268        = 0.25d0*D_xxxyyyzz
    v303        = 0.0833333333333333d0*D_xxxyyyzz
    v315        = 0.166666666666667d0*D_xxxyyyzz
    D_xxxyyzzz  = -(D_xxxxxyyz + D_xxxyyyyz)
    v256        = 0.166666666666667d0*D_xxxyyzzz
    v258        = 0.5d0*D_xxxyyzzz
    v307        = 0.0833333333333333d0*D_xxxyyzzz
    v316        = 0.25d0*D_xxxyyzzz
    D_xxxyzzzz  = -(D_xxxxxyzz + D_xxxyyyzz)
    v272        = 0.0416666666666667d0*D_xxxyzzzz
    v277        = 0.166666666666667d0*D_xxxyzzzz
    D_xxxzzzzz  = -(D_xxxxxzzz + D_xxxyyzzz)
    v312        = 0.00833333333333333d0*D_xxxzzzzz
    v320        = 0.0416666666666667d0*D_xxxzzzzz
    D_xxyyyyyy  = -v96*(v653 + h*v92 + v0*v110 + 135.0d0*v120 - 495.0d0*v126 + 6435.0d0*( &
      v122 - v127))
    v324        = 0.5d0*D_xxyyyyyy
    v331        = 0.166666666666667d0*D_xxyyyyyy
    v343        = 0.0416666666666667d0*D_xxyyyyyy
    v363        = 0.00833333333333333d0*D_xxyyyyyy
    v413        = 0.00138888888888889d0*D_xxyyyyyy
    L_xxyyyyyy  = D_xxyyyyyy*M_0
    D_xxyyyyyz  = v113*(v655 + 2027025.0d0*v613 + 155925.0d0*v623 + 103950.0d0*v625 - &
      135135.0d0*v626)
    v334        = 0.5d0*D_xxyyyyyz
    v346        = 0.166666666666667d0*D_xxyyyyyz
    v366        = 0.0416666666666667d0*D_xxyyyyyz
    v416        = 0.00833333333333333d0*D_xxyyyyyz
    L_xxyyyyyz  = D_xxyyyyyz*M_0
    D_xxyyyyzz  = -(D_xxxxyyyy + D_xxyyyyyy)
    v327        = 0.5d0*D_xxyyyyzz
    v349        = 0.25d0*D_xxyyyyzz
    v369        = 0.0833333333333333d0*D_xxyyyyzz
    v381        = 0.166666666666667d0*D_xxyyyyzz
    v419        = 0.0208333333333333d0*D_xxyyyyzz
    v437        = 0.0416666666666667d0*D_xxyyyyzz
    D_xxyyyzzz  = -(D_xxxxyyyz + D_xxyyyyyz)
    v337        = 0.166666666666667d0*D_xxyyyzzz
    v339        = 0.5d0*D_xxyyyzzz
    v373        = 0.0833333333333333d0*D_xxyyyzzz
    v382        = 0.25d0*D_xxyyyzzz
    v423        = 0.0277777777777778d0*D_xxyyyzzz
    D_xxyyzzzz  = -(D_xxxxyyzz + D_xxyyyyzz)
    v353        = 0.0416666666666667d0*D_xxyyzzzz
    v358        = 0.166666666666667d0*D_xxyyzzzz
    v428        = 0.0208333333333333d0*D_xxyyzzzz
    v442        = 0.0833333333333333d0*D_xxyyzzzz
    D_xxyzzzzz  = -(D_xxxxyzzz + D_xxyyyzzz)
    v378        = 0.00833333333333333d0*D_xxyzzzzz
    v386        = 0.0416666666666667d0*D_xxyzzzzz
    D_xxzzzzzz  = -(D_xxxxzzzz + D_xxyyzzzz)
    v434        = 0.00138888888888889d0*D_xxzzzzzz
    v447        = 0.00833333333333333d0*D_xxzzzzzz
    D_xyyyyyyy  = v103*v129
    L_xyyyyyyy  = D_xyyyyyyy*M_0
    D_xyyyyyyz  = v118*(v114 + 467775.0d0*v625 + 155925.0d0*(-13.0d0*v626 + 13.0d0*v68))
    v459        = 0.5d0*D_xyyyyyyz
    v468        = 0.166666666666667d0*D_xyyyyyyz
    v484        = 0.0416666666666667d0*D_xyyyyyyz
    v508        = 0.00833333333333333d0*D_xyyyyyyz
    L_xyyyyyyz  = D_xyyyyyyz*M_0
    D_xyyyyyzz  = -(D_xxxyyyyy + D_xyyyyyyy)
    v454        = 0.5d0*D_xyyyyyzz
    v471        = 0.25d0*D_xyyyyyzz
    v487        = 0.0833333333333333d0*D_xyyyyyzz
    v499        = 0.166666666666667d0*D_xyyyyyzz
    v511        = 0.0208333333333333d0*D_xyyyyyzz
    v529        = 0.0416666666666667d0*D_xyyyyyzz
    D_xyyyyzzz  = -(D_xxxyyyyz + D_xyyyyyyz)
    v462        = 0.166666666666667d0*D_xyyyyzzz
    v464        = 0.5d0*D_xyyyyzzz
    v491        = 0.0833333333333333d0*D_xyyyyzzz
    v500        = 0.25d0*D_xyyyyzzz
    v515        = 0.0277777777777778d0*D_xyyyyzzz
    D_xyyyzzzz  = -(D_xxxyyyzz + D_xyyyyyzz)
    v475        = 0.0416666666666667d0*D_xyyyzzzz
    v480        = 0.166666666666667d0*D_xyyyzzzz
    v520        = 0.0208333333333333d0*D_xyyyzzzz
    v534        = 0.0833333333333333d0*D_xyyyzzzz
    D_xyyzzzzz  = -(D_xxxyyzzz + D_xyyyyzzz)
    v496        = 0.00833333333333333d0*D_xyyzzzzz
    v504        = 0.0416666666666667d0*D_xyyzzzzz
    D_xyzzzzzz  = -(D_xxxyzzzz + D_xyyyzzzz)
    v526        = 0.00138888888888889d0*D_xyzzzzzz
    v539        = 0.00833333333333333d0*D_xyzzzzzz
    D_xzzzzzzz  = -(D_xxxzzzzz + D_xyyzzzzz)
    D_yyyyyyyy  = v96*(v98 - 1260.0d0*v120 + 6930.0d0*v126 + 6435.0d0*v130 - 12012.0d0* &
      v131)
    L_yyyyyyyy  = D_yyyyyyyy*M_0
    D_yyyyyyyz  = v123*v129
    L_yyyyyyyz  = D_yyyyyyyz*M_0
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
    v664        = v132*x
    v649        = v664
    v650        = v132*y
    v651        = v132*z
    v133        = 2835.0d0*v649
    v135        = v650
    v138        = v651
    v140        = 155925.0d0*v643*v664
    v147        = 14175.0d0*v651
    v190        = 2835.0d0*v650
    v240        = v649
    D_xxxxxxxxx = v133*(v134 + 25740.0d0*v100 - 18018.0d0*v101 + 4620.0d0*v102 - 12155.0d0 &
      *v99)
    L_xxxxxxxxx = D_xxxxxxxxx*M_0
    D_xxxxxxxxy = v135*v137
    L_xxxxxxxxy = D_xxxxxxxxy*M_0
    D_xxxxxxxxz = v137*v138
    L_xxxxxxxxz = D_xxxxxxxxz*M_0
    D_xxxxxxxyy = v133*(v139 + h*v105 - 1001.0d0*v101 - 12155.0d0*v111 + 15015.0d0*v112)
    v143        = 0.5d0*D_xxxxxxxyy
    L_xxxxxxxyy = D_xxxxxxxyy*M_0
    D_xxxxxxxyz = v140*(v141 - 221.0d0*v49 + 273.0d0*v50 - 91.0d0*v51)
    L_xxxxxxxyz = D_xxxxxxxyz*M_0
    D_xxxxxxxzz = -(D_xxxxxxxxx + D_xxxxxxxyy)
    v144        = 0.5d0*D_xxxxxxxzz
    L_xxxxxxx   = D_xxxxxxx*M_0 + D_xxxxxxxxx*v142 + D_xxxxxxxxy*M_xy + D_xxxxxxxxz*M_xz + &
      D_xxxxxxxyz*M_yz + M_yy*v143 + M_zz*v144
    D_xxxxxxyyy = v135*(v656 - 34459425.0d0*v616 + 1403325.0d0*v629 + 30405375.0d0*v631 + &
      155925.0d0*(39.0d0*v627 - 39.0d0*v628 + v632))
    v150        = 0.5d0*D_xxxxxxyyy
    v156        = 0.166666666666667d0*D_xxxxxxyyy
    L_xxxxxxyyy = D_xxxxxxyyy*M_0
    D_xxxxxxyyz = v147*(v148 + v149 + 33.0d0*v102 - 2431.0d0*v111 + 2145.0d0*v112 + 11.0d0 &
      *v120 + 143.0d0*v627)
    v157        = 0.5d0*D_xxxxxxyyz
    L_xxxxxxyyz = D_xxxxxxyyz*M_0
    D_xxxxxxyzz = -(D_xxxxxxxxy + D_xxxxxxyyy)
    v151        = 0.5d0*D_xxxxxxyzz
    L_xxxxxxy   = D_xxxxxxxxy*v142 + D_xxxxxxxyy*M_xy + D_xxxxxxxyz*M_xz + D_xxxxxxy*M_0 + &
      D_xxxxxxyyz*M_yz + M_yy*v150 + M_zz*v151
    D_xxxxxxzzz = -(D_xxxxxxxxz + D_xxxxxxyyz)
    v159        = 0.166666666666667d0*D_xxxxxxzzz
    v160        = 0.5d0*D_xxxxxxzzz
    L_xxxxxx    = D_xxxxxx*M_0 + D_xxxxxxxx*v142 + D_xxxxxxxxx*v152 + D_xxxxxxxxy*v153 + &
      D_xxxxxxxxz*v154 + D_xxxxxxxy*M_xy + D_xxxxxxxyz*M_xyz + &
      D_xxxxxxxz*M_xz + D_xxxxxxyz*M_yz + M_xyy*v143 + M_xzz*v144 + &
      M_yy*v155 + M_yyy*v156 + M_yyz*v157 + M_yzz*v151 + M_zz*v158 + &
      M_zzz*v159
    L_xxxxxxz   = D_xxxxxxxxz*v142 + D_xxxxxxxyz*M_xy + D_xxxxxxxzz*M_xz + D_xxxxxxyzz* &
      M_yz + D_xxxxxxz*M_0 + M_yy*v157 + M_zz*v160
    D_xxxxxyyyy = v133*(v149 + v657 + 110.0d0*v102 + 4290.0d0*v112 + 330.0d0*v120 + &
      7150.0d0*v122 - 715.0d0*v126)
    v165        = 0.5d0*D_xxxxxyyyy
    v168        = 0.166666666666667d0*D_xxxxxyyyy
    v181        = 0.0416666666666667d0*D_xxxxxyyyy
    L_xxxxxyyyy = D_xxxxxyyyy*M_0
    D_xxxxxyyyz = -v140*(v658 - 39.0d0*v50 + 26.0d0*v51 + 221.0d0*v59 + 13.0d0*v64)
    v169        = 0.5d0*D_xxxxxyyyz
    v182        = 0.166666666666667d0*D_xxxxxyyyz
    L_xxxxxyyyz = D_xxxxxyyyz*M_0
    D_xxxxxyyzz = -(D_xxxxxxxyy + D_xxxxxyyyy)
    v166        = 0.5d0*D_xxxxxyyzz
    v184        = 0.25d0*D_xxxxxyyzz
    L_xxxxxyy   = D_xxxxxxxyy*v142 + D_xxxxxxyyy*M_xy + D_xxxxxxyyz*M_xz + D_xxxxxyy*M_0 + &
      D_xxxxxyyyz*M_yz + M_yy*v165 + M_zz*v166
    D_xxxxxyzzz = -(D_xxxxxxxyz + D_xxxxxyyyz)
    v171        = 0.166666666666667d0*D_xxxxxyzzz
    v172        = 0.5d0*D_xxxxxyzzz
    L_xxxxxy    = D_xxxxxxxxy*v152 + D_xxxxxxxy*v142 + D_xxxxxxxyy*v153 + D_xxxxxxxyz*v154 &
      + D_xxxxxxyy*M_xy + D_xxxxxxyyz*M_xyz + D_xxxxxxyz*M_xz + &
      D_xxxxxy*M_0 + D_xxxxxyyz*M_yz + M_xyy*v150 + M_xzz*v151 + M_yy* &
      v167 + M_yyy*v168 + M_yyz*v169 + M_yzz*v166 + M_zz*v170 + M_zzz* &
      v171
    L_xxxxxyz   = D_xxxxxxxyz*v142 + D_xxxxxxyyz*M_xy + D_xxxxxxyzz*M_xz + D_xxxxxyyzz* &
      M_yz + D_xxxxxyz*M_0 + M_yy*v169 + M_zz*v172
    D_xxxxxzzzz = -(D_xxxxxxxzz + D_xxxxxyyzz)
    v187        = 0.0416666666666667d0*D_xxxxxzzzz
    v189        = 0.166666666666667d0*D_xxxxxzzzz
    L_xxxxx     = D_xxxxx*M_0 + D_xxxxxxx*v142 + D_xxxxxxxx*v152 + D_xxxxxxxxx*v173 + &
      D_xxxxxxxxy*v174 + D_xxxxxxxxz*v175 + D_xxxxxxxy*v153 + &
      D_xxxxxxxyy*v176 + D_xxxxxxxyz*v177 + D_xxxxxxxz*v154 + &
      D_xxxxxxxzz*v178 + D_xxxxxxy*M_xy + D_xxxxxxyz*M_xyz + D_xxxxxxz* &
      M_xz + D_xxxxxyz*M_yz + M_xyy*v155 + M_xyyy*v156 + M_xyyz*v157 + &
      M_xyzz*v151 + M_xzz*v158 + M_xzzz*v159 + M_yy*v179 + M_yyy*v180 + &
      M_yyyy*v181 + M_yyyz*v182 + M_yyz*v183 + M_yyzz*v184 + M_yzz*v170 &
      + M_yzzz*v171 + M_zz*v185 + M_zzz*v186 + M_zzzz*v187
    L_xxxxxz    = D_xxxxxxxxz*v152 + D_xxxxxxxyz*v153 + D_xxxxxxxz*v142 + D_xxxxxxxzz*v154 &
      + D_xxxxxxyz*M_xy + D_xxxxxxyzz*M_xyz + D_xxxxxxzz*M_xz + &
      D_xxxxxyzz*M_yz + D_xxxxxz*M_0 + M_xyy*v157 + M_xzz*v160 + M_yy* &
      v183 + M_yyy*v182 + M_yyz*v166 + M_yzz*v172 + M_zz*v188 + M_zzz* &
      v189
    D_xxxxyyyyy = v190*(v191 + v657 - 715.0d0*v101 + 330.0d0*v102 + 7150.0d0*v112 + &
      110.0d0*v120 + 4290.0d0*v122)
    v192        = 0.5d0*D_xxxxyyyyy
    v195        = 0.166666666666667d0*D_xxxxyyyyy
    v202        = 0.0416666666666667d0*D_xxxxyyyyy
    v224        = 0.00833333333333333d0*D_xxxxyyyyy
    L_xxxxyyyyy = D_xxxxyyyyy*M_0
    D_xxxxyyyyz = -2835.0d0*v138*(v17*v614 + v17*v615 + 12155.0d0*v617 + 1716.0d0*v630 + &
      3.0d0*v97 - 66.0d0*(v629 + v632) - 4290.0d0*(v631 + v633))
    v196        = 0.5d0*D_xxxxyyyyz
    v203        = 0.166666666666667d0*D_xxxxyyyyz
    v225        = 0.0416666666666667d0*D_xxxxyyyyz
    L_xxxxyyyyz = D_xxxxyyyyz*M_0
    D_xxxxyyyzz = -(D_xxxxxxyyy + D_xxxxyyyyy)
    v193        = 0.5d0*D_xxxxyyyzz
    v205        = 0.25d0*D_xxxxyyyzz
    v227        = 0.0833333333333333d0*D_xxxxyyyzz
    v235        = 0.166666666666667d0*D_xxxxyyyzz
    L_xxxxyyy   = D_xxxxxxyyy*v142 + D_xxxxxyyyy*M_xy + D_xxxxxyyyz*M_xz + D_xxxxyyy*M_0 + &
      D_xxxxyyyyz*M_yz + M_yy*v192 + M_zz*v193
    D_xxxxyyzzz = -(D_xxxxxxyyz + D_xxxxyyyyz)
    v198        = 0.166666666666667d0*D_xxxxyyzzz
    v199        = 0.5d0*D_xxxxyyzzz
    v230        = 0.0833333333333333d0*D_xxxxyyzzz
    v236        = 0.25d0*D_xxxxyyzzz
    L_xxxxyy    = D_xxxxxxxyy*v152 + D_xxxxxxyy*v142 + D_xxxxxxyyy*v153 + D_xxxxxxyyz*v154 &
      + D_xxxxxyyy*M_xy + D_xxxxxyyyz*M_xyz + D_xxxxxyyz*M_xz + &
      D_xxxxyy*M_0 + D_xxxxyyyz*M_yz + M_xyy*v165 + M_xzz*v166 + M_yy* &
      v194 + M_yyy*v195 + M_yyz*v196 + M_yzz*v193 + M_zz*v197 + M_zzz* &
      v198
    L_xxxxyyz   = D_xxxxxxyyz*v142 + D_xxxxxyyyz*M_xy + D_xxxxxyyzz*M_xz + D_xxxxyyyzz* &
      M_yz + D_xxxxyyz*M_0 + M_yy*v196 + M_zz*v199
    D_xxxxyzzzz = -(D_xxxxxxyzz + D_xxxxyyyzz)
    v208        = 0.0416666666666667d0*D_xxxxyzzzz
    v210        = 0.166666666666667d0*D_xxxxyzzzz
    L_xxxxy     = D_xxxxxxxxy*v173 + D_xxxxxxxy*v152 + D_xxxxxxxyy*v174 + D_xxxxxxxyz*v175 &
      + D_xxxxxxy*v142 + D_xxxxxxyy*v153 + D_xxxxxxyyy*v176 + &
      D_xxxxxxyyz*v177 + D_xxxxxxyz*v154 + D_xxxxxxyzz*v178 + D_xxxxxyy &
      *M_xy + D_xxxxxyyz*M_xyz + D_xxxxxyz*M_xz + D_xxxxy*M_0 + &
      D_xxxxyyz*M_yz + M_xyy*v167 + M_xyyy*v168 + M_xyyz*v169 + M_xyzz* &
      v166 + M_xzz*v170 + M_xzzz*v171 + M_yy*v200 + M_yyy*v201 + M_yyyy &
      *v202 + M_yyyz*v203 + M_yyz*v204 + M_yyzz*v205 + M_yzz*v197 + &
      M_yzzz*v198 + M_zz*v206 + M_zzz*v207 + M_zzzz*v208
    L_xxxxyz    = D_xxxxxxxyz*v152 + D_xxxxxxyyz*v153 + D_xxxxxxyz*v142 + D_xxxxxxyzz*v154 &
      + D_xxxxxyyz*M_xy + D_xxxxxyyzz*M_xyz + D_xxxxxyzz*M_xz + &
      D_xxxxyyzz*M_yz + D_xxxxyz*M_0 + M_xyy*v169 + M_xzz*v172 + M_yy* &
      v204 + M_yyy*v203 + M_yyz*v193 + M_yzz*v199 + M_zz*v209 + M_zzz* &
      v210
    D_xxxxzzzzz = -(D_xxxxxxzzz + D_xxxxyyzzz)
    v234        = 0.00833333333333333d0*D_xxxxzzzzz
    v239        = 0.0416666666666667d0*D_xxxxzzzzz
    L_xxxx      = D_xxxx*M_0 + D_xxxxxx*v142 + D_xxxxxxx*v152 + D_xxxxxxxx*v173 + &
      D_xxxxxxxxx*v211 + D_xxxxxxxxy*v212 + D_xxxxxxxxz*v213 + &
      D_xxxxxxxy*v174 + D_xxxxxxxyy*v214 + D_xxxxxxxyz*v215 + &
      D_xxxxxxxz*v175 + D_xxxxxxxzz*v216 + D_xxxxxxy*v153 + D_xxxxxxyy* &
      v176 + D_xxxxxxyyy*v217 + D_xxxxxxyyz*v218 + D_xxxxxxyz*v177 + &
      D_xxxxxxyzz*v219 + D_xxxxxxz*v154 + D_xxxxxxzz*v178 + D_xxxxxxzzz &
      *v220 + D_xxxxxy*M_xy + D_xxxxxyz*M_xyz + D_xxxxxz*M_xz + &
      D_xxxxyz*M_yz + M_xyy*v179 + M_xyyy*v180 + M_xyyyy*v181 + M_xyyyz &
      *v182 + M_xyyz*v183 + M_xyyzz*v184 + M_xyzz*v170 + M_xyzzz*v171 + &
      M_xzz*v185 + M_xzzz*v186 + M_xzzzz*v187 + M_yy*v221 + M_yyy*v222 &
      + M_yyyy*v223 + M_yyyyy*v224 + M_yyyyz*v225 + M_yyyz*v226 + &
      M_yyyzz*v227 + M_yyz*v228 + M_yyzz*v229 + M_yyzzz*v230 + M_yzz* &
      v206 + M_yzzz*v207 + M_yzzzz*v208 + M_zz*v231 + M_zzz*v232 + &
      M_zzzz*v233 + M_zzzzz*v234
    L_xxxxz     = D_xxxxxxxxz*v173 + D_xxxxxxxyz*v174 + D_xxxxxxxz*v152 + D_xxxxxxxzz*v175 &
      + D_xxxxxxyyz*v176 + D_xxxxxxyz*v153 + D_xxxxxxyzz*v177 + &
      D_xxxxxxz*v142 + D_xxxxxxzz*v154 + D_xxxxxxzzz*v178 + D_xxxxxyz* &
      M_xy + D_xxxxxyzz*M_xyz + D_xxxxxzz*M_xz + D_xxxxyzz*M_yz + &
      D_xxxxz*M_0 + M_xyy*v183 + M_xyyy*v182 + M_xyyz*v166 + M_xyzz* &
      v172 + M_xzz*v188 + M_xzzz*v189 + M_yy*v228 + M_yyy*v226 + M_yyyy &
      *v225 + M_yyyz*v235 + M_yyz*v197 + M_yyzz*v236 + M_yzz*v209 + &
      M_yzzz*v210 + M_zz*v237 + M_zzz*v238 + M_zzzz*v239
    D_xxxyyyyyy = v240*(v656 - 34459425.0d0*v618 + 1403325.0d0*v632 + 30405375.0d0*v633 + &
      155925.0d0*(v629 - 39.0d0*v634 + 39.0d0*v635))
    v241        = 0.5d0*D_xxxyyyyyy
    v244        = 0.166666666666667d0*D_xxxyyyyyy
    v251        = 0.0416666666666667d0*D_xxxyyyyyy
    v263        = 0.00833333333333333d0*D_xxxyyyyyy
    v298        = 0.00138888888888889d0*D_xxxyyyyyy
    L_xxxyyyyyy = D_xxxyyyyyy*M_0
    D_xxxyyyyyz = -v140*(v658 + 13.0d0*v51 + 26.0d0*v64 + 221.0d0*v65 - 39.0d0*v69)
    v245        = 0.5d0*D_xxxyyyyyz
    v252        = 0.166666666666667d0*D_xxxyyyyyz
    v264        = 0.0416666666666667d0*D_xxxyyyyyz
    v299        = 0.00833333333333333d0*D_xxxyyyyyz
    L_xxxyyyyyz = D_xxxyyyyyz*M_0
    D_xxxyyyyzz = -(D_xxxxxyyyy + D_xxxyyyyyy)
    v242        = 0.5d0*D_xxxyyyyzz
    v254        = 0.25d0*D_xxxyyyyzz
    v266        = 0.0833333333333333d0*D_xxxyyyyzz
    v274        = 0.166666666666667d0*D_xxxyyyyzz
    v301        = 0.0208333333333333d0*D_xxxyyyyzz
    v314        = 0.0416666666666667d0*D_xxxyyyyzz
    L_xxxyyyy   = D_xxxxxyyyy*v142 + D_xxxxyyyyy*M_xy + D_xxxxyyyyz*M_xz + D_xxxyyyy*M_0 + &
      D_xxxyyyyyz*M_yz + M_yy*v241 + M_zz*v242
    D_xxxyyyzzz = -(D_xxxxxyyyz + D_xxxyyyyyz)
    v247        = 0.166666666666667d0*D_xxxyyyzzz
    v248        = 0.5d0*D_xxxyyyzzz
    v269        = 0.0833333333333333d0*D_xxxyyyzzz
    v275        = 0.25d0*D_xxxyyyzzz
    v304        = 0.0277777777777778d0*D_xxxyyyzzz
    L_xxxyyy    = D_xxxxxxyyy*v152 + D_xxxxxyyy*v142 + D_xxxxxyyyy*v153 + D_xxxxxyyyz*v154 &
      + D_xxxxyyyy*M_xy + D_xxxxyyyyz*M_xyz + D_xxxxyyyz*M_xz + &
      D_xxxyyy*M_0 + D_xxxyyyyz*M_yz + M_xyy*v192 + M_xzz*v193 + M_yy* &
      v243 + M_yyy*v244 + M_yyz*v245 + M_yzz*v242 + M_zz*v246 + M_zzz* &
      v247
    L_xxxyyyz   = D_xxxxxyyyz*v142 + D_xxxxyyyyz*M_xy + D_xxxxyyyzz*M_xz + D_xxxyyyyzz* &
      M_yz + D_xxxyyyz*M_0 + M_yy*v245 + M_zz*v248
    D_xxxyyzzzz = -(D_xxxxxyyzz + D_xxxyyyyzz)
    v257        = 0.0416666666666667d0*D_xxxyyzzzz
    v259        = 0.166666666666667d0*D_xxxyyzzzz
    v308        = 0.0208333333333333d0*D_xxxyyzzzz
    v317        = 0.0833333333333333d0*D_xxxyyzzzz
    L_xxxyy     = D_xxxxxxxyy*v173 + D_xxxxxxyy*v152 + D_xxxxxxyyy*v174 + D_xxxxxxyyz*v175 &
      + D_xxxxxyy*v142 + D_xxxxxyyy*v153 + D_xxxxxyyyy*v176 + &
      D_xxxxxyyyz*v177 + D_xxxxxyyz*v154 + D_xxxxxyyzz*v178 + D_xxxxyyy &
      *M_xy + D_xxxxyyyz*M_xyz + D_xxxxyyz*M_xz + D_xxxyy*M_0 + &
      D_xxxyyyz*M_yz + M_xyy*v194 + M_xyyy*v195 + M_xyyz*v196 + M_xyzz* &
      v193 + M_xzz*v197 + M_xzzz*v198 + M_yy*v249 + M_yyy*v250 + M_yyyy &
      *v251 + M_yyyz*v252 + M_yyz*v253 + M_yyzz*v254 + M_yzz*v246 + &
      M_yzzz*v247 + M_zz*v255 + M_zzz*v256 + M_zzzz*v257
    L_xxxyyz    = D_xxxxxxyyz*v152 + D_xxxxxyyyz*v153 + D_xxxxxyyz*v142 + D_xxxxxyyzz*v154 &
      + D_xxxxyyyz*M_xy + D_xxxxyyyzz*M_xyz + D_xxxxyyzz*M_xz + &
      D_xxxyyyzz*M_yz + D_xxxyyz*M_0 + M_xyy*v196 + M_xzz*v199 + M_yy* &
      v253 + M_yyy*v252 + M_yyz*v242 + M_yzz*v248 + M_zz*v258 + M_zzz* &
      v259
    D_xxxyzzzzz = -(D_xxxxxyzzz + D_xxxyyyzzz)
    v273        = 0.00833333333333333d0*D_xxxyzzzzz
    v278        = 0.0416666666666667d0*D_xxxyzzzzz
    L_xxxy      = D_xxxxxxxxy*v211 + D_xxxxxxxy*v173 + D_xxxxxxxyy*v212 + D_xxxxxxxyz*v213 &
      + D_xxxxxxy*v152 + D_xxxxxxyy*v174 + D_xxxxxxyyy*v214 + &
      D_xxxxxxyyz*v215 + D_xxxxxxyz*v175 + D_xxxxxxyzz*v216 + D_xxxxxy* &
      v142 + D_xxxxxyy*v153 + D_xxxxxyyy*v176 + D_xxxxxyyyy*v217 + &
      D_xxxxxyyyz*v218 + D_xxxxxyyz*v177 + D_xxxxxyyzz*v219 + D_xxxxxyz &
      *v154 + D_xxxxxyzz*v178 + D_xxxxxyzzz*v220 + D_xxxxyy*M_xy + &
      D_xxxxyyz*M_xyz + D_xxxxyz*M_xz + D_xxxy*M_0 + D_xxxyyz*M_yz + &
      M_xyy*v200 + M_xyyy*v201 + M_xyyyy*v202 + M_xyyyz*v203 + M_xyyz* &
      v204 + M_xyyzz*v205 + M_xyzz*v197 + M_xyzzz*v198 + M_xzz*v206 + &
      M_xzzz*v207 + M_xzzzz*v208 + M_yy*v260 + M_yyy*v261 + M_yyyy*v262 &
      + M_yyyyy*v263 + M_yyyyz*v264 + M_yyyz*v265 + M_yyyzz*v266 + &
      M_yyz*v267 + M_yyzz*v268 + M_yyzzz*v269 + M_yzz*v255 + M_yzzz* &
      v256 + M_yzzzz*v257 + M_zz*v270 + M_zzz*v271 + M_zzzz*v272 + &
      M_zzzzz*v273
    L_xxxyz     = D_xxxxxxxyz*v173 + D_xxxxxxyyz*v174 + D_xxxxxxyz*v152 + D_xxxxxxyzz*v175 &
      + D_xxxxxyyyz*v176 + D_xxxxxyyz*v153 + D_xxxxxyyzz*v177 + &
      D_xxxxxyz*v142 + D_xxxxxyzz*v154 + D_xxxxxyzzz*v178 + D_xxxxyyz* &
      M_xy + D_xxxxyyzz*M_xyz + D_xxxxyzz*M_xz + D_xxxyyzz*M_yz + &
      D_xxxyz*M_0 + M_xyy*v204 + M_xyyy*v203 + M_xyyz*v193 + M_xyzz* &
      v199 + M_xzz*v209 + M_xzzz*v210 + M_yy*v267 + M_yyy*v265 + M_yyyy &
      *v264 + M_yyyz*v274 + M_yyz*v246 + M_yyzz*v275 + M_yzz*v258 + &
      M_yzzz*v259 + M_zz*v276 + M_zzz*v277 + M_zzzz*v278
    D_xxxzzzzzz = -(D_xxxxxzzzz + D_xxxyyzzzz)
    v313        = 0.00138888888888889d0*D_xxxzzzzzz
    v321        = 0.00833333333333333d0*D_xxxzzzzzz
    L_xxx       = D_xxx*M_0 + D_xxxxx*v142 + D_xxxxxx*v152 + D_xxxxxxx*v173 + D_xxxxxxxx* &
      v211 + D_xxxxxxxxx*v279 + D_xxxxxxxxy*v280 + D_xxxxxxxxz*v281 + &
      D_xxxxxxxy*v212 + D_xxxxxxxyy*v282 + D_xxxxxxxyz*v283 + &
      D_xxxxxxxz*v213 + D_xxxxxxxzz*v284 + D_xxxxxxy*v174 + D_xxxxxxyy* &
      v214 + D_xxxxxxyyy*v285 + D_xxxxxxyyz*v286 + D_xxxxxxyz*v215 + &
      D_xxxxxxyzz*v287 + D_xxxxxxz*v175 + D_xxxxxxzz*v216 + D_xxxxxxzzz &
      *v288 + D_xxxxxy*v153 + D_xxxxxyy*v176 + D_xxxxxyyy*v217 + &
      D_xxxxxyyyy*v289 + D_xxxxxyyyz*v290 + D_xxxxxyyz*v218 + &
      D_xxxxxyyzz*v291 + D_xxxxxyz*v177 + D_xxxxxyzz*v219 + D_xxxxxyzzz &
      *v292 + D_xxxxxz*v154 + D_xxxxxzz*v178 + D_xxxxxzzz*v220 + &
      D_xxxxxzzzz*v293 + D_xxxxy*M_xy + D_xxxxyz*M_xyz + D_xxxxz*M_xz + &
      D_xxxyz*M_yz + M_xyy*v221 + M_xyyy*v222 + M_xyyyy*v223 + M_xyyyyy &
      *v224 + M_xyyyyz*v225 + M_xyyyz*v226 + M_xyyyzz*v227 + M_xyyz* &
      v228 + M_xyyzz*v229 + M_xyyzzz*v230 + M_xyzz*v206 + M_xyzzz*v207 &
      + M_xyzzzz*v208 + M_xzz*v231 + M_xzzz*v232 + M_xzzzz*v233 + &
      M_xzzzzz*v234 + M_yy*v294 + M_yyy*v295 + M_yyyy*v296 + M_yyyyy* &
      v297 + M_yyyyyy*v298 + M_yyyyyz*v299 + M_yyyyz*v300 + M_yyyyzz* &
      v301 + M_yyyz*v302 + M_yyyzz*v303 + M_yyyzzz*v304 + M_yyz*v305 + &
      M_yyzz*v306 + M_yyzzz*v307 + M_yyzzzz*v308 + M_yzz*v270 + M_yzzz* &
      v271 + M_yzzzz*v272 + M_yzzzzz*v273 + M_zz*v309 + M_zzz*v310 + &
      M_zzzz*v311 + M_zzzzz*v312 + M_zzzzzz*v313
    L_xxxz      = D_xxxxxxxxz*v211 + D_xxxxxxxyz*v212 + D_xxxxxxxz*v173 + D_xxxxxxxzz*v213 &
      + D_xxxxxxyyz*v214 + D_xxxxxxyz*v174 + D_xxxxxxyzz*v215 + &
      D_xxxxxxz*v152 + D_xxxxxxzz*v175 + D_xxxxxxzzz*v216 + D_xxxxxyyyz &
      *v217 + D_xxxxxyyz*v176 + D_xxxxxyyzz*v218 + D_xxxxxyz*v153 + &
      D_xxxxxyzz*v177 + D_xxxxxyzzz*v219 + D_xxxxxz*v142 + D_xxxxxzz* &
      v154 + D_xxxxxzzz*v178 + D_xxxxxzzzz*v220 + D_xxxxyz*M_xy + &
      D_xxxxyzz*M_xyz + D_xxxxzz*M_xz + D_xxxyzz*M_yz + D_xxxz*M_0 + &
      M_xyy*v228 + M_xyyy*v226 + M_xyyyy*v225 + M_xyyyz*v235 + M_xyyz* &
      v197 + M_xyyzz*v236 + M_xyzz*v209 + M_xyzzz*v210 + M_xzz*v237 + &
      M_xzzz*v238 + M_xzzzz*v239 + M_yy*v305 + M_yyy*v302 + M_yyyy*v300 &
      + M_yyyyy*v299 + M_yyyyz*v314 + M_yyyz*v315 + M_yyyzz*v269 + &
      M_yyz*v255 + M_yyzz*v316 + M_yyzzz*v317 + M_yzz*v276 + M_yzzz* &
      v277 + M_yzzzz*v278 + M_zz*v318 + M_zzz*v319 + M_zzzz*v320 + &
      M_zzzzz*v321
    D_xxyyyyyyy = v190*(v139 + h*v128 + 15015.0d0*v122 - 1001.0d0*v126 - 12155.0d0*v127)
    v322        = 0.5d0*D_xxyyyyyyy
    v325        = 0.166666666666667d0*D_xxyyyyyyy
    v332        = 0.0416666666666667d0*D_xxyyyyyyy
    v344        = 0.00833333333333333d0*D_xxyyyyyyy
    v364        = 0.00138888888888889d0*D_xxyyyyyyy
    v414        = 0.000198412698412698d0*D_xxyyyyyyy
    L_xxyyyyyyy = D_xxyyyyyyy*M_0
    D_xxyyyyyyz = v147*(v148 + v191 + 11.0d0*v102 + 33.0d0*v120 + 2145.0d0*v122 - 2431.0d0 &
      *v127 + 143.0d0*v635)
    v326        = 0.5d0*D_xxyyyyyyz
    v333        = 0.166666666666667d0*D_xxyyyyyyz
    v345        = 0.0416666666666667d0*D_xxyyyyyyz
    v365        = 0.00833333333333333d0*D_xxyyyyyyz
    v415        = 0.00138888888888889d0*D_xxyyyyyyz
    L_xxyyyyyyz = D_xxyyyyyyz*M_0
    D_xxyyyyyzz = -(D_xxxxyyyyy + D_xxyyyyyyy)
    v323        = 0.5d0*D_xxyyyyyzz
    v335        = 0.25d0*D_xxyyyyyzz
    v347        = 0.0833333333333333d0*D_xxyyyyyzz
    v355        = 0.166666666666667d0*D_xxyyyyyzz
    v367        = 0.0208333333333333d0*D_xxyyyyyzz
    v380        = 0.0416666666666667d0*D_xxyyyyyzz
    v417        = 0.00416666666666667d0*D_xxyyyyyzz
    v436        = 0.00833333333333333d0*D_xxyyyyyzz
    L_xxyyyyy   = D_xxxxyyyyy*v142 + D_xxxyyyyyy*M_xy + D_xxxyyyyyz*M_xz + D_xxyyyyy*M_0 + &
      D_xxyyyyyyz*M_yz + M_yy*v322 + M_zz*v323
    D_xxyyyyzzz = -(D_xxxxyyyyz + D_xxyyyyyyz)
    v328        = 0.166666666666667d0*D_xxyyyyzzz
    v329        = 0.5d0*D_xxyyyyzzz
    v350        = 0.0833333333333333d0*D_xxyyyyzzz
    v356        = 0.25d0*D_xxyyyyzzz
    v370        = 0.0277777777777778d0*D_xxyyyyzzz
    v420        = 0.00694444444444444d0*D_xxyyyyzzz
    v438        = 0.0208333333333333d0*D_xxyyyyzzz
    L_xxyyyy    = D_xxxxxyyyy*v152 + D_xxxxyyyy*v142 + D_xxxxyyyyy*v153 + D_xxxxyyyyz*v154 &
      + D_xxxyyyyy*M_xy + D_xxxyyyyyz*M_xyz + D_xxxyyyyz*M_xz + &
      D_xxyyyy*M_0 + D_xxyyyyyz*M_yz + M_xyy*v241 + M_xzz*v242 + M_yy* &
      v324 + M_yyy*v325 + M_yyz*v326 + M_yzz*v323 + M_zz*v327 + M_zzz* &
      v328
    L_xxyyyyz   = D_xxxxyyyyz*v142 + D_xxxyyyyyz*M_xy + D_xxxyyyyzz*M_xz + D_xxyyyyyzz* &
      M_yz + D_xxyyyyz*M_0 + M_yy*v326 + M_zz*v329
    D_xxyyyzzzz = -(D_xxxxyyyzz + D_xxyyyyyzz)
    v338        = 0.0416666666666667d0*D_xxyyyzzzz
    v340        = 0.166666666666667d0*D_xxyyyzzzz
    v374        = 0.0208333333333333d0*D_xxyyyzzzz
    v383        = 0.0833333333333333d0*D_xxyyyzzzz
    v424        = 0.00694444444444444d0*D_xxyyyzzzz
    v440        = 0.0277777777777778d0*D_xxyyyzzzz
    L_xxyyy     = D_xxxxxxyyy*v173 + D_xxxxxyyy*v152 + D_xxxxxyyyy*v174 + D_xxxxxyyyz*v175 &
      + D_xxxxyyy*v142 + D_xxxxyyyy*v153 + D_xxxxyyyyy*v176 + &
      D_xxxxyyyyz*v177 + D_xxxxyyyz*v154 + D_xxxxyyyzz*v178 + D_xxxyyyy &
      *M_xy + D_xxxyyyyz*M_xyz + D_xxxyyyz*M_xz + D_xxyyy*M_0 + &
      D_xxyyyyz*M_yz + M_xyy*v243 + M_xyyy*v244 + M_xyyz*v245 + M_xyzz* &
      v242 + M_xzz*v246 + M_xzzz*v247 + M_yy*v330 + M_yyy*v331 + M_yyyy &
      *v332 + M_yyyz*v333 + M_yyz*v334 + M_yyzz*v335 + M_yzz*v327 + &
      M_yzzz*v328 + M_zz*v336 + M_zzz*v337 + M_zzzz*v338
    L_xxyyyz    = D_xxxxxyyyz*v152 + D_xxxxyyyyz*v153 + D_xxxxyyyz*v142 + D_xxxxyyyzz*v154 &
      + D_xxxyyyyz*M_xy + D_xxxyyyyzz*M_xyz + D_xxxyyyzz*M_xz + &
      D_xxyyyyzz*M_yz + D_xxyyyz*M_0 + M_xyy*v245 + M_xzz*v248 + M_yy* &
      v334 + M_yyy*v333 + M_yyz*v323 + M_yzz*v329 + M_zz*v339 + M_zzz* &
      v340
    D_xxyyzzzzz = -(D_xxxxyyzzz + D_xxyyyyzzz)
    v354        = 0.00833333333333333d0*D_xxyyzzzzz
    v359        = 0.0416666666666667d0*D_xxyyzzzzz
    v429        = 0.00416666666666667d0*D_xxyyzzzzz
    v443        = 0.0208333333333333d0*D_xxyyzzzzz
    L_xxyy      = D_xxxxxxxyy*v211 + D_xxxxxxyy*v173 + D_xxxxxxyyy*v212 + D_xxxxxxyyz*v213 &
      + D_xxxxxyy*v152 + D_xxxxxyyy*v174 + D_xxxxxyyyy*v214 + &
      D_xxxxxyyyz*v215 + D_xxxxxyyz*v175 + D_xxxxxyyzz*v216 + D_xxxxyy* &
      v142 + D_xxxxyyy*v153 + D_xxxxyyyy*v176 + D_xxxxyyyyy*v217 + &
      D_xxxxyyyyz*v218 + D_xxxxyyyz*v177 + D_xxxxyyyzz*v219 + D_xxxxyyz &
      *v154 + D_xxxxyyzz*v178 + D_xxxxyyzzz*v220 + D_xxxyyy*M_xy + &
      D_xxxyyyz*M_xyz + D_xxxyyz*M_xz + D_xxyy*M_0 + D_xxyyyz*M_yz + &
      M_xyy*v249 + M_xyyy*v250 + M_xyyyy*v251 + M_xyyyz*v252 + M_xyyz* &
      v253 + M_xyyzz*v254 + M_xyzz*v246 + M_xyzzz*v247 + M_xzz*v255 + &
      M_xzzz*v256 + M_xzzzz*v257 + M_yy*v341 + M_yyy*v342 + M_yyyy*v343 &
      + M_yyyyy*v344 + M_yyyyz*v345 + M_yyyz*v346 + M_yyyzz*v347 + &
      M_yyz*v348 + M_yyzz*v349 + M_yyzzz*v350 + M_yzz*v336 + M_yzzz* &
      v337 + M_yzzzz*v338 + M_zz*v351 + M_zzz*v352 + M_zzzz*v353 + &
      M_zzzzz*v354
    L_xxyyz     = D_xxxxxxyyz*v173 + D_xxxxxyyyz*v174 + D_xxxxxyyz*v152 + D_xxxxxyyzz*v175 &
      + D_xxxxyyyyz*v176 + D_xxxxyyyz*v153 + D_xxxxyyyzz*v177 + &
      D_xxxxyyz*v142 + D_xxxxyyzz*v154 + D_xxxxyyzzz*v178 + D_xxxyyyz* &
      M_xy + D_xxxyyyzz*M_xyz + D_xxxyyzz*M_xz + D_xxyyyzz*M_yz + &
      D_xxyyz*M_0 + M_xyy*v253 + M_xyyy*v252 + M_xyyz*v242 + M_xyzz* &
      v248 + M_xzz*v258 + M_xzzz*v259 + M_yy*v348 + M_yyy*v346 + M_yyyy &
      *v345 + M_yyyz*v355 + M_yyz*v327 + M_yyzz*v356 + M_yzz*v339 + &
      M_yzzz*v340 + M_zz*v357 + M_zzz*v358 + M_zzzz*v359
    D_xxyzzzzzz = -(D_xxxxyzzzz + D_xxyyyzzzz)
    v379        = 0.00138888888888889d0*D_xxyzzzzzz
    v387        = 0.00833333333333333d0*D_xxyzzzzzz
    L_xxy       = D_xxxxxxxxy*v279 + D_xxxxxxxy*v211 + D_xxxxxxxyy*v280 + D_xxxxxxxyz*v281 &
      + D_xxxxxxy*v173 + D_xxxxxxyy*v212 + D_xxxxxxyyy*v282 + &
      D_xxxxxxyyz*v283 + D_xxxxxxyz*v213 + D_xxxxxxyzz*v284 + D_xxxxxy* &
      v152 + D_xxxxxyy*v174 + D_xxxxxyyy*v214 + D_xxxxxyyyy*v285 + &
      D_xxxxxyyyz*v286 + D_xxxxxyyz*v215 + D_xxxxxyyzz*v287 + D_xxxxxyz &
      *v175 + D_xxxxxyzz*v216 + D_xxxxxyzzz*v288 + D_xxxxy*v142 + &
      D_xxxxyy*v153 + D_xxxxyyy*v176 + D_xxxxyyyy*v217 + D_xxxxyyyyy* &
      v289 + D_xxxxyyyyz*v290 + D_xxxxyyyz*v218 + D_xxxxyyyzz*v291 + &
      D_xxxxyyz*v177 + D_xxxxyyzz*v219 + D_xxxxyyzzz*v292 + D_xxxxyz* &
      v154 + D_xxxxyzz*v178 + D_xxxxyzzz*v220 + D_xxxxyzzzz*v293 + &
      D_xxxyy*M_xy + D_xxxyyz*M_xyz + D_xxxyz*M_xz + D_xxy*M_0 + &
      D_xxyyz*M_yz + M_xyy*v260 + M_xyyy*v261 + M_xyyyy*v262 + M_xyyyyy &
      *v263 + M_xyyyyz*v264 + M_xyyyz*v265 + M_xyyyzz*v266 + M_xyyz* &
      v267 + M_xyyzz*v268 + M_xyyzzz*v269 + M_xyzz*v255 + M_xyzzz*v256 &
      + M_xyzzzz*v257 + M_xzz*v270 + M_xzzz*v271 + M_xzzzz*v272 + &
      M_xzzzzz*v273 + M_yy*v360 + M_yyy*v361 + M_yyyy*v362 + M_yyyyy* &
      v363 + M_yyyyyy*v364 + M_yyyyyz*v365 + M_yyyyz*v366 + M_yyyyzz* &
      v367 + M_yyyz*v368 + M_yyyzz*v369 + M_yyyzzz*v370 + M_yyz*v371 + &
      M_yyzz*v372 + M_yyzzz*v373 + M_yyzzzz*v374 + M_yzz*v351 + M_yzzz* &
      v352 + M_yzzzz*v353 + M_yzzzzz*v354 + M_zz*v375 + M_zzz*v376 + &
      M_zzzz*v377 + M_zzzzz*v378 + M_zzzzzz*v379
    L_xxyz      = D_xxxxxxxyz*v211 + D_xxxxxxyyz*v212 + D_xxxxxxyz*v173 + D_xxxxxxyzz*v213 &
      + D_xxxxxyyyz*v214 + D_xxxxxyyz*v174 + D_xxxxxyyzz*v215 + &
      D_xxxxxyz*v152 + D_xxxxxyzz*v175 + D_xxxxxyzzz*v216 + D_xxxxyyyyz &
      *v217 + D_xxxxyyyz*v176 + D_xxxxyyyzz*v218 + D_xxxxyyz*v153 + &
      D_xxxxyyzz*v177 + D_xxxxyyzzz*v219 + D_xxxxyz*v142 + D_xxxxyzz* &
      v154 + D_xxxxyzzz*v178 + D_xxxxyzzzz*v220 + D_xxxyyz*M_xy + &
      D_xxxyyzz*M_xyz + D_xxxyzz*M_xz + D_xxyyzz*M_yz + D_xxyz*M_0 + &
      M_xyy*v267 + M_xyyy*v265 + M_xyyyy*v264 + M_xyyyz*v274 + M_xyyz* &
      v246 + M_xyyzz*v275 + M_xyzz*v258 + M_xyzzz*v259 + M_xzz*v276 + &
      M_xzzz*v277 + M_xzzzz*v278 + M_yy*v371 + M_yyy*v368 + M_yyyy*v366 &
      + M_yyyyy*v365 + M_yyyyz*v380 + M_yyyz*v381 + M_yyyzz*v350 + &
      M_yyz*v336 + M_yyzz*v382 + M_yyzzz*v383 + M_yzz*v357 + M_yzzz* &
      v358 + M_yzzzz*v359 + M_zz*v384 + M_zzz*v385 + M_zzzz*v386 + &
      M_zzzzz*v387
    D_xxzzzzzzz = -(D_xxxxzzzzz + D_xxyyzzzzz)
    v435        = 0.000198412698412698d0*D_xxzzzzzzz
    v448        = 0.00138888888888889d0*D_xxzzzzzzz
    L_xx        = D_xx*M_0 + D_xxxx*v142 + D_xxxxx*v152 + D_xxxxxx*v173 + D_xxxxxxx*v211 + &
      D_xxxxxxxx*v279 + D_xxxxxxxxx*v388 + D_xxxxxxxxy*v389 + &
      D_xxxxxxxxz*v390 + D_xxxxxxxy*v280 + D_xxxxxxxyy*v391 + &
      D_xxxxxxxyz*v392 + D_xxxxxxxz*v281 + D_xxxxxxxzz*v393 + D_xxxxxxy &
      *v212 + D_xxxxxxyy*v282 + D_xxxxxxyyy*v394 + D_xxxxxxyyz*v395 + &
      D_xxxxxxyz*v283 + D_xxxxxxyzz*v396 + D_xxxxxxz*v213 + D_xxxxxxzz* &
      v284 + D_xxxxxxzzz*v397 + D_xxxxxy*v174 + D_xxxxxyy*v214 + &
      D_xxxxxyyy*v285 + D_xxxxxyyyy*v398 + D_xxxxxyyyz*v399 + &
      D_xxxxxyyz*v286 + D_xxxxxyyzz*v400 + D_xxxxxyz*v215 + D_xxxxxyzz* &
      v287 + D_xxxxxyzzz*v401 + D_xxxxxz*v175 + D_xxxxxzz*v216 + &
      D_xxxxxzzz*v288 + D_xxxxxzzzz*v402 + D_xxxxy*v153 + D_xxxxyy*v176 &
      + D_xxxxyyy*v217 + D_xxxxyyyy*v289 + D_xxxxyyyyy*v403 + &
      D_xxxxyyyyz*v404 + D_xxxxyyyz*v290 + D_xxxxyyyzz*v405 + D_xxxxyyz &
      *v218 + D_xxxxyyzz*v291 + D_xxxxyyzzz*v406 + D_xxxxyz*v177 + &
      D_xxxxyzz*v219 + D_xxxxyzzz*v292 + D_xxxxyzzzz*v407 + D_xxxxz* &
      v154 + D_xxxxzz*v178 + D_xxxxzzz*v220 + D_xxxxzzzz*v293 + &
      D_xxxxzzzzz*v408 + D_xxxy*M_xy + D_xxxyz*M_xyz + D_xxxz*M_xz + &
      D_xxyz*M_yz + M_xyy*v294 + M_xyyy*v295 + M_xyyyy*v296 + M_xyyyyy* &
      v297 + M_xyyyyyy*v298 + M_xyyyyyz*v299 + M_xyyyyz*v300 + &
      M_xyyyyzz*v301 + M_xyyyz*v302 + M_xyyyzz*v303 + M_xyyyzzz*v304 + &
      M_xyyz*v305 + M_xyyzz*v306 + M_xyyzzz*v307 + M_xyyzzzz*v308 + &
      M_xyzz*v270 + M_xyzzz*v271 + M_xyzzzz*v272 + M_xyzzzzz*v273 + &
      M_xzz*v309 + M_xzzz*v310 + M_xzzzz*v311 + M_xzzzzz*v312 + &
      M_xzzzzzz*v313 + M_yy*v409 + M_yyy*v410 + M_yyyy*v411 + M_yyyyy* &
      v412 + M_yyyyyy*v413 + M_yyyyyyy*v414 + M_yyyyyyz*v415 + M_yyyyyz &
      *v416 + M_yyyyyzz*v417 + M_yyyyz*v418 + M_yyyyzz*v419 + M_yyyyzzz &
      *v420 + M_yyyz*v421 + M_yyyzz*v422 + M_yyyzzz*v423 + M_yyyzzzz* &
      v424 + M_yyz*v425 + M_yyzz*v426 + M_yyzzz*v427 + M_yyzzzz*v428 + &
      M_yyzzzzz*v429 + M_yzz*v375 + M_yzzz*v376 + M_yzzzz*v377 + &
      M_yzzzzz*v378 + M_yzzzzzz*v379 + M_zz*v430 + M_zzz*v431 + M_zzzz* &
      v432 + M_zzzzz*v433 + M_zzzzzz*v434 + M_zzzzzzz*v435
    L_xxz       = D_xxxxxxxxz*v279 + D_xxxxxxxyz*v280 + D_xxxxxxxz*v211 + D_xxxxxxxzz*v281 &
      + D_xxxxxxyyz*v282 + D_xxxxxxyz*v212 + D_xxxxxxyzz*v283 + &
      D_xxxxxxz*v173 + D_xxxxxxzz*v213 + D_xxxxxxzzz*v284 + D_xxxxxyyyz &
      *v285 + D_xxxxxyyz*v214 + D_xxxxxyyzz*v286 + D_xxxxxyz*v174 + &
      D_xxxxxyzz*v215 + D_xxxxxyzzz*v287 + D_xxxxxz*v152 + D_xxxxxzz* &
      v175 + D_xxxxxzzz*v216 + D_xxxxxzzzz*v288 + D_xxxxyyyyz*v289 + &
      D_xxxxyyyz*v217 + D_xxxxyyyzz*v290 + D_xxxxyyz*v176 + D_xxxxyyzz* &
      v218 + D_xxxxyyzzz*v291 + D_xxxxyz*v153 + D_xxxxyzz*v177 + &
      D_xxxxyzzz*v219 + D_xxxxyzzzz*v292 + D_xxxxz*v142 + D_xxxxzz*v154 &
      + D_xxxxzzz*v178 + D_xxxxzzzz*v220 + D_xxxxzzzzz*v293 + D_xxxyz* &
      M_xy + D_xxxyzz*M_xyz + D_xxxzz*M_xz + D_xxyzz*M_yz + D_xxz*M_0 + &
      M_xyy*v305 + M_xyyy*v302 + M_xyyyy*v300 + M_xyyyyy*v299 + &
      M_xyyyyz*v314 + M_xyyyz*v315 + M_xyyyzz*v269 + M_xyyz*v255 + &
      M_xyyzz*v316 + M_xyyzzz*v317 + M_xyzz*v276 + M_xyzzz*v277 + &
      M_xyzzzz*v278 + M_xzz*v318 + M_xzzz*v319 + M_xzzzz*v320 + &
      M_xzzzzz*v321 + M_yy*v425 + M_yyy*v421 + M_yyyy*v418 + M_yyyyy* &
      v416 + M_yyyyyy*v415 + M_yyyyyz*v436 + M_yyyyz*v437 + M_yyyyzz* &
      v438 + M_yyyz*v439 + M_yyyzz*v373 + M_yyyzzz*v440 + M_yyz*v351 + &
      M_yyzz*v441 + M_yyzzz*v442 + M_yyzzzz*v443 + M_yzz*v384 + M_yzzz* &
      v385 + M_yzzzz*v386 + M_yzzzzz*v387 + M_zz*v444 + M_zzz*v445 + &
      M_zzzz*v446 + M_zzzzz*v447 + M_zzzzzz*v448
    D_xyyyyyyyy = v240*v449
    L_xyyyyyyyy = D_xyyyyyyyy*M_0
    D_xyyyyyyyz = v140*(v141 - 91.0d0*v64 - 221.0d0*v68 + 273.0d0*v69)
    v453        = 0.5d0*D_xyyyyyyyz
    v458        = 0.166666666666667d0*D_xyyyyyyyz
    v467        = 0.0416666666666667d0*D_xyyyyyyyz
    v483        = 0.00833333333333333d0*D_xyyyyyyyz
    v507        = 0.00138888888888889d0*D_xyyyyyyyz
    L_xyyyyyyyz = D_xyyyyyyyz*M_0
    D_xyyyyyyzz = -(D_xxxyyyyyy + D_xyyyyyyyy)
    v451        = 0.5d0*D_xyyyyyyzz
    v460        = 0.25d0*D_xyyyyyyzz
    v469        = 0.0833333333333333d0*D_xyyyyyyzz
    v477        = 0.166666666666667d0*D_xyyyyyyzz
    v485        = 0.0208333333333333d0*D_xyyyyyyzz
    v498        = 0.0416666666666667d0*D_xyyyyyyzz
    v509        = 0.00416666666666667d0*D_xyyyyyyzz
    v528        = 0.00833333333333333d0*D_xyyyyyyzz
    L_xyyyyyy   = D_xxxyyyyyy*v142 + D_xxyyyyyyy*M_xy + D_xxyyyyyyz*M_xz + D_xyyyyyy*M_0 + &
      D_xyyyyyyyy*v450 + D_xyyyyyyyz*M_yz + M_zz*v451
    D_xyyyyyzzz = -(D_xxxyyyyyz + D_xyyyyyyyz)
    v455        = 0.166666666666667d0*D_xyyyyyzzz
    v456        = 0.5d0*D_xyyyyyzzz
    v472        = 0.0833333333333333d0*D_xyyyyyzzz
    v478        = 0.25d0*D_xyyyyyzzz
    v488        = 0.0277777777777778d0*D_xyyyyyzzz
    v512        = 0.00694444444444444d0*D_xyyyyyzzz
    v530        = 0.0208333333333333d0*D_xyyyyyzzz
    L_xyyyyy    = D_xxxxyyyyy*v152 + D_xxxyyyyy*v142 + D_xxxyyyyyy*v153 + D_xxxyyyyyz*v154 &
      + D_xxyyyyyy*M_xy + D_xxyyyyyyz*M_xyz + D_xxyyyyyz*M_xz + &
      D_xyyyyy*M_0 + D_xyyyyyyy*v450 + D_xyyyyyyyy*v452 + D_xyyyyyyz* &
      M_yz + M_xyy*v322 + M_xzz*v323 + M_yyz*v453 + M_yzz*v451 + M_zz* &
      v454 + M_zzz*v455
    L_xyyyyyz   = D_xxxyyyyyz*v142 + D_xxyyyyyyz*M_xy + D_xxyyyyyzz*M_xz + D_xyyyyyyyz* &
      v450 + D_xyyyyyyzz*M_yz + D_xyyyyyz*M_0 + M_zz*v456
    D_xyyyyzzzz = -(D_xxxyyyyzz + D_xyyyyyyzz)
    v463        = 0.0416666666666667d0*D_xyyyyzzzz
    v465        = 0.166666666666667d0*D_xyyyyzzzz
    v492        = 0.0208333333333333d0*D_xyyyyzzzz
    v501        = 0.0833333333333333d0*D_xyyyyzzzz
    v516        = 0.00694444444444444d0*D_xyyyyzzzz
    v532        = 0.0277777777777778d0*D_xyyyyzzzz
    L_xyyyy     = D_xxxxxyyyy*v173 + D_xxxxyyyy*v152 + D_xxxxyyyyy*v174 + D_xxxxyyyyz*v175 &
      + D_xxxyyyy*v142 + D_xxxyyyyy*v153 + D_xxxyyyyyy*v176 + &
      D_xxxyyyyyz*v177 + D_xxxyyyyz*v154 + D_xxxyyyyzz*v178 + D_xxyyyyy &
      *M_xy + D_xxyyyyyz*M_xyz + D_xxyyyyz*M_xz + D_xyyyy*M_0 + &
      D_xyyyyyy*v450 + D_xyyyyyyy*v452 + D_xyyyyyyyy*v457 + D_xyyyyyz* &
      M_yz + M_xyy*v324 + M_xyyy*v325 + M_xyyz*v326 + M_xyzz*v323 + &
      M_xzz*v327 + M_xzzz*v328 + M_yyyz*v458 + M_yyz*v459 + M_yyzz*v460 &
      + M_yzz*v454 + M_yzzz*v455 + M_zz*v461 + M_zzz*v462 + M_zzzz*v463
    L_xyyyyz    = D_xxxxyyyyz*v152 + D_xxxyyyyyz*v153 + D_xxxyyyyz*v142 + D_xxxyyyyzz*v154 &
      + D_xxyyyyyz*M_xy + D_xxyyyyyzz*M_xyz + D_xxyyyyzz*M_xz + &
      D_xyyyyyyyz*v452 + D_xyyyyyyz*v450 + D_xyyyyyzz*M_yz + D_xyyyyz* &
      M_0 + M_xyy*v326 + M_xzz*v329 + M_yyz*v451 + M_yzz*v456 + M_zz* &
      v464 + M_zzz*v465
    D_xyyyzzzzz = -(D_xxxyyyzzz + D_xyyyyyzzz)
    v476        = 0.00833333333333333d0*D_xyyyzzzzz
    v481        = 0.0416666666666667d0*D_xyyyzzzzz
    v521        = 0.00416666666666667d0*D_xyyyzzzzz
    v535        = 0.0208333333333333d0*D_xyyyzzzzz
    L_xyyy      = D_xxxxxxyyy*v211 + D_xxxxxyyy*v173 + D_xxxxxyyyy*v212 + D_xxxxxyyyz*v213 &
      + D_xxxxyyy*v152 + D_xxxxyyyy*v174 + D_xxxxyyyyy*v214 + &
      D_xxxxyyyyz*v215 + D_xxxxyyyz*v175 + D_xxxxyyyzz*v216 + D_xxxyyy* &
      v142 + D_xxxyyyy*v153 + D_xxxyyyyy*v176 + D_xxxyyyyyy*v217 + &
      D_xxxyyyyyz*v218 + D_xxxyyyyz*v177 + D_xxxyyyyzz*v219 + D_xxxyyyz &
      *v154 + D_xxxyyyzz*v178 + D_xxxyyyzzz*v220 + D_xxyyyy*M_xy + &
      D_xxyyyyz*M_xyz + D_xxyyyz*M_xz + D_xyyy*M_0 + D_xyyyyy*v450 + &
      D_xyyyyyy*v452 + D_xyyyyyyy*v457 + D_xyyyyyyyy*v466 + D_xyyyyz* &
      M_yz + M_xyy*v330 + M_xyyy*v331 + M_xyyyy*v332 + M_xyyyz*v333 + &
      M_xyyz*v334 + M_xyyzz*v335 + M_xyzz*v327 + M_xyzzz*v328 + M_xzz* &
      v336 + M_xzzz*v337 + M_xzzzz*v338 + M_yyyyz*v467 + M_yyyz*v468 + &
      M_yyyzz*v469 + M_yyz*v470 + M_yyzz*v471 + M_yyzzz*v472 + M_yzz* &
      v461 + M_yzzz*v462 + M_yzzzz*v463 + M_zz*v473 + M_zzz*v474 + &
      M_zzzz*v475 + M_zzzzz*v476
    L_xyyyz     = D_xxxxxyyyz*v173 + D_xxxxyyyyz*v174 + D_xxxxyyyz*v152 + D_xxxxyyyzz*v175 &
      + D_xxxyyyyyz*v176 + D_xxxyyyyz*v153 + D_xxxyyyyzz*v177 + &
      D_xxxyyyz*v142 + D_xxxyyyzz*v154 + D_xxxyyyzzz*v178 + D_xxyyyyz* &
      M_xy + D_xxyyyyzz*M_xyz + D_xxyyyzz*M_xz + D_xyyyyyyyz*v457 + &
      D_xyyyyyyz*v452 + D_xyyyyyz*v450 + D_xyyyyzz*M_yz + D_xyyyz*M_0 + &
      M_xyy*v334 + M_xyyy*v333 + M_xyyz*v323 + M_xyzz*v329 + M_xzz*v339 &
      + M_xzzz*v340 + M_yyyz*v477 + M_yyz*v454 + M_yyzz*v478 + M_yzz* &
      v464 + M_yzzz*v465 + M_zz*v479 + M_zzz*v480 + M_zzzz*v481
    D_xyyzzzzzz = -(D_xxxyyzzzz + D_xyyyyzzzz)
    v497        = 0.00138888888888889d0*D_xyyzzzzzz
    v505        = 0.00833333333333333d0*D_xyyzzzzzz
    L_xyy       = D_xxxxxxxyy*v279 + D_xxxxxxyy*v211 + D_xxxxxxyyy*v280 + D_xxxxxxyyz*v281 &
      + D_xxxxxyy*v173 + D_xxxxxyyy*v212 + D_xxxxxyyyy*v282 + &
      D_xxxxxyyyz*v283 + D_xxxxxyyz*v213 + D_xxxxxyyzz*v284 + D_xxxxyy* &
      v152 + D_xxxxyyy*v174 + D_xxxxyyyy*v214 + D_xxxxyyyyy*v285 + &
      D_xxxxyyyyz*v286 + D_xxxxyyyz*v215 + D_xxxxyyyzz*v287 + D_xxxxyyz &
      *v175 + D_xxxxyyzz*v216 + D_xxxxyyzzz*v288 + D_xxxyy*v142 + &
      D_xxxyyy*v153 + D_xxxyyyy*v176 + D_xxxyyyyy*v217 + D_xxxyyyyyy* &
      v289 + D_xxxyyyyyz*v290 + D_xxxyyyyz*v218 + D_xxxyyyyzz*v291 + &
      D_xxxyyyz*v177 + D_xxxyyyzz*v219 + D_xxxyyyzzz*v292 + D_xxxyyz* &
      v154 + D_xxxyyzz*v178 + D_xxxyyzzz*v220 + D_xxxyyzzzz*v293 + &
      D_xxyyy*M_xy + D_xxyyyz*M_xyz + D_xxyyz*M_xz + D_xyy*M_0 + &
      D_xyyyy*v450 + D_xyyyyy*v452 + D_xyyyyyy*v457 + D_xyyyyyyy*v466 + &
      D_xyyyyyyyy*v482 + D_xyyyz*M_yz + M_xyy*v341 + M_xyyy*v342 + &
      M_xyyyy*v343 + M_xyyyyy*v344 + M_xyyyyz*v345 + M_xyyyz*v346 + &
      M_xyyyzz*v347 + M_xyyz*v348 + M_xyyzz*v349 + M_xyyzzz*v350 + &
      M_xyzz*v336 + M_xyzzz*v337 + M_xyzzzz*v338 + M_xzz*v351 + M_xzzz* &
      v352 + M_xzzzz*v353 + M_xzzzzz*v354 + M_yyyyyz*v483 + M_yyyyz* &
      v484 + M_yyyyzz*v485 + M_yyyz*v486 + M_yyyzz*v487 + M_yyyzzz*v488 &
      + M_yyz*v489 + M_yyzz*v490 + M_yyzzz*v491 + M_yyzzzz*v492 + M_yzz &
      *v473 + M_yzzz*v474 + M_yzzzz*v475 + M_yzzzzz*v476 + M_zz*v493 + &
      M_zzz*v494 + M_zzzz*v495 + M_zzzzz*v496 + M_zzzzzz*v497
    L_xyyz      = D_xxxxxxyyz*v211 + D_xxxxxyyyz*v212 + D_xxxxxyyz*v173 + D_xxxxxyyzz*v213 &
      + D_xxxxyyyyz*v214 + D_xxxxyyyz*v174 + D_xxxxyyyzz*v215 + &
      D_xxxxyyz*v152 + D_xxxxyyzz*v175 + D_xxxxyyzzz*v216 + D_xxxyyyyyz &
      *v217 + D_xxxyyyyz*v176 + D_xxxyyyyzz*v218 + D_xxxyyyz*v153 + &
      D_xxxyyyzz*v177 + D_xxxyyyzzz*v219 + D_xxxyyz*v142 + D_xxxyyzz* &
      v154 + D_xxxyyzzz*v178 + D_xxxyyzzzz*v220 + D_xxyyyz*M_xy + &
      D_xxyyyzz*M_xyz + D_xxyyzz*M_xz + D_xyyyyyyyz*v466 + D_xyyyyyyz* &
      v457 + D_xyyyyyz*v452 + D_xyyyyz*v450 + D_xyyyzz*M_yz + D_xyyz* &
      M_0 + M_xyy*v348 + M_xyyy*v346 + M_xyyyy*v345 + M_xyyyz*v355 + &
      M_xyyz*v327 + M_xyyzz*v356 + M_xyzz*v339 + M_xyzzz*v340 + M_xzz* &
      v357 + M_xzzz*v358 + M_xzzzz*v359 + M_yyyyz*v498 + M_yyyz*v499 + &
      M_yyyzz*v472 + M_yyz*v461 + M_yyzz*v500 + M_yyzzz*v501 + M_yzz* &
      v479 + M_yzzz*v480 + M_yzzzz*v481 + M_zz*v502 + M_zzz*v503 + &
      M_zzzz*v504 + M_zzzzz*v505
    D_xyzzzzzzz = -(D_xxxyzzzzz + D_xyyyzzzzz)
    v527        = 0.000198412698412698d0*D_xyzzzzzzz
    v540        = 0.00138888888888889d0*D_xyzzzzzzz
    L_xy        = D_xxxxxxxxy*v388 + D_xxxxxxxy*v279 + D_xxxxxxxyy*v389 + D_xxxxxxxyz*v390 &
      + D_xxxxxxy*v211 + D_xxxxxxyy*v280 + D_xxxxxxyyy*v391 + &
      D_xxxxxxyyz*v392 + D_xxxxxxyz*v281 + D_xxxxxxyzz*v393 + D_xxxxxy* &
      v173 + D_xxxxxyy*v212 + D_xxxxxyyy*v282 + D_xxxxxyyyy*v394 + &
      D_xxxxxyyyz*v395 + D_xxxxxyyz*v283 + D_xxxxxyyzz*v396 + D_xxxxxyz &
      *v213 + D_xxxxxyzz*v284 + D_xxxxxyzzz*v397 + D_xxxxy*v152 + &
      D_xxxxyy*v174 + D_xxxxyyy*v214 + D_xxxxyyyy*v285 + D_xxxxyyyyy* &
      v398 + D_xxxxyyyyz*v399 + D_xxxxyyyz*v286 + D_xxxxyyyzz*v400 + &
      D_xxxxyyz*v215 + D_xxxxyyzz*v287 + D_xxxxyyzzz*v401 + D_xxxxyz* &
      v175 + D_xxxxyzz*v216 + D_xxxxyzzz*v288 + D_xxxxyzzzz*v402 + &
      D_xxxy*v142 + D_xxxyy*v153 + D_xxxyyy*v176 + D_xxxyyyy*v217 + &
      D_xxxyyyyy*v289 + D_xxxyyyyyy*v403 + D_xxxyyyyyz*v404 + &
      D_xxxyyyyz*v290 + D_xxxyyyyzz*v405 + D_xxxyyyz*v218 + D_xxxyyyzz* &
      v291 + D_xxxyyyzzz*v406 + D_xxxyyz*v177 + D_xxxyyzz*v219 + &
      D_xxxyyzzz*v292 + D_xxxyyzzzz*v407 + D_xxxyz*v154 + D_xxxyzz*v178 &
      + D_xxxyzzz*v220 + D_xxxyzzzz*v293 + D_xxxyzzzzz*v408 + D_xxyy* &
      M_xy + D_xxyyz*M_xyz + D_xxyz*M_xz + D_xy*M_0 + D_xyyy*v450 + &
      D_xyyyy*v452 + D_xyyyyy*v457 + D_xyyyyyy*v466 + D_xyyyyyyy*v482 + &
      D_xyyyyyyyy*v506 + D_xyyz*M_yz + M_xyy*v360 + M_xyyy*v361 + &
      M_xyyyy*v362 + M_xyyyyy*v363 + M_xyyyyyy*v364 + M_xyyyyyz*v365 + &
      M_xyyyyz*v366 + M_xyyyyzz*v367 + M_xyyyz*v368 + M_xyyyzz*v369 + &
      M_xyyyzzz*v370 + M_xyyz*v371 + M_xyyzz*v372 + M_xyyzzz*v373 + &
      M_xyyzzzz*v374 + M_xyzz*v351 + M_xyzzz*v352 + M_xyzzzz*v353 + &
      M_xyzzzzz*v354 + M_xzz*v375 + M_xzzz*v376 + M_xzzzz*v377 + &
      M_xzzzzz*v378 + M_xzzzzzz*v379 + M_yyyyyyz*v507 + M_yyyyyz*v508 + &
      M_yyyyyzz*v509 + M_yyyyz*v510 + M_yyyyzz*v511 + M_yyyyzzz*v512 + &
      M_yyyz*v513 + M_yyyzz*v514 + M_yyyzzz*v515 + M_yyyzzzz*v516 + &
      M_yyz*v517 + M_yyzz*v518 + M_yyzzz*v519 + M_yyzzzz*v520 + &
      M_yyzzzzz*v521 + M_yzz*v493 + M_yzzz*v494 + M_yzzzz*v495 + &
      M_yzzzzz*v496 + M_yzzzzzz*v497 + M_zz*v522 + M_zzz*v523 + M_zzzz* &
      v524 + M_zzzzz*v525 + M_zzzzzz*v526 + M_zzzzzzz*v527
    L_xyz       = D_xxxxxxxyz*v279 + D_xxxxxxyyz*v280 + D_xxxxxxyz*v211 + D_xxxxxxyzz*v281 &
      + D_xxxxxyyyz*v282 + D_xxxxxyyz*v212 + D_xxxxxyyzz*v283 + &
      D_xxxxxyz*v173 + D_xxxxxyzz*v213 + D_xxxxxyzzz*v284 + D_xxxxyyyyz &
      *v285 + D_xxxxyyyz*v214 + D_xxxxyyyzz*v286 + D_xxxxyyz*v174 + &
      D_xxxxyyzz*v215 + D_xxxxyyzzz*v287 + D_xxxxyz*v152 + D_xxxxyzz* &
      v175 + D_xxxxyzzz*v216 + D_xxxxyzzzz*v288 + D_xxxyyyyyz*v289 + &
      D_xxxyyyyz*v217 + D_xxxyyyyzz*v290 + D_xxxyyyz*v176 + D_xxxyyyzz* &
      v218 + D_xxxyyyzzz*v291 + D_xxxyyz*v153 + D_xxxyyzz*v177 + &
      D_xxxyyzzz*v219 + D_xxxyyzzzz*v292 + D_xxxyz*v142 + D_xxxyzz*v154 &
      + D_xxxyzzz*v178 + D_xxxyzzzz*v220 + D_xxxyzzzzz*v293 + D_xxyyz* &
      M_xy + D_xxyyzz*M_xyz + D_xxyzz*M_xz + D_xyyyyyyyz*v482 + &
      D_xyyyyyyz*v466 + D_xyyyyyz*v457 + D_xyyyyz*v452 + D_xyyyz*v450 + &
      D_xyyzz*M_yz + D_xyz*M_0 + M_xyy*v371 + M_xyyy*v368 + M_xyyyy* &
      v366 + M_xyyyyy*v365 + M_xyyyyz*v380 + M_xyyyz*v381 + M_xyyyzz* &
      v350 + M_xyyz*v336 + M_xyyzz*v382 + M_xyyzzz*v383 + M_xyzz*v357 + &
      M_xyzzz*v358 + M_xyzzzz*v359 + M_xzz*v384 + M_xzzz*v385 + M_xzzzz &
      *v386 + M_xzzzzz*v387 + M_yyyyyz*v528 + M_yyyyz*v529 + M_yyyyzz* &
      v530 + M_yyyz*v531 + M_yyyzz*v491 + M_yyyzzz*v532 + M_yyz*v473 + &
      M_yyzz*v533 + M_yyzzz*v534 + M_yyzzzz*v535 + M_yzz*v502 + M_yzzz* &
      v503 + M_yzzzz*v504 + M_yzzzzz*v505 + M_zz*v536 + M_zzz*v537 + &
      M_zzzz*v538 + M_zzzzz*v539 + M_zzzzzz*v540
    D_xzzzzzzzz = -(D_xxxzzzzzz + D_xyyzzzzzz)
    L_x         = D_x*M_0 + D_xxx*v142 + D_xxxx*v152 + D_xxxxx*v173 + D_xxxxxx*v211 + &
      D_xxxxxxx*v279 + D_xxxxxxxx*v388 + D_xxxxxxxxx*v541 + D_xxxxxxxxy &
      *v542 + D_xxxxxxxxz*v543 + D_xxxxxxxy*v389 + D_xxxxxxxyy*v544 + &
      D_xxxxxxxyz*v545 + D_xxxxxxxz*v390 + D_xxxxxxxzz*v546 + D_xxxxxxy &
      *v280 + D_xxxxxxyy*v391 + D_xxxxxxyyy*v547 + D_xxxxxxyyz*v548 + &
      D_xxxxxxyz*v392 + D_xxxxxxyzz*v549 + D_xxxxxxz*v281 + D_xxxxxxzz* &
      v393 + D_xxxxxxzzz*v550 + D_xxxxxy*v212 + D_xxxxxyy*v282 + &
      D_xxxxxyyy*v394 + D_xxxxxyyyy*v551 + D_xxxxxyyyz*v552 + &
      D_xxxxxyyz*v395 + D_xxxxxyyzz*v553 + D_xxxxxyz*v283 + D_xxxxxyzz* &
      v396 + D_xxxxxyzzz*v554 + D_xxxxxz*v213 + D_xxxxxzz*v284 + &
      D_xxxxxzzz*v397 + D_xxxxxzzzz*v555 + D_xxxxy*v174 + D_xxxxyy*v214 &
      + D_xxxxyyy*v285 + D_xxxxyyyy*v398 + D_xxxxyyyyy*v556 + &
      D_xxxxyyyyz*v557 + D_xxxxyyyz*v399 + D_xxxxyyyzz*v558 + D_xxxxyyz &
      *v286 + D_xxxxyyzz*v400 + D_xxxxyyzzz*v559 + D_xxxxyz*v215 + &
      D_xxxxyzz*v287 + D_xxxxyzzz*v401 + D_xxxxyzzzz*v560 + D_xxxxz* &
      v175 + D_xxxxzz*v216 + D_xxxxzzz*v288 + D_xxxxzzzz*v402 + &
      D_xxxxzzzzz*v561 + D_xxxy*v153 + D_xxxyy*v176 + D_xxxyyy*v217 + &
      D_xxxyyyy*v289 + D_xxxyyyyy*v403 + D_xxxyyyyyy*v562 + D_xxxyyyyyz &
      *v563 + D_xxxyyyyz*v404 + D_xxxyyyyzz*v564 + D_xxxyyyz*v290 + &
      D_xxxyyyzz*v405 + D_xxxyyyzzz*v565 + D_xxxyyz*v218 + D_xxxyyzz* &
      v291 + D_xxxyyzzz*v406 + D_xxxyyzzzz*v566 + D_xxxyz*v177 + &
      D_xxxyzz*v219 + D_xxxyzzz*v292 + D_xxxyzzzz*v407 + D_xxxyzzzzz* &
      v567 + D_xxxz*v154 + D_xxxzz*v178 + D_xxxzzz*v220 + D_xxxzzzz* &
      v293 + D_xxxzzzzz*v408 + D_xxxzzzzzz*v568 + D_xxy*M_xy + D_xxyz* &
      M_xyz + D_xxz*M_xz + D_xyy*v450 + D_xyyy*v452 + D_xyyyy*v457 + &
      D_xyyyyy*v466 + D_xyyyyyy*v482 + D_xyyyyyyy*v506 + D_xyyyyyyyy* &
      v569 + D_xyyyyyyyz*v570 + D_xyyyyyyz*v571 + D_xyyyyyyzz*v572 + &
      D_xyyyyyz*v573 + D_xyyyyyzz*v574 + D_xyyyyyzzz*v575 + D_xyyyyz* &
      v576 + D_xyyyyzz*v577 + D_xyyyyzzz*v578 + D_xyyyyzzzz*v579 + &
      D_xyyyz*v580 + D_xyyyzz*v581 + D_xyyyzzz*v582 + D_xyyyzzzz*v583 + &
      D_xyyyzzzzz*v584 + D_xyyz*v585 + D_xyyzz*v586 + D_xyyzzz*v587 + &
      D_xyyzzzz*v588 + D_xyyzzzzz*v589 + D_xyyzzzzzz*v590 + D_xyz*M_yz &
      + D_xzz*v591 + D_xzzz*v592 + D_xzzzz*v593 + D_xzzzzz*v594 + &
      D_xzzzzzz*v595 + D_xzzzzzzz*v596 + D_xzzzzzzzz*v597 + M_xyy*v409 &
      + M_xyyy*v410 + M_xyyyy*v411 + M_xyyyyy*v412 + M_xyyyyyy*v413 + &
      M_xyyyyyyy*v414 + M_xyyyyyyz*v415 + M_xyyyyyz*v416 + M_xyyyyyzz* &
      v417 + M_xyyyyz*v418 + M_xyyyyzz*v419 + M_xyyyyzzz*v420 + M_xyyyz &
      *v421 + M_xyyyzz*v422 + M_xyyyzzz*v423 + M_xyyyzzzz*v424 + M_xyyz &
      *v425 + M_xyyzz*v426 + M_xyyzzz*v427 + M_xyyzzzz*v428 + &
      M_xyyzzzzz*v429 + M_xyzz*v375 + M_xyzzz*v376 + M_xyzzzz*v377 + &
      M_xyzzzzz*v378 + M_xyzzzzzz*v379 + M_xzz*v430 + M_xzzz*v431 + &
      M_xzzzz*v432 + M_xzzzzz*v433 + M_xzzzzzz*v434 + M_xzzzzzzz*v435 + &
      M_yzz*v522 + M_yzzz*v523 + M_yzzzz*v524 + M_yzzzzz*v525 + &
      M_yzzzzzz*v526 + M_yzzzzzzz*v527
    L_xz        = D_xxxxxxxxz*v388 + D_xxxxxxxyz*v389 + D_xxxxxxxz*v279 + D_xxxxxxxzz*v390 &
      + D_xxxxxxyyz*v391 + D_xxxxxxyz*v280 + D_xxxxxxyzz*v392 + &
      D_xxxxxxz*v211 + D_xxxxxxzz*v281 + D_xxxxxxzzz*v393 + D_xxxxxyyyz &
      *v394 + D_xxxxxyyz*v282 + D_xxxxxyyzz*v395 + D_xxxxxyz*v212 + &
      D_xxxxxyzz*v283 + D_xxxxxyzzz*v396 + D_xxxxxz*v173 + D_xxxxxzz* &
      v213 + D_xxxxxzzz*v284 + D_xxxxxzzzz*v397 + D_xxxxyyyyz*v398 + &
      D_xxxxyyyz*v285 + D_xxxxyyyzz*v399 + D_xxxxyyz*v214 + D_xxxxyyzz* &
      v286 + D_xxxxyyzzz*v400 + D_xxxxyz*v174 + D_xxxxyzz*v215 + &
      D_xxxxyzzz*v287 + D_xxxxyzzzz*v401 + D_xxxxz*v152 + D_xxxxzz*v175 &
      + D_xxxxzzz*v216 + D_xxxxzzzz*v288 + D_xxxxzzzzz*v402 + &
      D_xxxyyyyyz*v403 + D_xxxyyyyz*v289 + D_xxxyyyyzz*v404 + D_xxxyyyz &
      *v217 + D_xxxyyyzz*v290 + D_xxxyyyzzz*v405 + D_xxxyyz*v176 + &
      D_xxxyyzz*v218 + D_xxxyyzzz*v291 + D_xxxyyzzzz*v406 + D_xxxyz* &
      v153 + D_xxxyzz*v177 + D_xxxyzzz*v219 + D_xxxyzzzz*v292 + &
      D_xxxyzzzzz*v407 + D_xxxz*v142 + D_xxxzz*v154 + D_xxxzzz*v178 + &
      D_xxxzzzz*v220 + D_xxxzzzzz*v293 + D_xxxzzzzzz*v408 + D_xxyz*M_xy &
      + D_xxyzz*M_xyz + D_xxzz*M_xz + D_xyyyyyyyz*v506 + D_xyyyyyyz* &
      v482 + D_xyyyyyyzz*v571 + D_xyyyyyz*v466 + D_xyyyyyzz*v573 + &
      D_xyyyyyzzz*v574 + D_xyyyyz*v457 + D_xyyyyzz*v576 + D_xyyyyzzz* &
      v577 + D_xyyyyzzzz*v578 + D_xyyyz*v452 + D_xyyyzz*v580 + &
      D_xyyyzzz*v581 + D_xyyyzzzz*v582 + D_xyyyzzzzz*v583 + D_xyyz*v450 &
      + D_xyyzz*v585 + D_xyyzzz*v586 + D_xyyzzzz*v587 + D_xyyzzzzz*v588 &
      + D_xyyzzzzzz*v589 + D_xyzz*M_yz + D_xz*M_0 + D_xzzz*v591 + &
      D_xzzzz*v592 + D_xzzzzz*v593 + D_xzzzzzz*v594 + D_xzzzzzzz*v595 + &
      D_xzzzzzzzz*v596 + M_xyy*v425 + M_xyyy*v421 + M_xyyyy*v418 + &
      M_xyyyyy*v416 + M_xyyyyyy*v415 + M_xyyyyyz*v436 + M_xyyyyz*v437 + &
      M_xyyyyzz*v438 + M_xyyyz*v439 + M_xyyyzz*v373 + M_xyyyzzz*v440 + &
      M_xyyz*v351 + M_xyyzz*v441 + M_xyyzzz*v442 + M_xyyzzzz*v443 + &
      M_xyzz*v384 + M_xyzzz*v385 + M_xyzzzz*v386 + M_xyzzzzz*v387 + &
      M_xzz*v444 + M_xzzz*v445 + M_xzzzz*v446 + M_xzzzzz*v447 + &
      M_xzzzzzz*v448 + M_yzz*v536 + M_yzzz*v537 + M_yzzzz*v538 + &
      M_yzzzzz*v539 + M_yzzzzzz*v540
    D_yyyyyyyyy = v190*(v134 + 4620.0d0*v120 - 18018.0d0*v126 - 12155.0d0*v130 + 25740.0d0 &
      *v131)
    L_yyyyyyyyy = D_yyyyyyyyy*M_0
    D_yyyyyyyyz = v138*v449
    L_yyyyyyyyz = D_yyyyyyyyz*M_0
    D_yyyyyyyzz = -(D_xxyyyyyyy + D_yyyyyyyyy)
    L_yyyyyyy   = D_xxyyyyyyy*v142 + D_xyyyyyyyy*M_xy + D_xyyyyyyyz*M_xz + D_yyyyyyy*M_0 + &
      D_yyyyyyyyy*v450 + D_yyyyyyyyz*M_yz + D_yyyyyyyzz*v591
    D_yyyyyyzzz = -(D_xxyyyyyyz + D_yyyyyyyyz)
    L_yyyyyy    = D_xxxyyyyyy*v152 + D_xxyyyyyy*v142 + D_xxyyyyyyy*v153 + D_xxyyyyyyz*v154 &
      + D_xyyyyyyy*M_xy + D_xyyyyyyyy*v598 + D_xyyyyyyyz*M_xyz + &
      D_xyyyyyyz*M_xz + D_yyyyyy*M_0 + D_yyyyyyyy*v450 + D_yyyyyyyyy* &
      v452 + D_yyyyyyyyz*v585 + D_yyyyyyyz*M_yz + D_yyyyyyyzz*v599 + &
      D_yyyyyyzz*v591 + D_yyyyyyzzz*v592 + M_xzz*v451
    L_yyyyyyz   = D_xxyyyyyyz*v142 + D_xyyyyyyyz*M_xy + D_xyyyyyyzz*M_xz + D_yyyyyyyyz* &
      v450 + D_yyyyyyyzz*M_yz + D_yyyyyyz*M_0 + D_yyyyyyzzz*v591
    D_yyyyyzzzz = -(D_xxyyyyyzz + D_yyyyyyyzz)
    L_yyyyy     = D_xxxxyyyyy*v173 + D_xxxyyyyy*v152 + D_xxxyyyyyy*v174 + D_xxxyyyyyz*v175 &
      + D_xxyyyyy*v142 + D_xxyyyyyy*v153 + D_xxyyyyyyy*v176 + &
      D_xxyyyyyyz*v177 + D_xxyyyyyz*v154 + D_xxyyyyyzz*v178 + D_xyyyyyy &
      *M_xy + D_xyyyyyyy*v598 + D_xyyyyyyyy*v600 + D_xyyyyyyz*M_xyz + &
      D_xyyyyyz*M_xz + D_yyyyy*M_0 + D_yyyyyyy*v450 + D_yyyyyyyy*v452 + &
      D_yyyyyyyyy*v457 + D_yyyyyyyyz*v580 + D_yyyyyyyz*v585 + &
      D_yyyyyyyzz*v586 + D_yyyyyyz*M_yz + D_yyyyyyzz*v599 + D_yyyyyyzzz &
      *v601 + D_yyyyyzz*v591 + D_yyyyyzzz*v592 + D_yyyyyzzzz*v593 + &
      M_xyyz*v453 + M_xyzz*v451 + M_xzz*v454 + M_xzzz*v455
    L_yyyyyz    = D_xxxyyyyyz*v152 + D_xxyyyyyyz*v153 + D_xxyyyyyz*v142 + D_xxyyyyyzz*v154 &
      + D_xyyyyyyyz*v598 + D_xyyyyyyz*M_xy + D_xyyyyyyzz*M_xyz + &
      D_xyyyyyzz*M_xz + D_yyyyyyyyz*v452 + D_yyyyyyyz*v450 + &
      D_yyyyyyyzz*v585 + D_yyyyyyzz*M_yz + D_yyyyyyzzz*v599 + D_yyyyyz* &
      M_0 + D_yyyyyzzz*v591 + D_yyyyyzzzz*v592 + M_xzz*v456
    D_yyyyzzzzz = -(D_xxyyyyzzz + D_yyyyyyzzz)
    L_yyyy      = D_xxxxxyyyy*v211 + D_xxxxyyyy*v173 + D_xxxxyyyyy*v212 + D_xxxxyyyyz*v213 &
      + D_xxxyyyy*v152 + D_xxxyyyyy*v174 + D_xxxyyyyyy*v214 + &
      D_xxxyyyyyz*v215 + D_xxxyyyyz*v175 + D_xxxyyyyzz*v216 + D_xxyyyy* &
      v142 + D_xxyyyyy*v153 + D_xxyyyyyy*v176 + D_xxyyyyyyy*v217 + &
      D_xxyyyyyyz*v218 + D_xxyyyyyz*v177 + D_xxyyyyyzz*v219 + D_xxyyyyz &
      *v154 + D_xxyyyyzz*v178 + D_xxyyyyzzz*v220 + D_xyyyyy*M_xy + &
      D_xyyyyyy*v598 + D_xyyyyyyy*v600 + D_xyyyyyyyy*v602 + D_xyyyyyz* &
      M_xyz + D_xyyyyz*M_xz + D_yyyy*M_0 + D_yyyyyy*v450 + D_yyyyyyy* &
      v452 + D_yyyyyyyy*v457 + D_yyyyyyyyy*v466 + D_yyyyyyyyz*v576 + &
      D_yyyyyyyz*v580 + D_yyyyyyyzz*v581 + D_yyyyyyz*v585 + D_yyyyyyzz* &
      v586 + D_yyyyyyzzz*v587 + D_yyyyyz*M_yz + D_yyyyyzz*v599 + &
      D_yyyyyzzz*v601 + D_yyyyyzzzz*v603 + D_yyyyzz*v591 + D_yyyyzzz* &
      v592 + D_yyyyzzzz*v593 + D_yyyyzzzzz*v594 + M_xyyyz*v458 + M_xyyz &
      *v459 + M_xyyzz*v460 + M_xyzz*v454 + M_xyzzz*v455 + M_xzz*v461 + &
      M_xzzz*v462 + M_xzzzz*v463
    L_yyyyz     = D_xxxxyyyyz*v173 + D_xxxyyyyyz*v174 + D_xxxyyyyz*v152 + D_xxxyyyyzz*v175 &
      + D_xxyyyyyyz*v176 + D_xxyyyyyz*v153 + D_xxyyyyyzz*v177 + &
      D_xxyyyyz*v142 + D_xxyyyyzz*v154 + D_xxyyyyzzz*v178 + D_xyyyyyyyz &
      *v600 + D_xyyyyyyz*v598 + D_xyyyyyz*M_xy + D_xyyyyyzz*M_xyz + &
      D_xyyyyzz*M_xz + D_yyyyyyyyz*v457 + D_yyyyyyyz*v452 + D_yyyyyyyzz &
      *v580 + D_yyyyyyz*v450 + D_yyyyyyzz*v585 + D_yyyyyyzzz*v586 + &
      D_yyyyyzz*M_yz + D_yyyyyzzz*v599 + D_yyyyyzzzz*v601 + D_yyyyz*M_0 &
      + D_yyyyzzz*v591 + D_yyyyzzzz*v592 + D_yyyyzzzzz*v593 + M_xyyz* &
      v451 + M_xyzz*v456 + M_xzz*v464 + M_xzzz*v465
    D_yyyzzzzzz = -(D_xxyyyzzzz + D_yyyyyzzzz)
    L_yyy       = D_xxxxxxyyy*v279 + D_xxxxxyyy*v211 + D_xxxxxyyyy*v280 + D_xxxxxyyyz*v281 &
      + D_xxxxyyy*v173 + D_xxxxyyyy*v212 + D_xxxxyyyyy*v282 + &
      D_xxxxyyyyz*v283 + D_xxxxyyyz*v213 + D_xxxxyyyzz*v284 + D_xxxyyy* &
      v152 + D_xxxyyyy*v174 + D_xxxyyyyy*v214 + D_xxxyyyyyy*v285 + &
      D_xxxyyyyyz*v286 + D_xxxyyyyz*v215 + D_xxxyyyyzz*v287 + D_xxxyyyz &
      *v175 + D_xxxyyyzz*v216 + D_xxxyyyzzz*v288 + D_xxyyy*v142 + &
      D_xxyyyy*v153 + D_xxyyyyy*v176 + D_xxyyyyyy*v217 + D_xxyyyyyyy* &
      v289 + D_xxyyyyyyz*v290 + D_xxyyyyyz*v218 + D_xxyyyyyzz*v291 + &
      D_xxyyyyz*v177 + D_xxyyyyzz*v219 + D_xxyyyyzzz*v292 + D_xxyyyz* &
      v154 + D_xxyyyzz*v178 + D_xxyyyzzz*v220 + D_xxyyyzzzz*v293 + &
      D_xyyyy*M_xy + D_xyyyyy*v598 + D_xyyyyyy*v600 + D_xyyyyyyy*v602 + &
      D_xyyyyyyyy*v604 + D_xyyyyz*M_xyz + D_xyyyz*M_xz + D_yyy*M_0 + &
      D_yyyyy*v450 + D_yyyyyy*v452 + D_yyyyyyy*v457 + D_yyyyyyyy*v466 + &
      D_yyyyyyyyy*v482 + D_yyyyyyyyz*v573 + D_yyyyyyyz*v576 + &
      D_yyyyyyyzz*v577 + D_yyyyyyz*v580 + D_yyyyyyzz*v581 + D_yyyyyyzzz &
      *v582 + D_yyyyyz*v585 + D_yyyyyzz*v586 + D_yyyyyzzz*v587 + &
      D_yyyyyzzzz*v588 + D_yyyyz*M_yz + D_yyyyzz*v599 + D_yyyyzzz*v601 &
      + D_yyyyzzzz*v603 + D_yyyyzzzzz*v605 + D_yyyzz*v591 + D_yyyzzz* &
      v592 + D_yyyzzzz*v593 + D_yyyzzzzz*v594 + D_yyyzzzzzz*v595 + &
      M_xyyyyz*v467 + M_xyyyz*v468 + M_xyyyzz*v469 + M_xyyz*v470 + &
      M_xyyzz*v471 + M_xyyzzz*v472 + M_xyzz*v461 + M_xyzzz*v462 + &
      M_xyzzzz*v463 + M_xzz*v473 + M_xzzz*v474 + M_xzzzz*v475 + &
      M_xzzzzz*v476
    L_yyyz      = D_xxxxxyyyz*v211 + D_xxxxyyyyz*v212 + D_xxxxyyyz*v173 + D_xxxxyyyzz*v213 &
      + D_xxxyyyyyz*v214 + D_xxxyyyyz*v174 + D_xxxyyyyzz*v215 + &
      D_xxxyyyz*v152 + D_xxxyyyzz*v175 + D_xxxyyyzzz*v216 + D_xxyyyyyyz &
      *v217 + D_xxyyyyyz*v176 + D_xxyyyyyzz*v218 + D_xxyyyyz*v153 + &
      D_xxyyyyzz*v177 + D_xxyyyyzzz*v219 + D_xxyyyz*v142 + D_xxyyyzz* &
      v154 + D_xxyyyzzz*v178 + D_xxyyyzzzz*v220 + D_xyyyyyyyz*v602 + &
      D_xyyyyyyz*v600 + D_xyyyyyz*v598 + D_xyyyyz*M_xy + D_xyyyyzz* &
      M_xyz + D_xyyyzz*M_xz + D_yyyyyyyyz*v466 + D_yyyyyyyz*v457 + &
      D_yyyyyyyzz*v576 + D_yyyyyyz*v452 + D_yyyyyyzz*v580 + D_yyyyyyzzz &
      *v581 + D_yyyyyz*v450 + D_yyyyyzz*v585 + D_yyyyyzzz*v586 + &
      D_yyyyyzzzz*v587 + D_yyyyzz*M_yz + D_yyyyzzz*v599 + D_yyyyzzzz* &
      v601 + D_yyyyzzzzz*v603 + D_yyyz*M_0 + D_yyyzzz*v591 + D_yyyzzzz* &
      v592 + D_yyyzzzzz*v593 + D_yyyzzzzzz*v594 + M_xyyyz*v477 + M_xyyz &
      *v454 + M_xyyzz*v478 + M_xyzz*v464 + M_xyzzz*v465 + M_xzz*v479 + &
      M_xzzz*v480 + M_xzzzz*v481
    D_yyzzzzzzz = -(D_xxyyzzzzz + D_yyyyzzzzz)
    L_yy        = D_xxxxxxxyy*v388 + D_xxxxxxyy*v279 + D_xxxxxxyyy*v389 + D_xxxxxxyyz*v390 &
      + D_xxxxxyy*v211 + D_xxxxxyyy*v280 + D_xxxxxyyyy*v391 + &
      D_xxxxxyyyz*v392 + D_xxxxxyyz*v281 + D_xxxxxyyzz*v393 + D_xxxxyy* &
      v173 + D_xxxxyyy*v212 + D_xxxxyyyy*v282 + D_xxxxyyyyy*v394 + &
      D_xxxxyyyyz*v395 + D_xxxxyyyz*v283 + D_xxxxyyyzz*v396 + D_xxxxyyz &
      *v213 + D_xxxxyyzz*v284 + D_xxxxyyzzz*v397 + D_xxxyy*v152 + &
      D_xxxyyy*v174 + D_xxxyyyy*v214 + D_xxxyyyyy*v285 + D_xxxyyyyyy* &
      v398 + D_xxxyyyyyz*v399 + D_xxxyyyyz*v286 + D_xxxyyyyzz*v400 + &
      D_xxxyyyz*v215 + D_xxxyyyzz*v287 + D_xxxyyyzzz*v401 + D_xxxyyz* &
      v175 + D_xxxyyzz*v216 + D_xxxyyzzz*v288 + D_xxxyyzzzz*v402 + &
      D_xxyy*v142 + D_xxyyy*v153 + D_xxyyyy*v176 + D_xxyyyyy*v217 + &
      D_xxyyyyyy*v289 + D_xxyyyyyyy*v403 + D_xxyyyyyyz*v404 + &
      D_xxyyyyyz*v290 + D_xxyyyyyzz*v405 + D_xxyyyyz*v218 + D_xxyyyyzz* &
      v291 + D_xxyyyyzzz*v406 + D_xxyyyz*v177 + D_xxyyyzz*v219 + &
      D_xxyyyzzz*v292 + D_xxyyyzzzz*v407 + D_xxyyz*v154 + D_xxyyzz*v178 &
      + D_xxyyzzz*v220 + D_xxyyzzzz*v293 + D_xxyyzzzzz*v408 + D_xyyy* &
      M_xy + D_xyyyy*v598 + D_xyyyyy*v600 + D_xyyyyyy*v602 + D_xyyyyyyy &
      *v604 + D_xyyyyyyyy*v606 + D_xyyyz*M_xyz + D_xyyz*M_xz + D_yy*M_0 &
      + D_yyyy*v450 + D_yyyyy*v452 + D_yyyyyy*v457 + D_yyyyyyy*v466 + &
      D_yyyyyyyy*v482 + D_yyyyyyyyy*v506 + D_yyyyyyyyz*v571 + &
      D_yyyyyyyz*v573 + D_yyyyyyyzz*v574 + D_yyyyyyz*v576 + D_yyyyyyzz* &
      v577 + D_yyyyyyzzz*v578 + D_yyyyyz*v580 + D_yyyyyzz*v581 + &
      D_yyyyyzzz*v582 + D_yyyyyzzzz*v583 + D_yyyyz*v585 + D_yyyyzz*v586 &
      + D_yyyyzzz*v587 + D_yyyyzzzz*v588 + D_yyyyzzzzz*v589 + D_yyyz* &
      M_yz + D_yyyzz*v599 + D_yyyzzz*v601 + D_yyyzzzz*v603 + D_yyyzzzzz &
      *v605 + D_yyyzzzzzz*v607 + D_yyzz*v591 + D_yyzzz*v592 + D_yyzzzz* &
      v593 + D_yyzzzzz*v594 + D_yyzzzzzz*v595 + D_yyzzzzzzz*v596 + &
      M_xyyyyyz*v483 + M_xyyyyz*v484 + M_xyyyyzz*v485 + M_xyyyz*v486 + &
      M_xyyyzz*v487 + M_xyyyzzz*v488 + M_xyyz*v489 + M_xyyzz*v490 + &
      M_xyyzzz*v491 + M_xyyzzzz*v492 + M_xyzz*v473 + M_xyzzz*v474 + &
      M_xyzzzz*v475 + M_xyzzzzz*v476 + M_xzz*v493 + M_xzzz*v494 + &
      M_xzzzz*v495 + M_xzzzzz*v496 + M_xzzzzzz*v497
    L_yyz       = D_xxxxxxyyz*v279 + D_xxxxxyyyz*v280 + D_xxxxxyyz*v211 + D_xxxxxyyzz*v281 &
      + D_xxxxyyyyz*v282 + D_xxxxyyyz*v212 + D_xxxxyyyzz*v283 + &
      D_xxxxyyz*v173 + D_xxxxyyzz*v213 + D_xxxxyyzzz*v284 + D_xxxyyyyyz &
      *v285 + D_xxxyyyyz*v214 + D_xxxyyyyzz*v286 + D_xxxyyyz*v174 + &
      D_xxxyyyzz*v215 + D_xxxyyyzzz*v287 + D_xxxyyz*v152 + D_xxxyyzz* &
      v175 + D_xxxyyzzz*v216 + D_xxxyyzzzz*v288 + D_xxyyyyyyz*v289 + &
      D_xxyyyyyz*v217 + D_xxyyyyyzz*v290 + D_xxyyyyz*v176 + D_xxyyyyzz* &
      v218 + D_xxyyyyzzz*v291 + D_xxyyyz*v153 + D_xxyyyzz*v177 + &
      D_xxyyyzzz*v219 + D_xxyyyzzzz*v292 + D_xxyyz*v142 + D_xxyyzz*v154 &
      + D_xxyyzzz*v178 + D_xxyyzzzz*v220 + D_xxyyzzzzz*v293 + &
      D_xyyyyyyyz*v604 + D_xyyyyyyz*v602 + D_xyyyyyz*v600 + D_xyyyyz* &
      v598 + D_xyyyz*M_xy + D_xyyyzz*M_xyz + D_xyyzz*M_xz + D_yyyyyyyyz &
      *v482 + D_yyyyyyyz*v466 + D_yyyyyyyzz*v573 + D_yyyyyyz*v457 + &
      D_yyyyyyzz*v576 + D_yyyyyyzzz*v577 + D_yyyyyz*v452 + D_yyyyyzz* &
      v580 + D_yyyyyzzz*v581 + D_yyyyyzzzz*v582 + D_yyyyz*v450 + &
      D_yyyyzz*v585 + D_yyyyzzz*v586 + D_yyyyzzzz*v587 + D_yyyyzzzzz* &
      v588 + D_yyyzz*M_yz + D_yyyzzz*v599 + D_yyyzzzz*v601 + D_yyyzzzzz &
      *v603 + D_yyyzzzzzz*v605 + D_yyz*M_0 + D_yyzzz*v591 + D_yyzzzz* &
      v592 + D_yyzzzzz*v593 + D_yyzzzzzz*v594 + D_yyzzzzzzz*v595 + &
      M_xyyyyz*v498 + M_xyyyz*v499 + M_xyyyzz*v472 + M_xyyz*v461 + &
      M_xyyzz*v500 + M_xyyzzz*v501 + M_xyzz*v479 + M_xyzzz*v480 + &
      M_xyzzzz*v481 + M_xzz*v502 + M_xzzz*v503 + M_xzzzz*v504 + &
      M_xzzzzz*v505
    D_yzzzzzzzz = -(D_xxyzzzzzz + D_yyyzzzzzz)
    L_y         = D_xxxxxxxxy*v541 + D_xxxxxxxy*v388 + D_xxxxxxxyy*v542 + D_xxxxxxxyz*v543 &
      + D_xxxxxxy*v279 + D_xxxxxxyy*v389 + D_xxxxxxyyy*v544 + &
      D_xxxxxxyyz*v545 + D_xxxxxxyz*v390 + D_xxxxxxyzz*v546 + D_xxxxxy* &
      v211 + D_xxxxxyy*v280 + D_xxxxxyyy*v391 + D_xxxxxyyyy*v547 + &
      D_xxxxxyyyz*v548 + D_xxxxxyyz*v392 + D_xxxxxyyzz*v549 + D_xxxxxyz &
      *v281 + D_xxxxxyzz*v393 + D_xxxxxyzzz*v550 + D_xxxxy*v173 + &
      D_xxxxyy*v212 + D_xxxxyyy*v282 + D_xxxxyyyy*v394 + D_xxxxyyyyy* &
      v551 + D_xxxxyyyyz*v552 + D_xxxxyyyz*v395 + D_xxxxyyyzz*v553 + &
      D_xxxxyyz*v283 + D_xxxxyyzz*v396 + D_xxxxyyzzz*v554 + D_xxxxyz* &
      v213 + D_xxxxyzz*v284 + D_xxxxyzzz*v397 + D_xxxxyzzzz*v555 + &
      D_xxxy*v152 + D_xxxyy*v174 + D_xxxyyy*v214 + D_xxxyyyy*v285 + &
      D_xxxyyyyy*v398 + D_xxxyyyyyy*v556 + D_xxxyyyyyz*v557 + &
      D_xxxyyyyz*v399 + D_xxxyyyyzz*v558 + D_xxxyyyz*v286 + D_xxxyyyzz* &
      v400 + D_xxxyyyzzz*v559 + D_xxxyyz*v215 + D_xxxyyzz*v287 + &
      D_xxxyyzzz*v401 + D_xxxyyzzzz*v560 + D_xxxyz*v175 + D_xxxyzz*v216 &
      + D_xxxyzzz*v288 + D_xxxyzzzz*v402 + D_xxxyzzzzz*v561 + D_xxy* &
      v142 + D_xxyy*v153 + D_xxyyy*v176 + D_xxyyyy*v217 + D_xxyyyyy* &
      v289 + D_xxyyyyyy*v403 + D_xxyyyyyyy*v562 + D_xxyyyyyyz*v563 + &
      D_xxyyyyyz*v404 + D_xxyyyyyzz*v564 + D_xxyyyyz*v290 + D_xxyyyyzz* &
      v405 + D_xxyyyyzzz*v565 + D_xxyyyz*v218 + D_xxyyyzz*v291 + &
      D_xxyyyzzz*v406 + D_xxyyyzzzz*v566 + D_xxyyz*v177 + D_xxyyzz*v219 &
      + D_xxyyzzz*v292 + D_xxyyzzzz*v407 + D_xxyyzzzzz*v567 + D_xxyz* &
      v154 + D_xxyzz*v178 + D_xxyzzz*v220 + D_xxyzzzz*v293 + D_xxyzzzzz &
      *v408 + D_xxyzzzzzz*v568 + D_xyy*M_xy + D_xyyy*v598 + D_xyyyy* &
      v600 + D_xyyyyy*v602 + D_xyyyyyy*v604 + D_xyyyyyyy*v606 + &
      D_xyyyyyyyy*v608 + D_xyyz*M_xyz + D_xyz*M_xz + D_y*M_0 + D_yyy* &
      v450 + D_yyyy*v452 + D_yyyyy*v457 + D_yyyyyy*v466 + D_yyyyyyy* &
      v482 + D_yyyyyyyy*v506 + D_yyyyyyyyy*v569 + D_yyyyyyyyz*v570 + &
      D_yyyyyyyz*v571 + D_yyyyyyyzz*v572 + D_yyyyyyz*v573 + D_yyyyyyzz* &
      v574 + D_yyyyyyzzz*v575 + D_yyyyyz*v576 + D_yyyyyzz*v577 + &
      D_yyyyyzzz*v578 + D_yyyyyzzzz*v579 + D_yyyyz*v580 + D_yyyyzz*v581 &
      + D_yyyyzzz*v582 + D_yyyyzzzz*v583 + D_yyyyzzzzz*v584 + D_yyyz* &
      v585 + D_yyyzz*v586 + D_yyyzzz*v587 + D_yyyzzzz*v588 + D_yyyzzzzz &
      *v589 + D_yyyzzzzzz*v590 + D_yyz*M_yz + D_yyzz*v599 + D_yyzzz* &
      v601 + D_yyzzzz*v603 + D_yyzzzzz*v605 + D_yyzzzzzz*v607 + &
      D_yyzzzzzzz*v609 + D_yzz*v591 + D_yzzz*v592 + D_yzzzz*v593 + &
      D_yzzzzz*v594 + D_yzzzzzz*v595 + D_yzzzzzzz*v596 + D_yzzzzzzzz* &
      v597 + M_xyyyyyyz*v507 + M_xyyyyyz*v508 + M_xyyyyyzz*v509 + &
      M_xyyyyz*v510 + M_xyyyyzz*v511 + M_xyyyyzzz*v512 + M_xyyyz*v513 + &
      M_xyyyzz*v514 + M_xyyyzzz*v515 + M_xyyyzzzz*v516 + M_xyyz*v517 + &
      M_xyyzz*v518 + M_xyyzzz*v519 + M_xyyzzzz*v520 + M_xyyzzzzz*v521 + &
      M_xyzz*v493 + M_xyzzz*v494 + M_xyzzzz*v495 + M_xyzzzzz*v496 + &
      M_xyzzzzzz*v497 + M_xzz*v522 + M_xzzz*v523 + M_xzzzz*v524 + &
      M_xzzzzz*v525 + M_xzzzzzz*v526 + M_xzzzzzzz*v527
    L_yz        = D_xxxxxxxyz*v388 + D_xxxxxxyyz*v389 + D_xxxxxxyz*v279 + D_xxxxxxyzz*v390 &
      + D_xxxxxyyyz*v391 + D_xxxxxyyz*v280 + D_xxxxxyyzz*v392 + &
      D_xxxxxyz*v211 + D_xxxxxyzz*v281 + D_xxxxxyzzz*v393 + D_xxxxyyyyz &
      *v394 + D_xxxxyyyz*v282 + D_xxxxyyyzz*v395 + D_xxxxyyz*v212 + &
      D_xxxxyyzz*v283 + D_xxxxyyzzz*v396 + D_xxxxyz*v173 + D_xxxxyzz* &
      v213 + D_xxxxyzzz*v284 + D_xxxxyzzzz*v397 + D_xxxyyyyyz*v398 + &
      D_xxxyyyyz*v285 + D_xxxyyyyzz*v399 + D_xxxyyyz*v214 + D_xxxyyyzz* &
      v286 + D_xxxyyyzzz*v400 + D_xxxyyz*v174 + D_xxxyyzz*v215 + &
      D_xxxyyzzz*v287 + D_xxxyyzzzz*v401 + D_xxxyz*v152 + D_xxxyzz*v175 &
      + D_xxxyzzz*v216 + D_xxxyzzzz*v288 + D_xxxyzzzzz*v402 + &
      D_xxyyyyyyz*v403 + D_xxyyyyyz*v289 + D_xxyyyyyzz*v404 + D_xxyyyyz &
      *v217 + D_xxyyyyzz*v290 + D_xxyyyyzzz*v405 + D_xxyyyz*v176 + &
      D_xxyyyzz*v218 + D_xxyyyzzz*v291 + D_xxyyyzzzz*v406 + D_xxyyz* &
      v153 + D_xxyyzz*v177 + D_xxyyzzz*v219 + D_xxyyzzzz*v292 + &
      D_xxyyzzzzz*v407 + D_xxyz*v142 + D_xxyzz*v154 + D_xxyzzz*v178 + &
      D_xxyzzzz*v220 + D_xxyzzzzz*v293 + D_xxyzzzzzz*v408 + D_xyyyyyyyz &
      *v606 + D_xyyyyyyz*v604 + D_xyyyyyz*v602 + D_xyyyyz*v600 + &
      D_xyyyz*v598 + D_xyyz*M_xy + D_xyyzz*M_xyz + D_xyzz*M_xz + &
      D_yyyyyyyyz*v506 + D_yyyyyyyz*v482 + D_yyyyyyyzz*v571 + D_yyyyyyz &
      *v466 + D_yyyyyyzz*v573 + D_yyyyyyzzz*v574 + D_yyyyyz*v457 + &
      D_yyyyyzz*v576 + D_yyyyyzzz*v577 + D_yyyyyzzzz*v578 + D_yyyyz* &
      v452 + D_yyyyzz*v580 + D_yyyyzzz*v581 + D_yyyyzzzz*v582 + &
      D_yyyyzzzzz*v583 + D_yyyz*v450 + D_yyyzz*v585 + D_yyyzzz*v586 + &
      D_yyyzzzz*v587 + D_yyyzzzzz*v588 + D_yyyzzzzzz*v589 + D_yyzz*M_yz &
      + D_yyzzz*v599 + D_yyzzzz*v601 + D_yyzzzzz*v603 + D_yyzzzzzz*v605 &
      + D_yyzzzzzzz*v607 + D_yz*M_0 + D_yzzz*v591 + D_yzzzz*v592 + &
      D_yzzzzz*v593 + D_yzzzzzz*v594 + D_yzzzzzzz*v595 + D_yzzzzzzzz* &
      v596 + M_xyyyyyz*v528 + M_xyyyyz*v529 + M_xyyyyzz*v530 + M_xyyyz* &
      v531 + M_xyyyzz*v491 + M_xyyyzzz*v532 + M_xyyz*v473 + M_xyyzz* &
      v533 + M_xyyzzz*v534 + M_xyyzzzz*v535 + M_xyzz*v502 + M_xyzzz* &
      v503 + M_xyzzzz*v504 + M_xyzzzzz*v505 + M_xzz*v536 + M_xzzz*v537 &
      + M_xzzzz*v538 + M_xzzzzz*v539 + M_xzzzzzz*v540
    D_zzzzzzzzz = -(D_xxzzzzzzz + D_yyzzzzzzz)
    L_z         = 0.000198412698412698d0*(140.0d0*D_xyyyzzzz*M_xyyyzzz + 35.0d0* &
      D_xyyyzzzzz*M_xyyyzzzz + 1260.0d0*D_xyyzzz*M_xyyzz + 420.0d0* &
      D_xyyzzzz*M_xyyzzz + 2520.0d0*D_xzzz*M_xzz + D_xzzzzzzzz* &
      M_xzzzzzzz + 7.0d0*(D_xyyyyyyzz*M_xyyyyyyz + D_xzzzzzzz*M_xzzzzzz &
      ) + 42.0d0*(D_xyyyyyzz*M_xyyyyyz + D_xzzzzzz*M_xzzzzz) + 21.0d0*( &
      D_xyyyyyzzz*M_xyyyyyzz + D_xyyzzzzzz*M_xyyzzzzz) + 210.0d0*( &
      D_xyyyyzz*M_xyyyyz + D_xzzzzz*M_xzzzz) + 105.0d0*(D_xyyyyzzz* &
      M_xyyyyzz + D_xyyzzzzz*M_xyyzzzz) + 840.0d0*(D_xyyyzz*M_xyyyz + &
      D_xzzzz*M_xzzz)) + D_xxxxxxxxz*v541 + D_xxxxxxxyz*v542 + &
      D_xxxxxxxz*v388 + D_xxxxxxxzz*v543 + D_xxxxxxyyz*v544 + &
      D_xxxxxxyz*v389 + D_xxxxxxyzz*v545 + D_xxxxxxz*v279 + D_xxxxxxzz* &
      v390 + D_xxxxxxzzz*v546 + D_xxxxxyyyz*v547 + D_xxxxxyyz*v391 + &
      D_xxxxxyyzz*v548 + D_xxxxxyz*v280 + D_xxxxxyzz*v392 + D_xxxxxyzzz &
      *v549 + D_xxxxxz*v211 + D_xxxxxzz*v281 + D_xxxxxzzz*v393 + &
      D_xxxxxzzzz*v550 + D_xxxxyyyyz*v551 + D_xxxxyyyz*v394 + &
      D_xxxxyyyzz*v552 + D_xxxxyyz*v282 + D_xxxxyyzz*v395 + D_xxxxyyzzz &
      *v553 + D_xxxxyz*v212 + D_xxxxyzz*v283 + D_xxxxyzzz*v396 + &
      D_xxxxyzzzz*v554 + D_xxxxz*v173 + D_xxxxzz*v213 + D_xxxxzzz*v284 &
      + D_xxxxzzzz*v397 + D_xxxxzzzzz*v555 + D_xxxyyyyyz*v556 + &
      D_xxxyyyyz*v398 + D_xxxyyyyzz*v557 + D_xxxyyyz*v285 + D_xxxyyyzz* &
      v399 + D_xxxyyyzzz*v558 + D_xxxyyz*v214 + D_xxxyyzz*v286 + &
      D_xxxyyzzz*v400 + D_xxxyyzzzz*v559 + D_xxxyz*v174 + D_xxxyzz*v215 &
      + D_xxxyzzz*v287 + D_xxxyzzzz*v401 + D_xxxyzzzzz*v560 + D_xxxz* &
      v152 + D_xxxzz*v175 + D_xxxzzz*v216 + D_xxxzzzz*v288 + D_xxxzzzzz &
      *v402 + D_xxxzzzzzz*v561 + D_xxyyyyyyz*v562 + D_xxyyyyyz*v403 + &
      D_xxyyyyyzz*v563 + D_xxyyyyz*v289 + D_xxyyyyzz*v404 + D_xxyyyyzzz &
      *v564 + D_xxyyyz*v217 + D_xxyyyzz*v290 + D_xxyyyzzz*v405 + &
      D_xxyyyzzzz*v565 + D_xxyyz*v176 + D_xxyyzz*v218 + D_xxyyzzz*v291 &
      + D_xxyyzzzz*v406 + D_xxyyzzzzz*v566 + D_xxyz*v153 + D_xxyzz*v177 &
      + D_xxyzzz*v219 + D_xxyzzzz*v292 + D_xxyzzzzz*v407 + D_xxyzzzzzz* &
      v567 + D_xxz*v142 + D_xxzz*v154 + D_xxzzz*v178 + D_xxzzzz*v220 + &
      D_xxzzzzz*v293 + D_xxzzzzzz*v408 + D_xxzzzzzzz*v568 + D_xyyyyyyyz &
      *v608 + D_xyyyyyyz*v606 + D_xyyyyyz*v604 + D_xyyyyz*v602 + &
      D_xyyyz*v600 + D_xyyz*v598 + D_xyz*M_xy + D_xyzz*M_xyz + D_xzz* &
      M_xz + D_yyyyyyyyz*v569 + D_yyyyyyyz*v506 + D_yyyyyyyzz*v570 + &
      D_yyyyyyz*v482 + D_yyyyyyzz*v571 + D_yyyyyyzzz*v572 + D_yyyyyz* &
      v466 + D_yyyyyzz*v573 + D_yyyyyzzz*v574 + D_yyyyyzzzz*v575 + &
      D_yyyyz*v457 + D_yyyyzz*v576 + D_yyyyzzz*v577 + D_yyyyzzzz*v578 + &
      D_yyyyzzzzz*v579 + D_yyyz*v452 + D_yyyzz*v580 + D_yyyzzz*v581 + &
      D_yyyzzzz*v582 + D_yyyzzzzz*v583 + D_yyyzzzzzz*v584 + D_yyz*v450 &
      + D_yyzz*v585 + D_yyzzz*v586 + D_yyzzzz*v587 + D_yyzzzzz*v588 + &
      D_yyzzzzzz*v589 + D_yyzzzzzzz*v590 + D_yzz*M_yz + D_yzzz*v599 + &
      D_yzzzz*v601 + D_yzzzzz*v603 + D_yzzzzzz*v605 + D_yzzzzzzz*v607 + &
      D_yzzzzzzzz*v609 + D_z*M_0 + D_zzz*v591 + D_zzzz*v592 + D_zzzzz* &
      v593 + D_zzzzzz*v594 + D_zzzzzzz*v595 + D_zzzzzzzz*v596 + &
      D_zzzzzzzzz*v597 + M_xyyyyzzz*v516 + M_xyyyzz*v519 + M_xyyz*v493 &
      + M_xyzz*v536 + M_xyzzz*v537 + M_xyzzzz*v538 + M_xyzzzzz*v539 + &
      M_xyzzzzzz*v540
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
#undef  M_xxx               
#undef  L_yy                
#undef  L_yz                
#undef  M_xxy               
#undef  M_xxz               
#undef  L_xxx               
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
#undef  M_xxxyyy            
#undef  L_xxxxyy            
#undef  L_xxxxyz            
#undef  M_xxxyyz            
#undef  L_xxxyyy            
#undef  M_xxyyyy            
#undef  L_xxxyyz            
#undef  M_xxyyyz            
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
#undef  M_xxxxxxxx          
#undef  L_yyyyyyy           
#undef  L_yyyyyyz           
#undef  M_xxxxxxxy          
#undef  M_xxxxxxxz          
#undef  L_xxxxxxxx          
#undef  M_xxxxxxyy          
#undef  L_xxxxxxxy          
#undef  M_xxxxxxyz          
#undef  L_xxxxxxxz          
#undef  L_xxxxxxyy          
#undef  M_xxxxxyyy          
#undef  L_xxxxxxyz          
#undef  M_xxxxxyyz          
#undef  M_xxxxyyyy          
#undef  L_xxxxxyyy          
#undef  L_xxxxxyyz          
#undef  M_xxxxyyyz          
#undef  L_xxxxyyyy          
#undef  M_xxxyyyyy          
#undef  L_xxxxyyyz          
#undef  M_xxxyyyyz          
#undef  M_xxyyyyyy          
#undef  L_xxxyyyyy          
#undef  M_xxyyyyyz          
#undef  L_xxxyyyyz          
#undef  L_xxyyyyyy          
#undef  M_xyyyyyyy          
#undef  M_xyyyyyyz          
#undef  L_xxyyyyyz          
#undef  L_xyyyyyyy          
#undef  M_yyyyyyyy          
#undef  M_yyyyyyyz          
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
    end subroutine mom_es_M2L2
    
! OPS  410*ADD + 2*DIV + 573*MUL + 120*NEG + POW = 1106  (2101 before optimization)
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
                u9, v0, v1, v10, v100, v101, v102, v103, v104, v105, v11, v12,&
                v13, v14, v15, v16, v17, v18, v19, v2, v20, v21, v22, v23,&
                v24, v25, v26, v27, v28, v29, v3, v30, v31, v32, v33, v34,&
                v35, v36, v37, v38, v39, v4, v40, v41, v42, v43, v44, v45,&
                v46, v47, v48, v49, v5, v50, v51, v52, v53, v54, v55, v56,&
                v57, v58, v59, v6, v60, v61, v62, v63, v64, v65, v66, v67,&
                v68, v69, v7, v70, v71, v72, v73, v74, v75, v76, v77, v78,&
                v79, v8, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v9,&
                v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, h, u, L_zz,&
                L_xzz, L_yzz, L_zzz, L_xxzz, L_xyzz, L_xzzz, L_yyzz, L_yzzz,&
                L_zzzz, L_xxxzz, L_xxyzz, L_xxzzz, L_xyyzz, L_xyzzz, L_xzzzz,&
                L_yyyzz, L_yyzzz, L_yzzzz, L_zzzzz, L_xxxxzz, L_xxxyzz,&
                L_xxxzzz, L_xxyyzz, L_xxyzzz, L_xxzzzz, L_xyyyzz, L_xyyzzz,&
                L_xyzzzz, L_xzzzzz, L_yyyyzz, L_yyyzzz, L_yyzzzz, L_yzzzzz,&
                L_zzzzzz, L_xxxxxzz, L_xxxxyzz, L_xxxxzzz, L_xxxyyzz,&
                L_xxxyzzz, L_xxxzzzz, L_xxyyyzz, L_xxyyzzz, L_xxyzzzz,&
                L_xxzzzzz, L_xyyyyzz, L_xyyyzzz, L_xyyzzzz, L_xyzzzzz,&
                L_xzzzzzz, L_yyyyyzz, L_yyyyzzz, L_yyyzzzz, L_yyzzzzz,&
                L_yzzzzzz, L_zzzzzzz, L_xxxxxxzz, L_xxxxxyzz, L_xxxxxzzz,&
                L_xxxxyyzz, L_xxxxyzzz, L_xxxxzzzz, L_xxxyyyzz, L_xxxyyzzz,&
                L_xxxyzzzz, L_xxxzzzzz, L_xxyyyyzz, L_xxyyyzzz, L_xxyyzzzz,&
                L_xxyzzzzz, L_xxzzzzzz, L_xyyyyyzz, L_xyyyyzzz, L_xyyyzzzz,&
                L_xyyzzzzz, L_xyzzzzzz, L_xzzzzzzz, L_yyyyyyzz, L_yyyyyzzz,&
                L_yyyyzzzz, L_yyyzzzzz, L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz,&
                L_xxxxxxxzz, L_xxxxxxyzz, L_xxxxxxzzz, L_xxxxxyyzz,&
                L_xxxxxyzzz, L_xxxxxzzzz, L_xxxxyyyzz, L_xxxxyyzzz,&
                L_xxxxyzzzz, L_xxxxzzzzz, L_xxxyyyyzz, L_xxxyyyzzz,&
                L_xxxyyzzzz, L_xxxyzzzzz, L_xxxzzzzzz, L_xxyyyyyzz,&
                L_xxyyyyzzz, L_xxyyyzzzz, L_xxyyzzzzz, L_xxyzzzzzz,&
                L_xxzzzzzzz, L_xyyyyyyzz, L_xyyyyyzzz, L_xyyyyzzzz,&
                L_xyyyzzzzz, L_xyyzzzzzz, L_xyzzzzzzz, L_xzzzzzzzz,&
                L_yyyyyyyzz, L_yyyyyyzzz, L_yyyyyzzzz, L_yyyyzzzzz,&
                L_yyyzzzzzz, L_yyzzzzzzz, L_yzzzzzzzz, L_zzzzzzzzz
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
#define L_xxxxxxxxx          L(1:2,80)
#define L_xxxxxxxxy          L(1:2,81)
#define L_xxxxxxxxz          L(1:2,82)
#define L_xxxxxxxyy          L(1:2,83)
#define L_xxxxxxxyz          L(1:2,84)
#define L_xxxxxxyyy          L(1:2,85)
#define L_xxxxxxyyz          L(1:2,86)
#define L_xxxxxyyyy          L(1:2,87)
#define L_xxxxxyyyz          L(1:2,88)
#define L_xxxxyyyyy          L(1:2,89)
#define L_xxxxyyyyz          L(1:2,90)
#define L_xxxyyyyyy          L(1:2,91)
#define L_xxxyyyyyz          L(1:2,92)
#define L_xxyyyyyyy          L(1:2,93)
#define L_xxyyyyyyz          L(1:2,94)
#define L_xyyyyyyyy          L(1:2,95)
#define L_xyyyyyyyz          L(1:2,96)
#define L_yyyyyyyyy          L(1:2,97)
#define L_yyyyyyyyz          L(1:2,98)
    call pack2(MOM_ES_L_LEN, L1,L2,L)
    call pack2(3, r1,r2,r)
    v17         = L_xyyyyyyy + L_xyyyyyyyz*z
    v21         = 2.0d0*z
    v25         = 6.0d0*z
    v30         = 24.0d0*z
    v36         = 2.0d0*y
    v37         = L_xxxxxxxy + L_xxxxxxxyz*z
    v40         = 120.0d0*z
    v46         = 720.0d0*z
    v52         = 0.000198412698412698d0*y
    v53         = 5040.0d0*z
    v62         = L_xxxxxxyy + L_xxxxxxyyz*z
    v63         = 3.0d0*y
    v67         = L_xxxxxyyy + L_xxxxxyyyz*z
    v70         = 4.0d0*y
    v74         = L_xxxxyyyy + L_xxxxyyyyz*z
    v79         = 5.0d0*y
    v84         = L_xxxyyyyy + L_xxxyyyyyz*z
    v91         = 6.0d0*y
    v93         = 0.000198412698412698d0*x
    v95         = L_xxyyyyyy + L_xxyyyyyyz*z
    v104        = 7.0d0*y
    L_zz        = -(L_xx + L_yy)
    L_xzz       = -(L_xxx + L_xyy)
    L_yzz       = -(L_xxy + L_yyy)
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
    L_xxxxxxyzz = -(L_xxxxxxxxy + L_xxxxxxyyy)
    L_xxxxxxzzz = -(L_xxxxxxxxz + L_xxxxxxyyz)
    L_xxxxxyyzz = -(L_xxxxxxxyy + L_xxxxxyyyy)
    L_xxxxxyzzz = -(L_xxxxxxxyz + L_xxxxxyyyz)
    L_xxxxxzzzz = -(L_xxxxxxxzz + L_xxxxxyyzz)
    L_xxxxyyyzz = -(L_xxxxxxyyy + L_xxxxyyyyy)
    L_xxxxyyzzz = -(L_xxxxxxyyz + L_xxxxyyyyz)
    L_xxxxyzzzz = -(L_xxxxxxyzz + L_xxxxyyyzz)
    L_xxxxzzzzz = -(L_xxxxxxzzz + L_xxxxyyzzz)
    L_xxxyyyyzz = -(L_xxxxxyyyy + L_xxxyyyyyy)
    L_xxxyyyzzz = -(L_xxxxxyyyz + L_xxxyyyyyz)
    L_xxxyyzzzz = -(L_xxxxxyyzz + L_xxxyyyyzz)
    L_xxxyzzzzz = -(L_xxxxxyzzz + L_xxxyyyzzz)
    L_xxxzzzzzz = -(L_xxxxxzzzz + L_xxxyyzzzz)
    L_xxyyyyyzz = -(L_xxxxyyyyy + L_xxyyyyyyy)
    L_xxyyyyzzz = -(L_xxxxyyyyz + L_xxyyyyyyz)
    L_xxyyyzzzz = -(L_xxxxyyyzz + L_xxyyyyyzz)
    L_xxyyzzzzz = -(L_xxxxyyzzz + L_xxyyyyzzz)
    L_xxyzzzzzz = -(L_xxxxyzzzz + L_xxyyyzzzz)
    L_xxzzzzzzz = -(L_xxxxzzzzz + L_xxyyzzzzz)
    L_xyyyyyyzz = -(L_xxxyyyyyy + L_xyyyyyyyy)
    L_xyyyyyzzz = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz = -(L_xxyyyyyyy + L_yyyyyyyyy)
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
    v81         = a2
    v82         = 0.000694444444444444d0*v81
    a3          = a1*a2
    v72         = 0.00138888888888889d0*a3
    a4          = a2*a2
    v65         = 0.00173611111111111d0*a4
    a5          = a2*a3
    v60         = 0.00138888888888889d0*a5
    a6          = a3*a3
    v34         = 0.000694444444444444d0*a6
    a7          = a3*a4
    v18         = 0.000198412698412698d0*a7
    a8          = a4*a4
    v0          = 2.48015873015873d-5*a8
    a9          = a4*a5
    b2          = b1*b1
    v35         = b2
    v45         = 0.000694444444444444d0*v35
    v61         = 3.0d0*v35
    v68         = 6.0d0*v35
    v77         = 10.0d0*v35
    v89         = 15.0d0*v35
    v102        = 21.0d0*v35
    b3          = b1*b2
    v38         = b3
    v39         = 0.00138888888888889d0*v38
    v66         = 4.0d0*v38
    v75         = 10.0d0*v38
    v87         = 20.0d0*v38
    v100        = 35.0d0*v38
    b4          = b2*b2
    v28         = b4
    v29         = 0.00173611111111111d0*v28
    v73         = 5.0d0*v28
    v85         = 15.0d0*v28
    v98         = 35.0d0*v28
    b5          = b2*b3
    v23         = b5
    v24         = 0.00138888888888889d0*v23
    v83         = 6.0d0*v23
    v96         = 21.0d0*v23
    b6          = b3*b3
    v19         = b6
    v20         = 0.000694444444444444d0*v19
    v94         = 7.0d0*v19
    b7          = b3*b4
    v15         = b7
    v16         = 0.000198412698412698d0*v15
    b8          = b4*b4
    v1          = 2.48015873015873d-5*b8
    b9          = b4*b5
    c2          = c1*c1
    v2          = c2
    v3          = 0.5d0*v2
    v26         = 3.0d0*v2
    v31         = 12.0d0*v2
    v41         = 60.0d0*v2
    v47         = 360.0d0*v2
    v54         = 2520.0d0*v2
    v64         = 2.0d0*L_xxxxxxy + L_xxxxxxyz*v21 + L_xxxxxxyzz*v2
    v69         = 2.0d0*L_xxxxxyy + L_xxxxxyyz*v21 + L_xxxxxyyzz*v2
    v76         = 2.0d0*L_xxxxyyy + L_xxxxyyyz*v21 + L_xxxxyyyzz*v2
    v86         = 2.0d0*L_xxxyyyy + L_xxxyyyyz*v21 + L_xxxyyyyzz*v2
    v97         = 2.0d0*L_xxyyyyy + L_xxyyyyyz*v21 + L_xxyyyyyzz*v2
    v22         = 2.0d0*L_xyyyyyy + L_xyyyyyyz*v21 + L_xyyyyyyzz*v2
    h           = v2 + v35 + v81
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
    v4          = c3
    v5          = 0.166666666666667d0*v4
    v32         = 4.0d0*v4
    v42         = 20.0d0*v4
    v48         = 120.0d0*v4
    v55         = 840.0d0*v4
    v71         = 6.0d0*L_xxxxxy + L_xxxxxyz*v25 + L_xxxxxyzz*v26 + L_xxxxxyzzz*v4
    v78         = 6.0d0*L_xxxxyy + L_xxxxyyz*v25 + L_xxxxyyzz*v26 + L_xxxxyyzzz*v4
    v88         = 6.0d0*L_xxxyyy + L_xxxyyyz*v25 + L_xxxyyyzz*v26 + L_xxxyyyzzz*v4
    v99         = 6.0d0*L_xxyyyy + L_xxyyyyz*v25 + L_xxyyyyzz*v26 + L_xxyyyyzzz*v4
    v27         = 6.0d0*L_xyyyyy + L_xyyyyyz*v25 + L_xyyyyyzz*v26 + L_xyyyyyzzz*v4
    c4          = c2*c2
    v6          = c4
    v7          = 0.0416666666666667d0*v6
    v43         = 5.0d0*v6
    v49         = 30.0d0*v6
    v56         = 210.0d0*v6
    v80         = 24.0d0*L_xxxxy + L_xxxxyz*v30 + L_xxxxyzz*v31 + L_xxxxyzzz*v32 + &
      L_xxxxyzzzz*v6
    v90         = 24.0d0*L_xxxyy + L_xxxyyz*v30 + L_xxxyyzz*v31 + L_xxxyyzzz*v32 + &
      L_xxxyyzzzz*v6
    v101        = 24.0d0*L_xxyyy + L_xxyyyz*v30 + L_xxyyyzz*v31 + L_xxyyyzzz*v32 + &
      L_xxyyyzzzz*v6
    v33         = 24.0d0*L_xyyyy + L_xyyyyz*v30 + L_xyyyyzz*v31 + L_xyyyyzzz*v32 + &
      L_xyyyyzzzz*v6
    c5          = c2*c3
    v8          = c5
    v9          = 0.00833333333333333d0*v8
    v50         = 6.0d0*v8
    v57         = 42.0d0*v8
    v92         = 120.0d0*L_xxxy + L_xxxyz*v40 + L_xxxyzz*v41 + L_xxxyzzz*v42 + L_xxxyzzzz &
      *v43 + L_xxxyzzzzz*v8
    v103        = 120.0d0*L_xxyy + L_xxyyz*v40 + L_xxyyzz*v41 + L_xxyyzzz*v42 + L_xxyyzzzz &
      *v43 + L_xxyyzzzzz*v8
    v44         = 120.0d0*L_xyyy + L_xyyyz*v40 + L_xyyyzz*v41 + L_xyyyzzz*v42 + L_xyyyzzzz &
      *v43 + L_xyyyzzzzz*v8
    c6          = c3*c3
    v10         = c6
    v11         = 0.00138888888888889d0*v10
    v58         = 7.0d0*v10
    v105        = 720.0d0*L_xxy + L_xxyz*v46 + L_xxyzz*v47 + L_xxyzzz*v48 + L_xxyzzzz*v49 &
      + L_xxyzzzzz*v50 + L_xxyzzzzzz*v10
    v51         = 720.0d0*L_xyy + L_xyyz*v46 + L_xyyzz*v47 + L_xyyzzz*v48 + L_xyyzzzz*v49 &
      + L_xyyzzzzz*v50 + L_xyyzzzzzz*v10
    c7          = c3*c4
    v12         = c7
    v13         = 0.000198412698412698d0*v12
    v59         = 5040.0d0*L_xy + L_xyz*v53 + L_xyzz*v54 + L_xyzzz*v55 + L_xyzzzz*v56 + &
      L_xyzzzzz*v57 + L_xyzzzzzz*v58 + L_xyzzzzzzz*v12
    c8          = c4*c4
    v14         = 2.48015873015873d-5*c8
    Phi_x       = L_x + L_xxxxxxxxx*v0 + L_xyyyyyyyy*v1 + L_xz*z + L_xzz*v3 + L_xzzz*v5 + &
      L_xzzzz*v7 + L_xzzzzz*v9 + L_xzzzzzz*v11 + L_xzzzzzzz*v13 + &
      L_xzzzzzzzz*v14 + v16*v17 + v18*(L_xxxxxxxx + L_xxxxxxxxy*y + &
      L_xxxxxxxxz*z) + v20*v22 + v24*v27 + v29*v33 + v34*(2.0d0* &
      L_xxxxxxx + L_xxxxxxxyy*v35 + L_xxxxxxxz*v21 + L_xxxxxxxzz*v2 + &
      v36*v37) + v39*v44 + v45*v51 + v52*v59 + v60*(6.0d0*L_xxxxxx + &
      L_xxxxxxyyy*v38 + L_xxxxxxz*v25 + L_xxxxxxzz*v26 + L_xxxxxxzzz*v4 &
      + v61*v62 + v63*v64) + v65*(24.0d0*L_xxxxx + L_xxxxxyyyy*v28 + &
      L_xxxxxz*v30 + L_xxxxxzz*v31 + L_xxxxxzzz*v32 + L_xxxxxzzzz*v6 + &
      v66*v67 + v68*v69 + v70*v71) + v72*(120.0d0*L_xxxx + L_xxxxyyyyy* &
      v23 + L_xxxxz*v40 + L_xxxxzz*v41 + L_xxxxzzz*v42 + L_xxxxzzzz*v43 &
      + L_xxxxzzzzz*v8 + v73*v74 + v75*v76 + v77*v78 + v79*v80) + v82*( &
      720.0d0*L_xxx + L_xxxyyyyyy*v19 + L_xxxz*v46 + L_xxxzz*v47 + &
      L_xxxzzz*v48 + L_xxxzzzz*v49 + L_xxxzzzzz*v50 + L_xxxzzzzzz*v10 + &
      v83*v84 + v85*v86 + v87*v88 + v89*v90 + v91*v92) + v93*(5040.0d0* &
      L_xx + L_xxyyyyyyy*v15 + L_xxz*v53 + L_xxzz*v54 + L_xxzzz*v55 + &
      L_xxzzzz*v56 + L_xxzzzzz*v57 + L_xxzzzzzz*v58 + L_xxzzzzzzz*v12 + &
      v100*v101 + v102*v103 + v104*v105 + v94*v95 + v96*v97 + v98*v99)
    Phi_y       = L_y + L_xxxxxxxxy*v0 + L_yyyyyyyyy*v1 + L_yz*z + L_yzz*v3 + L_yzzz*v5 + &
      L_yzzzz*v7 + L_yzzzzz*v9 + L_yzzzzzz*v11 + L_yzzzzzzz*v13 + &
      L_yzzzzzzzz*v14 + v16*(L_yyyyyyyy + L_yyyyyyyyz*z) + v18*( &
      L_xxxxxxxyy*y + v37) + v20*(2.0d0*L_yyyyyyy + L_yyyyyyyz*v21 + &
      L_yyyyyyyzz*v2) + v24*(6.0d0*L_yyyyyy + L_yyyyyyz*v25 + &
      L_yyyyyyzz*v26 + L_yyyyyyzzz*v4) + v29*(24.0d0*L_yyyyy + L_yyyyyz &
      *v30 + L_yyyyyzz*v31 + L_yyyyyzzz*v32 + L_yyyyyzzzz*v6) + v34*( &
      L_xxxxxxyyy*v35 + v36*v62 + v64) + v39*(120.0d0*L_yyyy + L_yyyyz* &
      v40 + L_yyyyzz*v41 + L_yyyyzzz*v42 + L_yyyyzzzz*v43 + L_yyyyzzzzz &
      *v8) + v45*(720.0d0*L_yyy + L_yyyz*v46 + L_yyyzz*v47 + L_yyyzzz* &
      v48 + L_yyyzzzz*v49 + L_yyyzzzzz*v50 + L_yyyzzzzzz*v10) + v52*( &
      5040.0d0*L_yy + L_yyz*v53 + L_yyzz*v54 + L_yyzzz*v55 + L_yyzzzz* &
      v56 + L_yyzzzzz*v57 + L_yyzzzzzz*v58 + L_yyzzzzzzz*v12) + v60*( &
      L_xxxxxyyyy*v38 + v61*v67 + v63*v69 + v71) + v65*(L_xxxxyyyyy*v28 &
      + v66*v74 + v68*v76 + v70*v78 + v80) + v72*(L_xxxyyyyyy*v23 + v73 &
      *v84 + v75*v86 + v77*v88 + v79*v90 + v92) + v82*(L_xxyyyyyyy*v19 &
      + v101*v89 + v103*v91 + v105 + v83*v95 + v85*v97 + v87*v99) + v93 &
      *(L_xyyyyyyyy*v15 + v100*v33 + v102*v44 + v104*v51 + v17*v94 + &
      v22*v96 + v27*v98 + v59)
    Phi_z       = L_z + L_xxxxxxxxz*v0 + L_yyyyyyyyz*v1 + L_zz*z + L_zzz*v3 + L_zzzz*v5 + &
      L_zzzzz*v7 + L_zzzzzz*v9 + L_zzzzzzz*v11 + L_zzzzzzzz*v13 + &
      L_zzzzzzzzz*v14 + v16*(L_yyyyyyyz + L_yyyyyyyzz*z) + v18*( &
      L_xxxxxxxyz*y + L_xxxxxxxz + L_xxxxxxxzz*z) + v20*(2.0d0* &
      L_yyyyyyz + L_yyyyyyzz*v21 + L_yyyyyyzzz*v2) + v24*(6.0d0* &
      L_yyyyyz + L_yyyyyzz*v25 + L_yyyyyzzz*v26 + L_yyyyyzzzz*v4) + v29 &
      *(24.0d0*L_yyyyz + L_yyyyzz*v30 + L_yyyyzzz*v31 + L_yyyyzzzz*v32 &
      + L_yyyyzzzzz*v6) + v34*(L_xxxxxxyyz*v35 + 2.0d0*L_xxxxxxz + &
      L_xxxxxxzz*v21 + L_xxxxxxzzz*v2 + v36*(L_xxxxxxyz + L_xxxxxxyzz*z &
      )) + v39*(120.0d0*L_yyyz + L_yyyzz*v40 + L_yyyzzz*v41 + L_yyyzzzz &
      *v42 + L_yyyzzzzz*v43 + L_yyyzzzzzz*v8) + v45*(720.0d0*L_yyz + &
      L_yyzz*v46 + L_yyzzz*v47 + L_yyzzzz*v48 + L_yyzzzzz*v49 + &
      L_yyzzzzzz*v50 + L_yyzzzzzzz*v10) + v52*(5040.0d0*L_yz + L_yzz* &
      v53 + L_yzzz*v54 + L_yzzzz*v55 + L_yzzzzz*v56 + L_yzzzzzz*v57 + &
      L_yzzzzzzz*v58 + L_yzzzzzzzz*v12) + v60*(L_xxxxxyyyz*v38 + 6.0d0* &
      L_xxxxxz + L_xxxxxzz*v25 + L_xxxxxzzz*v26 + L_xxxxxzzzz*v4 + v61* &
      (L_xxxxxyyz + L_xxxxxyyzz*z) + v63*(2.0d0*L_xxxxxyz + L_xxxxxyzz* &
      v21 + L_xxxxxyzzz*v2)) + v65*(L_xxxxyyyyz*v28 + 24.0d0*L_xxxxz + &
      L_xxxxzz*v30 + L_xxxxzzz*v31 + L_xxxxzzzz*v32 + L_xxxxzzzzz*v6 + &
      v66*(L_xxxxyyyz + L_xxxxyyyzz*z) + v68*(2.0d0*L_xxxxyyz + &
      L_xxxxyyzz*v21 + L_xxxxyyzzz*v2) + v70*(6.0d0*L_xxxxyz + &
      L_xxxxyzz*v25 + L_xxxxyzzz*v26 + L_xxxxyzzzz*v4)) + v72*( &
      L_xxxyyyyyz*v23 + 120.0d0*L_xxxz + L_xxxzz*v40 + L_xxxzzz*v41 + &
      L_xxxzzzz*v42 + L_xxxzzzzz*v43 + L_xxxzzzzzz*v8 + v73*(L_xxxyyyyz &
      + L_xxxyyyyzz*z) + v75*(2.0d0*L_xxxyyyz + L_xxxyyyzz*v21 + &
      L_xxxyyyzzz*v2) + v77*(6.0d0*L_xxxyyz + L_xxxyyzz*v25 + &
      L_xxxyyzzz*v26 + L_xxxyyzzzz*v4) + v79*(24.0d0*L_xxxyz + L_xxxyzz &
      *v30 + L_xxxyzzz*v31 + L_xxxyzzzz*v32 + L_xxxyzzzzz*v6)) + v82*( &
      L_xxyyyyyyz*v19 + 720.0d0*L_xxz + L_xxzz*v46 + L_xxzzz*v47 + &
      L_xxzzzz*v48 + L_xxzzzzz*v49 + L_xxzzzzzz*v50 + L_xxzzzzzzz*v10 + &
      v83*(L_xxyyyyyz + L_xxyyyyyzz*z) + v85*(2.0d0*L_xxyyyyz + &
      L_xxyyyyzz*v21 + L_xxyyyyzzz*v2) + v87*(6.0d0*L_xxyyyz + &
      L_xxyyyzz*v25 + L_xxyyyzzz*v26 + L_xxyyyzzzz*v4) + v89*(24.0d0* &
      L_xxyyz + L_xxyyzz*v30 + L_xxyyzzz*v31 + L_xxyyzzzz*v32 + &
      L_xxyyzzzzz*v6) + v91*(120.0d0*L_xxyz + L_xxyzz*v40 + L_xxyzzz* &
      v41 + L_xxyzzzz*v42 + L_xxyzzzzz*v43 + L_xxyzzzzzz*v8)) + v93*( &
      L_xyyyyyyyz*v15 + 5040.0d0*L_xz + L_xzz*v53 + L_xzzz*v54 + &
      L_xzzzz*v55 + L_xzzzzz*v56 + L_xzzzzzz*v57 + L_xzzzzzzz*v58 + &
      L_xzzzzzzzz*v12 + v100*(24.0d0*L_xyyyz + L_xyyyzz*v30 + L_xyyyzzz &
      *v31 + L_xyyyzzzz*v32 + L_xyyyzzzzz*v6) + v102*(120.0d0*L_xyyz + &
      L_xyyzz*v40 + L_xyyzzz*v41 + L_xyyzzzz*v42 + L_xyyzzzzz*v43 + &
      L_xyyzzzzzz*v8) + v104*(720.0d0*L_xyz + L_xyzz*v46 + L_xyzzz*v47 &
      + L_xyzzzz*v48 + L_xyzzzzz*v49 + L_xyzzzzzz*v50 + L_xyzzzzzzz*v10 &
      ) + v94*(L_xyyyyyyz + L_xyyyyyyzz*z) + v96*(2.0d0*L_xyyyyyz + &
      L_xyyyyyzz*v21 + L_xyyyyyzzz*v2) + v98*(6.0d0*L_xyyyyz + &
      L_xyyyyzz*v25 + L_xyyyyzzz*v26 + L_xyyyyzzzz*v4))
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
    
! OPS  1246*ADD + 2*DIV + 1443*MUL + 120*NEG + POW = 2812  (10556 before optimization)
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
                v552, v553, v554, v555, v556, v56, v57, v58, v59, v6, v60,&
                v61, v62, v63, v64, v65, v66, v67, v68, v69, v7, v70, v71,&
                v72, v73, v74, v75, v76, v77, v78, v79, v8, v80, v81, v82,&
                v83, v84, v85, v86, v87, v88, v89, v9, v90, v91, v92, v93,&
                v94, v95, v96, v97, v98, v99, h, u, L_zz, L_xzz, L_yzz, L_zzz,&
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
                L_yyzzzzzz, L_yzzzzzzz, L_zzzzzzzz, L_xxxxxxxzz, L_xxxxxxyzz,&
                L_xxxxxxzzz, L_xxxxxyyzz, L_xxxxxyzzz, L_xxxxxzzzz,&
                L_xxxxyyyzz, L_xxxxyyzzz, L_xxxxyzzzz, L_xxxxzzzzz,&
                L_xxxyyyyzz, L_xxxyyyzzz, L_xxxyyzzzz, L_xxxyzzzzz,&
                L_xxxzzzzzz, L_xxyyyyyzz, L_xxyyyyzzz, L_xxyyyzzzz,&
                L_xxyyzzzzz, L_xxyzzzzzz, L_xxzzzzzzz, L_xyyyyyyzz,&
                L_xyyyyyzzz, L_xyyyyzzzz, L_xyyyzzzzz, L_xyyzzzzzz,&
                L_xyzzzzzzz, L_xzzzzzzzz, L_yyyyyyyzz, L_yyyyyyzzz,&
                L_yyyyyzzzz, L_yyyyzzzzz, L_yyyzzzzzz, L_yyzzzzzzz,&
                L_yzzzzzzzz, L_zzzzzzzzz
#define y                    r(1:2,2)
#define L_x                  L(1:2,0)
#define x                    r(1:2,1)
#define z                    r(1:2,3)
#define Ls_x                 Ls(1:2,0)
#define Ls_y                 Ls(1:2,1)
#define L_y                  L(1:2,1)
#define L_z                  L(1:2,2)
#define Ls_z                 Ls(1:2,2)
#define L_xx                 L(1:2,3)
#define Ls_xx                Ls(1:2,3)
#define L_xy                 L(1:2,4)
#define Ls_xy                Ls(1:2,4)
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
#define Ls_xxyyy             Ls(1:2,29)
#define L_xxyyy              L(1:2,29)
#define Ls_xxyyz             Ls(1:2,30)
#define L_xxyyz              L(1:2,30)
#define L_xyyyy              L(1:2,31)
#define Ls_xyyyy             Ls(1:2,31)
#define Ls_xyyyz             Ls(1:2,32)
#define L_xyyyz              L(1:2,32)
#define L_yyyyy              L(1:2,33)
#define Ls_yyyyy             Ls(1:2,33)
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
#define L_xxxxyz             L(1:2,39)
#define Ls_xxxxyz            Ls(1:2,39)
#define L_xxxyyy             L(1:2,40)
#define Ls_xxxyyy            Ls(1:2,40)
#define Ls_xxxyyz            Ls(1:2,41)
#define L_xxxyyz             L(1:2,41)
#define Ls_xxyyyy            Ls(1:2,42)
#define L_xxyyyy             L(1:2,42)
#define Ls_xxyyyz            Ls(1:2,43)
#define L_xxyyyz             L(1:2,43)
#define L_xyyyyy             L(1:2,44)
#define Ls_xyyyyy            Ls(1:2,44)
#define Ls_xyyyyz            Ls(1:2,45)
#define L_xyyyyz             L(1:2,45)
#define L_yyyyyy             L(1:2,46)
#define Ls_yyyyyy            Ls(1:2,46)
#define Ls_yyyyyz            Ls(1:2,47)
#define L_yyyyyz             L(1:2,47)
#define L_xxxxxxx            L(1:2,48)
#define Ls_xxxxxxx           Ls(1:2,48)
#define Ls_xxxxxxy           Ls(1:2,49)
#define L_xxxxxxy            L(1:2,49)
#define Ls_xxxxxxz           Ls(1:2,50)
#define L_xxxxxxz            L(1:2,50)
#define Ls_xxxxxyy           Ls(1:2,51)
#define L_xxxxxyy            L(1:2,51)
#define L_xxxxxyz            L(1:2,52)
#define Ls_xxxxxyz           Ls(1:2,52)
#define Ls_xxxxyyy           Ls(1:2,53)
#define L_xxxxyyy            L(1:2,53)
#define Ls_xxxxyyz           Ls(1:2,54)
#define L_xxxxyyz            L(1:2,54)
#define Ls_xxxyyyy           Ls(1:2,55)
#define L_xxxyyyy            L(1:2,55)
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
#define L_yyyyyyz            L(1:2,62)
#define Ls_yyyyyyz           Ls(1:2,62)
#define Ls_xxxxxxxx          Ls(1:2,63)
#define L_xxxxxxxx           L(1:2,63)
#define L_xxxxxxxy           L(1:2,64)
#define Ls_xxxxxxxy          Ls(1:2,64)
#define L_xxxxxxxz           L(1:2,65)
#define Ls_xxxxxxxz          Ls(1:2,65)
#define L_xxxxxxyy           L(1:2,66)
#define Ls_xxxxxxyy          Ls(1:2,66)
#define Ls_xxxxxxyz          Ls(1:2,67)
#define L_xxxxxxyz           L(1:2,67)
#define Ls_xxxxxyyy          Ls(1:2,68)
#define L_xxxxxyyy           L(1:2,68)
#define L_xxxxxyyz           L(1:2,69)
#define Ls_xxxxxyyz          Ls(1:2,69)
#define L_xxxxyyyy           L(1:2,70)
#define Ls_xxxxyyyy          Ls(1:2,70)
#define L_xxxxyyyz           L(1:2,71)
#define Ls_xxxxyyyz          Ls(1:2,71)
#define L_xxxyyyyy           L(1:2,72)
#define Ls_xxxyyyyy          Ls(1:2,72)
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
#define Ls_xxxxxxxxx         Ls(1:2,80)
#define L_xxxxxxxxx          L(1:2,80)
#define Ls_xxxxxxxxy         Ls(1:2,81)
#define L_xxxxxxxxy          L(1:2,81)
#define Ls_xxxxxxxxz         Ls(1:2,82)
#define L_xxxxxxxxz          L(1:2,82)
#define L_xxxxxxxyy          L(1:2,83)
#define Ls_xxxxxxxyy         Ls(1:2,83)
#define Ls_xxxxxxxyz         Ls(1:2,84)
#define L_xxxxxxxyz          L(1:2,84)
#define L_xxxxxxyyy          L(1:2,85)
#define Ls_xxxxxxyyy         Ls(1:2,85)
#define Ls_xxxxxxyyz         Ls(1:2,86)
#define L_xxxxxxyyz          L(1:2,86)
#define Ls_xxxxxyyyy         Ls(1:2,87)
#define L_xxxxxyyyy          L(1:2,87)
#define L_xxxxxyyyz          L(1:2,88)
#define Ls_xxxxxyyyz         Ls(1:2,88)
#define Ls_xxxxyyyyy         Ls(1:2,89)
#define L_xxxxyyyyy          L(1:2,89)
#define L_xxxxyyyyz          L(1:2,90)
#define Ls_xxxxyyyyz         Ls(1:2,90)
#define L_xxxyyyyyy          L(1:2,91)
#define Ls_xxxyyyyyy         Ls(1:2,91)
#define L_xxxyyyyyz          L(1:2,92)
#define Ls_xxxyyyyyz         Ls(1:2,92)
#define L_xxyyyyyyy          L(1:2,93)
#define Ls_xxyyyyyyy         Ls(1:2,93)
#define L_xxyyyyyyz          L(1:2,94)
#define Ls_xxyyyyyyz         Ls(1:2,94)
#define Ls_xyyyyyyyy         Ls(1:2,95)
#define L_xyyyyyyyy          L(1:2,95)
#define Ls_xyyyyyyyz         Ls(1:2,96)
#define L_xyyyyyyyz          L(1:2,96)
#define Ls_yyyyyyyyy         Ls(1:2,97)
#define L_yyyyyyyyy          L(1:2,97)
#define L_yyyyyyyyz          L(1:2,98)
#define Ls_yyyyyyyyz         Ls(1:2,98)
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
    v337         = 0.00138888888888889d0*x
    v353         = L_xyyyyyyz*z
    v356         = v13*y
    v359         = L_xyyyyyz*z
    v370         = L_xyyyyz*z
    v386         = L_xyyyz*z
    v406         = L_xyyz*z
    v430         = L_xyz*z
    v474         = 0.000198412698412698d0*y
    v480         = 0.000198412698412698d0*x
    v492         = L_yyyyyyyz*z
    v495         = L_yyyyyyz*z
    v497         = 0.5d0*y
    v501         = L_yyyyyz*z
    v504         = 0.166666666666667d0*y
    v510         = L_yyyyz*z
    v514         = 0.0416666666666667d0*y
    v521         = L_yyyz*z
    v526         = 0.00833333333333333d0*y
    v534         = L_yyz*z
    v540         = 0.00138888888888889d0*y
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
    v482         = L_xzz*z
    L_yzz        = -(L_xxy + L_yyy)
    v554         = L_yzz*z
    L_zzz        = -(L_xxz + L_yyz)
    L_xxzz       = -(L_xxxx + L_xxyy)
    v340         = L_xxzz*z
    L_xyzz       = -(L_xxxy + L_xyyy)
    v445         = L_xyzz*z
    L_xzzz       = -(L_xxxz + L_xyyz)
    L_yyzz       = -(L_xxyy + L_yyyy)
    v546         = L_yyzz*z
    L_yzzz       = -(L_xxyz + L_yyyz)
    L_zzzz       = -(L_xxzz + L_yyzz)
    L_xxxzz      = -(L_xxxxx + L_xxxyy)
    v227         = L_xxxzz*z
    L_xxyzz      = -(L_xxxxy + L_xxyyy)
    v304         = L_xxyzz*z
    L_xxzzz      = -(L_xxxxz + L_xxyyz)
    L_xyyzz      = -(L_xxxyy + L_xyyyy)
    v419         = L_xyyzz*z
    L_xyzzz      = -(L_xxxyz + L_xyyyz)
    L_xzzzz      = -(L_xxxzz + L_xyyzz)
    L_yyyzz      = -(L_xxyyy + L_yyyyy)
    v531         = L_yyyzz*z
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
    v397         = L_xyyyzz*z
    L_xyyzzz     = -(L_xxxyyz + L_xyyyyz)
    L_xyzzzz     = -(L_xxxyzz + L_xyyyzz)
    L_xzzzzz     = -(L_xxxzzz + L_xyyzzz)
    L_yyyyzz     = -(L_xxyyyy + L_yyyyyy)
    v518         = L_yyyyzz*z
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
    v379         = L_xyyyyzz*z
    L_xyyyzzz    = -(L_xxxyyyz + L_xyyyyyz)
    L_xyyzzzz    = -(L_xxxyyzz + L_xyyyyzz)
    L_xyzzzzz    = -(L_xxxyzzz + L_xyyyzzz)
    L_xzzzzzz    = -(L_xxxzzzz + L_xyyzzzz)
    L_yyyyyzz    = -(L_xxyyyyy + L_yyyyyyy)
    v507         = L_yyyyyzz*z
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
    v366         = L_xyyyyyzz*z
    L_xyyyyzzz   = -(L_xxxyyyyz + L_xyyyyyyz)
    L_xyyyzzzz   = -(L_xxxyyyzz + L_xyyyyyzz)
    L_xyyzzzzz   = -(L_xxxyyzzz + L_xyyyyzzz)
    L_xyzzzzzz   = -(L_xxxyzzzz + L_xyyyzzzz)
    L_xzzzzzzz   = -(L_xxxzzzzz + L_xyyzzzzz)
    L_yyyyyyzz   = -(L_xxyyyyyy + L_yyyyyyyy)
    v499         = L_yyyyyyzz*z
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
    v357         = L_xyyyyyyz + L_xyyyyyyzz*z
    v358         = L_xyyyyyyyz*y + v357
    v369         = v357*y
    Ls_xyyyyyyz  = L_xxyyyyyyz*x + v358
    L_xyyyyyzzz  = -(L_xxxyyyyyz + L_xyyyyyyyz)
    L_xyyyyzzzz  = -(L_xxxyyyyzz + L_xyyyyyyzz)
    L_xyyyzzzzz  = -(L_xxxyyyzzz + L_xyyyyyzzz)
    L_xyyzzzzzz  = -(L_xxxyyzzzz + L_xyyyyzzzz)
    L_xyzzzzzzz  = -(L_xxxyzzzzz + L_xyyyzzzzz)
    L_xzzzzzzzz  = -(L_xxxzzzzzz + L_xyyzzzzzz)
    L_yyyyyyyzz  = -(L_xxyyyyyyy + L_yyyyyyyyy)
    v494         = L_yyyyyyyz + L_yyyyyyyzz*z
    Ls_yyyyyyyz  = v494 + L_xyyyyyyyz*x + L_yyyyyyyyz*y
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
    v336         = 0.00416666666666667d0*v17
    v479         = 0.000694444444444444d0*v17
    a3           = a1*a2
    v32          = a3
    v33          = 0.166666666666667d0*v32
    v137         = 0.0833333333333333d0*v32
    v222         = 0.0277777777777778d0*v32
    v335         = 0.00694444444444444d0*v32
    v478         = 0.00138888888888889d0*v32
    a4           = a2*a2
    v66          = a4
    v67          = 0.0416666666666667d0*v66
    v219         = 0.0208333333333333d0*v66
    v334         = 0.00694444444444444d0*v66
    v477         = 0.00173611111111111d0*v66
    a5           = a2*a3
    v123         = a5
    v124         = 0.00833333333333333d0*v123
    v330         = 0.00416666666666667d0*v123
    v476         = 0.00138888888888889d0*v123
    a6           = a3*a3
    v205         = a6
    v206         = 0.00138888888888889d0*v205
    v471         = 0.000694444444444444d0*v205
    a7           = a3*a4
    v316         = 0.000198412698412698d0*a7
    a8           = a4*a4
    v458         = 2.48015873015873d-5*a8
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
    v354         = L_xyyyyyyyy*v19
    v367         = L_xyyyyyyyz*v19
    v473         = 0.000694444444444444d0*v19
    v503         = 0.25d0*v19
    v513         = 0.0833333333333333d0*v19
    v525         = 0.0208333333333333d0*v19
    v539         = 0.00416666666666667d0*v19
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
    v360         = L_xyyyyyyyy*v34
    v380         = L_xyyyyyyyz*v34
    v472         = 0.00138888888888889d0*v34
    v512         = 0.0833333333333333d0*v34
    v524         = 0.0277777777777778d0*v34
    v538         = 0.00694444444444444d0*v34
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
    v371         = L_xyyyyyyyy*v68
    v398         = L_xyyyyyyyz*v68
    v470         = 0.00173611111111111d0*v68
    v523         = 0.0208333333333333d0*v68
    v537         = 0.00694444444444444d0*v68
    b5           = b2*b3
    v125         = b5
    v126         = L_xxxxyyyyy*v125
    v185         = L_xxxyyyyyy*v125
    v215         = 0.00833333333333333d0*v125
    v228         = L_xxxyyyyyz*v125
    v272         = L_xxyyyyyyy*v125
    v305         = L_xxyyyyyyz*v125
    v338         = 6.0d0*v125
    v387         = L_xyyyyyyyy*v125
    v420         = L_xyyyyyyyz*v125
    v469         = 0.00138888888888889d0*v125
    v536         = 0.00416666666666667d0*v125
    b6           = b3*b3
    v207         = b6
    v208         = L_xxxyyyyyy*v207
    v292         = L_xxyyyyyyy*v207
    v326         = 0.00138888888888889d0*v207
    v341         = L_xxyyyyyyz*v207
    v407         = L_xyyyyyyyy*v207
    v446         = L_xyyyyyyyz*v207
    v468         = 0.000694444444444444d0*v207
    v481         = 7.0d0*v207
    b7           = b3*b4
    v317         = b7
    v318         = L_xxyyyyyyy*v317
    v431         = L_xyyyyyyyy*v317
    v467         = 0.000198412698412698d0*v317
    v483         = L_xyyyyyyyz*v317
    b8           = b4*b4
    v459         = 2.48015873015873d-5*b8
    b9           = b4*b5
    c2           = c1*c1
    v21          = c2
    v460         = 0.5d0*v21
    v505         = 3.0d0*v21
    v515         = 12.0d0*v21
    v527         = 60.0d0*v21
    v541         = 360.0d0*v21
    v549         = 2520.0d0*v21
    v319         = L_xxzz*v21
    v432         = L_xyzz*v21
    v209         = L_xxxzz*v21
    v293         = L_xxyzz*v21
    v342         = L_xxzzz*v21
    v408         = L_xyyzz*v21
    v447         = L_xyzzz*v21
    v127         = L_xxxxzz*v21
    v186         = L_xxxyzz*v21
    v229         = L_xxxzzz*v21
    v273         = L_xxyyzz*v21
    v306         = L_xxyzzz*v21
    v388         = L_xyyyzz*v21
    v421         = L_xyyzzz*v21
    v70          = L_xxxxxzz*v21
    v108         = L_xxxxyzz*v21
    v144         = L_xxxxzzz*v21
    v170         = L_xxxyyzz*v21
    v197         = L_xxxyzzz*v21
    v257         = L_xxyyyzz*v21
    v284         = L_xxyyzzz*v21
    v372         = L_xyyyyzz*v21
    v399         = L_xyyyzzz*v21
    v36          = L_xxxxxxzz*v21
    v56          = L_xxxxxyzz*v21
    v84          = L_xxxxxzzz*v21
    v97          = L_xxxxyyzz*v21
    v117         = L_xxxxyzzz*v21
    v159         = L_xxxyyyzz*v21
    v179         = L_xxxyyzzz*v21
    v246         = L_xxyyyyzz*v21
    v266         = L_xxyyyzzz*v21
    v361         = L_xyyyyyzz*v21
    v381         = L_xyyyyzzz*v21
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
    v327         = v125*v248
    v365         = 2.0d0*v241 + v239 + v248
    Ls_xxyyyyy   = 0.5d0*(v239 + v240) + L_xxxxyyyyy*v18 + L_xxyyyyy + v10*x + v238 + v241
    v253         = L_xxyyyyzzz*v21
    v268         = v253 + 2.0d0*(L_xxyyyyz + v251)
    v269         = v268*y
    v287         = v19*v268
    v310         = v268*v34
    v347         = v268*v68
    v385         = 2.0d0*v254 + v252 + v268
    Ls_xxyyyyz   = 0.5d0*(v252 + v253) + L_xxxxyyyyz*v18 + L_xxyyyyz + v156*x + v251 + v254
    v355         = L_xyyyyyyzz*v21
    v363         = v355 + 2.0d0*(L_xyyyyyy + v353)
    v364         = v363*y
    v375         = v19*v363
    v392         = v34*v363
    v413         = v363*v68
    v438         = v125*v363
    Ls_xyyyyyy   = 0.5d0*(v354 + v355) + L_xxxyyyyyy*v18 + L_xyyyyyy + v12*x + v353 + v356
    v368         = L_xyyyyyzzz*v21
    v383         = v368 + 2.0d0*(L_xyyyyyz + v366)
    v384         = v383*y
    v402         = v19*v383
    v425         = v34*v383
    v452         = v383*v68
    v485         = v125*v383
    Ls_xyyyyyz   = 0.5d0*(v367 + v368) + L_xxxyyyyyz*v18 + L_xyyyyyz + v243*x + v366 + v369
    v493         = L_yyyyyyyzz*v21
    v498         = v493 + 2.0d0*(L_yyyyyyy + v492)
    Ls_yyyyyyy   = 0.5d0*v493 + L_xxyyyyyyy*v18 + L_yyyyyyy + L_yyyyyyyyy*v39 + v14*x + v15 &
      *y + v492
    v500         = L_yyyyyyzzz*v21
    v509         = v500 + 2.0d0*(L_yyyyyyz + v499)
    Ls_yyyyyyz   = 0.5d0*v500 + L_xxyyyyyyz*v18 + L_yyyyyyyyz*v39 + L_yyyyyyz + v358*x + &
      v494*y + v499
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
    v461         = 0.166666666666667d0*v37
    v516         = 4.0d0*v37
    v528         = 20.0d0*v37
    v542         = 120.0d0*v37
    v550         = 840.0d0*v37
    v320         = L_xxzzz*v37
    v433         = L_xyzzz*v37
    v210         = L_xxxzzz*v37
    v294         = L_xxyzzz*v37
    v343         = L_xxzzzz*v37
    v409         = L_xyyzzz*v37
    v448         = L_xyzzzz*v37
    v128         = L_xxxxzzz*v37
    v187         = L_xxxyzzz*v37
    v230         = L_xxxzzzz*v37
    v274         = L_xxyyzzz*v37
    v307         = L_xxyzzzz*v37
    v389         = L_xyyyzzz*v37
    v422         = L_xyyzzzz*v37
    v71          = L_xxxxxzzz*v37
    v109         = L_xxxxyzzz*v37
    v145         = L_xxxxzzzz*v37
    v171         = L_xxxyyzzz*v37
    v198         = L_xxxyzzzz*v37
    v258         = L_xxyyyzzz*v37
    v285         = L_xxyyzzzz*v37
    v373         = L_xyyyyzzz*v37
    v400         = L_xyyyzzzz*v37
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
    v328         = v261*v68
    v378         = v245 + v261 + v11*v80 + 3.0d0*v249
    Ls_xxyyyy    = 0.166666666666667d0*(v245 + v247 + 3.0d0*(v246 + v249)) + L_xxxxxyyyy* &
      v33 + L_xxyyyy + v11*v39 + v18*v8 + v244 + v250*v42
    v267         = L_xxyyyzzzz*v37
    v288         = v267 + 3.0d0*(2.0d0*L_xxyyyz + 2.0d0*v264 + v266)
    v289         = v288*y
    v311         = v19*v288
    v348         = v288*v34
    v405         = v265 + v288 + v242*v80 + 3.0d0*v269
    Ls_xxyyyz    = 0.166666666666667d0*(v265 + v267 + 3.0d0*(v266 + v269)) + L_xxxxxyyyz* &
      v33 + L_xxyyyz + v18*v94 + v242*v39 + v264 + v270*v42
    v362         = L_xyyyyyzzz*v37
    v376         = v362 + 3.0d0*(2.0d0*L_xyyyyy + 2.0d0*v359 + v361)
    v377         = v376*y
    v393         = v19*v376
    v414         = v34*v376
    v439         = v376*v68
    Ls_xyyyyy    = 0.166666666666667d0*(v360 + v362 + 3.0d0*(v361 + v364)) + L_xxxxyyyyy* &
      v33 + L_xyyyyy + v10*v18 + v13*v39 + v359 + v365*v42
    v382         = L_xyyyyzzzz*v37
    v403         = v382 + 3.0d0*(2.0d0*L_xyyyyz + 2.0d0*v379 + v381)
    v404         = v403*y
    v426         = v19*v403
    v453         = v34*v403
    v486         = v403*v68
    Ls_xyyyyz    = 0.166666666666667d0*(v380 + v382 + 3.0d0*(v381 + v384)) + L_xxxxyyyyz* &
      v33 + L_xyyyyz + v156*v18 + v357*v39 + v379 + v385*v42
    v496         = L_yyyyyyzzz*v37
    v506         = v496 + L_yyyyyyzz*v505 + 6.0d0*(L_yyyyyy + v495)
    Ls_yyyyyy    = 0.166666666666667d0*v496 + L_xxxyyyyyy*v33 + L_yyyyyy + L_yyyyyyyyy*v74 &
      + L_yyyyyyzz*v460 + v12*v18 + v15*v39 + v42*(v354 + 2.0d0*v356 + &
      v363) + v495 + v497*v498
    v508         = L_yyyyyzzzz*v37
    v520         = v508 + L_yyyyyzzz*v505 + 6.0d0*(L_yyyyyz + v507)
    Ls_yyyyyz    = 0.166666666666667d0*v508 + L_xxxyyyyyz*v33 + L_yyyyyyyyz*v74 + L_yyyyyz &
      + L_yyyyyzzz*v460 + v18*v243 + v39*v494 + v42*(v367 + 2.0d0*v369 &
      + v383) + v497*v509 + v507
    c4           = c2*c2
    v72          = c4
    v462         = 0.0416666666666667d0*v72
    v529         = 5.0d0*v72
    v543         = 30.0d0*v72
    v551         = 210.0d0*v72
    v321         = L_xxzzzz*v72
    v434         = L_xyzzzz*v72
    v211         = L_xxxzzzz*v72
    v295         = L_xxyzzzz*v72
    v344         = L_xxzzzzz*v72
    v410         = L_xyyzzzz*v72
    v449         = L_xyzzzzz*v72
    v129         = L_xxxxzzzz*v72
    v188         = L_xxxyzzzz*v72
    v231         = L_xxxzzzzz*v72
    v275         = L_xxyyzzzz*v72
    v308         = L_xxyzzzzz*v72
    v390         = L_xyyyzzzz*v72
    v423         = L_xyyzzzzz*v72
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
    v329         = v279*v34
    v396         = v256 + v279 + v11*v140 + 6.0d0*v260 + 4.0d0*v262
    Ls_xxyyy     = 0.0416666666666667d0*(v256 + 12.0d0*v257 + v259 + 6.0d0*v260 + 4.0d0*( &
      v258 + v262)) + L_xxxxxxyyy*v67 + L_xxyyy + v11*v74 + v163*v78 + &
      v255 + v263*v79 + v33*v6
    v286         = L_xxyyzzzzz*v72
    v312         = v286 + 12.0d0*v284 + 4.0d0*(6.0d0*L_xxyyz + 6.0d0*v282 + v285)
    v313         = v312*y
    v349         = v19*v312
    v429         = v283 + v312 + v140*v242 + 6.0d0*v287 + 4.0d0*v289
    Ls_xxyyz     = 0.0416666666666667d0*(v283 + 12.0d0*v284 + v286 + 6.0d0*v287 + 4.0d0*( &
      v285 + v289)) + L_xxxxxxyyz*v67 + L_xxyyz + v183*v78 + v242*v74 + &
      v282 + v290*v79 + v33*v53
    v374         = L_xyyyyzzzz*v72
    v394         = v374 + 12.0d0*v372 + 4.0d0*(6.0d0*L_xyyyy + 6.0d0*v370 + v373)
    v395         = v394*y
    v415         = v19*v394
    v440         = v34*v394
    Ls_xyyyy     = 0.0416666666666667d0*(v371 + 12.0d0*v372 + v374 + 6.0d0*v375 + 4.0d0*( &
      v373 + v377)) + L_xxxxxyyyy*v67 + L_xyyyy + v13*v74 + v250*v78 + &
      v33*v8 + v370 + v378*v79
    v401         = L_xyyyzzzzz*v72
    v427         = v401 + 12.0d0*v399 + 4.0d0*(6.0d0*L_xyyyz + 6.0d0*v397 + v400)
    v428         = v427*y
    v454         = v19*v427
    v487         = v34*v427
    Ls_xyyyz     = 0.0416666666666667d0*(v398 + 12.0d0*v399 + v401 + 6.0d0*v402 + 4.0d0*( &
      v400 + v404)) + L_xxxxxyyyz*v67 + L_xyyyz + v270*v78 + v33*v94 + &
      v357*v74 + v397 + v405*v79
    v502         = L_yyyyyzzzz*v72
    v517         = v502 + L_yyyyyzz*v515 + L_yyyyyzzz*v516 + 24.0d0*(L_yyyyy + v501)
    Ls_yyyyy     = 0.0416666666666667d0*v502 + L_xxxxyyyyy*v67 + L_yyyyy + L_yyyyyyyyy*v132 &
      + L_yyyyyzz*v460 + L_yyyyyzzz*v461 + v10*v33 + v15*v74 + v365*v78 &
      + v498*v503 + v501 + v504*v506 + v79*(v13*v80 + v360 + 3.0d0*v364 &
      + v376)
    v519         = L_yyyyzzzzz*v72
    v533         = v519 + L_yyyyzzz*v515 + L_yyyyzzzz*v516 + 24.0d0*(L_yyyyz + v518)
    Ls_yyyyz     = 0.0416666666666667d0*v519 + L_xxxxyyyyz*v67 + L_yyyyyyyyz*v132 + L_yyyyz &
      + L_yyyyzzz*v460 + L_yyyyzzzz*v461 + v156*v33 + v385*v78 + v494* &
      v74 + v503*v509 + v504*v520 + v518 + v79*(v357*v80 + v380 + 3.0d0 &
      *v384 + v403)
    c5           = c2*c3
    v130         = c5
    v463         = 0.00833333333333333d0*v130
    v544         = 6.0d0*v130
    v552         = 42.0d0*v130
    v322         = L_xxzzzzz*v130
    v435         = L_xyzzzzz*v130
    v212         = L_xxxzzzzz*v130
    v296         = L_xxyzzzzz*v130
    v345         = L_xxzzzzzz*v130
    v411         = L_xyyzzzzz*v130
    v450         = L_xyzzzzzz*v130
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
    v352         = v228 + v232 + v155*v225 + 60.0d0*v229 + 20.0d0*v230 + 120.0d0*(L_xxxz + &
      v227) + 5.0d0*(v231 + v236) + 10.0d0*(v233 + v234)
    Ls_xxxz      = 0.00833333333333333d0*(v228 + 60.0d0*v229 + 20.0d0*v230 + v232 + 5.0d0*( &
      v231 + v236) + 10.0d0*(v233 + v234)) + L_xxxxxxxxz*v124 + L_xxxz &
      + v132*v155 + v137*v88 + v138*v150 + v139*v237 + v227 + v24*v67
    v276         = L_xxyyzzzzz*v130
    v301         = v276 + 60.0d0*v273 + 20.0d0*v274 + 5.0d0*(24.0d0*L_xxyy + 24.0d0*v271 + &
      v275)
    v302         = v301*y
    v331         = v19*v301
    v418         = v272 + v301 + v11*v225 + 5.0d0*v280 + 10.0d0*(v277 + v278)
    Ls_xxyy      = 0.00833333333333333d0*(v272 + 60.0d0*v273 + 20.0d0*v274 + v276 + 5.0d0*( &
      v275 + v280) + 10.0d0*(v277 + v278)) + L_xxxxxxxyy*v124 + L_xxyy &
      + v101*v137 + v11*v132 + v138*v176 + v139*v281 + v271 + v4*v67
    v309         = L_xxyzzzzzz*v130
    v350         = v309 + 60.0d0*v306 + 20.0d0*v307 + 5.0d0*(24.0d0*L_xxyz + 24.0d0*v304 + &
      v308)
    v351         = v350*y
    v457         = v305 + v350 + v225*v242 + 5.0d0*v313 + 10.0d0*(v310 + v311)
    Ls_xxyz      = 0.00833333333333333d0*(v305 + 60.0d0*v306 + 20.0d0*v307 + v309 + 5.0d0*( &
      v308 + v313) + 10.0d0*(v310 + v311)) + L_xxxxxxxyz*v124 + L_xxyz &
      + v121*v137 + v132*v242 + v138*v203 + v139*v314 + v30*v67 + v304
    v391         = L_xyyyzzzzz*v130
    v416         = v391 + 60.0d0*v388 + 20.0d0*v389 + 5.0d0*(24.0d0*L_xyyy + 24.0d0*v386 + &
      v390)
    v417         = v416*y
    v441         = v19*v416
    Ls_xyyy      = 0.00833333333333333d0*(v387 + 60.0d0*v388 + 20.0d0*v389 + v391 + 5.0d0*( &
      v390 + v395) + 10.0d0*(v392 + v393)) + L_xxxxxxyyy*v124 + L_xyyy &
      + v13*v132 + v137*v163 + v138*v263 + v139*v396 + v386 + v6*v67
    v424         = L_xyyzzzzzz*v130
    v455         = v424 + 60.0d0*v421 + 20.0d0*v422 + 5.0d0*(24.0d0*L_xyyz + 24.0d0*v419 + &
      v423)
    v456         = v455*y
    v488         = v19*v455
    Ls_xyyz      = 0.00833333333333333d0*(v420 + 60.0d0*v421 + 20.0d0*v422 + v424 + 5.0d0*( &
      v423 + v428) + 10.0d0*(v425 + v426)) + L_xxxxxxyyz*v124 + L_xyyz &
      + v132*v357 + v137*v183 + v138*v290 + v139*v429 + v419 + v53*v67
    v511         = L_yyyyzzzzz*v130
    v530         = v511 + L_yyyyzz*v527 + L_yyyyzzz*v528 + L_yyyyzzzz*v529 + 120.0d0*( &
      L_yyyy + v510)
    Ls_yyyy      = 0.00833333333333333d0*v511 + L_xxxxxyyyy*v124 + L_yyyy + L_yyyyyyyyy* &
      v215 + L_yyyyzz*v460 + L_yyyyzzz*v461 + L_yyyyzzzz*v462 + v132* &
      v15 + v137*v250 + v138*v378 + v139*(v13*v140 + v371 + 6.0d0*v375 &
      + 4.0d0*v377 + v394) + v498*v512 + v506*v513 + v510 + v514*v517 + &
      v67*v8
    v532         = L_yyyzzzzzz*v130
    v548         = v532 + L_yyyzzz*v527 + L_yyyzzzz*v528 + L_yyyzzzzz*v529 + 120.0d0*( &
      L_yyyz + v531)
    Ls_yyyz      = 0.00833333333333333d0*v532 + L_xxxxxyyyz*v124 + L_yyyyyyyyz*v215 + &
      L_yyyz + L_yyyzzz*v460 + L_yyyzzzz*v461 + L_yyyzzzzz*v462 + v132* &
      v494 + v137*v270 + v138*v405 + v139*(v140*v357 + v398 + 6.0d0* &
      v402 + 4.0d0*v404 + v427) + v509*v512 + v513*v520 + v514*v533 + &
      v531 + v67*v94
    c6           = c3*c3
    v213         = c6
    v464         = 0.00138888888888889d0*v213
    v553         = 7.0d0*v213
    v323         = L_xxzzzzzz*v213
    v436         = L_xyzzzzzz*v213
    v214         = L_xxxzzzzzz*v213
    v339         = v208 + v214 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 + 20.0d0*v217 + &
      v338*v9 + 720.0d0*(L_xxx + v204) + 6.0d0*(v212 + v221) + 15.0d0*( &
      v216 + v218)
    Ls_xxx       = 0.00138888888888889d0*(v208 + 360.0d0*v209 + 120.0d0*v210 + 30.0d0*v211 &
      + v214 + 20.0d0*v217 + 6.0d0*(v212 + v221) + 15.0d0*(v216 + v218 &
      )) + L_xxx + L_xxxxxxxxx*v206 + v0*v124 + v141*v223 + v204 + v215 &
      *v9 + v219*v43 + v222*v81 + v224*v226
    v297         = L_xxyzzzzzz*v213
    v332         = v297 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 + 6.0d0*(120.0d0*L_xxy &
      + 120.0d0*v291 + v296)
    v333         = v332*y
    v444         = v292 + v332 + v11*v338 + 20.0d0*v299 + 6.0d0*v302 + 15.0d0*(v298 + v300)
    Ls_xxy       = 0.00138888888888889d0*(v292 + 360.0d0*v293 + 120.0d0*v294 + 30.0d0*v295 &
      + v297 + 20.0d0*v299 + 6.0d0*(v296 + v302) + 15.0d0*(v298 + v300 &
      )) + L_xxxxxxxxy*v206 + L_xxy + v11*v215 + v114*v222 + v124*v2 + &
      v194*v223 + v219*v60 + v224*v303 + v291
    v346         = L_xxzzzzzzz*v213
    v491         = v341 + v346 + v242*v338 + 360.0d0*v342 + 120.0d0*v343 + 30.0d0*v344 + &
      20.0d0*v348 + 720.0d0*(L_xxz + v340) + 6.0d0*(v345 + v351) + &
      15.0d0*(v347 + v349)
    Ls_xxz       = 0.00138888888888889d0*(v341 + 360.0d0*v342 + 120.0d0*v343 + 30.0d0*v344 &
      + v346 + 20.0d0*v348 + 6.0d0*(v345 + v351) + 15.0d0*(v347 + v349 &
      )) + L_xxxxxxxxz*v206 + L_xxz + v124*v24 + v150*v222 + v215*v242 &
      + v219*v88 + v223*v237 + v224*v352 + v340
    v412         = L_xyyzzzzzz*v213
    v442         = v412 + 360.0d0*v408 + 120.0d0*v409 + 30.0d0*v410 + 6.0d0*(120.0d0*L_xyy &
      + 120.0d0*v406 + v411)
    v443         = v442*y
    Ls_xyy       = 0.00138888888888889d0*(v407 + 360.0d0*v408 + 120.0d0*v409 + 30.0d0*v410 &
      + v412 + 20.0d0*v414 + 6.0d0*(v411 + v417) + 15.0d0*(v413 + v415 &
      )) + L_xxxxxxxyy*v206 + L_xyy + v101*v219 + v124*v4 + v13*v215 + &
      v176*v222 + v223*v281 + v224*v418 + v406
    v451         = L_xyzzzzzzz*v213
    v489         = v451 + 360.0d0*v447 + 120.0d0*v448 + 30.0d0*v449 + 6.0d0*(120.0d0*L_xyz &
      + 120.0d0*v445 + v450)
    v490         = v489*y
    Ls_xyz       = 0.00138888888888889d0*(v446 + 360.0d0*v447 + 120.0d0*v448 + 30.0d0*v449 &
      + v451 + 20.0d0*v453 + 6.0d0*(v450 + v456) + 15.0d0*(v452 + v454 &
      )) + L_xxxxxxxyz*v206 + L_xyz + v121*v219 + v124*v30 + v203*v222 &
      + v215*v357 + v223*v314 + v224*v457 + v445
    v522         = L_yyyzzzzzz*v213
    v545         = v522 + L_yyyzz*v541 + L_yyyzzz*v542 + L_yyyzzzz*v543 + L_yyyzzzzz*v544 + &
      720.0d0*(L_yyy + v521)
    Ls_yyy       = 0.00138888888888889d0*v522 + L_xxxxxxyyy*v206 + L_yyy + L_yyyyyyyyy*v326 &
      + L_yyyzz*v460 + L_yyyzzz*v461 + L_yyyzzzz*v462 + L_yyyzzzzz*v463 &
      + v124*v6 + v15*v215 + v163*v219 + v222*v263 + v223*v396 + v224*( &
      v13*v225 + v387 + 10.0d0*v392 + 10.0d0*v393 + 5.0d0*v395 + v416) &
      + v498*v523 + v506*v524 + v517*v525 + v521 + v526*v530
    v547         = L_yyzzzzzzz*v213
    v556         = v547 + L_yyzzz*v541 + L_yyzzzz*v542 + L_yyzzzzz*v543 + L_yyzzzzzz*v544 + &
      720.0d0*(L_yyz + v546)
    Ls_yyz       = 0.00138888888888889d0*v547 + L_xxxxxxyyz*v206 + L_yyyyyyyyz*v326 + L_yyz &
      + L_yyzzz*v460 + L_yyzzzz*v461 + L_yyzzzzz*v462 + L_yyzzzzzz*v463 &
      + v124*v53 + v183*v219 + v215*v494 + v222*v290 + v223*v429 + v224 &
      *(v225*v357 + v420 + 10.0d0*v425 + 10.0d0*v426 + 5.0d0*v428 + &
      v455) + v509*v523 + v520*v524 + v525*v533 + v526*v548 + v546
    c7           = c3*c4
    v324         = c7
    v465         = 0.000198412698412698d0*v324
    v325         = L_xxzzzzzzz*v324
    Ls_xx        = 0.000198412698412698d0*(v318 + 2520.0d0*v319 + 840.0d0*v320 + 210.0d0* &
      v321 + 42.0d0*v322 + v325 + 7.0d0*(v323 + v333) + 21.0d0*(v327 + &
      v331) + 35.0d0*(v328 + v329)) + L_xx + L_xxxxxxxxx*v316 + v0*v206 &
      + v11*v326 + v141*v335 + v226*v336 + v315 + v330*v43 + v334*v81 + &
      v337*v339
    v437         = L_xyzzzzzzz*v324
    v475         = v437 + 2520.0d0*v432 + 840.0d0*v433 + 210.0d0*v434 + 42.0d0*v435 + 7.0d0 &
      *(720.0d0*L_xy + 720.0d0*v430 + v436)
    Ls_xy        = 0.000198412698412698d0*(v431 + 2520.0d0*v432 + 840.0d0*v433 + 210.0d0* &
      v434 + 42.0d0*v435 + v437 + 7.0d0*(v436 + v443) + 21.0d0*(v438 + &
      v441) + 35.0d0*(v439 + v440)) + L_xxxxxxxxy*v316 + L_xy + v114* &
      v334 + v13*v326 + v194*v335 + v2*v206 + v303*v336 + v330*v60 + &
      v337*v444 + v430
    v484         = L_xzzzzzzzz*v324
    Ls_xz        = 0.000198412698412698d0*(v483 + v484 + 7.0d0*v490 + 21.0d0*(v485 + v488) &
      + 35.0d0*(v486 + v487)) + L_xxxxxxxxz*v316 + L_xz + L_xzzz*v460 + &
      L_xzzzz*v461 + L_xzzzzz*v462 + L_xzzzzzz*v463 + L_xzzzzzzz*v464 + &
      v150*v334 + v206*v24 + v237*v335 + v326*v357 + v330*v88 + v336* &
      v352 + v337*v491 + v482
    v535         = L_yyzzzzzzz*v324
    Ls_yy        = 0.000198412698412698d0*v535 + L_xxxxxxxyy*v316 + L_yy + L_yyyyyyyyy*v467 &
      + L_yyzz*v460 + L_yyzzz*v461 + L_yyzzzz*v462 + L_yyzzzzz*v463 + &
      L_yyzzzzzz*v464 + v101*v330 + v15*v326 + v176*v334 + v206*v4 + &
      v281*v335 + v336*v418 + v337*(v13*v338 + v407 + 15.0d0*v413 + &
      20.0d0*v414 + 15.0d0*v415 + 6.0d0*v417 + v442) + v498*v536 + v506 &
      *v537 + v517*v538 + v530*v539 + v534 + v540*v545
    v555         = L_yzzzzzzzz*v324
    Ls_yz        = 0.000198412698412698d0*v555 + L_xxxxxxxyz*v316 + L_yyyyyyyyz*v467 + L_yz &
      + L_yzzz*v460 + L_yzzzz*v461 + L_yzzzzz*v462 + L_yzzzzzz*v463 + &
      L_yzzzzzzz*v464 + v121*v330 + v203*v334 + v206*v30 + v314*v335 + &
      v326*v494 + v336*v457 + v337*(v338*v357 + v446 + 15.0d0*v452 + &
      20.0d0*v453 + 15.0d0*v454 + 6.0d0*v456 + v489) + v509*v536 + v520 &
      *v537 + v533*v538 + v539*v548 + v540*v556 + v554
    c8           = c4*c4
    v466         = 2.48015873015873d-5*c8
    Ls_x         = L_x + L_xxxxxxxxx*v458 + L_xyyyyyyyy*v459 + L_xz*z + L_xzz*v460 + L_xzzz &
      *v461 + L_xzzzz*v462 + L_xzzzzz*v463 + L_xzzzzzz*v464 + &
      L_xzzzzzzz*v465 + L_xzzzzzzzz*v466 + v0*v316 + v13*v467 + v141* &
      v477 + v226*v478 + v339*v479 + v363*v468 + v376*v469 + v394*v470 &
      + v416*v472 + v43*v471 + v442*v473 + v474*v475 + v476*v81 + v480* &
      (5040.0d0*L_xx + v11*v481 + 5040.0d0*v315 + v318 + 2520.0d0*v319 &
      + 840.0d0*v320 + 210.0d0*v321 + 42.0d0*v322 + 7.0d0*v323 + v325 + &
      21.0d0*v327 + 35.0d0*v328 + 35.0d0*v329 + 21.0d0*v331 + 7.0d0* &
      v333)
    Ls_y         = L_y + L_xxxxxxxxy*v458 + L_yyyyyyyyy*v459 + L_yz*z + L_yzz*v460 + L_yzzz &
      *v461 + L_yzzzz*v462 + L_yzzzzz*v463 + L_yzzzzzz*v464 + &
      L_yzzzzzzz*v465 + L_yzzzzzzzz*v466 + v114*v476 + v15*v467 + v194* &
      v477 + v2*v316 + v303*v478 + v444*v479 + v468*v498 + v469*v506 + &
      v470*v517 + v471*v60 + v472*v530 + v473*v545 + v474*(5040.0d0* &
      L_yy + L_yyzz*v549 + L_yyzzz*v550 + L_yyzzzz*v551 + L_yyzzzzz* &
      v552 + L_yyzzzzzz*v553 + 5040.0d0*v534 + v535) + v480*(v13*v481 + &
      v431 + 21.0d0*v438 + 35.0d0*v439 + 35.0d0*v440 + 21.0d0*v441 + &
      7.0d0*v443 + v475)
    Ls_z         = L_z + L_xxxxxxxxz*v458 + L_yyyyyyyyz*v459 + L_zz*z + L_zzz*v460 + L_zzzz &
      *v461 + L_zzzzz*v462 + L_zzzzzz*v463 + L_zzzzzzz*v464 + &
      L_zzzzzzzz*v465 + L_zzzzzzzzz*v466 + v150*v476 + v237*v477 + v24* &
      v316 + v352*v478 + v467*v494 + v468*v509 + v469*v520 + v470*v533 &
      + v471*v88 + v472*v548 + v473*v556 + v474*(5040.0d0*L_yz + L_yzzz &
      *v549 + L_yzzzz*v550 + L_yzzzzz*v551 + L_yzzzzzz*v552 + &
      L_yzzzzzzz*v553 + 5040.0d0*v554 + v555) + v479*v491 + v480*( &
      5040.0d0*L_xz + L_xzzz*v549 + L_xzzzz*v550 + L_xzzzzz*v551 + &
      L_xzzzzzz*v552 + L_xzzzzzzz*v553 + v357*v481 + 5040.0d0*v482 + &
      v483 + v484 + 21.0d0*v485 + 35.0d0*v486 + 35.0d0*v487 + 21.0d0* &
      v488 + 7.0d0*v490)
    call unpack2_add(MOM_ES_L_LEN, L1s,L2s,Ls)
#undef  y                   
#undef  L_x                 
#undef  x                   
#undef  z                   
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
#undef  Ls_xxxxxxxx         
#undef  L_xxxxxxxx          
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
#undef  Ls_xxxxxxxxx        
#undef  L_xxxxxxxxx         
#undef  Ls_xxxxxxxxy        
#undef  L_xxxxxxxxy         
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
#undef  L_xxyyyyyyy         
#undef  Ls_xxyyyyyyy        
#undef  L_xxyyyyyyz         
#undef  Ls_xxyyyyyyz        
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
